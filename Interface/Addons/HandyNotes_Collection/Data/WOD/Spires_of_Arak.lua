---
--- @file
--- Map point definitions.
---

local _, this = ...

local points = {}
local t = this.t
local map = this.maps['spires_of_arak']

points = {
  -- Pirate Pepe
  [54108360] = {
    name = t['pirate_pepe_title'],
    icon = 'chest',
    note = t['pirate_pepe_note'],
    questId = 39268,
    loot = {
      -- I Found Pepe!
      achievement = {
        [10053] = { criteriaId = 28185 },
      },
      item = {
        -- A Tiny Pirate Hat
        [127870] = { },
      },
    },
  },
}

this.points[map] = points
