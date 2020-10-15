--[[ structure:
    [uiMapID] = {
        [coord] = {
            label = [string],  -- label: text that'll be the label
            text = [string],  -- some text which might be helpful
            npc = [string],  -- primary npc at the location

         -- Alliance
            alliance = [boolean], -- ICON part of the alliance war effort
            astronghold = [boolean], -- ICON an Alliance keep or stronghold
            ainn = [boolean], -- ICON an Alliance inn
            tower = [boolean], -- ICON a tower
            roundtower = [boolean], -- ICON round high elf mage

         -- Horde
            horde = [boolean], -- ICON part of the horde war effort
            hstronghold = [boolean], -- ICON a Horde keep or stronghold
            hinn = [boolean], -- ICON a Horde inn
            hmagic = [boolean], -- ICON horde magic building

         -- Neutral
            neutral = [boolean], -- ICON for a neutral location
            nstronghold = [boolean]; -- ICON neutral stronghold

         -- Camp
            camp = [boolean], -- ICON official camp
            tent = [boolean], -- ICON tents 
            medic = [boolean], -- ICON location for medics
            leader = [boolean], -- ICON location for leadership
            supplies = [boolean], -- ICON 
            repairs = [boolean], -- ICON
            mining = [boolean], -- ICON
            alchemy = [boolean], -- ICON
            inn = [boolean], -- ICON
            magic = [boolean], -- ICON
            barracks = [boolean], -- ICON
            

         -- Villain
            skull = [boolean], -- villains
            ziggeraut = [boolean], -- ziggeraut floating or crashed
            boss = [boolean], -- large boss skull
            skullblood = [boolean], -- ICON boss with decor
            skullfrost = [boolean], -- ICON boss with decor
            skullshadow = [boolean], -- ICON boss with decor
            skullvoid = [boolean], -- ICON boss with decor
            abomination = [boolean], -- ICON boss with decor
            lich = [boolean], -- ICON boss with decor
            necromancer = [boolean], -- ICON boss with decor
            skeleton = [boolean], -- ICON boss with decor
            knight = [boolean], -- ICON boss with decor

         -- Events
            npc = "String", -- Dungeon Master name
            
            Pick only one of the following:
            event = [boolean], -- ICON event location
            battle = [boolean], -- ICON battle event location
            naval = [boolean], -- ICON water/vehicle fight location
            horror = [boolean], -- ICON horror event location
            magical = [boolean], -- ICON magical investigation event location
            medical = [boolean], -- ICON medical event location
            report = [boolean], -- ICON escort/report event location
            stealth = [boolean], -- ICON stealth/scout event location

            eventtype = "String", -- type of event: battle, scouting, medic, horror, etc
            attendee = [int], -- max number of attendees
            schedule = "String", -- date, time
            hevent = [boolean], -- Horde faction event
            aevent = [boolean], -- Alliance faction event
            nevent = [boolean], -- Neutral faction event
            phasing = "String.", -- provide phasing info

            campaigntype = "String.", description for larger continent
            wclogo = big logo for corners

         -- Vehicles
            ship = [enum],    -- ICON the size of the ship, LARGE, MEDIUM, SMALL, WRECK, BOAT, SAILBOAT, or LANDING
            allianceair = [boolean]  -- ICON airship
            hordeair = [boolean]  -- ICON airship
            docks = [boolean], -- ICON docks
            tank = [boolean], -- ICON tank

         -- modifiers
            empty = [boolean], -- if empty (no npcs at all)
            hostile = [boolean], -- if occupied by hostile NPCs
            closed = [boolean], -- if the door is closed / building not enterable
            novendor = [boolean], -- if there's no player-friendly vendor

         -- type of building (determines map icon)
            alcohol = [boolean], -- if a bar (serves alcohol)
            cuisine = [string],  -- if a restaurant, what kind of food?
            wares = [string],  -- if sells items, either IC or in game
            official = [boolean], -- if an official building
            basement = [boolean], -- if a basement or cellar

         -- counts (icons)
            beds = [int],     -- number of beds in the building, optional
            tables = [int],     -- number of empty tables, optional
            seats = [int],     -- number of empty seats, optional
            maxseats = [int],     -- size of the largest table
            animals = [int],     -- number of pettable animals
            floors = [int],     -- number of floors
            decks = [int],     -- number of decks on a ship

        },
    },
    --]]

-- -------------------------------------------------------------------------------------------------------------------
local myname, ns = ...

local C = ns.CONST;
local arrow = ns.textures.arrow;

if not ns.points then ns.points = {} end;
-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.DRAGONBLIGHT] = { -- Dragonblight

   [15508270] = { label = "Warcraft Conquest Campaign",         wclogo = true, text = "This map has Warcraft Conquest campaign information. Hover over icons for camps and events. Use /wconquest to find links for more information.", },

-- -------------------------------------------------------------------------------------------------------------------
-- Events
-- -------------------------------------------------------------------------------------------------------------------
   [48787250] = { label = "Risen Kraken of Moa'ki",             naval = true, npc = "Vehicle Battle Team", text = "(Example) Coalition forces seek landfall in the bay, facing off with risen dead and krakens.", eventtype = "Vehicle battle, Discord", attendee = 15, schedule = "Monday, Sept 7th, 8pm", nevent= true,},
   [85664735] = { label = "Culling of Carrion",                 battle = true, npc = "Sellony", text = "(Example) Within the hollows of Carrion Fields, a fetid lord and its spies watch too closely. End their forces and learn what you can of their plans.", eventtype = "Battle, scouting", attendee = 10, schedule = "Tuesday, Sept 8th, 8pm", aevent = true, },
   [55853751] = { label = "Frost Wyrm Flights",                 battle = true, npc = "Sonceri", text = "(Example) For the coming battles, we need stronger forces. Rally and collect the bones of dragons, and protect the necromancers to raise a legion of flights!", eventtype = "Battle, supplies, escort", attendee = 20, schedule = "Wednesday, Sept 9th, 8pm", hevent = true, },
   [68484662] = { label = "Frigid Fields of Woe",               tank = true, npc = "Vehicle Battle Team", text = "(Example) A terror rumbles through the plains with hulking abominations...the skies darkening with deathly wyrms...TO THE TANKS!", eventtype = "Vehicle battle, Discord", attendee = 15, schedule = "Thursday, Sept 10th, 8pm", nevent= true,},

   -- -------------------------------------------------------------------------------------------------------------------
-- Neutral Locations
-- -------------------------------------------------------------------------------------------------------------------
   [83392647] = { label = "Light's Trust",                      neutral = true, text = "The Argent Crusade stands in this small camp", npc = "Crusader Valus", },

-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Locations
-- -------------------------------------------------------------------------------------------------------------------
   [76764763] = { label = "Wintergarde Keep",                    astronghold = true, floors = 3, seats = 7, tables = 2, maxseats = 4, text = "Alliance war headquarters with meeting hall and brig.", npc = "Commander Eligor Dawnbringer", },
   [77415140] = { label = "Wintergarde Inn",                     inn = true, floors = 3, seats = 8, beds = 4, tables = 5, maxseats = 3, text = "Inn with a bar, kitchen, and beds.", phasing = "Complete Naxxramas and the Fall of Wintergarde.", },
   [77905026] = { label = "Siegeworks",                          engineering = true, npc = "Siege Engineer Quarterflash", text = "Repairs for armor, weapons, and more.", },
   [79064752] = { label = "Medics",                              medic = true, text = "Healing and care, fighting to save lives.", npc = "Zielig the Visionary", },
   [78974532] = { label = "Circle of Battlemagi",                magic = true, floors = 1, text = "Center of magic", npc = "Vas the Unstable", },
   [89684670] = { label = "Cannons",                             text = "Line of cannons ready to fight", atlas = "Vehicle-Ground-Occupied", scale = 1.50,},
   [39032704] = { label = "Fordragon Hold",                      astronghold = true, text = "Battlecamp of the Alliance with towers and camp", },
   [37202540] = { label = "Alliance Camps",                      camp = true, text = "Tents and provisions in a camp",},
   [39722452] = { label = "Cannons",                             text = "Line of cannons ready to fight", atlas = "Vehicle-Ground-Occupied", scale = 1.50,},
   [29005626] = { label = "Star's Rest",                         roundtent = true, text = "Night elven outpost set in ruins", npc = "Commander Saia Azuresteel", },
   [29515496] = { label = "Glaive Throwers",                     alliance = true, text = "Glaives set to defend the post", npc = "Sentinel Amberline", atlas = "Vehicle-Ground-Occupied", scale = 1.50,},
-- -------------------------------------------------------------------------------------------------------------------
-- Horde Locations
-- -------------------------------------------------------------------------------------------------------------------
   [38354634] = { label = "Agmar's Hammer Stronghold",           hstronghold = true, floors = 3, text = "Horde headquarters with war hall, barracks, and tower.", npc = "Overlord Agmar", beds = 12,  },
   [36434540] = { label = "Horde Supplies",                      supplies = true, text = "Horde supplies for expeditions and battle, General goods, herbs, poisons, and more. ", },
   [36624716] = { label = "Siegeworks",                          repairs = true, trainer = "Blacksmithing", npc = "Borus Ironbender",  text = "Repairs for armor, weapons, and more.", },
   [35644657] = { label = "Medics",                              medic = true, text = "Healing and care, fighting to save lives.", npc = "Greatmother Icemist", },
   [36544934] = { label = "Apothecaries",                        alchemy = true, npc = "Dr. Sintar Malefious", text = "Alchemists and blight of the Horde", },
   [35814838] = { label = "Kor'kron Guard",                      horde = true, npc = "Captain Gort", text = "Tower of the Kor'kron guard, ready for battle.", atlas = "GarrLanding-MinimapIcon-Horde-Up", scale = 1.50, },
   [41811634] = { label = "Kor'kron Vanguard",                   hstronghold = true, text = "Battlecamp of the Horde with towers and camp", },
   [41181863] = { label = "Kor'Kron Catapults",                  horde = true, text = "Catapults and buzzsaw weapons", atlas = "Vehicle-Ground-Occupied", scale = 1.50, },
   [76096136] = { label = "Venomspite",                          horde = true, text = "Village of Venomespite, held by the Forsaken", npc = "High Executor Wroth", atlas = "GarrBuilding_Alchemy_3_H_Info", scale = 2.0, floors = 2, beds = 1, },
   [77006280] = { label = "Vile Tower",                          alchemy = true, npc = "Chief Plaguebringer Middleton", text = "Alchemists and blight of the Horde", floors = 2, },
   [78256084] = { label = "Venomspite Catapults",                horde = true, text = "Catapults and blight throwers", atlas = "Vehicle-Ground-Occupied", scale = 1.50, },
   [13374761] = { label = "Westwind Refugee Camp",               horde = true, text = "Taunka village with 5 buildings, some tents, and fortifications", atlas = "GarrBuilding_MageTower_2_H_Info", scale = 2.30, },

-- -------------------------------------------------------------------------------------------------------------------
-- Villain Locations
-- -------------------------------------------------------------------------------------------------------------------
   [71577252] = { label = "New Hearthglen",                      scarlet = true, npc = "High Abbot Landgren, High General Abbendus", text = "Height of the Scarlet Onslaught, the walled outpost includes a cathedral, stronghold, and support to wage a bloody war.", },
   [70967726] = { label = "High General",                        skull = true, text = "Cathedral of the Scarlet Onslaught.", },
   [73437439] = { label = "High Abbot",                          skull = true, text = "Inner cloister of the Scarlet Onslaught.", },
   [70197198] = { label = "Scarlet Command",                     skull = true, text = "Stronghold of the Scarlet Onslaught.", },
   [72198230] = { label = "Scarlet Docks",                       docks = true, text = "Secured docks for the Scarlet Onslaught.", },
   [82016843] = { label = "The Forgotten Shore",                 skullfrost = true, text = "The dead patrol these shores, marked by the drowned and damned", },
   [83365122] = { label = "The Carrion Fields",                  abomination = true, text = "The risen dead continue to patrol and toil towards unknown goals", npc = "Turgid the Vile", },
   [88992720] = { label = "Jintha'kalar",                        necromancer = true, text = "Necromancers raise the dead in unhold ceremonies", npc = "Overseer Deathgaze", },
   [54393153] = { label = "Thiassi The Lightning Bringer",       skullshadow = true, text = "Flesh hangs from the risen brother of Gymer, king of storm giants.", },
   [78605287] = { label = "Wintergarde Crypt",                   necromancer = true, text = "Depths of darkness and whispers yawns into the earth, tombs broken, and the dead risen.", npc = "Necrolord Amarion", },sw

}; -- /Dragonblight
-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.ICECROWN] = { -- Icecrown
-- -------------------------------------------------------------------------------------------------------------------
--   [14608000] = { label = "Warcraft Conquest",                  logo = true, text = "This is a campaign map for Warcraft Conquest of Moon Guard US.", },
-- -------------------------------------------------------------------------------------------------------------------
-- Coalition Locations
-- -------------------------------------------------------------------------------------------------------------------
   [89307900] = { label = "Argent Vanguard",                     camp = true, text = "Neutral camp for a large force", },
   [86787681] = { label = "Argent Medics",                       medic = true, text = "Medics tents and facilities", npc = "Father Gustav", },
   [85977721] = { label = "Ballista",                            text = "Two ballista ready to fight", atlas = "Vehicle-Ground-Occupied", scale = 1.50, },
   [87217913] = { label = "Drakes and stables",                  text = "Stables of drakes and horses ready for battle", atlas = "Vehicle-Ground-Occupied", scale = 1.50, },
   [79257238] = { label = "Crusader's Pinnacle",                 nstronghold = true, text = "Forward position for Neutral forces with tents, a tower, and cannons", floors = 2, },
   [86007397] = { label = "Argent Vanguard",                     neutral = true, text = "Coalition position in Icecrown", },

   [44622051] = { label = "The Shadow Vault",                    vault = true, text = "Claimed by the Ebon Blade, the chambers provide sancturary and a battle front for the death knights of Icecrown. It holds runeforges, goods, and a base.", npc = "Baron Silver",  },

-- -------------------------------------------------------------------------------------------------------------------
-- Villain Locations
-- -------------------------------------------------------------------------------------------------------------------
   [80086118] = { label = "Scourgeholme Temple",                 skull = true, text = "Ziggeraut of death, with a large chamber for a boss or event", phasing = "Argent Crusade quests phase this area.", },
   [77296190] = { label = "Scourgeholme Chamber",                skull = true, text = "Grand chamber of the scourge, with a large chamber for a boss or event", phasing = "Argent Crusade quests phase this area.", },
   [79306418] = { label = "Scourgeholme Priest",                 skull = true, text = "Single chamber with a death priest", phasing = "Argent Crusade quests phase this area.", },
   [77286810] = { label = "Scourgeholme Priest",                 skull = true, text = "Single chamber with a death priest", phasing = "Argent Crusade quests phase this area.", },

   [77446526] = { label = "Scourgeholme Altar",                  skull = true, text = "Summoning altar of the scourge", atlas = "ArtifactsFX-Whirls-Purple", scale = 1.75, phasing = "Argent Crusade quests phase this area.", },
   [77446528] = { label = "Scourgeholme Altar",                  skull = true, text = "Summoning altar of the scourge", atlas = "Rune-06-purple", scale = 1.50, phasing = "Argent Crusade quests phase this area.", },

   [62706203] = { label = "Mord'rethar: The Death Gate",         skullvoid = true, text = "Grand chamber of death, plague, and corpse machines. It stands as the first line of Scourage power and defense.",  },
   [43387837] = { label = "Cathedral of Darkness",               skullblood = true, text = "A terrifying cathedral of blood sacrifice and chosen zealots offering faith to the night.", npc = " High Invoker Basaleph", },
   [54143045] = { label = "Dark Summoning Circle",               skullfel = true, text = "Mass summoning circle of darkness, surrounded by channelers and summoners.",  },
   [49303374] = { label = "Dark Plague and Alchemists",          skullfel = true, text = "Plague cauldrons, alchemists, and dark apothecaries toil endlessly.", },
   [51942875] = { label = "Aldur'thar: The Desolation Gate",     skullshadow = true, text = "Grand altars and sacrifices, surrounded by shadow channelers, researchers, and libraries", },

   [61502303] = { label = "The Black Knight",                    knight = true, text = "The cults seek to regain one of their champions clad in blackened armor.", },

   [61432035] = { label = "Deathspeaker's Watch",                skull = true, text = "The Cult of the Damned gather, pray, and practice their dark arts. Prisoners wallow in cages, awaiting their turn upon the pyres.", atlas = "ArtifactsFX-Whirls-Purple", scale = 1.75,},
   [61432033] = { label = "Deathspeaker's Watch",                skull = true, text = "The Cult of the Damned gather, pray, and practice their dark arts. Prisoners wallow in cages, awaiting their turn upon the pyres.", atlas = "Rune-06-purple", scale = 1.50,},

   [38843921] = { label = "Weeping Quarry",                      mining = true, text = "Saronite and stone mining manned by the Scourge. They have dug deep, perhaps too far.", },

   [33776897] = { label = "The Fleshwerks",                      skullblood = true, text = "The Scourge use this large facility to craft Abominations and Flesh Giants.", phasing = "He's Gone to Pieces quest puts this in a phase. Blackwatch quest hub.", },

   [36786779] = { label = "Sanctum of Reanimation",              skull = true, text = "In the depths of a cave, labratories and altars knit together the dead.", phasing = "He's Gone to Pieces quest puts this in a phase. Blackwatch quest hub.", },
}; -- Icecrown
-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.BOREANTUNDRA] = { -- Borean Tundra
-- -------------------------------------------------------------------------------------------------------------------

[15508270] = { label = "Warcraft Conquest Campaign", wclogo = true, text = "This map has Warcraft Conquest campaign information. Hover over icons for camps and events. Use /wconquest to find links for more information.", },

-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Locations
-- -------------------------------------------------------------------------------------------------------------------
   [56707150] = { label = "Valiance Keep",                       astronghold = true, floors = 3, seats = 7, tables = 2, maxseats = 4, text = "Alliance war headquarters with meeting hall, brig, and dock.", },
   [58527000] = { label = "Valiant Rest",                        inn = true, floors = 3, seats = 8, beds = 4, tables = 5, maxseats = 3, text = "Inn with a bar, kitchen, and beds.", },
   [57256648] = { label = "Strongstout Smithy",                  repairs = true, trainer = "Blacksmithing", npc = "Argo Strongstout", text = "Repairs for armor, weapons, and more.", },
   [58246613] = { label = "Practice Yard",                       alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.10, text = "Practice yards for melee and ranged.", },
   [60416984] = { label = "Valiant Docks",                       docks = true, text = "Alliance docks and harbor.", },
   [57555913] = { label = "Farshire",                            alliance = true, atlas = "GarrBuilding_TownHall_2_A_Info", scale = 2.00, text = "Townhall, lighthouse, farms, and mines to aid the Alliance.", seats = 3, floors = 2, },
   [57501901] = { label = "Fizzcrank Airstrip",                  text = "Alliance engineering corps and airstrip.", atlas = "GarrBuilding_Workshop_1_A_Info", scale = 2.0, },
   [56452001] = { label = "Chief Engineer Galpen Rolltie",       engineering = true, trainer = "Engineering",  text = "Master chief of engineering", },

-- -------------------------------------------------------------------------------------------------------------------
-- Horde Locations
-- -------------------------------------------------------------------------------------------------------------------
   [40305190] = { label = "Warsong Hold",                        hstronghold = true, floors = 3, text = "Horde headquarters with war hall, brig, and zepplin", },
   [42625294] = { label = "Warsong Engineering Bay",             engineering = true, npc = "Chief Engineer Leveny", text = "Metalworking, engineering, and bombs, lower floor of Warsong Hold.", },
   [41005557] = { label = "Warsong Smithy",                      repairs = true, trainer = "Blacksmithing", npc = "Armorer Orkuruk", text = "Repairs for armor, weapons, and more", },
   [40185510] = { label = "Warsong Stables",                     horde = true, npc = "Durkot Wolfbrother",  atlas = "WildBattlePet",  scale = 1.1, text = "Worgs for the Horde", },
   [49531027] = { label = "Bor'gorok Outpost",                   horde = true, text = "Horde outpost with provisions and wolf riders", atlas = "GarrBuilding_TownHall_2_H_Info", scale = 2.0, },
   [75783680] = { label = "Taunka'le Village",                   horde = true, text = "Taunka village with a central, stable, shaman, and druid halls.", npc = "Chieftain Wintergale", atlas = "GarrBuilding_MageTower_2_H_Info", scale = 2.00, },
   [77593680] = { label = "Druid Hall",                          horde = true, text = "Druid hall", npc = "Greatmother Taiga", atlas = "groupfinder-icon-class-druid", scale = 1.40,},
   [77383915] = { label = "Shaman Hall",                         horde = true, text = "Shaman hall of elements", npc = "Sage of Earth and Sky", atlas = "groupfinder-icon-class-shaman",  scale = 1.40, },
   

-- -------------------------------------------------------------------------------------------------------------------
-- Villain Locations
-- -------------------------------------------------------------------------------------------------------------------
   [88092093] = { label = "Spire of Blood",                      skull = true, text = "Terrifying temple and altar of blood, filled with the cries of the dying and hungering.", npc = "High Priest Andorath",  },
   [83892053] = { label = "Spire of Decay",                      skull = true, text = "Terrifying temple and altar of undeath, whispering with howls of the forgotten and lost.", npc = "High Priest Naferset",  },
   [88832838] = { label = "Spire of Pain",                       skull = true, text = "Terrifying temple and altar of pain, ravaged by the bent and broken.", npc = "High Priest Talet-Kha",  },

   [86932998] = { label = "Ziggeraut of En'kilah",               ziggeraut = true, text = "Floating ziggeraut with a summoning portal on top, no access within.", },
   [69331500] = { label = "Talramas",                            ziggeraut = true, text = "Crashed ziggeraut teeming with the unhollowed, piecing together brethren from the fallen.", npc = "Lich Lord Chillwinter", floors = 3, },
   [84684086] = { label = "The Wailing Ziggeraut",               ziggeraut = true, text = "Terrifying ziggeraut of cultists and death.", },

}; -- Borean Tundra

-- -------------------------------------------------------------------------------------------------------------------
-- Make Indices
-- -------------------------------------------------------------------------------------------------------------------
if not ns.index then ns.index = {} end;
ns.index[C.ZONES.DRAGONBLIGHT] = ns.utils.points.index(ns.points[C.ZONES.DRAGONBLIGHT]);
ns.index[C.ZONES.ICECROWN] = ns.utils.points.index(ns.points[C.ZONES.ICECROWN]);
ns.index[C.ZONES.BOREANTUNDRA]  = ns.utils.points.index(ns.points[C.ZONES.BOREANTUNDRA]);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Dalaran map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.DRAGONBLIGHT], C.ZONES.DRAGONBLIGHT);
ns.utils.points.translate(ns.points[C.ZONES.ICECROWN], C.ZONES.ICECROWN);
ns.utils.points.translate(ns.points[C.ZONES.BOREANTUNDRA],  C.ZONES.BOREANTUNDRA);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Dragonblight map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.ICECROWN], C.ZONES.ICECROWN, C.ZONES.DRAGONBLIGHT);
ns.utils.points.translate(ns.points[C.ZONES.BOREANTUNDRA],  C.ZONES.BOREANTUNDRA, C.ZONES.DRAGONBLIGHT);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Icecrown map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.DRAGONBLIGHT], C.ZONES.DRAGONBLIGHT, C.ZONES.ICECROWN);
ns.utils.points.translate(ns.points[C.ZONES.BOREANTUNDRA],  C.ZONES.BOREANTUNDRA,  C.ZONES.ICECROWN);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Borean Tundra map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.DRAGONBLIGHT], C.ZONES.DRAGONBLIGHT, C.ZONES.BOREANTUNDRA);
ns.utils.points.translate(ns.points[C.ZONES.ICECROWN], C.ZONES.ICECROWN, C.ZONES.BOREANTUNDRA);
-- -------------------------------------------------------------------------------------------------------------------
