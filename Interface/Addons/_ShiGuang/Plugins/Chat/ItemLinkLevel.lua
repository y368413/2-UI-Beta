-- ## Version: 3.0.1 ## SavedVariables: SavedData
--constants borrowed from PersonalLootHelper
local PLH_RELIC_TOOLTIP_TYPE_PATTERN = _G.RELIC_TOOLTIP_TYPE:gsub('%%s', '(.+)')
local PLH_ITEM_LEVEL_PATTERN = _G.ITEM_LEVEL:gsub('%%d', '(%%d+)')

local SOCKET_STATS = {
	'EMPTY_SOCKET_RED',
	'EMPTY_SOCKET_YELLOW',
	'EMPTY_SOCKET_BLUE',
	'EMPTY_SOCKET_META',
	'EMPTY_SOCKET_PRISMATIC',
	'EMPTY_SOCKET_DOMINATION',
}

local frame = CreateFrame("Frame", "ItemLinkLevel");
frame:RegisterEvent("PLAYER_LOGIN");
local tooltip

-- Inhibit Regular Expression magic characters ^$()%.[]*+-?)
local function EscapeSearchString(str)
	return str:gsub("(%W)", "%%%1")
end

-- function adapted from PersonalLootHelper
local function CreateEmptyTooltip()
	local tip = CreateFrame('GameTooltip', "ItemLinkLevelTooltip", nil, "GameTooltipTemplate")
	tip:SetOwner(UIParent, 'ANCHOR_NONE')

	local leftside = {}
	local rightside = {}
	for i = 1, 99 do
		local leftLine = tip:CreateFontString("ItemLinkLevelTooltipTextLeft" .. i, nil, "GameTooltipText")
		leftLine:SetFontObject("GameFontNormal")

		local rightLine = tip:CreateFontString("ItemLinkLevelTooltipTextRight" .. i, nil, "GameTooltipText")
		rightLine:SetFontObject("GameFontNormal")

		tip:AddFontStrings(leftLine, rightLine)

		leftside[i] = leftLine
		rightside[i] = rightLine
	end
	tip.leftside = leftside
	tip.rightside = rightside
	return tip
end

-- function borrowed from PersonalLootHelper
local function PLH_GetRelicType(item)
	local relicType = nil

	if item ~= nil then
		tooltip = tooltip or CreateEmptyTooltip()
		tooltip:ClearLines()
		tooltip:SetHyperlink(item)
		local t = tooltip.leftside[2]:GetText()

		local index = 1
		local t
		while not relicType and tooltip.leftside[index] do
			t = tooltip.leftside[index]:GetText()
			if t ~= nil then
				relicType = t:match(PLH_RELIC_TOOLTIP_TYPE_PATTERN)
			end
			index = index + 1
		end

		tooltip:Hide()
	end

	return relicType
end

-- function borrowed from PersonalLootHelper
local function PLH_GetRealILVL(item)
	local realILVL = nil

	if item ~= nil then
		tooltip = tooltip or CreateEmptyTooltip()
		tooltip:ClearLines()
		tooltip:SetHyperlink(item)
		local t = tooltip.leftside[2]:GetText()
		if t ~= nil then
			-- realILVL = t:match('Item Level (%d+)')
			realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
		end
		-- ilvl can be in the 2nd or 3rd line dependng on the tooltip; if we didn't find it in 2nd, try 3rd
		if realILVL == nil then
			t = tooltip.leftside[3]:GetText()
			if t ~= nil then
				-- realILVL = t:match('Item Level (%d+)')
				realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
			end
		end
		tooltip:Hide()

		-- if realILVL is still nil, we couldn't find it in the tooltip - try grabbing it from getItemInfo, even though
		--   that doesn't return upgrade levels
		if realILVL == nil then
			_, _, _, realILVL, _, _, _, _, _, _, _ = C_Item.GetItemInfo(item)
		end
	end

	if realILVL == nil then
		return 0
	else
		return tonumber(realILVL)
	end
end

local function ItemHasSockets(itemLink)
	local itemStats = C_Item.GetItemStats(itemLink)
	if itemStats == nil then return false end

	local socketCount = 0
	for _, socketStat in pairs(SOCKET_STATS) do
		socketCount = socketCount + (itemStats[socketStat] or 0)
	end

	return socketCount > 0
end

local function Filter(self, event, message, user, ...)
	for itemLink in message:gmatch("|%x+|Hitem:.-|h.-|h|r") do
		local itemName, _, quality, _, _, _, itemSubType, _, itemEquipLoc, _, _, itemClassId, itemSubClassId = C_Item.GetItemInfo(itemLink)
		if (
			quality ~= nil and quality >= SavedData.trigger_quality and
				(itemClassId == Enum.ItemClass.Weapon or itemClassId == Enum.ItemClass.Gem or itemClassId == Enum.ItemClass.Armor)) then
			local itemString = string.match(itemLink, "item[%-?%d:]+")
			local color = ITEM_QUALITY_COLORS[quality].hex
			local iLevel = PLH_GetRealILVL(itemLink)

			local attrs = {}
			if (SavedData.show_subtype and itemSubType ~= nil) then
				if (itemClassId == Enum.ItemClass.Armor and itemSubClassId == 0) then
					-- don't display Miscellaneous for rings, necks and trinkets
				elseif (itemClassId == Enum.ItemClass.Armor and itemEquipLoc == "INVTYPE_CLOAK") then
					-- don't display Cloth for cloaks
				else
					if (SavedData.subtype_short_format) then
						table.insert(attrs, itemSubType:sub(0, 1))
					else
						table.insert(attrs, itemSubType)
					end
				end
				if (itemClassId == Enum.ItemClass.Gem and itemSubClassId == Enum.ItemArmorSubclass.Relic) then
					local relicType = PLH_GetRelicType(itemLink)
					table.insert(attrs, relicType)
				end
			end
			if (SavedData.show_equiploc and itemEquipLoc ~= nil and _G[itemEquipLoc] ~= nil) then
				table.insert(attrs, _G[itemEquipLoc])
			end
			if (SavedData.show_ilevel and iLevel ~= nil) then
				local txt = iLevel
				if (ItemHasSockets(itemLink)) then txt = txt .. "+S" end
				table.insert(attrs, txt)
			end

			local newItemName = itemName .. " (" .. table.concat(attrs, " ") .. ")"
			local newLink = color .. "|H" .. itemString .. "|h[" .. newItemName .. "]|h|r"
			if (SavedData.show_icon) then
				local itemId = select(2, string.split(":", itemString))
				local itemTexture = C_Item.GetItemIconByID(itemId)
				newLink = "|T" .. itemTexture .. ":0|t" .. newLink
			end

			message = string.gsub(message, EscapeSearchString(itemLink), newLink)
		end
	end
	return false, message, user, ...
end

local function EventHandler(self, event, ...)
	if (SavedData == nil) then SavedData = {} end
	if (SavedData.trigger_loots == nil) then SavedData.trigger_loots = true end
	if (SavedData.trigger_chat == nil) then SavedData.trigger_chat = true end
	if (SavedData.trigger_quality == nil) then SavedData.trigger_quality = 3 end
	if (SavedData.show_subtype == nil) then SavedData.show_subtype = true end
	if (SavedData.subtype_short_format == nil) then SavedData.subtype_short_format = false end
	if (SavedData.show_equiploc == nil) then SavedData.show_equiploc = true end
	if (SavedData.show_ilevel == nil) then SavedData.show_ilevel = true end
	if (SavedData.show_icon == nil) then SavedData.show_icon = true end

	if (SavedData.trigger_loots) then
		ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", Filter);
	end

	if (SavedData.trigger_chat) then
		ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", Filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", Filter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", Filter);
	end

	local panel = CreateFrame("Frame", "OptionsPanel", UIParent)
	panel.name = "ItemLinkLevel"

	local subtypeCheckBox = CreateFrame("CheckButton", "subtypeCheckBox", panel, "UICheckButtonTemplate")
	subtypeCheckBox:SetPoint("TOPLEFT", 10, -30)
	subtypeCheckBox:SetChecked(SavedData.show_subtype)
	_G[subtypeCheckBox:GetName() .. "Text"]:SetText("Display armor/weapon type (Plate, Leather, ...)")
	subtypeCheckBox:SetScript("OnClick", function(self) SavedData.show_subtype = self:GetChecked() end)

	local subtypeShortCheckBox = CreateFrame("CheckButton", "subtypeShortCheckBox", panel, "UICheckButtonTemplate")
	subtypeShortCheckBox:SetPoint("TOPLEFT", 30, -60)
	subtypeShortCheckBox:SetChecked(SavedData.subtype_short_format)
	_G[subtypeShortCheckBox:GetName() .. "Text"]:SetText("Short format (P for plate, L for leather, ...)")
	subtypeShortCheckBox:SetScript("OnClick", function(self) SavedData.subtype_short_format = self:GetChecked() end)

	local equipLocCheckbox = CreateFrame("CheckButton", "equipLocCheckbox", panel, "UICheckButtonTemplate")
	equipLocCheckbox:SetPoint("TOPLEFT", 10, -90)
	equipLocCheckbox:SetChecked(SavedData.show_equiploc)
	_G[equipLocCheckbox:GetName() .. "Text"]:SetText("Display equip location (Head, Trinket, ...)")
	equipLocCheckbox:SetScript("OnClick", function(self) SavedData.show_equiploc = self:GetChecked() end)

	local iLevelCheckbox = CreateFrame("CheckButton", "iLevelCheckbox", panel, "UICheckButtonTemplate")
	iLevelCheckbox:SetPoint("TOPLEFT", 10, -120)
	iLevelCheckbox:SetChecked(SavedData.show_ilevel)
	_G[iLevelCheckbox:GetName() .. "Text"]:SetText("Display item level")
	iLevelCheckbox:SetScript("OnClick", function(self) SavedData.show_ilevel = self:GetChecked() end)

	local itemIconCheckbox = CreateFrame("CheckButton", "itemIconCheckbox", panel, "UICheckButtonTemplate")
	itemIconCheckbox:SetPoint("TOPLEFT", 10, -150)
	itemIconCheckbox:SetChecked(SavedData.show_icon)
	_G[itemIconCheckbox:GetName() .. "Text"]:SetText("Display item icon")
	itemIconCheckbox:SetScript("OnClick", function(self) SavedData.show_icon = self:GetChecked() end)

	local triggerLootsCheckbox = CreateFrame("CheckButton", "triggerLootsCheckbox", panel, "UICheckButtonTemplate")
	triggerLootsCheckbox:SetPoint("TOPLEFT", 10, -180)
	triggerLootsCheckbox:SetChecked(SavedData.trigger_loots)
	_G[triggerLootsCheckbox:GetName() .. "Text"]:SetText("Trigger on loots (requires restart)")
	triggerLootsCheckbox:SetScript("OnClick", function(self) SavedData.trigger_loots = self:GetChecked() end)

	local triggerChatCheckbox = CreateFrame("CheckButton", "triggerChatCheckbox", panel, "UICheckButtonTemplate")
	triggerChatCheckbox:SetPoint("TOPLEFT", 10, -210)
	triggerChatCheckbox:SetChecked(SavedData.trigger_chat)
	_G[triggerChatCheckbox:GetName() .. "Text"]:SetText("Trigger on chat messages (requires restart)")
	triggerChatCheckbox:SetScript("OnClick", function(self) SavedData.trigger_chat = self:GetChecked() end)

	local triggerQualityLabel = panel:CreateFontString("triggerQualityLabel", nil, "GameTooltipText")
	triggerQualityLabel:SetText("Minimum trigger quality")
	triggerQualityLabel:SetPoint("TOPLEFT", 10, -260)
	local triggerQualityValue = panel:CreateFontString("triggerQualityValue", nil, "GameTooltipText")
	local triggerQualitySlider = CreateFrame("Slider", "iLevelTriggerQualityValue", panel, "OptionsSliderTemplate")
	triggerQualitySlider:SetPoint("LEFT", triggerQualityLabel, "RIGHT", 10, 0)
	triggerQualitySlider:SetMinMaxValues(0, 6)
	triggerQualitySlider:SetValue(SavedData.trigger_quality)
	triggerQualitySlider:SetValueStep(1)
	getglobal(triggerQualitySlider:GetName() .. 'Low'):SetText(_G["ITEM_QUALITY0_DESC"])
	getglobal(triggerQualitySlider:GetName() .. 'High'):SetText(_G["ITEM_QUALITY6_DESC"])
	triggerQualitySlider:SetScript("OnValueChanged", function(_, value)
		value = math.floor(value)
		SavedData.trigger_quality = value
		triggerQualityValue:SetText(_G["ITEM_QUALITY" .. value .. "_DESC"])
	end)

	triggerQualityValue:SetText(_G["ITEM_QUALITY" .. SavedData.trigger_quality .. "_DESC"])
	triggerQualityValue:SetPoint("LEFT", triggerQualitySlider, "RIGHT", 10, 0)

	if InterfaceOptions_AddCategory then
		InterfaceOptions_AddCategory(panel)
	else
		local category, layout = _G.Settings.RegisterCanvasLayoutCategory(panel, panel.name)
		_G.Settings.RegisterAddOnCategory(category)
	end
end

frame:SetScript("OnEvent", EventHandler);
