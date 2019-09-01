local addon, ns = ...
local modname = "Party"
local OmniCD = ns.OmniCD
local module = OmniCD:NewModule(modname, "AceEvent-3.0", "AceHook-3.0")
local L = OmniCD.L

local _G, next, pairs, select, type = _G, next, pairs, select, type
local find, sort, wipe = string.find, table.sort, wipe
local C_CVar_GetCVarBool = C_CVar.GetCVarBool
local C_PvP_IsWarModeDesired = C_PvP.IsWarModeDesired
local C_Timer_After = C_Timer.After
local Clear = Clear
local CompactRaidFrameManager_GetSetting = CompactRaidFrameManager_GetSetting
local CreateFrame = CreateFrame
local GetNumGroupMembers = GetNumGroupMembers
local GetRaidRosterInfo = GetRaidRosterInfo
local GetTime = GetTime
local GetUnitName = GetUnitName
local InCombatLockdown = InCombatLockdown
local IsInRaid = IsInRaid
local SetCooldown = SetCooldown
local UnitGUID, UnitRace, UnitClass, UnitExists = UnitGUID, UnitRace, UnitClass, UnitExists
local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME

local spellList = ns.spellList
local db
local Comms, Modifier

local partyBars = {}
local groupInfo = {}
ns.groupInfo = groupInfo
ns.partyBars = partyBars

local inspectQuery = {}
ns.inspectQuery = inspectQuery

local partyIndex = {
    "party1",
    "party2",
    "party3",
    "party4",
    "player"
}
ns.partyIndex = partyIndex

local raidIndex = {}
ns.raidIndex = raidIndex
for i = 1, 40 do
    raidIndex[i] = "raid"..i
end

local unitFrameAddons = {
    {"Grid2", "Grid2LayoutHeader1UnitButton"},
    {"VUHDO_RAID", "Vd1H"},
    {"ElvUI", "ElvUF_PartyGroup1UnitButton"},
    {"Tukui", "TukuiPartyUnitButton"},
    {"ShadowUF","SUFHeaderpartyUnitButton"}
}

local defaults = {
    uf = "auto",
    arena = {
    preset = "TOPRIGHT",
    anchor = "TOPLEFT",
    attach = "TOPRIGHT",
    offsetX = 0,
    offsetY = 0,
    columns = 6,
    displayInactive = true
    },
    party = {
    preset = "TOPRIGHT",
    anchor = "TOPLEFT",
    attach = "TOPRIGHT",
    offsetX = 0,
    offsetY = 0,
    columns = 6,
    displayInactive = true
    },
    raid = {
    preset = "TOPRIGHT",
    anchor = "TOPLEFT",
    attach = "TOPRIGHT",
    offsetX = 0,
    offsetY = 0,
    columns = 6,
    },
    displayBorder = true,
    pixelPerfect = true,
    borderColor = { r=0, g=0, b=0 },
    showCounter = true,
    scale = 0.8,
	autoScale = true,
    chargeScale = 1,
    paddingX = 2,
    paddingY = 2,
    counterScale = 0.8,
    swipeAlpha = 0.8,
    inactiveAlpha = 1,
    activeAlpha = 1,
    glow = true,
    glowBuffs = true,
    glowBuffTypes = {
        defensive = true,
        immunity = true
    },
    visibility = {
        size = 5,
        arena = true,
        party = true
    },
    priority = {
        interrupt = 6,
        cc = 5,
        immunity = 4,
        defensive = 3,
        offensive = 2,
        others = 1,
        custom = 10
    },
    spells = {},
}

OmniCD.defaults.profile.modules[modname] = true
OmniCD.defaults.profile[modname] = defaults

module.enabledIDs = {}
module.unitFrames = {}

function module:OnInitialize()
    db = OmniCD.db.profile[modname]
    OmniCD:UpdateEnabledIDs(self)
    for i = 1, 40 do
        self.CreateBar(i)
    end
    self:SetEnabledState(OmniCD:GetModuleEnabled(modname))
end

function module:OnEnable()
    OmniCD.RegisterCallback(self, "OnEnteringWorld")
    OmniCD.RegisterCallback(self, "USE_RAID_STYLE_PARTY_FRAMES")
    self:RegisterEvent("GROUP_ROSTER_UPDATE")

    if IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") then
        self:SecureHook("CompactRaidFrameManager_SetSetting", "UserSetIsShown")
        self:SecureHook("CompactUnitFrameProfiles_ApplyProfile", "UserSetProfile")
        self.useCompactRaidFrames = C_CVar_GetCVarBool("useCompactPartyFrames")
        self.showCompactRaidFrame = CompactRaidFrameManager_GetSetting("IsShown")
        self.keepGroupsTogether = CompactRaidFrameManager_GetSetting("KeepGroupsTogether")
    end

    groupInfo[ns.playerGUID] = {
        index = 5,
        raceID = ns.playerRaceID,
        class = ns.playerClass,
        unit = "player",
        name = ns.playerName
    }

    self.unitFrames.enabled = false
    self.unitFrames.values = {auto = "Auto", blizz = "Blizzard"}

    for i = 1, #unitFrameAddons do
        local name = unitFrameAddons[i][1]
        local frame = _G[name]

        if frame then
            self.unitFrames.enabled = self.unitFrames.enabled or {}
            self.unitFrames.enabled[name] = unitFrameAddons[i][2]
            self.unitFrames.values[name] = name == "VUHDO_RAID" and "VuhDo" or name
            if not self.unitFrames.prio then
                self.unitFrames.prio = name
            end
        end
    end

    if self.unitFrames.enabled then
        if not self.unitFrames.values[db.uf] then
            db.uf = "auto"
        end
        self.unitFrames.active = db.uf == "auto" and self.unitFrames.prio or db.uf

        if not db.disableElvMsg then
            StaticPopup_Show("OMNICD_Elv_MSG")
        end
    end

    if not (self.unitFrames.enabled and self.unitFrames.enabled.ElvUI) then
        OmniCD.RegisterCallback(self, "OnUIScaleChange", "ConfirmReload", ns.STRINGS.UI_SCALE_CHANGED)
    end

    self.db_scale = db.scale

    Comms = OmniCD:GetModule("Comms")
    Modifier = OmniCD:GetModule("Modifier")
end

function module:OnDisable()
    OmniCD.UnregisterCallback(self, "OnEnteringWorld")
    if Modifier:IsEnabled() then Modifier:Disable() end
    if Comms:IsEnabled() then Comms:Disable() end
    self.ResetGroupInfo()
    wipe(ns.eventList[modname])

    if self.test then self:Test() end
    for i = 1, #partyBars do
        local bar = partyBars[i]
        bar:Hide()
    end
end

StaticPopupDialogs["OMNICD_Elv_MSG"] = {
    text = GetAddOnMetadata(addon, "Title").."\n\n"..L["Changing party display options in your UF addon while OmniCD is active will break the anchors. Type (/oc rl) to fix the anchors"],
    button1 = OKAY,
    button3 = L["Don't show again"],
    OnAlt = function()
        OmniCD.db.profile[modname].disableElvMsg = true
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = STATICPOPUP_NUMDIALOGS
}

do
    local _, screenheight = GetPhysicalScreenSize()
    local uiScale = UIParent:GetScale()
    local uiUnitFactor = 768 / screenheight
    local numPixels = (uiUnitFactor / uiScale)

    local White8x8 = [[Interface\BUTTONS\WHITE8X8]]

    function module.CreateIcon(bar)
        bar.numIcons = bar.numIcons + 1
        local name = bar:GetName()
        local iconName = name.."Icon"..bar.numIcons
        local icon = CreateFrame("Button", iconName, _G[name.."Icons"], "OmniCDButtonTemplate")
        local counter = icon.cooldown:GetRegions()
        icon.counter = counter

        icon:SetBackdrop({
            edgeFile = White8x8,
            edgeSize = numPixels/db.scale,
        })
        icon:SetBackdropBorderColor(0,0,0,0)

        bar.icons[bar.numIcons] = icon

        return icon
    end
end

function module.CreateBar(i)
    local f = CreateFrame("Frame", "OmniCD"..i, UIParent, "OmniCDTemplate")
    f:Hide()
    f.icons = {}
    f.numIcons = 0
    f.usedIcons = 0
    f.anchor:Hide()
    f.anchor:EnableMouse(false)
    f.anchor.text:SetText(i)
    partyBars[i] = f
end

function module.IsSpellEnabled(spell)
    local spellID = spell.spellID
    local key = "spell"..spellID
    if type(db.spells[key]) == "boolean" then
        if db.spells[key] then return true end
    elseif not db.noDefault then
        if spell.default then return true end
    end
end

function module:IsTalent(spellID, guid)
    if groupInfo[guid].talentIDs and groupInfo[guid].talentIDs[spellID] then
        if groupInfo[guid].talentIDs[spellID] == 0 or self.pvp then return true end
    end
end

local function IsEquipped(itemID, guid)
    if not groupInfo[guid].slotIDs or not itemID then return end
    if groupInfo[guid].slotIDs[itemID] then return true end
end

local function IsSpellSpec(spell, guid)
    if not spell.spec then return true end
    if not groupInfo[guid].spec then return end
    if type(spell.spec) == "table" then
        for _, v in pairs(spell.spec) do
            if v == groupInfo[guid].spec then return true end
        end
    else
        return module:IsTalent(type(spell.spec) == "number" and spell.spec or spell.spellID, guid)
    end
end

local function GetValueByType(v, guid)
    if type(v) == "table" then
        return v[groupInfo[guid].spec] or v.default
    else
        return v
    end
end

function module:FindReducedTime(icon, spell)
    if type(spell.target) == "table" then
        if spell.target[icon.spellID] then
            if spell.duration then
                return (not spell.talent or self:IsTalent(spell.talent, icon.guid)) and GetValueByType(spell.duration, icon.guid) or spell.base
            else
                return (not spell.talent or self:IsTalent(spell.talent, icon.guid) or icon.spellID == spell.default) and spell.target[icon.spellID]
            end
        end
    elseif not spell.target or spell.target == icon.spellID then
        return (not spell.talent or self:IsTalent(spell.talent, icon.guid)) and GetValueByType(spell.duration, icon.guid) or spell.base
    end
end

function module:AddIcon(bar, spell, guid)
    bar.usedIcons = bar.usedIcons + 1
    local id = spell.spellID
    local icon = bar.icons[bar.usedIcons] or self.CreateIcon(bar)
    icon.spellID = id
    icon.guid = guid
    icon.type = spell.type
    icon.buff = spell.buff or id
    icon.icon:SetTexture(spell.icon)
    icon.active = nil
    icon.ActiveGlow:Hide()

    local duration, maxcharges
    local info = groupInfo[guid]
    if info.talentIDs and info.slotIDs then
        local mod = ns.modifier[id]
        if mod and self:IsTalent(mod.talent, guid) then
            duration = mod.duration
        else
            duration = GetValueByType(spell.duration, guid)
        end

        mod = ns.modifierB[id]
        if mod and self:IsTalent(mod.talent, guid) then
            duration = duration * mod.ratio
        end

        mod = ns.chargeModifier[id]
        if mod and self:IsTalent(mod.talent, guid) then
            maxcharges = mod.charges
        else
            local ch = GetValueByType(spell.charges, guid)
            maxcharges = ch ~= 1 and ch
        end

        mod = ns.azeriteModifier[id]
        if mod and IsEquipped(mod.azeriteID, guid) then
            if mod.duration then
                duration = duration - mod.duration
            elseif mod.charges then
                maxcharges = mod.charges
            end
        end

        mod = ns.essCDFix[id]
        if mod and ns.essRanked[ info.slots[3] ] then
            duration = duration - mod
        end

        if ns.essModifiers[id] then
            local essSpec = ns.essModifierSpecs[id]
            if not essSpec or essSpec == info.spec then
                for k in pairs(ns.essStrive) do
                    if info.talentIDs[k] then
                        duration = duration * info.slotIDs.mult
                        break
                    end
                end
            end
        end
    else
        local ch = GetValueByType(spell.charges, guid)
        maxcharges = ch ~= 1 and ch
        duration = GetValueByType(spell.duration, guid)
    end
    icon.duration = duration
    icon.maxcharges = maxcharges
    icon.Count:SetText(icon.maxcharges or "")

    local active = info.active[id]
    if active then
        local c
        if icon.maxcharges then
            c = active.charges or icon.maxcharges - 1
            icon.Count:SetText(c)
        else
            c = -1
        end
        self:UpdateCooldown(icon, active.startTime, active.duration, c)
    else
        icon.cooldown:Clear()
    end

    if info[id] then
        icon.icon:SetVertexColor(0.4, 0.4, 0.4)
    else
        icon.icon:SetVertexColor(1, 1, 1)
    end
end

local BASE_ICON_SIZE = 36

local function UpdateIconPosition(bar)
    local count, rows, a, k = 0, 1, 1
    local grow = module.db_growUpward and 1 or -1
    local ofsX = module.db_growLeft and -module.db_offsetX or module.db_offsetX
    for i = 1, bar.usedIcons do
        local icon = bar.icons[i]
        icon:Hide()
        local index = i
        if not module.db_displayInactive then i = a end
        if module.db_displayInactive or icon.active then
            icon:ClearAllPoints()
            if i > 1 then
                count = count + 1
                if count >= module.db_columns then
                    icon:SetPoint(module.db_anchor, bar, module.db_anchor, ofsX, (BASE_ICON_SIZE + db.paddingY) * rows * grow - module.db_offsetY)
                    count = 0
                    rows = rows + 1
                else
                    if module.db_growLeft then
                        icon:SetPoint("TOPRIGHT", bar.icons[module.db_displayInactive and i-1 or k], "TOPLEFT", -db.paddingX, 0)
                    else
                        icon:SetPoint("TOPLEFT", bar.icons[module.db_displayInactive and i-1 or k], "TOPRIGHT", db.paddingX, 0)
                    end
                end
            else
                icon:SetPoint(module.db_anchor, bar, module.db_anchor, ofsX, -module.db_offsetY)
            end
            a = a + 1
            k = index
            icon:Show()
        end
    end
end

local function ApplySettings(bar)
    if db.showAnchor then
        bar.anchor:ClearAllPoints()
        bar.anchor:SetPoint(module.db_growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", bar, module.db_anchor)
        bar.anchor:Show()
    else
        bar.anchor:Hide()
    end

    for i = 1, bar.usedIcons do
        local icon = bar.icons[i]
        if not db.displayBorder then
            icon.icon:SetTexCoord(0, 1, 0, 1)
            icon:SetBackdropBorderColor(0, 0, 0, 0)
            icon.IconBorder:Hide()
        else
            if db.pixelPerfect and not db.autoScale then
                icon:SetBackdropBorderColor(db.borderColor.r,db.borderColor.g,db.borderColor.b,1)
                icon.IconBorder:Hide()
            else
                icon:SetBackdropBorderColor(0, 0, 0, 0)
                icon.IconBorder:Show()
                icon.IconBorder:SetVertexColor(db.borderColor.r,db.borderColor.g,db.borderColor.b)
            end
            icon.icon:SetTexCoord(0.065, 0.935, 0.065, 0.935)
        end
        local charges = tonumber(icon.Count:GetText())
        icon:SetAlpha(icon.active and db.activeAlpha or db.inactiveAlpha)
        icon.icon:SetDesaturated(db.desaturateActive and icon.active and (not charges or charges == 0));
        icon.cooldown:SetReverse(db.reverse)
        icon.cooldown:SetSwipeColor(0, 0, 0, db.swipeAlpha)
        icon.cooldown:SetHideCountdownNumbers(icon.active and charges and charges > 0 or not db.showCounter or icon.ActiveGlow:IsVisible())
        icon.counter:SetScale(db.counterScale)
        icon.Count:SetScale(db.chargeScale)
        icon:EnableMouse(db.tooltip)
    end
    if not db.autoScale then
        bar.container:SetScale(db.scale)
        bar.anchor:SetScale(db.scale > 1 and 1 or db.scale)
    end
end

local ignored = {}

function module:UpdateUnitBar(index)
    local unit = self.isInRaid and raidIndex[index] or partyIndex[index]
    local guid = UnitGUID(unit)
    if not groupInfo[guid] then return end

    local bar = partyBars[index]
    local class, raceID = groupInfo[guid].class, groupInfo[guid].raceID
    bar.guid = guid
    bar.class = class
    bar.raceID = raceID
    bar.usedIcons = 0

    local classSpells = spellList[class]
    groupInfo[guid].active = groupInfo[guid].active or {}

    sort(classSpells, function(a, b)
        if db.priority[a.type] == db.priority[b.type] then
            return a.spellID < b.spellID
        end
        return db.priority[a.type] > db.priority[b.type]
    end)

    wipe(ignored)
    local n = #classSpells
    for i = 1, n do
        local spell = classSpells[i]
        if spell.parent then
            if IsSpellSpec(spell, guid) then
                if spell.parent2 then ignored[spell.parent2] = true end
                if spell.hide then ignored[spell.spellID] = true end
                ignored[spell.parent] = true
            else
                ignored[spell.spellID] = true
            end
        end
        if spell.pve then
            if self.isArena or self.zone == "pvp" then
                ignored[spell.spellID] = true
            end
        end
    end

    local keyNum = self.zone == "pvp" and db.bgTrinket and 1 or 5
    for i = 1, keyNum do
        local key = (i == 1 and self.pvp and "TRINKET") or (i == 2 and "RACIAL") or (i == 3 and class) or (i == 4 and "ALL") or (i == 5 and "ESSENCES")
        local num = key and #spellList[key] or 0
        for j = 1, num do
            local spell = spellList[key][j]
            if self.enabledIDs[spell.spellID] then
                if i == 3 then
                    if not ignored[spell.spellID] and IsSpellSpec(spell, guid) then
                        self:AddIcon(bar, spell, guid)
                    end
                elseif i == 1 then
                    if IsSpellSpec(spell, guid) then
                        self:AddIcon(bar, spell, guid)
                        break
                    end
                elseif i == 2 then
                    if spell.race == raceID then
                        self:AddIcon(bar, spell, guid)
                        break
                    end
                elseif not spell.item or IsEquipped(spell.item, guid) or IsEquipped(spell.item2, guid) then
                    self:AddIcon(bar, spell, guid)
                end
            end
        end
    end

    for i = bar.usedIcons + 1, bar.numIcons do
        local icon = bar.icons[i]
        icon:Hide()
        icon.active = nil
        icon.spellID = nil
    end

    UpdateIconPosition(bar)
    ApplySettings(bar)
end

function module:UpdateBars()
    local n = self.size == 0 and self.test and 1 or self.size
    for i = 1, n do
        local index = not self.isInRaid and i == n and 5 or i
        if not self.playerDisabled or index ~= groupInfo[ns.playerGUID].index then
            if index == groupInfo[ns.playerGUID].index then
                Comms.InspectUnit(ns.playerGUID)
            end
            self:UpdateUnitBar(index)
        end
    end
end

function module:USE_RAID_STYLE_PARTY_FRAMES(_, value)
    self.useCompactRaidFrames = ( value == "1" )
    self:UpdateBarPosition()
end

function module:UserSetIsShown(optionName, value)
    if optionName ~= "IsShown" then return end
    self.showCompactRaidFrame = CompactRaidFrameManager_GetSetting("IsShown")
    self:UpdateBarPosition()
end

function module:UserSetProfile()
    self.keepGroupsTogether = CompactRaidFrameManager_GetSetting("KeepGroupsTogether")
    self:UpdateBarPosition()
end

function module:CompactRaidFrameIsActive()
    return self.isInRaid and not self.isArena or self.useCompactRaidFrames
end

local function GetUnitAnchor(guid, unit, name, i)
    for i = 1, 5 do
        local frame = _G[name..i]
        if frame and frame[unit] and UnitGUID(frame[unit]) == guid then
            return frame
        end
    end
end

function module:FindAnchorFrame(index, n)
    local unit = self.isInRaid and raidIndex[index] or partyIndex[index]
    local guid = UnitGUID(unit)
    if self.unitFrames.enabled then
        if n > 5 then return end
        if db.uf ~= "blizz" then
            local name = self.unitFrames.active
            local unit = name == "VUHDO_RAID" and "raidid" or "unit"
            for k = 1, 5 do
                local frame = _G[self.unitFrames.enabled[name]..k]
                if frame and frame[unit] and UnitGUID(frame[unit]) == guid then
                    return frame
                end
            end
        end
    end

    if self:CompactRaidFrameIsActive() or self.test then
        if not self.showCompactRaidFrame then return end
        if not self.keepGroupsTogether then
            for i = 1, 50 do
                local frame = _G["CompactRaidFrame"..i]
                if frame and frame.unit and UnitGUID(frame.unit) == guid then
                    return frame
                end
            end
        elseif self.isInRaid then
            for j = 1, 8 do
                for i = 1, 5 do
                    local frame = _G["CompactRaidGroup"..j.."Member"..i]
                    if frame and frame.unit and UnitGUID(frame.unit) == guid then
                        return frame
                    end
                end
            end
        else
            for i = 1, 5 do
                local frame = _G["CompactPartyFrameMember"..i]
                if frame and frame.unit and UnitGUID(frame.unit) == guid then
                    return frame
                end
            end
        end
    elseif index ~= 5 then
        return _G["PartyMemberFrame"..index]
    end
end

function module:UpdateBarPosition()
    if self.disabled then return end
    for i = 1, #partyBars do
        local bar = partyBars[i]
        bar:Hide()
    end

    local scale
    local n = self.size == 0 and self.test and 1 or self.size
    for i = 1, n do
        local index = not self.isInRaid and i == n and 5 or i
        local bar = partyBars[index]
        local frame = self:FindAnchorFrame(index, n)
        if frame and (not self.playerDisabled or index ~= groupInfo[ns.playerGUID].index) then
            if db.autoScale then
                if not scale then
                    local s = self.unitFrames.active == "VUHDO_RAID" and (frame:GetEffectiveScale()/UIParent:GetEffectiveScale()) or 1
                    scale = frame:GetHeight() * s / BASE_ICON_SIZE * db.scale
                end
                bar.container:SetScale(scale)
                bar.anchor:SetScale(scale > 1 and 1 or scale)
            end

            bar:ClearAllPoints()
            bar:SetPoint(self.db_anchor, frame, self.db_attach)
            bar:Show()
        end
    end
end

function OmniCD_CooldownFinish(self)
    local icon = self:GetParent()
    if icon.cooldown and icon.cooldown:GetCooldownTimes() > 0 then return end
    if not groupInfo[icon.guid] then return end

    if groupInfo[icon.guid].active and groupInfo[icon.guid].active[icon.spellID] then
        local charges = icon.maxcharges
        if charges then
            if groupInfo[icon.guid].active[icon.spellID].charges + 1 < charges then
                module:StartCooldown(icon, icon.duration, true)
                return
            else
                icon.Count:SetText(charges)
            end
        end
        groupInfo[icon.guid].active[icon.spellID] = nil
        icon.active = nil
    end

    if module.db_displayInactive then
        icon:SetAlpha(db.inactiveAlpha)
        icon.icon:SetDesaturated(false);
    else
        local bar = icon:GetParent():GetParent()
        UpdateIconPosition(bar)
    end
end

local function ResetCooldown(icon)
    local charge = groupInfo[icon.guid].active[icon.spellID].charges
    if charge and charge + 1 < icon.maxcharges then
        icon.Count:SetText(charge + 1)
        icon.cooldown:SetHideCountdownNumbers(true)
    else
        icon.cooldown:Clear()
    end
end

function module.ResetAllIcons()
    for i = 1, #partyBars do
        local bar = partyBars[i]
        if groupInfo[bar.guid] and groupInfo[bar.guid].active then
            wipe(groupInfo[bar.guid].active)
        end
        for j = 1, bar.numIcons do
            local icon = bar.icons[j]
            if icon.active then
                local charges = icon.maxcharges
                if charges then
                    icon.Count:SetText(charges)
                end
                icon.active = nil
                icon.ActiveGlow:Hide()
                icon.cooldown:Clear()
            end
        end
    end
end

do
    local partyUnits = {
        party1 = 1,
        party2 = 2,
        party3 = 3,
        party4 = 4,
        player = 5
    }
    ns.partyUnits = partyUnits

    local raidUnits = {}
    ns.raidUnits = raidUnits
    for i = 1, 40 do
        raidUnits["raid"..i] = i
    end

    local specialBuffed = {}

    local function GetBuffDuration(unit, spellID)
        for i = 1, 40 do
            local _,_,_,_, d, _,_,_,_, id = UnitBuff(unit, i)
            if not id then return end
            if id == spellID then

                return d > 0 and d
            end
        end
    end

    function module:UNIT_AURA(_, unit)
        local index = not self.isInRaid and partyUnits[unit] or (self.isInRaid and raidUnits[unit])
        if not index or (self.playerDisabled and index == groupInfo[ns.playerGUID].index) then return end
        local guid = partyBars[index].guid
        if not groupInfo[guid] or not specialBuffed[guid] then return end
        if not GetBuffDuration(groupInfo[guid].unit, specialBuffed[guid]) then
            self:RemoveHighlight(guid, specialBuffed[guid])
        end
    end

    function module:RemoveHighlight(guid, spellID)
        if not groupInfo[guid] or not groupInfo[guid].glow or not groupInfo[guid].glow[spellID] then return end
        local index = groupInfo[guid].index
        local bar = partyBars[index]
        for i = 1, bar.usedIcons do
            local icon = bar.icons[i]
            if icon.buff == spellID then
                icon.ActiveGlow:Hide()
                local charges = tonumber(icon.Count:GetText())
                icon.cooldown:SetDrawSwipe(not charges or charges == 0)
                icon.cooldown:SetHideCountdownNumbers(charges and charges > 0 or not db.showCounter)
                if ns.omniCC then icon.cooldown:Show() end
                if ns.tullaCC then
                    icon.cooldown:SetCooldown(groupInfo[guid].active[icon.spellID].startTime, groupInfo[guid].active[icon.spellID].duration)
                end
                break
            end
        end
        groupInfo[guid].glow[spellID] = nil
        specialBuffed[guid] = nil
        if next(specialBuffed) == nil then OmniCD.DelistEvent(self, "UNIT_AURA") end
    end

    function module:HighlightIcon(icon)
        if not db.glowBuffs or not db.glowBuffTypes[icon.type] then return end
        local unit = groupInfo[icon.guid].unit
        local duration = GetBuffDuration(unit, icon.buff)
        if duration then
            if ns.specialBuffs[icon.buff] then
                specialBuffed[icon.guid] = icon.buff
                OmniCD.EnlistEvent(self, "UNIT_AURA")
                duration = ns.specialBuffs[icon.buff][2]
            end

            C_Timer_After(duration, function() self:RemoveHighlight(icon.guid, icon.buff) end)

            icon.ActiveGlow:Show()
            icon.cooldown:SetDrawSwipe(false)
            icon.cooldown:SetHideCountdownNumbers(true)
            if ns.omniCC then icon.cooldown:Hide() end

            groupInfo[icon.guid].glow = groupInfo[icon.guid].glow or {}
            groupInfo[icon.guid].glow[icon.buff] = 1
            return true
        end
    end

    function module:SetGlow(icon)
        if self:HighlightIcon(icon) then return end
        if db.glow then
            local flash = icon.flashAnim
            local newItemAnim = icon.newitemglowAnim
            if (not flash:IsPlaying() and not newItemAnim:IsPlaying()) then
                flash:Play();
                newItemAnim:Play();
            end
        end
    end
end

function module:StartCooldown(icon, cd, recharge)
    groupInfo[icon.guid].active[icon.spellID] = groupInfo[icon.guid].active[icon.spellID] or {}
    local time = GetTime()
    local startTime
    local charges = groupInfo[icon.guid].active[icon.spellID].charges or icon.maxcharges
    if charges then
        if recharge then
            icon.cooldown:SetDrawSwipe(false)
            icon.cooldown:SetHideCountdownNumbers(true)
            icon.cooldown:SetCooldown(time, cd)
            startTime = time
            charges = charges + 1
        elseif charges == icon.maxcharges then
            icon.cooldown:SetDrawSwipe(false)
            icon.cooldown:SetHideCountdownNumbers(true)
            icon.cooldown:SetCooldown(time, cd)
            startTime = time
            charges = charges - 1
        elseif charges == 0 then
            icon.cooldown:SetDrawSwipe(true)
            icon.cooldown:SetHideCountdownNumbers(not db.showCounter)
            icon.cooldown:SetCooldown(time, cd)
            startTime = time
        else
            icon.cooldown:SetDrawSwipe(charges == 1 or false)
            icon.cooldown:SetHideCountdownNumbers(charges ~= 1 or not db.showCounter)
            charges = charges - 1
        end

        icon.cooldown:SetDrawEdge(true)
        icon.Count:SetText(charges)
        groupInfo[icon.guid].active[icon.spellID].charges = charges
    else
        icon.cooldown:SetDrawEdge(false)
        icon.cooldown:SetDrawSwipe(true)
        icon.cooldown:SetHideCountdownNumbers(not db.showCounter)
        icon.cooldown:SetCooldown(time, cd)
        startTime = time
    end

    if startTime then
        groupInfo[icon.guid].active[icon.spellID].startTime = startTime
    end
    groupInfo[icon.guid].active[icon.spellID].duration = cd
    if icon.spellID == 46968 then
        groupInfo[icon.guid].active[icon.spellID].count = 0
    elseif icon.spellID == 192058 then
        groupInfo[icon.guid].active[icon.spellID].init_Time = startTime
    end

    icon.active = true
    icon:SetAlpha(db.activeAlpha)
    icon.icon:SetDesaturated(db.desaturateActive and (not charges or charges == 0))

    if not self.db_displayInactive then
        local bar = icon:GetParent():GetParent()
        UpdateIconPosition(bar)
    end

    if not recharge then
        if ns.specialBuffs[icon.buff] then
            C_Timer_After(ns.specialBuffs[icon.buff][1], function() self:SetGlow(icon) end)
        else
            self:SetGlow(icon)
        end
    end
end

function module:UpdateCooldown(icon, startTime, duration, charges)
    icon.cooldown:SetCooldown(startTime, duration or icon.duration)
    groupInfo[icon.guid].active[icon.spellID].startTime = startTime
    icon.active = true
    icon:SetAlpha(db.activeAlpha)
    icon.icon:SetDesaturated(db.desaturateActive and (not charges or charges < 1))


    if not charges then return end
    icon.cooldown:SetDrawSwipe(charges < 0)
    icon.cooldown:SetHideCountdownNumbers(charges > 0 or not db.showCounter)
    icon.cooldown:SetDrawEdge(charges > -1)
    groupInfo[icon.guid].active[icon.spellID].charges = charges ~= -1 and charges or nil

    self:HighlightIcon(icon)
end

local EVERY_MAN_FOR_HIMSELF = 59752

local function SetSharedCooldown(icon, spellID, info)
    local sharedCD = (spellID == EVERY_MAN_FOR_HIMSELF or icon.spellID == EVERY_MAN_FOR_HIMSELF) and 90 or 30
    if not icon.active or (info.active[icon.spellID].startTime + info.active[icon.spellID].duration - GetTime() < sharedCD) then
        module:StartCooldown(icon, sharedCD)
    end
end

function module:CheckSpell(spellID, index)
    local bar = partyBars[index]
    local guid = bar.guid
    if not groupInfo[guid] then return end

    for i = 1, bar.usedIcons do
        local icon = bar.icons[i]
        local merged = ns.merged[spellID]
        if merged then
            local cd = merged[icon.spellID]
            if cd then
                if cd > 1 then
                    icon.icon:SetTexture(merged.icon)
                    self:StartCooldown(icon, cd)
                else
                    self:StartCooldown(icon, icon.duration)
                end
                return
            end
        else
            if icon.spellID == spellID then
                if ns.auraRemoved[spellID] then
                    groupInfo[guid][spellID] = true
                    icon.icon:SetVertexColor(0.4, 0.4, 0.4)
                    return
                else
                    self:StartCooldown(icon, icon.duration)
                    if ns.sharedRacial[spellID] or ns.auraApplied[spellID] then return end
                end
            end

            if ns.sharedTrinket[spellID] then
                if not self.pvp or i > 2 then return end
                if ns.sharedRacial[icon.spellID] then
                    SetSharedCooldown(icon, spellID, groupInfo[guid])
                    return
                end
            elseif ns.sharedRacial[spellID] then
                if self.pvp and i < 3 and ns.sharedTrinket[icon.spellID] then
                    SetSharedCooldown(icon, spellID, groupInfo[guid])
                end
            elseif ns.resetter[spellID] then
                if ns.resetter[spellID][icon.spellID] and icon.active then
                    ResetCooldown(icon)
                end
            else
                if ns.reducer[spellID] and icon.active then
                    local reducedTime = self:FindReducedTime(icon, ns.reducer[spellID])
                    if reducedTime then
                        if groupInfo[guid].apotheosis then reducedTime = reducedTime * 4 end
                        self:UpdateCooldown(icon, groupInfo[guid].active[icon.spellID].startTime - reducedTime)
                    end
                end

                if ns.noSync[spellID] and index ~= groupInfo[ns.playerGUID].index and not ns.syncGUID[guid] and icon.active then
                    local reducedTime = self:FindReducedTime(icon, ns.noSync[spellID])
                    if reducedTime then
                        if groupInfo[guid].trueBearing then reducedTime = reducedTime * 2 end
                        self:UpdateCooldown(icon, groupInfo[guid].active[icon.spellID].startTime - reducedTime)
                    end
                end
            end
        end
    end
end

function module:UpdateDBVars()
    local size = self.size or GetNumGroupMembers()
    local k = size and (size > 5 and "raid" or size > 3 and "party") or "arena"
    self.db_anchor = db[k].anchor
    self.db_attach = db[k].attach
    self.db_growLeft = find(self.db_anchor, "RIGHT")
    self.db_offsetX = db[k].offsetX
    self.db_offsetY = db[k].offsetY
    self.db_columns = db[k].columns
    self.db_growUpward = db[k].growUpward
    self.db_displayInactive = db[k].displayInactive

    self.playerDisabled = not self.test and not db.player
    if self.unitFrames.enabled then
        self.unitFrames.active = db.uf == "auto" and self.unitFrames.prio or db.uf
    end
end

function module:Refresh(full)
    db = OmniCD.db.profile[modname]

    self:UpdateDBVars()

    if full then
        if self.db_scale ~= db.scale then
            self:ConfirmReload(ns.STRINGS.ICN_SCALE_CHANGED)
        end
        self.db_scale = db.scale

        OmniCD:UpdateEnabledIDs(self)
        self:OnEnteringWorld(_, true)
    else
        self:UpdateBars()
        self:UpdateBarPosition()
    end
end

function module.ResetGroupInfo()
    for guid in pairs(groupInfo) do
        if guid == ns.playerGUID then
            groupInfo[ns.playerGUID].index = 5
            groupInfo[ns.playerGUID].unit = "player"
        else
            groupInfo[guid] = nil
        end
    end
    wipe(inspectQuery)
    wipe(ns.inspectPending)
    wipe(ns.syncGUID)
    wipe(ns.totemGUID)
end

function module:OnEnteringWorld(_, refresh, test)
    if not refresh and self.test then self:Test() end
    self.zone = OmniCD.zone
    self.isArena = OmniCD.isArena

    local disabled = self.disabledZone
    self.disabledZone = not self.test and not db.visibility[self.zone]
    if not self.disabledZone then
        if self.zone == "none" then
            self.pvp = C_PvP_IsWarModeDesired()
            OmniCD.EnlistEvent(self, "PLAYER_FLAGS_CHANGED")
            OmniCD.DelistEvent(self, "CHALLENGE_MODE_START")
        else
            if self.zone == "arena" or self.zone == "pvp" then
                self.pvp = true
                self.ResetAllIcons()
                self:RegisterEvent("PLAYER_REGEN_DISABLED")
                self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
            else
                self.pvp = false
                if self.zone == "party" then
                    OmniCD.EnlistEvent(self, "CHALLENGE_MODE_START")
                end
            end
            OmniCD.DelistEvent(self, "PLAYER_FLAGS_CHANGED")
        end
    elseif not disabled then
        OmniCD.DelistEvent(self, "PLAYER_FLAGS_CHANGED")
        OmniCD.DelistEvent(self, "CHALLENGE_MODE_START")
    end

    self:GROUP_ROSTER_UPDATE(_, true, test)
end

do
    local tempGroup = {}
    local lastGroup = {}

    function module:GROUP_ROSTER_UPDATE(_, force, test)
        local size = self.size or 0
        self.size = GetNumGroupMembers()


        local disabled = self.disabled
        self.disabled = not self.test and ( self.size == 0 or not db.visibility[self.zone] or
            (GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) == 0 and not db.visibility.finder) or
            (self.size > db.visibility.size) or
            (self.size > 5 and self.unitFrames.enabled)
        )
        if disabled ~= self.disabled then
            if self.disabled then
                if Comms:IsEnabled() then Comms:Disable() end
                if Modifier:IsEnabled() then Modifier:Disable() end
                self.ResetGroupInfo()
                local n = #partyBars
                for i = 1, n do
                    local bar = partyBars[i]
                    bar:Hide()
                end
                wipe(lastGroup)
            else
                if not Comms:IsEnabled() then Comms:Enable() end
                if not Modifier:IsEnabled() then Modifier:Enable() end
            end
        end
        if self.disabled then return end

        local isInRaid = self.isInRaid
        self.isInRaid = IsInRaid()

        tempGroup = {}
        for i = 1, self.size do
            local name, _,_,_,_,_, zone = GetRaidRosterInfo(i)
            if not name then
                C_Timer_After(0.5, function() self:GROUP_ROSTER_UPDATE() end)
                return
            else
                tempGroup[#tempGroup + 1] = name
            end
        end
        if not force and isInRaid == self.isInRaid and OmniCD.IsTableExact(tempGroup, lastGroup) then return end
        lastGroup = tempGroup


        for i = 1, self.size do
            local index = not self.isInRaid and i == self.size and 5 or i
            local unit = self.isInRaid and raidIndex[i] or partyIndex[index]
            local guid = UnitGUID(unit)
            if not groupInfo[guid] then
                local _, class = UnitClass(unit)
                local _,_, race = UnitRace(unit)
                local name = GetUnitName(unit, true)
                groupInfo[guid] = {
                    index = index,
                    raceID = race,
                    class = class,
                    unit = unit,
                    name = name
                }
                inspectQuery[#inspectQuery + 1] = guid
            else
                groupInfo[guid].index = index
                groupInfo[guid].unit = unit
            end
        end
        if size > self.size then
            for guid, v in pairs(groupInfo) do
                if not UnitExists(v.name) then
                    groupInfo[guid] = nil
                    ns.syncGUID[guid] = nil
                end
            end
        end

        local delay = 0
        if self.unitFrames.enabled then
            delay = ((test or self.unitFrames.active == "blizz") and 0) or
                    (self.unitFrames.active == "VUHDO_RAID" and 5) or 1
        end
        C_Timer_After(delay,
            function()
                self:UpdateDBVars()
                self:UpdateBars()
                self:UpdateBarPosition()
                Comms:EnqueueInspect(force)
                Comms.RequestSync()
            end
        )
    end
end

function module:CHAT_MSG_BG_SYSTEM_NEUTRAL(_, arg1)
    if self.disabled then return end
    if find(arg1, "!") then
        Comms:EnqueueInspect(true)
    end
end

function module:PLAYER_REGEN_DISABLED()
    self:UnregisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
    self:UnregisterEvent("PLAYER_REGEN_DISABLED")
end

function module:PLAYER_FLAGS_CHANGED()
    if InCombatLockdown() then return end
    local pvp = self.pvp
    self.pvp = C_PvP_IsWarModeDesired()
    if pvp ~= self.pvp then
        self:UpdateBars()
        Comms:EnqueueInspect(true)
    end
end

function module:CHALLENGE_MODE_START()
    OmniCD.DelistEvent(self, "CHALLENGE_MODE_START")
    self.ResetAllIcons()
    Comms:EnqueueInspect(true)
end

do
    local dialog

    ns.STRINGS = {
        UI_SCALE_CHANGED = L["UI Scale Changed."],
        ICN_SCALE_CHANGED = L["Icon Scale Changed."],
    }

    StaticPopupDialogs["OMNICD_RELOAD_UI"] = {
        text = L["Pixel Perfect ON"]..": %s\n"..L["Reload UI?"],
        OnAccept = function() ReloadUI(); end,
        button1 = ACCEPT,
        button2 = CANCEL,
        timeout = 0,
        whileDead = true,
        hideOnEscape = false,
        preferredIndex = STATICPOPUP_NUMDIALOGS
    }

    function module:ConfirmReload(data)
        if db.displayBorder and db.pixelPerfect and not db.disableReloadPopup and not db.autoScale then
            data = data or ""
            dialog = StaticPopup_Show("OMNICD_RELOAD_UI", data)
            dialog:SetFrameStrata("TOOLTIP")
        end
    end
end

do
    function module:PLAYER_REGEN_ENABLED()
        self:UnregisterEvent("PLAYER_REGEN_ENABLED")
        if not self.test and self.size == 0 then
            CompactRaidFrameManager:Hide()
            CompactRaidFrameContainer:Hide()
        end
    end

    local test

    local function Flasher()
        local bar = partyBars[groupInfo[ns.playerGUID].index]
        for i = 1, bar.usedIcons do
            local icon = bar.icons[i]
            local flash = icon.flashAnim
            local newItemAnim = icon.newitemglowAnim
            if module.test then
                if (not flash:IsPlaying() and not newItemAnim:IsPlaying()) then
                    flash:Play();
                    newItemAnim:Play();
                end
            else
                if (flash:IsPlaying() or newItemAnim:IsPlaying()) then
                    flash:Stop();
                    newItemAnim:Stop();
                end
            end
        end
    end

    function module:Test(slashCommand)
        local active = self.unitFrames.active
        self.oldactive = active
        active = db.uf == "auto" and self.unitFrames.prio or db.uf

        if active == unitFrameAddons[4][1] or active == unitFrameAddons[5][1] then
            if slashCommand then OmniCD.write(L["Test Mode Disabled: Non-Blizzard party frames"]) end
            return
        end

        if InCombatLockdown() and not self.test then
            if slashCommand then OmniCD.write(ERR_NOT_IN_COMBAT) end
            return
        end

        self.test = not self.test
        self.playerDisabled = not self.test and not db.player

        if not test then
            test = CreateFrame("Frame", nil, UIParent, "OmniCDTemplate")
            test:Hide()
            test.anchor:EnableMouse(false)
            test.anchor.text:SetText(L["Test"])
            OmniCD.SetAnchorSize(test, 15)
            test.anchor.background:SetColorTexture(0, 0, 0, 0.6)
        end

        if not self.test then
            if self.size == 0 then
                if not self.unitFrames.enabled or self.oldactive == "blizz" then
                    if InCombatLockdown() then
                        self:RegisterEvent("PLAYER_REGEN_ENABLED")
                        OmniCD.write(L["Test frames will be hidden once player is out of combat"])
                    else
                        CompactRaidFrameManager:Hide()
                        CompactRaidFrameContainer:Hide()
                    end
                elseif self.oldactive == "Grid2" then
                    Grid2Options.editedTheme.layout.layouts["solo"] = self.configCache
                    Grid2Layout:ReloadLayout()
                    self.configCache = nil
                elseif self.oldactive == "VUHDO_RAID" then
                    VUHDO_CONFIG["HIDE_PANELS_SOLO"] = self.configCache
                    VUHDO_getAutoProfile()
                    self.configCache = nil
                elseif self.oldactive == "ElvUI" then
                    ElvUI[1]:GetModule("UnitFrames"):HeaderConfig(ElvUF_Party, false)
                end
            end

            test:Hide()
            Flasher()
        else
            if self.size == 0 then
                if not self.unitFrames.enabled or active == "blizz" then
                    CompactRaidFrameManager:Show()
                    CompactRaidFrameContainer:Show()
                elseif active == "Grid2" then
                    if not IsAddOnLoaded("Grid2Options") then
                        LoadAddOn("Grid2Options")
                    end
                    self.configCache = Grid2Options.editedTheme.layout.layouts["solo"]
                    if self.configCache == "None" then
                        Grid2Options.editedTheme.layout.layouts["solo"] = "By Group"
                        Grid2Layout:ReloadLayout()
                    end
                elseif active == "VUHDO_RAID" then
                    self.configCache = VUHDO_CONFIG["HIDE_PANELS_SOLO"]
                    VUHDO_CONFIG["HIDE_PANELS_SOLO"] = false
                    VUHDO_getAutoProfile()
                elseif active == "ElvUI" then
                    self.ElvConfig = true
                    ElvUI[1]:GetModule("UnitFrames"):HeaderConfig(ElvUF_Party, true)
                end
            end

            C_Timer_After(0.05, function()
                test.anchor:ClearAllPoints()
                test.anchor:SetPoint("BOTTOMLEFT", partyBars[groupInfo[ns.playerGUID].index], "TOPLEFT")
                test:Show()
                Flasher()
            end)
        end

        self:OnEnteringWorld(_, true, true)
    end
end

do
    ns.L_points = {
        ["LEFT"] = L["LEFT"],
        ["RIGHT"] = L["RIGHT"],
        ["TOPRIGHT"] = L["TOPRIGHT"],
        ["TOPLEFT"] = L["TOPLEFT"],
        ["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
        ["BOTTOMLEFT"] = L["BOTTOMLEFT"],
    }

    ns.L_zone = {
        ["arena"] = ARENA,
        ["pvp"] = BATTLEGROUNDS,
        ["party"] = DUNGEONS,
        ["raid"] = RAIDS,
        ["scenario"] = SCENARIOS,
        ["none"] = BUG_CATEGORY2,
    }

    ns.L_glows ={
        ["bags-glow-white"] = ICON_TAG_RAID_TARGET_SKULL3,
        ["bags-glow-green"] = ICON_TAG_RAID_TARGET_TRIANGLE3,
        ["bags-glow-blue"] = ICON_TAG_RAID_TARGET_SQUARE3,
        ["bags-glow-purple"] = ICON_TAG_RAID_TARGET_DIAMOND3,
        ["bags-glow-orange"] = ICON_TAG_RAID_TARGET_CIRCLE3,
        ["bags-glow-artifact"] = ICON_TAG_RAID_TARGET_STAR3,
    }

    local L_groupTypes = {
        ["arena"] = {DEFAULT, 1},
        ["party"] = {DUNGEON_DIFFICULTY_5PLAYER, 2},
        ["raid"] = {RAID_DIFFICULTY_40PLAYER, 3},
    }

    local setter = function(info, value)
        local k = info[#info-1]
        local option = info[#info]
        db[k][option] = value
        if db[k].preset == "manual" then db[k][option.."More"] = value end
        module:Refresh()
    end

    local highlightDisabled = function() return not db.glowBuffs end

    function module:options()
        local options = {
            disabled = function(info) return info[2] and not OmniCD:GetModuleEnabled(modname) end,
            name = PARTY,
            order = 1,
            type = "group",
            get = function(info) local option = info[#info] return db[option] end,
            set = function(info, value) local option = info[#info] db[option] = value self:Refresh() end,
            args = {
                general = {
                    name = GENERAL,
                    order = 1,
                    type = "group",
                    args = {
                        test = {
                            name = L["Test"],
                            desc = L["Toggle raid-style party frame and player spell bar for testing"],
                            order = 0,
                            type = 'execute',
                            func = function() self:Test() end,
                            confirm = function()
                                local active = self.unitFrames.active
                                if active == unitFrameAddons[4][1] or active == unitFrameAddons[5][1] then
                                    return L["Test Mode Disabled: Non-Blizzard party frames"]
                                elseif InCombatLockdown() and not self.test then
                                    return L["Cannot test while in combat"]
                                end
                            end,
                        },
                        hd1 = {
                            name = "",
                            order = 1,
                            type = "header",
                        },
                        showAnchor = {
                            name = L["Show Anchor"],
                            desc = L["Show anchor with party/raid numbers"],
                            order = 2,
                            type = 'toggle',
                        },
                        player = {
                            name = L["Show Player"],
                            desc = L["Show player's spell bar"],
                            order = 3,
                            type = 'toggle',
                        },
                        tooltip = {
                            name = L["Show Tooltip"],
                            desc = L["Show spell information when you mouseover an icon"]..". "..L["Disable to make the icons click through"],
                            order = 4,
                            type = 'toggle',
                        },
                        lb1 = {
                            name = "\n\n |cffffd700"..BATTLEGROUNDS,
                            order = 5,
                            type = "description",
                            fontSize = "medium",
                        },
                        bgTrinket = {
                            name = L["Show Trinket Only"],
                            desc = L["Show pvp trinket only while in Battlegrounds"],
                            order = 6,
                            type = 'toggle',
                        },
                    }
                },
                position = {
                    name = L["Position"],
                    order = 2,
                    childGroups = "tab",
                    type = "group",
                    args = {
                        uf = {
                            hidden = function() return not self.unitFrames.enabled end,
                            name = L["Custom UI"],
                            order = 1,
                            type = "group",
                            inline = true,
                            args = {
                                uf = {
                                    name = ADDONS,
                                    desc = L["Select addon to override auto anchoring"],
                                    order = 1,
                                    type = 'select',
                                    set = function(_, value)
                                        db.uf = value
                                        if self.test then
                                            self:Test()
                                            self:Test()
                                        end
                                        self:Refresh()
                                    end,
                                    values = function() return self.unitFrames.values end,
                                },
                            },
                        }
                    }
                },
                icons = {
                    name = L["Icons"],
                    order = 3,
                    type = "group",
                    childGroups = "tab",
                    args = {
                        general = {
                            name = GENERAL,
                            order = 1,
                            type = "group",
                            args = {
                                autoScale = {
                                    name = L["Use Relative Size"],
                                    desc = L["Icon size auto adjusts as a percentage of the anchored frame height"],
                                    order = 1,
                                    type = 'toggle',
                                    set = function(_, value)
                                        db.autoScale = value
                                        if not value and db.pixelPerfect then
                                            self:ConfirmReload()
                                        end
                                        self:Refresh()
                                    end,
                                },
                                showCounter = {
                                    name = COUNTDOWN_FOR_COOLDOWNS_TEXT,
                                    desc = L["Toggle the cooldown numbers. Spells with charges only show cooldown numbers at 0 charge"],
                                    order = 2,
                                    type = 'toggle',
                                },
                                reverse = {
                                    name = L["Reverse Swipe"],
                                    desc = L["Reverse the cooldown swipe animation"],
                                    order = 3,
                                    type = 'toggle',
                                },
                                desaturateActive = {
                                    name = L["Desaturate Colors"],
                                    desc = L["Desaturate colors on active icons"],
                                    order = 4,
                                    type = 'toggle',
                                },
                                lb1 = {
                                    name = "\n",
                                    order = 5,
                                    type = "description",
                                },
                                scale = {
                                    name = L["Icon Size"],
                                    desc = L["Set the size of icons"],
                                    order = 6,
                                    type = 'range',
                                    min = 0.2, max = 2.0, step = 0.01, isPercent = true,
                                    set = function(_, value)
                                        db.scale = value
                                        self:ConfirmReload(ns.STRINGS.ICN_SCALE_CHANGED)
                                        self.db_scale = db.scale
                                        self:Refresh()
                                    end,
                                },
                                chargeScale = {
                                    name = L["Charge Size"],
                                    desc = L["Set the size of charge numbers"],
                                    order = 7,
                                    type = 'range',
                                    min = 0.5, max = 1.5, step = 0.1, isPercent = true,
                                },
                                paddingX = {
                                    name = L["Padding X"],
                                    desc = L["Set the padding space between icon columns"],
                                    order = 8,
                                    type = 'range',
                                    min = 0, max = 20, step = 1,
                                },
                                paddingY = {
                                    name = L["Padding Y"],
                                    desc = L["Set the padding space between icon rows"],
                                    order = 9,
                                    type = 'range',
                                    min = 0, max = 20, step = 1,
                                },
                                counterScale = {
                                    disabled = function() return not db.showCounter end,
                                    name = L["Counter Size"],
                                    desc = L["Set the size of cooldown numbers"],
                                    order = 10,
                                    type = 'range',
                                    isPercent = true,
                                    min = 0.1, max = 1, step = 0.1,
                                },
                                swipeAlpha = {
                                    name = L["Swipe Opacity"],
                                    desc = L["Set the opacity of swipe animations"],
                                    order = 11,
                                    type = 'range',
                                    min = 0, max = 1, step = 0.1,
                                },
                                inactiveAlpha = {
                                    name = L["Inactive Icon Opacity"],
                                    desc = L["Set the opacity of icons not on cooldown"],
                                    order = 12,
                                    type = 'range',
                                    min = 0, max = 1, step = 0.1,
                                },
                                activeAlpha = {
                                    name = L["Active Icon Opacity"],
                                    desc = L["Set the opacity of icons on cooldown"],
                                    order = 13,
                                    type = 'range',
                                    min = 0, max = 1, step = 0.1,
                                },
                            }
                        },
                        border = {
                            order = 2,
                            name = L["Border"],
                            type = "group",
                            args = {
                                displayBorder = {
                                    name = ENABLE, --COMPACT_UNIT_FRAME_PROFILE_DISPLAYBORDER,
                                    desc = L["Display custom border around icons"],
                                    order = 1,
                                    type = 'toggle',
                                },
                                pixelPerfect = {
                                    disabled = function() return not db.displayBorder or db.autoScale end,
                                    name = L["Pixel Perfect"],
                                    desc = L["Borders retain 1px width regardless of the UI scale. Need to reload the UI when the UI or icon scale changes"],
                                    order = 2,
                                    type = 'toggle',
                                    set = function(_, value)
                                        db.pixelPerfect = value
                                        self:ConfirmReload()
                                        self:Refresh()
                                    end,
                                },
                                disableReloadPopup = {
                                    disabled = function() return not db.displayBorder or db.autoScale or not db.pixelPerfect end,
                                    name = L["Disable Popup"],
                                    desc = L["Disable Reload UI confirmation when using Pixel Perfect borders"],
                                    order = 3,
                                    type = 'toggle',
                                },
                                borderColor = {
                                    disabled = function() return not db.displayBorder end,
                                    name = " "..COLOR, --" "..L["Border Color"],
                                    order = 4,
                                    type = 'color',
                                    get = function(info)
                                        local option = info[#info]
                                        return db[option].r, db[option].g, db[option].b
                                    end,
                                    set = function(info,r,g,b)
                                        local option = info[#info]
                                        db[option].r = r
                                        db[option].g = g
                                        db[option].b = b
                                        self:Refresh()
                                    end,
                                },
                            }
                        }
                    }
                },
                highlight = {
                    name = L["Highlight"],
                    order = 4,
                    type = "group",
                    args = {
                        glow = {
                            name = L["Glow Icons"],
                            desc = L["Display a glow animation around an icon when it is activated"],
                            order = 1,
                            type = "group",
                            inline = true,
                            args = {
                                glow = {
                                    order = 1,
                                    name = ENABLE,
                                    desc = L["Display a glow animation around an icon when it is activated"],
                                    type = 'toggle',
                                },
                            }
                        },
                        glowBuffTypes ={
                            name = L["Highlight Icons"],
                            order = 2,
                            get = function(info) local option = info[#info] return db.glowBuffTypes[option] end,
                            set = function(info, value) local option = info[#info] db.glowBuffTypes[option] = value self:Refresh() end,
                            type = "group",
                            inline = true,
                            args = {
                                glowBuffs = {
                                    name = ENABLE,
                                    desc = L["Highlight the icon when a buffing spell is used until the buff falls off"],
                                    order = 1,
                                    type = 'toggle',
                                    get = function() return db.glowBuffs end,
                                    set = function(_, value) db.glowBuffs = value self:Refresh() end,
                                },
                                immunity = {
                                    disabled = highlightDisabled,
                                    name = L["Immunity"],
                                    order = 2,
                                    type = 'toggle',
                                },
                                defensive = {
                                    disabled = highlightDisabled,
                                    name = L["Defensive"],
                                    order = 3,
                                    type = 'toggle',
                                },
                                offensive = {
                                    disabled = highlightDisabled,
                                    name = L["Offensive"],
                                    order = 4,
                                    type = 'toggle',
                                },
                                others = {
                                    disabled = highlightDisabled,
                                    name = OTHER,
                                    order = 5,
                                    type = 'toggle',
                                },
                            }
                        }
                    }
                },
                visibility = {
                    name = L["Visibility"],
                    order = 5,
                    type = "group",
                    get = function(info) local option = info[#info] return db.visibility[option] end,
                    set = function(info, value) local option = info[#info] db.visibility[option] = value self:Refresh(true) end,
                    args = {
                        zone = {
                            name = ZONE,
                            order = 1,
                            type = 'multiselect',
                            values = ns.L_zone,
                            get = function(_, key) return db.visibility[key] end,
                            set = function(_, key, value) db.visibility[key] = value self:Refresh(true) end,
                        },
                        groupType = {
                            name = L["Group Type"],
                            order = 2,
                            type = "group",
                            inline = true,
                            args = {
                                finder = {
                                    name = DUNGEONS_BUTTON,
                                    desc = L["Enable in automated instance groups"].." ("..LOOKING_FOR_DUNGEON_PVEFRAME..", "..SKIRMISH.."...) ",
                                    order = 1,
                                    type = 'toggle',
                                },
                            }
                        },
                        groupSize = {
                            name = L["Group Size"],
                            order = 3,
                            type = "group",
                            inline = true,
                            args = {
                                size = {
                                    name = L["Max number of group members"],
                                    order = 3,
                                    width = "double",
                                    type = 'range',
                                    min = 2, max = 40, step = 1,
                                },
                            }
                        }
                    }
                },
                priority = {
                    name = L["Priority"],
                    order = 6,
                    type = "group",
                    get = function(info) local option = info[#info] return db.priority[option] end,
                    set = function(info, value) local option = info[#info] db.priority[option] = value self:Refresh() end,
                    args = {}
                }
            }
        }

        for k, v in pairs(L_groupTypes) do
            options.args.position.args[k] = {
                name = v[1],
                order = v[2],
                type = "group",
                get = function(info) local option = info[#info] return db[k][option] end,
                set = function(info, value) local option = info[#info] db[k][option] = value self:Refresh() end,
                args = {
                    preset = {
                        name = L["Position"],
                        desc = L["Set the spell bar position"],
                        order = 1,
                        type = 'select',
                        values = {
                            TOPLEFT = L["LEFT"],
                            TOPRIGHT = L["RIGHT"],
                            manual = LFG_LIST_MORE,
                        },
                        set = function(_, value)
                            db[k].preset = value
                            if value == "TOPLEFT" then
                                db[k].anchor = "TOPRIGHT"
                                db[k].attach = value
                            elseif value == "TOPRIGHT" then
                                db[k].anchor = "TOPLEFT"
                                db[k].attach = value
                            else
                                db[k].anchor = db[k].anchorMore or "LEFT"
                                db[k].attach = db[k].attachMore or "LEFT"
                            end
                            self:Refresh()
                        end,
                    },
                    displayInactive = {
                        name = L["Display Inactive Icons"],
                        desc = L["Display icons not on cooldown"],
                        order = 2,
                        type = 'toggle',
                    },
                    anchor = {
                        disabled = function() return db[k].preset ~= "manual" end,
                        name = L["Anchor Point"],
                        desc = L["Set the anchor point on the spell bar"].."\n\n|TInterface\\FriendsFrame\\InformationIcon:14:14:0:0|t "..L["Having \"RIGHT\" in the anchor point, icons grow left, otherwise right"],
                        order = 3,
                        type = 'select',
                        set = setter,
                        values = ns.L_points,
                    },
                    attach = {
                        disabled = function() return db[k].preset ~= "manual" end,
                        name = L["Attachment Point"],
                        desc = L["Set the anchor attachment point on the party/raid frame"],
                        order = 4,
                        type = 'select',
                        set = setter,
                        values = ns.L_points,
                    },
                    offsetX = {
                        name = L["Offset X"],
                        order = 5,
                        type = 'range',
                        min = -1999, max = 1999, softMin = -200, softMax = 200, step = 1,
                    },
                    offsetY = {
                        name = L["Offset Y"],
                        order = 6,
                        type = 'range',
                        min = -1999, max = 1999, softMin = -200, softMax = 200, step = 1,
                    },
                    columns = {
                        name = L["Columns"],
                        desc = L["Set the number of icons per row"],
                        order = 7,
                        type = 'range',
                        min = 1, max = 100, softMax = 20, step = 1,
                    },
                    growUpward = {
                        name = L["Grow Rows Upward"],
                        desc = L["Toggle the grow direction of icon rows"],
                        order = 8,
                        type = 'toggle',
                    },
                    lb2 = {
                        hidden = function() return k == "arena" end,
                        name = "\n",
                        order = 9,
                        type = "description",
                    },
                    copy = {
                        hidden = function() return k == "arena" end,
                        name = L["Copy Default"],
                        order = 10,
                        type = 'execute',
                        func = function()
                            for option, value in pairs(db.arena) do
                                db[k][option] = value
                            end
                            self:Refresh()
                        end
                    },
                }
            }
        end

        for k, v in pairs(ns.L_type) do
            options.args.priority.args[k] = {
                name = v,
                order = 11 - defaults.priority[k],
                width = "double",
                type = 'range',
                min = 1, max = 10, step = 1,
            }
        end

        return options
    end
end
