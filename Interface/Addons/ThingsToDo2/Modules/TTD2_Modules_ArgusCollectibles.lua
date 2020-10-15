ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
all of the mounts, pets and toys dropped directly off of "rare" mobs
all of these mobs have a daylie lockout and can only be looted once per day
most of these mobs also have a WQ associated with them which can be used as a confirmation that they are definetly up
]]

local super = Templates.UIButtonChatModule
Modules.ArgusCollectibles = super:new()
local this = Modules.ArgusCollectibles

this.Name = "[Argus] Collectibles"
this.MinimumLevel = 110

function this:Initialise()
	
	--first a list in most human-readable form
	local Sources =
	{
		[1] 	= { NPCID = 127288, MapID = 885, X = 0.631, Y = 0.253, FlagQuest = 48821, WQuest = 48835 }, --Kerrax
		[2] 	= { NPCID = 122958, MapID = 885, X = 0.618, Y = 0.373, FlagQuest = 49183, WQuest = 47561 }, --Blistermaw
		[3] 	= { NPCID = 126199, MapID = 885, X = 0.532, Y = 0.358, FlagQuest = 48810, WQuest = 48465 }, --Vrax'thul
		[4] 	= { NPCID = 126040, MapID = 885, X = 0.655, Y = 0.267, FlagQuest = 48809, WQuest = 48467 }, --Puscilla
		[5] 	= { NPCID = 126912, MapID = 882, X = 0.496, Y = 0.100, FlagQuest = 48721, WQuest = 48740 }, --Skreeg the Devourer
		[6] 	= { NPCID = 126852, MapID = 882, X = 0.557, Y = 0.598, FlagQuest = 48695, WQuest = 48696 }, --Wrangler Kravos
		[7] 	= { NPCID = 127581, MapID = 885, X = 0.547, Y = 0.391, FlagQuest = 48966, WQuest = nil, PreQuest = 48870 }, --The Many-Faced Devourer
		[8] 	= { NPCID = 127705, MapID = 885, X = 0.655, Y = 0.266, FlagQuest = 48970, WQuest = nil, RequItem = 152999 }, --Mother Rosula
		[9]		= { NPCID = 126887, MapID = 882, X = 0.303, Y = 0.404, FlagQuest = 48709, WQuest = 48729 }, --Ataxon
		[10]	= { NPCID = 126338, MapID = 885, X = 0.619, Y = 0.643, FlagQuest = 48814, WQuest = 48829 }, --Wrath-Lord Yarez
		[11]	= { NPCID = 127700, MapID = 885, X = 0.774, Y = 0.749, FlagQuest = 48967, WQuest = nil, PreQuest = 49007 }, --Squadron Commander Vishax
		[12]	= { NPCID = 127703, MapID = 885, X = 0.586, Y = 0.118, FlagQuest = 48968, WQuest = nil, ExtraInfo = "requires 3 players to summon." }, --Doomcaster Suprax
		[13]	= { NPCID = 127706, MapID = 885, X = 0.650, Y = 0.826, FlagQuest = 48971, WQuest = nil, RequItem = 153226 }, --Rezira the Seer
		[14]	= { NPCID = 123464, MapID = 830, X = 0.534, Y = 0.309, FlagQuest = 48565, WQuest = 48512 }, --Sister Subversia <Coven of Shivarra>
		[15]	= { NPCID = 126865, MapID = 882, X = 0.363, Y = 0.236, FlagQuest = 48703, WQuest = 48723 }, --Vigilant Thanos
		[16]	= { NPCID = 126866, MapID = 882, X = 0.638, Y = 0.646, FlagQuest = 48704, WQuest = 48724 }, --Vigilant Kuro
		[17]	= { NPCID = 126900, MapID = 882, X = 0.614, Y = 0.502, FlagQuest = 48718, WQuest = 48737 }, --Instructor Tarahna
		[18]	= { NPCID = 126862, MapID = 882, X = 0.438, Y = 0.602, FlagQuest = 48700, WQuest = 48701 } --Baruut the Bloodthirsty
	}
	local Mounts =
	{
		{ ItemID = 152790, MountID = 955, src = { 1 } }, --übles scheusal
		{ ItemID = 152905, MountID = 979, src = { 2 } }, --purpurroter geiferschlund
		{ ItemID = 152903, MountID = 981, src = { 3, 4 } }, --gallzahnknirscher
		{ ItemID = 152904, MountID = 980, src = { 5 } }, --säurespucker
		{ ItemID = 152814, MountID = 970, src = { 6 } } --wahnsinniger chaosläufer
	}
	local Pets =
	{
		{ ItemID = 153195, SpeciesID = 2136, src = { 7 } },
		{ ItemID = 153252, SpeciesID = 2135, src = { 8 } },
		{ ItemID = 153056, SpeciesID = 2120, src = { 9 } }
	}
	local Toys =
	{
		{ ItemID = 153126, src = { 10 } },
		{ ItemID = 153253, src = { 11 } },
		{ ItemID = 153194, src = { 12 } },				
		{ ItemID = 153293, src = { 13 } },
		{ ItemID = 153124, src = { 14 } },
		
		{ ItemID = 153183, src = { 15, 16 } },
		
		{ ItemID = 153179, src = { 17 } },
		{ ItemID = 153180, src = { 17 } },
		{ ItemID = 153181, src = { 17 } },
		{ ItemID = 153193, src = { 18 } }
	}

	--[[
	our goal is to have a table of ItemID-Keys for the collectibles where each collectible has a table of sources
	that links directly to the actual source information.
	To get there, we will take 2 steps:
	1) Build the Collectible-Table and replace Source-Indices with NPCIDs
	2) Build the Source-Table with NPCID as key, completely disregarding the old Indices
	]]		
	self.Collectibles = {}
	for _, MountData in pairs(Mounts) do
		if(self.Collectibles[MountData.ItemID] ~= nil) then
			TTD2.Tools.Chat.Error(this.Name..": unexpected ItemID collision in source data: "..MountData.ItemID)
		end
		
		self.Collectibles[MountData.ItemID] = {}
		local Current = self.Collectibles[MountData.ItemID]
		Current.Type = "Mount"
		Current.MountID = MountData.MountID
		Current.Sources = {}
		for _, SourceIndex in pairs(MountData.src) do
			TTD2.Tools.Table:Append(Current.Sources, Sources[SourceIndex].NPCID)
		end
	end
	for _, PetData in pairs(Pets) do
		if(self.Collectibles[PetData.ItemID] ~= nil) then
			TTD2.Tools.Chat.Error(this.Name..": unexpected ItemID collision in source data: "..PetData.ItemID)
		end
		
		self.Collectibles[PetData.ItemID] = {}
		local Current = self.Collectibles[PetData.ItemID]
		Current.Type = "Pet"
		Current.SpeciesID = PetData.SpeciesID
		Current.Sources = {}
		for _, SourceIndex in pairs(PetData.src) do
			TTD2.Tools.Table:Append(Current.Sources, Sources[SourceIndex].NPCID)
		end
	end
	for _, ToyData in pairs(Toys) do
		if(self.Collectibles[ToyData.ItemID] ~= nil) then
			TTD2.Tools.Chat.Error(this.Name..": unexpected ItemID collision in source data: "..ToyData.ItemID)
		end
		
		self.Collectibles[ToyData.ItemID] = {}
		local Current = self.Collectibles[ToyData.ItemID]
		Current.Type = "Toy"
		Current.Sources = {}
		for _, SourceIndex in pairs(ToyData.src) do
			TTD2.Tools.Table:Append(Current.Sources, Sources[SourceIndex].NPCID)
		end
	end
	
	self.Sources = {}
	for _, Source in pairs(Sources) do
		if(self.Sources[Source.NPCID] ~= nil) then
			TTD2.Tools.Chat.Error(this.Name..": unexpected ItemID collision in source data: "..Source.NPCID)
		end
		
		self.Sources[Source.NPCID] = 
		{
			MapID		= Source.MapID,
			PosX		= Source.X,
			PosY		= Source.Y,
			FlagQuestID	= Source.FlagQuest,
			WQID		= Source.WQuest,
			PreQuestID	= Source.PreQuest,
			RequItemID	= Source.RequItem,
			ExtraInfo	= Source.ExtraInfo
		}
	end
	
	--[[
	we are finally done converting the source data. now lets init our journals
	]]
	
	for ItemID, CollectibleData in pairs(self.Collectibles) do
		TTD2.Tools.Item:AddByID(ItemID)
		
		if(CollectibleData.Type == "Mount") then
			TTD2.Tools.MountJournal:AddByID(CollectibleData.MountID)
		elseif(CollectibleData.Type == "Pet") then
			TTD2.Tools.PetJournal:AddByID(CollectibleData.SpeciesID)
		elseif(CollectibleData.Type == "Toy") then
			TTD2.Tools.ToyJournal:AddByID(ItemID)
		else
			TTD2.Tools.Chat:Error(this.Name..": unexpected item-type: "..CollectibleData.Type)
		end
	end
	
	for NPCID, SourceData in pairs(self.Sources) do
		TTD2.Tools.NPC:AddByID(NPCID)
		TTD2.Tools.Quest:AddByID(SourceData.FlagQuestID)
		
		if(SourceData.PreQuestID ~= nil) then
			TTD2.Tools.Quest:AddByID(SourceData.PreQuestID)
		end
		if(SourceData.RequItemID ~= nil) then
			TTD2.Tools.Item:AddByID(SourceData.RequItemID)
		end
	end
end

function this:PrepareData()
	self:Init()
	
	for ItemID, CollectibleData in pairs(self.Collectibles) do
		TTD2.Tools.Item:UpdateByID(ItemID)
		
		if(CollectibleData.Type == "Mount") then
			TTD2.Tools.MountJournal:UpdateByID(CollectibleData.MountID)
		elseif(CollectibleData.Type == "Pet") then
			TTD2.Tools.PetJournal:UpdateByID(CollectibleData.SpeciesID)
		elseif(CollectibleData.Type == "Toy") then
			TTD2.Tools.ToyJournal:UpdateByID(ItemID)
		else
			TTD2.Tools.Chat.Error(this.Name..": unexpected item-type: "..CollectibleData.Type)
		end
	end
	
	for NPCID, SourceData in pairs(self.Sources) do
		TTD2.Tools.NPC:UpdateByID(NPCID)
		SourceData.Name = TTD2.Tools.NPC:GetByID(NPCID).Name
		TTD2.Tools.Quest:UpdateByID(SourceData.FlagQuestID)
		
		if(SourceData.PreQuestID ~= nil) then
			TTD2.Tools.Quest:UpdateByID(SourceData.PreQuestID)
		end
		if(SourceData.RequItemID ~= nil) then
			TTD2.Tools.Item:UpdateByID(SourceData.RequItemID)
		end
	end
	
	return true
end

function this:CreateOutput()
	self:Init()
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	if(MyLevel < self.MinimumLevel) then
		return
	end
	
	local Out = TTD2.Tools.Output
	
	for ItemID, CollectibleData in pairs(self.Collectibles) do
		local ItemInfo			= TTD2.Tools.Item:GetByID(ItemID)
		local ItemCollected		= false
		local ItemLineIndex		= Out:AddLine(Out.Status.Completed, ItemInfo.Link)
		
		if(CollectibleData.Type == "Mount") then
			ItemCollected = TTD2.Tools.MountJournal:GetByID(CollectibleData.MountID).IsCollected
		elseif(CollectibleData.Type == "Pet") then
			ItemCollected = TTD2.Tools.PetJournal:GetByID(CollectibleData.SpeciesID).IsCollected
		elseif(CollectibleData.Type == "Toy") then
			ItemCollected = TTD2.Tools.ToyJournal:GetByID(ItemID).IsCollected
		else
			TTD2.Tools.Chat.Error(this.Name..": unexpected item-type: "..CollectibleData.Type)
		end
		
		--only loop sources if item missing
		if(ItemCollected == false) then
			local AnyToDoSource = false
			local AnyRareSource = false
		
			for _, NPCID in pairs(CollectibleData.Sources) do
				local SourceData	= self.Sources[NPCID]
				local SourceStatus	= Out.Status.ToDo
				local SourceContent	= SourceData.Name
				
				local SourceLineIndex = Out:AddLine(SourceStatus, SourceContent, ItemLineIndex)
				
				if(TTD2.Tools.Quest:GetByID(SourceData.FlagQuestID).IsCompleted == true) then
					--these sources have daylie lockput and cannot be looted no matter what
					SourceStatus	= Out.Status.Done
				elseif(SourceData.WQID == nil) then
					--these sources are 100% available if you have not done them today, but require something extra
					AnyToDoSource	= true
					SourceStatus	= Out.Status.ToDo
					SourceContent	= TTD2.Tools.TomTom:CreateLink(SourceData.MapID,SourceData.PosX,SourceData.PosY,SourceData.Name)
					if((SourceData.PreQuestID ~= nil) and (TTD2.Tools.Quest:GetByID(SourceData.PreQuestID).IsCompleted == false)) then
						Out:AddLine(
							SourceStatus,
							"complete "..TTD2.Tools.Quest:GetByID(SourceData.PreQuestID).Link.." to reach/summon.",
							SourceLineIndex)
					end
					if(SourceData.RequItemID ~= nil) then
						Out:AddLine(
							SourceStatus,
							"requires "..TTD2.Tools.Item:GetByID(SourceData.RequItemID).Link.." to reach/summon.",
							SourceLineIndex)
					end
					if(SourceData.ExtraInfo ~= nil) then
						Out:AddLine(
							SourceStatus,
							SourceData.ExtraInfo,
							SourceLineIndex)
					end					
				elseif((SourceData.WQID ~= nil) and (TTD2.Tools.WorldQuest:IsActiveByID(SourceData.WQID) == true)) then
					--these sources are 100% available Because their WQ is up
					AnyToDoSource	= true
					SourceStatus	= Out.Status.ToDo
					SourceContent	= TTD2.Tools.ComplexChat:GetWQStatusString(SourceData.WQID)
				else
					--these surces may be there. We don't know.
					AnyRareSource	= true
					SourceStatus	= Out.Status.Rare
					SourceContent	= TTD2.Tools.TomTom:CreateLink(SourceData.MapID,SourceData.PosX,SourceData.PosY,SourceData.Name)
				end
				Out:ChangeLine(SourceLineIndex, SourceStatus, SourceContent)
			end
			
			--update main item link
			local ItemStatus = Out.Status.Done
			if(AnyToDoSource == true) then
				ItemStatus = Out.Status.ToDo
			elseif(AnyRareSource == true) then
				ItemStatus = Out.Status.Rare
			end
			
			Out:ChangeLine(ItemLineIndex, ItemStatus)
		end
	end
end
