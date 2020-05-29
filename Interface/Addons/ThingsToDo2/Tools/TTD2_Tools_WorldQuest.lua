ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
]]

local super = Templates.Base
Tools.WorldQuest = super:new()
local this = Tools.WorldQuest

function this:GetNameByID(ID)
	return C_TaskQuest.GetQuestInfoByQuestID(ID)
end

function this:GetLinkByID(ID)
	if(self:GetNameByID(ID) == nil) then
		return
	end
	
	return GetQuestLink(ID)
end

function this:IsActiveByID(ID)
	return C_TaskQuest.IsActive(ID)
end

function this:GetLocationByID(ID)
	
	local MapID = C_TaskQuest.GetQuestZoneID(ID)
	local PosX, PosY = C_TaskQuest.GetQuestLocation(ID,MapID)
	
	return MapID,PosX,PosY
end

function this:GetTimeLeftMinutesByID(ID)

	if(self:IsActiveByID(ID) == false) then
		Tools.Chat:Error("trying to request time remaining for inactive worldquest: "..ID)
	end
	
	local TimeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(ID)
	if(TimeLeftMinutes == nil) then --may be nil because the client has not yet loaded this WQ duration
		return 0
	end
	return TimeLeftMinutes
end

function this:PreloadRewardsByID(ID)
	
	C_TaskQuest.RequestPreloadRewardData(ID)
	return
end

function this:IsRewardInfoReadyByID(ID)

	--[[
	there is no simple API call for this, we will instead call all 3 APIs for quest rewards: Gold, Currency and Items
	We will assume that a quest has to award at least one of these things. If the API returns zero for all three of
	them we will consider the rewards not ready.
	]]
	
	local GoldRewards			= GetQuestLogRewardMoney(ID)
	local NumCurrencyRewards	= GetNumQuestLogRewardCurrencies(ID)
	local NumItemRewards		= GetNumQuestLogRewards(ID)
	
	if(	(	(GoldRewards		== nil) or	(GoldRewards		== 0)	)	and
		(	(NumCurrencyRewards	== nil)	or	(NumCurrencyRewards	== 0)	)	and
		(	(NumItemRewards		== nil) or	(NumItemRewards		== 0)	)	) then
		return false
	end
	
	--we are not done. At this point we will also require all the ItemIDs of rewarded items to be not nil or 0
	local RewardItemIDs = {}
	for i=1, NumItemRewards do
		local RewardInfo		= { GetQuestLogRewardInfo(i, ID) }
		if((RewardInfo == nil) or (RewardInfo[1] == nil) or (RewardInfo[6] == nil) or (RewardInfo[6] == 0)) then
			return false
		else
			RewardItemIDs[RewardInfo[6]] = true
		end
	end
	
	return RewardItemIDs
end

function this:DoesRewardItemByID(ID, ItemID)
	
	local ItemIDs = self:IsRewardInfoReadyByID(ID)
	
	if(ItemIDs == false) then
		--error: Ask if rewards are ready before trying to put them out!
		local Nilval = nil
		Nilval[1] = true
	end
	
	if(ItemIDs[ItemID] == true) then
		return true
	end

	return false
end
