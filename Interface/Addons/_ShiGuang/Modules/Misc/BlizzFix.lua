local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

-- Unregister talent event
if PlayerTalentFrame then
	PlayerTalentFrame:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
else
	hooksecurefunc("TalentFrame_LoadUI", function()
		PlayerTalentFrame:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	end)
end

-- Fix blizz bug in addon list
local _AddonTooltip_Update = AddonTooltip_Update
function AddonTooltip_Update(owner)
	if not owner then return end
	if owner:GetID() < 1 then return end
	_AddonTooltip_Update(owner)
end

-- Fix Drag Collections taint
do
	local done
	local function setupMisc(event, addon)
		if event == "ADDON_LOADED" and addon == "Blizzard_Collections" then
			-- Fix undragable issue
			local checkBox = WardrobeTransmogFrame.ToggleSecondaryAppearanceCheckbox
			checkBox.Label:ClearAllPoints()
			checkBox.Label:SetPoint("LEFT", checkBox, "RIGHT", 2, 1)
			checkBox.Label:SetWidth(152)

			CollectionsJournal:HookScript("OnShow", function()
				if not done then
					if InCombatLockdown() then
						M:RegisterEvent("PLAYER_REGEN_ENABLED", setupMisc)
					else
						M.CreateMF(CollectionsJournal)
					end
					done = true
				end
			end)
			M:UnregisterEvent(event, setupMisc)
		elseif event == "PLAYER_REGEN_ENABLED" then
			M.CreateMF(CollectionsJournal)
			M:UnregisterEvent(event, setupMisc)
		end
	end

	M:RegisterEvent("ADDON_LOADED", setupMisc)
end

-- Select target when click on raid units
do
	local function fixRaidGroupButton()
		for i = 1, 40 do
			local bu = _G["RaidGroupButton"..i]
			if bu and bu.unit and not bu.clickFixed then
				bu:SetAttribute("type", "target")
				bu:SetAttribute("unit", bu.unit)

				bu.clickFixed = true
			end
		end
	end

	local function setupMisc(event, addon)
		if event == "ADDON_LOADED" and addon == "Blizzard_RaidUI" then
			if not InCombatLockdown() then
				fixRaidGroupButton()
			else
				M:RegisterEvent("PLAYER_REGEN_ENABLED", setupMisc)
			end
			M:UnregisterEvent(event, setupMisc)
		elseif event == "PLAYER_REGEN_ENABLED" then
			if RaidGroupButton1 and RaidGroupButton1:GetAttribute("type") ~= "target" then
				fixRaidGroupButton()
				M:UnregisterEvent(event, setupMisc)
			end
		end
	end

	M:RegisterEvent("ADDON_LOADED", setupMisc)
end

-- Fix blizz guild news hyperlink error
do
	local function fixGuildNews(event, addon)
		if addon ~= "Blizzard_GuildUI" then return end

		local _GuildNewsButton_OnEnter = GuildNewsButton_OnEnter
		function GuildNewsButton_OnEnter(self)
			if not (self.newsInfo and self.newsInfo.whatText) then return end
			_GuildNewsButton_OnEnter(self)
		end

		M:UnregisterEvent(event, fixGuildNews)
	end
	M:RegisterEvent("ADDON_LOADED", fixGuildNews)
end

function MISC:HandleUITitle()
	-- Square NDui logo texture
	local function replaceIconString(self, text)
		if not text then text = self:GetText() end
		if not text or text == "" then return end

		if strfind(text, "_ShiGuang") or strfind(text, "AngryKeystones") or strfind(text, "Baganator") or strfind(text, "CanIMogIt") or strfind(text, "CollectionShop") or strfind(text, "HandyNotes") or strfind(text, "HPetBattleAny") or strfind(text, "LiteBuff") or strfind(text, "Skada") or strfind(text, "Syndicator") or strfind(text, "GarrisonMaster") or strfind(text, "GladiatorlosSACN") then
			local newText, count = gsub(text, "|T([^:]-):[%d+:]+|t", "|T"..I.chatLogo..":16:16|t")
			if count > 0 then self:SetFormattedText("%s", newText) end
		end
	end

	hooksecurefunc("AddonList_InitButton", function(entry)
		if not entry.logoHooked then
			replaceIconString(entry.Title)
			hooksecurefunc(entry.Title, "SetText", replaceIconString)

			entry.logoHooked = true
		end
	end)
end

-- Fix guild news jam
do
	local lastTime, timeGap = 0, 1.5
	local function updateGuildNews(self, event)
		if event == "PLAYER_ENTERING_WORLD" then
			QueryGuildNews()
		else
			if self:IsVisible() then
				local nowTime = GetTime()
				if nowTime - lastTime > timeGap then
					CommunitiesGuildNews_Update(self)
					lastTime = nowTime
				end
			end
		end
	end
	CommunitiesFrameGuildDetailsFrameNews:SetScript("OnEvent", updateGuildNews)
end

----------------------------------------------------------------------------------------
--	Fix blank tooltip
----------------------------------------------------------------------------------------
local bug = nil
local FixTooltip = CreateFrame("Frame")
FixTooltip:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
FixTooltip:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
FixTooltip:SetScript("OnEvent", function()
	if GameTooltip:IsShown() then
		bug = true
	end
end)

local FixTooltipBags = CreateFrame("Frame")
FixTooltipBags:RegisterEvent("BAG_UPDATE_DELAYED")
FixTooltipBags:SetScript("OnEvent", function()
	if StuffingFrameBags and StuffingFrameBags:IsShown() then
		if GameTooltip:IsShown() then
			bug = true
		end
	end
end)

GameTooltip:HookScript("OnTooltipCleared", function(self)
	if self:IsForbidden() then return end
	if bug and self:NumLines() == 0 then
		self:Hide()
		bug = false
	end
end)

----------------------------------------------------------------------------------------
--	Fix RemoveTalent() taint
----------------------------------------------------------------------------------------
FCF_StartAlertFlash = M.dummy

----------------------------------------------------------------------------------------
--	Fix Keybind taint
----------------------------------------------------------------------------------------
_G.SettingsPanel.TransitionBackOpeningPanel = _G.HideUIPanel

----------------------------------------------------------------------------------------
--	Fix LFG FilterButton width
----------------------------------------------------------------------------------------
hooksecurefunc(LFGListFrame.SearchPanel.FilterButton, "SetWidth", function(self, width)	-- FIXME check after while for possible Blizzard fix
	if width ~= 94 then
		self:SetWidth(94)
	end
end)


----------------------------------------------------------------------------------------
-- !!NoTaint2 (Code by warbaby 2022-11 http://abyui.top https://github.com/aby-ui)
----------------------------------------------------------------------------------------
if C_AddOns.IsAddOnLoaded("!!NoTaint2") then return end
if not NoTaint2_Proc_ResetActionButtonAction then
	NoTaint2_Proc_ResetActionButtonAction = 1

	-- use /run ActionButton2.action = 2 ActionButton2:UpdateAction() to test

	function NoTaint2_ResetActionButtonAction(self)
		local ok, tainted_by = issecurevariable(self, "action")
		if not ok and not InCombatLockdown() then
			self.action=nil
			self:SetAttribute("_aby", "action")
			-- if self:IsVisible() then NoTaint2_ShowWarning(tainted_by) end
		end
	end

	for _, v in ipairs(ActionBarButtonEventsFrame.frames) do
		hooksecurefunc(v, "UpdateAction", NoTaint2_ResetActionButtonAction)
	end

	local f1 = CreateFrame("Frame")
	f1:RegisterEvent("PLAYER_REGEN_ENABLED")
	f1:SetScript("OnEvent", function()
		for _, v in ipairs(ActionBarButtonEventsFrame.frames) do
			NoTaint2_ResetActionButtonAction(v)
		end
	end)
end

if not NoTaint2_CleanStaticPopups then
	--code since !NoTaint, test: /run StaticPopup_Show('PARTY_INVITE',"a") /dump issecurevariable(StaticPopup1, "which")
	function NoTaint2_CleanStaticPopups()
		for index = 1, STATICPOPUP_NUMDIALOGS, 1 do
			local frame = _G["StaticPopup"..index];
			if not issecurevariable(frame, "which") then
				if frame:IsShown() then
					local info = StaticPopupDialogs[frame.which];
					if info and not issecurevariable(info, "OnCancel") then
						info.OnCancel()
					end
					frame:Hide()
				end
				frame.which = nil
			end
		end
	end

	function NoTaint2_CleanDropDownList()
		local frameToShow = LFDQueueFrameTypeDropDown
		if not frameToShow then return end
		local parent = frameToShow:GetParent()
		frameToShow:SetParent(nil) --to show
		--RequestLFDPlayerLockInfo() --to trigger LFG_LOCK_INFO_RECEIVED
		frameToShow:SetParent(parent)
	end

	local global_obj_name = {
		UIDROPDOWNMENU_MAXBUTTONS = 1,
		UIDROPDOWNMENU_MAXLEVELS = 1,
		UIDROPDOWNMENU_OPEN_MENU = 1,
		UIDROPDOWNMENU_INIT_MENU = 1,
		OBJECTIVE_TRACKER_UPDATE_REASON = 1,
	}

	function NoTaint2_CleanGlobal(self)
		for k, _ in pairs(global_obj_name) do
			if not issecurevariable(k) then
				--print("clean", k, issecurevariable(k))
				_G[k] = nil
			end
		end
		--ObjectiveTrackerFrame.lastMapID = nil
	end

	hooksecurefunc(EditModeManagerFrame, "ClearActiveChangesFlags", function(self)
		for _, systemFrame in ipairs(self.registeredSystemFrames) do
			systemFrame:SetHasActiveChanges(nil);
		end
		self:SetHasActiveChanges(nil);
	end)

	-- not sure if this is of any use. PetFrame and ActionBar call it.
	hooksecurefunc(EditModeManagerFrame, "HideSystemSelections", function(self)
		if self.editModeActive == false then
			self.editModeActive = nil
		end
	end)

	hooksecurefunc(EditModeManagerFrame, "IsEditModeLocked", function()
		NoTaint2_CleanGlobal()
	end)

	local function cleanAll()
		NoTaint2_CleanDropDownList()
		NoTaint2_CleanStaticPopups()
		NoTaint2_CleanGlobal()
	end

	local Origin_IsShown = EditModeManagerFrame.IsShown
	hooksecurefunc(EditModeManagerFrame, "IsShown", function(self)
		if Origin_IsShown(self) then return end
		local stack = debugstack(4)
		--call from UIParent.lua if ( not frame or frame:IsShown() ) then
		--different when hooked
		if stack and stack:find('[string "=[C]"]: in function `ShowUIPanel\'\n', 1, true) then
			cleanAll()
		end
	end)

	-- In case the stack check is failed, assure the game menu entrance.
	-- Running cleanAll() multi times has no side effects.
	--FIXME GameMenuButtonEditMode:HookScript("PreClick", cleanAll)
end

if not NoTaint2_Proc_StopEnterWorldLayout then
	NoTaint2_Proc_StopEnterWorldLayout = 1
	local f2 = CreateFrame("Frame")
	f2:RegisterEvent("PLAYER_LEAVING_WORLD")
	f2:RegisterEvent("PLAYER_ENTERING_WORLD")
	f2:SetScript("OnEvent", function(self, event, ...)
		if event == "PLAYER_ENTERING_WORLD" then
			local login, reload = ...
			if not login and not reload then
				NoTaint2_CleanDropDownList()
				NoTaint2_CleanStaticPopups()
				NoTaint2_CleanGlobal()
			end
			EditModeManagerFrame:RegisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
		elseif event == "PLAYER_LEAVING_WORLD" then
			EditModeManagerFrame:UnregisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
		end
	end)
end

if not NoTaint2_Proc_CleanActionButtonFlyout then
	NoTaint2_Proc_CleanActionButtonFlyout = 1
	--[[------------------------------------------------------------
	this is totally magic, thanks god ObjectiveTrackerFrame is after the ActionBars
	---------------------------------------------------------------]]
	local barsToUpdate = { MainMenuBar, MultiBarBottomLeft, MultiBarBottomRight, StanceBar, PetActionBar, PossessActionBar, MultiBarRight, MultiBarLeft, MultiBar5, MultiBar6, MultiBar7 }
	for _, bar in ipairs(barsToUpdate) do
		hooksecurefunc(bar, "UpdateSpellFlyoutDirection", function(self)
			if not issecurevariable(self, "flyoutDirection") then
				self.flyoutDirection = nil
			end
			if not issecurevariable(self, "snappedToFrame") then
				self.snappedToFrame = nil
			end
		end)
	end

	hooksecurefunc("SetClampedTextureRotation", function(texture)
		local parent = texture and texture:GetParent()
		if parent and parent.FlyoutArrowPushed and parent.FlyoutArrowHighlight then
			if not issecurevariable(texture, "rotationDegrees") then
				texture.rotationDegrees = nil
			end
		end
	end)
end