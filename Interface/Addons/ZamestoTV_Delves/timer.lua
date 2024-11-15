local addonName, addon = ...

local Backdrop = {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    edgeSize = 16,
}

local frame_x = 0
local frame_y = -200

local f = CreateFrame("Button", "ZAMROTimer45", UIParent, "BackdropTemplate")
f:SetWidth(190)
f:SetHeight(40)
f:SetBackdrop(Backdrop)
f.text = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
f.text:SetPoint("CENTER")
f:SetClampedToScreen(true)
f:SetPoint("CENTER", UIParent, "CENTER", frame_x, frame_y)
f:EnableMouse(true)
f:SetMovable(true)
f:RegisterForDrag("LeftButton")
f:RegisterForClicks("AnyUp")
f:Show()
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnDragStart", function(this)
    this:StartMoving()
end)
f:SetScript("OnDragStop", function(this)
    this:StopMovingOrSizing()
    frame_x, frame_y = this:GetCenter()
    frame_x = frame_x - GetScreenWidth() / 2
    frame_y = frame_y - GetScreenHeight() / 2
    this:ClearAllPoints()
    this:SetPoint("CENTER", UIParent, "CENTER", frame_x, frame_y)
end)

local Localizations = {
    enUS = {
        Waiting = "|c1C7BCEFFCommunity Feast:\nbefore the start: %s%s|r",
        Running = "|cFF35BE21Community Feast:\n%s%s until completion|r",
    },
    ruRU = {
        Waiting = "|c1C7BCEFFБеледар:\nдо темной фазы: %s%s|r",
        Running = "|cFF35BE21Беледар:\n%s%s темная фаза|r",
    },
}

local locale = GetLocale()
local L = Localizations[locale] or Localizations.enUS

local useColor = true
local useSound = true
local alert1 = 600
local alert1Color = "|cffffff00"
local alert2 = 300
local alert2Color = "|cffff0000"
local soundKit = 32585

local function printTime(timetotrun, inevent)
    local hideSeconds = timetotrun >= 120
    local msg = L.Waiting
    local msgColor = "|cffffffff"
    if inevent then
        msg = L.Running
    else
        if useColor and timetotrun <= alert2 then
            msgColor = alert2Color
        elseif timetotrun <= alert1 then
            if useSound and not ZAMROTimer45.Alerted then
                ZAMROTimer45.Alerted = true
                PlaySound(soundKit, "Master")
            end
            if useColor then
                msgColor = alert1Color
            end
        end
    end
    f.text:SetText(format(msg, msgColor, SecondsToTime(timetotrun, hideSeconds)))
end

local regionEventStartTime = {
    [1] = { -- eu
        starttime = 1724648400,
        eventDuration = 1800,
        eventIntervalInSeconds = 10800,
        enable = true,
        datablock = {}
    },
    [2] = { -- na
        starttime = 1670338860,
        eventDuration = 1800,
        eventIntervalInSeconds = 10800,
        enable = true,
        datablock = {}
    }
}

local startTime, eventTime, waitTime

if GetCVar("portal") == "EU" then
    startTime = regionEventStartTime[1].starttime
    eventTime = regionEventStartTime[1].eventDuration
    waitTime = regionEventStartTime[1].eventIntervalInSeconds
else
    startTime = regionEventStartTime[2].starttime
    eventTime = regionEventStartTime[2].eventDuration
    waitTime = regionEventStartTime[2].eventIntervalInSeconds
end

local serverTime = GetServerTime()
local timeToEvent = (startTime - serverTime) % waitTime

local inEvent, timeToRun

if timeToEvent > (waitTime - eventTime) then
    inEvent = true
    timeToRun = eventTime - (waitTime - timeToEvent)
else
    inEvent = false
    timeToRun = timeToEvent
end

local ticker = C_Timer.NewTicker(1, function()
    if timeToRun > 0 then
        timeToRun = timeToRun - 1
        printTime(timeToRun, inEvent)
        return
    end
    ZAMROTimer45.Alerted = false
    if inEvent then
        inEvent = false
        timeToRun = waitTime - eventTime
    else
        inEvent = true
        timeToRun = eventTime
    end
    printTime(timeToRun, inEvent)
end)

printTime(timeToRun, inEvent)

-- Frame visibility toggle function
local function toggleFrameVisibility()
    if f:IsShown() then
        f:Hide()
    else
        f:Show()
    end
end

-- Register slash command handler
SLASH_ZAM_CF1 = "/zam"
SlashCmdList["ZAM_CF"] = toggleFrameVisibility
