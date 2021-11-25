--========================================
-- 扩展快速加入的框体
-- 目前还有一些需要改进的地方，尚未完成。
--========================================

local function ini_QuickJoinFrame()
	QuickJoinScrollFrame:SetWidth(655)
	local QuickJoinScrollFrame_width = QuickJoinScrollFrame:GetWidth()
	QuickJoinScrollFrame.scrollChild:SetWidth(QuickJoinScrollFrame_width) -- 滚动框体

	-- 还需要设置按钮长度
	local scrollFrame = QuickJoinScrollFrame;
	local buttons = scrollFrame.buttons;
	local entries = QuickJoinFrame.entries:GetEntries(); -- entries是一个数组，用于存放整个快速加入的列表，类似于AnotherFriendListEntries

	for i = 1, #buttons do
		local button = buttons[i]; -- 具体的一个按钮
		local Queues = #button.Queues
		local Queue = button.Queues[1]
		-- Queue:SetPoint("LEFT", button.Queues[i-1], "LEFT", 0, -QUICK_JOIN_NAME_SEPARATION); -- 可以修改QUICK_JOIN_NAME_SEPARATION的值来改变位置

		-- 修改按钮的长度，用来间接改变按钮的Enter区域
		button:SetWidth(QuickJoinScrollFrame_width)

		for j = 1, #entries do
			local entrie = entries[i] -- button.Members[j] 等于 entrie 多少个成员
			-- button.Members[j]:
			-- button.Members[j] --按钮中的每个成员。Members是一个数组，而不是一个部件。数组Members中存放的是部件CreateFontString（QuickJoinButtonMemberTemplate）
			-- 每有一个成员创建一个部件，
		end



		-- button.Members[1]:SetPoint()
		-- button.Icon[1]:SetPoint()
		button.Queues[1]:SetPoint("LEFT", button, "LEFT", 0, 300)

		-- 设置按钮字符串的值
		-- print(button.Members[1]:GetWidth())-- 名字 80
		-- 是不是可以把名字的size设为nil啊
		-- print(button.Members[1].name)-- 名字
		-- button.Members[1]:SetWidth(400) -- 名称 这里的意思是按钮中的第一个成员设置了400像素的长度。
		local bwidthe = button.Members[1]:GetWidth()
		-- button:SetEntry(entries[entryIndex]);
		-- print(QuickJoinScrollFrame.buttons[1].Members[1].displayedMembers)
		-- print(QuickJoinScrollFrame.displayedMembers)
		-- button.Variable:SetWidth(100) -- 地区

		-- 锚点是按照父框体来设计的，而不是按照成员名称来设计的
	end
end


ini_QuickJoinFrame()