--[[--------------------------------------------------------------------
	LibRealmInfo
	World of Warcraft library for obtaining information about realms.
	Copyright 2014-2018 Phanx <addons@phanx.net>
	Zlib license. Standalone distribution strongly discouraged.
	https://github.com/phanx-wow/LibRealmInfo
	https://wow.curseforge.com/projects/librealminfo
	https://www.wowinterface.com/downloads/info22987-LibRealmInfo
----------------------------------------------------------------------]]

local MAJOR, MINOR = "LibRealmInfo", 13
assert(LibStub, MAJOR.." requires LibStub")
local lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

local standalone = (...) == MAJOR
local realmData, connectionData
local Unpack


local function shallowCopy(t)
	if not t then return end

	local n = {}
	for k, v in next, t do
		n[k] = v
	end
	return n
end

local function getNameForAPI(name)
	return name and (name:gsub("[%s%-]", "")) or nil
end

------------------------------------------------------------------------

local currentRegion

function lib:GetCurrentRegion()
	if currentRegion then
		return currentRegion
	end

	if Unpack then
		Unpack()
	end

	local guid = UnitGUID("player")
	if guid then
		local server = tonumber(strmatch(guid, "^Player%-(%d+)"))
		local realm = realmData[server]
		if realm then
			currentRegion = realm.region
			return currentRegion
		end
	end
end

------------------------------------------------------------------------

local validRegions = { US = true, EU = true, CN = true, KR = true, TW = true }

function lib:GetRealmInfo(name, region)
	local isString = type(name) == "string"
	if isString then
		name = strtrim(name)
	end
	if type(name) == "number" or isString and strmatch(name, "^%d+$") then
		return self:GetRealmInfoByID(name)
	end
	assert(isString and strlen(name) > 0, "Usage: GetRealmInfo(name[, region])")

	if not region or not validRegions[region] then
		region = self:GetCurrentRegion()
	end

	if Unpack then
		Unpack()
	end

	for id, realm in pairs(realmData) do
		if realm.region == region and (realm.nameForAPI == name or realm.name == name or realm.englishNameForAPI == name or realm.englishName == name) then
			return id, realm.name, realm.nameForAPI, realm.rules, realm.locale, nil, realm.region, realm.timezone, shallowCopy(realm.connections), realm.englishName, realm.englishNameForAPI
		end
	end
end

------------------------------------------------------------------------

function lib:GetRealmInfoByID(id)
	id = tonumber(id)
	assert(id, "Usage: GetRealmInfoByID(id)")

	if Unpack then
		Unpack()
	end

	local realm = realmData[id]
	if realm and realm.name then
		return realm.id, realm.name, realm.nameForAPI, realm.rules, realm.locale, nil, realm.region, realm.timezone, shallowCopy(realm.connections), realm.englishName, realm.englishNameForAPI
	end
end

------------------------------------------------------------------------

function lib:GetRealmInfoByGUID(guid)
	assert(type(guid) == "string", "Usage: GetRealmInfoByGUID(guid)")
	if not strmatch(guid, "^Player%-") then
		return
	end
	local _, _, _, _, _, _, realm = GetPlayerInfoByGUID(guid)
	if realm == "" then
		realm = GetRealmName()
	end
	return self:GetRealmInfo(realm)
end

------------------------------------------------------------------------

function lib:GetRealmInfoByUnit(unit)
	assert(type(unit) == "string", "Usage: GetRealmInfoByUnit(unit)")
	local guid = UnitGUID(unit)
	if not guid then
		return
	end
	return self:GetRealmInfoByGUID(guid)
end

------------------------------------------------------------------------

function Unpack()

	for id, info in pairs(realmData) do
		-- Aegwynn,PVP,enUS,US,CST
		-- Nathrezim,PvP,deDE,EU
		-- Азурегос,PvE,ruRU,EU,Azuregos
		local name, rules, locale, region, timezone = strsplit(",", info)

		local englishName
		if region ~= "US" then
			englishName = timezone
			timezone = nil
		end

		realmData[id] = {
			id = id,
			name = name,
			nameForAPI = getNameForAPI(name),
			rules = string.upper(rules),
			locale = locale,
			region = region,
			timezone = timezone, -- only for realms in US region
			englishName = englishName, -- only for realms with non-Latin names
			englishNameForAPI = getNameForAPI(englishName), -- only for realms with non-Latin names
		}
	end

	for i = 1, #connectionData do
		local connectedRealms = { strsplit(",", connectionData[i]) }
		local connectionID = tonumber(table.remove(connectedRealms, 1))
		local region = table.remove(connectedRealms, 1)

		if not realmData[connectionID] then
			-- nameless server used to host connected realms
			table.insert(connectedRealms, connectionID)
			realmData[connectionID] = {
				region = region,
				connections = connectedRealms
			}
		end

		for j = 1, #connectedRealms do
			local realmID = tonumber(connectedRealms[j])
			connectedRealms[j] = realmID
			realmData[realmID].connections = connectedRealms
		end
	end

	-- Partial workaround for missing Chinese connected realm data:
	local autoCompleteRealms = GetAutoCompleteRealms()
	if #autoCompleteRealms > 0 then
		local autoCompleteIDs = {}
		for _, name in pairs(autoCompleteRealms) do
			for realmID, realm in pairs(realmData) do
				if realm.nameForAPI == name then
					table.insert(autoCompleteIDs, realmID)
					break
				end
			end
		end
		if #autoCompleteIDs == #autoCompleteRealms then
			for _, realmID in pairs(autoCompleteIDs) do
				local realm = realmData[realmID]
				if realm and not realm.connections then
					realm.connections = autoCompleteIDs
				end
			end
		else
		end
	end

	connectionData = nil
	Unpack = nil
	collectgarbage()
end

------------------------------------------------------------------------

realmData = {
--{{ North America
[1]="Lightbringer,PvE,enUS,US,PST",
[2]="Cenarius,PvE,enUS,US,PST",
[3]="Uther,PvE,enUS,US,PST",
[4]="Kilrogg,PvE,enUS,US,PST",
[5]="Proudmoore,PvE,enUS,US,PST",
[6]="Hyjal,PvE,enUS,US,PST",
[7]="Frostwolf,PvP,enUS,US,PST",
[8]="Ner'zhul,PvP,enUS,US,PST",
[9]="Kil'jaeden,PvP,enUS,US,PST",
[10]="Blackrock,PvP,enUS,US,PST",
[11]="Tichondrius,PvP,enUS,US,PST",
[12]="Silver Hand,RP,enUS,US,PST",
[13]="Doomhammer,PvE,enUS,US,MST",
[14]="Icecrown,PvE,enUS,US,MST",
[15]="Deathwing,PvP,enUS,US,MST",
[16]="Kel'Thuzad,PvP,enUS,US,MST",
[47]="Eitrigg,PvE,enUS,US,CST",
[51]="Garona,PvE,enUS,US,CST",
[52]="Alleria,PvE,enUS,US,CST",
[53]="Hellscream,PvE,enUS,US,CST",
[54]="Blackhand,PvE,enUS,US,CST",
[55]="Whisperwind,PvE,enUS,US,CST",
[56]="Archimonde,PvP,enUS,US,CST",
[57]="Illidan,PvP,enUS,US,CST",
[58]="Stormreaver,PvP,enUS,US,CST",
[59]="Mal'Ganis,PvP,enUS,US,CST",
[60]="Stormrage,PvE,enUS,US,EST",
[61]="Zul'jin,PvE,enUS,US,EST",
[62]="Medivh,PvE,enUS,US,EST",
[63]="Durotan,PvE,enUS,US,EST",
[64]="Bloodhoof,PvE,enUS,US,EST",
[65]="Khadgar,PvE,enUS,US,EST",
[66]="Dalaran,PvE,enUS,US,EST",
[67]="Elune,PvE,enUS,US,EST",
[68]="Lothar,PvE,enUS,US,EST",
[69]="Arthas,PvP,enUS,US,EST",
[70]="Mannoroth,PvP,enUS,US,EST",
[71]="Warsong,PvP,enUS,US,EST",
[72]="Shattered Hand,PvP,enUS,US,EST",
[73]="Bleeding Hollow,PvP,enUS,US,EST",
[74]="Skullcrusher,PvP,enUS,US,EST",
[75]="Argent Dawn,RP,enUS,US,EST",
[76]="Sargeras,PvP,enUS,US,CST",
[77]="Azgalor,PvP,enUS,US,CST",
[78]="Magtheridon,PvP,enUS,US,EST",
[79]="Destromath,PvP,enUS,US,PST",
[80]="Gorgonnash,PvP,enUS,US,PST",
[81]="Dethecus,PvP,enUS,US,PST",
[82]="Spinebreaker,PvP,enUS,US,PST",
[83]="Bonechewer,PvP,enUS,US,PST",
[84]="Dragonmaw,PvP,enUS,US,PST",
[85]="Shadowsong,PvE,enUS,US,PST",
[86]="Silvermoon,PvE,enUS,US,PST",
[87]="Windrunner,PvE,enUS,US,PST",
[88]="Cenarion Circle,RP,enUS,US,PST",
[89]="Nathrezim,PvP,enUS,US,MST",
[90]="Terenas,PvE,enUS,US,MST",
[91]="Burning Blade,PvP,enUS,US,EST",
[92]="Gorefiend,PvP,enUS,US,EST",
[93]="Eredar,PvP,enUS,US,EST",
[94]="Shadowmoon,PvP,enUS,US,EST",
[95]="Lightning's Blade,PvP,enUS,US,EST",
[96]="Eonar,PvE,enUS,US,EST",
[97]="Gilneas,PvE,enUS,US,EST",
[98]="Kargath,PvE,enUS,US,EST",
[99]="Llane,PvE,enUS,US,EST",
[100]="Earthen Ring,RP,enUS,US,EST",
[101]="Laughing Skull,PvP,enUS,US,CST",
[102]="Burning Legion,PvP,enUS,US,CST",
[103]="Thunderlord,PvP,enUS,US,CST",
[104]="Malygos,PvE,enUS,US,CST",
[105]="Thunderhorn,PvE,enUS,US,CST",
[106]="Aggramar,PvE,enUS,US,CST",
[107]="Crushridge,PvP,enUS,US,PST",
[108]="Stonemaul,PvP,enUS,US,PST",
[109]="Daggerspine,PvP,enUS,US,PST",
[110]="Stormscale,PvP,enUS,US,PST",
[111]="Dunemaul,PvP,enUS,US,PST",
[112]="Boulderfist,PvP,enUS,US,PST",
[113]="Suramar,PvE,enUS,US,PST",
[114]="Dragonblight,PvE,enUS,US,PST",
[115]="Draenor,PvE,enUS,US,PST",
[116]="Uldum,PvE,enUS,US,PST",
[117]="Bronzebeard,PvE,enUS,US,PST",
[118]="Feathermoon,RP,enUS,US,PST",
[119]="Bloodscalp,PvP,enUS,US,MST",
[120]="Darkspear,PvP,enUS,US,MST",
[121]="Azjol-Nerub,PvE,enUS,US,MST",
[122]="Perenolde,PvE,enUS,US,MST",
[123]="Eldre'Thalas,PvE,enUS,US,EST",
[124]="Spirestone,PvP,enUS,US,PST",
[125]="Shadow Council,RP,enUS,US,MST",
[126]="Scarlet Crusade,RP,enUS,US,CST",
[127]="Firetree,PvP,enUS,US,EST",
[128]="Frostmane,PvP,enUS,US,CST",
[129]="Gurubashi,PvP,enUS,US,PST",
[130]="Smolderthorn,PvP,enUS,US,EST",
[131]="Skywall,PvE,enUS,US,PST",
[151]="Runetotem,PvE,enUS,US,CST",
[153]="Moonrunner,PvE,enUS,US,PST",
[154]="Detheroc,PvP,enUS,US,CST",
[155]="Kalecgos,PvP,enUS,US,PST",
[156]="Ursin,PvP,enUS,US,PST",
[157]="Dark Iron,PvP,enUS,US,PST",
[158]="Greymane,PvE,enUS,US,CST",
[159]="Wildhammer,PvP,enUS,US,CST",
[160]="Staghelm,PvE,enUS,US,CST",
[162]="Emerald Dream,PvP RP,enUS,US,CST",
[163]="Maelstrom,PvP RP,enUS,US,CST",
[164]="Twisting Nether,PvP RP,enUS,US,CST",
[1067]="Cho'gall,PvP,enUS,US,CST",
[1068]="Gul'dan,PvP,enUS,US,CST",
[1069]="Kael'thas,PvE,enUS,US,CST",
[1070]="Alexstrasza,PvE,enUS,US,CST",
[1071]="Kirin Tor,RP,enUS,US,CST",
[1072]="Ravencrest,PvE,enUS,US,CST",
[1075]="Balnazzar,PvP,enUS,US,CST",
[1128]="Azshara,PvP,enUS,US,CST",
[1129]="Agamaggan,PvP,enUS,US,CST",
[1130]="Lightninghoof,PvP RP,enUS,US,CST",
[1131]="Nazjatar,PvP,enUS,US,PST",
[1132]="Malfurion,PvE,enUS,US,CST",
[1136]="Aegwynn,PvP,enUS,US,CST",
[1137]="Akama,PvP,enUS,US,CST",
[1138]="Chromaggus,PvP,enUS,US,CST",
[1139]="Draka,PvE,enUS,US,CST",
[1140]="Drak'thul,PvE,enUS,US,CST",
[1141]="Garithos,PvP,enUS,US,CST",
[1142]="Hakkar,PvP,enUS,US,CST",
[1143]="Khaz Modan,PvE,enUS,US,CST",
[1145]="Mug'thol,PvP,enUS,US,CST",
[1146]="Korgath,PvP,enUS,US,CST",
[1147]="Kul Tiras,PvE,enUS,US,CST",
[1148]="Malorne,PvP,enUS,US,CST",
[1151]="Rexxar,PvE,enUS,US,CST",
[1154]="Thorium Brotherhood,RP,enUS,US,CST",
[1165]="Arathor,PvE,enUS,US,PST",
[1173]="Madoran,PvE,enUS,US,CST",
[1175]="Trollbane,PvE,enUS,US,EST",
[1182]="Muradin,PvE,enUS,US,CST",
[1184]="Vek'nilash,PvE,enUS,US,CST",
[1185]="Sen'jin,PvE,enUS,US,CST",
[1190]="Baelgun,PvE,enUS,US,PST",
[1258]="Duskwood,PvE,enUS,US,EST",
[1259]="Zuluhed,PvP,enUS,US,EST",
[1260]="Steamwheedle Cartel,RP,enUS,US,EST",
[1262]="Norgannon,PvE,enUS,US,EST",
[1263]="Thrall,PvE,enUS,US,EST",
[1264]="Anetheron,PvP,enUS,US,EST",
[1265]="Turalyon,PvE,enUS,US,EST",
[1266]="Haomarush,PvP,enUS,US,EST",
[1267]="Scilla,PvP,enUS,US,EST",
[1268]="Ysondre,PvP,enUS,US,EST",
[1270]="Ysera,PvE,enUS,US,EST",
[1271]="Dentarg,PvE,enUS,US,EST",
[1276]="Andorhal,PvP,enUS,US,EST",
[1277]="Executus,PvP,enUS,US,EST",
[1278]="Dalvengyr,PvP,enUS,US,EST",
[1280]="Black Dragonflight,PvP,enUS,US,EST",
[1282]="Altar of Storms,PvP,enUS,US,EST",
[1283]="Uldaman,PvE,enUS,US,EST",
[1284]="Aerie Peak,PvE,enUS,US,PST",
[1285]="Onyxia,PvP,enUS,US,PST",
[1286]="Demon Soul,PvP,enUS,US,EST",
[1287]="Gnomeregan,PvE,enUS,US,PST",
[1288]="Anvilmar,PvE,enUS,US,PST",
[1289]="The Venture Co,PvP RP,enUS,US,PST",
[1290]="Sentinels,RP,enUS,US,PST",
[1291]="Jaedenar,PvP,enUS,US,EST",
[1292]="Tanaris,PvE,enUS,US,EST",
[1293]="Alterac Mountains,PvP,enUS,US,EST",
[1294]="Undermine,PvE,enUS,US,EST",
[1295]="Lethon,PvP,enUS,US,PST",
[1296]="Blackwing Lair,PvP,enUS,US,PST",
[1297]="Arygos,PvE,enUS,US,EST",
[1342]="Echo Isles,PvE,enUS,US,PST",
[1344]="The Forgotten Coast,PvP,enUS,US,EST",
[1345]="Fenris,PvE,enUS,US,EST",
[1346]="Anub'arak,PvP,enUS,US,EST",
[1347]="Blackwater Raiders,RP,enUS,US,PST",
[1348]="Vashj,PvP,enUS,US,PST",
[1349]="Korialstrasz,PvE,enUS,US,PST",
[1350]="Misha,PvE,enUS,US,PST",
[1351]="Darrowmere,PvE,enUS,US,PST",
[1352]="Ravenholdt,PvP RP,enUS,US,EST",
[1353]="Bladefist,PvE,enUS,US,PST",
[1354]="Shu'halo,PvE,enUS,US,PST",
[1355]="Winterhoof,PvE,enUS,US,CST",
[1356]="Sisters of Elune,RP,enUS,US,CST",
[1357]="Maiev,PvP,enUS,US,PST",
[1358]="Rivendare,PvP,enUS,US,PST",
[1359]="Nordrassil,PvE,enUS,US,PST",
[1360]="Tortheldrin,PvP,enUS,US,EST",
[1361]="Cairne,PvE,enUS,US,CST",
[1362]="Drak'Tharon,PvP,enUS,US,CST",
[1363]="Antonidas,PvE,enUS,US,PST",
[1364]="Shandris,PvE,enUS,US,EST",
[1365]="Moon Guard,RP,enUS,US,CST",
[1367]="Nazgrel,PvE,enUS,US,EST",
[1368]="Hydraxis,PvE,enUS,US,CST",
[1369]="Wyrmrest Accord,RP,enUS,US,PST",
[1370]="Farstriders,RP,enUS,US,CST",
[1371]="Borean Tundra,PvE,enUS,US,CST",
[1372]="Quel'dorei,PvE,enUS,US,CST",
[1373]="Garrosh,PvE,enUS,US,EST",
[1374]="Mok'Nathal,PvE,enUS,US,CST",
[1375]="Nesingwary,PvE,enUS,US,CST",
[1377]="Drenden,PvE,enUS,US,EST",
[1425]="Drakkari,PvP,esMX,US,CST",
[1427]="Ragnaros,PvP,esMX,US,CST",
[1428]="Quel'Thalas,PvE,esMX,US,CST",
[1549]="Azuremyst,PvE,enUS,US,PST",
[1555]="Auchindoun,PvP,enUS,US,EST",
[1556]="Coilfang,PvP,enUS,US,PST",
[1557]="Shattered Halls,PvP,enUS,US,PST",
[1558]="Blood Furnace,PvP,enUS,US,CST",
[1559]="The Underbog,PvP,enUS,US,CST",
[1563]="Terokkar,PvE,enUS,US,CST",
[1564]="Blade's Edge,PvE,enUS,US,PST",
[1565]="Exodar,PvE,enUS,US,EST",
[1566]="Area 52,PvE,enUS,US,EST",
[1567]="Velen,PvE,enUS,US,PST",
[1570]="The Scryers,RP,enUS,US,PST",
[1572]="Zangarmarsh,PvE,enUS,US,MST",
[1576]="Fizzcrank,PvE,enUS,US,CST",
[1578]="Ghostlands,PvE,enUS,US,CST",
[1579]="Grizzly Hills,PvE,enUS,US,CST",
[1581]="Galakrond,PvE,enUS,US,PST",
[1582]="Dawnbringer,PvE,enUS,US,CST",
[3207]="Goldrinn,PvE,ptBR,US,BRT",
[3208]="Nemesis,PvP,ptBR,US,BRT",
[3209]="Azralon,PvP,ptBR,US,BRT",
[3210]="Tol Barad,PvP,ptBR,US,BRT",
[3234]="Gallywix,PvE,ptBR,US,BRT",
[3721]="Caelestrasz,PvE,enUS,US,AEST",
[3722]="Aman'Thul,PvE,enUS,US,AEST",
[3723]="Barthilas,PvP,enUS,US,AEST",
[3724]="Thaurissan,PvP,enUS,US,AEST",
[3725]="Frostmourne,PvP,enUS,US,AEST",
[3726]="Khaz'goroth,PvE,enUS,US,AEST",
[3733]="Dreadmaul,PvP,enUS,US,AEST",
[3734]="Nagrand,PvE,enUS,US,AEST",
[3735]="Dath'Remar,PvE,enUS,US,AEST",
[3736]="Jubei'Thos,PvP,enUS,US,AEST",
[3737]="Gundrak,PvP,enUS,US,AEST",
[3738]="Saurfang,PvE,enUS,US,AEST",
--}}
--{{ China
[700]="阿格拉玛,PVP,zhCN,CN",
[703]="艾苏恩,PVP,zhCN,CN",
[704]="安威玛尔,PVP,zhCN,CN",
[705]="奥达曼,PVP,zhCN,CN",
[706]="奥蕾莉亚,PVE,zhCN,CN",
[707]="白银之手,PVE,zhCN,CN",
[708]="暴风祭坛,PVP,zhCN,CN",
[709]="藏宝海湾,PVP,zhCN,CN",
[710]="尘风峡谷,PVP,zhCN,CN",
[711]="达纳斯,PVP,zhCN,CN",
[712]="迪托马斯,PVP,zhCN,CN",
[714]="国王之谷,PVP,zhCN,CN",
[715]="黑龙军团,PVP,zhCN,CN",
[716]="黑石尖塔,PVP,zhCN,CN",
[717]="红龙军团,PVP,zhCN,CN",
[718]="回音山,PVE,zhCN,CN",
[719]="基尔罗格,PVP,zhCN,CN",
[720]="卡德罗斯,PVP,zhCN,CN",
[721]="卡扎克,PVP,zhCN,CN",
[723]="库德兰,PVP,zhCN,CN",
[725]="蓝龙军团,PVP,zhCN,CN",
[726]="雷霆之王,PVP,zhCN,CN",
[727]="烈焰峰,PVP,zhCN,CN",
[729]="罗宁,PVP,zhCN,CN",
[730]="洛萨,PVP,zhCN,CN",
[731]="玛多兰,PVE,zhCN,CN",
[732]="玛瑟里顿,PVP,zhCN,CN",
[734]="奈萨里奥,PVP,zhCN,CN",
[736]="诺莫瑞根,PVP,zhCN,CN",
[737]="普瑞斯托,PVE,zhCN,CN",
[738]="燃烧平原,PVP,zhCN,CN",
[739]="萨格拉斯,PVP,zhCN,CN",
[740]="山丘之王,PVP,zhCN,CN",
[741]="死亡之翼,PVP,zhCN,CN",
[742]="索拉丁,PVP,zhCN,CN",
[744]="铜龙军团,PVP,zhCN,CN",
[745]="图拉扬,PVE,zhCN,CN",
[746]="伊瑟拉,PVE,zhCN,CN",
[748]="阿迦玛甘,PVP,zhCN,CN",
[749]="阿克蒙德,PVP,zhCN,CN",
[750]="埃加洛尔,PVP,zhCN,CN",
[751]="埃苏雷格,PVP,zhCN,CN",
[753]="艾萨拉,PVP,zhCN,CN",
[754]="艾森娜,PVE,zhCN,CN",
[755]="爱斯特纳,PVP,zhCN,CN",
[756]="暗影之月,PVP,zhCN,CN",
[757]="奥拉基尔,PVP,zhCN,CN",
[758]="冰霜之刃,PVP,zhCN,CN",
[760]="达斯雷玛,PVP,zhCN,CN",
[761]="地狱咆哮,PVP,zhCN,CN",
[762]="地狱之石,PVP,zhCN,CN",
[764]="风暴之怒,PVP,zhCN,CN",
[765]="风行者,PVP,zhCN,CN",
[766]="弗塞雷迦,PVP,zhCN,CN",
[767]="戈古纳斯,PVP,zhCN,CN",
[768]="海加尔,PVP,zhCN,CN",
[769]="毁灭之锤,PVP,zhCN,CN",
[770]="火焰之树,PVP,zhCN,CN",
[771]="卡德加,PVP,zhCN,CN",
[772]="拉文凯斯,PVP,zhCN,CN",
[773]="玛法里奥,PVP,zhCN,CN",
[774]="麦维影歌,PVP,zhCN,CN",
[775]="梅尔加尼,PVP,zhCN,CN",
[776]="梦境之树,PVE,zhCN,CN",
[778]="耐普图隆,PVP,zhCN,CN",
[780]="轻风之语,PVE,zhCN,CN",
[781]="夏维安,PVP,zhCN,CN",
[782]="塞纳里奥,PVE,zhCN,CN",
[784]="闪电之刃,PVP,zhCN,CN",
[786]="石爪峰,PVP,zhCN,CN",
[787]="泰兰德,PVE,zhCN,CN",
[788]="屠魔山谷,PVP,zhCN,CN",
[790]="伊利丹,PVP,zhCN,CN",
[791]="月光林地,PVE,zhCN,CN",
[792]="月神殿,PVE,zhCN,CN",
[793]="战歌,PVP,zhCN,CN",
[794]="主宰之剑,PVP,zhCN,CN",
[797]="埃德萨拉,PVP,zhCN,CN",
[799]="血环,PVP,zhCN,CN",
[800]="布莱克摩,PVP,zhCN,CN",
[802]="杜隆坦,PVP,zhCN,CN",
[803]="符文图腾,PVP,zhCN,CN",
[804]="鬼雾峰,PVP,zhCN,CN",
[805]="黑暗之矛,PVP,zhCN,CN",
[806]="红龙女王,PVP,zhCN,CN",
[807]="红云台地,PVP,zhCN,CN",
[808]="黄金之路,PVE,zhCN,CN",
[810]="火羽山,PVP,zhCN,CN",
[812]="迦罗娜,PVP,zhCN,CN",
[814]="凯恩血蹄,PVP,zhCN,CN",
[815]="狂风峭壁,PVP,zhCN,CN",
[816]="雷斧堡垒,PVP,zhCN,CN",
[817]="雷克萨,PVP,zhCN,CN",
[818]="雷霆号角,PVP,zhCN,CN",
[822]="玛里苟斯,PVP,zhCN,CN",
[825]="纳沙塔尔,PVP,zhCN,CN",
[826]="诺兹多姆,PVE,zhCN,CN",
[827]="普罗德摩,PVP,zhCN,CN",
[828]="千针石林,PVP,zhCN,CN",
[829]="燃烧之刃,PVP,zhCN,CN",
[830]="萨尔,PVP,zhCN,CN",
[833]="圣火神殿,PVP,zhCN,CN",
[835]="甜水绿洲,PVP,zhCN,CN",
[838]="熊猫酒仙,PVP,zhCN,CN",
[839]="血牙魔王,PVP,zhCN,CN",
[840]="勇士岛,PVP,zhCN,CN",
[841]="羽月,PVE,zhCN,CN",
[842]="蜘蛛王国,PVP,zhCN,CN",
[843]="自由之风,PVP,zhCN,CN",
[844]="阿尔萨斯,PVP,zhCN,CN",
[845]="阿拉索,PVP,zhCN,CN",
[846]="埃雷达尔,PVP,zhCN,CN",
[847]="艾欧纳尔,PVP,zhCN,CN",
[849]="暗影议会,PVP,zhCN,CN",
[850]="奥特兰克,PVP,zhCN,CN",
[851]="巴尔古恩,PVP,zhCN,CN",
[852]="冰风岗,PVP,zhCN,CN",
[855]="达隆米尔,PVP,zhCN,CN",
[856]="耳语海岸,PVE,zhCN,CN",
[857]="古尔丹,PVP,zhCN,CN",
[858]="寒冰皇冠,PVP,zhCN,CN",
[859]="基尔加丹,PVP,zhCN,CN",
[860]="激流堡,PVP,zhCN,CN",
[861]="巨龙之吼,PVP,zhCN,CN",
[863]="凯尔萨斯,PVP,zhCN,CN",
[864]="克尔苏加德,PVP,zhCN,CN",
[865]="拉格纳洛斯,PVP,zhCN,CN",
[867]="利刃之拳,PVP,zhCN,CN",
[869]="玛诺洛斯,PVP,zhCN,CN",
[870]="麦迪文,PVE,zhCN,CN",
[872]="耐奥祖,PVP,zhCN,CN",
[874]="瑞文戴尔,PVP,zhCN,CN",
[876]="霜狼,PVP,zhCN,CN",
[877]="霜之哀伤,PVE,zhCN,CN",
[878]="斯坦索姆,PVP,zhCN,CN",
[882]="提瑞斯法,PVP,zhCN,CN",
[883]="通灵学院,PVP,zhCN,CN",
[885]="希尔瓦娜斯,PVP,zhCN,CN",
[886]="血色十字军,PVP,zhCN,CN",
[887]="遗忘海岸,PVE,zhCN,CN",
[888]="银松森林,PVE,zhCN,CN",
[889]="银月,PVE,zhCN,CN",
[890]="鹰巢山,PVP,zhCN,CN",
[891]="影牙要塞,PVP,zhCN,CN",
[915]="狂热之刃,PVP,zhCN,CN",
[916]="卡珊德拉,PVP,zhCN,CN",
[917]="迅捷微风,PVP,zhCN,CN",
[918]="守护之剑,PVP,zhCN,CN",
[920]="斩魔者,PVP,zhCN,CN",
[921]="布兰卡德,PVP,zhCN,CN",
[922]="世界之树,PVE,zhCN,CN",
[924]="恶魔之翼,PVP,zhCN,CN",
[925]="万色星辰,PVE,zhCN,CN",
[926]="激流之傲,PVP,zhCN,CN",
[927]="加兹鲁维,PVP,zhCN,CN",
[928]="水晶之刺,PVP,zhCN,CN",
[929]="苏塔恩,PVP,zhCN,CN",
[930]="大地之怒,PVP,zhCN,CN",
[931]="雏龙之翼,PVP,zhCN,CN",
[932]="黑暗魅影,PVP,zhCN,CN",
[933]="踏梦者,PVP,zhCN,CN",
[936]="浸毒之骨,PVP,zhCN,CN",
[938]="密林游侠,PVP,zhCN,CN",
[940]="伊森利恩,PVP,zhCN,CN",
[941]="神圣之歌,PVE,zhCN,CN",
[943]="暮色森林,PVP,zhCN,CN",
[944]="元素之力,PVP,zhCN,CN",
[946]="日落沼泽,PVP,zhCN,CN",
[949]="芬里斯,PVP,zhCN,CN",
[951]="伊萨里奥斯,PVP,zhCN,CN",
[952]="安多哈尔,PVP,zhCN,CN",
[953]="风暴之眼,PVP,zhCN,CN",
[954]="提尔之手,PVP,zhCN,CN",
[956]="永夜港,PVE,zhCN,CN",
[959]="朵丹尼尔,PVP,zhCN,CN",
[960]="法拉希姆,PVP,zhCN,CN",
[962]="金色平原,rppvp,zhCN,CN",
[1198]="安其拉,PVP,zhCN,CN",
[1199]="安纳塞隆,PVP,zhCN,CN",
[1200]="阿努巴拉克,PVP,zhCN,CN",
[1201]="阿拉希,PVP,zhCN,CN",
[1202]="瓦里玛萨斯,PVE,zhCN,CN",
[1203]="巴纳扎尔,PVP,zhCN,CN",
[1204]="黑手军团,PVP,zhCN,CN",
[1205]="血羽,PVP,zhCN,CN",
[1206]="燃烧军团,PVP,zhCN,CN",
[1207]="克洛玛古斯,PVP,zhCN,CN",
[1208]="破碎岭,PVP,zhCN,CN",
[1209]="克苏恩,PVP,zhCN,CN",
[1210]="阿纳克洛斯,PVP,zhCN,CN",
[1211]="雷霆之怒,PVP,zhCN,CN",
[1212]="桑德兰,PVP,zhCN,CN",
[1213]="黑翼之巢,PVP,zhCN,CN",
[1214]="德拉诺,PVP,zhCN,CN",
[1215]="龙骨平原,PVP,zhCN,CN",
[1216]="卡拉赞,PVP,zhCN,CN",
[1221]="熔火之心,PVP,zhCN,CN",
[1222]="格瑞姆巴托,PVP,zhCN,CN",
[1223]="古拉巴什,PVP,zhCN,CN",
[1224]="哈卡,PVP,zhCN,CN",
[1225]="海克泰尔,PVP,zhCN,CN",
[1226]="库尔提拉斯,PVP,zhCN,CN",
[1227]="洛丹伦,PVP,zhCN,CN",
[1228]="奈法利安,PVP,zhCN,CN",
[1229]="奎尔萨拉斯,PVP,zhCN,CN",
[1230]="拉贾克斯,PVP,zhCN,CN",
[1231]="拉文霍德,PVP,zhCN,CN",
[1232]="森金,PVP,zhCN,CN",
[1233]="范达尔鹿盔,PVP,zhCN,CN",
[1234]="泰拉尔,PVP,zhCN,CN",
[1235]="瓦拉斯塔兹,PVP,zhCN,CN",
[1236]="永恒之井,PVP,zhCN,CN",
[1237]="海达希亚,PVE,zhCN,CN",
[1238]="萨菲隆,PVP,zhCN,CN",
[1239]="纳克萨玛斯,PVP,zhCN,CN",
[1240]="无尽之海,PVP,zhCN,CN",
[1241]="莱索恩,PVP,zhCN,CN",
[1482]="阿卡玛,PVP,zhCN,CN",
[1483]="阿扎达斯,PVP,zhCN,CN",
[1484]="灰谷,PVP,zhCN,CN",
[1485]="艾维娜,PVE,zhCN,CN",
[1486]="巴瑟拉斯,PVP,zhCN,CN",
[1487]="血顶,PVP,zhCN,CN",
[1488]="恐怖图腾,PVP,zhCN,CN",
[1489]="古加尔,PVP,zhCN,CN",
[1490]="达文格尔,PVP,zhCN,CN",
[1491]="黑铁,PVP,zhCN,CN",
[1492]="恶魔之魂,PVP,zhCN,CN",
[1493]="迪瑟洛克,PVP,zhCN,CN",
[1494]="丹莫德,PVP,zhCN,CN",
[1495]="艾莫莉丝,PVP,zhCN,CN",
[1496]="埃克索图斯,PVP,zhCN,CN",
[1497]="菲拉斯,PVP,zhCN,CN",
[1498]="加基森,PVP,zhCN,CN",
[1499]="加里索斯,PVP,zhCN,CN",
[1500]="格雷迈恩,PVP,zhCN,CN",
[1501]="布莱恩,PVE,zhCN,CN",
[1502]="伊莫塔尔,PVP,zhCN,CN",
[1503]="大漩涡,PVP,zhCN,CN",
[1504]="诺森德,PVP,zhCN,CN",
[1505]="奥妮克希亚,PVP,zhCN,CN",
[1506]="奥斯里安,PVP,zhCN,CN",
[1507]="外域,PVP,zhCN,CN",
[1508]="天空之墙,PVP,zhCN,CN",
[1509]="风暴之鳞,PVP,zhCN,CN",
[1510]="荆棘谷,PVP,zhCN,CN",
[1511]="逐日者,PVE,zhCN,CN",
[1512]="塔纳利斯,PVP,zhCN,CN",
[1513]="瑟莱德丝,PVP,zhCN,CN",
[1514]="塞拉赞恩,PVP,zhCN,CN",
[1515]="托塞德林,PVP,zhCN,CN",
[1516]="黑暗虚空,PVP,zhCN,CN",
[1517]="安戈洛,PVP,zhCN,CN",
[1519]="祖尔金,PVP,zhCN,CN",
[1657]="冰川之拳,PVP,zhCN,CN",
[1658]="刺骨利刃,PVP,zhCN,CN",
[1659]="深渊之巢,PVP,zhCN,CN",
[1662]="火烟之谷,PVP,zhCN,CN",
[1663]="伊兰尼库斯,PVP,zhCN,CN",
[1664]="火喉,PVP,zhCN,CN",
[1667]="迦玛兰,PVP,zhCN,CN",
[1668]="金度,PVP,zhCN,CN",
[1670]="巫妖之王,PVP,zhCN,CN",
[1672]="米奈希尔,PVP,zhCN,CN",
[1676]="幽暗沼泽,PVP,zhCN,CN",
[1681]="烈焰荆棘,PVP,zhCN,CN",
[1682]="夺灵者,PVP,zhCN,CN",
[1685]="石锤,PVP,zhCN,CN",
[1687]="塞拉摩,PVP,zhCN,CN",
[1692]="厄祖玛特,PVP,zhCN,CN",
[1693]="冬泉谷,PVP,zhCN,CN",
[1694]="伊森德雷,PVP,zhCN,CN",
[1695]="扎拉赞恩,PVP,zhCN,CN",
[1696]="亚雷戈斯,PVE,zhCN,CN",
[1793]="深渊之喉,PVP,zhCN,CN",
[1794]="凤凰之神,PVP,zhCN,CN",
[1795]="阿古斯,PVP,zhCN,CN",
[1798]="鲜血熔炉,PVP,zhCN,CN",
[1801]="黑暗之门,PVP,zhCN,CN",
[1802]="死亡熔炉,PVP,zhCN,CN",
[1803]="无底海渊,PVP,zhCN,CN",
[1807]="格鲁尔,PVP,zhCN,CN",
[1808]="哈兰,PVP,zhCN,CN",
[1809]="军团要塞,PVP,zhCN,CN",
[1810]="麦姆,PVP,zhCN,CN",
[1812]="艾露恩,PVE,zhCN,CN",
[1813]="穆戈尔,PVP,zhCN,CN",
[1815]="摩摩尔,PVP,zhCN,CN",
[1817]="试炼之环,PVP,zhCN,CN",
[1819]="希雷诺斯,PVP,zhCN,CN",
[1820]="塞泰克,PVP,zhCN,CN",
[1821]="暗影迷宫,PVP,zhCN,CN",
[1823]="托尔巴拉德,PVP,zhCN,CN",
[1824]="太阳之井,PVP,zhCN,CN",
[1827]="末日祷告祭坛,PVP,zhCN,CN",
[1828]="范克里夫,PVP,zhCN,CN",
[1829]="瓦丝琪,PVP,zhCN,CN",
[1830]="祖阿曼,PVP,zhCN,CN",
[1832]="翡翠梦境,PVE,zhCN,CN",
[1931]="阿比迪斯,PVP,zhCN,CN",
[1932]="阿曼尼,PVP,zhCN,CN",
[1933]="安苏,PVP,zhCN,CN",
[1934]="生态船,PVP,zhCN,CN",
[1935]="阿斯塔洛,PVP,zhCN,CN",
[1936]="白骨荒野,PVP,zhCN,CN",
[1937]="布鲁塔卢斯,PVP,zhCN,CN",
[1938]="达尔坎,PVP,zhCN,CN",
[1939]="末日行者,PVP,zhCN,CN",
[1940]="达基萨斯,PVP,zhCN,CN",
[1941]="熵魔,PVP,zhCN,CN",
[1942]="能源舰,PVP,zhCN,CN",
[1943]="菲米丝,PVP,zhCN,CN",
[1944]="加尔,PVP,zhCN,CN",
[1945]="迦顿,PVP,zhCN,CN",
[1946]="血吼,PVP,zhCN,CN",
[1947]="戈提克,PVP,zhCN,CN",
[1948]="盖斯,PVP,zhCN,CN",
[1949]="壁炉谷,PVP,zhCN,CN",
[1950]="贫瘠之地,PVE,zhCN,CN",
[1955]="霍格,PVP,zhCN,CN",
[1965]="奎尔丹纳斯,PVP,zhCN,CN",
[1969]="萨洛拉丝,PVP,zhCN,CN",
[1970]="沙怒,PVP,zhCN,CN",
[1971]="嚎风峡湾,PVP,zhCN,CN",
[2118]="迦拉克隆,PVE,zhCN,CN",
[2120]="奥尔加隆,PVP,zhCN,CN",
[2121]="安格博达,PVP,zhCN,CN",
[2122]="安加萨,PVP,zhCN,CN",
[2123]="织亡者,PVP,zhCN,CN",
[2124]="亡语者,PVP,zhCN,CN",
[2125]="达克萨隆,PVP,zhCN,CN",
[2126]="黑锋哨站,PVP,zhCN,CN",
[2127]="古达克,PVP,zhCN,CN",
[2129]="洛肯,PVP,zhCN,CN",
[2130]="玛洛加尔,PVP,zhCN,CN",
[2131]="莫德雷萨,PVP,zhCN,CN",
[2132]="萨塔里奥,PVP,zhCN,CN",
[2133]="影之哀伤,PVP,zhCN,CN",
[2134]="风暴峭壁,PVP,zhCN,CN",
[2135]="远古海滩,PVP,zhCN,CN",
[2137]="冬拥湖,PVP,zhCN,CN",
--}}
--{{ Taiwan
[963]="暗影之月,PvE,zhTW,TW,Shadowmoon",
[964]="尖石,PvP,zhTW,TW,Spirestone",
[965]="雷鱗,PvP,zhTW,TW,Stormscale",
[966]="巨龍之喉,PvP,zhTW,TW,Dragonmaw",
[977]="冰霜之刺,PvP,zhTW,TW,Frostmane",
[978]="日落沼澤,PvP,zhTW,TW,Sundown Marsh",
[979]="地獄吼,PvP,zhTW,TW,Hellscream",
[980]="天空之牆,PvE,zhTW,TW,Skywall",
[982]="世界之樹,PvE,zhTW,TW,World Tree",
[985]="水晶之刺,PvP,zhTW,TW,Crystalpine Stinger",
[999]="狂熱之刃,PvP,zhTW,TW,Zealot Blade",
[1001]="冰風崗哨,PvP,zhTW,TW,Chillwind Point",
[1006]="米奈希爾,PvP,zhTW,TW,Menethil",
[1023]="屠魔山谷,PvP,zhTW,TW,Demon Fall Canyon",
[1033]="語風,PvE,zhTW,TW,Whisperwind",
[1037]="血之谷,PvP,zhTW,TW,Bleeding Hollow",
[1038]="亞雷戈斯,PvE,zhTW,TW,Arygos",
[1043]="夜空之歌,PvP,zhTW,TW,Nightsong",
[1046]="聖光之願,PvE,zhTW,TW,Light's Hope",
[1048]="銀翼要塞,PvP,zhTW,TW,Silverwing Hold",
[1049]="憤怒使者,PvP,zhTW,TW,Wrathbringer",
[1054]="阿薩斯,PvP,zhTW,TW,Arthas",
[1056]="眾星之子,PvE,zhTW,TW,Quel'dorei",
[1057]="寒冰皇冠,PvP,zhTW,TW,Icecrown",
[2075]="雲蛟衛,PvE,zhTW,TW,Order of the Cloud Serpent",
--}}
}

------------------------------------------------------------------------

connectionData = {
--{{ US
"4,US,4,1355",
"5,US,5",
"7,US,7,1348",
"9,US,9",
"10,US,10",
"11,US,11",
"12,US,12,1154,1370",
"47,US,47,1354",
"51,US,51",
"52,US,52,65",
"53,US,53,1572",
"54,US,54,1581",
"55,US,55,1271",
"57,US,57",
"58,US,58",
"60,US,60",
"61,US,61",
"62,US,62,1565",
"63,US,63,1270",
"64,US,64,1258",
"67,US,67,97",
"68,US,68,1579",
"69,US,69",
"70,US,70,1131,1558",
"71,US,71,80,1075,1293,1344",
"73,US,73",
"74,US,74,1068,1280",
"75,US,75,1570",
"76,US,76",
"77,US,77,79,103,1128",
"78,US,78,1264,1268,1282",
"84,US,84,1137,1145",
"85,US,85,1371",
"86,US,86,1374",
"87,US,87,1351",
"90,US,90,1368",
"91,US,91,95,1285",
"96,US,96,1567",
"98,US,98,1262",
"99,US,99,1297",
"100,US,100",
"101,US,101,1067,1555",
"104,US,104,14",
"105,US,105,1564",
"106,US,106,1576",
"113,US,113,1139",
"114,US,114,1345",
"115,US,115,1342",
"116,US,116,1363",
"117,US,117,1364",
"118,US,118,126",
"119,US,119,108,111,112,1357",
"120,US,120",
"121,US,121,1143",
"122,US,122,1361",
"123,US,123,1349",
"125,US,125,1347",
"127,US,127,110,124,1148,1358,1362",
"128,US,128,8,1360",
"131,US,131,1140",
"151,US,151,3",
"153,US,153,1287",
"154,US,154,81,94,1266,1295,1296",
"155,US,155,15,1277,1557",
"156,US,156,1259,1267,1276",
"157,US,157,72,1278,1286,1556",
"158,US,158,1292",
"159,US,159,82,92,93",
"160,US,160,1549",
"162,US,162",
"163,US,163,1130,1289",
"164,US,164,1352",
"1069,US,1069,1578",
"1070,US,1070,1563",
"1071,US,1071,1260,1290",
"1072,US,1072,1283",
"1129,US,1129,56,102,1291,1559",
"1136,US,1136,83,109,129,1142",
"1138,US,1138,89,107,130,1141,1346",
"1146,US,1146",
"1147,US,1147,1353",
"1151,US,1151,1350",
"1165,US,1165,1377",
"1168,US,2",
"1169,US,88,1356",
"1171,US,1369",
"1173,US,1173,1582",
"1174,US,1288,1294",
"1175,US,1175,1132",
"1182,US,1182,1359",
"1184,US,1184,1367,1375",
"1185,US,1185,1372",
"1190,US,1190,13",
"1425,US,1425",
"1426,US,1284",
"1427,US,1427",
"1428,US,1428",
"3207,US,3207",
"3208,US,3208,3210",
"3209,US,3209",
"3234,US,3234",
"3661,US,6",
"3675,US,1365",
"3676,US,1566",
"3677,US,1373",
"3678,US,1263",
"3683,US,66",
"3684,US,59",
"3685,US,1265",
"3693,US,16",
"3694,US,1",
"3721,US,3721,3734",
"3722,US,3722",
"3723,US,3723",
"3724,US,3724,3733",
"3725,US,3725",
"3726,US,3726,3735",
"3728,US,3736,3737",
"3729,US,3738",
--}}
--{{ TW
"963,TW,963,1033,1056",
"964,TW,964,1001,1057",
"966,TW,966,965,1043",
"977,TW,977,1006,1037",
"978,TW,978,1023",
"980,TW,980,1046",
"984,TW,1048",
"985,TW,985,1049",
"999,TW,999,979,1054",
"3663,TW,982,1038,2075",
--}}
}

------------------------------------------------------------------------

if standalone then
	LRI_RealmData = realmData
	LRI_ConnectionData = connectionData
end
