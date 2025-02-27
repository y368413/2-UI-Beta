--创建战士的设置窗口
function WR_WarriorConfigFrame()
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
	configFrame:SetPoint("LEFT",10,80)
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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--狂暴战 子窗体---------------------------------------------------------------------------------------------------
	local KBZ_Frame = CreateFrame("Frame", "KBZ_Frame", configFrame)
	KBZ_Frame:SetSize(1, 1)
	KBZ_Frame:SetPoint("CENTER", 0, 0)
	--狂暴战 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_ZNMB_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZNMB_Text:SetText("智能目标")
	KBZ_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZNMB_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	KBZ_ZNJD_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZNJD_Text:SetText("智能焦点")
	KBZ_ZNJD_Text:SetPoint("TOPRIGHT", KBZ_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZNJD_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZNJD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_QJ_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_QJ_Text:SetText("拳击")
	KBZ_QJ_Text:SetPoint("TOPRIGHT", KBZ_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_QJ_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_QJ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_QJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_QJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_DDMS_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_DDMS_Text:SetText("打断延迟")
	KBZ_DDMS_Text:SetPoint("TOPRIGHT", KBZ_QJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_DDMS_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断延迟
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_DDMS) --打断延迟
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_FSFS_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_FSFS_Text:SetText("法术反射")
	KBZ_FSFS_Text:SetPoint("TOPRIGHT", KBZ_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_FSFS_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_FSFS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("反射对你施法的法术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_FSFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --法术反射
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_FSFS) --法术反射
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_ZDB_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZDB_Text:SetText("震荡波")
	KBZ_ZDB_Text:SetPoint("TOPRIGHT", KBZ_FSFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZDB_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZDB_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("击晕附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_ZDB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --震荡波
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZDB) --震荡波
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_PDNH_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_PDNH_Text:SetText("破胆怒吼")
	KBZ_PDNH_Text:SetPoint("TOPRIGHT", KBZ_ZDB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_PDNH_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_PDNH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("恐惧附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_PDNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --破胆怒吼
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_PDNH) --破胆怒吼
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_FBZC_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_FBZC_Text:SetText("风暴之锤")
	KBZ_FBZC_Text:SetPoint("TOPRIGHT", KBZ_PDNH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_FBZC_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_FBZC_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
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
		GameTooltip:SetText("智能：控制所有单位。\n目标：仅控制当前目标。\n指向：仅控制指向单位。\n焦点：仅控制焦点单位。(若无焦点则控制所有单位。)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_FBZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_FBZC)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	KBZ_ZT_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZT_Text:SetText("姿态")
	KBZ_ZT_Text:SetPoint("TOPRIGHT", KBZ_FBZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZT_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZT_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "狂暴", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "自动", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("狂暴：维持狂暴姿态。\n自动：某些需要减伤的环境自动切防御姿态。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_ZT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZT)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_SLZW_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_SLZW_Text:SetText("胜利在望")
	KBZ_SLZW_Text:SetPoint("TOPRIGHT", KBZ_ZT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_SLZW_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_SLZW_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_SLZW==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --胜利在望
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_SLZW) --胜利在望
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_KNHF_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_KNHF_Text:SetText("狂怒回复")
	KBZ_KNHF_Text:SetPoint("TOPRIGHT", KBZ_SLZW_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_KNHF_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_KNHF_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_KNHF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --狂怒回复
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_KNHF) --狂怒回复
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_JJNH_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_JJNH_Text:SetText("集结呐喊")
	KBZ_JJNH_Text:SetPoint("TOPRIGHT", KBZ_KNHF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_JJNH_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_JJNH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("当生命值低于设定，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.KBZ_JJNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --集结呐喊
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_JJNH) --集结呐喊
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_ZLS_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZLS_Text:SetText("治疗石")
	KBZ_ZLS_Text:SetPoint("TOPRIGHT", KBZ_JJNH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZLS_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_ZLYS_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_ZLYS_Text:SetText("治疗药水")
	KBZ_ZLYS_Text:SetPoint("TOPRIGHT", KBZ_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_ZLYS_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	KBZ_SP1_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_SP1_Text:SetText("饰品①")
	KBZ_SP1_Text:SetPoint("TOPRIGHT", KBZ_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_SP1_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	KBZ_SP2_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_SP2_Text:SetText("饰品②")
	KBZ_SP2_Text:SetPoint("TOPRIGHT", KBZ_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_SP2_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local KBZ_SFSD_Text = KBZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	KBZ_SFSD_Text:SetText("施法速度")
	KBZ_SFSD_Text:SetPoint("TOPRIGHT", KBZ_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "KBZ_SFSD_Dropdown", KBZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", KBZ_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.KBZ_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.KBZ_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--防战 子窗体---------------------------------------------------------------------------------------------------
	local FZ_Frame = CreateFrame("Frame", "FZ_Frame", configFrame)
	FZ_Frame:SetSize(1, 1)
	FZ_Frame:SetPoint("CENTER", 0, 0)
	--防战 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_ZNMB_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_ZNMB_Text:SetText("智能目标")
	FZ_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_ZNMB_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_ZNJD_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_ZNJD_Text:SetText("智能焦点")
	FZ_ZNJD_Text:SetPoint("TOPRIGHT", FZ_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_ZNJD_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_ZNJD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_QJ_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_QJ_Text:SetText("拳击")
	FZ_QJ_Text:SetPoint("TOPRIGHT", FZ_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_QJ_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_QJ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_QJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_QJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_DDMS_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_DDMS_Text:SetText("打断延迟")
	FZ_DDMS_Text:SetPoint("TOPRIGHT", FZ_QJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_DDMS_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断延迟
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_DDMS) --打断延迟
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_FSFS_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_FSFS_Text:SetText("法术反射")
	FZ_FSFS_Text:SetPoint("TOPRIGHT", FZ_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_FSFS_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_FSFS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("反射对你施法的法术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_FSFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --法术反射
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_FSFS) --法术反射
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_ZDB_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_ZDB_Text:SetText("震荡波")
	FZ_ZDB_Text:SetPoint("TOPRIGHT", FZ_FSFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_ZDB_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_ZDB_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("击晕附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_ZDB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --震荡波
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_ZDB) --震荡波
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_PDNH_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_PDNH_Text:SetText("破胆怒吼")
	FZ_PDNH_Text:SetPoint("TOPRIGHT", FZ_ZDB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_PDNH_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_PDNH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("恐惧附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_PDNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --破胆怒吼
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_PDNH) --破胆怒吼
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_FBZC_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_FBZC_Text:SetText("风暴之锤")
	FZ_FBZC_Text:SetPoint("TOPRIGHT", FZ_PDNH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_FBZC_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_FBZC_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
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
		GameTooltip:SetText("智能：控制所有单位。\n目标：仅控制当前目标。\n指向：仅控制指向单位。\n焦点：仅控制焦点单位。(若无焦点则控制所有单位。)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_FBZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_FBZC)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_DPCF_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_DPCF_Text:SetText("盾牌冲锋")
	FZ_DPCF_Text:SetPoint("TOPRIGHT", FZ_FBZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_DPCF_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_DPCF_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "爆发", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("常驻：任何使用使用盾牌冲锋。\n爆发：仅爆发时使用盾牌冲锋。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_DPCF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_DPCF)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_TSXF_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_TSXF_Text:SetText("天神下凡")
	FZ_TSXF_Text:SetPoint("TOPRIGHT", FZ_DPCF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_TSXF_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_TSXF_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("爆发时使用天神下凡。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_TSXF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_TSXF)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_DQ_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_DQ_Text:SetText("盾墙")
	FZ_DQ_Text:SetPoint("TOPRIGHT", FZ_TSXF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_DQ_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_DQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用盾墙。\n注：建议手动规划盾墙减伤。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_DQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --盾墙
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_DQ) --盾墙
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_PFCZ_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_PFCZ_Text:SetText("破釜沉舟")
	FZ_PFCZ_Text:SetPoint("TOPRIGHT", FZ_DQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_PFCZ_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_PFCZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_PFCZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --破釜沉舟
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_PFCZ) --破釜沉舟
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_JJNH_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_JJNH_Text:SetText("集结呐喊")
	FZ_JJNH_Text:SetPoint("TOPRIGHT", FZ_PFCZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_JJNH_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_JJNH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("当生命值低于设定，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.FZ_JJNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --集结呐喊
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_JJNH) --集结呐喊
	end
	-----------------------------------------------------------------------------------------------------	

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_ZLS_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_ZLS_Text:SetText("治疗石")
	FZ_ZLS_Text:SetPoint("TOPRIGHT", FZ_JJNH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_ZLS_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_ZLYS_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_ZLYS_Text:SetText("治疗药水")
	FZ_ZLYS_Text:SetPoint("TOPRIGHT", FZ_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_ZLYS_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_SP1_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_SP1_Text:SetText("饰品①")
	FZ_SP1_Text:SetPoint("TOPRIGHT", FZ_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_SP1_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_SP2_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_SP2_Text:SetText("饰品②")
	FZ_SP2_Text:SetPoint("TOPRIGHT", FZ_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_SP2_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local FZ_SFSD_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_SFSD_Text:SetText("施法速度")
	FZ_SFSD_Text:SetPoint("TOPRIGHT", FZ_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "FZ_SFSD_Dropdown", FZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", FZ_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.FZ_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.FZ_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	FZ_NotADD_Text = FZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	FZ_NotADD_Text:SetText("防ADD")
	FZ_NotADD_Text:SetPoint("TOPRIGHT", FZ_SFSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "FZ_NotADD_Checkbox", FZ_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", FZ_NotADD_Text, "RIGHT", 0, 0)
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
	if WRSet.FZ_NotADD==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.FZ_NotADD)
	end
	-----------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--武器战 子窗体---------------------------------------------------------------------------------------------------
	local WQZ_Frame = CreateFrame("Frame", "WQZ_Frame", configFrame)
	WQZ_Frame:SetSize(1, 1)
	WQZ_Frame:SetPoint("CENTER", 0, 0)
	--武器战 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_ZNMB_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_ZNMB_Text:SetText("智能目标")
	WQZ_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_ZNMB_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_ZNMB_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当失去目标的时候，自动切换一个最近的目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.WQZ_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_QJ_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_QJ_Text:SetText("拳击")
	WQZ_QJ_Text:SetPoint("TOPRIGHT", WQZ_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_QJ_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_QJ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("智能：自动打断一切目标。\n目标：只打断当前目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_QJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_QJ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_DDMS_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_DDMS_Text:SetText("打断延迟")
	WQZ_DDMS_Text:SetPoint("TOPRIGHT", WQZ_QJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_DDMS_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.WQZ_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断延迟
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_DDMS) --打断延迟
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_FSFS_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_FSFS_Text:SetText("法术反射")
	WQZ_FSFS_Text:SetPoint("TOPRIGHT", WQZ_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_FSFS_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_FSFS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("反射对你施法的法术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_FSFS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --法术反射
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_FSFS) --法术反射
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_PDNH_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_PDNH_Text:SetText("破胆怒吼")
	WQZ_PDNH_Text:SetPoint("TOPRIGHT", WQZ_FSFS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_PDNH_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_PDNH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("恐惧附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_PDNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --破胆怒吼
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_PDNH) --破胆怒吼
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_FBZC_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_FBZC_Text:SetText("风暴之锤")
	WQZ_FBZC_Text:SetPoint("TOPRIGHT", WQZ_PDNH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_FBZC_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_FBZC_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "目标", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "焦点", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
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
		GameTooltip:SetText("智能：控制所有单位。\n目标：仅控制当前目标。\n指向：仅控制指向单位。\n焦点：仅控制焦点单位。(若无焦点则控制所有单位。)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_FBZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_FBZC)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	WQZ_FYZT_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_FYZT_Text:SetText("防御姿态")
	WQZ_FYZT_Text:SetPoint("TOPRIGHT", WQZ_FBZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_FYZT_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_FYZT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("在特定的AOE场景自动切换防御姿态。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_FYZT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --防御姿态
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_FYZT) --防御姿态
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	WQZ_WSKT_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_WSKT_Text:SetText("无视苦痛")
	WQZ_WSKT_Text:SetPoint("TOPRIGHT", WQZ_FYZT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_WSKT_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_WSKT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("在特定的AOE场景自动使用无视苦痛。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_WSKT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --无视苦痛
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_WSKT) --无视苦痛
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_SP_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_SP_Text:SetText("饰品")
	WQZ_SP_Text:SetPoint("TOPRIGHT", WQZ_WSKT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_SP_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_SP_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择开爆发技能的时候，同时使用的饰品。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_SP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --饰品
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_SP) --饰品
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_BFYS_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_BFYS_Text:SetText("爆发药水")
	WQZ_BFYS_Text:SetPoint("TOPRIGHT", WQZ_SP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_BFYS_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_BFYS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "|cff00adf0使用", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
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
		GameTooltip:SetText("开爆发技能的时候，同时爆发药水。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_BFYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --爆发药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_BFYS) --爆发药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_SLZW_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_SLZW_Text:SetText("胜利在望")
	WQZ_SLZW_Text:SetPoint("TOPRIGHT", WQZ_BFYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_SLZW_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_SLZW_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_SLZW==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --胜利在望
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_SLZW) --胜利在望
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_JZRZ_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_JZRZ_Text:SetText("剑在人在")
	WQZ_JZRZ_Text:SetPoint("TOPRIGHT", WQZ_SLZW_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_JZRZ_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_JZRZ_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_JZRZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --剑在人在
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_JZRZ) --剑在人在
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_KTMY_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_KTMY_Text:SetText("苦痛免疫")
	WQZ_KTMY_Text:SetPoint("TOPRIGHT", WQZ_JZRZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_KTMY_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_KTMY_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("当生命值低于设定值，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_KTMY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --苦痛免疫
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_KTMY) --苦痛免疫
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_ZLS_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_ZLS_Text:SetText("治疗石")
	WQZ_ZLS_Text:SetPoint("TOPRIGHT", WQZ_KTMY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_ZLS_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.WQZ_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_ZLYS_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_ZLYS_Text:SetText("治疗药水")
	WQZ_ZLYS_Text:SetPoint("TOPRIGHT", WQZ_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_ZLYS_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.WQZ_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local WQZ_JJNH_Text = WQZ_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	WQZ_JJNH_Text:SetText("集结呐喊")
	WQZ_JJNH_Text:SetPoint("TOPRIGHT", WQZ_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "WQZ_JJNH_Dropdown", WQZ_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", WQZ_JJNH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "10%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "20%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "30%", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("当生命值低于设定，自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.WQZ_JJNH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --集结呐喊
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.WQZ_JJNH) --集结呐喊
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

