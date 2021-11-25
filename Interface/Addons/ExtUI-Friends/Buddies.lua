--========================================
-- 移植MyBuddies插件，原作者是Kyhze。
-- 这部分其实还没有进行充分的测试，
-- 但我想它应该可以运行得很好。
-- 后续会添加其它的功能。
--========================================
-- 内存占用：最高6KiB，最低5KiB
--========================================

-- Buddies按钮的初始化
local function ini_BuddiesButton()

    -- 好友数量按钮
    local FriendsNumButton = CreateFrame("Button", "ExtUIFriendsNumButton", FriendsListFrame)
    FriendsNumButton:SetSize(70, 22)
    FriendsNumButton:SetPoint("TOPRIGHT", -10, -58)
    -- 好友数量按钮的背景
    FriendsNumButton.buttonBG = FriendsNumButton:CreateTexture("ExtUIFriendsNumButtonBG", "BACKGROUND")
    FriendsNumButton.buttonBG:SetAllPoints(true)
    FriendsNumButton.buttonBG:SetTexture("Interface\\FriendsFrame\\battlenet-friends-main")
    FriendsNumButton.buttonBG:SetTexCoord(0.00390625, 0.74609375, 0.00195313, 0.05859375)
    -- 好友数量按钮的文字
    FriendsNumButton.buttonFontString = FriendsNumButton:CreateFontString("ExtUIFriendsNumButtonFontString", "ARTWORK", "GameFontNormal")
    FriendsNumButton.buttonFontString:SetPoint("CENTER")
    FriendsNumButton.buttonFontString:SetTextColor(0.345, 0.667, 0.867)
    -- 好友数量按钮的脚本
    FriendsNumButton.funUpdate = function ()
        local bnetCount = BNGetNumFriends().."|cff416380/200|r"
        FriendsNumButton.buttonFontString:SetText(bnetCount)
    end
    FriendsNumButton:SetScript("OnShow",function (self)
        self:funUpdate()
    end)
    FriendsNumButton:SetScript("OnEvent", function (self, event, ...)
        if event == "BN_FRIEND_LIST_SIZE_CHANGED" then
            self:funUpdate()
        end
    end)
    -- 屏蔽数量按钮的注册事件
    FriendsNumButton:RegisterEvent("BN_FRIEND_LIST_SIZE_CHANGED")

    -- 屏蔽数量按钮
    local IgnoreNumButton = CreateFrame("Button", "IgnoreNumFrame", IgnoreListFrame)
    IgnoreNumButton:SetSize(70, 22)
    IgnoreNumButton:SetPoint("TOPRIGHT", -10, -58)
    -- 屏蔽数量按钮的背景
    IgnoreNumButton.buttonBG = IgnoreNumButton:CreateTexture("ExtUIIgnoreNumButtonBG", "BACKGROUND")
    IgnoreNumButton.buttonBG:SetAllPoints(true)
    IgnoreNumButton.buttonBG:SetTexture("Interface\\FriendsFrame\\battlenet-friends-main")
    IgnoreNumButton.buttonBG:SetTexCoord(0.00390625, 0.74609375, 0.00195313, 0.05859375)
    -- 屏蔽数量按钮的文字
    IgnoreNumButton.buttonFontString = IgnoreNumButton:CreateFontString("ExtUIIgnoreNumButtonFontString", "ARTWORK", "GameFontNormal")
    IgnoreNumButton.buttonFontString:SetPoint("CENTER")
    IgnoreNumButton.buttonFontString:SetTextColor(0.345, 0.667, 0.867)
    -- 屏蔽数量按钮的脚本
    IgnoreNumButton.funUpdate = function ()
        local IgnoreCount = C_FriendList.GetNumIgnores().."|cff416380/50|r"
        IgnoreNumButton.buttonFontString:SetText(IgnoreCount)
    end
    IgnoreNumButton:SetScript("OnShow",function (self)
        self:funUpdate()
    end)
    IgnoreNumButton:SetScript("OnEvent", function (self, event, ...)
        if  event == "IGNORELIST_UPDATE" then
            self:funUpdate()
        end
    end)
    -- 屏蔽数量按钮的注册事件
    IgnoreNumButton:RegisterEvent("IGNORELIST_UPDATE")
end

local function event_Handler(self, event, ...)

	if event == "PLAYER_LOGIN" then
        if IsAddOnLoaded("MyBuddies") then
            return
        end
        ini_BuddiesButton()
	end
end

local Listener = CreateFrame("Frame")
Listener:RegisterEvent("PLAYER_LOGIN")
Listener:SetScript("OnEvent", event_Handler)