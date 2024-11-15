local addonName, addon = ...

LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceEvent-3.0', 'AceTimer-3.0')

local L = LibStub('AceLocale-3.0'):GetLocale(addonName)
local LBB = LibStub('LibBabble-Boss-3.0'):GetUnstrictLookupTable()
local LBZ = LibStub('LibBabble-SubZone-3.0'):GetUnstrictLookupTable()

local qtip = LibStub('LibQTip-1.0')

local TOOLTIP_SEPARATOR     = { 1, 1, 1, 1, 0.5 }

local COLOR_DUNGEON         = { 1, 1, 0, 1 }
local COLOR_CURRENT_ZONE    = { 0, 1, 0, 1 }
local COLOR_COMMENT         = { 0, 1, 0, 1 }
local COLOR_KILLED         = { 1, 0, 0, 1 }

local COLOR_ITEM_TOOLTIP            = { 1, 1, 1 }
local COLOR_ITEM_TOOLTIP_SOURCE     = { 1, 1, 0 }
local COLOR_ITEM_TOOLTIP_SOURCE_2L  = { 1, 1, 0, 0, 1, 0 }

local rarityEnabled, TomTomEnabled, covenant

local debugEnabled = 0

function addon:OnInitialize()
    self.db = LibStub('AceDB-3.0'):New(addonName .. 'DB', {
        profile = {
            hide_dungeon = false,
            hide_raid = false,
            hide_world = false,
			hide_holiday = false,
			hide_rare = false,
			hide_garrisoninvasion = false,
			hide_summoned = false,
			hide_warfront = false,
			hide_bfaassault = false,
			hide_korthiaassault = false,
			hide_horrificvision = false,
			hide_expeditions = false,
			hide_vendor = false,
			hide_quest = false,
			hide_paragon = false,
			hide_zone = false,
			hide_slcovenant = false,
			hide_treasure = false,
			hide_profession = false,
			hide_event = false,
			hide_slprotoformsynthesis = false,
			
			hide_classic = false,
			hide_bc = false,
			hide_wotlk = false,
			hide_cata = false,
			hide_mop = false,
			hide_wod = false,
			hide_legion = false,
			hide_bfa = false,
			hide_sl = false,
			hide_df = false,
			hide_tww = false,
			
			alreadyrun = false,
			
			mountname = false,
			verbosemode = false,
			
			rarity = {
                hide = false,
            },
			
			tomtom = {
				hide = false,
			},

            minimap = {
                hide = false,
            },
        },
    }, true)
	
    self.ldb = LibStub('LibDataBroker-1.1'):NewDataObject(addonName, {
        type = 'launcher',
        icon = 'Interface\\ICONS\\ABILITY_MOUNT_GOLDENGRYPHON',
        label = 'Mount Collector',
        OnEnter = function(...)
            self:ShowTooltip(...)
        end,
        OnLeave = function()
        end,
        OnClick = function(obj, button)
			if button == 'RightButton' then
                Settings.OpenToCategory(addonName)
            elseif self.ac then
                if AltCraftFrame:IsShown() and AltCraftMDLTabFrame:IsShown() then
                    AltCraftFrame:Hide()
                else
                    AltCraftFrame:Show()
                    AltCraftFrame:OnSelectTab(self.acTabNum)
                end
            end
        end,
    })

    self.icon = LibStub('LibDBIcon-1.0')
    self.icon:Register(addonName, self.ldb, self.db.profile.minimap)

    self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED', function(...)
        addon:OnCombatEvent(...)
    end)

    self:RegisterEvent('PLAYER_LOGIN', function(...)
        if not MountJournal_OnLoad then
            UIParentLoadAddOn('Blizzard_Collections')
        end
    end)

    GameTooltip:HookScript('OnTooltipCleared', function(self)
        addon:OnGameTooltipCleared(self)
    end)

    LibStub('AceConfig-3.0'):RegisterOptionsTable(addonName, self:GetOptions())
    LibStub('AceConfigDialog-3.0'):AddToBlizOptions(addonName, addonName, nil)

    self.trackNpc = {}

    local itemId, itemData
    for itemId, itemData in pairs(MDL_DB_MOUNTS) do
        GetItemInfo(itemId)

        local itemSource
        for _, itemSource in pairs(itemData.from) do
            if itemSource.npc_id then
                self:GetNpcName(itemSource.npc_id)

                if itemSource.type == 'raid' or (itemSource.type == 'dungeon' and itemSource.subtype) and not itemSource.dont_autoupdate then
                    self.trackNpc[itemSource.npc_id] = 1
                end
            end
        end
    end

    self:ScheduleTimer(function()
        self.ac = LibStub('AceAddon-3.0'):GetAddon('AltCraft', true)
        if self.ac then
            self.acTabNum = AltCraftFrame:AddTab(AltCraftMDLTabFrame, 'Mount Collector')
        end
    end, 0.5)
end

local function GetUldumAssault ()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(1527)
    if textures then
		if textures[1] then
			if textures[1].fileDataIDs[1] == 3165083 then
				return "AQR" -- left
			elseif textures[1].fileDataIDs[1] == 3165092 then
				return "EMP" -- middle
			elseif textures[1].fileDataIDs[1] == 3165098 then
				return "AMA" -- right
			else 
				return "NA"
			end
		else 
			return "NA"
		end
    else
		return "NA"
	end
end

local function GetValeAssault()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(1530)
    if textures then
		if textures[1] then
			if textures[1].fileDataIDs[1] == 3155826 then
				return "MAN" -- left
			elseif textures[1].fileDataIDs[1] == 3155832 then
				return "MOG" -- middle
			elseif textures[1].fileDataIDs[1] == 3155841 then
				return "EMP" -- right
			else 
				return "NA"
			end
		else 
			return "NA"
		end
    else
		return "NA"
	end
end

local function IsTimewalking()
    local date = C_DateAndTime.GetCurrentCalendarTime()
	local tw = false
	for index=1,C_Calendar.GetNumDayEvents(0,date.monthDay) do
        local event = C_Calendar.GetHolidayInfo(0,date.monthDay,index)
		if event ~= nil and event.name == L["misc_timewalking"] then
			tw = true
		end
    end
	return tw
end

local function GetCovenant()
	local covenantID = C_Covenants.GetActiveCovenantID()
	return covenantID
end

function addon:GetNpcName(npcId)
    local tooltip = self.scanTooltip

    if not tooltip then
        tooltip = CreateFrame('GameTooltip', 'MDL_SCAN_TOOLTIP', UIParent, 'GameTooltipTemplate')
        self.scanTooltip = tooltip
    end

    tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
    tooltip:SetHyperlink(string.format('unit:Creature-0-0-0-0-%d:0000000000', npcId))

    local npcName = _G[tooltip:GetName() .. 'TextLeft1']:GetText()

    if not npcName then
        npcName = string.format('npc#%d', npcId)
    end

    return npcName
end

function addon:OnCombatEvent(event, timeStamp, logEvent, hideCaster,
    sourceGuid, sourceName, sourceFlags, sourceFlags2,
    destGuid, destName, destFlags, destFlags2, ...
)
    if destGuid then
        local type, id = UnitInfoFromGuid(destGuid)

        if type == 'Creature' or type == 'Vehicle' then
            if (logEvent == 'UNIT_DIED' or logEvent == 'PARTY_KILL') and self.trackNpc[id] then
                RequestRaidInfo()

                self:ScheduleTimer(function()
                    RequestRaidInfo()
                end, 5)
            end
        end
    end
end

function addon:ShowTooltip(anchor)
    if not (InCombatLockdown() or (self.tooltip and self.tooltip:IsShown())) then
        if not (qtip:IsAcquired(addonName) and self.tooltip) then
            self.tooltip = qtip:Acquire(addonName, 5, 'LEFT', 'LEFT', 'LEFT', 'RIGHT')

            self.tooltip.OnRelease = function()
                self.tooltip = nil
            end
        end

        if anchor then
            self.tooltip:SmartAnchorTo(anchor)
            self.tooltip:SetAutoHideDelay(0.05, anchor)
        end

        self:UpdateTooltip(self.tooltip)
    end
end

-- Returns a list of faction data compatible with the deprecated GetFactionInfo and GetFactionInfoByID
local GetFactionInfoWrapper = function(factionData)
    if factionData then
        return factionData.name, factionData.description, factionData.currentStanding, 0, 0, 0, factionData.atWarWith, factionData.canToggleAtWar, factionData.isHeader, factionData.isCollapsed, false, factionData.isWatched, factionData.isChild, factionData.factionID, factionData.hasBonusRepGain, false;
    end
    return nil;
end

-- Wrapper function for C_Reputation.GetFactionDataByID for the deprecated GetFactionInfoByID
local GetFactionInfoByID = GetFactionInfoByID or function(factionId)
    return GetFactionInfoWrapper(C_Reputation.GetFactionDataByID(factionId));
end

function addon:GetItemSourceInfo(itemSource)
    local zoneName, rarity
	
	local mapInfo = C_Map.GetMapInfo(itemSource.zone_id);
	if ( mapInfo ) then
		zoneName = mapInfo.name
	elseif itemSource.type == 'expeditions' or itemSource.subtype == 'horrificvision' or itemSource.subtype == 'timewalking' or itemSource.type == 'slcovenant' or itemSource.type == 'profession' or itemSource.type == 'slprotoformsynthesis' then
		zoneName = "HIDDEN"
	elseif MDL_DB_ZONES[itemSource.zone_id] and MDL_DB_ZONES[itemSource.zone_id].raid then
		zoneName = MDL_DB_ZONES[itemSource.zone_id].raid
	end

    local npcName
    if itemSource.type == 'korthiaassault' then
		if itemSource.npc_id == 0 then
			npcName = "盟约突袭"
		elseif itemSource.npc_id == -1 then
			npcName = "格里恩突袭"
		elseif itemSource.npc_id == -2 then
			npcName = "温西尔突袭"
		elseif itemSource.npc_id == -3 then
			npcName = "法夜突袭"
		elseif itemSource.npc_id == -4 then
			npcName = "通灵领主突袭"
		else 
			npcName = self:GetNpcName(itemSource.npc_id)
		end
	elseif itemSource.type == 'profession' then
		if itemSource.npc_id == 0 then
			npcName = "考古学"
		else 
			npcName = "未知"
		end
	elseif itemSource.type == 'zone' then
        npcName = "随机"
	elseif itemSource.type == 'slprotoformsynthesis' then
        npcName = "原生体合成"
	elseif itemSource.type == 'expeditions' then
        npcName = "奖励"
	elseif itemSource.type == 'slcovenant' then
        if itemSource.npc_id == -1 then
			npcName = "盟约冒险"
        elseif itemSource.npc_id == -2 then
			npcName = "盟约宝箱"
        elseif itemSource.npc_id == -3 then
			npcName = "战役任务"
        elseif itemSource.npc_id == -4 then
			if covenant == 1 then
				npcName = "晋升之路"
			elseif covenant == 2 then
				npcName = "堕罪堡"
			elseif covenant == 3 then
				npcName = "女王的温室"
			elseif covenant == 4 then
				npcName = "憎恶工厂"
			else 
				npcName = "选择盟约前不可用"
			end
        elseif itemSource.npc_id == -5 then
			npcName = "名望商人"
        elseif itemSource.npc_id == -6 then
			npcName = "镜子旅行网络"
		else
			npcName = "未知"
		end
	elseif itemSource.subtype == 'timewalking' then
        npcName = "时空漫游首领"
    elseif itemSource.encounter_id then
		local name, description, bossID, rootSectionID, link, journalInstanceID, dungeonEncounterID, instanceID = EJ_GetEncounterInfo(itemSource.encounter_id)
		npcName = name
	elseif itemSource.type == 'quest' then
        npcName = "任务"
	elseif itemSource.customnpcName then
		npcName = itemSource.customnpcName
	elseif itemSource.type == 'special' and itemSource.subtype ~= 'summoned' and itemSource.subtype ~= 'warfront' and itemSource.subtype ~= 'bfaassault' and itemSource.subtype ~= 'horrificvision' then
        npcName = L['special_' .. itemSource.subtype]
	elseif itemSource.type == 'event' then
        if itemSource.npc_id == -1 then
			npcName = "散布圣光"
        elseif itemSource.npc_id == -2 then
			npcName = "主机觉醒"
		end
	else
        npcName = self:GetNpcName(itemSource.npc_id)
    end
	
    local comment
    if itemSource.subtype and itemSource.type ~= 'special' then
        comment = L['type_' .. itemSource.subtype]
    end
    if itemSource.cond then
        comment = (comment and (comment .. ' + ') or '') .. L['cond_' .. itemSource.cond]
    end
	if itemSource.repid then
		if itemSource.reprequired then
			local repnum
			local name, description, standingID = GetFactionInfoByID(itemSource.repid)
			if itemSource.replevel then
				repnum = itemSource.replevel
			else
				repnum = 8
			end
			
			numrep = tonumber(repnum)
			
			if standingID == nil then
				--Faction undiscovered
			elseif standingID >= (numrep) then
				--Meeting Rep Requirement, hide message
			else
				--Need to gain more rep, show requirement
				comment = (comment and (comment .. ' ') or '') .. name .. ": " .. L["repl_" .. standingID] .. " / " .. L["repl_" .. numrep]
			end
		end
    end
	if itemSource.renownid then
		if itemSource.renownrequired then
			local renownnum
			--local level = C_MajorFactions.GetCurrentRenownLevel(itemSource.renownid)
			local data = C_MajorFactions.GetMajorFactionData(itemSource.renownid)
			if itemSource.renownlevel then
				renownnum = itemSource.renownlevel
			else
				renownnum = 30
			end
			
			numrenown = tonumber(renownnum)
			
			if data.renownLevel == nil then
				--Faction undiscovered
			elseif data.renownLevel >= (numrenown) then
				--Meeting Renown Requirement, hide message
			else
				--Need to gain more rep, show requirement
				comment = (comment and (comment .. ' ') or '') .. data.name .. ": " .. data.renownLevel  .. " / " .. numrenown .. L["cond_renown"]
			end
		end
    end
	local tmpCost = 0
	if itemSource.mount_id then
		local startPos, endPos, startPos2, endPos2, tmpstr
		local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID, uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview = C_MountJournal.GetMountInfoExtraByID(itemSource.mount_id)
		tmpstr = ''
		--Search for cost
		startPos, endPos = string.find(source, 'Cost:')
		if startPos  == nil then
		else
			tmpCost = 1
			local cost = strsub(source, startPos)
			startPos2, endPos2 = string.find(cost, '|n')
			if startPos2 == nil then
				tmpstr = cost
			else
				tmpstr = strsub(cost, 1, startPos2 - 1)
			end
		end
		--End of cost section
		
		--Search for Quest name
		startPos, endPos = string.find(source, 'Quest:')
		if startPos  == nil then
		else
			local quest = strsub(source, startPos)
			startPos2, endPos2 = string.find(quest, '|n')
			if startPos2 == nil then
				tmpstr = quest
			else
				tmpstr = strsub(quest, 1, startPos2 - 1)
			end
		end
		--End of quest section
		
		--Add string to comment
		comment = (comment and (comment .. '   ') or '') .. tmpstr
	end
	if itemSource.cost then
		if tmpCost == 0 then
			local itemcost
			if itemSource.repdiscount == 1 then
				itemcost = itemSource.cost * 0.8
			else
				itemcost = itemSource.cost
			end
			if itemSource.currency then
				comment = (comment and (comment .. '   ') or '') .. L["title_cost"] .. BreakUpLargeNumbers(itemcost) .. L["curr_" .. itemSource.currency]
			else
				comment = (comment and (comment .. '   ') or '') .. L["title_cost"] .. BreakUpLargeNumbers(itemcost) .. L["curr_gold"]
			end
		end
    end
	if (rarityEnabled and self.db.profile.rarity.hide == false) and not (itemSource.type == 'vendor') then
		local lookupname
		
		if itemSource.rarityname ~= nil then
			lookupname = itemSource.rarityname
		else
			lookupname = itemSource.itemname
		end
		
		for index, rarityTable in pairs(Rarity.db.profile.groups.mounts) do
			if index ~= nil then
				if index == lookupname then
					local attempts = 0
					local chance = 0
					local perc = 0
					
					if rarityTable.attempts ~= nil then
						attempts = rarityTable.attempts
					end

					chance = rarityTable.chance
					perc = BreakUpLargeNumbers(rarityChance(rarityTable))
					
					if chance == nil then
						chance = "Unknown"
					end
								
					rarity = "Attempts: " .. attempts .. "/" .. chance .. " (" .. perc .. "%) "
				end
			end
		end
	end
    local raidSaveZone
	if itemSource.instanceid then
		raidSaveZone = GetRealZoneText(itemSource.instanceid)
	else
		raidSaveZone = zoneName
	end
	local raidSaveBoss = npcName
    return zoneName, npcName, comment, raidSaveZone, raidSaveBoss, rarity
end

function addon:GetPlayerItems()
    local playerItems, mountIds = {}, {}

    local allMounts = C_MountJournal.GetMountIDs()

    local mountId
    for _, mountId in pairs(allMounts) do
        local _, spellId, _, _, _, _, _, _, _, _, isCollected = C_MountJournal.GetMountInfoByID(mountId)

        mountIds[spellId] = mountId

        if isCollected then
            playerItems[spellId] = 1
        end
    end

    return playerItems, mountIds
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function addon:BuildTooltipData()
    local i, j
    local playerItems, mountIds = self:GetPlayerItems()

    local savedRaids = {}
    for i = 1, GetNumSavedInstances() do
        local raidName, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, numBosses, encounterProgress = GetSavedInstanceInfo(i)
		if locked and not extended then
            local numRemains = 0
			local diff
			if difficulty == 3 then
				diff = 14
			elseif difficulty == 4 then
				diff = 14
			elseif difficulty == 9 then
				diff = 14
			elseif difficulty == 6 then
				diff = 15
			elseif difficulty == 5 then
				diff = 15
			else
				diff = difficulty
			end
			
			local rname
			if not isRaid then
				rname = "dungeon-" .. raidName .. "-" .. diff
			else
				rname = "raid-" .. raidName .. "-" .. diff
			end
			
			savedRaids[rname] = {}

            for j = 1, numBosses do
                local bossName, _, killed = GetSavedInstanceEncounterInfo(i, j)
                if killed then
					if bossName == "Lord Harlan Sweete" then
						bossName = "Harlan Sweete"
					end
					savedRaids[rname][bossName] = 1
                else
                    numRemains = numRemains + 1
                end
            end
			
			if encounterProgress == numBosses then
				savedRaids[rname]['complete'] = 1
			else
				savedRaids[rname]['complete'] = 0
			end
        end
    end
	
    local playerFaction = string.lower(UnitFactionGroup('player'))
    local playerLevel = UnitLevel('player')
    local playerZoneName = GetRealZoneText()

    local dungeonItems, raidItems, worldItems, rareItems, summonedItems, warfrontItems, bfaassaultItems, korthiaassaultItems, horrificvisionItems, expeditionsItems, treasureItems, slcovenantItems, zoneItems, vendorItems, paragonItems, garrisoninvasionItems, holidayItems, professionItems, slprotoformsynthesisItems, questItems, eventItems = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

	local bfaassaultuldum = GetUldumAssault()
	local bfaassaultvale = GetValeAssault()
	local timewalking = IsTimewalking()
	covenant = GetCovenant()

    local itemId, itemData
    for itemId, itemData in pairs(MDL_DB_MOUNTS) do
		if (not playerItems[itemData.spell_id] and (not itemData.faction or itemData.faction == playerFaction)) or debugEnabled == 1 then
			local itemName, itemLink = GetItemInfo(itemId)
            local dispName = (itemLink and itemLink:gsub('%[', ''):gsub('%]', ''):sub(1)) or itemName or string.format('item#%d', itemId)
            local itemSource
			if self.db.profile.verbosemode then
				print(itemName, itemId, itemData.spell_id)
			end
            for _, itemSource in pairs(itemData.from) do
                if not itemSource.faction or itemSource.faction == playerFaction or debugEnabled == 1 then
                    if itemSource.level <= playerLevel then
                        local zoneName, npcName, comment, raidSaveZone, raidSaveBoss, rarity, encounter_id = self:GetItemSourceInfo(itemSource)

                        local add = 0
						local lockout = 0
						local killed = 0
											
						if itemSource.type == 'dungeon' then
							if itemSource.subtype == "heroic" then
								if savedRaids["dungeon-"..raidSaveZone .. "-23"] then
									lockout = 1
									if savedRaids["dungeon-"..raidSaveZone .. "-23"]['complete'] == 1 then
										add = 0
									elseif not savedRaids["dungeon-"..raidSaveZone .. "-23"][raidSaveBoss] then
										add = 1
									end
								end
								
								if savedRaids["dungeon-"..raidSaveZone .. "-2"] then
									lockout = 1
									 if savedRaids["dungeon-"..raidSaveZone .. "-2"]['complete'] == 1 then
										add = 0
									elseif not savedRaids["dungeon-"..raidSaveZone .. "-2"][raidSaveBoss] then
										add = 1
									end
								end
								
								if lockout == 0 then
									add = 1
								end
							elseif itemSource.subtype == "mythic" then
								if savedRaids["dungeon-"..raidSaveZone .. "-23"] then
									if savedRaids["dungeon-"..raidSaveZone .. "-23"]['complete'] == 1 then
										add = 0
									elseif not savedRaids["dungeon-"..raidSaveZone .. "-23"][raidSaveBoss] then
										add = 1
									end
								else
									add = 1
								end
							else
								add = 1
							end
							if add == 0 then
								killed = 1
							end
						elseif itemSource.type == 'raid' then
							if itemSource.subtype == 'mythic' then
								if savedRaids["raid-"..raidSaveZone .. "-16"] then
									if savedRaids["raid-"..raidSaveZone .. "-16"]['complete'] == 1 then
										add = 0
									elseif not savedRaids["raid-"..raidSaveZone .. "-16"][raidSaveBoss] then
										add = 1
									end
								else
									add = 1
								end
							elseif itemSource.subtype == 'heroic' then
								if savedRaids["raid-"..raidSaveZone .. "-16"] then
									lockout = 1
									if savedRaids["raid-"..raidSaveZone .. "-16"]['complete'] == 1 then
										add = 0
									elseif (not savedRaids["raid-"..raidSaveZone .. "-16"][raidSaveBoss]) then
										add = 1
									end
								end
								
								if savedRaids["raid-"..raidSaveZone .. "-15"] then
									lockout = 1
									if savedRaids["raid-"..raidSaveZone .. "-15"]['complete'] == 1 then
										add = 0
									elseif (not savedRaids["raid-"..raidSaveZone .. "-15"][raidSaveBoss]) then
										add = 1
									end
								end
								
								if lockout == 0 then
									add = 1
								end
							else
								if savedRaids["raid-"..raidSaveZone .. "-16"] then
									lockout = 1
									if savedRaids["raid-"..raidSaveZone .. "-16"]['complete'] == 1 then
										add = 0
									elseif (not savedRaids["raid-"..raidSaveZone .. "-16"][raidSaveBoss]) then
										add = 1
									end
								end
								
								if savedRaids["raid-"..raidSaveZone .. "-15"] then
									lockout = 1
									if savedRaids["raid-"..raidSaveZone .. "-15"]['complete'] == 1 then
										add = 0
									elseif (not savedRaids["raid-"..raidSaveZone .. "-15"][raidSaveBoss]) then
										add = 1
									end
								end
								
								if savedRaids["raid-"..raidSaveZone .. "-14"] then
									lockout = 1
									if savedRaids["raid-"..raidSaveZone .. "-14"]['complete'] == 1 then
										add = 0
									elseif (not savedRaids["raid-"..raidSaveZone .. "-14"][raidSaveBoss]) then
										add = 1
									end
								end
								
								if lockout == 0 then
									add = 1
								end
							end
							if add == 0 then
								killed = 1
							end
						elseif itemSource.type == 'world' and itemSource.subtype == 'wq' and itemSource.quest_id then
							add = C_TaskQuest.IsActive(itemSource.quest_id)	
						elseif itemSource.type == 'korthiaassault' and itemSource.quest_id then
							add = C_TaskQuest.IsActive(itemSource.quest_id)	
						elseif itemSource.quest_id then
							add = not C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
							killed = C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
						elseif (itemSource.subtype == 'summoned' or itemSource.subtype == 'warfront' or itemSource.subtype == 'horrificvision' or itemSource.type == 'expeditions' or itemSource.type == 'paragon' or itemSource.type == 'slcovenant' or itemSource.type == 'treasure' or itemSource.type == 'slprotoformsynthesis') then
								add = 1
						elseif itemSource.subtype == 'bfaassault' then
							if bfaassaultuldum == itemSource.bfaassault then
								add = not C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
								killed = C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
							elseif bfaassaultvale == itemSource.bfaassault then
								add = not C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
								killed = C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
							elseif not itemSource.bfaassault then
								add = not C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
								killed = C_QuestLog.IsQuestFlaggedCompleted(itemSource.quest_id)
							end
						elseif itemSource.type == 'world' then
							add = 1
						elseif itemSource.type == 'rare' then
							add = 1
						elseif itemSource.type == 'vendor' then
							add = 1
						elseif itemSource.type == 'quest' then
							add = 1
						elseif itemSource.type == 'profession' then
							add = 1
						elseif itemSource.type == 'zone' then
							add = 1
						elseif itemSource.type == 'event' then
							add = 1
						elseif itemSource.subtype == 'timewalking' and timewalking then
							add = 1
						elseif itemSource.subtype == 'timewalking' and not timewalking then
							add = 0
						else
							add = 1
						end
					
					if itemSource.expansion == 'classic' and self.db.profile.hide_classic then
						add = 0
					elseif itemSource.expansion == 'bc' and self.db.profile.hide_bc then
						add = 0
					elseif itemSource.expansion == 'wotlk' and self.db.profile.hide_wotlk then
						add = 0
					elseif itemSource.expansion == 'cata' and self.db.profile.hide_cata then
						add = 0
					elseif itemSource.expansion == 'mop' and self.db.profile.hide_mop then
						add = 0
					elseif itemSource.expansion == 'wod' and self.db.profile.hide_wod then
						add = 0
					elseif itemSource.expansion == 'legion' and self.db.profile.hide_legion then
						add = 0
					elseif itemSource.expansion == 'bfa' and self.db.profile.hide_bfa then
						add = 0
					elseif itemSource.expansion == 'sl' and self.db.profile.hide_sl then
						add = 0
					elseif itemSource.expansion == 'df' and self.db.profile.hide_df then
						add = 0
					elseif itemSource.expansion == 'tww' and self.db.profile.hide_tww then
						add = 0
					end
					
					if itemSource.covenant then
						if not (itemSource.covenant == covenant) then
							add = 0
						end
						if debugEnabled == 1 then
							add = 1
						end
					end
					
					if itemSource.type == 'slcovenant' and itemSource.npc_id == -4 and covenant == 0 then
						add = 0
					end

					if add == 1 or add == true or (killed == 1 and not self.db.profile.alreadyrun) then
						local zoneData = {
							items = {}, sort = itemSource.for_sort,
							isCurrent = playerZoneName == (MDL_DB_ZONES[itemSource.zone_id] and MDL_DB_ZONES[itemSource.zone_id].raid or zoneName),
						}
						if itemSource.type == 'dungeon' then
							if dungeonItems[zoneName] then
								zoneData = dungeonItems[zoneName]
							else
								dungeonItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'raid' then
							if raidItems[zoneName] then
								zoneData = raidItems[zoneName]
							else
								raidItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'world' then
							if worldItems[zoneName] then
								zoneData = worldItems[zoneName]
							else
								worldItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'rare' then
							if rareItems[zoneName] then
								zoneData = rareItems[zoneName]
							else
								rareItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'special' and itemSource.subtype == 'garrison_invasion' then
							if garrisoninvasionItems[zoneName] then
								zoneData = garrisoninvasionItems[zoneName]
							else
								garrisoninvasionItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'special' and itemSource.subtype == 'warfront' then
							if warfrontItems[zoneName] then
								zoneData = warfrontItems[zoneName]
							else
								warfrontItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'special' and itemSource.subtype == 'horrificvision' then
							if horrificvisionItems[zoneName] then
								zoneData = horrificvisionItems[zoneName]
							else
								horrificvisionItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'special' and itemSource.subtype == 'bfaassault' then
							if bfaassaultItems[zoneName] then
								zoneData = bfaassaultItems[zoneName]
							else
								bfaassaultItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'korthiaassault' then
							if korthiaassaultItems[zoneName] then
								zoneData = korthiaassaultItems[zoneName]
							else
								korthiaassaultItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'event' then
							if eventItems[zoneName] then
								zoneData = eventItems[zoneName]
							else
								eventItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'profession' then
							if professionItems[zoneName] then
								zoneData = professionItems[zoneName]
							else
								professionItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'summoned' then
							if summonedItems[zoneName] then
								zoneData = summonedItems[zoneName]
							else
								summonedItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'zone' then
							if zoneItems[zoneName] then
								zoneData = zoneItems[zoneName]
							else
								zoneItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'expeditions' then
							if expeditionsItems[zoneName] then
								zoneData = expeditionsItems[zoneName]
							else
								expeditionsItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'treasure' then
							if treasureItems[zoneName] then
								zoneData = treasureItems[zoneName]
							else
								treasureItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'slcovenant' then
							if slcovenantItems[zoneName] then
								zoneData = slcovenantItems[zoneName]
							else
								slcovenantItems[zoneName] = zoneData
							end					   
						elseif itemSource.type == 'vendor' then
							if vendorItems[zoneName] then
								zoneData = vendorItems[zoneName]
							else
								vendorItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'paragon' then
							if paragonItems[zoneName] then
								zoneData = paragonItems[zoneName]
							else
								paragonItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'holiday' then
							if holidayItems[zoneName] then
								zoneData = holidayItems[zoneName]
							else
								holidayItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'slprotoformsynthesis' then
							if slprotoformsynthesisItems[zoneName] then
								zoneData = slprotoformsynthesisItems[zoneName]
							else
								slprotoformsynthesisItems[zoneName] = zoneData
							end
						elseif itemSource.type == 'quest' then
							if questItems[zoneName] then
								zoneData = questItems[zoneName]
							else
								questItems[zoneName] = zoneData
							end
						end

						zoneData.sort = min(zoneData.sort, itemSource.for_sort)
						
						local npcData = zoneData.items[npcName] or { items = {}, sort = itemSource.for_sort }
						zoneData.items[npcName] = npcData

						npcData.sort = min(zoneData.sort, itemSource.for_sort)

						table.insert(npcData.items, { name = dispName, spellId = itemData.spell_id, mountId = mountIds[itemData.spell_id], comment = comment, rarity = rarity, continent = itemSource.continent, coordzone = itemSource.coordzone, coordx = itemSource.coordx, coordy = itemSource.coordy, killed = killed})
						end
                    end
                end
            end
        end
    end

    return {
        { items = holidayItems , title = 'holiday'  },
		{ items = dungeonItems, title = 'dungeon' },
        { items = raidItems  , title = 'raid'   },
        { items = worldItems , title = 'world'  },
        { items = rareItems , title = 'rare'  },
		{ items = summonedItems , title = 'summoned'  },
		{ items = warfrontItems , title = 'warfront'  },
		{ items = bfaassaultItems , title = 'bfaassault'  },
		{ items = korthiaassaultItems , title = 'korthiaassault'  },
		{ items = professionItems , title = 'profession'  },
		{ items = horrificvisionItems , title = 'horrificvision'  },
		{ items = expeditionsItems , title = 'expeditions'  },
		{ items = slcovenantItems , title = 'slcovenant'  },
		{ items = treasureItems , title = 'treasure'  },
		{ items = zoneItems , title = 'zone'  },
		{ items = vendorItems , title = 'vendor'  },
		{ items = paragonItems , title = 'paragon'  },
		{ items = garrisoninvasionItems , title = 'garrisoninvasion'  },
		{ items = slprotoformsynthesisItems , title = 'slprotoformsynthesis'  },
		{ items = questItems , title = 'quest'  },
		{ items = eventItems , title = 'event'  },
    }
end
function addon:BuildAltCraftList()

    local list, added = {}, {}

    local playerItems, mountIds = self:GetPlayerItems()
    local playerFaction = string.lower(UnitFactionGroup('player'))

    local itemId, itemData
    for itemId, itemData in pairs(MDL_DB_MOUNTS) do
        if (not playerItems[itemData.spell_id] and (not itemData.faction or itemData.faction == playerFaction)) or debugEnabled == 1 then
            local name, link, icon = table.s2k_select({ GetItemInfo(itemId) }, 1, 2, 10 )

            local itemSource
            for _, itemSource in pairs(itemData.from) do
                if not itemSource.faction or itemSource.faction == playerFaction or debugEnabled == 1 then
                    local zoneName, npcName, comment, rarity = self:GetItemSourceInfo(itemSource)

                    if added[itemId] then
                        table.insert(added[itemId].sources, {
                            zone    = zoneName,
                            source  = npcName,
                            comment = comment,
                            sort    = itemSource.for_sort,
							rarity = rarity,
                        })

                        table.sort(added[itemId].sources, function(a, b) return a.sort < b.sort end)

                        added[itemId].sort = added[itemId].sources[1].sort
                    else
                        added[itemId] = {
                            itemId      = itemId,
                            name        = name,
                            link        = link,
                            icon        = icon,
                            sort        = itemSource.for_sort,
                            sources     = {{
                                zone        = zoneName,
                                source      = npcName,
                                comment     = comment,
								rarity		= rarity,
                                sort        = itemSource.for_sort,
                            }},
                        }

                        table.insert(list, added[itemId])
                    end
                end
            end
        end
    end

    table.sort(list, function(a, b) return a.sort < b.sort end)

    return list
end

function print_table(node)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
			if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)
	
	for k,v in ipairs(output) do
		print(v)
	end
	
	return {
		output_str
	}
    --print(output_str)
end

function rarityChance(item)
	local attempts = 0
	if item.attempts then
		attempts = item.attempts
	end
	local dropChance = Rarity.Statistics.GetRealDropPercentage(item)
	local chance = 100 * (1 - math.pow(1 - dropChance, attempts))
	return chance
end

local function addTomTomWaypoint(mapID, coordx, coordy, name)
	if mapID ~= nil then
		if (TomTomEnabled) then
			TomTom:AddWaypoint(mapID, coordx/100, coordy/100, {
				title = name,
				persistent = nil,
				minimap = true,
				world = true
			})
		else
			C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(mapID, coordx/100, coordy/100))
		end
	end
end

function addon:UpdateTooltip(tooltip)
	tooltip:Clear()
	
	local loaded, finished
	loaded, finished = C_AddOns.IsAddOnLoaded("Rarity")
	rarityEnabled = loaded
	
	loaded, finished = C_AddOns.IsAddOnLoaded("TomTom")
	if (self.db.profile.tomtom.hide == false and loaded) then
		TomTomEnabled = true
	else
		TomTomEnabled = false
	end
	
    local lineNo, itemTable

    for _, itemTable in pairs(self:BuildTooltipData()) do
		if not table.s2k_is_empty(itemTable.items) then
            if lineNo then
                tooltip:AddSeparator(unpack(TOOLTIP_SEPARATOR))
            end

            if self.db.profile['hide_' .. itemTable.title] then
                lineNo = tooltip:AddLine()
                tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-PlusButton-Up:16|t' .. L['title_' .. itemTable.title], nil, nil, 4)

                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                    self.db.profile['hide_' .. itemTable.title] = false
                    self:UpdateTooltip(tooltip)
                end)
            else
                lineNo = tooltip:AddLine()
                tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-MinusButton-Up:16|t' .. L['title_' .. itemTable.title], nil, nil, 4)

                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                    self.db.profile['hide_' .. itemTable.title] = true
                    self:UpdateTooltip(tooltip)
                end)

                local firstSorted, firstName = {}

                for firstName in pairs(itemTable.items) do
                    table.insert(firstSorted, firstName)
                end

                table.sort(firstSorted, function(a, b)
                    if itemTable.items[a].isCurrent then
                        if itemTable.items[b].isCurrent then
                            return itemTable.items[a].sort < itemTable.items[b].sort
                        end
                        return true
                    end
                    if itemTable.items[b].isCurrent then
                        return false
                    end
                    return itemTable.items[a].sort < itemTable.items[b].sort
                end)

                for _, firstName in pairs(firstSorted) do
                    local firstData = itemTable.items[firstName]
                    local zoneColor = firstData.isCurrent and COLOR_CURRENT_ZONE or COLOR_DUNGEON

                    local secondSorted, secondName, titlePrinted = {}

                    for secondName in pairs(firstData.items) do
                        table.insert(secondSorted, secondName)
                    end

                    table.sort(secondSorted, function(a, b)
                        return firstData.items[a].sort < firstData.items[b].sort
                    end)
					
                    for _, secondName in pairs(secondSorted) do
                        local secondData = firstData.items[secondName]
						local continent
						
						if firstName == 'HIDDEN' then
							continent = 'HIDDEN'
						else
							continent = L["cont_" .. secondData.items[1].continent]
						end

                        if table.s2k_len(firstData.items) == 1 then
                            lineNo = tooltip:AddLine()
                            if continent == 'HIDDEN' then
								tooltip:SetCell(lineNo, 1, string.format('%s', secondName), nil, nil, 4)
							else
								tooltip:SetCell(lineNo, 1, string.format('%s / %s / %s', continent, firstName, secondName), nil, nil, 4)
							end
                            tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))
							tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
									addTomTomWaypoint(secondData.items[1].coordzone, secondData.items[1].coordx, secondData.items[1].coordy, secondName)
                            end)
                        else
							if not titlePrinted then
                                lineNo = tooltip:AddLine()
								if continent == 'HIDDEN' then
									if firstName == 'HIDDEN' then
										
									else
										tooltip:SetCell(lineNo, 1, string.format('%s', firstName), nil, nil, 4)
									end
								else
									tooltip:SetCell(lineNo, 1, string.format('%s / %s', continent, firstName), nil, nil, 4)
								end
                                tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))

                                titlePrinted = 1
                            end

                            lineNo = tooltip:AddLine()

                            tooltip:SetCell(lineNo, 2, secondName, nil, nil, 3)
                            tooltip:SetCellTextColor(lineNo, 2, unpack(zoneColor))
							tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
									addTomTomWaypoint(secondData.items[1].coordzone, secondData.items[1].coordx, secondData.items[1].coordy, secondName)
							end)
                        end

                        local itemData
                        for _, itemData in pairs(secondData.items) do
                            lineNo = tooltip:AddLine()

							local displayname
							if self.db.profile.mountname then
								displayname = itemData.name
							else
								displayname = C_Spell.GetSpellLink(itemData.spellId)
							end

                            if itemData.comment then
                                if itemData.killed == 1 then
									tooltip:SetCell(lineNo, 3, string.format("%-40s", displayname .. " 击杀"))
									tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_KILLED))
								else
									tooltip:SetCell(lineNo, 3, string.format("%-40s", displayname))
								end

                                tooltip:SetCell(lineNo, 4, itemData.comment)
								tooltip:SetCellTextColor(lineNo, 4, unpack(COLOR_COMMENT))
                            else
								if itemData.killed == 1 then
									tooltip:SetCell(lineNo, 3, string.format("%-40s", displayname .. " 击杀"), nil, nil, 2)
									tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_KILLED))
								else
									tooltip:SetCell(lineNo, 3, string.format("%-40s", displayname), nil, nil, 2)
								end
                            end
							
							if itemData.rarity then
								tooltip:SetCell(lineNo, 5, itemData.rarity)
								tooltip:SetCellTextColor(lineNo, 5, unpack(zoneColor))
							end
							
                            if itemData.mountId then
                                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                                    self:OpenMountJournal(itemData.mountId, itemData.spellId)
                                end)
                            end
                        end
                    end
                end
            end
        end
    end

    tooltip:AddLine("")

    tooltip:UpdateScrolling()
    tooltip:Show()
end

function addon:OpenMountJournal(mountId, spellId)
    if not CollectionsJournal:IsShown() then
        ToggleCollectionsJournal()
    end

    CollectionsJournal_SetTab(CollectionsJournal, 1)

    if mountId then
        MountJournal.selectedMountID = mountId
        MountJournal.selectedSpellID = spellId

        --MountJournal_HideMountDropdown()
        MountJournal_UpdateMountList()
        MountJournal_UpdateMountDisplay()
    else
        MountJournal_Select(1)
    end
end

function addon:OnGameTooltipCleared(tooltip)
end