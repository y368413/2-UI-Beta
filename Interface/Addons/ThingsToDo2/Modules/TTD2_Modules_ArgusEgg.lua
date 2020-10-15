ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
The purpose of this module is to check if you own the various collectibles from the egg-item looted on argus and
check available WQ-Sources for them if you don't have them.

NOTE: This module will only print "todo" status if the WQ is up. If the source is not looted but the WQ is not up
"rare source" will be used instead.
]]

local super = Templates.UIButtonChatModule
Modules.ArgusEgg = super:new()
local this = Modules.ArgusEgg

this.Name = "[Argus] Egg"

function this:Initialise()
	
	self.EggData =
	{
		Item = { NormalID = 153190, CrackedID = 153191 },
		Content = 
		{
			Mounts =
			{
				{ ItemID = 152840, JournalID = 976 },
				{ ItemID = 152841, JournalID = 975 },
				{ ItemID = 152842, JournalID = 974 },
				{ ItemID = 152843, JournalID = 906 }
			},
			Pets =
			{
				{ ItemID = 153054, SpeciesID = 2118 },
				{ ItemID = 153055, SpeciesID = 2119 }
			}
		},
		Sources =
		{
			{ MapID = 830, PosX = 0.705, PosY = 0.337, FlagQuestID = 48667, WQuestID = 48502, Name = "Naroua" },
			{ MapID = 882, PosX = 0.442, PosY = 0.498, FlagQuestID = 48712, WQuestID = 48732, Name = "Sabuul" },
			{ MapID = 885, PosX = 0.643, PosY = 0.482, FlagQuestID = 48812, WQuestID = 48827, Name = "Varga" }
		}
	}
	
	TTD2.Tools.Item:AddByID(self.EggData.Item.NormalID)
	TTD2.Tools.Item:AddByID(self.EggData.Item.CrackedID)
	
	for _, Mount in pairs(self.EggData.Content.Mounts) do
		TTD2.Tools.Item:AddByID(Mount.ItemID)
		TTD2.Tools.MountJournal:AddByID(Mount.JournalID)
	end
	
	for _, Pet in pairs(self.EggData.Content.Pets) do
		TTD2.Tools.Item:AddByID(Pet.ItemID)
		TTD2.Tools.PetJournal:AddByID(Pet.SpeciesID)
	end
	
	for _, Source in pairs(self.EggData.Sources) do
		TTD2.Tools.Quest:AddByID(Source.FlagQuestID)
	end
	
	return
end

function this:CreateOutput()
	self:Init()
	
	--[[
	The logic here is a little more complecated than usual. the priorities of the status are like this:
	- collected if collected
	- done, if no sources are available
	- todo, if any WQ is up
	- rare, if any source is still available
	]]
	
	local SomethingMissing	= false
	local SourcesAvailable	= false
	local WQsAvailable		= false
	
	TTD2.Tools.Item:UpdateByID(self.EggData.Item.NormalID)
	TTD2.Tools.Item:UpdateByID(self.EggData.Item.CrackedID)
	
	for _, Mount in pairs(self.EggData.Content.Mounts) do
		TTD2.Tools.Item:UpdateByID(Mount.ItemID)
		TTD2.Tools.MountJournal:UpdateByID(Mount.JournalID)
		if(TTD2.Tools.MountJournal:GetByID(Mount.JournalID).IsCollected ~= true) then
			SomethingMissing = true
		end
	end
	
	for _, Pet in pairs(self.EggData.Content.Pets) do
		TTD2.Tools.Item:UpdateByID(Pet.ItemID)
		TTD2.Tools.PetJournal:UpdateByID(Pet.SpeciesID)
		if(TTD2.Tools.PetJournal:GetByID(Pet.SpeciesID).IsCollected ~= true) then
			SomethingMissing = true
		end
	end
	
	for _, Source in pairs(self.EggData.Sources) do
		TTD2.Tools.Quest:UpdateByID(Source.FlagQuestID)
		if(TTD2.Tools.Quest:GetByID(Source.FlagQuestID).IsCompleted ~= true) then
			SourcesAvailable = true
			if(TTD2.Tools.WorldQuest:IsActiveByID(Source.WQuestID) == true) then
				WQsAvailable = true
			end
		end
		Source.Name = TTD2.Tools.WorldQuest:GetNameByID(Source.WQuestID)
	end
	
	local Out = TTD2.Tools.Output
	
	local DefaultStatus = nil
	if(SomethingMissing == false) then
		DefaultStatus = Out.Status.Completed
	elseif(WQsAvailable == true) then
		DefaultStatus = Out.Status.ToDo		--there is a source available
	elseif(SourcesAvailable == true) then
		DefaultStatus = Out.Status.Rare		--there may be a source available
	else
		DefaultStatus = Out.Status.Done		--there is no source available
	end
	
	Out:AddLine(DefaultStatus, TTD2.Tools.Item:GetByID(self.EggData.Item.NormalID).Link.." >> "..TTD2.Tools.Item:GetByID(self.EggData.Item.CrackedID).Link)
	
	if(SomethingMissing == true) then --only list sources if something was missing
		for _, Source in pairs(self.EggData.Sources) do
			if(TTD2.Tools.Quest:GetByID(Source.FlagQuestID).IsCompleted == true) then
				Out:AddLine(Out.Status.Done, Source.Name)
			elseif(TTD2.Tools.WorldQuest:IsActiveByID(Source.WQuestID) == true) then
				Out:AddLine(Out.Status.ToDo, TTD2.Tools.ComplexChat:GetWQStatusString(Source.WQuestID))
			else
				--still a rare source
				Out:AddLine(Out.Status.Rare, TTD2.Tools.TomTom:CreateLink(Source.MapID,Source.PosX,Source.PosY,Source.Name))
			end
		end
	end
	
	for _, Mount in pairs(self.EggData.Content.Mounts) do
		if(TTD2.Tools.MountJournal:GetByID(Mount.JournalID).IsCollected == true) then
			Out:AddLine(Out.Status.Completed, TTD2.Tools.Item:GetByID(Mount.ItemID).Link)
		else
			Out:AddLine(DefaultStatus, TTD2.Tools.Item:GetByID(Mount.ItemID).Link)
		end
	end

	for _, Pet in pairs(self.EggData.Content.Pets) do
		if(TTD2.Tools.PetJournal:GetByID(Pet.SpeciesID).IsCollected == true) then
			Out:AddLine(Out.Status.Completed, TTD2.Tools.Item:GetByID(Pet.ItemID).Link)
		else
			Out:AddLine(DefaultStatus, TTD2.Tools.Item:GetByID(Pet.ItemID).Link)
		end
	end
end
