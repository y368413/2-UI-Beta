---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['nagrand']

-- Define NPCs we are going to use in multiple points.
local Lukhok = {
  npcId = 50981,
  icon = 'monster',
  note = t['multiple_spawn_note'],
  loot = {
    item = {
      -- Mottled Meadowstomper
      [116661] = { mountId = 614 },
    },
  },
}

local Nakk = {
  npcId = 50990,
  icon = 'monster',
  note = t['multiple_spawn_note'],
  loot = {
    item = {
      -- Bloodhoof Bull
      [116659] = { mountId = 612 },
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
  [66604400] = Lukhok,
  [76203180] = Lukhok,
  [72805360] = Lukhok,
  [79205600] = Lukhok,
  [84606360] = Lukhok,
  [86806560] = Lukhok,
  [62801540] = Nakk,
  [64601960] = Nakk,
  [55003500] = Nakk,
  [50003440] = Nakk,
  [40534764] = Voidtalon,
  [44033082] = Voidtalon,
  [57262656] = Voidtalon,

  --- Pet Battles
  -- Tarr the Terrible
  [56200980] = {
    npcId = 87110,
    icon = 'pet',
    loot = {
      achievement = {
        -- Taming Draenor
        [9724] = { criteriaId = 27015 },
      },
    },
  },

  --- Achievements
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
