SuramarLocations = LibStub("AceAddon-3.0"):NewAddon("SuramarLocations", "AceBucket-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)

if not HandyNotes then return end

local icons = {
   questionMark="Interface\\Icons\\inv_misc_questionmark",
   portal="Interface\\Addons\\HandyNotes_SuramarLocations\\Artwork\\portal.tga",
   portalMissing="Interface\\Addons\\HandyNotes_SuramarLocations\\Artwork\\portalMissing.tga",
   leyline="Interface\\Addons\\HandyNotes_SuramarLocations\\Artwork\\leyline.tga",
}

SuramarLocations.nodes = { }
local nodes = SuramarLocations.nodes

local PlayerFaction, _ = UnitFactionGroup("player")

nodes["Suramar"] = {

      -- Type[1], QuestID[2], Icon[3], Title[4], Desc[5], Tag[6], ItemID[7]

      [39107630]={ "portal", 41575, "Felsoul Hold",          "Entrance: 35.4, 82.2"},
      [22002920]={ "portal", 42230, "Falanaar",              "Entrance: 22.8, 36.2"},
      [30801090]={ "portal", 43808, "Moon Guard Stronghold", "Entrance to area: 26.3, 25.9"},
      [43607910]={ "portal", 43811, "Lunastre Estate",       ""},
      [36404680]={ "portal", 40956, "Ruins of Elune'eth",    "Note: Directly above Nightfallen inn"},
      [47608160]={ "portal", 42487, "The Waning Crescent",   ""},
      [43406070]={ "portal", 43813, "Sanctum of Order",      "Entrance: 46.0, 64.6" },
      [42203540]={ "portal", 43809, "Tel'anor",              ""},
      [64106080]={ "portal", 44084, "Twilight Vineyards",    "Note: Require completing the vineyards chain quest 'Vengeance for Margaux'"},

      [41703890]={ "leyline", 41028, "Anora Hollow",         ""},
      [29008480]={ "leyline", 43594, "Soul Vaults",          ""},
      [59304280]={ "leyline", 43588, "Kel'balor",            ""},
      [65804190]={ "leyline", 43587, "Elor'shan",            ""},
      [20405040]={ "leyline", 43593, "Falanaar South",       ""},
      [21404330]={ "leyline", 43592, "Falanaar North",       ""},
      [24301940]={ "leyline", 43591, "Moon Guard",           ""},
      [35702410]={ "leyline", 43590, "Moonwhisper Gulch",    ""},


      [45003040]={ "am_upgrade", 43986, "Enchanted Burial Urn",       "",                                             140326 },
      [34501110]={ "am_upgrade", 43989, "Infinite Stone",             "",                                             140329 },
      [21203380]={ "am_upgrade", 43988, "Volatile Leyline Crystal",   "Note: Down in Falanaar entrance 22.7, 36.0",   140328 },
      [21005450]={ "am_upgrade", 42842, "Kel'danath's Manaflask",     "",                                             136269 },
      [26807070]={ "am_upgrade", 43987, "Kyrtos's Research Notes",    "Note inside a cave. Entrance: 27.3 , 73.0",    140327 },
}

--  TOOLTIP MENU ----------------------------------------------------------

-- Called when the mouse enter an icon on the map
-- Create the tooltip
function SuramarLocations:OnEnter(mapFile, coord)
   if (not nodes[mapFile][coord]) then return end

   local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip

   if ( self:GetCenter() > UIParent:GetCenter() ) then
      tooltip:SetOwner(self, "ANCHOR_LEFT")
   else
      tooltip:SetOwner(self, "ANCHOR_RIGHT")
   end

   local nodeInfo=nodes[mapFile][coord];

   if (nodeInfo == nil) then return end

   if  (nodeInfo[3] ~= nil) then
      tooltip:SetText(nodeInfo[3])
   end

   if ((nodeInfo[4] ~= nil) and (nodeInfo[4] ~= "")) then
      tooltip:AddLine(nodeInfo[4], 1, 1, 1, true)
   end

   if ((nodeInfo[1] ~= nil) and (nodeInfo[1] == "am_upgrade") and nodeInfo[5] ~= nil) then
      local _, itemLink = GetItemInfo(nodeInfo[5])
      if (itemLink == nil) then
         itemLink ="Error loading item"
      end
      tooltip:AddLine("Item: ".. itemLink , nil, nil, nil, true)
   end

   tooltip:Show()
end

-- Called when the mouse leave an icon on the map
-- Hide the tooltip
function SuramarLocations:OnLeave(mapFile, coord)
   if self:GetParent() == WorldMapButton then
      WorldMapTooltip:Hide()
   else
      GameTooltip:Hide()
   end
end


--  CONTEXT MENU ----------------------------------------------------------

local clickedMapFile = nil -- this value is set by OnClick(button, down, mapFile, coord)
local clickedCoord = nil -- this value is set by OnClick(button, down, mapFile, coord)
local isTomTomloaded = nil --loaded on startup: see LoadChecks()

SuramarLocations.dropdownMenu = CreateFrame("Frame", "HandyNotes_SuramarLocationsDropdownMenu")
SuramarLocations.dropdownMenu.displayMode = "MENU"
SuramarLocations.dropdownMenu.initialize = function (button, level)

   if (not level) or (level ~= 1 ) then return end

   local info = {}

   --Set context menu title
   info.isTitle = 1
   info.text = "SuramarLocations"
   info.notCheckable = 1
   UIDropDownMenu_AddButton(info, level)

   if(isTomTomloaded==nil) then

      if IsAddOnLoaded("TomTom") then
         isTomTomloaded = true
      else
         isTomTomloaded = false
      end
   end

   if isTomTomloaded == true then
      info.text = "Add this location to TomTom waypoints"
      info.func = SuramarLocationsAddtoTomTom
      info.arg1 = clickedMapFile
      info.arg2 = clickedCoord
      UIDropDownMenu_AddButton(info, level)
   end

   info.text = CLOSE
   info.func = function() CloseDropDownMenus() end
   info.arg1 = nil
   info.arg2 = nil
   info.notCheckable = 1
   UIDropDownMenu_AddButton(info, level)

end


function SuramarLocations:OnClick(button, down, mapFile, coord)
   if button == "RightButton" and down then
      clickedMapFile = mapFile
      clickedCoord = coord
      ToggleDropDownMenu(1, nil, SuramarLocations.dropdownMenu, self, 0, 0)
   end
end


-- context menu functions

function SuramarLocationsAddtoTomTom(button, mapFile, coord)
   local mapId = HandyNotes:GetMapFiletoMapID(mapFile)
   local x, y = HandyNotes:getXY(coord)
   local desc = nodes[mapFile][coord][2];

   if (nodes[mapFile][coord][3] ~= nil) and (SuramarLocations.db.profile.show_loot == true) then
      if ((nodes[mapFile][coord][7] ~= nil) and (nodes[mapFile][coord][7] ~= "")) then
         desc = desc.."\nLoot: " .. GetItem(nodes[mapFile][coord][7]);
         desc = desc.."\nLoot Info: " .. nodes[mapFile][coord][3];
      else
         desc = desc.."\nLoot: " .. nodes[mapFile][coord][3];
      end
   end

   if (nodes[mapFile][coord][4] ~= "") and (SuramarLocations.db.profile.show_notes == true) then
      desc = desc.."\nNotes: " .. nodes[mapFile][coord][4]
   end

   TomTom:AddMFWaypoint(mapId, nil, x, y, {
      title = desc,
      persistent = nil,
      minimap = true,
      world = true
   })
end

--  OPTIONS ----------------------------------------------------------

local options = {
   type = "group",
   name = "Suramar Locations",
   desc = "Useful locations in Suramar.",
   get = function(info) return SuramarLocations.db.profile[info.arg] end,
   set = function(info, v) SuramarLocations.db.profile[info.arg] = v; SuramarLocations:Refresh() end,
   args = {

      VisibilitySettingsGroup = {
         type = "group",
         order = 0,
         name = "Visibility Settings:",
         inline = true,
         args = {

            show_portals = {
               type = "toggle",
               arg = "show_portals",
               name = "Portals",
               desc = "Show portals",
               width = "full",
               order = 1,
            },

            show_leyline = {
               type = "toggle",
               arg = "show_leyline",
               name = "Leyline",
               desc = "Show leylines",
               order = 3,
            },

            show_leyline_completed = {
               type = "toggle",
               arg = "show_leyline_completed",
               name = "Completed leyline",
               desc = "Show completed leyline",
               order = 4,
            },


            show_ancient_mana_upgrades = {
               type = "toggle",
               arg = "show_ancient_mana_upgrades",
               name = "Ancient mana upgrades",
               desc = "Show ancient mana upgrades",
               order = 6,
            },

            show_ancient_mana_upgrades_completed = {
               type = "toggle",
               arg = "show_ancient_mana_upgrades_completed",
               name = "Completed ancient mana upgrades",
               desc = "Show completed ancient mana upgrades",
               order = 7,
            },


         },
      },

      IconSettingsGroup = {
         type = "group",
         order = 1,
         name = "Icons Settings:",
         inline = true,
         args = {

            icon_portals_group = {
               type = "header",
               name = "Portals icons",
               desc = "Portals icons settings",
               order = 0,
            },

            icon_scale_portals = {
               type = "range",
               name = "Portals icon's scale",
               desc = "The scale of the icons",
               min = 0.25, max = 3, step = 0.01,
               arg = "icon_scale_portals",
               order = 1,
            },

            icon_alpha_portals = {
               type = "range",
               name = "Portals icon's alpha",
               desc = "The alpha transparency of the portals icons",
               min = 0, max = 1, step = 0.01,
               arg = "icon_alpha_portals",
               order = 2,
            },

            icon_leyline_group = {
               type = "header",
               name = "Leyline icons",
               desc = "Leyline icons settings",
               order = 3,
            },

            icon_scale_leyline = {
               type = "range",
               name = "Leyline icon's scale",
               desc = "The scale of the icons",
               min = 0.25, max = 3, step = 0.01,
               arg = "icon_scale_leyline",
               order = 4,
            },

            icon_alpha_leyline = {
               type = "range",
               name = "Leyline icon's alpha",
               desc = "The alpha transparency of the leyline icons",
               min = 0, max = 1, step = 0.01,
               arg = "icon_alpha_leyline",
               order = 5,
            },

            icon_mana_upgrades_group = {
               type = "header",
               name = "Mana upgrades icons",
               desc = "Mana upgrades icons settings",
               order = 6,
            },

            icon_scale_ancient_mana_upgrades = {
               type = "range",
               name = "Mana upgrades icon's scale",
               desc = "The alpha transparency of the icons",
               min = 0.25, max = 3, step = 0.01,
               arg = "icon_scale_ancient_mana_upgrades",
               order = 7,
            },

            icon_alpha_ancient_mana_upgrades = {
               type = "range",
               name = "Mana upgrades icon's alpha",
               desc = "The alpha transparency of the mana upgrades icons",
               min = 0, max = 1, step = 0.01,
               arg = "icon_alpha_ancient_mana_upgrades",
               order = 8,
            },
         }
      }
   }
}

--  ADDON CODE ----------------------------------------------------------

function SuramarLocations:OnInitialize()
   local defaults = {
      profile = {
         show_portals = true,
         icon_scale_portals = 1.5,
         icon_alpha_portals = 1.00,

         show_leyline = true,
         show_leyline_completed = false,
         icon_scale_leyline = 1.3,
         icon_alpha_leyline = 1.00,

         show_ancient_mana_upgrades = true,
         show_ancient_mana_upgrades_completed = false,
         icon_scale_ancient_mana_upgrades = 1.5,
         icon_alpha_ancient_mana_upgrades = 1.00,
      },
   }

   self.db = LibStub("AceDB-3.0"):New("SuramarLocationsDB", defaults, "Default")
   self:RegisterEvent("PLAYER_ENTERING_WORLD", "WorldEnter")
   self:RegisterEvent("QUEST_TURNED_IN", "QuestCompleted")
end

function SuramarLocations:WorldEnter()
   self:UnregisterEvent("PLAYER_ENTERING_WORLD")
   self:ScheduleTimer("RegisterWithHandyNotes", 2)
end

function SuramarLocations:RegisterWithHandyNotes()
   do
      local function iter(t, prestate)
         if not t then return nil end

         local state, value = next(t, prestate);

         local db = SuramarLocations.db.profile;

         while state do

            if(value[1] == "portal" ) then
               if db.show_portals then
                  local icn=icons["portal"]

                  if(value[2]~=nil and not IsQuestFlaggedCompleted(value[2])) then
                     icn=icons["portalMissing"]
                  end

                  return state, nil, icn, db.icon_scale_portals, db.icon_alpha_portals
               end

            elseif value[1] == "leyline" then
               if(db.show_leyline  and ( db.show_leyline_completed or value[2]==nil or not IsQuestFlaggedCompleted(value[2])) ) then
                  return state, nil, icons["leyline"], db.icon_scale_leyline, db.icon_alpha_leyline
               end
            elseif value[1] == "am_upgrade" then
               if(db.show_leyline  and ( db.show_leyline_completed or value[2]==nil or not IsQuestFlaggedCompleted(value[2])) ) then

                  local icon=icons["questionMark"]
                  
                  if value[5] ~= nil then
                     local _, _, _, _, _, _, _, _, _, itemIcon = GetItemInfo(value[5])
                     if (icon ~= nil) then
                         icon=itemIcon
                     end
                  end
                  return state, nil, icon, db.icon_scale_ancient_mana_upgrades, db.icon_alpha_ancient_mana_upgrades
               end
            end

            state, value = next(t, state)
         end
      end

      function SuramarLocations:GetNodes(mapFile, isMinimapUpdate, dungeonLevel)
         return iter, nodes[mapFile], nil
      end
   end

   HandyNotes:RegisterPluginDB("SuramarLocations", self, options)
   self:RegisterBucketEvent({ "LOOT_CLOSED" }, 2, "Refresh")
   self:Refresh()
end

-- http://wowprogramming.com/docs/events/QUEST_TURNED_IN
function SuramarLocations:QuestCompleted(questID)
   for _,map in pairs(nodes) do
      if map ~=nil then
         for _,data in pairs(map) do
            if data ~=nil and data[2] ~=nil and questID == data[2] then
               SuramarLocations.Refresh();
            end
         end
      end
   end
end

function SuramarLocations:Refresh()
   self:SendMessage("HandyNotes_NotifyUpdate", "SuramarLocations")
end



--      DEFAULT_CHAT_FRAME:AddMessage("nodeInfo[5] "..tostring(nodeInfo[5]))
