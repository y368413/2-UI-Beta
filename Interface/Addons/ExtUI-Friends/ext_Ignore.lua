--========================================
-- 屏蔽列表的扩展。
-- 屏蔽列表的功能相对简单，也不是那么重要。
-- 可以尝试将列表中的名称颜色设置成其职业颜色。
--========================================

-- IgnoreListFrame
-- IgnoreListFrameScrollFrame 继承自 FriendsFrameScrollFrame
local function ini_IgnoreFrame()
    local scrollFrame = IgnoreListFrameScrollFrame
    scrollFrame:SetWidth(655)
end

ini_IgnoreFrame()