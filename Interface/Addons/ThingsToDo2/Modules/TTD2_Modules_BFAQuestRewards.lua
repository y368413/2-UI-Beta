ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
this module checks forthe completion of daily and weekly quests and events.
]]

local super = Templates.UIButtonChatModule
Modules.BFAQuestRewards = super:new()
local this = Modules.BFAQuestRewards

this.Name = "[BFA] Quest-Rewards"

function this:Initialise()
	
	local Faction = TTD2.Tools.Unit.PlayerFaction
	local RewardData =
	{
		[Faction.Neutral] =
		{
			["PeriodicDestruction"] = --Periodic Destruction(weekly)
			{
				--Type = special
				AchievementID = 13699,
				WeeklyQuestID = 55121,
				UnlockQuestID = 57086,
				Location =
				{
					MapID = 1355,
					PosX = 0.606,
					PosY = 0.333
				},
				Reagents =
				{
					[1] = 169332,	--Strange Mineralized Water
					[2] = 169333,	--Strange Volcanic Rock
					[3] = 169334	--Strange Oceanic Sediment
				},
				Crystals =
				{
					[1] = { NPCID = 154970, Reagent = 1 },	--Lesser Benthic Arcanocrystal
					[2] = { NPCID = 154991,	Reagent = 2 },	--Lesser Pyroclasmic Arcanocrystal
					[3] = { NPCID = 155009,	Reagent = 3 },	--Lesser Lithic Arcanocrystal
					[4] = { NPCID = 154979,	Reagent = 1 },	--Greater Benthic Arcanocrystal
					[5] = { NPCID = 155025,	Reagent = 2 },	--Greater Pyroclasmic Arcanocrystal
					[6] = { NPCID = 155031,	Reagent = 3 }	--Greater Lithic Arcanocrystal
				},
				Summons =
				{
					[45678] = { Lesser = 0, Greater = 0 },		--Arcane Amalgamation
					[45679] = { Lesser = 1, Greater = 0 },		--Watery Amalgamation
					[45680] = { Lesser = 2, Greater = 0 },		--Burning Amalgamation
					[45681] = { Lesser = 3, Greater = 0 },		--Dusty Amalgamation
					[45682] = { Lesser = 1, Greater = 6 },		--Zomera
					[45683] = { Lesser = 1, Greater = 5 },		--Omus
					[45684] = { Lesser = 1, Greater = 4 },		--Osgen
					[45685] = { Lesser = 2, Greater = 6 },		--Moghiea
					[45686] = { Lesser = 2, Greater = 4 },		--Xue
					[45687] = { Lesser = 2, Greater = 5 },		--Ungormath
					[45688] = { Lesser = 3, Greater = 4 },		--Spawn of Salgos
					[45689] = { Lesser = 3, Greater = 6 },		--Herald of Salgos
					[45690] = { Lesser = 3, Greater = 5 }		--Salgos the Eternal
				}
			}
		},
		[Faction.Alliance] =
		{
			["HoneybackHarvester"] = --Honey Smasher daylie rep reward quest
			{
				MountItemID					= 170069,
				MountID						= 1013,
				FactionUnlockedQuestID		= 57707,
				FactionFinalQuestID			= 56108,
				HoneySmasherNPCID			= 154154,
				HoneySmasherDailyQuestID	= 57726,
				FactionID					= 2395,
				Location =
				{
					MapID = 942,
					PosX = 0.615,
					PosY = 0.160
				}
			}			
		},
		[Faction.Horde] =
		{
			
		}
	}
	
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	local function TransferData(Source)
		self.RewardData = self.RewardData or {}
		for RewardName, RewardData in pairs(Source) do
			if(self.RewardData[RewardName] ~= nil) then
				TTD2.Tools.Chat.Error("BFAQuestRewards:Initialise(), unexpected RewardName collision: "..RewardName)
			end
			
			self.RewardData[RewardName] = RewardData
		end
	end
	
	--create quest table for current character
	TransferData(RewardData[Faction.Neutral])
	TransferData(RewardData[MyFaction])
	
	return
end

function this:Output_PeriodicDestruction()
	self:Init()
	
	--first, update our quest, item and NPC data
	local Data = self.Current.RewardData
	
	TTD2.Tools.Achievement:AddByID(Data.AchievementID)
	TTD2.Tools.Achievement:UpdateByID(Data.AchievementID)
	local AchievementInfo = TTD2.Tools.Achievement:GetByID(Data.AchievementID)
	
	
	TTD2.Tools.Quest:AddByID(Data.WeeklyQuestID)
	TTD2.Tools.Quest:UpdateByID(Data.WeeklyQuestID)
	local QuestInfo = TTD2.Tools.Quest:GetByID(Data.WeeklyQuestID)
	
	for _,ItemID in pairs(Data.Reagents) do
		TTD2.Tools.Item:AddByID(ItemID)
		TTD2.Tools.Item:UpdateByID(ItemID)
	end
	for _,CrystalData in pairs(Data.Crystals) do
		TTD2.Tools.NPC:AddByID(CrystalData.NPCID)
		TTD2.Tools.NPC:UpdateByID(CrystalData.NPCID)
	end
	
	--next, check if the weekly has been completed and set our achievement-uncompleted status accordingly
	local ACS	= self.Out.Status.Completed	--AchievementCompletedStatus
	local WQS	= self.Out.Status.Completed	--WeeklyQuestStatus
	local AUS	= self.Out.Status.Done		--AchievementUncompleteStatus
	if(QuestInfo.IsCompleted == false) then
		WQS		= self.Out.Status.ToDo
		AUS		= self.Out.Status.ToDo
	end
	
	--tomtom link
	local TomTomLink = TTD2.Tools.TomTom:CreateLink(Data.Location.MapID, Data.Location.PosX, Data.Location.PosY, QuestInfo.Name)
	
	--time for some output! Lets start with the main achievementlink
	local AchievementStatus = AUS
	if(AchievementInfo.IsCompleted == true) then
		AchievementStatus	= ACS
	end
	local MainRewardLink = self.Out:AddLine(AchievementStatus, AchievementInfo.Link)
	
	--now the quest+tomtom link
	self.Out:AddLine(WQS, TomTomLink, MainRewardLink)
	local QuestLinkLine = self.Out:AddLine(WQS, QuestInfo.Link, MainRewardLink)
	
	--now, loop over the criteria and give output IF any criteria has been completed already; if none are completed, there is no need to clutter the chat with all the info
	if(AchievementInfo.IsPartiallyCompleted == false) then
		return
	end
	
	for CritIndex, CritData in ipairs(AchievementInfo.CriteriaByIndex) do
		if(CritData.IsCompleted == true) then
			self.Out:AddLine(ACS, CritData.Name, QuestLinkLine)
		else
			local CrystalData = Data.Summons[CritData.ID]
			local CritLine = self.Out:AddLine(AUS, CritData.Name, QuestLinkLine)
			if(CrystalData.Lesser ~= 0) then
				local Crystal = TTD2.Tools.NPC:GetByID(Data.Crystals[CrystalData.Lesser].NPCID)
				local Reagent = TTD2.Tools.Item:GetByID(Data.Reagents[Data.Crystals[CrystalData.Lesser].Reagent])
				self.Out:AddLine(AUS, Crystal.Name.." << "..Reagent.Link, CritLine)
			end
			if(CrystalData.Greater ~= 0) then
				local Crystal = TTD2.Tools.NPC:GetByID(Data.Crystals[CrystalData.Greater].NPCID)
				local Reagent = TTD2.Tools.Item:GetByID(Data.Reagents[Data.Crystals[CrystalData.Greater].Reagent])
				self.Out:AddLine(AUS, Crystal.Name.." << "..Reagent.Link, CritLine)
			end
		end
	end
end

function this:Output_HoneybackHarvester()
	self:Init()
	
	--first, update our quest, item and NPC data
	local Data = self.Current.RewardData
	
	TTD2.Tools.Item:AddByID(Data.MountItemID)
	TTD2.Tools.Item:UpdateByID(Data.MountItemID)
	local MountItemInfo = TTD2.Tools.Item:GetByID(Data.MountItemID)
	
	TTD2.Tools.MountJournal:AddByID(Data.MountID)
	TTD2.Tools.MountJournal:UpdateByID(Data.MountID)
	local MountInfo = TTD2.Tools.MountJournal:GetByID(Data.MountID)
	
	TTD2.Tools.Quest:AddByID(Data.HoneySmasherDailyQuestID)
	TTD2.Tools.Quest:UpdateByID(Data.HoneySmasherDailyQuestID)
	local DailyQuestInfo = TTD2.Tools.Quest:GetByID(Data.HoneySmasherDailyQuestID)
	
	TTD2.Tools.Quest:AddByID(Data.FactionUnlockedQuestID)
	TTD2.Tools.Quest:UpdateByID(Data.FactionUnlockedQuestID)
	local FactionUnlockedQuestInfo = TTD2.Tools.Quest:GetByID(Data.FactionUnlockedQuestID)
	
	TTD2.Tools.NPC:AddByID(Data.HoneySmasherNPCID)
	TTD2.Tools.NPC:UpdateByID(Data.HoneySmasherNPCID)
	local HoneySmasherNPCInfo = TTD2.Tools.NPC:GetByID(Data.HoneySmasherNPCID)
	
	--next, define some status tags based on the daily quest
	local MCS	= self.Out.Status.Completed	--MountCollectedStatus
	local DQS	= self.Out.Status.Completed	--DailyQuestStatus
	local MUS	= self.Out.Status.Done		--MountUncollectedStatus
	if(DailyQuestInfo.IsCompleted == false) then
		DQS		= self.Out.Status.ToDo
		MUS		= self.Out.Status.ToDo
	end
	
	--now it's time for output, start with the main reward link using the item+collection status
	local MountStatus		= MUS
	if(MountInfo.IsCollected == true) then
		MountStatus			= MCS
	end
	local MainRewardLink = self.Out:AddLine(MountStatus, MountItemInfo.Link)
	
	--only continue if this character has unlocked the faction-daily reward
	if(FactionUnlockedQuestInfo.IsCompleted == false) then
		return
	end
	
	--print daily status as TomTomLink using HoneySmasherNPC as title
	local TomTomLink = TTD2.Tools.TomTom:CreateLink(Data.Location.MapID, Data.Location.PosX, Data.Location.PosY, HoneySmasherNPCInfo.Name)
	self.Out:AddLine(DQS, TomTomLink, MainRewardLink)
	
	return
end

function this:CreateOutput()
	self:Init()
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	
	--nothing in this module is reachable before lvl 110
	if(MyLevel < 120) then
		return
	end
	
	--invalid faction
	if(self.RewardData == nil) then
		return
	end
	
	self.Out = TTD2.Tools.Output
	
	for RewardName,RewardData in pairs(self.RewardData) do
		self.Current			= self.Current or {}
		self.Current.RewardData	= RewardData
		
		--use the RewardName to create function name
		local Function = "Output_"..RewardName
		self[Function](self)
	end
end
