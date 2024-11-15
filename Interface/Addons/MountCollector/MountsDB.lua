MDL_DB_ZONES = {
	[-1] = { raid = "Island Expeditions" },
	[-2] = { raid = "Horrific Visions" },
	[-3] = { raid = "Timewalking" },
	[-4] = { raid = "Covenant" },
	[1490] = { raid = "Operation: Mechagon" },
}

MDL_DB_MOUNTS = {
    [13335] = { -- Deathcharger's Reins
        spell_id = 17481,
        from = {
            {
                itemname = "Deathcharger's Reins", type = 'dungeon', npc_id = 45412,
                continent = "easternkingdoms", for_sort = 1, zone_id = 317, expansion = "classic",
                coordzone = 23, coordx = 43, coordy = 18, level = 30, 
            },
        },
    },
    [30480] = { -- Fiery Warhorse's Reins
        spell_id = 36702,
        from = {
            {
                itemname = "Fiery Warhorse's Reins", type = 'raid', npc_id = 16152, cond = "raid",
                continent = "easternkingdoms", for_sort = 1, zone_id = 350, expansion = "bc",
                coordzone = 42, coordx = 47, coordy = 75, level = 30, 
            },
        },
    },
    [32458] = { -- Ashes of Al'ar
        spell_id = 40192,
        from = {
            {
                itemname = "Ashes of Al'ar", type = 'raid', npc_id = 19622,
                continent = "outland", for_sort = 3, zone_id = 334, expansion = "bc",
                coordzone = 109, coordx = 74, coordy = 64, level = 30, 
            },
        },
    },
    [32768] = { -- Reins of the Raven Lord
        spell_id = 41252,
        from = {
            {
                itemname = "Reins of the Raven Lord", type = 'dungeon', subtype = 'heroic', npc_id = 23035,
                continent = "outland", for_sort = 3, zone_id = 258, expansion = "bc",
                coordzone = 108, coordx = 45, coordy = 65, level = 30, 
            },
        },
    },
    [35513] = { -- Swift White Hawkstrider
        spell_id = 46628,
        from = {
            {
                itemname = "Swift White Hawkstrider", type = 'dungeon', subtype = 'heroic', npc_id = 24664,
                continent = "outland", for_sort = 3, zone_id = 348, expansion = "bc",
                coordzone = 122, coordx = 44, coordy = 45, level = 30, 
            },
        },
    },
    [43952] = { -- Reins of the Azure Drake
        spell_id = 59567,
        from = {
            {
                itemname = "Reins of the Azure Drake", type = 'raid', npc_id = 28859,
                continent = "northrend", for_sort = 4, zone_id = 141, expansion = "wotlk",
                coordzone = 114, coordx = 27, coordy = 26, level = 30, 
            },
        },
    },
    [43951] = { -- Reins of the Bronze Drake
        spell_id = 59569,
        from = {
            {
                itemname = "Reins of the Bronze Drake", type = 'dungeon', subtype = 'heroic', npc_id = 32273,
                continent = "kalimdor", for_sort = 2, zone_id = 130, expansion = "wotlk",
                coordzone = 71, coordx = 65, coordy = 49, level = 30, 
                cond = '25_mins',
            },
        },
    },
    [43954] = { -- Reins of the Twilight Drake
        spell_id = 59571,
        from = {
            {
                itemname = "Reins of the Twilight Drake", type = 'raid', subtype = 'normal_25', npc_id = 28860,
                continent = "northrend", for_sort = 4, zone_id = 155, expansion = "wotlk",
                coordzone = 115, coordx = 60, coordy = 57, level = 30, 
                cond = '3_drakes_up',
            },
        },
    },
    [43986] = { -- Reins of the Black Drake
        spell_id = 59650,
        from = {
            {
                itemname = "Reins of the Black Drake", type = 'raid', subtype = 'normal_10', npc_id = 28860,
                continent = "northrend", for_sort = 4, zone_id = 155, expansion = "wotlk",
                coordzone = 115, coordx = 60, coordy = 57, level = 30, 
                cond = '3_drakes_up',
            },
        },
    },
    [43953] = { -- Reins of the Blue Drake
        spell_id = 59568,
        from = {
            {
                itemname = "Reins of the Blue Drake", type = 'raid', npc_id = 28859,
                continent = "northrend", for_sort = 4, zone_id = 141, expansion = "wotlk",
                coordzone = 114, coordx = 27, coordy = 26, level = 30, 
            },
        },
    },
    [43959] = { -- Reins of the Grand Black War Mammoth (alliance)
        spell_id = 61465, faction = 'alliance',
        from = {
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 31125,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Alliance",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 33993,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Alliance",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 35013,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Alliance",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 38433,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Alliance",
            },
        },
    },
    [44083] = { -- Reins of the Grand Black War Mammoth (horde)
        spell_id = 61467, faction = 'horde',
        from = {
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 31125,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Horde",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 33993,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Horde",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 35013,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Horde",
            },
            {
                itemname = "Reins of the Grand Black War Mammoth", type = 'raid', npc_id = 38433,
                continent = "northrend", for_sort = 4, zone_id = 156, expansion = "wotlk",
                coordzone = 123, coordx = 50, coordy = 11, level = 30, rarityname = "Reins of the Grand Black War Mammoth Horde",
            },
        },
    },
    [44151] = { -- Reins of the Blue Proto-Drake
        spell_id = 59996,
        from = {
            {
                itemname = "Reins of the Blue Proto-Drake", type = 'dungeon', subtype = 'heroic', npc_id = 26693,
                continent = "northrend", for_sort = 4, zone_id = 136, expansion = "wotlk",
                coordzone = 117, coordx = 58, coordy = 45, level = 30, 
            },
        },
    },
    [45693] = { -- Mimiron's Head
        spell_id = 63796,
        from = {
            {
                itemname = "Mimiron's Head", type = 'raid', subtype = 'normal_25', npc_id = 33288,
                continent = "northrend", for_sort = 4, zone_id = 147, expansion = "wotlk",
                coordzone = 120, coordx = 41, coordy = 17, level = 30, 
                cond = '0_keepers',
            },
        },
    },
    [49636] = { -- Reins of the Onyxian Drake
        spell_id = 69395,
        from = {
            {
                itemname = "Reins of the Onyxian Drake", type = 'raid', npc_id = 10184,
                continent = "kalimdor", for_sort = 2, zone_id = 248, expansion = "wotlk",
                coordzone = 70, coordx = 52, coordy = 77, level = 30, 
            },
        },
    },
    [50818] = { -- Invincible's Reins
        spell_id = 72286,
        from = {
            {
                itemname = "Invincible's Reins", type = 'raid', subtype = 'heroic_25', npc_id = 36597,
                continent = "northrend", for_sort = 4, zone_id = 186, expansion = "wotlk",
                coordzone = 118, coordx = 54, coordy = 87, level = 30, 
            },
        },
    },
    [63040] = { -- Reins of the Drake of the North Wind
        spell_id = 88742,
        from = {
            {
                itemname = "Reins of the Drake of the North Wind", type = 'dungeon', npc_id = 43873,
                continent = "kalimdor", for_sort = 2, zone_id = 325, expansion = "cata",
                coordzone = 249, coordx = 77, coordy = 84, level = 27, 
            },
        },
    },
    [63041] = { -- Reins of the Drake of the South Wind
        spell_id = 88744,
        from = {
            {
                itemname = "Reins of the Drake of the South Wind", type = 'raid', npc_id = 46753,
                continent = "kalimdor", for_sort = 2, zone_id = 328, expansion = "cata",
                coordzone = 249, coordx = 37, coordy = 81, level = 35, 
            },
        },
    },
    [63043] = { -- Reins of the Vitreous Stone Drake
        spell_id = 88746,
        from = {
            {
                itemname = "Reins of the Vitreous Stone Drake", type = 'dungeon', npc_id = 43214,
                continent = "deepholm", for_sort = 5, zone_id = 324, expansion = "cata",
                coordzone = 207, coordx = 47, coordy = 49, level = 35, 
            },
        },
    },
    [68823] = { -- Armored Razzashi Raptor
        spell_id = 96491,
        from = {
            {
                itemname = "Armored Razzashi Raptor", type = 'dungeon', subtype = 'heroic', npc_id = 52151,
                continent = "easternkingdoms", for_sort = 1, zone_id = 233, expansion = "cata",
                coordzone = 50, coordx = 67, coordy = 32, level = 35, 
            },
        },
    },
    [68824] = { -- Swift Zulian Panther
        spell_id = 96499,
        from = {
            {
                itemname = "Swift Zulian Panther", type = 'dungeon', subtype = 'heroic', npc_id = 52059,
                continent = "easternkingdoms", for_sort = 1, zone_id = 233, expansion = "cata",
                coordzone = 50, coordx = 67, coordy = 32, level = 35, 
            },
        },
    },
    [69224] = { -- Smoldering Egg of Millagazor
        spell_id = 97493,
        from = {
            {
                itemname = "Smoldering Egg of Millagazor", type = 'raid', npc_id = 52409,
                continent = "kalimdor", for_sort = 2, zone_id = 367, expansion = "cata",
                coordzone = 198, coordx = 47, coordy = 78, level = 35, 
            },
        },
    },
    [69747] = { -- Amani Battle Bear
        spell_id = 98204,
        from = {
            {
                itemname = "Amani Battle Bear", type = 'dungeon', subtype = 'heroic', npc_id = 23577,
                continent = "easternkingdoms", for_sort = 1, zone_id = 333, expansion = "cata",
                coordzone = 95, coordx = 78, coordy = 62, level = 35, 
                cond = '25_mins',
            },
        },
    },
    [71665] = { -- Flametalon of Alysrazor
        spell_id = 101542,
        from = {
            {
                itemname = "Flametalon of Alysrazor", type = 'raid', npc_id = 52530,
                continent = "kalimdor", for_sort = 2, zone_id = 367, expansion = "cata",
                coordzone = 198, coordx = 47, coordy = 78, level = 35, 
            },
        },
    },
    [77067] = { -- Reins of the Blazing Drake
        spell_id = 107842,
        from = {
            {
                itemname = "Reins of the Blazing Drake", type = 'raid', npc_id = 56173, encounter_id = 333,
                continent = "kalimdor", for_sort = 2, zone_id = 409, expansion = "cata",
                coordzone = 71, coordx = 66, coordy = 49, level = 35, 
            },
        },
    },
    [77069] = { -- Life-Binder's Handmaiden
        spell_id = 107845,
        from = {
            {
                itemname = "Life-Binder's Handmaiden", type = 'raid', subtype = 'heroic', npc_id = 56173, encounter_id = 333,
                continent = "kalimdor", for_sort = 2, zone_id = 409, expansion = "cata",
                coordzone = 71, coordx = 66, coordy = 49, level = 35, 
            },
        },
    },
    [78919] = { -- Experiment 12-B
        spell_id = 110039,
        from = {
            {
                itemname = "Experiment 12-B", type = 'raid', npc_id = 55294,
                continent = "kalimdor", for_sort = 2, zone_id = 409, expansion = "cata",
                coordzone = 71, coordx = 66, coordy = 49, level = 35, 
            },
        },
    },
    [87771] = { -- Reins of the Heavenly Onyx Cloud Serpent
        spell_id = 127158,
        from = {
            {
                itemname = "Reins of the Heavenly Onyx Cloud Serpent", type = 'world', quest_id = 32099, npc_id = 60491,
                continent = "pandaria", for_sort = 6, zone_id = 379, expansion = "mop",
                coordzone = 379, coordx = 54, coordy = 63, level = 35, 
            },
        },
    },
    [87777] = { -- Reins of the Astral Cloud Serpent
        spell_id = 127170,
        from = {
            {
                itemname = "Reins of the Astral Cloud Serpent", type = 'raid', npc_id = 60410,
                continent = "pandaria", for_sort = 6, zone_id = 471, expansion = "mop",
                coordzone = 379, coordx = 59, coordy = 39, level = 35, 
            },
        },
    },
    [89783] = { -- Son of Galleon's Saddle
        spell_id = 130965,
        from = {
            {
                itemname = "Son of Galleon's Saddle", type = 'world', quest_id = 32098, npc_id = 62346,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 71, coordy = 64, level = 35, 
            },
        },
    },
    [93666] = { -- Spawn of Horridon
        spell_id = 136471,
        from = {
            {
                itemname = "Spawn of Horridon", type = 'raid', npc_id = 68476,
                continent = "pandaria", for_sort = 6, zone_id = 508, expansion = "mop",
                coordzone = 504, coordx = 64, coordy = 31, level = 35, 
            },
        },
    },
    [94228] = { -- Reins of the Cobalt Primordial Direhorn
        spell_id = 138423,
        from = {
            {
                itemname = "Reins of the Cobalt Primordial Direhorn", type = 'world', quest_id = 32519, npc_id = 69161,
                continent = "pandaria", for_sort = 6, zone_id = 507, expansion = "mop",
                coordzone = 507, coordx = 50, coordy = 55, level = 35, 
            },
        },
    },
    [95057] = { -- Reins of the Thundering Cobalt Cloud Serpent
        spell_id = 139442,
        from = {
            {
                itemname = "Reins of the Thundering Cobalt Cloud Serpent", type = 'world', quest_id = 32518, npc_id = 69099,
                continent = "pandaria", for_sort = 6, zone_id = 504, expansion = "mop",
                coordzone = 504, coordx = 60, coordy = 38, level = 35, 
            },
        },
    },
    [95059] = { -- Clutch of Ji-Kun
        spell_id = 139448,
        from = {
            {
                itemname = "Clutch of Ji-Kun", type = 'raid', npc_id = 69712,
                continent = "pandaria", for_sort = 6, zone_id = 508, expansion = "mop",
                coordzone = 504, coordx = 64, coordy = 31, level = 35, 
            },
        },
    },
    [104253] = { -- Kor'kron Juggernaut
        spell_id = 148417,
        from = {
            {
                itemname = "Kor'kron Juggernaut", type = 'raid', subtype = 'mythic', npc_id = 71865,
                continent = "pandaria", for_sort = 6, zone_id = 556, expansion = "mop",
                coordzone = 390, coordx = 74, coordy = 40, level = 35, 
            },
        },
    },
    [116663] = { -- Shadowhide Pearltusk
        spell_id = 171624,
        from = {
            {
                itemname = "Shadowhide Pearltusk", faction = 'alliance',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 38, coordy = 32, level = 40, 
                cond = 'gold_victory',
            },
            {
                itemname = "Shadowhide Pearltusk", faction = 'horde',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 44, coordy = 46, level = 40, 
                cond = 'gold_victory',
            },
        },
    },
    [116673] = { -- Giant Coldsnout
        spell_id = 171635,
        from = {
            {
                itemname = "Giant Coldsnout", faction = 'alliance',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 38, coordy = 32, level = 40, 
                cond = 'gold_victory',
            },
            {
                itemname = "Giant Coldsnout", faction = 'horde',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 44, coordy = 46, level = 40, 
                cond = 'gold_victory',
            },
        },
    },
    [116779] = { -- Garn Steelmaw
        spell_id = 171836,
        from = {
            {
                itemname = "Garn Steelmaw", faction = 'alliance',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 38, coordy = 32, level = 40, 
                cond = 'gold_victory',
            },
            {
                itemname = "Garn Steelmaw", faction = 'horde',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 44, coordy = 46, level = 40, 
                cond = 'gold_victory',
            },
        },
    },
    [116786] = { -- Smoky Direwolf
        spell_id = 171843,
        from = {
            {
                itemname = "Smoky Direwolf", faction = 'alliance',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 38, coordy = 32, level = 40, 
                cond = 'gold_victory',
            },
            {
                itemname = "Smoky Direwolf", faction = 'horde',
                type = 'special', subtype = 'garrison_invasion', quest_id = 37640,
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 44, coordy = 46, level = 40, 
                cond = 'gold_victory',
            },
        },
    },
    [116771] = { -- Solar Spirehawk
        spell_id = 171828,
        from = {
            {
                itemname = "Solar Spirehawk", type = 'world', quest_id = 37464, npc_id = 87493,
                continent = "draenor", for_sort = 7, zone_id = 542, expansion = "wod",
                coordzone = 542, coordx = 37, coordy = 39, level = 40, 
            },
        },
    },
    [116792] = { -- Sunhide Gronnling
        spell_id = 171849,
        from = {
            {
                itemname = "Sunhide Gronnling", type = 'rare', npc_id = 50985,
                continent = "draenor", for_sort = 7, zone_id = 543, expansion = "wod",
                coordzone = 543, coordx = 47, coordy = 54.1, level = 40, 
            },
        },
    },
    [116661] = { -- Mottled Meadowstomper
        spell_id = 171622,
        from = {
            {
                itemname = "Mottled Meadowstomper", type = 'rare', npc_id = 50981,
                continent = "draenor", for_sort = 7, zone_id = 550, expansion = "wod",
                coordzone = 550, coordx = 67.2, coordy = 43.6, level = 40, 
            },
        },
    },
    [116659] = { -- Bloodhoof Bull
        spell_id = 171620,
        from = {
            {
                itemname = "Bloodhoof Bull", type = 'rare', npc_id = 50990,
                continent = "draenor", for_sort = 7, zone_id = 550, expansion = "wod",
                coordzone = 550, coordx = 55.2, coordy = 35.8, level = 40, 
            },
        },
    },
    [116674] = { -- Great Greytusk
        spell_id = 171636,
        from = {
            {
                itemname = "Great Greytusk", type = 'rare', npc_id = 50992,
                continent = "draenor", for_sort = 7, zone_id = 525, expansion = "wod",
                coordzone = 525, coordx = 58.6, coordy = 18.4, level = 40, 
            },
        },
    },
    [116767] = { -- Sapphire Riverbeast
        spell_id = 171824,
        from = {
            {
                itemname = "Sapphire Riverbeast", type = 'rare', npc_id = 51015,
                continent = "draenor", for_sort = 7, zone_id = 535, expansion = "wod",
                coordzone = 535, coordx = 62.4, coordy = 33.2, level = 40, 
            },
        },
    },
    [116773] = { -- Swift Breezestrider
        spell_id = 171830,
        from = {
            {
                itemname = "Swift Breezestrider", type = 'rare', npc_id = 50883,
                continent = "draenor", for_sort = 7, zone_id = 539, expansion = "wod",
                coordzone = 539, coordx = 44.6, coordy = 43.6, level = 40, 
            },
        },
    },
    [116658] = { -- Tundra Icehoof
        spell_id = 171619,
        from = {
            {
                itemname = "Tundra Icehoof", type = 'world', quest_id = 39288, npc_id = 95044,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 15, coordy = 63, level = 40, 
            },
            {
                itemname = "Tundra Icehoof", type = 'world', quest_id = 39287, npc_id = 95053,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 23, coordy = 40, level = 40, 
            },
            {
                itemname = "Tundra Icehoof", type = 'world', quest_id = 39290, npc_id = 95054,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 32, coordy = 74, level = 40, 
            },
            {
                itemname = "Tundra Icehoof", type = 'world', quest_id = 39289, npc_id = 95056,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 47, coordy = 53, level = 40, 
            },
        },
    },
    [116669] = { -- Armored Razorback
        spell_id = 171630,
        from = {
            {
                itemname = "Armored Razorback", type = 'world', quest_id = 39288, npc_id = 95044,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 15, coordy = 63, level = 40, 
            },
            {
                itemname = "Armored Razorback", type = 'world', quest_id = 39287, npc_id = 95053,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 23, coordy = 40, level = 40, 
            },
            {
                itemname = "Armored Razorback", type = 'world', quest_id = 39290, npc_id = 95054,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 32, coordy = 74, level = 40, 
            },
            {
                itemname = "Armored Razorback", type = 'world', quest_id = 39289, npc_id = 95056,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 47, coordy = 53, level = 40, 
            },
        },
    },
    [116780] = { -- Warsong Direfang
        spell_id = 171837,
        from = {
            {
                itemname = "Warsong Direfang", type = 'world', quest_id = 39288, npc_id = 95044,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 15, coordy = 63, level = 40, 
            },
            {
                itemname = "Warsong Direfang", type = 'world', quest_id = 39287, npc_id = 95053,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 23, coordy = 40, level = 40, 
            },
            {
                itemname = "Warsong Direfang", type = 'world', quest_id = 39290, npc_id = 95054,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 32, coordy = 74, level = 40, 
            },
            {
                itemname = "Warsong Direfang", type = 'world', quest_id = 39289, npc_id = 95056,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 47, coordy = 53, level = 40, 
            },
        },
    },
	[123890] = { -- Felsteel Annihilator
        spell_id = 182912,
        from = {
            {
                itemname = "Felsteel Annihilator", type = 'raid', subtype = 'mythic', npc_id = 91331,
                continent = "draenor", for_sort = 7, zone_id = 661, expansion = "wod",
                coordzone = 534, coordx = 47, coordy = 52, level = 40, 
            },
        },
    },
	[116660] = { -- Ironhoof Destroyer
        spell_id = 171621,
        from = {
            {
                itemname = "Ironhoof Destroyer", type = 'raid', subtype = 'mythic', npc_id = 77325,
                continent = "draenor", for_sort = 7, zone_id = 596, expansion = "wod",
                coordzone = 543, coordx = 51, coordy = 27, level = 40, 
            },
        },
    },
	[137574] = { -- Living Infernal Core
        spell_id = 213134,
        from = {
            {
                itemname = "Living Infernal Core", type = 'raid', npc_id = 105503,
                continent = "brokenisles", for_sort = 8, zone_id = 764, expansion = "legion",
                coordzone = 680, coordx = 44, coordy = 57, level = 40, 
            },
        },
    },
	[137575] = { -- Fiendish Hellfire Core
        spell_id = 171827,
        from = {
            {
                itemname = "Fiendish Hellfire Core", type = 'raid', subtype = 'mythic', npc_id = 105503,
                continent = "brokenisles", for_sort = 8, zone_id = 764, expansion = "legion",
                coordzone = 680, coordx = 44, coordy = 57, level = 40, 
            },
        },
    },
	[152816] = { -- Antoran Charhound
        spell_id = 253088,
        from = {
            {
                itemname = "Antoran Charhound", type = 'raid', npc_id = 126916, encounter_id = 1987,
                continent = "brokenisles", for_sort = 8, zone_id = 909, expansion = "legion",
                coordzone = 885, coordx = 55, coordy = 62, level = 45, 
            },
        },
    },
	[152789] = { -- Shackled Ur'zul
        spell_id = 243651,
        from = {
            {
                itemname = "Shackled Ur'zul", type = 'raid', subtype = 'mythic', npc_id = 124828,
                continent = "brokenisles", for_sort = 8, zone_id = 909, expansion = "legion",
                coordzone = 885, coordx = 55, coordy = 62, level = 45, 
            },
        },
    },
	[143643] = { -- Abyss Worm
        spell_id = 232519,
        from = {
            {
                itemname = "Abyss Worm", type = 'raid', npc_id = 115767,
                continent = "brokenisles", for_sort = 8, zone_id = 850, expansion = "legion",
                coordzone = 646, coordx = 64, coordy = 21, level = 45, 
            },
        },
    },
	[142552] = { -- Smoldering Ember Wyrm
        spell_id = 231428,
        from = {
            {
                itemname = "Smoldering Ember Wyrm", type = 'dungeon', subtype = 'mythic', npc_id = 114895,
                continent = "easternkingdoms", for_sort = 1, zone_id = 814, instanceid = 1651, expansion = "legion",
                coordzone = 42, coordx = 47, coordy = 70, level = 45, 
            },
        },
    },
	[142236] = { -- Midnight's Eternal Reins
        spell_id = 229499,
        from = {
            {
                itemname = "Midnight's Eternal Reins", type = 'dungeon', subtype = 'mythic', npc_id = 114262,
                continent = "easternkingdoms", for_sort = 1, zone_id = 814, instanceid = 1651, expansion = "legion",
                coordzone = 42, coordx = 47, coordy = 70, level = 45, 
            },
        },
    },
	-- BFA Mounts
	[161479] = { -- Nazjatar Blood Serpent
        spell_id = 275623,
        from = {
            {
                itemname = "Nazjatar Blood Serpent", type = 'special', subtype = 'summoned', npc_id = 140474,
                continent = "kultiras", for_sort = 9, zone_id = 942, expansion = "bfa",
                coordzone = 942, coordx = 73, coordy = 23, level = 50, 
				cond = '20_abyssal_fragments',
            },
        },
    },
	[163644] = { -- Swift Albino Raptor
        spell_id = 279569,
        from = {
            {
                itemname = "Swift Albino Raptor", type = 'special', subtype = 'warfront', npc_id = 142709, quest_id = 53083, faction = "alliance",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 68, coordy = 66, level = 50, 
            },
			{
                itemname = "Swift Albino Raptor", type = 'special', subtype = 'warfront', npc_id = 142709, quest_id = 53504, faction = "horde",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 68, coordy = 66, level = 50, 
            },
        },
    },
	[159921] = { -- Tomb Stalker
        spell_id = 266058,
        from = {
            {
                itemname = "Mummified Raptor Skull", type = 'dungeon', subtype = 'mythic', npc_id = 136160,
                continent = "zandalar", for_sort = 10, zone_id = 1004, expansion = "bfa",
                coordzone = 862, coordx = 38, coordy = 39, level = 50, 
            },
        },
    },
	[163578] = { -- Broken Highland Mustang
        spell_id = 279457,
        from = {
            {
				itemname = "Broken Highland Mustang", faction = 'horde', quest_id = 53088,
                type = 'special', subtype = 'warfront', npc_id = 142739,
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 49, coordy = 39, level = 50, 
            },
        },
    },
	[163579] = { -- Highland Mustang
        spell_id = 279456,
        from = {
            {
				itemname = "Highland Mustang", faction = 'alliance', quest_id = 53085,
                type = 'special', subtype = 'warfront', npc_id = 142741,
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 54, coordy = 57, level = 50, 
            },
        },
    },
	[163645] = { -- Skullripper
        spell_id = 279611,
        from = {
            {
                itemname = "Skullripper", type = 'special', subtype = 'warfront', npc_id = 142437, quest_id = 53022, faction = "alliance",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 57, coordy = 45, level = 50, 
            },
			{
                itemname = "Skullripper", type = 'special', subtype = 'warfront', npc_id = 142437, quest_id = 53526, faction = "horde",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 57, coordy = 45, level = 50, 
            },
        },
    },
	[163706] = { -- Witherbark Direwing
        spell_id = 279868,
        from = {
            {
                itemname = "Witherbark Direwing", type = 'special', subtype = 'warfront', npc_id = 142692, quest_id = 53091, faction = "alliance",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 67, coordy = 60, level = 50, 
            },
			{
                itemname = "Witherbark Direwing", type = 'special', subtype = 'warfront', npc_id = 142692, quest_id = 53517, faction = "horde",
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 67, coordy = 60, level = 50, 
            },
        },
    },
	[163646] = { -- Lil' Donkey Alliance
        spell_id = 279608,
        from = {
            {
                itemname = "Lil' Donkey", type = 'special', subtype = 'warfront', npc_id = 142423, faction = "alliance", quest_id = 53014,
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 33, coordy = 37, level = 50, 
            },
        },
    },
	[163646] = { -- Lil' Donkey Horde
        spell_id = 279608,
        from = {
            {
                itemname = "Lil' Donkey", type = 'special', subtype = 'warfront', npc_id = 142423, faction = "horde", quest_id = 53518,
                continent = "easternkingdoms", for_sort = 1, zone_id = 1044, expansion = "bfa",
                coordzone = 1044, coordx = 27, coordy = 56, level = 50, 
            },
        },
    },
	[166438] = { -- Blackpaw Alliance
        spell_id = 288438,
        from = {
            {
                itemname = "Blackpaw", type = 'special', subtype = 'warfront', npc_id = 149652, faction = "alliance", quest_id = 54883,
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 49.6, coordy = 25, level = 50, 
            },
        },
    },
	[166428] = { -- Blackpaw Horde
        spell_id = 288438,
        from = {
            {
                itemname = "Blackpaw", type = 'special', subtype = 'warfront', npc_id = 149660, faction = "horde", quest_id = 54890,
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 56, coordy = 35, level = 50, 
            },
        },
    },
	[166432] = { -- Ashenvale Chimaera
        spell_id = 288495,
        from = {
            {
                itemname = "Ashenvale Chimaera", type = 'special', subtype = 'warfront', npc_id = 148787, quest_id = 54695, faction = "alliance",
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 56, coordy = 30, level = 50, 
            },
			{
                itemname = "Ashenvale Chimaera", type = 'special', subtype = 'warfront', npc_id = 148787, quest_id = 54696, faction = "horde",
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 56, coordy = 30, level = 50, 
            },
        },
    },
	[166437] = { -- Kaldorei Nightsaber Alliance
        spell_id = 288505,
        from = {
            {
                itemname = "Captured Kaldorei Nightsaber", type = 'special', subtype = 'warfront', npc_id = 149661, faction = "alliance", quest_id = 54886,
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 50, coordy = 32, level = 50, 
            },
        },
    },
	[166435] = { -- Kaldorei Nightsaber Horde
        spell_id = 288505,
        from = {
            {
                itemname = "Kaldorei Nightsaber", type = 'special', subtype = 'warfront', npc_id = 149658, faction = "horde", quest_id = 54892,
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 39, coordy = 33, level = 50, 
            },
        },
    },
	[166434] = { -- Umber Nightsaber Alliance
        spell_id = 288503,
        from = {
            {
                itemname = "Captured Umber Nightsaber", type = 'special', subtype = 'warfront', npc_id = 147701, faction = "alliance",
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 63, coordy = 20, level = 50, 
            },
        },
    },
	[166434] = { -- Umber Nightsaber Horde
        spell_id = 288503,
        from = {
            {
                itemname = "Captured Umber Nightsaber", type = 'special', subtype = 'warfront', npc_id = 148037, faction = "horde",
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 58, coordy = 24, level = 50, 
            },
        },
    },
	[166433] = { -- Frightened Kodo
        spell_id = 288499,
        from = {
            {
                itemname = "Frightened Kodo", type = 'special', subtype = 'warfront', npc_id = 148790,
                continent = "kalimdor", for_sort = 2, zone_id = 62, expansion = "bfa",
                coordzone = 62, coordx = 41, coordy = 65, level = 50, 
            },
        },
    },
	[163574] = { -- Terrified Pack Mule
        spell_id = 260174,
        from = {
            {
                itemname = "Chewed-On Reins of the Terrified Pack Mule", type = 'zone',
                continent = "kultiras", for_sort = 9, zone_id = 896, expansion = "bfa",
                level = 45, 
				cond = 'hexthralled',
            },
        },
    },
	[163573] = { -- Goldenmane
        spell_id = 260175,
        from = {
            {
                itemname = "Goldenmane's Reins", type = 'zone',
                continent = "kultiras", for_sort = 9, zone_id = 942, expansion = "bfa",
                level = 45, 
            },
        },
    },
	[163575] = { -- Leaping Veinseeker
        spell_id = 243795,
        from = {
            {
                itemname = "Reins of a Tamed Bloodfeaster", type = 'zone',
                continent = "zandalar", for_sort = 10, zone_id = 863, expansion = "bfa",
                level = 45, 
            },
        },
    },
	[163576] = { -- Dune Scavenger
        spell_id = 237286,
        from = {
            {
                itemname = "Captured Dune Scavenger", type = 'zone',
                continent = "zandalar", for_sort = 10, zone_id = 864, expansion = "bfa",
                level = 45, 
				cond = 'faithless/sethrak',
            },
        },
    },
	[160829] = { -- Underrot Crawg
        spell_id = 273541,
        from = {
            {
                itemname = "Underrot Crawg Harness", type = 'dungeon', subtype = 'mythic', npc_id = 133007,
                continent = "zandalar", for_sort = 10, zone_id = 1042, expansion = "bfa",
                coordzone = 863, coordx = 51, coordy = 64, level = 50, 
            },
        },
    },
	[159842] = { -- Sharkbait
        spell_id = 254813,
        from = {
            {
                itemname = "Sharkbait's Favorite Crackers", type = 'dungeon', subtype = 'mythic', npc_id = 129440,
                continent = "kultiras", for_sort = 9, zone_id = 936, expansion = "bfa", encounter_id = 2095,
                coordzone = 895, coordx = 84, coordy = 78, level = 50, 
            },
        },
    },
	[163584] = { -- Twilight Avenger
        spell_id = 279466,
        from = {
            {
                itemname = "Twilight Avenger", type = 'expeditions',
                continent = "islandexpedition", for_sort = 11, zone_id = -1, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[163585] = { -- Surf Jelly
        spell_id = 278979,
        from = {
            {
                itemname = "Surf Jelly", type = 'expeditions',
                continent = "islandexpedition", for_sort = 11, zone_id = -1, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[163583] = { -- Craghorn Chasm-Leaper
        spell_id = 279467,
        from = {
            {
                itemname = "Craghorn Chasm-Leaper", type = 'expeditions',
                continent = "islandexpedition", for_sort = 11, zone_id = -1, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[163586] = { -- Squawks
        spell_id = 254811,
        from = {
            {
                itemname = "Squawks", type = 'expeditions',
                continent = "islandexpedition", for_sort = 11, zone_id = -1, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[163582] = { -- Qinsho's Eternal Hound
        spell_id = 279469,
        from = {
            {
                itemname = "Qinsho's Eternal Hound", type = 'expeditions',
                continent = "islandexpedition", for_sort = 11, zone_id = -1, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[166705] = { -- Glacial Tidestorm Alliance
        spell_id = 289555,
        from = {
            {
                itemname = "Glacial Tidestorm", type = 'raid', subtype = 'mythic', npc_id = 162208, faction = 'alliance',
                continent = "kultiras", for_sort = 10, zone_id = 1352, expansion = "bfa",
                coordzone = 1161, coordx = 70, coordy = 35, level = 50, 
            },
            {
                itemname = "Glacial Tidestorm", type = 'raid', subtype = 'mythic', npc_id = 162208, faction = 'horde',
                continent = "zandalar", for_sort = 10, zone_id = 1352, expansion = "bfa",
                coordzone = 862, coordx = 54, coordy = 30, level = 50, 
            },
        },
    },
	[166518] = { -- G.M.O.D. Alliance
        spell_id = 289083,
        from = {
            {
                itemname = "G.M.O.D.", type = 'raid', npc_id = 144838, faction = 'alliance',
                continent = "kultiras", for_sort = 10, zone_id = 1352, expansion = "bfa",
                coordzone = 1161, coordx = 70, coordy = 35, level = 50, 
            },
            {
                itemname = "G.M.O.D.", type = 'raid', npc_id = 144838, faction = 'horde',
                continent = "zandalar", for_sort = 10, zone_id = 1352, expansion = "bfa",
                coordzone = 862, coordx = 54, coordy = 30, level = 50, 
            },
        },
    },
	[174872] = { -- Ny'alotha Allseer
        spell_id = 308814,
        from = {
            {
                itemname = "Ny'alotha Allseer", type = 'raid', subtype = 'mythic', npc_id = 158041,
                continent = "nyalotha", for_sort = 14, zone_id = 1580, expansion = "bfa",
                coordzone = 1527, coordx = 55, coordy = 44, level = 50, 
            },
        },
    },
	[174653] = { -- Mail Muncher
        spell_id = 315987,
        from = {
            {
                itemname = "Mail Muncher", type = 'special', subtype = 'horrificvision', npc_id = 160708,
                continent = "horrificvision", for_sort = 12, zone_id = -2, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[174641] = { -- Drake of the Four Winds
        spell_id = 315847,
        from = {
            {
                itemname = "Drake of the Four Winds", type = 'special', subtype = 'bfaassault', npc_id = 157134,
                continent = "kalimdor", for_sort = 2, zone_id = 1527, quest_id = 57259, expansion = "bfa",
                coordzone = 1527, coordx = 74, coordy = 83, level = 50, 
            },
        },
    },
	[174769] = { -- Malevolent Drone
        spell_id = 316337,
        from = {
            {
                itemname = "Malevolent Drone", type = 'special', subtype = 'bfaassault', npc_id = 162147,
                continent = "kalimdor", for_sort = 2, zone_id = 1527, quest_id=58696, bfaassault = "AQR", expansion = "bfa",
                coordzone = 1527, coordx = 31, coordy = 49, level = 50, 
            },
        },
    },
	[174753] = { -- Waste Marauder
        spell_id = 316275,
        from = {
            {
                itemname = "Waste Marauder", type = 'special', subtype = 'bfaassault', npc_id = 157146,
                continent = "kalimdor", for_sort = 2, zone_id = 1527, quest_id=57273, bfaassault = "AMA", expansion = "bfa",
                coordzone = 1527, coordx = 68, coordy = 32, level = 50, 
            },
        },
    },
	[174859] = { -- Springfur Alpaca
        spell_id = 316802,
        from = {
            {
                itemname = "Springfur Alpaca", type = 'special', subtype = 'bfaassault', npc_id = 162765,
                continent = "kalimdor", for_sort = 2, zone_id = 1527, quest_id=58879, expansion = "bfa",
                coordzone = 1527, coordx = 46, coordy = 48, level = 50, 
            },
        },
    },
	[174649] = { -- Rajani Warserpent
        spell_id = 315427,
        from = {
            {
                itemname = "Rajani Warserpent", type = 'special', subtype = 'bfaassault', npc_id = 157162,
                continent = "pandaria", for_sort = 6, zone_id = 1530, quest_id=57346, bfaassault = "MOG", expansion = "bfa",
                coordzone = 1530, coordx = 22, coordy = 13, level = 50, 
            },
        },
    },
	[174752] = { -- Ivory Cloud Serpent
        spell_id = 315014,
        from = {
            {
                itemname = "Ivory Cloud Serpent", type = 'zone',
                continent = "pandaria", for_sort = 6, zone_id = 1530, expansion = "bfa",
                level = 50, 
            },
        },
    },
	[174841] = { -- Ren's Stalwart Hound
        spell_id = 316722,
        from = {
            {
                itemname = "Ren's Stalwart Hound", type = 'special', subtype = 'bfaassault', npc_id = 157160,
                continent = "pandaria", for_sort = 6, zone_id = 1530, quest_id=57345, bfaassault = "MOG", expansion = "bfa",
                coordzone = 1530, coordx = 9, coordy = 35, level = 50, 
            },
        },
    },
	[174840] = { -- Xinlao
        spell_id = 316723,
        from = {
            {
                itemname = "Xinlao", type = 'special', subtype = 'bfaassault', npc_id = 157466,
                continent = "pandaria", for_sort = 6, zone_id = 1530, quest_id=57363, bfaassault = "MOG", expansion = "bfa",
                coordzone = 1530, coordx = 35, coordy = 68, level = 50, 
            },
        },
    },
	[173887] = { -- Clutch of Ha-Li
        spell_id = 312751,
        from = {
            {
                itemname = "Clutch of Ha-Li", type = 'special', subtype = 'bfaassault', npc_id = 157153,
                continent = "pandaria", for_sort = 6, zone_id = 1530, quest_id=57344, bfaassault = "MOG", expansion = "bfa",
                coordzone = 1530, coordx = 36, coordy = 37, level = 50, 
            },
        },
    },
	[174842] = { -- Slightly Damp Pile of Fur / Mollie
        spell_id = 298367,
        from = {
            {
                itemname = "Slightly Damp Pile of Fur", type = 'world', subtype = 'wq', npc_id = 138794,
                continent = "zandalar", for_sort = 10, zone_id = 864, quest_id=52196, expansion = "bfa",
                coordzone = 864, coordx = 44, coordy = 55, level = 50, 
            },
        },
    },
	[137570] = { -- Bloodfang Cocoon
        spell_id = 213115,
        from = {
            {
                itemname = "Bloodfang Cocoon", type = 'vendor', npc_id = 108468, cost = 2000000,
                continent = "brokenisles", for_sort = 8, zone_id = 627, expansion = "legion",
                coordzone = 627, coordx = 43, coordy = 47, level = 40, 
            },
        },
    },
		[28481] = { -- Brown Elekk
        spell_id = 34406,
        from = {
            {
                itemname = "Brown Elekk", type = 'vendor', npc_id = 17584, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 10, 
            },
        },
    },
		[29744] = { -- Gray Elekk
        spell_id = 35710,
        from = {
            {
                itemname = "Gray Elekk", type = 'vendor', npc_id = 17584, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 10, 
            },
        },
    },
		[29743] = { -- Purple Elekk
        spell_id = 35711,
        from = {
            {
                itemname = "Purple Elekk", type = 'vendor', npc_id = 17584, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 10, 
            },
        },
    },
		[29745] = { -- Great Blue Elekk
        spell_id = 35713,
        from = {
            {
                itemname = "Great Blue Elekk", type = 'vendor', npc_id = 17584, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 17, 
            },
        },
    },
		[29746] = { -- Great Green Elekk
        spell_id = 35712,
        from = {
            {
                itemname = "Great Green Elekk", type = 'vendor', npc_id = 17584, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 17, 
            },
        },
    },
		[29747] = { -- Great Purple Elekk
        spell_id = 35714,
        from = {
            {
                itemname = "Great Purple Elekk", type = 'vendor', npc_id = 17584, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 930, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 103, expansion = "bc",
                coordzone = 103, coordx = 81.6, coordy = 52.6, level = 17, 
            },
        },
    },
		[5872] = { -- Brown Ram
        spell_id = 6899,
        from = {
            {
                itemname = "Brown Ram", type = 'vendor', npc_id = 1261, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 10, 
            },
        },
    },
		[5864] = { -- Gray Ram
        spell_id = 6777,
        from = {
            {
                itemname = "Gray Ram", type = 'vendor', npc_id = 1261, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 10, 
            },
        },
    },
		[5873] = { -- White Ram
        spell_id = 6898,
        from = {
            {
                itemname = "White Ram", type = 'vendor', npc_id = 1261, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 10, 
            },
        },
    },
		[18786] = { -- Swift Brown Ram
        spell_id = 23238,
        from = {
            {
                itemname = "Swift Brown Ram", type = 'vendor', npc_id = 1261, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 17, 
            },
        },
    },
		[18787] = { -- Swift Gray Ram
        spell_id = 23239,
        from = {
            {
                itemname = "Swift Gray Ram", type = 'vendor', npc_id = 1261, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 17, 
            },
        },
    },
		[18785] = { -- Swift White Ram
        spell_id = 23240,
        from = {
            {
                itemname = "Swift White Ram", type = 'vendor', npc_id = 1261, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 47, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 70.6, coordy = 48.8, level = 17, 
            },
        },
    },
		[8595] = { -- Blue Mechanostrider
        spell_id = 10969,
        from = {
            {
                itemname = "Blue Mechanostrider", type = 'vendor', npc_id = 7955, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                coordzone = 27, coordx = 56.2, coordy = 46.2, level = 10, 
            },
        },
    },
		[13321] = { -- Green Mechanostrider
        spell_id = 17453,
        from = {
            {
                itemname = "Green Mechanostrider", type = 'vendor', npc_id = 7955, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 10, 
            },
        },
    },
		[8563] = { -- Red Mechanostrider
        spell_id = 10873,
        from = {
            {
                itemname = "Red Mechanostrider", type = 'vendor', npc_id = 7955, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 10, 
            },
        },
    },
		[13322] = { -- Unpainted Mechanostrider
        spell_id = 17454,
        from = {
            {
                itemname = "Unpainted Mechanostrider", type = 'vendor', npc_id = 7955, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 10, 
            },
        },
    },
		[18772] = { -- Swift Green Mechanostrider
        spell_id = 23225,
        from = {
            {
                itemname = "Swift Green Mechanostrider", type = 'vendor', npc_id = 7955, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 17, 
            },
        },
    },
		[18773] = { -- Swift White Mechanostrider
        spell_id = 23223,
        from = {
            {
                itemname = "Swift White Mechanostrider", type = 'vendor', npc_id = 7955, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 17, 
            },
        },
    },
		[18774] = { -- Swift Yellow Mechanostrider
        spell_id = 23222,
        from = {
            {
                itemname = "Swift Yellow Mechanostrider", type = 'vendor', npc_id = 7955, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 54, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 27, expansion = "classic",
                oordzone = 27, coordx = 56.2, coordy = 46.2, level = 17, 
            },
        },
    },
		[2411] = { -- Black Stallion
        spell_id = 470,
        from = {
            {
                itemname = "Black Stallion", type = 'vendor', npc_id = 43694, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 10, 
            },
        },
    },
		[5656] = { -- Brown Horse
        spell_id = 458,
        from = {
            {
                itemname = "Brown Horse", type = 'vendor', npc_id = 43694, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 10, 
            },
        },
    },
		[5655] = { -- Chestnut Mare
        spell_id = 6648,
        from = {
            {
                itemname = "Chestnut Mare", type = 'vendor', npc_id = 43694, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 10, 
            },
        },
    },
		[2414] = { -- Pinto
        spell_id = 472,
        from = {
            {
                itemname = "Pinto", type = 'vendor', npc_id = 43694, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 10, 
            },
        },
    },
		[18777] = { -- Swift Brown Steed
        spell_id = 23229,
        from = {
            {
                itemname = "Swift Brown Steed", type = 'vendor', npc_id = 43694, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 17, 
            },
        },
    },
		[18776] = { -- Swift Palomino
        spell_id = 23227,
        from = {
            {
                itemname = "Swift Palomino", type = 'vendor', npc_id = 43694, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 17, 
            },
        },
    },
		[18778] = { -- Swift White Steed
        spell_id = 23228,
        from = {
            {
                itemname = "Swift White Steed", type = 'vendor', npc_id = 43694, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 72, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "classic",
                coordzone = 84, coordx = 77, coordy = 68.7, level = 17, 
            },
        },
    },
		[8632] = { -- Spotted Frostsaber
        spell_id = 10789,
        from = {
            {
                itemname = "Spotted Frostsaber", type = 'vendor', npc_id = 4730, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 10, 
            },
        },
    },
		[47100] = { -- Striped Dawnsaber
        spell_id = 66847,
        from = {
            {
                itemname = "Striped Dawnsaber", type = 'vendor', npc_id = 4730, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 10, 
            },
        },
    },
		[8631] = { -- Striped Frostsaber
        spell_id = 8394,
        from = {
            {
                itemname = "Striped Frostsaber", type = 'vendor', npc_id = 4730, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 10, 
            },
        },
    },
		[8629] = { -- Striped Nightsaber
        spell_id = 10793,
        from = {
            {
                itemname = "Striped Nightsaber", type = 'vendor', npc_id = 4730, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 10, 
            },
        },
    },
		[18766] = { -- Swift Frostsaber
        spell_id = 23221,
        from = {
            {
                itemname = "Swift Frostsaber", type = 'vendor', npc_id = 4730, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 17, 
            },
        },
    },
		[18767] = { -- Swift Mistsaber
        spell_id = 23219,
        from = {
            {
                itemname = "Swift Mistsaber", type = 'vendor', npc_id = 4730, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 17, 
            },
        },
    },
		[18902] = { -- Swift Stormsaber
        spell_id = 23338,
        from = {
            {
                itemname = "Swift Stormsaber", type = 'vendor', npc_id = 4730, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 69, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 42.6, coordy = 32.8, level = 17, 
            },
        },
    },
		[91008] = { -- Black Dragon Turtle Alliance
        spell_id = 127286,
        from = {
            {
                itemname = "Black Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91009] = { -- Blue Dragon Turtle Alliance
        spell_id = 127287,
        from = {
            {
                itemname = "Blue Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91005] = { -- Brown Dragon Turtle Alliance
        spell_id = 127288,
        from = {
            {
                itemname = "Brown Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91004] = { -- Green Dragon Turtle Alliance
        spell_id = 120395,
        from = {
            {
                itemname = "Green Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91006] = { -- Purple Dragon Turtle Alliance
        spell_id = 127289,
        from = {
            {
                itemname = "Purple Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91007] = { -- Red Dragon Turtle Alliance
        spell_id = 127290,
        from = {
            {
                itemname = "Red Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 10, 
            },
        },
    },
		[91011] = { -- Great Black Dragon Turtle Alliance
        spell_id = 127295,
        from = {
            {
                itemname = "Great Black Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91013] = { -- Great Blue Dragon Turtle Alliance
        spell_id = 127302,
        from = {
            {
                itemname = "Great Blue Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91014] = { -- Great Brown Dragon Turtle Alliance
        spell_id = 127308,
        from = {
            {
                itemname = "Great Brown Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91012] = { -- Great Green Dragon Turtle Alliance
        spell_id = 127293,
        from = {
            {
                itemname = "Great Green Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91015] = { -- Great Purple Dragon Turtle Alliance
        spell_id = 127310,
        from = {
            {
                itemname = "Great Purple Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91010] = { -- Great Red Dragon Turtle Alliance
        spell_id = 120822,
        from = {
            {
                itemname = "Great Red Dragon Turtle", type = 'vendor', npc_id = 65068, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1353, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "mop",
                coordzone = 84, coordx = 67.8, coordy = 18.4, level = 17, 
            },
        },
    },
		[91008] = { -- Black Dragon Turtle Horde
        spell_id = 127286,
        from = {
            {
                itemname = "Black Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91009] = { -- Blue Dragon Turtle Horde
        spell_id = 127287,
        from = {
            {
                itemname = "Blue Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91005] = { -- Brown Dragon Turtle Horde
        spell_id = 127288,
        from = {
            {
                itemname = "Brown Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91004] = { -- Green Dragon Turtle Horde
        spell_id = 120395,
        from = {
            {
                itemname = "Green Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91006] = { -- Purple Dragon Turtle Horde
        spell_id = 127289,
        from = {
            {
                itemname = "Purple Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91007] = { -- Red Dragon Turtle Horde
        spell_id = 127290,
        from = {
            {
                itemname = "Red Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 1, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 10, 
            },
        },
    },
		[91011] = { -- Great Black Dragon Turtle Horde
        spell_id = 127295,
        from = {
            {
                itemname = "Great Black Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[91013] = { -- Great Blue Dragon Turtle Horde
        spell_id = 127302,
        from = {
            {
                itemname = "Great Blue Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[91014] = { -- Great Brown Dragon Turtle Horde
        spell_id = 127308,
        from = {
            {
                itemname = "Great Brown Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[91012] = { -- Great Green Dragon Turtle Horde
        spell_id = 127293,
        from = {
            {
                itemname = "Great Green Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[91015] = { -- Great Purple Dragon Turtle Horde
        spell_id = 127310,
        from = {
            {
                itemname = "Great Purple Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[91010] = { -- Great Red Dragon Turtle Horde
        spell_id = 120822,
        from = {
            {
                itemname = "Great Red Dragon Turtle", type = 'vendor', npc_id = 66022, cost = 10, faction = 'horde',
				repdiscount = 1, repid = 1352, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "mop",
                coordzone = 85, coordx = 69.8, coordy = 41, level = 17, 
            },
        },
    },
		[73838] = { -- Mountain Horse
        spell_id = 103195,
        from = {
            {
                itemname = "Mountain Horse", type = 'vendor', npc_id = 55285, cost = 1, faction = 'alliance',
				repdiscount = 1, repid = 1134, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 48.2, coordy = 21.8, level = 10, 
            },
        },
    },
		[73839] = { -- Swift Mountain Horse
        spell_id = 103196,
        from = {
            {
                itemname = "Swift Mountain Horse", type = 'vendor', npc_id = 55285, cost = 10, faction = 'alliance',
				repdiscount = 1, repid = 1134, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 89, expansion = "classic",
                coordzone = 89, coordx = 48.2, coordy = 21.8, level = 17, 
            },
        },
    },
		[44235] = { -- Traveler's Tundra Mammoth Alliance
        spell_id = 61425,
        from = {
            {
                itemname = "Reins of the Traveler's Tundra Mammoth", type = 'vendor', npc_id = 32216, cost = 20000, faction = 'alliance',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[44234] = { -- Traveler's Tundra Mammoth Horde
        spell_id = 61447,
        from = {
            {
                itemname = "Reins of the Traveler's Tundra Mammoth", type = 'vendor', npc_id = 32216, cost = 20000, faction = 'horde',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[44225] = { -- Armored Brown Bear Alliance
        spell_id = 60114,
        from = {
            {
                itemname = "Reins of the Armored Brown Bear", type = 'vendor', npc_id = 32216, cost = 750, faction = 'alliance',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[44226] = { -- Armored Brown Bear Horde
        spell_id = 60116,
        from = {
            {
                itemname = "Reins of the Armored Brown Bear", type = 'vendor', npc_id = 32216, cost = 750, faction = 'horde',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[44230] = { -- Wooly Mammoth Alliance
        spell_id = 59791,
        from = {
            {
                itemname = "Reins of the Wooly Mammoth", type = 'vendor', npc_id = 32216, cost = 10000, faction = 'alliance',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[44231] = { -- Wooly Mammoth Horde
        spell_id = 59793,
        from = {
            {
                itemname = "Reins of the Wooly Mammoth", type = 'vendor', npc_id = 32216, cost = 10000, faction = 'horde',
				repdiscount = 1, repid = 1090,
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 17, 
            },
        },
    },
		[25471] = { -- Ebon Gryphon
        spell_id = 32239,
        from = {
            {
                itemname = "Ebon Gryphon", type = 'vendor', npc_id = 43768, cost = 50, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 25, 
            },
        },
    },
		[25470] = { -- Golden Gryphon
        spell_id = 32235,
        from = {
            {
                itemname = "Golden Gryphon", type = 'vendor', npc_id = 43768, cost = 50, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 25, 
            },
        },
    },
		[25472] = { -- Snowy Gryphon
        spell_id = 32240,
        from = {
            {
                itemname = "Snowy Gryphon", type = 'vendor', npc_id = 43768, cost = 50, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 25, 
            },
        },
    },
		[25473] = { -- Swift Blue Gryphon
        spell_id = 32242,
        from = {
            {
                itemname = "Swift Blue Gryphon", type = 'vendor', npc_id = 43768, cost = 100, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 27, 
            },
        },
    },
		[25528] = { -- Swift Green Gryphon
        spell_id = 32290,
        from = {
            {
                itemname = "Swift Green Gryphon", type = 'vendor', npc_id = 43768, cost = 100, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 27, 
            },
        },
    },
		[25529] = { -- Swift Purple Gryphon
        spell_id = 32292,
        from = {
            {
                itemname = "Swift Purple Gryphon", type = 'vendor', npc_id = 43768, cost = 100, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 27, 
            },
        },
    },
		[25527] = { -- Swift Red Gryphon
        spell_id = 32289,
        from = {
            {
                itemname = "Swift Red Gryphon", type = 'vendor', npc_id = 43768, cost = 100, faction = 'alliance',
                continent = "easternkingdoms", for_sort = 1, zone_id = 84, expansion = "bc",
                coordzone = 84, coordx = 71.4, coordy = 72.2, level = 27, 
            },
        },
    },
		[44689] = { -- Armored Snowy Gryphon
        spell_id = 61229,
        from = {
            {
                itemname = "Armored Snowy Gryphon", type = 'vendor', npc_id = 32216, cost = 2000, faction = 'alliance',
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 27, 
            },
        },
    },
		[29221] = { -- Black Hawkstrider
        spell_id = 35022,
        from = {
            {
                itemname = "Black Hawkstrider", type = 'vendor', npc_id = 16264, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 10, 
            },
        },
    },
		[29220] = { -- Blue Hawkstrider
        spell_id = 35020,
        from = {
            {
                itemname = "Blue Hawkstrider", type = 'vendor', npc_id = 16264, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 10, 
            },
        },
    },
		[29222] = { -- Purple Hawkstrider
        spell_id = 35018,
        from = {
            {
                itemname = "Purple Hawkstrider", type = 'vendor', npc_id = 16264, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 10, 
            },
        },
    },
		[28927] = { -- Red Hawkstrider
        spell_id = 34795,
        from = {
            {
                itemname = "Red Hawkstrider", type = 'vendor', npc_id = 16264, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 10, 
            },
        },
    },
		[29223] = { -- Swift Green Hawkstrider
        spell_id = 35025,
        from = {
            {
                itemname = "Swift Green Hawkstrider", type = 'vendor', npc_id = 16264, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 17, 
            },
        },
    },
		[28936] = { -- Swift Pink Hawkstrider
        spell_id = 33660,
        from = {
            {
                itemname = "Swift Pink Hawkstrider", type = 'vendor', npc_id = 16264, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 17, 
            },
        },
    },
		[29224] = { -- Swift Purple Hawkstrider
        spell_id = 35027,
        from = {
            {
                itemname = "Swift Purple Hawkstrider", type = 'vendor', npc_id = 16264, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 911, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 94, expansion = "bc",
                coordzone = 911, coordx = 61, coordy = 54.6, level = 17, 
            },
        },
    },
		[62461] = { -- Goblin Trike
        spell_id = 87090,
        from = {
            {
                itemname = "Goblin Trike Key", type = 'vendor', npc_id = 48510, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 1133, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "cata",
                coordzone = 85, coordx = 36.2, coordy = 86.6, level = 10, 
            },
        },
    },
		[62462] = { -- Goblin Turbo-Trike
        spell_id = 87091,
        from = {
            {
                itemname = "Goblin Turbo-Trike Key", type = 'vendor', npc_id = 48510, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 1133, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "cata",
                coordzone = 85, coordx = 36.2, coordy = 86.6, level = 17, 
            },
        },
    },
		[46099] = { -- Black Wolf
        spell_id = 64658,
        from = {
            {
                itemname = "Horn of the Black Wolf", type = 'vendor', npc_id = 3362, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 10, 
            },
        },
    },
		[5668] = { -- Brown Wolf
        spell_id = 6654,
        from = {
            {
                itemname = "Horn of the Brown Wolf", type = 'vendor', npc_id = 3362, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 10, 
            },
        },
    },
		[5665] = { -- Dire Wolf
        spell_id = 6653,
        from = {
            {
                itemname = "Horn of the Dire Wolf", type = 'vendor', npc_id = 3362, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 10, 
            },
        },
    },
		[1132] = { -- Timber Wolf
        spell_id = 580,
        from = {
            {
                itemname = "Horn of the Timber Wolf", type = 'vendor', npc_id = 3362, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 10, 
            },
        },
    },
		[18796] = { -- Swift Brown Wolf
        spell_id = 23250,
        from = {
            {
                itemname = "Horn of the Swift Brown Wolf", type = 'vendor', npc_id = 3362, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 17, 
            },
        },
    },
		[18798] = { -- Swift Gray Wolf
        spell_id = 23252,
        from = {
            {
                itemname = "Horn of the Swift Gray Wolf", type = 'vendor', npc_id = 3362, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 17, 
            },
        },
    },
		[18797] = { -- Swift Timber Wolf
        spell_id = 23251,
        from = {
            {
                itemname = "Horn of the Swift Timber Wolf", type = 'vendor', npc_id = 3362, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 76, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "classic",
                coordzone = 85, coordx = 61.6, coordy = 35.6, level = 17, 
            },
        },
    },
		[15290] = { -- Brown Kodo
        spell_id = 18990,
        from = {
            {
                itemname = "Brown Kodo", type = 'vendor', npc_id = 3685, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58, level = 10, 
            },
        },
    },
		[15277] = { -- Gray Kodo
        spell_id = 18989,
        from = {
            {
                itemname = "Gray Kodo", type = 'vendor', npc_id = 3685, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58, level = 10, 
            },
        },
    },
		[46100] = { -- White Kodo
        spell_id = 64657,
        from = {
            {
                itemname = "White Kodo", type = 'vendor', npc_id = 3685, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58,level = 10, 
            },
        },
    },
		[18794] = { -- Great Brown Kodo
        spell_id = 23249,
        from = {
            {
                itemname = "Great Brown Kodo", type = 'vendor', npc_id = 3685, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58, level = 17, 
            },
        },
    },
		[18795] = { -- Great Gray Kodo
        spell_id = 23248,
        from = {
            {
                itemname = "Great Gray Kodo", type = 'vendor', npc_id = 3685, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58, level = 17, 
            },
        },
    },
		[18793] = { -- Great White Kodo
        spell_id = 23247,
        from = {
            {
                itemname = "Great White Kodo", type = 'vendor', npc_id = 3685, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 81, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 7, expansion = "classic",
                coordzone = 7, coordx = 47.6, coordy = 58, level = 17, 
            },
        },
    },
		[8588] = { -- Emerald Raptor
        spell_id = 8395,
        from = {
            {
                itemname = "Whistle of the Emerald Raptor", type = 'vendor', npc_id = 7952, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 10, 
            },
        },
    },
		[8591] = { -- Turquoise Raptor
        spell_id = 10796,
        from = {
            {
                itemname = "Whistle of the Turquoise Raptor", type = 'vendor', npc_id = 7952, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 10, 
            },
        },
    },
		[8592] = { -- Violet Raptor
        spell_id = 10799,
        from = {
            {
                itemname = "Whistle of the Violet Raptor", type = 'vendor', npc_id = 7952, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 10, 
            },
        },
    },
		[18788] = { -- Swift Blue Raptor
        spell_id = 23241,
        from = {
            {
                itemname = "Swift Blue Raptor", type = 'vendor', npc_id = 7952, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 17, 
            },
        },
    },
		[18789] = { -- Swift Olive Raptor
        spell_id = 23242,
        from = {
            {
                itemname = "Swift Olive Raptor", type = 'vendor', npc_id = 7952, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 17, 
            },
        },
    },
		[18790] = { -- Swift Orange Raptor
        spell_id = 23243,
        from = {
            {
                itemname = "Swift Orange Raptor", type = 'vendor', npc_id = 7952, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 530, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1, expansion = "classic",
                coordzone = 1, coordx = 55.2, coordy = 75.6, level = 17, 
            },
        },
    },
		[46308] = { -- Black Skeletal Horse
        spell_id = 64977,
        from = {
            {
                itemname = "Black Skeletal Horse", type = 'vendor', npc_id = 4731, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 10, 
            },
        },
    },
		[13332] = { -- Blue Skeletal Horse
        spell_id = 17463,
        from = {
            {
                itemname = "Blue Skeletal Horse", type = 'vendor', npc_id = 4731, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 10, 
            },
        },
    },
		[13333] = { -- Brown Skeletal Horse
        spell_id = 17464,
        from = {
            {
                itemname = "Brown Skeletal Horse", type = 'vendor', npc_id = 4731, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 10, 
            },
        },
    },
		[13331] = { -- Red Skeletal Horse
        spell_id = 17462,
        from = {
            {
                itemname = "Red Skeletal Horse", type = 'vendor', npc_id = 4731, cost = 1, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 10, 
            },
        },
    },
		[13334] = { -- Green Skeletal Warhorse
        spell_id = 17465,
        from = {
            {
                itemname = "Green Skeletal Warhorse", type = 'vendor', npc_id = 4731, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 17, 
            },
        },
    },
		[47101] = { -- Ochre Skeletal Warhorse
        spell_id = 66846,
        from = {
            {
                itemname = "Ochre Skeletal Warhorse", type = 'vendor', npc_id = 4731, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 17, 
            },
        },
    },
		[18791] = { -- Purple Skeletal Warhorse
        spell_id = 23246,
        from = {
            {
                itemname = "Purple Skeletal Warhorse", type = 'vendor', npc_id = 4731, cost = 10, faction = 'horde',
                repdiscount = 1, repid = 68, reprequired = 1,
                continent = "easternkingdoms", for_sort = 1, zone_id = 18, expansion = "classic",
                coordzone = 18, coordx = 61.8, coordy = 51.8, level = 17, 
            },
        },
    },
		[25475] = { -- Blue Wind Rider
        spell_id = 32244,
        from = {
            {
                itemname = "Blue Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 25, 
            },
        },
    },
		[25476] = { -- Green Wind Rider
        spell_id = 32245,
        from = {
            {
                itemname = "Green Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 25, 
            },
        },
    },
		[25474] = { -- Tawny Wind Rider
        spell_id = 32243,
        from = {
            {
                itemname = "Tawny Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 25, 
            },
        },
    },
		[25531] = { -- Swift Green Wind Rider
        spell_id = 32295,
        from = {
            {
                itemname = "Swift Green Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 27, 
            },
        },
    },
		[25533] = { -- Swift Purple Wind Rider
        spell_id = 32297,
        from = {
            {
                itemname = "Swift Purple Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 27, 
            },
        },
    },
		[25477] = { -- Swift Red Wind Rider
        spell_id = 32246,
        from = {
            {
                itemname = "Swift Red Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 27, 
            },
        },
    },
		[25532] = { -- Swift Yellow Wind Rider
        spell_id = 32296,
        from = {
            {
                itemname = "Swift Yellow Wind Rider", type = 'vendor', npc_id = 44918, cost = 50, faction = 'horde',
                continent = "kalimdor", for_sort = 2, zone_id = 85, expansion = "bc",
                coordzone = 85, coordx = 48, coordy = 58.6, level = 27, 
            },
        },
    },
		[44690] = { -- Armored Blue Wind Rider
        spell_id = 61230,
        from = {
            {
                itemname = "Armored Blue Wind Rider", type = 'vendor', npc_id = 32216, cost = 2000, faction = 'horde',
                continent = "northrend", for_sort = 4, zone_id = 125, expansion = "wotlk",
                coordzone = 125, coordx = 58.1, coordy = 42, level = 27, 
            },
        },
    },
		[161908] = { -- Dusky Waycrest Gryphon
        spell_id = 275859,
        from = {
            {
                itemname = "Reins of the Dusky Waycrest Gryphon", type = 'vendor', npc_id = 135815, cost = 90000, faction = 'alliance',
                repdiscount = 1, repid = 2161, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 896, expansion = "bfa",
                coordzone = 896, coordx = 37.8, coordy = 49, level = 10, 
            },
        },
    },
		[161910] = { -- Smoky Charger
        spell_id = 260173,
        from = {
            {
                itemname = "Reins of the Smoky Charger", type = 'vendor', npc_id = 135815, cost = 12500, faction = 'alliance',
                repdiscount = 1, repid = 2161, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 896, expansion = "bfa",
                coordzone = 896, coordx = 37.8, coordy = 49, level = 10, 
            },
        },
    },
		[161911] = { -- Admiralty Stallion
        spell_id = 259213,
        from = {
            {
                itemname = "Reins of the Admiralty Stallion", type = 'vendor', npc_id = 135808, cost = 12500, faction = 'alliance',
                repdiscount = 1, repid = 2160, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 73.7, coordy = 25, level = 10, 
            },
        },
    },
		[161879] = { -- Proudmoore Sea Scout
        spell_id = 275868,
        from = {
            {
                itemname = "Reins of the Proudmoore Sea Scout", type = 'vendor', npc_id = 135808, cost = 90000, faction = 'alliance',
                repdiscount = 1, repid = 2160, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 73.7, coordy = 25, level = 10, 
            },
        },
    },
		[161912] = { -- Dapple Gray
        spell_id = 260172,
        from = {
            {
                itemname = "Reins of the Dapple Gray", type = 'vendor', npc_id = 135800, cost = 12500, faction = 'alliance',
                repdiscount = 1, repid = 2162, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 942, expansion = "bfa",
                coordzone = 942, coordx = 59.2, coordy = 69.4, level = 10, 
            },
        },
    },
		[161909] = { -- Stormsong Coastwatcher
        spell_id = 275866,
        from = {
            {
                itemname = "Reins of the Stormsong Coastwatcher", type = 'vendor', npc_id = 135800, cost = 90000, faction = 'alliance',
                repdiscount = 1, repid = 2162, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 942, expansion = "bfa",
                coordzone = 942, coordx = 59.2, coordy = 69.4, level = 10, 
            },
        },
    },
		[161666] = { -- Captured Swampstalker
        spell_id = 275838,
        from = {
            {
                itemname = "Reins of the Captured Swampstalker", type = 'vendor', npc_id = 135459, cost = 90000, faction = 'horde',
                repdiscount = 1, repid = 2156, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 863, expansion = "bfa",
                coordzone = 863, coordx = 39, coordy = 79.4, level = 10, 
            },
        },
    },
		[161774] = { -- Expedition Bloodswarmer
        spell_id = 275841,
        from = {
            {
                itemname = "Reins of the Expedition Bloodswarmer", type = 'vendor', npc_id = 135459, cost = 12500, faction = 'horde',
                repdiscount = 1, repid = 2156, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 863, expansion = "bfa",
                coordzone = 863, coordx = 39, coordy = 79.4, level = 10, 
            },
        },
    },
		[161667] = { -- Voldunai Dunescraper
        spell_id = 275840,
        from = {
            {
                itemname = "Reins of the Voldunai Dunescraper", type = 'vendor', npc_id = 135804, cost = 90000, faction = 'horde',
                repdiscount = 1, repid = 2158, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 864, expansion = "bfa",
                coordzone = 864, coordx = 56.6, coordy = 49.8, level = 10, 
            },
        },
    },
		[161773] = { -- Alabaster Hyena
        spell_id = 237287,
        from = {
            {
                itemname = "Reins of the Alabaster Hyena", type = 'vendor', npc_id = 135804, cost = 12500, faction = 'horde',
                repdiscount = 1, repid = 2158, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 864, expansion = "bfa",
                coordzone = 864, coordx = 56.6, coordy = 49.8, level = 10, 
            },
        },
    },
		[161664] = { -- Spectral Pterrorwing
        spell_id = 244712,
        from = {
            {
                itemname = "Reins of the Spectral Pterrorwing", type = 'vendor', npc_id = 131287, cost = 90000, faction = 'horde',
                repdiscount = 1, repid = 2103, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 58.3, coordy = 44.4, level = 10, 
            },
        },
    },
		[161665] = { -- Cobalt Pterrordax
        spell_id = 275837,
        from = {
            {
                itemname = "Reins of the Cobalt Pterrordax", type = 'vendor', npc_id = 131287, cost = 12500, faction = 'horde',
                repdiscount = 1, repid = 2103, reprequired = 1,
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 58.3, coordy = 44.4, level = 10, 
            },
        },
    },
		[174754] = { -- Wastewander Skyterror
        spell_id = 316276,
        from = {
            {
                itemname = "Wastewander Skyterror", type = 'vendor', npc_id = 160714, cost = 24000,
                repdiscount = 1, repid = 2417, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 1527, expansion = "bfa",
                coordzone = 1527, coordx = 55, coordy = 32.8, level = 10, 
            },
        },
    },
		[168829] = { -- Rustbolt Resistor
        spell_id = 299170,
        from = {
            {
                itemname = "Rustbolt Resistor", type = 'vendor', npc_id = 150716, cost = 524288,
                repdiscount = 1, repid = 2391, reprequired = 1,
                continent = "kultiras", for_sort = 9, zone_id = 1462, expansion = "bfa",
                coordzone = 1462, coordx = 73.6, coordy = 36.6, level = 10, 
            },
        },
    },
		[167170] = { -- Unshackled Waveray
        spell_id = 291538,
        from = {
            {
                itemname = "Unshackled Waveray", type = 'vendor', npc_id = 153512, cost = 250, currency = "prismaticmanapearls", faction = 'horde',
                repdiscount = 0, repid = 2373, reprequired = 1,
                continent = "nazjatar", for_sort = 13, zone_id = 1355, expansion = "bfa",
                coordzone = 1355, coordx = 49, coordy = 62.2, level = 10, 
            },
        },
    },
		[167167] = { -- Ankoan Waveray
        spell_id = 292407,
        from = {
            {
                itemname = "Ankoan Waveray", type = 'vendor', npc_id = 153509, cost = 250, currency = "prismaticmanapearls", faction = 'alliance',
                repdiscount = 0, repid = 2400, reprequired = 1,
                continent = "nazjatar", for_sort = 13, zone_id = 1355, expansion = "bfa",
                coordzone = 1355, coordx = 37.8, coordy = 55.6, level = 10, 
            },
        },
    },
		[152794] = { -- Amethyst Ruinstrider
        spell_id = 253004,
        from = {
            {
                itemname = "Reins of the Amethyst Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[152797] = { -- Cerulean Ruinstrider
        spell_id = 253007,
        from = {
            {
                itemname = "Reins of the Cerulean Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[152795] = { -- Beryl Ruinstrider
        spell_id = 253005,
        from = {
            {
                itemname = "Reins of the Beryl Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[152793] = { -- Russet Ruinstrider
        spell_id = 253006,
        from = {
            {
                itemname = "Reins of the Russet Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[152791] = { -- Sable Ruinstrider
        spell_id = 242305,
        from = {
            {
                itemname = "Reins of the Sable Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[152796] = { -- Umber Ruinstrider
        spell_id = 253008,
        from = {
            {
                itemname = "Reins of the Umber Ruinstrider", type = 'vendor', npc_id = 127151, cost = 10000,
                repdiscount = 1, repid = 2170, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 68.1, coordy = 56.8, level = 10, 
            },
        },
    },
		[138811] = { -- Brinedeep Bottom-Feeder
        spell_id = 214791,
        from = {
            {
                itemname = "Brinedeep Bottom-Feeder", type = 'vendor', npc_id = 108825, cost = 100, currency = "drownedmana",
                repdiscount = 0, repid = 1975, reprequired = 1, replevel = "8",
                continent = "brokenisles", for_sort = 8, zone_id = 627, expansion = "legion",
                coordzone = 619, coordx = 44.68, coordy = 61.97, level = 35 
            },
        },
    },
		[152788] = { -- Lightforged Warframe
        spell_id = 239013,
        from = {
            {
                itemname = "Lightforged Warframe", type = 'vendor', npc_id = 127120, cost = 625000,
                repdiscount = 1, repid = 2165, reprequired = 1,
                continent = "brokenisles", for_sort = 8, zone_id = 831, expansion = "legion",
                coordzone = 831, coordx = 43.3, coordy = 74.4, level = 45, 
            },
        },
    },
		[128481] = { -- Bristling Hellboar
        spell_id = 190690,
        from = {
            {
                itemname = "Bristling Hellboar", type = 'vendor', npc_id = 92805, cost = 5000, currency = "blackfangclaw",
                repdiscount = 0, repid = 1850, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 55.2, coordy = 74.8, level = 17, 
            },
        },
    },
		[116671] = { -- Wild Goretusk
        spell_id = 171633,
        from = {
            {
                itemname = "Wild Goretusk", type = 'vendor', npc_id = 92805, cost = 1000, currency = "blackfangclaw",
                repdiscount = 0, repid = 1850, reprequired = 1, replevel = 6,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 55.2, coordy = 74.8, level = 17, 
            },
        },
    },
		[128527] = { -- Deathtusk Felboar Alliance
        spell_id = 190977,
        from = {
            {
                itemname = "Deathtusk Felboar", type = 'vendor', npc_id = 90974, cost = 2500, faction = 'alliance',
                repdiscount = 1, repid = 1847, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 58.4, coordy = 60.4, level = 17, 
            },
        },
    },
		[128526] = { -- Deathtusk Felboar Horde
        spell_id = 190977,
        from = {
            {
                itemname = "Deathtusk Felboar", type = 'vendor', npc_id = 96014, cost = 2500, faction = 'horde',
                repdiscount = 1, repid = 1848, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 61.6, coordy = 45.6, level = 17, 
            },
        },
    },
		[116772] = { -- Shadowmane Charger Alliance
        spell_id = 171829,
        from = {
            {
                itemname = "Shadowmane Charger", type = 'vendor', npc_id = 85946, cost = 5000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1515, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 588, expansion = "wod",
                coordzone = 588, coordx = 44.8, coordy = 75, level = 17, 
            },
            {
                itemname = "Shadowmane Charger", type = 'vendor', npc_id = 86037, cost = 5000, currency = "apexiscrystal", faction = "horde",
                repdiscount = 0, repid = 1515, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 624, expansion = "wod",
                coordzone = 624, coordx = 53.6, coordy = 60.2, level = 17, 
            },
        },
    },
		[116664] = { -- Dusty Rockhide
        spell_id = 171625,
        from = {
            {
                itemname = "Dusty Rockhide", type = 'vendor', npc_id = 85932, cost = 5000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1731, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 588, expansion = "wod",
                coordzone = 588, coordx = 46.6, coordy = 76.2, level = 17, 
            },
        },
    },
		[116785] = { -- Swift Frostwolf
        spell_id = 171842,
        from = {
            {
                itemname = "Swift Frostwolf", type = 'vendor', npc_id = 86036, cost = 5000, currency = "apexiscrystal", faction = "horde",
                repdiscount = 0, repid = 1445, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 624, expansion = "wod",
                coordzone = 624, coordx = 53.6, coordy = 62, level = 17, 
            },
        },
    },
		[116782] = { -- Ironside Warwolf
        spell_id = 171839,
        from = {
            {
                itemname = "Ironside Warwolf", type = 'vendor', npc_id = 86698, cost = 5000, currency = "apexiscrystal", faction = "horde",
                repdiscount = 0, repid = 1708, reprequired = 1, cond = "tradingpost",
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 51.6, coordy = 61.6, level = 17, 
            },
        },
    },
		[123974] = { -- Corrupted Dreadwing Alliance
        spell_id = 183117,
        from = {
            {
                itemname = "Reins of the Corrupted Dreadwing", type = 'vendor', npc_id = 95424, cost = 150000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1849, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 57.8, coordy = 59.4, level = 40, 
            },
        },
    },
		[123974] = { -- Corrupted Dreadwing Horde
        spell_id = 183117,
        from = {
            {
                itemname = "Reins of the Corrupted Dreadwing", type = 'vendor', npc_id = 95424, cost = 150000, currency = "apexiscrystal", faction = "horde",
                repdiscount = 0, repid = 1849, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 534, expansion = "wod",
                coordzone = 534, coordx = 60.4, coordy = 46.6, level = 40, 
            },
        },
    },
		[116665] = { -- Armored Irontusk
        spell_id = 171626,
        from = {
            {
                itemname = "Armored Irontusk", type = 'vendor', npc_id = 85427, cost = 5000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1710, reprequired = 1, cond = "tradingpost",
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 52.6, coordy = 44, level = 17, 
            },
        },
    },
		[116672] = { -- Domesticated Razorback Alliance
        spell_id = 171634,
        from = {
            {
                itemname = "Domesticated Razorback", type = 'vendor', npc_id = 88482, cost = 5000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1711, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 588, expansion = "wod",
                coordzone = 588, coordx = 43.2, coordy = 77.6, level = 17, 
            },
            {
                itemname = "Domesticated Razorback", type = 'vendor', npc_id = 88493, cost = 5000, currency = "apexiscrystal", faction = "alliance",
                repdiscount = 0, repid = 1711, reprequired = 1,
                continent = "draenor", for_sort = 7, zone_id = 624, expansion = "wod",
                coordzone = 624, coordx = 53.8, coordy = 60.8, level = 17, 
            },
        },
    },
		[168830] = { -- Aerial Unit R-21/X
        spell_id = 290718,
        from = {
            {
                itemname = "Aerial Unit R-21/X", type = 'dungeon', subtype = 'mythic', npc_id = 150397, cond = "hardmode",
                continent = "kultiras", for_sort = 9, zone_id = 1490, expansion = "bfa", instanceid = 2097,
                coordzone = 1462, coordx = 72.4, coordy = 36.5, level = 50,
            },
        },
    },
		[168826] = { -- Mechagon Peacekeeper
        spell_id = 299158,
        from = {
            {
                itemname = "Mechagon Peacekeeper", type = 'dungeon', subtype = 'mythic', npc_id = 150190,
                continent = "kultiras", for_sort = 9, zone_id = 1490, expansion = "bfa", instanceid = 2097,
                coordzone = 1462, coordx = 72.4, coordy = 36.5, level = 50, 
            },
        },
    },
		[168370] = { -- Junkheap Drifter
        spell_id = 297157,
        from = {
            {
                itemname = "Rusted Keys to the Junkheap Drifter", type = 'world', quest_id = 55811, npc_id = 152182,
                continent = "kultiras", for_sort = 9, zone_id = 1462, expansion = "bfa",
                coordzone = 1462, coordx = 65.6, coordy = 79.6, level = 50,  coordzone = 1462,
            },
        },
    },
		[168823] = { -- Rusty Mechanocrawler
        spell_id = 291492,
        from = {
            {
                itemname = "Rusty Mechanocrawler", type = 'world', quest_id = 55512, npc_id = 151934,
                continent = "kultiras", for_sort = 9, zone_id = 1462, expansion = "bfa",
                coordzone = 1462, coordx = 53.6, coordy = 40.8, level = 50, 
            },
        },
    },
		[169163] = { -- Silent Glider
        spell_id = 300149,
        from = {
            {
                itemname = "Silent Glider", type = 'world', quest_id = 56298, npc_id = 152290,
                continent = "nazjatar", for_sort = 13, zone_id = 1355, expansion = "bfa",
                coordzone = 1355, coordx = 57.6, coordy = 51.8, level = 50,
            },
        },
    },
		[85430] = { -- Reins of the Azure Cloud Serpent
        spell_id = 123992,
        from = {
            {
                itemname = "Reins of the Azure Cloud Serpent", type = 'vendor', npc_id = 58414, cost = 3000, cond = "goldorquestreward",
                repdiscount = 0, repid = 1271, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 371, expansion = "mop",
                coordzone = 371, coordx = 56.6, coordy = 44.4, level = 35, 
            },
        },
    },
		[85429] = { -- Reins of the Golden Cloud Serpent
        spell_id = 123993,
        from = {
            {
                itemname = "Reins of the Golden Cloud Serpent", type = 'vendor', npc_id = 58414, cost = 3000, cond = "goldorquestreward",
                repdiscount = 0, repid = 1271, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 371, expansion = "mop",
                coordzone = 371, coordx = 56.6, coordy = 44.4, level = 35, 
            },
        },
    },
		[79802] = { -- Reins of the Jade Cloud Serpent
        spell_id = 113199,
        from = {
            {
                itemname = "Reins of the Jade Cloud Serpent", type = 'vendor', npc_id = 58414, cost = 3000, cond = "goldorquestreward",
                repdiscount = 0, repid = 1271, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 371, expansion = "mop",
                coordzone = 371, coordx = 56.6, coordy = 44.4, level = 35, 
            },
        },
    },
		[87781] = { -- Reins of the Azure Riding Crane
        spell_id = 127174,
        from = {
            {
                itemname = "Reins of the Azure Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 84.2, coordy = 62.6, level = 35, faction = "alliance",
            },
            {
                itemname = "Reins of the Azure Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 63, coordy = 22.2, level = 35, faction = "horde",
            },
        },
    },
		[87782] = { -- Reins of the Golden Riding Crane Alliance
        spell_id = 127176,
        from = {
            {
                itemname = "Reins of the Golden Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 84.2, coordy = 62.6, level = 35, faction = "alliance",
            },
            {
                itemname = "Reins of the Golden Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 63, coordy = 22.2, level = 35, faction = "horde",
            },
        },
    },
		[87783] = { -- Reins of the Regal Riding Crane Alliance
        spell_id = 127177,
        from = {
            {
                itemname = "Reins of the Regal Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 84.2, coordy = 62.6, level = 35, faction = "alliance",
            },
            {
                itemname = "Reins of the Regal Riding Crane", type = 'vendor', npc_id = 59908, cost = 500,
                repdiscount = 1, repid = 1269, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 63, coordy = 22.2, level = 35, faction = "horde",
            },
        },
    },
		[89307] = { -- Blue Shado-Pan Riding Tiger
        spell_id = 129934,
        from = {
            {
                itemname = "Reins of the Blue Shado-Pan Riding Tiger", type = 'vendor', npc_id = 64595, cost = 500,
                repdiscount = 1, repid = 1270, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 48.8, coordy = 70.6, level = 35,
            },
        },
    },
		[89306] = { -- Red Shado-Pan Riding Tiger
        spell_id = 129935,
        from = {
            {
                itemname = "Reins of the Red Shado-Pan Riding Tiger", type = 'vendor', npc_id = 64595, cost = 500,
                repdiscount = 1, repid = 1270, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 48.8, coordy = 70.6, level = 35,
            },
        },
    },
		[89305] = { -- Green Shado-Pan Riding Tiger
        spell_id = 129932,
        from = {
            {
                itemname = "Reins of the Green Shado-Pan Riding Tiger", type = 'vendor', npc_id = 64595, cost = 500,
                repdiscount = 1, repid = 1270, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 48.8, coordy = 70.6, level = 35,
            },
        },
    },
		[89391] = { -- Black Riding Goat
        spell_id = 130138,
        from = {
            {
                itemname = "Reins of the Black Riding Goat", type = 'vendor', npc_id = 58706, cost = 500,
                repdiscount = 1, repid = 1272, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 53.2, coordy = 51.8, level = 32, 
            },
        },
    },
		[89362] = { -- Brown Riding Goat
        spell_id = 130086,
        from = {
            {
                itemname = "Reins of the Brown Riding Goat", type = 'vendor', npc_id = 58706, cost = 1500,
                repdiscount = 1, repid = 1272, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 53.2, coordy = 51.8, level = 32, 
            },
        },
    },
		[89390] = { -- White Riding Goat
        spell_id = 130137,
        from = {
            {
                itemname = "Reins of the White Riding Goat", type = 'vendor', npc_id = 58706, cost = 3250,
                repdiscount = 1, repid = 1272, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                coordzone = 376, coordx = 53.2, coordy = 51.8, level = 32, 
            },
        },
    },
		[93169] = { -- Grand Armored Wyvern
        spell_id = 135418,
        from = {
            {
                itemname = "Grand Armored Wyvern", type = 'vendor', npc_id = 69060, cost = 2000, faction = "horde",
                repdiscount = 0, repid = 1375, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 418, expansion = "mop",
                coordzone = 418, coordx = 10.8, coordy = 53.4, level = 30, 
            },
        },
    },
		[95564] = { -- Golden Primal Direhorn
        spell_id = 140249,
        from = {
            {
                itemname = "Reins of the Golden Primal Direhorn", type = 'vendor', npc_id = 68000, cost = 3000, faction = "alliance",
                repdiscount = 1, repid = 1387, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 504, expansion = "mop",
                coordzone = 504, coordx = 64.6, coordy = 74.6, level = 32, 
            },
        },
    },
		[87774] = { -- Heavenly Golden Cloud Serpent
        spell_id = 127164,
        from = {
            {
                itemname = "Reins of the Heavenly Golden Cloud Serpent", type = 'vendor', npc_id = 73306, cost = 100000, currency = "timelesscoin",
                repdiscount = 0, repid = 1492, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 554, expansion = "mop",
                coordzone = 554, coordx = 42.8, coordy = 54.8, level = 35, 
            },
        },
    },
		[87791] = { -- Crimson Water Strider
        spell_id = 127271,
        from = {
            {
                itemname = "Reins of the Crimson Water Strider", type = 'vendor', npc_id = 85984, cost = 100, currency = "natluckycoin", faction = "alliance",
                repdiscount = 0, repid = 1358, reprequired = 1, replevel = "8",
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "mop",
                coordzone = 582, coordx = 53.8, coordy = 15.2, level = 35, 
            },
            {
                itemname = "Reins of the Crimson Water Strider", type = 'vendor', npc_id = 85984, cost = 100, currency = "natluckycoin", faction = "horde",
                repdiscount = 0, repid = 1358, reprequired = 1, replevel = "8",
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 38, coordy = 71.2, level = 35, 
            },
        },
    },
		[93168] = { -- Grand Armored Gryphon
        spell_id = 135416,
        from = {
            {
                itemname = "Grand Armored Gryphon", type = 'vendor', npc_id = 69059, cost = 2000, faction = "alliance",
                repdiscount = 0, repid = 1376, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 418, expansion = "mop",
                coordzone = 418, coordx = 89.6, coordy = 33.4, level = 30, 
            },
        },
    },
		[95565] = { -- Crimson Primal Direhorn
        spell_id = 140250,
        from = {
            {
                itemname = "Reins of the Crimson Primal Direhorn", type = 'vendor', npc_id = 67672, cost = 3000, faction = "horde",
                repdiscount = 1, repid = 1388, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 504, expansion = "mop",
                coordzone = 504, coordx = 33.4, coordy = 32.4, level = 32, 
            },
        },
    },
		[81354] = { -- Azure Water Strider
        spell_id = 118089,
        from = {
            {
                itemname = "Reins of the Azure Water Strider", type = 'vendor', npc_id = 63721, cost = 1000,
                repdiscount = 1, repid = 1302, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 418, expansion = "mop",
                coordzone = 418, coordx = 68.4, coordy = 43.4, level = 35, 
            },
        },
    },
		[89304] = { -- Thundering August Cloud Serpent Alliance
        spell_id = 129918,
        from = {
            {
                itemname = "Reins of the Thundering August Cloud Serpent", type = 'vendor', npc_id = 64032, cost = 10000, faction = "alliance",
                repdiscount = 1, repid = 1341, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 390, expansion = "mop",
                coordzone = 390, coordx = 84.6, coordy = 63.6, level = 35, 
            },
            {
                itemname = "Reins of the Thundering August Cloud Serpent", type = 'vendor', npc_id = 64001, cost = 10000, faction = "horde",
                repdiscount = 1, repid = 1341, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 390, expansion = "mop",
                coordzone = 390, coordx = 62.6, coordy = 23.2, level = 35, 
            },
        },
    },
		[85262] = { -- Amber Scorpion
        spell_id = 123886,
        from = {
            {
                itemname = "Reins of the Amber Scorpion", type = 'vendor', npc_id = 64599, cost = 10000,
                repdiscount = 1, repid = 1337, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 422, expansion = "mop",
                coordzone = 422, coordx = 55, coordy = 35.6, level = 27, 
            },
        },
    },
		[89363] = { -- Red Flying Cloud
        spell_id = 130092,
        from = {
            {
                itemname = "Disc of the Red Flying Cloud", type = 'vendor', npc_id = 64605, cost = 600,
                repdiscount = 1, repid = 1345, reprequired = 1,
                continent = "pandaria", for_sort = 6, zone_id = 390, expansion = "mop",
                coordzone = 390, coordx = 82.2, coordy = 29.4, level = 25, 
            },
        },
    },
		[63044] = { -- Brown Riding Camel
        spell_id = 88748,
        from = {
            {
                itemname = "Reins of the Brown Riding Camel", type = 'vendor', npc_id = 48617, cost = 100,
                repdiscount = 1, repid = 1173, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 249, expansion = "cata",
                coordzone = 249, coordx = 54, coordy = 33.2, level = 17, 
            },
        },
    },
		[63045] = { -- Tan Riding Camel
        spell_id = 88749,
        from = {
            {
                itemname = "Reins of the Tan Riding Camel", type = 'vendor', npc_id = 48617, cost = 100,
                repdiscount = 1, repid = 1173, reprequired = 1,
                continent = "kalimdor", for_sort = 2, zone_id = 249, expansion = "cata",
                coordzone = 249, coordx = 54, coordy = 33.2, level = 17, 
            },
        },
    },
		[43961] = { -- Grand Ice Mammoth Alliance
        spell_id = 61470,
        from = {
            {
                itemname = "Reins of the Grand Ice Mammoth", type = 'vendor', npc_id = 32540, cost = 10000, faction = "alliance",
                repdiscount = 1, repid = 1119, reprequired = 1,
                continent = "northrend", for_sort = 4, zone_id = 120, expansion = "wotlk",
                coordzone = 120, coordx = 66, coordy = 61.4, level = 17, 
            },
        },
    },
		[44086] = { -- Grand Ice Mammoth Horde
        spell_id = 61469,
        from = {
            {
                itemname = "Reins of the Grand Ice Mammoth", type = 'vendor', npc_id = 32540, cost = 10000, faction = "horde",
                repdiscount = 1, repid = 1119, reprequired = 1,
                continent = "northrend", for_sort = 4, zone_id = 120, expansion = "wotlk",
                coordzone = 120, coordx = 66, coordy = 61.4, level = 17, 
            },
        },
    },
		[43958] = { -- Ice Mammoth Alliance
        spell_id = 59799,
        from = {
            {
                itemname = "Reins of the Ice Mammoth", type = 'vendor', npc_id = 32540, cost = 2500, faction = "alliance",
                repdiscount = 1, repid = 1119, reprequired = 1, replevel = 7,
                continent = "northrend", for_sort = 4, zone_id = 120, expansion = "wotlk",
                coordzone = 120, coordx = 66, coordy = 61.4, level = 17, 
            },
        },
    },
		[44080] = { -- Ice Mammoth Horde
        spell_id = 59797,
        from = {
            {
                itemname = "Reins of the Ice Mammoth", type = 'vendor', npc_id = 32540, cost = 2500, faction = "horde",
                repdiscount = 1, repid = 1119, reprequired = 1, replevel = 7,
                continent = "northrend", for_sort = 4, zone_id = 120, expansion = "wotlk",
                coordzone = 120, coordx = 66, coordy = 61.4, level = 17, 
            },
        },
    },
		[44707] = { -- Green Proto-Drake
        spell_id = 61294,
        from = {
            {
                itemname = "Reins of the Green Proto-Drake", type = 'vendor', npc_id = 31910, cost = 1, currency = "mysteriousegg",
                repdiscount = 0, repid = 1105, reprequired = 1, replevel = 7,
                continent = "northrend", for_sort = 4, zone_id = 119, expansion = "wotlk",
                coordzone = 119, coordx = 54.6, coordy = 56.2, level = 27, 
            },
        },
    },
		[43955] = { -- Red Drake
        spell_id = 59570,
        from = {
            {
                itemname = "Reins of the Red Drake", type = 'vendor', npc_id = 32533, cost = 2000,
                repdiscount = 1, repid = 1091, reprequired = 1,
                continent = "northrend", for_sort = 4, zone_id = 115, expansion = "wotlk",
                coordzone = 115, coordx = 59.8, coordy = 53, level = 27, 
            },
        },
    },
		[31830] = { -- Cobalt Riding Talbuk Alliance
        spell_id = 39315,
        from = {
            {
                itemname = "Reins of the Cobalt Riding Talbuk", type = 'vendor', npc_id = 20240, cost = 70, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[31829] = { -- Cobalt Riding Talbuk Horde
        spell_id = 39315,
        from = {
            {
                itemname = "Reins of the Cobalt Riding Talbuk", type = 'vendor', npc_id = 20241, cost = 70, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[29227] = { -- Cobalt War Talbuk Alliance
        spell_id = 34896,
        from = {
            {
                itemname = "Reins of the Cobalt War Talbuk", type = 'vendor', npc_id = 20240, cost = 100, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[29102] = { -- Cobalt War Talbuk Horde
        spell_id = 34896,
        from = {
            {
                itemname = "Reins of the Cobalt War Talbuk", type = 'vendor', npc_id = 20241, cost = 100, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[31832] = { -- Silver Riding Talbuk Alliance
        spell_id = 39317,
        from = {
            {
                itemname = "Reins of the Silver Riding Talbuk", type = 'vendor', npc_id = 20240, cost = 70, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[31831] = { -- Silver Riding Talbuk Horde
        spell_id = 39317,
        from = {
            {
                itemname = "Reins of the Silver Riding Talbuk", type = 'vendor', npc_id = 20241, cost = 70, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[29229] = { -- Silver War Talbuk Alliance
        spell_id = 34898,
        from = {
            {
                itemname = "Reins of the Silver War Talbuk", type = 'vendor', npc_id = 20240, cost = 100, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[29104] = { -- Silver War Talbuk Horde
        spell_id = 34898,
        from = {
            {
                itemname = "Reins of the Silver War Talbuk", type = 'vendor', npc_id = 20241, cost = 100, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[31834] = { -- Tan Riding Talbuk Alliance
        spell_id = 39318,
        from = {
            {
                itemname = "Reins of the Tan Riding Talbuk", type = 'vendor', npc_id = 20240, cost = 70, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[31833] = { -- Tan Riding Talbuk Horde
        spell_id = 39318,
        from = {
            {
                itemname = "Reins of the Tan Riding Talbuk", type = 'vendor', npc_id = 20241, cost = 70, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[29230] = { -- Tan War Talbuk Alliance
        spell_id = 34899,
        from = {
            {
                itemname = "Reins of the Tan War Talbuk", type = 'vendor', npc_id = 20240, cost = 100, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[29105] = { -- Tan War Talbuk Horde
        spell_id = 34899,
        from = {
            {
                itemname = "Reins of the Tan War Talbuk", type = 'vendor', npc_id = 20241, cost = 100, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[31836] = { -- White Riding Talbuk Alliance
        spell_id = 39319,
        from = {
            {
                itemname = "Reins of the White Riding Talbuk", type = 'vendor', npc_id = 20240, cost = 70, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[31835] = { -- White Riding Talbuk Horde
        spell_id = 39319,
        from = {
            {
                itemname = "Reins of the White Riding Talbuk", type = 'vendor', npc_id = 20241, cost = 70, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[29231] = { -- White War Talbuk Alliance
        spell_id = 34897,
        from = {
            {
                itemname = "Reins of the White War Talbuk", type = 'vendor', npc_id = 20240, cost = 100, faction = "alliance",
                repdiscount = 1, repid = 978, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 54.6, coordy = 75, level = 17, 
            },
        },
    },
		[29103] = { -- White War Talbuk Horde
        spell_id = 34897,
        from = {
            {
                itemname = "Reins of the White War Talbuk", type = 'vendor', npc_id = 20241, cost = 100, faction = "horde",
                repdiscount = 1, repid = 941, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 107, expansion = "bc",
                coordzone = 107, coordx = 53.4, coordy = 36.8, level = 17, 
            },
        },
    },
		[32858] = { -- Azure Netherwing Drake
        spell_id = 41514,
        from = {
            {
                itemname = "Reins of the Azure Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32859] = { -- Cobalt Netherwing Drake
        spell_id = 41515,
        from = {
            {
                itemname = "Reins of the Cobalt Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32857] = { -- Onyx Netherwing Drake
        spell_id = 41513,
        from = {
            {
                itemname = "Reins of the Onyx Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32860] = { -- Purple Netherwing Drake
        spell_id = 41516,
        from = {
            {
                itemname = "Reins of the Purple Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32861] = { -- Veridian Netherwing Drake
        spell_id = 41517,
        from = {
            {
                itemname = "Reins of the Veridian Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32862] = { -- Violet Netherwing Drake
        spell_id = 41518,
        from = {
            {
                itemname = "Reins of the Violet Netherwing Drake", type = 'vendor', npc_id = 23489, cost = 200,
                repdiscount = 0, repid = 1015, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 104, expansion = "bc",
                coordzone = 104, coordx = 65.6, coordy = 86, level = 27, 
            },
        },
    },
		[32319] = { -- Blue Riding Nether Ray
        spell_id = 39803,
        from = {
            {
                itemname = "Blue Riding Nether Ray", type = 'vendor', npc_id = 23367, cost = 200,
                repdiscount = 1, repid = 1031, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 108, expansion = "bc",
                coordzone = 108, coordx = 64.2, coordy = 66.2, level = 27, 
            },
        },
    },
		[32314] = { -- Green Riding Nether Ray
        spell_id = 39798,
        from = {
            {
                itemname = "Green Riding Nether Ray", type = 'vendor', npc_id = 23367, cost = 200,
                repdiscount = 1, repid = 1031, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 108, expansion = "bc",
                coordzone = 108, coordx = 64.2, coordy = 66.2, level = 27,  
            },
        },
    },
		[32316] = { -- Purple Riding Nether Ray
        spell_id = 39801,
        from = {
            {
                itemname = "Purple Riding Nether Ray", type = 'vendor', npc_id = 23367, cost = 200,
                repdiscount = 1, repid = 1031, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 108, expansion = "bc",
                coordzone = 108, coordx = 64.2, coordy = 66.2, level = 27, 
            },
        },
    },
		[32317] = { -- Red Riding Nether Ray
        spell_id = 39800,
        from = {
            {
                itemname = "Red Riding Nether Ray", type = 'vendor', npc_id = 23367, cost = 200,
                repdiscount = 1, repid = 1031, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 108, expansion = "bc",
                coordzone = 108, coordx = 64.2, coordy = 66.2, level = 27, 
            },
        },
    },
		[32318] = { -- Silver Riding Nether Ray
        spell_id = 39802,
        from = {
            {
                itemname = "Silver Riding Nether Ray", type = 'vendor', npc_id = 23367, cost = 200,
                repdiscount = 1, repid = 1031, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 108, expansion = "bc",
                coordzone = 108, coordx = 64.2, coordy = 66.2, level = 27, 
            },
        },
    },
		[33999] = { -- Cenarion War Hippogryph
        spell_id = 43927,
        from = {
            {
                itemname = "Cenarion War Hippogryph", type = 'vendor', npc_id = 17904, cost = 2000,
                repdiscount = 1, repid = 942, reprequired = 1,
                continent = "outland", for_sort = 3, zone_id = 102, expansion = "bc",
                coordzone = 102, coordx = 79.2, coordy = 63.8, level = 27, 
            },
        },
    },
		[166436] = { -- Sandy Nightsaber Alliance
        spell_id = 288506,
        from = {
            {
                itemname = "Sandy Nightsaber", type = 'vendor', npc_id = 148927, cost = 350, currency = "7thlegionservicemedal",
                repdiscount = 0, repid = 2159, reprequired = 0, faction = "alliance",
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 66.9, coordy = 25.8, level = 10, 
            },
        },
    },
		[174373] = { -- Sandy Nightsaber Horde
        spell_id = 288506,
        from = {
            {
                itemname = "Sandy Nightsaber", type = 'vendor', npc_id = 148924, cost = 350, currency = "honorboundservicemedal",
                repdiscount = 0, repid = 2157, reprequired = 0, faction = "horde",
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 51.2, coordy = 95.2, level = 10, 
            },
        },
    },
		[166463] = { -- Priestess' Moonsaber Alliance
        spell_id = 288740,
        from = {
            {
                itemname = "Priestess' Moonsaber", type = 'vendor', npc_id = 148927, cost = 750, currency = "7thlegionservicemedal",
                repdiscount = 0, repid = 2159, reprequired = 0, faction = "alliance",
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 66.9, coordy = 25.8, level = 10, 
            },
        },
    },
		[166469] = { -- Bloodthirsty Dreadwing Horde
        spell_id = 288714,
        from = {
            {
                itemname = "Bloodthirsty Dreadwing", type = 'vendor', npc_id = 148924, cost = 750, currency = "honorboundservicemedal",
                repdiscount = 0, repid = 2157, reprequired = 0, faction = "horde",
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 51.2, coordy = 95.2, level = 10, 
            },
        },
    },
		[166465] = { -- Azureshell Krolusk Alliance
        spell_id = 288736,
        from = {
            {
                itemname = "Azureshell Krolusk", type = 'vendor', npc_id = 148927, cost = 200, currency = "7thlegionservicemedal",
                repdiscount = 0, repid = 2159, reprequired = 0, faction = "alliance",
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 66.9, coordy = 25.8, level = 10, 
            },
        },
    },
		[166464] = { -- Rubyshell Krolusk Horde
        spell_id = 288735,
        from = {
            {
                itemname = "Rubyshell Krolusk", type = 'vendor', npc_id = 148924, cost = 200, currency = "honorboundservicemedal",
                repdiscount = 0, repid = 2157, reprequired = 0, faction = "horde",
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 51.2, coordy = 95.2, level = 10, 
            },
        },
    },
		[163589] = { -- Palehide Direhorn
        spell_id = 279474,
        from = {
            {
                itemname = "Reins of the Palehide Direhorn", type = 'vendor', npc_id = 142691, mount_id = 1179,-- cost = 500000,
                repdiscount = 0, repid = 2160, reprequired = 0, faction = "alliance",
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 56.7, coordy = 47, level = 45, 
            },
			{
                itemname = "Reins of the Palehide Direhorn", type = 'vendor', npc_id = 125879, mount_id = 1179,-- cost = 500000,
                repdiscount = 0, repid = 2103, reprequired = 0, faction = "horde",
                continent = "zandalar", for_sort = 10, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 48.6, coordy = 87, level = 45, 
            },
        },
    },
	[147807] = { -- Highmountain Elderhorn
        spell_id = 242874,
        from = {
            {
                itemname = "Highmountain Elderhorn", type = 'paragon', npc_id = 106902,
                continent = "brokenisles", for_sort = 8, zone_id = 650, expansion = "legion",
                coordzone = 650, coordx = 46, coordy = 61, level = 45, 
            },
        },
    },
	[147805] = { -- Valarjar Stormwing
        spell_id = 242882,
        from = {
            {
                itemname = "Valarjar Stormwing", type = 'paragon', npc_id = 106904,
                continent = "brokenisles", for_sort = 8, zone_id = 634, expansion = "legion",
                coordzone = 634, coordx = 60.2, coordy = 51.2, level = 45, 
            },
        },
    },
	[147806] = { -- Cloudwing Hippogryph
        spell_id = 242881,
        from = {
            {
                itemname = "Cloudwing Hippogryph", type = 'paragon', npc_id = 107376,
                continent = "brokenisles", for_sort = 8, zone_id = 630, expansion = "legion",
                coordzone = 630, coordx = 46.8, coordy = 41.4, level = 45, 
            },
        },
    },
	[147804] = { -- Wild Dreamrunner
        spell_id = 242875,
        from = {
            {
                itemname = "Wild Dreamrunner", type = 'paragon', npc_id = 106901,
                continent = "brokenisles", for_sort = 8, zone_id = 641, expansion = "legion",
                coordzone = 641, coordx = 54.6, coordy = 73.2, level = 45, 
            },
        },
    },
	[143764] = { -- Leywoven Flying Carpet
        spell_id = 233364,
        from = {
            {
                itemname = "Leywoven Flying Carpet", type = 'paragon', npc_id = 97140,
                continent = "brokenisles", for_sort = 8, zone_id = 680, expansion = "legion",
                coordzone = 680, coordx = 37, coordy = 46.2, level = 45, 
            },
        },
    },
	[153044] = { -- Avenging Felcrusher
        spell_id = 254259,
        from = {
            {
                itemname = "Avenging Felcrusher", type = 'paragon', npc_id = 127120,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 43.66, coordy = 73.71, level = 45, 
            },
        },
    },
	[153042] = { -- Glorious Felcrusher
        spell_id = 254069,
        from = {
            {
                itemname = "Glorious Felcrusher", type = 'paragon', npc_id = 127120,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 43.66, coordy = 73.71, level = 45, 
            },
        },
    },
	[153043] = { -- Blessed Felcrusher
        spell_id = 254258,
        from = {
            {
                itemname = "Blessed Felcrusher", type = 'paragon', npc_id = 127120,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 43.66, coordy = 73.71, level = 45, 
            },
        },
    },
	[169198] = { -- Royal Snapdragon 
        spell_id = 294038,
        from = {
            {
                itemname = "Royal Snapdragon", type = 'paragon', npc_id = 154140, faction = "alliance",
                continent = "nazjatar", for_sort = 13, zone_id = 1355, expansion = "bfa",
                coordzone = 1355, coordx = 38, coordy = 55.6, level = 50, 
            },
			{
                itemname = "Royal Snapdragon", type = 'paragon', npc_id = 154140, faction = "horde",
                continent = "nazjatar", for_sort = 13, zone_id = 1355, expansion = "bfa",
                coordzone = 1355, coordx = 38, coordy = 55.6, level = 50, 
            },
        },
    },
    [44168] = { -- Time-Lost Proto-Drake
        spell_id = 60002,
        from = {
            {
                itemname = "Reins of the Time-Lost Proto-Drake", type = 'rare', npc_id = 32491,
                continent = "northrend", for_sort = 4, zone_id = 120, expansion = "wotlk",
                coordzone = 120, coordx = 41.2, coordy = 68.2, level = 30, 
            },
        },
    },
    [63042] = { -- Phosphorescent Stone Drake
        spell_id = 88718,
        from = {
            {
                itemname = "Reins of the Phosphorescent Stone Drake", type = 'rare', npc_id = 50062,
                continent = "deepholm", for_sort = 5, zone_id = 207, expansion = "cata",
                coordzone = 207, coordx = 43.4, coordy = 60.4, level = 35, 
            },
        },
    },
    [67151] = { -- Subdued Seahorse
        spell_id = 98718,
        from = {
            {
                itemname = "Reins of Poseidus", type = 'rare', npc_id = 50005,
                continent = "easternkingdoms", for_sort = 1, zone_id = 205, expansion = "cata",
                coordzone = 205, coordx = 46.6, coordy = 49.2, level = 35, 
            },
        },
    },
	[90655] = { -- Thundering Ruby Cloud Serpent
        spell_id = 132036,
        from = {
            {
                itemname = "Reins of the Thundering Ruby Cloud Serpent", type = 'summoned',
                continent = "pandaria", for_sort = 6, zone_id = 376, expansion = "mop",
                level = 35, cond = 'skyshard',
            },
        },
    },
    [94230] = { -- Amber Primordial Direhorn
        spell_id = 138424,
        from = {
            {
                itemname = "Reins of the Amber Primordial Direhorn", type = 'rare', npc_id = 69841,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 36.6, coordy = 85.6, level = 35, 
            },
        },
    },
    [94231] = { -- Jade Primordial Direhorn
        spell_id = 138426,
        from = {
            {
                itemname = "Reins of the Jade Primordial Direhorn", type = 'rare', npc_id = 69841,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 36.6, coordy = 85.6, level = 35, 
            },
        },
    },
    [94229] = { -- Slate Primordial Direhorn
        spell_id = 138425,
        from = {
            {
                itemname = "Reins of the Slate Primordial Direhorn", type = 'rare', npc_id = 69841,
                continent = "pandaria", for_sort = 6, zone_id = 388, expansion = "mop",
                coordzone = 388, coordx = 36.6, coordy = 85.6, level = 35, 
            },
        },
    },
    [116794] = { -- Garn Nighthowl
        spell_id = 171851,
        from = {
            {
                itemname = "Garn Nighthowl", type = 'rare', npc_id = 81001,
                continent = "draenor", for_sort = 7, zone_id = 525, expansion = "wod",
                coordzone = 525, coordx = 13.6, coordy = 51, level = 40, 
            },
        },
    },
	[23720] = { -- Riding Turtle
        spell_id = 30174,
        from = {
            {
                itemname = "Riding Turtle", type = 'rare', npc_id = 85715, faction = "alliance",
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 51, coordy = 15, level = 40, cond = "garrisonfishing",
            },
			{
                itemname = "Riding Turtle", type = 'rare', npc_id = 81171, faction = "horde",
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 34, coordy = 72, level = 40, cond = "garrisonfishing",
            },
        },
    },
	[46109] = { -- Sea Turtle
        spell_id = 64731,
        from = {
            {
                itemname = "Sea Turtle", type = 'rare', npc_id = 85715, faction = "alliance",
                continent = "draenor", for_sort = 7, zone_id = 582, expansion = "wod",
                coordzone = 582, coordx = 51, coordy = 15, level = 40, cond = "garrisonfishing",
            },
			{
                itemname = "Sea Turtle", type = 'rare', npc_id = 81171, faction = "horde",
                continent = "draenor", for_sort = 7, zone_id = 590, expansion = "wod",
                coordzone = 590, coordx = 34, coordy = 72, level = 40, cond = "garrisonfishing",
            },
        },
    },
    [152904] = { -- Acid Belcher
        spell_id = 253662,
        from = {
            {
                itemname = "Acid Belcher", type = 'rare', npc_id = 126912, quest_id = 48721,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 50, coordy = 9.4, level = 45, 
            },
        },
    },
    [152790] = { -- Vile Fiend
        spell_id = 243652,
        from = {
            {
                itemname = "Vile Fiend", type = 'rare', npc_id = 127288, quest_id = 48821,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 63.8, coordy = 22, level = 45, 
            },
        },
    },
    [152905] = { -- Crimson Slavermaw
        spell_id = 253661,
        from = {
            {
                itemname = "Crimson Slavermaw", type = 'rare', npc_id = 122958, quest_id = 49183,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 61.8, coordy = 37.6, level = 45, 
            },
        },
    },
    [152903] = { -- Biletooth Gnasher
        spell_id = 253660,
        from = {
            {
                itemname = "Biletooth Gnasher", type = 'rare', npc_id = 126199, quest_id = 48810,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 53.2, coordy = 35.8, level = 45, 
            },
			{
                itemname = "Biletooth Gnasher", type = 'rare', npc_id = 126040, quest_id = 48809,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 65.5, coordy = 26.7, level = 45, 
            },
        },
    },
    [152814] = { -- Maddened Chaosrunner
        spell_id = 253058,
        from = {
            {
                itemname = "Maddened Chaosrunner", type = 'rare', npc_id = 126852, quest_id = 48695,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 55.7, coordy = 59.8, level = 45, 
            },
        },
    },
    [152844] = { -- Lambent Mana Ray
        spell_id = 253107,
        from = {
            {
                itemname = "Lambent Mana Ray", type = 'rare', npc_id = 126867, quest_id = 48705,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 33.8, coordy = 47.4, level = 45, 
            },
        },
    },
	[152840] = { -- Scintillating Mana Ray
        spell_id = 253109,
        from = {
            {
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48712, npc_id = 126898,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 44.1, coordy = 49.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48667, npc_id = 126419,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 70.4, coordy = 33.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48812, npc_id = 126208,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 33.6, coordy = 47.5, level = 45, cond = "felspottedegg",
            },
        },
    },
	[152841] = { -- Felglow Mana Ray
        spell_id = 253108,
        from = {
            {
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48712, npc_id = 126898,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 44.1, coordy = 49.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48667, npc_id = 126419,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 70.4, coordy = 33.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48812, npc_id = 126208,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 33.6, coordy = 47.5, level = 45, cond = "felspottedegg",
            },
        },
    },
	[152842] = { -- Vibrant Mana Ray
        spell_id = 253106,
        from = {
            {
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48712, npc_id = 126898,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 44.1, coordy = 49.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48667, npc_id = 126419,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 70.4, coordy = 33.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48812, npc_id = 126208,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 33.6, coordy = 47.5, level = 45, cond = "felspottedegg",
            },
        },
    },
	[152843] = { -- Darkspore Mana Ray
        spell_id = 235764,
        from = {
            {
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48712, npc_id = 126898,
                continent = "brokenisles", for_sort = 8, zone_id = 882, expansion = "legion",
                coordzone = 882, coordx = 44.1, coordy = 49.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48667, npc_id = 126419,
                continent = "brokenisles", for_sort = 8, zone_id = 830, expansion = "legion",
                coordzone = 830, coordx = 70.4, coordy = 33.7, level = 45, cond = "felspottedegg",
            },
			{
                itemname = "Fel-Spotted Egg", type = 'rare', quest_id = 48812, npc_id = 126208,
                continent = "brokenisles", for_sort = 8, zone_id = 885, expansion = "legion",
                coordzone = 885, coordx = 33.6, coordy = 47.5, level = 45, cond = "felspottedegg",
            },
        },
    },
    [94292] = { -- Black Primal Raptor
        spell_id = 138642,
        from = {
            {
                itemname = "Reins of the Black Primal Raptor", type = 'zone',
                continent = "pandaria", for_sort = 6, zone_id = 507 , expansion = "mop",
                level = 35, cond = "primalegg",
            },
        },
    },
    [94293] = { -- Green Primal Raptor
        spell_id = 138643,
        from = {
            {
                itemname = "Reins of the Green Primal Raptor", type = 'zone',
                continent = "pandaria", for_sort = 6, zone_id = 507, expansion = "mop",
                level = 35, cond = "primalegg",
            },
        },
    },
    [94291] = { -- Red Primal Raptor
        spell_id = 138641,
        from = {
            {
                itemname = "Reins of the Red Primal Raptor", type = 'zone',
                continent = "pandaria", for_sort = 6, zone_id = 507, expansion = "mop",
                level = 35, cond = "primalegg",
            },
        },
    },
	[133543] = { -- Infinite Timereaver
        spell_id = 201098,
        from = {
            {
                itemname = "Reins of the Infinite Timereaver", type = 'holiday', subtype = 'timewalking',
                continent = 'timewalking', for_sort = 12, zone_id = -3, expansion = "other",
				level = 50,
            },
        },
    },
	[141713] = { -- Arcadian War Turtle
        spell_id = 227956,
        from = {
            {
                itemname = "Arcadian War Turtle", type = 'vendor', npc_id = 107109, cost = 150, currency = "curiouscoin",
                continent = "brokenisles", for_sort = 8, zone_id = 627, expansion = "legion",
                coordzone = 627, coordx = 48.6, coordy = 14.6, level = 17, 
            },
        },
    },
	[166442] = { -- Blue Marsh Hopper
        spell_id = 288587,
        from = {
            {
                itemname = "Blue Marsh Hopper", type = 'vendor', npc_id = 148810, cost = 333333,
                continent = "zandalar", for_sort = 9, zone_id = 863, expansion = "bfa",
                coordzone = 863, coordx = 70.8, coordy = 56.6, level = 17, 
            },
        },
    },
	[166471] = { --Saltwater Seahorse
        spell_id = 288711,
        from = {
            {
                itemname = "Saltwater Seahorse", type = 'vendor', npc_id = 148922, cost = 500, faction = 'alliance', currency = 'seafarerdubloon',
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 66.05, coordy = 32.31, level = 17, 
            },
            {
                itemname = "Saltwater Seahorse", type = 'vendor', npc_id = 148923, cost = 500, faction = 'horde', currency = 'seafarerdubloon',
                continent = "kultiras", for_sort = 9, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 44.6, coordy = 94.4, level = 17, 
            },
        },
    },
	[166745] = { --Siltwing Albatross
        spell_id = 266925,
        from = {
            {
                itemname = "Siltwing Albatross", type = 'vendor', npc_id = 148922, cost = 1000, faction = 'alliance', currency = 'seafarerdubloon',
                continent = "kultiras", for_sort = 9, zone_id = 1161, expansion = "bfa",
                coordzone = 1161, coordx = 66.05, coordy = 32.31, level = 17, 
            },
            {
                itemname = "Siltwing Albatross", type = 'vendor', npc_id = 148923, cost = 1000, faction = 'horde', currency = 'seafarerdubloon',
                continent = "kultiras", for_sort = 9, zone_id = 1165, expansion = "bfa",
                coordzone = 1165, coordx = 44.6, coordy = 94.4, level = 17, 
            },
        },
    },
	[163183] = { -- Green Marsh Hopper
        spell_id = 259740,
        from = {
            {
                itemname = "Green Marsh Hopper", type = 'vendor', npc_id = 148810, cost = 333333,
                continent = "zandalar", for_sort = 9, zone_id = 863, expansion = "bfa",
                coordzone = 863, coordx = 70.8, coordy = 56.6, level = 17, 
            },
        },
    },
	[166443] = { -- Yellow Marsh Hopper
        spell_id = 288589,
        from = {
            {
                itemname = "Yellow Marsh Hopper", type = 'vendor', npc_id = 148810, cost = 333333,
                continent = "zandalar", for_sort = 9, zone_id = 863, expansion = "bfa",
                coordzone = 863, coordx = 70.8, coordy = 56.6, level = 17, 
            },
        },
    }, --Shadowlands Mounts
	[182650] = { -- Arboreal Gulper
        spell_id = 339632,
        from = {
            {
                itemname = 'Arboreal Gulper', type = 'rare', npc_id = 164112, quest_id = 59157,
                continent = 'shadowlands', for_sort = 14, zone_id = 1565, expansion = 'sl',
                coordzone = 1565, coordx = 32.48, coordy = 30.28, level = 60, 
            },
        },
    },
	[180727] = { -- Shimmermist Runner
        spell_id = 332252,
        from = {
            {
                itemname = 'Shimmermist Runner', type = 'treasure', customnpcName = '纱雾迷结',
                continent = 'shadowlands', for_sort = 14, zone_id = 1565, expansion = 'sl',
                coordzone = 1565, coordx = 26.56, coordy = 59.22, level = 60, 
            },
        },
    },
	[180748] = { -- Silky Shimmermoth
        spell_id = 318051,
        from = {
            {
                itemname = "Silky Shimmermoth", type = 'vendor', npc_id = 163714, cost = 5000, currency = 'anima', cond = 'ardenwealdsastage',
                continent = "shadowlands", for_sort = 14, zone_id = 1565, expansion = "sl",
                coordzone = 1565, coordx = 43, coordy = 47, level = 60, 
            },
        },
    },
	[180725] = { -- Spinemaw Gladechewer
        spell_id = 334364,
        from = {
            {
                itemname = "Spinemaw Gladechewer", type = 'rare', npc_id = 164107, quest_id = 59145,
                continent = "shadowlands", for_sort = 14, zone_id = 1565, expansion = "sl",
                coordzone = 1565, coordx = 26.45, coordy = 54.32, level = 60, 
            },
        },
    },
	[180728] = { -- Swift Gloomhoof
        spell_id = 312767,
        from = {
            {
                itemname = 'Swift Gloomhoof', type = 'rare', npc_id = 168135, cond = 'swiftgloomhoof', quest_id = 60306,
                continent = 'shadowlands', for_sort = 14, zone_id = 1565, expansion = 'sl',
                coordzone = 1565, coordx = 62.17, coordy = 52.18, level = 60, 
            },
        },
    },
	[180730] = { -- Wild Glimmerfur Prowler
        spell_id = 334366,
        from = {
            {
                itemname = "Wild Glimmerfur Prowler", type = 'rare', npc_id = 168647, cond = 'summonnightfae', quest_id = 61632,
                continent = "shadowlands", for_sort = 14, zone_id = 1565, expansion = "sl",
                coordzone = 1565, coordx = 30.45, coordy = 55.55, level = 60, 
            },
        },
    },
	[180731] = { -- Wildseed Cradle
        spell_id = 334352,
        from = {
            {
                itemname = "Wildseed Cradle", type = 'treasure', customnpcName = '月亮宝箱',
                continent = "shadowlands", for_sort = 14, zone_id = 1565, expansion = "sl",
                coordzone = 1565, coordx = 63.9, coordy = 37.7, level = 60, 
            },
        },
    },
	[183741] = { -- Ascended Skymane
        spell_id = 342335,
        from = {
            {
                itemname = 'Ascended Skymane', type = 'treasure', customnpcName = '晋升宝箱', cond = 'ascendedskymane',
                continent = 'shadowlands', for_sort = 14, zone_id = 1533, expansion = 'sl',
                coordzone = 1533, coordx = 53.5, coordy = 88.2, level = 60, 
            },
        },
    },
	[180762] = { -- Phalynx of Humility
        spell_id = 334386,
        from = {
            {
                itemname = "Phalynx of Humility", type = 'treasure', customnpcName = '纯洁试炼宝箱', covenant = 1,
                continent = "shadowlands", for_sort = 14, zone_id = 1533, expansion = "sl",
                coordzone = 1533, coordx = 54, coordy = 73.6, level = 60, 
            },
        },
    },
	[180772] = { -- Silverwind Larion
        spell_id = 334433,
        from = {
            {
                itemname = "Silverwind Larion", type = 'treasure', customnpcName = '银风暮钟',
                continent = "shadowlands", for_sort = 14, zone_id = 1533, expansion = "sl",
                coordzone = 1533, coordx = 36.1, coordy = 26.6, level = 60, 
            },
        },
    },
	[180773] = { -- Sundancer
        spell_id = 312765,
        from = {
            {
                itemname = 'Sundancer', type = 'rare', npc_id = 170548,
                continent = 'shadowlands', for_sort = 14, zone_id = 1533, expansion = 'sl',
                coordzone = 1533, coordx = 61.37, coordy = 82.67, level = 60, 
            },
        },
    },
	[182075] = { -- Bonehoof Tauralus
        spell_id = 332457,
        from = {
            {
                itemname = 'Bonehoof Tauralus', type = 'rare', npc_id = 162586, quest_id = 58783,
                continent = 'shadowlands', for_sort = 14, zone_id = 1536, expansion = 'sl',
                coordzone = 1536, coordx = 44.41, coordy = 52.18, level = 60, 
            },
        },
    },
	[181815] = { -- Armored Bonehoof Tauralus
        spell_id = 332466,
        from = {
            {
                itemname = 'Armored Bonehoof Tauralus', type = 'rare', npc_id = 168147, cond = 'summonnecrolord', quest_id = 58783,
                continent = 'shadowlands', for_sort = 14, zone_id = 1536, expansion = 'sl',
                coordzone = 1536, coordx = 50.67, coordy = 47.37, level = 60, 
            },
        },
    },
	[182084] = { -- Gorespine
        spell_id = 332480,
        from = {
            {
                itemname = 'Gorespine', type = 'rare', npc_id = 162690, quest_id = 58851,
                continent = 'shadowlands', for_sort = 14, zone_id = 1536, expansion = 'sl',
                coordzone = 1536, coordx = 66.03, coordy = 35.32, level = 60, 
            },
        },
    },
	[182080] = { -- Predatory Plagueroc
        spell_id = 336045,
        from = {
            {
                itemname = 'Predatory Plagueroc', type = 'rare', npc_id = 162741, cond = 'summonnecrolord', quest_id = 58872,
                continent = 'shadowlands', for_sort = 14, zone_id = 1536, expansion = 'sl',
                coordzone = 1536, coordx = 31.4, coordy = 35.4, level = 60, 
            },
        },
    },
	[182079] = { -- Hulking Deathroc
        spell_id = 336042,
        from = {
            {
                itemname = "Slime-Covered Reins of the Hulking Deathroc", type = 'rare', npc_id = 157309, cond = 'poolofmixedmonstrosities', quest_id = 61720,
                continent = "shadowlands", for_sort = 14, zone_id = 1536, expansion = "sl",
                coordzone = 1536, coordx = 58.21, coordy = 74.23, level = 60, 
            },
        },
    },
	[182085] = { -- Blisterback Bloodtusk
        spell_id = 332478,
        from = {
            {
                itemname = "Blisterback Bloodtusk", type = 'rare', npc_id = 162819, quest_id = 58889,
                continent = "shadowlands", for_sort = 14, zone_id = 1536, expansion = "sl",
                coordzone = 1536, coordx = 33.6, coordy = 80.4, level = 60, 
            },
        },
    },
	[182614] = { -- Blanchy's Reins
        spell_id = 339588,
        from = {
            {
                itemname = "Blanchy's Reins", type = 'treasure', customnpcName = '死掉的布兰契', cond = 'blanchy',
                continent = 'shadowlands', for_sort = 14, zone_id = 1525, expansion = 'sl',
                coordzone = 1525, coordx = 63.3, coordy = 42.9, level = 60, 
            },
        },
    },
	[180582] = { -- Endmire Flyer
        spell_id = 332905,
        from = {
            {
                itemname = "Endmire Flyer Tether", type = 'rare', npc_id = 166521, quest_id = 59869,
                continent = "shadowlands", for_sort = 14, zone_id = 1525, expansion = "sl",
                coordzone = 1525, coordx = 62.6, coordy = 47.2, level = 60, 
            },
        },
    },
	[180581] = { -- Hopecrusher Gargon
        spell_id = 312753,
        from = {
            {
                itemname = 'Hopecrusher Gargon', type = 'rare', npc_id = 166679, quest_id = 59900,
                continent = 'shadowlands', for_sort = 14, zone_id = 1525, expansion = 'sl',
                coordzone = 1525, coordx = 52.6, coordy = 52.2, level = 60, 
            },
        },
    },
	[180461] = { -- Horrid Dredwing
        spell_id = 332882,
        from = {
            {
                itemname = "Horrid Dredwing", type = 'rare', npc_id = 165290, quest_id = 59612,
                continent = "shadowlands", for_sort = 14, zone_id = 1525, expansion = "sl",
                coordzone = 1525, coordx = 45.83, coordy = 79.34, level = 60, 
            },
        },
    },
	[182589] = { -- Loyal Gorger
        spell_id = 333027,
        from = {
            {
                itemname = "Loyal Gorger", type = 'rare', npc_id = 160821, cond = "loyalgorger",
                continent = "shadowlands", for_sort = 14, zone_id = 1525, expansion = "sl",
                coordzone = 1525, coordx = 38.58, coordy = 72.15, level = 60, 
            },
        },
    },
	[184167] = { -- Mawsworn Soulhunter
        spell_id = 312762,
        from = {
            {
                itemname = 'Mawsworn Soulhunter', type = 'rare', npc_id = 174861, quest_id = 63433,
                continent = 'shadowlands', for_sort = 14, zone_id = 1543, expansion = 'sl',
                coordzone = 1543, coordx = 5., coordy = 78, 
				level = 60, 
            },
        },
    },
	[183518] = { -- Court Sinrunner
        spell_id = 341639,
        from = {
            {
                itemname = 'Court Sinrunner', type = 'vendor', npc_id = 176066, cost = 30000,
				repid = 2413, replevel = 8, reprequired = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = 1670, expansion = 'sl',
                coordzone = 1670, coordx = 46.8, coordy = 77.2, level = 60, 
            },
        },
    },
	[183740] = { -- Gilded Prowler
        spell_id = 342334,
        from = {
            {
                itemname = 'Gilded Prowler', type = 'vendor', npc_id = 176064, cost = 30000,
				repid = 2407, replevel = 8, reprequired = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = 1670, expansion = 'sl',
                coordzone = 1670, coordx = 47.8, coordy = 75.4, level = 60, 
            },
        },
    },
	[182954] = { -- Inquisition Gargon
        spell_id = 332923,
        from = {
            {
                itemname = 'Inquisition Gargon', type = 'vendor', npc_id = 176368, cost = 30000,
				repid = 2439, replevel = 8, reprequired = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = 1670, expansion = 'sl',
                coordzone = 1670, coordx = 46.6, coordy = 77.6, level = 60, 
            },
        },
    },
	[182082] = { -- Lurid Bloodtusk
        spell_id = 332484,
        from = {
            {
                itemname = 'Lurid Bloodtusk', type = 'vendor', npc_id = 176067, cost = 30000,
				repid = 2410, replevel = 8, reprequired = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = 1670, expansion = 'sl',
                coordzone = 1670, coordx = 48, coordy = 76.2, level = 60, 
            },
        },
    },
	[180729] = { -- Duskflutter Ardenmoth
        spell_id = 332256,
        from = {
            {
                itemname = 'Duskflutter Ardenmoth', type = 'vendor', npc_id = 176065, cost = 30000,
				repid = 2465, replevel = 8, reprequired = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = 1670, expansion = 'sl',
                coordzone = 1670, coordx = 47.6, coordy = 76.8, level = 60, 
            },
        },
    },
	[182081] = { -- Colossal Slaughterclaw
        spell_id = 327405,
        from = {
            {
                itemname = "Reins of the Colossal Slaughterclaw", type = 'paragon', npc_id = 173003,
				repid = 2410, replevel = 8, reprequired = 1,
                continent = "shadowlands", for_sort = 14, zone_id = 1536, expansion = "sl",
                coordzone = 1536, coordx = 50.8, coordy = 53.4, level = 60, 
            },
        },
    },
	[183800] = { -- Amber Ardenmoth
        spell_id = 342666,
        from = {
            {
                itemname = "Amber Ardenmoth", type = 'paragon', npc_id = 158556,
				repid = 2465, replevel = 8, reprequired = 1,
                continent = "shadowlands", for_sort = 14, zone_id = 1565, expansion = "sl",
                coordzone = 1565, coordx = 48.5, coordy = 50.4, level = 60, 
            },
        },
    },
	[181317] = { -- Dauntless Duskrunner
        spell_id = 336064,
        from = {
            {
                itemname = 'Dauntless Duskrunner', type = 'slcovenant', npc_id = -4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[181300] = { -- Gruesome Flayedwing
        spell_id = 336039,
        from = {
            {
                itemname = 'Gruesome Flayedwing', type = 'slcovenant', npc_id = -4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180726] = { -- Pale Acidmaw
        spell_id = 334365,
        from = {
            {
                itemname = 'Pale Acidmaw', type = 'slcovenant', npc_id = -4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[181316] = { -- Silvertip Dredwing
        spell_id = 312777,
        from = {
            {
                itemname = 'Silvertip Dredwing', type = 'slcovenant', npc_id = -4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180763] = { -- Phalynx of Courage
        spell_id = 334391,
        from = {
            {
                itemname = 'Phalynx of Courage', type = 'slcovenant', npc_id = -3,
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180766] = { -- Eternal Phalynx of Courage
        spell_id = 334406,
        from = {
            {
                itemname = 'Eternal Phalynx of Courage', type = 'slcovenant', npc_id = -3,
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180764] = { -- Phalynx of Purity
        spell_id = 334398,
        from = {
            {
                itemname = 'Phalynx of Purity', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_23',
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1533, coordx = 63.3, coordy = 30.6, level = 60, 
            },
        },
    },
	[180765] = { -- Eternal Phalynx of Purity
        spell_id = 334403,
        from = {
            {
                itemname = 'Phalynx of Purity', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_39',
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1533, coordx = 63.3, coordy = 30.6, level = 60, 
            },
        },
    },
	[180761] = { -- Phalynx of Loyalty
        spell_id = 334382,
        from = {
            {
                itemname = 'Phalynx of Loyalty', type = 'slcovenant', npc_id = -4,
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180767] = { -- Eternal Phalynx of Loyalty
        spell_id = 334408,
        from = {
            {
                itemname = 'Eternal Phalynx of Loyalty', type = 'slcovenant', npc_id = -4,
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180768] = { -- Eternal Phalynx of Humility
        spell_id = 334409,
        from = {
            {
                itemname = 'Eternal Phalynx of Humility', type = 'slcovenant', npc_id = -4,
				covenant = 1,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },----------
	[182077] = { -- War-Bred Tauralus
        spell_id = 332455,
        from = {
            {
                itemname = 'War-Bred Tauralus', type = 'slcovenant', npc_id = -3,
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[181822] = { -- Armored War-Bred Tauralus
        spell_id = 332462,
        from = {
            {
                itemname = 'Armored War-Bred Tauralus', type = 'slcovenant', npc_id = -3,
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[182076] = { -- Plaguerot Tauralus
        spell_id = 332456,
        from = {
            {
                itemname = 'Plaguerot Tauralus', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_23',
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1536, coordx = 50.68, coordy = 71.38, level = 60, 
            },
        },
    },
	[181821] = { -- Armored Plaguerot Tauralus
        spell_id = 332464,
        from = {
            {
                itemname = 'Armored Plaguerot Tauralus', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_39',
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1536, coordx = 50.68, coordy = 71.38, level = 60, 
            },
        },
    },
	[182078] = { -- Bonesewn Fleshroc
        spell_id = 336041,
        from = {
            {
                itemname = 'Bonesewn Fleshroc', type = 'slcovenant', npc_id = -4,
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[182074] = { -- Chosen Tauralus
        spell_id = 332460,
        from = {
            {
                itemname = 'Chosen Tauralus', type = 'slcovenant', npc_id = -4,
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[181820] = { -- Armored Chosen Tauralus
        spell_id = 332467,
        from = {
            {
                itemname = 'Armored Chosen Tauralus', type = 'slcovenant', npc_id = -4,
				covenant = 4,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },----------
	[180263] = { -- Dreamlight Runestag
        spell_id = 312759,
        from = {
            {
                itemname = 'Dreamlight Runestag', type = 'slcovenant', npc_id = -3,
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180721] = { -- Enchanted Dreamlight Runestag
        spell_id = 312761,
        from = {
            {
                itemname = 'Enchanted Dreamlight Runestag', type = 'slcovenant', npc_id = -3,
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180413] = { -- Shadeleaf Runestag
        spell_id = 332243,
        from = {
            {
                itemname = 'Shadeleaf Runestag', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_23',
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1565, coordx = 46.37, coordy = 50.79, level = 60, 
            },
        },
    },
	[180722] = { -- Enchanted Shadeleaf Runestag
        spell_id = 332246,
        from = {
            {
                itemname = 'Enchanted Shadeleaf Runestag', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_39',
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1565, coordx = 46.37, coordy = 50.79, level = 60, 
            },
        },
    },
	[183053] = { -- Umbral Scythehorn
        spell_id = 340503,
        from = {
            {
                itemname = "Umbral Scythehorn", type = 'vendor', npc_id = 162447, cost = 5000, curr = 'anima', 
				repid = 2464, reprequired = 1, replevel = 7, covenant = 3,
                continent = "shadowlands", for_sort = 14, zone_id = -4 , expansion = "sl",
                coordzone = 1565, coordx = 59.6, coordy = 52.9, level = 60, 
            },
        },
    },
	[180415] = { -- Winterborn Runestag
        spell_id = 332245,
        from = {
            {
                itemname = "Winterborn Runestag", type = 'vendor', npc_id = 162447, cost = 5000, curr = 'anima',
				repid = 2464, reprequired = 1, replevel = 7, covenant = 3,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                coordzone = 1565, coordx = 59.6, coordy = 52.9, level = 60, 
            },
        },
    },
	[180414] = { --  Wakener's Runestag
        spell_id = 332244,
        from = {
            {
                itemname = "Wakener's Runestag", type = 'slcovenant', npc_id = -4,
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180723] = { -- Enchanted Wakener's Runestag
        spell_id = 332247,
        from = {
            {
                itemname = "Enchanted Wakener's Runestag", type = 'slcovenant', npc_id = -4,
				covenant = 3,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[183801] = { -- Vibrant Flutterwing
        spell_id = 342667,
        from = {
            {
                itemname = "Vibrant Flutterwing", type = 'vendor', npc_id = 174766, currency = 'anima', cost = 5000,
				repid = 2463, reprequired = 1, replevel = 7, covenant = 3,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                coordzone = 1565, coordx = 56.04, coordy = 53.01, level = 60, 
            },
        },
    },
	[180724] = { -- Enchanted Winterborn Runestag
        spell_id = 332248,
        from = {
            {
                itemname = "Enchanted Winterborn Runestag", type = 'vendor', npc_id = 174766, currency = 'anima', cost = 5000,
				repid = 2463, reprequired = 1, replevel = 7, covenant = 3,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                coordzone = 1565, coordx = 56.04, coordy = 53.01, level = 60, 
            },
        },
    },
	----------
	[180945] = { -- Crypt Gargon
        spell_id = 332932,
        from = {
            {
                itemname = 'Crypt Gargon', type = 'slcovenant', npc_id = -3,
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[180948] = { -- Battle Gargon Vrednic
        spell_id = 312754,
        from = {
            {
                itemname = 'Battle Gargon Vrednic', type = 'slcovenant', npc_id = -3,
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[183715] = { -- Sinfall Gargon
        spell_id = 332927,
        from = {
            {
                itemname = 'Sinfall Gargon', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_23',
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1525, coordx = 53.68, coordy = 24.90, level = 60, 
            },
        },
    },
	[182332] = { -- Gravestone Battle Armor
        spell_id = 333021,
        from = {
            {
                itemname = 'Gravestone Battle Armor', type = 'slcovenant', npc_id = -5, cost = 5000, currency = 'anima', cond = 'renown_39',
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                coordzone = 1525, coordx = 53.68, coordy = 24.90, level = 60, 
            },
        },
    },
	[182209] = { -- Desire's Battle Gargon
        spell_id = 332949,
        from = {
            {
                itemname = "Desire's Battle Gargon", type = 'slcovenant', npc_id = -4,
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[183798] = { -- Silessa's Battle Harness
        spell_id = 333023,
        from = {
            {
                itemname = "Silessa's Battle Harness", type = 'slcovenant', npc_id = -6,
				covenant = 2,
                continent = 'shadowlands', for_sort = 14, zone_id = -4, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[184062] = { -- Battle-Bound Warhound
        spell_id = 344228,
        from = {
            {
                itemname = "Gnawed Reins of the Battle-Bound Warhound", type = 'rare', npc_id = 162853, cond = 'theaterofpain',
                continent = "shadowlands", for_sort = 14, zone_id = 1536,
				expansion = "sl",
                coordzone = 1536, coordx = 50, coordy = 47, level = 60,
            },
        },
    },
	[181819] = { -- Marrowfang
        spell_id = 336036,
        from = {
            {
                itemname = "Marrowfang's Reins", type = 'dungeon', subtype = 'mythic', npc_id = 166945,
                continent = 'shadowlands', for_sort = 14, zone_id = 1666, expansion = 'sl',
                coordzone = 1533, coordx = 40, coordy = 55, level = 60, 
            },
        },
    },
	[183617] = { -- Chittering Animite
        spell_id = 312776,
        from = {
            {
                itemname = "Chittering Animite", type = 'slcovenant', npc_id = -1,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                level = 60, 
            },
        },
    },
	[183052] = { -- Darkwarren Hardshell
        spell_id = 312763,
        from = {
            {
                itemname = "Darkwarren Hardshell", type = 'slcovenant', npc_id = -1,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                level = 60, 
            },
        },
    },
	[183618] = { -- Highwind Darkmane
        spell_id = 341776,
        from = {
            {
                itemname = "Highwind Darkmane", type = 'slcovenant', npc_id = -1,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                level = 60, 
            },
        },
    },
	[183615] = { -- Warstitched Darkhound
        spell_id = 341766,
        from = {
            {
                itemname = "Warstitched Darkhound", type = 'slcovenant', npc_id = -1,
                continent = "shadowlands", for_sort = 14, zone_id = -4, expansion = "sl",
                level = 60, 
            },
        },
    },
	[186485] = { -- Ascendant's Aquilon
        spell_id = 353880,
        from = {
            {
                itemname = "Ascendant's Aquilon", type = 'slcovenant', npc_id = 174937, covenant = 1, cond = 'renown_70', cost = 7500, currency = 'anima',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                coordzone = 1533, coordx = 67.4, coordy = 15, level = 60,
            },
        },
    },
	[186482] = { -- Elysian Aquilon
        spell_id = 353875,
        from = {
            {
                itemname = "Elysian Aquilon", type = 'slcovenant', npc_id = -1, covenant = 1, cond = 'renown_45',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                level = 60,
            },
        },
    },
	[186480] = { -- Battle-Hardened Aquilon
        spell_id = 343550,
        from = {
            {
                itemname = "Battle-Hardened Aquilon", type = 'vendor', npc_id = 179321, cost = 1000, currency = 'stygia', cond = 'ach_ontheoffensive', covenant = 1,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186483] = { -- Forsworn Aquilon
        spell_id = 353877,
        from = {
            {
                itemname = "Intact Aquilon Core", type = 'rare', npc_id = 180032, covenant = 1, quest_id = 64529,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 47, coordy = 36, level = 60,
            },
        },
    },
	[186643] = { -- Maelie, the Wanderer
        spell_id = 354362,
        from = {
            {
                itemname = "Maelie, the Wanderer", type = 'rare', npc_id = 179912, cond = 'maelie',
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                level = 60, 
            },
        },
    },
    [186638] = { -- Cartel Master's Gearglider
        spell_id = 353263,
        from = {
            {
                itemname = "Cartel Master's Gearglider", type = 'dungeon', subtype = 'heroic', npc_id = 180863,
                continent = "shadowlands", for_sort = 15, zone_id = 1989, expansion = "sl",
                coordzone = 1961, coordx = 69, coordy = 69, level = 60, 
            },
        },
    },
    [186637] = { -- Tazavesh Gearglider
        spell_id = 346554,
        from = {
            {
                itemname = "Tazavesh Gearglider", type = 'dungeon', npc_id = 180863, cond = 'ach_fakeittilyoumakeit',
                continent = "shadowlands", for_sort = 15, zone_id = 1989, expansion = "sl",
                coordzone = 1961, coordx = 69, coordy = 69, level = 60, 
            },
        },
    },
	[186490] = { -- Battlefield Swarmer
        spell_id = 353885,
        from = {
            {
                itemname = "Battlefield Swarmer", type = 'vendor', npc_id = 179321, cost = 1000, currency = 'stygia', cond = 'ach_ontheoffensive', covenant = 4,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186489] = { -- Lord of the Corpseflies
        spell_id = 347250,
        from = {
            {
                itemname = "Lord of the Corpseflies", type = 'rare', npc_id = 180042, covenant = 4,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 60, coordy = 43, level = 60,
            },
        },
    },
	[186487] = { -- Maldraxxian Corpsefly
        spell_id = 353883,
        from = {
            {
                itemname = "Maldraxxian Corpsefly Harness", type = 'slcovenant', npc_id = -1, covenant = 4, cond = 'renown_45',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                level = 60,
            },
        },
    },
	[186488] = { -- Regal Corpsefly
        spell_id = 353884,
        from = {
            {
                itemname = "Regal Corpsefly Harness", type = 'slcovenant', npc_id = 172176, covenant = 4, cond = 'renown_70', cost = 7500, currency = 'anima',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                coordzone = 1536, coordx = 50.68, coordy = 71.38, level = 60,
            },
        },
    },
	[187183] = { -- Rampaging Mauler
        spell_id = 356501,
        from = {
            {
                itemname = "Rampaging Mauler", type = 'rare', npc_id = 179472,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 52, coordy = 21, level = 60,
            },
        },
    },
	[186641] = { -- Tamed Mauler
        spell_id = 347536,
        from = {
            {
                itemname = "Tamed Mauler Harness", type = 'paragon', npc_id = 106902,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 62.6, coordy = 22.6, level = 60,
            },
        },
    },
	[185996] = { -- Harvester's Dredwing
        spell_id = 332904,
        from = {
            {
                itemname = "Harvester's Dredwing Saddle", type = 'korthiaassault', npc_id = -2, quest_id = 64554,
                continent = "shadowlands", for_sort = 15, zone_id = 1543, expansion = "sl",
                level = 60,
            },
        },
    },
	[185996] = { -- Harvester's Dredwing
        spell_id = 332904,
        from = {
            {
                itemname = "Harvester's Dredwing Saddle", type = 'korthiaassault', npc_id = -2, quest_id = 63822,
                continent = "shadowlands", for_sort = 15, zone_id = 1543, expansion = "sl",
                level = 60,
            },
        },
    },
	[186000] = { -- Wild Hunt Legsplitter
        spell_id = 352441,
        from = {
            {
                itemname = "Legsplitter War Harness", type = 'korthiaassault', npc_id = -3, quest_id = 63823,
                continent = "shadowlands", for_sort = 15, zone_id = 1543, expansion = "sl",
                level = 60,
            },
        },
    },
	[186477] = { -- Pale Gravewing
        spell_id = 353873,
        from = {
            {
                itemname = "Pale Gravewing", type = 'vendor', npc_id = 179321, cost = 1000, currency = 'stygia', cond = 'ach_ontheoffensive', covenant = 2,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186476] = { -- Sinfall Gravewing
        spell_id = 353872,
        from = {
            {
                itemname = "Sinfall Gravewing", type = 'slcovenant', npc_id = -1, covenant = 2, cond = 'renown_45',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                level = 60,
            },
        },
    },
	[186478] = { -- Obsidian Gravewing
        spell_id = 353866,
        from = {
            {
                itemname = "Obsidian Gravewing", type = 'slcovenant', npc_id = 172176, covenant = 2, cond = 'renown_70', cost = 7500, currency = 'anima',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                coordzone = 1525, coordx = 30, coordy = 38, level = 60,
            },
        },
    },
	[186642] = { -- Vengeance
        spell_id = 351195,
        from = {
            {
                itemname = "Vengeance's Reins", type = 'raid', subtype = 'mythic', npc_id = 180828,
                continent = "shadowlands", for_sort = 15, zone_id = 1998, expansion = "sl",
                coordzone = 1543, coordx = 70, coordy = 32, level = 60,
            },
        },
    },
	[186659] = { -- Fallen Charger
        spell_id = 354353,
        from = {
            {
                itemname = "Fallen Charger's Reins", type = 'rare', npc_id = 179460,
                continent = "shadowlands", for_sort = 15, zone_id = 1543, expansion = "sl",
                coordzone = 1543, coordx = 36.6, coordy = 47.8, level = 60,
            },
        },
    },
	[186656] = { -- Sanctum Gloomcharger
        spell_id = 354351,
        from = {
            {
                itemname = "Sanctum Gloomcharger's Reins", type = 'raid', npc_id = 178738,
                continent = "shadowlands", for_sort = 15, zone_id = 1998, expansion = "sl",
                coordzone = 1543, coordx = 70, coordy = 32, level = 60,
            },
        },
    },
	[186657] = { -- Soulbound Gloomcharger
        spell_id = 354352,
        from = {
            {
                itemname = "Soulbound Gloomcharger's Reins", type = 'paragon', npc_id = 162804,
                continent = "shadowlands", for_sort = 15, zone_id = 1543, expansion = "sl",
                coordzone = 1543, coordx = 46.8, coordy = 41.6, level = 60,
            },
        },
    },
	[185973] = { -- Hand of Bahmethra
        spell_id = 352309,
        from = {
            {
                itemname = 'Chain of Bahmethra', type = 'treasure', customnpcName = '巴麦赫特之环', cond = 'handofbahmethra',
                continent = 'shadowlands', for_sort = 15, zone_id = 1543, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[186651] = { -- Dusklight Razorwing
        spell_id = 354361,
        from = {
            {
                itemname = 'Dusklight Razorwing', type = 'treasure', customnpcName = '失落的刀翼兽之卵', cond = 'lostrazorwingeggs',
                continent = 'shadowlands', for_sort = 15, zone_id = 1961, expansion = 'sl',
                level = 60, 
            },
        },
    },
	[186649] = { -- Fierce Razorwing
        spell_id = 354359,
        from = {
            {
                itemname = "Fierce Razorwing", type = 'paragon', npc_id = 179321,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186652] = { -- Garnet Razorwing
        spell_id = 354360,
        from = {
            {
                itemname = "Garnet Razorwing", type = 'rare', npc_id = 180160,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 56, coordy = 66, level = 60,
            },
        },
    },
	[186648] = { -- Soaring Razorwing
        spell_id = 347251,
        from = {
            {
                itemname = "Soaring Razorwing", type = 'vendor', npc_id = 178257, cost = 5000, currency = 'catalogedresearch',
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 62.6, coordy = 22.6, level = 60,
            },
        },
    },
	[186647] = { -- Amber Shardhide
        spell_id = 354356,
        from = {
            {
                itemname = "Amber Shardhide", type = 'vendor', npc_id = 179321, cost = 5000, currency = 'stygia',
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl", repid = 2470, reprequired = 1, replevel = 7,
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186644] = { -- Beryl Shardhide
        spell_id = 347810,
        from = {
            {
                itemname = "Beryl Shardhide", type = 'paragon', npc_id = 179321,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186645] = { -- Crimson Shardhide
        spell_id = 354357,
        from = {
            {
                itemname = "Crimson Shardhide", type = 'rare', npc_id = 179684,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 44.6, coordy = 29.6, level = 60,
            },
        },
    },
	[186646] = { -- Darkmaul
        spell_id = 354358,
        from = {
            {
                itemname = "Darkmaul", type = 'rare', npc_id = 180063,
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 42.6, coordy = 33, level = 60,
            },
        },
    },
	[186103] = { -- Undying Darkhound
        spell_id = 352742,
        from = {
            {
                itemname = "Undying Darkhound's Harness", type = 'korthiaassault', npc_id = -4, quest_id = 63543,
                continent = "shadowlands", for_sort = 5, zone_id = 1543, expansion = "sl",
                level = 60,
            },
        },
    },
	[186495] = { -- Winter Wilderling
        spell_id = 353858,
        from = {
            {
                itemname = "Winter Wilderling's Harness", type = 'vendor', npc_id = 179321, cond = 'ach_ontheoffensive', covenant = 3, mount_id = 1486,
				cost = 1000, currency = 'stygia', 
                continent = "shadowlands", for_sort = 15, zone_id = 1961, expansion = "sl",
                coordzone = 1961, coordx = 63.4, coordy = 23.4, level = 60,
            },
        },
    },
	[186493] = { -- Ardenweald Wilderling
        spell_id = 353856,
        from = {
            {
                itemname = "Ardenweald Wilderling's Harness", type = 'slcovenant', npc_id = -1, covenant = 3, cond = 'renown_45',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                level = 60,
            },
        },
    },
	[186494] = { -- Autumnal Wilderling
        spell_id = 353857,
        from = {
            {
                itemname = "Autumnal Wilderling's Harness", type = 'slcovenant', npc_id = 174914, covenant = 3, cond = 'renown_70', cost = 7500, currency = 'anima',
                continent = "shadowlands", for_sort = 15, zone_id = -3, expansion = "sl",
                coordzone = 1701, coordx = 59.8, coordy = 32.8, level = 60,
            },
        },
    },
	[186651] = { -- Summer Wilderling
        spell_id = 354361,
        from = {
            {
                itemname = "Summer Wilderling's Harness", type = 'treasure', customnpcName = '被利爪刺穿的渊誓保险箱',
                continent = 'shadowlands', for_sort = 15, zone_id = 1961, expansion = 'sl',
                level = 60, 
            },
        },
    },
		[187677] = { -- Genesis Crawler
        spell_id = 359401,
        from = {
            {
                itemname = "Genesis Crawler", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, coordx = 31.5, coordy = 50.3, level = 60, 
            },
        },
    },
		[187679] = { -- Ineffable Skitterer
        spell_id = 359403,
        from = {
            {
                itemname = "Ineffable Skitterer", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, coordx = 34.6, coordy = 48.8, level = 60, 
            },
        },
    },
		[187678] = { -- Tarachnid Creeper
        spell_id = 359402,
        from = {
            {
                itemname = "Tarachnid Creeper", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187663] = { -- Bronzewing Vespoid
        spell_id = 359364,
        from = {
            {
                itemname = "Bronzewing Vespoid", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187665] = { -- Buzz
        spell_id = 359366,
        from = {
            {
                itemname = "Buzz", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187664] = { -- Forged Spiteflyer
        spell_id = 359367,
        from = {
            {
                itemname = "Forged Spiteflyer", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187660] = { -- Vespoid Flutterer
        spell_id = 342678,
        from = {
            {
                itemname = "Vespoid Flutterer", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187666] = { -- Desertwing Hunter
        spell_id = 342668,
        from = {
            {
                itemname = "Desertwing Hunter", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187667] = { -- Mawdapted Raptora
        spell_id = 359372,
        from = {
            {
                itemname = "Mawdapted Raptora", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187668] = { -- Raptora Swooper
        spell_id = 359373,
        from = {
            {
                itemname = "Raptora Swooper", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[190580] = { -- Heartbond Lupine
        spell_id = 367673,
        from = {
            {
                itemname = "Heartbond Lupine", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[190768] = { -- Zereth Overseer
        spell_id = 368158,
        from = {
            {
                itemname = "Fractal Cypher of the Zereth Overseer", type = 'raid', subtype = 'mythic', npc_id = 180990,
                continent = "shadowlands", for_sort = 15, zone_id = 2061, expansion = "sl",
                coordzone = 1970, coordx = 70, coordy = 32, level = 60,
            },
        },
    },
		[187670] = { -- Bronze Helicid
        spell_id = 359376,
        from = {
            {
                itemname = "Bronze Helicid", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187672] = { -- Scarlet Helicid
        spell_id = 359378,
        from = {
            {
                itemname = "Scarlet Helicid", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187669] = { -- Serenade
        spell_id = 346719,
        from = {
            {
                itemname = "Serenade", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187671] = { -- Unsuccessful Prototype Fleetpod
        spell_id = 359377,
        from = {
            {
                itemname = "Unsuccessful Prototype Fleetpod", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187632] = { -- Adorned Vombata
        spell_id = 359232,
        from = {
            {
                itemname = "Adorned Vombata", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187630] = { -- Curious Crystalsniffer
        spell_id = 359230,
        from = {
            {
                itemname = "Curious Crystalsniffer", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187631] = { -- Darkened Vombata 
        spell_id = 359231,
        from = {
            {
                itemname = "Darkened Vombata", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187629] = { -- Heartlight Vombata
        spell_id = 359229,
        from = {
            {
                itemname = "Heartlight Vombata", type = 'vendor', npc_id = 182257, currency = 'anima', cost = 5000,
				repid = 2478, reprequired = 1, replevel = 7,
                continent = "shadowlands", for_sort = 16, zone_id = 1970, expansion = "sl",
                coordzone = 1970, coordx = 34.8, coordy = 64.2, level = 60, 
            },
        },
    },
		[190771] = { -- Carcinized Zerethsteed
        spell_id = 359545,
        from = {
            {
                itemname = "Fractal Cypher of the Carcinized Zerethsteed", type = 'raid', subtype = 'heroic', npc_id = 180990,
                continent = "shadowlands", for_sort = 15, zone_id = 2061, expansion = "sl",
                coordzone = 1970, coordx = 70, coordy = 32, level = 60, cond = 'aotc',
            },
        },
    },
		[187676] = { -- Deepstar Aurelid
        spell_id = 342680,
        from = {
            {
                itemname = "Deepstar Polyp", type = 'rare', npc_id = 180978, quest_id = 65548,
                continent = "shadowlands", for_sort = 16, zone_id = 1970, expansion = "sl",
                coordzone = 1970, coordx = 51.6, coordy = 74.6, level = 60,
            },
        },
    },
		[190765] = { -- Colossal Plaguespew Mawrat
        spell_id = 368105,
        from = {
            {
                itemname = "Iska's Mawrat Leash", type = 'rare', npc_id = 182120,
                continent = "shadowlands", for_sort = 16, zone_id = 1970, expansion = "sl",
                coordzone = 1970, coordx = 63.2, coordy = 26, level = 60,
            },
        },
    },
		[188700] = { -- Colossal Umbrahide Mawrat
        spell_id = 363178,
        from = {
            {
                itemname = "Sturdy Silver Mawrat Harness", type = 'zone',
                continent = "shadowlands", for_sort = 16, zone_id = 1911, expansion = "sl",
                level = 60, cond = 'torghast13',
            },
        },
    },
		[190766] = { -- Colossal Wraithbound Mawrat
        spell_id = 368128,
        from = {
            {
                itemname = "Spectral Mawrat's Tail", type = 'treasure', customnpcName = '渊誓补给宝箱',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
		[187638] = { -- Deathrunner
        spell_id = 359278,
        from = {
            {
                itemname = "Deathrunner", type = 'treasure', customnpcName = '原生体合成',
                continent = 'shadowlands', for_sort = 16, zone_id = 1970, expansion = 'sl',
                coordzone = 1970, level = 60, 
            },
        },
    },
	[187640] = { -- Anointed Protostag
        spell_id = 359276,
        from = {
            {
                itemname = "Anointed Protostag Reins", type = 'vendor', npc_id = 182257, currency = 'anima', cost = 5000,
				repid = 2478, reprequired = 1, replevel = 7,
                continent = "shadowlands", for_sort = 16, zone_id = 1970, expansion = "sl",
                coordzone = 1970, coordx = 34.8, coordy = 64.2, level = 60, 
            },
        },
    },
	[60954] = { -- Fossilized Raptor
        spell_id = 84751,
        from = {
            {
                itemname = "Fossilized Raptor", type = 'profession', npc_id = 0, cond = "archaeologyfossil",
                continent = "shadowlands", for_sort = 2, zone_id = -1, expansion = "cata",
                level = 30, 
            },
        },
    },
	[64883] = { -- Ultramarine Qiraji Battle Tank
        spell_id = 92155,
        from = {
            {
                itemname = "Scepter of Azj'Aqir", type = 'profession', npc_id = 0, cond = "archaeologytolvir",
                continent = "shadowlands", for_sort = 2, zone_id = -1, expansion = "cata",
                level = 30, 
            },
        },
    },
	[131734] = { -- Spirit of Eche'ro
        spell_id = 196681,
        from = {
            {
                itemname = "Spirit of Eche'ro", type = 'profession', npc_id = 0, cond = "archaeologyechero",
                continent = "shadowlands", for_sort = 2, zone_id = -1, expansion = "legion",
                level = 30, 
            },
        },
    },
	[65891] = { -- Sandstone Drake
        spell_id = 93326,
        from = {
            {
                itemname = "Vial of the Sands", type = 'profession', npc_id = 0, cond = "archaeologytolvir",
                continent = "shadowlands", for_sort = 2, zone_id = -1, expansion = "cata",
                level = 30, 
            },
        },
    },
	[187683] = { -- Goldplate Bufonid
        spell_id = 359413,
        from = {
            {
                itemname = "Goldplate Bufonid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[188809] = { -- Prototype Leaper
        spell_id = 363703,
        from = {
            {
                itemname = "Prototype Leaper", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[188810] = { -- Russet Bufonid
        spell_id = 363706,
        from = {
            {
                itemname = "Russet Bufonid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187677] = { -- Genesis Crawler
        spell_id = 359401,
        from = {
            {
                itemname = "Genesis Crawler", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187679] = { -- Ineffable Skitterer
        spell_id = 359403,
        from = {
            {
                itemname = "Ineffable Skitterer", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187678] = { -- Tarachnid Creeper
        spell_id = 359402,
        from = {
            {
                itemname = "Tarachnid Creeper", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187663] = { -- Bronzewing Vespoid
        spell_id = 359364,
        from = {
            {
                itemname = "Bronzewing Vespoid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187665] = { -- Buzz
        spell_id = 359366,
        from = {
            {
                itemname = "Buzz", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187664] = { -- Forged Spiteflyer
        spell_id = 359367,
        from = {
            {
                itemname = "Forged Spiteflyer", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187660] = { -- Vespoid Flutterer
        spell_id = 342678,
        from = {
            {
                itemname = "Vespoid Flutterer", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187666] = { -- Desertwing Hunter
        spell_id = 342668,
        from = {
            {
                itemname = "Desertwing Hunter", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187667] = { -- Mawdapted Raptora
        spell_id = 359372,
        from = {
            {
                itemname = "Mawdapted Raptora", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187668] = { -- Raptora Swooper
        spell_id = 359373,
        from = {
            {
                itemname = "Raptora Swooper", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[190580] = { -- Heartbond Lupine
        spell_id = 367673,
        from = {
            {
                itemname = "Heartbond Lupine", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187670] = { -- Bronze Helicid
        spell_id = 359376,
        from = {
            {
                itemname = "Bronze Helicid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187672] = { -- Scarlet Helicid
        spell_id = 359378,
        from = {
            {
                itemname = "Scarlet Helicid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187669] = { -- Serenade
        spell_id = 346719,
        from = {
            {
                itemname = "Serenade", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187671] = { -- Unsuccessful Prototype Fleetpod
        spell_id = 359377,
        from = {
            {
                itemname = "Unsuccessful Prototype Fleetpod", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187632] = { -- Adorned Vombata
        spell_id = 359232,
        from = {
            {
                itemname = "Adorned Vombata", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187630] = { -- Curious Crystalsniffer
        spell_id = 359230,
        from = {
            {
                itemname = "Curious Crystalsniffer", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187631] = { -- Darkened Vombata
        spell_id = 359231,
        from = {
            {
                itemname = "Darkened Vombata", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187638] = { -- Deathrunner
        spell_id = 359278,
        from = {
            {
                itemname = "Deathrunner", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187639] = { -- Pale Regal Cervid
        spell_id = 342671,
        from = {
            {
                itemname = "Pale Regal Cervid", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[187641] = { -- Sundered Zerethsteed
        spell_id = 359277,
        from = {
            {
                itemname = "Reins of the Sundered Zerethsteed", type = 'slprotoformsynthesis', npc_id = 0,
                continent = "shadowlands", for_sort = 16, zone_id = -1, expansion = "sl",
                level = 60, 
            },
        },
    },
	[192775] = { -- Stormhide Salamanther
        spell_id = 374098,
        from = {
            {
                itemname = "Stormhide Salamanther", type = 'vendor', npc_id = 196516, currency = 'elementaloverflow', cost = 2000, mount_id = 1622,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 38.12, coordy = 37.68, level = 70, 
            },
        },
    },
	[192761] = { -- Tamed Skitterfly
        spell_id = 374032,
        from = {
            {
                itemname = "Tamed Skitterfly", type = 'vendor', npc_id = 189226, currency = 'Plume20Fowlfeather', cost = 5, mount_id = 1615,
				renownid = 2507, renownrequired = 1, renownlevel = 25,
                continent = "dragonisles", for_sort = 17, zone_id = 2022, expansion = "df",
                coordzone = 2022, coordx = 47, coordy = 82.6, level = 70, 
            },
        },
    },
	[192762] = { -- Azure Skitterfly
        spell_id = 374034,
        from = {
            {
                itemname = "Azure Skitterfly", type = 'vendor', npc_id = 189226, mount_id = 1616, currency = 'Plume20Fowlfeather', cost = 5,
				renownid = 2507, renownrequired = 1, renownlevel = 25,
                continent = "dragonisles", for_sort = 17, zone_id = 2022, expansion = "df",
                coordzone = 2022, coordx = 47, coordy = 82.6, level = 70, 
            },
        },
    },
	[192764] = { -- Verdant Skitterfly
        spell_id = 374048,
        from = {
            {
                itemname = 'Verdant Skitterfly', type = 'treasure', customnpcName = '探险队斥候的背包', cond = 'DFExpeditionScoutsPacks', mount_id = 1617,
                continent = 'dragonisles', for_sort = 17, zone_id = 2022, expansion = 'df',
                level = 70, 
            },
        },
    },
    [198825] = { -- Zenet Hatchling
        spell_id = 385266,
        from = {
            {
                itemname = "Zenet Hatchling", type = 'rare', npc_id = 193209, mount_id = 1672,
                continent = "dragonisles", for_sort = 17, zone_id = 2023, expansion = "df",
                coordzone = 2023, coordx = 31.51, coordy = 64.01, level = 70, 
            },
        },
    },
    [198821] = { -- Divine Kiss of Ohn'ahra
        spell_id = 395644,
        from = {
            {
                itemname = "Divine Kiss of Ohn'ahra", type = 'quest', quest_id = 72512, mount_id = 1545,
                continent = "dragonisles", for_sort = 17, zone_id = 2023, expansion = "df",
                coordzone = 2023, coordx = 57.6, coordy = 32, level = 70,
            },
        },
    },
    [201440] = { -- Liberated Slyvern
        spell_id = 359622,
        from = {
            {
                itemname = "Reins of the Liberated Slyvern", type = 'rare', npc_id = 195353, mount_id = 1553,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 27, coordy = 48.4, level = 70, 
            },
        },
    },
    [192799] = { -- Lizi, Thunderspine Tramper
        spell_id = 374247,
        from = {
            {
                itemname = "Lizi's Reins", type = 'quest', quest_id = 71196, mount_id = 1639,
                continent = "dragonisles", for_sort = 17, zone_id = 2023, expansion = "df",
                coordzone = 2023, coordx = 56.2, coordy = 77.09, level = 70,
            },
        },
    },
	[198872] = { -- Brown Scouting Ottuk
        spell_id = 376875,
        from = {
            {
                itemname = "Brown Scouting Ottuk", type = 'vendor', npc_id = 193006, mount_id = 1657,
				renownid = 2511, renownrequired = 1, renownlevel = 25,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 13.2, coordy = 49.2, level = 70, 
            },
        },
    },
	[200118] = { -- Yellow Scouting Ottuk
        spell_id = 376880,
        from = {
            {
                itemname = "Yellow Scouting Ottuk", type = 'vendor', npc_id = 193006, mount_id = 1659,
				renownid = 2511, renownrequired = 1, renownlevel = 25,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 13.2, coordy = 49.2, level = 70, 
            },
        },
    },
	[201426] = { -- Brown War Ottuk
        spell_id = 376910,
        from = {
            {
                itemname = "Brown War Ottuk", type = 'vendor', npc_id = 193006, mount_id = 1653,
				renownid = 2511, renownrequired = 1, renownlevel = 30,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 13.2, coordy = 49.2, level = 70, 
            },
        },
    },
	[201425] = { -- Yellow War Ottuk
        spell_id = 376913,
        from = {
            {
                itemname = "Yellow War Ottuk", type = 'vendor', npc_id = 193006, mount_id = 1655,
				renownid = 2511, renownrequired = 1, renownlevel = 30,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 13.2, coordy = 49.2, level = 70, 
            },
        },
    },
    [192601] = { -- Loyal Magmammoth
        spell_id = 373859,
        from = {
            {
                itemname = "Loyal Magmammoth", type = 'rare', npc_id = 194625, mount_id = 1612, cond = 'loyalmagmammoth',
                continent = "dragonisles", for_sort = 17, zone_id = 2022, expansion = "df",
                coordzone = 2022, coordx = 37.1, coordy = 44.5, level = 70, 
            },
        },
    },
	[192791] = { -- Plainswalker Bearer
        spell_id = 374196,
        from = {
            {
                itemname = 'Plainswalker Bearer', type = 'treasure', customnpcName = '马鲁克狩猎奖赏', cond = 'MaruukHuntSpoils', mount_id = 1635,
                continent = "dragonisles", for_sort = 17, zone_id = 2023, expansion = 'df',
                level = 70, 
            },
        },
    },
	[198873] = { -- Ivory Trader's Ottuk
        spell_id = 376879,
        from = {
            {
                itemname = "Ivory Trader's Ottuk", type = 'vendor', npc_id = 199448, mount_id = 1658,
                continent = "dragonisles", for_sort = 17, zone_id = 2024, expansion = "df",
                coordzone = 2024, coordx = 14, coordy = 49.6, level = 70, 
            },
        },
    },
	[198809] = { -- Armored Vorquin Leystrider
        spell_id = 385131,
        from = {
            {
                itemname = "Armored Vorquin Leystrider", type = 'vendor', npc_id = 196637, mount_id = 1667, cond = 'dracthyr', cost = 80,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[198811] = { -- Swift Armored Vorquin
        spell_id = 385134,
        from = {
            {
                itemname = "Swift Armored Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1665, cond = 'dracthyr', cost = 80,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[198808] = { -- Guardian Vorquin
        spell_id = 384963,
        from = {
            {
                itemname = "Guardian Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1664, cond = 'dracthyr', cost = 80,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[198810] = { -- Majestic Armored Vorquin
        spell_id = 385115,
        from = {
            {
                itemname = "Majestic Armored Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1668, cond = 'dracthyr', cost = 80,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[201704] = { -- Sapphire Vorquin
        spell_id = 394218,
        from = {
            {
                itemname = "Sapphire Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1684, cond = 'dracthyr', cost = 40,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[201720] = { -- Bronze Vorquin
        spell_id = 394219,
        from = {
            {
                itemname = "Bronze Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1685, cond = 'dracthyr', cost = 40,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[201719] = { -- Obsidian Vorquin
        spell_id = 394220,
        from = {
            {
                itemname = "Obsidian Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1686, cond = 'dracthyr', cost = 40,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[201702] = { -- Crimson Vorquin
        spell_id = 394216,
        from = {
            {
                itemname = "Crimson Vorquin", type = 'vendor', npc_id = 196637, mount_id = 1683, cond = 'dracthyr', cost = 40,
                continent = "dragonisles", for_sort = 17, zone_id = 2112, expansion = "df",
                coordzone = 2112, coordx = 25.6, coordy = 33.8, level = 70, 
            },
        },
    },
	[204382] = { -- Noble Bruffalon
        spell_id = 349935,
        from = {
            {
                itemname = "Noble Bruffalon", type = 'vendor', npc_id = 200564, cost = 100000, currency = 'elementaloverflow',
                continent = "dragonisles", for_sort = 17, zone_id = 2151, expansion = "df",
                coordzone = 2151, coordx = 34, coordy = 59.8, level = 70, 
            },
        },
    },
	[205197] = { -- Igneous Shalewing
        spell_id = 408627,
        from = {
            {
                itemname = "Igneous Shalewing", type = 'vendor', npc_id = 203615, cost = 400, currency = 'covetedbauble',
                continent = "dragonisles", for_sort = 17, zone_id = 2133, expansion = "df",
                coordzone = 2133, coordx = 55.8, coordy = 55.4, level = 70, 
            },
        },
    },
	[191838] = { -- Subterranean Magmammoth
        spell_id = 371176,
        from = {
            {
                itemname = "Subterranean Magmammoth", type = 'vendor', npc_id = 203615, cost = 100, currency = 'covetedbauble',
                continent = "dragonisles", for_sort = 17, zone_id = 2133, expansion = "df",
                coordzone = 2133, coordx = 55.8, coordy = 55.4, level = 70, 
            },
        },
    },
	[205207] = { -- Morsel Sniffer
        spell_id = 408655,
        from = {
            {
                itemname = "Morsel Sniffer Reins", type = 'vendor', npc_id = 202468, cost = 800,  currency = 'covetedbauble', cond = 'renown_18',
                continent = "dragonisles", for_sort = 17, zone_id = 2133, expansion = "df",
                coordzone = 2133, coordx = 56.4, coordy = 55.6, level = 70, 
            },
        },
    },
	[205209] = { -- Boulder Hauler
        spell_id = 408653,
        from = {
            {
                itemname = "Boulder Hauler Reins", type = 'vendor', npc_id = 204693, cost = 170, currency = 'barterbrick',
                continent = "dragonisles", for_sort = 17, zone_id = 2133, expansion = "df",
                coordzone = 2133, coordx = 58, coordy = 53.8, level = 70, 
            },
        },
    },
    [205203] = { -- Cobalt Shalewing
        spell_id = 408647,
        from = {
            {
                itemname = "Cobalt Shalewing", type = 'rare', npc_id = 203625, 
                continent = "dragonisles", for_sort = 17, zone_id = 2133, expansion = "df",
                coordzone = 2133, coordx = 42.56, coordy = 65.72, level = 70, 
            },
        },
    },
	[198824] = { -- Duskwing Ohuna
        spell_id = 385262,
        from = {
            {
                itemname = "Duskwing Ohuna", type = 'vendor', npc_id = 210608, cost = 1000, currency = 'dreamsurgecoalescence',
                continent = "dragonisles", for_sort = 19, zone_id = 2023, expansion = "df",
                coordzone = 2023, coordx = 64, coordy = 41.6, level = 70, 
            },
        },
    },
	[210969] = { -- Salatrancer
        spell_id = 427724,
        from = {
            {
                itemname = "Salatrancer", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
	[210831] = { -- Delugen
        spell_id = 427222,
        from = {
            {
                itemname = "Delugen", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
	[210948] = { -- Imagiwing
        spell_id = 427549,
        from = {
            {
                itemname = "Imagiwing", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
	[210946] = { -- Mammyth
        spell_id = 427546,
        from = {
            {
                itemname = "Mammyth", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
	[210945] = { -- Stargrazer
        spell_id = 427226,
        from = {
            {
                itemname = "Stargrazer", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
	[210833] = { -- Talont
        spell_id = 427224,
        from = {
            {
                itemname = "Talont", type = 'vendor', npc_id = 211209, cost = 1, currency = 'dreaminfusion',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.8, level = 70, 
            },
        },
    },
    [210774] = { -- Ochre Dreamtalon
        spell_id = 427041,
        from = {
            {
                itemname = "Reins of the Ochre Dreamtalon", type = 'quest', quest_id = 77762, cond = 'ochredreamtalon',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 48.68, coordy = 67.69, level = 70,
            },
        },
    },
    [425338] = { -- Flourishing Whimsydrake
        spell_id = 427041,
        from = {
            {
                itemname = "Flourishing Whimsydrake", type = 'quest', quest_id = 76318,
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2023, coordx = 18.6, coordy = 51.8, level = 70,
            },
        },
    },
	[210059] = { -- Winter Night Dreamsaber
        spell_id = 424476,
        from = {
            {
                itemname = 'Reins of the Winter Night Dreamsaber', type = 'treasure', customnpcName = '梦境之种秘宝', cond = 'EmeraldBounties',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = 'df',
                level = 70, 
            },
        },
    },
	[423891] = { -- Lunar Dreamstag
        spell_id = 427724,
        from = {
            {
                itemname = "Reins of the Lunar Dreamstag", type = 'vendor', npc_id = 208156, cost = 1200, curr = "dfsupplies", cond = 'renown_17',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.6, level = 70, 
            },
        },
    },
	[209949] = { -- Suntouched Dreamstag
        spell_id = 423873,
        from = {
            {
                itemname = "Reins of the Suntouched Dreamstag", type = 'vendor', npc_id = 208156, cost = 1200, curr = "dfsupplies", cond = 'renown_17',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 50.2, coordy = 61.6, level = 70, 
            },
        },
    },
	[210775] = { -- Snowfluff Dreamtalon
        spell_id = 427043,
        from = {
            {
                itemname = "Reins of the Snowfluff Dreamtalon", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
	[209947] = { -- Blossoming Dreamstag
        spell_id = 423871,
        from = {
            {
                itemname = "Reins of the Blossoming Dreamstag", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
	[210058] = { -- Evening Sun Dreamsaber
        spell_id = 424479,
        from = {
            {
                itemname = "Reins of the Evening Sun Dreamsaber", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
	[210057] = { -- Morning Flourish Dreamsaber
        spell_id = 424482,
        from = {
            {
                itemname = "Reins of the Morning Flourish Dreamsaber", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
	[210769] = { -- Springtide Dreamtalon
        spell_id = 426955,
        from = {
            {
                itemname = "Reins of the Springtide Dreamtalon", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
	[209950] = { -- Rekindled Dreamstag
        spell_id = 423877,
        from = {
            {
                itemname = "Reins of the Rekindled Dreamstag", type = 'vendor', npc_id = 212797, cost = 1, currency = 'seedbloom', cond = 'renown_18',
                continent = "dragonisles", for_sort = 20, zone_id = 2200, expansion = "df",
                coordzone = 2200, coordx = 49.8, coordy = 62.2, level = 70, 
            },
        },
    },
    [221765] = { -- Stonevault Mechsuit
        spell_id = 442358,
        from = {
            {
                itemname = "Malfunctioning Mechsuit", type = 'dungeon', subtype = 'mythic', npc_id = 213119,
                continent = "khazalgar", for_sort = 21, zone_id = 2341, expansion = "tww",
                coordzone = 2214, coordx = 47, coordy = 9, level = 80, 
            },
        },
    },
    [225548] = { -- Wick's Lead
        spell_id = 449264,
        from = {
            {
                itemname = "Stonevault Mechsuit", type = 'dungeon', subtype = 'mythic', npc_id = 210797,
                continent = "khazalgar", for_sort = 21, zone_id = 2303, expansion = "tww",
                coordzone = 2214, coordx = 60, coordy = 21, level = 80, 
            },
        },
    },
    [223270] = { -- Alunira
        spell_id = 447213,
        from = {
            {
                itemname = "Alunira", type = 'rare', npc_id = 219281, 
                continent = "khazalgar", for_sort = 21, zone_id = 2248, expansion = "tww",
                coordzone = 2248, coordx = 23.2, coordy = 58.2, level = 80, 
            },
        },
    },
    [223315] = { -- Beledar's Spawn
        spell_id = 448941,
        from = {
            {
                itemname = "Beledar's Spawn", type = 'rare', npc_id = 207802, 
                continent = "khazalgar", for_sort = 21, zone_id = 2215, expansion = "tww",
                coordzone = 2215, coordx = 58.6, coordy = 48.8, level = 80, 
            },
        },
    },
    [223501] = { -- Ol' Mole Rufus
        spell_id = 449258,
        from = {
            {
                itemname = "Regurgitated Mole Reins", type = 'rare', npc_id = 220285, 
                continent = "khazalgar", for_sort = 21, zone_id = 2214, expansion = "tww",
                coordzone = 2214, coordx = 60.8, coordy = 76.6, level = 80, 
            },
        },
    },
    [225952] = { -- Siesbarg
        spell_id = 451489,
        from = {
            {
                itemname = "Vial of Tka'ktath's Blood", type = 'rare', npc_id = 216046, 
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 65.8, coordy = 70.4, level = 80, 
            },
        },
    },
	[223153] = { -- Soaring Meaderbee
        spell_id = 447151,
        from = {
            {
                itemname = "Reins of the Soaring Meaderbee", type = 'vendor', npc_id = 226205, cost = 900, currency = 'cinderpollen',
                continent = "khazalgar", for_sort = 21, zone_id = 2248, expansion = "tww",
                coordzone = 2248, coordx = 74.4, coordy = 45.2, level = 80, 
            },
        },
    },
	[223505] = { -- Crimson Mudnose
        spell_id = 449269,
        from = {
            {
                itemname = "Crimson Mudnose", type = 'vendor', npc_id = 221390, cost = 8125, currency = 'resonancecrystal', cond = 'renown_19',
                continent = "khazalgar", for_sort = 21, zone_id = 2214, expansion = "tww",
                coordzone = 2214, coordx = 47.2, coordy = 32.8, level = 80, 
            },
        },
    },
	[222989] = { -- Cyan Glowmite
        spell_id = 447176,
        from = {
            {
                itemname = "Cyan Glowmite", type = 'vendor', npc_id = 221390, cost = 11375, currency = 'resonancecrystal', cond = 'renown_23',
                continent = "khazalgar", for_sort = 21, zone_id = 2214, expansion = "tww",
                coordzone = 2214, coordx = 47.2, coordy = 32.8, level = 80, 
            },
        },
    },
	[223317] = { -- Vermillion Imperial Lynx
        spell_id = 448978,
        from = {
            {
                itemname = "Vermillion Imperial Lynx", type = 'vendor', npc_id = 213145, cost = 8125, currency = 'resonancecrystal', cond = 'renown_18',
                continent = "khazalgar", for_sort = 21, zone_id = 2215, expansion = "tww",
                coordzone = 2215, coordx = 42.4, coordy = 55, level = 80, 
            },
        },
    },
	[223314] = { -- Shackled Shadow
        spell_id = 448939,
        from = {
            {
                itemname = "Shackled Shadow", type = 'vendor', npc_id = 213145, cost = 11375, currency = 'resonancecrystal', cond = 'renown_23',
                continent = "khazalgar", for_sort = 21, zone_id = 2215, expansion = "tww",
                coordzone = 2215, coordx = 42.4, coordy = 55, level = 80, 
            },
        },
    },
	[223571] = { -- Shale Ramolith
        spell_id = 449418,
        from = {
            {
                itemname = "Shale Ramolith", type = 'vendor', npc_id = 223728, cost = 8125, currency = 'resonancecrystal', cond = 'renown_21',
                continent = "khazalgar", for_sort = 21, zone_id = 2339, expansion = "tww",
                coordzone = 2339, coordx = 39.2, coordy = 24.2, level = 80, 
            },
        },
    },
	[221753] = { -- Smoldering Cinderbee
        spell_id = 447057,
        from = {
            {
                itemname = "Smoldering Cinderbee", type = 'vendor', npc_id = 223728, cost = 11375, currency = 'resonancecrystal', cond = 'renown_23',
                continent = "khazalgar", for_sort = 21, zone_id = 2339, expansion = "tww",
                coordzone = 2339, coordx = 39.2, coordy = 24.2, level = 80, 
            },
        },
    },
	[223274] = { -- Ferocious Jawcrawler
        spell_id = 447957,
        from = {
            {
                itemname = "Ferocious Jawcrawler", type = 'vendor', npc_id = 220867, cost = 2815, currency = 'kej', cond = 'renown_18',
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 55.2, coordy = 41.2, level = 80, 
            },
        },
    },
	[223264] = { -- Aquamarine Swarmite
        spell_id = 447185,
        from = {
            {
                itemname = "Aquamarine Swarmite", type = 'vendor', npc_id = 220867, cost = 3940, currency = 'kej', cond = 'renown_23',
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 55.2, coordy = 41.2, level = 80, 
            },
        },
    },
	[223278] = { -- Heritage Undercrawler
        spell_id = 448685,
        from = {
            {
                itemname = "Heritage Undercrawler", type = 'vendor', npc_id = 228184, cost = 2020, currency = 'kej', cond = 'renown_conspirator',
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 55.2, coordy = 41.4, level = 80, 
            },
        },
    },
	[223279] = { -- Royal Court Undercrawler
        spell_id = 448689,
        from = {
            {
                itemname = "Royal Court Undercrawler", type = 'vendor', npc_id = 228184, cost = 2020, currency = 'kej', cond = 'renown_conspirator',
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 55.2, coordy = 41.4, level = 80, 
            },
        },
    },
	[223276] = { -- Widow's Undercrawler
        spell_id = 448680,
        from = {
            {
                itemname = "Widow's Undercrawler", type = 'vendor', npc_id = 228184, cost = 2020, currency = 'kej', cond = 'renown_conspirator',
                continent = "khazalgar", for_sort = 21, zone_id = 2255, expansion = "tww",
                coordzone = 2255, coordx = 55.2, coordy = 41.4, level = 80, 
            },
        },
    },
	[223318] = { -- Dauntless Imperial Lynx
        spell_id = 448979,
        from = {
            {
                itemname = "Dauntless Imperial Lynx", type = 'event', npc_id = -1,
                continent = "khazalgar", for_sort = 21, zone_id = 2215, expansion = "tww",
                coordzone = 2215, coordx = 63, coordy = 32, level = 80, 
            },
        },
    },
	[223269] = { -- Machine Defense Unit 1-11
        spell_id = 448188,
        from = {
            {
                itemname = "Machine Defense Unit 1-11", type = 'event', npc_id = -2,
                continent = "khazalgar", for_sort = 21, zone_id = 2214, expansion = "tww",
                coordzone = 2214, coordx = 47.5, coordy = 31.5, level = 80, 
            },
        },
    },
}