-- -------------------------------------------------------------------------------------------------------------------
-- options: Settings and defaults
-- These options display in the addon options to turn on and off options

-- setup -------------------------------------------------------------------------------------------------------------
local myname, ns = ...

-- default value table -----------------------------------------------------------------------------------------------
ns.defaults = {
    profile = {
        show_on_city = true,
        show_on_minimap = false,
        show_on_northrend = true,

        show_ships = true,
        show_misc = true,
        show_spoilers = false,
        show_alliance = true,
        show_horde = true,
        show_neutral = true,
        show_villain = true,
        show_camp = true,
        show_supplies = true,
        show_event = true,
        show_vehicles = true,
        show_campaign = true,

        use_custom = false,
        custom_filter = nil,

        hide_closed = true,
        hide_empty = false,
        hide_novendor = true,
        hide_hostile = false,

        display_conjecture = true,
        display_unknown = false,

        range_default = 50,

        icon_scale = 1.0,
        icon_alpha = 1.0,

        print_login_message = true,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

-- options table -----------------------------------------------------------------------------------------------------
ns.options = {
  type = "group",
  name = myname:gsub("HandyNotes_", ""),
  desc = GetAddOnMetadata(myname, "Notes"),
  get = function(info)    return ns.db[info[#info]]                                                                           end,
  set = function(info, v) ns.db[info[#info]] = v ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", "")) end,
  args = {
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    icon = { type = "group", name = "Icon settings", inline = true, order = 100,
      args = {
        desc       = { name = "These settings control the look and feel of the WarcraftConquest icons.", type = "description", order = 110, },
        icon_scale = { type = "range", name = "Icon Scale", order = 120, desc = "The scale of the icons", min = 0.25, max = 2, step = 0.01, },
        icon_alpha = { type = "range", name = "Icon Alpha", order = 130, desc = "The alpha transparency of the icons", min = 0, max = 1, step = 0.01, }, 
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    maps = { type = "group", name = "Map selections", inline = true, order = 200,
      args = {
        desc             = { name = "Choose maps on which to display icons.", type = "description", order = 210, },
        show_on_city     = { type = "toggle", name = "Dalaran Map",    order = 220, desc = "Show icons on city map",                 },
        show_on_minimap  = { type = "toggle", name = "Minimap",        order = 230, desc = "Show icons on the minimap",              },
        show_on_northrend = { type = "toggle", name = "Northrend Maps", order = 240, desc = "Show icons on nearby maps in Northrend", }, 
      }, },
    -- Locations to show --------------------------------------------------------------------------------------------------------------------------------
    show = { type = "group", name = "Location Types", inline = true, order = 400,
      args = {
        desc          = { name = "Select the locations you want to see on your maps:", type = "description", order = 410, }, 
        show_alliance = { type = "toggle", name = "Alliance War Effort",    order = 420, desc = "Show Alliance representatives and locations",             },
        show_horde    = { type = "toggle", name = "Horde War Effort",       order = 421, desc = "Show Horde representatives and locations",                },
        show_neutral  = { type = "toggle", name = "Neutral War Effort",     order = 422, desc = "Show Neutral representatives and locations",              },
        show_campaign = { type = "toggle", name = "Campaigns",              order = 423, desc = "Show active WC campaigns",                                },
        show_event    = { type = "toggle", name = "Events",                 order = 424, desc = "Show event locations for campaigns",                      },
        show_ships    = { type = "toggle", name = "Vehicles",               order = 425, desc = "Show ships and airships",                                 },
        show_camp     = { type = "toggle", name = "Camps",                  order = 426, desc = "Show camp grounds and tents",                             },
        show_villain  = { type = "toggle", name = "Villains",               order = 427, desc = "Show enemy locations and villains",                       },
        show_supplies = { type = "toggle", name = "Supplies",               order = 428, desc = "Show supplies to collect or capture",                     },
        show_spoilers = { type = "toggle", name = "Spoilers",               order = 470, desc = "Show hints for quests, achievements, and puzzles",        },
        show_misc     = { type = "toggle", name = "Miscellaneous",          order = 499, desc = "Show everything else",                                    },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    hide = { type = "group", name = "Locations to hide", inline = true, order = 500,
      args = { 
        desc          = { name = "You can hide the following locations from your maps:", type = "description", order = 510, }, 
        hide_empty    = { type = "toggle", name = "Hide Empty Buildings",  order = 520, desc = "Only show buildings with people in them", },
        hide_closed   = { type = "toggle", name = "Hide Closed Buildings", order = 530, desc = "Only show buildings that have open doors", }, 
        hide_novendor = { type = "toggle", name = "Hide No-Vendor Shops",  order = 540, desc = "Only show shops or bars that have a vendor that can be interacted with", },
        hide_hostile  = { type = "toggle", name = "Hide Unsafe Locations", order = 550, desc = "Only show locations without hostile NPCs around", },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    messages = { type = "group", name = "Login messages", inline = true, order = 700,
      args = {
        desc                = { name = "Choose which messages to display when you log on.", order = 710, type = "description", },
        print_login_message = { type = "toggle", name = "Standard Message", desc = "Print the message listing how to access /wconquest help", order = 720, },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
  }, -- args
}; -- options
 
