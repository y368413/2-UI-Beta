local BFAAchievments_ = {}

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_BfA-Achievments", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes")
BFAAchievments_HL = HL

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
    if point.achievement and point.criteria then
        local criteria = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
        if criteria then
            return criteria
        end
        fallback = 'achievement:'..point.achievement..'.'..point.criteria
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
    if BFAAchievments_db.icon_item then
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
    return get_point_info(BFAAchievments_points[uiMapID] and BFAAchievments_points[uiMapID][coord])
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
        if point.quest and BFAAchievments_db.tooltip_questid then
            local quest = point.quest
            if type(quest) == 'table' then
                quest = string.join(", ", unpack(quest))
            end
            tooltip:AddDoubleLine("QuestID", quest or UNKNOWN)
        end

        if (BFAAchievments_db.tooltip_item or IsShiftKeyDown()) and (point.item or point.npc) then
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
    return handle_tooltip(tooltip, BFAAchievments_points[uiMapID] and BFAAchievments_points[uiMapID][coord])
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
    BFAAchievments_hidden[uiMapID][coord] = true
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
            info.text         = "HandyNotes_BfA-Achievments"
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
    local HL_Dropdown = CreateFrame("Frame", "HandyNotes_BfA-AchievmentsDropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        -- given we're in a click handler, this really *should* exist, but just in case...
        local point = BFAAchievments_points[currentZone] and BFAAchievments_points[currentZone][currentCoord]
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
            if value and BFAAchievments_should_show_point(state, value, currentZone, isMinimap) then
                local label, icon, _, _, _, scale, alpha = get_point_info(value)
                scale = (scale or 1) * (icon and icon.scale or 1) * BFAAchievments_db.icon_scale
                return state, nil, icon, scale, BFAAchievments_db.icon_alpha * alpha
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
        if minimap and BFAAchievments_map_spellids[uiMapID] then
            if BFAAchievments_map_spellids[mapFile] == true then
                return iter
            end
            if UnitHasBuff("player", BFAAchievments_map_spellids[mapFile]) then
                return iter
            end
        end
        return iter, BFAAchievments_points[uiMapID], nil
    end
end

---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New("HandyNotes_BfA-AchievmentsDB", BFAAchievments_defaults)
    BFAAchievments_db = self.db.profile
    BFAAchievments_hidden = self.db.char.hidden
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB("HandyNotes_BfA-Achievments", HLHandler, BFAAchievments_options)

    -- watch for LOOT_CLOSED
    self:RegisterEvent("LOOT_CLOSED", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_INDOORS", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", "HandyNotes_BfA-Achievments")
end


BFAAchievments_defaults = {
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
        icon_item = true,
        tooltip_item = true,
        tooltip_questid = false,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

BFAAchievments_options = {
    type = "group",
    name = "Achievments",
    get = function(info) return BFAAchievments_db[info[#info]] end,
    set = function(info, v)
        BFAAchievments_db[info[#info]] = v
        BFAAchievments_HL:SendMessage("HandyNotes_NotifyUpdate", "HandyNotes_BfA-Achievments")
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
                -- icon_item = {
                -- type = "toggle",
                -- name = "Use item icons",
                -- desc = "Show the icons for items, if known; otherwise, the achievement icon will be used",
                -- order = 0,
                -- },
                -- tooltip_item = {
                --     type = "toggle",
                --     name = "Use item tooltips",
                --     desc = "Show the full tooltips for items",
                --     order = 10,
                -- },
                found = {
                    type = "toggle",
                    name = L["Show found"],
                    desc = L["Show waypoints for items you've already found?"],
                    order = 20,
                },
                -- show_npcs = {
                --     type = "toggle",
                --     name = "Show NPCs",
                --     desc = "Show rare NPCs to be killed, generally for items or achievements",
                --     order = 30,
                -- },
                -- show_treasure = {
                --     type = "toggle",
                --     name = "Show treasure",
                --     desc = "Show treasure that can be looted",
                --     order = 30,
                -- },
                -- show_junk = {
                --     type = "toggle",
                --     name = "Junk",
                --     desc = "Show items which don't count for any achievement",
                --     order = 40,
                -- },
                -- repeatable = {
                --     type = "toggle",
                --     name = "Show repeatable",
                --     desc = "Show items which are repeatable? This generally means ones which have a daily tracking quest attached",
                --     order = 40,
                -- },
                -- tooltip_questid = {
                --     type = "toggle",
                --     name = "Show quest ids",
                --     desc = "Show the internal id of the quest associated with this node. Handy if you want to report a problem with it.",
                --     order = 40,
                -- },
                unhide = {
                    type = "execute",
                    name = L["Reset hidden nodes"],
                    desc = L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."],
                    func = function()
                        for map,coords in pairs(BFAAchievments_hidden) do
                            wipe(coords)
                        end
                        BFAAchievments_HL:Refresh()
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
BFAAchievments_should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not BFAAchievments_db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not BFAAchievments_db.show_on_world then
        return false
    end
    if point.level and point.level ~= currentLevel then
        return false
    end
    if BFAAchievments_hidden[currentZone] and BFAAchievments_hidden[currentZone][coord] then
        return false
    end
    if BFAAchievments_outdoors_only and IsIndoors() then
        return false
    end
    if point.junk and not BFAAchievments_db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not BFAAchievments_db.found) then
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
    -- if (not BFAAchievments_db.repeatable) and point.repeatable then
    --     return false
    -- end
    if not point.follower then
        if point.npc then
            if not BFAAchievments_db.show_npcs then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not BFAAchievments_db.show_treasure then
                return false
            end
        end
    end
    if point.hide_before and not BFAAchievments_db.upcoming and not allQuestsComplete(point.hide_before) then
        return false
    end
    return true
end


local AZERITE = 1553
local CHEST = 'Treasure Chest'
local CHEST_SM = 'Small Treasure Chest'
local CHEST_GLIM = 'Glimmering Treasure Chest'
local path = function(achievementID, criteriaIndex, label, questid, atlas, note, scale)
    label = label or L["Entrance"]
    atlas = atlas or "map-icon-SuramarDoor.tga" -- 'PortalPurple'
    return {
        quest = questid,
        achievement = achievementID,
        criteria = criteriaIndex,
        label = label,
        atlas = atlas,
        path = true,
        scale = scale,
        note = note,
    }
end
BFAAchievments_path = path

BFAAchievments_map_spellids = {
    -- [862] = 0, -- Zuldazar
    -- [863] = 0, -- Nazmir
    -- [864] = 0, -- Vol'dun
    -- [895] = 0, -- Tiragarde Sound
    -- [896] = 0, -- Drustvar
    -- [942] = 0, -- Stormsong Valley
}

BFAAchievments_points = {
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
    [51692825] = {achievement=13036, criteria=41566, note= L["Next to the river"],},
    [75506760] = {achievement=13036, criteria=41567, note= L["Between the roots"],},
    [48545460] = {achievement=13036, criteria=41569, note= L["At the destroyed pillar"]},
    [49004129] = {achievement=13036, criteria=41572, note= L["Above, at the pond on the big stone"],},
    [48203980] = path(13036, 41572),
    [43757672] = {achievement=13036, criteria=41573, note= L["In the eye of the skeleton, outside"],},
    [47842884] = {achievement=13036, criteria=41576, note= L["On the wall, behind the torch"],},        
    [67281762] = {achievement=13036, criteria=41577, note= L["Above, to the right of the small staircase"],},
    },

    [1165] = { -- Dazar'alor
    [53230940] = {achievement=13036, criteria=41581, note= L["Behind the NPC in the Corner"]},
    },

    [863] = { -- Nazmir
    [56355736] = {achievement=13024, criteria=41860, note= L["Inside a building ruins near the mountain"],},
    [43354811] = {achievement=13024, criteria=41861, note= L["Next to broken pillar as you enter the ruins"],},
    [51278510] = {achievement=13024, criteria=41862, note= L["Island between Nazmir and Zuldazar zones"],},
    [42555710] = {achievement=13024, criteria=42116, note= L["Near Kel'vax Deathwalker rare"],},
    [39123865] = {achievement=13036, criteria=41565, note= L["At the destroyed pillar on the left"],},
    [39575467] = {achievement=13036, criteria=41568, note= L["Scroll on the altar"],},
    [58924865] = {achievement=13036, criteria=41571, note= L["At the destroyed wall"],},
    [72850760] = {achievement=13036, criteria=41579, note= L["Under water, at the bottom, at the destroyed pillar"],},
    [65505090] = {label= L["Lost Spawn of Krag'wa #1"], quest=53418, achievement=13028, note= L["In an underwater cave"],},
    [65705000] = path(13028, 0, L["Cave entrance for #1"], 53418),
    [69605860] = {label= L["Lost Spawn of Krag'wa #2"],quest=53417, achievement=13028, note= L["In an underwater cave"],},
    [69105790] = path(13028, 0, L["Cave entrance for #2"], 53417),
    [56106490] = {label= L["Lost Spawn of Krag'wa #3"], quest=53419, achievement=13028, note= L["Between the huge roots"],},
    [44609280] = {label= L["Lost Spawn of Krag'wa #4"], quest=53422, achievement=13028, note= L["In cave"],},
    [45409130] = path(13028, 0, L["Cave entrance for #4"], 53422),
    [28908320] = {label= L["Lost Spawn of Krag'wa #5"], quest=53423 ,achievement=13028, note= L["In cave"],},
    [28308190] = path(13028, 0, L["Cave entrance for #5"], 53423),
    [27408170] = path(13028, 0, L["Way up to the cave #5"], 53423),
    [24209160] = {label= L["Lost Spawn of Krag'wa #6"], quest=53424, achievement=13028, note= L["Sits up between trees"],},
    [21706930] = {label= L["Lost Spawn of Krag'wa #7"], quest=53425, achievement=13028, note= L["Sits near the bridge behind the big tree"],},
    [34106180] = {label= L["Lost Spawn of Krag'wa #8"], quest=53421, achievement=13028, note= L["In cave"],},
    [33506160] = path(13028, 0, L["Cave entrance for #8"], 53421),
    [25604060] = {label= L["Lost Spawn of Krag'wa #9"], quest=53426, achievement=13028, note= L["Sits behind a curtain of scrub"],},
    [52804290] = {label= L["Lost Spawn of Krag'wa #10"], quest=53420, achievement=13028, note= L["Sits in a ruin"],},
    },

    [864] = { -- Vol'dun
    [38037097] = {achievement=13018, criteria=41363,}, -- tested
    [32126908] = {achievement=13018, criteria=41361,}, -- tested
    [47906249] = {achievement=13018, criteria=41360,}, -- tested
    [45786358] = {achievement=13018, criteria=41560, note= L["Along the pyramid edge"],}, -- Rickety Plank #4
    [54902136] = {achievement=13018, criteria=41362, note= L["On top of the slither snake"],}, -- Rickety Plank #5       
    [54703160] = path(13018, 41562),
    [42226211] = {achievement=13036, criteria=41564, note= L["In the pond"],},
    [27706212] = {achievement=13036, criteria=41570, note= L["Next to the withered tree"],},
    [49572457] = {achievement=13036, criteria=41574, note= L["Scroll next to the altar, behind the mobs"],},
    },

    [895] = { -- Tiragarde Sound
    },
    
    [896] = { -- Drustvar
    [37126380] = {achievement=13064, criteria=41436, note= L["At the bottom of the upper waterfall"],},
    [27354833] = {achievement=13064, criteria=41438, note= L["Under water"],},
    [27605760] = {achievement=13064, criteria=41441, note= L["Under water at the foot of the small waterfall"],},
    [19065787] = {achievement=13064, criteria=41443, note= L["Behind the scrub"],},
    [56558583] = {achievement=13064, criteria=41446, note= L["On the mountain, a bit difficult to find the way up (see path)"],},
    [62706970] = path(13064, 41446, L["Path to The Flayed Man: Start"]),
    [60107130] = path(13064, 41446, L["Path to The Flayed Man: Step 1"]),
    [58507420] = path(13064, 41446, L["Path to The Flayed Man: Step 2"]),
    [60307950] = path(13064, 41446, L["Path to The Flayed Man: Step 3"]),
    [57708100] = path(13064, 41446, L["Path to The Flayed Man: Step 4"]),
    [56608480] = path(13064, 41446, L["Path to The Flayed Man: End, jump down carefully"], 0),
    [50777371] = {achievement=13064, criteria=41437, note= L["Under the leaning tree"],},
    [59396668] = {achievement=13064, criteria=41439, note= L["At the destroyed wall"],},
    [50144232] = {achievement=13064, criteria=41442, note= L["At the destroyed wall"],},
    [46453723] = {achievement=13064, criteria=41445, note= L["At the destroyed wall"],},
    [44584566] = {achievement=13064, criteria=41449, note= L["In a cave, at the very back of the wall"],},
    [46304510] = path(13064, 41449, L["Path to Protectors of the Forest: cave entrance"]),
    },
    
    [942] = { -- Stormsong Valley
    },    
}