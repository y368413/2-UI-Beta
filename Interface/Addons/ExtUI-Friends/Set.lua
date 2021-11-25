local SETFRAME_DROPDOWN_LIST = {
    {name = "noFavorite", text = "非亲密好友"},
    {name = "BNetInWOW", text = "在魔兽中的好友"},
    {name = "BNetUnFavoriteInWOW", text = "在魔兽中的非亲密好友"},
	{name = "WOW", text = "仅魔兽好友"}
}

local function ini_Config()
    -- 默认设置
    local Defaults_Config = {
        ["rightClickWhisperRole"] = true, -- 右键私聊角色按钮
        ["setFriendsScrollFrame"] = 1, -- 好友列表滚动框体选项
    }

    -- 如果没有配置则使用默认设置
    if not ExtUI_Friends_Config then
        ExtUI_Friends_Config = Defaults_Config
    end
end



local function ini_SetFrameTab()

    -- 设置标签的ID
    FRIEND_TAB_SET = 5
    -- 修改暴雪的部分与TAB的相关变量
    FRIEND_TAB_COUNT = 5
    FriendsFrame.numTabs = FRIEND_TAB_COUNT
    tinsert(FRIENDSFRAME_SUBFRAMES, "ExtUISetFrame")

    -- 创建一个名为FriendsFrameTab5的标签。为了兼容暴雪的API，命名只能是FriendsFrameTab5。
    local Set_Tab = CreateFrame("Button", "FriendsFrameTab5", FriendsFrame, "FriendsFrameTabTemplate", FRIEND_TAB_SET)
    Set_Tab:SetPoint("LEFT" , FriendsFrameTab4 , "RIGHT" , -15 , 0)
    Set_Tab:SetText("设置")
    hooksecurefunc("FriendsFrame_Update", function ()
        local selectedTab = PanelTemplates_GetSelectedTab(FriendsFrame);
        if selectedTab == FRIEND_TAB_SET then
            FriendsFrameInset:SetPoint("TOPLEFT", 4, -60);
            FriendsFrameIcon:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait");
            FriendsFrameTitleText:SetText("设置");
            FriendsFrame_ShowSubFrame("ExtUISetFrame");
        end
    end)
end

local function ini_SetFramePanel()

    -- 创建一个用于放置控件的SetFrame的面板。
    local SetFrame = CreateFrame("Frame", "ExtUISetFrame", FriendsFrame)
    SetFrame:SetAllPoints(true)
    SetFrame:Hide()
    -- SetFrame的背景板材质，可以让组件看得更清楚。
    SetFrame.PanelBG = SetFrame:CreateTexture("SetFrameBG", "BACKGROUND")
    SetFrame.PanelBG:SetPoint("TOPLEFT" , SetFrame , 8 , -62)
    SetFrame.PanelBG:SetPoint("BOTTOMRIGHT" , SetFrame , -9 , 27)
    SetFrame.PanelBG:SetColorTexture(1.0, 1.0, 1.0, 0.2)

    -- 复选按钮1
    local CheckButton1 = CreateFrame("CheckButton", "SetFrameCheckButton1", SetFrame, "UICheckButtonTemplate")
    CheckButton1:SetPoint("TOPLEFT", SetFrame, "BOTTOMLEFT", 50, 320)
    CheckButton1:SetSize(24, 24)
    CheckButton1:SetMotionScriptsWhileDisabled(true) -- 设置按钮是否应在禁用时触发其 OnEnter 和 OnLeave 脚本
    -- 复选按钮1的功能更新函数
    CheckButton1.funUpdate = function() end
    -- 复选按钮1的标签
    CheckButton1.labelText = _G[CheckButton1:GetName().."Text"]
    CheckButton1.labelText:SetText("右键私聊角色")
    CheckButton1:SetHitRectInsets(0, -CheckButton1.labelText:GetWidth(), 0, 0) -- 扩大鼠标提示的范围
    -- 复选按钮1的鼠标提示文本
    CheckButton1.tooltip = "在好友列表的右键菜单中添加向角色发送私聊信息。"
    -- 复选按钮1的脚本
    CheckButton1:SetScript("OnEnter", function (self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    CheckButton1:SetScript("OnLeave", GameTooltip_Hide)
    CheckButton1:SetScript("OnShow", function (self)
        self:SetChecked(ExtUI_Friends_Config["rightClickWhisperRole"])
    end)
    CheckButton1:SetScript("OnClick", function(self)
        local tick = self:GetChecked()
        if tick then
            PlaySound(856) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
        else
            PlaySound(857) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
        end
        ExtUI_Friends_Config["rightClickWhisperRole"] = tick
        self:funUpdate(self) -- 执行自身的功能更新
    end)


    -- 创建下拉按钮
    local FriendsDropDownButton = CreateFrame("Button", "SetFrameDropDownButton", SetFrame, "UIDropDownMenuTemplate")
    FriendsDropDownButton:SetPoint("TOPLEFT", SetFrame, "BOTTOMLEFT", 50, 250)
    FriendsDropDownButton.Left:SetPoint("TOPLEFT",  -16, 19)
    -- 下拉按钮的描述文本
    FriendsDropDownButton.describeText = FriendsDropDownButton:CreateFontString("FriendsDropDownButtonSecribe", "ARTWORK", "GameFontNormal")
    FriendsDropDownButton.describeText:SetText("好友滚动框体内容")
    FriendsDropDownButton.describeText:SetPoint("TOPLEFT", SetFrame, "BOTTOMLEFT", 50, 270)
    -- 下拉按钮的鼠标提示文本
    FriendsDropDownButton.tooltip = "更改另一个好友滚动框体的内容。"
    -- 下拉按钮的脚本
    FriendsDropDownButton:SetScript("OnEnter", function (self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, true);
        GameTooltip:Show();
    end)
    FriendsDropDownButton:SetScript("OnLeave", GameTooltip_Hide)
    local function set_DropDownButtonWidth(frame)
        local width
        if frame.Text:GetWidth() > 140 then
            width = 180
        else
            width = 140
        end
        frame.Middle:SetWidth(width)
        frame:SetWidth(width)
    end
    local function click_DropDownMeanButton(button)
        ExtUI_Friends_Config["setFriendsScrollFrame"] = button:GetID()
        UIDropDownMenu_SetSelectedID(FriendsDropDownButton, ExtUI_Friends_Config["setFriendsScrollFrame"]);
        set_DropDownButtonWidth(FriendsDropDownButton)
    end
    FriendsDropDownButton.iniDropDownMean= function ()
        local info = UIDropDownMenu_CreateInfo();
        for i=1, getn(SETFRAME_DROPDOWN_LIST), 1 do
            info.text = SETFRAME_DROPDOWN_LIST[i].text;
            info.func = click_DropDownMeanButton;
            info.checked = nil;
            UIDropDownMenu_AddButton(info);
        end
    end
    FriendsDropDownButton:SetScript("OnShow", function (self)
        UIDropDownMenu_Initialize(self, self.iniDropDownMean)
        UIDropDownMenu_SetSelectedID(self, ExtUI_Friends_Config["setFriendsScrollFrame"]);
        set_DropDownButtonWidth(self)
    end)
    UIDropDownMenu_JustifyText(FriendsDropDownButton, "LEFT")
end


local function event_Handler(self, event, ...)
    if event == "PLAYER_LOGIN" then
        ini_Config()
    end
end

ini_SetFrameTab()
ini_SetFramePanel()
local Listener = CreateFrame('Frame', nil)
Listener:SetScript('OnEvent', event_Handler)
-- Listener:RegisterEvent("PLAYER_ENTERING_WORLD") -- 玩家进入游戏  reload结束之后也会触发 玩家进出副本（读条）后会触发
-- Listener:RegisterEvent("PLAYER_LEAVING_WORLD") -- 玩家离开游戏 reload开始之前也会触发 玩家进出副本（读条）前会触发
Listener:RegisterEvent("PLAYER_LOGIN") -- 玩家登录游戏 reload结束之后也会触发
-- Listener:RegisterEvent("PLAYER_LOGOUT") -- 玩家退出游戏 reload开始之前也会触发
-- Listener:RegisterEvent("ADDON_LOADED") -- 当任何一个插件被加载的时候触发该事件



