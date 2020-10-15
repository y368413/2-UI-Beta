if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
This lib implements a data table containing faction-information. the client is expected to add factions
first by calling addByID() and then access the information using getByID().
the internal data can be updated on demand by calling updateByID().
Note that simply calling getByID() will NOT update the internal data.

The reason for this buffering is that it allowes me to have different data fields than the API
without creating new tables on every get() call.

The drawback is that memory consumption will rise the more faction data is requested and that memory will
never be freed until a /reload.
Since we are talking about simple integer and short string data here, this seems negligible compared
to the runtime performance improvement or the alternative of coping with the API fields directly.
]]

local super = TTD2.Templates.Collection
TTD2.Tools.Faction = super:new()
local this = TTD2.Tools.Faction

function this:UpdateByID(ID)
	
	local Faction = self:GetByID(ID)
	
	local FactionInfo = { GetFactionInfoByID(ID) }
	
	Faction.Name		= FactionInfo[1]
    Faction.Description	= FactionInfo[2]
	
	if(C_Reputation.IsFactionParagon(ID) == true) then
		local ParagonInfo = { C_Reputation.GetFactionParagonInfo(ID) }
		Faction.Paragon = Faction.Paragon or {}
		
		Faction.Paragon.CurrentRep			= ParagonInfo[1]
		Faction.Paragon.NextRep				= ParagonInfo[2]
		Faction.Paragon.RewardQuestID		= ParagonInfo[3]
		Faction.Paragon.HasRewardPending	= ParagonInfo[4]
		
		Faction.Paragon.NumRewardsObtained	= 0
		while(Faction.Paragon.CurrentRep > Faction.Paragon.NextRep) do
			Faction.Paragon.NumRewardsObtained = Faction.Paragon.NumRewardsObtained + 1
			Faction.Paragon.CurrentRep = Faction.Paragon.CurrentRep - Faction.Paragon.NextRep
		end
	else
		Faction.Paragon = nil
	end
	
	return
end
