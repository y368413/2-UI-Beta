-- pet autoloot ?

local _, L = ...
local mediaFolder = "Interface\\AddOns\\".._.."\\media\\"
local LMB, RMB = CreateAtlasMarkup("NPE_LeftClick", 16, 16), CreateAtlasMarkup("NPE_RightClick", 16,16)

local LSM = LibStub('LibSharedMedia-3.0')

local max = max
local string_match = string.match
local math_floor = math.floor
local string_len = string.len
local string_gsub = string.gsub
local table_insert = table.insert
local table_sort = table.sort

local LootSlotHasItem = LootSlotHasItem
local CloseLoot = CloseLoot
local CreateFrame = CreateFrame
local CursorOnUpdate = CursorOnUpdate
local CursorUpdate = CursorUpdate
local GetCursorPosition = GetCursorPosition
local GetCVarBool = GetCVarBool
local GetLootSlotInfo = GetLootSlotInfo
local GetLootSlotLink = GetLootSlotLink
local GetLootSlotType = GetLootSlotType
local GetNumLootItems = GetNumLootItems
local HandleModifiedItemClick = HandleModifiedItemClick
local IsModifiedClick = IsModifiedClick
local LootSlot = LootSlot
local LootSlotHasItem = LootSlotHasItem
local ResetCursor = ResetCursor
local StaticPopup_Hide = StaticPopup_Hide
local MasterLooterFrame_Show = MasterLooterFrame_Show
local MasterLooterFrame_UpdatePlayers = MasterLooterFrame_UpdatePlayers
local GetContainerNumFreeSlots = GetContainerNumFreeSlots
local GetItemCount = GetItemCount
local GetItemInfo = GetItemInfo
local C_Timer_After = C_Timer.After

local ITEM_QUALITY_COLORS = ITEM_QUALITY_COLORS

local info_frame_scale	= 2
local info_frame_offset	= 6
local info_frame_width	= 120
local info_frame_height	= 25
	
lootFrameMixin = {}

local function MultiCheck(check, ...)
	for i = 1, select("#", ...) do
		if check == select(i, ...) then return true end  
	end  
	return false  
end
							
local function CreateMyText(self, font, fontsize, outline, layer, align, justifyH, shadow)
	local text = self:CreateFontString(nil, layer or "OVERLAY", nil, 7)
		text:SetFont(LSM:Fetch(LSM.MediaType.FONT, font) or STANDARD_TEXT_FONT, fontsize or 14, outline or "OUTLINE")
		text:SetPoint(align or "CENTER")
		text:SetJustifyH(justifyH or "CENTER")
		text:SetText(nil)
		text:SetHeight(text:GetStringHeight())
		if shadow then
			text:SetShadowColor(0, 0, 0, .6)
			text:SetShadowOffset(1, -1)
		end	
	return text
end	
	
local function SetMyBorderColor(frame, r, g, b, a)
	frame.top:SetVertexColor(r or 0, g or 0, b or 0, a or 1)
	frame.bottom:SetVertexColor(r or 0, g or 0, b or 0, a or 1)
	frame.left:SetVertexColor(r or 0, g or 0, b or 0, a or 1)
	frame.right:SetVertexColor(r or 0, g or 0, b or 0, a or 1)
end

local function CreateMyBackdrop(parent, pixelSize, r_br, g_br, b_br, a_br, bgTexture, r_bg, g_bg, b_bg, a_bg, shadow_offset, r_s, g_s, b_s, a_s)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetFrameLevel(parent:GetFrameLevel() - 1)
	frame:ClearAllPoints()
	frame:SetAllPoints(parent)
			
	frame.top = frame:CreateTexture(nil, "OVERLAY")
	frame.top:ClearAllPoints()
	PixelUtil.SetPoint(frame.top, "BOTTOMLEFT", frame, "TOPLEFT", 0, 0)
	PixelUtil.SetPoint(frame.top, "BOTTOMRIGHT", frame, "TOPRIGHT", 0, 0)
	PixelUtil.SetHeight(frame.top, pixelSize, 1)
	frame.top:SetTexture("Interface\\Buttons\\WHITE8x8")
	frame.top:Show()
	
	frame.bottom = frame:CreateTexture(nil, "OVERLAY")
	frame.bottom:ClearAllPoints()
	PixelUtil.SetPoint(frame.bottom, "TOPLEFT", frame, "BOTTOMLEFT", 0, 0)
	PixelUtil.SetPoint(frame.bottom, "TOPRIGHT", frame, "BOTTOMRIGHT", 0, 0)
	PixelUtil.SetHeight(frame.bottom, pixelSize, 1)
	frame.bottom:SetTexture("Interface\\Buttons\\WHITE8x8")
	frame.bottom:Show()
	
	frame.left = frame:CreateTexture(nil, "OVERLAY")
	frame.left:ClearAllPoints()
	PixelUtil.SetPoint(frame.left, "TOPRIGHT", frame, "TOPLEFT", 0, pixelSize)
	PixelUtil.SetPoint(frame.left, "BOTTOMRIGHT", frame, "BOTTOMLEFT", 0, -pixelSize)
	PixelUtil.SetWidth(frame.left, pixelSize, 1)
	frame.left:SetTexture("Interface\\Buttons\\WHITE8x8")
	frame.left:Show()
	
	frame.right = frame:CreateTexture(nil, "OVERLAY")
	frame.right:ClearAllPoints()
	PixelUtil.SetPoint(frame.right, "TOPLEFT", frame, "TOPRIGHT", 0, pixelSize)
	PixelUtil.SetPoint(frame.right, "BOTTOMLEFT", frame, "BOTTOMRIGHT", 0, -pixelSize)
	PixelUtil.SetWidth(frame.right, pixelSize, 1)
	frame.right:SetTexture("Interface\\Buttons\\WHITE8x8")
	frame.right:Show()
	
	SetMyBorderColor(frame, r_br, g_br, b_br, a_br)
	if bgTexture then
		frame.bg = frame:CreateTexture(nil, "BACKGROUND")
		frame.bg:ClearAllPoints()
		frame.bg:SetAllPoints(frame)
		frame.bg:SetTexture(bgTexture)
		frame.bg:SetVertexColor(r_bg / 3 or 0, g_bg / 3 or 0, b_bg / 3 or 0, a_bg or 0)
	end
		
	if shadow_offset then
		frame.shadow = CreateFrame("Frame", nil, frame, "BackdropTemplate")
		frame.shadow:SetFrameLevel(parent:GetFrameLevel() - 1)
		frame.shadow:ClearAllPoints()
		frame.shadow:SetPoint("TOPLEFT", frame, "TOPLEFT", -shadow_offset, shadow_offset)
		frame.shadow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", shadow_offset, -shadow_offset)
		frame.shadow:SetBackdrop({bgFile = nil, edgeFile = mediaFolder.."glowTex", edgeSize = shadow_offset, tile = false, tileSize = 0, insets = 1})
		frame.shadow:SetBackdropBorderColor(r_s, g_s, b_s, a_s)
		frame.shadow:Hide()
	end
	
	return frame
end

local function SetFrameScale(frame, width, height, from, to)
	if (frame.currentScale ~= to) then
		frame:SetSize(width * from, height * from)
		if (frame.scale:IsPlaying()) then
			frame.scale:Stop()
		end
		frame.scale.width:SetChange(width * to)
		frame.scale.height:SetChange(height * to)
		frame.scale:Play()
		frame.currentScale = to
	end
end

local function ResetInfoFrameFunction(framePool, frame)
	if frame.AnimOut:IsPlaying() then
		frame.AnimOut:Stop()
	end
	if frame.AnimIn:IsPlaying() then
		frame.AnimIn:Stop()
	end
	if frame.AnimDown:IsPlaying() then
		frame.AnimDown:Stop()
	end
	frame:SetAlpha(0)
	frame:Hide()
	frame:SetParent(aLootInfoFrameBase)
	frame:ClearAllPoints()
	frame:SetPoint("TOP", aLootInfoFrameBase, "TOP", 0, 0)
	frame.AnimIn.Alpha:SetDuration(L.config.info_frame_speed)
	frame.AnimDown.Translation:SetDuration(L.config.info_frame_speed)
	frame.createdAt = nil
	frame.guid = nil
	frame.expired = false
end

local function AddFrameToPool(icon, text, fast)
	local lastFrame = aLootInfoFrameBase.infoFrameActiveFrames.last
	if lastFrame ~= nil and lastFrame.AnimIn:IsPlaying() then
		C_Timer_After(lastFrame.AnimIn:GetDuration(), function()
			if lastFrame ~= nil and lastFrame.guid == aLootInfoFrameBase.guid then
				AddFrameToPool(icon, text, true)
			end
		end)
		return
	end
		
	local newFrame = aLootInfoFrameBase.infoFrameActiveFrames:Acquire()
		
	newFrame.shadow = CreateFrame("Frame", nil, newFrame, "BackdropTemplate")
	newFrame.shadow:SetFrameLevel(newFrame:GetFrameLevel())
	newFrame.shadow:ClearAllPoints()
	newFrame.shadow:SetPoint("TOPLEFT", newFrame, "TOPLEFT", -info_frame_offset, info_frame_offset)
	newFrame.shadow:SetPoint("BOTTOMRIGHT", newFrame, "BOTTOMRIGHT", info_frame_offset, -info_frame_offset)
	newFrame.shadow:SetBackdrop({bgFile = mediaFolder..'Backdrop_Talkbox.blp', edgeFile = mediaFolder..'Edge_Talkbox_BG.blp', edgeSize = info_frame_offset, insets = { left = info_frame_offset, right = info_frame_offset, top = info_frame_offset, bottom = info_frame_offset }})
	newFrame.shadow:SetBackdropBorderColor(0, 0, 0, 1)
	newFrame.shadow:Show()
	
	newFrame.icon = newFrame:CreateTexture(nil, "OVERLAY")
	newFrame.icon:SetPoint("LEFT", newFrame, "LEFT", 0, 0)
	newFrame.icon:SetSize(info_frame_height - 2, info_frame_height - 2)
	newFrame.icon:SetTexCoord(.08, .92, 0.08, 0.92)
	newFrame.icon:SetTexture(icon)
	newFrame.icon:Show()
	
	newFrame.desc = CreateMyText(newFrame, L.config.info_font, L.config.info_fontsize, L.config.info_font_flag, "OVERLAY", "CENTER", "CENTER", true)
	newFrame.desc:SetPoint("RIGHT", newFrame, "RIGHT", 0, 0)
	newFrame.desc:SetText(text)
	newFrame.desc:Show()

	newFrame.currentScale = info_frame_scale
	newFrame.scale = CreateAnimationGroup(newFrame)
	newFrame.scale.width = newFrame.scale:CreateAnimation("Width")
	newFrame.scale.width:SetDuration(L.config.info_frame_speed)
	newFrame.scale.height = newFrame.scale:CreateAnimation("Height")
	newFrame.scale.height:SetDuration(L.config.info_frame_speed)
		
	newFrame:EnableMouse(false)
	newFrame.createdAt = GetTime()
	newFrame.guid = aLootInfoFrameBase.guid
	
	-- AnimeIn
	if fast then
		newFrame.AnimIn.Alpha:SetDuration(L.config.info_frame_speed / 2)
		newFrame.scale.width:SetDuration(L.config.info_frame_speed/2)
		newFrame.scale.height:SetDuration(L.config.info_frame_speed/2)
	end
	
	newFrame:SetPoint("BOTTOMLEFT", aLootInfoFrameBase, "BOTTOMLEFT", 0, 0)	
	SetFrameScale(newFrame, newFrame.desc:GetStringWidth() + info_frame_height + 2, info_frame_height, info_frame_scale, 1)
	newFrame.AnimIn.Alpha:SetFromAlpha(0)
	newFrame.AnimIn.Alpha:SetToAlpha(L.config.info_frame_alpha)
	newFrame.AnimIn:Play()
	
	newFrame.AnimIn:SetScript("OnFinished", function(self)
		self:GetParent():SetAlpha(L.config.info_frame_alpha)
	end)
	
	if newFrame.AnimIn:IsPlaying() then
		newFrame.AnimIn:GetParent():Show()
	end
	
	newFrame.AnimOut.Alpha:SetFromAlpha(L.config.info_frame_alpha)
	newFrame.AnimOut.Alpha:SetToAlpha(0)	
	-- Anime
	if lastFrame ~= nil and lastFrame ~= newFrame and not lastFrame.AnimOut:IsPlaying() then
		if fast then
			lastFrame.AnimDown.Translation:SetDuration(L.config.info_frame_speed / 2)
		end
		lastFrame.AnimDown.Translation:SetOffset(0, - info_frame_height - (info_frame_offset + 2))
		lastFrame.AnimDown:Play()
		lastFrame.AnimDown:SetScript("OnFinished", function(self)
			self:GetParent():ClearAllPoints()
			self:GetParent():SetParent(newFrame)
			self:GetParent():SetPoint("BOTTOMLEFT", newFrame, "BOTTOMLEFT", 0, - info_frame_height - (info_frame_offset + 2))
			self:GetParent():SetAlpha(1)
		end)
	end

	aLootInfoFrameBase.infoFrameActiveFrames.last = newFrame
end

local function StartOnUpdateScript()
	if not aLootInfoFrameBase.infoFrameActiveFrames then
		aLootInfoFrameBase.infoFrameActiveFrames = CreateFramePool("Button", aLootInfoFrameBase, "aLootFrameAnimationTemplate", ResetInfoFrameFunction)
		aLootInfoFrameBase.infoFrameActiveFrames.last = nil
	end
	
	-- uloz poziciu ak sa prave nastavovala
	if L.config.unlock_infoFrame then
		L.config.unlock_infoFrame = false
		aLootInfoFrameBase:EnableMouse(false)
		aLootInfoFrameBase.value:Hide()
		aLootInfoFrameBase.border:Hide()
		aLootInfoFrameBase:Hide()
		LibStub("AceConfigRegistry-3.0"):NotifyChange("aLoot")
	end
	
	if aLootInfoFrameBase:GetScript("OnUpdate") == nil then
		aLootInfoFrameBase:Show()
		aLootInfoFrameBase:SetScript("OnUpdate", function(self, elapsed)
			if self.infoFrameActiveFrames:GetNumActive() > 0 then
				local sortedFrames = {}
				for frame in self.infoFrameActiveFrames:EnumerateActive() do
					table_insert(sortedFrames, frame)
				end
				table_sort(sortedFrames, function(a, b) return a.createdAt < b.createdAt end)
				
				for _, frame in ipairs(sortedFrames) do
					if GetTime() >= (frame.createdAt + L.config.info_frame_duration) and not (frame.AnimOut:IsPlaying() or frame.expired) then
						frame.AnimOut:Play()
						frame.AnimOut:SetScript("OnFinished", function(self)
							self:GetParent().expired = true
						end)	
					end
					
					if self.infoFrameActiveFrames:GetNumActive() > L.config.info_frame_maxcount or frame.expired or frame.guid ~= self.guid then
						frame.shadow:Hide()
						frame.icon:Hide()
						frame.desc:SetText(nil)
						frame.desc:Hide()
		
						self.infoFrameActiveFrames:Release(frame)
					end
				end
			else
				aLootInfoFrameBase.infoFrameActiveFrames:ReleaseAll()
				aLootInfoFrameBase.infoFrameActiveFrames.last = nil
				aLootInfoFrameBase:Hide()
				aLootInfoFrameBase:SetScript("OnUpdate", nil)
			end
		end)
	end
end

local function ShowFlashFrame(frame, icon, lootName)
	if frame.Anime:IsPlaying() then
		frame.Anime:Stop()
	end
	
	frame:EnableMouse(false)
	frame.value:SetText(lootName)
	frame.icon:SetTexture(icon or 939375)
	frame:Show()
	frame.Anime:Play()
end

local function OnEnter(self)
	if L.config.toolTip then
		local slot = self:GetID()
		local slotType = GetLootSlotType(slot) -- LOOT_SLOT_NONE, LOOT_SLOT_ITEM, LOOT_SLOT_MONEY, LOOT_SLOT_CURRENCY 
		
		if ( slotType == LOOT_SLOT_CURRENCY ) then
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 10, -10)
			GameTooltip:SetLootCurrency(slot)
			CursorUpdate(self)
		else
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 10, -10)
			GameTooltip:SetLootItem(slot)
			CursorUpdate(self)
		end
	end
	
	if L.config.name_show and L.config.name_show_onlyMO then
		self.nameTexture:Show()
		self.name:Show()
	end
	if L.config.mouseover_scale > 1 then
		SetFrameScale(self, L.config.iconSize, L.config.iconSize, 1, L.config.mouseover_scale)
	end
	if L.config.mouseover_color then
		self.border.shadow:SetBackdropBorderColor(unpack(L.config.mouseover_color_value))
	end
end

local function OnLeave(self)
	if self.quality and (self.quality > 1) then
		if self.quality == 9 then
			self.border.shadow:SetBackdropBorderColor(1, 0, 0)
		else
			local color = ITEM_QUALITY_COLORS[self.quality]
			self.border.shadow:SetBackdropBorderColor(color.r, color.g, color.b)
		end
	else
		self.border.shadow:SetBackdropBorderColor(0, 0, 0)
	end
	if L.config.toolTip then
		GameTooltip:Hide()
	end
	
	if L.config.name_show_onlyMO then
		self.nameTexture:Hide()
		self.name:Hide()
	end
		
	if L.config.mouseover_scale > 1 then
		SetFrameScale(self, L.config.iconSize, L.config.iconSize, L.config.mouseover_scale, 1)
	end
	
	ResetCursor()
end

local function OnClick(self, button)
	if button == "RightButton" then
		OpenAllBags()
	else
		if IsModifiedClick() then
			HandleModifiedItemClick(GetLootSlotLink(self:GetID()))
		else
			StaticPopup_Hide('CONFIRM_LOOT_DISTRIBUTION')
			LootSlot(self:GetID())
		end
	end
end

local function OnShow(self)
	if GameTooltip:IsOwned(self) then
		GameTooltip:SetOwner(self,"ANCHOR_BOTTOMRIGHT", 10, -10)
		GameTooltip:SetLootItem(self:GetID())
		CursorOnUpdate(self)
	end
end

local function OnLootClosed(self)
	StaticPopup_Hide('LOOT_BIND')
	self:Hide()
	-- pre istotu Hide na vsetky sloty
	for _, frame in pairs(self.slots) do
		frame:Hide()
		frame = nil
	end
end

local function OnLootReady(autoloot)
	if not myLootFrameBase.lootReadyIsOpened then
		local numLootItems = GetNumLootItems()
		
		myLootFrameBase.lootReadyIsOpened = true
				
		if numLootItems > 0 then
			for i = numLootItems, 1, -1 do
				LootSlot(i)
			end

			if L.config.speedLoot_text then
				StartOnUpdateScript()
				AddFrameToPool(133784, "|cff00bbffLooted|r "..numLootItems.." |cff00bbffitems|r")
			end
		end
	end
end

-- uprav zarovnanie pri zmene slot itemov
local function anchorSlots(self)
	local shownSlots, firstSlot, lastSlot = 0
	
	for i = 1, #self.slots do
		self.slots[i]:ClearAllPoints()
		if self.slots[i]:IsShown() then
			shownSlots = shownSlots + 1
			if not firstSlot then
				firstSlot = i
			end
			if shownSlots > 1 then
				if L.config.lootFrame_align == "LEFT" then
					self.slots[i]:SetPoint("LEFT", lastSlot, "RIGHT", L.config.iconSpace, 0)
				elseif L.config.lootFrame_align == "RIGHT" then
					self.slots[i]:SetPoint("RIGHT", lastSlot, "LEFT", - L.config.iconSpace, 0)
				elseif L.config.lootFrame_align == "TOP" then
					self.slots[i]:SetPoint("TOP", lastSlot, "BOTTOM", 0, - L.config.iconSpace)
				elseif L.config.lootFrame_align == "BOTTOM" then
					self.slots[i]:SetPoint("BOTTOM", lastSlot, "TOP", 0, L.config.iconSpace)
				else
					self.slots[i]:SetPoint("LEFT", lastSlot, "RIGHT", L.config.iconSpace, 0)
				end
			end
			lastSlot = self.slots[i]
		end
	end
	
	if shownSlots > 0 then
		if C_CVar.GetCVarBool("lootUnderMouse") or L.config.lootFrame_align ~= "CENTER" then
			self.slots[firstSlot]:SetPoint(L.config.lootFrame_align, self, L.config.lootFrame_align, 0, 0)
		else
			self.slots[firstSlot]:SetPoint("CENTER", self, "CENTER", -(((L.config.iconSize + L.config.iconSpace) * (shownSlots - 1)) / 2), 0)
		end
	end
end

local function createSlot(self, id)
	local frame = CreateFrame("Button", 'myLootFrameBaseSlot'..id, self, "aLootFrameAnimations")
		frame:SetFrameLevel(self:GetFrameLevel() + 1)
		frame:SetPoint("CENTER", 0, 0)
		frame:SetSize(L.config.iconSize, L.config.iconSize)
		frame:SetID(id)
	
		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		frame:SetScript("OnEnter", OnEnter)
		frame:SetScript("OnLeave", OnLeave)
		frame:SetScript("OnClick", OnClick)
		frame:SetScript("OnShow", OnShow)
	
		frame.border = CreateMyBackdrop(frame, 1, 0, 0, 0, 1,"Interface\\Buttons\\WHITE8x8", 0, 0, 0, .7, 5, 0, 0, 0, 0.6)
		frame.border.shadow:Show()
				
		--frame.currentScale = 1
		frame.scale = CreateAnimationGroup(frame)
		frame.scale.width = frame.scale:CreateAnimation("Width")
		frame.scale.width:SetDuration(.3)
		frame.scale.height = frame.scale:CreateAnimation("Height")
		frame.scale.height:SetDuration(.3)
	
	local iconFrame = CreateFrame("Frame", nil, frame)
		--iconFrame:SetSize(L.config.iconSize, L.config.iconSize)
		iconFrame:SetAllPoints()
		frame.iconFrame = iconFrame
		
		frame.nameTexture = frame.iconFrame:CreateTexture(nil, "OVERLAY", nil, 6)
		frame.nameTexture:SetTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, L.config.name_texture))
		frame.nameTexture:Hide()
		
		frame.name = CreateMyText(frame.iconFrame, L.config.name_font, L.config.name_fontsize, L.config.name_font_flag, "OVERLAY", "CENTER", "CENTER", false)
		frame.name:SetText(nil)
		frame.name:Hide()
		
		frame.icon = iconFrame:CreateTexture(nil, "OVERLAY")
		frame.icon:SetAlpha(.8)
		frame.icon:SetTexCoord(.07, .93, .07, .93)
		frame.icon:SetAllPoints()
	
		frame.count = CreateMyText(iconFrame, L.config.name_font, 16, "OUTLINE", "OVERLAY", "CENTER", "RIGHT", false)
		frame.count:SetPoint("BOTTOMRIGHT", iconFrame, -1, 2)
		frame.count:SetText(nil)
		
		frame.questTexture = iconFrame:CreateTexture(nil, 'OVERLAY')
		frame.questTexture:SetPoint("TOPRIGHT", iconFrame, "TOPRIGHT", 4, 0)
		frame.questTexture:SetSize(16, 24)
		frame.questTexture:SetAtlas("questlegendary")
		frame.questTexture:Hide()
	
	self.slots[id] = frame
	return frame
end

local function CheckFreeSpace(lootLink, lootQuantity)
	local itemFamily = GetItemFamily(lootLink)
	for bagID = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		local numberOfFreeSlots, bagType = GetContainerNumFreeSlots(bagID)
		if (not bagType or bagType == 0) or (itemFamily and bit.band(itemFamily, bagType) > 0) then
			if numberOfFreeSlots > 0 then
				return true, numberOfFreeSlots
			end
		end
	end

	local itemCount = GetItemCount(lootLink)
	if itemCount > 0 then
		local itemStackCount = select(8, GetItemInfo(lootLink))
		if itemStackCount > 1 then
			local remainingSpace = (itemStackCount - itemCount) % itemStackCount
			--print(itemCount, remainingSpace)
			if remainingSpace >= lootQuantity then
				return true, numberOfFreeSlots
			end
		end
	end

	return false, 0
end

local function UpdateSlot(self, slotIndex)
	if LootSlotHasItem(slotIndex) then
		--[[
		lootQuality = 0 Poor, 1 Common, 2 Uncommon, 3 Rare, 4 Epic, 5 Legendary, 6 Artifact
		itemLink = GetLootSlotLink(slotIndex)
		itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemID or "itemString" or "itemName" or "itemLink")
		lootName, lootIcon, lootQuantity, lootQuality = CurrencyContainerUtil.GetCurrencyContainerInfo(currencyID, lootQuantity, lootName, lootIcon, lootQuality)
		]]--
		local isFreeSpaceInBags, numberOfFreeSlots
		local slot = self.slots[slotIndex] or createSlot(self, slotIndex)
		local lootIcon, lootName, lootQuantity, currencyID, lootQuality, locked, isQuestItem, questID, isActive = GetLootSlotInfo(slotIndex)
		local slotType = GetLootSlotType(slotIndex)	-- 0: LOOT_SLOT_NONE, 1: LOOT_SLOT_ITEM, 2 LOOT_SLOT_MONEY, 3 LOOT_SLOT_CURRENCY
		local lootLink = GetLootSlotLink(slotIndex)
				
		slot.currentScale = 1
		
		-- goldy a currency sa nelootuje do baglu preto automaticky je miesto
		--print("---------------------------------------")
		if slotType == 2 or slotType == 3 then
			isFreeSpaceInBags = true
		else
			isFreeSpaceInBags, numberOfFreeSlots = CheckFreeSpace(lootLink, lootQuantity)
		end
		
		--print(isFreeSpaceInBags, numberOfFreeSlots)
				
		if isFreeSpaceInBags and
			((C_CVar.GetCVarBool("autoLootDefault") and not IsModifiedClick("AUTOLOOTTOGGLE")) 
			or (L.config.autoLoot["gold"] and slotType == 2) 
			or (L.config.autoLoot["currency"] and slotType == 3)
			or (L.config.autoLoot["quest"] and (isQuestItem or questID))
			or (L.config.autoLoot["poor"] and lootQuality == 0)
			or (L.config.autoLoot["common"] and lootQuality == 1)
			or (L.config.autoLoot["uncommon"] and lootQuality == 2)
			or (L.config.autoLoot["rare"] and lootQuality == 3)
			or (L.config.autoLoot["epic"] and lootQuality == 4)
			or (L.config.autoLoot["legendary"] and lootQuality == 5)) then
				LootSlot(slotIndex)
				local text = ''
				if lootQuantity and lootQuantity > 1 then
					text = "|cffFFFFFF"..lootQuantity.." x |r"
				end
				if slotType == 2 then
					lootName = string_gsub(lootName, "\n", " ")
				end
				
				slot.lootNameInPool = text .. ITEM_QUALITY_COLORS[lootQuality].hex .. lootName  .."|r"
				slot.lootIconInPool = lootIcon
				
				AddFrameToPool(slot.lootIconInPool, slot.lootNameInPool)
				--print(slot.lootNameInPool)
				if (L.config.flash["user"] and L.ItemsTable[lootName] and L.ItemsTable[lootName].enable)
					or (L.config.flash["quest"] and (isQuestItem or questID))
					or (L.config.flash["legendary"] and lootQuality == 5) then
					ShowFlashFrame(aLootFlashFrameBase, lootIcon, text .. ITEM_QUALITY_COLORS[lootQuality].hex .. lootName  .."|r")
					PlaySoundFile(LSM:Fetch(LSM.MediaType.SOUND, L.config.flash_sound), "Master")
				end
			return
		else
			if not aLootFlashFrameBase.Anime:IsPlaying() then
				ShowFlashFrame(aLootFlashFrameBase, nil, "|cffff0000" .. ERR_INV_FULL  .."|r")
				PlaySoundFile(LSM:Fetch(LSM.MediaType.SOUND, L.config.flash_sound), "Master")
			end
		end
		
		if lootIcon then
			myLootFrameBase:Show()
			
			if slot.FadeIn:IsPlaying() then
				slot.FadeIn:Stop()
			end
			
			local color = ITEM_QUALITY_COLORS[lootQuality]
						
			-- create name			
			slot.lootName = lootName
			if L.config.name_short and (string_len(lootName) > L.config.name_short_lenght) then
				if L.config.name_format == 0 then
					lootName =  string_gsub(lootName, "%s?(.[\128-\191]*)%S+%s", "%1. ")
				elseif L.config.name_format == 1 then
					lootName = string_gsub(lootName, "%s?(.[\128-\191]*)%S+%s", "%1.")
				elseif L.config.name_format == 2 then
					lootName =  string_gsub(lootName, "%s(%a)%a*", " %1.")
				elseif L.config.name_format == 3 then
					lootName =  string_gsub(lootName, "%s(%a)%a*", "%1.")
				elseif L.config.name_format == 4 then
					for n in string_gmatch(lootName, '%S+') do
						lootName = n
						break
					end
				elseif L.config.name_format == 5 then
					for n in string_gmatch(lootName, '%S+') do
						lootName = n
					end
				end
			end
			
			slot.name:SetText(lootName)
			slot.nameTexture:ClearAllPoints()
			slot.nameTexture:SetPoint(L.config.name_font_point, slot.iconFrame, L.config.name_font_relativePoint, L.config.name_font_posun_X, L.config.name_font_posun_Y)
			slot.nameTexture:SetSize(slot.name:GetStringWidth() + 10, L.config.name_fontsize + 4)
			slot.name:SetAllPoints(slot.nameTexture)
			
			if L.config.name_texture_color then
				slot.nameTexture:SetVertexColor(unpack(L.config.name_texture_color_value))		
			else
				slot.nameTexture:SetVertexColor(color.r, color.g, color.b, .3)
			end
					
			if L.config.name_color then
				slot.name:SetTextColor(unpack(L.config.name_font_color))
			else
				slot.name:SetTextColor(color.r, color.g, color.b)
			end
			
			if L.config.name_show and not L.config.name_show_onlyMO then
				slot.nameTexture:Show()
				slot.name:Show()
			else
				slot.nameTexture:Hide()
				slot.name:Hide()
			end	
					
			if lootQuantity and (lootQuantity > 1) then
				slot.count:SetText(lootQuantity)
				slot.count:Show()
			elseif slotType == 2 then
				local coins = string_match(slot.lootName, "(%d+)")
				coins = tonumber(coins)
				if coins and (coins > 0) then
					slot.count:SetText(coins)
					slot.count:Show()
				end
			else
				slot.count:Hide()
			end
							
			slot.quality = lootQuality
			if locked then
				slot.quality = 9
				slot.border.shadow:SetBackdropBorderColor(1, 0, 0)
			elseif lootQuality and (lootQuality > 1) then
				slot.border.shadow:SetBackdropBorderColor(color.r, color.g, color.b)
			else
				slot.border.shadow:SetBackdropBorderColor(0, 0, 0)
			end
			
			-- menim tu quality koli mouseover
			slot.icon:SetTexture(lootIcon)
			if questID and not isActive then
				slot.quality = 5
				slot.border.shadow:SetBackdropBorderColor(1, .5, 0)
				slot.questTexture:Show()
			elseif questID or isQuestItem then
				slot.quality = 5
				slot.border.shadow:SetBackdropBorderColor(1, .5, 0)
				slot.questTexture:Show()
			else
				slot.questTexture:Hide()
			end
					
			slot:Enable()	
		else
			slot.icon:SetTexture("Interface\\Icons\\INV_Misc_Herb_AncientLichen")
			slot.count:Hide()
			slot.border.shadow:Hide()
			--a pokus o loot ?
			slot:Disable()	
		end
		
		slot:Show()
		slot.border:Show()
		slot.FadeIn:Play()
		
		--slot.AnimIn:SetScript("OnFinished", function(self)
		--	self:GetParent().border:Show()
		--end)
	elseif self.slots[slotIndex] then
		self.slots[slotIndex]:Hide()
	end
end

local function OnLootOpened(self, ...)
	local autoLoot, isFromItem = ...
		
	StartOnUpdateScript()
	
	self.lootReadyIsOpened = true
	self.numLootItems = 0
			
--	self:Show()
	if ( isFromItem ) then
		PlaySound(SOUNDKIT.UI_CONTAINER_ITEM_OPEN)
	end
	
	-- ak je zapnuty loot na mieste kurzora
	if C_CVar.GetCVarBool("lootUnderMouse") then
		local x, y = GetCursorPosition()
		x = x / self:GetEffectiveScale()
		y = y / self:GetEffectiveScale()
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", nil, "BOTTOMLEFT", x - (L.config.iconSize / 2), y + (L.config.iconSize / 2))
		self:GetCenter()
		self:Raise()	
	end
	
	self.numLootItems = GetNumLootItems()
	
	if self.numLootItems > 0 then
		for i = 1, self.numLootItems do
			UpdateSlot(self, i)
			--SetFrameScale(self.slots[i], L.config.iconSize, L.config.iconSize, 1.4, 1)
		end
	end
	
	anchorSlots(self)
end

local function OnLootSlotCleared(self, ...)
	local slot = ...
--[[	if not L.config.speedLoot and self.slots[slot].lootIconInPool then
		AddFrameToPool(self.slots[slot].lootIconInPool, self.slots[slot].lootNameInPool)
		self.slots[slot].lootIconInPool = nil
		self.slots[slot].lootNameInPool = nil
	end
]]--	
	if self:IsShown() and self.slots[slot] and self.slots[slot]:IsShown() then
		self.slots[slot]:Hide()
		--self.slots[slot].currentScale = 1.4
		anchorSlots(self)
	end
end

function OnShowLootFrameBase(self)
	local numLootItems = GetNumLootItems()
	if( numLootItems == 0 ) then
		PlaySound(SOUNDKIT.LOOT_WINDOW_OPEN_EMPTY)
	elseif( IsFishingLoot() ) then
		PlaySound(SOUNDKIT.FISHING_REEL_IN)
	else
		PlaySound(SOUNDKIT.SOULBINDS_OPEN_UI)
	end
end


function OnHideLootFrameBase(self)
	CloseLoot()
	--StaticPopup_Hide('CONFIRM_LOOT_DISTRIBUTION')
	--MasterLooterFrame:Hide()	
end

local function OnAddonLoaded(self, ...)
	local name = ...
	if name == _ then
		if not _G["aLootCFG"] then _G["aLootCFG"] = L.defaults end
		L.config = _G["aLootCFG"]

		for key, value in pairs(L.defaults) do
			if L.config[key] == nil then
				L.config[key] = value
			end
		end
		
		L.ItemsTable = ItemsTable or {}
		ItemsTable = L.ItemsTable
		
		LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable(_, L.options)
		L.basic_page = LibStub('AceConfigDialog-3.0'):AddToBlizOptions(_, "aLoot", nil, "basic_page")
		
		-- lootFrame				
		L.config.unlock_lootFrame = false
		local lootFrameBase = CreateFrame("Frame", "myLootFrameBase", UIParent)
		lootFrameBase:SetFrameStrata(_G.LootFrame:GetFrameStrata())
		lootFrameBase:SetFrameLevel(_G.LootFrame:GetFrameLevel())
		lootFrameBase:SetPoint("TOP", UIParent, "TOP", 0, 0)
		lootFrameBase:SetSize(L.config.iconSize, L.config.iconSize)
		lootFrameBase:SetScale(1)
		lootFrameBase:Hide()
		lootFrameBase.slots = {}
		
		lootFrameBase.border = CreateMyBackdrop(lootFrameBase, 1, 0, 0, 0, 1,"Interface\\Buttons\\WHITE8x8", 0, 0, 0, .7, 4, 0, 0, 0, 0.6)
		lootFrameBase.border:Hide()
		
		lootFrameBase.value = CreateMyText(lootFrameBase, nil, 11, "OUTLINE", "OVERLAY", "CENTER", "CENTER", false)
		lootFrameBase.value:SetPoint("CENTER", lootFrameBase, "CENTER", 0, 0)
		lootFrameBase.value:SetText(LMB.."move\n"..RMB.."close")
		lootFrameBase.value:Hide()
		
		lootFrameBase:SetMovable(true)
		lootFrameBase:SetClampedToScreen(true)
		lootFrameBase:SetScript("OnDragStart", function(self) self:StartMoving() end)
		lootFrameBase:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
		lootFrameBase:RegisterForDrag("LeftButton")
		
		lootFrameBase:EnableMouse(false)
		lootFrameBase:SetScript("OnMouseDown", function(self, button)
			if button == "RightButton" then --and not InCombatLockdown() then
				print("|cffFF0000LOCK|r and save lootFrame\n")
				self:EnableMouse(false)
				self.value:Hide()
				self.border:Hide()
				self:Hide()
				L.config.unlock_lootFrame = false
				LibStub("AceConfigRegistry-3.0"):NotifyChange("aLoot")
			end
		end)
		
		lootFrameBase:SetScript("OnShow", OnShowLootFrameBase)
		lootFrameBase:SetScript("OnHide", OnHideLootFrameBase)
		
		_G.LootFrame:UnregisterAllEvents()
			
		table_insert(_G.UISpecialFrames, "lootFrameBase")
		hooksecurefunc(_G.MasterLooterFrame, 'Hide', _G.MasterLooterFrame.ClearAllPoints)
		
		-- infoFrame
		L.config.unlock_infoFrame = false
		local infoFrameBase = CreateFrame("Frame", "aLootInfoFrameBase", UIParent)
		infoFrameBase:SetSize(info_frame_width, info_frame_height)
		infoFrameBase:SetPoint("CENTER", UIParent, "CENTER", 400, 0)
		infoFrameBase:Hide()
		
		infoFrameBase.border = CreateMyBackdrop(infoFrameBase, 1, 0, 0, 0, 1,"Interface\\Buttons\\WHITE8x8", 0, 0, 0, .7, 4, 0, 0, 0, 0.6)
		infoFrameBase.border:Hide()
				
		infoFrameBase.value = CreateMyText(infoFrameBase, nil, 11, "OUTLINE", "OVERLAY", "CENTER", "CENTER", false)
		infoFrameBase.value:SetPoint("CENTER", infoFrameBase, "CENTER", 0, 0)
		infoFrameBase.value:SetText(LMB.."move "..RMB.."close")
		infoFrameBase.value:Hide()
		
		infoFrameBase:SetMovable(true)
		infoFrameBase:SetClampedToScreen(true)
		infoFrameBase:SetScript("OnDragStart", function(self) self:StartMoving() end)
		infoFrameBase:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
		infoFrameBase:RegisterForDrag("LeftButton")
		
		infoFrameBase:EnableMouse(false)
		infoFrameBase:SetScript("OnMouseDown", function(self, button)
			if button == "RightButton" then --and not InCombatLockdown() then
				print("|cffFF0000LOCK|r and save infoFrame\n")
				self:EnableMouse(false)
				self.value:Hide()
				self.border:Hide()
				self:Hide()
				L.config.unlock_infoFrame = false
				LibStub("AceConfigRegistry-3.0"):NotifyChange("aLoot")
			end
		end)
		
		-- flashFrame
		L.config.unlock_flashFrame = false
		local flashFrameBase = CreateFrame("Frame", "aLootFlashFrameBase", UIParent, "aLootFrameAnimations")
		flashFrameBase:SetSize(350, 30)
		flashFrameBase:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		flashFrameBase:Hide()
		
		local flash_offset = 14
		flashFrameBase.shadow = CreateFrame("Frame", nil, flashFrameBase, "BackdropTemplate")
		flashFrameBase.shadow:SetFrameLevel(flashFrameBase:GetFrameLevel())
		flashFrameBase.shadow:ClearAllPoints()
		flashFrameBase.shadow:SetPoint("TOPLEFT", flashFrameBase, "TOPLEFT", -flash_offset, flash_offset)
		flashFrameBase.shadow:SetPoint("BOTTOMRIGHT", flashFrameBase, "BOTTOMRIGHT", flash_offset, -flash_offset)
		flashFrameBase.shadow:SetBackdrop({bgFile = mediaFolder..'Backdrop_Talkbox.blp', edgeFile = mediaFolder..'Edge_Talkbox_BG.blp', edgeSize = flash_offset, insets = { left = flash_offset, right = flash_offset, top = flash_offset, bottom = flash_offset }})
		flashFrameBase.shadow:SetBackdropBorderColor(0, 0, 0, 1)
		
		flashFrameBase.icon = flashFrameBase:CreateTexture(nil, "OVERLAY")
		flashFrameBase.icon:SetPoint("LEFT", flashFrameBase, "LEFT", 15, 0)
		flashFrameBase.icon:SetSize(50, 50)
		flashFrameBase.icon:SetTexCoord(.08, .92, 0.08, 0.92)
		
		local icon_offset = 8
		flashFrameBase.shadow = CreateFrame("Frame", nil, flashFrameBase, "BackdropTemplate")
		flashFrameBase.shadow:SetFrameLevel(flashFrameBase:GetFrameLevel())
		flashFrameBase.shadow:ClearAllPoints()
		flashFrameBase.shadow:SetPoint("TOPLEFT", flashFrameBase.icon, "TOPLEFT", -icon_offset, icon_offset)
		flashFrameBase.shadow:SetPoint("BOTTOMRIGHT", flashFrameBase.icon, "BOTTOMRIGHT", icon_offset, -icon_offset)
		flashFrameBase.shadow:SetBackdrop({bgFile = mediaFolder..'Backdrop_Talkbox.blp', edgeFile = mediaFolder..'Edge_Talkbox_BG.blp', edgeSize = icon_offset, insets = { left = icon_offset, right = icon_offset, top = icon_offset, bottom = icon_offset }})
		flashFrameBase.shadow:SetBackdropBorderColor(0, 0, 0, 1)
		
		flashFrameBase.value = CreateMyText(flashFrameBase, nil, 18, "OUTLINE", "OVERLAY", "CENTER", "CENTER", false)
		flashFrameBase.value:SetPoint("LEFT", flashFrameBase.icon, "RIGHT", 15, 0)
		flashFrameBase.value:SetText(LMB.."move "..RMB.."close")
				
		flashFrameBase:SetMovable(true)
		flashFrameBase:SetClampedToScreen(true)
		flashFrameBase:SetScript("OnDragStart", function(self) self:StartMoving() end)
		flashFrameBase:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
		flashFrameBase:RegisterForDrag("LeftButton")
		
		flashFrameBase:EnableMouse(false)
		flashFrameBase:SetScript("OnMouseDown", function(self, button)
			if button == "RightButton" then --and not InCombatLockdown() then
				print("|cffFF0000LOCK|r and save flashFrame\n")
				self:EnableMouse(false)
				self:Hide()
				L.config.unlock_flashFrame = false
				LibStub("AceConfigRegistry-3.0"):NotifyChange("aLoot")
			end
		end)
		
		--[[
		local frame = CreateFrame("Frame", nil, "SecureHandlerClickTemplate")
		frame:SetAttribute("_onclick", [=[
			-- self, button, down
			if button == "RightButton" then
				self:Hide();
			end
		]=])
		]]--
		
		-- Slash handler
		SLASH_ALOOT1 = "/aloot"
		SlashCmdList["ALOOT"] = function(msg)
			local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
			if ( cmd == "test" ) then
				StartOnUpdateScript()
				AddFrameToPool(133641, "|cff00bbffLoot complete|r")
				ShowFlashFrame(aLootFlashFrameBase, nil, "lootName")
			else
				LibStub('AceConfigDialog-3.0'):Open("aLoot")
			end
		end
		
		if IsAddOnLoaded(_) then
			self:UnregisterEvent('ADDON_LOADED')
			self.ADDON_LOADED = nil
		end
	end
end

function lootFrameMixin:ConfigUpdate(event)
	if myLootFrameBase.numLootItems and myLootFrameBase.numLootItems > 0 then
		for i = 1, myLootFrameBase.numLootItems do
			myLootFrameBase.slots[i]:SetSize(L.config.iconSize, L.config.iconSize)
			myLootFrameBase.slots[i].nameTexture:SetTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, L.config.name_texture))
			myLootFrameBase.slots[i].name:SetFont(LSM:Fetch(LSM.MediaType.FONT, L.config.name_font), L.config.name_fontsize,L.config.name_font_flag)
			UpdateSlot(myLootFrameBase, i)
		end
		anchorSlots(myLootFrameBase)
	end

end

function lootFrameMixin:OnEvent(event, ...)
	--print(event)
	if ( event == "ADDON_LOADED" ) then
		OnAddonLoaded(self, ...)
	
	elseif ( event == "PLAYER_LOGIN" ) then
	
	
	elseif ( event == "UI_ERROR_MESSAGE" ) then
		local errorType, message = ...
		if myLootFrameBase.lootReadyIsOpened then
			if MultiCheck(message, ERR_INV_FULL, ERR_ITEM_MAX_COUNT, ERR_LOOT_LOCKED, ERR_LOOT_STUNNED, ERR_LOOT_NO_UI, ERR_LOOT_WHILE_INVULNERABLE, ERR_NO_LOOT) then
				if not aLootFlashFrameBase.Anime:IsPlaying() then
					ShowFlashFrame(aLootFlashFrameBase, nil, "|cffff0000" .. message  .."|r")
					PlaySoundFile(LSM:Fetch(LSM.MediaType.SOUND, L.config.flash_sound), "Master")
				end
			end
		end

	elseif ( event == "LOOT_READY" and L.config.speedLoot and not IsModifiedClick("AUTOLOOTTOGGLE") ) then
		OnLootReady(...)
		
	elseif ( event == "LOOT_OPENED" and (not L.config.speedLoot or (L.config.speedLoot and IsModifiedClick("AUTOLOOTTOGGLE")))) then
		OnLootOpened(myLootFrameBase, ...)
				
	elseif ( event == "LOOT_SLOT_CLEARED" ) then
		OnLootSlotCleared(myLootFrameBase, ...)
				
	elseif ( event == "LOOT_CLOSED" ) then
		myLootFrameBase.lootReadyIsOpened = false
		OnLootClosed(myLootFrameBase)
						
	elseif ( event == "OPEN_MASTER_LOOT_LIST" ) then
		MasterLooterFrame_Show(_G.LootFrame.selectedLootButton)
		--ToggleDropDownMenu(1, nil, GroupLootDropDown, LootFrame.selectedLootButton, 0, 0)		--LootFrame.selectedSlot
			
	elseif ( event == "UPDATE_MASTER_LOOT_LIST" ) then
		if _G.LootFrame.selectedLootButton then MasterLooterFrame_UpdatePlayers() end
		--MasterLooterFrame_UpdatePlayers()
	end
end

function lootFrameMixin:OnLoad()
	for _, event in pairs({
		"ADDON_LOADED",
		"PLAYER_LOGIN",
		"UI_ERROR_MESSAGE",
		"LOOT_READY",
		"LOOT_OPENED",
		"LOOT_SLOT_CLEARED",
		"LOOT_CLOSED",
		"OPEN_MASTER_LOOT_LIST",
		"UPDATE_MASTER_LOOT_LIST",
	}) do self:RegisterEvent(event) end
--	lootFrameMixin = nil
end
