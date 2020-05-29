ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
provides methods to request NPC names and levels from the server
--]]

local super = Templates.AsynchronousCollection
Tools.NPC = super:new()
local this = Tools.NPC

function this:AsynchronousUpdateByID(ID)
	local NPC = self:GetByID(ID)
	
	Tools.Tooltip:QueryNPCByID(ID)
	local Complete = Tools.Tooltip:IsReady()
	if(Complete == true) then
		NPC.Name = Tools.Tooltip:GetRegionText()[1]
	end
		
	if((NPC.Name == nil) or (NPC.Name == " ") or (string.find(NPC.Name,"npc:") ~= nil)) then --fallback if the name of the NPC is actually empty
		NPC.Name = ("npc:"..ID)
		Complete = false
	end
	
	return Complete
end

function this:UpdateByID(ID)
	super.UpdateByID(self, ID)
	
	return
end
