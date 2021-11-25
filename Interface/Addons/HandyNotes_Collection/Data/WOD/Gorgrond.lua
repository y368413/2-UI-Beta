---
--- @file
--- Map point definitions.
---

local _, this = ...

local points = {}
local t = this.t
local map = this.maps['gorgrond']

points = {
  -- Pile of Rubble
  [44007060] = {
    name = t['pile_of_rubble_treasure'],
    icon = 'chest',
    questId = 36118,
    loot = {
      -- Grand Treasure Hunter
      achievement = {
        [9728] = { count = true },
      },
    },
  },
  -- Ninja Pepe
  [47504130] = {
    name = t['ninja_pepe_title'],
    icon = 'chest',
    note = t['ninja_pepe_note'],
    questId = 39267,
    loot = {
      achievement = {
        -- I Found Pepe!
        [10053] = { criteriaId = 28182 },
      },
      item = {
        -- A Tiny Ninja Shroud
        [127867] = { },
      },
    },
  },
  [45802720] = {
    name = t['attack_plans_title'],
    icon = 'chest',
    note = t['attack_plans_crane'] .. '\n\n' .. t['multiple_spawn_plans'],
    loot = {
      achievement = {
        -- In Plain Sight
        [9656] = { },
      },
    },
  },
  [48202700] = {
    name = t['attack_plans_title'],
    icon = 'chest',
    note = t['attack_plans_tower'] .. '\n\n' .. t['multiple_spawn_plans'],
    loot = {
      achievement = {
        -- In Plain Sight
        [9656] = { },
      },
    },
  },
  [45202520] = {
    name = t['attack_plans_title'],
    icon = 'chest',
    note = t['attack_plans_tracks'] .. '\n\n' .. t['multiple_spawn_plans'],
    loot = {
      achievement = {
        -- In Plain Sight
        [9656] = { },
      },
    },
  },
  [49002400] = {
    name = t['attack_plans_title'],
    icon = 'chest',
    note = t['attack_plans_crane'] .. '\n\n' .. t['multiple_spawn_plans'],
    loot = {
      achievement = {
        -- In Plain Sight
        [9656] = { },
      },
    },
  },
}

this.points[map] = points
