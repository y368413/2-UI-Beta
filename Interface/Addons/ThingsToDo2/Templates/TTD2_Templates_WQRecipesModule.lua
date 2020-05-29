ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
this module tests the learned status of recipes awardedby worldquests and checks for the availability of these quests.
it also transforms the more human-readable input-table of the specialised modules into one better suited for filtering.
]]

local super = Templates.UIButtonChatModule
Templates.WQRecipesModule = super:new()
local this = Templates.WQRecipesModule

function this:Initialise()
	
	local CompleteWQRecipesData = self:GetCompleteWQRecipesData()
	
	local function TransferData(Source)
		if(Source == nil) then
			return
		end
		
		self.WQRecipesData = self.WQRecipesData or {}
		for _,ProfessionData in pairs(Source) do
			self.WQRecipesData[ProfessionData.ProfessionID] = self.WQRecipesData[ProfessionData.ProfessionID] or {}
			local CurrentProfession = self.WQRecipesData[ProfessionData.ProfessionID]
			
			for _, RecipeData in pairs(ProfessionData.Recipes) do
				CurrentProfession[RecipeData.ItemID] = CurrentProfession[RecipeData.ItemID] or {}
				local CurrentRecipe = CurrentProfession[RecipeData.ItemID]
				
				CurrentRecipe.WQID		= RecipeData.WQID
				CurrentRecipe.IsDrop	= RecipeData.IsDrop --some recipes are dropped by mobs that are only up during worldquests instead of being rewarded by the quest itself
			end
		end
	end
	
	--build a data table based on our actual faction
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	TransferData(CompleteWQRecipesData[TTD2.Tools.Unit.PlayerFaction.Neutral])
	TransferData(CompleteWQRecipesData[MyFaction])
	
	--init recipe ItemID data
	for ProfessionID,ProfessionData in pairs(self.WQRecipesData) do
		for ItemID,WQID in pairs(ProfessionData) do
			TTD2.Tools.Item:AddByID(ItemID)
		end
	end
end

function this:PrepareData()
	self:Init()
	
	local AsynchronousDataReady = true	
	self.PreparedData = {}
	
	for ProfID,ProfData in pairs(self.WQRecipesData) do
		--Spartans, what is your profession?
		if(TTD2.Tools.Profession:DoesCharacterHaveProfession(ProfID) == true) then
			for ItemID,RecipeData in pairs(ProfData) do
				if(TTD2.Tools.Recipe:IsRecipeInfoReady(ItemID) == false) then
					AsynchronousDataReady = false
				else
					TTD2.Tools.Item:UpdateByID(ItemID)
					self.PreparedData[ItemID] = { WQID = RecipeData.WQID, IsDrop = RecipeData.IsDrop }
					
					if(TTD2.Tools.WorldQuest:IsActiveByID(RecipeData.WQID) == true) then
						TTD2.Tools.WorldQuest:PreloadRewardsByID(RecipeData.WQID)
						if(TTD2.Tools.WorldQuest:IsRewardInfoReadyByID(RecipeData.WQID) == false) then
							AsynchronousDataReady = false
						end
					end
				end
			end
		end
	end
	
	return AsynchronousDataReady
end

function this:CreateOutput()
	self:Init()
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	if(MyLevel < self.MinimumLevel) then
		return
	end
	
	local Out = TTD2.Tools.Output	
	
	for ItemID,RecipeData in pairs(self.PreparedData) do
	
		local ItemInfo = TTD2.Tools.Item:GetByID(ItemID)
		local LineStatus = Out.Status.ToDo
		local LineContent = ItemInfo.Link
		
		if(TTD2.Tools.Recipe:IsRecipeLearned(ItemID) == true) then
			LineStatus = Out.Status.Completed
		else
			--this recipe is missing, check the worldquest
			LineContent = LineContent.." << "..TTD2.Tools.ComplexChat:GetWQStatusString(RecipeData.WQID)
			if(TTD2.Tools.WorldQuest:IsActiveByID(RecipeData.WQID) == true) then
				LineStatus = Out.Status.ToDo
				
				--if the recipe is not a drop, we check the reward data
				if(RecipeData.IsDrop == nil) then
					if(TTD2.Tools.WorldQuest:DoesRewardItemByID(RecipeData.WQID, ItemID) == false) then
						--add warning about low skill
						LineContent = LineContent.."\n"..TTD2.Tools.Chat:Red("WARNING")..": Your profession-skill is too low to get this recipe rewarded! You might also want to check your bags/bank if you already have the recipe laying around."
					end
				else
					LineContent = LineContent.."\n"..TTD2.Tools.Chat:Yellow("Note")..": Recipe is dropped by the Quest-Target, not rewarded by the Quest itself."
				end
			else
				LineStatus = Out.Status.Done
			end
		end
		
		Out:AddLine(LineStatus, LineContent)
	end
end
