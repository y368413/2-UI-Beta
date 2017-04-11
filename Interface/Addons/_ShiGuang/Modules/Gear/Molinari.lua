local defaults = {
	items = {
		[116913] = true, -- Peon's Mining Pick
		[116916] = true, -- Gorepetal's Gentle Grasp
	}
}

local Options = LibStub('Wasabi'):New('|cff8080ff[专业]|r分解研磨', 'ShiGuangPerDB', defaults)
Options:AddSlash('/molinari')
Options:Initialize(function(self)
	local Title = self:CreateTitle()
	Title:SetPoint('TOPLEFT', 20, -16)
	Title:SetFontObject('GameFontNormalMed1')
	Title:SetText("請將要避免不小心被處理掉的物品加入忽略清單。")

	local Description = self:CreateDescription()
	Description:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -6)
	Description:SetText("將物品拖曳到下方的視窗內，加入到忽略清單。")

	local OnItemEnter = function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT')
		GameTooltip:SetItemByID(self.key)
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine("點一下右鍵移除物品", 0, 1, 0)
		GameTooltip:Show()
	end

	local Items = self:CreateObjectContainer('items')
	Items:SetPoint('TOPLEFT', Description, 'BOTTOMLEFT', -20, -8)
	Items:SetSize(self:GetWidth(), 500)
	Items:SetObjectSize(34)
	Items:SetObjectSpacing(2)
	Items:On('ObjectCreate', function(self, event, Object)
		local Texture = Object:CreateTexture()
		Texture:SetAllPoints()

		Object:SetNormalTexture(Texture)
		Object:SetScript('OnEnter', OnItemEnter)
		Object:SetScript('OnLeave', GameTooltip_Hide)
	end)

	Items:On('ObjectUpdate', function(self, event, Object)
		local _, _, _, _, _, _, _, _, _, textureFile = GetItemInfo(Object.key)
		if(textureFile) then
			Object:SetNormalTexture(textureFile)
		elseif(not self.queryItems[Object.key]) then
			self.queryItems[Object.key] = true
			self:RegisterEvent('GET_ITEM_INFO_RECEIVED')
		end
	end)

	Items:On('ObjectClick', function(self, event, Object, button)
		if(button == 'RightButton') then
			Object:Remove()
		end
	end)

	Items:HookScript('OnEvent', function(self, event, itemID)
		if(event == 'GET_ITEM_INFO_RECEIVED') then
			if(self.queryItems[itemID]) then
				self.queryItems[itemID] = nil
				self:AddObject(itemID)

				if(#self.queryItems == 0) then
					self:UnregisterEvent('GET_ITEM_INFO_RECEIVED')
				end
			end
		end
	end)

	Items:SetScript('OnMouseUp', function(self)
		if(CursorHasItem()) then
			local _, itemID = GetCursorInfo()
			if(not self:HasObject(itemID)) then
				ClearCursor()
				self:AddObject(itemID)
			end
		end
	end)

	Items.queryItems = {}
end)


local Molinari = CreateFrame('Button', 'Molinari', UIParent, 'SecureActionButtonTemplate, SecureHandlerStateTemplate, SecureHandlerEnterLeaveTemplate, AutoCastShineTemplate')
Molinari:RegisterForClicks('AnyUp')
Molinari:SetFrameStrata('TOOLTIP')
Molinari:SetScript('OnHide', AutoCastShine_AutoCastStop)
Molinari:HookScript('OnLeave', AutoCastShine_AutoCastStop)
Molinari:Hide()

RegisterStateDriver(Molinari, 'visible', '[nomod:alt] hide; show')
Molinari:SetAttribute('_onleave', 'self:ClearAllPoints() self:Hide()')
Molinari:SetAttribute('_onstate-visible', [[
	if(newstate == 'hide' and self:IsShown()) then
		self:ClearAllPoints()
		self:Hide()
	end
]])

Molinari:HookScript('OnClick', function(self, button, down)
	if(button ~= 'LeftButton') then
		local _, parent = self:GetPoint()
		if(parent) then
			local onClick = parent:GetScript('OnClick')
			if(onClick) then
				onClick(parent, button, down)
			end

			local onMouseDown = parent:GetScript('OnMouseDown')
			if(down and onMouseDown) then
				onMouseDown(parent, button)
			end

			local onMouseUp = parent:GetScript('OnMouseUp')
			if(not down and onMouseUp) then
				onMouseUp(parent, button)
			end
		end
	end
end)

local function OnEnter(self)
	if(self:GetRight() >= (GetScreenWidth() / 2)) then
		GameTooltip:SetOwner(self, 'ANCHOR_LEFT')
	else
		GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
	end

	GameTooltip:SetBagItem(self:GetAttribute('target-bag'), self:GetAttribute('target-slot'))
end

function Molinari:Apply(itemLink, spell, r, g, b, isItem)
	local parent = GetMouseFocus()
	local slot = parent:GetID()
	local bag = parent:GetParent():GetID()
	if(not bag or bag < 0) then return end

	if(GetTradeTargetItemLink(7) == itemLink) then
		if(isItem) then
			return
		else
			self:SetAttribute('alt-type1', 'macro')
			self:SetAttribute('macrotext', string.format('/cast %s\n/run ClickTargetTradeButton(7)', spell))
		end
	elseif(GetContainerItemLink(bag, slot) == itemLink) then
		if(isItem) then
			self:SetAttribute('alt-type1', 'item')
			self:SetAttribute('item', 'item:' .. spell)
		else
			self:SetAttribute('alt-type1', 'spell')
			self:SetAttribute('spell', spell)
		end

		self:SetAttribute('target-bag', bag)
		self:SetAttribute('target-slot', slot)
	else
		return
	end

	self:SetAttribute('_entered', true)
	self:SetAllPoints(parent)
	self:Show()

	AutoCastShine_AutoCastStart(self, r, g, b)
end

local LibProcessable = LibStub('LibProcessable')
GameTooltip:HookScript('OnTooltipSetItem', function(self)
	if(self:GetOwner() == Molinari) then return end
	local _, itemLink = self:GetItem()
	if(not itemLink) then return end
	if(not IsAltKeyDown()) then return end
	if(InCombatLockdown()) then return end
	if(UnitHasVehicleUI('player')) then return end
	if(EquipmentFlyoutFrame:IsVisible()) then return end
	if(AuctionFrame and AuctionFrame:IsVisible()) then return end

	local itemID = tonumber(string.match(itemLink, 'item:(%d+):'))
	if(not itemID or ShiGuangPerDB.items[itemID]) then
		return
	end

	local isMillable, _, _, mortarItem = LibProcessable:IsMillable(itemID)
	if(isMillable and GetItemCount(itemID) >= 5) then
		Molinari:Apply(itemLink, mortarItem or 51005, 1/2, 1, 1/2, not not mortarItem)
	elseif(LibProcessable:IsProspectable(itemID) and GetItemCount(itemID) >= 5) then
		Molinari:Apply(itemLink, 31252, 1, 1/3, 1/3)
	elseif(LibProcessable:IsDisenchantable(itemLink, true)) then
		Molinari:Apply(itemLink, 13262, 1/2, 1/2, 1)
	else
		local isOpenable, _, _, keyItem = LibProcessable:IsOpenable(itemID)
		if(isOpenable) then
			if(keyItem and GetItemCount(keyItem) > 0) then
				Molinari:Apply(itemLink, keyItem, 0, 1, 1, true)
			elseif(not keyItem) then
				Molinari:Apply(itemLink, 1804, 0, 1, 1)
			end
		end
	end
end)

for _, sparkle in next, Molinari.sparkles do
	sparkle:SetHeight(sparkle:GetHeight() * 3)
	sparkle:SetWidth(sparkle:GetWidth() * 3)
end

Molinari:HookScript('OnEnter', OnEnter)
Molinari:HookScript('OnLeave', GameTooltip_Hide)
Molinari:RegisterEvent('BAG_UPDATE_DELAYED')
Molinari:RegisterEvent('MODIFIER_STATE_CHANGED')
Molinari:SetScript('OnEvent', function(self, event)
	if(self:IsShown()) then
		if(event == 'BAG_UPDATE_DELAYED' and not InCombatLockdown()) then
			self:Hide()
		elseif(event == 'MODIFIER_STATE_CHANGED') then
			OnEnter(self)
		end
	end
end)
