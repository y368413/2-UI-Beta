-- DwarvenMedicineTracker.lua
local addonName, addon = ...  -- Addon namespace

-- Create the main addon frame
local DwarvenMedicineTracker = CreateFrame("Frame", "DwarvenMedicineTracker", UIParent, "BackdropTemplate")
DwarvenMedicineTracker:SetPoint("CENTER", UIParent, "CENTER", -90.56, 241)  -- Positioning
DwarvenMedicineTracker:SetSize(235, 80)  -- Adjusted to fit title and bars
DwarvenMedicineTracker:Hide()  -- Hide the frame by default

-- Enable frame dragging
DwarvenMedicineTracker:SetMovable(true)
DwarvenMedicineTracker:EnableMouse(true)
DwarvenMedicineTracker:RegisterForDrag("LeftButton")
DwarvenMedicineTracker:SetScript("OnDragStart", function(self) self:StartMoving() end)
DwarvenMedicineTracker:SetScript("OnDragStop", function(self) 
    self:StopMovingOrSizing()
end)

-- Set frame background and border
DwarvenMedicineTracker:SetBackdrop({
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})

-- Create the title text
local titleText = DwarvenMedicineTracker:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
titleText:SetPoint("TOP", DwarvenMedicineTracker, "TOP", 0, -10)
titleText:SetText("Brann Medicine Tracker")

-- Buff Stacks Bar
local buffBar = CreateFrame("StatusBar", "DwarvenMedicineBuffBar", DwarvenMedicineTracker)
buffBar:SetSize(190, 30)  -- Adjusted width to fit within the frame
buffBar:SetPoint("TOP", DwarvenMedicineTracker, "TOP", 0, -30)
buffBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
buffBar:SetStatusBarColor(0, 1, 0, 1)
buffBar:SetMinMaxValues(0, 100)
buffBar:SetValue(0)
buffBar:SetFrameStrata("LOW")

-- Background for Buff Bar
local buffBg = buffBar:CreateTexture(nil, "BACKGROUND")
buffBg:SetAllPoints(buffBar)
buffBg:SetColorTexture(0.788, 0.788, 0.788, 0)

-- Buff Stacks Text
local buffText = buffBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
buffText:SetPoint("LEFT", buffBar, "LEFT", 10, 0)
buffText:SetTextColor(1, 1, 1, 1)
buffText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
buffText:SetShadowColor(0, 0, 0, 1)
buffText:SetShadowOffset(1, -1)
buffText:SetText("0")

-- Buff Icon
local buffIcon = DwarvenMedicineTracker:CreateTexture(nil, "OVERLAY")
buffIcon:SetSize(20, 20)
buffIcon:SetPoint("RIGHT", buffBar, "LEFT", -2, 0)  -- Adjusted position to prevent overlap
buffIcon:SetTexture("Interface\\Icons\\inv_potion_127")

-- Cooldown Bar
local cdBar = CreateFrame("StatusBar", "DwarvenMedicineCooldownBar", DwarvenMedicineTracker)
cdBar:SetSize(180, 10)  -- Adjusted width to fit within the frame
cdBar:SetPoint("BOTTOM", DwarvenMedicineTracker, "BOTTOM", 0, 10)
cdBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
cdBar:SetStatusBarColor(1, 0, 0.055, 1)
cdBar:SetMinMaxValues(0, 25)
cdBar:SetValue(0)
cdBar:SetFrameStrata("LOW")

-- Background for Cooldown Bar
local cdBg = cdBar:CreateTexture(nil, "BACKGROUND")
cdBg:SetAllPoints(cdBar)
cdBg:SetColorTexture(0, 0, 0, 0.5)

-- Cooldown Text
local cdText = cdBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
cdText:SetPoint("LEFT", cdBar, "LEFT", 10, 0)
cdText:SetTextColor(1, 1, 1, 1)
cdText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
cdText:SetShadowColor(0, 0, 0, 1)
cdText:SetShadowOffset(1, -1)
cdText:SetText("")

-- Cooldown Icon
local cdIcon = DwarvenMedicineTracker:CreateTexture(nil, "OVERLAY")
cdIcon:SetSize(20, 20)
cdIcon:SetPoint("RIGHT", cdBar, "LEFT", -5, 0)  -- Adjusted position to prevent overlap
cdIcon:SetTexture("Interface\\Icons\\inv_potion_127")

-- Function to Update Buff Stacks
local function UpdateBuffStacks()
    local _, icon, stacks = AuraUtil.FindAuraByName("Dwarven Medicine", "player", "HELPFUL")
    stacks = stacks or 0
    buffBar:SetValue(stacks)
    buffText:SetText(tostring(stacks))
    buffIcon:SetTexture(icon)

    -- Hide if no buff is present
    buffBar:SetAlpha(stacks > 0 and 1 or 0)
end

-- Function to Update Cooldown
local cdStartTime = 0
local cdDuration = 25

local function UpdateCooldown(self, elapsed)
    if cdStartTime > 0 then
        local timeLeft = cdStartTime + cdDuration - GetTime()
        if timeLeft > 0 then
            cdBar:SetValue(timeLeft)
            cdText:SetText(string.format("%.1f", timeLeft))
        else
            cdBar:SetValue(0)
            cdText:SetText("")
            cdStartTime = 0
        end
    end
end

-- Event Handling
DwarvenMedicineTracker:RegisterEvent("UNIT_AURA")
DwarvenMedicineTracker:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
DwarvenMedicineTracker:SetScript("OnEvent", function(self, event, ...)
    if event == "UNIT_AURA" then
        local unit = ...
        if unit == "player" then
            UpdateBuffStacks()
        end
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, _, spellId = ...
        if string.match(unit, "party") and spellId == 460909 then
            cdStartTime = GetTime()
            cdBar:SetValue(cdDuration)
            cdText:SetText(tostring(cdDuration))
        end
    end
end)

-- Update Cooldown on each frame
cdBar:SetScript("OnUpdate", UpdateCooldown)

-- Initial Update
UpdateBuffStacks()

-- Slash Command: /dmt
SLASH_DWARVENMEDICINE1 = "/dmt"
SlashCmdList["DWARVENMEDICINE"] = function()
    if DwarvenMedicineTracker:IsShown() then
        DwarvenMedicineTracker:Hide()
    else
        DwarvenMedicineTracker:Show()
    end
end