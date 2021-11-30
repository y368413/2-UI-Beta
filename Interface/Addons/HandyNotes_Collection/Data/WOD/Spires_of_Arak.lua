---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['spires_of_arak']

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
  [36431830] = Voidtalon,
  [46822021] = Voidtalon,
  [50430631] = Voidtalon,
  [60901122] = Voidtalon,

  -- Shadowbark
  [51803560] = {
    npcId = 79938,
    questId = 36478,
    icon = 'monster',
    loot = {
      item = {
        -- Shadowbark's Shin
        [118201] = { type = 'transmog' },
      },
    },
  },

  -- Nas Dunberlin
  [36205260] = {
    npcId = 82247,
    questId = 36129,
    icon = 'monster',
    loot = {
      item = {
        -- Spooky Scythe
        [116837] = { type = 'transmog' },
      },
    },
  },

  -- Solar Magnifier
  [52000760] = {
    npcId = 83990,
    questId = 37394,
    icon = 'monster',
    loot = {
      item = {
        -- Cloudsplitter Greatstaff
        [119407] = { type = 'transmog' },
      },
    },
  },

  -- Mutafen
  [54208900] = {
    npcId = 84417,
    questId = 36396,
    icon = 'monster',
    loot = {
      item = {
        -- Mutafen's Mighty Maul
        [118206] = { type = 'transmog' },
      },
    },
  },

  -- Tesska the Broken
  [57207380] = {
    npcId = 84775,
    questId = 36254,
    icon = 'monster',
    loot = {
      item = {
        -- Tesska's Cursed Talisman
        [116852] = { subtype = t['neck'] },
      },
    },
  },

  -- Stonespite
  [33602200] = {
    npcId = 84805,
    questId = 36265,
    icon = 'monster',
    loot = {
      item = {
        -- Stonespite Scale Leggings
        [116858] = { type = 'transmog' },
      },
    },
  },

  -- Durkath Steelmaw
  [46402860] = {
    npcId = 84807,
    questId = 36267,
    icon = 'monster',
    loot = {
      item = {
        -- Steelmaw's Stompers
        [118198] = { type = 'transmog' },
      },
    },
  },

  -- Kalos the Bloodbathed
  [62803760] = {
    npcId = 84810,
    questId = 36268,
    icon = 'monster',
    loot = {
      item = {
        -- Bloodbathed Outcast Robes
        [118735] = { type = 'transmog' },
      },
    },
  },

  -- Sangrikass
  [68804900] = {
    npcId = 84833,
    questId = 36276,
    icon = 'monster',
    note = t['sangrikass_note'],
    loot = {
      item = {
        -- Moultingskin Tunic
        [118203] = { type = 'transmog' },
      },
    },
  },

  -- Talonbreaker
  [54606320] = {
    npcId = 84836,
    questId = 36278,
    icon = 'monster',
    loot = {
      item = {
        -- Talonbreaker Talisman
        [116838] = { subtype = t['neck'] },
      },
    },
  },

  -- Poisonmaster Bortusk
  [59603760] = {
    npcId = 84838,
    questId = 36279,
    icon = 'monster',
    loot = {
      item = {
        -- Poison Cask
        [118199] = { subtype = t['trinket'] },
      },
    },
  },

  -- Blightglow
  [64806640] = {
    npcId = 84856,
    questId = 36283,
    icon = 'monster',
    loot = {
      item = {
        -- Blightglow Pauldrons
        [118205] = { type = 'transmog' },
      },
    },
  },

  -- Oskiira the Vengeful
  [65005400] = {
    npcId = 84872,
    questId = 36288,
    icon = 'monster',
    loot = {
      item = {
        -- Oskiira's Mercy
        [118204] = { type = 'transmog' },
      },
    },
  },

  -- Betsi Boombasket
  [58208460] = {
    npcId = 84887,
    questId = 36291,
    icon = 'monster',
    loot = {
      item = {
        -- Betsi's Boomstick
        [116907] = { type = 'transmog' },
      },
    },
  },

  -- Festerbloom
  [54803960] = {
    npcId = 84890,
    questId = 36297,
    icon = 'monster',
    loot = {
      item = {
        -- Vile Branch of Festerbloom
        [118200] = { type = 'transmog', subtype = t['off-hand'] },
      },
    },
  },

  -- Sunderthorn
  [58604500] = {
    npcId = 84912,
    questId = 36298,
    icon = 'monster',
    note = t['sunderthorn_note'],
    loot = {
      item = {
        -- Stingtail's Toxic Stinger
        [116855] = { type = 'transmog' },
      },
    },
  },

  -- Jiasska the Sporegorger
  [56609460] = {
    npcId = 84955,
    questId = 36306,
    icon = 'monster',
    loot = {
      item = {
        -- Fungus-Infected Hydra Lung
        [118202] = { subtype = t['trinket'] },
      },
    },
  },

  -- Rotcap
  [38402740] = {
    npcId = 85504,
    questId = 36470,
    icon = 'monster',
    loot = {
      item = {
        -- Brilliant Spore
        [118107] = { petId = 1540 },
      },
    },
  },

  -- Swarmleaf
  [52805480] = {
    npcId = 85520,
    questId = 36472,
    icon = 'monster',
    loot = {
      item = {
        -- Stave of Buzzing Bark
        [116857] = { type = 'transmog' },
      },
    },
  },

  -- Hermit Palefur
  [59201500] = {
    npcId = 86724,
    questId = 36887,
    icon = 'monster',
    loot = {
      item = {
        -- Hermit's Hood
        [118279] = { type = 'transmog' },
      },
    },
  },

  -- Gaze
  [25202420] = {
    npcId = 86978,
    questId = 36943,
    icon = 'monster',
    note = t['gaze_note'],
    loot = {
      item = {
        -- Eye of Gaze
        [118696] = { subtype = t['ring'] },
      },
    },
  },

  --[[
  -- Gluttonous Giant
  [74604360] = {
    npcId = 87019,
    questId = 37390,
    icon = 'monster',
    loot = {
      item = {
        -- Glowing Morel
        [119404] = { type = 'transmog' },
      },
    },
  },

  -- Shadow Hulk
  [71203320] = {
    npcId = 87027,
    questId = 37392,
    icon = 'monster',
    loot = {
      item = {
        -- Stretchy Purple Pants
        [119363] = { type = 'transmog' },
      },
    },
  },

  -- Morphed Sentient
  [73604500] = {
    npcId = 86621,
    questId = 37493,
    icon = 'monster',
  },

  -- Giga Sentinel
  [71604480] = {
    npcId = 87029,
    questId = 37393,
    icon = 'monster',
    loot = {
      item = {
        -- Sentinel's Wingblade
        [119401] = { type = 'transmog' },
      },
    },
  },

  -- Mecha Plunderer
  [74403880] = {
    npcId = 87026,
    questId = 37391,
    icon = 'monster',
    loot = {
      item = {
        -- Plunderer's Drill
        [119398] = { type = 'transmog' },
      },
    },
  },

  -- Voidreaver Urnae
  [74803250] = {
    npcId = 85078,
    questId = 37359,
    icon = 'monster',
    loot = {
      item = {
        -- Voidreaver's Axe
        [119392] = { type = 'transmog' },
      },
    },
  },

  -- Formless Nightmare
  [72601940] = {
    npcId = 85036,
    questId = 37360,
    icon = 'monster',
    loot = {
      item = {
        -- Nightmare-Chain Bracers
        [119373] = { type = 'transmog' },
      },
    },
  },

  -- Kenos the Unraveler
  [70602420] = {
    npcId = 85037,
    questId = 37361,
    icon = 'monster',
    loot = {
      item = {
        -- Cowl of the Unraveller
        [119354] = { type = 'transmog' },
      },
    },
  },
  --]]

  -- Soul-Twister Torek
  [72601960] = {
    npcId = 85026,
    questId = 37358,
    icon = 'monster',
    loot = {
      item = {
        -- Black Whirlwind
        [119178] = { type = 'toy' },
        -- Soultwisting Staff
        [119410] = { type = 'transmog' },
      },
    },
  },

  -- Varasha
  [29604200] = {
    npcId = 82050,
    questId = 35334,
    icon = 'monster',
    note = t['in_cave'],
    POI = { 31504330 },
    loot = {
      item = {
        -- Hydraling
        [118207] = { petId = 1541 },
      },
    },
  },

  --- Pet Battles
  -- Vesharr
  [46404520] = {
    npcId = 87123,
    icon = 'pet',
    loot = {
      achievement = {
        -- Taming Draenor
        [9724] = { criteriaId = 27014 },
      },
    },
  },

  --- Achievements
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
