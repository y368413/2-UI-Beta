---
--- @file
--- Map point definitions.
---

local _, this = ...

local t = this.t
local map = this.maps['talador']
local subMap = this.maps['tomb_of_souls']

-- Define NPCs we are going to use in multiple points.
local Silthide = {
  npcId = 51015,
  icon = 'monster',
  note = t['multiple_spawn_note'],
  loot = {
    item = {
      -- Sapphire Riverbeast
      [116767] = { mountId = 630 },
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
  [78905540] = Silthide,
  [67406000] = Silthide,
  [61803220] = Silthide,
  [62004500] = Silthide,
  [55608060] = Silthide,
  [39885561] = Voidtalon,
  [46265256] = Voidtalon,
  [47164882] = Voidtalon,
  [52144113] = Voidtalon,
  [52252587] = Voidtalon,
  [52683437] = Voidtalon,
  [50963241] = Voidtalon,

  -- Yazheera the Incinerator
  [53802580] = {
    npcId = 77529,
    questId = 34135,
    icon = 'monster',
    loot = {
      item = {
        -- Yazheera's Burning Bracers
        [112263] = { type = 'transmog' },
      },
    },
  },

  -- Frenzied Golem
  [46205500] = {
    npcId = 77614,
    questId = 34145,
    icon = 'monster',
    loot = {
      item = {
        -- Shard of Contempt
        [113288] = { type = 'transmog' },
        -- Shard of Scorn
        [113287] = { type = 'transmog' },
      },
    },
  },

  -- Cro Fleshrender
  [37607040] = {
    npcId = 77620,
    questId = 34165,
    icon = 'monster',
    loot = {
      item = {
        -- Fleshrender's Painbringer
        [116123] = { type = 'transmog' },
      },
    },
  },

  -- Hen-Mother Hami
  [75405080] = {
    npcId = 77626,
    questId = 34167,
    icon = 'monster',
    path = { 75405080, 76705070, 77005260, 78005100 },
    loot = {
      item = {
        -- Hami-Down Cloak
        [112369] = { type = 'transmog', subtype = t['cloak'] },
      },
    },
  },

  -- Hammertooth
  [61404920] = {
    npcId = 77715,
    questId = 34185,
    icon = 'monster',
    path = { 61404920, 60604800, 61304650, 62704480, 63904330, 65304330,
             65304550, 64004530, 63104590, 62304730, 61404920 },
    loot = {
      item = {
        -- Scaled Riverbeast Vest
        [116124] = { type = 'transmog' },
      },
    },
  },

  -- Glimmerwing
  [30406500] = {
    npcId = 77719,
    questId = 34189,
    icon = 'monster',
    path = { 30406500, 31206350, 32306220, 33106330, 33006460, 32706600, 31306580, 30406500 },
    loot = {
      item = {
        -- Breath of Talador
        [116113] = { type = 'toy' },
      },
    },
  },

  -- Ra'kahn
  [59405960] = {
    npcId = 77741,
    questId = 34196,
    icon = 'monster',
    note = t['in_cave'],
    POI = { 60305730 },
    loot = {
      item = {
        -- Ra'kahn's Bite
        [116112] = { type = 'transmog' },
      },
    },
  },

  -- Wandering Vindicator
  [69603360] = {
    npcId = 77776,
    questId = 34205,
    icon = 'monster',
    note = t['wandering_vindicator_note'],
    loot = {
      item = {
        -- Forgotten Vindicator's Blade
        [112261] = { type = 'transmog' },
      },
    },
  },

  -- Lo'marg Jawcrusher
  [49009200] = {
    npcId = 77784,
    questId = 34208,
    icon = 'monster',
    loot = {
      item = {
        -- Tezzakel's Terrible Talisman
        [116070] = { subtype = t['neck'] },
      },
    },
  },

  -- Echo of Murmur
  [34005720] = {
    npcId = 77828,
    questId = 34221,
    icon = 'monster',
    loot = {
      item = {
        -- Mournful Moan of Murmur
        [113670] = { type = 'toy' },
      },
    },
  },

  -- Klikixx
  [66808560] = {
    npcId = 78872,
    questId = 34498,
    icon = 'monster',
    note = t['in_cave'],
    POI = { 61308410 },
    loot = {
      item = {
        -- Klikixx's Webspinner
        [116125] = { type = 'toy' },
      },
    },
  },

  -- No'losh
  [86002960] = {
    npcId = 79334,
    questId = 34859,
    icon = 'monster',
    loot = {
      item = {
        -- Pulsating Brain of No'losh
        [116077] = { subtype = t['trinket'] },
      },
    },
  },

  -- Kurlosh Doomfang
  [37603760] = {
    npcId = 82988,
    questId = 37348,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26480 },
      },
      item = {
        -- Kurlosh's Kidneyslicer
        [119394] = { type = 'transmog' },
      },
    },
  },

  -- Lady Demlash
  [33603780] = {
    npcId = 82942,
    questId = 37346,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26478 },
      },
      item = {
        -- Demlash's Dashing Robe
        [119352] = { type = 'transmog' },
      },
    },
  },

  -- Talonpriest Zorkra
  [53809100] = {
    npcId = 79485,
    questId = 34668,
    icon = 'monster',
    loot = {
      item = {
        -- Zorkra's Hood
        [116110] = { type = 'transmog' },
      },
    },
  },

  -- Felbark
  [50208620] = {
    npcId = 80204,
    questId = 35018,
    icon = 'monster',
    path = { 50208620, 49408570, 49308440, 49108310, 50408310, 51208360, 51708430, 50908570, 50208620 },
    loot = {
      item = {
        -- Felbark's Shin
        [112373] = { type = 'transmog' },
      },
    },
  },

  -- Gennadian
  [67408060] = {
    npcId = 80471,
    questId = 34929,
    icon = 'monster',
    loot = {
      item = {
        -- Scales of Gennadian
        [116075] = { subtype = t['trinket'] },
      },
    },
  },

  -- Underseer Bloodmane
  [63602080] = {
    npcId = 80524,
    questId = 34945,
    icon = 'monster',
    loot = {
      item = {
        -- Prize's Horn-Ring
        [112475] = { subtype = t['ring'] },
      },
    },
  },

  -- Xothear, the Destroyer
  [37601460] = {
    npcId = 82922,
    questId = 37343,
    icon = 'monster',
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26580 },
      },
      item = {
        -- Mantle of the Destroyer
        [119371] = { type = 'transmog' },
      },
    },
  },

  -- Felfire Consort
  [47603280] = {
    npcId = 82992,
    questId = 37341,
    icon = 'monster',
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26468 },
      },
      item = {
        -- Consort's Promise Ring
        [119386] = { subtype = t['ring'] },
      },
    },
  },

  -- Matron of Sin
  [38804960] = {
    npcId = 82998,
    questId = 37349,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26481 },
      },
      item = {
        -- Matron's Supple Gloves
        [119353] = { type = 'transmog' },
      },
    },
  },

  -- Haakun the All-Consuming
  [48002520] = {
    npcId = 83008,
    questId = 37312,
    icon = 'monster',
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26467 },
      },
      item = {
        -- Sargerei Soulbiter
        [119403] = { type = 'transmog' },
      },
    },
  },

  -- Gug'tol
  [47603900] = {
    npcId = 83019,
    questId = 37340,
    icon = 'monster',
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26466 },
      },
      item = {
        -- Gug'tol's Imp Imperator
        [119402] = { type = 'transmog' },
      },
    },
  },

  -- Grrbrrgle
  [22207420] = {
    npcId = 85572,
    questId = 36919,
    icon = 'monster',
    loot = {
      item = {
        -- Mrglrgirdle
        [120436] = { type = 'transmog' },
      },
    },
  },

  -- Steeltusk
  [68003500] = {
    npcId = 86549,
    questId = 36858,
    icon = 'monster',
    loot = {
      item = {
        -- Steeltusk's Steel Tusk
        [117562] = { type = 'transmog' },
      },
    },
  },

  -- Avatar of Socrethar
  [46203140] = {
    npcId = 88043,
    questId = 37338,
    icon = 'monster',
    path = { 46203140, 45803420, 45003470, 45403660, 46203550, 48003510, 48303370 },
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26469 },
      },
      item = {
        -- Socrethar's Stone
        [119378] = { type = 'transmog', subtype = t['off-hand'] },
      },
    },
  },

  -- Legion Vanguard
  [38002060] = {
    npcId = 88494,
    questId = 37342,
    icon = 'monster',
    note = t['legion_vanguard_note'],
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26579 },
      },
      item = {
        -- Vanguard's Linebreaking Bracer
        [119385] = { type = 'transmog' },
      },
    },
  },

  -- Orumo the Observer
  [31404760] = {
    npcId = 87668,
    questId = 37344,
    icon = 'monster',
    note = t['orumo_the_observer_note'],
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26476 },
      },
      item = {
        -- Chained Orb of Omniscience
        [119375] = { subtype = t['neck'] },
        -- Eye of Observation
        [119170] = { petId = 1576 },
      },
    },
  },

  -- Shadowflame Terrorwalker
  [41004200] = {
    npcId = 82930,
    questId = 37347,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26479 },
      },
      item = {
        -- Searing Shadowflame Axe
        [119393] = { type = 'transmog' },
      },
    },
  },

  -- Lord Korinak
  [31002680] = {
    npcId = 82920,
    questId = 37345,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26477 },
      },
      item = {
        -- Doomlord's Seal of Command
        [119388] = { subtype = t['ring'] },
      },
    },
  },

  -- Vigilant Paarthos
  [37604320] = {
    npcId = 88436,
    questId = 37350,
    icon = 'monster',
    loot = {
      achievement = {
        -- Heralds of the Legion
        [9638] = { criteriaId = 26582 },
      },
      item = {
        -- Shoulderplates of the Vigilant
        [119383] = { type = 'transmog' },
      },
    },
  },

  -- Bombadier Gu'gok
  [43203740] = {
    npcId = 87597,
    questId = 37339,
    icon = 'monster',
    path = { 43203740, 43103840, 43803910, 44203980, 44504070, 45103890, 44603750, 43803680, 43203740 },
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26465 },
      },
      item = {
        -- Gu'gok's Rangefinder
        [119413] = { type = 'transmog' },
      },
    },
  },

  -- Taladorantula
  [59008740] = {
    npcId = 77634,
    questId = 34171,
    icon = 'monster',
    note = t['taladorantula_note'],
    loot = {
      item = {
        -- Taladorantula Terrorfang
        [116126] = { type = 'transmog' },
      },
    },
  },

  -- Kharazos the Triumphant
  [56606320] = {
    npcId = 78710,
    questId = 35220,
    icon = 'monster',
    note = t['kharazos_galzomar_sikthiss_note'],
    path = { 56606320, 56606490, 56706730 },
    loot = {
      item = {
        -- Burning Legion Missive
        [116122] = { type = 'toy' },
      },
    },
  },

  -- Galzomar
  [56606490] = {
    npcId = 78713,
    questId = 34483,
    icon = 'monster',
    note = t['kharazos_galzomar_sikthiss_note'],
    path = { 56606320, 56606490, 56706730 },
    loot = {
      item = {
        -- Burning Legion Missive
        [116122] = { type = 'toy' },
      },
    },
  },

  -- Sikthiss, Maiden of Slaughter
  [56706730] = {
    npcId = 78715,
    questId = 35219,
    icon = 'monster',
    note = t['kharazos_galzomar_sikthiss_note'],
    path = { 56606320, 56606490, 56706730 },
    loot = {
      item = {
        -- Burning Legion Missive
        [116122] = { type = 'toy' },
      },
    },
  },

  -- Sargerei War Council
  [43402700] = {
    npcId = 88071,
    questId = 37337,
    icon = 'monster',
    path = { 43402700, 44402580, 45802580, 46002700, 47302780, 47202920,
             47403090, 46403050, 45303010, 43603020, 43402700 },
    loot = {
      achievement = {
        -- Cut off the Head
        [9633] = { criteriaId = 26470 },
      },
      item = {
        -- Sargerei Councilor's Drape
        [119350] = { type = 'transmog', subtype = t['cloak'] },
      },
    },
  },

  -- Shirzir
  [43005400] = {
    npcId = 79543,
    questId = 34671,
    icon = 'monster',
    note = t['shirzir_note'],
    POI = { 41205990 },
    loot = {
      item = {
        -- Shirzir's Sticky Slippers
        [112370] = { type = 'transmog' },
      },
    },
  },

  --- Pet Battles
  -- Taralune
  [49008040] = {
    npcId = 87125,
    icon = 'pet',
    loot = {
      achievement = {
        -- Taming Draenor
        [9724] = { criteriaId = 27016 },
      },
    },
  },

  --- Achievements
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

local subPoints = {
  -- Shirzir
  [67602310] = {
    npcId = 79543,
    questId = 34671,
    icon = 'monster',
    loot = {
      item = {
        -- Shirzir's Sticky Slippers
        [112370] = { type = 'transmog' },
      },
    },
  },
}

this.points[map] = points
this.points[subMap] = subPoints
