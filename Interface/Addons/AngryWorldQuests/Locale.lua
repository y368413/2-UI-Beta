local ADDON, Addon = ...
local Locale = Addon:NewModule('Locale')

local default_locale = "enUS"
local current_locale

local langs = {}
langs.enUS = {
	UPGRADES = "Upgrades",
	config_showAtTop = "Display at the top of the Quest Log", 
	config_onlyCurrentZone = "Only show World Quests for the current zone", 
	config_showEverywhere = "Show World Quests on every map",
	config_hideFilteredPOI = "Hide filtered World Quest POI icons on the world map", 
	config_hideUntrackedPOI = "Hide untracked World Quest POI icons on the world map", 
	config_showHoveredPOI = "Always show hovered World Quest POI icon",
	config_showContinentPOI = "Show World Quest POI icons on the Broken Isles map",
	config_lootFilterUpgrades = "Show only upgrades for Loot filter",
	config_timeFilterDuration = "Time Remaining filter duration",
	config_enabledFilters = "Enabled Filters",
	config_sortMethod = "Sort World Quests by",
	config_sortMethod_1 = NAME,
	config_sortMethod_2 = CLOSES_IN,
	config_sortMethod_3 = ZONE,
	config_sortMethod_4 = FACTION,
	config_sortMethod_5 = REWARDS,
	config_characterConfig = "Per-character configuration",
	config_saveFilters = "Save active filters between logins",
	config_lootUpgradesLevel = "Loot filter shows upgrades",
	config_lootUpgradesLevelValue1 = "Higher ilvl only",
	config_lootUpgradesLevelValue2 = "Up to same ilvl",
	config_lootUpgradesLevelValue = "Up to %d ilvls less",
	CURRENT_ZONE = "Current Zone",
}

langs.zhCN = {
	UPGRADES = "可升级",
	config_showAtTop = "将任务列表置于任务日志顶部",
	config_onlyCurrentZone = "仅显示当前区域的任务列表",
	config_showEverywhere = "在所有的地图显示任务列表",
	config_hideFilteredPOI = "在世界地图上隐藏被过滤的任务",
	config_hideUntrackedPOI = "在世界地图上隐藏未被追踪的任务",
	config_showHoveredPOI = "总是显示鼠标悬停的世界任务",
	config_showContinentPOI = "在破碎群岛的地图上显示世界任务图标",
	config_lootFilterUpgrades = "在物品过滤里仅显示更高装等的物品任务",
	config_timeFilterDuration = "剩余时间过滤时长",
	config_enabledFilters = "启用过滤",
	config_sortMethod = "任务列表排序",
	config_sortMethod_1 = "名字",
	config_sortMethod_2 = "剩余时间",
	config_sortMethod_3 = "区域",
	config_sortMethod_4 = "声望",
	config_characterConfig = "为角色进行独立的配置",
	config_saveFilters = "自动保存最后选择的过滤",
	config_lootUpgradesLevel = "可升级物品装等过滤",
	config_lootUpgradesLevelValue1 = "仅显示更高装等",
	config_lootUpgradesLevelValue2 = "显示最高同等级",
	config_lootUpgradesLevelValue = "最多相差%d装等",
	CURRENT_ZONE = "当前区域",
}

langs.zhTW = {
	UPGRADES = "可升級",
	config_showAtTop = "將任務列表置於任務日誌頂部",
	config_onlyCurrentZone = "僅顯示當前區域的任務列表",
	config_showEverywhere = "在所有的地圖顯示任務列表",
	config_hideFilteredPOI = "在世界地圖上隱藏被過濾的任務",
	config_hideUntrackedPOI = "在世界地圖上隱藏未被追蹤的任務",
	config_showHoveredPOI = "總是顯示鼠標懸停的世界任務",
	config_showContinentPOI = "在破碎群島的地圖上顯示世界任務圖標",
	config_lootFilterUpgrades = "在物品過濾裏僅顯示更高裝等的物品任務",
	config_timeFilterDuration = "剩餘時間過濾時長",
	config_enabledFilters = "啟用過濾",
	config_sortMethod = "任務列表排序",
	config_sortMethod_1 = "名字",
	config_sortMethod_2 = "剩餘時間",
	config_sortMethod_3 = "區域",
	config_sortMethod_4 = "聲望",
	config_characterConfig = "為角色進行獨立的配置",
	config_saveFilters = "自動保存最後選擇的過濾",
	config_lootUpgradesLevel = "可升級物品裝等過濾",
	config_lootUpgradesLevelValue1 = "僅顯示更高裝等物品",
	config_lootUpgradesLevelValue2 = "顯示最高同裝等物品",
	config_lootUpgradesLevelValue = "最多相差%d裝等",
	CURRENT_ZONE = "當前區域",
}

function Locale:Get(key)
	if langs[current_locale] and langs[current_locale][key] ~= nil then
		return langs[current_locale][key]
	else
		return langs[default_locale][key]
	end
end

function Locale:Exists(key)
	return langs[default_locale][key] ~= nil
end

setmetatable(Locale, {__index = Locale.Get})

current_locale = GetLocale()
