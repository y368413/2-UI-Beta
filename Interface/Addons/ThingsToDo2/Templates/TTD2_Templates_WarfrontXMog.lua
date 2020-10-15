ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
this template contains the common transform+filter+output-methods for warfront-transmog-modules
]]

local super = Templates.UIButtonChatModule
Templates.WarfrontXMog = super:new()
local this = Templates.WarfrontXMog

function this:Initialise()
	--this table contains all items from the arathi WF as sourceIDs + classes eligible to loot them
	--Note:	This is NOT identical to classes actually able to USE them (e.g. int weapons for warriors/rogues)
	--		Ability to use can be determined using API calls, loot eligibility cannot
	local AllSources		= self:GetAllSourceItemIDs()
	local ContributionIDs	= self:GetContributionIDs()
	local QuestIDs			= self:GetQuestIDs()
	
	local function ItemString(ID, Tier)
		local ItemStringPart =
		{
			[1] = "item:",
			[2] = "::::::::120::::2:",
			[3] = ":0:"
		}
		
		local ItemStringTier =
		{
			["WarfrontReward"] = "5124",
			["ZoneRareDrop"] = "5125", --we do not use this tier here; it is better suited for a zone-rare-collectible module
			["QuestReward"] = "5126"
		}
		
		return ItemStringPart[1]..ID..ItemStringPart[2]..ItemStringTier[Tier]..ItemStringPart[3]
	end
	
	--build a table of SourceItems the current character is able to obtain
	local MyFaction	= TTD2.Tools.Unit:GetPlayerFaction()
	local MyClass	= TTD2.Tools.Unit:GetPlayerClass()
	
	--panda case
	if(AllSources[MyFaction] == nil) then
		return
	end
	
	self.ContributionID = ContributionIDs[MyFaction]
	self.QuestID		= QuestIDs[MyFaction]
	self.UsedTiers		= self:GetUsedTypeTiers()
	
	TTD2.Tools.Quest:AddByID(self.QuestID)
	
	self.Sources = {}
	local UniqueSources = {} --used for debugtesting
	
	for ItemType, TypeTiers in pairs(self.UsedTiers) do
		for _,SourceData in pairs(AllSources[MyFaction][ItemType]) do
		
			if(TTD2.Tools.Table:Contains(SourceData.Classes,MyClass)) then
				
				for _, Tier in pairs(TypeTiers) do
					local SourceID = TTD2.Tools.XMog:GetSourceFromItemString(ItemString(SourceData.ID,Tier))
					if(SourceID == nil) then
						TTD2.Tools.Chat:Error("ItemString to SourceID conversion failed for item: "..SourceData.ID)
					elseif(UniqueSources[SourceID] ~= nil) then
						TTD2.Tools.Chat:Error("unexpected SourceID collision for item: "..SourceData.ID)
					end
					UniqueSources[SourceID] = true
					self.Sources[Tier] = self.Sources[Tier] or {}
					self.Sources[Tier][SourceID] = true
				end
			end
		end
	end
end

function this:PrepareData()
	self:Init()
	
	TTD2.Tools.Quest:UpdateByID(self.QuestID)
	return true
end

function this:CreateOutput()
	self:Init()
	
	--panda case
	if(self.Sources == nil) then
		return
	end
	
	if(TTD2.Tools.Unit:GetPlayerLevel() < 120) then
		return
	end
	
	local Out = TTD2.Tools.Output
	
	
	local WarfrontActive = TTD2.Tools.ContributionCollector:IsActiveByID(self.ContributionID)
	local QuestCompleted = TTD2.Tools.Quest:GetByID(self.QuestID).IsCompleted
	
	local WarfrontLineIndex = Out:AddLine(Out.Status.ToDo, TTD2.Tools.ContributionCollector:GetNameByID(self.ContributionID))
	local AnythingMissingT1 = false
	
	--since we are not going to check zone-rares here, we will simply ignore Tier2 completely

	for SourceID,_ in pairs(self.Sources["WarfrontReward"]) do
		local SourceStatus	 = Out.Status.ToDo
		local SourceContent  = TTD2.Tools.XMog:GetItemLinkFromSource(SourceID)
		
		if(TTD2.Tools.XMog:IsAppearanceCollectedBySource(SourceID) == true) then
			SourceStatus = Out.Status.Completed
		else
			AnythingMissingT1 = true
			if(WarfrontActive == true) then
				SourceStatus = Out.Status.ToDo
			else
				SourceStatus = Out.Status.Done
			end
		end
		Out:AddLine(SourceStatus, SourceContent, WarfrontLineIndex)
	end
	
	local WarfrontQuestLineIndex = Out:AddLine(Out.Status.ToDo, TTD2.Tools.Quest:GetByID(self.QuestID).Link, WarfrontLineIndex)
	local AnythingMissingT3 = false
					
	--T3 items are awarded by the quest only doable once per WF cycle
	for SourceID,_ in pairs(self.Sources["QuestReward"]) do
		local SourceStatus	 = Out.Status.ToDo
		local SourceContent  = TTD2.Tools.XMog:GetItemLinkFromSource(SourceID)
		
		if(TTD2.Tools.XMog:IsAppearanceCollectedBySource(SourceID) == true) then
			SourceStatus = Out.Status.Completed
		else
			AnythingMissingT3 = true
			if((WarfrontActive == true) and (QuestCompleted == false)) then
				SourceStatus = Out.Status.ToDo
			else
				SourceStatus = Out.Status.Done
			end
		end
		Out:AddLine(SourceStatus, SourceContent, WarfrontQuestLineIndex)
	end
	
	--now update the two master-lines
	local WarfrontStatus = Out.Status.ToDo
	local WarfrontQuestStatus = Out.Status.ToDo
	
	if((AnythingMissingT1 == true) and (AnythingMissingT3 == true)) then
		if(WarfrontActive == true) then
			if(QuestCompleted == false) then
				WarfrontStatus = Out.Status.ToDo
				WarfrontQuestStatus = Out.Status.ToDo
			else
				WarfrontStatus = Out.Status.ToDo
				WarfrontQuestStatus = Out.Status.Done
			end
		else
			WarfrontStatus = Out.Status.Done
			WarfrontQuestStatus = Out.Status.Done
		end
	elseif((AnythingMissingT1 == false) and (AnythingMissingT3 == true)) then
		if(WarfrontActive == true) then
			if(QuestCompleted == false) then
				WarfrontStatus = Out.Status.ToDo
				WarfrontQuestStatus = Out.Status.ToDo
			else
				WarfrontStatus = Out.Status.Done
				WarfrontQuestStatus = Out.Status.Done
			end
		else
			WarfrontStatus = Out.Status.Done
			WarfrontQuestStatus = Out.Status.Done
		end
	elseif((AnythingMissingT1 == true) and (AnythingMissingT3 == false)) then
		if(WarfrontActive == true) then
			WarfrontStatus = Out.Status.ToDo
			WarfrontQuestStatus = Out.Status.Completed
		else
			WarfrontStatus = Out.Status.Done
			WarfrontQuestStatus = Out.Status.Completed
		end
	elseif((AnythingMissingT1 == false) and (AnythingMissingT3 == false)) then
		WarfrontStatus = Out.Status.Completed
		WarfrontQuestStatus = Out.Status.Completed
	end
	
	Out:ChangeLine(WarfrontLineIndex, WarfrontStatus)
	Out:ChangeLine(WarfrontQuestLineIndex, WarfrontQuestStatus)
end
