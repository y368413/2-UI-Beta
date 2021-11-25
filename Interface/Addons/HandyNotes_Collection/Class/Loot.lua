---
--- @file
--- Logic for point loot.
---

local _, this = ...

local API = this.API

local Loot = {}

---
--- Loops all loot and checks, if it is completed.
---
--- @param loot
---   Table with all loot options.
---
--- @return boolean
---   True, if all is completed, false otherwise.
---
function Loot:isCompleted(loot)
  local status = {}

  -- Loop all items in loot.
  for key, value in pairs(loot) do
    if (key == 'achievement') then
      -- Loop all achievements.
      for id, achievement in pairs(value) do
        table.insert(status, self:isAchievementCompleted(id, achievement))
      end
    end
  end

  -- Loop all statuses, if anything is not done, return false.
  for _, value in ipairs(status) do
    if (value == false) then
      return false
    end
  end
  -- Everything is done.
  return true
end

---
--- Checks, whether achievement in loot is completed.
---
--- @param id
---   Achievement ID.
--- @param achievement
---   Table with achievements data, if any.
---
--- @return boolean
---   True, if achievement or its part is completed, false otherwise.
---
function Loot:isAchievementCompleted(id, achievement)
  if (API:isAchievementValid(id)) then
    -- We have count, so we have to check achievement criteria count.
    if (achievement.count) then
      return API:isAchievementCountCompleted(id)
    end

    -- We have criteriaId, so we have to check achievement criteria id.
    if (achievement.criteriaId and type(achievement.criteriaId) == 'number') then
      return API:isAchievementCriteriaCompleted(id, achievement.criteriaId)
    end

    -- We have multiple criteriaId, so we have to check every criteria id.
    if (achievement.criteriaId and type(achievement.criteriaId) == 'table') then
      for _, criteriaId in pairs(achievement.criteriaId) do
        if (API:isAchievementCriteriaCompleted(id, criteriaId)) then
          return true
        end
      end
    end

    return API:isAchievementCompleted(id)
  end

  return false
end

this.Loot = Loot
