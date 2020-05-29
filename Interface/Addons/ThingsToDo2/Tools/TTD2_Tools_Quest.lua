ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
provides methods to query quest completion status, name and link
--]]

local super = Templates.AsynchronousCollection
Tools.Quest = super:new()
local this = Tools.Quest

function this:UpdateObjectives(ID)

	local QuestInfo = self:GetByID(ID)
	
	QuestInfo.Objectives = QuestInfo.Objectives or {}
	Tools.Table:Clear(QuestInfo.Objectives)
	
	if(QuestInfo.IsCompleted == true) then
		return
	end
	
	if(QuestInfo.IsInLog == true) then
		--quests in log have their own API
		local LogIndex = GetQuestLogIndexByID(ID)
		local NumObjectives = GetNumQuestLeaderBoards(LogIndex)
		
		for i=1,NumObjectives do
			local ObjectiveText, ObjectiveType, ObjectiveFinished = GetQuestLogLeaderBoard(i,LogIndex)
			QuestInfo.Objectives[i] = 
			{
				Text		= ObjectiveText,
				Type		= ObjectiveType,
				IsCompleted	= ObjectiveFinished
			}
		end
		
		return
	end
	
	if(QuestInfo.IsTask == true) then
		--for task quests there is an alternative API
		local _,_,NumObjectives = GetTaskInfo(ID)
		
		for i=1,NumObjectives do
			local ObjectiveText, ObjectiveType, ObjectiveFinished = GetQuestObjectiveInfo(ID,i,false)
			QuestInfo.Objectives[i] = 
			{
				Text		= ObjectiveText,
				Type		= ObjectiveType,
				IsCompleted	= ObjectiveFinished
			}
		end
		
		return
	end
	
	--quest is not complete, not in log and not a task - nothing we can say about objectives
	Tools.Chat.Error("requesting objectives for quest that is neither in log nor a task: "..ID)
end

function this:AsynchronousUpdateByID(ID)
	local Quest = self:GetByID(ID)
	
	Tools.Tooltip:QueryQuestByID(ID)
	local Complete = Tools.Tooltip:IsReady()
	if(Complete == true) then
		Quest.Name = Tools.Tooltip:GetRegionText()[1]
	end

	if((Quest.Name == nil) or (Quest.Name == " ") or (string.find(Quest.Name, "quest:") == 1)) then --there is currently a bug with empty questnames
		Quest.Name = "quest:"..ID
		Complete = false
	end

	Quest.Link = self:ConstructLink("quest", ID, Quest.Name)
	
	return Complete
end

function this:UpdateByID(ID)
	super.UpdateByID(self, ID)
	
	local Quest = self:GetByID(ID)
	
	--this can change and always has to be updated
	local LogIndex = GetQuestLogIndexByID(ID)
	Quest.IsCompleted = IsQuestFlaggedCompleted(ID)
	Quest.IsInLog = (LogIndex ~= 0)
	Quest.IsTask = IsQuestTask(ID)
	Quest.TimeLeftMinutes = C_TaskQuest.GetQuestTimeLeftMinutes(ID) or 1 --this API also works for certain non-task quests; most notably: Emissaries; it is a non-instant call, though, meaning the initial return value can be nil
	
	if(Quest.IsInLog == true) then
		Quest.Link = GetQuestLink(ID)
	end

	return
end
