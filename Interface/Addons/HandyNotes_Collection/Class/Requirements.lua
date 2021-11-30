---
--- @file
--- Handles requirements completition for displaying in tooltips.
---

local _, this = ...

local API = this.API
local Item = this.Item
local Achievement = this.Achievement
local Quest = this.Quest
local Text = this.Text
local t = this.t

local Requirements = {}

---
--- Prepares requirements for tooltip.
---
--- @param GameTooltip
---   Tooltip we are gonna assign notes to.
--- @param requirements
---   Requirements, that needs to be met.
---
function Requirements:prepare(GameTooltip, requirements)
  -- Assign tooltip.
  self.GameTooltip = GameTooltip

  -- Add header.
  self.GameTooltip:AddLine(' ')
  self.GameTooltip:AddLine(t['requirements'])

  -- Type is achievement, quest etc.
  for type, data in pairs(requirements) do
    if (type == 'quest') then
      -- Cycle all items.
      for questId, _ in pairs(data) do
        self:prepareQuestRequirement(questId)
      end
    end
    if (type == 'achievement') then
      -- Cycle all items.
      for _, achievementId in ipairs(data) do
        self:prepareAchievementRequirement(achievementId)
      end
    end
    if (type == 'reputation') then
      -- Cycle all items.
      for reputationId, reputation in pairs(data) do
        self:prepareReputationRequirement(reputationId, reputation)
      end
    end
    if (type == 'item') then
      -- Cycle all items.
      for itemId, _ in pairs(data) do
        self:prepareItemRequirement(itemId)
      end
    end
  end
end

---
--- Prepares requirement tooltip display for quest.
---
--- @param questId
---   Quest ID from journal.
---
function Requirements:prepareQuestRequirement(questId)
  local color = 'red'
  local status = t['incomplete']

  if (Quest:isCompleted(questId)) then
    color = 'green'
    status = t['completed']
  end

  -- Quest name.
  local name = Quest:getName(questId)

  -- Quest flag icon.
  -- @todo replace with something more appropriate.
  local icon = '|T237607:0:0:0:-1|t '

  -- Change color to white.
  local text = icon .. Text:color(name, 'white')

  self.GameTooltip:AddDoubleLine(text, status, nil, nil, nil, Text:color2rgb(color))
end

---
--- Prepares requirement tooltip display for achievement.
---
--- @param achievementId
---   Achievement ID from journal.
---
function Requirements:prepareAchievementRequirement(achievementId)
  local color = 'red'
  local status = t['in_progress']

  if (Achievement:isCompleted(achievementId)) then
    status = t['earned']
    color = 'green'
  end

  local text = Achievement:getIcon(achievementId) .. Achievement:getLink(achievementId)

  self.GameTooltip:AddDoubleLine(text, status, nil, nil, nil, Text:color2rgb(color))
end

---
--- Prepares requirement tooltip display for reputation.
---
--- @param reputationId
---   Reputation ID.
--- @param reputation
---   Reputation detail, like standing etc.
---
function Requirements:prepareReputationRequirement(reputationId, reputation)
  local color = 'red'
  local name, standingId = API:getFactionInfoByID(reputationId)
  local status = API:getText(standingId)

  -- Quest flag icon.
  -- @todo replace with something more appropriate.
  local icon = '|T237607:0:0:0:-1|t '

  local text = icon .. Text:color(name, 'white')

  if (standingId >= reputation.level) then
    color = 'green'
  end

  self.GameTooltip:AddDoubleLine(text, status, nil, nil, nil, Text:color2rgb(color))
end

---
--- Prepares requirement tooltip display for items.
---
--- @param itemId
---   Item ID.
---
function Requirements:prepareItemRequirement(itemId)
  local color = 'red'
  local status = t['missing']
  local text = Item:getIcon(itemId) .. Item:getLink(itemId)

  if (Item:isInBag(itemId) == true) then
    color = 'green'
    status = t['collected']
  end

  self.GameTooltip:AddDoubleLine(text, status, nil, nil, nil, Text:color2rgb(color))
end

this.Requirements = Requirements
