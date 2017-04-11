
--------------------------------------- 右鍵菜單增強-------------------------------------
local UnitPopupButtonsExtra = {
    ["ARMORY"] = { enUS ="Armory",          zhCN = "英雄榜",   zhTW = "英雄榜" },
    ["SEND_WHO"] = { enUS ="Query Detail",  zhCN = "玩家详情", zhTW = "玩家详情" },
    ["NAME_COPY"] = { enUS ="Get Name",     zhCN = "获取名字", zhTW = "獲取名字" },
    ["GUILD_ADD"] = { enUS ="Guild Invite", zhCN = "公会邀请", zhTW = "公會邀請" },
    ["FRIEND_ADD"] = { enUS ="Add Friend",  zhCN = "添加好友", zhTW = "添加好友" },
}

for k, v in pairs(UnitPopupButtonsExtra) do
    v.dist = 0
    v.text = v[GetLocale()] or k
    UnitPopupButtons[k] = v
end

tinsert(UnitPopupMenus["FRIEND"], 1, "ARMORY")
tinsert(UnitPopupMenus["FRIEND"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["FRIEND"], 1, "SEND_WHO")
tinsert(UnitPopupMenus["FRIEND"], 1, "FRIEND_ADD")
tinsert(UnitPopupMenus["FRIEND"], 1, "GUILD_ADD")

tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "SEND_WHO")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "FRIEND_ADD")
tinsert(UnitPopupMenus["CHAT_ROSTER"], 1, "INVITE")

tinsert(UnitPopupMenus["GUILD"], 1, "ARMORY")
tinsert(UnitPopupMenus["GUILD"], 1, "NAME_COPY")
tinsert(UnitPopupMenus["GUILD"], 1, "FRIEND_ADD")

local function urlencode(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c)
            return format("%%%02X", string.byte(c))
        end)
    return string.gsub(s, " ", "+")
end

local function popupClick(self, info)
    local host, editBox
    local name, server = UnitName(info.unit)
    if (info.value == "ARMORY") then
        if (GetLocale() == "zhTW") then
            host = "http://tw.battle.net/wow/zh/character/"
        elseif (GetLocale() == "zhCN") then
            host = "http://www.battlenet.com.cn/wow/zh/character/"
        else
            host = "http://us.battle.net/wow/en/character/"
        end
        local armory = host .. urlencode(server or GetRealmName()) .. "/" .. urlencode(name) .. "/advanced"
        editBox = ChatEdit_ChooseBoxForSend()
        ChatEdit_ActivateChat(editBox)
        editBox:SetText(armory)
        editBox:HighlightText()
    elseif (info.value == "NAME_COPY") then
        editBox = ChatEdit_ChooseBoxForSend()
        local hasText = (editBox:GetText() ~= "")
        ChatEdit_ActivateChat(editBox)
        editBox:Insert(name)
        if (not hasText) then editBox:HighlightText() end
    end
end

hooksecurefunc("UnitPopup_ShowMenu", function(dropdownMenu, which, unit, name, userData)
    if (LIB_UIDROPDOWNMENU_MENU_LEVEL > 1) then return end
    if (unit and (unit == "target" or string.find(unit, "party"))) then
        local info
        if (UnitIsPlayer(unit)) then
            info = Lib_UIDropDownMenu_CreateInfo()
            info.text = UnitPopupButtonsExtra["ARMORY"].text
            info.arg1 = {value="ARMORY",unit=unit}
            info.func = popupClick
            info.notCheckable = true
            Lib_UIDropDownMenu_AddButton(info)
        end
        info = Lib_UIDropDownMenu_CreateInfo()
        info.text = UnitPopupButtonsExtra["NAME_COPY"].text
        info.arg1 = {value="NAME_COPY",unit=unit}
        info.func = popupClick
        info.notCheckable = true
        Lib_UIDropDownMenu_AddButton(info)
    end
end)

hooksecurefunc("UnitPopup_OnClick", function(self)
	local unit = UIDROPDOWNMENU_INIT_MENU.unit
	local name = UIDROPDOWNMENU_INIT_MENU.name
	local server = UIDROPDOWNMENU_INIT_MENU.server
	local fullname = name
    local host, editBox
	if (server and (not unit or UnitRealmRelationship(unit) ~= LE_REALM_RELATION_SAME)) then
		fullname = name .. "-" .. server
	end
    if (self.value == "ARMORY") then
        if (GetLocale() == "zhTW") then
            host = "http://tw.battle.net/wow/zh/character/"
        elseif (GetLocale() == "zhCN") then
            host = "http://www.battlenet.com.cn/wow/zh/character/"
        else
            host = "http://us.battle.net/wow/en/character/"
        end
        local armory = host .. urlencode(server or GetRealmName()) .. "/" .. urlencode(name) .. "/advanced"
        editBox = ChatEdit_ChooseBoxForSend()
        ChatEdit_ActivateChat(editBox)
        editBox:SetText(armory)
        editBox:HighlightText()
    elseif (self.value == "NAME_COPY") then
        editBox = ChatEdit_ChooseBoxForSend()
        local hasText = (editBox:GetText() ~= "")
        ChatEdit_ActivateChat(editBox)
        editBox:Insert(fullname)
        if (not hasText) then editBox:HighlightText() end
    elseif (self.value == "FRIEND_ADD") then
        AddFriend(fullname)
    elseif (self.value == "SEND_WHO") then
        SendWho("n-" .. name)
    elseif (self.value == "GUILD_ADD") then
        GuildInvite(fullname)
    end
end)
