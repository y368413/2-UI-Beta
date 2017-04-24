--怕我自己忘记，写个备注：
--1、名字不是2个字的，就是未写好、没测试过的
--2、2个字的，X单为单体、X群为群体+T为X拉、奶为X奶、DPS为X攻；
------------------------------------------------------------------------Macro-----------------------------------------------------------
local Sequences = {}
local GSStaticPriority =   [[
        limit = limit or 1
        if step == limit then
            limit = limit % #macros + 1
            step = 1
        else
            step = step % #macros + 1
        end
    ]]
------------------------------------------------------------------------ZS--Warrior---------------------------------------------------------
--==武器==-- 天赋1331313(破坏者手动)
Sequences['武攻'] = {
PreMacro=[[
/targetenemy [noharm][dead]
/cast [combat] 战吼
]],
"/cast 斩杀",
"/cast 巨人打击",
"/cast [combat] 灭战者",
"/castsequence reset=12 怒火聚焦,怒火聚焦,致死打击,怒火聚焦",
PostMacro=[[
]],
}
Sequences['武群'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 天神下凡
/cast [combat] 战吼
]],
'/cast 巨人打击',
"/cast [combat] 灭战者",
"/castsequence reset=5 旋风斩,顺劈斩,旋风斩,旋风斩",
PostMacro = [[
]],
}
-----未测试------------------------------------------------------
Sequences["武器战"] = { 
StepFunction = GSStaticPriority, 
[[
/castsequence [nostealth,combat] reset=5/combat 怒火聚焦,猛击,怒火聚焦,怒火聚焦,致死打击
]], 
   '/cast 斩杀',
   '/cast 巨人打击',
   '/cast 战吼',
   '/cast 灭战者',
}
Sequences["武单"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast 战吼
]],
"/castsequence reset=6 撕裂,怒火聚焦,怒火聚焦,怒火聚焦,顺劈斩,旋风斩",
'/cast 致死打击',
'/cast 巨人打击',
'/cast 乘胜追击',
'/cast 斩杀',
PostMacro = [[
]],
}
--"Hizzi@Nathrezim","Talents: 2133212",
Sequences['战士-武器-单体'] = {
StepFunction = GSStaticPriority,
PreMacro=[[
/targetenemy [noharm][dead]
/startattack
/cast [modifier:alt]冲锋
/cast [combat] 浴血奋战
/cast [combat] 天神下凡
/cast [combat] 战吼
]],
"/cast 斩杀",
"/cast 巨人打击",
"/cast 压制",
"/cast 致死打击",
"/cast 旋风斩",
"/cast 猛击",
PostMacro=[[
/startattack
/use [combat]13
/use [combat]14
]],
}
--"Hizzi@Nathrezim""Talents: 2133212",
Sequences['战士-武器-AOE'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
/cast [modifier:alt]冲锋
]],
'/cast !横扫攻击',
'/cast !斩杀',
'/cast !顺劈斩',
'/cast !旋风斩',
'/cast !巨人打击',
PostMacro = [[
/use [combat]13
/use [combat]14
]],
}
--Single Target -- 2,?,1,?,3,3,2
Sequences['狂攻'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
]],
"/castsequence reset=5 嗜血,怒击,狂暴挥砍,嗜血,怒击,暴怒,嗜血,怒击,狂暴挥砍,嗜血,怒击,暴怒,嗜血,怒击,狂暴挥砍,嗜血,怒击,暴怒",
"/castsequence reset=10 战吼,奥丁之怒",
PostMacro = [[
/startattack
/cast [combat] 狂暴之怒
]],
}
--20% -- 32x3112
Sequences['狂斩'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=1 斩杀",
"/castsequence reset=5 嗜血,怒击",
"/castsequence reset=10 战吼,奥丁之怒",
PostMacro = [[
/startattack
/cast [combat] 狂暴之怒
]],
}
--==防护==--天赋1212312
Sequences["防拉"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 战吼
]],
'/cast 雷霆一击',
'/cast 盾牌格挡',
'/cast 盾牌猛击',
'/cast 乘胜追击',
'/cast 雷霆一击',
"/castsequence reset=7 毁灭打击,无视苦痛,毁灭打击,复仇",
PostMacro = [[
]],
}
Sequences["防群"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 战吼
]],
'/cast 震荡波',
'/cast 雷霆一击',
'/cast 盾牌格挡',
'/cast 盾牌猛击',
'/cast 乘胜追击',
'/cast 雷霆一击',
"/castsequence reset=7 毁灭打击,无视苦痛,毁灭打击,复仇",
PostMacro = [[
]],
}
-----未测试------------------------------------------------------
--DANB-
Sequences["防单"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast 法术反射
/cast 战吼
/cast 狂暴之怒
]],
'/cast 复仇',
'/cast 盾牌猛击',
'/cast 盾牌格挡',
'/cast 复仇',
'/cast 盾牌猛击',
'/cast 无视苦痛',
'/cast 乘胜追击',
'/cast 毁灭打击',
PostMacro = [[
]],
}
Sequences["防群"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast 法术反射
/cast 战吼
/cast 狂暴之怒
]],
'/cast 复仇',
'/cast 盾牌猛击',
'/cast 盾牌格挡',
'/cast 无视苦痛',
'/cast 乘胜追击',
'/cast 雷霆一击',
'/cast 毁灭打击',
PostMacro = [[
]],
}
Sequences['战士-防御'] = {
specID = 73,
author = "Suiseiseki - wowlazymacros.com",
helpTxt = "Talents: 1223212",
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence 毁灭打击",
"/castsequence 盾牌猛击",
"/castsequence 复仇",
"/castsequence 无视苦痛",
"/castsequence 怒火聚焦",
"/castsequence [combat] 雷霆一击, 盾牌格挡",
"/castsequence [combat] 震荡波",
"/castsequence 盾牌猛击",
'/cast 乘胜追击',
PostMacro = [[
/cast [combat] 挫志怒吼
/cast [combat] 战吼
/use [combat] 13
/use [combat] 14
]],
}
Sequences["防战"] = { 
-- Macro 1 
'/cast 复仇',
'/cast 盾牌猛击',
-- Macro 2
[[ 
/castsequence reset=7/combat 盾牌格挡,毁灭打击,怒火聚焦,毁灭打击,无视苦痛,毁灭打击
]], 
-- Macro 3
[[ 
/castsequence reset=5/combat 怒火聚焦,无视苦痛
]], 
}
------------------------------------------------------------------------QS--PALADIN---------------------------------------------------------
Sequences["防拉"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast 正义盾击
]],
'/cast [combat] 守护之光',
'/cast 复仇者之盾',
'/cast [combat] 提尔之眼',
"/castsequence reset=6 审判,正义之锤,审判,正义之锤",
PostMacro = [[
]],
}
Sequences["惩戒"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 圣殿骑士的裁决",
'/cast 审判',
'/cast 狂热',
'/cast 公正之剑',
'/cast [combat] 灰烬觉醒',
PostMacro = [[
]],
} 
Sequences["惩A"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast [combat] 神圣风暴",
'/cast 审判',
'/cast 狂热',
'/cast 公正之剑',
'/cast [combat] 灰烬觉醒',
PostMacro = [[
]],
}
--Talents:32x3112
Sequences['惩单'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 征伐
]],
"/castsequence reset=6/combat/target 十字军打击,愤怒之剑,十字军打击,十字军打击,审判,处决宣判,愤怒之剑,十字军打击,圣殿骑士的裁决,十字军打击,圣殿骑士的裁决,愤怒之剑,审判,十字军打击,圣殿骑士的裁决",
PostMacro = [[
/startattack
]],
}
--Talents:32x3112
Sequences['惩群'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 征伐
]],
"/castsequence reset=6/combat/target 十字军打击,愤怒之剑,十字军打击,十字军打击,审判,神圣风暴,愤怒之剑,十字军打击,神圣风暴,十字军打击,神圣风暴,愤怒之剑,审判,十字军打击,神圣风暴",
PostMacro = [[
/startattack
]],
}
Sequences["圣骑单刷"] = { 
        '/cast 赋予信仰',
        '/cast 神圣震击',
        '/cast 黎明之光',
	'/cast 圣光闪现',
}
Sequences["圣骑慢刷"] = { 
        '/cast 赋予信仰',
        '/cast 神圣震击',
        '/cast 黎明之光',
	'/cast 殉道者之光',
}
------------------------------------------------------------------------LR--HUNTER---------------------------------------------------------
--Single Target - Talent: 3111323
Sequences['兽单'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
/petattack [@target,harm]
/petautocastoff [group] 低吼
/petautocaston [nogroup] 低吼
/cast [target=focus, exists, nodead],[target=pet, exists, nodead] 误导
]],
'/cast [nochanneling] 眼镜蛇射击',
'/cast [nochanneling] !杀戮命令',
'/cast [nochanneling] 狂野怒火',
'/cast [nochanneling] !凶暴野兽',
'/cast [nochanneling] !夺命黑鸦',
PostMacro = [[
/startattack
/petattack
/cast 野性守护
]],
}
--AoE - Talent: 3111323
Sequences['兽群'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
/petattack [@target,harm]
/petautocastoff [group] 低吼
/petautocaston [nogroup] 低吼
/cast [target=focus, exists, nodead],[target=pet, exists, nodead] 误导
]],
'/cast [nochanneling] 多重射击',
'/cast [nochanneling] !杀戮命令',
'/cast [nochanneling] 狂野怒火',
'/cast [nochanneling] !凶暴野兽',
'/cast [nochanneling] !夺命黑鸦',
PostMacro = [[
/startattack
/petattack
/cast 野性守护
]],
}
Sequences["射单"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast 百发百中
]], 
"/cast [nochanneling:弹幕射击] 风之爆裂",
"/cast [nochanneling:弹幕射击] 弹幕射击",
'/cast [nochanneling:弹幕射击] 响尾蛇',
'/cast [nochanneling:弹幕射击] 标记射击',
'/cast [nochanneling:弹幕射击] 瞄准射击',
PostMacro = [[
]],
}
Sequences["兽攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/petattack [nogroup]
]],
"/castsequence reset=5 杀戮命令,眼镜蛇射击,杀戮命令,眼镜蛇射击",
'/cast 夺命黑鸦',
'/cast 凶暴野兽',
PostMacro = [[
]],
}
------------------------------------------------------------------------DZ--ROGUE---------------------------------------------------------
--Outlaw - 1223122
Sequences['徒攻'] = {
StepFunction = GSStaticPriority,
PreMacro=[[
/targetenemy [noharm][dead]
/cast [nostealth,nocombat] 隐身
/cast [combat] 死亡标记
]],
"/castsequence 鬼魅攻击, 军刀猛刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 军刀猛刺",
"/castsequence 军刀猛刺, 穿刺, 军刀猛刺, 手枪射击",
"/castsequence 命运骨骰, 军刀猛刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 手枪射击, 穿刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 手枪射击",
"/castsequence 穿刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 军刀猛刺, 手枪射击",
PostMacro=[[
]],
}
--  Talents = "1223122",
Sequences['Out'] = {
 StepFunction = GSStaticPriority,
PreMacro=[[
/targetenemy [noharm][dead]
/cast [stealth] 伏击
/cast 死亡标记
]],
"/cast [mod:alt] 命运骨骰",
"/cast [@focus,exists,help,nodead][@targettarget,exists,help,nodead] 嫁祸诀窍",
"/castsequence 恐惧之刃的诅咒, 军刀猛刺, 军刀猛刺, 穿刺, 军刀猛刺, 穿刺",
"/castsequence 鬼魅攻击, 军刀猛刺, 军刀猛刺, 穿刺, 手枪射击",
"/castsequence 军刀猛刺, 穿刺, 鬼魅攻击, 军刀猛刺, 手枪射击",
"/castsequence 命运骨骰, 军刀猛刺, 军刀猛刺, 军刀猛刺, 命运骨骰",
"/cast 穿刺",
PostMacro=[[
/cast [nostealth,nocombat] 隐身
]],
}
--Talents: 3113231
Sequences['杀攻'] = {
PreMacro=[[
/targetenemy [noharm][dead]
/cast [nostealth,nocombat]潜行
]],
"/cast [@focus] 嫁祸诀窍",
"/cast 割裂",
"/cast 宿敌",
"/cast 消失",
"/cast 出血",
"/cast 锁喉",
"/cast 抽血",
"/cast 毒伤",
"/cast 毁伤",
PostMacro=[[
]],
}
--Talents: 1233212
Sequences['敏攻'] = {
PreMacro=[[
/targetenemy [noharm][dead]
/cast [nostealth,nocombat]潜行
/cast [combat] 死亡标记
]],
"/cast [@focus] 嫁祸诀窍",
"/cast 死亡标记",
"/cast 暗影打击",
"/cast 暗影之刃",
"/cast 消失",
"/cast 夜刃",
"/cast 暗影之舞",
"/cast 袖剑风暴",
"/cast 刺骨",
"/cast 背刺",
PostMacro=[[
]],
}
--3211231
Sequences["刺攻"] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=15 毁伤,毁伤,出血,割裂,锁喉,毁伤,毒伤",
'/cast 抽血',
PostMacro = [[
]], 
}
------------------------------------------------------------------------MS--PRIEST---------------------------------------------------------
Sequences["暗影"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast 能量灌注
]],
'/cast 虚空爆发',
'/cast 虚空箭',
'/cast 暗言术：灭',
"/castsequence [nochanneling]reset=6 暗言术：痛,吸血鬼之触,精神鞭笞,心灵震爆,精神鞭笞,精神鞭笞,精神鞭笞,精神鞭笞,心灵震爆",
PostMacro = [[
]],
} 

Sequences["神单"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 身心合一',
'/cast 愈合祷言',
'/cast 圣言术：静',
"/castsequence [nochanneling]reset=15 恢复,快速治疗,治疗术,快速治疗,治疗术,快速治疗,治疗术,快速治疗,治疗术",
PostMacro = [[
]],
} 
--Talents 3113131
Sequences['戒攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 惩击',
'/cast [nochanneling] 苦修',
'/cast 光晕',
'/cast 神圣新星',
'/cast 净化邪恶',
'/cast 摧心魔',
'/cast 教派分歧',
'/cast 闪光力场',
PostMacro = [[
/startattack
]],
}
------------------------------------------------------------------------SM--SHAMAN---------------------------------------------------------
Sequences['萨满-增强1'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence [combat] 毁灭闪电, 熔岩猛击, 熔岩猛击",
"/cast 风暴打击",
"/castsequence 火舌, 石化, 石化, 石化, 石化, 石化",
'/cast 风歌',
PostMacro = [[
/cast 狂野扑击
]],
}
--Talents  3112112 - Artifact Order: 毁灭之风 �> Hammer of Storms �> Gathering Storms �> Wind Strikes �> Wind Surge �> Weapons of the elements �> Elemental Healing �> and all the way to Unleash Doom
Sequences['萨满-增强2'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
]],
[[/castsequence 石拳, 毁灭闪电, !风暴打击;]],
[[/castsequence 石拳, 风暴打击, 毁灭闪电;]],
[[/castsequence [nochanneling] 石拳, 石拳, !毁灭闪电;]],
[[/castsequence 石拳, 石拳;]],
[[/cast 闪电箭;]],
PostMacro = [[
/startattack
/cast [combat] 毁灭之风
]],
}
--Talents - 3211233
Sequences['萨满-治疗'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast Chain Lightning',
'/cast Flame Shock',
'/cast Eathern Shield Totem',
'/cast Lava Burst',
'/cast Lightning Bold',
'/cast Lightning Surge Totem',
PostMacro = [[
]],
}

Sequences["萨单"] = { 
[[
/castsequence reset=3/combat 治疗之涌,治疗波
]],	
	'/cast 激流',
}
Sequences["萨群"] = { 
        '/cast 治疗之泉图腾',
	'/cast 治疗链',
}
--Talents:32x3112
Sequences['DANB-增强萨'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 石拳",
"/cast 风暴打击",
"/castsequence reset=8/combat/target 冰封,火舌,毁灭闪电,毁灭闪电",
"/cast 风暴打击",
PostMacro = [[
/startattack
]],
}
--Talents:32x3112
Sequences['增强2'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=8/combat/target 火舌,冰封",
"/cast 石拳",
"/cast 风暴打击",
"/cast 毁灭闪电",
PostMacro = [[
/startattack
]],
}
Sequences['强强'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence 石拳, 火舌, 风暴打击",
"/castsequence 石拳, 冰封, 风暴打击",
"/castsequence [nochanneling] 石拳, 石拳, 风暴打击, 熔岩猛击",
"/castsequence 石拳, 石拳, 风暴打击",
PostMacro = [[
/cast [combat] 火舌
/cast [combat] 冰封
/cast [combat] 熔岩猛击 
]],
}
------------------------------------------------------------------------FS--MAGE---------------------------------------------------------
--2122132
Sequences['法师-奥法'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/castsequence [nochanneling] 奥术冲击,奥术冲击,奥术冲击,奥术冲击,奥术弹幕',
'/cast [nochanneling] 奥术飞弹',
'/castsequence [nochanneling] 精力充沛, 奥术弹幕',
'/cast [nochanneling] 寒冰护体',
PostMacro = [[
/startattack
/cast [combat] 奥术强化
/cast [combat] 气定神闲
]],
}
--Talents - 2233111
Sequences['法师-火法'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=combat 火球术, 火球术, 火球术, 火球术, 火焰冲击, 炎爆术",
"/cast 燃烧",
"/cast 活动炸弹",
"/cast 浮冰",
PostMacro = [[
]],
}
--Talents: 1322112
Sequences['法师-冰法'] = {
PreMacro=[[
/targetenemy [noharm][dead]
/cast [nopet,nomod] 召唤水元素
]],
"/cast [nochanneling] 能量符文",
"/cast [nochanneling] 冰霜射线",
"/cast [nochanneling] 寒冰炸弹",
"/cast [nochanneling] 寒冰宝珠",
"/cast [nochanneling] 冰冻之触",
"/cast [nochanneling] 冰枪术",
"/cast [nochanneling] 冰风暴",
"/cast [nochanneling] 冰枪术",
"/cast [nochanneling] 冰川尖刺",
"/cast [nochanneling] 寒冰箭",
PostMacro=[[
/startattack
/cast [nochanneling] 寒冰护体
/cast [nochanneling] 浮冰
/cast [nochanneling] 冰冷血脉
/cast [nochanneling] 寒冰宝珠
]],
}
------------------------------------------------------------------------SS--WARLOCK---------------------------------------------------------
-- Affliction Legion -- Talents - 3,1,3,1,2,1,2  ???2111212
Sequences['DB_AFF'] = {
PreMacro = [[
/targetenemy [noharm][dead],
/startattack
]],
'/cast [nochanneling] Agony',
'/cast [nochanneling] Corruption',
'/cast [nochanneling] Unstable Affliction',
'/castsequence [nochanneling] Siphon Life,Drain Soul,Drain Soul',
'/cast [nochanneling] Reap Souls',
PostMacro = [[
/startattack
/petattack
]],
}
--Talents - 3,1,3,1,2,1,2
Sequences['DB_AFF2'] = {
PreMacro = [[
/targetenemy [noharm][dead],
/startattack
]],
'/cast [nochanneling] Agony',
'/cast [nochanneling] Corruption',
'/cast [nochanneling] Unstable Affliction',
'/castsequence [nochanneling] Siphon Life,Drain Soul,Drain Soul',
'/cast [nochanneling] Phantom Singularity',
'/cast [nochanneling] Reap Souls',
PostMacro = [[
/startattack
/petattack
]],
}
--Talents - 3,2,1,2,2,1,3
Sequences['DB_Demon'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
]],
"/castsequence [nochanneling] Doom,Demonic Empowerment,Demonwrath",
"/cast [nochanneling] Shadow Bolt",
"/cast [nochanneling] Shadow Bolt",
"/cast [nochanneling] Life Tap",
PostMacro = [[
/startattack
/petattack
]],
}
--Talents - 1,1,1,2,2,1,3
Sequences['DB_Destro'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/startattack
]],
"/cast [nochanneling] Conflagrate",
"/castsequence [nochanneling] Incinerate,Immolate,Incinerate,Immolate,Drain Life",
PostMacro = [[
/startattack
/petattack
]],
}
--Talents: 1111222
Sequences['DB_DemoSingle'] = {
PreMacro=[[
/cast [nopet,group] Summon Felguard
/cast [nopet,nogroup] Summon Felguard
/targetenemy [noharm][dead]
/petattack [@target,harm]
/targetenemy [noharm][dead]
]],
'/castsequence [combat] Call Dreadstalkers, Demonic Empowerment',
'/castsequence [combat] Summon Doomguard, Demonic Empowerment' ,
'/castsequence [combat] Grimoire: Felguard, Demonic Empowerment',
"/castsequence [nochanneling] Doom, Demonbolt, Demonbolt, Demonbolt, Hand of Gul'dan, Demonic Empowerment, Life Tap",
'/cast [combat] Command Demon',
PostMacro=[[
/startattack
/petattack
]],
}
--Talents: 1111222
Sequences['DB_DemoAoE'] = {
PreMacro=[[
/cast [nopet,group] Summon Felguard
/cast [nopet,nogroup] Summon Felguard
/targetenemy [noharm][dead]
/petattack [@target,harm]
/targetenemy [noharm][dead]
]],
'/castsequence [combat] Call Dreadstalkers, Demonic Empowerment',
'/castsequence [combat] Summon Infernal, Demonic Empowerment' ,
'/castsequence [combat] Grimoire: Felguard, Demonic Empowerment',
"/castsequence [nochanneling] Hand of Gul'dan, Demonic Empowerment, Demonwrath, Demonwrath, Demonwrath, Life Tap",
'/cast [combat] Command Demon',
PostMacro=[[
/startattack
/petattack
]],
}
--Talents:32x3112
Sequences['DANB-毁灭'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=6/combat/target 献祭,燃烧,烧尽,烧尽,燃烧,烧尽,烧尽,烧尽",
"/cast !混乱之箭",
PostMacro = [[
/startattack
]],
}
------------------------------------------------------------------------WS--MONK---------------------------------------------------------
--Talents: 3, 1/2/3, 1/3, 3, 1, 3, 2
Sequences['踏'] = {  
StepFunction = GSStaticPriority, 
PreMacro = [[ 
/targetenemy [noharm,dead] 
]], 
'/castsequence [combat] !怒雷破', 
'/castsequence [nochanneling] 猛虎掌, 幻灭踢', 
'/cast [nochanneling] 风领主之击', 
'/cast [nochanneling] 旭日东升踢', 
'/castsequence [nochanneling] 猛虎掌, 升龙霸, 真气波, 幻灭踢', 
'/cast [nochanneling] 猛虎掌', 
'/castsequence [combat] !怒雷破', 
'/castsequence [nochanneling] 猛虎掌, 幻灭踢, 升龙霸, 真气波', 
PostMacro = [[ 
/startattack 
]], 
}
--Talent are 2 3 2 3 1 2 3
Sequences['DANB-风行僧'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=combat 猛虎掌, 猛虎掌, 幻灭踢, 幻灭踢, 旭日东升踢",
"/castsequence reset=combat 猛虎掌, 猛虎掌, 幻灭踢, 幻灭踢, 怒雷破",
"/cast 猛虎掌",
"/cast 轮回之触",
PostMacro = [[
/cast [combat] 屏气凝神
/cast [combat] 轮回之触
]],
}
--Talents 2 3 2 3 2 2 3
Sequences['武僧-风行2'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 业报之触
]],
'/castsequence 猛虎掌, 旭日东升踢, 猛虎掌, 猛虎掌, 猛虎掌, 猛虎掌',
'/castsequence [nochanneling] 猛虎掌, 怒雷破, 猛虎掌, 幻灭踢',
'/castsequence [nochanneling] 猛虎掌, 猛虎掌, 猛虎掌, 猛虎掌, 幻灭踢, 怒雷破, 猛虎掌, 猛虎掌, 猛虎掌, 猛虎掌, 幻灭踢',
'/castsequence 猛虎掌, 旭日东升踢, 猛虎掌, 猛虎掌, 猛虎掌, 幻灭踢',
PostMacro = [[
/startattack
/cast [combat] 白虎下凡
/cast [combat] 屏气凝神
/cast [combat] 轮回之触
]],
}
Sequences["奶僧单刷"] = { 
        '/cast 复苏之雾',
        '/cast 禅意波',
        '/cast 氤氲之雾',
}
------------------------------------------------------------------------XD--DRUID---------------------------------------------------------
Sequences['魔防'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 乌索尔的印记
/cast 狂暴回复
]],
'/cast 裂伤',
"/castsequence reset=4 痛击,月火术,横扫,痛击,横扫,横扫,痛击,横扫,横扫",
'/cast 裂伤',
PostMacro = [[
]],
}
Sequences['熊拉'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 铁鬃
/cast 狂暴回复
]],
"/castsequence reset=4 痛击,月火术,横扫,痛击,横扫,横扫,痛击,横扫,横扫",
'/cast 裂伤',
PostMacro = [[
]],
}
Sequences['猫攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=5 斜掠,野蛮咆哮,撕碎,撕碎,撕碎,撕碎,割裂,撕碎,撕碎,撕碎,撕碎,凶猛撕咬",
'/cast 猛虎之怒',
'/cast 狂暴',
PostMacro = [[
]],
}

Sequences["月火猫"] = { 
StepFunction = GSStaticPriority,
PreMacro=[[
/targetenemy [noharm][dead]
/use [noform]!猎豹形态]],
"/castsequence 斜掠,月火术,撕碎,撕碎",
"/cast 猛虎之怒",
PostMacro=[[
/console autounshift 0
/cast [@targettarget,exists,nostealth,combat][@player,nostealth,combat]治疗之触
/console autounshift 1
/startattack
]],
}
------------------------------------------------------------------------DH--DEMONHUNTER---------------------------------------------------------
--"天赋2 1 1 1 1 1 3","/cast [nochanneling] 邪能之刃", "/cast [nochanneling] 灵魂壁障", 
Sequences['DHH'] = { 
PreMacro=[[ 
/targetenemy [noharm][dead] 
]], 
"/cast [nochanneling] 献祭光环", 
"/cast [nochanneling] 烈火烙印", 
"/cast [nochanneling] 灵魂切削", 
"/cast [nochanneling] 灵魂裂劈", 
"/cast [nochanneling] 裂魂", 
PostMacro=[[ 
/cast [nochanneling] 恶魔尖刺 
/cast [nochanneling] 强化结界 
]], 
}
Sequences['仇+'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 灵魂切削",
"/cast 恶魔尖刺",
"/cast 献祭光环",
"/cast 灵魂裂劈",
"/cast 裂魂",
"/cast 投掷利刃",
PostMacro = [[
/cast 烈火烙印
]],
}
--------"Talents: 2223133",
Sequences['仇复'] = {
PreMacro=[[
/targetenemy [noharm][dead]
]],
"/cast 灵魂切削",
"/castsequence [combat,nochanneling] 献祭光环, 灵魂裂劈, 裂魂, 裂魂, 恶魔尖刺, 裂魂, 裂魂, 裂魂, 灵魂裂劈, 裂魂",
"/cast 献祭光环",
"/cast 灵魂壁障",
PostMacro=[[
]],
}

Sequences['浩单'] = { 
StepFunction = GSStaticPriority, 
PreMacro = [[ 
/targetenemy [noharm][dead] 
]], 
"/cast 刃舞", 
"/cast 毁灭", 
"/cast 混乱打击", 
"/cast 投掷利刃", 
PostMacro = [[ 
/startattack 
]], 
}
Sequences['浩群'] = {
StepFunction = GSStaticPriority,
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 伊利达雷之怒",
"/cast 投掷利刃",
"/cast 刃舞",
"/cast 眼棱",
"/cast 混乱打击",
PostMacro = [[
/startattack
]],
}
Sequences['DH+'] = {
StepFunction = GSStaticPriority,
PreMacro=[[
/targetenemy [noharm][dead]
]],
"/cast 伊利达雷之怒",
"/cast 毁灭",
"/cast 投掷利刃",
"/cast 邪能之刃",
"/cast 邪能爆发",
"/cast 混乱打击",
"/cast 恶魔之咬",
PostMacro=[[
/cast 涅墨西斯
/cast 混乱之刃
]],
}
Sequences['魔化'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast [nochanneling] 眼棱",
"/cast [nochanneling] 混乱打击",
"/cast [nochanneling] 刃舞",
"/cast [nochanneling] 伊利达雷之怒",
"/cast [nochanneling] 涅墨西斯",
"/cast [nochanneling] 眼棱",
"/castsequence [nochanneling]reset=7 投掷利刃,恶魔之咬,恶魔之咬,恶魔之咬",
PostMacro = [[
]],
}
------------------------------------------------------------------------DK--DEATHKNIGHT---------------------------------------------------------
-----推荐天赋加点(由上往下)2231221
Sequences['邪恶'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=15/combat 爆发,脓疮打击,暗影之爪,暗影之爪,暗影之爪,脓疮打击,暗影之爪,暗影之爪,暗影之爪,脓疮打击,暗影之爪,暗影之爪,暗影之爪",
'/cast 凋零缠绕',
'/cast 黑暗突变',
'/cast 天启',
PostMacro = [[
]],
}
-------------天赋2213221
Sequences['冰攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 湮灭',
'/cast 冰霜打击',
'/cast 冷酷严冬',
'/cast 冰霜之柱',
'/cast 湮没',
PostMacro = [[
]],
}
-------------天赋2213221
Sequences["冰群"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 凛风冲击',
'/cast 冰霜打击',
'/cast 冷酷严冬',
'/cast 冰霜之柱',
'/cast 湮没',
PostMacro = [[
]],
}
---------天赋2112132
Sequences["鲜血"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=10/combat 骨髓分裂,心脏打击,骨髓分裂,心脏打击,骨髓分裂,心脏打击,骨髓分裂",
'/cast 灵界打击',
'/cast 血液沸腾',
'/cast 吸血鬼之血',
PostMacro = [[
]],
}
--------------------------------------------------------------------------------Core---------------------------------------------------------
if not next(Sequences) then
	print('|cffff0000一键宏|r 出错(宏内无内容), 检查修改后重启游戏生效.')
	return
end
local CastCmds = { use = true, cast = true, spell = true }
local function UpdateIcon(self)
	local step = self:GetAttribute('step') or 1
	local button = self:GetName()
	local macro, foundSpell, notSpell = Sequences[button][step], false, ''
	for cmd, etc in gmatch(macro or '', '/(%w+)%s+([^\n]+)') do
		if CastCmds[strlower(cmd)] then
			local spell, target = SecureCmdOptionParse(etc)
			if spell then
				if GetSpellInfo(spell) then
					SetMacroSpell(button, spell, target)
					foundSpell = true
					break
				elseif notSpell == '' then
					notSpell = spell
				end
			end
		end
	end
	if not foundSpell then SetMacroItem(button, notSpell) end
end
local OnClick = [=[
	local step = self:GetAttribute('step')
	self:SetAttribute('macrotext', self:GetAttribute('PreMacro') .. macros[step] .. self:GetAttribute('PostMacro'))
	%s
	if not step or not macros[step] then
		step = 1
	end
	self:SetAttribute('step', step)
	self:CallMethod('UpdateIcon')
]=]
for name, sequence in pairs(Sequences) do
	local button = CreateFrame('Button', name, nil, 'SecureActionButtonTemplate,SecureHandlerBaseTemplate')
	button:SetAttribute('type', 'macro')
	button:Execute('name, macros = self:GetName(), newtable([=======[' .. strjoin(']=======],[=======[', unpack(sequence)) .. ']=======])')
	button:SetAttribute('step', 1)
	button:SetAttribute('PreMacro', (sequence.PreMacro or '') .. '\n')
	button:SetAttribute('PostMacro', '\n' .. (sequence.PostMacro or ''))
	button:WrapScript(button, 'OnClick', format(OnClick, sequence.StepFunction or 'step = step % #macros + 1'))
	button.UpdateIcon = UpdateIcon
end

local ModifiedMacros = {} -- [macroName] = true if we've already modified this macro
local IgnoreMacroUpdates = false
local SequencesFrame = CreateFrame('Frame')
SequencesFrame:SetScript('OnEvent', function(self, event, ...)
	if (event == 'UPDATE_MACROS' or event == 'PLAYER_LOGIN') and not IgnoreMacroUpdates then
		if not InCombatLockdown() then
			IgnoreMacroUpdates = true
			--self:UnregisterEvent('UPDATE_MACROS')
			for name, sequence in pairs(Sequences) do
				local macroIndex = GetMacroIndexByName(name)
				if macroIndex and macroIndex ~= 0 then
					if not ModifiedMacros[name] then
						ModifiedMacros[name] = true
						EditMacro(macroIndex, nil, nil, '#showtooltip\n/click ' .. name)
					end
					_G[name]:UpdateIcon()
				elseif ModifiedMacros[name] then
					ModifiedMacros[name] = nil
				end
			end
			IgnoreMacroUpdates = false
			--self:RegisterEvent('UPDATE_MACROS')
		else
			self:RegisterEvent('PLAYER_REGEN_ENABLED')
		end
	elseif event == 'PLAYER_REGEN_ENABLED' then
		self:UnregisterEvent('PLAYER_REGEN_ENABLED')
		self:GetScript('OnEvent')(self, 'UPDATE_MACROS')
	end
end)

do -- temporary? fix for bug clearing the icon when zoning in 7.2
	local SequencesFrame72 = CreateFrame('frame')
	SequencesFrame72:Hide()
	local DoUpdate = false
	local IgnoreIconUpdates = false
	SequencesFrame72:SetScript('OnUpdate', function(self, elapsed)
		if DoUpdate then	
			DoUpdate = false
			self:Hide()
			for name, sequence in pairs(Sequences) do
				local macroIndex = GetMacroIndexByName(name)
				if macroIndex and macroIndex ~= 0 and _G[name] then
					_G[name]:UpdateIcon()
				end
			end
			-- print(GetTime(), 'Done updating all icons')
			IgnoreIconUpdates = false
		else
			DoUpdate = true
		end
	end)
	SequencesFrame72:SetScript('OnEvent', function(self, event, slot)
		if not IgnoreIconUpdates then
			if slot == 0 then
				IgnoreIconUpdates = true
				self:Show() -- we have to set the icon on the next frame or it won't take
				-- print(GetTime(), 'Start updating all icons')
			else
				IgnoreIconUpdates = true
				local actionType, macroSlot = GetActionInfo(slot)
				if actionType == 'macro' then
					local macroName = GetMacroInfo(macroSlot)
					if Sequences[macroName] and _G[macroName] then
						_G[macroName]:UpdateIcon()
						-- print(GetTime(), 'Updating specific icon', macroName)
					end
				end
				IgnoreIconUpdates = false
			end
		end
	end)
	SequencesFrame72:RegisterEvent('ACTIONBAR_SLOT_CHANGED')
end

SequencesFrame:RegisterEvent('UPDATE_MACROS')
SequencesFrame:RegisterEvent('PLAYER_LOGIN')