local VisionsOfNZoth = {}

VisionsOfNZoth_Class = function (name, parent, attrs)
    parent = parent or {}
    local Class = attrs or {}
    Class.getters = {}
    Class.setters = {}

    setmetatable(Class, {
        __call = function (self, instance)
            instance = instance or {}
            instance.__class = Class;

            local address = tostring(instance):gsub("table: ", "", 1)

            setmetatable(instance, {
                __tostring = function ()
                    return '<'..name..' object at '..address..'>'
                end,

                __index = function (self, index)
                    local getter = Class.getters[index]
                    if getter then return getter(self) end
                    return Class[index]
                end,

                __newindex = function (self, index, value)
                    local setter = Class.setters[index]
                    if setter then
                        setter(self, value)
                    else
                        rawset(self, index, value)
                    end
                end
            })

            local init = Class.init
            if init then init(instance) end

            return instance
        end,

        __tostring = function ()
            return '<class "'..name..'">'
        end,

        __index = parent
    })

    if parent then
        setmetatable(Class.getters, { __index = parent.getters })
        setmetatable(Class.setters, { __index = parent.setters })
        Class.__parent = parent
    else
        -- Add default init() method for base class
        Class.init = function (self) end
    end

    return Class
end

VisionsOfNZoth_isinstance = function (instance, class)
    local function compare (c1, c2)
        if c2 == nil then return false end
        if c1 == c2 then return true end
        return compare(c1, c2.__parent)
    end
    return compare(class, instance.__class)
end

VisionsOfNZoth_clone = function (instance, newattrs)
    local clone = {}
    for k, v in pairs(instance) do clone[k] = v end
    for k, v in pairs(newattrs or {}) do clone[k] = v end
    return instance.__class(clone)
end


-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local HandyNotes_VisionsOfNZoth = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_VisionsOfNZoth", "AceBucket-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes", true);

VisionsOfNZoth_maps = {};

VisionsOfNZoth_status = {
    Green = function (t) return string.format('(|cFF00FF00%s|r)', t) end,
    Gray = function (t) return string.format('(|cFF999999%s|r)', t) end,
    Red = function (t) return string.format('(|cFFFF0000%s|r)', t) end,
    Orange = function (t) return string.format('(|cFFFF8C00%s|r)', t) end
}

-------------------------------------------------------------------------------
----------------------------------- HELPERS -----------------------------------
-------------------------------------------------------------------------------

local function debug(...)
    if (HandyNotes_VisionsOfNZoth.db.profile.show_debug) then
        print(...)
    end
end

--VisionsOfNZoth_debug = debug

local DropdownMenu = CreateFrame("Frame", "HandyNotes_VisionsOfNZothDropdownMenu");
DropdownMenu.displayMode = "MENU";
local function initializeDropdownMenu (button, level, mapID, coord)
    if not level then return end
    local node = VisionsOfNZoth_maps[mapID].nodes[coord];
    local spacer = {text='', disabled=1, notClickable=1, notCheckable=1};

    if (level == 1) then
        UIDropDownMenu_AddButton({
            text=L["context_menu_title"], isTitle=1, notCheckable=1
        }, level);

        UIDropDownMenu_AddButton(spacer, level);

        if select(2, IsAddOnLoaded('TomTom')) then
            UIDropDownMenu_AddButton({
                text=L["context_menu_add_tomtom"], notCheckable=1,
                func=function (button)
                    local x, y = HandyNotes:getXY(coord);
                    TomTom:AddWaypoint(mapID, x, y, {
                        title = VisionsOfNZoth_NameResolver:GetCachedName(node.label),
                        persistent = nil,
                        minimap = true,
                        world = true
                    });
                end
            }, level);
        end

        UIDropDownMenu_AddButton({
            text=L["context_menu_hide_node"], notCheckable=1,
            func=function (button)
                HandyNotes_VisionsOfNZoth.db.char[mapID..'_coord_'..coord] = true;
                HandyNotes_VisionsOfNZoth:Refresh()
            end
        }, level);

        UIDropDownMenu_AddButton({
            text=L["context_menu_restore_hidden_nodes"], notCheckable=1,
            func=function ()
                table.wipe(HandyNotes_VisionsOfNZoth.db.char)
                HandyNotes_VisionsOfNZoth:Refresh()
            end
        }, level);

        UIDropDownMenu_AddButton(spacer, level);

        UIDropDownMenu_AddButton({
            text=CLOSE, notCheckable=1,
            func=function() CloseDropDownMenus() end
        }, level);
    end
end

-------------------------------------------------------------------------------
---------------------------------- CALLBACKS ----------------------------------
-------------------------------------------------------------------------------

function HandyNotes_VisionsOfNZoth:OnEnter(mapID, coord)
    local node = VisionsOfNZoth_maps[mapID].nodes[coord];
    local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip;

    if self:GetCenter() > UIParent:GetCenter() then
        tooltip:SetOwner(self, "ANCHOR_LEFT");
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT");
    end

    VisionsOfNZoth_NameResolver:Resolve(node.label, function (label)
        tooltip:SetText(label)

        -- optional top-right text
        if node.rlabel then
            local rtext = _G[tooltip:GetName()..'TextRight1']
            rtext:SetTextColor(1, 1, 1)
            rtext:SetText(node.rlabel)
            rtext:Show()
        end

        if node.sublabel then
            tooltip:AddLine(node.sublabel, 1, 1, 1)
        end

        if node.note and HandyNotes_VisionsOfNZoth.db.profile.show_notes then
            if node.sublabel then tooltip:AddLine(" ") end
            tooltip:AddLine(node.note, 1, 1, 1, true)
        end

        if HandyNotes_VisionsOfNZoth.db.profile.show_loot then
            local firstAchieve, firstOther = true, true
            for i, reward in ipairs(node.rewards or {}) do

                -- Add a blank line between achievements and other rewards
                local isAchieve = VisionsOfNZoth_isinstance(reward, VisionsOfNZoth_reward.Achievement)
                if isAchieve and firstAchieve then
                    tooltip:AddLine(" ")
                    firstAchieve = false
                elseif not isAchieve and firstOther then
                    tooltip:AddLine(" ")
                    firstOther = false
                end

                reward:render(tooltip);
            end
        end

        node._hover = true
        VisionsOfNZoth_MinimapDataProvider:RefreshAllData()
        VisionsOfNZoth_WorldMapDataProvider:RefreshAllData()
        tooltip:Show()
    end)
end

function HandyNotes_VisionsOfNZoth:OnLeave(mapID, coord)
    local node = VisionsOfNZoth_maps[mapID].nodes[coord]
    node._hover = false
    VisionsOfNZoth_MinimapDataProvider:RefreshAllData()
    VisionsOfNZoth_WorldMapDataProvider:RefreshAllData()
    if self:GetParent() == WorldMapButton then
        WorldMapTooltip:Hide();
    else
        GameTooltip:Hide();
    end
end

function HandyNotes_VisionsOfNZoth:OnClick(button, down, mapID, coord)
    local node = VisionsOfNZoth_maps[mapID].nodes[coord]
    if button == "RightButton" and down then
        DropdownMenu.initialize = function (button, level)
            initializeDropdownMenu(button, level, mapID, coord)
        end;
        ToggleDropDownMenu(1, nil, DropdownMenu, self, 0, 0)
    elseif button == "LeftButton" and down then
        if node.pois then
            node._focus = not node._focus
            VisionsOfNZoth_MinimapDataProvider:RefreshAllData()
            VisionsOfNZoth_WorldMapDataProvider:RefreshAllData()
            HandyNotes_VisionsOfNZoth:Refresh()
        end
    end
end

function HandyNotes_VisionsOfNZoth:OnInitialize()
    VisionsOfNZoth_faction = UnitFactionGroup('player')
    self.db = LibStub("AceDB-3.0"):New('HandyNotes_VisionsOfNZothDB', VisionsOfNZoth_optionDefaults, "Default")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function ()
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        self:ScheduleTimer("RegisterWithHandyNotes", 1)
    end)
end

-------------------------------------------------------------------------------
------------------------------------ MAIN -------------------------------------
-------------------------------------------------------------------------------

function HandyNotes_VisionsOfNZoth:RegisterWithHandyNotes()
    do
        local map, minimap
        local function iter(nodes, precoord)
            if not nodes then return nil end
            if minimap and self.db.profile.hide_minimap then return nil end
            local force = self.db.profile.force_nodes
            local coord, node = next(nodes, precoord)
            while coord do -- Have we reached the end of this zone?
                if node and (force or map:enabled(node, coord, minimap)) then
                    local icon, scale, alpha = node:display()
                    return coord, nil, icon, scale, alpha
                end
                coord, node = next(nodes, coord) -- Get next node
            end
            return nil, nil, nil, nil
        end
        function HandyNotes_VisionsOfNZoth:GetNodes2(mapID, _minimap)
            debug('Loading nodes for map: '..mapID..' (minimap='..tostring(_minimap)..')')
            map = VisionsOfNZoth_maps[mapID]
            minimap = _minimap

            if map then
                map:prepare()
                return iter, map.nodes, nil
            end

            -- mapID not handled by this plugin
            return iter, nil, nil
        end
    end

    if self.db.profile.development then
        VisionsOfNZoth_BootstrapDevelopmentEnvironment()
    end

    HandyNotes:RegisterPluginDB("HandyNotes_VisionsOfNZoth", self, VisionsOfNZoth_options)

    self:RegisterBucketEvent({ "LOOT_CLOSED", "PLAYER_MONEY", "SHOW_LOOT_TOAST", "SHOW_LOOT_TOAST_UPGRADE" }, 2, "Refresh")
    self:Refresh()
end

function HandyNotes_VisionsOfNZoth:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", "HandyNotes_VisionsOfNZoth")
end

local ICONS = "Interface\\Addons\\HandyNotes\\Icons\\icons.blp"
local ICONS_SIZE = 255

local function coords(x, y, grid, xo, yo)
    grid, xo, yo = grid or 32, xo or 0, yo or 0
    return { xo+x*grid, xo+(x+1)*grid-1, yo+y*grid, yo+(y+1)*grid-1 }
end

VisionsOfNZoth_icons = {

    ---------------------------------------------------------------------------
    ---------------------------------- GAME -----------------------------------
    ---------------------------------------------------------------------------

    default = "Interface\\Icons\\TRADE_ARCHAEOLOGY_CHESTOFTINYGLASSANIMALS",
    diablo_murloc = "Interface\\Icons\\inv_pet_diablobabymurloc.blp",
    emerald_cat = "Interface\\Icons\\trade_archaeology_catstatueemeraldeyes.blp",
    green_egg = "Interface\\Icons\\Inv_egg_02.blp",
    slime = "Interface\\Icons\\ability_creature_poison_05.blp",
    quest_chalice = 236669,

    ---------------------------------------------------------------------------
    -------------------------------- EMBEDDED ---------------------------------
    ---------------------------------------------------------------------------

    -- coords={l, r, t, b}

    quest_yellow = { icon=ICONS, coords=coords(0, 0) },
    quest_blue = { icon=ICONS, coords=coords(0, 1) },
    quest_orange = { icon=ICONS, coords=coords(0, 2) },
    quest_green = { icon=ICONS, coords=coords(0, 3) },
    quest_yellow_old = { icon=ICONS, coords=coords(0, 4) },
    quest_blue_old = { icon=ICONS, coords=coords(0, 5) },

    quest_repeat_yellow = { icon=ICONS, coords=coords(0, 6) },
    quest_repeat_blue = { icon=ICONS, coords=coords(0, 7) },
    quest_repeat_orange = { icon=ICONS, coords=coords(1, 0) },
    quest_repeat_blue_old = { icon=ICONS, coords=coords(1, 1) },

    peg_blue = { icon=ICONS, coords=coords(1, 2) },
    peg_red = { icon=ICONS, coords=coords(1, 3) },
    peg_green = { icon=ICONS, coords=coords(1, 4) },
    peg_yellow = { icon=ICONS, coords=coords(1, 5) },

    gpeg_red = { icon=ICONS, coords=coords(1, 6) },
    gpeg_green = { icon=ICONS, coords=coords(1, 7) },
    gpeg_yellow = { icon=ICONS, coords=coords(2, 7) },

    door_down = { icon=ICONS, coords=coords(2, 0) },
    door_left = { icon=ICONS, coords=coords(2, 1) },
    door_right = { icon=ICONS, coords=coords(2, 2) },
    door_up = { icon=ICONS, coords=coords(2, 3) },

    portal_blue = { icon=ICONS, coords=coords(2, 4) },
    portal_red = { icon=ICONS, coords=coords(2, 5) },

    chest_gray = { icon=ICONS, coords=coords(3, 0) },
    chest_yellow = { icon=ICONS, coords=coords(3, 1) },
    chest_orange = { icon=ICONS, coords=coords(3, 2) },
    chest_red = { icon=ICONS, coords=coords(3, 3) },
    chest_purple = { icon=ICONS, coords=coords(3, 4) },
    chest_blue = { icon=ICONS, coords=coords(3, 5) },
    chest_lblue = { icon=ICONS, coords=coords(3, 6) },
    chest_teal = { icon=ICONS, coords=coords(3, 7) },
    chest_camo = { icon=ICONS, coords=coords(4, 0) },
    chest_lime = { icon=ICONS, coords=coords(4, 1) },
    chest_brown = { icon=ICONS, coords=coords(4, 2) },
    chest_white = { icon=ICONS, coords=coords(4, 3) },

    paw_yellow = { icon=ICONS, coords=coords(4, 4) },
    paw_green = { icon=ICONS, coords=coords(4, 5) },

    skull_white = { icon=ICONS, coords=coords(4, 6) },
    skull_blue = { icon=ICONS, coords=coords(4, 7) },

    skull_white_red_glow = { icon=ICONS, coords=coords(0, 0, 48, 160) },
    skull_blue_red_glow = { icon=ICONS, coords=coords(0, 1, 48, 160) },
    skull_white_green_glow = { icon=ICONS, coords=coords(1, 0, 48, 160) },
    skull_blue_green_glow = { icon=ICONS, coords=coords(1, 1, 48, 160) },

    star_chest = { icon=ICONS, coords=coords(0, 2, 48, 160) },
    star_skull = { icon=ICONS, coords=coords(0, 3, 48, 160) },
    star_swords = { icon=ICONS, coords=coords(0, 4, 48, 160) },

    shootbox_blue = { icon=ICONS, coords=coords(1, 2, 48, 160) },
    shootbox_yellow = { icon=ICONS, coords=coords(1, 3, 48, 160) },
    shootbox_pink = { icon=ICONS, coords=coords(1, 4, 48, 160) }
};

for name, icon in pairs(VisionsOfNZoth_icons) do
    if type(icon) == 'table' then
        icon.tCoordLeft = icon.coords[1]/ICONS_SIZE
        icon.tCoordRight = icon.coords[2]/ICONS_SIZE
        icon.tCoordTop = icon.coords[3]/ICONS_SIZE
        icon.tCoordBottom = icon.coords[4]/ICONS_SIZE
        icon.coords = nil
    end
end

-------------------------------------------------------------------------------
---------------------------------- DEFAULTS -----------------------------------
-------------------------------------------------------------------------------

VisionsOfNZoth_optionDefaults = {
    profile = {
        -- icon scales
        icon_scale_caves = 1,
        icon_scale_other = 1,
        icon_scale_pet_battles = 1,
        icon_scale_rares = 1,
        icon_scale_treasures = 1,

        -- icon alphas
        icon_alpha_caves = 0.75,
        icon_alpha_other = 1.0,
        icon_alpha_pet_battles = 1.0,
        icon_alpha_rares = 0.75,
        icon_alpha_treasures = 0.75,

        -- visibility
        always_show_rares = false,
        always_show_treasures = false,
        hide_done_rare = false,
        hide_minimap = false,

        -- tooltip
        show_loot = true,
        show_notes = true,

        -- development
        development = false,
        show_debug = false,
        force_nodes = false
    },
};

-------------------------------------------------------------------------------
--------------------------------- OPTIONS UI ----------------------------------
-------------------------------------------------------------------------------

VisionsOfNZoth_options = {
    type = "group",
    name = L["VisionsOfNZoth"],
    get = function(info) return HandyNotes_VisionsOfNZoth.db.profile[info.arg] end,
    set = function(info, v) HandyNotes_VisionsOfNZoth.db.profile[info.arg] = v; HandyNotes_VisionsOfNZoth:Refresh() end,
    args = {}
}

VisionsOfNZoth_options.args.IconOptions = {
    type = "group",
    name = L["options_icon_settings"],
    inline = true,
    order = 0,
    args = {}
}

for i, group in ipairs{'treasures', 'rares', 'pet_battles', 'caves', 'other'} do
    VisionsOfNZoth_options.args.IconOptions.args['group_icon_'..group] = {
        type = "header",
        name = L["options_icons_"..group],
        order = i * 10,
    }

    VisionsOfNZoth_options.args.IconOptions.args['icon_scale_'..group] = {
        type = "range",
        name = L["options_scale"],
        desc = L["options_scale_desc"],
        min = 0.25, max = 3, step = 0.01,
        arg = "icon_scale_"..group,
        order = i * 10 + 1,
    }

    VisionsOfNZoth_options.args.IconOptions.args['icon_alpha_'..group] = {
        type = "range",
        name = L["options_opacity"],
        desc = L["options_opacity_desc"],
        min = 0, max = 1, step = 0.01,
        arg = "icon_alpha_"..group,
        order = i * 10 + 2,
    }
end

VisionsOfNZoth_options.args.VisibilityGroup = {
    type = "group",
    order = 10,
    name = L["options_visibility_settings"],
    inline = true,
    args = {
        groupGeneral = {
            type = "header",
            name = L["options_general_settings"],
            order = 30,
        },
        always_show_rares = {
            type = "toggle",
            arg = "always_show_rares",
            name = L["options_toggle_looted_rares"],
            desc = L["options_toggle_looted_rares_desc"],
            order = 31,
            width = "full",
        },
        always_show_treasures = {
            type = "toggle",
            arg = "always_show_treasures",
            name = L["options_toggle_looted_treasures"],
            desc = L["options_toggle_looted_treasures_desc"],
            order = 32,
            width = "full",
        },
        hide_done_rare = {
            type = "toggle",
            arg = "hide_done_rare",
            name = L["options_toggle_hide_done_rare"],
            desc = L["options_toggle_hide_done_rare_desc"],
            order = 35,
            width = "full",
        },
        hide_minimap = {
            type = "toggle",
            arg = "hide_minimap",
            name = L["options_toggle_hide_minimap"],
            desc = L["options_toggle_hide_minimap_desc"],
            order = 36,
            width = "full",
        },
    },
}

VisionsOfNZoth_options.args.TooltipGroup = {
    type = "group",
    order = 20,
    name = L["options_tooltip_settings"],
    inline = true,
    args = {
        show_loot = {
            type = "toggle",
            arg = "show_loot",
            name = L["options_toggle_show_loot"],
            desc = L["options_toggle_show_loot_desc"],
            order = 102,
        },
        show_notes = {
            type = "toggle",
            arg = "show_notes",
            name = L["options_toggle_show_notes"],
            desc = L["options_toggle_show_notes_desc"],
            order = 103,
        }
    }
}


-------------------------------------------------------------------------------
--------------------------------- DEVELOPMENT ---------------------------------
-------------------------------------------------------------------------------

--[[

To enable all development settings and functionality:

    1. Tweak any setting in the addon and exit the game.
    2. Open the settings file for this addon.
        WTF/Account/<account>/SavedVariables/HandyNotes_<this_addon>.lua
    3. Add a new line under profiles => Default.
        ["development"] = true,
    4. Save and star the game. You should now see development settings
       at the bottom of the addon settings window.

--]]

local function BootstrapDevelopmentEnvironment()
    -- Add development settings to the UI
    VisionsOfNZoth_options.args.DevelopmentGroup = {
        type = "group",
        order = 30,
        name = L["options_dev_settings"],
        desc = L["options_dev_settings_desc"],
        inline = true,
        args = {
            show_debug = {
                type = "toggle",
                arg = "show_debug",
                name = L["options_toggle_show_debug"],
                desc = L["options_toggle_show_debug_desc"],
                order = 1,
            },
            force_nodes = {
                type = "toggle",
                arg = "force_nodes",
                name = L["options_toggle_force_nodes"],
                desc = L["options_toggle_force_nodes_desc"],
                order = 3,
            }
        }
    }

    -- Print debug messages for each quest ID that is flipped
    local QTFrame = CreateFrame('Frame', "HandyNotes_VisionsOfNZothQT")
    local lastCheck = GetTime()
    local quests = {}
    local max_quest_id = 100000
    C_Timer.After(1, function ()
        -- Give some time for quest info to load in before we start
        for id = 0, max_quest_id do quests[id] = IsQuestFlaggedCompleted(id) end
        QTFrame:SetScript('OnUpdate', function ()
            if GetTime() - lastCheck > 1 then
                for id = 0, max_quest_id do
                    local s = IsQuestFlaggedCompleted(id)
                    if s ~= quests[id] then
                        --VisionsOfNZoth_debug('Quest', id, 'changed:', tostring(quests[id]), '=>', tostring(s))
                        quests[id] = s
                    end
                end
                lastCheck = GetTime()
            end
        end)
        --VisionsOfNZoth_debug('Quest IDs are now being tracked')
    end)

    -- Listen for LCTRL + LALT when the world map is open to display nodes
    -- that have already been cleared by quest ids.
    local IQFrame = CreateFrame('Frame', "HandyNotes_VisionsOfNZothIQ", WorldMapFrame)
    local groupPins = WorldMapFrame.pinPools.GroupMembersPinTemplate
    IQFrame:SetPropagateKeyboardInput(true)
    IQFrame:SetScript('OnKeyDown', function (_, key)
        if not VisionsOfNZoth_ignore_quests and (key == 'LCTRL' or key == 'LALT') then
            if IsLeftControlKeyDown() and IsLeftAltKeyDown() then
                IQFrame:SetPropagateKeyboardInput(false)
                VisionsOfNZoth_ignore_quests = true
                HandyNotes_VisionsOfNZoth:Refresh()

                -- Hide player pins on the map
                groupPins:GetNextActive():Hide()
            end
        end
    end)
    IQFrame:SetScript('OnKeyUp', function (_, key)
        if VisionsOfNZoth_ignore_quests and (key == 'LCTRL' or key == 'LALT') then
            IQFrame:SetPropagateKeyboardInput(true)
            VisionsOfNZoth_ignore_quests = false
            HandyNotes_VisionsOfNZoth:Refresh()

            -- Show player pins on the map
            groupPins:GetNextActive():Show()
        end
    end)
end

-------------------------------------------------------------------------------

VisionsOfNZoth_BootstrapDevelopmentEnvironment = BootstrapDevelopmentEnvironment


-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local Map = VisionsOfNZoth_Class('Map')

Map.id = 0
Map.intro = nil
Map.phased = true

function Map:init ()
    self.nodes = {}
end

function Map:prepare ()
    for coord, node in pairs(self.nodes) do
        VisionsOfNZoth_NameResolver:Prepare(node.label)
    end
end

function Map:enabled (node, coord, minimap)
    local db = HandyNotes_VisionsOfNZoth.db

    -- Check if the zone is still phased
    if node ~= self.intro and not self.phased then return false end

    -- Check if we've been hidden by the user
    if db.char[self.id..'_coord_'..coord] then return false end

    -- Check minimap, faction and quest completion
    if not node:enabled(self, coord, minimap) then return false end

    return true
end

-------------------------------------------------------------------------------
---------------------------- MINIMAP DATA PROVIDER ----------------------------
-------------------------------------------------------------------------------

local HBD = LibStub("HereBeDragons-2.0")
local HBDPins = LibStub("HereBeDragons-Pins-2.0")
local MinimapPinsKey = "HandyNotes_VisionsOfNZothMinimapPins"
local MinimapDataProvider = CreateFrame("Frame", "HandyNotes_VisionsOfNZothMinimapDP")

MinimapDataProvider.facing = GetPlayerFacing()
MinimapDataProvider.indoors = GetCVar("minimapZoom")+0 == Minimap:GetZoom() and "outdoor" or "indoor"
MinimapDataProvider.pins = {}
MinimapDataProvider.pool = {}

-- The HBD author has already figured out the scale values for each zoom level
MinimapDataProvider.scales = {
    indoor = {1, 1.25, 5/3, 2.5, 3.75, 6},
    outdoor = {1, 7/6, 1.4, 1.75, 7/3, 3.5}
}

-- These values for width/height seem to render the minimap POIs correctly. I
-- still haven't figured out how to get these values out of the API, these were
-- manually found by tweaking values at a 1.5 width/height ratio until things
-- looked right =/.
MinimapDataProvider.sizes = {
    [1527] = {1750, 1312},   -- Uldum
    [1530] = {700, 466}     -- Vale
}

function MinimapDataProvider:ReleasePin(pin)
    pin:Hide()
    self.pool[pin] = true
end

function MinimapDataProvider:ReleaseAllPins()
    for i, pin in ipairs(self.pins) do
        self:ReleasePin(pin)
    end
end

function MinimapDataProvider:AcquirePin(mapID, poi, ...)
    local pin = next(self.pool)
    if pin then
        self.pool[pin] = nil -- remove it from the pool
    else
        pin = self:CreatePin()
    end

    local scale = self.scales[self.indoors][Minimap:GetZoom()+1]
    local sizes = self.sizes[mapID] or {750, 500}
    pin.parentWidth = sizes[1] * scale
    pin.parentHeight = sizes[2] * scale

    local x, y = poi:draw(pin, ...)
    if GetCVar('rotateMinimap') == '1' then
        pin.texture:SetRotation(pin.texture:GetRotation() + math.pi*2 - self.facing)
    end
    HBDPins:AddMinimapIconMap(MinimapPinsKey, pin, mapID, x, y, true)
end

function MinimapDataProvider:CreatePin()
    local name = "HandyNotes_VisionsOfNZothPin"..(#self.pins + 1)
    local pin = CreateFrame("Button", name, Minimap)
    local texture = pin:CreateTexture(nil, "OVERLAY")
    pin:SetFrameLevel(Minimap:GetFrameLevel() + 3)
    pin:SetFrameStrata(Minimap:GetFrameStrata())
    pin:SetParent(Minimap)
    pin:SetWidth(12)
    pin:SetHeight(12)
    pin.texture = texture
    texture:SetAllPoints(pin)
    texture:SetTexelSnappingBias(0)
    texture:SetSnapToPixelGrid(false)
    pin:Hide()
    self.pins[#self.pins + 1] = pin
    return pin
end

function MinimapDataProvider:RefreshAllData()
    self.lastRefresh = GetTime()
    HBDPins:RemoveAllMinimapIcons(MinimapPinsKey)
    self:ReleaseAllPins()

    local map = VisionsOfNZoth_maps[HBD:GetPlayerZone()]
    if not map then return end

    for coord, node in pairs(map.nodes) do
        if node._focus or node._hover then
            for i, poi in ipairs(node.pois or {}) do
                poi:render(self, map.id)
            end
        end
    end
end

function MinimapDataProvider:OnUpdate()
    local facing = GetPlayerFacing()
    if facing ~= self.facing then
        if GetCVar('rotateMinimap') == '1' then
            self:RefreshAllData()
        end
        self.facing = facing
    end
end

MinimapDataProvider:SetScript('OnUpdate', function ()
    MinimapDataProvider:OnUpdate()
end)

HandyNotes_VisionsOfNZoth:RegisterEvent('MINIMAP_UPDATE_ZOOM', function (...)
    local zoom = Minimap:GetZoom()
    if GetCVar("minimapZoom") == GetCVar("minimapInsideZoom") then
        Minimap:SetZoom(zoom < 2 and zoom + 1 or zoom - 1)
    end
    MinimapDataProvider.indoors = GetCVar("minimapZoom")+0 == Minimap:GetZoom() and "outdoor" or "indoor"
    Minimap:SetZoom(zoom)
end)

hooksecurefunc(Minimap, "SetZoom", function ()
    MinimapDataProvider:RefreshAllData()
end)

-------------------------------------------------------------------------------
--------------------------- WORLD MAP DATA PROVIDER ---------------------------
-------------------------------------------------------------------------------

local WorldMapDataProvider = CreateFromMixins(MapCanvasDataProviderMixin)
local WorldMapPinTemplate = 'HandyNotes_VisionsOfNZothWorldMapPinTemplate'
local WorldMapPinMixin = CreateFromMixins(MapCanvasPinMixin)

_G['HandyNotes_VisionsOfNZothWorldMapPinMixin'] = WorldMapPinMixin

function WorldMapDataProvider:RemoveAllData()
    if self:GetMap() then
        self:GetMap():RemoveAllPinsByTemplate(WorldMapPinTemplate)
    end
end

function WorldMapDataProvider:RefreshAllData(fromOnShow)
    self:RemoveAllData()

    if not self:GetMap() then return end
    local map = VisionsOfNZoth_maps[self:GetMap():GetMapID()]
    if not map then return end

    for coord, node in pairs(map.nodes) do
        if node._focus or node._hover then
            for i, poi in ipairs(node.pois or {}) do
                poi:render(self:GetMap(), WorldMapPinTemplate)
            end
        end
    end
end

function WorldMapPinMixin:OnLoad()
    -- The MAP_HIGHLIGHT frame level is well below the level standard
    -- HandyNotes pins use, preventing mouseover conflicts
    self:UseFrameLevelType("PIN_FRAME_LEVEL_MAP_HIGHLIGHT")
end

function WorldMapPinMixin:OnAcquired(poi, ...)
    local l, b, w, h = self:GetParent():GetRect()
    self.parentWidth = w
    self.parentHeight = h
    if (w and h) then
        local x, y = poi:draw(self, ...)
        self:SetPosition(x, y)
    end
end

-------------------------------------------------------------------------------
------------------------------ HANDYNOTES HOOKS -------------------------------
-------------------------------------------------------------------------------

-- HandyNotes removes its data provider from the world map when the global
-- enable/disable checkbox is toggled at the top of its UI window. We need
-- to do the same thing here or our paths will still display.

local OnEnable = HandyNotes.OnEnable
local OnDisable = HandyNotes.OnDisable

function HandyNotes:OnEnable()
    OnEnable(self)
    if not HandyNotes.db.profile.enabled then return end
    WorldMapFrame:AddDataProvider(WorldMapDataProvider)
end

function HandyNotes:OnDisable()
    OnDisable(self)
    if WorldMapFrame.dataProviders[WorldMapDataProvider] then
        WorldMapFrame:RemoveDataProvider(WorldMapDataProvider)
    end
end

-------------------------------------------------------------------------------

VisionsOfNZoth_Map = Map
VisionsOfNZoth_MinimapDataProvider = MinimapDataProvider
VisionsOfNZoth_WorldMapDataProvider = WorldMapDataProvider


local isinstance = VisionsOfNZoth_isinstance

-------------------------------------------------------------------------------
------------------------------------ NODE -------------------------------------
-------------------------------------------------------------------------------

--[[

Base class for all displayed nodes.

    label (string): Tooltip title for this node
    icon (string|table): The icon texture to display
    alpha (float): The default alpha value for this type
    scale (float): The default scale value for this type
    minimap (bool): Should the node be displayed on the minimap
    quest (int|int[]): Quest IDs that cause this node to disappear
    requires (int|int[]): Quest IDs that must be true to appear
    rewards (Reward[]): Array of rewards for this node

--]]

local Node = VisionsOfNZoth_Class('Node')

Node.label = UNKNOWN
Node.minimap = true
Node.alpha = 1
Node.scale = 1
Node.icon = "default"
Node.group = "other"

function Node:init ()
    -- normalize quest ids as tables instead of single values
    for i, key in ipairs{'quest', 'requires'} do
        if type(self[key]) == 'number' then self[key] = {self[key]} end
    end

    if self.minimap == nil then
        self.minimap = true
    end
end

function Node:display ()
    local db = HandyNotes_VisionsOfNZoth.db
    local icon = self.icon
    if type(icon) == 'string' then
        icon = VisionsOfNZoth_icons[self.icon] or VisionsOfNZoth_icons.default
    end
    local scale = self.scale * (db.profile['icon_scale_'..self.group] or 1)
    local alpha = self.alpha * (db.profile['icon_alpha_'..self.group] or 1)
    return icon, scale, alpha
end

function Node:done ()
    for i, reward in ipairs(self.rewards or {}) do
        if not reward:obtained() then return false end
    end
    return true
end

function Node:enabled (map, coord, minimap)
    local db = HandyNotes_VisionsOfNZoth.db

    -- Minimap may be disabled for this node
    if not self.minimap and minimap then return false end

    -- Node may be faction restricted
    if self.faction and self.faction ~= VisionsOfNZoth_faction then return false end

    if not VisionsOfNZoth_ignore_quests then
        -- All attached quest ids must be false
        for i, quest in ipairs(self.quest or {}) do
            if IsQuestFlaggedCompleted(quest) then return false end
        end

        -- All required quest ids must be true
        for i, quest in ipairs(self.requires or {}) do
            if not IsQuestFlaggedCompleted(quest) then return false end
        end
    end

    return true
end

-------------------------------------------------------------------------------
------------------------------------ CAVE -------------------------------------
-------------------------------------------------------------------------------

local Cave = VisionsOfNZoth_Class('Cave', Node)

Cave.icon = "door_down"
Cave.scale = 1.2
Cave.group = "caves"

function Cave:init ()
    Node.init(self)

    if self.parent == nil then
        error('One or more parent nodes are required for Cave nodes')
    elseif isinstance(self.parent, Node) then
        -- normalize parent nodes as tables instead of single values
        self.parent = {self.parent}
    end
end

function Cave:enabled (map, coord, minimap)
    if not Node.enabled(self, map, coord, minimap) then return false end

    local function hasEnabledParent ()
        for i, parent in ipairs(self.parent or {}) do
            if parent:enabled(map, coord, minimap) then
                return true
            end
        end
        return false
    end

    -- Check if all our parents are hidden
    if not hasEnabledParent() then return false end

    return true
end

-------------------------------------------------------------------------------
------------------------------------- NPC -------------------------------------
-------------------------------------------------------------------------------

local NPC = VisionsOfNZoth_Class('NPC', Node)

function NPC:init ()
    Node.init(self)
    if not self.id then error('id required for NPC nodes') end
end

function NPC.getters:label ()
    return ("unit:Creature-0-0-0-0-%d"):format(self.id)
end

-------------------------------------------------------------------------------
---------------------------------- PETBATTLE ----------------------------------
-------------------------------------------------------------------------------

local PetBattle = VisionsOfNZoth_Class('PetBattle', NPC)

PetBattle.icon = "paw_yellow"
PetBattle.group = "pet_battles"

-------------------------------------------------------------------------------
------------------------------------ QUEST ------------------------------------
-------------------------------------------------------------------------------

local Quest = VisionsOfNZoth_Class('Quest', Node)

Quest.note = AVAILABLE_QUEST

function Quest:init ()
    Node.init(self)
    C_QuestLog.GetQuestInfo(self.quest[1]) -- fetch info from server
end

function Quest.getters:icon ()
    return self.daily and 'quest_blue' or 'quest_yellow'
end

function Quest.getters:label ()
    return C_QuestLog.GetQuestInfo(self.quest[1])
end

-------------------------------------------------------------------------------
------------------------------------ RARE -------------------------------------
-------------------------------------------------------------------------------

local Rare = VisionsOfNZoth_Class('Rare', NPC)

Rare.group = "rares"

function Rare.getters:icon ()
    if self._focus then
        return self:done() and 'skull_white_green_glow' or 'skull_blue_green_glow'
    end
    if HandyNotes_VisionsOfNZoth.db.profile.development and not self.quest then
        return self:done() and 'skull_white_red_glow' or 'skull_blue_red_glow'
    end
    return self:done() and 'skull_white' or 'skull_blue'
end

function Rare.getters:scale ()
    if self._focus or (HandyNotes_VisionsOfNZoth.db.profile.development and not self.quest) then
        return 2.3
    end
    return 1.5
end

function Rare:enabled (map, coord, minimap)
    local db = HandyNotes_VisionsOfNZoth.db
    if db.profile.hide_done_rare and self:done() then return false end
    if db.profile.always_show_rares then return true end
    return NPC.enabled(self, map, coord, minimap)
end

-------------------------------------------------------------------------------
----------------------------------- SUPPLY ------------------------------------
-------------------------------------------------------------------------------

local Supply = VisionsOfNZoth_Class('Supply', Node)

Supply.icon = "star_chest"
Supply.scale = 2
Supply.group = "treasures"

-------------------------------------------------------------------------------
---------------------------------- TREASURE -----------------------------------
-------------------------------------------------------------------------------

local Treasure = VisionsOfNZoth_Class('Treasure', Node)

Treasure.icon = "chest_gray"
Treasure.scale = 1.3
Treasure.group = "treasures"

function Treasure:enabled (map, coord, minimap)
    local db = HandyNotes_VisionsOfNZoth.db
    if db.profile.always_show_treasures then return true end
    return Node.enabled(self, map, coord, minimap)
end

-------------------------------------------------------------------------------

VisionsOfNZoth_node = {
    Node=Node,
    Cave=Cave,
    NPC=NPC,
    PetBattle=PetBattle,
    Quest=Quest,
    Rare=Rare,
    Supply=Supply,
    Treasure=Treasure
}

local Green = VisionsOfNZoth_status.Green
local Orange = VisionsOfNZoth_status.Orange
local Red = VisionsOfNZoth_status.Red

-------------------------------------------------------------------------------
----------------------------------- REWARD ------------------------------------
-------------------------------------------------------------------------------

local Reward = VisionsOfNZoth_Class('Reward')

function Reward:obtained ()
    return true
end

function Reward:render (tooltip)
    tooltip:AddLine('Render not implemented: '..tostring(self))
end

-------------------------------------------------------------------------------
--------------------------------- ACHIEVEMENT ---------------------------------
-------------------------------------------------------------------------------

-- /run print(GetAchievementCriteriaInfo(ID, NUM))

local Achievement = VisionsOfNZoth_Class('Achievement', Reward)
local GetCriteriaInfo = GetAchievementCriteriaInfoByID

function Achievement:init ()
    -- we allow a single number, table of numbers or table of
    -- objects: {id=<number>, note=<string>}
    if type(self.criteria) == 'number' then
        self.criteria = {{id=self.criteria}}
    else
        local crittab = {}
        for i, criteria in ipairs(self.criteria) do
            if type(criteria) == 'number' then
                crittab[#crittab + 1] = {id=criteria}
            else
                crittab[#crittab + 1] = criteria
            end
        end
        self.criteria = crittab
    end
end

function Achievement:obtained ()
    if select(4, GetAchievementInfo(self.id)) then return true end
    for i, c in ipairs(self.criteria) do
        local _, _, completed = GetAchievementCriteriaInfoByID(self.id, c.id)
        if not completed then return false end
    end
    return true
end

function Achievement:render (tooltip)
    local _,name,_,completed,_,_,_,_,_,icon = GetAchievementInfo(self.id)
    tooltip:AddLine(ACHIEVEMENT_COLOR_CODE..'['..name..']|r')
    tooltip:AddTexture(icon, {margin={right=2}})
    for i, c in ipairs(self.criteria) do
        local cname,_,ccomp,qty,req = GetCriteriaInfo(self.id, c.id)
        if (cname == '') then cname = qty..'/'..req end

        local r, g, b = .6, .6, .6
        local ctext = "   ? "..cname..(c.suffix or '')
        if (completed or ccomp) then
            r, g, b = 0, 1, 0
        end

        if c.note and HandyNotes_VisionsOfNZoth.db.profile.show_notes then
            tooltip:AddDoubleLine(ctext, c.note, r, g, b)
        else
            tooltip:AddLine(ctext, r, g, b)
        end
    end
end

-------------------------------------------------------------------------------
------------------------------------ ITEM -------------------------------------
-------------------------------------------------------------------------------

local Item = VisionsOfNZoth_Class('Item', Reward)

function Item:init ()
    if not self.item then
        error('Item() reward requires an item id to be set')
    end
    self.itemLink = L["retrieving"]
    self.itemIcon = 'Interface\\Icons\\Inv_misc_questionmark'
    local item = _G.Item:CreateFromItemID(self.item)
    if not item:IsItemEmpty() then
        item:ContinueOnItemLoad(function()
            self.itemLink = item:GetItemLink()
            self.itemIcon = item:GetItemIcon()
        end)
    end
end

function Item:obtained ()
    if self.quest then return IsQuestFlaggedCompleted(self.quest) end
    return true
end

function Item:render (tooltip)
    local text = self.itemLink
    local status = ''
    if self.quest then
        local completed = IsQuestFlaggedCompleted(self.quest)
        status = completed and Green(L['completed']) or Red(L['incomplete'])
    elseif self.weekly then
        local completed = IsQuestFlaggedCompleted(self.weekly)
        status = completed and Green(L['weekly']) or Red(L['weekly'])
    end

    if self.note then
        text = text..' ('..self.note..')'
    end
    tooltip:AddDoubleLine(text, status)
    tooltip:AddTexture(self.itemIcon, {margin={right=2}})
end

-------------------------------------------------------------------------------
------------------------------------ MOUNT ------------------------------------
-------------------------------------------------------------------------------

-- /run for i,m in ipairs(C_MountJournal.GetMountIDs()) do if (C_MountJournal.GetMountInfoByID(m) == "NAME") then print(m); end end

local Mount = VisionsOfNZoth_Class('Mount', Item)

function Mount:obtained ()
    return select(11, C_MountJournal.GetMountInfoByID(self.id))
end

function Mount:render (tooltip)
    local collected = select(11, C_MountJournal.GetMountInfoByID(self.id))
    local status = collected and Green(L["known"]) or Red(L["missing"])
    tooltip:AddDoubleLine(self.itemLink..' ('..L["mount"]..')', status)
    tooltip:AddTexture(self.itemIcon, {margin={right=2}})
end

-------------------------------------------------------------------------------
------------------------------------- PET -------------------------------------
-------------------------------------------------------------------------------

-- /run print(C_PetJournal.FindPetIDByName("NAME"))

local Pet = VisionsOfNZoth_Class('Pet', Item)

function Pet:obtained ()
    return C_PetJournal.GetNumCollectedInfo(self.id) > 0
end

function Pet:render (tooltip)
    local n, m = C_PetJournal.GetNumCollectedInfo(self.id)
    local status = (n > 0) and Green(n..'/'..m) or Red(n..'/'..m)
    tooltip:AddDoubleLine(self.itemLink..' ('..L["pet"]..')', status)
    tooltip:AddTexture(self.itemIcon, {margin={right=2}})
end

-------------------------------------------------------------------------------
------------------------------------ QUEST ------------------------------------
-------------------------------------------------------------------------------

local Quest = VisionsOfNZoth_Class('Quest', Reward)

function Quest:init ()
    if type(self.id) == 'number' then
        self.id = {self.id}
    end
    C_QuestLog.GetQuestInfo(self.id[1]) -- fetch info from server
end

function Quest:obtained ()
    for i, id in ipairs(self.id) do
        if not IsQuestFlaggedCompleted(id) then return false end
    end
    return true
end

function Quest:render (tooltip)
    local name = C_QuestLog.GetQuestInfo(self.id[1])

    local status = ''
    if #self.id == 1 then
        local completed = IsQuestFlaggedCompleted(self.id[1])
        status = completed and Green(L['completed']) or Red(L['incomplete'])
    else
        local count = 0
        for i, id in ipairs(self.id) do
            if IsQuestFlaggedCompleted(id) then count = count + 1 end
        end
        status = count..'/'..#self.id
        status = (count == #self.id) and Green(status) or Red(status)
    end

    local icon = VisionsOfNZoth_icons.quest_chalice
    tooltip:AddDoubleLine((name or UNKNOWN), status)
    tooltip:AddTexture(icon, {
        width = 12,
        height = 12,
        margin = { right=5 }
    })
end

-------------------------------------------------------------------------------
------------------------------------- TOY -------------------------------------
-------------------------------------------------------------------------------

local Toy = VisionsOfNZoth_Class('Toy', Item)

function Toy:obtained ()
    return PlayerHasToy(self.item)
end

function Toy:render (tooltip)
    local collected = PlayerHasToy(self.item)
    local status = collected and Green(L["known"]) or Red(L["missing"])
    tooltip:AddDoubleLine(self.itemLink..' ('..L["toy"]..')', status)
    tooltip:AddTexture(self.itemIcon, {margin={right=2}})
end

-------------------------------------------------------------------------------
---------------------------------- TRANSMOG -----------------------------------
-------------------------------------------------------------------------------

local Transmog = VisionsOfNZoth_Class('Transmog', Item)
local CTC = C_TransmogCollection

function Transmog:obtained ()
    -- Check if the player knows the appearance
    if CTC.PlayerHasTransmog(self.item) then return true end

    -- Verify the item drops for any of the players specs
    local specs = GetItemSpecInfo(self.item)
    if type(specs) == 'table' and #specs == 0 then return true end

    -- Verify the player can learn the item's appearance
    local sourceID = select(2, CTC.GetItemInfo(self.item))
    if not select(2, CTC.PlayerCanCollectSource(sourceID)) then return true end

    return false
end

function Transmog:render (tooltip)
    local collected = CTC.PlayerHasTransmog(self.item)
    local status = collected and Green(L["known"]) or Red(L["missing"])

    if not collected then
        -- check if we can't learn this item
        local sourceID = select(2, CTC.GetItemInfo(self.item))
        if not select(2, CTC.PlayerCanCollectSource(sourceID)) then
            status = Orange(L["unlearnable"])
        else
            -- check if the item doesn't drop
            local specs = GetItemSpecInfo(self.item)
            if type(specs) == 'table' and #specs == 0 then
                status = Orange(L["unobtainable"])
            end
        end
    end

    local suffix = ' ('..L[self.slot]..')'
    if self.note and HandyNotes_VisionsOfNZoth.db.profile.show_notes then
        suffix = suffix..' ('..self.note..')'
    end

    tooltip:AddDoubleLine(self.itemLink..suffix, status)
    tooltip:AddTexture(self.itemIcon, {margin={right=2}})
end

-------------------------------------------------------------------------------

VisionsOfNZoth_reward = {
    Reward=Reward,
    Achievement=Achievement,
    Item=Item,
    Mount=Mount,
    Pet=Pet,
    Quest=Quest,
    Toy=Toy,
    Transmog=Transmog
}

-------------------------------------------------------------------------------
-------------------------- POI (Point of Interest) ----------------------------
-------------------------------------------------------------------------------

local POI = VisionsOfNZoth_Class('POI')

function POI:render (map, template)
    -- draw a circle at every coord
    for i=1, #self, 1 do
        map:AcquirePin(template, self, self[i])
    end
end

function POI:draw (pin, xy)
    local t = pin.texture
    t:SetTexCoord(0, 1, 0, 1)
    t:SetVertexColor(0, 0.5, 1, 1)
    t:SetTexture("Interface\\AddOns\\HandyNotes\\Icons\\circle")
    pin:SetAlpha(0.75)
    pin:SetSize(10, 10)
    return HandyNotes:getXY(xy)
end

-------------------------------------------------------------------------------
------------------------------------ BLOB -------------------------------------
-------------------------------------------------------------------------------

local Blob = VisionsOfNZoth_Class('Blob')

-------------------------------------------------------------------------------
------------------------------------ PATH -------------------------------------
-------------------------------------------------------------------------------

local Path = VisionsOfNZoth_Class('Path', POI)

function Path:render (map, template)
    -- draw a circle at every coord and a line between them
    for i=1, #self, 1 do
        map:AcquirePin(template, self, 'circle', self[i])
        if i < #self then
            map:AcquirePin(template, self, 'line', self[i], self[i+1])
        end
    end
end

function Path:draw (pin, type, xy1, xy2)
    local t = pin.texture
    t:SetTexCoord(0, 1, 0, 1)
    t:SetVertexColor(0, 0.5, 1, 1)
    t:SetTexture("Interface\\AddOns\\HandyNotes\\Icons\\"..type)

    pin:SetAlpha(0.75)
    if type == 'circle' then
        pin:SetSize(5, 5)
        return HandyNotes:getXY(xy1)
    else
        local x1, y1 = HandyNotes:getXY(xy1)
        local x2, y2 = HandyNotes:getXY(xy2)
        local x1p = x1 * pin.parentWidth
        local x2p = x2 * pin.parentWidth
        local y1p = y1 * pin.parentHeight
        local y2p = y2 * pin.parentHeight
        pin:SetSize(sqrt((x2p-x1p)^2 + (y2p-y1p)^2), 60)
        t:SetRotation(-math.atan2(y2p-y1p, x2p-x1p))
        return (x1+x2)/2, (y1+y2)/2
    end
end

-------------------------------------------------------------------------------

VisionsOfNZoth_poi = {
    POI=POI,
    Path=Path
}


-------------------------------------------------------------------------------
------------------------------ DATAMINE TOOLTIP -------------------------------
-------------------------------------------------------------------------------

local NameResolver = CreateFrame("GameTooltip", "HandyNotes_VisionsOfNZoth_NameResolver", UIParent, "GameTooltipTemplate")

NameResolver.cache = {}
NameResolver.prepared = {}

NameResolver:SetOwner(UIParent, "ANCHOR_NONE")
NameResolver:HookScript("OnTooltipSetUnit", function(self)
    local callback = self.callback
    if callback then
        local name = _G[self:GetName().."TextLeft1"]:GetText()
        self.cache[self.link] = name
        self.callback = nil
        self.link = nil
        callback(name)
    end
end)

function NameResolver:GetCachedName (link)
    if self:IsLink(link) then
        return self.cache[link] or UNKNOWN
    end
    return link
end

function NameResolver:IsLink (link)
    return strsub(link, 1, 5) == 'unit:'
end

function NameResolver:Prepare (link)
    if self:IsLink(link) and not (self.cache[link] or self.prepared[link]) then
        self:SetHyperlink(link)
        self.prepared[link] = true
    end
end

function NameResolver:Resolve (link, callback)
    -- may be passed a raw name or a hyperlink to be resolved
    if self:IsLink(link) then
        local name = self.cache[link]
        if name and name ~= '' then
            callback(name)
        else
            self.link = link
            self.callback = callback
            self:SetHyperlink(link)
        end
    else
        callback(link)
    end
end

-------------------------------------------------------------------------------

VisionsOfNZoth_NameResolver = NameResolver



-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local Map = VisionsOfNZoth_Map
local clone = VisionsOfNZoth_clone
local isinstance = VisionsOfNZoth_isinstance

local Node = VisionsOfNZoth_node.Node
local Cave = VisionsOfNZoth_node.Cave
local NPC = VisionsOfNZoth_node.NPC
local PetBattle = VisionsOfNZoth_node.PetBattle
local Rare = VisionsOfNZoth_node.Rare
local Supply = VisionsOfNZoth_node.Supply
local Treasure = VisionsOfNZoth_node.Treasure

local Achievement = VisionsOfNZoth_reward.Achievement
local Item = VisionsOfNZoth_reward.Item
local Mount = VisionsOfNZoth_reward.Mount
local Pet = VisionsOfNZoth_reward.Pet
local Quest = VisionsOfNZoth_reward.Quest
local Toy = VisionsOfNZoth_reward.Toy
local Transmog = VisionsOfNZoth_reward.Transmog

local Path = VisionsOfNZoth_poi.Path
local POI = VisionsOfNZoth_poi.POI

local options = VisionsOfNZoth_options.args.VisibilityGroup.args
local defaults = VisionsOfNZoth_optionDefaults.profile

local AQR, EMP, AMA = 0, 1, 2 -- assaults

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1527, phased=false })
local nodes = map.nodes

local function GetAssault ()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(map.id)
    if textures and textures[1].fileDataIDs[1] == 3165083 then
        --VisionsOfNZoth_debug('Uldum assault: AQR')
        return AQR -- left
    elseif textures and textures[1].fileDataIDs[1] == 3165092 then
        --VisionsOfNZoth_debug('Uldum assault: EMP')
        return EMP -- middle
    elseif textures and textures[1].fileDataIDs[1] == 3165098 then
        --VisionsOfNZoth_debug('Uldum assault: AMA')
        return AMA -- right
    end
end

function map:prepare ()
    Map.prepare(self)
    self.assault = GetAssault()
    self.phased = self.assault ~= nil
end

function map:enabled (node, coord, minimap)
    if not Map.enabled(self, node, coord, minimap) then return false end

    if node == map.intro then return true end

    local assault = node.assault
    if assault then
        assault = type(assault) == 'number' and {assault} or assault
        for i=1, #assault + 1, 1 do
            if i > #assault then return false end
            if assault[i] == self.assault then break end
        end
    end

    local profile = HandyNotes_VisionsOfNZoth.db.profile
    if isinstance(node, Treasure) then return profile.chest_uldum end
    if isinstance(node, Supply) then return profile.chest_uldum end
    if isinstance(node, Rare) then return profile.rare_uldum end
    if isinstance(node, PetBattle) then return profile.pet_uldum end

    return true
end

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

defaults['chest_uldum'] = true
defaults['rare_uldum'] = true
defaults['pet_uldum'] = true

options.groupUldum = {
    type = "header",
    name = L["uldum"],
    order = 0,
}

options.chestUldum = {
    type = "toggle",
    arg = "chest_uldum",
    name = L["options_toggle_chests"],
    desc = L["options_toggle_chests_desc"],
    order = 1,
    width = "normal",
}

options.rareUldum = {
    type = "toggle",
    arg = "rare_uldum",
    name = L["options_toggle_rares"],
    desc = L["options_toggle_rares_desc"],
    order = 2,
    width = "normal",
}

options.petUldum = {
    type = "toggle",
    arg = "pet_uldum",
    name = L["options_toggle_battle_pets"],
    desc = L["options_toggle_battle_pets_desc"],
    order = 3,
    width = "normal",
}

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = VisionsOfNZoth_Class('Intro', Node)

Intro.note = L["uldum_intro_note"]
Intro.icon = 'quest_yellow'
Intro.scale = 3

function Intro:enabled ()
    if not Node.enabled(self) then return false end
    return map.assault == nil
end

function Intro.getters:label ()
    return select(2, GetAchievementInfo(14153)) -- Uldum Under Assault
end

-- Where the Heart is => Surfacing Threats
local Q = Quest({id={58583, 58506, 56374, 56209, 56375, 56472, 56376}})

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({faction='Alliance', rewards={
        Quest({id={58496, 58498}}), Q
    }})
else
    map.intro = Intro({faction='Horde', rewards={
        Quest({id={58582}}), Q
    }})
end

nodes[46004300] = map.intro

HandyNotes_VisionsOfNZoth:RegisterEvent('QUEST_WATCH_UPDATE', function (_, index)
    local _, _, _, _, _, _, _, questID = GetQuestLogTitle(index)
    if questID == 56376 then
        --VisionsOfNZoth_debug('Uldum assaults unlock detected')
        C_Timer.After(1, function()
            HandyNotes_VisionsOfNZoth:Refresh()
        end)
    end
end)

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

nodes[64572623] = Rare({id=157170, quest=57281, assault=AMA, note=L["chamber_of_the_stars"]}) -- Acolyte Taspu
nodes[66817436] = Rare({id=158557, quest=57669, assault=EMP}) -- Actiss the Deceiver
-- nodes[] = Rare({id=157593, quest=nil, rewards={
--     Pet({id=2851, item=174478}) -- Wicked Lurker
-- }}) -- Amalgamation of Flesh
nodes[69714973] = Rare({id=151883, quest=55468, assault=AMA, pois={
    Path({68645049, 69714973, 70955041, 71425210, 71005388, 69855463, 68695394, 68225217, 68645049})
}}) -- Anaua
nodes[32426443] = Rare({id=155703, quest=56834}) -- Anq'uri the Titanic
nodes[38732500] = Rare({id=154578, quest=58612, note=L["aqir_flayer"], pois={
    POI({ -- Aqir Hive Worker
        41202497, 40472249, 39882209, 38942459, 37102236, 36502179, 37782046,
        36761891, 37591749, 36041891, 35691808, 33551946, 32251624, 35031801,
        35292068, 33461670, 35102299, 37981821, 40952468
    }),
    POI({ -- Aqir Reaper
        41863885, 41264078, 41494146, 41104233, 40464372, 40624452, 40834550,
        39984480, 39814467, 39254356, 37994321, 37584213, 39764251, 39333892,
        29816310, 32056727, 32426645, 33646358, 37094853
    })
}}) -- Aqir Flayer
nodes[31245691] = Rare({id=154576, quest=58614, note=L["aqir_titanus"], pois={
    POI({30266161, 30076533, 31496674, 33356610, 32486946, 34856598}),
    Path({37295892, 36485588, 37285284}),
    Path({38134884, 36535023, 34765141, 32935159}),
    Path({33325836, 33865418}),
    Path({26795106, 27055372, 27025596}),
    Path({28526114, 28975921, 28805676, 28945481}),
    Path({43194180, 42864292, 41284445, 40884731}),
    Path({40864255, 41714037}),
    Path({38314290, 40354482}),
    Path({32994510, 35434436, 36284239}),
    Path({41243247, 40503334, 39233745})
}}) -- Aqir Titanus
nodes[38214521] = Rare({id=162172, quest=58694, note=L["aqir_warcaster"], pois={
    POI({
        29666397, 30346691, 30396549, 30946805, 31296612, 31316747, 31546811,
        31586663, 31906347, 32256093, 32796516, 32856283, 33046590, 33246733,
        33656812, 33666517, 33976361, 34446875, 34466522, 36844697, 38284543,
        39303882, 39314582, 39754049, 39873790, 39944596, 40033882, 40144315,
        40214146, 40233654, 40264433, 40544320, 40883978, 40894302, 40924132,
        41463988, 41993776, 42913735
    }) -- Aqir Voidcaster
}}) -- Aqir Warcaster
nodes[44854235] = Rare({id=162370, quest=58718, assault=AQR}) -- Armagedillo
nodes[65035129] = Rare({id=152757, quest=55710, assault=AMA, note=L["atekhramun"]}) -- Atekhramun
nodes[45605777] = Rare({id=162171, quest=58699, assault=AQR, note=L["chamber_of_the_sun"]}) -- Captain Dunewalker
nodes[75345222] = Rare({id=157167, quest=nil, assault=AMA}) -- Champion Sen-mat
nodes[30854971] = Rare({id=162147, quest=58696, assault=AQR, rewards={
    Mount({id=1319, item=174769}) -- Malevolent Drone
}}) -- Corpse Eater
nodes[49363822] = Rare({id=158594, quest=57672, assault=EMP}) -- Doomsayer Vathiris
nodes[48657067] = Rare({id=158491, quest=57662, assault=EMP, pois={
    Path({53287082, 54066945, 53446815, 49866959, 48097382, 46537211, 46257561, 44217851})
}}) -- Falconer Amenophis
nodes[75056816] = Rare({id=157120, quest=57258, assault=AMA}) -- Fangtaker Orsa
nodes[55085317] = Rare({id=158633, quest=57680, assault=EMP, rewards={
    Toy({item=175140}) -- All-Seeing Eye
}, note=L["left_eye"]}) -- Gaze of N'Zoth
nodes[54694317] = Rare({id=158597, quest=57675, assault=EMP}) -- High Executor Yothrim
nodes[52398000] = Rare({id=158528, quest=57664, assault=EMP, note=L["reshef"], pois={
    POI({51568173, 51578293, 53657939, 54147941, 49028263, 49008194}) -- Voidwarped High Guard
}}) -- High Guard Reshef
nodes[42485873] = Rare({id=162163, quest=58701, assault=AQR, pois={
    Path({42485873, 44396076, 46215988, 46785800, 46465623, 44545616, 43055653, 42485873})
}}) -- High Priest Ytaessis
nodes[80504715] = Rare({id=151995, quest=55502, assault=AMA, pois={
    Path({80504715, 79804519, 77204597})
}}) -- Hik-Ten the Taskmaster
nodes[60033950] = Rare({id=160623, quest=58206, assault=EMP, note=L["hmiasma"]}) -- Hungering Miasma
nodes[19755847] = Rare({id=155531, quest=56823, note=L["wastewander"], pois={
    POI({
        17896249, 18026020, 18406490, 18966279, 19176080, 19626403, 19696174,
        19976498, 20036084, 20336267, 20686052, 20796452, 21365790, 22056027,
        22086169, 22135658, 22156465, 22656370, 22905737, 22976012, 23205863,
        23246283, 23706188, 24146211, 24316070, 24366309, 24495822, 24616524,
        24806225, 25306412
    }) -- Wastewander Host
}}) -- Infested Wastewander Captain
nodes[73908353] = Rare({id=157134, quest=57259, rewards={
    Mount({id=1314, item=174641}) -- Drake of the Four Winds
}}) -- Ishak of the Four Winds
nodes[71237375] = Rare({id=156655, quest=57433, assault=EMP}) -- Korzaran the Slaughterer
nodes[34681890] = Rare({id=154604, quest=56340, assault=AQR, note=L["chamber_of_the_moon"], rewards={
    Pet({id=2847, item=174475}) -- Rotbreath
}}) -- Lord Aj'qirai
nodes[30476602] = Rare({id=156078, quest=56952, assault=AQR, pois={
    POI({30476602, 33696573})
}}) -- Magus Rehleth
nodes[66842035] = Rare({id=157157, quest=57277, assault=AMA}) -- Muminah the Incandescent
nodes[62012454] = Rare({id=152677, quest=55684, assault=AMA}) -- Nebet the Ascended
nodes[35071729] = Rare({id=162196, quest=58681}) -- Obsidian Annihilator
nodes[37505978] = Rare({id=162142, quest=58693, assault=AQR}) -- Qho
nodes[58175712] = Rare({id=156299, quest=57430, assault={AQR, EMP}, pois={
    Path({51055121, 52684913, 54554907, 56165227, 56795451, 58095721, 58536856})
}}) -- R'khuzj the Unfathomable
nodes[28651339] = Rare({id=162173, quest=58864, assault=AQR, pois={
    Path({
        38031012, 36071044, 34261112, 31611053, 29200919, 27930731, 26460550,
        24980615, 24810886, 26881180, 28651339, 28381641, 29341853, 29392137,
        29472409, 29822663, 30342939, 30333188, 30103380
    })
}}) -- R'krox the Runt
nodes[68593204] = Rare({id=157146, quest=57273, assault=AMA, rewards={
    Mount({id=1317, item=174753}) -- Waste Marauder
}}) -- Rotfeaster
nodes[69714215] = Rare({id=152040, quest=55518, assault=AMA}) -- Scoutmaster Moswen
nodes[73536459] = Rare({id=151948, quest=55496, assault=AMA}) -- Senbu the Pridefather
nodes[57003794] = Rare({id=161033, quest=58333, assault=EMP, pois={
    POI({57003794, 52174326})
}})-- Shadowmaw
nodes[58558282] = Rare({id=156654, quest=57432, assault=EMP}) -- Shol'thoss the Doomspeaker
nodes[61297484] = Rare({id=160532, quest=58169, assault={AQR, EMP}}) -- Shoth the Darkened
nodes[21236105] = Rare({id=162140, quest=58697, assault=AQR, rewards={
    Pet({id=2848, item=174476}) -- Aqir Tunneler
}, pois={
    Path({22486168, 21316279, 19896347, 19356128, 20345804, 21435846, 24325860, 24866015, 24406194, 22486168})
}}) -- Skikx'traz
nodes[66676804] = Rare({id=162372, quest=58715, assault={AQR, AMA}, pois={
    POI({58038282, 66676804, 70997407})
}}) -- Spirit of Cyrus the Black
nodes[49944011] = Rare({id=162352, quest=58716, assault={AQR, AMA}, note=L["in_water_cave"]}) -- Spirit of Dark Ritualist Zakahn
nodes[52154012] = Cave({parent=nodes[49944011], assault={AQR, AMA}, label=L["spirit_cave"]}) -- Entrance
nodes[78986389] = Rare({id=151878, quest=58613}) -- Sun King Nahkotep
nodes[84785704] = Rare({id=151897, quest=55479, assault=AMA}) -- Sun Priestess Nubitt
nodes[73347447] = Rare({id=151609, quest=55353, assault=AMA}) -- Sun Prophet Epaphos
nodes[65903522] = Rare({id=152657, quest=55682, assault=AMA, pois={
    Path({68043800, 64873862, 64503660, 65903522, 67003162, 67743515, 68043800})
}}) -- Tat the Bonechewer
nodes[49328235] = Rare({id=158636, quest=57688, assault=EMP, note=L["platform"], rewards={
    Toy({item=169303}) -- Hell-Bent Bracers
}}) -- The Grand Executor
nodes[67486382] = Rare({id=152788, quest=55716, assault=AMA, note=L["uatka"]}) -- Uat-ka the Sun's Wrath
nodes[33592569] = Rare({id=162170, quest=58702, assault=AQR}) -- Warcaster Xeshro
nodes[79505217] = Rare({id=151852, quest=55461, assault=AMA, pois={
    Path({77755217, 81265217})
}}) -- Watcher Rehu
-- nodes[] = Rare({id=157473, quest=nil, rewards={
--     Toy({item=174874}) -- Budget K'thir Disguise
-- }}) -- Yiphrim the Will Ravager
nodes[80165708] = Rare({id=157164, quest=57279, assault=AMA}) -- Zealot Tekem
nodes[39694159] = Rare({id=162141, quest=58695, assault=AQR}) -- Zuythiz

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

local AQRChest = VisionsOfNZoth_Class('AQRChest', Treasure, {
    assault=AQR, label=L["infested_cache"]
})

local AQRTR1 = AQRChest({quest=58138, icon='chest_blue'})
local AQRTR2 = AQRChest({quest=58139, icon='chest_purple'})
local AQRTR3 = AQRChest({quest=58140, icon='chest_orange'})
local AQRTR4 = AQRChest({quest=58141, icon='chest_yellow'})
local AQRTR5 = AQRChest({quest=58142, icon='chest_teal'})

-- quest=58138
nodes[45845698] = clone(AQRTR1, {note=L["chamber_of_the_sun"]})
nodes[46525801] = AQRTR1
nodes[50555882] = AQRTR1
nodes[51736032] = AQRTR1
-- quest=58139
nodes[31166796] = AQRTR2
nodes[32764770] = AQRTR2
nodes[32976010] = AQRTR2
nodes[33366210] = AQRTR2
-- quest=58140
nodes[18356130] = AQRTR3
nodes[19836512] = AQRTR3
nodes[23055936] = AQRTR3
nodes[24525507] = AQRTR3
-- quest=58141
nodes[36032024] = AQRTR4
nodes[37484577] = AQRTR4
nodes[38774014] = AQRTR4
nodes[39754504] = AQRTR4
-- quest=58142
nodes[28030834] = AQRTR5
nodes[30671611] = AQRTR5
nodes[33953036] = AQRTR5
nodes[35413157] = AQRTR5

nodes[36252324] = Supply({quest=nil, assault=AQR, label=L["infested_strongbox"], note=L["chamber_of_the_moon"]})

-------------------------------------------------------------------------------

local EMPChest = VisionsOfNZoth_Class('EMPChest', Treasure, {
    assault=EMP, label=L["black_empire_cache"]
})

local EMPTR1 = EMPChest({quest=57623, icon='chest_blue'})
local EMPTR2 = EMPChest({quest=57624, icon='chest_purple'})
local EMPTR3 = EMPChest({quest=57626, icon='chest_orange'})
local EMPTR4 = EMPChest({quest=57627, icon='chest_yellow'})
local EMPTR5 = EMPChest({quest=57635, icon='chest_teal'})
--local EMPTR6 = EMPChest({quest=nil, icon='chest_lime'})

-- quest=57623
nodes[58361535] = EMPTR1
-- quest=57624
nodes[50793143] = EMPTR2
-- quest=57626
nodes[57817487] = EMPTR3
nodes[59226749] = EMPTR3
nodes[61778172] = EMPTR3
nodes[62588188] = EMPTR3
nodes[62977610] = EMPTR3
nodes[70217325] = EMPTR3
-- quest=57627
nodes[60757493] = EMPTR4
nodes[62157346] = EMPTR4
nodes[62737184] = EMPTR4
nodes[67167394] = EMPTR4
-- quest=57635
nodes[45697961] = EMPTR5
nodes[47507687] = EMPTR5
nodes[51707135] = EMPTR5
nodes[51777298] = EMPTR5
nodes[52197757] = EMPTR5

local EMPCOFF = Supply({quest=nil, assault=EMP, note=L["cursed_relic"],
    label=L["black_empire_coffer"]})

nodes[71657334] = EMPCOFF

-------------------------------------------------------------------------------

local AMAChest = VisionsOfNZoth_Class('AMAChest', Treasure, {
    assault=AMA, label=L["amathet_cache"]
})

local AMATR1 = AMAChest({quest=55689, icon='chest_blue'})
local AMATR2 = AMAChest({quest=55690, icon='chest_purple'})
local AMATR3 = AMAChest({quest=55691, icon='chest_orange'})
local AMATR4 = AMAChest({quest=55698, icon='chest_yellow'})
local AMATR5 = AMAChest({quest=55699, icon='chest_teal'})
local AMATR6 = AMAChest({quest=55700, icon='chest_lime'})

-- quest=55689
nodes[80785611] = AMATR1
nodes[81585359] = AMATR1
nodes[84534540] = AMATR1
nodes[84836185] = AMATR1
nodes[85275138] = AMATR1
nodes[85285297] = AMATR1
-- quest=55690
nodes[71226851] = AMATR2
nodes[71305922] = AMATR2
nodes[72216422] = AMATR2
nodes[73117297] = AMATR2
nodes[73987095] = AMATR2
nodes[78286207] = AMATR2
nodes[79166486] = AMATR2
-- quest=55691
nodes[72474857] = AMATR3
nodes[74195187] = AMATR3
nodes[75335579] = AMATR3
nodes[75575372] = AMATR3
nodes[78125302] = AMATR3
-- quest=55698
nodes[71884388] = AMATR4
nodes[72944350] = AMATR4
nodes[74364390] = AMATR4
nodes[75134608] = AMATR4
nodes[76344679] = AMATR4
nodes[79314578] = AMATR4
-- quest=55699 (no blizzard minimap icon for this one?)
nodes[63084970] = AMATR5
nodes[64094488] = AMATR5
nodes[65403796] = AMATR5
nodes[69744236] = AMATR5
nodes[69874163] = AMATR5
-- quest=55700
nodes[60932455] = AMATR6
nodes[61343060] = AMATR6
nodes[63122508] = clone(AMATR6, {note=L["chamber_of_the_stars"]})
nodes[63532160] = AMATR6
nodes[65882147] = clone(AMATR6, {note=L["chamber_of_the_stars"]})
nodes[67172800] = clone(AMATR6, {note=L["chamber_of_the_stars"]})
nodes[68222051] = AMATR6

local AMACOFF = Supply({quest=55692, assault=AMA,
    label=L["amathet_reliquary"], sublabel=L["tolvir_relic"]})

nodes[64463415] = clone(AMACOFF, {note=L["chamber_of_the_stars"]})
nodes[67464294] = AMACOFF
nodes[73337356] = AMACOFF
nodes[73685054] = AMACOFF
nodes[75914194] = AMACOFF

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

nodes[35453159] = PetBattle({id=162465}) -- Aqir Sandcrawler
nodes[57604356] = PetBattle({id=162466}) -- Blotto
nodes[62043188] = PetBattle({id=162458}) -- Retinus the Seeker
nodes[61745440] = PetBattle({id=162461}) -- Whispers

-------------------------------------------------------------------------------
------------------------------- SPRINGFUR ALPACA ------------------------------
-------------------------------------------------------------------------------

-- daily 58879, final 58887
nodes[58005169] = Node({icon=134190, quest={58879, 58887}, label=L["gersahl"], note=L["gersahl_note"], pois={
    POI({
        46922961, 49453556, 50583294, 55484468, 56265101, 56691882, 57112548,
        57235056, 57458491, 57474682, 57741910, 58005169, 58202808, 58967759,
        59027433, 59098568, 59567664, 60447755, 65167045, 65427433, 66047881,
        66257753, 67377771, 68097535, 68117202, 68517407, 68947308, 71087875,
        71657803
    })
}, rewards={Item({item=174858})}})

nodes[47004800] = NPC({id=162765, icon=2916287, quest={58879, 58887}, note=L["friendly_alpaca"], pois={
    POI({30002900, 39000800, 41007000, 47004800, 52001900, 55006900, 76636813})
}, rewards={
    Mount({id=1329, item=174859}) -- Springfur Alpaca
}})

-------------------------------------------------------------------------------

VisionsOfNZoth_maps[map.id] = map

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local Map = VisionsOfNZoth_Map
local clone = VisionsOfNZoth_clone
local isinstance = VisionsOfNZoth_isinstance

local Node = VisionsOfNZoth_node.Node
local PetBattle = VisionsOfNZoth_node.PetBattle
local Rare = VisionsOfNZoth_node.Rare
local Supply = VisionsOfNZoth_node.Supply
local Treasure = VisionsOfNZoth_node.Treasure

local Achievement = VisionsOfNZoth_reward.Achievement
local Item = VisionsOfNZoth_reward.Item
local Mount = VisionsOfNZoth_reward.Mount
local Pet = VisionsOfNZoth_reward.Pet
local Quest = VisionsOfNZoth_reward.Quest
local Toy = VisionsOfNZoth_reward.Toy
local Transmog = VisionsOfNZoth_reward.Transmog

local Path = VisionsOfNZoth_poi.Path
local POI = VisionsOfNZoth_poi.POI

local options = VisionsOfNZoth_options.args.VisibilityGroup.args
local defaults = VisionsOfNZoth_optionDefaults.profile

local MAN, MOG, EMP = 0, 1, 2 -- assaults

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1530, phased=false })
local nodes = map.nodes

local function GetAssault()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(map.id)
    if textures and textures[1].fileDataIDs[1] == 3155826 then
        --VisionsOfNZoth_debug('Vale assault: MAN')
        return MAN -- left
    elseif textures and textures[1].fileDataIDs[1] == 3155832 then
        --VisionsOfNZoth_debug('Vale assault: MOG')
        return MOG -- middle
    elseif textures and textures[1].fileDataIDs[1] == 3155841 then
        --VisionsOfNZoth_debug('Vale assault: EMP')
        return EMP -- right
    end
end

function map:prepare ()
    Map.prepare(self)
    self.assault = GetAssault()
    self.phased = self.assault ~= nil
end

function map:enabled (node, coord, minimap)
    if not Map.enabled(self, node, coord, minimap) then return false end

    if node == map.intro then return true end

    local assault = node.assault
    if assault then
        assault = type(assault) == 'number' and {assault} or assault
        for i=1, #assault + 1, 1 do
            if i > #assault then return false end
            if assault[i] == self.assault then break end
        end
    end

    local profile = HandyNotes_VisionsOfNZoth.db.profile
    if isinstance(node, Treasure) then return profile.chest_vale end
    if isinstance(node, Supply) then return profile.chest_vale end
    if isinstance(node, Rare) then return profile.rare_vale end
    if isinstance(node, PetBattle) then return profile.pet_vale end

    return true
end

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

defaults['chest_vale'] = true
defaults['rare_vale'] = true
defaults['pet_vale'] = true

options.groupVale = {
    type = "header",
    name = L["vale"],
    order = 10,
}

options.chestVale = {
    type = "toggle",
    arg = "chest_vale",
    name = L["options_toggle_chests"],
    desc = L["options_toggle_chests_desc"],
    order = 11,
    width = "normal",
}

options.rareVale = {
    type = "toggle",
    arg = "rare_vale",
    name = L["options_toggle_rares"],
    desc = L["options_toggle_rares_desc"],
    order = 12,
    width = "normal",
}

options.petVale = {
    type = "toggle",
    arg = "pet_vale",
    name = L["options_toggle_battle_pets"],
    desc = L["options_toggle_battle_pets_desc"],
    order = 13,
    width = "normal",
}

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = VisionsOfNZoth_Class('Intro', Node)

Intro.note = L["vale_intro_note"]
Intro.icon = 'quest_yellow'
Intro.scale = 3

function Intro:enabled ()
    if not Node.enabled(self) then return false end
    return map.assault == nil
end

function Intro.getters:label ()
    return select(2, GetAchievementInfo(14154)) -- Defend the Vale
end

-- Where the Heart is => Surfacing Threats
local Q1 = Quest({id={58583, 58506, 56374, 56209, 56375, 56472, 56376}})
-- Forging Onward => Magni's Findings
local Q2 = Quest({id={56377, 56536, 56537, 56538, 56539, 56771, 56540}})

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({faction='Alliance', rewards={
        Quest({id={58496, 58498}}), Q1, Q2
    }})
else
    map.intro = Intro({faction='Horde', rewards={
        Quest({id={58582}}), Q1, Q2
    }})
end

nodes[26005200] = map.intro

HandyNotes_VisionsOfNZoth:RegisterEvent('QUEST_ACCEPTED', function (_, _, id)
    if id == 56540 then
        --VisionsOfNZoth_debug('Vale assaults unlock detected')
        C_Timer.After(1, function()
            HandyNotes_VisionsOfNZoth:Refresh()
        end)
    end
end)

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

nodes[20007460] = Rare({id=160825, quest=58300, assault=MAN}) -- Amber-Shaper Esh'ri
nodes[34156805] = Rare({id=157466, quest=57363, assault=MOG, rewards={
    Mount({id=1328, item=174840}) -- Xinlao
}}) -- Anh-De the Loyal
nodes[57084098] = Rare({id=154447, quest=56237, assault=EMP}) -- Brother Meller
nodes[06487070] = Rare({id=160878, quest=58307, assault=MAN}) -- Buh'gzaki the Blasphemous
nodes[06406433] = Rare({id=160893, quest=58308, assault=MAN, pois={
    Path({06476733, 06416420, 04016423, 04025675, 03985061, 06484877, 06484597})
}}) -- Captain Vor'lek
nodes[81226450] = Rare({id=154467, quest=56255, assault=EMP}) -- Chief Mek-mek
nodes[18806841] = Rare({id=157183, quest=58296, assault=MOG, pois={
    POI({16806672, 18316516, 19026494, 20166403, 20816263, 20866845, 21016961, 19927330, 18607211})
}}) -- Coagulated Anima
nodes[66556794] = Rare({id=154559, quest=56323, assault=EMP, note=L["big_blossom_mine"]}) -- Deeplord Zrihj
nodes[26506657] = Rare({id=160872, quest=58304, assault=MAN}) -- Destroyer Krox'tazar
nodes[41505721] = Rare({id=157287, quest=57349, assault=MOG, pois={
    Path({41745982, 40446144, 38995953, 39805740, 41505721, 45405297})
}}) -- Dokani Obliterator
nodes[11854081] = Rare({id=160874, quest=58305, assault=MAN}) -- Drone Keeper Ak'thet
nodes[10474089] = Rare({id=160876, quest=58306, assault=MAN}) -- Enraged Amber Elemental
nodes[45244524] = Rare({id=157267, quest=57343, assault=EMP, pois={
    Path({44174609, 45244524, 45324176, 44783891})
}}) -- Escaped Mutation
nodes[29513800] = Rare({id=157153, quest=57344, assault=MOG, rewards={
    Mount({id=1297, item=173887}) -- Clutch of Ha-Li
}, pois={
    Path({37323630, 33973378, 29053930, 31524387, 37313632, 37323630})
}}) -- Ha-Li
nodes[28895272] = Rare({id=160810, quest=58299, assault=MAN}) -- Harbinger Il'koxik
nodes[12835129] = Rare({id=160868, quest=58303, assault=MAN}) -- Harrier Nir'verash
nodes[28214047] = Rare({id=157171, quest=57347, assault=MOG}) -- Heixi the Stonelord
nodes[19736082] = Rare({id=160826, quest=58301, assault=MAN}) -- Hive-Guard Naz'ruzek
nodes[12183091] = Rare({id=157160, quest=57345, assault=MOG, rewards={
    Mount({id=1327, item=174841}) -- Ren's Stalwart Hound
}, pois={
    Path({13132578, 11833049, 08953570})
}}) -- Houndlord Ren
nodes[18426557] = Rare({id=160930, quest=58312, assault=MAN}) -- Infused Amber Ooze
nodes[17201162] = Rare({id=160968, quest=58295, assault=MOG, note=L["jadec"]}) -- Jade Colossus
nodes[26691061] = Rare({id=157290, quest=57350, assault=MOG, note=L["in_small_cave"]}) -- Jade Watcher
nodes[17850918] = Rare({id=160920, quest=58310, assault=MAN}) -- Kal'tik the Blight
nodes[45985858] = Rare({id=157266, quest=57341, assault=EMP, pois={
    Path({45985858, 48645963, 50576511, 48936926, 45877046, 43096817, 42486336, 45985858})
}}) -- Kilxl the Gaping Maw
nodes[25673816] = Rare({id=160867, quest=58302, assault=MAN}) -- Kzit'kovok
nodes[14813374] = Rare({id=160922, quest=58311, assault=MAN}) -- Needler Zhesalla
nodes[90314599] = Rare({id=154106, quest=56094, assault=EMP}) -- Quid
nodes[21901232] = Rare({id=157162, quest=57346, assault=MOG, note=L["guolai"]}) -- Rei Lun
nodes[64175175] = Rare({id=154490, quest=56302, assault=EMP}) -- Rijz'x the Devourer
nodes[46425710] = Rare({id=156083, quest=56954, assault=MOG}) -- Sanguifang
nodes[17873752] = Rare({id=157291, quest=57351, assault=MOG}) -- Spymaster Hul'ach
nodes[26057505] = Rare({id=157279, quest=57348, assault=MOG, pois={
    Path({23467717, 25247587, 26837367, 27117143})
}}) -- Stormhowl
nodes[29132207] = Rare({id=156424, quest=58507, assault=MOG, rewards={
    Toy({item=174873}) -- Trans-mogu-rifier
}}) -- Tashara
nodes[47496373] = Rare({id=154600, quest=56332, assault=MOG}) -- Teng the Awakened
nodes[52024173] = Rare({id=157176, quest=57342, assault=EMP, note=L["platform"], rewards={
    Pet({id=2845, item=174473}) -- K'uddly
}}) -- The Forgotten
nodes[09586736] = Rare({id=157468, quest=57364, note=L["tisiphon"]}) -- Tisiphon
nodes[86664165] = Rare({id=154394, quest=56213, assault=EMP}) -- Veskan the Fallen
nodes[66732812] = Rare({id=154332, quest=56183, assault=EMP, note=L["pools_of_power"]}) -- Voidtender Malketh
nodes[52956225] = Rare({id=154495, quest=56303, assault=EMP, rewards={
    Toy({item=175140}), -- All-Seeing Eye
    Pet({id=2846, item=174474}) -- Corrupted Tentacle
}, note=L["right_eye"]}) -- Will of N'Zoth
nodes[53794889] = Rare({id=157443, quest=57358, assault=MOG}) -- Xiln the Mountain
nodes[70954053] = Rare({id=154087, quest=56084, assault=EMP}) -- Zror'um the Infinite

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

local MANChest = VisionsOfNZoth_Class('MANChest', Treasure, {
    assault=MAN, label=L["ambered_cache"]
})

local MANTR1 = MANChest({quest=58224, icon='chest_blue'})
local MANTR2 = MANChest({quest=58225, icon='chest_purple'})
local MANTR3 = MANChest({quest=58226, icon='chest_orange'})
local MANTR4 = MANChest({quest=58227, icon='chest_yellow'})
local MANTR5 = MANChest({quest=58228, icon='chest_teal'})
--local MANTR6 = MANChest({quest=nil, icon='chest_lime'})

-- quest=58224
nodes[07223945] = MANTR1
nodes[10662334] = MANTR1
nodes[11552553] = MANTR1
nodes[15797164] = MANTR1
-- quest=58225
nodes[16021946] = MANTR2
nodes[17432634] = MANTR2
nodes[21051415] = MANTR2
-- quest=58226
nodes[07693682] = MANTR3
nodes[09302831] = MANTR3
nodes[15083162] = MANTR3
nodes[15324320] = MANTR3
nodes[16343312] = MANTR3
-- quest=58227
nodes[22903439] = MANTR4
nodes[24994118] = MANTR4
nodes[26704680] = MANTR4
nodes[31724184] = MANTR4
-- quest=58228
nodes[07356617] = MANTR5
nodes[15406394] = MANTR5
nodes[16096581] = MANTR5
nodes[19897504] = MANTR5
nodes[21506269] = MANTR5

nodes[21586246] = Supply({quest=58770, assault=MAN, label=L["ambered_coffer"]})

-------------------------------------------------------------------------------

local MOGChest = VisionsOfNZoth_Class('MOGChest', Treasure, {
    assault=MOG, label=L["mogu_plunder"]
})

local MOGTR1 = MOGChest({quest=57206, icon='chest_blue', note=L["guolai"]})
local MOGTR2 = MOGChest({quest=57208, icon='chest_purple'})
local MOGTR3 = MOGChest({quest=57209, icon='chest_orange'})
local MOGTR4 = MOGChest({quest=57211, icon='chest_yellow'})
local MOGTR5 = MOGChest({quest=57212, icon='chest_teal'})
local MOGTR6 = MOGChest({quest=57213, icon='chest_lime'})

-- quest=57206
nodes[13500720] = MOGTR1
nodes[20221140] = MOGTR1
nodes[20441477] = MOGTR1
nodes[27061822] = MOGTR1
nodes[23850753] = MOGTR1
-- quest=57208
nodes[20462833] = MOGTR2
nodes[24773504] = MOGTR2
nodes[30283762] = MOGTR2
nodes[30983065] = MOGTR2
nodes[33503481] = MOGTR2
-- quest=57209
nodes[19281942] = MOGTR3
nodes[20311853] = MOGTR3
nodes[21271385] = MOGTR3
nodes[32721893] = MOGTR3
-- quest=57211
nodes[15496436] = MOGTR4
nodes[16704468] = MOGTR4
nodes[17356860] = MOGTR4
nodes[21356297] = MOGTR4
nodes[29774890] = MOGTR4
-- quest=57212
nodes[42436854] = MOGTR5
nodes[44186853] = MOGTR5
nodes[47937093] = MOGTR5
nodes[48466580] = MOGTR5
-- quest=57213
nodes[32097104] = MOGTR6
nodes[33876683] = MOGTR6
nodes[37666584] = MOGTR6
nodes[38417028] = MOGTR6

nodes[10782831] = Supply({quest=57214, assault=MOG, label=L["mogu_strongbox"]})
nodes[43134209] = Supply({quest=57214, assault=MOG, label=L["mogu_strongbox"]})

-------------------------------------------------------------------------------

local EMPChest = VisionsOfNZoth_Class('EMPChest', Treasure, {
    assault=EMP, label=L["black_empire_cache"]
})

local EMPTR1 = EMPChest({quest=57197, icon='chest_blue'})
local EMPTR2 = EMPChest({quest=57199, icon='chest_purple', note=L["pools_of_power"]})
local EMPTR3 = EMPChest({quest=57200, icon='chest_orange'})
local EMPTR4 = EMPChest({quest=57201, icon='chest_yellow'})
local EMPTR5 = EMPChest({quest=57202, icon='chest_teal', note=L["big_blossom_mine"]})
local EMPTR6 = EMPChest({quest=57203, icon='chest_lime'})

-- quest=57197
nodes[42024621] = EMPTR1
nodes[42314323] = EMPTR1
nodes[42814020] = EMPTR1
nodes[44483693] = EMPTR1
nodes[46314037] = EMPTR1
nodes[50673444] = EMPTR1
nodes[52673967] = EMPTR1
nodes[53884179] = EMPTR1
-- quest=57199
nodes[56113034] = EMPTR2
nodes[56152716] = EMPTR2
nodes[61422747] = EMPTR2
nodes[67222783] = EMPTR2
nodes[69933311] = EMPTR2
nodes[70282286] = EMPTR2
nodes[73242533] = EMPTR2
-- quest=57200
nodes[57334165] = EMPTR3
nodes[59605624] = EMPTR3
nodes[62585721] = EMPTR3
nodes[65855969] = EMPTR3
nodes[67565584] = EMPTR3
-- quest=57201
nodes[77413129] = EMPTR4
nodes[78305251] = EMPTR4
nodes[78435833] = EMPTR4
nodes[79034330] = EMPTR4
nodes[81363381] = EMPTR4
nodes[87813771] = EMPTR4
-- quest=57202
nodes[60806337] = EMPTR5
nodes[63107059] = EMPTR5
nodes[71516854] = EMPTR5
-- quest=57203
nodes[42456853] = EMPTR6
nodes[44196852] = EMPTR6
nodes[47947095] = EMPTR6
nodes[48476579] = EMPTR6
nodes[51136323] = EMPTR6
nodes[52266732] = EMPTR6

local EMPCOFF = Supply({quest=57628, assault=EMP,
    label=L["black_empire_coffer"], sublabel=L["cursed_relic"]})

nodes[53116634] = EMPCOFF
nodes[54804100] = clone(EMPCOFF, {note=L["platform"]})
nodes[62975086] = EMPCOFF
nodes[68662806] = clone(EMPCOFF, {note=L["pools_of_power"]})
nodes[69516094] = EMPCOFF
nodes[76626437] = EMPCOFF

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

nodes[28553494] = PetBattle({id=162470}) -- Baruk Stone Defender
nodes[56172822] = PetBattle({id=162468}) -- K'tiny the Mad
nodes[57465427] = PetBattle({id=162469}) -- Tormentius
nodes[07333190] = PetBattle({id=162471}) -- Vil'thik Hatchling

-------------------------------------------------------------------------------

VisionsOfNZoth_maps[map.id] = map