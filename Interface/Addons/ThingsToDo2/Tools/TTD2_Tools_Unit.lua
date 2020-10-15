if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
some basic unit-functions, mostly specialised for "player"
]]

local super = TTD2.Templates.Base
TTD2.Tools.Unit = super:new()
local this = TTD2.Tools.Unit

this.PlayerUnit = "player"

this.PlayerFaction = 
{
	Alliance	= "Alliance",
	Horde		= "Horde",
	Neutral		= "Neutral"
}

function this:GetPlayerGUID()	
	return UnitGUID(self.PlayerUnit)
end

function this:GetPlayerLevel()	
	return UnitLevel(self.PlayerUnit)
end

function this:GetPlayerClass()	
	return (select(2, UnitClass(self.PlayerUnit)))
end

function this:IsPlayerInCombat()
	return InCombatLockdown()
end

function this:IsPlayerFlying()
	return IsFlying()
end

function this:GetPlayerFaction()

	local PlayerFaction = UnitFactionGroup(self.PlayerUnit)
	if(TTD2.Tools.Table:Contains(self.PlayerFaction, PlayerFaction) == false) then
		TTD2.Tools.Chat:Error("player faction unknown.")
		return nil
	end
	
	return PlayerFaction
end

function this:GetPlayerData()
	local Name, Realm = UnitFullName(self.PlayerUnit)
	local Data =
	{
		Name	= Name,
		Realm	= Realm,
		Class	= self:GetPlayerClass(),
		Faction	= self:GetPlayerFaction()
	}
	
	return Data
end

function this:GetPlayerFullName()
	local Name, Realm = UnitFullName(self.PlayerUnit)
	return Name.."-"..Realm
end
