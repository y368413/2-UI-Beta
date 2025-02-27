-- Bountiful Delves Tracker Addon for WoW 11.0: The War Within

-- Saved Variables
ZDH_SavedVars = ZDH_SavedVars or {
    mode = 1, -- 1 = Default, 2 = Minimalist, 3 = Anchor
    autohide = false,
    isMinimized = false,
    position = { x = 0, y = 0 },
}

-- Global Scripting Table
ZDH_GlobalScripting = {}

-- Core Functionality

-- Check if weekly reward for delves is full (Level 8)
function ZDH_GlobalScripting:IsWeeklyRewardForDelvesFull()
    local worldActivitiesRewards = C_WeeklyRewards.GetActivities(Enum.WeeklyRewardChestThresholdType.World)
    local bestReward = worldActivitiesRewards[3]
    return bestReward and bestReward.level == 8 or false
end

-- Determine if UI should be shown based on mode and conditions
function ZDH_GlobalScripting:GetShowValue(mode, ...)
    local args = {...}
    local allTrue = true

    if mode ~= ZDH_SavedVars.mode then
        return false
    end

    for _, value in ipairs(args) do
        if not value then
            allTrue = false
            break
        end
    end

    if ZDH_SavedVars.autohide then
        local done = ZDH_GlobalScripting:IsWeeklyRewardForDelvesFull()
        return allTrue and not done
    end
    return allTrue
end

-- Delve Progress Functions
local function GetLevel8DelvesDoneCount()
    local worldActivities = C_WeeklyRewards.GetActivities(Enum.WeeklyRewardChestThresholdType.World)
    for i = 2, 1, -1 do
        local activity = worldActivities[i]
        if activity and activity.level >= 8 then
            return activity.progress
        end
    end
    return "?"
end

local function GetDelveRewardLevel(index)
    local worldActivitiesRewards = C_WeeklyRewards.GetActivities(Enum.WeeklyRewardChestThresholdType.World)
    local reward = worldActivitiesRewards[index]
    return reward and reward.level or "?"
end

-- Key Tracking Functions
local function GetKeyNumber()
    local keys = "|T4622270:20|t Keys: "
    local keyInfos = C_CurrencyInfo.GetCurrencyInfo(3028) -- Delve Key Currency ID
    keys = keys .. (keyInfos.quantity == 0 and "|cFFFF0000" or "") .. keyInfos.quantity .. "|r"
    return keys
end

local function GetKeyFlags()
    local keysQuestIDs = {84736, 84737, 84738, 84739}
    local keysObtained = 0
    for _, questID in ipairs(keysQuestIDs) do
        if C_QuestLog.IsQuestFlaggedCompleted(questID) then
            keysObtained = keysObtained + 1
        end
    end
    local keyFlags = "Keys this week: " .. keysObtained .. "/4"
    return keyFlags, keysObtained
end

-- Delve List Management
local DelvesBountifulList = {
    Zones = {
        ["Isle of Dorn"] = { uiMapID = 2248, delves = {{id = 7787, name = "Earthcrawl Mines"}, {id = 7781, name = "Kriegval's Rest"}, {id = 7779, name = "Fungal Folly"}} },
        ["Hallowfall"] = { uiMapID = 2215, delves = {{id = 7789, name = "Skittering Breach"}, {id = 7785, name = "Nightfall Sanctum"}, {id = 7783, name = "The Sinkhole"}, {id = 7780, name = "Mycomancer Cavern"}} },
        ["The Ringing Deeps"] = { uiMapID = 2214, delves = {{id = 7782, name = "The Waterworks"}, {id = 7788, name = "The Dread Pit"}} },
        ["Azj-Kahet"] = { uiMapID = 2255, delves = {{id = 7790, name = "The Spiral Weave"}, {id = 7784, name = "Tak-Rethan Abyss"}, {id = 7786, name = "The Underkeep"}} },
    }
}

function DelvesBountifulList:GetMapAtZoneLevel3(uiMapID)
    local mapInfo = C_Map.GetMapInfo(uiMapID)
    if mapInfo.mapType > 3 and mapInfo.parentMapID > 0 then
        return self:GetMapAtZoneLevel3(mapInfo.parentMapID)
    end
    return uiMapID
end

function DelvesBountifulList:GetBountifulDelves()
    local bountifulDelves, addedDelves = {}, {}
    for _, zoneData in pairs(self.Zones) do
        for _, delve in ipairs(zoneData.delves) do
            if not addedDelves[delve.id] then
                local areaPoiInfo = C_AreaPoiInfo.GetAreaPOIInfo(zoneData.uiMapID, delve.id)
                if areaPoiInfo then
                    table.insert(bountifulDelves, areaPoiInfo)
                    addedDelves[delve.id] = true
                end
            end
        end
    end
    return bountifulDelves
end

function DelvesBountifulList:GetActiveDelveTimer()
    return GetQuestResetTime()
end

function DelvesBountifulList:LayoutText()
    local allDelves = self:GetBountifulDelves()
    local text = ""
    local blueDelves = {
        ["Earthcrawl Mines"] = true,
        ["Kriegval's Rest"] = true,
        ["Fungal Folly"] = true,
        ["Skittering Breach"] = true,
        ["Nightfall Sanctum"] = true,
        ["The Sinkhole"] = true,
        ["Mycomancer Cavern"] = true,
        ["The Waterworks"] = true,
        ["The Dread Pit"] = true,
        ["The Spiral Weave"] = true,
        ["Tak-Rethan Abyss"] = true,
        ["The Underkeep"] = true,
    }

    for zoneName, zoneData in pairs(self.Zones) do
        local zoneInfo = C_Map.GetMapInfo(zoneData.uiMapID)
        if self:ZoneHasDelves(zoneData.delves, allDelves) then
            if text ~= "" then text = text .. "\n" end
            text = text .. "|cffffd700" .. zoneInfo.name .. "|r\n"
            for _, delve in ipairs(zoneData.delves) do
                for _, otherDelve in ipairs(allDelves) do
                    if delve.id == otherDelve.areaPoiID then
                        if blueDelves[otherDelve.name] then
                            text = text .. "|cADD8E6FF" .. otherDelve.name .. "|r\n"
                        else
                            text = text .. otherDelve.name .. "\n"
                        end
                    end
                end
            end
        end
    end
    return text
end

function DelvesBountifulList:ZoneHasDelves(zoneDelves, allDelvesList)
    for _, delve in ipairs(zoneDelves) do
        for _, activeDelve in ipairs(allDelvesList) do
            if delve.id == activeDelve.areaPoiID then
                return true
            end
        end
    end
    return false
end

-- UI Frame Creation
local ZDH = CreateFrame("Frame", "ZDHFrame", UIParent)
ZDH:SetSize(210, 330)
ZDH:SetPoint("CENTER", UIParent, "CENTER", ZDH_SavedVars.position.x, ZDH_SavedVars.position.y)
ZDH:SetMovable(true)
ZDH:EnableMouse(true)
ZDH:RegisterForDrag("LeftButton")
ZDH:SetScript("OnDragStart", ZDH.StartMoving)
ZDH:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local x, y = self:GetCenter()
    ZDH_SavedVars.position.x = x - GetScreenWidth() / 2
    ZDH_SavedVars.position.y = y - GetScreenHeight() / 2
end)
ZDH:Hide() -- Frame is hidden by default

-- Background and Border
ZDH.bg = ZDH:CreateTexture(nil, "BACKGROUND")
ZDH.bg:SetAllPoints()
ZDH.bg:SetColorTexture(0, 0, 0, 0.5)

ZDH.border = CreateFrame("Frame", nil, ZDH, "BackdropTemplate")
ZDH.border:SetAllPoints()
ZDH.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 10})
ZDH.border:SetBackdropBorderColor(0, 0, 0, 1)

-- Title
ZDH.title = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.title:SetPoint("TOP", ZDH, "TOP", 0, -10)
ZDH.title:SetText("Delves Helper Tracker")

-- Minimize/Maximize Button
ZDH.toggleButton = CreateFrame("Button", nil, ZDH)
ZDH.toggleButton:SetSize(24, 24)
ZDH.toggleButton:SetPoint("TOPRIGHT", ZDH, "TOPRIGHT", -5, -5)
ZDH.toggleButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
ZDH.toggleButton:SetScript("OnClick", function()
    ZDH_SavedVars.isMinimized = not ZDH_SavedVars.isMinimized
    ZDH:UpdateUI()
end)

-- Delve Progress Texts
ZDH.progressText = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
ZDH.progressText:SetPoint("TOPLEFT", ZDH, "TOPLEFT", 10, -40)
ZDH.progressText:SetJustifyH("LEFT")

ZDH.rewardText1 = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.rewardText1:SetPoint("TOPLEFT", ZDH.progressText, "BOTTOMLEFT", 0, -10)

ZDH.rewardText2 = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.rewardText2:SetPoint("TOPLEFT", ZDH.rewardText1, "BOTTOMLEFT", 0, -5)

ZDH.rewardText3 = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.rewardText3:SetPoint("TOPLEFT", ZDH.rewardText2, "BOTTOMLEFT", 0, -5)

-- Delve Info Texts
ZDH.delveList = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.delveList:SetPoint("TOPLEFT", ZDH.rewardText3, "BOTTOMLEFT", 0, -15)
ZDH.delveList:SetJustifyH("LEFT")
ZDH.delveList:SetWidth(180)

ZDH.keysText = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.keysText:SetPoint("TOPLEFT", ZDH.delveList, "BOTTOMLEFT", 0, -10)

ZDH.keysGainedText = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.keysGainedText:SetPoint("TOPLEFT", ZDH.keysText, "BOTTOMLEFT", 0, -5)

ZDH.timerText = ZDH:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ZDH.timerText:SetPoint("TOPLEFT", ZDH.keysGainedText, "BOTTOMLEFT", 0, -5)

-- Update UI Function
function ZDH:UpdateUI()
    local mode = ZDH_SavedVars.mode
    local show = ZDH_GlobalScripting:GetShowValue(mode, not ZDH_SavedVars.isMinimized)

    if not show then
        ZDH:Hide()
        return
    end

    ZDH:Show()
    ZDH.toggleButton:SetNormalTexture(ZDH_SavedVars.isMinimized and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up")

    if mode == 1 then -- Default Mode
        ZDH.progressText:SetText("Level 8+: " .. GetLevel8DelvesDoneCount())
        ZDH.rewardText1:SetText("Reward 1: " .. GetDelveRewardLevel(1))
        ZDH.rewardText2:SetText("Reward 2: " .. GetDelveRewardLevel(2))
        ZDH.rewardText3:SetText("Reward 3: " .. GetDelveRewardLevel(3))
        ZDH.delveList:SetText(DelvesBountifulList:LayoutText())
        ZDH.keysText:SetText(GetKeyNumber())
        ZDH.keysGainedText:SetText(GetKeyFlags())
    elseif mode == 2 then -- Minimalist Mode
        ZDH.progressText:SetText("8+: " .. GetLevel8DelvesDoneCount())
        ZDH.rewardText1:SetText(GetDelveRewardLevel(1))
        ZDH.rewardText2:SetText("/ " .. GetDelveRewardLevel(2))
        ZDH.rewardText3:SetText("/ " .. GetDelveRewardLevel(3))
        ZDH.delveList:SetText(DelvesBountifulList:LayoutText())
        ZDH.keysText:SetText(GetKeyNumber())
        ZDH.keysGainedText:SetText(GetKeyFlags())
    elseif mode == 3 then -- Anchor Mode
        if _G["DelvesDashboardFrame"] and _G["DelvesDashboardFrame"]:IsShown() then
            ZDH:SetParent(DelvesDashboardFrame)
            ZDH:ClearAllPoints()
            ZDH:SetPoint("RIGHT", DelvesDashboardFrame, "RIGHT", 10, -25)
            ZDH.progressText:SetText("8+: " .. GetLevel8DelvesDoneCount())
            ZDH.rewardText1:SetText(GetDelveRewardLevel(1))
            ZDH.rewardText2:SetText("/ " .. GetDelveRewardLevel(2))
            ZDH.rewardText3:SetText("/ " .. GetDelveRewardLevel(3))
            ZDH.delveList:SetText(DelvesBountifulList:LayoutText())
            ZDH.keysText:SetText(GetKeyNumber())
            ZDH.keysGainedText:SetText(GetKeyFlags())
        else
            ZDH:Hide()
        end
    end
end

-- Real-Time Timer Update
ZDH:SetScript("OnUpdate", function(self, elapsed)
    if self:IsShown() then
        local timer = DelvesBountifulList:GetActiveDelveTimer()
        self.timerText:SetText("|cFF00FF00Daily Reset: |r" .. SecondsToTime(timer))
    end
end)

-- Event Handling
ZDH:RegisterEvent("PLAYER_ENTERING_WORLD")
ZDH:RegisterEvent("WEEKLY_REWARDS_UPDATE")
ZDH:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
ZDH:RegisterEvent("DAILY_RESET_INSTANCE_WELCOME")
ZDH:RegisterEvent("ZONE_CHANGED")
ZDH:RegisterEvent("VIGNETTES_UPDATED")

ZDH:SetScript("OnEvent", function(self, event, ...)
    if self:IsShown() then -- Only update if the frame is visible
        self:UpdateUI()
    end
end)

-- Slash Command to Show/Hide Frame
SLASH_ZDH1 = "/zdh"
SlashCmdList["ZDH"] = function()
    if ZDH:IsShown() then
        ZDH:Hide()
    else
        ZDH:Show()
        ZDH:UpdateUI()
    end
end

-- Initial Setup (Frame remains hidden, no initial update)
print("|cFF00FF00Delves Helper Tracker|r loaded. Use /zdh to show/hide the frame.")