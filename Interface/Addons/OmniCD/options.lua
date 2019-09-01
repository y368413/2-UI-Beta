local addon, ns = ...
local OmniCD = ns.OmniCD
local L = OmniCD.L

local L_type = {
    ["interrupt"] = L["Interrupts"],
    ["cc"] = L["Crowd Control"],
    ["immunity"] = L["Immunity"],
    ["defensive"] = L["Defensive"],
    ["offensive"] = L["Offensive"],
    ["others"] = OTHER,
    ["custom"] = CUSTOM
}
ns.L_type = L_type

function OmniCD:AddSpellsToOptions(k)
    for j = 1, 2 do
        local tab = j == 1 and CLASS or OTHER
        self.options.args[k].args.spells.args[tab] = {
            name = tab,
            type = "group",
            args = {}
        }

        local num = j == 1 and MAX_CLASSES or 4
        for i = 1, num do
            local class = j == 1 and CLASS_SORT_ORDER[i] or (i == 3 and "TRINKET" or (i == 2 and "RACIAL") or (i == 4 and "ESSENCES") or "ALL")
            self.options.args[k].args.spells.args[tab].args[class] = {
                icon = j == 1 and "Interface\\Icons\\ClassIcon_"..CLASS_SORT_ORDER[i] or
                    (i == 3 and "Interface\\Icons\\ability_pvp_gladiatormedallion") or
                    (i == 2 and "Interface\\Icons\\Achievement_character_human_female") or
                    (i == 4 and "Interface\\Icons\\inv_heartofazeroth") or
                    "Interface\\Icons\\inv_60pvp_trinket2d",
                name = j == 1 and LOCALIZED_CLASS_NAMES_MALE[CLASS_SORT_ORDER[i]] or (i == 3 and INVTYPE_TRINKET) or (i == 2 and RACIAL_TRAITS) or (i == 4 and AZERITE_ESSENCE_ITEM_TYPE) or ALL_CLASSES,
                type = "group",
                args = {},
            }

            for _, spell in ipairs(ns.spellList[class]) do
                local spellID = spell.spellID
                if not C_Spell.DoesSpellExist(spellID) then
                    self.db.profile[k].spells["spell"..spellID] = nil
                elseif not spell.hide then
                    local text = GetSpellInfo(spellID)
                    self.options.args[k].args.spells.args[tab].args[class].args["spell"..spellID] = {
                        name = function()
                            local _, spellIcon = GetSpellTexture(spellID)
                            return format("|T%s:20|t %s", spellIcon, text)
                        end,
                        desc = function()
                            local s = Spell:CreateFromSpellID(spellID)
                            local spellDesc = s:GetSpellDescription() or ""
                            local duration = type(spell.duration) == "number" and spell.duration or spell.duration.default
                            local id = "\n\n|cffffd700"..L["Spell ID"].."|r "..spellID

                            local ty = (j == 1 or i == 1) and "\n\n|cffffd700"..TYPE.."|r "..L_type[spell.type] or ""
                            local cd = "\n\n|cffffd700"..L["Cooldown"].."|r "..SecondsToTime(duration)
                            local charges = spell.charges and (type(spell.charges) == "number" and spell.charges or spell.charges.default)
                            local ch = charges and charges~=1 and "\n\n"..format(SPELL_MAX_CHARGES, charges) or ""
                            return spellDesc..id..ty..cd..ch
                        end,
                        width = "full",
                        type = "toggle",
                        get = function()
                            local module = self:GetModule(k)
                            return module.IsSpellEnabled(spell)
                        end,
                    }
                end
            end
        end
    end
end

local classesWithIcons = {}
local specIDs = {}

for i = 1, MAX_CLASSES do
    local class = CLASS_SORT_ORDER[i]
    classesWithIcons[class] = format("|T%s:18|t %s", "Interface\\Icons\\ClassIcon_"..class, LOCALIZED_CLASS_NAMES_MALE[class])
    for j = 1, GetNumSpecializationsForClassID(i) do
        local specID = GetSpecializationInfoForClassID(i, j)
        specIDs[#specIDs + 1] = specID
    end
end
classesWithIcons["ALL"] = format("|T%s:16|t %s", "Interface\\Icons\\inv_60pvp_trinket2d", ALL_CLASSES)

local getter = function(info)
    local spellId = info[#info-1]:gsub("spell", "")
    spellId = tonumber(spellId)
    local option = info[#info]
    return OmniCDDB.cooldowns[spellId][option].default
end

local setter = function(info, state)
    local spellId = info[#info-1]:gsub("spell", "")
    spellId = tonumber(spellId)
    local option = info[#info]
    OmniCDDB.cooldowns[spellId][option].default = state
    OmniCD:AddCustomSpells()
end

local customSpellInfo = {
    lb1 = {
        name = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            local suffix = OmniCD.BackupCooldowns[spellId] and " |cff9d9d9d("..DEFAULT..")|r\n" or " |cff33ff99("..CUSTOM..")|r\n"
            return " |cffffd700"..L["Spell ID"].."|r "..spellId..suffix
        end,
        order = 0,
        type = "description",
    },
    delete = {
        name = DELETE,
        desc = L["Default spells are reverted back to original values and removed from the list only"],
        order = 0.5,
        type = "execute",
        func = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            if not OmniCD.BackupCooldowns[spellId] then
                local class, i = OmniCD.GetClassIndexBySpellID(spellId)
                tremove(ns.spellList[class], i)

                for k, v in pairs(OmniCD.modules) do
                    if v.enabledIDs then
                        v.enabledIDs[spellId] = nil
                    end
                end
            end

            OmniCDDB.cooldowns[spellId] = nil
            OmniCD:AddCustomSpells()
            OmniCD.options.args.customSpells.args[info[#info-1]] = nil
        end,
    },
    hd1 = {
        name = "",
        order = 1,
        type = "header",
    },
    class = {
        disabled = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCD.BackupCooldowns[spellId]
        end,
        name = CLASS,
        order = 2,
        type = "select",
        values = classesWithIcons,
        set = function(info, state)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            OmniCDDB.cooldowns[spellId].spec = nil
            OmniCDDB.cooldowns[spellId].duration = { default = OmniCDDB.cooldowns[spellId].duration.default }
            OmniCDDB.cooldowns[spellId].charges = { default = OmniCDDB.cooldowns[spellId].charges.default }
            OmniCDDB.cooldowns[spellId].class = state
            OmniCD:AddCustomSpells()
        end,
    },
    type = {
        disabled = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class == "TRINKET" or OmniCDDB.cooldowns[spellId].class == "RACIAL"
        end,
        name = TYPE,
        desc = L["Set the spell type for sorting"],
        order = 3,
        type = "select",
        values = L_type,
        set = function(info, state)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            OmniCDDB.cooldowns[spellId].type = state
            OmniCD:AddCustomSpells()
        end,
    },
    duration = {
        name = L["Cooldown"],
        desc = MAXIMUM..": 999",
        order = 4,
        type = "range",
        min = 1,
        max = 999,
        softMax = 300,
        step = 1,
        get = getter,
        set = setter,
    },
    charges = {
        name = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            local value = OmniCDDB.cooldowns[spellId].charges.default
            return format(SPELL_MAX_CHARGES, value)
        end,
        order = 5,
        type = "range",
        min = 1,
        max = 10,
        step = 1,
        get = getter,
        set = setter,
    },
    lb2 = {
        name = "\n",
        order = 6,
        type = "description",
    },
    spec = {
        disabled = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return type(OmniCDDB.cooldowns[spellId].spec) == "number"
        end,
        hidden = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class == "ALL" or OmniCDDB.cooldowns[spellId].class == "TRINKET" or
                OmniCDDB.cooldowns[spellId].class == "RACIAL" or OmniCDDB.cooldowns[spellId].class == "ESSENCES"
        end,
        name = L["Talent Ability"],
        desc = L["Check this option if the spell is a talent ability to ensure proper spell detection"],
        order = 7,
        width = "full",
        type = "toggle",
        get = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return (OmniCDDB.cooldowns[spellId].spec == true) or (type(OmniCDDB.cooldowns[spellId].spec) == "number")
        end,
        set = function(info, state)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            OmniCDDB.cooldowns[spellId].spec = state
            OmniCD:AddCustomSpells()
        end,
    },
    lb3 = {
        hidden = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class ~= "ALL"
        end,
        name = "|cffffd700"..L["Trinket Items"],
        order = 8,
        type = "description",
        fontSize = "medium",
    },
    item = {
        hidden = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class ~= "ALL"
        end,
        name = L["Item ID (Optional)"],
        desc = L["Enter item ID to enable spell when the item is equipped only"],
        order = 9,
        type = "input",
        get = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].item and tostring(OmniCDDB.cooldowns[spellId].item) or ""
        end,
        set = function(info, state)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            if state == "" then
                OmniCDDB.cooldowns[spellId].item = nil
            elseif strlen(state) > 9 or not GetItemInfoInstant(state) then
                OmniCD.write(L["Invalid ID"])
                return
            else
                OmniCDDB.cooldowns[spellId].item = tonumber(state)
            end
            OmniCD:AddCustomSpells()
        end,
    },
    item2 = {
        disabled = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].item == nil
        end,
        hidden = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class ~= "ALL"
        end,
        name = L["Item ID (Optional)"].." 2",
        order = 10,
        type = "input",
        get = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].item2 and tostring(OmniCDDB.cooldowns[spellId].item2) or ""
        end,
        set = function(info, state)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            if state == "" then
                OmniCDDB.cooldowns[spellId].item2 = nil
            elseif strlen(state) > 9 or not GetItemInfoInstant(state) then
                OmniCD.write(L["Invalid ID"])
                return
            else
                OmniCDDB.cooldowns[spellId].item2 = tonumber(state)
            end
            OmniCD:AddCustomSpells()
        end,
    },
    lb4 = {
        hidden = function(info)
            local spellId = info[#info-1]:gsub("spell", "")
            spellId = tonumber(spellId)
            return OmniCDDB.cooldowns[spellId].class ~= "ALL"
        end,
        name = "\n"..L["Toggle \"Show Spell ID in Tooltips\" to retrieve item IDs"],
        order = 11,
        type = "description",
        fontSize = "small",
    },
}

do
    local getterSpecID = function(info)
        local spellId = info[#info-2]:gsub("spell", "")
        spellId = tonumber(spellId)
        local specID = info[#info-1]:gsub("spec", "")
        specID = tonumber(specID)
        local option = info[#info]
        return OmniCDDB.cooldowns[spellId][option][specID] or OmniCDDB.cooldowns[spellId][option].default
    end

    local setterSpecID = function(info, state)
        local spellId = info[#info-2]:gsub("spell", "")
        spellId = tonumber(spellId)
        local specID = info[#info-1]:gsub("spec", "")
        specID = tonumber(specID)
        local option = info[#info]
        if state == OmniCDDB.cooldowns[spellId][option].default then
            state = nil
        end
        OmniCDDB.cooldowns[spellId][option][specID] = state
        OmniCD:AddCustomSpells()
    end

    for i = 1, #specIDs do
        local specID = specIDs[i]
        local _, name, _, icon = GetSpecializationInfoByID(specID)
        customSpellInfo["spec"..specID] = {
            hidden = function(info)
                local spellId = info[#info-1]:gsub("spell", "")
                spellId = tonumber(spellId)
                local specID = info[#info]:gsub("spec", "")
                specID = tonumber(specID)
                if not specID then return end
                if OmniCDDB.cooldowns[spellId].class == "ALL" then return true end
                if OmniCDDB.cooldowns[spellId].class ~= select(6, GetSpecializationInfoByID(specID)) then return true end
            end,
            icon = icon,
            name = name,
            type = "group",
            args = {
                enabled = {
                    disabled = function(info)
                        local spellId = info[#info-2]:gsub("spell", "")
                        spellId = tonumber(spellId)
                        return (OmniCDDB.cooldowns[spellId].spec == true) or (type(OmniCDDB.cooldowns[spellId].spec) == "number")
                    end,
                    name = ENABLE,
                    desc = L["Enable spell for this specialization"],
                    order = 1,
                    type = "toggle",
                    get = function(info)
                        local spellId = info[#info-2]:gsub("spell", "")
                        spellId = tonumber(spellId)
                        local specID = info[#info-1]:gsub("spec", "")
                        specID = tonumber(specID)
                        if not OmniCDDB.cooldowns[spellId].spec then return true end
                        if type(OmniCDDB.cooldowns[spellId].spec) ~= "table" then return false end
                        for i = 1, #OmniCDDB.cooldowns[spellId].spec do
                            if OmniCDDB.cooldowns[spellId].spec[i] == specID then return true end
                        end
                    end,
                    set = function(info, state)
                        local spellId = info[#info-2]:gsub("spell", "")
                        spellId = tonumber(spellId)
                        local specID = info[#info-1]:gsub("spec", "")
                        specID = tonumber(specID)

                        if not OmniCDDB.cooldowns[spellId].spec then
                            OmniCDDB.cooldowns[spellId].spec = {}
                            for i = 1, #specIDs do
                                if OmniCDDB.cooldowns[spellId].class == select(6, GetSpecializationInfoByID(specIDs[i])) then
                                    tinsert(OmniCDDB.cooldowns[spellId].spec, specIDs[i])
                                end
                            end
                        end

                        for i = #OmniCDDB.cooldowns[spellId].spec, 1, -1 do
                            if not state and OmniCDDB.cooldowns[spellId].spec[i] == specID then
                                tremove(OmniCDDB.cooldowns[spellId].spec, i)
                                break
                            end
                        end

                        if state then
                            tinsert(OmniCDDB.cooldowns[spellId].spec, specID)
                        end

                        OmniCD:AddCustomSpells()
                    end,
                },
                hd1 = {
                    name = "",
                    order = 2,
                    type = "header",

                },
                duration = {
                    name = L["Cooldown"],
                    desc = L["Set to override the global cooldown setting for this specialization"],
                    order = 3,
                    type = "range",
                    min = 1,
                    max = 999,
                    softMax = 300,
                    step = 1,
                    get = getterSpecID,
                    set = setterSpecID,
                },
                charges = {
                    name = L["Charges"],
                    order = 4,
                    type = "range",
                    min = 1,
                    max = 10,
                    step = 1,
                    get = getterSpecID,
                    set = setterSpecID,
                },
            },
        }
    end
end

local customSpells = {
    spellId = {
        name = L["Spell ID"],
        order = 1,
        type = "input",
        set = function(info, state)
            if strlen(state) > 9 then
                OmniCD.write(L["Invalid ID"])
                return
            end

            local spellId = tonumber(state)
            local name = GetSpellInfo(spellId)
            if not spellId or not name then
                OmniCD.write(L["Invalid ID"])
                return
            end
            if OmniCDDB.cooldowns[spellId] then return end

            if spellId == 102793 or spellId == 107574 or spellId == 22842 then
                OmniCD.write(L["Cannot edit protected spell"].." |cffffd700"..name)
                return
            end

            local class, i = OmniCD.GetClassIndexBySpellID(spellId)

            if class and i then
                OmniCDDB.cooldowns[spellId] = ns.spellList[class][i]
                if type(OmniCDDB.cooldowns[spellId].duration) == "number" then
                    OmniCDDB.cooldowns[spellId].duration = { default = OmniCDDB.cooldowns[spellId].duration }
                end
                if type(OmniCDDB.cooldowns[spellId].charges) ~= "table" then
                    OmniCDDB.cooldowns[spellId].charges = { default = OmniCDDB.cooldowns[spellId].charges or 1 }
                end

            else
                local _, icon = GetSpellTexture(spellId)
                OmniCDDB.cooldowns[spellId] = { custom=true,spellID=spellId,duration={default=30},type="cc",class="ALL",icon=icon,charges={default=1} }
            end
            OmniCD:AddCustomSpells()
            OmniCD.options.args.customSpells.args["spell"..spellId] = {
                icon = GetSpellTexture(spellId),
                name = name,
                type = "group",
                args = customSpellInfo,

            }
        end,
    },
    --tooltipID = {
        --name = L["Show Spell ID in Tooltips"],
        --order = 2,
        --width = "double",
        --type = "toggle",
        --get = function() return OmniCD.db.profile.tooltipID end,
        --set = function(_, value)
            --OmniCD.db.profile.tooltipID = value
            --if value then ns.TooltipID:HookAll() else ns.TooltipID:UnHookAll() end
        --end,
    --}
}

function OmniCD:SetupOptions()
    for spellId in pairs(OmniCDDB.cooldowns) do
        customSpells["spell"..spellId] = {
            icon = GetSpellTexture(spellId),
            name = GetSpellInfo(spellId),
            type = "group",
            args = customSpellInfo,

        }
    end

    self.options = {
        name = GetAddOnMetadata(addon, "Title"),
        type = "group",
        plugins = {},
        childGroups = "tab",
        args = {
            customSpells = {
                name = L["Spell Editor"],
                order = 4,
                type = "group",
                get = function(info)
                    local option = info[#info]
                    local spellId = info[#info-1]:gsub("spell", "")
                    spellId = tonumber(spellId)
                    if not spellId then return end
                    return OmniCDDB.cooldowns[spellId][option]
                end,
                set = function(info, state)
                    local option = info[#info]
                    local spellId = info[#info-1]:gsub("spell", "")
                    spellId = tonumber(spellId)
                    OmniCDDB.cooldowns[spellId][option] = state
                    self:AddCustomSpells()
                end,
                args = customSpells,
            },
        },
    }

    for k, v in pairs(self.modules) do
        if v.options then
            self.options.args[k] = (type(v.options) == "function") and v:options() or v.options

            self.options.args[k].args.enable = {
                disabled = false,
                name = self:GetModuleEnabled(k) and DISABLE or ENABLE,
                desc = L["Toggle module on and off"],
                order = 0,
                type = "execute",
                func = function()
                    local enabled = self:GetModuleEnabled(k)
                    self:SetModuleEnabled(k, not enabled)
                    self.db.profile[k].enable = not self.db.profile[k].enable
                    self.options.args[k].args.enable.name = self:GetModuleEnabled(k) and DISABLE or ENABLE
                    if not enabled then v:Refresh(true) end
                end,
            }
        end

        if v.enabledIDs then
            self.options.args[k].args.spells = {
                name = SPELLS,
                order = -1,
                type = "group",
                set = function(info, value)
                    local option = info[#info]
                    local spellId = option:gsub("spell", "")
                    spellId = tonumber(spellId)
                    self.db.profile[k].spells[option] = value
                    if value then
                        v.enabledIDs[spellId] = true
                    else
                        v.enabledIDs[spellId] = nil
                    end
                    v:Refresh()
                end,
                childGroups = "tab",
                args = {
                    uncheck = {
                        name = CLEAR_ALL,
                        order = 1,
                        type = "execute",
                        func = function()
                            for option in pairs(self.db.profile[k].spells) do
                                if option:match("^spell") then
                                    self.db.profile[k].spells[option] = nil
                                end
                            end
                            self.db.profile[k].noDefault = true
                            wipe(v.enabledIDs)
                            v:Refresh()
                        end,
                        confirm = function() return L["All user set values will be lost. Do you want to proceed?"] end,
                    },
                    default = {
                        name = RESET_TO_DEFAULT,
                        order = 2,
                        type = "execute",
                        func = function()
                            for option in pairs(self.db.profile[k].spells) do
                                if option:match("^spell") then
                                    self.db.profile[k].spells[option] = nil
                                end
                            end
                            self.db.profile[k].noDefault = nil
                            self:UpdateEnabledIDs(v)
                            v:Refresh()
                        end,
                        confirm = function() return L["All user set values will be lost. Do you want to proceed?"] end,
                    },
                },
            }

            self:AddSpellsToOptions(k)
        end
    end

    --self.options.plugins.profiles = { profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) }

    local LibDualSpec = LibStub('LibDualSpec-1.0')
    LibDualSpec:EnhanceDatabase(self.db, "OmniCDDB")
    --LibDualSpec:EnhanceOptions(self.options.plugins.profiles.profiles, self.db)

    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(addon, self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon, L["OmniCD"])
end
