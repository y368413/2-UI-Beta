ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
checks whether the character has...
- collected last week's chest if available
- done a LootCap run this week
- checks Feats
- gives a baglink for the keystone

Update:
As of 2.04 this module supports an "account-wide" mode; in acc-mode events as well as manual triggering of the module
cause updating of all M+ related data into the acc-stored table of characters. clicking the module button will
then output all characters in that table.
In non-account mode, the exact same data is generated for the current character upon clicking the button and then
printed directly.
]]

local super = Templates.UIButtonChatModule
Modules.BFAKeystone = super:new()
local this = Modules.BFAKeystone

this.Name = "[BFA] Keystone"

this.IsEventModule = true
this.IsRegistered = false

function this:Initialise()
	
	for _, ID in ipairs(TTD2.Tools.Keystone.SeasonFeats) do
		TTD2.Tools.Achievement:AddByID(ID)
	end
	
	TTD2.Tools.Item:AddByID(TTD2.Tools.Keystone.KeystoneItemID)
	
	self.Events = {}
	self.Events["BAG_UPDATE_DELAYED"]		= true
	self.Events["CHALLENGE_MODE_COMPLETED"]	= true
	
	return
end

function this:EventCondition()
	self:Init()

	return TTD2.Tools.SavedData:GetCharacterSetting("MPlusAccount")
end

function this:ReceiveEvent(Event, Data)
	self:Init()
	
	if(	(Event == "BAG_UPDATE_DELAYED") or
		(Event == "CHALLENGE_MODE_COMPLETED")	) then
		
		TTD2.Tools.Keystone:UpdateAccountPlayerData()
	else
		TTD2.Tools.Chat:Error("received unexpected event "..Event.." in "..self.Name)
	end
end

function this:CreateCharacterOutput(CCFN, KeystoneData)
	self:Init()
	
	local Out = TTD2.Tools.Output
	
	if(KeystoneData == nil) then
		Out:AddLine(Out.Status.ToDo, "Still waiting for server to update Keystone-Data; please retry in a few seconds.")
		return
	end
	
	local CharacterLine = nil
	if(CCFN ~= nil) then
		CharacterLine = Out:AddLine(Out.Status.Completed, CCFN)
	end
	
	local AnythingToDo = false
	
	--reward-chest block
	if(KeystoneData.RewardPending == true) then
		AnythingToDo = true
		Out:AddLine(Out.Status.ToDo, "Collect your "..TTD2.Tools.Chat:Green("Reward-Chest").." for last week!", CharacterLine)
	elseif(KeystoneData.LastWeekBest > 0) then
		Out:AddLine(Out.Status.Completed, "Reward-Chest for last week already collected.", CharacterLine)
	else
		Out:AddLine(Out.Status.Done, "Reward-Chest for last week not available.", CharacterLine)
	end
	
	--current-week-reward-cap-block
	local DungeonStatus = Out.Status.ToDo
	if(KeystoneData.RewardPending == false) then
		if(KeystoneData.CurrentWeekBest < TTD2.Tools.Keystone.RewardCap) then
			AnythingToDo = true
			Out:AddLine(DungeonStatus, "Completed: "..TTD2.Tools.Chat:Yellow(KeystoneData.CurrentWeekBest)..", Reward caps at: "..TTD2.Tools.Chat:Green(TTD2.Tools.Keystone.RewardCap), CharacterLine)
		else
			DungeonStatus = Out.Status.Completed
			Out:AddLine(DungeonStatus, "Completed: "..TTD2.Tools.Chat:Green(KeystoneData.CurrentWeekBest), CharacterLine)
		end
	else
		--if a reward chest is still pending we simply do not have any info on current week best
		DungeonStatus = Out.Status.Done
	end
	
	--keystone-link-block
	if(TTD2.Tools.SavedData:GetCharacterSetting("MPlusAccountAlwaysShowStones") == true) then
		DungeonStatus = Out.Status.ToDo
	end
	if(KeystoneData.KeystoneBagLink ~= nil) then
		if(DungeonStatus == Out.Status.ToDo) then
			AnythingToDo = true
		end
		Out:AddLine(DungeonStatus, KeystoneData.KeystoneBagLink, CharacterLine)
	end
	
	--feat-hunter-block
	if(KeystoneData.FeatTable ~= nil) then
		for Index, FeatInfo in ipairs(KeystoneData.FeatTable) do
			local FeatStatus = Out.Status.Completed
			if(FeatInfo.Completed == false) then
				AnythingToDo = true
				FeatStatus = Out.Status.ToDo
			end
			Out:AddLine(FeatStatus, FeatInfo.Link, CharacterLine)
		end
	end
	
	--update CharacterLine
	if(	(CharacterLine	~= nil)		and
		(AnythingToDo	== true)	) then
		Out:ChangeLine(CharacterLine, Out.Status.ToDo)
	end
	
	return
end

function this:PrepareData()
	self:Init()
	
	return (TTD2.Tools.Keystone:IsDataReady())
end

function this:CreateOutput()
	self:Init()

	if(self:EventCondition() == true) then
	
		TTD2.Tools.Keystone:UpdateAccountTable()
		TTD2.Tools.Keystone:UpdateAccountPlayerData()
		
		local CharacterTable = TTD2.Tools.SavedData:GetAccountCharacterTable()
		
		for CCFN, CharacterData in pairs(CharacterTable) do
			if(CharacterData.Keystone ~= nil) then
				self:CreateCharacterOutput(CCFN, CharacterData.Keystone)
			end
		end
	else
		
		TTD2.Tools.Keystone:RemoveAccountPlayerData()
		local PlayerKeystoneData = TTD2.Tools.Keystone:GetPlayerData()
		self:CreateCharacterOutput(nil,PlayerKeystoneData)
	end
	
	return
end
