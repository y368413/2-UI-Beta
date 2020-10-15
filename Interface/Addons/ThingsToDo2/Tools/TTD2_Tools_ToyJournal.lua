ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
interface to the toy-API
]]

local super = Templates.Collection
Tools.ToyJournal = super:new()
local this = Tools.ToyJournal

function this:UpdateByID(ID)

	local Toy = self:GetByID(ID)
	
	if(Toy.Name == nil) then
		local ToyInfo = { C_ToyBox.GetToyInfo(ID) }
		Toy.Name = ToyInfo[2]
		Toy.Link = C_ToyBox.GetToyLink(ID)
	end
	
	if(Toy.IsCollected ~= true) then
		Toy.IsCollected = PlayerHasToy(ID)
	end
end
