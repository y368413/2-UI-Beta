ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
methods to ask if a recipe is learned based on tooltip parsing
]]

local super = Templates.Base
Tools.Recipe = super:new()
local this = Tools.Recipe

this.LearnedString = ITEM_SPELL_KNOWN

function this:IsRecipeInfoReady(RecipeItemID)
	
	Tools.Tooltip:QueryItemByID(RecipeItemID)		
	return Tools.Tooltip:IsReady()
end

function this:IsRecipeLearned(RecipeItemID)
	
	Tools.Tooltip:QueryItemByID(RecipeItemID)
	if(Tools.Tooltip:IsReady() == false) then
		Tools.Chat:Error("trying to request recipe info before tooltip was ready: "..RecipeItemID)
		return false
	end
	
	local Lines = Tools.Tooltip:GetRegionText()
	
	return Tools.Table:Contains(Lines, self.LearnedString)
end
