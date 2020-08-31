ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
common output+table creation methods for paragon-style modules
]]

local super = Templates.UIButtonChatModule
Templates.ParagonModule = super:new()
local this = Templates.ParagonModule

function this:Initialise()
	
	--request the entire Data separated by factions and with ItemID inside the reward tables
	local CompleteParagonData = self:GetCompleteParagonData()
	
	local function TransferData(Source)
		if(Source == nil) then
			return
		end
		
		self.ParagonData = self.ParagonData or {}
		for _, FactionData in pairs(Source) do
			self.ParagonData[FactionData.FactionID] = self.ParagonData[FactionData.FactionID] or {}
			local CurrentFaction = self.ParagonData[FactionData.FactionID]
			
			CurrentFaction.EmissaryID			= FactionData.EmissaryID
			CurrentFaction.EmissaryWQBundleIDs	= FactionData.EmissaryWQBundleIDs
			CurrentFaction.BoxID				= FactionData.BoxID
			CurrentFaction.Rewards				= CurrentFaction.Rewards or {}
			
			for _, RewardData in pairs(FactionData.Rewards) do
				CurrentFaction.Rewards[RewardData.ItemID] = CurrentFaction.Rewards[RewardData.ItemID] or {}
				local CurrentReward = CurrentFaction.Rewards[RewardData.ItemID]
				
				CurrentReward.Type			= RewardData.Type
				CurrentReward.MountID		= RewardData.MountID
				CurrentReward.SpeciesID		= RewardData.SpeciesID
				CurrentReward.ProfessionID	= RewardData.ProfessionID
				CurrentReward.EssenceID		= RewardData.EssenceID
				CurrentReward.EssenceRank	= RewardData.EssenceRank
			end
		end
	end
	
	--filter out the data belonging to opposite faction and move the Faction+ItemID up into the keys of tables
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	TransferData(CompleteParagonData[TTD2.Tools.Unit.PlayerFaction.Neutral])
	TransferData(CompleteParagonData[MyFaction])
	
	--init journal + item links
	for FactionID,FactionData in pairs(self.ParagonData) do
		TTD2.Tools.Faction:AddByID(FactionID)
		if(FactionData.EmissaryID ~= nil) then
			TTD2.Tools.Quest:AddByID(FactionData.EmissaryID)
		end
		TTD2.Tools.Item:AddByID(FactionData.BoxID)
		
		for ItemID,RewardData in pairs(FactionData.Rewards) do
			--we always need the item
			TTD2.Tools.Item:AddByID(ItemID)
			
			if(RewardData.Type == "Toy") then
				TTD2.Tools.ToyJournal:AddByID(ItemID)
			elseif(RewardData.Type == "Mount") then
				TTD2.Tools.MountJournal:AddByID(RewardData.MountID)
			elseif(RewardData.Type == "Pet") then
				TTD2.Tools.PetJournal:AddByID(RewardData.SpeciesID)
			elseif(RewardData.Type == "Recipe") then
				--nothing to do here
			elseif(RewardData.Type == "Essence") then
				TTD2.Tools.AzeriteEssence:AddByID(RewardData.EssenceID)
			else
				TTD2.Tools.Chat:Error("unexpected reward type: "..RewardData.Type)
			end
		end
	end
end

function this:GetEmissaryInfo(FactionData)
	self:Init()
	
	--[[
	For Output we need 3 informations about the emissary quest:
	1) Is it active?
	2) Questlink - if the emissary is active this link should contain a time-remaining
	]]
	
	local EmissaryInfo = {}
	
	if(FactionData.EmissaryID == nil) then
		--for mechagon worldquest-bundle-style emissaries we need to loop over all the possible quests
		--there is no easy to determine inactive link here, so we will simply hardcode a string.
		
		EmissaryInfo.IsActive	= false
		EmissaryInfo.Link		= "[Mechagon Main Daily Worldquest]"

		for _, WQID in pairs(FactionData.EmissaryWQBundleIDs) do
			if(TTD2.Tools.WorldQuest:IsActiveByID(WQID)== true) then
				EmissaryInfo.IsActive	= true
				EmissaryInfo.Link		= TTD2.Tools.WorldQuest:GetLinkByID(WQID).." "..TTD2.Tools.ComplexChat:CreateTimeLeftHoursStringFromTimeLeftMinutes(TTD2.Tools.WorldQuest:GetTimeLeftMinutesByID(WQID))
				break
			end
		end		
	else
		--for the old default Emissary with a asimple QuestID the 3 fields are easy to get
		local QuestInfo				= TTD2.Tools.Quest:GetByID(FactionData.EmissaryID)
		EmissaryInfo.IsActive		= QuestInfo.IsInLog
		EmissaryInfo.Link			= QuestInfo.Link
		if(EmissaryInfo.IsActive == true) then
			EmissaryInfo.Link		= EmissaryInfo.Link.." "..TTD2.Tools.ComplexChat:CreateTimeLeftHoursStringFromTimeLeftMinutes(QuestInfo.TimeLeftMinutes)
		end
	end
	
	return EmissaryInfo
end

function this:PrepareData()
	self:Init()

	local AsynchronousDataReady = true
	
	--filter out recipes for professions we do not have
	--filter out AzeriteEssence the Player cannot learn
	
	self.PreparedData = {}
	
	for FactionID,FactionData in pairs(self.ParagonData) do
		TTD2.Tools.Faction:UpdateByID(FactionID)
		if(FactionData.EmissaryID ~= nil) then
			TTD2.Tools.Quest:UpdateByID(FactionData.EmissaryID)
		end
		TTD2.Tools.Item:UpdateByID(FactionData.BoxID)
		
		self.PreparedData[FactionID] = 
		{
			EmissaryID			= FactionData.EmissaryID,
			EmissaryWQBundleIDs	= FactionData.EmissaryWQBundleIDs,
			BoxID				= FactionData.BoxID,
			Rewards				= {}
		}		
					
		for ItemID,RewardData in pairs(FactionData.Rewards) do
			--we always need the item
			TTD2.Tools.Item:UpdateByID(ItemID)
			
			self.PreparedData[FactionID].Rewards[ItemID] = { Type = RewardData.Type }
			local CurrentReward = self.PreparedData[FactionID].Rewards[ItemID]
			
			if(RewardData.Type == "Toy") then
				TTD2.Tools.ToyJournal:UpdateByID(ItemID)
			elseif(RewardData.Type == "Mount") then
				TTD2.Tools.MountJournal:UpdateByID(RewardData.MountID)
				CurrentReward.MountID = RewardData.MountID
			elseif(RewardData.Type == "Pet") then
				TTD2.Tools.PetJournal:UpdateByID(RewardData.SpeciesID)
				CurrentReward.SpeciesID = RewardData.SpeciesID
			elseif(RewardData.Type == "Recipe") then
				if(TTD2.Tools.Profession:DoesCharacterHaveProfession(RewardData.ProfessionID) == true) then
					if(TTD2.Tools.Recipe:IsRecipeInfoReady(ItemID) == false) then
						AsynchronousDataReady = false
					end
					--since we are removing all recipes we do not have the profession for, there is no need to store the ProfessionID
				else
					self.PreparedData[FactionID].Rewards[ItemID] = nil --we do not have the profession for this recipe
				end
			elseif(RewardData.Type == "Essence") then
				TTD2.Tools.AzeriteEssence:UpdateByID(RewardData.EssenceID)
				
				if(TTD2.Tools.AzeriteEssence:GetByID(RewardData.EssenceID).LearnableByPlayer == false) then
					self.PreparedData[FactionID].Rewards[ItemID] = nil --our class cannot learn this essence
				else
					CurrentReward.EssenceID		= RewardData.EssenceID
					CurrentReward.EssenceRank	= RewardData.EssenceRank
				end
			end
		end
		
		if(TTD2.Tools.Table:IsEmpty(self.PreparedData[FactionID].Rewards) == true) then
			--if no rewards survived the filter, we do not need to consider this faction
			self.PreparedData[FactionID] = nil
		end
	end
	
	return AsynchronousDataReady
end

function this:CreateOutput()
	self:Init()
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	if(MyLevel < self.MinimumLevel) then
		return
	end
	
	local Out = TTD2.Tools.Output

	for FactionID, FactionData in pairs(self.PreparedData) do

		local AnythingMissing			= false
		local ParagonChestWaiting		= false
		local EmissaryInfo				= self:GetEmissaryInfo(FactionData)
		local ParagonEmissarySetting	= TTD2.Tools.SavedData:GetCharacterSetting("ParagonEmissary")
		local FactionInfo				= TTD2.Tools.Faction:GetByID(FactionID)
		local FactionLineContent		= TTD2.Tools.Chat:Orange(FACTION..": "..FactionInfo.Name)
		local FactionLineStatus			= Out.Status.Completed
		local FactionLineIndex			= Out:AddLine(FactionLineStatus, FactionLineContent)
		
		--[[
		The Emissary is important for the "incomplete" status of anything else
		If the ParagonEmissary option is not used, anything missing will simply be ToDo
		If ParagonEmissary is used and the Emissary is up, the missing status will still be ToDo
		If ParagonEmissary is used but the Emissary is not up, the missing status becomes Done
		]]
		
		local FactionIncompleteStatus	= Out.Status.ToDo
		if((EmissaryInfo.IsActive == false) and (ParagonEmissarySetting == true)) then
			FactionIncompleteStatus = Out.Status.Done
		end
		
		if(FactionInfo.Paragon ~= nil) then
		
			--add current factionrep to faction-line
			FactionLineContent = FactionLineContent.." ("..TTD2.Tools.Chat:Yellow(FactionInfo.Paragon.CurrentRep).."/"..TTD2.Tools.Chat:Yellow(FactionInfo.Paragon.NextRep)..")"
			
			--add line for paragon chest
			if(FactionInfo.Paragon.HasRewardPending == true) then
				ParagonChestWaiting = true
				Out:AddLine(Out.Status.ToDo, YOU_EARNED_LABEL.." "..TTD2.Tools.Item:GetByID(FactionData.BoxID).Link, FactionLineIndex)
			end
		end
		
		--[[
		The status of the Emissary Line itself is a little more tricky:
		If the Emissary is up and we are still missing something from this faction (which we do not know right now!) the status is ToDo
		If the Emissary is up and we are not missing anything from this faction the line will be ignored. Completed does not make sense in this case.
		]]
		
		EmissaryInfo.LineIndex = Out:AddLine(Out.Status.ToDo, EmissaryInfo.Link, FactionLineIndex)
		
		--now it's finally time to check the rewards
		for ItemID, RewardData in pairs(FactionData.Rewards) do
			local ItemStatus	= Out.Status.Completed
			local ItemInfo		= TTD2.Tools.Item:GetByID(ItemID)
			
			if(RewardData.Type == "Toy") then
				if(TTD2.Tools.ToyJournal:GetByID(ItemID).IsCollected == false) then
					ItemStatus = FactionIncompleteStatus
					AnythingMissing = true
				end
			elseif(RewardData.Type == "Mount") then
				if(TTD2.Tools.MountJournal:GetByID(RewardData.MountID).IsCollected == false) then
					ItemStatus = FactionIncompleteStatus
					AnythingMissing = true
				end
			elseif(RewardData.Type == "Pet") then
				if(TTD2.Tools.PetJournal:GetByID(RewardData.SpeciesID).IsCollected == false) then
					ItemStatus = FactionIncompleteStatus
					AnythingMissing = true
				end
			elseif(RewardData.Type == "Recipe") then
				if(TTD2.Tools.Recipe:IsRecipeLearned(ItemID) == false) then
					ItemStatus = FactionIncompleteStatus
					AnythingMissing = true
				end
			elseif(RewardData.Type == "Essence") then
				if(TTD2.Tools.AzeriteEssence:GetByID(RewardData.EssenceID).Rank < RewardData.EssenceRank) then
					ItemStatus = FactionIncompleteStatus
					AnythingMissing = true
				end
			end
			
			Out:AddLine(ItemStatus, ItemInfo.Link, FactionLineIndex)
		end
		
		--[[
		now we have to update our main faction line, paragon-box line and emissary line.
		for the main line rules are like this (in order!):
		1. If ParagonChestWaiting is true, Status is ToDo
		2. if AnythingMissing is false, Status is completed
		3. if ParagonEmissary option is false, Status is ToDo
		4. If Emissary is not up, Status is Done
		5. Status is ToDo
		]]
		
		if(ParagonChestWaiting == true) then
			FactionLineStatus = Out.Status.ToDo
		elseif(AnythingMissing == false) then
			FactionLineStatus = Out.Status.Completed
		elseif(ParagonEmissarySetting == false) then
			FactionLineStatus = Out.Status.ToDo
		elseif(EmissaryInfo.IsActive == false) then
			FactionLineStatus = Out.Status.Done
		else
			FactionLineStatus = Out.Status.ToDo
		end		
		
		Out:ChangeLine(FactionLineIndex, FactionLineStatus, FactionLineContent)
		
		--the paragon-box does not need to be changed
		--the emissary line is set to ignore if either the emissary is not up or we are not missing anything
		--the ParagonEmissary Setting is not important for the status of this line
		if((EmissaryInfo.IsActive == false) or (AnythingMissing == false)) then
			Out:ChangeLine(EmissaryInfo.LineIndex, Out.Status.Ignored)
		end
	end
end
