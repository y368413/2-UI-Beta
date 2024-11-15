--## Author: phistoh  ## Version: 1.1.3
local  phis = {}
-- table of [tabard id] = reputation id pairs
phis.tabards = {
	-- main alliance factions
	[45574] = 72,   -- Stormwind
	[45577] = 47,   -- Ironforge
	[45578] = 54,   -- Gnomeregan
	[45579] = 69,   -- Darnassus
	[45580] = 930,  -- Exodar
	[64882] = 1134, -- Gilneas
	[83079] = 1353, -- Tushui Pandaren
	
	-- main horde factions
	[64884] = 1133, -- Bilgewater Cartel
	[45581] = 76,   -- Orgrimmar
	[45582] = 530,  -- Darkspear Trolls
	[45583] = 68,   -- Undercity
	[45584] = 81,   -- Thunder Bluff
	[45585] = 911,  -- Silvermoon City
	[83080] = 1352, -- Huojin Pandaren
	
	-- Wrath of the Lich King
	[43154] = 1106, -- Argent Crusade
	[43155] = 1098, -- Knights of the Ebon Blade
	[43156] = 1091, -- The Wyrmrest Accord
	[43157] = 1090, -- Kirin Tor
	
	-- Cataclysm
	[65904] = 1173, -- Ramkahen
	[65905] = 1135, -- Earthen Ring
	[65906] = 1158, -- Guardians of Hyjal
	[65907] = 1171, -- Therazane
	[65908] = 1174, -- Wildhammer Clan
	[65909] = 1172  -- Dragonmaw Clan
}


-- table of [reputation id] = true pairs to check if the corresponding faction offers Paragon rewards
phis.paragons = {
	-- Legion
	[1828]=true, -- Highmountain Tribe
	[1859]=true, -- The Nightfallen
	[1883]=true, -- Dreamweavers
	[1900]=true, -- Court of Farondis
	[1948]=true, -- Valajar
	[1894]=true, -- The Wardens
	[2045]=true, -- Armies of the Legionfall
	
	-- Battle for Azeroth
	[2160]=true, -- Proudmoore Admirality
	[2162]=true, -- Storm's Wake
	[2161]=true, -- Order of Embers
	[2156]=true, -- Talanji's Expedition
	[2103]=true, -- Zandalari Empire
	[2158]=true, -- Voldunai
	[2164]=true, -- Champions of Azeroth
	[2159]=true, -- 7th Legion
	[2157]=true, -- Honorbound
	[2163]=true, -- Tortollan Seekers
	
	-- Shadowlands
	[2407]=true, -- The Ascended
	[2413]=true, -- Court of Harvesters
	[2410]=true, -- The Undying Army
	[2465]=true, -- The Wild Hunt
	
	-- Dragonflight
	[2575]=true, -- Dream Wardens
	[2552]=true, -- Valdrakken Accord
	[2508]=true, -- Dragonscale Expedition
	[2521]=true, -- Clan Nokhud
	[2551]=true, -- Iskaara Tuskarr
	[2565]=true, -- Loamm Niffen
	[2504]=true, -- Maruuk Centaur
}

-- table of ["zone name"] = reputation id pairs
-- or ["zone name"] = {["A"] = rep id, ["H"] = rep id} pairs for zones with different reputations for Alliance/Horde
phis.zones = {
	-- Kalimdor
	["Mount Hyjal"] = 1158,									-- Guardians of Hyjal
	["Uldum"] = 1173,										-- Ramkahen
	["Vashj\'ir"] = 5146,									-- The Earthen Ring
	["Kelp\'thar Forest"] = 5146,							-- The Earthen Ring
	["Shimmering Expanse"] = 5146,							-- The Earthen Ring
	["Abyssal Depths"] = 5146,								-- The Earthen Ring
	["Winterspring"] = 577,									-- Everlook
	["Tanaris"] = 369,										-- Gadgetzan
	["Northern Barrens"] = 470,								-- Ratchet
	["Felwood"] = 576,										-- Timbermaw Hold
	["Warsong Gulch"] = {["A"] = 890, ["H"] = 889},			-- Silverwing Sentinels / Warsong Outriders
	["Silithus"] = 2164,									-- Champions of Azeroth
	
	-- Eastern Kingdoms
	["The Cape of Stranglethorn"] = 21,						-- Booty Bay
	["Burning Steppes"] = 59,								-- Thorium Brotherhood
	["Searing Gorge"] = 59,									-- Thorium Brotherhood
	["Ghostlands"] = 922,									-- Tranquillien
	["Twilight Highlands"] = {["A"] = 1174, ["H"] = 1172},	-- Wildhammer Clan / Dragonmaw Clan
	["Tol Barad"] = {["A"] = 1177, ["H"] = 1178},			-- Baradin's Wardens / Hellscream's Reach
	["Tol Barad Peninsula"] = {["A"] = 1177, ["H"] = 1178},	-- Baradin's Wardens / Hellscream's Reach
	["Alterac Valley"] = {["A"] = 730, ["H"] = 729},		-- Stormpike Guard / Frostwolf Clan
	["Arathi Basin"] = {["A"] = 509, ["H"] = 510},			-- The League of Arathor / The Defilers
	["Isle of Quel\'Danas"] = 1077,							-- Shattered Sun Offensive
	
	-- Outlands
	["Zangarmarsh"] = 942,									-- Cenarion Expedition
	["Hellfire Peninsula"] = {["A"] = 946, ["H"] = 947},	-- Honor Hold / Thrallmar
	["Nagrand"] = {["A"] = 978, ["H"] = 941},				-- Kurenai / Mag'har
	["Shadowmoon Valley"] = 1015,							-- Netherwing
	["Blade\'s Edge Mountains"] = 1038,						-- Ogri'la
	["Netherstorm"] = 933,									-- The Consortium
	
	-- Northrend
	["Zul\'Drak"] = 1106,									-- Argent Crusade
	["Icecrown"] = 1098,									-- Knights of the Ebon Blade
	["The Storm Peaks"] = 1119,								-- The Sons of Hodir
	["Dragonblight"] = 1091,								-- The Wyrmrest Accord
	["Howling Fjord"] = {["A"] = 1068, ["H"] = 1067},		-- Explorer's League / The Hand of Vengeance
	["Borean Tundra"] = {["A"] = 1050, ["H"] = 1064},		-- Valiance Expedition / The Taunka
	
	-- Pandaria
	["Dread Wastes"] = 1337,								-- The Klaxxi
	["Timeless Isle"] = 1492,								-- Emperor Shaohao
	["Vale of Eternal Blossoms"] = 1269,					-- Golden Lotus
	["The Jade Forest"] = {["A"] = 1242, ["H"] = 1228},		-- Pearlfin Jinyu / Forest Hozen
	["Townlong Steppes"] = 1270,							-- Shado-Pan
	["Krasarang Wilds"] = 1302,								-- The Anglers
	["Valley of the Four Winds"] = 1272,					-- The Tillers
	["Isle of Thunder"] = {["A"] = 1387, ["H"] = 1388},		-- Kirin Tor Offensive / Sunreaver Onslaught
	
	-- Draenor
	["Spires of Arak"] = 1515,								-- Arakkoa Outcasts
	["Nagrand (Draenor)"] = 1711,							-- Steamwheedle Preservation Society
	["Ashran"] = {["A"] = 1682, ["H"] = 1681},				-- Wrynn's Vanguard / Vol'jin's Spear
	["Frostfire Ridge"] = 1445,								-- Frostwolf Orcs
	["Shadowmoon Valley (Draenor)"] = 1731,					-- Council of Exarchs
	
	-- Broken Isles
	["Azsuna"] = 1900,										-- Court of Farondis
	["Val\'sharah"] = 1883,									-- Dreamweavers
	["Highmountain"] = 1828,								-- Highmountain Tribe
	["Suramar"] = 1859,										-- The Nightfallen
	["Stormheim"] = 1948,									-- Valajar
	["Broken Shore"] = 2045,								-- Armies of the Legionfall
	
	-- Argus
	["Krokuun"] = 2165,										-- Army of the Light
	["Antoran Wastes"] = 2165,								-- Army of the Light
	["Mac\'Aree"] = 2165,									-- Army of the Light
	
	-- Kul Tiras
	["Tiragarde"] = 2160,									-- Proudmoore Admirality
	["Stormsong"] = 2162,									-- Storm's Wake
	["Drustvar"] = 2161,									-- Order of Embers
	["Mechagon"] = 2391,									-- Rustbolt Resistance
	
	-- Zandalar
	["Nazmir"] = 2156,										-- Talanji's Expedition
	["Zuldazar"] = 2103,									-- Zandalari Empire
	["Vol\'dun"] = 2158,									-- Voldunai
	
	-- Shadowlands
	["Bastion"] = 2407,										-- The Ascended
	["Maldraxxus"] = 2410,									-- The Undying Army
	["Ardenweald"] = 2422,									-- The Wild Hunt
	["Revendreth"] = 2413,									-- Court of Harvesters
	["The Maw"] = 2432,										-- Ve'nari
	["Korthia"] = 2470,										-- Death's Advance
	
	-- Dragonflight
	["Zaralek Cavern"] = 2565,								-- Loamm Niffen
	["The Azure Span"] = 2526,								-- Winterpelt Furbolg
	
	-- Other
	["Deepholm"] = 1171,									-- Therazane
	["Darkmoon Island"] = 909,								-- Darkmoon Faire
	["Nazjatar"] = {["A"] = 2400, ["H"] = 2373},			-- Waveblade Ankoan / The Unshackled
	["Emerald Dream"] = 2574,								-- Dream Wardens
	
	-- Dungeons
	["Old Hillsbrad Foothills"] = 989,						-- Keepers of Time
	["The Black Morass"] = 989,								-- Keepers of Time
	["The Shattered Halls"] = {["A"] = 946, ["H"] = 947},	-- Honor Hold / Thrallmar
	["The Blood Furnace"] = {["A"] = 946, ["H"] = 947},		-- Honor Hold / Thrallmar
	["Hellfire Ramparts"] = {["A"] = 946, ["H"] = 947},		-- Honor Hold / Thrallmar
	["The Slave Pens"] = 942,								-- Cenarion Expedition
	["The Underbog"] = 942,									-- Cenarion Expedition
	["The Steamvault"] = 942,								-- Cenarion Expedition
	["Mana-Tombs"] = 933,									-- The Consortium
	["Sethekk Halls"] = 1011,								-- Lower City
	["Shadow Labyrinth"] = 1011,							-- Lower City
	["The Mechanar"] = 935,									-- The Sha'tar
	["The Arcatraz"] = 935,									-- The Sha'tar
	["The Botanica"] = 935,									-- The Sha'tar
	["Magisters\' Terrace"] = 1077,							-- Shattered Sun Offensive
	
	-- Raids
	["Firelands"] = 1204,									-- Avengers of Hyjal
	["Black Temple"] = 1012,								-- Ashtongue Deathsworn
	["Temple of Ahn\'Qiraj"] = 910,							-- Brood of Nozdormu
	["Ruins of Ahn\'Qiraj"] = 609,							-- Cenarion Circle
	["The Molten Core"] = 749,								-- Hydraxian Waterlords
	["Throne of Tunder"] = 1435,							-- Shado-Pan Assault
	["Hyjal Summit"] = 990,									-- The Scale of Sands
	["Icecrown Citadel"] = 1156,							-- The Ashen Verdict
	["Karazhan"] = 967										-- The Violet Eye
}

local phis_f = CreateFrame("Frame")

phis_f:RegisterEvent("PLAYER_ENTERING_WORLD")
phis_f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
phis_f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
phis_f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
phis_f:RegisterEvent("ADDON_LOADED")

local DESCRIPTION_LONG = "The addon changes the 'watched faction' in the reputation pane depending on different conditions:|n|n    - Equipping a tabard which provides reputation (e.g. equipping |cFF1EFF00[Tabard of Therazane]|r -> Therazane)|n    - Entering a zone which has a correspoding faction (e.g. entering the Dread Wastes -> The Klaxxi)|n    - Gaining reputation for a faction (e.g. killing a Blackfang Shaman -> The Saberstalkers)|n|nThe addon doesn't switch to a faction if it is already exalted. (Except to the paragonable factions.)|n|nUsage: The addon automatically switches the watched faction so there is nothing you have to do. You can temporarily toggle the automatic switching with '|cFF2EE6E6/pfs toggle|r'. The following options disable (and enable) the conditions for changing the watched faction."

-- slash commands
SLASH_PFS1 = "/phisfactionswitcher"
SLASH_PFS2 = "/pfs"

local item_id, rep_id, zone_name
local enabled = true -- controls the automatic switching
local player_faction = string.sub(UnitFactionGroup("player"), 1, 1) -- returns the first letter of the players faction
local collapsed_factions = {} -- will be used in the auxiliary functions to expand and collapse headers

-- the different "faction standing changed" messages with %s replaced by a pattern with captures
local faction_standing_msg = {
	string.gsub(FACTION_STANDING_INCREASED, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_INCREASED_GENERIC, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_DECREASED, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_DECREASED_GENERIC, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_INCREASED_ACH_BONUS, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_INCREASED_BONUS, "%%s", "(.+)"),
	string.gsub(FACTION_STANDING_INCREASED_DOUBLE_BONUS, "%%s", "(.+)")
}

-------------------------
--   AUXILIARY STUFF   --
-------------------------

local function addonPrint(str)
	print('|cFF2EE6E6[0.0]:|r '..str)
end



SlashCmdList["PFS"] = function(args)
	-- generic help message
	if args:lower() ~= "toggle" then
		addonPrint("Version v".."1.1.13")
		addonPrint("Temporarily toggle the automatic switching of reputations with /pfs toggle")
	else	
		-- toggle the value of disabled
		enabled = not enabled
		addonPrint("phisFactionSwitcher is now "..(enabled and "enabled" or "disabled")..".")
	end
	
end

-- scans the player's reputation pane and expands all collapsed headers
-- stores which headers were collapsed so they can be collapsed again
local function expand_and_remember()
	local i = 1
	
	-- while-loop because the number of factions changes while expanding headers
	while i < GetNumFactions() do
		local faction_name, _, _, _, _, _, _, _, _, is_collapsed = GetFactionInfo(i)
		if is_collapsed then
			collapsed_factions[faction_name] = true
			ExpandFactionHeader(i)
		end
		i = i + 1
	end
end

-- scans the player's reputation pane and collapses all previously expanded headers
local function collapse_and_forget()
	local i = 1
	
	-- while-loop because the number of factions changes while expanding headers
	while i < GetNumFactions() do
		local faction_name = GetFactionInfo(i)
		if collapsed_factions[faction_name] then
			CollapseFactionHeader(i)
		end
		i = i + 1
	end
	
	collapsed_factions = {}
end

local function set_faction_index_by_id(rep_id)
	local faction_name, _, standing = GetFactionInfoByID(rep_id)
	
	-- if already exalted, don't switch
	-- except when it is a "paragonable" reputation
	if standing == 8 and not phis.paragons[rep_id] then
		return
	end
	
	-- expand faction headers so they get included in the search
	expand_and_remember()
	
	-- check for every faction in the reputation pane if its name is the same as the one corresponding to rep_id
	-- if a valid faction was found check if it is active and switch to it
	local current_name
	for i = 1, GetNumFactions() do
		current_name = GetFactionInfo(i)
		if faction_name == current_name then
			if not IsFactionInactive(i) then
				SetWatchedFactionIndex(i)
			end
			break
		end
	end
	
	-- restore the collapsed headers again
	collapse_and_forget()
	
	return
end

local function set_faction_index_by_name(faction_name)
	if faction_name == 'Guild' then
		faction_name = GetGuildInfo('player')
	end

	-- expand faction headers so they get included in the search
	expand_and_remember()
	
	-- check for every faction in the reputation pane if its name is the same as the argument
	-- if a valid faction was found call set_faction_index_by_id() to set the faction
	local current_name
	for i = 1, GetNumFactions() do
		current_name, _, _, _, _, _, _, _, _, _, _, _, _, rep_id = GetFactionInfo(i)
		if faction_name == current_name then
			collapse_and_forget()
			set_faction_index_by_id(rep_id)
			return
		end
	end
	
	-- restore the collapsed headers again
	collapse_and_forget()
	
	return
end

local function main_eventhandler(self, event, ...)
	-- initializes the saved variable table if not present
	if (event == "ADDON_LOADED") then
		if phisFactionSwitcherSavedVars == nil then
			phisFactionSwitcherSavedVars = {
				tabard = true,
				zone_change = true,
				combat_text = true
			}
			addonPrint("Addon loaded for the first time.")
		end
		phis_f:UnregisterEvent("ADDON_LOADED")
	end

	-- do nothing if the addon is currently disabled
	if not enabled then
		return
	end
	
	-- only change watched faction if there is a watched faction
	watched_faction = GetWatchedFactionInfo()
	if not watched_faction then
		return
	end

	-- check if the player equipped/unequipped something
	if (phisFactionSwitcherSavedVars.tabard and event == "PLAYER_EQUIPMENT_CHANGED") then
		local arg1, arg2 = ...
		-- if no tabard was equipped do nothing
		if (arg1 ~= INVSLOT_TABARD) or (arg2 == true) then
			return
		end
		item_id = GetInventoryItemID("player", INVSLOT_TABARD)
		rep_id = phis.tabards[item_id]
		if rep_id ~= nil then
			set_faction_index_by_id(rep_id)
		end
		return
	end
	
	-- check if the player entered a zone with a corresponding reputation
	-- (will also get fired if the player enters the world)
	if (phisFactionSwitcherSavedVars.zone_change and ((event == "ZONE_CHANGED_NEW_AREA") or (event == "PLAYER_ENTERING_WORLD"))) then
		zone_name = GetRealZoneText()
		
		-- workaround for zones existing in both Outland and Draenor
		if zone_name == "Nagrand" or zone_name == "Shadowmoon Valley" then
			local map_id = C_Map.GetBestMapForUnit("player")
			if map_id == 550 or map_id == 539 then
				zone_name = zone_name.." (Draenor)"
			end
		end
		
		rep_id = phis.zones[zone_name]
		
		-- check if the zone has different factions dependent on Alliance/Horde
		if type(rep_id) == "table" then
			rep_id = rep_id[player_faction]
		end
		
		if rep_id ~= nil then
			set_faction_index_by_id(rep_id)
		end
		return
	end
	
	-- check the player's combat text
	if (phisFactionSwitcherSavedVars.combat_text and event == "CHAT_MSG_COMBAT_FACTION_CHANGE") then
		local arg1 = ...

		local faction_name = nil
		local i = 1
		
		-- end the loop if either a faction name was found or if the message could not be matched to one of the "changed standing" messages
		while (faction_name == nil) and (i < #faction_standing_msg) do
			faction_name = string.match(arg1, faction_standing_msg[i])
			i = i+1
		end
		
		if faction_name ~= nil then
			set_faction_index_by_name(faction_name)
		end
	
	end
	
end

-------------------------
--    OPTIONS PANEL    --
-------------------------

-- creates a checkbox 10 px below 'anchor' and stores its state in phisFactionSwitcherSavedVars[k]
local function create_checkbox(k, parent, anchor, text)
	local checkbox = CreateFrame('CheckButton', k..'CheckButton', parent, 'UICheckButtonTemplate')
	checkbox:SetPoint('TOPLEFT', anchor, 'BOTTOMLEFT', 0, -10)
	checkbox:SetChecked(phisFactionSwitcherSavedVars[k])
	_G[k..'CheckButtonText']:SetText(' '..text)
	_G[k..'CheckButtonText']:SetFontObject('GameFontNormal')
	checkbox:SetScript('OnClick', function()
		-- when 'OnClick' runs, GetChecked() already returns the new status
		checked = checkbox:GetChecked()
		PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
		phisFactionSwitcherSavedVars[k] = checked
	end)
	
	return checkbox
end

local options = CreateFrame('Frame', 'phisFactionSwitcherOptionsFrame', SettingsPanel.Container)
options.name = "phisFactionSwitcher"
--InterfaceOptions_AddCategory(options)
local Category = Settings.RegisterCanvasLayoutCategory(self, options.name)
		Settings.RegisterAddOnCategory(Category)
options:SetScript('OnShow', function()

	--- HEADER --
	local title_string = options:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
	title_string:SetPoint('TOPLEFT', 10, -10)
	title_string:SetText('phisFactionSwitcher')
	
	local version_string = options:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	version_string:SetPoint('BOTTOMLEFT', title_string, 'BOTTOMRIGHT', 4, 0)
	version_string:SetText('v'..'1.1.13')
	
	local description_string = options:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	description_string:SetPoint('TOPLEFT', title_string, 'BOTTOMLEFT', 0, -10)
	description_string:SetJustifyH('LEFT')
	description_string:SetWidth(SettingsPanel.Container:GetWidth() - 40)
	description_string:SetNonSpaceWrap(true)
	description_string:SetText(DESCRIPTION_LONG)
	
	--- CHECKBOXES ---
	local checkboxes = {}
	checkboxes.tabard = create_checkbox('tabard', options, description_string, 'Change faction bar on equipping champion tabard')
	checkboxes.zone_change = create_checkbox('zone_change', options, checkboxes.tabard, 'Change faction bar dependent on current zone')
	checkboxes.combat_text = create_checkbox('combat_text', options, checkboxes.zone_change, 'Change faction bar to last reputation gain')
	
	options:SetScript('OnShow', nil)
end)

phis_f:SetScript("OnEvent", main_eventhandler)