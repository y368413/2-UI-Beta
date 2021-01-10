-- Core v1.4
local ADDON, Addon = ...

local Listener = CreateFrame('Frame', ADDON .. 'Listener')
local EventListeners = {}
local function Addon_OnEvent(frame, event, ...)
	if EventListeners[event] then
		for callback, func in pairs(EventListeners[event]) do
			if func == 0 then
				callback[event](callback, ...)
			else
				callback[func](callback, event, ...)
			end
		end
	end
end
Listener:SetScript('OnEvent', Addon_OnEvent)
function Addon:RegisterEvent(event, callback, func)
	if func == nil then func = 0 end
	if EventListeners[event] == nil then
		Listener:RegisterEvent(event)
		EventListeners[event] = { [callback]=func }
	else
		EventListeners[event][callback] = func
	end
end

function Addon:UnregisterEvent(event, callback)
	local listeners = EventListeners[event]
	if listeners then
		local count = 0
		for index,_ in pairs(listeners) do
			if index == callback then
				listeners[index] = nil
			else
				count = count + 1
			end
		end
		if count == 0 then
			EventListeners[event] = nil
			Listener:UnregisterEvent(event)
		end
	end
end

local AddOnListeners = {}
function Addon:ADDON_LOADED(name)
	if AddOnListeners[name] then
		for callback, func in pairs(AddOnListeners[name]) do
			if func == 0 then
				callback[name](callback)
			else
				callback[func](callback, name)
			end
		end
	end
end

function Addon:RegisterAddOnLoaded(name, callback, func)
	if func == nil then func = 0 end
	if IsAddOnLoaded(name) then
		if func == 0 then
			callback[name](callback)
		else
			callback[func](callback, name)
		end
	else
		self:RegisterEvent('ADDON_LOADED', self)
		if AddOnListeners[name] == nil then
			AddOnListeners[name] = { [callback]=func }
		else
			AddOnListeners[name][callback] = func
		end
	end
end

function Addon:UnregisterAddOnLoaded(name, callback)
	local listeners = AddOnListeners[name]
	if listeners then
		local count = 0
		for index,_ in pairs(listeners) do
			if index == callback then
				listeners[index] = nil
			else
				count = count + 1
			end
		end
		if count == 0 then
			AddOnListeners[name] = nil
		end
	end
end

function Addon:UnregisterEvent(event, callback)
	local listeners = EventListeners[event]
	if listeners then
		local count = 0
		for index,_ in pairs(listeners) do
			if index == callback then
				listeners[index] = nil
			else
				count = count + 1
			end
		end
		if count == 0 then
			EventListeners[event] = nil
			Listener:UnregisterEvent(event)
		end
	end
end

local CommStarted = false
local CommListeners = {}
function Addon:RegisterAddOnComm(prefix, callback, func)
	if func == nil then func = 0 end

	if not CommStarted then
		C_ChatInfo.RegisterAddonMessagePrefix(Addon.ShortName)
		self:RegisterEvent('CHAT_MSG_ADDON', self)
		CommStarted = true
	end
	if CommListeners[prefix] == nil then
		CommListeners[prefix] = { [callback]=func }
	else
		CommListeners[prefix][callback] = func
	end
end

function Addon:UnregisterAddOnComm(prefix, callback)
	local listeners = CommListeners[prefix]
	if listeners then
		local count = 0
		for index,_ in pairs(listeners) do
			if index == callback then
				listeners[index] = nil
			else
				count = count + 1
			end
		end
		if count == 0 then
			CommListeners[prefix] = nil
		end
	end
end

function Addon:SendAddOnComm(prefix, message, type, target)
	if (type == "PARTY" and not IsInGroup(LE_PARTY_CATEGORY_HOME))
			or (type == "INSTANCE" and not IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
		return false
	end
	local data = prefix.."|"..message
	C_ChatInfo.SendAddonMessage(Addon.ShortName, data, type, target)
	return true
end

function Addon:CHAT_MSG_ADDON(prefix, message, type, sender)
	if prefix == Addon.ShortName then
		for prefix,listeners in pairs(CommListeners) do
			local matcher = prefix.."|"
			if string.sub(message, 1, #matcher) == matcher then
				local data = string.sub(message, #matcher + 1)
				for callback,func in pairs(listeners) do
					if func == 0 then
						callback.ReceiveAddOnComm(callback, data, type, sender)
					else
						callback[func](callback, data, type, sender)
					end
				end
			end
		end
	end
end

local ModulePrototype = {}
function ModulePrototype:RegisterEvent(event, func)
	Addon:RegisterEvent(event, self, func)
end
function ModulePrototype:UnregisterEvent(event)
	Addon:UnregisterEvent(event, self)
end
function ModulePrototype:RegisterAddOnComm(func)
	Addon:RegisterAddOnComm(self.Name, self, func)
end
function ModulePrototype:UnregisterAddOnComm()
	Addon:UnregisterAddOnComm(self.Name, self)
end
function ModulePrototype:SendAddOnComm(message, type, target)
	Addon:SendAddOnComm(self.Name, message, type, target)
end
function ModulePrototype:RegisterAddOnLoaded(name, func)
	Addon:RegisterAddOnLoaded(name, self, func)
end
function ModulePrototype:UnregisterAddOnLoaded(name)
	Addon:UnregisterAddOnLoaded(name, self)
end
Addon.ModulePrototype = ModulePrototype

Addon.Modules = {}
function Addon:NewModule(name)
	local object = {}
	self.Modules[name] = object
	table.insert(self.Modules, object)
	setmetatable(object, {__index=ModulePrototype})
	object.Name = name
	return object
end
setmetatable(Addon, {__index = Addon.Modules})

function Addon:ForAllModules(event, ...)
	for _, module in ipairs(Addon.Modules) do
		if type(module) == 'table' and module[event] then
			module[event](module, ...)
		end
	end
end

Addon:RegisterEvent('PLAYER_ENTERING_WORLD', Addon)
function Addon:PLAYER_ENTERING_WORLD()
	self:ForAllModules('BeforeStartup')
	self:ForAllModules('Startup')
	self:ForAllModules('AfterStartup')

	self:UnregisterEvent('PLAYER_ENTERING_WORLD', self)
end

Addon.Name = GetAddOnMetadata(ADDON, "Title")
Addon.ShortName = GetAddOnMetadata(ADDON, "X-Short-Name") or string.sub(ADDON, 1, 16)
Addon.Version = GetAddOnMetadata(ADDON, "X-Packaged-Version")
_G[ADDON] = Addon



local ADDON, Addon = ...
local Locale = Addon:NewModule('Locale')

local default_locale = "enUS"
local current_locale = GetLocale()

local langs = {}
langs.enUS = {
	config_characterConfig = "Per-character configuration",
	config_progressTooltip = "Show progress each enemy gives on their tooltip",
	config_progressFormat = "Enemy Forces Format",
	config_progressFormat_1 = "24.19%",
	config_progressFormat_2 = "90/372",
	config_progressFormat_3 = "24.19% - 90/372",
	config_progressFormat_4 = "24.19% (75.81%)",
	config_progressFormat_5 = "90/372 (282)",
	config_progressFormat_6 = "24.19% (75.81%) - 90/372 (282)",
	config_splitsFormat = "Objective Splits Display",
	config_splitsFormat_1 = "Disabled",
	config_splitsFormat_2 = "Time from start",
	config_splitsFormat_3 = "Relative to previous",
	config_autoGossip = "Automatically select gossip entries during Mythic Keystone dungeons (ex: Odyn)",
	config_silverGoldTimer = "Show timer for both 2 and 3 bonus chests at same time",
	config_completionMessage = "Show message with final times on completion of a Mythic Keystone dungeon",
	config_showSplits = "Show split time for each objective in objective tracker",
	keystoneFormat = "[Keystone: %s - Level %d]",
	completion0 = "Timer expired for %s with %s, you were %s over the time limit.",
	completion1 = "Beat the timer for %s in %s. You were %s ahead of the timer, and missed +2 by %s.",
	completion2 = "Beat the timer for +2 %s in %s. You were %s ahead of the +2 timer, and missed +3 by %s.",
	completion3 = "Beat the timer for +3 %s in %s. You were %s ahead of the +3 timer.",
	completionSplits = "Split timings were: %s.",
	timeLost = "Time Lost",
	config_smallAffixes = "Reduce the size of affix icons on timer frame",
	config_deathTracker = "Show death tracker on timer frame",
	scheduleTitle = "Schedule",
	scheduleWeek1 = "This week",
	scheduleWeek2 = "Next week",
	scheduleWeek3 = "In two weeks",
	scheduleWeek4 = "In three weeks",
	scheduleMissingKeystone = "Requires a level 7+ Mythic Keystone in your inventory to display.",
	scheduleUnknown = "The updated affix schedule is currently unknown.",
	config_hideTalkingHead = "Hide Talking Head dialog during a Mythic Keystone dungeon",
	config_resetPopup = "Show popup to reset instances upon leaving a completed Mythic Keystone dungeon",
	partyKeysTitle = "Party Keystones",
	newKeystoneAnnounce = "New Keystone: %s",
	currentKeystoneText = "Current: |cFFFFFFFF%s|r",
	config_announceKeystones = "Announce newly acquired Mythic Keystones to your party",
}
langs.enGB = langs.enUS

langs.esES = {
	config_characterConfig = "Configuración por personaje",
	config_progressTooltip = "Mostrar cantidad de progreso de cada enemigo en su tooltip",
	config_progressFormat = "Formato de \"Fuerzas enemigas\"",
	keystoneFormat = "[Piedra angular: %s - Nivel %d]",
}
langs.esMX = langs.esES

langs.ruRU = {
	config_characterConfig = "Настройки персонажа",
	config_progressTooltip = "Показывать прогресс за каждого врага в подсказках",
	config_progressFormat = "Формат отображения прогресса",
	keystoneFormat = "[Ключ: %s - Уровень %d]",
}

langs.deDE = {
	config_characterConfig = "Charakterspezifische Konfiguration",
	config_progressTooltip = "Fortschritt für \"Feindliche Streitkr?fte\" im Tooltip von Feinden zeigen",
	config_progressFormat = "Format für \"Feindliche Streitkr?fte\"",
	config_splitsFormat = "Zwischenzeitsanzeige der Ziele",
	config_splitsFormat_1 = "Deaktiviert",
	config_splitsFormat_2 = "Zeit ab Start",
	config_splitsFormat_3 = "Relativ zum vorherigen",
	config_autoGossip = "Gespr?chsoptionen w?hrend Mythisch+-Dungeons (z.B. Odyn) automatisch ausw?hlen",
	config_silverGoldTimer = "Zeit für +2- und +3-Bonustruhen gleichzeitig zeigen",
	config_completionMessage = "Nachricht mit finalen Zeiten am Ende des Dungeons anzeigen",
	config_showSplits = "Zwischenzeit für jedes Ziel in der Zielverfolgung anzeigen",
	keystoneFormat = "[Schlüsselstein: %s - Stufe %d]",
	completion0 = "Zeit abgelaufen für %s mit %s, ihr wart %s über dem Zeitlimit.",
	completion1 = "Zeit für %s in %s geschlagen. Ihr wart %s vor dem Zeitlimit, und habt +2 um %s verfehlt.",
	completion2 = "Zeit für +2 %s in %s geschlagen. Ihr wart %s vor dem Zeitlimit für +2, und habt +3 um %s verfehlt.",
	completion3 = "Zeit für +3 %s in %s geschlagen. Ihr wart %s vor dem Zeitlimit für +3.",
	completionSplits = "Zwischenzeiten waren: %s.",
	timeLost = "Verlorene Zeit",
	config_smallAffixes = "Die Gr??e der Affix-Symbole im Zeitfenster verringern",
	config_deathTracker = "Todesz?hler im Zeitfenster zeigen",
	config_persistTracker = "Zielverfolgung nach Abschluss eines mythischen Schlüsselsteins wieder zeigen (Erfordert UI neu laden)",
	scheduleTitle = "Zeitplan",
	scheduleWeek1 = "Diese Woche",
	scheduleWeek2 = "N?chste Woche",
	scheduleWeek3 = "In zwei Wochen",
	scheduleWeek4 = "In drei Wochen",
	scheduleMissingKeystone = "Erfordert einen mythischen Schlüsselstein mit Stufe 7+ in deiner Tasche zur Anzeige.",
	config_exclusiveTracker = "Quest- und Erfolgsverfolgung w?hrend mythischen Schlüsselsteindungeons ausblenden (Erfordert UI neu laden)",
	config_hideTalkingHead = "Gespr?chseinblendungen w?hrend eines mythischen Schlüsselsteindungeons ausblenden",
}

langs.koKR = {
    config_characterConfig = "???? ??",
    config_progressTooltip = "??? ?? ?? ???? ??? ??",
    config_progressFormat = "? ?? ?? ??",
    config_splitsFormat = "?? ??? ?? ??",
    config_splitsFormat_1 = "???? ??",
    config_splitsFormat_2 = "????? ?? ??",
    config_splitsFormat_3 = "?? ???? ?? ??",
    config_autoGossip = "?? ??? ???? ???? ?? ?? (?: ??)",
    config_silverGoldTimer = "?? ?? 2? 3? ?? ??? ?? ??",
    config_completionMessage = "?? ??? ?? ??? ?? ?? ??? ??",
    config_showSplits = "?? ???? ? ??? ?? ?? ??",
    keystoneFormat = "[???: %s - %d ??]",
    completion0 = "%s|1?;?; %s?? ?????. ?? ??? %s ??????.",
    completion1 = "%s|1?;?; %s?? ??????. ?? ??? %s ???? %s|1?;?; ??? 2??? ?????.",
    completion2 = "%s 2??? %s?? ??????. 2?? ?? ??? %s ???? %s|1?;?; ??? 3??? ?????.",
    completion3 = "%s 3??? %s?? ??????. 3?? ?? ??? %s ?????.",
    completionSplits = "??? ??: %s.",
    timeLost = "?? ??",
    config_smallAffixes = "??? ???? ?? ??? ?? ??",
    config_deathTracker = "??? ???? ?? ?? ??",
    scheduleTitle = "??? ??",
    scheduleWeek1 = "???",
    scheduleWeek2 = "???",
    scheduleWeek3 = "2? ?",
    scheduleWeek4 = "3? ?",
    scheduleMissingKeystone = "??? ??? ??? ?? 7 ??? ?? ???? ??? ??? ???.",
    config_hideTalkingHead = "?? ??? ???? ?? ??? ??",
    config_resetPopup = "??? ?? ??? ??? ??? ???? ??? ??? ??",
    partyKeysTitle = "?? ???",
    newKeystoneAnnounce = "? ???: %s",
    currentKeystoneText = "?? ???: |cFFFFFFFF%s|r",
    config_announceKeystones = "?? ???? ?? ??? ??? ??",
}

langs.zhCN = {
	config_characterConfig = "为角色进行独立的配置",
	config_progressTooltip = "聊天窗口的史诗钥石显示副本名称和等级",
	config_progressFormat = "敌方部队进度格式",
	config_splitsFormat = "进度分割显示方式",
	config_splitsFormat_1 = "禁用",
	config_splitsFormat_2 = "从头计时",
	config_splitsFormat_3 = "与之前关联",
	config_autoGossip = "在史诗钥石副本中自动对话交互（如奥丁）",
	config_silverGoldTimer = "同时显示2箱和3箱的计时",
	config_completionMessage = "副本完成时在聊天窗口显示总耗时",
	config_showSplits = "在任务列表的进度上显示单独的进度计时",
	keystoneFormat = "[%s（%d级）]",
	forcesFormat = " - 敌方部队 %s",
	completion0 = "你超时完成了 %s 的战斗。共耗时 %s，超出规定时间 %s。",
	completion1 = "你在规定时间内完成了 %s 的战斗！共耗时 %s，剩余时间 %s，2箱奖励超时 %s。",
	completion2 = "你在规定时间内获得了 %s 的2箱奖励！共耗时 %s，2箱奖励剩余时间 %s，3箱奖励超时 %s。",
	completion3 = "你在规定时间内获得了 %s 的3箱奖励！共耗时 %s，3箱奖励剩余时间 %s。",
	timeLost = "损失时间",
	config_smallAffixes = "缩小进度条上的光环图标大小",
	config_deathTracker = "在进度条上显示死亡统计",
	config_persistTracker = "副本完成后继续显示任务追踪（重载插件后生效）",
	scheduleTitle = "日程表",
	scheduleWeek1 = "本周",
	scheduleWeek2 = "下周",
	scheduleWeek3 = "两周后",
	scheduleWeek4 = "三周后",
	scheduleMissingKeystone = "你需要一把7级以上的钥石才可激活此项功能。",
	config_exclusiveTracker = "在副本中隐藏任务和成就追踪（重载插件后生效）",
	config_hideTalkingHead = "在史诗钥石副本中隐藏NPC情景对话窗口",
	config_resetPopup = "离开已完成的副本后提示是否重置",
	partyKeysTitle = "队伍钥石信息",
	newKeystoneAnnounce = "新钥石：%s",
	currentKeystoneText = "当前钥石：|cFFFFFFFF%s|r",
	config_announceKeystones = "在队伍里通报获得的新钥石",
}
langs.zhTW = {
	config_characterConfig = "為角色進行獨立的配置",
	config_progressTooltip = "聊天窗口的傳奇鑰石顯示副本名稱和等級",
	config_progressFormat = "敵方部隊進度格式",
	config_splitsFormat = "進度分割顯示方式",
	config_splitsFormat_1 = "禁用",
	config_splitsFormat_2 = "從頭計時",
	config_splitsFormat_3 = "與之前關聯",
	config_autoGossip = "在傳奇鑰石副本中自動進行對話互動（如歐丁）",
	config_silverGoldTimer = "同時顯示2箱及3箱的計時",
	config_completionMessage = "副本完成時在聊天窗口顯示總耗時",
	config_showSplits = "在任務列表的进度上顯示單獨的進度計時",
	keystoneFormat = "[%s（%d級）]",
	forcesFormat = " - 敵方部隊 %s",
	completion0 = "你超時完成了 %s 的戰鬥。共耗時 %s，超出規定時間 %s。",
	completion1 = "你在規定時間內完成了 %s 的戰鬥！共耗時 %s，剩餘時間 %s，2箱獎勵超時 %s。",
	completion2 = "你在規定時間內獲得了 %s 的2箱獎勵！共耗時 %s，2箱獎勵剩餘時間 %s，3箱獎勵超時 %s。",
	completion3 = "你在規定時間內獲得了 %s 的3箱獎勵！共耗時 %s，3箱獎勵剩餘時間 %s。",
	timeLost = "損失時間",
	config_smallAffixes = "縮小計時器上的光環圖標大小",
	config_deathTracker = "在計時器上顯示死亡統計",
	config_persistTracker = "副本完成後繼續顯示任務追蹤（重載插件後生效）",
	scheduleTitle = "日程表",
	scheduleWeek1 = "本周",
	scheduleWeek2 = "下周",
	scheduleWeek3 = "兩周後",
	scheduleWeek4 = "三周後",
	scheduleMissingKeystone = "你需要一把7級以上的鑰石來激活此項功能。",
	config_exclusiveTracker = "在副本中隱藏成就和任務追蹤（重裝插件後生效）",
	config_hideTalkingHead = "在傳奇鑰石副本中隱藏NPC情景對話窗口",
	config_resetPopup = "離開已完成的副本後提示是否重置",
	partyKeysTitle = "隊伍鑰石信息",
	newKeystoneAnnounce = "新鑰石：%s",
	currentKeystoneText = "當前鑰石：|cFFFFFFFF%s|r",
	config_announceKeystones = "在隊伍里通報獲得的新鑰石",
}

function Locale:Get(key)
	if langs[current_locale] and langs[current_locale][key] ~= nil then
		return langs[current_locale][key]
	else
		return langs[default_locale][key]
	end
end

function Locale:Local(key)
	return langs[current_locale] and langs[current_locale][key]
end

function Locale:Exists(key)
	return langs[default_locale][key] ~= nil
end

setmetatable(Locale, {__index = Locale.Get})


local ADDON, Addon = ...
local Config = Addon:NewModule('Config')

local configVersion = 1
local configDefaults = {
	progressTooltip = true,
	progressFormat = 1,
	autoGossip = true,
	silverGoldTimer = false,
	splitsFormat = 1,
	completionMessage = true,
	smallAffixes = true,
	deathTracker = true,
	recordSplits = false,
	showLevelModifier = false,
	hideTalkingHead = true,
	resetPopup = false,
	announceKeystones = false,
}
local callbacks = {}

local My_UIDropDownMenu_SetSelectedValue, My_UIDropDownMenu_GetSelectedValue, My_UIDropDownMenu_CreateInfo, My_UIDropDownMenu_AddButton, My_UIDropDownMenu_Initialize, My_UIDropDownMenuTemplate
function Config:InitializeDropdown()
	My_UIDropDownMenu_SetSelectedValue = Lib_UIDropDownMenu_SetSelectedValue or UIDropDownMenu_SetSelectedValue
	My_UIDropDownMenu_GetSelectedValue = Lib_UIDropDownMenu_GetSelectedValue or UIDropDownMenu_GetSelectedValue
	My_UIDropDownMenu_CreateInfo = Lib_UIDropDownMenu_CreateInfo or UIDropDownMenu_CreateInfo
	My_UIDropDownMenu_AddButton = Lib_UIDropDownMenu_AddButton or UIDropDownMenu_AddButton
	My_UIDropDownMenu_Initialize = Lib_UIDropDownMenu_Initialize or UIDropDownMenu_Initialize
	My_UIDropDownMenuTemplate = Lib_UIDropDownMenu_Initialize and "Lib_UIDropDownMenuTemplate" or "UIDropDownMenuTemplate"
end

local progressFormatValues = { 1, 2, 3, 4, 5, 6 }
local splitsFormatValues = { 0, 1, 2 }

setmetatable(Config, {
	__index = function(self, key)
		if configDefaults[key] ~= nil then
			return self:Get(key)
		else
			return Addon.ModulePrototype[key]
		end
	end,
	-- __newindex = function(self, key, value)
	-- 	if configDefaults[key] ~= nil then
	-- 		self:Set(key, value)
	-- 	else
	-- 		self[key] = value
	-- 	end
	-- end,
})

function Config:Get(key)
	if self:CharacterConfig() then
		if AngryKeystones_CharacterConfig == nil or AngryKeystones_CharacterConfig[key] == nil then
			return configDefaults[key]
		else
			return AngryKeystones_CharacterConfig[key]
		end
	else
		if AngryKeystones_Config == nil or AngryKeystones_Config[key] == nil then
			return configDefaults[key]
		else
			return AngryKeystones_Config[key]
		end
	end
end

function Config:Set(key, newValue, silent)
	if self:CharacterConfig() then
		if configDefaults[key] == newValue then
			AngryKeystones_CharacterConfig[key] = nil
		else
			AngryKeystones_CharacterConfig[key] = newValue
		end
	else
		if configDefaults[key] == newValue then
			AngryKeystones_Config[key] = nil
		else
			AngryKeystones_Config[key] = newValue
		end
	end
	if callbacks[key] and not silent then
		for _, func in ipairs(callbacks[key]) do
			func(key, newValue)
		end
	end
end

function Config:RegisterCallback(key, func)
	if type(key) == "table" then
		for _, key2 in ipairs(key) do
			if callbacks[key2] then
				table.insert(callbacks, func)
			else
				callbacks[key2] = { func }
			end
		end
	else
		if callbacks[key] then
			table.insert(callbacks, func)
		else
			callbacks[key] = { func }
		end
	end
end

function Config:UnregisterCallback(key, func)
	if callbacks[key] then
		local table = callbacks[key]
		for i=1, #table do
			if table[i] == func then
				table.remove(table, 1)
				i = i - 1
			end
		end
		if #table == 0 then callbacks[key] = nil end
	end
end

function Config:CharacterConfig()
	return AngryKeystones_CharacterConfig and AngryKeystones_CharacterConfig['__enabled']
end

function Config:SetCharacterConfig(enabled)
	AngryKeystones_CharacterConfig['__enabled'] = enabled
	if not AngryKeystones_CharacterConfig['__init'] then
		AngryKeystones_CharacterConfig['__init'] = true
		for key,value in pairs(AngryKeystones_Config) do
			AngryKeystones_CharacterConfig[key] = value
		end
	end
end

local panelOriginalConfig = {}
local optionPanel

local Panel_OnRefresh

local function Panel_OnSave(self)
	wipe(panelOriginalConfig)
end

local function Panel_OnCancel(self)
	-- for key, value in pairs(panelOriginalConfig) do
	-- 	if key == "disabledFilters" then AngryKeystones_Config["selectedFilters"] = nil end
	-- 	Config:Set(key, value)
	-- end
	wipe(panelOriginalConfig)
end

local function Panel_OnDefaults(self)
	AngryKeystones_Config = { __version = configVersion }
	for key,callbacks_key in pairs(callbacks) do
		for _, func in ipairs(callbacks_key) do
			func(key, configDefaults[key])
		end
	end
	wipe(panelOriginalConfig)
end

local function CheckBox_Update(self)
	self:SetChecked( Config:Get(self.configKey) )
end

local function CheckBox_OnClick(self)
	local key = self.configKey
	if panelOriginalConfig[key] == nil then
		panelOriginalConfig[key] = Config[key]
	end
	Config:Set(key, self:GetChecked())
end

local function CharConfigCheckBox_OnClick(self)
	local status = Config:CharacterConfig()
	Config:SetCharacterConfig( not status )

	for key,callbacks_key in pairs(callbacks) do
		for _, func in ipairs(callbacks_key) do
			func(key, Config:Get(key))
		end
	end
	Panel_OnRefresh(optionPanel)
end

local function DropDown_OnClick(self, dropdown)
	local key = dropdown.configKey
	if panelOriginalConfig[key] == nil then
		panelOriginalConfig[key] = Config[key]
	end
	Config:Set(key, self.value)
	My_UIDropDownMenu_SetSelectedValue( dropdown, self.value )
end

local function DropDown_Initialize(self)
	local key = self.configKey
	local selectedValue = My_UIDropDownMenu_GetSelectedValue(self)
	local info = My_UIDropDownMenu_CreateInfo()
	info.func = DropDown_OnClick
	info.arg1 = self

	if key == 'progressFormat' then
		for i, value in ipairs(progressFormatValues) do
			info.text = Addon.Locale['config_progressFormat_'..i]
			info.value = value
			if ( selectedValue == info.value ) then
				info.checked = 1
			else
				info.checked = nil
			end
			My_UIDropDownMenu_AddButton(info)
		end
	elseif key == 'splitsFormat' then
		for i, value in ipairs(splitsFormatValues) do
			info.text = Addon.Locale['config_splitsFormat_'..i]
			info.value = value
			if ( selectedValue == info.value ) then
				info.checked = 1
			else
				info.checked = nil
			end
			My_UIDropDownMenu_AddButton(info)
		end
	end
end

local DropDown_Index = 0
local function DropDown_Create(self)
	DropDown_Index = DropDown_Index + 1
	local dropdown = CreateFrame("Frame", ADDON.."ConfigDropDown"..DropDown_Index, self, My_UIDropDownMenuTemplate)
	_G[ADDON.."ConfigDropDown"..DropDown_Index.."Middle"]:SetWidth(200)
	
	local label = dropdown:CreateFontString(ADDON.."ConfigDropLabel"..DropDown_Index, "BACKGROUND", "GameFontNormal")
	label:SetPoint("BOTTOMLEFT", dropdown, "TOPLEFT", 16, 3)
	dropdown.Label = label
	
	return dropdown
end

local panelInit, checkboxes, dropdowns, charConfigCheckbox
Panel_OnRefresh = function(self)
	if not panelInit then
		local footer = self:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
		footer:SetPoint('BOTTOMRIGHT', -16, 16)
		footer:SetText( Addon.Version or "Dev" )

		charConfigCheckbox = CreateFrame("CheckButton", nil, self, "InterfaceOptionsCheckButtonTemplate")
		charConfigCheckbox:SetScript("OnClick", CharConfigCheckBox_OnClick)
		charConfigCheckbox.Text:SetFontObject("GameFontHighlightSmall")
		charConfigCheckbox.Text:SetPoint("LEFT", charConfigCheckbox, "RIGHT", 0, 1)
		charConfigCheckbox.Text:SetText( Addon.Locale.config_characterConfig )
		charConfigCheckbox:SetPoint("BOTTOMLEFT", 14, 12)

		local label = self:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		label:SetPoint("TOPLEFT", 16, -16)
		label:SetJustifyH("LEFT")
		label:SetJustifyV("TOP")
		label:SetText( Addon.Name )

		checkboxes = {}
		dropdowns = {}

		local checkboxes_order = { "silverGoldTimer", "autoGossip", "progressTooltip", "completionMessage", "hideTalkingHead", "resetPopup", "announceKeystones" }

		for i,key in ipairs(checkboxes_order) do
			checkboxes[i] = CreateFrame("CheckButton", nil, self, "InterfaceOptionsCheckButtonTemplate")
			checkboxes[i]:SetScript("OnClick", CheckBox_OnClick)
			checkboxes[i].configKey = key
			checkboxes[i].Text:SetText( Addon.Locale['config_'..key] )
			if i == 1 then
				checkboxes[i]:SetPoint("TOPLEFT", label, "BOTTOMLEFT", -2, -8)
			else
				checkboxes[i]:SetPoint("TOPLEFT", checkboxes[i-1], "BOTTOMLEFT", 0, -8)
			end
		end

		local dropdowns_order = { "progressFormat", "splitsFormat" }

		for i,key in ipairs(dropdowns_order) do
			dropdowns[i] = DropDown_Create(self)
			dropdowns[i].Label:SetText( Addon.Locale['config_'..key] )
			dropdowns[i].configKey = key		
			if i == 1 then
				dropdowns[i]:SetPoint("TOPLEFT", checkboxes[#checkboxes], "BOTTOMLEFT", -13, -24)
			else
				dropdowns[i]:SetPoint("TOPLEFT", dropdowns[i-1], "BOTTOMLEFT", 0, -24)
			end
		end

		panelInit = true
	end
	
	charConfigCheckbox:SetChecked( Config:CharacterConfig() )
	
	for _, check in ipairs(checkboxes) do
		CheckBox_Update(check)
	end

	for _, dropdown in ipairs(dropdowns) do
		My_UIDropDownMenu_Initialize(dropdown, DropDown_Initialize)
		My_UIDropDownMenu_SetSelectedValue(dropdown, Config:Get(dropdown.configKey))
	end

end

function Config:CreatePanel()
	self:InitializeDropdown()
	local panel = CreateFrame("FRAME")
	panel.name = Addon.Name
	panel.okay = Panel_OnSave
	panel.cancel = Panel_OnCancel
	panel.default  = Panel_OnDefaults
	panel.refresh  = Panel_OnRefresh
	InterfaceOptions_AddCategory(panel)

	return panel
end

function Config:BeforeStartup()
	if AngryKeystones_Config == nil then AngryKeystones_Config = {} end
	if AngryKeystones_CharacterConfig == nil then AngryKeystones_CharacterConfig = {} end

	if not AngryKeystones_Config['__version'] then
		AngryKeystones_Config['__version'] = configVersion
	end
	if not AngryKeystones_CharacterConfig['__version'] then
		AngryKeystones_CharacterConfig['__version'] = configVersion
	end

	AngryKeystones_Config['__version'] = configVersion
	AngryKeystones_CharacterConfig['__version'] = configVersion

	optionPanel = self:CreatePanel(ADDON)
end

SLASH_AngryKeystones1 = "/akeys"
SLASH_AngryKeystones2 = "/angrykeystones"
function SlashCmdList.AngryKeystones(msg, editbox)
	if optionPanel then
		InterfaceOptionsFrame_OpenToCategory(optionPanel)
		InterfaceOptionsFrame_OpenToCategory(optionPanel)
	end
end


local ADDON, Addon = ...
local Mod = Addon:NewModule('ObjectiveTracker')

local challengeMapID

local TIME_FOR_3 = 0.6
local TIME_FOR_2 = 0.8

local function timeFormat(seconds)
	local hours = floor(seconds / 3600)
	local minutes = floor((seconds / 60) - (hours * 60))
	seconds = seconds - hours * 3600 - minutes * 60

	if hours == 0 then
		return format("%d:%.2d", minutes, seconds)
	else
		return format("%d:%.2d:%.2d", hours, minutes, seconds)
	end
end
Mod.timeFormat = timeFormat

local function timeFormatMS(timeAmount)
	local seconds = floor(timeAmount / 1000)
	local ms = timeAmount - seconds * 1000
	local hours = floor(seconds / 3600)
	local minutes = floor((seconds / 60) - (hours * 60))
	seconds = seconds - hours * 3600 - minutes * 60

	if hours == 0 then
		return format("%d:%.2d.%.3d", minutes, seconds, ms)
	else
		return format("%d:%.2d:%.2d.%.3d", hours, minutes, seconds, ms)
	end
end
Mod.timeFormatMS = timeFormatMS

local function GetTimerFrame(block)
	if not block.TimerFrame then
		local TimerFrame = CreateFrame("Frame", nil, block)
		TimerFrame:SetAllPoints(block)
		
		TimerFrame.Text = TimerFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		TimerFrame.Text:SetPoint("LEFT", block.TimeLeft, "RIGHT", 4, 0)
		
		TimerFrame.Text2 = TimerFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		TimerFrame.Text2:SetPoint("LEFT", TimerFrame.Text, "RIGHT", 4, 0)

		TimerFrame.Bar3 = TimerFrame:CreateTexture(nil, "OVERLAY")
		TimerFrame.Bar3:SetPoint("TOPLEFT", block.StatusBar, "TOPLEFT", block.StatusBar:GetWidth() * (1 - TIME_FOR_3) - 4, 0)
		TimerFrame.Bar3:SetSize(8, 10)
		TimerFrame.Bar3:SetTexture("Interface\\Addons\\AngryKeystones\\bar")
		TimerFrame.Bar3:SetTexCoord(0, 0.5, 0, 1)

		TimerFrame.Bar2 = TimerFrame:CreateTexture(nil, "OVERLAY")
		TimerFrame.Bar2:SetPoint("TOPLEFT", block.StatusBar, "TOPLEFT", block.StatusBar:GetWidth() * (1 - TIME_FOR_2) - 4, 0)
		TimerFrame.Bar2:SetSize(8, 10)
		TimerFrame.Bar2:SetTexture("Interface\\Addons\\AngryKeystones\\bar")
		TimerFrame.Bar2:SetTexCoord(0.5, 1, 0, 1)

		TimerFrame:Show()

		block.TimerFrame = TimerFrame
	end
	return block.TimerFrame
end

local function UpdateTime(block, elapsedTime)
	local TimerFrame = GetTimerFrame(block)

	local time3 = block.timeLimit * TIME_FOR_3
	local time2 = block.timeLimit * TIME_FOR_2

	TimerFrame.Bar3:SetShown(elapsedTime < time3)
	TimerFrame.Bar2:SetShown(elapsedTime < time2)

	if elapsedTime < time3 then
		TimerFrame.Text:SetText( timeFormat(time3 - elapsedTime) )
		TimerFrame.Text:SetTextColor(1, 0.843, 0)
		TimerFrame.Text:Show()
		if Addon.Config.silverGoldTimer then
			TimerFrame.Text2:SetText( timeFormat(time2 - elapsedTime) )
			TimerFrame.Text2:SetTextColor(0.78, 0.78, 0.812)
			TimerFrame.Text2:Show()
		else
			TimerFrame.Text2:Hide()
		end
	elseif elapsedTime < time2 then
		TimerFrame.Text:SetText( timeFormat(time2 - elapsedTime) )
		TimerFrame.Text:SetTextColor(0.78, 0.78, 0.812)
		TimerFrame.Text:Show()
		TimerFrame.Text2:Hide()
	else
		TimerFrame.Text:Hide()
		TimerFrame.Text2:Hide()
	end

	if elapsedTime > block.timeLimit then
		block.TimeLeft:SetText(SecondsToClock(elapsedTime - block.timeLimit, false))
	end
end

local function SetUpAffixes(block, affixes)
	local frameWidth, spacing, distance
	if Addon.Config.smallAffixes then
		frameWidth, spacing, distance = 24, 3, -17
	else
		frameWidth, spacing, distance = 22, 4, -18
	end
	local num = #affixes
	local leftPoint = 28 + (spacing * (num - 1)) + (frameWidth * num)
	block.Affixes[1]:SetPoint("TOPLEFT", block, "TOPRIGHT", -leftPoint, distance)

	for i,affix in pairs(block.Affixes) do
		affix:SetSize(frameWidth, frameWidth)
		affix.Portrait:SetSize(frameWidth - 2, frameWidth - 2)
	end
end

local function ShowBlock(timerID, elapsedTime, timeLimit)
	local block = ScenarioChallengeModeBlock
	local level, affixes, wasEnergized = C_ChallengeMode.GetActiveKeystoneInfo()
	local dmgPct, healthPct = C_ChallengeMode.GetPowerLevelDamageHealthMod(level)
	if Addon.Config.showLevelModifier then
		block.Level:SetText( format("%s, +%d%%", CHALLENGE_MODE_POWER_LEVEL:format(level), dmgPct) )
	else
		block.Level:SetText(CHALLENGE_MODE_POWER_LEVEL:format(level))
	end
end

hooksecurefunc("Scenario_ChallengeMode_UpdateTime", UpdateTime)
hooksecurefunc("Scenario_ChallengeMode_ShowBlock", ShowBlock)

local keystoneWasCompleted = false
function Mod:PLAYER_ENTERING_WORLD()
	if keystoneWasCompleted and Addon.Config.resetPopup and IsInGroup() and UnitIsGroupLeader("player") then
		StaticPopup_Show("CONFIRM_RESET_INSTANCES")
	end
	keystoneWasCompleted = false
end

function Mod:CHALLENGE_MODE_START()
	keystoneWasCompleted = false
	challengeMapID = C_ChallengeMode.GetActiveChallengeMapID()
end

function Mod:CHALLENGE_MODE_RESET()
	keystoneWasCompleted = false
end

function Mod:CHALLENGE_MODE_COMPLETED()
	keystoneWasCompleted = true
	if not Addon.Config.completionMessage then return end
	if not challengeMapID then return end

	local mapID, level, time, onTime, keystoneUpgradeLevels = C_ChallengeMode.GetCompletionInfo()
	local name, _, timeLimit = C_ChallengeMode.GetMapUIInfo(challengeMapID)

	timeLimit = timeLimit * 1000
	local timeLimit2 = timeLimit * TIME_FOR_2
	local timeLimit3 = timeLimit * TIME_FOR_3

	if time <= timeLimit3 then
		print( format("|cff33ff99<%s>|r |cffffd700%s|r", ADDON, format(Addon.Locale.completion3, name, timeFormatMS(time), timeFormatMS(timeLimit3 - time))) )
	elseif time <= timeLimit2 then
		print( format("|cff33ff99<%s>|r |cffc7c7cf%s|r", ADDON, format(Addon.Locale.completion2, name, timeFormatMS(time), timeFormatMS(timeLimit2 - time), timeFormatMS(time - timeLimit3))) )
	elseif onTime then
		print( format("|cff33ff99<%s>|r |cffeda55f%s|r", ADDON, format(Addon.Locale.completion1, name, timeFormatMS(time), timeFormatMS(timeLimit - time), timeFormatMS(time - timeLimit2))) )
	else
		print( format("|cff33ff99<%s>|r |cffff2020%s|r", ADDON, format(Addon.Locale.completion0, name, timeFormatMS(time), timeFormatMS(time - timeLimit))) )
	end

	-- local splitMsg = Addon.Splits:SplitOutput()
	-- if splitMsg then
	-- 	print(  format("%s%s|r", LIGHTYELLOW_FONT_COLOR_CODE, format(Addon.Locale.completionSplits, splitMsg)) )
	-- end
end

function Mod:Startup()
	self:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterEvent("CHALLENGE_MODE_START")
	self:RegisterEvent("CHALLENGE_MODE_RESET")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	Addon.Config:RegisterCallback('smallAffixes', function()
		local level, affixes, wasEnergized = C_ChallengeMode.GetActiveKeystoneInfo()
		if affixes then
			SetUpAffixes(ScenarioChallengeModeBlock, affixes)
		end
	end)

	challengeMapID = C_ChallengeMode.GetActiveChallengeMapID()
end


local ADDON, Addon = ...
local Mod = Addon:NewModule('ProgressTracker')
Mod.playerDeaths = {}

local lastQuantity
local lastDied
local lastDiedName
local lastDiedTime
local lastAmount
local lastAmountTime
local lastQuantity

local REAPING_AFFIX_ID = 117

local progressPresets = {}

local function ProcessLasts()
	if lastDied and lastDiedTime and lastAmount and lastAmountTime then
		if abs(lastAmountTime - lastDiedTime) < 0.1 then
			if not AngryKeystones_Data.progress[lastDied] then AngryKeystones_Data.progress[lastDied] = {} end
			if AngryKeystones_Data.progress[lastDied][lastAmount] then
				AngryKeystones_Data.progress[lastDied][lastAmount] = AngryKeystones_Data.progress[lastDied][lastAmount] + 1
			else
				AngryKeystones_Data.progress[lastDied][lastAmount] = 1
			end
			lastDied, lastDiedTime, lastAmount, lastAmountTime, lastDiedName = nil, nil, nil, nil, nil
		end
	end
end

function Mod:COMBAT_LOG_EVENT_UNFILTERED()
	local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10 = CombatLogGetCurrentEventInfo()
	if event == "UNIT_DIED" then
		if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_NPC) > 0
				and bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_NPC) > 0
				and (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 or bit.band(destFlags, COMBATLOG_OBJECT_REACTION_NEUTRAL) > 0) then
			local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-", destGUID)
			lastDied = tonumber(npc_id)
			lastDiedTime = GetTime()
			lastDiedName = destName
			ProcessLasts()
		end
		if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
			if UnitIsFeignDeath(destName) then
				-- Feign Death
			elseif Mod.playerDeaths[destName] then
				Mod.playerDeaths[destName] = Mod.playerDeaths[destName] + 1
			else
				Mod.playerDeaths[destName] = 1
			end
			--Addon.ObjectiveTracker:UpdatePlayerDeaths()
		end
	end
end

function Mod:SCENARIO_CRITERIA_UPDATE()
	local scenarioType = select(10, C_Scenario.GetInfo())
	if scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE then
		local numCriteria = select(3, C_Scenario.GetStepInfo())
		for criteriaIndex = 1, numCriteria do
			local criteriaString, criteriaType, _, quantity, totalQuantity, _, _, quantityString, _, _, _, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex)
			if isWeightedProgress then
				local currentQuantity = quantityString and tonumber( strsub(quantityString, 1, -2) )
				if lastQuantity and currentQuantity < totalQuantity and currentQuantity > lastQuantity then
					lastAmount = currentQuantity - lastQuantity
					lastAmountTime = GetTime()
					ProcessLasts()
				end
				lastQuantity = currentQuantity
			end
		end
	end
end

local function StartTime()
	Mod:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	local numCriteria = select(3, C_Scenario.GetStepInfo())
	for criteriaIndex = 1, numCriteria do
		local criteriaString, criteriaType, _, quantity, totalQuantity, _, _, quantityString, _, _, _, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex)
		if isWeightedProgress then
			local quantityString = select(8, C_Scenario.GetCriteriaInfo(criteriaIndex))
			lastQuantity = quantityString and tonumber( strsub(quantityString, 1, -2) )
		end
	end
end

local function StopTime()
	Mod:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

local function CheckTime(...)
	for i = 1, select("#", ...) do
		local timerID = select(i, ...)
		local _, elapsedTime, type = GetWorldElapsedTime(timerID)
		if type == LE_WORLD_ELAPSED_TIMER_TYPE_CHALLENGE_MODE then
			local mapID = C_ChallengeMode.GetActiveChallengeMapID()
			if mapID then
				StartTime()
				return
			end
		end
	end
	StopTime()
end

local function OnTooltipSetUnit(tooltip)
	local scenarioType = select(10, C_Scenario.GetInfo())
	if scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE and Addon.Config.progressTooltip then
		local name, unit = tooltip:GetUnit()
		local guid = unit and UnitGUID(unit)
		if guid then
			local type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-", guid)
			npc_id = tonumber(npc_id)
			local info = AngryKeystones_Data.progress[npc_id]
			local preset = progressPresets[npc_id]
			if info or preset then
				local numCriteria = select(3, C_Scenario.GetStepInfo())
				local total
				local progressName
				for criteriaIndex = 1, numCriteria do
					local criteriaString, _, _, quantity, totalQuantity, _, _, quantityString, _, _, _, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex)
					if isWeightedProgress then
						progressName = criteriaString
						total = totalQuantity
					end
				end

				local value, valueCount
				if info then
					for amount, count in pairs(info) do
						if not valueCount or count > valueCount or (count == valueCount and amount < value) then
							value = amount
							valueCount = count
						end
					end
				end
				if preset and (not value or valueCount == 1) then
					value = preset
				end
				if value and total then
					local forcesFormat = format(" - %s: %%s", progressName)
					local text
					if Addon.Config.progressFormat == 1 or Addon.Config.progressFormat == 4 then
						text = format( format(forcesFormat, "+%.2f%%"), value/total*100)
					elseif Addon.Config.progressFormat == 2 or Addon.Config.progressFormat == 5 then
						text = format( format(forcesFormat, "+%d"), value)
					elseif Addon.Config.progressFormat == 3 or Addon.Config.progressFormat == 6 then
						text = format( format(forcesFormat, "+%.2f%% - +%d"), value/total*100, value)
					end

					if text then
						local matcher = format(forcesFormat, "%d+%%")
						for i=2, tooltip:NumLines() do
							local tiptext = _G["GameTooltipTextLeft"..i]
							local linetext = tiptext and tiptext:GetText()

							if linetext and linetext:match(matcher) then
								tiptext:SetText(text)
								tooltip:Show()
							end
						end
					end
				end
			end
		end
	end
end

function Mod:GeneratePreset()
	local ret = {}
	for npcID, info in pairs(AngryKeystones_Data.progress) do
		local value, valueCount
		for amount, count in pairs(info) do
			if not valueCount or count > valueCount or (count == valueCount and amount < value) then
				value = amount
				valueCount = count
			end
		end
		ret[npcID] = value
	end
	AngryKeystones_Data.preset = ret
	return ret
end

function Mod:PLAYER_ENTERING_WORLD(...) CheckTime(GetWorldElapsedTimers()) end
function Mod:WORLD_STATE_TIMER_START(...) local timerID = ...; CheckTime(timerID) end
function Mod:WORLD_STATE_TIMER_STOP(...) local timerID = ...; StopTime(timerID) end
function Mod:CHALLENGE_MODE_START(...) CheckTime(GetWorldElapsedTimers()) end
function Mod:CHALLENGE_MODE_RESET(...) wipe(Mod.playerDeaths) end

local function ProgressBar_SetValue(self, percent)
	if self.criteriaIndex then
		local _, _, _, _, totalQuantity, _, _, quantityString, _, _, _, _, _ = C_Scenario.GetCriteriaInfo(self.criteriaIndex)
		local currentQuantity = quantityString and tonumber( strsub(quantityString, 1, -2) )
		if currentQuantity and totalQuantity then
			if Addon.Config.progressFormat == 1 then
				self.Bar.Label:SetFormattedText("%.2f%%", currentQuantity/totalQuantity*100)
			elseif Addon.Config.progressFormat == 2 then
				self.Bar.Label:SetFormattedText("%d/%d", currentQuantity, totalQuantity)
			elseif Addon.Config.progressFormat == 3 then
				self.Bar.Label:SetFormattedText("%.2f%% - %d/%d", currentQuantity/totalQuantity*100, currentQuantity, totalQuantity)
			elseif Addon.Config.progressFormat == 4 then
				self.Bar.Label:SetFormattedText("%.2f%% (%.2f%%)", currentQuantity/totalQuantity*100, (totalQuantity-currentQuantity)/totalQuantity*100)
			elseif Addon.Config.progressFormat == 5 then
				self.Bar.Label:SetFormattedText("%d/%d (%d)", currentQuantity, totalQuantity, totalQuantity - currentQuantity)
			elseif Addon.Config.progressFormat == 6 then
				self.Bar.Label:SetFormattedText("%.2f%% (%.2f%%) - %d/%d (%d)", currentQuantity/totalQuantity*100, (totalQuantity-currentQuantity)/totalQuantity*100, currentQuantity, totalQuantity, totalQuantity - currentQuantity)
			end
		end

		local isReapingActive = false
		local _, affixes, _ = C_ChallengeMode.GetActiveKeystoneInfo()
		if affixes then
			for i = 1, #affixes do
				if affixes[i] == REAPING_AFFIX_ID then
					isReapingActive = true
				end
			end
		end

		if isReapingActive and currentQuantity < totalQuantity then
			if not self.ReapingFrame then
				local reapingFrame = CreateFrame("Frame", nil, self)
				reapingFrame:SetSize(56, 16)
				reapingFrame:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 0, 0)
		
				reapingFrame.Icon = CreateFrame("Frame", nil, reapingFrame, "ScenarioChallengeModeAffixTemplate")
				reapingFrame.Icon:SetPoint("LEFT", reapingFrame, "LEFT", 0, 0)
				reapingFrame.Icon:SetSize(14, 14)
				reapingFrame.Icon.Portrait:SetSize(12, 12)
				reapingFrame.Icon:SetUp(REAPING_AFFIX_ID)

				reapingFrame.Text = reapingFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
				reapingFrame.Text:SetPoint("LEFT", reapingFrame.Icon, "RIGHT", 4, 0)

				self.ReapingFrame = reapingFrame

				self:HookScript("OnShow", function(self) self.ReapingFrame:Show(); self.ReapingFrame.Icon:Show() end )
				self:HookScript("OnHide", function(self) self.ReapingFrame:Hide(); self.ReapingFrame.Icon:Hide() end )
			end
			local threshold = totalQuantity / 5
			local current = currentQuantity
			local value = threshold - current % threshold
			local total = totalQuantity
			if Addon.Config.progressFormat == 1 or Addon.Config.progressFormat == 4 then
				self.ReapingFrame.Text:SetFormattedText("%.2f%%", value/total*100)
			elseif Addon.Config.progressFormat == 2 or Addon.Config.progressFormat == 5 then
				self.ReapingFrame.Text:SetFormattedText("%d", ceil(value))
			elseif Addon.Config.progressFormat == 3 or Addon.Config.progressFormat == 6 then
				self.ReapingFrame.Text:SetFormattedText("%.2f%% - %d", value/total*100, ceil(value))
			else
				self.ReapingFrame.Text:SetFormattedText("%d%%", value/total*100)
			end
			self.ReapingFrame:Show()
			self.ReapingFrame.Icon:Show()
		elseif self.ReapingFrame then
			self.ReapingFrame:Hide()
			self.ReapingFrame.Icon:Hide()
		end
	end
end

local function DeathCount_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetText(CHALLENGE_MODE_DEATH_COUNT_TITLE:format(self.count), 1, 1, 1)
	GameTooltip:AddLine(CHALLENGE_MODE_DEATH_COUNT_DESCRIPTION:format(SecondsToClock(self.timeLost, false)))

	GameTooltip:AddLine(" ")
	local list = {}
	local deathsCount = 0
	for unit,count in pairs(Mod.playerDeaths) do
		local _, class = UnitClass(unit)
		deathsCount = deathsCount + count
		table.insert(list, { count = count, unit = unit, class = class })
	end
	table.sort(list, function(a, b)
		if a.count ~= b.count then
			return a.count > b.count
		else
			return a.unit < b.unit
		end
	end)

	for _,item in ipairs(list) do
		local color = RAID_CLASS_COLORS[item.class] or HIGHLIGHT_FONT_COLOR
		GameTooltip:AddDoubleLine(item.unit, item.count, color.r, color.g, color.b, HIGHLIGHT_FONT_COLOR:GetRGB())
	end
	GameTooltip:Show()
end

function Mod:Blizzard_ObjectiveTracker()
	ScenarioChallengeModeBlock.DeathCount:SetScript("OnEnter", DeathCount_OnEnter)
end

function Mod:Startup()
	if not AngryKeystones_Data then
		AngryKeystones_Data = {}
	end
	if not AngryKeystones_Data.progress then
		AngryKeystones_Data = { progress = AngryKeystones_Data }
	end
	if not AngryKeystones_Data.state then AngryKeystones_Data.state = {} end
	local mapID = C_ChallengeMode.GetActiveChallengeMapID()
	if select(10, C_Scenario.GetInfo()) == LE_SCENARIO_TYPE_CHALLENGE_MODE and mapID and mapID == AngryKeystones_Data.state.mapID and AngryKeystones_Data.state.playerDeaths then
		Mod.playerDeaths = AngryKeystones_Data.state.playerDeaths
	else
		AngryKeystones_Data.state.mapID = nil
		AngryKeystones_Data.state.playerDeaths = Mod.playerDeaths
	end

	self:RegisterEvent("SCENARIO_CRITERIA_UPDATE")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("WORLD_STATE_TIMER_START")
	self:RegisterEvent("WORLD_STATE_TIMER_STOP")
	self:RegisterEvent("CHALLENGE_MODE_START")
	self:RegisterEvent("CHALLENGE_MODE_RESET")
	self:RegisterAddOnLoaded("Blizzard_ObjectiveTracker")
	CheckTime(GetWorldElapsedTimers())
	GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

	Addon.Config:RegisterCallback('progressFormat', function()
		local usedBars = SCENARIO_TRACKER_MODULE.usedProgressBars[ScenarioObjectiveBlock] or {}
		for _, bar in pairs(usedBars) do
			ProgressBar_SetValue(bar)
		end
	end)
end

hooksecurefunc("ScenarioTrackerProgressBar_SetValue", ProgressBar_SetValue)


local ADDON, Addon = ...
local Mod = Addon:NewModule('Keystone')

-- local poorColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_POOR))
-- local epicColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_EPIC))

-- local events = {
-- 	"CHAT_MSG_SAY",
-- 	"CHAT_MSG_YELL",
-- 	"CHAT_MSG_CHANNEL",
-- 	"CHAT_MSG_TEXT_EMOTE",
-- 	"CHAT_MSG_WHISPER",
-- 	"CHAT_MSG_WHISPER_INFORM",
-- 	"CHAT_MSG_BN_WHISPER",
-- 	"CHAT_MSG_BN_WHISPER_INFORM",
-- 	"CHAT_MSG_BN_CONVERSATION",
-- 	"CHAT_MSG_GUILD",
-- 	"CHAT_MSG_OFFICER",
-- 	"CHAT_MSG_PARTY",
-- 	"CHAT_MSG_PARTY_LEADER",
-- 	"CHAT_MSG_RAID",
-- 	"CHAT_MSG_RAID_LEADER",
-- 	"CHAT_MSG_INSTANCE_CHAT",
-- 	"CHAT_MSG_INSTANCE_CHAT_LEADER",
-- }

-- local function filter(self, event, msg, ...)
-- 	local msg2 = msg:gsub("(|Hkeystone:([0-9:]+)|h(%b[])|h)", function(msg, itemString, itemName)
-- 		local info = { strsplit(":", itemString) }
-- 		local mapID = tonumber(info[1])
-- 		local mapLevel = tonumber(info[2])

-- 		if mapID and mapLevel then
-- 			local mapName = C_ChallengeMode.GetMapInfo(mapID)
-- 			return msg:gsub(itemName:gsub("(%W)","%%%1"), format(Addon.Locale.keystoneFormat, mapName, mapLevel))
-- 		else
-- 			return msg
-- 		end
-- 	end)
-- 	if msg2 ~= msg then
-- 		return false, msg2, ...
-- 	end
-- end

-- for _, v in pairs(events) do
-- 	ChatFrame_AddMessageEventFilter(v, filter)
-- end

local function SlotKeystone()
	for container=BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		local slots = GetContainerNumSlots(container)
		for slot=1, slots do
			local _, _, _, _, _, _, slotLink, _, _, slotItemID = GetContainerItemInfo(container, slot)
			if slotLink and slotLink:match("|Hkeystone:") then
				PickupContainerItem(container, slot)
				if (CursorHasItem()) then
					C_ChallengeMode.SlotKeystone()
				end
			end
		end
	end
end

function Mod:Blizzard_ChallengesUI()
	ChallengesKeystoneFrame:HookScript("OnShow", SlotKeystone)
end

function Mod:Startup()
	self:RegisterAddOnLoaded("Blizzard_ChallengesUI")
end


local ADDON, Addon = ...
local Mod = Addon:NewModule('Gossip')

local npcBlacklist = {
	[107435] = true, [112697] = true, [112699] = true, [107486] = true, -- Suspicous Noble
	[101462] = true, -- Reaves
	[166663] = true, -- Kyrian Steward
}

local function GossipNPCID()
	local guid = UnitGUID("npc")
	local npcid = guid and select(6, strsplit("-", guid))
	return tonumber(npcid)
end

local function IsStaticPopupShown()
	for index = 1, STATICPOPUP_NUMDIALOGS do
		local frame = _G["StaticPopup"..index]
		if frame and frame:IsShown() then
			return true
		end
	end
	return false
end

local function IsInActiveChallengeMode()
	local scenarioType = select(10, C_Scenario.GetInfo())
	if scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE then
		local timerIDs = {GetWorldElapsedTimers()}
		for i, timerID in ipairs(timerIDs) do
			local _, elapsedTime, type = GetWorldElapsedTime(timerID)
			if type == LE_WORLD_ELAPSED_TIMER_TYPE_CHALLENGE_MODE then
				local mapID = C_ChallengeMode.GetActiveChallengeMapID()
				if mapID then
					return true
				end
			end
		end
	end
	return false
end

function Mod:GOSSIP_SHOW()
	local npcId = GossipNPCID()
	if Addon.Config.autoGossip and IsInActiveChallengeMode() and not npcBlacklist[npcId] then
		local options = C_GossipInfo.GetOptions()
		for i = 1, C_GossipInfo.GetNumOptions() do
			if options[i]["type"] == "gossip" then
				local popupWasShown = IsStaticPopupShown()
				C_GossipInfo.SelectOption(i)
				local popupIsShown = IsStaticPopupShown()
				if popupIsShown then
					if not popupWasShown then
						StaticPopup1Button1:Click()
						C_GossipInfo.CloseGossip()
					end
				else
					C_GossipInfo.CloseGossip()
				end
				break
			end
		end
	end
end

local function PlayCurrent()
	if IsInActiveChallengeMode() and Addon.Config.hideTalkingHead then
		local frame = TalkingHeadFrame
		if (frame.finishTimer) then
			frame.finishTimer:Cancel()
			frame.finishTimer = nil
		end
		frame:Hide()
	end
end

function Mod:Blizzard_TalkingHeadUI()
	hooksecurefunc("TalkingHeadFrame_PlayCurrent", PlayCurrent)
end

function Mod:Startup()
	self:RegisterEvent("GOSSIP_SHOW")

	self:RegisterAddOnLoaded("Blizzard_TalkingHeadUI")
end


local ADDON, Addon = ...
local Mod = Addon:NewModule('Splits')

local challengeMapID

local function GetElapsedTime()
	for i = 1, select("#", GetWorldElapsedTimers()) do
		local timerID = select(i, GetWorldElapsedTimers())
		local _, elapsedTime, type = GetWorldElapsedTime(timerID)
		if type == LE_WORLD_ELAPSED_TIMER_TYPE_CHALLENGE_MODE then
			return elapsedTime
		end
	end
end

local function UpdateSplits(self, numCriteria, objectiveBlock, addObjectives)
	local scenarioType = select(10, C_Scenario.GetInfo())
	if not self:ShouldShowCriteria() or not Mod.splits or not Mod.splitNames or scenarioType ~= LE_SCENARIO_TYPE_CHALLENGE_MODE then return end
	if not SCENARIO_TRACKER_MODULE or not objectiveBlock or not objectiveBlock.lines then return end

	for criteriaIndex, elapsed in ipairs(Mod.splits) do
		local criteriaString = Mod.splitNames[criteriaIndex]
		local completed = elapsed ~= false

		if elapsed and elapsed ~= true and criteriaString then
			if Addon.Config.splitsFormat == 2 and criteriaIndex ~= #Mod.splits then
				local prev = 0
				for i, e in ipairs(Mod.splits) do
					if e and e ~= true and e < elapsed and e > prev and i ~= #Mod.splits then
						prev = e
					end
				end

				local split = elapsed - prev
				criteriaString = string.format("%s, +%s", criteriaString, Addon.ObjectiveTracker.timeFormat(split))
			elseif Addon.Config.splitsFormat == 1 or (Addon.Config.splitsFormat == 2 and criteriaIndex == #Mod.splits) then
				criteriaString = string.format("%s, %s", criteriaString, Addon.ObjectiveTracker.timeFormat(elapsed))
			end
		end
		if criteriaIndex ~= #Mod.splits then
			criteriaString = string.format("%d/%d %s", completed and 1 or 0, 1, criteriaString)
		end

		if addObjectives then
			SCENARIO_TRACKER_MODULE.lineSpacing = 12;
			if ( completed ) then
				local existingLine = objectiveBlock.lines[criteriaIndex];
				SCENARIO_TRACKER_MODULE:AddObjective(objectiveBlock, criteriaIndex, criteriaString, nil, nil, OBJECTIVE_DASH_STYLE_SHOW, OBJECTIVE_TRACKER_COLOR["Complete"]);
				objectiveBlock.currentLine.Icon:Show();
				objectiveBlock.currentLine.Icon:SetAtlas("Tracker-Check", true);
				objectiveBlock.currentLine.completed = true;
			else
				SCENARIO_TRACKER_MODULE:AddObjective(objectiveBlock, criteriaIndex, criteriaString);
				objectiveBlock.currentLine.Icon:Show();
				objectiveBlock.currentLine.Icon:SetAtlas("Objective-Nub", true);
			end
		else
			local line = objectiveBlock.lines[criteriaIndex]
			if line then
				local old_height = line:GetHeight()
				local height = SCENARIO_TRACKER_MODULE:SetStringText(line.Text, criteriaString, nil, completed and OBJECTIVE_TRACKER_COLOR["Complete"], objectiveBlock.isHighlighted)
				line:SetHeight(height)
				if old_height ~= height then
					objectiveBlock.height = objectiveBlock.height + height - old_height
				end
			end
		end
	end
end
Mod.UpdateSplits = UpdateSplits

function Mod:SplitOutput()
	if Addon.Config.splitsFormat == 0 then return end

	local splitStrs = {}
	for index, elapsed in ipairs(Mod.splits) do
		if elapsed and elapsed ~= true then
			if Addon.Config.splitsFormat == 2 then
				local prev = 0
				for i, e in ipairs(Mod.splits) do
					if e and e ~= true and e < elapsed and e > prev and i ~= #Mod.splits then
						prev = e
					end
				end
				local split = elapsed - prev
				table.insert(splitStrs, string.format("%s +%s", Mod.splitNames[index], Addon.ObjectiveTracker.timeFormat(split)))
			elseif Addon.Config.splitsFormat == 1 or (Addon.Config.splitsFormat == 2 and index == #Mod.splits) then
				table.insert(splitStrs, string.format("%s %s", Mod.splitNames[index], Addon.ObjectiveTracker.timeFormat(elapsed)))
			end
		end
	end
	return table.concat(splitStrs, ", ")
end

function Mod:CHALLENGE_MODE_RESET()
	Mod.splits = nil
	Mod.splitNames = nil
	Mod.mapVariation = nil
	AngryKeystones_Data.state.splits = nil
	AngryKeystones_Data.state.splitNames = nil
	AngryKeystones_Data.state.mapID = nil
end

local function ArcwayMapVariation()
	local ret

	local curMapID, curFloor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel()
	SetMapToCurrentZone()
	local numPOIs = GetNumMapLandmarks()
	for i=1, numPOIs do
		local _, _, _, _, x, y, _, _, _, _, _, _, atlasIcon = GetMapLandmarkInfo(i)
		x, y = tostring(x), tostring(y)
		if atlasIcon == "map-icon-SuramarDoor.tga" then
			if x == "0.42697441577911" and y == "0.35995090007782" then -- Left Path
				ret = "left"
			end
			if x == "0.53354382514954" and y == "0.35967540740967" then -- Right Path
				ret = "right"
			end
		end
	end
	SetMapByID(curMapID)
	if curFloor then SetDungeonMapLevel(curFloor) end

	return ret
end

function Mod:CHALLENGE_MODE_COMPLETED()
	if not challengeMapID then return end
	local mapID, level, timeElapsed, onTime, keystoneUpgradeLevels = C_ChallengeMode.GetCompletionInfo()
	local name, _, timeLimit = C_ChallengeMode.GetMapUIInfo(challengeMapID)
	local _, affixes, wasEnergized = C_ChallengeMode.GetActiveKeystoneInfo()
	local splits = Mod.splits

	local missingCount = 0
	for index,elapsed in pairs(splits) do
		if elapsed == false then
			splits[index] = floor(timeElapsed / 1000)
			missingCount = missingCount + 1
		elseif elapsed == true then
			missingCount = missingCount + 1
		end
	end

	splits.date = time()
	splits.level = level
	splits.mapID = mapID
	splits.wasEnergized = wasEnergized
	splits.timeElapsed = timeElapsed / 1000
	splits.timeLimit = timeLimit
	splits.affixes1 = affixes[1]
	splits.affixes2 = affixes[2]
	splits.affixes3 = affixes[3]
	splits.mapVariation = Mod.mapVariation
	splits.patch = GetBuildInfo()

	local unitTokens = { "player", "party1", "party2", "party3", "party4" }
	for i = 1, #unitTokens do
		local u = unitTokens[i]
		if UnitExists(u) then
			splits["party"..i.."Name"] = UnitName(u)
			splits["party"..i.."Class"] = UnitClass(u)
			splits["party"..i.."Role"] = UnitGroupRolesAssigned(u)
			-- splits["party"..i.."Spec"] = u == "player" and GetSpecializationInfo(GetSpecialization() or 0) or GetInspectSpecialization(u)
		end
	end

	if Addon.Config.recordSplits then
		if not AngryKeystones_Data.splits[mapID] then AngryKeystones_Data.splits[mapID] = {} end
		table.insert(AngryKeystones_Data.splits[mapID], splits)
	end
end

function Mod:SCENARIO_UPDATE()
	local scenarioType = select(10, C_Scenario.GetInfo())
	if scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE then
		local numCriteria = select(3, C_Scenario.GetStepInfo())
		local mapID = C_ChallengeMode.GetActiveChallengeMapID()
		if not Mod.splits and numCriteria > 0 then
			Mod.splits = {}
			AngryKeystones_Data.state.splits = Mod.splits
			Mod.splitNames = {}
			AngryKeystones_Data.state.splitNames = Mod.splitNames
			AngryKeystones_Data.state.mapID = mapID
			for criteriaIndex = 1, numCriteria do
				local criteriaString, criteriaType, completed = C_Scenario.GetCriteriaInfo(criteriaIndex)
				Mod.splits[criteriaIndex] = completed
				Mod.splitNames[criteriaIndex] = criteriaString
			end
		end
	end
end

function Mod:SCENARIO_CRITERIA_UPDATE()
	local scenarioType = select(10, C_Scenario.GetInfo())
	if scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE then
		local mapID = C_ChallengeMode.GetActiveChallengeMapID()
		if mapID == 1516 and Addon.Config.recordSplits and not Mod.mapVariation then Mod.mapVariation = ArcwayMapVariation() end -- The Arcway

		local fresh = false
		if not Mod.splits then
			Mod.splits = {}
			AngryKeystones_Data.state.splits = Mod.splits
			Mod.splitNames = {}
			AngryKeystones_Data.state.splitNames = Mod.splitNames
			AngryKeystones_Data.state.mapID = mapID
			fresh = true
		end
		local numCriteria = select(3, C_Scenario.GetStepInfo())
		for criteriaIndex = 1, numCriteria do
			local criteriaString, criteriaType, completed, quantity, totalQuantity, flags, _, quantityString, criteriaID, _, _, _, isWeightedProgress = C_Scenario.GetCriteriaInfo(criteriaIndex)
			if not Mod.splitNames[criteriaIndex] then
				Mod.splitNames[criteriaIndex] = criteriaString
			end
			if Mod.splits[criteriaIndex] == nil then Mod.splits[criteriaIndex] = false end

			if completed and not Mod.splits[criteriaIndex] then
				Mod.splits[criteriaIndex] = fresh or GetElapsedTime()
			end
		end
		UpdateSplits(SCENARIO_CONTENT_TRACKER_MODULE, numCriteria, ScenarioObjectiveBlock)
	end
end

function Mod:CHALLENGE_MODE_START()
	challengeMapID = C_ChallengeMode.GetActiveChallengeMapID()
end

function Mod:Startup()
	if not AngryKeystones_Data then AngryKeystones_Data = {} end
	if not AngryKeystones_Data.splits then AngryKeystones_Data.splits = {} end
	if not AngryKeystones_Data.state then AngryKeystones_Data.state = {} end

	local mapID = C_ChallengeMode.GetActiveChallengeMapID()
	if select(10, C_Scenario.GetInfo()) == LE_SCENARIO_TYPE_CHALLENGE_MODE and mapID and mapID == AngryKeystones_Data.state.mapID then
		Mod.splits = AngryKeystones_Data.state.splits
		Mod.splitNames = AngryKeystones_Data.state.splitNames
	else
		AngryKeystones_Data.state.mapID = nil
		AngryKeystones_Data.state.splits = nil
		AngryKeystones_Data.state.splitNames = nil
	end
	challengeMapID = mapID

	self:RegisterEvent("SCENARIO_CRITERIA_UPDATE")
	self:RegisterEvent("CHALLENGE_MODE_START")
	self:RegisterEvent("CHALLENGE_MODE_RESET")
	self:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterEvent("SCENARIO_UPDATE")
	self:SCENARIO_UPDATE()
	hooksecurefunc(SCENARIO_CONTENT_TRACKER_MODULE, "UpdateCriteria", UpdateSplits)
	Addon.Config:RegisterCallback('splitsFormat', function()
		UpdateSplits(SCENARIO_CONTENT_TRACKER_MODULE, nil, ScenarioObjectiveBlock)
	end)
end


local ADDON, Addon = ...
local Mod = Addon:NewModule('Schedule')

local rowCount = 3

local requestPartyKeystones

-- 1: Overflowing, 2: Skittish, 3: Volcanic, 4: Necrotic, 5: Teeming, 6: Raging, 7: Bolstering, 8: Sanguine, 9: Tyrannical, 10: Fortified, 11: Bursting, 12: Grievous, 13: Explosive, 14: Quaking
local affixScheduleText = {
	{"Fortified",	"Bolstering",	"Grievous"},
	{"Tyrannical",	"Raging",	"Explosive"},
	{"Fortified",	"Sanguine",	"Grievous"},
	{"Tyrannical",	"Teeming",	"Volcanic"},
	{"Fortified",	"Bolstering",	"Skittish"},
	{"Tyrannical",	"Bursting",	"Necrotic"},
	{"Fortified",	"Sanguine",	"Quaking"},
	{"Tyrannical",	"Bolstering",	"Explosive"},
	{"Fortified",	"Bursting",	"Volcanic"},
	{"Tyrannical",	"Raging",	"Necrotic"},
	{"Fortified",	"Teeming",	"Quaking"},
	{"Tyrannical",	"Bursting",	"Skittish"}
}
local affixScheduleKeys = {["Overflowing"]=1, ["Skittish"]=2, ["Volcanic"]=3, ["Necrotic"]=4, ["Teeming"]=5, ["Raging"]=6, ["Bolstering"]=7, ["Sanguine"]=8, ["Tyrannical"]=9, ["Fortified"]=10, ["Bursting"]=11, ["Grievous"]=12, ["Explosive"]=13, ["Quaking"]=14 }
local affixSchedule = {}
for i,v in ipairs(affixScheduleText) do
	affixSchedule[i] = { affixScheduleKeys[v[1]], affixScheduleKeys[v[2]], affixScheduleKeys[v[3]] }
end

local affixScheduleUnknown = false
local currentWeek
local currentKeystoneMapID
local currentKeystoneLevel
local unitKeystones = {}

local function GetNameForKeystone(keystoneMapID, keystoneLevel)
	local keystoneMapName = keystoneMapID and C_ChallengeMode.GetMapUIInfo(keystoneMapID)
	if keystoneMapID and keystoneMapName then
		return string.format("%s (%d)", keystoneMapName, keystoneLevel)
	end
end

local function UpdatePartyKeystones()
	Mod:CheckCurrentKeystone()
	if requestPartyKeystones then
		Mod:SendPartyKeystonesRequest()
	end

	if not IsAddOnLoaded("Blizzard_ChallengesUI") then return end

	local playerRealm = select(2, UnitFullName("player"))

	local e = 1
	for i = 1, 4 do
		local entry = Mod.PartyFrame.Entries[e]
		local name, realm = UnitName("party"..i)

		if name then
			local fullName
			if not realm or realm == "" then
				fullName = name.."-"..playerRealm
			else
				fullName = name.."-"..realm
			end

			if unitKeystones[fullName] ~= nil then
				local keystoneName
				if unitKeystones[fullName] == 0 then
					keystoneName = NONE
				else
					keystoneName = GetNameForKeystone(unitKeystones[fullName][1], unitKeystones[fullName][2])
				end
				if keystoneName then
					entry:Show()
					local _, class = UnitClass("party"..i)
					local color = RAID_CLASS_COLORS[class]
					entry.Text:SetText(name)
					entry.Text:SetTextColor(color:GetRGBA())

					local _, suffix = strsplit("-", keystoneName)
					if suffix then
						keystoneName = suffix
					end
					entry.Text2:SetText(keystoneName)

					e = e + 1
				end
			end
		end
	end
	if e == 1 then
		Mod.AffixFrame:ClearAllPoints()
		Mod.AffixFrame:SetPoint("LEFT", ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "RIGHT", 130, 0)
		Mod.PartyFrame:Hide()
	else
		Mod.AffixFrame:ClearAllPoints()
		Mod.AffixFrame:SetPoint("TOPLEFT", ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "TOPRIGHT", 130, 55)
		Mod.PartyFrame:Show()
	end
	while e <= 4 do
		Mod.PartyFrame.Entries[e]:Hide()
		e = e + 1
	end
end

local function UpdateFrame()
	Mod:CheckAffixes()
	Mod.AffixFrame:Show()
	Mod.PartyFrame:Show()
	Mod.KeystoneText:Show()

	local weeklyChest = ChallengesFrame.WeeklyInfo.Child.WeeklyChest
	weeklyChest:ClearAllPoints()
	weeklyChest:SetPoint("LEFT", 100, -30)

	local description = ChallengesFrame.WeeklyInfo.Child.Description
	description:SetWidth(240)
	description:ClearAllPoints()
	description:SetPoint("TOP", weeklyChest, "TOP", 0, 75)

	local legacyWeeklyChest = ChallengesFrame.WeeklyInfo.Child.LegacyWeeklyChest
	legacyWeeklyChest:ClearAllPoints()
	legacyWeeklyChest:SetPoint("TOP", weeklyChest, "TOP", 0, 50)

	local currentKeystoneName = GetNameForKeystone(C_MythicPlus.GetOwnedKeystoneChallengeMapID(), C_MythicPlus.GetOwnedKeystoneLevel())
	if currentKeystoneName then
		Mod.KeystoneText:Show()
		Mod.KeystoneText:SetText( string.format(Addon.Locale.currentKeystoneText, currentKeystoneName) )
	else
		Mod.KeystoneText:Hide()
	end

	if currentWeek and not affixScheduleUnknown then
		for i = 1, rowCount do
			local entry = Mod.AffixFrame.Entries[i]
			entry:Show()

			local scheduleWeek = (currentWeek - 1 + i) % (#affixSchedule) + 1
			local affixes = affixSchedule[scheduleWeek]
			for j = 1, #affixes do
				local affix = entry.Affixes[j]
				affix:SetUp(affixes[j])
			end
		end
		Mod.AffixFrame.Label:Hide()
	else
		for i = 1, rowCount do
			Mod.AffixFrame.Entries[i]:Hide()
		end
		Mod.AffixFrame.Label:Show()
	end
	UpdatePartyKeystones()
end

local function makeAffix(parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(16, 16)

	local border = frame:CreateTexture(nil, "OVERLAY")
	border:SetAllPoints()
	border:SetAtlas("ChallengeMode-AffixRing-Sm")
	frame.Border = border

	local portrait = frame:CreateTexture(nil, "ARTWORK")
	portrait:SetSize(14, 14)
	portrait:SetPoint("CENTER", border)
	frame.Portrait = portrait

	frame.SetUp = ScenarioChallengeModeAffixMixin.SetUp
	frame:SetScript("OnEnter", ScenarioChallengeModeAffixMixin.OnEnter)
	frame:SetScript("OnLeave", GameTooltip_Hide)

	return frame
end

function Mod:Blizzard_ChallengesUI()
	local frame = CreateFrame("Frame", nil, ChallengesFrame)
	frame:SetSize(246, 92)
	frame:SetPoint("TOPLEFT", ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "TOPRIGHT", -20, 30)
	Mod.AffixFrame = frame

	local bg = frame:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetAtlas("ChallengeMode-guild-background")
	bg:SetAlpha(0.4)

	local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalMed2")
	title:SetText(Addon.Locale.scheduleTitle)
	title:SetPoint("TOPLEFT", 15, -7)

	local line = frame:CreateTexture(nil, "ARTWORK")
	line:SetSize(232, 9)
	line:SetAtlas("ChallengeMode-RankLineDivider", false)
	line:SetPoint("TOP", 0, -20)

	local entries = {}
	for i = 1, rowCount do
		local entry = CreateFrame("Frame", nil, frame)
		entry:SetSize(216, 18)

		local text = entry:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		text:SetWidth(120)
		text:SetJustifyH("LEFT")
		text:SetWordWrap(false)
		text:SetText( Addon.Locale["scheduleWeek"..i+1] )
		text:SetPoint("LEFT")
		entry.Text = text

		local affixes = {}
		local prevAffix
		for j = 3, 1, -1 do
			local affix = makeAffix(entry)
			if prevAffix then
				affix:SetPoint("RIGHT", prevAffix, "LEFT", -4, 0)
			else
				affix:SetPoint("RIGHT")
			end
			prevAffix = affix
			affixes[j] = affix
		end
		entry.Affixes = affixes

		if i == 1 then
			entry:SetPoint("TOP", line, "BOTTOM")
		else
			entry:SetPoint("TOP", entries[i-1], "BOTTOM")
		end

		entries[i] = entry
	end
	frame.Entries = entries

	local label = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	label:SetPoint("TOPLEFT", line, "BOTTOMLEFT", 10, 0)
	label:SetPoint("TOPRIGHT", line, "BOTTOMRIGHT", -10, 0)
	label:SetJustifyH("CENTER")
	label:SetJustifyV("MIDDLE")
	label:SetHeight(72)
	label:SetWordWrap(true)
	if affixScheduleUnknown then
		label:SetText(Addon.Locale.scheduleUnknown)
	else
		label:SetText(Addon.Locale.scheduleMissingKeystone)
	end
	frame.Label = label

	local frame2 = CreateFrame("Frame", nil, ChallengesFrame)
	frame2:SetSize(246, 110)
	frame2:SetPoint("TOP", frame, "BOTTOM", 0, -10)
	Mod.PartyFrame = frame2

	local bg2 = frame2:CreateTexture(nil, "BACKGROUND")
	bg2:SetAllPoints()
	bg2:SetAtlas("ChallengeMode-guild-background")
	bg2:SetAlpha(0.4)

	local title2 = frame2:CreateFontString(nil, "ARTWORK", "GameFontNormalMed2")
	title2:SetText(Addon.Locale.partyKeysTitle)
	title2:SetPoint("TOPLEFT", 15, -7)

	local line2 = frame2:CreateTexture(nil, "ARTWORK")
	line2:SetSize(232, 9)
	line2:SetAtlas("ChallengeMode-RankLineDivider", false)
	line2:SetPoint("TOP", 0, -20)

	local entries2 = {}
	for i = 1, 4 do
		local entry = CreateFrame("Frame", nil, frame2)
		entry:SetSize(216, 18)

		local text = entry:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		text:SetWidth(120)
		text:SetJustifyH("LEFT")
		text:SetWordWrap(false)
		text:SetText()
		text:SetPoint("LEFT")
		entry.Text = text

		local text2 = entry:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		text2:SetWidth(180)
		text2:SetJustifyH("RIGHT")
		text2:SetWordWrap(false)
		text2:SetText()
		text2:SetPoint("RIGHT")
		entry.Text2 = text2

		if i == 1 then
			entry:SetPoint("TOP", line2, "BOTTOM")
		else
			entry:SetPoint("TOP", entries2[i-1], "BOTTOM")
		end

		entries2[i] = entry
	end
	frame2.Entries = entries2

	local keystoneText = ChallengesFrame.WeeklyInfo.Child:CreateFontString(nil, "ARTWORK", "GameFontNormalMed2")
	keystoneText:SetPoint("TOP", ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "BOTTOM", 0, -15)
	keystoneText:SetWidth(220)
	Mod.KeystoneText = keystoneText

	hooksecurefunc("ChallengesFrame_Update", UpdateFrame)
end

function Mod:GetInventoryKeystone()
	for container=BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		local slots = GetContainerNumSlots(container)
		for slot=1, slots do
			local _, _, _, _, _, _, slotLink = GetContainerItemInfo(container, slot)
			local itemString = slotLink and slotLink:match("|Hkeystone:([0-9:]+)|h(%b[])|h")
			if itemString then
				return slotLink, itemString
			end
		end
	end
end

function Mod:CheckAffixes()
	currentWeek = nil
	local currentAffixes = C_MythicPlus.GetCurrentAffixes()

	if currentAffixes then
		for index, affixes in ipairs(affixSchedule) do
			local matches = 0
			for _, affix in ipairs(currentAffixes) do
				if affix.id == affixes[1] or affix.id == affixes[2] or affix.id == affixes[3] then
					matches = matches + 1
				end
			end
			if matches >= 3 then
				currentWeek = index
			end
		end
	end
end

local bagUpdateTimerStarted = false
function Mod:BAG_UPDATE()
	if not bagUpdateTimerStarted then
		bagUpdateTimerStarted = true
		C_Timer.After(1, function()
			Mod:CheckCurrentKeystone()
			bagUpdateTimerStarted = false
		end)
	end
end

function Mod:CHAT_MSG_LOOT(...)
	local lootString, _, _, _, unit = ...
	if string.match(lootString, "|Hitem:158923:") then
		if UnitName("player") == unit then
			self:CheckCurrentKeystone()
		else
			self:SetPartyKeystoneRequest()
		end
	end
end

function Mod:SetPartyKeystoneRequest()
	requestPartyKeystones = true
	if IsAddOnLoaded("Blizzard_ChallengesUI") and ChallengesFrame:IsShown() then
		self:SendPartyKeystonesRequest()
		UpdatePartyKeystones()
	end
end

function Mod:SendPartyKeystonesRequest()
	requestPartyKeystones = false
	self:SendAddOnComm("request", "PARTY")
end

local hadKeystone = false
function Mod:CheckCurrentKeystone(announce)
	local keystoneMapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	local keystoneLevel = C_MythicPlus.GetOwnedKeystoneLevel()

	if keystoneMapID ~= currentKeystoneMapID or keystoneLevel ~= currentKeystoneLevel then
		currentKeystoneMapID = keystoneMapID
		currentKeystoneLevel = keystoneLevel

		if hadKeystone and announce ~= false and Addon.Config.announceKeystones then
			local itemLink = self:GetInventoryKeystone()
			if itemLink and IsInGroup(LE_PARTY_CATEGORY_HOME) then
				SendChatMessage(string.format(Addon.Locale.newKeystoneAnnounce, itemLink), "PARTY")
			end
		end

		hadKeystone = true
		self:SendCurrentKeystone()
	end
end

function Mod:SendCurrentKeystone()
	local keystoneMapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	local keystoneLevel = C_MythicPlus.GetOwnedKeystoneLevel()
	
	local message = "0"
	if keystoneLevel and keystoneMapID then
		message = string.format("%d:%d", keystoneMapID, keystoneLevel)
	end

	self:SendAddOnComm(message, "PARTY")
end

function Mod:ReceiveAddOnComm(message, type, sender)
	if message == "request" then
		requestPartyKeystones = false
		self:SendCurrentKeystone()
	elseif message == "0" then
		if unitKeystones[sender] ~= 0 then
			unitKeystones[sender] = 0
			UpdatePartyKeystones()
		end
	else
		local arg1, arg2 = message:match("^(%d+):(%d+)$")
		local keystoneMapID = arg1 and tonumber(arg1)
		local keystoneLevel = arg2 and tonumber(arg2)
		if keystoneMapID and keystoneLevel and (unitKeystones[sender] == nil or unitKeystones[sender] == 0
				or not (unitKeystones[sender][1] == keystoneMapID and unitKeystones[sender][2] == keystoneLevel)) then
			unitKeystones[sender] = { keystoneMapID, keystoneLevel }
			UpdatePartyKeystones()
		end
	end
end

function Mod:CHALLENGE_MODE_START()
	self:CheckCurrentKeystone(false)
	C_Timer.After(2, function() self:CheckCurrentKeystone(false) end)
	self:SetPartyKeystoneRequest()
end

function Mod:CHALLENGE_MODE_COMPLETED()
	self:CheckCurrentKeystone()
	C_Timer.After(2, function() self:CheckCurrentKeystone() end)
	self:SetPartyKeystoneRequest()
end

function Mod:CHALLENGE_MODE_UPDATED()
	self:CheckCurrentKeystone()
end

function Mod:Startup()
	self:RegisterAddOnLoaded("Blizzard_ChallengesUI")
	self:RegisterEvent("GROUP_ROSTER_UPDATE", "SetPartyKeystoneRequest")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("CHAT_MSG_LOOT")
	self:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterEvent("CHALLENGE_MODE_START")
	self:RegisterEvent("CHALLENGE_MODE_MAPS_UPDATE", "CHALLENGE_MODE_UPDATED")
	self:RegisterEvent("CHALLENGE_MODE_LEADERS_UPDATE", "CHALLENGE_MODE_UPDATED")
	self:RegisterEvent("CHALLENGE_MODE_MEMBER_INFO_UPDATED", "CHALLENGE_MODE_UPDATED")
	self:RegisterAddOnComm()
	self:CheckCurrentKeystone()

	C_Timer.After(3, function()
		C_MythicPlus.RequestCurrentAffixes()
		C_MythicPlus.RequestRewards()
	end)

	C_Timer.NewTicker(60, function() self:CheckCurrentKeystone() end)
	
	requestPartyKeystones = true
end
