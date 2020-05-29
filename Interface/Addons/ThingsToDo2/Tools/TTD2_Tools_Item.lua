ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
This module manages a table of item infoamtion it tries to fill it. If the infomation is not currently available
the data will be markes as incomplete and tried to be updated later.
]]

local super = Templates.AsynchronousCollection
Tools.Item = super:new()
local this = Tools.Item

function this:GetBagPositionByID(ItemID)
	for Bag = 0, NUM_BAG_SLOTS do
		for Slot = 1, GetContainerNumSlots(Bag) do
			if(GetContainerItemID(Bag, Slot) == ItemID) then
				return Bag, Slot
			end
		end
	end
	return nil
end

function this:UpdateBagLinkByID(ID)

	local Item = self:GetByID(ID)
	
	local Bag, Slot = self:GetBagPositionByID(ID)
	if(Bag ~= nil and Slot ~= nil) then
		Item.BagLink = GetContainerItemLink(Bag, Slot)
	else
		Item.BagLink = nil
	end
end

function this:AsynchronousUpdateByID(ID)
	
	local Item = self:GetByID(ID)
	
	local ItemInfo = { GetItemInfo(ID) }
		
	if(ItemInfo[1] ~= nil) then
		Item.Name = ItemInfo[1]
		Item.Link = ItemInfo[2]
		
		return true
	end
	
	Item.Name = "item:"..ID
	Item.Link = self:ConstructLink("item", ID, Item.Name)
	
	return false
end
