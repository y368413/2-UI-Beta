ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
]]

local super = Templates.UIButtonChatModule
Modules.LegionFishing = super:new()
local this = Modules.LegionFishing

this.Name = "[Legion] Fishing"

function this:Initialise()
	
	--for some quests, there are several possibilities that do share a name but not an ID
	--for the achievement, we only need one of them
	
	self.AchievementID = 10598
	
	self.WQuestsByCriteriaIndex =
	{ 
		{ 41270, 41612, 41613 },
		{ 41267 },
		{ 41279, 41604, 41605 },
		{ 41264, 41598, 41599 },
		{ 41268 },
		{ 41252 },
		{ 41265, 41610, 41611 },
		{ 41280, 41616, 41617 },
		{ 41244, 41596, 41597 },
		{ 41274, 41602, 41603 },
		{ 41243, 41609 },
		{ 41273 },
		{ 41266 },
		{ 41275, 41614, 41615 },
		{ 41278 },
		{ 41271 },
		{ 41277 },
		{ 41240 },
		{ 41269, 41600, 41601 },
		{ 41253 },
		{ 41276 },
		{ 41272 },
		{ 41282 },
		{ 41283 }
	}
	
	TTD2.Tools.Achievement:AddByID(self.AchievementID)
	
	return
end

function this:AnyWQUp(WQIDs)
	self:Init()
	
	for _, WQID in ipairs(WQIDs) do
		if(TTD2.Tools.WorldQuest:IsActiveByID(WQID)) then
			return WQID
		end
	end
	return nil
end

function this:CreateOutput()
	self:Init()
	
	local Out = TTD2.Tools.Output
	
	TTD2.Tools.Achievement:UpdateByID(self.AchievementID)
	
	local AchInfo = TTD2.Tools.Achievement:GetByID(self.AchievementID)
	
	local AchLinkIndex = Out:AddLine(Out.Status.ToDo, AchInfo.Link)
	
	local AnythingMissing = false
	local AnythingToDo = false
	
	for CritIndex, WQIDs in ipairs(self.WQuestsByCriteriaIndex) do
		local CritInfo = AchInfo.CriteriaByIndex[CritIndex]
		if(CritInfo.IsCompleted == true) then
			Out:AddLine(Out.Status.Completed, CritInfo.Name, AchLinkIndex)
		else
			AnythingMissing = true
			local WQ = self:AnyWQUp(WQIDs)
			if(WQ == nil) then
				Out:AddLine(Out.Status.Done, CritInfo.Name, AchLinkIndex)
			else
				AnythingToDo = true
				TTD2.Tools.ComplexChat:AddWQStatusLine(WQ, AchLinkIndex)
			end
		end
	end
	
	--update AchLinkLine
	local AchStatus = Out.Status.Completed
	if(AnythingMissing == true) then
		if(AnythingToDo == true) then
			AchStatus = Out.Status.ToDo
		else
			AchStatus = Out.Status.Done
		end
	end
	Out:ChangeLine(AchLinkIndex, AchStatus)
end	
