---
--- @file
--- Map point definitions.
---

local _, this = ...

local points = {}
local t = this.t
local map = this.maps['nagrand']

points = {
  -- Viking Pepe
  [80105040] = {
    name = t['viking_pepe_title'],
    icon = 'chest',
    note = t['viking_pepe_note'],
    questId = 39265,
    loot = {
      -- I Found Pepe!
      achievement = {
        [10053] = { criteriaId = 28184 },
      },
      item = {
        -- A Tiny Viking Helmet
        [127865] = { },
      },
    },
  },
}

this.points[map] = points
