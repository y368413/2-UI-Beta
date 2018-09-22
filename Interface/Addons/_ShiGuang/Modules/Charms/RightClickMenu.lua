
--------------------------------------- 右鍵菜單增強  by M-------------------------------------
local _, ns = ...
local M, R, U, I = unpack(ns)
local UnitPopupButtonsExtra = {
    --["ARMORY"] = { text = BATTLENET_OPTIONS_LABEL },
    ["SEND_WHO"] = { text = PLAYER_MESSAGES },
    ["NAME_COPY"] = { text = COPY_NAME },
    ["GUILD_ADD"] = { text = GUILD_INVITE_JOIN  },
    ["FRIEND_ADD"] = { text = ADD_FRIEND },
    ["SHOW_PET"] = { text = PET_SHOW_IN_JOURNAL },
    --["QUICK_REPORT"] = { text = REPORT_VERBAL_HARASSMENT }, -- REPORT_SPAM
    --["MYSTATS"] = { text = PAPERDOLL_SIDEBAR_STATS },
}

for k, v in pairs(UnitPopupButtonsExtra) do
	UnitPopupButtons[k] = v
end

--tinsert(UnitPopupMenus["FRIEND"], 1, "QUICK_REPORT")
--tinsert(UnitPopupMenus["FRIEND"], 1, "ARMORY")
--tinsert(UnitPopupMenus["FRIEND"], 1, "MYSTATS")
tinsert(UnitPopupMenus["FRIEND"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["FRIEND"], 1, "SEND_WHO")
tinsert(UnitPopupMenus["FRIEND"], 1, "FRIEND_ADD")
tinsert(UnitPopupMenus["FRIEND"], 1, "GUILD_ADD")

tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "SEND_WHO")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "FRIEND_ADD")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "INVITE")

--tinsert(UnitPopupMenus["GUILD"], 1, "ARMORY")
tinsert(UnitPopupMenus["GUILD"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["GUILD"], 1, "FRIEND_ADD")

--[[local function urlencode(s)
	if not s then return end
	s = string.gsub(s, "([^%w%.%- ])", function(c)
		return format("%%%02X", string.byte(c))
	end)
	return string.gsub(s, " ", "+")
end

local function gethost()
	local host
	if I.Client == "zhCN" then
		host = "https://www.wowchina.com/zh-cn/character/"
	elseif I.Client == "zhTW" then
		host = "https://worldofwarcraft.com/zh-tw/character/"
	else
		host = ("http://worldofwarcraft.com/en-%s/character/"):format(GetCVar("portal"))
	end
	return host
end]]

local function popupClick(_, info)
	local editBox
	local name, server = UnitName(info.unit)
	--if info.value == "ARMORY" then
		--local armory = gethost()..urlencode(server or GetRealmName()).."/"..urlencode(name)
		--editBox = ChatEdit_ChooseBoxForSend()
		--ChatEdit_ActivateChat(editBox)
		--editBox:SetText(armory)
		--editBox:HighlightText()
	--else
	if info.value == "NAME_COPY" then
		if server and server ~= "" then name = name.."-"..server end

		if SendMailNameEditBox and SendMailNameEditBox:IsVisible() then
			SendMailNameEditBox:SetText(name)
			SendMailNameEditBox:HighlightText()
		else
			editBox = ChatEdit_ChooseBoxForSend()
			local hasText = (editBox:GetText() ~= "")
			ChatEdit_ActivateChat(editBox)
			editBox:Insert(name)
			if not hasText then editBox:HighlightText() end
		end
	elseif info.value == "SHOW_PET" then
		if not CollectionsJournal then CollectionsJournal_LoadUI() end
		if not CollectionsJournal:IsShown() then ShowUIPanel(CollectionsJournal) end
		CollectionsJournal_SetTab(CollectionsJournal, 2)
		PetJournal_SelectSpecies(PetJournal, UnitBattlePetSpeciesID(info.unit))
	end
end

hooksecurefunc("UnitPopup_ShowMenu", function(_, _, unit)
	if MSA_DROPDOWNMENU_MENU_LEVEL > 1 then return end
	if unit and (unit == "target" or string.find(unit, "party") or string.find(unit, "raid")) then
		local info
		--if UnitIsPlayer(unit) then
			--info = MSA_DropDownMenu_CreateInfo()
			--info.text = UnitPopupButtonsExtra["ARMORY"].text
			--info.arg1 = {value = "ARMORY", unit = unit}
			--info.func = popupClick
			--info.notCheckable = true
			--MSA_DropDownMenu_AddButton(info)
		--else
		if UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit) then
			info = MSA_DropDownMenu_CreateInfo()
			info.text = UnitPopupButtonsExtra["SHOW_PET"].text
			info.arg1 = {value = "SHOW_PET", unit = unit}
			info.func = popupClick
			info.notCheckable = true
			MSA_DropDownMenu_AddButton(info)
		end

		info = MSA_DropDownMenu_CreateInfo()
		info.text = UnitPopupButtonsExtra["NAME_COPY"].text
		info.arg1 = {value = "NAME_COPY", unit = unit}
		info.func = popupClick
		info.notCheckable = true
		MSA_DropDownMenu_AddButton(info)
	end
end)

hooksecurefunc("UnitPopup_OnClick", function(self)
	local unit = UIDROPDOWNMENU_INIT_MENU.unit
	local name = UIDROPDOWNMENU_INIT_MENU.name
	local server = UIDROPDOWNMENU_INIT_MENU.server
	local lineID = UIDROPDOWNMENU_INIT_MENU.lineID
	local localtion = UIDROPDOWNMENU_INIT_MENU.playerLocation
	local fullname = name
	local editBox
	if server and (not unit or UnitRealmRelationship(unit) ~= LE_REALM_RELATION_SAME) then
		fullname = name.."-"..server
	end
	--if self.value == "ARMORY" then
		--local armory = gethost()..urlencode(server or GetRealmName()).."/"..urlencode(name).."/advanced"
		--editBox = ChatEdit_ChooseBoxForSend()
		--ChatEdit_ActivateChat(editBox)
		--editBox:SetText(armory)
		--editBox:HighlightText()
    --elseif self.value == "MYSTATS" then
        --SendChatMessage(format("%s:%.1f", ITEM_LEVEL_ABBR, select(2,GetAverageItemLevel())), "WHISPER", nil, fullname)
        --SendChatMessage(format(" - %s:%.2f%%", STAT_HASTE, GetHaste()), "WHISPER", nil, fullname)
        --SendChatMessage(format(" - %s:%.2f%%", STAT_MASTERY, GetMasteryEffect()), "WHISPER", nil, fullname)
        --SendChatMessage(format(" - %s:%.2f%%", STAT_LIFESTEAL, GetLifesteal()), "WHISPER", nil, fullname)
        --SendChatMessage(format(" - %s:%.2f%%", STAT_VERSATILITY, GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)), "WHISPER", nil, fullname)
	--else
	if self.value == "NAME_COPY" then
		if SendMailNameEditBox and SendMailNameEditBox:IsVisible() then
			SendMailNameEditBox:SetText(fullname)
			SendMailNameEditBox:HighlightText()
		else
			editBox = ChatEdit_ChooseBoxForSend()
			local hasText = (editBox:GetText() ~= "")
			ChatEdit_ActivateChat(editBox)
			editBox:Insert(fullname)
			if not hasText then editBox:HighlightText() end
		end
	elseif self.value == "FRIEND_ADD" then
		AddFriend(fullname)
	elseif self.value == "SEND_WHO" then
		SendWho("n-"..name)
	elseif self.value == "GUILD_ADD" then
		GuildInvite(fullname)
	--elseif self.value == "QUICK_REPORT" then
		--PlayerReportFrame:InitiateReport(PLAYER_REPORT_TYPE_SPAM, fullname, localtion)
		--PlayerReportFrame.ReportButton:Click()
	end
end)
