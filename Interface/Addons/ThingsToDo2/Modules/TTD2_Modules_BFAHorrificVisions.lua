ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
checks loot lockouts for BFA Horrific Visions by QuestID
]]

local super = Templates.UIButtonChatModule
Modules.BFAHorrificVisions = super:new()
local this = Modules.BFAHorrificVisions

this.Name = "[BFA] Horrific Visions"

function this:Initialise()

	self.HVUnlockQuestID = 57524
	self.HVRewards =
	{
		[1] = { ilvl = 445, QuestID = 57842 },	--0 masks
		[2] = { ilvl = 450, QuestID = 57846 },	--1 mask
		[3] = { ilvl = 455, QuestID = 57843 },	--2 masks
		[4] = { ilvl = 460, QuestID = 57847 },	--3 masks
		[5] = { ilvl = 465, QuestID = 57844 },	--4 masks
		[6] = { ilvl = 470, QuestID = 57848 }	--5 masks
	}
	
	TTD2.Tools.Quest:AddByID(self.HVUnlockQuestID)
	for _,Reward in ipairs(self.HVRewards) do
		TTD2.Tools.Quest:AddByID(Reward.QuestID)
	end
	
	return
end

function this:CreateOutput()
	self:Init()
	
	--test if this character has access to visions
	TTD2.Tools.Quest:UpdateByID(self.HVUnlockQuestID)
	if(TTD2.Tools.Quest:GetByID(self.HVUnlockQuestID).IsCompleted ~= true) then
		return
	end
	
	
	for _,Reward in ipairs(self.HVRewards) do
		TTD2.Tools.Quest:UpdateByID(Reward.QuestID)
	end

	local Out = TTD2.Tools.Output
	
	--we have to consider options here: HorrificWaste & DemandingVisions; we will do the default behaviour first and modify that output based on the options afterwards
	
	--first, default behaviour; store the buffered lines while writing them
	local RewardLines = {}
	local Completed = {}
	local Available = {}
	
	for i,Reward in ipairs(self.HVRewards) do
		RewardLines[i] = Out:AddLine(Out.Status.ToDo, (i-1).." mask(s): ilvl"..Reward.ilvl)
		if(TTD2.Tools.Quest:GetByID(Reward.QuestID).IsCompleted == true) then
			Completed[i] = true
			Out:ChangeLine(RewardLines[i], Out.Status.Completed)
		else
			Available[i] = true
		end
	end
	
	--now for the options
	if(TTD2.Tools.SavedData:GetCharacterSetting("HorrificWaste") == true) and (TTD2.Tools.Table:IsEmpty(Completed) == false) then
		--we are supposed to set all todo lines to done
		for i in pairs(Available) do
			--add the demanding check here: if reward[6] is still available AND Demanding option is set, do not change the line => invert condition for line change since there is no "continue"
			if(TTD2.Tools.SavedData:GetCharacterSetting("DemandingVisions") == false) or (i ~= 6) then
				Out:ChangeLine(RewardLines[i], Out.Status.Done)
			end
		end
	end
	
	return
end
