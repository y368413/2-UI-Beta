ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
interface for BFA 8.2 Essences

the information provided by this tool is:
- Name
- Valid 	(false if the current spec cannot use this essence)
- Unlocked	(true if Rank1 or higher is learned)
- Rank		(highest Rank learned)
]]

local super = Templates.Collection
Tools.AzeriteEssence = super:new()
local this = Tools.AzeriteEssence

function this:UpdateByID(ID)

	local Essence = self:GetByID(ID)
	local EssenceInfo = C_AzeriteEssence.GetEssenceInfo(ID)
	
	if(EssenceInfo == nil) then
		Essence.LearnableByPlayer	= false
	else
		Essence.LearnableByPlayer	= true
		
		Essence.Name		= EssenceInfo.name
		Essence.Valid		= EssenceInfo.valid
		Essence.Unlocked	= EssenceInfo.unlocked
		Essence.Rank		= EssenceInfo.rank
	end
end
