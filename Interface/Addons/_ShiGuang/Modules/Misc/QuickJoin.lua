﻿local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

--[[
	QuickJoin 优化系统自带的预创建功能
	1.修复简中语系的一个报错
	2.双击搜索结果，快速申请
	3.自动隐藏部分窗口
]]
local select, wipe, sort = select, wipe, sort
local UnitClass, UnitGroupRolesAssigned = UnitClass, UnitGroupRolesAssigned
local StaticPopup_Hide, HideUIPanel = StaticPopup_Hide, HideUIPanel
local C_Timer_After = C_Timer.After
local C_LFGList_GetSearchResultMemberInfo = C_LFGList.GetSearchResultMemberInfo
local ApplicationViewerFrame = _G.LFGListFrame.ApplicationViewer
local LFG_LIST_GROUP_DATA_ATLASES = _G.LFG_LIST_GROUP_DATA_ATLASES

function MISC:HookApplicationClick()
	if LFGListFrame.SearchPanel.SignUpButton:IsEnabled() then
		LFGListFrame.SearchPanel.SignUpButton:Click()
	end
	if LFGListApplicationDialog:IsShown() and LFGListApplicationDialog.SignUpButton:IsEnabled() then
		LFGListApplicationDialog.SignUpButton:Click()
	end
end

local pendingFrame
function MISC:DialogHideInSecond()
	if not pendingFrame then return end

	if pendingFrame.informational then
		StaticPopupSpecial_Hide(pendingFrame)
	elseif pendingFrame == "LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS" then
		StaticPopup_Hide(pendingFrame)
	end
	pendingFrame = nil
end

function MISC:HookDialogOnShow()
	pendingFrame = self
	C_Timer_After(1, MISC.DialogHideInSecond)
end

local roleCache = {}
local roleOrder = {
	["TANK"] = 1,
	["HEALER"] = 2,
	["DAMAGER"] = 3,
}
local roleAtlas = {
	[1] = "groupfinder-icon-role-large-tank",
	[2] = "groupfinder-icon-role-large-heal",
	[3] = "groupfinder-icon-role-large-dps",
}

local function sortRoleOrder(a, b)
	if a and b then
		return a[1] < b[1]
	end
end

local function GetPartyMemberInfo(index)
	local unit = "player"
	if index > 1 then unit = "party"..(index-1) end

	local class = select(2, UnitClass(unit))
	if not class then return end
	local role = UnitGroupRolesAssigned(unit)
	if role == "NONE" then role = "DAMAGER" end
	return role, class
end

local function GetCorrectRoleInfo(frame, i)
	if frame.resultID then
		return C_LFGList_GetSearchResultMemberInfo(frame.resultID, i)
	elseif frame == ApplicationViewerFrame then
		return GetPartyMemberInfo(i)
	end
end

local function UpdateGroupRoles(self)
	wipe(roleCache)

	if not self.__owner then
		self.__owner = self:GetParent():GetParent()
	end

	local count = 0
	for i = 1, 5 do
		local role, class = GetCorrectRoleInfo(self.__owner, i)
		local roleIndex = role and roleOrder[role]
		if roleIndex then
			count = count + 1
			if not roleCache[count] then roleCache[count] = {} end
			roleCache[count][1] = roleIndex
			roleCache[count][2] = class
		end
	end

	sort(roleCache, sortRoleOrder)
end

function MISC:ReplaceGroupRoles(numPlayers, _, disabled)
	UpdateGroupRoles(self)

	for i = 1, 5 do
		local icon = self.Icons[i]
		if not icon.role then
			if i == 1 then
				icon:SetPoint("RIGHT", -5, -2)
			else
				icon:ClearAllPoints()
				icon:SetPoint("RIGHT", self.Icons[i-1], "LEFT", 2, 0)
			end
			icon:SetSize(26, 26)

			icon.role = self:CreateTexture(nil, "OVERLAY")
			icon.role:SetSize(17, 17)
			icon.role:SetPoint("TOPLEFT", icon, -4, 5)
		end

		if i > numPlayers then
			icon.role:Hide()
		else
			icon.role:Show()
			icon.role:SetDesaturated(disabled)
			icon.role:SetAlpha(disabled and .5 or 1)
		end
	end

	local iconIndex = numPlayers
	for i = 1, #roleCache do
		local roleInfo = roleCache[i]
		if roleInfo then
			local icon = self.Icons[iconIndex]
			icon:SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[roleInfo[2]])
			icon.role:SetAtlas(roleAtlas[roleInfo[1]])
			iconIndex = iconIndex - 1
		end
	end

	for i = 1, iconIndex do
		self.Icons[i].role:SetAtlas(nil)
	end
end

function MISC:QuickJoin()
	for i = 1, 10 do
		local bu = _G["LFGListSearchPanelScrollFrameButton"..i]
		if bu then
			bu:HookScript("OnDoubleClick", MISC.HookApplicationClick)
		end
	end

	hooksecurefunc("LFGListInviteDialog_Accept", function()
		if PVEFrame:IsShown() then HideUIPanel(PVEFrame) end
	end)

	hooksecurefunc("StaticPopup_Show", MISC.HookDialogOnShow)
	hooksecurefunc("LFGListInviteDialog_Show", MISC.HookDialogOnShow)

	hooksecurefunc("LFGListGroupDataDisplayEnumerate_Update", MISC.ReplaceGroupRoles)
end
MISC:RegisterMisc("QuickJoin", MISC.QuickJoin)