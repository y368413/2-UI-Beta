local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")

function S:CharacterFrameUI()
	-- [[ Item buttons ]]
	local function UpdateCorruption(self)
		local itemLink = GetInventoryItemLink("player", self:GetID())
		self.IconOverlay:SetShown(itemLink and IsCorruptedItem(itemLink))
	end

	local slots = {"Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist", "Legs", "Feet", "Wrist", "Hands", "Finger0", "Finger1", "Trinket0", "Trinket1", "Back", "MainHand", "SecondaryHand", "Tabard",}

	for i = 1, #slots do
		local slot = _G["Character"..slots[i].."Slot"]
		--slot.IconBorder:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\WhiteIconFrame")
		slot.ignoreTexture:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-LeaveItem-Transparent")
		slot.CorruptedHighlightTexture:SetAtlas("Nzoth-charactersheet-item-glow")
		slot.IconOverlay:SetAtlas("Nzoth-inventory-icon")
		slot.IconOverlay:SetInside()
		--hooksecurefunc(slot.IconBorder, "SetTexture", function() slot:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\WhiteIconFrame") end)
	end

	hooksecurefunc("PaperDollItemSlotButton_Update", function(button) UpdateCorruption(button) end)
end

hooksecurefunc("SetItemButtonQuality", function(button, quality, itemIDOrLink, suppressOverlays)
	if itemIDOrLink then
		if IsArtifactRelicItem(itemIDOrLink) then
			button.IconBorder:SetTexture([[Interface\Artifacts\RelicIconFrame]]);
		else
			button.IconBorder:SetTexture([[Interface\AddOns\_ShiGuang\Media\WhiteIconFrame]]);
		end
		
		if not suppressOverlays and C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemIDOrLink) then
			button.IconOverlay:SetAtlas([[AzeriteIconFrame]]);
			button.IconOverlay:Show();
		else
			button.IconOverlay:Hide();
		end
	else
		button.IconBorder:SetTexture([[Interface\AddOns\_ShiGuang\Media\WhiteIconFrame]]);
		button.IconOverlay:Hide();
	end

	if quality then
		if quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality] then
			button.IconBorder:Show();
			button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
		else
			button.IconBorder:Hide();
		end
	else
		button.IconBorder:Hide();
	end
end)

function S:InspectFrameUI()
	--if not IsAddOnLoaded("Blizzard_InspectUI") then return end
	if not InspectFrame then LoadAddOn("Blizzard_InspectUI") end
	local function UpdateCorruption(self)
		local unit = InspectFrame.unit
		local itemLink = unit and GetInventoryItemLink(unit, self:GetID())
		self.Eye:SetShown(itemLink and IsCorruptedItem(itemLink))
	end

	-- Character
	local slots = {"Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist", "Legs", "Feet", "Wrist", "Hands", "Finger0", "Finger1", "Trinket0", "Trinket1", "Back", "MainHand", "SecondaryHand", "Tabard",}

	for i = 1, #slots do
		local slot = _G["Inspect"..slots[i].."Slot"]

		M.StripTextures(slot)
		slot.icon:SetTexCoord(unpack(I.TexCoord))
		slot.icon:SetInside()
		M.CreateBD(slot, .25)
		slot:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)

		if not slot.Eye then
			slot.Eye = slot:CreateTexture()
			slot.Eye:SetAtlas("Nzoth-inventory-icon")
			slot.Eye:SetInside()
		end
	end

	hooksecurefunc("InspectPaperDollItemSlotButton_Update", function(button)
		button.icon:SetShown(button.hasItem)
		UpdateCorruption(button)
	end)
end