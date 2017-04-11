-- RaceName
if GetLocale() == "zhCN" then
	RaceNames = 
	{
		[2] = "人类",
		[3] = "血精灵",
		[4] = "德莱尼",
		[5] = "矮人",
		[6] = "侏儒",
		[7] = "地精",
		[8] = "暗夜精灵",
		[9] = "兽人",
		[10] = "熊猫人",
		[11] = "牛头人",
		[12] = "巨魔",
		[13] = "亡灵",
		[14] = "狼人",
		[15] = "食人魔",
		[28] = "机械",
		[29] = "刃牙虎人",
		[30] = "独眼魔",
		[31] = "木精",
		[33] = "豺狼人",
		[34] = "锦鱼人",
		[35] = "猢狲",
		[36] = "鸦人流亡者",
		[37] = "狂兽人",
		[41] = "埃匹希斯守卫",
		[42] = "高等鸦人"
	}
elseif GetLocale() == "zhTW" then
	RaceNames = 
	{
		[2] = "人類",
		[3] = "血精靈",
		[4] = "德萊尼",
		[5] = "矮人",
		[6] = "地精",
		[7] = "哥布林",
		[8] = "夜精靈",
		[9] = "獸人",
		[10] = "熊貓人",
		[11] = "牛頭人",
		[12] = "食人妖",
		[13] = "不死族",
		[14] = "狼人",
		[15] = "巨魔",
		[28] = "機械",
		[29] = "劍齒人",
		[30] = "歐格隆",
		[31] = "波塔尼",
		[33] = "豺狼人",
		[34] = "錦魚人",
		[35] = "猴人",
		[36] = "阿拉卡流亡者",
		[37] = "狂獸人",
		[41] = "頂尖守護者",
		[42] = "高等阿拉卡人"
	}
else --enUS
	RaceNames = 
	{
		[2] = "Human",
		[3] = "Blood Elf",
		[4] = "Draenei",
		[5] = "Dwarf",
		[6] = "Gnome",
		[7] = "Goblin",
		[8] = "Night Elf",
		[9] = "Orc",
		[10] = "Pandaren",
		[11] = "Tauren",
		[12] = "Troll",
		[13] = "Undead",
		[14] = "Worgen",
		[15] = "Ogre",
		[28] = "Mechanical",
		[29] = "Saberon",
		[30] = "Ogron",
		[31] = "Botani",
		[33] = "Gnoll",
		[34] = "Jinyu",
		[35] = "Hozen",
		[36] = "Outcast Arakkoa",
		[37] = "Dire Orc",
		[41] = "Apexis Guardian",
		[42] = "High Arakkoa",
	}
end

local _, SmartFollowerManager = ...
local race = SmartFollowerManager.raceID
local raceName = RaceNames
local specFollower = SmartFollowerManager.specFollower

local API = {}

function API.GetClassSpecNameBySpecID(specID)
	local garrFollowerID = specFollower[specID]
	if garrFollowerID then
		return C_Garrison.GetFollowerClassSpecName(garrFollowerID)
	end
end

function API.GetRaceID(garrFollowerID)
	local id = garrFollowerID
	if not id then
		return
	end
	if type(id) == "string" then
		id = tonumber(id)
	end
	
	return race[id]
end

function API.GetRaceName(garrFollowerID)
	local id = garrFollowerID
	if not id then
		return
	end
	if type(id) == "string" then
		id = tonumber(id)
	end
	
	local rID = race[id]
	if not rID then
		return
	end
	
	local rName = raceName[rID]
	if not rName then
		rName = OTHER
	end
	
	return rName
end

SmartFollowerManager.API = API