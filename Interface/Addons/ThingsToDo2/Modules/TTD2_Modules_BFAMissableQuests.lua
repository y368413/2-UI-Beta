ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
simple output of hard to find quests; uses tooltip parsing to get quest titles
]]

local super = Templates.UIButtonChatModule
Modules.BFAMissableQuests = super:new()
local this = Modules.BFAMissableQuests

this.Name = "[BFA] Easy to miss Quests"

function this:Initialise()
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	if(MyFaction == TTD2.Tools.Unit.PlayerFaction.Alliance) then
		self.QuestData =
		{
			{	--Setzlinge im Schnee
				ID = 51543,
				MapID = 896,	--Drustvar
				PosX = 0.334,
				PosY = 0.650
			},
			{	--Ein zündender Einfall
				ID = 50912,
				MapID = 896,	--Drustvar
				PosX = 0.350,
				PosY = 0.400
			},
			{	--Wildgewordene Affenbande
				ID = 53449,
				MapID = 862,	--Zuldazar
				PosX = 0.570,
				PosY = 0.585,
				IsBreadcrumb = true,
				FollowUps = { 53450, 53453 }
			},
			{	--GESUCHT: Dunkelsprecher Jo'la
				ID = 51069,
				MapID = 862,	--Zuldazar
				PosX = 0.637,
				PosY = 0.102
			},
			{	--GESUCHT: Kaiserin der Säbelhauer
				ID = 53336,
				MapID = 862,	--Zuldazar
				PosX = 0.516,
				PosY = 0.455
			},
			{	--GESUCHT: Alpha der Eisenknöchel
				ID = 53337,
				MapID = 862,	--Zuldazar
				PosX = 0.516,
				PosY = 0.455
			},
			{	--Frohe Kunde (Start Tortollaner Questreihe)
				ID = 49284,
				MapID = 862,	--Zuldazar
				PosX = 0.705,
				PosY = 0.650
			},
			{	--Es liegt mir auf der Zunge
				ID = 50240,
				MapID = 1165,	--Zuldazar>Dazar'alor
				PosX = 0.535,
				PosY = 0.094
			}
		}
	else
		self.QuestData = {} --only Alliance-Quests for now
	end
	
	for _,Quest in pairs(self.QuestData) do
		TTD2.Tools.Quest:AddByID(Quest.ID)
		if(Quest.IsBreadcrumb == true) then
			for _,FollowUp in pairs(Quest.FollowUps) do
				TTD2.Tools.Quest:AddByID(FollowUp)
			end
		end
	end
	
	return
end

function this:ExtraBreadcrumbCheck(Quest, Q, BCQLine)
	if(Quest.IsBreadcrumb ~= true) then
		return
	end
	
	local Out = TTD2.Tools.Output
	
	--check for completed followups first
	local AnyCompleted = false
	for _, FUPQID in pairs(Quest.FollowUps) do
		local FUPQ = TTD2.Tools.Quest:GetByID(FUPQID)
		if(FUPQ.IsCompleted == true) then
			AnyCompleted = true			
			Out:AddLine(Out.Status.Done, "FollowUp completed: "..FUPQ.Link)
		end
	end
	
	if(AnyCompleted == true) then
		Out:AddLine(Out.Status.Done, Q.Link..", cannot be completed anymore because of FollowUp-Quests.", BCQLine)
		return
	end
	
	local AnyInLog = false
	for _, FUPQID in pairs(Quest.FollowUps) do
		local FUPQ = TTD2.Tools.Quest:GetByID(FUPQID)
		if(FUPQ.IsInLog == true) then
			AnyInLog = true
			Out:AddLine(Out.Status.ToDo, "FollowUp in Log: "..FUPQ.Link)
		end
	end
	
	if(AnyInLog == true) then
		Out:AddLine(Out.Status.ToDo, Q.Link..", "..TTD2.Tools.Chat:Red("abandon").." FollowUp-Quests to accept this Quest.", BCQLine)
		return
	end
end

function this:CreateOutput()
	self:Init()
	
	local Out = TTD2.Tools.Output
	
	--[[
	there is a complication with "breadcrumb" quests. BC quests are quests that lead you to a NPC with more
	quests, but once you completed any of those followup quests (or have them in your log) you will no longer
	be able to accept the BC quest.
	Here is the complete logic check.
	
		Case 1: Quest is completed
			Store as completed
		Case 2: Quest is in Log
			Store as "ToDo", but without coordinates and state that you are already on this quest
		Case 3: else
			Subcase 1: Quest is not a breadcrumb (=BC)
				Store as ToDo with TomTom link
			Subcase 1: Quest is BC
				SubSubCase 1: Any of the FollowUps completed
					Store as Done, state that followups are completed
					List as Done FollowUps that have been completed; using Done Status because using "Completed" could lead to confusing output
				SubSubCase 2: Any of the FollowUps inLog
					Store as ToDo with TomTom link
					List as ToDo FollowUps that need to be abandoned to accept the quest
				SubSubCase 3: else
					Store as ToDo
	--]]
	
	for _,Quest in pairs(self.QuestData) do
		TTD2.Tools.Quest:UpdateByID(Quest.ID)
		if(Quest.IsBreadcrumb == true) then
			for _,FollowUp in pairs(Quest.FollowUps) do
				TTD2.Tools.Quest:UpdateByID(FollowUp)
			end
		end
		
		local Q = TTD2.Tools.Quest:GetByID(Quest.ID)
		
		if(Q.IsCompleted == true) then
			Out:AddLine(Out.Status.Completed, Q.Link)
		elseif(Q.IsInLog == true) then
			Out:AddLine(Out.Status.ToDo, Q.Link.." "..ERR_QUEST_ALREADY_ON)
		else
			local MapName = TTD2.Tools.Map:GetNameByID(Quest.MapID)
			--local PrintQuest = this.private.CheckPrintForBreadcrumb(quest)
			local Message = Q.Link..TTD2.Tools.TomTom:CreateLink(Quest.MapID,Quest.PosX,Quest.PosY,Q.Name)
			
			local BCQLine = Out:AddLine(Out.Status.ToDo, Message)
			self:ExtraBreadcrumbCheck(Quest, Q, BCQLine)
		end
	end
end
