local BattleForAzerothTreasures = {}

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_BattleForAzerothTreasures", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes", true)
BattleForAzerothTreasures_HL = HL

local next = next
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes
local GetItemInfo = GetItemInfo
local GetAchievementInfo = GetAchievementInfo
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo
local GetAchievementCriteriaInfoByID = GetAchievementCriteriaInfoByID
local GetCurrencyInfo = GetCurrencyInfo

local ARTIFACT_LABEL = '|cffff8000' .. ARTIFACT_POWER .. '|r'

local cache_tooltip = CreateFrame("GameTooltip", "HNBattleTreasuresTooltip")
cache_tooltip:AddFontStrings(
    cache_tooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
    cache_tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
)
local name_cache = {}
local function mob_name(id)
    if not name_cache[id] then
        -- this doesn't work with just clearlines and the setowner outside of this, and I'm not sure why
        cache_tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
        cache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
        if cache_tooltip:IsShown() then
            name_cache[id] = HNBattleTreasuresTooltipTextLeft1:GetText()
        end
    end
    return name_cache[id]
end

local default_texture, npc_texture, follower_texture, currency_texture, junk_texture
local icon_cache = {}
local trimmed_icon = function(texture)
    if not icon_cache[texture] then
        icon_cache[texture] = {
            icon = texture,
            tCoordLeft = 0.1,
            tCoordRight = 0.9,
            tCoordTop = 0.1,
            tCoordBottom = 0.9,
        }
    end
    return icon_cache[texture]
end

local atlas_texture = function(atlas, scale)
    local texture, _, _, left, right, top, bottom = GetAtlasInfo(atlas)
    return {
        icon = texture,
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
        scale = scale or 1,
    }
end
local function work_out_label(point)
    local fallback
    if point.label then
        return point.label
    end
    if point.achievement then
        if point.criteria then
            local criteria = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
            if criteria then
                return criteria
            end
            fallback = 'achievement:'..point.achievement..'.'..point.criteria
        end
        local _, achievement = GetAchievementInfo(point.achievement)
        if achievement then
            return achievement
        end
        fallback = point.achievement
    end
    if point.follower then
        local follower = C_Garrison.GetFollowerInfo(point.follower)
        if follower then
            return follower.name
        end
        fallback = 'follower:'..point.follower
    end
    if point.npc then
        local name = mob_name(point.npc)
        if name then
            return name
        end
        fallback = 'npc:'..point.npc
    end
    if point.item then
        local _, link, _, _, _, _, _, _, _, texture = GetItemInfo(point.item)
        if link then
            return link
        end
        fallback = 'item:'..point.item
    end
    if point.currency then
        if point.currency == 'ARTIFACT' then
            return ARTIFACT_LABEL
        end
        local name, _, texture = GetCurrencyInfo(point.currency)
        if name then
            return name
        end
    end
    return fallback or UNKNOWN
end
local function work_out_texture(point)
    if point.atlas then
        if not icon_cache[point.atlas] then
            icon_cache[point.atlas] = atlas_texture(point.atlas, point.scale)
        end
        return icon_cache[point.atlas]
    end
    if BattleForAzerothTreasures_db.icon_item then
        if point.item then
            local texture = select(10, GetItemInfo(point.item))
            if texture then
                return trimmed_icon(texture)
            end
        end
        if point.currency then
            if point.currency == 'ARTIFACT' then
                local texture = select(10, GetAchievementInfo(11144))
                if texture then
                    return trimmed_icon(texture)
                end
            else
                local texture = select(3, GetCurrencyInfo(point.currency))
                if texture then
                    return trimmed_icon(texture)
                end
            end
        end
        if point.achievement then
            local texture = select(10, GetAchievementInfo(point.achievement))
            if texture then
                return trimmed_icon(texture)
            end
        end
    else
        if point.currency then
            if not currency_texture then
                currency_texture = atlas_texture("VignetteLoot", 1.5)
            end
            return currency_texture
        end
    end
    if point.follower then
        if not follower_texture then
            follower_texture = atlas_texture("GreenCross", 1.5)
        end
        return follower_texture
    end
    if point.npc then
        if not npc_texture then
            npc_texture = atlas_texture("DungeonSkull", 1)
        end
        return npc_texture
    end
    if point.junk then
        if not junk_texture then
            junk_texture = atlas_texture("VignetteLoot", 1.5)
        end
        return junk_texture
    end
    if not default_texture then
        default_texture = atlas_texture("Garr_TreasureIcon", 2.6)
    end
    return default_texture
end
local get_point_info = function(point)
    if point then
        local label = work_out_label(point)
        local icon = work_out_texture(point)
        local category = "treasure"
        if point.npc then
            category = "npc"
        elseif point.junk then
            category = "junk"
        end
        return label, icon, category, point.quest, point.faction, point.scale, point.alpha or 1
    end
end
local get_point_info_by_coord = function(uiMapID, coord)
    return get_point_info(BattleForAzerothTreasures_points[uiMapID] and BattleForAzerothTreasures_points[uiMapID][coord])
end

local function handle_tooltip(tooltip, point)
    if point then
        -- major:
        tooltip:AddLine(work_out_label(point))
        if point.follower then
            local follower = C_Garrison.GetFollowerInfo(point.follower)
            if follower then
                local quality = BAG_ITEM_QUALITY_COLORS[follower.quality]
                tooltip:AddDoubleLine(REWARD_FOLLOWER, follower.name,
                    0, 1, 0,
                    quality.r, quality.g, quality.b
                )
                tooltip:AddDoubleLine(follower.className, UNIT_LEVEL_TEMPLATE:format(follower.level))
            end
        end
        if point.currency then
            local name
            if point.currency == 'ARTIFACT' then
                name = ARTIFACT_LABEL
            else
                name = GetCurrencyInfo(point.currency)
            end
            tooltip:AddDoubleLine(CURRENCY, name or point.currency)
        end
        if point.achievement then
            local _, name, _, complete = GetAchievementInfo(point.achievement)
            tooltip:AddDoubleLine(BATTLE_PET_SOURCE_6, name or point.achievement,
                nil, nil, nil,
                complete and 0 or 1, complete and 1 or 0, 0
            )
            if point.criteria then
                local criteria, _, complete = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                tooltip:AddDoubleLine(" ", criteria,
                    nil, nil, nil,
                    complete and 0 or 1, complete and 1 or 0, 0
                )
            end
        end
        if point.note then
            tooltip:AddLine(point.note, nil, nil, nil, true)
        end
        if point.quest and BattleForAzerothTreasures_db.tooltip_questid then
            local quest = point.quest
            if type(quest) == 'table' then
                quest = string.join(", ", unpack(quest))
            end
            tooltip:AddDoubleLine("QuestID", quest or UNKNOWN)
        end

        if (BattleForAzerothTreasures_db.tooltip_item or IsShiftKeyDown()) and (point.item or point.npc) then
            local comparison = ShoppingTooltip1

            do
                local side
                local rightDist = 0
                local leftPos = tooltip:GetLeft() or 0
                local rightPos = tooltip:GetRight() or 0

                rightDist = GetScreenWidth() - rightPos

                if (leftPos and (rightDist < leftPos)) then
                    side = "left"
                else
                    side = "right"
                end

                -- see if we should slide the tooltip
                if tooltip:GetAnchorType() and tooltip:GetAnchorType() ~= "ANCHOR_PRESERVE" then
                    local totalWidth = 0
                    if ( primaryItemShown  ) then
                        totalWidth = totalWidth + comparison:GetWidth()
                    end

                    if ( (side == "left") and (totalWidth > leftPos) ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), (totalWidth - leftPos), 0)
                    elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0)
                    end
                end

                comparison:SetOwner(tooltip, "ANCHOR_NONE")
                comparison:ClearAllPoints()

                if ( side and side == "left" ) then
                    comparison:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", 0, -10)
                else
                    comparison:SetPoint("TOPLEFT", tooltip, "TOPRIGHT", 0, -10)
                end
            end

            if point.item then
                comparison:SetHyperlink(("item:%d"):format(point.item))
            elseif point.npc then
                comparison:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
            end
            comparison:Show()
        end
    else
        tooltip:SetText(UNKNOWN)
    end
    tooltip:Show()
end
local handle_tooltip_by_coord = function(tooltip, uiMapID, coord)
    return handle_tooltip(tooltip, BattleForAzerothTreasures_points[uiMapID] and BattleForAzerothTreasures_points[uiMapID][coord])
end

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HLHandler = {}
local info = {}

function HLHandler:OnEnter(uiMapID, coord)
    local tooltip = self:GetParent() == WorldMapFrame:GetCanvas() and WorldMapTooltip or GameTooltip
    if self:GetCenter() > UIParent:GetCenter() then -- compare X coordinate
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end
    handle_tooltip_by_coord(tooltip, uiMapID, coord)
end

local function createWaypoint(button, uiMapID, coord)
    if TomTom then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uiMapID, x, y, {
            title = get_point_info_by_coord(uiMapID, coord),
            persistent = nil,
            minimap = true,
            world = true
        })
    end
end

local function hideNode(button, uiMapID, coord)
    BattleForAzerothTreasures_hidden[uiMapID][coord] = true
    HL:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

do
    local currentZone, currentCoord
    local function generateMenu(button, level)
        if (not level) then return end
        wipe(info)
        if (level == 1) then
            -- Create the title of the menu
            info.isTitle      = 1
            info.text         = "HandyNotes_BattleForAzerothTreasures"
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            if TomTom then
                -- Waypoint menu item
                info.text = L["Create waypoint"]
                info.notCheckable = 1
                info.func = createWaypoint
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
                wipe(info)
            end

            -- Hide menu item
            info.text         = L["Hide node"]
            info.notCheckable = 1
            info.func         = hideNode
            info.arg1         = currentZone
            info.arg2         = currentCoord
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            -- Close menu item
            info.text         = L["Close"]
            info.func         = closeAllDropdowns
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)
        end
    end
    local HL_Dropdown = CreateFrame("Frame", "HandyNotes_BattleForAzerothTreasuresDropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        -- given we're in a click handler, this really *should* exist, but just in case...
        local point = BattleForAzerothTreasures_points[currentZone] and BattleForAzerothTreasures_points[currentZone][currentCoord]
        if button == "RightButton" and not down then
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end

function HLHandler:OnLeave(uiMapID, coord)
    if self:GetParent() == WorldMapFrame:GetCanvas() then
        WorldMapTooltip:Hide()
    else
        GameTooltip:Hide()
    end
    ShoppingTooltip1:Hide()
end

do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local currentZone, isMinimap
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value and BattleForAzerothTreasures_should_show_point(state, value, currentZone, isMinimap) then
                local label, icon, _, _, _, scale, alpha = get_point_info(value)
                scale = (scale or 1) * (icon and icon.scale or 1) * BattleForAzerothTreasures_db.icon_scale
                return state, nil, icon, scale, BattleForAzerothTreasures_db.icon_alpha * alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    local function UnitHasBuff(unit, spellid)
        local buffname = GetSpellInfo(spellid)
        for i = 1, 40 do
            local name = UnitBuff(unit, i)
            if not name then
                -- reached the end, probably
                return
            end
            if buffname == name then
                return UnitBuff(unit, i)
            end
        end
    end
    function HLHandler:GetNodes2(uiMapID, minimap)
        currentZone = uiMapID
        isMinimap = minimap
        if minimap and BattleForAzerothTreasures_map_spellids[uiMapID] then
            if BattleForAzerothTreasures_map_spellids[mapFile] == true then
                return iter
            end
            if UnitHasBuff("player", BattleForAzerothTreasures_map_spellids[mapFile]) then
                return iter
            end
        end
        return iter, BattleForAzerothTreasures_points[uiMapID], nil
    end
end

---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New("HandyNotes_BattleForAzerothTreasuresDB", BattleForAzerothTreasures_defaults)
    BattleForAzerothTreasures_db = self.db.profile
    BattleForAzerothTreasures_hidden = self.db.char.hidden
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB("HandyNotes_BattleForAzerothTreasures", HLHandler, BattleForAzerothTreasures_options)

    -- watch for LOOT_CLOSED
    self:RegisterEvent("LOOT_CLOSED", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_INDOORS", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", "HandyNotes_BattleForAzerothTreasures")
end


BattleForAzerothTreasures_defaults = {
    profile = {
        show_on_world = true,
        show_on_minimap = true,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
        found = false,
        repeatable = true,
        icon_scale = 1.0,
        icon_alpha = 1.0,
        icon_item = false,
        tooltip_item = true,
        tooltip_questid = false,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

BattleForAzerothTreasures_options = {
    type = "group",
    name = "Treasures",
    get = function(info) return BattleForAzerothTreasures_db[info[#info]] end,
    set = function(info, v)
        BattleForAzerothTreasures_db[info[#info]] = v
        BattleForAzerothTreasures_HL:SendMessage("HandyNotes_NotifyUpdate", "HandyNotes_BattleForAzerothTreasures")
    end,
    args = {
        icon = {
            type = "group",
            name = L["Icon settings"],
            inline = true,
            args = {
                desc = {
                    name = L["These settings control the look and feel of the icon."],
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = L["Icon Scale"],
                    desc = L["The scale of the icons"],
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = L["Icon Alpha"],
                    desc = L["The alpha transparency of the icons"],
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = L["World Map"],
                    desc = L["Show icons on world map"],
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = L["Minimap"],
                    desc = L["Show icons on the minimap"],
                    order = 50,
                },
            },
        },
        display = {
            type = "group",
            name = L["What to display"],
            inline = true,
            args = {
                icon_item = {
                    type = "toggle",
                    name = L["Use item icons"],
                    desc = L["Show the icons for items, if known; otherwise, the achievement icon will be used"],
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = L["Use item tooltips"],
                    desc = L["Show the full tooltips for items"],
                    order = 10,
                },
                found = {
                    type = "toggle",
                    name = L["Show found"],
                    desc = L["Show waypoints for items you've already found?"],
                    order = 20,
                },
                show_npcs = {
                    type = "toggle",
                    name = L["Show NPCs"],
                    desc = L["Show rare NPCs to be killed, generally for items or achievements"],
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = L["Show treasure"],
                    desc = L["Show treasure that can be looted"],
                    order = 30,
                },
                show_junk = {
                    type = "toggle",
                    name = L["Junk"],
                    desc = L["Show items which don't count for any achievement"],
                    order = 40,
                },
                -- repeatable = {
                --     type = "toggle",
                --     name = "Show repeatable",
                --     desc = "Show items which are repeatable? This generally means ones which have a daily tracking quest attached",
                --     order = 40,
                -- },
                tooltip_questid = {
                    type = "toggle",
                    name = L["Show quest ids"],
                    desc = L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."],
                    order = 40,
                },
                unhide = {
                    type = "execute",
                    name = L["Reset hidden nodes"],
                    desc = L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."],
                    func = function()
                        for map,coords in pairs(BattleForAzerothTreasures_hidden) do
                            wipe(coords)
                        end
                        BattleForAzerothTreasures_HL:Refresh()
                    end,
                    order = 50,
                },
            },
        },
    },
}

local allQuestsComplete = function(quests)
    if type(quests) == 'table' then
        -- if it's a table, only count as complete if all quests are complete
        for _, quest in ipairs(quests) do
            if not IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    elseif IsQuestFlaggedCompleted(quests) then
        return true
    end
end

local player_faction = UnitFactionGroup("player")
local player_name = UnitName("player")
BattleForAzerothTreasures_should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not BattleForAzerothTreasures_db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not BattleForAzerothTreasures_db.show_on_world then
        return false
    end
    --if point.level and point.level ~= currentLevel then
        --return false
    --end
    if BattleForAzerothTreasures_hidden[currentZone] and BattleForAzerothTreasures_hidden[currentZone][coord] then
        return false
    end
    if BattleForAzerothTreasures_outdoors_only and IsIndoors() then
        return false
    end
    if point.junk and not BattleForAzerothTreasures_db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not BattleForAzerothTreasures_db.found) then
        if point.quest then
            if allQuestsComplete(point.quest) then
                return false
            end
        elseif point.achievement then
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if completedByMe then
                return false
            end
            if point.criteria then
                local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                if completed and completedBy == player_name then
                    return false
                end
            end
        end
        if point.follower and C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        if point.toy and point.item and PlayerHasToy(point.item) then
            return false
        end
    end
    -- if (not BattleForAzerothTreasures_db.repeatable) and point.repeatable then
    --     return false
    -- end
    if not point.follower then
        if point.npc then
            if not BattleForAzerothTreasures_db.show_npcs then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not BattleForAzerothTreasures_db.show_treasure then
                return false
            end
        end
    end
    if point.hide_before and not BattleForAzerothTreasures_db.upcoming and not allQuestsComplete(point.hide_before) then
        return false
    end
    return true
end


local merge = function(t1, t2)
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        t1[k] = v
    end
end
BattleForAzerothTreasures_merge = merge

local AZERITE = 1553
local CHEST = 'Treasure Chest'
local CHEST_SM = 'Small Treasure Chest'
local CHEST_GLIM = 'Glimmering Treasure Chest'

local path_meta = {__index = {
    label = "Path to treasure",
    atlas = "map-icon-SuramarDoor.tga", -- 'PortalPurple'
    path = true,
    scale = 1.1,
}}
local path = function(details)
    return setmetatable(details or {}, path_meta)
end
BattleForAzerothTreasures_path = path

BattleForAzerothTreasures_map_spellids = {
    -- [862] = 0, -- Zuldazar
    -- [863] = 0, -- Nazmir
    -- [864] = 0, -- Vol'dun
    -- [895] = 0, -- Tiragarde Sound
    -- [896] = 0, -- Drustvar
    -- [942] = 0, -- Stormsong Valley
}

BattleForAzerothTreasures_points = {
    --[[ structure:
    [uiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            currency=[id], -- currencyid
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
            hide_before=[id], -- hide if quest not completed
        },
    },
    --]]
    [862] = { -- Zuldazar
        [54093150] = {quest=48938, achievement=12851, criteria=40988, note="On second floor",}, -- Offerings of the Chosen
        [64732170] = {quest=50259, achievement=12851, criteria=40989,}, -- Witch Doctor's Hoard
        [51718690] = {quest=49936, achievement=12851, criteria=40990, note="Bottom floor of ship",}, -- Spoils of Pandaria
        [51432661] = {quest=50582, achievement=12851, criteria=40991,}, -- Gift of the Brokenhearted
        [49486526] = {quest=49257, achievement=12851, criteria=40992, note="Top of ship",}, -- Warlord's Cache
        [38793443] = {quest=50707, achievement=12851, criteria=40993, note="Road behind waterfall",}, -- Dazar's Forgotten Chest
        [61065863] = {quest=50947, achievement=12851, criteria=40994, npc=133208, note="Event: kill Da White Shark first",}, -- Da White Shark's Bounty
        [71841676] = {quest=50949, achievement=12851, criteria=40995,}, -- The Exile's Lament
        [56123806] = {quest=51338, achievement=12851, criteria=40996, note="In cave behind waterfall",}, -- Cache of Secrets
        [71161767] = path{quest=50949},
        [52974722] = {quest=51624, achievement=12851, criteria=40997}, -- Riches of Tor'nowa
        -- junk
        [80135512] = {quest=51346, junk=true, label="Treasure Chest",},
        [50823158] = {quest=50711, junk=true, label="Treasure Chest",},
    },
    [863] = { -- Nazmir
        [77903634] = {quest=49867, achievement=12771, criteria=40857,}, -- Lucky Horace's Lucky Chest
        [77884635] = {quest=50061, achievement=12771, criteria=40858, note="In dead hippo's mouth",}, -- Partially-Digested Treasure
        [43065078] = {quest=49979, achievement=12771, criteria=40859, note="In cave",}, -- Cursed Nazmani Chest
        [42275056] = path{quest=49979},
        [35668560] = {quest=49885, achievement=12771, criteria=40860, note="In cave",}, -- Cleverly Disguised Chest
        [62103487] = {quest=49891, achievement=12771, criteria=40861, note="Underwater cave",}, -- Lost Nazmani Treasure
        [42772620] = {quest=49484, achievement=12771, criteria=40862, note="Climb the tree",}, -- Offering to Bwonsamdi
        [66791735] = {quest=49483, achievement=12771, criteria=40863, note="Climb the tree",}, -- Shipwrecked Chest
        [46238292] = {quest=49889, achievement=12771, criteria=40864,}, -- Venomous Seal
        [76826220] = {quest=50045, achievement=12771, criteria=40865, note="Underwater cave",}, -- Swallowed Naga Chest
        [35455498] = {quest=49313, achievement=12771, criteria=40866, note="In cave",}, -- Wunja's Trove
    },
    [864] = { -- Vol'dun
        [46598801] = {quest=50237, achievement=12849, criteria=40966, note="Use mine cart",}, -- Ashvane Spoils
        [44339222] = path{quest=50237, label="Mine cart"},
        [49787940] = {quest=51132, achievement=12849, criteria=40968, note="Climb the rock arch",}, -- Lost Explorer's Bounty
        [44502613] = {quest=51135, achievement=12849, criteria=40970, note="Climb fallen tree",}, -- Stranded Cache
        [44712480] = path{quest=51135},
        [29388742] = {quest=51137, achievement=12849, criteria=40972, note="Under Disturbed Sand",}, -- Zem'lan's Buried Treasure
        [40578574] = {quest=52994, achievement=12849, criteria=41003,}, -- Deadwood Chest
        [38848290] = path{quest=52994},
        [48186469] = {quest=51093, achievement=12849, criteria=40967, note="Door on East side", hide_before=50550, faction="Horde",}, -- Grayal's Last Offering
        [49166469] = path{quest=51093},
        [47195846] = {quest=51133, achievement=12849, criteria=40969, note="Path from South side",}, -- Sandfury Reserve
        [47445984] = path{quest=51133},
        [57746464] = {quest=51136, achievement=12849, criteria=40971,}, -- Excavator's Greed
        [56696469] = path{quest=51136},
        [57061121] = {quest=52992, achievement=12849, criteria=41002, note="Enter at top of temple",}, -- Lost Offerings of Kimbul
        [26484534] = {quest=53004, achievement=12849, criteria=41004, note="Use Abandoned Bobber",}, -- Sandsunken Treasure
        -- Scavenger of the Sands
        [56297011] = {quest=53132, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41342, note="Under the bridge",}, -- Jason's Rusty Blade
        [36217838] = {quest=53133, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41343, note="Inside the turned over box",}, -- Ian's Empty Bottle
        [53568981] = {quest=53134, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41344, note="On the table",}, -- Julie's Cracked Dish
        [37813049] = {quest=53135, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41345, note="Under the rock",}, -- Brian's Broken Compass
        [26775289] = {quest=53136, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41346, note="First floor, blue stone table",}, -- Ofer's Bound Journal
        [29455937] = {quest=53137, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41347, note="On the small hill",}, -- Skye's Pet Rock
        [52431439] = {quest=53138, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41348, note="Near the bones close to the cliff",}, -- Julien's Left Boot
        [43217700] = {quest=53139, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41349, note="Near the wall",}, -- Navarro's Flask
        [47067577] = {quest=53140, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41350, note="Under the stairs",}, -- Zach's Canteen
        [45883072] = {quest=53141, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41351, note="Hanging on the hut",}, -- Damarcus' Backpack
        [66413590] = {quest=53142, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41352, note="In cave",}, -- Rachel's Flute
        [64883632] = path{quest=53142},
        [47933673] = {quest=53143, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41353, note="Cave under the giant tree",}, -- Josh's Fang Necklace
        [45229114] = {quest=53144, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41354, note="On the wall",}, -- Portrait of Commander Martens
        [62832267] = {quest=53145, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41355, note="Down from Tortaka Refuge",}, -- Kurt's Ornate Key
        -- junk
        [46984656] = {quest=50883, junk=true, label="Mysterious trashpile", achievement=12482, note="In alcove, Summon Jani, give her Charged Ranishu Antennae"},
        [61071734] = {quest=50914, junk=true, label=CHEST,},
        [53841481] = {quest=50915, junk=true, label=CHEST,},
        [60843637] = {quest=50916, junk=true, label=CHEST,},
        [62783373] = {quest=50916, junk=true, label=CHEST,},
        [54363351] = {quest=50917, junk=true, label=CHEST,},
        [64172528] = {quest=50918, junk=true, label=CHEST,},
        [35095003] = {quest=50919, junk=true, label=CHEST,},
        [48338890] = {quest=50920, junk=true, label=CHEST, note="In cave"},
        [46384538] = {quest=50921, junk=true, label=CHEST,},
        [30344624] = {quest=50922, junk=true, label=CHEST,},
        [29815402] = {quest=50922, junk=true, label=CHEST,},
        [26496777] = {quest=50923, junk=true, label=CHEST,},
        [31158381] = {quest=50924, junk=true, label=CHEST,},
        [37577607] = {quest=50924, junk=true, label=CHEST,},
        [36918033] = {quest=50924, junk=true, label=CHEST,},
        [44858126] = {quest=50925, junk=true, label=CHEST,},
        [52747649] = {quest=50926, junk=true, label=CHEST,},
        [56496993] = {quest=50926, junk=true, label=CHEST,},
        [57545508] = {quest=50928, junk=true, label=CHEST,},
        [52328519] = {quest=51673, junk=true, label=CHEST,},
        [51908251] = {quest=51673, junk=true, label=CHEST,},
    },
    [895] = { -- Tiragarde Sound
        [61515233] = {quest=49963, achievement=12852, criteria=41012, note="Ride the Guardian",}, -- Hay Covered Chest
        [56033319] = {quest=52866, achievement=12852, criteria=41014,}, -- Precarious Noble Cache
        [72482169] = {quest=52870, achievement=12852, criteria=41016, note="In cave",}, -- Scrimshaw Cache
        [72495814] = {quest=50442, item=155381, achievement=12852, criteria=41013,}, -- Cutwater Treasure Chest
        [61786275] = {quest=52867, achievement=12852, criteria=41015, note="In cave",}, -- Forgotten Smuggler's Stash
        [73103950] = {quest=52195, item=161342, achievement=12852, criteria=41017, note="In Boralus, on Stomsong Monastary",}, -- Secret of the Depths
        [55769095] = {quest=52195, hide_before={52134, 52135, 52136, 52137, 52138}, item=161342, achievement=12852, criteria=41017, note="Teleport here from Stormsong, pick up the gem",}, -- Secret of the Depths
        -- Freehold treasure maps
        [80007600] = {quest=52853, item=162571, achievement=12852, criteria=41018, note="Kill pirates in Freehold until the map drops",}, -- Soggy Treasure Map 162571 (q:52853)
        [80708050] = {quest=52859, item=162581, achievement=12852, criteria=41020, note="Kill pirates in Freehold until the map drops",}, -- Yellowed Treasure Map 162581 (q:52859)
        [74008300] = {quest=52854, item=162580, achievement=12852, criteria=41019, note="Kill pirates in Freehold until the map drops",}, -- Fading Treasure Map 162580 (q:52854)
        [76008500] = {quest=52860, item=162584, achievement=12852, criteria=41021, note="Kill pirates in Freehold until the map drops",}, -- Singed Treasure Map 162584 (q:52860)
        -- ...and the actual treasures they point to
        [54994608] = {quest=52807, hide_before=52853, achievement=12852, criteria=41018, note="Kill pirates in Freehold until the map drops",}, -- Soggy Treasure Map 162571 (q:52853)
        [90507551] = {quest=52836, hide_before=52859, achievement=12852, criteria=41020, note="Kill pirates in Freehold until the map drops",}, -- Yellowed Treasure Map 162581 (q:52859)
        [29222534] = {quest=52833, hide_before=52854, achievement=12852, criteria=41019, note="Kill pirates in Freehold until the map drops",}, -- Fading Treasure Map 162580 (q:52854)
        [48983759] = {quest=52845, hide_before=52860, achievement=12852, criteria=41021, note="Kill pirates in Freehold until the map drops",}, -- Singed Treasure Map 162584 (q:52860)
        -- Shanty Raid
        [43382585] = {quest=53410, item=163715, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41542, note="In a cave",}, -- Fruit Counting
        [76218305] = {quest=50233, item=163717, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41544, note="Kill Barman Bill",}, -- Josephus
        [56706990] = {quest=50096, item=163718, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41545, note="Kill Black-Eyed Bart",}, -- Black Sphere
        [73208410] = {quest=53411, item=163719, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41546, note="Ground floor, on a table",}, -- Horse
        [70602270] = {quest=53407, item=163716, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41543, note="Behind Jay the Tavern Bard",}, -- Inebriation
        [74403540] = {quest=53408, item=163714, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41541, note="On the fireplace mantel",}, -- Lively Men
        -- junk:
        [76967543] = {quest=48593, junk=true, label=CHEST_SM,},
        [78008050] = {quest=48595, junk=true, label=CHEST_SM,},
        [76358090] = {quest=48595, junk=true, label=CHEST_SM,},
        [73468317] = {quest=48596, junk=true, label=CHEST_SM,},
        [75758283] = {quest=48596, junk=true, label=CHEST_SM,},
        [38432868] = {quest=48598, junk=true, label=CHEST_SM,},
        [38762673] = {quest=48599, junk=true, label=CHEST_SM,},
        [78114901] = {quest=48607, junk=true, label=CHEST_SM,},
        [79205050] = {quest=48607, junk=true, label=CHEST_SM,},
        [81344938] = {quest=48607, junk=true, label=CHEST_SM,},
        [76126733] = {quest=48608, junk=true, label=CHEST_SM,},
        [68635108] = {quest=48609, junk=true, label=CHEST_SM,},
        [50842310] = {quest=48611, junk=true, label=CHEST_SM,},
        [47442365] = {quest=48611, junk=true, label=CHEST_SM,},
        [48392785] = {quest=48611, junk=true, label=CHEST_SM,},
        [61212836] = {quest=48612, junk=true, label=CHEST_SM,},
        [57311757] = {quest=48617, junk=true, label=CHEST_SM,},
        [87347379] = {quest=48618, junk=true, label=CHEST_SM,},
        [88387840] = {quest=48618, junk=true, label=CHEST_SM,},
        [69801270] = {quest=48619, junk=true, label=CHEST_SM,},
        [46481829] = {quest=48621, junk=true, label=CHEST_SM,},
    },
    [896] = { -- Drustvar
        [33713008] = {quest=53356, achievement=12995, criteria=41697,}, -- Web-Covered Chest
        [63306585] = {quest=53385, achievement=12995, criteria=41699, note="Left Down Up Right",}, -- Runebound Cache
        [33687173] = {quest=53387, achievement=12995, criteria=41701, note="Right Up Left Down",}, -- Runebound Coffer
        [55605181] = {quest=53472, achievement=12995, criteria=41703, note="Click on Witch Torch",}, -- Bespelled Chest
        [25472416] = {quest=53474, achievement=12995, criteria=41705, note="Click on Witch Torch",}, -- Enchanted Chest
        [25751995] = {quest=53357, achievement=12995, criteria=41698, note="Get keys from Gorging Raven",}, -- Merchant's Chest
        [44222770] = {quest=53386, achievement=12995, criteria=41700, note="Left Right Down Up",}, -- Runebound Chest
        [18515133] = {quest=53471, achievement=12995, criteria=41702, note="Click on Witch Torch",}, -- Hexed Chest
        [67767367] = {quest=53473, achievement=12995, criteria=41704, note="Click on Witch Torch",}, -- Ensorcelled Chest
        [24304840] = {quest=53475, achievement=12995, criteria=41752,}, -- Stolen Thornspeaker Cache
    },
    [942] = { -- Stormsong Valley
        [66901200] = {quest=51449, achievement=12853, criteria=41061,}, -- Weathered Treasure Chest
        [42854723] = {quest=50089, achievement=12853, criteria=41062, note="In cave",}, -- Old Ironbound Chest
        [48968407] = {quest=50526, achievement=12853, criteria=41063,}, -- Frosty Treasure Chest
        [67224321] = {quest=50734, achievement=12853, criteria=41064, note="Under ship",}, -- Sunken Strongbox
        [59913907] = {quest=50937, achievement=12853, criteria=41065, note="On roof",}, -- Hidden Scholar's Chest
        [58608388] = {quest=49811, achievement=12853, criteria=41066, note="Under platform",}, -- Smuggler's Stash
        [58216368] = {quest=52326, achievement=12853, criteria=41067, note="Top shelf inside shed",}, -- Discarded Lunchbox
        [44447353] = {quest=52429, item=162000, achievement=12853, criteria=41068, note="Jump down onto platform",}, -- Carved Wooden Chest
        [36692323] = {quest=52976, achievement=12853, criteria=41069, note="Climb ladder onto ship",}, -- Venture Co. Supply Chest
        [46003069] = {quest=52980, achievement=12853, criteria=41070, note="Behind pillar",}, -- Forgotten Chest
        [41256950] = {achievement=13046, atlas="Food", note="Open an Unforgettable Luncheon here; buy them at the Inn, or loot one from the Discarded Lunchbox in Brennadam",}, -- These Hills Sing
        -- junk
        [66567107] = {quest=50576, item=154476, label="Honey Vat", note="Strangely, not part of the achievement",},
        [62056563] = {quest=51184, junk=true, label=CHEST_SM,},
        [51796523] = {quest=51184, junk=true, label=CHEST_SM,},
        [70265958] = {quest=51927, junk=true, label=CHEST_SM,},
        [64366899] = {quest=51939, junk=true, label=CHEST_SM,},
        [68067158] = {quest=51939, junk=true, label=CHEST_SM, note="In a bush",},
        [48406562] = {quest=51940, junk=true, label=CHEST_SM,},
        [44107300] = {quest=51942, junk=true, label=CHEST_SM,},
    },
    [1183] = { -- Thornheart
        [60804121] = {quest=52429, item=162000, achievement=12853, criteria=41068, note="Jump down from here",}, -- Carved Wooden chest
    },
    [1161] = { -- Boralus
        [61901010] = {quest=52870, achievement=12852, criteria=41016, note="In cave",}, -- Scrimshaw Cache
        -- Secret of the Depths:
        [61518382] = {quest=52195, atlas="MagePortalAlliance", minimap=true, achievement=12852, criteria=41017, note="Entrance to the underwater cave",},
        [55979126] = {quest=52134, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="Read Damp Scrolls; in the underwater cave, from the monastary",},
        [61527772] = {quest=52135, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="Read Damp Scrolls; underground",},
        [63078186] = {quest=52136, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="Read Damp Scrolls; upstairs",},
        [70328576] = {quest=52137, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="Read Damp Scrolls; underground",},
        [67147982] = {quest=52138, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="Read Damp Scrolls",},
        [55769095] = {quest=52195, atlas="DemonInvasion2", scale=1.4, minimap=true, hide_before={52134, 52135, 52136, 52137, 52138}, item=161342, achievement=12852, criteria=41017, note="Ominous Altar; use it, get teleported, pick up the gem",}, -- Secret of the Depths
        -- Shanty Raid
        [72616853] = {quest=53408, item=163714, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41541, note="On the fireplace mantel",}, -- Lively Men
        [53141767] = {quest=53407, item=163716, atlas="poi-workorders", minimap=true, achievement=13057, criteria=41543, note="Behind Jay the Tavern Bard",}, -- Inebriation
        -- junk
        [66758031] = {quest=50952, junk=true, label=CHEST_SM,},
    },
    [1165] = { -- Dazar'alor
        [59258870] = {quest=50947, minimap=true, achievement=12851, criteria=40994, npc=133208, note="Event: kill Da White Shark first",}, -- Da White Shark's Bounty
        [44472690] = {quest=51338, minimap=true, achievement=12851, criteria=40996, note="In cave behind waterfall",}, -- Cache of Secrets
        [38300716] = {quest=48938, minimap=true, achievement=12851, criteria=40988, note="On top of the Hall of the High Priests",}, -- Offerings of the Chosen
        [41141101] = path{quest=48938},
    },
}

local merge = BattleForAzerothTreasures_merge
local path = BattleForAzerothTreasures_path

merge(BattleForAzerothTreasures_points[862], { -- Zuldazar
    [81202100] = {quest=50280, npc=129961, item=161042, achievement=12944, criteria=41850,}, -- Atal'zul Gotaka
    [64403240] = {quest=50439, npc=129954, item=161043, achievement=12944, criteria=41851,}, -- Gahz'ralka
    [44007660] = {quest=51083, npc=136428, item=160979, achievement=12944, criteria=41852,}, -- Dark Chronicler
    [53204480] = {quest=51080, npc=136413, item=161047, achievement=12944, criteria=41853,}, -- Syrawon the Dominus
    [48205400] = {quest=49972, npc=131476, item=161125, achievement=12944, criteria=41869,}, -- Zayoos
    [58777395] = {quest=49911, npc=131233, item=161033, achievement=12944, criteria=41870,}, -- Lei-zhi
    [49705740] = {quest=49410, npc=129343, item=161034, achievement=12944, criteria=41871,}, -- Avatar of Xolotal
    [59601820] = {quest=49267, npc=128699, item=161104, achievement=12944, criteria=41872,}, -- Bloodbulge
    [46606520] = {quest=49004, npc=127939, item=161029, achievement=12944, criteria=41873,}, -- Torraske the Eternal
    [68604820] = {quest=48543, npc=126637, item=160984, achievement=12944, criteria=41874,}, -- Kandak
    [59605640] = {quest=48333, npc=120899, item=160947, achievement=12944, criteria=41875,}, -- Kul'krazahn
    [74002820] = {quest=47792, npc=124185, item=161035, achievement=12944, criteria=41876,}, -- Golrakahn
    [70803240] = {quest=nil, npc=122004, item=161091, achievement=12944, criteria=41877,}, -- Umbra'jin
    [65201020] = {quest=50693, npc=134760, item=160958, achievement=12944, criteria=41855,}, -- Darkspeaker Jo'la
    [42003620] = {quest=50677, npc=134738, item=160978, achievement=12944, criteria=41856,}, -- Hakbi the Risen
    [61904622] = {quest=50508, npc=134048, item=162613, achievement=12944, criteria=41858, note="Interact with Strange Egg",}, -- Vukuba
    [44002540] = {quest=50438, npc=133842, item=161040, achievement=12944, criteria=41859,}, -- Warcrawler Karkithiss
    [60626627] = {quest=50281, npc=134782, item=161022, achievement=12944, criteria=41863,}, -- Murderbeak
    [74003940] = {quest=50269, npc=133190, achievement=12944, criteria=41864,}, -- Daggerjaw
    [80003600] = {quest=50260, npc=133155, achievement=12944, criteria=41865,}, -- G'Naat
    [75603600] = {quest=50159, npc=132244, item=161112, achievement=12944, criteria=41866,}, -- Kiboku
    [66203240] = {quest=50034, npc=131718, item=161020, achievement=12944, criteria=41867,}, -- Bramblewing
    [77601120] = {quest=50013, npc=131687, item=161109, achievement=12944, criteria=41868,}, -- Tambano
    -- Life Finds a Way... To Die!
    [67732903] = {quest=nil, npc=135512, achievement=13048, criteria=41675, note="Shares spawn timer with Azuresail the Ancient and Kil'Tawan",}, -- Thuderfoot the Brutosaur
    [67102657] = {quest=nil, npc=135510, achievement=13048, criteria=41676, note="Shares spawn timer with Thunderfoot and Kil'Tawan",}, -- Azuresail the Diemetrodon
    [71134034] = {quest=nil, npc=139365, achievement=13048, criteria=41672, note="South of Savagelands",}, -- Queenfeather the Ravasaur
    [52394771] = {quest=nil, npc=129323, achievement=13048, criteria=41674, note="Can be found near the road in the grass",}, -- The Sabertusk Empress
    [66082238] = {quest=nil, npc=143910, achievement=13048, criteria=41684, note="South of the Nesingwary's Trek windrider",}, -- Sludgecrusher the Anklyodon
    [61622537] = {quest=nil, npc=130741, achievement=13048, criteria=41673, note="Fighting Ten'gor at crossroad",}, -- Nol'ixwan the Direhorn
    [71242184] = {quest=nil, npc=123502, achievement=13048, criteria=41677, note="On the road from Zeb'ahari to Tal'gurub",}, -- King K'tal the Devilsaur
    -- Mushroom Harvest
    [45537917] = {npc=143314, achievement=13027, criteria=41391, note="On the beach, between trees",}, -- Bane of the Woods
})
merge(BattleForAzerothTreasures_points[1165], { -- Dazar'alor
    [55378240] = {quest=48333, npc=120899, item=160947, achievement=12944, criteria=41875,}, -- Kul'krazahn
})
merge(BattleForAzerothTreasures_points[863], { -- Nazmir
    [67812972] = {quest=48063, npc=125250, achievement=12942, criteria=41440,}, -- Ancient Jawbreaker
    [32802690] = {quest=50563, npc=134293, achievement=12942, criteria=41447,}, -- Azerite-Infused Slag
    [44224873] = {quest=49305, npc=128965, achievement=12942, criteria=41450,}, -- Uroku the Bound
    [68102023] = {quest=50567, npc=134296, achievement=12942, criteria=41452,}, -- Chag's Challenge
    [81813057] = {quest=48057, npc=125232, achievement=12942, criteria=41454,}, -- Cursed Chest
    [68955747] = {quest=50361, npc=121242, achievement=12942, criteria=41456,}, -- Glompmaw
    [56666932] = {quest=49312, npc=128974, achievement=12942, criteria=41458,}, -- Queen Tzxi'kik
    [45375197] = {quest=50307, npc=133373, achievement=12942, criteria=41460,}, -- Jax'teb the Reanimated
    [52931340] = {quest=47843, npc=124397, achievement=12942, criteria=41462,}, -- Kal'draxa
    [81696105] = {quest=50565, npc=134295, achievement=12942, criteria=41464,}, -- Lost Scroll
    [58963893] = {quest=48972, npc=127820, achievement=12942, criteria=41467,}, -- Scout Skrasniss
    [31443815] = {quest=48508, npc=126460, achievement=12942, criteria=41469,}, -- Tainted Guardian
    [38095768] = {quest=50888, npc=135565, achievement=12942, criteria=41472,}, -- Urn of Agussu
    [48985082] = {quest=48623, npc=126907, achievement=12942, criteria=41474,}, -- Wardrummer Zurula
    [38722674] = {quest=49469, npc=129657, achievement=12942, criteria=41476,}, -- Za'amar the Queen's Blade
    [78084451] = {quest=50355, npc=133539, achievement=12942, criteria=41478,}, -- Lo'kuno
    [54138091] = {quest=50569, npc=134298, achievement=12942, criteria=41444,}, -- Azerite-Infused Elemental
    [43069033] = {quest=48541, npc=126635, achievement=12942, criteria=41448,}, -- Blood Priest Xak'lar
    [53694287] = {quest=49317, npc=129005, achievement=12942, criteria=41451,}, -- King Kooba
    [41665344] = {quest=48462, npc=126187, achievement=12942, criteria=41453,}, -- Corpse Bringer Yal'kar
    [33538708] = {quest=48638, npc=127001, achievement=12942, criteria=41455,}, -- Gwugnug the Cursed
    [32344332] = {quest=49231, npc=128426, achievement=12942, criteria=41457,}, -- Gutrip
    [24967778] = {quest=47877, npc=124399, achievement=12942, criteria=41459,}, -- Infected Direhorn
    [27823357] = {quest=50342, npc=133527, achievement=12942, criteria=41461,}, -- Juba the Scarred
    [76033654] = {quest=48052, npc=125214, achievement=12942, criteria=41463,}, -- Krubbs
    [42805949] = {quest=48439, npc=126142, achievement=12942, criteria=41466,}, -- Bajiatha
    [58431014] = {quest=48980, npc=127873, achievement=12942, criteria=41468,}, -- Scrounger Patriarch
    [49453714] = {quest=48406, npc=126056, achievement=12942, criteria=41470,}, -- Totem Maker Jash'ga
    [29705107] = {quest=48626, npc=126926, achievement=12942, criteria=41473,}, -- Venomjaw
    [36555053] = {quest=50348, npc=133531, achievement=12942, criteria=41475,}, -- Xu'ba
    [38887148] = {quest=50423, npc=133812, achievement=12942, criteria=41477,}, -- Zanxib
    [52605489] = {quest=50040, npc=128930, achievement=12942, criteria=41479,}, -- Mala'kili and Rohnkor
    -- Life Finds a Way... To Die!
    [25706971] = {quest=nil, npc=143898, achievement=13048, criteria=41683, note="Flying close to the road from Vol'dun to Zuldazar",}, -- Makatau the Pterrordax
    -- Mushroom Harvest
    [52357020] = {npc=143316, achievement=13027, criteria=41390, note="South of Heart of Darkness. Entrance is from the north side of Xal'vor ruins",}, -- Skullcap
    [73614870] = {npc=143311, achievement=13027, criteria=41393, note="In cave, entrance at 73.2 49.7",}, -- Toadcruel
    -- [73204970] = path(), Path without quest?
})
merge(BattleForAzerothTreasures_points[864], { -- Vol'dun
    [50378160] = {quest=51058, npc=135852, achievement=12943, criteria=41606,}, -- Ak'tar
    [54701517] = {quest=47532, npc=130439, achievement=12943, criteria=41607,}, -- Ashmane
    [49058905] = {quest=49252, npc=128553, achievement=12943, criteria=41608,}, -- Azer'tor
    [31008109] = {quest=49251, npc=128497, achievement=12943, criteria=41609,}, -- Bajiani the Slick
    [49064989] = {quest=nil, npc=129476, achievement=12943, criteria=41610,}, -- Bloated Krolusk
    [56105356] = {quest=51079, npc=136393, achievement=12943, criteria=41611,}, -- Bloodwing Bonepicker
    [41272449] = {quest=51073, npc=136346, achievement=12943, criteria=41612,}, -- Captain Stef "Marrow" Quin
    [42679245] = {quest=50905, npc=124722, achievement=12943, criteria=41613,}, -- Commodore Calhoun
    [61853788] = {quest=51077, npc=136335, achievement=12943, criteria=41614,}, -- Enraged Krolusk
    [64004757] = {quest=49270, npc=128674, achievement=12943, criteria=41615,}, -- Gut-Gut the Glutton
    [53685347] = {quest=47533, npc=130443, achievement=12943, criteria=41616, note="In cave"}, -- Hivemother Kraxi
    [53835149] = path{quest=47533},
    [37428498] = {quest=49392, npc=129283, achievement=12943, criteria=41617,}, -- Jumbo Sandsnapper
    [60561801] = {quest=51074, npc=136341, achievement=12943, criteria=41618,}, -- Jungleweb Hunter
    [35085183] = {quest=50528, npc=128686, achievement=12943, criteria=41619,}, -- Kamid the Trapper
    [38284138] = {quest=51424, npc=137681, achievement=12943, criteria=41620, note="In cave"}, -- King Clickyclack
    [37354050] = path{quest=51424},
    [43758624] = {quest=50898, npc=128951, achievement=12943, criteria=41621,}, -- Nez'ara
    [49017210] = {quest=51126, npc=136340, achievement=12943, criteria=41622,}, -- Relic Hunter Hazaak
    [44538023] = {quest=48960, npc=127776, achievement=12943, criteria=41623,}, -- Scaleclaw Broodmother
    [32716522] = {quest=nil, npc=136336, achievement=12943, criteria=41624,}, -- Scorpox
    [24736850] = {quest=51075, npc=136338, achievement=12943, criteria=41625,}, -- Sirokar
    [46972518] = {quest=50637, npc=134571, achievement=12943, criteria=41626, note="In cave",}, -- Skycaller Teskris
    [46242714] = path{quest=50637},
    [51263645] = {quest=50686, npc=134745, achievement=12943, criteria=41627,}, -- Skycarver Krakit
    [66892446] = {quest=51063, npc=136304, achievement=12943, criteria=41628,}, -- Songstress Nahjeen
    [57197349] = {quest=49674, npc=130401, achievement=12943, criteria=41629,}, -- Vathikur
    [37084616] = {quest=49373, npc=129180, achievement=12943, criteria=41630,}, -- Warbringer Hozzik
    [30115256] = {quest=50662, npc=134638, achievement=12943, criteria=41631,}, -- Warlord Zothix
    [50713086] = {quest=50658, npc=134625, achievement=12943, criteria=41632,}, -- Warmother Captive
    [43915405] = {quest=48319, npc=129411, achievement=12943, criteria=41633, note="Inside skeleton under the sand"}, -- Zunashi the Exile
    [43985246] = path{quest=48319},
    -- Mushroom Harvest
    [61101826] = {npc=143313, achievement=13027, criteria=41392, note="Shrouded Shore, on the hill",}, -- Portakillo
})
merge(BattleForAzerothTreasures_points[895], { -- Tiragarde Sound
    [75147848] = {quest=50156, npc=132182, achievement=12939, criteria=41793,}, -- Auditor Dolp
    [76218305] = {quest=50233, npc=129181, item=163717, achievement=12939, criteria=41795,}, -- Barman Bill
    [34013029] = {quest=50094, npc=132068, achievement=12939, criteria=41796,}, -- Bashmu
    [56676994] = {quest=50096, npc=132086, item=163718, achievement=12939, criteria=41797,}, -- Black-Eyed Bart
    [84707385] = {quest=51808, npc=139145, item=154411, achievement=12939, criteria=41798, note="Hillside above the cave",}, -- Blackthorne
    [83364413] = {quest=49999, npc=130508, achievement=12939, criteria=41800,}, -- Broodmother Razora
    [38422066] = {quest=50097, npc=132088, achievement=12939, criteria=41806,}, -- Captain Wintersail
    [72838146] = {quest=51809, npc=139152, achievement=12939, criteria=41812,}, -- Carla Smirk
    [89787815] = {quest=50155, npc=132211, achievement=12939, criteria=41813,}, -- Fowlmouth
    [59982275] = {quest=50137, npc=132127, achievement=12939, criteria=41814,}, -- Foxhollow Skyterror
    [57725613] = {quest=53373, npc=139233, achievement=12939, criteria=41819,}, -- Gulliver
    [48072334] = {quest=49984, npc=131520, achievement=12939, criteria=41820,}, -- Kulett the Ornery
    [68352088] = {quest=50525, npc=134106, item=155524, achievement=12939, criteria=41821,}, -- Lumbergrasp Sentinel
    [58094870] = {quest=51880, npc=139290, item=154458, achievement=12939, criteria=41822,}, -- Maison the Portable
    [64291931] = {quest=51321, npc=137183, item=160472, achievement=12939, criteria=41823,}, -- Imperiled Merchants (Honey-Coated Slitherer)
    [43801771] = {quest=49921, npc=131252, achievement=12939, criteria=41824,}, -- Merianae
    [65176460] = {quest=51833, npc=139205, achievement=12939, criteria=41825,}, -- P4-N73R4
    [39461517] = {quest=49923, npc=131262, item=160263, achievement=12939, criteria=41826,}, -- Pack Leader Asenya
    [64805893] = {quest=50148, npc=132179, item=161446, achievement=12939, criteria=41827,}, -- Raging Swell
    [68336362] = {quest=51872, npc=139278, achievement=12939, criteria=41828,}, -- Ranja
    [58541513] = {quest=48806, npc=127290, item=154416, achievement=12939, criteria=41829,}, -- Saurolisk Tamer Mugg (Mugg)
    [76022887] = {quest=51877, npc=139287, achievement=12939, criteria=41830,}, -- Sawtooth
    [55703318] = {quest=51876, npc=139285, achievement=12939, criteria=41831,}, -- Shiverscale the Toxic
    [80838277] = {quest=50160, npc=132280, achievement=12939, criteria=41832,}, -- Squacks
    [49353613] = {quest=51807, npc=139135, achievement=12939, criteria=41833,}, -- Squirgle of the Depths
    [66701427] = {quest=51873, npc=139280, achievement=12939, criteria=41834,}, -- Sythian the Swift
    [60801727] = {quest=50301, npc=133356, achievement=12939, criteria=41835,}, -- Tempestria
    [55095056] = {quest=51879, npc=139289, achievement=12939, criteria=41836,}, -- Tentulos the Drifter
    [63735039] = {quest=49942, npc=131389, item=158556, achievement=12939, criteria=41837,}, -- Teres
    [70035567] = {quest=51835, npc=139235, achievement=12939, criteria=41838,}, -- Tort Jaw
    [46391997] = {quest=50095, npc=132076, item=160452, achievement=12939, criteria=41839,}, -- Totes
    [70271283] = {quest=50073, npc=131984, item=160473, achievement=12939, criteria=41840,}, -- Twin-hearted Construct
    [61515233] = {quest=49963, npc=130350, item=155571, note="Ride to Roan Berthold in Southwind Station; follow the road",}, -- Guardian of the Spring (49983 is the ride, 49963 is the loot)
    -- [52253215] = {quest=nil, npc=132052, item=155074,}, -- Vol'Jim (removed from game?)
})
merge(BattleForAzerothTreasures_points[1161], { -- Boralus
    [80403500] = {quest=51877, npc=139287, achievement=12939, criteria=41830,}, -- Sawtooth
})
merge(BattleForAzerothTreasures_points[896], { -- Drustvar
    [59933466] = {quest=47884, npc=124548, achievement=12941, criteria=41706,}, -- Betsy
    [58901790] = {quest=48842, npc=127333, achievement=12941, criteria=41708,}, -- Barbthorn Queen
    [66585068] = {quest=48978, npc=126621, achievement=12941, criteria=41711,}, -- Bonesquall
    [59245526] = {quest=48981, npc=127877, achievement=12941, criteria=41713, note="Pick one to fight; Dagger from Longfang, mail gloves from Henry",}, -- Longfang & Henry Breakwater
    [52074697] = {quest=49216, npc=129904, achievement=12941, criteria=41715,}, -- Cottontail Matron
    [65002266] = {quest=49311, npc=128973, achievement=12941, criteria=41718,}, -- Whargarble the Ill-Tempered
    [50842040] = {quest=49388, npc=127129, achievement=12941, criteria=41720,}, -- Grozgore
    [51352957] = {quest=49481, npc=129805, achievement=12941, criteria=41722,}, -- Beshol
    [63414020] = {quest=49530, npc=129995, achievement=12941, criteria=41724,}, -- Emily Mayville
    [56572924] = {quest=49602, npc=130143, achievement=12941, criteria=41726,}, -- Balethorn
    [31011831] = {quest=50546, npc=134213, achievement=12941, criteria=41728,}, -- Executioner Blackwell
    [22934796] = {quest=50688, npc=134754, achievement=12941, criteria=41729,}, -- Hyo'gi
    [34966921] = {quest=51383, npc=137529, achievement=12941, criteria=41732,}, -- Arvon the Betrayed
    [43808828] = {quest=51471, npc=137825, achievement=12941, criteria=41736,}, -- Avalanche
    [29202488] = {quest=51700, npc=138675, achievement=12941, criteria=41742,}, -- Gorged Boar
    [24242193] = {quest=51749, npc=138866, item=154217, achievement=12941, criteria=41748,}, -- Fungi Trio (quest 51887 also?)
    [30476344] = {quest=51923, npc=139322, item=154315, achievement=12941, criteria=41751,}, -- Whitney "Steelclaw" Ramsay
    [66574259] = {quest=48178, npc=125453, item=158583, achievement=12941, criteria=41707,}, -- Quillrat Matriarch
    [72786036] = {quest=48928, npc=127651, achievement=12941, criteria=41709,}, -- Vicemaul
    [62956938] = {quest=48979, npc=127844, achievement=12941, criteria=41712,}, -- Gluttonous Yeti
    [43463611] = {quest=49137, achievement=12941, criteria=41714,}, -- Ancient Sarcophagus
    [59557181] = {quest=49269, npc=128707, achievement=12941, criteria=41717,}, -- Rimestone
    [67936683] = {quest=49341, item=158598, achievement=12941, criteria=41719,}, -- Seething Cache
    [57424380] = {quest=49480, npc=129835, achievement=12941, criteria=41721,}, -- Gorehorn
    [32204036] = {quest=49528, npc=129950, achievement=12941, criteria=41723,}, -- Talon
    [59874478] = {quest=49601, npc=130138, achievement=12941, criteria=41725,}, -- Nevermore
    [35483290] = {quest=50163, npc=132319, achievement=12941, criteria=41727,}, -- Bilefang Mother
    [18746057] = {quest=50669, npc=134706, achievement=12941, criteria=42342,}, -- Deathcap
    [28051425] = {quest=50939, npc=135796, achievement=12941, criteria=41730,}, -- Captain Leadfist
    [29056863] = {quest=51470, npc=137824, achievement=12941, criteria=41733,}, -- Arclight
    [23422975] = {quest=51698, npc=138618, achievement=12941, criteria=41739,}, -- Haywire Golem
    [33245765] = {quest=51748, npc=138863, achievement=12941, criteria=41745,}, -- Sister Martha
    [26935962] = {quest=51922, npc=139321, achievement=12941, criteria=41750,}, -- Braedan Whitewall
    -- [20295731] = {quest=nil, npc=137665,}, -- Soul Goliath
    -- [35711177] = {quest=nil, npc=138667,}, -- Blighted Monstrosity
    -- [25151616] = {quest=nil, npc=139358,}, -- The Caterer
    -- [34722062] = {quest=nil, npc=137704,}, -- Matron Morana
})
merge(BattleForAzerothTreasures_points[942], { -- Stormsong Valley
    [71003200] = {quest=52448, npc=141175, item=158218, achievement=12940, criteria=41753,}, -- Song Mistress Dadalea
    [22607300] = {quest=50938, npc=140997, achievement=12940, criteria=41754,}, -- Severus the Outcast
    [33603800] = {quest=51757, npc=138938, item=160477, achievement=12940, criteria=41755,}, -- Seabreaker Skoloth
    [34203240] = {quest=51956, npc=139328, item=154664, achievement=12940, criteria=41756,}, -- Sabertron
    [51807960] = {quest=50974, npc=136189, item=155222, achievement=12940, criteria=41757,}, -- The Lichen King
    [41607360] = {quest=50725, npc=134884, item=160465, achievement=12940, criteria=41758,}, -- Ragna
    [41302920] = {quest=51958, npc=139319, item=158216, achievement=12940, criteria=41759,}, -- Slickspill
    [29206960] = {quest=51298, npc=137025, item=160470, achievement=12940, criteria=41760,}, -- Broodmother
    [71305430] = {quest=50075, npc=132007, item=155568, achievement=12940, criteria=41761,}, -- Galestorm
    [47004220] = {quest=52457, npc=142088, item=158215, achievement=12940, criteria=41762,}, -- Whirlwing
    [31406260] = {quest=52318, npc=141029, item=154475, achievement=12940, criteria=41763,}, -- Kickers
    [64406560] = {quest=49951, npc=131404, item=160471, achievement=12940, criteria=41765,}, -- Foreman Scripps
    [34406760] = {quest=52469, npc=141286, achievement=12940, criteria=41769,}, -- Poacher Zane
    [37905040] = {quest=51959, npc=139298, item=163678, achievement=12940, criteria=41772,}, -- Pinku'shon
    [62007340] = {quest=52329, npc=141059, item=155572, achievement=12940, criteria=41774,}, -- Grimscowl the Harebrained
    [53005200] = {quest=50692, npc=139385, item=160464, achievement=12940, criteria=41775,}, -- Deepfang
    [63003300] = {quest=52303, npc=140938, item=154460, achievement=12940, criteria=41776,}, -- Croaker
    [66905200] = {quest=52121, npc=139968, item=154183, achievement=12940, criteria=41777,}, -- Corrupted Tideskipper (also i:162028)
    [51405540] = {quest=50731, npc=136183, item=154857, achievement=12940, criteria=nil,}, -- Crushtacean (shares q:50731 c:41778 with Dagrus)
    [67804000] = {quest=50731, npc=134897, item=160476, achievement=12940, criteria=nil,}, -- Dagrus the Scorned (shares q:50731 c:41778 with Crushtacean)
    [49807000] = {quest=50037, npc=135939, item=158299, achievement=12940, criteria=41782,}, -- Vinespeaker Ratha
    [53106910] = {quest=50024, npc=135947, achievement=12940, criteria=41787,}, -- Strange Mushroom Ring
    [33607500] = {quest=52460, npc=141226, achievement=12940, criteria=41815,}, -- Haegol the Hammer
    [57007580] = {quest=52433, npc=141088, item=158224, achievement=12940, criteria=41816,}, -- Squall
    [63408320] = {quest=52327, npc=141039, achievement=12940, criteria=41817,}, -- Ice Sickle
    [47206580] = {quest=50170, npc=130897, item=155287, achievement=12940, criteria=41818,}, -- Captain Razorspine
    [47306590] = {quest=52296, npc=129803, achievement=12940, criteria=41841,}, -- Whiplash
    [61605700] = {quest=52441, npc=141143, item=155164, achievement=12940, criteria=41842,}, -- Sister Absinthe
    [42807500] = {quest=50819, npc=130079, item=154431, achievement=12940, criteria=41843,}, -- Wagga Snarltusk
    [43404490] = {quest=51762, npc=138963, item=160477, achievement=12940, criteria=41844,}, -- Nestmother Acada
    [42006280] = {quest=52461, npc=141239, item=159169, achievement=12940, criteria=41845,}, -- Osca the Bloodied
    [73806080] = {quest=52125, npc=139988, item=154389, achievement=12940, criteria=41846,}, -- Sandfang
    [60004600] = {quest=52123, npc=139980, item=154449, achievement=12940, criteria=41847,}, -- Taja the Tidehowler
    [53406450] = {quest=52323, npc=140925, item=159179, achievement=12940, criteria=nil, faction="Horde",}, -- Doc Marrtens
    [53416451] = {quest=52324, npc=141043, item=nil, achievement=12940, criteria=nil, faction="Alliance", note="Talk to Doc Marrtens",}, -- Jakala the Cruel
    -- [72545052] = {quest=nil, npc=139515,}, -- Sandscour
    -- [68745147] = {quest=nil, npc=132047,}, -- Reinforced Hullbreaker
    -- [40143732] = {quest=nil, npc=137649,}, -- Pest Remover Mk. II
    -- [67217525] = {quest=nil, npc=134147,}, -- Beehemoth
})
