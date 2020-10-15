ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
this module uses an InsecureActionButton to crate archaeology items
]]

local super = Templates.UIButtonEventModule
Modules.ArchaeologyCrateButton = super:new()
local this = Modules.ArchaeologyCrateButton

this.Name = "[Archaeology] Crate Artifacts"

function this:Initialise()

	super.Initialise(self)
	
	self.Events["BAG_UPDATE_DELAYED"] = true
	
	--[[
	first, we need a method to get the crate-able artifact ItemIDs
	it is possible to ask the client for the names of artifacts the current character
	has restored. In theory, this information is enough to look for the items in bags,
	however for older races common artifacts cannot be crated and it is not sure the current
	style of crating will be continued forever.
	the most reliable and future-proof version is to manually store the IDs of all crate-able
	items.
	
	next, we should decide whether these ItemIDs should be loaded into memory once or every
	time the module is executed.
	
	holding the data makes the addon more responsive but increases memory consumption.
	
	as of 8.1.5 there seem to be 94 crate-able items in the game. The table holding these numbers
	will consume ~500 bytes or 1KB of memory. Even in an extreme worst-case scenario we are talking
	about maybe 5KB of data. This is negligible.
	--]]
	
	self.CrateAbleItemIDs =
	{
		--dwarf: none
		--draenei: none
		--fossil: none
		--night elf: none
		--nerubian: none
		--orc: none
		--tol'vir: none
		--troll: none
		--vrykul: none
		--mantid: 8
		95375, 95376, 95377, 95378, 95379, 95380, 95381, 95382,
		--pandaren: 10
		79896, 79897, 79898, 79899, 79900, 79901, 79902, 79903, 79904, 79905,
		--mogu: 10
		79908, 79909, 79910, 79911, 79912, 79913, 79914, 79915, 79916, 79917,
		--arakkoa: 10
		114197, 114198, 114199, 114200, 114201, 114202, 114203, 114204, 114205, 114206,
		--draenor clans: 19
		114141, 114143, 114145, 114147, 114149, 114151, 114153, 114155, 114157, 114159, 114161, 114163, 114165, 114167, 114169, 114171, 114173, 114175, 114177,
		--ogre: 10
		114181, 114183, 114185, 114187, 114189, 114190, 114191, 114192, 114193, 114194,
		--highborne: 5
		130906, 130907, 130908, 130909, 130910,
		--highmountain tauren: 5
		130911, 130912, 130913, 130914, 130915,
		--demonic: 5
		130916, 130917, 130918, 130919, 130920,
		--zandalari: 6
		154913, 154914, 154915, 154916, 154917, 160743,
		--drust: 6
		154921, 154922, 154923, 154924, 154925, 160741
		
		--have total: 94
		--should: 94
		--fine!
	}
	
	--add those items to item DB
	for _, ItemID in pairs(self.CrateAbleItemIDs) do
		TTD2.Tools.Item:AddByID(ItemID)
	end
	
	return
end

function this:UpdateSecureButton(Frame)
	self:Init()
	
	self:UpdateMacro()
	Frame:SetAttribute("type", "macro")
	Frame:SetAttribute("macrotext1", self.Macrotext)
end

function this:ModuleButtonCondition()
	self:Init()
	
	--update artifact items
	for _, ItemID in pairs(self.CrateAbleItemIDs) do
		TTD2.Tools.Item:UpdateByID(ItemID)
		TTD2.Tools.Item:UpdateBagLinkByID(ItemID)
	end
	
	--look for artifact item in bags
	local NextID = self:FindNextArtifactID()
	if(NextID == nil) then
		return false
	end
	
	return true
end

function this:FindNextArtifactID()
	self:Init()
	
	--return the first crate-able artifact found in inventory
	for _,ItemID in pairs(self.CrateAbleItemIDs) do
		TTD2.Tools.Item:UpdateByID(ItemID)
		TTD2.Tools.Item:UpdateBagLinkByID(ItemID)
		
		if(TTD2.Tools.Item:GetByID(ItemID).BagLink ~= nil) then
			return ItemID
		end
	end
	
	return nil
end

function this:UpdateMacro()
	self:Init()
	
	--look for artifacts in bags...
	local NextID = self:FindNextArtifactID()
	
	local ModuleString = TTD2.Tools.Chat:GetColoredAddonTitle()..": "..TTD2.Tools.Chat:Yellow(self.Name)..": "
	
	if(NextID == nil) then
		self.Macrotext = "/script print(\""..ModuleString.."No item to crate found in Inventory. Please refresh modules.\")"
	else
		self.Macrotext = "/script if(ThingsToDo2.Tools.Unit:IsPlayerFlying() == true) then print(\""..ModuleString..SPELL_FAILED_NOT_FLYING.."\") else print(\""..ModuleString..TTD2.Tools.Item:GetByID(NextID).Link.."\") end\n/use [noflying] item:"..NextID
	end
end

function this:ReceiveModuleEvent(Event, Data)
	self:Init()
	
	if(Event ~= "BAG_UPDATE_DELAYED") then
		TTD2.Tools.Chat:Error("received unexpected event "..Event.." in "..self.Name)
	end
	
	self:UpdateSecureButton(self.SecureButton.Frame)
end
