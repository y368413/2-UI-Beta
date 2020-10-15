ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
]]

local super = Templates.Collection
Tools.Achievement = super:new()
local this = Tools.Achievement

function this:UpdateByID(ID)
	
	local Ach = self:GetByID(ID)
	
	local AchInfo = { GetAchievementInfo(ID) }
	Ach.Name = AchInfo[2]
	Ach.IsCompletedAcc = AchInfo[4]
	Ach.IsCompletedChar = AchInfo[13]
	Ach.Link = GetAchievementLink(ID)
	Ach.NumCriteria = GetAchievementNumCriteria(ID)
	Ach.CriteriaByID = nil
	Ach.CriteriaByIndex = nil
	
	local CompletedCriteriaFound = false
	local UncompletedCriteriaFound = false
	
	if(Ach.NumCriteria >= 1) then
		Ach.CriteriaByID = {}
		Ach.CriteriaByIndex = {}
	end
		
	for i = 1, Ach.NumCriteria do
		local CritInfo = { GetAchievementCriteriaInfo(ID, i) }
		
		--if the user does not want CharacterAchievements and the achievement is acc-complete, we will override all of the criteria as completed
		if((Ach.IsCompletedAcc == true) and (TTD2.Tools.SavedData:GetCharacterSetting("CharacterAchievements") == false)) then
			CritInfo[3] = true
		end
		
		if(CritInfo[3] == true) then
			CompletedCriteriaFound = true
		else
			UncompletedCriteriaFound = true
		end
		
		Ach.CriteriaByIndex[i] = 
		{
			Name		= CritInfo[1],
			IsCompleted = CritInfo[3],
			ID			= CritInfo[10]
		}
		local CritID = CritInfo[10]
		if(CritID ~= nil and CritID ~= 0) then
			Ach.CriteriaByID[CritID] = 
			{
				Name		= CritInfo[1],
				IsCompleted = CritInfo[3],
				Index		= i
			}
		end
	end
	
	--test for partial completion
	Ach.IsPartiallyCompleted = false
	if(CompletedCriteriaFound == true and UncompletedCriteriaFound == true) then
		Ach.IsPartiallyCompleted = true
	end
	
	--set the "master" completion status depending on options
	if(Ach.IsCompletedChar == true) then
		if(UncompletedCriteriaFound == true) then
			if(Tools.SavedData:GetCharacterSetting("AchievementCompletionist") == true) then
				Ach.IsCompleted = false --the current character has the achievement but not all of the criteria and the user wants to know that
			else
				Ach.IsCompleted = true --uncompleted criteria found but user does not want to know!
			end
		else
			Ach.IsCompleted = true --The current character has earned this achievement AND all of the criteria
		end
	else
		if(Ach.IsCompletedAcc == true) then
			if(	(Tools.SavedData:GetCharacterSetting("AchievementCompletionist")	== true)	or --at this point we know he current character has not earned the achievement and therefore criteria will be missing since those are always character specific for non-blue achievements
				(Tools.SavedData:GetCharacterSetting("CharacterAchievements")	== true)	) then
				Ach.IsCompleted = false --again: we KNOW criteria will be missing since the character has not earned this achievement
			else
				Ach.IsCompleted = true
			end
		else
			Ach.IsCompleted = false
		end
	end
end
