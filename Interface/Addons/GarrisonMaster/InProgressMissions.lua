﻿--## Version: 10.0.36 ## Author: lteke
local InProgressMissions = {}

InProgressMissions.frame = InProgressMissions.frame or CreateFrame("Frame", nil, _G.WorldFrame)
InProgressMissions.events = InProgressMissions.events or {}

local MISSION_BUTTON_HEIGHT = 37
local MISSION_ICON_SIZE = MISSION_BUTTON_HEIGHT - 4
local MISSION_REWARD_SIZE = MISSION_BUTTON_HEIGHT * 0.78
local COVENANTMISSION_BUTTONHEIGHT = 64

local FORMAT_DURATION_DAYS = _G.GARRISON_DURATION_DAYS:gsub("([^|]*)|4[^:]+:([^;]+);(.*)", "%1%2%3"):gsub("%%d", "%%.1f")
local FORMAT_DURATION_HOURS = _G.GARRISON_DURATION_HOURS:gsub("([^|]*)|4[^:]+:([^;]+);(.*)", "%1%2%3"):gsub("%%d", "%%.1f")
local FORMAT_DURATION_MINUTES = _G.GARRISON_DURATION_MINUTES
local FORMAT_DURATION_SECONDS = _G.GARRISON_DURATION_SECONDS
local FORMAT_TOOLTIP_LEVEL = _G.GARRISON_MISSION_LEVEL_TOOLTIP or _G.GARRISON_BUILDING_LEVEL_LABEL_TOOLTIP
local FORMAT_TOOLTIP_ITEMLEVEL = _G.GARRISON_MISSION_LEVEL_ITEMLEVEL_TOOLTIP

local FORMAT_ICONINTEXT = "|T%s:0:0:0:0:64:64:5:59:5:59|t"
local FORMAT_LEVEL = "[%d]"
local FORMAT_REWARDNUMS = "%.1f"
local FORMAT_REWARD_DIFFICULTY = ITEM_QUALITY_COLORS[2].hex.." (%s)"..FONT_COLOR_CODE_CLOSE

local FOLLOWER_XP_THRESHOLD = 5000

local TIME_COLORS

local TITLE_COLOR_NORMAL = {0.93, 0.93, 0.9}
local TITLE_COLOR_ALT = {0.65, 0.65, 0.55}

local ORDERHALL_ADDONS = {
	["GarrisonMissionManager"] = false,
	["OrderHallCommander"] = false,
	["RENovate"] = false,
}

local tinsert = tinsert
local GFT = Enum.GarrisonFollowerType
local GarrisonLandingPageReport
local GarrisonLandingPageReportList

local TEXT_LEGION_MISSIONS = _G.EXPANSION_NAME6.." ".._G.GARRISON_MISSIONS
local TEXT_BFA_MISSIONS = _G.EXPANSION_NAME7.." ".._G.GARRISON_MISSIONS

local events = InProgressMissions.events

function InProgressMissions:InitDB()
	if type(IPMDB) ~= "table" then
		IPMDB = {}
	end
	if IPMDB.enableGarrisonMissions == nil then
		IPMDB.enableGarrisonMissions = true
	end
	if IPMDB.enableLegionMissions == nil then
		IPMDB.enableLegionMissions = IPMDB.enableGarrisonMissions
	end
	if IPMDB.enableBfaMissions == nil then
		IPMDB.enableBfaMissions = IPMDB.enableLegionMissions
	end
	-- if IPMDB.improveCovenantMissionUI == nil then
	-- 	IPMDB.improveCovenantMissionUI = false
	-- end
	if type(IPMDB.profiles) ~= "table" then
		IPMDB.profiles = {}
	end
	if type(IPMDB.ignores) ~= "table" then
		IPMDB.ignores = {}
	end
	if type(IPMDB.profiles[self.profileName]) ~= "table" then
		IPMDB.profiles[self.profileName] = {}
	end
end

function InProgressMissions:SaveInProgressMissions()
	self.saved = true
	self:InitDB()
	if C_Garrison.GetLandingPageGarrisonType() == 0 then
		IPMDB.profiles[self.profileName] = nil
		return
	end
	local profile = wipe(IPMDB.profiles[self.profileName])
	self:GetMissions(GFT.FollowerType_9_0, profile)
	if self.delayedSave then
		self.delayedSave = nil
	elseif not next(profile) then
		self.delayedSave = true
		self:QueueSaveInProgressMissions(1.0)
	end
	self:GetMissions(GFT.FollowerType_8_0, profile)
	self:GetMissions(GFT.FollowerType_7_0, profile)
	self:GetMissions(GFT.FollowerType_6_2, profile)
	self:GetMissions(GFT.FollowerType_6_0, profile)
	if not next(profile) then
		IPMDB.profiles[self.profileName] = nil
	end
end

local function GetMissionFollowerAbilitiesInfo(mission)
	local isAutoCombatant = mission.followerTypeID == GFT.FollowerType_9_0 -- Shadowlands
	local result = {}
	for i, id in ipairs(mission.followers) do
		local info = C_Garrison.GetFollowerInfo(id)
		if info then
			info.abilities = {}
			if isAutoCombatant then
				local spells = C_Garrison.GetFollowerAutoCombatSpells(info.followerID, info.level or 1)
				for k, spell in ipairs(spells or {}) do
					tinsert(info.abilities, 1, spell.icon)
				end
			else
				for k, ability in ipairs(C_Garrison.GetFollowerAbilities(info.followerID)) do
					tinsert(info.abilities, ability.id)
				end
			end
			result[id] = info
		end
	end
	return result
end

do
	local function GetCharName(charText)
		local name, realm = charText:match("([^%p]+)|?r?-?(.*)", 11)
		return name or _G.UNKNOWN, realm or _G.FRIENDS_LIST_REALM
	end

	local function CompareMissionName(m1, m2)
		local name1, realm1 = GetCharName(m1.charText)
		local name2, realm2 = GetCharName(m2.charText)
			if name1 == name2 then
				if realm1 == realm2 then
					if m1.missionEndTime == m2.missionEndTime then
						return m1.name < m2.name
					else
						return (m1.missionEndTime or 0) < (m2.missionEndTime or 0)
					end
				else
					return realm1 < realm2
				end
			else
				return name1 < name2
			end
	end

	local function CompareMissionTime(m1, m2)
		if (m1.followerTypeID == m2.followerTypeID) and (m1.followerTypeID > GFT.FollowerType_6_2) then
			if (m1.missionEndTime or 0) == (m2.missionEndTime or 0) then
				return CompareMissionName(m1, m2)
			else
				return (m1.missionEndTime or 0) < (m2.missionEndTime or 0)
			end
		elseif (m1.followerTypeID < GFT.FollowerType_7_0) and (m2.followerTypeID < GFT.FollowerType_7_0) then
			return (m1.missionEndTime or 0) < (m2.missionEndTime or 0)
		else
			return m1.followerTypeID > m2.followerTypeID
		end
	end

	function InProgressMissions:UpdateMissions()
		local garrisonType = C_Garrison.GetLandingPageGarrisonType()
		wipe(self.missions)
		if garrisonType == Enum.GarrisonType.Type_9_0 then
			self:GetMissions(GFT.FollowerType_9_0, self.missions, true)
		end
		if garrisonType == Enum.GarrisonType.Type_8_0 or IPMDB.enableBfaMissions or C_Garrison.IsPlayerInGarrison(Enum.GarrisonType.Type_8_0) then
			self:GetMissions(GFT.FollowerType_8_0, self.missions, true)
		end
		if garrisonType == Enum.GarrisonType.Type_7_0 or IPMDB.enableLegionMissions or C_Garrison.IsPlayerInGarrison(Enum.GarrisonType.Type_7_0) then
			self:GetMissions(GFT.FollowerType_7_0, self.missions, true)
		end
		if garrisonType == Enum.GarrisonType.Type_6_0 or IPMDB.enableGarrisonMissions or C_Garrison.IsPlayerInGarrison(Enum.GarrisonType.Type_6_0) then
			self:GetMissions(GFT.FollowerType_6_2, self.missions, true)
			self:GetMissions(GFT.FollowerType_6_0, self.missions, true)
		end
		self:UpdateInProgressTabText()
	end

	function InProgressMissions:UpdateAltMissions()
		self.altMissions = wipe(self.altMissions or {})
		for name, missions in pairs(IPMDB.profiles) do
			if name ~= self.profileName and not IPMDB.ignores[name] then
				for i, mission in ipairs(missions) do
					mission.followerTypeID = mission.followerTypeID or 0
					if mission.followerTypeID >= GFT.FollowerType_9_0 or (mission.followerTypeID == GFT.FollowerType_8_0 and IPMDB.enableBfaMissions) or (mission.followerTypeID == GFT.FollowerType_7_0 and IPMDB.enableLegionMissions) or (mission.followerTypeID < GFT.FollowerType_7_0 and IPMDB.enableGarrisonMissions) then
						if type(mission) == "table" and type(mission.charText) == "string" then
							tinsert(self.altMissions, mission)
						end
					end
				end
			end
		end
		table.sort(self.altMissions, IPMDB.sortMethod == "time" and CompareMissionTime or CompareMissionName)
		self:UpdateInProgressTabText()
	end

	function InProgressMissions:GetMissions(followerType, dest, sort)
		local isAutoCombatant = followerType == GFT.FollowerType_9_0 -- Shadowlands
		local temp = C_Garrison.GetInProgressMissions(followerType)
		if not temp then return end
		for k, mission in pairs(temp) do
			if type(mission) == "table" then
				mission.isAltMission = false
				mission.description = ""
				mission.charText = self.playerNameText.."-"..GetRealmName()
				mission.followerInfo = GetMissionFollowerAbilitiesInfo(mission)
				-- mission.followerInfo = {}
				-- for i, id in ipairs(mission.followers) do
				-- 	local info = C_Garrison.GetFollowerInfo(id)
				-- 	if info then
				-- 		info.abilities = {}
				-- 		if isAutoCombatant then
				-- 			local spells = C_Garrison.GetFollowerAutoCombatSpells(info.followerID, info.level or 1)
				-- 			for k, spell in ipairs(spells or {}) do
				-- 				tinsert(info.abilities, 1, spell.icon)
				-- 			end
				-- 		else
				-- 			for k, ability in ipairs(C_Garrison.GetFollowerAbilities(info.followerID)) do
				-- 				tinsert(info.abilities, ability.id)
				-- 			end
				-- 		end
				-- 		mission.followerInfo[id] = info
				-- 	end
				-- end
				mission.successChance = C_Garrison.GetMissionSuccessChance(mission.missionID)
				if isAutoCombatant then
					mission.encounterIconInfo = C_Garrison.GetMissionEncounterIconInfo(mission.missionID)
				end
			end
		end
		if sort then
			table.sort(temp, type(sort) == "function" and sort or CompareMissionTime)
		end
		for k, mission in ipairs(temp) do
			tinsert(dest, mission)
		end
	end
end

local function FormatRewardNumbers(value)
	if GetLocale() == "zhCN" or GetLocale() == "zhTW"  then
	if value > 9999 then
		value = FORMAT_REWARDNUMS:format(value / 10000)
		if string.sub(value, -3) == ".0" then
			value = string.sub(value, 1, -4)
		end
		value = value.."万"
	end
	return value
	else
		if value > 999 then
		value = FORMAT_REWARDNUMS:format(value / 1000)
		if string.sub(value, -2) == ".0" then
			value = string.sub(value, 1, -3)
		end
		value = value.."k"
	end
	return value
	end
	--return BreakUpLargeNumbers(value)
end

local function Reward_Update(Reward, info)
	Reward.Quantity:Hide()
	Reward.IconBorder:Hide()
	Reward.Success:Hide()
	Reward.bonusAbilityID = info.bonusAbilityID
	Reward.title = nil
	Reward.tooltip = nil
	Reward.itemID = nil
	Reward.itemLink = nil
	Reward.currencyID = nil
	Reward.currencyQuantity = nil
	if (info.itemID or info.itemLink) then
		Reward.itemID = info.itemID
		Reward.itemLink = info.itemLink
		local itemTexture = select(10, GetItemInfo(info.itemID))
		Reward.Icon:SetTexture(itemTexture)
		if ( info.quantity > 1 ) then
			Reward.Quantity:SetText(info.quantity)
			Reward.Quantity:Show()
		else
			local quality, itemLevel = select(3, GetItemInfo(info.itemLink or info.itemID))
			if ( itemLevel and itemLevel > 500 ) then
				Reward.Quantity:SetText(ITEM_QUALITY_COLORS[quality].hex..itemLevel..FONT_COLOR_CODE_CLOSE)
				Reward.Quantity:Show()
			end
		end
		--Reward.tooltip = nil
		local quality = select(3, GetItemInfo(info.itemLink or info.itemID))
		local c = BAG_ITEM_QUALITY_COLORS[quality] or BAG_ITEM_QUALITY_COLORS[1]
		Reward.IconBorder:SetVertexColor(c.r, c.g, c.b)
		Reward.IconBorder:Show()
	else
		Reward.Icon:SetTexture(info.icon)
		Reward.title = info.title
		if (info.currencyID and info.quantity) then
			if (info.currencyID == 0) then
				Reward.tooltip = GetMoneyString(info.quantity)
				Reward.Quantity:SetText(BreakUpLargeNumbers(math.floor(info.quantity / COPPER_PER_GOLD)))
				Reward.Quantity:Show()
			else
				Reward.currencyID = info.currencyID
				Reward.tooltip = info.tooltip
				Reward.currencyQuantity = info.quantity
				-- local currencyTexture = C_CurrencyInfo.GetBasicCurrencyInfo(info.currencyID).icon
				local currencyName, currencyTexture, currencyQuantity, currencyQuality = CurrencyContainerUtil.GetCurrencyContainerInfo(info.currencyID, info.quantity, info.title, info.icon, nil)
				Reward.tooltip = BreakUpLargeNumbers(info.quantity).." |T"..currencyTexture..":0:0:0:-1|t "
				Reward.Quantity:SetText(info.quantity)
				local c = BAG_ITEM_QUALITY_COLORS[currencyQuality]
				if c then
					Reward.IconBorder:SetVertexColor(c.r, c.g, c.b)
					Reward.IconBorder:Show()
				end
				Reward.Quantity:Show()
			end
		elseif (info.bonusAbilityID) then
			Reward.bonusAbilityID = info.bonusAbilityID
			Reward.bonusAbilityDuration = info.duration
			Reward.bonusAbilityIcon = info.icon
			Reward.bonusAbilityName = info.name
			Reward.bonusAbilityDescription = info.description
			Reward.duration = info.duration
			Reward.icon = info.icon
			Reward.name = info.name
			Reward.description = info.description
		else
			Reward.tooltip = info.tooltip
			if ( info.followerXP ) then
				Reward.Quantity:SetText(ITEM_QUALITY_COLORS[info.followerXP >= FOLLOWER_XP_THRESHOLD and 2 or 1].hex..FormatRewardNumbers(info.followerXP)..FONT_COLOR_CODE_CLOSE)
				Reward.Quantity:Show()
			end
		end
	end
end

local function Rewards_Update(button, item)
	local rewardIndex = 0
	if item.overmaxRewards and item.hasBonusEffect then
		if item.successChance and item.successChance > 100 then
			for rewardId, reward in pairs(item.overmaxRewards) do
				rewardIndex = rewardIndex + 1
				local Reward = button.Rewards[rewardIndex]
				Reward_Update(Reward, reward)
				Reward.Success:SetFormattedText("%d%%", item.successChance - 100)
				Reward.Success:Show()
				Reward:Show()
				-- Reward:SetAlpha((item.successChance - 100) / 100)
			end
		end
	end
	if item.rewards then
		for rewardId, reward in pairs(item.rewards) do
			rewardIndex = rewardIndex + 1
			local Reward = button.Rewards[rewardIndex]
			Reward_Update(Reward, reward)
			Reward:Show()
			-- Reward:SetAlpha(1)
		end
	end
	for i = (rewardIndex + 1), #button.Rewards do
		button.Rewards[i]:Hide()
	end
	return rewardIndex
end

local function GetFollowerIndicator(item)
	if not item.numFollowers then return end
	local result = ""
	local id, info
	for i = 1, item.numFollowers do
		id = item.followers[i]
		info = nil
		if id and type(item.followerInfo) == "table" then
			info = item.followerInfo[id]
		elseif id then
			info = C_Garrison.GetFollowerInfo(id)
		end
		if info and info.quality ~= 4 and not info.isTroop then
			result = result..ITEM_QUALITY_COLORS[info.quality or 1].hex.._G.RANGE_INDICATOR..FONT_COLOR_CODE_CLOSE
		else
			result = result.._G.RANGE_INDICATOR
		end
	end
	return result
end

local function MissionButton_SetLayout(button, isTabProgress)
	if isTabProgress then
		button.Reward1:SetPoint("RIGHT", -68, 0)
		button.Status:SetPoint("BOTTOMRIGHT", -8, 3)
	else
		button.CompletedCheck:Hide()
		button.CompletedOverlay:Hide()
		button.NumFollowers:Hide()
		button.Reward1:SetPoint("RIGHT", -5, 0)
		button.Title:SetTextColor(unpack(TITLE_COLOR_NORMAL))
		button.Level:SetTextColor(unpack(TITLE_COLOR_NORMAL))
		button.BG:SetVertexColor(1, 1, 1)
	end
end

local function MissionButton_Update(button, item)
	local baseTime = GetServerTime()
	local stopUpdate = true

	if item.missionEndTime then
		item.isComplete = (item.missionEndTime - baseTime) < 0
	end

	local bgName
	if (item.isBuilding) then
		bgName = "GarrLanding-Building-"
		button.Status:SetText(GARRISON_LANDING_STATUS_BUILDING)
	elseif (item.followerTypeID == GFT.FollowerType_6_2) then
		bgName = "GarrLanding-ShipMission-"
	else
		bgName = "GarrLanding-Mission-"
		button.Status:SetText(nil)
	end
	button.Status:SetShown(item.isBuilding and not item.isComplete)

	bgName = bgName.."InProgress"

	button.Title:SetText(item.name)

	if (item.isComplete) then
		button.CompletedCheck:Show()
		button.CompletedOverlay:Show()
		if item.isBuilding then
			button.MissionType:SetText(GARRISON_LANDING_BUILDING_COMPLEATE)
		else
			button.MissionType:SetText(item.isAltMission and (item.charText or _G.UNKNOWN) or InProgressMissions.playerNameText)
		end
		button.Title:SetWidth(290)
	else -- in progress
		button.CompletedCheck:Hide()
		button.CompletedOverlay:Hide()
		if (item.isBuilding) then
			button.MissionType:SetText(GARRISON_BUILDING_IN_PROGRESS.." - "..GARRISON_BUILDING_LEVEL_LABEL_TOOLTIP:format(item.buildingLevel))
			button.TimeLeft:SetText(item.timeLeft)
			button.TimeLeft:SetTextColor(unpack(TIME_COLORS[4]))
		else
			button.MissionType:SetText(item.isAltMission and (item.charText or _G.UNKNOWN) or InProgressMissions.playerNameText)
			t = (item.missionEndTime or 0) - baseTime
			if t > 107999 then -- 30hr
				button.TimeLeft:SetFormattedText(FORMAT_DURATION_DAYS, t / 86400)
			elseif t > 5459 then
				button.TimeLeft:SetFormattedText(FORMAT_DURATION_HOURS, t / 3600)
			elseif t > 59 then
				button.TimeLeft:SetFormattedText(FORMAT_DURATION_MINUTES, t / 60)
			else
				button.TimeLeft:SetFormattedText(FORMAT_DURATION_SECONDS, t)
			end
			button.TimeLeft:SetTextColor(unpack(TIME_COLORS[not t and 1 or t > 18000 and 2 or t > 5459 and 3 or t > 599 and 4 or t > 59 and 5 or 6]))
		end
		button.Title:SetWidth(322 - button.TimeLeft:GetWidth())
		stopUpdate = false
	end
	button.TimeLeft:SetShown(not item.isComplete)

	if item.followerTypeID == GFT.FollowerType_8_0 then
		button.Level:SetText(item.level)
	elseif item.followerTypeID == GFT.FollowerType_9_0 then
		button.Level:SetText(nil)
	else
		button.Level:SetText(item.iLevel and item.iLevel > 0 and item.iLevel or item.followerTypeID ~= GFT.FollowerType_6_2 and item.level or nil)
	end

	if item.typeAtlas then
		button.MissionTypeIcon:SetAtlas(item.typeAtlas)
	elseif item.typeIcon then
		button.MissionTypeIcon:SetTexture(item.typeIcon)
	else
		button.MissionTypeIcon:SetTexture(nil)
	end
	button.MissionTypeIcon:SetShown(not item.isBuilding and item.followerTypeID < GFT.FollowerType_9_0)

	if item.followerTypeID == GFT.FollowerType_9_0 then
		button.NumFollowers:Hide()
	else
		button.NumFollowers:SetText(GetFollowerIndicator(item))
		button.NumFollowers:Show()
	end

	button.EncounterIcon:SetShown(item.followerTypeID == GFT.FollowerType_9_0)
	if item.followerTypeID == GFT.FollowerType_9_0 then
		if item.encounterIconInfo then
			button.EncounterIcon:SetEncounterInfo(item.encounterIconInfo)
		else
			button.EncounterIcon:SetEncounterInfo(C_Garrison.GetMissionEncounterIconInfo(item.missionID))
		end
	end

	button.BG:SetAtlas(bgName, true)
	if item.isAltMission then
		button.Title:SetTextColor(unpack(TITLE_COLOR_ALT))
		button.Level:SetTextColor(unpack(TITLE_COLOR_ALT))
	else
		button.Title:SetTextColor(unpack(TITLE_COLOR_NORMAL))
		button.Level:SetTextColor(unpack(TITLE_COLOR_NORMAL))
	end
	if item.followerTypeID == GFT.FollowerType_6_2 then
		button.BG:SetVertexColor(0.9, 0.9, 1)
	else
		button.BG:SetVertexColor(1, 1, 1)
	end

	Rewards_Update(button, item)
end

local function GarrisonLandingPageReport_SetElementInitializer()
	local view = GarrisonLandingPageReportList.ScrollBox:GetView()
	view:GetPadding():SetRight(GarrisonLandingPageReportList.ScrollBar:GetWidth())
	view.templateInfos["GarrisonLandingPageReportMissionTemplate"] = nil
	view.elementExtent = nil
	view:SetElementInitializer("GarrisonLandingPageReportMissionTemplateIPM", function(button, elementData)
		if GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.InProgress then
			MissionButton_Update(button, elementData)
		else
			GarrisonLandingPageReportList_InitButtonAvailable(button, elementData)
			if _G.MasterPlan then
				button.Status:Hide()
			else
				local reward = (button.Reward3:IsShown() and button.Reward3) or (button.Reward2:IsShown() and button.Reward2) or (button.Reward1:IsShown() and button.Reward1)
				button.Status:SetPoint("BOTTOMRIGHT", reward, "BOTTOMLEFT", -4, 0)
				button.Status:SetText(elementData.offerEndTime and RAID_INSTANCE_EXPIRES:format(elementData.offerTimeRemaining) or nil)
				button.Status:Show()
			end
		end
	end)
end

local function GarrisonLandingPageReportList_Update(fullUpdate)
	local items = GarrisonLandingPageReportList.items
	if not items then return end

	if #items == 0 then
		local emptyMissionText = GarrisonLandingPage.garrTypeID == Enum.GarrisonType.Type_9_0 and COVENANT_MISSIONS_EMPTY_IN_PROGRESS or GARRISON_EMPTY_IN_PROGRESS_LIST;
		GarrisonLandingPageReportList.EmptyMissionText:SetText(emptyMissionText);
	else
		GarrisonLandingPageReportList.EmptyMissionText:SetText(nil);
	end

	local dataProvider = InProgressMissions.scrollBox:GetDataProvider();
	if fullUpdate or not dataProvider or #items ~= dataProvider:GetSize() then
		dataProvider = CreateDataProvider(items);
		InProgressMissions.scrollBox:SetDataProvider(dataProvider, ScrollBoxConstants.RetainScrollPosition);
	else
		for _, button in pairs(InProgressMissions.scrollBox:GetView():GetFrames()) do
			MissionButton_Update(button, button:GetMission())
		end
	end
end

local function GarrisonLandingPageReportList_UpdateItems()
	InProgressMissions:UpdateMissions()
	local isTabProgress = GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.InProgress
	if isTabProgress then
	else
		InProgressMissions:HideMenu()
	end

	local garrTypeID = GarrisonLandingPage.garrTypeID;
	if not garrTypeID then return end
	local availableMissions = C_Garrison.GetAvailableMissions(GetPrimaryGarrisonFollowerType(garrTypeID));
	GarrisonLandingPageReportList.AvailableItems = GarrisonLandingPageReportMission_FilterOutCombatAllyMissions(availableMissions);
	Garrison_SortMissions(GarrisonLandingPageReportList.AvailableItems);

	local items = GarrisonLandingPageReportList.items or {}
	wipe(items)
	for _, mission in ipairs(InProgressMissions.missions) do
		tinsert(items, CopyTable(mission, true))
	end
	for _, mission in ipairs(InProgressMissions.altMissions) do
		mission.isAltMission = true
		tinsert(items, CopyTable(mission, true))
	end
	GarrisonLandingPageReportList.items = items;

	local availableString = garrTypeID == Enum.GarrisonType.Type_9_0 and COVENANT_MISSIONS_AVAILABLE or GARRISON_LANDING_AVAILABLE;
	GarrisonLandingPageReport.Available.Text:SetFormattedText(availableString, #GarrisonLandingPageReportList.AvailableItems);

	if ( GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.InProgress ) then
		GarrisonLandingPageReportList_Update(true);
	else
		GarrisonLandingPageReportList_UpdateAvailable();
	end
end

local function MakeIcon(icon, rightText)
	local result = FORMAT_ICONINTEXT:format(icon or 134400)
	if rightText then
		return result.." "..rightText
	else
		return result
	end
end

local function AddIcon(text1, icon, text2)
	if text1 then
		return text1.." "..MakeIcon(icon, text2)
	else
		return MakeIcon(icon, text2)
	end
end

local function QualityColorText(text, quality)
	if quality then
		return ITEM_QUALITY_COLORS[quality].hex..text..FONT_COLOR_CODE_CLOSE
	else
		return text
	end
end

local function AddRewardText(item, rewardType)
	for id, reward in pairs(item[rewardType]) do
		if (reward.quality) then
			GameTooltip:AddLine(QualityColorText(reward.title or _G.UNKNOWN, reward.quality + 1))
		elseif (reward.itemID) then
			local itemName, _, itemQuality, _, _, _, _, _, _, itemTexture = GetItemInfo(reward.itemID)
			if itemName then
				itemName = MakeIcon(itemTexture, QualityColorText(itemName, itemQuality))
				-- local difficulty = itemDifficulty[reward.itemID]
				-- if difficulty then
				-- 	itemName = itemName..FORMAT_REWARD_DIFFICULTY:format(difficulty)
				-- end
				local quantity = reward.quantity and reward.quantity > 1 and FLAG_COUNT_TEMPLATE:format(reward.quantity) or ""
				if quantity then
					itemName = itemName.." "..quantity
				end
				GameTooltip:AddLine(itemName, 1, 1, 1)
			end
		elseif (reward.followerXP) then
			GameTooltip:AddLine(QualityColorText(GARRISON_REWARD_XP_FORMAT:format(BreakUpLargeNumbers(reward.followerXP)), reward.followerXP >= FOLLOWER_XP_THRESHOLD and 2 or 1))
		elseif (reward.currencyID and reward.quantity) then
			if (reward.currencyID == 0) then
				GameTooltip:AddLine(GetMoneyString(reward.quantity), 1, 1, 1)
			else
				local currencyInfo = C_CurrencyInfo.GetBasicCurrencyInfo(reward.currencyID)
				if currencyInfo then
					GameTooltip:AddLine(MakeIcon(currencyInfo.icon)..QualityColorText(" "..currencyInfo.name.." ", currencyInfo.quality or 1)..FLAG_COUNT_TEMPLATE:format(reward.quantity), 1, 1, 1)
				else
					GameTooltip:AddLine(_G.UNKNOWN.." ".._G.CURRENCY.." ("..reward.currencyID..") "..FLAG_COUNT_TEMPLATE:format(reward.quantity), 1, 1, 1)
				end
			end
		else
			GameTooltip:AddLine(reward.title, 1, 1, 1)
		end
	end
end

local function SetupMissionInfoTooltip(item, anchorFrame)

	if _G.CovenantMissionFrame and _G.CovenantMissionFrameFollowers:IsVisible() then
		return
	end

	if anchorFrame then
		GameTooltip:SetOwner(anchorFrame, "ANCHOR_BOTTOMRIGHT", 2, anchorFrame:GetHeight() * 2)
		GameTooltip:ClearLines()
	else
		GameTooltip:ClearLines()
	end

	if ( item.isBuilding ) then
		GameTooltip:SetText(item.name);
		GameTooltip:AddLine(string.format(GARRISON_BUILDING_LEVEL_LABEL_TOOLTIP, item.buildingLevel), 1, 1, 1);
		if(item.isComplete) then
			GameTooltip:AddLine(COMPLETE, 1, 1, 1);
		else
			GameTooltip:AddLine(tostring(item.timeLeft), 1, 1, 1);
		end
		GameTooltip:Show();
		return;
	end

	local isAutoCombatant = item.followerTypeID == GFT.FollowerType_9_0 -- Shadowlands

	GameTooltip:SetText(item.isComplete and ERR_QUEST_OBJECTIVE_COMPLETE_S:format(item.name) or item.name)
	-- level
	local color = item.isRare and ITEM_QUALITY_COLORS[3] or ITEM_QUALITY_COLORS[1]
	if isAutoCombatant then
		GameTooltip:AddLine(format(FORMAT_TOOLTIP_LEVEL, item.missionScalar), color.r, color.g, color.b)
	elseif item.followerTypeID == GFT.FollowerType_6_2 then

	else
		if item.iLevel and item.iLevel > 0 then
			GameTooltip:AddLine(format(FORMAT_TOOLTIP_ITEMLEVEL, item.level, item.iLevel), color.r, color.g, color.b)
		elseif item.level then
			GameTooltip:AddLine(format(FORMAT_TOOLTIP_LEVEL, item.level), color.r, color.g, color.b)
		end
	end
	-- time
	if item.isComplete then
		if item.missionEndTime then
			GameTooltip:AddLine(DATE_COMPLETED:format(date("%a,%H:%M", item.missionEndTime)), 1, 1, 1)
		end
	else
		if item.missionEndTime then
			GameTooltip:AddLine(COMPLETE..": "..date("%a,%H:%M", item.missionEndTime), 1, 1, 1)
		end
	end

	local successChance = item.successChance or item.missionID and C_Garrison.GetMissionSuccessChance(item.missionID)

	if next(item.rewards) then
		GameTooltip:AddLine(" ")
		local caption = REWARDS
		if not isAutoCombatant and successChance then
			caption = caption..(" (%d%%)"):format(math.min(successChance, 100))
		end
		GameTooltip:AddLine(caption)
		AddRewardText(item, "rewards")

		if item.overmaxRewards and next(item.overmaxRewards) and item.hasBonusEffect then
			local caption = BONUS_REWARDS
			if successChance and successChance > 100 then
				caption = caption..(" (%d%%)"):format(successChance - 100)
			end
			GameTooltip:AddLine(caption)
			AddRewardText(item, "overmaxRewards")
		end
	end

	if (item.followers ~= nil) then
		GameTooltip:AddLine(" ");
		GameTooltip:AddLine(isAutoCombatant and _G.COVENANT_MISSIONS_FOLLOWERS or item.followerTypeID == GFT.FollowerType_6_2 and _G.GARRISON_SHIPYARD_FOLLOWERS or _G.GARRISON_FOLLOWERS)
		local id, info
		local leftText, rightText
		local icon
		local followerInfo = item.followerInfo or GetMissionFollowerAbilitiesInfo(item)
		for i = 1, #(item.followers) do
			id = item.followers[i]
			info = type(followerInfo) == "table" and followerInfo[id] or nil
			if type(info) == "table" then
				leftText = nil
				rightText = nil
				if isAutoCombatant then
					leftText = MakeIcon(info.portraitIconID)..QualityColorText(FORMAT_LEVEL:format(info.level), info.quality or 2).." "..info.name
					for i, icon in ipairs(info.abilities) do
						rightText = AddIcon(rightText, icon)
					end
				elseif (info.followerTypeID >= GFT.FollowerType_7_0) and info.abilities then
					leftText = MakeIcon(info.portraitIconID)
					if info.isTroop then
						leftText = leftText.." "..QualityColorText(info.name, info.quality)
					else
						if info.iLevel then
							leftText = leftText..QualityColorText(FORMAT_LEVEL:format(info.iLevel), info.quality or 2)
						end
						leftText = AddIcon(leftText, C_Garrison.GetFollowerAbilityIcon(info.abilities[1]), info.name)
					end
					for i = 2, 6 do
						if info.abilities[i] then
							icon = C_Garrison.GetFollowerAbilityIcon(info.abilities[i])
							if icon then
								rightText = AddIcon(rightText, icon)
							end
						end
					end
				elseif info.followerTypeID == GFT.FollowerType_6_2 then
					leftText = ""
					if type(info.abilities) == "table" then
						for k, abilityID in ipairs(info.abilities) do
							if C_Garrison.GetFollowerAbilityIsTrait(abilityID) then
								leftText = leftText..MakeIcon(C_Garrison.GetFollowerAbilityIcon(abilityID))
							else
								rightText = AddIcon(rightText, C_Garrison.GetFollowerAbilityIcon(abilityID))
							end
						end
					end
					leftText = leftText.." "..QualityColorText(info.name, info.quality or 2)
				else
					leftText = MakeIcon(info.portraitIconID)..QualityColorText(FORMAT_LEVEL:format(info.iLevel or info.level or 0), info.quality or 2).." "..info.name
					if type(info.abilities) == "table" then
						for k, abilityID in ipairs(info.abilities) do
							if type(abilityID) == "number" and not C_Garrison.GetFollowerAbilityIsTrait(abilityID) then
								rightText = MakeIcon(select(3, C_Garrison.GetFollowerAbilityCounterMechanicInfo(abilityID)), rightText)
							end
						end
					end
				end
				GameTooltip:AddDoubleLine(leftText or _G.UNKNOWN, rightText or "", 1, 1, 1, 1, 1, 1)
			else
				GameTooltip:AddLine(_G.UNKNOWN.."."..id, 1, 1, 1)
			end
		end
	end
	return true
	-- GameTooltip:Show();
end

local function GarrisonMissionButton_SetInProgressTooltip(missionInfo, showRewards)
	SetupMissionInfoTooltip(missionInfo)
end

local function FlipTexture(texture, horizontal)
    local ULx,ULy,LLx,LLy,URx,URy,LRx,LRy = texture:GetTexCoord()
    if horizontal then
        texture:SetTexCoord(URx, URy, LRx, LRy, ULx, ULy, LLx, LLy)
    else
        texture:SetTexCoord(LLx, LLy,ULx, ULy, LRx, LRy, URx, URy)
    end
end

-- local function ListScroll_OnScroll(self)
-- 	if GameTooltip:IsVisible() then
-- 		GameTooltip:Hide()
-- 		for k, button in pairs(InProgressMissions.listScroll.buttons) do
-- 			if button:IsVisible() and button:IsMouseOver() then
-- 				GarrisonLandingPageReportMission_OnEnter(button)
-- 				break
-- 			end
-- 		end
-- 	end
-- end

local function CreateQuantityFont()
	if not _G.GarrisonReportFontRewardQuantity then
		local font = CreateFont("GarrisonReportFontRewardQuantity")
		local name, height, flags = _G.NumberFontNormalSmall:GetFont()
		if flags then
			local t = {}
			for w in string.gmatch(flags, "%s*(%a+),?") do
				if w ~= "MONOCHROME" then tinsert(t, w) end
			end
			flags = table.concat(t, ", ")
		end
		font:SetFont(name, 11.5, flags)
	end
end

local function MissionButton_GetMission(button)
	return button:GetElementData()
	-- local elementData = button:GetElementData()
	-- if type(elementData) == "number" then
	-- 	return GarrisonLandingPageReportList.items[elementData]
	-- else
	-- 	return elementData
	-- end
end

local function MissionButton_OnShow(button)
	MissionButton_SetLayout(button, GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.InProgress)
end

local function MissionButton_OnEnter(button, mouseButton)
	if GarrisonLandingPageReport.selectedTab ~= GarrisonLandingPageReport.InProgress then
		return GarrisonLandingPageReportMission_OnEnter(button, mouseButton)
	end

	local item = button:GetMission()
	if not item then return end
	if SetupMissionInfoTooltip(item, button) then
		if button.UpdateTooltip then
			button.UpdateTooltip = nil
		else
			button.UpdateTooltip = MissionButton_OnEnter
		end
		GameTooltip:Show()
	end
end

local function MissionButton_OnClick(button, mouseButton)
	if mouseButton == "LeftButton" and IsModifiedClick("CHATLINK") then
		local item = button:GetMission()
		if not item then return end
		local missionLink = C_Garrison.GetMissionLink(item.missionID);
		if missionLink then
			ChatEdit_InsertLink(missionLink);
		end
	end
end

local function MissionButton_OnMouseUp(button, mouseButton)
	if GarrisonLandingPageReport.selectedTab ~= GarrisonLandingPageReport.InProgress then return end

	if mouseButton == "RightButton" then
		InProgressMissions:CreateMenu()
		local anchor = InProgressMissions.scrollBox
		local uiScale, x, y = _G.UIParent:GetEffectiveScale(), GetCursorPosition()
		ToggleDropDownMenu(1, nil, InProgressMissions.menu, anchor:GetName(), x / uiScale - 35, y / uiScale - 5)
	end
end

local function MissionButtonReward_OnEnter(frame)
	if (frame.bonusAbilityID) then
		frame.UpdateTooltip = nil;
		local tooltip = GarrisonBonusAreaTooltip;
		GarrisonBonusArea_Set(tooltip.BonusArea, GARRISON_BONUS_EFFECT_TIME_ACTIVE, frame.bonusAbilityDuration, frame.bonusAbilityIcon, frame.bonusAbilityName, frame.bonusAbilityDescription);
		tooltip:ClearAllPoints();
		tooltip:SetPoint("BOTTOMLEFT", frame, "TOPRIGHT");
		tooltip:SetHeight(tooltip.BonusArea:GetHeight());
		tooltip:Show();
		return;
	end

	local info = frame.info or frame
	if info then
		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
		frame.UpdateTooltip = MissionButtonReward_OnEnter
		if info.itemLink then
			GameTooltip:SetHyperlink(info.itemLink)
		elseif info.itemID then
			GameTooltip:SetItemByID(info.itemID)
		elseif info.currencyID then
			if info.currencyID > 0 then
				GameTooltip:SetCurrencyByID(info.currencyID)
			else -- Money
				GameTooltip:SetText(info.title)
				GameTooltip:AddLine(GetMoneyString(info.quantity), 1, 1, 1)
				GameTooltip:Show()
			end
		else
			if info.title then
				GameTooltip:SetText(info.title)
			end
			if info.tooltip then
				GameTooltip:AddLine(info.tooltip, 1, 1, 1, true)
			end
			GameTooltip:Show()
		end
	end
end

local function MissionButtonReward_OnLeave(frame)
	frame.UpdateTooltip = nil
	GarrisonBonusAreaTooltip:Hide()
	GameTooltip:Hide()
end

function InProgressMissions:MissionButton_OnLoad(button)
	button.MissionTypeBG = button:CreateTexture(nil, "BACKGROUND", "Spellbook-TextBackground", 1)
	button.MissionTypeBG:ClearAllPoints()
	button.MissionTypeBG:SetPoint("TOPLEFT", button.MissionType, -5, 4)
	button.MissionTypeBG:SetPoint("BOTTOMLEFT", button.MissionType, -5, -2)
	button.MissionTypeBG:SetWidth(130)
	button.MissionTypeBG:SetBlendMode("BLEND")
	button.MissionTypeBG:SetVertexColor(0, 0, 0, 0.6)
	for i, reward in ipairs(button.Rewards) do
		reward:SetScript("OnEnter", MissionButtonReward_OnEnter)
		reward:SetScript("OnLeave", MissionButtonReward_OnLeave)
	end
	FlipTexture(button.MissionTypeBG)

	CreateQuantityFont()
	for i, reward in ipairs(button.Rewards) do
		reward.Quantity:SetFontObject("GarrisonReportFontRewardQuantity")
		reward.Success:SetFontObject("GarrisonReportFontRewardQuantity")
	end

	button.GetMission = MissionButton_GetMission
	button:SetScript("OnShow", MissionButton_OnShow)
	button:SetScript("OnEnter", MissionButton_OnEnter)
	button:SetScript("OnLeave", MissionButtonReward_OnLeave)
	button:SetScript("OnMouseUp", MissionButton_OnMouseUp)
	button:SetScript("OnClick", MissionButton_OnClick)
end

local function UpdateItemInfoHandler(self, ...)
	if InProgressMissions.scrollBox:IsVisible() then
		InProgressMissions:RegisterEvent("GET_ITEM_INFO_RECEIVED")
	else
		InProgressMissions:UnregisterEvent("GET_ITEM_INFO_RECEIVED")
	end
end

function InProgressMissions:UpdateInProgressTabText()
	if GarrisonLandingPageReport then
		local text = GarrisonLandingPageReport.InProgress.Text
		text:SetText((_G.GARRISON_LANDING_IN_PROGRESS.." (%d)"):format(#self.missions, #self.altMissions))
	end
end

function InProgressMissions:Refresh()
	if GarrisonLandingPageReport and GarrisonLandingPageReport:IsVisible() then
		GarrisonLandingPageReportList_UpdateItems()
	end
end

do
	function InProgressMissions:HideMenu()
		if _G.UIDROPDOWNMENU_OPEN_MENU == InProgressMissions.menu then
			--GameTooltip:Hide()
			CloseDropDownMenus()
		end
	end

	local function IgnoreProfile_OnClick(self, name, arg2, checked)
		InProgressMissions:HideMenu()

		if name then
			IPMDB.ignores[name] = not checked or nil
			InProgressMissions:UpdateAltMissions()
			InProgressMissions:Refresh()
		end
	end

	local function SortMethod_OnClick(self, name)
		InProgressMissions:HideMenu()

		if name then
			IPMDB.sortMethod = name
			InProgressMissions:UpdateAltMissions()
			InProgressMissions:Refresh()
		end
	end

	local function ResetProfiles()
		IPMDB.sortMethod = nil
		wipe(IPMDB.ignores)
		wipe(IPMDB.profiles)
		InProgressMissions:UpdateAltMissions()
		InProgressMissions:Refresh()
	end

	local function Reset_OnClick(self)
		if not _G.StaticPopupDialogs["InProgressMissions_CONFIRM_RESET"] then
			_G.StaticPopupDialogs["InProgressMissions_CONFIRM_RESET"] = {
				text = CONFIRM_CONTINUE,
				button1 = _G.YES,
				button2 = _G.CANCEL,
				OnAccept = ResetProfiles,
				hideOnEscape = true,
				timeout = 30,
				whileDead = true,
			}
		end
		StaticPopup_Show("InProgressMissions_CONFIRM_RESET")
	end

	local function ToggleGarrisonMissions(self)
		IPMDB.enableGarrisonMissions = not IPMDB.enableGarrisonMissions
		InProgressMissions:UpdateAltMissions()
		InProgressMissions:Refresh()
	end

	local function ToggleLegionMissions(self)
		IPMDB.enableLegionMissions = not IPMDB.enableLegionMissions
		InProgressMissions:UpdateAltMissions()
		InProgressMissions:Refresh()
	end

	local function ToggleBfaMissions(self)
		IPMDB.enableBfaMissions = not IPMDB.enableBfaMissions
		InProgressMissions:UpdateAltMissions()
		InProgressMissions:Refresh()
	end

	function InProgressMissions:CreateMenu()
		if self.menu then return end
		self.menu = CreateFrame("Frame", "InProgressMissionsDropDownList")
		self.menu.displayMode = "MENU"
		local info = {}

		self.menu.initialize = function(self, level)
			if not level then return end
			GameTooltip:Hide()
			wipe(info)
			if level == 1 then
				info.isTitle = true
				info.text = "In Progress Missions"
				info.notCheckable = true
				UIDropDownMenu_AddButton(info, level)

				info.disabled = nil
				info.isTitle = nil
				info.checked = nil
				info.notCheckable = true

				info.text = _G.RAID_FRAME_SORT_LABEL
				info.hasArrow = true
				info.value = "submenuSort"
				info.keepShownOnClick = true
				UIDropDownMenu_AddButton(info, level)
				info.hasArrow = nil

				info.text = _G.IGNORE
				info.hasArrow = true
				info.value = "submenuIgnore"
				info.keepShownOnClick = true
				UIDropDownMenu_AddButton(info, level)
				info.hasArrow = nil

				info.keepShownOnClick = nil

				info.isTitle = true
				info.text = _G.UNIT_FRAME_DROPDOWN_SUBSECTION_TITLE_OTHER
				info.func = nil
				UIDropDownMenu_AddButton(info, level)

				info.isTitle = nil
				info.disabled = nil
				info.notClickable = nil

				info.notCheckable = nil
				info.isNotRadio = true
				info.text = TEXT_BFA_MISSIONS
				info.func = ToggleBfaMissions
				info.checked = IPMDB.enableBfaMissions and true or nil
				UIDropDownMenu_AddButton(info, level)

				info.notCheckable = nil
				info.isNotRadio = true
				info.text = TEXT_LEGION_MISSIONS
				info.func = ToggleLegionMissions
				info.checked = IPMDB.enableLegionMissions and true or nil
				UIDropDownMenu_AddButton(info, level)

				info.notCheckable = nil
				info.isNotRadio = true
				info.text = _G.GARRISON_MISSIONS_TITLE
				info.func = ToggleGarrisonMissions
				info.checked = IPMDB.enableGarrisonMissions and true or nil
				UIDropDownMenu_AddButton(info, level)

				info.notCheckable = true
				info.text = _G.RESET
				info.func = Reset_OnClick
				UIDropDownMenu_AddButton(info, level)

				info.text = _G.CLOSE
				info.func = InProgressMissions.HideMenu
				UIDropDownMenu_AddButton(info, level)

			elseif level == 2 then
				info.disabled = nil
				info.isTitle = nil
				info.notCheckable = nil
				if UIDROPDOWNMENU_MENU_VALUE == "submenuSort" then
					info.isNotRadio = nil

					info.text = _G.CHARACTER_NAME_PROMPT
					info.func = SortMethod_OnClick
					info.checked = (IPMDB.sortMethod == "name" or IPMDB.sortMethod == nil) and true or nil
					info.arg1 = "name"
					UIDropDownMenu_AddButton(info, level)

					info.text = _G.CLOSES_IN
					info.func = SortMethod_OnClick
					info.checked = IPMDB.sortMethod == "time" and true or nil
					info.arg1 = "time"
					UIDropDownMenu_AddButton(info, level)
				elseif UIDROPDOWNMENU_MENU_VALUE == "submenuIgnore" then
					info.isNotRadio = true

					for name, profile in pairs(IPMDB.profiles) do
						if profile[1] then
							info.text = profile[1].charText or name
							info.func = IgnoreProfile_OnClick
							info.checked = IPMDB.ignores[name] and true or nil
							info.arg1 = name
							UIDropDownMenu_AddButton(info, level)
						end
					end
				end
			end
		end
	end
end

function InProgressMissions:Init()
	GarrisonLandingPageReport = _G.GarrisonLandingPageReport
	GarrisonLandingPageReportList = _G.GarrisonLandingPageReportList
	self.missions = {}
	self:InitDB()
	TIME_COLORS = {
		{RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b}, -- ERROR
		{0.55, 0.55, 0.55}, -- DARK(VERY LONG)
		{0.8, 0.8, 0.76}, -- NORMAL
		{GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b}, -- GREEN(MEDIUM)
		{YELLOW_FONT_COLOR.r, YELLOW_FONT_COLOR.g, YELLOW_FONT_COLOR.b}, -- YELLOW(SHORT)
		{ORANGE_FONT_COLOR.r, ORANGE_FONT_COLOR.g, ORANGE_FONT_COLOR.b}, -- ORANGE(VERY SHORT)
	}
	self:UpdateAltMissions()

	self:CreateMenu()
	GarrisonLandingPageReport:HookScript("OnHide", function()
		InProgressMissions:HideMenu()
		wipe(InProgressMissions.missions)
		StaticPopup_Hide("InProgressMissions_CONFIRM_RESET")
	end)

	self.scrollBox = GarrisonLandingPageReportList.ScrollBox

	GarrisonLandingPageReport_SetElementInitializer()
	_G.GarrisonLandingPageReportList_InitButton = MissionButton_Update
	_G.GarrisonLandingPageReportList_Update = GarrisonLandingPageReportList_Update
	_G.GarrisonLandingPageReportList_UpdateItems = GarrisonLandingPageReportList_UpdateItems

	self.scrollBox:HookScript("OnShow", UpdateItemInfoHandler)
	self.scrollBox:HookScript("OnHide", UpdateItemInfoHandler)
	UpdateItemInfoHandler()

	GarrisonLandingPageReportList.ScrollBox:HookScript("OnMouseUp", function(frame, button)
		if button == "RightButton" then
			MissionButton_OnMouseUp(frame, button)
		end
	end)

	-- self:HookOrderHallMissionFrame()
	-- self:HookBFAMissionFrame()
	self:HookCovenantMissionFrame()

	self.Init = function() end
end

local buttonText = {}

local function CreateButtonText(button)
	local text = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	text:SetPoint("BOTTOMLEFT", 165, 6)
	text:SetJustifyH("LEFT")
	buttonText[button] = text
	return text
end

local function GarrisonMissionFrameMissionButton_SetExpiresText(button, info)
	if InProgressMissions:OrderHallAddonExists() then return end

	local text = buttonText[button] or CreateButtonText(button)
	if info then
		local expire = not info.inProgress and info.offerEndTime and RAID_INSTANCE_EXPIRES:format(info.offerTimeRemaining) or nil
		if info.xp then
			expire = QualityColorText(GARRISON_REWARD_XP_FORMAT:format(info.xp), 1).." "..(expire or "")
		end
		-- text:SetText(info.offerEndTime and RAID_INSTANCE_EXPIRES:format(info.offerTimeRemaining) or nil)
		text:SetText(expire)
		text:Show()
	else
		text:Hide()
	end
end

function InProgressMissions:HookOrderHallMissionFrame()
	if _G.OrderHallMissionFrameMissionsListScrollFrame and not self.OrderHallMissionsScrollFrame then
		self.OrderHallMissionsScrollFrame = _G.OrderHallMissionFrameMissionsListScrollFrame
		hooksecurefunc(_G.OrderHallMissionFrame.MissionTab.MissionList, "Update", function()
			MissionsScrollFrame_SetExpiresText(self.OrderHallMissionsScrollFrame)
		end)
	end
end

function InProgressMissions:HookBFAMissionFrame()
	if _G.BFAMissionFrameMissionsListScrollFrame and not self.BFAMissionsScrollFrame then
		self.BFAMissionsScrollFrame = _G.BFAMissionFrameMissionsListScrollFrame
		hooksecurefunc(_G.BFAMissionFrame.MissionTab.MissionList, "Update", function()
			MissionsScrollFrame_SetExpiresText(self.BFAMissionsScrollFrame)
		end)
	end
end

local function CovenantMissionFrameMissionsButton_OnEnter(button)
	local item = button:GetElementData()
	if not item then return end

	_G.CovenantMissionButton_OnEnter(button)

	if item.inProgress or item.canBeCompleted then
		if SetupMissionInfoTooltip(item) then

			GameTooltip:Show()
		end
	end
end

local function CovenantMissionFrameMissionButtonRewards_SetStyle(button, item)
	local rAnchor
	for j, reward in ipairs(button.Rewards) do
		if reward:IsShown() then
			reward:SetScale(0.75)
			reward:ClearAllPoints()
			if j == 1 then
				reward:SetPoint("RIGHT", button, "RIGHT", -30, 0)
			elseif rAnchor then -- j > 1
				reward:SetPoint("RIGHT", rAnchor, "LEFT", 10, 0)
			end
			rAnchor = reward
		end
	end
	local expireText = buttonText[button]
	if expireText then
		expireText:ClearAllPoints()
		expireText:SetPoint("BOTTOM", 0, 7)
		if rAnchor then
			expireText:SetPoint("RIGHT", rAnchor, "LEFT", -2, 0)
		else
			expireText:SetPoint("RIGHT", button, "RIGHT", -35, 0)
		end
	end
end


local function CovenantMissionFrameMissionButton_SetStyle(button, item)
	button:SetHeight(COVENANTMISSION_BUTTONHEIGHT)
	button.ButtonBG:ClearAllPoints()
	button.ButtonBG:SetPoint("TOPLEFT", 0, 0)
	button.ButtonBG:SetPoint("BOTTOMRIGHT", 0, 0)
	button.Highlight:ClearAllPoints()
	button.Highlight:SetPoint("TOPLEFT", 0, 0)
	button.Highlight:SetPoint("BOTTOMRIGHT", 0, 0)
	button.Level:ClearAllPoints()
	button.Level:SetPoint("CENTER", button, "LEFT", 40, 0)
	button.Level:SetScale(0.9)
	button.EncounterIcon:ClearAllPoints()
	button.EncounterIcon:SetPoint("CENTER", button, "LEFT", 110, 0)
	button.EncounterIcon:SetScale(0.8)
	button.Title:SetScale(0.9)
	button.Summary:SetScale(0.85)
	button:SetScript("OnEnter", CovenantMissionFrameMissionsButton_OnEnter)
end

do -- CovenantMissionFrame Smooth Scroll
	local SCROLL_MULTIPLIER = 4
	local SCROLL_MAX = 9
	local function CovenantMissionFrame_OnMouseWheel(self, delta, ...)
		if delta == 1 or delta == -1 then
			delta = SCROLL_MULTIPLIER * delta
		end
		delta = (self.scrollBar.doScroll or 0) + delta
		if delta > SCROLL_MAX then delta = SCROLL_MAX end
		if delta < -SCROLL_MAX then delta = -SCROLL_MAX end
		self.scrollBar.doScroll = delta
	end

	local function CovenantMissionFrameScrollBar_OnUpdate(self, _, doubleScroll)
		if not self.doScroll or self.doScroll == 0 then return end
		if self.doScroll > 0 then
			HybridScrollFrame_OnMouseWheel(InProgressMissions.CovenantMissionsScrollFrame, 1)
			self.doScroll = self.doScroll - 1
		else
			HybridScrollFrame_OnMouseWheel(InProgressMissions.CovenantMissionsScrollFrame, -1)
			self.doScroll = self.doScroll + 1
		end
		if not doubleScroll and abs(self.doScroll) > SCROLL_MULTIPLIER then
			return CovenantMissionFrameScrollBar_OnUpdate(self, nil, true)
		end
	end

	function InProgressMissions:CovenantMissionFrame_EnableSmoothScroll()
		self.CovenantMissionsScrollFrame.scrollBar:SetValueStep(9)
		self.CovenantMissionsScrollFrame.stepSize = 9
		self.CovenantMissionsScrollFrame:SetScript("OnMouseWheel", CovenantMissionFrame_OnMouseWheel)
		self.CovenantMissionsScrollFrame.scrollBar:SetScript("OnUpdate", CovenantMissionFrameScrollBar_OnUpdate)
		self.CovenantMissionsScrollFrame:HookScript("OnHide", function(self) self.scrollBar.doScroll = 0 end)
	end
end

local function CovenantMissionFrame_ShowMission(frame, info)
	for i, button in ipairs(InProgressMissions.CovenantMissionRewards) do
		local reward = info.rewards[i]
		button.info = reward
		if reward then
			button:SetMouseMotionEnabled(true)
			button:SetAlpha(1)
			button.iconBorder:Hide()
			if reward.itemID then
				local name, _, rarity, _, _, _, _, _, _, icon = GetItemInfo(reward.itemLink or reward.itemID)
				button.icon:SetTexture(icon)
				local color = BAG_ITEM_QUALITY_COLORS[rarity] or BAG_ITEM_QUALITY_COLORS[1]
				button.iconBorder:SetVertexColor(color.r, color.g, color.b)
				button.iconBorder:Show()
			elseif reward.currencyID and reward.currencyID > 0 then
				local currencyName, currencyTexture, currencyQuantity, currencyQuality = CurrencyContainerUtil.GetCurrencyContainerInfo(reward.currencyID, reward.quantity, reward.title, reward.icon, nil)
				button.icon:SetTexture(currencyTexture)
				local color = BAG_ITEM_QUALITY_COLORS[currencyQuality] or BAG_ITEM_QUALITY_COLORS[1]
				button.iconBorder:SetVertexColor(color.r, color.g, color.b)
				button.iconBorder:Show()
			else
				button.icon:SetTexture(reward.icon or nil)
			end
		else
			button:SetMouseMotionEnabled(false)
			button:SetAlpha(0)
		end
	end
end

function InProgressMissions:CovenantMissionAddRewardsIcons()
	if not _G.CovenantMissionFrame.MissionTab.MissionPage then return end
	self.CovenantMissionPage = _G.CovenantMissionFrame.MissionTab.MissionPage
	local titleText = self.CovenantMissionPage.Stage.Title
	self.CovenantMissionRewards = {}
	local reward
	reward = CreateFrame("Frame", nil, self.CovenantMissionPage.Stage.MouseOverTitleFrame)
	reward:SetScript("OnEnter", MissionButtonReward_OnEnter)
	reward:SetScript("OnLeave", MissionButtonReward_OnLeave)
	reward:SetPoint("BOTTOMRIGHT", titleText, "BOTTOMRIGHT", 0, -6)
	reward:SetSize(20, 20)
	reward.icon = reward:CreateTexture(nil, "ARTWORK", nil, 6)
	reward.icon:SetAllPoints()
	reward.iconBorder = reward:CreateTexture(nil, "ARTWORK", nil, 7)
	reward.iconBorder:SetAllPoints()
	reward.iconBorder:SetTexture("Interface\\Common\\WhiteIconFrame")
	self.CovenantMissionRewards[1] = reward
	reward = CreateFrame("Frame", nil, self.CovenantMissionPage.Stage.MouseOverTitleFrame)
	reward:SetScript("OnEnter", MissionButtonReward_OnEnter)
	reward:SetScript("OnLeave", MissionButtonReward_OnLeave)
	reward:SetPoint("BOTTOMRIGHT", self.CovenantMissionRewards[1], "BOTTOMLEFT", -3, 0)
	reward:SetSize(20, 20)
	reward.icon = reward:CreateTexture(nil, nil, nil, 6)
	reward.icon:SetAllPoints()
	reward.iconBorder = reward:CreateTexture(nil, "ARTWORK", nil, 7)
	reward.iconBorder:SetAllPoints()
	reward.iconBorder:SetTexture("Interface\\Common\\WhiteIconFrame")
	self.CovenantMissionRewards[2] = reward
end

function InProgressMissions:HookCovenantMissionFrame()
	if _G.CovenantMissionFrame then
		if IPMDB.improveCovenantMissionUI or IPMDB.improveCovenantMissionUI == nil then
			local function InitializedFrame(_, button, elementData)
				if not button.ipm then
					button.ipm = true
					CovenantMissionFrameMissionButton_SetStyle(button, elementData)
				end
				GarrisonMissionFrameMissionButton_SetExpiresText(button, elementData)
				CovenantMissionFrameMissionButtonRewards_SetStyle(button, elementData)
			end
			_G.CovenantMissionFrameMissions.ScrollBox:RegisterCallback("OnInitializedFrame", InitializedFrame, self)

			local view = _G.CovenantMissionFrameMissions.ScrollBox:GetView()
			view.elementExtent = COVENANTMISSION_BUTTONHEIGHT
			view.templateInfos["CovenantMissionListButtonTemplate"].height = view.elementExtent
			view.templateInfos["CovenantMissionListButtonTemplate"].extent = view.elementExtent

			_G.CovenantMissionFrameMissions.ScrollBox.wheelPanScalar = 1.5
			_G.CovenantMissionFrameMissions.ScrollBar.wheelPanScalar = 1.5
		end
		self:CovenantMissionAddRewardsIcons()
		hooksecurefunc(_G.CovenantMissionFrame, "ShowMission", CovenantMissionFrame_ShowMission)
	end
end

function InProgressMissions:OrderHallAddonExists()
	for k, v in pairs(ORDERHALL_ADDONS) do
		if v then
			return true
		end
	end
end

function events:ADDON_LOADED(event, name, ...)
	if name == "Blizzard_GarrisonUI" then
		self:Init()
	elseif name == "GarrisonMaster" then
		if _G.GarrisonLandingPageReportList then
			self:Init()
		end
	elseif name == "Blizzard_OrderHallUI" then
		-- self:HookOrderHallMissionFrame()
	elseif name and ORDERHALL_ADDONS[name] ~= nil then
		ORDERHALL_ADDONS[name] = true
	end
end

local function OnMissionUpdate()
	InProgressMissions.missionUpdated = false
	InProgressMissions:SaveInProgressMissions()
	InProgressMissions:Refresh()
end

function InProgressMissions:QueueSaveInProgressMissions(value)
	if not self.missionUpdated then
		self.missionUpdated = true
		C_Timer.After(value or 0.5, OnMissionUpdate)
	end
end

function events:GARRISON_MISSION_STARTED(event, ...)
	self:QueueSaveInProgressMissions()
end

function events:GARRISON_MISSION_COMPLETE_RESPONSE(event, ...)
	self:QueueSaveInProgressMissions()
end

function events:PLAYER_LOGIN(event, ...)
	self:UnregisterEvent(event)
	self:RegisterEvent("GARRISON_MISSION_LIST_UPDATE")
	C_Timer.After(5, function()
		if not self.saved then
			self:SaveInProgressMissions()
		end
	end)
end

function events:PLAYER_ENTERING_WORLD(event, ...)
	for k, v in pairs(ORDERHALL_ADDONS) do
		ORDERHALL_ADDONS[k] = IsAddOnLoaded(k)
	end
end

function InProgressMissions:GARRISON_MISSION_LIST_UPDATE(event, ...)
	self:QueueSaveInProgressMissions()
end

function InProgressMissions:GET_ITEM_INFO_RECEIVED(event, ...)
	if not GarrisonLandingPageReport:IsShown() then return end
	local items
	local selectedTab = GarrisonLandingPageReport.selectedTab
	if selectedTab == GarrisonLandingPageReport.InProgress then
		items = GarrisonLandingPageReportList.items
	elseif selectedTab == GarrisonLandingPageReport.Available then
		items = GarrisonLandingPageReportList.AvailableItems
	end
	if not items then return end

	local elementData
	for _, button in pairs(InProgressMissions.scrollBox:GetView():GetFrames()) do
		Rewards_Update(button, button:GetMission())
	end
end

InProgressMissions.frame:SetScript("OnEvent", function(self, event, ...)
	-- if event ~= "ADDON_LOADED" then print(GetTime(), event, ...) end
	events[event](InProgressMissions, event, ...)
end)

for event, func in pairs(events) do
	if type(func) == "function" then
		InProgressMissions.frame:RegisterEvent(event)
	end
end

function InProgressMissions:RegisterEvent(event, handler)
	handler = handler or events[event] or InProgressMissions[event]
	if handler then
		events[event] = handler
		InProgressMissions.frame:RegisterEvent(event)
	end
end

function InProgressMissions:UnregisterEvent(event)
	InProgressMissions.frame:UnregisterEvent(event)
end

local function SlashCommandHandler(msg)
	if not msg or msg:len() == 0 then
		local GarrisonID = C_Garrison.GetLandingPageGarrisonType()
		if GarrisonID >= Enum.GarrisonType.Type_6_0 then
			if C_Covenants.GetActiveCovenantID() > 0 then
				_G.GarrisonLandingPageMinimapButton:Click()
			else
				if GarrisonID >= _G.Enum.GarrisonType.Type_9_0 then
					GarrisonID = _G.Enum.GarrisonType.Type_8_0
				end
				ShowGarrisonLandingPage(GarrisonID)
			end
		else -- no Garrison
			for char, missions in pairs(IPMDB.profiles) do
				print("=====", (missions[1] and missions[1].charText) or char, "=====")
				for k, m in pairs(missions) do
					if type(m) == "table" then
						print(("[%03d] %s"):format(m.level, m.name), "-", date("%a,%H:%M", m.missionEndTime), (time() - m.missionEndTime) > 0 and "(".._G.COMPLETE..")" or "")
					end
				end
			end
		end
	else
		msg = msg:lower()
		if msg == "covenantui" then
			IPMDB.improveCovenantMissionUI = not IPMDB.improveCovenantMissionUI
			print(YELLOW_FONT_COLOR:WrapTextInColorCode("[InProgressMissions]"), RED_FONT_COLOR:WrapTextInColorCode(_G.REQUIRES_RELOAD))
		else
			print(YELLOW_FONT_COLOR:WrapTextInColorCode("[InProgressMissions]"), ORANGE_FONT_COLOR:WrapTextInColorCode("Unknown command:"), msg)
		end
	end
end

do
	InProgressMissions.profileName = UnitName("player").."-"..GetRealmName()
	local colorStr = RAID_CLASS_COLORS[select(2, UnitClass("player")) or "WARRIOR"].colorStr
	InProgressMissions.playerNameText = "|c"..colorStr..UnitName("player").."|r"
	InProgressMissions.alertMissions = {}

	SlashCmdList["InProgressMissions"] = SlashCommandHandler
	_G["SLASH_InProgressMissions1"] = "/ipm"
	_G["SLASH_InProgressMissions2"] = "/inprogressmissions"
end

do
	alertFrames = {}

	local function AlertFrameReward_OnEnter(frame, ...)
		if InCombatLockdown() then return end
		-- AlertFrame_StopOutAnimation(frame:GetParent())
		if frame.info then
			GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
			if frame.info.itemID then
				GameTooltip:SetItemByID(frame.info.itemID)
			elseif frame.info.currencyID and frame.info.quantity then
				GameTooltip:SetText(frame.info.title or _G.UNKNOWN)
				if frame.info.currencyID == 0 then
					GameTooltip:AddLine(GetMoneyString(frame.info.quantity), 1, 1, 1)
				else
					local currencyTexture = C_CurrencyInfo.GetBasicCurrencyInfo(frame.info.currencyID).icon
					GameTooltip:AddLine(BreakUpLargeNumbers(frame.info.quantity).." |T"..currencyTexture..":0:0:0:-1:64:64:2:62:2:62|t ", 1, 1, 1)
				end
				-- GameTooltip:Show()
			elseif frame.info.tooltip then
				GameTooltip:AddLine(frame.info.tooltip, 1, 1, 1, true)
				-- GameTooltip:Show()
			elseif frame.info.title then
				GameTooltip:SetText(frame.info.title)
				-- GameTooltip:Show()
			end
			if frame.info.successChance then
				local color = BAG_ITEM_QUALITY_COLORS[Enum.ItemQuality.WoWToken]
				GameTooltip:AddLine((_G.SUCCESS..": %d%%"):format(frame.info.successChance), color.r, color.g, color.b)
			end
			GameTooltip:Show()
		end
	end

	local function AlertFrameReward_OnLeave(frame, ...)
		if not frame:GetParent():IsMouseOver() then
			AlertFrame_ResumeOutAnimation(frame:GetParent())
		end
		GameTooltip:Hide()
	end

	local function AlertFrame_OnHide(frame)
		local ex = alertFrames[frame]
		if ex then
			ex.level:Hide()
			frame.Name:SetTextColor(ITEM_QUALITY_COLORS[1].r, ITEM_QUALITY_COLORS[1].g, ITEM_QUALITY_COLORS[1].b)
			ex.reward1:SetPoint("RIGHT", -28, 0)
			ex.reward1:Hide()
			ex.reward2:Hide()
			for i = 1, 3 do
				ex.followers[i].icon:Hide()
				ex.followers[i].ring:Hide()
			end
		end
	end

	local function AlertFrame_OnEvent(frame, event, arg1, arg2)
		if event == "GET_ITEM_INFO_RECEIVED" then
			local ex = alertFrames[frame]
			if ex then
				if ex.reward1.info and ex.reward1.info.itemID == arg1 then
					local texture = select(10, GetItemInfo(ex.reward1.info.itemID))
					ex.reward1.icon:SetTexture(texture)
					ex.reward1:SetShown(texture)
				end
				if ex.reward2.info and ex.reward2.info.itemID == arg1 then
					local texture = select(10, GetItemInfo(ex.reward2.info.itemID))
					ex.reward2.icon:SetTexture(texture)
					ex.reward2:SetShown(texture)
				end
			end
		end
	end

	local function MissionAlert_SetReward(info, frame, successChance)
		local texture = info.icon
		-- frame.itemID = info.itemID
		frame.info = info
		frame.info.successChance = successChance
		if info.itemID then
			texture = select(10, GetItemInfo(info.itemID))
		end
		frame.icon:SetTexture(texture)
		frame:SetShown(texture)
	end

	local function AlertFrame_Init(frame)
		if not alertFrames[frame] then
			local ex = {}
			ex.level = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge2")
			ex.level:SetPoint("CENTER", frame.MissionType, 0, 0)
			ex.level:SetTextColor(unpack(TITLE_COLOR_NORMAL))
			ex.reward1 = CreateFrame("Frame", nil, frame)
			ex.reward1:SetPoint("BOTTOM", frame.Title, "BOTTOM", 0, 1)
			ex.reward1:SetPoint("RIGHT", -28, 0)
			ex.reward1:SetSize(24, 24)
			ex.reward1.icon = ex.reward1:CreateTexture(nil, nil, nil, 7)
			ex.reward1.icon:SetAllPoints()
			ex.reward1.bg = ex.reward1:CreateTexture(nil, nil, nil, 6)
			ex.reward1.bg:SetAtlas("GarrLanding_RewardsShadow")
			ex.reward1.bg:SetPoint("CENTER", ex.reward1, 0, 0)
			ex.reward1.bg:SetSize(30, 30)
			ex.reward2 = CreateFrame("Frame", nil, frame)
			ex.reward2:SetPoint("LEFT", ex.reward1, "RIGHT", 4, 0)
			ex.reward2:SetSize(ex.reward1:GetSize())
			ex.reward2.icon = ex.reward2:CreateTexture(nil, nil, nil, 7)
			ex.reward2.icon:SetAllPoints()
			ex.reward2.bg = ex.reward2:CreateTexture(nil, nil, nil, 6)
			ex.reward2.bg:SetAtlas("GarrLanding_RewardsShadow")
			ex.reward2.bg:SetPoint("CENTER", ex.reward2, 0, 0)
			ex.reward2.bg:SetSize(30, 30)
			ex.followers = {}
			local follower
			for i = 1, 3 do
				follower = {}
				follower.icon = frame:CreateTexture(nil, nil, nil, 6)
				follower.icon:SetPoint("BOTTOMRIGHT", -120 + (i * 30), - 2)
				follower.icon:SetSize(24, 24)
				follower.ring = frame:CreateTexture(nil, nil, nil, 7)
				follower.ring:SetPoint("CENTER", follower.icon, 0, 0)
				follower.ring:SetSize(40, 40)
				follower.ring:SetTexture(522972)
				follower.ring:SetTexCoord(0.72656250, 0.81445313, 0.02246094, 0.06542969)
				ex.followers[i] = follower
			end
			if frame:GetScript("OnEvent") then
				frame:HookScript("OnEvent", AlertFrame_OnEvent)
			else
				frame:SetScript("OnEvent", AlertFrame_OnEvent)
			end
			if frame:GetScript("OnHide") then
				frame:HookScript("OnHide", AlertFrame_OnHide)
			else
				frame:SetScript("OnHide", AlertFrame_OnHide)
			end
			frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
			ex.reward1:SetScript("OnEnter", AlertFrameReward_OnEnter)
			ex.reward1:SetScript("OnLeave", AlertFrameReward_OnLeave)
			ex.reward2:SetScript("OnEnter", AlertFrameReward_OnEnter)
			ex.reward2:SetScript("OnLeave", AlertFrameReward_OnLeave)
			alertFrames[frame] = ex
		end
		return alertFrames[frame]
	end

	local function MissionAlert_OnSetup(frame, info)
		if type(info) == "number" then -- 7.0.3
			info = C_Garrison.GetBasicMissionInfo(info)
		end
		local ex = AlertFrame_Init(frame)
		AlertFrame_OnHide(frame)
		if not ex then return end
		if info then
			if info.followerTypeID == GFT.FollowerType_9_0 then
				return
			end
			info.successChance = info.missionID and C_Garrison.GetMissionSuccessChance(info.missionID) or 100
			frame.Title:SetText(GARRISON_MISSION_COMPLETE)
			if info.isArtifact then
				frame.Title:SetText(GARRISON_TALENT_RESEARCH_COMPLETE)
				frame.MissionType:SetTexture(info.typeIcon)
				frame.Name:SetTextColor(ITEM_QUALITY_COLORS[6].r, ITEM_QUALITY_COLORS[6].g, ITEM_QUALITY_COLORS[6].b)
			elseif info.isRare then
				frame.Name:SetTextColor(ITEM_QUALITY_COLORS[3].r, ITEM_QUALITY_COLORS[3].g, ITEM_QUALITY_COLORS[3].b)
			end
			if info.isMaxLevel and info.iLevel and info.iLevel > 0 then
				ex.level:SetText(info.iLevel)
				ex.level:Show()
			end
			if info.rewards and info.rewards[1] then
				MissionAlert_SetReward(info.rewards[1], ex.reward1, math.min(info.successChance, 100))
			end
			if info.overmaxRewards and info.hasBonusEffect and info.missionID and info.overmaxRewards[1] then
				if info.successChance and info.successChance > 100 then
					MissionAlert_SetReward(info.overmaxRewards[1], ex.reward2, info.successChance - 100)
					ex.reward1:SetPoint("RIGHT", -48, 0)
				end
			elseif info.rewards and info.rewards[2] then
				MissionAlert_SetReward(info.rewards[2], ex.reward2, math.min(info.successChance, 100))
				ex.reward1:SetPoint("RIGHT", -48, 0)
			end
			if info.level and info.level > 50 and info.followers and #info.followers > 0 then
				local followerInfo, index
				for i = 1, #info.followers do
					index = i + (3 - #info.followers)
  				followerInfo = info.followers[i] and C_Garrison.GetFollowerInfo(info.followers[i])
					if followerInfo and followerInfo.portraitIconID then
						ex.followers[index].icon:SetTexture(followerInfo.portraitIconID)
						ex.followers[index].icon:Show()
						ex.followers[index].ring:SetDesaturated(followerInfo.isTroop)
						if followerInfo.isTroop then
							ex.followers[index].ring:SetVertexColor(0.6, 0.6, 0.6)
						else
							ex.followers[index].ring:SetVertexColor(1, 1, 1)
						end
						ex.followers[index].ring:Show()
					else

					end
				end
			end
		else

		end
	end
	hooksecurefunc(GarrisonMissionAlertSystem, "setUpFunction", MissionAlert_OnSetup)
end
