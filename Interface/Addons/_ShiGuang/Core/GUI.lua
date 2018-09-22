local _, ns = ...
local M, R, U, I = unpack(ns)

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
		Bar4Fades = false,
		Bar5Fades = false,
		ActionbarScale = 1,
	},
	Bags = {
		Enable = true,
		BagsScale = 0.9,
		IconSize = 34,
		BagsWidth = 10,
		BankWidth = 16,
		BagsiLvl = true,
		BagsiLvlcolor = false,
		Artifact = true,
		NewItemGlow = true,
		ReverseSort = true,
		ItemFilter = true,
		ItemSetFilter = false,
	},
	Auras = {
		Reminder = true,
		Stagger = true,
		BloodyHell = true,
		Totems = true,
		PortalMage = true,
		DestroyTotems = true,
		HunterTool = true,
		Statue = true,
		BlinkComboHelper = true,
		EnergyBar = true,
		ClassRecourePlace = true,
	},
	AuraWatch = {
		Enable = true,
		ClickThrough = false,
		IconScale = 1,
	},
	Chat = {
		Sticky = false,
		Chatbg = false,
		Chattabbg = false,
		Lock = true,
		Invite = true,
		Keyword = "2",
		GuildInvite = false,
		EnableFilter = true,
		Matches = 1,
		BlockAddonAlert = true,
	},
	Map = {
		Coord = true,
		Clock = false,
		MapScale = 1.1,
		MinmapScale = 1.4,
		WhoPings = true,
		MapReveal = false,
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
		Bigwigs = true,
		TMW = true,
		PetBattle = true,
		CastBarstyle = true,
		QuestTrackerSkinTitle = true,
		WeakAuras = true,
	},
	Tooltip = {
		CombatHide = true,
		Cursor = true,
		TargetBy = true,
		TooltipScale = 1,
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
		AltTabLfgNotification = false,
		CrazyCatLady = true,
		SpellNotReadyYet = true,
		DoomCooldownPulse = true,
		WallpaperKit = true,
		AutoReagentBank = true,
		kAutoOpen = true,
		AutoConfirmRoll = false,
		Saycast = true,
		OmniCC = true,
		AutoMark = true,
		QuestNotifier = true,
		QuestSchedule = false,
		xMerchant = true,
		FreeMountCD = true,
		WorldQusetRewardIcon = false,
		EXPTracker = true,
	},
	Settings = {
		LockUIScale = false,
		UIScale = .8,
		--GUIScale = 0.9,
		PlayerFrameScale = 0.9,
		Format = 2,
		UFPctText = true,
		UFClassIcon = false,
		UFFade = false,
	},
	Tutorial = {
		Complete = false,
	},
}

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, _, addon)
	if addon ~= "_ShiGuang" then return end
	if not MaoRUISettingDB["BFA"] then
		MaoRUISettingDB = {}
		MaoRUISettingDB["BFA"] = true
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
	self:UnregisterAllEvents()
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
	  {3, "Settings", "UIScale", U["Setup UIScale"], false, false, {.6, 1.1, 2}},
	  --{3, "Settings", "GUIScale", U["Setup GUIScale"], true, false, {.6, 1.2, 1}},
	  {3, "Settings", "PlayerFrameScale", U["PlayerFrame Scale"], true, false, {0.6, 1.2, 1}},
	  {3, "Map", "MapScale", U["Map Scale"], true, true, {0.8, 1.6, 1}},
	  {},--blank
	  {1, "Map", "Coord", U["Map Coords"]},
	  {1, "Map", "MapReveal", U["Map Reveal"], true},
		{1, "Auras", "Reminder", U["Enable Reminder"], true, true},
		{1, "Auras", "Stagger", U["Enable Stagger"]},
		{1, "Auras", "Statue", U["Enable Statue"], true},
		{1, "Auras", "BloodyHell", U["Enable BloodyHell"], true, true},
		{1, "Auras", "Totems", U["Enable Totems"]},
		{1, "Auras", "PortalMage", U["Enable Familiar"], true},
		{1, "Auras", "HunterTool", U["Enable Marksman"], true, true},
		{1, "Auras", "BlinkComboHelper", U["Enable BlinkComboHelper"]},
		{1, "Auras", "DestroyTotems", U["Destroy Totems"], true},
		{1, "Misc", "WorldQusetRewardIcon", U["WorldQusetRewardIcon"], true, true},
	  {1, "Auras", "EnergyBar", U["Class EnergyBar"]},
	  {1, "Auras", "ClassRecourePlace", U["Class Recoure Center"], true},
	  {1, "Misc", "FreeMountCD", "CD君(CN only)", true, true},
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
		{1, "Misc", "Interrupt", U["Yell Interrupt"]},
	  {1, "Misc", "InterruptSound", U["Interrupt Alarm"], true,},
	  {1, "Misc", "CrazyCatLady", U["Death Alarm"], true, true},
		{},--blank
		{1, "Misc", "Focuser", U["Easy Focus"]},
		{1, "Misc", "HideTalking", U["No Talking"], true},
		{4, "Settings", "Format", U["Numberize"], true, true, {U["Number Type1"], U["Number Type2"], U["Number Type3"]}},
				--{1, "Misc", "FriendGroups", U["FriendGroups"]},
		{1, "Chat", "Invite", U["Whisper Invite"]},
		{1, "Chat", "GuildInvite", U["Guild Invite Only"], true},	
		{1, "Misc", "HideBanner", U["Hide Bossbanner"]},
		{1, "Skins", "DBM", "DBM Skin", true},
		{2, "Chat", "Keyword", U["Whisper Keyword"], true, true},
	},
	[4] = {
		{1, "AuraWatch", "Enable", U["Enable AuraWatch"]},
		{1, "AuraWatch", "ClickThrough", U["AuraWatch Tooltip"], true},
		{1, "Misc", "AchievementPrintScreen", U["Achievement PrintScreen"], true, true},
		{1, "Misc", "SpellNotReadyYet", U["Spell Not Ready"]},
	  {1, "Misc", "DoomCooldownPulse", U["Doom Cooldown"], true},
	  {1, "Misc", "OmniCC", U["OmniCC"], true, true},
	  {1, "Misc", "WallpaperKit", U["WallpaperKit"]},
	  {1, "Misc", "xMerchant", U["xMerchant"], true},
	  {},--blank
	  --{1, "Misc", "AltTabLfgNotification", "M语自己提醒"},
	  --{1, "Misc", "Saycast", "大技能喊话", true},
	  --{1, "Skins", "Skada", "Skada Skin", true},
	  --{1, "Skins", "Bigwigs", "Bigwigs Skin", true, true},
	  {1, "Settings", "UFClassIcon", U["UFClassIcon"]},
	  {1, "Settings", "UFPctText", U["UFPctText"], true},
	  {1, "Bags", "Enable", U["Enable Bags"], true, true},
	  {1, "Chat", "Sticky", U["Chat Sticky"]},
	  {1, "Chat", "Chatbg", U["Chat bg"], true},
	  {1, "Chat", "Chattabbg", U["Chat tab bg"], true, true},
	  {1, "Skins", "QuestTrackerSkinTitle", U["QuestTrackerSkinTitle"]},
	  {1, "Misc", "AutoReagentBank", U["Auto Reagent Bank"], true},
	  {1, "Misc", "AutoMark", U["Auto Mark"], true, true},
		--{3, "Chat", "Matches", "Keyword Match", true, true, {1, 3, 0}},
				--{},--blank
		{1, "Misc", "kAutoOpen", U["kAutoOpen"]},
		{1, "Misc", "QuickQueue", U["QuickQueue"], true},
		{1, "Misc", "AutoConfirmRoll", U["AutoConfirmRoll"], true, true},
	},
	[5] = {
    {1, "Actionbar", "Enable", U["Enable Actionbar"]},
    {1, "Actionbar", "Hotkeys", U["Actionbar Hotkey"], true},
    {4, "Actionbar", "Styles", U["Actionbar Style"], true, true, {"-- 2*(3+12+3) --", "-- 2*(6+12+6) --", "-- 2*6+3*12+2*6 --", "-- 3*12 --", "-- 2*(12+6) --", "-- MR --", "-- PVP --", "-- 3*(4+12+4) --", "-- PVP2 --", "-- JK --"}},
    {1, "Actionbar", "Macro", U["Actionbar Macro"]},
    {1, "Actionbar", "Count", U["Actionbar Item Counts"], true},
		{1, "Actionbar", "Classcolor", U["ClassColor BG"]},	
		--{1, "Actionbar", "Bar4Fades", U["Bar4 Fade"]},
		--{1, "Actionbar", "Bar5Fades", U["Bar5 Fade"], true},	
		{1, "Actionbar", "Cooldown", U["Show Cooldown"]},		
		{1, "Actionbar", "DecimalCD", U["Decimal Cooldown"], true},
		--{2, "Chat", "FilterList", "Filter List", false, false, function() M.genFilterList() end},
		--{3, "Chat", "Matches", "Keyword Match", true, false, {1, 3, 0}},
		--{1, "Chat", "BlockAddonAlert", "Block Addon Alert"},
		{1, "Tooltip", "CombatHide", U["CombatHide"]},
		{1, "Tooltip", "TargetBy", U["TargetBy"], true},
		{1, "Tooltip", "Cursor", U["Cursor"]},
		{1, "Misc", "QuestNotifier", U["QuestNotifier"]},
		{1, "Misc", "QuestSchedule", U["QuestSchedule"], true},
		{3, "Actionbar", "ActionbarScale", U["Actionbar Scale"], false, false, {.8, 1.5, 1}},
		{3, "Tooltip", "TooltipScale", U["Tooltip Scale"], true, false, {.5, 1.5, 1}},
	},
}

local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b
local guiTab, guiPage, f = {}, {}

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

local function CreateTab(parent, i, name)
	local tab = CreateFrame("Button", nil, parent)
	tab:SetPoint("TOP", -222 + 111*(i-1), -128)
	tab:SetSize(111, 30)
	M.CreateBD(tab, .3)
	local label = M.CreateFS(tab, 15, name, false, "CENTER", 0, 0)
	label:SetTextColor(1, .8, 0)

	tab:SetScript("OnClick", function()
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
		local type, key, value, name, horizon, horizon2, data, callBack = unpack(option)
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
				if callBack then callBack() end
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
			s:SetScript("OnValueChanged", function(_, v)
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
			local bd = CreateFrame("Frame", nil, s)
			bd:SetPoint("TOPLEFT", 14, -2)
			bd:SetPoint("BOTTOMRIGHT", -15, 3)
			bd:SetFrameStrata("BACKGROUND")
			M.CreateBD(bd, .3)
			local thumb = _G[s:GetName().."Thumb"]
			thumb:SetTexture(I.sparkTex)
			thumb:SetBlendMode("ADD")
		-- Dropdown
		elseif type == 4 then
			local dd = M.CreateDropDown(parent, 143, 26, data)
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
						opt[num].selected = true
					else
						opt[num]:SetBackdropColor(0, 0, 0, .3)
						opt[num].selected = false
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
	--M.CreateBD(f, .5, 1)
	--M.CreateSD(f)
	--M.CreateTex(f)
	M.CreateFS(f, 43, "2 UI", true, "TOP", -43, -88)
	M.CreateFS(f, 21, I.Version, false, "TOP", 80, -88)

	local close = M.CreateButton(f, 21, 21, "X")
	close:SetPoint("TOP", 280, -88)
	close:SetFrameLevel(3)
	close:SetScript("OnClick", function() f:Hide() end)

	local scaleOld = MaoRUISettingDB["Settings"]["UIScale"]
	local ok = M.CreateButton(f, 88, 21, OKAY)
	ok:SetPoint("BOTTOMRIGHT", -260, 66)
	ok:SetFrameLevel(3)
	ok:SetScript("OnClick", function()
		local scale = MaoRUISettingDB["Settings"]["UIScale"]
		if scale ~= scaleOld then
		if scale < .64 then UIParent:SetScale(scale)
		else SetCVar("uiScale", scale) end
			if MaoRUISettingDB["Chat"]["Lock"] then
				ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 28)
			end
		end
		f:Hide()
		StaticPopup_Show("RELOAD_NDUI")
	end)

	for i, name in pairs(tabList) do
		guiTab[i] = CreateTab(f, i, name)
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
	local reset = M.CreateButton(f, 88, 21, "Reset?")
	reset:SetPoint("BOTTOMLEFT", 260, 66)
	StaticPopupDialogs["RESET_NDUI"] = {
		text = CONFIRM_RESET_SETTINGS,
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

	local credit = CreateFrame("Button", nil, f)
	credit:SetPoint("BOTTOM", 0, 66)
	credit:SetSize(360, 21)
	M.CreateFS(credit, 16, "This GUI learn form Siweia·s NDui，Sincere Gratitude！", true)

	local function showLater(event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				f:Hide()
				M:RegisterEvent("PLAYER_REGEN_ENABLED", showLater)
			end
		else
			f:Show()
			M:UnregisterEvent(event, showLater)
		end
	end
	M:RegisterEvent("PLAYER_REGEN_DISABLED", showLater)

	--[[  Toggle RaidFrame ClickSets
	local clickSet = M.CreateButton(guiPage[4], 150, 30, "Add ClickSets")
	clickSet:SetPoint("TOPLEFT", 40, -440)
	clickSet.text:SetTextColor(1, .8, 0)
	clickSet:SetScript("OnClick", function()
		f:Hide()
		SlashCmdList["AWCONFIG"]()
		AWConfigTab12:Click()
	end)

	-- Toggle AuraWatch Console
	local aura = M.CreateButton(guiPage[6], 150, 30, "Add AuraWatch")
	aura:SetPoint("TOPLEFT", 340, -50)
	aura.text:SetTextColor(1, .8, 0)
	aura:SetScript("OnClick", function()
		f:Hide()
		SlashCmdList["AWCONFIG"]()
	end)]]

	SelectTab(5)
end

local gui = CreateFrame("Button", "GameMenuFrameNDui", GameMenuFrame, "GameMenuButtonTemplate")
gui:SetText("2 UI")
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