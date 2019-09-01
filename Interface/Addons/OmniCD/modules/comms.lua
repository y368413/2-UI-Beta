local _, ns = ...
local OmniCD = ns.OmniCD
local module = OmniCD:NewModule("Comms", "AceEvent-3.0")

local _G, next, pairs, tonumber = _G, next, pairs, tonumber
local find, match, concat, wipe = string.find, string.match, table.concat, wipe
local C_AzeriteEmpoweredItem_IsAzeriteEmpoweredItemByID = C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID
local C_ChatInfo_SendAddonMessage = C_ChatInfo.SendAddonMessage
local C_SpecializationInfo_GetInspectSelectedPvpTalent = C_SpecializationInfo.GetInspectSelectedPvpTalent
local C_SpecializationInfo_GetPvpTalentSlotInfo = C_SpecializationInfo.GetPvpTalentSlotInfo
local CanInspect = CanInspect
local ClearInspectPlayer = ClearInspectPlayer
local GetInspectSpecialization = GetInspectSpecialization
local GetItemInfoInstant = GetItemInfoInstant
local GetNumGroupMembers = GetNumGroupMembers
local GetPvpTalentInfoByID = GetPvpTalentInfoByID
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfo = GetTalentInfo
local GetTime = GetTime
local IsInRaid = IsInRaid
local NotifyInspect = NotifyInspect
local strjoin, strsplit = strjoin, strsplit
local UnitAffectingCombat, UnitGUID, UnitIsConnected, UnitPower = UnitAffectingCombat, UnitGUID, UnitIsConnected, UnitPower
local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME

local groupInfo = ns.groupInfo
local partyBars = ns.partyBars
local Party = OmniCD:GetModule("Party")

local playerNameWithServer
local onUpdateHandler = CreateFrame("Frame")
local syncGUID = {}
local inspectPending = {}
ns.syncGUID = syncGUID
ns.inspectPending = inspectPending

local POWER_TYPE_CLASS = {
    DEATHKNIGHT = true,
    HUNTER = true,
    MONK = true,
    PALADIN = true,
    ROGUE = true,
    WARRIOR = true,
}

local PREFIX_RQST = "request"
local PREFIX_SPEC = "spec"
local PREFIX_POWR = "power"

function module:OnInitialize()
    self:SetEnabledState(false)
end

function module:OnEnable()
    if POWER_TYPE_CLASS[ns.playerClass] then
        if UnitAffectingCombat("player") then
            self:PLAYER_REGEN_DISABLED()
        else
            self:RegisterEvent("PLAYER_REGEN_DISABLED")
        end
    end
    self:RegisterEvent("CHAT_MSG_ADDON")
    self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
    self:RegisterEvent("AZERITE_ESSENCE_UPDATE")
    playerNameWithServer = ns.playerName.."-"..GetRealmName()
end

function module:OnDisable()
    self.isRegistered = nil
    onUpdateHandler:SetScript("OnUpdate", nil)
    wipe(syncGUID)
    wipe(inspectPending)
end

local function UpdateTalentIDs(guid)
    if not groupInfo[guid].talentIDs then
        groupInfo[guid].talentIDs = {}
    else
        wipe(groupInfo[guid].talentIDs)
    end
    for i = 1, 14 do
        local talentID = groupInfo[guid].talents[i]
        groupInfo[guid].talentIDs[talentID] = (i > 7 and i < 12) and 1 or 0
    end
end

local function UpdateSlotIDs(guid)
    if not groupInfo[guid].slotIDs then
        groupInfo[guid].slotIDs = {}
    else
        wipe(groupInfo[guid].slotIDs)
    end
    local n = #groupInfo[guid].slots
    for i = 1, n do
        local itemID = groupInfo[guid].slots[i]
        if itemID > 0 then
            groupInfo[guid].slotIDs[itemID] = true
            if i == 3 then
                local rank1 = ns.essRanked[itemID]
                if rank1 then
                    groupInfo[guid].slotIDs[rank1] = true
                end
            elseif i == n then
                groupInfo[guid].slotIDs["mult"] = itemID
            end
        end
    end
end

function module:ShutdownInspect()
    if self.isRegistered then
        onUpdateHandler:SetScript("OnUpdate", nil)
        self:UnregisterEvent("INSPECT_READY")
        self.isRegistered = false
    end
end

do
    local elapsed_time = 0

    local function Comm_OnUpdate(self, elapsed)
        elapsed_time = elapsed_time + elapsed
        if elapsed_time > 1 then
            module:SendNotifyInspect()
            elapsed_time = 0
        end
    end

    function module:EnqueueInspect(force, guid)
        local addedTime = GetTime()
        if guid then
            inspectPending[guid] = addedTime
        else
            for i = 1, #ns.inspectQuery do
                local guid = ns.inspectQuery[i]
                inspectPending[guid] = addedTime
                ns.inspectQuery[i] = nil
            end
        end

        if force then
            for i = 1, GetNumGroupMembers() do
                local unit = IsInRaid() and ns.raidIndex[i] or ns.partyIndex[i]
                local guid = UnitGUID(unit)
                if guid and guid ~= ns.playerGUID then
                    inspectPending[guid] = addedTime
                end
            end
        end

        if next(inspectPending) and not self.isRegistered then
            onUpdateHandler:SetScript("OnUpdate", Comm_OnUpdate)
            self:RegisterEvent("INSPECT_READY")
            self.isRegistered = true
        end
    end
end

do
    local next_inspection = 0

    function module:SendNotifyInspect()
        if InspectFrame and InspectFrame:IsShown() then return end
        local time = GetTime()
        if time < next_inspection then return end

        if next(inspectPending) == nil then
            self:ShutdownInspect()
            return
        end

        if not Party.isArena and Party.zone ~= "party" then
            next_inspection = time + 2
        end

        for guid, addedTime in pairs(inspectPending) do
            if groupInfo[guid] then
                local unit = groupInfo[guid].unit
                if unit and UnitIsConnected(unit) and CanInspect(unit) then
                    NotifyInspect(unit)
                    return
                elseif (time - addedTime) > 300 then
                    inspectPending[guid] = nil
                end
            else
                if (time - addedTime) > 10 then
                    inspectPending[guid] = nil
                end
            end
        end
    end
end

local INVSLOTS = {
    13, --INVSLOT_TRINKET1
    14, --INVSLOT_TRINKET2
    2,  --INVSLOT_NECK
    1,  --INVSLOT_HEAD
    3,  --INVSLOT_SHOULDER
    5,  --INVSLOT_CHEST
}

local inspectTooltip = CreateFrame("GameTooltip", "OmniCDItemSlotToolTip", nil, "GameTooltipTemplate")
inspectTooltip:SetOwner(UIParent, "ANCHOR_NONE")

do
    function module.InspectUnit(guid)
        local inspectInfo = groupInfo[guid]
        if not inspectInfo then return end

        local inspect = guid ~= ns.playerGUID
        local unit = inspectInfo.unit
        local specID
        if not inspect then
            local specIndex = GetSpecialization()
            if specIndex then
                specID = GetSpecializationInfo(specIndex)
            end
        else
            specID = GetInspectSpecialization(unit)
        end

        if specID and specID > 0 then
            inspectInfo.spec = specID

            inspectInfo.talents = inspectInfo.talents or {}
            local c = 1
            local talentID
            for i = 1, 7 do
                talentID = nil
                for j = 1, 3 do
                    local _,_,_, selected, _, spellID = GetTalentInfo(i, j, 1, inspect, unit)
                    if selected then
                        talentID = spellID
                        break
                    end
                end

                inspectInfo.talents[c] = talentID or 0
                c = c + 1
            end

            for i = 1, 7 do
                talentID = nil
                if inspect then
                    talentID = C_SpecializationInfo_GetInspectSelectedPvpTalent(unit, i)
                else
                    local slotInfo = C_SpecializationInfo_GetPvpTalentSlotInfo(i)
                    talentID = slotInfo and slotInfo.selectedTalentID
                end
                if talentID then
                    local _,_,_,_,_, spellID = GetPvpTalentInfoByID(talentID)
                    inspectInfo.talents[c] = spellID
                else
                    inspectInfo.talents[c] = 0
                end

                c = c + 1
            end

            inspectInfo.slots = inspectInfo.slots or {}
            c = 12
            local ITEM_LEVEL = gsub(ITEM_LEVEL,"%%d","(%%d+)")
            local numSlots = #INVSLOTS
            for i = 1, numSlots do
                inspectInfo.slots[i] = 0

                local slotID = INVSLOTS[i]
                local hasItem = inspectTooltip:SetInventoryItem(unit, slotID)
                if hasItem then
                    local _, itemLink = inspectTooltip:GetItem()
                    local itemID = GetItemInfoInstant(itemLink)

                    if i < 3 then
                        inspectInfo.slots[i] = itemID
                    else
                        local IsAzeriteEmpowered
                        local IsHeartOfAzeroth
                        if i == 3 then
                            IsHeartOfAzeroth = itemID == 158075
                        else
                            IsAzeriteEmpowered = C_AzeriteEmpoweredItem_IsAzeriteEmpoweredItemByID(itemLink)
                        end

                        for j = 2, inspectTooltip:NumLines() do
                            local tooltipLine = _G["OmniCDItemSlotToolTipTextLeft"..j]
                            local text = tooltipLine:GetText()
                            if text and text ~= "" then

                                if IsAzeriteEmpowered then
                                    if inspectInfo.slots[i] > 0 then break end
                                    if j > 10 and text:find("^-") == 1 then
                                        for _,v in pairs(ns.azeriteModifier) do
                                            if text:find(v.name.."$") == 3 then
                                                inspectInfo.slots[i] = v.azeriteID
                                                break
                                            end
                                        end
                                    end
                                elseif IsHeartOfAzeroth then
                                    if c > 14 then break end
                                    local ilvl
                                    if j == 2 then
                                        ilvl = text:match(ITEM_LEVEL)
                                        if ilvl then
                                            ilvl = tonumber(ilvl)
                                        end
                                    elseif j > 10 then
                                        for k=1,#ns.essInfo do
                                            if text:find(ns.essInfo[k].name.."$") == 1 then
                                                local r,g,b = tooltipLine:GetTextColor()
                                                local rank = 3
                                                if r == 0 then
                                                    rank = 2
                                                elseif r > .9 then
                                                    rank = 4
                                                elseif b == 0 then
                                                    rank = 1
                                                end

                                                local isMajor = _G["OmniCDItemSlotToolTipTextLeft"..(j-1)]:GetText() == " "
                                                if isMajor then
                                                    local id = ns.essInfo[k][rank]
                                                    inspectInfo.slots[i] = id
                                                    if ns.essConflict[id] then
                                                        local essTalent = ns.essTalentsBySpec[specID]
                                                        if essTalent then
                                                            inspectInfo.talents[c] = essTalent
                                                        end
                                                    end
                                                end

                                                local id = ns.essInfo[k][-rank]
                                                if ns.essStrive[id] and ilvl then
                                                    local mult = (90.1 - ((ilvl-399)*0.15)) / 100
                                                    mult = max(0.8, min(0.9, mult))
                                                    inspectInfo.slots[numSlots+1] = mult
                                                    inspectInfo.talents[c] = id
                                                end

                                                c = c + 1
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            UpdateTalentIDs(guid)
            UpdateSlotIDs(guid)

            if inspect then
                inspectPending[guid] = nil
                ClearInspectPlayer()
                Party:UpdateUnitBar(inspectInfo.index)
            end
        end
    end

    function module:INSPECT_READY(_, guid)
        if guid == ns.playerGUID then return end
        self.InspectUnit(guid)
    end
end

local function CheckPowerType(pIndex, spentPower)
    local bar = partyBars[pIndex]
    local guid = bar.guid
    for i = 1, bar.usedIcons do
        local icon = bar.icons[i]
        if icon.active and ns.sync[icon.spellID] then
            local reducedTime = Party:FindReducedTime(icon, ns.sync[icon.spellID])
            if reducedTime then
                reducedTime = reducedTime * spentPower
                if groupInfo[guid].trueBearing then reducedTime = reducedTime * 2 end
                Party:UpdateCooldown(icon, groupInfo[guid].active[icon.spellID].startTime - reducedTime, groupInfo[guid].active[icon.spellID].duration)
            end
        end
    end
end

local function SendComm(...)
    C_ChatInfo_SendAddonMessage("OmniCD", strjoin(",", ...), "PARTY")
end

function module.RequestSync()
    wipe(syncGUID)
    if GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) == 0 then return end
    SendComm(PREFIX_RQST, ns.playerGUID)
end

function module:CHAT_MSG_ADDON(_, prefix, message, dist, sender)
    if prefix == "OmniCD" and dist == "PARTY" and sender ~= playerNameWithServer then
        self:OnCommReceived(strsplit(",", message, 2))
    end
end

function module:SendCharacterInfo(specChange)
    if not specChange then self.InspectUnit(ns.playerGUID) end
    local talents = concat(groupInfo[ns.playerGUID].talents, ",")
    local slots = concat(groupInfo[ns.playerGUID].slots, ",")
    SendComm(PREFIX_SPEC, ns.playerGUID, groupInfo[ns.playerGUID].spec, talents, slots)
end

function module:OnCommReceived(prefix, message)
    if prefix == PREFIX_POWR then
        local guid, spentPower = match(message, "(.+),(.+)")
        if syncGUID[guid] then
            CheckPowerType(syncGUID[guid], spentPower)
        end
    elseif prefix == PREFIX_SPEC then
        local s, e, v = 1
        local k, guid = 0
        while true do
            s, e, v = find(message, "([^,]+)", s)
            if s == nil then break end
            s = e + 1
            k = k + 1
            if k > 16 then
                groupInfo[guid].slots = groupInfo[guid].slots or {}
                groupInfo[guid].slots[k-16] = tonumber(v)
            elseif k > 2 then
                groupInfo[guid].talents = groupInfo[guid].talents or {}
                groupInfo[guid].talents[k-2] = tonumber(v)
            elseif k == 2 then
                groupInfo[guid].spec = tonumber(v)
            elseif k == 1 then
                guid = v
                if not groupInfo[guid] then return end
                syncGUID[guid] = groupInfo[guid].index
            end
        end

        inspectPending[guid] = nil

        UpdateSlotIDs(guid)
        UpdateTalentIDs(guid)
        Party:UpdateUnitBar(syncGUID[guid])
    elseif prefix == PREFIX_RQST then
        self:SendCharacterInfo()
    end
end

do
    local POWER_TYPES = {
        RUNIC_POWER = 6,
        FOCUS = 2,
        CHI = 12,
        HOLY_POWER = 9,
        COMBO_POINTS = 4,
        RAGE = 1,
    }

    local previous_power = 0

    function module:UNIT_POWER_UPDATE(_, unit, powerType)
        if unit ~= "player" or not POWER_TYPES[powerType] then return end
        local power = UnitPower(unit, POWER_TYPES[powerType])
        if power < previous_power then
            local spent = previous_power - power
            if not Party.playerDisabled then
                CheckPowerType(groupInfo[ns.playerGUID].index, spent)
            end
            if next(syncGUID) then
                SendComm(PREFIX_POWR, ns.playerGUID, spent)
            end
        end

        previous_power = power
    end

    function module:PLAYER_REGEN_ENABLED()
        self:UnregisterEvent("UNIT_POWER_UPDATE")
        self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end

    function module:PLAYER_REGEN_DISABLED()
        self:RegisterEvent("UNIT_POWER_UPDATE")
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
    end
end

local function UpdatePlayerInfo()
    module.InspectUnit(ns.playerGUID)
    if not Party.playerDisabled then
        Party:UpdateUnitBar(groupInfo[ns.playerGUID].index)
    end
    if next(syncGUID) then
        module:SendCharacterInfo(true)
    end
end

function module:AZERITE_ESSENCE_UPDATE()
    UpdatePlayerInfo()
end

function module:PLAYER_SPECIALIZATION_CHANGED(_, unit)
    if unit == "player" then
        UpdatePlayerInfo()
    elseif not Party.isInRaid and ns.partyUnits[unit] or (Party.isInRaid and ns.raidUnits[unit]) then
        if not UnitIsConnected(unit) then return end
        local guid = UnitGUID(unit)
        if Party.isInRaid and guid == ns.playerGUID then return end
        self:EnqueueInspect(nil, guid)
    end
end

do
    local validSlotIDs = {}
    for i = 1, 6 do
        local slotID = INVSLOTS[i]
        validSlotIDs[slotID] = true
    end

    local previous_event = 0

    function module:PLAYER_EQUIPMENT_CHANGED(_, slotID)
        if not validSlotIDs[slotID] then return end
        local time = GetTime()
        if time - previous_event < 0.05 then return end
        UpdatePlayerInfo()
        previous_event = time
    end
end
