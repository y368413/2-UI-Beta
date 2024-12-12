local name,ZGV = ...

local L = ZGV.L

local Dungeons = ZGV.Dungeons

Dungeons.ExpansionsLimits = {
	[0] = 30, -- vanilla
	[1] = 30, -- tbc
	[2] = 30, -- wotlk
	[3] = 35, -- cata
	[4] = 35, -- mop
	[5] = 40, -- wod
	[6] = 45, -- legion
	[7] = 50, -- bfa
	[8] = 60, -- shadowlands
	[9] = 70, -- dragonflight
	[10] = 80, -- tww
}

Dungeons.Phases = {
	["amirdrassil1"] = true,
	["amirdrassil2"] = true,
	["amirdrassil3"] = true,
	["amirdrassil4"] = true,
}

-- Timewalks and legion mythics do not have any lfg entry, so we need to hardcode basic data for them
Dungeons.hardcoded_dungeons = {
	-- mythic mop
	["e_313_23"] = {expansionLevel=4, minLevel=70, difficulty=23, name="Temple of the Jade Dragon"},

	-- mythic legion
	["e_777_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Assault on Violet Hold"},
	["e_740_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Black Rook Hold"},
	["e_800_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Court of Stars"},
	["e_762_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Darkheart Thicket"},
	["e_716_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Eye of Azshara"},
	["e_721_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Halls of Valor"},
	["e_727_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Maw of Souls"},
	["e_767_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Neltharion's Lair"},
	["e_726_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="The Arcway"},
	["e_707_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Vault of the Wardens"},
	["e_860_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Return to Karazhan"},
	["e_900_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Cathedral of Eternal Night"},
	["e_945_23"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=170,--]] difficulty=23, name="Seat of the Triumvirate"},
	-- mythic battle for azeroth
	["e_968_23"]   = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Atal'Dazar"},
	["e_1001_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Freehold"},
	["e_1041_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Kings' Rest"},
	["e_1036_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Shrine of the Storm"},
	["e_1023_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Siege of Boralus"},
	["e_1030_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Temple of Sethraliss"},
	["e_1012_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="The MOTHERLODE!!"},
	["e_1022_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="The Underrot"},
	["e_1002_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Tol Dagor"},
	["e_1021_23"]  = {expansionLevel=7, minLevel=50, --[[min_ilevel=310,--]] difficulty=23, name="Waycrest Manor"},
	--["e_1178"]  = {expansionLevel=7, minLevel=120, min_ilevel=310, difficulty=23, name="Operation: Mechagon",  },

	-- world bosses
	["e_322_14"]  = {expansionLevel=4, minLevel=50, --[[min_ilevel=70,--]] difficulty=14, name="World Bosses"},
	["e_557_14"]  = {expansionLevel=5, minLevel=50, --[[min_ilevel=90,--]] difficulty=14, name="World Bosses"},
	["e_833_14"]  = {expansionLevel=6, minLevel=50, --[[min_ilevel=150,--]] difficulty=14, name="World Bosses"},
	["e_1028_14"] = {expansionLevel=7, minLevel=50, --[[min_ilevel=280,--]] difficulty=14, name="World Bosses"}, 

	-- mythic+
	["e_65_8"] =   {expansionLevel=3, minLevel=70, difficulty=8, name="Throne of the Tides"},
	["e_556_8"] =  {expansionLevel=5, minLevel=70, difficulty=8, name="The Everbloom"},
	["e_740_8"] =  {expansionLevel=6, minLevel=70, difficulty=8, name="Black Rook Hold"},
	["e_762_8"] =  {expansionLevel=6, minLevel=70, difficulty=8, name="Darkheart Thicket"},
	["e_968_8"] =  {expansionLevel=7, minLevel=70, difficulty=8, name="Atal'Dazar"},
	["e_1021_8"] = {expansionLevel=7, minLevel=70, difficulty=8, name="Waycrest Manor"},
	["e_1209_8"] = {expansionLevel=9, minLevel=70, difficulty=8, name="Dawn of the Infinite"},
}

Dungeons.max_levels = {
	[2093]=60, -- Castle Nathria (Mythic)
	[2092]=60, -- Castle Nathria, Blood From Stone
	[2091]=60, -- Castle Nathria, Reliquary of Opulence
	[2096]=60, -- Castle Nathria, An Audience with Arrogance
	[2090]=60, -- Castle Nathria, The Leeching Vaults
	[2225]=60, -- Tazavesh (Mythic)
	[2226]=60, -- Sanctum of Domination (Mythic)
	[2037]=50, -- Ny'alotha, the Waking City, Halls of Devotion
	[2038]=50, -- Ny'alotha, the Waking City, Gift of Flesh
	[2036]=50, -- Ny'alotha, the Waking City, Vision of Destiny
	[2039]=50, -- Ny'alotha, the Waking City, The Waking Dream
	[2010]=50, -- Eternal Palace, Depths of the Devoted
	[2011]=50, -- Eternal Palace, The Circle of Stars
	[2009]=50, -- Eternal Palace, The Grand Reception
	[1731]=50, -- Uldir, Halls of Containment
	[1732]=50, -- Uldir, Crimson Descent
	[1733]=50, -- Uldir, Heart of Corruption
	[1947]=50, -- Dazar'alor, Might of the Alliance
	[1945]=50, -- Dazar'alor, Siege of Dazar'alor
	[1949]=50, -- Dazar'alor, Death's Bargain
	[1946]=50, -- Dazar'alor, Empire's Fall
	[1950]=50, -- Dazar'alor, Victory or Death
	[1947]=50, -- Dazar'alor, Might of the Alliance
	[1945]=50, -- Dazar'alor, Siege of Dazar'alor
	[1949]=50, -- Dazar'alor, Death's Bargain
	[1946]=50, -- Dazar'alor, Empire's Fall
	[1950]=50, -- Dazar'alor, Victory or Death
	[1948]=50, -- Dazar'alor, Defense of Dazar'alor
	[1951]=50, -- Crucible of Storms
	[2290]=60, -- Sepulcher of the First Ones (Mythic)
	[2291]=60, -- Sepulcher of the First Ones (LFR)
	[2292]=60, -- Sepulcher of the First Ones (LFR)
	[2293]=60, -- Sepulcher of the First Ones (LFR)
	[2294]=60, -- Sepulcher of the First Ones (LFR)
	[2405]=70, -- Aberrus, the Shadowed Crucible (Mythic)
	[2399]=70, -- Aberrus, the Shadowed Crucible (LFR)
	[2400]=70, -- Aberrus, the Shadowed Crucible (LFR)
	[2401]=70, -- Aberrus, the Shadowed Crucible (LFR)
	[2402]=70, -- Aberrus, the Shadowed Crucible (LFR)
}

Dungeons.add_flags = {
	["e_860"] = { attunement_achieve=11547 }, -- Return to Karazhan M
	["e_900"] = { attunement_queston=46244 }, -- Cathedral of Eternal Night M
	[1115] = { attunement_achieve=11547 }, -- Return to Karazhan HC
	[1488] = { attunement_queston=46244 }, -- Cathedral of Eternal Night HC

	[2466] = { phase="amirdrassil1" },
	[2468] = { phase="amirdrassil2" },
	[2467] = { phase="amirdrassil3" },
	[2469] = { phase="amirdrassil4" },

	-- timewalking instances
	[1011] = {buff=335148}, -- The Arcatraz
	[1012] = {buff=335148}, -- Opening of the Dark Portal
	[1013] = {buff=335148}, -- Mana-Tombs
	[1014] = {buff=335148}, -- Shattered Halls
	[1015] = {buff=335148}, -- Slave Pens
	[1154] = {buff=335148}, -- Magisters' Terrace
	[1533] = {buff=335148}, -- Timewalking Raid: Black Temple
	[2325] = {buff=335148}, -- The Botanica
	[2326] = {buff=335148}, -- Blood Furnace
	[2327] = {buff=335148}, -- Underbog
	[1016] = {buff=335149}, -- Ahn'kahet: The Old Kingdom
	[1017] = {buff=335149}, -- Gundrak
	[1018] = {buff=335149}, -- Halls of Lightning
	[1019] = {buff=335149}, -- The Nexus
	[1020] = {buff=335149}, -- Utgarde Pinnacle
	[1153] = {buff=335149}, -- Pit of Saron
	[1677] = {buff=335149}, -- Timewalking Raid: Ulduar
	[2322] = {buff=335149}, -- The Forge of Souls
	[2323] = {buff=335149}, -- Utgarde Keep
	[2324] = {buff=335149}, -- Azjol-Nerub
	[1147] = {buff=335150}, -- The Vortex Pinnacle
	[1148] = {buff=335150}, -- The Stonecore
	[1149] = {buff=335150}, -- Grim Batol
	[1150] = {buff=335150}, -- Throne of the Tides
	[1151] = {buff=335150}, -- Lost City of the Tol'vir
	[1152] = {buff=335150}, -- End Time
	[2026] = {buff=335150}, -- Timewalking Raid: Firelands
	[2321] = {buff=335150}, -- Blackrock Caverns
	[1464] = {buff=335151}, -- Gate of the Setting Sun
	[1465] = {buff=335151}, -- Siege of Niuzao Temple
	[1466] = {buff=335151}, -- Stormstout Brewery
	[1467] = {buff=335151}, -- Mogu'shan Palace
	[1468] = {buff=335151}, -- Shado-Pan Monastery
	[1469] = {buff=335151}, -- Temple of the Jade Serpent
	[2320] = {buff=335151}, -- Scholomance
	[1972] = {buff=335152}, -- The Everbloom
	[1973] = {buff=335152}, -- Bloodmaul Slag Mines
	[1974] = {buff=335152}, -- Iron Docks
	[1975] = {buff=335152}, -- Auchindoun
	[1976] = {buff=335152}, -- Shadowmoon Burial Grounds
	[1977] = {buff=335152}, -- Skyreach
	[2319] = {buff=335152}, -- Grimrail Depot
	[2274] = {buff=359082}, -- Random Timewalking Dungeon (Legion)
	[2275] = {buff=359082}, -- Black Rook Hold
	[2276] = {buff=359082}, -- Eye of Azshara
	[2277] = {buff=359082}, -- Darkheart Thicket
	[2278] = {buff=359082}, -- Vault of the Wardens
	[2279] = {buff=359082}, -- Neltharion's Lair
	[2280] = {buff=359082}, -- Court of Stars

}