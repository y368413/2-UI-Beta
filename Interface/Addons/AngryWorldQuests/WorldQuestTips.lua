local WorldQuestTips = CreateFrame("Frame"), {};
local playerName = UnitName("player")
local profileKey = playerName.."-"..GetRealmName()
local gender = UnitSex("player");
local level = UnitLevel("player")
local _,playerClass = UnitClass("player")

local locale = GetLocale()
local L = {		-- Default english
	TITLE = "World Quest Tips & Timers",
	AVERAGE = "Average",
	COMPLETED_IN = " - ",
	PER_MINUTE = "/min",
	WAYPOINT_PATH = "Path to",
	WAYPOINT_CAVE = "Cave entrance to",
	WAYPOINT_STAIRS = "Stairs to",
	WAYPOINT_BUILDING = "Building entrance to",
	WAYPOINT_PORTAL = "Portal to",
	OPTIONS_Q_INFO = "Quest Information",
	OPTIONS_Q_ID = "Quest ID",
	OPTIONS_Q_NOTE = "Set note for this quest",
	OPTIONS_Q_NOTE_TIP = "Alt-Click on a world quest or enter an ID",
	OPTIONS_Q_TT = "Total time spent, in Seconds",
	OPTIONS_Q_TC = "Number of times completed",
	OPTIONS_P_FOOTER = "You can ignore up to 3 tamers for each achievement",
	OPTIONS_G_REP_EX = "Continue to show faction after reaching exalted",
	OPTIONS_G_REP_CUR = "Show current reputation beside faction names",
	OPTIONS_G_TIMES = "Show current and/or average times",
	OPTIONS_G_OPEN_INFO = "Alt-Click on World Quest to open information",
}
local wowhead = "www.wowhead.com/quest="
if locale ~= "enUS" then wowhead = locale:sub(1,2) .. ".wowhead.com/quest=" end

local debugging

local brokenIsleZones = {1015,1021,1014,1096,1024,1017,1033,1018} -- 1007 is the broken isles map

local leyraceWP = {
	[1018] = { -- Val'Sharah
		questID = 43753,
		waypoints = {
			{ 58.2, 88.8 },{ 58.2, 88.8 },{ 57.7, 87.0 },{ 57.2, 85.5 },{ 56.8, 83.4 },{ 56.4, 81.5 },{ 56.7, 79.5 },{ 57.2, 78.5 },{ 57.7, 76.2 },{ 56.8, 71.0 },
			{ 56.2, 69.5 },{ 56.5, 67.3 },{ 57.3, 64.6 },{ 56.8, 62.5 },{ 56.1, 61.6 },{ 55.9, 59.8 },{ 56.0, 57.7 },{ 55.0, 53.7 },{ 54.7, 51.5 },{ 53.3, 50.3 }
		}
	},
	[1024] = { -- Highmountain
		questID = 43764,
		waypoints = {
			{ 31.80, 59.99 },{ 30.77, 59.28 },{ 30.15, 58.23 },{ 29.23, 57.12 },{ 27.39, 57.79 },{ 27.16, 56.87 },{ 28.68, 55.26 },{ 30.35, 50.34 },{ 30.64, 47.55 },{ 31.03, 43.96 },
			{ 31.58, 41.67 },{ 30.46, 40.42 },{ 31.03, 37.55 },{ 30.96, 35.26 },{ 29.50, 33.59 },{ 29.08, 34.52 },{ 28.41, 35.18 },{ 28.69, 36.39 },{ 28.32, 37.49 }
		}
	},
	[1015] = { -- Azsuna
		questID = 43325,
		waypoints = {
			{ 63.6, 28.0 },{ 64.9, 25.9 },{ 64.7, 25.4 },{ 64.0, 25.6 },{ 62.4, 24.4 },{ 60.7, 21.2 },{ 58.8, 19.3 },{ 55.6, 17.0 },{ 52.6, 16.9 },{ 50.5, 15.4 },
			{ 48.4, 14.3 },{ 47.4, 11.4 },{ 45.5, 10.3 },{ 44.1, 9.2  },{ 42.5, 9.8  },{ 41.3, 12.2 },{ 39.5, 13.0 },{ 38.7, 15.7 },{ 37.1, 16.6 },{ 36.0, 19.1 }
		}
	},
	[1033] = { -- Suramar
		questID = 43774,
		waypoints = {
			{ 31.5, 45.4 },{ 31.0, 44.0 },{ 31.2, 40.9 },{ 32.0, 37.6 },{ 30.3, 37.4 },{ 32.4, 39.8 },{ 34.7, 42.6 },{ 36.3, 44.9 },{ 39.5, 44.6 },{ 41.9, 43.3 },
			{ 44.2, 43.2 },{ 46.3, 42.4 },{ 46.3, 40.3 },{ 45.6, 36.4 },{ 45.2, 33.4 },{ 44.8, 32.7 },{ 44.7, 31.2 },{ 45.5, 30.0 },{ 45.4, 28.3 },{ 42.7, 25.0 }
		}
	},
	[1017] = { -- Stormheim
		questID = 43769,
		waypoints = {
			{ 35.8, 69.1 },{ 36.9, 67.0 },{ 39.8, 63.0 },{ 42.9, 59.1 },{ 44.9, 56.4 },{ 44.9, 49.9 },{ 44.3, 48.0 },{ 44.0, 44.9 },{ 42.5, 42.8 },{ 41.5, 42.0 },
			{ 41.1, 40.6 },{ 41.4, 39.2 },{ 41.3, 36.1 },{ 40.2, 34.5 },{ 38.8, 33.5 },{ 38.1, 32.9 },{ 36.1, 30.7 },{ 33.4, 31.9 },{ 33.7, 33.8 },{ 33.4, 35.0 }
		}
	}
}

local enigmaticActive = false
local enigmaticAttempting = false
local enigmaticQuests = { [43767] = true, [43772] = true, [43756] = true }
local enigmaticPaths = { 
			{ 0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0 },
			{ 0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0 },
			{ 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0 },
			{ 0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0 },
			{ 0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0,1,0,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0,1,0,1,0,0,1,1,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0 },
			{ 0,0,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,1,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0	},
			{ 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0	},
		}

--[[-- "WorldQuestWayPoints" - If user has TomTom, use these waypoints as exceptions to the the default PoI --]]--
local wqwp = {			-- "add" => add quest title to str;		"rop" => RemoveOnPickup (removes waypoint on quest autoaccept)
	--[[
	To Do:
	-- investigate WANTED: Fathnyr
	
	[43959] = { [1] = { x = 50, y = 50 } }, -- test with available quest
	[] = { [1] = { x = ,	y = ,	str = "" } },				-- 			--unverified accuracy
	--]]
	
	-- "DANGER:" quests:
	[44190] = { [1] = { x = 41.65,	y = 73.45,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Jade Darkhaven			--unverified accuracy
	[42964] = { [1] = { x = 60.9,	y = 71.8,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Lagertha					--unverified accuracy
	[44114] = { [1] = { x = 46.49,	y = 76.22,	str = L.WAYPOINT_STAIRS, 	add = true } },	-- DANGER: Magistrix Vilessa		--unverified accuracy
	[41703] = { [1] = { x = 52.27,	y = 58.16,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Ormagrogg				--unverified accuracy
	[41816] = { [1] = { x = 48.2,	y = 68.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- DANGER: Oubdob da Smasher		--unverified accuracy
	[42963] = { [1] = { x = 84,		y = 9,		str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Rulf Bonesnapper			--unverified accuracy
	[44193] = { [1] = { x = 40.5,	y = 85.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Sea King Tidross			--unverified accuracy
	[44122] = { [1] = { x = 29.0,	y = 84.3,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Sorallus					--unverified accuracy
	[42953] = { [1] = { x = 84.0,	y = 9.5,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Soulbinder Halldora		--unverified accuracy
	[43101] = { [1] = { x = 23.90,	y = 68.22,	str = L.WAYPOINT_CAVE, 		add = true } },	-- DANGER: Withdoctor Grgl-Brgl		--unverified accuracy
	
	-- "WANTED:" quests, most have rare and normal versions:
	[42636] = { [1] = { x = 41.1,	y = 35.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Arcanist Shal'iman		--unverified accuracy
	[43605] = { [1] = { x = 41.1,	y = 35.3,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Arcanist Shal'iman
	[41824] = {	[1] = { x = 48.67,	y = 49.96,	str = L.WAYPOINT_CAVE, 		add = true },	-- WANTED: Arru						--unverified accuracy
				[2] = { x = 46.29,	y = 49.60,	str = L.WAYPOINT_PATH, 		add = true, rop = true },              
				[3] = { x = 47.9,	y = 53.0,	str = L.WAYPOINT_PATH, 		add = true, rop = true } },	                   
	[44289] = {	[1] = { x = 48.67,	y = 49.96,	str = L.WAYPOINT_CAVE, 		add = true },	-- WANTED: Arru
				[2] = { x = 46.29,	y = 49.60,	str = L.WAYPOINT_PATH, 		add = true, rop = true },	           
				[3] = { x = 47.9,	y = 53.0,	str = L.WAYPOINT_PATH, 		add = true, rop = true } },		                    
	[43426] = { [1] = { x = 58.9,	y = 50.0,	str = L.WAYPOINT_PATH, 		add = true, rop = true },	-- WANTED: Brogozog					--unverified accuracy
				[2] = { x = 59.2,	y = 46.4 } },	
	[43607] = { [1] = { x = 58.9,	y = 50.0,	str = L.WAYPOINT_PATH, 		add = true, rop = true },	-- WANTED: Brogozog
				[2] = { x = 59.2,	y = 46.4 } },	
	[43430] = { [1] = { x = 51.6,	y = 44.6,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Captain Volo'ren			--unverified accuracy
	[43608] = { [1] = { x = 51.6,	y = 44.6,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Captain Volo'ren
	[41826] = { [1] = { x = 49.57,	y = 39.74,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Crawshuk the Hungry		--unverified accuracy
	[41826] = { [1] = { x = 49.57,	y = 39.74,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Crawshuk the Hungry
	[43455] = { [1] = { x = 55.25,	y = 44.41,	str = L.WAYPOINT_CAVE, 		add = true, rop = true },	-- WANTED: Devouring Darkness		--confirmed
				[2] = { x = 54.47,	y = 41.37,								add = true } },
	[43617] = { [1] = { x = 55.25,	y = 44.41,	str = L.WAYPOINT_CAVE, 		add = true, rop = true },	-- WANTED: Devouring Darkness		--confirmed
				[2] = { x = 54.47,	y = 41.37,								add = true } },
	[43428] = { [1] = { x = 46.7,	y = 28.2,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Doomlord Kazrok			--unverified accuracy
	[43609] = { [1] = { x = 46.7,	y = 28.2,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Doomlord Kazrok
	[43620] = { [1] = { x = 41.4,	y = 31.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Egyl the Enduring		--unverified accuracy
	[43454] = { [1] = { x = 41.4,	y = 31.9,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Egyl the Enduring
	[42631] = { [1] = { x = 26.82,	y = 49.06,	str = L.WAYPOINT_PORTAL, 	add = true } },	-- WANTED: Inquisitor Tivos			--confirmed
	[43611] = { [1] = { x = 26.82,	y = 49.06,	str = L.WAYPOINT_PORTAL, 	add = true } },	-- WANTED: Inquisitor Tivos
	[43612] = { [1] = { x = 50.20,	y = 07.80,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Normantis the Deposed	--unverified accuracy
	[43432] = { [1] = { x = 50.20,	y = 07.80,	str = L.WAYPOINT_CAVE, 		add = true } },	-- WANTED: Normantis the Deposed
	[42795] = { [1] = { x = 21.3,	y = 43.31,	m = 1033, str = L.WAYPOINT_CAVE, add = true, rop = true },	-- WANTED: Sanaar					--unverified accuracy
				[2] = { x = 39.7,	y = 34.0,	m = 1033 } },								-- WANTED: Sanaar					--unverified accuracy
	[43429] = { [1] = { x = 66.4,	y = 50.1,	str = L.WAYPOINT_PATH, 		add = true } },	-- WANTED: Syphonus					--unverified accuracy
	[43613] = { [1] = { x = 66.4,	y = 50.1,	str = L.WAYPOINT_PATH,		add = true } },	-- WANTED: Syphonus
	[43437] = { [1] = { x = 41.94,	y = 71.16,	str = L.WAYPOINT_BUILDING,	add = true } },	-- WANTED: Thane Irglov				--unverified accuracy
	[43626] = { [1] = { x = 41.94,	y = 71.16,	str = L.WAYPOINT_BUILDING,	add = true } },	-- WANTED: Thane Irglov
	[43451] = { [1] = { x = 64.8,	y = 51.8, rop = true } },											-- WANTED: Urgev the Flayer			--unverified accuracy
	[43628] = { [1] = { x = 64.8,	y = 51.8, rop = true } },											-- WANTED: Urgev the Flayer
			                                                                                        
	[44002] = {	[1] = { x = 80.36,	y = 70.53,	str = "Southern pylon" },					-- Undersea Survey					--confirmed
				[2] = { x = 79.54,	y = 63.12,	str = "Eastern Pylon" },
				[3] = { x = 74.44,	y = 56.67,	str = "Western Pylon" },
				[4] = { x = 78.61,	y = 55.98,	str = "Northern Pylon" } },
			                                                                                        
	[44067] = {	[1] = { x = 59.8,	y = 58.1,	str = "Callus" },							-- Consolidating Power				--unverified accuracy
				[2] = { x = 61.9,	y = 60.8,	str = "Garion" },
				[3] = { x = 57.8,	y = 62.0,	str = "Leleyna" } },
				
	[41950] = { [1] = { x = 37.46,	y = 64.18 } },											-- Cry More Thunder!				--confirmed
	
	[42077] = { [1] = { x = 50.0,	y = 85.6, rop = true } },											-- Waking Nightmares				--unverified
			                                                                                        
	[43951] = {	[1] = { x = 40.7,	y = 68.9,	str = "Highmountain Prisoner" },			-- An Overdue Debt					--confirmed
				[2] = { x = 40.2,	y = 68.5,	str = "Highmountain Prisoner" },
				[3] = { x = 42.4,	y = 69.7,	str = "Highmountain Prisoner" },
				[4] = { x = 42.7,	y = 70.7,	str = "Highmountain Prisoner" },
				[5] = { x = 45.7,	y = 71.5,	str = "Highmountain Prisoner" },
				[6] = { x = 46.4,	y = 72.8,	str = "Highmountain Prisoner" },
				[7] = { x = 41.8,	y = 67.7,	str = "Highmountain Prisoner" },
				[8] = { x = 43.8,	y = 64.9,	str = "Highmountain Prisoner" },
				[9] = { x = 44.9,	y = 65.0,	str = "Highmountain Prisoner" },
				[10]= { x = 45.5,	y = 66.2,	str = "Highmountain Prisoner" } },
	[41557] = {	[1] = { x = 39.9,	y = 29.4,	str = L.WAYPOINT_CAVE, 		add = true },	-- Slab of Bacon (Suramar)						--unverified accuracy
				[2] = { x = 39.8,	y = 27.3,	str = L.WAYPOINT_PATH, 		add = true, rop = true },              
				[3] = { x = 40.2,	y = 26.3,	str = L.WAYPOINT_PATH, 		add = true, rop = true } },	  
	[41687] = { [1] = { x = 42.63,	y = 25.21,	str = L.WAYPOINT_CAVE, 		add = true, rop = true } ,	-- Snail Fight!		--confirmed
				[2] = { x = 44.58,	y = 22.55 } },  
	
	[44011] = { [1] = { x = 48.27,	y = 68.34, str = L.WAYPOINT_PATH, 		add = true, rop = true },										-- Lost Wisp		--unverified accuracy
				[2] = { x = 48.40,	y = 64.32, rop = true } },  
	
	-- 	these quests appear to be missing the map id in the blizzrd api, and therefore falled to show waypoints
	[41836] = { [1] = { x = 36.6,	y = 16.6,	m = 1024, rop = true } },											-- WANTED: Bodash the Hoarder		--unverified accuracy
	[43616] = { [1] = { x = 36.6,	y = 16.6,	m = 1024, rop = true } },											-- WANTED: Bodash the Hoarder
	[41692] = { [1] = { x = 46.6,	y = 7.6,	m = 1024, rop = true } },											-- Shipwreck Scavengers
}
local awqwp = {} -- Active WorldQuestWayPoints

local repList = { 1859,1900,1883,1828,1948,1894 }

local repitems = {
	["140260"] = 1859,	-- 25			The Nightfallen
	["141870"] = 1859,	-- 100
	["141343"] = 1859,	-- 250 boa
	["139026"] = 1859,	-- 250
	["141992"] = 1859,	-- 750
	["141340"] = 1900,	-- 250 boa		Court of Farondis
	["139023"] = 1900,	-- 250
	["141989"] = 1900,	-- 750
	["141339"] = 1883,	-- 250 boa		Dreamweavers
	["139021"] = 1883,	-- 250
	["141988"] = 1883,	-- 750
	["141341"] = 1828,	-- 250 boa		Highmountain Tribe
	["139024"] = 1828,	-- 250
	["141990"] = 1828,	-- 750
	["141338"] = 1948,	-- 250 boa		Valarjar
	["139020"] = 1948,	-- 250
	["141987"] = 1948,	-- 750
	["141342"] = 1894,	-- 250 boa		The Wardens
	["139025"] = 1894,	-- 250
	["141991"] = 1894,	-- 750
}

local zoneFactions = {
	[1015] = 1900, -- Azsuna		= Court of Farondis
	[1018] = 1883, -- Val'sharah	= Dreamweavers
	[1033] = 1859, -- Suramar	 	= The Nightfallen
	[1024] = 1828, -- Highmountain	= Highmountain Tribe
	[1017] = 1948  -- Stormheim		= Valarjar
}
local tracking = { }
local trackingNames = {}

local pets = {	-- links pet family to achievements (gets icons added too)
	[1]  = { achID = 9692 }, -- Humanoid
	[2]  = { achID = 9689 }, -- Dragonkin
	[3]  = { achID = 9691 }, -- Flying
	[4]  = { achID = 9695 }, -- Undead
	[5]  = { achID = 9688 }, -- Critter
	[6]  = { achID = 9693 }, -- Magic
	[7]  = { achID = 9690 }, -- Elemental
	[8]  = { achID = 9687 }, -- Beast
	[9]  = { achID = 9686 }, -- Aquatic
	[10] = { achID = 9694 }  -- Mechanical
}

local ffamfm = { 
	[41896] = { achID = 11475},
	[42023] = { achID = 11477},
	[42025] = { achID = 11476},
	[41013] = { achID = 11478}
}
local botbi = { }
local fishingRTI = { }
local fishingRTIdoubles = {
	[41243] = { 41608, 41609 },	-- Huge Highmountain Salmon
	[41280] = { 41617 },		-- Huge Runescale Koi
	[41265] = { 41611, 41610 },	-- Huge Cursed Queenfish
	[41275] = { 41614, 41615 },	-- Huge Stormrays
	[41270] = { 41612, 41613 },	-- Huge Mossgill Perch
	[41599] = { 41264, 41598 },	-- Lively Cursed Queenfish
	[41597] = { 41244, 41596 },	-- Lively Highmountain Salmon
	[41602] = { 41274 },		-- Lively Stormrays
	[41604] = { 41279 },		-- Lively Runescale Koi
	[41269] = { 41601 },		-- Lively Mossgill Perch
	
	--[[
	
	/run for i = 1, GetAchievementNumCriteria(10598) do local name,_,fishingRTICompleted,_,_,_,_,fishingRTIID = GetAchievementCriteriaInfo(10598, i) print( i,fishingRTIID,fishingRTICompleted,name ) end
	
	21 Lively Cursed Queenfish
	22 Lively Highmountain Salmon
	23 Lively Stormrays
	24 Lively Runescale Koi
	25 Lively Mossgill Perch
	-]]
}
local dataloaded = false

local pet_quests = {
	[1]  = 42159, -- "Nightwatcher Merayl",
	[2]  = 40299, -- "Bodhi Sunwayver",
	[3]  = 40277, -- "Tiffany Nelson",
	[4]  = 42442, -- "Amalia",
	[5]  = 40298, -- "Sir Galveston",
	[6]  = 40280, -- "Bredda Tenderhide",
	[7]  = 40282, -- "Grixis Tinypop",
	[8]  = 41687, -- "Odrogg",
	[9]  = 40278, -- "Robert Craig",
	[10] = 41944, -- "Trapper Jarrun",
	[11] = 41895, -- "Aulier",
	[12] = 40337, -- "Master Tamer Flummox",
	[13] = 41990, -- "Varenne",
	[14] = 40279, -- "Durian Strongfruit",
	[15] = 41860, -- "Xorvasc",
}
--[[
local pet_quests = {
	[1]  = 40279, -- "Durian Strongfruit",
	[2]  = 40278, -- "Robert Craig",
	[3]  = 40280, -- "Bredda Tenderhide",
	[4]  = 41990, -- "Varenne",
	[5]  = 41860, -- "Xorvasc",
	[6]  = 40337, -- "Master Tamer Flummox",
	[7]  = 40277, -- "Tiffany Nelson",
	[8]  = 40282, -- "Grixis Tinypop",
	[9]  = 42442, -- "Amalia",
	[10] = 40298, -- "Sir Galveston",
	[11] = 41944, -- "Trapper Jarrun",
	[12] = 40299, -- "Bodhi Sunwayver",
	[13] = 41895, -- "Aulier",
	[14] = 41687, -- "Odrogg",
	[15] = 42159, -- "Nightwatcher Merayl",
}
--]]

local pet_tamers = {}
local closedtimer = 0
local refreshing = false
local refreshingblock

--[[
id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(id)
description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(achievementID, index)
		(Index of one of the achievement's criteria (between 1 and GetAchievementNumCriteria(id))
--]]
local function getdata()
	if debugging then print("Getting data for achievement tips...") end
	
	local _,fishingRTIName,_,fishingRTIAchcompleted = GetAchievementInfo(10598)
	fishingRTI.name = fishingRTIName
	fishingRTI.complete = fishingRTIAchcompleted
	fishingRTI.count = 0
	if not fishingRTIAchcompleted then
		for i = 1, GetAchievementNumCriteria(10598) do
			local _,_,fishingRTICompleted,_,_,_,_,fishingRTIID = GetAchievementCriteriaInfo(10598, i)
			
			if		i ==  1 then fishingRTIID = 41270		-- Huge Mossgill Perch
			elseif	i ==  7 then fishingRTIID = 41265		-- Huge Cursed Queenfish
			elseif	i ==  9 then fishingRTIID = 41280		-- Huge Runescale Koi
			elseif	i == 12 then fishingRTIID = 41243		-- Huge Highmountain Salmon
			elseif	i == 15 then fishingRTIID = 41275		-- Huge Stormrays
			elseif	i ==  4 then fishingRTIID = 41599		-- Lively Cursed Queenfish
			elseif 	i == 10 then fishingRTIID = 41597		-- Lively Highmountain Salmon
			elseif	i == 11 then fishingRTIID = 41602		-- Lively Stormrays
			elseif	i ==  3 then fishingRTIID = 41604		-- Lively Runescale Koi
			elseif	i == 20 then fishingRTIID = 41269 end	-- Lively Mossgill Perch
			
			fishingRTI[fishingRTIID] = fishingRTICompleted
			if fishingRTICompleted then
				fishingRTI.count = fishingRTI.count + 1
			elseif fishingRTIdoubles[ fishingRTIID ] then
				for k,v in pairs( fishingRTIdoubles[ fishingRTIID ] ) do
					fishingRTI[ v ] = false
				end
			end
		end
	end
	
	 -- ffamfm
	--	description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(achievementID, index)
	--description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(achievementID, index)
	for k,v in pairs(ffamfm) do
		local _, name, _, completed = GetAchievementInfo(v.achID)
		local _, _, _, quantity, requiredQuantity = GetAchievementCriteriaInfo(v.achID, 1)
	--	print( k,v.achID )
		ffamfm[k].name = name
		ffamfm[k].completed = completed
		ffamfm[k].quantity = quantity
		ffamfm[k].requiredQuantity = requiredQuantity
	end
	
	local _,botbiName,_,botbiAchcompleted = GetAchievementInfo(10876)
	botbi.name = botbiName
	botbi.complete = botbiAchcompleted
	botbi.count = 0
	if not botbiAchcompleted then
		for i = 1, GetAchievementNumCriteria(10876) do
			local _,_,botbiCompleted,_,_,_,_,botbiID = GetAchievementCriteriaInfo(10876, i)
			botbi[botbiID] = botbiCompleted
			if botbiCompleted then botbi.count = botbi.count + 1 end
		end
	end
	for i = 1, GetAchievementNumCriteria(9692) do
		local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
		pet_tamers[description] = { }
		local quest = pet_quests[i]
		pet_quests[quest] = description
	end
	
	--	local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
	for f = 1, 10 do
		pets[f].icon = format("\124TInterface\\Icons\\Pet_Type_%s:16\124t",PET_TYPE_SUFFIX[f])
		pets[f].count = 0
		pets[f].ignored = 0
		local _,achname,_,achcompleted = GetAchievementInfo(pets[f].achID)
		pets[f].achName = achname
		for i = 1, GetAchievementNumCriteria(pets[f].achID) do
			local description, _, completed = GetAchievementCriteriaInfo(pets[f].achID, i)
			if WorldQuestTipsData.global.pets.ff[description] == nil then WorldQuestTipsData.global.pets.ff[description] = { } end
			if WorldQuestTipsData.global.pets.ff[description][f] == nil then WorldQuestTipsData.global.pets.ff[description][f] = true end
			if achcompleted then completed = true end
			pet_tamers[description][f] = completed
			if completed then pets[f].count = pets[f].count + 1 end
		end
	end
	
	dataloaded = true
end

local function wayPointsEnabled( source )
	local wayPointsEnabled = true
	if not TomTom then wayPointsEnabled = false
	elseif source == "auto" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomAQ
	elseif source == "click" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomMP
	elseif source == "leyrace" then wayPointsEnabled = WorldQuestTipsData.global.options.TomTomLR end
	return wayPointsEnabled
end

local function addWayPoints( questID, source, m, f, x, y, title )
	if wayPointsEnabled( source ) then
		if awqwp[questID] == nil then awqwp[questID] = {} end
		if wqwp[questID] then
			local _, m = C_TaskQuest.GetQuestZoneID( questID )
			for i,quest in pairs( wqwp[questID] ) do
				local wp = wqwp[questID][i]
				title = C_TaskQuest.GetQuestInfoByQuestID(questID)
				if wp.str then
					if wp.add then title = wp.str .. " " .. title
					else title = wp.str end
				end
				if wp.m then m = wp.m end
				awqwp[questID][i] = TomTom:AddMFWaypoint(m, 0, wp.x/100, wp.y/100, {title=title, persistent=false })
			end
		elseif source == "click" then
			if ( m and f and x and y ) then awqwp[questID][1] = TomTom:AddMFWaypoint(m, f, x, y, {title=title, persistent=false }) end
		elseif source == "leyrace" then
			for j in pairs( awqwp[questID] ) do TomTom:RemoveWaypoint( awqwp[questID][j] ) end
			for i, wp in pairs( leyraceWP[ m ].waypoints ) do
				awqwp[questID][i] = TomTom:AddMFWaypoint(m, 0, wp[1]/100, wp[2]/100, {title=title, persistent=false })
			end
		end
		
		if TomTom.SetClosestWaypoint then TomTom:SetClosestWaypoint() end
	end
end


local function addWorldQuest(id)
	local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(id)
	local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(questID);
	if worldQuestType then
		
		if debugging then print("WQT-Dedugging: Attempting to add World Quest - "..questID) end
		
		addWayPoints( questID, "auto" )
		
		if awqwp[questID] then
			for i in pairs( awqwp[questID] ) do
				if wqwp[questID] == nil or ( wqwp[questID] and wqwp[questID][i].rop ) then
					TomTom:RemoveWaypoint( awqwp[questID][i] )
				end
			end
		end
				
		table.insert(trackingNames, title)
		local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
		local objectives = {}
		if numObjectives then
			for obj = 1, numObjectives do
				local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
				objectives[obj] = objectiveText
				if debugging then print(objectiveText) end
			end
		end
		local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
		objectives.percent = percent
		local expireTime = C_TaskQuest.GetQuestTimeLeftMinutes(questID) or 0
		expireTime = expireTime *60 + time()
		if tracking[questID] == nil then
			tracking[questID] = {
				progressed = false,
				duration = 0,
				expires = expireTime,
				objectives = objectives,
				objectivesInit = objectives
			}
		end
		if not tracking[questID].active then
			tracking[questID].active = true
			tracking[questID].start = time()
		end
		if tracking[questID].expires < time() then
			tracking[questID].duration = 0
			tracking[questID].expires = expireTime
		end
		if tracking[questID].active and enigmaticQuests[ questID ] then
			enigmaticActive = true
			if WorldQuestTipsData.global.options.useEnigmatic then
				if WorldQuestTips.enigmatic == nil then
					WorldQuestTips:loadEnigmatic()
				else
					WorldQuestTips.enigmatic:Show()
				end
			end
		end
	end
end

local function findQuest( questID )
--	print("findquest fired")
--local function findQuest( questID, m )
	if questID then
		local title = C_TaskQuest.GetQuestInfoByQuestID(questID)
		local _, questZoneId = C_TaskQuest.GetQuestZoneID( questID )
		local x, y = C_TaskQuest.GetQuestLocation( questID, questZoneId )
		local coords = {
			default = {
				x = x,
				y = y,
				f = 0,
				m = questZoneId,
			}
		}
		if WorldQuestTipsData.global.worldQuests[questID] == nil then
			WorldQuestTipsData.global.worldQuests[questID] = {
				completed = 0,
				timespent = 0,
			}
		end
		WorldQuestTipsData.global.worldQuests[questID].coords = coords
		WorldQuestTipsData.global.worldQuests[questID].title = title
	else
		--	local viewedZone = GetCurrentMapAreaID()
		--	print( viewedZone )
		--	SetMapToCurrentZone()
		--	local thisZone = GetCurrentMapAreaID()
		--	if viewedZone ~= 1007 then
		--	SetMapByID( 1007 )
		--	SetMapByID( viewedZone )
		for _,mapID in pairs(brokenIsleZones) do
			
			
			
			-- /run for _,mapID in pairs({1015,1021,1014,1096,1024,1017,1033,1018,1007}) do print(mapID, C_TaskQuest.GetQuestLocation( 41938, mapID )) end
			-- /run print(C_TaskQuest.GetQuestZoneID(41938))
			-- /run local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(1007) for i,info in pairs(taskInfo) do print(info.questId) end
			
			
		--	local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( 1007 )
			local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( mapID )
			if taskInfo then
				for i, info in pairs(taskInfo) do
					if info.questId then
					--	print( info.questId )
						local title = C_TaskQuest.GetQuestInfoByQuestID( info.questId )
						local _, questZoneId = C_TaskQuest.GetQuestZoneID( info.questId )
						local x, y = C_TaskQuest.GetQuestLocation( info.questId, questZoneId )
						if WorldQuestTipsData.global.worldQuests[info.questId] == nil then
							if debugging then print("WQT-Dedugging - New quest found: "..info.questId) end
							WorldQuestTipsData.global.worldQuests[info.questId] = {
								completed = 0,
								timespent = 0,
								coords = {
									default = {
										x = x,
									--	x = info.x,
										y = y,
									--	y = info.y,
										f = info.floor,
									--	m = mapID,
										m = questZoneId,
									}
								},
								title = title
							}
					--	elseif WorldQuestTipsData.global.worldQuests[info.questId].coords == nil then
						else
							WorldQuestTipsData.global.worldQuests[info.questId].coords = {
								default = {
									x = x,
								--	x = info.x,
									y = y,
								--	y = info.y,
									f = info.floor,
								--	m = mapID,
									m = questZoneId,
								}
							}
							WorldQuestTipsData.global.worldQuests[info.questId].title = title
						end
					end
				end
			end
		--	SetMapByID( viewedZone )
		end
		--[[
	else
		for _,mapID in pairs(brokenIsleZones) do
			local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID( mapID )
			for i, info in pairs(taskInfo) do
				if info.questId == questID then
					return info, mapID;
				end
			end
		end
	end
	return nil--]]
	end
end

function WorldQuestTips:PLAYER_LOGIN(...)
	local defaultOptions = {
					debugging = false,
					TomTomAQ = true,
					TomTomMP = true,
					TomTomLR = true,
					PetFF = true,
					EditOnC = true,
					showExalted = true,
					showTimes = true,
					showCurrentRep = true,
					hideSmallGold = true,
					hideSmallGoldThreshold = 10,
					showRepOnItems = true,
					showAltRepOnItems = true,
					useEnigmatic = true,
					enigmaticRows = 3,
					enigmaticSize = 6,
					enigmaticMove = true,
					enigmaticPos = "CENTER",
					useEnigmaticHUD = true,
					enigmaticHUDSize = 32,
					enigmaticHUDPathA = 0.1,
					enigmaticHUDEdgeA = 0.3,
					enigmaticHUDPathDim = true,
					enigmaticHUDMove = true,
					enigmaticHUDPos = "CENTER",
				}
	if WorldQuestTipsData == nil then
		WorldQuestTipsData = {
			global = {
				options = defaultOptions,
				worldQuests = {},
				pets = { ff = {} },
			}
		}
	end
	for option, default in pairs( defaultOptions ) do
		if WorldQuestTipsData.global.options[option] == nil then WorldQuestTipsData.global.options[option] = default end
	end

	if WorldQuestTipsData[profileKey] == nil then WorldQuestTipsData[profileKey] = { worldQuestPartial = { } } end
	debugging = WorldQuestTipsData.global.options.debugging
	for questID, data in pairs(WorldQuestTipsData[profileKey].worldQuestPartial) do
		if data.expires > time() then
			if data.active then
				data.start = time()
			end
			tracking[questID] = data;
		end
	end
	
	local o = CreateFrame("FRAME")
	o.name = "|cff0080ff[任务]|r世界任务" --L.TITLE
	InterfaceOptions_AddCategory(o)
	o.title = o:CreateFontString(nil, o, "GameFontNormalLarge" )
	o.title:SetText( L.TITLE )
	o.title:SetPoint("CENTER",0,20)
	o.loadBtn = CreateFrame("BUTTON", nil, o, "UIPanelButtonTemplate")
	o.loadBtn:SetWidth(98)
	o.loadBtn:SetHeight(24)
	o.loadBtn:SetText( GAMEOPTIONS_MENU )
	o.loadBtn:SetPoint("TOP", o.title, "BOTTOM", 0, -12)
	o.loadBtn:SetScript("OnClick", function() WorldQuestTips:loadOptions() ;InterfaceOptionsFrame:Hide();ToggleGameMenu() end)
end

function WorldQuestTips:PLAYER_LOGOUT(...)
	for questID, data in pairs(tracking) do
		if data.active then
			local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
			local progressed = false
			local objectives = {}
			if numObjectives then
				for obj = 1, numObjectives do
					local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
					if objectiveText ~= data.objectives[obj] then progressed = true end
					objectives[obj] = objectiveText
				end
			end
			local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
			if percent and percent ~= data.objectives.percent then
				progressed = true
				objectives.percent = percent
			end
			if progressed then
				data.objectives = objectives
				tracking[questID].duration = data.duration + ( time() - data.start )
			end
		end
	end
	WorldQuestTipsData[profileKey].worldQuestPartial = tracking
	
	WorldQuestTipsData[profileKey].info = {
		name = playerName,
		class = playerClass,
		level = level
	}
	
	local factionStandings = {}
	
	for k,factionID in pairs( repList ) do
		local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID( factionID );
		barMax = (barMax - barMin)/10000;
		local barValue = math.floor( (value - barMin)/1000 ) / 10
		local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
		local colour = "|cff808080"
		if factionStanding < 8 then
			factionStandingtext = factionStandingtext.." "..barValue.."w /"..barMax.."w"
			colour = "|cffffd100"
		end
		factionStandings[ factionID ] = colour..factionStandingtext.."\124r"
		
	end
	
	WorldQuestTipsData[profileKey].reps = factionStandings
end

--[[-- Checks for world quests on load --]]--
function WorldQuestTips:PLAYER_ENTERING_WORLD()
	if debugging then print("WQT-Dedugging: Checking quest log for World Quests - "..GetNumQuestLogEntries().." quest log entries found...") end
	for q = 1, GetNumQuestLogEntries() do
		addWorldQuest(q)
	end
	for questID, data in pairs(tracking) do
		if GetQuestLogIndexByID(questID) == 0 then
			data.active = false;
		end
	end
end

--[[-- Filter System Message (quest completed string) --]]--
local filter = function(frame, event, message, ...)
	-- Filter function:
	--		return true to remove message
	--		return false with new message to ammend message
	--		return false to leave message unchanged
	local questFound = false;
	for _, questName in ipairs(trackingNames) do
		if (string.match(message, questName)) then
			questFound = true;
		end
	end
	if message:match("wqt:") then
        local newmessage = message:gsub("wqt:", "")
        return false, newmessage, ...
    else
		return questFound
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", filter)

--[[-- For filter debugging (prints system all messages) --]]--[[
function WorldQuestTips:CHAT_MSG_SYSTEM(message)
	print( message )
end--]]

--[[ Checks chat links for customlink --]]
local OldSetItemRef = SetItemRef  
function SetItemRef(link, text, button, chatFrame) 
	local func, questID = strmatch(link, "^quest:(%a+)(%d+)") 
	if func == "wqtLink" then 
		WorldQuestTips:loadOptions( tonumber(questID) )
	else 
		OldSetItemRef(link, text, button, chatFrame) 
	end 
end 


function WorldQuestTips:QUEST_TURNED_IN(questID)
	if pet_quests[questID] or botbi[questID] == false or fishingRTI[questID] == false then dataloaded = false end
	if tracking[questID] then
		
		if enigmaticQuests[ questID ] then
			enigmaticActive = false
			if WorldQuestTips.enigmatic then WorldQuestTips.enigmatic:Hide() end
			if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
		end
		
		local totaltime = tracking[questID].duration + ( time() - tracking[questID].start )
		if WorldQuestTipsData.global.worldQuests[questID] == nil then WorldQuestTipsData.global.worldQuests[questID] = { completed = 0, timespent = 0} end
		WorldQuestTipsData.global.worldQuests[questID].completed = WorldQuestTipsData.global.worldQuests[questID].completed + 1;
		WorldQuestTipsData.global.worldQuests[questID].timespent = WorldQuestTipsData.global.worldQuests[questID].timespent + totaltime;
		local averageTime = math.floor( WorldQuestTipsData.global.worldQuests[questID].timespent/WorldQuestTipsData.global.worldQuests[questID].completed )
		local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(questID);
		
		local completionString = "wqt:\124cffffff00\124Hquest:wqtLink"..questID..":110\124h["..title.."]\124h\124r "..L.COMPLETED_IN.." "..SecondsToTime(totaltime).. "."
		if WorldQuestTipsData.global.options.showTimes and WorldQuestTipsData.global.worldQuests[questID].completed > 1 then
			completionString = completionString .. " ("..L.AVERAGE..": "..SecondsToTime(averageTime)..")"
		end
		SendSystemMessage( completionString );
		if WorldQuestTipsData.global.options.showTimes and totaltime > 60 then
			local timeInMin = totaltime/60;
			local money = GetQuestLogRewardMoney(questID);
			if ( money > 100000 ) then -- don't bother displaying for low values of gold
				money = math.floor( money / timeInMin )
				SendSystemMessage(YOU_EARNED_LABEL.." "..GetCoinTextureString(money).." "..L.PER_MINUTE..".")
			end
			local name, texture, numItems = GetQuestLogRewardCurrencyInfo(1, questID);
			if name ~= nil then	
				numItems = math.floor( numItems / timeInMin )
				local text = BONUS_OBJECTIVE_REWARD_WITH_COUNT_FORMAT:format(texture, numItems, name);
				SendSystemMessage(YOU_EARNED_LABEL.." ".. text .." "..L.PER_MINUTE..".")
			end
			local honor = GetQuestLogRewardHonor(questID)
			if honor > 0 then	
				averageHonor = math.floor( honor / timeInMin )
				text = BONUS_OBJECTIVE_REWARD_WITH_COUNT_FORMAT:format("Interface\\ICONS\\Achievement_LegionPVPTier4", averageHonor, HONOR);
				SendSystemMessage(YOU_EARNED_LABEL.." ".. text .." "..L.PER_MINUTE..".")
			end
		end
		tracking[questID] = nil
	end
end

function WorldQuestTips:UNIT_ENTERING_VEHICLE()
	local collectingEnergy = GetSpellInfo(218813)
	if UnitDebuff("player", collectingEnergy) then
		local viewedZone = GetCurrentMapAreaID()
		SetMapToCurrentZone()
		local thisZone = GetCurrentMapAreaID()
		local zone = thisZone or viewedZone
		SetMapByID( viewedZone )
		
		--	local _, zone = C_TaskQuest.GetQuestZoneID( questID ) --use this instead?
		
		if leyraceWP[ zone ] then
			addWayPoints( leyraceWP[ zone ].questID, "leyrace", zone, nil, nil, nil, "Ley Line Node" )
		end
	end
end

local function addpetlines( tt, name, botbip )
	if WorldQuestTipsData.global.options.PetFF then
		local tamer = pet_tamers[name]
		local headerAdded = false
		--tt:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
		if botbip == false and not botbi.complete then
			tt:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
			headerAdded = true
			tt:AddDoubleLine("|cffffff00[" .. botbi.name .. "]", "|cffffffff(".. botbi.count .. "/30)")
		end
		if tamer ~= nil then
			for f, complete in pairs(tamer) do
				if not complete and WorldQuestTipsData.global.pets.ff[name][f] ~= false then
					if not headerAdded then
						tt:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
						headerAdded = true
					end
					tt:AddDoubleLine(pets[f].icon .. "|cffffff00[" .. pets[f].achName .. "]", "|cffffffff(".. pets[f].count .. "/12)")
				end
			end
		end
	end
end

function WorldQuestTips:UNIT_QUEST_LOG_CHANGED(unitID)
	if unitID == "player" then
		for q = 1, GetNumQuestLogEntries() do
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(q)
			local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(questID);
			if worldQuestType and tracking[questID] then
				
				if enigmaticQuests[ questID ] then enigmaticAttempting = false end
		
				local isInArea, isOnMap, numObjectives = GetTaskInfo(questID)
				if numObjectives then
					for obj = 1, numObjectives do
						local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(questID, obj, false);
						if objectiveText ~= tracking[questID].objectives[obj] and objectiveText ~= tracking[questID].objectivesInit[obj] then
							tracking[questID].objectives[obj] = objectiveText;
							tracking[questID].progressed = true;
						end
					end
				end
				local percent = C_TaskQuest.GetQuestProgressBarInfo(questID);
				if percent and percent ~= tracking[questID].objectives.percent and percent > 0 then
					tracking[questID].objectives.percent = percent;
					tracking[questID].progressed = true;
				end
			end
		end
	end
end

function WorldQuestTips:QUEST_REMOVED(questID)
	if awqwp[questID] then
		for i in pairs( awqwp[questID] ) do
			TomTom:RemoveWaypoint( awqwp[questID][i] )
		end
	end
	if tracking[questID] then
		if enigmaticQuests[ questID ] then
			enigmaticActive = false
			if WorldQuestTips.enigmatic then WorldQuestTips.enigmatic:Hide() end
			if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
		end
		if tracking[questID].progressed then
			tracking[questID].duration = tracking[questID].duration + ( time() - tracking[questID].start )
			tracking[questID].start = time()
		end
		if debugging then print( "QUEST_REMOVED :"..questID.." - timer should pause at:"..tracking[questID].duration ) end
		tracking[questID].progressed = false
		tracking[questID].active = false
	end
end

function WorldQuestTips:QUEST_ACCEPTED(self)
	addWorldQuest(self)
end

hooksecurefunc ("WorldMap_UpdateQuestBonusObjectives", function ()
	findQuest()
end)

hooksecurefunc ("TaskPOI_OnClick", function (self, button)
	if self.worldQuest and button == "LeftButton" then
		if IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC then
			WorldQuestTips:loadOptions( self.questID )
		end
	end
end)

--[[-- Adds tooltip to world quests on map --]]--
hooksecurefunc ("TaskPOI_OnEnter", function (self)
--function TaskPOI_OnEnter(self)
	WorldMapTooltip:SetOwner(self, "ANCHOR_RIGHT");

	if ( not HaveQuestData(self.questID) ) then
		WorldMapTooltip:SetText(RETRIEVING_DATA, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
		WorldMapTooltip:Show();
		return;
	end
	
	local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.questID);
		

	-- Handling other addons changing the PoI frame name willynillily
	if ( IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC ) and ( WorldQuestTrackerAddon or AngryWorldQuests ) then
		local mtable = GetMouseFocus()
		if mtable and mtable:HasScript("OnClick") then
			local orginalScript = mtable:GetScript("OnClick")
			mtable:SetScript("OnClick", function (self, button)
				if button == "LeftButton" and WorldQuestTipsData.global.options.EditOnC and IsAltKeyDown() then
					WorldQuestTips:loadOptions( self.questID )
				else
					orginalScript( self )
				end
			end)
		end
	end
	
	if ( self.worldQuest ) then
		if not dataloaded then getdata() end
		local averageTime
		if WorldQuestTipsData.global.worldQuests[self.questID] == nil then
			findQuest(self.questID)
		end
		if WorldQuestTipsData.global.worldQuests[self.questID].coords == nil then
			findQuest(self.questID)
		end
		if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].completed > 0 then
			averageTime = math.floor( WorldQuestTipsData.global.worldQuests[self.questID].timespent/WorldQuestTipsData.global.worldQuests[self.questID].completed )
		end
		local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(self.questID);
		local color = WORLD_QUEST_QUALITY_COLORS[rarity];
		WorldMapTooltip:SetText(title, color.r, color.g, color.b);
		if ( factionID ) then
			--name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(factionID)
			local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID(factionID);
			barMax = (barMax - barMin)/10000;
			local barValue = math.floor( (value - barMin)/1000 ) / 10
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
			if ( factionName ) then
				if capped then
					if WorldQuestTipsData.global.options.showCurrentRep then
						factionName = factionName.." ("..factionStandingtext..")"
					end
					if WorldQuestTipsData.global.options.showExalted then
						WorldMapTooltip:AddLine(factionName, GRAY_FONT_COLOR:GetRGB());
					end
				else
					if WorldQuestTipsData.global.options.showCurrentRep then
						factionName = factionName.." ("..factionStandingtext.." "..barValue.."w /"..barMax.."w)";
					end
					if factionStanding == 8 and not WorldQuestTipsData.global.options.showExalted then
						factionName = nil;
					end
					WorldMapTooltip:AddLine(factionName);
				end
			end
			
	--		local _, fmap = C_TaskQuest.GetQuestZoneID( self.questID )
			local fmap = WorldQuestTipsData.global.worldQuests[self.questID].coords.default.m
	--		if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].coords then
	--			fmap = WorldQuestTipsData.global.worldQuests[self.questID].coords.default.m
	--		else
	--			_, fmap = findQuest( self.questID )
	--		end
		--	local fmap = WorldQuestTipsData.global.worldQuests[self.questID].coords.default.m
			if zoneFactions[fmap] and zoneFactions[fmap] ~= factionID then
				local factionName2,_,factionStanding2,barMin2,barMax2,value2 = GetFactionInfoByID(zoneFactions[fmap]);
				barMax2 = (barMax2 - barMin2)/10000;
				local barValue2 = math.floor( (value2 - barMin2)/1000 ) / 10
				local factionStandingtext2 = GetText("FACTION_STANDING_LABEL"..factionStanding2, gender);
				if ( factionName2 ) then
					if value2 == 42999 then
						if WorldQuestTipsData.global.options.showCurrentRep then
							factionName2 = factionName2.." ("..factionStandingtext2..")"
						end
						if WorldQuestTipsData.global.options.showExalted then
							WorldMapTooltip:AddLine(factionName2, GRAY_FONT_COLOR:GetRGB());
						end
					else
						if WorldQuestTipsData.global.options.showCurrentRep then
							factionName2 = factionName2.." ("..factionStandingtext2.." "..barValue2.."w /"..barMax2.."w)";
						end
						if factionStanding2 == 8 and not WorldQuestTipsData.global.options.showExalted then
							factionName2 = nil;
						end
						WorldMapTooltip:AddLine(factionName2);
					end
				end
			end
		end
		
		local currentTime = 0
		if tracking[self.questID] then
			if tracking[self.questID].active then
				currentTime = tracking[self.questID].duration + ( time() - tracking[self.questID].start )
			else
				currentTime = tracking[self.questID].duration
			end
		end
		if WorldQuestTipsData.global.options.showTimes and ( ( averageTime and averageTime > 0 ) or currentTime > 0 ) then
			if ( averageTime and averageTime > 0 ) and currentTime > 0 then
				WorldMapTooltip:AddDoubleLine( TIME_LABEL.." "..SecondsToTime(currentTime), "("..L.AVERAGE..": "..SecondsToTime(averageTime)..")" )
			elseif ( averageTime and averageTime > 0 ) then
				WorldMapTooltip:AddLine( L.AVERAGE..": "..SecondsToTime(averageTime) )
			else
				WorldMapTooltip:AddLine( TIME_LABEL.." "..SecondsToTime(currentTime) )
			end
		end
			
		WorldMap_AddQuestTimeToTooltip(self.questID);
	else
		WorldMapTooltip:SetText(title);
	end

	if tracking[self.questID] then
		for k,v in pairs(tracking[self.questID].objectives) do
			if k ~= "percent" then
				local color = HIGHLIGHT_FONT_COLOR;
				WorldMapTooltip:AddLine(QUEST_DASH .. v, color.r, color.g, color.b, true);
			end
		end
	else		
		for objectiveIndex = 1, self.numObjectives do
			local objectiveText, objectiveType, finished = GetQuestObjectiveInfo(self.questID, objectiveIndex, false);
			if ( objectiveText and #objectiveText > 0 ) then
				local color = finished and GRAY_FONT_COLOR or HIGHLIGHT_FONT_COLOR;
				WorldMapTooltip:AddLine(QUEST_DASH .. objectiveText, color.r, color.g, color.b, true);
			end
		end
	end
	
	local percent
	if tracking[self.questID] then
		percent = tracking[self.questID].objectives.percent;
	else
		percent = C_TaskQuest.GetQuestProgressBarInfo(self.questID);
	end
	if ( percent ) then
		GameTooltip_InsertFrame(WorldMapTooltip, WorldMapTaskTooltipStatusBar);
		WorldMapTaskTooltipStatusBar.Bar:SetValue(percent);
		WorldMapTaskTooltipStatusBar.Bar.Label:SetFormattedText(PERCENTAGE_STRING, percent);
	end
	
	if fishingRTI[ self.questID ] == false and not fishingRTI.complete then
		WorldMapTooltip:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
		WorldMapTooltip:AddDoubleLine("|cffffff00[" .. fishingRTI.name .. "]", "|cffffffff(".. fishingRTI.count .. "/25)")
	end
	
	if ffamfm[ self.questID ] and not ffamfm[ self.questID ].completed then
		WorldMapTooltip:AddLine("\n"..ACHIEVEMENT_PROGRESSED..":")
		WorldMapTooltip:AddDoubleLine("|cffffff00[" .. ffamfm[ self.questID ].name .. "]", "|cffffffff(".. ffamfm[ self.questID ].quantity .. "/" .. ffamfm[ self.questID ].requiredQuantity .. ")")
	end
	
	if pet_tamers[pet_quests[self.questID]] ~= nil or botbi[self.questID] == false then 
		addpetlines( WorldMapTooltip, pet_quests[self.questID], botbi[self.questID] )
	end
	
	if WorldQuestTipsData.global.worldQuests[self.questID] and WorldQuestTipsData.global.worldQuests[self.questID].note ~= nil then
		WorldMapTooltip:AddLine("|cffffff00"..LABEL_NOTE..": |cffffffff"..WorldQuestTipsData.global.worldQuests[self.questID].note,1,1,1, true)
	end
	
	WorldMap_AddQuestRewardsToTooltip(self.questID);

	if ( self.worldQuest and WorldMapTooltip.AddDebugWorldQuestInfo ) then
		WorldMapTooltip:AddDebugWorldQuestInfo(self.questID);
	end
	WorldMapTooltip:Show();
end)

hooksecurefunc ("WorldMap_AddQuestRewardsToTooltip", function (questID)
--function WorldMap_AddQuestRewardsToTooltip(questID)
	local averageTime
	local averageTimeInMin
	if WorldQuestTipsData.global.worldQuests[questID] and WorldQuestTipsData.global.worldQuests[questID].completed > 0 then
		averageTime = math.floor( WorldQuestTipsData.global.worldQuests[questID].timespent/WorldQuestTipsData.global.worldQuests[questID].completed )
		averageTimeInMin = averageTime/60;
	end
	
	-- money
	local money = GetQuestLogRewardMoney(questID);
	if ( money > 0 ) then
		local moneyString = GetCoinTextureString(money);
		local moneyAverage = ""
		if money > 100000 and WorldQuestTipsData.global.options.showTimes and averageTime and averageTimeInMin > 1 then
			local averageMoney = math.floor( ( (money/10000) / averageTimeInMin ) + 0.5 )
			moneyAverage = "(".. averageMoney.." "..L.PER_MINUTE..")"
			WorldMapTooltipMoneyFrame1SuffixText:SetText(" "..moneyAverage)
			WorldMapTooltipMoneyFrame1SuffixText:SetPoint("LEFT", WorldMapTooltipMoneyFrame1CopperButton, "RIGHT",5, 0);
			WorldMapTooltipMoneyFrame1SuffixText:Show()
		end
		if WorldQuestTipsData.global.options.hideSmallGold and money < WorldQuestTipsData.global.options.hideSmallGoldThreshold*10000 then
			GameTooltip_ClearMoney(WorldMapTooltip)
			if _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:GetText() == " " then _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:SetText() end
			if _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-1]:GetText() == " " then _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-1]:SetText() end
		end
	end
	
	local honor = GetQuestLogRewardHonor(questID)
	local line = 0
	if honor > 0 then line = 1 end
	
	-- currency
	local numQuestCurrencies = GetNumQuestLogRewardCurrencies(questID);
	if numQuestCurrencies > 0 and averageTime and averageTimeInMin > 1 then
	--	for i = 1, numQuestCurrencies do
			local name, texture, numItems = GetQuestLogRewardCurrencyInfo(1, questID);
			local averageNumItems = math.floor( numItems / averageTimeInMin )
			local text = _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-line]:GetText()
	--		print(text)
			if WorldQuestTipsData.global.options.showTimes then text = text .. " (" .. averageNumItems .. " "..L.PER_MINUTE..")" end
			_G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-line]:SetText( text )
	--	end
	end
	
	-- honor
	if honor > 0 and averageTime and averageTimeInMin > 1 then
		local honorLine = 0
		local averageHonor = math.floor( honor / averageTimeInMin )
		local text = _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:GetText()
		if text == " " then
			text = _G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()-1]:GetText()
			honorLine = 1
		end
		if WorldQuestTipsData.global.options.showTimes then text = text .. " (" .. averageHonor .. " "..L.PER_MINUTE..")" end
		_G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines() - honorLine]:SetText( text )
	end

	-- items
	local numQuestRewards = GetNumQuestLogRewards(questID);
	if numQuestRewards > 0 then
		local artifactPower
		local itemType = WorldMapTooltipTooltipTextLeft2:GetText()
		if (itemType and itemType:match ("|cFFE6CC80")) then -- If itemType is Artifact colour
			local ap = string.match(WorldMapTooltipTooltipTextLeft4:GetText(), '%d+,?%d+,?%d+'):gsub(",","")
			artifactPower = tonumber ( ap )
		end
		if WorldQuestTipsData.global.options.showTimes and artifactPower and averageTime and averageTimeInMin > 1 then
			local averageArtifactPower = math.floor( artifactPower / averageTimeInMin )
		--	WorldMapTooltip.ItemTooltip.Tooltip:AddLine("|cffe6cc80"..averageArtifactPower.. " Artifact Power per minute")
		--	WorldMapTooltip:AddLine("|cffffffff"..averageArtifactPower.." "..itemType.."|cffffffff per min")
			WorldMapTooltipTooltipTextLeft2:SetText( itemType.." ("..averageArtifactPower.." "..L.PER_MINUTE..")" )
		end
		if debugging then WorldMapTooltip.ItemTooltip.Tooltip:AddDoubleLine("QuestID:", questID) end
		WorldMapTooltip.ItemTooltip.Tooltip:Show()
	else
		if debugging then WorldMapTooltip:AddDoubleLine("QuestID:", questID) end
	end
end)

local enigma = GetSpellInfo(219247)
local function enigmaticUpdate()
	if WorldQuestTipsData.global.options.useEnigmatic then
		if UnitDebuff("player", enigma) then
			if not enigmaticAttempting then
				enigmaticAttempting = true
				WorldQuestTips:loadEnigmatic()
				WorldQuestTips:loadEnigmaticHUD()
			end
		else
			if enigmaticAttempting then
				enigmaticAttempting = false
				WorldQuestTips.enigmaticHUD:Hide()
				WorldQuestTips:loadEnigmatic()
			end
		end
	end
end

local function onUpdate(self,elapsed)
    closedtimer = closedtimer + elapsed
	if closedtimer >= 1 then
		if refreshing then
			BonusObjectiveTracker_ShowRewardsTooltip(refreshingblock);
			closedtimer = 0
		end
		if enigmaticActive then
			enigmaticUpdate()
			closedtimer = 0
		else
			enigmaticAttempting = false
		end
    end
	if enigmaticAttempting and WorldQuestTips.enigmaticHUD then
		local enigmaticHUD = WorldQuestTips.enigmaticHUD
		local facing = GetPlayerFacing()
		if facing then
			local newFacing = facing - enigmaticHUD.initialMP.r
			enigmaticHUD.arrow.texture:SetRotation( newFacing )
			
			local unitX, unitY = GetPlayerMapPosition("player")
			
			local movedX = enigmaticHUD.zone.x * ( unitX - enigmaticHUD.initialMP.x )
			local movedY = enigmaticHUD.zone.y * ( unitY - enigmaticHUD.initialMP.y )
			
			local dist = math.sqrt( movedX^2 + movedY^2 )

			local actualAng = math.atan2( movedX, movedY ) + math.pi
			
			movedX = ( dist * math.sin( enigmaticHUD.initialMP.r - actualAng ) ) * 0.4
			movedY = ( dist * math.cos( enigmaticHUD.initialMP.r - actualAng ) ) * 0.4
			
			local movedTextureX = enigmaticHUD.initialTP.x + movedX * WorldQuestTipsData.global.options.enigmaticHUDSize
			local movedTextureY = enigmaticHUD.initialTP.y + movedY * WorldQuestTipsData.global.options.enigmaticHUDSize
			
			enigmaticHUD.arrow:SetPoint("CENTER", enigmaticHUD, "BOTTOMLEFT", movedTextureX, movedTextureY )
		end
	end
end
local f = CreateFrame("frame")
f:SetScript("OnUpdate", onUpdate)

hooksecurefunc ("BonusObjectiveTracker_OnBlockClick", function (self)
	if IsAltKeyDown() and WorldQuestTipsData.global.options.EditOnC then
		WorldQuestTips:loadOptions( self.id )
	end
end)

local lastTrackedQuestID = nil

hooksecurefunc ("BonusObjectiveTracker_TrackWorldQuest", function (questID, hardWatch)
	if lastTrackedQuestID and not IsWorldQuestWatched(lastTrackedQuestID) then
		if awqwp[lastTrackedQuestID] then
			for i in pairs( awqwp[lastTrackedQuestID] ) do TomTom:RemoveWaypoint( awqwp[lastTrackedQuestID][i] ) end
		end
	end
	if hardWatch then lastTrackedQuestID = nil else lastTrackedQuestID = questID end
	
	local info = WorldQuestTipsData.global.worldQuests[ questID ].coords.default
	local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(questID);
	addWayPoints( questID, "click", info.m, info.f, info.x, info.y, title )
end)

hooksecurefunc ("BonusObjectiveTracker_UntrackWorldQuest", function (questID)
	if awqwp[questID] then
		for i in pairs( awqwp[questID] ) do TomTom:RemoveWaypoint( awqwp[questID][i] ) end
	end
end)

hooksecurefunc ("BonusObjectiveTracker_OnBlockLeave", function (self)
	refreshing = false
end)

hooksecurefunc ("BonusObjectiveTracker_ShowRewardsTooltip", function (self)
	local tagID, tagName, worldQuestType, rarity, isElite, tradeskillLineIndex = GetQuestTagInfo(self.id);
	if worldQuestType then
		local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(self.id);
		local faction1, faction2 = "", "";
		
		if WorldQuestTipsData.global.worldQuests[self.id] == nil then
			findQuest(self.questID)
		end
		if WorldQuestTipsData.global.worldQuests[self.id].coords == nil then
			findQuest(self.questID)
		end
	--	local info, zone = findQuest( self.id )
		if ( factionID ) then
			--name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(factionID)
			local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID(factionID);
			barMax = (barMax - barMin)/10000;
			local barValue = math.floor( (value - barMin)/1000 ) / 10
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
			if ( factionName ) then
				if (capped) then
					if WorldQuestTipsData.global.options.showExalted then
						if WorldQuestTipsData.global.options.showCurrentRep then
							faction1 = factionName.." ("..factionStandingtext..")"
						else
							faction1 = factionName
						end
					end
				else
					if WorldQuestTipsData.global.options.showCurrentRep then
						faction1 = factionName.." ("..factionStandingtext.." "..barValue.."w /"..barMax.."w)"
					else
						faction1 = factionName
					end
					if factionStanding == 8 and not WorldQuestTipsData.global.options.showExalted then
						faction1 = "";
					end
				end
			end
		--	if WorldQuestTipsData.global.worldQuests[self.id].coords then 
		--	local _, zone = C_TaskQuest.GetQuestZoneID( self.questID )
			local zone = WorldQuestTipsData.global.worldQuests[self.id].coords.default.m
		--	end
			if zoneFactions[zone] and zoneFactions[zone] ~= factionID then
				local factionName2,_,factionStanding2,barMin2,barMax2,value2 = GetFactionInfoByID(zoneFactions[zone]);
				barMax2 = (barMax2 - barMin2)/10000;
				local barValue2 = math.floor( (value2 - barMin2)/1000 ) / 10
				local factionStandingtext2 = GetText("FACTION_STANDING_LABEL"..factionStanding2, gender);
				if ( factionName2 ) then
					if value2 == 42999 then
						if WorldQuestTipsData.global.options.showExalted then
							if WorldQuestTipsData.global.options.showCurrentRep then
								faction2 = factionName2.." ("..factionStandingtext2..")"
							else
								faction2 = factionName2
							end
						end
					else
						if WorldQuestTipsData.global.options.showCurrentRep then
							faction2 = factionName2.." ("..factionStandingtext2.." "..barValue2.."w /"..barMax2.."w)"
						else
							faction2 = factionName2
						end
						if factionStanding2 == 8 and not WorldQuestTipsData.global.options.showExalted then
							faction2 = "";
						end
					end
					if faction1 ~= "" then faction1 = faction1.."\n" end
				end
			end
		end
		local timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(self.id) * 60
		if timeLeftMinutes then
			if faction1 ~= "" or faction2 ~= "" then
				GameTooltipTextLeft2:SetText("|cffffd100"..faction1..faction2.."\n"..BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)))
			else
				GameTooltipTextLeft2:SetText("|cffffd100"..BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)).."\n ")
			end
		end
		refreshing = true
		refreshingblock = self
		if not dataloaded then getdata() end
		if pet_tamers[pet_quests[self.id] ] ~= nil or botbi[self.id] == false then
			addpetlines( GameTooltip, pet_quests[self.id], botbi[self.id] )
		end
		
		if WorldQuestTipsData.global.worldQuests[self.id] and WorldQuestTipsData.global.worldQuests[self.id].note ~= nil then
			GameTooltip:AddLine("|cffffff00"..LABEL_NOTE..": |cffffffff"..WorldQuestTipsData.global.worldQuests[self.id].note,1,1,1, true)
		end
		
		local averageTime
		local averageTimeStr = " "
		local currentTimeStr = " "
		if WorldQuestTipsData.global.worldQuests[self.id] and WorldQuestTipsData.global.worldQuests[self.id].completed > 0 then
			averageTime = math.floor( WorldQuestTipsData.global.worldQuests[self.id].timespent/WorldQuestTipsData.global.worldQuests[self.id].completed )
			if averageTime > 0 then averageTimeStr = "("..L.AVERAGE..": "..SecondsToTime(averageTime)..")" end
		end
		if tracking[self.id] then
			local currentTime
			if tracking[self.id].active then
				currentTime = tracking[self.id].duration + ( time() - tracking[self.id].start )
			else
				currentTime = tracking[self.id].duration
			end
			if currentTime > 0 then currentTimeStr = TIME_LABEL.." "..SecondsToTime(currentTime) end
		end
		if WorldQuestTipsData.global.options.showTimes and (averageTime or tracking[self.id]) then GameTooltip:AddDoubleLine( currentTimeStr, averageTimeStr ) end
		
		GameTooltip:Show()
	end
end)

-- This snipet is thanks to Vildiesel - EU Well of Eternity "Precise World Quest Timer"
hooksecurefunc("WorldMap_AddQuestTimeToTooltip", function(questID)
	local timeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(questID) * 60
	if timeLeftMinutes then
		_G["WorldMapTooltipTextLeft"..WorldMapTooltip:NumLines()]:SetText(BONUS_OBJECTIVE_TIME_LEFT:format(SecondsToTime(timeLeftMinutes)).."\n")
	end
end)

--[[ Adds tooltip to NPCs --]]
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	if not dataloaded then getdata() end
	if C_PetBattles.IsInBattle() then return end
	local unit = select(2, self:GetUnit())
	if unit then
		local name = UnitName(unit) or ""
		if pet_tamers[name] ~= nil then
			local questID
			for k, v in pairs(pet_quests) do
				if v == name then questID = k end
			end
			addpetlines( GameTooltip, name, botbi[questID] )
			GameTooltip:Show()
		end
	end
end)

local function addRepToToolTip( self, factionID )
	if WorldQuestTipsData.global.options.showRepOnItems then
		local factionName,_,factionStanding,barMin,barMax,value = GetFactionInfoByID( factionID );
		barMax = (barMax - barMin)/10000;
		local barValue = math.floor( (value - barMin)/1000 ) / 10
		local factionStandingtext = GetText("FACTION_STANDING_LABEL"..factionStanding, gender);
		local colour = "|cff808080"
		if factionStanding < 8 then
			factionStandingtext = factionStandingtext.." "..barValue.."w /"..barMax.."w"
			colour = "|cffffd100"
		end
		if not ( factionStanding == 8 and not WorldQuestTipsData.global.options.showExalted ) then
			_G[ self:GetName().."TextLeft2" ]:SetText( colour..factionStandingtext.."\124r\n".._G[ self:GetName().."TextLeft2" ]:GetText().." ")
		end
		
		if WorldQuestTipsData.global.options.showAltRepOnItems then
			for i = 1, self:NumLines() do
			--	if string.find(_G[ self:GetName().."TextLeft"..i ]:GetText(),ITEM_BNETACCOUNTBOUND) and IsAltKeyDown() then
				if string.find(_G[ self:GetName().."TextLeft"..i ]:GetText(),ITEM_BNETACCOUNTBOUND) or string.find(_G[ self:GetName().."TextLeft"..i ]:GetText(),ITEM_BIND_TO_BNETACCOUNT) then
					for k,v in pairs( WorldQuestTipsData ) do
						if k ~= "global" and k ~= profileKey then
							if v.info and v.info.level > 100 then
								local color = RAID_CLASS_COLORS[v.info.class]
								local level = ""
								if v.info.level < 110 then level = "|cffffffff ("..v.info.level..")" end
								if not ( string.find( v.reps[ factionID ], "|cff808080" ) and not WorldQuestTipsData.global.options.showExalted ) then
									self:AddDoubleLine( v.info.name..level, v.reps[factionID], color.r, color.g, color.b )
								end
							end
						end
					end
				end
			end
		end
		self:Show()
	end
end

hooksecurefunc(ItemRefTooltip, "SetHyperlink", function(self, link)
	local type, id = string.match(link,"^(%a+):(%d+)")
	if type == "item" and repitems[ id ] then
		addRepToToolTip( self, repitems[ id ] )
	end
end)

hooksecurefunc(WorldMapFrame.UIElementsFrame.BountyBoard, "ShowBountyTooltip", function(self, i)
	addRepToToolTip( WorldMapTooltip, self.bounties[ i ].factionID )
end)

GameTooltip:HookScript("OnTooltipSetItem", function(self)
	local link = select(2, self:GetItem())
	if link then
		local id = string.match(link, "item:(%d*)")
		if id and repitems[ id ] then
			addRepToToolTip( self, repitems[ id ] )
		end
	end
end)

WorldMapFrame:HookScript("OnShow", function(self)
	if wqto then
		wqto:SetParent("WorldMapFrame")
		wqto:SetFrameLevel(999)
	end
end)

WorldMapFrame:HookScript("OnHide", function(self)
	if wqto then
		wqto:SetParent("UIParent")
	end
end)

local currentQuestEdit

local function fillQuestInfo( questID )
	if questID ~= nil then
		currentQuestEdit = questID
	else
		currentQuestEdit = wqto.q.qid:GetNumber()
	end
	--local title = C_TaskQuest.GetQuestInfoByQuestID( currentQuestEdit )
	local title
	if currentQuestEdit ~= 0 and WorldQuestTipsData.global.worldQuests[ currentQuestEdit ] ~= nil then title = WorldQuestTipsData.global.worldQuests[ currentQuestEdit ].title end
	if title then
		wqto.q.qlink.name:SetText( "[ "..title.." ]" )
	end
	if WorldQuestTipsData.global.worldQuests[currentQuestEdit] ~= nil then
		if WorldQuestTipsData.global.worldQuests[currentQuestEdit].note then
			wqto.q.qnote:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].note )
		else
			wqto.q.qnote:SetText( "" )
			WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = nil
		end
		if wqto.q.qid:GetNumber() ~= currentQuestEdit then wqto.q.qid:SetNumber( currentQuestEdit ) end
		wqto.q.qnote:Enable()
		wqto.q.qnote:SetTextColor( 1,1,1 )
		wqto.q.qwowhead:SetText( wowhead .. currentQuestEdit )
		wqto.q.qtc:Enable()
		wqto.q.qtc:SetTextColor( 1,1,1 )
		wqto.q.qtc:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed )
		wqto.q.qtt:Enable()
		wqto.q.qtt:SetTextColor( 1,1,1 )
		wqto.q.qtt:SetText( WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent )
		local averageTime = math.floor( WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent/WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed )
		if WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed > 0 then
			wqto.q.qave:SetText( L.AVERAGE..": "..SecondsToTime(averageTime) )
		else
			wqto.q.qave:SetText( "" )
		end
	else
		if currentQuestEdit == 0 then wqto.q.qlink.name:SetText( " " )
		else wqto.q.qlink.name:SetText( "Data not found for ".. L.OPTIONS_Q_ID ..": "..currentQuestEdit ) end
		currentQuestEdit = nil
		wqto.q.qnote:SetText( L.OPTIONS_Q_NOTE_TIP .. "..." )
		wqto.q.qnote:SetTextColor( GRAY_FONT_COLOR:GetRGB() )
		wqto.q.qnote:Disable()
		wqto.q.qtc:SetText( "" )
		wqto.q.qtc:Disable()
		wqto.q.qtt:SetText( "" )
		wqto.q.qtt:Disable()
		wqto.q.qwowhead:SetText( "" )
		wqto.q.qave:SetText( "" )
	end
	if botbi[currentQuestEdit] then wqto.q.qxufu:Show(); wqto.q.qxufu:SetText("www.wow-petguide.com/index.php?m=LegionWQ") else wqto.q.qxufu:Hide() end
end

function WorldQuestTips:loadOptions( questID )
	
	if not dataloaded then getdata() end
	
	local tablist = { g = GENERAL, r = REPUTATION, o = TOOLTIP_BATTLE_PET, q = QUESTS_LABEL, e = "Enigmatic" }
	if wqto == nil then
		local initParent = UIParent
		if WorldMapFrame:IsShown() then initParent = WorldMapFrame end
		
		wqto = CreateFrame("FRAME", nil, initParent)
		wqto:SetWidth(410)
		wqto:SetHeight(440)
		wqto:SetPoint("CENTER", UIParent, "CENTER")
		wqto:SetBackdrop({
			bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		})
		wqto:SetFrameLevel(999)
		wqto:SetMovable(true)
		  
		wqto.tabs = CreateFrame("FRAME", nil, wqto)
		wqto.tabs:SetWidth(200)
		wqto.tabs:SetHeight(440)
		wqto.tabs:SetPoint("RIGHT", wqto, "LEFT", 16, 0)
		wqto.tabs:SetBackdrop({
			bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		  })
		wqto.tabs.footer = wqto.tabs:CreateFontString(nil, wqto.tabs, "GameFontWhite" )
		wqto.tabs.footer:SetPoint("BOTTOM", 0, 20 )

		wqto.header = CreateFrame("FRAME", nil, wqto)
		wqto.header:SetSize(384, 64)
		wqto.header:SetBackdrop({ bgFile = "Interface/DialogFrame/UI-DialogBox-Header" })
		wqto.header:SetPoint("TOP", wqto, "TOP", 0, 12)
		wqto.header:EnableMouse(true)
		wqto.header:SetScript("OnMouseDown", function(self) self:GetParent():StartMoving() end )
		wqto.header:SetScript("OnMouseUp", function(self) self:GetParent():StopMovingOrSizing() end )
		wqto.header.text = wqto.header:CreateFontString(nil, wqto.header, "GameFontNormal" )
		wqto.header.text:SetText( L.TITLE )
		wqto.header.text:SetPoint("TOP", 0, -14)
		
		local tabbtnoffset = -32;
		local function makeTabBtns( x, v )
			wqto.tabBtno = CreateFrame("BUTTON", nil, wqto.tabs, "UIPanelButtonTemplate")
			wqto.tabBtno:SetWidth(150)
			wqto.tabBtno:SetHeight(24)
			wqto.tabBtno:SetText( v )
			wqto.tabBtno:SetPoint("TOP", wqto.tabs, 0, tabbtnoffset )
			wqto.tabBtno:SetScript("OnClick", function() for z in pairs(tablist) do wqto[z]:Hide() end wqto[x]:Show() end)
			wqto.tabBtno:SetAlpha(1)
			wqto.tabBtno:Show()
		end
		for x, v in pairs(tablist) do
			makeTabBtns( x, v )
			tabbtnoffset = tabbtnoffset - 32
		end
		
		local g = CreateFrame("FRAME", nil, wqto)
		g:SetWidth(410)
		g:SetHeight(440)
		g:SetPoint("CENTER", wqto, "CENTER")
		g.subtitle_tomtom = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_tomtom:SetText("TomTom support:");
		g.subtitle_tomtom:SetPoint("TOPLEFT", 20, -60 )
		
		g.option_TomTomMP = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomMP:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -5);
		g.option_TomTomMP.text:SetText("Add way point on World Map quest tracking");
		g.option_TomTomMP.text:SetFontObject("GameFontNormal")
		g.option_TomTomMP:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\"\n\nAdds a waypoint to Blizzards PoI if there's no data"); GameTooltip:Show() end)
		g.option_TomTomMP:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomMP then g.option_TomTomMP:SetChecked(true) end
		g.option_TomTomMP:SetScript("OnClick", function() if g.option_TomTomMP:GetChecked() then WorldQuestTipsData.global.options.TomTomMP = true; else WorldQuestTipsData.global.options.TomTomMP = false end end);
		
		g.option_TomTomAQ = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomAQ:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -30);
		g.option_TomTomAQ.text:SetText("Add way point on World Quest auto accept");
		g.option_TomTomAQ.text:SetFontObject("GameFontNormal")
		g.option_TomTomAQ:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\""); GameTooltip:Show() end)
		g.option_TomTomAQ:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomAQ then g.option_TomTomAQ:SetChecked(true) end
		g.option_TomTomAQ:SetScript("OnClick", function() if g.option_TomTomAQ:GetChecked() then WorldQuestTipsData.global.options.TomTomAQ = true; else WorldQuestTipsData.global.options.TomTomAQ = false end end);
		
		g.option_TomTomLR = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_TomTomLR:SetPoint("TOPLEFT", g.subtitle_tomtom, "BOTTOMLEFT", 10, -55);
		g.option_TomTomLR.text:SetText("Add way points for Ley Races");
		g.option_TomTomLR.text:SetFontObject("GameFontNormal")
	--	g.option_TomTomLR:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds waypoints for"); GameTooltip:Show() end)
	--	g.option_TomTomLR:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.TomTomLR then g.option_TomTomLR:SetChecked(true) end
		g.option_TomTomLR:SetScript("OnClick", function() if g.option_TomTomLR:GetChecked() then WorldQuestTipsData.global.options.TomTomLR = true; else WorldQuestTipsData.global.options.TomTomLR = false end end);
		
		g.subtitle_EditQ = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_EditQ:SetText( L.OPTIONS_Q_INFO ..":" );
		g.subtitle_EditQ:SetPoint("TOPLEFT", g, 20, -165 )
		
		g.option_EditOnC = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_EditOnC:SetPoint("TOPLEFT", g.subtitle_EditQ, "BOTTOMLEFT", 10, -5);
		g.option_EditOnC.text:SetText( L.OPTIONS_G_OPEN_INFO );
		g.option_EditOnC.text:SetFontObject("GameFontNormal")
		--g.option_EditOnC:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("You can alt click on the Wolrd Quest on the world map\nor on the World Quest in the objective tracker"); GameTooltip:Show() end)
		--g.option_EditOnC:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.EditOnC then g.option_EditOnC:SetChecked(true) end
		g.option_EditOnC:SetScript("OnClick", function() if g.option_EditOnC:GetChecked() then WorldQuestTipsData.global.options.EditOnC = true; else WorldQuestTipsData.global.options.EditOnC = false end end);
		
		g.subtitle_ShowT = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_ShowT:SetText( QUEST_TIMERS .. ":");
		g.subtitle_ShowT:SetPoint("TOPLEFT", g, 20, -220 )
		
		g.option_ShowT = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_ShowT:SetPoint("TOPLEFT", g.subtitle_ShowT, "BOTTOMLEFT", 10, -5);
		g.option_ShowT.text:SetText( L.OPTIONS_G_TIMES );
		g.option_ShowT.text:SetFontObject("GameFontNormal")
		--g.option_ShowT:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable if you're not interested in seeing\ntimes in the tooltips or at quest completion"); GameTooltip:Show() end)
		--g.option_ShowT:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showTimes then g.option_ShowT:SetChecked(true) end
		g.option_ShowT:SetScript("OnClick", function() if g.option_ShowT:GetChecked() then WorldQuestTipsData.global.options.showTimes = true; else WorldQuestTipsData.global.options.showTimes = false end end);
		
		
		g.subtitle_Other = g:CreateFontString(nil, g, "GameFontNormal" )
		g.subtitle_Other:SetText( OTHER .. ":"); --BONUS_ROLL_REWARD_MONEY ="Gold"
		g.subtitle_Other:SetPoint("TOPLEFT", g, 20, -275 )
		
		g.option_HideSG = CreateFrame("CheckButton", nil, g, "UICheckButtonTemplate");
		g.option_HideSG:SetPoint("TOPLEFT", g.subtitle_Other, "BOTTOMLEFT", 10, -5);
		g.option_HideSG.text:SetText( "Hide small gold rewards from tooltip" );
		g.option_HideSG.text:SetFontObject("GameFontNormal")
		--g.option_HideSG:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable if you're not interested in seeing\ntimes in the tooltips or at quest completion"); GameTooltip:Show() end)
		--g.option_HideSG:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.hideSmallGold then g.option_HideSG:SetChecked(true) end
		g.option_HideSG:SetScript("OnClick", function() if g.option_HideSG:GetChecked() then WorldQuestTipsData.global.options.hideSmallGold = true; else WorldQuestTipsData.global.options.hideSmallGold = false end end);
		
		wqto.g = g;
		
		local r = CreateFrame("FRAME", nil, wqto)
		r:SetWidth(410)
		r:SetHeight(440)
		r:SetPoint("CENTER", wqto, "CENTER")
		r.subtitle_Rep = r:CreateFontString(nil, r, "GameFontNormal" )
		r.subtitle_Rep:SetText( REPUTATION .. ":")
		r.subtitle_Rep:SetPoint("TOPLEFT", 20, -60 )
		
		r.option_CurRep = CreateFrame("CheckButton", nil, r, "UICheckButtonTemplate");
		r.option_CurRep:SetPoint("TOPLEFT", r.subtitle_Rep, "BOTTOMLEFT", 10, -5);
		r.option_CurRep.text:SetText( L.OPTIONS_G_REP_CUR );
		r.option_CurRep.text:SetFontObject("GameFontNormal")
		--r.option_CurRep:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Show your current standing with the relevant faction\nin tooltips, in the format \"Standing (#k / #k)\""); GameTooltip:Show() end)
		--r.option_CurRep:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showCurrentRep then r.option_CurRep:SetChecked(true) end
		r.option_CurRep:SetScript("OnClick", function() if r.option_CurRep:GetChecked() then WorldQuestTipsData.global.options.showCurrentRep = true; else WorldQuestTipsData.global.options.showCurrentRep = false end end);
		
		r.option_ShowEx = CreateFrame("CheckButton", nil, r, "UICheckButtonTemplate");
		r.option_ShowEx:SetPoint("TOPLEFT", r.subtitle_Rep, "BOTTOMLEFT", 10, -30);
		r.option_ShowEx.text:SetText( L.OPTIONS_G_REP_EX );
		r.option_ShowEx.text:SetFontObject("GameFontNormal")
		--r.option_ShowEx:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable to stop showing faction names in\ntooltips once you've reached exalted"); GameTooltip:Show() end)
		--r.option_ShowEx:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showExalted then r.option_ShowEx:SetChecked(true) end
		r.option_ShowEx:SetScript("OnClick", function() if r.option_ShowEx:GetChecked() then WorldQuestTipsData.global.options.showExalted = true; else WorldQuestTipsData.global.options.showExalted = false end end);
		
		r.option_ShowROI = CreateFrame("CheckButton", nil, r, "UICheckButtonTemplate");
		r.option_ShowROI:SetPoint("TOPLEFT", r.subtitle_Rep, "BOTTOMLEFT", 10, -55);
		r.option_ShowROI.text:SetText( "Show reputation on faction insignia" );
		r.option_ShowROI.text:SetFontObject("GameFontNormal")
		--r.option_ShowROI:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable to stop showing faction names in\ntooltips once you've reached exalted"); GameTooltip:Show() end)
		--r.option_ShowROI:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showExalted then r.option_ShowROI:SetChecked(true) end
		r.option_ShowROI:SetScript("OnClick", function() if r.option_ShowROI:GetChecked() then WorldQuestTipsData.global.options.showRepOnItems = true; else WorldQuestTipsData.global.options.showRepOnItems = false end end);
		
		r.option_ShowAROI = CreateFrame("CheckButton", nil, r, "UICheckButtonTemplate");
		r.option_ShowAROI:SetPoint("TOPLEFT", r.subtitle_Rep, "BOTTOMLEFT", 10, -80);
		r.option_ShowAROI.text:SetText( "Show alts reputations on BOA faction insignia" );
		r.option_ShowAROI.text:SetFontObject("GameFontNormal")
		--r.option_ShowAROI:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Disable to stop showing faction names in\ntooltips once you've reached exalted"); GameTooltip:Show() end)
		--r.option_ShowAROI:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.showExalted then r.option_ShowAROI:SetChecked(true) end
		r.option_ShowAROI:SetScript("OnClick", function() if r.option_ShowAROI:GetChecked() then WorldQuestTipsData.global.options.showAltRepOnItems = true; else WorldQuestTipsData.global.options.showAltRepOnItems = false end end);
		
		r:Hide()
		wqto.r = r;
		
		local e = CreateFrame("FRAME", nil, wqto)
		e:SetWidth(410)
		e:SetHeight(440)
		e:SetPoint("CENTER", wqto, "CENTER")
		e.subtitle_enigmatic = e:CreateFontString(nil, e, "GameFontNormal" )
		e.subtitle_enigmatic:SetText("Enigmatic Path Helper:");
		e.subtitle_enigmatic:SetPoint("TOPLEFT", 20, -60 )
		
		e.option_useEnigmatic = CreateFrame("CheckButton", nil, e, "UICheckButtonTemplate");
		e.option_useEnigmatic:SetPoint("TOPLEFT", e.subtitle_enigmatic, "BOTTOMLEFT", 10, -5);
		e.option_useEnigmatic.text:SetText("Enable Enigmatic Path Helper");
		e.option_useEnigmatic.text:SetFontObject("GameFontNormal")
		if WorldQuestTipsData.global.options.useEnigmatic then e.option_useEnigmatic:SetChecked(true) end
		e.option_useEnigmatic:SetScript("OnClick", function()
			if e.option_useEnigmatic:GetChecked() then
				WorldQuestTipsData.global.options.useEnigmatic = true
				if enigmaticActive then
					if WorldQuestTips.enigmatic == nil then WorldQuestTips:loadEnigmatic() end
					WorldQuestTips.enigmatic:Show()
				end
			else
				WorldQuestTipsData.global.options.useEnigmatic = false
				if WorldQuestTips.enigmatic then WorldQuestTips.enigmatic:Hide() end
				if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
			end
		end);
		
		e.subtitle_enigmaticPaths = e:CreateFontString(nil, e, "GameFontNormal" )
		e.subtitle_enigmaticPaths:SetText("Enigmatic Path Selector:");
		e.subtitle_enigmaticPaths:SetPoint("TOPLEFT", 20, -115 )
		
		e.option_enimaticMove = CreateFrame("CheckButton", nil, e, "UICheckButtonTemplate");
		e.option_enimaticMove:SetPoint("TOPLEFT", e.subtitle_enigmaticPaths, "BOTTOMLEFT", 10, -5);
		e.option_enimaticMove.text:SetText("Enable dragging");
		e.option_enimaticMove.text:SetFontObject("GameFontNormal")
		e.option_enimaticMove:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Enable/Lock moving the path selection frame\nThe position is saved between sessions"); GameTooltip:Show() end)
		e.option_enimaticMove:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.enigmaticMove then e.option_enimaticMove:SetChecked(true) end
		e.option_enimaticMove:SetScript("OnClick", function() if e.option_enimaticMove:GetChecked() then WorldQuestTipsData.global.options.enigmaticMove = true; else WorldQuestTipsData.global.options.enigmaticMove = false end WorldQuestTips:loadEnigmatic( "optionUpdate" ) end);
		
		e.toggleBtn = CreateFrame("BUTTON", nil, e, "UIPanelButtonTemplate")
		e.toggleBtn:SetWidth(64)
		e.toggleBtn:SetHeight(24)
		e.toggleBtn:SetText( "Toggle" )
		e.toggleBtn:SetPoint("TOPRIGHT", -20, -60 )
		e.toggleBtn:SetScript("OnClick", function()
								if WorldQuestTips.enigmatic == nil then
									WorldQuestTips:loadEnigmatic()
								elseif WorldQuestTips.enigmatic:IsShown() then
								--	WorldQuestTipsData.global.options.enigmaticPos = { left = WorldQuestTips.enigmatic:GetLeft(), bottom = WorldQuestTips.enigmatic:GetBottom() }
									WorldQuestTips.enigmatic:Hide()
									if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
								else
									WorldQuestTips.enigmatic:Show()
								end
							end)
		
		e.resetPosBtn = CreateFrame("BUTTON", nil, e, "UIPanelButtonTemplate")
		e.resetPosBtn:SetWidth(64)
		e.resetPosBtn:SetHeight(24)
		e.resetPosBtn:SetText( "Reset" )
		e.resetPosBtn:SetPoint("LEFT", e.option_enimaticMove.text, "RIGHT" );
		e.resetPosBtn:SetScript("OnClick", function()
								WorldQuestTipsData.global.options.enigmaticPos = "CENTER"
								WorldQuestTips:loadEnigmatic( "optionUpdate" )
							end)
							
		e.rowsSlider = CreateFrame('Slider', 'wqt_enigmatic_rowSlider', e, 'OptionsSliderTemplate')
		e.rowsSlider:SetPoint("TOPRIGHT", e, -40, -180);
		e.rowsSlider:SetMinMaxValues(1, table.getn( enigmaticPaths ) )
		e.rowsSlider:SetValue( WorldQuestTipsData.global.options.enigmaticRows )
		wqt_enigmatic_rowSliderLow:SetText(1);
		wqt_enigmatic_rowSliderHigh:SetText(table.getn( enigmaticPaths ));
		wqt_enigmatic_rowSliderText:SetText("Rows ("..WorldQuestTipsData.global.options.enigmaticRows..")");
		e.rowsSlider:SetScript("OnValueChanged", function(self, value)
								value = math.floor(value + 0.5)
								self:SetValue( value )
								wqt_enigmatic_rowSliderText:SetText("Rows ("..value..")");
								WorldQuestTipsData.global.options.enigmaticRows = value
								WorldQuestTips:loadEnigmatic( "optionUpdate" )
							end)
							
		e.sizeSlider = CreateFrame('Slider', 'wqt_enigmatic_sizeSlider', e, 'OptionsSliderTemplate')
		e.sizeSlider:SetPoint("TOPLEFT", e, 40, -180);
		e.sizeSlider:SetMinMaxValues(1, 32 )
		e.sizeSlider:SetValue( WorldQuestTipsData.global.options.enigmaticSize )
		wqt_enigmatic_sizeSliderLow:SetText(1);
		wqt_enigmatic_sizeSliderHigh:SetText(32);
		wqt_enigmatic_sizeSliderText:SetText("Size ("..WorldQuestTipsData.global.options.enigmaticSize..")");
		e.sizeSlider:SetScript("OnValueChanged", function(self, value)
								value = math.floor(value + 0.5)
								self:SetValue( value )
								wqt_enigmatic_sizeSliderText:SetText("Size ("..value..")");
								WorldQuestTipsData.global.options.enigmaticSize = value
								WorldQuestTips:loadEnigmatic( "optionUpdate" )
							end)
		
		
		e.subtitle_enigmaticHUD = e:CreateFontString(nil, e, "GameFontNormal" )
		e.subtitle_enigmaticHUD:SetText("Enigmatic HUD:");
		e.subtitle_enigmaticHUD:SetPoint("TOPLEFT", 20, -220 )
		
		e.option_useEnigmaticHUD = CreateFrame("CheckButton", nil, e, "UICheckButtonTemplate");
		e.option_useEnigmaticHUD:SetPoint("TOPLEFT", e.subtitle_enigmaticHUD, "BOTTOMLEFT", 10, -5);
		e.option_useEnigmaticHUD.text:SetText("Enable Enigmatic HUD");
		e.option_useEnigmaticHUD.text:SetFontObject("GameFontNormal")
		if WorldQuestTipsData.global.options.useEnigmaticHUD then e.option_useEnigmaticHUD:SetChecked(true) end
		e.option_useEnigmaticHUD:SetScript("OnClick", function()
			if e.option_useEnigmaticHUD:GetChecked() then
				WorldQuestTipsData.global.options.useEnigmaticHUD = true
			else
				WorldQuestTipsData.global.options.useEnigmaticHUD = false
				if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
			end
		end);
		
		e.option_enimaticHUDMove = CreateFrame("CheckButton", nil, e, "UICheckButtonTemplate");
		e.option_enimaticHUDMove:SetPoint("TOPLEFT", e.subtitle_enigmaticHUD, "BOTTOMLEFT", 10, -30);
		e.option_enimaticHUDMove.text:SetText("Enable dragging");
		e.option_enimaticHUDMove.text:SetFontObject("GameFontNormal")
		e.option_enimaticHUDMove:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Enable/Lock moving the HUD frame\nThe position is saved between sessions"); GameTooltip:Show() end)
		e.option_enimaticHUDMove:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.enigmaticHUDMove then e.option_enimaticHUDMove:SetChecked(true) end
		e.option_enimaticHUDMove:SetScript("OnClick", function() if e.option_enimaticHUDMove:GetChecked() then WorldQuestTipsData.global.options.enigmaticHUDMove = true; else WorldQuestTipsData.global.options.enigmaticHUDMove = false end WorldQuestTips:loadEnigmaticHUD( "optionUpdate" ) end);
		
		e.resetHUDPosBtn = CreateFrame("BUTTON", nil, e, "UIPanelButtonTemplate")
		e.resetHUDPosBtn:SetWidth(64)
		e.resetHUDPosBtn:SetHeight(24)
		e.resetHUDPosBtn:SetText( "Reset" )
		e.resetHUDPosBtn:SetPoint("LEFT", e.option_enimaticHUDMove.text, "RIGHT" );
		e.resetHUDPosBtn:SetScript("OnClick", function()
								WorldQuestTipsData.global.options.enigmaticHUDPos = "CENTER"
								WorldQuestTips:loadEnigmaticHUD( "optionUpdate" )
							end)
		e.HUDsizeSlider = CreateFrame('Slider', 'wqt_enigmatic_HUDsizeSlider', e, 'OptionsSliderTemplate')
		e.HUDsizeSlider:SetPoint("TOPLEFT", e, 40, -310);
		e.HUDsizeSlider:SetMinMaxValues(1, 96 )
		e.HUDsizeSlider:SetValue( WorldQuestTipsData.global.options.enigmaticHUDSize )
		wqt_enigmatic_HUDsizeSliderLow:SetText(1);
		wqt_enigmatic_HUDsizeSliderHigh:SetText(96);
		wqt_enigmatic_HUDsizeSliderText:SetText("Size ("..WorldQuestTipsData.global.options.enigmaticHUDSize..")");
		e.HUDsizeSlider:SetScript("OnValueChanged", function(self, value)
								value = math.floor(value + 0.5)
								self:SetValue( value )
								wqt_enigmatic_HUDsizeSliderText:SetText("Size ("..value..")");
								WorldQuestTipsData.global.options.enigmaticHUDSize = value
								WorldQuestTips:loadEnigmaticHUD( "optionUpdate" )
							end)
		
		e.option_enimaticHUDPathDim = CreateFrame("CheckButton", nil, e, "UICheckButtonTemplate");
		e.option_enimaticHUDPathDim:SetPoint("TOPLEFT", e.subtitle_enigmaticHUD, "BOTTOMLEFT", 10, -120);
		e.option_enimaticHUDPathDim.text:SetText("Invert path");
		e.option_enimaticHUDPathDim.text:SetFontObject("GameFontNormal")
		e.option_enimaticHUDPathDim:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Enable/Lock moving the HUD frame\nThe position is saved between sessions"); GameTooltip:Show() end)
		e.option_enimaticHUDPathDim:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		if WorldQuestTipsData.global.options.enigmaticHUDPathDim then e.option_enimaticHUDPathDim:SetChecked(true) end
		e.option_enimaticHUDPathDim:SetScript("OnClick", function()
			if e.option_enimaticHUDPathDim:GetChecked() then
				WorldQuestTipsData.global.options.enigmaticHUDPathDim = true;
			else
				WorldQuestTipsData.global.options.enigmaticHUDPathDim = false
			end
			local pathA = WorldQuestTipsData.global.options.enigmaticHUDEdgeA
			local edgeA = WorldQuestTipsData.global.options.enigmaticHUDPathA
			wqt_enigmatic_HUDEdgeASliderText:SetText("Edge Alpha ("..edgeA..")");
			WorldQuestTipsData.global.options.enigmaticHUDEdgeA = edgeA
			wqto.e.HUDEdgeASlider:SetValue( edgeA )
			wqt_enigmatic_HUDPathASliderText:SetText("Path Alpha ("..pathA..")");
			WorldQuestTipsData.global.options.enigmaticHUDPathA = pathA
			wqto.e.HUDPathASlider:SetValue( pathA )
			WorldQuestTips:loadEnigmaticHUD( "optionUpdate" )
		end);
		
		e.HUDPathASlider = CreateFrame('Slider', 'wqt_enigmatic_HUDPathASlider', e, 'OptionsSliderTemplate')
		e.HUDPathASlider:SetPoint("TOPRIGHT", e, -40, -310);
		e.HUDPathASlider:SetMinMaxValues(0, 1 )
		e.HUDPathASlider:SetValue( WorldQuestTipsData.global.options.enigmaticHUDPathA )
		wqt_enigmatic_HUDPathASliderLow:SetText(0);
		wqt_enigmatic_HUDPathASliderHigh:SetText(1);
		wqt_enigmatic_HUDPathASliderText:SetText("Path Alpha ("..WorldQuestTipsData.global.options.enigmaticHUDPathA..")");
		e.HUDPathASlider:SetScript("OnValueChanged", function(self, value)
								value = math.floor(value*100 + 0.5)/100
								self:SetValue( value )
								wqt_enigmatic_HUDPathASliderText:SetText("Path Alpha ("..value..")");
								WorldQuestTipsData.global.options.enigmaticHUDPathA = value
								WorldQuestTips:loadEnigmaticHUD( "optionUpdate" )
							end)
		
		e.HUDEdgeASlider = CreateFrame('Slider', 'wqt_enigmatic_HUDEdgeASlider', e, 'OptionsSliderTemplate')
		e.HUDEdgeASlider:SetPoint("TOPRIGHT", e, -40, -360);
		e.HUDEdgeASlider:SetMinMaxValues(0, 1 )
		e.HUDEdgeASlider:SetValue( WorldQuestTipsData.global.options.enigmaticHUDEdgeA )
		wqt_enigmatic_HUDEdgeASliderLow:SetText(0);
		wqt_enigmatic_HUDEdgeASliderHigh:SetText(1);
		wqt_enigmatic_HUDEdgeASliderText:SetText("Edge Alpha ("..WorldQuestTipsData.global.options.enigmaticHUDEdgeA..")");
		e.HUDEdgeASlider:SetScript("OnValueChanged", function(self, value)
								value = math.floor(value*100 + 0.5)/100
								self:SetValue( value )
								wqt_enigmatic_HUDEdgeASliderText:SetText("Edge Alpha ("..value..")");
								WorldQuestTipsData.global.options.enigmaticHUDEdgeA = value
								WorldQuestTips:loadEnigmaticHUD( "optionUpdate" )
							end)
		
		e:Hide()
		wqto.e = e;
		
		
		local q = CreateFrame("FRAME", nil, wqto)
		q:SetWidth(410)
		q:SetHeight(440)
		q:SetPoint("CENTER", wqto, "CENTER")
		q.subtitle_qi = q:CreateFontString(nil, q, "GameFontNormal" )
		q.subtitle_qi:SetText( L.OPTIONS_Q_INFO .. ":" );
		q.subtitle_qi:SetPoint("TOPLEFT", 20, -60 )
		
		q.qid = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qid:SetPoint("TOPRIGHT", -20, -54);
		q.qid:SetFontObject("GameFontWhite")
		q.qid:SetMaxLetters(6)
		q.qid:SetNumeric(true)
		q.qid:SetAutoFocus(false)
		q.qid:SetWidth(64)
		q.qid:SetHeight(24)
		q.qid:SetCursorPosition(0)
		q.qid:SetJustifyH("CENTER")
		q.qidt = q:CreateFontString();
		q.qidt:SetPoint("RIGHT", q.qid, "LEFT", -10, 0);
		q.qidt:SetFontObject("GameFontNormal");
		q.qidt:SetText( L.OPTIONS_Q_ID .. ":" )
		q.qid:SetScript("OnEnterPressed", function(self)
			self:ClearFocus();
			currentQuestEdit = self:GetNumber()
			fillQuestInfo( currentQuestEdit )
		end);
	
		q.qlink = CreateFrame("FRAME", nil, q)
		q.qlink:SetWidth(410)
		q.qlink:SetHeight(24)
		q.qlink:SetPoint("TOP", q, 0, -100 )
		q.qlink.name = q.qlink:CreateFontString(nil, q, "GameFontNormalLarge" )
		q.qlink.name:SetPoint("CENTER", q.qlink)
		
		q.qnotet = q.qlink:CreateFontString(nil, q, "GameFontNormal" )
		q.qnotet:SetText( L.OPTIONS_Q_NOTE .. ":");
		q.qnotet:SetPoint("TOP", q.qlink, "BOTTOM", 0, -10)
		
		q.qnote = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qnote:SetPoint("TOP", q.qnotet, "BOTTOM");
		q.qnote:SetMaxLetters(256)
		q.qnote:SetAutoFocus(false)
		q.qnote:SetWidth(360)
		q.qnote:SetHeight(24)
		q.qnote:SetCursorPosition(0)
		q.qnote:SetJustifyH("LEFT")
		q.qnote:SetText( L.OPTIONS_Q_NOTE_TIP .. "..." )
		q.qnote:SetTextColor( GRAY_FONT_COLOR:GetRGB() )
	--	q.qnote:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText(""); GameTooltip:Show() end)
	--	q.qnote:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		
		q.qnote:SetScript("OnKeyDown", function(self, key)
			local oldNote = WorldQuestTipsData.global.worldQuests[currentQuestEdit].note or ""
			q.qnote:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then q.qnote:SetText( oldNote )
			elseif key == "ENTER" then 
				q.qnote:ClearFocus()
				local newNote = q.qnote:GetText()
				if newNote == nil or newNote == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = nil
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].note = newNote end
			else
			q.qnote:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		
		q.qnote:Disable()
		
	--	g.option_TomTomMP:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("Adds a useful waypoint if there's data for it\ne.g. \"Cave entrance to WANTED:x\"\n\nAdds a waypoint to Blizzards PoI if there's no data"); GameTooltip:Show() end)
	--	g.option_TomTomMP:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		
		q.qwowhead = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qwowhead:SetPoint("BOTTOM", q, "BOTTOM", 0, 60);
		q.qwowhead:SetMaxLetters(256)
		q.qwowhead:SetAutoFocus(false)
		q.qwowhead:SetWidth(360)
		q.qwowhead:SetHeight(24)
		q.qwowhead:SetCursorPosition(0)
		q.qwowhead:SetJustifyH("CENTER")
		q.qwowhead:SetTextColor( 1,1,1 )
		
		q.qxufu = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qxufu:SetPoint("BOTTOM", q.qwowhead, "TOP");
		q.qxufu:SetMaxLetters(256)
		q.qxufu:SetAutoFocus(false)
		q.qxufu:SetWidth(360)
		q.qxufu:SetHeight(24)
		q.qxufu:SetCursorPosition(0)
		q.qxufu:SetJustifyH("CENTER")
		q.qxufu:SetTextColor( 1,1,1 )
		q.qxufu:Hide()
		
		q.qave = q:CreateFontString(nil, q, "GameFontNormal" )
		q.qave:SetPoint("BOTTOMLEFT", q.qxufu, "TOPLEFT", 90, 20)
		
		q.qtc = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qtc:SetPoint("BOTTOMLEFT", q.qave, "TOPLEFT");
		q.qtc:SetMaxLetters(6)
		q.qtc:SetAutoFocus(false)
		q.qtc:SetNumeric(true)
		q.qtc:SetWidth(36)
		q.qtc:SetHeight(24)
		q.qtc:SetCursorPosition(0)
		q.qtc:SetJustifyH("CENTER")
		q.qtc:SetScript("OnKeyDown", function(self, key)
			local oldVal = WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed or 0
			self:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then self:SetNumber( oldVal )
			elseif key == "ENTER" then 
				self:ClearFocus()
				local newVal = math.floor(math.abs(self:GetNumber()))
				if newVal == nil or newVal == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed = 0
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].completed = newVal end
				fillQuestInfo( currentQuestEdit )
			else
			self:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		q.qtc:Disable()
		
		q.qtc.text = q.qtc:CreateFontString(nil, q, "GameFontNormal" )
		q.qtc.text:SetText( L.OPTIONS_Q_TC );
		q.qtc.text:SetPoint("LEFT", q.qtc, "RIGHT", 5, 0)
		
		q.qtt = CreateFrame("EditBox", nil, q, "InputBoxTemplate");
		q.qtt:SetPoint("BOTTOMLEFT", q.qtc, "TOPLEFT");
		q.qtt:SetMaxLetters(6)
		q.qtt:SetAutoFocus(false)
		q.qtt:SetNumeric(true)
		q.qtt:SetWidth(36)
		q.qtt:SetHeight(24)
		q.qtt:SetCursorPosition(0)
		q.qtt:SetJustifyH("CENTER")
		q.qtt:SetScript("OnKeyDown", function(self, key)
			local oldVal = WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent or 0
			self:SetTextColor( 1,1,1 )
			if key == "ESCAPE" then self:SetNumber( oldVal )
			elseif key == "ENTER" then 
				self:ClearFocus()
				local newVal = math.floor(math.abs(self:GetNumber()))
				if newVal == nil or newVal == "" then
					WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent = 0
				else WorldQuestTipsData.global.worldQuests[currentQuestEdit].timespent = newVal end
				fillQuestInfo( currentQuestEdit )
			else
			self:SetTextColor( GREEN_FONT_COLOR:GetRGB() )
			end
		end)
		q.qtt:Disable()
		
		q.qtt.text = q.qtt:CreateFontString(nil, q, "GameFontNormal" )
		q.qtt.text:SetText( L.OPTIONS_Q_TT );
		q.qtt.text:SetPoint("LEFT", q.qtt, "RIGHT", 5, 0)
		
		q:Hide()
		wqto.q = q;
		
		
		local o = CreateFrame("FRAME", nil, wqto)
		o:SetWidth(410)
		o:SetHeight(440)
		o:SetPoint("CENTER", wqto, "CENTER")
			
		o.option_PetFF = CreateFrame("CheckButton", nil, o, "UICheckButtonTemplate");
		o.option_PetFF:SetPoint("TOPLEFT", o, "TOPLEFT", 25, -25);
		o.option_PetFF.text:SetText( BATTLE_PETS_ACHIEVEMENT .. " " .. TRACKING );
		o.option_PetFF.text:SetFontObject("GameFontNormal")
		if WorldQuestTipsData.global.options.PetFF then o.option_PetFF:SetChecked(true) end
		o.option_PetFF:SetScript("OnClick", function() if o.option_PetFF:GetChecked() then WorldQuestTipsData.global.options.PetFF = true; else WorldQuestTipsData.global.options.PetFF = false end end);
		
		local y = 80
		local x = 0
		for k, tamer in pairs(pet_tamers) do
		for f, complete in pairs(tamer) do
			o[k] = o:CreateFontString(nil, o, "GameFontNormal" )
			o[k]:SetText(k);
			o[k]:SetPoint("TOPLEFT", 20, -y )
			o[k..f] = CreateFrame("CheckButton", nil, o, "UICheckButtonTemplate");
			o[k..f]:SetPoint("LEFT", o[k], "LEFT", 200+x, 0);
			o[k..f]:SetScale(0.75);
			if WorldQuestTipsData.global.pets.ff[k][f] ~= false or complete then o[k..f]:SetChecked(true) else pets[f].ignored = pets[f].ignored + 1 end
			
			if o[f] == nil then
				o[f] = CreateFrame("FRAME", nil, o)
				o[f]:SetWidth(16)
				o[f]:SetHeight(16)
				o[f]:SetPoint("TOP", o[k..f], 0, 15);
				o[f].icon = o[f]:CreateFontString(nil, o, "GameFontNormal" )
				o[f].icon:SetText(pets[f].icon);
				o[f].icon:SetPoint("CENTER");
				o[f]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT",0,0);  GameTooltip:SetAchievementByID(pets[f].achID); GameTooltip:AddLine(ACHIEVEMENT_PROGRESSED .. ": "..pets[f].count.." / "..( 15 - pets[f].ignored )); GameTooltip:Show() end)
				o[f]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			end
	
	--		o[k..f]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetToyByItemID(k); GameTooltip:AddLine(c, 1, 0, 0); GameTooltip:Show() end)
	--		o[k..f]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			o[k..f]:SetScript("OnClick", function()
											o.footer:SetTextColor(1,1,1);
											if o[k..f]:GetChecked() then
												WorldQuestTipsData.global.pets.ff[k][f] = true
												pets[f].ignored = pets[f].ignored - 1
											else
												if pets[f].ignored == 3 then
													o.footer:SetTextColor(1,0,0);
													o[k..f]:SetChecked(true)
												else
													WorldQuestTipsData.global.pets.ff[k][f] = false
													pets[f].ignored = pets[f].ignored + 1
												end
											end
										end);
			if complete then
				o[k..f]:Disable();
			end
			x = x + 30
		end
			x = 0
			y = y + 20
		end
		
		o.footer = o:CreateFontString(nil, o, "GameFontWhite" )
		o.footer:SetText( L.OPTIONS_P_FOOTER );
		o.footer:SetPoint("BOTTOM", 0, 50 )
		o:Hide()
		wqto.o = o;
		
		wqto.doneBtn = CreateFrame("BUTTON", nil, wqto, "UIPanelButtonTemplate")
		wqto.doneBtn:SetWidth(64)
		wqto.doneBtn:SetHeight(24)
		wqto.doneBtn:SetText( DONE )
		wqto.doneBtn:SetPoint("BOTTOM", wqto, 0, 12)
		wqto.doneBtn:SetScript("OnClick", function()
			wqto:Hide()
			currentQuestEdit = 0
			if not enigmaticActive then
				if WorldQuestTips.enigmatic then WorldQuestTips.enigmatic:Hide() end
				if WorldQuestTips.enigmaticHUD then WorldQuestTips.enigmaticHUD:Hide() end
			end
		end)
		
	--	tinsert(UISpecialFrames, "wqto") 
	end
	
	wqto:Show()
		
	if questID then
		if questID == currentQuestEdit then
			wqto:Hide()
			currentQuestEdit = 0
		else 
			fillQuestInfo( questID )
			for z in pairs(tablist) do wqto[z]:Hide() end wqto.q:Show()
		end
	else
		fillQuestInfo()
	end
end

local function activateEnigmatic( z )
	WorldQuestTips.enigmatic["path"..z]:SetAlpha(1)
	WorldQuestTips.enigmatic["path"..z].aplha = 1
	for x = 1, 49 do
		if enigmaticPaths[z][x] == 0 then
			WorldQuestTips.enigmatic["path"..z].sq[x].texture:SetDesaturated(false)
			WorldQuestTips.enigmatic["path"..z].sq[x]:SetAlpha(1)
			if WorldQuestTips.enigmaticHUD then
				WorldQuestTips.enigmaticHUD.sq[x].texture:SetDesaturated(not WorldQuestTipsData.global.options.enigmaticHUDPathDim)
				WorldQuestTips.enigmaticHUD.sq[x]:SetAlpha(WorldQuestTipsData.global.options.enigmaticHUDEdgeA)
			end
		else
			WorldQuestTips.enigmatic["path"..z].sq[x].texture:SetDesaturated(true)
			WorldQuestTips.enigmatic["path"..z].sq[x]:SetAlpha(0.2)
			if WorldQuestTips.enigmaticHUD then
				WorldQuestTips.enigmaticHUD.sq[x].texture:SetDesaturated(WorldQuestTipsData.global.options.enigmaticHUDPathDim)
				WorldQuestTips.enigmaticHUD.sq[x]:SetAlpha(WorldQuestTipsData.global.options.enigmaticHUDPathA)
			end
		end
	end
	WorldQuestTips.enigmatic["path"..z].sq[41]:Show()
end

local function deactivateEnigmatic( z )
	for x = 1, 49 do
		if enigmaticPaths[z][x] == 0 then
			WorldQuestTips.enigmatic["path"..z].sq[x].texture:SetDesaturated(true)
			WorldQuestTips.enigmatic["path"..z].sq[x]:SetAlpha(0.2)
		else
			WorldQuestTips.enigmatic["path"..z].sq[x].texture:SetDesaturated(false)
			WorldQuestTips.enigmatic["path"..z].sq[x]:SetAlpha(1)
		end
	end
	WorldQuestTips.enigmatic["path"..z].sq[41]:Hide()
end

function WorldQuestTips:loadEnigmatic( event )
	local size = WorldQuestTipsData.global.options.enigmaticSize
	local rows = WorldQuestTipsData.global.options.enigmaticRows
	local length = table.getn( enigmaticPaths )
	local cols = math.ceil( length / rows )
	
	local width = ( cols * size * 8 ) + size
	local height = ( rows * size * 8 ) + size + 12
	
	local enigmatic
	if WorldQuestTips.enigmatic == nil then
		if event == "optionUpdate" then return end
		enigmatic = CreateFrame("FRAME")
	else enigmatic = WorldQuestTips.enigmatic end
	enigmatic:SetSize( width, height )
	enigmatic:ClearAllPoints()
	enigmatic:SetMovable(true)
		
	if WorldQuestTipsData.global.options.enigmaticPos == "CENTER" then enigmatic:SetPoint("LEFT", UIParent, "CENTER")
	else enigmatic:SetPoint("BOTTOMLEFT", UIParent, WorldQuestTipsData.global.options.enigmaticPos.left, WorldQuestTipsData.global.options.enigmaticPos.bottom ) end
	
	if enigmatic.draglabel == nil then
		enigmatic.draglabel = CreateFrame("FRAME", nil, enigmatic) 
		enigmatic.draglabel:SetPoint("BOTTOMLEFT", enigmatic, "TOPLEFT",0,-12 )
		enigmatic.draglabel.texture = enigmatic.draglabel:CreateTexture()
		enigmatic.draglabel.texture:SetTexture("Interface\\CHATFRAME\\ChatFrameTab")
		enigmatic.draglabel.texture:SetAllPoints()
		enigmatic.draglabel.text = enigmatic.draglabel:CreateFontString(nil, enigmatic.draglabel, "GameFontNormalSmall" )
		enigmatic.draglabel.text:SetText( "Drag" );
		enigmatic.draglabel.text:SetPoint("TOP",0,-10 )
		
		enigmatic.draglabel:EnableMouse(true)
		enigmatic.draglabel:SetScript("OnMouseDown", function(self) self:GetParent():StartMoving() end )
		enigmatic.draglabel:SetScript("OnMouseUp", function(self)
				self:GetParent():StopMovingOrSizing()
				WorldQuestTipsData.global.options.enigmaticPos = { left = WorldQuestTips.enigmatic:GetLeft(), bottom = WorldQuestTips.enigmatic:GetBottom() }
			end )
		enigmatic.draglabel:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);
			local text = "To use; select a path to display in\nthe Enigmatic HUD\n\n"
			if not WorldQuestTipsData.global.options.useEnigmaticHUD then text = "To use; just select a path to set\nas a reminder\n\n" end
			GameTooltip:SetText( text.."To configure, type:\n /wqt\n\nIf you see a path that isn't here,\nplease contact the author");
			GameTooltip:Show() end)
		enigmatic.draglabel:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
			
	end
	if WorldQuestTipsData.global.options.enigmaticMove then
		enigmatic:EnableMouse(true)
		enigmatic.draglabel:Show()
	else
		enigmatic:EnableMouse(false)
		enigmatic.draglabel:Hide()
	end
	enigmatic.draglabel:SetSize( size * 7, 22 )
	
	for k,v in pairs( enigmaticPaths ) do
		local findrow = math.modf( (k-1) / cols )
		if enigmatic["path"..k] == nil then
			enigmatic["path"..k] = CreateFrame("Button", nil, enigmatic, "SecureActionButtonTemplate")	
			enigmatic["path"..k].k = k
			
			enigmatic["path"..k]:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
			enigmatic["path"..k]:SetScript("OnEnter", function(self)
				enigmatic["path"..k].aplha = enigmatic["path"..k]:GetAlpha()
				enigmatic["path"..k]:SetAlpha(0.7)
			end)
			enigmatic["path"..k]:SetScript("OnLeave", function(self)
				enigmatic["path"..k]:SetAlpha( enigmatic["path"..k].aplha )
			end)
			enigmatic["path"..k]:SetScript("OnClick", function(self)
				for z = 1, table.getn( enigmaticPaths ) do
					enigmatic["path"..z]:SetAlpha(0.2)
					deactivateEnigmatic( z )
				end
				if WorldQuestTips.enigmaticHUD == nil then WorldQuestTips:loadEnigmaticHUD() end
				if WorldQuestTipsData.global.options.useEnigmaticHUD then WorldQuestTips.enigmaticHUD:Show() end
				WorldQuestTips.enigmaticHUD.k = self.k
				activateEnigmatic( self.k )
			end)
			
		enigmatic["path"..k].arrow = CreateFrame("FRAME", nil, enigmatic["path"..k])
		enigmatic["path"..k].arrow.texture = enigmatic["path"..k].arrow:CreateTexture()
		enigmatic["path"..k].arrow.texture:SetTexture("Interface\\MINIMAP\\MinimapArrow")
		enigmatic["path"..k].arrow.texture:SetAllPoints()
		enigmatic["path"..k].arrow:SetFrameLevel(50)
		
		end
		enigmatic["path"..k]:SetWidth(size*7)
		enigmatic["path"..k]:SetHeight(size*7)
		enigmatic["path"..k]:SetPoint("TOPLEFT", enigmatic, (k-1-findrow*cols)*size*8, -findrow*size*8-12 )
		
		local sq
		if enigmatic["path"..k].sq == nil then sq = {} else sq = enigmatic["path"..k].sq end
		for i = 0,6 do
			for j = 0,6 do
				local thisSq = i*7 + j + 1
				if sq[thisSq] == nil then
					sq[thisSq] = CreateFrame("FRAME", nil, enigmatic["path"..k])
					sq[thisSq].texture = sq[thisSq]:CreateTexture()
					sq[thisSq].texture:SetTexture("Interface\\Icons\\spell_holy_holybolt")
					sq[thisSq].texture:SetAllPoints()
				end
				sq[thisSq]:SetSize(size, size)
				sq[thisSq]:SetPoint("TOPLEFT", enigmatic["path"..k], j*size, -i*size )
				enigmatic["path"..k].sq = sq
			end
		end
	local arrowsize = math.min( 48, size*2 )
	enigmatic["path"..k].arrow:SetSize(arrowsize, arrowsize)
	enigmatic["path"..k].arrow:SetPoint("CENTER", enigmatic["path"..k].sq[41] )
	end
	WorldQuestTips.enigmatic = enigmatic
	for z = 1, table.getn( enigmaticPaths ) do
		enigmatic["path"..z]:SetAlpha(1)
		deactivateEnigmatic( z )
	end
end

function WorldQuestTips:loadEnigmaticHUD( event )
	
	local viewedZone = GetCurrentMapAreaID()
	SetMapToCurrentZone()
	local unitX, unitY = GetPlayerMapPosition("player")
	local rotation = GetPlayerFacing()
	local _,TLx,TLy,BRx,BRy = GetCurrentMapZone()
	SetMapByID( viewedZone )
	local size = WorldQuestTipsData.global.options.enigmaticHUDSize
	local currentPosX = 5.5*size
	local currentPosY = 1.5*size
	
	local enigmaticHUD
	if WorldQuestTips.enigmaticHUD == nil then
		if event == "optionUpdate" then return end
	--	enigmaticHUD = CreateFrame("FRAME", nil, UIParent)
		enigmaticHUD = CreateFrame("FRAME")
	else enigmaticHUD = WorldQuestTips.enigmaticHUD end
	
	enigmaticHUD:SetSize( 7*size, 7*size + 12 )
	enigmaticHUD:ClearAllPoints()
	enigmaticHUD:SetMovable(true)
	
	if WorldQuestTipsData.global.options.enigmaticHUDPos == "CENTER" then enigmaticHUD:SetPoint("RIGHT", UIParent, "CENTER")
	else enigmaticHUD:SetPoint("BOTTOMLEFT", UIParent, WorldQuestTipsData.global.options.enigmaticHUDPos.left, WorldQuestTipsData.global.options.enigmaticHUDPos.bottom ) end
	
	if enigmaticHUD.draglabel == nil then
		enigmaticHUD.draglabel = CreateFrame("FRAME", nil, enigmaticHUD) 
		enigmaticHUD.draglabel:SetPoint("BOTTOMLEFT", enigmaticHUD, "TOPLEFT",0,-12 )
		enigmaticHUD.draglabel.texture = enigmaticHUD.draglabel:CreateTexture()
		enigmaticHUD.draglabel.texture:SetTexture("Interface\\CHATFRAME\\ChatFrameTab")
		enigmaticHUD.draglabel.texture:SetAllPoints()
		enigmaticHUD.draglabel.text = enigmaticHUD.draglabel:CreateFontString(nil, enigmaticHUD.draglabel, "GameFontNormalSmall" )
		enigmaticHUD.draglabel.text:SetText( "Drag" );
		enigmaticHUD.draglabel.text:SetPoint("TOP",0,-10 )
		
		enigmaticHUD.draglabel:EnableMouse(true)
		enigmaticHUD.draglabel:SetScript("OnMouseDown", function(self) self:GetParent():StartMoving() end )
		enigmaticHUD.draglabel:SetScript("OnMouseUp", function(self)
				self:GetParent():StopMovingOrSizing()
				WorldQuestTipsData.global.options.enigmaticHUDPos = { left = WorldQuestTips.enigmaticHUD:GetLeft(), bottom = WorldQuestTips.enigmaticHUD:GetBottom() }
			end )
		enigmaticHUD.draglabel:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-32);  GameTooltip:SetText("To use, select a path from the Enigmatic Paths frame\nthen keep the player arrow on the path!\n\nTo configure, type:\n /wqt"); GameTooltip:Show() end)
		enigmaticHUD.draglabel:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	--	enigmaticHUD.dragRegion = enigmaticHUD:CreateTitleRegion()
	--	enigmaticHUD.dragRegion:SetPoint("TOPLEFT", enigmaticHUD )			
	end
	
	if WorldQuestTipsData.global.options.enigmaticHUDMove then
		enigmaticHUD:EnableMouse(true)
		enigmaticHUD.draglabel:Show()
	else
		enigmaticHUD:EnableMouse(false)
		enigmaticHUD.draglabel:Hide()
	end
	enigmaticHUD.draglabel:SetSize( 42, 22 )
	--enigmaticHUD.dragRegion:SetSize( 42, 22 )
	
	local sq
	if enigmaticHUD.sq == nil then sq = {} else sq = enigmaticHUD.sq end
	for i = 0,6 do
		for j = 0,6 do
			local thisSq = i*7 + j + 1
			if sq[thisSq] == nil then
				sq[thisSq] = CreateFrame("FRAME", nil, enigmaticHUD)
				sq[thisSq].texture = sq[thisSq]:CreateTexture()
			--	sq[thisSq].texture:SetTexture("Interface\\Icons\\spell_holy_holybolt")
				sq[thisSq].texture:SetTexture("Interface\\Buttons\\CheckButtonHilight")
				sq[thisSq].texture:SetAllPoints()
			end
			if enigmaticHUD.k == nil then
				if not ( thisSq < 8 or thisSq > 42 or thisSq%7 == 0 or (thisSq-1)%7 == 0 ) then
					sq[thisSq].texture:SetDesaturated(true)
					sq[thisSq]:SetAlpha(WorldQuestTipsData.global.options.enigmaticHUDPathA)
				else
					sq[thisSq]:SetAlpha(WorldQuestTipsData.global.options.enigmaticHUDEdgeA)
				end
			end
			sq[thisSq]:SetSize(size, size)
			sq[thisSq]:SetPoint("TOPLEFT", enigmaticHUD, j*size, -i*size-12 )
			enigmaticHUD.sq = sq
		end
	end
	if enigmaticHUD.arrow == nil then
		enigmaticHUD.arrow = CreateFrame("FRAME", nil, enigmaticHUD)
		enigmaticHUD.arrow.texture = enigmaticHUD.arrow:CreateTexture()
		enigmaticHUD.arrow.texture:SetTexture("Interface\\MINIMAP\\MinimapArrow")
		enigmaticHUD.arrow.texture:SetAllPoints()
		enigmaticHUD.arrow:SetFrameLevel(50)
	end
	local arrowsize = math.min( 48, size*2 )
	enigmaticHUD.arrow:SetSize(arrowsize, arrowsize)
		
	enigmaticHUD.initialTP = { x = currentPosX, y = currentPosY }
	
	if event == "optionUpdate" then
		if enigmaticHUD.k then
			activateEnigmatic( enigmaticHUD.k )
		end
	else
		enigmaticHUD.arrow:SetPoint("CENTER", enigmaticHUD, "BOTTOMLEFT", currentPosX, currentPosY )
		enigmaticHUD.initialMP = { x = unitX, y = unitY, r = rotation }
		enigmaticHUD.zone = { x = TLx-BRx, y = TLy-BRy }	-- width / height of zone in yards
		enigmaticHUD:Hide()
	end
	
	WorldQuestTips.enigmaticHUD = enigmaticHUD
end
		
SLASH_WorldQuestTips1= "/wqt";
function SlashCmdList.WorldQuestTips(msg)
	if msg == "" then
		WorldQuestTips:loadOptions()
	else
		if msg == 'debug true' then debugging = true; print('WorldQuestTips: Debugging messages on')
		elseif msg == 'debug false' then debugging = false; print('WorldQuestTips: Debugging messages off') end
		
		if msg == 'test' then
		--[[
			for k,v in pairs( WorldQuestTipsData ) do
				print( k, v)
			end
			WorldQuestTips:loadEnigmatic()
			print("test fired")
			for i = 1, GetAchievementNumCriteria(9692) do
				local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID = GetAchievementCriteriaInfo(9692, i)
				print(description)
			end
		--]]
		end

		WorldQuestTipsData.global.options.debugging = debugging;
	end
end


 ----------------------------------------------
--[[-- Register events and call functions --]]--
 ----------------------------------------------
WorldQuestTips:SetScript("OnEvent", function(self, event, ...)
 WorldQuestTips[event](self, ...);
end);
for k, v in pairs(WorldQuestTips) do
 WorldQuestTips:RegisterEvent(k); -- Registers all events for which handlers have been defined
end