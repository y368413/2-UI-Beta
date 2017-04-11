-- Fix error when shift-clicking header rows in the tradeskill UI.-- This is caused by the TradeSkillRowButtonTemplate's OnClick script-- failing to account for some rows being headers. Fix by ignoring-- modifiers when clicking header rows.-- New in 7.0
do
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self, event, name)
		if name == "Blizzard_TradeSkillUI" then
			local old_OnClick = TradeSkillFrame.RecipeList.buttons[1]:GetScript("OnClick")
			local new_OnClick = function(self, button)
				if IsModifiedClick() and self.isHeader then
					return self:GetParent():GetParent():OnHeaderButtonClicked(self, self.tradeSkillInfo, button)
				end
				old_OnClick(self, button)
			end
			for i = 1, #TradeSkillFrame.RecipeList.buttons do
				TradeSkillFrame.RecipeList.buttons[i]:SetScript("OnClick", new_OnClick)
			end
			self:UnregisterAllEvents()
		end
	end)
end

-- Fix error when mousing over the Nameplate Motion Type dropdown in-- Interface Options > Names panel if the current setting isn't listed.-- Happens if the user had previously selected the Spreading Nameplates-- option, which was removed from the game in 7.0.
do
	local OnEnter = InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown:GetScript("OnEnter")
	InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown:SetScript("OnEnter", function(self)
		if self.tooltip then
			OnEnter(self)
		end
	end)
end

-- Fix a lua error when scrolling the in-game Addon list, where the mouse
-- passes over a world object that activates GameTooltip.
-- Caused because the FrameXML code erroneously assumes it exclusively owns the GameTooltip object
-- Confirmed still bugged in 7.0.3.22293
do
	local orig = AddonTooltip_Update
	_G.AddonTooltip_Update = function(owner, ...) 
		if AddonList and AddonList:IsMouseOver() then
			local id = owner and owner.GetID and owner:GetID()
			if id and id > 0 and id <= GetNumAddOns() then
				orig(owner, ...) 
				return
			end
		end
		--print("ADDON LIST FIX ACTIVATED") 
	end
end

----------------------------------------------------------------------------------------
--	Fix WorldMapZoom
----------------------------------------------------------------------------------------
local f = CreateFrame ("frame", "FixWorldMapZoomFrame", UIParent)
f:RegisterEvent ("ADDON_LOADED")

local GetCursorPosition = GetCursorPosition
local hooksecurefunc = hooksecurefunc
local GetCurrentMapContinent = GetCurrentMapContinent

f:SetScript ("OnEvent", function (self, event)

	if event == "ADDON_LOADED" then
	
		WorldMapScrollFrame:HookScript ("OnMouseWheel", function()
			
			local HScroll = WorldMapScrollFrame:GetHorizontalScroll()
			local VScroll = WorldMapScrollFrame:GetVerticalScroll()

			if (MantainWorldMapZoomH ~= HScroll or MantainWorldMapZoomV ~= VScroll) then
				MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY = GetCursorPosition()
			end
			MantainWorldMapZoomH = HScroll
			MantainWorldMapZoomV = VScroll
			MantainWorldMapZoomScale = WorldMapDetailFrame:GetScale();
		end)
		
		local MAX_ZOOM = 1.4950;
		
		hooksecurefunc ("ToggleWorldMap", function()

			if (InCombatLockdown() or UnitAffectingCombat ("player")) then
				return
			end
		
			if (WorldMapFrame:IsShown()) then
			
				if ((MantainWorldMapZoomV and MantainWorldMapZoomH) and (MantainWorldMapZoomH ~= 0 or MantainWorldMapZoomV ~= 0)) then

					local last_opened = MantainWorldMapZoomLastOpened or time()
					MantainWorldMapZoomLastOpened = time()
					
					if (last_opened+120 < time()) then
						WorldMapScrollFrame_ResetZoom()
						MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY = nil, nil
						MantainWorldMapZoomH = nil
						MantainWorldMapZoomV = nil
						MantainWorldMapZoomScale = nil
						return
					end
				
					local scrollFrame = WorldMapScrollFrame;
					local oldScrollH = MantainWorldMapZoomH
					local oldScrollV = MantainWorldMapZoomV
					
					-- get the mouse position on the frame, with 0,0 at top left
					local cursorX, cursorY = MantainWorldMapZoomMouseX, MantainWorldMapZoomMouseY
					local relativeFrame;
					if ( WorldMapFrame_InWindowedMode() ) then
						relativeFrame = UIParent;
					else
						relativeFrame = WorldMapFrame;
					end
					local frameX = cursorX / relativeFrame:GetScale() - scrollFrame:GetLeft();
					local frameY = scrollFrame:GetTop() - cursorY / relativeFrame:GetScale();
					
					local oldScale = WorldMapDetailFrame:GetScale();
					--local newScale = oldScale + delta * 0.3;
					local newScale = MantainWorldMapZoomScale
					newScale = max(WORLDMAP_SETTINGS.size, newScale); 
					newScale = min(MAX_ZOOM, newScale);
					WorldMapDetailFrame:SetScale(newScale);
					QUEST_POI_FRAME_WIDTH = WorldMapDetailFrame:GetWidth() * newScale;
					QUEST_POI_FRAME_HEIGHT = WorldMapDetailFrame:GetHeight() * newScale;

					scrollFrame.maxX = QUEST_POI_FRAME_WIDTH - 1002 * WORLDMAP_SETTINGS.size;
					scrollFrame.maxY = QUEST_POI_FRAME_HEIGHT - 668 * WORLDMAP_SETTINGS.size;
					scrollFrame.zoomedIn = abs(WorldMapDetailFrame:GetScale() - WORLDMAP_SETTINGS.size) > 0.05;
					scrollFrame.continent = GetCurrentMapContinent();
					scrollFrame.mapID = GetCurrentMapAreaID();

					-- figure out new scroll values
					local scaleChange = newScale / oldScale;
					local newScrollH = scaleChange * ( frameX + oldScrollH ) - frameX;
					local newScrollV = scaleChange * ( frameY + oldScrollV ) - frameY;
					-- clamp scroll values
					newScrollH = min(newScrollH, scrollFrame.maxX);
					newScrollH = max(0, newScrollH);
					newScrollV = min(newScrollV, scrollFrame.maxY);
					newScrollV = max(0, newScrollV);
					
					-- set scroll values
					if (not InCombatLockdown() and not UnitAffectingCombat ("player")) then
						scrollFrame:SetHorizontalScroll(oldScrollH);
						scrollFrame:SetVerticalScroll(oldScrollV);
	
						WorldMapFrame_Update();
						WorldMapBlobFrame_DelayedUpdateBlobs();
						
						WorldMapFrame_CalculateHitTranslations (WorldMapBlobFrame)

						WorldMapScrollFrame_OnMouseWheel (WorldMapScrollFrame, 1)
						WorldMapScrollFrame_ReanchorQuestPOIs();
					end
					
				end
			else
				MantainWorldMapZoomLastOpened = time()
			end
		end)
	end
end)


----------------------------------------------------------------------------------------
--	Fix SearchLFGLeave() taint
----------------------------------------------------------------------------------------
local TaintFix = CreateFrame("Frame")
TaintFix:SetScript("OnUpdate", function(self, elapsed)
	if LFRBrowseFrame.timeToClear then
		LFRBrowseFrame.timeToClear = nil
	end
end)

----------------------------------------------------------------------------------------
--	Collect garbage
----------------------------------------------------------------------------------------
local eventcount = 0
local Garbage = CreateFrame("Frame")
Garbage:RegisterAllEvents()
Garbage:SetScript("OnEvent", function(self, event)
	eventcount = eventcount + 1

	if (InCombatLockdown() and eventcount > 25000) or (not InCombatLockdown() and eventcount > 10000) or event == "PLAYER_ENTERING_WORLD" then
		collectgarbage("collect")
		eventcount = 0
	end
end)