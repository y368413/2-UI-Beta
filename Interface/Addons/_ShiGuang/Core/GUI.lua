local M, R, U, I = unpack(select(2, ...))

-- Default Settings
local defaultSettings = {
	Actionbar = {
		Enable = true,
		Hotkeys = true,
		Macro = true,
		Count = true,
		Classcolor = false,
		Cooldown = true,
		DecimalCD = true,
		Styles = 6,
		Bar4Fade = false,
		Bar5Fade = false,
	},
	Auras = {
		Reminder = true,
		Stagger = true,
		BloodyHell = true,
		Totems = true,
		DestroyTotems = true,
		Marksman = true,
		Statue = true,
	},
	AuraWatch = {
		Enable = true,
		Hint = true,
	},
	Chat = {
		Sticky = false,
		Chatbg = false,
		Chattabbg = false,
		Lock = true,
		Invite = true,
		Keyword = "2",
		GuildInvite = false,
		Matches = 1,
	},
	Map = {
		Coord = true,
		Clock = false,
		MapScale = 1.1,
		MinmapScale = 1.4,
		WhoPings = true,
	},
	Nameplate = {
		Enable = true,
		ColorBorder = false,
		PlayerAura = false,
		maxAuras = 6,
		AuraSize = 20,
		AuraFilter = 2,
		OtherFilter = 2,
		FriendlyCC = false,
		HostileCC = true,
		TankMode = false,
		Arrow = true,
		InsideView = true,
		MinAlpha = .7,
		Width = 88,
		Height = 6,
	},
	Skins = {
		DBM = true,
		Skada = false,
		Bigwigs = false,
		CastBar = false,
		QuestTrackerSkinTitle = true,
	},
	Misc = {
		Mail = true,
		HideErrors = true,
		SoloInfo = true,
		RareAlerter = true,
		AlertinChat = false,
		Focuser = true,
		Autoequip = true,
		Screenshot = false,
		TradeTab = true,
		Interrupt = true,
		InterruptSound = true,
		FasterLoot = true,
		AutoQuest = true,
		HideTalking = true,
		HideBanner = false,
		QuickQueue = true,
		PetFilter = true,
		--FriendGroups = true,
		AchievementPrintScreen = true,
		TuBar = true,
		AltTabLfgNotification = false,
		CrazyCatLady = true,
		SpellNotReadyYet = true,
		DoomCooldownPulse = true,
		nPower = true,
		ClassRecourePlace = true,
		WallpaperKit = true,
		AutoReagentBank = true,
		kAutoOpen = false,
		AutoConfirmRoll = false,
		Saycast = true,
		OmniCC = true,
	},
	Settings = {
		LockUIScale = false,
		SetScale = .8,
		GUIScale = 0.9,
		PlayerFrameScale = 0.9,
		Format = 2,
		UFPctText = true,
		UFClassIcon = false,
		UFFade = false,
	},
}

MaoRUI:EventFrame("ADDON_LOADED"):SetScript("OnEvent", function(self, event, addon)
	if addon ~= "_ShiGuang" then return end
	self:UnregisterEvent("ADDON_LOADED")
	if not MaoRUISettingDB["LEGION"] then
		MaoRUISettingDB = {}
		MaoRUISettingDB["LEGION"] = true
	end

	for i, j in pairs(defaultSettings) do
		if type(j) == "table" then
			if MaoRUISettingDB[i] == nil then MaoRUISettingDB[i] = {} end
			for k, v in pairs(j) do
				if MaoRUISettingDB[i][k] == nil then
					MaoRUISettingDB[i][k] = v
				end
			end
		else
			if MaoRUISettingDB[i] == nil then MaoRUISettingDB[i] = j end
		end
	end
end)

-- Config
local tabList = {
	"一般",
	"姓名板",
	"设置",
	"槽点最多的",
	"动作条",
}

local optionList = {		-- type, key, value, name, horizon, horizon2, doubleline
	[1] = {
	  {1, "Settings", "LockUIScale", U["Lock UIScale"]},
	  {1, "Chat", "Lock", U["Lock Chat"], true},
	  {1, "Map", "Clock", U["Minimap Clock"], true, true},
		{3, "Settings", "SetScale", U["Setup UIScale"], false, false, {.6, 1.1, 2}},
		{3, "Settings", "PlayerFrameScale", U["PlayerFrame Scale"], true, false, {0.6, 1.2, 1}}, --{3, "Settings", "GUIScale", "设置面板缩放", true, false, {.6, 1.2, 1}},
		{3, "Map", "MapScale", U["Map Scale"], true, true, {0.8, 1.6, 1}},
	  {},--blank
	  {1, "Map", "Coord", U["Map Coords"]},
		{1, "Auras", "Reminder", U["Enable Reminder"], true},
		{1, "Auras", "Familiar", U["Enable Familiar"], true, true},
		{1, "Auras", "Stagger", U["Enable Stagger"]},
		{1, "Auras", "Statue", U["Enable Statue"], true},
		{1, "Auras", "BloodyHell", U["Enable BloodyHell"], true, true},
		{1, "Auras", "Totems", U["Enable Totems"]},
		{1, "Auras", "DestroyTotems", U["Destroy Totems"], true},
		{1, "Auras", "Marksman", U["Enable Marksman"], true, true},
		{},--blank
		{1, "Misc", "kAutoOpen", U["kAutoOpen"]},
		{1, "Misc", "QuickQueue", U["QuickQueue"], true},
		{1, "Misc", "AutoConfirmRoll", U["AutoConfirmRoll"], true, true},
	},
	[2] = {
		{1, "Nameplate", "Enable", U["Enable Nameplate"]},
	  {1, "Nameplate", "TankMode", U["Tank Mode"], true},
	  {1, "Nameplate", "ColorBorder", U["Auras Border"], true, true},
		{1, "Nameplate", "FriendlyCC", U["Friendly CC"]},
		{1, "Nameplate", "HostileCC", U["Hostile CC"], true},
		{1, "Nameplate", "InsideView", U["Nameplate InsideView"], true, true},
		{3, "Nameplate", "maxAuras", U["Max Auras"], false, false, {0, 9, 0}},
		{3, "Nameplate", "AuraSize", U["Auras Size"], true, false, {16, 36, 0}},
		{},--blank
		{1, "Nameplate", "PlayerAura", U["PlayerPlate Aura"]},
		{4, "Nameplate", "AuraFilter", "自身施放法术过滤", true, false, {"屏蔽全部", "显示全部自身施放的", "只显示控制技能", "不显示黑名单", "使用技能监视目标光环组"}},
		{4, "Nameplate", "OtherFilter", "他人施放法术过滤", true, true, {"屏蔽全部", "只显示控制技能"}},
		--{1, "Nameplate", "Arrow", "显示当前目标指示箭头"},
		{3, "Nameplate", "MinAlpha", U["Nameplate MinAlpha"], false, false, {0, 1, 1}},
		{3, "Nameplate", "Width", U["NP Width"], true, false, {43, 121, 0}},
		{3, "Nameplate", "Height", U["NP Height"], true, true, {3, 16, 0}},
	},
	[3] = {
	  {1, "Misc", "FasterLoot", U["Faster Loot"]},
		{1, "Misc", "Mail", U["Mail Tool"], true},
		{1, "Misc", "HideErrors", U["Hide Error"], true, true},
		{},--blank
		{1, "Misc", "SoloInfo", U["SoloInfo"]},
		{1, "Misc", "RareAlerter", U["Rare Alert"], true},
		{1, "Misc", "AlertinChat", U["Alert In Chat"], true, true},
		{1, "Misc", "Interrupt", "通报打断\偷取\驱散"},
	  {1, "Misc", "InterruptSound", "打断音效", true,},
	  {1, "Misc", "CrazyCatLady", "!死亡爽翻天惨叫!", true, true},
		{},--blank
		{1, "Misc", "Focuser", U["Easy Focus"]},
		{1, "Misc", "HideTalking", U["No Talking"], true},
		{4, "Settings", "Format", "数字缩写格式", true, true, {"标准模式：b/m/k", "中式：亿/万", "显示具体数值"}},
				--{1, "Misc", "FriendGroups", U["FriendGroups"]},
		{1, "Chat", "Invite", U["Whisper Invite"]},
		{1, "Chat", "GuildInvite", U["Guild Invite Only"], true},	
		{1, "Misc", "HideBanner", U["Hide Bossbanner"]},
		{1, "Skins", "DBM", "DBM Skin", true},
		{2, "Chat", "Keyword", U["Whisper Keyword"], true, true},
	},
	[4] = {
		{1, "AuraWatch", "Enable", U["Enable AuraWatch"]},
		{1, "AuraWatch", "Hint", U["AuraWatch Tooltip"], true},
		{1, "Misc", "AchievementPrintScreen", "跳成就时候截图", true, true},
		{1, "Misc", "TuBar", "技能栏"},
		{1, "Misc", "SpellNotReadyYet", "技能CD中提醒", true},
	  {1, "Misc", "DoomCooldownPulse", "技能CD完成提示", true, true},
	  {1, "Misc", "nPower", "职业能量条"},
	  {1, "Misc", "ClassRecourePlace", "职业资源居中", true, true},
	  {1, "Misc", "OmniCC", "技能栏CD计时数字", true},
	  	  {},--blank
	  {1, "Misc", "AltTabLfgNotification", "M语自己提醒"},
	  {1, "Misc", "Saycast", "大技能喊话", true},
	  {1, "Misc", "AutoReagentBank", "材料自动存银行", true, true},
	  --{1, "Skins", "Skada", "Skada Skin", true},
	  --{1, "Skins", "Bigwigs", "Bigwigs Skin", true, true},
	  {1, "Settings", "UFClassIcon", "使用职业头像"},
	  {1, "Settings", "UFPctText", "使用大血量百分比", true},
	  {1, "Skins", "CastBar", "使用系统默认施法条", true, true},
	  {1, "Chat", "Sticky", "启用密语粘滞"},
	  {1, "Chat", "Chatbg", "聊天框背景", true},
	  {1, "Chat", "Chattabbg", "聊天框标签背景", true, true},
	  {1, "Skins", "QuestTrackerSkinTitle", "任务栏职业染色"},
	  {1, "Misc", "WallpaperKit", "屏保", true},
		--{1, "Chat", "Timestamp", "Timestamp", true, true},
		--{3, "Chat", "Matches", "Keyword Match", true, true, {1, 3, 0}},
	},
	[5] = {
    {1, "Actionbar", "Enable", U["Enable Actionbar"]},
    {4, "Actionbar", "Styles", U["Actionbar Style"], true, true, {"-- 2*(3+12+3) --", "-- 2*(6+12+6) --", "-- 2*6+3*12+2*6 --", "-- 3*12 --", "-- 2*(12+6) --", "-- MR --", "-- PVP --", "-- 3*(4+12+4) --", "-- PVP2 --", "-- JK --"}},
    {1, "Actionbar", "Hotkeys", U["Actionbar Hotkey"]},
		{1, "Actionbar", "Macro", U["Actionbar Macro"], true,},
		{1, "Actionbar", "Bar4Fade", U["Bar4 Fade"]},
		{1, "Actionbar", "Bar5Fade", U["Bar5 Fade"], true},
		{1, "Actionbar", "Count", U["Actionbar Item Counts"]},		
		{1, "Actionbar", "Cooldown", U["Show Cooldown"], true},
		{1, "Actionbar", "Classcolor", U["ClassColor BG"]},
		{1, "Actionbar", "DecimalCD", U["Decimal Cooldown"], true},
	--{2, "Chat", "FilterList", "Filter List"},
	},
}

local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b
local guiTab, guiPage, f, x, y = {}, {}

local function SelectTab(i)
	for num = 1, #tabList do
		if num == i then
			guiTab[num]:SetBackdropColor(r, g, b, .3)
			guiTab[num].checked = true
			guiPage[num]:Show()
		else
			guiTab[num]:SetBackdropColor(0, 0, 0, .3)
			guiTab[num].checked = false
			guiPage[num]:Hide()
		end
	end
end

local function CreateTab(i, name)
	local tab = CreateFrame("Button", nil, NDuiGUI)
	tab:SetPoint("TOP", -222 + 111*(i-1), -128)
	tab:SetSize(111, 30)
	M.CreateBD(tab, .3)
	local label = M.CreateFS(tab, 15, name, false, "CENTER", 0, 0)
	label:SetTextColor(1, .8, 0)

	tab:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
		SelectTab(i)
	end)
	tab:SetScript("OnEnter", function(self)
		if self.checked then return end
		self:SetBackdropColor(r, g, b, .3)
	end)
	tab:SetScript("OnLeave", function(self)
		if self.checked then return end
		self:SetBackdropColor(0, 0, 0, .3)
	end)
	return tab
end

local function CreateOption(i)
	local parent, offset = guiPage[i].child, 20

	for _, option in pairs(optionList[i]) do
		local type, key, value, name, horizon, horizon2, data = unpack(option)
		-- Checkboxes
		if type == 1 then
			local cb = M.CreateCheckBox(parent)
			if horizon2 then
				cb:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				cb:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				cb:SetPoint("TOPLEFT", 20, -offset)
				offset = offset + 35
			end
			M.CreateFS(cb, 14, name, false, "LEFT", 30, 0)
			cb:SetChecked(MaoRUISettingDB[key][value])
			cb:SetScript("OnClick", function()
				MaoRUISettingDB[key][value] = cb:GetChecked()
			end)
		-- Editbox
		elseif type == 2 then
			local eb = M.CreateEditBox(parent, 160, 30)
			eb:SetMaxLetters(200)
			if horizon2 then
				eb:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				eb:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				eb:SetPoint("TOPLEFT", 35, -offset - 20)
				offset = offset + 70
			end
			eb:SetText(MaoRUISettingDB[key][value])
			eb:HookScript("OnEscapePressed", function()
				eb:SetText(MaoRUISettingDB[key][value])
			end)
			eb:HookScript("OnEnterPressed", function()
				MaoRUISettingDB[key][value] = eb:GetText()
			end)
			eb:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:ClearLines()
				GameTooltip:AddLine("Tips")
				GameTooltip:AddLine("EdieBox Tip", .6,.8,1)
				GameTooltip:Show()
			end)
			eb:SetScript("OnLeave", GameTooltip_Hide)

			local label = M.CreateFS(eb, 14, name, false, "CENTER", 0, 25)
			label:SetTextColor(1, .8, 0)
		-- Slider
		elseif type == 3 then
			local min, max, step = unpack(data)
			local s = CreateFrame("Slider", key..value.."Slider", parent, "OptionsSliderTemplate")
			if horizon2 then
				s:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				s:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				s:SetPoint("TOPLEFT", 40, -offset - 30)
				offset = offset + 70
			end
			s:SetWidth(160)
			s:SetMinMaxValues(min, max)
			s:SetValue(MaoRUISettingDB[key][value])
			s:SetScript("OnValueChanged", function(self, v)
				local current = tonumber(format("%."..step.."f", v))
				MaoRUISettingDB[key][value] = current
				_G[s:GetName().."Text"]:SetText(current)
			end)

			local label = M.CreateFS(s, 14, name, false, "CENTER", 0, 25)
			label:SetTextColor(1, .8, 0)
			_G[s:GetName().."Low"]:SetText(min)
			_G[s:GetName().."High"]:SetText(max)
			_G[s:GetName().."Text"]:ClearAllPoints()
			_G[s:GetName().."Text"]:SetPoint("TOP", s, "BOTTOM", 0, 3)
			_G[s:GetName().."Text"]:SetText(format("%."..step.."f", MaoRUISettingDB[key][value]))
			s:SetBackdrop(nil)
			s.SetBackdrop = M.Dummy
			local bd = CreateFrame("Frame", nil, s)
			bd:SetPoint("TOPLEFT", 14, -2)
			bd:SetPoint("BOTTOMRIGHT", -15, 3)
			bd:SetFrameStrata("BACKGROUND")
			M.CreateBD(bd, .3)
			local slider = select(4, s:GetRegions())
			slider:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
			slider:SetBlendMode("ADD")
		-- Dropdown
		elseif type == 4 then
			local dd = M.CreateDropDown(parent, 160, 30, data)
			if horizon2 then
				dd:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				dd:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				dd:SetPoint("TOPLEFT", 35, -offset - 20)
				offset = offset + 70
			end
			dd.Text:SetText(data[MaoRUISettingDB[key][value]])

			local opt = dd.options
			dd.button:HookScript("OnClick", function()
				for num = 1, #data do
					if num == MaoRUISettingDB[key][value] then
						opt[num]:SetBackdropColor(1, .8, 0, .3)
						opt[num].checked = true
					else
						opt[num]:SetBackdropColor(0, 0, 0, .3)
						opt[num].checked = false
					end
				end
			end)
			for i in pairs(data) do
				opt[i]:HookScript("OnClick", function()
					MaoRUISettingDB[key][value] = i
				end)
			end

			local label = M.CreateFS(dd, 14, name, false, "CENTER", 0, 25)
			label:SetTextColor(1, .8, 0)
		-- String
		elseif type == 5 then
			local fs = parent:CreateFontString(nil, "OVERLAY")
			fs:SetFont(I.Font[1], 14, I.Font[3])
			fs:SetText(name)
			fs:SetTextColor(1, .8, 0)
			if horizon then
				fs:SetPoint("TOPLEFT", 335, -offset + 30)
			else
				fs:SetPoint("TOPLEFT", 25, -offset - 5)
				offset = offset + 35
			end
		-- Blank, no type
		else
			local l = CreateFrame("Frame", nil, parent)
			l:SetPoint("TOPLEFT", 25, -offset - 12)
			M.CreateGF(l, 550, .5, "Horizontal", .7, .7, .7, .7, 0)
			offset = offset + 35
		end
	end
end

local function OpenGUI()
	if InCombatLockdown() then UIErrorsFrame:AddMessage(I.InfoColor..ERR_NOT_IN_COMBAT) return end
	if f then f:Show() return end

	-- Main Frame
	f = CreateFrame("Frame", "NDuiGUI", UIParent)
	tinsert(UISpecialFrames, "NDuiGUI")
	 local bgTexture = f:CreateTexture("name", "BACKGROUND")
    bgTexture:SetTexture("Interface\\Destiny\\UI-Destiny");  --FontStyles\\FontStyleGarrisons
    bgTexture:SetTexCoord(0,1,0,600/1024);
    bgTexture:SetAllPoints();
    bgTexture:SetAlpha(1)
	--f:SetScale(MaoRUISettingDB["Settings"]["GUIScale"])  
	f:SetSize(1280, 600)
	f:SetPoint("CENTER")
	f:SetFrameStrata("HIGH")
	M.CreateMF(f)
	--M.CreateBD(f)
	--M.CreateTex(f)
	M.CreateFS(f, 43, "MaoR UI", true, "TOP", -43, -88)
	M.CreateFS(f, 21, I.Version, false, "TOP", 80, -88)

	local close = M.CreateButton(f, 66, 6, CLOSE)
	close:SetPoint("TOP", 280, -88)
	close:SetFrameLevel(3)
	close:SetScript("OnClick", function() f:Hide() end)

	local ok = M.CreateButton(f, 88, 21, OKAY)
	ok:SetPoint("BOTTOMRIGHT", -260, 66)
	ok:SetFrameLevel(3)
	ok:SetScript("OnClick", function()
		local scale = MaoRUISettingDB["Settings"]["SetScale"]
		if scale < .65 then UIParent:SetScale(scale)
		else SetCVar("uiScale", scale) end
		f:Hide()
		StaticPopup_Show("RELOAD_NDUI")
	end)

	-- PreUpdate Power Preference
	do
		local specList = optionList[2][8][7]
		tinsert(specList, NONE)
		for i = 1, 4 do
			local spec, name = GetSpecializationInfo(i)
			if spec then
				tinsert(specList, name)
			end
		end
	end

	for i, name in pairs(tabList) do
		guiTab[i] = CreateTab(i, name)
		guiPage[i] = CreateFrame("ScrollFrame", nil, f)
		guiPage[i]:SetPoint("TOPLEFT", 300, -160)
		guiPage[i]:SetSize(680, 400)
		--M.CreateBD(guiPage[i], .3)
		--guiPage[i]:Hide()
		guiPage[i].child = CreateFrame("Frame", nil, guiPage[i])
		guiPage[i].child:SetSize(1, 1)
		guiPage[i]:SetScrollChild(guiPage[i].child)
		CreateOption(i)
	end
	--------------------------------------------------------------------------------
	local Siweia = CreateFrame("Button", nil, f)
	Siweia:SetPoint("BOTTOM", 0, 66)
	Siweia:SetSize(360, 21)
	Siweia:SetFrameLevel(3)
	M.CreateFS(Siweia, 16, "控制台是基于Si大大的NDui控制台魔改的，诚挚感激！", true)
	--------------------------------------------------------------------------------
	local reset = M.CreateButton(f, 88, 21, "Reset?")
	reset:SetPoint("BOTTOMLEFT", 260, 66)
	StaticPopupDialogs["RESET_NDUI"] = {
		text = "确定初始化插件设置？",
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			MaoRUISettingDB = {}
			MaoRUIDB = {}
			ReloadUI()
		end,
		whileDead = 1,
	}
	reset:SetScript("OnClick", function()
		StaticPopup_Show("RESET_NDUI")
	end)

	--[[local credit = CreateFrame("Button", nil, f)
	credit:SetPoint("TOPRIGHT", -20, -15)
	credit:SetSize(35, 35)
	credit.Icon = credit:CreateTexture(nil, "ARTWORK")
	credit.Icon:SetAllPoints()
	credit.Icon:SetTexture(I.creditTex)
	credit:SetHighlightTexture(I.creditTex)
	credit:SetScript("OnEnter", function()
		GameTooltip:ClearLines()
		GameTooltip:SetOwner(f, "ANCHOR_TOPRIGHT", 0, 3)
		GameTooltip:AddLine("Credits:")
		GameTooltip:AddLine(GetAddOnMetadata("_ShiGuang", "Credits"), .6,.8,1, 1)
		GameTooltip:Show()
	end)
	credit:SetScript("OnLeave", GameTooltip_Hide)]]

	MaoRUI:EventFrame("PLAYER_REGEN_DISABLED"):SetScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				f:Hide()
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
			end
		else
			f:Show()
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		end
	end)

	--[[ Toggle AuraWatch Console
	local aura = M.CreateButton(guiPage[6], 150, 30, "Add AuraWatch")
	aura:SetPoint("TOPLEFT", 340, -50)
	aura:SetScript("OnClick", function()
		f:Hide()
		SlashCmdList["NDUI_AWCONFIG"]()
	end)]]

	SelectTab(5)
end

local gui = CreateFrame("Button", "GameMenuFrameNDui", GameMenuFrame, "GameMenuButtonTemplate")
gui:SetText("MaoR UI")
gui:SetPoint("TOP", GameMenuButtonAddons, "BOTTOM", 0, -2)
GameMenuFrame:HookScript("OnShow", function(self)
	GameMenuButtonLogout:SetPoint("TOP", gui, "BOTTOM", 0, -12)
	self:SetHeight(self:GetHeight() + gui:GetHeight() + 6)
end)

gui:SetScript("OnClick", function()
	OpenGUI()
	HideUIPanel(GameMenuFrame)
	PlaySound(852) -- SOUNDKIT.IG_MAINMENU_OPTION
end)


SlashCmdList["MAORUIGUI"] = function() OpenGUI() end
SLASH_MAORUIGUI1 = '/mr'