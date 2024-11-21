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