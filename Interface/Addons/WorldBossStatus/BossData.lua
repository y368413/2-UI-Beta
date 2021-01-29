local L = LibStub("AceLocale-3.0"):GetLocale("WorldBossStatus")
local resetIntervals = { daily = 1, weekly = 2, unknown = 3 }

function GetWeeklyQuestResetTime()
	local now = time()
	local region = GetCurrentRegion()
	local dayOffset = { 2, 1, 0, 6, 5, 4, 3 }
	local regionDayOffset = {{ 2, 1, 0, 6, 5, 4, 3 }, { 4, 3, 2, 1, 0, 6, 5 }, { 3, 2, 1, 0, 6, 5, 4 }, { 4, 3, 2, 1, 0, 6, 5 }, { 4, 3, 2, 1, 0, 6, 5 } }
	local nextDailyReset = GetQuestResetTime()
	local utc = date("!*t", now + nextDailyReset)
	local reset = regionDayOffset[region][utc.wday] * 86400 + now + nextDailyReset

	return reset
 end

 function WorldBossStatus:GetLastSeenData(crowdTrackingOnly)
	local lastSeenData = WorldBossStatus.db.global.lastSeen or {}
	local result = {}
	local bossData = self:GetBossData()

	for _, category in pairs(bossData) do
		for _, boss in pairs(category.bosses) do
			if lastSeenData[boss.index] and (boss.crowdTracking or not crowdTrackingOnly) then
				result[boss.index] = lastSeenData[boss.index]
			end
		end
	end

	return result
 end

 function WorldBossStatus:UpdateLastSeenData(newLastSeenData)
	local lastSeenData = WorldBossStatus.db.global.lastSeen or {}
	local bossData = WorldBossStatus:GetBossData()
	local updateCount = 0

	for _, category in pairs(bossData) do
		for _, boss in pairs(category.bosses) do
			if newLastSeenData[boss.index] then
				if not lastSeenData[boss.index] or newLastSeenData[boss.index] > lastSeenData[boss.index] then
					lastSeenData[boss.index] = newLastSeenData[boss.index]
					updateCount = updateCount + 1
				end
			end
		end
	end

	if self.debug then
		self:Print(updateCount.." change applied to last seen data.")
	end

	WorldBossStatus.db.global.lastSeen = lastSeenData
 end


function FlagActiveBosses()
	local bossData = WorldBossStatus:GetBossData()
	local lastSeenData = WorldBossStatus.db.global.lastSeen or {}

	for _, category in pairs(bossData) do
		for _, boss in pairs(category.bosses) do
			if boss.worldQuestID then
				boss.active = false
				if WorldBossStatus.debug then
					local name = C_TaskQuest.GetQuestInfoByQuestID(boss.worldQuestID) or "?"
					local mins = C_TaskQuest.GetQuestTimeLeftMinutes(boss.worldQuestID) or "?"
					local active = C_TaskQuest.IsActive(boss.worldQuestID) or "false"
					WorldBossStatus:Print("World Quest ID: [ID="..boss.worldQuestID.. ", Name="..name.. ", Time Left="..mins..", Active=",active)
				end

				if WorldBossStatus:PlayerIsEligibleForBoss(boss) then
					if C_TaskQuest.IsActive(boss.worldQuestID) or
						(C_QuestLog.IsQuestFlaggedCompleted(boss.trackingID) and boss.resetInterval == resetIntervals.weekly) then
						lastSeenData[boss.index]  = time()
						boss.active = true
					elseif boss.factionCounterpartID then
						if not C_TaskQuest.IsActive(boss.worldQuestID) and not C_QuestLog.IsQuestFlaggedCompleted(boss.trackingID) then
							lastSeenData[tostring(boss.factionCounterpartID)] = time()
						end
					end
				else
					if boss.resetInterval == resetIntervals.weekly then
						if lastSeenData[boss.index] and lastSeenData[boss.index] > GetWeeklyQuestResetTime() - 604800 then
							boss.active = true
						end
					elseif boss.factionCounterpartID then
						if lastSeenData[boss.index] and lastSeenData[tostring(boss.factionCounterpartID)] then
							boss.active = lastSeenData[boss.index] > lastSeenData[tostring(boss.factionCounterpartID)]
						end
					end
				end
			else
				boss.active = true
			end

		end
	end

	WorldBossStatus.db.global.lastSeen = lastSeenData
end

local function GetWorldBoss(args)
	local boss = {}

	if not args.name then
		if args.encounterID then
			args.name = EJ_GetEncounterInfo(args.encounterID)
		elseif args.worldQuestID then
			args.name = C_TaskQuest.GetQuestInfoByQuestID(args.worldQuestID) or "?"
		else
			args.name = "Unkown"
		end
	end

	if not args.location then
		if not args.zoneID and args.worldQuestID then
			args.zoneID = C_TaskQuest.GetQuestZoneID(args.worldQuestID)
		end

		if args.zoneID then
			local mapInfo = C_Map.GetMapInfo(args.zoneID)
			args.location = mapInfo.name
		end
	end

	if not args.trackingID and args.worldQuestID then
		args.trackingID = args.worldQuestID
	end

	if not args.resetInterval then
		args.resetInterval = resetIntervals.weekly
	end

	boss.index = tostring(args.trackingID or args.dungeonID)
	boss.name = args.name
	boss.location = args.location
	boss.trackingID = args.trackingID
	boss.questId = args.trackingID
	boss.bonusRollID = args.bonusRollID

	boss.worldQuestID = args.worldQuestID
	boss.dungeonID = args.dungeonID
	boss.resetInterval = args.resetInterval
	boss.faction = args.faction
	boss.factionCounterpartID = args.factionCounterpartID
	boss.crowdWatch = args.crowdWatch
	boss.prerequisite = args.prerequisite

	return boss
end

function AddHoliday()
	local holidayBosses = nil
	local bosses = {}

	for index = 1, GetNumRandomDungeons() do
		local dungeonID, name = GetLFGRandomDungeonInfo(index);
		local _, _, _, _, _, _, _, _, _, _, _, _, _, description, isHoliday = GetLFGDungeonInfo(dungeonID)

		if isHoliday and dungeonID ~= 828  and description ~= "" then
			boss = {}

			boss.index = dungeonID
			boss.name = name
			boss.displayName = name
			boss.dungeonID = dungeonID
			boss.active = true
			boss.resetInterval = resetIntervals.daily
			table.insert(bosses, boss)
		end
	end

	if #bosses > 0 then
		holidayBosses = {}
		holidayBosses.name = 'Holiday'
		holidayBosses.maxKills = #bosses
		holidayBosses.bosses = bosses
		holidayBosses.bonusRollCurrencies = {1580}
		table.insert(WorldBossStatus.data, holidayBosses)
	end
end

function AddShadowlands()
	local category = {}
	local criteria = {
		level = 60
	}

	category.name = _G["EXPANSION_NAME8"]
	category.title = category.name.." "..L["Bosses"]
	category.expansion = 8
	category.bosses = {
		GetWorldBoss({worldQuestID = 61813, encounterID = 2430, prerequisite = criteria }),		-- Valinor, the Light of Eons
		GetWorldBoss({worldQuestID = 61816, encounterID = 2431, prerequisite = criteria }),		-- Mortanis
		GetWorldBoss({worldQuestID = 61815, encounterID = 2432, prerequisite = criteria }),		-- Oranonomos, the Everbreaching
		GetWorldBoss({worldQuestID = 61814, encounterID = 2433, prerequisite = criteria }),		-- Nurgash Muckformed
	}
	if GetAccountExpansionLevel() >= category.expansion and
		(not WorldBossStatus.db.global.bossOptions.ignoredExpansions or
		not WorldBossStatus.db.global.bossOptions.ignoredExpansions[category.expansion]) then
		--WorldBossStatus.data[#WorldBossStatus.data +1] = category
		table.insert(WorldBossStatus.data, category)
	end
end

function AddZandalarAndKulTiras()
	local category = {}
	local criteria = {
		['Alliance'] = 51918,
		['Horde'] = 51916
	}

	category.name = _G["EXPANSION_NAME7"]
	category.title = category.name.." "..L["Bosses"]
	category.expansion = 7
	category.bosses = {
		GetWorldBoss({worldQuestID = 52196, trackingID = 53000, bonusRollID = 52265, encounterID = 2210, prerequisite = criteria }),		-- Dunegorger Kraulok
		GetWorldBoss({worldQuestID = 52169, trackingID = 52998, bonusRollID = 52264, encounterID = 2141, prerequisite = criteria }), 		-- Ji'arak
		GetWorldBoss({worldQuestID = 52181, trackingID = 52996, bonusRollID = 52263, encounterID = 2139, prerequisite = criteria }),		-- T'zane
		GetWorldBoss({worldQuestID = 52166, trackingID = 52995, bonusRollID = 52266, encounterID = 2198, prerequisite = criteria }), 		-- Warbringer Yenajz 52995, 52266
		GetWorldBoss({worldQuestID = 52163, trackingID = 52997, bonusRollID = 52267, encounterID = 2199, prerequisite = criteria }), 		-- Azurethos, The Winged Typhoon
		GetWorldBoss({worldQuestID = 52157, trackingID = 52999, bonusRollID = 52268, encounterID = 2197, prerequisite = criteria }), 		-- Hailstone Construct
		GetWorldBoss({worldQuestID = 52847, trackingID = 53002, bonusRollID = 52273, encounterID = 2213, prerequisite = criteria, 
			faction = 'Alliance', factionCounterpartID = 52848, crowdWatch = true }), 														-- Doom's Howl
		GetWorldBoss({worldQuestID = 52848, encounterID = 2212, prerequisite = criteria, faction = 'Horde', factionCounterpartID = 52847, crowdWatch = true}),	-- The Lion's Roar
		GetWorldBoss({worldQuestID = 54895, encounterID = 2345, trackingID = 54862, bonusRollID = 54864, prerequisite = criteria, faction = 'Alliance',
			factionCounterpartID = 54861, resetInterval = resetIntervals.unknown, crowdWatch = true }),										-- Ivus the Decayed
		GetWorldBoss({worldQuestID = 54896, encounterID = 2329, trackingID = 54861, bonusRollID = 54865, prerequisite = criteria, faction = 'Horde', factionCounterpartID = 54862,
			resetInterval = resetIntervals.unknown, crowdWatch = true, zoneID = 62 }),														-- Ivus the Forest Lord
		GetWorldBoss({worldQuestID = 58705, trackingID = 58508, bonusRollID = 58512, encounterID = 2378, prerequisite = criteria }),		-- Grand Empress Shek'zara
		GetWorldBoss({worldQuestID = 55466, trackingID = 58510, bonusRollID = 58514, encounterID = 2381, prerequisite = criteria }),		-- Vuk'laz the Earthbreaker
		GetWorldBoss({worldQuestID = 56057, trackingID = 56058, bonusRollID = 56900, encounterID = 2362, prerequisite = criteria }),		-- Ulmath, the Soulbinder
		GetWorldBoss({worldQuestID = 56056, trackingID = 56055, bonusRollID = 56899, encounterID = 2363, prerequisite = criteria }),		-- Wekemara
	}
	if GetAccountExpansionLevel() >= category.expansion and
		(not WorldBossStatus.db.global.bossOptions.ignoredExpansions or
		not WorldBossStatus.db.global.bossOptions.ignoredExpansions[category.expansion]) then
		--WorldBossStatus.data[#WorldBossStatus.data +1] = category
		table.insert(WorldBossStatus.data, category)
	end
end

function AddBrokenIsles()
	local category = {}
	local criteria = {
		['Alliance'] = 43341,
		['Horde'] = 43341
	}
	local kosumothCriteria = {
		['Alliance'] = 43761,
		['Horde'] = 43761
	}

	--category.name = EJ_GetInstanceInfo(822) -- Broken Isles
	category.name = _G["EXPANSION_NAME6"]
	category.title = category.name.." "..L["Bosses"]
	category.expansion = 6
	category.legacy = true
	category.bosses = {
		GetWorldBoss({encounterID = 1790, worldQuestID = 43512, trackingID = 44501, bonusRollID = 44896, prerequisite = criteria}), 	-- Ana-Mouz
		GetWorldBoss({encounterID = 1774, worldQuestID = 43193, trackingID = 44502, bonusRollID = 44897, prerequisite = criteria}), 	-- Calamir
		GetWorldBoss({encounterID = 1789, worldQuestID = 43448, prerequisite = criteria}), 	-- Drugon the Frostblood
		GetWorldBoss({encounterID = 1795, worldQuestID = 43985, prerequisite = criteria}), 	-- Flotsam
		GetWorldBoss({encounterID = 1770, worldQuestID = 42819, prerequisite = criteria}), 	-- Humongris
		GetWorldBoss({encounterID = 1769, worldQuestID = 43192, prerequisite = criteria}), 	-- Levantus
		GetWorldBoss({encounterID = 1783, worldQuestID = 43513, trackingID = 44507, bonusRollID = 44902, prerequisite = criteria}), 	-- Na'zak the Fiend
		GetWorldBoss({encounterID = 1749, worldQuestID = 42270, prerequisite = criteria}), 	-- Nithogg
		GetWorldBoss({encounterID = 1763, worldQuestID = 42779, prerequisite = criteria}), 	-- Shar'thos
		GetWorldBoss({encounterID = 1756, worldQuestID = 42269, prerequisite = criteria}), 	-- The Soultakers
		GetWorldBoss({encounterID = 1796, worldQuestID = 44287, trackingID = 44511, bonusRollID = 44906, prerequisite = criteria}),		-- Withered'Jim
		GetWorldBoss({encounterID = 1956, worldQuestID = 47061, prerequisite = criteria}), 	-- Apocron
		GetWorldBoss({encounterID = 1883, worldQuestID = 46947, prerequisite = criteria}), 	-- Brutallus
		GetWorldBoss({encounterID = 1884, worldQuestID = 46948, prerequisite = criteria}), 	-- Malificus
		GetWorldBoss({encounterID = 1885, worldQuestID = 46945, prerequisite = criteria}), 	-- Si'vash
		GetWorldBoss({name = 'Kosumoth', worldQuestID = 43798, trackingID = 45479, prerequisite = kosumothCriteria})		-- Kosumoth
	}

	if GetAccountExpansionLevel() >= category.expansion and
		(not WorldBossStatus.db.global.bossOptions.ignoredExpansions or
		not WorldBossStatus.db.global.bossOptions.ignoredExpansions[category.expansion]) then
		--WorldBossStatus.data[#WorldBossStatus.data +1] = category
		table.insert(WorldBossStatus.data, category)
	end
end

function AddDraenor()
	local category = {}
	local criteria = {
		level = 35
	}

	category.name = EJ_GetInstanceInfo(557)	-- Draenor
	category.title = category.name.." "..L["Bosses"]
	category.expansion = 5
	category.legacy = true
	category.bosses = {
		GetWorldBoss({encounterID = 1452, trackingID = 39380, bonusRollID = 33069, zoneID = 534, prerequisite = criteria}),	-- Supreme Lord Kazzak
		GetWorldBoss({encounterID = 1262, trackingID = 37464, bonusRollID = 37672, zoneID = 542, prerequisite = criteria}),	-- Rukhmar
		GetWorldBoss({encounterID = 1211, trackingID = 37462, bonusRollID = 37675, zoneID = 543, prerequisite = criteria}),	-- Tarlna the Ageless
		GetWorldBoss({encounterID = 1291, trackingID = 37460, bonusRollID = 37673, zoneID = 543, prerequisite = criteria})	-- Drov the Ruiner
	}

	if GetAccountExpansionLevel() >= category.expansion and
		(not WorldBossStatus.db.global.bossOptions.ignoredExpansions or
		not WorldBossStatus.db.global.bossOptions.ignoredExpansions[category.expansion]) then
		--WorldBossStatus.data[#WorldBossStatus.data +1] = category
		table.insert(WorldBossStatus.data, category)
	end
end

function AddPanderia()
	local category = {}
	local criteria = {
		level = 35
	}

	category.name = EJ_GetInstanceInfo(322)	-- Panderia
	category.title = category.name.." "..L["Bosses"]
	category.expansion = 4
	category.legacy = true
	category.bosses = {
		GetWorldBoss({encounterID = 861, trackingID = 33118, bonusRollID = 33225, zoneID = 554, prerequisite = criteria }),				-- Ordos
		GetWorldBoss({ name = L["The Celestials"], trackingID = 33117, bonusRollID = 33226, zoneID = 554, prerequisite = criteria }),	-- The Celestials
		GetWorldBoss({encounterID = 826, trackingID = 32519, bonusRollID = 32922, zoneID = 507, prerequisite = criteria}),				-- Oondasta
		GetWorldBoss({encounterID = 814, trackingID = 33109, bonusRollID = 32919, zoneID = 504, prerequisite = criteria}),				-- Nalak
		GetWorldBoss({encounterID = 725, trackingID = 32098, bonusRollID = 32923, zoneID = 376, prerequisite = criteria}),				-- Salyisis's Warband
		GetWorldBoss({encounterID = 691, trackingID = 32099, bonusRollID = 32924, zoneID = 379, prerequisite = criteria})				-- Sha of Anger
	}

	if GetAccountExpansionLevel() >= category.expansion and
		(not WorldBossStatus.db.global.bossOptions.ignoredExpansions or
		not WorldBossStatus.db.global.bossOptions.ignoredExpansions[category.expansion]) then
		table.insert(WorldBossStatus.data, category)
	end
end

function WorldBossStatus:GetNextReset()
	local reset = {}

	reset[resetIntervals.daily] = time() + GetQuestResetTime()
	reset[resetIntervals.weekly] = GetWeeklyQuestResetTime()
	reset[resetIntervals.unknown] = -1

	return reset
end

function WorldBossStatus:GetLastReset()
	local reset = {}

	reset[resetIntervals.daily] = time() + GetQuestResetTime() - 86400
	reset[resetIntervals.weekly] = GetWeeklyQuestResetTime() - 604800
	reset[resetIntervals.unknown] = -1

	return reset
end

function WorldBossStatus:GetBossResetInfo(boss)
	local nextReset, interval

	if boss.resetInterval == resetIntervals.daily then
		nextReset = time() + GetQuestResetTime()
		interval = 86400
	elseif boss.resetInterval == resetIntervals.weekly then
		nextReset = GetWeeklyQuestResetTime()
		interval = 604800
	else
		nextReset = nil
		interval = nil
	end

	return nextReset, interval
end

function WorldBossStatus:GetBossData(update)
	if update or WorldBossStatus.data == nil then
		WorldBossStatus.data = {}

		AddHoliday()
		AddShadowlands()
		AddZandalarAndKulTiras()
		AddBrokenIsles()
		AddDraenor()
		AddPanderia()

		FlagActiveBosses()
	end

	return WorldBossStatus.data
end
