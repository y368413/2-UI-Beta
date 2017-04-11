local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Settings")

-- 小地图
R.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", 0, 0},	-- 小地图位置
}

-- BUFF/DEBUFF相关
R.Auras = {
	IconSize		= 32,											-- BUFF图标大小
	IconsPerRow		= 16,											-- BUFF每行个数
	Spacing			= 6,											-- BUFF图标间距
	BHPos			= {"CENTER", UIParent, "CENTER", 0, -260},		-- 血DK助手默认位置
	StaggerPos		= {"CENTER", UIParent, "CENTER", 0, -290},		-- 坦僧工具默认位置
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -260},		-- 图腾助手默认位置
	MarksmanPos		= {"CENTER", UIParent, "CENTER", 0, -310},		-- 射击猎助手默认位置
	StatuePos		= {"BOTTOMLEFT", UIParent, 520, 260},			-- 武僧雕像默认位置
}

-- 控制技能列表
R.WhiteList = {
	-- 死亡骑士
	[108194]	= true,		-- 窒息
	[221562]	= true,		-- 窒息
	[207171]	= true,		-- 凛冬将至
	-- 德鲁伊
	[33786] 	= true,		-- 旋风
	[339]		= true,		-- 纠缠根须
	[102359]	= true,		-- 群体缠绕
	[5211]		= true,		-- 蛮力猛击
	[127797]	= true,		-- 乌索尔旋风
	[81261]		= true,		-- 日光术
	-- 猎人
	[3355]		= true,		-- 冰冻陷阱
	[19386] 	= true,		-- 翼龙钉刺
	[213691] 	= true,		-- 驱散射击
	[224729] 	= true,		-- 爆裂射击
	[202797] 	= true,		-- 蝰蛇钉刺
	[202900] 	= true,		-- 毒蝎钉刺
	[117526]	= true,		-- 束缚射击
	-- 法师
	[118] 		= true,		-- 变形术
	-- 圣骑士
	[20066] 	= true,		-- 忏悔
	[853] 		= true,		-- 制裁之锤
	-- 牧师
	[8122] 		= true,		-- 心灵尖啸
	[9484] 		= true,		-- 束缚亡灵
	[15487] 	= true,		-- 沉默
	[605] 		= true,		-- 心控
	[205369] 	= true,		-- 心灵炸弹
	-- 盗贼
	[2094] 		= true,		-- 致盲
	[6770] 		= true,		-- 闷棍
	-- 萨满
	[51514] 	= true,		-- 妖术
	[118905] 	= true,		-- 静电充能
	-- 术士
	[710] 		= true,		-- 放逐术
	[118699] 	= true,		-- 恐惧
	[5484] 		= true,		-- 恐惧嚎叫
	[6358]		= true,		-- 诱惑
	[30283] 	= true,		-- 暗影之怒
	-- 战士
	[132168] 	= true,		-- 震荡波
	[132169] 	= true,		-- 风暴之锤
	-- 武僧
	[115078] 	= true,		-- 分筋错骨
	[119381] 	= true,		-- 扫堂腿
	-- 恶魔猎手
	[217832] 	= true,		-- 禁锢
	[179057] 	= true,		-- 混乱新星
	-- 种族技能
	[25046] 	= true,		-- 奥术洪流
	[20549] 	= true,		-- 战争践踏
	[107079] 	= true,		-- 震山掌
	-- 其他
	[226510]	= true,		-- 血池
	[207327]	= true,		-- M3净化毁灭
}
-- 法术黑名单
R.BlackList = {
	[15407]		= true,		-- 精神鞭笞
}
-- 显示能量值的单位
R.ShowPowerUnit = {
	["Scrubber"] = true,
	["清扫器"] = true,
	["清掃者"] = true,
}
--------------------------------------------------------------------------------------
-- Tuitorial
local function ForceDefaultSettings()
	SetCVar("scriptErrors", 1)     --0是屏蔽错误1是不屏蔽错误
	SetCVar("autoLootDefault", 1)
	SetCVar("alwaysCompareItems", 0)
	SetCVar("lootUnderMouse", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("synchronizeSettings", 1)
  SetCVar("synchronizeMacros", 1)
	SetCVar("SpellTooltip_DisplayAvgValues", 1)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("nameplateShowAll", 1)
	SetCVar("nameplateMotion", 1)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("nameplateShowFriendlyNPCs", 0)
	SetCVar("screenshotQuality", 10)
	SetCVar("showTutorials", 0)
	SetCVar("alwaysShowActionBars", 1)
	SetCVar("lockActionBars", 1)
	SetActionBarToggles(1, 1, 1, 1)
	SetCVar("enableFloatingCombatText", 1)
	SetCVar("floatingCombatTextCombatDamage", 0)
	SetCVar("floatingCombatTextCombatHealing", 0)
	SetCVar("floatingCombatTextCombatDamageDirectionalScale", 1)
	SetCVar("floatingCombatTextFloatMode", 3)
	 --寵物對目標傷害 
   SetCVar("floatingCombatTextPetMeleeDamage", 0) 
   SetCVar("floatingCombatTextPetSpellDamage", 0) 
   --目標盾提示 
   SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0) 
   --自身得盾/護甲提示 
   SetCVar("floatingCombatTextCombatHealingAbsorbSelf", 0) 
   --閃招 
   SetCVar("floatingCombatTextDodgeParryMiss", 0) 
   --傷害減免   
   SetCVar("floatingCombatTextDamageReduction", 0) 
   --周期性傷害 
   SetCVar("floatingCombatTextCombatLogPeriodicSpells", 0) 
   --法術警示 
   SetCVar("floatingCombatTextReactives", 0) 
   --他人的糾纏效果(例如 誘補(xxxx-xxxx)) 
   SetCVar("floatingCombatTextSpellMechanics", 0) 
   --聲望變化 
   SetCVar("floatingCombatTextRepChanges", 1) 
   --友方治療者名稱 
   SetCVar("floatingCombatTextFriendlyHealers", 1) 
   --進入/離開戰鬥文字提示 
   SetCVar("floatingCombatTextCombatState", 1) 
   --低MP/低HP文字提示 
   SetCVar("floatingCombatTextLowManaHealth", 1)   
   --連擊點 
   SetCVar("floatingCombatTextComboPoints", 0) 
   --能量獲得 
   SetCVar("floatingCombatTextEnergyGains", 0) 
   --周期性能量   
   SetCVar("floatingCombatTextPeriodicEnergyGains", 0) 
   --榮譽擊殺 
   SetCVar("floatingCombatTextHonorGains", 0) 
   --光環 
   SetCVar("floatingCombatTextAuras", 0)
	SetCVar("doNotFlashLowHealthWarning", 1)
	SetCVar("ffxGlow", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("overrideArchive", 0)
end
local function ForceRaidFrame()
	if not CompactUnitFrameProfiles.selectedProfile then return end
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "useClassColors", true)
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "displayPowerBar", true)
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "displayBorder", false)
	CompactUnitFrameProfiles_ApplyCurrentSettings()
	CompactUnitFrameProfiles_UpdateCurrentPanel()
end

local function ForceUIScale()
	Advanced_UseUIScale:Hide()
	Advanced_UIScaleSlider:Hide()
	SetCVar("useUiScale", 1)
	local scale = MaoRUISettingDB["Settings"]["SetScale"]
	if MaoRUISettingDB["Settings"]["LockUIScale"] then
		if GetCurrentResolution() ~= 0 then
			scale = .8*768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")
		end
		if scale < .5 then scale = .5 end
		MaoRUISettingDB["Settings"]["SetScale"] = scale
	end
	if scale < .65 then UIParent:SetScale(scale) else SetCVar("uiScale", scale) end
	-- Prevent Auto-scaling
	MaoRUI:EventFrame("UI_SCALE_CHANGED"):SetScript("OnEvent", function()
		if scale < .65 then
			UIParent:SetScale(scale)
		end
	end)
end

local function ForceChatSettings()
	FCF_SetLocked(ChatFrame1, nil)
	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -2, 21)
	ChatFrame1:SetWidth(360)
	ChatFrame1:SetHeight(121)
  ChatFrame1:SetUserPlaced(true)
	for i = 1, 10 do
		local cf = _G["ChatFrame"..i]
		FCF_SetWindowAlpha(cf, 0)
		ChatFrame_RemoveMessageGroup(cf,"CHANNEL")
	end
	local channels = {"SAY","EMOTE","YELL","GUILD","OFFICER","GUILD_ACHIEVEMENT","ACHIEVEMENT",
	"WHISPER","PARTY","PARTY_LEADER","RAID","RAID_LEADER","RAID_WARNING","INSTANCE_CHAT",
	"INSTANCE_CHAT_LEADER","CHANNEL1","CHANNEL2","CHANNEL3","CHANNEL4","CHANNEL5","CHANNEL6","CHANNEL7",
	}	
	for i, v in ipairs(channels) do
		ToggleChatColorNamesByClassGroup(true, v)
	end
	FCF_SavePositionAndDimensions(ChatFrame1)
	FCF_SetLocked(ChatFrame1, true)
	MaoRUISettingDB["Chat"]["Lock"] = true
end

StaticPopupDialogs["RELOAD_NDUI"] = {
	text = "需要重载插件让设置生效",
	button1 = APPLY,
	button2 = CLASS_TRIAL_THANKS_DIALOG_CLOSE_BUTTON,
	OnAccept = function()
		ReloadUI()
	end,
}

function sendCmd(cmd) ChatFrame1EditBox:SetText(""); ChatFrame1EditBox:Insert(cmd); ChatEdit_SendText(ChatFrame1EditBox); end

function module:OnLogin()
	ForceUIScale()
	if MaoRUISettingDB["Chat"]["Lock"] then ForceChatSettings() end
	if tonumber(GetCVar("cameraDistanceMaxZoomFactor")) ~= 2.6 then SetCVar("cameraDistanceMaxZoomFactor", 2.6) end
	sendCmd("/console missingTransmogSourceInItemTooltips 1")
end

print(Welcome_loginChatText1) print(Welcome_loginChatText2) print(Welcome_loginChatText3) print(Welcome_loginChatText4)