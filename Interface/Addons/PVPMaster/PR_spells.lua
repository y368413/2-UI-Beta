local addonName, addon = ...

addon.spellDB = {
   
	-- Higher up = higher display prio
    
    -- Immune
    "33786",			-- Cyclone
	"19263" ,   		-- Deterrence
	"186265",			-- Aspect of the Turtle
    "45438" ,	    	-- Ice Block
    "642"   ,		    -- Divine Shield    
    "115018",	    	-- Desecrated Ground
    "31821",			-- Aura Mastery
	"1022" ,			-- Hand of Protection
    "47585" ,	    	-- Dispersion
    "31224" ,	        -- Cloak of Shadows
	"45182",			-- Cheating Death
    "8178"  ,	        -- Grounding Totem Effect (Grounding Totem)
    "76577",			-- Smoke Bomb
	"88611",			-- Smoke Bomb
    "46924" ,		    -- Bladestorm
    "51690",            -- Killing Spree
	"221703",			-- Casting Circle
    
    -- CCs    
	"108194",		    -- Asphyxiate
	"115001",			-- Remorseless Winter
    "115000" ,			-- Remorseless Winter
    "91800",			-- Gnaw
    "91797",			-- Monstrous Blow (Dark Transformation)
    "99"   ,			-- Incapacitating Roar
	"217832",			-- Imprison (Demon Hunter)
	--"163505",        	-- Rake
	"179057",			-- Chaos Nova
	"22570",			-- Maim
	"203123",			-- Maim Blood Trauma Honor Talent
	"5211" ,			-- Mighty Bash
    "3355" ,			-- Freezing Trap
    "117526",			-- Binding Shot
    "19386",			-- Wyvern Sting
    "24394",		    -- Intimidation
	"31661",			-- Dragon's Breath
	"118"  ,			-- Polymorph
	"61305",			-- Polymorph: Black Cat
	"28272",			-- Polymorph: Pig
	"61721",			-- Polymorph: Rabbit
	"61780",			-- Polymorph: Turkey
	"28271",			-- Polymorph: Turtle
	"82691",			-- Ring of Frost
	"140376",			-- Ring of Frost	
    "119392",			-- Charging Ox Wave
	"120086",			-- Fists of Fury
	"119381",			-- Leg Sweep
	"115078",			-- Paralysis
    "105421",			-- Blinding Light
	"105593",			-- Fist of Justice
	"853"  ,			-- Hammer of Justice
	"20066",			-- Repentance
    "605"  ,			-- Dominate Mind
	"88625",			-- Holy Word: Chastise
	"64044",			-- Psychic Horror
	"8122" ,			-- Psychic Scream
	"9484" ,			-- Shackle Undead
	"87204",			-- Sin and Punishment
    "2094" ,			-- Blind
	"1833" ,			-- Cheap Shot
	"1776" ,			-- Gouge
	"408"  ,			-- Kidney Shot
	"199804",			-- Between the Eyes
	"185763",			-- Pistol Shot
	"6770" ,			-- Sap
    "51514",			-- Hex
	"118905",			-- Static Charge (Capacitor Totem)
    "5782" ,			-- Fear
	"118699",			-- Fear
	"130616",			-- Fear (Glyph of Fear)
	"5484" ,			-- Howl of Terror
    "6789" ,			-- Mortal Coil
	"30283",			-- Shadowfury
    "89766",		    -- Axe Toss (Felguard/Wrathguard)
	"115268",		    -- Mesmerize (Shivarra)
    "6358" ,		    -- Seduction (Succubus)
    "118895",			-- Dragon Roar
	"5246" ,			-- Intimidating Shout (aoe)
	"132168",			-- Shockwave
	"107570",			-- Storm Bolt
	"132169",			-- Storm Bolt
    "20549",		    -- War Stomp
    "186387",			-- Bursting Shot
	
    -- Anti CC
    "48792",			-- Icebound Fortitude
    "48707" ,	        -- Anti-Magic Shell
    "23920" ,	        -- Spell Reflection
	"114028",	        -- Mass Spell Reflection
	"205604",			-- Reverse Magic
    
    -- Silence
    "47476",		    -- Strangulate
	"81261",		    -- Solar Beam
    "137460",   		-- Silenced (Ring of Peace)
    "15487",		    -- Silence
    "1330" ,		    -- Garrote - Silence
    --"31117",		    -- Unstable Affliction
    
	-- Kick Lock Outs (in testing)
    "6552",   			-- [Warrior] Pummel
    "96231",  			-- [Paladin] Rebuke
    "231665", 			-- [Paladin] Avengers Shield
    "147362", 			-- [Hunter] Countershot
    "187707",			-- [Hunter] Muzzle
    "1766",  			-- [Rogue] Kick
    "183752",			-- [DH] Consume Magic
    "47528",  			-- [DK] Mind Freeze
    "91802",  			-- [DK] Shambling Rush
    "57994",  			-- [Shaman] Wind Shear
    "115781", 			-- [Warlock] Optical Blast
    "19647",  			-- [Warlock] Spell Lock
    "212619", 			-- [Warlock] Call Felhunter
    "132409", 			-- [Warlock] Spell Lock (Old)
    "171138", 			-- [Warlock] Shadow Lock
    "2139",   			-- [Mage] Counterspell
    "116705", 			-- [Feral] Skull Bash
	"93985",			-- [Feral] Skull Bash	

	-- Buffs	
	"203727",			-- Thorns
	"122470",           -- Touch of Karma
	"203720",			-- Demon Spikes
	"203819",			-- Demon Spikes
	"202748",			-- Survival Tactics
	"49039",			-- Lichborne
    "61394",			-- Frozen Wake (Glyph of Freezing Trap)
    "54216",		    -- Master's Call (root and snare immune only)
    "137798",		    -- Reflective Armor Plating
    "5277",			    -- Evasion
	"199754",			-- Riposte (Outlaw)
	"198589",			-- Blur (Demon Hunter)
	"196555",			-- Netherwalk (Demon Hunter)
	"196718",			-- Darkness (Demon Hunter)
    "110913",			-- Dark Bargain
	"104773",			-- Unending Resolve
	"207319",			-- Corpse Shield
    "147531",			-- Bloodbath
    "18499",			-- Berserker Rage
    "51713",            -- Shadow Dance
    "61336",            -- Survival Instincts
    "22812",            -- Barkskin
    "50334",            -- Bersek
    "112071",           -- Celestial Alignment
    "102342",           -- Iron Bark
    "6940",             -- Sac
    "53480",            -- Roar of Sacrifice
    "31884",            -- Avenging Wrath
    "1719",             -- Recklessness
    "110909",           -- Alter Time
    "113858",           -- Dark Soul
    "113861",           -- Dark Soul
    "113860",           -- Dark Soul
    "102543",           -- Incarnation: King of the Jungle
    "102560",           -- Incarnation: Chosen of Elune
    "191427",           -- Metamorphosis (Demon Hunter)
    
    -- Root & Snare    
	--"96294" ,			-- Chains of Ice (Chilblains)
	"222029",			-- Strike of the Windlord (Monk Artifact)
	"209782",			-- Goremaw's Bite (Rogue Artifact)
	"195452",			-- Nightblade
    "91807" ,			-- Shambling Rush (Dark Transformation)
    "339"   ,			-- Entangling Roots
	"113770",			-- Entangling Roots (Force of Nature - Balance Treants)
	"45334" ,			-- Immobilized (Wild Charge - Bear)
	"102359",			-- Mass Entanglement
	"127797" ,			-- Ursol's Vortex
    "128405",			-- Narrow Escape
	"5116"   ,			-- Concussive Shot
    "13809" ,			-- Ice Trap 1	
	"13810"  ,			-- Ice Trap 2
    "122"   ,			-- Frost Nova
	"111340",			-- Ice Ward
	"115760",	        -- Glyph of Ice Block
	"157997",			-- Ice Nova
	"66309",			-- Ice Nova
	"110959",			-- Greater Invisibility
	"33395" ,		    -- Freeze
    "116706",			-- Disable
	"116095" ,			-- Disable
	"118585" ,			-- Leer of the Ox
	"123586" ,			-- Flying Serpent Kick
    "31935",		    -- Avenger's Shield
	"110300" ,			-- Burden of Guilt
	"87194" ,			-- Glyph of Mind Blast
	"114404",			-- Void Tendril's Grasp
	"114239",	        -- Phantasm
	"159630",		    -- Fade
    "102051",	    	-- Frostjaw (also a root)
	"26679"  ,			-- Deadly Throw
	"119696" ,			-- Debilitation	
	"77505",			-- Earthquake	
	"64695" ,			-- Earthgrab (Earthgrab Totem)
	"63685" ,			-- Freeze (Frozen Power)
	"77478"  ,			-- Earthquake (Glyph of Unstable Earth)
	"118345",		    -- Pulverize
	"710"  ,			-- Banish
	"137143",			-- Blood Horror
	"22703",			-- Infernal Awakening
	"18498",		    -- Silenced - Gag Order (PvE only)
	"107566",			-- Staggering Shout
	"105771",			-- Warbringer	
	"12323",			-- Piercing Howl
	
	-- Other
	"30217",		-- Adamantite Grenade
	"67769",		-- Cobalt Frag Bomb
	"30216",		-- Fel Iron Bomb
	"107079",		-- Quaking Palm
	"13327",		-- Reckless Charge	
	"25046",		-- Arcane Torrent (Energy)
	"28730",		-- Arcane Torrent (Mana)
	"50613",		-- Arcane Torrent (Runic Power)
	"69179",		-- Arcane Torrent (Rage)
	"80483",		-- Arcane Torrent (Focus)
	"129597",		-- Arcane Torrent (Chi)
	"39965" ,		-- Frost Grenade
	"55536" ,		-- Frostweave Net
	"13099" ,		-- Net-o-Matic
	"1604"   ,		-- Dazed
}