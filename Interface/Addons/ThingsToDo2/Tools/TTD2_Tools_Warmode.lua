if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
some basic unit-functions, mostly specialised for "player"
]]

local super = TTD2.Templates.Base
TTD2.Tools.Warmode = super:new()
local this = TTD2.Tools.Warmode

function this:IsWarmodeEnabled()
	return C_PvP.IsWarModeFeatureEnabled()
end

function this:IsWarmodeActive()
	return C_PvP.IsWarModeActive()
end

function this:IsWarmodeTracked()
	return TTD2.Tools.SavedData:GetCharacterSetting("TrackWarmode")
end
