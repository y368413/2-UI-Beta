local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Maps")

function module:OnLogin()
	local WorldMapDetailFrame, WorldMapTitleButton, WorldMapFrame, WorldMapFrameTutorialButton = _G.WorldMapDetailFrame, _G.WorldMapTitleButton, _G.WorldMapFrame, _G.WorldMapFrameTutorialButton
	local GetEffectiveScale, GetCursorPosition, GetPlayerMapPosition, hooksecurefunc = _G.GetEffectiveScale, _G.GetCursorPosition, _G.GetPlayerMapPosition, _G.hooksecurefunc
	local formattext = I.MyColor..": %.1f, %.1f"

	-- Default Settings
	SetCVar("lockedWorldMap", 0)
	WorldMapFrameTutorialButton:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -12, -12)
	WorldMapFrame:SetScale(MaoRUISettingDB["Map"]["MapScale"])
	hooksecurefunc("WorldMap_ToggleSizeUp", function() if InCombatLockdown() then return end WorldMapFrame:SetScale(1) end)
	hooksecurefunc("WorldMap_ToggleSizeDown", function() if InCombatLockdown() then return end WorldMapFrame:SetScale(MaoRUISettingDB["Map"]["MapScale"]) end)

	-- Generate Coords
	if not MaoRUISettingDB["Map"]["Coord"] then return end
	local player = M.CreateFS(WorldMapFrame.UIElementsFrame, 14, "", false, "BOTTOM", -72, 2)
	local cursor = M.CreateFS(WorldMapFrame.UIElementsFrame, 14, "", false, "BOTTOM", 72, 2)

	local function CursorCoords()
		local left, top = WorldMapDetailFrame:GetLeft() or 0, WorldMapDetailFrame:GetTop() or 0
		local width, height = WorldMapDetailFrame:GetWidth(), WorldMapDetailFrame:GetHeight()
		local scale = WorldMapDetailFrame:GetEffectiveScale()
		local x, y = GetCursorPosition()
		local cx = (x/scale - left) / width
		local cy = (top - y/scale) / height
		if cx < 0 or cx > 1 or cy < 0 or cy > 1 then return end
		return cx, cy
	end

	local function CoordsUpdate(player, cursor)
		local cx, cy = CursorCoords()
		local px, py = GetPlayerMapPosition("player")
		if cx and cy then
			cursor:SetFormattedText(MOUSE_LABEL..formattext, 100 * cx, 100 * cy)
		else
			cursor:SetText(MOUSE_LABEL..I.MyColor..": |cffff0000^-^|r")
		end
		if not px or px == 0 or py == 0 then
			player:SetText(UnitName("player")..I.MyColor..": |cffff0000^-^|r")
		else
			player:SetFormattedText(UnitName("player")..formattext, 100 * px, 100 * py)
		end
	end

	local function UpdateCoords(self, elapsed)
		self.elapsed = self.elapsed - elapsed
		if self.elapsed <= 0 then
			self.elapsed = .1
			CoordsUpdate(player, cursor)
		end
	end

	MaoRUI:EventFrame("WORLD_MAP_UPDATE"):SetScript("OnEvent", function(self)
		if WorldMapFrame:IsVisible() then
			self.elapsed = .1
			self:SetScript("OnUpdate", UpdateCoords)
		else
			self.elapsed = nil
			self:SetScript("OnUpdate", nil)
		end
	end)
end

--ToggleTreasures 
local function click(self)
	local checked = self.checked
	PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
	ShiGuangDB.ToggleTreasuresSettings = checked
	WorldMapFrame_Update()
end

hooksecurefunc("WorldMapTrackingOptionsDropDown_Initialize",function(self,level,menuList)
	if level==1 then
		-- if setting is nil (not defined) then define it to true to check by default
		if ShiGuangDB.ToggleTreasuresSettings==nil then
			ShiGuangDB.ToggleTreasuresSettings = true
		end
		-- add the "Show Treasures" option
		local info = Lib_UIDropDownMenu_CreateInfo()
		info.text = "显示宝藏"
		info.func = click
		info.checked = ShiGuangDB.ToggleTreasuresSettings and true
		info.isNotRadio = true
		info.keepShownOnClick = 1
		UIDropDownMenu_AddButton(info)
	end
end)
-- need to re-initialize to pick up our hooked version of the function
Lib_UIDropDownMenu_Initialize(WorldMapFrameDropDown, WorldMapTrackingOptionsDropDown_Initialize, "MENU")

-- the heart of the addon; if ShiGuangDB.ToggleTreasuresSettings is unchecked, then hide all "197" POIs
hooksecurefunc("WorldMapFrame_Update",function()
	if not ShiGuangDB.ToggleTreasuresSettings then
		for i=1,GetNumMapLandmarks() do
			if select(4,GetMapLandmarkInfo(i))==197 then
				_G["WorldMapFramePOI"..i]:Hide()
			end
		end
	end
end)