local activeSetID, currSetID, updateElapsed
local DURASLOTS = { 16, 17, 18, 5, 7, 1, 3, 8, 10, 6, 9 }

local function IsEquippableSlot(slot)
	return slot > 15 or not InCombatLockdown()
end

local function GetItemLocked()
	local bag, slot
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			if select(3, GetContainerItemInfo(bag, slot)) then
				return bag, slot
			end
		end
	end
end

local function GetAvailableBags()
	local bags = {}
	for i = 0, 4 do
		local slots, family = GetContainerNumFreeSlots(i)
		bags[i] = (family == 0) and slots or 0
	end
	return bags
end

local function GetFirstAvailableBag(bags)
	for i = 0, 4 do
		if bags[i] > 0 then
			return i
		end
	end
end

local function GetNameandIcon(SetID)
	local setName, iconPath = GetEquipmentSetInfo(SetID)
	if setName and not iconPath then iconPath = 134400 end
	return setName, iconPath
end

local function QuickStripOff()
	if UnitIsDeadOrGhost("player") or not HasFullControl() or GetItemLocked() then
		UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1, 0, 0)
		return
	end
	ClearCursor()
	local bags = GetAvailableBags()
	local count = 0
	for i = 1, #DURASLOTS do
		local inv = DURASLOTS[i]
		local lnk = GetInventoryItemLink("player", inv)
		if lnk and IsEquippableSlot(inv) and GetInventoryItemDurability(inv) then
			local bag = GetFirstAvailableBag(bags)
			if bag then
				bags[bag] = bags[bag] - 1
				PickupInventoryItem(inv)
				if CursorHasItem() then
					if bag == 0 then
						PutItemInBackpack()
					else
						PutItemInBag(19 + bag)
					end
					count = count + 1
				end
			else
				DEFAULT_CHAT_FRAME:AddMessage(ERR_INV_FULL, 1, 0, 0)
				break
			end
		end
	end
	if count == 0 then return end
	if activeSetID then
		_G["EquipSetsButton"..activeSetID]:UnlockHighlight()
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_STRIPSET, activeSetID, count), 1, 0.3, 0.3)
		activeSetID = nil
	else
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_STRIP, count), 1, 0.3, 0.3)
	end
end

local function GetItemId(bag, slot)
	local lnk
	if slot then
		lnk = GetContainerItemLink(bag, slot)
	else
		lnk = GetInventoryItemLink("player", bag)
	end
	if lnk then
		local _, _, id = string.find(lnk, "item:(%d+).+%[(.+)%]")
		return tonumber(id or "")
	end
end

local function CheckSetWorn(equipped, name)
	if not name then return end
	local ids = GetEquipmentSetItemIDs(name)
	for k, v in pairs(ids) do
		if v and v > 1 and equipped[k] ~= v then
			return
		end
	end
	return 1
end

local function GetActiveSet()
	local equipped = {}
	for i = 0, 19 do
		equipped[i] = GetItemId(i) or 0
	end
	for i = 1, GetNumEquipmentSets() do
		local setName = GetNameandIcon(i)
		if CheckSetWorn(equipped, setName) then
			return i
		end
	end
end

local function CheckButtonsHighlight()
	currSetID = GetActiveSet()
	if activeSetID == currSetID then return end
	local setName, iconPath
	if activeSetID then
		_G["EquipSetsButton"..activeSetID]:UnlockHighlight()
		if not currSetID then
			setName, iconPath = GetNameandIcon(activeSetID)
			if setName then
				DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_CHANGED, activeSetID, iconPath, setName), 1, 0.3, 0.3)
			else
				DEFAULT_CHAT_FRAME:AddMessage(IEQUIP_NOTASET, 1, 0.3, 0.3)
			end
		end
	end
	if currSetID then
		_G["EquipSetsButton"..currSetID]:LockHighlight()
		setName, iconPath = GetNameandIcon(currSetID)
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_WEARSET, currSetID, iconPath, setName))
	end
	activeSetID = currSetID
end

local function UpdateButtonsNum(self)
	local num = GetNumEquipmentSets()
	for i = 1, 10 do
		if i > num then
			_G["EquipSetsButton"..i]:Hide()
		else
			_G["EquipSetsButton"..i]:Show()
		end
	end
	--_G["StripButton"]:ClearAllPoints()
	--_G["StripButton"]:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 66+16*(curNumSets+1), -21)
	self.SetsNum = num
end

local function buttonOnEnter(self)
	GameTooltip:SetOwner(_G["StripButton"], "ANCHOR_RIGHT")
	local id = self:GetID()
	if id == 0 then
		--GameTooltip:AddLine(IEQUIP_OPEN)
	--elseif id == 11 then
		GameTooltip:AddLine(IEQUIP_QUICKSTRIP)
	else
		local setName, iconPath = GetNameandIcon(id)
		GameTooltip:AddLine(format(IEQUIP_GEARSET, id, iconPath, setName))
	end
	GameTooltip:Show()
end

local function buttonOnClick(self)
	local id = self:GetID()
	if id == 0 then
		--if PaperDollEquipmentManagerPane:IsVisible() then
			--ToggleCharacter("PaperDollFrame")
		--else
			--if not PaperDollFrame:IsVisible() then ToggleCharacter("PaperDollFrame") end
			--if not CharacterFrame.Expanded then CharacterFrame_Expand()	end
			--PaperDollFrame_SetSidebar(PaperDollSidebarTab3, PaperDollSidebarTab3:GetID())
		--end
	--elseif id == 11 then
		QuickStripOff()
	elseif id ~= activeSetID then
		UseEquipmentSet(GetNameandIcon(id))    --Fix For 7.2 by y368413
	end
end

local iEquip = CreateFrame("Frame", "iEquip", PlayerFrame)
iEquip:RegisterEvent("PLAYER_ENTERING_WORLD")
iEquip:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
iEquip:RegisterEvent("EQUIPMENT_SETS_CHANGED")
iEquip:RegisterEvent("UNIT_ENTERED_VEHICLE")
iEquip:RegisterEvent("UNIT_EXITED_VEHICLE")
iEquip:Show()

local function makeButton(name, text, id)
	local button = CreateFrame("Button", name, PlayerFrame, "UIPanelButtonTemplate")
	button:SetWidth(16)
	button:SetHeight(16)
	button:SetText(text)
	button:SetID(id)
	button:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 88+16*id, -6)
	button:SetScript("OnEnter", buttonOnEnter)
	button:SetScript("OnLeave", function() GameTooltip:Hide() end)
	button:SetScript("OnClick", buttonOnClick)
	return button
end

--makeButton("ManagerButton", IEQUIP_MANAGER, 0)
makeButton("StripButton", IEQUIP_SYMBOL, 0)
for i = 1, 10 do
	makeButton("EquipSetsButton"..i, i, i)
end
--makeButton("StripButton", IEQUIP_SYMBOL,, 11)

iEquip:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		PlayerFrameGroupIndicatorLeft:SetAlpha(0)
		PlayerFrameGroupIndicatorRight:SetAlpha(0)
		PlayerFrameGroupIndicatorMiddle:SetAlpha(0)
		PlayerFrameGroupIndicatorText:ClearAllPoints()
		PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame, "BOTTOMLEFT", -8, 19)
		UpdateButtonsNum(self)
		self.needCheck = 1
	elseif event == "PLAYER_EQUIPMENT_CHANGED" then
		self.needCheck = 1
	elseif event == "EQUIPMENT_SETS_CHANGED" then
		if self.SetsNum ~= GetNumEquipmentSets() then
			UpdateButtonsNum(self)
		end
		self.needCheck = 1
	end
end)

iEquip:SetScript("OnUpdate", function(self, elapsed)
	updateElapsed = (updateElapsed or 0) + elapsed
	if updateElapsed > TOOLTIP_UPDATE_TIME then
		updateElapsed = 0
		if self.needCheck then
			self.needCheck = nil
			CheckButtonsHighlight()
		end
	end
end)

-- Autoequip in Spec-changing
local au = CreateFrame("Frame")
au:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
au:SetScript("OnEvent", function(self, event, arg1, _, _, _, arg2)
	if arg1 ~= "player" or arg2 ~= 200749 then return end
	local _, _, id = GetInstanceInfo()
	if id == 8 then return end

	if not GetSpecialization() then return end
	local _, name = GetSpecializationInfo(GetSpecialization())
	local setID = C_EquipmentSet.GetEquipmentSetID(name)
	if name and setID then
		local _, _, _, hasEquipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
		if not hasEquipped then
			C_EquipmentSet.UseEquipmentSet(setID)
		print("--已根据天赋和预设套装换装--")
		end
	else
		for i = 1, GetNumEquipmentSets() do
			local name, _, _, isEquipped = GetEquipmentSetInfo(i)
			if isEquipped then
				print("|cFFBF00FF已是当前天赋套装")
				break
			end
		end
	end
end)