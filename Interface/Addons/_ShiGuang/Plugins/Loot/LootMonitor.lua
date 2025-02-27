local _, ns = ...
local M, R, U, I = unpack(ns)

-- Item Stats
I.ItemStats = {
	--["ITEM_MOD_CRIT_RATING_SHORT"] = true,    -- 爆击
	--["ITEM_MOD_HASTE_RATING_SHORT"] = true,   -- 急速
	--["ITEM_MOD_MASTERY_RATING_SHORT"] = true, -- 精通
	--["ITEM_MOD_VERSATILITY"] = true,          -- 全能

	["ITEM_MOD_CR_AVOIDANCE_SHORT"] = true,     -- 闪避
	["ITEM_MOD_CR_LIFESTEAL_SHORT"] = true,     -- 吸血
	["ITEM_MOD_CR_SPEED_SHORT"] = true,         -- 加速
	["ITEM_MOD_CR_STURDINESS_SHORT"] = true,    -- 永不磨损
}

-- Item IDs
I.MiscellaneousIDs = {
	[Enum.ItemClass.Miscellaneous] = true,
}

I.CollectionIDs = {
	[Enum.ItemMiscellaneousSubclass.CompanionPet] = true,
	[Enum.ItemMiscellaneousSubclass.Mount] = true,
}

I.EquipmentIDs = {
	[Enum.ItemClass.Weapon] = true,
	[Enum.ItemClass.Armor] = true,
}

I.OutmodedIDs = {
	[Enum.ItemClass.Consumable] = true,
	[Enum.ItemClass.Gem] = true,
	[Enum.ItemClass.Reagent] = true,
	[Enum.ItemClass.Tradegoods] = true,
	[Enum.ItemClass.ItemEnhancement] = true,
}

I.ExcludeIDs = {
	[Enum.ItemConsumableSubclass.Generic] = Enum.ItemClass.Consumable,
	[Enum.ItemConsumableSubclass.Elixir] = Enum.ItemClass.Consumable,
	[Enum.ItemConsumableSubclass.Other] = Enum.ItemClass.Consumable,
}

-- Item Types
I.ConduitTypes = {
	[CONDUIT_TYPE_ENDURANCE] = "耐久",
	[CONDUIT_TYPE_FINESSE] = "灵巧",
	[CONDUIT_TYPE_POTENCY] = "效能",
}

I.CurioTypes = {
	[DELVES_CONFIG_SLOT_COMBAT_CURIO] = "战斗",
	[DELVES_CONFIG_SLOT_UTILITY_CURIO] = "效能",
}

I.BindTypes = {
	[ITEM_ACCOUNTBOUND] = "BoA",
	[ITEM_BNETACCOUNTBOUND] = "BoA",
	[ITEM_BIND_ON_EQUIP] = "BoE",
	[ITEM_BIND_ON_USE] = "BoU",
	[ITEM_BIND_TO_ACCOUNT] = "BoA",
	[ITEM_BIND_TO_BNETACCOUNT] = "BoA",
	--[ITEM_ACCOUNTBOUND_UNTIL_EQUIP] = "EoA",
	--[ITEM_BIND_TO_ACCOUNT_UNTIL_EQUIP] = "EoA",
}

I.EquipmentTypes = {
	["INVTYPE_HOLDABLE"] = SECONDARYHANDSLOT,
	["INVTYPE_SHIELD"] = SHIELDSLOT,
}

I.ContainerTypes = {
	[0] = "背包",
	[1] = "灵魂",
	[2] = "草药",
	[3] = "附魔",
	[4] = "工程",
	[5] = "珠宝",
	[6] = "采矿",
	[7] = "制皮",
	[8] = "铭文",
	[9] = "工具",
	[10] = "烹饪",
	[11] = "材料",
}

I.ItemEnhancementTypes = {
	[0] = INVTYPE_HEAD,
	[1] = INVTYPE_NECK,
	[2] = INVTYPE_SHOULDER,
	[3] = INVTYPE_CLOAK,
	[4] = INVTYPE_CHEST,
	[5] = INVTYPE_WRIST,
	[6] = INVTYPE_HAND,
	[7] = INVTYPE_WAIST,
	[8] = INVTYPE_LEGS,
	[9] = INVTYPE_FEET,
	[10] = INVTYPE_FINGER,
	[11] = INVTYPE_WEAPON,
	[12] = INVTYPE_2HWEAPON,
	[13] = INVTYPE_WEAPONOFFHAND,
	[14] = AUCTION_SUBCATEGORY_OTHER,
}

I.RecipeTypes = {
	[0] = "书籍",
	[1] = "制皮",
	[2] = "裁缝",
	[3] = "工程",
	[4] = "锻造",
	[5] = "烹饪",
	[6] = "炼金",
	[7] = "急救",
	[8] = "附魔",
	[9] = "钓鱼",
	[10] = "珠宝",
	[11] = "铭文",
}

I.KeyTypes = {
	[0] = "钥匙",
	[1] = "开锁",
}

I.ProfessionTypes = {
	[0] = "锻造",
	[1] = "制皮",
	[2] = "炼金",
	[3] = "草药",
	[4] = "烹饪",
	[5] = "采矿",
	[6] = "裁缝",
	[7] = "工程",
	[8] = "附魔",
	[9] = "钓鱼",
	[10] = "剥皮",
	[11] = "珠宝",
	[12] = "铭文",
	[13] = "考古",
}

I.MiscellaneousTypes = {
	[2] = PETS,
	[5] = MOUNTS,
	[6] = EQUIPSET_EQUIP,
}

I.DeliverRelic = {
	[356931] = true,
	[356933] = true,
	[356934] = true,
	[356935] = true,
	[356936] = true,
	[356937] = true,
	[356938] = true,
	[356939] = true,
	[356940] = true,
}

I.AncientMana = {
	[192922] = true,
	[193080] = true,
	[193081] = true,
	[211161] = true,
	[211171] = true,
	[216918] = true,
	[222333] = true,
	[222334] = true,
	[222335] = true,
	[222336] = true,
	[222929] = true,
	[222942] = true,
	[222945] = true,
	[222947] = true,
	[222950] = true,
	[223677] = true,
	[224379] = true,
	[224380] = true,
	[224381] = true,
	[224382] = true,
	[227729] = true,
	[233126] = true,
	[233232] = true,
}

I.Experience = {
	[180419] = true,
	[225517] = true,
	[255249] = true,
	[347495] = true,
	[347496] = true,
	[347497] = true,
	[347498] = true,
	[347499] = true,
	[353852] = true,
	[357445] = true,
	[357447] = true,
	[357448] = true,
	[362986] = true,
}

I.Studying = {
	[450698] = true,
	[450793] = true,
	[450818] = true,
	[450819] = true,
	[450821] = true,
	[450824] = true,
	[450827] = true,
	[450828] = true,
	[450835] = true,
	[450836] = true,
	[450840] = true,
	[452259] = true,
	[452260] = true,
	[453371] = true,
	[453372] = true,
	[453440] = true,
	[453443] = true,
	[453444] = true,
	[453447] = true,
	[453448] = true,
	[453450] = true,
	[453452] = true,
	[453453] = true,
	[453454] = true,
	[453455] = true,
	[453456] = true,
	[453880] = true,
	[454023] = true,
	[454355] = true,
	[454358] = true,
	[457715] = true,
	[457717] = true,
	[457718] = true,
	[457719] = true,
	[457720] = true,
	[457721] = true,
	[457722] = true,
	[457723] = true,
	[457724] = true,
	[457725] = true,
	[457726] = true,
	[458432] = true,
	[458477] = true,
	[458681] = true,
	[458690] = true,
	[458719] = true,
	[458722] = true,
	[458726] = true,
	[458728] = true,
	[458729] = true,
	[458731] = true,
	[458733] = true,
	[458734] = true,
	[458738] = true,
	[459885] = true,
	[459886] = true,
	[459887] = true,
	[459888] = true,
	[459889] = true,
	[459890] = true,
	[459891] = true,
	[459892] = true,
	[459893] = true,
	[459894] = true,
	[459895] = true,
	[459896] = true,
	[459897] = true,
	[459898] = true,
	[459899] = true,
	[459900] = true,
	[459901] = true,
	[459902] = true,
	[459903] = true,
	[459904] = true,
	[459905] = true,
	[459906] = true,
	[459907] = true,
	[459908] = true,
	[459909] = true,
	[459910] = true,
	[459911] = true,
	[459912] = true,
	[459913] = true,
	[459914] = true,
	[459915] = true,
	[459916] = true,
	[459917] = true,
	[460234] = true,
	[460240] = true,
	[460258] = true,
	[462138] = true,
	[462141] = true,
	[462142] = true,
	[462143] = true,
	[462144] = true,
	[462146] = true,
	[462902] = true,
	[462903] = true,
	[462904] = true,
	[462905] = true,
	[462906] = true,
	[462907] = true,
	[462908] = true,
	[462909] = true,
	[462910] = true,
	[462911] = true,
	[462912] = true,
	[462913] = true,
	[462914] = true,
	[462915] = true,
	[462916] = true,
	[462917] = true,
	[463199] = true,
	[463200] = true,
	[463201] = true,
	[463202] = true,
	[463203] = true,
	[463204] = true,
	[463205] = true,
}

I.SpecialJunk = {
	[3300] = true, -- 幸运兔脚
	[3670] = true, -- 带粘液的骨头
	[6150] = true, -- 绳结
	[11406] = true, -- 腐烂的熊肉
	[11944] = true, -- 黑铁幼婴鞋
	[25402] = true, -- 有坚不摧之力
	[36812] = true, -- 基础零件
	[62072] = true, -- 罗波的摇头杖
	[67410] = true, -- 极其不祥的石头
	[221550] = true, -- 薮根伞菇
}

I.PrimordialStone = {}
for id = 204000, 204030 do
	I.PrimordialStone[id] = true
end
for id = 204573, 204579 do
	I.PrimordialStone[id] = true
end
I.PrimordialStone[203703] = true -- 棱光碎片

-- 自定义
do
	-- Item Slot
	local typeCache = {}
	function M.GetItemType(itemInfo, bagID, slotID)
		local itemID, _, _, itemEquipLoc, _, itemClassID, itemSubClassID = C_Item.GetItemInfoInstant(itemInfo)
		if not itemID then return end
		if typeCache[itemInfo] then return typeCache[itemInfo] end

		local itemType
		if I.EquipmentIDs[itemClassID] then
			itemType = I.EquipmentTypes[itemEquipLoc] or _G[itemEquipLoc]
		elseif C_ArtifactUI.GetRelicInfoByItemID(itemID) then
			itemType = RELICSLOT
		end

		if itemClassID == Enum.ItemClass.Container then
			itemType = I.ContainerTypes[itemSubClassID]
		elseif itemClassID == Enum.ItemClass.ItemEnhancement then
			itemType = I.ItemEnhancementTypes[itemSubClassID]
		elseif itemClassID == Enum.ItemClass.Recipe then
			itemType = I.RecipeTypes[itemSubClassID]
		elseif itemClassID == Enum.ItemClass.Key then
			itemType = I.KeyTypes[itemSubClassID]
		elseif itemClassID == Enum.ItemClass.Miscellaneous then
			itemType = I.MiscellaneousTypes[itemSubClassID]
		elseif itemClassID == Enum.ItemClass.Profession then
			itemType = I.ProfessionTypes[itemSubClassID]
		end

		local itemDate
		if bagID and slotID then
			itemDate = C_TooltipInfo.GetBagItem(bagID, slotID)
		else
			itemDate = C_TooltipInfo.GetHyperlink(itemInfo, nil, nil, true)
		end
		if itemDate then
			for i = 2, 8 do
				local lineData = itemDate.lines[i]
				if not lineData then break end

				local lineText = lineData.leftText
				if I.ConduitTypes[lineText] then
					itemType = I.ConduitTypes[lineText]
					break
				elseif I.CurioTypes[lineText] then
					itemType = I.CurioTypes[lineText]
					break
				elseif I.BindTypes[lineText] then
					itemType = I.BindTypes[lineText]
					break
				end
			end
		end

		if C_Item.IsAnimaItemByID(itemID) then
			itemType = POWER_TYPE_ANIMA
		elseif C_ToyBox.GetToyInfo(itemID) then
			itemType = TOY
		end

		local _, spellID = C_Item.GetItemSpell(itemID)
		if I.AncientMana[spellID] then
			itemType = "魔力"
		elseif I.DeliverRelic[spellID] then
			itemType = "研究"
		elseif I.Experience[spellID] then
			itemType = "经验"
		elseif I.Studying[spellID] then
			itemType = "知识"
		end

		if I.SpecialJunk[itemID] then
			itemType = SPECIAL
		end

		--itemType = itemClassID.." "..itemSubClassID

		typeCache[itemInfo] = itemType
		return itemType
	end

	-- Item Stat
	local statCache = {}
	function M.GetItemStat(itemInfo)
		if statCache[itemInfo] then return statCache[itemInfo] end

		local itemStat = ""
		local stats = C_Item.GetItemStats(itemInfo)
		if stats then
			for stat, count in pairs(stats) do
				if I.ItemStats[stat] then
					itemStat = itemStat.."-".._G[stat]
				end
				if string.find(stat, "EMPTY_SOCKET_") then
					itemStat = itemStat.."-"..U["Socket"]
				end

				break
			end
		end

		statCache[itemInfo] = itemStat
		return itemStat
	end

	-- Item Extra
	local extraCache = {}
	function M.GetItemExtra(itemInfo)
		if extraCache[itemInfo] then return extraCache[itemInfo] end

		local itemExtra, hasStat
		local itemType = M.GetItemType(itemInfo)
		local itemStat = M.GetItemStat(itemInfo)
		local itemLevel = M.GetItemLevel(itemInfo)

		if itemLevel and itemType then
			itemExtra = "<"..itemLevel.."-"..itemType..itemStat..">"
		elseif itemLevel then
			itemExtra = "<"..itemLevel..itemStat..">"
		elseif itemType then
			itemExtra = "<"..itemType..itemStat..">"
		end

		if itemStat ~= "" then
			hasStat = true
		end

		extraCache[itemInfo] = itemExtra
		return itemExtra, hasStat
	end

	function M.UpdatePoint(f1, p1, f2, p2, x, y)
		if not f1 then return end

		f1:ClearAllPoints()
		f1:SetPoint(p1, f2, p2, x, y)
	end

	local rtgColor = {1, 0, 0, 1, 1, 0, 0, 1, 0}
	local gtrColor = {0, 1, 0, 1, 1, 0, 1, 0, 0}
	function M.Color(cur, max, fullRed)
		local r, g, b = oUF:RGBColorGradient(cur, max, unpack(fullRed and gtrColor or rtgColor))
		return r, g, b
	end

	function M.Perc(value, fullRed)
		local per = format("%.1f%%", value)
		local r, g, b = M.Color(value, 100, fullRed)
		return M.HexRGB(r, g, b, per)
	end
end

local Button_Height = 16
local LMFrame_Width = 200

local LMFrame_Report = {}
local LMFrame_CFG = {
	maxLines = 20,
	minQuality = 3,
	inGroup = false,
}

local LM_Message_Info = {
	U["LM Message 1"],
	U["LM Message 2"],
	U["LM Message 3"],
	U["LM Message 4"],
}

local function UnitClassColor(unit)
	local r, g, b = M.UnitColor(unit)
	return M.HexRGB(r, g, b, unit)
end

local function isCollection(itemID, itemClassID, itemSubClassID)
	return (itemID and C_ToyBox.GetToyInfo(itemID)) or (I.MiscellaneousIDs[itemClassID] and I.CollectionIDs[itemSubClassID])
end

local function isEquipment(itemID, itemQuality, itemClassID)
	return ((itemID and (C_ArtifactUI.GetRelicInfoByItemID(itemID) or C_Soulbinds.IsItemConduitByItemInfo(itemID))) or (itemClassID and I.EquipmentIDs[itemClassID])) and (itemQuality and itemQuality >= LMFrame_CFG["minQuality"])
end

local LMFrame = CreateFrame("Frame", "LootMonitor", UIParent)
LMFrame:SetFrameStrata("HIGH")
LMFrame:SetClampedToScreen(true)
LMFrame:SetPoint("LEFT", 4, 0)

local LMFrame_Title = M.CreateFS(LMFrame, Button_Height-2, U["LootMonitor Title"], true, "TOPLEFT", 10, -10)
local LMFrame_Info = M.CreateFS(LMFrame, Button_Height-2, U["LootMonitor Info"], true, "BOTTOMRIGHT", -10, 10)

local function CloseLMFrame()
	table.wipe(LMFrame_Report)
	for index = 1, LMFrame_CFG["maxLines"] do
		LMFrame[index]:Hide()
	end
	LMFrame:SetSize(LMFrame_Width, Button_Height*4)
	LMFrame:Hide()
end

local function CreateLMFrame()
	M.SetBD(LMFrame)
	M.CreateMF(LMFrame)

	local LMFrame_Close = M.CreateButton(LMFrame, 18, 18, true, I.closeTex)
	LMFrame_Close:SetPoint("TOPRIGHT", -7, -7)
	LMFrame_Close:SetScript("OnClick", function(self) CloseLMFrame() end)
end

local function Button_OnClick(self, button)
	if button == "RightButton" then
		SendChatMessage(string.format(LM_Message_Info[random(4)], LMFrame_Report[self.index]["link"]), "WHISPER", nil, LMFrame_Report[self.index]["name"])
	else
		local editBox = ChatEdit_ChooseBoxForSend()
		ChatEdit_ActivateChat(editBox)
		editBox:SetText(editBox:GetText()..LMFrame_Report[self.index]["link"])
	end
end

local function Button_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 10, 0)
	GameTooltip:SetHyperlink(LMFrame_Report[self.index]["link"])
end

local function Button_OnLeave(self)
	GameTooltip:Hide()
end

local function CreateLMButton(index)
	local button = CreateFrame("Button", "LMFrame_Report"..index, LMFrame)
	button:SetHighlightTexture(I.bdTex)
	button:SetHeight(Button_Height)
	button:SetPoint("RIGHT", -10, 0)

	local hl = button:GetHighlightTexture()
	hl:SetVertexColor(1, 1, 1, .25)
	button.hl = hl

	local text = M.CreateFS(button, Button_Height-2)
	text:SetJustifyH("LEFT")
	text:SetNonSpaceWrap(true)
	text:SetPoint("LEFT", 0, 0)
	button.text = text

	button:RegisterForClicks("AnyDown")
	button:SetScript("OnClick", Button_OnClick)
	button:SetScript("OnEnter", Button_OnEnter)
	button:SetScript("OnLeave", Button_OnLeave)
	button.index = index

	if index == 1 then
		button:SetPoint("TOPLEFT", LMFrame_Title, "BOTTOMLEFT", 0, -5)
	else
		button:SetPoint("TOPLEFT", LMFrame[index - 1], "BOTTOMLEFT", 0, -1)
	end

	LMFrame[index] = button
	return button
end

local function UpdateLMFrame(self, event, ...)
	if event == "PLAYER_LOGIN" then
		CreateLMFrame()
		for index = 1, LMFrame_CFG["maxLines"] do
			CreateLMButton(index)
		end
		CloseLMFrame()
		LMFrame:UnregisterEvent(event)
	elseif event == "CHAT_MSG_LOOT" then
		if LMFrame_CFG["inGroup"] and not IsInGroup() then return end

		local lootText, lootPlayer = ...
		local itemLink
		for link in string.gmatch(lootText, "|c%x+|Hitem:.-|h.-|h|r") do
			if link then itemLink = link end
		end

		if not itemLink or string.len(lootPlayer) < 1 then return end

		local itemQuality = C_Item.GetItemQualityByID(itemLink)
		local itemID, _, _, _, _, itemClassID, itemSubClassID = C_Item.GetItemInfoInstant(itemLink)

		if isEquipment(itemID, itemQuality, itemClassID) or isCollection(itemID, itemClassID, itemSubClassID) then
			local textWidth, maxWidth = 0, 0
			local lootTime = I.InfoColor..GameTime_GetGameTime(true).."|r"
			local playerName = UnitClassColor(string.split("-", lootPlayer))

			local itemExtra, hasStat = M.GetItemExtra(itemLink)
			if hasStat then itemExtra = "|cff00FF00"..itemExtra.."|r" end
			if isCollection(itemID, itemClassID, itemSubClassID) then itemExtra = "|cff00FFFF"..itemExtra.."|r" end

			if #LMFrame_Report >= LMFrame_CFG["maxLines"] then table.remove(LMFrame_Report, 1) end

			table.insert(LMFrame_Report, {time = lootTime, player = playerName, link = itemLink, info = itemExtra, name = lootPlayer})

			local numButtons = #LMFrame_Report
			for index = 1, numButtons do
				LMFrame[index].text:SetFormattedText("%s %s %s %s", LMFrame_Report[index]["time"], LMFrame_Report[index]["player"], LMFrame_Report[index]["link"], LMFrame_Report[index]["info"])
				LMFrame[index]:Show()
				textWidth = math.floor(LMFrame[index].text:GetStringWidth() + 20.5)
				maxWidth = math.max(textWidth, maxWidth)
			end

			LMFrame:SetWidth(maxWidth)
			LMFrame:SetHeight((Button_Height+1)*(numButtons+3)+6)

			if not LMFrame:IsShown() then
				LMFrame:Show()
			end
		end
	end
end

LMFrame:RegisterEvent("CHAT_MSG_LOOT")
LMFrame:RegisterEvent("PLAYER_LOGIN")
LMFrame:SetScript("OnEvent", UpdateLMFrame)

SLASH_NDLM1 = "/ndlm"
SlashCmdList["NDLM"] = function()
	if not LMFrame:IsShown() then
		LMFrame:Show()
	else
		LMFrame:Hide()
	end
end