ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
show the status of your IE weekly quest
]]

--this module
local super = Templates.UIButtonChatModule
Modules.BFAIslandStatus = super:new()
local this = Modules.BFAIslandStatus

this.Name = "[BFA] Island-Status"

function this:Initialise()
	
	self.QuestID = nil
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	if(MyFaction == TTD2.Tools.Unit.PlayerFaction.Alliance) then
		self.QuestID = 53436
	elseif(MyFaction == TTD2.Tools.Unit.PlayerFaction.Horde) then
		self.QuestID = 53435
	end
	
	TTD2.Tools.Quest:AddByID(self.QuestID)
	
	return
end

function this:CreateOutput()
	self:Init()
	
	local Out = TTD2.Tools.Output
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	if(MyLevel < 120) then
		return
	end
	
	TTD2.Tools.Quest:UpdateByID(self.QuestID)
	TTD2.Tools.Quest:UpdateObjectives(self.QuestID)
	
	local QuestInfo = TTD2.Tools.Quest:GetByID(self.QuestID)
	
	
	if(QuestInfo.IsCompleted == true) then
		Out:AddLine(Out.Status.Completed, QuestInfo.Link)
	else
		Out:AddLine(Out.Status.ToDo, QuestInfo.Objectives[1].Text)
		if(QuestInfo.Objectives[1].IsCompleted == true) then
			Out:AddLine(Out.Status.ToDo, "Hand in "..QuestInfo.Link)
		end
	end
	
	return
end
