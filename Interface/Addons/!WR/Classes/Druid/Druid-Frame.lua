--创建德鲁伊的设置窗口
function WR_DruidConfigFrame()
	if WR_ConfigIsOK~=nil then	--如果已经执行过了，就不再执行
		return
	end
	WR_ConfigIsOK=true	--记录已经执行过了
	-- 创建配置窗口
	local FrameWide=185	--窗体宽度
	local FrameHigh=750	--窗体高度
	local OptionsInterval=-15 --选项间隔
	local configFrame = CreateFrame("Frame", "WowRobotConfigFrame", UIParent, "UIPanelDialogTemplate")
	configFrame:SetSize(FrameWide, FrameHigh)
	configFrame:SetPoint("TOPLEFT",-5,-63)
	configFrame:SetMovable(true)
	configFrame:EnableMouse(true)
	configFrame:RegisterForDrag("LeftButton")
	configFrame:SetScript("OnDragStart", configFrame.StartMoving)
	configFrame:SetScript("OnDragStop", configFrame.StopMovingOrSizing)
	configFrame:SetFrameStrata("FULLSCREEN") --设置框体的层级为TOOLTIP全屏幕层
	configFrame:Hide()

	-- 设置窗口标题
	configFrame.title = configFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	configFrame.title:SetPoint("TOP", configFrame.Title, "TOP", 0, 0)
	configFrame.title:SetText("|cff00adf0WOW-Robot")
	-----------------------------------------------------------------------------------------------------
	-- 创建图标
	local iconTexture = configFrame:CreateTexture(nil, "ARTWORK")
	iconTexture:SetSize(35, 35)
	iconTexture:SetPoint("TOPLEFT", 20, -35)
	iconTexture:SetTexture("Interface\\AddOns\\!WR\\Color\\WOW-Robot.tga")
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "WR_TestCheckbox", configFrame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", iconTexture, "RIGHT", 15, 0)
	checkbox:SetChecked(false)
	checkbox.text:SetText("调试模式")
	
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("如果卡技能，请打开此选项，\n可以查出卡在什么技能或功能上了。")
		GameTooltip:Show()
	end)
	-----------------------------------------------------------------------------------------------------


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--平衡 子窗体---------------------------------------------------------------------------------------------------
	PH_Frame = CreateFrame("Frame", "PH_Frame", configFrame)
	PH_Frame:SetSize(1, 1)
	PH_Frame:SetPoint("CENTER", 0, 0)
	--平衡 子窗体---------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_XHLX_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_XHLX_Text:SetText("循环类型")
	PH_XHLX_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_XHLX_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_XHLX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "单体", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "群体", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：自动识别单体/AOE。\n单体：强制使用单体循环。\n群体：强制使用AOE循环。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.PH_XHLX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --循环类型
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_XHLX) --循环类型
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_ZNMB_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_ZNMB_Text:SetText("智能目标")
	PH_ZNMB_Text:SetPoint("TOPLEFT", PH_XHLX_Text, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_ZNMB_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_ZNMB_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "锁定", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "范围", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("锁定：锁定当前所选目标，丢失目标的时候，切换最近的目标。\n范围：只要目标不在攻击范围内，切换最近的目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.PH_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_ZNMB)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_YDYH_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_YDYH_Text:SetText("移动月火")
	PH_YDYH_Text:SetPoint("TOPLEFT", PH_ZNMB_Text, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_YDYH_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_YDYH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("移动过程中继续施放月火术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.PH_YDYH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --移动月火
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_YDYH) --移动月火
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_HS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_HS_Text:SetText("超凡化身")
	PH_HS_Text:SetPoint("TOPRIGHT", PH_YDYH_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_HS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_HS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("爆发时使用[超凡之盟]或[化身：艾露恩之眷]。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_HS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --化身
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_HS) --化身
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_WLZZ_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_WLZZ_Text:SetText("万灵之召")
	PH_WLZZ_Text:SetPoint("TOPRIGHT", PH_HS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_WLZZ_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_WLZZ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("爆发时使用[万灵之召]。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_WLZZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_WLZZ)
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_SP_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_SP_Text:SetText("饰品")
	PH_SP_Text:SetPoint("TOPRIGHT", PH_HS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_SP_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_SP_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "1号", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "2号", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "1-2号", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("触发化身的时候，同时使用的饰品。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_SP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_SP)
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_FS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_FS_Text:SetText("复生")
	PH_FS_Text:SetPoint("TOPRIGHT", PH_WLZZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_FS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_FS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("战复鼠标指向的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_FS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_FS)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_AF_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_AF_Text:SetText("安抚")
	PH_AF_Text:SetPoint("TOPRIGHT", PH_FS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_AF_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_AF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有敌对单位的激怒。\n目标：仅驱散当前目标的激怒。\n指向：仅驱散指向单位的激怒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_AF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_AF)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_RGS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_RGS_Text:SetText("日光术")
	PH_RGS_Text:SetPoint("TOPRIGHT", PH_AF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_RGS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_RGS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("只会对特定几个必须打断的法术生效。\n|cff00adf0注：CD过长，建议手动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_RGS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --日光术
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_RGS) --日光术
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_QCFS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_QCFS_Text:SetText("清除腐蚀")
	PH_QCFS_Text:SetPoint("TOPRIGHT", PH_RGS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_QCFS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_QCFS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有队友的诅咒和中毒。\n指向：驱散指向队友的诅咒和中毒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_QCFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清除腐蚀
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_QCFS) --清除腐蚀
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_DHPX_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_DHPX_Text:SetText("夺魂咆哮")
	PH_DHPX_Text:SetPoint("TOPRIGHT", PH_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_DHPX_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_DHPX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("瘫痪附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_DHPX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --夺魂咆哮
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_DHPX) --夺魂咆哮
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_MLMJ_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_MLMJ_Text:SetText("蛮力猛击")
	PH_MLMJ_Text:SetPoint("TOPRIGHT", PH_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_MLMJ_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_MLMJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("击晕特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_MLMJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --蛮力猛击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_MLMJ) --蛮力猛击
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_JCDS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_JCDS_Text:SetText("解除定身")
	PH_JCDS_Text:SetPoint("TOPRIGHT", PH_DHPX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_JCDS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_JCDS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("利用变形解除身上的定身效果。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_JCDS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --解除定身
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_JCDS) --解除定身
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_BXFY_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_BXFY_Text:SetText("变熊防御")
	PH_BXFY_Text:SetPoint("TOPRIGHT", PH_JCDS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_BXFY_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_BXFY_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在特定的爆发AOE即将来临会变熊抗一下伤害。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_BXFY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --变熊防御
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_BXFY) --变熊防御
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_ZRDSH_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_ZRDSH_Text:SetText("自然守护")
	PH_ZRDSH_Text:SetPoint("TOPRIGHT", PH_BXFY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_ZRDSH_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_ZRDSH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("队伍生命值较低时自动使用自然的守护。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_ZRDSH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --自然的守护
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_ZRDSH) --自然的守护
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_SPS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_SPS_Text:SetText("树皮术")
	PH_SPS_Text:SetPoint("TOPRIGHT", PH_ZRDSH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_SPS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_SPS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用树皮术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_SPS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_SPS)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_GL_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_GL_Text:SetText("甘霖")
	PH_GL_Text:SetPoint("TOPRIGHT", PH_SPS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_GL_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_GL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用甘霖。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_GL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --甘霖
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_GL) --甘霖
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_ZLS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_ZLS_Text:SetText("治疗石")
	PH_ZLS_Text:SetPoint("TOPRIGHT", PH_GL_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_ZLS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_ZLS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗石。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_ZLYS_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_ZLYS_Text:SetText("治疗药水")
	PH_ZLYS_Text:SetPoint("TOPRIGHT", PH_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_ZLYS_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_ZLYS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗药水。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_SP1_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_SP1_Text:SetText("饰品①")
	PH_SP1_Text:SetPoint("TOPRIGHT", PH_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_SP1_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_SP1_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	PH_SP2_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_SP2_Text:SetText("饰品②")
	PH_SP2_Text:SetPoint("TOPRIGHT", PH_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_SP2_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_SP2_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local PH_SFSD_Text = PH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	PH_SFSD_Text:SetText("施法速度")
	PH_SFSD_Text:SetPoint("TOPRIGHT", PH_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "PH_SFSD_Dropdown", PH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", PH_SFSD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "15%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "25%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在公共冷却(GCD)前0.1-0.3秒插入下一个技能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.PH_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.PH_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--野性 子窗体---------------------------------------------------------------------------------------------------
	YX_Frame = CreateFrame("Frame", "YX_Frame", configFrame)
	YX_Frame:SetSize(1, 1)
	YX_Frame:SetPoint("CENTER", 0, 0)
	--野性 子窗体---------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_ZNMB_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_ZNMB_Text:SetText("智能目标")
	YX_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_ZNMB_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_ZNMB_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "锁定", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "范围", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("锁定：锁定当前所选目标，丢失目标的时候，切换最近的目标。\n范围：只要目标不在攻击范围内，切换最近的目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.YX_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_ZNJD_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_ZNJD_Text:SetText("智能焦点")
	YX_ZNJD_Text:SetPoint("TOPRIGHT", YX_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_ZNJD_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_ZNJD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffffff骷髅", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffcc3300十字", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff3a8ff3方块", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffc3c3e3月亮", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff11ff11三角", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffbf6af7菱形", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cfffd7c07圆形", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffebeb1b星型", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("自动设定指定标记的单位为焦点。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.YX_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_YTTJ_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_YTTJ_Text:SetText("迎头痛击")
	YX_YTTJ_Text:SetPoint("TOPRIGHT", YX_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_YTTJ_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_YTTJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf0智能|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf0目标|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf0指向|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cff00adf0焦点|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffff5040禁用|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：打断所有单位的施法。\n目标：仅打断当前目标的施法。\n指向：仅打断当前指向单位的施法。\n焦点：仅打断焦点单位的施法。(若无焦点则打断所有单位。)\n|cffffffff白色：打断大部分技能。|r\n|cff00adf0蓝色：仅断重要的技能。|r")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_YTTJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_YTTJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_DDMS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_DDMS_Text:SetText("打断延迟")
	YX_DDMS_Text:SetPoint("TOPRIGHT", YX_YTTJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_DDMS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_DDMS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "秒断", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("选择秒断或打断延迟时间。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_FS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_FS_Text:SetText("复生")
	YX_FS_Text:SetPoint("TOPRIGHT", YX_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_FS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_FS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("战复鼠标指向的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_FS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_FS)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_AF_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_AF_Text:SetText("安抚")
	YX_AF_Text:SetPoint("TOPRIGHT", YX_FS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_AF_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_AF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有敌对单位的激怒。\n目标：仅驱散当前目标的激怒。\n指向：仅驱散指向单位的激怒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_AF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_AF)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_QCFS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_QCFS_Text:SetText("清除腐蚀")
	YX_QCFS_Text:SetPoint("TOPRIGHT", YX_AF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_QCFS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_QCFS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有队友的诅咒和中毒。\n指向：驱散指向队友的诅咒和中毒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_QCFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清除腐蚀
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_QCFS) --清除腐蚀
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_DHPX_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_DHPX_Text:SetText("夺魂咆哮")
	YX_DHPX_Text:SetPoint("TOPRIGHT", YX_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_DHPX_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_DHPX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("瘫痪附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_DHPX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --夺魂咆哮
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_DHPX) --夺魂咆哮
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_MLMJ_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_MLMJ_Text:SetText("蛮力猛击")
	YX_MLMJ_Text:SetPoint("TOPRIGHT", YX_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_MLMJ_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_MLMJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("击晕特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_MLMJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --蛮力猛击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_MLMJ) --蛮力猛击
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_JCDS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_JCDS_Text:SetText("解除定身")
	YX_JCDS_Text:SetPoint("TOPRIGHT", YX_DHPX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_JCDS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_JCDS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("利用变形解除身上的定身效果。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_JCDS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --解除定身
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_JCDS) --解除定身
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local YX_BXFY_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_BXFY_Text:SetText("变熊防御")
	YX_BXFY_Text:SetPoint("TOPRIGHT", YX_JCDS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_BXFY_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_BXFY_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在特定的爆发AOE即将来临会变熊抗一下伤害。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_BXFY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --变熊防御
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_BXFY) --变熊防御
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_ZRDSH_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_ZRDSH_Text:SetText("自然守护")
	YX_ZRDSH_Text:SetPoint("TOPRIGHT", YX_BXFY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_ZRDSH_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_ZRDSH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("队伍生命值较低时自动使用自然的守护。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_ZRDSH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --自然的守护
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_ZRDSH) --自然的守护
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_SPS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_SPS_Text:SetText("树皮术")
	YX_SPS_Text:SetPoint("TOPRIGHT", YX_ZRDSH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_SPS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_SPS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用树皮术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_SPS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_SPS)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_SCBN_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_SCBN_Text:SetText("生存本能")
	YX_SCBN_Text:SetPoint("TOPRIGHT", YX_SPS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_SCBN_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_SCBN_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用生存本能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_SCBN==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_SCBN)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_YH_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_YH_Text:SetText("愈合")
	YX_YH_Text:SetPoint("TOPRIGHT", YX_SCBN_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_YH_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_YH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，并且触发迅捷，自动使用愈合。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_YH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --愈合
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_YH) --愈合
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_GL_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_GL_Text:SetText("甘霖")
	YX_GL_Text:SetPoint("TOPRIGHT", YX_YH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_GL_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_GL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用甘霖。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_GL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --甘霖
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_GL) --甘霖
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_ZLS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_ZLS_Text:SetText("治疗石")
	YX_ZLS_Text:SetPoint("TOPRIGHT", YX_GL_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_ZLS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_ZLS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗石。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_ZLYS_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_ZLYS_Text:SetText("治疗药水")
	YX_ZLYS_Text:SetPoint("TOPRIGHT", YX_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_ZLYS_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_ZLYS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗药水。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_SP1_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_SP1_Text:SetText("饰品①")
	YX_SP1_Text:SetPoint("TOPRIGHT", YX_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_SP1_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_SP1_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	YX_SP2_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_SP2_Text:SetText("饰品②")
	YX_SP2_Text:SetPoint("TOPRIGHT", YX_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_SP2_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_SP2_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local YX_SFSD_Text = YX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	YX_SFSD_Text:SetText("施法速度")
	YX_SFSD_Text:SetPoint("TOPRIGHT", YX_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "YX_SFSD_Dropdown", YX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", YX_SFSD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "15%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "25%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在公共冷却(GCD)前0.1-0.3秒插入下一个技能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.YX_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.YX_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--守护 子窗体---------------------------------------------------------------------------------------------------
	SH_Frame = CreateFrame("Frame", "SH_Frame", configFrame)
	SH_Frame:SetSize(1, 1)
	SH_Frame:SetPoint("CENTER", 0, 0)
	--守护 子窗体---------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_ZNMB_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_ZNMB_Text:SetText("智能目标")
	SH_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_ZNMB_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_ZNMB_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "锁定", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "范围", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("锁定：锁定当前所选目标，丢失目标的时候，切换最近的目标。\n范围：只要目标不在攻击范围内，切换最近的目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.SH_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_ZNMB)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_ZNJD_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_ZNJD_Text:SetText("智能焦点")
	SH_ZNJD_Text:SetPoint("TOPRIGHT", SH_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_ZNJD_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_ZNJD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffffff骷髅", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffcc3300十字", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff3a8ff3方块", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffc3c3e3月亮", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff11ff11三角", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffbf6af7菱形", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cfffd7c07圆形", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffebeb1b星型", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("自动设定指定标记的单位为焦点。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.SH_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_YTTJ_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_YTTJ_Text:SetText("迎头痛击")
	SH_YTTJ_Text:SetPoint("TOPRIGHT", SH_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_YTTJ_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_YTTJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf0智能|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf0目标|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf0指向|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cff00adf0焦点|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffff5040禁用|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：打断所有单位的施法。\n目标：仅打断当前目标的施法。\n指向：仅打断当前指向单位的施法。\n焦点：仅打断焦点单位的施法。(若无焦点则打断所有单位。)\n|cffffffff白色：打断大部分技能。|r\n|cff00adf0蓝色：仅断重要的技能。|r")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_YTTJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_YTTJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_DDMS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_DDMS_Text:SetText("打断延迟")
	SH_DDMS_Text:SetPoint("TOPRIGHT", SH_YTTJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_DDMS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_DDMS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "秒断", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("选择秒断或打断延迟时间。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_TZ_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_TZ_Text:SetText("铁鬃")
	SH_TZ_Text:SetPoint("TOPRIGHT", SH_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_TZ_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_TZ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "1层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "2层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "3层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "4层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "5层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "6层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "7层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "8层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "9层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "10层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("设定固定铁鬃层数。\n智能：根据生存压力，自动计算铁鬃层数。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_TZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --铁鬃
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_TZ) --铁鬃
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_FS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_FS_Text:SetText("复生")
	SH_FS_Text:SetPoint("TOPRIGHT", SH_TZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_FS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_FS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("战复鼠标指向的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_FS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_FS)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_AF_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_AF_Text:SetText("安抚")
	SH_AF_Text:SetPoint("TOPRIGHT", SH_FS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_AF_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_AF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有敌对单位的激怒。\n目标：仅驱散当前目标的激怒。\n指向：仅驱散指向单位的激怒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_AF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_AF)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_QCFS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_QCFS_Text:SetText("清除腐蚀")
	SH_QCFS_Text:SetPoint("TOPRIGHT", SH_AF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_QCFS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_QCFS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有队友的诅咒和中毒。\n指向：驱散指向队友的诅咒和中毒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_QCFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清除腐蚀
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_QCFS) --清除腐蚀
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_DHPX_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_DHPX_Text:SetText("夺魂咆哮")
	SH_DHPX_Text:SetPoint("TOPRIGHT", SH_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_DHPX_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_DHPX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("瘫痪附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_DHPX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --夺魂咆哮
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_DHPX) --夺魂咆哮
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_MLMJ_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_MLMJ_Text:SetText("蛮力猛击")
	SH_MLMJ_Text:SetPoint("TOPRIGHT", SH_QCFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_MLMJ_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_MLMJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("击晕特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_MLMJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --蛮力猛击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_MLMJ) --蛮力猛击
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_SPS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_SPS_Text:SetText("树皮术")
	SH_SPS_Text:SetPoint("TOPRIGHT", SH_DHPX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_SPS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_SPS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用树皮术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_SPS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --树皮术
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_SPS) --树皮术
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_CSZZN_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_CSZZN_Text:SetText("沉睡者")
	SH_CSZZN_Text:SetPoint("TOPRIGHT", SH_SPS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_CSZZN_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_CSZZN_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用沉睡者之怒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_CSZZN==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --沉睡者之怒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_CSZZN) --沉睡者之怒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_KBHF_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_KBHF_Text:SetText("狂暴回复")
	SH_KBHF_Text:SetPoint("TOPRIGHT", SH_CSZZN_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_KBHF_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_KBHF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用狂暴回复。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_KBHF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --狂暴回复
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_KBHF) --狂暴回复
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_SCBN_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_SCBN_Text:SetText("生存本能")
	SH_SCBN_Text:SetPoint("TOPRIGHT", SH_KBHF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_SCBN_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_SCBN_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用生存本能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_SCBN==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_SCBN)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_GL_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_GL_Text:SetText("甘霖")
	SH_GL_Text:SetPoint("TOPRIGHT", SH_SCBN_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_GL_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_GL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用甘霖。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_GL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --甘霖
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_GL) --甘霖
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_ZLS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_ZLS_Text:SetText("治疗石")
	SH_ZLS_Text:SetPoint("TOPRIGHT", SH_GL_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_ZLS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_ZLS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用治疗石。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_ZLYS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_ZLYS_Text:SetText("治疗药水")
	SH_ZLYS_Text:SetPoint("TOPRIGHT", SH_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_ZLYS_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_ZLYS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定值，自动使用治疗药水。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_SP1_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_SP1_Text:SetText("饰品①")
	SH_SP1_Text:SetPoint("TOPRIGHT", SH_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_SP1_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_SP1_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_SP2_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_SP2_Text:SetText("饰品②")
	SH_SP2_Text:SetPoint("TOPRIGHT", SH_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_SP2_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_SP2_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local SH_SFSD_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_SFSD_Text:SetText("施法速度")
	SH_SFSD_Text:SetPoint("TOPRIGHT", SH_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "SH_SFSD_Dropdown", SH_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", SH_SFSD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "15%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "25%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在公共冷却(GCD)前0.1-0.3秒插入下一个技能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.SH_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.SH_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_NotADD_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_NotADD_Text:SetText("防ADD")
	SH_NotADD_Text:SetPoint("TOPRIGHT", SH_SFSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "SH_NotADD_Checkbox", SH_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", SH_NotADD_Text, "RIGHT", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("勾选后，不主动攻击未战斗的单位。")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.SH_NotADD==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.SH_NotADD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	SH_QZJS_Text = SH_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	SH_QZJS_Text:SetText("前置减伤")
	SH_QZJS_Text:SetPoint("TOPRIGHT", SH_NotADD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "SH_QZJS_Checkbox", SH_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", SH_QZJS_Text, "RIGHT", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("勾选后，会使用减伤技能应对部分尖刺伤害。")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.SH_QZJS==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.SH_QZJS)
	end
	-----------------------------------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	--恢复 子窗体---------------------------------------------------------------------------------------------------
	local HF_Frame = CreateFrame("Frame", "HF_Frame", configFrame)
	HF_Frame:SetSize(1, 1)
	HF_Frame:SetPoint("CENTER", 0, 0)
	--恢复 子窗体---------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_ZNMB_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_ZNMB_Text:SetText("智能目标")
	HF_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_ZNMB_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_ZNMB_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("自动选择一个优先级更高的单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.HF_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_YTTJ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_YTTJ_Text:SetText("迎头痛击")
	HF_YTTJ_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_YTTJ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_YTTJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf0智能|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf0目标|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf0指向|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cff00adf0焦点|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffff5040禁用|r", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：打断所有单位的施法。\n目标：仅打断当前目标的施法。\n指向：仅打断当前指向单位的施法。\n焦点：仅打断焦点单位的施法。(若无焦点则打断所有单位。)\n|cffffffff白色：打断大部分技能。|r\n|cff00adf0蓝色：仅断重要的技能。|r")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_YTTJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_YTTJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_DDMS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_DDMS_Text:SetText("打断延迟")
	HF_DDMS_Text:SetPoint("TOPRIGHT", HF_YTTJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_DDMS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_DDMS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "秒断", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("选择秒断或打断延迟时间。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_HS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_HS_Text:SetText("万灵化身")
	HF_HS_Text:SetPoint("TOPRIGHT", HF_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_HS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_HS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("爆发时使用万灵或化身。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_HS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --化身
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_HS) --化身
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_SMZF_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SMZF_Text:SetText("生命绽放")
	HF_SMZF_Text:SetPoint("TOPRIGHT", HF_HS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SMZF_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SMZF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	HF_SMZF_menuItems = {
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}
	
	-- 设置下拉菜单的初始化函数
	function HF_SMZF_InitializeDropdown()
		UIDropDownMenu_Initialize(dropdown, function()
			for _, item in ipairs(HF_SMZF_menuItems) do
				local info = UIDropDownMenu_CreateInfo()
				info.text = item.text
				info.func = item.func
				UIDropDownMenu_AddButton(info)
			end
		end)
	end

	-- 初始化下拉菜单
	HF_SMZF_InitializeDropdown()

	-- 修改菜单项的文本
	function HF_SMZF_UpdateMenuItemText(index, newText)
		if HF_SMZF_menuItems[index] then
			HF_SMZF_menuItems[index].text = newText
			HF_SMZF_InitializeDropdown()  -- 重新初始化下拉菜单
			UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SMZF)
		else
			print("无效的索引")
		end
	end
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("选择给生命绽放的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SMZF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --生命绽放
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SMZF) --生命绽放
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_MSZF_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_MSZF_Text:SetText("蔓生绽放")
	HF_MSZF_Text:SetPoint("TOPRIGHT", HF_SMZF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_MSZF_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_MSZF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	HF_MSZF_menuItems = {
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}
	
	-- 设置下拉菜单的初始化函数
	function HF_MSZF_InitializeDropdown()
		UIDropDownMenu_Initialize(dropdown, function()
			for _, item in ipairs(HF_MSZF_menuItems) do
				local info = UIDropDownMenu_CreateInfo()
				info.text = item.text
				info.func = item.func
				UIDropDownMenu_AddButton(info)
			end
		end)
	end

	-- 初始化下拉菜单
	HF_MSZF_InitializeDropdown()

	-- 修改菜单项的文本
	function HF_MSZF_UpdateMenuItemText(index, newText)
		if HF_MSZF_menuItems[index] then
			HF_MSZF_menuItems[index].text = newText
			HF_MSZF_InitializeDropdown()  -- 重新初始化下拉菜单
			UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_MSZF)
		else
			print("无效的索引")
		end
	end
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("选择给蔓生绽放的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_MSZF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --蔓生绽放
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_MSZF) --蔓生绽放
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_BHQF_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_BHQF_Text:SetText("百花齐放")
	HF_BHQF_Text:SetPoint("TOPRIGHT", HF_MSZF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_BHQF_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_BHQF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("自动使用百花齐放。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_BHQF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --百花齐放
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_BHQF) --百花齐放
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_JBFQ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_JBFQ_Text:SetText("激变蜂群")
	HF_JBFQ_Text:SetPoint("TOPRIGHT", HF_BHQF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_JBFQ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_JBFQ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("自动使用激变蜂群。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_JBFQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --激变蜂群
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_JBFQ) --激变蜂群
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_HCS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_HCS_Text:SetText("回春术")
	HF_HCS_Text:SetPoint("TOPRIGHT", HF_BHQF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_HCS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_HCS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "60%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "70%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "80%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "90%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "100%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("为血量低于设定值的队友使用回春术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_HCS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --回春术
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_HCS) --回春术
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_ZRZY_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_ZRZY_Text:SetText("自然之愈")
	HF_ZRZY_Text:SetPoint("TOPRIGHT", HF_BHQF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_ZRZY_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_ZRZY_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "自己", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有友方。\n指向：驱散指向单位。\n自己：仅驱散自己。\n焦点：仅驱散焦点。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_ZRZY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --自然之愈
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_ZRZY) --自然之愈
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_AF_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_AF_Text:SetText("安抚")
	HF_AF_Text:SetPoint("TOPRIGHT", HF_ZRZY_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_AF_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_AF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("智能：驱散所有敌对单位的激怒。\n目标：仅驱散当前目标的激怒。\n指向：仅驱散指向单位的激怒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_AF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_AF)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_FS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_FS_Text:SetText("复生")
	HF_FS_Text:SetPoint("TOPRIGHT", HF_AF_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_FS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_FS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}
	
	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("战复鼠标指向的队友。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_FS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_FS)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_DHPX_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_DHPX_Text:SetText("夺魂咆哮")
	HF_DHPX_Text:SetPoint("TOPRIGHT", HF_FS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_DHPX_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_DHPX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("瘫痪附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_DHPX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --夺魂咆哮
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_DHPX) --夺魂咆哮
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_MLMJ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_MLMJ_Text:SetText("蛮力猛击")
	HF_MLMJ_Text:SetPoint("TOPRIGHT", HF_AF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_MLMJ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_MLMJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("击晕特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_MLMJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --蛮力猛击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_MLMJ) --蛮力猛击
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_JCDS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_JCDS_Text:SetText("解除定身")
	HF_JCDS_Text:SetPoint("TOPRIGHT", HF_DHPX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_JCDS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_JCDS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("利用变形解除身上的定身效果。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_JCDS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --解除定身
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_JCDS) --解除定身
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_BXFY_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_BXFY_Text:SetText("变熊防御")
	HF_BXFY_Text:SetPoint("TOPRIGHT", HF_JCDS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_BXFY_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_BXFY_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在特定的爆发AOE即将来临会变熊抗一下伤害。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_BXFY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --变熊防御
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_BXFY) --变熊防御
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_LBXT_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_LBXT_Text:SetText("猎豹形态")
	HF_LBXT_Text:SetPoint("TOPRIGHT", HF_BXFY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_LBXT_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_LBXT_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "平伤", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("平伤：仅平伤模式时使用猎豹形态攻击。\n常驻：平伤和爆发模式，均使用猎豹形态攻击。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_LBXT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_LBXT)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_SPS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SPS_Text:SetText("树皮术")
	HF_SPS_Text:SetPoint("TOPRIGHT", HF_LBXT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SPS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SPS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值过低或某些特定AOE场合，自动施放树皮术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SPS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --树皮术
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SPS) --树皮术
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_TMSP_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_TMSP_Text:SetText("铁木树皮")
	HF_TMSP_Text:SetPoint("TOPRIGHT", HF_SPS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_TMSP_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_TMSP_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值过低或某些特定AOE场合，自动施放铁木树皮。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_TMSP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --铁木树皮
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_TMSP) --铁木树皮
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_SP_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SP_Text:SetText("饰品")
	HF_SP_Text:SetPoint("TOPRIGHT", HF_TMSP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SP_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SP_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "开启", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值过低或某些特定AOE场合，自动施放饰品。\n目前支持的饰品：菲莱克的秽怒之心，无面忿怒结界。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --饰品
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SP) --饰品
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_GL_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_GL_Text:SetText("甘霖")
	HF_GL_Text:SetPoint("TOPRIGHT", HF_TMSP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_GL_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_GL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "50%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用甘霖。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_GL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --甘霖
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_GL) --甘霖
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_ZLS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_ZLS_Text:SetText("治疗石")
	HF_ZLS_Text:SetPoint("TOPRIGHT", HF_GL_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_ZLS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_ZLS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗石。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_ZLYS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_ZLYS_Text:SetText("治疗药水")
	HF_ZLYS_Text:SetPoint("TOPRIGHT", HF_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_ZLYS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_ZLYS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "40%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("当生命值低于设定，自动使用治疗药水。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_SP1_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SP1_Text:SetText("饰品①")
	HF_SP1_Text:SetPoint("TOPRIGHT", HF_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SP1_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SP1_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	HF_SP2_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SP2_Text:SetText("饰品②")
	HF_SP2_Text:SetPoint("TOPRIGHT", HF_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SP2_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SP2_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cffffa500常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff90ee90爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "|cff00adf010%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "|cff00adf020%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "|cff00adf030%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "|cff00adf040%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "|cff00adf050%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "|cffba55d310%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "|cffba55d320%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "|cffba55d330%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "|cffba55d340%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "|cffba55d350%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
		{text = "|cffff5040禁用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 13) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cffffa500常驻：CD好了就用。\n|cff90ee90爆发：随爆发技能同时使用。\n|cff00adf0自保：自己生命值低于设定值时使用。\n|cffba55d3协助：队友或自己生命值低于设定值时使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_SFSD_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SFSD_Text:SetText("施法速度")
	HF_SFSD_Text:SetPoint("TOPRIGHT", HF_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SFSD_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SFSD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "15%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "25%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
	}

	-- 设置下拉菜单的初始化函数
	UIDropDownMenu_Initialize(dropdown, function()
		for _, item in ipairs(menuItems) do
			local info = UIDropDownMenu_CreateInfo()
			info.text = item.text
			info.func = item.func
			UIDropDownMenu_AddButton(info)
		end
	end)
	
	-- 鼠标指向时的提示
	dropdown:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("在公共冷却(GCD)前0.1-0.3秒插入下一个技能。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- 显示和隐藏配置窗口的函数
	function ToggleConfigFrame()
		if configFrame:IsShown() then
			configFrame:Hide()
		else
			configFrame:Show()
		end
	end
	
	-- 注册聊天命令，当输入/wr时显示配置窗口
	SLASH_WOW_ROBOT1 = "/wr"
	SlashCmdList["WOW_ROBOT"] = ToggleConfigFrame
	
	-----------------------------------------------------------------------------------------------------
	-- 创建左下角点击弹出界面图标窗体
	local frame = CreateFrame("Button", "WR_ClickFrame", UIParent, "UIPanelButtonTemplate")
	frame:SetSize(25, 25) --设置框体大小
	frame:SetPoint("BOTTOMLEFT", 0, 0) --设置框体位置
	frame:SetFrameStrata("TOOLTIP") --设置框体的层级为TOOLTIP全屏幕层
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton") -- 注册左键点击拖动
	frame:SetScript("OnDragStart", frame.StartMoving) -- 开始拖动时调用StartMoving
	frame:SetScript("OnDragStop", frame.StopMovingOrSizing) -- 停止拖动时调用StopMovingOrSizing
	local texture = frame:CreateTexture(nil, "OVERLAY")
	texture:SetAllPoints(frame)
	texture:SetTexture("Interface\\AddOns\\!WR\\Color\\WOW-Robot.tga") --窗体图片路径
	frame:SetScript("OnClick", function(self, button, down)
		if configFrame:IsShown() then
			configFrame:Hide()
		else
			configFrame:Show()
		end
	end)
	frame:Show() --显示窗体
	-----------------------------------------------------------------------------------------------------
	
	--创建战斗识别窗体
	local frame = CreateFrame("Frame", "WR_CombatFrame")
	frame:SetSize(8, 8) --设置框体大小
	frame:SetPoint("BOTTOMRIGHT", 0, 0) --设置框体位置
	frame:SetFrameStrata("TOOLTIP") --设置框体的层级为TOOLTIP全屏幕层
	local texture = frame:CreateTexture(nil, "OVERLAY")
	texture:SetAllPoints(frame)
	texture:SetTexture("Interface\\AddOns\\!WR\\Color\\Combat.tga") --窗体图片路径
	frame:Hide() --隐藏窗体
end

