local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("AurasTable")

-- 角标的相关法术 [spellID] = {anchor, {r, g, b}}
R.CornerBuffs = {
	["PRIEST"] = {
		[194384] = {"TOPRIGHT", {1, 1, .66}},			-- 救赎
		[214206] = {"TOPRIGHT", {1, 1, .66}},			-- 救赎(PvP)
		[41635]  = {"BOTTOMRIGHT", {.2, .7, .2}},		-- 愈合导言
		[193065] = {"BOTTOMRIGHT", {.54, .21, .78}},	-- 忍辱负重
		[139]    = {"TOPLEFT", {.4, .7, .2}},			-- 恢复
		[17]     = {"TOPLEFT", {.7, .7, .7}},			-- 真言术盾
		[47788]  = {"LEFT", {.86, .45, 0}, true},		-- 守护之魂
		[33206]  = {"LEFT", {.47, .35, .74}, true},		-- 痛苦压制
		[6788]  = {"TOP", {.86, .11, .11}, true},		-- 虚弱灵魂
	},
	["DRUID"] = {
		[774]    = {"TOPRIGHT", {.8, .4, .8}},			-- 回春
		[155777] = {"RIGHT", {.8, .4, .8}},				-- 萌芽
		[8936]   = {"BOTTOMLEFT", {.2, .8, .2}},		-- 愈合
		[33763]  = {"TOPLEFT", {.4, .8, .2}},			-- 生命绽放
		[48438]  = {"BOTTOMRIGHT", {.8, .4, 0}},		-- 野性成长
		[207386] = {"TOP", {.4, .2, .8}},				-- 春暖花开
		[102351] = {"LEFT", {.2, .8, .8}},				-- 结界
		[102352] = {"LEFT", {.2, .8, .8}},				-- 结界(HoT)
		[200389] = {"BOTTOM", {1, 1, .4}},				-- 栽培
	},
	["PALADIN"] = {
		[287280]  = {"TOPLEFT", {1, .8, 0}},			-- 圣光闪烁
		[53563]  = {"TOPRIGHT", {.7, .3, .7}},			-- 道标
		[156910] = {"TOPRIGHT", {.7, .3, .7}},			-- 信仰道标
		[200025] = {"TOPRIGHT", {.7, .3, .7}},			-- 美德道标
		[1022]   = {"BOTTOMRIGHT", {.2, .2, 1}, true},	-- 保护
		[1044]   = {"BOTTOMRIGHT", {.89, .45, 0}, true},-- 自由
		[6940]   = {"BOTTOMRIGHT", {.89, .1, .1}, true},-- 牺牲
		[223306] = {"BOTTOMLEFT", {.7, .7, .3}},		-- 赋予信仰
		[25771]  = {"TOP", {.86, .11, .11}, true},		-- 自律
	},
	["SHAMAN"] = {
		[61295]  = {"TOPRIGHT", {.2, .8, .8}},			-- 激流
		[974]    = {"BOTTOMRIGHT", {1, .8, 0}},			-- 大地之盾
		[207400] = {"BOTTOMLEFT", {.6, .8, 1}},			-- 先祖活力
	},
	["MONK"] = {
		[119611] = {"TOPLEFT", {.3, .8, .6}},			-- 复苏之雾
		[116849] = {"TOPRIGHT", {.2, .8, .2}, true},	-- 作茧缚命
		[124682] = {"BOTTOMLEFT", {.8, .8, .25}},		-- 氤氲之雾
		[191840] = {"BOTTOMRIGHT", {.27, .62, .7}},		-- 精华之泉
	},
	["ROGUE"] = {
		[57934]  = {"BOTTOMRIGHT", {.9, .1, .1}},		-- 嫁祸
	},
	["WARRIOR"] = {
		[114030] = {"TOPLEFT", {.2, .2, 1}},			-- 警戒
	},
	["HUNTER"] = {
		[34477]  = {"BOTTOMRIGHT", {.9, .1, .1}},		-- 误导
		[90361]  = {"TOPLEFT", {.4, .8, .2}},			-- 灵魂治愈
	},
	["WARLOCK"] = {
		[20707]  = {"BOTTOMRIGHT", {.8, .4, .8}},		-- 灵魂石
	},
	["DEMONHUNTER"] = {},
	["MAGE"] = {},
	["DEATHKNIGHT"] = {},
}

-- 小队框体的技能监控CD [spellID] = duration in seconds
R.PartysSpells = {
	[57994]  = 12,	-- 风剪
	[1766]   = 15,	-- 脚踢
	[6552]   = 15,	-- 拳击
	[47528]  = 15,	-- 心灵冰冻
	[96231]  = 15,	-- 责难
	[106839] = 15,	-- 迎头痛击
	[116705] = 15,	-- 切喉手
	[183752] = 15,	-- 瓦解
	[187707] = 15,	-- 压制
	[2139]   = 24,	-- 法术反制
	[147362] = 24,	-- 反制射击
	[15487]  = 45,	-- 沉默
	[78675]  = 60,	-- 日光术

	[8143]	 = 60,	-- 战栗图腾
	[102342] = 60,	-- 铁木树皮
	[102793] = 60,	-- 乌索尔旋风
	[119381] = 60,	-- 扫堂腿
	[179057] = 60,	-- 混乱新星
	[205636] = 60,	-- 树人
	[31224]  = 120,	-- 暗影斗篷
	[25046]  = 120,	-- 奥术洪流
	[28730]  = 120,
	[50613]  = 120,
	[69179]  = 120,
	[80483]  = 120,
	[129597] = 120,
	[155145] = 120,
	[202719] = 120,
	[232633] = 120,
	[47482] = 30,  --interrupt", spec = { 252 }, default = true }, -- Leap & Shambling Rush (91807)
	[47481] = 30,  --type = "cc", spec = { 252 } }, -- Gnaw (91800) & Monstrous Blow (91797)
    --["DEATHKNIGHT"] = { -- 250(Blood), 251(Frost), 252(Unholy)
        --[47528] = 15,  --type = "interrupt", default = true }, -- Mind Freeze
        --[47482] = 30,  --type = "
        --[47481] = 90,  --type = "cc", spec = { 252 } }, -- Gnaw (91800) & Monstrous Blow (91797)
        [108194] = 45,  --type = "cc", spec = true }, -- Asphyxiate
        [221562] = 45,  --type = "cc", spec = { 250 } }, -- Asphyxiate (B)
        [47476] = 60,  --type = "cc", spec = true }, -- Strangulate
        [207167] = 60,  --type = "cc", spec = true }, -- Blinding Sleet
        --[49576] = { default = 25, [250] = 15 },  type = "cc" }, -- Death Grip
        [108199] = 120,  --type = "cc", spec = {250} }, -- Gorefiend's Grasp
        [287250] = 45,  --type = "cc", spec = true, parent = 196770 }, -- Dead of Winter (talentID)
        [48707] = 60,  --type = "defensive", default = true }, -- Anti-Magic Shell
        [51052] = 120,  --type = "defensive", spec = true, default = true }, -- Anti-Magic Zone
        [48792] = 180,  --type = "defensive", default = true }, -- Icebound Fortitude
        [49028] = 120,  --type = "defensive", spec = { 250 } }, -- Dancing Rune Weapon
        [274156] = 45,  --type = "defensive", spec = true }, -- Consumption
        [219809] = 60,  --type = "defensive", spec = true }, -- Tombstone
        [194844] = 60,  --type = "defensive", spec = true }, -- Bonestorm
        [55233] = 90,  --type = "defensive", spec = { 250 } }, -- Vampiric Blood
        [287081] = 60,  --type = "defensive", spec = true, default = true, parent = 48792 }, -- Lichborne
        [48743] = 120,  --type = "defensive", spec = true }, -- Death Pact
        [114556] = 240,  --type = "defensive", spec = true }, -- Purgatory (dummy spell)
        [51271] = 45,  --type = "offensive", spec = { 251 } }, -- Pillar of Frost
        [279302] = 180,  --type = "offensive", spec = true }, -- Frostwyrm's Fury
        [152279] = 120,  --type = "offensive", spec = true }, -- Breath of Sindragosa
        [130736] = 45,  --type = "offensive", spec = true }, -- Soul Reaper
        [207289] = 75,  --type = "offensive", spec = true }, -- Unholy Frenzy
        [275699] = 90,  --type = "offensive", spec = { 252 } }, -- Apocalypse
        [47568] = 120,  --type = "offensive", spec = { 251 } }, -- Empower Rune Weapon
        [49206] = 180,  --type = "offensive", spec = true }, -- Summon Gargolye
        [63560] = 60,  --type = "offensive", spec = { 252 } }, -- Dark Transformation
        [42650] = 480,  --type = "offensive", spec = { 252 } }, -- Army of the Dead
        [288853] = 90,  --type = "offensive", spec = true, parent = 42650 }, -- Raise Abomination
        [196770] = 20,  --type = "others", spec = { 251 } }, -- Remorseless Winter
        [48265] = 45,  --type = "others" }, -- Death's Advance
        [212552] = 60,  --type = "others", spec = true }, -- Wraith Walk
        [77606] = 20,  --type = "others", spec = true }, -- Dark Simulacrum
    --},
    --["DEMONHUNTER"] = { -- 577(Havoc), 581(Vengeance)
        --[183752] = 15,  --type = "interrupt", default = true }, -- Disrupt
        [217832] = 45,  --type = "cc" }, -- Imprison
        [221527] = 60,  --type = "cc", spec = 205596, parent = 217832 }, -- Detainment
        --[179057] = 60,  --type = "cc", spec = { 577 } }, -- Chaos Nova
        [205630] = 60,  --type = "cc", spec = true }, -- Illidan's Grasp
        [211881] = 30,  --type = "cc", spec = true }, -- Fel Eruption
        [207684] = 90,  --type = "cc", spec = { 581 } }, -- Sigil of Misery
        [202137] = 60,  --type = "cc", spec = { 581 } }, -- Sigil of Silence
        [202138] = 90,  --type = "cc", spec = true }, -- Sigil of Chains
        [196555] = 120,  --type = "immunity", spec = true, default = true }, -- Netherwalk
        [209258] = 480,  --type = "defensive", spec = true }, -- Last Resort (dummy spell)
        [198589] = 60,  --type = "defensive", spec = { 577 }, default = true }, -- Blur
        [196718] = 180,  --type = "defensive", spec = { 577 } }, -- Darkness
        [227635] = 180,  --type = "defensive", spec = true, parent = 196718, default = true }, -- Cover of Darkness (talentID)
        [206803] = 60,  --type = "defensive", spec = true }, -- Rain from Above
        [204021] = 60,  --type = "defensive", spec = { 581 } }, -- Fiery Brand
        [187827] = 180,  --type = "defensive", spec = { 581 } }, -- Metamorphosis (V)
        [200166] = 240,  --type = "offensive", spec = { 577 } }, -- Metamorphosis
        [206491] = 120,  --type = "offensive", spec = true }, -- Nemesis
        [258925] = 60,  --type = "offensive", spec = true }, -- Fel Barrage
        [203704] = 60,  --type = "offensive", spec = true }, -- Mana Break
        [206649] = 45,  --type = "offensive", spec = true }, -- Eye of Leotheras
        [205604] = 60,  --type = "others", spec = true, default = true }, -- Reverse Magic
        [205629] = 20,  --type = "others", spec = true, charges = 2 }, -- Demonic Trample
    --},
    --["DRUID"] = { -- 102(Bal), 103(Feral), 104(Guardian), 105(Resto)
        --[106839] = 15,  --type = "interrupt", spec = { 103, 104 }, default = true }, -- Skull Bash
        --[78675] = 60,  --type = "interrupt", spec = { 102 }, default = true }, -- Solar Beam
        --[88423] = 8,   type = "interrupt", spec = { 105 }, default = true }, -- Nature's Cure
        [5211] = 50,  --type = "cc", spec = true }, -- Mighty Bash
        [202246] = 25,  --type = "cc", spec = true }, -- Overrun
        --[99,     duration = 30,  type = "cc", spec = { 104 } }, -- Incapacitating Roar
        [102359] = 30,  --type = "cc", spec = true }, -- Mass Entanglement
        [132469] = 30,  --type = "cc", spec = true }, -- Typhoon
        --[102793] = 60,  --type = "cc", spec = { 105 } }, -- Ursol's Vortex
        --[102793] = 60,  --type = "cc", spec = true }, -- Ursol's Vortex (G)
        --[22812] = { default = 60, [104] = 90 },  type = "defensive", spec = { 102, 104, 105 }, default = true }, -- Barkskin
        --[102342] = 60,  --type = "defensive", spec = { 105 }, default = true }, -- Ironbark
        --[61336] = { default = 120, [104] = 240 },  type = "defensive", spec = { 103, 104 }, charges = 2, default = true }, -- Survival Instincts
        [108238] = 90,  --type = "defensive", spec = true, default = true }, -- Renewal
        [209749] = 30,  --type = "defensive", spec = true }, -- Faerie Swarm
        [305497] = 45,  --type = "defensive", spec = true }, -- Thorns
        [201664] = 30,  --type = "defensive", spec = true }, -- Demoralizing Roar
        [22842] = 34,  --type = "defensive", spec = 197491 }, -- Frenzied Regeneration (R, B)
        [22842] = 34,  --type = "defensive", spec = 217615 }, -- Frenzied Regeneration (F)
        [22842] = 34,  --type = "defensive", spec = { 104 }, charges = 2 }, -- Frenzied Regeneration (G)
        [740] = 180,  --type = "offensive", spec = { 105 } }, -- Tranquility
        [203651] = 45,  --type = "offensive", spec = true }, -- Overgrowth
        [106951] = 180,  --type = "offensive", spec = { 103 } }, -- Berserk
        [194223] = 180,  --type = "offensive", spec = { 102 } }, -- Celestial Alignment
        [102543] = 180,  --type = "offensive", spec = true, parent = 106951 }, -- Incarnation: King of the Jungle
        [102560] = 180,  --type = "offensive", spec = true, parent = 194223 }, -- Incarnation: Chosen of Elune
        [33891] = 180,  --type = "offensive", spec = true, default = true }, -- Incarnation: Tree of Life
        [102558] = 180,  --type = "offensive", spec = true }, -- Incarnation: Guardian of Ursoc
        [5217] = 30,  --type = "offensive", spec = { 103 } }, -- Tiger's Fury
        [202425] = 45,  --type = "offensive", spec = true }, -- Warrior of Elune
        [202770] = 60,  --type = "offensive", spec = true }, -- Fury of Elune
        --[77761] = { default = 120, [104] = 60 },  type = "others", spec = { 103, 104 } }, -- Stampeding Roar (merged into 1)
        [1850] = 120,  --type = "others" }, -- Dash
        [252216] = 45,  --type = "others", spec = true, parent = 1850 }, -- Tiger's Dash
        [29166] = 180,  --type = "others", spec = { 102, 105 } }, -- Innervate
        --[205636] = 60,  --type = "others", spec = true }, -- Force of Nature
    --},
    --["HUNTER"] = { -- 253(BM), 254(MM), 255(SV)
        --[147362] = 24,  --type = "interrupt", spec = { 253, 254 }, default = true }, -- Countershot
        --[187707] = 15,  --type = "interrupt", spec = { 255 }, default = true }, -- Muzzle
        [187650] = 30,  --type = "cc", default = true }, -- Freezing Trap
        [19577] = 60,  --type = "cc", spec = { 253, 255 } }, -- Intimidation
        [213691] = 30,  --type = "cc", spec = true }, -- Scatter Shot
        [186387] = 30,  --type = "cc", spec = { 254 } }, -- Bursting Shot
        [109248] = 45,  --type = "cc", spec = true }, -- Binding Shot
        [236776] = 40,  --type = "cc", spec = true }, -- Hi-Explosive Trap
        [202914] = 45,  --type = "cc", spec = true }, -- Spider Sting
        [186265] = 180,  --type = "immunity", default = true }, -- Aspect of the Turtle
        [109304] = 120,  --type = "defensive", default = true }, -- Exhilaration
        [212640] = 25,  --type = "defensive", spec = true }, -- Mending Bandage
        [53480] = 60,  --type = "defensive", spec = true }, -- Roar of Sacrifice
        [288613] = 120,  --type = "offensive", spec = { 254 } }, -- Trueshot
        [260402] = 60,  --type = "offensive", spec = true }, -- Double Tap
        [266779] = 120,  --type = "offensive", spec = { 255 } }, -- Coordinated Assault
        [186289] = 90,  --type = "offensive", spec = { 255 } }, -- Aspect of the Eagle
        [193530] = 120,  --type = "offensive", spec = { 253 } }, -- Aspect of the Wild
        [205691] = 120,  --type = "offensive", spec = true }, -- Dire Beast: Basilisk
        [19574] = 90,  --type = "offensive", spec = { 253 } }, -- Bestial Wrath
        [194407] = 90,  --type = "offensive", spec = true }, -- Spitting Cobra
        [131894] = 60,  --type = "offensive", spec = true }, -- A Murder of Crows
        [199483] = 60,  --type = "others", spec = true }, -- Camouflage
        [272651] = 45,  --type = "others" }, -- Command Pet
        [186257] = 180,  --type = "others" }, -- Aspect of the Cheetah
        [248518] = 45,  --type = "others", spec = true, parent = 34477 }, -- Interlope
    --},
    --["MAGE"] = { -- 62(Arcane), 63(Fire), 64(Frost)
        --[2139] = 24,  --type = "interrupt", default = true }, -- Counterspell
        [113724] = 45,  --type = "cc", spec = true }, -- Ring of Frost
        [31661] = 20,  --type = "cc", spec = { 63 } }, -- Dragon's Breath
        [45438] = 240,  --type = "immunity", default = true }, -- Ice Block
        [235219] = 300,  --type = "defensive", spec = { 64 }, default = true }, -- Cold Snap
        [198111] = 45,  --type = "defensive", spec = true, default = true }, -- Temporal Shield
        [110960] = 120,  --type = "defensive", spec = { 62 } }, -- Greater Invisibility
        [198158] = 60,  --type = "defensive", spec = true }, -- Mass Invisibility
        [12042] = 90,  --type = "offensive", spec = { 62 } }, -- Arcane Power
        [190319] = 120,  --type = "offensive", spec = { 63 } }, -- Combustion
        [153561] = 45,  --type = "offensive", spec = true }, -- Meteor
        [12472] = 180,  --type = "offensive", spec = { 64 } }, -- Icy Vein
        [198144] = 60,  --type = "offensive", spec = true, parent = 12472 }, -- Ice Form
        [205021] = 75,  --type = "offensive", spec = true }, -- Ray of Frost
        [84714] = 60,  --type = "offensive", spec = { 64 } }, -- Frozen Orb
        [257537] = 45,  --type = "offensive", spec = true }, -- Ebonbolt
        [153595] = 30,  --type = "offensive", spec = true }, -- Comet Storm
        [205025] = 60,  --type = "offensive", spec = { 62 } }, -- Presence of Mind
        [205032] = 40,  --type = "offensive", spec = true }, -- Charged Up
        [153626] = 20,  --type = "offensive", spec = true }, -- Arcane Orb
        [116011] = 40,  --type = "offensive", spec = true, charges = 2 }, -- Rune of Power
        [55342] = 120,  --type = "offensive", spec = true }, -- Mirror Image
        [80353] = 300,  --type = "offensive", pve = true }, -- Time Warp
        [108839] = 20,  --type = "others", spec = true, charges = 3 }, -- Ice Floes
        [198100] = 30,  --type = "others", spec = true }, -- Kleptomania (talentID)
        [33395] = 25,  --type = "others", spec = { 64 } }, -- Freeze (pet)
        [205024] = 0,   --type = "others", spec = 205024, parent = 33395, hide = true }, -- Lonely Winter (talentID)
        [122] = 30,  --type = "others" }, -- Frost Nova
        [1953] = 15,  --type = "others" }, -- Blink
        [212653] = 20,  --type = "others", spec = true, charges = 2, parent = 1953 }, -- Shimmer
    --},
    --["MONK"] = { -- 268(BM), 269(WW), 270(MW)
        --[116705] = 15,  --type = "interrupt", spec = { 268, 269 }, default = true }, -- Spear Hand strike
        [115450] = 8,   --type = "interrupt", spec = { 270 }, default = true }, -- Detox
        --[119381] = 60,  --type = "cc" }, -- Leg sweep
        [115078] = 45,  --type = "cc" }, -- Paralysis
        [198898] = 30,  --type = "cc", spec = true }, -- Song of Chi-Ji
        [116844] = 45,  --type = "cc", spec = true }, -- Ring of Peace
        [202370] = 30,  --type = "cc", spec = true }, -- Mighty Ox Kick
        [202335] = 45,  --type = "cc", spec = true }, -- Double Barrel
        [122470] = 90,  --type = "immunity", spec = { 269 }, default = true }, -- Touch of Karma
        [116849] = 120,  --type = "immunity", spec = { 270 }, default = true }, -- Life Cocoon
        [115203] = 420,  --type = "defensive", spec = { 268 } }, -- Fortifying Brew (BM)
        [243435] = 90,  --type = "defensive", spec = { 270 } }, -- Fortifying Brew (MW)
        [201318] = 90,  --type = "defensive", spec = true }, -- Fortifying Brew (WW)
        [115399] = 120,  --type = "defensive", spec = true }, -- Black Ox Brew
        [233759] = 45,  --type = "defensive", spec = true }, -- Grapple Weapon
        [119996] = 45,  --type = "defensive" }, -- Transcendence: Transfer
        [122278] = 120,  --type = "defensive", spec = true }, -- Dampen Harm
        [122783] = 90,  --type = "defensive", spec = true, default = true }, -- Diffuse Magic
        [115176] = 300,  --type = "defensive", spec = { 268 } }, -- Zen Meditation
        [202162] = 45,  --type = "defensive", spec = true }, -- Avert Harm
        [132578] = 180,  --type = "defensive", spec = true }, -- Invoke Niuzao, the Black Ox
        [216113] = 60,  --type = "offensive", spec = true, default = true }, -- Way of the Crane
        [115310] = 180,  --type = "offensive", spec = { 270 } }, -- Revival
        [198664] = 180,  --type = "offensive", spec = true }, -- Invoke Chi-Ji, the Red Crane
        [115080] = 120,  --type = "offensive", spec = { 269 } }, -- Touch of Death
        [137639] = 90,  --type = "offensive", spec = { 269 }, charges = 2 }, -- Storm, Earth, and Fire
        [152173] = 90,  --type = "offensive", spec = true, parent = 137639 }, -- Serenity
        [209584] = 45,  --type = "others", spec = true }, -- Zen Focus Tea
        [116841] = 30,  --type = "others", spec = true }, -- Tiger's Lust
        [101545] = 25,  --type = "others", spec = { 269 } }, -- Flying Serpent Kick
        [109132] = 20,  --type = "others", charges = 2 }, -- Roll
        [115008] = 20,  --type = "others", spec = true, charges = 2, parent = 109132 }, -- Chi Torpedo
    --},
    --["PALADIN"] = { -- 65(Holy), 66(Prot), 70(Ret)
        --[96231] = 15,  --type = "interrupt", spec = { 66, 70 }, default = true }, -- Rebuke
        [215652] = 45,  --type = "interrupt", spec = true, default = true }, -- Shield of Virtue
        [4987] = 8,   --type = "interrupt", spec = { 65 }, default = true }, -- Cleanse
        [853] = 60,  --type = "cc" }, -- Hammer of Justice
        [115750] = 90,  --type = "cc", spec = true }, -- Blinding Light
        [20066] = 15,  --type = "cc", spec = true }, -- Repentance
        [642] = 300,  --type = "immunity", default = true }, -- Divine Shield
        [1022] = 300,  --type = "defensive" }, -- Blessing of Protection
        [204018] = 180,  --type = "defensive", spec = true, parent = 1022 }, -- Blessing of Spellwarding
        [6940] = 120,  --type = "defensive", spec = { 65, 66 } }, -- Blessing of Sacrifice
        [199452] = 120,  --type = "immunity", spec = true, default = true, parent = 6940 }, -- Ultimate Sacrifice - no player buff (talentID)
        [86659] = 300,  --type = "defensive", spec = { 66 } }, -- Guardian of the Ancient Kings
        [228049] = 180,  --type = "immunity", spec = true, parent = 86659 }, -- Guardian of the Forgotten Queen
        [31821] = 180,  --type = "defensive", spec = { 65 } }, -- Aura Mastery
        [498] = 60,  --type = "defensive", spec = { 65 } }, -- Divine Protection
        [184662] = 120,  --type = "defensive", spec = { 70 } }, -- Shield of Vengeance
        [205191] = 60,  --type = "defensive", spec = true }, -- Eye for an eye
        [31850] = 85,  --type = "defensive", spec = { 66 } }, -- Ardent Defender
        [204150] = 180,  --type = "defensive", spec = true }, -- Aegis of Light
        [31884] = 120,  --type = "offensive" }, -- Avenging Wrath
        [216331] = 120,  --type = "offensive", spec = true, parent = 31884 }, -- Avenging Crusader
        [231895] = 120,  --type = "offensive", spec = true, parent = 31884 }, -- Crusade
        [105809] = 90,  --type = "offensive", spec = true }, -- Holy Avenger
        [255937] = 45,  --type = "offensive", spec = true }, -- Wake of Ashes
        [210256] = 45,  --type = "others", spec = true, default = true }, -- Blessing of Sanctuary
        [210294] = 25,  --type = "others", spec = true }, -- Divine Favor
        [1044] = 25,  --type = "others" }, -- Blessing of Freedom
        [190784] = 45,  --type = "others" }, -- Divine Steed
    --},
    --["PRIEST"] = { -- 256(Disc), 257(Holy), 258(Shadow)
        [527] = 8,   --type = "interrupt", spec = { 256, 257 }, default = true }, -- Purify
        [88625] = 60,  --type = "cc", spec = { 257 } }, -- Holy Word: Chastise
        [64044] = 45,  --type = "cc", spec = true }, -- Psychic Horror
        [8122] = 60,  --type = "cc", default = true }, -- Psychic Scream
        [205369] = 30,  --type = "cc", spec = true, parent = 8122 }, -- Mind Bomb
        --[15487] = 45,  --type = "cc", spec = { 258 } }, -- Silence
        [204263] = 45,  --type = "cc", spec = true }, -- Shining Force
        [197268] = 60,  --type = "immunity", spec = true, default = true }, -- Ray of Hope
        [213602] = 45,  --type = "immunity", spec = true }, -- Greater Fade
        [47585] = 120,  --type = "defensive", spec = { 258 }, default = true }, -- Dispersion
        [108968] = 300,  --type = "defensive", spec = true, default = true }, -- Void Shift
        [15286] = 120,  --type = "defensive", spec = { 258 } }, -- Vampiric Embrace
        [33206] = 180,  --type = "defensive", spec = { 256 }, default = true }, -- Pain Suppression
        [62618] = 180,  --type = "defensive", spec = { 256 } }, -- Power Word: Barrier
        [271466] = 180,  --type = "defensive", spec = true, parent = 62618 }, -- Luminous Barrier
        [197590] = 90,  --type = "defensive", spec = true, parent = 62618, parent2 = 271466, default = true }, -- Dome of Light (talentID)
        [47788] = 180,  --type = "defensive", spec = { 257 }, default = true }, -- Guardian Spirit
        [47536] = 90,  --type = "offensive", spec = { 256 } }, -- Rapture
        [197862] = 60,  --type = "offensive", spec = true }, -- Archangel
        [197871] = 60,  --type = "offensive", spec = true }, -- Dark Archangel
        [215769] = 180,  --type = "offensive", spec = 215982 }, -- Spirit of the Redeemer
        [265202] = 720,  --type = "offensive", spec = true }, -- Holy Word: Salvation
        [64843] = 180,  --type = "offensive", spec = { 257 } }, -- Divine Hymn
        [200183] = 120,  --type = "offensive", spec = true }, -- Apotheosis
        [19236] = 90,  --type = "offensive", spec = { 256, 257} }, -- Desperate Prayer
        [193223] = 180,  --type = "offensive", spec = true }, -- Surrender to Madness
        [280711] = 60,  --type = "offensive", spec = true }, -- Dark Ascension
        [211522] = 45,  --type = "offensive", spec = true }, -- Psyfiend
        [263165] = 45,  --type = "offensive", spec = true }, -- Void Torrent
        [73325] = 90,  --type = "others" }, -- Leap of Faith
        [305498] = 12,  --type = "others", spec = true }, -- Premonition
        [213610] = 30,  --type = "others", spec = true }, -- Holy Ward
        [32375] = 45,  --type = "others" }, -- Mass Dispel
        [289657] = 44,  --type = "others", spec = true }, -- Holy Word: Concetration
    --},
    --["ROGUE"] = { -- 259(Assa), 260(Combat), 261(Sub)
        --[1766] = 15,  --type = "interrupt", default = true }, -- Kick
        [2094] = 120,  --type = "cc" }, -- Blind
        [212182] = 180,  --type = "cc", spec = true }, -- Smoke Bomb
        [207736] = 120,  --type = "cc", spec = true }, -- Shadowy Duel
        [408] = 20,  --type = "cc", spec = { 259, 261 } }, -- Kidney Shot
        [199804] = 30,  --type = "cc", spec = { 260 } }, -- Between the Eyes
        --[31224] = 120,  --type = "defensive", default = true }, -- Cloak of Shadows
        [5277] = 120,  --type = "defensive", spec = { 259, 261 }, default = true }, -- Evasion
        [199754] = 120,  --type = "defensive", spec = { 260 }, default = true }, -- Riposte
        [1856] = 120,  --type = "defensive" }, -- Vanish
        [207777] = 45,  --type = "defensive", spec = true }, -- Dismantle
        [79140] = 120,  --type = "offensive", spec = { 259 } }, -- Vendetta
        [121471] = 180,  --type = "offensive", spec = { 261 } }, -- Shadow Blades
        [185313] = 60,  --type = "offensive", spec = { 261 }, charges = 2 }, -- Shadow Dance
        [213981] = 60,  --type = "offensive", spec = true }, -- Cold Blood
        [13750] = 180,  --type = "offensive", spec = { 260 } }, -- Adrenaline Rush
        [200806] = 45,  --type = "offensive", spec = true }, -- Exsanguinate
        [51690] = 120,  --type = "offensive", spec = true }, -- Killing Spree
        [198529] = 120,  --type = "offensive", spec = true }, -- Plunder Armor
        --[137619] = { default = 30, [260] = 60 },  type = "offensive", spec = true }, -- Marked for Death
        [221622] = 30,  --type = "offensive", spec = true }, -- Thick as Thieves (talentID)
        [114018] = 360,  --type = "others" }, -- Shroud of Consealment
        [195457] = 60,  --type = "others", spec = { 260 } }, -- Grappling Hook
        [2983] = 60,  --type = "others" }, -- Sprint
        [36554] = 30,  --type = "others", spec = { 259, 261 }, charges = [261] = 2, default = 1 } }, -- Shadowstep
    --},
    --["SHAMAN"] = { -- 262(Ele), 263(Enh), 264(Resto)
        [77130] = 8,   --type = "interrupt", spec = { 264 }, default = true }, -- Purify Spirit
        --[57994] = 12,  --type = "interrupt", default = true }, -- Wind Shear
        [51514] = 30,  --type = "cc" }, -- Hex
        [192058] = 60,  --type = "cc" }, -- Capacitor Totem
        [197214] = 40,  --type = "cc", spec = true }, -- Sundering
        [305483] = 30,  --type = "cc", spec = true }, -- Lightning Lasso
        [51490] = 45,  --type = "cc", spec = { 262 } }, -- Thunderstorm
        [108271] = 90,  --type = "defensive", default = true }, -- Astral Shift
        [210918] = 60,  --type = "defensive", spec = true, default = true, parent = 108271 }, -- Ethereal Form
        [98008] = 180,  --type = "defensive", spec = { 264 }, default = true }, -- Spirit Link Totem
        [198838] = 60,  --type = "defensive", spec = true, default = true }, -- Earthen Wall Totem
        [207399] = 300,  --type = "defensive", spec = true }, -- Ancestral Protection Totem
        [108281] = 120,  --type = "defensive", spec = { 262 } }, -- Ancestral Guidance
        [108280] = 180,  --type = "offensive", spec = { 264 } }, -- Healing tide
        [114050] = 180,  --type = "offensive", spec = true }, -- Ascendance (Ele)
        [114051] = 180,  --type = "offensive", spec = true }, -- Ascendance (Enh)
        [114052] = 180,  --type = "offensive", spec = true }, -- Ascendance (Res)
        [2825] = 300,  --type = "offensive", pve = true }, -- Bloodlust
        [204361] = 60,  --type = "offensive", spec = 193876, parent = 2825 }, -- Blood Lust w/ Shamanism
        [51533] = 120,  --type = "offensive", spec = { 263 } }, -- Feral Spirit
        [210714] = 30,  --type = "offensive", spec = true }, -- Icefury
        [191634] = 60,  --type = "offensive", spec = true }, -- Stormkeeper
        [204330] = 40,  --type = "offensive", spec = true }, -- Skyfury Totem
        [204336] = 30,  --type = "others", spec = true, default = true }, -- Grounding Totem
        --[8143] = 60,  --type = "others" }, -- Tremor Totem
        [2484] = 30,  --type = "others" }, -- Earthbind Totem
        [51485] = 30,  --type = "others", spec = true }, -- Earthgrab Totem
        [192077] = 120,  --type = "others", spec = true }, -- Wind Rush Totem
        [204331] = 45,  --type = "others", spec = true }, -- Counterstrike Totem
        [198067] = 150,  --type = "others", spec = { 262 } }, -- Fire Elemental
        [198103] = 300,  --type = "others" }, -- Earth Elemental
        [79206] = 120,  --type = "others", spec = { 264 } }, -- Spiritwalker's Grace
        [58875] = 60,  --type = "others", spec = { 263 } }, -- Spirit Walk
        [196884] = 30,  --type = "others", spec = true }, -- Feral Lunge
    --},
    --["WARLOCK"] = { -- 265(Aff), 266(Demo), 267(Dest)
        [119898] = 24,  --type = "interrupt", default = true }, -- Command Demon
        [212619] = 24,  --type = "interrupt", spec = true, default = true }, -- Call Felhunter
        [111898] = 90,  --type = "cc", spec = true }, -- Grimoire: Felguard
        [30283] = 60,  --type = "cc" }, -- Shadowfury
        [6789] = 45,  --type = "cc", spec = true }, -- Mortal Coil
        [104773] = 180,  --type = "defensive", default = true, }, -- Unending Resolve
        [108416] = 60,  --type = "defensive", spec = true, }, -- Dark Pact
        [48020] = 30,  --type = "defensive", spec = 268358, default = true }, -- Demonic Circle: Teleport
        [1122] = 180,  --type = "offensive", spec = { 267 } },    -- Summon Infernal
        [113860] = 120,  --type = "offensive", spec = true }, -- Dark Soul: Misery
        [113858] = 120,  --type = "offensive", spec = true }, -- Dark Soul: Instability
        [265187] = 90,  --type = "offensive", spec = { 266 } }, -- Summon Demonic Tyrant
        [267217] = 180,  --type = "offensive", spec = true }, -- Nether Portal
        [201996] = 90,  --type = "offensive", spec = true }, -- Call Observer
        [212459] = 90,  --type = "offensive", spec = true }, -- Call Fel Lord
        [264119] = 45,  --type = "offensive", spec = true }, -- Summon Vilefiend
        [205180] = 180,  --type = "offensive", spec = { 265 } }, -- Summon Darkglare
        [267171] = 60,  --type = "offensive", spec = true }, -- Demonic Strength
        [212295] = 45,  --type = "others", spec = true }, -- Nether Ward
        [221703] = 60,  --type = "others", spec = true }, -- Casting Circle
        [199954] = 45,  --type = "others", spec = true }, -- Curse of Fragility
        [80240] = 30,  --type = "others", spec = { 267 } }, -- Havoc
        [200546] = 45,  --type = "others", spec = true, parent = 80240 }, -- Bane of Havoc
    --},
    --["WARRIOR"] = { -- 71(Arms), 72(Fury), 73(Prot)
        --[6552] = 15,  --type = "interrupt", default = true }, -- Pummel
        [107570] = 30,  --type = "cc", spec = true }, -- Stormbolt
        [46968] = 40,  --type = "cc", spec = { 73 } }, -- Shockwave
        [5246] = 90,  --type = "cc", default = true }, -- Intimidating Shout
        [118038] = 180,  --type = "defensive", spec = { 71 }, default = true }, -- Die by the Sword
        [184364] = 120,  --type = "defensive", spec = { 72 }, default = true }, -- Enraged Regeneration
        [97462] = 180,  --type = "defensive" }, -- Rallying Cry
        [871] = 240,  --type = "defensive", spec = { 73 } }, -- Shield Wall
        [12975] = 120,  --type = "defensive", spec = { 73 } }, -- Last Stand
        [1160] = 45,  --type = "defensive", spec = { 73 } }, -- Demoralizing Shout
        [236077] = 45,  --type = "defensive", spec = true }, -- Disarm
        [107574] = 90,  --type = "offensive", spec = { 73 } }, -- Avatar
        [107574] = 90,  --type = "offensive", spec = true }, -- Avatar
        [1719] = 90,  --type = "offensive", spec = { 72 } }, -- Recklessness
        [227847] = 90,  --type = "offensive", spec = { 71 } }, -- Bladestorm
        [46924] = 60,  --type = "offensive", spec = true }, -- Bladestorm (F)
        [152277] = 60,  --type = "offensive", spec = true, parent = 227847 }, -- Ravager
        [228920] = 60,  --type = "offensive", spec = true }, -- Ravager (P)
        [118000] = 35,  --type = "offensive", spec = true }, -- Dragon Roar
        [167105] = 45,  --type = "offensive", spec = { 71 } }, -- Colossus Smash
        [262161] = 45,  --type = "offensive", spec = true, parent = 167105 }, -- Warbreaker
        [280772] = 30,  --type = "offensive", spec = true }, -- Siegebreaker
        [198817] = 25,  --type = "offensive", spec = true }, -- Sharpen Blade
        [236273] = 60,  --type = "others", spec = true }, -- Duel
        [236320] = 90,  --type = "others", spec = true, default = true }, -- War Banner
        [216890] = 25,  --type = "others", spec = true }, -- Spell Reflection
        [23920] = 25,  --type = "others", spec = { 73 } }, -- Spell Reflection (P)
        [213915] = 30,  --type = "others", spec = true, parent = 23920 }, -- Mass Spell Reflection
        [6544] = 45,  --type = "others" }, -- Heroic Leap
        [18499] = 60,  --type = "others" }, -- Berserker Rage
    --},
    --["TRINKET"] = {
        [208683] = 120, --spec = true, default = true }, -- Gladiator's Medallion
        [214027] = 60,  --spec = true, default = true }, -- Adaptation
        [196029] = 0,   --spec = true, default = true }, -- Relentless
        [195710] = 180, --default = true }, -- Honorable Medallion
    --},
    --["RACIAL"] = {
        [59752] = 180, --race =  1 }, -- Every Man for Himself
        [20572] = 120, --race =  2 }, -- Blood Fury
        [20594] = 120, --race =  3 }, -- Stoneform
        [58984] = 120, --race =  4 }, -- Shadowmeld
        [7744] = 120, --race =  5 }, -- Will of the Forsaken
        [20549] = 90, --race =  6 }, -- War Stomp
        [20589] = 60, --race =  7 }, -- Escape Artist
        [26297] = 180, --race =  8 }, -- Berserking
        [69070] = 90, --race =  9 }, -- Rocket Jump
        --[129597] = 120, --race = 10 }, -- Arcane Torrent (Monk version)
        [59542] = 180, --race = 11 }, -- Gift of the Naaru
        [68992] = 120, --race = 22 }, -- Darkflight
        [107079] = 120, --race = 25 }, -- Quaking Palm
        [260364] = 180, --race = 27 }, -- Arcane Pulse
        [255654] = 120, --race = 28 }, -- Bull Rush
        [256948] = 180, --race = 29 }, -- Spatial Rift
        [255647] = 150, --race = 30 }, -- Light's Judgment
        [291944] = 150, --race = 31 }, -- Regeneratin'
        [287712] = 150, --race = 32 }, -- Haymaker
        [265221] = 120, --race = 34 }, -- Fireblood
        [274738] = 120, --race = 36 }, -- Ancestral Call
    --},
    --["ALL"] = {
        [305252] = 120,  --type = "offensive", item = 167383, item2 = 165806 }, -- Gladistor's Maledict (Notorious/Sinister)
        [286342] = 120,  --type = "defensive", item = 167384, item2 = 165807 }, -- Gladistor's Safeguard (Notorious/Sinister)
        [295271] = 120,  --type = "defensive", item = 167865 }, -- Umbral Shell (Void Stone)
    --},
    --["ESSENCES"] = {
        [295373] = 30,  --type = "offensive", item = 295373 }, -- The Crucible of Flame
        [295186] = 60,  --type = "offensive", item = 295186 }, -- Worldvein Resonance
        [302731] = 60,  --type = "others", item = 302731 }, -- Ripple in Space
        [298357] = 120,  --type = "offensive", item = 298357 }, -- Memory of Lucid Dreams
        [293019] = 60,  --type = "defensive", item = 293019 }, -- Azeroth's Undying Gift
        [294926] = 150,  --type = "defensive", item = 294926 }, -- Anima of Life and Death
        [298168] = 120,  --type = "defensive", item = 298168 }, -- Aegis of the Deep
        [295746] = 180,  --type = "defensive", item = 295746 }, -- Nullification Dynamo
        [293031] = 60,  --type = "defensive", item = 293031 }, -- Sphere of Suppression
        [296197] = 15,  --type = "defensive", item = 296197 }, -- The Well of Existence
        [296094] = 180,  --type = "defensive", item = 296094 }, -- Artifice of Time
        [293032] = 120,  --type = "defensive", item = 293032 }, -- Life-Binder's Invocation
        [296072] = 30,  --type = "defensive", item = 296072 }, -- The Ever-Rising Tide
        [296230] = 60,  --type = "defensive", item = 296230 }, -- Vitality Conduit
        [295258] = 90,  --type = "offensive", item = 295258 }, -- Essence of the Focusing Iris
        [295840] = 180,  --type = "offensive", item = 295840 }, -- Condensed Life-Force
        [297108] = 120,  --type = "offensive", item = 297108 }, -- Blood of the Enemy
        [295337] = 60,  --type = "offensive", item = 295337 }, -- Purification Protocol
        [298452] = 60,  --type = "offensive", item = 298452 }, -- The Unbound Force
    --}
}

-- 天赋/特质影响下的冷却时间
R.TalentCDFix = {
	[740]	 = 120,	-- 宁静
	[2094]   = 90,	-- 致盲
	[15286]  = 75,	-- 吸血鬼的拥抱
	[15487]  = 30,	-- 沉默
	[22812]  = 40,	-- 树皮术
	[30283]  = 30,	-- 暗怒
	[48792]  = 165,	-- 冰封之韧
	[79206]  = 60,	-- 灵魂行者的恩赐
	[102342] = 45,	-- 铁木树皮
	[108199] = 90,	-- 血魔之握
	[109304] = 105,	-- 意气风发
	[116849] = 100,	-- 作茧缚命
	[119381] = 40,	-- 扫堂腿
	[179057] = 40,	-- 混乱新星
}

-- 团队框体职业相关Buffs
local list = {
	["ALL"] = {			-- 全职业
		[642] = true,		-- 圣盾术
		[871] = true,		-- 盾墙
		[1022] = true,		-- 保护祝福
		[27827] = true,		-- 救赎之魂
		[31224] = true,		-- 暗影斗篷
		[33206] = true,		-- 痛苦压制
		[45438] = true,		-- 冰箱
		[47585] = true,		-- 消散
		[47788] = true,		-- 守护之魂
		[48792] = true,		-- 冰封之韧
		[86659] = true,		-- 远古列王守卫
		[102342] = true,	-- 铁木树皮
		[104773] = true,	-- 不灭决心
		[108271] = true,	-- 星界转移
		[115203] = true,	-- 壮胆酒
		[116849] = true,	-- 作茧缚命
		[118038] = true,	-- 剑在人在
		[160029] = true,	-- 正在复活
		[186265] = true,	-- 灵龟守护
		[196555] = true,	-- 虚空行走
		[204018] = true,	-- 破咒祝福
		[204150] = true,	-- 圣光护盾
	},
	["WARNING"] = {
		[87023] = true,		-- 灸灼
		[95809] = true,		-- 疯狂
		[123981] = true,	-- 永劫不复
		[209261] = true,	-- 未被污染的邪能
    [283167] = true,
    [286342] = true,
	},
}

module:AddClassSpells(list)