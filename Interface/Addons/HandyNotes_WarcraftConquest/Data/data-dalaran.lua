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

         -- Villain
            skull = [boolean], -- villains
            ziggeraut = [boolean], -- ziggeraut floating or crashed
            boss = [boolean], -- large elaborate boss image

         -- Events
            npc = "String", -- Dungeon Master name
            event = [boolean], -- ICON event location
            battle = [boolean], -- ICON battle event location
            naval = [boolean], -- ICON water/vehicle fight location
            eventtype = "String", -- type of event: battle, scouting, medic, horror, etc
            attendee = [int], -- max number of attendees
            schedule = "String", -- date, time
            hevent = [boolean], -- Horde faction event
            aevent = [boolean], -- Alliance faction event
            nevent = [boolean], -- Neutral faction event
            phasing = [string], -- provide phasing info

         -- Vehicles
            ship = [enum],    -- ICON the size of the ship, LARGE, MEDIUM, SMALL, WRECK, BOAT, SAILBOAT, or LANDING
            allianceair = [boolean]  -- ICON airship
            hordeair = [boolean]  -- ICON airship

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

if not ns.points then ns.points = {} end;

-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.DALARAN] = { -- Dalaran
-- -------------------------------------------------------------------------------------------------------------------
-- Bars/Taverns/Inns: 
-- -------------------------------------------------------------------------------------------------------------------
   [48373900] = { label = "The Legerdemain Lounge",                  alcohol = true, floors = 2, seats = 23, tables = 5, beds = 5, cuisine = "Fine foods for refined tastes.", text = "A welcoming home for those abroad. Come to rest, share tales, and tip a glass. Nice menu and soft beds.", npc = "Arille Azuregaze", },
   [68713443] = { label = "The Filthy Animal",                       alcohol = true, floors = 2, seats = 40, tables = 5, beds = 9, cuisine = "De finest troll dishes.",  text = "Eat, sleep, fight. A fine orcish establishment. Roaring fire, open troll kitchen, and a bar.", npc = "Mato", },
   [43766270] = { label = "A Hero's Welcome",                        alcohol = true, floors = 2, seats = 23, tables = 5, beds = 5, cuisine = "Hearty meals from the kingdoms.", text = "Fine hospitality awaits with tastes from Stormwind and Ironforge. Indulge in a nice meal, stay for the beer garden.", npc = "Stefan Corter", },
   [22863943] = { label = "The Purple Parlor",                       alcohol = true, floors = 1, seats = 2, tables = 2, cuisine = "Exclusive rarities.", text = "By invitation, you are welcome to a decadent evening. Arrive by portal or air, with a balcony to see the night and morn.", npc = "Alfred Copperworth", },

-- -------------------------------------------------------------------------------------------------------------------
-- Battle Centers: 
-- -------------------------------------------------------------------------------------------------------------------
   [58112030] = {label = "Sunreaver's Santuary",                     horde = true, floors = 2, scale = 2.5, text = "War headquarters for the Horde and Sunreavers with portals, supplies, and apothecary labs.", },
   [33026822] = {label = "Silver Enclave",                           alliance = true, floors = 2, scale = 2.5, text = "War headquarters for the Horde and Silver Covenant with portals, supplies, and magisters.", },

-- -------------------------------------------------------------------------------------------------------------------
-- Other
-- -------------------------------------------------------------------------------------------------------------------
   [60144788] = { label = "Down to Underbelly",                      landmark = true, atlas = "poi-door-down", scale = 1.50, text = "An entrace to sewers, and a black market...", },
   [35554527] = { label = "Down to Underbelly",                      landmark = true, atlas = "poi-door-down", scale = 1.50, text = "An entrace to sewers, and a black market...", },
}; -- /Dalaran
-- -------------------------------------------------------------------------------------------------------------------

if not ns.index then ns.index = {} end;
ns.index.DALARAN = ns.utils.points.index(ns.points[C.ZONES.DALARAN]);

