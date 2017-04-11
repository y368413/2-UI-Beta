-------------------------------------------------------------- BandageButton.lua---- Abin-- 2012/12/18
------------------------------------------------------------Fix by Siweia for 7.0

local function loadBandage()
	local GetItemInfo = GetItemInfo
	local GetItemCooldown = GetItemCooldown
	local CooldownFrame_SetTimer = CooldownFrame_SetTimer
	local PickupItem = PickupItem
	local GameTooltip = GameTooltip

	local BANDAGE_ID = 86143
	local itemName, itemLink = GetItemInfo(BANDAGE_ID)

	PetJournalHealPetButton.spellname:Hide()
	PetJournalHealPetButton.spellname:SetAlpha(0)

	local button = CreateFrame("Button", "PetCouncilBandageButton", PetJournal, "SecureActionButtonTemplate")
	button:SetSize(33, 33)
	button:SetPoint("RIGHT", PetJournalHealPetButton, "LEFT", -4, 0)
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	button:SetAttribute("type", "item")
	button:SetAttribute("item", itemName)
	RegisterStateDriver(button, "visibility", "[combat] hide; show")

	local icon = button:CreateTexture(button:GetName().."Icon", "BORDER")
	icon:SetAllPoints(button)
	icon:SetTexture("Interface\\Icons\\Inv_Misc_Bandage_05")

	local border = button:CreateTexture(button:GetName().."Border", "ARTWORK", "ActionBarFlyoutButton-IconFrame")
	border:SetSize(35, 35)
	border:SetPoint("CENTER")

	local text = button:CreateFontString(button:GetName().."Count", "OVERLAY", "TextStatusBarText")
	text:SetPoint("BOTTOMRIGHT", -2, 2)

	local cooldown = CreateFrame("Cooldown", button:GetName().."Cooldown", button, "CooldownFrameTemplate")
	cooldown:SetAllPoints(button)

	local function UpdateCount()
		local count = GetItemCount(BANDAGE_ID)
		if count > 0 then
			text:SetText(count)
			icon:SetVertexColor(1, 1, 1)
		else
			text:SetText()
			icon:SetVertexColor(0.5, 0.5, 0.5)
		end
	end

	local function UpdateCooldown()
		local start, duration, enable = GetItemCooldown(BANDAGE_ID)
		CooldownFrame_Set(cooldown, start, duration, enable)
	end

	button:RegisterEvent("PLAYER_LOGIN")
	button:RegisterEvent("BAG_UPDATE")
	button:RegisterEvent("BAG_UPDATE_COOLDOWN")

	button:SetScript("OnEvent", function(self, event)
		if event == "PLAYER_LOGIN" then
			if not itemName then
				itemName, itemLink = GetItemInfo(BANDAGE_ID)
				self:SetAttribute("item", itemName)
			end
		elseif event == "BAG_UPDATE" then
			UpdateCount()
		elseif event == "BAG_UPDATE_COOLDOWN" then
			UpdateCooldown()
		end
	end)

	button:SetScript("OnShow", function(self)
		self:RegisterEvent("BAG_UPDATE")
		self:RegisterEvent("BAG_UPDATE_COOLDOWN")
		UpdateCount()
		UpdateCooldown()
	end)

	button:SetScript("OnHide", function(self)
		self:UnregisterEvent("BAG_UPDATE")
		self:UnregisterEvent("BAG_UPDATE_COOLDOWN")
	end)

	button:SetScript("OnEnter", function(self)
		if itemLink then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetHyperlink(itemLink)
		end
	end)

	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	button:RegisterForDrag("LeftButton")
	button:SetScript("OnDragStart", function(self)
		PickupItem(BANDAGE_ID)
	end)
end

local event = CreateFrame("Frame")
event:RegisterEvent("ADDON_LOADED")
event:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_Collections" then
		loadBandage()
	end
end)