--------------------------------------------------------
-- Namespaces
--------------------------------------------------------
local _, core = ...;

core.sectionNames = {
	Classic = {
		name = "经典",
		category = {"声望", "地下城掉落", "团本掉落"},
	},
	TBC = {
		name = "燃烧的远征",
		category = {"塞纳里奥远征队", "库雷尼/玛格汉", "灵翼之龙", "沙塔尔天空卫队", "商人", "地下城掉落", "团本掉落"},
	},
	WOTLK = {
		name = "巫妖王之怒",
		category = {"成就", "任务", "商人", "银色锦标赛", "声望", "地下城掉落", "团本掉落", "稀有刷新"},
	},
	CATA = {
		name = "大地的裂变",
		category = {"成就", "任务", "商人", "地下城掉落", "团本掉落", "稀有刷新"},
	},
	MOP = {
		name = "熊猫人之谜",
		category = {"成就", "金莲教", "云端翔龙骑士团", "影踪派", "昆莱山商人", "阡陌客", "原始恐龙蛋", "任务", "团本掉落", "稀有刷新", "世界首领", "声望"},
	},
	WOD = {
		name = "德拉诺之王",
		category = {"成就", "商人", "要塞入侵", "派遣任务", "兽栏", "货栈", "钓鱼小屋", "稀有刷新", "世界首领", "团本掉落"},
	},
	LEGION = {
		name = "军团再临",
		category = {"成就", "商人", "任务", "谜题", "声望", "稀有刷新", "地下城掉落", "团本掉落", "职业", "巅峰声望"},
	},
	BFA = {
		name = "争霸艾泽拉斯",
		category = {"成就", "商人", "任务", "服役勋章", "同盟种族", "声望", "谜题", "制作", "区域", "稀有刷新", "世界首领", "战争前线: 阿拉希", "战争前线: 黑海岸", "突袭: 锦绣谷", "突袭: 奥丹姆", "地下城掉落", "团本掉落", "海岛探险", "海员达布隆币", "惊魂幻象", "巅峰声望", "前夕事件"},
	},
	SL =  {
		name = "暗影国度",
		category = {"成就", "商人", "宝藏", "冒险", "谜题", "折磨者", "噬渊突袭", "声望", "巅峰声望", "地下城掉落", "团本掉落", "区域", "日常活动", "稀有刷新", "渗出粘液的通灵鳐之卵", "盟约特色", "法夜", "格里恩", "通灵领主", "温西尔"},
	},
	Horde = {
		name = "部落",
		category = {"熊猫人", "兽人", "亡灵", "牛头人", "巨魔", "地精", "血精灵"}
	},
	Alliance = {
		name = "联盟",
		category = {"熊猫人", "人类", "矮人", "侏儒", "德莱尼", "暗夜精灵", "狼人"}
	},
	Professions = {
		name = "专业",
		category = {"炼金术", "考古学", "工程学", "钓鱼", "珠宝加工", "裁缝", "制皮", "锻造"},
	},
	PVP = {
		name = "PVP",
		category = {"成就", "荣耀印记", "荣誉", "邪气鞍座", "角斗士", "哈兰", "永恒岛", "复仇之爪"},
	},
	WorldEvents = {
		name = "世界事件",
		category = {"成就", "美酒节", "万圣节", "情人节", "复活节", "冬幕节", "搏击俱乐部", "暗月马戏团", "时空漫游"},
	},
	Promotion = {
		name = "促销",
		category = {"暴雪商城", "暴雪嘉年华", "典藏版", "魔兽世界: 经典怀旧服", "魔兽世界周年庆典坐骑", "炉石传说", "魔兽争霸III: 重制版", "战友招募", "艾泽拉斯机车", "集换式卡牌", "时空漫游: 奥特兰克山谷"},
	},
	Other = {
		name = "其他",
		category = {"公会商人", "黑市拍卖行", "坐骑收集", "声望崇拜", "玩具", "传家宝"}
	},
	Unobtainable = {
		name = "绝版",
		category = {"复活卷轴", "挑战模式", "战友招募", "引领潮流", "搏击俱乐部", "竞技场坐骑 | 燃烧的远征 - 德拉诺之王", "竞技场坐骑 | 军团再临 - 暗影国度", "艾泽拉斯机车", "旧版史诗坐骑", "旧版促销坐骑", "绝版团本坐骑", "美酒节"}
	}
}
core.mountList = {
	SL = {
		name = "暗影国度",
		Achievement = {
			name = "成就",
			mounts = {186654, 186637, 184183, 182596, 186653, 184166, 186655, 182717, 187525},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {180748},
			mountID = {}
		},
		Treasures = {
			name = "宝藏",
			mounts = {180731, 180772},
			mountID = {}
		},
		Adventures = {
			name = "冒险",
			mounts = {183052, 183617, 183615, 183618},
			mountID = {}
		},
		Riddles = {
			name = "谜题",
			mounts = {184168,186713},
			mountID = {}
		},
		Tormentors = {
			name = "折磨者",
			mounts = {185973},
			mountID = {}
		},
		MawAssaults = {
			name = "噬渊突袭",
			mounts = {185996, 186000, 186103},
			mountID = {}
		},
		Reputation = {
			name = "声望",
			mounts = {180729, 182082, 183518, 183740, 186647, 186648},
			mountID = {}
		},
		ParagonReputation = {
			name = "巅峰声望",
			mounts = {182081, 183800, 186649, 186644, 186657, 186641},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {181819, 186638},
			mountID = {1445}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {186656, 186642},
			mountID = {}
		},
		Zone = {
			name = "区域",
			mounts = {181818},
			mountID = {}
		},
		DailyActivities = {
			name = "日常活动",
			mounts = {182614, 182589, 186643, 186651, 186646},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {180728, 180727, 180725, 182650, 180773, 182085, 184062, 182084, 182079, 180582, 183741, 184167, 187183, 186652 ,186645, 186659},
			mountID = {}
		},
		OozingNecrorayEgg = {
			name = "渗出粘液的通灵鳐之卵",
			mounts = {184160, 184161, 184162},
			mountID = {}
		},
		CovenantFeature = {
			name = "盟约特色",
			mounts = {180726, 181316, 181300, 181317},
			mountID = {}
		},
		NightFae = {
			name = "法夜",
			mounts = {180263, 180721, 183053, 180722, 180413, 180415, 180414, 180723, 183801, 180724, 180730, 186493, 186494, 186495, 186492},
			mountID = {}
		},
		Kyrian = {
			name = "格里恩",
			mounts = {180761, 180762, 180763, 180764, 180765, 180766, 180767, 180768, 186482, 186485, 186480, 186483},
			mountID = {}
		},
		Necrolords = {
			name = "通灵领主",
			mounts = {182078, 182077, 181822, 182076, 182075, 181821, 181815, 182074, 181820, 182080, 186487, 186488, 186490, 186489},
			mountID = {}
		},
		Venthyr = {
			name = "温西尔",
			mounts = {182954, 180581, 180948, 183715, 180945, 182209, 182332, 183798, 180461, 186476, 186478, 186477, 186479},
			mountID = {}				
		}
	},
	BFA = {
		name = "争霸艾泽拉斯",
		Achievement = {
			name = "成就",
			mounts = {168056, 168055, 169162, 163577, 169194, 168329, 161215, 163216, 166539, 167171, 174861, 174654, 174836},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {163183, 166442, 166443, 163589, 169203, 169202, 174770},
			mountID = {}
		},
		Quest = {
			name = "任务",
			mounts = {159146, 168827, 168408, 169199, 174859, 174771, 169200, 170069},
			mountID = {}
		},
		Medals = {
			name = "服役勋章",
			mounts = {166464, 166436, 166469, 166465, 166463},
			mountID = {}
		},
		AlliedRaces = {
			name = "同盟种族",
			mounts = {155662, 156487, 161330, 157870, 174066, 156486, 155656, 161331, 164762, 174067},
			mountID = {}
		},
		Reputation = {
			name = "声望",
			mounts = {161773, 161774, 161665, 161666, 161667, 161664, 167167, 167170, 168829, 174754, 161911, 161912, 161910, 161879, 161909, 161908},
			mountID = {}
		},
		Riddle = {
			name = "谜题",
			mounts = {156798},
			mountID = {}
		},
		Tinkering = {
			name = "制作",
			mounts = {167751},
			mountID = {}
		},
		Zone = {
			name = "区域",
			mounts = {163576, 163574, 163575, 163573},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {161479, 166433, 169201, 168370, 168823, 169163, 174860},
			mountID = {}
		},
		WorldBoss = {
			name = "世界首领",
			mounts = {174842},
			mountID = {}
		},
		WarfrontArathi = {
			name = "战争前线: 阿拉希",
			mounts = {163579, 163578, 163644, 163645, 163706, 163646},
			mountID = {}
		},
		WarfrontDarkshore = {
			name = "战争前线: 黑海岸",
			mounts = {166438, 166434, 166435, 166432},
			mountID = {}
		},
		AssaultVale = {
			name = "突袭: 锦绣谷",
			mounts = {173887, 174752, 174841, 174840, 174649},
			mountID = {}
		},
		AssaultUldum = {
			name = "突袭: 奥丹姆",
			mounts = {174769, 174641, 174753},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {159921, 160829, 159842, 168826, 168830},
			mountID = {}
		},	
		RaidDrop = {
			name = "团本掉落",
			mounts = {166518, 166705, 174872},
			mountID = {}
		},	
		IslandExpedition = {
			name = "海岛探险",
			mounts = {163584, 163585, 163583, 163586, 163582, 166470, 166468, 166467, 166466},
			mountID = {}
		},	
		Dubloons = {
			name = "海员达布隆币",
			mounts = {166471, 166745},
			mountID = {}
		},
		Visions = {
			name = "惊魂幻象",
			mounts = {174653},
			mountID = {}
		},
		ParagonReputation = {
			name = "巅峰声望",
			mounts = {169198},
			mountID = {}
		},
		PreLaunchEvent = {
			name = "前夕事件",
			mounts = {163127, 163128},
			mountID = {}
		}
	},
	Legion = {
		name = "军团再临",
		Achievement = {
			name = "成就",
			mounts = {141216, 138387, 141217, 143864, 152815, 153041, 129280},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {138811, 141713, 137570},
			mountID = {}
		},
		Quest = {
			name = "任务",
			mounts = {137573, 142436, 137577, 137578, 137579, 137580},
			mountID = {}
		},
		Riddle = {
			name = "谜题",
			mounts = {138201, 147835, 151623},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {138258, 152814, 152844, 152842, 152840, 152841, 152843, 152904, 152905, 152903, 152790},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {142236, 142552},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {137574, 143643, 152816, 137575, 152789},
			mountID = {}
		},
		Class = {
			name = "职业",
			mounts = {142231, 143502, 143503, 143505, 143504, 143493, 143492, 143490, 143491, 142225, 142232, 143489, 142227, 142228, 142226, 142233, 143637},
			mountID = {868, 860, 861, 898}
		},
		ParagonReputation = {
			name = "巅峰声望",
			mounts = {147806, 147804, 147807, 147805, 143764, 153042, 153044, 153043},
			mountID = {}
		},
		Reputation = {
			name = "声望",
			mounts = {152788, 152797, 152793, 152795, 152794, 152796, 152791},
			mountID = {}
		}																											
	},
	WOD = {
		name = "德拉诺之王",
		Achievement = {
			name = "成就",
			mounts = {116670, 116383, 127140, 128706},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {116664, 116785, 116776, 116775, 116772, 116672, 116768, 116671, 128480, 128526, 123974, 116667, 116655},
			mountID = {}
		},
		Garrison = {
			name = "要塞入侵",
			mounts = {116779, 116673, 116786, 116663},
			mountID = {}
		},
		Missions = {
			name = "派遣任务",
			mounts = {116769, 128311},
			mountID = {}
		},
		Stables = {
			name = "兽栏",
			mounts = {116784, 116662, 116676, 116675, 116774, 116656, 116668, 116781},
			mountID = {}
		},
		TradingPost = {
			name = "货栈",
			mounts = {116782, 116665},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {116674, 116659, 116661, 116792, 116767, 116773, 116794, 121815, 116780, 116669, 116658},
			mountID = {}
		},
		WorldBoss = {
			name = "世界首领",
			mounts = {116771},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {116660, 123890},
			mountID = {}
		},
		FishingShack = {
			name = "钓鱼小屋",
			mounts = {87791},
			mountID = {}
		}				
	},
	MOP = {
		name = "熊猫人之谜",
		Achievement = {
			name = "成就",
			mounts = {87769, 87773, 81559, 93662, 104208, 89785},
			mountID = {}
		},
		GoldenLotus = {
			name = "金莲教",
			mounts = {87781, 87782, 87783},
			mountID = {}
		},
		CloudSerpent = {
			name = "云端翔龙骑士团",
			mounts = {85430, 85429, 79802},
			mountID = {}
		},
		ShadoPan = {
			name = "影踪派",
			mounts = {89305, 89306, 89307},
			mountID = {}
		},
		KunLai = {
			name = "昆莱山商人",
			mounts = {87788, 87789, 84101},
			mountID = {}
		},
		TheTillers = {
			name = "阡陌客",
			mounts = {89362, 89390, 89391},
			mountID = {}
		},
		PrimalEggs = {
			name = "原始恐龙蛋",
			mounts = {94291, 94292, 94293},
			mountID = {}
		},
		Quest = {
			name = "任务",
			mounts = {93386, 87768, 94290, 93385},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {87777, 93666, 95059, 104253},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {90655, 94229, 94230, 94231, 104269},
			mountID = {}
		},
		WorldBoss = {
			name = "世界首领",
			mounts = {94228, 87771, 89783, 95057},
			mountID = {}
		},
		Reputation = {
			name = "声望",
			mounts = {93169, 95565, 81354, 89304, 85262, 89363, 87774, 93168, 95564},
			mountID = {}
		}																																	
	},
	CATA = {
		name = "大地的裂变",
		Achievement = {
			name = "成就",
			mounts = {62900, 62901, 69213, 69230, 77068},
			mountID = {}
		},
		Quest = {
			name = "任务",
			mounts = {54465},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {65356, 64999, 63044, 63045, 64998},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {69747, 63040, 63043, 68823, 68824},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {77067, 77069, 78919, 63041, 69224, 71665},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {67151, 63042, 63046},
			mountID = {}
		}												
	},
	WOTLK = {
		name = "巫妖王之怒",
		Achievement = {
			name = "成就",
			mounts = {44160, 45801, 45802, 51954, 51955},
			mountID = {}
		},
		Quest = {
			name = "任务",
			mounts = {43962, 52200},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {44690, 44231, 44234, 44226, 44689, 44230, 44235, 44225},
			mountID = {}
		},
		ArgentTournament = {
			name = "银色锦标赛",
			mounts = {46814, 45592, 45593, 45595, 45596, 45597, 46743, 46746, 46749, 46750, 46751, 46816, 47180, 45725, 45125, 45586, 45589, 45590, 45591, 46744, 46745, 46747, 46748, 46752, 46815, 46813},
			mountID = {}
		},
		Reputation = {
			name = "声望",
			mounts = {44080, 44086, 43955, 44707, 43958, 43961},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {43951, 44151},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {43952, 43953, 43954, 43986, 49636, 43959, 45693, 50818, 44083},
			mountID = {}
		},
		RareSpawn = {
			name = "稀有刷新",
			mounts = {44168},
			mountID = {}
		}																					
	},
	TBC = {
		name = "燃烧的远征",
		CenarionExpedition = {
			name = "塞纳里奥远征队",
			mounts = {33999},
			mountID = {}
		},
		Kurenai = {
			name = "库雷尼/玛格汉",
			mounts = {29227, 29231, 29229, 29230, 31830, 31832, 31834, 31836},
			mountID = {}
		},
		Netherwing = {
			name = "灵翼之龙",
			mounts = {32858, 32859, 32857, 32860, 32861, 32862},
			mountID = {}
		},
		Shatari = {
			name = "沙塔尔天空卫队",
			mounts = {32319, 32314, 32316, 32317, 32318},
			mountID = {}
		},
		Vendor = {
			name = "商人",
			mounts = {25473, 25527, 25528, 25529, 25470, 25471, 25472, 25477, 25531, 25532, 25533, 25474, 25475, 25476},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {32768, 35513},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {32458, 30480},
			mountID = {}
		}
	},
	Classic = {
		name = "经典",
		Reputation = {
			name = "声望",
			mounts = {13086, 46102},
			mountID = {}
		},
		DungeonDrop = {
			name = "地下城掉落",
			mounts = {13335},
			mountID = {}
		},
		RaidDrop = {
			name = "团本掉落",
			mounts = {21218, 21321, 21323, 21324},
			mountID = {}
		}						
	},
	Alliance = {
		name = "联盟",
		Human = {
			name = "人类",
			mounts = {18776, 18777, 18778, 5655, 2411, 2414, 5656},
			mountID = {}
		},
		NightElf = {
			name = "暗夜精灵",
			mounts = {18766, 18767, 18902, 8629, 8631, 8632, 47100},
			mountID = {}
		},
		Dwarf = {
			name = "矮人",
			mounts = {18785, 18786, 18787, 5864, 5872, 5873},
			mountID = {}
		},
		Gnome = {
			name = "侏儒",
			mounts = {18772, 18773, 18774, 8563, 8595, 13322, 13321},
			mountID = {}
		},
		Draenei = {
			name = "德莱尼",
			mounts = {29745, 29746, 29747, 28481, 29743, 29744},
			mountID = {}
		},
		Worgen = {
			name = "狼人",
			mounts = {73839, 73838},
			mountID = {}
		},
		Pandaren = {
			name = "熊猫人",
			mounts = {91010, 91012, 91011, 91013, 91014, 91015, 91004, 91008, 91009, 91005, 91006, 91007},
			mountID = {}
		},														
	},
	Horde = {
		name = "部落",
		Orc = {
			name = "兽人",
			mounts = {18796, 18798, 18797, 46099, 5668, 5665, 1132},
			mountID = {}
		},
		Undead = {
			name = "亡灵",
			mounts = {13334, 18791, 13331, 13332, 13333, 46308, 47101},
			mountID = {}
		},
		Tauren = {
			name = "牛头人",
			mounts = {18793, 18794, 18795, 15277, 15290, 46100},
			mountID = {}
		},
		Troll = {
			name = "巨魔",
			mounts = {18788, 18789, 18790, 8588, 8591, 8592},
			mountID = {}
		},
		Bloodelf = {
			name = "血精灵",
			mounts = {28936, 29223, 29224, 28927, 29220, 29221, 29222},
			mountID = {}
		},
		Goblin = {
			name = "地精",
			mounts = {62462, 62461},
			mountID = {}
		},			
		Pandaren = {
			name = "熊猫人",
			mounts = {91010, 91012, 91011, 91013, 91014, 91015, 91004, 91008, 91009, 91005, 91006, 91007},
			mountID = {}
		},	
	},
	Professions = {
		name = "专业",
		Alchemy = {
			name = "炼金术",
			mounts = {65891},
			mountID = {}
		},
		Archeology = {
			name = "考古学",
			mounts = {60954, 64883, 131734},
			mountID = {}
		},
		Engineering = {
			name = "工程学",
			mounts = {34060, 41508, 34061, 44413, 87250, 87251, 95416, 161134, 153594},
			mountID = {}
		},
		Fishing = {
			name = "钓鱼",
			mounts = {46109, 23720, 152912, 163131},
			mountID = {}
		},
		Jewelcrafting = {
			name = "珠宝加工",
			mounts = {83088, 83087, 83090, 83089, 82453},
			mountID = {}
		},
		Tailoring = {
			name = "裁缝",
			mounts = {44554, 54797, 44558, 115363},
			mountID = {}
		},
		Leatherworking = {
			name = "制皮",
			mounts = {108883, 129962},
			mountID = {}
		},
		Blacksmith = {
			name = "锻造",
			mounts = {137686},
			mountID = {}
		}
	},
	PVP = {
		name = "PVP",
		Achievement = {
			name = "成就",
			mounts = {44223, 44224},
			mountID = {}
		},
		MarkHonor = {
			name = "荣耀印记",
			mounts = {19030, 29465, 29467, 29468, 29471, 35906, 43956, 29466, 29469, 29470, 29472, 19029, 34129, 44077},
			mountID = {}
		},
		Honor = {
			name = "荣誉",
			mounts = {140228, 140233, 140408, 140232, 140230, 140407, 164250},
			mountID = {}
		},
		ViciousSaddle = {
			name = "邪气鞍座",
			mounts = { 102533, 70910, 116778, 124540, 140348, 140354, 143649, 142235, 142437, 152869, 163124, 165020, 163121, 173713, 184013, 186179, 70909, 102514, 116777, 124089, 140353, 140350, 143648, 142234, 142237, 152870, 163123, 163122, 173714, 186178					
			},
			mountID = {}
		},
		Gladiator = {
			name = "角斗士",
			mounts = {186177},
			mountID = {}
		},
		Halaa = {
			name = "哈兰",
			mounts = {28915, 29228},
			mountID = {}
		},
		TimelessIsle = {
			name = "永恒岛",
			mounts = {103638},
			mountID = {}
		},
		TalonsVengeance = {
			name = "复仇之爪",
			mounts = {142369},
			mountID = {}
		}
	},
	WorldEvents = {
		name = "世界事件",
		Achievement = {
			name = "成就",
			mounts = {44177},
			mountID = {}
		},
		Brewfest = {
			name = "美酒节",
			mounts = {33977, 37828},
			mountID = {}
		},
		HallowsEnd = {
			name = "万圣节",
			mounts = {37012},
			mountID = {}
		},
		LoveAir = {
			name = "情人节",
			mounts = {72146, 50250},
			mountID = {}
		},
		NobleGarden = {
			name = "复活节",
			mounts = {72145},
			mountID = {}
		},
		WinterVeil = {
			name = "冬幕节",
			mounts = {128671},
			mountID = {}
		},
		Brawlers = {
			name = "搏击俱乐部",
			mounts = {98405, 142403, 166724},
			mountID = {}
		},
		DarkmoonFaire = {
			name = "暗月马戏团",
			mounts = {72140, 73766, 142398, 153485},
			mountID = {}
		},
		TimeWalking = {
			name = "时空漫游",
			mounts = {129923, 129922, 87775, 167894, 167895, 133543, 188674, 187595},
			mountID = {}
		}
	},
	Promotion = {
		name = "促销",
		AnnualPass = {
			name = "全年订阅",
			mounts = {76755},
			mountID = {}
		},
		BlizzardStore = {
			name = "暴雪商城",
			mounts = {54811, 69846, 78924, 95341, 97989, 107951, 112326, 122469, 147901, 156564, 160589, 166775, 166774, 166776},
			mountID = {1266, 1267, 1290, 1346, 1291, 1456, 1330}
		},
		Blizzcon = {
			name = "暴雪嘉年华",
			mounts = {43599, 151618},
			mountID = {1458}
		},
		CollectorsEdition = {
			name = "典藏版",
			mounts = {85870, 109013, 128425, 153539, 153540},
			mountID = {1289}
		},
		WowClassic = {
			name = "魔兽世界: 经典怀旧服",
			mounts = {},
			mountID = {1444}
		},
		anniversary = {
			name = "魔兽世界周年庆典坐骑",
			mounts = {115484, 172022, 172012, 172023, 186469},
			mountID = {1424}
		},
		Hearthstone = {
			name = "炉石传说",
			mounts = {98618},
			mountID = {1513}
		},
		WarcraftIII = {
			name = "魔兽争霸III: 重制版",
			mounts = {164571},
			mountID = {}
		},
		RAF = {
			name = "战友招募",
			mounts = {173297, 173299},
			mountID = {}
		},
		ScrollOfResurrection = {
			name = "复活卷轴",
			mounts = {76902},
			mountID = {}
		},
		AzerothChoppers = {
			name = "艾泽拉斯机车",
			mounts = {116789},
			mountID = {}
		},
		TCG = {
			name = "集换式卡牌",
			mounts = {49283, 49284, 49285, 49286, 49282, 49290, 54069, 54068, 68008, 69228, 68825, 71718, 72582, 72575, 79771, 93671},
			mountID = {}
		},
		AV = {
			name = "时空漫游: 奥特兰克山谷",
			mounts = {172023, 172022},
			mountID = {}
		}		
	},
	Other = {
		name = "其他",
		GuildVendor = {
			name = "公会商人",
			mounts = {63125, 62298, 85666, 116666},
			mountID = {}
		},
		BMAH = {
			name = "黑市拍卖行",
			mounts = {19872, 19902, 44175, 163042},
			mountID = {}
		},
		MountCollection = {
			name = "坐骑收集",
			mounts = {44178, 44843, 44842, 98104, 91802, 98259, 69226, 87776, 137614, 163981, 118676},
			mountID = {}
		},
		ExaltedReputations = {
			name = "声望崇拜",
			mounts = {163982},
			mountID = {}
		},
		Toy = {
			name = "玩具",
			mounts = {140500},
			mountID = {}
		},
		Heirlooms = {
			name = "传家宝",
			mounts = {120968, 122703},
			mountID = {}
		},
		GuildVendor = {
			name = "公会商人",
			mounts = {63125, 62298, 67107, 85666, 116666},
			mountID = {}
		}
	},
	Unobtainable = {
		name = "绝版",
		ScrollOfResurrection = {
			name = "复活卷轴",
			mounts = {76902, 76889},
			mountID = {}
		},
		ChallengeMode = {
			name = "挑战模式",
			mounts = {89154, 90710, 90711, 90712, 116791},
			mountID = {}
		},
		RAF = {
			name = "战友招募",
			mounts = {83086, 106246, 118515, 37719},
			mountID = {}
		},
		AOTC = {
			name = "引领潮流",
			mounts = {104246, 128422, 152901, 174862},
			mountID = {}
		},
		Brawl = {
			name = "搏击俱乐部",
			mounts = {142403, 98405},
			mountID = {}
		},
		Arena = {
			name = "竞技场坐骑 | 燃烧的远征 - 德拉诺之王",
			mounts = {30609, 34092, 37676, 43516, 46708, 46171, 47840, 50435, 71339, 71954, 85785, 95041, 104325, 104326, 104327, 128277, 128281, 128282},
			mountID = {}
		},
		Arena2 = {
			name = "竞技场坐骑 | 军团再临 - 暗影国度",
			mounts = {141843, 141844, 141845, 141846, 141847, 141848, 153493, 156879, 156880, 156881, 156884, 183937},
			mountID = {}
		},
		DCAzerothChopper = {
			name = "艾泽拉斯机车",
			mounts = {116788},
			mountID = {}
		},
		OriginalEpic = {
			name = "旧版史诗坐骑",
			mounts = {13328, 13329, 13327, 13326, 12354, 12353, 12302, 12303, 12351, 12330, 15292, 15293, 13317, 8586},
			mountID = {}
		},
		Promotion = {
			name = "旧版促销坐骑",
			mounts = {76755, 95341, 112327, 92724, 143631, 163128, 163127},
			mountID = {}
		},
		RaidMounts = {
			name = "绝版团本坐骑",
			mounts = {49098, 49096, 49046, 49044, 44164, 33809, 21176},
			mountID = {937}
		},
		BrewFest = {
			name = "美酒节",
			mounts = {33976},
			mountID = {}
		}
	}
}