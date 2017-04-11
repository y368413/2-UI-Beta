local M, R, U, I = unpack(select(2, ...))

ShiGuangSettingDB = {
	DisplayInfo = 71057,			--68323   --35908   --65636
	["read"] = false,
	["GROUP_STACKS"] = true,
	["ADVANCED"] = true,
	["MAIL_DEFAULT"] = true,
	["QUALITY_COLORS"] = true,
	["Switch"]		= true,  --通告功能 打开/关闭
	["Instance"]	= true,	 --在副本中时通报				
	["Raid"]		= false,    --在团队中时通报
	["Party"]		= true,    --在小队中时通报
	["Solo"]		= false,   --单人时候通报
	["Sound"]		= true,    --完成时播放提示音
	["Debug"]		= true,   --任务进度彩色提示
	["NoDetail"]	= true,  --不通报详细进度
	["CompleteX"]	= false, --自动移除追踪面板中已完成的任务
	  ["fadeInTime"] = 0.3, 
    ["fadeOutTime"] = 0.7, 
    ["maxAlpha"] = 0.7, 
    ["animScale"] = 1.5, 
    ["iconSize"] = 1, 
    ["holdTime"] = 0.25,
    ["petOverlay"] = {1,1,1},
    ["ignoredSpells"] = "",
	  ["showSpellName"] = true,
	["AddonSet"] = {
		{ "_ShiGuang","Combuctor",
			["name"] = "极简", }, -- [1]
		{ "_ShiGuang","Combuctor","Gladius","PVPMaster","Skada","WhisperMaster",
			["name"] = "PVP", }, -- [2]
		{ "AngryKeystones","AngryWorldQuests","Combuctor","GarrisonMaster","Skada","WhisperMaster","DBM-Core","DBM-TrialofValor","DBM-Nighthold","DBM-BrokenIsles","DBM-EmeraldNightmare","DBM-Party-Legion","DBM-StatusBarTimers","DBM-DefaultSkin","DBM-Archaeology","DBM-GUI","DBM-PvP","DBM-WorldEvents","DBM-VPYike","DBM-Brawlers","DBM-DMF","DBM-ProvingGrounds","DBM-GarrisonInvasions","DBM-Party-Cataclysm","DBM-Party-MoP","DBM-SiegeOfOrgrimmarV2","DBM-Scenario-MoP","DBM-HeartofFear","DBM-TerraceofEndlessSpring","DBM-Pandaria","DBM-ThroneofThunder","DBM-MogushanVaults","DBM-HellfireCitadel","DBM-Party-BC","DBM-Party-WoD","DBM-Draenor","DBM-Highmaul","DBM-BlackrockFoundry","DBM-Party-WotLK",
			["name"] = "初始", }, -- [3]
	},
}
-- Default Settings
local defaultSettings = {
	Auras = {
		Familiar = true,
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
		Lock = true,
		Invite = true,
		Keyword = "2",
		GuildInvite = false,
	},
	Map = {
		Coord = true,
		Clock = false,
		MapScale = 1.1,
		MinmapScale = 1.4,
		ShowRecycleBin = true,
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
	Misc = {
		Mail = true,
		HideErrors = true,
		SoloInfo = true,
		RareAlerter = true,
		AlertinChat = false,
		FontFlag = false,
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
		FriendGroups = true,
		AchievementPrintScreen = true,
		TuBar = true,
		AltTabLfgNotification = false,
		CrazyCatLady = true,
		SpellNotReadyYet = true,
		DoomCooldownPulse = true,
		nPower = true,
		ClassRecourePlace = false,
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
	"姓名版",
	"设置",
	"槽点最多的",
	"Coming Soon",
}

local optionList = {		-- type, key, value, name, horizon, horizon2, doubleline
	[1] = {
	  {1, "Settings", "LockUIScale", "锁定推荐UI缩放值"},
	  {1, "Chat", "Lock", "锁定聊天窗口设置", true},
	  {1, "Map", "Clock", "小地图时间", true, true},
		{3, "Settings", "SetScale", "调整UI缩放", false, false, {.6, 1.1, 2}},
		{3, "Settings", "PlayerFrameScale", "头像缩放", true, false, {0.6, 1.2, 1}}, --{3, "Settings", "GUIScale", "设置面板缩放", true, false, {.6, 1.2, 1}},
		{3, "Map", "MapScale", "世界地图缩放", true, true, {0.8, 1.6, 1}},
	  {},--blank
	  {1, "Map", "Coord", "显示世界地图坐标"},
		{1, "Auras", "Reminder", "启用职业技能缺失提示", true},
		{1, "Auras", "Familiar", "启用职业监控-FS", true, true},
		{1, "Auras", "Stagger", "启用职业监控-WST"},
		{1, "Auras", "Statue", "启用职业监控-雕像", true},
		{1, "Auras", "BloodyHell", "启用职业监控-DK", true, true},
		{1, "Auras", "Totems", "启用职业监控-SM"},
		{1, "Auras", "DestroyTotems", "左键点击摧毁图腾", true},
		{1, "Auras", "Marksman", "启用职业监控-LR", true, true},
		{},--blank
		{1, "Misc", "kAutoOpen", "自动打开宝箱"},
		{1, "Misc", "QuickQueue", "自动确认排本职责", true},
	},
	[2] = {
		{1, "Nameplate", "Enable", "启用姓名板(血条)"},
	  {1, "Nameplate", "TankMode", "T仇恨染色样式", true},
	  {1, "Nameplate", "ColorBorder", "显示技能类型染色边框", true, true},
		{1, "Nameplate", "FriendlyCC", "友方玩家职业染色"},
		{1, "Nameplate", "HostileCC", "敌对玩家职业染色", true},
		{1, "Nameplate", "InsideView", "已接触姓名板停留视野内", true, true},
		{3, "Nameplate", "maxAuras", "最大法术图标数", false, false, {0, 9, 0}},
		{3, "Nameplate", "AuraSize", "法术图标大小", true, false, {16, 36, 0}},
		{},--blank
		{1, "Nameplate", "PlayerAura", "显示玩家姓名板法术"},
		{4, "Nameplate", "AuraFilter", "自身施放法术过滤", true, false, {"屏蔽全部", "显示全部自身施放的", "只显示控制技能", "不显示黑名单", "使用技能监视目标光环组"}},
		{4, "Nameplate", "OtherFilter", "他人施放法术过滤", true, true, {"屏蔽全部", "只显示控制技能"}},
		--{1, "Nameplate", "Arrow", "显示当前目标指示箭头"},
		{3, "Nameplate", "MinAlpha", "姓名板最小透明度", false, false, {0, 1, 1}},
		{3, "Nameplate", "Width", "姓名板长度", true, false, {43, 121, 0}},
		{3, "Nameplate", "Height", "姓名板宽度", true, true, {3, 16, 0}},
	},
	[3] = {
	  {1, "Misc", "FasterLoot", "自动拾取加速"},
		{1, "Misc", "Mail", "启用邮件增强", true},
		{1, "Misc", "HideErrors", "战斗中屏蔽红字错误", true, true},
		{},--blank
		{1, "Misc", "SoloInfo", "单刷难度提醒"},
		{1, "Misc", "RareAlerter", "稀有 or 宝藏提示", true},
		{1, "Misc", "AlertinChat", "同时通报在聊天框", true, true},
		{},--blank
		{1, "Misc", "Focuser", "启用Shift+左键快速焦点"},
		{1, "Misc", "HideTalking", "干掉NPC BB的框", true},
		{1, "Misc", "HideBanner", "关闭副本掉落通知提示", true, true},
		{1, "Misc", "FriendGroups", "好友分组功能"},
		{1, "Misc", "FontFlag", "字体阴影描边(有bug)", true},
		{4, "Settings", "Format", nil, true, true, {"标准模式：b/m/k", "中式：亿/万", "显示具体数值"}},
		{},--blank
		{1, "Chat", "GuildInvite", "只邀请公会成员"},
		{1, "Chat", "Invite", "启用密语自动邀请", true},
		{2, "Chat", "Keyword", "密语关键词（空格隔开）", true, true},
	},
	[4] = {
		{1, "AuraWatch", "Enable", "启用技能监视"},
		{1, "AuraWatch", "Hint", "显示技能监视鼠标提示框", true},
		{1, "Misc", "WallpaperKit", "屏保", true, true},
		{1, "Misc", "SpellNotReadyYet", "技能CD中提醒"},
	  {1, "Misc", "DoomCooldownPulse", "技能CD完成提示", true},
	  {1, "Misc", "AchievementPrintScreen", "跳成就时候截图", true, true},
	  {1, "Misc", "TuBar", "技能栏"},
	  {1, "Misc", "OmniCC", "技能栏CD计时数字", true},
	  {1, "Misc", "AutoConfirmRoll", "自动Roll", true, true},
	  {},--blank
	  {1, "Misc", "Interrupt", "通报打断\偷取\驱散"},
	  {1, "Misc", "InterruptSound", "打断音效", true,},
	  {1, "Misc", "CrazyCatLady", "!死亡爽翻天惨叫!", true, true},
	  {1, "Misc", "AltTabLfgNotification", "M语自己提醒"},
	  {1, "Misc", "Saycast", "大技能喊话", true},
	  {1, "Misc", "AutoReagentBank", "材料自动存银行", true, true},
	  {},--blank
	  {1, "Misc", "nPower", "职业能量条(2选1)"},
	  {1, "Misc", "ClassRecourePlace", "职业资源居中(2选1)", true},
	},
	[5] = {
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
		PlaySound("gsTitleOptionOK")
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
			local cb = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
			if horizon2 then
				cb:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				cb:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				cb:SetPoint("TOPLEFT", 20, -offset)
				offset = offset + 35
			end
			M.CreateCB(cb)
			M.CreateFS(cb, 14, name, false, "LEFT", 30, 0)
			cb:SetChecked(MaoRUISettingDB[key][value])
			cb:SetScript("OnClick", function()
				MaoRUISettingDB[key][value] = cb:GetChecked()
			end)
		-- Ediebox
		elseif type == 2 then
			local e = CreateFrame("EditBox", nil, parent)
			e:SetAutoFocus(false)
			e:SetSize(160, 30)
			e:SetMaxLetters(200)
			e:SetTextInsets(10, 10, 0, 0)
			e:SetFontObject(GameFontHighlight)
			if horizon2 then
				e:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				e:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				e:SetPoint("TOPLEFT", 35, -offset - 20)
				offset = offset + 70
			end
			e:SetText(MaoRUISettingDB[key][value])
			M.CreateBD(e, .3)
			e:SetScript("OnEscapePressed", function()
				e:ClearFocus()
				e:SetText(MaoRUISettingDB[key][value])
			end)
			e:SetScript("OnEnterPressed", function()
				e:ClearFocus()
				MaoRUISettingDB[key][value] = e:GetText()
			end)
			local label = M.CreateFS(e, 14, name, false, "CENTER", 0, 25)
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
			local drop = CreateFrame("Frame", nil, parent)
			if horizon2 then
				drop:SetPoint("TOPLEFT", 480, -offset + 35)
			elseif horizon then
				drop:SetPoint("TOPLEFT", 256, -offset + 35)
			else
				drop:SetPoint("TOPLEFT", 35, -offset - 20)
				offset = offset + 70
			end
			drop:SetSize(160, 30)
			M.CreateBD(drop, .3)		
			local t = M.CreateFS(drop, 14, data[MaoRUISettingDB[key][value]])
			local b = CreateFrame("Button", nil, drop)
			b:SetPoint("LEFT", drop, "RIGHT")
			b:SetSize(21, 21)
			b.Icon = b:CreateTexture(nil, "ARTWORK")
			b.Icon:SetAllPoints()
			b.Icon:SetTexture(I.gearTex)
			b:SetHighlightTexture(I.gearTex)			
			local l = CreateFrame("Frame", nil, drop)
			l:SetPoint("TOP", drop, "BOTTOM")
			M.CreateBD(l, .7)
			b:SetScript("OnShow", function() l:Hide() end)
			local label = M.CreateFS(drop, 14, name, false, "CENTER", 0, 25)
			label:SetTextColor(1, .8, 0)

			local opt = {}
			local function selectOpt(i)
				for num = 1, #data do
					if num == i then
						opt[num]:SetBackdropColor(1, .8, 0, .3)
						opt[num].checked = true
					else
						opt[num]:SetBackdropColor(0, 0, 0, .3)
						opt[num].checked = false
					end
				end
				MaoRUISettingDB[key][value] = i
				t:SetText(data[i])
			end
			for i, j in pairs(data) do
				opt[i] = CreateFrame("Button", nil, l)
				opt[i]:SetPoint("TOPLEFT", 5, -5 - (i-1)*30)
				opt[i]:SetSize(190, 30)
				M.CreateBD(opt[i], .1)
				M.CreateFS(opt[i], 14, j, false, "LEFT", 8, 0)
				opt[i]:SetScript("OnClick", function(self)
					PlaySound("gsTitleOptionOK")
					selectOpt(i)
					l:Hide()
				end)
				opt[i]:SetScript("OnEnter", function(self)
					if self.checked then return end
					self:SetBackdropColor(1, 1, 1, .3)
				end)
				opt[i]:SetScript("OnLeave", function(self)
					if self.checked then return end
					self:SetBackdropColor(0, 0, 0, .3)
				end)
				b:SetScript("OnClick", function()
					PlaySound("gsTitleOptionOK")
					ToggleFrame(l)
					selectOpt(MaoRUISettingDB[key][value])
				end)
				l:SetSize(200, i*30 + 10)
			end
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

	local close = CreateFrame("Button", nil, f)
	close:SetPoint("TOP", 280, -88)
	close:SetSize(66, 6)
	close:SetFrameLevel(3)
	M.CreateFS(close, 21, "X", true)
	close:SetScript("OnClick", function(self) f:Hide() end)
	local ok = CreateFrame("Button", nil, f)
	ok:SetPoint("BOTTOMRIGHT", -260, 66)
	ok:SetSize(88, 21)
	ok:SetFrameLevel(3)
	M.CreateBD(ok, .8)
	M.CreateFS(ok, 21, "Yes!", true)
	ok:SetScript("OnClick", function(self)
		local scale = MaoRUISettingDB["Settings"]["SetScale"]
		if scale < .65 then UIParent:SetScale(scale)
		else SetCVar("uiScale", scale) end
		f:Hide()
		StaticPopup_Show("RELOAD_NDUI")
	end)

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
	local Siweia = CreateFrame("Button", nil, f)
	Siweia:SetPoint("BOTTOM", 0, 66)
	Siweia:SetSize(360, 21)
	Siweia:SetFrameLevel(3)
	M.CreateFS(Siweia, 16, "控制台是基于Si大大的NDui控制台魔改的，诚挚感激！", true)
	local reset = CreateFrame("Button", nil, f)
	reset:SetPoint("BOTTOMLEFT", 260, 66)
	reset:SetSize(88, 21)
	M.CreateBD(reset, .8)
	M.CreateFS(reset, 14, "Reset?", true)
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
	reset:SetScript("OnClick", function(self)
		StaticPopup_Show("RESET_NDUI")
	end)

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

	SelectTab(4)
end

local gui = CreateFrame("Button", "GameMenuFrameNDui", GameMenuFrame, "GameMenuButtonTemplate")
gui:SetText("MaoR UI")
gui:SetPoint("TOP", GameMenuButtonAddons, "BOTTOM", 0, -2)
GameMenuFrame:HookScript("OnShow", function(self)
	GameMenuButtonLogout:SetPoint("TOP", gui, "BOTTOM", 0, -12)
	self:SetHeight(self:GetHeight() + gui:GetHeight() + 6)
end)
SlashCmdList["MAORUIGUI"] = function() OpenGUI() end
SLASH_MAORUIGUI1 = '/mr'
gui:SetScript("OnClick", function()
	OpenGUI()
	HideUIPanel(GameMenuFrame)
	PlaySound("igMainMenuOption")
end)