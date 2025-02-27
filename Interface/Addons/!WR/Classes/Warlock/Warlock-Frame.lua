--创建术士的设置窗口
function WR_WarlockConfigFrame()
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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--恶魔 子窗体---------------------------------------------------------------------------------------------------
	local EM_Frame = CreateFrame("Frame", "EM_Frame", configFrame)
	EM_Frame:SetSize(1, 1)
	EM_Frame:SetPoint("CENTER", 0, 0)
	--恶魔 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_ZNMB_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_ZNMB_Text:SetText("智能目标")
	EM_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_ZNMB_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_NB_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_NB_Text:SetText("内爆")
	EM_NB_Text:SetPoint("TOPRIGHT", EM_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_NB_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_NB_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "1", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "2", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "3", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "4", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "5", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "6", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "7", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "8", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "9", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "10", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "11", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
		{text = "12", func = function() UIDropDownMenu_SetSelectedID(dropdown, 12) end},
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
		GameTooltip:SetText("选择几个小鬼的时候使用内爆。\n|cff00adf0注：内爆仅会在有[驯犬大师的方略]增益的时候使用。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- 读取存储的参数
	if WRSet.EM_NB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --内爆
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_NB) --内爆
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_JFTZ_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_JFTZ_Text:SetText("巨斧投掷")
	EM_JFTZ_Text:SetPoint("TOPRIGHT", EM_NB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_JFTZ_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_JFTZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("打断施法或控制特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.EM_JFTZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --巨斧投掷
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_JFTZ) --巨斧投掷
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_SWCR_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_SWCR_Text:SetText("死亡缠绕")
	EM_SWCR_Text:SetPoint("TOPRIGHT", EM_JFTZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_SWCR_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_SWCR_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("打断施法或控制特定的钢条施法单位。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.EM_SWCR==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --死亡缠绕
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_SWCR) --死亡缠绕
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_DDMS_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_DDMS_Text:SetText("打断模式")
	EM_DDMS_Text:SetPoint("TOPRIGHT", EM_SWCR_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_DDMS_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_DDMS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "秒断", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "0.1秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
		{text = "0.2秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 3) end},
		{text = "0.3秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 4) end},
		{text = "0.4秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 5) end},
		{text = "0.5秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 6) end},
		{text = "0.6秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 7) end},
		{text = "0.7秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 8) end},
		{text = "0.8秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 9) end},
		{text = "0.9秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 10) end},
		{text = "1.0秒", func = function() UIDropDownMenu_SetSelectedID(dropdown, 11) end},
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
	if WRSet.EM_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --打断模式
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_DDMS) --打断模式
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_BQCC_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_BQCC_Text:SetText("爆燃冲刺")
	EM_BQCC_Text:SetPoint("TOPRIGHT", EM_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_BQCC_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_BQCC_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)
	
	-- 初始化下拉菜单项
	local menuItems = {
		{text = "智能", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "保持", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("智能：特殊场景自动施放爆燃冲刺；\n保持：只要移动就会自动释放爆燃冲刺。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.EM_BQCC==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --爆燃冲刺
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_BQCC) --爆燃冲刺
	end
	-----------------------------------------------------------------------------------------------------
--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_WQ_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_WQ_Text:SetText("武器")
	EM_WQ_Text:SetPoint("TOPRIGHT", EM_BQCC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_WQ_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_WQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动使用|cff00adf0伊律答尔，地壤之尊")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.EM_WQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --武器
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_WQ) --武器
	end
	-----------------------------------------------------------------------------------------------------
--]]

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_BFYS_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_BFYS_Text:SetText("爆发药水")
	EM_BFYS_Text:SetPoint("TOPRIGHT", EM_BQCC_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_BFYS_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_BFYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_BFYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --爆发药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_BFYS) --爆发药水
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_SP_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_SP_Text:SetText("饰品")
	EM_SP_Text:SetPoint("TOPRIGHT", EM_BFYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_SP_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_SP_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_SP==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --饰品
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_SP) --饰品
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_HAQY_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_HAQY_Text:SetText("黑暗契约")
	EM_HAQY_Text:SetPoint("TOPRIGHT", EM_SP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_HAQY_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_HAQY_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当自身危险的时候，或者环境AOE的时候，\n自动使用黑暗契约。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.EM_HAQY==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --黑暗契约
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_HAQY) --黑暗契约
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_BMJX_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_BMJX_Text:SetText("不灭决心")
	EM_BMJX_Text:SetPoint("TOPRIGHT", EM_HAQY_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_BMJX_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_BMJX_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_BMJX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --不灭决心
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_BMJX) --不灭决心
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_ZLS_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_ZLS_Text:SetText("治疗石")
	EM_ZLS_Text:SetPoint("TOPRIGHT", EM_BMJX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_ZLS_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_ZLS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local EM_ZLYS_Text = EM_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	EM_ZLYS_Text:SetText("治疗药水")
	EM_ZLYS_Text:SetPoint("TOPRIGHT", EM_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "EM_ZLYS_Dropdown", EM_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", EM_ZLYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.EM_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.EM_ZLYS) --治疗药水
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

