---
--- @file
--- Map point definitions.
---

local _, this = ...

local points = {}
local t = this.t
local map = this.maps['talador']

points = {
  -- Knight Pepe
  [51006330] = {
    name = t['knight_pepe_title'],
    icon = 'chest',
    note = t['knight_pepe_note'],
    questId = 39266,
    loot = {
      -- I Found Pepe!
      achievement = {
        [10053] = { criteriaId = 28183 },
      },
      item = {
        -- A Tiny Plated Helm
        [127869] = { },
      },
    },
  },
}

this.points[map] = points
