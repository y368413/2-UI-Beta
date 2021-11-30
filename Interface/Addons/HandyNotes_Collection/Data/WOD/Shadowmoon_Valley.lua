---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['shadowmoon_valley']

-- Define NPCs we are going to use in multiple points.
local Pathrunner = {
  npcId = 50883,
  icon = 'monster',
  note = t['multiple_spawn_note'],
  loot = {
    item = {
      -- Swift Breezestrider
      [116773] = { mountId = 636 },
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
  [39603660] = Pathrunner,
  [43003220] = Pathrunner,
  [44604380] = Pathrunner,
  [45806820] = Pathrunner,
  [54003040] = Pathrunner,
  [56205240] = Pathrunner,
  [41907567] = Voidtalon,
  [43627138] = Voidtalon,
  [48787017] = Voidtalon,
  [50337153] = Voidtalon,
  [51687490] = Voidtalon,
  [46647018] = Voidtalon,

  --- Pet Battles
  -- Ashlei
  [50003120] = {
    npcId = 87124,
    icon = 'pet',
    loot = {
      achievement = {
        -- Taming Draenor
        [9724] = { criteriaId = 27012 },
      },
    },
  },

}

this.points[map] = points
