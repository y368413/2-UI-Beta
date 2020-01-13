local myname, ns = ...

local LAI = LibStub("LibAppropriateItems-1.0")

local inv = LibStub("AceAddon-3.0"):GetAddon("Inventorian")
local original_WrapItemButton = inv.Item.WrapItemButton
inv.Item.WrapItemButton = function(...)
	local item = original_WrapItemButton(...)

	item.ItemLevel = item:CreateFontString('$parentItemLevel', 'ARTWORK')
	item.ItemLevel:SetPoint('TOPRIGHT', -2, -2)
	item.ItemLevel:SetFontObject(NumberFontNormal)
	item.ItemLevel:SetJustifyH('RIGHT')

	item.ItemLevelUpgrade = CreateFrame("FRAME", nil, item)
	item.ItemLevelUpgrade:SetFrameLevel(4) -- Azerite overlay must be overlaid itself...
	item.ItemLevelUpgrade:SetSize(8, 8)
	item.ItemLevelUpgrade:SetPoint('TOPLEFT', 2, -2)

	local texture = item.ItemLevelUpgrade:CreateTexture()
	-- MiniMap-PositionArrowUp?
	texture:SetAtlas("poi-door-arrow-up")
	texture:SetAllPoints()

	return item
end

local original_Update = inv.Item.prototype.Update
inv.Item.prototype.Update = function(self, ...)
	if self:IsVisible() then
		local icon, count, locked, quality, readable, lootable, link, noValue, itemID = self:GetInfo()
		self.ItemLevel:Hide()
		self.ItemLevelUpgrade:Hide()
		if itemID and link then
			local item = Item:CreateFromBagAndSlot(self.bag, self.slot)
			item:ContinueOnItemLoad(function()
				local _, _, _, equipLoc, _, itemClass, itemSubClass = GetItemInfoInstant(itemID)
				if
					quality >= LE_ITEM_QUALITY_UNCOMMON and (
						itemClass == LE_ITEM_CLASS_WEAPON or
						itemClass == LE_ITEM_CLASS_ARMOR or
						(itemClass == LE_ITEM_CLASS_GEM and itemSubClass == LE_ITEM_GEM_ARTIFACTRELIC)
					)
				then
					local itemLevel = item:GetCurrentItemLevel()
					local r, g, b, hex = GetItemQualityColor(quality)
					self.ItemLevel:SetFormattedText('|c%s%s|r', hex, itemLevel or '?')
					self.ItemLevel:Show()
					if LAI:IsAppropriate(itemID) then
						ns.ForEquippedItems(equipLoc, function(equippedItem)
							if equippedItem:IsItemEmpty() or equippedItem:GetCurrentItemLevel() < itemLevel then
								self.ItemLevelUpgrade:Show()
							end
						end)
					end
				end
			end)
		end
	end

	return original_Update(self, ...)
end

do
	local EquipLocToSlot1 = {
		INVTYPE_HEAD = 1,
		INVTYPE_NECK = 2,
		INVTYPE_SHOULDER = 3,
		INVTYPE_BODY = 4,
		INVTYPE_CHEST = 5,
		INVTYPE_ROBE = 5,
		INVTYPE_WAIST = 6,
		INVTYPE_LEGS = 7,
		INVTYPE_FEET = 8,
		INVTYPE_WRIST = 9,
		INVTYPE_HAND = 10,
		INVTYPE_FINGER = 11,
		INVTYPE_TRINKET = 13,
		INVTYPE_CLOAK = 15,
		INVTYPE_WEAPON = 16,
		INVTYPE_SHIELD = 17,
		INVTYPE_2HWEAPON = 16,
		INVTYPE_WEAPONMAINHAND = 16,
		INVTYPE_RANGED = 16,
		INVTYPE_RANGEDRIGHT = 16,
		INVTYPE_WEAPONOFFHAND = 17,
		INVTYPE_HOLDABLE = 17,
		INVTYPE_TABARD = 19,
	}
	local EquipLocToSlot2 = {
		INVTYPE_FINGER = 12,
		INVTYPE_TRINKET = 14,
		INVTYPE_WEAPON = 17,
	}
	local ForEquippedItem = function(slot, callback)
		if not slot then
			return
		end
		local item = Item:CreateFromEquipmentSlot(slot)
		if item:IsItemEmpty() then
			return callback(item)
		end
		item:ContinueOnItemLoad(function() callback(item) end)
	end
	ns.ForEquippedItems = function(equipLoc, callback)
		ForEquippedItem(EquipLocToSlot1[equipLoc], callback)
		ForEquippedItem(EquipLocToSlot2[equipLoc], callback)
	end
end
