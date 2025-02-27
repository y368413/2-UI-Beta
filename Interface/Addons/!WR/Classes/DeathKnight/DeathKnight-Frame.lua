--创建DK的设置窗口
function WR_DeathKnightConfigFrame()
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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--冰霜 子窗体---------------------------------------------------------------------------------------------------
	local BS_Frame = CreateFrame("Frame", "BS_Frame", configFrame)
	BS_Frame:SetSize(1, 1)
	BS_Frame:SetPoint("CENTER", 0, 0)
	--冰霜 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZNMB_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZNMB_Text:SetText("智能目标")
	BS_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZNMB_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_ZNJD_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZNJD_Text:SetText("智能焦点")
	BS_ZNJD_Text:SetPoint("TOPRIGHT", BS_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZNJD_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZNJD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_BSJL_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_BSJL_Text:SetText("冰霜巨龙")
	BS_BSJL_Text:SetPoint("TOPRIGHT", BS_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_BSJL_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_BSJL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "快速", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "正常", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "叠层", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
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
		GameTooltip:SetText("快速：|cff00adf0冰霜之柱|r内施放冰霜巨龙。\n正常：|cff00adf0冰霜之柱|r内，触发|cff00adf0挫骨扬灰|r或|cff00adf0不洁之力|r，施放冰霜巨龙。\n叠层：尽可能叠加更多的增益后施放冰霜巨龙。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_BSJL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --冰霜巨龙
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_BSJL) --冰霜巨龙
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_XLBD_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_XLBD_Text:SetText("心灵冰冻")
	BS_XLBD_Text:SetPoint("TOPRIGHT", BS_BSJL_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_XLBD_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_XLBD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_XLBD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_XLBD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_DDMS_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_DDMS_Text:SetText("打断延迟")
	BS_DDMS_Text:SetPoint("TOPRIGHT", BS_XLBD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_DDMS_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZMBY_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZMBY_Text:SetText("致盲冰雨")
	BS_ZMBY_Text:SetPoint("TOPRIGHT", BS_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZMBY_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZMBY_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZMBY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --致盲冰雨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZMBY) --致盲冰雨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZX_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZX_Text:SetText("窒息")
	BS_ZX_Text:SetPoint("TOPRIGHT", BS_ZMBY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZX_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZX_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZX)
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_FWWQ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_FWWQ_Text:SetText("符文武器")
	BS_FWWQ_Text:SetPoint("TOPRIGHT", BS_ZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_FWWQ_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_FWWQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("使用[符文武器增效]技能")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_FWWQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_FWWQ)
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZEFZ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZEFZ_Text:SetText("憎恶附肢")
	BS_ZEFZ_Text:SetPoint("TOPRIGHT", BS_ZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZEFZ_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZEFZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("使用[憎恶附肢]技能")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_ZEFZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --憎恶附肢
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZEFZ) --憎恶附肢
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_KWDL_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_KWDL_Text:SetText("枯萎凋零")
	BS_KWDL_Text:SetPoint("TOPRIGHT", BS_ZEFZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_KWDL_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_KWDL_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "常驻", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "AOE", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("常驻：单体和AOE，均使用枯萎凋零。\nAOE：仅AOE的时候使用枯萎凋零。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_KWDL==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --枯萎凋零
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_KWDL) --枯萎凋零
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_FMFHZ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_FMFHZ_Text:SetText("反魔法罩")
	BS_FMFHZ_Text:SetPoint("TOPRIGHT", BS_KWDL_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_FMFHZ_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_FMFHZ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_FMFHZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --反魔法护罩
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_FMFHZ) --反魔法护罩
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_FHMY_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_FHMY_Text:SetText("复活盟友")
	BS_FHMY_Text:SetPoint("TOPRIGHT", BS_FMFHZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_FHMY_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_FHMY_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_FHMY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_FHMY)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_WYZQ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_WYZQ_Text:SetText("巫妖之躯")
	BS_WYZQ_Text:SetPoint("TOPRIGHT", BS_FHMY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_WYZQ_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_WYZQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用巫妖之躯。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_WYZQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --巫妖之躯
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_WYZQ) --巫妖之躯
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_BFZR_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_BFZR_Text:SetText("冰封之韧")
	BS_BFZR_Text:SetPoint("TOPRIGHT", BS_WYZQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_BFZR_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_BFZR_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用冰封之韧。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_BFZR==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --冰封之韧
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_BFZR) --冰封之韧
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_LJDJ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_LJDJ_Text:SetText("灵界打击")
	BS_LJDJ_Text:SetPoint("TOPRIGHT", BS_BFZR_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_LJDJ_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_LJDJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用灵界打击。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BS_LJDJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --灵界打击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_LJDJ) --灵界打击
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZLS_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZLS_Text:SetText("治疗石")
	BS_ZLS_Text:SetPoint("TOPRIGHT", BS_LJDJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZLS_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_ZLYS_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_ZLYS_Text:SetText("治疗药水")
	BS_ZLYS_Text:SetPoint("TOPRIGHT", BS_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_ZLYS_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_SP1_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_SP1_Text:SetText("饰品①")
	BS_SP1_Text:SetPoint("TOPRIGHT", BS_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_SP1_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_SP2_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_SP2_Text:SetText("饰品②")
	BS_SP2_Text:SetPoint("TOPRIGHT", BS_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_SP2_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BS_SFSD_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_SFSD_Text:SetText("施法速度")
	BS_SFSD_Text:SetPoint("TOPRIGHT", BS_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BS_SFSD_Dropdown", BS_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BS_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BS_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BS_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_FWWQ_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_FWWQ_Text:SetText("符文武器")
	BS_FWWQ_Text:SetPoint("TOPRIGHT", BS_SFSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BS_FWWQ_Checkbox", BS_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", BS_FWWQ_Text, "RIGHT", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("爆发使用[符文武器增效]。")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BS_FWWQ==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BS_FWWQ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BS_BLTX_Text = BS_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BS_BLTX_Text:SetText("冰龙吐息")
	BS_BLTX_Text:SetPoint("TOPRIGHT", BS_FWWQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BS_BLTX_Checkbox", BS_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", BS_BLTX_Text, "RIGHT", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("爆发使用[冰龙吐息]。")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BS_BLTX==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BS_BLTX)
	end
	-----------------------------------------------------------------------------------------------------


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--邪恶 子窗体---------------------------------------------------------------------------------------------------
	local XE_Frame = CreateFrame("Frame", "XE_Frame", configFrame)
	XE_Frame:SetSize(1, 1)
	XE_Frame:SetPoint("CENTER", 0, 0)
	--邪恶 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZNMB_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZNMB_Text:SetText("智能目标")
	XE_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZNMB_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_XLBD_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_XLBD_Text:SetText("心灵冰冻")
	XE_XLBD_Text:SetPoint("TOPRIGHT", XE_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_XLBD_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_XLBD_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：打断所有单位的施法。\n目标：仅打断当前目标的施法。\n指向：仅打断当前指向单位的施法。\n焦点：仅打断焦点单位的施法。(若无焦点则打断所有单位。)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_XLBD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_XLBD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_DDMS_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_DDMS_Text:SetText("打断模式")
	XE_DDMS_Text:SetPoint("TOPRIGHT", XE_XLBD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_DDMS_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZMBY_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZMBY_Text:SetText("致盲冰雨")
	XE_ZMBY_Text:SetPoint("TOPRIGHT", XE_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZMBY_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZMBY_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_ZMBY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --致盲冰雨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZMBY) --致盲冰雨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZX_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZX_Text:SetText("窒息")
	XE_ZX_Text:SetPoint("TOPRIGHT", XE_ZMBY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZX_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZX_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_ZX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZX)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_WZDJ_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_WZDJ_Text:SetText("亡者大军")
	XE_WZDJ_Text:SetPoint("TOPRIGHT", XE_ZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_WZDJ_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_WZDJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("使用[亡者大军]技能")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_WZDJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --亡者大军
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_WZDJ) --亡者大军
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZEFZ_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZEFZ_Text:SetText("憎恶附肢")
	XE_ZEFZ_Text:SetPoint("TOPRIGHT", XE_WZDJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZEFZ_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZEFZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("使用[憎恶附肢]技能")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_ZEFZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --憎恶附肢
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZEFZ) --憎恶附肢
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_FMFHZ_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_FMFHZ_Text:SetText("反魔法罩")
	XE_FMFHZ_Text:SetPoint("TOPRIGHT", XE_ZEFZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_FMFHZ_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_FMFHZ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_FMFHZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --反魔法护罩
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_FMFHZ) --反魔法护罩
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XE_FHMY_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_FHMY_Text:SetText("复活盟友")
	XE_FHMY_Text:SetPoint("TOPRIGHT", XE_FMFHZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_FHMY_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_FHMY_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_FHMY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_FHMY)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_WYZQ_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_WYZQ_Text:SetText("巫妖之躯")
	XE_WYZQ_Text:SetPoint("TOPRIGHT", XE_FHMY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_WYZQ_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_WYZQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用巫妖之躯。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_WYZQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --巫妖之躯
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_WYZQ) --巫妖之躯
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_BFZR_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_BFZR_Text:SetText("冰封之韧")
	XE_BFZR_Text:SetPoint("TOPRIGHT", XE_WYZQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_BFZR_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_BFZR_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用冰封之韧。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_BFZR==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --冰封之韧
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_BFZR) --冰封之韧
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_LJDJ_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_LJDJ_Text:SetText("灵界打击")
	XE_LJDJ_Text:SetPoint("TOPRIGHT", XE_BFZR_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_LJDJ_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_LJDJ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用灵界打击。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XE_LJDJ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --灵界打击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_LJDJ) --灵界打击
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZLS_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZLS_Text:SetText("治疗石")
	XE_ZLS_Text:SetPoint("TOPRIGHT", XE_LJDJ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZLS_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XE_ZLYS_Text = XE_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XE_ZLYS_Text:SetText("治疗药水")
	XE_ZLYS_Text:SetPoint("TOPRIGHT", XE_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XE_ZLYS_Dropdown", XE_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XE_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XE_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XE_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--鲜血 子窗体---------------------------------------------------------------------------------------------------
	local XX_Frame = CreateFrame("Frame", "XX_Frame", configFrame)
	XX_Frame:SetSize(1, 1)
	XX_Frame:SetPoint("CENTER", 0, 0)
	--鲜血 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZNMB_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZNMB_Text:SetText("智能目标")
	XX_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZNMB_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_ZNJD_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZNJD_Text:SetText("智能焦点")
	XX_ZNJD_Text:SetPoint("TOPRIGHT", XX_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZNJD_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZNJD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_XLBD_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_XLBD_Text:SetText("心灵冰冻")
	XX_XLBD_Text:SetPoint("TOPRIGHT", XX_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_XLBD_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_XLBD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_XLBD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_XLBD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_DDMS_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_DDMS_Text:SetText("打断延迟")
	XX_DDMS_Text:SetPoint("TOPRIGHT", XX_XLBD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_DDMS_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZMBY_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZMBY_Text:SetText("致盲冰雨")
	XX_ZMBY_Text:SetPoint("TOPRIGHT", XX_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZMBY_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZMBY_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("控制打断附近特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_ZMBY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --致盲冰雨
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZMBY) --致盲冰雨
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZX_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZX_Text:SetText("窒息")
	XX_ZX_Text:SetPoint("TOPRIGHT", XX_ZMBY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZX_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZX_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_ZX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZX)
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZEFZ_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZEFZ_Text:SetText("憎恶附肢")
	XX_ZEFZ_Text:SetPoint("TOPRIGHT", XX_ZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZEFZ_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZEFZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("使用[憎恶附肢]技能")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_ZEFZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --憎恶附肢
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZEFZ) --憎恶附肢
	end
	-----------------------------------------------------------------------------------------------------
--]]
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_FMFHZ_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_FMFHZ_Text:SetText("反魔法罩")
	XX_FMFHZ_Text:SetPoint("TOPRIGHT", XX_ZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_FMFHZ_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_FMFHZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("防御对你施法的法术。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_FMFHZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --反魔法护罩
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_FMFHZ) --反魔法护罩
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_FHMY_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_FHMY_Text:SetText("复活盟友")
	XX_FHMY_Text:SetPoint("TOPRIGHT", XX_FMFHZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_FHMY_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_FHMY_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_FHMY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_FHMY)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_XXGZX_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_XXGZX_Text:SetText("吸血鬼")
	XX_XXGZX_Text:SetPoint("TOPRIGHT", XX_FHMY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_XXGZX_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_XXGZX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动使用吸血鬼之血。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_XXGZX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --吸血鬼
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_XXGZX) --吸血鬼
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_WYZQ_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_WYZQ_Text:SetText("巫妖之躯")
	XX_WYZQ_Text:SetPoint("TOPRIGHT", XX_XXGZX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_WYZQ_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_WYZQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动使用巫妖之躯。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_WYZQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --巫妖之躯
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_WYZQ) --巫妖之躯
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_BFZR_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_BFZR_Text:SetText("冰封之韧")
	XX_BFZR_Text:SetPoint("TOPRIGHT", XX_WYZQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_BFZR_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_BFZR_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动使用冰封之韧。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.XX_BFZR==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --冰封之韧
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_BFZR) --冰封之韧
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZLS_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZLS_Text:SetText("治疗石")
	XX_ZLS_Text:SetPoint("TOPRIGHT", XX_BFZR_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZLS_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_ZLYS_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_ZLYS_Text:SetText("治疗药水")
	XX_ZLYS_Text:SetPoint("TOPRIGHT", XX_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_ZLYS_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_SP1_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_SP1_Text:SetText("饰品①")
	XX_SP1_Text:SetPoint("TOPRIGHT", XX_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_SP1_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_SP2_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_SP2_Text:SetText("饰品②")
	XX_SP2_Text:SetPoint("TOPRIGHT", XX_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_SP2_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_SP2)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local XX_SFSD_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_SFSD_Text:SetText("施法速度")
	XX_SFSD_Text:SetPoint("TOPRIGHT", XX_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "XX_SFSD_Dropdown", XX_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", XX_SFSD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.XX_SFSD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --施法速度
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.XX_SFSD) --施法速度
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_NotADD_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_NotADD_Text:SetText("防ADD")
	XX_NotADD_Text:SetPoint("TOPRIGHT", XX_SFSD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "XX_NotADD_Checkbox", XX_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", XX_NotADD_Text, "RIGHT", 0, 0)
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
	if WRSet.XX_NotADD==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.XX_NotADD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	XX_QZJS_Text = XX_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	XX_QZJS_Text:SetText("前置减伤")
	XX_QZJS_Text:SetPoint("TOPRIGHT", XX_NotADD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "XX_QZJS_Checkbox", XX_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("LEFT", XX_QZJS_Text, "RIGHT", 0, 0)
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
	if WRSet.XX_QZJS==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.XX_QZJS)
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

