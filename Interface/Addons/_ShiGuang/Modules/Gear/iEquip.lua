local activeIndex, currIndex, updateElapsed
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
	if activeIndex then
		_G["EquipSetsButton"..activeIndex]:UnlockHighlight()
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_STRIPSET, activeIndex, count), 1, 0.3, 0.3)
		activeIndex = nil
	else
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_STRIP, count), 1, 0.3, 0.3)
	end
end

local function GetSetInfoByIndex(index)
	local setName, iconPath
	local ids = C_EquipmentSet.GetEquipmentSetIDs()
	local setID = ids[index]
	if setID then
		setName, iconPath = C_EquipmentSet.GetEquipmentSetInfo(setID)
	end
	return setName, iconPath, setID
end

local function GetActiveSetInfo()
	local index, setID, setName, iconPath, isEquipped
	local ids = C_EquipmentSet.GetEquipmentSetIDs()
	for index, setID in ipairs(ids) do
		setName, iconPath, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
		if isEquipped then
			return setName, iconPath, index, setID
		end
	end
end

local function CheckButtonsHighlight()
	local setName, iconPath
	setName, iconPath, currIndex = GetActiveSetInfo()

	if (not activeIndex and not currIndex) or (activeIndex and currIndex and activeIndex == currIndex) then return end

	if currIndex then
		_G["EquipSetsButton"..currIndex]:LockHighlight()
		DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_WEARSET, currIndex, iconPath, setName))
	end

	if activeIndex then
		_G["EquipSetsButton"..activeIndex]:UnlockHighlight()
		if not currIndex then
			setName, iconPath = GetSetInfoByIndex(activeIndex)
			if setName then
				DEFAULT_CHAT_FRAME:AddMessage(format(IEQUIP_CHANGED, activeIndex, iconPath, setName), 1, 0.3, 0.3)
			else
				DEFAULT_CHAT_FRAME:AddMessage(IEQUIP_NOTASET, 1, 0.3, 0.3)
			end
		end
	end

	activeIndex = currIndex
end

local function UpdateButtonsNum(self)
	local num = C_EquipmentSet.GetNumEquipmentSets()
	for i = 1, 10 do
		if i > num then
			_G["EquipSetsButton"..i]:Hide()
		else
			_G["EquipSetsButton"..i]:Show()
		end
	end
	--_G["StripButton"]:ClearAllPoints()
	--_G["StripButton"]:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 66+16*(curNumSets+1), -21)
	self.setsNum = num
end

local function buttonOnEnter(self)
	GameTooltip:SetOwner(_G["StripButton"], "ANCHOR_RIGHT")
	local index = self:GetID()
	if index == 0 then
		--GameTooltip:AddLine(IEQUIP_OPEN)
	--elseif index == 11 then
		GameTooltip:AddLine(IEQUIP_QUICKSTRIP)
	else
		local setName, iconPath = GetSetInfoByIndex(index)
		GameTooltip:AddLine(format(IEQUIP_GEARSET, index, iconPath, setName))
	end
	GameTooltip:Show()
end

local function buttonOnClick(self)
	local index = self:GetID()
	if index == 0 then
		--if PaperDollEquipmentManagerPane:IsVisible() then
			--ToggleCharacter("PaperDollFrame")
		--else
			--if not PaperDollFrame:IsVisible() then ToggleCharacter("PaperDollFrame") end
			--if not CharacterFrame.Expanded then CharacterFrame_Expand()	end
			--PaperDollFrame_SetSidebar(PaperDollSidebarTab3, PaperDollSidebarTab3:GetID())
		--end
	--elseif index == 11 then
		QuickStripOff()
	elseif index ~= activeIndex then
		local setID = select(3, GetSetInfoByIndex(index))
		if setID then EquipmentManager_EquipSet(setID) end
	end
end

local iEquip = CreateFrame("Frame", "iEquip", PlayerFrame)
iEquip:RegisterEvent("PLAYER_ENTERING_WORLD")
iEquip:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
iEquip:RegisterEvent("EQUIPMENT_SETS_CHANGED")
iEquip:RegisterEvent("UNIT_ENTERED_VEHICLE")
iEquip:RegisterEvent("UNIT_EXITED_VEHICLE")
iEquip:Show()

local function makeButton(name, text, index)
	local button = CreateFrame("Button", name, PlayerFrame, "UIPanelButtonTemplate")
	button:SetWidth(16)
	button:SetHeight(16)
	button:SetText(text)
	button:SetID(index)
	button:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 88+16*index, -6)
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

iEquip:SetScript("OnEvent", function(self, event, ...)
	local arg1 = ...
	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		PlayerFrameGroupIndicatorLeft:SetAlpha(0)
		PlayerFrameGroupIndicatorRight:SetAlpha(0)
		PlayerFrameGroupIndicatorMiddle:SetAlpha(0)
		PlayerFrameGroupIndicatorText:ClearAllPoints()
		PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame, "BOTTOMLEFT", -8, 19)
		PlayerFrameRoleIcon:ClearAllPoints()
		PlayerFrameRoleIcon:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 80, -5)
		UpdateButtonsNum(self)
		self.needCheck = 1
	elseif event == "PLAYER_EQUIPMENT_CHANGED" then
		if self.setsNum ~= 0 then
			self.needCheck = 1
		end
	elseif event == "EQUIPMENT_SETS_CHANGED" then
		if self.setsNum ~= C_EquipmentSet.GetNumEquipmentSets() then
			UpdateButtonsNum(self)
		end
		self.needCheck = 1
	elseif arg1 == "player" then
		if event == "UNIT_ENTERED_VEHICLE" then
			self:Hide()
		elseif event == "UNIT_EXITED_VEHICLE" then
			self:Show()
		end
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

--[[ Autoequip in Spec-changing
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
		for i = 0, C_EquipmentSet.GetNumEquipmentSets()-1 do
			local name, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(i)
			if isEquipped then
				print("|cFFBF00FF已是当前天赋套装")
				break
			end
		end
	end
end)]]