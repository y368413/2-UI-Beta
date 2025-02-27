--创建法师的设置窗口
function WR_MageConfigFrame()
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



	
	--火法 子窗体---------------------------------------------------------------------------------------------------
	local HF_Frame = CreateFrame("Frame", "HF_Frame", configFrame)
	HF_Frame:SetSize(1, 1)
	HF_Frame:SetPoint("CENTER", 0, 0)
	--火法 子窗体---------------------------------------------------------------------------------------------------
	
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
		GameTooltip:SetText("当失去目标自动选择一个可以攻击的目标。")
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
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_FSFZ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_FSFZ_Text:SetText("法术反制")
	HF_FSFZ_Text:SetPoint("TOPRIGHT", HF_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_FSFZ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_FSFZ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.HF_FSFZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --反制射击
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_FSFZ) --反制射击
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_DDMS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_DDMS_Text:SetText("打断模式")
	HF_DDMS_Text:SetPoint("TOPRIGHT", HF_FSFZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_DDMS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.HF_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_DDMS) --
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_BFYS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_BFYS_Text:SetText("爆发药水")
	HF_BFYS_Text:SetPoint("TOPRIGHT", HF_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_BFYS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_BFYS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.HF_BFYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --爆发药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_BFYS) --爆发药水
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_SP_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_SP_Text:SetText("饰品")
	HF_SP_Text:SetPoint("TOPRIGHT", HF_BFYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_SP_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_SP_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择开爆发的时候，同时使用的饰品。")
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

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_LX_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_LX_Text:SetText("流星")
	HF_LX_Text:SetPoint("TOPRIGHT", HF_SP_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_LX_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_LX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "提示", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "|cff00adf0指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("选择流星的使用模式：\n提示：会出现选择圈，手动选择位置施放；\n指向：直接在鼠标指向的位置施放流星。(木桩推荐，实战慎用)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_LX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --流星
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_LX) --流星
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_JX_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_JX_Text:SetText("镜像")
	HF_JX_Text:SetPoint("TOPRIGHT", HF_LX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_JX_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_JX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("选择爆发时是否开启镜像。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_JX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --镜像
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_JX) --镜像
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_LXS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_LXS_Text:SetText("龙息术")
	HF_LXS_Text:SetPoint("TOPRIGHT", HF_JX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_LXS_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_LXS_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "控制", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "循环", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("控制：自动控制附近钢条施法单位。\n循环：把龙息术加入输出循环中。(木桩推荐)")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_LXS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --龙息术
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_LXS) --龙息术
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_FSXQ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_FSXQ_Text:SetText("法术吸取")
	HF_FSXQ_Text:SetPoint("TOPRIGHT", HF_LXS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_FSXQ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_FSXQ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("自动吸取当前目标或鼠标指向单位身上的关键法术效果。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_FSXQ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --法术吸取
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_FSXQ) --法术吸取
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_JCZZ_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_JCZZ_Text:SetText("解除诅咒")
	HF_JCZZ_Text:SetPoint("TOPRIGHT", HF_FSXQ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_JCZZ_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_JCZZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：驱散所有队友的诅咒。\n指向：驱散指向队友的诅咒。\n自己：仅驱散自己的诅咒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_JCZZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --解除诅咒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_JCZZ) --解除诅咒
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_LYHT_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_LYHT_Text:SetText("烈焰护体")
	HF_LYHT_Text:SetPoint("TOPRIGHT", HF_JCZZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "HF_LYHT_Dropdown", HF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", HF_LYHT_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("是否维持烈焰护体增益。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.HF_LYHT==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.HF_LYHT)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local HF_ZLS_Text = HF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	HF_ZLS_Text:SetText("治疗石")
	HF_ZLS_Text:SetPoint("TOPRIGHT", HF_LYHT_Text, "BOTTOMRIGHT", 0, OptionsInterval)

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--冰法 子窗体---------------------------------------------------------------------------------------------------
	local BF_Frame = CreateFrame("Frame", "BF_Frame", configFrame)
	BF_Frame:SetSize(1, 1)
	BF_Frame:SetPoint("CENTER", 0, 0)
	--冰法 子窗体---------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_ZNMB_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_ZNMB_Text:SetText("智能目标")
	BF_ZNMB_Text:SetPoint("TOPLEFT", iconTexture, "BOTTOMLEFT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_ZNMB_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_ZNMB_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_ZNMB==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --智能目标
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_ZNMB) --智能目标
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_ZNJD_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_ZNJD_Text:SetText("智能焦点")
	BF_ZNJD_Text:SetPoint("TOPRIGHT", BF_ZNMB_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_ZNJD_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_ZNJD_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_ZNJD==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_ZNJD)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_FSFZ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_FSFZ_Text:SetText("法术反制")
	BF_FSFZ_Text:SetPoint("TOPRIGHT", BF_ZNJD_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_FSFZ_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_FSFZ_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_FSFZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --法术反制
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_FSFZ) --法术反制
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_DDMS_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_DDMS_Text:SetText("打断延迟")
	BF_DDMS_Text:SetPoint("TOPRIGHT", BF_FSFZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)
	
	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_DDMS_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_DDMS_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_DDMS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_DDMS)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_JCZZ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_JCZZ_Text:SetText("解除诅咒")
	BF_JCZZ_Text:SetPoint("TOPRIGHT", BF_DDMS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_JCZZ_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_JCZZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("智能：驱散所有队友的诅咒。\n指向：驱散指向队友的诅咒。\n自己：仅驱散自己的诅咒。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_JCZZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --解除诅咒
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_JCZZ) --解除诅咒
	end
	-----------------------------------------------------------------------------------------------------	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_JX_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_JX_Text:SetText("镜像")
	BF_JX_Text:SetPoint("TOPRIGHT", BF_JCZZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_JX_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_JX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用|cff00adf0镜像|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_JX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_JX)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_QTPZ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_QTPZ_Text:SetText("群体屏障")
	BF_QTPZ_Text:SetPoint("TOPRIGHT", BF_JX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_QTPZ_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_QTPZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当队伍平均损失血量比例|cffff5040大于|r设定设定值，自动使用|cff00adf0群体屏障|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_QTPZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_QTPZ)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_HBPZ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_HBPZ_Text:SetText("深寒凝冰")
	BF_HBPZ_Text:SetPoint("TOPRIGHT", BF_QTPZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_HBPZ_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_HBPZ_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用|cff00adf0寒冰屏障/深寒凝冰|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_HBPZ==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_HBPZ)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_QHYX_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_QHYX_Text:SetText("强化隐形")
	BF_QHYX_Text:SetPoint("TOPRIGHT", BF_HBPZ_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_QHYX_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_QHYX_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用|cff00adf0强化隐形|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_QHYX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_QHYX)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_ZLS_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_ZLS_Text:SetText("治疗石")
	BF_ZLS_Text:SetPoint("TOPRIGHT", BF_QHYX_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_ZLS_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_ZLS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用|cff00adf0治疗石|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_ZLS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗石
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_ZLS) --治疗石
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	local BF_ZLYS_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_ZLYS_Text:SetText("治疗药水")
	BF_ZLYS_Text:SetPoint("TOPRIGHT", BF_ZLS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_ZLYS_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_ZLYS_Text, "RIGHT", -16, -2)--
	
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
		GameTooltip:SetText("当生命值低于设定，自动使用|cff00adf0治疗药水|r。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_ZLYS==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1) --治疗药水
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_ZLYS) --治疗药水
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_SP1_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_SP1_Text:SetText("饰品①")
	BF_SP1_Text:SetPoint("TOPRIGHT", BF_ZLYS_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_SP1_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_SP1_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_SP1==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_SP1)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_SP2_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_SP2_Text:SetText("饰品②")
	BF_SP2_Text:SetPoint("TOPRIGHT", BF_SP1_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_SP2_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_SP2_Text, "RIGHT", -16, -2)--
	
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
	if WRSet.BF_SP2==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_SP2)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_BFX_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_BFX_Text:SetText("暴风雪")
	BF_BFX_Text:SetPoint("TOPRIGHT", BF_SP2_Text, "BOTTOMRIGHT", 0, OptionsInterval)

	-- 创建下拉菜单
	local dropdown = CreateFrame("Frame", "BF_BFX_Dropdown", BF_Frame, "UIDropDownMenuTemplate")
	dropdown:SetPoint("LEFT", BF_BFX_Text, "RIGHT", -16, -2)--
	
	-- 设置下拉菜单框架大小
	UIDropDownMenu_SetWidth(dropdown, 70)

	-- 初始化下拉菜单项
	local menuItems = {
		{text = "指向", func = function() UIDropDownMenu_SetSelectedID(dropdown, 1) end},
		{text = "提示", func = function() UIDropDownMenu_SetSelectedID(dropdown, 2) end},
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
		GameTooltip:SetText("暴风雪的施法方式。")
		GameTooltip:Show()
	end)
	
	-- 鼠标离开时隐藏提示
	dropdown:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- 读取存储的参数
	if WRSet.BF_BFX==nil then
		UIDropDownMenu_SetSelectedID(dropdown, 1)
	else
		UIDropDownMenu_SetSelectedID(dropdown, WRSet.BF_BFX)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_FSXQ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_FSXQ_Text:SetText("吸取")
	BF_FSXQ_Text:SetPoint("TOPRIGHT", BF_BFX_Text, "BOTTOMRIGHT", -33, OptionsInterval)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_FSXQ_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_FSXQ_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0法术吸取|r")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_FSXQ==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_FSXQ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_HBHT_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_HBHT_Text:SetText("护体")
	BF_HBHT_Text:SetPoint("LEFT", BF_FSXQ_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_HBHT_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_HBHT_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0寒冰护体|r")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_HBHT==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_HBHT)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_CJXX_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_CJXX_Text:SetText("超星")
	BF_CJXX_Text:SetPoint("LEFT", BF_HBHT_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_CJXX_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_CJXX_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0超级新星|r(控制)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_CJXX==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_CJXX)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_CJB_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_CJB_Text:SetText("冲击")
	BF_CJB_Text:SetPoint("LEFT", BF_CJXX_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_CJB_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_CJB_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0冲击波|r(控制)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_CJB==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_CJB)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_BLXM_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_BLXM_Text:SetText("冰脉")
	BF_BLXM_Text:SetPoint("TOP", BF_FSXQ_Checkbox, "BOTTOM", 0, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_BLXM_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_BLXM_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0冰冻血脉|r(爆发)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_BLXM==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_BLXM)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_BYHN_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_BYHN_Text:SetText("幻能")
	BF_BYHN_Text:SetPoint("LEFT", BF_BLXM_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_BYHN_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_BYHN_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0变易幻能|r(爆发)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_BYHN==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_BYHN)
	end
	-----------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_JSLQ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_JSLQ_Text:SetText("急冷")
	BF_JSLQ_Text:SetPoint("LEFT", BF_BYHN_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_JSLQ_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_JSLQ_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0急速冷却|r(刷新冰箱)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_JSLQ==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_JSLQ)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_FB_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_FB_Text:SetText("浮冰")
	BF_FB_Text:SetPoint("LEFT", BF_JSLQ_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_FB_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_FB_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0浮冰|r(|cff00adf0变易幻能|r及|cff00adf0冰霜射线|r时使用)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_FB==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_FB)
	end
	-----------------------------------------------------------------------------------------------------
	
	--[[
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_BXS_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_BXS_Text:SetText("变形")
	BF_BXS_Text:SetPoint("LEFT", BF_JSLQ_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_BXS_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_BXS_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0变形术|r(特殊指向)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_BXS==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_BXS)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_BFYS_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_BFYS_Text:SetText("药水")
	BF_BFYS_Text:SetPoint("TOP", BF_BLXM_Checkbox, "BOTTOM", 0, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_BFYS_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_BFYS_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0爆发药水|r(爆发)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_BFYS==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_BFYS)
	end
	-----------------------------------------------------------------------------------------------------
	
	-----------------------------------------------------------------------------------------------------
	-- 设置说明文字
	BF_CKSJ_Text = BF_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BF_CKSJ_Text:SetText("操控")
	BF_CKSJ_Text:SetPoint("LEFT", BF_BFYS_Text, "RIGHT", 8, 0)
	-- 创建勾选框
	local checkbox = CreateFrame("CheckButton", "BF_CKSJ_Checkbox", BF_Frame, "UICheckButtonTemplate")
	checkbox:SetPoint("TOP", BF_CKSJ_Text, "BOTTOM", 0, 0)
	checkbox:SetChecked(false)
	-- 鼠标指向时的提示
	checkbox:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText("|cff00adf0操控时间|r(慎用)")
		GameTooltip:Show()
	end)
	-- 鼠标离开时隐藏提示
	checkbox:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	-- 读取存储的参数
	if WRSet.BF_CKSJ==nil then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(WRSet.BF_CKSJ)
	end
	-----------------------------------------------------------------------------------------------------
	--]]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
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

