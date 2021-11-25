---
--- @file
--- Data structure and logic for points on map.
---

local _, this = ...

local API = this.API
local Text = this.Text
local Loot = this.Loot
local t = this.t

local Point = {}

---
--- Checks, whether point has completed all rewards (toy, achievement, pet, transmog).
---
--- @param data
---   Map data for our point.
---
--- @return boolean
---   True, if all rewards are acquired.
---
function Point:isCompleted(data)
  -- Check, if associated quest is completed.
  if (API:isQuestCompleted(data.questId) == true) then
    return true
  end

  -- Check, if all every piece of loot is completed.
  if (data.loot) then
    return Loot:isCompleted(data.loot)
  end

  return false
end

---
--- Prepares name (header) for tooltip
---
--- @param data
---   Map data for our point.
---
--- @return ?string
---   Returns name of point or nil.
---
function Point:prepareName(data)
  local name = data.name
  -- If there is no name, try to load name from game.

  -- Try to load map name.
  if name == nil and data.portal then
    name = API:getMapName(data.portal)
  end

  -- Try to load NPC name.
  if name == nil and data.id ~= nil then
    name = API:getNpcName(data.id)
  end

  if name ~= nil then
    -- Colorize name.
    name = Text:color(name, 'white')
  end

  return name
end

---
--- Prepares content of tooltip we want to show.
---
--- @param GameTooltip
---   GameTooltip object, that will do the rendering.
---
--- @param data
---   Map data for our point.
---
function Point:prepareTooltip(GameTooltip, data)
  -- Up-value GameTooltip.
  self.GameTooltip = GameTooltip
  -- Define name of tooltip.
  local name = self:prepareName(data)

  -- Set tooltip header (name).
  self.GameTooltip:SetText(name)
  -- Add note to tooltip.
  self.GameTooltip:AddLine(data.note, nil, nil, nil, true)
  -- Add rewards to tooltip.
  self:prepareLootTooltip(data.loot)
end

---
--- Prepares rewards for tooltip.
---
--- @param loot
---   Loot that can be earned from point.
---
function Point:prepareLootTooltip(loot)
  if not loot then
    return
  end

  -- Add header for loot.
  self.GameTooltip:AddLine(' ')
  self.GameTooltip:AddLine(Text:color(t['rewards'], 'white'))

  -- Type is achievement, pet, mount etc.
  for type, data in pairs(loot) do
    if (type == 'achievement') then
      -- Cycle all achievements.
      for achievementId, achievement in pairs(data) do
        self:prepareAchievementTooltip(achievementId, achievement)
      end
    end
  end
end

---
--- Prepares tooltip display for achievements.
---
--- @todo Refactor this, since its bloated and can be simplified.
---
--- @param id
---   Achievement ID.
--- @param achievement
---   Achievement data.
---
function Point:prepareAchievementTooltip(id, achievement)
  local achievementStatus = t['in_progress']
  local color = 'red'

  if (API:isAchievementCompleted(id)) then
    achievementStatus = t['earned']
    color = 'green'
  end
  self.GameTooltip:AddDoubleLine(API:getAchievementLink(id), achievementStatus, nil, nil, nil, Text:color2rgb(color))

  -- If achievement is completed, don't display criteria or anything.
  if (API:isAchievementCompleted(id)) then
    return
  end

  -- Achievement has countable requirement.
  if (achievement.count) then
    local name, count, required = API:getAchievementCriteriaCount(id)
    achievementStatus = count .. '/' .. required
    color = 'yellow'

    -- Check, whether count is completed.
    if (count == required) then
      achievementStatus = t['earned']
      color = 'green'
    end

    self.GameTooltip:AddDoubleLine('  ' .. name, achievementStatus, 255, 255, 255, Text:color2rgb(color))

    -- Check, whether count is completed and if so, quit so we don't have to check another criteria below.
    if (count == required) then
      return
    end
  end

  -- Achievement has single criteria.
  if (achievement.criteriaId and type(achievement.criteriaId) == 'number') then
    achievementStatus = t['in_progress']
    color = 'red'

    if (API:isAchievementCriteriaCompleted(id, achievement.criteriaId)) then
      achievementStatus = t['earned']
      color = 'green'
    end

    self.GameTooltip:AddDoubleLine('  ' .. API:getAchievementCriteriaName(id, achievement.criteriaId), achievementStatus, 255, 255, 255, Text:color2rgb(color))

    -- If this criteria has been completed, we can assume, there won't be more of bellow and can quit.
    if (API:isAchievementCriteriaCompleted(id, achievement.criteriaId)) then
      return
    end
  end

  -- Achievement has multiple criteria.
  if (achievement.criteriaId and type(achievement.criteriaId) == 'table') then
    -- Check each criteria, like above.
    for _, criteriaId in ipairs(achievement.criteriaId) do
      achievementStatus = t['in_progress']
      color = 'red'

      if (API:isAchievementCriteriaCompleted(id, criteriaId)) then
        achievementStatus = t['earned']
        color = 'green'
      end

      self.GameTooltip:AddDoubleLine('  ' .. API:getAchievementCriteriaName(id, criteriaId), achievementStatus, 255, 255, 255, Text:color2rgb(color))
    end
  end
end

this.Point = Point
