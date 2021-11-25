--========================================
-- 整个FriendsFrame框体的扩展。
-- 这里做一些简单且不依附于滚动框体的部分组件调整。
-- 还会做一些插件的自身的事件脚本。
--========================================
--========================================
-- 后续会添加对插件的配置。
--========================================

local OVERALLWIDTH = 690 -- 整体框体的宽度，例如FriendsFrame
local INSIDEWIDTH = 655 -- 内嵌框体的宽度，例如FrameScrollFrame
local BATTLENTIDWIDTH = 540 -- 战网ID框体的宽度，例如FriendsFrameBattlenetFrame
local initial_width_FriendsFrame = FriendsFrame:GetWidth() -- FriendsFrame的初始宽度
local initial_width_FriendsFrameBattlenetFrame = FriendsFrameBattlenetFrame:GetWidth() -- FriendsFrameBattlenetFrame的初始宽度

local function ExtFriends_OnLoad()

	-- 整个好友框体扩展
    FriendsFrame:SetWidth(OVERALLWIDTH)
	-- 战网实名好友请求的警告框体
	FriendsListFrame.RIDWarning:SetWidth(INSIDEWIDTH)

	-- 战网ID框体扩展
	FriendsFrameBattlenetFrame:SetWidth(BATTLENTIDWIDTH)
	-- 战网通告框体的位置
	FriendsFrameBattlenetFrame.BroadcastFrame:ClearAllPoints()
	FriendsFrameBattlenetFrame.BroadcastFrame:SetPoint("CENTER", FriendsFrame,"CENTER", 0,95)

end

ExtFriends_OnLoad()



--================================================================================
-- 用于测试污染
--[[
local function textfunction()
	-- print(issecurevariable(UnitPopupMenus, "WHISPER_ROLE"))
	-- /script print("DropDownList1Button15".."    ".._G["DropDownList1Button15"].value)
	-- move污染了report_player和cancel
	print(issecurevariable(AnotherFriendsListFrameScrollFrame.buttons[1], "buttons"))
	print(issecurevariable(FriendsListFrameScrollFrame, "buttons"))
	for i=1, UIDROPDOWNMENU_MAXLEVELS do
		for j=1+_G["DropDownList" .. i].numButtons, UIDROPDOWNMENU_MAXBUTTONS do
			local b = _G["DropDownList" .. i .. "Button" .. j]
			if not _G["DropDownList" .. i .. "Button" .. j].value then
				print("DropDownList" .. i .. "Button" .. j)
			else
				print("DropDownList" .. i .. "Button" .. j.."    ".._G["DropDownList" .. i .. "Button" .. j].value)
			end
			print(issecurevariable(b, "value"))
			-- if not issecurevariable(b, "value") then
			-- 	b.value = nil
			-- 	repeat
			-- 		j, b["fx" .. j] = j+1
			-- 	until issecurevariable(b, "value")
			-- end
		end
	end
end

-- 斜杠处理命令，大多数时候只是用来测试。
SLASH_EXTF1, SLASH_EXTF2 = "/EXTF", "/extf"
SlashCmdList["EXTF"] = textfunction

-- hooksecurefunc("ToggleDropDownMenu", function ()
-- 	print(issecurevariable("UIDROPDOWNMENU_MENU_VALUE"))
-- end)

-- hooksecurefunc("FriendsFrame_ShowDropdown", function ()
-- 	print(issecurevariable("UIDROPDOWNMENU_MENU_VALUE"))
-- end)
--]]
--================================================================================


-- 暂时不扩展战友招募框体
hooksecurefunc("FriendsFrame_Update", function ()
	local selectedTab = PanelTemplates_GetSelectedTab(FriendsFrame) or FRIEND_TAB_FRIENDS; -- 选择的为标签1
	if selectedTab == FRIEND_TAB_FRIENDS then
		local selectedHeaderTab = PanelTemplates_GetSelectedTab(FriendsTabHeader) or FRIEND_HEADER_TAB_FRIENDS;
		if selectedHeaderTab == FRIEND_HEADER_TAB_RAF then
			FriendsFrame:SetWidth(initial_width_FriendsFrame)
			FriendsFrameBattlenetFrame:SetWidth(initial_width_FriendsFrameBattlenetFrame)
		else
			FriendsFrame:SetWidth(690)
			FriendsFrameBattlenetFrame:SetWidth(BATTLENTIDWIDTH)
		end
	else
		FriendsFrame:SetWidth(690)
		FriendsFrameBattlenetFrame:SetWidth(BATTLENTIDWIDTH)
	end
end)


-- 修正当团队成员改变时，边框下方会改变的情况。
-- 依赖于GROUP_ROSTER_UPDATE事件
hooksecurefunc("FrameTemplate_SetButtonBarHeight", function (self, buttonBarHeight)
	self.Inset:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -6, 26);
end)