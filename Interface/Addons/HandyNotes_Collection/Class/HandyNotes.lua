---
--- @file
--- Implements functionality to integrate addon with HandyNotes.
---

local NAME, this = ...
local LibStub = this.LibStub
local HandyNotes = this.HandyNotes
local Addon = this.Addon
local Point = this.Point
local API = this.API
local GameTooltip = API.GameTooltip

local HandyNotesPlugin = {}

---
--- This function is called when you hover over icon on the map.
---
--- @see pluginHandler:OnEnter
--- @link https://github.com/Nevcairiel/HandyNotes/blob/master/HandyNotes.lua
---
function HandyNotesPlugin:OnEnter(uiMapId, coord)
  -- Tooltip positioning in map (so it doesn't overflow window).
  local tooltipPosition = 'ANCHOR_RIGHT'
  if (self:GetCenter() > API:getUIParentCenter()) then
    tooltipPosition = 'ANCHOR_LEFT'
  end
  GameTooltip:SetOwner(self, tooltipPosition)

  -- Pass GameTooltip object and point data to another function, that will render tooltip.
  Point:prepareTooltip(GameTooltip, this.points[uiMapId][coord])
  -- Display tooltip.
  GameTooltip:Show()
end

---
--- This function is called when you leave icon on the map.
---
--- @see pluginHandler:OnLeave
--- @link https://github.com/Nevcairiel/HandyNotes/blob/master/HandyNotes.lua
---
function HandyNotesPlugin:OnLeave(uiMapId, coord)
  GameTooltip:Hide()
end

---
--- This function is called when you click icon on the map.
---
--- @see pluginHandler:OnClick
--- @link https://github.com/Nevcairiel/HandyNotes/blob/master/HandyNotes.lua
---
function HandyNotesPlugin:OnClick(button, down, uiMapId, coord)
  -- If icon is portal, we change map.
  if (down == true and this.points[uiMapId][coord]['portal']) then
    API:changeMap(this.points[uiMapId][coord]['portal'])
  end
end

do
  ---
  --- This is an iterator that is used by HandyNotes to iterate over every node in given zone.
  ---
  --- Iterator function is required by HandyNotes.
  ---
  --- @param table
  ---   Our table with data we want to iterate over.
  --- @param prestate
  ---   Index of table we want to start at.
  ---
  local function iter(table, prestate)
    -- If we don't have any data, quit.
    if not table then
      return nil
    end

    -- Get values for first point.
    local coordinates, point = next(table, prestate)
    -- Iterate until we reach end of table with points for this map.
    while coordinates do
      -- If we have any data for our point.
      if point then
        local scale = this.Addon.db.profile.scale
        local opacity = this.Addon.db.profile.opacity

        -- Check, if we have scale or opacity configured in point and rewrite user config.
        if (point.scale) then
          scale = point.scale
        end
        if (point.opacity) then
          opacity = point.opacity
        end

        -- Validate, that quest is not completed or show completed option is checked.
        if (Point:isCompleted(point) == false or this.Addon.db.profile.completed == true) then
          -- Create icon for to display on map.
          local icon = API:GetAtlasInfo(point.icon)

          return coordinates, nil, icon, scale, opacity
        end
      end

      -- Load next point for this map.
      coordinates, point = next(table, coordinates)
    end

    return nil, nil, nil, nil
  end

  ---
  --- Required function by HandyNotes.
  ---
  --- @param uiMapId
  ---   The zone ID we want data for.
  --- @param minimap
  ---   Boolean indicating if we want to get nodes to display on the minimap.
  ---
  --- @return function iter()
  ---   Our custom iterator, that will loop over each point in given map.
  --- @return table point
  ---   Our points table for given map.
  ---
  function HandyNotesPlugin:GetNodes2(uiMapId, minimap)
    return iter, this.points[uiMapId], nil
  end
end

---
--- Creates storage in SavedVariables for our addon and registers it with HandyNotes.
---
--- This is AceDB-3.0 function.
--- @link https://www.wowace.com/projects/ace3/pages/getting-started#title-2-2
---
function Addon:OnInitialize()
  -- Set up our database.
  self.db = LibStub('AceDB-3.0'):New(NAME .. 'DB', this.defaults)
  -- Initialize our database with HandyNotes.
  HandyNotes:RegisterPluginDB(NAME, HandyNotesPlugin, this.options)
end

---
--- Registers events when you enable addon.
---
--- This is AceDB-3.0 function.
--- @link https://www.wowace.com/projects/ace3/pages/getting-started#title-2-2
---
function Addon:OnEnable()
  self:RegisterEvent('CRITERIA_UPDATE', 'Refresh')
  self:RegisterEvent('CRITERIA_EARNED', 'Refresh')
  self:RegisterEvent('QUEST_TURNED_IN', 'Refresh')
  self:RegisterEvent('ACHIEVEMENT_EARNED', 'Refresh')
end

---
--- Updates our Addon every time registered event is called.
---
--- @see Addon:OnEnable
---
function Addon:Refresh()
  self:SendMessage('HandyNotes_NotifyUpdate', NAME)
end
