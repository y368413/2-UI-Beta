--========================================
-- 扩展Who的查询列表。
-- 删除了下拉选项，自接将其变成标签。
-- 这样可以看起来更加的直观和漂亮。
--========================================
--========================================
-- 后续希望可以提高一下刷新按钮的更新效率。
--========================================
local function ini_WhoFrame()

	local who_sortType_list = WHOFRAME_DROPDOWN_LIST

	local scrollFrame = WhoListScrollFrame;
	scrollFrame:SetWidth(655)
	local WhoListScrollFrame_width = scrollFrame:GetWidth()
	WhoFrameEditBox:SetWidth(WhoListScrollFrame_width) -- 编辑栏
	scrollFrame.scrollChild:SetWidth(WhoListScrollFrame_width) -- 滚动框体

	-- 稍微调整WhoFrameTotals的位置
	WhoFrameTotals:SetPoint("BOTTOM", "WhoFrameEditBoxInset","TOP",0,2)

	-- 取消下拉菜单。
	-- 但需要给个默认值，否则下拉菜单的返回值为空白，会导致不显示地区信息。
	WhoFrameDropDown:Hide()
	WhoFrameDropDown.selectedID = 1

	-- 把下拉菜单的地区排序功能嫁接到地区标签上。
	WhoFrameColumnHeader2:SetText("地区")
	WhoFrameColumnHeader2:SetScript("OnClick",function ()
		C_FriendList.SortWho(who_sortType_list[1].sortType); -- 地区排序
	end)

	-- 新创建标签页-公会
	local tag_guild = CreateFrame("Button", "WhoFrameColumnHeader5" , WhoFrameColumnHeader4:GetParent(), "WhoFrameColumnHeaderTemplate")
	tag_guild:SetPoint("LEFT", WhoFrameColumnHeader4, "RIGHT", -2, 0)
	tag_guild:SetText("公会")
	tag_guild:SetScript("OnClick",function ()
		C_FriendList.SortWho(who_sortType_list[2].sortType); -- 公会排序
	end)

	-- 新创建标签页-种族
	local tag_race = CreateFrame("Button", "WhoFrameColumnHeader6" , WhoFrameColumnHeader5:GetParent(), "WhoFrameColumnHeaderTemplate")
	tag_race:SetPoint("LEFT", WhoFrameColumnHeader5, "RIGHT", -2, 0)
	tag_race:SetText("种族")
	tag_race:SetScript("OnClick",function ()
		C_FriendList.SortWho(who_sortType_list[3].sortType); -- 种族排序
	end)

	-- 设置WHO上方标签的长度，同时影响标签高亮材质
	WhoFrameColumn_SetWidth(WhoFrameColumnHeader1, 160) -- 名字
	WhoFrameColumn_SetWidth(WhoFrameColumnHeader2, 110) -- 地区
	WhoFrameColumn_SetWidth(WhoFrameColumnHeader3, 40) -- 等级
	WhoFrameColumn_SetWidth(WhoFrameColumnHeader4, 80) -- 职业
	WhoFrameColumn_SetWidth(tag_guild, 170) -- 公会
	WhoFrameColumn_SetWidth(tag_race, 100) -- 种族

	-- 为childchild中的按钮添加新的字符串。分别为公会Guild，和种族Race，层级为BORDER，继承自GameFontHighlightSmall。
	-- 参考：
	-- https://wowpedia.fandom.com/wiki/UIOBJECT_FontString
	-- https://wowpedia.fandom.com/wiki/XML/FontString
	-- https://wowpedia.fandom.com/wiki/API_Frame_CreateFontString
	local buttons = scrollFrame.buttons;
	for i = 1, #buttons do
		local button = buttons[i];

		-- 修改按钮的长度，用来间接改变按钮的Enter区域
		button:SetWidth(WhoListScrollFrame_width)
		-- /script WhoListScrollFrame.buttons[2].Variable:SetWidth(150) -- 也用这个方法改变宽度

		-- 修改按钮的高亮材质
		local button_HighlightTexture = button:GetHighlightTexture()
		button_HighlightTexture:SetWidth(WhoListScrollFrame_width)

		-- 为按钮创建公会字符串区域
		button.Guild = button:CreateFontString(nil, "BORDER", "GameFontHighlightSmall") -- 自引用
		button.Guild:SetPoint("LEFT",button.Class, "RIGHT",2,0)
		button.Guild:SetWordWrap(false) -- 不换行
		button.Guild:SetJustifyH("LEFT") -- 左对齐

		-- 为按钮创建种族字符串区域
		button.Race = button:CreateFontString(nil, "BORDER", "GameFontHighlightSmall") -- 自引用
		button.Race:SetPoint("LEFT",button.Guild, "RIGHT",2,0)
		button.Race:SetWordWrap(false) -- 不换行
		button.Race:SetJustifyH("LEFT") -- 左对齐

		-- 设置按钮字符串的值
		button.Name:SetWidth(150) -- 名称
		button.Variable:SetWidth(100) -- 地区
		button.Level:SetWidth(40) -- 等级
		button.Class:SetWidth(70) -- 职业
		button.Guild:SetWidth(170) -- 公会
		button.Race:SetWidth(100) -- 种族
	end
end

local function hook_Wholist()
	local scrollFrame = WhoListScrollFrame;
	local buttons = scrollFrame.buttons;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local numWhos, totalCount = C_FriendList.GetNumWhoResults();

	for i = 1, #buttons do
		local button = buttons[i];
		local index = offset + i;

		if index <= numWhos then
			local info = C_FriendList.GetWhoInfo(index);
			button.Guild:SetText(info.fullGuildName); -- 公会
			button.Race:SetText(info.raceStr); -- 种族
			button:Show();
		else
			button.index = nil;
			button:Hide();
		end
	end
end

-- WhoList_Update的钩子函数，用来处理排序的显示问题。
-- WhoList_Update的频率并不算高。除了一些常规触发以外，事件WHO_LIST_UPDATE触发会调用几次
hooksecurefunc("WhoList_Update", hook_Wholist)
-- 注意：需要重新注入函数才能确保WhoListScrollFrame界面的正常刷新和滚动显示。
-- WhoListScrollFrame.update似乎跟HybridScrollFrame_Update函数相关，会影响滚动框体的滚动更新。
WhoListScrollFrame.update = WhoList_Update

ini_WhoFrame()