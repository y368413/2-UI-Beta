ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
wrapper for profession API

skill-line IDs:
164 Blacksmithing
165 Leatherworking
171 Alchemy
182 Herbalism
185 Cooking
186 Mining
197 Tailoring
202 Engineering
333 Enchanting
356 Fishing
393 Skinning
755 Jewelcrafting
773 Inscription
794 Archaeology 
]]

local super = Templates.Base
Tools.Profession = super:new()
local this = Tools.Profession

function this:DoesCharacterHaveProfession(ProfessionID)
	
	local MyProfessions = { GetProfessions() }
	
	for _,ProfIndex in pairs(MyProfessions) do
		local ProfData = { GetProfessionInfo(ProfIndex) }
		if(ProfData[7] == ProfessionID) then
			return true
		end
	end
	
	return false
end
