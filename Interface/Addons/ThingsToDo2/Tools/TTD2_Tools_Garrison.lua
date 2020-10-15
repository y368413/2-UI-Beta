ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
]]

local super = TTD2.Templates.Base
Tools.Garrison = super:new()
local this = Tools.Garrison

function this:UpdateMissionsBFA()
	
	local Missions = C_Garrison.GetAvailableMissions(LE_FOLLOWER_TYPE_GARRISON_8_0)

	--this character does not have access to BFA missions
	if(Missions == nil) then
		return
	end
	
	if(self.MissionsBFA == nil) then
		self.MissionsBFA = {}
	else
		Tools.Table:Clear(self.MissionsBFA)
	end	
	
	for _, Mission in pairs(Missions) do
		local MissionData =
		{
			Name 			= Mission.name,
			ID				= Mission.missionID,
			TimeToExpire	= Mission.offerTimeRemaining
		}
		Tools.Table:Append(self.MissionsBFA, MissionData)
	end

	return
end

function this:GetMissionsBFA()	
	return self.MissionsBFA
end
