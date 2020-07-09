ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
Transmogrification API
]]

local super = Templates.Base
Tools.ContributionCollector = super:new()
local this = Tools.ContributionCollector

function this:GetNameByID(ID)
	return C_ContributionCollector.GetName(ID)
end

function this:IsActiveByID(ID)
	local ContributionState, ContributionPercentageComplete, TimeOfNextStateChange, StartTime = C_ContributionCollector.GetState(ID)
	
	return (ContributionState == 2)
end

--[[
this.Collectors =
{
	["Battle for Stromgarde"]	= 116,
	["Battle for Darkshore"]	= 117
}
function this:GetTime1(ID)
	local ContributionState, ContributionPercentageComplete, TimeOfNextStateChange, StartTime = C_ContributionCollector.GetState(ID)
	
	if(TimeOfNextStateChange == nil) then
		return "undefined"
	end
	
	return (((TimeOfNextStateChange - GetServerTime())/3600.0)/24.0)
end

function this:GetTime2(ID)
	local ContributionState, ContributionPercentageComplete, TimeOfNextStateChange, StartTime = C_ContributionCollector.GetState(ID)
	
	if(StartTime == nil) then
		return "undefined"
	end
	
	return (((StartTime - GetServerTime())/3600.0)/24.0)
end
]]
