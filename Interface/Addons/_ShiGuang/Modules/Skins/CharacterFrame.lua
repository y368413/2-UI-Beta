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
		slot.ignoreTexture:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-LeaveItem-Transparent")
		slot.CorruptedHighlightTexture:SetAtlas("Nzoth-charactersheet-item-glow")
		slot.IconOverlay:SetAtlas("Nzoth-inventory-icon")
		slot.IconOverlay:SetInside()
	end

	hooksecurefunc("PaperDollItemSlotButton_Update", function(button) UpdateCorruption(button) end)
end

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