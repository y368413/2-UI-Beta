--创建织雾的设置窗口
function WR_MonkConfigFrame()
	if WR_ConfigIsOK~=nil then	--如果已经执行过了，就不再执行
		return
	end
	WR_ConfigIsOK=true	--记录已经执行过了
	-- 创建配置窗口
	local FrameWide=185	--窗体宽度
	local FrameHigh=680	--窗体高度
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--织雾 子窗体---------------------------------------------------------------------------------------------------
	local ZW_Frame = CreateFrame("Frame", "ZW_Frame", configFrame)
	ZW_Frame:SetSize(1, 1)
	ZW_Frame:SetPoint("CENTER", 0, 0)
	--织雾 子窗体---------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_ZNMB_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_ZNMB_Text:SetText("智能目标")
	ZW_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_ZNMB_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_QHS_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_QHS_Text:SetText("切喉手")
	ZW_QHS_Text:SetPoint("TOPRIGHT", ZW_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_QHS_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_QHS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_QHS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --切喉手
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_QHS) --切喉手
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_DDMS_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_DDMS_Text:SetText("打断延迟")
	ZW_DDMS_Text:SetPoint("TOPRIGHT", ZW_QHS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_DDMS_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_XRMH_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_XRMH_Text:SetText("迅如猛虎")
	ZW_XRMH_Text:SetPoint("TOPRIGHT", ZW_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_XRMH_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_XRMH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "自己", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("智能：对所有队友使用。\n自己：仅对自己使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_XRMH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --迅如猛虎
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_XRMH) --迅如猛虎
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_STT_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_STT_Text:SetText("扫堂腿")
	ZW_STT_Text:SetPoint("TOPRIGHT", ZW_XRMH_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_STT_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_STT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("击倒附近的特殊钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_STT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --扫堂腿
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_STT) --扫堂腿
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_FJCG_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_FJCG_Text:SetText("分筋错骨")
	ZW_FJCG_Text:SetPoint("TOPRIGHT", ZW_STT_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_FJCG_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_FJCG_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("控制20码内的特殊钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_FJCG==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --分筋错骨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_FJCG) --分筋错骨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_QCSX_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_QCSX_Text:SetText("清创生血")
	ZW_QCSX_Text:SetPoint("TOPRIGHT", ZW_FJCG_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_QCSX_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_QCSX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：驱散所有队友。\n指向：驱散指向队友。\n自己：仅驱散自己。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_QCSX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清创生血
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_QCSX) --清创生血
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_LHZC_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_LHZC_Text:SetText("轮回之触")
	ZW_LHZC_Text:SetPoint("TOPRIGHT", ZW_QCSX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_LHZC_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_LHZC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("对当前目标使用轮回之触。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_LHZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --轮回之触
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_LHZC) --轮回之触
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_LGJSC_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_LGJSC_Text:SetText("雷光茶")
	ZW_LGJSC_Text:SetPoint("TOPRIGHT", ZW_LHZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_LGJSC_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_LGJSC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择是否自动使用雷光聚神茶。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_LGJSC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --雷茶
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_LGJSC) --雷茶
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_FLC_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_FLC_Text:SetText("法力茶")
	ZW_FLC_Text:SetPoint("TOPRIGHT", ZW_LGJSC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_FLC_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_FLC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择是否自动使用法力茶。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_FLC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) 
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_FLC) 
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_SYSD_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_SYSD_Text:SetText("碎玉闪电")
	ZW_SYSD_Text:SetPoint("TOPRIGHT", ZW_FLC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_SYSD_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_SYSD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "1", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "2", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "3", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "4", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "5", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
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
		GameTooltip:SetText("当附近敌人数量超过设定值，使用碎玉闪电。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_SYSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) 
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_SYSD) 
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_FWZW_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_FWZW_Text:SetText("抚慰之雾")
	ZW_FWZW_Text:SetPoint("TOPRIGHT", ZW_SYSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_FWZW_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_FWZW_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("设定使用抚慰之雾的阈值。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_FWZW==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --抚慰之雾
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_FWZW) --抚慰之雾
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_SLZC_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_SLZC_Text:SetText("神龙之赐")
	ZW_SLZC_Text:SetPoint("TOPRIGHT", ZW_FWZW_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_SLZC_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_SLZC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("设定最低的使用层数，当队伍血量危险的时候自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_SLZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --神龙之赐
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_SLZC) --神龙之赐
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_ZHXF_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_ZHXF_Text:SetText("朱鹤下凡")
	ZW_ZHXF_Text:SetPoint("TOPRIGHT", ZW_SLZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_ZHXF_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_ZHXF_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当队伍血量危险的时候自动使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_ZHXF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --朱鹤下凡
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_ZHXF) --朱鹤下凡
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_ZJFM_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_ZJFM_Text:SetText("作茧缚命")
	ZW_ZJFM_Text:SetPoint("TOPRIGHT", ZW_ZHXF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_ZJFM_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_ZJFM_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动给生命低于设定值的友方单位作茧缚命。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_ZJFM==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --作茧缚命
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_ZJFM) --作茧缚命
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_QBH_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_QBH_Text:SetText("躯不坏")
	ZW_QBH_Text:SetPoint("TOPRIGHT", ZW_ZJFM_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_QBH_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_QBH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用躯不坏。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_QBH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --躯不坏
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_QBH) --躯不坏
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_ZLS_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_ZLS_Text:SetText("治疗石")
	ZW_ZLS_Text:SetPoint("TOPRIGHT", ZW_QBH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_ZLS_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_ZLYS_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_ZLYS_Text:SetText("治疗药水")
	ZW_ZLYS_Text:SetPoint("TOPRIGHT", ZW_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_ZLYS_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	ZW_SP1_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_SP1_Text:SetText("饰品①")
	ZW_SP1_Text:SetPoint("TOPRIGHT", ZW_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_SP1_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	ZW_SP2_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_SP2_Text:SetText("饰品②")
	ZW_SP2_Text:SetPoint("TOPRIGHT", ZW_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_SP2_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_SFSD_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_SFSD_Text:SetText("施法速度")
	ZW_SFSD_Text:SetPoint("TOPRIGHT", ZW_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_SFSD_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.ZW_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local ZW_FBQD_Text = ZW_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ZW_FBQD_Text:SetText("副本强度")
	ZW_FBQD_Text:SetPoint("TOPRIGHT", ZW_SFSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "ZW_FBQD_Dropdown", ZW_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", ZW_FBQD_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "低", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "中", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "高", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("根据副本强度设置治疗的积极性：\n设置较低时，降低治疗积极性，更省蓝。\n设置较高时，提高治疗积极性，更费蓝。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.ZW_FBQD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --副本强度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.ZW_FBQD) --副本强度
	end
	-----------------------------------------------------------------------------------------------------
--]]


























	--酒仙 子窗体---------------------------------------------------------------------------------------------------
	local JX_Frame = CreateFrame("Frame", "JX_Frame", configFrame)
	JX_Frame:SetSize(1, 1)
	JX_Frame:SetPoint("CENTER", 0, 0)
	--酒仙 子窗体---------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_ZNMB_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_ZNMB_Text:SetText("智能目标")
	JX_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_ZNMB_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_QHS_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_QHS_Text:SetText("切喉手")
	JX_QHS_Text:SetPoint("TOPRIGHT", JX_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_QHS_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_QHS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_QHS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --切喉手
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_QHS) --切喉手
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_DDMS_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_DDMS_Text:SetText("打断延迟")
	JX_DDMS_Text:SetPoint("TOPRIGHT", JX_QHS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_DDMS_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_XRMH_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_XRMH_Text:SetText("迅如猛虎")
	JX_XRMH_Text:SetPoint("TOPRIGHT", JX_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_XRMH_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_XRMH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "自己", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("智能：对所有队友使用。\n自己：仅对自己使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_XRMH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --迅如猛虎
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_XRMH) --迅如猛虎
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_STT_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_STT_Text:SetText("扫堂腿")
	JX_STT_Text:SetPoint("TOPRIGHT", JX_XRMH_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_STT_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_STT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("击倒附近的特殊钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_STT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --扫堂腿
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_STT) --扫堂腿
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_FJCG_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_FJCG_Text:SetText("分筋错骨")
	JX_FJCG_Text:SetPoint("TOPRIGHT", JX_STT_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_FJCG_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_FJCG_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_FJCG==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --分筋错骨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_FJCG) --分筋错骨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_QCSX_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_QCSX_Text:SetText("清创生血")
	JX_QCSX_Text:SetPoint("TOPRIGHT", JX_FJCG_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_QCSX_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_QCSX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：驱散所有队友的中毒和疾病。\n指向：驱散指向队友的中毒和疾病。\n自己：仅驱散自己身上的中毒和疾病。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_QCSX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清创生血
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_QCSX) --清创生血
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_GCJ_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_GCJ_Text:SetText("骨尘酒")
	JX_GCJ_Text:SetPoint("TOPRIGHT", JX_QCSX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_GCJ_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_GCJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("爆发期自动施放骨尘酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_GCJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --骨尘酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_GCJ) --骨尘酒
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_BZJT_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_BZJT_Text:SetText("爆炸酒桶")
	JX_BZJT_Text:SetPoint("TOPRIGHT", JX_GCJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_BZJT_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_BZJT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("爆发期自动施放爆炸酒桶。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_BZJT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --爆炸酒桶
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_BZJT) --爆炸酒桶
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_BHDX_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_BHDX_Text:SetText("白虎雕像")
	JX_BHDX_Text:SetPoint("TOPRIGHT", JX_BZJT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_BHDX_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_BHDX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("爆发期自动施放白虎雕像。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_BHDX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --白虎雕像
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_BHDX) --白虎雕像
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_JXBG_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_JXBG_Text:SetText("精序兵戈")
	JX_JXBG_Text:SetPoint("TOPRIGHT", JX_BHDX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_JXBG_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_JXBG_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("爆发期自动施放精序兵戈。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_JXBG==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --精序兵戈
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_JXBG) --精序兵戈
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_XNJ_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_XNJ_Text:SetText("玄牛酒")
	JX_XNJ_Text:SetPoint("TOPRIGHT", JX_JXBG_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_XNJ_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_XNJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当活血酒及天神酒都没有可用次数的时候，\n自动使用玄牛酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_XNJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --玄牛酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_XNJ) --玄牛酒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_XNXF_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_XNXF_Text:SetText("玄牛下凡")
	JX_XNXF_Text:SetPoint("TOPRIGHT", JX_XNJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_XNXF_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_XNXF_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当酒池大于活血酒设定值，\n且活血酒、天神酒及玄牛酒均不可用的时候，\n自动使用玄牛下凡。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_XNXF==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --玄牛下凡
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_XNXF) --玄牛下凡
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_HXJ_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_HXJ_Text:SetText("活血酒")
	JX_HXJ_Text:SetPoint("TOPRIGHT", JX_XNXF_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_HXJ_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_HXJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当酒池大于设定值的时候，自动使用活血酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_HXJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --活血酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_HXJ) --活血酒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_TSJ_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_TSJ_Text:SetText("天神酒")
	JX_TSJ_Text:SetPoint("TOPRIGHT", JX_HXJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_TSJ_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_TSJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值小于设定值的时候，自动使用天神酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_TSJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --天神酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_TSJ) --天神酒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_LHZC_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_LHZC_Text:SetText("轮回之触")
	JX_LHZC_Text:SetPoint("TOPRIGHT", JX_TSJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_LHZC_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_LHZC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("对当前目标使用轮回之触。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_LHZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --轮回之触
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_LHZC) --轮回之触
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_HXS_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_HXS_Text:SetText("活血术")
	JX_HXS_Text:SetPoint("TOPRIGHT", JX_LHZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_HXS_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_HXS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("触发活力苏醒后,自动使用活血术治疗自己。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_HXS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_HXS)
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_QBH_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_QBH_Text:SetText("躯不坏")
	JX_QBH_Text:SetPoint("TOPRIGHT", JX_HXS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_QBH_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_QBH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用躯不坏。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_QBH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --躯不坏
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_QBH) --躯不坏
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_ZDJ_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_ZDJ_Text:SetText("壮胆酒")
	JX_ZDJ_Text:SetPoint("TOPRIGHT", JX_QBH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_ZDJ_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_ZDJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("生命值低于设定值的时候，自动施放壮胆酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_ZDJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --壮胆酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_ZDJ) --壮胆酒
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_ZLS_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_ZLS_Text:SetText("治疗石")
	JX_ZLS_Text:SetPoint("TOPRIGHT", JX_ZDJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_ZLS_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_ZLYS_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_ZLYS_Text:SetText("治疗药水")
	JX_ZLYS_Text:SetPoint("TOPRIGHT", JX_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_ZLYS_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_PXZH_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_PXZH_Text:SetText("平心之环")
	JX_PXZH_Text:SetPoint("TOPRIGHT", JX_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_PXZH_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_PXZH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，在脚下放下平心之环。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.JX_PXZH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --平心之环
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_PXZH) --平心之环
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	JX_SP1_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_SP1_Text:SetText("饰品①")
	JX_SP1_Text:SetPoint("TOPRIGHT", JX_PXZH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_SP1_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	JX_SP2_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_SP2_Text:SetText("饰品②")
	JX_SP2_Text:SetPoint("TOPRIGHT", JX_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_SP2_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local JX_SFSD_Text = JX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	JX_SFSD_Text:SetText("施法速度")
	JX_SFSD_Text:SetPoint("TOPRIGHT", JX_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "JX_SFSD_Dropdown", JX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", JX_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.JX_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.JX_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------






























	--踏风 子窗体---------------------------------------------------------------------------------------------------
	local TF_Frame = CreateFrame("Frame", "TF_Frame", configFrame)
	TF_Frame:SetSize(1, 1)
	TF_Frame:SetPoint("CENTER", 0, 0)
	--踏风 子窗体---------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_ZNMB_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_ZNMB_Text:SetText("智能目标")
	TF_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_ZNMB_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_ZNMB_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当你失去目标时，\n会自动为你选择一个可攻击的目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.TF_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_QHS_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_QHS_Text:SetText("切喉手")
	TF_QHS_Text:SetPoint("TOPRIGHT", TF_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_QHS_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_QHS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：自动打断所有目标。\n目标：只打断当前目标。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_QHS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --切喉手
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_QHS) --切喉手
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_DDMS_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_DDMS_Text:SetText("打断模式")
	TF_DDMS_Text:SetPoint("TOPRIGHT", TF_QHS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_DDMS_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.TF_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_XRMH_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_XRMH_Text:SetText("迅如猛虎")
	TF_XRMH_Text:SetPoint("TOPRIGHT", TF_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_XRMH_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_XRMH_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "自己", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("智能：对所有队友使用。\n自己：仅对自己使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_XRMH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --迅如猛虎
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_XRMH) --迅如猛虎
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_STT_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_STT_Text:SetText("扫堂腿")
	TF_STT_Text:SetPoint("TOPRIGHT", TF_XRMH_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_STT_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_STT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("击倒附近的特殊钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_STT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --扫堂腿
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_STT) --扫堂腿
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_FJCG_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_FJCG_Text:SetText("分筋错骨")
	TF_FJCG_Text:SetPoint("TOPRIGHT", TF_STT_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_FJCG_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_FJCG_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("控制20码内的特殊钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_FJCG==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --分筋错骨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_FJCG) --分筋错骨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_QCSX_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_QCSX_Text:SetText("清创生血")
	TF_QCSX_Text:SetPoint("TOPRIGHT", TF_FJCG_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_QCSX_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_QCSX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：驱散所有队友身上的魔法、中毒和疾病。\n指向：仅驱散鼠标指向的友方单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_QCSX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --清创生血
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_QCSX) --清创生血
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_GCJ_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_GCJ_Text:SetText("骨尘酒")
	TF_GCJ_Text:SetPoint("TOPRIGHT", TF_QCSX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_GCJ_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_GCJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("在脚下使用骨尘酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_GCJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --骨尘酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_GCJ) --骨尘酒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_SP_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_SP_Text:SetText("饰品")
	TF_SP_Text:SetPoint("TOPRIGHT", TF_GCJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_SP_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_SP_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择与朱鹤下凡或神龙之赐同时使用的饰品。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_SP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --饰品
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_SP) --饰品
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_YBZC_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_YBZC_Text:SetText("业报之触")
	TF_YBZC_Text:SetPoint("TOPRIGHT", TF_SP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_YBZC_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_YBZC_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用业报之触。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_YBZC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --业报之触
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_YBZC) --业报之触
	end
	-----------------------------------------------------------------------------------------------------	

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_QBH_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_QBH_Text:SetText("躯不坏")
	TF_QBH_Text:SetPoint("TOPRIGHT", TF_YBZC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_QBH_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_QBH_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用躯不坏。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_QBH==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --躯不坏
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_QBH) --躯不坏
	end
	-----------------------------------------------------------------------------------------------------	
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_ZDJ_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_ZDJ_Text:SetText("壮胆酒")
	TF_ZDJ_Text:SetPoint("TOPRIGHT", TF_QBH_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_ZDJ_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_ZDJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定值，自动使用壮胆酒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.TF_ZDJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --壮胆酒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_ZDJ) --壮胆酒
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_ZLS_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_ZLS_Text:SetText("治疗石")
	TF_ZLS_Text:SetPoint("TOPRIGHT", TF_ZDJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_ZLS_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.TF_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local TF_ZLYS_Text = TF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	TF_ZLYS_Text:SetText("治疗药水")
	TF_ZLYS_Text:SetPoint("TOPRIGHT", TF_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "TF_ZLYS_Dropdown", TF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", TF_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.TF_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.TF_ZLYS) --治疗药水
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