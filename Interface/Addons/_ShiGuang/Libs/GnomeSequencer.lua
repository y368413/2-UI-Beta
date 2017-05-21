--怕我自己忘记，写个备注：
--1、名字不是2个字的，就是未写好、没测试过的
--2、2个字的:X单为单体、X群为群体 (T为X拉、奶为X奶、DPS为X攻)；
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
--==武器==-- 天赋1331313(破坏者手动)
Sequences['武攻'] = {
PreMacro=[[
/targetenemy [noharm][dead]
/cast [combat] 天神下凡
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
--==狂怒==-- --天赋 2333333 
Sequences["狂攻"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 天神下凡
/cast [combat] 战吼
]],
'/cast 暴怒',
'/cast 斩杀',
'/cast 巨龙怒吼',
'/cast 奥丁之怒',
'/cast 嗜血',
"/castsequence reset=3 怒击,怒击,狂暴挥砍",
PostMacro = [[
]],
}
Sequences["狂群"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 天神下凡
/cast [combat] 战吼
]],
'/cast 暴怒',
'/cast 巨龙怒吼',
'/cast 奥丁之怒',
'/cast 暴怒',
"/castsequence reset=3 旋风斩,嗜血,旋风斩",
PostMacro = [[
]],
}
-----未测试------------------------------------------------------
--Single Target -- 2,?,1,?,3,3,2
Sequences['狂单'] = {
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
-- 3333323(奉献手动)
Sequences["骑拉"] = {  
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
Sequences["骑奉"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
/cast 正义盾击
]],
'/cast [combat] 奉献',
'/cast [combat] 守护之光',
'/cast 复仇者之盾',
'/cast [combat] 提尔之眼',
'/cast [combat] 奉献',
"/castsequence reset=6 审判,正义之锤,审判,正义之锤",
PostMacro = [[
]],
}
--天赋 1232211
Sequences["惩攻"] = {  
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
-- 天赋 1232211
Sequences["惩群"] = {  
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
Sequences['惩A'] = {
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
--天赋 1231122
Sequences["骑奶"] = {  
"/cast 神圣震击",
'/cast 赋予信仰',
'/cast 黎明之光',
'/cast 圣光术',
PostMacro = [[
]],
} 
--天赋 1231122
Sequences["骑加"] = {  
"/cast 神圣震击",
'/cast 赋予信仰',
'/cast 黎明之光',
'/cast 圣光闪现',
"/cast 神圣震击",
'/cast 赋予信仰',
'/cast 黎明之光',
PostMacro = [[
]],
} 
--天赋 1231122
Sequences["奶攻"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 神圣震击",
'/cast 审判',
'/cast 十字军打击',
'/cast [combat] 奉献',
PostMacro = [[
]],
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
--天赋 3132332(乱射保持激活)
Sequences["兽攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/petattack [nogroup]
]],
'/cast 凶暴野兽',
'/cast 胁迫',
"/castsequence reset=1 凶暴野兽,泰坦之雷",
'/castsequence reset=3 杀戮命令,眼镜蛇射击,眼镜蛇射击,杀戮命令,眼镜蛇射击',
PostMacro = [[
]],
}
--弹幕
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
--天赋 1333333(乱射保持激活)
Sequences["射攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 百发百中
]],
'/cast 标记射击',
'/cast 瞄准射击',
'/cast 风之爆裂',
'/cast 标记射击',
'/cast 瞄准射击',
'/cast 奥术射击',
PostMacro = [[
]],
}
--天赋 1333333(乱射保持激活)
Sequences["射群"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 百发百中
]],
'/cast 标记射击',
'/cast 瞄准射击',
'/cast 风之爆裂',
'/cast 多重射击',
'/cast 标记射击',
'/cast 瞄准射击',
PostMacro = [[
]],
}
-- 天赋 3131312
Sequences["存攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 雄鹰守护
]],
'/cast [nochanneling:雄鹰之怒] 猫鼬撕咬',
"/cast [@player][combat] 铁蒺藜",
"/cast [@player][combat] 爆炸陷阱",
'/cast [nochanneling:雄鹰之怒] 夺命黑鸦',
"/cast [nochanneling:雄鹰之怒][combat] 雄鹰之怒",
"/castsequence [nochanneling:雄鹰之怒]reset=7 裂痕,侧翼打击,猛禽一击,猛禽一击",
'/cast [nochanneling:雄鹰之怒] 猫鼬撕咬',
PostMacro = [[
]],
}
-- 天赋 3131312
Sequences["存群"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 雄鹰守护
]],   
'/cast [nochanneling:雄鹰之怒][combat] 屠戮',
"/cast [@player][combat] 铁蒺藜",
"/cast [@player][combat] 爆炸陷阱",
'/cast [nochanneling:雄鹰之怒] 夺命黑鸦',
"/cast [nochanneling:雄鹰之怒][combat] 雄鹰之怒",
'/cast [nochanneling:雄鹰之怒][combat] 屠戮',
"/castsequence [nochanneling:雄鹰之怒]reset=5 猫鼬撕咬,猛禽一击,猫鼬撕咬,猛禽一击",
PostMacro = [[
]],
}
------------------------------------------------------------------------DZ--ROGUE---------------------------------------------------------
--天赋2321323
Sequences["徒攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=6 军刀猛刺,军刀猛刺,命运骨骰,军刀猛刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,手枪射击,军刀猛刺,天降杀机,军刀猛刺,手枪射击,穿刺",
PostMacro = [[
]], 
}
--天赋2321323
Sequences["徒爆"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 恐惧之刃诅咒
/cast [combat] 冲动
]],
"/castsequence reset=10 军刀猛刺,命运骨骰,军刀猛刺,穿刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,穿刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,穿刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,穿刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,穿刺,手枪射击,军刀猛刺,穿刺,军刀猛刺,穿刺",
PostMacro = [[
]], 
}
--Outlaw - 1223122
Sequences['徒单'] = {
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
Sequences["敏锐贼"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=5 背刺,背刺,夜刃,背刺,背刺,刺骨",
"/cast 赤喉之咬",
"/cast 暗影之舞",
PostMacro = [[
]], 
}
Sequences["敏潜"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast 暗影之刃

/cast 死亡符记
]],
"/castsequence reset=3 暗影打击,暗影打击,刺骨",
PostMacro = [[
]], 
}
Sequences["敏A"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=3 袖剑风暴,袖剑风暴,夜刃,袖剑风暴,袖剑风暴,刺骨",
"/cast 赤喉之咬",
"/cast 暗影之舞",
PostMacro = [[
]], 
}
Sequences["敏A2"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
/cast 暗影之刃

/cast 死亡符记
]],
"/castsequence reset=3 袖剑风暴,袖剑风暴,夜刃,袖剑风暴,袖剑风暴,刺骨",
"/cast 赤喉之咬",
PostMacro = [[
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
--天赋3211231
Sequences["刺攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 抽血',
'/cast 锁喉',
'/cast 君王之灾',
"/castsequence reset=15 毁伤,毁伤,出血,割裂,毁伤,毁伤,毒伤",
PostMacro = [[
]], 
}
--3211231
Sequences["刺单"] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=15 毁伤,毁伤,出血,割裂,锁喉,毁伤,毒伤",
'/cast 抽血',
PostMacro = [[
]], 
}
------------------------------------------------------------------------MS--PRIEST---------------------------------------------------------
--天赋 2213221
Sequences["暗攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast [nochanneling] 虚空箭",
'/cast [nochanneling] 暗言术：灭',
'/cast [nochanneling] 虚空爆发',
'/cast [nochanneling] 虚空洪流',
'/castsequence [nochanneling]reset=target=9 吸血鬼之触,精神鞭笞,精神鞭笞,心灵震爆,精神鞭笞,精神鞭笞,心灵震爆,精神鞭笞,精神鞭笞,心灵震爆',
'/cast [nochanneling] 心灵炸弹',
PostMacro = [[
]],
}
--天赋 3211313
Sequences["圣加"] = { 
'/cast 愈合祷言',
'/cast 身心合一',
'/cast 图雷之光',
"/castsequence reset=9 恢复,治疗术,治疗术,治疗术,治疗术",
PostMacro = [[
]],
}
--天赋 3211313
Sequences["圣奶"] = { 
'/cast 愈合祷言',
'/cast 身心合一',
'/cast 图雷之光',
"/castsequence reset=9 恢复,快速治疗,快速治疗,快速治疗,快速治疗,快速治疗,快速治疗",
PostMacro = [[
]],
}
--天赋 3211313
Sequences["圣群"] = { 
'/cast 治疗之环',
'/cast 愈合祷言',
'/cast 身心合一',
'/cast 图雷之光',
"/castsequence reset=9 治疗祷言,治疗祷言,治疗祷言,治疗祷言,治疗祷言",
PostMacro = [[
]],
}
--天赋 3211313
Sequences["圣攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 圣言术：罚',
'/cast 神圣之火',
"/castsequence reset=6 惩击,惩击,惩击,惩击,惩击,惩击",
PostMacro = [[
]],
}
Sequences["圣单"] = { 
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
--天赋 2222312
Sequences["戒攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 真言术：盾',
'/cast 苦修',
"/castsequence [nochanneling]reset=target=9 暗言术：痛,惩击,惩击,惩击,惩击,惩击,惩击,惩击,惩击",
'/cast 圣光之怒',
PostMacro = [[
]],
}
--Talents 3113131
Sequences['戒单'] = {
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
--天赋 3213112
Sequences["增攻"] = {   
PreMacro = [[
/targetenemy [noharm][dead]
/cast [combat] 毁灭之风
]],
'/cast 石拳',
'/cast 风暴打击',
"/castsequence reset=7 火舌,冰封,毁灭闪电,毁灭闪电",
PostMacro = [[
]],
}
--天赋 1112331
Sequences["元攻"] = {   
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 元素冲击',
'/cast 熔岩爆裂',
'/cast 风暴守护者',
'/cast 元素冲击',
"/castsequence reset=8/target 烈焰震击,闪电箭,闪电箭,闪电箭,大地震击,闪电箭,闪电箭,闪电箭,大地震击,闪电箭,闪电箭",
PostMacro = [[
]],
}
--天赋 1112331
Sequences["元群"] = {   
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 风暴守护者',
'/cast 元素冲击',
"/castsequence reset=8/target 烈焰震击,闪电链,闪电链,闪电链,闪电链,闪电链,闪电链,闪电链,闪电链,闪电链",
'/cast 元素冲击',
PostMacro = [[
]],
}
--天赋 1111313
Sequences["疗奶"] = {   
'/cast 治疗之泉图腾',
'/cast 激流',
'/cast 治疗波',
'/cast 激流',
'/cast 女王的恩赐',
PostMacro = [[
]],
}
--天赋 1111313
Sequences["疗群"] = {   
'/cast 治疗之泉图腾',
'/cast 激流',
'/cast 治疗链',
'/cast 激流',
'/cast 女王的恩赐',
PostMacro = [[
]],
}
Sequences["疗攻"] = {   
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/castsequence reset=5 烈焰震击,闪电箭,闪电箭,闪电箭,闪电箭,闪电箭',
'/cast !熔岩爆裂',
PostMacro = [[
]],
}
------------下面的没试过
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

Sequences["萨单奶"] = { 
[[
/castsequence reset=3/combat 治疗之涌,治疗波
]],	
	'/cast 激流',
}
Sequences["萨群奶"] = { 
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
--天赋 3133312
Sequences["奥攻"] = { 
PreMacro = [[
/startattack
/cast 奥术强化
]], 
"/castsequence [nochanneling]reset=7 奥术冲击,奥术冲击,奥术冲击,奥术冲击,奥术冲击,虚空风暴,奥术弹幕",
"/castsequence [nochanneling]reset=0 奥术飞弹",
"/castsequence [nochanneling]reset=1 艾露尼斯的印记",
"/castsequence [nochanneling]reset=2 棱光屏障",
PostMacro = [[
]],
}
--天赋 3133312
Sequences["奥群"] = { 
PreMacro = [[
/cast 奥术强化
]], 
"/castsequence [nochanneling]reset=1 棱光屏障",
"/castsequence [nochanneling]reset=7 魔爆术,魔爆术,魔爆术,魔爆术,魔爆术,虚空风暴,奥术弹幕",
PostMacro = [[
]],
}
--天赋 1131321(炎爆术手动)
Sequences["火攻"] = {  
PreMacro = [[
/startattack
]],
"/castsequence [nochanneling]reset=0 冲击波",
"/castsequence [nochanneling]reset=0 火焰冲击",
"/castsequence [nochanneling]reset=0 凤凰烈焰",
"/castsequence [nochanneling]reset=0 烈焰护体",
'/castsequence [nochanneling]reset=1 火球术',
PostMacro = [[
]],
}
--天赋 1133322
Sequences["冰攻"] = { 
PreMacro = [[
/startattack
/cast 冰冷血脉
]], 
"/castsequence [nochanneling]reset=0 冰霜射线",
"/castsequence [nochanneling]reset=0 冰川尖刺",
"/castsequence [nochanneling]reset=0 水流喷射",
"/castsequence [nochanneling]reset=5 黑冰箭,冰枪术,冰枪术",
"/castsequence [nochanneling]reset=0 寒冰护体",
'/castsequence [nochanneling]reset=1 寒冰箭',
PostMacro = [[
]],
}
-----下面都是没试过的
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
--天赋 1122123
Sequences["毁攻"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 燃烧',
'/cast 混乱之箭',
'/cast 次元裂隙',
"/castsequence reset=8 献祭,烧尽,烧尽,烧尽,烧尽,烧尽,烧尽",
PostMacro = [[
]],
}
--天赋 1122123
Sequences["毁群"] = {  
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast 燃烧',
'/cast 次元裂隙',
'/cast 烧尽',
PostMacro = [[
]],
}
--天赋 2212332
Sequences['恶魔'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast [nochanneling] 召唤恐惧猎犬",
"/castsequence [nochanneling] 暗影箭,末日降临,暗影箭,暗影箭,暗影箭",
"/cast [nochanneling] !古尔丹之手",
'/cast [nochanneling] 恶魔增效',
'/cast [nochanneling] 萨奇尔的消耗',
PostMacro = [[
]],
}
--天赋 3222113
Sequences["痛攻"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast [nochanneling] 痛苦无常',
'/castsequence [nochanneling]reset=target=9 痛楚,腐蚀术,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂',
'/castsequence [nochanneling]reset=target=6 夺魂,痛苦无常,痛苦无常,痛苦无常',
PostMacro = [[
]],
}
--天赋 3222113
Sequences["痛群"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast [nochanneling] 夺魂',
'/castsequence [nochanneling]reset=target=9 痛楚,腐蚀术,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,痛楚,吸取灵魂,吸取灵魂,吸取灵魂',
'/castsequence [nochanneling]reset=target=6 腐蚀之种,痛苦无常',
PostMacro = [[
]],
}
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
--天赋2313112(金创药和移花手动，铁骨酒和活血酒只能用一次)
Sequences['酒拉'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 碧玉疾风",
"/cast [@player]爆炸酒桶",
"/castsequence reset=15 铁骨酒,幻灭猛击,醉酿投,猛虎掌,幻灭猛击,火焰之息,铁骨酒,猛虎掌,幻灭猛击,醉酿投,猛虎掌,猛虎掌,猛虎掌,铁骨酒,幻灭猛击,火焰之息,猛虎掌,幻灭猛击,醉酿投,幻灭猛击,铁骨酒,猛虎掌,猛虎掌,幻灭猛击,火焰之息,幻灭猛击,醉酿投,猛虎掌,铁骨酒,幻灭猛击,猛虎掌,猛虎掌",
PostMacro = [[
]],
}
--天赋2323132
Sequences['踏攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 升龙霸",
"/cast 轮回之触",
"/castsequence [nochanneling:怒雷破]reset=6 风领主之击,猛虎掌",
"/castsequence [nochanneling:怒雷破]reset=6 猛虎掌,幻灭踢,猛虎掌,旭日东升踢,猛虎掌,幻灭踢,猛虎掌,幻灭踢,猛虎掌,怒雷破,猛虎掌,旭日东升踢,猛虎掌,幻灭踢,猛虎掌,幻灭踢",
PostMacro = [[
]],
}
--天赋2323132
Sequences['踏群'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence [nochanneling:怒雷破]reset=6 旭日东升踢,怒雷破",
"/castsequence [nochanneling:怒雷破]reset=6 风领主之击",
'/castsequence [nochanneling:怒雷破]reset=6 升龙霸',
'/castsequence [nochanneling:怒雷破]reset=6 猛虎掌',
"/castsequence [nochanneling:怒雷破]reset=6 旭日东升踢,怒雷破",
'/castsequence [nochanneling:怒雷破]reset=6 神鹤引项踢,猛虎掌,神鹤引项踢',
PostMacro = [[
]],
}
------------------下面都是没试过
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
--天赋 1331121
Sequences['熊拉'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 铁鬃
/cast 狂暴回复
]],
'/cast 裂伤',
"/castsequence reset=4 痛击,月火术,横扫,痛击,横扫,横扫,痛击,横扫,横扫",
'/cast 裂伤',
PostMacro = [[
]],
}
Sequences['魔防'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 铁鬃
/cast 乌索尔的印记
]],
'/cast 裂伤',
"/castsequence reset=4 痛击,月火术,横扫,痛击,横扫,横扫,痛击,横扫,横扫",
'/cast 裂伤',
PostMacro = [[
]],
}
--天赋 2331311
Sequences['猫攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
'/cast [combat] 野蛮挥砍',
"/castsequence reset=5 斜掠,撕碎,撕碎,割裂,撕碎,撕碎,撕碎,野蛮咆哮,斜掠,撕碎,撕碎,撕碎,凶猛撕咬,撕碎,撕碎,撕碎,凶猛撕咬,撕碎,斜掠,撕碎,撕碎,凶猛撕咬,撕碎,撕碎,撕碎,野蛮咆哮,撕碎,撕碎,斜掠,撕碎,凶猛撕咬,撕碎,撕碎,撕碎,凶猛撕咬,撕碎,撕碎,撕碎,斜掠,凶猛撕咬,撕碎,撕碎,撕碎,野蛮咆哮,撕碎,撕碎,撕碎,凶猛撕咬,斜掠,撕碎,撕碎,撕碎,凶猛撕咬",
'/cast 阿莎曼的狂乱',
PostMacro = [[
]],
}
--天赋 3133133
Sequences['鸟攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 超凡之盟
]],
'/cast 星涌术',
'/cast 新月',
"/castsequence reset=5/target 月火术,阳炎术,阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光)",
PostMacro = [[
]],
}
--天赋 3133133
Sequences['鸟群'] = {
PreMacro = [[
/targetenemy [noharm][dead]
/cast 超凡之盟
]],
'/cast 新月',
"/castsequence reset=5/target 月火术,阳炎术,阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光),阳炎之怒(日光),明月打击(月光)",
PostMacro = [[
]],
}
------------------------------------------------------------------------DH--DEMONHUNTER---------------------------------------------------------
--宏名称 “浩劫” 天赋 2223311(眼棱手动)
Sequences['浩攻'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast [nochanneling] 刃舞",
"/cast [nochanneling] 投掷利刃",
"/cast [nochanneling] 混乱打击",
"/cast [nochanneling] 邪能之刃",
"/cast [nochanneling] 伊利达雷之怒",
"/cast [nochanneling] 涅墨西斯",
PostMacro = [[
]],
}
--宏名称 “魔化” 天赋 3323333 
Sequences['浩魔'] = {
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
--    宏名称 “复仇” 天赋 1121321
Sequences['仇拉'] = {
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/cast 恶魔尖刺",
"/cast [@player]烈焰咒符",
"/cast 灵魂裂劈",
"/cast 献祭光环",
"/cast 灵魂切削",
'/cast 裂魂',
PostMacro = [[
]],
}
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

------------------------------------------------------------------------DK--DEATHKNIGHT---------------------------------------------------------
---------天赋2112132
Sequences["血拉"] = { 
PreMacro = [[
/targetenemy [noharm][dead]
]],
"/castsequence reset=10/combat 骨髓分裂,心脏打击,骨髓分裂,心脏打击,骨髓分裂,心脏打击,骨髓分裂",
'/cast 灵界打击',
'/cast 血液沸腾',
'/cast 吸血鬼之血',
'/cast [combat] 吞噬',
PostMacro = [[
]],
}
-----推荐天赋加点2231221
Sequences['邪攻'] = {
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