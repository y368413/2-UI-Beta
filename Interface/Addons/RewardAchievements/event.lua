local modName, core = ...

local Config = core.Config
local Helper = core.Helper
local UI = core.UI
local Main = core.Main

local eventFrame = CreateFrame("FRAME")
eventFrame:RegisterEvent("ADDON_LOADED")

function eventFrame:OnEvent(event, addonName)
    if event == "ADDON_LOADED" then
        if addonName == modName then
            Main:InitCache()
        elseif addonName == "Blizzard_AchievementUI" then
            UI:Init()
        end
    end
end

eventFrame:SetScript("OnEvent", eventFrame.OnEvent)
