---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['frostfire_ridge']

-- Define NPCs we are going to use in multiple points.
local Gorok = {
  npcId = 50992,
  icon = 'monster',
  note = t['multiple_spawn_note'],
  loot = {
    item = {
      -- Great Greytusk
      [116674] = { mountId = 627 },
    },
  },
}

local Voidtalon = {
  name = t['edge_of_reality'],
  icon = 'monster',
  note = t['edge_of_reality_note'],
  loot = {
    item = {
      -- Voidtalon of the Dark Star
      [121815] = { mountId = 682 },
    },
  },
}

local points = {
  --- Rares
  [63407940] = Gorok,
  [22806640] = Gorok,
  [64805300] = Gorok,
  [51805060] = Gorok,
  [58001840] = Gorok,
  [51101986] = Voidtalon,
  [52401818] = Voidtalon,
  [53801732] = Voidtalon,
  [48002740] = Voidtalon,

  -- Nok-Karosh
  [13205060] = {
    npcId = 81001,
    icon = 'monster',
    loot = {
      item = {
        -- Garn Nighthowl
        [116794] = { mountId = 657 },
      },
    },
  },

  --- Pet Battles
  -- Gargra
  [68606460] = {
    npcId = 87122,
    icon = 'pet',
    loot = {
      achievement = {
        -- Taming Draenor
        [9724] = { criteriaId = 27013 },
      },
    },
  },
}

this.points[map] = points
