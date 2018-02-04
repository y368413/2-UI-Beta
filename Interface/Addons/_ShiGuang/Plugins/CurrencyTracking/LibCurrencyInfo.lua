--[[
Name: LibCurrencyInfo
Revision: $Rev: 10 $
Maintainers: Arith
Website: https://www.wowace.com/projects/libcurrencyinfo
Dependencies: None
License: MIT

This library provide the ability to get currency's corresponding category, 
get currency category's localized name, and get currency's description if available. 
It will also returtn the info for those you can get from GetCurrencyInfo, that way 
you only need to call one function to get everything you want.

Sample of function calls:
////////////////////////////////////////////////////
local lib = LibStub:GetLibrary("LibCurrencyInfo")

local name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity, categoryID, categoryName, currencyDesc = lib:GetCurrencyByID(currencyID)

local currencyPerCategory = {}
currencyPerCategory = lib:GetCurrencyByCategoryID(categoryID)

]]
-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local pairs, type = _G.pairs, _G.type
-- Libraries
local tonumber, error = _G.tonumber, _G.error
local GetCurrencyInfo, GetLocale = _G.GetCurrencyInfo, _G.GetLocale
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local LibStub = _G.LibStub

local MAJOR_VERSION = "LibCurrencyInfo"
local MINOR_VERSION = 90000 + tonumber(("$Rev: 2$"):match("%d+"))

local lib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local LANGS = {
	["enUS"] = true,
	["zhCN"] = true,
	["zhTW"] = true,
}

local data = {}
lib.data = data

data.CurrencyByCategory = {
	[1] = { -- Miscellaneous
--		1, -- Currency Token Test Token 4
--		2, -- Currency Token Test Token 2
--		4, -- Currency Token Test Token 5
--		42, -- Badge of Justice
		81, -- Epicurean's Award
		402, -- Ironpaw Token
		515, -- Darkmoon Prize Ticket
		1379, -- Trial of Style Token
	},
	[2] = { -- Player vs. Player
--		103, -- Arena Points
--		104, -- Honor Points DEPRECATED
--		121, -- Alterac Valley Mark of Honor
--		122, -- Arathi Basin Mark of Honor
--		123, -- Eye of the Storm Mark of Honor
--		124, -- Strand of the Ancients Mark of Honor
--		125, -- Warsong Gulch Mark of Honor
--		126, -- Wintergrasp Mark of Honor
--		161, -- Stone Keeper's Shard
--		181, -- Honor Points DEPRECATED2
--		201, -- Venture Coin
--		321, -- Isle of Conquest Mark of Honor
		391, -- Tol Barad Commendation
	},
	[21] = { -- Wrath of the Lich King
		61, -- Dalaran Jewelcrafter's Token
		241, -- Champion's Seal
	},
	[22] = { -- Dungeon and Raid
--		101, -- Emblem of Heroism
--		102, -- Emblem of Valor
--		221, -- Emblem of Conquest
--		301, -- Emblem of Triumph
--		341, -- Emblem of Frost
		1166, -- Timewarped Badge
		1191, -- Valor
	},
--	[41] = { -- Test
--		22, -- Birmingham Test Item 3
--	},
	[81] = { -- Cataclysm
		361, -- Illustrious Jewelcrafter's Token
		416, -- Mark of the World Tree
		614, -- Mote of Darkness
		615, -- Essence of Corrupted Deathwing
	},
	[82] = { -- Archaeology
		384, -- Dwarf Archaeology Fragment
		385, -- Troll Archaeology Fragment
		393, -- Fossil Archaeology Fragment
		394, -- Night Elf Archaeology Fragment
		397, -- Orc Archaeology Fragment
		398, -- Draenei Archaeology Fragment
		399, -- Vrykul Archaeology Fragment
		400, -- Nerubian Archaeology Fragment
		401, -- Tol'vir Archaeology Fragment
		676, -- Pandaren Archaeology Fragment
		677, -- Mogu Archaeology Fragment
		754, -- Mantid Archaeology Fragment
		821, -- Draenor Clans Archaeology Fragment
		828, -- Ogre Archaeology Fragment
		829, -- Arakkoa Archaeology Fragment
--		830, -- n/a
		1172, -- Highborne Archaeology Fragment
		1173, -- Highmountain Tauren Archaeology Fragment
		1174, -- Demonic Archaeology Fragment
	},
--	[89] = { -- Meta
--		483, -- Conquest Arena Meta
--		484, -- Conquest Rated BG Meta
--		692, -- Conquest Random BG Meta
--	},
	[133] = { -- Mists of Pandaria
		697, -- Elder Charm of Good Fortune
		698, -- Zen Jewelcrafter's Token
		738, -- Lesser Charm of Good Fortune
		752, -- Mogu Rune of Fate
		776, -- Warforged Seal
		777, -- Timeless Coin
		789, -- Bloody Coin
		810, -- Black Iron Fragment
	},
	[137] = { -- Warlords of Draenor
		823, -- Apexis Crystal
		824, -- Garrison Resources
--		897, -- UNUSED
		910, -- Secret of Draenor Alchemy
		944, -- Artifact Fragment
		980, -- Dingy Iron Coins
		994, -- Seal of Tempered Fate
		999, -- Secret of Draenor Tailoring
		1008, -- Secret of Draenor Jewelcrafting
		1017, -- Secret of Draenor Leatherworking
		1020, -- Secret of Draenor Blacksmithing
		1101, -- Oil
		1129, -- Seal of Inevitable Fate
	},
	[141] = { -- Legion
		1149, -- Sightless Eye
		1154, -- Shadowy Coins
		1155, -- Ancient Mana
		1220, -- Order Resources
		1226, -- Nethershard
		1268, -- Timeworn Artifact
		1273, -- Seal of Broken Fate
		1275, -- Curious Coin
		1299, -- Brawler's Gold
		1314, -- Lingering Soul Fragment
		1342, -- Legionfall War Supplies
		1355, -- Felessence
		1356, -- Echoes of Battle
		1357, -- Echoes of Domination
		1416, -- Coins of Air
		1501, -- Writhing Essence
		1506, -- Argus Waystone
		1508, -- Veiled Argunite
		1533, -- Wakening Essence
	},
	[142] = { -- Hidden
--		395, -- Justice Points
--		396, -- Valor Points
		1171, -- Artifact Knowledge
		1324, -- Horde Qiraji Commendation
		1325, -- Alliance Qiraji Commendation
--		1347, -- Legionfall Building - Personal Tracker - Mage Tower (Hidden)
--		1349, -- Legionfall Building - Personal Tracker - Command Tower (Hidden)
--		1350, -- Legionfall Building - Personal Tracker - Nether Tower (Hidden)
	},
}

data.CurrencyCategories = {
	[1] = { enUS="Miscellaneous",zhCN="其它",zhTW="雜項" },
	[2] = { enUS="Player vs. Player",zhCN="PvP",zhTW="玩家對玩家" },
	[4] = { enUS="Classic",zhCN="经典旧世",zhTW="艾澤拉斯", hide=true, },
	[21] = { enUS="Wrath of the Lich King",zhCN="巫妖王之怒",zhTW="巫妖王之怒" },
	[22] = { enUS="Dungeon and Raid",zhCN="地下城与团队",zhTW="地城與團隊" },
	[23] = { enUS="Burning Crusade",zhCN="燃烧的远征",zhTW="燃燒的遠征", hide=true, },
	[81] = { enUS="Cataclysm",zhCN="大地的裂变",zhTW="浩劫與重生" },
	[82] = { enUS="Archaeology",zhCN="考古学",zhTW="考古學" },
	[133] = { enUS="Mists of Pandaria",zhCN="熊猫人之谜",zhTW="潘達利亞之謎" },
	[137] = { enUS="Warlords of Draenor",zhCN="德拉诺之王",zhTW="德拉諾之霸" },
	[141] = { enUS="Legion",zhCN="军团再临",zhTW="軍團" },
	[142] = { enUS="Hidden",zhCN="隐藏",zhTW="隱藏" },
}

data.Currencies = {
	[1] = { id=1, category=1, hide=true }, -- Currency Token Test Token 4, Miscellaneous
	[2] = { id=2, category=1, hide=true }, -- Currency Token Test Token 2, Miscellaneous
	[4] = { id=4, category=1, hide=true }, -- Currency Token Test Token 5, Miscellaneous
	[22] = { id=22, category=41, hide=true }, -- Birmingham Test Item 3, Test
	[42] = { id=42, category=1, hide=true }, -- Badge of Justice, Miscellaneous
	[61] = { id=61, category=21 }, -- Dalaran Jewelcrafter's Token, Wrath of the Lich King
	[81] = { id=81, category=1 }, -- Epicurean's Award, Miscellaneous
	[101] = { id=101, category=22, hide=true }, -- Emblem of Heroism, Dungeon and Raid
	[102] = { id=102, category=22, hide=true }, -- Emblem of Valor, Dungeon and Raid
	[103] = { id=103, category=2, hide=true }, -- Arena Points, Player vs. Player
	[104] = { id=104, category=2, hide=true }, -- Honor Points DEPRECATED, Player vs. Player
	[121] = { id=121, category=2, hide=true }, -- Alterac Valley Mark of Honor, Player vs. Player
	[122] = { id=122, category=2, hide=true }, -- Arathi Basin Mark of Honor, Player vs. Player
	[123] = { id=123, category=2, hide=true }, -- Eye of the Storm Mark of Honor, Player vs. Player
	[124] = { id=124, category=2, hide=true }, -- Strand of the Ancients Mark of Honor, Player vs. Player
	[125] = { id=125, category=2, hide=true }, -- Warsong Gulch Mark of Honor, Player vs. Player
	[126] = { id=126, category=2, hide=true }, -- Wintergrasp Mark of Honor, Player vs. Player
	[161] = { id=161, category=2, hide=true }, -- Stone Keeper's Shard, Player vs. Player
	[181] = { id=181, category=2, hide=true }, -- Honor Points DEPRECATED2, Player vs. Player
	[201] = { id=201, category=2, hide=true }, -- Venture Coin, Player vs. Player
	[221] = { id=221, category=22, hide=true }, -- Emblem of Conquest, Dungeon and Raid
	[241] = { id=241, category=21 }, -- Champion's Seal, Wrath of the Lich King
	[301] = { id=301, category=22, hide=true }, -- Emblem of Triumph, Dungeon and Raid
	[321] = { id=321, category=2, hide=true }, -- Isle of Conquest Mark of Honor, Player vs. Player
	[341] = { id=341, category=22, hide=true }, -- Emblem of Frost, Dungeon and Raid
	[361] = { id=361, category=81 }, -- Illustrious Jewelcrafter's Token, Cataclysm
	[384] = { id=384, category=82 }, -- Dwarf Archaeology Fragment, Archaeology
	[385] = { id=385, category=82 }, -- Troll Archaeology Fragment, Archaeology
	[391] = { id=391, category=2 }, -- Tol Barad Commendation, Player vs. Player
	[393] = { id=393, category=82 }, -- Fossil Archaeology Fragment, Archaeology
	[394] = { id=394, category=82 }, -- Night Elf Archaeology Fragment, Archaeology
	[395] = { id=395, category=142, hide=true }, -- Justice Points, Hidden
	[396] = { id=396, category=142, hide=true }, -- Valor Points, Hidden
	[397] = { id=397, category=82 }, -- Orc Archaeology Fragment, Archaeology
	[398] = { id=398, category=82 }, -- Draenei Archaeology Fragment, Archaeology
	[399] = { id=399, category=82 }, -- Vrykul Archaeology Fragment, Archaeology
	[400] = { id=400, category=82 }, -- Nerubian Archaeology Fragment, Archaeology
	[401] = { id=401, category=82 }, -- Tol'vir Archaeology Fragment, Archaeology
	[402] = { id=402, category=1 }, -- Ironpaw Token, Miscellaneous
	[416] = { id=416, category=81 }, -- Mark of the World Tree, Cataclysm
	[483] = { id=483, category=89, hide=true }, -- Conquest Arena Meta, Meta
	[484] = { id=484, category=89, hide=true }, -- Conquest Rated BG Meta, Meta
	[515] = { id=515, category=1 }, -- Darkmoon Prize Ticket, Miscellaneous
	[614] = { id=614, category=81 }, -- Mote of Darkness, Cataclysm
	[615] = { id=615, category=81 }, -- Essence of Corrupted Deathwing, Cataclysm
	[676] = { id=676, category=82 }, -- Pandaren Archaeology Fragment, Archaeology
	[677] = { id=677, category=82 }, -- Mogu Archaeology Fragment, Archaeology
	[692] = { id=692, category=89, hide=true }, -- Conquest Random BG Meta, Meta
	[697] = { id=697, category=133 }, -- Elder Charm of Good Fortune, Mists of Pandaria
	[698] = { id=698, category=133 }, -- Zen Jewelcrafter's Token, Mists of Pandaria
	[738] = { id=738, category=133 }, -- Lesser Charm of Good Fortune, Mists of Pandaria
	[752] = { id=752, category=133 }, -- Mogu Rune of Fate, Mists of Pandaria
	[754] = { id=754, category=82 }, -- Mantid Archaeology Fragment, Archaeology
	[776] = { id=776, category=133 }, -- Warforged Seal, Mists of Pandaria
	[777] = { id=777, category=133 }, -- Timeless Coin, Mists of Pandaria
	[789] = { id=789, category=133 }, -- Bloody Coin, Mists of Pandaria
	[810] = { id=810, category=133 }, -- Black Iron Fragment, Mists of Pandaria
	[821] = { id=821, category=82 }, -- Draenor Clans Archaeology Fragment, Archaeology
	[823] = { id=823, category=137 }, -- Apexis Crystal, Warlords of Draenor
	[824] = { id=824, category=137 }, -- Garrison Resources, Warlords of Draenor
	[828] = { id=828, category=82 }, -- Ogre Archaeology Fragment, Archaeology
	[829] = { id=829, category=82 }, -- Arakkoa Archaeology Fragment, Archaeology
	[830] = { id=830, category=82, hide=true }, -- n/a, Archaeology
	[897] = { id=897, category=137, hide=true }, -- UNUSED, Warlords of Draenor
	[910] = { id=910, category=137 }, -- Secret of Draenor Alchemy, Warlords of Draenor
	[944] = { id=944, category=137 }, -- Artifact Fragment, Warlords of Draenor
	[980] = { id=980, category=137 }, -- Dingy Iron Coins, Warlords of Draenor
	[994] = { id=994, category=137 }, -- Seal of Tempered Fate, Warlords of Draenor
	[999] = { id=999, category=137 }, -- Secret of Draenor Tailoring, Warlords of Draenor
	[1008] = { id=1008, category=137 }, -- Secret of Draenor Jewelcrafting, Warlords of Draenor
	[1017] = { id=1017, category=137 }, -- Secret of Draenor Leatherworking, Warlords of Draenor
	[1020] = { id=1020, category=137 }, -- Secret of Draenor Blacksmithing, Warlords of Draenor
	[1101] = { id=1101, category=137 }, -- Oil, Warlords of Draenor
	[1129] = { id=1129, category=137 }, -- Seal of Inevitable Fate, Warlords of Draenor
	[1149] = { id=1149, category=141 }, -- Sightless Eye, Legion
	[1154] = { id=1154, category=141 }, -- Shadowy Coins, Legion
	[1155] = { id=1155, category=141 }, -- Ancient Mana, Legion
	[1166] = { id=1166, category=22 }, -- Timewarped Badge, Dungeon and Raid
	[1171] = { id=1171, category=142 }, -- Artifact Knowledge, Hidden
	[1172] = { id=1172, category=82 }, -- Highborne Archaeology Fragment, Archaeology
	[1173] = { id=1173, category=82 }, -- Highmountain Tauren Archaeology Fragment, Archaeology
	[1174] = { id=1174, category=82 }, -- Demonic Archaeology Fragment, Archaeology
	[1191] = { id=1191, category=22 }, -- Valor, Dungeon and Raid
	[1220] = { id=1220, category=141 }, -- Order Resources, Legion
	[1226] = { id=1226, category=141 }, -- Nethershard, Legion
	[1268] = { id=1268, category=141 }, -- Timeworn Artifact, Legion
	[1273] = { id=1273, category=141 }, -- Seal of Broken Fate, Legion
	[1275] = { id=1275, category=141 }, -- Curious Coin, Legion
	[1299] = { id=1299, category=141 }, -- Brawler's Gold, Legion
	[1314] = { id=1314, category=141 }, -- Lingering Soul Fragment, Legion
	[1324] = { id=1324, category=142 }, -- Horde Qiraji Commendation, Hidden
	[1325] = { id=1325, category=142 }, -- Alliance Qiraji Commendation, Hidden
	[1342] = { id=1342, category=141 }, -- Legionfall War Supplies, Legion
	[1347] = { id=1347, category=142, hide=true }, -- Legionfall Building - Personal Tracker - Mage Tower (Hidden), Hidden
	[1349] = { id=1349, category=142, hide=true }, -- Legionfall Building - Personal Tracker - Command Tower (Hidden), Hidden
	[1350] = { id=1350, category=142, hide=true }, -- Legionfall Building - Personal Tracker - Nether Tower (Hidden), Hidden
	[1355] = { id=1355, category=141 }, -- Felessence, Legion
	[1356] = { id=1356, category=141 }, -- Echoes of Battle, Legion
	[1357] = { id=1357, category=141 }, -- Echoes of Domination, Legion
	[1379] = { id=1379, category=1 }, -- Trial of Style Token, Miscellaneous
	[1416] = { id=1416, category=141 }, -- Coins of Air, Legion
	[1501] = { id=1501, category=141 }, -- Writhing Essence, Legion
	[1506] = { id=1506, category=141 }, -- Argus Waystone, Legion
	[1508] = { id=1508, category=141 }, -- Veiled Argunite, Legion
	[1533] = { id=1533, category=141 }, -- Wakening Essence, Legion
}

data.CurrencyDesc = {
	[1] = { hide=true, enUS="Text that describes this item can be found here.", zhCN="Text that describes this item can be found here.", zhTW="本物品之敘述在此" },
	[61] = { enUS="Tiffany Cartier's shop in Dalaran will gladly accept these tokens for unique jewelcrafting recipes.", zhCN="达拉然的蒂凡妮·卡蒂亚会欣然接受这些代币，并用稀有的珠宝加工图鉴来交换。", zhTW="蒂芬妮·卡地亞位於達拉然的商店相當願意用獨特的珠寶設計圖來交換這些徽章。" },
	[81] = { enUS="Visit special cooking vendors in Dalaran and the capital cities to to purchase unusual cooking recipes, spices, and even a fine hat!", zhCN="造访达拉然与各个主城的烹饪供应商，购买罕见的烹饪配方、香料以及大厨的帽子！", zhTW="拜訪達拉然與主城中的特殊烹飪供應商來購買特殊烹飪食譜及香料，甚至是一頂不錯的帽子!" },
	[104] = { hide=true, enUS="If you can read this, you've found a bug. REPORT IT!", zhCN="能读到这行字就说明你遇到了一个bug，赶紧的报bug。", zhTW="如果你讀到這個，就是發現了BUG!回報它!" },
	[181] = { hide=true, enUS="If you can read this, you've found a bug. REPORT IT!", zhCN="能读到这行字就说明你遇到了一个bug，赶紧的报bug。", zhTW="如果你讀到這個，就是發現了BUG!回報它!" },
	[241] = { enUS="Awarded for valiant acts in the Crusader's Coliseum.", zhCN="表彰你在十字军演武场中展示的武勇。", zhTW="為表彰你在十字軍大競技場的驍士行為。" },
	[361] = { enUS="Awarded for demonstrating great skill in jewelcrafting, these tokens can be used to purchase unique jewelcrafting plans and the fabulous Chimera's Eye.", zhCN="授予技艺最精湛的珠宝名匠，这些奖章可以用来兑换稀有的珠宝加工图鉴和奇美拉之眼。", zhTW="為表彰你在珠寶設計領域的卓越技巧，可以用這些徽章來換取獨特的珠寶設計圖和品質極佳的奇美拉之瞳。" },
	[391] = { enUS="Awarded for brave deeds performed on Tol Barad.", zhCN="奖励你在托尔巴拉德的英勇战绩。", zhTW="為表彰你在托巴拉德的英勇行徑。" },
	[395] = { hide=true, enUS="Used to purchase less-powerful armor and weapons.", zhCN="可用来购买较为强大的护甲和武器。", zhTW="用來購買次強的護甲與武器。" },
	[396] = { hide=true, enUS="Used to purchase powerful PvE armor and weapons.", zhCN="可用来购买非常强大的PVE护甲和武器。", zhTW="用來購買較強的PvE護甲與武器。" },
	[402] = { enUS="Represents your credit with the Ironpaw family of cooks. Can be redeemed for Cooking ingredients and other things at the Stockmaster in Halfhill Market.", zhCN="代表你受到了烹饪世家——铁掌家族的嘉许。可在半山市集的库房管理员处兑换烹饪配料和其它物品。", zhTW="鐵爪家族的徽章是你最棒的烹飪獎勵，可在半丘市集裡與庫存大師兌換烹飪材料和其他的東西。" },
	[416] = { enUS="Granted by the Guardians of Hyjal. Can be used to purchase reinforcements for the Invasion of the Firelands.", zhCN="由海加尔守护者授予。可以用来购买进攻火焰之地的补给。", zhTW="由海加爾守護者所授予。用來購買進軍火源之界所需之補給品。" },
	[515] = { enUS="Awarded for winning games or doing favors at the Darkmoon Faire.", zhCN="在暗月马戏团的游戏中获胜或完成工作人员交付的任务后获得。", zhTW="為表彰你在暗月馬戲團贏得遊戲或幫助他人的行為。" },
	[614] = { enUS="Extracted from the forces of Deathwing, this dark energy can be used to power amazing magics.",zhCN="由死亡之翼的灭世之力凝聚而成，其中蕴含的黑暗能量可以强化威力骇人的魔法。", zhTW="從死亡之翼的能量中萃取而出，這種黑暗的能量可用來作為強大且神奇魔法的能量來源。" },
	[615] = { enUS="Extracted from Deathwing himself, this dark energy powers the most fearsome of incantations.", zhCN="从死亡之翼的身躯中抽离而出的黑暗能量，用以催动最为恐怖的咒术。", zhTW="從死亡之翼本身中萃取而出，這種黑暗的能量是用來作為最可怕咒語的能量來源。" },
	[697] = { enUS="Possession of the Elder Charm of Good Fortune allows its lucky owner to risk a coin to receive a bonus reward from Mogu'shan Vaults, Heart of Fear, Terrace of Endless Spring, Sha of Anger, or Salyis' Warband.", zhCN="长者好运符的拥有者在战胜魔古山宝库、恐惧之心、永春台中的首领，以及怒之煞或萨莱斯的兵团后有机会使用一枚硬币来赢取额外的奖励。", zhTW="持有長者的好運符咒便有機會用一枚硬幣從魔古山寶庫、恐懼之心、豐泉台、憤怒之煞或沙利斯的劫掠兵團獲得額外獎勵。" },
	[698] = { enUS="Awarded for demonstrating great skill in jewelcrafting, these tokens can be used to purchase unique jewelcrafting plans and the beautiful Serpent's Eye.", zhCN="授予技艺最精湛的珠宝名匠，这些奖章可以用来兑换稀有的珠宝加工图鉴和美丽的蛟眼石。", zhTW="為表彰你在珠寶設計領域的卓越技巧，可以用這些徽章來換取獨特的珠寶設計圖和品質極佳的蛟龍之瞳。" },
	[738] = { enUS="Possession of the Lesser Charms of Good Fortune will result in great happiness and the eventual conversion into Warforged Seals, which allow players to risk a coin to receive a bonus reward from raid encounters.",zhCN="携带次级好运护符能带来好运，并能最终兑换战火徽记，使玩家在赢得团队副本战斗后有机会使用一枚硬币来赢取额外的奖励。", zhTW="持有次級好運符咒的人能獲得莫大的幸福，這些符咒最終會轉變成戰鑄徽印，讓持有人能在團隊戰鬥裡獲得額外獎勵。" },
	[752] = { enUS="Possession of the Mogu Rune of Fate allows its lucky owner to risk a rune to receive a bonus reward from the Throne of Thunder, Nalak or Oondasta.", zhCN="魔古命运符文的拥有者也许能在战胜雷电王座中的首领后，以及在战胜纳拉克或乌达斯塔后获得额外的战利品奖励。", zhTW="持有魔古的命運符文便有機會用一枚符文從雷霆王座、納拉卡或烏達斯塔獲得額外獎勵。" },
	[776] = { enUS="Possession of the Warforged Seal allows its lucky owner to risk a seal to receive a bonus reward from the Siege of Orgrimmar, the Celestial Trials, and Ordos.", zhCN="拥有战火徽记的幸运儿有机会在决战奥格瑞玛、天神试炼和斡耳朵圣殿中用一枚徽记换取一份额外奖励。", zhTW="持有戰鑄徽印便有機會用一枚徽印從圍攻奧格瑪、天尊試煉和歐朵斯的戰鬥獲得額外獎勵。" },
	[777] = { enUS="You feel the shadowy fingers of previous and future owners of this coin playing across your hand, as if time itself blurs. Spend upon the Timeless Isle to earn powerful and fluid rewards.", zhCN="你在恍惚中感觉到这枚铸币过去与未来的拥有者的手指拂过你的掌心，仿佛时间的界限被模糊了。你可以用它在永恒岛上换取强大且多样性的奖励。", zhTW="彷彿時光重疊般，你感覺到有陰影般的指尖撫過你的手掌，那是這枚硬幣過往與將來的持有者的朦朧印象。在永恆之島上，可以用這些硬幣獲得強大而多樣的獎勵。" },
	[789] = { enUS="Pulled from the steaming corpses of foes vanquished in the mists of the Timeless Isle.", deDE="Erbeutet von den noch warmen Leichen besiegter Gegner in den Nebeln der Zeitlosen Insel.", zhCN="从死于永恒岛周围迷雾中的敌人身上摸来的铸币。", zhTW="在永恆之島的迷霧中，從你擊敗的敵人還熱氣騰騰的屍體上扯下來的。" },
	[810] = { enUS="Scavenged from the shattered armor and weapons of Iron Horde invaders.", zhCN="从钢铁部落入侵者碎裂的护甲和武器中翻检出的金属碎片。", zhTW="從鋼鐵部落的入侵者身上取得的護甲及武器碎塊。" },
	[823] = { enUS="The enduring legacy of a lost civilization, Apexis crystals contain untold reserves of magical power.", zhCN="作为一个失落文明的古老遗产，埃匹希斯水晶蕴藏着难以想象的强大魔力。", zhTW="頂尖水晶是失落古文明遺留下來的遺產，裡面儲存了難以言喻的魔法能量。" },
	[824] = { enUS="Earn resources to build-up and expand your garrison.", zhCN="赚取资源以建造和扩大你的要塞。", zhTW="建造和擴展你要塞的資源。" },
	[910] = { enUS="Allows you to obtain new Alchemy recipes from the Alchemist's Lab.", zhCN="让你可通过炼金实验室获得新的炼金配方。", zhTW="讓你從鍊金實驗室取得新的鍊金術配方。" },
	[944] = { enUS="A tiny fragment of an Ashran lost artifact, treasured by the Highmaul Ogres.", zhCN="一块阿什兰失落神器的小碎片，被悬槌食人魔视为珍宝。", zhTW="天槌巨魔把這些艾斯蘭失落文物的小碎片當成寶貝。" },
	[980] = { enUS="Perhaps they're more valuable than they appear on the surface.", zhCN="或许它们比表面上看起来的要珍贵得多。", zhTW="雖然看起來髒髒的，不過說不定相當有價值。" },
	[994] = { enUS="Twists fate to provide an opportunity for additional treasure in Highmaul or Blackrock Foundry raids.", zhCN="扭曲命运，可给你一次在悬槌堡或黑石铸造厂团队副本获得额外宝物的机会。", zhTW="在天槌或黑石鑄造場團隊副本中，可用來扭轉命運，有機會獲得額外的寶藏。" },
	[999] = { enUS="Allows you to obtain Tailoring recipes from the Tailoring Emporium.", zhCN="可让你从裁缝店获得新的裁缝配方。", zhTW="讓你從裁縫百貨取得裁縫圖樣。" },
	[1008] = { enUS="Allows you to obtain new Jewelcrafting recipes.", zhCN="可让你获得新的珠宝加工配方。", zhTW="讓你取得新的珠寶學設計圖。" },
	[1017] = { enUS="Allows you to obtain Leatherworking recipes from the Tannery.", zhCN="可让你从制革厂获得新的制皮配方。", zhTW="讓你從製皮廠取得製皮圖樣。" },
	[1020] = { enUS="Allows you to obtain new Blacksmithing recipes.", zhCN="可让你获得新的锻造配方。", zhTW="讓你取得新的鍛造設計圖。" },
	[1101] = { enUS="Found primarily in Tanaan Jungle, Oil is used to fuel naval missions.", zhCN="主要产于塔纳安丛林的原油，可以作为海军行动的燃油。", zhTW="油料是執行海上任務的必要資源，主要可從塔南森林尋獲。" },
	[1129] = { enUS="Twists fate to provide an opportunity for additional treasure in Hellfire Citadel or Draenor Mythic Dungeons.", zhCN="扭转命运，可给你一次在地狱火堡垒或德拉诺史诗地下城获得额外宝物的机会。", zhTW="在地獄火堡壘或德拉諾傳奇難度的地城中，可用來扭轉命運，有機會獲得額外的寶藏。" },
	[1149] = { enUS="A rough, hand-minted coin. It bears a symbol similar to that of the Kirin Tor, with one key difference: the eye is closed.", zhCN="一枚粗糙的手工硬币，上面有一个类似肯瑞托的徽记，但有一个最大的不同点：那个眼睛是闭着的。", zhTW="手工打造的粗糙硬幣。上面的圖案和祈倫托的符號很像，但關鍵的差異在於：它的眼睛是閉起來的。" },
	[1154] = { enUS="Prized by pickpockets and marks alike. Can be spent in the Underbelly below Dalaran.", zhCN="在扒手以及类似阶层中广受欢迎。可以在达拉然的下水道中使用。", zhTW="扒手小偷和刺客之間流通的硬幣。可在達拉然底下的城底區使用。" },
	[1155] = { enUS="Concentrated magic from the ancient leylines beneath Suramar.", zhCN="来自苏拉玛地下古代魔网的浓缩魔力。", zhTW="從蘇拉瑪爾地下的古老地脈聚集而來的魔法能量。" },
	[1166] = { enUS="Earned in Timewalking dungeons. Exchanged for goods from Timewalking Vendors in capitol cities.", zhCN="在时空漫游地下城中获得，可以在主城的时空漫游商人处换取货物。", zhTW="在時光漫遊地城獲得。用來在主城向時光漫遊商人購買商品。" },
	[1171] = { enUS="Increases the rate at which you earn Artifact Power.", zhCN="提高你获得神器能量的速度。", zhTW="提高你獲得神兵之力的速率。" },
	[1191] = { enUS="A currency used to increase the power of items from Hellfire Citadel, Tanaan Jungle, Draenor Dungeons, and powerful crafted items.", zhCN="用于强化来自地狱火堡垒、塔纳安丛林、德拉诺地下城以及强大的制造物品能力的货币。", zhTW="用來強化從地獄火堡壘、塔南森林、德拉諾地城獲得的物品，以及強力手工物品的通貨。" },
	[1220] = { enUS="Used to recruit troops, run missions, and research upgrades for your order hall.", zhCN="用来招募部队，执行任务和研究职业大厅的升级选项。", zhTW="可以用來招募部隊、執行任務和升級職業大廳。" },
	[1226] = { enUS="A fragment of crystallized nether brought to Azeroth by the Legion.", zhCN="虚空的结晶碎片，由燃烧军团带到艾泽拉斯。", zhTW="虛空能量晶化而成的碎片，由燃燒軍團帶來到艾澤拉斯。" },
	[1268] = { enUS="A mysterious naga artifact from the depths of the Great Sea. King Mrgl-Mrgl is looking for these at Timeworn Strand.", zhCN="一件来自无尽之海深处的神秘纳迦神器。国王姆嘎姆嘎正在上古海滩寻找这种东西。", zhTW="從無盡之海深處尋得的神秘納迦文物。莫戈莫戈大王正在時朽海灘尋找這類物品。" },
	[1273] = { enUS="Twists fate to provide an opportunity for additional treasure from Legion raid and Mythic dungeon bosses.", zhCN="扭转命运，可给你一次在《军团再临》团队副本和史诗地下城的首领处获得额外宝物的机会。", zhTW="從軍團團隊和傳奇難度地城首領取得，可用來扭轉命運，有機會獲得額外的寶藏。" },
	[1275] = { enUS="This unusual coin is warm to the touch and vibrates gently in your hand. Used to procure items from Xur'ios in Dalaran.", zhCN="这种特别的货币摸上去热乎乎的，并在你手中轻轻震动着。可以用来向达拉然的苏伊奥斯购买物品。", zhTW="這枚奇特的硬幣觸手生溫，還會在你的掌中微微顫動。可用來和達拉然的瑟里歐斯換取物品。" },
	[1299] = { enUS="Awarded to victors of the Brawler's Guild. Use it to purchase Rumble Cards and other world-altering items at the Brawler's Gold Exchange vendor.", zhCN="搏击俱乐部的获胜者得到的奖励。可以用它在拳手金币兑换商处购买乱斗卡牌和其他能够改变世界的物品。", zhTW="鬥陣俱樂部勝利者的獎勵。可用來向鬥陣金幣交易商人購買格鬥卡以及其他物品。" },
	[1314] = { enUS="Soul fragment once belonging to a powerful enemy.", zhCN="曾属于某个强大敌人的灵魂残片。", zhTW="這枚靈魂碎片曾屬於一名強大的敵人。" },
	[1324] = { 
		enUS="Completing this quest will grant the Horde credit in the Call of the Scarab event. The faction which earns the most credit today may hang their banners by the Scarab Gong for the rest of the year.", zhCN="完成此任务可增加部落在甲虫的召唤活动中的积分。活动中积分最高的阵营可以将自己的旗帜挂在甲虫之锣旁，直到年末。", zhTW="完成此任務可為部落爭取甲蟲的呼喚的積分。今天獲得最多積分的陣營可以在今年接下來的日子裡，於甲蟲之鑼旁高掛陣營旗幟。" 
	},
	[1325] = { 
		enUS="Completing this quest will grant the Alliance credit in the Call of the Scarab event. The faction which earns the most credit today may hang their banners by the Scarab Gong for the rest of the year.", zhCN="完成此任务可增加联盟在甲虫的召唤活动中的积分。活动中积分最高的阵营可以将自己的旗帜挂在甲虫之锣旁，直到年末。", zhTW="今天獲得最多獎勵的陣營可以在今年接下來的日子裡，於甲蟲之鑼旁高掛陣營旗幟。完成此任務可為聯盟爭取甲蟲的呼喚事件的積分。" 
	},
	[1342] = { enUS="Used to further the construction of valuable structures on the Broken Shore.", zhCN="用于强化破碎海滩上的珍贵建筑。", zhTW="可以用來在破碎海岸建造重要的建築物。" },
	[1355] = { enUS="Concentrated demonic essence which can be captured and used to create armor of great power.", zhCN="浓缩的恶魔精华，可收集并用于制造强大的护甲。", zhTW="濃縮惡魔精華，可以用來製造強大的護甲。" },
	[1356] = { enUS="Used to purchase powerful PvP armor. At the end of the season, this currency converts to gold.", zhCN="用于购买强大的PvP护甲。赛季结束时，此货币会转换为金币。", zhTW="用來購買強大的PvP護甲。賽季結束時，這種通貨會轉換成金幣。" },
	[1357] = { enUS="Used to purchase elite PvP armor. At the end of the season, this currency converts to gold.", zhCN="用于购买精锐PvP护甲。赛季结束时，此货币会转换为金币。", zhTW="用來購買精英PvP護甲。賽季結束時，這種通貨會轉換成金幣。" },
	[1379] = { enUS="Earned by participating in the Trial of Style. Can be exchanged for transmoggable gear in Dalaran.", zhCN="通过参与时尚试炼获得。可以在达拉然兑换可幻化的装备。", zhTW="參加時尚大考驗獲得的獎品。可用來在達拉然換取可塑形的裝備。" },
	[1416] = { enUS="Evaporate into mist after a while.", zhCN="旋即蒸发，化为迷雾。", zhTW="過一陣子會化為霧氣消散。" },
	[1501] = { enUS="Used to upgrade Legion Legendary items to item level 970.", zhCN="用于将《军团再临》传说物品的物品等级提升至970。", zhTW="將軍團傳說級裝備的物品等級提高至970所需的物品。" },
	[1506] = { enUS="Used by the minions of Sargeras to force open portals from Argus to other Legion-controlled worlds.", zhCN="萨格拉斯的仆从用它来强行打开从阿古斯前往其他被军团控制的世界的传送门。", zhTW="由薩格拉斯的手下用來從阿古斯強制開啟傳送門前往其他由燃燒軍團控制的世界。" },
	[1508] = { 
		enUS="This dull-colored crystal is highly valued by ethereal traders, especially Thaumaturge Vashreen aboard the Vindicaar.", 
		zhCN="这种没有光泽的水晶是虚灵商人眼中的极品，对维迪卡尔上的魔术师瓦西里恩来说更是如此。", 
		zhTW="這種顏色黯淡的水晶對以太族商人來說奇貨可居，尤其是梵迪卡爾上的奇術師瓦須林。" 
	},
	[1533] = {
		enUS="Used by Arcanomancer Vridiel in Dalaran above the Broken Isles to create or upgrade Legion Legendary items.",
		zhCN="供破碎群岛上方的达拉然的奥法工匠维迪尔使用，他可以制造或升级《军团再临》传说物品。",
		zhTW="Used by Arcanomancer Vridiel in Dalaran above the Broken Isles to create or upgrade Legion Legendary items."
	},
}

local function CheckLang(lang)
	if not lang then return end
	if (LANGS[lang]) then return true end
end

--[[ /////////////////////////////////////////
-- lib:GetCurrencyByID(currencyID, lang)
-- Returns:
    name 
        String - the name of the currency, localized to the language
    amount 
        Number - Current amount of the currency at index
    texture 
        Number - The textureID of the currency's icon. 
    earnedThisWeek 
        Number - The amount of the currency earned this week
    weeklyMax 
        Number - Maximum amount of currency possible to be earned this week
    totalMax 
        Number - Total maximum currency possible to stockpile
    isDiscovered 
        Boolean - Whether the character has ever got some of this currency
    rarity 
        Integer - Rarity indicator for this currency 
    categoryID
        Number  - The currency's corresponding categoryID
    categoryName
        String  - The currency's corresponding category name
    currencyDesc
        String  - The currency's description
-- /////////////////////////////////////////]]
function lib:GetCurrencyByID(currencyID, lang)
	if not currencyID or type(currencyID) ~= "number" then return end

	local name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity, categoryID, categoryName, currencyDesc

	if (lang) then
		if ( not CheckLang(lang) ) then
			error(format("The specified language \"%s\" is invalid or not available", lang))
			return nil
		end
	else
		lang = GetLocale()
	end

	name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity = GetCurrencyInfo(currencyID)
	if not name then return end
	
	categoryID = lib.data.Currencies[currencyID].category
	categoryName = lib.data.CurrencyCategories[categoryID] and lib.data.CurrencyCategories[categoryID][lang] or nil
	currencyDesc = lib.data.CurrencyDesc[currencyID] and lib.data.CurrencyDesc[currencyID][lang] or nil
	
	return name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity, categoryID, categoryName, currencyDesc
end

function lib:GetCurrencyByCategoryID(categoryID)
	if not categoryID or type(categoryID) ~= "number" then return end
	
	if lib.data.CurrencyByCategory[categoryID] then return lib.data.CurrencyByCategory[categoryID] end
end

function lib:GetCurrencyTokenStrings(currencyID, lang)
	if not currencyID or type(currencyID) ~= "number" then return end

	local name, count, _, _, _, totalMax, _, _, _, _, currencyDesc = lib:GetCurrencyByID(currencyID, lang)
	if not name then return end
	if not count then count = 0 end

	local str = HIGHLIGHT_FONT_COLOR_CODE..name
	if currencyDesc then str = str.."\n"..NORMAL_FONT_COLOR_CODE..currencyDesc end
	if (totalMax and totalMax > 0) then
		str = str.."\n\n"..NORMAL_FONT_COLOR_CODE..format(CURRENCY_TOTAL_CAP, HIGHLIGHT_FONT_COLOR_CODE, count, totalMax)
	else
		str = str.."\n\n"..NORMAL_FONT_COLOR_CODE..format(CURRENCY_TOTAL, HIGHLIGHT_FONT_COLOR_CODE, count)
	end
	
	return str
end
