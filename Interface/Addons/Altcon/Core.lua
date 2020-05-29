------------------------------------------------------------
-- Core.lua
--
-- Abin
-- 2016-10-20
------------------------------------------------------------

local type = type
local pairs = pairs
local ipairs = ipairs
local strmatch = strmatch
local wipe = wipe
local time = time
local format = format
local IsAddOnLoaded = IsAddOnLoaded
local GetContainerNumSlots = GetContainerNumSlots
local GetContainerItemID = GetContainerItemID
local strfind = strfind
local tonumber = tonumber
local IsResting = IsResting
local GetContainerItemLink = GetContainerItemLink
local ClearCursor = ClearCursor
local GetContainerNumSlots = GetContainerNumSlots
local PickupContainerItem = PickupContainerItem
local CursorHasItem = CursorHasItem
local strmatch = strmatch
local GetAverageItemLevel = GetAverageItemLevel
local GetItemCount = GetItemCount
local strsub = strsub
local select = select
local GetCurrencyInfo = GetCurrencyInfo

local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local C_Garrison = C_Garrison
local C_ChallengeMode = C_ChallengeMode

local addon = LibAddonManager:CreateAddon(...)
local L = addon.L


addon.RESOURCE_WATCH = {
	{ id = 1580, max = 5 }, -- 战痕命运印记
	{ id = 1560 }, -- 战争物资
	{ id = 1718 }, -- 泰坦残血精华
	{ id = 1719, max = 25000 }, -- 腐化的纪念品
	{ id = 1755 }, -- 凝结幻象
	{ id = 173363, type = "item" }, -- 惊魂幻象法器
}

local KEY_CONVERT = {
	coin = "c1580",
	resource = "c1560",
	resource3 = "c1718",
}

addon:RegisterDB("AltconDB", 1)
addon:RegisterSlashCmd("altcon")

function addon:OnInitialize(db, dbNew, chardb, chardbNew)
	if type(chardb.challenge) ~= "table" then
		chardb.challenge = {}
	end

	local k, v
	for k, v in pairs(chardb) do
		local k2 = KEY_CONVERT[k]
		if k2 then
			chardb[k2] = v
			chardb[k] = nil
		end
	end

	chardb.profile = self:GetCurProfileName()
	chardb.class = self.class

	self:BroadcastEvent("OnInitialize", db, dbNew, chardb, chardbNew)

	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE", "UpdateData")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_START", "BAG_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterEvent("CHALLENGE_MODE_MAPS_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_MEMBER_INFO_UPDATED", "CHALLENGE_MODE_MAPS_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_LEADERS_UPDATE", "CHALLENGE_MODE_MAPS_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN")
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "PLAYER_EQUIPMENT_CHANGED")
	self:RequestChallengeData()
	self:BAG_UPDATE()
	self:UpdateCloakCorruption()
end

function addon:RequestChallengeData()
	C_MythicPlus.RequestRewards()
	C_MythicPlus.RequestMapInfo()
end

function addon:IsDataEmpty(data)
	return not data.research.start and not data.challenge.completed and not data.challenge.key and not data.resource and data ~= self.chardb
end

function addon:CHALLENGE_MODE_MAPS_UPDATE()
	local highest = C_MythicPlus.GetWeeklyChestRewardLevel()
	if highest == 0 then
		highest = nil
	end

	if highest ~= self.chardb.challenge.completed then
		self.chardb.challenge.completed = highest
		self:BroadcastEvent("OnDataUpdate", self.chardb)
	end

	self.chardb.recordedLevel = nil
end

function addon:CHALLENGE_MODE_COMPLETED()
	local _, level = C_ChallengeMode.GetCompletionInfo()
	if level and level > (self.chardb.challenge.completed or 0) then
		self.chardb.challenge.completed = level
		self:BroadcastEvent("OnDataUpdate", self.chardb)
	end
	self:BAG_UPDATE()
end

function addon:PLAYER_EQUIPMENT_CHANGED()
	local level = GetAverageItemLevel()
	self.chardb.ilevel = format("%.1f", level or 0)
	self:UpdateCloakCorruption()
end

local PATTERN = "(%d+).-"..ITEM_MOD_CORRUPTION_RESISTANCE
local LibScanTip = LibScanTip
function addon:UpdateCloakCorruption()
	LibScanTip:CallMethod("SetInventoryItem", "player", 15)
	local value = LibScanTip:FindText(PATTERN, nil, 5)
	if value then
		self.chardb.cloak = value
		self:BroadcastEvent("OnDataUpdate", self.chardb)
	end
end

function addon:BAG_UPDATE()
	self:RegisterTick(1)
end

function addon:OnTick()
	self:UnregisterTick()
	self:UpdateData()
	self:UpdateKeystone()
end

function addon:UpdateData()
	local changed = false
	local _, data
	for _, data in ipairs(self.RESOURCE_WATCH) do
		local _, amount
		if data.type == "item" then
			amount = GetItemCount(data.id)
		else
			_, amount = GetCurrencyInfo(data.id)
		end

		if amount == 0 then
			amount = nil
		end

		if self.chardb[data.key] ~= amount then
			self.chardb[data.key] = amount
			changed = true
		end
	end

	if changed then
		self:BroadcastEvent("OnDataUpdate", self.chardb)
	end
end

-- Automatically slot the keystone
function addon:CHALLENGE_MODE_KEYSTONE_RECEPTABLE_OPEN()
	local name, level, link, bag, slot = self:GetKeystoneInfo()
	if not name then
		return
	end

	ClearCursor()
	PickupContainerItem(bag, slot)
	if CursorHasItem() then
		C_ChallengeMode.SlotKeystone()
  	end
end

function addon:GetDisplayName(profile)
	local name, realm = strmatch(profile, "(.+) %- (.+)")
	if realm == self.realm then
		return name
	end
	return profile
end

function addon:GetDisplayColor(class)
	local data = RAID_CLASS_COLORS[class]
	if data then
		return data.r, data.g, data.b
	end
end

local KEY_PATTERN = "Hkeystone:(%d+):(%d+):(%d+):(.+)%["..gsub(CHALLENGE_MODE_KEYSTONE_NAME, "%%s", "(.+)").."%]"

function addon:GetKeystoneInfo()
	local bag, slot
	for bag = 0, 4 do
    		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if link then
				local _, _, level, _, name = strmatch(link, KEY_PATTERN)
				if level then
					return name, tonumber(level), link, bag, slot
				end
			end
    		end
  	end
end

function addon:UpdateKeystone()
	self.needUpdateKeystone = nil
	local challenge = self.chardb.challenge
	local key, level, link = self:GetKeystoneInfo()
	if key ~= challenge.key or level ~= challenge.level or link ~= challenge.link then
		challenge.key, challenge.level, challenge.link = key, level, link
		self:BroadcastEvent("OnDataUpdate", self.chardb)
		addon:RequestChallengeData()
	end
end

do
	local _, data
	for _, data in ipairs(addon.RESOURCE_WATCH) do
		if data.type == "item" then
			data.key = "i"..data.id
			data.OnItemInfoReceived = function(self, itemId, name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice)
				self.icon = texture
			end
			LibItemQuery:QueryItem(data.id, data)
		else -- currency
			data.key = "c"..data.id
			data.icon = select(3,  GetCurrencyInfo(data.id))
		end
	end
end