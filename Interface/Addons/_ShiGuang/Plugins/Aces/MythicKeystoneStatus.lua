--## Version: 1.7.2
local MythicKeystoneStatus = LibStub("AceAddon-3.0"):NewAddon("MythicKeystoneStatus", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0" );

local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
local LibQTip = LibStub('LibQTip-1.0')
local frame = nil
local keystoneStoneDungeons = nil
local updateDelay = 3

local textures = {}
textures.alliance = "|TInterface\\FriendsFrame\\PlusManz-Alliance:18|t"
textures.horde = "|TInterface\\FriendsFrame\\PlusManz-Horde:18|t"

local yellow = { r = 1.0, g = 1.0, b = 0.2 }
local gray = { r = 0.5, g = 0.5, b = 0.5 }
local green = { r = 0.2, g = 1.0, b = 0.2 }
local red = { r = 1.0, g = 0.2, b = 0.2 }

local defaults = {
			expandCharacterNames = false,
			showSeasonBest = true,
			showDungeonNames = true,
			showTips = false,
			MinimapButton = {
				hide = false,
			}, 
}
local ldbObject = LDB:NewDataObject("MythicKeystoneStatus", {
		type = "data source",
		--text = L["Mythic Keystone Status"],
		label = CHALLENGES, --"Keystone"
		tocname = "MKS",
		icon = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1.png",
		--OnClick = function(clickedframe, button)
			--MythicKeystoneStatus:ShowOptions()
		--end,
		OnEnter = function(self)
			frame = self
			MythicKeystoneStatus:ShowToolTip()
		end
})

local function GetKeystoneDungeonList()
	local dungeons = {}

	local maps = C_ChallengeMode.GetMapTable();

	for i = 1, #maps do
		local mapInfo = maps[i]
		local mapChallengeModeID = maps[i]
		local mapName, _, _, mapTexture = C_ChallengeMode.GetMapUIInfo(mapChallengeModeID)

		tinsert(dungeons, { id = mapChallengeModeID, name  = mapName, texture = mapTexture})
    end

	table.sort(dungeons, function(a, b) return a.name < b.name end);

	return dungeons
end

local function GetCharacterInfo()
	if (UnitLevel("player") < 110) then return end

	local characterInfo = {}
	local _, class = UnitClass("player")

	characterInfo.name = UnitName("player")
	characterInfo.realm = GetRealmName()
	characterInfo.lastUpdate = time()
	characterInfo.class = class
	characterInfo.level = UnitLevel("player")
	characterInfo.faction = UnitFactionGroup("player")
	characterInfo.keystoneStatus = GetKeystoneStatus()

	return characterInfo
end

local function GetCharacter()
	local characters = MythicKeystoneStatus.characters or {}
	local name = UnitName("player")
	local realm = GetRealmName()
	local info = characters[name .. "-" .. realm] or GetCharacterInfo()

	return info
end

local function PutCharacter(character)
	local characters = MythicKeystoneStatus.characters or {}
	characters[character.name .. "-" .. character.realm] = character
	
	MythicKeystoneStatus.characters = characters
end

local function UpdateCharacter()
	if (UnitLevel("player") < 120) then return end

	local currentCharacter = GetCharacterInfo()
	
	if currentCharacter.keystoneStatus then
		PutCharacter(currentCharacter)
	end

	if (currentCharacter.keystoneStatus and currentCharacter.keystoneStatus.weeklyBest) then
		ldbObject.text = "+" .. currentCharacter.keystoneStatus.weeklyBest.level
	else
		ldbObject.text = ""
	end

	MythicKeystoneStatus.updateTimer = nil
end

local function DelayedUpdate()
	if MythicKeystoneStatus:TimeLeft(MythicKeystoneStatus.updateTimer) == 0 then
		MythicKeystoneStatus.updateTimer = MythicKeystoneStatus:ScheduleTimer(UpdateCharacter, updateDelay)
	end
end

local function GetActiveKeystone()
	local keystoneInfo = nil
	local mapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()

	if mapID then 
		local keystoneLevel	= C_MythicPlus.GetOwnedKeystoneLevel()
		local keystoneDungeon = C_ChallengeMode.GetMapUIInfo(mapID);

		keystoneInfo = { dungeon = keystoneDungeon, level = keystoneLevel, link = keystoneLink }
	end

	return keystoneInfo;
end



local function Update()
	local character = GetCharacter()

	if (character) then
		character.keystoneStatus.activeKeystone = GetActiveKeystone()
		PutCharacter(character)
	end
end

function MythicKeystoneStatus:OnInitialize()
	LDBIcon:Register("MythicKeystoneStatus", ldbObject)	
end

function MythicKeystoneStatus:ToggleMinimapButton(info, value)

	defaults.MinimapButton.hide = not value

	if defaults.MinimapButton.hide then
		LDBIcon:Hide("MythicKeystoneStatus")
	else
		LDBIcon:Show("MythicKeystoneStatus")
	end

	--LDBIcon:Refresh("MythicKeystoneStatus")
	--LDBIcon:Refresh("MythicKeystoneStatus")
end

function MythicKeystoneStatus:OnEnable()
	C_MythicPlus.RequestMapInfo();
	local dungeons = GetKeystoneDungeonList()

	self:RegisterEvent("MYTHIC_PLUS_NEW_WEEKLY_RECORD")
	self:RegisterEvent("MYTHIC_PLUS_NEW_SEASON_RECORD")
	DelayedUpdate()
	--self.updateTimer = MythicKeystoneStatus:ScheduleTimer(UpdateCharacter, updateDelay)
end

function MythicKeystoneStatus:OnDisable()
	self:UnregisterEvent("MYTHIC_PLUS_NEW_WEEKLY_RECORD")
	self:UnregisterEvent("MYTHIC_PLUS_NEW_SEASON_RECORD")
end

function MythicKeystoneStatus:MYTHIC_PLUS_NEW_WEEKLY_RECORD(event, payload)	
	DelayedUpdate()
	-- MythicKeystoneStatus:Print(string.format("New weekly record for %s [+%d] %s",C_ChallengeMode.GetMapUIInfo(payload.mapChallengeModeID), payload.level, GetTimeStringFromSeconds(payload.completionMilliseconds/1000)))
end

function MythicKeystoneStatus:MYTHIC_PLUS_NEW_SEASON_RECORD(event, payload)
	DelayedUpdate()
	--MythicKeystoneStatus:Print(string.format("New season record for %s [+%d] %s",C_ChallengeMode.GetMapUIInfo(payload.mapChallengeModeID), payload.level, GetTimeStringFromSeconds(payload.completionMilliseconds/1000)))
end

local function GetWeeklyQuestResetTime()
   local now = time()
   local region = GetCurrentRegion()
   local dayOffset = { 2, 1, 0, 6, 5, 4, 3 }
   local regionDayOffset = {{ 2, 1, 0, 6, 5, 4, 3 }, { 4, 3, 2, 1, 0, 6, 5 }, { 3, 2, 1, 0, 6, 5, 4 }, { 4, 3, 2, 1, 0, 6, 5 }, { 4, 3, 2, 1, 0, 6, 5 } }
   local nextDailyReset = GetQuestResetTime()
   local utc = date("!*t", now + nextDailyReset)      
   local reset = regionDayOffset[region][utc.wday] * 86400 + nextDailyReset
   
   return time() + reset  
end


local function GetCharacters(realm)
	local sortedCharacters = {}
	local characters = MythicKeystoneStatus.characters or {}

	for key,value in pairs(characters) do
		if ((not realm) or (realm == characters[i].realm) and value.level >= 110) then
			tinsert(sortedCharacters, value)
		end
	end

	table.sort(sortedCharacters, function(a, b) return a.name < b.name end)

	return sortedCharacters
end


function GetKeystoneStatus()
	local keystoneStatus = {}
	local dungeons = GetKeystoneDungeonList()

	for i = 1, #dungeons do
		local mapID = dungeons[i].id
		local status = {}
		status.weeklyBest = {}
		status.seasonBest = {}
		

		status.weeklyBest.time, status.weeklyBest.level, _, _, status.weeklyBest.Memebers = C_MythicPlus.GetWeeklyBestForMap(mapID);

		local intimeInfo, overtimeInfo = C_MythicPlus.GetSeasonBestForMap(mapID);

		if intimeInfo then
		  	status.seasonBest.time = intimeInfo.durationSec
		  	status.seasonBest.level = intimeInfo.level
			status.seasonBest.recordSet = intimeInfo.completionDate			
			status.seasonBest.members = intimeInfo.members
			status.seasonBest.overtime = false
		elseif overtimeInfo then
			status.seasonBest.time = overtimeInfo.durationSec
		  	status.seasonBest.level = overtimeInfo.level
			status.seasonBest.recordSet = overtimeInfo.members
			status.seasonBest.overtime = true
		end

		if (status.weeklyBest.level) then
			if (not keystoneStatus.weeklyBest) or (keystoneStatus.weeklyBest.level < status.weeklyBest.level) or 
				( (keystoneStatus.weeklyBest.level == status.weeklyBest.level) and (keystoneStatus.weeklyBest.time > status.weeklyBest.time) ) then
				keystoneStatus.weeklyBest = {level = status.weeklyBest.level, time = status.weeklyBest.time, overtime = false, dungeon = dungeons[i].name}
			end
		end

		if (status.seasonBest.level) then
			if (not keystoneStatus.seasonBest) or (keystoneStatus.seasonBest.level < status.seasonBest.level) or 
				( (keystoneStatus.seasonBest.level == status.seasonBest.level) and (keystoneStatus.seasonBest.time > status.seasonBest.time) ) then
				keystoneStatus.seasonBest = {level = status.seasonBest.level, time = status.seasonBest.time, overtime = status.seasonBest.overtime, dungeon = dungeons[i].name}
			end
		end
		
	
		keystoneStatus[dungeons[i].name] = status	
	end

	keystoneStatus.activeKeystone = GetActiveKeystone()

	return keystoneStatus
end



function MythicKeystoneStatus:ShowSubTooltip(cell, info)	
	if not info then
		return
	end

	local character = info.character
	local type = info.type
	local title = nil

	local subTooltip = MythicKeystoneStatus.subTooltip
	local dungeons = GetKeystoneDungeonList()

	if LibQTip:IsAcquired("MKSsubTooltip") and subTooltip then
		subTooltip:Clear()
	else 
		subTooltip = LibQTip:Acquire("MKSsubTooltip", 3, "LEFT", "LEFT", "RIGHT")
		MythicKeystoneStatus.subTooltip = subTooltip	
	end	

	subTooltip:ClearAllPoints()

	local tooltip = MythicKeystoneStatus.tooltip
	local x, y = tooltip:GetParent():GetCenter()

	if (tooltip:GetLeft() < x) then
		subTooltip:SetPoint("LEFT", MythicKeystoneStatus.tooltip, "RIGHT", 20, 0)
	else
		subTooltip:SetPoint("RIGHT", MythicKeystoneStatus.tooltip, "LEFT", -20, 0)
	end

	if (tooltip:GetBottom() < y) then
		subTooltip:SetPoint("BOTTOM", MythicKeystoneStatus.tooltip, "BOTTOM", 30, 0)
	else
		subTooltip:SetPoint("TOP", MythicKeystoneStatus.tooltip, "TOP", 30, 0)
	end


	--subTooltip:SetClampedToScreen(true)
	--subTooltip:SetPoint("TOP", MythicKeystoneStatus.tooltip, "TOP", 30, 0)
	--subTooltip:SetPoint("RIGHT", MythicKeystoneStatus.tooltip, "LEFT", -20, 0)
	--subTooltip:SetPoint("BOTTOM", MythicKeystoneStatus.tooltip, "BOTTOM", 30, 0)
	--subTooltip:SetPoint("LEFT", MythicKeystoneStatus.tooltip, "RIGHT", 20, 0)

	if (type == "WEEKLY") then
		title = MYTHIC_PLUS_WEEKLY_BEST  --"Weekly Best"
	else
		title = MYTHIC_PLUS_SEASON_BEST  --"Season Best"
	end

	line = subTooltip:AddLine()	
	subTooltip:SetCell(line, 1, title, nil, "LEFT", 3)
	subTooltip:SetCellTextColor(line, 1, yellow.r, yellow.g, yellow.b)
	subTooltip:AddSeparator(6,0,0,0,0)

	line = subTooltip:AddLine(DUNGEONS , TIME_LABEL, LEVEL)
	subTooltip:SetLineTextColor(line, yellow.r, yellow.g, yellow.b)
	subTooltip:AddSeparator(3,0,0,0,0)

	for i = 1, #dungeons do
		local line = subTooltip:AddLine()
		local dungeon = character.keystoneStatus[dungeons[i].name]
		
		subTooltip:SetCell(line, 1, "|T"..dungeons[i].texture..":0|t " .. dungeons[i].name, nil, "LEFT", nil, nil, nil, 10)
		
		if type == "WEEKLY" then
			status = dungeon.weeklyBest
		else
			status = dungeon.seasonBest
		end

		if status then
			if status.time then
				subTooltip:SetCell(line, 2, GetTimeStringFromSeconds(status.time), nil, "LEFT")
			else
				subTooltip:SetLineTextColor(line, gray.r, gray.g, gray.b)
			end

			if status.level then 
				subTooltip:SetCell(line, 3, "+"..status.level, nil, "RIGHT")	
			end

			if status.overtime then
				subTooltip:SetCellTextColor(line, 2, red.r, red.g, red.b)
				subTooltip:SetCellTextColor(line, 3, red.r, red.g, red.b)
			else
				subTooltip:SetCellTextColor(line, 3, green.r, green.g, green.b)
			end

		end		
	end

	subTooltip:Show()
end

function HideSubTooltip()
	local subTooltip = MythicKeystoneStatus.subTooltip
	if subTooltip then
		LibQTip:Release(subTooltip)
		subTooltip = nil
	end
	GameTooltip:Hide()
	MythicKeystoneStatus.subTooltip = subTooltip
end

local function GetDungeonNameOffset()
	local offset = 0

	if (defaults.showDungeonNames) then 
		offset = 1
	end

	return offset
end

local function GetSeasonBestOffset()
	local offset = 0

	if (defaults.showSeasonBest) then
		offset = 1 + GetDungeonNameOffset()
	end

	return offset
end

local function ShowCharacter(characterInfo)
	local lastReset = GetWeeklyQuestResetTime() - 604800
	local tooltip = MythicKeystoneStatus.tooltip
	local line = tooltip:AddLine()
	local factionIcon = ""
	local dungeons = GetKeystoneDungeonList()
	local keystoneStatus = characterInfo.keystoneStatus
	local characterName = characterInfo.name
	local dungeonNameOffset = GetDungeonNameOffset()
	local seasonBestOffset = GetSeasonBestOffset()

	if (defaults.expandCharacterNames) then
		characterName = characterInfo.name .. "-" .. characterInfo.realm
	end

	if characterInfo.faction and characterInfo.faction == "Alliance" then
		factionIcon = textures.alliance
	elseif characterInfo.faction and characterInfo.faction == "Horde" then
		factionIcon = textures.horde
	end

	tooltip:SetCell(line, 1, factionIcon.." "..characterName)

	if characterInfo.class then
		local color = RAID_CLASS_COLORS[characterInfo.class]
		tooltip:SetCellTextColor(line, 1, color.r, color.g, color.b)
	end	

	if (characterInfo.lastUpdate > lastReset) and (keystoneStatus.weeklyBest) then
		if (defaults.showDungeonNames) then
			tooltip:SetCell(line, 2, keystoneStatus.weeklyBest.dungeon, nil, "RIGHT", nil, nil, 10)
		end
		tooltip:SetCell(line, 2 + dungeonNameOffset, "+" .. keystoneStatus.weeklyBest.level, nil, "RIGHT")
	end

	if keystoneStatus.weeklyBest then
		if keystoneStatus.weeklyBest.overtime then
			tooltip:SetCellTextColor(line, 2 + dungeonNameOffset, red.r, red.g, red.b)
		else
			tooltip:SetCellTextColor(line, 2 + dungeonNameOffset, green.r, green.g, green.b)
		end
	end

	tooltip:SetCellScript(line, 2 + dungeonNameOffset, "OnEnter", function(self)
			local info = { character = characterInfo, type = "WEEKLY" }
			MythicKeystoneStatus:ShowSubTooltip(self, info)
		end)

	tooltip:SetCellScript(line, 2 + dungeonNameOffset, "OnLeave", HideSubTooltip)

	if (defaults.showSeasonBest) then
		if (keystoneStatus.seasonBest) then
			if (defaults.showDungeonNames) then 
				tooltip:SetCell(line, 4, keystoneStatus.seasonBest.dungeon, nil, "RIGHT", nil, nil, 10)
			end
			tooltip:SetCell(line, 3 + (2 * dungeonNameOffset), "+" .. keystoneStatus.seasonBest.level, nil, "RIGHT")
		end		
		tooltip:SetCellTextColor(line, 3 + (2 * dungeonNameOffset), green.r, green.g, green.b)

		tooltip:SetCellScript(line, 3 + (2 * dungeonNameOffset), "OnEnter", function(self)
				local info = { character = characterInfo, type= "SEASON" }
				MythicKeystoneStatus:ShowSubTooltip(self, info)
			end)

		tooltip:SetCellScript(line, 3 + (2 * dungeonNameOffset), "OnLeave", HideSubTooltip)
	end

	if (characterInfo.lastUpdate > lastReset) and (keystoneStatus.activeKeystone) then
		tooltip:SetCell(line, 3 + seasonBestOffset + dungeonNameOffset, keystoneStatus.activeKeystone.dungeon, nil, "RIGHT", nil, nil, 10)
		tooltip:SetCell(line, 4 + seasonBestOffset + dungeonNameOffset, "+" .. keystoneStatus.activeKeystone.level, nil, "RIGHT")
	end

	if keystoneStatus.seasonBest then
		if keystoneStatus.seasonBest.overtime then
			tooltip:SetCellTextColor(line, 4 + seasonBestOffset + dungeonNameOffset, red.r, red.g, red.b)
		else		
			tooltip:SetCellTextColor(line, 4 + seasonBestOffset + dungeonNameOffset, green.r, green.g, green.b)
		end
	end
end

function MythicKeystoneStatus:ShowToolTip()
	C_MythicPlus.RequestMapInfo();

	local tooltip = MythicKeystoneStatus.tooltip
	local dungeons = GetKeystoneDungeonList()
	local characters = GetCharacters()
	local columnCount = 5
	local dungeonNameOffset = GetDungeonNameOffset()
	local seasonBestOffset = GetSeasonBestOffset()
	local weeklyBestTitle = CALENDAR_REPEAT_WEEKLY 
	local seasonBestTitle = ARENA_THIS_SEASON 

	if (defaults.showDungeonNames) then
		weeklyBestTitle = MYTHIC_PLUS_WEEKLY_BEST 
		seasonBestTitle = MYTHIC_PLUS_SEASON_BEST 
	end

	columnCount = 4 + dungeonNameOffset + seasonBestOffset

	if LibQTip:IsAcquired("MythicKeystoneStatusTooltip") and tooltip then
		tooltip:Clear()
	else
		tooltip = LibQTip:Acquire("MythicKeystoneStatusTooltip", columnCount, "LEFT", "RIGHT", "RIGHT", "RIGHT", "RIGHT")
		MythicKeystoneStatus.tooltip = tooltip 
	end

	line = tooltip:AddHeader(" ")
	tooltip:SetCell(1, 1, "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1:16|t "..CHALLENGES , nil, "LEFT", tooltip:GetColumnCount())
	tooltip:AddSeparator(6,0,0,0,0)

	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, CHARACTER)
	tooltip:SetCellTextColor(line, 1, yellow.r, yellow.g, yellow.b)

	tooltip:SetCell(line, 2, weeklyBestTitle, nil, "RIGHT", 1 + dungeonNameOffset)
	tooltip:SetCellTextColor(line, 2, yellow.r, yellow.g, yellow.b)

	if (defaults.showSeasonBest) then
		tooltip:SetCell(line, 3 + dungeonNameOffset, seasonBestTitle, nil, "RIGHT", 1 + dungeonNameOffset)
		tooltip:SetCellTextColor(line, 3 + dungeonNameOffset, yellow.r, yellow.g, yellow.b)
		column = 6
	end

	tooltip:SetCell(line, 3 + seasonBestOffset + dungeonNameOffset, CHALLENGES , nil, "RIGHT", 2)
	tooltip:SetCellTextColor(line, 3 + seasonBestOffset + dungeonNameOffset, yellow.r, yellow.g, yellow.b)

	tooltip:AddSeparator(3,0,0,0,0)

	for i=1, #characters do		
		local character = characters[i]
		if character.keystoneStatus then
			if character.keystoneStatus.weeklyBest or character.keystoneStatus.seasonBest or character.keystoneStatus.activeKeystone then
				ShowCharacter(character)		
			end
		end
	end

	if (defaults.showTips) then
		tooltip:AddSeparator(6,0,0,0,0)
		line = tooltip:AddLine()
		tooltip:SetCell(line, 1, "TIP: Hover over level number for more details", nil, "LEFT", columnCount)
	end


	if (frame) then
		tooltip:SetAutoHideDelay(0.01, frame)
		tooltip:SmartAnchorTo(frame)
	end 

	tooltip:UpdateScrolling()
	tooltip:Show()
end
