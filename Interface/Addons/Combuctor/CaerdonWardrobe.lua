--## SavedVariables: CaerdonWardrobeConfig
local CaerdonWardrobe = {}
local eventFrame
local isBagUpdate = false
local isBagAddon = false

--CaerdonWardrobe = {}

local BoA = "|cffe6cc80战网|r" -- heirloom item color
local BoE = "|cff1eff00装绑|r" -- uncommon item color
local BoP = "|cFF00DDFF    _|r"   -- 拾取后绑定
local bindTextTable = {
	[ITEM_ACCOUNTBOUND]        = BoA,
	[ITEM_BNETACCOUNTBOUND]    = BoA,
	[ITEM_BIND_TO_ACCOUNT]     = BoA,
	[ITEM_BIND_TO_BNETACCOUNT] = BoA,
	[ITEM_BIND_ON_EQUIP]       = BoE,
	[ITEM_BIND_ON_USE]         = BoE,
	[ITEM_SOULBOUND]           = BoP,
	[ITEM_BIND_ON_PICKUP]      = BoP,
}

local InventorySlots = {
    ['INVTYPE_HEAD'] = INVSLOT_HEAD,
    ['INVTYPE_SHOULDER'] = INVSLOT_SHOULDER,
    ['INVTYPE_BODY'] = INVSLOT_BODY,
    ['INVTYPE_CHEST'] = INVSLOT_CHEST,
    ['INVTYPE_ROBE'] = INVSLOT_CHEST,
    ['INVTYPE_WAIST'] = INVSLOT_WAIST,
    ['INVTYPE_LEGS'] = INVSLOT_LEGS,
    ['INVTYPE_FEET'] = INVSLOT_FEET,
    ['INVTYPE_WRIST'] = INVSLOT_WRIST,
    ['INVTYPE_HAND'] = INVSLOT_HAND,
    ['INVTYPE_CLOAK'] = INVSLOT_BACK,
    ['INVTYPE_WEAPON'] = INVSLOT_MAINHAND,
    ['INVTYPE_SHIELD'] = INVSLOT_OFFHAND,
    ['INVTYPE_2HWEAPON'] = INVSLOT_MAINHAND,
    ['INVTYPE_WEAPONMAINHAND'] = INVSLOT_MAINHAND,
    ['INVTYPE_RANGED'] = INVSLOT_MAINHAND,
    ['INVTYPE_RANGEDRIGHT'] = INVSLOT_MAINHAND,
    ['INVTYPE_WEAPONOFFHAND'] = INVSLOT_OFFHAND,
    ['INVTYPE_HOLDABLE'] = INVSLOT_OFFHAND,
    ['INVTYPE_TABARD'] = INVSLOT_TABARD
}

local scanTip = CreateFrame( "GameTooltip", "CaerdonWardrobeGameTooltip", nil, "GameTooltipTemplate" )
local cachedBinding = {}

local model = CreateFrame('DressUpModel')

local function GetItemID(itemLink)
	return tonumber(itemLink:match("item:(%d+)"))
end

local cachedIsDressable = {}
local function IsDressableItemCheck(itemID, itemLink)
	local isDressable = true
	local shouldRetry = false
	local slot

	local dressableCache = cachedIsDressable[itemLink]
	if dressableCache then
		isDressable = dressableCache.isDressable
		slot = dressableCache.slot
	else
	    local _, _, _, slotName = GetItemInfoInstant(itemID)
	    if slotName and slotName ~= "" then -- make sure it's a supported slot
		    slot = InventorySlots[slotName]
		    if not slot then
				isDressable = false
		    elseif not IsDressableItem(itemLink) then
		    	-- IsDressableItem can return false instead of true for
		    	-- an item that is actually dressable (seems to happen
		    	-- most often during item caching).  Adding some
		    	-- retry tags to the cache if IsDressableItem says its
		    	-- not but transmog says it can be a source
				local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.GetItemInfo(itemID)
				isDressable = false
				if canBeSource then
					shouldRetry = true
				end
			end
		else
			isDressable = false
		end

		if not shouldRetry then
			cachedIsDressable[itemLink] = { isDressable = isDressable, slot = slot }
		end
	end
    return isDressable, shouldRetry, slot
end

local cachedItemSources = {}
local function GetItemSource(itemID, itemLink)
	local itemSources = cachedItemSources[itemLink]
	if itemSources == "NONE" then
		itemSources = nil
	elseif not itemSources then
		local isDressable, shouldRetry, slot = IsDressableItemCheck(itemID, itemLink)
		if not shouldRetry then
			if not isDressable then
		    	cachedItemSources[itemLink] = "NONE"
			else
			    model:SetUnit('player')
			    model:Undress()
			    model:TryOn(itemLink, slot)
			    itemSources = model:GetSlotTransmogSources(slot)
			    if itemSources then
					cachedItemSources[itemLink] = itemSources
				else
					cachedItemSources[itemLink] = "NONE"
				end
			end
		end
	end
    return itemSources, shouldRetry
end

local function GetItemAppearance(itemID, itemLink)
	local categoryID, appearanceID, canEnchant, texture, isCollected, sourceItemLink
	local sourceID, shouldRetry = GetItemSource(itemID, itemLink)

    if sourceID and sourceID ~= NO_TRANSMOG_SOURCE_ID then
        categoryID, appearanceID, canEnchant, texture, isCollected, sourceItemLink = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)
        if sourceItemLink then
			local _, _, quality = GetItemInfo(sourceItemLink)
			-- Skip artifact weapons and common for now
			if quality == LE_ITEM_QUALITY_ARTIFACT or quality == LE_ITEM_QUALITY_COMMON then
	 			appearanceID = nil
	 			isCollected = false
	 			sourceID = NO_TRANSMOG_SOURCE_ID
			end
		end
    end

    return appearanceID, isCollected, sourceID, shouldRetry
end

local function PlayerHasAppearance(appearanceID)
	local hasAppearance = false

    local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
    local matchedSource
    if sources then
        for i, source in pairs(sources) do
            if source.isCollected then
            	matchedSource = source
                hasAppearance = true
                break
            end
        end
    end

    return hasAppearance, matchedSource
end
 
local function PlayerCanCollectAppearance(appearanceID, itemID, itemLink)
	local _, _, quality, _, reqLevel, itemClass, itemSubClass, _, equipSlot, _, _, itemClassID, itemSubClassID = GetItemInfo(itemID)
	local playerLevel = UnitLevel("player")
	local canCollect = false
	local isInfoReady
	local matchedSource
	local shouldRetry

	local playerClass = select(2, UnitClass("player"))

	local classArmor;
	if playerClass == "MAGE" or 
		playerClass == "PRIEST" or 
		playerClass == "WARLOCK" then
		classArmor = LE_ITEM_ARMOR_CLOTH
	elseif playerClass == "DEMONHUNTER" or
		playerClass == "DRUID" or 
		playerClass == "MONK" or
		playerClass == "ROGUE" then
		classArmor = LE_ITEM_ARMOR_LEATHER
	elseif playerClass == "DEATHKNIGHT" or
		playerClass == "PALADIN" or
		playerClass == "WARRIOR" then
		classArmor = LE_ITEM_ARMOR_PLATE
	elseif playerClass == "HUNTER" or 
		playerClass == "SHAMAN" then
		classArmor = LE_ITEM_ARMOR_MAIL
	end

	if equipSlot ~= "INVTYPE_CLOAK"
		and itemClassID == LE_ITEM_CLASS_ARMOR and 
		(	itemSubClassID == LE_ITEM_ARMOR_CLOTH or 
			itemSubClassID == LE_ITEM_ARMOR_LEATHER or 
			itemSubClassID == LE_ITEM_ARMOR_MAIL or
			itemSubClassID == LE_ITEM_ARMOR_PLATE)
		and itemSubClassID ~= classArmor then 
			canCollect = false
			return
		end

	if playerLevel >= reqLevel then
	    local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
	    if sources then
	        for i, source in pairs(sources) do
		        isInfoReady, canCollect = C_TransmogCollection.PlayerCanCollectSource(source.sourceID)
	            if isInfoReady then
	            	if canCollect then
		            	matchedSource = source
		            end
	                break
	            else
	            	shouldRetry = true
	            end
	        end
	    end
	end

    return canCollect, matchedSource, shouldRetry
end

local function GetItemInfoLocal(itemID, bag, slot)
	local name = GetItemInfo(itemID)
	if name then
		if bag == "AuctionFrame" then
			name = GetAuctionItemInfo("list", slot)
		elseif bag == "MerchantFrame" then
			name = GetMerchantItemInfo(slot)
		end
	end

	return name
end

local function GetItemLinkLocal(bag, slot)
	if bag == "AuctionFrame" then
		return GetAuctionItemLink("list", slot)
	elseif bag == "MerchantFrame" then
		return GetMerchantItemLink(slot)
	elseif bag == "BankFrame" then
		return GetInventoryItemLink("player", slot)
	elseif bag == "GuildBankFrame" then
		return GetGuildBankItemLink(slot.tab, slot.index)
	elseif bag == "EncounterJournal" then
		-- local itemID, encounterID, name, icon, slotName, armorType, itemLink = EJ_GetLootInfoByIndex(slot)
		return slot.link
	elseif bag == "LootFrame" or bag == "GroupLootFrame" then
		return slot.link
	else
		return GetContainerItemLink(bag, slot)
	end
end

local function GetItemKey(bag, slot, itemLink)
	local itemKey
	if bag == "AuctionFrame" or bag == "MerchantFrame" then
		itemKey = itemLink
	elseif bag == "GuildBankFrame" then
		itemKey = itemLink .. slot.tab .. slot.index
	elseif bag == "EncounterJournal" then
		itemKey = itemLink .. bag .. slot.index
	elseif bag == "LootFrame" or bag == "GroupLootFrame" then
		itemKey = itemLink
	else
		itemKey = itemLink .. bag .. slot
	end

	return itemKey
end

local equipLocations = {}

local function GetBindingStatus(bag, slot, itemID, itemLink)
	local itemKey = GetItemKey(bag, slot, itemLink)

	local binding = cachedBinding[itemKey]
	local bindingText, needsItem, hasUse

    local isInEquipmentSet = false
    local isBindOnPickup = false
    local isCompletionistItem = false
    local isDressable, shouldRetry = IsDressableItemCheck(itemID, itemLink)

	if binding then
		bindingText = binding.bindingText
		needsItem = binding.needsItem
		hasUse = binding.hasUse
		isInEquipmentSet = binding.isInEquipmentSet
		isBindOnPickup = binding.isBindOnPickup
		isCompletionistItem = binding.isCompletionistItem
	elseif not shouldRetry then
		needsItem = true
		scanTip:SetOwner(WorldFrame, "ANCHOR_NONE")
		if bag == "AuctionFrame" then
			scanTip:SetAuctionItem("list", slot)
		elseif bag == "MerchantFrame" then
			scanTip:SetMerchantItem(slot)
		elseif bag == "BankFrame" then
			scanTip:SetInventoryItem("player", slot)
		elseif bag == "GuildBankFrame" then
			scanTip:SetGuildBankItem(slot.tab, slot.index)
		elseif bag == "LootFrame" then
			scanTip:SetLootItem(slot.index)
		elseif bag == "GroupLootFrame" then
			scanTip:SetLootRollItem(slot.index)
		else
			scanTip:SetBagItem(bag, slot)
		end

		local _, _, _, _, reqLevel, class, subclass, _, equipSlot = GetItemInfo(itemID)

	    -- Use equipment set for binding text if it's assigned to one
		if equipSlot ~= "" and C_EquipmentSet.CanUseEquipmentSets() then

			-- Flag to ensure flagging multiple set membership
			local isBindingTextDone = false

			for setIndex=1, C_EquipmentSet.GetNumEquipmentSets() do
        local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()
        local equipmentSetID = equipmentSetIDs[setIndex]
				name, icon, setID, isEquipped, numItems, numEquipped, numInventory, numMissing, numIgnored = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)

        local equipLocations = C_EquipmentSet.GetItemLocations(equipmentSetID)

				for locationIndex=INVSLOT_FIRST_EQUIPPED , INVSLOT_LAST_EQUIPPED do
					local location = equipLocations[locationIndex]
					if location ~= nil then
					    local isPlayer, isBank, isBags, isVoidStorage, equipSlot, equipBag, equipTab, equipVoidSlot = EquipmentManager_UnpackLocation(location)
					    equipSlot = tonumber(equipSlot)
					    equipBag = tonumber(equipBag)

					    if isVoidStorage then
					    	-- Do nothing for now
					    elseif isBank and not isBags then -- player or bank

					    	if bag == "BankFrame" and slot == equipSlot then
					    		needsItem = false
								if bindingText then
									bindingText = "*" .. bindingText
									isBindingTextDone = true

									break
								else
									bindingText = name
									isInEquipmentSet = true
								end
					    	end
					    else
						    if equipSlot == slot and equipBag == bag then
								needsItem = false
								if bindingText then
									bindingText = "*" .. bindingText
									isBindingTextDone = true
									break
								else
									bindingText = name
									isInEquipmentSet = true
								end
							end
						end
					end
				end

				if isBindingTextDone then
					break
				end
			end
		end

		local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.GetItemInfo(itemID)
		if canBeSource then
	        local hasTransmog = C_TransmogCollection.PlayerHasTransmog(itemID)
	        if hasTransmog then
	        	needsItem = false
	        end
	    else
	    	needsItem = false
	    end

		for lineIndex = 1, scanTip:NumLines() do
			local lineText = _G["CaerdonWardrobeGameTooltipTextLeft" .. lineIndex]:GetText()
			if lineText then
				-- TODO: Look at switching to GetItemSpell
				if strmatch(lineText, USE_COLON) or strmatch(lineText, ITEM_SPELL_TRIGGER_ONEQUIP) or strmatch(lineText, string.format(ITEM_SET_BONUS, "")) then -- it's a recipe or has a "use" effect or belongs to a set
					hasUse = true
					break
				end

				if not bindingText then
					bindingText = bindTextTable[lineText]
				end

				if lineText == RETRIEVING_ITEM_INFO then
					shouldRetry = true
					break
				elseif lineText == ITEM_BIND_ON_PICKUP then
					isBindOnPickup = true
				elseif lineText == TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN then
					if CaerdonWardrobeConfig.Icon.ShowLearnable.SameLookDifferentItem then
						isCompletionistItem = true
					else
						needsItem = false
					end
					break
				end
			end
		end

		if not shouldRetry then
			cachedBinding[itemKey] = {bindingText = bindingText, needsItem = needsItem, hasUse = hasUse, isDressable = isDressable, isInEquipmentSet = isInEquipmentSet, isBindOnPickup = isBindOnPickup, isCompletionistItem = isCompletionistItem }
		end
	end

	return bindingText, needsItem, hasUse, isDressable, isInEquipmentSet, isBindOnPickup, isCompletionistItem, shouldRetry
end

local waitingOnItemData = {}

local function IsGearSetStatus(status)
	return status and status ~= BoA and status ~= BoE
end

local function SetIconPositionAndSize(icon, startingPoint, offset, size, iconOffset)
	icon:ClearAllPoints()

	local offsetSum = offset - iconOffset
	if startingPoint == "TOPRIGHT" then
		icon:SetPoint("TOPRIGHT", offsetSum, offsetSum)
	elseif startingPoint == "TOPLEFT" then
		icon:SetPoint("TOPLEFT", offsetSum * -1, offsetSum)
	elseif startingPoint == "BOTTOMRIGHT" then
		icon:SetPoint("BOTTOMRIGHT", offsetSum, offsetSum * -1)
	elseif startingPoint == "BOTTOMLEFT" then
		icon:SetPoint("BOTTOMLEFT", offsetSum * -1, offsetSum * -1)
	end

	icon:SetSize(size, size)
end

local function AddRotation(group, order, degrees, duration, smoothing, startDelay, endDelay)
	local anim = group:CreateAnimation("Rotation")
	group["anim" .. order] = anim
	anim:SetDegrees(degrees)
    anim:SetDuration(duration)
	anim:SetOrder(order)
	anim:SetSmoothing(smoothing)

	if startDelay then
		anim:SetStartDelay(startDelay)
	end

	if endDelay then
		anim:SetEndDelay(endDelay)
	end
end

local function IsBankOrBags(bag)
	local isBankOrBags = false

	if bag ~= "AuctionFrame" and 
	   bag ~= "MerchantFrame" and 
	   bag ~= "GuildBankFrame" and
	   bag ~= "EncounterJournal" and
	   bag ~= "LootFrame" and
	   bag ~= "GroupLootFrame" then
		isBankOrBags = true
	end

	return isBankOrBags
end

local function ShouldHideBindingStatus(bag, bindingStatus)
	local shouldHide = false

	if bag == "AuctionFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Binding.ShowStatus.BankAndBags and IsBankOrBags(bag) then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Binding.ShowStatus.GuildBank and bag == "GuildBankFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Binding.ShowStatus.Merchant and bag == "MerchantFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Binding.ShowBoA and bindingStatus == BoA then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Binding.ShowBoE and bindingStatus == BoE then
		shouldHide = true
	end

	return shouldHide
end

local function ShouldHideOwnIcon(bag)
	local shouldHide = false

	if not CaerdonWardrobeConfig.Icon.ShowLearnable.BankAndBags and IsBankOrBags(bag) then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnable.GuildBank and bag == "GuildBankFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnable.Merchant and bag == "MerchantFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnable.Auction and bag == "AuctionFrame" then
		shouldHide = true
	end

	return shouldHide
end

local function ShouldHideOtherIcon(bag)
	local shouldHide = false

	if not CaerdonWardrobeConfig.Icon.ShowLearnableByOther.BankAndBags and IsBankOrBags(bag) then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnableByOther.GuildBank and bag == "GuildBankFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnableByOther.Merchant and bag == "MerchantFrame" then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowLearnableByOther.Auction and bag == "AuctionFrame" then
		shouldHide = true
	end

	return shouldHide
end

local function ShouldHideSellableIcon(bag)
	local shouldHide = false

	if not CaerdonWardrobeConfig.Icon.ShowSellable.BankAndBags and IsBankOrBags(bag) then
		shouldHide = true
	end

	if not CaerdonWardrobeConfig.Icon.ShowSellable.GuildBank and bag == "GuildBankFrame" then
		shouldHide = true
	end

	if bag == "MerchantFrame" then
		shouldHide = true
	end

	if bag == "AuctionFrame" then
		shouldHide = true
	end

	return shouldHide
end

local function SetItemButtonMogStatusFilter(originalButton, isFiltered)
	local button = originalButton.caerdonButton
	if button then
		local mogStatus = button.mogStatus
		if mogStatus then
			if isFiltered then
				mogStatus:SetAlpha(0.3)
			else
				mogStatus:SetAlpha(mogStatus.assignedAlpha)
			end
		end
	end
end

local function SetItemButtonMogStatus(originalButton, status, bindingStatus, options, bag, slot, itemID)
	local button = originalButton.caerdonButton
	if not button then
		button = CreateFrame("Frame", nil, originalButton)
		button:SetAllPoints()
		button.searchOverlay = originalButton.searchOverlay
		originalButton.caerdonButton = button
	end

	local mogStatus = button.mogStatus
	local mogAnim = button.mogAnim
	local iconPosition, showSellables, isSellable
	local otherIcon = "Interface\\Store\\category-icon-free"
	local otherIconSize = 40
	local otherIconOffset = 0
	local iconOffset = 0

	if options then 
		showSellables = options.showSellables
		isSellable = options.isSellable
		if options.iconOffset then
			iconOffset = options.iconOffset
			otherIconOffset = iconOffset
		end

		if options.otherIcon then
			otherIcon = options.otherIcon
		end

		if options.otherIconSize then
			otherIconSize = options.otherIconSize
		end

		if options.otherIconOffset then
			otherIconOffset = options.otherIconOffset
		end
	else
		options = {}
	end

	if options.overridePosition then -- for Encounter Journal so far
		iconPosition = options.overridePosition
	else
		iconPosition = CaerdonWardrobeConfig.Icon.Position
	end

	if not status then
		if mogAnim and mogAnim:IsPlaying() then
			mogAnim:Stop()
		end
		if mogStatus then
			mogStatus:SetTexture("")
		end

		-- Keep processing to handle gear set icon
		-- return
	end

	if not mogStatus then
		mogStatus = button:CreateTexture(nil, "OVERLAY", nil, 2)
		SetIconPositionAndSize(mogStatus, iconPosition, 15, 40, iconOffset)
		button.mogStatus = mogStatus
	end

	-- local mogFlash = button.mogFlash
	-- if not mogFlash then
	-- 	mogFlash = button:CreateTexture(nil, "OVERLAY")
	-- 	mogFlash:SetAlpha(0)
	-- 	mogFlash:SetBlendMode("ADD")
	-- 	mogFlash:SetAtlas("bags-glow-flash", true)
	-- 	mogFlash:SetPoint("CENTER")

	-- 	button.mogFlash = mogFlash
	-- end

	local showAnim = false
	if status == "waiting" then
		showAnim = true

		if not mogAnim or not button.isWaitingIcon then
			mogAnim = mogStatus:CreateAnimationGroup()

			AddRotation(mogAnim, 1, 360, 0.5, "IN_OUT")

		    mogAnim:SetLooping("REPEAT")
			button.mogAnim = mogAnim
			button.isWaitingIcon = true
		end
	else
		if status == "own" or status == "ownPlus" or status == "otherPlus" then
			showAnim = true

			if mogAnim and button.isWaitingIcon then
				if mogAnim:IsPlaying() then
					mogAnim:Finish()
				end

				mogAnim = nil
				button.isWaitingIcon = false
			end

			if not mogAnim then
				mogAnim = mogStatus:CreateAnimationGroup()

				AddRotation(mogAnim, 1, 110, 0.2, "OUT")
				AddRotation(mogAnim, 2, -155, 0.2, "OUT")
				AddRotation(mogAnim, 3, 60, 0.2, "OUT")
				AddRotation(mogAnim, 4, -15, 0.1, "OUT", 0, 2)

			    mogAnim:SetLooping("REPEAT")
				button.mogAnim = mogAnim
				button.isWaitingIcon = false
			end
		else
			showAnim = false
		end
	end

	-- 	if not mogAnim then
	-- 		mogAnim = button:CreateAnimationGroup()
	-- 		mogAnim:SetToFinalAlpha(true)
	-- 		mogAnim.alpha1 = mogAnim:CreateAnimation("Alpha")
	-- 		mogAnim.alpha1:SetChildKey("mogFlash")
	-- 		mogAnim.alpha1:SetSmoothing("OUT");
	-- 		mogAnim.alpha1:SetDuration(0.6)
	-- 		mogAnim.alpha1:SetOrder(1)
	-- 		mogAnim.alpha1:SetFromAlpha(1);
	-- 		mogAnim.alpha1:SetToAlpha(0);

	-- 		button.mogAnim = mogAnim
	-- 	end

	local alpha = 1
	if status == "own" or status == "ownPlus" then
		if not ShouldHideOwnIcon(bag) then
			SetIconPositionAndSize(mogStatus, iconPosition, 15, 40, iconOffset)
			mogStatus:SetTexture("Interface\\Store\\category-icon-clothes")
			mogStatus:SetVertexColor(1, 1, 1)
			if status == "ownPlus" then
				mogStatus:SetVertexColor(0.4, 1, 0)
			end
		else
			mogStatus:SetTexture("")
		end
	elseif status == "other" or status == "otherPlus" then
		if not ShouldHideOtherIcon(bag) then
			SetIconPositionAndSize(mogStatus, iconPosition, 15, otherIconSize, otherIconOffset)
			mogStatus:SetTexture(otherIcon)
			mogStatus:SetVertexColor(1, 1, 1)
			if status == "otherPlus" then
				mogStatus:SetVertexColor(0.4, 1, 0)
			end
		else
			mogStatus:SetTexture("")
		end
	elseif status == "collected" then
		if not IsGearSetStatus(bindingStatus) and showSellables and isSellable and not ShouldHideSellableIcon(bag) then -- it's known and can be sold
			SetIconPositionAndSize(mogStatus, iconPosition, 10, 30, iconOffset)
			alpha = 0.9
			mogStatus:SetTexture("Interface\\Store\\category-icon-services")
		elseif IsGearSetStatus(bindingStatus) and CaerdonWardrobeConfig.Binding.ShowGearSetsAsIcon then
			SetIconPositionAndSize(mogStatus, iconPosition, 10, 30, iconOffset)
			mogStatus:SetTexture("Interface\\Store\\category-icon-clothes")
		else
			mogStatus:SetTexture("")
		end
	elseif status == "waiting" then
		alpha = 0.5
		SetIconPositionAndSize(mogStatus, iconPosition, 10, 30, iconOffset)
		mogStatus:SetTexture("Interface\\Common\\StreamCircle")
	elseif IsGearSetStatus(bindingStatus) and CaerdonWardrobeConfig.Binding.ShowGearSetsAsIcon then
		SetIconPositionAndSize(mogStatus, iconPosition, 10, 30, iconOffset)
		mogStatus:SetTexture("Interface\\Store\\category-icon-clothes")
	end

	mogStatus:SetAlpha(alpha)
	mogStatus.assignedAlpha = alpha

	C_Timer.After(0, function() 
		if(button.searchOverlay and button.searchOverlay:IsShown()) then
			mogStatus:SetAlpha(0.3)
		end
	end)

	if showAnim and CaerdonWardrobeConfig.Icon.EnableAnimation then
		if mogAnim and not mogAnim:IsPlaying() then
			mogAnim:Play()
		end
	else
		if mogAnim and mogAnim:IsPlaying() then
			mogAnim:Finish()
		end
	end
end

local function SetItemButtonBindType(button, mogStatus, bindingStatus, options, bag, itemID)
	local bindsOnText = button.bindsOnText

	if not bindingStatus and not bindsOnText then return end
	if not bindingStatus or ShouldHideBindingStatus(bag, bindingStatus) then
		if bindsOnText then
			bindsOnText:SetText("")
		end
		return
	end

	if not bindsOnText then
		bindsOnText = button:CreateFontString(nil, "BORDER", "SystemFont_Outline_Small") 
		button.bindsOnText = bindsOnText
	end

	bindsOnText:ClearAllPoints()
	bindsOnText:SetWidth(button:GetWidth())

	if CaerdonWardrobeConfig.Binding.Position == "BOTTOM" then
		bindsOnText:SetPoint("BOTTOMRIGHT", 0, 2)
		if bindingStatus == BoA then
			if button.count and button.count > 1 then
				bindsOnText:SetPoint("BOTTOMRIGHT", 0, 15)
			end
		end
	elseif CaerdonWardrobeConfig.Binding.Position == "CENTER" then
		bindsOnText:SetPoint("CENTER", 0, 0)
	elseif CaerdonWardrobeConfig.Binding.Position == "TOP" then
		bindsOnText:SetPoint("TOPRIGHT", 0, -2)
	end

	local bindingText
	if IsGearSetStatus(bindingStatus) then -- is gear set
		if CaerdonWardrobeConfig.Binding.ShowGearSets and not CaerdonWardrobeConfig.Binding.ShowGearSetsAsIcon then
			bindingText = "|cFFFFFFFF" .. bindingStatus .. "|r"
		end
	else
		if mogStatus == "own" then
			if bindingStatus == BoA then
				local color = BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_HEIRLOOM]
				bindsOnText:SetTextColor(color.r, color.g, color.b, 1)
				bindingText = bindingStatus
			else
				bindingText = "|cFF00FF00" .. bindingStatus .. "|r"
			end
		elseif mogStatus == "other" then
			bindingText = "|cFFFF0000" .. bindingStatus .. "|r"
		elseif mogStatus == "collected" then
			if bindingStatus == BoA then
				local color = BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_HEIRLOOM]
				bindsOnText:SetTextColor(color.r, color.g, color.b, 1)
				bindingText = bindingStatus
			elseif bindingStatus == BoE then
				bindingText = "|cFF00FF00" .. bindingStatus .. "|r"
			else
				bindingText = bindingStatus
			end
		else
			if bindingStatus == BoA then
				local color = BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_HEIRLOOM]
				bindsOnText:SetTextColor(color.r, color.g, color.b, 1)
				bindingText = bindingStatus
			else
				bindingText = "|cFF00FF00" .. bindingStatus .. "|r"
			end
		end
	end

	bindsOnText:SetText(bindingText)
end

function CaerdonWardrobe:ResetButton(button)
	SetItemButtonMogStatus(button, nil)
	SetItemButtonBindType(button, nil)
end

local itemQueue = {}
local function QueueProcessItem(itemLink, itemID, bag, slot, button, options, itemProcessed)
	local itemKey = GetItemKey(bag, slot, itemLink)
	itemQueue[itemKey] = { itemID = itemID, bag = bag, slot = slot, button = button, options = options, itemProcessed = itemProcessed }
	SetItemButtonMogStatus(button, "waiting", nil, options, bag, slot, itemID)
	isItemUpdateRequested = true
end

local function ItemIsSellable(itemID, itemLink)
	local isSellable = true
	if itemID == 23192 then -- Tabard of the Scarlet Crusade needs to be worn for a vendor at Darkmoon Faire
		isSellable = false
	elseif itemID == 116916 then -- Gorepetal's Gentle Grasp allows faster herbalism in Draenor
		isSellable = false
	end
	return isSellable
end

local function ProcessItem(itemID, bag, slot, button, options, itemProcessed)
	local bindingText
	local mogStatus = nil

   	if not options then
   		options = {}
   	end

	local showMogIcon = options.showMogIcon
	local showBindStatus = options.showBindStatus
	local showSellables = options.showSellables

	local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.GetItemInfo(itemID)

	itemLink = GetItemLinkLocal(bag, slot)
	if bag == "EncounterJournal" and not itemLink then
		return
	end

	local bindingStatus, needsItem, hasUse, isDressable, isInEquipmentSet, isBindOnPickup, isCompletionistItem, shouldRetry = GetBindingStatus(bag, slot, itemID, itemLink)
	if shouldRetry then
		QueueProcessItem(itemLink, itemID, bag, slot, button, options, itemProcessed)
		return
	end

	local appearanceID, isCollected, sourceID, shouldRetry = GetItemAppearance(itemID, itemLink)
	if shouldRetry then
		QueueProcessItem(itemLink, itemID, bag, slot, button, options, itemProcessed)
		return
	end

	if appearanceID then
		if(needsItem and not isCollected and not PlayerHasAppearance(appearanceID)) then
			local canCollect, matchedSource, shouldRetry = PlayerCanCollectAppearance(appearanceID, itemID, itemLink)
			if shouldRetry then
				QueueProcessItem(itemLink, itemID, bag, slot, button, options, itemProcessed)
				return
			end

			if canCollect then
				mogStatus = "own"
			else
				if bindingStatus and needsItem then
					mogStatus = "other"
				elseif bag == "EncounterJournal" and needsItem then
					mogStatus = "other"
				elseif (bag == "LootFrame" or bag == "GroupLootFrame") and needsItem and not isBindOnPickup then
					mogStatus = "other"
				end
			end
		else

			if isCompletionistItem then
				-- You have this, but you want them all.  Why?  Because.
				local _, _, _, _, reqLevel, class, subclass, _, equipSlot = GetItemInfo(itemID)
				local playerLevel = UnitLevel("player")

				if playerLevel >= reqLevel then
					mogStatus = "ownPlus"
				else
					mogStatus = "otherPlus"
				end
			-- If an item isn't flagged as a source or has a usable effect,
			-- then don't mark it as sellable right now to avoid accidents.
			-- May need to expand this to account for other items, too, for now.
			elseif canBeSource and not isInEquipmentSet then
				if not hasUse and isDressable and not shouldRetry then -- don't flag items for sale that have use effects for now
					mogStatus = "collected"
				end
			end
			-- TODO: Decide how to expose this functionality
			-- Hide anything that doesn't match
			-- if button then
			-- 	--button.IconBorder:SetVertexColor(100, 255, 50)
			-- 	button.searchOverlay:Show()
			-- end

		end
	elseif needsItem then
		if canBeSource and isDressable and not shouldRetry then
			local _, _, _, _, reqLevel, class, subclass, _, equipSlot = GetItemInfo(itemID)
			local playerLevel = UnitLevel("player")

			if playerLevel >= reqLevel then
				mogStatus = "own"
			else
				mogStatus = "other"
			end
		end
	else
		if canBeSource then
	        local hasTransmog = C_TransmogCollection.PlayerHasTransmog(itemID)
	        if hasTransmog and not hasUse and isDressable then
	        	-- Tabards don't have an appearance ID and will end up here.
	        	mogStatus = "collected"
	        end
	    end

		-- Hide anything that doesn't match
		-- if button then
		-- 	--button.IconBorder:SetVertexColor(100, 255, 50)
		-- 	button.searchOverlay:Show()
		-- end
	end

	if mogStatus == "collected" and 
		ItemIsSellable(itemID, itemLink) and 
		not isInEquipmentSet then
       	-- Anything that reports as the player having should be safe to sell
       	-- unless it's in an equipment set or needs to be excluded for some
       	-- other reason
		options.isSellable = true
	end

	if button then
		SetItemButtonMogStatus(button, mogStatus, bindingStatus, options, bag, slot, itemID)
		SetItemButtonBindType(button, mogStatus, bindingStatus, options, bag, itemID)
	end

	if itemProcessed then
		itemProcessed(mogStatus, bindingStatus)
	end
end

local function ProcessOrWaitItem(itemID, bag, slot, button, options, itemProcessed)
	if itemID then
		local waitItem = waitingOnItemData[tostring(itemID)]
		if not waitItem then
			waitItem = {}
			waitingOnItemData[tostring(itemID)] = waitItem
		end

		local waitBag = waitItem[tostring(bag)]
		if not waitBag then
			waitBag = {}
			waitItem[tostring(bag)] = waitBag
		end

		local itemName = GetItemInfoLocal(itemID, bag, slot)
		local itemLink = GetItemLinkLocal(bag, slot)

		if itemName == nil or itemLink == nil then
			SetItemButtonMogStatus(button, "waiting", nil, options, bag, slot, itemID)
			waitBag[tostring(slot)] = { itemID = itemID, bag = bag, slot = slot, button = button, options = options, itemProcessed = itemProcessed}
		else
			waitingOnItemData[tostring(itemID)][tostring(bag)][tostring(slot)] = nil
			ProcessItem(itemID, bag, slot, button, options, itemProcessed)
		end
	else
		SetItemButtonMogStatus(button, nil)
		SetItemButtonBindType(button, nil)
	end
end

function CaerdonWardrobe:ProcessItem(itemID, bag, slot, button, options, itemProcessed)
	ProcessOrWaitItem(itemID, bag, slot, button, options, itemProcessed)
end

function CaerdonWardrobe:RegisterBagAddon(options)
	isBagAddon = true
end

local function OnContainerUpdate(self, asyncUpdate)
	local bagID = self:GetID()

	for buttonIndex = 1, self.size do
		local button = _G[self:GetName() .. "Item" .. buttonIndex]
		local slot = button:GetID()

		local itemID = GetContainerItemID(bagID, slot)
		local texture, itemCount, locked = GetContainerItemInfo(bagID, slot)

		ProcessOrWaitItem(itemID, bagID, slot, button, { showMogIcon = true, showBindStatus = true, showSellables = true })
	end
end

local function OnItemUpdate_Coroutine()
	local processQueue = {}
	local itemCount = 0

	for itemKey, itemInfo in pairs(itemQueue) do
		itemQueue[itemKey] = nil
		itemCount = itemCount + 1

		ProcessOrWaitItem(itemInfo.itemID, itemInfo.bag, itemInfo.slot, itemInfo.button, itemInfo.options, itemInfo.itemProcessed)
		if itemCount % 8 == 0 then
			coroutine.yield()
		end
	end
end

local waitingOnBagUpdate = {}
local function OnBagUpdate_Coroutine()
    for frameID, shouldUpdate in pairs(waitingOnBagUpdate) do
		local frame = _G["ContainerFrame".. frameID]

		if frame:IsShown() then
			OnContainerUpdate(frame, true)
			waitingOnBagUpdate[frameID] = nil
		end
		coroutine.yield()
    end

	-- waitingOnBagUpdate = {}
end

local function AddBagUpdateRequest(bagID)
	local foundBag = false
	for i=1, NUM_CONTAINER_FRAMES, 1 do
		local frame = _G["ContainerFrame"..i];
		if ( frame:GetID() == bagID ) then
			waitingOnBagUpdate[tostring(i)] = true
			foundBag = true
		end
	end
end

local function ScheduleContainerUpdate(frame)
	local bagID = frame:GetID()
	AddBagUpdateRequest(bagID)
end

-- hooksecurefunc("ContainerFrame_Update", ScheduleContainerUpdate)

local function OnBankItemUpdate(button)
	local containerID = button:GetParent():GetID();
	if( button.isBag ) then
		containerID = -ITEM_INVENTORY_BANK_BAG_OFFSET;
		return
	end

	local buttonID = button:GetID()

	local bag = "BankFrame"
	local slot = button:GetInventorySlot();

	local itemID = GetContainerItemID(containerID, buttonID)
	ProcessOrWaitItem(itemID, bag, slot, button, { showMogIcon=true, showBindStatus=true, showSellables=true })
end

-- hooksecurefunc("BankFrameItemButton_Update", OnBankItemUpdate)

local isGuildBankFrameUpdateRequested = false

local function OnGuildBankFrameUpdate_Coroutine()
	if( GuildBankFrame.mode == "bank" ) then
		local tab = GetCurrentGuildBankTab();
		local button, index, column;
		local texture, itemCount, locked, isFiltered, quality;

		for i=1, MAX_GUILDBANK_SLOTS_PER_TAB do
			index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
			if ( index == 0 ) then
				index = NUM_SLOTS_PER_GUILDBANK_GROUP;

				coroutine.yield()
			end

			if isGuildBankFrameUpdateRequested then
				return
			end

			column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
			button = _G["GuildBankColumn"..column.."Button"..index];

			local bag = "GuildBankFrame"
			local slot = {tab = tab, index = i}

			local options = {
				showMogIcon = true,
				showBindStatus = true,
				showSellables = true
			}

			local itemLink = GetGuildBankItemLink(tab, i)
			if itemLink then
				local itemID = GetItemID(itemLink)
				ProcessOrWaitItem(itemID, bag, slot, button, options)
			else
				-- nil results in button icon / text reset
				ProcessOrWaitItem(nil, bag, slot, button, options)
			end
		end
	end
end

local function OnGuildBankFrameUpdate()
	isGuildBankFrameUpdateRequested = true
end

local function OnAuctionBrowseUpdate()
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame);

	for i=1, NUM_BROWSE_TO_DISPLAY do
		local auctionIndex = offset + i
		local index = auctionIndex + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page);
		local buttonName = "BrowseButton"..i.."Item";
		local button = _G[buttonName];
		local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemID, hasAllInfo =  GetAuctionItemInfo("list", auctionIndex);

		local bag = "AuctionFrame"
		local slot = auctionIndex

		local itemLink = GetAuctionItemLink("list", auctionIndex)
		if(itemLink) then
			local itemID = GetItemID(itemLink)
			if itemID and button then
				ProcessOrWaitItem(itemID, bag, slot, button, { showMogIcon=true, showBindStatus=false, showSellables=false })
			end
		end
	end
end

local function OnMerchantUpdate()
	for i=1, MERCHANT_ITEMS_PER_PAGE, 1 do
		local index = (((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i)

		local button = _G["MerchantItem"..i.."ItemButton"];

		local bag = "MerchantFrame"
		local slot = index

		local itemID = GetMerchantItemID(index)
		ProcessOrWaitItem(itemID, bag, slot, button, { showMogIcon=true, showBindStatus=true, showSellables=false})
	end
end

hooksecurefunc("MerchantFrame_UpdateMerchantInfo", OnMerchantUpdate)

local ignoreEvents = {
	["APPEARANCE_SEARCH_UPDATED"] = {},
	["ACTIONBAR_UPDATE_COOLDOWN"] = {},
	["BAG_UPDATE_COOLDOWN"] = {},
	["BN_FRIEND_INFO_CHANGED"] = {},
	["CHAT_MSG_BN_WHISPER"] = {},
	["CHAT_MSG_BN_WHISPER_INFORM"] = {},
	["CHAT_MSG_CHANNEL"] = {},
	["CHAT_MSG_SYSTEM"] = {},
	["CHAT_MSG_TRADESKILLS"] = {},
	["COMBAT_LOG_EVENT_UNFILTERED"] = {},
	["COMPANION_UPDATE"] = {},
	["CRITERIA_UPDATE"] = {},
	["CURSOR_UPDATE"] = {},
	["GET_ITEM_INFO_RECEIVED"] = {},
	["GUILDBANKBAGSLOTS_CHANGED"] = {},
	["GUILD_ROSTER_UPDATE"] = {},
	["ITEM_LOCK_CHANGED"] = {},
	["ITEM_LOCKED"] = {},
	["ITEM_UNLOCKED"] = {},
	["MODIFIER_STATE_CHANGED"] = {},
	["NAME_PLATE_UNIT_REMOVED"] = {},
	["QUEST_LOG_UPDATE"] = {},
	["SPELL_UPDATE_COOLDOWN"] = {},
	["SPELL_UPDATE_USABLE"] = {},
	["UNIT_ABSORBE_AMOUNT_CHANGED"] = {},
	["UNIT_AURA"] = {},
	["UNIT_POWER"] = {},
	["UNIT_POWER_FREQUENT"] = {},
	["UPDATE_INVENTORY_DURABILITY"] = {},
	["UPDATE_MOUSEOVER_UNIT"] = {},
	["UPDATE_PENDING_MAIL"] = {},
	["UPDATE_WORLD_STATES"] = {},
	["WORLD_MAP_UPDATE"] = {}
}

local function OnEvent(self, event, ...)
	local handler = self[event]
	if(handler) then
		handler(self, ...)
	end
end

local timeSinceLastGuildBankUpdate = nil
local timeSinceLastBagUpdate = nil
local GUILDBANKFRAMEUPDATE_INTERVAL = 0.1
local BAGUPDATE_INTERVAL = 0.1
local ITEMUPDATE_INTERVAL = 0.1
local timeSinceLastItemUpdate = nil

local function OnUpdate(self, elapsed)
	if self.itemUpdateCoroutine then
		if coroutine.status(self.itemUpdateCoroutine) ~= "dead" then
			local ok, result = coroutine.resume(self.itemUpdateCoroutine)
			if not ok then
				error(result)
			end
		else
			self.itemUpdateCoroutine = nil
		end
		return
	end

	if(self.bagUpdateCoroutine) then
		if coroutine.status(self.bagUpdateCoroutine) ~= "dead" then
			local ok, result = coroutine.resume(self.bagUpdateCoroutine)
			if not ok then
				error(result)
			end
		else
			self.bagUpdateCoroutine = nil
		end
		return
	end

	if(self.guildBankUpdateCoroutine) then
		if coroutine.status(self.guildBankUpdateCoroutine) ~= "dead" then
			local ok, result = coroutine.resume(self.guildBankUpdateCoroutine)
			if not ok then
				error(result)
			end
		else
			self.guildBankUpdateCoroutine = nil
		end
		return
	end

	if isGuildBankFrameUpdateRequested then
		isGuildBankFrameUpdateRequested = false
		timeSinceLastGuildBankUpdate = 0
	elseif timeSinceLastGuildBankUpdate then
		timeSinceLastGuildBankUpdate = timeSinceLastGuildBankUpdate + elapsed
	end

	if isBagUpdateRequested then
		isBagUpdateRequested = false
		timeSinceLastBagUpdate = 0
	elseif timeSinceLastBagUpdate then
		timeSinceLastBagUpdate = timeSinceLastBagUpdate + elapsed
	end

	if isItemUpdateRequested then
		isItemUpdateRequested = false
		timeSinceLastItemUpdate = 0
	elseif timeSinceLastItemUpdate then
		timeSinceLastItemUpdate = timeSinceLastItemUpdate + elapsed
	end

	if( timeSinceLastGuildBankUpdate ~= nil and (timeSinceLastGuildBankUpdate > GUILDBANKFRAMEUPDATE_INTERVAL) ) then
		timeSinceLastGuildBankUpdate = nil
		self.guildBankUpdateCoroutine = coroutine.create(OnGuildBankFrameUpdate_Coroutine)
	end

	if( timeSinceLastBagUpdate ~= nil and (timeSinceLastBagUpdate > BAGUPDATE_INTERVAL) ) then
		timeSinceLastBagUpdate = nil
		self.bagUpdateCoroutine = coroutine.create(OnBagUpdate_Coroutine)
	end

	if( timeSinceLastItemUpdate ~= nil and (timeSinceLastItemUpdate > ITEMUPDATE_INTERVAL) ) then
		timeSinceLastItemUpdate = nil
		self.itemUpdateCoroutine = coroutine.create(OnItemUpdate_Coroutine)
	end
end

local function OnEncounterJournalSetLootButton(item)
	local itemID, encounterID, name, icon, slot, armorType, itemLink = EJ_GetLootInfoByIndex(item.index);
	local options = {
		iconOffset = 8,
		otherIcon = "Interface\\Buttons\\UI-GroupLoot-Pass-Up",
		otherIconSize = 21,
		otherIconOffset = 16,
		overridePosition = "TOPRIGHT"
	}

	if name then
		ProcessItem(itemID, "EncounterJournal", item, item, options)
	end
end

eventFrame = CreateFrame("FRAME", "CaerdonWardrobeFrame")
eventFrame:RegisterEvent "ADDON_LOADED"
eventFrame:RegisterEvent "PLAYER_LOGOUT"
eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:SetScript("OnUpdate", OnUpdate)

C_TransmogCollection.SetShowMissingSourceInItemTooltips(true)
SetCVar("missingTransmogSourceInItemTooltips", 1)

function CaerdonWardrobe:GetDefaultConfig()
	return {
		Version = 7,
		Icon = {
			EnableAnimation = true,
			Position = "TOPRIGHT",

			ShowLearnable = {
				BankAndBags = true,
				GuildBank = true,
				Merchant = true,
				Auction = true,
				SameLookDifferentItem = false
			},

			ShowLearnableByOther = {
				BankAndBags = true,
				GuildBank = true,
				Merchant = true,
				Auction = true,
				EncounterJournal = true,
				SameLookDifferentItem = false
			},

			ShowSellable = {
				BankAndBags = true,
				GuildBank = false
			}
		},

		Binding = {
			ShowStatus = {
				BankAndBags = true,
				GuildBank = true,
				Merchant = true
			},

			ShowBoA = true,
			ShowBoE = true,
			ShowGearSets = true,
			ShowGearSetsAsIcon = false,
			Position = "BOTTOM"
		}
	}
end

local function ProcessSettings()
	if not CaerdonWardrobeConfig or CaerdonWardrobeConfig.Version ~= CaerdonWardrobe:GetDefaultConfig().Version then
		CaerdonWardrobeConfig = CaerdonWardrobe:GetDefaultConfig()
	end
end

function eventFrame:PLAYER_LOGOUT()
end

function eventFrame:ADDON_LOADED(name)
	if name == "Combuctor" then
		ProcessSettings()
		CaerdonWardrobe:FireConfigLoaded()

		if IsLoggedIn() then
			OnEvent(eventFrame, "PLAYER_LOGIN")
		else
			eventFrame:RegisterEvent "PLAYER_LOGIN"
		end
	elseif name == "Blizzard_AuctionUI" then
		hooksecurefunc("AuctionFrameBrowse_Update", OnAuctionBrowseUpdate)
	elseif name == "Blizzard_GuildBankUI" then
		hooksecurefunc("GuildBankFrame_Update", OnGuildBankFrameUpdate)
	elseif name == "Blizzard_EncounterJournal" then
		hooksecurefunc("EncounterJournal_SetLootButton", OnEncounterJournalSetLootButton)
	end
end

function eventFrame:PLAYER_LOGIN(...)
		eventFrame:RegisterEvent "PLAYERBANKSLOTS_CHANGED"
		eventFrame:RegisterEvent "BAG_OPEN"
		eventFrame:RegisterEvent "BAG_UPDATE"
		eventFrame:RegisterEvent "BAG_UPDATE_DELAYED"
		eventFrame:RegisterEvent "BANKFRAME_OPENED"
		eventFrame:RegisterEvent "GET_ITEM_INFO_RECEIVED"
		eventFrame:RegisterEvent "TRANSMOG_COLLECTION_UPDATED"
		-- eventFrame:RegisterEvent "TRANSMOG_COLLECTION_ITEM_UPDATE"
		eventFrame:RegisterEvent "EQUIPMENT_SETS_CHANGED"
		eventFrame:RegisterEvent "MERCHANT_UPDATE"
	C_TransmogCollection.SetShowMissingSourceInItemTooltips(true)
end

function RefreshMainBank()
	if not isBagAddon then
		for i=1, NUM_BANKGENERIC_SLOTS, 1 do
			button = BankSlotsFrame["Item"..i];
			OnBankItemUpdate(button);
		end
	end
end

local function RefreshItems()
	cachedBinding = {}
	cachedIsDressable = {}

	if MerchantFrame:IsShown() then
		OnMerchantUpdate()
	end

	if AuctionFrame and AuctionFrame:IsShown() then
		OnAuctionBrowseUpdate()
	end

	if BankFrame:IsShown() then
		RefreshMainBank()
	end

	for i=1, NUM_CONTAINER_FRAMES, 1 do
		local frame = _G["ContainerFrame"..i];
		waitingOnBagUpdate[tostring(i)] = true
		isBagUpdateRequested = true
	end
end

local function OnContainerFrameUpdateSearchResults(frame)
	local id = frame:GetID();
	local name = frame:GetName().."Item";
	local itemButton;
	local _, isFiltered;
	
	for i=1, frame.size, 1 do
		itemButton = _G[name..i] or frame["Item"..i];
		_, _, _, _, _, _, _, isFiltered = GetContainerItemInfo(id, itemButton:GetID())
		SetItemButtonMogStatusFilter(itemButton, isFiltered)
	end
end

hooksecurefunc("ContainerFrame_UpdateSearchResults", OnContainerFrameUpdateSearchResults)

local function OnEquipPendingItem()
	-- TODO: Bit of a hack... wait a bit and then update...
	--       Need to figure out a better way.  Otherwise,
	--		 you end up with BoE markers on things you've put on.
	C_Timer.After(1, function() RefreshItems() end)
end

hooksecurefunc("EquipPendingItem", OnEquipPendingItem)

local function OnOpenBag(bagID)
	if not isBagAddon then
		for i=1, NUM_CONTAINER_FRAMES, 1 do
			local frame = _G["ContainerFrame"..i];
			if ( frame:IsShown() and frame:GetID() == bagID ) then
				waitingOnBagUpdate[tostring(i)] = true
				isBagUpdateRequested = true
				break
			end
		end
	end
end

local function OnOpenBackpack()
	if not isBagAddon then
		isBagUpdateRequested = true
	end
end

hooksecurefunc("OpenBag", OnOpenBag)
hooksecurefunc("OpenBackpack", OnOpenBackpack)
hooksecurefunc("ToggleBag", OnOpenBag)

function eventFrame:BAG_UPDATE(bagID)
	AddBagUpdateRequest(bagID)
end

function eventFrame:BAG_UPDATE_DELAYED()
	local count = 0
	for _ in pairs(waitingOnBagUpdate) do 
		count = count + 1
	end

	if count == 0 then
		RefreshItems()
	else
		isBagUpdateRequested = true
	end
end

function eventFrame:GET_ITEM_INFO_RECEIVED(itemID)
	local itemData = waitingOnItemData[tostring(itemID)]
	if itemData then
        for bag, bagData in pairs(itemData) do
        	for slot, slotData in pairs(bagData) do
        		-- Checking item info before continuing.  In certain cases,
        		-- the name / link are still nil here for some reason.
        		-- I've seen it at merchants so far.  I'm assuming that
        		-- these requests will ultimately result in yet another
        		-- GET_ITEM_INFO_RECEIVED event as that seems to be the case.
				local itemName = GetItemInfoLocal(slotData.bag, slotData.slot)
				local itemLink = GetItemLinkLocal(slotData.bag, slotData.slot)

				if itemLink and itemName then
					ProcessItem(itemID, slotData.bag, slotData.slot, slotData.button, slotData.options, slotData.itemProcessed)
				else
					ProcessOrWaitItem(itemID, slotData.bag, slotData.slot, slotData.button, slotData.options, slotData.itemProcessed)
				end
        	end
        end
	end
end

function eventFrame:TRANSMOG_COLLECTION_ITEM_UPDATE()
	-- RefreshItems()
end

function eventFrame:TRANSMOG_COLLECTION_UPDATED()
	RefreshItems()
end

function eventFrame:MERCHANT_UPDATE()
	RefreshItems()
end

function eventFrame:EQUIPMENT_SETS_CHANGED()
	RefreshItems()
end

function eventFrame:BANKFRAME_OPENED()
	RefreshMainBank()
end

function eventFrame:PLAYERBANKSLOTS_CHANGED(slot, arg2)
	if ( slot <= NUM_BANKGENERIC_SLOTS ) then
		OnBankItemUpdate(BankSlotsFrame["Item"..slot]);
	else
		OnBankItemUpdate(BankSlotsFrame["Bag"..(slot-NUM_BANKGENERIC_SLOTS)]);
	end
end

local function OnLootFrameUpdateButton(index)
	local numLootItems = LootFrame.numLootItems;
	local numLootToShow = LOOTFRAME_NUMBUTTONS;

	if LootFrame.AutoLootTable then
		numLootItems = #LootFrame.AutoLootTable
	end

	if numLootItems > LOOTFRAME_NUMBUTTONS then
		numLootToShow = numLootToShow - 1
	end

	local isProcessing = false
	
	local button = _G["LootButton"..index];
	local slot = (numLootToShow * (LootFrame.page - 1)) + index;
	if slot <= numLootItems then
		if ((LootSlotHasItem(slot) or (LootFrame.AutoLootTable and LootFrame.AutoLootTable[slot])) and index <= numLootToShow) then
			-- texture, item, quantity, quality, locked, isQuestItem, questId, isActive = GetLootSlotInfo(slot)
			link = GetLootSlotLink(slot)
			if link then
				local itemID = GetItemID(link)
				if itemID then
					isProcessing = true
					ProcessOrWaitItem(itemID, "LootFrame", { index = slot, link = link }, button, nil)
				end
			end
		end
	end

	if not isProcessing then
		SetItemButtonMogStatus(button, nil)
		SetItemButtonBindType(button, nil)
	end
end

function OnGroupLootFrameShow(frame)
	-- local texture, name, count, quality, bindOnPickUp, canNeed, canGreed, canDisenchant, reasonNeed, reasonGreed, reasonDisenchant, deSkillRequired = GetLootRollItemInfo(frame.rollID)
	-- if name == nil then
	-- 	return
	-- end

	local itemLink = GetLootRollItemLink(frame.rollID)
	if itemLink == nil then
		return
	end

	local itemID = GetItemID(itemLink)
	if itemID then
		ProcessOrWaitItem(itemID, "GroupLootFrame", { index = frame.rollID, link = itemLink}, frame.IconFrame, nil)
	end
end

hooksecurefunc("LootFrame_UpdateButton", OnLootFrameUpdateButton)

GroupLootFrame1:HookScript("OnShow", OnGroupLootFrameShow)
GroupLootFrame2:HookScript("OnShow", OnGroupLootFrameShow)
GroupLootFrame3:HookScript("OnShow", OnGroupLootFrameShow)
GroupLootFrame4:HookScript("OnShow", OnGroupLootFrameShow)

local configFrame
local isConfigLoaded = false

function CaerdonWardrobe:RegisterConfigFrame(frame)
	configFrame = frame
	if isConfigLoaded then
		CaerdonWardrobe:FireConfigLoaded()
	end
end

function CaerdonWardrobe:FireConfigLoaded()
	isConfigLoaded = true
	if configFrame then
		configFrame:OnConfigLoaded()
	end
end

-- BAG_OPEN
-- GUILDBANKBAGSLOTS_CHANGED
-- GUILDBANKFRAME_OPENED

-----------------------------------config
local components, pendingConfig
local configFrame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)

local function PropagateErrors(func)
	-- Make sure that errors aren't swallowed for InterfaceOption callbacks
	return function() xpcall(function () func(configFrame) end, geterrorhandler()) end
end

function configFrame:InitializeConfig()
	self:Hide()
	self:CreateComponents()
	CaerdonWardrobe:RegisterConfigFrame(self)
end

function configFrame:CreateComponents()
	components = {}
	components.title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	components.title:SetText("|cff00ff00[背包]|r幻化提示")
	components.title:SetPoint("TOPLEFT", 16, -16)

	components.titleSeparator = self:CreateTexture(nil, "ARTWORK")
	components.titleSeparator:SetColorTexture(0.25, 0.25, 0.25)
	components.titleSeparator:SetSize(600, 1)
	components.titleSeparator:SetPoint("LEFT", self, "TOPLEFT", 10, -40)

	components.bindingTextLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	components.bindingTextLabel:SetText("提示文字 (瞎JB翻译的，我也没来得及验证是不是准确，你们发现不对就告诉我)")
	components.bindingTextLabel:SetPoint("TOPLEFT", components.titleSeparator, "BOTTOMLEFT", 0, -10)

	components.bindingTextPositionLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.bindingTextPositionLabel:SetText("定位:")
	components.bindingTextPositionLabel:SetPoint("TOPLEFT", components.bindingTextLabel, "BOTTOMLEFT", 15, -15)
	components.bindingTextPosition = CreateFrame("Button", "CaerdonWardrobeConfig_BindingTextPosition", self, "UIDropDownMenuTemplate")
	components.bindingTextPosition:SetPoint("TOPLEFT", components.bindingTextPositionLabel, "TOPRIGHT", -9, 9)

	components.showStatusLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.showStatusLabel:SetText("显示于:")
	components.showStatusLabel:SetPoint("TOPLEFT", components.bindingTextPositionLabel, "BOTTOMLEFT", 0, -15)

	components.showBindingOnBags = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showBindingOnBags", self, "InterfaceOptionsCheckButtonTemplate")
	components.showBindingOnBags:SetPoint("TOPLEFT", components.showStatusLabel, "BOTTOMLEFT", 15, -5)
	components.showBindingOnBagsLabel = _G[components.showBindingOnBags:GetName() .. "Text"]
	components.showBindingOnBagsLabel:SetWidth(80)
	components.showBindingOnBagsLabel:SetText("背包+银行")

	components.showBindingOnGuildBank = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showBindingOnGuildBank", self, "InterfaceOptionsCheckButtonTemplate")
	components.showBindingOnGuildBank:SetPoint("LEFT", components.showBindingOnBagsLabel, "RIGHT", 25, 0)
	components.showBindingOnGuildBank:SetPoint("TOP", components.showBindingOnBags, "TOP", 0, 0)
	components.showBindingOnGuildBankLabel = _G[components.showBindingOnGuildBank:GetName() .. "Text"]
	components.showBindingOnGuildBankLabel:SetWidth(80)
	components.showBindingOnGuildBankLabel:SetText("工会银行")

	components.showBindingOnMerchant = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showBindingOnMerchant", self, "InterfaceOptionsCheckButtonTemplate")
	components.showBindingOnMerchant:SetPoint("LEFT", components.showBindingOnGuildBankLabel, "RIGHT", 20, 0)
	components.showBindingOnMerchant:SetPoint("TOP", components.showBindingOnGuildBank, "TOP", 0, 0)
	components.showBindingOnMerchantLabel = _G[components.showBindingOnMerchant:GetName() .. "Text"]
	components.showBindingOnMerchantLabel:SetWidth(80)
	components.showBindingOnMerchantLabel:SetText("商人")

	components.showGearSets = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showGearSets", self, "InterfaceOptionsCheckButtonTemplate")
	components.showGearSets:SetPoint("TOPLEFT", components.showBindingOnBags, "BOTTOMLEFT", 10, -10)
	components.showGearSetsLabel = _G[components.showGearSets:GetName() .. "Text"]
	components.showGearSetsLabel:SetText("显示角标")

	components.showGearSetsAsIcon = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showGearSetsAsIcon", self, "InterfaceOptionsCheckButtonTemplate")
	components.showGearSetsAsIcon:SetPoint("TOPLEFT", components.showGearSets, "BOTTOMLEFT", 22, 8)
	components.showGearSetsAsIconLabel = _G[components.showGearSetsAsIcon:GetName() .. "Text"]
	components.showGearSetsAsIconLabel:SetText("图标样式")

	components.showBoA = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showBoA", self, "InterfaceOptionsCheckButtonTemplate")
	components.showBoA:SetPoint("LEFT", components.showGearSetsLabel, "RIGHT", 20, 0)
	components.showBoA:SetPoint("TOP", components.showGearSets, "TOP", 0, 0)
	components.showBoALabel = _G[components.showBoA:GetName() .. "Text"]
	components.showBoALabel:SetWidth(140)
	components.showBoALabel:SetText("显示战网绑定物品")

	components.showBoE = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showBoE", self, "InterfaceOptionsCheckButtonTemplate")
	components.showBoE:SetPoint("LEFT", components.showBoALabel, "RIGHT", 20, 0)
	components.showBoE:SetPoint("TOP", components.showBoA, "TOP", 0, 0)
	components.showBoELabel = _G[components.showBoE:GetName() .. "Text"]
	components.showBoELabel:SetWidth(140)
	components.showBoELabel:SetText("显示装备绑定物品")

	components.mogIconLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	components.mogIconLabel:SetText("幻化图标提示")
	components.mogIconLabel:SetPoint("TOPLEFT", components.showStatusLabel, "BOTTOMLEFT", 00, -100)

	components.mogIconPositionLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.mogIconPositionLabel:SetText("定位:")
	components.mogIconPositionLabel:SetPoint("TOPLEFT", components.mogIconLabel, "BOTTOMLEFT", 15, -15)
	components.mogIconPosition = CreateFrame("Button", "CaerdonWardrobeConfig_MogIconPosition", self, "UIDropDownMenuTemplate")
	components.mogIconPosition:SetPoint("TOPLEFT", components.mogIconPositionLabel, "TOPRIGHT", -9, 9)


	components.showLearnableLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.showLearnableLabel:SetText("显示可学:")
	components.showLearnableLabel:SetPoint("TOPLEFT", components.mogIconPositionLabel, "BOTTOMLEFT", 0, -20)

	components.showLearnableOnBags = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOnBags", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOnBags:SetPoint("TOPLEFT", components.showLearnableLabel, "BOTTOMLEFT", 15, -5)
	components.showLearnableOnBagsLabel = _G[components.showLearnableOnBags:GetName() .. "Text"]
	components.showLearnableOnBagsLabel:SetWidth(80)
	components.showLearnableOnBagsLabel:SetText("背包+银行")

	components.showLearnableOnGuildBank = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOnGuildBank", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOnGuildBank:SetPoint("LEFT", components.showLearnableOnBagsLabel, "RIGHT", 25, 0)
	components.showLearnableOnGuildBank:SetPoint("TOP", components.showLearnableOnBags, "TOP", 0, 0)
	components.showLearnableOnGuildBankLabel = _G[components.showLearnableOnGuildBank:GetName() .. "Text"]
	components.showLearnableOnGuildBankLabel:SetWidth(80)
	components.showLearnableOnGuildBankLabel:SetText("工会银行")

	components.showLearnableOnMerchant = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOnMerchant", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOnMerchant:SetPoint("LEFT", components.showLearnableOnGuildBankLabel, "RIGHT", 20, 0)
	components.showLearnableOnMerchant:SetPoint("TOP", components.showLearnableOnGuildBank, "TOP", 0, 0)
	components.showLearnableOnMerchantLabel = _G[components.showLearnableOnMerchant:GetName() .. "Text"]
	components.showLearnableOnMerchantLabel:SetWidth(80)
	components.showLearnableOnMerchantLabel:SetText("商人")

	components.showLearnableOnAuction = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOnAuction", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOnAuction:SetPoint("LEFT", components.showLearnableOnMerchantLabel, "RIGHT", 20, 0)
	components.showLearnableOnAuction:SetPoint("TOP", components.showLearnableOnMerchant, "TOP", 0, 0)
	components.showLearnableOnAuctionLabel = _G[components.showLearnableOnAuction:GetName() .. "Text"]
	components.showLearnableOnAuctionLabel:SetWidth(100)
	components.showLearnableOnAuctionLabel:SetText("AH")


	components.showLearnableOtherLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.showLearnableOtherLabel:SetText("在其它物品上显示可学:")
	components.showLearnableOtherLabel:SetPoint("TOPLEFT", components.showLearnableOnBags, "BOTTOMLEFT", -15, -15)

	components.showLearnableOtherOnBags = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOtherOnBags", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOtherOnBags:SetPoint("TOPLEFT", components.showLearnableOtherLabel, "BOTTOMLEFT", 15, -5)
	components.showLearnableOtherOnBagsLabel = _G[components.showLearnableOtherOnBags:GetName() .. "Text"]
	components.showLearnableOtherOnBagsLabel:SetWidth(80)
	components.showLearnableOtherOnBagsLabel:SetText("背包+银行")

	components.showLearnableOtherOnGuildBank = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOtherOnGuildBank", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOtherOnGuildBank:SetPoint("LEFT", components.showLearnableOtherOnBagsLabel, "RIGHT", 25, 0)
	components.showLearnableOtherOnGuildBank:SetPoint("TOP", components.showLearnableOtherOnBags, "TOP", 0, 0)
	components.showLearnableOtherOnGuildBankLabel = _G[components.showLearnableOtherOnGuildBank:GetName() .. "Text"]
	components.showLearnableOtherOnGuildBankLabel:SetWidth(80)
	components.showLearnableOtherOnGuildBankLabel:SetText("工会银行")

	components.showLearnableOtherOnMerchant = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOtherOnMerchant", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOtherOnMerchant:SetPoint("LEFT", components.showLearnableOtherOnGuildBankLabel, "RIGHT", 20, 0)
	components.showLearnableOtherOnMerchant:SetPoint("TOP", components.showLearnableOtherOnGuildBank, "TOP", 0, 0)
	components.showLearnableOtherOnMerchantLabel = _G[components.showLearnableOtherOnMerchant:GetName() .. "Text"]
	components.showLearnableOtherOnMerchantLabel:SetWidth(80)
	components.showLearnableOtherOnMerchantLabel:SetText("商人")

	components.showLearnableOtherOnAuction = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showLearnableOtherOnAuction", self, "InterfaceOptionsCheckButtonTemplate")
	components.showLearnableOtherOnAuction:SetPoint("LEFT", components.showLearnableOtherOnMerchantLabel, "RIGHT", 20, 0)
	components.showLearnableOtherOnAuction:SetPoint("TOP", components.showLearnableOtherOnMerchant, "TOP", 0, 0)
	components.showLearnableOtherOnAuctionLabel = _G[components.showLearnableOtherOnAuction:GetName() .. "Text"]
	components.showLearnableOtherOnAuctionLabel:SetWidth(100)
	components.showLearnableOtherOnAuctionLabel:SetText("AH")



	components.showSellableLabel = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	components.showSellableLabel:SetText("显示可卖出物品:")
	components.showSellableLabel:SetPoint("TOPLEFT", components.showLearnableOtherOnBags, "BOTTOMLEFT", -15, -15)

	components.showSellableOnBags = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showSellableOnBags", self, "InterfaceOptionsCheckButtonTemplate")
	components.showSellableOnBags:SetPoint("TOPLEFT", components.showSellableLabel, "BOTTOMLEFT", 15, -5)
	components.showSellableOnBagsLabel = _G[components.showSellableOnBags:GetName() .. "Text"]
	components.showSellableOnBagsLabel:SetWidth(80)
	components.showSellableOnBagsLabel:SetText("背包+银行")

	components.showSellableOnGuildBank = CreateFrame("CheckButton", "CaerdonWardrobeConfig_showSellableOnGuildBank", self, "InterfaceOptionsCheckButtonTemplate")
	components.showSellableOnGuildBank:SetPoint("LEFT", components.showSellableOnBagsLabel, "RIGHT", 25, 0)
	components.showSellableOnGuildBank:SetPoint("TOP", components.showSellableOnBags, "TOP", 0, 0)
	components.showSellableOnGuildBankLabel = _G[components.showSellableOnGuildBank:GetName() .. "Text"]
	components.showSellableOnGuildBankLabel:SetWidth(80)
	components.showSellableOnGuildBankLabel:SetText("工会银行")

	components.mogIconShowAnimation = CreateFrame("CheckButton", "CaerdonWardrobeConfig_MogIconShowAnimation", self, "InterfaceOptionsCheckButtonTemplate")
	components.mogIconShowAnimation:SetPoint("TOPLEFT", components.showSellableOnBags, "BOTTOMLEFT", -20, -15)
	components.mogIconShowAnimationLabel = _G[components.mogIconShowAnimation:GetName() .. "Text"]
	components.mogIconShowAnimationLabel:SetText("显示图标动画")

	components.mogIconShowSameLookDifferentItem = CreateFrame("CheckButton", "CaerdonWardrobeConfig_mogIconShowSameLookDifferentItem", self, "InterfaceOptionsCheckButtonTemplate")
	components.mogIconShowSameLookDifferentItem:SetPoint("TOPLEFT", components.mogIconShowAnimation, "BOTTOMLEFT", 0, -10)
	components.mogIconShowSameLookDifferentItemLabel = _G[components.mogIconShowSameLookDifferentItem:GetName() .. "Text"]
	components.mogIconShowSameLookDifferentItemLabel:SetText("包括不同的相同物品/外观(you completionist, you)")


end

function configFrame:InitializeMogIconPosition()
	self:AddMogIconPositionDropDownItem("Top Left", "TOPLEFT")
	self:AddMogIconPositionDropDownItem("Top Right", "TOPRIGHT")
	self:AddMogIconPositionDropDownItem("Bottom Left", "BOTTOMLEFT")
	self:AddMogIconPositionDropDownItem("Bottom Right", "BOTTOMRIGHT")

	UIDropDownMenu_SetSelectedValue(components.mogIconPosition, pendingConfig.Icon.Position)
end

function configFrame:InitializeBindingTextPosition()
	self:AddBindingTextPositionDropDownItem("Top", "TOP")
	self:AddBindingTextPositionDropDownItem("Center", "CENTER")
	self:AddBindingTextPositionDropDownItem("Bottom", "BOTTOM")

	UIDropDownMenu_SetSelectedValue(components.bindingTextPosition, pendingConfig.Binding.Position)
end

function configFrame:AddMogIconPositionDropDownItem(name, value)
	local info = UIDropDownMenu_CreateInfo()
	info.text = name
	info.value = value
	info.func = function(self, arg1, arg2, checked)
		UIDropDownMenu_SetSelectedValue(components.mogIconPosition, value)
		pendingConfig.Icon.Position = value
	end

	UIDropDownMenu_AddButton(info)
end

function configFrame:AddBindingTextPositionDropDownItem(name, value)
	local info = UIDropDownMenu_CreateInfo()
	info.text = name
	info.value = value
	info.func = function(self, arg1, arg2, checked)
		UIDropDownMenu_SetSelectedValue(components.bindingTextPosition, value)
		pendingConfig.Binding.Position = value
	end

	UIDropDownMenu_AddButton(info)
end

function configFrame:ApplyConfig(config)
	pendingConfig = CopyTable(config)
end

function configFrame:RefreshComponents()
	local config = pendingConfig

	UIDropDownMenu_Initialize(components.bindingTextPosition, function() self:InitializeBindingTextPosition() end)
	components.showBindingOnBags:SetChecked(config.Binding.ShowStatus.BankAndBags)
	components.showBindingOnGuildBank:SetChecked(config.Binding.ShowStatus.GuildBank)
	components.showBindingOnMerchant:SetChecked(config.Binding.ShowStatus.Merchant)
	components.showGearSets:SetChecked(config.Binding.ShowGearSets)
	components.showGearSetsAsIcon:SetChecked(config.Binding.ShowGearSetsAsIcon)
	components.showBoA:SetChecked(config.Binding.ShowBoA)
	components.showBoE:SetChecked(config.Binding.ShowBoE)

	UIDropDownMenu_Initialize(components.mogIconPosition, function() self:InitializeMogIconPosition() end)

	components.showLearnableOnBags:SetChecked(config.Icon.ShowLearnable.BankAndBags)
	components.showLearnableOnGuildBank:SetChecked(config.Icon.ShowLearnable.GuildBank)
	components.showLearnableOnMerchant:SetChecked(config.Icon.ShowLearnable.Merchant)
	components.showLearnableOnAuction:SetChecked(config.Icon.ShowLearnable.Auction)

	components.showLearnableOtherOnBags:SetChecked(config.Icon.ShowLearnableByOther.BankAndBags)
	components.showLearnableOtherOnGuildBank:SetChecked(config.Icon.ShowLearnableByOther.GuildBank)
	components.showLearnableOtherOnMerchant:SetChecked(config.Icon.ShowLearnableByOther.Merchant)
	components.showLearnableOtherOnAuction:SetChecked(config.Icon.ShowLearnableByOther.Auction)

	components.showSellableOnBags:SetChecked(config.Icon.ShowSellable.BankAndBags)
	components.showSellableOnGuildBank:SetChecked(config.Icon.ShowSellable.GuildBank)

	components.mogIconShowAnimation:SetChecked(config.Icon.EnableAnimation)
	components.mogIconShowSameLookDifferentItem:SetChecked(config.Icon.ShowLearnable.SameLookDifferentItem)
end

function configFrame:UpdatePendingValues()
	local config = pendingConfig

	config.Binding.Position = UIDropDownMenu_GetSelectedValue(components.bindingTextPosition)
	config.Binding.ShowStatus.BankAndBags = components.showBindingOnBags:GetChecked()
	config.Binding.ShowStatus.GuildBank = components.showBindingOnGuildBank:GetChecked()
	config.Binding.ShowStatus.Merchant = components.showBindingOnMerchant:GetChecked()
	config.Binding.ShowGearSets = components.showGearSets:GetChecked()
	config.Binding.ShowGearSetsAsIcon = components.showGearSetsAsIcon:GetChecked()
	config.Binding.ShowBoA = components.showBoA:GetChecked()
	config.Binding.ShowBoE = components.showBoE:GetChecked()
	
	config.Icon.Position = UIDropDownMenu_GetSelectedValue(components.mogIconPosition)

	config.Icon.ShowLearnable.BankAndBags = components.showLearnableOnBags:GetChecked()
	config.Icon.ShowLearnable.GuildBank = components.showLearnableOnGuildBank:GetChecked()
	config.Icon.ShowLearnable.Merchant = components.showLearnableOnMerchant:GetChecked()
	config.Icon.ShowLearnable.Auction = components.showLearnableOnAuction:GetChecked()

	config.Icon.ShowLearnableByOther.BankAndBags = components.showLearnableOtherOnBags:GetChecked()
	config.Icon.ShowLearnableByOther.GuildBank = components.showLearnableOtherOnGuildBank:GetChecked()
	config.Icon.ShowLearnableByOther.Merchant = components.showLearnableOtherOnMerchant:GetChecked()
	config.Icon.ShowLearnableByOther.Auction = components.showLearnableOtherOnAuction:GetChecked()

	config.Icon.ShowSellable.BankAndBags = components.showSellableOnBags:GetChecked()
	config.Icon.ShowSellable.GuildBank = components.showSellableOnGuildBank:GetChecked()

	config.Icon.EnableAnimation = components.mogIconShowAnimation:GetChecked()
	config.Icon.ShowLearnable.SameLookDifferentItem = components.mogIconShowSameLookDifferentItem:GetChecked()
end

function configFrame:OnConfigLoaded()
	self:ApplyConfig(CaerdonWardrobeConfig)

	self.name = "|cff00ff00[背包]|r幻化提示"
	self.okay = PropagateErrors(self.OnSave)
	self.cancel = PropagateErrors(self.OnCancel)
	self.default = PropagateErrors(self.OnResetToDefaults)
	self.refresh = PropagateErrors(self.OnRefresh)

	InterfaceOptions_AddCategory(self)
end

function configFrame:OnSave()
	self:UpdatePendingValues()
	CaerdonWardrobeConfig = CopyTable(pendingConfig)
end

function configFrame:OnCancel()
	self:ApplyConfig(CaerdonWardrobeConfig)
end

function configFrame:OnResetToDefaults()
	self:ApplyConfig(CaerdonWardrobe:GetDefaultConfig())
end

function configFrame:OnRefresh()
	self:RefreshComponents()
end

configFrame:InitializeConfig()

-----------------------------------------for Combuctor
local isBagUpdateRequested = false
local waitingOnBagUpdate = {}
local function OnBagUpdate_Coroutine()
    for bag, bagData in pairs(waitingOnBagUpdate) do
    	for slot, slotData in pairs(bagData) do
    		for itemID, itemData in pairs(slotData) do
				CaerdonWardrobe:ProcessItem(itemData.itemID, itemData.bag, itemData.slot, itemData.button, { showMogIcon = true, showBindStatus = true, showSellables = true } )
    		end
    	end

		waitingOnBagUpdate[bag] = nil
    end

	coroutine.yield()
	waitingOnBagUpdate = {}
end

local function ScheduleItemUpdate(itemID, bag, slot, button)
	local waitBag = waitingOnBagUpdate[tostring(bag)]
	if not waitBag then
		waitBag = {}
		waitingOnBagUpdate[tostring(bag)] = waitBag
	end

	local waitSlot = waitBag[tostring(slot)]
	if not waitSlot then
		waitSlot = {}
		waitBag[tostring(slot)] = waitSlot
	end

	waitSlot[tostring(itemID)] = { itemID = itemID, bag = bag, slot = slot, button = button }
	isBagUpdateRequested = true
end

local function OnUpdateSlot(self)
	-- if not self:IsCached() then
		local bag, slot = self:GetBag(), self:GetID()

		if bag ~= "vault" then
			local tab = GetCurrentGuildBankTab()
			if tab == bag then
				local itemLink = GetGuildBankItemLink(tab, slot)
				if itemLink then
					local itemID = tonumber(itemLink:match("item:(%d+)"))
					bag = "GuildBankFrame"
					slot = { tab = tab, index = slot }
					ScheduleItemUpdate(itemID, bag, slot, self)
				else
					CaerdonWardrobe:ResetButton(self)
				end
			else
				local itemID = GetContainerItemID(bag, slot)
				if itemID then

					if Combuctor:IsBank(bag) then
						bag = "BankFrame"
						slot = BankButtonIDToInvSlotID(slot)
					end

					ScheduleItemUpdate(itemID, bag, slot, self)
				else
					CaerdonWardrobe:ResetButton(self)
				end
			end
		end
	-- end
end

local function OnEvent(self, event, ...)
	local handler = self[event]
	if(handler) then
		handler(self, ...)
	end
end

local timeSinceLastBagUpdate = nil
local BAGUPDATE_INTERVAL = 0.3

local function OnUpdate(self, elapsed)
	if(self.bagUpdateCoroutine) then
		if coroutine.status(self.bagUpdateCoroutine) ~= "dead" then
			local ok, result = coroutine.resume(self.bagUpdateCoroutine)
			if not ok then
				error(result)
			end
		else
			self.bagUpdateCoroutine = nil
		end
		return
	end

	if isBagUpdateRequested then
		isBagUpdateRequested = false
		timeSinceLastBagUpdate = 0
	elseif timeSinceLastBagUpdate then
		timeSinceLastBagUpdate = timeSinceLastBagUpdate + elapsed
	end

	if( timeSinceLastBagUpdate ~= nil and (timeSinceLastBagUpdate > BAGUPDATE_INTERVAL) ) then
		timeSinceLastBagUpdate = nil
		self.bagUpdateCoroutine = coroutine.create(OnBagUpdate_Coroutine)
	end
end


local function HookBagnon()
	hooksecurefunc(Combuctor.ItemSlot, "Update", OnUpdateSlot)
end

local CaerdonWardrobeBagnonFrame = CreateFrame("FRAME")

if Combuctor then
	CaerdonWardrobeBagnonFrame:SetScript("OnEvent", OnEvent)
	CaerdonWardrobeBagnonFrame:SetScript("OnUpdate", OnUpdate)
	-- CaerdonWardrobeBagnonFrame:RegisterEvent("TRANSMOG_COLLECTION_ITEM_UPDATE")

	HookBagnon()
end

function CaerdonWardrobeBagnonFrame:ADDON_LOADED(name)
end

function CaerdonWardrobeBagnonFrame:TRANSMOG_COLLECTION_ITEM_UPDATE()
    if Combuctor.sets then
        Combuctor:UpdateFrames()
    end
end
