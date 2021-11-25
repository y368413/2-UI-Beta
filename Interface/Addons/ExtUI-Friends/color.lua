--========================================
-- 这部分是根据好友角色的职业对按钮进行上色。
-- 这功能的灵感来自FriendListColors插件。
-- 但FriendListColors会导致插件污染，无法在好友的团队中正常使用设置焦点和赋予权限。
-- 我使用了相对安全的方式来重新实现上色功能，
-- 虽然还没有进行充分测试，但目前已经可以很好的运行了。
--========================================
-- 内存占用：最高9MiB左右，最低5KiB
--========================================
local CLASS_COLORS = {} -- 用于存放职业名称本地化与原本名称的映射
for classFile, className in pairs(LOCALIZED_CLASS_NAMES_MALE) do
    CLASS_COLORS[className] = classFile
end

local function color_change(button)
    -- local index = button.index
    local buttonType = button.buttonType
    local id = button.id
    local nameText
    if buttonType == FRIENDS_BUTTON_TYPE_WOW then -- 魔兽
        local info = C_FriendList.GetFriendInfoByIndex(id)
        local connected = info.connected -- 是否在线
        local name = info.name -- 角色名称
        local level = info.level -- 角色等级
        local className = info.className -- 角色职业（本地化）
        local classFile = CLASS_COLORS[className] -- 职业名称（原文）

        if connected then
            local levelColor = GetQuestDifficultyColor(level) -- 获取等级颜色（按照任务颜色的规则）
            local levelColorMixin = CreateColor(levelColor.r, levelColor.g, levelColor.b) -- 获取等级颜色的Mixin
            local levelText = levelColorMixin:WrapTextInColorCode("L"..level) -- 用转义序列包装等级文本
            local classColorMixin = C_ClassColor.GetClassColor(classFile) -- 获取职业颜色的Mixin
            nameText = classColorMixin:WrapTextInColorCode(name) -- 用转义序列包装名称文本
            nameText = levelText.." "..nameText
            button.name:SetText(nameText)
        end
    elseif buttonType == FRIENDS_BUTTON_TYPE_BNET then -- 战网
        local accountInfo = C_BattleNet.GetFriendAccountInfo(id) -- 战网信息（table）
        local accountName = accountInfo.accountName -- 战网名称
        local isFavoriteFriend = accountInfo.isFavorite -- 是否亲密好友
        local gameAccountInfo = accountInfo.gameAccountInfo -- 游戏角色信息（table）
        local characterName = gameAccountInfo.characterName -- 游戏角色名
        local characterLevel = gameAccountInfo.characterLevel -- 游戏角色等级
        local className = gameAccountInfo.className -- 职业名称（本地化）
        local classFile = CLASS_COLORS[className] -- 职业名称（原文）
        -- local isOnline = gameAccountInfo.isOnline -- 是否在线（如果是其它客户端或版本或阵营，则为false）
        local wowProjectID = gameAccountInfo.wowProjectID -- 魔兽版本
        local factionName = gameAccountInfo.factionName -- 阵营（联盟或部落，"Alliance"或"Horde"）
        local player_faction = UnitFactionGroup("PLAYER") -- 自己的角色所在的阵营(联盟或部落，"Alliance"或"Horde")
        local isSameFaction = player_faction == factionName -- 是否与你的当前角色是相同阵营

        if accountInfo then
            if characterName then
                -- WOW_PROJECT_MAINLINE 正式服
                -- WOW_PROJECT_CLASSIC 怀旧服
                -- INVITE_RESTRICTION_WOW_PROJECT_CLASSIC 燃烧远征
                if wowProjectID == WOW_PROJECT_MAINLINE and isSameFaction then
                    nameText = accountName.."("..characterName..")"
                    local levelColor = GetQuestDifficultyColor(characterLevel) -- 获取等级颜色（按照任务颜色的规则）
                    local levelColorMixin = CreateColor(levelColor.r, levelColor.g, levelColor.b) -- 获取等级颜色的Mixin
                    local levelText = levelColorMixin:WrapTextInColorCode("L"..characterLevel) -- 用转义序列包装等级文本
                    local classColorMixin = C_ClassColor.GetClassColor(classFile) -- 获取职业颜色的Mixin
                    nameText = classColorMixin:WrapTextInColorCode(nameText) -- 用转义序列包装名称文本
                    nameText = levelText.." "..nameText
                    button.name:SetText(nameText);
                else
                    local classColorMixin = C_ClassColor.GetClassColor(classFile) -- 获取职业颜色的Mixin
                    local levelColor = GetQuestDifficultyColor(characterLevel) -- 获取等级颜色（按照任务颜色的规则）
                    local FRIENDS_GRAY_COLOR = CreateColor(0.486, 0.518, 0.541);
                    local levelColorMixin = CreateColor(levelColor.r, levelColor.g, levelColor.b) -- 获取等级颜色的Mixin
                    local characterNameColorMixin = CreateColor(FRIENDS_GRAY_COLOR.r, FRIENDS_GRAY_COLOR.g, FRIENDS_GRAY_COLOR.b) -- 获取角色名称颜色的Mixin
                    local levelText = levelColorMixin:WrapTextInColorCode("L"..characterLevel) -- 用转义序列包装等级文本
                    local accountNameText = classColorMixin:WrapTextInColorCode(accountName) -- 用转义序列包装名称文本
                    local characterNameText = characterNameColorMixin:WrapTextInColorCode(characterName) -- 用转义序列包装角色名字文本
                    nameText = accountNameText.."("..characterNameText..")"
                    nameText = levelText.." "..nameText
                    button.name:SetText(nameText);
                end
            end

            -- 重新设置位于亲密好友后面的星星的位置。
            if isFavoriteFriend then
                button.Favorite:ClearAllPoints()
                button.Favorite:SetPoint("TOPLEFT", button.name, "TOPLEFT", button.name:GetStringWidth(), 0);
            end
        end
    end
end

hooksecurefunc("FriendsFrame_UpdateFriendButton", color_change)
if AnotherFriendsFrame_UpdateFriendButton then
    hooksecurefunc("AnotherFriendsFrame_UpdateFriendButton", color_change)
end