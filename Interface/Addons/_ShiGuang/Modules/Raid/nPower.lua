
--------------------------------------------------------------------------------------------
local nPower = {}
local format = string.format
local floor = math.floor
function nPower:FormatValue(self)
    if (self >= 10000) then
        return ('%dw'):format(self / 1e4)  --%.1f
    else
        return self
    end
end

function nPower:Round(num, idp)
	local mult = 10^(idp or 0)
	return floor(num * mult + 0.5) / mult
end

function nPower:Fade(frame, timeToFade, startAlpha, endAlpha)
	if (self:Round(frame:GetAlpha(), 1) ~= endAlpha) then
		local mode = startAlpha > endAlpha and 'In' or 'Out'
        securecall('UIFrameFade'..mode, frame, timeToFade, startAlpha, endAlpha)
	end
end


local nPower_Config = {
    position = {'CENTER', UIParent, 0, -196},
    sizeWidth = 280,
    scale = 1.0,

    showCombatRegen = true,

    activeAlpha = 1,
    inactiveAlpha = 0.3,
    emptyAlpha = 0,

    valueAbbrev = true,

    valueFont = 'Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Infinity.ttf',
    valueFontSize = 21,
    valueFontOutline = true,
    valueFontAdjustmentX = 12,

    showSoulshards = true,
    showHolypower = true,
    showComboPoints = true,
    showChi = true,
    showRunes = false,
    showArcaneCharges = true,

    -- Resource text shown above the bar.
    extraFont = 'Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Edo.ttf',
    extraFontSize = 26,
    extraFontOutline = true,

    mana = {
        show = true,
    },

    energy = {
        show = true,
    },

    focus = {
        show = true,
    },

    rage = {
        show = true,
    },

    lunarPower = {
        show = true,
    },

    rune = {
        show = false,

        runeFont = 'Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf',
        runeFontSize = 26,
        runeFontOutline = true,
    },

    insanity = {
        show = true,
    },

    maelstrom = {
        show = true,
    },

    fury = {
        show = true,
    },

    pain = {
        show = true,
    },
}



local playerClass = select(2, UnitClass('player'))

local Npower = CreateFrame("Frame", "mrnpower", UIParent)
Npower:SetScale(nPower_Config.scale)
Npower:SetSize(310, 26)
Npower:SetPoint(unpack(nPower_Config.position))

Npower:RegisterEvent('PLAYER_REGEN_ENABLED')
Npower:RegisterEvent('PLAYER_REGEN_DISABLED')
Npower:RegisterEvent('ADDON_LOADED')
Npower:RegisterEvent('PLAYER_ENTERING_WORLD')
Npower:RegisterUnitEvent('UNIT_COMBO_POINTS', 'player')
Npower:RegisterEvent('PLAYER_TARGET_CHANGED')
Npower:RegisterEvent('RUNE_TYPE_UPDATE')
Npower:RegisterUnitEvent('UNIT_DISPLAYPOWER', 'player')
Npower:RegisterUnitEvent('UNIT_POWER_FREQUENT', 'player')
Npower:RegisterEvent('UPDATE_SHAPESHIFT_FORM')

if (nPower_Config.showCombatRegen) then
    Npower:RegisterUnitEvent('UNIT_AURA', 'player')
end

Npower:RegisterUnitEvent('UNIT_ENTERED_VEHICLE', 'player')
Npower:RegisterUnitEvent('UNIT_ENTERING_VEHICLE', 'player')
Npower:RegisterUnitEvent('UNIT_EXITED_VEHICLE', 'player')
Npower:RegisterUnitEvent('UNIT_EXITING_VEHICLE', 'player')

if (playerClass == 'WARLOCK' and nPower_Config.showSoulshards
    or playerClass == 'PALADIN' and nPower_Config.showHolypower
    or playerClass == 'ROGUE' and nPower_Config.showComboPoints
    or playerClass == 'DRUID' and nPower_Config.showComboPoints
    or playerClass == 'MONK' and nPower_Config.showChi
    or playerClass == 'MAGE' and nPower_Config.showArcaneCharges) then

    Npower.extraPoints = Npower:CreateFontString(nil, 'ARTWORK')

    if (nPower_Config.extraFontOutline) then
        Npower.extraPoints:SetFont(nPower_Config.extraFont, nPower_Config.extraFontSize, 'THINOUTLINE')
        Npower.extraPoints:SetShadowOffset(0, 0)
    else
        Npower.extraPoints:SetFont(nPower_Config.extraFont, nPower_Config.extraFontSize)
        Npower.extraPoints:SetShadowOffset(1, -1)
    end

    Npower.extraPoints:SetParent(Npower)
    Npower.extraPoints:SetPoint('CENTER', 0, 12)
end

if (playerClass == 'DEATHKNIGHT' and nPower_Config.showRunes) then

    Npower.Rune = {}

    for i = 1, 6 do
        Npower.Rune[i] = Npower:CreateFontString(nil, 'ARTWORK')

        if (nPower_Config.rune.runeFontOutline) then
            Npower.Rune[i]:SetFont(nPower_Config.rune.runeFont, nPower_Config.rune.runeFontSize, 'THINOUTLINE')
            Npower.Rune[i]:SetShadowOffset(0, 0)
        else
            Npower.Rune[i]:SetFont(nPower_Config.rune.runeFont, nPower_Config.rune.runeFontSize)
            Npower.Rune[i]:SetShadowOffset(1, -1)
        end

        Npower.Rune[i]:SetShadowOffset(0, 0)
        Npower.Rune[i]:SetParent(Npower)
    end

    Npower.Rune[1]:SetPoint('CENTER', -60, 12)
    Npower.Rune[2]:SetPoint('CENTER', -36, 12)
    Npower.Rune[3]:SetPoint('CENTER', -12, 12)
    Npower.Rune[4]:SetPoint('CENTER', 12, 12)
    Npower.Rune[5]:SetPoint('CENTER', 36, 12)
    Npower.Rune[6]:SetPoint('CENTER', 60, 12)
end

Npowerbar = CreateFrame('StatusBar', "mrnpower", UIParent)
Npowerbar:SetScale(Npower:GetScale())
Npowerbar:SetSize(nPower_Config.sizeWidth, 5)
Npowerbar:SetPoint('CENTER', Npower, 0, 0)
Npowerbar:SetStatusBarTexture('Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\ColorBar')
Npowerbar:SetAlpha(0)

Npowerbar.Value = Npowerbar:CreateFontString(nil, 'ARTWORK')
if (nPower_Config.valueFontOutline) then
    Npowerbar.Value:SetFont(nPower_Config.valueFont, nPower_Config.valueFontSize, 'THINOUTLINE')
    Npowerbar.Value:SetShadowOffset(0, 0)
else
    Npowerbar.Value:SetFont(nPower_Config.valueFont, nPower_Config.valueFontSize)
    Npowerbar.Value:SetShadowOffset(1, -1)
end
Npowerbar.Value:SetPoint('LEFT', Npowerbar, 'LEFT', 3, nPower_Config.valueFontAdjustmentX)
Npowerbar.Value:SetVertexColor(1, 1, 1)

Npowerbar.Background = Npowerbar:CreateTexture(nil, 'BACKGROUND')
Npowerbar.Background:SetAllPoints(Npowerbar)
Npowerbar.Background:SetTexture('Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\ColorBar')
Npowerbar.Background:SetVertexColor(0.25, 0.25, 0.25, 1)

Npowerbar.BackgroundShadow = CreateFrame('Frame', "mrnpower", Npowerbar)
Npowerbar.BackgroundShadow:SetFrameStrata('BACKGROUND')
Npowerbar.BackgroundShadow:SetPoint('TOPLEFT', -4, 4)
Npowerbar.BackgroundShadow:SetPoint('BOTTOMRIGHT', 4, -4)
Npowerbar.BackgroundShadow:SetBackdrop({
    BgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
    edgeFile = 'Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\glowTex', edgeSize = 4,
    insets = {left = 3, right = 3, top = 3, bottom = 3}
})
Npowerbar.BackgroundShadow:SetBackdropColor(0.15, 0.15, 0.15, 1)
Npowerbar.BackgroundShadow:SetBackdropBorderColor(0, 0, 0)

Npowerbar.Below = Npowerbar:CreateTexture(nil, 'BACKGROUND')
Npowerbar.Below:SetHeight(14)
Npowerbar.Below:SetWidth(14)
Npowerbar.Below:SetTexture('Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\textureArrowBelow')

if (nPower_Config.showCombatRegen) then
    Npower.mpreg = Npowerbar:CreateFontString(nil, 'ARTWORK')
    Npower.mpreg:SetFont(nPower_Config.valueFont, 12, 'THINOUTLINE')
    Npower.mpreg:SetShadowOffset(0, 0)
    Npower.mpreg:SetPoint('RIGHT', Npowerbar, 'RIGHT', -3, 12)
    Npower.mpreg:SetParent(Npowerbar)
    Npower.mpreg:Show()
end

local function GetRealMpFive()
    local _, activeRegen = GetPowerRegen()
    local realRegen = activeRegen * 5
    local _, powerType = UnitPowerType('player')

    if (powerType == 'MANA' or UnitHasVehicleUI('player')) then
        return math.floor(realRegen)
    else
        return ''
    end
end

local function SetPowerColor()
    local powerType
    if ( playerClass == 'ROGUE' or playerClass == 'DRUID' ) then
        powerType = SPELL_POWER_COMBO_POINTS
    elseif ( playerClass == 'MONK' ) then
        powerType = SPELL_POWER_CHI
    elseif ( playerClass == 'MAGE' ) then
        powerType = SPELL_POWER_ARCANE_CHARGES
    elseif ( playerClass == 'PALADIN' ) then
        powerType = SPELL_POWER_HOLY_POWER
    elseif ( playerClass == 'WARLOCK' ) then
        powerType = SPELL_POWER_SOUL_SHARDS
    end
        
    local currentPower = UnitPower("player", powerType)
    local maxPower = UnitPowerMax("player", powerType)

    if ( UnitIsDeadOrGhost('target') ) then
        return 1, 1, 1
    elseif ( currentPower == maxPower-1 ) then
        return 0.9, 0.7, 0.0
    elseif ( currentPower == maxPower ) then
        return 1, 0, 0
    else
        return 1, 1, 1
    end
end

local function CalcRuneCooldown(self)
    local start, duration, runeReady = GetRuneCooldown(self)
    local time = floor(GetTime() - start)
    local cooldown = ceil(duration - time)

    if (runeReady or UnitIsDeadOrGhost('player')) then
        return '*'
    elseif (not UnitIsDeadOrGhost('player') and cooldown) then
        return cooldown
    end
end

local function UpdateBarVisibility()
    local _, powerType = UnitPowerType('player')
    local newAlpha = nil

    if ((not nPower_Config.energy.show and powerType == 'ENERGY')
        or (not nPower_Config.focus.show and powerType == 'FOCUS')
        or (not nPower_Config.rage.show and powerType == 'RAGE')
        or (not nPower_Config.mana.show and powerType == 'MANA')
        or (not nPower_Config.rune.show and powerType == 'RUNEPOWER')
        or (not nPower_Config.fury.show and powerType == 'FURY')
        or (not nPower_Config.pain.show and powerType == 'PAIN')
        or (not nPower_Config.lunarPower.show and powerType == 'LUNAR_POWER')
        or (not nPower_Config.insanity.show and powerType == 'INSANITY')
        or (not nPower_Config.maelstrom.show and powerType == 'MAELSTROM')
        or UnitIsDeadOrGhost('player') or UnitHasVehicleUI('player')) then
        Npowerbar:SetAlpha(0)
    elseif (InCombatLockdown()) then
        newAlpha = nPower_Config.activeAlpha
    elseif (not InCombatLockdown() and UnitPower('player') > 0) then
        newAlpha = nPower_Config.inactiveAlpha
    else
        newAlpha = nPower_Config.emptyAlpha
    end

    if (newAlpha) then
        nPower:Fade(Npowerbar, 0.3, Npowerbar:GetAlpha(), newAlpha)
    end
end

local function UpdateBarValue()
    local min = UnitPower('player')
    Npowerbar:SetMinMaxValues(0, UnitPowerMax('player'))
    Npowerbar:SetValue(min)
    if (nPower_Config.valueAbbrev) and playerClass ~= 'PALADIN' then
        Npowerbar.Value:SetText(min > 0 and nPower:FormatValue(min) or '')
    elseif (nPower_Config.valueAbbrev) and playerClass == 'PALADIN' then
    else
        Npowerbar.Value:SetText(min > 0 and min or '')
    end
end

local function UpdateBarColor()
    local powerType, powerToken, altR, altG, altB = UnitPowerType('player')
    local unitPower = PowerBarColor[powerToken]

    if (unitPower) then
        if ( powerType == 0 ) then
            Npowerbar:SetStatusBarColor(0,0.55,1)
        else
            Npowerbar:SetStatusBarColor(unitPower.r, unitPower.g, unitPower.b)
        end
    else
        Npowerbar:SetStatusBarColor(altR, altG, altB)
    end
end

local function UpdateBar()
    UpdateBarColor()
    UpdateBarValue()
end

Npower:SetScript('OnEvent', function(self, event, arg1)
if not MaoRUISettingDB["Misc"]["nPower"] then self:UnregisterAllEvents() return end
    if (Npower.extraPoints) then
        if (UnitHasVehicleUI('player')) then
            if (Npower.extraPoints:IsShown()) then
                Npower.extraPoints:Hide()
            end
        else
            local nump
            if (playerClass == 'WARLOCK') then
                nump = UnitPower('player', SPELL_POWER_SOUL_SHARDS)
            elseif (playerClass == 'PALADIN') then
                nump = UnitPower('player', SPELL_POWER_HOLY_POWER)
            elseif (playerClass == 'ROGUE' or playerClass == 'DRUID' ) then
                nump = UnitPower('player', SPELL_POWER_COMBO_POINTS)
            elseif (playerClass == 'MONK' ) then
                nump = UnitPower('player', SPELL_POWER_CHI)
            elseif (playerClass == 'MAGE' ) then
                nump = UnitPower('player', SPELL_POWER_ARCANE_CHARGES)
            end

            Npower.extraPoints:SetTextColor(SetPowerColor())
            Npower.extraPoints:SetText(nump == 0 and '' or nump)

            if (not Npower.extraPoints:IsShown()) then
                Npower.extraPoints:Show()
            end
        end
    end

    if (Npower.mpreg and (event == 'UNIT_AURA' or event == 'PLAYER_ENTERING_WORLD')) then
        Npower.mpreg:SetText(GetRealMpFive())
    end

    UpdateBar()
    UpdateBarVisibility()

    if (event == 'PLAYER_ENTERING_WORLD') then
        if (InCombatLockdown()) then
            securecall('UIFrameFadeIn', Npower, 0.35, Npower:GetAlpha(), 1)
        else
            securecall('UIFrameFadeOut', Npower, 0.35, Npower:GetAlpha(), nPower_Config.inactiveAlpha)
        end
    end

    if (event == 'PLAYER_REGEN_DISABLED') then
        securecall('UIFrameFadeIn', Npower, 0.35, Npower:GetAlpha(), 1)
    end
    
    if (event == 'PLAYER_REGEN_ENABLED') then
        securecall('UIFrameFadeOut', Npower, 0.35, Npower:GetAlpha(), nPower_Config.inactiveAlpha)
    end
end)

if (Npower.Rune) then
    local updateTimer = 0
    Npower:SetScript('OnUpdate', function(self, elapsed)
        updateTimer = updateTimer + elapsed

        if (updateTimer > 0.1) then
            for i = 1, 6 do
                if (UnitHasVehicleUI('player')) then
                    if (Npower.Rune[i]:IsShown()) then
                        Npower.Rune[i]:Hide()
                    end
                else
                    if (not Npower.Rune[i]:IsShown()) then
                        Npower.Rune[i]:Show()
                    end
                end

                Npower.Rune[i]:SetText(CalcRuneCooldown(i))
                Npower.Rune[i]:SetTextColor(0.0, 0.6, 0.8)
            end

            updateTimer = 0
        end
    end)
end
