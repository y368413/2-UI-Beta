ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
methods to handle keystone data

this tool generates tables which contain all the information necessary to print the current M+ status of a character:

Keystone =
{
	["Stamp"] =
	{
		["Time"],			timestamp of the last internal update, meaning the character was logged in and triggered the update
		["Saeson"],
		["Affixes"]			affix-serial of the week when the last internal update was made
	}
	["StampExternal"] =		if the data was updated externally this table will contain the stamp for it; may be nil if no external update was made
	{
		["Time"],
		["Saeson"],
		["Affixes"]
	}
	["RewardPending"]		boolean
							note: may be set to true by an external update
	["LastWeekBest"]		highest level completed in the previous week; if RewardPending is true this value will always reflect the level of the week that generated the chest
							note: May be changed by an external update
	["CurrentWeekBest"]		highest completed in the current week
							note: This value may be invalidated during external updates
	["KeystoneBagLink"]		complete BagItemLink of the keystone the character has for the current week.
							note: This value may be invalidated during external updates
	["FeatHunter"] =		if the character had "M+ FeatHunter" option active upon update, this table will be created and contain data for each feat ID in the list
	{
		[1] =
		{
			["Completed"],	boolean
			["FeatLink"]	complete feat link
		}
		[2]
		...
	}
}

an important part of this tool is RequestUpdate()
This method should not be called again and again during a single internal data operation; so it is best to only let the client call it externally.
The problem with that is that this tool has two clients, one of which is a UICheckbox that cannot control a deeper callchain.
For now, we will add RequestUpdate() to IsDataReady(), which is supposed to be the status check called by external clients.
IsDataReady() is only used internally once, in the method called by the UICheckbox
]]

local super = Templates.Base
Tools.Keystone = super:new()
local this = Tools.Keystone

this.WeekInSeconds	= 7*24*60*60 --used to check when updates were made
this.RewardCap		= 15
this.KeystoneItemID = 158923
this.SeasonFeats =
{
	[1] = 14144,
	[2] = 14145
}

function this:RequestUpdate()
	--these Updates are expensive, that's why they should not be called at the start of every method
	C_MythicPlus.RequestRewards()
	C_MythicPlus.RequestMapInfo()
	C_MythicPlus.RequestCurrentAffixes()
	local Maps = C_ChallengeMode.GetMapTable()
	for _,MapID in ipairs(Maps) do
		C_ChallengeMode.RequestLeaders(MapID)
	end
	return
end

function this:IsDataReady()

	self:RequestUpdate()
	--it seems that the current affixes are the last data loaded by the server, so this is what we will check!
	if(C_MythicPlus.GetCurrentAffixes() == nil) then
		return false
	end
	
	return true
end

function this:GetCurrentAffixStamp()

	local CurrentAffixes = C_MythicPlus.GetCurrentAffixes()
	if(CurrentAffixes == nil) then
		Tools.Chat:Error("trying to query M+ data before it was ready.")
		return
	end
	
	local AffixStamp = 0
	
	for _, Affix in ipairs(CurrentAffixes) do
		AffixStamp = AffixStamp*1000 --shift the current number three digits to the left
		AffixStamp = AffixStamp + Affix.id
	end
	
	return AffixStamp
end

function this:GetCurrentStamp()
	local Stamp =
	{
		Time	= C_DateAndTime.GetServerTimeLocal(),
		Saeson	= C_MythicPlus.GetCurrentSeason(),
		Affixes	= self:GetCurrentAffixStamp()
	}
	
	return Stamp
end

function this:IsRewardChestAvailable()
	return C_MythicPlus.IsWeeklyRewardAvailable()
end

function this:GetLastWeekBest()
	local _,WeeklyBest = C_MythicPlus.GetLastWeeklyBestInformation()
	return WeeklyBest or 0
end

function this:GetCurrentWeekBest()
	if(self:IsRewardChestAvailable() == true) then
		return 0
	end
	
	local WeeklyBest = C_MythicPlus.GetWeeklyChestRewardLevel()
	return WeeklyBest or 0
end

function this:GetKeystoneBagLink()
	Tools.Item:UpdateByID(self.KeystoneItemID)
	Tools.Item:UpdateBagLinkByID(self.KeystoneItemID)
	
	return Tools.Item:GetByID(self.KeystoneItemID).BagLink
end

function this:GetFeatStatusTable()

	if(Tools.SavedData:GetCharacterSetting("MPlusFeatHunter") == false) then
		return nil
	end
	
	local FeatTable = {}
	
	for Index, FeatID in ipairs(self.SeasonFeats) do
		Tools.Achievement:UpdateByID(FeatID)
		local FeatData = Tools.Achievement:GetByID(FeatID)
			
		FeatTable[Index] =
		{
			Completed	= FeatData.IsCompleted,
			Link		= FeatData.Link
		}
	end
	
	return FeatTable
end

function this:GetPlayerData()

	local PlayerData = {}
	
	PlayerData.Stamp			= self:GetCurrentStamp()
	PlayerData.RewardPending	= self:IsRewardChestAvailable()
	PlayerData.LastWeekBest		= self:GetLastWeekBest()
	PlayerData.CurrentWeekBest	= self:GetCurrentWeekBest()
	PlayerData.KeystoneBagLink	= self:GetKeystoneBagLink()	
	PlayerData.FeatTable		= self:GetFeatStatusTable()
	
	return PlayerData
end

function this:IsStampCurrentSaeson(Stamp)

	if(Stamp == nil) then
		return false
	end

	return (Stamp.Saeson == C_MythicPlus.GetCurrentSeason())
end

function this:IsStampCurrentWeek(Stamp)

	if(Stamp == nil) then
		return false
	end

	return (	((C_DateAndTime.GetServerTimeLocal() - Stamp.Time)	<	self.WeekInSeconds)				and
				(Stamp.Affixes										==	self:GetCurrentAffixStamp())	)
end

function this:UpdateAccountTable()

	--make sure the saved account table "Keystone" only contains relevant data
	local CharacterTable = TTD2.Tools.SavedData:GetAccountCharacterTable()
	
	for GUID, CharacterData in pairs(CharacterTable) do
		if(CharacterData.Keystone ~= nil) then
			--this character contains keystone-data, let's take a look
			local Data = CharacterData.Keystone
			
			if(self:IsStampCurrentWeek(Data.Stamp) == false) then
				--we only need to take a look at data that is from previous weeks
				
				if(self:IsStampCurrentWeek(Data.StampExternal) == false) then
					--the data was not updated externally already this week
						
					if(	(Data.CurrentWeekBest	>	0)		or
						(Data.RewardPending		==	true)	or
						(Data.FeatTable			~=	nil)	) then
					
						--this data is still relevant, add the external stamp
						Data.StampExternal = self:GetCurrentStamp()
						
						if(Data.CurrentWeekBest > 0) then
							Data.RewardPending		= true
							Data.LastWeekBest		= Data.CurrentWeekBest
							Data.CurrentWeekBest	= 0
						end
						Data.KeystoneBagLink		= nil
					else
						--the data does not contain relevant information
						CharacterData.Keystone = nil
						Data = nil
					end
				end
			end
		end
	end
	
	return
end

function this:UpdateAccountPlayerData()

	if(self:IsDataReady() == false) then
		Tools.Chat:Warning("Waiting for the server to provide Keystone-Data; please wait a few seconds and retry.")
		return false
	end

	--first lets find out if the current character has any relevant info to store!
	local PlayerKeystoneData = self:GetPlayerData()
	
	if(	(PlayerKeystoneData.RewardPending	==	true)	or
		(PlayerKeystoneData.CurrentWeekBest	>	0)		or
		(PlayerKeystoneData.KeystoneBagLink ~=	nil)	or
		(PlayerKeystoneData.FeatTable		~=	nil)	) then
		
		--we found some relevant information. store it.
		local CharacterTable	= TTD2.Tools.SavedData:GetAccountCharacterTable()
		local PlayerUnitData	= Tools.Unit:GetPlayerData()
		local GUID				= Tools.Unit:GetPlayerGUID()
		
		CharacterTable[GUID]			= CharacterTable[GUID] or {}
		CharacterTable[GUID].UnitData	= PlayerUnitData
		CharacterTable[GUID].Keystone	= PlayerKeystoneData
	end
	
	return
end

function this:RemoveAccountPlayerData()

	local CharacterTable	= TTD2.Tools.SavedData:GetAccountCharacterTable()
	local GUID				= Tools.Unit:GetPlayerGUID()
	
	if(CharacterTable[GUID] ~= nil) then
		CharacterTable[GUID].Keystone = nil
	end
	
	return
end
