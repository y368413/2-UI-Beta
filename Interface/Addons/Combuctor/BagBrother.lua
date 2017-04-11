local Brother = CreateFrame('Frame', 'BagBrother')
Brother:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)
Brother:RegisterEvent('ADDON_LOADED')
Brother:RegisterEvent('PLAYER_LOGIN')


--[[ Cache Loaded ]]--

function Brother:ADDON_LOADED()
	self:RemoveEvent('ADDON_LOADED')
	self:StartupCache()
	self:SetupCharacter()
end

function Brother:StartupCache()
	local Player = UnitName('player')
	local Realm = GetRealmName()
	
	BrotherBags = BrotherBags or {}
	BrotherBags[Realm] = BrotherBags[Realm] or {}
	
	self.Realm = BrotherBags[Realm]
	self.Realm[Player] = self.Realm[Player] or {equip = {}}
	self.Player = self.Realm[Player]
end

function Brother:SetupCharacter()
	local player = self.Player
	player.faction = UnitFactionGroup('player') == 'Alliance'
	player.class = select(2, UnitClass('player'))
	player.race = select(2, UnitRace('player'))
	player.sex = UnitSex('player')
end


--[[ Server Ready ]]--

function Brother:PLAYER_LOGIN()
	self:RemoveEvent('PLAYER_LOGIN')
	self:SetupEvents()
	self:UpdateData()
end

function Brother:SetupEvents()
	self:RegisterEvent('UNIT_INVENTORY_CHANGED')
	self:RegisterEvent('PLAYER_MONEY')
	self:RegisterEvent('BAG_UPDATE')

	self:RegisterEvent('BANKFRAME_OPENED')
	self:RegisterEvent('BANKFRAME_CLOSED')

	self:RegisterEvent('VOID_STORAGE_OPEN')
	self:RegisterEvent('VOID_STORAGE_CLOSE')

	self:RegisterEvent('GUILD_ROSTER_UPDATE')
	self:RegisterEvent('GUILDBANKFRAME_OPENED')
	self:RegisterEvent('GUILDBANKFRAME_CLOSED')
	self:RegisterEvent('GUILDBANKBAGSLOTS_CHANGED')
end

function Brother:UpdateData()
	for i = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		self:BAG_UPDATE(i)
	end

	self:UNIT_INVENTORY_CHANGED('player')
	self:GUILD_ROSTER_UPDATE()
	self:PLAYER_MONEY()
end

function Brother:RemoveEvent(event)
	self:UnregisterEvent(event)
	self[event] = nil
end

-------------------------------------------------------------
local EquipmentSlots = INVSLOT_LAST_EQUIPPED
local BagSlots = NUM_BAG_SLOTS
local BankSlots = NUM_BANKBAGSLOTS
local VaultSlots = 80 * 2

local FirstBankSlot = 1 + BagSlots
local LastBankSlot = BankSlots + BagSlots
local Backpack = BACKPACK_CONTAINER
local Bank = BANK_CONTAINER
local Reagents = REAGENTBANK_CONTAINER


--[[ Continuous Events ]]--

function BagBrother:BAG_UPDATE(bag)
	local isBag = bag > Bank and bag <= BagSlots
	
	if isBag then
  		self:SaveBag(bag, bag == Backpack)
	end
end

function BagBrother:UNIT_INVENTORY_CHANGED(unit)
	if unit == 'player' then
		for i = 1, EquipmentSlots do
			self:SaveEquip(i)
		end
	end
end

function BagBrother:PLAYER_MONEY()
	self.Player.money = GetMoney()
end


--[[ Bank Events ]]--

function BagBrother:BANKFRAME_OPENED()
	self.atBank = true
end

function BagBrother:BANKFRAME_CLOSED()
	if self.atBank then
		for i = FirstBankSlot, LastBankSlot do
			self:SaveBag(i)
		end

		if IsReagentBankUnlocked() then
			self:SaveBag(Reagents, true)
		end

		self:SaveBag(Bank, true)
		self.atBank = nil
	end
end


--[[ Void Storage Events ]]--

function BagBrother:VOID_STORAGE_OPEN()
	self.atVault = true
end

function BagBrother:VOID_STORAGE_CLOSE()
	if self.atVault then
		self.Player.vault = {}
		self.atVault = nil

		for i = 1, VaultSlots do
			local id = GetVoidItemInfo(1, i)
    		self.Player.vault[i] = id and tostring(id) or nil
  		end
  	end
end


--[[ Guild Events ]]--

function BagBrother:GUILDBANKFRAME_OPENED()
	self.atGuild = true
end

function BagBrother:GUILDBANKFRAME_CLOSED()
	self.atGuild = nil
end

function BagBrother:GUILD_ROSTER_UPDATE()
	self.Player.guild = GetGuildInfo('player')
end

function BagBrother:GUILDBANKBAGSLOTS_CHANGED()
	if self.atGuild then
		local id = GetGuildInfo('player') .. '*'
		local tab = GetCurrentGuildBankTab()
		local tabs = self.Realm[id] or {}

		for i = 1, GetNumGuildBankTabs() do
			tabs[i] = tabs[i] or {}
			tabs[i].name, tabs[i].icon, tabs[i].view, tabs[i].deposit, tabs[i].withdraw = GetGuildBankTabInfo(i)
			tabs[i].info = nil
		end

		local items = tabs[tab]
		if items then
			for i = 1, 98 do
				local link = GetGuildBankItemLink(tab, i)
				local _, count = GetGuildBankItemInfo(tab, i)

				items[i] = self:ParseItem(link, count)
			end
		end

		self.Realm[id] = tabs
	end
end

--------------------------------------------------------------------

function BagBrother:SaveBag(bag, onlyItems)
	local size = GetContainerNumSlots(bag)
	if size > 0 then
		local items = {}
		for slot = 1, size do
			local _, count, _,_,_,_, link = GetContainerItemInfo(bag, slot)
			items[slot] = self:ParseItem(link, count)
		end

		if not onlyItems then
			self:SaveEquip(ContainerIDToInventoryID(bag), size)
		end

		self.Player[bag] = items
	else
		self.Player[bag] = nil
	end
end

function BagBrother:SaveEquip(i, count)
	local link = GetInventoryItemLink('player', i)
	local count = count or GetInventoryItemCount('player', i)

	self.Player.equip[i] = self:ParseItem(link, count)
end

function BagBrother:ParseItem(link, count)
	if link then
		local id = tonumber(link:match('item:(%d+):')) -- check for profession window bug
		if id == 0 and TradeSkillFrame then
			local focus = GetMouseFocus():GetName()

			if focus == 'TradeSkillSkillIcon' then 
				link = GetTradeSkillItemLink(TradeSkillFrame.selectedSkill)
			else
				local i = focus:match('TradeSkillReagent(%d+)')
				if i then
					link = GetTradeSkillReagentItemLink(TradeSkillFrame.selectedSkill, tonumber(i))
				end
			end
		end

		if link:find('0:0:0:0:0:%d+:%d+:%d+:0:0') then
			link = link:match('|H%l+:(%d+)')
		else
			link = link:match('|H%l+:([%d:]+)')
		end
		
		if count and count > 1 then
			link = link .. ';' .. count
		end

		return link
	end
end