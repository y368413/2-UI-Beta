------------------------------------------------------------
-- DisablePBT.lua
--
-- Abin
-- 2012/12/18
------------------------------------------------------------

local IsAddOnLoaded = IsAddOnLoaded
local DisableAddOn = DisableAddOn
local ipairs = ipairs
local type = type
local RegisterStateDriver = RegisterStateDriver
local StaticPopup_Hide = StaticPopup_Hide

local PBT_ADDON = "PetBattleTeams"
local PBT_FRAMES = { "PetBattleTeamBackgroundFrame", "PetBattleTeamFrame" }

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function(self)
	if IsAddOnLoaded(PBT_ADDON) then
		DisableAddOn(PBT_ADDON)
		local _, name
		for _, name in ipairs(PBT_FRAMES) do
			local frame = _G[name]
			if type(frame) == "table" and type(frame.SetScript) == "function" then
				frame:ClearAllPoints()
				frame:SetScale(0.01)
				frame:Hide()
				frame:EnableMouse(false)
				frame:UnregisterAllEvents()
				frame:SetScript("OnEvent", nil)
				frame:SetScript("OnUpdate", nil)
				RegisterStateDriver(frame, "visibility", "hide")
			end
		end
	end
end)

hooksecurefunc("StaticPopup_Show", function(which)
	if which == "PBT_IMPORT_TEAMS" then
		StaticPopup_Hide(which)
	end
end)