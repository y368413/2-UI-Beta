------------------------------------------------------------
-- PetButton.lua
--
-- Abin
-- 2012/12/18
------------------------------------------------------------

local GetScreenHeight = GetScreenHeight
local max = max
local select = select
local IsControlKeyDown = IsControlKeyDown
local IsModifiedClick = IsModifiedClick
local ChatEdit_InsertLink = ChatEdit_InsertLink
local CreateFrame = CreateFrame
local PET_BATTLE_CURRENT_XP_FORMAT = PET_BATTLE_CURRENT_XP_FORMAT
local PET_TYPE_SUFFIX = PET_TYPE_SUFFIX
local PET_BATTLE_CURRENT_HEALTH_FORMAT = PET_BATTLE_CURRENT_HEALTH_FORMAT
local C_PetJournal = C_PetJournal
local GameTooltip = GameTooltip

local _, addon = ...
local L = addon.L

local BUTTON_SIZE = 36

local tooltip = CreateFrame("Frame", "PetCouncilPetTooltip", UIParent, "PetBattleUnitTooltipTemplate")
tooltip:SetClampedToScreen()
tooltip:SetHeight(250)
tooltip.AbilitiesLabel:Show()
tooltip.XPBar:Show()
tooltip.XPBG:Show()
tooltip.XPBorder:Show()
tooltip.XPText:Show()
tooltip.WeakToLabel:Hide()
tooltip.ResistantToLabel:Hide()
tooltip.Delimiter2:ClearAllPoints()
tooltip.Delimiter2:SetPoint("LEFT", 5, -92)
tooltip.ignoreText = tooltip:CreateFontString(nil, "ARTWORK", "GameFontNormal")
tooltip.ignoreText:SetFont(STANDARD_TEXT_FONT, 13)
tooltip.ignoreText:SetPoint("TOPLEFT", tooltip.Delimiter2, "BOTTOMLEFT", 8, -6)
tooltip.ignoreText:SetText(L["ignore text"])

local function ShowTooltip(self, petId, ...)
	local speciesID, customName, name, link, icon, level, petType, health, maxHealth, xp, maxXp, attack, speed, rarity, r, g, b = addon:GetPetInfo(petId)
	if not speciesID then
		tooltip:Hide()
		return
	end

	local point, relativePoint
	if GetScreenHeight() - self:GetTop() < 240 then
		point = "TOP"
		relativePoint = "BOTTOM"
	else
		point = "BOTTOM"
		relativePoint = "TOP"
	end

	if self:GetLeft() < 400 then
		point = point.."LEFT"
		relativePoint = relativePoint.."RIGHT"
	else
		point = point.."RIGHT"
		relativePoint = relativePoint.."LEFT"
	end

	tooltip:SetParent(self)
	tooltip:ClearAllPoints()
	tooltip:SetPoint(point, self, relativePoint)

	tooltip.Icon:SetTexture(icon)
	tooltip.Name:SetText(customName or name)
	tooltip.Name:SetTextColor(r, g, b)
	tooltip.Level:SetText(level)
	tooltip.XPBar:SetWidth(max((xp / max(maxXp, 1)) * tooltip.xpBarWidth, 1))
	tooltip.Delimiter:SetPoint("TOP", tooltip.XPBG, "BOTTOM", 0, -10)
	tooltip.XPText:SetFormattedText(tooltip.xpTextFormat or PET_BATTLE_CURRENT_XP_FORMAT, xp, maxXp)
	tooltip.AttackAmount:SetText(attack)
	tooltip.SpeedAmount:SetText(speed)
	tooltip.PetType.Icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[petType])

	if customName then
		tooltip.SpeciesName:SetText(name)
		tooltip.SpeciesName:SetTextColor(r, g, b)
		tooltip.SpeciesName:Show()
	else
		tooltip.SpeciesName:Hide()
	end

	if tooltip.HealthText then
		tooltip.HealthText:SetFormattedText(tooltip.healthTextFormat or PET_BATTLE_CURRENT_HEALTH_FORMAT, health, maxHealth)
	end

	if health == 0 then
		tooltip.ActualHealthBar:SetWidth(1)
	else
		tooltip.ActualHealthBar:SetWidth((health / max(maxHealth, 1)) * tooltip.healthBarWidth)
	end

	for i = 1, select("#", ...) do
		local name, icon, petType = C_PetJournal.GetPetAbilityInfo(select(i, ...))
		local abilityIcon = tooltip["AbilityIcon"..i]
		local abilityName = tooltip["AbilityName"..i]

		abilityName:SetShown(name)
		abilityIcon:SetShown(icon)
		abilityIcon:SetTexture("Interface\\PetBattles\\BattleBar-AbilityBadge-Neutral")
		if name then
			abilityName:SetText(name)
		end
	end

	tooltip:SetFrameStrata("TOOLTIP")
	tooltip:Show()
end

local function Button_Update(self, petId, ability1, ability2, ability3)
	tooltip:Hide()
	local speciesID, customName, name, link, icon, level, petType, health, maxHealth, xp, maxXp, attack, speed, rarity, r, g, b = addon:GetPetInfo(petId)
	if speciesID then
		self.petId, self.link, self.ability1, self.ability2, self.ability3 = petId, link, ability1, ability2, ability3
		self.icon:SetTexture(icon)
		self.levelBg:Show()
		self.level:SetText(level)
		self.dead:SetShown(health == 0)
		self.healthBar:SetMinMaxValues(0, maxHealth)
		self.healthBar:SetValue(health)
	else
		self.petId, self.link, self.ability1, self.ability2, self.ability3 = nil
		self.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
		self.levelBg:Hide()
		self.level:SetText()
		self.dead:Hide()
		self.healthBar:SetMinMaxValues(0, 1)
		self.healthBar:SetValue(0)
	end
end

local function Button_CallParentScript(self, script, ...)
	local parent = self:GetParent()
	local func = parent:GetScript(script)
	if func then
		func(parent, ...)
	end
end

local function Button_OnClick(self, ...)
	tooltip:Hide()
	if IsControlKeyDown() then
		if self.petId then
			Button_Update(self)
			local data = self:GetParent().data
			if data then
				local index = self:GetID()
				data["pet"..index], data["pet"..index.."ability1"], data["pet"..index.."ability2"], data["pet"..index.."ability3"] = nil
			end
		end

	elseif IsModifiedClick("CHATLINK") then
		local link = C_PetJournal.GetBattlePetLink(self.petId or "")
		if link then
			ChatEdit_InsertLink(link)
		end
	else
		Button_CallParentScript(self, "OnClick", ...)
	end
end

local function Button_OnDoubleClick(self, ...)
	Button_CallParentScript(self, "OnDoubleClick", ...)
end

local function Button_OnEnter(self, ...)
	Button_CallParentScript(self, "OnEnter", ...)
	if self.petId then
		GameTooltip:Hide()
		ShowTooltip(self, self.petId, self.ability1, self.ability2, self.ability3)
	else
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
		GameTooltip:ClearLines()
		GameTooltip:AddLine(L["any pet"])
		GameTooltip:AddLine(L["any pet desc"], 1, 1, 1, 1)
		GameTooltip:Show()
	end
end

local function Button_OnLeave(self, ...)
	GameTooltip:Hide()
	tooltip:Hide()
	Button_CallParentScript(self, "OnLeave", ...)
end

function addon:CreatePetButton(parent, index)
	local button = CreateFrame("Button", parent:GetName().."Pet"..index, parent)
	button:SetID(index)
	button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")

	button:SetScript("OnClick", Button_OnClick)
	button:SetScript("OnDoubleClick", Button_OnDoubleClick)
	button:SetScript("OnEnter", Button_OnEnter)
	button:SetScript("OnLeave", Button_OnLeave)
	button.Update = Button_Update

	local icon = button:CreateTexture(nil, "BACKGROUND")
	button.icon = icon
	icon:SetAllPoints(button)

	local dead = button:CreateTexture(nil, "BORDER")
	button.dead = dead
	dead:SetAllPoints(icon)
	dead:SetTexture("Interface\\PetBattles\\DeadPetIcon")

	local levelBg = button:CreateTexture(nil, "ARTWORK")
	button.levelBg = levelBg
	levelBg:SetSize(17, 17)
	levelBg:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 3, -3)
	levelBg:SetTexture("Interface\\PetBattles\\PetJournal")
	levelBg:SetTexCoord(0.06835938, 0.10937500, 0.02246094, 0.04296875)

	local level = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	button.level = level
	level:SetPoint("CENTER", levelBg, "CENTER", 1, -1)
	level:SetFont(STANDARD_TEXT_FONT, 11)

	local healthBar = CreateFrame("StatusBar", button:GetName().."HealthBar", button)
	button.healthBar = healthBar
	healthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	healthBar:SetStatusBarColor(0, 1, 0)
	healthBar:SetSize(BUTTON_SIZE, 7)
	healthBar:SetPoint("TOP", button, "BOTTOM", 0, -4)
	healthBar:SetMinMaxValues(0, 1)
	healthBar:SetValue(1)

	local hbLeft = healthBar:CreateTexture(healthBar:GetName().."Left", "OVERLAY")
	hbLeft:SetSize(11, 7)
	hbLeft:SetPoint("RIGHT", healthBar, "LEFT", 9, 0)
	hbLeft:SetTexture("Interface\\PetBattles\\PetJournal")
	hbLeft:SetTexCoord(0.04492188, 0.06640625, 0.00097656, 0.00781250)

	local hbRight = healthBar:CreateTexture(healthBar:GetName().."Right", "OVERLAY")
	hbRight:SetSize(11, 7)
	hbRight:SetPoint("LEFT", healthBar, "RIGHT", -9, 0)
	hbRight:SetTexture("Interface\\PetBattles\\PetJournal")
	hbRight:SetTexCoord(0.07031250, 0.09179688, 0.00097656, 0.00781250)

	local hbMiddle = healthBar:CreateTexture(healthBar:GetName().."Middle", "OVERLAY")
	hbMiddle:SetPoint("TOPLEFT", hbLeft, "TOPRIGHT")
	hbMiddle:SetPoint("BOTTOMRIGHT", hbRight, "BOTTOMLEFT")
	hbMiddle:SetTexture("Interface\\PetBattles\\PetJournal")
	hbMiddle:SetTexCoord(0.01953125, 0.04101563, 0.00097656, 0.00781250)

	return button
end