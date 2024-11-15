---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['timeless_isle']

local points = {
  -- Sunken Treasure
  [40409300] = {
    name = t['sunken_treasure_treasure'],
    questId = 32957,
    icon = 'chest',
    note = t['sunken_treasure_note'],
    loot = {
      achievement = {
        -- Where There's Pirates, There's Booty
        [8727] = { criteriaId = 24021 },
        -- Going To Need A Bigger Bag
        [8728] = { criteriaId = 24024 },
      },
      item = {
        -- Cursed Swabby Helmet
        [134024] = { type = 'toy' },
      },
    },
  },
  -- Rattleskew
  [61008800] = {
    npcId = 72048,
    icon = 'monster',
    note = t['rattleskew_note'],
    loot = {
      achievement = {
        -- Timeless Champion
        [8714] = { criteriaId = 23977 },
        -- Going To Need A Bigger Bag
        [8728] = { criteriaId = 24065 },
      },
      item = {
        -- Captain Zvezdan's Lost Leg
        [104321] = { subtype = t['trinket'] },
      },
    },
  },
}

this.points[map] = points
