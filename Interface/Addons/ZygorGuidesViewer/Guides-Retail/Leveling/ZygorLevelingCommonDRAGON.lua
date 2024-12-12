local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("LevelingCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Startup Guide Wizard",{
author="support@zygorguides.com",
condition_visible=function() return false end,
noscoring = true,
orientation = true,
},[[
step
欢迎来到Zygor启动向导
为了让Zygor指南发挥最佳效果，我们需要收集一些角色数据
这个巫师将引导你完成几个简单的步骤来做到这一点。
confirm begin
step
使用Zygor指导客户端（桌面版）安装趋势数据。 |complete (ZGV.Gold.servertrends ~= nil)
|tip 这对金币指南是必需的。你可以在趋势数据中的设置里配置你的服务器。
reload
confirm skip
step
findcity Main City
|tip 接下来的步骤需要你在主城内。
step
talknpcs Auctioneer |autoscript ZGV.ATWereEnabled=ZGV.db.profile.auction_enable ZGV.db.profile.auction_enable=true
在右下角点击扫描按钮。
记录金币指南的拍卖价格数据 |complete ZGV.Gold:LastScan(15)
step
talknpcs Banker
记录你放在银行库存中的物品 |complete ZGV.Inventory:CharacterBankKnown()
step
talknpcs Flightmaster
记录你在旅行系统中拥有的飞行路线 | complete LibTaxi:IsContinentKnown()
step
openskill Alchemy
|only if hasprofunscanned("Alchemy")
记录你的专业资料以制作金币指南。 |complete hasprof("Alchemy",1)
step
openskill Blacksmithing
|only if hasprofunscanned("Blacksmithing")
记录你的专业资料以制作金币指南。 |complete hasprof("Blacksmithing",1)
step
openskill Cooking
|only if hasprofunscanned("Cooking")
记录你的专业资料以制作金币指南。 |complete hasprof("Cooking",1)
step
openskill Enchanting
|only if hasprofunscanned("Enchanting")
记录你的专业资料以制作金币指南。 |complete hasprof("Enchanting",1)
step
openskill Engineering
|only if hasprofunscanned("Engineering")
记录你的专业资料以制作金币指南。 |complete hasprof("Engineering",1)
step
openskill First Aid
|only if hasprofunscanned("First Aid")
记录你的专业资料以制作金币指南。 |complete hasprof("First Aid",1)
step
openskill Fishing
|only if hasprofunscanned("Fishing")
记录你的专业资料以制作金币指南。 |complete hasprof("Fishing",1)
step
openskill Herbalism
|only if hasprofunscanned("Herbalism")
记录你的专业资料以制作金币指南。 |complete hasprof("Herbalism",1)
step
openskill Inscription
|only if hasprofunscanned("Inscription")
记录你的专业资料以制作金币指南。 |complete hasprof("Inscription",1)
step
openskill Jewelcrafting
|only if hasprofunscanned("Jewelcrafting")
记录你的专业资料以制作金币指南。 |complete hasprof("Jewelcrafting",1)
step
openskill Leatherworking
|only if hasprofunscanned("Leatherworking")
记录你的专业资料以制作金币指南。 |complete hasprof("Leatherworking",1)
step
openskill Mining
|only if hasprofunscanned("Mining")
记录你的专业资料以制作金币指南。 |complete hasprof("Mining",1)
step
openskill Skinning
|only if hasprofunscanned("Skinning")
记录你的专业资料以制作金币指南。 |complete hasprof("Skinning",1)
step
openskill Tailoring
|only if hasprofunscanned("Tailoring")
记录你的专业资料以制作金币指南。 |complete hasprof("Tailoring",1)
step
万事俱备！
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Dracthyr Starter (10-15)",{
author="support@zygorguides.com",
description="This guide will walk you through completing the introductory Dracthyr quests.",
condition_suggested=function() return raceclass("Dracthyr") and level <= 16 and not completedq(65100) end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass("Dracthyr") end,
condition_valid_msg="You must be a Dracthyr to complete this guide!",
startlevel=10,
next="Leveling Guides\\Starter Guides\\Chromie Time",
},[[
step
_Nearby:_
|tip 当你创建一名德拉克瑟尔时，你会在大圆形大厅的一个侧房间开始。
|tip 这是随机的，所以你需要交谈的第一个NPC的位置会根据你进入的房间而变化。
talk Dervishian##181494			|only if Alliance
talk Kodethi##187223			|only if Horde
accept Awaken Dracthyr##64864
step
_Nearby:_
clicknpc Dervishian##181494			|only if Alliance
clicknpc Kodethi##187223			|only if Horde
觉醒一个龙裔盟友 |q 64864/1
step
clicknpc Tethalash##181680
觉醒泰萨拉什 |q 64864/3 |goto The Forbidden Reach/4 44.38,85.57
step
click Talon Kethahn
寻找凯萨恩 |q 64864/2 |goto 47.95,79.90
step
clicknpc Scalecommander Azurathel##183380
唤醒阿祖拉瑟尔 |q 64864/4 |goto 32.15,82.73
step
观察对话
talk Scalecommander Azurathel##181056
|tip 他走到这个地点。
turnin Awaken, Dracthyr##64864 |goto 32.92,81.57
accept Gear Up##64865 |goto 32.92,81.57
step
talk Dervishian##181596
accept Arcane Guardians##64863 |goto 33.06,80.69
stickystart "Slay_Guardians_Or_Constructs"
step
click Weapon Rack
|tip 在一个侧室。
collect Stack of Weapons##187852 |q 64865/1 |goto 45.03,66.23
step
click Rations
|tip 在一个侧室。
collect Decayed Rations##187855 |q 64865/3 |goto 34.17,61.06
step
click Crate of Warscale Armor
|tip 在一个侧室。
collect Crate of Warscales##187853 |q 64865/2 |goto 38.70,51.25
step
label "Slay_Guardians_Or_Constructs"
在该区域击杀敌人
击杀#4#守护者或构造体 |q 64863/1 |goto 39.68,61.80
'|kill Ancient Construct##185272, Conjured Guardian##186853
step
talk Dervishian##182069
turnin Arcane Guardians##64863 |goto 45.88,58.56
step
talk Scalecommander Azurathel##181594
turnin Gear Up##64865 |goto 46.44,57.11
accept Into the Cauldron##64866 |goto 46.44,57.11
step
滑翔入大地守护者的药锅 |q 64866/1 |goto 45.56,48.01
|tip 从平台跳下，滑翔到地面。
step
救援或治疗#5#德拉克萨尔使用活焰 |q 64866/2 |goto 54.66,47.19
|tip 使用你的{o}活焰{}技能对德拉克萨尔爪进行施放。
|tip 它们看起来像是在地上躺着或站着的龙族。
'|clicknpc Dracthyr Talon##187335, Dracthyr Talon##187133
step
talk Scalecommander Azurathel##182168
turnin Into the Cauldron##64866 |goto 61.97,36.27
step
talk Scalecommander Cindrethresh##186883
accept The Dragon at the Door##64871 |goto 62.29,36.45
step
到达出口 |q 64871/1 |goto 66.18,12.09
|tip 与盟友一起冲上楼梯。
step
kill Lapisagos##186854 |q 64871/2 |goto 66.40,10.54
|tip 你的盟友将帮助你作战。
step
观察对话
到达地表 |goto The Forbidden Reach/0 44.41,61.49 < 50 |c |noway |q 64871
step
观察对话
talk Scalecommander Cindrethresh##184269
|tip 她冲向这个地点。
turnin The Dragon at the Door##64871 |goto The Forbidden Reach/0 44.41,61.49
accept The Fire Within##64872 |goto The Forbidden Reach/0 44.41,61.49
step
talk Scalecommander Azurathel##182251
accept Arcane Intrusion##65615 |goto 44.08,61.39
step
施放强化的I级火焰吐息 |q 64872/1 |goto 43.74,61.21
|tip 使用你的 {o}火焰吐息{} 技能。
|tip 你不需要攻击任何敌人，只需在未目标化的情况下施放法术。
|tip 按住施法按钮进行蓄能，以填满屏幕上出现的第一个法术栏。
|tip 在此位置点击火焰呼吸充能器，以消除火焰呼吸的冷却时间，方便你再次尝试，如有需要。
step
施放强化版II烈焰吐息 |q 64872/2 |goto 43.74,61.21
|tip 使用你的 {o}火焰吐息{} 技能。
|tip 你不需要攻击任何敌人，只需在未目标化的情况下施放法术。
|tip 按住施法按钮充能，填满屏幕上出现的第二个法术栏。
|tip 在此位置点击火焰呼吸充能器，以消除火焰呼吸的冷却时间，方便你再次尝试，如有需要。
step
施放强化 III 火焰吐息 |q 64872/3 |goto 43.74,61.21
|tip 使用你的 {o}火焰吐息{} 技能。
|tip 你不需要攻击任何敌人，只需在未目标化的情况下施放法术。
|tip 长按法术按钮充能，填满屏幕上出现的第三个法术条。
|tip 在此位置点击火焰呼吸充能器，以消除火焰呼吸的冷却时间，方便你再次尝试，如有需要。
step
talk Scalecommander Cindrethresh##184269
turnin The Fire Within##64872 |goto 44.40,61.50
step
click Beacon
|tip 看起来像一座大石碑正朝天空发射蓝色光束
|tip 你可以在远处点击它。
调查信标 |q 65615/1 |goto 45.43,53.72
step
talk Scalecommander Azurathel##182251
turnin Arcane Intrusion##65615 |goto 44.09,61.41
step
观察对话
talk Scalecommander Emberthal##181054
|tip 他飞往这个地点。
accept Stretch Your Wings##64873 |goto 44.54,61.06
step
talk Dervishian##192889
了解滑行 |q 64873/1 |goto 44.72,57.62
step
_NOTE:_
在下一步中
|tip 在北方附近寻找一串巨大的发光符文环。
|tip 你将使用你的{o}翱翔{}技能发射到空中并开始用你的翅膀滑翔。
|tip 穿越每个环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
点击此处继续 |confirm |q 64873
step
在#5#个环中翱翔 |q 64873/3 |goto 44.82,57.43
|tip 使用你的{o}翱翔{}技能。
|tip 在北方附近寻找一串巨大的发光符文环。
|tip 穿越每个环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
step
抵达古老的维尔恩领地 |complete subzone("The Old Weyrn Grounds") |q 64873
|tip 你将自动飞行。
step
talk Kodethi##192893
了解潜水 |q 64873/4 |goto 41.42,48.22
step
_NOTE:_
在下一步中
|tip 在附近的西部寻找一串大型发光符文环。
|tip 第一重环高悬于空中，其余环则位于峡谷之中。
|tip 你将使用你的{o}翱翔{}技能发射到空中并开始用你的翅膀滑翔。
|tip 在最高的环开始滑翔，穿过每个环，逐渐向下潜入其他环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
点击此处继续 |confirm |q 64873
step
穿过#5#个光环 |q 64873/5 |goto 41.42,48.22
|tip 使用你的{o}翱翔{}技能。
|tip 在附近的西部寻找一串大型发光符文环。
|tip 第一重环高悬于空中，其余环则位于峡谷之中。
|tip 在最高的环开始滑翔，穿过每个环，逐渐向下潜入其他环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
step
抵达古老的维尔恩领地 |complete subzone("The Old Weyrn Grounds") |q 64873
|tip 你将自动飞行。
step
talk Dervishian##192889
了解高级飞行 |q 64873/6 |goto 44.73,57.64
step
_NOTE:_
在下一步中
|tip 在北方更远处寻找一串巨大的发光符文环在空中。
|tip 你将使用你的{o}翱翔{}技能发射到空中并开始用你的翅膀滑翔。
|tip 穿越每个环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
点击此处继续 |confirm |q 64873
step
穿越#3#个法环 |q 64873/7 |goto 44.73,57.64
|tip 使用你的{o}翱翔{}技能。
|tip 在北方更远处寻找一串巨大的发光符文环在空中。
|tip 穿越每个环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败，使用{o}再试一次{}技能重新尝试。
|tip 它在屏幕上显示为一个按钮。
step
抵达古老的维尔恩领地 |complete subzone("The Old Weyrn Grounds") |q 64873
|tip 你将自动飞行。
step
talk Dervishian##192889
turnin Stretch Your Wings##64873 |goto 44.72,57.63
accept Train Like We Fight##65036 |goto 44.72,57.63
step
练习翱翔 |q 65036/1 |goto 44.54,59.37
|tip 使用你的{o}翱翔{}技能。
|tip 不要飞得太远。
|tip 你需要在附近交任务。
step
talk Scalecommander Emberthal##181054
turnin Train Like We Fight##65036 |goto 44.24,61.18
accept Caldera of the Menders##65060 |goto 44.24,61.18
step
talk Scalecommander Cindrethresh##182317
|tip 在石雕平台上，俯瞰山谷。
告诉她"没有时间可浪费" |gossip 54978
在疗愈者的火山口与辛德雷斯见面 |q 65060/1 |goto 36.45,32.54
step
talk Scalecommander Cindrethresh##184214
|tip 靠近建筑物的入口处
turnin Caldera of the Menders##65060 |goto 18.80,15.82
accept Into the Hive##65063 |goto 18.80,15.82
step
跟随辛德雷斯 |q 65063/1 |goto The Forbidden Reach/3 39.29,45.17
|tip 缩放指挥官辛德瑞丝冲进建筑。
|tip 在建筑内部，屏幕上将出现一个{o}毒气条{}并开始填充。
|tip 不要停下脚步去打怪，直接跑到这个地点。
|tip 你将昏厥并被救赎。
step
归来，斯凯尔指挥官维里迪亚 |complete subzone("Caldera of the Menders") |q 65063
|tip 你将自动飞行。
step
talk Scalecommander Viridia##184163
turnin Into the Hive##65063 |goto The Forbidden Reach/0 20.08,19.07
accept A Toxic Problem##65073 |goto The Forbidden Reach/0 20.08,19.07
step
talk Scalecommander Cindrethresh##184214
accept Easy Prey##65074 |goto 20.24,19.01
stickystart "Collect_Toxin_Glands"
stickystart "Slay_Scythids"
step
talk To'no##184166
|tip 在洞穴入口旁边。
accept Halp!##65071 |goto 33.48,33.32
step
进入洞穴 |goto The Forbidden Reach/0 33.60,34.60 < 15 |walk |only if not (subzone("Lair of the Scythid") and indoors())
talk Little Ko##184165
|tip 靠近后墙，堆满了龙骨。
|tip 在洞穴内，顶层。
告诉她 "跟我来。我会带你去安全的地方。" |gossip 51921
拯救小库尔提拉斯 |q 65071/1 |goto 27.33,36.56
step
label "Collect_Toxin_Glands"
一路向前，走出洞穴 |goto 33.60,34.59 < 20 |walk |only if subzone("Lair of the Scythid")
击杀此区域内的尖钳敌人
|tip 它们看起来像飞行的虫子。
|tip 你可以在这个区域周围找到它们。 |不固定
|tip 死亡吞噬者虫族，洞穴内，也会掉落任务物品。|仅在子区域为“虫族巢穴”时有效。
collect 6 Toxin Gland##187948 |q 65073/1 |goto 32.30,28.88
'|kill Scalerender Beetle##182007, Mature Scalerender##194957, Deatheater Scythid##182394
step
label "Slay_Scythids"
一路向前，走出洞穴 |goto 33.60,34.59 < 20 |walk |only if subzone("Lair of the Scythid")
在该地区击杀斯基迪敌人
|tip 它们看起来像带有钳尾的大虫子。
击杀#4#剃刀虫 |q 65074/1 |goto 32.30,28.88
'|kill Deatheater Scythid##182394, Scythid Steamstalker##182008
step
一路向前，走出洞穴 |goto 33.60,34.59 < 20 |walk |only if subzone("Lair of the Scythid")
talk Explorer Ko'nali##184212
turnin Halp!##65071 |goto 21.69,29.54
step
talk Scalecommander Cindrethresh##184214
turnin Easy Prey##65074 |goto 20.23,19.03
step
talk Scalecommander Viridia##184163
turnin A Toxic Problem##65073 |goto 20.08,19.09
accept Mercy First##65307 |goto 20.08,19.09
step
治疗 #10# 受伤的德拉诺风龙 |q 65307/1 |goto 21.61,23.11
|tip 使用你的活焰或翠绿之花技能对伤员爪击。
|tip 对他们逐个使用 {o}生命之焰{} 进行治疗。
|tip 当你靠近多个翡翠花时，使用{o}翡翠花{}可以同时治愈多个目标。
click Emerald Blossom Infuser+
|tip 它们看起来像是小基座，上面放着巨大的蓝色水晶。
|tip 他们将移除你的{o}翡翠之花{}法术的冷却时间。
你可以在以下地点找到更多： |notinsticky
[24.06,22.24]
[25.68,18.39]
'|clicknpc Injured Talon##182349
step
治疗阿特雷诺什·冰霜之石 |q 65307/3 |goto 24.90,13.61
|tip 使用你的{o}活焰{}技能。
|tip 在艾特雷诺什·冰霜之石身上使用它。
'|clicknpc Atrenosh Hailstone##188652
step
治疗受伤的德拉诺人#4# |q 65307/2 |goto 24.92,13.09
|tip 对你的盟友使用治疗技能。
|tip 对他们逐个使用 {o}生命之焰{} 进行治疗。
|tip 当你靠近多个翡翠花时，使用{o}翡翠花{}可以同时治愈多个目标。
click Emerald Blossom Infuser+
|tip 它们看起来像是小基座，上面放着巨大的蓝色水晶。
|tip 他们将移除你的{o}翡翠之花{}法术的冷却时间。
'|clicknpc Injured Drakonid##187904
step
talk Scalecommander Viridia##184163
turnin Mercy First##65307 |goto 20.08,19.10
accept Never Forgotten##66324 |goto 20.08,19.10
step
_NOTE:_
在下一步中
|tip 屏幕上出现一个进度条并逐渐填满。
|tip 使用 {o}毒素解药{} 技能来减少进度条。
|tip 它在屏幕上显示为一个按钮。
点击此处继续 |confirm |q 66324
step
进入建筑物 |goto 18.57,15.83 < 15 |walk |only if not subzone("The Support Creche")
click Report: Infestation##376530
|tip 在建筑物内。
发现线索 |q 66324/2 |goto The Forbidden Reach/3 66.58,67.59
step
clicknpc Katrinasa##191445
|tip 在建筑物内。
collect Horn Signet of Katrinasa##191732 |q 66324/1 |goto 39.31,28.66 |count 1
step
clicknpc Rethenash##191444
|tip 在建筑物内。
collect Horn Signet of Rethenash##191731 |q 66324/1 |goto 34.43,38.90 |count 2
step
click Crystal Key
|tip 在建筑物内。
携带水晶 |havebuff Carrying Crystal##371552 |goto 27.52,45.57 |q 66324
step
click Crystal Lock
|tip 在建筑物内。
拯救 #10# 幸存者 |q 66324/3 |goto 25.58,33.73
step
clicknpc Tenezeth##188146
|tip 在建筑物内。
collect Horn Signet of Tenezeth##191730 |q 66324/1 |goto 18.89,50.84 |count 3
step
沉沦于毒瘤之中 |complete subzone("Caldera of the Menders") |goto 18.89,50.84 |q 66324
|tip 让屏幕上的进度条填满。
|tip 你将被传送到任务发布者外面。
step
talk Scalecommander Viridia##184163
turnin Never Forgotten##66324 |goto The Forbidden Reach/0 20.08,19.08
accept The Healing Wings##65075 |goto The Forbidden Reach/0 20.08,19.08
step
骑乘升腾增强器 |invehicle |goto 20.42,19.72 |q 65075
|tip 你将自动飞行以跟随你的盟友。
step
观察对话
|tip 你将自动飞行。
抵达古老的维尔恩之地 |outvehicle |goto 44.20,58.03 |notravel
step
talk Scalecommander Emberthal##181054
|tip 靠近建筑物入口处。
turnin The Healing Wings##65075 |goto 44.25,61.16
accept Stormsunder Crater##65045 |goto 44.25,61.16
step
talk Treysh##198429
accept Cavalry Has Its Place##72263 |goto 45.29,61.35 |instant
step
talk Scalecommander Azurathel##182274
turnin Stormsunder Crater##65045 |goto 70.44,64.34
accept Tangle with the Tarasek##65049 |goto 70.44,64.34
accept Conjured Army##65050 |goto 70.44,64.34
step
talk Dervishian##186210
accept The Primalists##65046 |goto 70.36,64.59
stickystart "Slay_Taraseks"
stickystart "Slay_Conjured_Elementals"
step
click Primal Path
|tip 看起来像一块漂浮的符文石。
发现原始者的意图 |q 65046/1 |goto 71.89,60.16
step
click Gift of the Incarnates
|tip 看起来像一块漂浮的符文石。
发现原始领袖 |q 65046/3 |goto 71.94,54.52
step
click Lie of the Aspects
|tip 看起来像一块漂浮的符文石。
探寻始源者的动机 |q 65046/2 |goto 78.26,66.47
step
label "Slay_Taraseks"
击杀塔拉塞克敌人，遍布此区域。
|tip 他们看起来像肌肉发达的蜥蜴人。
击杀#7#塔拉塞克 |q 65049/1 |goto 76.06,63.33
'|kill Infused Tarasek##181310, Tarasek Shockshaman##191224
step
label "Slay_Conjured_Elementals"
kill Conjured Stormling##181840+
|tip 它们看起来像小型白色元素生物。
消灭#12#召唤元素体 |q 65050/1 |goto 76.06,63.33
step
talk Dervishian##186218
|tip 站在高地上，俯瞰谷地。
turnin The Primalists##65046 |goto 79.41,62.04
step
talk Scalecommander Azurathel##182275
|tip 站在高地上，俯瞰谷地。
turnin Tangle with the Tarasek##65049 |goto 79.55,62.29
turnin Conjured Army##65050 |goto 79.55,62.29
accept The Ebon Scales##65052 |goto 79.55,62.29
step
信号攻击埃克拉扎尔 |q 65052/1 |goto 81.52,55.70
|tip 跑向埃克拉萨尔，巨龙在建筑上喷吐火焰。
|tip 不要停下与敌人交战。
|tip 使用{o}大规模解体{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你不必与龙战斗。
'|kill Ekrazathal##190974
step
talk Scalecommander Sarkareth##182297
turnin The Ebon Scales##65052 |goto 81.23,53.96
accept Rally to Emberthal##65057 |goto 81.23,53.96
step
骑乘升腾增强器 |invehicle |goto 80.62,53.53 |q 65057
|tip 你将自动飞行以跟随你的盟友。
step
观察对话
|tip 你将自动飞行。
抵达古老的维尔恩之地 |outvehicle |goto 47.09,58.81 |notravel
step
talk Scalecommander Emberthal##181054
turnin Rally to Emberthal##65057 |goto 44.23,61.16
step
talk Scalecommander Emberthal##182258
accept Preservation, Augmentation, or Devastation##65701 |goto The Forbidden Reach/0 44.83,57.71
step
激活天赋特长 |q 65701/1
step
talk Scalecommander Emberthal##182258
turnin Preservation, Augmentation, or Devastation##65701 |goto 44.83,57.71
accept The Froststone Vault##65084 |goto 44.83,57.71
step
talk Scalecommander Sarkareth##184308
|tip 在楼梯顶部。
turnin The Froststone Vault##65084 |goto 56.73,28.16
accept The Prize Inside##65087 |goto 56.73,28.16
step
在该区域击杀敌人
|tip 对红色泪滴标记的盟友使用你的治疗技能。
|tip 对他们逐个使用 {o}生命之焰{} 进行治疗。
|tip 当你靠近多个翡翠花时，使用{o}翡翠花{}可以同时治愈多个目标。
|tip 你可以重复治疗他们，直到红色水滴消失。
保卫霜石宝 vault |q 65087/1 |goto 54.73,31.27
'|kill Trueborn Rainmaker##184404, Tarasek Shockbringer##181377
'|clicknpc Azuresworn Drakonid##184420, Atrenosh Hailstone##190480, Tactical Mender##190529, Mage Talon##183794
step
talk Scalecommander Sarkareth##184308
|tip 他在楼梯上向这个地点跑去。
turnin The Prize Inside##65087 |goto 56.33,28.75
step
_NOTE:_
在下一步中
|tip 接受任务后立刻下楼。
|tip 一个巨大的风灵将开始追赶你下楼。
|tip 迅速滑行下楼梯，撤退到安全区域。
点击此处继续 |confirm |q 65097 |future
step
talk Scalecommander Emberthal##182441
accept Run!##65097 |goto 54.10,32.34
step
超越风暴化身 |q 65097/1 |goto 47.05,35.48
step
寻找沃金 |q 65097/2 |goto 47.05,35.48
step
治疗拉瑟伦 |q 65097/3 |goto 47.05,35.48
|tip 使用你的{o}活焰{}技能。
|tip 在瓦塔哈身上使用它。
'|clicknpc Wrathion##182601
step
talk Wrathion##182601
turnin Run!##65097 |goto 47.05,35.48
accept The Consequence of Courage##65098 |goto 47.05,35.48
step
寻找埃比斯安 |q 65098/1 |goto 47.85,40.10
|tip 他会被抓走并带走。
step
治愈艾比西安 |q 65098/2 |goto 43.22,38.17
|tip 使用你的{o}活焰{}技能。
|tip 反复对艾比西安使用它。
|tip 他看起来像一只被埋在废墟中的巨龙。
|tip 在前往这里的道路上，避开白色漩涡。
|tip 靠近时会刷新敌人。
'|clicknpc Ebyssian##192697
step
talk Scalecommander Emberthal##191780
turnin The Consequence of Courage##65098 |goto 41.68,44.55
accept Final Orders##65100 |goto 41.68,44.55
step
抵达古老的维尔恩领地 |q 65100/1 |goto 41.90,54.35
|tip 在楼梯顶部。
step
与诺兹多姆交谈 |q 65100/2 |goto 43.70,59.81
|tip 他看起来像一只巨大的黄色龙。
|tip 冲上楼梯，靠近他。
step
talk Scalecommander Viridia##182610
向“军团指挥官维里迪亚”致敬。 |gossip 51849
与维瑞迪亚交谈 |q 65100/4 |goto The Forbidden Reach/0 43.46,54.12
|only if Alliance
step
talk Scalecommander Sarkareth##182611
选择 _"<转达诺兹多姆告诉你的内容。>"_ |gossip 51850
与萨卡雷斯交谈 |q 65100/3 |goto 47.06,55.89
|only if Alliance
step
talk Scalecommander Azurathel##182609
turnin Final Orders##65100 |goto 46.95,55.80
|only if Alliance
step
到达暴风城大门 |complete subzone("Stormwind Gate") |q 65286 |future
|tip 你将自动飞行。
|only if Alliance
step
talk Wrathion##189322
accept Draconic Connections##65286 |goto Elwynn Forest/0 32.26,49.67
|only if Alliance
step
talk Scalecommander Azurathel##189324
turnin Draconic Connections##65286 |goto 32.26,49.85
accept Ground Leave##66513 |goto 32.26,49.85
|only if Alliance
step
前往银行 |q 66513/2 |goto Stormwind City/0 62.58,77.50
|tip 在建筑物内。
|only if Alliance
step
访问拍卖行 |q 66513/1 |goto 61.55,72.04
|tip 在建筑物内。
|only if Alliance
step
冲上螺旋坡道，进入建筑。 |goto 50.11,87.49 < 15 |only if walking
访问传送门大厅 |q 66513/4 |goto Stormwind City/0 48.75,88.07
|tip 走进传送门。
|tip 在建筑内部，顶层。
|only if Alliance
step
访问大使馆 |q 66513/3 |goto 52.61,14.28
|tip 在建筑物内。
|only if Alliance
step
talk Scalecommander Azurathel##189603
|tip 站在暴风城堡外墙的开放窗户旁。
|tip 你可以直接飞到他那里。
turnin Ground Leave##66513 |goto 79.95,26.97
|only if Alliance
step
talk Wrathion##189569
|tip 在建筑物内。
accept Aspectral Invitation##66577 |goto 79.80,27.02
|only if Alliance
step
talk Wrathion##189569
|tip 在建筑物内。
选择 _"倾听瓦里安与图拉扬的声音。"_
 |gossip 55659
与 wrathion 对话 |q 66577/1 |goto 79.80,27.02
|only if Alliance
step
talk Wrathion##189569
|tip 在建筑物内。
turnin Aspectral Invitation##66577 |goto 79.80,27.02
accept An Iconic, Draconic, Look##65101 |goto 79.80,27.02
|only if Alliance
step
talk Wrathion##189569
|tip 在建筑物内。
选择一个外形。 |gossip 55882
与沃拉尔对话 |q 65101/1 |goto 79.80,27.02
|only if Alliance
step
观察对话
|tip 跟随瓦尔基翁的步伐。
|tip 他最终走到建筑内部的这个位置。
了解外形形态	|q 65101/2 |goto 82.53,23.94
|only if Alliance
step
假装你的凡人形态 |q 65101/3 |goto 82.53,23.94
|tip 使用 {o}外貌形态{} 能力。
|tip 它在屏幕上显示为一个按钮。
|tip 在建筑物内。
|only if Alliance
step
talk Wrathion##194022
|tip 在建筑物内。
turnin An Iconic, Draconic, Look##65101 |goto 82.53,23.94
|only if Alliance
step
talk Dungar Longdrink##352
|tip 在建筑物内。
fpath Stormwind |goto 70.94,72.47
|only if Alliance
step
观察对话
talk Scalecommander Sarkareth##182611
|tip 他跑到这个地点。
选择 _"<转达诺兹多姆告诉你的内容。>"_ |gossip 51850
与萨卡雷斯交谈 |q 65100/3 |goto The Forbidden Reach/0 47.06,55.89
|only if Horde
step
talk Scalecommander Viridia##182610
向“军团指挥官维里迪亚”致敬。 |gossip 51849
与维瑞迪亚交谈 |q 65100/4 |goto 43.46,54.12
|only if Horde
step
talk Scalecommander Cindrethresh##182612
turnin Final Orders##65100 |goto 43.57,54.30
|only if Horde
step
抵达奥格瑞玛之门 |complete subzone("The Dranosh'ar Blockade") |q 65286 |future
|tip 你将自动飞行。
|only if Horde
step
talk Spiritwalker Ebonhorn##189386
accept Spiritual Allies##66237 |goto Durotar/0 45.61,12.89
|only if Horde
step
talk Scalecommander Cindrethresh##189389
turnin Spiritual Allies##66237 |goto 45.56,12.94
accept Ground Leave##66534 |goto 45.56,12.94
|only if Horde
step
访问传送门大厅 |q 66534/4 |goto Orgrimmar/1 56.00,90.01
|tip 在建筑物内。
|only if Horde
step
访问拍卖行 |q 66534/1 |goto 53.54,73.85
|tip 在建筑物内。
|only if Horde
step
前往银行 |q 66534/2 |goto 49.03,82.68
|tip 在建筑物内。
|only if Horde
step
访问大使馆 |q 66534/3 |goto 38.35,80.42
|tip 在建筑物内。
|only if Horde
step
talk Scalecommander Cindrethresh##184786
|tip 在城市上方的平台上
turnin Ground Leave##66534 |goto 44.01,38.25
|only if Horde
step
talk Ebyssian##190239
|tip 在城市上方的平台上
accept Aspectral Invitation##65437 |goto 44.07,37.98
|only if Horde
step
talk Ebyssian##190239
|tip 在城市上方的平台上
选择 _"<聆听埃博霍恩。>"_ |gossip 55582
与艾比西安交谈 |q 65437/1 |goto 44.07,37.98
|only if Horde
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin Aspectral Invitation##65437 |goto 44.07,37.98
accept An Iconic, Draconic, Look##65613 |goto 44.07,37.98
|only if Horde
step
talk Ebyssian##190239
|tip 在城市上方的平台上
选择一个外形。 |gossip 55863
询问埃比斯关于化身形态的事宜 |q 65613/1 |goto 44.07,37.98
|only if Horde
step
观察对话
|tip 在城市上方的平台上
了解外形形态	|q 65613/2 |goto 44.07,37.98
|only if Horde
step
采纳外形形态 |q 65613/3 |goto 44.07,37.98
|tip 使用 {o}外貌形态{} 能力。
|tip 它在屏幕上显示为一个按钮。
|tip 在城市上方的平台上
|only if Horde
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin An Iconic, Draconic, Look##65613 |goto 44.07,37.98
|only if Horde
step
talk Naleidea Rivergleam##184793
|tip 在城市上方的平台上
accept Expeditionary Coordination##65443 |goto 44.20,37.80
|only if Horde
step
talk Scalecommander Cindrethresh##184786
|tip 在城市上方的平台上
accept The Dark Talons##72256 |goto 44.02,38.25
|only if Horde
step
talk Doras##3310
|tip 在城市上方的平台上
fpath Orgrimmar |goto 49.65,59.21
|only if Horde
step
talk Kodethi##198442
告诉他"先锋指挥官辛德雷斯希望您在飞艇塔见面。" |gossip 107450
将命令交给科德希 |q 72256/1 |goto Durotar/0 54.13,9.86
|only if Horde
step
talk Pathfinder Tacha##184796
问她“我们需要探险者去龙岛进行远征。你愿意加入我们吗？” |gossip 53882
招募探险者 |q 65443/2 |goto Durotar/0 54.01,13.04
|only if Horde
step
talk Boss Magor##184787
问他“我们需要工匠加入前往龙岛的探险，你愿意加入吗？” |gossip 53883
招募工匠 |q 65443/1 |goto Durotar/0 55.17,11.63
|only if Horde
step
talk Cataloger Coralie##184795
问她“我们需要学者参加前往巨龙岛的探险。你愿意加入我们吗？” |gossip 54035
招募学者 |q 65443/3 |goto Durotar/0 55.97,13.22
|only if Horde
step
talk Naleidea Rivergleam##197279
|tip 在塔顶上。
turnin Expeditionary Coordination##65443 |goto Durotar/0 55.81,12.66
turnin The Dark Talons##72256 |goto Durotar/0 55.81,12.66
|only if Horde
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)",{
author="support@zygorguides.com",
},[[
step
所有侦查地图任务完成检测到	|next "All_Scouting_Map_Quests_Complete"
|only if achieved(16363) and completedq(65691) and completedallq(72266,72267,72268,72269)
step
accept The Dragon Isles Await##65436
|tip 你将自动接受这个任务。
|only if Alliance and not (haveq(66589) or completedq(66589))
step
use the Lost Dragonscale##205456
使用失落的龙鳞传送到靠近瓦尔基恩的位置 |q 65436/1
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
在暴风城会见拉希奥 |q 65436/2 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
turnin The Dragon Isles Await##65436 |goto Stormwind City/0 79.80,27.01
accept Aspectral Invitation##66577 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
选择 _"倾听瓦里安与图拉扬的声音。"_
 |gossip 55659
与 wrathion 对话 |q 66577/1 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
turnin Aspectral Invitation##66577 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Scalecommander Azurathel##189603
|tip 在建筑物内。
accept The Obsidian Warders##72240 |goto Stormwind City/0 79.94,26.95
|only if Alliance
step
talk Toddy Whiskers##189602
|tip 在建筑物内。
accept Expeditionary Coordination##66589 |goto Stormwind City/0 79.72,27.33
|only if Alliance
step
talk Dungar Longdrink##352
|tip 在建筑物内。
fpath Stormwind |goto Stormwind City/0 70.94,72.47
|only if Alliance
step
talk Pathfinder Jeb##189763
问他“我们需要勇士组队前往巨龙岛探险。你愿意加入我们吗？” |gossip 55649
招募探险者 |q 66589/2 |goto Stormwind City/0 38.24,45.31
|only if Alliance
step
talk Dervishian##198401
告诉她“规模指挥官阿祖拉塞尔希望你在码头与他会面。” |gossip 107417
将命令交给德尔维西亚 |q 72240/1 |goto Stormwind City/0 39.25,41.40
|only if Alliance
step
talk Thaelin Darkanvil##189767
问他“我们需要工匠加入前往龙岛的探险，你愿意加入吗？” |gossip 55651
招募工匠 |q 66589/1 |goto Stormwind City/0 38.10,35.09
|only if Alliance
step
talk Cataloger Wulferd##189765
问他：“我们需要学者加入前往龙岛的探险。你愿意加入我们吗？” |gossip 55650
招募学者 |q 66589/3 |goto Stormwind City/0 32.89,34.61
|only if Alliance
step
talk Toddy Whiskers##189077
turnin Expeditionary Coordination##66589 |goto Stormwind City/0 22.71,55.66
turnin The Obsidian Warders##72240 |goto Stormwind City/0 22.71,55.66
|only if Alliance
step
观察对话
talk Archmage Khadgar##193450
|tip 他从一个传送门中出现。
accept Whispers on the Winds##66596 |goto 23.01,56.14
|only if Alliance
step
talk Archmage Khadgar##193450
询问卡德加发生了什么 |gossip 55739
与大法师卡德加交谈 |q 66596/1 |goto 23.01,56.14
|only if Alliance
step
talk Wrathion##189569
turnin Whispers on the Winds##66596 |goto 22.94,55.99
|only if Alliance
step
talk Toddy Whiskers##189077
accept To the Dragon Isles!##67700 |goto 22.72,55.67
|only if Alliance
step
在暴风城码头等待坚韧的龙鳞 |q 67700/1 |goto 21.83,56.53
|tip 等待船只到达，然后登船。
|only if Alliance
step
前往龙岛 |complete zone("The Waking Shores") |q 67700
|tip 等待船只启航前往龙岛。
|only if Alliance
step
乘坐粗犷的龙鳞前往龙岛 |q 67700/2 |goto The Waking Shores/0 82.13,31.88
|tip 深入营地。
|only if Alliance
step
观察对话
talk Toddy Whiskers##189022
|tip 她冲向这个地点。
turnin To the Dragon Isles!##67700 |goto 82.13,31.88
accept Explorers in Peril##70122 |goto 82.13,31.88
|only if Alliance
step
talk Scalecommander Azurathel##189035
accept Primal Pests##70123 |goto 82.16,31.85
|only if Alliance
step
talk Thaelin Darkanvil##189021
accept Practice Materials##70124 |goto 82.09,31.88
|only if Alliance
stickystart "Kill_Primal_Proto_Drakes"
stickystart "Collect_Primal_Proto_Whelp_Scales"
step
click Protodragon Rib Cage
拯救科格凯彻教授 |q 70122/1 |goto 83.55,33.60
|only if Alliance
step
clicknpc Archivist Rellid##189055
|tip 他看起来像一个被两只小龙扔来扔去的德莱尼。
拯救档案员雷利德 |q 70122/2 |goto 82.93,36.04
|only if Alliance
step
clicknpc Spelunker Lockeye##189052
拯救洞穴探险者洛克艾 |q 70122/3 |goto 79.50,35.35
|only if Alliance
step
label "Kill_Primal_Proto_Drakes"
kill 10 Primal Proto-Drake##193806 |q 70123/1 |goto 81.66,34.60
|tip 它们看起来像地面和空中飞翔的巨龙。
|only if Alliance
step
label "Collect_Primal_Proto_Whelp_Scales"
kill Primal Proto-Whelp##193876+
|tip 它们看起来像地面上和空中飞翔的小龙。
collect 15 Primal Proto-Whelp Scale##198398 |q 70124/1 |goto 81.66,34.60
|only if Alliance
step
talk Toddy Whiskers##187251
turnin Explorers in Peril##70122 |goto 76.63,33.63
accept Where is Wrathion?##70125 |goto 76.63,33.63
|only if Alliance
step
talk Sendrax##193362
问她“为什么龙没有来见我们？” |gossip 55636
观察对话
询问失踪的巨龙 |q 70125/1 |goto 76.58,33.67
|only if Alliance
step
talk Sendrax##193362
turnin Where is Wrathion?##70125 |goto 76.58,33.67
|tip 你将只能接受其中一个任务。
accept Adventuring in the Dragon Isles##72293 |goto The Waking Shores/0 76.58,33.67 |or
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67 |or
|only if Alliance
step
talk Cataloger Jakes##198846
turnin Dragon Isles Supplies##72708 |goto 76.54,34.24
accept Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Alliance and (haveq(72708) or completedq(72708))
step
talk Cataloger Jakes##198846
buy Archeologist Artifact Notes##198854 |n
从目录员杰克斯处购买考古学家文物笔记 |q 72709/1 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
use the Archeologist Artifact Notes##198854
阅读考古学遗物笔记 |q 72709/2 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
talk Cataloger Jakes##198846
turnin Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
talk Thaelin Darkanvil##189058
turnin Practice Materials##70124 |goto 76.48,34.37
|only if Alliance
step
talk Scalecommander Azurathel##187252
turnin Primal Pests##70123 |goto 76.75,34.41
|only if Alliance
step
talk Captain Garrick##184449
accept Give Peace a Chance##67053 |goto 76.73,34.56
|only if Alliance
step
talk Tixxa Mixxa##192490
fpath Wingrest Embassy |goto 76.03,35.05
|only if Alliance
step
talk Aster Cloudgaze##187257
accept From Such Great Heights##66101 |goto 75.84,33.49
|only if Alliance
step
click Surveyor's Disc
跳上测量员的飞碟 |q 66101/1 |goto 75.90,33.57
|only if Alliance
step
观察对话
|tip 在你的技能栏上使用 {o}寻找力量{} 能力。
寻找力量 |q 66101/2
|only if Alliance
step
观察对话
|tip 在你的动作条上使用{o}寻找盟友{}技能。
寻找盟友 |q 66101/3
|only if Alliance
step
观察对话
|tip 在你的技能条上使用{o}寻找危险{}技能。
寻找危险 |q 66101/4
|only if Alliance
step
talk Aster Cloudgaze##187257
turnin From Such Great Heights##66101 |goto 75.84,33.49
|only if Alliance
step
talk Warlord Breka Grimaxe##184452
turnin Give Peace a Chance##67053 |goto 76.36,33.08
|only if Alliance
step
click Scouting Map
|tip 这看起来像是桌子上的一张大棕色纸质地图。
|tip 你正在选择你希望做任务的区域。
|tip 随你挑选，{o}无所谓{}。
accept The Waking Shores##72266 |goto 76.52,34.23	|or |only if not completedq(72266)
accept Ohn'ahran Plains##72267 |goto 76.52,34.23	|or |only if not completedq(72267)
accept Azure Span##72268 |goto 76.52,34.23		|or |only if not completedq(72268)
accept Thaldraszus##72269 |goto 76.52,34.23		|or |only if not completedq(72269)
从侦查地图选择一个区域 |q 72293/1 |goto 76.52,34.23 |only if haveq(72293)
|only if Alliance and (haveq(72293) or completedq(72293))
step
_Click the Quest Complete Box:_
|tip 在任务追踪器区域。
turnin Adventuring in the Dragon Isles##72293
|only if Alliance and (haveq(72293) or completedq(72293))
step
_Which Zone Did You Choose?_
|tip 点击下面的链接以选择你想完成任务的区域。
觉醒海岸	|confirm	|next "Waking_Shores_Alliance"
奧納蘭平原	|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\奧納蘭平原 (Full Zone)"
碧蓝长廊		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\碧蓝长廊 (Full Zone)"
萨尔德拉苏斯		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\萨尔德拉苏斯 (Full Zone)"
|only if Alliance and (haveq(72293) or completedq(72293))
step
label "Waking_Shores_Alliance"
talk Sendrax##193362
turnin The Waking Shores##72266 |goto The Waking Shores/0 76.58,33.67 |only if haveq(72266) or completedq(72266)
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67
|only if Alliance
step
talk Warlord Breka Grimaxe##184452
accept Encroaching Elementals##70135 |goto 76.36,33.08
|only if Alliance
step
talk Haephesta##192438
accept Quality Assurance##69965 |goto 76.41,34.45
|only if Alliance
step
talk Grun Ashbeard##187261
accept Always Be Crafting##66112 |goto 76.35,34.64
|only if Alliance
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
告诉他“我是龙鳞远征的新成员。” |gossip 55674
与大使法斯特拉兹交谈 |q 69911/1 |goto 76.33,35.62
|only if Alliance
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
home Wingrest Embassy |goto 76.33,35.62 |q 69911 |future
|only if Alliance
step
click Embassy Visitor Log
|tip 在建筑物内。
选择_开始填写表单_ |gossip 55746
选择_"石头头"_ |gossip 64055
选择 _"<写下今天的日期。>"_ |gossip 55767
选择_"为龙族提供帮助"_ |gossip 55768
签署使者访客日志 |q 69911/2 |goto 76.28,35.61
|only if Alliance
step
click Alexstrasza's Welcome
阅读欢迎信息 |q 69911/3 |goto 75.61,34.14
|only if Alliance
step
accept The Dragon Isles Await##65435
|tip 你将自动接受这个任务。
|only if Horde and not (haveq(65443) or completedq(65443))
step
use the Lost Dragonscale##205458
使用失落的龙鳞传送到接近埃比西安的位置 |q 65435/1
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
在奥格瑞玛与艾比西安会面。 |q 65435/2 |goto Orgrimmar/1 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin The Dragon Isles Await##65435 |goto Orgrimmar/1 44.07,37.96
accept Aspectral Invitation##65437 |goto Orgrimmar/1 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
选择 _"<聆听埃博霍恩。>"_ |gossip 55582
与艾比西安交谈 |q 65437/1 |goto 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin Aspectral Invitation##65437 |goto 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Scalecommander Cindrethresh##184786
|tip 在城市上方的平台上
accept The Dark Talons##72256 |goto 44.02,38.25
|only if Horde
step
talk Naleidea Rivergleam##184793
|tip 在城市上方的平台上
accept Expeditionary Coordination##65443 |goto 44.18,37.78
|only if Horde
step
talk Kodethi##198442
告诉他"先锋指挥官辛德雷斯希望您在飞艇塔见面。" |gossip 107450
将命令交给科德希 |q 72256/1 |goto Durotar/0 54.13,9.86
|only if Horde
step
talk Pathfinder Tacha##184796
问她“我们需要探险者去龙岛进行远征。你愿意加入我们吗？” |gossip 53882
招募探险者 |q 65443/2 |goto Durotar/0 54.01,13.04
|only if Horde
step
talk Boss Magor##184787
问他“我们需要工匠加入前往龙岛的探险，你愿意加入吗？” |gossip 53883
招募工匠 |q 65443/1 |goto Durotar/0 55.17,11.63
|only if Horde
step
talk Cataloger Coralie##184795
问她“我们需要学者参加前往巨龙岛的探险。你愿意加入我们吗？” |gossip 54035
招募学者 |q 65443/3 |goto Durotar/0 55.97,13.22
|only if Horde
step
talk Naleidea Rivergleam##197279
|tip 在塔顶上。
turnin Expeditionary Coordination##65443 |goto Durotar/0 55.81,12.66
turnin The Dark Talons##72256 |goto Durotar/0 55.81,12.66
|only if Horde
step
观察对话
talk Archmage Khadgar##193450
|tip 在塔顶上。
|tip 他从一个传送门中出现。
accept Whispers on the Winds##65439 |goto 55.92,12.60
|only if Horde
step
talk Archmage Khadgar##193450
|tip 在塔顶上。
询问卡德加发生了什么 |gossip 55626
与大法师卡德加交谈 |q 65439/1 |goto 55.92,12.60
|only if Horde
step
talk Ebyssian##190239
|tip 在塔顶上。
turnin Whispers on the Winds##65439 |goto 55.84,12.75
|only if Horde
step
talk Naleidea Rivergleam##197279
|tip 在塔顶上。
accept To the Dragon Isles!##65444 |goto 55.81,12.66
|only if Horde
step
在飞艇塔等待反叛者的龙鳞 |q 65444/1 |goto 56.02,13.50
|tip 等待飞艇到达，然后登上飞艇。
|only if Horde
step
前往龙岛 |complete zone("The Waking Shores") |q 65444
|tip 等待飞艇飞往龙岛。
|only if Horde
step
骑上不屈的龙鳞前往龙岛 |q 65444/2 |goto The Waking Shores/0 80.62,27.61
|tip 深入营地。
|only if Horde
step
观察对话
talk Naleidea Rivergleam##184841
|tip 她冲向这个地点。
turnin To the Dragon Isles!##65444 |goto 80.62,27.61
accept Explorers in Peril##65452 |goto 80.62,27.61
|only if Horde
step
talk Scalecommander Cindrethresh##184859
accept Primal Pests##65453 |goto 80.65,27.59
|only if Horde
step
talk Boss Magor##184844
accept Practice Materials##65451 |goto 80.60,27.65
|only if Horde
stickystart "Kill_Primal_Proto_Drakes_Horde"
stickystart "Collect_Primal_Proto_Whelp_Scales_Horde"
step
click Protodragon Rib Cage
救援探路者波比 |q 65452/1 |goto 80.37,26.34
|only if Horde
step
clicknpc Archivist Spearblossom##187157
|tip 他看起来像是被两只小龙在这个区域飞着的牛头人。
救援档案管理员芽花 |q 65452/2 |goto 78.79,24.47
|only if Horde
step
clicknpc Spelunker Lazee##187151
|tip 他看起来像个悬挂在火湖上链子上的哥布林。
拯救探险者拉兹 |q 65452/3 |goto 77.33,29.81
|only if Horde
step
label "Kill_Primal_Proto_Drakes_Horde"
kill 10 Primal Proto-Drake##193806 |q 65453/1 |goto 79.41,26.55
|tip 他们看起来像在地面和空中飞翔的大型龙。
|tip 你可以在荒野海岸地区找到它们。
|only if Horde
step
label "Collect_Primal_Proto_Whelp_Scales_Horde"
kill Primal Proto-Whelp##193876+
|tip 它们看起来像在天空中飞翔的小龙。
|tip 你可以在荒野海岸地区找到它们。
collect 20 Primal Proto-Whelp Scale##198398 |q 65451/1 |goto 79.41,26.55
|only if Horde
step
talk Naleidea Rivergleam##184870
turnin Explorers in Peril##65452 |goto 76.61,33.60
accept Where is Wrathion?##69910 |goto 76.61,33.60
|only if Horde
step
talk Sendrax##193362
问她“为什么龙没有来见我们？” |gossip 55636
观察对话
询问失踪的巨龙 |q 69910/1 |goto 76.58,33.67
|only if Horde
step
talk Sendrax##193362
turnin Where is Wrathion?##70125 |goto 76.58,33.67
|tip 你只能接受其中一个任务。
accept Adventuring in the Dragon Isles##72293 |goto The Waking Shores/0 76.58,33.67 |or
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67 |or
|only if Horde
step
talk Warlord Breka Grimaxe##184452
accept Give Peace a Chance##66110 |goto 76.36,33.08
|only if Horde
step
talk Scalecommander Cindrethresh##187235
turnin Primal Pests##65453 |goto 76.28,33.02
|only if Horde
step
talk Boss Magor##187236
turnin Practice Materials##65451 |goto 75.94,33.24
|only if Horde
step
talk Aster Cloudgaze##187257
accept From Such Great Heights##66101 |goto 75.84,33.49
|only if Horde
step
click Surveyor's Disc
跳上测量员的飞碟 |q 66101/1 |goto 75.90,33.57
|only if Horde
step
观察对话
|tip 在你的技能栏上使用 {o}寻找力量{} 能力。
寻找力量 |q 66101/2
|only if Horde
step
观察对话
|tip 在你的动作条上使用{o}寻找盟友{}技能。
寻找盟友 |q 66101/3
|only if Horde
step
观察对话
|tip 在你的技能条上使用{o}寻找危险{}技能。
寻找危险 |q 66101/4
|only if Horde
step
talk Aster Cloudgaze##187257
turnin From Such Great Heights##66101 |goto 75.84,33.49
|only if Horde
step
talk Cataloger Jakes##198846
turnin Dragon Isles Supplies##72708 |goto 76.54,34.24
accept Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Horde and (haveq(72708) or completedq(72708))
step
talk Cataloger Jakes##198846
buy Archeologist Artifact Notes##198854 |n
从目录员杰克斯处购买考古学家文物笔记 |q 72709/1 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
use the Archeologist Artifact Notes##198854
阅读考古学遗物笔记 |q 72709/2 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
talk Cataloger Jakes##198846
turnin Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
talk Captain Garrick##184449
turnin Give Peace a Chance##66110 |goto 76.73,34.56
|only if Horde
step
talk Tixxa Mixxa##192490
fpath Wingrest Embassy |goto 76.03,35.05
|only if Horde
step
click Scouting Map
|tip 这看起来像是桌子上的一张大棕色纸质地图。
|tip 你正在选择你希望做任务的区域。
|tip 随你挑选，{o}无所谓{}。
accept The Waking Shores##72266		|or |goto 76.52,34.23 |only if not completedq(72266)
accept Ohn'ahran Plains##72267		|or |goto 76.52,34.23 |only if not completedq(72267)
accept Azure Span##72268		|or |goto 76.52,34.23 |only if not completedq(72268)
accept Thaldraszus##72269		|or |goto 76.52,34.23 |only if not completedq(72269)
从侦查地图选择一个区域 |q 72293/1 |goto 76.52,34.23 |only if haveq(72293)
|only if Horde and (haveq(72293) or completedq(72293))
step
_Click the Quest Complete Box:_
|tip 在任务追踪器中。
turnin Adventuring in the Dragon Isles##72293
|only if Horde and (haveq(72293) or completedq(72293))
step
_Which Zone Did You Choose?_
|tip 点击下面的链接以选择你想完成任务的区域。
觉醒海岸	|confirm	|next "Waking_Shores_Horde"
奧納蘭平原	|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\奧納蘭平原 (Full Zone)"
碧蓝长廊		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\碧蓝长廊 (Full Zone)"
萨尔德拉苏斯		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\萨尔德拉苏斯 (Full Zone)"
|only if Horde and (haveq(72293) or completedq(72293))
step
label "Waking_Shores_Horde"
talk Sendrax##193362
turnin The Waking Shores##72266 |goto The Waking Shores/0 76.58,33.67 |only if haveq(72266) or completedq(72266)
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67
|only if Horde
step
talk Captain Garrick##184449
accept Encroaching Elementals##66111 |goto The Waking Shores/0  76.73,34.56
|only if Horde
step
talk Haephesta##192438
accept Quality Assurance##69965 |goto 76.41,34.45
|only if Horde
step
talk Grun Ashbeard##187261
accept Always Be Crafting##66112 |goto 76.35,34.64
|only if Horde
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
告诉他“我是龙鳞远征的新成员。” |gossip 55674
与大使法斯特拉兹交谈 |q 69911/1 |goto 76.33,35.62
|only if Horde
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
home Wingrest Embassy |goto 76.33,35.62 |q 69911 |future
|only if Horde
step
click Embassy Visitor Log
|tip 在建筑物内。
选择_开始填写表单_ |gossip 55746
选择_"石头头"_ |gossip 64055
选择 _"<写下今天的日期。>"_ |gossip 55767
选择_"为龙族提供帮助"_ |gossip 55768
签署使者访客日志 |q 69911/2 |goto 76.28,35.61
|only if Horde
step
talk Tixxa Mixxa##192490
fpath Wingrest Embassy |goto 76.03,35.05
|only if Horde
step
click Alexstrasza's Welcome
阅读欢迎信息 |q 69911/3 |goto 75.61,34.14
|only if Horde
step
click Brazier of Kinship
重燃友谊之炉 |q 69911/4 |goto The Waking Shores/0 78.42,31.78
step
talk Sendrax##193362
turnin Excuse the Mess##69911 |goto 76.58,33.67
accept My First Real Emergency!##69912 |goto 76.58,33.67
step
talk Sendrax##193362
告诉她“发射信号烟火，警告巨龙我们的到来。” |gossip 55637
观察对话
发送信号焰火 |q 69912/1 |goto 76.58,33.67
step
观察对话
等待龙族降临 |q 69912/2 |goto 76.26,34.40
step
talk Wrathion##193371
turnin My First Real Emergency!##69912 |goto 76.19,34.50
step
talk Majordomo Selistra##193372
accept The Djaradin Have Awoken##69914 |goto 76.22,34.53
step
talk Majordomo Selistra##193372
问她“我该如何帮助抵御达贾拉丁？” |gossip 55872
观察对话
接受马乔多莫·塞莉斯特拉的命令 |q 69914/1 |goto 76.22,34.53
step
talk Sendrax##193363
turnin The Djaradin Have Awoken##69914 |goto 76.26,34.40
accept Reporting for Duty##65760 |goto 76.26,34.40
stickystart "Excavate_Volcanic_Geodes"
stickystart "Slay_Primal_Elementals"
step
进入洞穴 |goto 75.78,37.03 < 15 |walk |only if not subzone("Quaking Cavern")
kill Baron Crustcore##192266
|tip 地下洞穴内
collect Primal Earthen Core##190386 |q 66112/2 |goto 74.91,39.29
step
沿着路径向上走，离开洞穴。 |goto 75.78,37.03 < 15 |walk |only if subzone("Quaking Cavern")
kill Baron Ashflow##192274
collect Primal Molten Core##194548 |q 66112/1 |goto 72.91,32.98
step
label "Excavate_Volcanic_Geodes"
click Volcanic Geode+
|tip 它们看起来像大灰色石头。
挖掘 #6# 火山晶石 |q 69965/1 |goto 74.68,36.13
step
label "Slay_Primal_Elementals"
在此区域消灭元素敌人
击杀15个原始元素生物 |q 70135/1 |goto 74.68,36.13 |only if haveq(70135) or completedq(70135)
击杀15个原始元素生物 |q 66111/1 |goto 74.68,36.13 |only if haveq(66111) or completedq(66111)
'|kill Encroaching Lava##187326, Primal Lava Elemental##187321, Primal Earth Elemental##187322
step
talk Warlord Breka Grimaxe##184452
turnin Encroaching Elementals##70135 |goto 76.36,33.08
|only if haveq(70135) or completedq(70135)
step
talk Captain Garrick##184449
turnin Encroaching Elementals##66111 |goto 76.73,34.55
|only if haveq(66111) or completedq(66111)
step
talk Haephesta##192438
turnin Quality Assurance##69965 |goto 76.41,34.45
step
talk Grun Ashbeard##187261
turnin Always Be Crafting##66112 |goto 76.35,34.64
step
talk Sendrax##193363
告诉她“引领我去龙心哨站。” |gossip 55900
请问辛德拉克斯带你去前哨站 |q 65760/1 |goto 76.26,34.40
step
观察对话
|tip 跟随{o}Sendrax{}前行。
|tip 她最终走到了这个坐标。
跟随赛德拉克前往前哨站 |q 65760/2 |goto 71.25,40.67
'|clicknpc Sendrax##191807
step
talk Commander Lethanak##186584
turnin Reporting for Duty##65760 |goto 71.20,40.77
accept Invader Djaradin##65989 |goto 71.20,40.77
accept Deliver Whelps From Evil##65990 |goto 71.20,40.77
stickystart "Slay_Djaradin"
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 在建筑后面
拯救呜咽的幼龙 |q 65990/1 |goto 71.36,44.64 |count 1
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 楼上建筑内
拯救呜咽的幼龙 |q 65990/1 |goto 70.97,46.63 |count 2
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
拯救呜咽的幼龙 |q 65990/1 |goto 69.86,45.30 |count 3
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 它在这个区域的空中飞翔。
拯救呜咽的幼龙 |q 65990/1 |goto 69.35,43.36 |count 4
step
label "Slay_Djaradin"
击杀这个区域周围的Qalashi敌人
击杀 #6# 达贾拉丁 |q 65989/1 |goto 70.37,44.87
'|kill Qalashi Scavenger##191833, Qalashi Djaradin##188296
step
talk Commander Lethanak##186584
turnin Invader Djaradin##65989 |goto 71.20,40.78
turnin Deliver Whelps From Evil##65990 |goto 71.20,40.78
accept Time for a Reckoning##65991 |goto 71.20,40.78
step
talk Mender Eskros##195303
|tip 她在这个区域巡视。
accept Erstwhile Ecologists##72122 |goto 71.22,40.36
step
talk Ecologist Iskha##186410
turnin Erstwhile Ecologists##72122 |goto 74.43,42.14
accept A Scalpel of a Solution##66105 |goto 74.43,42.14
step
talk Ecologist Tharu##186428
accept Wildlife Rescue##66107 |goto 74.51,42.18
stickystart "Kill_Rampaging_Wind"
stickystart "Kill_Rampaging_Water"
step
click Various Animal+
|tip 他们看起来像各种动物。
拯救#20#野生生物 |q 66107/1 |goto 76.32,46.68
你可以在[80.46,48.71]附近找到更多。
'|clicknpc Disgruntled Riverbeast Matriarch##187620, Distressed Riverbeast Calf##187462, Helpless Waterfowl##187468, Frazzled Basilisk##190249, Cowering Crab##188266, Trapped Turtle Hatchling##187471, Trapped Sea Turtle##187469
step
label "Kill_Rampaging_Water"
kill 5 Rampaging Water##187493 |q 66105/1 |goto 77.52,47.25
|tip 它们看起来像水元素。
step
label "Kill_Rampaging_Wind"
kill 5 Rampaging Wind##187494 |q 66105/2 |goto 77.52,47.25
|tip 它们看起来像空灵元素。
step
talk Ecologist Tharu##186428
turnin Wildlife Rescue##66107 |goto 74.51,42.18
step
talk Ecologist Iskha##186410
turnin A Scalpel of a Solution##66105 |goto 74.43,42.14
accept Forensic Ecology##66104 |goto 74.43,42.14
step
click Windyfin Gorloc Corpse
观察对话
剖析风鳍戈洛克尸体 |q 66104/2 |goto 74.47,42.20
step
click Soggymaw Gorloc Corpse
观察对话
剖析湿吞怪尸体 |q 66104/1 |goto 74.46,42.21
step
click Viscera-Covered Shells
审视闪亮的外壳 |q 66104/3 |goto 74.47,42.19
step
talk Ecologist Iskha##186410
turnin Forensic Ecology##66104 |goto 74.42,42.14
accept A Sledgehammer of a Solution##66108 |goto 74.42,42.14
step
talk Ecologist Tharu##186428
accept Don't Be So Shellfish##66106 |goto 74.51,42.17
stickystart "Collect_Wind_Infused_Shells"
stickystart "Collect_Water_Infused_Shells"
step
talk Bubbled Duckling##187439
accept A Quack For Help##66196 |goto 80.12,42.87
step
kill Sogglmoggl##188859 |q 66108/1 |goto 80.07,44.02
|tip 他看起来像一个在水元素里的哥布林。
step
kill Whirglgurgl##188860 |q 66108/2 |goto 79.79,39.85
|tip 他看起来像一个骑在空气元素上的小精灵。
|tip 悬崖上
step
label "Collect_Wind_Infused_Shells"
在该地区消灭风怒芬敌人
|tip 他们看起来像小鬼。
|tip 它们大多可以在这个区域的悬崖顶端找到。
click Pile of Wind-Infused Shells+
|tip 它们看起来像一堆大块暗色的蜗牛壳。
collect 15 Wind-Infused Shell##191546 |q 66106/1 |goto 81.05,42.63
'|kill Windyfin Squallstalker##187433, Windyfin Windbringer##187432, Windyfin Skybasher##187431
step
label "Collect_Water_Infused_Shells"
击杀此区域内的潮湿之口敌人
|tip 他们看起来像小鬼。
click Pile of Water-Infused Shells+
|tip 它们看起来像一堆大块暗色的蜗牛壳。
collect 15 Water-Infused Shell##191549 |q 66106/2 |goto 79.99,43.03
'|kill Soggymaw Seabasher##187320, Soggymaw Crabtrapper##187971, Soggymaw Wavebringer##187263
step
将泡泡小鸭带到生态学家的营地 |q 66196/1 |goto 74.51,42.17
step
talk Ecologist Tharu##186428
turnin Don't Be So Shellfish##66106 |goto 74.51,42.17
turnin A Quack For Help##66196 |goto 74.51,42.17
step
talk Ecologist Iskha##186410
turnin A Sledgehammer of a Solution##66108 |goto 74.43,42.14
step
在破碎山堡与拉瑟隆会面 |q 65991/1 |goto 66.49,34.42
|tip 在建筑物顶部
step
talk Wrathion##186640
|tip 他飞下并降落在建筑物顶部。
turnin Time for a Reckoning##65991 |goto 66.36,35.00
accept Killjoy##65993 |goto 66.36,35.00
accept Blacktalon Intel##65992 |goto 66.36,35.00
step
talk Right##190564
问她 "你对达尔达尼有什么观察？" |gossip 55298
咨询权杖 |q 65992/3 |goto 65.10,29.35
step
kill Meatgrinder Sotok##186777 |q 65993/1 |goto 62.94,29.43
collect Qalashi Plans##193874 |n
accept The Obsidian Citadel##65995 |goto 62.94,29.43
step
talk Left##190563
问她 "你对达尔达尼有什么观察？" |gossip 55296
咨询左侧 |q 65992/2 |goto 63.43,28.87
step
talk Talonstalker Kavia##188299
问她 "你对达尔达尼有什么观察？" |gossip 55335
咨询爪斗者卡维亚 |q 65992/1 |goto 63.04,33.34
step
talk Wrathion##194772
|tip 在建筑物顶部
turnin Killjoy##65993 |goto 62.64,33.17
turnin Blacktalon Intel##65992 |goto 62.64,33.17
turnin The Obsidian Citadel##65995 |goto 62.64,33.17
step
talk Majordomo Selistra##186767
|tip 在建筑物顶部
accept Veteran Reinforcements##65996 |goto 62.75,33.10
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 60.98,35.63 |count 1
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 61.10,36.77 |count 2
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 59.04,34.84 |count 3
step
talk Caretaker Ventraz##188297
accept Fighting Fire with... Water##66998 |goto 59.10,34.85
step
use the Bottled Water Elemental##194441
|tip 这将召唤一个水元素来帮助你战斗。
|tip 如果你已经有了水元素，重新使用它，以完全恢复你的元素。
kill Erupting Droplet##191983+
|tip 它们看起来像橙色熔岩软泥怪。
|tip 洞内与洞外
控制喷发的洞穴 |q 66998/1 |goto 59.15,34.03
step
talk Caretaker Ventraz##188297
turnin Fighting Fire with... Water##66998 |goto 59.10,34.85
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 56.64,34.77 |count 4
step
在温室前哨与森卓克斯会面 |q 65996/2 |goto 54.99,30.77
step
talk Caretaker Azkra##190155
turnin Veteran Reinforcements##65996 |goto 54.99,30.77
accept Chasing Sendrax##65997 |goto 54.99,30.77
step
talk Sendrax##187406
|tip 雕像背后
问她“这里发生了什么？” |gossip 55225
寻找塞德拉克 |q 65997/1 |goto 55.18,24.96
step
talk Sendrax##187406
turnin Chasing Sendrax##65997 |goto 55.18,24.95
accept Future of the Flights##65998 |goto 55.18,24.95
accept Red in Tooth and Claw##65999 |goto 55.18,24.95
step
click On the Origin of Draconic Species
accept Library of Alexstrasza##66000 |goto 55.26,24.69
stickystart "Slay_Primalist_Forces"
step
click Dracuixote
|tip 看起来像是书架上的一本魔法书。
|tip 在建筑物内。
拯救法术书 |q 66000/1 |goto 53.47,22.00 |count 1
step
click The Scales of Wrath
|tip 看起来像是书架上的一本{o}打开的书{}。
|tip 在建筑物内。
拯救法术书 |q 66000/1 |goto 53.36,22.39 |count 2
step
寻找注能龙蛋 |q 65998/1 |goto 55.18,22.72
|tip 在{o}红宝石龙蛋{}旁边跑。
|tip 它们看起来像一群大型、红色、尖刺的蛋。
|tip 蛋将{o}破裂{}，三个敌人将{o}攻击你{}。
stickystart "Kill_Infused_Ruby_Whelplings"
step
click Pride and Protodrakes
|tip 它看起来像是火堆旁的一本魔法书。
|tip 建筑内部，一楼。
拯救法术书 |q 66000/1 |goto 54.63,20.36 |count 3
step
click The Lord of the Wings
|tip 看起来像一本放在地上的开放之书。
|tip 在建筑内部，顶层。
拯救法术书 |q 66000/1 |goto 54.60,20.62 |count 4
step
label "Kill_Infused_Ruby_Whelplings"
kill 9 Infused Ruby Whelpling##186822 |q 65998/2 |goto 56.38,23.31
|tip 在{o}红宝石龙蛋{}旁边跑。
|tip 它们看起来像一群大型、红色、尖刺的蛋。
|tip 蛋将{o}破裂{}，三个敌人将{o}攻击你{}。
step
label "Slay_Primalist_Forces"
在该区域击杀敌人
击败15个原始者势力 |q 65999/1 |goto 56.38,23.31
'|kill Primal Revenant##195917, Molten Primalist##186825, Swelling Fire Elemental##188667, Lavacaller Primalist##186823, Unleashed Lavaburst##188666, Primal Tarasek##188372, Tarasek Elementalist##190080, Firava the Rekindler##195915
step
_Next to you:_
talk Sendrax
turnin Future of the Flights##65998
turnin Red in Tooth and Claw##65999
turnin Library of Alexstrasza##66000
accept A Last Hope##66001
step
talk Sendrax##190269
告诉她“我已准备好。” |gossip 55259
在仪式地点与塞德拉克会面 |q 66001/1 |goto 56.24,22.07
step
观察对话
click Infused Dragon Egg
|tip 在索尔迦斯告诉你时点击它。
拾取注能龙蛋 |q 66001/2 |goto 56.92,21.61
step
_NOTE:_
在下一步中
|tip 你将携带{o}注入的龙蛋{}。
|tip 只是跑，不要停下与敌人或其他事情战斗。
|tip 如果你做任何事情，比如打怪、吃东西、喝水或使用药水等，你将会把蛋掉在地上。
|tip 确保如果做任何会让你掉落蛋的事情，记得到处捡回蛋。
点击此处继续 |confirm |q 66001
step
护蛋归巢 |q 66001/3 |goto 54.99,30.77
|tip 你正在携带 {o}注能的龙蛋{}。
|tip 只是跑，不要停下与敌人或其他事情战斗。
|tip 如果你做任何事情，比如打怪、吃东西、喝水或使用药水等，你将会把蛋掉在地上。
|tip 确保如果做任何会让你掉落蛋的事情，记得到处捡回蛋。
step
talk Apprentice Caretaker Zefren##194525
accept A Two for One Deal##70179 |goto 54.44,30.85
step
在此区域消灭元素敌人
|tip 它们看起来像各种岩石元素生物。
|tip 你可以在下面的山谷中找到更多。
collect 10 Building Materials##198511 |q 70179/1 |goto 51.56,31.65
'|kill Raging Elemental##194523, Earthshatter Elemental##194524, Crushing Elemental##194517
step
talk Apprentice Caretaker Zefren##194525
turnin A Two for One Deal##70179 |goto 54.44,30.85
step
talk Majordomo Selistra##186795
turnin A Last Hope##66001 |goto 55.09,31.01
accept For the Benefit of the Queen##66114 |goto 55.09,31.01
step
talk Majordomo Selistra##186795
告诉她"请带我去见女王。" |gossip 54941
开始与大领主塞莉斯特飞行 |havebuff Majordomo's Wild Ride##376478 |goto 55.09,31.01 |q 66114
step
观察对话
与大法师塞莉丝特拉一同乘坐前往红宝石生命圣坛 |q 66114/1 |goto 62.26,72.88 |notravel
step
talk Alexstrasza the Life-Binder##187290
将被救的蛋献给女王阿莱克丝塔萨。 |gossip 107094
展示女王艾瑞达斯之注满的蛋 |q 66114/2 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##187290
turnin For the Benefit of the Queen##66114 |goto 62.34,73.02
accept The Mandate of the Red##66115 |goto 62.34,73.02
accept Dragonriding##68795 |goto 62.34,73.02
step
talk Lifecaller Tzadrak##191025
accept A Ruby Lifecalling##66825 |goto 61.90,73.82
step
click Gardener's Trusty Rake
|tip 这看起来像是一把长柄园艺工具。
|tip 在桌子上。
选择一个使命 |q 66825/1 |goto 61.85,73.78 |count 1
step
观察对话
click Reinforced Hornstrider Lasso
|tip 看起来像一根绳索卷。
|tip 在桌子上。
选择一个使命 |q 66825/1 |goto 61.85,73.81 |count 2
step
观察对话
click Whelptender's Watering Can
|tip 这看起来像个有长喷嘴的铁锅。
|tip 在桌子上。
选择一个使命 |q 66825/1 |goto 61.85,73.85 |count 3
step
观察对话
click Shimmery Jar of Fireflies
|tip 这看起来像一个装有蓝色药水的小玻璃瓶。
|tip 在桌子上。
选择一个使命 |q 66825/1 |goto 61.85,73.87 |count 4
step
talk Lifecaller Tzadrak##191025
turnin A Ruby Lifecalling##66825 |goto 61.90,73.82
step
talk Vaeros##191174
accept Nursery Direction##66997 |goto 61.82,73.58
step
talk Akora##191012
accept Garden Party##70351 |goto 61.74,73.70
step
talk Dazakros##191176
accept Hornstrider Havoc##66879 |goto 61.73,73.76
step
talk Xius##189261
问他“你在这里干什么？” |gossip 55288
与希乌斯对话 |q 66115/1 |goto 60.70,74.05
step
talk Akxall##189262
问她“这里为什么有这么少的鸡蛋？” |gossip 55289
与阿克萨尔交谈 |q 66115/2 |goto 59.38,72.42
step
talk Lillistrazsa##193955
accept Friend on the Mend##70058 |goto 59.88,70.37
step
click Glass Bead
|tip 这看起来像一颗彩虹色的宝石。
|tip 在桌子上。
collect Glass Bead##198345 |q 70058/3 |goto 59.80,71.33
step
talk Valdestrasz##193987
问他“你有多余的布料碎片吗？” |gossip 56425
collect Scrap of Fabric##198344 |q 70058/2 |goto 60.31,72.81 |count 1
step
talk Tirastrasza##198605
问她"你有没有多余的布料残片？" |gossip 56428
collect Scrap of Fabric##198344 |q 70058/2 |goto 60.55,73.46 |count 2
step
talk Rathestrasz##193995
问他“你有多余的布料碎片吗？” |gossip 56424
collect Scrap of Fabric##198344 |q 70058/2 |goto 59.93,72.67 |count 3
step
click Soft Ruby Feather+
|tip 它们看起来像红色羽毛。
|tip 在附近的两座水池周围。
collect 5 Soft Ruby Feather##198343 |q 70058/1 |goto 61.39,69.82
step
talk Mahra Treebender##192674
turnin Friend on the Mend##70058 |goto 61.44,70.14
step
talk Mother Elion##185904
问她“如果你没有蛋可以孵化，为什么还留在这里？” |gossip 55258
与母亲艾利昂交谈 |q 66115/3 |goto 61.60,68.70
step
talk Zahkrana##189260
问他“你如何照顾这些蛋？” |gossip 55290
与扎克拉纳交谈 |q 66115/4 |goto 62.77,70.43
step
talk Zahkrana##189260
turnin The Mandate of the Red##66115 |goto 62.77,70.43
step
talk Amella##194174
accept Training Wings##70061 |goto 62.18,70.56
step
clicknpc Ruby Whelpling##193979
|tip 看起来像一只微型的红色幼龙。
选择红宝石幼龙 |q 70061/1 |goto 61.09,71.46
step
开始控制红宝石幼龙 |invehicle |q 70061
stickystart "Kill_Intrusive_Pupstingers"
stickystart "Kill_Agitated_Weedlings"
step
kill Relentless Gust##194159 |q 70061/4 |goto 61.45,71.87
|tip 它们看起来像龙卷风元素。
|tip 在墙上的大型石质平台上。
|tip 使用你的动作条上的技能。
|tip 要瞄准你的技能，面对你想要攻击的小龙。
step
label "Kill_Intrusive_Pupstingers"
kill 6 Intrusive Pupstinger##194142 |q 70061/3 |goto 61.45,71.87
|tip 它们看起来像这个区域周围的飞行虫子。
|tip 使用你的快捷栏上的技能。|不固定
|tip 将你的技能瞄准，面对你想要目标的幼龙。 |不固定
step
label "Kill_Agitated_Weedlings"
kill 12 Agitated Weedling##193994 |q 70061/2 |goto 61.45,71.87
|tip 它们看起来像紫色和绿色的牙齿植物。
|tip 沿着墙上的小平台。
|tip 使用你的快捷栏上的技能。|不固定
|tip 将你的技能瞄准，面对你想要目标的幼龙。 |不固定
step
释放红色幼龙 |outvehicle |q 70061
|tip 你将自动飞回石头平台。
step
talk Haephesta##192498
|tip 在大平台上，俯瞰谷地。
accept Artisan's Courier##67564 |goto 57.93,68.25
step
talk Vaknai##192491
|tip 在大平台上，俯瞰谷地。
fpath Ruby Life Pools |goto 57.80,68.11
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
告诉他“告诉我关于龙骑的事。” |gossip 55643
与安德罗斯爵士交谈，关于龙骑术。 |q 68795/1 |goto 58.37,67.13
step
talk Veritistrasz##194076
|tip 在大平台上，俯瞰谷地。
accept Stay a While##70132 |goto 57.85,66.80
step
与真理之焰同坐 |havebuff Stay a While##384091 |goto 57.85,66.80 |q 70132
|tip 使用{o}暂留一会{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 在大平台上，俯瞰谷地。
step
talk Veritistrasz##194076
|tip 在大平台上，俯瞰谷地。
选择 _<坐下欣赏风景。>_
坐看风景 |q 70132/1 |goto 57.85,66.80
step
观察对话
talk Veritistrasz##194076
|tip 在大平台上，俯瞰谷地。
选择 _<你正在忙。起身离开。>_
|tip 如果你想听故事而不着急，选择其他对话选项，听听他的冒险故事。
聆听维尔提斯特拉斯的故事 |q 70132/2 |goto 57.85,66.80
step
talk Veritistrasz##194076
|tip 在大平台上，俯瞰谷地。
turnin Stay a While##70132 |goto 57.85,66.80
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
|tip 他最终走到了这个点。
turnin Dragonriding##68795 |goto 57.66,66.89
accept How to Glide with Your Dragon##65118 |goto 57.66,66.89
step
use the Renewed Proto-Drake##194034
|tip 这将教会你你的第一个龙骑坐骑。
learnmount Renewed Proto-Drake##368896 |q 65118
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65118
step
穿越第五个环圈 |q 65118/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65118/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How to Glide with Your Dragon##65118 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 65120 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept How To Dive with Your Dragon##65120 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65120
step
穿越第五个环圈 |q 65120/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65120/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How To Dive with Your Dragon##65120 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 65133 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept How to Use Momentum with Your Dragon##65133 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65133
step
穿越第五个环圈 |q 65133/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65133/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How to Use Momentum with Your Dragon##65133 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 68796 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept The Need For Higher Velocities##77345 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 77345
step
穿越第8个法环 |q 77345/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 77345/3 |goto The Waking Shores/0 57.32,59.13
step
talk Celormu##183141
|tip 在巨大平台上。
turnin The Need For Higher Velocities##77345 |goto 57.47,59.11
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 68796 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept The Skytop Observatory##68796 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 你将与 {o}塞洛穆{} 交谈以 {o}开始一场骑龙比赛{}。
|tip 与他交谈后，他将开始倒计时，准备比赛。
|tip 在附近的东北方向寻找一串大型发光符文环。
|tip 你将使用你的龙骑坐骑在每个环中滑翔。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
点击此处继续 |confirm |q 68796
step
观察对话
talk Celormu##198040
|tip 他最终走到了这个点。
|tip 在大平台上，俯瞰谷地。
告诉他我想试试通往天空顶瞭望台的路线。 |gossip 107284
与塞洛穆交谈以开始比赛 |q 68796/1 |goto 57.73,66.72
step
争夺天空顶观星台 |q 68796/2 |goto 57.76,66.75 |notravel
|tip 在附近的东北方向寻找一串大型发光符文环。
|tip 你将使用你的龙骑坐骑在每个环中滑翔。
|tip 按照屏幕上的指示和虚线前往每个圆环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
step
talk Lord Andestrasz##193359
|tip 在山顶上
turnin The Skytop Observatory##68796 |goto 75.18,54.97
accept A New Set of Horns##68797 |goto 75.18,54.97
accept Skyriding Talents and You##68798 |goto The Waking Shores/0 75.18,54.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
与莉瑟拉戈萨交谈 |q 68798/1 |goto 74.57,56.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
告诉她“我准备好了。[开启龙骑技能追踪.]” |gossip 55584
查看与Lithragosa的龙骑技能追踪 |q 68798/2 |goto 74.57,56.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
与利萨格萨学习“飞天技能” |q 68798/3 |goto 74.57,56.97
step
talk Glensera##190839
在天空顶观测站与格伦塞拉会面 |q 68797/1 |goto 74.11,57.93
step
click Rostrum of Transformation
使用变形罗盘 |q 68797/2 |goto 74.03,58.15
step
talk Celormu##193411
与塞洛穆交谈 |q 68798/4 |goto 73.25,52.06
step
talk Azerastrasz##193477
|tip 打开飞行地图。
fpath Skytop Observatory |goto 72.77,51.90
step
talk Lord Andestrasz##193359
turnin A New Set of Horns##68797 |goto 75.18,54.97
turnin Skyriding Talents and You##68798 |goto 75.18,54.97
accept Return to the Ruby Lifeshrine##68799 |goto 75.18,54.97
step
clicknpc Relastrasza##199684
骑乘瑞拉斯塔萨前往天空发射塔 |q 68799/1 |goto 75.02,55.58
step
talk Akora##190866
|tip 在地面上
turnin Garden Party##70351 |goto 60.16,66.43
accept Flowers of our Labor##66827 |goto 60.16,66.43
stickystart "Gather_Seed_Pods"
stickystart "Gather_Fragrant_Dragonflowers"
step
use the Trusty Dragonkin Rake##193826
|tip 在{o}成熟龙果{}上使用它。
|tip 它们看起来像是枝头上挂着的大红绿球茎，树木的叶子是红色的。
|tip 他们将倒下。
clicknpc Ripened Dragonfruit##191296+
采集 #5# 成熟的龙果 |q 66827/2 |goto 59.85,65.11
step
label "Gather_Seed_Pods"
click Lush Seed Pod+
|tip 它们看起来像地上的大型棕色种子。
采集#5#丰饶种荚 |q 66827/3 |goto 59.85,65.11
step
label "Gather_Fragrant_Dragonflowers"
click Fragrant Dragonflower+
|tip 它们看起来像短小的植物，带有桃色的花瓣。
|tip 他们会对你发起攻势。
收集#5#芳香龙花 |q 66827/1 |goto 59.85,65.11
step
clicknpc Seed Basket##191293
观察对话
献上丰饶种子荚 |q 66827/6 |goto 60.30,66.47
step
clicknpc Fruit Basket##191281
观察对话
送上成熟的龙果 |q 66827/5 |goto 60.28,66.54
step
clicknpc Flower Basket##191292
观察对话
献上芬芳的龙花 |q 66827/4 |goto 60.28,66.62
step
talk Akora##190866
turnin Flowers of our Labor##66827 |goto 60.16,66.42
step
talk Keshki##190868
accept Huddle at the Hollow##66828 |goto 60.19,66.39
step
talk Majordomo Selistra##191768
turnin Training Wings##70061 |goto 62.32,72.90
step
talk Alexstrasza the Life-Binder##187290
|tip 在红宝石生命圣坛的顶端。
turnin Return to the Ruby Lifeshrine##68799 |goto 62.34,73.02
accept Who Brought the Ruckus?##66931 |goto 62.34,73.02
step
talk Thomas Bright##192574
turnin Artisan's Courier##67564 |goto 60.23,72.18
accept A Gift for Miguel##67100 |goto 60.23,72.18
step
talk Thomas Bright##192574
问他“高品质”是什么意思 |gossip 55059
问他“你想给米格尔什么？” |gossip 55062
告诉他“我会为你寻找这些。” |gossip 55066
与托马斯谈论品质 |q 67100/1 |goto 60.23,72.18
step
发现骚动 |q 66931/1 |goto 59.44,72.83
step
talk Majordomo Selistra##190293
turnin Who Brought the Ruckus?##66931 |goto 59.51,72.63
accept The Primary Threat##66116 |goto 59.51,72.63
step
向指挥官雷萨纳克报告 |q 66116/2 |goto 59.41,75.88
|tip 在冰冷的土地上。
step
talk Commander Lethanak##187119
turnin The Primary Threat##66116 |goto 59.41,75.88
accept Basalt Assault##66118 |goto 59.41,75.88
step
kill 4 Enraged Cliff##187090 |q 66118/1 |goto 60.28,78.54
|tip 它们看起来像大型岩石元素。
你可以在[57.76,76.66]附近找到更多。
step
talk Commander Lethanak##187119
turnin Basalt Assault##66118 |goto 59.41,75.87
accept Proto-Fight##66122 |goto 59.41,75.87
step
talk Majordomo Selistra##187129
accept Egg Evac##66121 |goto 59.48,76.14
stickystart "Slay_Proto_Dragons"
step
click Bronze Egg
|tip 这看起来像一枚大型黄色尖刺龙蛋。
救援青铜之蛋 |q 66121/1 |goto 56.14,81.30
step
click Ruby Egg
|tip 这看起来像一个巨大的红色尖刺龙蛋。
拯救红宝石蛋 |q 66121/4 |goto 54.99,80.95
step
click Emerald Egg
|tip 它看起来像一个大型绿色尖刺龙蛋。
拯救翡翠之蛋 |q 66121/3 |goto 55.32,83.30
step
click Azure Egg
|tip 这看起来像一个大型蓝色尖刺龙蛋。
拯救蓝色蛋 |q 66121/2 |goto 57.35,83.28
step
label "Slay_Proto_Dragons"
use the Ruby Spear##192436
|tip 对{o}原型龙{}使用它。
|tip 它们看起来像地面和空中飞翔的巨龙。
|tip 他们是精英，但用长矛对付他们会让他们更容易被击杀。
击杀#3#原始龙 |q 66122/2 |goto 55.59,81.86
'|clicknpc Rumbling Proto-Dragon##187212, Galestrike Proto-Dragon##187211
step
talk Majordomo Selistra##191895
turnin Proto-Fight##66122 |goto 53.68,80.17
turnin Egg Evac##66121 |goto 53.68,80.17
accept Cut Off the Head##66123 |goto 53.68,80.17
step
use Ruby Spear##192436
|tip 对{o}贾兹基特{}使用它。
|tip 他看起来像一只巨大的蓝色冰晶龙。
|tip 他是精英，但用长矛对付他让他更容易被击杀。
kill Jadzigeth##188447 |q 66123/1 |goto 53.68,82.95
step
talk Majordomo Selistra##191895
turnin Cut Off the Head##66123 |goto 53.68,80.17
accept Exeunt, Triumphant##66124 |goto 53.68,80.17
step
观察对话
talk Majordomo Selistra##187278
|tip 他飞往这个地点。
和大总管汇报。 |gossip 107159
去野生孵化场与大管家塞利斯特交谈 |q 66124/1 |goto 46.14,78.53
step
talk Majordomo Selistra##187278
turnin Exeunt, Triumphant##66124 |goto 46.14,78.53
step
talk Alexstrasza the Life-Binder##187115
accept Wrathion Awaits##66079 |goto 46.09,78.29
step
if not haveq(66524) and not completedq(66524)
talk Hauler Bennet##191698
accept Out For Delivery##66963 |goto 48.48,78.85
step
talk Cataloger Wulferd##187705
turnin Out For Delivery##66963 |goto 48.49,82.67
accept Amateur Protography##66524 |goto 48.49,82.67
step
talk Naleidea Rivergleam##186869
accept Orientation: Dragonscale Basecamp##72397 |goto 47.88,82.41
step
talk Rae'ana##188265
与学者供给者会面 |q 72397/1 |goto 47.92,82.08
step
talk Art Raskins##192843
fpath Dragonscale Basecamp |goto 47.91,83.32
step
talk Maribeth##187399
home Dragonscale Basecamp |goto 47.75,83.25 |q 72397
step
talk Granpap Whiskers##187408
见面目录商人 |q 72397/2 |goto 47.73,83.23
step
talk Pathfinder Jeb##187700
探险者供应商见面会 |q 72397/3 |goto 47.33,83.40
step
talk Boss Magor##189065
见工匠供应商 |q 72397/4 |goto 46.94,82.89
step
talk Cataloger Jakes##189226
|tip 在建筑物内。
会见声望守护者 |q 72397/5 |goto 47.11,82.57
step
talk Toddy Whiskers##187276
|tip 在建筑物内。
turnin Orientation: Dragonscale Basecamp##72397 |goto 47.22,82.73
step
talk Iyali##193500
accept Behavior Analysis "Homework"##69897 |goto 45.91,81.45
accept Scientific Meat-thod##69898 |goto 45.91,81.45
step
kill Pudgy Riverbeast##196017+
|tip 他们在这个区域看起来像大型河马。
collect Extra-Delicious Riverbeast Meat##194564 |q 69898/1 |goto 47.62,76.82
step
use Wulferd's Award-Winning Camera##192465
|tip 站在附近，使用你的动作条上的{o}目录{}技能，同时{o}注视着乐观的小龙{}，在它跳起来准备飞行时。
|tip 看起来像小龙。
|tip 如果这里没有它，要么尝试拍摄它在附近飞翔的画面，要么等待它跑回来这个位置。
拍摄一只乐观的小龙学习飞行 |q 66524/2 |goto 44.86,78.02
step
use Wulferd's Award-Winning Camera##192465
|tip 靠近并在你的动作条上使用{o}目录{}技能，同时{o}看着一只饥饿的原始龙{}当它在{o}水边{}时。
|tip 看起来是一只大型红色龙在这个位置飞 xuống 水面。
|tip 在抓到鱼后拍照。
|tip 你可能需要耐心等待。
拍摄一只饥饿的原始巨龙捕捉鱼类 |q 66524/3 |goto 43.89,78.68
step
clicknpc Sleeping Whelp##196073
抚摸沉睡的小龙幼崽 |q 69897/1 |goto 42.55,79.36 |count 1
step
clicknpc Sleeping Whelp##196073
抚摸沉睡的小龙幼崽 |q 69897/1 |goto 42.40,82.57 |count 2
step
use Wulferd's Award-Winning Camera##192465
|tip 站在旁边，使用你的动作条上的{o}目录{}技能，同时注视着原始龙蛋{}。
|tip 看起来像一个巨大的灰色尖刺龙蛋。
|tip 在地面上，靠近水边。
拍摄原始龙蛋 |q 66524/1 |goto 43.43,82.80
step
clicknpc Sleeping Whelp##196073
抚摸沉睡的小龙幼崽 |q 69897/1 |goto 43.53,84.96 |count 3
step
talk Iyali##193500
选择 _"<报告龙崽行为。>"_ |gossip 55294
告诉_“一只幼龙喜欢被抚摸。”_ |gossip 106987
选择 _"<报告更多龙崽行为。>"_ |gossip 106990
一只幼龙咬了我然后飞走了。 |gossip 106988
完成报告 |gossip 107710
向伊雅丽报告 |q 69897/2 |goto 45.91,81.44
step
talk Iyali##193500
turnin Behavior Analysis "Homework"##69897 |goto 45.91,81.44
turnin Scientific Meat-thod##69898 |goto 45.91,81.44
accept Secret Research##69899 |goto 45.91,81.44
step
观察对话
倾听伊亚利 |q 69899/1 |goto 45.91,81.45
step
click Explorer's Crate
打开箱子 |q 69899/2 |goto 45.91,81.45
step
观察对话
监管小队 |q 69899/3 |goto 45.96,81.44
step
talk Iyali##193500
告诉她“这个生物受伤太重了。我们需要一个研究者来帮忙。” |gossip 107291
选择 _"同意伊亚莉的条款。"_ |gossip 107292
观察对话
说服伊雅莉接受帮助 |q 69899/4 |goto 45.91,81.42
step
talk Tyrgon##192298
turnin Secret Research##69899 |goto 45.95,81.49
accept Identifying the Source##69900 |goto 45.95,81.49
accept Bring In the Expert##69901 |goto 45.95,81.49
step
kill Trakhan##193783 |q 69900/1 |goto 44.52,80.37
step
click Sunlight Flower
|tip 这看起来像是一棵小绿植，开着橙色花朵。
|tip 悬崖之巅
|tip 注意附近的精英敌人。
收集阳光花 |q 69901/1 |goto 43.46,83.03 |count 1
step
click Sunlight Flower
|tip 这看起来像是一棵小绿植，开着橙色花朵。
|tip 悬崖之巅
|tip 注意附近的精英敌人。
收集阳光花 |q 69901/1 |goto 43.04,79.44 |count 2
step
click Sunlight Flower
|tip 这看起来像是一棵小绿植，开着橙色花朵。
|tip 悬崖边缘
收集阳光花 |q 69901/1 |goto 42.05,77.61 |count 3
step
click Sunlight Flower
|tip 这看起来像是一棵小绿植，开着橙色花朵。
收集阳光花 |q 69901/1 |goto 40.56,80.03 |count 4
step
click Sunlight Flower
|tip 这看起来像是一棵小绿植，开着橙色花朵。
|tip 悬崖之巅
收集阳光花 |q 69901/1 |goto 38.67,82.27 |count 5
step
talk Cataloger Wulferd##193740
turnin Amateur Protography##66524 |goto 39.02,83.24
accept Competitive Protography##66525 |goto 39.02,83.24
step
talk Dervishian##193954
accept Preserving the Wilds##66526 |goto 39.09,83.27
stickystart "Free_Proto_Whelps_Or_Proto_Drakes"
step
use Wulferd's Award-Winning Camera##192465
|tip 在查看注能原始龙时，使用技能栏上的{o}目录{}技能。
|tip 看起来像是一只在附近盘旋的大灰龙。
拍摄一只充能原始龙龙。 |q 66525/2 |goto 39.66,84.37
step
use Wulferd's Award-Winning Camera##192465
|tip 站在附近，使用你的行动条上的{o}目录{}技能，同时观察被注能的原始龙蛋{}。
|tip 它们看起来像大型黑白色的刺龙蛋。
拍摄一个注能的原始龙蛋 |q 66525/1 |goto 40.62,85.23
step
label "Free_Proto_Whelps_Or_Proto_Drakes"
在此区域击杀原始主义者敌人
释放 #5# 原始幼龙或原始飞龙 |q 66526/1 |goto 40.62,85.23
你可以在以下地点找到更多： |notinsticky
[38.54,81.19]
[40.43,78.80]
'|kill Earthbound Primalist##193795, Windborne Primalist##189485
step
talk Dervishian##193954
turnin Preserving the Wilds##66526 |goto 39.09,83.27
step
talk Cataloger Wulferd##193740
turnin Competitive Protography##66525 |goto 39.02,83.24
accept Professional Protography##66527 |goto 39.02,83.24
step
跳跃垂直增强装置 |q 66527/1 |goto 38.94,83.39
|tip 走上那个巨大的钢铁弹簧。
|tip 你将被弹射到柱子的顶部。
step
use Wulferd's Award-Winning Camera##192465
|tip 在你查看附近的沉睡原龙时，使用动作条上的目录能力。
|tip 看起来是一只巨大的龙在沉睡。
|tip 在支柱之巅。
|tip 龙会在你拍完照片后将你从柱子上打下来。
拍摄沉睡的原始巨龙 |q 66527/2 |goto 38.77,84.04
step
talk Cataloger Wulferd##193740
turnin Professional Protography##66527 |goto 39.02,83.23
step
talk Dervishian##193954
accept King Without a Crown##66528 |goto 39.09,83.27
step
click Proto-Dragon Charred Foreclaw##378979
调查焦灼前爪 |q 66528/2 |goto 38.84,83.49
step
click Proto-Dragon Severed Spine##379001
调查断脊之事 |q 66528/1 |goto 39.14,83.94
step
click Proto-Dragon Cracked Rib##378998
调查裂开的肋骨 |q 66528/3 |goto 39.39,84.03
step
talk Dervishian##193954
turnin King Without a Crown##66528 |goto 39.09,83.27
accept A Thousand Words##66529 |goto 39.09,83.27
step
观察对话
|tip 德尔维希安走到这个位置。
use Wulferd's Award-Winning Camera##192465
|tip 在你查看德尔维希安时，使用你的动作条上的{o}目录{}技能，德尔维希安就站在附近的龙骨旁边。
拍摄德尔维希安在原始巨龙骨架附近 |q 66529/1 |goto 38.72,83.69
step
talk Dervishian##189484
turnin A Thousand Words##66529 |goto 38.72,83.69
step
talk Tyrgon##192298
turnin Identifying the Source##69900 |goto 45.95,81.49
turnin Bring In the Expert##69901 |goto 45.95,81.49
accept Theory in Practice##69902 |goto 45.95,81.49
step
clicknpc Injured Proto-Whelpling##193547
观察对话
善待小龙 |q 69902/1 |goto 45.91,81.45
step
talk Tyrgon##192298
选择 _"<名字原型龙幼崽>"_ |gossip 107424
选择_火焰咯咯大领主_ |gossip 107419
命名小龙宝宝 |q 69902/2 |goto 45.95,81.49
step
talk Tyrgon##192298
turnin Theory in Practice##69902 |goto 45.95,81.49
step
talk Scout Kuvaeth##190273
accept Disastrous Detour##69896 |goto 63.58,61.77
step
talk Tallevia Mistsong##192484
fpath Life Vault Ruins |goto 65.03,57.36
step
talk Elementalist Taiyang##188735
turnin Disastrous Detour##69896 |goto 66.06,58.13
accept Site Salvage##66435 |goto 66.06,58.13
accept Unearthed Troublemakers##66436 |goto 66.06,58.13
stickystart "Accept_A_Key_Element"
stickystart "Slay_Earth_Elementals"
step
talk Beleaguered Explorer##189089
告诉他去保险库。你在那儿会安全的。 |gossip 54942
拯救探险者 |q 66435/1 |goto 67.16,58.31 |count 1
step
talk Beleaguered Explorer##189089
告诉他去保险库。你在那儿会安全的。 |gossip 54942
拯救探险者 |q 66435/1 |goto 67.51,59.62 |count 2
step
talk Beleaguered Explorer##189089
|tip 在破碎的建筑内。
告诉他去保险库。你在那儿会安全的。 |gossip 54942
拯救探险者 |q 66435/1 |goto 67.92,58.82 |count 3
step
talk Beleaguered Explorer##189089
告诉他去保险库。你在那儿会安全的。 |gossip 54942
拯救探险者 |q 66435/1 |goto 67.54,57.96 |count 4
step
talk Beleaguered Explorer##189089
告诉他去保险库。你在那儿会安全的。 |gossip 54942
拯救探险者 |q 66435/1 |goto 67.81,57.37 |count 5
step
label "Accept_A_Key_Element"
在该区域击杀敌人
|tip 他们看起来像岩石和石头元素。
|tip 你可以在生命宝库遗迹区域到处找到它们。 |不粘性
collect Orb of Primal Stone##191904 |n
|tip 你最终会在拾取后接受这个任务。
accept A Key Element##66437 |goto 67.37,57.37
'|kill Unsettled Rubble##189795, Displaced Earth##187393
step
label "Slay_Earth_Elementals"
在该区域击杀敌人 |notinsticky
|tip 它们看起来像岩石和石头元素生物。
|tip 你可以在生命宝库遗迹区域到处找到它们。 |不粘性
击杀12个大地元素 |q 66436/1 |goto 67.37,57.37
'|kill Unsettled Rubble##189795, Displaced Earth##187393
step
talk Elementalist Taiyang##190352
|tip 在建筑物内。
turnin Site Salvage##66435 |goto 66.59,56.08
turnin Unearthed Troublemakers##66436 |goto 66.59,56.08
turnin A Key Element##66437 |goto 66.59,56.08
accept Distilled Effort##66441 |goto 66.59,56.08
step
talk Acadia Chistlestone##188053
|tip 在建筑物内。
accept Rapid Fire Plans##66439 |goto 66.62,56.05
step
talk Examiner Tae'shara Bloodwatcher##188503
|tip 在建筑物内。
accept Lofty Goals##66438 |goto 66.57,56.11
step
talk Scout Ri'tal##190334
问她“现在宝珠在哪里？” |gossip 55167
与侦察员Ri'tal交谈 |q 66438/1 |goto 70.62,63.15
step
talk Scout Francisco##190423
问他“现在在哪里？” |gossip 55168
与侦查员弗朗西斯沟通 |q 66438/2 |goto 70.13,61.53
step
走到这个位置以跨越峡谷发射 |goto 69.17,61.70 < 7 |walk
click Orb of Primal Gales##377189
|tip 看起来像一个白色魔法球。
collect Orb of Primal Gales##192524 |q 66438/3 |goto 68.27,61.52
step
talk Keshki##191011
turnin Huddle at the Hollow##66828 |goto 65.33,63.68
accept Hornswoggled!##66830 |goto 65.33,63.68
step
use the Jar of Fireflies##193918
|tip 在{o}受到欺负的青蛙{}旁边使用它。
|tip 他们将变成平静的青蛙。
|tip 它们看起来像绿色青蛙。
clicknpc Pacified Frog##190981+
收集8只被平息的青蛙 |q 66830/1 |goto 66.22,64.03
step
talk Keshki##191011
turnin Hornswoggled!##66830 |goto 65.34,63.68
accept Home Is Where the Frogs Are##66831 |goto 65.34,63.68
stickystart "Collect_Fiery_Spirits"
step
在该区域击杀敌人
collect 8 Primal Flame Fragment##192545+ |n
use the Primal Flame Fragment##192545+
塑造原始火焰之球 |q 66439/2 |goto 68.91,64.65
'|kill Primalist Magmashaper##190186, Destructive Flames##188174, Ashen Spark##190528
step
label "Collect_Fiery_Spirits"
在该区域击杀敌人
|tip 它们看起来像火焰和熔岩元素。|不粘性
收集#3#火焰之灵 |q 67100/2 |goto 68.91,64.65
|tip 只有拥有至少2个青铜钻石的火焰精灵在物品图标上才算完成任务目标。
'|kill Primalist Magmashaper##190186, Destructive Flames##188174, Ashen Spark##190528 |notinsticky
step
talk Zikkori##196820
accept Drainage Solutions##70994 |goto 70.50,56.84
stickystart "Siphon_Glittery_Streams"
step
kill Acequian##187617
|tip 看起来像是一个大型蒸汽元素。
|tip 洞内探险
collect Orb of Primal Waves##192562 |q 66441/1 |goto 72.20,56.71
step
label "Siphon_Glittery_Streams"
use Zikkori's Water Siphoning Device##200747
|tip 在{o}闪烁的溪流{}上使用它。
|tip 他们看起来像水元素。
|tip 洞内探险
虹吸 #8# 闪光溪流 |q 70994/1 |goto 72.20,56.71
'|clicknpc Glittery Stream##197763
step
talk Zikkori##196820
turnin Drainage Solutions##70994 |goto 70.50,56.84
step
talk Elementalist Taiyang##190352
|tip 在建筑物内。
turnin Lofty Goals##66438 |goto 66.59,56.08
turnin Rapid Fire Plans##66439 |goto 66.59,56.08
turnin Distilled Effort##66441 |goto 66.59,56.08
accept Let's Get Theoretical##66442 |goto 66.59,56.08
step
talk Elementalist Taiyang##190352
|tip 在建筑物内。
告诉她“我准备好了。” |gossip 54908
观察对话
测试火焰和空气魔珠 |q 66442/1 |goto 66.59,56.08
step
观察对话
|tip 在建筑物内。
|tip 使用{o}测试原始石头法球{}技能。
|tip 它在屏幕上显示为一个按钮。
观察对话
破坏屏障 |q 66442/2 |goto 66.56,56.06
step
talk Elementalist Taiyang##197860
|tip 她冲向这个地点。
|tip 在建筑物内。
turnin Let's Get Theoretical##66442 |goto 66.51,55.96
accept Beyond the Barrier##66447 |goto 66.51,55.96
step
kill Discordant Watcher##189149 |q 66447/1 |goto 65.97,55.20
|tip 这看起来像是一座大型人类雕像。
|tip 她在你靠近时将变得敌对。
|tip 在建筑物内。
step
click Fragmented Dragon Record
|tip 在建筑物内。
collect Fragmented Record Rubbing##192480 |q 66447/2 |goto 66.11,54.94
step
talk Elementalist Taiyang##190354
turnin Beyond the Barrier##66447 |goto 65.86,57.47
step
talk Crabtender Kad'irsza##196827
accept Crabtender's Quandry##66612 |goto 59.74,51.22
step
talk Ru'kroszk##193304
accept Gills with Gall##71141 |goto 59.70,51.22
stickystart "Slay_Gorlocs"
step
进入洞穴 |goto 59.01,47.14 < 30 |walk |only if not subzone("Cliffdrip Cave")
kill Murghurgl the Invader##197211 |q 71141/1 |goto 57.98,46.32
|tip 他看起来像个骑在螃蟹上的绿魔。
|tip 在这个洞穴里。
step
label "Slay_Gorlocs"
击杀此区域内的沼泽爪牙敌人
|tip 它们看起来像各种颜色的森林恶魔。
|tip 洞内与洞外
击杀#12#戈洛克 |q 66612/1 |goto 59.01,47.14
'|kill Cliffdrip Fallstriker##189815, Cliffdrip Snapstrider##189812, Cliffdrip Wavemender##189814
step
talk Crabtender Kad'irsza##196827
turnin Crabtender's Quandry##66612 |goto 59.74,51.22
step
talk Ru'kroszk##193304
turnin Gills with Gall##71141 |goto 59.70,51.22
step
talk Pana##192472
fpath Uktulut Pier |goto 45.84,27.47
step
talk Thomas Bright##192574
turnin A Gift for Miguel##67100 |goto 60.23,72.19
step
clicknpc Croaking Frog Carrier##191489
|tip 这看起来像是个木箱子。
释放青蛙 |q 66831/1 |goto 60.24,66.46
step
talk Keshki##190868
turnin Home Is Where the Frogs Are##66831 |goto 60.19,66.39
step
进入地面建筑 |goto 57.73,67.05 < 20 |walk
talk Kolgar Flameguard##194801
|tip 在建筑物内。
accept Untold Regrets##70239 |goto 58.67,67.78
step
talk Bathoras##194805
|tip 如果你想听这个故事，就跟随科尔加·火卫士的脚步。
告诉他 "这个兽人急需你的帮助。<跳过当前对话。>" |gossip 106935
与杜罗斯和考尔加同行 |q 70239/1 |goto 57.37,65.68
step
talk Bathoras##194805
turnin Untold Regrets##70239 |goto 57.37,65.68
accept Pain Management##70240 |goto 57.37,65.68
step
talk Vaeros##190525
turnin Nursery Direction##66997 |goto 55.26,63.47
accept Leave Bee Alone##66734 |goto 55.26,63.47
accept Just a Trim##66735 |goto 55.26,63.47
stickystart "Bag_Bothersome_Bees"
stickystart "Collect_Blooming_Shallowlilies"
stickystart "Collect_Milky_Snapflowers"
stickystart "Prune_Overgrown_Shrubs"
step
use Empty Life Pools Vial##198673
|tip 在水边使用它。
collect Filled Life Pools Vial##198674 |q 70240/3 |goto 55.89,64.37
step
label "Bag_Bothersome_Bees"
use Smoke Diffuser##193064
|tip 将其使用在烦人的蜜蜂上。
|tip 它们看起来像大型蜜蜂。
|tip 他们会对你发起攻势。
|tip 战斗他们，但不要杀死他们，他们最终会变得可点击。
clicknpc Bothersome Bee##190543+
包裹 #8# 麻烦的蜜蜂 |q 66734/1 |goto 56.21,64.59
step
label "Collect_Blooming_Shallowlilies"
click Blooming Shallowlily+
|tip 它们看起来像水中的小绿水藻。
collect 3 Blooming Shallowlily##198668 |q 70240/2 |goto 56.21,64.59
step
label "Collect_Milky_Snapflowers"
click Milky Snapflower+
|tip 它们看起来像长茎的植物，带有白色花瓣。
collect 5 Milky Snapflower##198666 |q 70240/1 |goto 56.21,64.59
step
label "Prune_Overgrown_Shrubs"
click Overgrown Shrub+
|tip 它们看起来像大型绿色灌木。
|tip 你将被攻击。
修剪#5#过生长灌木 |q 66735/1 |goto 56.21,64.59
step
迁移恼人的蜜蜂 |q 66734/2 |goto 56.92,70.51
|tip 使用{o}蜜蜂自由!{}技能。
|tip 它在屏幕上显示为一个按钮。
step
talk Bathoras##194805
告诉他“我为你收集了材料。” |gossip 56408
将组件交给巴索拉斯 |q 70240/4 |goto 57.37,65.68
step
观察对话
|tip 巴索拉斯会给你一瓶药水。
collect Medicative Potion##200109 |q 70240/5 |goto 57.37,65.68
step
talk Duroz Scaletaker##194800
turnin Pain Management##70240 |goto 56.81,64.50
step
talk Vaeros##190525
turnin Leave Bee Alone##66734 |goto 55.26,63.47
turnin Just a Trim##66735 |goto 55.26,63.47
step
talk Adazius##190533
accept A Better Start##66737 |goto 55.19,63.70
step
_NOTE:_
在下一步中
|tip 当你种下每个种子时，将会发生一次对话，之后任务目标才能完成。
|tip 你不必耐心等待和观察。
|tip 如果你愿意，可以每次手动跳过到下一个步骤，开始跑到下一个地点。
|tip 任务目标将在你前往下一个地点时完成。
点击此处继续 |confirm |q 66737
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 55.66,64.61 |count 1
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 56.03,66.37 |count 2
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 56.41,66.01 |count 3
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 57.29,64.72 |count 4
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 56.86,63.70 |count 5
step
click Fertile Soil##291206
|tip 这看起来像是一堆棕色泥土。
观察对话
成熟种子 |q 66737/1 |goto 55.73,63.73 |count 6
step
talk Adazius##190533
turnin A Better Start##66737 |goto 55.20,63.70
step
talk Dazakros##191280
turnin Hornstrider Havoc##66879 |goto 53.42,58.37
accept Deluge Dilemma##66892 |goto 53.42,58.37
accept Beaky Reclamation##66893 |goto 53.42,58.37
stickystart "Slay_Water_Elementals"
step
use the Pungent Salve##194434
|tip 将其使用在{o}受伤的角兽{}上。
|tip 它们看起来像两条腿的恐龙。
|tip 它们将在你的小地图上出现为黄色点。
治疗受伤的角鹰兽#8# |q 66893/1 |goto 52.50,56.54
'|clicknpc Injured Hornstrider##191338
step
label "Slay_Water_Elementals"
在该区域击杀敌人
|tip 它们看起来像水元素和软泥怪。
击杀#12#水元素 |q 66892/1 |goto 52.50,56.54
'|kill Frenzied Ripple##191364, Ensnaring Current##191328, Encroaching Downpour##191324
step
talk Dazakros##191280
turnin Deluge Dilemma##66892 |goto 53.43,58.37
turnin Beaky Reclamation##66893 |goto 53.43,58.37
step
talk Ingot##185627
accept Punching Up##65687 |goto 39.43,48.33
accept A Cultist's Misgivings##65690 |goto 39.43,48.33
stickystart "Slay_Worldbreaker_Dragonkin"
step
定位艾亚萨斯 |q 65690/1 |goto 37.43,46.66
step
talk Ayasanth##185628
|tip 在木制牢笼内。
turnin A Cultist's Misgivings##65690 |goto 37.43,46.66
accept Under Lock and Key##65782 |goto 37.43,46.66
step
kill Worldbreaker Guard##185594+
从破碎世界卫兵那里获取钥匙 |q 65782/1 |goto 37.50,47.73
step
label "Slay_Worldbreaker_Dragonkin"
击杀此区域内的世界破坏者敌人
|tip 他们看起来像龙族。
击杀#12#破天龙人 |q 65687/1 |goto 37.50,47.73
'|kill Worldbreaker Smith##185591, Worldbreaker Guard##185594, Worldbreaker Cultist##185595, Worldbreaker Brute##185589, Worldbreaker Shapist##185593
step
click Worldbreaker Cell##381224
|tip 这看起来像是一座木制监牢。
解锁艾亚萨斯的牢笼 |q 65782/2 |goto 37.43,46.66
step
观察对话
talk Ingot##185627
|tip 他走到这个地点。
turnin Punching Up##65687 |goto 37.33,46.64
step
talk Ayasanth##185628
turnin Under Lock and Key##65782 |goto 37.34,46.61
accept The Shadow of His Wings##65691 |goto 37.34,46.61
step
进入洞穴 |goto 35.61,47.95 < 20 |walk |only if not (subzone("Smoldering Perch") and _G.IsIndoors())
观察对话
|tip 地下洞穴内
|tip 你将被攻击。
对抗被污染的赛戈诺斯 |q 65691/1 |goto 35.01,45.46
step
kill Cygenoth##185660 |q 65691/2 |goto 35.01,45.46
|tip 地下洞穴内
step
沿着路径向上走，离开洞穴。 |goto 35.61,47.95 < 20 |walk |only if subzone("Smoldering Perch") and _G.IsIndoors()
talk Ayasanth##185628
|tip 悬崖上
turnin The Shadow of His Wings##65691 |goto 39.56,48.41
step
观察对话
talk Wrathion##186274
turnin Wrathion Awaits##66079 |goto 42.47,66.84
step
talk Scalecommander Emberthal##192795
accept Lessons from Our Past##72241 |goto 42.47,66.78
step
talk Scalecommander Emberthal##192795
告诉她“告诉我龙人族的起源。” |gossip 107399
与火鳞指挥官埃本萨尔交谈，了解过去的事件 |q 72241/1 |goto 42.47,66.78
step
talk Scalecommander Emberthal##192795
turnin Lessons from Our Past##72241 |goto 42.47,66.78
accept Best Plans and Intentions##66048 |goto 42.47,66.78
step
talk Wrathion##186274
accept Sharp Practice##66078 |goto 42.47,66.84
stickystart "Test_Blacktalon"
step
talk Do-Yeon Shadowrider##188444
fpath Obsidian Bulwark |goto 42.26,66.25
step
talk Fao the Relentless##186331
问他“我们可以回顾一下战斗计划吗？” |gossip 55311
与不屈的法奥交谈后请点击这里 |confirm |goto 42.41,66.18 |q 66048
step
click Blacktalon Battle Plans##377111
|tip 它们看起来像桌子上的棕色卷轴。
|tip 帐篷内。
咨询无情的法奥 |q 66048/1 |goto 42.40,66.06
step
talk Forgemaster Bazentus##186493
|tip 他在这个区域游荡。
告诉他 "告诉我关于城堡中的武器。" |gossip 55309
告诉他谢谢他的情报。 |gossip 55310
咨询铸造大师巴赞图斯 |q 66048/4 |goto 42.83,66.85
step
talk Archivist Edress##187466
问她 "你的研究发现了什么？" |gossip 55307
观察对话
咨询档案管理员埃德瑞斯 |q 66048/2 |goto 43.76,67.28
step
talk Talonstalker Kavia##189507
|tip 悬崖边缘，俯瞰谷底。
问她“你观察到了什么？” |gossip 54996
与塔伦斯托克·卡维亚交谈后请点击这里 |confirm |goto 42.30,69.29 |q 66048
step
click Scouting Scope##376824
咨询爪斗者卡维亚 |q 66048/3 |goto 42.22,69.32
step
label "Test_Blacktalon"
talk Blacktalon NPC+ |talk Blacktalon Assassin##187189, Blacktalon Avenger##187187
|tip 只有黑爪复仇者和刺客会为任务目标服务。
告诉他们“我来这里是为了测试你们的战斗技能。” |gossip 54628
|tip 他们会对你发起攻势。
|tip 击败他们以对他们进行考验。
测试 #8# 黑爪 |q 66078/1 |goto 42.56,67.92
step
talk Wrathion##186274
turnin Best Plans and Intentions##66048 |goto 42.47,66.84
turnin Sharp Practice##66078 |goto 42.47,66.84
step
观察对话
talk Wrathion##186274
accept Talon Strike##65956 |goto 42.47,66.84
accept No Time For Heroes##65957 |goto 42.47,66.84
step
_NOTE:_
在下一步中
|tip 使用黑爪标记技能对敌人。
|tip 它在屏幕上显示为一个按钮。
|tip 它将{o}击晕敌人{}并{o}召唤盟友{}来帮助你战斗。
点击此处继续 |confirm |q 65957
stickystart "Disrupt_The_Djaradin_Defenses"
step
kill Piercer Gigra##186511 |q 65957/1 |goto 35.47,68.52
|tip 在建筑物顶部
step
kill Olphis the Molten##181875 |q 65957/3 |goto 34.81,66.87
|tip 他看起来像一头大型黑色和橙色的猛犸象。
step
kill Modak Flamespit##186509 |q 65957/2 |goto 35.69,60.74
|tip 在建筑物顶部
step
label "Disrupt_The_Djaradin_Defenses"
在该区域击杀敌人
click Siege Arbalest+
|tip 它们看起来像大型弩炮。
click Djaradin Banner+
|tip 它们看起来像是标杆，上面顶着龙头骨，悬挂着红色的旗帜。
kill Molten Extracts##186716+
|tip 它们看起来像各种大型棕色陶罐。
破坏达贾拉丁的防御 |q 65956/1 |goto 36.47,67.85
'|kill Qalashi Boltthrower##189557, Qalashi Ironskin##191524, Qalashi Boltthrower##189557, Qalashi Necksnapper##186109, Qalashi Steelcrafter##186483, Qalashi Crustshaper##186638, Qalashi Boltthrower##189557, Qalashi Skullhauler##186239
step
talk Wrathion##186681
turnin Talon Strike##65956 |goto 33.99,61.29
turnin No Time For Heroes##65957 |goto 33.99,61.29
accept The Courage of One's Convictions##65939 |goto 33.99,61.29
step
talk Wrathion##186681
告诉他“我准备好开始攻城了。” |gossip 55405
与愤怒之龙交谈以开始攻击 |q 65939/1 |goto 33.99,61.29
step
抵达黑曜石城堡 |complete subzone("Obsidian Citadel") |goto 33.13,61.95 |q 65939
|tip 在桥上
step
进入黑曜石城堡 |q 65939/2 |goto 30.47,60.84
stickystart "Slay_Qalashi_Forces"
step
talk Wrathion##186933
|tip 他飞往这个地点。
accept Taking the Walls##66044 |goto 29.15,58.83
step
talk Wrathion##186933
告诉他“我准备好协助你了。” |gossip 54627
协助瓦拉斯顿 |q 66044/1 |goto 29.15,58.83
step
与拉瑟莱克一起翱翔 |invehicle |goto 29.15,58.83 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 27.15,58.09 |q 66044 |notravel
|tip 他会把你丢到墙顶上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
|tip 在墙顶上
摧毁南方 siege 弩炮 |q 66044/2 |goto 26.83,59.94
step
talk Wrathion##186935
|tip 在墙顶上
在墙上与拉瑟恩会面 |invehicle |goto 26.77,61.20 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 29.63,62.37 |q 66044 |notravel
|tip 他会把你丢到墙顶上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
|tip 在墙顶上
摧毁东部 siege arbalast |q 66044/3 |goto 29.51,61.00
step
talk Wrathion##186935
|tip 在墙顶上
在墙上与拉瑟恩会面 |invehicle |goto 29.05,61.82 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 27.72,55.55 |q 66044 |notravel
|tip 他会把你放在平台上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
摧毁北方 siege 弩车 |q 66044/4 |goto 27.76,56.54
step
kill Champion Choruk##186592 |q 66044/5 |goto 26.92,57.14
|tip 他在这个区域四处游荡，骑着一头黑黄相间的猛犸象。
step
label "Slay_Qalashi_Forces"
在该区域击杀敌人
|tip 你可以在黑曜石城塞区域的各个地方找到他们。 |不固定
消灭12个卡拉希势力 |q 65939/3 |goto 26.59,57.97
'|kill Qalashi Necksnapper##186892, Qalashi Gatecrasher##186915, Djaradin Flametamer##195187, Qalashi Crustshaper##191597, Qalashi Flamelobber##189768, Qalashi Skullhauler##190116, Qalashi Boltthrower##190079, Qalashi Boltthrower##189734
step
talk Wrathion##196265
turnin The Courage of One's Convictions##65939 |goto 26.43,58.77
turnin Taking the Walls##66044 |goto 26.43,58.77
accept Obsidian Oathstone##66049 |goto 26.43,58.77
step
talk Wrathion##187045
问他“这是誓石吗？” |gossip 55423
在誓石与瓦尔莎谈话 |q 66049/1 |goto 27.30,62.58
step
click Obsidian Oathstone##376917
|tip 这看起来像一座巨大的石碑。
审视誓石 |q 66049/2 |goto 27.62,63.33
step
观察对话
talk Wrathion##187045
turnin Obsidian Oathstone##66049 |goto 27.30,62.58
step
talk Forgemaster Bazentus##186493
accept A Shattered Past##66055 |goto 27.25,62.79
stickystart "Collect_Oathstone_Fragments"
step
进入城堡地下的宝藏 |q 66055/1 |goto 27.11,60.82
|tip 进入建筑物，沿着楼梯下去。
step
label "Collect_Oathstone_Fragments"
click Oathstone Fragment+
|tip 它们看起来像大型石碑的碎片。
|tip 建筑内部的地下室
|tip 它们将在你的小地图上出现为黄色点。
collect 12 Oathstone Fragment##191131 |q 66055/2 |goto 24.74,58.26
step
爬楼梯逃出大楼 |goto 27.16,60.87 < 15 |walk |only if subzone("Obsidian Citadel") and _G.IsIndoors()
talk Forgemaster Bazentus##186493
turnin A Shattered Past##66055 |goto 27.25,62.80
accept Forging A New Future##66056 |goto 27.25,62.80
step
click Earth-Warder's Forge##377013
激活大地守护者的熔炉 |q 66056/1 |goto 24.63,60.88
step
kill Animated Cindershards##189875+
|tip 他们看起来像岩石元素体。
click Cindershard Coal##377012+
|tip 它们看起来像是堆积的灰色石头。
|tip 点击敌人时可能会刷新一个敌人。
collect 6 Cindershard Coal##192548 |q 66056/2 |goto 24.90,60.88
step
talk Forgemaster Bazentus##186493
turnin Forging A New Future##66056 |goto 24.68,61.12
accept The Spark##66354 |goto 24.68,61.12
step
click Oathstone Fragments##378433+
将碎片放置在锻造台上 |q 66354/1 |goto 24.56,60.90
step
观察对话
修复碎片 |q 66354/2 |goto 24.56,60.90
step
click Reformed Oathstone Fragments##377026
收集重铸碎片 |q 66354/3 |goto 24.56,60.90
step
talk Forgemaster Bazentus##186493
turnin The Spark##66354 |goto 24.68,61.12
accept Restoring the Faith##66057 |goto 24.68,61.12
step
talk Wrathion##187045
告诉他“你现在可以修复黑曜石誓言石。” |gossip 56143
与 wrathion 对话 |q 66057/1 |goto 27.30,62.58
step
观察对话
clicknpc Wrathion##191669
与拉瑟琳一同前往王座 |q 66057/2 |goto 27.09,62.21
step
与拉瑟莱克一起翱翔 |invehicle |goto 27.09,62.21 |q 66057
step
与拉索里奥一起飞翔 |outvehicle |goto 25.45,56.74 |q 66057 |notravel
|tip 他会带你去上层平台。
step
接近拉瑟恩和萨贝琉斯 |q 66057/3 |goto 25.09,56.45
|tip 在上层平台。
step
talk Wrathion##187495
turnin Restoring the Faith##66057 |goto 24.44,55.50
accept Claimant to the Throne##66780 |goto 24.44,55.50
step
talk Sabellian##185894
accept Heir Apparent##66779 |goto 24.25,55.87
step
talk Forgemaster Bazentus##193464
问他“你能告诉我关于萨贝利安的事情吗？” |gossip 55566
与巴泽图斯交谈 |q 66779/2 |goto 24.38,57.83
step
talk Baskilan##188158
问他“你能告诉我关于萨贝利安的事情吗？” |gossip 55358
与巴斯基利安交谈 |q 66779/1 |goto 24.31,58.90
step
talk Foehn Breezeskimmer##188336
fpath Obsidian Throne |goto 25.27,56.83
step
talk Archivist Edress##193456
问她“你能告诉我关于萨贝里安的事情吗？” |gossip 55564
与档案员埃德雷斯交谈 |q 66779/3 |goto 25.11,56.24
step
talk Archivist Edress##193456
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55565
与档案员埃德雷斯交谈 |q 66780/3 |goto 25.11,56.24
step
talk Archivist Edress##193456
accept Neltharus: Secrets Within##72135 |goto 25.11,56.24
step
talk Left##191710
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55355
与左侧和右侧对话 |q 66780/2 |goto 25.01,55.19
step
talk Talonstalker Kavia##191600
|tip 她在这个区域巡视。
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55354
与爪行者卡维亚交谈 |q 66780/1 |goto 26.35,54.45
step
talk Wrathion##187495
turnin Claimant to the Throne##66780 |goto 24.43,55.49
step
talk Sabellian##185894
turnin Heir Apparent##66779 |goto 24.24,55.88
accept Black Wagon Flight##65793 |goto 24.24,55.88
step
talk Hjorik##192493
|tip 在山顶上
fpath Apex Observatory |goto 23.79,83.14
step
talk Nulia##192494
|tip 在沙滩上，靠近水边。
fpath Uktulut Outpost |goto 17.51,88.70
step
talk Sabellian##190937
告诉他“动起来吧。” |gossip 55381
与萨贝利安对话以开始移动蛋。 |q 65793/2 |goto 43.83,66.43
step
观察对话
|tip 跟随战车并保护它。
|tip 他们最终前往这个地点。
护送马车 |q 65793/3 |goto 52.26,66.82 |notravel
'|clicknpc Sabellian##191640
step
talk Sabellian##190740
|tip 上去平台上。
turnin Black Wagon Flight##65793 |goto 57.96,67.31
accept The Last Eggtender##66785 |goto 57.96,67.31
step
talk Mother Elion##185904
turnin The Last Eggtender##66785 |goto 61.60,68.71
accept Egg-cited for the Future##66788 |goto 61.60,68.71
stickystart "Sweep_Fallen_Leaves"
stickystart "Pull_Overgrown_Weeds"
step
clicknpc Ruby Shrineguard##191126
打磨红宝石神龛守卫 |q 66788/3 |goto 61.44,69.02
step
label "Sweep_Fallen_Leaves"
click Fallen Leaves##377230
|tip 它们看起来像一堆红色和棕色的枯叶。
扫荡#2#落叶 |q 66788/1 |goto 61.53,68.57
step
label "Pull_Overgrown_Weeds"
click Overgrown Weeds##377231
|tip 它们看起来像绿色的蕨类植物。
|tip 点击他们后，迅速离开以将他们从地面拉出。
拉 #3# 繁茂杂草 |q 66788/2 |goto 61.53,68.57
step
talk Mother Elion##185904
turnin Egg-cited for the Future##66788 |goto 61.60,68.71
accept Life-Binder on Duty##65791 |goto 61.60,68.71
step
talk Alexstrasza the Life-Binder##185905
turnin Life-Binder on Duty##65791 |goto 62.34,73.02
accept A Charge of Care##65794 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##185905
告诉她“我已准备好。” |gossip 55380
强化红宝石誓石 |q 65794/1 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##193377
turnin A Charge of Care##65794 |goto 61.56,68.56
accept Next Steppes##65795 |goto 61.56,68.56
step
talk Ambassador Taurasza##185878
turnin Next Steppes##65795 |goto 48.27,88.67
step
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)"		|only if not completedq(72293)
step
label "All_Scouting_Map_Quests_Complete"
_NOTE:_
你完成了所有侦察地图任务
|tip 你已完成龙岛所有区域的侦察地图任务。
|tip 本指南已完成，请选择另一个指南。
点击此处继续 |confirm
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)",{
author="support@zygorguides.com",
},[[
step
talk Ambassador Taurasza##185878
turnin Ohn'ahran Plains##72267 |goto The Waking Shores/0 48.27,88.67 |only if haveq(72267) or completedq(72267)
accept Into the Plains##65779 |goto The Waking Shores/0 48.27,88.67
step
talk Scout Tomul##185882
turnin Into the Plains##65779 |goto Ohn'ahran Plains/0 77.72,23.94
accept Proving Oneself##65780 |goto Ohn'ahran Plains/0 77.72,23.94
step
kill Blazing Proto-Dragon##185883 |q 65780/1 |goto 78.57,27.12
|tip 他是精英，但附近的半人马会帮助你战斗。
step
talk Scout Tomul##185882
turnin Proving Oneself##65780 |goto 78.63,25.39
accept Welcome at Our Fire##65783 |goto 78.63,25.39
step
talk Apprentice Ehri##186653
|tip 她在这个小区域里游荡。
accept Sole Supplier##65951 |goto 84.34,25.00
step
talk Farrier Roscha##186650
accept Thieving Gorlocs##65950 |goto 84.40,25.02
step
talk Muqur Rain-Touched##194904
|tip 在建筑物内。
accept Nergazurai##70319 |goto 84.53,25.34
step
talk Scout Tomul##185882
turnin Welcome at Our Fire##65783 |goto 85.32,25.42
accept The Shikaar##70174 |goto 85.32,25.42
step
观察对话
talk Sansok Khan##181217
告诉她“我需要和绿龙派的领袖谈话。” |gossip 56190
与桑索克·卡恩交谈 |q 70174/1 |goto 85.74,25.33
step
talk Sansok Khan##181217
turnin The Shikaar##70174 |goto 85.74,25.33
accept Making Introductions##65801 |goto 85.74,25.33
accept Supplies for the Journey##65802 |goto 85.74,25.33
step
click Bundle of Pelts
|tip 在建筑物内。
集齐营地物资 |q 65802/2 |goto 86.17,25.31 |count 1
stickystart "Collect_Feralbloom_Pods"
step
talk Aru##186176
告诉他“我叫{_G.UnitName("player")}。我将加入你的部落参加呼拉尔。” |gossip 55270
与阿鲁和贝莉卡交谈 |q 65801/2 |goto 85.76,26.60
step
click Basket of Dried Fish
集齐营地物资 |q 65802/2 |goto 84.31,27.18 |count 2
step
talk Beastmaster Nuqut##186183
问他“我叫{_G.UnitName("player")}。你会加入前往库拉尔的商队吗？” |gossip 55228
与兽王努库特对话 |q 65801/3 |goto 83.92,25.87
step
click Crate of Horseshoes
集齐营地物资 |q 65802/2 |goto 84.34,24.91 |count 3
step
talk Flightmaster Baqir##184630
fpath Timberstep Outpost |goto 85.28,24.10
step
label "Collect_Feralbloom_Pods"
click Medicinal Feralbloom##377122+
|tip 它们看起来像大型圆形的橙色花朵，带有高大的绿色茎。
collect 5 Feralbloom Pod##192812 |q 65802/1 |goto 84.95,25.16
step
click Weapon Rack
集齐营地物资 |q 65802/2 |goto 84.37,23.12 |count 4
step
talk Scout Tomul##185882
|tip 在建筑物内。
turnin Supplies for the Journey##65802 |goto 84.69,22.81
step
talk Ohn Seshteng##184595
告诉她 "我叫 { _G.UnitName("player") }。我将加入你的部落参加哈拉尔。" |gossip 54838
与奥恩·塞斯腾交谈 |q 65801/1 |goto 85.63,20.85
stickystart "Collect_Vulture_Gizzard"
step
在该区域击杀敌人
|tip 它们看起来像背上有鳞片的棕色猛虎。
collect Rockfang Femur##198793 |q 70319/2 |goto 85.58,15.84
'|kill Sutaan##188274, Ravenous Rockfang##185903
step
label "Collect_Vulture_Gizzard"
kill Ravine Vulture##190943+
|tip 它们看起来像棕色的小鸟。
collect Vulture Gizzard##198794 |q 70319/4 |goto 85.58,15.84
step
kill Swift Hornstrider##188089+
|tip 它们看起来像迅捷陆行鸟。
collect Hornstrider Scale##198795 |q 70319/3 |goto 77.12,20.61
step
kill Clearwater Ottuk##192854+
|tip 它们看起来像带角的水獺。
collect Ottuk Heart##198792 |q 70319/1 |goto 75.39,24.59
stickystart "Collect_Shikaar_Supplies"
step
寻找卡萨尔 |q 65951/1 |goto 80.56,30.74
step
talk Khasar##186649
turnin Sole Supplier##65951 |goto 80.56,30.74
step
label "Collect_Shikaar_Supplies"
在这个区域击杀泥鳅敌人
collect 30 Shikaar Supplies##191541 |q 65950/1 |goto 81.63,30.55
'|kill Mudfin Salamancer##186669, Mudfin Mudrunner##186690, Mudfin Shaman##186679
step
talk Khasar##186649
turnin Thieving Gorlocs##65950 |goto 80.56,30.74
accept The Ora-cull##65953 |goto 80.56,30.74
accept Release the Hounds##65954 |goto 80.56,30.74
accept A Centaur's Best Friend##65955 |goto 80.56,30.74
stickystart "Collect_Mudfin_Totems"
step
click Khasar's Cage
解放卡萨尔 |q 65955/1 |goto 80.56,30.74
step
clicknpc Batu##187841
收集巴卡项圈 |q 65954/2 |goto 80.62,30.68 |count 1
step
click Bakar Cage
解放巴卡尔 |q 65954/1 |goto 81.25,31.70 |count 1
step
click Bakar Cage
解放巴卡尔 |q 65954/1 |goto 81.12,29.77 |count 2
step
click Bakar Cage
解放巴卡尔 |q 65954/1 |goto 81.43,29.72 |count 3
step
click Bakar Cage
解放巴卡尔 |q 65954/1 |goto 82.21,30.22 |count 4
step
clicknpc Sarnai##187067
收集巴卡项圈 |q 65954/2 |goto 82.20,30.43 |count 2
step
click Bakar Cage
解放巴卡尔 |q 65954/1 |goto 82.36,30.57 |count 5
step
label "Collect_Mudfin_Totems"
kill Mudfin Shaman##186679+
|tip 他们看起来像蓝色的小精灵。
collect 4 Mudfin Totem##191143 |q 65953/1 |goto 81.47,30.83
step
进入洞穴 |goto 83.00,31.92 < 20 |walk |only if not (subzone("Mudfin Village") and _G.IsIndoors())
click Baba's Cage
|tip 这看起来像是一座木制监牢。
|tip 洞内探险
解放巴巴 |q 65955/2 |goto 83.37,32.41
step
观察对话
talk Khasar##186649
|tip 他走到这个地点。
|tip 洞内探险
turnin The Ora-cull##65953 |goto 83.44,32.32
turnin Release the Hounds##65954 |goto 83.44,32.32
turnin A Centaur's Best Friend##65955 |goto 83.44,32.32
accept A Chief of Legends##65952 |goto 83.44,32.32
step
kill Chief Grrlgllmesh##186678 |q 65952/1 |goto 82.08,31.48
collect Medallion of a Fallen Friend##191127 |n
|tip 你将自动接受任务，在拾取该物品后。
accept Medallion of a Fallen Friend##66005 |goto 82.08,31.48
step
进入洞穴 |goto 83.00,31.92 < 20 |walk |only if not (subzone("Mudfin Village") and _G.IsIndoors())
talk Khasar##186649
|tip 洞内探险
turnin A Chief of Legends##65952 |goto 83.44,32.32
turnin Medallion of a Fallen Friend##66005 |goto 83.44,32.32
accept The Sole Mender##65949 |goto 83.44,32.32
accept Return to Roscha##66006 |goto 83.44,32.32
step
click Shikaar Supplies
|tip 洞内探险
取回物资 |q 66006/1 |goto 83.51,32.14
step
talk Muqur Rain-Touched##194904
|tip 在建筑物内。
turnin Nergazurai##70319 |goto 84.53,25.34
step
talk Farrier Roscha##186650
turnin The Sole Mender##65949 |goto 84.40,25.02
turnin Return to Roscha##66006 |goto 84.40,25.02
step
talk Scout Tomul##185882
|tip 在建筑物内。
turnin Making Introductions##65801 |goto 84.69,22.81
accept Toward the City##65803 |goto 84.69,22.81
step
talk Scout Tomul##185882
告诉她“我已准备好出发。” |gossip 55267
与商队会合 |q 65803/1 |goto 83.15,23.74
step
抵达第一站 |q 65803/3 |goto 75.67,31.68
|tip 你可以直接飞到这里，你不需要跟随商队。
|tip 如果你跟随商队，他们会在行进中给你讲述故事。
step
talk Scout Tomul##185882
turnin Toward the City##65803 |goto 75.67,31.68
accept For Food and Rivalry##65804 |goto 75.67,31.68
step
click Mysterious Paw Print
accept Mysterious Beast##70185 |goto 76.74,31.89
step
talk Malakesh##196259
fpath Rusza'thar Reach |goto 84.66,36.89
step
kill Konkhular##194544
|tip 小洞穴内。
collect Pelt of Konkhular##198517 |q 70185/1 |goto 78.28,35.21
step
在该区域击杀敌人
|tip 它们看起来像各种野兽。
collect 30 Fresh Game Meat##191100 |q 65804/1 |goto 77.15,31.09
'|kill Sunhide Stomphoof##187960, Fleecepelt Argali##187975, Plainswalker Mammoth##187938, Plainswalker Calf##187939, Plainswalker Bull##187937
step
talk Scout Tomul##185882
turnin For Food and Rivalry##65804 |goto 75.67,31.68
turnin Mysterious Beast##70185 |goto 75.67,31.68
accept By Broken Road##65940 |goto 75.67,31.68
step
到达第二个传送点 |q 65940/2 |goto 69.96,37.97
|tip 你可以直接飞到这里，你不需要跟随商队。
|tip 如果你跟随商队，他们会在行进中给你讲述故事。
step
talk Ohn Seshteng##184595
turnin By Broken Road##65940 |goto 69.96,37.97
accept Connection to Ohn'ahra##65805 |goto 69.96,37.97
stickystart "Collect_River_Reeds"
stickystart "Collect_Fowl_Tailfeathers"
step
kill Mudwalker Salamanther##190961+
|tip 它们看起来像大型黄色蜥蜴，带有绿色鳍。
collect Salamanther Heart##191103 |q 65805/3 |goto 69.75,38.00
step
label "Collect_River_Reeds"
click River Reeds+
|tip 它们看起来像水边的棕色和黄色植物。
collect 4 River Reeds##191101 |q 65805/1 |goto 69.75,38.00
step
label "Collect_Fowl_Tailfeathers"
click Jadethroat Mallard##190708+
|tip 它们看起来像{o}棕色的鸟，有着绿色的头部{}。
|tip 他们在地面上，正在空中飞翔。
|tip 他们可能会对你发起攻击。
|tip 你也可以直接{o}杀了他们{}，如果你点击他们没有获得羽毛。
collect 8 Fowl Tailfeathers##191102 |q 65805/2 |goto 69.75,38.00
step
talk Ohn Seshteng##184595
turnin Connection to Ohn'ahra##65805 |goto 69.96,37.97
accept Omens on the Wind##66848 |goto 69.96,37.97
step
talk Ohn Seshteng##184595
告诉她“我已准备好。” |gossip 64063
与奥恩·塞斯腾交谈 |q 66848/1 |goto 69.96,37.97
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.98,37.66 |count 1
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.93,37.54 |count 2
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.87,37.63 |count 3
step
观察对话
完成仪式 |q 66848/3 |goto 69.87,37.63
step
talk Ohn Seshteng##184595
|tip 她走向这个地点。
turnin Omens on the Wind##66848 |goto 69.97,37.97
step
talk Sansok Khan##181217
accept Maruukai##65806 |goto 70.02,38.02
step
talk Hunter Narman##191924
accept Bloodlines, Sweets, and Teerai##70739 |goto 63.62,40.47
step
talk Flightmaster Salukan##191263
fpath Maruukai |goto 62.96,42.13
step
talk Beastmaster Tirren##195524
accept Trouble In The Pines##65837 |goto 61.98,41.81
step
抵达玛鲁凯 |q 65806/2 |goto 61.64,39.80
step
talk Sansok Khan##191283
turnin Maruukai##65806 |goto 61.44,39.51
accept Clan Teerai##66016 |goto 61.44,39.51
accept Clan Ohn'ir##66017 |goto 61.44,39.51
accept Clan Nokhud##66018 |goto 61.44,39.51
accept Orientation: Maruukai##72429 |goto 61.44,39.51
step
观察对话
talk Scout Tomul##191485
|tip 她走向这个地点。
turnin Clan Nokhud##66018 |goto 60.38,40.70
step
talk Guard Bahir##186940
accept Unwelcome Outsider##66021 |goto 60.30,40.76
step
talk Nokhud NPCs
|tip 他们在这个区域看起来像半人马。
告诉他们“来切磋一下。” |gossip 55277
|tip 他们会对你发起攻势。
|tip 他们终将投降。
|tip 你也可以在不与他们交谈的情况下攻击他们。
击败 #6# 诺库德半人马 |q 66021/1 |goto 59.30,42.02
'|talk Nokhud Fighter##187297, Nokhud Spearthrower##191570, Nokhud Brute##187299
step
talk Qariin Dotur##186941
turnin Clan Teerai##66016 |goto 59.16,37.61
accept Honoring Our Ancestors##66019 |goto 59.16,37.61
step
click Raw Game Meat
收集生肉 |q 66019/1 |goto 59.39,37.81
step
click Raw Game Meat
放置生肉 |q 66019/2 |goto 59.13,37.57
step
click Jar of Spices
收集香料瓶 |q 66019/3 |goto 59.31,37.29
step
使用香料瓶 |q 66019/4 |goto 59.13,37.57
|tip 使用 {o}施加香料罐{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
click Basket of Spices
收集香料篮子 |q 66019/5 |goto 59.39,37.36
step
应用香料篮 |q 66019/6 |goto 59.13,37.57
|tip 使用{o}施加香料篮{}技能。
|tip 它在屏幕上显示为一个按钮。
step
click Pot of Spices
收集香料罐 |q 66019/7 |goto 59.05,37.90
step
应用香料之锅 |q 66019/8 |goto 59.13,37.57
|tip 使用 {o}施放香料大锅{} 技能。
|tip 它在屏幕上显示为一个按钮。
step
click Spiced Game Meat
拾取香料野味 |q 66019/9 |goto 59.12,37.57
step
烹饪香料野味肉 |q 66019/10 |goto 58.89,37.28
|tip 使用{o}烘烤{}技能。
|tip 它在屏幕上显示为一个按钮。
step
click Spiced Game Meat
献祭之地 |q 66019/11 |goto 59.16,37.10
step
talk Qariin Dotur##186941
turnin Honoring Our Ancestors##66019 |goto 59.16,37.62
step
talk Elder Odgerel##196449
|tip 在建筑物内。
询问 纳尔曼的提议 |gossip 106779
咨询长者奥德杰尔 |q 70739/1 |goto 60.04,37.39
step
talk Quartermaster Huseng##196707
|tip 在建筑物内。
见到声望供应商 |q 72429/2 |goto 60.40,37.72
step
talk Agari Dotur##185179
|tip 在建筑物内。
会见声望守护者 |q 72429/1 |goto 60.40,37.66
step
talk Agari Dotur##185179
|tip 在建筑物内。
turnin Orientation: Maruukai##72429 |goto 60.40,37.66
step
talk Windsage Kven##195239
|tip 在建筑物内。
accept Emberwatch##70337 |goto 62.12,36.44
step
talk Hearthkeeper Erden##194928
|tip 在建筑物内。
buy Honey Plum Tart##199918 |q 70739/2 |goto 62.17,35.69
step
talk Windsage Dawa##190192
accept Shikaar Giver##70730 |goto 62.82,35.44
step
talk Ohn Seshteng##191595
|tip 在建筑物内。
turnin Clan Ohn'ir##66017 |goto 63.00,33.67
accept Omens and Incense##66020 |goto 63.00,33.67
step
talk Windsage Ordven##195302
|tip 外面，建筑旁边。
accept A Disgruntled Initiate##65906 |goto 63.12,34.04
step
click Sweetsuckle+
|tip 它们看起来像小的粉色和紫色的花朵。
collect Sweetsuckle Bloom##191160+ |n
use the Sweetsuckle Bloom##191160+
|tip 你需要{o}5个他们{}才能使用。
collect Sweetsuckle Incense##198981 |q 66020/1 |goto 62.93,35.18
step
click Incense Burner
|tip 在建筑物内。
燃烧甜香藤香 |q 66020/2 |goto 62.83,33.72
step
talk Ohn Seshteng##191595
|tip 在建筑物内。
turnin Omens and Incense##66020 |goto 63.00,33.66
step
talk Ohn Arasara##192080
询问达瓦的提议 |gossip 107074
请咨询奥纳阿萨拉 |q 70730/1 |goto 63.85,35.90
step
talk Hearthkeeper Erden##194928
|tip 在建筑物内。
buy Yak Milk Pudding##199919 |q 70730/2 |goto 62.17,35.69
step
talk Provisioner Zara##196437
告诉她“我代表风语者达瓦给你带来了甜点。” |gossip 107058
咨询物资供应者扎拉 |q 70730/3 |goto 63.55,41.08
step
talk Scout Tomul##191485
turnin Unwelcome Outsider##66021 |goto 62.43,41.72
step
_Next to you:_
talk Aru##192724
accept Clans of the Plains##66969
step
talk Sansok Khan##191283
向桑索克·卡恩报告 |q 66969/1 |goto 61.44,39.51
step
talk Sansok Khan##191283
告诉她“我已准备好。” |gossip 56528
告诉她“提尔艾氏族” |gossip 56515
告诉她“欧恩'艾尔部落” |gossip 56537
告诉她 “诺克哈德氏族” |gossip 56549
告诉她“希卡尔部落” |gossip 56554
正确回答四个问题 |q 66969/2 |goto 61.44,39.51
step
talk Sansok Khan##191283
turnin Clans of the Plains##66969 |goto 61.44,39.51
step
观察对话
talk Gemisath##194927
|tip 她走向这个地点。
accept The Emissary's Arrival##66948 |goto 61.03,40.44
step
talk Gemisath##194927
告诉她我在这里帮助恢复绿色誓石 |gossip 56585
向绿龙军团提供援助 |q 66948/1 |goto 61.03,40.44
step
talk Gemisath##194927
turnin The Emissary's Arrival##66948 |goto 61.03,40.44
accept The Khanam Matra##66022 |goto 61.03,40.44
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
告诉他我已准备好接受面见。 |gossip 54895
与卡汉斯卫兵阿卡托交谈 |q 66022/1 |goto 60.29,37.88
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
turnin The Khanam Matra##66022 |goto 60.35,38.04
accept Trucebreakers##66023 |goto 60.35,38.04
stickystart "Slay_Nokhud_Forces"
step
talk Scout Tomul##191485
accept Covering Their Tails##66024 |goto 59.52,38.75
step
kill Guard Bahir##191843 |q 66024/1 |goto 58.03,39.36
step
label "Slay_Nokhud_Forces"
在这个区域击杀诺库德敌人
|tip 他们看起来像敌对的半人马。
击杀10个诺库德军队 |q 66023/1 |goto 58.98,39.24
你可以在[61.06,39.98]附近找到更多。
'|kill Nokhud Reaver##187201, Nokhud Betrayer##187150, Nokhud Storm Adept##187149
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
turnin Trucebreakers##66023 |goto 60.35,38.04
step
talk Khanam Matra Sarest##181198
|tip 外面，在建筑顶部。
turnin Covering Their Tails##66024 |goto 60.32,38.07
accept The Nokhud Threat##66025 |goto 60.32,38.07
step
观察对话
talk Khanam Matra Sarest##181198
|tip 她走向这个地点。
|tip 在建筑内部，顶层。
turnin The Nokhud Threat##66025 |goto 60.00,37.47
accept Hooves of War##66201 |goto 60.00,37.47
step
kill Old Arbhog##196897
|tip 他看起来像一只大型黑色野牛。
|tip 他在这个区域游荡。
collect Arbhog's Horns##200258 |q 70730/4 |goto 57.23,42.70
step
talk Matchmaker Osila##196249
告诉她“我为你带来了些糖果，红娘。” |gossip 106837
鼓励配对者 |q 70739/3 |goto 55.36,38.37
step
click Burial Flowers+
|tip 它们看起来像大白色花朵。
collect 8 Burial Flower##201044 |q 70739/4 |goto 56.44,40.67
step
click Burial Flowers
献祭仪式 |q 70739/5 |goto 56.79,38.77
step
talk Hunter Narman##191924
turnin Bloodlines, Sweets, and Teerai##70739 |goto 63.62,40.47
step
talk Windsage Dawa##190192
turnin Shikaar Giver##70730 |goto 62.82,35.44
accept After My Ohn Heart##70721 |goto 62.82,35.44
step
talk Volebel##190049
fpath Emberwatch |goto 66.78,25.17
step
talk Telemancer Aerilyn##190089
turnin Emberwatch##70337 |goto 66.00,25.06
accept The Nelthazan Ruins##65890 |goto 66.00,25.06
step
talk Skyscribe Adenedal##186300
turnin The Nelthazan Ruins##65890 |goto 64.00,18.29
accept Tools of the Tirade##65891 |goto 64.00,18.29
accept The Relic Inquiry##65893 |goto 64.00,18.29
stickystart "Collect_Nelthazan_Artifact_Fragments"
step
click Waygate Rubble+
|tip 它们看起来像一堆灰色的石板。
部署 #5# 工具 |q 65891/1 |goto 63.72,15.91
step
label "Collect_Nelthazan_Artifact_Fragments"
在该区域击杀敌人
collect 60 Nelthazan Artifact Fragments##193375 |q 65893/1 |goto 63.42,16.09
你可以在[62.27,17.51]附近找到更多。
'|kill Sundered Runebinder##186354, Tarasek Laborer##186319, Sundered Enforcer##186323
step
talk Skyscribe Adenedal##186300
turnin Tools of the Tirade##65891 |goto 64.00,18.29
turnin The Relic Inquiry##65893 |goto 64.00,18.29
accept Competing Company##65895 |goto 64.00,18.29
step
kill Tserasor the Preserver##190598
|tip 在这个破旧的小屋内。
collect Map of Nelthazan Ruins##193355 |n
寻找线索 |q 65895/1 |goto 62.93,18.66 |count 1
step
kill Sootscale the Indomitable##190307
|tip 在破碎建筑的门口。
collect Shattered Ornament##193357 |n
寻找线索 |q 65895/1 |goto 62.44,18.52 |count 2
step
click Remains of Keskahz
|tip 地上看起来像一个死去的棕色龙人。
|tip 避免原始龙蛋。
|tip 如果你靠近他们，敌人将会出现。
collect Recruitment Roster##198078 |n
寻找线索 |q 65895/1 |goto 61.72,18.61 |count 3
step
kill Malifron##190278
|tip 他在这个区域游荡。
collect Orders from Sarkareth##198079 |n
寻找线索 |q 65895/1 |goto 62.77,16.28 |count 4
step
talk Skyscribe Adenedal##186300
|tip 在建筑物内。
turnin Competing Company##65895 |goto 62.14,16.30
step
talk Skyscribe Adenedal##186300
|tip 在建筑物内。
accept One Step Backwards##66719 |goto 62.14,16.30
|only if Evoker
step
use Adenedal's Tidy Purse##193376
打开阿登达尔的钱袋 |q 66719/1
|only if Evoker
step
use Ancient Mana Gem##198351
吞噬古代魔法 |q 66719/2
|only if Evoker
step
talk Skyscribe Adenedal##186300
|tip 在建筑物内。
turnin One Step Backwards##66719 |goto 62.14,16.30
|only if Evoker
step
talk Skyscribe Adenedal##186300
|tip 在建筑物内。
accept Proto Problems##65898 |goto 62.14,16.30
step
click The Black Locus
|tip 在平台上，俯瞰山谷。
|tip 你将被攻击。
collect The Black Locus##193601 |q 65898/1 |goto 60.60,17.37
kill Hypoxicron##186334 |q 65898/2 |goto 61.33,17.37
step
talk Skyscribe Adenedal##191154
|tip 在建筑物内。
turnin Proto Problems##65898 |goto 66.33,24.34
accept The Black Locus##66700 |goto 66.33,24.34
step
talk Telemancer Aerilyn##190089
turnin The Black Locus##66700 |goto 66.00,25.06
step
talk Hunter Narman##191924
告诉他“达瓦已经朝着池塘走去了。” |gossip 107089
与猎人纳尔曼交谈 |q 70721/1 |goto 63.62,40.47
step
在水边与纳尔曼和达瓦会面 |q 70721/2 |goto 46.70,60.47
|tip 在山顶上，靠近一个小水潭。
step
观察对话
talk Hunter Narman##197011
|tip 在山顶上，靠近一个小水潭。
turnin After My Ohn Heart##70721 |goto 46.70,60.47
step
talk Khansguard Jebotai##187787
|tip 在建筑物内。
turnin Hooves of War##66201 |goto 41.89,61.80
accept The Calm Before the Storm##66222 |goto 41.89,61.80
step
talk Elder Yuvari##188224
accept Up to No-khud##66651 |goto 40.93,61.63
step
talk Flightmaster Carseng##192865
fpath Teerakai |goto 39.98,61.13
step
talk Initiate Zorig##188225
turnin Up to No-khud##66651 |goto 39.05,66.02
accept Return to Mender##66652 |goto 39.05,66.02
step
kill Tombcaller Ganzaya##188509
|tip 他在这个区域游荡。
打断仪式 |q 66652/1 |goto 37.08,65.66
step
click Exhumed Spear
取回长矛 |q 66652/2 |goto 37.04,65.47
step
talk Initiate Zorig##188225
turnin Return to Mender##66652 |goto 39.04,66.02
accept Desecrator Annihilator##66654 |goto 39.04,66.02
accept Reagents of De-Necromancy##66655 |goto 39.04,66.02
stickystart "Collect_Intact_Skulls"
stickystart "Collect_Clumps_Of_Sacred_Soil"
stickystart "Slay_Desecrating_Centaurs"
step
在该区域击杀敌人
|tip 他们看起来像半人马。
获取#3#复生英雄的武器 |q 66654/2 |goto 34.92,66.84
'|kill Nokhud Desecrator##188511, Ukhel Gravestirrer##189928
step
label "Collect_Intact_Skulls"
击杀此区域内的复生敌人
|tip 它们看起来像蓝色幽灵犬和鸟。
collect 4 Intact Skull##191901 |q 66655/1 |goto 35.00,68.00
'|kill Risen Ohuna##189087, Risen Bakar##188510
step
label "Collect_Clumps_Of_Sacred_Soil"
click Disturbed Sacred Soil+
|tip 它们看起来像堆棕色泥土。
collect 6 Clump of Sacred Soil##193257 |q 66655/2 |goto 35.00,68.00
step
label "Slay_Desecrating_Centaurs"
在该区域击杀敌人 |notinsticky
|tip 他们看起来像半人马。|notinsticky
消灭10个亵渎的半人马 |q 66654/1 |goto 34.92,66.84
'|kill Nokhud Desecrator##188511, Ukhel Gravestirrer##189928
step
talk Initiate Zorig##189858
turnin Desecrator Annihilator##66654 |goto 33.75,65.35
turnin Reagents of De-Necromancy##66655 |goto 33.75,65.35
accept Zambul, Head Vandal##69936 |goto 33.75,65.35
step
kill Overseer Zambul##191145 |q 69936/1 |goto 34.92,66.84
|tip 他看起来像一个更大的半人马。
|tip 他在这片领域里四处游荡。
|tip 他将在你的小地图上以黄色点的形式出现。
step
talk Initiate Zorig##189858
turnin Zambul, Head Vandal##69936 |goto 33.75,65.35
accept Definitely Eternal Slumber##66656 |goto 33.75,65.35
step
kill Cathan the Determined##192224
|tip 她看起来像一只蓝色幽灵半人马。
|tip 她在这个区域巡视。
|tip 她将在你的小地图上以一个黄色点的形式出现。
use the Totem of Respite##194447
|tip 在她的尸体上使用它。
释放卡萨的灵魂 |q 66656/1 |goto 31.17,68.99
step
kill Zaphil the Defiant##192223
|tip 他看起来像一个蓝色幽灵半人马。
|tip 他在这个区域游荡。
|tip 他将在你的小地图上以黄色点的形式出现。
use the Totem of Respite##194447
|tip 在他的尸体上使用它。
释放扎菲尔的灵魂 |q 66656/2 |goto 31.01,71.02
step
kill Ganmat the Wise##192226
|tip 他看起来像一个蓝色幽灵半人马。
|tip 他在这个区域游荡。
|tip 他将在你的小地图上以黄色点的形式出现。
use the Totem of Respite##194447
|tip 在他的尸体上使用它。
释放甘玛特的灵魂 |q 66656/3 |goto 32.15,70.48
step
kill Dihar the Unyielding##192225
|tip 她看起来像一只蓝色幽灵半人马。
|tip 她在这个区域巡视。
|tip 她将在你的小地图上以一个黄色点的形式出现。
use the Totem of Respite##194447
|tip 在她的尸体上使用它。
释放迪哈尔的灵魂 |q 66656/4 |goto 32.63,71.42
step
_Next to you:_
talk Initiate Zorig##193985
turnin Definitely Eternal Slumber##66656
accept And Stay Dead!##66657
step
进入洞穴 |goto 31.69,70.43 < 15 |walk
kill Tombcaller Arban##190047 |q 66657/1 |goto 31.50,70.82
|tip 他看起来像个半人马。
|tip 他在洞穴内的这个区域游荡。
step
调查提拉之墓 |q 66657/2 |goto 31.04,70.93
|tip 洞内探险
step
调查玛鲁克之墓 |q 66657/3 |goto 31.48,71.46
|tip 洞内探险
step
_Next to you:_
talk Initiate Zorig##193985
turnin And Stay Dead!##66657
accept The Nokhud Offensive: Founders Keepers##66658
step
talk Scout Khenyug##189594
|tip 小屋内部。
告诉她“诺库德部族已向所有马鲁克宣战。” |gossip 55139
与侦察员凯纽格交谈 |q 66222/4 |goto 37.57,59.45
step
talk Herbalist Agura##188337
告诉他“战争即将来临，杰博泰要求你准备迎接伤亡。” |gossip 87457
与草药师阿古拉交谈 |q 66222/1 |goto 38.48,57.41
step
talk Khansguard Hojin##190585
|tip 他在这个区域游荡。
告诉他“巴拉卡尔已向卡纳姆·马特拉宣战。杰博泰希望你准备好护卫军。” |gossip 56252
与卡恩卫士霍金对话 |q 66222/3 |goto 39.50,55.35
step
talk Quartermaster Gensai##189593
|tip 小屋内部。
告诉他“诺库德氏族已经宣战，杰博泰请求您提供补给。” |gossip 54937
与军需官詹赛交谈 |q 66222/2 |goto 40.72,56.35
step
talk Elder Nazuun##190164
accept Land of the Apex##66687 |goto 41.64,56.75
accept Signs of the Wind##66688 |goto 41.64,56.75
step
click Fern Spores+
|tip 它们看起来像{绿}蕨类植物{}。
click Avian Feather+
|tip 它们看起来像棕色和白色的羽毛。
收集风之令牌#8# |q 66688/1 |goto 44.60,54.19
你可以在[46.43,52.17]附近找到更多。
step
click Offering Vessel
turnin Signs of the Wind##66688 |goto 49.35,49.53
step
talk Himia, The Blessed##190950
accept Himia, the Blessed##70374 |goto 49.34,49.41
step
talk Himia, The Blessed##190950
告诉她“我已准备好。” |gossip 56476
击杀波浪袭来的敌人
kill Earth Elemental##190173
击败元素 |q 70374/1 |goto 49.34,49.41
step
在此区域消灭雷脊敌人
|tip 它们看起来像大型和小型恐龙。
collect 2 Thunderspine Scale##193202 |q 66687/3 |goto 50.49,50.20
'|kill Thunderspine Rumbler##192941, Thunderspine Crasher##191057
step
kill Spider Eggs##191083+
|tip 它们看起来像墙壁旁的白色蛹蛋。
|tip 洞穴的每个角落。
kill Rustfang Creeper##187672+
|tip 它们看起来像大型巨蛛。
collect 10 Shadespinner's Web##193207 |q 66687/1 |goto 43.63,48.10
step
离开洞穴 |goto 43.63,48.10 < 20 |walk |only if subzone("Deadsnare Caverns") and _G.IsIndoors()
在此区域击杀灵巧之翼敌人
|tip 他们看起来像狼龙。
collect 2 Slyvern Talon##193206 |q 66687/2 |goto 42.65,46.55
'|kill Nimblewing Striker##192938, Nimblewing Slyvern##191051
step
talk Elder Nazuun##190164
turnin Land of the Apex##66687 |goto 41.64,56.75
turnin Himia, the Blessed##70374 |goto 41.64,56.75
accept Rellen, the Learned##66834 |goto 41.64,56.75
step
进入洞穴 |goto 40.35,57.41 < 15 |walk
click Offering Basket
|tip 洞内探险
观察对话
召唤雷伦 |q 66834/1 |goto 40.11,57.86
step
click Torch
|tip 洞内探险
获得火把 |q 66834/2 |goto 40.20,57.89
step
观察对话
|tip 使用{o}证明者雷伦{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 洞内探险
击杀织影者 |q 66834/3 |goto 40.20,57.89
step
click Spear
|tip 洞内探险
获得一根长矛 |q 66834/4 |goto 40.06,57.77
step
观察对话
|tip 使用{o}证明者雷伦{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 洞内探险
击杀雷脊 |q 66834/5 |goto 40.06,57.77
step
click Bow
|tip 洞内探险
获得一把弓 |q 66834/6 |goto 40.06,57.74
step
观察对话
|tip 使用{o}证明者雷伦{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 洞内探险
屠戮斯雷文 |q 66834/7 |goto 40.06,57.74
step
talk Elder Nazuun##190164
turnin Rellen, the Learned##66834 |goto 41.64,56.75
accept The Nokhud Offensive: The Final Ancestor##66690 |goto 41.64,56.75
step
talk Khansguard Jebotai##187787
|tip 在建筑物内。
turnin The Calm Before the Storm##66222 |goto 41.89,61.79
accept Boku the Mystic##70229 |goto 41.89,61.79
step
talk Initiate Boku##186290
|tip 在山顶上
turnin Boku the Mystic##70229 |goto 36.81,57.27
accept Pessimistic Mystic##66254 |goto 36.81,57.27
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 36.71,57.13 |count 1
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 36.66,57.71 |count 2
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 37.10,57.82 |count 3
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 37.20,57.26 |count 4
step
talk Initiate Boku##186290
turnin Pessimistic Mystic##66254 |goto 36.81,57.27
accept Mystic Mystery##66224 |goto 36.81,57.27
step
在特拉卡外遇见博库 |q 66224/1 |goto 44.56,61.96
step
click Boku's Belongings
收集博库的遗物 |gossip 56253
收集博库的物品 |q 66224/2 |goto 44.56,61.96
step
寻找博库 |q 66224/3 |goto 46.52,63.25
step
clicknpc Unidentified Centaur##190486
选择 _"<获取物品。>"_ |gossip 55390
|tip 你将被攻击。
调查未识别的半人马 |q 66224/4 |goto 46.52,63.25
step
继续寻找博库 |q 66224/5 |goto 49.31,63.22
step
talk Initiate Boku##187795
turnin Mystic Mystery##66224 |goto 49.31,63.22
step
talk Tigari Khan##195316
accept Toting Totems##66225 |goto 49.36,63.13
accept Taken By Storm##70195 |goto 49.36,63.13
stickystart "Collect_Bundles_Of_Totems"
step
kill Shela the Windbinder##194884
自由阿尔坦 |q 70195/1 |goto 48.90,69.04
collect Ridgewater Retreat Orders##198698 |q 70195/2 |goto 48.90,69.04
step
label "Collect_Bundles_Of_Totems"
在这个区域击杀诺库德敌人
collect 8 Bundle of Totems##193051 |q 66225/1 |goto 49.94,67.40
'|kill Nokhud Mystic-Hunter##186295, Nokhud Marauder##186299, Nokhud Mystic-Hunter##190958
step
talk Tigari Khan##190648
turnin Toting Totems##66225 |goto 49.36,63.12
turnin Taken By Storm##70195 |goto 49.36,63.12
accept Catching Wind##66236 |goto 49.36,63.12
step
talk Initiate Boku##187804
turnin Catching Wind##66236 |goto 58.11,68.97
accept Weather Control##66242 |goto 58.11,68.97
accept Eagle-itarian##66256 |goto 58.11,68.97
accept Fowl Sorcery##66257 |goto 58.11,68.97
stickystart "Slay_Primalists"
stickystart "Kill_Stormcaller_Initiates"
stickystart "Kill_Stormbound_Essences"
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.51,69.02 |count 1
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.06,67.43 |count 2
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 58.17,67.35 |count 1
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 57.86,64.89 |count 3
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.66,64.09 |count 4
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 58.86,61.83 |count 2
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.78,61.73 |count 5
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 59.65,64.03 |count 6
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 59.22,65.52 |count 3
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 61.77,66.66 |count 4
step
label "Slay_Primalists"
击杀该区域内的皮玛利斯特敌人
|tip 他们看起来像各种种族的人形生物。
斩杀#6#原始者 |q 66256/2 |goto 59.81,66.03
'|kill Primalist Instructor##195742, Primalist Stormsmith##187916, Prozela Galeshot##193669
step
label "Kill_Stormcaller_Initiates"
kill 6 Stormcaller Initiate##187817 |q 66242/2 |goto 59.35,66.22
|tip 他们看起来像风元素的半人马。
step
label "Kill_Stormbound_Essences"
kill 8 Stormbound Essence##187819 |q 66242/1 |goto 59.35,66.22
|tip 他们看起来像风元素。
step
talk Initiate Boku##187809
|tip 在山顶上
turnin Weather Control##66242 |goto 60.66,63.54
turnin Eagle-itarian##66256 |goto 60.66,63.54
turnin Fowl Sorcery##66257 |goto 60.66,63.54
accept Oh No, Ohn'ahra!##66258 |goto 60.66,63.54
step
观察对话
|tip 跟随{o}Boku{}并{o}保护他{}在与敌人战斗时。
在该区域击杀敌人
保护博库免受敌人侵害 |q 66258/1 |goto 60.42,64.73
解放奥纳哈拉 |q 66258/2 |goto 60.42,64.73
'|kill Agitated Essence##192238, Agitated Initiate##195674, Alerted Stormsmith##192236, Alerted Goliath##192237
step
talk Initiate Boku##195024
turnin Oh No, Ohn'ahra!##66258 |goto 61.42,62.78
accept A Storm of Ill Tidings##66259 |goto 61.42,62.78
step
talk Initiate Radiya##190014
turnin A Disgruntled Initiate##65906 |goto 56.26,75.96
accept Sneaking Out##65901 |goto 56.26,75.96
step
click Wind Totem
放置风图腾 |q 65901/1 |goto 56.65,76.27 |count 1
step
talk Flightmaster Huraq##195235
fpath Ohn'iri Springs |goto 56.68,76.59
step
click Wind Totem
放置风图腾 |q 65901/1 |goto 57.36,76.33 |count 2
step
click Wind Totem
放置风图腾 |q 65901/1 |goto 57.01,75.48 |count 3
step
talk Initiate Radiya##190014
告诉她“图腾已放置。” |gossip 55343
通知拉迪亚 |q 65901/2 |goto 56.25,75.95
step
talk Initiate Radiya##190014
turnin Sneaking Out##65901 |goto 54.79,66.40
accept Favorite Fruit##65907 |goto 54.79,66.40
step
click Wildsprings Shrub+
|tip 它们看起来像绿色灌木。
collect 6 Wild Bushfruit##192743 |q 65907/1 |goto 53.53,71.02
step
use the Wild Bushfruit##192743+
|tip 对{o}泥鳅行者{}使用它。
|tip 它们看起来像小型和大型{o}河马{}。
喂养 #6# 泥踢者 |q 65907/2 |goto 54.28,66.61
step
talk Initiate Radiya##190014
turnin Favorite Fruit##65907 |goto 54.79,66.40
accept A Promise Is A Promise##65770 |goto 54.79,66.40
step
talk Initiate Radiya##190014
告诉她“我承诺会保守你的秘密。” |gossip 55344
承诺光辉 |q 65770/1 |goto 54.79,66.40
step
在北方与瑞迪亚会面 |q 65770/2 |goto 53.11,64.01
step
talk Godoloto##190022
|tip 他飞落到岩石上。
turnin A Promise Is A Promise##65770 |goto 52.05,63.24
accept More Adventure Than Expected##65761 |goto 52.05,63.24
step
talk Initiate Radiya##190014
|tip 在建筑物内。
找到拉迪亚 |q 65761/3 |goto 47.51,54.12
step
talk Initiate Radiya##190014
|tip 在建筑物内。
turnin More Adventure Than Expected##65761 |goto 47.51,54.12
accept Stealing Its Thunder##65711 |goto 47.51,54.12
step
进入洞穴 |goto 47.54,56.07 < 20 |walk
kill Storm Extractor##190011 |q 65711/1 |goto 47.29,56.72
|tip 洞内探险
step
talk Lizi##190009
轻轻递上灌木果 |gossip 55367
安抚雷霆蜥蜴利兹 |q 65711/2 |goto 48.31,56.60
step
talk Initiate Radiya##190014
|tip 她冲向这个地点。
turnin Stealing Its Thunder##65711 |goto 48.27,56.49
accept Sneaking In##66676 |goto 48.27,56.49
step
talk Initiate Radiya##190014
回归拉迪雅在奥尼尔泉 |q 66676/1 |goto 56.20,77.10
step
talk Initiate Radiya##190014
turnin Sneaking In##66676 |goto 56.20,77.10
step
talk Quartermaster Huseng##196707
|tip 建筑内部，一楼。
accept Cultural Exchange##72117 |goto 60.40,37.72
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
告诉她“原始者已经捕获了奥纳哈拉，并与诺库德氏族结盟。” |gossip 56420
去玛鲁卡伊与卡纳姆·马特拉交谈 |q 66259/1 |goto 60.00,37.47
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
turnin A Storm of Ill Tidings##66259 |goto 60.00,37.47
accept Chasing the Wind##66327 |goto 60.00,37.47
step
观察对话
|tip 在建筑内部，顶层。
听取报告 |q 66327/1 |goto 60.00,37.47
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
告诉她“我明白了。” |gossip 56419
与卡纳姆·马特拉·萨雷斯交谈 |q 66327/2 |goto 60.00,37.47
step
在德鲁萨尔之角外遇见卡南·玛特拉·萨雷斯特 |q 66327/4 |goto 73.03,40.59
step
talk Khanam Matra Sarest##188068
turnin Chasing the Wind##66327 |goto 73.03,40.59
accept Nokhud Can Come of This##70244 |goto 73.03,40.59
step
在该区域击杀敌人
clicknpc Teerai Survivor##191097+
|tip 他们看起来像倒在地上的半人马。
夺回诺库德村庄 |q 70244/1 |goto 75.33,40.90
'|kill Primalist Stormfury##190945, Nokhud Warhound##190962, Nokhud Stormlasher##188231, Nokhud Raider##188230, Nokhud Scavenger##185445, Primalist Tempest##190946
step
kill Warmonger Kharad##190932 |q 70244/2 |goto 76.14,40.87
|tip 他是精英。
|tip 你的盟友会帮助你战斗。
step
talk Khanam Matra Sarest##191494
turnin Nokhud Can Come of This##70244 |goto 76.70,40.93
accept Blowing of the Horn##66329 |goto 76.70,40.93
step
talk Khanam Matra Sarest##188068
告诉她“我已准备好！” |gossip 54892
与卡纳姆·马特拉·萨雷斯交谈 |q 66329/1 |goto 76.70,40.93
step
talk Khanam Matra Sarest##188068
turnin Blowing of the Horn##66329 |goto 76.70,40.93
accept Green Dragon Down##66328 |goto 76.70,40.93
step
寻找绿色龙族 |q 66328/1 |goto 72.35,50.33
step
talk Khanam Matra Sarest##188068
告诉她“让我们自我解释一下”。 |gossip 56207
与可汗玛特拉交谈 |q 66328/2 |goto 72.35,50.33
step
观察对话
倾听讨论 |q 66328/3 |goto 72.35,50.33
step
talk Khanam Matra Sarest##188068
turnin Green Dragon Down##66328 |goto 72.35,50.33
step
talk Flightmaster Nakeena##191622
|tip 悬崖上
fpath Pinewood Post |goto 80.43,57.89
step
talk Sentinel Olekk##190024
turnin Trouble In The Pines##65837 |goto 81.03,58.91
accept Tempests Abound##66681 |goto 81.03,58.91
step
talk Scout Watu##190025
accept Counting Sheep##66680 |goto 81.03,58.97
step
talk Sondo##191397
buy Diced Meat##193890 |q 66680/1 |goto 80.64,58.76
step
clicknpc Wish##191408
选择 _"<提供切丁肉。>"_ |gossip 55180
许愿治疗 |q 66680/2 |goto 81.03,59.54
stickystart "Accept_More_Than_A_Rock"
stickystart "Slay_Stormtouched_Beasts"
step
use Wish's Whistle##193892
|tip 对{o}失落的阿卡利{}使用它。
|tip 它们看起来像黑白色的犏牛。
拯救#5#失落的阿尔加利 |q 66680/3 |goto 82.20,64.51
'|clicknpc Lost Argali##190041
step
label "Accept_More_Than_A_Rock"
在该区域击杀敌人
collect Stormtouched Shards##194031 |n
|tip 当你拾取物品时，任务将自动接受。
accept More Than A Rock##66689 |goto 82.20,64.51
'|kill Craggy Stag##191541, Pinehoof Doe##191496, Insatiable Vulture##191545, Rumbling Blackpaw##191665, Insatiable Vulture##191551
step
label "Slay_Stormtouched_Beasts"
在该区域击杀敌人
击杀8只风暴触碰的野兽 |q 66681/1 |goto 82.20,64.51
'|kill Craggy Stag##191541, Pinehoof Doe##191496, Insatiable Vulture##191545, Rumbling Blackpaw##191665, Insatiable Vulture##191551
step
talk Scout Watu##190025
turnin Counting Sheep##66680 |goto 81.03,58.97
turnin Tempests Abound##66681 |goto 81.03,58.97
turnin More Than A Rock##66689 |goto 81.03,58.97
accept Last Resort Analysis##66683 |goto 81.03,58.97
step
talk Basaan##191392
问他“你知道这个碎片的事吗？” |gossip 55375
询问巴萨恩 |q 66683/1 |goto 80.96,59.53
step
talk Sondo##191397
问他“你知道这个碎片的事吗？” |gossip 55374
询问索恩多 |q 66683/3 |goto 80.64,58.76
step
talk Flightmaster Nakeena##191622
问她 "你知道这个碎片的事吗？" |gossip 55376
询问纳基娜 |q 66683/2 |goto 80.43,57.88
step
talk Scout Watu##190025
turnin Last Resort Analysis##66683 |goto 81.03,58.97
accept Show of Storm##65836 |goto 81.03,58.97
step
与侦察员瓦图重新集结 |q 65836/1 |goto 84.05,60.73
step
kill Stormed Blackpaw##193827 |q 65836/2 |goto 84.05,60.73
|tip 看起来像是一只黑色的熊猫。
step
观察对话
talk Scout Watu##190025
|tip 他跑到这个地点。
turnin Show of Storm##65836 |goto 83.98,60.73
accept Storm Chasing##66684 |goto 83.98,60.73
step
进入洞穴 |goto 84.84,63.27 < 20 |walk
click Storm Pylon
|tip 洞内探险
摧毁风暴塔 |q 66684/1 |goto 85.02,64.22
step
talk Scout Watu##190025
turnin Storm Chasing##66684 |goto 80.85,58.95
step
talk Jhara##191391
|tip 在建筑物内。
home Pinewood Post |goto 81.33,59.31 |q 66344 |future
step
talk Merithra##188156
accept With the Wind At Our Backs##66344 |goto 72.46,50.79
step
talk Gerithus##189697
告诉他“我准备好了。” |gossip 54859
与Gerithus翱翔 |q 66344/1 |goto 72.30,50.72
step
开始飞往阴暗庇护所 |invehicle |goto 72.30,50.72 |q 66344
step
观察对话
飞往阴暗避难所 |outvehicle |goto 28.62,58.21 |q 66344 |notravel
step
talk Merithra##188106
turnin With the Wind At Our Backs##66344 |goto 28.26,57.69
accept Shady Sanctuary##70220 |goto 28.26,57.69
step
talk Guard-Captain Alowen##194899
告诉她“原始者正在行动。梅瑞莎召唤飞行队伍出战！” |gossip 56367
与卫兵队长阿洛温对话 |q 70220/1 |goto 29.06,55.26
step
talk Sidra the Mender##194902
告诉她“你在前线是必要的。” |gossip 56204
与修复者伊西德拉交谈 |q 70220/3 |goto 30.19,55.68
step
talk Aronus##188972
与阿罗努斯对话以访问梅瑞萨的守望 |q 70220/4 |goto 29.28,56.43
step
talk Aronus##188972
告诉我 “带我去梅瑞莎的观察台。” |gossip 56101
与阿罗努斯共舞 |invehicle |goto 29.28,56.43 |q 70220
step
飞往梅里萨的守望 |outvehicle |goto 29.51,60.34 |q 70220 |notravel
step
talk Viranikus##194903
|tip 在平台上，俯瞰山谷。
告诉它“半人马氏族已宣誓支持。集结你的部队！” |gossip 56205
与维兰尼斯交谈 |q 70220/5 |goto Ohn'ahran Plains/0 30.03,60.25
step
talk Sariosa##186487
fpath Shady Sanctuary |goto 29.82,57.64
step
talk Sariosa##186487
告诉她“古树之枝正处于危险之中！请帮忙传达这个消息。” |gossip 56235
与萨里奥萨交谈 |q 70220/2 |goto 29.82,57.64
step
talk Gracus##186503
|tip 他看起来像个巨大的行走树人。
|tip 他在这个区域游荡。
accept Some Call Me Bug Catcher##70062 |goto 29.91,58.42
step
kill Flyspawn Beetle##193996+
|tip 它们看起来像空中的虫子。
收集 #6# 飞行幼虫甲壳虫部件 |q 70062/1 |goto 29.73,58.08
step
talk Gracus##186503
|tip 他看起来像个巨大的行走树人。
|tip 他在这个区域游荡。
turnin Some Call Me Bug Catcher##70062 |goto 29.91,58.42
accept Others Call Me Duck Herder##70069 |goto 29.91,58.42
step
click Duck+
|tip 它们看起来像各种名字的小鸟。
|tip 他们在这个地区游荡。
馈食 #4# 小鸭 |q 70069/1 |goto 30.96,56.14
step
talk Gracus##186503
|tip 他看起来像个巨大的行走树人。
|tip 他在这个区域游荡。
turnin Others Call Me Duck Herder##70069 |goto 29.91,58.42
accept But... I Am the Hero of Ducks##70070 |goto 29.91,58.42
step
talk Merithra##188106
turnin Shady Sanctuary##70220 |goto 28.26,57.69
accept The Primalist Front##66331 |goto 28.26,57.69
step
寻找烟火制造器 |q 70070/1 |goto 27.19,56.43
step
kill Queasy Hornswog##194003
|tip 看起来像一只大型灰色青蛙。
让恶心的喉咙呕吐 |q 70070/2 |goto 27.19,56.43
step
talk Celina Crunchyleaves##186303
accept Find Theramus##65899 |goto 25.06,56.89
step
进入洞穴 |goto 24.76,63.53 < 20 |walk
talk Theramus##186313
|tip 洞内探险
问他 "你是塞拉摩斯吗？" |gossip 54644
寻找塞尔穆斯 |q 65899/2 |goto 24.85,64.46
step
talk Celina Crunchyleaves##186303
turnin Find Theramus##65899 |goto 24.43,63.01
accept Can't Beat Fluffy##65903 |goto 24.43,63.01
step
talk Felina Starrunner##185726
accept Suspiciously Spiced Steak##65900 |goto 24.46,63.05
step
use the Versatile Longnet##191134
|tip 将其使用在{o}林地跳虫{}身上。
|tip 它们看起来像小兔子。
捕捉#12#林地跃跃者 |q 65903/1 |goto 23.18,65.34
'|clicknpc Glade Hopper##187473
stickystart "Collect_Reptilian_Eggshells"
stickystart "Collect_Sourblooms"
step
kill Mud Snapper##186308+
|tip 他们看起来像大型龟类。
collect 3 Perfectly Tender Turtle Meat##191085 |q 65900/1 |goto 22.46,61.27
step
label "Collect_Reptilian_Eggshells"
click Reptilian Eggshell##376695+
|tip 它们看起来像是大棕色和白色的破碎巨龙卵。
collect 6 Reptilian Eggshell##191084 |q 65900/2 |goto 22.46,61.27
step
label "Collect_Sourblooms"
click Sourbloom##376082+
|tip 它们看起来像橙色的花朵。
collect 15 Sourbloom##191083 |q 65900/3 |goto 22.46,61.27
step
talk Celina Crunchyleaves##186303
turnin Can't Beat Fluffy##65903 |goto 24.43,63.01
step
talk Felina Starrunner##185726
交出材料 |gossip 55348
将材料交给费琳娜·星奔者 |q 65900/4 |goto 24.46,63.05
step
观察对话
talk Felina Starrunner##185726
turnin Suspiciously Spiced Steak##65900 |goto 24.46,63.05
accept Food or Floof##65902 |goto 24.46,63.05
step
进入洞穴 |goto 24.76,63.53 < 20 |walk
talk Theramus##186313
|tip 洞内探险
告诉他“我带来了你最喜欢的食物。” |gossip 54645
喂养塞拉穆斯 |q 65902/1 |goto 24.85,64.46
step
clicknpc Place glade hoppers##186970
|tip 洞内探险
释放林地跳跃者 |q 65902/2 |goto 24.82,64.59
step
talk Felina Starrunner##185726
turnin Food or Floof##65902 |goto 24.46,63.05
accept More Than Weeds##65905 |goto 24.46,63.05
step
talk Celina Crunchyleaves##186303
accept Proof of Negligence##65937 |goto 24.43,63.01
stickystart "Collect_Pulsating_Thorn"
stickystart "Clear_Out_The_Lilac_Ramble"
step
talk Injured Cub##186378
|tip 这看起来像是一只小熊。
选择 _"<尝试捡起小兽。>"_ |gossip 55203
拯救受伤幼崽 |q 65937/2 |goto 24.87,60.33
step
click Trampled Bush
collect Decayed Flower##191086 |q 65937/1 |goto 25.81,59.61
step
label "Collect_Pulsating_Thorn"
kill Wrathful Orchid##186321+
|tip 它们看起来像是带牙齿的植物。
collect Pulsating Thorn##191568 |q 65937/3 |goto 25.35,60.66
step
label "Clear_Out_The_Lilac_Ramble"
在该区域击杀敌人
click Creeping Dreadweed+
|tip 它们看起来像棕色灌木。
清理湖畔紫丁香 |q 65905/1 |goto 25.19,60.38
'|kill Wrathful Orchid##186321, Ashen Groveripper##187872, Flyspawn Beetle##186456
step
talk Felina Starrunner##185726
turnin More Than Weeds##65905 |goto 24.46,63.05
step
talk Celina Crunchyleaves##186303
turnin Proof of Negligence##65937 |goto 24.43,63.01
accept Enough Is Enough##65904 |goto 24.43,63.01
step
进入洞穴 |goto 24.76,63.53 < 20 |walk
talk Theramus##186313
|tip 洞内探险
告诉他“你需要看看这个，塞拉姆斯。” |gossip 55161
向塞尔玛斯展示证据 |q 65904/1 |goto 24.58,64.14
step
观察对话
|tip 洞内探险
talk Celina Crunchyleaves##186303
turnin Enough Is Enough##65904 |goto 24.56,63.96
step
talk Felina Starrunner##185726
|tip 洞内探险
accept In Memory of Ysera##66011 |goto 24.53,63.96
step
跟随塞莉娜和菲莉娜 |q 66011/1 |goto 24.94,65.90
|tip 洞穴之上，外面。
step
talk Theramus##186313
告诉他“我明白了。” |gossip 55162
与塞尔马斯交谈 |q 66011/2 |goto 24.94,65.90
step
观察对话
恢复圣 shrine |q 66011/3 |goto 24.94,65.90
step
talk Theramus##187270
turnin In Memory of Ysera##66011 |goto 24.94,65.90
step
talk Belika##186175
告诉她“梅瑞莎派我来听你报告。” |gossip 55238
听阿鲁和贝利卡的报告 |q 66331/3 |goto 27.56,46.00
step
talk Boku##191325
告诉他，我来这儿是为了听取你的报告。 |gossip 55239
听取博库的报告 |q 66331/2 |goto 25.72,44.26
step
talk Ohn Seshteng##191343
告诉她"听起来轻而易举，我准备好了！" |gossip 55240
观察对话
|tip 你将像鸟一样翱翔。
|tip 你可以点击箭头按钮离开载具，开始飞行后。
|tip 目标将在你无需听故事的情况下完成。
听取奥恩·塞斯滕的报告 |q 66331/4 |goto 26.18,40.07
step
talk Merithra##189599
告诉她“展现你所见的一切。” |gossip 55241
与梅里萨交谈 |q 66331/5 |goto 25.63,40.51
step
talk Khanam Matra Sarest##188601
turnin The Primalist Front##66331 |goto 25.67,40.43
step
talk Merithra##189599
accept Justice for Solethus##66333 |goto 25.63,40.51
stickystart "Kill_Nokhud_Warmongers"
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 24.81,39.89 |count 1
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 24.37,38.47 |count 2
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 25.44,37.72 |count 3
step
label "Kill_Nokhud_Warmongers"
kill 3 Nokhud Warmonger##188341 |q 66333/1 |goto 24.49,37.45
|tip 他们看起来像携带长矛的大型半人马。
step
_Next to you:_
talk Khanam Matra Sarest
turnin Justice for Solethus##66333
accept Deconstruct Additional Pylons##66335
accept Starve the Storm##66784
'|talk Khanam Matra Sarest##191494
step
kill Primalist Storm-Summoner##191259+
|tip 他们有{o}3个{}。
|tip 在开阔的洞穴内
禁用风暴通道 |q 66784/1 |goto 24.94,34.90
step
_Next to you:_
talk Khanam Matra Sarest
turnin Starve the Storm##66784
'|talk Khanam Matra Sarest##191494
step
标记第二个始源者塔 |q 66335/2 |goto 23.20,37.45
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
标记第三原始者电塔 |q 66335/3 |goto 21.44,37.58
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
标记第一座原始图腾 |q 66335/1 |goto 23.91,39.38
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
_Next to you:_
talk Khanam Matra Sarest
turnin Deconstruct Additional Pylons##66335
accept Stormbreaker##66337
'|talk Khanam Matra Sarest##191494
step
kill Stormbound Proto-Drake##195094
|tip 你的盟友将帮助你作战。
|tip 当龙鳞在约35%生命值时，{o}科罗雷斯出现{}，击杀它。
|tip 在龙死亡后，她将会攻击你。
kill Koroleth##188180 |q 66337/1 |goto 22.38,39.80
step
talk Gerithus##195136
告诉他“带我去梅里莎。” |gossip 63840
与盖瑞图斯交谈 |q 66337/2 |goto 22.92,40.20
step
观察对话
归返梅瑞莎 |outvehicle |goto 25.66,47.84 |q 66337 |notravel
step
talk Merithra##188150
turnin Stormbreaker##66337 |goto 25.65,48.40
accept The Isle of Emerald##66336 |goto 25.65,48.40
step
talk Merithra##188181
turnin The Isle of Emerald##66336 |goto 22.14,50.98
accept Renewal of Vows##66783 |goto 22.14,50.98
step
talk Sansok Khan##188246
选择她第一次狩猎的奖杯 |gossip 54952
clicknpc Shikaar Spear##191195
|tip 它出现在她的手中。
夺矛 |havebuff Sansok's Offering##375466 |goto 22.28,50.88 |q 66783
step
talk Merithra##188181
把她告诉：“这就是萨索克·汗在第一次狩猎后获得的武器。” |gossip 56430
接受桑索克·卡恩的献祭 |q 66783/1 |goto 22.14,50.97
step
talk Tigari Khan##191156
建议她提供一根鹰羽。 |gossip 54951
clicknpc Ohuna Feather##191209
|tip 它出现在她的手中。
带走羽毛 |havebuff Tigari's Offering##375472 |goto 22.37,51.05 |q 66783
step
talk Merithra##188181
告诉她：“这里是来自奥纳哈拉的一根羽毛，随风而起。” |gossip 56431
接受提卡里·汗的馈赠 |q 66783/2 |goto 22.14,50.98
step
talk Khanam Matra Sarest##188601
选择 _"<建议她献血。>"_ |gossip 54948
clicknpc Horn of the Khanam Matra##191208
|tip 它出现在她的手中。
夺取号角 |havebuff Khanam Matra's Offering##375470 |goto 22.34,50.95 |q 66783
step
talk Merithra##188181
告诉她：“这是Teerai氏族未断绝血脉的证据，他们是半人马Teera的直系后裔。” |gossip 56432
接受卡纳姆·马特拉的奉献 |q 66783/3 |goto 22.14,50.98
step
clicknpc Everblooming Soil##197601
|tip 它出现在梅瑞思拉的手中。
取土 |havebuff Merithra's Offering##391289 |goto 22.15,50.98 |q 66783
step
talk Khanam Matra Sarest##188601
请接受梅瑞萨的赠礼给半人马部落。 |gossip 63841
给予梅瑞莎的献祭 |q 66783/4 |goto 22.34,50.95
step
talk Merithra##188181
turnin Renewal of Vows##66783 |goto 22.14,50.98
accept Into the Azure##66340 |goto 22.14,50.98
step
talk Khanam Matra Sarest##188601
accept The Nokhud Offensive: The Wind Belongs to the Sky##66339 |goto 22.34,50.95
step
talk Gracus##186503
|tip 他看起来像一棵巨型树人。
|tip 他在这个区域游荡。
turnin But... I Am the Hero of Ducks##70070 |goto 29.91,58.42
step
talk Healer Selbekh##192621
accept The Trouble with Taivan##67772 |goto 61.22,40.01
step
clicknpc Taivan##196665
刷泰凡 |q 67772/1 |goto 61.13,40.01
step
click Pelt Bundle
拾取毛皮包裹 |q 67772/2 |goto 61.19,39.70
step
click Pelt Bundle Location
|tip 在泰瓦恩的背上
放置皮毛包 |q 67772/3 |goto 61.13,40.01
step
talk Taivan##196675
去找猎人贾达尔，泰瓦恩。我在那里等你。 |gossip 106972
将泰瓦恩送到猎人贾达尔 |q 67772/4 |goto 61.13,40.01
step
在水源地遇见猎人贾达尔 |q 67772/5 |goto 71.42,49.60
step
talk Hunter Jadar##192629
turnin The Trouble with Taivan##67772 |goto 71.42,49.60
accept The Hunting Hound##67921 |goto 71.42,49.60
step
talk Taivan##194292
告诉它“让我们狩猎吧，少年！” |gossip 56209
与泰万对话 |q 67921/1 |goto 71.43,49.42
step
在该区域击杀敌人
|tip 它们看起来像各种兽类。
猎杀 #5# 危险野兽与泰瓦恩 |q 67921/2 |goto 73.67,49.53
'|kill Plains Rockfang##193384, Horned Plainstomper##193407, Mosshair Mammoth##193395, Grazing Broadhoof##193386, Broadhoof Bull##193385, Mosshair Bull##193394
step
talk Hunter Jadar##192629
turnin The Hunting Hound##67921 |goto 71.42,49.61
accept Part of a Pack##70989 |goto 71.42,49.61
step
kill Ravenous Proto-Drake##193145 |q 70989/1 |goto 73.97,49.37
|tip 它看起来像一只在空中飞翔的大型绿龙。
|tip 它将在你的小地图上显示为一个黄色点标。
|tip 它是精英怪，但你应该能打败它。
step
talk Hunter Jadar##192629
turnin Part of a Pack##70989 |goto 71.42,49.60
accept Try Again, Taivan!##68083 |goto 71.42,49.60
step
talk Healer Selbekh##192621
turnin Try Again, Taivan!##68083 |goto 61.22,40.01
accept The Gentle Giant##68084 |goto 61.22,40.01
step
talk Taivan##188247
去找牧师特瓦泰，泰凡。我会在那里等你。 |gossip 56231
与泰万对话 |q 68084/1 |goto 61.13,40.01
step
在玛拉基与牧羊人特瓦泰会面 |q 68084/2 |goto 49.06,41.08
step
talk Shepherd Tevatei##192633
turnin The Gentle Giant##68084 |goto 49.06,41.08
accept Shaping a Shepherd##68085 |goto 49.06,41.08
step
talk Taivan##194292
问它“你准备好尝试这个了吗，勇士？” |gossip 56208
与泰万对话 |q 68085/1 |goto 48.97,40.92
step
指挥泰凡驱赶#3#阿尔戈利 |q 68085/2 |goto 48.92,40.87
|tip 使用指令 泰万 执行驱赶能力 对 阿依拉格 獐。
|tip 它在屏幕上显示为一个按钮。
|tip 他们看起来像公羊。
|tip 它们将在你的小地图上出现为黄色点。
'|clicknpc Aylaag Argali##193183
step
追逐阿卡利进入圈内 |q 68085/3 |goto 49.51,41.48
|tip 使用{o}自己驱赶它们!{}技能对{o}艾亚拉格羊{}。
|tip 它在屏幕上显示为一个按钮。
|tip 他们看起来像公羊。
|tip 它们将在你的小地图上出现为黄色点。
|tip 使用技能后，{o}继续在它旁边跑{}。
|tip 将其指向此地点的围栏。
'|clicknpc Aylaag Argali##196969
step
talk Shepherd Tevatei##192633
turnin Shaping a Shepherd##68085 |goto 49.06,41.08
accept Reign of the Ram##71022 |goto 49.06,41.08
step
kill Stubborn Ram##195849
|tip 使用{o}指令泰瓦恩{ }对抗{o}顽固的公羊{ }技能。
|tip 它在屏幕上显示为一个按钮。
|tip 它会攻击你，当它的生命值降低到一定程度时最终会{o}投降{}。
面对顽固的山羊 |q 71022/1 |goto 49.65,39.45
step
talk Shepherd Tevatei##192633
turnin Reign of the Ram##71022 |goto 49.05,41.08
accept Danger in Daruukhan##68087 |goto 49.05,41.08
step
talk Teerai Messenger##193586
|tip 他跑到这个地点。
告诉他“我会立刻前往达鲁汉。” |gossip 64043
与提尔瑞信使交谈 |q 68087/1 |goto 49.07,40.95
step
talk Flightmaster Washengtu##191814
fpath Broadhoof Outpost |goto 46.57,41.29
step
在达鲁卡汉与治疗者塞尔贝克会面 |q 68087/2 |goto 52.83,29.85
step
talk Healer Selbekh##192621
turnin Danger in Daruukhan##68087 |goto 52.83,29.85
accept Saving Centaur##69094 |goto 52.83,29.85
step
clicknpc Heavy Beam##196118
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
救援编织者达乌 |q 69094/1 |goto 52.13,29.66
step
观察对话
clicknpc Weaver Daavu##196009
|tip 泰万将把他带走。
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
救援编织者达乌 |q 69094/2 |goto 52.12,29.66
step
clicknpc Leatherworker Tukhtai##196179
|tip 破碎小屋内。
|tip 泰万将把她带走。
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
拯救皮革工匠图克泰 |q 69094/4 |goto 52.27,29.11
step
clicknpc Heavy Beam##196166
观察对话
|tip 泰瓦纳将移动木材。
clicknpc Weaver Sagaa##196180
|tip 泰万将把她带走。
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
救援编织者萨嘎 |q 69094/5 |goto 51.62,29.15
step
clicknpc Smith Gaan##196175
|tip 燃烧的小屋内部
|tip 泰万将把他带走。
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
拯救史密斯·甘 |q 69094/3 |goto 51.49,30.38
step
clicknpc Heavy Beam##196167
clicknpc Fletcher Nisekh##196187
|tip 泰万将把他带走。
|tip 如果没有发生任何事情，回到{o}治疗师塞尔贝克{}那里告诉他，_你能叫泰瓦恩来吗？_ 然后再试一次。
救援弓箭手尼塞克 |q 69094/6 |goto 52.19,30.41
step
talk Healer Selbekh##192621
|tip 你可能需要去找她谈谈，以便召唤泰万，如果他还不在附近的话。
turnin Saving Centaur##69094 |goto 52.83,29.84
accept Homeward Hound##69095 |goto 52.83,29.84
step
talk Taivan##194292
告诉它“我们回家吧，伙伴！” |gossip 87458
与泰万对话 |q 69095/1 |goto 52.71,30.01
step
观察对话
骑乘泰凡到达玛鲁卡依 |q 69095/2 |goto 61.13,40.01 |notravel
step
talk Healer Selbekh##192621
turnin Homeward Hound##69095 |goto 61.22,40.01
accept Taivan's Purpose##69096 |goto 61.22,40.01
step
talk Chimei##193112
问候她 "你好，你还好吗？" |gossip 94791
尝试与赤霄交流 |q 69096/1 |goto 61.81,38.58
step
talk Chimei##193112
选择 _"<尝试轻拍赤眉的肩膀。>"_ |gossip 95243
再试着与翡翠聊聊 |q 69096/2 |goto 61.81,38.58
step
观察对话
|tip 泰万将与池煤并肩卧。
等待塔万的行动 |q 69096/3 |goto 61.81,38.58
step
talk Healer Selbekh##192621
turnin Taivan's Purpose##69096 |goto 61.82,38.73
step
talk Flightmaster Rynaam##192838
fpath Forkriver Crossing |goto 71.65,79.07
step
打开职业面板
|tip 按 {o}K{} 打开它。
|tip 在进行下一步之前，必需获得{o}必要物品{}。
点击此处继续 |confirm |q 69919 |future
step
talk Azley##193108
accept Targeted Ads##69915 |goto 72.05,81.14
accept A Craft in Need##69919 |goto 72.05,81.14 |only if hasprof("Dragon Isles Alchemy",1) or hasprof("Dragon Isles Blacksmtihing",1) or hasprof("Dragon Isles Cooking",1) or hasprof("Dragon Isles Enchanting",1) or hasprof("Dragon Isles Engineering",1) or hasprof("Dragon Isles Inscription",1) or hasprof("Dragon Isles Jewelcrafting",1) or hasprof("Dragon Isles Leatherworking",1) or hasprof("Dragon Isles Tailoring",1)
step
talk Azley##193108
告诉她"告诉我工匠公会的制作规则。"
向阿兹雷学习工匠联盟的规则 |q 69919/1 |goto 72.05,81.14
|only if haveq(69919) or completedq(69919)
step
talk Azley##193108
turnin A Craft in Need##69919 |goto 72.05,81.14
|only if haveq(69919) or completedq(69919)
step
在这个区域击杀山羊敌人
|tip 它们看起来像各种颜色的公羊。
collect "Order Anything Crafters Make!"##198346 |q 69915/1 |goto 75.99,84.53
collect "Public Orders: Fast and Made For You!"##198347 |q 69915/2 |goto 75.99,84.53
collect "Custom High-Quality Gear: Better Business with Personal Orders!"##198348 |q 69915/3 |goto 75.99,84.53
'|kill Forkriver Goat##193730, Meddlesome Goat##196212
step
talk Azley##193108
turnin Targeted Ads##69915 |goto 72.05,81.14
accept Customer Satisfaction##69981
step
talk Bree'zin##193778
告诉他“工匠联盟想知道你的重铸订单进展如何。” |gossip 55653
问他“你通过重铸提高了项链的品质？” |gossip 55652
寻找顽强的草药师 |q 69981/1 |goto 74.61,81.04
step
talk Duncan Ironeye##193780
|tip 瀑布底部附近
告诉他“工匠联盟想知道你的重铸订单进展如何。” |gossip 55648
问他“他们通过重铸你的装备来更改可选材料了吗？” |gossip 55647
寻找坚定的探矿者 |q 69981/2 |goto 77.27,73.14
step
click Eznuu##378862
寻找艾兹努 |q 69981/3 |goto 67.03,80.89
step
talk Azley##193108
展示阿兹雷尔你找到的东西。 |gossip 55602
回归艾兹雷尔 |q 69981/4 |goto 72.05,81.14
step
talk Mahra Treebender##193835
turnin Customer Satisfaction##69981 |goto 71.84,81.31
step
_NOTE:_
攻略剩余部分
|tip 本指南剩余的步骤将带你完成{o}地城任务{}。
|tip 这些地城任务是必需的，以获得Ohn'ahron平原的旅者成就。
|tip 你现在可以完成它们，或者稍后返回此指南来完成成就。
|tip 如果你想要继续升级，请按照下一个步骤点击，直到下一个指南加载。
点击此处继续 |confirm |q 66690
stickystart "Retrieve_Maruuks_Spear"
stickystart "Collect_Medallion_Of_The_Ancestors"
step
_Inside the Nokhud Offensive Dungeon:_
|tip 使用{o}团队搜索器{}进入{o}诺库德攻势{}地下城。
kill Teera##195723
|tip 她是副本里的BOSS。
collect Sarantuya the Ever-True##200115 |n
寻找提拉的弓 |q 66658/1
step
label "Retrieve_Maruuks_Spear"
_Inside the Nokhud Offensive Dungeon:_ |notinsticky
kill Maruuk##186338
|tip 他是副本里的首领。
collect Batubar the Relentless##200100 |n
取回马鲁克之矛 |q 66658/2
step
label "Collect_Medallion_Of_The_Ancestors"
_Inside the Nokhud Offensive Dungeon:_ |notinsticky
kill Balakar Khan##186151
|tip 他是副本里的首领。
collect Medallion of the Ancestors##193483 |q 66690/1
step
回归欧纳哈兰平原 |complete zone("Ohn'ahran Plains") |q 66690
|tip 离开副本
step
进入洞穴 |goto 40.29,59.43 < 15 |walk
click Teera's Bow##377538
|tip 洞内探险
放置提尔拉之弓 |q 66658/3 |goto 40.09,58.36
step
click Maruuk's Spear##377537
|tip 洞内探险
放置马鲁克之矛 |q 66658/4 |goto 39.60,59.06
step
talk Initiate Zorig##190068
turnin The Nokhud Offensive: Founders Keepers##66658 |goto 41.00,61.62
step
talk Elder Nazuun##190164
turnin The Nokhud Offensive: The Final Ancestor##66690 |goto 41.64,56.75
step
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)"		|only if not completedq(72293)
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)",{
author="support@zygorguides.com",
},[[
step
talk Masud the Wise##185599
turnin Into the Azure##66340 |goto Ohn'ahran Plains/0 71.66,80.58 |only if haveq(66340) or completedq(66340)
turnin Azure Span##72268 |goto Ohn'ahran Plains/0 71.66,80.58 |only if haveq(72268) or completedq(72268)
accept To the Azure Span##65686 |goto Ohn'ahran Plains/0 71.66,80.58
step
talk Glania of the Blessed Ones##185603
turnin To the Azure Span##65686 |goto The Azure Span/0 41.44,35.61
accept Camp Antonidas##66228 |goto The Azure Span/0 41.44,35.61 |only if not Dracthyr
step
talk Scalecommander Emberthal##197023
accept Shades of Blue##70746 |goto 41.45,35.90
|only if Dracthyr
step
talk Khuri##185608
accept Some Good Fishing##66227 |goto 41.46,35.63
step
talk Khuri##185608
向库里学习钓鱼技能 |q 66227/1 |goto 41.46,35.63
step
cast Fishing##131474
|tip 点击{o}钓鱼浮漂{}当它{o}在水中弹跳{}时。
|tip 不断重复这个过程。
鱼 #3# 蓝尾小鲤 |q 66227/3 |goto 41.35,35.56
step
talk Khuri##185608
turnin Some Good Fishing##66227 |goto 41.46,35.63
step
talk Miva Star-Eye##192750
accept Arcane Detection##67174 |goto 41.22,35.88
step
click Unassuming Flask
|tip 它看起来像一个小棕色袋子。
观察不起眼的瓶子 |q 67174/1 |goto 41.39,35.70
step
click Dusty Teapot
|tip 看起来像一个白色的锅。
|tip 在皮革篮子里。
审视尘封的茶壶 |q 67174/2 |goto 41.41,35.84
step
click Toolk's Toy Boat
|tip 看起来像是一艘小型舰船。
没收图克的玩具船 |q 67174/3 |goto 41.23,36.39
step
talk Miva Star-Eye##192750
turnin Arcane Detection##67174 |goto 41.22,35.88
accept How To Stop An Exploding Toy Boat##67175 |goto 41.22,35.88
step
talk Julk##192751
告诉她“你的女儿和一艘危险的...船私奔了。我们需要去夺取它或驱散它的魔法。” |gossip 55247
观察对话
与朱克交谈 |q 67175/1 |goto 41.20,35.86
step
click Wand of Dispelling
|tip 看起来像是一个法杖。
collect Miva's Dispelling Wand##194900 |q 67175/2 |goto 41.19,35.90
step
click Unstable Toy Boat
|tip 看起来像是一艘小型舰船。
驱散玩具船上的奥术魔法 |q 67175/3 |goto 40.59,36.56
step
talk Miva Star-Eye##192750
turnin How To Stop An Exploding Toy Boat##67175 |goto 41.22,35.88
step
在安托尼斯营地外与艾柏萨尔和泰拉希相遇 |q 70746/1 |goto 45.60,41.29
|only if Dracthyr
step
talk Scalecommander Emberthal##197023
turnin Shades of Blue##70746 |goto 45.61,41.25
|only if Dracthyr
step
观察对话
talk Telash Greywing##197025
accept The Azure Wizard##70747 |goto 45.65,41.27
|only if Dracthyr
step
talk Archmage Khadgar##192091
问他“你是否效忠蓝龙军团？”
与卡德加交谈 |q 70747/1 |goto 46.64,40.19
|only if Dracthyr
step
talk Archmage Khadgar##192091
turnin The Azure Wizard##70747 |goto 46.64,40.19
|only if Dracthyr
step
talk Noriko the All-Remembering##183543
turnin Camp Antonidas##66228 |goto 46.64,40.16
|only if not Dracthyr
step
talk Noriko the All-Remembering##183543
accept Assemble the Defenses##67033 |goto 46.69,39.77
step
talk Althanus##192222
accept Preservation of Knowledge##67035 |goto 46.67,39.73
step
talk Steward Argalos##189116
fpath Camp Antonidas |goto 46.71,39.56
step
click Broken Arcane Device
collect Broken Arcane Device##194512 |q 67033/1 |goto 46.14,39.34 |count 1
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
取回古籍收藏 |q 67035/1 |goto 46.12,39.22 |count 1
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 46.11,38.51 |count 2
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 46.00,38.37 |count 3
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 45.87,38.45 |count 4
step
click Broken Arcane Device
collect Broken Arcane Device##194512 |q 67033/1 |goto 45.86,40.17 |count 2
step
click Broken Arcane Device
|tip 在破碎的建筑内。
collect Broken Arcane Device##194512 |q 67033/1 |goto 46.06,40.81 |count 3
step
talk Althanus##192222
turnin Preservation of Knowledge##67035 |goto 46.67,39.74
step
talk Noriko the All-Remembering##183543
turnin Assemble the Defenses##67033 |goto 46.69,39.77
accept Wrath of the Kirin Tor##67036 |goto 46.69,39.77
step
click Arcane Blaster
控制法术枪 |invehicle |goto 46.31,38.85 |q 67036
step
kill Proto-Drake##197693+
|tip 它们看起来像附近东边飞翔的巨龙。
|tip 使用你的快捷栏技能。
观察对话
抵御原始者军团 |q 67036/1 |goto 46.31,38.85
step
talk Noriko the All-Remembering##183543
turnin Wrath of the Kirin Tor##67036 |goto 46.64,40.16
step
talk Archmage Khadgar##192091
|tip 他跑到这个地点。
accept Meeting Kalecgos##65688 |goto 46.64,40.19
step
talk Custodian Vernagos##189208
|tip 在破碎的建筑内。
accept Tending the Forge##66523 |goto 46.12,40.99
step
talk Caddy Scattershot##190001
accept Path to Nowhere##66671 |goto 45.69,39.78
step
click WANTED: Frigellus
|tip 看起来像是一张被钉在岩石上的{o}纸张{}。
accept WANTED: Frigellus##66488 |goto 46.16,39.62
step
clicknpc Supply Portal##188915
告诉它：“卡德加说你有东西可以帮助我援助卡雷苟斯。” |gossip 55328
观察对话
请求一袋有用的物品 |q 65688/1 |goto 45.99,38.79
step
click Bag of Helpful Goods
回收有用物品袋 |q 65688/2 |goto 45.95,38.89
stickystart "Collect_Frozen_Cores"
step
kill Frigellus##189217 |q 66488/1 |goto 47.99,38.09
|tip 他看起来像一个大型冰霜元素。
step
label "Collect_Frozen_Cores"
kill Calving Elemental##189312+
|tip 它们看起来像小冰霜元素。
|tip 他们也可以在水下。
collect 4 Frozen Core##192474 |q 66523/1 |goto 47.48,38.04
stickystart "Collect_Hornswog_Hide_Scraps"
stickystart "Collect_Formant_Embercones"
step
talk Custodian Cynegos##189952
|tip 在建筑物内。
turnin WANTED: Frigellus##66488 |goto 46.01,38.31
step
talk Arch Enchanter Celeste##192335
|tip 在建筑物内。
accept Setting the Defense##66489 |goto 45.99,38.41
step
use the Arch Instructor's Wand##192471
|tip 在{o}蓝色防御者{}身上使用它。
|tip 他们看起来像穿甲的蓝色龙人。
增强第六个蓝色守护者 |q 66489/1 |goto 46.19,38.94
'|clicknpc Azure Defender##192593
step
talk Arch Enchanter Celeste##192335
|tip 在建筑物内。
turnin Setting the Defense##66489 |goto 45.99,38.41
step
label "Collect_Hornswog_Hide_Scraps"
kill Encroaching Hornswog##189314+
|tip 它们看起来像大型蓝色蛙人。
collect 8 Hornswog Hide Scraps##192473 |q 66523/2 |goto 46.61,41.60
你可以在以下地点找到更多： |notinsticky
[45.50,40.81]
[45.32,39.62]
step
label "Collect_Formant_Embercones"
click Dormant Embercone+
|tip 它们看起来像棕色的松果。
collect 12 Dormant Embercone##192776 |q 66523/3 |goto 46.61,41.60
你可以在以下地点找到更多： |notinsticky
[45.50,40.81]
[45.32,39.62]
step
talk Custodian Vernagos##189208
|tip 在破碎的建筑内。
turnin Tending the Forge##66523 |goto 46.12,40.99
step
clicknpc Supply Portal##188915
accept Send It!##66493 |goto 45.99,38.79
step
clicknpc Supply Portal##188915
与补给传送门交谈 |q 66493/1 |goto 45.99,38.79
step
clicknpc Supply Portal##188915
告诉它“我准备好送信了！” |gossip 55697
开始投递邮件 |q 66493/2 |goto 45.99,38.79
step
交付第14个包裹 |q 66493/3 |goto 46.25,39.50
|tip 使用 {o}投掷邮件{} 技能对 {o}基尔加丹学徒{}。
|tip 它在屏幕上显示为一个按钮。
|tip 它们看起来像各种穿着紫色长袍的人形NPC。
|tip 它们将在你的小地图上出现为黄色点。
'|clicknpc Kirin Tor Apprentice##189241
step
clicknpc Supply Portal##188915
turnin Send It!##66493 |goto 45.99,38.79
step
talk Ruriq##186157
accept Mammoths Matter##65914 |goto 44.78,50.62
accept Culling the Cullers##65925 |goto 44.78,50.62
stickystart "Kill_Vicious_Ice_Slitherers"
stickystart "Collect_Ontuq_Hide_Scraps_And_Ontuq_Tusks"
step
kill 3 Vicious Ice Borer##186392 |q 65925/2 |goto 47.47,51.31
|tip 它们看起来像更大的多足虫。
step
label "Kill_Vicious_Ice_Slitherers"
kill 10 Vicious Ice Slitherer##186391 |q 65925/1 |goto 47.47,51.31
|tip 它们看起来像小型蜈蚣。
step
label "Collect_Ontuq_Hide_Scraps_And_Ontuq_Tusks"
click On'tuq Mammoth Matriarch##376174+
|tip 它们看起来像更大的死猛犸象。
|tip 只有{o}女族长{}才会掉落{o}獠牙{}。
click On'tuq Mammoth##376172+
|tip 它们看起来像小型死去的猛犸象。
collect 5 On'tuq Tusk##191092 |q 65914/2 |goto 47.47,51.31
collect 7 On'tuq Hide Scraps##191091 |q 65914/1 |goto 47.47,51.31
step
talk Ruriq##186157
turnin Mammoths Matter##65914 |goto 45.42,54.17
turnin Culling the Cullers##65925 |goto 45.42,54.17
accept Tackling the Falls##65926 |goto 45.42,54.17
step
clicknpc The Fallstrider##186971
帮助鲁里克 |q 65926/1 |goto 45.39,54.13
step
talk Kauj##186386
turnin Tackling the Falls##65926 |goto 45.51,54.18
accept The Gleamfisher##66724 |goto 45.51,54.18
step
clicknpc Gleamfish##187037
collect Gleamfish##194324 |q 66724/1 |goto 44.92,53.77 |count 1
step
clicknpc Gleamfish##187037
collect Gleamfish##194324 |q 66724/1 |goto 45.17,54.91 |count 2
step
clicknpc Gleamfish##187037
collect Gleamfish##194324 |q 66724/1 |goto 45.16,54.95 |count 3
step
click Offering Basket##380509
观察对话
将光辉鱼放入篮子 |q 66724/2 |goto 45.48,54.19
step
talk Ruriq##186157
turnin The Gleamfisher##66724 |goto 45.45,54.17
accept Ice Breakers##65929 |goto 45.45,54.17
step
talk Kauj##186386
accept Wayward Winds##65928 |goto 45.51,54.18
stickystart "Collect_Restless_Motes"
step
clicknpc Freezing Water##186398+
|tip 他们看起来像被冰冻在冰块中的水元素。
|tip 它们将在你的小地图上出现为黄色点。
|tip 你可能会被攻击。
解冻 #5# 冰冷水域 |q 65929/1 |goto 46.65,57.75
step
label "Collect_Restless_Motes"
击杀周围不安的敌人
|tip 它们看起来像空灵元素。
collect 10 Restless Mote##191199 |q 65928/1 |goto 46.65,57.45
'|kill Restless Wind##186397, Restless Gale##186427
step
talk Ruriq##186157
turnin Ice Breakers##65929 |goto 45.45,54.17
step
talk Kauj##186386
turnin Wayward Winds##65928 |goto 45.51,54.18
accept A Wrestle of Wind and Water##65930 |goto 45.51,54.18
step
进入瀑布底部的洞穴 |goto 45.52,57.03 < 20 |walk
kill Kraunot##186401
|tip 洞内探险
挑战灵魂 |q 65930/1 |goto 45.60,57.62
step
talk Ruriq##186157
turnin A Wrestle of Wind and Water##65930 |goto 45.00,54.03
accept Ruriq's River Rapids Ride##66155 |goto 45.00,54.03
step
clicknpc The Fallstrider##190067
开始骑乘陨落踏 الأرض者 |invehicle |goto 44.92,54.10 |q 66155
step
_As You Ride on the Boat:_
|tip 在水中的{o}鱼{}上使用你的技能条上的技能。
在秋行者捕捉#10#条鱼 |q 66155/1
step
观察对话
与瑞瑞克乘风破浪 |outvehicle |goto 34.31,52.47 |q 66155 |notravel
step
观察对话
talk Ruriq##190287
|tip 他走到这个地点。
turnin Ruriq's River Rapids Ride##66155 |goto 34.27,52.34
step
talk Kalecgos##185615
|tip 在建筑物内。
turnin Meeting Kalecgos##65688 |goto 40.92,55.00
accept The Many Images of Kalecgos##65689 |goto 40.92,55.00
step
click Crystal Pylon
|tip 你将飞向附近的平台。
使用水晶电塔 |q 65689/1 |goto 41.15,55.41
step
到达苍穹档案馆 |q 65689/2 |goto 41.16,57.81
step
talk Kalecgos##185622
turnin The Many Images of Kalecgos##65689 |goto 40.74,59.04
accept Driven Mad##65702 |goto 40.74,59.04
step
talk Kalecgos##185623
accept Arcane Pruning##65709 |goto 40.69,59.10
step
use the Bag of Helpful Goods##191953
collect Ley Scepter##191952 |q 65709/1
stickystart "Collect_Unstable_Arcane"
step
use the Ley Scepter##191952
修复北方奥术场 |q 65709/2 |goto 39.58,60.27
step
use the Ley Scepter##191952
修复东部奥术领域 |q 65709/3 |goto 41.19,62.27
step
label "Collect_Unstable_Arcane"
在该区域击杀敌人
collect 40 Unstable Arcana##190769 |q 65702/1 |goto 40.33,61.03
'|kill Destabilized Elemental##181536, Uncontrolled Guardian##181775
step
talk Kalecgos##185623
turnin Arcane Pruning##65709 |goto 40.69,59.10
step
talk Kalecgos##185622
turnin Driven Mad##65702 |goto 40.74,59.04
accept Straight to the Top##65852 |goto 40.74,59.04
step
use Bag of Helpful Goods##191978
collect Arcane Stepping Stone##191979 |q 65852/1 |goto 39.58,60.27
step
抵达苍穹档案顶点 |q 65852/2 |goto 39.58,60.27
|tip 使用 {o}奥术踏石{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将飞往附近漂浮平台的顶端。
step
talk Kalecgos##186184
|tip 在最高的浮动平台上。
turnin Straight to the Top##65852 |goto 39.97,61.46
accept Platform Adjustments##65751 |goto 39.97,61.46
accept Arcane Annoyances##65752 |goto 39.97,61.46
stickystart "Kill_Feasting_Wyrms"
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 39.51,61.51 |count 1
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 39.58,62.71 |count 2
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 40.23,62.03 |count 3
step
label "Kill_Feasting_Wyrms"
use the Arcane Hook##194891
|tip 用它在{o}盛宴巨龙{}身上。
|tip 它们看起来像是在这个区域飞翔的紫色龙，没有四肢。
|tip 在最高的漂浮平台上。 | 不粘贴
kill 6 Feasting Wyrm##192739 |q 65752/1 |goto 39.90,61.69
step
talk Kalecgos##186184
|tip 在最高的浮动平台上。
turnin Platform Adjustments##65751 |goto 39.97,61.46
turnin Arcane Annoyances##65752 |goto 39.97,61.46
accept Reclaiming the Oathstone##65854 |goto 39.97,61.46
step
talk Kalecgos##186187
|tip 在地面上
告诉他，我准备好见你重新夺回蓝色誓石。 |gossip 54821
夺回誓言石 |q 65854/1 |goto 39.44,63.18
step
talk Sindragosa##186188
turnin Reclaiming the Oathstone##65854 |goto 39.48,63.07
accept Aiding Azure Span##65855 |goto 39.48,63.07
step
talk Arc Tel XVII##189459
fpath Azure Archives |goto 37.06,60.82
step
talk Arc Tel XVII##189459
与飞行管理员交谈 |q 65855/1 |goto 37.06,60.82
step
talk Lilial Dawnburst##185778
|tip 在地面上
accept Eight-Legged Menace##65750 |goto 51.73,61.98
accept Icy Webs##65769 |goto 51.73,61.98
stickystart "Free_Cocooned_Survivors"
stickystart "Slay_Shiverweb_Creepers_Or_Shiverweb_Crawlers"
step
kill 3 Primalist Tender##186111 |q 65750/2 |goto 50.58,60.58
|tip 他们看起来像人型生物。
step
label "Free_Cocooned_Survivors"
clicknpc Cocooned Survivor##186222+
|tip 它们看起来像巨大的白色扭动的茧。
免费 #6# 被虫茧困住的幸存者 |q 65769/1 |goto 50.58,60.58
step
label "Slay_Shiverweb_Creepers_Or_Shiverweb_Crawlers"
消灭周围的寒爪蛛敌人
|tip 它们看起来像蛛蛛。
击杀10只颤根爬行者或颤根爬虫 |q 65750/1 |goto 50.58,60.58
'|kill Shiverweb Creeper##185811, Shiverweb Crawler##185810
step
talk Lilial Dawnburst##185778
turnin Eight-Legged Menace##65750 |goto 51.73,61.98
turnin Icy Webs##65769 |goto 51.73,61.98
accept Grungir the Explorer##65758 |goto 51.73,61.98
step
talk Grungir Ironspout##185806
turnin Grungir the Explorer##65758 |goto 48.99,64.22
accept Dwarven Antifreeze##65832 |goto 48.99,64.22
accept Primalist Tampering##65833 |goto 48.99,64.22
stickystart "Collect_Flasks_Of_Dwarven_Antifreeze"
step
kill Frostcaller Sin'tia##186922
collect Sin'tia's Runestone##191136 |q 65833/3 |goto 49.05,66.03
step
kill Frostcaller Nai'jin##186921
|tip 深入地下洞窟。
collect Nai'jin's Runestone##191135 |q 65833/2 |goto 47.60,64.63
step
kill Frostcaller Julh'ek##186923
collect Julh'ek's Runestone##191137 |q 65833/1 |goto 47.66,62.40
step
label "Collect_Flasks_Of_Dwarven_Antifreeze"
在该区域击杀敌人
collect 6 Flask of Dwarven Antifreeze##191042 |q 65832/1 |goto 49.08,63.73
'|kill Primalist Infuser##186112, Shiverweb Crusher##185814, Shiverweb Cloaker##195397
step
talk Grungir Ironspout##185806
turnin Dwarven Antifreeze##65832 |goto 48.99,64.22
turnin Primalist Tampering##65833 |goto 48.99,64.22
accept Kill the Queen##65834 |goto 48.99,64.22
step
use the Spider Squasher##191044
|tip 在{o}战栗蛛后{}身上使用它，会对她造成{o}巨大伤害{}。
|tip 她看起来像一只大型蓝色蜘蛛。
|tip 洞穴内的楼上
|tip 她是精英，但你应该能轻松击杀她，借助任务物品。
|tip 该{任务物品}将对她造成{一次性伤害}。
kill Shiverweb Queen##186064 |q 65834/1 |goto 47.23,65.57
step
talk Grungir Ironspout##185806
turnin Kill the Queen##65834 |goto 48.99,64.22
step
talk Noriko the All-Remembering##183543
turnin Aiding Azure Span##65855 |goto 46.64,40.16
accept Ask the Locals##66699 |goto 46.64,40.16
accept Suspiciously Quiet##69904 |goto 46.64,40.16
step
talk Althanus##192222
accept Supporting the Cobalt Assembly##72784 |goto 46.65,40.13
step
talk Apprentice Scrumpy##189198
|tip 外面，在建筑后面。
寻找徒弟 |q 69904/1 |goto 47.67,40.23
step
talk Apprentice Scrumpy##189198
turnin Suspiciously Quiet##69904 |goto 47.67,40.23
accept Ways of Seeing##66500 |goto 47.67,40.23
step
click Lingering Image
|tip 墙上看起来像一个紫色符文。
静心聆听 |gossip 54980
调查马赛克 |q 66500/1 |goto 47.78,39.99
step
talk Korrikunit the Whalebringer##190229
问他“你知道这个区域内有任何魔法能量线吗？” |gossip 55417
咨询科里库尼特 |q 66699/1 |goto 46.76,38.59
step
talk Jokomuupat##190226
告诉她“我在蓝色峡谷寻找浓缩魔法的口袋。” |gossip 55418
咨询乔科穆帕特 |q 66699/2 |goto 46.34,38.15
step
click Lingering Image
|tip 它看起来像柱子上的一个紫色符文符号。
|tip 在建筑物内。
静心聆听 |gossip 55184
调查亭子 |q 66500/4 |goto 46.02,38.64
step
talk Babunituk##190225
告诉他“我在寻找水晶。紫色水晶。在洞穴里。” |gossip 55419
咨询巴布尼图克 |q 66699/3 |goto 45.72,38.84
step
talk Babunituk##190225
turnin Ask the Locals##66699 |goto 45.72,38.84
accept Catch the Caravan##65864 |goto 45.72,38.84
step
click Lingering Image
|tip 墙上看起来像一个紫色符文。
|tip 在破碎的建筑内。
静心聆听 |gossip 55183
调查车间 |q 66500/3 |goto 46.03,40.98
step
click Lingering Image
|tip 墙上看起来像一个紫色符文。
|tip 在建筑物内。
静心聆听 |gossip 55182
探索塔楼 |q 66500/2 |goto 47.13,40.38
step
talk Apprentice Scrumpy##189198
|tip 外面，在建筑后面。
turnin Ways of Seeing##66500 |goto 47.67,40.23
step
talk Noriko the All-Remembering##183543
accept For The Love of Others##66503 |goto 46.64,40.16
step
talk Noriko the All-Remembering##183543
问她“你能把我送到塔顶吗？” |gossip 54965
与诺里科交谈 |q 66503/1 |goto 46.64,40.16
step
click Ancient Remains
|tip 在破碎塔的顶端。
调查古代遗迹 |q 66503/2 |goto 47.13,40.30
step
kill Echo of Loss##190259 |q 66503/3 |goto 46.99,40.41
|tip 看起来像个龙魂。
|tip 它在这个区域漫步。
|tip 在崩塌的塔楼的中层楼上。
step
talk Noriko the All-Remembering##183543
turnin For The Love of Others##66503 |goto 46.64,40.16
step
talk Brena##186224
告诉她 "你一定是布雷娜。我…" |gossip 54825
寻找布雷娜 |q 65864/1 |goto 35.25,36.98
step
观察对话
talk Brena##186224
turnin Catch the Caravan##65864 |goto 35.25,36.98
step
talk Elder Poa##188809
accept Those Aren't for Chewing##65868 |goto 35.37,36.94
step
观察对话
talk Brena##191810
accept Howling in the Big Tree Hills##65867 |goto 35.28,36.94
accept Snap the Traps##65866 |goto 35.28,36.94
stickystart "Spring_Traps"
stickystart "Collect_Funerary_Offerings"
step
kill Hyenamaster Durgun##186515 |q 65867/1 |goto 35.66,34.72
step
进入洞穴 |goto 34.94,32.63 < 20 |walk
kill Trap-Layer Kerwal##186516 |q 65867/2 |goto 34.99,32.04
|tip 洞内探险
step
kill Bakra the Bully##186517 |q 65867/3 |goto 33.95,33.18
step
label "Spring_Traps"
click Bladejaw Trap##376139+
|tip 它们看起来像银色金属熊陷阱。
春季 #8# 陷阱 |q 65866/1 |goto 34.75,34.50
step
label "Collect_Funerary_Offerings"
在该区域击杀敌人
|tip 一些他们处于潜行状态。
收集 #8# 丧葬供品 |q 65868/1 |goto 35.02,33.92
'|kill Shadepaw Bruiser##183343, Shadepaw Hunter##186490, Scavenging Hyena##183340, Shadepaw Bandit##183341
step
talk Hanu##186618
turnin Snap the Traps##65866 |goto 34.27,31.29
turnin Howling in the Big Tree Hills##65867 |goto 34.27,31.29
turnin Those Aren't for Chewing##65868 |goto 34.27,31.29
step
观察对话
talk Hanu##189642
|tip 他跑到这个地点。
accept Gnoll Way Out##65871 |goto 34.42,31.11
step
talk Brena##186228
accept Ill Gnolls With Ill Intent##65872 |goto 34.37,31.02
accept Leader of the Shadepaw Pack##65873 |goto 34.37,31.02
step
talk Elder Poa##189662
accept Supplies!##65870 |goto 34.34,31.00
stickystart "Slay_Shadepaw_Gnolls"
step
进入洞穴 |goto 34.02,30.77 < 20 |walk |only if not subzone("Kargpaw's Den")
click Basket of Hunting Game Calls
|tip 洞内探险
collect Hunting Game Calls##192189 |q 65870/3 |goto The Azure Span/1 36.38,93.17
step
click Barrel of Salt
|tip 洞内探险
|tip 你将被攻击。
collect Meat Curing Salts##191111 |q 65870/1 |goto 28.96,75.19
step
click Crude Cage
|tip 洞内探险
拯救图斯卡尔 |q 65871/1 |goto 30.29,60.43 |count 1
step
clicknpc Norukk##186655
|tip 地下洞穴内
拯救诺鲁克 |q 65871/2 |goto 41.43,63.90
step
click Crude Cage
|tip 地下洞穴内
拯救图斯卡尔 |q 65871/1 |goto 46.08,41.66 |count 2
step
click Barrel of Skinning Tools
|tip 地下洞穴内
|tip 你将被攻击。
collect Skinning Tools##192190 |q 65870/2 |goto 51.56,36.59
step
click Crude Cage
|tip 地下洞穴内
拯救图斯卡尔 |q 65871/1 |goto 38.09,32.94 |count 3
step
沿着小路走下去 |goto 36.23,30.76 < 20 |walk
kill Kargpaw the Fetid##186660
|tip 地下洞穴内
collect Kargpaw's Totem##191118 |q 65873/1 |goto 41.56,15.40
step
label "Slay_Shadepaw_Gnolls"
消灭该区域内的虚弱敌人
|tip 他们看起来像歹徒。
|tip 洞内探险
击杀#16#影爪诺尔斯 |q 65872/1 |goto 44.77,44.12
'|kill Sickly Ambusher##189402, Sickly Grunt##186768, Sickly Shaman##186667, Sickly Brute##186668, Sickly Pilferer##193505
step
离开洞穴 |goto 55.01,84.31 < 20 |walk |only if subzone("Kargpaw's Den")
talk Elder Poa##189662
turnin Supplies!##65870 |goto The Azure Span/0 34.34,31.00
step
talk Brena##186228
turnin Ill Gnolls With Ill Intent##65872 |goto 34.37,31.02
turnin Leader of the Shadepaw Pack##65873 |goto 34.37,31.02
step
talk Hanu##189642
turnin Gnoll Way Out##65871 |goto 34.42,31.10
step
talk Brena##186228
accept Spreading Decay##66239 |goto 34.37,31.02
step
talk Brena##187721
turnin Spreading Decay##66239 |goto 28.69,34.82
accept Another Ambush##65869 |goto 28.69,34.82
step
talk Akiun##187730
问他“你能告诉我发生了什么吗？” |gossip 55220
与阿库因对话 |q 65869/1 |goto 28.68,34.75
step
talk Unkimi##194613
accept Falling Water##71233 |goto 28.46,35.11
step
clicknpc Tuskarr Fisherman##190136
调查尸体进一步情况... |gossip 55691
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 29.24,33.57 |count 1
step
clicknpc Tuskarr Hunter##190142
调查尸体进一步情况... |gossip 55692
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 29.17,32.55 |count 2
step
clicknpc Tuskarr Craftsman##190143
调查尸体进一步情况... |gossip 55693
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 28.20,31.86 |count 3
step
clicknpc Festering Gnoll##190074
调查尸体进一步情况... |gossip 55694
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 27.97,32.83 |count 4
step
talk Brena##189708
turnin Another Ambush##65869 |goto 28.79,34.74
accept Urgent Action Required##66026 |goto 28.79,34.74
step
talk Illusory Mage##187764
accept A Minor Setback##66261 |goto 21.01,38.91
|only if not haveq(66262) and not completedq(66262)
step
talk Detry Hornswald##187463
|tip 水下
turnin A Minor Setback##66261 |goto 22.73,41.67 |only if haveq(66261) or completedq(66261)
accept Waste Water Cleanup##66262 |goto 22.73,41.67
step
click Rotting Pile+
|tip 它们看起来像水中的棕色岩石堆。
|tip 你将被攻击。
kill Muck Elemental##187498+
处理第6堆腐烂的尸体 |q 66262/1 |goto 22.73,41.67
step
talk Detry Hornswald##187463
|tip 水下
turnin Waste Water Cleanup##66262 |goto 22.73,41.67
accept A Precision Approach##66263 |goto 22.73,41.67
accept Disarmed and Docile##66264 |goto 22.73,41.67
stickystart "Collect_Gnawbone_Armaments"
step
进入洞穴 |goto 24.39,39.58 < 30 |walk
kill Flayfist##187505 |q 66263/1 |goto 24.83,39.01
|tip 洞内探险
step
label "Collect_Gnawbone_Armaments"
在这个区域击杀噬骨敌人
click Gnawbone Weapon Rack+
|tip 它们看起来像是木质武器架。
collect 15 Gnawbone Armaments##191424 |q 66264/1 |goto 23.48,40.16
'|kill Gnawbone Brawler##187502, Gnawbone Totemchewer##187936, Gnawbone Grunt##187500, Gnawbone Splintershield##197847, Gnawbone Chainchewer##196521, Gnawbone Underboss##187503
step
talk Detry Hornswald##187463
|tip 水下
turnin A Precision Approach##66263 |goto 22.73,41.67
turnin Disarmed and Docile##66264 |goto 22.73,41.67
accept Who's Next?##66265 |goto 22.73,41.67
accept Filthy Mongrels##66266 |goto 22.73,41.67
step
talk Illusory Mage##198202
accept M.E.T.A.##66267 |goto 23.46,41.85
stickystart "Kill_Hyena_Matriarchs"
stickystart "Free_Abused_Animals"
stickystart "Kill_Hyena_Mongrels"
step
进入洞穴 |goto 24.11,41.95 < 20 |walk
kill Cracktooth##187528 |q 66265/1 |goto 24.22,41.80
|tip 洞内探险
step
label "Kill_Hyena_Matriarchs"
kill 3 Hyena Matriarch##187566 |q 66266/1 |goto 24.22,42.51
|tip 他们看起来像更大的棕色鬣狗。
step
label "Free_Abused_Animals"
在这个区域击杀暮爪敌人
|tip 他们看起来像歹徒。
click Gnawed Keys##376414+
|tip 它们看起来像挂在建筑物和物体上的小钥匙链。
collect Duskpaw Key##191736+ |n
|tip 你需要一把钥匙来解放一只动物。
click Various Animals
|tip 它们看起来像许多不同类型的动物。
|tip 他们是友好的，并且处于眩晕状态。
自由 #6# 受虐动物 |q 66267/1 |goto 24.22,42.51
'|kill Duskpaw Scavenger##187568, Duskpaw Hidestitcher##187941, Duskpaw Trapper##187510
step
label "Kill_Hyena_Mongrels"
kill 12 Hyena Mongrel##187565 |q 66266/2 |goto 24.22,42.51
|tip 它们看起来像小鬣狗。
step
talk Detry Hornswald##187463
|tip 水下
turnin Who's Next?##66265 |goto 22.73,41.67
turnin Filthy Mongrels##66266 |goto 22.73,41.67
turnin M.E.T.A.##66267 |goto 22.73,41.67
accept Third Try's the Charm##66268 |goto 22.73,41.67
accept Just To Be Sure##66269 |goto 22.73,41.67
stickystart "Slay_Stormfang_Elementalists"
step
进入洞穴 |goto 22.26,43.21 < 20 |walk
kill Bloodclaw##187553 |q 66268/1 |goto 22.22,43.76
|tip 洞内探险
step
label "Slay_Stormfang_Elementalists"
在这个区域击杀风暴猎犬敌人
|tip 他们看起来像歹徒。
|tip 风暴之牙军队不会计入任务目标。
击杀12个风暴狂怒元素法师 |q 66269/1 |goto 22.65,43.42
'|kill Stormfang Dustcaller##187551, Stormfang Hexspiter##187930, Stormfang Bonecaster##187931, Stormfang Shaman##187552
step
talk Detry Hornswald##187463
|tip 水下
turnin Third Try's the Charm##66268 |goto 22.73,41.67
turnin Just To Be Sure##66269 |goto 22.73,41.67
accept Whack-a-Gnoll##66270 |goto 22.73,41.67
step
挑战者的到达 |q 66270/1 |goto 21.50,41.36
|tip 你将被攻击。
step
观察对话
击杀攻击的敌人
|tip 在任务追踪区域填满进度条。
kill Doomblood##187753
击败潜在的战争领主 |q 66270/2 |goto 21.50,41.36
'|kill Spineripper##187748, Deathwind##187750, Hacklung##187752, Charfang##187751, Facebreaker##187749
step
talk Detry Hornswald##187463
|tip 水下
turnin Whack-a-Gnoll##66270 |goto 22.73,41.67
step
talk Brena##186179
turnin Urgent Action Required##66026 |goto 20.59,35.67
step
观察对话
talk Kalecgos##187873
|tip 他走到这个地点。
accept Breaching the Brackenhide##65838 |goto 20.53,35.69
step
click Rotting Root
剪断根须 |gossip 55350
探索北部地区 |q 65838/1 |goto 18.40,34.74
step
click Rotting Root
剪断根须 |gossip 54967
调查南部区域 |q 65838/2 |goto 18.87,37.01
step
click Rotting Root
剪断根须 |gossip 54968
调查西部地区 |q 65838/3 |goto 17.59,36.98
step
talk Kalecgos##187873
turnin Breaching the Brackenhide##65838 |goto 16.75,37.31
accept Ley Litter##65846 |goto 16.75,37.31
step
talk Norukk##186181
accept Cut Out the Rot##65844 |goto 16.76,37.25
step
talk Brena##186179
accept Echoes of the Fallen##65845 |goto 16.75,37.22
stickystart "Kill_Rotting_Treants"
stickystart "Collect_Ley_Crystals"
stickystart "Kill_Brackenhide_Rotflingers"
step
use Brena's Totem##191928
|tip 将其使用在{o}Kaqiata{}上。
联系精灵 |q 65845/1 |goto 17.46,37.08 |count 1
'|clicknpc Kaqiata##188854
step
use Brena's Totem##191928
|tip 在{o}波波克{}身上使用它。
联系精灵 |q 65845/1 |goto 18.13,37.66 |count 2
step
use Brena's Totem##191928
|tip 把它用在{o}卢托克{}身上。
|tip 在洞穴入口处。
联系精灵 |q 65845/1 |goto 18.52,37.27 |count 3
step
use Brena's Totem##191928
|tip 将其使用在{o}诺穆洛克{}身上。
联系精灵 |q 65845/1 |goto 17.54,37.93 |count 4
step
use Brena's Totem##191928
|tip 把它用在{o}Tuyuki{}身上。
联系精灵 |q 65845/1 |goto 17.41,38.66 |count 5
step
label "Kill_Rotting_Treants"
kill 5 Rotting Treant##186361 |q 65844/1 |goto 17.89,37.71
|tip 他们看起来像行走的树人。
你可以在洞穴内找到更多，坐标 [18.56,37.24]。
step
label "Collect_Ley_Crystals"
click Gnawed Ley Crystal+
|tip 它们看起来像紫色水晶。
collect 7 Ley Crystal##194431 |q 65846/1 |goto 17.78,37.63
step
label "Kill_Brackenhide_Rotflingers"
kill 10 Brackenhide Rotflinger##186362 |q 65844/2 |goto 17.89,37.71
|tip 他们看起来像肩膀上扛着动物头骨的戈尔诺尔。
你可以在洞穴内找到更多，坐标 [18.56,37.24]。
step
talk Brena##186179
turnin Echoes of the Fallen##65845 |goto 16.75,37.22
step
talk Norukk##186181
turnin Cut Out the Rot##65844 |goto 16.76,37.25
step
talk Kalecgos##187873
turnin Ley Litter##65846 |goto 16.75,37.32
accept Tome-ward Bound##65848 |goto 16.75,37.32
step
talk Kalecgos##187873
告诉他我已准备好。 |gossip 55002
观察对话
与卡雷苟斯交谈 |q 65848/1 |goto 16.75,37.32
step
clicknpc Tome of Spellflinging##191636
骑乘法术投掷之书 |q 65848/2 |goto 16.72,37.30
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.97,38.42 |count 1
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.15,38.04 |count 2
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.65,37.32 |count 3
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
观察对话
|tip 使用你的快捷栏技能。
kill Twisted Ancient##186194 |q 65848/4 |goto 15.41,37.69
step
在洞穴集合 |outvehicle |goto 15.16,39.18 |q 65848 |notravel
|tip 你将自动传送到洞穴中。
step
观察对话
talk Kalecgos##187873
|tip 洞内探险
turnin Tome-ward Bound##65848 |goto 15.30,39.43
accept Realignment##65847 |goto 15.30,39.43
step
click Ley Crystal
|tip 洞内探险
聚焦魔脉 |q 65847/1 |goto 15.36,39.50
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.51,39.30 |count 1
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.30,39.12 |count 2
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.07,39.53 |count 3
step
talk Kalecgos##186177
|tip 洞外，靠近道路。
turnin Realignment##65847 |goto 16.11,41.41
step
talk Brena##186179
accept To Iskaara##65849 |goto 16.08,41.45
step
talk Skygazer Paatu##186443
fpath Iskaara |goto 13.29,48.77
step
talk Brena##186480
|tip 在建筑物内。
turnin To Iskaara##65849 |goto 13.24,49.56
accept Gather the Family##66210 |goto 13.24,49.56
accept Brackenhide Hollow: To the Source##66211 |goto 13.24,49.56
step
talk Murik##193006
accept Community Connections##72435 |goto 13.14,49.26
step
talk Hanu##186186
accept Scampering Scamps##66218 |goto 12.90,48.70
step
talk Norukk##196544
相见龙学者 |q 72435/4 |goto 12.93,48.62
step
talk Arvik##186449
见装备供应商 |q 72435/1 |goto 13.17,48.52
step
talk Tatto##186462
会见坐骑供应商 |q 72435/3 |goto 13.19,48.82
step
click Decorated Teapot
收集葬礼供品 |q 66210/1 |goto 13.48,48.57 |count 1
step
talk Auntie Kaunnie##189533
accept Rowie##66558 |goto 13.76,47.61
step
click Handcrafted Boat
收集葬礼供品 |q 66210/1 |goto 13.87,49.48 |count 2
step
talk Lukoturukk##193877
accept Fishing: Aileron Seamoth##66212 |goto 14.08,49.45
step
talk Rokkutuk##194059
遇见食谱供应商 |q 72435/2 |goto 13.91,50.08
step
talk Rowie##186542
告诉罗威他母亲的最后信息 |gossip 55005
告诉罗威，他可能还没有准备好单独挑战雪人。 |gossip 55006
送罗维回家 |q 66558/1 |goto 16.12,50.42
step
talk Rowie##186542
turnin Rowie##66558 |goto 16.12,50.42
accept Toejam the Terrible##70129 |goto 16.12,50.42
step
进入洞穴 |goto 16.24,50.37 < 15 |walk
talk Toejam the Terrible##193733
|tip 洞穴内的楼上
挥舞你的武器 |gossip 55904
选择 _"<试着解释你需要与他战斗。>"_ |gossip 55905
选择 _"<...>"_ |gossip 55906
选择  _"<问他是否可以假装让罗维杀了他。>"_ |gossip 55907
选择 _"假装被击杀的Mime"_ |gossip 55908
选择 _"<有一个图腾海民孩子，他的妈妈刚去世，他真的需要一些鼓励，和...>"_ |gossip 55909
选择 _"<... Mime死去，然后有人在你的尸体上哭泣。>"_ |gossip 55910
点头示意 |gossip 55911
"Slay" Toejam the Terrible |q 70129/1 |goto 16.74,49.32
step
离开洞穴 |goto 16.24,50.37 < 15 |walk |only if subzone("The Azure Span") and _G.IsIndoors()
cast Fishing##131474
|tip 点击{o}钓鱼浮漂{}当它{o}在水中弹跳{}时。
|tip 不断重复这个过程。
collect 5 Aileron Seamoth##194967 |q 66212/1 |goto 15.65,50.70
step
talk Lukoturukk##193877
turnin Fishing: Aileron Seamoth##66212 |goto 14.07,49.45
step
talk Auntie Kaunnie##189533
turnin Toejam the Terrible##70129 |goto 13.80,49.01
step
talk Lil Ki##186547
|tip 他在这个区域游荡。
accept Cooking Utensils##70939 |goto 13.53,48.66
step
talk Murik##193006
turnin Community Connections##72435 |goto 13.14,49.26
step
进入建筑物 |goto 12.79,49.34 < 10 |walk |only if not subzone("The Filled Bowl")
talk Elder Nappa##186446
|tip 在建筑物内。
accept The Weave of a Tale##66213 |goto 12.40,49.41
step
talk Elder Poa##186448
|tip 在建筑物内。
告诉她“我来告诉你一个故事，长者。” |gossip 55010
告诉她“这是关于任何人捕获过的最伟大的鱼…” |gossip 55011
告诉她“通过在各个土地上收集所有稀有的鱼类，并将它们制作成最具吸引力的诱饵。” |gossip 55014
告诉她 "一条完美普通的鱼。" |gossip 55017
告诉她"它从我手中滑落，想要跳回水里！" |gossip 55020
告诉她“我当然杀了它并吃掉了。” |gossip 55022
讲述传奇 |q 66213/1 |goto 12.41,49.34
step
talk Elder Nappa##186446
|tip 在建筑物内。
turnin The Weave of a Tale##66213 |goto 12.40,49.41
step
click Stone Sculpture
|tip 在建筑物内。
收集葬礼供品 |q 66210/1 |goto 12.49,49.45 |count 3
step
click Ornamented Shield
收集葬礼供品 |q 66210/1 |goto 12.46,50.32 |count 4
step
talk Lukoturukk##193877
accept Nook News##71234 |goto 14.07,49.45
step
click Funeral Boat
将祭品放入船中 |q 66210/2 |goto 13.13,48.57
step
talk Brena##186480
|tip 在建筑物内。
turnin Gather the Family##66210 |goto 13.24,49.56
step
talk Kalecgos##189793
|tip 在建筑物内。
accept The Cycle of the Sea##65850 |goto 13.27,49.53
step
talk Brena##186480
|tip 在建筑物内。
告诉她我已经准备好开始葬礼了。 |gossip 55314
开始跟随布雷娜 |goto 13.24,49.56 > 10 |q 65850
step
观察对话
|tip 跟随 {o}Brena{} 行走。
|tip 她最终走到了这个坐标。
与布雷娜对话 |q 65850/1 |goto 12.93,50.43
step
click Funeral Boat
推船出海 |q 65850/2 |goto 13.16,50.20
step
talk Kalecgos##186177
turnin The Cycle of the Sea##65850 |goto 12.94,50.39
accept Azure Alignment##65911 |goto 12.94,50.39
step
talk Neelo##187674
询问尼洛在做什么 |gossip 55003
寻找尼洛和瑙 |q 66218/1 |goto 10.59,46.87
step
观察对话
talk Neelo##187674
turnin Scampering Scamps##66218 |goto 10.59,46.87
accept Can We Keep It?##66223 |goto 10.59,46.87
step
talk Jinkutuk##193637
buy 7 Frigidfish##192153 |q 66223/1 |goto 13.85,49.48
step
talk Neelo##187674
turnin Can We Keep It?##66223 |goto 10.59,46.87
step
talk Wayun##186212
turnin Nook News##71234 |goto 7.46,44.28
step
talk Mordigan Ironjaw##190691
|tip 他在这个区域游荡。
accept A Matter of Taste##66781 |goto 7.61,44.32
step
click Large Stone
collect Large Stone##193052 |q 66781/1 |goto 7.23,45.12
step
talk Mordigan Ironjaw##190691
|tip 他在这个区域游荡。
turnin A Matter of Taste##66781 |goto 7.61,44.32
step
talk LOU-C Fitzcog##187198
accept Fishy Fingers##66164 |goto 7.65,44.33
step
talk Examiner Rowe##187136
accept Salivatory Samples##66154 |goto 7.67,44.27
step
talk Aelnara##187156
accept Crystals in the Water##66147 |goto 7.64,44.23
stickystart "Recover_Stolen_Parts"
stickystart "Collect_Saliva_Samples"
step
click Conspicuous Crystal+
|tip 它们看起来像大型单一蓝色水晶。
矿脉#4#神秘水晶 |q 66147/1 |goto 10.20,42.91
step
label "Recover_Stolen_Parts"
click Stolen Parts+
|tip 它们看起来像是小堆金属齿轮。
回收 #5# 被盗零件 |q 66164/1 |goto 10.11,43.23
step
label "Collect_Saliva_Samples"
在此区域击杀布林图斯敌人
|tip 他们看起来像小鬼。
collect 12 Saliva Sample##191202 |q 66154/1 |goto 10.22,43.29
'|kill Brinetooth Gnasher##187271, Brinetooth Jabber##187273, Brinetooth Spawnwatcher##187279
step
talk Aelnara##187156
turnin Crystals in the Water##66147 |goto 7.64,44.23
step
talk Examiner Rowe##187136
turnin Salivatory Samples##66154 |goto 7.67,44.27
step
talk LOU-C Fitzcog##187198
turnin Fishy Fingers##66164 |goto 7.65,44.33
accept Field Experiment##66175 |goto 7.65,44.33
step
click Geoscanner 289-07
激活地质扫描仪 |q 66175/1 |goto 7.64,44.32
step
观察对话
talk LOU-C Fitzcog##187198
turnin Field Experiment##66175 |goto 7.65,44.33
accept No Dwarf Left Behind##66177 |goto 7.65,44.33
step
talk Wayun##186212
accept Afront 'Till A Salt##66232 |goto 7.46,44.28
stickystart "Collect_Crystal_Flakes"
step
click Mordigan's Field Notes
寻找第一条线索 |q 66177/1 |goto 9.38,42.53
step
click Mordigan's Flask
寻找第二个线索 |q 66177/2 |goto 10.02,41.30
step
click Mordigan's Boots
寻找第三个线索 |q 66177/3 |goto 9.93,39.68
step
click Mordigan's Pants
寻找第四线索 |q 66177/4 |goto 10.61,41.26
step
talk Aelnara##188030
turnin No Dwarf Left Behind##66177 |goto 10.77,41.18
accept Mad Mordigan & The Crystal King##66187 |goto 10.77,41.18
stickystop "Collect_Crystal_Flakes"
step
kill Mordigan Ironjaw##187353
|tip 小洞穴内。
|tip 他最终会成为友好阵营。
解晶魔尔迪根 |q 66187/1 |goto 11.19,41.05
step
talk Aelnara##188030
turnin Mad Mordigan & The Crystal King##66187 |goto 10.77,41.18
accept Back To Camp##66559 |goto 10.77,41.18
step
label "Collect_Crystal_Flakes"
在此区域击杀布林图斯敌人
|tip 他们看起来像小鬼。
collect 120 Crystal Flakes##191309 |q 66232/1 |goto 9.94,41.47
'|kill Brinetooth Bruiser##187285, Brinetooth Wavecrasher##188115, Brinetooth Hunter##187281
step
talk Examiner Rowe##187136
turnin Back To Camp##66559 |goto 7.67,44.27
step
talk Wayun##186212
turnin Afront 'Till A Salt##66232 |goto 7.46,44.28
step
talk Willa Stronghinge##190315
|tip 在建筑物内。
turnin Falling Water##71233 |goto 18.73,24.47
accept Nothing for Breakfast##66837 |goto 18.73,24.47
accept It's Cold Up Here##66838 |goto 18.73,24.47
step
talk Zon'Wogi##190892
accept The Great Shokhari##66844 |goto 19.05,23.97
step
talk Bergede Broadchin##190332
fpath Three-Falls Lookout |goto 19.15,23.78
step
talk Modurun Sixtoes##190672
accept It's Brew Time!##66839 |goto The Azure Span/0 19.04,23.27
step
talk Branor Broadbraw##190884
accept Out of Lukh##66843 |goto 19.26,26.90
step
talk Gnoll Mon-Ark##183997
accept By Royal Decree##65279 |goto 16.20,20.88
step
_Next to you:_
talk Gnoll Mon-Ark
accept Rot Rancher##65306
stickystart "Collect_Smelly_Oozes"
stickystart "Kill_Brackenhide_Warriors"
step
kill 4 Brackenhide Shaman##183957 |q 65279/2 |goto 14.07,20.93
|tip 他们看起来像是拿着法杖的食人魔。
step
label "Collect_Smelly_Oozes"
click Rotting Sap##375266+
|tip 它们看起来像是从物体上滴落的大型黄色腐臭物。
kill Errant Rot##184011+
|tip 它们看起来像小软泥。
collect 20 Smelly Ooze##189183 |q 65306/1 |goto 13.93,20.80
step
_Next to you:_
talk Gnoll Mon-Ark
turnin Rot Rancher##65306
step
label "Kill_Brackenhide_Warriors"
kill 8 Brackenhide Warrior##183956 |q 65279/1 |goto 15.20,20.69
|tip 他们看起来像拿着钉锤的犬人。
step
_Next to you:_
talk Gnoll Mon-Ark
turnin By Royal Decree##65279
accept Keys to the Kingdom##65302
step
click Royal Key
|tip 看起来像是一把小钥匙。
|tip 你将被攻击。
collect Sticky Gnoll Key##188959 |q 65302/1 |goto 13.83,21.92
step
click Royal Coffers
|tip 这看起来像一个木制酒桶。
|tip 树内探险
打开锁定的桶 |q 65302/2 |goto 14.56,20.60
step
抵达河岸 |q 65302/3 |goto 15.74,19.17
step
talk Gnoll Mon-Ark##183997
|tip 他跑到这个地点。
turnin Keys to the Kingdom##65302 |goto 15.74,19.17
accept Making a Mountain Out of a Gnoll Hill##65594 |goto 15.74,19.17
step
clicknpc Purified Slime##189840
跳上你的史莱姆坐骑 |q 65594/1 |goto 15.71,19.27
step
kill Decay Totem##186137
|tip 使用你的动作条上的 {o}突刺{} 技能。
摧毁腐朽图腾 |q 65594/2 |goto 15.93,19.67 |count 1
step
kill Decay Totem##186137
|tip 使用你的动作条上的 {o}突刺{} 技能。
摧毁腐朽图腾 |q 65594/2 |goto 15.52,20.70 |count 2
step
kill Decay Totem##186137
|tip 使用你的动作条上的 {o}突刺{} 技能。
摧毁腐朽图腾 |q 65594/2 |goto 13.90,20.89 |count 3
step
前往山顶 |q 65594/3 |goto 12.86,22.01
step
talk Gnoll Mon-Ark##183997
turnin Making a Mountain Out of a Gnoll Hill##65594 |goto 12.86,22.01
accept One Bad Apple##65595 |goto 12.86,22.01
step
进入洞穴 |q 65595/1 |goto 12.95,22.78
|tip 洞内探险
step
click Meat Storage
|tip 洞内探险
kill "Friendly" Gnoll##189953
开启第一个牢笼 |q 65595/2 |goto 12.95,22.78
step
click Meat Storage
|tip 洞内探险
kill "Friendly" Gnoll##189981
打开第二个牢笼 |q 65595/3 |goto 12.90,22.77
step
talk Friendly Gnoll##189979
|tip 洞内探险
问他：“如果我打开这个牢笼，你会想要吃掉我吗？”
咨询第三只狗头人 |q 65595/4 |goto 12.86,22.75
step
click Rotting Root
|tip 在点击它之后从中逃跑。
|tip 洞内探险
拉藤 |q 65595/5 |goto 12.99,22.71
step
kill Root of Decay##185326 |q 65595/6 |goto 13.02,22.71
|tip 洞内探险
step
_Next to you:_
talk Gnoll Mon-Ark
turnin One Bad Apple##65595
step
kill Sky Vixen Shokhari##190761 |q 66844/1 |goto 13.33,26.37
|tip 她看起来像一只大型棕色狼龙。
|tip 她在这个区域内奔跑。
step
进入洞穴 |goto 15.86,27.39 < 20 |walk
kill Gloomfur Sasquatch##190723
|tip 洞内探险
观察对话
寻找卢克 |q 66843/1 |goto 15.49,27.63
stickystart "Collect_Vorquin_Meat"
step
kill Striped Bruffalon##190726+
|tip 它们看起来像带角的野牛。
collect 3 Moose Flank##194030 |q 66837/2 |goto 17.48,26.62
step
label "Collect_Vorquin_Meat"
在这个区域击杀沃昆敌人
|tip 它们看起来像有角的骏马。
collect 8 Vorquin Meat##193219 |q 66837/1 |goto 17.48,26.62
'|kill Vorquin Strider##190944, Vorquin Foal##194433
step
talk Branor Broadbraw##190884
turnin Out of Lukh##66843 |goto 19.26,26.90
stickystart "Collect_Fruits_Berries_And_Herbs"
step
击杀此区域的厚毛敌人
|tip 它们看起来像熊。
collect 7 Thick Bear Pelt##193220 |q 66838/1 |goto 21.79,26.76
'|kill Thickmane Bear##190731, Juvenile Thickmane Bear##194436, Thickmane Matriarch##194439
step
label "Collect_Fruits_Berries_And_Herbs"
click Bronze Horn+
|tip 它们看起来像是小型绿色植物，上面长着橙色的茎。
click Dragon Foil+
|tip 它们看起来像是小型的绿色植物，上面长着蓝色的茎。
click Blood Berries+
|tip 它们看起来像小玫瑰灌木。
收集水果、浆果和草药 |q 66839/1 |goto 21.79,26.76
step
talk Willa Stronghinge##190315
|tip 在建筑物内。
turnin Nothing for Breakfast##66837 |goto 18.73,24.47
turnin It's Cold Up Here##66838 |goto 18.73,24.47
step
talk Zon'Wogi##190892
turnin The Great Shokhari##66844 |goto 19.05,23.97
step
talk Modurun Sixtoes##190672
turnin It's Brew Time!##66839 |goto The Azure Span/0 19.04,23.27
step
talk Manny Read##190679
accept Water Safety##66840 |goto 18.54,23.67
step
use the Water Testing Flask##193569
|tip 在瀑布底部。
收集瀑布样本 |q 66840/1 |goto 17.30,23.20 |count 1
step
talk Gannar Fullpack##190666
accept A Shard of the Past##66841 |goto 19.16,24.73
step
use the Water Testing Flask##193569
|tip 在瀑布底部。
收集瀑布样本 |q 66840/1 |goto 19.39,23.95 |count 2
step
use the Water Testing Flask##193569
|tip 在瀑布底部。
|tip 你将被攻击。
收集瀑布样本 |q 66840/1 |goto 20.00,24.18 |count 3
step
click Ancient Artifact
|tip 看起来像一个小鼓。
|tip 在瀑布顶端的一块岩石上。
|tip 水流会试图将你冲走，所以尽量落在岩石上，或者与水流对抗并跳上去。
collect Ancient Artifact##193382 |q 66841/1 |goto 17.61,28.24
step
talk Manny Read##190679
turnin Water Safety##66840 |goto 18.54,23.67
step
talk Thanessa Silverbloom##190652
turnin A Shard of the Past##66841 |goto 18.65,23.67
step
talk Guo-Hee Calmwater##190799
|tip 在建筑物内。
accept Legendary Foil##66845 |goto 18.74,24.43
step
kill Mysterious Apparition##190765
|tip 看起来像个蓝色龙人幽灵。
|tip 它在这个区域漫步。
归还传说中的箔卡 |q 66845/1 |goto 17.29,26.14
step
talk Guo-Hee Calmwater##190799
|tip 在建筑物内。
turnin Legendary Foil##66845 |goto 18.74,24.43
step
talk Mysterious Apparition##191741
|tip 在建筑物内。
accept The Heart of the Deck##66846 |goto 18.77,24.43
step
talk Mysterious Apparition##191741
|tip 在建筑物内。
告诉它“我准备好与你一起制作卡牌了。” |gossip 55333
告诉它“我选择龙形态。” |gossip 54910
告诉它“我选择毁灭者。” |gossip 54911
告诉它“我选择动力。” |gossip 54914
观察对话
打造新卡牌 |q 66846/1 |goto 18.77,24.43
step
talk Mysterious Apparition##191741
|tip 在建筑物内。
turnin The Heart of the Deck##66846 |goto 18.77,24.43
step
talk Sindragosa##186188
accept The Azure Vaults##71155 |goto 39.48,63.07
|only if level >= 70
step
talk Kalecgos##186280
turnin Azure Alignment##65911 |goto 39.48,63.02
accept Calling the Blue Dragons##66027 |goto 39.48,63.02
step
talk Kalecgos##186280
告诉他我准备好让你召回蓝色龙族。 |gossip 54829
与卡雷苟斯交谈 |q 66027/1 |goto 39.48,63.02
step
talk Kalecgos##186280
turnin Calling the Blue Dragons##66027 |goto 39.48,63.02
accept To Rhonin's Shield##65886 |goto 39.48,63.02
step
talk Heleth the Wise##197100
|tip 在塔顶的阳台上。
accept Help Is Our Way!##71094 |goto 46.41,25.68
step
click First-Aid Kit
|tip 在塔顶上。
collect Salve-Soaked Bandages##200514 |q 71094/1 |goto 45.72,25.85
step
clicknpc Venderthvan##197113
|tip 在塔顶的阳台上。
愈合文德凡 |q 71094/3 |goto 46.43,25.68
step
观察对话
talk Heleth the Wise##197100
|tip 他跑到这个地点。
|tip 在塔顶上。
turnin Help Is Our Way!##71094 |goto 45.90,25.98
accept A Claw in Need##71095 |goto 45.90,25.98
step
talk Venderthvan##197201
|tip 在塔顶上。
选择 _"点头表示友好，并询问我能如何帮助他。"_ |gossip 107112
与文德凡交谈 |q 71095/1 |goto 45.94,25.97
step
click Dusty Jar
|tip 它看起来像是一个蓝色玻璃瓶，放在书架的顶端。
|tip 在塔顶上。
选择 _"获得药瓶。"_ |gossip 107106
寻找神器 |q 71095/2 |goto 45.80,25.57
step
talk Venderthvan##197201
|tip 在塔顶上。
turnin A Claw in Need##71095 |goto 45.94,25.97
accept Is A Claw Indeed##71096 |goto 45.94,25.97
step
激活神器 |q 71096/1 |goto 45.94,25.97
|tip 使用 {o}摇动罐子{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 在塔顶上。
step
绘制符文 |q 71096/2 |goto 45.93,25.77
|tip 沿着地面上的粉色线条追踪符文。
|tip 在塔顶上。
step
绘制符文 |q 71096/3 |goto 46.01,25.33 |count 1
|tip 使用 {o}摇动罐子{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 地面上将出现一个符文。
|tip 沿着地面上的粉色线条追踪符文。
|tip 在塔顶上。
step
绘制符文 |q 71096/3 |goto 45.54,25.77 |count 2
|tip 使用 {o}摇动罐子{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 地面上将出现一个符文。
|tip 沿着地面上的粉色线条追踪符文。
|tip 在塔顶上。
step
绘制符文 |q 71096/3 |goto 46.00,26.12 |count 3
|tip 使用 {o}摇动罐子{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 地面上将出现一个符文。
|tip 沿着地面上的粉色线条追踪符文。
|tip 在塔顶上。
step
talk Venderthvan##197201
|tip 在塔顶上。
turnin Is A Claw Indeed##71096 |goto 45.94,25.97
accept A Helping Claw##71097 |goto 45.94,25.97
step
观察对话
|tip 使用 {o}摇动罐子{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 在塔顶上。
激活神器 |q 71097/1 |goto 45.94,25.97
step
talk Venderthvan##197201
|tip 在塔顶上。
turnin A Helping Claw##71097 |goto 45.83,25.99
step
talk Venthi##194680
|tip 在地面上，遮荫下。
turnin Supporting the Cobalt Assembly##72784 |goto 49.05,23.15
accept Welcome to the Assembly##70550 |goto 49.05,23.15
step
talk Kruthix##191999
fpath Cobalt Assembly |goto 49.10,22.67
step
talk Xavin##195637
选择 _"<查看钴蓝军团技能。>"_ |gossip 107115
与哈维恩交谈 |q 70550/1 |goto 49.47,22.60
step
talk Xavin##195637
|tip 在研究窗口选择{o}钴蓝刽子手{}特质。
解锁钴蓝海盗特质 |q 70550/2 |goto 49.47,22.60
step
talk Venthi##194680
turnin Welcome to the Assembly##70550 |goto 49.05,23.15
step
到达罗宁之盾 |q 65886/1 |goto 65.90,25.48
step
talk Tuskarr Elder##190300
accept Riders in the Snow##66708 |goto 65.90,25.48
step
talk Drok Scrollstabber##189751
turnin To Rhonin's Shield##65886 |goto 65.81,25.32
accept To the Mountain##65887 |goto 65.81,25.32
accept Drakes be Gone##67299 |goto 65.81,25.32
step
talk Polky Cogzapper##196545
accept Artifacts in the Wrong Hands##66964 |goto 65.94,25.27
step
talk Portia Striat##191976
fpath Rhonin's Shield |goto 66.00,25.39
step
click Arcane Blaster
控制法术枪 |invehicle |goto 66.09,25.47 |q 67299
step
kill 5 Proto-Drake##192873 |q 67299/1 |goto 66.06,25.46
|tip 它们看起来像在这个营地周围飞翔的红龙。
|tip 使用你的动作条上的技能。
step
talk Drok Scrollstabber##189751
turnin Drakes be Gone##67299 |goto 65.81,25.32
step
talk Taelmyr Blazewing##186742
fpath Theron's Watch |goto 65.37,16.39
step
talk Tyrnokos Sunstrike##186755
accept Wayward Tools##66622 |goto 65.57,16.18
step
talk Sonova Snowden##189401
accept Hollow Up##66553 |goto 65.39,15.95
accept Aggressive Self-Defence##66554 |goto 65.39,15.95
step
clicknpc Wayward Tool##189817+
|tip 它们看起来像各种物品在这个区域漂浮和移动。
|tip 他们会从你身边逃跑，所以当你靠近他们时迅速点击他们。
拯救#6#迷失工具 |q 66622/1 |goto 65.59,16.94
stickystart "Defeat_Winterpelt_Furbolgs"
step
click Various Objects
|tip 它们看起来像图腾、花瓶、大块树木和石头，还有死去的熊人。
揭示#6#线索 |q 66553/1 |goto 66.39,12.77
step
label "Defeat_Winterpelt_Furbolgs"
在这个区域击杀冬幕小狼敌人
|tip 他们看起来像白色熊族。
击败#6#冬狼皮肤毛皮巨魔 |q 66554/1 |goto 66.39,12.77
'|kill Winterpelt Defender##189372, Winterpelt Snowspeaker##189378, Winterpelt Shaman##189381, Winterpelt Guardian##189382
step
talk Tyrnokos Sunstrike##186755
turnin Wayward Tools##66622 |goto 65.57,16.18
step
talk Sonova Snowden##189401
turnin Hollow Up##66553 |goto 65.39,15.95
turnin Aggressive Self-Defence##66554 |goto 65.39,15.95
accept Bear With Me##66555 |goto 65.39,15.95
step
talk Sonova Snowden##189401
选择 _"<尽量重复咆哮的熊怪声音。>"_ |gossip 87434
告诉 _"GraagGch. 绝对的。"_

 |gossip 87432
选择 _"<尽力重现你所听到的。>"_ |gossip 87452
从喉咙深处低吼 |gossip 87449
选择 _“模仿冬毛皮族的隆隆声。”_ |gossip 87444
“在后面，没错。” |gossip 87441
见证翻译 |q 66555/1 |goto 65.39,15.95
step
talk Sonova Snowden##189401
turnin Bear With Me##66555 |goto 65.39,15.95
accept Ice Cave Ya Got There##66556 |goto 65.39,15.95
step
进入洞穴 |goto 66.33,11.53 < 20 |walk |only if not (subzone("Winterpelt Hollow") and _G.IsIndoors())
调查冬狼洞穴 |q 66556/1 |goto 65.98,10.73
|tip 洞内探险
step
观察对话
|tip 暴风链束者瑞尼亚的警卫变为敌对状态。
|tip 击杀她的侍卫才能攻击她。
|tip 洞内探险
kill Stormshackler Rynea##189391 |q 66556/2 |goto 65.98,10.73
step
离开洞穴 |goto 66.33,11.53 < 20 |walk |only if subzone("Winterpelt Hollow") and _G.IsIndoors()
talk Sonova Snowden##189401
turnin Ice Cave Ya Got There##66556 |goto 65.39,15.95
accept Academic Aquaintances##66557 |goto 65.39,15.95
step
talk Steria Duskgrove##192830
accept Mossing the Mark##68641 |goto 63.61,28.82
step
talk Callisto Windsor##192825
accept Prowling Polar Predators##68639 |goto 63.58,28.90
stickystart "Slay_Infected_Frigidpelts"
step
click Drakmoss+
|tip 它们看起来像从巨大的脊椎骨上垂挂下来的绿色植物。
collect 5 Drakmoss Clump##197983 |q 68641/1 |goto 63.41,31.34
step
label "Slay_Infected_Frigidpelts"
在此区域击杀寒毛敌人
|tip 它们看起来像带刺的白色熊。
|tip 击杀带有紫色光晕的目标。
击杀#6#感染的冰狼 |q 68639/1 |goto 63.88,30.47
'|kill Prowling Frigidpelt##193062, Frigidpelt Matriarch##193063
step
talk Callisto Windsor##192825
turnin Prowling Polar Predators##68639 |goto 63.58,28.90
step
talk Steria Duskgrove##192830
turnin Mossing the Mark##68641 |goto 63.61,28.82
accept Needles to Say##68642 |goto 63.61,28.82
step
talk Callisto Windsor##192825
accept Vitamins and Minerals##68643 |goto 63.58,28.90
stickystart "Collect_Arcane_Infused_Quills"
step
click Strange Ice Crystal##378175+
|tip 它们看起来像一群蓝色水晶。
collect 4 Vial of Mineral Water##198797 |q 68643/1 |goto 65.09,29.23
step
label "Collect_Arcane_Infused_Quills"
kill Barbed Bakar##193053+
|tip 它们看起来像大型白色狼犬。
clicknpc Prickly Crystalspine##193044+
|tip 他们看起来像蓝色和紫色的刺猬。
collect 15 Arcane-Infused Quill##198336 |q 68642/1 |goto 64.96,29.56
step
talk Callisto Windsor##192825
turnin Vitamins and Minerals##68643 |goto 63.58,28.90
step
talk Steria Duskgrove##192830
turnin Needles to Say##68642 |goto 63.61,28.82
accept Sugar, Spice, and Everything Nice##68644 |goto 63.61,28.82
step
talk Steria Duskgrove##192830
告诉她“我准备好开始了。” |gossip 87511
与斯特里亚交谈 |q 68644/1 |goto 63.61,28.82
step
click Steria's Mortar and Pestle
|tip 它出现在地面上。
准备治疗法术 |q 68644/2 |goto 63.58,28.83
step
talk Callisto Windsor##192825
告诉她“斯特里亚需要你的帮助。” |gossip 55895
说服卡莉斯托提供帮助 |q 68644/3 |goto 63.58,28.90
step
观察对话
talk Sylvie##193068
施药 |gossip 55894
治愈希尔维娜 |q 68644/4 |goto 63.61,28.80
step
talk Steria Duskgrove##192830
turnin Sugar, Spice, and Everything Nice##68644 |goto 63.58,28.83
accept Save a Slyvern##69862 |goto 63.58,28.83
step
与法师会面 |q 69862/1 |goto 65.70,30.84
step
talk Steria Duskgrove##192830
|tip 可能需要一段时间才能让她出现在你面前。
turnin Save a Slyvern##69862 |goto 65.70,30.84
accept They Took the Kits##70338 |goto 65.70,30.84
step
use Steria's Charm of Invisibility##200526
|tip 它将使你隐身，这样你就可以避开敌人。
clicknpc Snowypelt Kit##193078+
|tip 它们看起来像小幼狼龙。
|tip 它们将在你的小地图上出现为黄色点。
|tip 洞内探险
救援#5#工具包 |q 70338/1 |goto 65.82,30.79
step
离开洞穴 |goto 65.82,30.79 < 15 |walk |only if subzone("Slyvern Ice Cave")
talk Sylvie##193068
归还这些装备给它们的母亲。 |gossip 95272
将装备归还给西尔维。 |q 70338/2 |goto 65.73,30.78
step
talk Steria Duskgrove##192830
turnin They Took the Kits##70338 |goto 65.70,30.84
step
talk Old Grimtusk##189963
turnin Riders in the Snow##66708 |goto 59.26,39.73
accept Field Medic 101##66709 |goto 59.26,39.73
step
click Gnoll Spear
移除长矛 |q 66709/1 |goto 59.26,39.73
step
click Pile of Wood##377197+
|tip 它们看起来像一堆棕色的木板。
收集#5#堆木材 |q 66709/2 |goto 59.20,39.79
step
click Campfire
点燃篝火 |q 66709/3 |goto 59.24,39.75
step
talk Old Grimtusk##189963
请按照要求止血。 |gossip 55063
 cauterize the wound 的中文翻译是 灼烧伤口 |q 66709/4 |goto 59.26,39.72
step
talk Old Grimtusk##189963
turnin Field Medic 101##66709 |goto 59.26,39.72
accept The Extraction##66715 |goto 59.26,39.72
step
寻找失踪的图斯卡尔 |q 66715/1 |goto 58.23,41.97
step
talk Frostbite##189625
turnin The Extraction##66715 |goto 58.38,41.99
accept Snowball Effect##66703 |goto 58.38,41.99
step
kill Snowhide Shaman##189654
|tip 树内探险
取回图腾 |q 66703/1 |goto 58.35,42.63 |count 1
step
kill Snowhide Shaman##189654
|tip 树内探险
取回图腾 |q 66703/1 |goto 56.88,42.33 |count 2
step
kill Snowhide Shaman##189654
取回图腾 |q 66703/1 |goto 57.64,41.54 |count 3
step
talk Frostbite##189625
turnin Snowball Effect##66703 |goto 58.38,41.99
accept Frostbite: Causes and Symptoms##67050 |goto 58.38,41.99
step
click Snowhide Totem
放置雪裘图腾 |q 67050/1 |goto 58.27,41.95 |count 1
step
click Snowhide Totem
放置雪裘图腾 |q 67050/1 |goto 58.24,41.99 |count 2
step
click Snowhide Totem
放置雪裘图腾 |q 67050/1 |goto 58.23,41.92 |count 3
step
talk Old Grimtusk##189963
重返古格林图斯 |q 67050/2 |goto 58.48,40.53
step
talk Old Grimtusk##189963
turnin Frostbite: Causes and Symptoms##67050 |goto 58.48,40.53
accept True Survivors##66730 |goto 58.48,40.53
step
talk Old Grimtusk##196812
turnin True Survivors##66730 |goto 58.79,34.91
accept No Vengeance on an Empty Stomach##71013 |goto 58.79,34.91
step
talk Young Quickhands##196840
|tip 学习龙岛钓鱼技能。
向年轻的快手学习钓鱼技能 |q 71013/1 |goto 58.81,34.78
step
cast Fishing##131474
|tip 点击{o}钓鱼浮漂{}当它{o}在水中弹跳{}时。
|tip 不断重复这个过程。
鱼 #3# 冰冻尾鳍鱼 |q 71013/2 |goto 58.86,34.83
step
talk Old Grimtusk##196812
turnin No Vengeance on an Empty Stomach##71013 |goto 58.79,34.91
accept A Far Furbolg Friend##71014 |goto 58.79,34.91
accept All Brawn, No Brains##71015 |goto 58.79,34.91
accept Grimtusk's Sister##71016 |goto 58.79,34.91
step
talk Kalecgos##186304
turnin To the Mountain##65887 |goto 70.01,35.23
accept Primal Offensive##65943 |goto 70.01,35.23
step
talk Khadgar##186305
accept Lava Burst##65944 |goto 70.03,35.34
accept Elemental Unfocus##66647 |goto 70.03,35.34
stickystart "Slay_Primalist_Forces_65943"
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 72.23,37.28 |count 1
step
kill Ruvin Stonegrinder##189939
|tip 小洞穴内。
collect Elemental Focus##192478 |q 66647/1 |goto 72.91,38.72
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 73.12,37.76 |count 2
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 73.77,38.32 |count 3
step
label "Slay_Primalist_Forces_65943"
在该区域击杀敌人
击败15个原始者势力 |q 65943/1 |goto 72.65,37.62
'|kill Fiery Carver##186328, Primal Fire Elemental##186550, Mountain Shaper##186329
step
talk Archmage Khadgar##186688
turnin Lava Burst##65944 |goto 74.47,37.84
turnin Elemental Unfocus##66647 |goto 74.47,37.84
step
talk Kalecgos##186686
turnin Primal Offensive##65943 |goto 74.47,37.81
accept Primal Power##65958 |goto 74.47,37.81
step
talk Archmage Khadgar##186688
accept Kirin Tor Recovery##65977 |goto 74.46,37.84
stickystart "Recover_The_Primal_Energies"
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 74.59,38.63 |count 1
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 75.27,37.21 |count 2
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 75.64,38.37 |count 3
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.13,37.86 |count 4
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.57,38.92 |count 5
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.02,39.53 |count 6
step
label "Recover_The_Primal_Energies"
在该区域击杀敌人
use Elemental Focus##192479
|tip 在他们的尸体旁使用它。
恢复原始能量 |q 65958/1 |goto 75.49,38.27
'|kill Primal Lava Elemental##186438, Primalist Worshipper##186759
step
talk Archmage Khadgar##186779
turnin Primal Power##65958 |goto 76.95,39.43
turnin Kirin Tor Recovery##65977 |goto 76.95,39.43
accept Free Air##66007 |goto 76.95,39.43
step
extraaction Elemental Disguise##378814
|tip 使用{o}元素伪装{}技能。
|tip 它在屏幕上显示为一个按钮。
伪装成人类元素 |havebuff Elemental Disguise##378814 |goto 76.95,39.43 |q 66007
step
_NOTE:_
在下一步中
|tip 避开地面的蓝色漩涡。
|tip 避免那些身边有蓝圈的敌人，他们能透视你的伪装。
点击此处继续 |confirm |q 66007
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 77.36,39.91 |count 1
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 77.35,38.28 |count 2
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 78.22,37.64 |count 3
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 78.55,39.04 |count 4
step
进入洞穴 |goto 78.72,39.53 < 20 |walk
talk Kalecgos##186862
|tip 洞内探险
turnin Free Air##66007 |goto 78.38,39.98
accept In Defense of Vakthros##66009 |goto 78.38,39.98
step
kill Korthrox the Destroyer##183422 |q 66009/1 |goto 79.27,36.33
|tip 蓝色圆圈（不是蓝色闪电漩涡）将在你与他战斗时出现在地面上。
|tip 卡雷戈斯会在蓝色圆圈出现时在你的聊天中说“在我的符文中寻求庇护！”
|tip 当地面出现蓝色圆圈时，{o}进入蓝色圆圈{}。
|tip 他们将使你在Korthrox使用强大技能时免受伤害。
step
talk Archmage Khadgar##193837
turnin In Defense of Vakthros##66009 |goto 77.99,32.47
accept The Storm-Eater's Fury##70041 |goto 77.99,32.47
step
click Arcane Disc
登上奥术圆盘 |q 70041/1 |goto 78.03,32.44
step
观察对话
在该区域击杀敌人
|tip 附近的地面上。
|tip 使用你的动作条上的技能。
击退#150#原始者军团 |q 70041/2
step
驱散 #3# 风暴漏斗 |q 70041/3
|tip 它们看起来像附近地面上的灰色旋转龙卷风。
|tip 使用你的动作条上的{o}碧蓝驱散{}技能。
step
在该区域击杀敌人
|tip 附近的地面上。
|tip 使用你的动作条上的技能。
消灭#200#原始派军团 |q 70041/4
step
talk Kalecgos##187034
turnin The Storm-Eater's Fury##70041 |goto 78.22,33.34
accept The Blue Dragon Oathstone##66015 |goto 78.22,33.34
step
talk Kattigat##196254
turnin Artifacts in the Wrong Hands##66964 |goto 67.22,44.41
accept The Ailing Apprentice##67111 |goto 67.22,44.41
step
talk To'tik##191715
accept The Fending Flames##67724 |goto 67.34,44.34
accept Kill it with Fire##70856 |goto 67.34,44.34
stickystart "Collect_Intact_Crawler_Venom_Glands"
stickystart "Burn_Infected_Plunderers"
step
click Spider Silk Cocoon##378052
|tip 深入地下洞窟。
collect Shiverweb Silk##195468 |q 67724/1 |goto 68.06,43.06 |count 1
step
click Spider Silk Cocoon##378052
|tip 深入地下洞窟。
collect Shiverweb Silk##195468 |q 67724/1 |goto 68.49,43.63 |count 2
step
click Spider Silk Cocoon##378052
collect Shiverweb Silk##195468 |q 67724/1 |goto 68.73,45.38 |count 3
step
click Spider Silk Cocoon##378052
|tip 在破碎的建筑内。
collect Shiverweb Silk##195468 |q 67724/1 |goto 68.48,45.97 |count 4
step
label "Collect_Intact_Crawler_Venom_Glands"
kill Shiverweb Crawler##192591+
|tip 它们看起来像大型蓝色巨蛛。
|tip 它们可以隐藏在地面之下。
|tip 洞穴内外。 |不固定
collect 5 Intact Crawler Venom Gland##194747 |q 67111/1 |goto 68.67,44.55
step
label "Burn_Infected_Plunderers"
use the Flamethrower Torch##199928
|tip 在{o}感染者掠夺者{}旁边使用它。
|tip 他们看起来像是带着小蓝色蛋的龙人尸体。
|tip 将自己定位在{o}将火焰指向尸体{}。
|tip 洞内与洞外。|不固定
烧尽 #10# 感染的掠夺者 |q 70856/1 |goto 68.67,44.55
'|clicknpc Infected Plunderer##196486
step
talk To'tik##191715
turnin The Fending Flames##67724 |goto 67.34,44.34
turnin Kill it with Fire##70856 |goto 67.34,44.34
step
talk Kattigat##196254
turnin The Ailing Apprentice##67111 |goto 67.22,44.41
accept Back into the Action##70858 |goto 67.22,44.41
step
clicknpc Alia Sunsoar##192234
施用冰冷解药 |q 70858/1 |goto 67.23,44.38
step
观察对话
talk Alia Sunsoar##196501
|tip 她走向这个地点。
turnin Back into the Action##70858 |goto 67.30,44.34
accept What the Guardian Beholds##70859 |goto 67.30,44.34
step
kill Edavix##196377
|tip 建筑内部, {o}高高地在悬崖边缘{}。
collect Whispering Shard##200067 |q 70859/1 |goto 69.54,43.11
step
talk Alia Sunsoar##196501
turnin What the Guardian Beholds##70859 |goto 67.30,44.34
accept Whispered Fragments##70931 |goto 67.30,44.34
step
talk To'tik##191715
accept What Valthrux Once Was##70937 |goto 67.34,44.34
stickystart "Collect_Whispering_Fragments"
step
click Discarded Journal
寻找被遗弃的日记 |q 70937/4 |goto 69.53,44.12
step
click Crumbling Tablet
|tip 在建筑物内。
寻找破碎的石板 |q 70937/1 |goto 70.19,43.29
step
click Sundered Flame Journal
|tip 建筑内部，一楼。
寻找破碎之焰日志 |q 70937/3 |goto 70.01,46.15
step
click Scratched Tablet
|tip 在建筑内部，顶层。
寻找划痕石板 |q 70937/2 |goto 70.25,46.17
step
label "Collect_Whispering_Fragments"
在该区域击杀敌人
|tip 只有看起来像龙人的敌人才能掉落任务物品。
collect 40 Whispering Fragments##200110 |q 70931/1 |goto 69.67,45.61
'|kill Unruly Plunderer##196383, Thieving Conjurer##196388, Skulking Bruiser##196384
step
talk To'tik##191715
turnin What Valthrux Once Was##70937 |goto 67.34,44.34
step
talk Alia Sunsoar##196501
turnin Whispered Fragments##70931 |goto 67.30,44.34
step
talk To'tik##191715
accept No One May Wield It##70946 |goto 67.34,44.34
step
talk Alia Sunsoar##196501
告诉她 "阿莉亚，这个神器太危险了，必须销毁。" |gossip 106989
观察对话
警告阿莉亚 |q 70946/1 |goto 67.30,44.34
step
talk To'tik##191715
turnin No One May Wield It##70946 |goto 67.34,44.34
step
talk Kattigat##196520
accept Good Intentions##70970 |goto 67.32,44.39
step
进入洞穴 |goto 71.76,43.64 < 15 |walk |only if not subzone("Forgotten Cavern")
kill Alia Sunsoar##196737
|tip 洞内探险
停止艾莉亚 |q 70970/1 |goto 72.54,42.85
step
click Valthrux
|tip 洞内探险
选择 _"<摧毁瓦尔萨克>"_ |gossip 107025
摧毁瓦尔瑟鲁克 |q 70970/2 |goto 72.55,42.85
step
离开洞穴 |goto 71.76,43.64 < 15 |walk |only if subzone("Forgotten Cavern")
talk Kattigat##196520
turnin Good Intentions##70970 |goto 67.32,44.39
step
talk Rannan Korren##188144
accept To the Ruins!##66391 |goto 63.44,57.99
step
talk Maddy Scattershot##187800
turnin Path to Nowhere##66671 |goto 63.22,58.42
step
talk Garz##187301
turnin Academic Aquaintances##66557 |goto 63.20,58.62
accept Broken Traditions, Broken Bodies##66141 |goto 63.20,58.62
step
talk Camilla Highwind##186782
fpath Camp Nowhere |goto 63.45,58.66
step
talk Rannan Korren##189171
|tip 在破碎的建筑内。
turnin To the Ruins!##66391 |goto 65.02,58.61
accept R.A.D. Anomalies##66353 |goto 65.02,58.61
step
talk Lathos Sunband##189166
|tip 在破碎的建筑内。
accept What the Enemy Knows##66352 |goto 65.00,58.62
stickystart "Collect_Sundered_Flames_Orders"
step
use the R.A.D.##191909
记录异常 |q 66353/1 |goto 65.53,58.83 |count 1
step
use the R.A.D.##191909
记录异常 |q 66353/1 |goto 66.30,59.37 |count 2
step
use the R.A.D.##191909
记录异常 |q 66353/1 |goto 66.39,59.73 |count 3
step
label "Collect_Sundered_Flames_Orders"
在该区域击杀敌人
|tip 他们看起来像蓝龙人。
收集4个破碎烈焰的命令 |q 66352/1 |goto 65.70,59.45
'|kill Tarasek Warrior##187352, Arcane Manipulator##188172, Sundered Sentinel##188173
step
talk Rannan Korren##189171
|tip 在破碎的建筑内。
turnin R.A.D. Anomalies##66353 |goto 65.02,58.61
step
talk Lathos Sunband##189166
|tip 在破碎的建筑内。
turnin What the Enemy Knows##66352 |goto 65.00,58.62
accept The Expedition Continues!##66422 |goto 65.00,58.62
step
talk Lathos Sunband##189236
turnin The Expedition Continues!##66422 |goto 65.64,60.79
accept Worries and Validations##66423 |goto 65.64,60.79
step
click Ruined Draconic Tablet
|tip 这看起来像是一块石板。
寻找线索 |q 66423/1 |goto 65.32,60.81 |count 1
step
click Ruined Draconic Tablet
|tip 这看起来像是一块石板。
寻找线索 |q 66423/1 |goto 65.86,60.55 |count 2
step
talk Lathos Sunband##189236
turnin Worries and Validations##66423 |goto 65.64,60.80
step
talk Rannan Korren##188845
accept Arcane Overload##66425 |goto 65.63,60.76
step
use the R.A.D.D.E.R.##192110
|tip 靠近蓝色气泡。
|tip 建筑内部，一楼。
|tip 你将被攻击。
驱散奥术泡影 |q 66425/1 |goto 65.28,61.31 |count 1
step
use the R.A.D.D.E.R.##192110
|tip 靠近蓝色气泡。
|tip 建筑内部，一楼。
|tip 你将被攻击。
驱散奥术泡影 |q 66425/1 |goto 65.10,61.54 |count 2
step
use the R.A.D.D.E.R.##192110
|tip 靠近蓝色气泡。
|tip 在建筑内部，顶层。
|tip 你将被攻击。
驱散奥术泡影 |q 66425/1 |goto 65.06,61.14 |count 3
step
talk Rannan Korren##188845
turnin Arcane Overload##66425 |goto 65.63,60.76
step
talk Lathos Sunband##189236
accept Running Out of Time##66426 |goto 65.64,60.79
step
观察对话
倾听拉南和拉索斯的计划 |q 66426/1 |goto 65.64,60.79
step
talk Lathos Sunband##189792
|tip 在建筑物内。
turnin Running Out of Time##66426 |goto 68.46,60.50
accept A Looming Menace##66427 |goto 68.46,60.50
step
kill Arcane Manipulator Tharohn##188171 |q 66427/1 |goto 68.08,61.59
|tip 在石质平台上。
step
talk Lathos Sunband##189792
|tip 在建筑物内。
turnin A Looming Menace##66427 |goto 68.46,60.50
step
talk Rannan Korren##189791
|tip 在建筑物内。
accept Friendship For Granted##66428 |goto 68.48,60.44
step
use the R.A.D.D.E.R.E.R.##192475
|tip 在建筑物内。
使用 R.A.D.D.E.R.E.R. |q 66428/1 |goto 68.60,60.39
step
观察对话
|tip 在建筑物内。
驱散奥术屏障 |q 66428/2 |goto 68.50,60.47
step
talk Rannan Korren##189791
|tip 在建筑物内。
turnin Friendship For Granted##66428 |goto The Azure Span/0 68.48,60.43
accept I Will Remember##66429 |goto The Azure Span/0 68.48,60.43
step
talk Narn##190873
问它 "发生了什么事？" |gossip 55174
与纳恩交谈 |q 66141/1 |goto 65.62,54.84
step
talk Garz##187308
turnin Broken Traditions, Broken Bodies##66141 |goto 63.51,52.98
accept Former Furbolg Family##66148 |goto 63.51,52.98
accept Elemental Influence##66149 |goto 63.51,52.98
accept Rescuing Radza##66150 |goto 63.51,52.98
stickystart "Slay_Rustpine_Furbolg_And_Elementals"
step
talk Radza Thunderclaw##187501
|tip 如果有人已经和他交谈过，你可能无法与他对话。
|tip 跳过到下一步，如果你无法与他对话。
告诉它“我已经做好准备与你的捕获者作斗争。” |gossip 54654
|tip 你将被攻击。
与雷霆爪拉德萨交谈 |q 66150/1 |goto The Azure Span/0 60.95,51.46
step
击杀波浪袭来的敌人
kill Khargall Fivefangs##188102
保卫雷爾扎·雷霆爪 |q 66150/2 |goto 60.95,51.46
step
click Primalist Earthbind Totem+
|tip 它们看起来像小木制基座。
摧毁 #3# 原始土元素图腾 |q 66149/1 |goto 61.80,51.94
step
label "Slay_Rustpine_Furbolg_And_Elementals"
在该区域击杀敌人
击杀15个锈松毛皮狼人和元素生物 |q 66148/1 |goto 61.80,51.94
'|kill Rustpine Loamcrafter##188664, Rustpine Loamcrafter##191155, Rustpine Loamcrafter##187539, Rustpine Immolator##187396, Rustpine Rager##188803, Stonegrabber Shard##187506, Rustpine Fireflinger##191152, Stonegrabber Fragment##187625
step
talk Narn##187534
turnin Former Furbolg Family##66148 |goto 60.93,50.59
turnin Elemental Influence##66149 |goto 60.93,50.59
step
talk Radza Thunderclaw##187616
turnin Rescuing Radza##66150 |goto 60.91,50.51
accept His Stone Heart##66151 |goto 60.91,50.51
step
kill Stoneheart##187387 |q 66151/1 |goto 60.51,49.48
|tip 洞内探险
step
talk Radza Thunderclaw##187616
turnin His Stone Heart##66151 |goto 60.91,50.51
step
talk Garz##187535
accept Nowhere to Go##66152 |goto 60.99,50.57
step
talk Garz##188897
turnin Nowhere to Go##66152 |goto 63.20,58.67
step
talk Rannan Korren##193337
turnin I Will Remember##66429 |goto 63.68,58.91
step
talk Sindragosa##186188
告诉她“我准备好迎接誓石的重夺。” |gossip 55293
见证仪式 |q 66015/1 |goto 39.48,63.07
step
talk Sindragosa##186188
turnin The Blue Dragon Oathstone##66015 |goto 39.48,63.07
step
talk Kalecgos##190000
accept To Valdrakken##66244 |goto 39.47,63.05
|only if not (haveq(72293) or completedq(72293))
step
talk Varsek##196816
|tip 在破碎的建筑内。
turnin All Brawn, No Brains##71015 |goto 21.05,35.09
accept Elementary, My Dear Drakonid##71009 |goto 21.05,35.09
step
观察对话
clicknpc Instructional Crystal##196837
告诉它“我已经准备好追随规律。” |gossip 107039
激活指令水晶 |q 71009/1 |goto 21.54,35.48
step
遵循规律 |q 71009/2 |goto 21.68,35.39
|tip 在粉色线路上奔跑，追踪它们。
step
talk Varsek##196838
turnin Elementary, My Dear Drakonid##71009 |goto 21.51,35.47
accept Varsek Recruited##71012 |goto 21.51,35.47
step
talk Rauvros##194415
|tip 在建筑物顶层，位于中间楼层。
accept The Joy of Painting##70166 |goto 22.14,36.77
step
talk Tavio##195935
turnin Tuskarr Fishing Gear##71230 |goto 12.82,49.18
step
进入建筑物 |goto 12.79,49.34 < 10 |walk
talk Naluki##196841
|tip 在建筑物内。
turnin Grimtusk's Sister##71016 |goto 12.47,49.23
accept Naluki's Letter##71017 |goto 12.47,49.23
step
talk Elder Poa##186448
|tip 在建筑物内。
accept Tuskarr Champion's Tales##70940 |goto 12.41,49.34
step
talk Hudson##194323
turnin The Joy of Painting##70166 |goto 7.86,53.48
step
观察对话
talk Ranpiata##194425
accept Sad Little Accidents##70168 |goto 7.87,53.45
step
talk Barst##196806
turnin A Far Furbolg Friend##71014 |goto 1.18,39.26
accept A Little Kelp for My Friends##70996 |goto 1.18,39.26
step
kill Wild Kelp Elemental##196809 |q 70996/1 |goto 0.81,39.03
|tip 在海滩的小洞穴里。
step
talk Barst##196806
|tip 洞穴之上，外面。
turnin A Little Kelp for My Friends##70996 |goto 1.18,39.26
accept Barst Recruited##71000 |goto 1.18,39.26
step
talk Old Grimtusk##196812
turnin Varsek Recruited##71012 |goto 58.79,34.91
turnin Barst Recruited##71000 |goto 58.79,34.91
turnin Naluki's Letter##71017 |goto 58.79,34.91
accept Loose Ends##71135 |goto 58.79,34.91
step
click Campfire
发送集结信号 |q 71135/1 |goto 59.08,44.26
step
观察对话
kill Frostbite##197164 |q 71135/2 |goto 58.91,44.14
|tip 击杀他身后的食人妖以解除他的护盾。
step
talk Old Grimtusk##196812
turnin Loose Ends##71135 |goto 58.79,34.91
step
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)"		|only if not completedq(72293)
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)",{
author="support@zygorguides.com",
},[[
step
talk Aluri##193321
fpath Valdrakken |goto Valdrakken/0 44.04,67.97
step
talk Waywatcher Lorin##197533
accept The Wayward Waywatcher##71219 |goto 50.14,62.38
step
talk Hot Springs Spa Promoter##197986
accept Relaxation Time!##72067 |goto 48.06,59.63
step
talk Grimla Fizzlecrank##194578
accept Lost to the Skies##71239 |goto 25.17,66.16
step
talk Unatos##193015
|tip 在建筑物内。
accept Orientation: Valdrakken##72406 |goto 58.16,35.11
|only if not achieved(16363)
step
click Teleport to Seat of the Aspects
|tip 楼上建筑内
访问神器座位的传送器 |q 66244/2 |goto 61.95,32.12
|only if haveq(66244)
step
前往瓦尔德拉肯 |q 66244/1 |goto 58.11,34.87
|tip 在塔顶上。
|only if haveq(66244)
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin To Valdrakken##66244 |goto 58.11,34.87 |only if haveq(66244) or completedq(66244)
turnin Thaldraszus##72269 |goto 58.11,34.87 |only if haveq(72269) or completedq(72269)
accept A Message Most Dire##66159 |goto 58.11,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
告诉她“关于蓝色区...” |gossip 55406
传递情报 |q 66159/1 |goto 58.11,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin A Message Most Dire##66159 |goto 58.11,34.87
step
观察对话
talk Captain Drine##189842
|tip 她冲向这个地点。
|tip 在塔顶上。
accept Nowhere to Hide##66163 |goto 59.37,34.74
accept Eyes and Ears##66166 |goto 59.37,34.74
step
use the Revealing Dragon's Eye##198859
|tip 在塔顶上。
使用显现之龙眼 |q 66163/1 |goto 59.37,34.74
step
talk Kalecgos##187676
|tip 在塔顶上。
accept The Algeth'ar Academy##72193 |goto 61.69,36.03
|only if level >= 70
step
talk Watcher Koranos##191369
|tip 在塔顶上。
accept Halls of Infusion: Entropy to Order##72192 |goto 54.38,40.94
step
talk Thalendra##192522
accept A Dryad's Work Is Never Done##67094 |goto 72.76,66.17
step
talk Tender Xina##189364
|tip 他在这个区域游荡。
accept Garden Variety##72189 |goto 77.43,67.31
step
talk Valdrakken Citizen##189869
停下！我看穿了你的伪装！ |gossip 55202
|tip 你将被3个敌人攻击。
|tip 你可能需要等他们重生。
kill 3 Primalist Infiltrator##189895 |q 66163/2 |goto 80.36,50.34 |count 3
step
talk Valdrakken Citizen##189869
停下！我看穿了你的伪装！ |gossip 55202
|tip 你将被3个敌人攻击。
|tip 你可能需要等他们重生。
kill 6 Primalist Infiltrator##189895 |q 66163/2 |goto 68.52,64.87 |count 6
step
clicknpc Hungry Swoglet##192810
|tip 看起来像一只大型黄色蛙。
|tip 它在这个区域漫步。
喂养饥饿的小斯沃格莱特 |q 67094/1 |goto 67.05,70.49
step
clicknpc Hungry Slyvern Kit##192804
|tip 看起来是一只小白色狼龙。
|tip 它在这个区域漫步。
饲喂饥饿的斯莱文套件 |q 67094/3 |goto 56.93,80.00
step
clicknpc Hungry Hatchling##192793
|tip 看起来是一只小龟。
|tip 在建筑物上方的高原上，靠近水域。
|tip 它在这个区域漫步。
喂养饥饿的小龙蛋 |q 67094/4 |goto 58.54,57.09
step
进入建筑物 |goto 55.33,57.37 < 20 |walk
click Storage Chest
|tip 在建筑物内。
观察对话
调查银行 |q 66166/2 |goto 59.20,54.70
step
clicknpc Hungry Eft##192585
|tip 看起来像一只小白色新显龙。
|tip 它在这个区域和附近的水域游走。
喂养饥饿的蝾螈 |q 67094/5 |goto 51.29,71.45
step
talk Kaestrasz##185561
见龙族手稿与护甲供应商 |q 72406/2 |goto 46.67,78.94
|only if haveq(72406)
step
clicknpc Hungry Otter Pup##192808
|tip 看起来像一只小棕色啮齿动物。
|tip 它在这个区域漫步。
喂养饥饿的小水獺 |q 67094/2 |goto 42.68,74.86
step
talk Dothenos##191000
会见交易协调员 |q 72406/3 |goto Valdrakken/0 36.38,63.02
|only if haveq(72406)
step
click Consortium Ledger
观察对话
调查工匠联盟 |q 66166/1 |goto 34.63,61.30
step
talk Provisioner Thom##193659
|tip 在建筑物内。
见装备供应商 |q 72406/1 |goto 36.57,50.64
|only if haveq(72406)
step
click Goblet
|tip 看起来像个桌子上的黄金酒杯。
|tip 在建筑物内。
观察对话
调查旅店 |q 66166/3 |goto 46.92,47.72
step
talk Erugosa##185556
|tip 在建筑物内。
accept To Cook With Finery##70880 |goto 46.51,46.24
|only if not achieved(16363)
step
click Discarded Note
|tip 它看起来像一张躺在酒吧上的卷轴。
|tip 在建筑物内。
accept Archival Assistance##67007 |goto 47.80,46.57
|only if level >= 70
step
talk Talikka##198349
|tip 在建筑物内。
accept Reservoir Reservations##72190 |goto 25.49,40.93
step
talk Kemora##189973
|tip 在建筑物内。
turnin Archival Assistance##67007 |goto 35.04,28.07
|only if level >= 70
step
talk Spa Concierge##197670
turnin Relaxation Time!##72067 |goto Thaldraszus/0 40.42,49.54
accept Serene Dreams##72246 |goto Thaldraszus/0 40.42,49.54
step
talk Xijan Thornpaw##194717
turnin Serene Dreams##72246 |goto 40.49,48.92
accept Good Reviews##70738 |goto 40.49,48.92
step
talk Quilius##196160
accept Steam Cleaning##70740 |goto 40.46,48.88
step
click Misplaced Luggage
accept Some Favorite Things##70741 |goto 41.47,47.35
stickystart "Rescue_Youga_Students"
stickystart "Slay_Elementals_70740"
step
talk Fleur Starling##198696
拯救瑜伽导师 |q 70738/2 |goto 41.17,47.50
step
click Yougah-for-Ogres Manual
|tip 它看起来像一本{o}书{}。
寻找失物 |q 70741/1 |goto 41.16,47.44 |count 2
step
click Lost S.E.L.F.I.E. Camera
|tip 它看起来像是桌子上的一台小型侏儒相机。
寻找失物 |q 70741/1 |goto 40.72,47.31 |count 3
step
click Stylish Umbrella
|tip 看起来像一把红色和白色的伞。
寻找失物 |q 70741/1 |goto 40.10,46.61 |count 4
step
click Overturned Beach Chair
|tip 它看起来像一把用红绿布制成的可折叠木椅。
寻找失物 |q 70741/1 |goto 40.27,46.16 |count 5
step
click Soggy You-ga Pillow
|tip 看起来像是一个位于瀑布底部的红色方形坐垫。
寻找失物 |q 70741/1 |goto 41.01,45.96 |count 6
step
label "Rescue_Youga_Students"
talk Terrorized Spa Guest##194808+
|tip 它们看起来像{o}友好的NPC在恐惧中{}。
营救#6#瑜伽学员 |q 70738/1 |goto 40.92,46.66
step
label "Slay_Elementals_70740"
在该区域击杀敌人
|tip 他们看起来像敌对的蒸汽和火元素。
|tip 较小的中立蒸汽喷气元素不会算作任务目标。
击杀#12#元素生物 |q 70740/1 |goto 40.92,46.66
'|kill Steam Scaulder##194937, Flame Blister##197413
step
talk Quilius##196160
turnin Steam Cleaning##70740 |goto 40.46,48.88
step
talk Xijan Thornpaw##194717
turnin Good Reviews##70738 |goto 40.49,48.93
turnin Some Favorite Things##70741 |goto 40.49,48.93
step
talk Cae'Ryn##194812
accept Precious Baby##70743 |goto 40.49,48.97
step
寻找宝宝 |q 70743/1 |goto 38.90,45.22
step
观察对话
clicknpc Baby##196194
|tip 看起来像一只小狗。
舒适宝宝 |q 70743/2 |goto 38.90,45.22
step
click Horrible Mess
accept Look at the Bones!##70744 |goto 38.89,45.25
step
click More Horrible Mess+
|tip 它们看起来像是一堆红色肉块和骨头。
清理第10场混战 |q 70744/1 |goto 38.53,46.51
step
talk Elzara##194812
turnin Precious Baby##70743 |goto 40.49,48.97
step
talk Xijan Thornpaw##194717
turnin Look at the Bones!##70744 |goto 40.49,48.92
step
talk Quilius##196160
accept Enforced Relaxation##70745 |goto 40.46,48.88
step
掉下去并进入洞穴 |goto 39.88,48.45 < 20 |walk
kill Vadne Bleakheart##195764 |q 70745/1 |goto 40.06,49.02
|tip 洞内探险
step
talk Quilius##196160
|tip 在悬崖上，洞穴之上。
turnin Enforced Relaxation##70745 |goto 40.46,48.88
step
talk Captain Drine##189842
|tip 建筑入口附近
turnin Nowhere to Hide##66163 |goto Valdrakken/0 54.77,47.23
turnin Eyes and Ears##66166 |goto Valdrakken/0 54.77,47.23
accept Southern Exposure##66167 |goto Valdrakken/0 54.77,47.23
step
talk Unatos##193015
|tip 建筑内部，一楼。
turnin Orientation: Valdrakken##72406 |goto 58.17,35.12
|only if haveq(72406) or completedq(72406)
step
talk Thalendra##192522
turnin A Dryad's Work Is Never Done##67094 |goto 72.76,66.17
accept A Dryadic Remedy##67606 |goto 72.76,66.17
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin Garden Variety##72189 |goto Thaldraszus/0 37.86,75.46
accept Azeroth Pest Control##66134 |goto Thaldraszus/0 37.86,75.46
step
kill 8 Agitated Seedling##187687 |q 66134/1 |goto 37.77,75.26
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin Azeroth Pest Control##66134 |goto 37.86,75.47
accept The Gardener's Apprentice##66135 |goto 37.86,75.47
step
click Garden Junk
|tip 在建筑物内。
accept One Drakonid's Junk##66278 |goto 38.91,74.25
step
定位巴斯尔顿勋爵 |q 66135/1 |goto Thaldraszus/0 38.95,74.18
|tip 点击建筑内的各种物品
|tip 你会在你点击的最后一个物品中找到他，在你搜索完所有物品之后。
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin The Gardener's Apprentice##66135 |goto 37.86,75.46
turnin One Drakonid's Junk##66278 |goto 37.86,75.46
accept Elemental Extract##66136 |goto 37.86,75.46
accept Lashing Out##66137 |goto 37.86,75.46
accept New Kid on the Clock##66279 |goto 37.86,75.46
step
clicknpc Lord Basilton##187400
|tip 在开放的建筑内。
让巴希尔顿嗅你的手 |q 66279/1 |goto 37.88,75.44
step
在该区域击杀敌人
|tip 它们看起来像水元素。
collect 5 Watery Essence##191473 |q 66136/1 |goto 37.11,71.19
'|kill Churning Splash##187318, Hulking Wave##187793
step
talk Orizmu##187310
将怀表交给花园中的奥瑞兹穆 |q 66279/2 |goto 35.24,72.64
step
talk Orizmu##187310
turnin New Kid on the Clock##66279 |goto 35.24,72.64
accept Like Sands Through the Hourglass##66138 |goto 35.24,72.64
step
click Pile of Windswept Time Sand+
|tip 它们看起来像一堆沙土。
|tip 你可能会被攻击。
收集#8#堆风卷时间沙 |q 66138/1 |goto 36.02,72.73
step
talk Orizmu##187310
turnin Like Sands Through the Hourglass##66138 |goto 35.24,72.64
step
在该区域击杀敌人
|tip 他们看起来像{o}行走的植物{}。
斩杀10个藤蔓怪 |q 66137/1 |goto 34.45,72.41
'|kill Invasive Deathblossom##187316, Deathblossom Weedling##187885
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin Elemental Extract##66136 |goto 37.86,75.46
turnin Lashing Out##66137 |goto 37.86,75.46
accept Flame at Last##66139 |goto 37.86,75.46
step
use the Concentrated Essence of Water##191676
|tip 在{o}烈焰之灾{}上使用。
|tip 看起来像一个大型火元素。
|tip 它将变得虚弱，更容易被击杀。
kill Blazing Inferno##189043 |q 66139/2 |goto 35.63,75.23
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin Flame at Last##66139 |goto 37.86,75.46
accept Carry On, Basilton##66412 |goto 37.86,75.46
step
clicknpc Lord Basilton##187400
|tip 在开放的建筑内。
选择 _"<巴希尔顿抬头看着你，兴奋地 squeak 一声。他非常想和你一起去更多的冒险！>"_ |gossip 55121
与巴斯尔顿勋爵交谈 |q 66412/1 |goto 37.88,75.44
step
talk Gryrmpech##187300
|tip 在开放的建筑内。
turnin Carry On, Basilton##66412 |goto 37.86,75.46
step
talk Valdren##193454
|tip 高耸在悬崖上。
fpath Garden Shrine |goto 35.62,78.85
step
前往南门 |q 66167/1 |goto 35.85,82.56
step
talk Guardian Velomir##190086
援助守护者维洛米尔 |q 66167/2 |goto 35.85,82.56
step
talk Guardian Velomir##190180
turnin Southern Exposure##66167 |goto 35.85,82.56
accept Vengeance, Served Hot##66169 |goto 35.85,82.56
accept The Fog of Battle##66246 |goto 35.85,82.56
stickystart "Slay_Magmasworn_Primalists"
step
clicknpc Mangled Corpse##190440
检查尸体 |gossip 54894
寻找维洛米尔的部队 |q 66246/1 |goto 36.25,83.73 |count 1
step
clicknpc Badly Injured Guardian##190442
|tip 在建筑物内。
检查尸体 |gossip 55103
寻找维洛米尔的部队 |q 66246/1 |goto 35.76,84.19 |count 2
step
clicknpc Mangled Corpse##190247
检查尸体 |gossip 54893
寻找维洛米尔的部队 |q 66246/1 |goto 36.46,85.39 |count 3
step
label "Slay_Magmasworn_Primalists"
在该区域击杀 magma sworn 敌人
击杀#12# magma swarnder 原生者 |q 66169/1 |goto 36.47,84.79
'|kill Magmaclaw Raider##187218, Magmasworn Lavablade##190212, Magmasworn Flameweaver##193414
step
talk Guardian Velomir##190180
|tip 在桥上
turnin Vengeance, Served Hot##66169 |goto 37.62,83.08
turnin The Fog of Battle##66246 |goto 37.62,83.08
accept Remember the Fallen##66245 |goto 37.62,83.08
step
click Magmasworn Spear
|tip 在桥上
accept Slightly Used Weapons##66247 |goto 37.85,83.26
stickystart "Collect_Magmasworn_Spears"
stickystart "Collect_South_Hold_Garrison_Signet"
step
click Coil of Heavy Rope
accept Tying Things Together##66248 |goto 38.56,83.41
step
click Coil of Heavy Rope##377115+
|tip 它们看起来像缠绕的绳索。
collect 5 Coil of Heavy Rope##192758 |q 66248/1 |goto 39.17,83.81
step
label "Collect_Magmasworn_Spears"
kill Magmasworn Rockcleaver##190420+
collect 6 Magmasworn Spear##192759 |q 66247/1 |goto 39.18,83.83
step
label "Collect_South_Hold_Garrison_Signet"
click South Hold NPCs
|tip 他们看起来像亡灵龙人。
collect 8 South Hold Garrison Signet##191269 |q 66245/1 |goto 38.94,83.89
'|clicknpc South Hold Magus##187518, South Hold Guardian##187516
step
talk Guardian Velomir##190180
|tip 在桥上
turnin Remember the Fallen##66245 |goto 37.62,83.08
turnin Slightly Used Weapons##66247 |goto 37.62,83.08
turnin Tying Things Together##66248 |goto 37.62,83.08
accept Clear the Sky##66249 |goto 37.62,83.08
step
click Siege Scorpion
|tip 在一块石制平台上，俯瞰下面的山谷。
操控 siege scorpion |q 66249/1 |goto 40.88,83.86
step
kill Magmasworn Trueborn##194543+
|tip 它们看起来像附近飞翔的红龙。
|tip 使用你的快捷栏技能。
杀死熔火之誓 |q 66249/2 |goto 40.88,83.86
step
talk Guardian Velomir##190558
|tip 在建筑物内。
turnin Clear the Sky##66249 |goto 40.56,85.48
accept Where's The Chief?##66250 |goto 40.56,85.48
step
talk Guardian Velomir##190558
|tip 在建筑物内。
告诉他“我准备好了。让我们进去！” |gossip 54896
调查哨塔 |q 66250/1 |goto 40.56,85.48
step
talk Guardian Velomir##190562
turnin Where's The Chief?##66250 |goto 40.15,85.13
accept Fire Fighter##66251 |goto 40.15,85.13
step
kill Magmatalon##189538 |q 66251/1 |goto 40.29,87.10
|tip 他看起来像一只在这个区域空中飞翔的黑色和橙色龙。
|tip 他将在你的小地图上以黄色点的形式出现。
step
talk Guardian Velomir##190562
turnin Fire Fighter##66251 |goto 40.15,85.13
accept Reporting In##66252 |goto 40.15,85.13
step
talk Captain Drine##189842
|tip 在塔顶上。
turnin Reporting In##66252 |goto Valdrakken/0 55.94,39.96
accept Chaos and Commotion##71024 |goto Valdrakken/0 55.94,39.96
accept Look to the Overlook##71179 |goto Valdrakken/0 55.94,39.96
step
talk Nozdormu##187669
|tip 在塔顶上。
accept The Flow of Time##66320 |goto 61.40,39.05
step
click Teleport to Bottom Floor
|tip 看起来像一个传送点。
|tip 在塔顶上。
传送到底层 |q 71024/1 |goto 55.36,46.00
step
talk Investigator Erima##196878
|tip 建筑内部，一楼。
告诉他“德兰妮派我来的。她说这里有骚动。” |gossip 107133
与调查员艾瑞玛交谈 |q 71024/2 |goto 61.77,42.15
step
click Inert Runestone
|tip 建筑内部，一楼。
检视符文石 |q 71024/3 |goto 60.77,40.38
step
观察对话
talk Aesthis##196980
|tip 他跑到这个地点。
|tip 建筑内部，一楼。
问他“那是什么怪物？” |gossip 107400
与艾斯提斯对话 |q 71024/4 |goto 60.79,40.36
step
click Dropped Page
|tip 建筑内部，一楼。
寻找线索 |q 71024/5 |goto 56.94,44.39
step
观察对话
talk Investigator Erima##196984
|tip 他跑到这个地点。
|tip 建筑内部，一楼。
turnin Chaos and Commotion##71024 |goto 56.46,43.75
accept Follow the Clues##70837 |goto 56.46,43.75
step
talk Investigator Erima##196416
|tip 在悬崖边缘，通往高地的路径上。
turnin Follow the Clues##70837 |goto Thaldraszus/0 42.72,81.94
accept Rebels With a Cause##70838 |goto Thaldraszus/0 42.72,81.94
accept Detonation Locations##70842 |goto Thaldraszus/0 42.72,81.94
stickystart "Slay_Rebels_And_Primalists"
step
click Mistyvale Map
|tip 看起来像是一张棕色的纸质地图，钉在帐篷的门口。
collect Mistyvale Map: Training Grounds##200461 |q 70842/1 |goto 43.46,81.96
step
click Mistyvale Map
|tip 看起来像是一张钉在树上的棕色纸质地图。
collect Mistyvale Map: Black Market Auction House##200463 |q 70842/3 |goto 43.55,81.14
step
clicknpc Unfinished Runestone##196464
accept Ruin the Runestones##70843 |goto 43.58,81.01
step
click Incendiary Runestone
摧毁北方宝藏 |q 70843/2 |goto 44.31,80.48
step
click Mistyvale Map
|tip 这看起来像是一个棕色纸质地图放在木箱上。
|tip 帐篷内。
collect Mistyvale Map: Butterfly Garden##200462 |q 70842/2 |goto 44.30,80.92
step
click Incendiary Runestone
摧毁南方缓存 |q 70843/1 |goto 44.43,81.48
step
label "Slay_Rebels_And_Primalists"
在该区域击杀敌人
击杀#8#叛徒和原始派 |q 70838/1 |goto 43.54,80.86
'|kill Mistyvale Splashcaster##193973, Mistyvale Mauler##193948, Mistyvale Firestarter##193969, Primalist Recruiter##197185, Mistyvale Mauler##193970
step
talk Investigator Erima##196432
turnin Rebels With a Cause##70838 |goto 42.58,78.82
turnin Detonation Locations##70842 |goto 42.58,78.82
turnin Ruin the Runestones##70843 |goto 42.58,78.82
accept Maldra's in Hot Water##70850 |goto 42.58,78.82
step
kill Orian Darkwater##196457 |q 70850/1 |goto 42.92,80.21
step
talk Investigator Erima##196432
turnin Maldra's in Hot Water##70850 |goto 42.58,78.82
step
talk Maldra Flametongue##196562
accept Chasing Waterfalls##70873 |goto 42.68,78.80
step
在该区域击杀敌人
|tip 只有看起来像{o}蒸汽元素{}的敌人才会掉落任务物品。
|tip 他们在水域中。
collect 35 Fallingwater Mote##200087 |q 70873/1 |goto 44.09,79.44
你可以在 [43.76,80.85] 附近找到更多。
'|kill Serene Fallingwater##196467, Animate Splash##196469
step
talk Maldra Flametongue##196562
turnin Chasing Waterfalls##70873 |goto 42.68,78.80
accept Breaching the Fire Wall##70874 |goto 42.68,78.80
step
观察对话
|tip 使用“与落水相调的能力”。
|tip 它在屏幕上显示为一个按钮。
开始仪式 |q 70874/1 |goto 42.36,78.81
step
观察对话
完成仪式 |q 70874/2 |goto 42.36,78.81
step
talk Maldra Flametongue##196608
turnin Breaching the Fire Wall##70874 |goto 42.27,78.91
accept Ring of Fire##70878 |goto 42.27,78.91
step
talk Investigator Erima##196566
accept Worst of the Worst##70875 |goto 42.45,78.85
accept Fracture the Foci##70876 |goto 42.45,78.85
stickystart "Slay_Rebels_70875"
stickystart "Slay_Elementals_70875"
step
穿越烈焰，进入洞穴 |goto 43.43,78.76 < 15 |walk |only if not (subzone("Emberslate Cavern") and _G.IsIndoors())
click Primalist Focus
|tip 洞内探险
摧毁原始焦点 |q 70876/1 |goto 43.85,77.82 |count 1
step
click Primalist Focus
|tip 地下洞穴内
摧毁原始焦点 |q 70876/1 |goto 44.23,77.83 |count 2
step
click Primalist Focus
|tip 地下洞穴内
摧毁原始焦点 |q 70876/1 |goto 44.67,77.61 |count 3
step
click Primalist Focus
|tip 洞穴内的楼上
摧毁原始焦点 |q 70876/1 |goto 44.67,78.39 |count 4
step
talk Maldra Flametongue##197580
|tip 地下洞穴内
|tip 如果你无法与她对话，其他玩家可能已经在与元素生物战斗。
|tip 如果元素生物已经在附近攻击，直接击杀它们，无需与马尔德拉交谈。
告诉她“我准备好了。” |gossip 106979
击杀波浪袭来的敌人
kill Magmaticus##196599
保护玛尔德拉·火舌 |q 70878/2 |goto 44.52,78.16
step
label "Slay_Rebels_70875"
击杀迷雾谷敌人，周围区域内
|tip 他们看起来像龙人。
|tip 遍布洞穴。|不固定
击杀#3#反叛者 |q 70875/1 |goto 44.26,78.12
'|kill Mistyvale Stonecarver##196624, Mistyvale Insurgent##196634
step
label "Slay_Elementals_70875"
在该区域击杀敌人
|tip 他们看起来像火元素。
|tip 遍布洞穴。|不固定
击杀#4#元素生物 |q 70875/2 |goto 44.26,78.12
'|kill Blazing Ember##196600, Incendiary Goo##196601, Flickering Ember##197906
step
离开洞穴 |goto 43.43,78.76 < 15 |walk |only if subzone("Emberslate Cavern") and _G.IsIndoors()
talk Investigator Erima##196566
turnin Ring of Fire##70878 |goto 42.45,78.85
turnin Worst of the Worst##70875 |goto 42.45,78.85
turnin Fracture the Foci##70876 |goto 42.45,78.85
accept Report on the Rebels##70879 |goto 42.45,78.85
step
talk Captain Drine##189842
|tip 在塔顶上。
turnin Report on the Rebels##70879 |goto Valdrakken/0 55.94,39.96
step
talk Zuttiki##190527
turnin Reservoir Reservations##72190 |goto Thaldraszus/0 49.54,58.86
accept Wotcher, Watcher?##65913 |goto Thaldraszus/0 49.54,58.86
step
进入建筑物 |goto 47.80,59.47 < 15 |walk
寻找玛拉 |q 65913/1 |goto 46.52,60.00
|tip 在建筑物内。
step
talk Mara##194252
|tip 在建筑物内。
唤醒玛拉 |q 65913/2 |goto 46.52,60.00
step
talk Mara##189045
turnin Wotcher, Watcher?##65913 |goto 49.61,58.76
accept Where There's a Ward, There's a Way##70139 |goto 49.61,58.76
step
talk Zuttiki##190527
accept Preventative Maintenance##65918 |goto 49.54,58.86
step
进入北大厅 |q 70139/1 |goto 51.42,56.36
|tip 在建筑物入口的平台上。
step
进入平台上的建筑 |goto 51.42,56.36 < 15 |walk
click Broken Ward Stone
|tip 在建筑物内。
检查北区 |q 70139/2 |goto 52.25,54.73
step
进入东区大厅 |q 70139/3 |goto 51.52,61.40
|tip 在建筑物入口的平台上。
step
进入平台上的建筑 |goto 51.52,61.40 < 15 |walk
click Broken Ward Stone
|tip 在建筑物内。
检查东区 |q 70139/4 |goto 52.52,62.80
step
在该区域击杀敌人
|tip 你可以在这个建筑物的周围找到它们。
|tip 只有看起来像{o}元素{}的敌人会计入任务目标。
屠戮 #8# 释放的元素生物 |q 65918/1 |goto 49.29,58.62
'|kill Hydraulic Eroder##195092, Unleashed Rubble##194212
step
talk Zuttiki##190527
turnin Preventative Maintenance##65918 |goto 49.54,58.86
step
talk Mara##189045
turnin Where There's a Ward, There's a Way##70139 |goto Thaldraszus/0 49.68,58.75
accept We Don't Negotiate with Primalists##65916 |goto Thaldraszus/0 49.68,58.75
step
talk Zuttiki##190527
accept Refti Retribution##65921 |goto 49.54,58.86
stickystart "Rescue_Refti_Survivors"
stickystart "Take_Revenge_Against_The_Primalists"
step
进入洞穴 |goto 51.99,57.57 < 20 |walk
kill Ko'jo##186367 |q 65916/2 |goto 53.51,56.09
|tip 要攻击他，先击杀他附近的元素生物。
|tip 洞穴内的楼上
step
click Missing Ward Pieces
|tip 洞穴内的楼上
找回失落的法师护符碎片 |q 65916/1 |goto 53.45,56.21
step
label "Rescue_Refti_Survivors"
clicknpc Refti Corpse##196473+
|tip 他们看起来像蜥蜴人躺在地上。
|tip 可以被救助的目标将会被略微的黄色光芒所勾勒。
|tip 洞内探险
拯救#4#雷弗提幸存者 |q 65921/1 |goto 52.88,57.20
step
label "Take_Revenge_Against_The_Primalists"
在该区域击杀敌人
|tip 洞内探险
对抗始源者的复仇 |q 65921/2 |goto 52.88,57.20
'|kill Primalist Floodweaver##194655, Humid Drizzle##194068, Primal Stonekin##194291, Primal Waterspout##194219, Primalist Shardbreaker##194303, Primalist Surgecrusher##194656, Crunchy Gravel##195845, Primalist Earthshaker##194302
step
talk Zuttiki##190527
turnin Refti Retribution##65921 |goto 49.54,58.86
step
talk Mara##189045
turnin We Don't Negotiate with Primalists##65916 |goto Thaldraszus/0 49.68,58.75
accept For the Ward!##65920 |goto Thaldraszus/0 49.68,58.75
step
进入建筑物 |goto 47.80,59.47 < 15 |walk
click Broken Ward Stone
|tip 在建筑物内。
重启西方守卫 |q 65920/1 |goto 46.45,60.02
step
进入平台上的建筑 |goto 51.52,61.40 < 15 |walk
click Broken Ward Stone
|tip 在建筑物内。
重新激活东边守卫 |q 65920/3 |goto 52.52,62.80
step
进入平台上的建筑 |goto 51.42,56.36 < 15 |walk
click Broken Ward Stone
|tip 在建筑物内。
重启北方守卫 |q 65920/2 |goto 52.25,54.73
step
click Warding Console
激活控制台 |q 65920/4 |goto 49.54,58.76
step
talk Mara##189045
turnin For the Ward!##65920 |goto Thaldraszus/0 49.67,58.75
step
talk Harleen Chirpsnide##183912
|tip 小洞穴内。
|tip 山顶之高
turnin Lost to the Skies##71239 |goto 49.95,69.79
accept Flying Rocs##66071 |goto 49.95,69.79
step
talk Segallia##184591
|tip 她在这个区域巡视。
|tip 小洞穴内。
accept Smash 'Em to Feathereens##65267 |goto 49.99,69.76
stickystart "Kill_Screechflight_Witherers"
stickystart "Kill_Screechflight_Hexclaws"
step
clicknpc Injured Bluefeather Roc##184481+
|tip 它们看起来像大型深蓝色的鸟。
修复#8#受伤的蓝羽鹫 |q 66071/1 |goto 50.41,71.14
step
label "Kill_Screechflight_Witherers"
kill 8 Screechflight Witherer##183954 |q 65267/1 |goto 50.41,71.14
|tip 它们看起来像白羽毛的哈比。
step
label "Kill_Screechflight_Hexclaws"
kill 10 Screechflight Hexclaw##183995 |q 65267/2 |goto 50.41,71.14
|tip 它们看起来像黑羽毛的哈比。
step
talk Harleen Chirpsnide##183912
|tip 小洞穴内。
turnin Flying Rocs##66071 |goto 49.95,69.79
step
talk Segallia##184591
|tip 她在这个区域巡视。
|tip 小洞穴内。
turnin Smash 'Em to Feathereens##65267 |goto 49.99,69.76
accept Plucking Parts##65373 |goto 49.99,69.76
step
talk Harleen Chirpsnide##183912
|tip 小洞穴内。
accept A Roc-ing Appetite##65313 |goto 49.95,69.79
accept Explosive Excrement##65490 |goto 49.95,69.79
stickystart "Fill_The_Chirpsnide_Auto_Excre_Collector"
step
进入洞穴 |goto 51.34,72.36 < 20 |walk
click Feather-Plucker 3300 Gasket
|tip 它看起来像一个金属齿轮。
|tip 洞内探险
collect Feather-Plucker 3300 Gasket##189453 |q 65373/2 |goto 51.48,73.57
step
click Feather-Plucker 3300 Bolts
|tip 这看起来像是一小堆金属螺栓和螺母。
|tip 洞穴下层，一个小侧室。
collect Feather-Plucker 3300 Bolts##191178 |q 65373/4 |goto 51.02,74.67
step
沿着小路走下去 |goto 50.33,75.55 < 15 |walk
click Feather-Plucker 3300 Exhaust Pipe
|tip 看起来像一根灰色和金色的金属管。
|tip 地下洞穴内
collect Feather-Plucker 3300 Exhaust Pipe##191177 |q 65373/3 |goto 49.85,76.10
step
沿着小路走下去 |goto 49.09,74.33 < 15 |walk
kill Hawthia Roc-Muncher##184592 |q 65313/1 |goto 48.90,75.17
|tip 地下洞穴内
collect Screechflight Scroll##189361 |n
accept Rolling in the Screech##65475 |goto 48.90,75.17
step
click Feather-Plucker 3300 Gears
|tip 看起来像是一堆金属齿轮在地上。
|tip 地下洞穴内
collect Feather-Plucker 3300 Gears##191176 |q 65373/1 |goto 48.81,75.35
step
label "Fill_The_Chirpsnide_Auto_Excre_Collector"
use The Chirpsnide Auto-Excre-Collector##190188
|tip 用'{o}碾压{} {o}洛克德普天虫{}来击杀它们。'
|tip 在你压扁他们之后，使用物品{o}靠近他们的尸体{}。
|tip 它们看起来像小甲虫。
|tip 穿越洞穴。
填充啾啾尼德自动排泄收集器 |q 65490/1 |goto 50.60,74.22
step
离开洞穴 |goto 50.24,72.28 < 20 |walk |only if (subzone("Bluefeather Cliffs") or subzone("Thaldraszus")) and _G.IsIndoors()
talk Segallia##184591
|tip 她在这个区域巡视。
|tip 小洞穴内。
turnin Plucking Parts##65373 |goto 49.98,69.80
step
talk Harleen Chirpsnide##183912
|tip 小洞穴内。
turnin A Roc-ing Appetite##65313 |goto 49.95,69.79
turnin Rolling in the Screech##65475 |goto 49.95,69.79
turnin Explosive Excrement##65490 |goto 49.95,69.79
accept Separating the Yolk##65287 |goto 49.95,69.79
accept A Nest of Our Own##65371 |goto 49.95,69.79
step
talk Segallia##184591
|tip 她在这个区域巡视。
|tip 小洞穴内。
accept It's Plucking Time##65374 |goto 49.98,69.80
stickystart "Pluck_Hatchling_Feathers"
stickystart "Collect_Screechflight_Staves"
stickystart "Save_Bluefeather_Eggs"
stickystart "Collect_Screechflight_Talons"
step
在该区域击杀敌人
|tip 它们看起来像水元素和蒸汽元素。
|tip 峡谷深处，水中。
collect 3 Streamborne's Core##189974 |q 65371/3 |goto 46.39,70.01
'|kill Creekmoaner##199011, Howling Creekborne##185262
step
label "Pluck_Hatchling_Feathers"
use Feather-Plucker 3300##189454
|tip 使用它在{o}被抓的小龙{}身上。
|tip 它们看起来像在空中飞翔的小蓝色风头鹿。
|tip 在峡谷深处和高高的石壁上。|未固定
拨取 #6# 小龙羽毛 |q 65374/1 |goto 46.39,70.01
'|clicknpc Snatched Hatchling##185524
step
label "Collect_Screechflight_Staves"
kill Screechflight Cursewife##184816+
|tip 它们看起来像蓝色的女妖。
|tip 在峡谷深处和高高的石壁上。|未固定
collect 6 Screechflight Staff##189979 |q 65371/2 |goto 46.39,70.01
step
label "Save_Bluefeather_Eggs"
click Bluefeather Roc Egg+
|tip 它们看起来像大白蛋在巢里。
|tip 在峡谷深处和高高的石壁上。|未固定
拯救#20#蓝羽蛋 |q 65287/1 |goto 46.39,70.01
step
label "Collect_Screechflight_Talons"
消灭此区域内的尖叫飞禽敌人
|tip 它们看起来像{o}女妖{}。|notinsticky
|tip 在峡谷深处和高高的石壁上。|未固定
collect 20 Screechflight Talon##189981 |q 65371/1 |goto 46.39,70.01
'|kill Screechflight Snatcher##183888, Screechflight Cursewife##184816
step
talk Segallia##184591
turnin It's Plucking Time##65374 |goto 43.00,71.48
step
talk Harleen Chirpsnide##183912
turnin Separating the Yolk##65287 |goto 43.00,71.45
turnin A Nest of Our Own##65371 |goto 43.00,71.45
accept Screechflight Potluck##65778 |goto 43.00,71.45
step
use the Im-PECK-able Screechflight Disguise##191681
|tip 在洞穴入口处。
披上伪装 |q 65778/1 |goto 43.42,71.60
step
talk Chef Fry-Aerie##187280
|tip 小洞穴内。
将“蛋”展示给厨师 |gossip 54665
点头 |gossip 54604
说服尖啸飞行厨师 |q 65778/2 |goto 43.56,72.09
step
将蛋扔进尖啸飞行者的锅中 |q 65778/3 |goto 43.56,72.09
|tip 使用{o}抛弃"蛋"{}`技能。
|tip 它在屏幕上显示为一个按钮。
|tip 小洞穴内。
step
观察对话
|tip 小洞穴内。
击倒尖啸飞行器调味品者 |q 65778/4 |goto 43.56,72.09
step
观察对话
talk Harleen Chirpsnide##183912
|tip 她冲向这个地点。
|tip 小洞穴内。
turnin Screechflight Potluck##65778 |goto 43.53,72.11
accept The Awaited Egg-splosion##66299 |goto 43.53,72.11
step
use the Im-PECK-able Screechflight Disguise v2##191763
|tip 小洞穴内。
穿上你的新伪装 |q 66299/1 |goto 43.53,72.11
step
click Simmering Bluefeather Chunk Stew
|tip 看起来像一个药锅。
|tip 小洞穴内。
在汤中投放蛋 |q 66299/2 |goto 43.55,72.11
step
click Chirpsnide's One-Way Taxi
乘坐奇普斯奈德的一趟单程飞行 |q 66299/3 |goto 43.29,71.27
step
click Matriarch's Egg Bowl
|tip 小洞穴内。
将“蛋”放在母系之卵碗上 |q 66299/4 |goto 44.50,73.04
step
观察对话
|tip 小洞穴内。
|tip 你将被攻击。
保持角色定位 |q 66299/5 |goto 44.46,73.00
step
kill Matriarch Avethyra##184847
|tip 小洞穴内。
屠杀女族长 |q 66299/6 |goto 44.46,73.00
step
使用奇普斯耐德的自动滑翔器 |havebuff The Chirpsnide Auto-Glider##371083 |goto 44.24,72.71 |q 66299
|tip 使用{o}啄啄自动滑翔器{}技能。
|tip 它在屏幕上显示为一个按钮。
step
向哈琳报到 |q 66299/7 |goto 43.45,70.54
step
talk Harleen Chirpsnide##183912
turnin The Awaited Egg-splosion##66299 |goto 43.45,70.54
step
talk Szareth##193538
|tip 他在这个区域游荡。
|tip 在一块石制平台上，俯瞰下面的山谷。
accept Every Life Counts##69932 |goto 50.14,67.69
accept Curiosity's Price##69933 |goto 50.14,67.69
stickystart "Collect_Sun_Baked_Linens"
stickystart "Collect_Anethetic_Pollen"
step
clicknpc Stubborn Vine##193569
|tip 点击后，{o}远离它{}以把它从地面抽出。
kill Laden Lasher##193541
collect Snipped Vine##198406 |n
修剪顽固之藤 |q 69933/2 |goto 48.97,66.92
step
label "Collect_Sun_Baked_Linens"
click Handwoven Basket+
|tip 它们看起来像小棕色的柳条篮子。
collect 6 Sun-Baked Linens##198040 |q 69932/1 |goto 49.35,67.04
step
label "Collect_Anethetic_Pollen"
kill Productive Pollinator##193809+
|tip 它们看起来像蜂蜜蜂。
click Magnificent Flower+
|tip 它们看起来像大型紫色叶子植物。
|tip 你可能会被攻击。
collect 40 Anesthetic Pollen##198042 |q 69932/2 |goto 49.35,67.04
step
clicknpc Little Jetstream##193611
|tip 在建筑物内。
绷带小喷流 |q 69932/3 |goto 49.42,67.92
step
talk Szareth##193538
|tip 他在这个区域游荡。
|tip 在一块石制平台上，俯瞰下面的山谷。
turnin Every Life Counts##69932 |goto 50.14,67.69
turnin Curiosity's Price##69933 |goto 50.14,67.69
accept Bleeding Hearts##69934 |goto 50.14,67.69
step
talk Talon Smoht##189018
|tip 在一块石制平台上，俯瞰下面的山谷。
fpath Gelikyr Post |goto 51.16,67.09
step
寻找孤立洞穴 |q 69934/1 |goto 53.03,67.55
|tip 在小洞穴的入口处。
|tip 在地面上
step
click Medical Supplies
|tip 小洞穴内。
将药水送到孤立的洞穴 |q 69934/2 |goto 53.33,67.51
step
寻找基尔克医疗站 |q 69934/3 |goto 51.74,69.16
|tip 在建筑的入口处。
step
click Medical Supplies
|tip 在建筑物内。
将药水送到格里基尔医务室 |q 69934/4 |goto 51.69,69.19
step
talk Timetender Athekk##193042
|tip 他在这个区域游荡。
|tip 在建筑物内。
turnin Bleeding Hearts##69934 |goto 51.69,69.24
step
talk Commander Thadezus##189174
|tip 在桥上
turnin Look to the Overlook##71179 |goto 52.66,67.29
accept What Once Was Ours##66468 |goto 52.66,67.29
step
在该区域击杀敌人
click Various Totem+
|tip 它们看起来像各种类型的元素图腾。
use the Rejuvenating Draught##192795
|tip 在{o}受伤的吉利克尔卫士{}身上使用它。
|tip 他们看起来像建筑里的龙人。
平息原始者威胁 |q 66468/1 |goto 53.91,64.11
'|kill Hailbringer Theurgist##189229, Earthshaker Marauder##189231, Earthshaker Theurgist##189230, Hailbringer Marauder##189228
'|clicknpc Injured Gelikyr Guard##190469, Earthquake Totem##190433, Rainstorm Totem##190434
step
talk Sharnax##189188
|tip 他在这个区域游荡。
|tip 在建筑物内。
turnin What Once Was Ours##66468 |goto 54.35,64.94
accept The Forward Push##66470 |goto 54.35,64.94
accept Prime Planning##66471 |goto 54.35,64.94
stickystart "Collect_Primalist_Orders"
step
kill Karthis Sleetsong##189246
collect Iceforged Gateway Stone##200672 |q 66470/3 |goto 53.70,63.39
step
click Elemental Gateway
关闭元素通道 |q 66470/4 |goto 53.61,63.37 |count 1
step
进入建筑物 |goto 54.28,61.94 < 20 |walk
kill Morgg##189244
|tip 他在建筑物中穿行。
collect Earthen Gateway Stone##200671 |q 66470/2 |goto 54.29,61.94
step
click Elemental Gateway
|tip 在建筑物内。
关闭元素通道 |q 66470/4 |goto 54.88,62.06 |count 2
step
离开副本 |goto 54.28,61.94 < 20 |walk |only if subzone("Gelikyr Overlook") and _G.IsIndoors()
kill Alora Mistbreeze##189243
|tip 外面，在建筑上方。
collect Misttouched Gateway Stone##200670 |q 66470/1 |goto 54.63,62.65
step
click Elemental Gateway
关闭元素通道 |q 66470/4 |goto 54.53,62.52 |count 3
step
label "Collect_Primalist_Orders"
在该区域击杀敌人
|tip 并不是所有敌人都会掉落任务物品。
collect 7 Primalist Orders##192808 |q 66471/1 |goto 54.65,63.13
'|kill Hailstorm Warmonger##190602, Hailstorm Iceshot##190603, Rockguard Cragshaper##190605
step
talk Sharnax##189188
|tip 在道路的顶端，靠近一个洞穴。
turnin The Forward Push##66470 |goto 54.80,64.38
turnin Prime Planning##66471 |goto 54.80,64.38
accept The Land Awakens##66473 |goto 54.80,64.38
step
kill Primordial Wrath##190579 |q 66473/1 |goto 55.32,65.25
|tip 它看起来像一个大型石元素。
|tip 要攻击他，{o}先击杀他旁边的敌人{}。
|tip 深入地下洞窟。
step
kill Primordial Hail##189039 |q 66473/2 |goto 54.16,65.33
|tip 深入地下洞窟。
step
talk Sharnax##189188
|tip 在道路的顶端，靠近一个洞穴。
turnin The Land Awakens##66473 |goto 54.80,64.38
accept Primal List##66472 |goto 54.80,64.38
step
talk Commander Thadezus##189174
|tip 在桥上
turnin Primal List##66472 |goto 52.66,67.29
step
talk Waywatcher Alvi##191753
turnin The Wayward Waywatcher##71219 |goto 54.68,69.47
accept Supplying in Weight##66100 |goto 54.68,69.47
accept A Sketchy Request##66230 |goto 54.68,69.47
stickystart "Collect_Waywatcher_Supplies"
step
消灭艾默托斯周围的敌人
|tip 他们看起来像爬行动物人。
collect Crude Tarasek Key##191317 |q 66230/1 |goto 55.74,68.44
'|kill Embertooth Pooltender##187445, Embertooth Scavenger##187426
step
click Tarasek Lockbox
|tip 这看起来像一个铁木箱。
collect Alvi's "Ledger"##191405 |q 66230/2 |goto 55.62,69.33
step
label "Collect_Waywatcher_Supplies"
click Waywatcher Supplies##376615+
|tip 他们看起来像棕色的袋子。
collect 6 Waywatcher Supplies##191852 |q 66100/1 |goto 55.74,68.44
step
talk Waywatcher Alvi##187289
turnin Supplying in Weight##66100 |goto 56.95,67.69
turnin A Sketchy Request##66230 |goto 56.95,67.69
accept A Poisonous Palette##66456 |goto 56.95,67.69
accept Ending the Blue Period##66457 |goto 56.95,67.69
stickystart "Collect_Envenomed_Spears"
step
kill Bluescale##188723 |q 66457/1 |goto 55.95,71.51
|tip 小洞穴内。
step
label "Collect_Envenomed_Spears"
kill Embertooth Spearhunter##188725+
|tip 他们看起来像爬行动物人。
collect 8 Envenomed Spear##191308 |q 66456/1 |goto 56.77,69.15
step
talk Waywatcher Alvi##187289
turnin A Poisonous Palette##66456 |goto 56.95,67.69
turnin Ending the Blue Period##66457 |goto 56.95,67.69
accept Cache and Release##66465 |goto 56.95,67.69
accept Art Imitates Life##66467 |goto 56.95,67.69
stickystart "Destroy_Spear_Caches"
step
进入洞穴 |goto 56.91,67.19 < 15 |walk |only if not (subzone("Passage of Time") and _G.IsIndoors())
kill Greater Venomsprout##188814 |q 66467/1 |goto 58.29,67.19
|tip 地下洞穴内
step
label "Destroy_Spear_Caches"
click Poisoned Spear Stash+
|tip 他们看起来像一堆木头棒子。
|tip 穿越洞穴。|不粘性
摧毁 #8# 矛缓存 |q 66465/1 |goto 57.84,66.74
step
离开洞穴 |goto 56.91,67.19 < 15 |walk |only if subzone("Passage of Time") and _G.IsIndoors()
talk Waywatcher Alvi##187289
turnin Cache and Release##66465 |goto 54.64,69.51
turnin Art Imitates Life##66467 |goto 54.64,69.51
step
talk Chromie##187100
告诉她“诺兹多姆派我来帮忙。” |gossip 63842
观察对话
与克罗米交谈 |q 66320/1 |goto 57.46,78.92
step
talk Chromie##187100
turnin The Flow of Time##66320 |goto 57.46,78.92
step
talk Andantenormu##187877
accept Temporal Difficulties##66080 |goto 57.53,78.79
step
talk Azim##193458
fpath Shifting Sands |goto 57.63,79.02
step
寻找失踪的招募者 |q 66080/1 |goto Thaldraszus/0 55.00,75.75
step
talk Siaszerathel##187098
turnin Temporal Difficulties##66080 |goto Thaldraszus/0 55.00,75.75
accept Haven't Got Time For the Pain##70136 |goto Thaldraszus/0 55.00,75.75
step
click Timewalker Notes
collect Timewalker Notes##198408 |q 70136/2 |goto 53.18,77.38
step
kill Crazed Alpha##194224 |q 70136/3 |goto 52.69,76.81
|tip 小洞穴内。
step
click Timewalker Staff
|tip 洞内探险
collect Timewalker Staff##198410 |q 70136/1 |goto 52.71,76.86
step
talk Siaszerathel##187098
turnin Haven't Got Time For the Pain##70136 |goto Thaldraszus/0 55.00,75.75
accept Time is Running Out##66081 |goto Thaldraszus/0 55.00,75.75
accept Time in a Bottle##66082 |goto Thaldraszus/0 55.00,75.75
stickystart "Collect_The_Energy"
step
click Temporal Collector##377081+
|tip 它们看起来像漂浮的蓝色水晶。
|tip 它们将在你的小地图上出现为黄色点。
collect 8 Temporal Collector##192602 |q 66081/1 |goto 55.12,77.65
step
label "Collect_The_Energy"
在这个区域击杀时空充能的敌人
|tip 他们看起来像各种动物。
|tip {o}走进击杀敌人后出现的时间微粒{}
|tip 它们看起来像浮动的黄色光辉晶体。
收集能量 |q 66082/1 |goto 55.77,76.95
'|kill Time-Charged Salamanther##187338, Time-Charged Ohuna##187337, Time-Charged Vorquin##187336, Time-Charged Bear##195635, Time-Charged Hornswog##187324
step
talk Siaszerathel##187098
turnin Time is Running Out##66081 |goto 57.46,78.92
turnin Time in a Bottle##66082 |goto 57.46,78.92
step
观察对话
talk Andantenormu##187877
accept Feels Like the First Time##66083 |goto 57.52,78.79
step
观察对话
talk Andantenormu##190479
|tip 他走到这个地点。
告诉他“我准备好开始了。” |gossip 55340
与安达诺穆对话 |q 66083/1 |goto 57.58,78.38
step
click Temporal Collector
抽取收集者 |q 66083/2 |goto 57.68,78.33
step
click Crystal Focus
增强导管 |q 66083/3 |goto 57.67,78.38
step
_NOTE:_
在此任务中
|tip 如果你的指引观众在这个任务中在重载界面后变得{o}隐藏{}，点击{o}小地图{}按钮让它再次出现。
点击此处继续 |confirm |q 66083
step
click Time-Lost Artifact
观察对话
归还神器 |q 66083/4 |goto 57.64,78.46
step
观察对话
恢复个人时间线 |q 66083/5
step
回归萨尔德拉苏斯 |complete zone("Thaldraszus") |q 66083
step
talk Andantenormu##187877
|tip 他走到这个地点。
turnin Feels Like the First Time##66083 |goto 57.52,78.79
accept Times Like These##66084 |goto 57.52,78.79
step
talk Siaszerathel##187098
accept If We Could Turn Back Time##66085 |goto 57.46,78.92
stickystart "Collect_Temporal_Residue"
step
click Time Rift
封闭第一个裂痕 |q 66085/1 |goto 58.59,78.22
step
talk Siaszerathel##187339
告诉她“展示一下你的实力。” |gossip 56086
观察对话
观察泽拉 |q 66085/2 |goto 59.81,79.31
step
click Time Rift
关闭第二次裂隙 |q 66085/3 |goto 60.01,79.28
step
click Time Rift
关闭第三裂隙 |q 66085/4 |goto 59.97,77.20
step
观察对话
talk Aeonormu##187504
问他“你是时光行者吗？” |gossip 55001
告诉他“泽拉可以引导你找到他们。” |gossip 55190
邂逅陌生人 |q 66085/5 |goto 59.95,77.23
step
label "Collect_Temporal_Residue"
在该区域击杀敌人
collect 100 Temporal Residue##192809 |q 66084/1 |goto 59.11,78.16
'|kill Time-Lost Thunderhide##187258, Time-Lost Raptor##187256, Time-Lost Devilsaur##187262, Time-Lost Murloc##190584, Time-Lost Murhulk##195095
step
talk Siaszerathel##187098
turnin If We Could Turn Back Time##66085 |goto 57.46,78.92
step
talk Andantenormu##187877
turnin Times Like These##66084 |goto 57.53,78.79
step
talk Aeonormu##190929
accept Closing Time##66087 |goto 57.55,78.86
step
在该区域击杀敌人
|tip 在敌人和盟友附近使用{o}时间爆发{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 它将对敌人造成伤害并增强友方。
|tip 你将通过增强盟友获得{o}任务进度{}。
click Various Object+
|tip 它们看起来像是 pedestal 上的各种黄色 orb 物品。
|tip 它们将在你的小地图上出现为黄色点。
click Time Rift+
|tip 它们看起来像黄色旋转的传送门。
守护时间线 |q 66087/1 |goto 57.49,83.13
'|clicknpc Bronze Sentry##187391, Bronze Warder##187397
'|kill Time-Lost Bladewing##187232, Time-Lost Sunseeker##187239, Time-Lost Geomancer##187265, Time-Lost Briarback##187264, Time-Lost Destroyer##187244, Time-Lost Chieftain##187266
step
talk Aeonormu##190929
turnin Closing Time##66087 |goto 57.55,78.86
step
talk Andantenormu##187877
accept Catching Up to Chromie##65935 |goto 57.52,78.79
step
在青铜寺见克隆米 |q 65935/1 |goto 59.58,81.69
|tip 上去平台上。
step
talk Chromie##186711
|tip 上去平台上。
turnin Catching Up to Chromie##65935 |goto 59.58,81.69
accept Time-Locked Timewalkers##65947 |goto 59.58,81.69
accept Cracks in Time##65948 |goto 59.58,81.69
step
talk Andantenormu##186433
accept Quelling Causalities##66646 |goto Thaldraszus/0 59.55,82.70
stickystart "Slay_The_Time_Elementals"
step
解放时光行者 |q 65947/1 |goto 59.01,82.77 |count 1
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Amu'sha Skystrider##189564
step
解放时光行者 |q 65947/1 |goto 58.72,82.43 |count 2
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Suma the Guised##189520
step
解放时光行者 |q 65947/1 |goto 58.38,82.14 |count 3
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Historian Jum'Flitmo##189549
step
解放时光行者 |q 65947/1 |goto 58.13,82.83 |count 4
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Scribe Kalve##189545
step
 yank the West Crystal 的中文翻译为：拔出西部水晶 |q 65948/1
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}远离水晶{}去拉扯它。
click Temporal Crystal Chunk+
|tip 它们看起来像各种大小的蓝色矿石。
|tip 它们出现在你拉取水晶后落地周围的地面上。
收集50个时间能量 |q 65948/3 |goto 58.35,83.09 |count 50
'|clicknpc Bronze Power Crystal##189582
step
解放时光行者 |q 65947/1 |goto 60.31,81.39 |count 5
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Warden Dialash##189558
step
拔掉东水晶 |q 65948/2
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}远离水晶{}去拉扯它。
click Temporal Crystal Chunk+
|tip 它们看起来像各种大小的蓝色矿石。
|tip 它们出现在你拉取水晶后落地周围的地面上。
收集#100#时空能量 |q 65948/3 |goto 60.71,80.55 |count 100
'|clicknpc Bronze Power Crystal##192086
step
解放时光行者 |q 65947/1 |goto 60.86,80.03 |count 6
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Elo'sho Skystrider##189547
step
解放时光行者 |q 65947/1 |goto 60.45,79.74 |count 7
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Wan'she Skystrider##189562
step
解放时光行者 |q 65947/1 |goto 60.27,80.40 |count 8
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Warden Krizzik##189560
step
label "Slay_The_Time_Elementals"
在该区域击杀敌人
击败时间元素 |q 66646/1 |goto 60.51,80.57
你可以在[58.73,82.74]附近找到更多。
'|kill Timeling##186479, Time-Lost Sunseeker##201533, Timeless Causality##186464, Time-Lost Raptor##201534
step
talk Andantenormu##186433
turnin Quelling Causalities##66646 |goto Thaldraszus/0 59.55,82.70
step
talk Chromie##186711
turnin Time-Locked Timewalkers##65947 |goto 59.58,81.69
turnin Cracks in Time##65948 |goto 59.58,81.69
accept The Once and Future Team##65938 |goto 59.58,81.69
step
在神殿门泡泡上使用时光行者法杖 |q 65938/1 |goto 60.60,83.46
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}沿着斜坡冲下{}去拉动气泡。
step
kill Colossal Causality##186672
|tip 看起来像一个大型火元素。
|tip 你的盟友会帮助你战斗。
击杀巨型时间元素体 |q 65938/2 |goto 60.72,83.68
step
talk Chromie##186711
turnin The Once and Future Team##65938 |goto 59.58,81.69
accept The Never-Final Countdown##65962 |goto 59.58,81.69
step
talk Chromie##186711
告诉克罗米你准备好了 |gossip 54696
与克洛米交谈 |q 65962/1 |goto 59.58,81.69
step
talk Warden Dialash##187013
fpath Temporal Conflux |goto 59.91,81.34
step
talk Archivist Areniel##192543
accept An Anomalous Shrine##67093 |goto 60.29,82.03
accept Entropic Remnants##67154 |goto 60.29,82.03
step
talk Nozdormu##186931
turnin The Never-Final Countdown##65962 |goto 60.05,82.45
accept Tumbling Through Time##70040 |goto 60.05,82.45
step
talk Andantenormu##185915
告诉他“诺兹多姆请求你的光临。” |gossip 55814
与安达诺穆对话 |q 70040/2 |goto 60.19,81.76
step
talk Soridormi##192403
告诉她“诺兹多姆请求你的到来。” |gossip 55789
与索瑞多姆对话 |q 70040/1 |goto 59.52,82.52
step
talk Siaszerathel##192404
告诉她“诺兹多姆请求你的到来。” |gossip 55815
与希阿瑟拉瑟交谈 |q 70040/3 |goto 59.30,82.15
step
talk Nozdormu##186931
告诉他“所有人都聚集了。” |gossip 55840
观察对话
与诺兹多姆交谈 |q 70040/4 |goto 60.05,82.45
step
talk Nozdormu##186931
turnin Tumbling Through Time##70040 |goto 60.05,82.45
accept To the Future!##66028 |goto 60.05,82.45
accept Temporal Tuning##66029 |goto 60.05,82.45
step
kill Ancient Timekeeper##192516
|tip 如果另一位玩家刚刚击杀了它，它可能不在这里。
|tip 如果这里没有，{o}请在这个区域周围寻找异常微粒{}。
click Anomalous Mote
|tip 这看起来像一个漂浮的黄色光球。
|tip 它在你击杀古代守时者后出现在地面上。
检查异常微粒 |q 67093/2 |goto 59.41,74.40
step
进入建筑物 |goto 59.42,74.03 < 15 |walk
click Cache of the Timeless One
|tip 在建筑物内。
|tip 不要飞进建筑，走进去，这样你就不会失去增益效果。
|tip 如果你失去增益效果，点击外面的法力水晶，再次走进大楼。
|tip 避开物体、光球和光束，尽量跑动。
|tip 你将在拾取后被传送回外面。
collect Echo of Duty##194687 |q 67093/3 |goto 59.49,71.86
step
在该区域击杀敌人
collect 8 Vitrified Sand##199064 |q 67154/1 |goto 59.08,78.81
'|kill Time-Lost Thunderhide##187258, Shifting Falcon##195324, Time-Lost Devilsaur##187262, Time-Lost Raptor##187256, Time-Lost Murloc##190584, Time-Lost Murhulk##195095
step
talk Archivist Areniel##192543
|tip 上去平台上。
turnin Entropic Remnants##67154 |goto 60.29,82.03
step
click Portal to the Primalist Future
穿越未来的传送门 |q 66028/1 |goto 59.83,82.24
step
进入原始者的未来 |complete zone("Primalist Tomorrow") |q 66028
step
talk Soridormi##183860
turnin To the Future!##66028 |goto Primalist Tomorrow/0 61.07,50.82
accept Resistance Isn't Futile##66030 |goto Primalist Tomorrow/0 61.07,50.82
step
talk Possible Future You##186953
accept Making Time##66031 |goto 61.46,50.19
stickystart "Heal_Injured_Resistance_Fighters"
stickystart "Collect_Elemental_Essences"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 66029/1 |goto 47.10,41.28
step
label "Heal_Injured_Resistance_Fighters"
use the Bandages##192467
|tip 在{o}受伤的抵抗战士{}身上使用它们。
|tip 他们看起来像是躺在地上的盟友。
clicknpc Injured Resistance Fighter##187341+
治疗 #10# 受伤的抵抗战士 |q 66030/1 |goto 51.12,30.48
你可以在以下地点找到更多： |notinsticky
[45.12,18.99]
[44.58,33.95]
step
label "Collect_Elemental_Essences"
在该区域击杀敌人
|tip 使用{o}佐拉伴随能力{}。
|tip {o}西亚瑟瑞斯{}将跟随你并且{o}帮助你战斗{}。
|tip 尽量专注于寻找非精英怪，以便更快完成任务。
collect 30 Elemental Essence##192454 |q 66031/1 |goto 45.91,30.57
'|kill Rimebound Controller##191654, Rimebound Subjugator##195837, Rimebound Subjugator##191658, Cragsworn Stoneshaper##191661, Hoary Icicle##194797, Colossal Glacier##194798, Vicious Rimefang##194120, Restless Icicle##194794, Cragsworn Stoneshaper##195838, Rimebound Controller##195836, Rimebound Subjugator##195837, Cragsworn Stoneshaper##195838, Cragsworn Conqueror##195839
step
talk Possible Future You##186953
|tip 上去平台上。
turnin Making Time##66031 |goto 61.46,50.20
step
talk Soridormi##183860
|tip 上去平台上。
turnin Resistance Isn't Futile##66030 |goto 61.08,50.82
accept Return to the Present##66032 |goto 61.08,50.82
step
click Portal to Temporal Conflux
归返当下 |complete zone("Thaldraszus") |goto 61.01,50.52 |q 66032
step
talk Nozdormu##186931
turnin Temporal Tuning##66029 |goto Thaldraszus/0 60.05,82.45
turnin Return to the Present##66032 |goto Thaldraszus/0 60.05,82.45
accept To the... Past?##66033 |goto Thaldraszus/0 60.05,82.45
accept Temporal Two-ning##72519 |goto Thaldraszus/0 60.05,82.45
step
click Portal to Azmerloth
前往艾斯梅洛斯的传送门 |q 66033/1 |goto 59.98,82.08
step
前往艾泽拉斯莫斯 |complete zone("Azmerloth") |q 66033
step
talk Andantenormu##187344
turnin To the... Past?##66033 |goto Azmerloth/0 59.83,66.14
accept Murloc Motes##66035 |goto Azmerloth/0 59.83,66.14
step
talk Varian Wryngrrlgulgll##183854
accept Mugurlglrlgl!##66036 |goto Azmerloth/0 59.91,65.98
|only if Alliance
stickystart "Kill_Deathling_Destroyers_Alliance"
stickystart "Collect_Temprgrlglr_Motes_Alliance"
stickystart "Kill_Deathlings_Alliance"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 72519/1 |goto 61.59,61.82
|only if Alliance
step
label "Kill_Deathling_Destroyers_Alliance"
kill 5 Deathling Destroyer##190214 |q 66036/2 |goto 60.22,65.02
|tip 它们看起来像大型金属鱼人。
|only if Alliance
step
label "Collect_Temprgrlglr_Motes_Alliance"
收集 #12# 暴风训练者魔石 |q 66035/1 |goto 60.22,65.02
|tip 它们看起来像漂浮的黄色光球。
|tip 走到他们身边收集物品。
|tip 它们将在你的小地图上出现为黄色点。
|only if Alliance
step
label "Kill_Deathlings_Alliance"
kill 25 Deathling##187342 |q 66036/1 |goto 60.22,65.02
|only if Alliance
step
talk Andantenormu##187344
turnin Murloc Motes##66035 |goto 59.83,66.14
|only if Alliance
step
talk Varian Wryngrrlgulgll##183854
turnin Mugurlglrlgl!##66036 |goto 59.91,65.98
accept Deathwingurlugull!##70373 |goto 59.91,65.98
|only if Alliance
step
观察对话
clicknpc Murloc Hopper##195209
进入投放器 |q 70373/1 |goto 59.81,65.70
|only if Alliance
step
kill Deathwingurlugull##195314 |q 70373/2 |goto 59.83,59.04
|tip 看起来像个巨大的鱼人。
|tip 使用你的动作条上的技能。
|only if Alliance
step
归来吧，瓦里安·乌瑞恩 |outvehicle |goto 59.73,65.62 |q 70373
|only if Alliance
step
talk Varian Wryngrrlgulgll##183854
turnin Deathwingurlugull!##70373 |goto 59.91,65.98
|only if Alliance
step
talk Thrallgrulgulgul##183855
accept Mugurlglrlgl!##66704 |goto Azmerloth/0 59.98,65.97
|only if Horde
stickystart "Kill_Deathling_Destroyers_Horde"
stickystart "Collect_Temprgrlglr_Motes_Horde"
stickystart "Kill_Deathlings_Horde"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 72519/1 |goto 61.59,61.82
|only if Horde
step
label "Kill_Deathling_Destroyers_Horde"
kill 5 Deathling Destroyer##190214 |q 66704/2 |goto 60.22,65.02
|tip 它们看起来像大型金属鱼人。
|only if Horde
step
label "Collect_Temprgrlglr_Motes_Horde"
收集 #12# 暴风训练者魔石 |q 66035/1 |goto 60.22,65.02
|tip 它们看起来像漂浮的黄色光球。
|tip 走到他们身边收集物品。
|tip 它们将在你的小地图上出现为黄色点。
|only if Horde
step
label "Kill_Deathlings_Horde"
kill 25 Deathling##187342 |q 66704/1 |goto 60.22,65.02
|only if Horde
step
talk Andantenormu##187344
turnin Murloc Motes##66035 |goto 59.83,66.14
|only if Horde
step
talk Thrallgrulgulgul##183855
turnin Mugurlglrlgl!##66704 |goto 59.98,65.97
accept Deathwingurlugull!##70371 |goto 59.98,65.97
|only if Horde
step
观察对话
clicknpc Murloc Hopper##195209
进入投放器 |q 70371/1 |goto 59.81,65.70
|only if Horde
step
kill Deathwingurlugull##195314 |q 70371/2 |goto 59.83,59.04
|tip 看起来像个巨大的鱼人。
|tip 使用你的动作条上的技能。
|only if Horde
step
重返萨尔戈鲁古古尔 |outvehicle |goto 59.73,65.62 |q 70371
|only if Horde
step
talk Thrallgrulgulgul##183855
turnin Deathwingurlugull!##70371 |goto 59.98,65.97
|only if Horde
step
talk Andantenormu##187344
accept Back to Reality##66037 |goto Azmerloth/0 59.83,66.14
step
click Portal to Temporal Conflux
归返当下 |complete zone("Thaldraszus") |goto 59.72,66.11 |q 66037
step
talk Nozdormu##186931
turnin Back to Reality##66037 |goto Thaldraszus/0 60.05,82.45
turnin Temporal Two-ning##72519 |goto Thaldraszus/0 60.05,82.45
accept On Your Mark... Get Set...##66660 |goto Thaldraszus/0 60.05,82.45
step
click Portal to The Gnoll War
通过时间传送门前往犬人战争 |q 66660/1 |goto 59.92,82.19
step
穿越时空 |complete zone("The Gnoll War") |q 66660
step
talk Andantenormu##187435
turnin On Your Mark... Get Set...##66660 |goto The Gnoll War/0 43.38,69.22
step
_NOTE:_
在下一个任务期间
|tip 下一个任务是一个限时任务。
|tip 你将在多个区域沿着通往黄色旋转传送门的道路行进。
|tip 走入黄色旋转传送门以前往下一个区域。
|tip 当你前往传送门时，{o}走入那白光的柱子{}。
|tip 他们会提升你的速度。
|tip 避开地面的圈圈，它们会减慢你的速度。
点击此处继续 |confirm |q 66038 |future
step
talk Andantenormu##187435
accept Race Through Time!##66038 |goto 43.38,69.22
step
前往沙尘战争 |complete zone("War of the Shifting Sands") |goto 32.38,49.69 |q 66038
step
前往熊猫人革命 |complete zone("Pandaren Revolution") |goto War of the Shifting Sands/0 39.55,76.76 |q 66038
step
穿越时空赛跑 |q 66038/1 |goto Pandaren Revolution/0 15.18,58.51
step
talk Andantenormu##187435
turnin Race Through Time!##66038 |goto The Black Empire/0 52.35,73.75
accept Chromie Time##66039 |goto The Black Empire/0 52.35,73.75
step
沿着道路冲向楼梯 |goto 57.63,59.33 < 20 |only if walking
use the Chrono Crystal##192749
|tip 在{o}克罗米{}附近使用它。
|tip 她看起来像一只巨大的黄色龙在空中翻滚。
修复时间位移 |q 66039/1 |goto 53.87,43.43
'|clicknpc Chromie##186499
step
talk Chromie##186499
|tip 她飞下去，走到这个地点。
turnin Chromie Time##66039 |goto 53.40,43.97
accept Back to the Future##66040 |goto 53.40,43.97
step
talk Chromie##186499
告诉她“让我们开始吧！” |gossip 54816
|tip 如果其他玩家已经开始了这个任务，你可能无法与她对话。
击杀波浪袭来的敌人
|tip 使用{o}时空位移{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 这会对敌人造成伤害并强化你。
保护你的盟友 |q 66040/2 |goto 53.40,43.97
'|kill Winged Ruin##191399, Aqir Harbinger##191400, Grotesque Bulwark##191398
step
归返当下 |complete zone("Thaldraszus") |q 66040
step
talk Chromie##183972
悄悄问克罗米诺兹多姆还好吗 |gossip 55119
与克隆妮确认 |q 66040/3 |goto Thaldraszus/0 60.08,82.41
step
talk Nozdormu##186931
turnin Back to the Future##66040 |goto 60.05,82.45
accept Moving On##66221 |goto 60.05,82.45
step
talk Nozdormu##187669
|tip 在塔顶上。
turnin An Anomalous Shrine##67093 |goto Valdrakken/0 61.47,39.09
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
告诉她“所有的誓石都已经恢复。” |gossip 107528
与艾露恩交谈 |q 66221/1 |goto 58.12,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin Moving On##66221 |goto 58.12,34.87
step
talk Vesri##189339
|tip 在石质平台上，俯瞰水面。
fpath Algeth'era |goto Thaldraszus/0 49.47,41.94
step
talk Officer Obernax##189237
|tip 在石质平台上，俯瞰水面。
fpath Veiled Ossuary |goto 62.07,18.93
step
talk Nirazal##193508
|tip 在一块石质平台上，俯瞰着熔岩。
fpath Vault of the Incarnates |goto 72.14,56.45
step
|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)",{
author="support@zygorguides.com",
},[[
step
所有侦查地图任务完成检测到	|next "All_Scouting_Map_Quests_Complete"
|only if achieved(16363) and completedq(65691) and completedallq(72266,72267,72268,72269)
step
accept The Dragon Isles Await##65436
|tip 你将自动接受这个任务。
|only if Alliance and not (haveq(66589) or completedq(66589))
step
use the Lost Dragonscale##205456
使用失落的龙鳞传送到靠近瓦尔基恩的位置 |q 65436/1
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
在暴风城会见拉希奥 |q 65436/2 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
turnin The Dragon Isles Await##65436 |goto Stormwind City/0 79.80,27.01
accept Aspectral Invitation##66577 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
选择 _"倾听瓦里安与图拉扬的声音。"_
 |gossip 55659
与 wrathion 对话 |q 66577/1 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Wrathion##189569
|tip 在建筑物内。
turnin Aspectral Invitation##66577 |goto Stormwind City/0 79.80,27.01
|only if Alliance and not (haveq(66589) or completedq(66589))
step
talk Scalecommander Azurathel##189603
|tip 在建筑物内。
accept The Obsidian Warders##72240 |goto Stormwind City/0 79.94,26.95
|only if Alliance
step
talk Toddy Whiskers##189602
|tip 在建筑物内。
accept Expeditionary Coordination##66589 |goto Stormwind City/0 79.72,27.33
|only if Alliance
step
talk Dungar Longdrink##352
|tip 在建筑物内。
fpath Stormwind |goto Stormwind City/0 70.94,72.47
|only if Alliance
step
talk Pathfinder Jeb##189763
问他“我们需要勇士组队前往巨龙岛探险。你愿意加入我们吗？” |gossip 55649
招募探险者 |q 66589/2 |goto Stormwind City/0 38.24,45.31
|only if Alliance
step
talk Dervishian##198401
告诉她“规模指挥官阿祖拉塞尔希望你在码头与他会面。” |gossip 107417
将命令交给德尔维西亚 |q 72240/1 |goto Stormwind City/0 39.25,41.40
|only if Alliance
step
talk Thaelin Darkanvil##189767
问他“我们需要工匠加入前往龙岛的探险，你愿意加入吗？” |gossip 55651
招募工匠 |q 66589/1 |goto Stormwind City/0 38.10,35.09
|only if Alliance
step
talk Cataloger Wulferd##189765
问他：“我们需要学者加入前往龙岛的探险。你愿意加入我们吗？” |gossip 55650
招募学者 |q 66589/3 |goto Stormwind City/0 32.89,34.61
|only if Alliance
step
talk Toddy Whiskers##189077
turnin Expeditionary Coordination##66589 |goto Stormwind City/0 22.71,55.66
turnin The Obsidian Warders##72240 |goto Stormwind City/0 22.71,55.66
|only if Alliance
step
观察对话
talk Archmage Khadgar##193450
|tip 他从一个传送门中出现。
accept Whispers on the Winds##66596 |goto 23.01,56.14
|only if Alliance
step
talk Archmage Khadgar##193450
询问卡德加发生了什么 |gossip 55739
与大法师卡德加交谈 |q 66596/1 |goto 23.01,56.14
|only if Alliance
step
talk Wrathion##189569
turnin Whispers on the Winds##66596 |goto 22.94,55.99
|only if Alliance
step
talk Toddy Whiskers##189077
accept To the Dragon Isles!##67700 |goto 22.72,55.67
|only if Alliance
step
在暴风城码头等待坚韧的龙鳞 |q 67700/1 |goto 21.83,56.53
|tip 等待船只到达，然后登船。
|only if Alliance
step
前往龙岛 |complete zone("The Waking Shores") |q 67700
|tip 等待船只启航前往龙岛。
|only if Alliance
step
乘坐粗犷的龙鳞前往龙岛 |q 67700/2 |goto The Waking Shores/0 82.13,31.88
|tip 深入营地。
|only if Alliance
step
观察对话
talk Toddy Whiskers##189022
|tip 她冲向这个地点。
turnin To the Dragon Isles!##67700 |goto 82.13,31.88
accept Explorers in Peril##70122 |goto 82.13,31.88
|only if Alliance
step
talk Scalecommander Azurathel##189035
accept Primal Pests##70123 |goto 82.16,31.85
|only if Alliance
step
talk Thaelin Darkanvil##189021
accept Practice Materials##70124 |goto 82.09,31.88
|only if Alliance
stickystart "Kill_Primal_Proto_Drakes"
stickystart "Collect_Primal_Proto_Whelp_Scales"
step
click Protodragon Rib Cage
拯救科格凯彻教授 |q 70122/1 |goto 83.55,33.60
|only if Alliance
step
clicknpc Archivist Rellid##189055
|tip 他看起来像一个被两只小龙扔来扔去的德莱尼。
拯救档案员雷利德 |q 70122/2 |goto 82.93,36.04
|only if Alliance
step
clicknpc Spelunker Lockeye##189052
拯救洞穴探险者洛克艾 |q 70122/3 |goto 79.50,35.35
|only if Alliance
step
label "Kill_Primal_Proto_Drakes"
kill 10 Primal Proto-Drake##193806 |q 70123/1 |goto 81.66,34.60
|tip 它们看起来像大型巨龙。
|only if Alliance
step
label "Collect_Primal_Proto_Whelp_Scales"
kill Primal Proto-Whelp##193876+
|tip 它们看起来像微小的龙。
collect 15 Primal Proto-Whelp Scale##198398 |q 70124/1 |goto 81.66,34.60
|only if Alliance
step
talk Toddy Whiskers##187251
turnin Explorers in Peril##70122 |goto 76.63,33.63
accept Where is Wrathion?##70125 |goto 76.63,33.63
|only if Alliance
step
talk Sendrax##193362
问她“为什么龙没有来见我们？” |gossip 55636
观察对话
询问失踪的巨龙 |q 70125/1 |goto 76.58,33.67
|only if Alliance
step
talk Sendrax##193362
turnin Where is Wrathion?##70125 |goto 76.58,33.67
|tip 你将只能接受其中一个任务。
accept Adventuring in the Dragon Isles##72293 |goto The Waking Shores/0 76.58,33.67 |or
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67 |or
|only if Alliance
step
talk Cataloger Jakes##198846
turnin Dragon Isles Supplies##72708 |goto 76.54,34.24
accept Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Alliance and (haveq(72708) or completedq(72708))
step
talk Cataloger Jakes##198846
buy Archeologist Artifact Notes##198854 |n
从目录员杰克斯处购买考古学家文物笔记 |q 72709/1 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
use the Archeologist Artifact Notes##198854
阅读考古学遗物笔记 |q 72709/2 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
talk Cataloger Jakes##198846
turnin Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Alliance and (haveq(72709) or completedq(72709))
step
talk Thaelin Darkanvil##189058
turnin Practice Materials##70124 |goto 76.48,34.37
|only if Alliance
step
talk Scalecommander Azurathel##187252
turnin Primal Pests##70123 |goto 76.75,34.41
|only if Alliance
step
talk Tixxa Mixxa##192490
fpath Wingrest Embassy |goto 76.03,35.05
|only if Alliance
step
label "Scouting_Map_Alliance"
click Scouting Map
|tip 这看起来像是桌子上的一张大棕色纸质地图。
|tip 你正在选择你希望做任务的区域。
|tip 随你挑选，{o}无所谓{}。
accept The Waking Shores##72266 |goto 76.52,34.23	|or |only if not completedq(72266)
accept Ohn'ahran Plains##72267 |goto 76.52,34.23	|or |only if not completedq(72267)
accept Azure Span##72268 |goto 76.52,34.23		|or |only if not completedq(72268)
accept Thaldraszus##72269 |goto 76.52,34.23		|or |only if not completedq(72269)
从侦查地图选择一个区域 |q 72293/1 |goto 76.52,34.23 |only if haveq(72293)
|only if Alliance and (haveq(72293) or completedq(72293))
step
_Click the Quest Complete Box:_
|tip 在任务追踪器区域。
turnin Adventuring in the Dragon Isles##72293
|only if Alliance and (haveq(72293) or completedq(72293))
step
_Which Zone Did You Choose?_
|tip 点击下面的链接以选择你想完成任务的区域。
觉醒海岸	|confirm	|next "Waking_Shores_Alliance"
奧納蘭平原	|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\奧納蘭平原 (Story Only)"
碧蓝长廊		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\碧蓝长廊 (Story Only)"
萨尔德拉苏斯		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\萨尔德拉苏斯 (Story Only)"
|only if Alliance and (haveq(72293) or completedq(72293))
step
label "Waking_Shores_Alliance"
talk Sendrax##193362
turnin The Waking Shores##72266 |goto The Waking Shores/0 76.58,33.67 |only if haveq(72266) or completedq(72266)
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67
|only if Alliance
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
告诉他“我是龙鳞远征的新成员。” |gossip 55674
与大使法斯特拉兹交谈 |q 69911/1 |goto 76.33,35.62
|only if Alliance
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
home Wingrest Embassy |goto 76.33,35.62 |q 69911 |future
|only if Alliance
step
click Embassy Visitor Log
|tip 在建筑物内。
选择_开始填写表单_ |gossip 55746
选择_"石头头"_ |gossip 64055
选择 _"<写下今天的日期。>"_ |gossip 55767
选择_"为龙族提供帮助"_ |gossip 55768
签署使者访客日志 |q 69911/2 |goto 76.28,35.61
|only if Alliance
step
click Alexstrasza's Welcome
阅读欢迎信息 |q 69911/3 |goto 75.61,34.14
|only if Alliance
step
accept The Dragon Isles Await##65435
|tip 你将自动接受这个任务。
|only if Horde and not (haveq(65443) or completedq(65443))
step
use the Lost Dragonscale##205458
使用失落的龙鳞传送到接近埃比西安的位置 |q 65435/1
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
在奥格瑞玛与艾比西安会面。 |q 65435/2 |goto Orgrimmar/1 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin The Dragon Isles Await##65435 |goto Orgrimmar/1 44.07,37.96
accept Aspectral Invitation##65437 |goto Orgrimmar/1 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
选择 _"<聆听埃博霍恩。>"_ |gossip 55582
与艾比西安交谈 |q 65437/1 |goto 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Ebyssian##190239
|tip 在城市上方的平台上
turnin Aspectral Invitation##65437 |goto 44.07,37.96
|only if Horde and not (haveq(65443) or completedq(65443))
step
talk Scalecommander Cindrethresh##184786
|tip 在城市上方的平台上
accept The Dark Talons##72256 |goto 44.02,38.25
|only if Horde
step
talk Naleidea Rivergleam##184793
|tip 在城市上方的平台上
accept Expeditionary Coordination##65443 |goto 44.18,37.78
|only if Horde
step
talk Kodethi##198442
告诉他"先锋指挥官辛德雷斯希望您在飞艇塔见面。" |gossip 107450
将命令交给科德希 |q 72256/1 |goto Durotar/0 54.13,9.86
|only if Horde
step
talk Pathfinder Tacha##184796
问她“我们需要探险者去龙岛进行远征。你愿意加入我们吗？” |gossip 53882
招募探险者 |q 65443/2 |goto Durotar/0 54.01,13.04
|only if Horde
step
talk Boss Magor##184787
问他“我们需要工匠加入前往龙岛的探险，你愿意加入吗？” |gossip 53883
招募工匠 |q 65443/1 |goto Durotar/0 55.17,11.63
|only if Horde
step
talk Cataloger Coralie##184795
问她“我们需要学者参加前往巨龙岛的探险。你愿意加入我们吗？” |gossip 54035
招募学者 |q 65443/3 |goto Durotar/0 55.97,13.22
|only if Horde
step
talk Naleidea Rivergleam##197279
|tip 在塔顶上。
turnin Expeditionary Coordination##65443 |goto Durotar/0 55.81,12.66
turnin The Dark Talons##72256 |goto Durotar/0 55.81,12.66
|only if Horde
step
观察对话
talk Archmage Khadgar##193450
|tip 在塔顶上。
|tip 他从一个传送门中出现。
accept Whispers on the Winds##65439 |goto 55.92,12.60
|only if Horde
step
talk Archmage Khadgar##193450
|tip 在塔顶上。
询问卡德加发生了什么 |gossip 55626
与大法师卡德加交谈 |q 65439/1 |goto 55.92,12.60
|only if Horde
step
talk Ebyssian##190239
|tip 在塔顶上。
turnin Whispers on the Winds##65439 |goto 55.84,12.75
|only if Horde
step
talk Naleidea Rivergleam##197279
|tip 在塔顶上。
accept To the Dragon Isles!##65444 |goto 55.81,12.66
|only if Horde
step
在飞艇塔等待反叛者的龙鳞 |q 65444/1 |goto 56.02,13.50
|tip 等待飞艇到达，然后登上飞艇。
|only if Horde
step
前往龙岛 |complete zone("The Waking Shores") |q 65444
|tip 等待飞艇飞往龙岛。
|only if Horde
step
骑上不屈的龙鳞前往龙岛 |q 65444/2 |goto The Waking Shores/0 80.62,27.61
|tip 深入营地。
|only if Horde
step
观察对话
talk Naleidea Rivergleam##184841
|tip 她冲向这个地点。
turnin To the Dragon Isles!##65444 |goto 80.62,27.61
accept Explorers in Peril##65452 |goto 80.62,27.61
|only if Horde
step
talk Scalecommander Cindrethresh##184859
accept Primal Pests##65453 |goto 80.65,27.59
|only if Horde
step
talk Boss Magor##184844
accept Practice Materials##65451 |goto 80.60,27.65
|only if Horde
stickystart "Kill_Primal_Proto_Drakes_Horde"
stickystart "Collect_Primal_Proto_Whelp_Scales_Horde"
step
click Protodragon Rib Cage
救援探路者波比 |q 65452/1 |goto 80.37,26.34
|only if Horde
step
clicknpc Archivist Spearblossom##187157
|tip 他看起来像一个被两条小龙飞着的牛头人。
救援档案管理员芽花 |q 65452/2 |goto 78.79,24.47
|only if Horde
step
clicknpc Spelunker Lazee##187151
拯救探险者拉兹 |q 65452/3 |goto 77.33,29.81
|only if Horde
step
label "Kill_Primal_Proto_Drakes_Horde"
kill 10 Primal Proto-Drake##193806 |q 65453/1 |goto 79.41,26.55
|tip 它们看起来像大型巨龙。
|only if Horde
step
label "Collect_Primal_Proto_Whelp_Scales_Horde"
kill Primal Proto-Whelp##193876+
|tip 它们看起来像微小的龙。
collect 20 Primal Proto-Whelp Scale##198398 |q 65451/1 |goto 79.41,26.55
|only if Horde
step
talk Naleidea Rivergleam##184870
turnin Explorers in Peril##65452 |goto 76.61,33.60
accept Where is Wrathion?##69910 |goto 76.61,33.60
|only if Horde
step
talk Sendrax##193362
问她“为什么龙没有来见我们？” |gossip 55636
观察对话
询问失踪的巨龙 |q 69910/1 |goto 76.58,33.67
|only if Horde
step
talk Sendrax##193362
turnin Where is Wrathion?##70125 |goto 76.58,33.67
|tip 你只能接受其中一个任务。
accept Adventuring in the Dragon Isles##72293 |goto The Waking Shores/0 76.58,33.67 |or
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67 |or
|only if Horde
step
talk Scalecommander Cindrethresh##187235
turnin Primal Pests##65453 |goto 76.28,33.02
|only if Horde
step
talk Boss Magor##187236
turnin Practice Materials##65451 |goto 75.94,33.24
|only if Horde
step
talk Cataloger Jakes##198846
turnin Dragon Isles Supplies##72708 |goto 76.54,34.24
accept Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Horde and (haveq(72708) or completedq(72708))
step
talk Cataloger Jakes##198846
buy Archeologist Artifact Notes##198854 |n
从目录员杰克斯处购买考古学家文物笔记 |q 72709/1 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
use the Archeologist Artifact Notes##198854
阅读考古学遗物笔记 |q 72709/2 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
talk Cataloger Jakes##198846
turnin Funding a Treasure Hunt##72709 |goto 76.54,34.24
|only if Horde and (haveq(72709) or completedq(72709))
step
talk Tixxa Mixxa##192490
fpath Wingrest Embassy |goto 76.03,35.05
|only if Horde
step
click Scouting Map
|tip 这看起来像是桌子上的一张大棕色纸质地图。
|tip 你正在选择你希望做任务的区域。
|tip 随你挑选，{o}无所谓{}。
accept The Waking Shores##72266		|or |goto 76.52,34.23 |only if not completedq(72266)
accept Ohn'ahran Plains##72267		|or |goto 76.52,34.23 |only if not completedq(72267)
accept Azure Span##72268		|or |goto 76.52,34.23 |only if not completedq(72268)
accept Thaldraszus##72269		|or |goto 76.52,34.23 |only if not completedq(72269)
从侦查地图选择一个区域 |q 72293/1 |goto 76.52,34.23 |only if haveq(72293)
|only if Horde and (haveq(72293) or completedq(72293))
step
_Click the Quest Complete Box:_
|tip 在任务追踪器中。
turnin Adventuring in the Dragon Isles##72293
|only if Horde and (haveq(72293) or completedq(72293))
step
_Which Zone Did You Choose?_
|tip 点击下面的链接以选择你想完成任务的区域。
觉醒海岸	|confirm	|next "Waking_Shores_Horde"
奧納蘭平原	|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\奧納蘭平原 (Story Only)"
碧蓝长廊		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\碧蓝长廊 (Story Only)"
萨尔德拉苏斯		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\萨尔德拉苏斯 (Story Only)"
|only if Horde and (haveq(72293) or completedq(72293))
step
label "Waking_Shores_Horde"
talk Sendrax##193362
turnin The Waking Shores##72266 |goto The Waking Shores/0 76.58,33.67 |only if haveq(72266) or completedq(72266)
accept Excuse the Mess##69911 |goto The Waking Shores/0 76.58,33.67
|only if Horde
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
告诉他“我是龙鳞远征的新成员。” |gossip 55674
与大使法斯特拉兹交谈 |q 69911/1 |goto 76.33,35.62
|only if Horde
step
talk Ambassador Fastrasz##193393
|tip 在建筑物内。
home Wingrest Embassy |goto 76.33,35.62 |q 69911 |future
|only if Horde
step
click Embassy Visitor Log
|tip 在建筑物内。
选择_开始填写表单_ |gossip 55746
选择_"石头头"_ |gossip 64055
选择 _"<写下今天的日期。>"_ |gossip 55767
选择_"为龙族提供帮助"_ |gossip 55768
签署使者访客日志 |q 69911/2 |goto 76.28,35.61
|only if Horde
step
click Alexstrasza's Welcome
阅读欢迎信息 |q 69911/3 |goto 75.61,34.14
|only if Horde
step
click Brazier of Kinship
重燃友谊之炉 |q 69911/4 |goto The Waking Shores/0 78.42,31.78
step
talk Sendrax##193362
turnin Excuse the Mess##69911 |goto 76.58,33.67
accept My First Real Emergency!##69912 |goto 76.58,33.67
step
talk Sendrax##193362
告诉她“发射信号烟火，警告巨龙我们的到来。” |gossip 55637
观察对话
发送信号焰火 |q 69912/1 |goto 76.58,33.67
step
观察对话
等待龙族降临 |q 69912/2 |goto 76.26,34.40
step
talk Wrathion##193371
turnin My First Real Emergency!##69912 |goto 76.19,34.50
step
talk Majordomo Selistra##193372
accept The Djaradin Have Awoken##69914 |goto 76.22,34.53
step
talk Majordomo Selistra##193372
问她“我该如何帮助抵御达贾拉丁？” |gossip 55872
观察对话
接受马乔多莫·塞莉斯特拉的命令 |q 69914/1 |goto 76.22,34.53
step
talk Sendrax##193363
turnin The Djaradin Have Awoken##69914 |goto 76.26,34.40
accept Reporting for Duty##65760 |goto 76.26,34.40
step
talk Sendrax##193363
告诉她“引领我去龙心哨站。” |gossip 55900
请问辛德拉克斯带你去前哨站 |q 65760/1 |goto 76.26,34.40
step
观察对话
|tip 跟随{o}Sendrax{}前行。
|tip 她最终走到了这个坐标。
跟随赛德拉克前往前哨站 |q 65760/2 |goto 71.25,40.67
'|clicknpc Sendrax##191807
step
talk Commander Lethanak##186584
turnin Reporting for Duty##65760 |goto 71.20,40.77
accept Invader Djaradin##65989 |goto 71.20,40.77
accept Deliver Whelps From Evil##65990 |goto 71.20,40.77
stickystart "Slay_Djaradin"
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 在建筑后面
拯救呜咽的幼龙 |q 65990/1 |goto 71.36,44.64 |count 1
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 楼上建筑内
拯救呜咽的幼龙 |q 65990/1 |goto 70.97,46.63 |count 2
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
拯救呜咽的幼龙 |q 65990/1 |goto 69.86,45.30 |count 3
step
clicknpc Whimpering Whelpling##194231
|tip 看起来像一只微型红龙。
|tip 它在这个区域的空中飞翔。
拯救呜咽的幼龙 |q 65990/1 |goto 69.35,43.36 |count 4
step
label "Slay_Djaradin"
击杀这个区域周围的Qalashi敌人
击杀 #6# 达贾拉丁 |q 65989/1 |goto 70.37,44.87
'|kill Qalashi Scavenger##191833, Qalashi Djaradin##188296
step
talk Commander Lethanak##186584
turnin Invader Djaradin##65989 |goto 71.20,40.78
turnin Deliver Whelps From Evil##65990 |goto 71.20,40.78
accept Time for a Reckoning##65991 |goto 71.20,40.78
step
在破碎山堡与拉瑟隆会面 |q 65991/1 |goto 66.49,34.42
|tip 在建筑物顶部
step
talk Wrathion##186640
|tip 他飞下并降落在建筑物顶部。
turnin Time for a Reckoning##65991 |goto 66.36,35.00
accept Killjoy##65993 |goto 66.36,35.00
accept Blacktalon Intel##65992 |goto 66.36,35.00
step
talk Right##190564
问她 "你对达尔达尼有什么观察？" |gossip 55298
咨询权杖 |q 65992/3 |goto 65.10,29.35
step
kill Meatgrinder Sotok##186777 |q 65993/1 |goto 62.94,29.43
collect Qalashi Plans##193874 |n
accept The Obsidian Citadel##65995 |goto 62.94,29.43
step
talk Left##190563
问她 "你对达尔达尼有什么观察？" |gossip 55296
咨询左侧 |q 65992/2 |goto 63.43,28.87
step
talk Talonstalker Kavia##188299
问她 "你对达尔达尼有什么观察？" |gossip 55335
咨询爪斗者卡维亚 |q 65992/1 |goto 63.04,33.34
step
talk Wrathion##194772
|tip 在建筑物顶部
turnin Killjoy##65993 |goto 62.64,33.17
turnin Blacktalon Intel##65992 |goto 62.64,33.17
turnin The Obsidian Citadel##65995 |goto 62.64,33.17
step
talk Majordomo Selistra##186767
|tip 在建筑物顶部
accept Veteran Reinforcements##65996 |goto 62.75,33.10
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 60.98,35.63 |count 1
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 61.10,36.77 |count 2
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 59.04,34.84 |count 3
step
clicknpc Injured Ruby Culler##190771
治疗受伤的龙人 |q 65996/1 |goto 56.64,34.77 |count 4
step
在温室前哨与森卓克斯会面 |q 65996/2 |goto 54.99,30.77
step
talk Caretaker Azkra##190155
turnin Veteran Reinforcements##65996 |goto 54.99,30.77
accept Chasing Sendrax##65997 |goto 54.99,30.77
step
talk Sendrax##187406
|tip 雕像背后
问她“这里发生了什么？” |gossip 55225
寻找塞德拉克 |q 65997/1 |goto 55.18,24.96
step
talk Sendrax##187406
turnin Chasing Sendrax##65997 |goto 55.18,24.95
accept Future of the Flights##65998 |goto 55.18,24.95
accept Red in Tooth and Claw##65999 |goto 55.18,24.95
step
click On the Origin of Draconic Species
accept Library of Alexstrasza##66000 |goto 55.26,24.69
stickystart "Slay_Primalist_Forces"
step
click Dracuixote
|tip 看起来像是书架上的一本魔法书。
|tip 在建筑物内。
拯救法术书 |q 66000/1 |goto 53.47,22.00 |count 1
step
click The Scales of Wrath
|tip 看起来像是书架上的一本{o}打开的书{}。
|tip 在建筑物内。
拯救法术书 |q 66000/1 |goto 53.36,22.39 |count 2
step
寻找注能龙蛋 |q 65998/1 |goto 55.18,22.72
|tip 在{o}红宝石龙蛋{}旁边跑。
|tip 它们看起来像一群大型、红色、尖刺的蛋。
|tip 蛋将{o}破裂{}，三个敌人将{o}攻击你{}。
stickystart "Kill_Infused_Ruby_Whelplings"
step
click Pride and Protodrakes
|tip 它看起来像是火堆旁的一本魔法书。
|tip 建筑内部，一楼。
拯救法术书 |q 66000/1 |goto 54.63,20.36 |count 3
step
click The Lord of the Wings
|tip 看起来像一本放在地上的开放之书。
|tip 在建筑内部，顶层。
拯救法术书 |q 66000/1 |goto 54.60,20.62 |count 4
step
label "Kill_Infused_Ruby_Whelplings"
kill 9 Infused Ruby Whelpling##186822 |q 65998/2 |goto 56.38,23.31
|tip 在{o}红宝石龙蛋{}旁边跑。
|tip 它们看起来像一群大型、红色、尖刺的蛋。
|tip 蛋将{o}破裂{}，三个敌人将{o}攻击你{}。
step
label "Slay_Primalist_Forces"
在该区域击杀敌人
击败15个原始者势力 |q 65999/1 |goto 56.38,23.31
'|kill Primal Revenant##195917, Molten Primalist##186825, Swelling Fire Elemental##188667, Lavacaller Primalist##186823, Unleashed Lavaburst##188666, Primal Tarasek##188372, Tarasek Elementalist##190080, Firava the Rekindler##195915
step
_Next to you:_
talk Sendrax
turnin Future of the Flights##65998
turnin Red in Tooth and Claw##65999
turnin Library of Alexstrasza##66000
accept A Last Hope##66001
step
talk Sendrax##190269
告诉她“我已准备好。” |gossip 55259
在仪式地点与塞德拉克会面 |q 66001/1 |goto 56.24,22.07
step
观察对话
click Infused Dragon Egg
|tip 当{o}Sendrax{}告诉你时，点击它。
拾取注能龙蛋 |q 66001/2 |goto 56.92,21.61
step
_NOTE:_
在下一步中
|tip 你将携带{o}注入的龙蛋{}。
|tip 只是跑，不要停下与敌人或其他事情战斗。
|tip 如果你做任何事情，比如打怪、吃东西、喝水或使用药水等，你将会把蛋掉在地上。
|tip 确保如果做任何会让你掉落蛋的事情，记得到处捡回蛋。
点击此处继续 |confirm |q 66001
step
护蛋归巢 |q 66001/3 |goto 54.99,30.77
|tip 你正在携带 {o}注能的龙蛋{}。
|tip 只是跑，不要停下与敌人或其他事情战斗。
|tip 如果你做任何事情，比如打怪、吃东西、喝水或使用药水等，你将会把蛋掉在地上。
|tip 确保如果做任何会让你掉落蛋的事情，记得到处捡回蛋。
step
talk Majordomo Selistra##186795
turnin A Last Hope##66001 |goto 55.09,31.01
accept For the Benefit of the Queen##66114 |goto 55.09,31.01
step
talk Majordomo Selistra##186795
告诉她"请带我去见女王。" |gossip 54941
开始与大领主塞莉斯特飞行 |havebuff Majordomo's Wild Ride##376478 |goto 55.09,31.01 |q 66114
step
观察对话
与大法师塞莉丝特拉一同乘坐前往红宝石生命圣坛 |q 66114/1 |goto 62.26,72.88 |notravel
step
talk Alexstrasza the Life-Binder##187290
将被救的蛋献给女王阿莱克丝塔萨。 |gossip 107094
展示女王艾瑞达斯之注满的蛋 |q 66114/2 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##187290
turnin For the Benefit of the Queen##66114 |goto 62.34,73.02
accept The Mandate of the Red##66115 |goto 62.34,73.02
accept Dragonriding##68795 |goto 62.34,73.02
step
talk Xius##189261
问他“你在这里干什么？” |gossip 55288
与希乌斯对话 |q 66115/1 |goto 60.70,74.05
step
talk Akxall##189262
问她“这里为什么有这么少的鸡蛋？” |gossip 55289
与阿克萨尔交谈 |q 66115/2 |goto 59.38,72.42
step
talk Mother Elion##185904
问她“如果你没有蛋可以孵化，为什么还留在这里？” |gossip 55258
与母亲艾利昂交谈 |q 66115/3 |goto 61.60,68.70
step
talk Zahkrana##189260
问他“你如何照顾这些蛋？” |gossip 55290
与扎克拉纳交谈 |q 66115/4 |goto 62.77,70.43
step
talk Zahkrana##189260
turnin The Mandate of the Red##66115 |goto 62.77,70.43
step
talk Amella##194174
accept Training Wings##70061 |goto 62.18,70.56
step
clicknpc Ruby Whelpling##193979
|tip 看起来像一只微型的红色幼龙。
选择红宝石幼龙 |q 70061/1 |goto 61.09,71.46
step
开始控制红宝石幼龙 |invehicle |q 70061
stickystart "Kill_Intrusive_Pupstingers"
stickystart "Kill_Agitated_Weedlings"
step
kill Relentless Gust##194159 |q 70061/4 |goto 61.45,71.87
|tip 它们看起来像龙卷风元素。
|tip 在墙上的大型石质平台上。
|tip 使用你的动作条上的技能。
|tip 要瞄准你的技能，面对你想要攻击的小龙。
step
label "Kill_Intrusive_Pupstingers"
kill 6 Intrusive Pupstinger##194142 |q 70061/3 |goto 61.45,71.87
|tip 它们看起来像这个区域周围的飞行虫子。
|tip 使用你的快捷栏上的技能。|不固定
|tip 将你的技能瞄准，面对你想要目标的幼龙。 |不固定
step
label "Kill_Agitated_Weedlings"
kill 12 Agitated Weedling##193994 |q 70061/2 |goto 61.45,71.87
|tip 它们看起来像紫色和绿色的牙齿植物。
|tip 沿着墙上的小平台。
|tip 使用你的快捷栏上的技能。|不固定
|tip 将你的技能瞄准，面对你想要目标的幼龙。 |不固定
step
释放红色幼龙 |outvehicle |q 70061
|tip 你将自动飞回石头平台。
step
talk Vaknai##192491
|tip 在大平台上，俯瞰谷地。
fpath Ruby Life Pools |goto 57.80,68.11
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
告诉他“告诉我关于龙骑的事。” |gossip 55643
与安德罗斯爵士交谈，关于龙骑术。 |q 68795/1 |goto 58.37,67.13
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
|tip 他最终走到了这个点。
turnin Dragonriding##68795 |goto 57.66,66.89
accept How to Glide with Your Dragon##65118 |goto 57.66,66.89
step
use the Renewed Proto-Drake##194034
|tip 这将教会你你的第一个龙骑坐骑。
learnmount Renewed Proto-Drake##368896 |q 65118
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65118
step
穿越第五个环圈 |q 65118/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65118/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How to Glide with Your Dragon##65118 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 65120 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept How To Dive with Your Dragon##65120 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65120
step
穿越第五个环圈 |q 65120/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65120/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How To Dive with Your Dragon##65120 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 65133 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept How to Use Momentum with Your Dragon##65133 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 65133
step
穿越第五个环圈 |q 65133/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 65133/3 |goto 57.42,59.12
|tip 在巨型红色岩石柱顶上。
step
talk Celormu##183141
|tip 在巨型红色岩石柱顶上。
turnin How to Use Momentum with Your Dragon##65133 |goto 57.48,59.10
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 68796 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept The Need For Higher Velocities##77345 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
点击此处继续 |confirm |q 77345
step
穿越第8个法环 |q 77345/2 |goto 57.69,66.71
|tip 在附近的空中寻找一串巨大的发光符文环，朝北方。
|tip 戒指落下到下方的山谷，通向一根巨大的红色岩石柱。
|tip 你将使用你的龙骑坐骑在每个圆环间滑翔，朝着那座巨大的红色岩石柱飞去。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
|tip 如果你失败了，使用{o}青铜时间工具{}任务物品进行重试。
step
目标区域着陆 |q 77345/3 |goto The Waking Shores/0 57.32,59.13
step
talk Celormu##183141
|tip 在巨大平台上。
turnin The Need For Higher Velocities##77345 |goto 57.47,59.11
step
重返红宝石生命神殿 |complete subzone("Ruby Lifeshrine") |q 68796 |future
|tip 你将自动飞行。
step
talk Lord Andestrasz##193287
|tip 在大平台上，俯瞰谷地。
accept The Skytop Observatory##68796 |goto 57.66,66.89
step
_NOTE:_
在下一步中
|tip 你将与 {o}塞洛穆{} 交谈以 {o}开始一场骑龙比赛{}。
|tip 与他交谈后，他将开始倒计时，准备比赛。
|tip 在附近的东北方向寻找一串大型发光符文环。
|tip 你将使用你的龙骑坐骑在每个环中滑翔。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
点击此处继续 |confirm |q 68796
step
观察对话
talk Celormu##198040
|tip 他最终走到了这个点。
|tip 在大平台上，俯瞰谷地。
告诉他我想试试通往天空顶瞭望台的路线。 |gossip 107284
与塞洛穆交谈以开始比赛 |q 68796/1 |goto 57.73,66.72
step
争夺天空顶观星台 |q 68796/2 |goto 57.76,66.75 |notravel
|tip 在附近的东北方向寻找一串大型发光符文环。
|tip 你将使用你的龙骑坐骑在每个环中滑翔。
|tip 按照屏幕上的指示和虚线前往每个圆环。
|tip 使用技能栏上的技能来提升你的飞行速度和高度，如果需要的话。
step
talk Lord Andestrasz##193359
|tip 在山顶上
turnin The Skytop Observatory##68796 |goto 75.18,54.97
accept Skyriding Talents and You##68798 |goto The Waking Shores/0 75.18,54.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
与莉瑟拉戈萨交谈 |q 68798/1 |goto 74.57,56.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
告诉她“我准备好了。[开启龙骑技能追踪.]” |gossip 55584
查看与Lithragosa的龙骑技能追踪 |q 68798/2 |goto 74.57,56.97
step
talk Lithragosa##193364
|tip 在崩塌建筑的入口处
与利萨格萨学习“飞天技能” |q 68798/3 |goto 74.57,56.97
step
talk Celormu##193411
与塞洛穆交谈 |q 68798/4 |goto 73.25,52.06
step
talk Azerastrasz##193477
|tip 打开飞行地图。
fpath Skytop Observatory |goto 72.77,51.90
step
talk Lord Andestrasz##193359
turnin Skyriding Talents and You##68798 |goto 75.18,54.97
accept Return to the Ruby Lifeshrine##68799 |goto 75.18,54.97
step
clicknpc Relastrasza##199684
骑乘瑞拉斯塔萨前往天空发射塔 |q 68799/1 |goto 75.02,55.58
step
talk Majordomo Selistra##191768
turnin Training Wings##70061 |goto 62.32,72.90
step
talk Alexstrasza the Life-Binder##187290
|tip 在红宝石生命圣坛的顶端。
turnin Return to the Ruby Lifeshrine##68799 |goto 62.34,73.02
accept Who Brought the Ruckus?##66931 |goto 62.34,73.02
step
发现骚动 |q 66931/1 |goto 59.44,72.83
step
talk Majordomo Selistra##190293
turnin Who Brought the Ruckus?##66931 |goto 59.51,72.63
accept The Primary Threat##66116 |goto 59.51,72.63
step
向指挥官雷萨纳克报告 |q 66116/2 |goto 59.41,75.88
|tip 在冰冷的土地上。
step
talk Commander Lethanak##187119
turnin The Primary Threat##66116 |goto 59.41,75.88
accept Basalt Assault##66118 |goto 59.41,75.88
step
kill 4 Enraged Cliff##187090 |q 66118/1 |goto 60.28,78.54
|tip 他们看起来像大型石元素。
你可以在[57.76,76.66]附近找到更多。
step
talk Commander Lethanak##187119
turnin Basalt Assault##66118 |goto 59.41,75.87
accept Proto-Fight##66122 |goto 59.41,75.87
step
talk Majordomo Selistra##187129
accept Egg Evac##66121 |goto 59.48,76.14
stickystart "Slay_Proto_Dragons"
step
click Bronze Egg
救援青铜之蛋 |q 66121/1 |goto 56.14,81.30
step
click Ruby Egg
拯救红宝石蛋 |q 66121/4 |goto 54.99,80.95
step
click Emerald Egg
拯救翡翠之蛋 |q 66121/3 |goto 55.32,83.30
step
click Azure Egg
拯救蓝色蛋 |q 66121/2 |goto 57.35,83.28
step
label "Slay_Proto_Dragons"
use the Ruby Spear##192436
|tip 对{o}原型龙{}使用它。
|tip 它们看起来像地面和空中飞翔的巨龙。
|tip 他们是精英，但用长矛对付他们会让他们更容易被击杀。
击杀#3#原始龙 |q 66122/2 |goto 55.59,81.86
'|clicknpc Rumbling Proto-Dragon##187212, Galestrike Proto-Dragon##187211
step
talk Majordomo Selistra##191895
turnin Proto-Fight##66122 |goto 53.68,80.17
turnin Egg Evac##66121 |goto 53.68,80.17
accept Cut Off the Head##66123 |goto 53.68,80.17
step
use Ruby Spear##192436
|tip 对{o}贾兹基特{}使用它。
|tip 他看起来像一只巨大的蓝色冰晶龙。
|tip 他是精英，但用长矛对付他让他更容易被击杀。
kill Jadzigeth##188447 |q 66123/1 |goto 53.68,82.95
step
talk Majordomo Selistra##191895
turnin Cut Off the Head##66123 |goto 53.68,80.17
accept Exeunt, Triumphant##66124 |goto 53.68,80.17
step
观察对话
talk Majordomo Selistra##187278
|tip 他飞往这个地点。
和大总管汇报。 |gossip 107159
去野生孵化场与大管家塞利斯特交谈 |q 66124/1 |goto 46.14,78.53
step
talk Majordomo Selistra##187278
turnin Exeunt, Triumphant##66124 |goto 46.14,78.53
step
talk Alexstrasza the Life-Binder##187115
accept Wrathion Awaits##66079 |goto 46.09,78.29
step
talk Art Raskins##192843
fpath Dragonscale Basecamp |goto 47.91,83.32
step
talk Tallevia Mistsong##192484
fpath Life Vault Ruins |goto 65.03,57.36
step
talk Pana##192472
fpath Uktulut Pier |goto 45.84,27.47
step
观察对话
talk Wrathion##186274
turnin Wrathion Awaits##66079 |goto 42.47,66.84
step
talk Scalecommander Emberthal##192795
accept Lessons from Our Past##72241 |goto 42.47,66.78
step
talk Scalecommander Emberthal##192795
告诉她“告诉我龙人族的起源。” |gossip 107399
与火鳞指挥官埃本萨尔交谈，了解过去的事件 |q 72241/1 |goto 42.47,66.78
step
talk Scalecommander Emberthal##192795
turnin Lessons from Our Past##72241 |goto 42.47,66.78
accept Best Plans and Intentions##66048 |goto 42.47,66.78
step
talk Wrathion##186274
accept Sharp Practice##66078 |goto 42.47,66.84
stickystart "Test_Blacktalon"
step
talk Do-Yeon Shadowrider##188444
fpath Obsidian Bulwark |goto 42.26,66.25
step
talk Fao the Relentless##186331
问他“我们可以回顾一下战斗计划吗？” |gossip 55311
与不屈的法奥交谈后请点击这里 |confirm |goto 42.41,66.18 |q 66048
step
click Blacktalon Battle Plans##377111
|tip 他们看起来像桌子上的棕色卷轴。
|tip 帐篷内。
咨询无情的法奥 |q 66048/1 |goto 42.40,66.06
step
talk Forgemaster Bazentus##186493
|tip 他在这个区域游荡。
告诉他 "告诉我关于城堡中的武器。" |gossip 55309
告诉他谢谢他的情报。 |gossip 55310
咨询铸造大师巴赞图斯 |q 66048/4 |goto 42.83,66.85
step
talk Archivist Edress##187466
问她 "你的研究发现了什么？" |gossip 55307
观察对话
咨询档案管理员埃德瑞斯 |q 66048/2 |goto 43.76,67.28
step
talk Talonstalker Kavia##189507
|tip 悬崖边缘，俯瞰谷底。
问她“你观察到了什么？” |gossip 54996
与塔伦斯托克·卡维亚交谈后请点击这里 |confirm |goto 42.30,69.29 |q 66048
step
click Scouting Scope##376824
咨询爪斗者卡维亚 |q 66048/3 |goto 42.22,69.32
step
label "Test_Blacktalon"
talk Blacktalon NPC+
告诉他们“我来这里是为了测试你们的战斗技能。” |gossip 54628
|tip 他们会对你发起攻势。
|tip 击败他们以对他们进行考验。
测试 #8# 黑爪 |q 66078/1 |goto 42.56,67.92
'|talk Blacktalon Assassin##187189, Blacktalon Avenger##187187
step
talk Wrathion##186274
turnin Best Plans and Intentions##66048 |goto 42.47,66.84
turnin Sharp Practice##66078 |goto 42.47,66.84
step
观察对话
talk Wrathion##186274
accept Talon Strike##65956 |goto 42.47,66.84
accept No Time For Heroes##65957 |goto 42.47,66.84
step
_NOTE:_
在下一步中
|tip 使用黑爪标记技能对敌人。
|tip 它在屏幕上显示为一个按钮。
|tip 它将{o}击晕敌人{}并{o}召唤盟友{}来帮助你战斗。
点击此处继续 |confirm |q 65957
stickystart "Disrupt_The_Djaradin_Defenses"
step
kill Piercer Gigra##186511 |q 65957/1 |goto 35.47,68.52
|tip 在建筑物顶部
step
kill Olphis the Molten##181875 |q 65957/3 |goto 34.81,66.87
|tip 他看起来像一头大型黑色和橙色的猛犸象。
step
kill Modak Flamespit##186509 |q 65957/2 |goto 35.69,60.74
|tip 在建筑物顶部
step
label "Disrupt_The_Djaradin_Defenses"
在该区域击杀敌人
click Siege Arbalest+
|tip 它们看起来像大型弩炮。
click Djaradin Banner+
|tip 它们看起来像是标杆，上面顶着龙头骨，悬挂着红色的旗帜。
kill Molten Extracts##186716+
|tip 它们看起来像各种大型棕色陶罐。
破坏达贾拉丁的防御 |q 65956/1 |goto 36.47,67.85
'|kill Qalashi Boltthrower##189557, Qalashi Ironskin##191524, Qalashi Boltthrower##189557, Qalashi Necksnapper##186109, Qalashi Steelcrafter##186483, Qalashi Crustshaper##186638, Qalashi Boltthrower##189557, Qalashi Skullhauler##186239
step
talk Wrathion##186681
turnin Talon Strike##65956 |goto 33.99,61.29
turnin No Time For Heroes##65957 |goto 33.99,61.29
accept The Courage of One's Convictions##65939 |goto 33.99,61.29
step
talk Wrathion##186681
告诉他“我准备好开始攻城了。” |gossip 55405
与愤怒之龙交谈以开始攻击 |q 65939/1 |goto 33.99,61.29
step
抵达黑曜石城堡 |complete subzone("Obsidian Citadel") |goto 33.13,61.95 |q 65939
|tip 在桥上
step
进入黑曜石城堡 |q 65939/2 |goto 30.47,60.84
stickystart "Slay_Qalashi_Forces"
step
talk Wrathion##186933
|tip 他飞往这个地点。
accept Taking the Walls##66044 |goto 29.15,58.83
step
talk Wrathion##186933
告诉他“我准备好协助你了。” |gossip 54627
协助瓦拉斯顿 |q 66044/1 |goto 29.15,58.83
step
与拉瑟莱克一起翱翔 |invehicle |goto 29.15,58.83 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 27.15,58.09 |q 66044 |notravel
|tip 他会把你丢到墙顶上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
|tip 在墙顶上
摧毁南方 siege 弩炮 |q 66044/2 |goto 26.83,59.94
step
talk Wrathion##186935
|tip 在墙顶上
在墙上与拉瑟恩会面 |invehicle |goto 26.77,61.20 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 29.63,62.37 |q 66044 |notravel
|tip 他会把你丢到墙顶上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
|tip 在墙顶上
摧毁东部 siege arbalast |q 66044/3 |goto 29.51,61.00
step
talk Wrathion##186935
|tip 在墙顶上
在墙上与拉瑟恩会面 |invehicle |goto 29.05,61.82 |q 66044
step
与拉索里奥一起飞翔 |outvehicle |goto 27.72,55.55 |q 66044 |notravel
|tip 他会把你放在平台上。
step
click Siege Arbalist
|tip 看起来像一台大型弩炮机。
摧毁北方 siege 弩车 |q 66044/4 |goto 27.76,56.54
step
kill Champion Choruk##186592 |q 66044/5 |goto 26.92,57.14
|tip 他在这个区域四处游荡，骑着一头黑黄相间的猛犸象。
step
label "Slay_Qalashi_Forces"
在该区域击杀敌人
|tip 你可以在黑曜石城塞区域的各个地方找到他们。 |不固定
消灭12个卡拉希势力 |q 65939/3 |goto 26.59,57.97
'|kill Qalashi Necksnapper##186892, Qalashi Gatecrasher##186915, Djaradin Flametamer##195187, Qalashi Crustshaper##191597, Qalashi Flamelobber##189768, Qalashi Skullhauler##190116, Qalashi Boltthrower##190079, Qalashi Boltthrower##189734
step
talk Wrathion##196265
turnin The Courage of One's Convictions##65939 |goto 26.43,58.77
turnin Taking the Walls##66044 |goto 26.43,58.77
accept Obsidian Oathstone##66049 |goto 26.43,58.77
step
talk Wrathion##187045
问他“这是誓石吗？” |gossip 55423
在誓石与瓦尔莎谈话 |q 66049/1 |goto 27.30,62.58
step
click Obsidian Oathstone##376917
|tip 这看起来像一座巨大的石碑。
审视誓石 |q 66049/2 |goto 27.62,63.33
step
观察对话
talk Wrathion##187045
turnin Obsidian Oathstone##66049 |goto 27.30,62.58
step
talk Forgemaster Bazentus##186493
accept A Shattered Past##66055 |goto 27.25,62.79
stickystart "Collect_Oathstone_Fragments"
step
进入城堡地下的宝藏 |q 66055/1 |goto 27.11,60.82
|tip 进入建筑物，沿着楼梯下去。
step
label "Collect_Oathstone_Fragments"
click Oathstone Fragment+
|tip 它们看起来像大型石碑的碎片。
|tip 建筑内部的地下室
|tip 它们将在你的小地图上出现为黄色点。
collect 12 Oathstone Fragment##191131 |q 66055/2 |goto 24.74,58.26
step
爬楼梯逃出大楼 |goto 27.16,60.87 < 15 |walk |only if subzone("Obsidian Citadel") and _G.IsIndoors()
talk Forgemaster Bazentus##186493
turnin A Shattered Past##66055 |goto 27.25,62.80
accept Forging A New Future##66056 |goto 27.25,62.80
step
click Earth-Warder's Forge##377013
激活大地守护者的熔炉 |q 66056/1 |goto 24.63,60.88
step
kill Animated Cindershards##189875+
|tip 他们看起来像岩石元素体。
click Cindershard Coal##377012+
|tip 它们看起来像是堆积的灰色石头。
|tip 点击敌人时可能会刷新一个敌人。
collect 6 Cindershard Coal##192548 |q 66056/2 |goto 24.90,60.88
step
talk Forgemaster Bazentus##186493
turnin Forging A New Future##66056 |goto 24.68,61.12
accept The Spark##66354 |goto 24.68,61.12
step
click Oathstone Fragments##378433+
将碎片放置在锻造台上 |q 66354/1 |goto 24.56,60.90
step
观察对话
修复碎片 |q 66354/2 |goto 24.56,60.90
step
click Reformed Oathstone Fragments##377026
收集重铸碎片 |q 66354/3 |goto 24.56,60.90
step
talk Forgemaster Bazentus##186493
turnin The Spark##66354 |goto 24.68,61.12
accept Restoring the Faith##66057 |goto 24.68,61.12
step
talk Wrathion##187045
告诉他“你现在可以修复黑曜石誓言石。” |gossip 56143
与 wrathion 对话 |q 66057/1 |goto 27.30,62.58
step
观察对话
clicknpc Wrathion##191669
与拉瑟琳一同前往王座 |q 66057/2 |goto 27.09,62.21
step
与拉瑟莱克一起翱翔 |invehicle |goto 27.09,62.21 |q 66057
step
与拉索里奥一起飞翔 |outvehicle |goto 25.45,56.74 |q 66057 |notravel
|tip 他会带你去上层平台。
step
接近拉瑟恩和萨贝琉斯 |q 66057/3 |goto 25.09,56.45
|tip 在上层平台。
step
talk Wrathion##187495
turnin Restoring the Faith##66057 |goto 24.44,55.50
accept Claimant to the Throne##66780 |goto 24.44,55.50
step
talk Sabellian##185894
accept Heir Apparent##66779 |goto 24.25,55.87
step
talk Forgemaster Bazentus##193464
问他“你能告诉我关于萨贝利安的事情吗？” |gossip 55566
与巴泽图斯交谈 |q 66779/2 |goto 24.38,57.83
step
talk Baskilan##188158
问他“你能告诉我关于萨贝利安的事情吗？” |gossip 55358
与巴斯基利安交谈 |q 66779/1 |goto 24.31,58.90
step
talk Foehn Breezeskimmer##188336
fpath Obsidian Throne |goto 25.27,56.83
step
talk Archivist Edress##193456
问她“你能告诉我关于萨贝里安的事情吗？” |gossip 55564
与档案员埃德雷斯交谈 |q 66779/3 |goto 25.11,56.24
step
talk Archivist Edress##193456
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55565
与档案员埃德雷斯交谈 |q 66780/3 |goto 25.11,56.24
step
talk Left##191710
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55355
与左侧和右侧对话 |q 66780/2 |goto 25.01,55.19
step
talk Talonstalker Kavia##191600
|tip 她在这个区域巡视。
问她“你能告诉我关于瓦尔莎的什么？” |gossip 55354
与爪行者卡维亚交谈 |q 66780/1 |goto 26.35,54.45
step
talk Wrathion##187495
turnin Claimant to the Throne##66780 |goto 24.43,55.49
step
talk Sabellian##185894
turnin Heir Apparent##66779 |goto 24.24,55.88
accept Black Wagon Flight##65793 |goto 24.24,55.88
step
talk Hjorik##192493
|tip 在山顶上
fpath Apex Observatory |goto 23.79,83.14
step
talk Nulia##192494
|tip 在沙滩上，靠近水边。
fpath Uktulut Outpost |goto 17.51,88.70
step
talk Sabellian##190937
告诉他“动起来吧。” |gossip 55381
与萨贝利安对话以开始移动蛋。 |q 65793/2 |goto 43.83,66.43
step
观察对话
|tip 跟随战车并保护它。
|tip 他们最终前往这个地点。
护送马车 |q 65793/3 |goto 52.26,66.82 |notravel
'|clicknpc Sabellian##191640
step
talk Sabellian##190740
|tip 上去平台上。
turnin Black Wagon Flight##65793 |goto 57.96,67.31
accept The Last Eggtender##66785 |goto 57.96,67.31
step
talk Mother Elion##185904
turnin The Last Eggtender##66785 |goto 61.60,68.71
accept Egg-cited for the Future##66788 |goto 61.60,68.71
stickystart "Sweep_Fallen_Leaves"
stickystart "Pull_Overgrown_Weeds"
step
clicknpc Ruby Shrineguard##191126
打磨红宝石神龛守卫 |q 66788/3 |goto 61.44,69.02
step
label "Sweep_Fallen_Leaves"
click Fallen Leaves##377230
|tip 它们看起来像一堆红色和棕色的枯叶。
扫荡#2#落叶 |q 66788/1 |goto 61.53,68.57
step
label "Pull_Overgrown_Weeds"
click Overgrown Weeds##377231
|tip 它们看起来像绿色的蕨类植物。
|tip 点击他们后，迅速离开以将他们从地面拉出。
拉 #3# 繁茂杂草 |q 66788/2 |goto 61.53,68.57
step
talk Mother Elion##185904
turnin Egg-cited for the Future##66788 |goto 61.60,68.71
accept Life-Binder on Duty##65791 |goto 61.60,68.71
step
talk Alexstrasza the Life-Binder##185905
turnin Life-Binder on Duty##65791 |goto 62.34,73.02
accept A Charge of Care##65794 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##185905
告诉她“我已准备好。” |gossip 55380
强化红宝石誓石 |q 65794/1 |goto 62.34,73.02
step
talk Alexstrasza the Life-Binder##193377
turnin A Charge of Care##65794 |goto 61.56,68.56
accept Next Steppes##65795 |goto 61.56,68.56
step
talk Ambassador Taurasza##185878
turnin Next Steppes##65795 |goto 48.27,88.67
step
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)"		|only if not completedq(72293)
step
label "All_Scouting_Map_Quests_Complete"
_NOTE:_
你完成了所有主线任务
|tip 你已经完成了龙岛所有区域的主线剧情。
|tip 本指南已完成，请选择另一个指南。
|tip 你可以加载完整区域升级指南来完成支线任务。
点击此处继续 |confirm
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)",{
author="support@zygorguides.com",
},[[
step
talk Ambassador Taurasza##185878
turnin Ohn'ahran Plains##72267 |goto The Waking Shores/0 48.27,88.67 |only if haveq(72267) or completedq(72267)
accept Into the Plains##65779 |goto The Waking Shores/0 48.27,88.67
step
talk Scout Tomul##185882
turnin Into the Plains##65779 |goto Ohn'ahran Plains/0 77.72,23.94
accept Proving Oneself##65780 |goto Ohn'ahran Plains/0 77.72,23.94
step
kill Blazing Proto-Dragon##185883 |q 65780/1 |goto 78.57,27.12
|tip 他是精英，但附近的半人马会帮助你战斗。
step
talk Scout Tomul##185882
turnin Proving Oneself##65780 |goto 78.63,25.39
accept Welcome at Our Fire##65783 |goto 78.63,25.39
step
talk Scout Tomul##185882
turnin Welcome at Our Fire##65783 |goto 85.32,25.42
accept The Shikaar##70174 |goto 85.32,25.42
step
观察对话
talk Sansok Khan##181217
告诉她“我需要和绿龙派的领袖谈话。” |gossip 56190
与桑索克·卡恩交谈 |q 70174/1 |goto 85.74,25.33
step
talk Sansok Khan##181217
turnin The Shikaar##70174 |goto 85.74,25.33
accept Making Introductions##65801 |goto 85.74,25.33
accept Supplies for the Journey##65802 |goto 85.74,25.33
step
click Bundle of Pelts
|tip 在建筑物内。
集齐营地物资 |q 65802/2 |goto 86.17,25.31 |count 1
stickystart "Collect_Feralbloom_Pods"
step
talk Aru##186176
告诉他“我叫{_G.UnitName("player")}。我将加入你的部落参加呼拉尔。” |gossip 55270
与阿鲁和贝莉卡交谈 |q 65801/2 |goto 85.76,26.60
step
click Basket of Dried Fish
集齐营地物资 |q 65802/2 |goto 84.31,27.18 |count 2
step
talk Beastmaster Nuqut##186183
问他“我叫{_G.UnitName("player")}。你会加入前往库拉尔的商队吗？” |gossip 55228
与兽王努库特对话 |q 65801/3 |goto 83.92,25.87
step
click Crate of Horseshoes
集齐营地物资 |q 65802/2 |goto 84.34,24.91 |count 3
step
talk Flightmaster Baqir##184630
fpath Timberstep Outpost |goto 85.28,24.10
step
label "Collect_Feralbloom_Pods"
click Medicinal Feralbloom##377122+
|tip 它们看起来像大型圆形的橙色花朵，带有高大的绿色茎。
collect 5 Feralbloom Pod##192812 |q 65802/1 |goto 84.95,25.16
step
click Weapon Rack
集齐营地物资 |q 65802/2 |goto 84.37,23.12 |count 4
step
talk Scout Tomul##185882
|tip 在建筑物内。
turnin Supplies for the Journey##65802 |goto 84.69,22.81
step
talk Ohn Seshteng##184595
告诉她 "我叫 { _G.UnitName("player") }。我将加入你的部落参加哈拉尔。" |gossip 54838
与奥恩·塞斯腾交谈 |q 65801/1 |goto 85.63,20.85
step
talk Scout Tomul##185882
|tip 在建筑物内。
turnin Making Introductions##65801 |goto 84.69,22.81
accept Toward the City##65803 |goto 84.69,22.81
step
talk Scout Tomul##185882
告诉她“我已准备好出发。” |gossip 55267
与商队会合 |q 65803/1 |goto 83.15,23.74
step
抵达第一站 |q 65803/3 |goto 75.67,31.68
|tip 你可以直接飞到这里，你不需要跟随商队。
|tip 如果你跟随商队，他们会在行进中给你讲述故事。
step
talk Scout Tomul##185882
turnin Toward the City##65803 |goto 75.67,31.68
accept For Food and Rivalry##65804 |goto 75.67,31.68
step
click Mysterious Paw Print
accept Mysterious Beast##70185 |goto 76.74,31.89
step
talk Malakesh##196259
fpath Rusza'thar Reach |goto 84.66,36.89
step
kill Konkhular##194544
|tip 小洞穴内。
collect Pelt of Konkhular##198517 |q 70185/1 |goto 78.28,35.21
step
在该区域击杀敌人
|tip 它们看起来像各种野兽。
collect 30 Fresh Game Meat##191100 |q 65804/1 |goto 77.15,31.09
'|kill Sunhide Stomphoof##187960, Fleecepelt Argali##187975, Plainswalker Mammoth##187938, Plainswalker Calf##187939, Plainswalker Bull##187937
step
talk Scout Tomul##185882
turnin For Food and Rivalry##65804 |goto 75.67,31.68
turnin Mysterious Beast##70185 |goto 75.67,31.68
accept By Broken Road##65940 |goto 75.67,31.68
step
到达第二个传送点 |q 65940/2 |goto 69.96,37.97
|tip 你可以直接飞到这里，你不需要跟随商队。
|tip 如果你跟随商队，他们会在行进中给你讲述故事。
step
talk Ohn Seshteng##184595
turnin By Broken Road##65940 |goto 69.96,37.97
accept Connection to Ohn'ahra##65805 |goto 69.96,37.97
stickystart "Collect_River_Reeds"
stickystart "Collect_Fowl_Tailfeathers"
step
kill Mudwalker Salamanther##190961+
|tip 它们看起来像大型黄色蜥蜴，带有绿色鳍。
collect Salamanther Heart##191103 |q 65805/3 |goto 69.75,38.00
step
label "Collect_River_Reeds"
click River Reeds+
|tip 它们看起来像水边的棕色和黄色植物。
collect 4 River Reeds##191101 |q 65805/1 |goto 69.75,38.00
step
label "Collect_Fowl_Tailfeathers"
click Jadethroat Mallard##190708+
|tip 它们看起来像{o}棕色的鸟，有着绿色的头部{}。
|tip 他们在地面上，正在空中飞翔。
|tip 他们可能会对你发起攻击。
|tip 你也可以直接{o}杀了他们{}，如果你点击他们没有获得羽毛。
collect 8 Fowl Tailfeathers##191102 |q 65805/2 |goto 69.75,38.00
step
talk Ohn Seshteng##184595
turnin Connection to Ohn'ahra##65805 |goto 69.96,37.97
accept Omens on the Wind##66848 |goto 69.96,37.97
step
talk Ohn Seshteng##184595
告诉她“我已准备好。” |gossip 64063
与奥恩·塞斯腾交谈 |q 66848/1 |goto 69.96,37.97
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.98,37.66 |count 1
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.93,37.54 |count 2
step
click Ohn'ir Totem
放置图腾 |q 66848/2 |goto 69.87,37.63 |count 3
step
观察对话
完成仪式 |q 66848/3 |goto 69.87,37.63
step
talk Ohn Seshteng##184595
|tip 她走向这个地点。
turnin Omens on the Wind##66848 |goto 69.97,37.97
step
talk Sansok Khan##181217
accept Maruukai##65806 |goto 70.02,38.02
step
talk Flightmaster Salukan##191263
fpath Maruukai |goto 62.96,42.13
step
抵达玛鲁凯 |q 65806/2 |goto 61.64,39.80
step
talk Sansok Khan##191283
turnin Maruukai##65806 |goto 61.44,39.51
accept Clan Teerai##66016 |goto 61.44,39.51
accept Clan Ohn'ir##66017 |goto 61.44,39.51
accept Clan Nokhud##66018 |goto 61.44,39.51
accept Orientation: Maruukai##72429 |goto 61.44,39.51
step
观察对话
talk Scout Tomul##191485
|tip 她走向这个地点。
turnin Clan Nokhud##66018 |goto 60.38,40.70
step
talk Guard Bahir##186940
accept Unwelcome Outsider##66021 |goto 60.30,40.76
step
talk Nokhud NPCs
|tip 他们在这个区域看起来像半人马。
告诉他们“来切磋一下。” |gossip 55277
|tip 他们会对你发起攻势。
|tip 他们终将投降。
|tip 你也可以在不与他们交谈的情况下攻击他们。
击败 #6# 诺库德半人马 |q 66021/1 |goto 59.30,42.02
'|talk Nokhud Fighter##187297, Nokhud Spearthrower##191570, Nokhud Brute##187299
step
talk Qariin Dotur##186941
turnin Clan Teerai##66016 |goto 59.16,37.61
accept Honoring Our Ancestors##66019 |goto 59.16,37.61
step
click Raw Game Meat
收集生肉 |q 66019/1 |goto 59.39,37.81
step
click Raw Game Meat
放置生肉 |q 66019/2 |goto 59.13,37.57
step
click Jar of Spices
收集香料瓶 |q 66019/3 |goto 59.31,37.29
step
使用香料瓶 |q 66019/4 |goto 59.13,37.57
|tip 使用 {o}施加香料罐{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
click Basket of Spices
收集香料篮子 |q 66019/5 |goto 59.39,37.36
step
应用香料篮 |q 66019/6 |goto 59.13,37.57
|tip 使用{o}施加香料篮{}技能。
|tip 它在屏幕上显示为一个按钮。
step
click Pot of Spices
收集香料罐 |q 66019/7 |goto 59.05,37.90
step
应用香料之锅 |q 66019/8 |goto 59.13,37.57
|tip 使用 {o}施放香料大锅{} 技能。
|tip 它在屏幕上显示为一个按钮。
step
click Spiced Game Meat
拾取香料野味 |q 66019/9 |goto 59.12,37.57
step
烹饪香料野味肉 |q 66019/10 |goto 58.89,37.28
|tip 使用{o}烘烤{}技能。
|tip 它在屏幕上显示为一个按钮。
step
click Spiced Game Meat
献祭之地 |q 66019/11 |goto 59.16,37.10
step
talk Qariin Dotur##186941
turnin Honoring Our Ancestors##66019 |goto 59.16,37.62
step
talk Quartermaster Huseng##196707
|tip 在建筑物内。
见到声望供应商 |q 72429/2 |goto 60.40,37.72
step
talk Agari Dotur##185179
|tip 在建筑物内。
会见声望守护者 |q 72429/1 |goto 60.40,37.66
step
talk Agari Dotur##185179
|tip 在建筑物内。
turnin Orientation: Maruukai##72429 |goto 60.40,37.66
step
talk Ohn Seshteng##191595
|tip 在建筑物内。
turnin Clan Ohn'ir##66017 |goto 63.00,33.67
accept Omens and Incense##66020 |goto 63.00,33.67
step
click Sweetsuckle+
|tip 它们看起来像小的粉色和紫色的花朵。
collect Sweetsuckle Bloom##191160+ |n
use the Sweetsuckle Bloom##191160+
|tip 你需要{o}5个他们{}才能使用。
collect Sweetsuckle Incense##198981 |q 66020/1 |goto 62.93,35.18
step
click Incense Burner
|tip 在建筑物内。
燃烧甜香藤香 |q 66020/2 |goto 62.83,33.72
step
talk Ohn Seshteng##191595
|tip 在建筑物内。
turnin Omens and Incense##66020 |goto 63.00,33.66
step
talk Volebel##190049
fpath Emberwatch |goto 66.78,25.17
step
talk Scout Tomul##191485
turnin Unwelcome Outsider##66021 |goto 62.43,41.72
step
_Next to you:_
talk Aru##192724
accept Clans of the Plains##66969
step
talk Sansok Khan##191283
向桑索克·卡恩报告 |q 66969/1 |goto 61.44,39.51
step
talk Sansok Khan##191283
告诉她“我已准备好。” |gossip 56528
告诉她“提尔艾氏族” |gossip 56515
告诉她“欧恩'艾尔部落” |gossip 56537
告诉她 “诺克哈德氏族” |gossip 56549
告诉她“希卡尔部落” |gossip 56554
正确回答四个问题 |q 66969/2 |goto 61.44,39.51
step
talk Sansok Khan##191283
turnin Clans of the Plains##66969 |goto 61.44,39.51
step
观察对话
talk Gemisath##194927
|tip 她走向这个地点。
accept The Emissary's Arrival##66948 |goto 61.03,40.44
step
talk Gemisath##194927
告诉她我在这里帮助恢复绿色誓石 |gossip 56585
向绿龙军团提供援助 |q 66948/1 |goto 61.03,40.44
step
talk Gemisath##194927
turnin The Emissary's Arrival##66948 |goto 61.03,40.44
accept The Khanam Matra##66022 |goto 61.03,40.44
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
告诉他我已准备好接受面见。 |gossip 54895
与卡汉斯卫兵阿卡托交谈 |q 66022/1 |goto 60.29,37.88
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
turnin The Khanam Matra##66022 |goto 60.35,38.04
accept Trucebreakers##66023 |goto 60.35,38.04
stickystart "Slay_Nokhud_Forces"
step
talk Scout Tomul##191485
accept Covering Their Tails##66024 |goto 59.52,38.75
step
kill Guard Bahir##191843 |q 66024/1 |goto 58.03,39.36
step
label "Slay_Nokhud_Forces"
在这个区域击杀诺库德敌人
|tip 他们看起来像敌对的半人马。
击杀10个诺库德军队 |q 66023/1 |goto 58.98,39.24
你可以在[61.06,39.98]附近找到更多。
'|kill Nokhud Reaver##187201, Nokhud Betrayer##187150, Nokhud Storm Adept##187149
step
talk Khansguard Akato##186942
|tip 外面，在建筑顶部。
turnin Trucebreakers##66023 |goto 60.35,38.04
step
talk Khanam Matra Sarest##181198
|tip 外面，在建筑顶部。
turnin Covering Their Tails##66024 |goto 60.32,38.07
accept The Nokhud Threat##66025 |goto 60.32,38.07
step
观察对话
talk Khanam Matra Sarest##181198
|tip 她走向这个地点。
|tip 在建筑内部，顶层。
turnin The Nokhud Threat##66025 |goto 60.00,37.47
accept Hooves of War##66201 |goto 60.00,37.47
step
talk Flightmaster Washengtu##191814
fpath Broadhoof Outpost |goto 46.57,41.29
step
talk Khansguard Jebotai##187787
|tip 在建筑物内。
turnin Hooves of War##66201 |goto 41.89,61.80
accept The Calm Before the Storm##66222 |goto 41.89,61.80
step
talk Flightmaster Carseng##192865
fpath Teerakai |goto 39.98,61.13
step
talk Scout Khenyug##189594
|tip 小屋内部。
告诉她“诺库德部族已向所有马鲁克宣战。” |gossip 55139
与侦察员凯纽格交谈 |q 66222/4 |goto 37.57,59.45
step
talk Herbalist Agura##188337
告诉他“战争即将来临，杰博泰要求你准备迎接伤亡。” |gossip 87457
与草药师阿古拉交谈 |q 66222/1 |goto 38.48,57.41
step
talk Khansguard Hojin##190585
|tip 他在这个区域游荡。
告诉他“巴拉卡尔已向卡纳姆·马特拉宣战。杰博泰希望你准备好护卫军。” |gossip 56252
与卡恩卫士霍金对话 |q 66222/3 |goto 39.50,55.35
step
talk Quartermaster Gensai##189593
|tip 小屋内部。
告诉他“诺库德氏族已经宣战，杰博泰请求您提供补给。” |gossip 54937
与军需官詹赛交谈 |q 66222/2 |goto 40.72,56.35
step
talk Khansguard Jebotai##187787
|tip 在建筑物内。
turnin The Calm Before the Storm##66222 |goto 41.89,61.79
accept Boku the Mystic##70229 |goto 41.89,61.79
step
talk Initiate Boku##186290
|tip 在山顶上
turnin Boku the Mystic##70229 |goto 36.81,57.27
accept Pessimistic Mystic##66254 |goto 36.81,57.27
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 36.71,57.13 |count 1
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 36.66,57.71 |count 2
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 37.10,57.82 |count 3
step
click Empowerment Totem
放置增能图腾 |q 66254/1 |goto 37.20,57.26 |count 4
step
talk Initiate Boku##186290
turnin Pessimistic Mystic##66254 |goto 36.81,57.27
accept Mystic Mystery##66224 |goto 36.81,57.27
step
在特拉卡外遇见博库 |q 66224/1 |goto 44.56,61.96
step
click Boku's Belongings
收集博库的遗物 |gossip 56253
收集博库的物品 |q 66224/2 |goto 44.56,61.96
step
寻找博库 |q 66224/3 |goto 46.52,63.25
step
clicknpc Unidentified Centaur##190486
选择 _"<获取物品。>"_ |gossip 55390
|tip 你将被攻击。
调查未识别的半人马 |q 66224/4 |goto 46.52,63.25
step
继续寻找博库 |q 66224/5 |goto 49.31,63.22
step
talk Initiate Boku##187795
turnin Mystic Mystery##66224 |goto 49.31,63.22
step
talk Tigari Khan##195316
accept Toting Totems##66225 |goto 49.36,63.13
accept Taken By Storm##70195 |goto 49.36,63.13
stickystart "Collect_Bundles_Of_Totems"
step
kill Shela the Windbinder##194884
自由阿尔坦 |q 70195/1 |goto 48.90,69.04
collect Ridgewater Retreat Orders##198698 |q 70195/2 |goto 48.90,69.04
step
label "Collect_Bundles_Of_Totems"
在这个区域击杀诺库德敌人
collect 8 Bundle of Totems##193051 |q 66225/1 |goto 49.94,67.40
'|kill Nokhud Mystic-Hunter##186295, Nokhud Marauder##186299, Nokhud Mystic-Hunter##190958
step
talk Tigari Khan##190648
turnin Toting Totems##66225 |goto 49.36,63.12
turnin Taken By Storm##70195 |goto 49.36,63.12
accept Catching Wind##66236 |goto 49.36,63.12
step
talk Initiate Boku##187804
turnin Catching Wind##66236 |goto 58.11,68.97
accept Weather Control##66242 |goto 58.11,68.97
accept Eagle-itarian##66256 |goto 58.11,68.97
accept Fowl Sorcery##66257 |goto 58.11,68.97
stickystart "Slay_Primalists"
stickystart "Kill_Stormcaller_Initiates"
stickystart "Kill_Stormbound_Essences"
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.51,69.02 |count 1
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.06,67.43 |count 2
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 58.17,67.35 |count 1
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 57.86,64.89 |count 3
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.66,64.09 |count 4
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 58.86,61.83 |count 2
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 58.78,61.73 |count 5
step
click Ohuna Binding Totem
解放欧纳哈之子 |q 66256/1 |goto 59.65,64.03 |count 6
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 59.22,65.52 |count 3
step
click Boku's Wind Totem
摧毁马车 |q 66257/1 |goto 61.77,66.66 |count 4
step
label "Slay_Primalists"
击杀该区域内的皮玛利斯特敌人
|tip 他们看起来像各种种族的人形生物。
斩杀#6#原始者 |q 66256/2 |goto 59.81,66.03
'|kill Primalist Instructor##195742, Primalist Stormsmith##187916, Prozela Galeshot##193669
step
label "Kill_Stormcaller_Initiates"
kill 6 Stormcaller Initiate##187817 |q 66242/2 |goto 59.35,66.22
|tip 他们看起来像风元素的半人马。
step
label "Kill_Stormbound_Essences"
kill 8 Stormbound Essence##187819 |q 66242/1 |goto 59.35,66.22
|tip 他们看起来像风元素。
step
talk Initiate Boku##187809
|tip 在山顶上
turnin Weather Control##66242 |goto 60.66,63.54
turnin Eagle-itarian##66256 |goto 60.66,63.54
turnin Fowl Sorcery##66257 |goto 60.66,63.54
accept Oh No, Ohn'ahra!##66258 |goto 60.66,63.54
step
观察对话
|tip 跟随{o}Boku{}并{o}保护他{}在与敌人战斗时。
在该区域击杀敌人
保护博库免受敌人侵害 |q 66258/1 |goto 60.42,64.73
解放奥纳哈拉 |q 66258/2 |goto 60.42,64.73
'|kill Agitated Essence##192238, Agitated Initiate##195674, Alerted Stormsmith##192236, Alerted Goliath##192237
step
talk Initiate Boku##195024
turnin Oh No, Ohn'ahra!##66258 |goto 61.42,62.78
accept A Storm of Ill Tidings##66259 |goto 61.42,62.78
step
talk Flightmaster Huraq##195235
fpath Ohn'iri Springs |goto 56.68,76.59
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
告诉她“原始者已经捕获了奥纳哈拉，并与诺库德氏族结盟。” |gossip 56420
去玛鲁卡伊与卡纳姆·马特拉交谈 |q 66259/1 |goto 60.00,37.47
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
turnin A Storm of Ill Tidings##66259 |goto 60.00,37.47
accept Chasing the Wind##66327 |goto 60.00,37.47
step
观察对话
|tip 在建筑内部，顶层。
听取报告 |q 66327/1 |goto 60.00,37.47
step
talk Khanam Matra Sarest##181198
|tip 在建筑内部，顶层。
告诉她“我明白了。” |gossip 56419
与卡纳姆·马特拉·萨雷斯交谈 |q 66327/2 |goto 60.00,37.47
step
在德鲁萨尔之角外遇见卡南·玛特拉·萨雷斯特 |q 66327/4 |goto 73.03,40.59
step
talk Khanam Matra Sarest##188068
turnin Chasing the Wind##66327 |goto 73.03,40.59
accept Nokhud Can Come of This##70244 |goto 73.03,40.59
step
在该区域击杀敌人
clicknpc Teerai Survivor##191097+
|tip 他们看起来像倒在地上的半人马。
夺回诺库德村庄 |q 70244/1 |goto 75.33,40.90
'|kill Primalist Stormfury##190945, Nokhud Warhound##190962, Nokhud Stormlasher##188231, Nokhud Raider##188230, Nokhud Scavenger##185445, Primalist Tempest##190946
step
kill Warmonger Kharad##190932 |q 70244/2 |goto 76.14,40.87
|tip 他是精英。
|tip 你的盟友会帮助你战斗。
step
talk Khanam Matra Sarest##191494
turnin Nokhud Can Come of This##70244 |goto 76.70,40.93
accept Blowing of the Horn##66329 |goto 76.70,40.93
step
talk Khanam Matra Sarest##188068
告诉她“我已准备好！” |gossip 54892
与卡纳姆·马特拉·萨雷斯交谈 |q 66329/1 |goto 76.70,40.93
step
talk Khanam Matra Sarest##188068
turnin Blowing of the Horn##66329 |goto 76.70,40.93
accept Green Dragon Down##66328 |goto 76.70,40.93
step
寻找绿色龙族 |q 66328/1 |goto 72.35,50.33
step
talk Khanam Matra Sarest##188068
告诉她“让我们自我解释一下”。 |gossip 56207
与可汗玛特拉交谈 |q 66328/2 |goto 72.35,50.33
step
观察对话
倾听讨论 |q 66328/3 |goto 72.35,50.33
step
talk Khanam Matra Sarest##188068
turnin Green Dragon Down##66328 |goto 72.35,50.33
step
talk Flightmaster Nakeena##191622
|tip 悬崖上
fpath Pinewood Post |goto 80.43,57.89
step
talk Merithra##188156
accept With the Wind At Our Backs##66344 |goto 72.46,50.79
step
talk Gerithus##189697
告诉他“我准备好了。” |gossip 54859
与Gerithus翱翔 |q 66344/1 |goto 72.30,50.72
step
开始飞往阴暗庇护所 |invehicle |goto 72.30,50.72 |q 66344
step
观察对话
飞往阴暗避难所 |outvehicle |goto 28.62,58.21 |q 66344 |notravel
step
talk Merithra##188106
turnin With the Wind At Our Backs##66344 |goto 28.26,57.69
accept Shady Sanctuary##70220 |goto 28.26,57.69
step
talk Guard-Captain Alowen##194899
告诉她“原始者正在行动。梅瑞莎召唤飞行队伍出战！” |gossip 56367
与卫兵队长阿洛温对话 |q 70220/1 |goto 29.06,55.26
step
talk Sidra the Mender##194902
告诉她“你在前线是必要的。” |gossip 56204
与修复者伊西德拉交谈 |q 70220/3 |goto 30.19,55.68
step
talk Aronus##188972
与阿罗努斯对话以访问梅瑞萨的守望 |q 70220/4 |goto 29.28,56.43
step
talk Aronus##188972
告诉我 “带我去梅瑞莎的观察台。” |gossip 56101
与阿罗努斯共舞 |invehicle |goto 29.28,56.43 |q 70220
step
飞往梅里萨的守望 |outvehicle |goto 29.51,60.34 |q 70220 |notravel
step
talk Viranikus##194903
|tip 在平台上，俯瞰山谷。
告诉它“半人马氏族已宣誓支持。集结你的部队！” |gossip 56205
与维兰尼斯交谈 |q 70220/5 |goto Ohn'ahran Plains/0 30.03,60.25
step
talk Sariosa##186487
fpath Shady Sanctuary |goto 29.82,57.64
step
talk Sariosa##186487
告诉她“古树之枝正处于危险之中！请帮忙传达这个消息。” |gossip 56235
与萨里奥萨交谈 |q 70220/2 |goto 29.82,57.64
step
talk Merithra##188106
turnin Shady Sanctuary##70220 |goto 28.26,57.69
accept The Primalist Front##66331 |goto 28.26,57.69
step
talk Belika##186175
告诉她“梅瑞莎派我来听你报告。” |gossip 55238
听阿鲁和贝利卡的报告 |q 66331/3 |goto 27.56,46.00
step
talk Boku##191325
告诉他，我来这儿是为了听取你的报告。 |gossip 55239
听取博库的报告 |q 66331/2 |goto 25.72,44.26
step
talk Ohn Seshteng##191343
告诉她"听起来轻而易举，我准备好了！" |gossip 55240
观察对话
|tip 你将像鸟一样翱翔。
|tip 你可以点击箭头按钮离开载具，开始飞行后。
|tip 目标将在你无需听故事的情况下完成。
听取奥恩·塞斯滕的报告 |q 66331/4 |goto 26.18,40.07
step
talk Merithra##189599
告诉她“展现你所见的一切。” |gossip 55241
与梅里萨交谈 |q 66331/5 |goto 25.63,40.51
step
talk Khanam Matra Sarest##188601
turnin The Primalist Front##66331 |goto 25.67,40.43
step
talk Merithra##189599
accept Justice for Solethus##66333 |goto 25.63,40.51
stickystart "Kill_Nokhud_Warmongers"
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 24.81,39.89 |count 1
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 24.37,38.47 |count 2
step
click Dragon-Killer Ballista
摧毁龙杀手弩炮 |q 66333/2 |goto 25.44,37.72 |count 3
step
label "Kill_Nokhud_Warmongers"
kill 3 Nokhud Warmonger##188341 |q 66333/1 |goto 24.49,37.45
|tip 他们看起来像携带长矛的大型半人马。
step
_Next to you:_
talk Khanam Matra Sarest
turnin Justice for Solethus##66333
accept Deconstruct Additional Pylons##66335
accept Starve the Storm##66784
'|talk Khanam Matra Sarest##191494
step
kill Primalist Storm-Summoner##191259+
|tip 他们有{o}3个{}。
|tip 在开阔的洞穴内
禁用风暴通道 |q 66784/1 |goto 24.94,34.90
step
_Next to you:_
talk Khanam Matra Sarest
turnin Starve the Storm##66784
'|talk Khanam Matra Sarest##191494
step
标记第二个始源者塔 |q 66335/2 |goto 23.20,37.45
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
标记第三原始者电塔 |q 66335/3 |goto 21.44,37.58
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
标记第一座原始图腾 |q 66335/1 |goto 23.91,39.38
|tip 使用 {o}召唤梅瑞莎{} 能力。
|tip 它在屏幕上显示为一个按钮。
step
_Next to you:_
talk Khanam Matra Sarest
turnin Deconstruct Additional Pylons##66335
accept Stormbreaker##66337
'|talk Khanam Matra Sarest##191494
step
kill Stormbound Proto-Drake##195094
|tip 你的盟友将帮助你作战。
|tip 当龙鳞在约35%生命值时，{o}科罗雷斯出现{}，击杀它。
|tip 在龙死亡后，她将会攻击你。
kill Koroleth##188180 |q 66337/1 |goto 22.38,39.80
step
talk Gerithus##195136
告诉他“带我去梅里莎。” |gossip 63840
与盖瑞图斯交谈 |q 66337/2 |goto 22.92,40.20
step
观察对话
归返梅瑞莎 |outvehicle |goto 25.66,47.84 |q 66337 |notravel
step
talk Merithra##188150
turnin Stormbreaker##66337 |goto 25.65,48.40
accept The Isle of Emerald##66336 |goto 25.65,48.40
step
talk Merithra##188181
turnin The Isle of Emerald##66336 |goto 22.14,50.98
accept Renewal of Vows##66783 |goto 22.14,50.98
step
talk Sansok Khan##188246
选择她第一次狩猎的奖杯 |gossip 54952
clicknpc Shikaar Spear##191195
|tip 它出现在她的手中。
夺矛 |havebuff Sansok's Offering##375466 |goto 22.28,50.88 |q 66783
step
talk Merithra##188181
把她告诉：“这就是萨索克·汗在第一次狩猎后获得的武器。” |gossip 56430
接受桑索克·卡恩的献祭 |q 66783/1 |goto 22.14,50.97
step
talk Tigari Khan##191156
建议她提供一根鹰羽。 |gossip 54951
clicknpc Ohuna Feather##191209
|tip 它出现在她的手中。
带走羽毛 |havebuff Tigari's Offering##375472 |goto 22.37,51.05 |q 66783
step
talk Merithra##188181
告诉她：“这里是来自奥纳哈拉的一根羽毛，随风而起。” |gossip 56431
接受提卡里·汗的馈赠 |q 66783/2 |goto 22.14,50.98
step
talk Khanam Matra Sarest##188601
选择 _"<建议她献血。>"_ |gossip 54948
clicknpc Horn of the Khanam Matra##191208
|tip 它出现在她的手中。
夺取号角 |havebuff Khanam Matra's Offering##375470 |goto 22.34,50.95 |q 66783
step
talk Merithra##188181
告诉她：“这是Teerai氏族未断绝血脉的证据，他们是半人马Teera的直系后裔。” |gossip 56432
接受卡纳姆·马特拉的奉献 |q 66783/3 |goto 22.14,50.98
step
clicknpc Everblooming Soil##197601
|tip 它出现在梅瑞思拉的手中。
取土 |havebuff Merithra's Offering##391289 |goto 22.15,50.98 |q 66783
step
talk Khanam Matra Sarest##188601
请接受梅瑞萨的赠礼给半人马部落。 |gossip 63841
给予梅瑞莎的献祭 |q 66783/4 |goto 22.34,50.95
step
talk Merithra##188181
turnin Renewal of Vows##66783 |goto 22.14,50.98
accept Into the Azure##66340 |goto 22.14,50.98
step
talk Flightmaster Rynaam##192838
fpath Forkriver Crossing |goto 71.65,79.07
step
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)"		|only if not completedq(72293)
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)",{
author="support@zygorguides.com",
},[[
step
talk Masud the Wise##185599
turnin Into the Azure##66340 |goto Ohn'ahran Plains/0 71.66,80.58 |only if haveq(66340) or completedq(66340)
turnin Azure Span##72268 |goto Ohn'ahran Plains/0 71.66,80.58 |only if haveq(72268) or completedq(72268)
accept To the Azure Span##65686 |goto Ohn'ahran Plains/0 71.66,80.58
step
talk Glania of the Blessed Ones##185603
turnin To the Azure Span##65686 |goto The Azure Span/0 41.44,35.61
accept Camp Antonidas##66228 |goto The Azure Span/0 41.44,35.61 |only if not Dracthyr
step
talk Scalecommander Emberthal##197023
accept Shades of Blue##70746 |goto 41.45,35.90
|only if Dracthyr
step
在安托尼斯营地外与艾柏萨尔和泰拉希相遇 |q 70746/1 |goto 45.60,41.29
|only if Dracthyr
step
talk Scalecommander Emberthal##197023
turnin Shades of Blue##70746 |goto 45.61,41.25
|only if Dracthyr
step
观察对话
talk Telash Greywing##197025
accept The Azure Wizard##70747 |goto 45.65,41.27
|only if Dracthyr
step
talk Archmage Khadgar##192091
问他“你是否效忠蓝龙军团？”
与卡德加交谈 |q 70747/1 |goto 46.64,40.19
|only if Dracthyr
step
talk Archmage Khadgar##192091
turnin The Azure Wizard##70747 |goto 46.64,40.19
|only if Dracthyr
step
talk Noriko the All-Remembering##183543
turnin Camp Antonidas##66228 |goto 46.64,40.16
|only if not Dracthyr
step
talk Noriko the All-Remembering##183543
accept Assemble the Defenses##67033 |goto 46.69,39.77
step
talk Althanus##192222
accept Preservation of Knowledge##67035 |goto 46.67,39.73
step
talk Steward Argalos##189116
fpath Camp Antonidas |goto 46.71,39.56
step
click Broken Arcane Device
collect Broken Arcane Device##194512 |q 67033/1 |goto 46.14,39.34 |count 1
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
取回古籍收藏 |q 67035/1 |goto 46.12,39.22 |count 1
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 46.11,38.51 |count 2
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 46.00,38.37 |count 3
step
click Discarded Book
|tip 看起来像一本{o}打开的书{}。
|tip 在建筑物内。
取回古籍收藏 |q 67035/1 |goto 45.87,38.45 |count 4
step
click Broken Arcane Device
collect Broken Arcane Device##194512 |q 67033/1 |goto 45.86,40.17 |count 2
step
click Broken Arcane Device
|tip 在破碎的建筑内。
collect Broken Arcane Device##194512 |q 67033/1 |goto 46.06,40.81 |count 3
step
talk Althanus##192222
turnin Preservation of Knowledge##67035 |goto 46.67,39.74
step
talk Noriko the All-Remembering##183543
turnin Assemble the Defenses##67033 |goto 46.69,39.77
accept Wrath of the Kirin Tor##67036 |goto 46.69,39.77
step
click Arcane Blaster
控制法术枪 |invehicle |goto 46.31,38.85 |q 67036
step
kill Proto-Drake##197693+
|tip 它们看起来像附近东边飞翔的巨龙。
|tip 使用你的快捷栏技能。
观察对话
抵御原始者军团 |q 67036/1 |goto 46.31,38.85
step
talk Noriko the All-Remembering##183543
turnin Wrath of the Kirin Tor##67036 |goto 46.64,40.16
step
talk Archmage Khadgar##192091
|tip 他跑到这个地点。
accept Meeting Kalecgos##65688 |goto 46.64,40.19
step
clicknpc Supply Portal##188915
告诉它：“卡德加说你有东西可以帮助我援助卡雷苟斯。” |gossip 55328
观察对话
请求一袋有用的物品 |q 65688/1 |goto 45.99,38.79
step
click Bag of Helpful Goods
回收有用物品袋 |q 65688/2 |goto 45.95,38.89
step
talk Kalecgos##185615
|tip 在建筑物内。
turnin Meeting Kalecgos##65688 |goto 40.92,55.00
accept The Many Images of Kalecgos##65689 |goto 40.92,55.00
step
click Crystal Pylon
|tip 你将飞向附近的平台。
使用水晶电塔 |q 65689/1 |goto 41.15,55.41
step
到达苍穹档案馆 |q 65689/2 |goto 41.16,57.81
step
talk Kalecgos##185622
turnin The Many Images of Kalecgos##65689 |goto 40.74,59.04
accept Driven Mad##65702 |goto 40.74,59.04
step
talk Kalecgos##185623
accept Arcane Pruning##65709 |goto 40.69,59.10
step
use the Bag of Helpful Goods##191953
collect Ley Scepter##191952 |q 65709/1
stickystart "Collect_Unstable_Arcane"
step
use the Ley Scepter##191952
修复北方奥术场 |q 65709/2 |goto 39.58,60.27
step
use the Ley Scepter##191952
修复东部奥术领域 |q 65709/3 |goto 41.19,62.27
step
label "Collect_Unstable_Arcane"
在该区域击杀敌人
collect 40 Unstable Arcana##190769 |q 65702/1 |goto 40.33,61.03
'|kill Destabilized Elemental##181536, Uncontrolled Guardian##181775
step
talk Kalecgos##185623
turnin Arcane Pruning##65709 |goto 40.69,59.10
step
talk Kalecgos##185622
turnin Driven Mad##65702 |goto 40.74,59.04
accept Straight to the Top##65852 |goto 40.74,59.04
step
use Bag of Helpful Goods##191978
collect Arcane Stepping Stone##191979 |q 65852/1 |goto 39.58,60.27
step
抵达苍穹档案顶点 |q 65852/2 |goto 39.58,60.27
|tip 使用 {o}奥术踏石{} 技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将飞往附近漂浮平台的顶端。
step
talk Kalecgos##186184
|tip 在最高的浮动平台上。
turnin Straight to the Top##65852 |goto 39.97,61.46
accept Platform Adjustments##65751 |goto 39.97,61.46
accept Arcane Annoyances##65752 |goto 39.97,61.46
stickystart "Kill_Feasting_Wyrms"
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 39.51,61.51 |count 1
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 39.58,62.71 |count 2
step
click Unstable Arcane Energy
|tip 看起来像是一个冒着奥术能量的传送门。
|tip 在最高的浮动平台上。
驱散不稳定的奥术能量 |q 65751/1 |goto 40.23,62.03 |count 3
step
label "Kill_Feasting_Wyrms"
use the Arcane Hook##194891
|tip 用它在{o}盛宴巨龙{}身上。
|tip 它们看起来像是在这个区域飞翔的紫色龙，没有四肢。
|tip 在最高的漂浮平台上。 | 不粘贴
kill 6 Feasting Wyrm##192739 |q 65752/1 |goto 39.90,61.69
step
talk Kalecgos##186184
|tip 在最高的浮动平台上。
turnin Platform Adjustments##65751 |goto 39.97,61.46
turnin Arcane Annoyances##65752 |goto 39.97,61.46
accept Reclaiming the Oathstone##65854 |goto 39.97,61.46
step
talk Kalecgos##186187
|tip 在地面上
告诉他，我准备好见你重新夺回蓝色誓石。 |gossip 54821
夺回誓言石 |q 65854/1 |goto 39.44,63.18
step
talk Sindragosa##186188
turnin Reclaiming the Oathstone##65854 |goto 39.48,63.07
accept Aiding Azure Span##65855 |goto 39.48,63.07
step
talk Arc Tel XVII##189459
fpath Azure Archives |goto 37.06,60.82
step
talk Arc Tel XVII##189459
与飞行管理员交谈 |q 65855/1 |goto 37.06,60.82
step
talk Noriko the All-Remembering##183543
turnin Aiding Azure Span##65855 |goto 46.64,40.16
accept Ask the Locals##66699 |goto 46.64,40.16
step
talk Korrikunit the Whalebringer##190229
问他“你知道这个区域内有任何魔法能量线吗？” |gossip 55417
咨询科里库尼特 |q 66699/1 |goto 46.76,38.59
step
talk Jokomuupat##190226
告诉她“我在蓝色峡谷寻找浓缩魔法的口袋。” |gossip 55418
咨询乔科穆帕特 |q 66699/2 |goto 46.34,38.15
step
talk Babunituk##190225
告诉他“我在寻找水晶。紫色水晶。在洞穴里。” |gossip 55419
咨询巴布尼图克 |q 66699/3 |goto 45.72,38.84
step
talk Babunituk##190225
turnin Ask the Locals##66699 |goto 45.72,38.84
accept Catch the Caravan##65864 |goto 45.72,38.84
step
talk Brena##186224
告诉她 "你一定是布雷娜。我…" |gossip 54825
寻找布雷娜 |q 65864/1 |goto 35.25,36.98
step
观察对话
talk Brena##186224
turnin Catch the Caravan##65864 |goto 35.25,36.98
step
talk Elder Poa##188809
accept Those Aren't for Chewing##65868 |goto 35.37,36.94
step
观察对话
talk Brena##191810
accept Howling in the Big Tree Hills##65867 |goto 35.28,36.94
accept Snap the Traps##65866 |goto 35.28,36.94
stickystart "Spring_Traps"
stickystart "Collect_Funerary_Offerings"
step
kill Hyenamaster Durgun##186515 |q 65867/1 |goto 35.66,34.72
step
进入洞穴 |goto 34.94,32.63 < 20 |walk
kill Trap-Layer Kerwal##186516 |q 65867/2 |goto 34.99,32.04
|tip 洞内探险
step
kill Bakra the Bully##186517 |q 65867/3 |goto 33.95,33.18
step
label "Spring_Traps"
click Bladejaw Trap##376139+
|tip 它们看起来像银色金属熊陷阱。
春季 #8# 陷阱 |q 65866/1 |goto 34.75,34.50
step
label "Collect_Funerary_Offerings"
在该区域击杀敌人
|tip 一些他们处于潜行状态。
收集 #8# 丧葬供品 |q 65868/1 |goto 35.02,33.92
'|kill Shadepaw Bruiser##183343, Shadepaw Hunter##186490, Scavenging Hyena##183340, Shadepaw Bandit##183341
step
talk Hanu##186618
turnin Snap the Traps##65866 |goto 34.27,31.29
turnin Howling in the Big Tree Hills##65867 |goto 34.27,31.29
turnin Those Aren't for Chewing##65868 |goto 34.27,31.29
step
观察对话
talk Hanu##189642
|tip 他跑到这个地点。
accept Gnoll Way Out##65871 |goto 34.42,31.11
step
talk Brena##186228
accept Ill Gnolls With Ill Intent##65872 |goto 34.37,31.02
accept Leader of the Shadepaw Pack##65873 |goto 34.37,31.02
step
talk Elder Poa##189662
accept Supplies!##65870 |goto 34.34,31.00
stickystart "Slay_Shadepaw_Gnolls"
step
进入洞穴 |goto 34.02,30.77 < 20 |walk |only if not subzone("Kargpaw's Den")
click Basket of Hunting Game Calls
|tip 洞内探险
collect Hunting Game Calls##192189 |q 65870/3 |goto The Azure Span/1 36.38,93.17
step
click Barrel of Salt
|tip 洞内探险
|tip 你将被攻击。
collect Meat Curing Salts##191111 |q 65870/1 |goto 28.96,75.19
step
click Crude Cage
|tip 洞内探险
拯救图斯卡尔 |q 65871/1 |goto 30.29,60.43 |count 1
step
clicknpc Norukk##186655
|tip 地下洞穴内
拯救诺鲁克 |q 65871/2 |goto 41.43,63.90
step
click Crude Cage
|tip 地下洞穴内
拯救图斯卡尔 |q 65871/1 |goto 46.08,41.66 |count 2
step
click Barrel of Skinning Tools
|tip 地下洞穴内
|tip 你将被攻击。
collect Skinning Tools##192190 |q 65870/2 |goto 51.56,36.59
step
click Crude Cage
|tip 地下洞穴内
拯救图斯卡尔 |q 65871/1 |goto 38.09,32.94 |count 3
step
沿着小路走下去 |goto 36.23,30.76 < 20 |walk
kill Kargpaw the Fetid##186660
|tip 地下洞穴内
collect Kargpaw's Totem##191118 |q 65873/1 |goto 41.56,15.40
step
label "Slay_Shadepaw_Gnolls"
消灭该区域内的虚弱敌人
|tip 他们看起来像歹徒。
|tip 洞内探险
击杀#16#影爪诺尔斯 |q 65872/1 |goto 44.77,44.12
'|kill Sickly Ambusher##189402, Sickly Grunt##186768, Sickly Shaman##186667, Sickly Brute##186668, Sickly Pilferer##193505
step
离开洞穴 |goto 55.01,84.31 < 20 |walk |only if subzone("Kargpaw's Den")
talk Elder Poa##189662
turnin Supplies!##65870 |goto The Azure Span/0 34.34,31.00
step
talk Brena##186228
turnin Ill Gnolls With Ill Intent##65872 |goto 34.37,31.02
turnin Leader of the Shadepaw Pack##65873 |goto 34.37,31.02
step
talk Hanu##189642
turnin Gnoll Way Out##65871 |goto 34.42,31.10
step
talk Brena##186228
accept Spreading Decay##66239 |goto 34.37,31.02
step
talk Brena##187721
turnin Spreading Decay##66239 |goto 28.69,34.82
accept Another Ambush##65869 |goto 28.69,34.82
step
talk Akiun##187730
问他“你能告诉我发生了什么吗？” |gossip 55220
与阿库因对话 |q 65869/1 |goto 28.68,34.75
step
clicknpc Tuskarr Fisherman##190136
调查尸体进一步情况... |gossip 55691
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 29.24,33.57 |count 1
step
clicknpc Tuskarr Hunter##190142
调查尸体进一步情况... |gossip 55692
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 29.17,32.55 |count 2
step
clicknpc Tuskarr Craftsman##190143
调查尸体进一步情况... |gossip 55693
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 28.20,31.86 |count 3
step
clicknpc Festering Gnoll##190074
调查尸体进一步情况... |gossip 55694
|tip 你将被攻击。
|tip 如果你保持骑乘状态，你可以迅速飞走。
审视尸体 |q 65869/2 |goto 27.97,32.83 |count 4
step
talk Brena##189708
turnin Another Ambush##65869 |goto 28.79,34.74
accept Urgent Action Required##66026 |goto 28.79,34.74
step
talk Brena##186179
turnin Urgent Action Required##66026 |goto 20.59,35.67
step
观察对话
talk Kalecgos##187873
|tip 他走到这个地点。
accept Breaching the Brackenhide##65838 |goto 20.53,35.69
step
click Rotting Root
剪断根须 |gossip 55350
探索北部地区 |q 65838/1 |goto 18.40,34.74
step
click Rotting Root
剪断根须 |gossip 54967
调查南部区域 |q 65838/2 |goto 18.87,37.01
step
click Rotting Root
剪断根须 |gossip 54968
调查西部地区 |q 65838/3 |goto 17.59,36.98
step
talk Kalecgos##187873
turnin Breaching the Brackenhide##65838 |goto 16.75,37.31
accept Ley Litter##65846 |goto 16.75,37.31
step
talk Norukk##186181
accept Cut Out the Rot##65844 |goto 16.76,37.25
step
talk Brena##186179
accept Echoes of the Fallen##65845 |goto 16.75,37.22
stickystart "Kill_Rotting_Treants"
stickystart "Collect_Ley_Crystals"
stickystart "Kill_Brackenhide_Rotflingers"
step
use Brena's Totem##191928
|tip 将其使用在{o}Kaqiata{}上。
联系精灵 |q 65845/1 |goto 17.46,37.08 |count 1
'|clicknpc Kaqiata##188854
step
use Brena's Totem##191928
|tip 在{o}波波克{}身上使用它。
联系精灵 |q 65845/1 |goto 18.13,37.66 |count 2
step
use Brena's Totem##191928
|tip 把它用在{o}卢托克{}身上。
|tip 在洞穴入口处。
联系精灵 |q 65845/1 |goto 18.52,37.27 |count 3
step
use Brena's Totem##191928
|tip 将其使用在{o}诺穆洛克{}身上。
联系精灵 |q 65845/1 |goto 17.54,37.93 |count 4
step
use Brena's Totem##191928
|tip 把它用在{o}Tuyuki{}身上。
联系精灵 |q 65845/1 |goto 17.41,38.66 |count 5
step
label "Kill_Rotting_Treants"
kill 5 Rotting Treant##186361 |q 65844/1 |goto 17.89,37.71
|tip 他们看起来像行走的树人。
你可以在洞穴内找到更多，坐标 [18.56,37.24]。
step
label "Collect_Ley_Crystals"
click Gnawed Ley Crystal+
|tip 它们看起来像紫色水晶。
collect 7 Ley Crystal##194431 |q 65846/1 |goto 17.78,37.63
step
label "Kill_Brackenhide_Rotflingers"
kill 10 Brackenhide Rotflinger##186362 |q 65844/2 |goto 17.89,37.71
|tip 他们看起来像肩膀上扛着动物头骨的戈尔诺尔。
你可以在洞穴内找到更多，坐标 [18.56,37.24]。
step
talk Brena##186179
turnin Echoes of the Fallen##65845 |goto 16.75,37.22
step
talk Norukk##186181
turnin Cut Out the Rot##65844 |goto 16.76,37.25
step
talk Kalecgos##187873
turnin Ley Litter##65846 |goto 16.75,37.32
accept Tome-ward Bound##65848 |goto 16.75,37.32
step
talk Kalecgos##187873
告诉他我已准备好。 |gossip 55002
观察对话
与卡雷苟斯交谈 |q 65848/1 |goto 16.75,37.32
step
clicknpc Tome of Spellflinging##191636
骑乘法术投掷之书 |q 65848/2 |goto 16.72,37.30
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.97,38.42 |count 1
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.15,38.04 |count 2
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
kill Brackenhide Putrifier##196496 |q 65848/3 |goto 15.65,37.32 |count 3
|tip 它看起来像一个较大的敌人正在施放绿色法术。
|tip 使用你的动作条上的技能。
step
观察对话
|tip 使用你的快捷栏技能。
kill Twisted Ancient##186194 |q 65848/4 |goto 15.41,37.69
step
在洞穴集合 |outvehicle |goto 15.16,39.18 |q 65848 |notravel
|tip 你将自动传送到洞穴中。
step
观察对话
talk Kalecgos##187873
|tip 洞内探险
turnin Tome-ward Bound##65848 |goto 15.30,39.43
accept Realignment##65847 |goto 15.30,39.43
step
click Ley Crystal
|tip 洞内探险
聚焦魔脉 |q 65847/1 |goto 15.36,39.50
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.51,39.30 |count 1
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.30,39.12 |count 2
step
click Decay Infection
|tip 洞内探险
毁灭腐朽感染 |q 65847/2 |goto 15.07,39.53 |count 3
step
talk Kalecgos##186177
|tip 洞外，靠近道路。
turnin Realignment##65847 |goto 16.11,41.41
step
talk Brena##186179
accept To Iskaara##65849 |goto 16.08,41.45
step
talk Skygazer Paatu##186443
fpath Iskaara |goto 13.29,48.77
step
talk Brena##186480
|tip 在建筑物内。
turnin To Iskaara##65849 |goto 13.24,49.56
accept Gather the Family##66210 |goto 13.24,49.56
step
click Decorated Teapot
收集葬礼供品 |q 66210/1 |goto 13.48,48.57 |count 1
step
click Handcrafted Boat
收集葬礼供品 |q 66210/1 |goto 13.87,49.48 |count 2
step
click Stone Sculpture
|tip 在建筑物内。
收集葬礼供品 |q 66210/1 |goto 12.49,49.45 |count 3
step
click Ornamented Shield
收集葬礼供品 |q 66210/1 |goto 12.46,50.32 |count 4
step
click Funeral Boat
将祭品放入船中 |q 66210/2 |goto 13.13,48.57
step
talk Brena##186480
|tip 在建筑物内。
turnin Gather the Family##66210 |goto 13.24,49.56
step
talk Kalecgos##189793
|tip 在建筑物内。
accept The Cycle of the Sea##65850 |goto 13.27,49.53
step
talk Brena##186480
|tip 在建筑物内。
告诉她我已经准备好开始葬礼了。 |gossip 55314
开始跟随布雷娜 |goto 13.24,49.56 > 10 |q 65850
step
观察对话
|tip 跟随 {o}Brena{} 行走。
|tip 她最终走到了这个坐标。
与布雷娜对话 |q 65850/1 |goto 12.93,50.43
step
click Funeral Boat
推船出海 |q 65850/2 |goto 13.16,50.20
step
talk Kalecgos##186177
turnin The Cycle of the Sea##65850 |goto 12.94,50.39
accept Azure Alignment##65911 |goto 12.94,50.39
step
talk Bergede Broadchin##190332
fpath Three-Falls Lookout |goto 19.15,23.78
step
talk Kalecgos##186280
turnin Azure Alignment##65911 |goto 39.48,63.02
accept Calling the Blue Dragons##66027 |goto 39.48,63.02
step
talk Kalecgos##186280
告诉他我准备好让你召回蓝色龙族。 |gossip 54829
与卡雷苟斯交谈 |q 66027/1 |goto 39.48,63.02
step
talk Kalecgos##186280
turnin Calling the Blue Dragons##66027 |goto 39.48,63.02
accept To Rhonin's Shield##65886 |goto 39.48,63.02
step
talk Kruthix##191999
fpath Cobalt Assembly |goto 49.10,22.67
step
talk Taelmyr Blazewing##186742
fpath Theron's Watch |goto 65.37,16.39
step
到达罗宁之盾 |q 65886/1 |goto 66.00,25.39
step
talk Portia Striat##191976
fpath Rhonin's Shield |goto 66.00,25.39
step
talk Drok Scrollstabber##189751
turnin To Rhonin's Shield##65886 |goto 65.81,25.32
accept To the Mountain##65887 |goto 65.81,25.32
step
talk Kalecgos##186304
turnin To the Mountain##65887 |goto 70.01,35.23
accept Primal Offensive##65943 |goto 70.01,35.23
step
talk Khadgar##186305
accept Lava Burst##65944 |goto 70.03,35.34
accept Elemental Unfocus##66647 |goto 70.03,35.34
stickystart "Slay_Primalist_Forces_65943"
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 72.23,37.28 |count 1
step
kill Ruvin Stonegrinder##189939
|tip 小洞穴内。
collect Elemental Focus##192478 |q 66647/1 |goto 72.91,38.72
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 73.12,37.76 |count 2
step
click Lava Orb
|tip 看起来像一个橙色的浮空熔岩球。
摧毁熔岩宝珠 |q 65944/1 |goto 73.77,38.32 |count 3
step
label "Slay_Primalist_Forces_65943"
在该区域击杀敌人
击败15个原始者势力 |q 65943/1 |goto 72.65,37.62
'|kill Fiery Carver##186328, Primal Fire Elemental##186550, Mountain Shaper##186329
step
talk Archmage Khadgar##186688
turnin Lava Burst##65944 |goto 74.47,37.84
turnin Elemental Unfocus##66647 |goto 74.47,37.84
step
talk Kalecgos##186686
turnin Primal Offensive##65943 |goto 74.47,37.81
accept Primal Power##65958 |goto 74.47,37.81
step
talk Archmage Khadgar##186688
accept Kirin Tor Recovery##65977 |goto 74.46,37.84
stickystart "Recover_The_Primal_Energies"
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 74.59,38.63 |count 1
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 75.27,37.21 |count 2
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 75.64,38.37 |count 3
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.13,37.86 |count 4
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.57,38.92 |count 5
step
click Elemental Drainer
拯救肯瑞托法师 |q 65977/1 |goto 76.02,39.53 |count 6
step
label "Recover_The_Primal_Energies"
在该区域击杀敌人
use Elemental Focus##192479
|tip 在他们的尸体旁使用它。
恢复原始能量 |q 65958/1 |goto 75.49,38.27
'|kill Primal Lava Elemental##186438, Primalist Worshipper##186759
step
talk Archmage Khadgar##186779
turnin Primal Power##65958 |goto 76.95,39.43
turnin Kirin Tor Recovery##65977 |goto 76.95,39.43
accept Free Air##66007 |goto 76.95,39.43
step
extraaction Elemental Disguise##378814
|tip 使用{o}元素伪装{}技能。
|tip 它在屏幕上显示为一个按钮。
伪装成人类元素 |havebuff Elemental Disguise##378814 |goto 76.95,39.43 |q 66007
step
_NOTE:_
在下一步中
|tip 避开地面的蓝色漩涡。
|tip 避免那些身边有蓝圈的敌人，他们能透视你的伪装。
点击此处继续 |confirm |q 66007
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 77.36,39.91 |count 1
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 77.35,38.28 |count 2
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 78.22,37.64 |count 3
step
click Lava Beacon
摧毁熔岩信标 |q 66007/1 |goto 78.55,39.04 |count 4
step
进入洞穴 |goto 78.72,39.53 < 20 |walk
talk Kalecgos##186862
|tip 洞内探险
turnin Free Air##66007 |goto 78.38,39.98
accept In Defense of Vakthros##66009 |goto 78.38,39.98
step
kill Korthrox the Destroyer##183422 |q 66009/1 |goto 79.27,36.33
|tip 蓝色圆圈（不是蓝色闪电漩涡）将在你与他战斗时出现在地面上。
|tip 卡雷戈斯会在蓝色圆圈出现时在你的聊天中说“在我的符文中寻求庇护！”
|tip 当地面出现蓝色圆圈时，{o}进入蓝色圆圈{}。
|tip 他们将使你在Korthrox使用强大技能时免受伤害。
step
talk Archmage Khadgar##193837
turnin In Defense of Vakthros##66009 |goto 77.99,32.47
accept The Storm-Eater's Fury##70041 |goto 77.99,32.47
step
click Arcane Disc
登上奥术圆盘 |q 70041/1 |goto 78.03,32.44
step
观察对话
在该区域击杀敌人
|tip 附近的地面上。
|tip 使用你的动作条上的技能。
击退#150#原始者军团 |q 70041/2
step
驱散 #3# 风暴漏斗 |q 70041/3
|tip 它们看起来像附近地面上的灰色旋转龙卷风。
|tip 使用你的动作条上的{o}碧蓝驱散{}技能。
step
在该区域击杀敌人
|tip 附近的地面上。
|tip 使用你的动作条上的技能。
消灭#200#原始派军团 |q 70041/4
step
talk Kalecgos##187034
turnin The Storm-Eater's Fury##70041 |goto 78.22,33.34
accept The Blue Dragon Oathstone##66015 |goto 78.22,33.34
step
talk Camilla Highwind##186782
fpath Camp Nowhere |goto 63.45,58.66
step
talk Sindragosa##186188
告诉她“我准备好迎接誓石的重夺。” |gossip 55293
见证仪式 |q 66015/1 |goto 39.48,63.07
step
talk Sindragosa##186188
turnin The Blue Dragon Oathstone##66015 |goto 39.48,63.07
step
talk Kalecgos##190000
accept To Valdrakken##66244 |goto 39.47,63.05
|only if not (haveq(72293) or completedq(72293))
step
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"	|only if completedq(72293)
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Thaldraszus (Story Only)"		|only if not completedq(72293)
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Thaldraszus (Story Only)",{
author="support@zygorguides.com",
},[[
step
talk Aluri##193321
fpath Valdrakken |goto Valdrakken/0 44.04,67.97
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin To Valdrakken##66244 |goto 58.11,34.87 |only if haveq(66244) or completedq(66244)
turnin Thaldraszus##72269 |goto 58.11,34.87 |only if haveq(72269) or completedq(72269)
accept A Message Most Dire##66159 |goto 58.11,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
告诉她“关于蓝色区...” |gossip 55406
传递情报 |q 66159/1 |goto 58.11,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin A Message Most Dire##66159 |goto 58.11,34.87
step
观察对话
talk Captain Drine##189842
|tip 她冲向这个地点。
|tip 在塔顶上。
accept Nowhere to Hide##66163 |goto 59.37,34.74
accept Eyes and Ears##66166 |goto 59.37,34.74
step
use the Revealing Dragon's Eye##198859
|tip 在塔顶上。
使用显现之龙眼 |q 66163/1 |goto 59.37,34.74
step
talk Valdrakken Citizen##189869
停下！我看穿了你的伪装！ |gossip 55202
|tip 你将被3个敌人攻击。
|tip 你可能需要等他们重生。
kill 3 Primalist Infiltrator##189895 |q 66163/2 |goto 80.36,50.34 |count 3
step
talk Valdrakken Citizen##189869
停下！我看穿了你的伪装！ |gossip 55202
|tip 你将被3个敌人攻击。
|tip 你可能需要等他们重生。
kill 6 Primalist Infiltrator##189895 |q 66163/2 |goto 68.52,64.87 |count 6
step
进入建筑物 |goto 55.33,57.37 < 20 |walk
click Storage Chest
|tip 在建筑物内。
观察对话
调查银行 |q 66166/2 |goto 59.20,54.70
step
click Consortium Ledger
观察对话
调查工匠联盟 |q 66166/1 |goto 34.63,61.30
step
click Goblet
|tip 看起来像个桌子上的黄金酒杯。
|tip 在建筑物内。
观察对话
调查旅店 |q 66166/3 |goto 46.92,47.72
step
talk Captain Drine##189842
|tip 建筑入口附近
turnin Nowhere to Hide##66163 |goto Valdrakken/0 54.77,47.23
turnin Eyes and Ears##66166 |goto Valdrakken/0 54.77,47.23
accept Southern Exposure##66167 |goto Valdrakken/0 54.77,47.23
step
talk Valdren##193454
|tip 高耸在悬崖上。
fpath Garden Shrine |goto Thaldraszus/0 35.62,78.85
step
前往南门 |q 66167/1 |goto 35.85,82.56
step
talk Guardian Velomir##190086
援助守护者维洛米尔 |q 66167/2 |goto 35.85,82.56
step
talk Guardian Velomir##190180
turnin Southern Exposure##66167 |goto 35.85,82.56
accept Vengeance, Served Hot##66169 |goto 35.85,82.56
accept The Fog of Battle##66246 |goto 35.85,82.56
stickystart "Slay_Magmasworn_Primalists"
step
clicknpc Mangled Corpse##190440
检查尸体 |gossip 54894
寻找维洛米尔的部队 |q 66246/1 |goto 36.25,83.73 |count 1
step
clicknpc Badly Injured Guardian##190442
|tip 在建筑物内。
检查尸体 |gossip 55103
寻找维洛米尔的部队 |q 66246/1 |goto 35.76,84.19 |count 2
step
clicknpc Mangled Corpse##190247
检查尸体 |gossip 54893
寻找维洛米尔的部队 |q 66246/1 |goto 36.46,85.39 |count 3
step
label "Slay_Magmasworn_Primalists"
在该区域击杀 magma sworn 敌人
击杀#12# magma swarnder 原生者 |q 66169/1 |goto 36.47,84.79
'|kill Magmaclaw Raider##187218, Magmasworn Lavablade##190212, Magmasworn Flameweaver##193414
step
talk Guardian Velomir##190180
|tip 在桥上
turnin Vengeance, Served Hot##66169 |goto 37.62,83.08
turnin The Fog of Battle##66246 |goto 37.62,83.08
accept Remember the Fallen##66245 |goto 37.62,83.08
step
click Magmasworn Spear
|tip 在桥上
accept Slightly Used Weapons##66247 |goto 37.85,83.26
stickystart "Collect_Magmasworn_Spears"
stickystart "Collect_South_Hold_Garrison_Signet"
step
click Coil of Heavy Rope
accept Tying Things Together##66248 |goto 38.56,83.41
step
click Coil of Heavy Rope##377115+
|tip 它们看起来像缠绕的绳索。
collect 5 Coil of Heavy Rope##192758 |q 66248/1 |goto 39.17,83.81
step
label "Collect_Magmasworn_Spears"
kill Magmasworn Rockcleaver##190420+
collect 6 Magmasworn Spear##192759 |q 66247/1 |goto 39.18,83.83
step
label "Collect_South_Hold_Garrison_Signet"
click South Hold NPCs
|tip 他们看起来像亡灵龙人。
collect 8 South Hold Garrison Signet##191269 |q 66245/1 |goto 38.94,83.89
'|clicknpc South Hold Magus##187518, South Hold Guardian##187516
step
talk Guardian Velomir##190180
|tip 在桥上
turnin Remember the Fallen##66245 |goto 37.62,83.08
turnin Slightly Used Weapons##66247 |goto 37.62,83.08
turnin Tying Things Together##66248 |goto 37.62,83.08
accept Clear the Sky##66249 |goto 37.62,83.08
step
click Siege Scorpion
|tip 在一块石制平台上，俯瞰下面的山谷。
操控 siege scorpion |q 66249/1 |goto 40.88,83.86
step
kill Magmasworn Trueborn##194543+
|tip 它们看起来像附近飞翔的红龙。
|tip 使用你的快捷栏技能。
杀死熔火之誓 |q 66249/2 |goto 40.88,83.86
step
talk Guardian Velomir##190558
|tip 在建筑物内。
turnin Clear the Sky##66249 |goto 40.56,85.48
accept Where's The Chief?##66250 |goto 40.56,85.48
step
talk Guardian Velomir##190558
|tip 在建筑物内。
告诉他“我准备好了。让我们进去！” |gossip 54896
调查哨塔 |q 66250/1 |goto 40.56,85.48
step
talk Guardian Velomir##190562
turnin Where's The Chief?##66250 |goto 40.15,85.13
accept Fire Fighter##66251 |goto 40.15,85.13
step
kill Magmatalon##189538 |q 66251/1 |goto 40.29,87.10
|tip 他看起来像一只在这个区域空中飞翔的黑色和橙色龙。
|tip 他将在你的小地图上以黄色点的形式出现。
step
talk Guardian Velomir##190562
turnin Fire Fighter##66251 |goto 40.15,85.13
accept Reporting In##66252 |goto 40.15,85.13
step
talk Captain Drine##189842
|tip 在塔顶上。
turnin Reporting In##66252 |goto Valdrakken/0 55.94,39.96
step
talk Nozdormu##187669
|tip 在塔顶上。
accept The Flow of Time##66320 |goto 61.40,39.05
step
talk Talon Smoht##189018
|tip 在一块石制平台上，俯瞰下面的山谷。
fpath Gelikyr Post |goto Thaldraszus/0 51.16,67.09
step
talk Chromie##187100
告诉她“诺兹多姆派我来帮忙。” |gossip 63842
观察对话
与克罗米交谈 |q 66320/1 |goto 57.46,78.92
step
talk Chromie##187100
turnin The Flow of Time##66320 |goto 57.46,78.92
step
talk Andantenormu##187877
accept Temporal Difficulties##66080 |goto 57.53,78.79
step
talk Azim##193458
fpath Shifting Sands |goto 57.63,79.02
step
寻找失踪的招募者 |q 66080/1 |goto Thaldraszus/0 55.00,75.75
step
talk Siaszerathel##187098
turnin Temporal Difficulties##66080 |goto Thaldraszus/0 55.00,75.75
accept Haven't Got Time For the Pain##70136 |goto Thaldraszus/0 55.00,75.75
step
click Timewalker Notes
collect Timewalker Notes##198408 |q 70136/2 |goto 53.18,77.38
step
kill Crazed Alpha##194224 |q 70136/3 |goto 52.69,76.81
|tip 小洞穴内。
step
click Timewalker Staff
|tip 洞内探险
collect Timewalker Staff##198410 |q 70136/1 |goto 52.71,76.86
step
talk Siaszerathel##187098
turnin Haven't Got Time For the Pain##70136 |goto Thaldraszus/0 55.00,75.75
accept Time is Running Out##66081 |goto Thaldraszus/0 55.00,75.75
accept Time in a Bottle##66082 |goto Thaldraszus/0 55.00,75.75
stickystart "Collect_The_Energy"
step
click Temporal Collector##377081+
|tip 它们看起来像漂浮的蓝色水晶。
|tip 它们将在你的小地图上出现为黄色点。
collect 8 Temporal Collector##192602 |q 66081/1 |goto 55.12,77.65
step
label "Collect_The_Energy"
在这个区域击杀时空充能的敌人
|tip 他们看起来像各种动物。
|tip {o}走进击杀敌人后出现的时间微粒{}
|tip 它们看起来像浮动的黄色光辉晶体。
收集能量 |q 66082/1 |goto 55.77,76.95
'|kill Time-Charged Salamanther##187338, Time-Charged Ohuna##187337, Time-Charged Vorquin##187336, Time-Charged Bear##195635, Time-Charged Hornswog##187324
step
talk Siaszerathel##187098
turnin Time is Running Out##66081 |goto 57.46,78.92
turnin Time in a Bottle##66082 |goto 57.46,78.92
step
观察对话
talk Andantenormu##187877
accept Feels Like the First Time##66083 |goto 57.52,78.79
step
观察对话
talk Andantenormu##190479
|tip 他走到这个地点。
告诉他“我准备好开始了。” |gossip 55340
与安达诺穆对话 |q 66083/1 |goto 57.58,78.38
step
click Temporal Collector
抽取收集者 |q 66083/2 |goto 57.68,78.33
step
click Crystal Focus
增强导管 |q 66083/3 |goto 57.67,78.38
step
_NOTE:_
在此任务中
|tip 如果你的指引观众在这个任务中在重载界面后变得{o}隐藏{}，点击{o}小地图{}按钮让它再次出现。
点击此处继续 |confirm |q 66083
step
click Time-Lost Artifact
观察对话
归还神器 |q 66083/4 |goto 57.64,78.46
step
观察对话
恢复个人时间线 |q 66083/5
step
回归萨尔德拉苏斯 |complete zone("Thaldraszus") |q 66083
step
talk Andantenormu##187877
|tip 他走到这个地点。
turnin Feels Like the First Time##66083 |goto 57.52,78.79
accept Times Like These##66084 |goto 57.52,78.79
step
talk Siaszerathel##187098
accept If We Could Turn Back Time##66085 |goto 57.46,78.92
stickystart "Collect_Temporal_Residue"
step
click Time Rift
封闭第一个裂痕 |q 66085/1 |goto 58.59,78.22
step
talk Siaszerathel##187339
告诉她“展示一下你的实力。” |gossip 56086
观察对话
观察泽拉 |q 66085/2 |goto 59.81,79.31
step
click Time Rift
关闭第二次裂隙 |q 66085/3 |goto 60.01,79.28
step
click Time Rift
关闭第三裂隙 |q 66085/4 |goto 59.97,77.20
step
观察对话
talk Aeonormu##187504
问他“你是时光行者吗？” |gossip 55001
告诉他“泽拉可以引导你找到他们。” |gossip 55190
邂逅陌生人 |q 66085/5 |goto 59.95,77.23
step
label "Collect_Temporal_Residue"
在该区域击杀敌人
collect 100 Temporal Residue##192809 |q 66084/1 |goto 59.11,78.16
'|kill Time-Lost Thunderhide##187258, Time-Lost Raptor##187256, Time-Lost Devilsaur##187262, Time-Lost Murloc##190584, Time-Lost Murhulk##195095
step
talk Siaszerathel##187098
turnin If We Could Turn Back Time##66085 |goto 57.46,78.92
step
talk Andantenormu##187877
turnin Times Like These##66084 |goto 57.53,78.79
step
talk Aeonormu##190929
accept Closing Time##66087 |goto 57.55,78.86
step
在该区域击杀敌人
|tip 在敌人和盟友附近使用{o}时间爆发{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 它将对敌人造成伤害并增强友方。
|tip 你将通过增强盟友获得{o}任务进度{}。
click Various Object+
|tip 它们看起来像是 pedestal 上的各种黄色 orb 物品。
|tip 它们将在你的小地图上出现为黄色点。
click Time Rift+
|tip 它们看起来像黄色旋转的传送门。
守护时间线 |q 66087/1 |goto 57.49,83.13
'|clicknpc Bronze Sentry##187391, Bronze Warder##187397
'|kill Time-Lost Bladewing##187232, Time-Lost Sunseeker##187239, Time-Lost Geomancer##187265, Time-Lost Briarback##187264, Time-Lost Destroyer##187244, Time-Lost Chieftain##187266
step
talk Aeonormu##190929
turnin Closing Time##66087 |goto 57.55,78.86
step
talk Andantenormu##187877
accept Catching Up to Chromie##65935 |goto 57.52,78.79
step
在青铜寺见克隆米 |q 65935/1 |goto 59.58,81.69
|tip 上去平台上。
step
talk Chromie##186711
|tip 上去平台上。
turnin Catching Up to Chromie##65935 |goto 59.58,81.69
accept Time-Locked Timewalkers##65947 |goto 59.58,81.69
accept Cracks in Time##65948 |goto 59.58,81.69
step
talk Andantenormu##186433
accept Quelling Causalities##66646 |goto Thaldraszus/0 59.55,82.70
stickystart "Slay_The_Time_Elementals"
step
解放时光行者 |q 65947/1 |goto 59.01,82.77 |count 1
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Amu'sha Skystrider##189564
step
解放时光行者 |q 65947/1 |goto 58.72,82.43 |count 2
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Suma the Guised##189520
step
解放时光行者 |q 65947/1 |goto 58.38,82.14 |count 3
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Historian Jum'Flitmo##189549
step
解放时光行者 |q 65947/1 |goto 58.13,82.83 |count 4
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Scribe Kalve##189545
step
 yank the West Crystal 的中文翻译为：拔出西部水晶 |q 65948/1
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}远离水晶{}去拉扯它。
click Temporal Crystal Chunk+
|tip 它们看起来像各种大小的蓝色矿石。
|tip 它们出现在你拉取水晶后落地周围的地面上。
收集50个时间能量 |q 65948/3 |goto 58.35,83.09 |count 50
'|clicknpc Bronze Power Crystal##189582
step
解放时光行者 |q 65947/1 |goto 60.31,81.39 |count 5
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Warden Dialash##189558
step
拔掉东水晶 |q 65948/2
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}远离水晶{}去拉扯它。
click Temporal Crystal Chunk+
|tip 它们看起来像各种大小的蓝色矿石。
|tip 它们出现在你拉取水晶后落地周围的地面上。
收集#100#时空能量 |q 65948/3 |goto 60.71,80.55 |count 100
'|clicknpc Bronze Power Crystal##192086
step
解放时光行者 |q 65947/1 |goto 60.86,80.03 |count 6
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Elo'sho Skystrider##189547
step
解放时光行者 |q 65947/1 |goto 60.45,79.74 |count 7
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Wan'she Skystrider##189562
step
解放时光行者 |q 65947/1 |goto 60.27,80.40 |count 8
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 你将被攻击。
'|clicknpc Warden Krizzik##189560
step
label "Slay_The_Time_Elementals"
在该区域击杀敌人
击败时间元素 |q 66646/1 |goto 60.51,80.57
你可以在[58.73,82.74]附近找到更多。
'|kill Timeling##186479, Time-Lost Sunseeker##201533, Timeless Causality##186464, Time-Lost Raptor##201534
step
talk Andantenormu##186433
turnin Quelling Causalities##66646 |goto Thaldraszus/0 59.55,82.70
step
talk Chromie##186711
turnin Time-Locked Timewalkers##65947 |goto 59.58,81.69
turnin Cracks in Time##65948 |goto 59.58,81.69
accept The Once and Future Team##65938 |goto 59.58,81.69
step
在神殿门泡泡上使用时光行者法杖 |q 65938/1 |goto 60.60,83.46
|tip 使用{o}时间不稳定射线{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 使用技能后，{o}沿着斜坡冲下{}去拉动气泡。
step
kill Colossal Causality##186672
|tip 看起来像一个大型火元素。
|tip 你的盟友会帮助你战斗。
击杀巨型时间元素体 |q 65938/2 |goto 60.72,83.68
step
talk Chromie##186711
turnin The Once and Future Team##65938 |goto 59.58,81.69
accept The Never-Final Countdown##65962 |goto 59.58,81.69
step
talk Chromie##186711
告诉克罗米你准备好了 |gossip 54696
与克洛米交谈 |q 65962/1 |goto 59.58,81.69
step
talk Warden Dialash##187013
fpath Temporal Conflux |goto 59.91,81.34
step
talk Nozdormu##186931
turnin The Never-Final Countdown##65962 |goto 60.05,82.45
accept Tumbling Through Time##70040 |goto 60.05,82.45
step
talk Andantenormu##185915
告诉他“诺兹多姆请求你的光临。” |gossip 55814
与安达诺穆对话 |q 70040/2 |goto 60.19,81.76
step
talk Soridormi##192403
告诉她“诺兹多姆请求你的到来。” |gossip 55789
与索瑞多姆对话 |q 70040/1 |goto 59.52,82.52
step
talk Siaszerathel##192404
告诉她“诺兹多姆请求你的到来。” |gossip 55815
与希阿瑟拉瑟交谈 |q 70040/3 |goto 59.30,82.15
step
talk Nozdormu##186931
告诉他“所有人都聚集了。” |gossip 55840
观察对话
与诺兹多姆交谈 |q 70040/4 |goto 60.05,82.45
step
talk Nozdormu##186931
turnin Tumbling Through Time##70040 |goto 60.05,82.45
accept To the Future!##66028 |goto 60.05,82.45
accept Temporal Tuning##66029 |goto 60.05,82.45
step
click Portal to the Primalist Future
穿越未来的传送门 |q 66028/1 |goto 59.83,82.24
step
进入原始者的未来 |complete zone("Primalist Tomorrow") |q 66028
step
talk Soridormi##183860
turnin To the Future!##66028 |goto Primalist Tomorrow/0 61.07,50.82
accept Resistance Isn't Futile##66030 |goto Primalist Tomorrow/0 61.07,50.82
step
talk Possible Future You##186953
accept Making Time##66031 |goto 61.46,50.19
stickystart "Heal_Injured_Resistance_Fighters"
stickystart "Collect_Elemental_Essences"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 66029/1 |goto 47.10,41.28
step
label "Heal_Injured_Resistance_Fighters"
use the Bandages##192467
|tip 在{o}受伤的抵抗战士{}身上使用它们。
|tip 他们看起来像是躺在地上的盟友。
clicknpc Injured Resistance Fighter##187341+
治疗 #10# 受伤的抵抗战士 |q 66030/1 |goto 51.12,30.48
你可以在以下地点找到更多： |notinsticky
[45.12,18.99]
[44.58,33.95]
step
label "Collect_Elemental_Essences"
在该区域击杀敌人
|tip 使用{o}佐拉伴随能力{}。
|tip {o}西亚瑟瑞斯{}将跟随你并且{o}帮助你战斗{}。
|tip 尽量专注于寻找非精英怪，以便更快完成任务。
collect 30 Elemental Essence##192454 |q 66031/1 |goto 45.91,30.57
'|kill Rimebound Controller##191654, Rimebound Subjugator##195837, Rimebound Subjugator##191658, Cragsworn Stoneshaper##191661, Hoary Icicle##194797, Colossal Glacier##194798, Vicious Rimefang##194120, Restless Icicle##194794, Cragsworn Stoneshaper##195838, Rimebound Controller##195836, Rimebound Subjugator##195837, Cragsworn Stoneshaper##195838, Cragsworn Conqueror##195839
step
talk Possible Future You##186953
|tip 上去平台上。
turnin Making Time##66031 |goto 61.46,50.20
step
talk Soridormi##183860
|tip 上去平台上。
turnin Resistance Isn't Futile##66030 |goto 61.08,50.82
accept Return to the Present##66032 |goto 61.08,50.82
step
click Portal to Temporal Conflux
归返当下 |complete zone("Thaldraszus") |goto 61.01,50.52 |q 66032
step
talk Nozdormu##186931
turnin Temporal Tuning##66029 |goto Thaldraszus/0 60.05,82.45
turnin Return to the Present##66032 |goto Thaldraszus/0 60.05,82.45
accept To the... Past?##66033 |goto Thaldraszus/0 60.05,82.45
accept Temporal Two-ning##72519 |goto Thaldraszus/0 60.05,82.45
step
click Portal to Azmerloth
前往艾斯梅洛斯的传送门 |q 66033/1 |goto 59.98,82.08
step
前往艾泽拉斯莫斯 |complete zone("Azmerloth") |q 66033
step
talk Andantenormu##187344
turnin To the... Past?##66033 |goto Azmerloth/0 59.83,66.14
accept Murloc Motes##66035 |goto Azmerloth/0 59.83,66.14
step
talk Varian Wryngrrlgulgll##183854
accept Mugurlglrlgl!##66036 |goto Azmerloth/0 59.91,65.98
|only if Alliance
stickystart "Kill_Deathling_Destroyers_Alliance"
stickystart "Collect_Temprgrlglr_Motes_Alliance"
stickystart "Kill_Deathlings_Alliance"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 72519/1 |goto 61.59,61.82
|only if Alliance
step
label "Kill_Deathling_Destroyers_Alliance"
kill 5 Deathling Destroyer##190214 |q 66036/2 |goto 60.22,65.02
|tip 它们看起来像大型金属鱼人。
|only if Alliance
step
label "Collect_Temprgrlglr_Motes_Alliance"
收集 #12# 暴风训练者魔石 |q 66035/1 |goto 60.22,65.02
|tip 它们看起来像漂浮的黄色光球。
|tip 走到他们身边收集物品。
|tip 它们将在你的小地图上出现为黄色点。
|only if Alliance
step
label "Kill_Deathlings_Alliance"
kill 25 Deathling##187342 |q 66036/1 |goto 60.22,65.02
|only if Alliance
step
talk Andantenormu##187344
turnin Murloc Motes##66035 |goto 59.83,66.14
|only if Alliance
step
talk Varian Wryngrrlgulgll##183854
turnin Mugurlglrlgl!##66036 |goto 59.91,65.98
accept Deathwingurlugull!##70373 |goto 59.91,65.98
|only if Alliance
step
观察对话
clicknpc Murloc Hopper##195209
进入投放器 |q 70373/1 |goto 59.81,65.70
|only if Alliance
step
kill Deathwingurlugull##195314 |q 70373/2 |goto 59.83,59.04
|tip 看起来像个巨大的鱼人。
|tip 使用你的动作条上的技能。
|only if Alliance
step
归来吧，瓦里安·乌瑞恩 |outvehicle |goto 59.73,65.62 |q 70373
|only if Alliance
step
talk Varian Wryngrrlgulgll##183854
turnin Deathwingurlugull!##70373 |goto 59.91,65.98
|only if Alliance
step
talk Thrallgrulgulgul##183855
accept Mugurlglrlgl!##66704 |goto Azmerloth/0 59.98,65.97
|only if Horde
stickystart "Kill_Deathling_Destroyers_Horde"
stickystart "Collect_Temprgrlglr_Motes_Horde"
stickystart "Kill_Deathlings_Horde"
step
use the Chrono Crystal##192749
|tip 在{o}大型巨龙{}在空中翻滚时使用它。
修复时间位移 |q 72519/1 |goto 61.59,61.82
|only if Horde
step
label "Kill_Deathling_Destroyers_Horde"
kill 5 Deathling Destroyer##190214 |q 66704/2 |goto 60.22,65.02
|tip 它们看起来像大型金属鱼人。
|only if Horde
step
label "Collect_Temprgrlglr_Motes_Horde"
收集 #12# 暴风训练者魔石 |q 66035/1 |goto 60.22,65.02
|tip 它们看起来像漂浮的黄色光球。
|tip 走到他们身边收集物品。
|tip 它们将在你的小地图上出现为黄色点。
|only if Horde
step
label "Kill_Deathlings_Horde"
kill 25 Deathling##187342 |q 66704/1 |goto 60.22,65.02
|only if Horde
step
talk Andantenormu##187344
turnin Murloc Motes##66035 |goto 59.83,66.14
|only if Horde
step
talk Thrallgrulgulgul##183855
turnin Mugurlglrlgl!##66704 |goto 59.98,65.97
accept Deathwingurlugull!##70371 |goto 59.98,65.97
|only if Horde
step
观察对话
clicknpc Murloc Hopper##195209
进入投放器 |q 70371/1 |goto 59.81,65.70
|only if Horde
step
kill Deathwingurlugull##195314 |q 70371/2 |goto 59.83,59.04
|tip 看起来像个巨大的鱼人。
|tip 使用你的动作条上的技能。
|only if Horde
step
重返萨尔戈鲁古古尔 |outvehicle |goto 59.73,65.62 |q 70371
|only if Horde
step
talk Thrallgrulgulgul##183855
turnin Deathwingurlugull!##70371 |goto 59.98,65.97
|only if Horde
step
talk Andantenormu##187344
accept Back to Reality##66037 |goto Azmerloth/0 59.83,66.14
step
click Portal to Temporal Conflux
归返当下 |complete zone("Thaldraszus") |goto 59.72,66.11 |q 66037
step
talk Nozdormu##186931
turnin Back to Reality##66037 |goto Thaldraszus/0 60.05,82.45
turnin Temporal Two-ning##72519 |goto Thaldraszus/0 60.05,82.45
accept On Your Mark... Get Set...##66660 |goto Thaldraszus/0 60.05,82.45
step
click Portal to The Gnoll War
通过时间传送门前往犬人战争 |q 66660/1 |goto 59.92,82.19
step
穿越时空 |complete zone("The Gnoll War") |q 66660
step
talk Andantenormu##187435
turnin On Your Mark... Get Set...##66660 |goto The Gnoll War/0 43.38,69.22
step
_NOTE:_
在下一个任务期间
|tip 下一个任务是一个限时任务。
|tip 你将在多个区域沿着通往黄色旋转传送门的道路行进。
|tip 走入黄色旋转传送门以前往下一个区域。
|tip 当你前往传送门时，{o}走入那白光的柱子{}。
|tip 他们会提升你的速度。
|tip 避开地面的圈圈，它们会减慢你的速度。
点击此处继续 |confirm |q 66038 |future
step
talk Andantenormu##187435
accept Race Through Time!##66038 |goto 43.38,69.22
step
前往沙尘战争 |complete zone("War of the Shifting Sands") |goto 32.38,49.69 |q 66038
step
前往熊猫人革命 |complete zone("Pandaren Revolution") |goto War of the Shifting Sands/0 39.55,76.76 |q 66038
step
穿越时空赛跑 |q 66038/1 |goto Pandaren Revolution/0 15.18,58.51
step
talk Andantenormu##187435
turnin Race Through Time!##66038 |goto The Black Empire/0 52.35,73.75
accept Chromie Time##66039 |goto The Black Empire/0 52.35,73.75
step
沿着道路冲向楼梯 |goto 57.63,59.33 < 20 |only if walking
use the Chrono Crystal##192749
|tip 在{o}克罗米{}附近使用它。
|tip 她看起来像一只巨大的黄色龙在空中翻滚。
修复时间位移 |q 66039/1 |goto 53.87,43.43
'|clicknpc Chromie##186499
step
talk Chromie##186499
|tip 她飞下去，走到这个地点。
turnin Chromie Time##66039 |goto 53.40,43.97
accept Back to the Future##66040 |goto 53.40,43.97
step
talk Chromie##186499
告诉她“让我们开始吧！” |gossip 54816
|tip 如果其他玩家已经开始了这个任务，你可能无法与她对话。
击杀波浪袭来的敌人
|tip 使用{o}时空位移{}技能。
|tip 它在屏幕上显示为一个按钮。
|tip 这会对敌人造成伤害并强化你。
保护你的盟友 |q 66040/2 |goto 53.40,43.97
'|kill Winged Ruin##191399, Aqir Harbinger##191400, Grotesque Bulwark##191398
step
归返当下 |complete zone("Thaldraszus") |q 66040
step
talk Chromie##183972
悄悄问克罗米诺兹多姆还好吗 |gossip 55119
与克隆妮确认 |q 66040/3 |goto Thaldraszus/0 60.08,82.41
step
talk Nozdormu##186931
turnin Back to the Future##66040 |goto 60.05,82.45
accept Moving On##66221 |goto 60.05,82.45
step
talk Nozdormu##187669
|tip 在塔顶上。
turnin An Anomalous Shrine##67093 |goto Valdrakken/0 61.47,39.09
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
告诉她“所有的誓石都已经恢复。” |gossip 107528
与艾露恩交谈 |q 66221/1 |goto 58.12,34.87
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin Moving On##66221 |goto 58.12,34.87
step
talk Vesri##189339
|tip 在石质平台上，俯瞰水面。
fpath Algeth'era |goto Thaldraszus/0 49.47,41.94
step
talk Officer Obernax##189237
|tip 在石质平台上，俯瞰水面。
fpath Veiled Ossuary |goto 62.07,18.93
step
talk Nirazal##193508
|tip 在一块石质平台上，俯瞰着熔岩。
fpath Vault of the Incarnates |goto 72.14,56.45
step
|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (All Zones)",{
author="support@zygorguides.com",
achieveid={16575,16576,16577,16578,17411},
},[[
step
_NOTE:_
龙纹与龙骑技能
|tip 龙纹看起来像是大型圆形的金色符文，漂浮在空中，分布在整个大陆上。
|tip 你骑着龙翼坐骑飞过它们来收集。
|tip 收集它们会给你龙骑技能点，可以用来提升你的龙骑能力。
|tip 本指南将带你收集所有的龙符文，以便你能快速提升你的龙骑技能。
|tip 随着你收集龙文符文，要花费技能点，请点击小地图上的“巨龙群岛汇总”按钮，然后点击“龙骑技能与解锁”下的“查看”按钮。
点击此处继续 |confirm
step
收集龙纹：翼栖大使馆 |achieve 15986 |goto The Waking Shores/0 74.87,37.40 |notravel
|tip 塔顶孔洞之上。
step
收集龙纹：碎鳞峰 |achieve 16052 |goto 73.20,20.51 |notravel
|tip 巅峰之上
step
收集龙形符文：生命绑定者天文台 |achieve 15990 |goto 52.63,17.06 |notravel
|tip 在建筑顶部之上
step
收集龙的符文：龙心前哨站 |achieve 16051 |goto 69.25,46.19 |notravel
|tip 在破碎塔的内部，接近顶部。
step
收集龙之铭文：天顶天文台塔 |achieve 15985 |goto 75.27,57.04 |notravel
|tip 塔顶之上
step
收集龙纹：天顶天文台高台 |achieve 16668 |goto 74.34,57.59 |notravel
|tip 近地面
step
收集龙文：破碎生命拱道 |achieve 15991 |goto 57.64,54.98 |notravel
|tip 在墙壁的拱顶内部。
step
收集龙文符文：喷涌春季 |achieve 15989 |goto 46.40,52.12 |notravel
|tip 巅峰之上
step
收集巨龙符文：黑曜石宝座 |achieve 16053 |goto 21.91,51.48 |notravel
|tip 在一潭岩浆之上。
step
收集龙族符文：黑曜石壁垒 |achieve 15987 |goto 40.97,71.88 |notravel
|tip 在巨大红色石柱顶部之上。
step
收集龙符文：红宝石生命池山脉 |achieve 15988 |goto 54.46,74.22 |notravel
|tip 山巅之上
step
收集龙文：闪霜飞地 |achieve 16669 |goto 58.11,78.64 |notravel
|tip 在地面附近，草坡边缘。
step
收集龙形符文：红鳞前哨站 |achieve 16670 |goto The Waking Shores/0 48.81,86.61 |notravel
|tip 桥上方，地面附近。
step
收集龙符文：泥木沼泽 |achieve 16671 |goto Ohn'ahran Plains/0 78.38,21.26 |notravel
|tip 近地面，树上方。
step
收集龙形符文：鲁兹塔尔区域 |achieve 16062 |goto 86.48,39.42 |notravel
|tip 在建筑之上，位于山峰之巅。
step
收集龙之符文：奥纳哈拉的栖息地 |achieve 16054 |goto 57.94,31.20 |notravel
|tip 在巨型猫头鹰雕像上方，位于山顶。
step
收集龙纹：诺库顿堡 |achieve 16055 |goto 30.63,36.12 |notravel
|tip 在山峰顶端附近。
step
收集龙符文：翡翠花园 |achieve 16056 |goto 30.16,61.28 |notravel
|tip 瀑布之巅。
step
收集龙符文：永恒库尔干 |achieve 16057 |goto 29.50,75.24 |notravel
|tip 高空，靠近山脉。
step
收集龙纹：萨尔·斯基莱斯 |achieve 16058 |goto 44.63,64.73 |notravel
|tip 在破碎塔的顶端。
step
收集龙符文：天空之镜 |achieve 16059 |goto 47.26,72.24 |notravel
|tip 高空之中，近山之处。
step
收集龙纹：奥尼尔泉 |achieve 16060 |goto 57.15,80.15 |notravel
|tip 高空之中，近山之处。
step
收集龙符文：风歌高地 |achieve 16063 |goto 61.49,64.30 |notravel
|tip 高悬于空中，山上之上。
step
收集龙纹：龙泉峰 |achieve 16061 |goto The Azure Span/0 46.57,21.71 |notravel
|tip 在空中高处，靠近瀑布的墙壁。
step
收集龙形符文：钴蓝议会 |achieve 16064 |goto The Azure Span/0 45.86,25.80 |notravel
|tip 塔顶之上
step
收集龙纹：分叉河交汇处 |achieve 16672 |goto Ohn'ahran Plains/0 70.13,86.70 |notravel
|tip 在空中，悬浮于道路之上。
step
收集龙形符文：溪牙巢穴 |achieve 16069 |goto The Azure Span/0 26.73,31.70 |notravel
|tip 在破碎树顶之上。
step
收集龙形符文：蕨隐洞 |achieve 16068 |goto 10.38,35.84 |notravel
|tip 高高在上，靠近山顶的高大树木。
step
收集龙形符文：青色档案馆 |achieve 16065 |goto 39.25,62.99 |notravel
|tip 高空中，靠近最高的浮空平台和巨大的紫色水晶。
step
收集龙符文：泽尔萨克前哨站 |achieve 16071 |goto 52.97,49.06 |notravel
|tip 靠近大树，约在树干中部。
step
收集龙符: Imbu |achieve 16070 |goto 60.61,70.11 |notravel
|tip 高空中的悬崖旁边，低瀑布上方。
step
收集龙符文：卡尔萨遗址 |achieve 16066 |goto 68.65,60.38 |notravel
|tip 在破碎塔的顶端。
step
收集龙纹：失落的遗迹 |achieve 16067 |goto 70.56,46.26 |notravel
|tip 在塔顶的开放房间内。
step
收集龙形符文：瓦克索斯山脉 |achieve 16073 |goto 72.57,39.69 |notravel
|tip 高高在上，冰原之巅。
step
收集龙纹：卡尔萨斯堡垒 |achieve 16072 |goto 67.64,29.12 |notravel
|tip 穿过塔顶侧面的洞。
step
收集龙纹：堕落之路 |achieve 16673 |goto 56.82,16.07 |notravel
|tip 近地面，路上方。
step
收集龙符文：南门 |achieve 16100 |goto Thaldraszus/0 35.57,85.53 |notravel
|tip 在塔顶的开放房间内。
step
收集龙纹：暴风霜峰 |achieve 16099 |goto 46.10,73.97 |notravel
|tip 巅峰之上
step
收集龙纹：瓦尔德拉肯 |achieve 16101 |goto Valdrakken/0 59.22,38.05 |notravel
|tip 塔顶之上
step
收集龙徽：阿尔盖萨 |achieve 16102 |goto Thaldraszus/0 49.89,40.32 |notravel
|tip 塔顶之上
step
收集龙形glyph：提尔霍尔德 |achieve 16103 |goto 61.56,56.61 |notravel
|tip 在巨大的漂浮岩石之上。
step
收集龙纹：吉利凯尔瞭望台 |achieve 16666 |goto 52.69,67.46 |notravel
|tip 桥上方
step
收集龙纹：时间通道 |achieve 16667 |goto  55.69,72.21 |notravel
|tip 高空中，靠近巨石拱门。
step
收集龙符文：时间交汇 |achieve 16098 |goto 66.01,82.34 |notravel
|tip 在塔顶的开放房间内。
step
收集龙纹：塔尔德拉祖斯巅峰 |achieve 16107 |goto 72.95,69.19 |notravel
|tip 巅峰之上
step
收集龙文符文：化身之 Vault |achieve 16106 |goto 72.39,51.51 |notravel
|tip 在一潭岩浆之上。
step
收集龙纹：阿尔盖萨学院 |achieve 16104 |goto 62.41,40.41 |notravel
|tip 在塔顶的大开放房间内，靠近天花板。
step
收集龙纹：隐秘骨灰堂 |achieve 16105 |goto 67.10,11.76 |notravel
|tip 塔顶的大开放房间内。
step
收集龙符文：爪牙岗哨 |achieve 17411/2 |goto The Forbidden Reach/5 20.58,91.36 |notravel
|tip 在塔的基地。
step
收集龙符文：战争营地 |achieve 17411/6 |goto 48.53,68.96 |notravel
|tip 在山顶上
step
收集龙纹：爪领主的栖息地 |achieve 17411/7 |goto 59.04,65.09 |notravel
|tip 在塔的顶端内部
step
收集龙纹：风暴撕裂山 |achieve 17411/5 |goto 77.27,55.13 |notravel
step
收集龙之符文：龙骨岛 |achieve 17411/4 |goto 79.46,32.65 |notravel
|tip 树下深处
step
收集龙符文：碎石库 |achieve 17411/3 |goto 62.54,32.43 |notravel
|tip 在塔顶的穹顶下。
step
收集龙形符文：疗愈者的火山 |achieve 17411/8 |goto 37.72,30.61 |notravel
|tip 在塔的顶端内部
step
收集龙纹：北风点 |achieve 17411/1 |goto 18.32,13.22 |notravel
|tip 进入破碎塔内。
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Dragonriding World Tour",{
author="support@zygorguides.com",
description="This guide will walk you through completing the normal and advanced dragonriding racing quests.",
startlevel=60,
patch='100002',
},[[
step
完成龙纹指南
|tip 你需要解锁所有龙骑术能力才能继续。
点击此处继续 |confirm
|tip
点击这里加载“龙印（所有区域）”指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (All Zones)" |q 72488 |future
step
talk Celormu##193411
accept The Waking Shores Tour##72481 |goto The Waking Shores/0 73.25,52.06
step
talk Bronze Timekeeper##190123
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在红宝石生命 shrine 循环中获得青铜奖牌 |q 72481/1 |goto 63.32,70.91
step
talk Bronze Timekeeper##190326
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在霜路飞行赛中获得青铜奖牌 |q 72481/7 |goto 62.77,74.00
step
talk Bronze Timekeeper##190473
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在荒野保护区获得铜牌滑行 |q 72481/2 |goto 47.01,85.58
step
talk Bronze Timekeeper##190503
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在野外保护区赛道获得铜牌 |q 72481/8 |goto 42.59,94.45
step
talk Bronze Timekeeper##190519
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在炽流飞行中获得青铜牌 |q 72481/3 |goto 41.97,67.30
step
talk Bronze Timekeeper##190551
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在顶峰树冠河流竞赛中获得青铜级别 |q 72481/4 |goto 23.26,84.30
step
talk Bronze Timekeeper##190667
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在乌克图鲁特过山车中获得铜牌 |q 72481/5 |goto 55.45,41.13
step
talk Bronze Timekeeper##190753
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在翼息环道获得青铜奖牌 |q 72481/6 |goto 73.19,33.93
step
talk Celormu##193411
turnin The Waking Shores Tour##72481 |goto The Waking Shores/0 73.25,52.06
accept The Ohn'ahran Plains Tour##72483 |goto The Waking Shores/0 73.25,52.06
step
talk Bronze Timekeeper##190928
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在阳光沐浴的林地赛道中获得青铜奖 |q 72483/1 |goto Ohn'ahran Plains/0 63.74,30.52
step
talk Bronze Timekeeper##191422
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 迅速穿越9个环并返回起点。
|tip 绿色魔珠恢复你的活力。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
在玛鲁基冲刺中获得铜牌 |q 72483/5 |goto Ohn'ahran Plains/0 59.93,35.55
step
talk Bronze Timekeeper##191247
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在翡翠花园升降中获得铜牌 |q 72483/4 |goto Ohn'ahran Plains/0 25.71,55.07
step
talk Bronze Timekeeper##196092
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在河流急湍航线获得青铜级 |q 72483/7 |goto 43.74,66.78
step
talk Bronze Timekeeper##191511
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 迅速穿越9个环并返回起点。
|tip 绿色魔珠恢复你的活力。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
在天空之镜中获得铜牌 |q 72483/6 |goto Ohn'ahran Plains/0 47.48,70.63
step
talk Bronze Timekeeper##191165
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在深渊河流赛道获得铜牌 |q 72483/3 |goto Ohn'ahran Plains/0 80.89,72.20
step
talk Bronze Timekeeper##191121
|tip 在塔的顶端。
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在芬飞行比赛中获得青铜奖 |q 72483/2 |goto Ohn'ahran Plains/0 86.26,35.82
step
talk Celormu##199118
turnin The Ohn'ahran Plains Tour##72483 |goto Ohn'ahran Plains/0 88.09,36.28
accept The Azure Span Tour##72485 |goto Ohn'ahran Plains/0 88.09,36.28
step
talk Bronze Timekeeper##191947
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在碧蓝生境滑雪中获得铜牌 |q 72485/2 |goto The Azure Span/0 20.95,22.63
step
talk Bronze Timekeeper##192886
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在伊斯卡拉巡赛中获得铜奖 |q 72485/4 |goto The Azure Span/0 16.58,49.37
step
talk Bronze Timekeeper##193027
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在档案领域获得青铜奖 |q 72485/6 |goto The Azure Span/0 42.27,56.77
step
talk Bronze Timekeeper##194372
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在 azure span 冲刺中获得青铜奖牌 |q 72485/1 |goto The Azure Span/0 47.91,40.79
step
talk Bronze Timekeeper##192945
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在霜冻之地飞行获得铜牌 |q 72485/5 |goto The Azure Span/0 48.47,35.79
step
talk Bronze Timekeeper##192115
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免在熔岩区域附近接触火焰橙球。
在瓦克索斯高地获得青铜奖牌 |q 72485/3 |goto The Azure Span/0 71.29,24.64
step
talk Celormu##199119
turnin The Azure Span Tour##72485 |goto The Azure Span/0 63.16,13.65
accept The Thaldraszus Tour##72487 |goto The Azure Span/0 63.16,13.65
step
talk Bronze Timekeeper##194348
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在花园游荡中获得青铜奖牌 |q 72487/5 |goto Thaldraszus/0 39.50,76.19
step
talk Bronze Timekeeper##192555
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在流动森林飞行中获得铜牌 |q 72487/1 |goto Thaldraszus/0 57.77,75.01
step
talk Bronze Timekeeper##193651
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在泰尔霍德试炼中获得青铜奖牌 |q 72487/2 |goto Thaldraszus/0 57.24,66.90
step
talk Bronze Timekeeper##193951
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在学院高地获得青铜奖牌 |q 72487/4 |goto Thaldraszus/0 60.29,41.59
step
talk Bronze Timekeeper##194372
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在洞穴交叉路线获得铜牌 |q 72487/6 |goto Thaldraszus/0 58.06,33.62
step
talk Bronze Timekeeper##193911
|tip 塔内探险
告诉他我想尝试这个副本。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在悬崖赛道中获得青铜奖牌 |q 72487/3 |goto Thaldraszus/0 37.65,48.93
step
talk Celormu##199120
turnin The Thaldraszus Tour##72487 |goto Thaldraszus/0 46.04,63.03
accept The Waking Shores Advanced Tour##72482 |goto Thaldraszus/0 46.04,63.03
step
以下步骤需要高级驾驶技能
|tip 你需要持续保持非常高的移动速度。
|tip 课程中通常会有浮动障碍物需要避开，这将导致你的飞行停滞。
|tip 在你的路径上收集所有绿色球体是获得黄金评级的关键。
|tip 确保在比赛路径上捕捉到每一阵风潮。
点击此处继续 |confirm |q 72488 |future
step
talk Bronze Timekeeper##190123
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级红宝石生命之泉循环中获得青铜奖牌 |q 72482/1 |goto The Waking Shores/0 63.32,70.91
step
talk Bronze Timekeeper##190326
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级霜冻飞行中获得铜牌 |q 72482/7 |goto 62.77,74.00
step
talk Bronze Timekeeper##190473
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级野外保护区的障碍赛中获得铜牌 |q 72482/2 |goto 47.01,85.58
step
talk Bronze Timekeeper##190503
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级野生保护区赛道中获得铜牌 |q 72482/8 |goto 42.59,94.45
step
talk Bronze Timekeeper##190519
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 躲避喷射到空中的熔岩喷流。
在高级火焰流飞行中获得铜牌 |q 72482/3 |goto 41.97,67.30
step
talk Bronze Timekeeper##190551
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级顶尖树冠河流竞速中获得铜牌 |q 72482/4 |goto 23.26,84.30
step
talk Bronze Timekeeper##190667
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级乌克图鲁特过山车中获得铜牌 |q 72482/5 |goto 55.45,41.13
step
talk Bronze Timekeeper##190753
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级翼风环道获得青铜奖章 |q 72482/6 |goto 73.19,33.93
step
talk Celormu##193411
turnin The Waking Shores Advanced Tour##72482 |goto The Waking Shores/0 73.25,52.06
accept The Ohn'ahran Plains Advanced Tour##72484 |goto The Waking Shores/0 73.25,52.06
step
talk Bronze Timekeeper##190928
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在进阶日光林地赛道中获得青铜奖。 |q 72484/1 |goto Ohn'ahran Plains/0 63.74,30.52
step
talk Bronze Timekeeper##191247
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级翡翠花园上升获得青铜奖 |q 72484/4 |goto Ohn'ahran Plains/0 25.71,55.07
step
talk Bronze Timekeeper##196092
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级急流赛道中获得青铜奖 |q 72484/5 |goto 43.74,66.78
step
talk Bronze Timekeeper##191165
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级峡谷河流竞速中获得铜牌 |q 72484/3 |goto Ohn'ahran Plains/0 80.89,72.20
step
talk Bronze Timekeeper##191121
|tip 在塔的顶端。
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级芬飞越中获得铜牌 |q 72484/2 |goto Ohn'ahran Plains/0 86.26,35.82
step
talk Celormu##199118
turnin The Ohn'ahran Plains Advanced Tour##72484 |goto Ohn'ahran Plains/0 88.09,36.28
accept The Azure Span Advanced Tour##72486 |goto Ohn'ahran Plains/0 88.09,36.28
step
talk Bronze Timekeeper##191947
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在进阶阿祖斯潘滑雪赛中获得铜牌 |q 72486/2 |goto The Azure Span/0 20.95,22.63
step
talk Bronze Timekeeper##192886
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级伊斯卡拉之旅中获得青铜奖牌 |q 72486/4 |goto The Azure Span/0 16.58,49.37
step
talk Bronze Timekeeper##193027
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级档案领域获得铜牌 |q 72486/6 |goto The Azure Span/0 42.27,56.77
step
talk Bronze Timekeeper##194372
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级青色水域冲刺中获得青铜奖 |q 72486/1 |goto The Azure Span/0 47.91,40.79
step
talk Bronze Timekeeper##192945
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级霜冻之地飞越中获得青铜奖章 |q 72486/5 |goto The Azure Span/0 48.47,35.79
step
talk Bronze Timekeeper##192115
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免在熔岩区域附近接触火焰橙球。
在高级瓦克索斯之巅获得青铜奖励 |q 72486/3 |goto The Azure Span/0 71.29,24.64
step
talk Celormu##199119
turnin The Azure Span Advanced Tour##72486 |goto The Azure Span/0 63.16,13.65
accept The Thaldraszus Advanced Tour##72488 |goto The Azure Span/0 63.16,13.65
step
talk Bronze Timekeeper##194348
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级花园漫游中获得铜牌 |q 72488/5 |goto Thaldraszus/0 39.50,76.19
step
talk Bronze Timekeeper##192555
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在进阶流动森林飞行中获得青铜奖牌 |q 72488/1 |goto Thaldraszus/0 57.77,75.01
step
talk Bronze Timekeeper##193651
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免在熔岩区域附近接触火焰橙球。
在高级泰尔霍德试炼中获得青铜奖牌 |q 72488/2 |goto Thaldraszus/0 57.24,66.90
step
talk Bronze Timekeeper##193951
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级学院晋升中获得青铜奖牌 |q 72488/4 |goto Thaldraszus/0 60.29,41.59
step
talk Bronze Timekeeper##194372
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
在高级洞穴交叉中获得铜牌 |q 72488/6 |goto Thaldraszus/0 58.06,33.62
step
talk Bronze Timekeeper##193911
|tip 塔内探险
告诉他我想尝试进阶课程。
|tip 比赛将在几秒钟后开始。
|tip 你将以半生机开始。
|tip 绿色法球将恢复一个活力。
|tip 保持“冲锋前进”的快节奏对于赚取黄金时间至关重要。
|tip 沿着指示的路径飞行，穿过光环和你看到的任何风道。
|tip 勤奋使用你的龙骑能力以保持快速的节奏。
|tip 当前路径呈橙色，而未来路径呈蓝色。
|tip 避免沿途的大紫色法球。
在高级悬崖赛道中获得铜牌 |q 72488/3 |goto Thaldraszus/0 37.65,48.93
step
talk Celormu##199120
turnin The Thaldraszus Advanced Tour##72488 |goto Thaldraszus/0 46.04,63.03
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Dragonflight Campaign",{
author="support@zygorguides.com",
description="This guide will walk you through completing the various chapters of the Dragonflight campaign.",
condition_suggested=function() return level >= 68 and not completedallq(67084,66128,66444,66547,66402,69888) end,
startlevel=68,
patch='100002',
},[[
step
达到68级 |ding 68
|tip 使用升级指南来完成这个任务。
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
accept Renown of the Dragon Isles##71232 |goto Valdrakken/0 58.00,34.60
step
talk Koszaru##213930
turnin Renown of the Dragon Isles##71232 |goto Valdrakken/0 48.12,58.64
accept Open Orientation##72585 |goto Valdrakken/0 48.12,58.64
step
talk Unatos##193015
|tip 建筑内部，一楼。
accept Orientation: Valdrakken##72406 |goto 58.16,35.11
step
talk Kaestrasz##185561
见龙族手稿与护甲供应商 |q 72406/2 |goto 46.67,78.94
step
talk Dothenos##191000
会见交易协调员 |q 72406/3 |goto Valdrakken/0 36.38,63.01
step
talk Provisioner Thom##193659
|tip 在建筑物内。
见装备供应商 |q 72406/1 |goto 36.57,50.64
step
talk Unatos##193015
|tip 建筑内部，一楼。
turnin Orientation: Valdrakken##72406 |goto 58.17,35.12
step
talk Naleidea Rivergleam##186869
accept Orientation: Dragonscale Basecamp##72397 |goto The Waking Shores/0 47.88,82.41
step
talk Rae'ana##188265
与学者供给者会面 |q 72397/1 |goto 47.92,82.08
step
talk Granpap Whiskers##187408
见面目录商人 |q 72397/2 |goto 47.73,83.23
step
talk Pathfinder Jeb##187700
探险者供应商见面会 |q 72397/3 |goto 47.33,83.40
step
talk Boss Magor##189065
见工匠供应商 |q 72397/4 |goto 46.94,82.89
step
talk Cataloger Jakes##189226
|tip 在建筑物内。
会见声望守护者 |q 72397/5 |goto 47.11,82.57
step
talk Toddy Whiskers##187276
|tip 在建筑物内。
turnin Orientation: Dragonscale Basecamp##72397 |goto 47.22,82.73
step
talk Sansok Khan##191283
accept Orientation: Maruukai##72429 |goto Ohn'ahran Plains/0 63.41,41.39
step
talk Quartermaster Huseng##196707
|tip 在建筑物内。
见到声望供应商 |q 72429/2 |goto 60.40,37.72
step
talk Agari Dotur##185179
|tip 在建筑物内。
会见声望守护者 |q 72429/1 |goto 60.40,37.66
step
talk Agari Dotur##185179
|tip 在建筑物内。
turnin Orientation: Maruukai##72429 |goto 60.40,37.66
step
talk Murik##193006
accept Orientation: Iskaara##72435 |goto The Azure Span/0 13.14,49.26
step
talk Arvik##186449
见装备供应商 |q 72435/1 |goto 12.90,48.82
step
talk Norukk##196544
相见龙学者 |q 72435/4 |goto 12.93,48.62
step
talk Tatto##186462
会见坐骑供应商 |q 72435/3 |goto 13.80,49.73
step
talk Rokkutuk##194059
遇见食谱供应商 |q 72435/2 |goto 13.91,50.08
step
talk Murik##193006
turnin Orientation: Iskaara##72435 |goto 13.14,49.26
step
talk Koszaru##213930
turnin Open Orientation##72585 |goto Valdrakken/0 48.12,58.64
accept Learning Ingenuity##72773 |goto Valdrakken/0 48.12,58.64
step
ding 70
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
accept To Tyrhold##70437 |goto Valdrakken/0 58.11,34.87
step
talk Alexstrasza the Life-Binder##187678
告诉她“我已准备好。” |gossip 107526
与亚历瑟拉斯对话 |q 70437/1 |goto Valdrakken/0 58.11,34.87
step
前往提尔霍德 |q 70437/2 |goto Thaldraszus/0 57.46,58.73
step
talk Skygazer Paatu##186443
turnin To Tyrhold##70437 |goto 57.46,58.73
accept Aspect Power##66675 |goto 57.46,58.73
step
talk Alexstrasza the Life-Binder##187658
告诉她“我准备好开始了。” |gossip 55436
开始仪式 |q 66675/1 |goto 57.46,58.73
step
kill Ezrigeth##187666 |q 66675/2 |goto 57.64,58.40
step
观察对话
talk Nozdormu##192455
turnin Aspect Power##66675 |goto 57.45,59.07
accept Red Dawn##67073 |goto 57.45,59.07
step
talk Alexstrasza the Life-Binder##190902
turnin Red Dawn##67073 |goto 72.51,56.16
step
talk Greyzik Cobblefinger##196066
turnin Learning Ingenuity##72773 |goto Valdrakken/0 84.21,54.39
accept Jump-Start? Jump-Starting!##70180 |goto 84.21,54.39
step
clicknpc Goblin Gyrocopter##196104
驾驶地精飞行器 |q 70180/1 |goto 84.73,54.77
step
超载设备 |q 70180/2 |goto 84.04,53.56
|tip 使用 {o}电磁飞弹 2000{}技能。
|tip 重复射击地面的控制台。
step
从飞行器中弹射出去 |q 70180/3 |goto 84.04,53.56
|tip 使用 {o}弹射!{} 技能。
step
click Engine of Innovation
激活创新引擎 |q 70180/4 |goto 84.04,53.56
step
talk Maiden of Inspiration##196475
turnin Jump-Start? Jump-Starting!##70180 |goto 84.35,53.56
accept In Tyr's Footsteps##70845 |goto 84.35,53.56
step
click Ornamental Statue
turnin In Tyr's Footsteps##70845 |goto The Azure Span/0 67.18,30.72
accept First Challenge of Tyr: Finesse##70181 |goto 67.18,30.72
step
clicknpc Maiden of Inspiration##194533
观察对话
|tip 你将被{o}发射到空中{}。
|tip 你需要在附近的空中穿过大型发光光环。
与灵感之女交谈以开始 |q 70181/1 |goto 67.13,30.92
step
飞越#10#个光环 |q 70181/2 |goto 66.14,29.94
|tip 使用{o}提升{}按钮技能来{o}恢复高度{}。
|tip 你有 {o}2分钟{} 来完成这个。
|tip 如果{o}时间到期{}，你将{o}跌倒在地{}。
step
talk Maiden of Inspiration##195827
turnin First Challenge of Tyr: Finesse##70181 |goto 67.12,30.92
accept The Sweet Taste of Victory##70182 |goto 67.12,30.92
step
观察对话
click Portal to Valdrakken
返回瓦尔德拉肯 |complete zone("Valdrakken") |goto The Azure Span/0 67.18,30.92 |q 70182
step
回归创新引擎 |q 70182/1 |goto Valdrakken/0 84.34,53.54
step
talk Maiden of Inspiration##196475
turnin The Sweet Taste of Victory##70182 |goto Valdrakken/0 84.34,53.54
accept Fueling the Engine##70633 |goto Valdrakken/0 84.34,53.54
step
使用瓶装灵魂增强引擎 |q 70633/1 |goto 84.34,53.54
|tip 使用‘创造灵巧火花’按钮技能。
step
talk Maiden of Inspiration##196475
turnin Fueling the Engine##70633 |goto 84.34,53.54
accept In Tyr's Footsteps: The Ohn'ahran Plains##70339 |goto 84.34,53.54
step
talk Greyzik Cobblefinger##196066
accept Crafting Orders##72783 |goto 85.02,54.45
step
talk Head Clerk Mimzy Sprazzlerock##185542
查看米姆齐·斯普拉泽洛克的制作订单 |q 72783/1 |goto 34.59,63.03
step
_Click the Complete Quest Box_
turnin Crafting Orders##72783
step
click Ornamented Statue
turnin In Tyr's Footsteps: The Ohn'ahran Plains##70339 |goto Ohn'ahran Plains/0 66.14,55.21
accept Second Challenge of Tyr: Might##70376 |goto 66.14,55.21
step
talk Maiden of Inspiration##195088
告诉她“我准备好开始了。” |gossip 56368
与灵感之女对话 |q 70376/2 |goto 66.28,55.33
step
击杀波次攻击的敌人
|tip 使用{o}加速治疗{}按钮技能进行{o}瞬间治疗{}。
kill Proto Dragon##195177
击败敌人 |q 70376/1 |goto 66.28,55.33
'|kill Centaur Fighter##194950, Fire Primalist##195130, Djaradin Warrior##195175
step
talk Maiden of Inspiration##195924
turnin Second Challenge of Tyr: Might##70376 |goto 66.28,55.33
accept Well Earned Victory##70341 |goto 66.28,55.33
step
观察对话
click Portal to Valdrakken
返回瓦尔德拉肯 |complete zone("Valdrakken") |goto Ohn'ahran Plains/0 66.26,55.40 |q 70341
step
回归创新引擎 |q 70341/1 |goto Valdrakken/0 84.34,53.54
step
talk Maiden of Inspiration##196475
turnin Well Earned Victory##70341 |goto Valdrakken/0 84.34,53.54
accept In Tyr's Footsteps: The Waking Shores##70650 |goto Valdrakken/0 84.34,53.54
step
进入洞穴 |goto The Waking Shores/0 63.87,40.95 < 20 |walk
talk Maiden of Inspiration##196475
|tip 洞内探险
turnin In Tyr's Footsteps: The Waking Shores##70650 |goto The Waking Shores/0 64.05,41.48
accept Third Challenge of Tyr: Persistence##70509 |goto The Waking Shores/0 64.05,41.48
step
观察对话
|tip 洞内探险
talk Maiden of Inspiration##195558
问她“发生了什么？” |gossip 63890
与灵感之女对话 |q 70509/1 |goto The Waking Shores/0 64.10,41.39
step
观察对话
|tip 洞内探险
观影投影 |q 70509/2 |goto The Waking Shores/0 64.10,41.39
step
click Broken Head##380940
|tip 在建筑物内。
恢复破碎的头颅 |q 70509/3 |goto 66.35,34.88
step
click Broken Arm##380941
找回断臂 |q 70509/4 |goto 64.44,34.29
step
kill Qalashi Marauder##195678
|tip 他在这个区域游荡。
寻找破碎的魔法水晶 |q 70509/5 |goto 65.60,32.69
step
进入洞穴 |goto The Waking Shores/0 63.87,40.95 < 20 |walk
click Broken Ornamented Statue
|tip 洞内探险
修复雕像 |q 70509/6 |goto 64.05,41.48
step
talk Maiden of Inspiration##195737
|tip 洞内探险
turnin Third Challenge of Tyr: Persistence##70509 |goto 64.10,41.39
accept Third Challenge of Tyr: Persistence Embodied##70621 |goto 64.10,41.39 |instant
accept Victorious##70510 |goto 64.10,41.39
step
click Portal to Valdrakken
|tip 洞内探险
使用传送门 |q 70510/2 |goto The Waking Shores/0 64.05,41.37
step
回归创新引擎 |q 70510/1 |goto Valdrakken/0 84.34,53.55
step
talk Maiden of Inspiration##196475
turnin Victorious##70510 |goto Valdrakken/0 84.34,53.55
accept Fourth Challenge of Tyr: Resourcefulness##70881 |goto Valdrakken/0 84.34,53.55
step
_Inside the Halls of Infusion Dungeon:_
kill Watcher Irideus##189719
|tip 使用{o}灌注大厅{}副本指南。
collect Irideus' Power Core##200108 |q 70881/1 |goto Halls of Infusion/0 61.58,35.28
step
_Inside the Halls of Infusion Dungeon:_
kill Primal Tsunami##189729 |q 70881/2 |goto Halls of Infusion/1 42.76,47.50
|tip 使用{o}灌注大厅{}副本指南。
step
talk Maiden of Inspiration##196475
turnin Fourth Challenge of Tyr: Resourcefulness##70881 |goto Valdrakken/0 84.34,53.55
accept Fifth Challenge of Tyr: Ingenuity##70899 |goto Valdrakken/0 84.35,53.55
step
use Irideus' Power Core##200120
|tip 对看起来像金属傀儡的敌人使用它。
调和艾瑞德斯能量核心 |q 70899/1 |goto Thaldraszus/0 58.66,58.28
'|clicknpc Malfunctioning Protector##198343, Custodial Protector##192694
step
talk Maiden of Inspiration##196475
turnin Fifth Challenge of Tyr: Ingenuity##70899 |goto Valdrakken/0 84.35,53.56
accept Innovating the Engine##70900 |goto Valdrakken/0 84.35,53.56
step
替换能量核心 |q 70900/1 |goto 84.34,53.57
|tip 使用 {o}插入能量核心{} 技能按钮。
step
talk Maiden of Inspiration##196475
turnin Innovating the Engine##70900 |goto 84.35,53.56
step
talk Herald Flaps##197478
accept Emerald Summons##66620 |goto Valdrakken/0 45.40,55.20
accept Ally of Dragons##68794 |goto Valdrakken/0 45.40,55.20
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin Ally of Dragons##68794 |goto Valdrakken/0 58.16,34.92
accept The Gift of Silver##67074 |goto 58.16,34.92
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
问她 "这个来自提尔的礼物是什么？" |gossip 55708
与亚历瑟拉斯对话 |q 67074/1 |goto 58.16,34.92
step
观察对话
|tip 在塔顶上。
揭示礼物 |q 67074/2 |goto 59.22,37.97
step
click Silver Scale
|tip 在塔顶上。
collect Silver Scale##197845 |q 67074/3 |goto 59.22,37.93
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin The Gift of Silver##67074 |goto 58.16,34.92
accept The Legacy of Tyrhold##70703 |goto 58.16,34.92
step
在泰尔霍德与科拉诺斯会面 |q 70703/1 |goto Thaldraszus/0 58.18,58.74
step
click Silver Scale
放置银鳞 |q 70703/2 |goto 58.18,58.74
step
click Tyrhold Console
激活泰尔霍德装置 |q 70703/3 |goto 58.17,58.74
step
观察对话
talk Watcher Koranos##192480
turnin The Legacy of Tyrhold##70703 |goto 58.15,58.84
accept The Magic Within##67075 |goto 58.15,58.84
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 58.34,57.83 |count 1
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 57.88,55.61 |count 2
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 59.80,56.37 |count 3
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 59.89,61.13 |count 4
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 57.90,61.96 |count 5
step
click Tyrhold Console
寻找隐藏的魔法 |q 67075/1 |goto 58.34,59.65 |count 6
step
click Silver Scale
放置银鳞 |q 67075/2 |goto 58.18,58.74
step
观察对话
talk Watcher Koranos##192480
turnin The Magic Within##67075 |goto 58.15,58.84
accept A Spark of Discovery##67076 |goto 58.15,58.84
step
talk Titan Spark##192707
调查火花 |gossip 55721
探查火花 |q 67076/1 |goto 58.14,58.55
step
追随火花 |q 67076/2 |goto Thaldraszus/0 62.20,59.20
|tip 靠近{o}泰坦火花{}，随它移动。
|tip 它最终到达这个地点。
'|clicknpc Titan Spark##193814
step
观察对话
talk Kalecgos##193492
turnin A Spark of Discovery##67076 |goto 62.20,59.39
step
talk Alexstrasza the Life-Binder##192573
accept Memories of the Past##67077 |goto 62.12,59.28
step
talk Nozdormu##192492
告诉他“永恒者，我需要借用你的视野。” |gossip 55667
观察对话
共享永恒视界 |q 67077/1 |goto 62.13,59.41
step
观察对话
窥视记忆 |q 67077/2 |goto Thaldraszus/0 62.13,58.85
step
talk Nozdormu##192492
选择 _"<询问记忆。>"_ |gossip 55668
与诺兹多姆交谈 |q 67077/4 |goto 62.14,59.41
step
talk Kalecgos##193492
选择 “询问记忆” |gossip 55646
与卡雷苟斯交谈 |q 67077/3 |goto 62.20,59.38
step
talk Alexstrasza the Life-Binder##192573
选择 “询问记忆” |gossip 55696
与亚历瑟拉斯对话 |q 67077/5 |goto 62.12,59.28
step
talk Alexstrasza the Life-Binder##192573
turnin Memories of the Past##67077 |goto 62.12,59.28
step
观察对话
talk Keeper Tyr##192496
accept Parting Instructions##67078 |goto 62.20,59.20
step
click Silver Scale
|tip 在建筑物内。
放置银鳞 |q 67078/1 |goto 60.55,58.74
step
click Forge Console
|tip 在建筑物内。
激活锻造炉 |q 67078/2 |goto 60.55,58.74
step
talk Watcher Koranos##192480
|tip 在建筑物内。
turnin Parting Instructions##67078 |goto 60.36,58.87
accept Hard Lock Life##67079 |goto 60.36,58.87
step
clicknpc Maiden of Patience##192720
|tip 她将被震撼和削弱。
|tip 她在这个区域巡视。
kill Maiden of Patience##192720
collect Secondary Security Disc##197863 |q 67079/2 |goto 57.66,63.69
step
clicknpc Maiden of Diligence##192718
|tip 她将被震撼和削弱。
|tip 她在这个区域巡视。
kill Maiden of Diligence##192718
collect Primary Security Disc##197862 |q 67079/1 |goto Thaldraszus/0 57.81,53.64
step
talk Watcher Koranos##192480
|tip 在建筑物内。
turnin Hard Lock Life##67079 |goto 60.37,58.87
step
观察对话
|tip 在建筑物内。
talk Keeper Tyr##192496
accept An Infusion of Materials##67081 |goto 60.53,58.64
stickystart "Collect_Ancient_Titansteel_Ingots"
step
_Inside the Halls of Infusion Dungeon:_
kill Primal Tsunami##189729 |q 67081/2 |goto Halls of Infusion/1 42.76,47.50
|tip 使用{o}灌注大厅{}副本指南。
step
label "Collect_Ancient_Titansteel_Ingots"
collect 10 Ancient Titansteel Ingot##198038 |q 67081/1
|tip 从{o}注入大厅{}副本中的{o}首领{}身上拾取。
|tip 使用{o}注入大厅{}副本指南。 |未固定
step
talk Keeper Tyr##192496
|tip 在建筑物内。
turnin An Infusion of Materials##67081 |goto Thaldraszus/0 60.53,58.64
accept The Silver Purpose##67084 |goto Thaldraszus/0 60.53,58.64
step
click Ancient Titansteel Ingots
|tip 在建筑物内。
放置锭子 |q 67084/1 |goto 60.81,58.74
step
click Forge Console
|tip 在建筑物内。
激活辅助控制台 |q 67084/2 |goto 60.64,59.17 |count 1
step
click Forge Console
|tip 在建筑物内。
激活辅助控制台 |q 67084/2 |goto 60.63,58.34 |count 2
step
click Silver Scale
|tip 在建筑物内。
激活银鳞 |q 67084/3 |goto 60.55,58.74
step
talk Alexstrasza the Life-Binder##192573
|tip 在建筑物内。
turnin The Silver Purpose##67084 |goto 60.19,58.64
step
talk Rowie##197631
accept A Lost Tribe##68863 |goto Valdrakken/0 45.60,55.09
step
talk Murik##193006
turnin A Lost Tribe##68863 |goto The Azure Span/0 13.14,49.26
accept Sudden Isolation##68640 |goto 13.14,49.26
step
talk Guard Hakota##188301
turnin Sudden Isolation##68640 |goto The Waking Shores/0 55.12,38.26
accept Pressing Matters##66409 |goto 55.12,38.26
step
kill Flameshaper Lorak##197260
collect Qalashi Trophy##191855 |q 66409/1 |goto 65.53,31.77
step
talk Guard Hakota##188301
turnin Pressing Matters##66409 |goto 55.12,38.26
accept Worst Impressions##66410 |goto 55.12,38.26
step
观察对话
跟随守卫哈科塔 |q 66410/1 |goto The Waking Shores/0 53.74,37.97
'|clicknpc Guard Hakota##188301
step
talk Tutaqan##187323
告诉他“我已经消灭了你的敌人。你已见证我的功绩。” |gossip 55407
与图塔坎交谈 |q 66410/3 |goto 53.61,37.96
step
talk Tutaqan##187323
turnin Worst Impressions##66410 |goto 53.61,37.96
step
talk Crafter Kuliqa##188285
accept Salvaging Supplies##66417 |goto 53.65,38.01
step
talk Elder Unujaak##188283
accept Troubled Waters##66411 |goto 53.66,37.91
stickystart "Collect_Succulent_Snapper_Meat"
stickystart "Collect_Whalebone_Fragments"
stickystart "Collect_Waterlogged_Wood"
step
use the Tuskarr Fishing Net##192191
|tip 在水中使用它在{o}鱼上{}。
捕捉#10#温暖水域鱼 |q 66411/1 |goto The Waking Shores/0 52.27,35.13
'|clicknpc Warmwater Riverfish##189455
step
label "Collect_Succulent_Snapper_Meat"
kill Agitated Snapper##188334+
collect 6 Succulent Snapper Meat##191858 |q 66411/2 |goto The Waking Shores/0 52.27,35.13
step
label "Collect_Whalebone_Fragments"
click Whalebone Fragment##376805+
|tip 它们看起来像大型骨质獠牙。
collect 8 Whalebone Fragment##191862 |q 66417/1 |goto The Waking Shores/0 52.94,34.85
step
label "Collect_Waterlogged_Wood"
click Pile of Driftwood##376802+
|tip 它们看起来像一堆木材。
collect 30 Waterlogged Wood##191863 |q 66417/2 |goto The Waking Shores/0 52.94,34.85
step
talk Elder Unujaak##188283
turnin Troubled Waters##66411 |goto 54.11,38.19
step
talk Crafter Kuliqa##188285
交出材料 |gossip 55305
将材料交给工匠库利卡 |q 66417/3 |goto 54.26,38.67
step
talk Crafter Kuliqa##188285
turnin Salvaging Supplies##66417 |goto 54.26,38.67
accept Testing the Tuskarrsenal##66418 |goto 54.26,38.67
step
click Uktulut Bone Spear
取得乌克图鲁特骨矛 |q 66418/1 |goto 54.25,38.64
step
摧毁 #4# 塔斯卡训练假人 |q 66418/2 |goto 54.08,36.83
|tip 使用{o}图斯卡尔长矛攻击{}技能对{o}图斯卡尔训练假人{}。
'|clicknpc Tuskarr Training Dummy##190621, Tuskarr Training Dummy##190624, Tuskarr Training Dummy##188352, Tuskarr Training Dummy##190623
step
talk Crafter Kuliqa##188285
turnin Testing the Tuskarrsenal##66418 |goto 54.26,38.67
step
talk Tutaqan##187323
|tip 他走到这个地点。
accept All But One##66414 |goto 53.70,37.97
step
寻找伊普科 |q 66414/1 |goto 56.18,35.56
step
clicknpc Ipko##189808
携带Ipko |havebuff Carrying Ipko##372806 |goto 56.18,35.56 |q 66414
step
归还伊普科 |q 66414/2 |goto 54.92,36.41
|tip 在路上你会遭遇{o}攻击{}，这将导致你{o}掉落 Ipko{}。
|tip 确保再次{o}点击 Ipko{}。
'|clicknpc Ipko##188639
step
talk Tutaqan##187323
turnin All But One##66414 |goto 54.92,36.40
step
talk Elder Unujaak##188283
accept Closure##66440 |goto 54.95,36.47
step
talk Tutaqan##187323
开始仪式 |gossip 55409
与图塔坎交谈 |q 66440/1 |goto 53.61,39.23
step
click Tuskarr Incense
焚香 |q 66440/2 |goto 53.59,39.34
step
click Fish Offering
献祭之地 |q 66440/3 |goto 53.60,39.31
step
click Lantern of Karkut
点亮提灯 |q 66440/4 |goto 53.58,39.29
step
观察对话
完成仪式 |q 66440/5 |goto 53.61,39.23
step
talk Tutaqan##187323
turnin Closure##66440 |goto 53.61,39.23
step
talk Elder Unujaak##188283
accept In Mourning##66431 |goto 53.64,39.31
step
talk Tutaqan##187323
问他“我可以帮忙做些什么吗？” |gossip 55410
提供帮助塔塔坎 |q 66431/1 |goto 53.89,41.29
step
talk Tutaqan##187323
turnin In Mourning##66431 |goto 53.89,41.29
accept The Only Way Past Is Through##66415 |goto 53.89,41.29
step
talk Peaceful Ottuk##188816
接近宁静的奥图克 |q 66415/1 |goto 52.85,40.99
step
talk Peaceful Ottuk##188816
选择 _"<抚摸奥突克。>"_ |gossip 107476
抚摸和平的奥图克 |q 66415/2 |goto 52.85,40.99
step
带上和平的奥图克去图塔坎 |q 66415/3 |goto 53.89,41.29
step
talk Territorial Ottuk##188813
接近领土的奥图克 |q 66415/4 |goto 54.12,40.25
step
click Broken Fishing Pole##381654
collect Broken Fishing Pole##200188 |q 66415/5 |goto 54.48,41.05
step
click Stuffed Duckling Toy##381655
collect Stuffed Duckling Toy##200190 |q 66415/6 |goto 52.92,39.26
step
制作奥图克诱饵 |q 66415/7 |goto 52.92,39.26
|tip 使用 {o}创建诱饵{} 按钮技能。
step
talk Territorial Ottuk##188813
选择 _"<在奥图克面前晃动玩具。>"_ |gossip 107504
开始引诱领土欧图克 |havebuff Territorial Ottuk##373615 |goto 54.12,40.25 |q 66415
step
带领领土奥图克去图塔坎 |q 66415/8 |goto 53.89,41.29
step
talk Dutiful Ottuk##188817
接近尽责的奥图克 |q 66415/9 |goto 54.31,41.97
step
clicknpc Meaty Crab##196815
收集肉质蟹子 |q 66415/10 |goto 53.30,41.50
step
talk Dutiful Ottuk##188817
将螃蟹献给奥图克。 |gossip 107506
提供肉质蟹腿 |q 66415/11 |goto 54.31,41.97
step
观察对话
带着尽责的奥图克去吐塔坎 |q 66415/12 |goto 53.89,41.29
step
talk Tutaqan##187323
turnin The Only Way Past Is Through##66415 |goto 53.89,41.29
step
accept Calling the Hunting Party##66443 |goto 53.89,41.29
|tip 你将自动接受这个任务。
step
talk Guard Hakota##188301
问他“发生了什么事？” |gossip 107102
调查猎手的召唤 |q 66443/1 |goto 53.93,38.14
step
talk Guard Hakota##188301
我们必须迅速前往。<跳过当前对话。> |gossip 107749
倾听战略 |q 66443/2 |goto 53.93,38.14
step
talk Guard Hakota##188301
turnin Calling the Hunting Party##66443 |goto 53.93,38.14
step
talk Tutaqan##187323
accept While the Iron Is Hot##66444 |goto 53.87,38.14
step
kill Zhurtan the Riverboiler##188687 |q 66444/1 |goto 48.59,46.00
|tip 他是一个精英敌人。
|tip 你的盟友将帮助你战斗。
step
talk Tutaqan##187323
turnin While the Iron Is Hot##66444 |goto 53.66,37.96
step
talk Merithra##186955
|tip 上去平台上。
turnin Emerald Summons##66620 |goto Ohn'ahran Plains/0 29.79,60.04
accept A Day in the Groves##66178 |goto Ohn'ahran Plains/0 29.79,60.04
step
talk Merithra##187525
turnin A Day in the Groves##66178 |goto 33.22,51.76
accept Seeds for the Future##66179 |goto 33.22,51.76
accept Wake the Ancients##66180 |goto 33.22,51.76
stickystart "Deliver_Garden_Seeds_to_Sisters"
step
use the Borrowed Breath##192555
觉醒橡木 |q 66180/1 |goto Ohn'ahran Plains/0 30.09,52.93
'|clicknpc Quercus##187550
step
use the Borrowed Breath##192555
觉醒达利克斯 |q 66180/2 |goto Ohn'ahran Plains/0 28.58,51.80
'|clicknpc Dalicus##187777
step
use the Borrowed Breath##192555
觉醒阿瑟库斯 |q 66180/3 |goto Ohn'ahran Plains/0 30.11,50.36
'|clicknpc Asercus##187778
step
label "Deliver_Garden_Seeds_to_Sisters"
在这个区域击杀拉什尔敌人
collect 12 Garden Seed##192547 |goto Ohn'ahran Plains/0 29.55,51.93 |q 66179
'|kill Giant Lasher##194588, Sprouting Lasher##187546, Vigorous Lasher##190198, Vigorous Lasher##187545
step
talk Sister of the Garden##190209+
|tip 她们看起来像女人马。
将你收集的种子交给花园的姐妹。 |gossip 55275
将#12#园艺种子交给姐妹们 |q 66179/1 |goto Ohn'ahran Plains/0 29.49,50.79
step
talk Merithra##187525
turnin Seeds for the Future##66179 |goto 33.22,51.76
turnin Wake the Ancients##66180 |goto 33.22,51.76
accept Gerithus's Research##66182 |goto 33.22,51.76
step
talk Gerithus##189849
turnin Gerithus's Research##66182 |goto 28.41,48.61
accept Emerald Tears##66183 |goto 28.41,48.61
step
talk Rymek##189850
accept A Frenzied Defender##66181 |goto 28.50,48.70
stickystart "Collect_Emerald_Tears"
step
kill Frenzied Grovetalon##187507 |q 66181/1 |goto Ohn'ahran Plains/0 27.93,45.18
|tip 它在这片区域盘旋。
step
label "Collect_Emerald_Tears"
click Emerald Tear##376929+
|tip 它们看起来像小绿水晶。
collect 8 Emerald Tear##192558 |q 66183/1 |goto Ohn'ahran Plains/0 28.16,46.69
step
talk Rymek##189850
turnin A Frenzied Defender##66181 |goto 28.50,48.70
step
talk Gerithus##189849
turnin Emerald Tears##66183 |goto 28.41,48.61
accept Anchors to Life##66184 |goto 28.41,48.61
step
click Inert Anchor
赋能首个锚点 |q 66184/1 |goto 28.26,48.52
step
click Inert Anchor
增强第二个锚点 |q 66184/2 |goto 28.28,48.68
step
click Inert Anchor
赋能第三锚点 |q 66184/3 |goto 28.53,48.53
step
观察对话
等待梅里萨到达 |q 66184/4 |goto Ohn'ahran Plains/0 28.37,48.69
step
talk Gerithus##189849
turnin Anchors to Life##66184 |goto 28.41,48.61
step
talk Merithra##187509
accept To Somnikus##66393 |goto 28.37,48.69
step
talk Somnikus##186469
turnin To Somnikus##66393 |goto 22.00,50.99
accept The Chittering Rocks##66395 |goto 22.00,50.99
step
talk Rymek##189857
accept Guarded Appreciation##66396 |goto 22.10,50.87
stickystart "Kill_Glacial_Tunnelers"
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 22.25,52.14 |count 1
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 21.75,51.82 |count 2
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 21.99,50.38 |count 3
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 22.56,50.53 |count 4
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 21.49,49.08 |count 5
step
talk Emerald Warden##194684
选择  _"<给予莱梅克的馈赠。>"_ |gossip 55157
将瑞梅克的礼物交给翡翠卫队 |q 66396/1 |goto 21.53,48.45 |count 6
step
label "Kill_Glacial_Tunnelers"
clicknpc Suspicious Permafrost##189870+
|tip 它们看起来像大型灰色尖锐的石头。
kill 8 Glacial Tunneler##188360 |q 66395/1 |goto Ohn'ahran Plains/0 22.80,49.39
step
talk Somnikus##186469
turnin The Chittering Rocks##66395 |goto 22.00,50.99
step
talk Rymek##189857
turnin Guarded Appreciation##66396 |goto 22.10,50.87
accept So Close##66190 |goto 22.10,50.87
step
talk Rymek##191388
问他“你怎么看？” |gossip 55173
与古老树枝中的瑞梅克交谈 |q 66190/1 |goto 19.93,49.35
step
kill Ezralor##188755 |q 66190/2 |goto 21.39,48.75
step
观察对话
talk Merithra##187561
turnin So Close##66190 |goto 22.06,49.20
accept And Yet So Far##66191 |goto 22.06,49.20
step
talk Merithra##187561
问她“梦中隐藏着什么？” |gossip 55426
与梅里萨交谈 |q 66191/1 |goto 22.06,49.20
step
talk Merithra##187561
turnin And Yet So Far##66191 |goto 22.06,49.20
accept Rallying Nature's Allies##66392 |goto 22.06,49.20
|tip 你必须完成{o}奥罕平原故事 campagne{}才能接受这个任务。
step
talk Aronus##188335
带我去阴影圣所。 |gossip 55339
与阿龙努斯交谈获取通往阴影避难所的传送 |q 66392/1 |goto 22.04,50.26
step
talk Koda Steelclaw##188340
集结在古老树枝处参与战斗。 |gossip 54931
与科达·钢爪交谈 |q 66392/3 |goto 29.32,55.88
step
click Infused Anchor
收集注能锚石 |q 66392/2 |goto 30.48,56.76 |count 1
step
click Infused Anchor
收集注能锚石 |q 66392/2 |goto 30.54,56.74 |count 2
step
click Infused Anchor
收集注能锚石 |q 66392/2 |goto 30.59,56.78 |count 3
step
talk Scout Tomul##194328
集结在古老树枝处参与战斗。 |gossip 56255
与侦察员汤穆尔交谈 |q 66392/4 |goto 29.96,58.20
step
talk Archdruid Hamuul Runetotem##188339
|tip 在建筑物内。
集结在古老树枝处参与战斗。 |gossip 55369
与哈穆尔·鲁诺图恩交谈 |q 66392/5 |goto 28.32,60.11
step
talk Somnikus##187594
turnin Rallying Nature's Allies##66392 |goto 28.38,57.96
accept Across the Weald##66185 |goto 28.38,57.96
step
click Portal to Ardenweald
跨入阿尔登维尔 |q 66185/1 |goto 28.35,57.80
step
talk Ysera##187634
turnin Across the Weald##66185 |goto Ardenweald/0 45.88,60.90
accept The Price##66186 |goto Ardenweald/0 45.88,60.90
step
talk Malfurion Stormrage##187636
与玛法里奥·怒风交谈 |q 66186/1 |goto 45.82,60.86
step
talk Malfurion Stormrage##187636
turnin The Price##66186 |goto 45.82,60.86
accept Storm's Rest##66188 |goto 45.82,60.86
step
到达觉醒之林的中央 |q 66188/1 |goto Ardenweald/0 45.30,63.65
step
clicknpc Globe of Rebirth##194365
激活重生之球 |q 66188/2 |goto 45.07,63.17 |count 1
step
clicknpc Globe of Rebirth##189943
激活重生之球 |q 66188/2 |goto 44.99,63.94 |count 2
step
clicknpc Globe of Rebirth##194363
激活重生之球 |q 66188/2 |goto 45.58,63.62 |count 3
step
talk Winter Queen##187632
选择 _“跳到最后。”_ |gossip 56087
说服冬之女王 |q 66188/3 |goto 45.29,64.01
step
观察对话
talk Ysera##188348
turnin Storm's Rest##66188 |goto 45.29,63.62
accept Step Into the Life##66189 |goto 45.29,63.62
step
穿越翡翠梦境通道 |q 66189/1 |goto 45.28,65.62
|tip 使用 {o}交叉按钮{} 能力。
stickystart "Clear_the_Emerald_Dreamway"
step
clicknpc Infused Anchor##187642
放置第一个注能锚点 |q 66189/3 |goto The Emerald Dreamway DF/0 65.83,50.40
step
clicknpc Infused Anchor##187644
|tip 小洞穴内。
放置第三个充能锚 |q 66189/5 |goto 58.69,81.95
step
clicknpc Infused Anchor##187643
放置第二个注能锚点 |q 66189/4 |goto 46.31,39.50
step
label "Clear_the_Emerald_Dreamway"
在该区域击杀敌人
clicknpc Frost Shard##194945+
|tip 它们看起来像大型冰锥。
清除翡翠梦境之路 |q 66189/2 |goto The Emerald Dreamway DF/0 51.99,51.97
'|kill Arctic Summoner##194917, Drenched Rager##188540, Freezing Front##188357
'|clicknpc Frost Shard##194951
step
clicknpc Dream Portal##190027
交汇于古老树枝 |q 66189/6 |goto 31.44,22.53
step
talk Ysera##187646
turnin Step Into the Life##66189 |goto Ohn'ahran Plains/0 18.81,51.89
accept Thin the Veil##66394 |goto Ohn'ahran Plains/0 18.81,51.89
accept Our Full Strength##66397 |goto Ohn'ahran Plains/0 18.81,51.89
stickystart "Deactivate_Barrier_Moorings"
stickystart "Free_Emerald_Scaleguards_or_Wardens"
step
在该区域击杀敌人
collect Volatile Frostfire##193221+ |n
clicknpc Gerithus##187657
解放盖瑞图斯 |q 66397/2 |goto Ohn'ahran Plains/0 20.28,49.14
'|kill Frost Shackler##188449, Icebound Tarasek##195019, Hydro Pugilist##188450
step
label "Deactivate_Barrier_Moorings"
clicknpc Barrier Mooring##188383+
|tip 它们看起来像石头新月传送门结构。
解除第六道屏障锚点 |q 66394/1 |goto Ohn'ahran Plains/0 18.44,51.00
step
label "Free_Emerald_Scaleguards_or_Wardens"
在该区域击杀敌人
collect Volatile Frostfire##193221+ |n
click Various NPCs
|tip 他们看起来像被巨大冰块冻住的龙人。
解放#4#翡翠鳞卫士或看守者 |q 66397/3 |goto Ohn'ahran Plains/0 18.44,51.00
'|kill Frost Shackler##188449, Icebound Tarasek##195019, Hydro Pugilist##188450
'|clicknpc Emerald Scaleguard##190385, Emerald Warden##194700
step
talk Gerithus##188763
turnin Our Full Strength##66397 |goto 18.58,51.66
step
talk Ysera##187646
turnin Thin the Veil##66394 |goto 18.82,51.88
accept Reunited, Once Again##66635 |goto 18.82,51.88
step
talk Ysera##187646
告诉她“我准备好了。” |gossip 54828
与耶希拉交谈 |q 66635/1 |goto 18.82,51.88
step
talk Merithra##187660
turnin Reunited, Once Again##66635 |goto 18.88,51.11
accept The Emerald Dragonflight##66398 |goto 18.88,51.11
step
talk Gerithus##188763
告诉他我准备飞往月光之地迎战瑞梅克。 |gossip 55438
与盖瑞图斯交谈 |invehicle |q 66398 |goto 18.58,51.65
step
观察对话
飞往卢奈丹 |outvehicle |goto Ohn'ahran Plains/0 22.05,75.63 |q 66398 |notravel
step
talk Gerithus##188787
turnin The Emerald Dragonflight##66398 |goto 21.98,76.09
accept We'll Cross that Bridge##66399 |goto 21.98,76.09
step
clicknpc Frost Core##190004
|tip 在建筑物内。
摧毁第一冰霜核心 |q 66399/1 |goto 21.08,76.56
step
clicknpc Frost Core##190005
|tip 在建筑物内。
摧毁第二个冰霜核心 |q 66399/2 |goto 21.88,78.40
step
kill Frostdrake##188804 |q 66399/3 |goto 21.15,79.13
step
talk Somnikus##188840
turnin We'll Cross that Bridge##66399 |goto 20.92,79.79
accept Winter's Fall##66400 |goto 20.92,79.79
step
kill Rymek##188846 |q 66400/1 |goto 20.13,81.29
step
观察对话
talk Merithra##188847
turnin Winter's Fall##66400 |goto 19.78,81.65
accept The Dreamer##66401 |goto 19.78,81.65
step
talk Dream Locus##188843
目睹恢复 |gossip 54860
与梅里萨交谈 |q 66401/1 |goto 19.39,82.17
step
talk Merithra##188848
turnin The Dreamer##66401 |goto 19.62,81.90
step
talk Ysera##188850
accept Like Mother, Like Daughter##66402 |goto 19.81,81.69
step
观察对话
见证梅瑞萨的升腾 |q 66402/1 |goto 19.81,81.69
step
talk Merithra##188848
turnin Like Mother, Like Daughter##66402 |goto 19.77,81.69
step
talk Doc Nanners##196643
accept A New Mystery##69093 |goto Valdrakken/0 45.31,54.95
step
talk Naleidea Rivergleam##186869
turnin A New Mystery##69093 |goto The Waking Shores/0 47.88,82.42
accept The Sealed Door##66012 |goto The Waking Shores/0 47.88,82.42
step
talk Naleidea Rivergleam##186870
turnin The Sealed Door##66012 |goto Thaldraszus/0 54.49,55.67
accept Investigate the Door##66013 |goto 54.49,55.67
step
click Broken Watcher##376932
检查破碎的守望者 |q 66013/1 |goto 54.47,55.73
step
click Titan Door##376116
查看大门 |q 66013/2 |goto 54.65,55.74
step
click Broken Watcher Staff##376957
检查折断的法杖 |q 66013/3 |goto 54.26,55.40
step
talk Naleidea Rivergleam##186870
turnin Investigate the Door##66013 |goto 54.49,55.67
accept Speak to Koranos##66673 |goto 54.49,55.67
step
talk Watcher Koranos##197231
问他“我代表龙鳞远征而来。你能告诉我关于靠近泰尔霍德的封闭泰坦设施的情况吗？” |gossip 55337
与科拉诺斯交谈 |q 66673/1 |goto Valdrakken/0 54.15,46.65
step
click Watcher Log
|tip 在建筑物内。
搜索档案馆中的观察员日志 |q 66673/2 |goto 34.83,24.95
step
click Watcher Log
|tip 在建筑物内。
选择 _"<阅读第一个条目。>"_ |gossip 107608
阅读首次记录 |q 66673/3 |goto 34.83,24.95
step
click Watcher Log
|tip 在建筑物内。
选择  _"<读取下一个条目。>"_ |gossip 107611
阅读第二篇日志 |q 66673/4 |goto 34.83,24.95
step
click Watcher Log
|tip 在建筑物内。
选择  _"<读取下一个条目。>"_ |gossip 107612
阅读第三篇日志 |q 66673/5 |goto 34.83,24.95
step
click Watcher Log
|tip 在建筑物内。
选择 _"<获取观察者日志。>"_ |gossip 107625
获取观察者日志 |q 66673/6 |goto 34.83,24.95
step
退出图书馆 |q 66673/7 |goto 34.21,28.03
|tip 你将被攻击。
step
talk Naleidea Rivergleam##186870
选择 _"<将日志内容以及萨卡雷斯的大胆攻击和盗窃填充给她。>"_ |gossip 55271
与纳雷迪亚谈谈你所学到的内容 |q 66673/8 |goto Thaldraszus/0 54.48,55.67
step
talk Naleidea Rivergleam##186870
turnin Speak to Koranos##66673 |goto 54.48,55.67
accept The Ruins of Szar Skeleth##66094 |goto 54.48,55.67
accept The Abandoned Outpost##70784 |goto 54.48,55.67
accept The City of the Dead##70785 |goto 54.48,55.67
step
talk Naleidea Rivergleam##190855
turnin The City of the Dead##70785 |goto 62.24,18.27
accept The Judgment of Tyr##66814 |goto 62.24,18.27
step
talk Naleidea Rivergleam##190855
告诉她“我们开始吧。” |gossip 55160
与纳雷迪亚交谈 |q 66814/1 |goto 62.24,18.27
step
跟随奈尔迪亚 |q 66814/2 |goto 62.92,16.87
|tip 你将被攻击。
'|clicknpc Naleidea Rivergleam##190860
step
kill Sundered Lookout##196926+
击败伏击者 |q 66814/3 |goto 62.90,16.96
step
跟随奈尔迪亚 |q 66814/4 |goto 63.18,15.94
|tip 你将被攻击。
'|clicknpc Naleidea Rivergleam##190861
step
kill Sundered Vanguard##196927+
击败伏击者 |q 66814/5 |goto 63.18,15.94
step
跟随奈尔迪亚 |q 66814/6 |goto 63.67,14.73
|tip 你将被攻击。
'|clicknpc Naleidea Rivergleam##190864
step
kill Sundered Shadetalon##190924+
击败伏击者 |q 66814/7 |goto 63.67,14.73
step
抵达奈尔迪亚 |q 66814/8 |goto 64.46,15.14
|tip 在建筑物内。
'|clicknpc Naleidea Rivergleam##190865
step
click Various Object+
|tip 它们看起来像各种大型物品。
|tip 你将被攻击。
|tip 在建筑物内。
click Judgment of Tyr
|tip 在你清除其他物体之后，它将出现。
collect The Judgment of Tyr##193072 |q 66814/9 |goto Thaldraszus/0 64.53,15.08
'|kill Skittering Boneborer##196498
step
talk Naleidea Rivergleam##190865
|tip 在建筑物内。
turnin The Judgment of Tyr##66814 |goto 64.46,15.14
step
talk Toddy Whiskers##191159
turnin The Ruins of Szar Skeleth##66094 |goto Ohn'ahran Plains/0 39.96,67.50
accept The Insight of Tyr##70507 |goto Ohn'ahran Plains/0 39.96,67.50
step
kill Reclaimer Makko##191536 |q 70507/1 |goto Ohn'ahran Plains/0 43.79,62.88
|tip 他看起来像一个在这个区域游荡的龙裔。
|tip 他将在你的小地图上以黄色点的形式出现。
collect The Insight of Tyr##193070 |n
恢复泰尔的洞察 |q 70507/2 |goto Ohn'ahran Plains/0 43.79,62.88
step
talk Toddy Whiskers##191159
turnin The Insight of Tyr##70507 |goto 39.96,67.50
step
talk Naleidea Rivergleam##193350
turnin The Abandoned Outpost##70784 |goto The Azure Span/0 53.88,50.70
accept The Vigilance of Tyr##70503 |goto 53.88,50.70
stickystart "Collect_Tarasek_Pillaged_Piece"
stickystart "Collect_Magnetized_Splinters_And_Agitated_Fragments"
step
kill Obstructed Hornswog##196403
clicknpc Tarasek Hauler##196405
|tip 它在青蛙死亡后出现。
collect Half Swallowed Sliver##200480 |q 70503/5 |goto 53.60,49.61
step
click Far-Flung Fragment
|tip 看起来像一堆小灰石。
|tip 在塔顶上。
collect Far-Flung Fragment##200478 |q 70503/4 |goto 54.98,49.75
step
label "Collect_Tarasek_Pillaged_Piece"
kill Tarasek Scavenger##197085+
collect 2 Tarasek Pillaged Piece##200474 |q 70503/3 |goto The Azure Span/0 54.32,50.46
step
label "Collect_Magnetized_Splinters_And_Agitated_Fragments"
kill Crystallized Horror##197024
|tip 看起来像一只在这片区域徘徊的大冰元素。
|tip 它不会反击你。
click Magnetized Splinter##381738+
|tip 它们看起来像地面上的小堆白色矿石。
kill Agitated Shard##197045+
|tip 它们看起来像小冰元素，出现并攻击你。
collect 4 Agitated Fragment##200473 |q 70503/2 |goto The Azure Span/0 54.32,50.46
collect 6 Magnetized Splinter##200471 |q 70503/1 |goto The Azure Span/0 54.32,50.46
step
talk Naleidea Rivergleam##193350
turnin The Vigilance of Tyr##70503 |goto 53.88,50.70
accept Next Steps##66128 |goto 53.88,50.70
step
在探险者帐篷与托迪和娜莱迪亚会面 |q 66128/1 |goto The Waking Shores/0 47.21,82.72
|tip 在建筑物内。
step
观察对话
|tip 在建筑物内。
倾听托迪和奈丽迪亚 |q 66128/2 |goto 47.21,82.72
step
talk Camilla Highwind##186782
|tip 在建筑物内。
turnin Next Steps##66128 |goto 47.21,82.72
step
talk Cataloger Jakes##189226
|tip 在建筑物内。
accept Break on Through##67722 |goto 47.11,82.57
step
talk Toddy Whiskers##191838
turnin Break on Through##67722 |goto Thaldraszus/0 54.27,55.41
accept The Other Side##66636 |goto 54.27,55.41
step
登上脚手架前往第三观察者的位置 |q 66636/1 |goto 54.29,55.30
|tip 上去平台上。
step
观察对话
|tip 使用第三观察者技能按钮。
完成解锁序列 |q 66636/2 |goto 54.29,55.30
step
进入内城 |q 66636/3 |goto 54.92,56.04
|tip 在建筑物内。
step
观察对话
|tip 在建筑物内。
talk Toddy Whiskers##192820
turnin The Other Side##66636 |goto 55.13,56.34
accept Hall of Samples##66173 |goto 55.13,56.34
accept Hall of the Aspects##66174 |goto 55.13,56.34
step
通过附近的传送门进入样本大厅 |q 66173/1 |goto 54.87,55.85
|tip 走上传送点。
|tip 在建筑物内。
step
观察对话
|tip 在建筑物内。
倾听托迪 |q 66173/2 |goto 57.20,53.76
step
click Titan Lure
|tip 在建筑物内。
拾取泰坦引诱物 |q 66173/3 |goto 57.20,53.75
step
引诱大地原始龙到封印球中 |q 66173/5 |goto Thaldraszus/0 57.46,53.62 |count 1
|tip 使用{o}诱饵原龙{}技能按钮对{o}逃脱的土元素原龙{}。
|tip 附近似乎有一只棕色龙。
|tip 将其引诱到圈子里。
|tip 在建筑物内。
'|clicknpc Escaped Earth Proto-dragon##192618
step
引诱冰霜原始龙到捕兽器内 |q 66173/5 |goto 57.45,53.28 |count 2
|tip 使用 {o}引诱原型龙{} 按钮技能对 {o}逃脱的冰原型龙{}。
|tip 附近有一只蓝色龙。
|tip 将其引诱到圈子里。
|tip 在建筑物内。
'|clicknpc Escaped Ice Proto-dragon##192617
step
将火焰原始龙引诱到禁锢球中 |q 66173/5 |goto 57.03,53.29 |count 3
|tip 使用{o}引诱原始龙{}技能对付{o}逃脱的火焰原始龙{}。
|tip 附近有一只橙色的龙。
|tip 将其引诱到圈子里。
|tip 在建筑物内。
'|clicknpc Escaped Fire Proto-dragon##192614
step
引诱空气原素龙到封印球中 |q 66173/5 |goto 57.03,53.63 |count 4
|tip 使用{o}诱捕原龙{}技能对{o}逃脱的空气原龙{}。
|tip 附近有一只蓝色龙。
|tip 将其引诱到圈子里。
|tip 在建筑物内。
'|clicknpc Escaped Air Proto-dragon##192590
step
click Security Console
|tip 在建筑物内。
激活安全控制台 |q 66173/6 |goto 57.24,52.67
step
talk Toddy Whiskers##193374
|tip 在建筑物内。
turnin Hall of Samples##66173 |goto 57.27,52.74
step
归还记录大厅 |complete subzone("Hall of Records") |goto 57.25,54.24 |q 66174
|tip 走上传送点。
|tip 在建筑物内。
step
通过附近的传送门进入龙族大厅 |q 66174/1 |goto 54.79,56.01
|tip 走上传送点。
|tip 在建筑物内。
step
talk Toddy Whiskers##191853
|tip 在建筑物内。
与托迪交谈 |q 66174/2 |goto 58.24,54.09
step
talk Toddy Whiskers##191853
|tip 在建筑物内。
没问题，保护好你的后方。 |gossip 55194
让托迪知道你准备好了 |q 66174/3 |goto 58.24,54.09
step
观察对话
|tip 你将被攻击。
|tip 在建筑物内。
访问诺兹多姆控制台 |q 66174/4 |goto Thaldraszus/0 58.10,53.59
step
观察对话
|tip 你将被攻击。
|tip 在建筑物内。
访问艾璐娜赞达控制台 |q 66174/5 |goto Thaldraszus/0 58.06,53.44
step
观察对话
|tip 你将被攻击。
|tip 在建筑物内。
访问伊瑟拉控制台 |q 66174/6 |goto Thaldraszus/0 58.10,53.30
step
观察对话
|tip 你将被攻击。
|tip 在建筑物内。
访问卡雷戈斯控制台 |q 66174/7 |goto Thaldraszus/0 58.29,53.30
step
观察对话
|tip 你将被攻击。
|tip 在建筑物内。
访问奈萨里奥控制台 |q 66174/8 |goto Thaldraszus/0 58.29,53.59
step
click Security Console
|tip 在建筑物内。
访问安全控制台 |q 66174/9 |goto 58.20,52.98
step
talk Toddy Whiskers##191853
|tip 在建筑物内。
turnin Hall of the Aspects##66174 |goto 58.23,53.06
accept Back to the Main Hall##71152 |goto 58.23,53.06
step
归还记录大厅 |complete subzone("Hall of Records") |goto 58.19,54.31 |q 71152
|tip 走上传送点。
|tip 在建筑物内。
step
talk Toddy Whiskers##192820
|tip 在建筑物内。
turnin Back to the Main Hall##71152 |goto 55.13,56.34
accept Retrieve the Discs##66546 |goto 55.13,56.34
step
观察对话
|tip 在建筑物内。
打破防护罩 |q 66546/1 |goto 55.13,56.34
step
_NOTE:_
在下一步中
|tip 在你获得钥匙后，避免蓝色和棕色的圈圈。
|tip 你将有30秒钟来完成这个任务。
点击此处继续 |confirm |q 66546
step
click Burden Key
|tip 在建筑物内。
使用负担钥匙 |q 66546/3 |goto 55.08,56.11
携带负担之钥 |havebuff Tyr's Burden##373846 |goto 55.08,56.11 |q 66546
step
click Tyr's Burden##377064
|tip 在建筑物内。
夺回光碟 |q 66546/5 |goto 55.42,57.16 |count 1
step
_NOTE:_
在下一步中
|tip 获取钥匙后，跑到五个棕色的圆圈上。
|tip 你将有30秒钟来完成这个任务。
点击此处继续 |confirm |q 66546
step
click Vigilance Key
|tip 在建筑物内。
使用警醒钥匙 |q 66546/2 |goto 55.02,56.02
携带警戒之钥 |havebuff Tyr's Vigilance##373874 |goto 55.02,56.02 |q 66546
step
成为一名警觉的守望者 |havebuff Vigilant Watcher##374139 |goto Thaldraszus/0 55.40,56.59 |q 66546
|tip 获取钥匙后，跑到五个棕色的圆圈上。
|tip 你将有30秒钟来完成这个任务。
step
click Tyr's Vigilance##377063
|tip 在建筑物内。
夺回光碟 |q 66546/5 |goto 55.75,56.47 |count 2
step
_NOTE:_
在下一步中
|tip 在你获得钥匙后，跑到蓝色圆圈上，躲避棕色圆圈。
|tip 在不处于蓝色圆圈内时，您将在5秒后掉落钥匙。
|tip 你将有30秒钟来完成这个任务。
点击此处继续 |confirm |q 66546
step
click Judgement Key
|tip 在建筑物内。
使用审判钥匙 |q 66546/4 |goto 55.00,56.26
携带审判钥匙 |havebuff Tyr's Judgment##373876 |goto 55.00,56.26 |q 66546
step
click Tyr's Judgment##377062
|tip 跑到蓝色圆圈上，避开棕色圆圈。
|tip 在不处于蓝色圆圈内时，您将在5秒后掉落钥匙。
|tip 你将有30秒钟来完成这个任务。
|tip 在建筑物内。
夺回光碟 |q 66546/5 |goto 55.85,57.11 |count 3
step
观察对话
|tip 避开蓝色和棕色的圈圈。
|tip 冲出建筑物
逃离设施 |q 66546/6 |goto 54.45,55.55
step
talk Toddy Whiskers##192967
turnin Retrieve the Discs##66546 |goto 54.45,55.55
accept It Belongs in a Museum... Eventually##66547 |goto 54.45,55.55
step
在龙鳞营地与托迪和奈利德亚会合 |q 66547/1 |goto The Waking Shores/0 47.25,82.78
|tip 在建筑物内。
step
观察对话
|tip 在建筑物内。
倾听托迪和奈丽迪亚 |q 66547/2 |goto The Waking Shores/0 47.25,82.78
step
talk Naleidea Rivergleam##192980
|tip 在建筑物内。
turnin It Belongs in a Museum... Eventually##66547 |goto The Waking Shores/0 47.25,82.78
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various chapters of The Forbidden Reach questline.",
startlevel=68,
patch='100007',
},[[
step
accept Hidden Legacies##74381 |goto Valdrakken/0 60.91,26.63
|tip 你将自动接受这个任务。
step
talk Kurazidaia##201398
|tip 在塔顶上。
告诉她“告诉我发生了什么。”
听取库拉希达亚的报告 |q 74381/1 |goto 61.03,26.05
step
talk Kurazidaia##201398
turnin Hidden Legacies##74381 |goto 61.03,26.05
accept Return to the Reach##73076 |goto 61.03,26.05
step
talk Aluri##193321
告诉他“带我去莫库特村。”
与飞行管理员阿卢瑞对话，飞往被遗忘的边境 |q 73076/1 |goto 44.03,68.00
step
抵达禁忌之地 |outvehicle
|tip 等待航行结束。
step
talk Renpiaq##200561
fpath Morqut Village |goto The Forbidden Reach/5 35.85,59.12
step
在禁忌边界寻找维里迪亚 |q 73076/2 |goto The Forbidden Reach/5 34.61,57.69
step
talk Scalecommander Viridia##199201
turnin Return to the Reach##73076 |goto 34.61,57.69
|tip 这可能会在附近的规模指挥官埃姆伯萨尔那里完成。
accept Wings of Mercy##73157 |goto 34.61,57.69
accept Stemming the Irontide##74769 |goto 34.61,57.69
accept An Eclectic Accord##75050 |goto 34.61,57.69
step
talk Scalecommander Azurathel##199204
告诉他“维里迪亚指挥官让我来查看你。”
与阿祖拉塞尔交谈 |q 75050/3 |goto 35.53,58.69
step
talk Scalecommander Cindrethresh##199199
告诉他“维里迪亚指挥官让我来查看你。”
与辛德瑞斯交谈 |q 75050/4 |goto 35.30,59.49
step
talk Turik##200562
告诉他“维里迪亚指挥官让我来查看你。”
与图里克交谈 |q 75050/2 |goto 34.20,60.04
step
talk Unpukiat##200560
|tip 在建筑物内。
home Morqut Village |goto 33.84,59.06 |q 75050
step
talk Tukkaraq##200558
告诉他“维里迪亚指挥官让我来查看你。”
与图卡拉克交谈 |q 75050/1 |goto 34.37,58.57
step
talk Scalecommander Viridia##199201
turnin An Eclectic Accord##75050 |goto 34.61,57.69
stickystart "Kill_10_Irontide_Pirates"
step
extraaction Mender's Signal##404990
|tip 它在你的界面上显示为一个按钮。
援助风暴海岸侦察员 |q 73157/1 |goto 36.93,43.16
step
label "Kill_10_Irontide_Pirates"
在这个区域击杀铁潮敌人
消灭10个铁潮海盗 |q 74769/1 |goto 34.85,44.21
step
extraaction Mender's Signal##404990
|tip 它在你的界面上显示为一个按钮。
帮助石沉陨落陨石坑侦查员 |q 73157/2 |goto 64.74,61.90
step
extraaction Mender's Signal##404990
|tip 它在你的界面上显示为一个按钮。
援助黑沙谷侦察员 |q 73157/3 |goto 78.84,67.66
step
talk Scalecommander Viridia##199201
turnin Wings of Mercy##73157 |goto 34.61,57.69
turnin Stemming the Irontide##74769 |goto 34.61,57.69
accept Helping Hand and Claw##73160 |goto 34.61,57.69
step
talk Atrenosh Hailstone##200010
accept Plunder Siege##74359 |goto 34.65,57.57
step
talk Treysh##200559
accept Still Within Reach##74379 |goto 35.61,59.49
step
在锐鳞海岸找到杰布和塔查 |q 73160/1 |goto 36.79,80.39
step
click Shipwrecked Debris
救援探路者塔查 |q 73160/2 |goto 36.96,80.28
step
click Tangling Seaweed
救援探路者杰布 |q 73160/3 |goto 36.66,79.88
step
label "Collect_10_Scattered_Supplies"
click Scattered Supplies##386055+
|tip 它们看起来像是水域周围的小木箱和桶。
collect 10 Scattered Supplies##202713 |q 73160/4 |goto 36.27,80.25
step
kill Karkinus the Capsizer##200907 |q 74377/1 |goto 37.44,81.67
step
talk Pathfinder Tacha##200903
turnin Helping Hand and Claw##73160 |goto 37.18,79.06
step
talk Scalecommander Viridia##199201
accept Emberthal Awaits##74847 |goto 34.61,57.69
|tip 如果这个任务不可用，你可以跳过此步骤。
step
与火鳞指挥官艾姆伯萨尔在莫库特村上方会面 |q 74847/1 |goto 32.56,60.58
|only if haveq(74847) or completedq(74847)
step
talk Scalecommander Emberthal##199532
turnin Emberthal Awaits##74847 |goto 32.57,60.58 |only if haveq(74847) or completedq(74847)
accept The Best We Have##72712 |goto 32.57,60.58
step
观察对话
talk Talon Damos##199212
告诉他“起飞吧。”
给予塔隆·达莫斯他的命令 |q 72712/1 |goto 32.63,60.54
step
talk Scalecommander Viridia##199201
accept Exploring Our Past##73159 |goto 34.61,57.69
step
talk Pathfinder Jeb##200040
turnin Exploring Our Past##73159 |goto 29.09,53.13
accept Zskera Vault: Az##72953 |goto 29.09,53.13
step
talk Pathfinder Tacha##200041
accept The Keys You Need##74294 |goto 29.16,53.13
step
talk Pathfinder Tacha##200041
turnin The Keys You Need##74294 |goto 29.16,53.13
step
talk Cataloger Wulferd##201180
accept Authentic Authorization##74984 |goto 29.26,52.69 |or
accept Authentic Authorization##74983 |goto 29.26,52.69 |or
accept Authentic Authorization##74282 |goto 29.26,52.69 |or
|tip 你只能接受其中一个每周任务。
|tip 每次你打开保险库的大门时，环顾四周寻找周 weekly 任务的目标。
|only if not completedq(72953)
step
talk Pathfinder Jeb##200040
选择“让我们探索扎斯基拉宝库。”
与杰布交谈以进入保险库 |q 72953/1 |goto 29.09,53.13
step
冲下楼梯 |goto The Forbidden Reach/5 29.09,52.39 < 10 |walk
击杀精英
|tip 在金库中心之处。
确保宝库安全 |q 72953/2 |goto 29.58,56.34
step
click Unusual Ring##385952
|tip 进入保险库
accept The Forgotten Ring##73155 |goto 29.87,57.30
step
click Web Rope##385679
|tip 进入保险库
爬上蛛网绳索到达二层 |q 72953/4 |goto 28.89,56.12
step
click Door
使用Zskera宝库钥匙打开门 |q 72953/3 |goto 28.57,56.00
step
click Flask of Windward Steps##385687
获得风行者的步伐增益 |complete hasbuff(398283) |goto 28.35,56.13 |q 72953
step
click Journal Entry: The Creches##385836
collect Journal Entry: The Creches##204223 |n
|tip 在保险库内的门内。
accept Journal Entry: The Creches##74883 |goto 28.54,55.65 |only if Horde
accept Journal Entry: The Creches##73114 |goto 28.54,55.65 |only if Alliance
step
点击此处继续 |confirm |q 72953
|tip 从这一点开始，你可以继续开启副本的保险柜门，直到用尽你的钥匙，或者将它们留到以后使用。
step
talk Pathfinder Jeb##202218
turnin Zskera Vault: Az##72953 |goto 29.02,57.04
step
离开兹斯卡拉保险库：阿兹 |complete not subzone("Zskera Vault: Az") |goto 28.81,49.98
step
talk Pathfinder Tacha##200041
accept What's Behind The Next Door##73089 |goto 29.16,53.12
step
talk Researcher Imareth##200724
turnin The Forgotten Ring##73155 |goto 35.18,57.60
accept Primordial Embellishment##74355 |goto 35.18,57.61
step
talk Scalecommander Cindrethresh##199199
turnin Journal Entry: The Creches##74883 |goto 35.30,59.50
|only if haveq(74883) or completedq(74883)
step
talk Scalecommander Azurathel##199204
turnin Journal Entry: The Creches##73114 |goto 35.53,58.69
|only if haveq(73114) or completedq(73114)
step
kill Spellsworn Wingcatcher##201369 |q 74379/1 |goto 59.04,57.54
|tip 这个敌人是精英级别，可能需要组队。
step
talk Talon Damos##200403
|tip 在阳台上
turnin The Best We Have##72712 |goto 55.14,37.43
accept Inheritance##72713 |goto 55.14,37.43
stickystart "Secure_the_Lost_Atheneum"
step
kill Skittering Ruinstalker##199238
|tip 楼上建筑内
协助焰灵的斥候 |q 72713/1 |goto 53.53,36.78 |count 1
step
click Suspicious Rubble
|tip 在建筑物内。
|tip 击杀刷新的蜘蛛。
协助焰灵的斥候 |q 72713/1 |goto 53.58,39.11 |count 2
step
进入建筑物 |goto 55.10,38.43 < 10 |walk
click Damaged Tome+
|tip 在建筑物内。
协助焰灵的斥候 |q 72713/1 |goto 54.94,36.92 |count 3
step
label "Secure_the_Lost_Atheneum"
在该区域击杀敌人
保护失落的学堂 |q 72713/2 |goto 54.98,39.58
step
talk Talon Damos##200459
turnin Inheritance##72713 |goto 55.18,35.84
step
talk Scalecommander Emberthal##199531
accept Creche Fallen##72545 |goto 55.13,35.89
step
clicknpc Talon Arrosh##199215
|tip 在建筑物内。
collect 1 Horn Signet of Arrosh##203692 |q 72545/2 |goto 53.81,36.44
step
clicknpc Talon Tetsos##199217
|tip 在建筑物内。
collect 1 Horn Signet of Tetsos##203689 |q 72545/1 |goto 53.81,36.54
step
进入建筑物 |goto 55.10,38.43 < 10 |walk
clicknpc Talon Hermin##199218
|tip 在建筑物内。
collect Horn Signet of Talon Hermin##203698 |q 72545/4 |goto 54.95,37.00
step
clicknpc Talon Ekrati##199214
|tip 在建筑物内。
collect 1 Horn Signet of Ekrati##203697 |q 72545/3 |goto 53.57,39.47
step
talk Scalecommander Emberthal##199531
turnin Creche Fallen##72545 |goto 55.13,35.89
accept Aiding the Expedition##73094 |goto 55.13,35.89
step
寻找备受重压的龙鳞远征队 |q 73094/1 |goto 61.57,61.64
step
talk Scalecommander Emberthal##199175
turnin Aiding the Expedition##73094 |goto 61.57,61.64
accept Keeping the Flame at Bay##72715 |goto 61.57,61.64
step
talk Ebyssian##199520
accept An Interdisciplinary Approach##72714 |goto 61.69,61.28
stickystart "Kill_Sundered_Ruinstalkers"
stickystart "Kill_Sundered_Pillagers"
step
clicknpc Frightened Researcher##202599
|tip 在建筑物内。
营救研究员 |q 72714/1 |goto 58.21,60.79 |count 1
step
clicknpc Frightened Researcher##202601
|tip 楼上建筑内
营救研究员 |q 72714/1 |goto 57.52,63.66 |count 2
step
clicknpc Frightened Researcher##199358
|tip 在建筑物内。
营救研究员 |q 72714/1 |goto 59.53,63.93 |count 3
step
clicknpc Frightened Researcher##202602
|tip 在建筑物内。
营救研究员 |q 72714/1 |goto 58.92,66.07 |count 4
step
clicknpc Frightened Researcher##202603
|tip 在建筑物内。
营救研究员 |q 72714/1 |goto 56.87,66.24 |count 5
step
进入建筑物 |goto 57.35,67.37 < 7 |walk
|tip 在建筑物内。
kill Winglord Iyazael##199401 |q 72715/3 |goto 56.15,68.48
step
label "Kill_Sundered_Ruinstalkers"
kill 6 Sundered Ruinstalker##199379 |q 72715/2 |goto 58.90,62.55
step
label "Kill_Sundered_Pillagers"
kill 4 Sundered Pillager##199374 |q 72715/1 |goto 58.90,62.55
step
进入建筑物 |goto 58.63,69.19 < 7 |walk
在高巢寻找艾比西安 |q 72714/2 |goto 58.75,70.29
step
talk Scalecommander Emberthal##199521
|tip 在建筑物内。
turnin Keeping the Flame at Bay##72715 |goto 58.83,70.32
step
talk Ebyssian##199177
|tip 他会走到建筑内的这个地点。
turnin An Interdisciplinary Approach##72714 |goto 58.76,70.44
step
talk Scalecommander Emberthal##199521
|tip 在建筑物内。
accept Chasing the Flame##73137 |goto 58.83,70.32
step
talk Scalecommander Emberthal##199538
turnin Chasing the Flame##73137 |goto 74.38,36.90
accept A Creche Divided##72717 |goto 74.38,36.90
step
click Forbidden Memoire
|tip 洞内探险
审视禁忌纪元 |q 72717/4 |goto Dragonskull Island/0 10.94,61.27 |count 1
|tip 如果你愿意，可以跳过此步骤。
step
kill Failed Scalecommander Elarthresh##201820 |q 72717/1 |goto 14.65,49.00
|tip 洞内探险
step
kill Failed Scalecommander Abereth##201823 |q 72717/3 |goto 30.97,35.22
|tip 洞内探险
step
kill Failed Scalecommander Haerothal##201822 |q 72717/2 |goto 67.92,14.76
|tip 洞内探险
step
click Forbidden Memoire
|tip 洞内探险
审视禁忌纪元 |q 72717/4 |goto 70.63,50.73 |count 2
|tip 如果你愿意，可以跳过此步骤。
step
click Forbidden Memoire
|tip 洞内探险
审视禁忌纪元 |q 72717/4 |goto 84.45,46.05 |count 3
|tip 如果你愿意，可以跳过此步骤。
step
click Forbidden Memoire
|tip 洞内探险
审视禁忌纪元 |q 72717/4 |goto 57.19,74.72 |count 4
|tip 如果你愿意，可以跳过此步骤。
step
talk Scalecommander Emberthal##199539
turnin A Creche Divided##72717 |goto The Forbidden Reach/5 76.73,38.52
step
观察对话
talk Scalecommander Emberthal##199539
accept Return to Viridia##73156 |goto 76.73,38.53
step
talk Treysh##200559
turnin Still Within Reach##74379 |goto 35.61,59.49
step
talk Scalecommander Viridia##199201
turnin Return to Viridia##73156 |goto 34.60,57.67
step
collect Atrenosh's Journal##203463 |q 74359/1
|tip 你可以从禁忌之地的各个宝箱随机获得此物品。
step
talk Atrenosh Hailstone##200010
turnin Plunder Siege##74359 |goto 34.65,57.57
step
label "Collect_3_Zskera_Vault_Keys"
collect 3 Zskera Vault Key##202196 |q 73089
|tip 这些来自禁忌之域内的各种活动。
|tip 完成事件并击杀稀有怪物以获得其掉落的机会。
step
talk Atrenosh Hailstone##200010
告诉他“我们去探索兹斯基拉宝库A区域。”
进入兹凯拉金库：阿兹 |complete subzone("Zskera Vault: Az") |goto 29.09,53.13 |q 74355
step
click Door
|tip 在地窖的第一层。
打开传送门 |goto The Forbidden Reach/5 30.57,56.01
click Primordial Jeweler's Kit##389631
collect 1 Primordial Jeweler's Kit##204353 |q 74355/1 |goto 31.16,55.91
step
click Flask of Windward Steps##385687
获得风行者的步伐增益 |complete hasbuff(398283) |goto 28.35,56.13 |q 74355
step
extraaction Windward Steps##398280
|tip 使用此技能在平台间移动，短距离向前冲刺。
click Door
|tip 在保险库的第二层。
打开传送门 |goto 29.37,57.73
click Primordial Anvil##393934
collect 1 Primordial Anvil##204685 |q 74355/2 |goto 29.13,57.92
step
extraaction Windward Steps##398280
|tip 使用此技能在平台间移动，短距离向前冲刺。
使用Zskera宝库钥匙打开#3#扇门 |q 73089/1 |goto 30.31,56.53
|tip 门将在下次每周重置前保持开放。
step
离开兹斯卡拉保险库：阿兹 |complete not subzone("Zskera Vault: Az") |goto 28.81,49.98
step
talk Pathfinder Tacha##200041
turnin What's Behind The Next Door##73089 |goto The Forbidden Reach/5 29.16,53.13
step
talk Researcher Imareth##200724
turnin Primordial Embellishment##74355 |goto 35.18,57.61
step
talk Pathfinder Jeb##200040
accept The Scary Vault of Ur##72952 |goto 29.09,53.13
|tip 这个任务与六个其他版本的法术轮换出现。
|tip 在下次日常重置时查看。
step
talk Cataloger Wulferd##201180
accept Authentic Authorization##74984 |goto 29.26,52.69 |or
accept Authentic Authorization##74983 |goto 29.26,52.69 |or
accept Authentic Authorization##74282 |goto 29.26,52.69 |or
|tip 你只能接受其中一个每周任务。
|tip 每次你打开保险库的大门时，环顾四周寻找周 weekly 任务的目标。
|only if not completedq(72952)
step
collect Zskera Vault Key##202196 |q 72952
|tip 你至少需要其中一个来开启任务的金库门。
|tip 你可以从禁忌岭各地的稀有宝箱和稀有生物获取这些。
step
talk Pathfinder Jeb##200040
选择“让我们探索兹克拉藏宝库。”
与杰布交谈以进入保险库 |q 72952/1 |goto 29.09,53.13
step
冲下楼梯 |goto The Forbidden Reach/5 29.09,52.39 < 10 |walk
击杀精英
|tip 在金库中心之处。
确保宝库安全 |q 72952/2 |goto 29.57,56.31
step
click Door
使用Zskera宝库钥匙打开门 |q 72952/3 |goto 29.57,56.31
step
点击此处继续 |confirm |q 72952
|tip 从这一点开始，你可以继续开启副本的保险柜门，直到用尽你的钥匙，或者将它们留到以后使用。
step
离开兹斯凯拉宝库：乌尔 |complete not subzone("Zskera Vault: Ur") |goto 28.81,49.98 |q 72952
step
talk Pathfinder Jeb##202218
turnin The Scary Vault of Ur##72952 |goto 29.09,53.13
step
talk Pathfinder Jeb##200040
accept Zskera Vault: Ix##72954 |goto 29.09,53.13
|tip 这个任务与六个其他版本的法术轮换出现。
|tip 在下次日常重置时查看。
step
talk Pathfinder Tacha##200041
accept Key Hunting##74771 |goto The Forbidden Reach/5 29.16,53.13
step
talk Cataloger Wulferd##201180
accept Authentic Authorization##74984 |goto 29.26,52.69 |or
accept Authentic Authorization##74983 |goto 29.26,52.69 |or
accept Authentic Authorization##74282 |goto 29.26,52.69 |or
|tip 你只能接受其中一个每周任务。
|tip 每次你打开保险库的大门时，环顾四周寻找周 weekly 任务的目标。
|only if not completedq(72954)
step
collect 3 Zskera Vault Key##202196 |q 74771/1
|tip 你可以从禁忌岭各地的稀有宝箱和稀有生物获取这些。
step
talk Pathfinder Tacha##200041
turnin Key Hunting##74771 |goto The Forbidden Reach/5 29.16,53.13
step
talk Pathfinder Jeb##200040
选择_ "让我们探索泽斯凯拉金库Ix。" _
与杰布交谈以进入保险库 |q 72954/1 |goto 29.09,53.13
step
talk Volethi##201240
accept Not Forgotten##74293 |goto 28.87,52.26
stickystart "Free_Imprisoned_Dracthyr"
step
kill Toadstool Danner##200260 |q 72954/2 |goto 29.57,56.31
|tip 在金库中心之处。
step
click Igniter Torch##387508
collect Igniter Torch##204066 |goto 29.66,56.63 |q 72954
step
click Breaching Cannon
发射攻城炮 |q 72954/4 |goto 29.81,56.53
|tip 这将轰开面前的门，然后一个敌人将会攻击你。
step
click Door
使用Zskera宝库钥匙打开门 |q 72954/3 |goto 29.57,56.31
step
点击此处继续 |confirm |q 72954
|tip 从这一点开始，你可以继续开启副本的保险柜门，直到用尽你的钥匙，或者将它们留到以后使用。
step
label "Free_Imprisoned_Dracthyr"
clicknpc Imprisoned Dracthyr##200568+
|tip 他们看起来像被困在藏宝库门后面的德拉克索。
释放被囚禁的德拉克萨尔#6# |q 74293/1 |goto 29.57,56.31
step
离开兹斯凯拉宝库：伊克斯 |complete not subzone("Zskera Vault: Ix") |goto 28.81,49.98 |q 72954
step
talk Pathfinder Jeb##202218
turnin Zskera Vault: Ix##72954 |goto 29.09,53.13
step
talk Scalecommander Viridia##199201
turnin Not Forgotten##74293 |goto 34.60,57.68
step
talk Pathfinder Jeb##200040
accept Zskera Vault: Kx##72955 |goto 29.09,53.13
|tip 这个任务与六个其他版本的法术轮换出现。
|tip 在下次日常重置时查看。
step
talk Cataloger Wulferd##201180
accept Authentic Authorization##74984 |goto 29.26,52.69 |or
accept Authentic Authorization##74983 |goto 29.26,52.69 |or
accept Authentic Authorization##74282 |goto 29.26,52.69 |or
|tip 你只能接受其中一个每周任务。
|tip 每次你打开保险库的大门时，环顾四周寻找周 weekly 任务的目标。
|only if not completedq(72955)
step
collect Zskera Vault Key##202196 |q 72955
|tip 你至少需要其中一个来开启任务的金库门。
|tip 你可以从禁忌岭各地的稀有宝箱和稀有生物获取这些。
step
talk Pathfinder Jeb##200040
选择“让我们探索兹克拉宝库Kx。”
与杰布交谈以进入保险库 |q 72955/1 |goto 29.09,53.13
step
冲下楼梯 |goto The Forbidden Reach/5 29.09,52.39 < 10 |walk
在该区域击杀敌人
|tip 在金库中心之处。
确保宝库安全 |q 72955/2 |goto 29.57,56.31
step
click Door
使用Zskera宝库钥匙打开门 |q 72955/3 |goto 29.57,56.31
step
点击此处继续 |confirm |q 72955
|tip 从这一点开始，你可以继续开启副本的保险柜门，直到用尽你的钥匙，或者将它们留到以后使用。
step
离开兹克拉宝库：Kx |complete not subzone("Zskera Vault: Kx") |goto 28.81,49.98 |q 72955
step
talk Pathfinder Jeb##202218
turnin Zskera Vault: Kx##72955 |goto 29.09,53.13
step
talk Pathfinder Jeb##200040
accept More Doors To Open##72956 |goto 29.09,53.13
|tip 这个任务与六个其他版本的法术轮换出现。
|tip 在下次日常重置时查看。
step
talk Cataloger Wulferd##201180
accept Authentic Authorization##74984 |goto 29.26,52.69 |or
accept Authentic Authorization##74983 |goto 29.26,52.69 |or
accept Authentic Authorization##74282 |goto 29.26,52.69 |or
|tip 你只能接受其中一个每周任务。
|tip 每次你打开保险库的大门时，环顾四周寻找周 weekly 任务的目标。
|only if not completedq(72956)
step
collect Zskera Vault Key##202196 |q 72956
|tip 你至少需要其中一个来开启任务的金库门。
|tip 你可以从禁忌岭各地的稀有宝箱和稀有生物获取这些。
step
talk Pathfinder Jeb##200040
选择“让我们探索兹克拉藏宝库。”
与杰布交谈以进入保险库 |q 72956/1 |goto 29.09,53.13
step
冲下楼梯 |goto The Forbidden Reach/5 29.09,52.39 < 10 |walk
kill 1 Farscale Overseer##202653
|tip 在金库中心之处。
确保宝库安全 |q 72956/2 |goto 29.57,56.31
step
click Door
使用Zskera宝库钥匙打开门 |q 72956/3 |goto 29.57,56.31
step
点击此处继续 |confirm |q 72956
|tip 从这一点开始，你可以继续开启副本的保险柜门，直到用尽你的钥匙，或者将它们留到以后使用。
step
离开兹克拉宝库 |complete not subzone("Zskera Vaults") |goto 28.81,49.98 |q 72956
step
talk Pathfinder Jeb##202218
turnin More Doors To Open##72956 |goto 29.09,53.13
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Old Hatreds Questline",{
author="support@zygorguides.com",
startlevel=68,
patch='100007',
},[[
step
talk Mayla Highmountain##202656
accept A Debt That Must Be Paid##72591 |goto Valdrakken/0 50.80,58.65
step
talk Baine Bloodhoof##199323
turnin A Debt That Must Be Paid##72591 |goto Ohn'ahran Plains/0 66.62,38.58
accept Scars from the Past##72592 |goto Ohn'ahran Plains/0 66.62,38.58
step
talk Khanam Matra Sarest##181198
选择_询问博凡·风图腾和他的部落。_
与可汗玛特拉交谈 |q 72592/1 |goto 60.00,37.48
step
talk Sansok Khan##195543
选择_询问博凡·风图腾和他的部落。_
与桑索克·卡恩交谈 |q 72592/2 |goto 63.41,41.39
step
talk Scout Tomul##191485
选择 "_询问托穆尔关于失踪的牛头人，并传达桑索克·卡恩的请求_"
与侦察员汤穆尔交谈 |q 72592/3 |goto 62.43,41.72
step
talk Baine Bloodhoof##199323
turnin Scars from the Past##72592 |goto 66.62,38.58
step
talk Scout Tomul##199330
accept A Tomul-tuous Beginning##72593 |goto 66.64,38.68
step
talk Baine Bloodhoof##202707
turnin A Tomul-tuous Beginning##72593 |goto 69.32,47.69
accept The Search for Bovan Windtotem##72595 |goto 69.32,47.69
step
talk Scout Tomul##202706
accept Resupplying Supplies##72662 |goto 69.40,47.73
stickystart "Collect_40_Fresh_Plains_Meat"
step
click Bloody Axe
选择 _<收集斧头。>_
collect 1 Bloody Axe##202405 |q 72595/1 |goto 71.43,44.47
step
talk Windtotem Survivor##202740
选择_<告诉勇士如何回到巴尔恩。>_
拯救一名风图腾幸存者 |q 72595/4 |count 1 |goto 71.91,47.73
step
talk Windtotem Survivor##202740
选择_<告诉勇士如何回到巴尔恩。>_
拯救一名风图腾幸存者 |q 72595/4 |count 2 |goto 74.83,48.29
step
talk Windtotem Survivor##202740
选择_<告诉勇士如何回到巴尔恩。>_
拯救一名风图腾幸存者 |q 72595/4 |count 3 |goto 76.45,51.36
step
click Discarded Necklace
选择 _<收集项链。>_
collect 1 Tauren Necklace##202414 |q 72595/3 |goto 74.53,53.41
step
clicknpc Unidentified Tauren##200787
选择 _<收集头饰。>_
collect 1 Unique Headdress##202415 |q 72595/2 |goto 72.85,50.94
step
label "Collect_40_Fresh_Plains_Meat"
在该区域击杀敌人
collect 40 Fresh Plains Meat##202394 |q 72662/1 |goto 74.54,50.52
step
talk Scout Tomul##202706
turnin Resupplying Supplies##72662 |goto 69.40,47.73
step
talk Baine Bloodhoof##202707
turnin The Search for Bovan Windtotem##72595 |goto 69.33,47.69
accept A Place of Refuge##74946 |goto 69.33,47.69
step
talk Scout Tomul##200492
turnin A Place of Refuge##74946 |goto 73.33,55.07
accept Delivering Bad News##72594 |goto 73.33,55.07
step
talk Koya Windtotem##200700
选择 _“询问你找到的头饰。”_
寻找头饰的拥有者 |q 72594/3 |goto 72.36,55.46
step
talk Ironhoof##200699
选择_问问你找到的斧头_
寻找斧子的主人 |q 72594/1 |goto 73.21,56.41
step
talk Tam Windtotem##200698
选择 _"<询问你找到的项链。>"_
寻找项链的主人 |q 72594/2 |goto 72.33,57.27
step
talk Baine Bloodhoof##200831
turnin Delivering Bad News##72594 |goto 72.76,55.82
accept Pinewood Trail##72663 |goto 72.76,55.82
step
talk Baine Bloodhoof##200932
turnin Pinewood Trail##72663 |goto 80.91,57.62
accept Joint Rescue Operation##72599 |goto 80.91,57.62
step
talk Scout Tomul##200933
accept A Proper Shikaar Send-Off##72600 |goto 80.91,57.72
stickystart "Plant_10_Shikaar_Banners"
step
clicknpc Windtotem Captive##200983
解放风祭图腾的囚徒 |q 72599/1 |count 1 |goto 83.23,55.66
step
clicknpc Windtotem Captive##200983
解放风祭图腾的囚徒 |q 72599/1 |count 2 |goto 83.80,53.69
step
clicknpc Windtotem Captive##200983
解放风祭图腾的囚徒 |q 72599/1 |count 3 |goto 84.61,52.83
step
clicknpc Windtotem Captive##200983
解放风祭图腾的囚徒 |q 72599/1 |count 4 |goto 86.47,53.52
step
clicknpc Windtotem Captive##200983
|tip 在建筑物内。
解放风祭图腾的囚徒 |q 72599/1 |count 5 |goto 86.11,54.55
step
clicknpc Windtotem Captive##200983
解放风祭图腾的囚徒 |q 72599/1 |count 6 |goto 84.88,55.88
step
label "Plant_10_Shikaar_Banners"
在这个区域击杀诺库德敌人
use the Shikaar Banners##203470
|tip 在你击杀的敌人尸体上使用它。
植物 #10# Shikaar 旗帜 |q 72600/1 |goto 84.37,54.13
你可以在 [86.61,50.63] 附近找到更多。
step
talk Scout Tomul##200938
turnin A Proper Shikaar Send-Off##72600 |goto 87.18,51.52
step
talk Baine Bloodhoof##200939
turnin Joint Rescue Operation##72599 |goto 87.26,51.60
step
talk Scout Tomul##200938
accept Bovan's Last Hope##72601 |goto 87.18,51.52
step
talk Windsage Boku##199409
turnin Bovan's Last Hope##72601 |goto 56.57,73.83
accept Optimistic Mystic##72602 |goto 56.57,73.83
step
kill Geyser Salamanther##186705
collect 1 Strong Salamanther Heart##203474 |q 72602/1 |goto 54.04,72.99
step
click Geyser Flower##386398
collect 8 Geyser Flower##203473 |q 72602/2 |goto 53.51,70.91
step
talk Windsage Boku##199409
turnin Optimistic Mystic##72602 |goto 56.87,71.64
accept What Words Are Worth##72603 |goto 56.87,71.64
step
click Incense Burner
放置物品 |q 72603/1 |goto 56.91,71.60
step
观察对话
见证愿景 |q 72603/2 |goto 56.91,71.60
step
talk Baine Bloodhoof##201424
turnin What Words Are Worth##72603 |goto 56.87,71.54
accept Desperate Rescue##72604 |goto 56.87,71.54
step
talk Baine Bloodhoof##201488
turnin Desperate Rescue##72604 |goto 38.09,34.01
accept Saving Bovan Windtotem##72605 |goto 38.08,34.02
step
use the Borrowed Potion of Invisibility##203685
吞噬借来的隐形药水 |q 72605/1 |goto 38.01,34.17
step
click Prisoner Transfer Notes
|tip 看起来像地上的散落卷宗。
|tip 躲避带有巨型圆圈的敌人。
寻找囚犯转移记录 |q 72605/2 |goto 35.10,36.38
step
沿着小路走下去 |goto 34.19,36.99 < 30 |only if walking
click Interrogation Notes
|tip 看起来像地上的散落卷宗。
|tip 躲避带有巨型圆圈的敌人。
寻找审讯笔记 |q 72605/3 |goto 35.10,38.94
step
click Prisoner Update Notes
寻找囚徒更新说明 |q 72605/4 |goto 36.12,40.81
step
寻找博万·风图腾 |q 72605/5 |goto 33.21,42.93
step
talk Baine Bloodhoof##201496
turnin Saving Bovan Windtotem##72605 |goto 33.14,42.96
step
talk Baine Bloodhoof##201516
accept See Red##72606 |goto 33.33,42.65
step
在该区域击杀敌人
在诺库顿要塞击杀半人马 |q 72606/1 |goto 34.88,38.62
step
_Next to you:_
talk Baine Bloodhoof##203204
turnin See Red##72606
accept Old Hatreds##72607
step
kill Jamoku##199914 |q 72607/1 |goto 33.05,38.48
step
talk Baine Bloodhoof##201528
turnin Old Hatreds##72607 |goto 33.26,42.93
step
talk Scout Tomul##201530
accept Case Closed##72609 |goto 33.41,42.82
step
talk Scout Tomul##201529
turnin Case Closed##72609 |goto 72.68,56.02
step
talk Baine Bloodhoof##201566
accept Letting Go##72611 |goto 72.71,56.08
step
talk Baine Bloodhoof##201566
选择_向巴恩告诉你将参加葬礼_
|tip 第二个选项将跳过接下来的几个步骤。
与贝恩交谈 |q 72611/1 |goto 72.71,56.08
step
click Centaur Pyre
光之初 |q 72611/2 |goto 72.47,55.95
step
click Centaur Pyre
点燃第二个火堆 |q 72611/3 |goto 72.50,56.02
step
click Tauren Pyre
点燃第三火堆 |q 72611/4 |goto 72.55,56.09
step
click Tauren Pyre
点燃终焰 |q 72611/5 |goto 72.59,56.16
step
观察对话
结束葬礼 |q 72611/6 |goto 72.69,56.06
step
talk Baine Bloodhoof##201566
turnin Letting Go##72611 |goto 72.71,56.08
accept A Final Word##75258 |goto 72.71,56.08
step
talk Baine Bloodhoof##201566
turnin A Final Word##75258 |goto 72.71,56.08
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach Side Quests",{
author="support@zygorguides.com",
startlevel=68,
patch='100007',
},[[
step
label "Active_Quests_Available"
等待任务可用 |complete questactive(73189,75024,75026,73191,75025,73190,73142,73179,73178,73694,73141,73140,73398,73194)
step
talk Volethi##200727
accept Creche Cache##73189 |goto The Forbidden Reach/5 34.84,57.47 |only if questactive(73189)
accept Sneaky Pebbles##75024 |goto 34.85,57.48 |only if questactive(75024)
|only if questactive(73189,75024)
step
talk Tukkaraq##200558
accept Up to the Highest Height!##75026 |goto 34.36,58.57 |only if questactive(75026)
accept Everburning Embers##73141 |goto 34.36,58.57 |only if questactive(73141)
accept Driftwood Derby##73715 |goto 34.36,58.57 |only if questactive(73715)
|only if questactive(75026,73141,73715)
step
talk Scalecommander Viridia##199201
accept Stuck in Stasis##73694 |goto 34.60,57.67
|only if questactive(73694)
step
与这个区域的NPC交谈
|tip 龙裔石爪将为你坦克。
|tip 德拉克索尔治疗者将为你治疗。
告诉它“跟我去霜石矿 vault”
招募治疗翼 |q 73694/1 |goto 34.74,57.94
|only if haveq(73694) or completedq(73694)
step
talk Cataloger Coralie##201291
accept Snake Wrangling##73191 |goto 34.36,59.28 |only if questactive(73191)
accept A Good Day for Rolling##75025 |goto 34.36,59.28 |only if questactive(75025)
|only if questactive(73191,75025)
step
talk Scalecommander Cindrethresh##199199
accept Toxic Infestation##73190 |goto 35.31,59.49 |only if questactive(73190)
accept Busting Blues##73142 |goto 35.31,59.50 |only if questactive(73142)
accept Soupocalypse Now!##73179 |goto 35.30,59.49 |only if questactive(73179)
accept Up Close and Personal##73194 |goto 35.30,59.49 |only if questactive(73194)
|only if questactive(73190,73142,73179,73194)
step
talk Scalecommander Azurathel##199204
accept Hands Off Our Booty!##73178 |goto 35.53,58.69 |only if questactive(73178)
accept Sunder the Crater##73140 |goto 35.53,58.69 |only if questactive(73140)
accept Too Far Forward##73398 |goto 35.53,58.69 |only if questactive(73398)
|only if questactive(73178,73140,73398)
step
clicknpc Tukkaraq's Boat##201122
驾驶图卡拉克的船 |q 73715/1 |goto 36.60,57.61
|only if haveq(73715) or completedq(73715)
step
clicknpc Driftwood##201138
|tip 使用你的载具技能条上的技能在水中捕捉漂流木。
|tip 向漂流木投掷捕网。
|tip 投鱼击晕敌人。
|tip 水盾减伤并回复生命。
网 #24# 漂流木 |q 73715/2
|only if haveq(73715) or completedq(73715)
stickystart "Slay_Irontide_Cutthroats"
step
click Stolen Booty##385999+
|tip 它们在这些区域看起来像小箱子。
collect 10 Stolen Goods##202647 |q 73178/2 |goto 38.56,64.50
你可以在以下地点找到更多：
[37.67,78.67]
[34.25,45.30]
|only if haveq(73178) or completedq(73178)
step
label "Slay_Irontide_Cutthroats"
在这个区域击杀铁潮敌人
击杀10个铁潮刺客 |q 73178/1 |goto 37.67,78.67
|only if haveq(73178) or completedq(73178)
step
talk Fusethrian##200987
选择_<求助于爆炸...汤吗？>_
获取爆炸性汤品实验 |q 73179/1 |goto 34.16,59.77
|only if haveq(73179) or completedq(73179)
step
clicknpc Morqut Glider##201376
使用滑翔机 |q 73179/2 |goto 35.70,59.00
|only if haveq(73179) or completedq(73179)
step
击杀50个铁潮入侵者 |q 73179/3 |goto 21.13,45.45
|tip 使用你的载具快捷栏上的技能攻击船上的敌人。
|only if haveq(73179) or completedq(73179)
stickystart "Kill_Dragonbane_Beetles"
step
kill Pestilent Pincher##200910 |q 73190/2 |goto 41.04,35.84
|only if haveq(73190) or completedq(73190)
step
use the Proto-Killing Spear##202642
|tip 在这些区域中，使用它在一只原始龙上。
|tip 在原始龙上时，攻击它直到你的行动条切换到载具条。
|tip 疯狂输出技能对 Proto Dragon 造成伤害。
|tip 重复这个直到它死亡。
用原始杀戮矛击杀原始龙 |q 73194/1 |goto 39.60,52.62
你可以在以下地点找到更多：
[50.33,53.11]
[60.69,60.44]
[69.68,58.47]
|only if haveq(73194) or completedq(73194)
step
click Infuser Shard+
|tip 它们看起来像这个区域地面上散落的小水晶。
|tip 瞄准龙杀虫，用水晶向它们射击以注入并击败它们。
击败#12#注能甲虫 |q 75024/1 |goto 39.36,32.76
|only if haveq(75024) or completedq(75024)
step
label "Kill_Dragonbane_Beetles"
kill 24 Dragonbane Beetle##198792 |q 73190/1 |goto 39.83,35.02
|only if haveq(73190) or completedq(73190)
step
click Snowball
|tip 它们看起来像是这个区域地面上大型的圆形雪球。
|tip 在携带他们的同时，跑过燃烧的小动物以拯救他们。
拯救#14#过载的小动物 |q 75025/1 |goto 61.81,26.70
|only if haveq(75025) or completedq(75025)
step
clicknpc Broken Kite Piece##203134+
|tip 它们看起来像这个区域地面上的小木片。
|tip 它们在你的小地图上显示为黄色圆点。
收集#12#风筝碎片 |q 75026/1 |goto 31.97,60.59
|only if haveq(75026) or completedq(75026)
step
click Rustling Bush##384952+
|tip 它们看起来像这个区域周围的绿色灌木丛。
收集#6#毒水蛇 |q 73191/1 |goto 41.28,40.55
你可以在[45.61,37.24]附近找到更多。
|only if haveq(73191) or completedq(73191)
step
extraaction Release Watersnakes##400872
|tip 使用屏幕上出现的按钮。
释放毒性水蛇 |q 73191/2 |goto 42.91,38.91
|only if haveq(73191) or completedq(73191)
step
在该区域击杀敌人
collect 10 Arcane Focus##202362 |q 73142/1 |goto 52.59,56.41
|only if haveq(73142) or completedq(73142)
step
进入支援萌物窝 |q 73189/1 |goto 36.68,32.41
|only if haveq(73189) or completedq(73189)
step
use the Toxin Antidote##202620
|tip 在毒素淤积前使用它来降低你的毒素水平。
|tip 避免地面的阴影区域，这会更快增加你的毒性等级。
click Mender Supplies##385990+
|tip 它们看起来像是建筑内部的木箱。
collect 6 Mender Supplies##202619 |q 73189/2 |goto The Support Creche/0 37.51,44.98
|only if haveq(73189) or completedq(73189)
stickystart "Slay_Ice_Primalists"
step
clicknpc Imprisoned Dracthyr##201060+
|tip 他们看起来像是在建筑内部被冻结在静止状态的德拉克瑟尔。
|tip 它们在你的小地图上显示为黄色圆点。
释放被囚禁的德拉克萨尔#6# |q 73694/2 |goto Froststone Vault/0 55.23,39.08
|only if haveq(73694) or completedq(73694)
step
label "Slay_Ice_Primalists"
击杀该区域内的敌人。
|tip 在建筑物内。
击杀10个冰霜原始者 |q 73694/3 |goto 55.23,39.08
|only if haveq(73694) or completedq(73694)
step
在该区域击杀敌人
|tip 攻城工坊内外
collect 14 Everburning Ember##202364 |q 73141/1 |goto The Siege Creche/0 58.82,38.53
|only if haveq(73141) or completedq(73141)
stickystart "Slay_Sundered_Flame_Enemies"
step
点击该区域内的NPC
|tip 他们看起来像是在这个区域周围躺着的龙希尔NPC。
|tip 你可以在建筑内外找到它们。
use the Healing Draught##202874
|tip 在这个区域对受伤的德拉克瑟尔使用它。
治疗受伤的龙争者 #8# |q 73398/1 |goto The Forbidden Reach/5 58.18,67.15
|only if haveq(73398) or completedq(73398)
step
label "Slay_Sundered_Flame_Enemies"
击杀周围的破碎敌人
击杀10个破碎烈焰敌人 |q 73398/2 |goto 58.18,67.15
|only if haveq(73398) or completedq(73398)
step
kill Adept Stormbringer##200711 |q 73140/3 |goto 69.80,59.62
|only if haveq(73140) or completedq(73140)
step
label "Destroy_Primalist_Totems"
click Primalist Totem
|tip 它们看起来像是从这个区域的地面上生长出来，尖端带有白光的根。
摧毁 #6# 原始祭坛 |q 73140/2 |goto 69.80,59.62
|only if haveq(73140) or completedq(73140)
step
label "Slay_Air_or_Earth_Primalists"
在此区域击杀原始主义者敌人
击杀8个空气或大地原始主义者 |q 73140/1 |goto 69.80,59.62
|only if haveq(73140) or completedq(73140)
step
use the Toxin Antidote##202620 |only if subzone("The Support Creche")
|tip 使用它来降低你的毒素水平，免得它淹没你。|仅在子区域“支持孵化室”内使用
|tip 避开地面上的阴 cloudy 区域，这会更快增加你的毒性等级。 |仅在子区域“支援育成所”中使用
talk Volethi##200727
turnin Creche Cache##73189 |goto The Forbidden Reach/5 34.84,57.47 |only if haveq(73189) or completedq(73189)
turnin Sneaky Pebbles##75024 |goto 34.85,57.48 |only if haveq(75024) or completedq(75024)
|only if haveq(73189,75024) or completedq(73189,75024)
step
talk Scalecommander Viridia##199201
turnin Stuck in Stasis##73694 |goto 34.60,57.67
|only if haveq(73694) or completedq(73694)
step
talk Cataloger Coralie##201291
turnin Snake Wrangling##73191 |goto 34.36,59.28 |only if haveq(73191) or completedq(73191)
turnin A Good Day for Rolling##75025 |goto 34.36,59.28 |only if haveq(75025) or completedq(75025)
|only if haveq(73191,75025) or completedq(73191,75025)
step
talk Tukkaraq##200558
turnin Up to the Highest Height!##75026 |goto 34.36,58.57 |only if haveq(75026) or completedq(75026)
turnin Everburning Embers##73141 |goto 34.36,58.57 |only if haveq(73141) or completedq(73141)
turnin Driftwood Derby##73715 |goto 34.36,58.57 |only if haveq(73715) or completedq(73715)
|only if haveq(75026,73141,73715) or completedq(75026,73141,73715)
step
talk Scalecommander Cindrethresh##199199
turnin Toxic Infestation##73190 |goto 35.31,59.49 |only if haveq(73190) or completedq(73190)
turnin Busting Blues##73142 |goto 35.31,59.50 |only if haveq(73142) or completedq(73142)
turnin Soupocalypse Now!##73179 |goto 35.30,59.49 |only if haveq(73179) or completedq(73179)
turnin Up Close and Personal##73194 |goto 35.30,59.49 |only if haveq(73194) or completedq(73194)
|only if haveq(73190,73142,73179,73194) or completedq(73190,73142,73179,73194)
step
talk Scalecommander Azurathel##199204
turnin Hands Off Our Booty!##73178 |goto 35.53,58.69 |only if haveq(73178) or completedq(73178)
turnin Sunder the Crater##73140 |goto 35.53,58.69 |only if haveq(73140) or completedq(73140)
turnin Too Far Forward##73398 |goto 35.53,58.69 |only if haveq(73398) or completedq(73398)
|only if haveq(73178,73140,73398) or completedq(73178,73140,73398)
step
你已完成禁忌领域所有可用的支线任务
|tip 此指南将在更多副本可用时重置。
'|complete questactive(73189,75024,75026,73191,75025,73190,73142,73179,73178,73694,73141,73715,73140,73398,73194) |next "Active_Quests_Available"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (Zaralek Cavern)",{
author="support@zygorguides.com",
achieveid={18150},
patch='100100',
},[[
step
_NOTE:_
龙纹与龙骑技能
|tip 你需要完成“扎拉克洞窟”指南的开始部分才能解锁该区域。
|tip 龙纹看起来像是大型圆形的金色符文，漂浮在空中，分布在整个大陆上。
|tip 你骑着龙翼坐骑飞过它们来收集。
|tip 收集它们会给你龙骑技能点，可以用来提升你的龙骑能力。
|tip 本指南将带你收集所有的龙符文，以便你能快速提升你的龙骑技能。
|tip 随着你收集龙文符文，要花费技能点，请点击小地图上的“巨龙群岛汇总”按钮，然后点击“龙骑技能与解锁”下的“查看”按钮。
点击此处继续 |confirm
step
完成“这还不够”任务 |complete completedq(72873) |or
|tip 在“扎拉凯洞穴”升级指南中完成这个任务以获得该区域的访问权限。
点击这里加载“扎拉凯尔洞穴”升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Zaralek Cavern" |or
step
收集龙形符文：洛阿姆 |achieve 18150/3 |goto Zaralek Cavern/0 54.75,54.71 |notravel
|tip 在屋顶附近
step
收集龙纹：穿越道 |achieve 18150/6 |goto 72.05,48.44 |notravel
|tip 在从天花板上垂下的钟乳石后面。
step
收集龙文：纳尔·克斯'科尔 |achieve 18150/2 |goto 62.70,70.39 |notravel
step
收集龙形符文：闪光岗 |achieve 18150/1 |goto 41.67,80.38 |notravel
|tip 在屋顶附近
step
收集龙符文：扎卡利卡尔德拉 |achieve 18150/4 |goto 30.45,45.33 |notravel
|tip 在岩石之巅
|tip 在你达到10层减益前降落并等待其消失，否则你会被击落。
step
收集龙符文：酸咬峡谷 |achieve 18150/7 |goto 47.44,37.07 |notravel
|tip 在洞穴顶端。
step
收集龙纹：滑行龙栖息地 |achieve 18150/5 |goto 55.29,27.84 |notravel
|tip 在从天花板上垂下的钟乳石后面。
step
收集龙纹：艾伯鲁斯接近 |achieve 18150/8 |goto 48.07,4.31 |notravel
|tip 在熔岩瀑布顶部。
|tip 快去拿这个符文，因为这个区域会随机让你下马。
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Zaralek Cavern",{
author="support@zygorguides.com",
description="This guide will help you complete the primary story and side quests in Zaralek Cavern",
condition_suggested=function() return level == 70 and not completedq(75694) end,
startlevel=68,
patch='100100',
},[[
step
accept The Land Beneath: Zaralek Cavern!##72975
|tip 你将自动接受这个任务。
|tip 如果你看不到这个任务，你必须完成“禁忌之域”升级指南的第一章。
|tip 完成任务“返回维瑞迪亚”将解锁扎拉雷克洞穴。
step
talk Ebyssian##201281
|tip 在塔顶上。
turnin The Land Beneath: Zaralek Cavern!##72975 |goto Valdrakken/0 61.44,42.20
accept A Crack in the World##72976 |goto 61.44,42.20
step
talk Alexstrasza the Life-Binder##187678
|tip 她最终走到塔顶的这个位置。
问她“关于化身有什么消息？”
与艾露恩谈论伊瑞迪克隆 |q 72976/1 |goto 59.11,37.13
step
talk Ebyssian##201281
|tip 在塔顶上。
turnin A Crack in the World##72976 |goto 58.87,38.49
accept Where the Flames Fell##72977 |goto 58.87,38.49
step
talk Wrathion##201311
turnin Where the Flames Fell##72977 |goto Ohn'ahran Plains/0 87.14,27.27
accept Scar of Earth and Fire##72978 |goto 87.14,27.27
step
观察对话
talk Khasar##202788
|tip 他最终走到这个地点。
问他“这里发生了什么？”
与卡萨尔交谈 |q 72978/1 |goto 86.98,27.28
step
click Remains of a Fallen Shikaar
检查灰烬堆 |q 72978/2 |goto 87.04,27.30
step
click Spear of a Fallen Shikaar
检视破碎的长矛 |q 72978/3 |goto 87.09,27.44
step
talk Sabellian##200085
问他“你学到了什么吗？”
与萨贝利安交谈 |q 72978/4 |goto 87.37,27.54
step
talk Wrathion##201311
turnin Scar of Earth and Fire##72978 |goto 87.17,27.27
step
talk Khasar##202788
accept Rest Well, Warrior##75985 |goto 86.99,27.28
step
click Shovel
观察对话
埋葬勇敢的希卡尔 |q 75985/1 |goto 87.04,27.266
step
talk Khasar##202788
turnin Rest Well, Warrior##75985 |goto 86.99,27.28
step
talk Sabellian##200085
accept The Patience of Princes##72981 |goto 87.37,27.53
step
map Ohn'ahran Plains/0
path follow smart; loop off; ants curved; dist 30
path	87.90,29.05	86.42,26.60	83.54,28.16	84.88,30.65	84.46,31.91
path	83.31,31.27
穿越隧道 |q 72981/1
|tip 从悬崖飞跃，穿过你脚下的隧道。
step
talk Sabellian##201411
问他 "那么计划是什么？"
观察对话
与萨贝利安讨论计划 |scenariogoal 1/58683 |goto The Throughway/0 74.41,42.24 |q 72981
stickystart "Slay_the_Earth_Primalists"
step
kill Cliffkeeper Bouldani##202612 |scenariogoal 2/58225 |goto 49.77,55.15 |q 72981
step
label "Slay_the_Earth_Primalists"
在这个区域击杀石息敌人
杀戮大地原始者 |scenariogoal 2/0 |goto 40.55,40.06 |q 72981
stickystart "Slay_the_Fire_Primalists"
step
kill Portalkeeper Cimbra##202613 |scenariogoal 3/58372 |goto 36.37,38.84 |q 72981
step
label "Slay_the_Fire_Primalists"
击杀火焰原始者 |scenariogoal 3/0 |goto 44.19,49.48 |q 72981
step
kill Summitshaper Lorac##201522 |scenariogoal 4/57855 |goto 28.36,44.86 |q 72981
step
talk Elder Honeypelt##200116
|tip 洞内探险
turnin The Patience of Princes##72981 |goto Deepflayer Nest/0 82.30,64.72
accept It Was Not Enough##72873 |goto 82.30,64.72
accept Culling the Deep##72872 |goto 82.30,64.72
step
extraaction Escape Crystals##403458
|tip 洞内探险
逃离水晶监狱 |q 72873/1 |goto 82.30,64.72
step
talk Elder Honeypelt##200116
|tip 洞内探险
问她“你能带我去找我的小队吗？”
与长者蜜皮对话 |q 72873/2 |goto 81.78,65.86
stickystart "Slay_8_Deepflayers"
step
click Niffin Hole
|tip 洞内探险
跟随赫尼佩尔特长老 |q 72873/3 |goto 33.21,64.72
step
click Niffin Hole
|tip 洞内探险
跟随赫尼佩尔特长老 |q 72873/4 |goto 39.15,30.09
step
click Niffin Hole
|tip 洞内探险
跟随赫尼佩尔特长老 |q 72873/5 |goto 62.28,21.47
step
击杀攻击敌人
|tip 洞内探险
拯救瓦尔尼斯人 |q 72873/6 |goto 75.09,25.09
step
label "Slay_8_Deepflayers"
击杀#8#深渊掠夺者 |q 72872/1 |goto 53.62,45.06
|tip 洞穴内部 | 非固定
step
追随道路 |goto 25.41,35.49 < 10 |walk
寻找萨贝里安 |q 72873/7 |goto Zaralek Cavern/0 60.21,37.66
step
观察对话
talk Elder Honeypelt##201587
turnin It Was Not Enough##72873 |goto 60.17,37.80
turnin Culling the Deep##72872 |goto 60.17,37.80
accept Niffen and Goliath##72970 |goto 60.17,37.80
step
进入洞穴 |goto Zaralek Cavern/0 58.92,38.95 < 7 |walk
click Honeypelts Pungent Bait
|tip 洞内探险
kill Deepflayer Broodmatron##200115 |q 72970/2 |goto 58.41,38.96
step
talk Elder Honeypelt##201584
turnin Niffen and Goliath##72970 |goto 60.16,37.56
step
talk Wrathion##201583
accept Brother's Keeper##72980 |goto 60.06,37.47
step
talk Sabellian##201589
turnin Brother's Keeper##72980 |goto 60.57,40.13
accept Secrets From Our Father##72874 |goto 60.57,40.13
step
click Damaged Relic
调查破损的遗物 |q 72874/2 |goto 60.31,42.71
step
进入洞穴 |goto 59.06,41.00 < 7 |walk
click Humming Relic
|tip 洞内探险
选择_按下按钮_
调查嗡鸣遗物 |q 72874/3 |goto 58.84,41.59
step
进入洞穴 |goto 61.91,41.80 < 7 |walk
click Rusted Relic
|tip 洞内探险
调查生锈的遗物 |q 72874/1 |goto 62.52,41.74
step
talk Sabellian##201589
|tip 他在这个区域游荡。
turnin Secrets From Our Father##72874 |goto 60.57,40.13
accept The Earth Gives Way##72979 |goto 60.57,40.13
step
talk Wrathion##201583
turnin The Earth Gives Way##72979 |goto 57.03,38.26
step
talk Elder Honeypelt##201584
accept Smells Like Loamm##72973 |goto 57.07,38.18
step
talk Elder Honeypelt##202873
告诉他“我们准备好进入洛安姆了。”
在洛安姆边缘与甜毛皮会面 |q 72973/1 |goto 58.60,54.58
step
talk Aurantia##204522
turnin Smells Like Loamm##72973 |goto 56.96,55.65
accept Orientation: Loamm Niffen##75643 |goto 56.96,55.65
accept Tougher Down Under##76101 |goto Zaralek Cavern/0 56.96,55.65
step
talk Elder Honeypelt##200054
accept Welcome to the City of Smells##72974 |goto Zaralek Cavern/0 56.98,55.77
step
talk Brynnsahce##204546
告诉他“准备交付！”
与布林萨克交谈 |q 72974/1 |goto 57.02,55.78
step
talk Mimuup##204254
|tip 在建筑物内。
向声望守护者介绍自己 |q 75643/1 |goto 56.53,55.66
step
talk Harlowe Marl##202468
|tip 在建筑物内。
向声望商人自我介绍 |q 75643/2 |goto 56.48,55.62
step
talk Floressa##203293
|tip 在建筑物内。
home Loamm |goto 56.42,55.84 |q 75643
step
talk Vaskarn##203404
|tip 在建筑物内。
turnin Tougher Down Under##76101 |goto Zaralek Cavern/0 56.52,56.08
step
talk Avogadro##202467
|tip 在建筑物内。
向飞行大师自我介绍 |q 75643/3 |goto 55.64,54.79
step
clicknpc Gumm##204624
|tip 在这个区域跳跃着椅子。
与导师交易 |q 72974/4 |goto 57.64,53.42
step
观察对话
talk Quicksmack Magk##204651
告诉他“让我们全力以赴！”
kill Quicksmack Magk##204651
与教练交易 |q 72974/3 |goto 57.73,56.42
step
talk Myrrit##201426
|tip 他在这个区域挖掘。
观察对话
click Treasure?
|tip 将会有多个可点击的"宝藏"堆。
|tip 它们看起来像这个区域地面上的小土堆。
与洞穴潜水员交易 |q 72974/2 |goto 55.65,57.35
step
click Cenka's Slug Jar
kill Runaway Meal##204639
与机智的厨师交易 |q 72974/5 |goto 54.20,56.39
step
talk Aurantia##200052
turnin Orientation: Loamm Niffen##75643 |goto Zaralek Cavern/0 54.64,54.74
step
talk Elder Honeypelt##200054
turnin Welcome to the City of Smells##72974 |goto 54.64,54.70
|tip 保留这个任务获得的物品以便后续任务使用。
step
观察对话
talk Aurantia##200052
accept Six Hundred Feet Under##75644 |goto 54.64,54.74
step
talk Ebyssian##201366
告诉他“我们来讨论一下接下来的行动。”
和队友汇合 |q 75644/1 |goto 54.71,54.51
step
talk Ebyssian##201366
turnin Six Hundred Feet Under##75644 |goto 54.71,54.51
accept Future Aspects##74334 |goto 54.71,54.51
step
talk Ebyssian##201366
告诉他我们可以问一下蜜毛。
建议将甜蜜毛皮作为向导 |q 74334/1 |goto 54.71,54.51
step
talk Effervesta##200053
accept A Swallow's Tale##72881 |goto 54.64,54.79
step
talk Examiner Tae'shara Bloodwatcher##204509
accept Power Unified##75641 |goto 56.84,54.79
step
进入洞穴 |goto 56.15,59.27 < 20 |walk
talk Cinnam##200056
|tip 洞内探险
问他“你知道奈弗瑞尔在哪里吗？”
与奈弗罗尔交谈 |q 72881/1 |goto 55.69,60.23
step
talk Cinnam##200056
|tip 洞内探险
turnin A Swallow's Tale##72881 |goto 55.69,60.23
accept Flown the Coop##72882 |goto 55.69,60.23
step
clicknpc Frightened Swallow##201777+
|tip 它们看起来像在洛阿姆周围飞翔的鸟。
寻找#6#燕子 |q 72882/1 |goto 57.18,55.48
step
进入洞穴 |goto 56.15,59.27 < 20 |walk
talk Cinnam##200056
|tip 洞内探险
turnin Flown the Coop##72882 |goto 55.69,60.23
step
talk Ponzo##204693
accept Get Rich Quick##75885 |goto 58.09,53.81
step
talk Dead Cave Swallow##200238
accept A Bitter Pill to Swallow##72883 |goto 57.90,54.84
step
talk Loamm Citizen##205014
问她“我能给你推销一张微光岗亭的共享产权代金券吗？”
出售一张光辉海湾共享产权代金券 |q 75885/2 |goto 57.71,54.82 |count 1
step
talk Loamm Citizen##205025
问他“你要不要点一 jar Ponzo 的奶油？”
出售庞佐的奶油 |q 75885/1 |goto 58.12,55.55 |count 1
step
talk Loamm Citizen##205020
问她“我能给你推销一张微光岗亭的共享产权代金券吗？”
出售一张光辉海湾共享产权代金券 |q 75885/2 |goto 57.36,52.96 |count 2
step
talk Loamm Citizen##205027
问她“我能给你推销一张微光岗亭的共享产权代金券吗？”
出售一张光辉海湾共享产权代金券 |q 75885/2 |goto 56.60,53.97 |count 3
step
talk Loamm Citizen##205028
问他“你要不要点一 jar Ponzo 的奶油？”
告诉他 嗯！
出售庞佐的奶油 |q 75885/1 |goto 56.33,54.83 |count 3
step
talk Ponzo##204693
turnin Get Rich Quick##75885 |goto 58.09,53.81
step
进入洞穴 |goto 56.15,59.27 < 20 |walk
talk Cinnam##200056
|tip 洞内探险
选择_<展示死去的辛纳姆吞噬者。>_
回归肉桂城 |q 72883/1 |goto 55.69,60.23
step
talk Aurantia##200052
turnin A Bitter Pill to Swallow##72883 |goto 54.64,54.74
accept Expedition Effervesta##72884 |goto 54.64,54.74
step
click Miss Smelly
寻找第一条线索 |q 72884/1 |goto 57.64,56.36 |count 1
step
click Effervesta's Trusty Pickaxe
寻找第二个线索 |q 72884/1 |goto 58.06,54.41 |count 2
step
click Effervesta's Scent Journal
寻找第三个线索 |q 72884/1 |goto 55.88,57.33 |count 3
step
talk Aurantia##200052
turnin Expedition Effervesta##72884 |goto 58.05,54.16
accept Suss Out the Imposter##72886 |goto 58.05,54.16
step
kill Nevroll##203039 |q 72886/1 |goto 58.29,52.50
|tip 洞内探险
|tip 击杀两个德罗斯巴尔以激活奈弗罗尔。
step
click Effervesta's Prison
|tip 洞内探险
免费气泡精华 |q 72886/2 |goto 58.25,52.37
step
talk Aurantia##200052
turnin Suss Out the Imposter##72886 |goto 54.64,54.74
step
use the Gift of the High Redolence##205250
消耗声望令牌 |complete itemcount(205250) == 0
step
talk Elder Honeypelt##200054
accept Slime Time Live##72878 |goto 54.64,54.70
step
clicknpc Redolent Whelk##200898+
|tip 你可以在这个区域的各个角落找到他们。
use Snail Lasso##205980
|tip 用绳索把他们捉住，拖着他们直到绳索消失。
click Slime Puddle##386235+
collect 8 Snail Slime##203442 |q 72878/1 |goto 58.72,64.29
step
talk Ebyssian##201236
turnin Future Aspects##74334 |goto 59.42,68.82
step
talk Scalecommander Emberthal##200049
accept Save-A-Mole##72958 |goto 59.44,68.94
accept Collating Their Research##74375 |goto 59.44,68.94
stickystart "Collect_6_Sundered_Flame_Expedition_Notes"
step
click Titan Writings
寻找线索 |q 74375/1 |count 1 |goto 59.87,72.61
step
click Draconic Texts
寻找线索 |q 74375/1 |count 2 |goto 59.18,73.76
step
click Titan Scroll
寻找线索 |q 74375/1 |count 3 |goto 59.93,74.50
step
click Draconic Scrolls
寻找线索 |q 74375/1 |count 4 |goto 57.87,74.02
step
进入洞穴 |goto 58.55,74.66 < 7 |walk
talk Tuberros##201265
|tip 洞内探险
告诉他"没事，我在这里解救你。"
寻找图博罗斯 |q 72958/1 |goto 58.13,75.44
step
label "Collect_6_Sundered_Flame_Expedition_Notes"
kill Sundered Researcher##199946+
collect 6 Sundered Flame Expedition Notes##204713 |q 74375/2 |goto 59.21,73.81
step
talk Scalecommander Emberthal##200049
turnin Save-A-Mole##72958 |goto 59.44,68.94
turnin Collating Their Research##74375 |goto 59.44,68.94
accept Whose Vault Is It Anyway?##72959 |goto 59.44,68.94
step
talk Scalecommander Emberthal##200049
告诉她：“我已经准备好出发了。”
观察对话
与艾博思达尔交谈 |q 72959/1 |goto 59.44,68.94
step
talk Scalecommander Emberthal##201619
turnin Whose Vault Is It Anyway?##72959 |goto 62.57,73.26
step
talk Rannan Korren##200074
accept Charging Up##72961 |goto 62.56,73.30
step
click Buzzing Orb
|tip 它们看起来像是发光的法力球散落在这个区域。
kill Nal ks'kol Defense Orb##203819
collect 6 Buzzing Orb Core##204833 |q 72961/1 |goto 61.55,72.42
step
talk Rannan Korren##200074
turnin Charging Up##72961 |goto 62.56,73.30
step
talk Scalecommander Emberthal##201619
accept Open That Door!##72962 |goto 62.57,73.26
step
talk Rannan Korren##200074
问她“你离打开这道门还有多远？”
询问瑞安纳关于他的进展 |q 72962/1 |goto 62.56,73.30
step
观察对话
打开大门 |q 72962/2 |goto 62.56,73.30
step
进入与艾博瑟尔的密室 |q 72962/3 |goto 62.75,73.60
|tip 在建筑物内。
|tip 确保他在你冲进之前开始前进。
step
talk Scalecommander Emberthal##200075
|tip 在建筑物内。
turnin Open That Door!##72962 |goto 62.76,73.60
accept Sundered Flames##75419 |goto 62.75,73.60
step
kill Winglord Dezran##201677
|tip 在建筑物内。
击败劈碎之焰哨兵 |q 75419/1 |goto 62.85,73.75
step
观察对话
talk Scalecommander Emberthal##204040
|tip 他最终走到建筑内部的这个位置。
turnin Sundered Flames##75419 |goto 63.01,73.96
accept The Upper Hand##72963 |goto 63.01,73.96
step
talk Scalecommander Emberthal##202857
|tip 在建筑物内。
告诉她“我已准备好。”
告诉艾博瑟尔，你准备好面对萨卡瑞斯了 |q 72963/1 |goto 63.01,73.96
step
观察对话
kill Scalecommander Sarkareth##184308
|tip 在建筑物内。
|tip 当火焰环向外移动时跳过它。
|tip 躲避地面上的橙色区域。
击败萨卡雷斯 |q 72963/2 |goto 63.50,74.71
step
talk Scalecommander Emberthal##204571
|tip 在建筑物内。
turnin The Upper Hand##72963 |goto 63.42,74.60
accept Singed##72964 |goto 63.42,74.60
step
talk Marithos##202696
|tip 在建筑物内。
问他“你愿意加入艾博罗斯的事业吗？”
与玛里托斯交谈 |q 72964/2 |goto 63.64,74.83
step
talk Amythora##202693
|tip 在建筑物内。
告诉她“艾博斯坦将张开双臂欢迎你。”
与艾米索拉交谈 |q 72964/1 |goto 63.59,74.93
step
观察对话 |complete readyq(72964) or completedq(72964)
step
talk Scalecommander Emberthal##200064
|tip 在建筑物内。
turnin Singed##72964 |goto 63.49,74.71
step
talk Ebyssian##202670
|tip 在建筑物内。
accept Aspects of Our Legacy##72965 |goto 63.39,74.65
step
talk Ebyssian##202771
告诉他"你应该去和他们聊聊。"
在洛阿姆与艾比西恩相遇 |q 72965/1 |goto 56.57,57.15
step
观察对话
talk Sabellian##199849
turnin Aspects of Our Legacy##72965 |goto 56.62,56.71
accept Where There's Smoke, There's Fire##72966 |goto 56.62,56.71
step
use the Shiny Token of Gratitude##205991
消耗声望令牌 |complete itemcount(205991) == 0
step
talk Citros##200055
turnin Slime Time Live##72878 |goto Zaralek Cavern/0 56.80,54.00
accept Smells like Kith Spirit##72879 |goto 56.80,54.00
step
click Incense Brew
添加蜗牛黏液 |q 72879/1 |goto 56.83,53.81
step
click Platter of Bugs
|tip 在烹饪炉旁边。
click Incense Brew
增加虫子 |q 72879/2 |goto 56.83,53.81
step
click Smelling Crystals
|tip 在烹饪炉旁边。
click Incense Brew
添加水晶 |q 72879/3 |goto 56.83,53.81
step
talk Citros##200055
turnin Smells like Kith Spirit##72879 |goto 56.80,54.00
accept Incense Gratification##72880 |goto 56.80,54.00
step
click Niffen Incense
放置香火 |q 72880/1 |goto 56.59,54.30 |count 1
step
click Niffen Incense
放置香火 |q 72880/1 |goto 55.90,54.18 |count 2
step
click Niffen Incense
放置香火 |q 72880/1 |goto 55.85,53.07 |count 3
step
click Niffen Incense
放置香火 |q 72880/1 |goto 55.35,52.25 |count 4
step
click Niffen Incense
放置香火 |q 72880/1 |goto 54.44,50.86 |count 5
step
click Niffen Incense
放置香火 |q 72880/1 |goto 53.36,50.83 |count 6
step
click Niffen Incense
放置香火 |q 72880/1 |goto 52.74,50.18 |count 7
step
click Niffen Incense
放置香火 |q 72880/1 |goto 51.96,50.29 |count 8
step
click Niffen Incense
放置香火 |q 72880/1 |goto 51.54,49.54 |count 9
step
talk Elder Honeypelt##200054
turnin Incense Gratification##72880 |goto 54.64,54.70
step
use the Pungent Niffen Incense##205249
消耗声望令牌 |complete itemcount(205249) == 0
step
talk Sabellian##200081
turnin Where There's Smoke, There's Fire##72966 |goto 41.02,41.75
step
talk Ebyssian##200080
accept Sight Beyond Sight##72908 |goto 40.94,41.71
step
click Flamesight Totem##393951
collect 1 Flamesight Rune##203385 |q 72908/1 |goto 40.54,43.15
step
click Flamesight Totem##393951
collect 2 Flamesight Rune##203385 |q 72908/1 |goto 39.70,42.29
step
click Flamesight Totem##393951
collect 3 Flamesight Rune##203385 |q 72908/1 |goto 37.20,41.95
step
kill High Seer Jhatal##199842
collect 1 Greater Flamesight Rune##204694 |q 72908/2 |goto 35.47,42.15
step
click Greater Flamesight Totem
|tip 在塔顶上。
激活大火焰视野图腾  |q 72908/3 |goto 35.50,42.13
step
talk Ebyssian##199852
|tip 在塔顶上。
turnin Sight Beyond Sight##72908 |goto 35.48,41.84
accept Legends of the Zaqali##72909 |goto 35.48,41.84
step
talk Sabellian##199851
|tip 在塔顶上。
accept Know Thy Enemy##72910 |goto 35.40,41.87
stickystart "Collect_Zaqali_Armaments"
step
click Smoldering Incense
检查燃烧的香料 |q 72909/1 |goto 33.28,40.91
step
click Thrumming Earthstone
检查震响的土石 |q 72909/2 |goto 32.94,42.04
step
click Cached Weaponry
检查缓存的武器 |q 72909/3 |goto 31.85,41.46
step
click Battered Ebon Armament
检查破损的黑色武器 |q 72909/4 |goto 32.22,40.21
step
click Prayer Tablet
检查祷告石板 |q 72909/5 |goto 32.31,39.47
step
label "Collect_Zaqali_Armaments"
击杀此区域内的扎卡利敌人
|tip 埃比锡安将帮助你消灭他们。
收集#8#扎卡利武器 |q 72910/1 |goto 31.94,41.35
step
与萨贝利安重聚 |q 72909/6 |goto 30.39,41.56
step
观察对话
talk Ebyssian##199948
|tip 洞内探险
turnin Legends of the Zaqali##72909 |goto 30.18,41.02
step
talk Sabellian##199949
|tip 洞内探险
turnin Know Thy Enemy##72910 |goto 30.26,40.95
accept Take Out the Head##72911 |goto 30.26,40.95
stickystart "Kill_Earthrender_Ku'siva"
step
kill Shrinekeeper Qanosh##199839 |q 72911/1 |goto 30.98,45.72
step
label "Kill_Earthrender_Ku'siva"
kill Earthrender Ku'siva##199840 |q 72911/2 |goto 30.98,45.72
step
调查异动  |q 72911/3 |goto 30.98,45.72
step
talk Ebyssian##199863
turnin Take Out the Head##72911 |goto 38.21,48.46
accept Consequences##72912 |goto 38.21,48.46
step
talk Sabellian##199862
告诉他让我看看你的手臂
观察对话
检视萨贝尔扬的伤害 |q 72912/1 |goto 38.24,48.37
step
talk Ebyssian##199863
turnin Consequences##72912 |goto 38.20,48.47
accept Battlefield Triage##72913 |goto 38.20,48.47
stickystart "Collect_5_Vacant_Elemental_Cores"
step
kill Zaqali Flamewalker##199826+
collect 1 Zaqali Flame Totem##203654 |q 72913/2 |goto 35.46,48.68
step
label "Collect_5_Vacant_Elemental_Cores"
在该区域击杀敌人
collect 5 Vacant Elemental Core##203653 |q 72913/1 |goto 35.46,48.68
step
_Next to you:_
talk Ebyssian
turnin Battlefield Triage##72913
accept Rushing Quality##72914
step
前往祭坛 |q 72914/1 |goto 33.24,50.92
step
click Zaqali Flame Totem
放置图腾 |q 72914/2 |goto 33.24,50.92
step
click Vacant Elemental Core
放置元素核心  |q 72914/3 |count 1 |goto 33.33,50.79
step
click Vacant Elemental Core
放置元素核心 |q 72914/3 |count 2 |goto 33.36,50.95
step
click Vacant Elemental Core
放置元素核心 |q 72914/3 |count 3 |goto 33.28,51.10
step
click Vacant Elemental Core
放置元素核心 |q 72914/3 |count 4 |goto 33.15,51.10
step
click Vacant Elemental Core
放置元素核心 |q 72914/3 |count 5 |goto 33.09,51.02
step
extraaction Assist Ebyssian##400855
|tip 使用出现在你屏幕上的“协助艾比西安”按钮。
在仪式中占据你的位置并协助埃比希安 |q 72914/4 |goto 33.26,50.78
step
click Darkened Elemental Core
collect 1 Darkened Elemental Core##203682 |q 72914/5 |goto 33.33,50.79
step
click Darkened Elemental Core
collect 2 Darkened Elemental Core##203682 |q 72914/5 |goto 33.36,50.95
step
click Darkened Elemental Core
collect 3 Darkened Elemental Core##203682 |q 72914/5 |goto 33.28,51.10
step
click Darkened Elemental Core
collect 4 Darkened Elemental Core##203682 |q 72914/5 |goto 33.15,51.10
step
click Darkened Elemental Core
collect 5 Darkened Elemental Core##203682 |q 72914/5 |goto 33.08,51.02
step
extraaction Toss Cores##400826
|tip 使用屏幕上出现的“投掷核心”按钮。
将暗淡核心扔入岩浆中 |q 72914/6 |goto 33.20,50.98
step
talk Ebyssian##201581
turnin Rushing Quality##72914 |goto 33.10,50.88
accept Shut Them Down##72916 |goto 33.10,50.88
step
_Next to you:_
talk Sabellian##199950
accept Alliance of Convenience##72915
stickystart "Kill_4_Zaqali_Guards"
step
click Extracted Elemental Core
摧毁提取的元素核心 |q 72916/2 |count 1 |goto 29.86,51.43
step
click Extracted Elemental Core
摧毁提取的元素核心 |q 72916/2 |count 2 |goto 29.67,50.52
step
click Extracted Elemental Core
摧毁提取的元素核心 |q 72916/2 |count 3 |goto 29.22,53.59
step
click Extracted Elemental Core
摧毁提取的元素核心 |q 72916/2 |count 4 |goto 29.91,54.28
step
click Earthdrainer Conduit
摧毁大地引流管道 |q 72916/1 |count 1 |goto 29.51,54.70
step
click Earthdrainer Conduit
摧毁大地引流管道 |q 72916/1 |count 2 |goto 29.38,54.56
step
click Earthdrainer Conduit
摧毁大地引流管道 |q 72916/1 |count 3 |goto 29.20,54.53
step
label "Kill_4_Zaqali_Guards"
击杀此区域内的扎卡利敌人
击杀#4#扎卡利卫士 |q 72915/1 |goto 28.74,49.99
step
_Next to you:_
talk Ebyssian
turnin Shut Them Down##72916
step
_Next to you:_
talk Sabellian##201647
turnin Alliance of Convenience##72915
accept A Scale for a Scale##74494
step
click Zaqali Dragonslayer's Spear
collect 1 Zaqali Dragonslayer's Spear##204085 |q 74494/1 |goto 28.21,50.39
step
前往瞭望台 |q 74494/2 |goto 29.48,49.91
step
观察对话
talk Sabellian##199952
|tip 他将奔向此地点。
turnin A Scale for a Scale##74494 |goto 29.61,49.69
accept From Hell's Heart##72917 |goto 29.61,49.69
step
观察对话
talk Sabellian##199954
告诉他我已准备就绪。
同意萨贝利安的计划 |q 72917/1 |goto 30.21,48.98
step
观察对话
kill Erupting Shadowflame##199838 |q 72917/2 |goto 30.04,49.01
step
talk Ebyssian##199877
turnin From Hell's Heart##72917 |goto 41.02,59.94
accept No Dragon Left Behind##72918 |goto 41.02,59.94
step
clicknpc Ebyssian##199877
手动拔出长矛 |q 72918/1 |goto 41.02,59.94
step
clicknpc Ebyssian##199877
|tip 一旦点击，就远离艾比西安。
用更大的杠杆拔出长矛 |q 72918/2 |goto 41.02,59.94
step
talk Sabellian##199876
告诉他“尽你所能。”
观察对话
让萨贝里安帮助 |q 72918/3 |goto 41.17,59.83
step
clicknpc Ebyssian##199877
移除炽热长矛 |q 72918/4 |goto 41.03,59.92
step
talk Sabellian##199876
turnin No Dragon Left Behind##72918 |goto 41.17,59.83
step
talk Ebyssian##199877
accept Raked Over the Coals##72919 |goto 41.02,59.91
step
驱散暗影火焰 |q 72919/1 |count 1 |goto 42.86,58.95
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 2 |goto 44.34,56.72
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 3 |goto 45.30,56.61
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 4 |goto 46.56,54.92
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 5 |goto 46.58,53.00
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 6 |goto 48.03,53.65
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 7 |goto 49.42,54.39
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 8 |goto 50.35,53.06
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 9 |goto 52.01,51.66
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 10 |goto 52.82,49.93
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 11 |goto 53.45,51.63
|tip 驾驭你的龙骑飞过它。
step
驱散暗影火焰 |q 72919/1 |count 12 |goto 54.68,51.20
|tip 驾驭你的龙骑飞过它。
step
前往洛阿姆 |q 72919/2 |goto 55.78,53.60
step
talk Ebyssian##199958
|tip 他跑到这个地点。
turnin Raked Over the Coals##72919 |goto 56.01,54.35
accept The Endless Burning Sky##72920 |goto 56.01,54.35
stickystart "Extinguish_Loamm"
step
talk Aquinan##204992
营救 #1# 洛阿姆村民 |q 72920/2 |count 1 |goto 55.16,55.23
step
talk Cenka##204993
告诉他“你需要撤离！”
拯救 #2# 洛阿姆村民 |q 72920/2 |count 2 |goto 54.21,56.47
step
talk Teek##204994
拯救#3#洛阿姆村民 |q 72920/2 |count 3 |goto 55.76,57.68
step
talk Gloowaz Bonesmusher##204995
告诉他“我会帮助你站起来。”
救援#4#洛阿姆村民 |q 72920/2 |count 4 |goto 57.71,56.43
step
talk Tale-Teller Talpi##204991
告诉他“你需要撤离！”
拯救 #5# 洛阿姆村民 |q 72920/2 |goto 57.76,53.42
step
label "Extinguish_Loamm"
extraaction Smothering Earth##401160
|tip 使用屏幕上出现的"窒息大地"按钮。
熄灭泥土周围的火焰 |q 72920/1
step
talk Elder Honeypelt##201772
|tip 在建筑物内。
告诉她“我们需要离开这里”。
拯救老蜜毛 |q 72920/3 |goto 56.48,55.50
step
观察对话
清除门口的火焰 |q 72920/4 |goto 56.29,55.45
step
talk Ebyssian##201784
|tip 他跑到这个地点。
turnin The Endless Burning Sky##72920 |goto 56.06,54.55
accept In the Wake of the Ashes##75145 |goto 56.06,54.55
step
talk Ebyssian##203151
|tip 在塔顶上。
告诉他我已准备就绪。
将报告交给艾萨拉女王 |q 75145/1 |goto Valdrakken/0 58.33,38.92
step
talk Ebyssian##203151
|tip 在塔顶上。
turnin In the Wake of the Ashes##75145 |goto 58.33,38.92
step
talk Ebyssian##203965
|tip 他走到塔顶这个位置。
accept Here We Go Again##72987 |goto Valdrakken/0 61.94,41.17
step
use the Symbol of Friendship##205989
消耗声望令牌 |complete itemcount(205989) == 0
step
talk Kalecgos##187676
|tip 在塔顶上。
告诉他“我需要一个传送门到扎拉克洞穴。”
向卡雷苟斯请求传送门 |q 72987/2 |goto 61.63,36.09
step
click Portal to Zaralek Cavern |goto 60.70,36.92
|tip 卡雷苟斯会在你降落时接住你。
前往扎拉雷克洞窟 |goto Zaralek Cavern/0 48.72,40.05 < 100 |noway |c |q 72987
step
talk Ebyssian##200046
寻找埃比斯安 |q 72987/1 |goto 49.91,27.54
step
talk Ebyssian##200046
turnin Here We Go Again##72987 |goto 49.91,27.54
accept The Obsidian Rest##75367 |goto 49.91,27.54
step
click Flight Master's Report
collect 1 Flight Master's Report##204819 |q 75367/1 |goto 51.06,26.31
step
talk Keskos##200893
fpath Obsidian Rest |goto 51.03,26.17
step
talk Tzashivak##201026
告诉她，我们需要任何帮助来阻止达贾拉丁。
请求塔扎希瓦克的帮助 |q 75367/2 |goto 51.36,25.60
step
click Enchanted Spying Glass
使用间谍镜 |q 75367/3 |goto 50.71,25.20
step
talk Ebyssian##200046
turnin The Obsidian Rest##75367goto 49.92,27.54
accept Report: Battlefield Ruins##74393 |goto 49.92,27.54
step
talk Field Commander Ignax##200051
turnin Report: Battlefield Ruins##74393 |goto 46.69,29.63
accept Blow It Up##74538 |goto 46.69,29.63
accept Thinning Their Defenses##74539 |goto 46.69,29.63
accept Intercepting Communications##74540 |goto 46.69,29.63
stickystart "Kill_5_Zaqali_Flametongues"
step
click Dragonslayer Ballista
摧毁屠龙者弩炮 |q 74538/1 |goto 43.86,34.21 |count 1
step
click Dragonslayer Ballista
摧毁屠龙者弩炮 |q 74538/1 |goto 42.86,33.44 |count 2
step
click Dragonslayer Ballista
摧毁屠龙者弩炮 |q 74538/1 |goto 42.11,33.78 |count 3
step
click Dragonslayer Ballista
摧毁屠龙者弩炮 |q 74538/1 |goto 42.22,34.76 |count 4
step
kill 1 Warchanter Ronvath##200128 |q 74540/2 |goto 43.20,38.87
step
click Djaradin Warchest##398782
collect 1 Invasion Plans: Dragon Nests##204074 |q 74540/1 |goto 42.97,38.95
step
label "Kill_5_Zaqali_Flametongues"
kill 5 Zaqali Flametongue##200066 |q 74539/1 |goto 42.53,31.67
step
talk Field Commander Ignax##200051
turnin Blow It Up##74538 |goto 46.69,29.62
turnin Thinning Their Defenses##74539 |goto 46.69,29.62
turnin Intercepting Communications##74540 |goto 46.69,29.62
accept Air Superiority##74542 |goto 46.69,29.62
step
talk Ebyssian##202469
告诉他“起飞吧。”
与埃比西安翱翔 |q 74542/1 |goto 46.97,29.38
step
击败达贾拉丁势力 |q 74542/2 |goto 46.97,29.38
|tip 使用你的动作条上的技能来完成这个。
step
到达岩石边缘 |q 74542/3 |goto 53.39,30.26
step
talk Ebyssian##202523
|tip 他走到这个地点。
turnin Air Superiority##74542 |goto 53.60,30.22
|tip 保留这个任务获得的幼龙的影焰徽章以备后用。
accept Investigating the Unknown##74557 |goto 53.60,30.22
step
clicknpc Zaqali Berserker##202529
检查达贾尔丁尸体  |q 74557/1 |goto 53.63,30.16
step
clicknpc Drakonid Poacher##202549
检查捕猎者尸体 |q 74557/2 |goto 53.44,29.84
step
clicknpc Slitherdrake##202550
与蛇龙接触 |q 74557/3 |goto 53.43,30.39
step
talk Ebyssian##202523
turnin Investigating the Unknown##74557 |goto 53.59,30.21
accept Break Them Out##74562 |goto 53.59,30.21
accept Worst of the Worst##74563 |goto 53.59,30.21
stickystart "Disrupt_The_Operation"
step
进入洞穴 |goto 54.67,30.61 < 10 |walk
kill 1 Overseer Xymra##200186 |q 74563/1 |goto 56.99,30.31
|tip 洞内探险
step
label "Disrupt_The_Operation"
click Transportation Cart
click Door
kill Drakonid Poacher##200173
|tip 洞内探险
破坏龙人猎人的行动 |q 74562/1 |goto 55.43,30.99
step
talk Ebyssian##202523
turnin Break Them Out##74562 |goto 53.60,30.21
turnin Worst of the Worst##74563 |goto 53.60,30.21
step
use the Regurgitated Half-Digested Fish##205992
消耗声望令牌 |complete itemcount(205992) == 0
step
talk Ebyssian##202995
accept Fading Embers##72922 |goto 53.42,30.24
step
talk Scalecommander Emberthal##203904
告诉她 "我准备好和你一起面对他。"
与炎焰之心交谈 |q 72922/1 |goto 45.91,26.34
step
阻止萨卡瑞斯 |q 72922/2 |goto 45.32,25.20
step
观察对话
talk Ebyssian##199965
turnin Fading Embers##72922 |goto Zaralek Cavern/0 45.98,26.24
accept A Whisper to Sabellian##72923 |goto 45.98,26.24
step
talk Sabellian##199973
告诉他“埃比西恩想和你谈谈。”
与萨贝利安交谈 |q 72923/1 |goto 46.74,29.57
step
观察对话
talk Ebyssian##199965
turnin A Whisper to Sabellian##72923 |goto 46.82,29.66
accept Appealing to the Black Prince##72924 |goto 46.82,29.66
step
talk Wrathion##200101
告诉他“埃比西恩想和你谈谈。”
与沃拉尔对话 |q 72924/1 |goto 51.53,25.79
step
观察对话
talk Ebyssian##199965
turnin Appealing to the Black Prince##72924 |goto 51.47,25.76
accept With Our Powers Combined##72925 |goto 51.47,25.76
step
在烈焰堡垒入口处与艾博瑟尔会面 |q 72925/1 |goto 47.18,27.90
step
talk Ebyssian##199965
turnin With Our Powers Combined##72925 |goto 47.18,27.90
accept Forward Camp##72931 |goto 47.18,27.90
step
talk Sabellian##199973
accept Wipe Them Out##72928 |goto 47.06,28.08
step
观察对话
talk Wrathion##200101
accept In the Right Hands##72926 |goto 47.23,27.82
stickystart "Defeat_Enemies_Around_Brimstone_Garrison"
step
click 'The Resting Blade'##385569
|tip 在建筑物内。
collect 'The Resting Blade'##204877 |q 72926/2 |goto 45.11,21.01
step
click Ebon Eviscerator
collect Ebon Eviscerator##204184 |q 72926/1 |goto 45.11,18.45
step
label "Defeat_Enemies_Around_Brimstone_Garrison"
在该区域击杀敌人
击败烈焰堡垒中的敌人 |q 72928/1 |goto 45.16,19.46
step
在烈焰堡垒与埃比西安会面 |q 72931/1 |goto 44.05,15.65
|tip 在塔顶上。
step
talk Wrathion##200101
|tip 在塔顶上。
turnin In the Right Hands##72926 |goto 44.00,15.66
step
talk Sabellian##199973
|tip 在塔顶上。
turnin Wipe Them Out##72928 |goto 44.07,15.55
step
talk Ebyssian##199965
|tip 在塔顶上。
turnin Forward Camp##72931 |goto 44.05,15.65
accept Finding Sarkareth##72927 |goto 44.04,15.63
step
与火焰之心会面 |q 72927/1 |goto 47.28,15.69
step
talk Scalecommander Emberthal##199964
turnin Finding Sarkareth##72927 |goto 47.37,15.61
accept Cracking His Shell##72929 |goto 47.37,15.61
step
click Aberrus Charge
摧毁连接 |q 72929/1 |count 1 |goto 47.54,16.32
step
click Aberrus Charge
摧毁连接 |q 72929/1 |count 2 |goto 49.24,16.62
step
talk Scalecommander Emberthal##199964
turnin Cracking His Shell##72929 |goto 47.37,15.61
accept Stopping Sarkareth##72930 |goto 47.37,15.61
step
kill Dreadful Defender##203842
|tip 保持移动，避免进入地面上被标记的区域。
阻止萨卡瑞斯 |q 72930/1 |goto 48.55,15.01
step
talk Scalecommander Emberthal##199964
turnin Stopping Sarkareth##72930 |goto 47.87,14.90
step
talk Ebyssian##199965
accept Aberrus, the Shadowed Crucible: Sarkareth##75694 |goto 47.89,14.97
step
use the Sign of Respect##205998
消耗声望令牌 |complete itemcount(205998) == 0
step
talk Mimuup##204254
|tip 在建筑物内。
turnin A Worthy Ally: Loamm Niffen##75665 |goto 56.53,55.66 |or
'|complete completedq(75643) |or
step
use the Scentsational Niffen Treasures##205983
collect Splintered Spark of Shadowflame##204717 |q 75641/1 |goto 56.84,54.79
step
talk Examiner Tae'shara Bloodwatcher##204509
turnin Power Unified##75641 |goto 56.84,54.79
step
talk Rupert, the Gentleman Elemental##200291
accept Healing Crystals##73037 |goto 40.10,68.42
step
talk Earthmender Narvra##200953
accept Satiating Sharpbeak##75440 |goto 40.13,68.35
step
talk Veritistrasz##200298
accept Medicinal Fungi##73036 |goto 40.19,68.32
step
click Sharpbeak's Feed
collect 1 Sharpbeak's Feed##205217 |q 75440/1 |goto 40.14,68.19
step
talk Sharpbeak##200300
告诉它“放轻松，放轻松。我在这里帮忙。”
让锋喙接受她的喂食 |q 75440/2 |goto 40.34,67.80
step
talk Sharpbeak##200300
turnin Satiating Sharpbeak##75440 |goto 40.34,67.80
stickystart "Collect_10_Viridian_Heartcrystals"
step
click Drooping Mushroom
collect 1 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 39.87,71.63
step
click Drooping Mushroom
collect 2 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 39.02,70.15
step
click Drooping Mushroom
collect 3 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 37.87,68.69
step
click Drooping Mushroom
collect 4 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 37.60,69.31
step
click Drooping Mushroom
collect 5 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 36.83,69.29
step
click Drooping Mushroom
collect 6 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 36.54,69.54
step
click Drooping Mushroom
collect 7 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 36.82,70.03
step
click Drooping Mushroom
collect 8 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 37.86,70.95
step
click Drooping Mushroom
collect 9 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 36.92,70.88
step
click Drooping Mushroom
collect 10 Drooping Mushroom Cutting##202873 |q 73036/1 |goto 37.07,72.05
step
label "Collect_10_Viridian_Heartcrystals"
在此区域消灭翠绿之敌
collect 10 Viridian Heartcrystal##203012 |q 73037/1 |goto 38.77,72.89
step
talk Veritistrasz##200298
turnin Medicinal Fungi##73036 |goto 40.19,68.32
step
talk Earthmender Narvra##200953
turnin Healing Crystals##73037 |goto 40.13,68.35
step
talk Rupert, the Gentleman Elemental##200291
accept Cavernous Capers##73046 |goto 40.10,68.40
step
talk Rupert, the Gentleman Elemental##200291
告诉他“我已经准备好与你一起冒险了”
与鲁伯特交谈以前往埋藏的宝库 |q 73046/1 |goto 40.10,68.40
step
talk Rupert, the Gentleman Elemental##203176
|tip 他奔向这个地点。
turnin Cavernous Capers##73046 |goto 53.62,79.33
accept Bringing Disorder to Order##73040 |goto 53.62,79.33
step
talk Voraxian##200290
accept A Room Without a View##73038 |goto 53.67,79.52
step
进入建筑物 |goto 52.64,81.98 < 10 |walk
click Elementally Charged Orb
|tip 在建筑物内。
|tip 警告：完成世界任务击杀观察者将使你被踢出此区域，无法重新进入。
|tip 如果发生这种情况，请放弃“将混乱带入秩序”，重新接取。
collect 1 Elementally Charged Orb##203394 |q 73038/1 |goto 51.18,83.24
step
click Elementally Charged Orb
|tip 在建筑物内。
|tip 警告：完成世界任务击杀观察者将使你被踢出此区域，无法重新进入。
|tip 如果发生这种情况，请放弃“将混乱带入秩序”，重新接取。
collect 2 Elementally Charged Orb##203394 |q 73038/1 |goto 53.07,84.77
step
click Elementally Charged Orb
|tip 在建筑物内。
|tip 警告：完成世界任务击杀观察者将使你被踢出此区域，无法重新进入。
|tip 如果发生这种情况，请放弃“将混乱带入秩序”，重新接取。
collect 3 Elementally Charged Orb##203394 |q 73038/1 |goto 51.28,86.23
step
kill 6 Enraged Watcher##200407 |q 73040/1 |goto 53.20,80.58
step
talk Voraxian##200290
turnin A Room Without a View##73038 |goto 53.68,79.51
step
talk Rupert, the Gentleman Elemental##203176
turnin Bringing Disorder to Order##73040 |goto 53.62,79.33
accept Terrestrial Tunneling##73047 |goto 53.62,79.33
step
talk Rupert, the Gentleman Elemental##203176
问他“你能带我回营地吗？”
让鲁伯特带你回到龙鳞营地 |q 73047/1 |goto 53.62,79.33
step
归返龙鳞营地 |q 73047/2 |goto 40.24,68.43
step
talk Rupert, the Gentleman Elemental##200291
turnin Terrestrial Tunneling##73047 |goto 40.12,68.46
step
talk Earthmender Narvra##200953
accept Respite##73041 |goto 40.16,68.34
step
click Peacebloom Tea
click Roasted Kabab
click Fruit Platter
click Cheese Platter
click Roasted Nuts
|tip 选择你喜欢的副本。
选择你的料理 |q 73041/1 |goto 40.17,68.39
step
talk Tellywin Sharpfizzle##200292
问她“我们回收的神器是什么？”
询问泰利温关于你所回收的神器 |q 73041/3 |goto 40.14,68.35
step
talk Earthmender Narvra##200953
turnin Respite##73041 |goto 40.16,68.34
accept A Tower Yonder##73042 |goto 40.16,68.34
step
探索塔楼 |q 73042/1 |goto 48.35,50.30
step
click Broken Weapon
调查破碎的武器 |q 73042/3 |goto 47.92,48.94
step
clicknpc Brimstone Lookout##202825
调查尸体 |q 73042/2 |goto 47.90,48.95
step
clicknpc Brimstone Lookout##202825
选择_拾取干肉_
collect Questionable Jerky##204342 |goto 47.90,48.95 |q 73042
step
click Cracked Jar
调查裂开的罐子 |q 73042/4 |goto 47.64,48.71
step
click Weathered Book
|tip 在角落里的地面上。
选择 _“拾起书本带给纳尔维拉。”_
调查书籍 |q 73042/5 |goto 47.67,48.89
step
click Note to Disposal Site
|tip 废墟之下
collect Note to Disposal Site##204345 |goto 47.63,48.89 |q 73042
step
观察对话
talk Earthmender Narvra##200953
|tip 她走向这个地点。
turnin A Tower Yonder##73042 |goto 48.95,45.52
accept Restless Death##73039 |goto 48.95,45.52
step
talk Veritistrasz##200298
accept A Ghastly Legacy##73043 |goto 48.93,45.51
step
talk Voraxian##200290
accept Cataloging Horror##73044 |goto 48.86,45.41
stickystart "Kill_Researchers_and_Experiments"
step
use the Cataloging Camera##204698
|tip 使用动作条上技能拍摄巨型黄色箭头指向的位置。
|tip 这里应该有两个。
拍摄 #2# 证据的照片 |q 73044/1 |count 2 |goto 49.15,45.09
step
use the Cataloging Camera##204698
|tip 使用动作条上技能拍摄巨型黄色箭头指向的位置。
拍摄证据 |q 73044/1 |count 3 |goto 49.90,45.65
step
use the Cataloging Camera##204698
|tip 使用动作条上技能拍摄巨型黄色箭头指向的位置。
拍摄证据 |q 73044/1 |count 4 |goto 50.12,43.84
step
click Ritual Anchor Totem
放置第一个仪式锚点图腾 |q 73039/1 |goto 50.42,44.00
step
use the Cataloging Camera##204698
|tip 使用动作条上技能拍摄巨型黄色箭头指向的位置。
拍摄证据 |q 73044/1 |count 5 |goto 51.12,43.64
step
use the Cataloging Camera##204698
|tip 使用动作条上技能拍摄巨型黄色箭头指向的位置。
拍摄证据 |q 73044/1 |count 6 |goto 49.63,42.81
step
click Ritual Anchor Totem
放置第二个仪式锚点图腾 |q 73039/2 |goto 50.20,41.14
step
click Ritual Anchor Totem
放置第三个仪式锚点图腾 |q 73039/3 |goto 49.99,38.49
step
click Ritual Anchor Totem
放置第四个仪式锚点图腾 |q 73039/4 |goto 50.22,36.61
step
label "Kill_Researchers_and_Experiments"
在该区域击杀敌人
击杀#15#失败的实验品或可怕的研究者 |q 73043/1 |goto 50.34,37.30
step
_Next to You:_
talk Voraxian##203099
turnin Cataloging Horror##73044 |goto 50.34,37.30
step
talk Veritistrasz##200298
turnin A Ghastly Legacy##73043 |goto 48.35,32.86
step
talk Earthmender Narvra##200953
turnin Restless Death##73039 |goto 48.31,32.79
accept Stain Removal##73045 |goto 48.31,32.79
step
extraaction Cleansing Ritual##408146
开始仪式 |q 73045/1 |goto 48.42,32.87
step
观察对话
完成仪式 |q 73045/2 |goto 48.42,32.87
step
kill Lead Researcher Sytorian##203067 |q 73045/3 |goto 48.83,28.53
step
talk Earthmender Narvra##200953
turnin Stain Removal##73045 |goto 48.31,32.79
step
use the Honorary Explorer's Compass##205254
消耗声望令牌 |complete itemcount(205254) == 0
step
click TICKET: Glimmerogg Games
accept TICKET: Glimmerogg Games##73707 |goto 55.61,54.56
step
talk Myrrit##201426
accept Best Friends##74877 |goto 55.62,57.45
step
talk Effervesta##202778
告诉她“米瑞特在想你是否有时间和他一起去考古。”
与艾弗维斯塔对话 |q 74877/1 |goto 54.61,54.94
step
talk Myrrit##201426
告诉他“埃弗韦斯塔说她会在你的聚集点与您会面。”
将美瑞特的好消息传达出去 |q 74877/2 |goto 55.62,57.45
step
talk Marithos##203233
accept Stress Fractures##73081 |goto 56.38,57.09
|only if Dracthyr
step
talk Floressa##203293
|tip 在建筑物内。
buy 1 Squishy Snack##204791 |q 74877/3 |goto 56.42,55.84
step
在秘密地点查看米瑞特 |q 74877/4 |goto 52.27,62.87
step
talk Myrrit##202766
turnin Best Friends##74877 |goto 52.17,62.80
step
调查被捕获的破碎之焰 |q 73081/1 |goto 55.71,56.98
|only if haveq(73081) or completedq(73081)
step
talk Belligerent Dracthyr##202967
告诉她“你不能这样对待一个囚犯。”
好斗的龙人质问 |q 73081/2 |goto 55.71,56.98
|only if haveq(73081) or completedq(73081)
step
kill Belligerent Dracthyr##200877
震慑好战的德拉克萨르 |q 73081/3 |goto 55.71,57.39
|only if haveq(73081) or completedq(73081)
step
talk Captured Messenger##200876
turnin Stress Fractures##73081 |goto 55.76,57.04 |only if haveq(73081) or completedq(73081)
accept Cold Feet##73085 |goto 55.76,57.04 |only if haveq(73081) or completedq(73081)
|only if haveq(73081,73085) or completedq(73081,73085)
step
click Bag of Sundered Flame Contraband
检查破碎火焰走私袋 |q 73085/1 |goto 55.74,57.04
|only if haveq(73085) or completedq(73085)
step
click Tarnished Box
检查锈蚀的箱子 |q 73085/4 |goto 55.65,57.15
|only if haveq(73085) or completedq(73085)
step
click Stolen Tome
检查被窃取的古籍 |q 73085/3 |goto 55.68,57.18
|only if haveq(73085) or completedq(73085)
step
click Sundered Flame Missive
审查裂焰信件 |q 73085/2 |goto 55.71,57.19
|only if haveq(73085) or completedq(73085)
step
talk Marithos##203233
turnin Cold Feet##73085 |goto 56.38,57.09
|only if haveq(73081) or completedq(73081)
step
talk Patroclosa##200550
accept This Might Sting##73077 |goto 59.39,63.73
|only if Dracthyr
stickystart "Collect-Quartzite_Spore_Bile"
step
click Spongy Loamshroom+
|tip 他们看起来像这个区域周围地面的巨大棕色蘑菇。
collect 8 Spongy Loamshroom##203393 |q 73077/2 |goto 58.85,65.26
|only if haveq(73077) or completedq(73077)
step
label "Collect-Quartzite_Spore_Bile"
kill Quartzite Sporebat##201306+
collect 6 Quartzite Spore Bile##204088 |q 73077/1 |goto 58.52,64.86
|only if haveq(73077) or completedq(73077)
step
clicknpc Sundered Flame Scout##200870
施放解毒药剂 |q 73077/3 |goto 59.36,63.73
|only if haveq(73077) or completedq(73077)
step
talk Patroclosa##200550
turnin This Might Sting##73077 |goto 59.39,63.78
|only if haveq(73077) or completedq(73077)
step
talk Yarren##202597
accept Mouse Detective##74857 |goto 51.05,74.14
step
追踪痕迹 |q 74857/1 |goto 50.40,76.37
step
talk Agrul##202600
询问阿古尔是否见过老鼠。
与阿格鲁尔交谈 |q 74857/2 |goto 50.40,76.37
step
talk Agrul##202600
turnin Mouse Detective##74857 |goto 50.40,76.37
accept Agrulculture##74858 |goto 50.40,76.37
step
_Next to you:_
talk Agrul##202600
accept Sporemoth Exterminator##74859
stickystart "Kill_10_Sporemoths"
step
click Glow Spores+
|tip 在这片区域寻找散发异味的污垢云。
|tip 它们看起来像是黄色烟雾的柱子。
|tip 它们在你的小地图上显示为黄色圆点。
|tip 毒蛇敌人可能随机生成，而不是光菌生成。
观察对话
collect 6 Glow Spores##204377 |q 74858/1 |goto 51.43,76.75
step
label "Kill_10_Sporemoths"
在这个区域击杀孢子蛾敌人
击杀10只孢子虫 |q 74859/1 |goto 50.23,76.76
step
talk Agrul##202600
turnin Agrulculture##74858 |goto 50.40,76.37
turnin Sporemoth Exterminator##74859 |goto 50.40,76.37
accept A Friendly Introduction##74860 |goto 50.40,76.37
step
click Empty Storage Crate
送达丰收  |q 74860/1 |goto 50.96,74.18
step
talk Yarren##202597
选择 "_<介绍阿格鲁尔。>_"
观察对话
将阿古鲁介绍给亚伦 |q 74860/2 |goto 51.05,74.14
step
talk Yarren##202597
turnin A Friendly Introduction##74860 |goto 51.05,74.14
accept An Unfriendly Confrontation##74861 |goto 51.05,74.14
step
寻找阿格鲁尔 |q 74861/1 |goto 46.97,79.03
step
talk Agrul##202600
turnin An Unfriendly Confrontation##74861 |goto 46.89,79.58
accept Mouse Rescuers##75462 |goto 46.89,79.58
step
进入洞穴 |goto 46.66,79.72 < 10 |walk
kill Malrogg##202606 |q 75462/1 |goto 46.38,80.56
|tip 洞内探险
step
观察对话
寻找珀西 |q 75462/2 |goto 46.95,79.57
step
观察对话
跟随阿格鲁尔 |q 75462/3 |goto 51.04,73.95
step
talk Yarren##202597
turnin Mouse Rescuers##75462 |goto 51.05,74.14
step
use the Farmhand's Abundant Harvest##205253
消耗声望令牌 |complete itemcount(205253) == 0
step
talk Brogg the Beast##201098
turnin TICKET: Glimmerogg Games##73707 |goto 43.79,82.98
accept Pay to Play##73708 |goto 43.79,82.98
accept Favor on the Side##73709 |goto 43.79,82.98
step
talk Festival Challenger##202571
告诉他“你是个破坏派对的家伙！”
找到#6#侵入者 |q 73709/1 |goto 44.27,82.29
step
kill Echoed Lurker##202636+
collect 4 Echoed Lurker Flesh##204803 |q 73708/1 |goto 44.20,84.66
step
talk Gudegg##203378
accept Flesh to Bone##75233 |goto 43.21,84.09
step
click Glimmer Mushroom##388520
collect 1 Glimmer Mushroom##205169 |q 73708/2 |goto 38.12,78.45
step
click Glimmer Mushroom##388520
collect 2 Glimmer Mushroom##205169 |q 73708/2 |goto 37.93,77.49
step
click Glimmer Mushroom##388520
collect 3 Glimmer Mushroom##205169 |q 73708/2 |goto 37.63,76.63
step
click Glimmer Mushroom##388520
collect 4 Glimmer Mushroom##205169 |q 73708/2 |goto 38.28,76.66
step
找到洞穴入口 |q 75233/1 |goto 54.73,65.91
stickystart "Collect_Crawler_Venom"
step
kill Osseous Broodmother##203348
|tip 洞内探险
collect 1 Broodmother Venom##205031 |q 75233/3 |goto 52.63,65.26
step
label "Collect_Crawler_Venom"
kill Calcifying Crawler##203342+
|tip 洞内探险
collect 6 Crawler Venom##205030 |q 75233/2 |goto 53.33,65.31
step
talk Gudegg##203378
turnin Flesh to Bone##75233 |goto 43.20,84.08
step
talk Brogg the Beast##201098
turnin Pay to Play##73708 |goto 43.79,82.98
turnin Favor on the Side##73709 |goto 43.79,82.98
step
talk Storul Heavystone##201100
accept Rock By Rock##73710 |goto 44.97,83.29
step
click Starter Rock Bar
提升重量条 |q 73710/1 |count 1 |goto 45.13,83.35
step
click Mid-Weight Rock Bar
提升重量条 |q 73710/1 |count 2 |goto 45.08,83.24
step
click Heavy Rock Bar
提升重量条 |q 73710/1 |count 3 |goto 44.99,83.10
step
talk Storul Heavystone##201100
turnin Rock By Rock##73710 |goto 44.98,83.31
accept Marked Champion##73711 |goto 44.98,83.30
step
进入洞穴 |goto 45.40,86.85 < 10 |walk
kill Carcaxas##202836 |q 73711/1 |goto 45.59,87.62
|tip 洞内探险
step
talk Storul Heavystone##201100
turnin Marked Champion##73711 |goto 44.98,83.29
step
use the Champion's Rock Bar##205251
消耗声望令牌 |complete itemcount(205251) == 0
step
talk Briggul##201752
accept Come Snail Away##74787 |goto 44.25,79.93
|only if factionrenown(2564) >= 7
step
clicknpc Big Slick in the City##202731
会见斯里克 |q 74787/1 |goto 44.17,79.98
|only if haveq(74787) or completedq(74787)
step
talk Briggul##201752
turnin Come Snail Away##74787 |goto 44.26,79.93
|only if haveq(74787) or completedq(74787)
step
kill Scalecommander Sarkareth |q 75694/1 |goto Aberrus, the Shadowed Crucible/4 48.97,71.21
|tip 这是阿贝鲁斯，阴影熔炉团队副本的最终首领。
step
talk Ebyssian##201727
turnin Aberrus, the Shadowed Crucible: Sarkareth##75694 |goto Zaralek Cavern/0 48.01,11.84
accept A Flame, Extinguished##74521 |goto 48.01,11.84
step
观察对话
talk Wrathion##201730
talk Sabellian##201729
选择_“我已准备好进入。”_
与怒火或萨贝利安交谈以进入阿贝鲁斯 |q 74521/1 |goto 48.33,10.18
step
talk Wrathion##202809
talk Sabellian##202810
|tip 这将取决于你选择和谁一起进入。
问他“你能告诉我里面发生了什么吗？”
体验萨卡雷斯命运的重述 |q 74521/2 |goto Aberrus, the Shadowed Crucible/5 51.30,91.36
step
_Next to You:_
talk Wrathion##202809
talk Sabellian##202810
|tip 这将取决于你选择和谁一起进入。
turnin A Flame, Extinguished##74521
accept Remnants##74522
step
_Next to You:_
talk Sabellian##202810
accept A Traitor's Due##74523
stickystart "Slay_Neltharions_Loyalist"
step
talk Drained Djaradin##202858
accept Honorbound##74525 |goto 43.25,51.80
step
click Cage Door##388868
解放贾尔达林 |q 74525/1 |count 1 |goto 42.03,61.52
step
click Cage Door##388868
解放贾尔达林 |q 74525/1 |count 2 |goto 36.68,52.32
step
click Cage Door##388868
解放贾尔达林 |q 74525/1 |count 3 |goto 38.40,42.37
step
click Cage Door##388868
解放贾尔达林 |q 74525/1 |count 4 |goto Aberrus, the Shadowed Crucible/6 55.38,57.00
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 1 |goto 51.15,70.30
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 2 |goto 48.41,69.50
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 3 |goto 46.00,70.16
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 4 |goto 43.94,67.39
step
click Cage Door##388868
解放贾尔达林 |q 74525/1 |count 5 |goto 44.75,59.74
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 5 |goto 43.40,44.05
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 6 |goto 54.37,45.65
step
use Blacktalon Napalm##204271
|tip 把它扔到样本槽里。
摧毁标本罐 |q 74522/1 |count 7 |goto 48.25,26.02
step
label "Slay_Neltharions_Loyalist"
在该区域击杀敌人
击败耐尔萨里昂的忠臣 |q 74523/1 |goto 39.63,50.65
step
_Next to You:_
talk Wrathion##202809
turnin Remnants##74522
step
_Next to You:_
talk Sabellian##202810
turnin A Traitor's Due##74523
turnin Honorbound##74525
step
_Next to You:_
talk Wrathion##202809
accept Into the Dark##75018
step
到达黑石实验室的上层平台 |q 75018/1 |goto 56.58,19.33
step
clicknpc Slitherdrake##202520
骑乘滑行龙前往奈尔萨伦圣殿 |q 75018/2 |goto Aberrus, the Shadowed Crucible/5 34.99,27.09
step
观察对话
|tip 落地后向前冲入房间。
进入遗忘边缘 |goto Aberrus, the Shadowed Crucible/7 50.73,14.00 < 10 |c |noway
step
穿越遗忘边缘 |q 75018/3 |goto 50.75,66.71
|tip 你将安全地掉入下面的池塘。
step
click Door |goto Aberrus, the Shadowed Crucible/8 49.15,47.31
与艾比西安和炎瑟尔会面 |q 75018/4 |goto 49.19,62.44
step
talk Ebyssian##202928
turnin Into the Dark##75018 |goto 49.90,70.94
accept All the Broken Pieces##75028 |goto 49.90,70.94
step
click Signet Shard##402565
收集徽记碎片  |q 75028/1 |count 1 |goto 47.00,75.14
step
click Signet Shard##402565
收集徽记碎片 |q 75028/1 |count 2 |goto 45.37,74.45
step
click Signet Shard##402565
收集徽记碎片 |q 75028/1 |count 3 |goto 45.61,70.78
step
talk Scalecommander Emberthal##202948
turnin All the Broken Pieces##75028 |goto 49.38,70.61
step
talk Ebyssian##202928
accept A Legacy, Reforged##75029 |goto 49.93,70.93
step
click Portal to the Seat of the Aspects
传送到巨龙议会所在之地 |q 75029/2 |goto Aberrus, the Shadowed Crucible/8 49.14,72.74
step
talk Ebyssian##203011
|tip 在塔顶上。
告诉他“是的，谢谢你的耐心等待。”
与艾比希安交谈 |q 75029/3 |goto Valdrakken/0 58.41,39.63
step
观察对话
|tip 在塔顶上。
见证埃比斯和阿莱克丝塔萨的交流 |q 75029/4 |goto 58.42,39.67
step
talk Ebyssian##202928
|tip 在塔顶上。
turnin A Legacy, Reforged##75029 |goto 58.41,39.63
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
accept Symbol of Hope##75417 |goto 58.00,34.59
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
告诉她“给我看看。”
与亚历瑟拉斯对话 |q 75417/1 |goto 58.00,34.59
step
talk Alexstrasza the Life-Binder##187678
|tip 在塔顶上。
turnin Symbol of Hope##75417 |goto 58.00,34.59
step
use the Earth-Warder's Thanks##206006
消耗声望令牌 |complete itemcount(206006) == 0
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Snail Racing",{
author="support@zygorguides.com",
startlevel=68,
patch='100100',
},[[
step
与洛安姆尼芬达到声望等级7 |complete factionrenown(2564) >= 7
|tip 在扎拉克洞穴完成每日任务、每周任务和区域任务以获取声望。
|tip 完成“扎拉莱克洞穴”指南可获得大量的声望令牌。
step
click TICKET: Glimmerogg Games
accept TICKET: Glimmerogg Games##73707 |goto Zaralek Cavern/0 55.61,54.56
step
talk Brogg the Beast##201098
turnin TICKET: Glimmerogg Games##73707 |goto 43.79,82.98
accept Pay to Play##73708 |goto 43.79,82.98
accept Favor on the Side##73709 |goto 43.79,82.98
step
talk Festival Challenger##202571
告诉他“你是个破坏派对的家伙！”
找到#6#侵入者 |q 73709/1 |goto 44.27,82.29
step
kill Echoed Lurker##202636+
collect 4 Echoed Lurker Flesh##204803 |q 73708/1 |goto 44.20,84.66
step
talk Gudegg##203378
accept Flesh to Bone##75233 |goto 43.21,84.09
step
click Glimmer Mushroom##388520
collect 1 Glimmer Mushroom##205169 |q 73708/2 |goto 38.12,78.45
step
click Glimmer Mushroom##388520
collect 2 Glimmer Mushroom##205169 |q 73708/2 |goto 37.93,77.49
step
click Glimmer Mushroom##388520
collect 3 Glimmer Mushroom##205169 |q 73708/2 |goto 37.63,76.63
step
click Glimmer Mushroom##388520
collect 4 Glimmer Mushroom##205169 |q 73708/2 |goto 38.28,76.66
step
talk Brogg the Beast##201098
turnin Pay to Play##73708 |goto 43.79,82.98
turnin Favor on the Side##73709 |goto 43.79,82.98
step
talk Storul Heavystone##201100
accept Rock By Rock##73710 |goto 44.97,83.29
step
click Starter Rock Bar
提升重量条 |q 73710/1 |count 1 |goto 45.13,83.35
step
click Mid-Weight Rock Bar
提升重量条 |q 73710/1 |count 2 |goto 45.08,83.24
step
click Heavy Rock Bar
提升重量条 |q 73710/1 |count 3 |goto 44.99,83.10
step
talk Storul Heavystone##201100
turnin Rock By Rock##73710 |goto 44.98,83.31
accept Marked Champion##73711 |goto 44.98,83.30
step
进入洞穴 |goto 45.40,86.85 < 10 |walk
kill Carcaxas##202836 |q 73711/1 |goto 45.59,87.62
|tip 洞内探险
step
talk Storul Heavystone##201100
turnin Marked Champion##73711 |goto 44.98,83.29
step
与洛安姆尼芬达到声望等级7 |complete factionrenown(2564) >= 7
|tip 在扎拉克洞穴完成每日任务、每周任务和区域任务以获取声望。
|tip 完成“扎拉莱克洞穴”指南可获得大量的声望令牌。
step
_Next to you:_
talk Newsy##205127
accept Off to the Track##75725
|tip 你可能需要重新登录才能看到这个任务，或者离开扎拉卡洞窟。
step
talk Briggul##201752
turnin Off to the Track##75725 |goto 44.25,79.93
accept Come Snail Away##74787 |goto 44.25,79.93
step
clicknpc Big Slick in the City##202731
会见斯里克 |q 74787/1 |goto 44.17,79.98
step
talk Briggul##201752
turnin Come Snail Away##74787 |goto 44.26,79.93
step
label "Begin_Snail_Racing"
talk Grogul##201099
accept A Race to the Finish##75662 |goto 44.45,80.40 |only if not completedq(75662) |or
accept A Race to the Finish##75706 |goto 44.46,80.40 |only if not completedq(75706) |or
accept A Race to the Finish##75707 |goto 44.46,80.40 |only if not completedq(75707) |or
|tip 你将仅偶尔接到其中一个任务。
|tip 如果它未出现，你需要等待下一次刷新。
step
talk Corry##204672
问它“我还有其他方式可以影响赛事结果吗？”
告诉它 "我想要奖励来帮助巴什福赢。"
|tip 只有在种族开始时你才会看到这个对话选项。
与科里交谈并为害羞者收集糖果 |q 75662/1 |goto 44.40,80.42
|only if haveq(75662) or completedq(75662)
step
clicknpc Bashful##204614
extraaction Bashful Treats##409176
|tip 把食物扔在巴什富尔面前。
|tip 竞技场上的蓝色蜗牛
给害羞的蜗牛赛手使用糖果 |q 75662/2 |goto 44.80,80.73
|only if haveq(75662) or completedq(75662)
step
clicknpc Bashful##204614
extraaction Bashful Treats##409176
|tip 把食物扔在巴什富尔面前。
|tip 继续使用“害羞的美味”跟随它。
|tip 只有在攻击你的蜗牛的敌人时才击杀他们。
|tip 否则，他们将发动攻击并减缓竞争。
帮助怯场者赢得竞赛 |q 75662/3 |goto 44.54,81.21
|only if haveq(75662) or completedq(75662)
step
talk Corry##204672
问它“我还有其他方式可以影响赛事结果吗？”
告诉它“我想要道具来帮助调皮获胜。”
|tip 只有在种族开始时你才会看到这个对话选项。
与科里交谈并获取调皮的零食 |q 75706/1 |goto 44.40,80.42
|only if haveq(75706) or completedq(75706)
step
clicknpc Tricky##204616
extraaction Tricky Treats##409203
|tip 就在狡猾面前扔下糖果。
|tip 竞技场上的蓝色蜗牛
使用点心在蜗牛赛手特里基身上 |q 75706/2 |goto 44.80,80.73
|only if haveq(75706) or completedq(75706)
step
clicknpc Tricky##204616
extraaction Tricky Treats##409203
|tip 就在狡猾面前扔下糖果。
|tip 继续使用"狡猾的糖果"跟随它。
|tip 只有在攻击你的蜗牛的敌人时才击杀他们。
|tip 否则，他们将发动攻击并减缓竞争。
帮助特里奇赢得竞速 |q 75706/3 |goto 44.54,81.21
|only if haveq(75706) or completedq(75706)
step
talk Corry##204672
问它“我还有其他方式可以影响赛事结果吗？”
告诉它“我希望有零食能帮助布鲁蕾获胜。”
|tip 只有在种族开始时你才会看到这个对话选项。
与科瑞交谈并获得布鲁莱的甜点 |q 75707/1 |goto 44.40,80.42
|only if haveq(75707) or completedq(75707)
step
clicknpc Brulee##204615
extraaction Brulee Treats##409200
|tip 把食物直接扔到布鲁尔面前。
|tip 竞技场上的蓝色蜗牛
给蜗牛赛车手布鲁雷使用美味佳肴 |q 75707/2 |goto 44.80,80.73
|only if haveq(75707) or completedq(75707)
step
clicknpc Brulee##204615
extraaction Brulee Treats##409200
|tip 把食物直接扔到布鲁尔面前。
|tip 继续使用布鲁勒美食，跟随它。
|tip 只有在攻击你的蜗牛的敌人时才击杀他们。
|tip 否则，他们将发动攻击并减缓竞争。
帮助布鲁雷赢得比赛 |q 75707/3 |goto 44.54,81.21
|only if haveq(75707) or completedq(75707)
step
talk Grogul##201099
turnin A Race to the Finish##75662 |goto 44.46,80.39 |only if readyq(75662)
turnin A Race to the Finish##75706 |goto 44.46,80.40 |only if readyq(75706)
turnin A Race to the Finish##75707 |goto 44.46,80.40 |only if readyq(75707)
|only if readyq(75662,75706,75707)
step
新种族开放时请点击这里 |confirm  |goto 44.46,80.39 |next "Begin_Snail_Racing"
|tip 一个新的种族将在未来的日常重置时开始。
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\The Blue Dragonflight's Legacy",{
author="support@zygorguides.com",
description="This guide will help you complete the campaign for the blue dragonflight.",
condition_suggested=function() return level == 70 and not completedq(72951) end,
startlevel=68,
patch='100100',
},[[
step
talk Kalecgos##187676
|tip 在塔顶上。
accept Keeper of the Ossuary##72900 |goto Valdrakken/0 61.69,36.05
step
talk Senegos##199923
问他，“我在这里帮助你，塞纳留斯。你能告诉我更多关于这个地方的事情吗？”
|tip 你将收到一个警告，表示“碧蓝沼泽”任务线的第一章将被完成。
|tip 如果你同意这个，请点击“是”以继续这个任务链。
在迷雾骨库中与塞尼戈斯交谈 |q 72900/1 |goto Thaldraszus/0 62.23,17.89
step
talk Senegos##199923
turnin Keeper of the Ossuary##72900 |goto 62.23,17.89
accept On the Trail Again##72921 |goto 62.23,17.89
step
talk Senegos##199923
告诉他我准备好接受寻找你的奥术法典的法术了
观察对话
与塞尼古斯交谈 |q 72921/1 |goto 62.23,17.89
step
talk Stellagosa##200099
告诉她“我准备好接收寻找塞尔尼戈斯的奥术古籍的法术。”
与斯特拉戈萨交谈 |q 72921/2 |goto 62.21,17.88
step
进入建筑物 |goto 61.21,16.19 < 10 |walk
click Hidden Tome##385562
|tip 在建筑物内。
collect 1 Tome of Fanciful Spheres##202240 |q 72921/3 |goto 60.86,16.73
step
进入建筑物 |goto 62.02,13.41 < 10 |walk
click Hidden Tome##385563
|tip 在建筑物内。
collect 1 Tome of Rolling##202241 |q 72921/4 |goto 61.70,12.73
step
进入建筑物 |goto 64.05,14.78 < 10 |walk
click Hidden Tome##385564
|tip 在建筑物内。
collect 1 Tome of Sticking##202242 |q 72921/5 |goto 64.47,15.14
step
talk Senegos##199961
turnin On the Trail Again##72921 |goto 63.95,12.33
accept Rolling Out##72933 |goto 63.95,12.33
step
talk Senegos##199961
告诉他我准备好使用奥术球来清理遮蔽圣所。
激活奥术球 |q 72933/1 |goto 63.95,12.33
step
清理遮蔽骨库 |q 72933/2 |goto 65.98,12.36
|tip 你需要填充三次奥术能量。
|tip 第一次，滚动球体击打滑行骨钻者，避开其他虫子。
|tip 当球变大时，将其碾压遍布整个区域的滑行骨虫和掩蔽水妖。
|tip 当球最后一次变大时，跑过所有的虫子类型。
|tip 然后在你的战斗坐骑栏中使用出现在大型发光圆圈上的“发射”技能。
step
进入建筑物 |goto 66.37,12.15 < 10 |walk
talk Senegos##199969
|tip 在建筑物内。
turnin Rolling Out##72933 |goto 66.73,11.97
accept Lest We Forget##72934 |goto 66.73,11.97
step
click Fresh Gravestone
|tip 在建筑物内。
放置第一块墓碑 |q 72934/2 |goto 66.83,11.84 |count 1
step
click Fresh Gravestone
|tip 在建筑物内。
放置第二块墓碑 |q 72934/2 |goto 66.88,11.69 |count 2
step
click Faded Gravestone
|tip 在建筑物内。
选择_更新墓碑_
更新第一块墓碑 |q 72934/1 |goto 66.93,11.64 |count 1
step
click Fresh Gravestone
|tip 在建筑物内。
安放第三块墓碑 |q 72934/2 |goto 66.98,12.08 |count 3
step
click Faded Gravestone
|tip 在建筑物内。
选择_更新墓碑_
更新第二个墓碑 |q 72934/1 |goto 67.03,12.06 |count 2
step
click Fresh Gravestone
|tip 在建筑物内。
放置第四块墓碑 |q 72934/2 |goto 67.08,12.02 |count 4
step
click Faded Gravestone
|tip 在建筑物内。
选择_更新墓碑_
更新第二个墓碑 |q 72934/1 |goto 67.11,11.79 |count 3
step
talk Senegos##200447
|tip 在建筑物内。
turnin Lest We Forget##72934 |goto 67.09,11.77
accept Sindragosa and Malygos's Rest##73069 |goto 67.09,11.77
step
talk Senegos##200447
|tip 在建筑物内。
选择“等待艾克斯特拉萨和卡雷苟斯的到来。”
观察对话
与塞尼戈斯交谈 |q 73069/1 |goto 67.09,11.77
step
talk Kalecgos##200007
|tip 在建筑物内。
turnin Sindragosa and Malygos's Rest##73069 |goto 67.03,11.81
step
talk Senegos##200447
|tip 在建筑物内。
accept Memories of Sindragosa and Malygos##75023 |goto 67.09,11.77
step
talk Memory of a Master##202941
|tip 在建筑物内。
挥动武器以驱散影像
驱散大师的记忆 |q 75023/2 |goto 67.04,12.02
step
talk Memory of a Betrayer##202943
|tip 在建筑物内。
选择 _"挥动你的武器以消除影像。"_
驱散背叛者的记忆 |q 75023/1 |goto 66.85,11.92
step
talk Memory of a Traitorous Sister##202940
|tip 在建筑物内。
选择 _"挥动你的武器以消除影像。"_
驱散背叛姐妹的记忆 |q 75023/3 |goto 66.92,11.68
step
talk Senegos##200447
turnin Memories of Sindragosa and Malygos##75023 |goto 67.09,11.77
accept Archives Return##72935 |goto 67.09,11.77
step
talk Kalecgos##190000
turnin Archives Return##72935 |goto The Azure Span/0 39.47,63.05
accept Azuregos's Support##72936 |goto 39.47,63.05
step
click Portal to the Nexus##248574 |goto The Azure Span/0 39.40,63.00
传送到法师区 |goto Borean Tundra/0 22.27,23.65 < 50 |noway |c |q 72936
step
在北极之地的魔法圣所寻找艾索雷葛斯 |q 72936/1 |goto Borean Tundra/0 22.50,23.83
step
talk Azuregos##199976
turnin Azuregos's Support##72936 |goto 22.50,23.83
accept Unusual Disruptions##72937 |goto 22.50,23.83
step
clicknpc Disruptive Arcana##200524
use Azuregos's Staff##205931
|tip 使用它直到记忆生成。
kill Memory of a Defender##200527
控制北方干扰 |q 72937/1 |goto 26.61,24.61
step
clicknpc Disruptive Arcana##200532
use Azuregos's Staff##205931
|tip 使用它直到记忆生成。
kill Memory of a Torturer##202555
遏制东方扰动 |q 72937/3 |goto 29.20,26.63
step
clicknpc Disruptive Arcana##205311
use Azuregos's Staff##205931
|tip 使用它直到记忆生成。
kill Memory of a Torturer##200529
遏制南方动乱 |q 72937/2 |goto 26.76,28.99
step
talk Azuregos##199976
turnin Unusual Disruptions##72937 |goto 22.50,23.83
accept Archival Arrival##72938 |goto 22.50,23.83
step
click Portal to the Azure Archives |goto 22.23,23.62
传送到蓝色档案馆 |goto The Azure Span/0 39.43,62.97 < 50 |noway |c |q 72938
step
talk Kalecgos##190000
turnin Archival Arrival##72938 |goto The Azure Span/0 39.47,63.05
accept Where in the World is a Lost Blue Dragon?##72940 |goto 39.47,63.05 |only if not completedq(73090)
step
click Dragon Locator
accept Crystalsong Forest##73091 |goto 39.48,63.03 |or
|only if not completedq(73090)
step
talk Kalecgos##190000
turnin Crystalsong Forest##73091 |goto 39.47,63.05 |only if not completedq(73090)
accept Regrets in Crystal##73090 |goto 39.47,63.05
step
click Portal to Crystalsong Forest |goto 39.40,63.01
传送至水晶之歌森林 |goto Zul'Drak/0 12.29,66.77 < 50 |c |noway |q 73090
step
talk Lanigosa##199184
turnin Regrets in Crystal##73090 |goto Crystalsong Forest/0 91.33,57.22
accept Those We Left Behind##72670 |goto 91.33,57.22
accept A Shattered Legacy##72674 |goto 91.33,57.22
stickystart "Sooth_Echoes"
step
click Crystalline Remains##384960+
|tip 它们看起来像这个区域周围地面上的大堆紫色尘埃。
collect 6 Crystal Focus Fragment##202044 |q 72674/1 |goto 87.69,60.31
step
label "Sooth_Echoes"
talk Frightened Memory##200171
|tip 选择对话选项，如果他们攻击你就击杀他们。
抚慰 #6# 回声 |q 72670/1 |goto 87.69,60.31
step
talk Lanigosa##199184
turnin Those We Left Behind##72670 |goto 91.33,57.22
turnin A Shattered Legacy##72674 |goto 91.33,57.22
accept An Arcane Requiem##72679 |goto 91.33,57.22
step
click Crystal Focus
|tip 点击它并击杀出现的怪物，直到融合体出现。
kill Amalgam of Desperation##199423 |q 72679/2 |goto 86.49,69.12
step
talk Lanigosa##199184
turnin An Arcane Requiem##72679 |goto 91.33,57.22
accept The Sound of Silence##74783 |goto 91.33,57.22
step
click Portal to the Azure Archives |goto 91.50,56.93
传送到蓝色档案馆 |goto The Azure Span/0 39.47,63.05 < 50 |c |noway |q 74783
step
talk Kalecgos##190000
turnin The Sound of Silence##74783 |goto The Azure Span/0 39.47,63.05
accept The Search for Blue Dragons##73399 |goto 39.47,63.05 |only if not completedq(72988)
step
click Dragon Locator
accept Booty Bay##73026 |goto 39.49,63.03
|only if not completedq(72988)
step
talk Senegos##186240
turnin Booty Bay##73026 |goto 39.47,62.99 |only if not completedq(72988)
accept The Booty Bay Journal##72988 |goto 39.47,62.99
step
talk Senegos##186240
告诉他“帮我在藏宝海湾洗清名声，这样我们就能开始了。”
与塞尼戈斯交谈，以消除你在藏宝海湾的声望。 |q 72988/1 |goto 39.47,62.99
step
click Portal to Booty Bay
从蔚蓝档案馆乘坐传送门到藏宝湾 |q 72988/3 |goto 39.51,62.92
step
talk Zeros##199185
turnin The Booty Bay Journal##72988 |goto The Cape of Stranglethorn/0 41.32,73.06
accept No Such Thing as Bad Luck##72527 |goto 41.32,73.06
step
talk Zeros##199185
turnin No Such Thing as Bad Luck##72527 |goto 42.77,74.01
step
talk Blixrez Goodstitch##2846
|tip 在建筑物内。
accept Information is King##72529 |goto 42.83,74.13
step
kill Sandy Crocolisk##199196+
|tip 你可以出价1000金币，但这个很快就能刷到。
collect 3 Crocolisk Skin##201986 |q 72529/2 |goto 35.05,63.13
step
talk Blixrez Goodstitch##2846
|tip 在建筑物内。
交出鳄鱼皮
从布里克雷兹·贡斯提奇那里获取信息 |q 72529/1 |goto 42.83,74.13
step
talk Blixrez Goodstitch##2846
|tip 在建筑物内。
turnin Information is King##72529 |goto 42.83,74.13
step
talk Zeros##199185
|tip 在建筑物内。
accept Anyway, I Started Bribing##72530 |goto 42.77,74.02
step
clicknpc Hired Bodyguard##199211
贿赂#6# 雇佣护卫 |q 72530/1 |goto 56.43,60.58
step
talk Prospector Arty##199213
选择 "<获取关于零的水晶的信息>"
对抗探矿者阿尔提 |q 72530/2 |goto 56.20,60.10
step
talk Zeros##199185
turnin Anyway, I Started Bribing##72530 |goto 42.32,77.36
accept Money, Money, Money!##72532 |goto 42.32,77.36
accept Crystals Shmystals##72533 |goto 42.32,77.36
stickystart "Collect_1500_Gold_Coins"
step
kill Captain Grub Redcut##199351
collect 1 Worn Brass Key##202284 |q 72533/1 |goto 33.67,83.93
step
click Treasure Chest##385765
|tip 船舱下层
collect 1 Gold Ingot##202281 |q 72533/2 |goto 33.88,84.00
step
label "Collect_1500_Gold_Coins"
在船上击杀敌人
collect 1500 Gold Coins##204705 |q 72532/1 |goto 34.35,84.77
step
talk Zeros##199185
turnin Money, Money, Money!##72532 |goto 42.31,77.36
turnin Crystals Shmystals##72533 |goto 42.31,77.36
accept Settled with the Baron##72534 |goto 42.31,77.36
step
talk Baron Revilgaz##200473
选择 _"交出宝藏。"_
将宝藏交给雷维盖兹男爵 |q 72534/1 |goto 42.16,77.41
step
观察对话
talk Zeros##199185
turnin Settled with the Baron##72534 |goto 42.31,77.36
step
talk Senegos##200478
accept Zeroing Debt##73181 |goto 42.06,77.58
step
click Portal to Azure Archives
使用传送门返回蔚蓝档案馆 |q 73181/1 |goto 42.33,77.51
step
talk Senegos##186240
turnin Zeroing Debt##73181 |goto The Azure Span/0 39.47,62.98
step
talk Kalecgos##190000
accept Lost Blue Dragons##73404 |goto 39.47,63.05
|only if not completedq(72657)
step
click Dragon Locator
accept Winterspring##72656 |goto 39.49,63.03
|only if not completedq(72657)
step
talk Sindragosa##186188
turnin Winterspring##72656 |goto 39.48,63.07 |only if not completedq(72657)
accept A Protector of Magic##72657 |goto 39.48,63.07
step
click Portal to Winterspring
使用传送门前往冬泉谷 |q 72657/1 |goto 39.51,63.09
step
talk Haleh##199370
turnin A Protector of Magic##72657 |goto Winterspring/0 48.07,59.06
accept Artifacts Abound##74354 |goto 48.07,59.06
step
click Owlkin Totem
collect 1 Totemic Ruins##203459 |q 74354/1 |goto 61.62,26.59
step
click Owlkin Totem
collect 2 Totemic Ruins##203459 |q 74354/1 |goto 62.41,26.56
step
click Owlkin Totem
collect 3 Totemic Ruins##203459 |q 74354/1 |goto 62.66,25.81
step
click Owlkin Totem
collect 4 Totemic Ruins##203459 |q 74354/1 |goto 62.64,25.12
step
click Owlkin Totem
collect 5 Totemic Ruins##203459 |q 74354/1 |goto 61.83,25.17
step
talk Haleh##199370
turnin Artifacts Abound##74354 |goto 48.07,59.06
accept Test Subject##72659 |goto 48.07,59.06
step
click Icy Book
冰霜书籍测试 |q 72659/2 |goto 48.16,58.92
step
click Bottled Spirits
装瓶的灵魂测试 |q 72659/1 |goto 48.22,58.93
step
click Left Boot
左靴测试 |q 72659/3 |goto 48.24,58.98
step
talk Haleh##199370
turnin Test Subject##72659 |goto 48.06,59.06
accept Owl of a Sudden##72660 |goto 48.06,59.06
step
talk Haleh##199370
告诉她“我已准备好。”
与哈雷对话开始测试 |q 72660/1 |goto 47.34,60.53
step
click Half-Restored Totem
试验半修复图腾 |q 72660/2 |goto 47.49,60.75
step
talk Haleh##199370
|tip 使用技能条上的技能攻击哈雷直到她停止。
turnin Owl of a Sudden##72660 |goto 47.33,60.53
step
talk Sindragosa##199404
accept A Wyrm Rest##72661 |goto 47.53,60.22
step
观察对话
talk Sindragosa##199404
问她“计划是什么？”
与辛德拉苟萨交谈 |q 72661/1 |goto 47.53,60.22
step
clicknpc Sindragosa##199404
前往霜火热泉 |q 72661/2 |goto 32.17,48.96
step
进入温泉水域 |q 72661/3 |goto 32.12,49.32
step
talk Sindragosa##199404
turnin A Wyrm Rest##72661 |goto 32.30,49.13
accept Back with the Blues##74356 |goto 32.30,49.13
step
click Portal to Azure Archives
使用传送门返回蔚蓝档案馆 |q 74356/1 |goto 32.33,49.02
step
talk Sindragosa##186188
turnin Back with the Blues##74356 |goto The Azure Span/0 39.48,63.07
step
talk Kalecgos##190000
accept A Pair of Blue Dragons##73405 |goto 39.47,63.05
|only if not completedq(73188)
step
click Dragon Locator
accept Theramore##72939 |goto 39.48,63.03
|only if not completedq(73188)
step
talk Kalecgos##190000
turnin Theramore##72939 |goto 39.47,63.06 |only if not completedq(73188)
accept The Sullied Banner##73188 |goto 39.47,63.06
step
click Portal to Theramore |goto 39.40,63.04
传送到塞拉摩 |goto Dustwallow Marsh/0 57.18,55.51 < 50 |c |noway |q 73188
step
talk Surigosa##199736
turnin The Sullied Banner##73188 |goto 62.93,49.67
accept Aftershocks##72832 |goto 62.93,49.67
step
talk Kalecgos##199737
accept Creative Solutions##72831 |goto 62.79,49.73
stickystart "Kill_Militant_Arcanists"
step
click Prototype Mana Bomb
传送 #5# 原型法力炸弹 |q 72832/1 |goto 64.34,48.77
step
label "Kill_Militant_Arcanists"
kill 8 Militant Arcanist##199739 |q 72831/1 |goto 64.34,48.77
step
talk Kalecgos##199737
turnin Creative Solutions##72831 |goto 67.04,55.03
step
talk Surigosa##199736
turnin Aftershocks##72832 |goto 67.03,54.59
accept Breaking the Cycle##72833 |goto 67.03,54.59
step
kill Turi Flickerflame##199740 |q 72833/1 |goto 67.79,51.12
step
talk Surigosa##199736
turnin Breaking the Cycle##72833 |goto 67.04,54.55
accept A Moment of Reflection##74335 |goto 67.04,54.55
step
click Portal to the Azure Span
|tip 在建筑物内。
前往碧蓝档案的卡勒克传送门 |q 74335/1 |goto 66.84,53.17
step
talk Kalecgos##190000
turnin A Moment of Reflection##74335 |goto The Azure Span/0 39.47,63.05
accept The Last Missing Blue Dragon##73406 |goto 39.47,63.05 |only if not completedq(72650)
step
click Dragon Locator
accept Jade Forest##73227 |goto 39.48,63.03
|only if not completedq(72650)
step
talk Kalecgos##190000
turnin Jade Forest##73227 |goto 39.47,63.05 |only if not completedq(72650)
accept Warm Winds and Water##72650 |goto 39.47,63.05
step
click Portal to Jade Forest
|tip 在建筑物内。
从蓝色档案馆传送门前往翡翠林 |q 72650/1 |goto 39.42,63.02
step
talk Kirygosa##199361
turnin Warm Winds and Water##72650 |goto The Jade Forest/0 46.51,44.51
accept Carp Care##72651 |goto 46.51,44.51
accept Local Deliveries##72653 |goto 46.51,44.51
stickystart "Feed_Carps_and_Clean_Ponds"
step
talk Yol##56778
告诉她“这些花来自基瑞古萨。”
交付给面条商人尤尔 |q 72653/4 |goto 46.38,45.66
step
talk Ni Gentlepaw##56777
告诉她“这些花来自基瑞古萨。”
交付给尼·温柔爪 |q 72653/2 |goto 46.55,46.02
step
talk Kai Wanderbrew##59173
告诉他“这些花是来自基里克萨”。
交付给凯·漫游酿酒师 |q 72653/1 |goto 46.97,46.01
step
talk Old Man Misteye##59383
告诉他“这些花是来自基里克萨”。
交付给老者迷雾眼 |q 72653/3 |goto 48.32,46.06
step
label "Feed_Carps_and_Clean_Ponds"
clicknpc Veridian Carp##59311+
|tip 给他们使用鱼食。
use the Fish Food##203182
click Pond Scum+
|tip 他们看起来像漂浮在水面上的垃圾。
喂食鲤鱼和清理池塘 |q 72651/1 |goto 46.94,45.23
你可以在[48.04,48.00]附近找到更多。
step
talk Kirygosa##199361
turnin Carp Care##72651 |goto 46.51,44.51
turnin Local Deliveries##72653 |goto 46.51,44.51
accept Up, Up, and Home##72654 |goto 46.51,44.51
step
观察对话
talk Kirygosa##199361
告诉她“我已准备好前往你的城堡。”
与奇瑞戈萨一起起飞 |goto 46.51,44.51 > 20 |c |q 72654
step
观察对话
与基瑞苟萨一起飞翔 |q 72654/1 |goto 49.24,43.20
|tip 着陆后需要一点时间才能完成。
step
talk Kirygosa##199361
|tip 在建筑物内。
turnin Up, Up, and Home##72654 |goto 49.17,42.47
step
talk Kalecgos##201019
|tip 在建筑物内。
accept Self Care##72652 |goto 49.20,42.50
step
click Dust Clump
|tip 在建筑物内。
清理基尔戈西亚的家园 |q 72652/1 |goto 49.24,42.51 |count 1
step
click Fallen Pillow
|tip 在建筑物内。
清理基尔戈西亚的家园 |q 72652/1 |goto 49.23,42.57 |count 2
step
click Food Scraps
|tip 在建筑物内。
清理基尔戈西亚的家园 |q 72652/1 |goto 49.14,42.54 |count 3
step
click Crooked Painting
|tip 在建筑物内。
清理基尔戈西亚的家园 |q 72652/1 |goto 49.09,42.53 |count 4
step
click Dead Flower Bunch
|tip 在建筑物内。
清理基尔戈西亚的家园 |q 72652/1 |goto 49.15,42.42 |count 5
step
talk Kalecgos##201019
|tip 在建筑物内。
turnin Self Care##72652 |goto 49.21,42.50
accept A Drink with Kalecgos##72655 |goto 49.21,42.50
step
click Mug of Roasted Barley Tea
|tip 在建筑物内。
在醉酒的猴子酒吧和卡雷苟斯共饮 |q 72655/1 |goto 45.90,43.65
step
talk Kalecgos##201019
|tip 在建筑物内。
turnin A Drink with Kalecgos##72655 |goto 45.87,43.61
accept Blue is My Favorite Color##74291 |goto 45.87,43.61
step
talk Kirygosa##199361
|tip 在建筑物内。
问她“你会和我们一起回龙岛吗？”
与基瑞戈萨交谈 |q 74291/1 |goto 45.90,43.57
step
观察对话
talk Kalecgos##201019
|tip 在建筑物内。
告诉他"我准备好回到蓝色档案馆了。"
与卡雷苟斯交谈 |q 74291/2 |goto 45.87,43.60
step
click Portal to the Azure Archives
|tip 在建筑物内。
使用传送门返回蔚蓝档案馆 |q 74291/3 |goto 45.81,43.47
step
talk Kalecgos##190000
turnin Blue is My Favorite Color##74291 |goto The Azure Span/0 39.47,63.05
accept Reunited Again##75244 |goto 39.47,63.05
step
talk Kalecgos##190000
告诉他“我准备好听你对蓝龙的演讲了。”
观察对话
聆听卡雷哥斯的演讲 |q 75244/1 |goto 39.47,63.05
step
talk Kalecgos##190000
turnin Reunited Again##75244 |goto 39.47,63.05
accept Veiled Trouble##72942 |goto 39.47,63.05
step
click Portal to the Veiled Ossuary |goto 39.40,63.01
传送至隐秘骨库 |goto Thaldraszus/0 65.79,12.47 < 50 |c |noway |q 72942
step
talk Azuregos##200019
turnin Veiled Trouble##72942 |goto 66.20,12.26
accept Veiled Ossuary Chaos##72946 |goto 66.20,12.26
accept Memories of Old##72947 |goto 66.20,12.26
stickystart "Weaken_the_Arcane_Invaders"
step
进入建筑物 |goto 63.46,16.09 < 10 |walk
kill Memory of a Traitorous Sister##200826 |q 72947/1 |goto 64.04,16.30
|tip 在建筑物内。
step
kill Memory of a Master##200827 |q 72947/2 |goto 59.95,14.95
step
进入建筑物 |goto 62.04,13.45 < 10 |walk
kill Memory of a Betrayer##200828 |q 72947/3 |goto 61.68,12.72
|tip 在建筑物内。
step
label "Weaken_the_Arcane_Invaders"
clicknpc Bound Spirit##200866+
|tip 它们看起来像被震惊的龙类，头顶有蓝色火焰。
在该区域击杀敌人
削弱秘法入侵者 |q 72946/1 |goto 62.70,15.05
step
talk Azuregos##200019
turnin Veiled Ossuary Chaos##72946 |goto 66.20,12.26
turnin Memories of Old##72947 |goto 66.20,12.26
accept What Still Remains##72948 |goto 66.20,12.26
step
talk Azuregos##200019
告诉他我准备突破奥术屏障。
观察对话
|tip 跟随他进入建筑物。
与阿祖鲁戈斯交谈 |q 72948/1 |goto 66.20,12.26
step
click Sindragosa's Lingering Essence##386116
|tip 在建筑物内。
collect 1 Sindragosa's Lingering Essence##203183 |q 72948/3 |goto 67.10,11.75
step
click Malygos's Lingering Essence##386117
|tip 在建筑物内。
collect 1 Malygos's Lingering Essence##203184 |q 72948/2 |goto 67.11,11.83
step
talk Azuregos##201061
|tip 在建筑物内。
turnin What Still Remains##72948 |goto 67.07,11.83
accept Swiftly to the Archives##72949 |goto 67.07,11.83
step
click Portal to the Azure Archives |goto 65.64,12.57
传送到蓝色档案馆 |goto The Azure Span/0 39.43,62.97 < 50 |c |noway |q 72949
step
talk Kalecgos##190000
turnin Swiftly to the Archives##72949 |goto 39.47,63.06
step
talk Sindragosa##186188
accept The Last Conflict##72950 |goto 39.48,63.07
step
talk Sindragosa##186188
告诉她“我准备好进入艾苏瓦尔德，解救玛里苟斯和辛德拉苟萨的精华。”
进入苍穹宝库 |goto 39.48,63.07 > 50 |c |q 72950
step
talk Kalecgos##201087
告诉他我已准备好。
|tip 坐标在这个房间内无法使用。
观察对话
与卡雷苟斯交谈 |scenariogoal 1/57829 |q 72950
step
extraaction Azure Assault##406529
kill Remnants of Sindragosa##201089 |scenariogoal 2/57830 |q 72950
|tip 在“眼泪之墓”期间，跑到冰块后面。
|tip 使用屏幕上的“苍穹攻击”按钮打断“注定归她掌控”。
|tip 远离地面上的目标区域。
|tip 逃离毁灭
|tip 在她施放法术"秘法吐息"时不要站在她面前
step
观察对话
talk Kalecgos##201087
告诉他我已准备好。
与卡雷苟斯交谈 |scenarioend |q 72950
step
完成场景“最后的冲突” |q 72950/1 |goto 0.00,0.00
step
talk Kalecgos##201128
turnin The Last Conflict##72950 |goto 39.33,63.88
step
talk Senegos##201125
accept A Peaceful Farewell##72951 |goto 39.31,63.59
step
talk Senegos##201125
告别他，塞纳里奥。
最后一次与塞纳古斯交谈 |q 72951/1 |goto 39.31,63.59
step
talk Kalecgos##190000
turnin A Peaceful Farewell##72951 |goto 39.47,63.06
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Tyr's Fall",{
author="support@zygorguides.com",
description="This guide will help you complete the continuing story of the \"A Sliver of Silver\" Valdrakken Accord questline.",
condition_suggested=function() return level == 70 and not completedq(72444) end,
startlevel=70,
patch='100100',
},[[
step
完成“银色使命”任务 |complete completedq(67084)
|tip 达到瓦德拉肯协议的声望等级13并完成银色使命任务线。
|tip 这将解锁“银色之片”任务线。
step
talk Nozdormu##198941
|tip 在建筑物内。
accept Silver Mettle##72440 |goto Thaldraszus/0 60.39,58.83
step
观察对话
确认恢复泰尔的计划 |q 72440/1 |goto 60.42,58.74
|tip 在建筑物内。
step
click Portal to Tomb of Tyr
|tip 在建筑物内。
使用传送门前往提尔之墓 |q 72440/2 |goto 60.42,58.74
step
接近特拉瓦德 |q 72440/3 |goto Tirisfal Glades/25 39.12,41.22
step
观察对话
talk Watcher Koranos##200077
turnin Silver Mettle##72440 |goto 38.26,40.42
step
talk Travard##198947
accept Breaching the Tomb##72441 |goto 39.12,41.26
step
click Broken Titan Orb
检查破碎的法珠 |q 72441/1 |goto 39.10,42.56
step
click Titan Orb
激活泰坦球 |q 72441/2 |goto 35.41,42.71
step
观察对话
talk Travard##200084
turnin Breaching the Tomb##72441 |goto 37.51,55.57
step
talk Watcher Koranos##199114
accept The Remains of Tyr##72442 |goto 37.89,54.99
step
在该区域击杀敌人
保护科拉诺斯 |q 72442/1 |goto 37.39,54.93
step
talk Watcher Koranos##199114
turnin The Remains of Tyr##72442 |goto 37.84,54.86
accept Keeper's Rest##72526 |goto 37.84,54.86
step
逃离暗行者 |q 72526/1 |goto 41.04,82.23
step
观察对话
talk Watcher Koranos##200078
turnin Keeper's Rest##72526 |goto 42.06,85.71
accept Tyr's Fall##72443 |goto 42.06,85.71
step
click Titan Console
将银色鳞片放入控制台。
将银色鳞片放置在泰坦控制台中 |q 72443/1 |goto 45.85,83.99
step
click Titan Console
选择 _“见证提尔的最后记忆。” (开始场景)_
进入场景 |scenariostart |goto 45.85,84.02 |q 72443
stickystart "Slay_Flesh_Spawns"
step
clicknpc Iron Vrykul##198962+
|tip 在你的载具工具条上使用“泰尔之光”技能，对准铁矮人。
集结 #4# 铁伏矿狼人 |scenariogoal 1/58790 |goto The Eastern Glades/0 62.86,78.54 |q 72443
step
label "Slay_Flesh_Spawns"
kill 6 Flesh Spawn##199049 |scenariogoal 1/57819 |goto 64.72,82.19 |q 72443
|tip 使用你的载具技能条上的技能。
step
在该区域击杀敌人
clicknpc Iron Vrykul##198962+
|tip 在你的载具工具条上使用“泰尔之光”技能，对准铁矮人。
击败古神势力 |scenariogoal 2/0 |goto 56.05,59.69 |q 72443
step
kill Kith'ix##198952 |scenariogoal 3/57821 |goto 50.16,59.37 |q 72443
|tip 使用你的载具技能条上的技能。
step
在该区域击杀敌人
clicknpc Iron Vrykul##198962+
|tip 在你的载具工具条上使用“泰尔之光”技能，对准铁矮人。
击败古神势力 |scenariogoal 4/0 |goto 41.06,43.75 |q 72443
step
观察对话
接近扎卡兹 |scenariogoal 5/57823 |goto 35.66,30.72 |q 72443
stickystart "Kill_Neltharion"
stickystart "Kill_Nozdormu"
stickystart "Kill_Ysera"
step
kill Malygos##198974 |scenariogoal 6/58127 |goto 36.16,29.92 |q 72443
|tip 离开地面目标区域。
step
label "Kill_Neltharion"
kill Neltharion##198968 |scenariogoal 6/57824 |goto 36.17,32.45 |q 72443
|tip 离开地面上的火焰区域。
step
label "Kill_Nozdormu"
kill Nozdormu##198971 |scenariogoal 6/58129 |goto 35.48,31.09 |q 72443
|tip 避免在他施放吐息技能时站在他面前。
step
label "Kill_Ysera"
kill Ysera##198970 |scenariogoal 6/58128 |goto 36.23,28.71 |q 72443
|tip 把她移出治疗的绿色光圈。
|tip 在“噩梦之息”期间不要站在她面前
step
kill Zakajz##198953 |scenariogoal 7/57825 |goto 35.47,29.71 |q 72443
|tip 在“净化之焰”期间不要站在他面前
step
见证提尔之陨 |q 72443/2
step
talk Watcher Koranos##200078+
|tip 洞内探险
turnin Tyr's Fall##72443 |goto Tirisfal Glades/25 42.06,85.73
accept A Sliver of Silver##72444 |goto 42.06,85.73
step
click Titan Transporter
使用泰坦传送器返回泰尔霍德 |q 72444/1 |goto 43.87,88.72
step
归返龙神 |q 72444/2 |goto Thaldraszus/0 60.39,58.82
step
click Forge Console
选择_“激活银色鳞片。”_
激活银鳞 |q 72444/3 |goto 60.54,58.74
step
观察对话
talk Nozdormu##198941
turnin A Sliver of Silver##72444 |goto 60.39,58.82
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Rebel Resurgence",{
author="support@zygorguides.com",
description="This guide will help you complete the \"Rebel Resurgence\" questline.",
condition_suggested=function() return level == 70 and not completedq(75230) end,
startlevel=70,
patch='100100',
},[[
step
完成“报告反叛者”任务 |complete completedq(70879) |or
|tip 完成“塔尔德拉尔兹（全区域）”升级指南中的雾霭谷任务线。
|tip 这将解锁“无叛逆原因”任务线。
点击这里加载 "萨尔德拉苏斯（完整区域）"  leveling 指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)" |or
step
talk Captain Drine##189842
|tip 在塔顶上。
accept Cause Without a Rebel##72411 |goto Valdrakken/0 55.96,39.96
step
加入玛尔德拉和艾瑞达斯 |q 72411/2 |goto 55.51,33.61
|tip 建筑内部的地下室
step
观察对话
|tip 建筑内部的地下室
听取讨论 |q 72411/3 |goto 55.14,34.13
step
talk Investigator Erima##200754
|tip 建筑内部的地下室
turnin Cause Without a Rebel##72411 |goto 55.77,33.65
accept Explosive Interruption##72412 |goto 55.77,33.65
step
talk Investigator Erima##199397+
turnin Explosive Interruption##72412 |goto Thaldraszus/0 46.42,50.86
accept Irreconcilable Differences##72413 |goto 46.42,50.86
step
talk Maldra Flametongue##199396
accept Know Prisoners!##72414 |goto 46.36,50.71
accept Rebel Rousing Writings##72415 |goto 46.36,50.71
stickystart "Collect_Propaganda"
stickystart "Capture_Rebels
step
kill 1 Agitator Zoralek##199305 |q 72413/1 |goto 43.95,52.66
step
collect 1 Rebel Detonator##204407 |q 72413/2 |goto 43.95,52.66
|tip 从煽动者佐拉莱克那里获得战利品。
step
label "Collect_Propaganda"
click Rebel Writing+
|tip 它们看起来像是贴在洞穴墙壁上的小纸条。
|tip 它们在你的小地图上显示为黄色圆点。
收集#5#宣传品 |q 72415/1 |goto 45.02,52.01
step
label "Capture_Rebels
点击周围区域的反抗军敌人
use Maldra's Ring of Elemental Binding##202855
|tip 对叛乱者使用它，有机会捕获他们。
捕获第八小队叛军 |q 72414/1 |goto 45.02,52.01
step
talk Investigator Erima##199397
turnin Irreconcilable Differences##72413 |goto 46.42,50.86
step
talk Maldra Flametongue##199396
turnin Know Prisoners!##72414 |goto 46.36,50.72
turnin Rebel Rousing Writings##72415 |goto 46.36,50.72
accept Temporary Accommodations##72416 |goto 46.36,50.72
step
talk Alexstrasza the Life-Binder##199382
turnin Temporary Accommodations##72416 |goto 38.89,52.57
accept Persistent Dissidents##72417 |goto 38.89,52.57
step
talk Steelcliff Dissident##201112
问他“你为什么反抗龙族？”
采访反叛异议者 |q 72417/1 |goto 38.63,52.58 |count 1
step
talk Steelcliff Dissident##201113
问她“你为什么反抗龙族？”
采访反叛异议者 |q 72417/1 |goto 38.39,53.70 |count 2
step
talk Steelcliff Dissident##201111
问她“你为什么反抗龙族？”
采访反叛异议者 |q 72417/1 |goto 38.27,51.38 |count 3
step
talk Steelcliff Dissident##201130
问她“你为什么反抗龙族？”
采访反叛异议者 |q 72417/1 |goto 37.70,51.46 |count 4
step
talk Steelcliff Dissident##201131
问他“你为什么反抗龙族？”
采访反叛异议者 |q 72417/1 |goto 37.80,50.47 |count 5
step
归还给德麟船长 |q 72417/2 |goto 38.80,52.60
step
talk Alexstrasza the Life-Binder##201211
turnin Persistent Dissidents##72417 |goto 38.80,52.60
accept Solicited Opinions##72418 |goto 38.80,52.60
step
talk Alexstrasza the Life-Binder##201211
选择你喜欢的对话选项
与艾露尼亚分享你的视角 |q 72418/1 |goto 38.80,52.60
step
talk Alexstrasza the Life-Binder##201211
turnin Solicited Opinions##72418 |goto 38.80,52.60
step
talk Captain Drine##200788
accept Cleaning up the Cliffraff##72419 |goto 38.85,52.67
step
talk Investigator Erima##199301
turnin Cleaning up the Cliffraff##72419 |goto 46.41,55.91
accept Wreckonciliation##72420 |goto 46.41,55.91
step
talk Maldra Flametongue##199391
accept The Quill to Power##72421 |goto 46.50,55.80
accept Stop the Presses##72422 |goto 46.50,55.80
stickystart "Inform_Rebels_of_Coming_Changes"
stickystart "Apprehend_Quills"
step
kill Instigator Belaphon##199304
|tip 洞内探险
|tip 将他的生命值降低到50%以下。
use Maldra's Ring of Elemental Binding##203390
|tip 在贝拉方低于50%生命值时使用它。
对抗贝拉丰 |q 72422/1 |goto 44.26,55.53
step
label "Inform_Rebels_of_Coming_Changes"
use the Notes on Dragonkin Equality##203383
|tip 在整个区域内对各种反叛敌人使用它们。
通知#12# 反抗军即将到来的变革 |q 72420/1 |goto 45.36,56.60
step
label "Apprehend_Quills"
clicknpc Enchanted Quill##199624+
|tip 他们在这片区域看起来像飞翔的羽毛。
逮捕 #6# 羽毛 |q 72421/1 |goto 45.36,56.60
step
talk Investigator Erima##199301
turnin Wreckonciliation##72420 |goto 46.41,55.92
step
talk Maldra Flametongue##199391
turnin The Quill to Power##72421 |goto 46.50,55.81
step
向艾露奈尔报告 |q 72422/2 |goto Valdrakken/0 76.77,33.50
|tip 在塔顶上。
step
talk Alexstrasza the Life-Binder##200839
|tip 在塔顶上。
turnin Stop the Presses##72422 |goto 76.77,33.50
accept Reconcilable Dissidents##75230 |goto 76.77,33.50
step
talk Alexstrasza the Life-Binder##200839
|tip 在塔顶上。
问她 “现在会发生什么？”
与亚历瑟拉斯对话 |q 75230/1 |goto 76.77,33.50
step
talk Alexstrasza the Life-Binder##200839
|tip 在塔顶上。
turnin Reconcilable Dissidents##75230 |goto 76.77,33.50
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Some Wicked Things (Warlock)",{
author="support@zygorguides.com",
description="This guide will help you complete the 10.1.5 Warlock questline.",
condition_suggested=function() return level == 70 and not completedq(75544) end,
condition_valid=function() return raceclass('Warlock') and level >= 70 end,
condition_valid_msg="You must be a Warlock and at least level 70 to complete this guide!",
startlevel=70,
patch='100105',
},[[
step
accept A Dark Summons##76427 |only if Horde
accept A Dark Summons##76410 |only if Alliance
|tip 你应该自动接受这个任务。
step
talk Assistant Phineas##207051
turnin A Dark Summons##76427 |goto Orgrimmar/2 40.96,52.02
accept Beginning Impositions##76430 |goto 40.96,52.02
|only if Horde
step
click Stagecoach
乘坐影月夫人的马车前往暗月集市 |q 76430/1 |goto 41.27,53.58
|only if Horde
step
talk Assistant Phineas##204198
turnin A Dark Summons##76410
accept Beginning Impositions##75538 |goto Stormwind City/0 43.70,79.08
|only if Alliance
step
click Stagecoach
乘坐影月夫人的马车前往暗月集市 |q 75538/1 |goto 43.94,78.94
|only if Alliance
step
观察对话
抵达暗月岛 |outvehicle |q 76430 |only if Horde
抵达暗月岛 |outvehicle |q 75538 |only if Alliance
step
talk Madam Shadow##203968
turnin Beginning Impositions##76430 |goto Darkmoon Island/0 47.36,78.93 |only if Horde
turnin Beginning Impositions##75538 |goto 47.36,78.93 |only if Alliance
accept Some Wicked Things This Way Come##75539 |goto 47.36,78.93
step
talk Initiate Springtotem##204008
问她“是什么让你来到集市的？”
与新术士交谈 |q 75539/1 |goto 48.55,81.61 |count 1
step
talk Initiate Gand##203993
告诉他“我们即将出发。”
与新术士交谈 |q 75539/1 |goto 48.57,81.85 |count 2
step
talk Initiate Oman##204153
告诉他“我们即将出发。”
与新术士交谈 |q 75539/1 |goto 50.89,81.10 |count 3
step
talk Initiate Jim##205195
告诉他“我们即将出发。”
与新术士交谈 |q 75539/1 |goto 53.01,80.64 |count 4
step
talk Initiate Undertide##204155
告诉她 "我们即将开始战斗。"
与新术士交谈 |q 75539/1 |goto 52.45,78.88 |count 5
step
talk Initiate Darkleaf##204154
告诉她 "我们即将开始战斗。"
与新术士交谈 |q 75539/1 |goto 52.05,78.64 |count 6
step
talk Initiate Telubi##203996
告诉她 "我们即将开始战斗。"
与新术士交谈 |q 75539/1 |goto 50.75,71.94 |count 7
step
talk Initiate Ko##204151
告诉他“我们即将出发。”
与新术士交谈 |q 75539/1 |goto 48.46,72.74 |count 8
step
talk Initiate Roland##205194
告诉他“我们即将出发。”
与新术士交谈 |q 75539/1 |goto 48.39,73.11 |count 9
step
talk Madam Shadow##203968
turnin Some Wicked Things This Way Come##75539 |goto 47.36,78.93
accept Hermetic Insurance##75540 |goto 47.36,78.93
step
clicknpc Initiate Springtotem##205273
extraaction Madam Shadow's Soulstone##410940
|tip 对初学者春之图腾使用它。
启动春季图腾的灵魂石 |q 75540/3 |goto 48.57,79.91
step
clicknpc Initiate Ko##205274
extraaction Madam Shadow's Soulstone##410940
|tip 在初学者科的身上使用它。
初学者Ko的灵魂石 |q 75540/1 |goto 48.48,79.00
step
clicknpc Initiate Telubi##205272
extraaction Madam Shadow's Soulstone##410940
|tip 对初学者泰露比使用它。
初学者泰鲁比的灵魂石 |q 75540/2 |goto 48.53,78.41
step
talk Madam Shadow##203968
turnin Hermetic Insurance##75540 |goto 47.36,78.93
accept Those Who Hesitate##75541 |goto 47.36,78.93
step
talk Initiate Oman##205276
告诉他，“影声夫人请求你的光临。”
与初学者奥曼交谈 |q 75541/1 |goto 46.17,89.15
step
clicknpc Initiate Oman##205276
extraaction Soulstone##20707
|tip 将其用在初学者奥曼身上。
在奥曼身上施放灵魂石 |q 75541/2 |goto 46.17,89.15
step
talk Initiate Oman##205276
turnin Those Who Hesitate##75541 |goto 46.17,89.15
accept A Wolf Among Sheep##76155 |goto 46.17,89.15
step
extraaction Madam Shadow's Soulstone##412234
|tip 在码头对小动物使用它。
为影子的女士创建一个虚灵石 |q 76155/1 |goto 45.76,88.86
step
talk Madam Shadow##203968
turnin A Wolf Among Sheep##76155 |goto 47.36,78.93
accept Curses & Cultists##75542 |goto 47.36,78.93
step
talk Initiate Ko##205399
告诉他施放语言诅咒
教授语言诅咒 |q 75542/3 |goto 49.22,58.52
step
talk Initiate Telubi##205367
问她“我们试试“虚弱诅咒”吗？”
教授虚弱诅咒 |q 75542/1 |goto 50.04,58.47
step
talk Initiate Springtotem##205400
告诉她“查看‘疲惫诅咒’”。
|tip 接受召唤之后。
教授疲惫诅咒 |q 75542/2 |goto 50.26,57.23
step
talk Initiate Oman##205433
turnin Curses & Cultists##75542 |goto 58.93,63.17
accept Fel Suspicions##75639 |goto 58.93,63.17
step
extraaction Eye of Kilrogg##411531
施放基尔罗格之眼 |q 75639/1 |goto 59.37,63.53
step
监视影子夫人和菲尼亚斯 |q 75639/2 |goto 62.31,66.77
step
取消基尔罗gg之眼增益 |nobuff Eye of Kilrogg##411531
|tip 右键点击你的增益条上的增益效果。
step
click Demonic Gateway
turnin Fel Suspicions##75639 |goto 59.78,62.22
accept Last Rites By Accident##75543 |goto 59.78,62.22
step
click Demonic Gateway
选择_“踏入传送门。”_
穿越恶魔之门 |q 75543/1 |goto 59.78,62.22
step
寻找新手奥曼 |q 75543/2 |goto Burning Steppes/0 9.10,30.04
step
kill Vengeful Subjugator##204241
|tip 减少它的生命值，当它出现时使用奴役恶魔。
extraaction Subjugate Demon##1098
征服复仇者统治者 |q 75543/3 |goto 9.61,29.81
step
click Initiate Oman
调查阿曼的尸体 |q 75543/4 |goto 8.79,30.15
step
talk Initiate Oman##205575
turnin Last Rites By Accident##75543 |goto 8.53,36.04
accept When Revenge Burns Green##75544 |goto 8.53,36.04
step
在荒芜之地寻找影子夫人 |q 75544/1 |goto Blasted Lands/0 32.47,45.37
step
观察对话
kill Lord Banehollow##204243 |q 75544/2 |goto 32.56,45.29
|tip 保持移动，躲避地面标记区域。
|tip 远离紫色光 orb。
|tip 范围伤害增加以保持数量可控。
|tip 这场战斗可能很艰难，所以你可能想要使用增益效果。
step
talk Initiate Oman##205818
turnin When Revenge Burns Green##75544 |goto 33.71,45.79
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Augmentation Questline (Evoker)",{
author="support@zygorguides.com",
description="This guide will help you complete the brief Augmentation specialization questline.",
condition_suggested=function() return raceclass('Evoker') and level == 70 and not completedq(72515) end,
condition_valid=function() return raceclass('Evoker') and level >= 70 end,
condition_valid_msg="You must be an Evoker and at least level 70 to complete this guide!",
startlevel=70,
patch='100105',
},[[
step
切换到增强专精 |complete Augmentation Evoker |goto Valdrakken/0 51.45,57.55
|tip 你必须站在瓦尔德拉肯并切换到增强专精才能触发任务。
step
accept Our Destiny##72513 |goto 51.45,57.55
|tip 此任务可能需要几分钟才能自动接取。
|tip 你必须在瓦尔德拉肯中站着，并专精于增幅，才能触发任务。
step
talk Scalecommander Emberthal##199135
turnin Our Destiny##72513 |goto The Forbidden Reach/5 58.54,68.49
accept The High Creche##72514 |goto 58.54,68.49
step
click Essence Collector
|tip 在建筑物内。
破坏精华采集器 |q 72514/1 |goto 58.99,70.95 |count 1
step
click Essence Collector
|tip 在建筑物内。
破坏精华采集器 |q 72514/1 |goto 59.05,71.51 |count 2
step
click Essence Collector
|tip 在建筑物内。
破坏精华采集器 |q 72514/1 |goto 58.71,71.69 |count 3
step
click Essence Collector
|tip 在建筑物内。
破坏精华采集器 |q 72514/1 |goto 58.63,71.14 |count 4
step
talk Scalecommander Emberthal##199141
|tip 在建筑物内。
turnin The High Creche##72514 |goto 58.65,70.39
accept Augmenting a Dragon##72515 |goto 58.65,70.39
step
talk Ebyssian##199144
|tip 在建筑物内。
告诉他“准备好了，释放她。”
观察对话
与艾比希安交谈以启动仪式 |q 72515/1 |goto 58.77,70.65
|tip 如果这个步骤出现了 bugs 并且没有完成，您可能需要跳过这一步。
step
kill Adamanthia##198921 |q 72515/2 |goto 58.83,71.23
|tip 在建筑物内。
|tip 遵循屏幕上出现的指令为你的团队增益，并击败阿达曼提亚。
|tip 你必须使用混合的增强技能将阿达曼希亚的生命值减少到大约60%。
|tip 在指示时施放 "灼热鳞片" 和 "幽邃之力"。
|tip 这个任务可以在另一个专精中通过足够的输出和治疗完成。
step
talk Scalecommander Emberthal##199141
|tip 在建筑物内。
turnin Augmenting a Dragon##72515 |goto 58.65,70.92
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames",{
author="support@zygorguides.com",
description="This guide will help you complete the Coalition of Flames quest chapter.",
condition_suggested=function() return level == 70 and not completedq(75923) end,
startlevel=70,
patch='100107',
},[[
step
talk Shandris Feathermoon##205067
accept Fire Season##75918 |goto Valdrakken/0 50.27,52.83
_Or_ |only if completedq(77523)
use Shandris's Scouting Report##208181 |only if completedq(77523)
|tip 如果你在其他角色上完成了这个故事，则可以获得此物品。 |只有在完成任务(77523)的情况下。
|tip 使用它将允许你跳过此指南，直接进入“翡翠梦境战役”指南。 | 仅在完成任务（77523）后使用
跳过“火焰联军”章节 |complete completedq(75923) |or |only if completedq(77523)
step
talk Shandris Feathermoon##205068
turnin Fire Season##75918 |goto Ohn'ahran Plains/0 18.62,79.78
accept Eyes of Fire##75920 |goto 18.62,79.78
step
_Next to you:_
talk Shandris Feathermoon
accept Dousing the Wards##75919 |goto 18.62,79.78
stickystart "Slay_Fyrakk's_Forces"
step
click Warding Firestone
摧毁守护火石 |q 75919/1 |goto 19.39,82.16 |count 1
step
click Warding Firestone
摧毁守护火石 |q 75919/1 |goto 20.39,82.36 |count 2
step
click Warding Firestone
摧毁守护火石 |q 75919/1 |goto 20.78,81.62 |count 3
step
click Warding Firestone
摧毁守护火石 |q 75919/1 |goto 20.10,81.33 |count 4
step
label "Slay_Fyrakk's_Forces"
在该区域击杀敌人
击杀#8#个菲拉克的部队 |q 75920/1 |goto 19.92,81.61
step
_Next to you:_
talk Shandris Feathermoon
turnin Eyes of Fire##75920 |goto 20.31,80.87
turnin Dousing the Wards##75919 |goto 20.31,80.87
accept Through the Flames##75921 |goto 20.31,80.87
step
接近花朵 |q 75921/1 |goto 20.45,80.92
step
talk Shandris Feathermoon##205132
告诉她“我已准备好。”
与香迪瑞斯交谈 |q 75921/2 |goto 20.42,80.93
step
click Smoldering Blossom
收集熔火之花 |q 75921/3 |goto 20.46,80.91 |count 1
step
click Smoldering Blossom
|tip 躲避地面上的圈圈和桥上的漂浮光球。
|tip 在点击花朵之前观察动画模式，以免在施法结束时被击中。
收集熔火之花 |q 75921/3 |goto 20.88,80.05 |count 2
step
click Smoldering Blossom
|tip 躲避地面上的圈圈和桥上的漂浮光球。
|tip 在点击花朵之前观察动画模式，以免在施法结束时被击中。
收集熔火之花 |q 75921/3 |goto 20.87,79.45 |count 3
step
click Smoldering Blossom
|tip 躲避地面上的圈圈和桥上的漂浮光球。
收集熔火之花 |q 75921/3 |goto 21.30,78.53 |count 4
step
到达隐蔽点 |q 75921/4 |goto 21.85,77.34
|tip 避开地上的两个药水圈。
step
talk Shandris Feathermoon##205134
turnin Through the Flames##75921 |goto 21.88,77.37
accept Inflammatory Information##75922 |goto 21.88,77.37
step
click Concealed Shrubbery
与香迪瑞斯窃听 |q 75922/1 |goto 21.81,77.34
step
kill Rupturing Firevine##207699+
|tip 摧毁藤蔓
击败拉罗达尔 |q 75922/2 |goto 21.90,76.08
step
talk Shandris Feathermoon##205142
turnin Inflammatory Information##75922 |goto 21.69,77.09
accept Raise the Alarm##75923 |goto 21.69,77.09
step
use Sentinel's Whistle##206353
使用哨兵的口哨返回瓦尔德拉肯 |q 75923/1 |goto 21.69,77.16
step
talk Captain Drine##206047
告诉她“费拉克正在计划攻击翡翠梦境。我们需要阻止他。”
将报告交给德里纳上尉 |q 75923/2 |goto Valdrakken/0 56.00,40.01
step
跟随守卫前往下层平台 |q 75923/4 |goto 54.63,47.49
|tip 使用抓钩或飞下来。
step
talk Captain Drine##206041
问她“发生了什么？”
与德里恩队长交谈 |q 75923/5 |goto 54.63,47.49
step
talk Captain Drine##206041
turnin Raise the Alarm##75923 |goto 54.01,46.38
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Reforging the Tyr's Guard",{
author="support@zygorguides.com",
description="This guide will help you complete the Reforging the Tyr's Guard storyline.",
condition_suggested=function() return level == 70 and not completedq(75638) end,
startlevel=70,
patch='100107',
},[[
step
talk Nozdormu##187669
|tip 在塔顶上。
accept A Dislocated Disc##75632 |goto Valdrakken/0 61.42,39.11
step
talk Eternus##204574
turnin A Dislocated Disc##75632 |goto Thaldraszus/0 60.42,59.02
accept We Have the Technology##75633 |goto 60.42,59.02
step
talk Chromie##204576
告诉她“好的，告诉我关于计划的事情。”
与克洛米交谈 |q 75633/1 |goto 60.40,59.00
step
talk Travard##204577
turnin We Have the Technology##75633 |goto 60.40,58.91
accept Reforging the Tyr's Guard##75634 |goto 60.40,58.91
step
talk Travard##206221
turnin Reforging the Tyr's Guard##75634 |goto The Azure Span/0 17.59,31.53
accept Walking the Path of Tyr##76171 |goto 17.59,31.53
step
talk Talthis##204538
把他的'请收下你的战袍和盾牌，塔尔西斯。'
观察对话
装备秩序典范 |q 76171/2 |goto 17.56,31.47
step
talk Nolaki##204539
把你的战袍和盾牌给她，诺拉基。
观察对话
装备牺牲者的典范 |q 76171/4 |goto 17.56,31.38
step
talk Valunei##204540
把她的斗篷和盾牌交给她，瓦鲁奈。
观察对话
装备同情典范 |q 76171/3 |goto 17.63,31.34
step
talk Hadwin##204541
把你的战袍和盾牌交给他，哈德温。
观察对话
装备正义的典范 |q 76171/1 |goto 17.64,31.44
step
talk Travard##206221
turnin Walking the Path of Tyr##76171 |goto 17.59,31.53
step
talk Talthis##204593
accept An Exemplar of Order: Talthis##75951 |goto 17.56,31.47
step
talk Nolaki##204592
accept An Exemplar of Sacrifice: Nolaki##75952 |goto 17.56,31.38
step
talk Valunei##204591
accept An Exemplar of Compassion: Valunei##75953 |goto 17.63,31.34
step
talk Hadwin##204590
accept An Exemplar of Justice: Hadwin##75950 |goto 17.65,31.44
step
寻找诺拉基 |q 75952/1 |goto 16.84,30.01
step
kill Massive Decay##205839 |q 75952/2 |goto 16.77,30.13
step
click Abandoned Tuskarr Relic##403464+
|tip 它们看起来像这个区域地面上小型图卡石头。
collect 5 Recovered Tuskarr Relic##206204 |q 75951/1 |goto 18.39,35.66
step
talk Talthis##205878
选择 _"<将恢复的遗物交给塔尔希斯。>"_
将图斯卡尔文物归还给塔尔希斯 |q 75951/2 |goto 18.91,35.01
step
kill Decaymonger Rotpaw##205995 |q 75950/1 |goto 17.53,38.79
step
talk Valunei##206124
告诉她“我准备好了。”
与瓦鲁奈交谈，地点：布拉克海德山谷 |q 75953/1 |goto 11.66,37.90
step
击杀攻击敌人
|tip 洞内探险
保护瓦伦尼免受猞猁袭击 |q 75953/2 |goto 11.72,38.57
step
talk Talthis##204593
turnin An Exemplar of Order: Talthis##75951 |goto 17.56,31.47
step
talk Nolaki##204592
turnin An Exemplar of Sacrifice: Nolaki##75952 |goto 17.56,31.39
step
talk Valunei##204591
turnin An Exemplar of Compassion: Valunei##75953 |goto 17.63,31.34
step
talk Hadwin##204590
turnin An Exemplar of Justice: Hadwin##75950 |goto 17.64,31.44
step
talk Travard##206221
accept For Tyr!##75635 |goto 17.59,31.53
step
talk Travard##204602
告诉他我已准备好。
去泰尔霍德与特拉瓦德交谈 |q 75635/1 |goto Thaldraszus/0 59.76,58.74
step
talk Travard##208968
turnin For Tyr!##75635 |goto 59.97,58.74
accept First Steps##76176 |goto 59.97,58.74
step
在泰尔霍德与克罗米会面 |q 76176/1 |goto 60.43,58.94
step
talk Chromie##204668
turnin First Steps##76176 |goto 60.43,58.94
step
talk Eternus##204667
accept Tyrangulation##75636 |goto 60.38,58.78
step
click Temple of Order: Winterskorn War
前往秩序之殿的传送门 |q 75636/1 |goto 60.44,58.74
step
击杀波次攻击的敌人
保护特拉瓦德 |q 75636/2 |goto The Storm Peaks/0 53.49,42.25
step
click Portal to Tyrhold
前往提尔霍德传送门 |q 75636/3 |goto 52.68,42.37
step
talk Chromie##206686
turnin Tyrangulation##75636 |goto Thaldraszus/0 60.35,58.74
step
talk Travard##206682
accept The Final Beacon##75637 |goto 60.38,58.68
step
click Black Empire: Primordial Azeroth
前往塔尔尼斯和瓦鲁尼的传送门 |q 75637/1 |goto 60.49,58.85
step
talk Valunei##204599
告诉她“塔尔西这是对的。她不能是你的朋友。你应该抵抗她！”
与瓦鲁奈交谈 |q 75637/2 |goto The Black Empire 2/0 49.50,68.06
step
kill 1 Deceiver Hr'qoth##206784 |q 75637/3 |goto 48.63,71.17
step
击杀波次攻击的敌人
保护信标 |q 75637/4 |goto 49.68,44.78
step
click Portal to Tyrhold
前往提尔霍德传送门 |q 75637/5 |goto 48.97,37.30
step
talk Travard##204605
turnin The Final Beacon##75637 |goto Thaldraszus/0 60.43,58.92
accept Dislocated Disc Located##75638 |goto 60.43,58.92
step
talk Valunei##204608
与瓦鲁尼交谈 |q 75638/5 |goto 60.31,58.86
step
talk Travard##204605
turnin Dislocated Disc Located##75638 |goto 60.43,58.92
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Bronze Reconciliation",{
author="support@zygorguides.com",
description="This guide will help you complete the Reforging the Tyr's Guard storyline.",
condition_suggested=function() return level == 70 and not completedq(75638) end,
startlevel=70,
patch='100107',
},[[
step
talk Chromie##208035
accept No Limits##76423 |goto Valdrakken/0 60.99,40.04
step
talk Nozdormu##207106
turnin No Limits##76423 |goto Thaldraszus/0 65.50,80.26
accept What Makes an Infinite##77417 |goto 65.50,80.26
step
观察对话
talk Eternus##205882
问她“谁是莫拉迪姆？”
询问莫拉多尔米 |q 77417/1 |goto 65.53,80.18
step
talk Nozdormu##207106
turnin What Makes an Infinite##77417 |goto 65.50,80.26
accept Not Today, Fate##76407 |goto 65.50,80.26
step
click Time Rift
使用时间裂缝 |q 76407/1 |goto 65.55,80.10
step
观察对话
talk Eternus##207634
告诉她“我不能...移动...”
与永恒对话 |q 76407/2 |goto Tanaris/0 37.48,83.99
step
extraaction Watch History Unfold##416240
帮助永恒解除时间暂停 |q 76407/3 |goto 37.49,83.68
step
观察对话
观察历史 |q 76407/4 |goto 37.49,83.68
step
talk Nozdormu##206971
turnin Not Today, Fate##76407 |goto 37.59,83.83
step
talk Eternus##207634
accept Violence Will Solve It##76419 |goto 37.46,83.63
step
extraaction Rewind Time##415562
时空反转 |q 76419/1 |goto 37.55,83.80
step
kill Vexemia##206967
面对维克塞米亚 |q 76419/2 |goto 37.82,82.75
step
talk Eternus##207634
turnin Violence Will Solve It##76419 |goto 37.91,83.21
accept Butterfly Effects##76420 |goto 37.91,83.21
step
extraaction Rewind Time##415562
时空反转 |q 76420/1 |goto 37.55,83.79
step
在这个区域击杀时间线敌人
collect 6 Quickened Sand##208099 |q 76420/2 |goto 38.01,84.02
step
click Invulnerable Hourglass
放置无敌沙漏 |q 76420/3 |goto 37.94,83.47 |count 1
step
click Invulnerable Hourglass
放置无敌沙漏 |q 76420/3 |goto 37.95,83.08 |count 2
step
click Invulnerable Hourglass
放置无敌沙漏 |q 76420/3 |goto 37.65,83.10 |count 3
step
click Invulnerable Hourglass
放置无敌沙漏 |q 76420/3 |goto 37.67,83.45 |count 4
step
extraaction Watch Events Unfold##417235
观察结果 |q 76420/4 |goto 37.49,83.68
step
talk Eternus##207634
turnin Butterfly Effects##76420 |goto 37.46,83.63
accept The Fate We Make##76421 |goto 37.46,83.63
step
extraaction Rewind Time##415562
逆转时间反转 |q 76421/1 |goto 37.55,83.80
step
talk Eternus##207634
|tip 选择你偏好的对话选项。
请永恒者停止暂停 |q 76421/2 |goto 37.46,83.63
step
观察对话
审查历史 |q 76421/3 |goto 37.46,83.63
step
clicknpc Moraidormi##208002
调查莫拉多尔米 |q 76421/4 |goto 37.79,83.23
step
talk Eternus##207634
turnin The Fate We Make##76421 |goto 37.46,83.63
step
talk Nozdormu##206971
accept Infinity and Beyond##76422 |goto 37.74,83.28
step
click Time Rift
使用时间裂缝 |q 76422/1 |goto 37.40,84.17
step
talk Chromie##208035
|tip 选择你偏好的对话选项。
与克罗米交谈 |q 76422/2 |goto Thaldraszus/0 65.40,80.40
step
talk Nozdormu##207106
turnin Infinity and Beyond##76422 |goto 65.50,80.26
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dream campaign questline.",
startlevel=70,
patch='100200',
},[[
leechsteps "Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames"
step
accept Call of the Dream##76317 |goto Valdrakken/0 53.20,50.62
|tip 你将自动接受这个任务。
step
talk Merithra##187590
turnin Call of the Dream##76317 |goto Ohn'ahran Plains/0 18.66,51.77
accept Emerald Welcome##76318 |goto 18.66,51.77
step
穿越翡翠梦境 |q 76318/1 |goto 18.44,52.41
step
talk Merithra##206425
问她“你希望我看到什么？”
与梅里萨交谈 |q 76318/2 |goto The Emerald Dream/0 69.42,54.04
step
talk Merithra##206425
turnin Emerald Welcome##76318 |goto 69.42,54.04
accept Feast or Flaming##76319 |goto 69.42,54.04
step
talk Athera##208286
home Verdant Landing |goto The Emerald Dream/0 69.53,53.24 |q 76319
step
talk Occarim##208280
fpath Verdant Landing |goto 68.81,54.81 |q 76319
step
吃 #12# 火焰 |q 76319/2 |goto 66.14,55.73
|tip 在你的龙骑坐骑上飞越空中的光环。
|tip 绿色魔珠将恢复活力。
step
talk Cenarius##206510
turnin Feast or Flaming##76319 |goto 64.30,58.23
accept Wild Gods in Our Midst##76320 |goto 64.30,58.23
step
talk Goldrinn##206527
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求戈尔丁的援助 |q 76320/1 |goto 62.63,66.23
step
talk Q'onzu##206530
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求Q'onzu的援助 |q 76320/2 |goto 65.65,70.16
step
talk Elder Cassaphine##206571
|tip 洞内探险
告诉她“梅瑞萨请求你帮助守护世界之树。”
请求卡萨芬长者的援助 |q 76320/3 |goto Barrows of Reverie/0 66.62,45.16
step
talk Cenarius##206583
turnin Wild Gods in Our Midst##76320 |goto The Emerald Dream/0 63.28,71.50
accept Burning Assault##76321 |goto 63.28,71.50
accept The Face of Our Enemies##76322 |goto 63.28,71.50
stickystart "Slay_Fyrakk's_Forces"
step
kill Apostle Fenarelle##206628 |q 76322/2 |goto 61.42,68.74
step
kill Stormbrand Ko'mal##206684 |q 76322/1 |goto 64.35,67.95
step
label "Slay_Fyrakk's_Forces"
在该区域击杀敌人
击杀菲拉克的部队 |q 76321/1 |goto 62.89,68.30
step
talk Merithra##206688
turnin Burning Assault##76321 |goto 62.78,68.63
turnin The Face of Our Enemies##76322 |goto 62.78,68.63
accept The Cruel##77818 |goto 62.78,68.63
step
clicknpc Flame Portal
|tip 离开地面上的大旋涡区域。
帮助梅里萨关闭火焰传送门 |q 77818/1 |goto 62.67,68.42
step
clicknpc Dream Portal##206703
进入梦境传送门 |q 77818/2 |goto 62.91,68.98
step
talk Merithra##206806
turnin The Cruel##77818 |goto 61.48,60.39
accept Amirdrassil##76323 |goto 61.48,60.39
step
talk Merithra##206809
|tip 她最终会飞往这个地点。
turnin Amirdrassil##76323 |goto 53.83,63.93
accept Lost to the Flame##76324 |goto 53.83,63.93
step
kill Elder Cassaphine##206818 |q 76324/1 |goto 50.60,71.86
step
talk Merithra##206979
turnin Lost to the Flame##76324 |goto 50.96,69.99
accept Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
step
talk Merithra##206979
告诉她“我与你同在。”
与梅里萨交谈 |q 76325/1 |goto 50.96,69.99
step
talk Merithra##206979
turnin Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
accept Home in the Dream##76326 |goto 50.96,69.99
step
talk Merithra##206896
turnin Home in the Dream##76326 |goto 50.80,62.88
accept A Multi-Front Battle##77283 |goto 50.80,62.88
step
talk Leora##207636
fpath Central Encampment |goto 51.09,62.35 |q 77283
step
talk Keeper Amrymn##208143
寻找守护者阿米尔门 |q 77283/2 |goto 50.21,61.59
step
talk Keeper Amrymn##208143
accept A Worthy Ally: Dream Wardens##78444 |goto 50.21,61.59
|only if questactive(78444)
step
talk Saelienne##207627
|tip 帐篷内。
寻找塞丽安娜 |q 77283/1 |goto 49.85,61.64
step
talk Saelienne##207627
|tip 帐篷内。
home Central Encampment |goto 49.85,61.64 |q 77283
step
talk Vaskarn##211328
寻找瓦斯卡尔 |q 77283/3 |goto 49.79,62.95
step
talk Merithra##206896
turnin A Multi-Front Battle##77283 |goto 50.80,62.88
accept The Burning Barrow##77436 |goto 50.80,62.88
step
talk Tyrande Whisperwind##206247
|tip 在地面上，而不是在悬崖上。
turnin The Burning Barrow##77436 |goto 51.40,43.07
accept Ashen Soil##76433 |goto 51.40,43.07
accept Not Yet Lost##76434 |goto 51.40,43.07
stickystart "Assist_the_Burning_Barrow"
step
沿着小路走下去 |goto Sor'theril Barrow Den/0 44.88,72.28 < 7 |walk
继续沿着道路前进 |goto 37.80,44.89 < 7 |walk
继续沿着道路前进 |goto 60.04,23.31 < 7 |walk
寻找火焰德鲁伊 |q 76433/1 |goto 64.78,58.65
|tip 洞内探险
step
label "Assist_the_Burning_Barrow"
在该区域击杀敌人
clicknpc Harried Dryad##206375+
|tip 洞内探险
协助燃烧墓穴 |q 76434/1 |goto 42.87,30.17
step
talk Tyrande Whisperwind##206247
turnin Ashen Soil##76433 |goto The Emerald Dream/0 51.43,42.71
turnin Not Yet Lost##76434 |goto 51.43,42.71
accept The Smoldering Copse##76435 |goto 51.43,42.71
step
talk Tyrande Whisperwind##207160
turnin The Smoldering Copse##76435 |goto 40.80,47.50
accept Burning Ground##76437 |goto 40.80,47.50
accept Grim Reprisal##76441 |goto 40.80,47.50
stickystart "Disrupt_the_Smoldering_Copse"
step
click Smolderbark Cage+
|tip 它们看起来像这个区域周围的巨大木制笼子。
营救 #8# 被捕的生灵 |q 76437/1 |goto 34.25,47.46
你可以在[36.91,49.00]附近找到更多。
step
label "Disrupt_the_Smoldering_Copse"
在该区域击杀敌人
click Smoldering Supplies
扰乱烟烬林 |q 76441/1 |goto 35.64,46.89
step
talk Tyrande Whisperwind##207160
turnin Burning Ground##76437 |goto 35.99,50.93
turnin Grim Reprisal##76441 |goto 35.99,50.93
accept Forlorn Hope##76442 |goto 35.99,50.93
step
talk Tyrande Whisperwind##207160
告诉她“我已准备好。”
与泰兰德交谈 |q 76442/1 |goto 36.00,50.94
step
kill Sylvanesh the Ascended##207107 |q 76442/2 |goto 35.37,49.47
step
talk Tyrande Whisperwind##211193
turnin Forlorn Hope##76442 |goto 36.14,50.87
accept The Looming Cinder##76443 |goto 36.14,50.87
step
talk Merithra##206896
turnin The Looming Cinder##76443 |goto 50.80,62.88
step
use the Mark of the Dream Wardens##210730
消耗声望令牌 |complete itemcount(210730) == 0
step
talk Vyranoth##208506
accept Mayhem Incarnate##76403 |goto 50.81,62.73
step
talk Keeper Amrymn##208143
turnin A Worthy Ally: Dream Wardens##78444 |goto 50.21,61.60
|only if readyq(78444) or completedq(78444)
step
talk Vyranoth##206612
turnin Mayhem Incarnate##76403 |goto 36.83,25.86
accept Best Laid Plans##76343 |goto 36.83,25.86
step
talk Buri##206619
accept Light 'Em Up!##76342 |goto 36.85,26.08
stickystart "Hinder_the_Primalist_Forces"
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 37.20,22.94 |count 1
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 36.21,21.04 |count 2
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 36.03,20.20 |count 3
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 34.65,20.08 |count 4
step
label "Hinder_the_Primalist_Forces"
在该区域击杀敌人
clicknpc Flamecrested Portalweaver##208418
阻碍原始力量的势力 |q 76342/1 |goto 36.43,22.06
step
talk Vyranoth##206612
turnin Best Laid Plans##76343 |goto 36.83,25.86
step
talk Buri##206619
turnin Light 'Em Up!##76342 |goto 36.85,26.09
accept Primalist Directive##76344 |goto 36.85,26.09
step
talk Vyranoth##206612
accept Finding Terro##76345 |goto 36.83,25.86
step
调查灼热深渊 |q 76345/1 |goto 39.98,20.09
step
talk Terro##208377
调查泰罗的尸体
调查特罗的尸体 |q 76345/2 |goto 39.94,20.06
step
观察对话
kill 1 Igneous Stonemauler##210043 |q 76345/3 |goto 40.11,20.08
step
与梦境破碎者NPC交谈，位于此区域内
|tip 其中一些会攻击你。
摇摆者 #5# 原始者 |q 76344/1 |goto 40.04,21.68
step
talk Buri##210178
turnin Primalist Directive##76344 |goto 39.61,22.90
turnin Finding Terro##76345 |goto 39.61,22.90
accept Assault on the Wellspring##76532 |goto 39.61,22.90
step
talk Buri##208674
选择 _"<看Buri指的地方。>"_
观察生命之泉 |q 76532/1 |goto 33.56,30.53
step
talk Suzska##208378
turnin Assault on the Wellspring##76532 |goto 27.63,32.19
accept Big Bright Beautiful Barrier##76348 |goto 27.63,32.19
step
click Barrier Fragment+
|tip 它们看起来像是散落在这个区域的绿色水晶。
获取 #6# 障碍碎片 |q 76348/1 |goto 28.19,31.20
step
extraaction Heal Barrier##423058
治愈屏障 |q 76348/2 |goto 28.04,31.23
step
talk Suzska##208378
告诉她 "屏障已修复。"
与苏兹卡交谈 |q 76348/3 |goto 27.63,32.19
step
talk Suzska##208725
turnin Big Bright Beautiful Barrier##76348 |goto 33.51,30.27
accept Power, Eruption, and Lies##76347 |goto 33.51,30.27
step
kill Lethka##208740 |q 76347/1 |goto 30.20,22.35
step
talk Vyranoth##210733
turnin Power, Eruption, and Lies##76347 |goto 33.73,25.25
accept Tactical Withdrawal##77178 |goto 33.73,25.25
step
talk Thevelo##209427
fpath Wellspring Overlook |goto 35.65,33.64 |q 77178
step
talk Alexstrasza the Life-Binder##208503
turnin Tactical Withdrawal##77178 |goto 50.76,62.83
step
use the Scales of Remorse##210757
消耗声望令牌 |complete itemcount(210757) == 0
step
talk Ysera##206408
accept Eye of Ysera##76327 |goto 50.85,62.91
step
click Portal to the Eye of Ysera
进入伊瑟拉之眼的传送门 |q 76327/1 |goto 50.96,62.60
step
talk Merithra##206416
turnin Eye of Ysera##76327 |goto 52.11,29.25
accept A New Brute##76328 |goto 52.11,29.25
step
clicknpc Emerald Preserver##206480
赋能守护者 |q 76328/1 |goto 52.17,29.61 |count 1
step
clicknpc Emerald Preserver##210701
赋能守护者 |q 76328/1 |goto 52.31,29.90 |count 2
step
clicknpc Emerald Preserver##210702
赋能守护者 |q 76328/1 |goto 51.91,30.39 |count 3
step
clicknpc Emerald Preserver##210703
赋能守护者 |q 76328/1 |goto 51.38,29.73 |count 4
step
clicknpc Emerald Preserver##210704
赋能守护者 |q 76328/1 |goto 51.69,29.06 |count 5
step
talk Ysera##206408
|tip 在建筑物内。
查看伊瑟拉 |q 76328/2 |goto 52.83,27.97
step
talk Merithra##206406
|tip 她冲向建筑内部的这个位置。
turnin A New Brute##76328 |goto 52.72,28.17
accept Fire Watch##78646 |goto 52.72,28.17
step
talk Merithra##206406
turnin Fire Watch##78646 |goto 52.14,24.23
accept In and Out Scout##76329 |goto 52.14,24.23
accept Disarm Specialist##76330 |goto 52.14,24.23
stickystart "Destroy_Suffusion_Supplies"
stickystart "Slay_Suffusion_Shapers"
step
use Somnowl's Shroud##210016
|tip 你可能需要在进入隐形后在区域内走动一下以获得进度。
潜行者监视熔火编织者 |q 76329/1 |goto 46.03,19.57
step
use Somnowl's Shroud##210016
在铸锤上的间谍 |q 76329/2 |goto 44.54,23.97
step
label "Destroy_Suffusion_Supplies"
click Suffusion Supplies
|tip 他们看起来像这个区域的锅炉聚集。
摧毁 #8# 膨胀补给品 |q 76330/2 |goto 45.71,23.34
step
label "Slay_Suffusion_Shapers"
kill 6 Suffusion Shaper##208676 |q 76330/1 |goto 45.71,23.34
step
talk Bodwin##209153
告诉他“让我们看看残酷的伊吉拉在干什么。”
潜伏于残忍的伊基拉身边 |q 76329/3 |goto 48.44,22.39
step
talk Merithra##206406
turnin In and Out Scout##76329 |goto 52.14,24.23
turnin Disarm Specialist##76330 |goto 52.14,24.23
step
talk Merithra##206406
|tip 在建筑物内。
accept Good Counsel##76334 |goto 53.06,28.20
step
与梅里萨重新汇合 |q 76334/1 |goto 53.06,28.19
|tip 在建筑物内。
step
talk Lord Itharius##206411
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 52.89,28.32 |count 1
step
talk Somnikus##206409
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 52.99,28.38 |count 2
step
talk Gerithus##206412
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 53.04,28.28 |count 3
step
talk Ysera##206408
|tip 在建筑物内。
问她“你怎么看梅瑞莎的计划？”
与耶希拉交谈 |q 76334/3 |goto 52.83,27.97
step
talk Merithra##206406
|tip 在建筑物内。
turnin Good Counsel##76334 |goto 53.06,28.20
accept Putting Roots Down##76332 |goto 53.06,28.20
step
click Tilled Soil+
|tip 它们看起来像这个区域地上的土堆。
kill Noxious Seedling##211410+
|tip 他们有时在点击土壤后攻击。
植物#8#有毒种子 |q 76332/1 |goto 55.06,26.79
step
talk Kiya Featherpaw##208909
告诉她“梅瑞瑟拉说你有计划帮助击败达贾拉丁。”
与Kiya Featherpaw交谈 |q 76332/2 |goto 57.52,25.89
step
talk Somnikus##207081
告诉他“陷阱已布置完毕。我们准备好了。”
与索米克斯交谈 |q 76332/3 |goto 56.97,23.18
step
talk Merithra##206406
|tip 在建筑物内。
turnin Putting Roots Down##76332 |goto 53.06,28.20
accept Merithra's Gambit##76331 |goto 53.06,28.20
step
talk Ysera##206408
|tip 在建筑物内。
告诉她“我已准备好。”
请尤希拉降低眼睛的防御。 |q 76331/1 |goto 52.83,27.97
step
观察对话
talk Merithra##206406
turnin Merithra's Gambit##76331 |goto 52.89,28.03
accept Triple Threat##76333 |goto 52.89,28.03
accept Might of the Forest##76335 |goto 52.89,28.03
stickystart "Slay_Djaradin_Forces_and_Activate_Traps"
step
kill Moltenbinder##206477 |q 76333/2 |goto 54.27,25.45
step
kill Galok Wingslicer##209047 |q 76333/3 |goto 56.78,23.51
step
kill The Anvil##206478 |q 76333/1 |goto 56.85,28.32
step
label "Slay_Djaradin_Forces_and_Activate_Traps"
在该区域击杀敌人
点击该区域周围的物品
击杀达贾拉丁势力并激活陷阱 |q 76335/1 |goto 54.54,26.72
step
talk Merithra##206416
turnin Triple Threat##76333 |goto 57.34,26.14
turnin Might of the Forest##76335 |goto 57.34,26.14
accept Flight and Fight##76336 |goto 57.34,26.14
step
kill 25 Lava Sporebat##211877 |q 76336/2 |goto 55.06,29.23
|tip 在你的飞龙骑乘坐骑上翱翔于空中。
step
talk Merithra##206416
告诉她“我准备好了。”
与梅里萨交谈 |q 76336/3 |goto 51.50,30.31
step
talk Merithra##206406
turnin Flight and Fight##76336 |goto 51.97,29.48
accept The Ember Still Smolders##76337 |goto 51.97,29.48
step
talk Merithra##206896
turnin The Ember Still Smolders##76337 |goto 50.80,62.88
accept The Bloom Begins##76384 |goto 50.80,62.88
|tip 这个任务可能还不可用。
step
use the Tears of the Eye##210847
消耗声望令牌 |complete itemcount(210847) == 0
step
talk Merithra##206896
问她“你能告诉我关于花开的事吗？”
与梅里萨交谈 |q 76384/1 |goto 50.80,62.88
step
talk Merithra##206896
turnin The Bloom Begins##76384 |goto 50.80,62.88
step
talk Alexstrasza the Life-Binder##208503
accept Forward Unto Fire##76416 |goto 50.75,62.83
step
talk Alexstrasza the Life-Binder##208550
turnin Forward Unto Fire##76416 |goto 38.89,39.13
step
talk Vyranoth##208553
accept A Clash of Ice and Fire##76386 |goto 38.87,39.18
step
talk Merithra##208551
accept Hazardous Horticulture##76385 |goto 38.96,39.13
stickystart "Plant_Dream_Seeds"
stickystart "Slay_Wildfire_Forces"
step
use Frozenheart's Wrath##208544
|tip 把它用在卡尔德拉莫尔身上。
kill 1 Calderamor##207136 |q 76386/2 |goto 35.54,40.27
step
use Frozenheart's Wrath##208544
kill 1 Ignarion##209360 |q 76386/3 |goto 33.44,41.00
step
label "Plant_Dream_Seeds"
click Dream Seed Dirt Pile+
|tip 它们看起来像这个区域地面上的大土堆。
植物 #6# 梦想种子 |q 76385/1 |goto 36.07,39.39
step
label "Slay_Wildfire_Forces"
在该区域击杀敌人
击杀#15#野火力量 |q 76386/4 |goto 35.62,39.76
step
talk Vyranoth##208553
turnin A Clash of Ice and Fire##76386 |goto 38.84,39.17
step
talk Merithra##208551
turnin Hazardous Horticulture##76385 |goto 38.63,39.16
step
talk Tyrande Whisperwind##208552
accept Defense of the Ancients##76387 |goto 38.66,39.15
step
talk Alexstrasza the Life-Binder##208550
accept A Scrap of Hope##76436 |goto 38.76,39.19
stickystart "Collect_Scraps_of_Parchment"
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 39.26,36.10 |count 1
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 39.44,35.10 |count 2
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 38.67,35.00 |count 3
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 39.02,34.63 |count 1
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 38.78,34.73 |count 2
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 38.63,34.42 |count 3
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 39.63,32.83 |count 1
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 38.81,31.83 |count 2
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 39.46,31.42 |count 3
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.09,33.76 |count 1
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.59,33.90 |count 2
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.01,34.99 |count 3
step
label "Collect_Scraps_of_Parchment"
在该区域击杀敌人
collect 8 Scrap of Parchment##210023 |q 76436/1 |goto 38.82,36.24
step
talk Tyrande Whisperwind##208552
turnin Defense of the Ancients##76387 |goto 38.81,38.90
step
talk Alexstrasza the Life-Binder##208550
turnin A Scrap of Hope##76436 |goto 38.60,39.03
accept Fighting Fire With Fire##76388 |goto 38.60,39.03
step
click Skyfire Turret
摧毁第一座北方火焰炮台 |q 76388/1 |goto 26.76,27.54 |count 1
step
click Skyfire Turret
摧毁第二座北方天空火炮 |q 76388/1 |goto 26.47,28.94 |count 2
step
click Skyfire Turret
摧毁第三座北方天火炮塔 |q 76388/1 |goto 25.56,27.73 |count 3
step
extraaction Call Alexstrasza##420864
标记第一火焰守卫 |q 76388/2 |goto 25.92,27.52
step
click Skyfire Turret
摧毁第一座西方天空火炮 |q 76388/3 |goto 25.14,31.90 |count 1
step
click Skyfire Turret
摧毁第二座西方天火炮塔 |q 76388/3 |goto 24.52,31.60 |count 2
step
click Skyfire Turret
摧毁第三座西方天空火炮 |q 76388/3 |goto 23.71,32.50 |count 3
step
extraaction Call Alexstrasza##420864
标记第二个火焰守卫 |q 76388/4 |goto 24.15,32.30
step
click Skyfire Turret
摧毁第一座南方天火炮台 |q 76388/5 |goto 27.61,35.18 |count 1
step
click Skyfire Turret
摧毁第二个南方烈焰炮台 |q 76388/5 |goto 28.26,34.14 |count 2
step
click Skyfire Turret
摧毁第三个南方天火炮台 |q 76388/5 |goto 29.04,35.14 |count 3
step
extraaction Call Alexstrasza##420864
标记最终火焰守卫 |q 76388/6 |goto 28.46,34.88
step
talk Tyrande Whisperwind##208568
turnin Fighting Fire With Fire##76388 |goto 34.97,35.34
accept The Age of Mortals##76389 |goto 34.97,35.34
step
talk Merithra##208567
accept Aerial Supremacy##76398 |goto 34.99,35.43
step
打击 #15# 原型龙 |q 76398/2 |goto 30.76,31.16
|tip 在你的龙骑坐骑上飞越空中的原始龙。
|tip 绿色魔 orb 将恢复 1 点活力。
step
use the Horn of Cenarius##208752
|tip 在这一地区对友好的NPC使用它。
在该区域击杀敌人
赋能英雄，击败敌人于烈焰之地 |q 76389/1 |goto 31.80,31.11
step
talk Tyrande Whisperwind##208574
|tip 上去平台上。
turnin The Age of Mortals##76389 |goto 35.09,33.43
step
talk Merithra##208573
|tip 上去平台上。
turnin Aerial Supremacy##76398 |goto 35.07,33.52
step
talk Alexstrasza the Life-Binder##208572
|tip 上去平台上。
accept Echo of the Firelands##76401 |goto 35.04,33.59
step
kill 1 Prophet of the Flame##207315 |q 76401/1 |goto 32.47,33.53
|tip 离开地面目标区域。
step
talk Alexstrasza the Life-Binder##206921
|tip 你将很快被传送。
turnin Echo of the Firelands##76401 |goto 27.94,31.15
accept Amirdrassil, the Dream's Hope: Fyrakk##76402 |goto 27.94,31.15
step
击杀 Fyrakk |q 76402/1 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
|tip 这是“阿美德拉希尔，梦之希望”Raid的最终BOSS。
step
talk Alexstrasza the Life-Binder##206921
turnin Amirdrassil, the Dream's Hope: Fyrakk##76402 |goto The Emerald Dream/0 50.75,62.83
step
talk Tyrande Whisperwind##211634
accept A Blossom Witnessed##77780 |goto 27.58,31.45
step
talk Tyrande Whisperwind##211634
见证花海
与泰兰德交谈 |q 77780/1 |goto 27.58,31.45
step
talk Merithra of the Dream##206397
turnin A Blossom Witnessed##77780 |goto Ohn'ahran Plains/0 14.89,55.88
accept A Changed Land##76276 |goto 14.89,55.88
step
talk Khanam Matra Sarest##206455
|tip 在石桥上。
问她“大家还好吧？”
拜访人马族 |q 76276/1 |goto 34.27,53.07
step
参观目录管理者 |q 76276/2 |goto 21.82,62.26
step
click Washed-Up Pack
collect 1 Cataloger's Film##209806 |q 76276/3 |goto 21.72,61.80
step
talk Cataloger Wulferd##206468
告诉他“这是影片。”
将电影归还给沃尔夫德 |q 76276/4 |goto 21.71,62.31
step
talk Gnoll Mon-Ark##206428
问它“大家还好么？”
访问犬人摩尔阿克 |q 76276/5 |goto 28.64,69.95
step
talk Radza Thunderclaw##206438
问它“大家还好么？”
拜访长毛熊人 |q 76276/6 |goto 10.37,85.69
step
clicknpc Scaps##206418
访问塔斯卡尔 |q 76276/7 |goto 6.61,84.69
step
talk Merithra of the Dream##206397
turnin A Changed Land##76276 |goto 14.88,55.89
accept Auspicious Gathering##77329 |goto 14.88,55.89
step
talk Tyrande Whisperwind##208537
turnin Auspicious Gathering##77329 |goto Amirdrassil/0 50.82,61.47
accept Offerings for the Well##77200 |goto 50.82,61.47
step
talk Moon Priestess Lasara##208906
谢谢她的馈赠。
与月亮祭司拉萨拉交谈 |q 77200/4 |goto 50.82,61.28
step
talk Cerellean Whiteclaw##208900
告诉他“感谢你的赐福。”
与塞雷兰·白爪交谈 |q 77200/2 |goto 50.96,61.07
step
talk Rensar Greathoof##208907
告诉他“感谢你的赐福。”
与瑞萨尔·大角交谈 |q 77200/1 |goto 51.06,61.26
step
talk Delaryn Summermoon##208905
谢谢她的馈赠。
与德拉瑞恩·夏月交谈 |q 77200/3 |goto 51.28,61.96
step
talk Tyrande Whisperwind##208537
turnin Offerings for the Well##77200 |goto 50.82,61.47
accept New Moon##76280 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
与泰兰德交谈 |q 76280/1 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
turnin New Moon##76280 |goto 50.82,61.47
accept Something Worth Celebrating##76281 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
告诉她“出发吧。”
与泰兰德交谈以加入队伍 |q 76281/1 |goto 50.82,61.47
step
click Vibrant Feast
接取首个餐点订单 |q 76281/2 |goto 52.40,61.65
step
click Table+
click Vibrant Feast+
|tip 点击周围高亮的桌子。
|tip 你需要在每三张桌子之间访问一次丰盛盛宴。
服务#12#桌子 |q 76281/3 |goto 53.33,60.73
step
talk Merithra of the Dream##206849
turnin Something Worth Celebrating##76281 |goto 54.25,57.88
accept A Different Enthusiasm##77781 |goto 54.25,57.88
step
talk Kalecgos##209042
accept A Disquieting Feeling##76282 |goto 54.32,57.88
stickystart "Kill_Spriggan_Pranksters"
step
talk Kritha##206941
告诉他“我想给卡德加来一杯酒，谢谢。”
点一杯饮料 |q 76282/1 |goto 52.86,56.51
|tip 选择任何饮品。
step
talk Archmage Khadgar##209041
告诉他“我有一杯来自卡雷苟斯的饮品。”
将饮料送给卡德罗斯 |q 76282/2 |goto 54.03,61.97
step
label "Kill_Spriggan_Pranksters"
kill 6 Spriggan Prankster##212007 |q 77781/1 |goto 54.57,59.24
|tip 点击周围区域内高亮的物体和NPC以揭示恶作剧者。
step
talk Kalecgos##209042
turnin A Disquieting Feeling##76282 |goto 54.32,57.88
step
talk Merithra of the Dream##206849
turnin A Different Enthusiasm##77781 |goto 54.25,57.88
accept Andu-falah-dor##76283 |goto 54.25,57.88
step
talk Merithra of the Dream##206849
告诉她“我已经准备好离开派对了。”
与梅瑞莎对话以离开队伍 |q 76283/1 |goto 54.25,57.88
step
talk Merithra of the Dream##209051
在月泉与梅瑞莎交谈 |q 76283/2 |goto 51.84,61.28
step
talk Alexstrasza##208763
turnin Andu-falah-dor##76283 |goto 50.88,61.67
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign + Side Quests",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dream campaign questline and various zone side quests.",
startlevel=70,
patch='100200',
},[[
leechsteps "Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames"
step
accept Call of the Dream##76317 |goto Valdrakken/0 53.20,50.62
|tip 你将自动接受这个任务。
step
talk Merithra##187590
turnin Call of the Dream##76317 |goto Ohn'ahran Plains/0 18.66,51.77
accept Emerald Welcome##76318 |goto 18.66,51.77
step
穿越翡翠梦境 |q 76318/1 |goto 18.44,52.41
step
talk Merithra##206425
问她“你希望我看到什么？”
与梅里萨交谈 |q 76318/2 |goto The Emerald Dream/0 69.42,54.04
step
talk Merithra##206425
turnin Emerald Welcome##76318 |goto 69.42,54.04
accept Feast or Flaming##76319 |goto 69.42,54.04
step
talk Athera##208286
home Verdant Landing |goto The Emerald Dream/0 69.53,53.24 |q 76319
step
talk Occarim##208280
fpath Verdant Landing |goto 68.81,54.81 |q 76319
step
吃 #12# 火焰 |q 76319/2 |goto 66.14,55.73
|tip 在你的龙骑坐骑上飞越空中的光环。
|tip 绿色魔 orb 将恢复 1 点活力。
step
talk Cenarius##206510
turnin Feast or Flaming##76319 |goto 64.30,58.23
accept Wild Gods in Our Midst##76320 |goto 64.30,58.23
step
talk Goldrinn##206527
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求戈尔丁的援助 |q 76320/1 |goto 62.63,66.23
step
talk Q'onzu##206530
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求Q'onzu的援助 |q 76320/2 |goto 65.65,70.16
step
talk Elder Cassaphine##206571
|tip 洞内探险
告诉她“梅瑞萨请求你帮助守护世界之树。”
请求卡萨芬长者的援助 |q 76320/3 |goto Barrows of Reverie/0 66.62,45.16
step
talk Cenarius##206583
turnin Wild Gods in Our Midst##76320 |goto The Emerald Dream/0 63.28,71.50
accept Burning Assault##76321 |goto 63.28,71.50
accept The Face of Our Enemies##76322 |goto 63.28,71.50
stickystart "Slay_Fyrakk's_Forces"
stickystart "Accept_Mysterious_Seeds"
step
kill Apostle Fenarelle##206628 |q 76322/2 |goto 61.42,68.74
step
kill Stormbrand Ko'mal##206684 |q 76322/1 |goto 64.35,67.95
step
label "Slay_Fyrakk's_Forces"
在该区域击杀敌人
击杀菲拉克的部队 |q 76321/1 |goto 62.89,68.30
step
label "Accept_Mysterious_Seeds"
在该区域击杀敌人 |notinsticky
accept Mysterious Seeds##78172 |goto 62.89,68.30
|tip 你会在拾取后自动接受这个。
step
talk Merithra##206688
turnin Burning Assault##76321 |goto 62.78,68.63
turnin The Face of Our Enemies##76322 |goto 62.78,68.63
accept The Cruel##77818 |goto 62.78,68.63
step
clicknpc Flame Portal
|tip 离开地面上的大旋涡区域。
帮助梅里萨关闭火焰传送门 |q 77818/1 |goto 62.67,68.42
step
clicknpc Dream Portal##206703
进入梦境传送门 |q 77818/2 |goto 62.91,68.98
step
talk Merithra##206806
turnin The Cruel##77818 |goto 61.48,60.39
accept Amirdrassil##76323 |goto 61.48,60.39
step
talk Merithra##206809
|tip 她最终会飞往这个地点。
turnin Amirdrassil##76323 |goto 53.83,63.93
accept Lost to the Flame##76324 |goto 53.83,63.93
step
kill Elder Cassaphine##206818 |q 76324/1 |goto 50.60,71.86
step
talk Merithra##206979
turnin Lost to the Flame##76324 |goto 50.96,69.99
|tip 保留你从这个任务获得的装备，以便在后续任务中使用。
accept Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
step
talk Merithra##206979
告诉她“我与你同在。”
与梅里萨交谈 |q 76325/1 |goto 50.96,69.99
step
talk Merithra##206979
turnin Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
accept Home in the Dream##76326 |goto 50.96,69.99
step
talk Solarys Thorngale##210196
accept Burning Out##77948 |goto 52.01,63.63
step
talk Merithra##206896
turnin Home in the Dream##76326 |goto 50.80,62.88
accept A Multi-Front Battle##77283 |goto 50.80,62.88
step
talk Leora##207636
fpath Central Encampment |goto 51.09,62.35 |q 77283
step
talk Keeper Amrymn##208143
寻找守护者阿米尔门 |q 77283/2 |goto 50.21,61.59
step
talk Keeper Amrymn##208143
accept A Worthy Ally: Dream Wardens##78444 |goto 50.21,61.59
|only if questactive(78444)
step
talk Saelienne##207627
|tip 帐篷内。
寻找塞丽安娜 |q 77283/1 |goto 49.85,61.64
step
talk Saelienne##207627
|tip 帐篷内。
home Central Encampment |goto 49.85,61.64 |q 77283
step
talk Lady Moonberry##208669
accept Dreams Unified##78381 |goto 49.78,62.49
step
talk Vaskarn##211328
accept It Starts With a Stone##78262 |goto 49.79,62.94
step
talk Vaskarn##211328
寻找瓦斯卡尔 |q 77283/3 |goto 49.79,62.95
step
收集 #50# 飞行石 |q 78262/1 |goto 49.79,62.94
|tip 你应该从目前完成的任务中获得50个这些。
step
talk Cuzolth##211329
|tip 你现在应该有一件装备可以升级了。
|tip 将它拖到窗口中并点击“升级”按钮。
用飞行石升级装备一件装备 |q 78262/2 |goto 49.85,62.90
step
talk Vaskarn##211328
turnin It Starts With a Stone##78262 |goto 49.79,62.95
accept Dreaming of Crests##78271 |goto 49.79,62.95
step
talk Merithra##206896
turnin A Multi-Front Battle##77283 |goto 50.80,62.88
accept The Burning Barrow##77436 |goto 50.80,62.88
step
talk Tyrande Whisperwind##206247
|tip 在地面上，而不是在悬崖上。
turnin The Burning Barrow##77436 |goto 51.40,43.07
accept Ashen Soil##76433 |goto 51.40,43.07
accept Not Yet Lost##76434 |goto 51.40,43.07
stickystart "Assist_the_Burning_Barrow"
step
沿着小路走下去 |goto Sor'theril Barrow Den/0 44.88,72.28 < 7 |walk
继续沿着道路前进 |goto 37.80,44.89 < 7 |walk
继续沿着道路前进 |goto 60.04,23.31 < 7 |walk
寻找火焰德鲁伊 |q 76433/1 |goto 64.78,58.65
|tip 洞内探险
step
label "Assist_the_Burning_Barrow"
在该区域击杀敌人
clicknpc Harried Dryad##206375+
|tip 洞内探险
协助燃烧墓穴 |q 76434/1 |goto 42.87,30.17
step
talk Tyrande Whisperwind##206247
turnin Ashen Soil##76433 |goto The Emerald Dream/0 51.43,42.71
turnin Not Yet Lost##76434 |goto 51.43,42.71
accept The Smoldering Copse##76435 |goto 51.43,42.71
step
talk Tyrande Whisperwind##207160
turnin The Smoldering Copse##76435 |goto 40.80,47.50
accept Burning Ground##76437 |goto 40.80,47.50
accept Grim Reprisal##76441 |goto 40.80,47.50
stickystart "Disrupt_the_Smoldering_Copse"
step
talk Lyandris Thorngale##210257
选择 _"<拿起日志。>"_
寻找莱安德里斯·索恩戈尔 |q 77948/1 |goto 37.99,47.21
step
click Singed Leaflet
accept A Passed Torch##77978 |goto 38.00,47.21
stickystart "Kill_Smoldering_Enforcer"
stickystart "Rescue_Captured_Denizens"
step
click Singed Leaflet##408809+
|tip 它们看起来像这个区域地面上的小焦黑页面。
|tip 它们在你的小地图上显示为黄色圆点。
collect 6 Singed Leaflet##209048 |q 77978/1 |goto 35.97,46.61
step
label "Kill_Smoldering_Enforcer"
kill 6 Smoldering Enforcer##206859 |q 77978/2 |goto 35.72,45.81
step
label "Rescue_Captured_Denizens"
click Smolderbark Cage+
|tip 它们看起来像这个区域周围的巨大木制笼子。
营救 #8# 被捕的生灵 |q 76437/1 |goto 34.25,47.46
你可以在[36.91,49.00]附近找到更多。
step
进入洞穴 |goto 34.68,44.88 < 7 |walk
talk Thaeldus Thorngale##210256
|tip 洞内探险
告诉他“你的姐姐索拉瑞斯派我来找你。”
寻找塞尔杜斯·索恩盖尔 |q 77948/2 |goto 34.35,44.28
step
talk Kery'nael Thorngale##210251
问他 "你的姐姐索拉瑞斯派我来找你。你还好吗？"
寻找凯瑞娜尔·索恩盖尔 |q 77948/3 |goto 38.79,43.58
step
label "Disrupt_the_Smoldering_Copse"
在该区域击杀敌人
click Smoldering Supplies
扰乱烟烬林 |q 76441/1 |goto 35.64,46.89
step
talk Tyrande Whisperwind##207160
turnin Burning Ground##76437 |goto 35.99,50.93
turnin Grim Reprisal##76441 |goto 35.99,50.93
accept Forlorn Hope##76442 |goto 35.99,50.93
step
talk Tyrande Whisperwind##207160
告诉她“我已准备好。”
与泰兰德交谈 |q 76442/1 |goto 36.00,50.94
step
kill Sylvanesh the Ascended##207107 |q 76442/2 |goto 35.37,49.47
step
talk Tyrande Whisperwind##211193
turnin Forlorn Hope##76442 |goto 36.14,50.87
accept The Looming Cinder##76443 |goto 36.14,50.87
step
talk Merithra##206896
turnin The Looming Cinder##76443 |goto 50.80,62.88
step
use the Mark of the Dream Wardens##210730
消耗声望令牌 |complete itemcount(210730) == 0
step
talk Vyranoth##208506
accept Mayhem Incarnate##76403 |goto 50.81,62.73
step
talk Solarys Thorngale##210196
turnin Burning Out##77948 |goto 50.86,63.62
turnin A Passed Torch##77978 |goto 50.86,63.62
step
use the Bounty of the Fallen Defector##210921
消耗声望令牌 |complete itemcount(210921) == 0
step
talk Keeper Amrymn##208143
turnin A Worthy Ally: Dream Wardens##78444 |goto 50.21,61.60
|only if readyq(78444) or completedq(78444)
step
talk Vyranoth##206612
turnin Mayhem Incarnate##76403 |goto 36.83,25.86
accept Best Laid Plans##76343 |goto 36.83,25.86
step
talk Buri##206619
accept Light 'Em Up!##76342 |goto 36.85,26.08
stickystart "Hinder_the_Primalist_Forces"
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 37.20,22.94 |count 1
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 36.21,21.04 |count 2
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 36.03,20.20 |count 3
step
click Proto-Dragon Tablet
寻找线索 |q 76343/1 |goto 34.65,20.08 |count 4
step
label "Hinder_the_Primalist_Forces"
在该区域击杀敌人
clicknpc Flamecrested Portalweaver##208418+
阻碍原始力量的势力 |q 76342/1 |goto 36.43,22.06
step
talk Vyranoth##206612
turnin Best Laid Plans##76343 |goto 36.83,25.86
step
talk Buri##206619
turnin Light 'Em Up!##76342 |goto 36.85,26.09
accept Primalist Directive##76344 |goto 36.85,26.09
step
talk Vyranoth##206612
accept Finding Terro##76345 |goto 36.83,25.86
step
调查灼热深渊 |q 76345/1 |goto 39.98,20.09
step
talk Terro##208377
调查泰罗的尸体
调查特罗的尸体 |q 76345/2 |goto 39.94,20.06
step
观察对话
kill 1 Igneous Stonemauler##210043 |q 76345/3 |goto 40.11,20.08
step
与梦境破碎者NPC交谈，位于此区域内
|tip 其中一些会攻击你。
摇摆者 #5# 原始者 |q 76344/1 |goto 40.04,21.68
step
talk Buri##210178
turnin Primalist Directive##76344 |goto 39.61,22.90
turnin Finding Terro##76345 |goto 39.61,22.90
accept Assault on the Wellspring##76532 |goto 39.61,22.90
step
talk Buri##208674
选择 _"<看Buri指的地方。>"_
观察生命之泉 |q 76532/1 |goto 33.56,30.53
step
talk Suzska##208378
turnin Assault on the Wellspring##76532 |goto 27.63,32.19
accept Big Bright Beautiful Barrier##76348 |goto 27.63,32.19
step
click Barrier Fragment+
|tip 它们看起来像是散落在这个区域的绿色水晶。
获取 #6# 障碍碎片 |q 76348/1 |goto 28.19,31.20
step
extraaction Heal Barrier##423058
治愈屏障 |q 76348/2 |goto 28.04,31.23
step
talk Suzska##208378
告诉她 "屏障已修复。"
与苏兹卡交谈 |q 76348/3 |goto 27.63,32.19
step
talk Suzska##208725
turnin Big Bright Beautiful Barrier##76348 |goto 33.51,30.27
accept Power, Eruption, and Lies##76347 |goto 33.51,30.27
step
kill Lethka##208740 |q 76347/1 |goto 30.20,22.35
step
talk Vyranoth##210733
turnin Power, Eruption, and Lies##76347 |goto 33.73,25.25
accept Tactical Withdrawal##77178 |goto 33.73,25.25
step
talk Thevelo##209427
fpath Wellspring Overlook |goto 35.65,33.64 |q 77178
step
talk Alexstrasza the Life-Binder##208503
turnin Tactical Withdrawal##77178 |goto 50.76,62.83
step
use the Scales of Remorse##210757
消耗声望令牌 |complete itemcount(210757) == 0
step
talk Ysera##206408
accept Eye of Ysera##76327 |goto 50.85,62.91
step
talk Cenarius##209318
accept The Dryad Garden##76566 |goto 50.78,62.09
accept The Q'onzu Query##78065 |goto 50.78,62.09
step
talk Lady Moonberry##208669
accept Trouble at the Tree##77316 |goto 49.78,62.49
step
kill Scheming Spriggan##208721+
kill Sneaky Spriggan##208718+
collect 6 Very Important Tree Supplies##208977 |q 77316/1 |goto 50.14,61.39
step
talk Lady Moonberry##208669
turnin Trouble at the Tree##77316 |goto 49.79,62.49
accept Hatted Hibernation##77317 |goto 49.79,62.49
step
clicknpc Dreaming Druid with a Hat##210344
|tip 把帽子用在帐篷里的德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 49.94,61.55 |count 1
step
clicknpc Dreaming Druid with a Hat##210315
|tip 把帽子使用在德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 50.92,62.06 |count 2
step
clicknpc Dreaming Druid with a Hat##210316
|tip 把帽子使用在德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 51.31,61.93 |count 3
step
clicknpc Dreaming Druid with a Hat##210312
|tip 把帽子用在帐篷里的德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 52.48,62.61 |count 4
step
clicknpc Dreaming Druid with a Hat##210320
|tip 把帽子使用在德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 51.21,63.48 |count 5
step
clicknpc Dreaming Druid with a Hat##210315
|tip 把帽子使用在德鲁伊身上。
use the Silly Hat##208985
kill Manifested Dreamsaber##210320
将傻帽放在梦游德鲁伊身上 |q 77317/1 |goto 50.47,63.58 |count 6
step
talk Icarius##210133
accept A Sleepy Search##77896 |goto 50.29,63.36
step
talk Lady Moonberry##208669
turnin Hatted Hibernation##77317 |goto 49.79,62.49
accept Merithra Says##77318 |goto 49.79,62.49
step
talk Lady Moonberry##208669
选择 _"<获取梅里莎的服装。>"_
从月亮莓女士那里获取梅里萨的伪装 |q 77318/1 |goto 49.79,62.49
step
talk Sian'Shim##210402
告诉德鲁伊做杯子蛋糕。
将指令传达给德鲁伊 |q 77318/2 |goto 50.09,62.47 |count 1
step
talk Malia Pierce##208737
告诉德鲁伊开始一场舞蹈派对
将指令传达给德鲁伊 |q 77318/2 |goto 50.12,62.50 |count 2
step
talk Yonpak Ambercrest##210400
选择 _"<给德鲁伊一份在营地周围传达给其他人的指令列表。>"_
将指令传达给德鲁伊 |q 77318/2 |goto 51.00,62.28 |count 3
step
talk Edith Morgan##210401
告诉德鲁伊制作花冠，这样所有的志愿者就可以齐心协力。
将指令传达给德鲁伊 |q 77318/2 |goto 50.91,61.88 |count 4
step
talk Dodon Silverwing##210403
让德鲁伊收集荧光红莓。
将指令传达给德鲁伊 |q 77318/2 |goto 50.29,61.18 |count 5
step
talk Lady Moonberry##208669
turnin Merithra Says##77318 |goto 49.79,62.49
step
use the Spare Party Hat##210997
消耗声望令牌 |complete itemcount(210997) == 0
step
talk Ethidris Creekward##207779
turnin The Dryad Garden##76566 |goto 53.73,74.55
accept Grousing Garden##76567 |goto 53.73,74.55
accept Pineshrew Panic##76568 |goto 53.73,74.55
stickystart "Tire_Out_Wildlife"
step
点击该区域的动物
|tip 点击各种小动物以摇动种子。
摇动#20#松鼠种子 |q 76568/1 |goto 54.40,75.69
step
clicknpc Big Snaggleclaw##209291
寻找大搅扰爪 |q 76568/2 |goto 53.95,77.26
step
观察对话
寻找大搅扰爪 |q 76568/3 |goto 53.95,77.26
step
label "Tire_Out_Wildlife"
在该区域击杀敌人
疲劳野生生物 #20# |q 76567/1 |goto 54.40,75.69
step
talk Ethidris Creekward##207779
告诉他“一只大松鼠跳进了一个水洼，然后出现了一个女树妖。”
告诉艾希德里斯关于德鲁伊 |q 76568/4 |goto 53.74,74.55
step
talk Ethidris Creekward##207779
turnin Grousing Garden##76567 |goto 53.74,74.55
turnin Pineshrew Panic##76568 |goto 53.74,74.55
accept Druid-Guardian Conference##76569 |goto 53.74,74.55
step
talk Ethidris Creekward##207779
回答伊希德里斯的问题 |q 76569/1 |goto 53.74,74.55
|tip 选择你喜欢的回复。
step
talk Ethidris Creekward##207779
turnin Druid-Guardian Conference##76569 |goto 53.74,74.55
accept The Family Business##76570 |goto 53.74,74.55
step
use the Dryad-Keeper Credentials##211371
消耗声望令牌 |complete itemcount(211371) == 0
step
talk Melyrine Petalshade##207781
accept Growth Experience##76571 |goto 53.76,74.51
step
进入洞穴 |goto 58.04,77.77 < 7 |walk
talk Thaalean##210164
|tip 洞内探险
turnin A Sleepy Search##77896 |goto 58.13,77.31
accept Build-a-Blanket##77911 |goto 58.13,77.31
accept Fluffy Filler Retrieval##77922 |goto 58.13,77.31
stickystart "Collect_Velvety_Lasher_Leaves"
step
click Voluptuous Vines##408130+
|tip 它们看起来像这个区域地面上的大块树叶。
collect 8 Silky Sage##208931 |q 77922/1 |goto 59.40,79.75
step
label "Collect_Velvety_Lasher_Leaves"
在这个区域击杀天鹅绒敌人
collect 6 Velvety Lasher Leaves##208930 |q 77911/1 |goto 59.40,79.75
step
进入洞穴 |goto 58.04,77.78 < 7 |walk
talk Thaalean##210164
|tip 洞内探险
turnin Build-a-Blanket##77911 |goto 58.13,77.31
turnin Fluffy Filler Retrieval##77922 |goto 58.13,77.31
accept Heated Hearthstone Hustle##77955 |goto 58.13,77.31
stickystart "Collect_Lasher_Hearts"
step
click Prepared Soil+
|tip 它们看起来像这个区域地面上的大型土堆。
种植五朵花 |q 76571/1 |goto 58.98,71.86
step
label "Collect_Lasher_Hearts"
kill Sickly Lasher##207809+
collect 6 Lasher Heart##208732 |q 76570/1 |goto 58.80,72.14
step
_Next to you:_
talk Dionaessa##210813
turnin The Family Business##76570 |goto 58.80,72.14
turnin Growth Experience##76571 |goto 58.80,72.14
accept A Poisonous Promotion##76572 |goto 58.80,72.14
step
kill 1 Sickened Growth##207926 |q 76572/1 |goto 58.03,72.39
step
kill The Stonewarmer##210235
|tip 他在树周围走。
collect 1 Heated Hearthstone##208949 |q 77955/1 |goto 59.72,68.95
step
进入洞穴 |goto 58.04,77.78 < 7 |walk
talk Thaalean##210164
|tip 洞内探险
将“给塔兰的炽热炉石。”
将加热的炉石交给萨雷安 |q 77955/2 |goto 58.13,77.31
step
观察对话
|tip 洞内探险
等待萨尔恩 |complete readyq(77955) or completedq(77955) |goto 58.13,77.31
step
talk Thaalean##210164
|tip 洞内探险
turnin Heated Hearthstone Hustle##77955 |goto 58.13,77.31
accept Sleepy Druid in Emerald Dream##77958 |goto 58.13,77.31
step
talk Thaalean##210718
|tip 洞内探险
选择 _“唱一首摇篮曲。”_
|tip 随便选一个你想要的。
唱首摇篮曲给萨尔恩 |q 77958/1 |goto 58.15,77.33
step
talk Dionaessa##209788
turnin A Poisonous Promotion##76572 |goto 53.77,74.60
accept What Do I Call You?##77802 |goto 53.77,74.60
step
talk Dionaessa##209788
|tip 选择你喜欢的可用称号。
与迪奥内莎交谈以选择一个头衔 |q 77802/1 |goto 53.77,74.60
step
talk Dionaessa##209788
turnin What Do I Call You?##77802 |goto 53.77,74.60
step
use Crown of the Dryad Daughter##210958
消耗声望令牌 |complete itemcount(210958) == 0
step
talk Icarius##210133
turnin Sleepy Druid in Emerald Dream##77958 |goto 50.29,63.36
step
use the Spare Heated Hearthstone##210952
消耗声望令牌 |complete itemcount(210952) == 0
step
寻找Q'onzu的巢穴 |q 78065/1 |goto 34.74,68.94
step
talk Dreamkin##210646
turnin The Q'onzu Query##78065 |goto 34.74,68.94
accept Q'onzu's Qualification##78163 |goto 34.74,68.94
step
talk Dreamkin##211678
|tip 强大。繁荣。
回答问题 |q 78163/1 |goto 34.57,68.91 |count 1
step
talk Dreamkin##211663
|tip 答复“月火术者”
回答问题 |q 78163/1 |goto 34.61,68.79 |count 2
step
talk Dreamkin##211511
|tip 回答 "螺旋。"
回答问题 |q 78163/1 |goto 34.67,68.66 |count 3
step
talk Dreamkin##211668
|tip 回答“静止”。
回答问题 |q 78163/1 |goto 34.69,68.55 |count 4
step
观察对话
talk Q'onzu##210524
turnin Q'onzu's Qualification##78163 |goto 34.65,69.31
accept Q'onzu's Perception##78064 |goto 34.65,69.31
step
use the Bag of Many Wonders##211373
打开背包 |complete itemcount(211373) == 0
step
use Q'onzu's Consolation Prize##211372
消耗声望令牌 |complete itemcount(211372) == 0
step
进入洞穴 |goto 32.96,67.09 < 7 |walk
寻找干涉者 |q 78064/1 |goto 33.25,67.41
|tip 洞内探险
step
talk Q'onzu##210524
turnin Q'onzu's Perception##78064 |goto 34.63,69.33
accept Q'onzu's Distraction##78162 |goto 34.63,69.33
step
use Q'onzu's Faerie Feather##210227
clicknpc Invasive Podling##211781+
|tip 将他们削弱至50%，然后对他们使用羽毛。
变形 #8# 弱化的幼芽 |q 78162/1 |goto 36.91,65.78
step
talk Q'onzu##210524
turnin Q'onzu's Distraction##78162 |goto 34.61,69.32
accept The Answers You've Earned##78066 |goto 34.61,69.32
step
talk Q'onzu##210524
请问你的等级是多少？
询问 Q'onzu 问题 |q 78066/1 |goto 34.61,69.32
step
talk Cenarius##209318
告诉他“Q'onzu让我去询问其他人的故事。”
告诉塞纳留斯Q'onzu所言 |q 78066/2 |goto 50.78,62.09
step
talk Gossiping Dryad##211799
问她“你知道关于Q'onzu的事情吗？”
倾听树精的传闻 |q 78066/5 |goto 53.14,63.12
step
talk Aessina##211814
|tip 树下的蓝色漂浮幽灵
问她“你知道关于Q'onzu的事情吗？”
聆听艾希娜的故事 |q 78066/4 |goto 52.52,66.62
step
talk Aviana##211808
|tip 在根部上方。
问她“你知道关于Q'onzu的事情吗？”
聆听艾维娜的故事 |q 78066/3 |goto 49.65,65.88
step
talk Cenarius##209318
告诉塞纳留斯你听到的谣言。
与塞纳留斯分享传言 |q 78066/6 |goto 50.78,62.08
step
询问Q'onzu关于传闻的事宜 |q 78066/7 |goto 34.65,69.25
step
talk Single Feather##211821
turnin The Answers You've Earned##78066 |goto 34.65,69.25
step
use the Tangled Yarn of Secrets##211374
消耗声望令牌 |complete itemcount(211374) == 0
step
use the Tangled Yarn of Secrets##211377
消耗声望令牌 |complete itemcount(211377) == 0
step
use the Tangled Yarn of Secrets##211379
消耗声望令牌 |complete itemcount(211379) == 0
step
use the Tangled Yarn of Secrets##211380
消耗声望令牌 |complete itemcount(211380) == 0
step
use the Insight of Q'onzu##210950
消耗声望令牌 |complete itemcount(210950) == 0
step
talk Cenarius##209318
accept Sky Mother's Ire##78041 |goto 50.78,62.09
step
talk Delaryn Summermoon##209516
accept A Call to Aid##77662 |goto 50.14,61.04
step
click Portal to the Eye of Ysera
进入伊瑟拉之眼的传送门 |q 76327/1 |goto 50.96,62.60
step
talk Merithra##206416
turnin Eye of Ysera##76327 |goto 52.11,29.25
accept A New Brute##76328 |goto 52.11,29.25
step
clicknpc Emerald Preserver##206480
赋能守护者 |q 76328/1 |goto 52.17,29.61 |count 1
step
clicknpc Emerald Preserver##210701
赋能守护者 |q 76328/1 |goto 52.31,29.90 |count 2
step
clicknpc Emerald Preserver##210702
赋能守护者 |q 76328/1 |goto 51.91,30.39 |count 3
step
clicknpc Emerald Preserver##210703
赋能守护者 |q 76328/1 |goto 51.38,29.73 |count 4
step
clicknpc Emerald Preserver##210704
赋能守护者 |q 76328/1 |goto 51.69,29.06 |count 5
step
talk Ysera##206408
|tip 在建筑物内。
查看伊瑟拉 |q 76328/2 |goto 52.83,27.97
step
talk Merithra##206406
|tip 她冲向建筑内部的这个位置。
turnin A New Brute##76328 |goto 52.72,28.17
accept Fire Watch##78646 |goto 52.72,28.17
step
talk Merithra##206406
turnin Fire Watch##78646 |goto 52.14,24.23
accept In and Out Scout##76329 |goto 52.14,24.23
accept Disarm Specialist##76330 |goto 52.14,24.23
stickystart "Destroy_Suffusion_Supplies"
stickystart "Slay_Suffusion_Shapers"
step
use Somnowl's Shroud##210016
|tip 你可能需要在进入隐形后在区域内走动一下以获得进度。
潜行者监视熔火编织者 |q 76329/1 |goto 46.39,18.96
step
use Somnowl's Shroud##210016
在铸锤上的间谍 |q 76329/2 |goto 44.54,23.97
step
label "Destroy_Suffusion_Supplies"
click Suffusion Supplies
|tip 他们看起来像这个区域的锅炉聚集。
摧毁 #8# 膨胀补给品 |q 76330/2 |goto 45.71,23.34
step
label "Slay_Suffusion_Shapers"
kill 6 Suffusion Shaper##208676 |q 76330/1 |goto 45.71,23.34
step
talk Bodwin##209153
告诉他“让我们看看残酷的伊吉拉在干什么。”
潜伏于残忍的伊基拉身边 |q 76329/3 |goto 48.44,22.39
step
talk Merithra##206406
turnin In and Out Scout##76329 |goto 52.14,24.23
turnin Disarm Specialist##76330 |goto 52.14,24.23
step
talk Merithra##206406
|tip 在建筑物内。
accept Good Counsel##76334 |goto 53.06,28.20
step
与梅里萨重新汇合 |q 76334/1 |goto 53.06,28.19
|tip 在建筑物内。
step
talk Lord Itharius##206411
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 52.89,28.32 |count 1
step
talk Somnikus##206409
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 52.99,28.38 |count 2
step
talk Gerithus##206412
|tip 在建筑物内。
问他“你对梅瑞莎的计划怎么看？”
与绿龙交谈 |q 76334/2 |goto 53.04,28.28 |count 3
step
talk Ysera##206408
|tip 在建筑物内。
问她“你怎么看梅瑞莎的计划？”
与耶希拉交谈 |q 76334/3 |goto 52.83,27.97
step
talk Merithra##206406
|tip 在建筑物内。
turnin Good Counsel##76334 |goto 53.06,28.20
accept Putting Roots Down##76332 |goto 53.06,28.20
step
click Tilled Soil+
|tip 它们看起来像这个区域地上的土堆。
kill Noxious Seedling##211410+
|tip 他们有时在点击土壤后攻击。
植物#8#有毒种子 |q 76332/1 |goto 55.06,26.79
step
talk Kiya Featherpaw##208909
告诉她“梅瑞瑟拉说你有计划帮助击败达贾拉丁。”
与Kiya Featherpaw交谈 |q 76332/2 |goto 57.52,25.89
step
talk Somnikus##207081
告诉他“陷阱已布置完毕。我们准备好了。”
与索米克斯交谈 |q 76332/3 |goto 56.97,23.18
step
talk Keeper Adranas##210022
accept Memory of the Dreamer##77310 |goto 58.73,23.92
step
click Comfy Pillow
观察对话
在耶塞拉之眼休息 |q 77310/1 |goto 58.55,24.09
step
talk Alexstrasza the Life-Binder##208713
turnin Memory of the Dreamer##77310 |goto 58.62,23.93
accept Healing Helper##77311 |goto 58.62,23.93
step
click Root Restoration Fruit##408066
collect 1 Root Restoration Fruit##208884 |q 77311/1 |goto 58.58,24.36
step
click Gracus
施加果汁 |q 77311/2 |goto 58.80,23.84
step
talk Alexstrasza the Life-Binder##208713
turnin Healing Helper##77311 |goto 58.61,23.93
accept Nature Persists##77312 |goto 58.61,23.93
step
talk Ysera##208714
accept A Solemn Summons##77313 |goto 58.62,23.78
step
talk Somnikus##207081
告诉他“陷阱已布置完毕。我们准备好了。”
与索米克斯交谈 |q 76332/3 |goto 56.97,23.18
stickystart "Collect_Sprouted_Seedlings"
step
talk Talathar Brightsong##208730
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 57.01,26.22 |count 1
step
talk Keeper Adranas##209398
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 57.65,28.10 |count 2
step
talk Alfie Turner##209407
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 56.91,29.36 |count 3
step
talk Eladriel##211353
fpath Eye of Ysera |goto 55.29,29.57 |q 77313
step
talk Admiral Peppers##209390
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 55.31,28.46 |count 4
step
talk Rani##209405
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 52.79,25.35 |count 5
step
talk Sprucecrown##209394
选择 _"<告诉他们关于格拉库斯的事。>"_
通知梦境居民 |q 77313/1 |goto 52.35,24.44 |count 6
step
label "Collect_Sprouted_Seedlings"
click Violet Forget-Me-Not+
|tip 它们看起来像这片区域地面上的紫色花瓣团。
kill Sneaky Podling##209835+
|tip 它们在点击花朵后出现。
collect 6 Sprouted Seedling##208676 |q 77312/1 |goto 55.88,26.93
step
talk Merithra##206406
|tip 在建筑物内。
turnin Putting Roots Down##76332 |goto 53.06,28.20
accept Merithra's Gambit##76331 |goto 53.06,28.20
step
talk Ysera##206408
|tip 在建筑物内。
告诉她“我已准备好。”
请尤希拉降低眼睛的防御。 |q 76331/1 |goto 52.83,27.97
step
观察对话
talk Merithra##206406
turnin Merithra's Gambit##76331 |goto 52.89,28.03
accept Triple Threat##76333 |goto 52.89,28.03
accept Might of the Forest##76335 |goto 52.89,28.03
stickystart "Slay_Djaradin_Forces_and_Activate_Traps"
step
kill Moltenbinder##206477 |q 76333/2 |goto 54.27,25.45
step
kill Galok Wingslicer##209047 |q 76333/3 |goto 56.78,23.51
step
kill The Anvil##206478 |q 76333/1 |goto 56.85,28.32
step
label "Slay_Djaradin_Forces_and_Activate_Traps"
在该区域击杀敌人
点击该区域周围的物品
击杀达贾拉丁势力并激活陷阱 |q 76335/1 |goto 54.54,26.72
step
talk Merithra##206416
turnin Triple Threat##76333 |goto 57.34,26.14
turnin Might of the Forest##76335 |goto 57.34,26.14
accept Flight and Fight##76336 |goto 57.34,26.14
step
kill 25 Lava Sporebat##211877 |q 76336/2 |goto 55.06,29.23
|tip 在你的飞龙骑乘坐骑上翱翔于空中。
step
talk Merithra##206416
告诉她“我准备好了。”
与梅里萨交谈 |q 76336/3 |goto 51.50,30.31
step
talk Merithra##206406
turnin Flight and Fight##76336 |goto 51.97,29.48
accept The Ember Still Smolders##76337 |goto 51.97,29.48
step
talk Alexstrasza the Life-Binder##208713
turnin Nature Persists##77312 |goto 58.61,23.93
step
talk Ysera##208714
turnin A Solemn Summons##77313 |goto 58.62,23.77
accept Requiem in a Dream##77314 |goto 58.62,23.77
step
click Tilled Earth
种下第一颗幼苗 |q 77314/1 |goto 58.76,23.72 |count 1
step
click Tilled Earth
种植第二个幼苗 |q 77314/1 |goto 58.84,23.68 |count 2
step
click Tilled Earth
种植第三个幼芽 |q 77314/1 |goto 58.89,23.77 |count 3
step
click Tilled Earth
种下第四个幼苗 |q 77314/1 |goto 58.89,23.91 |count 4
step
click Tilled Earth
种下第五个芽孢 |q 77314/1 |goto 58.84,24.00 |count 5
step
click Tilled Earth
种植第六个嫩芽 |q 77314/1 |goto 58.75,23.96 |count 6
step
talk Gracus##208671
询问格拉库斯你能如何帮助他
与格拉库斯交谈 |q 77314/2 |goto 58.81,23.84
step
talk Ysera##208714
turnin Requiem in a Dream##77314 |goto 58.62,23.77
accept Ancient Memories##77315 |goto 58.62,23.77
step
use the Sprout of Rebirth##210954
消耗声望令牌 |complete itemcount(210954) == 0
step
kill Lingering Torment##209564 |q 77315/1 |goto 54.77,18.24
step
talk Ysera##208714
turnin Ancient Memories##77315 |goto 58.62,23.77
step
use the Branch of Gracus##211370
消耗声望令牌 |complete itemcount(211370) == 0
step
talk Sylvia Whisperbloom##211265
turnin Mysterious Seeds##78172 |goto 59.75,16.89
accept Seed Legacy##77209 |goto 59.75,16.89
step
use the Mysterious Ageless Seeds##210014
种下小种子 |q 77209/1 |goto 59.73,15.85
step
use the Mysterious Ageless Seeds##210014
种下饱满的种子 |q 77209/2 |goto 59.20,17.37
step
use the Mysterious Ageless Seeds##210014
种下巨型种子 |q 77209/3 |goto 60.11,18.19
step
talk Sylvia Whisperbloom##211265
turnin Seed Legacy##77209 |goto 59.75,16.89
accept Nurturing Ageless Seeds##78170 |goto 59.75,16.89
step
kill Encroaching Lashling##211235+
collect 15 Ageless Dewdrops##211406 |q 78170/1 |goto 59.50,17.20
step
click Ageless Dreamseed Bloom
|tip 点击“无尽露珠”按钮五次。
培育小型永恒花 #5# 次数 |q 78170/2 |goto 59.72,15.84
step
click Ageless Dreamseed Bloom
|tip 点击“翡翠露珠”按钮五次。
培育丰腴永恒之花 #5# 次 |q 78170/3 |goto 59.20,17.37
step
click Ageless Dreamseed Bloom
|tip 点击“无尽露珠”按钮五次。
滋养巨型无龄之花 #5# 次 |q 78170/4 |goto 60.11,18.19
step
talk Sylvia Whisperbloom##211265
turnin Nurturing Ageless Seeds##78170 |goto 59.75,16.89
accept Blossoms of the Past##78171 |goto 59.75,16.89
step
click Ageless Blossom##410045
collect 1 Ageless Blossom##210052 |q 78171/1 |goto 59.64,15.80
step
click Ageless Blossom##410045
collect 2 Ageless Blossom##210052 |q 78171/1 |goto 59.20,17.37
step
click Ageless Blossom##410045
collect 3 Ageless Blossom##210052 |q 78171/1 |goto 60.16,18.07
step
talk Sylvia Whisperbloom##211265
turnin Blossoms of the Past##78171 |goto 59.75,16.89
accept Emerald Bounty##78206 |goto 59.75,16.89
step
talk Aviana##210587
|tip 漂浮岛屿高处。
turnin Sky Mother's Ire##78041 |goto 65.83,37.68
accept Aviana's Assessment##78042 |goto 65.83,37.68
step
talk Q'onzu##210585
|tip 漂浮岛屿高处。
accept Q'onzu's Quandary##78043 |goto 65.83,37.81
stickystart "Gather_Dreamkin_Intel"
stickystart "Collect_Bloodied_Armor_Scraps"
step
在该区域击杀敌人
accept Ashphodel Research Notes##77788 |goto 61.60,42.48
|tip 你会在拾取后自动接受这个。
step
click Sample of Cinder Pollen##410764
collect 1 Sample of Cinder Pollen##210453 |q 77788/1 |goto 60.82,44.90
|only if haveq(77788)
step
label "Gather_Dreamkin_Intel"
talk Flame-Disguised Dreamkin##210679+
|tip 这个区域到处都是猫头鹰人。
告诉他“Q'onzu对你所了解的火焰德鲁伊很感兴趣。”
收集 #5# 梦境精灵情报 |q 78043/1 |goto 61.19,45.13
step
label "Collect_Bloodied_Armor_Scraps"
在该区域击杀敌人
collect 20 Bloodied Armor Scrap##209875 |q 78042/1 |goto 61.60,42.48
step
talk Q'onzu##210585
|tip 漂浮岛屿高处。
告诉它“我找到了这束火焰花粉和与火焰德鲁伊的研究笔记。”
观察对话
展示Q'onzu的花粉和研究笔记 |q 77788/2 |goto 65.83,37.81
step
观察对话
talk Q'onzu##210585
|tip 漂浮岛屿高处。
turnin Ashphodel Research Notes##77788 |goto 65.83,37.81
turnin Q'onzu's Quandary##78043 |goto 65.83,37.81
step
talk Aviana##210587
|tip 漂浮岛屿高处。
turnin Aviana's Assessment##78042 |goto 65.84,37.68
accept Uproot the Cause##78045 |goto 65.84,37.68
step
talk Q'onzu##210585
|tip 漂浮岛屿高处。
accept Appalling Pollen##78044 |goto 65.84,37.80
step
use the Treacherous Research Notes##210951
消耗声望令牌 |complete itemcount(210951) == 0
stickystart "Collect_Uprooted_Ashphodel"
step
use Q'onzu's Vision Charm##210176
使用 Q'onzu 的愿景魅力 |q 78044/1 |goto 57.68,37.03
step
use Q'onzu's Vision Charm##210176
|tip 使用此物品来揭示附近的火焰花粉兽。
|tip 它们将发出红光。
击杀#10#灰烬花兽 |q 78044/2 |goto 57.68,37.03
step
label "Collect_Uprooted_Ashphodel"
click Burning Ashphodel##410244+
|tip 它们看起来像是这个区域地面上的大型燃烧花朵。
collect 8 Uprooted Ashphodel##210136 |q 78045/1 |goto 57.68,37.03
step
talk Q'onzu##210585
turnin Appalling Pollen##78044 |goto 65.83,37.80
step
talk Aviana##210587
turnin Uproot the Cause##78045 |goto 65.83,37.68
accept Overseer Oversight##78046 |goto 65.83,37.68
step
kill Overseer Chardryn##210912 |q 78046/1 |goto 62.77,38.83
|tip 他在营地里四处游荡。
step
talk Aviana##210587
|tip 漂浮岛屿高处。
turnin Overseer Oversight##78046 |goto 65.83,37.68
step
use the Charred Staff of the Overseer##211369
消耗声望令牌 |complete itemcount(211369) == 0
step
talk Shandris Feathermoon##209083
turnin A Call to Aid##77662 |goto 49.60,46.16
accept Smother the Flames##77739 |goto 49.60,46.16
step
kill Sister Fae'da##210640
collect 1 Bear Spirit Stone##209430 |q 77739/3 |goto 49.29,43.93
step
kill Sister Eydlin##210643
collect 1 Wolf Spirit Stone##209428 |q 77739/1 |goto 49.12,42.86
step
kill Sister Jodnar##210641
collect 1 Leaf Spirit Stone##208770 |q 77739/2 |goto 50.61,43.54
step
kill Sister Sylasta##210642
collect 1 Moon Spirit Stone##209429 |q 77739/4 |goto 51.29,44.10
step
_Next to you:_
talk Shandris Feathermoon##209677
turnin Smother the Flames##77739 |goto 51.29,44.10
accept One Last Step##77664 |goto 51.29,44.10
step
kill Raelas Firewind##209152 |q 77664/1 |goto 49.88,42.71
step
talk Shandris Feathermoon##209799
turnin One Last Step##77664 |goto 55.23,42.36
step
use the Rune of the Fire Druids##210957
消耗声望令牌 |complete itemcount(210957) == 0
step
talk Lilian Voss##209082
accept Bound to You##77665 |goto 55.20,42.35
step
talk Shae'lune##209159
问她"你能帮我们净化这些石头吗？"
询问沙艾倫关于石头的事 |q 77665/1 |goto 55.19,42.22
step
talk Cyanthesa##209241
告诉她 "让我们开始仪式吧。"
让赛安莎净化石头 |q 77665/2 |goto 51.58,42.13
step
click Vial of Moonwell Water
取回月神泉水的瓶子 |q 77665/3 |goto 51.69,42.17
step
extraaction Vial of Moonwell Water##421612
观察对话
释放第一灵魂 |q 77665/4 |goto 51.65,42.15
step
extraaction Vial of Moonwell Water##422282
观察对话
释放第二灵魂 |q 77665/5 |goto 51.63,42.22
step
extraaction Vial of Moonwell Water##422298
观察对话
释放第三个灵魂 |q 77665/6 |goto 51.56,42.25
step
kill Angered Dream Spirit##210454 |q 77665/7 |goto 51.57,42.25
step
extraaction Vial of  Moonwell Water##422314
观察对话
释放第四灵魂 |q 77665/8 |goto 51.53,42.19
step
talk Lilian Voss##209328
turnin Bound to You##77665 |goto 55.26,42.27
accept Under the Surface##77673 |goto 55.26,42.27
step
click Shandris's Mission Journal
寻找线索 |q 77673/1 |goto 55.40,42.10
step
talk Keeper Sillas##209161
问他“你见过香迪瑞丝吗？”
观察对话
询问守护者希拉斯是否见过香德莉丝 |q 77673/2 |goto 55.22,42.20
step
click Hasty Tracks
寻找更多线索 |q 77673/3 |goto 56.25,45.19
step
click Confusing Tracks
追踪痕迹 |q 77673/4 |goto 53.96,47.15
step
click Heavy Tracks
寻找更多踪迹 |q 77673/5 |goto 51.89,46.60
step
进入洞穴 |goto 50.58,47.51 < 10 |walk
talk Lilian Voss##209323
|tip 她跑到洞穴内部的这个地点。
turnin Under the Surface##77673 |goto 50.29,47.96
accept Wounds of the Past##77674 |goto 50.29,47.96
step
talk Shandris Feathermoon##209287
|tip 洞内探险
告诉她“和我们一起走。我们会在营地解释。”
观察对话
与香迪莉斯对话 |q 77674/1 |goto 50.19,48.20
step
kill Anguished Dream Spirit##210304 |q 77674/2 |goto 50.20,48.18
|tip 洞内探险
step
talk Lilian Voss##209328
turnin Wounds of the Past##77674 |goto 55.26,42.27
accept A Better Future, Together##77675 |goto 55.26,42.27
step
talk Shae'lune##209159
告诉她“我已准备好。”
与沙尔露恩谈论仪式 |q 77675/1 |goto 55.19,42.22
stickystart "Collect_Somnium_Bark"
step
click Sleeping Glory+
|tip 它们看起来像这个区域地面上小的花朵堆。
collect 5 Sleeping Glory##209051 |q 77675/3 |goto 56.37,45.47
step
label "Collect_Somnium_Bark"
click Somnium Bark+
|tip 它们看起来像这个区域周围地上的小木棍。
collect 2 Somnium Bark##209050 |q 77675/2 |goto 56.37,45.47
step
click Moon Water Ritual Bowl
在月水碗中混合材料 |q 77675/4 |goto 55.16,42.24
step
talk Shandris Feathermoon##209324
告诉她“来，试试这个治疗药水。”
观察对话
帮助香德瑞斯喝下解药 |q 77675/5 |goto 55.23,42.25
step
talk Lilian Voss##209328
turnin A Better Future, Together##77675 |goto 55.26,42.27
step
use the Drops of Moon Water##211366
消耗声望令牌 |complete itemcount(211366) == 0
step
talk Merithra##206896
turnin The Ember Still Smolders##76337 |goto 50.80,62.88
accept The Bloom Begins##76384 |goto 50.80,62.88
|tip 这个任务可能还不可用。
step
use the Tears of the Eye##210847
消耗声望令牌 |complete itemcount(210847) == 0
step
talk Merithra##206896
问她“播放电影”你能告诉我关于花开的事吗？
与梅里萨交谈 |q 76384/1 |goto 50.80,62.88
step
talk Merithra##206896
turnin The Bloom Begins##76384 |goto 50.80,62.88
step
talk Alexstrasza the Life-Binder##208503
accept Forward Unto Fire##76416 |goto 50.75,62.83
step
talk Alexstrasza the Life-Binder##208550
turnin Forward Unto Fire##76416 |goto 38.89,39.13
step
talk Vyranoth##208553
accept A Clash of Ice and Fire##76386 |goto 38.87,39.18
step
talk Merithra##208551
accept Hazardous Horticulture##76385 |goto 38.96,39.13
stickystart "Plant_Dream_Seeds"
stickystart "Slay_Wildfire_Forces"
step
use Frozenheart's Wrath##208544
|tip 把它用在卡尔德拉莫尔身上。
kill 1 Calderamor##207136 |q 76386/2 |goto 35.54,40.27
step
use Frozenheart's Wrath##208544
kill 1 Ignarion##209360 |q 76386/3 |goto 33.44,41.00
step
label "Plant_Dream_Seeds"
click Dream Seed Dirt Pile+
|tip 它们看起来像这个区域地面上的大土堆。
植物 #6# 梦想种子 |q 76385/1 |goto 36.07,39.39
step
label "Slay_Wildfire_Forces"
在该区域击杀敌人
击杀#15#野火力量 |q 76386/4 |goto 35.62,39.76
step
talk Vyranoth##208553
turnin A Clash of Ice and Fire##76386 |goto 38.84,39.17
step
talk Merithra##208551
turnin Hazardous Horticulture##76385 |goto 38.63,39.16
step
talk Tyrande Whisperwind##208552
accept Defense of the Ancients##76387 |goto 38.66,39.15
step
talk Alexstrasza the Life-Binder##208550
accept A Scrap of Hope##76436 |goto 38.76,39.19
stickystart "Collect_Scraps_of_Parchment"
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 39.26,36.10 |count 1
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 39.44,35.10 |count 2
step
click Restraining Harpoon
协助树根博士 |q 76387/1 |goto 38.67,35.00 |count 3
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 39.02,34.63 |count 1
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 38.78,34.73 |count 2
step
click Restraining Harpoon
|tip 悬崖上
协助暗影树 |q 76387/4 |goto 38.63,34.42 |count 3
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 39.63,32.83 |count 1
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 38.81,31.83 |count 2
step
click Restraining Harpoon
协助老枝 |q 76387/2 |goto 39.46,31.42 |count 3
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.09,33.76 |count 1
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.59,33.90 |count 2
step
click Restraining Harpoon
协助云歌 |q 76387/3 |goto 41.01,34.99 |count 3
step
label "Collect_Scraps_of_Parchment"
在该区域击杀敌人
collect 8 Scrap of Parchment##210023 |q 76436/1 |goto 38.82,36.24
step
talk Tyrande Whisperwind##208552
turnin Defense of the Ancients##76387 |goto 38.81,38.90
step
talk Alexstrasza the Life-Binder##208550
turnin A Scrap of Hope##76436 |goto 38.60,39.03
accept Fighting Fire With Fire##76388 |goto 38.60,39.03
step
click Skyfire Turret
摧毁第一座北方火焰炮台 |q 76388/1 |goto 26.76,27.54 |count 1
step
click Skyfire Turret
摧毁第二座北方天空火炮 |q 76388/1 |goto 26.47,28.94 |count 2
step
click Skyfire Turret
摧毁第三座北方天火炮塔 |q 76388/1 |goto 25.56,27.73 |count 3
step
extraaction Call Alexstrasza##420864
标记第一火焰守卫 |q 76388/2 |goto 25.92,27.52
step
click Skyfire Turret
摧毁第一座西方天空火炮 |q 76388/3 |goto 25.14,31.90 |count 1
step
click Skyfire Turret
摧毁第二座西方天火炮塔 |q 76388/3 |goto 24.52,31.60 |count 2
step
click Skyfire Turret
摧毁第三座西方天空火炮 |q 76388/3 |goto 23.71,32.50 |count 3
step
extraaction Call Alexstrasza##420864
标记第二个火焰守卫 |q 76388/4 |goto 24.15,32.30
step
click Skyfire Turret
摧毁第一座南方天火炮台 |q 76388/5 |goto 27.61,35.18 |count 1
step
click Skyfire Turret
摧毁第二个南方烈焰炮台 |q 76388/5 |goto 28.26,34.14 |count 2
step
click Skyfire Turret
摧毁第三个南方天火炮台 |q 76388/5 |goto 29.04,35.14 |count 3
step
extraaction Call Alexstrasza##420864
标记最终火焰守卫 |q 76388/6 |goto 28.46,34.88
step
talk Tyrande Whisperwind##208568
turnin Fighting Fire With Fire##76388 |goto 34.97,35.34
accept The Age of Mortals##76389 |goto 34.97,35.34
step
talk Merithra##208567
accept Aerial Supremacy##76398 |goto 34.99,35.43
step
打击 #15# 原型龙 |q 76398/2 |goto 30.76,31.16
|tip 在你的龙骑坐骑上飞越空中的原始龙。
|tip 绿色魔 orb 将恢复 1 点活力。
step
use the Horn of Cenarius##208752
|tip 在这一地区对友好的NPC使用它。
在该区域击杀敌人
赋能英雄，击败敌人于烈焰之地 |q 76389/1 |goto 31.80,31.11
step
talk Tyrande Whisperwind##208574
|tip 上去平台上。
turnin The Age of Mortals##76389 |goto 35.09,33.43
step
talk Merithra##208573
|tip 上去平台上。
turnin Aerial Supremacy##76398 |goto 35.07,33.52
step
talk Alexstrasza the Life-Binder##208572
|tip 上去平台上。
accept Echo of the Firelands##76401 |goto 35.04,33.59
step
kill 1 Prophet of the Flame##207315 |q 76401/1 |goto 32.47,33.53
|tip 离开地面目标区域。
step
talk Alexstrasza the Life-Binder##206921
|tip 你将很快被传送。
turnin Echo of the Firelands##76401 |goto 27.94,31.15
accept Amirdrassil, the Dream's Hope: Fyrakk##76402 |goto 27.94,31.15
step
talk Eran'nda##211240
|tip 帐篷内。
accept Great Crates!##78427 |goto 52.51,62.47
step
talk Vashonir##211236
|tip 帐篷内。
|tip 查看各种货物，如果你已经有材料，使用“包裹”按钮制作一个。
|tip 如果没有，浏览列表并选择一个可以用购买或采集的材料制作的物品。
|tip 使用可用的指南来获取您货物所需的材料。
打包货物运输 |q 78427/1 |goto 52.51,62.54
step
talk Eran'nda##211240
|tip 帐篷内。
turnin Great Crates!##78427 |goto 52.51,62.47
accept Crate of the Art##78428 |goto 52.51,62.47
step
talk Vashonir##211236
|tip 帐篷内。
|tip 查看各种货物，如果你已经有材料，使用“包裹”按钮制作一个。
|tip 如果没有，浏览列表并选择一个可以用购买或采集的材料制作的物品。
|tip 使用可用的攻略来采集你的运输所需的材料。
包裹 #5# 商品运输 |q 78428/1 |goto 52.51,62.54
step
talk Eran'nda##211240
turnin Crate of the Art##78428 |goto 52.51,62.47
step
贡献梦种给翡翠宝藏 |q 78206/1 |goto 49.17,48.07
|tip 翡翠悬赏需要你种植一个梦种并照料它 3 分钟。
|tip 你可以通过在翡翠梦境中完成活动来获得各种品质的梦之种。
|tip 在翡翠宝藏节点附近使用梦境种子以开始事件。
|tip 点击事件周围的各类物品并击杀事件生物，以提高你的奖励质量。
[46.38,40.48]
[40.67,24.78]
[40.03,52.69]
[38.45,59.20]
[42.64,74.04]
[48.73,80.46]
[54.59,67.63]
[63.95,64.83]
[51.15,58.64]
[56.66,44.89]
[56.51,37.67]
[63.50,47.10]
step
等待翡翠狂潮的开始 |complete vignette(5859) or completedq(78206)
|tip 翡翠狂热事件在地图上显示为交叉的剑。
|tip 激活后，你可以前往事件区域并击杀怪物以完成任务。
step
完成翡翠狂热以获得翡翠露珠 |q 78206/2 |goto 63.77,64.89
|tip 飞往最近的翡翠狂怒，击杀生物直到任务完成。
|tip 这些在梦境绿洲的各个区域产生。
step
点击完成任务框
turnin Emerald Bounty##78206 |goto 63.77,64.89
step
talk Wrathion##207350
accept A Dragon in Hand is Worth Two in the Roost##76460 |goto 50.88,62.81
step
talk Wrathion##207350
告诉他“告诉我关于灵翼的事。”
与怒焰之翼交谈关于虚空之翼 |q 76460/1 |goto 50.88,62.81
step
talk Wrathion##207350
turnin A Dragon in Hand is Worth Two in the Roost##76460 |goto 50.88,62.81
accept Draconic Diplomacy##76461 |goto 50.88,62.81
step
在瓦尔德拉肯寻找摩登纳库 |q 76461/1 |goto Thaldraszus/0 33.70,62.09
step
talk Wrathion##207350
问他你要给黑翼要塞什么？
观察对话
与怒火之子交谈 |q 76461/2 |goto 33.70,62.09
step
talk Mordenaku##207352
告诉他“塔尔德拉苏斯的山脉将是绝佳的栖息地。”
与莫登卡库交谈 |q 76461/3 |goto 33.68,62.03
step
talk Wrathion##207350
turnin Draconic Diplomacy##76461 |goto 33.70,62.09
accept A Dragon's Eye View##77195 |goto 33.70,62.09
step
寻找潜在栖息地 |q 77195/1 |goto 61.22,73.18
|tip 高高在隐秘的悬崖上
step
talk Wrathion##207350
|tip 高高在隐秘的悬崖上
turnin A Dragon's Eye View##77195 |goto 61.22,73.18
step
talk Vyranoth##207351
|tip 高高在隐秘的悬崖上
accept Cavern Cleaning##76462 |goto 61.21,73.22
stickystart "Freeze_Cave_Scuttlers"
stickystart "Destroy_Tarantula_Eggs"
step
kill Hecutta##207300 |q 76462/2 |goto 62.15,72.88
|tip 山顶洞穴内。
step
label "Freeze_Cave_Scuttlers"
kill Cave Scuttler##207298+
|tip 走过去将他们冰冻在山上高处的洞穴里。
冻结 #100# 洞穴爬虫 |q 76462/1 |goto 62.17,73.57
step
label "Destroy_Tarantula_Eggs"
click Tarantula Egg+
|tip 它们看起来像山上洞穴里高处的大团白色卵子。
摧毁 #5# Tarantula 卵 |q 76462/3 |goto 62.17,73.57
step
talk Vyranoth##207351
|tip 高高在隐秘的悬崖上
turnin Cavern Cleaning##76462 |goto 61.21,73.22
step
talk Wrathion##207350
|tip 高高在隐秘的悬崖上
accept A Whelping Hand##77197 |goto 61.22,73.18
step
talk Mother Elion##185904
turnin A Whelping Hand##77197 |goto The Waking Shores/0 61.60,68.71
accept Delectable Delicacies##76463 |goto 61.60,68.71
step
kill Juicy Beetle##207567+
collect 10 Juicy Beetle Bits##208060 |q 76463/1 |goto 56.80,69.97
step
talk Mother Elion##185904
turnin Delectable Delicacies##76463 |goto 61.60,68.71
step
talk Mordenaku##207352
accept Home in Time for Tea##77198 |goto 61.54,68.75
step
退休去烤羊驼酒吧 |q 77198/1 |goto Valdrakken/0 48.43,49.64
step
talk Mordenaku##207352
|tip 在建筑物内。
turnin Home in Time for Tea##77198 |goto 46.93,47.90
step
talk Vyranoth##207351
|tip 在建筑物内。
accept The Thorignir##76464 |goto 46.72,47.77
step
click Portal to Stormheim
|tip 在建筑物内。
前往烤肉羊酒馆的传送门 |q 76464/1 |goto 46.64,47.21
step
talk Thrymjaris##207570
问问它“你为什么不去龙岛？”
与瑟瑞姆亚里斯交谈 |q 76464/2 |goto Stormheim/0 50.86,83.94
step
talk Vyranoth##207351
告诉她“如果你确定…”
与维拉诺斯交谈 |q 76464/3 |goto 51.09,83.85
step
talk Vyranoth##207351
turnin The Thorignir##76464 |goto 51.09,83.85
accept Dragon Keeping##76465 |goto 51.09,83.85
step
talk Vyranoth##207351
告诉她：“我已经准备好出发了。”
与维兰诺斯交谈前往荣耀圣殿 |q 76465/1 |goto 51.09,83.85
step
进入场景 |scenariostart |q 76465
step
kill Hymdall##206644 |scenariogoal 1/60773 |goto Halls of Valor D/0 47.63,44.51
step
kill Valarjar Shieldmaiden##207027+
|tip 三个波次的敌人会在内部攻击。
击败埃伊尔的女武神 |scenariogoal 2/60969 |goto 47.80,67.89
step
进入奥丁之竞技场 |scenariogoal 3/63440 |goto Halls of Valor D/1 51.40,80.21
step
extraaction Confront Odyn##419454
观察对话
kill Odyn##207287
|tip 离开地面目标区域。
|tip 与奥丁战斗，直到你被传送。
对抗奥丁 |scenariogoal 4/61202 |goto 51.50,88.64
step
talk Vyranoth##208506
turnin Dragon Keeping##76465 |goto The Emerald Dream/0 50.81,62.73
step
击杀 Fyrakk |q 76402/1 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
|tip 这是“阿美德拉希尔，梦之希望”Raid的最终BOSS。
step
talk Alexstrasza the Life-Binder##206921
turnin Amirdrassil, the Dream's Hope: Fyrakk##76402 |goto The Emerald Dream/0 50.75,62.83
step
talk Tyrande Whisperwind##211634
accept A Blossom Witnessed##77780 |goto 27.58,31.45
step
talk Tyrande Whisperwind##211634
见证花海
与泰兰德交谈 |q 77780/1 |goto 27.58,31.45
step
talk Merithra of the Dream##206397
turnin A Blossom Witnessed##77780 |goto Ohn'ahran Plains/0 14.89,55.88
accept A Changed Land##76276 |goto 14.89,55.88
step
talk Khanam Matra Sarest##206455
|tip 在石桥上。
问她“大家还好吧？”
拜访人马族 |q 76276/1 |goto 34.27,53.07
step
参观目录管理者 |q 76276/2 |goto 21.82,62.26
step
click Washed-Up Pack
collect 1 Cataloger's Film##209806 |q 76276/3 |goto 21.72,61.80
step
talk Cataloger Wulferd##206468
告诉他“这是影片。”
将电影归还给沃尔夫德 |q 76276/4 |goto 21.71,62.31
step
talk Gnoll Mon-Ark##206428
问它“大家还好么？”
访问犬人摩尔阿克 |q 76276/5 |goto 28.64,69.95
step
talk Radza Thunderclaw##206438
问它“大家还好么？”
拜访长毛熊人 |q 76276/6 |goto 10.37,85.69
step
clicknpc Scaps##206418
访问塔斯卡尔 |q 76276/7 |goto 6.61,84.69
step
talk Merithra of the Dream##206397
turnin A Changed Land##76276 |goto 14.88,55.89
accept Auspicious Gathering##77329 |goto 14.88,55.89
step
talk Tyrande Whisperwind##208537
turnin Auspicious Gathering##77329 |goto Amirdrassil/0 50.82,61.47
accept Offerings for the Well##77200 |goto 50.82,61.47
step
talk Moon Priestess Lasara##208906
谢谢她的馈赠。
与月亮祭司拉萨拉交谈 |q 77200/4 |goto 50.82,61.28
step
talk Cerellean Whiteclaw##208900
告诉他“感谢你的赐福。”
与塞雷兰·白爪交谈 |q 77200/2 |goto 50.96,61.07
step
talk Rensar Greathoof##208907
告诉他“感谢你的赐福。”
与瑞萨尔·大角交谈 |q 77200/1 |goto 51.06,61.26
step
talk Delaryn Summermoon##208905
谢谢她的馈赠。
与德拉瑞恩·夏月交谈 |q 77200/3 |goto 51.28,61.96
step
talk Tyrande Whisperwind##208537
turnin Offerings for the Well##77200 |goto 50.82,61.47
accept New Moon##76280 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
与泰兰德交谈 |q 76280/1 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
turnin New Moon##76280 |goto 50.82,61.47
accept Something Worth Celebrating##76281 |goto 50.82,61.47
step
talk Tyrande Whisperwind##208537
告诉她“出发吧。”
与泰兰德交谈以加入队伍 |q 76281/1 |goto 50.82,61.47
step
click Vibrant Feast
接取首个餐点订单 |q 76281/2 |goto 52.40,61.65
step
click Table+
click Vibrant Feast+
|tip 点击周围高亮的桌子。
|tip 你需要在每三张桌子之间访问一次丰盛盛宴。
服务#12#桌子 |q 76281/3 |goto 53.33,60.73
step
talk Merithra of the Dream##206849
turnin Something Worth Celebrating##76281 |goto 54.25,57.88
accept A Different Enthusiasm##77781 |goto 54.25,57.88
step
talk Kalecgos##209042
accept A Disquieting Feeling##76282 |goto 54.32,57.88
stickystart "Kill_Spriggan_Pranksters"
step
talk Kritha##206941
告诉他“我想给卡德加来一杯酒，谢谢。”
点一杯饮料 |q 76282/1 |goto 52.86,56.51
|tip 选择任何饮品。
step
talk Archmage Khadgar##209041
告诉他“我有一杯来自卡雷苟斯的饮品。”
将饮料送给卡德罗斯 |q 76282/2 |goto 54.03,61.97
step
label "Kill_Spriggan_Pranksters"
kill 6 Spriggan Prankster##212007 |q 77781/1 |goto 54.57,59.24
|tip 点击周围区域内高亮的物体和NPC以揭示恶作剧者。
step
talk Kalecgos##209042
turnin A Disquieting Feeling##76282 |goto 54.32,57.88
step
talk Merithra of the Dream##206849
turnin A Different Enthusiasm##77781 |goto 54.25,57.88
accept Andu-falah-dor##76283 |goto 54.25,57.88
step
talk Merithra of the Dream##206849
告诉她“我已经准备好离开派对了。”
与梅瑞莎对话以离开队伍 |q 76283/1 |goto 54.25,57.88
step
talk Merithra of the Dream##209051
在月泉与梅瑞莎交谈 |q 76283/2 |goto 51.84,61.28
step
talk Alexstrasza##208763
turnin Andu-falah-dor##76283 |goto 50.88,61.67
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Wrathion's Questline",{
author="support@zygorguides.com",
description="This guide will help you complete Wrathion's questline from The Emerald Dream.",
startlevel=70,
patch='100200',
},[[
leechsteps "Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames"
step
accept Call of the Dream##76317 |goto Valdrakken/0 53.20,50.62
|tip 你将自动接受这个任务。
step
talk Merithra##187590
turnin Call of the Dream##76317 |goto Ohn'ahran Plains/0 18.66,51.77
accept Emerald Welcome##76318 |goto 18.66,51.77
step
穿越翡翠梦境 |q 76318/1 |goto 18.44,52.41
step
talk Merithra##206425
问她“你希望我看到什么？”
与梅里萨交谈 |q 76318/2 |goto The Emerald Dream/0 69.42,54.04 |or
_Or_
点击这里以跳过前进 |confirm |next "Begin_Wrathion_Questline" |or
|tip 只有在你已在其他角色上完成翡翠梦境战役的第一章后，才可以使用此选项。
|tip 你可以跳过第一章，直接去见瓦里安。
step
talk Merithra##206425
turnin Emerald Welcome##76318 |goto 69.42,54.04
accept Feast or Flaming##76319 |goto 69.42,54.04
step
talk Athera##208286
home Verdant Landing |goto The Emerald Dream/0 69.53,53.24
step
talk Occarim##208280
fpath Verdant Landing |goto 68.81,54.81
step
吃 #12# 火焰 |q 76319/2 |goto 66.14,55.73
|tip 在你的龙骑坐骑上飞越空中的光环。
|tip 绿色魔珠将恢复活力。
step
talk Cenarius##206510
turnin Feast or Flaming##76319 |goto 64.30,58.23
accept Wild Gods in Our Midst##76320 |goto 64.30,58.23
step
talk Goldrinn##206527
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求戈尔丁的援助 |q 76320/1 |goto 62.63,66.23
step
talk Q'onzu##206530
告诉它：“梅瑞莎请求你帮助保护世界之树。”
请求Q'onzu的援助 |q 76320/2 |goto 65.65,70.16
step
talk Elder Cassaphine##206571
|tip 洞内探险
告诉她“梅瑞萨请求你帮助守护世界之树。”
请求卡萨芬长者的援助 |q 76320/3 |goto Barrows of Reverie/0 66.62,45.16
step
talk Cenarius##206583
turnin Wild Gods in Our Midst##76320 |goto The Emerald Dream/0 63.28,71.50
accept Burning Assault##76321 |goto 63.28,71.50
accept The Face of Our Enemies##76322 |goto 63.28,71.50
stickystart "Slay_Fyrakk's_Forces"
step
kill Apostle Fenarelle##206628 |q 76322/2 |goto 61.42,68.74
step
kill Stormbrand Ko'mal##206684 |q 76322/1 |goto 64.35,67.95
step
label "Slay_Fyrakk's_Forces"
在该区域击杀敌人
击杀菲拉克的部队 |q 76321/1 |goto 62.89,68.30
step
talk Merithra##206688
turnin Burning Assault##76321 |goto 62.78,68.63
turnin The Face of Our Enemies##76322 |goto 62.78,68.63
accept The Cruel##77818 |goto 62.78,68.63
step
clicknpc Flame Portal
|tip 离开地面上的大旋涡区域。
帮助梅里萨关闭火焰传送门 |q 77818/1 |goto 62.67,68.42
step
clicknpc Dream Portal##206703
进入梦境传送门 |q 77818/2 |goto 62.91,68.98
step
talk Merithra##206806
turnin The Cruel##77818 |goto 61.48,60.39
accept Amirdrassil##76323 |goto 61.48,60.39
step
talk Merithra##206809
|tip 她最终会飞往这个地点。
turnin Amirdrassil##76323 |goto 53.83,63.93
accept Lost to the Flame##76324 |goto 53.83,63.93
step
kill Elder Cassaphine##206818 |q 76324/1 |goto 50.60,71.86
step
talk Merithra##206979
turnin Lost to the Flame##76324 |goto 50.96,69.99
accept Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
step
talk Merithra##206979
告诉她“我与你同在。”
与梅里萨交谈 |q 76325/1 |goto 50.96,69.99
step
talk Merithra##206979
turnin Between Fyrakk and a Hard Place##76325 |goto 50.96,69.99
accept Home in the Dream##76326 |goto 50.96,69.99
step
talk Merithra##206896
turnin Home in the Dream##76326 |goto 50.80,62.88
accept A Multi-Front Battle##77283 |goto 50.80,62.88
step
talk Leora##207636
fpath Central Encampment |goto 51.09,62.35 |q 77283
step
label "Begin_Wrathion_Questline"
talk Wrathion##207350
accept A Dragon in Hand is Worth Two in the Roost##76460 |goto The Emerald Dream/0 50.88,62.81
step
talk Wrathion##207350
告诉他“告诉我关于灵翼的事。”
与怒焰之翼交谈关于虚空之翼 |q 76460/1 |goto 50.88,62.81
step
talk Wrathion##207350
turnin A Dragon in Hand is Worth Two in the Roost##76460 |goto 50.88,62.81
accept Draconic Diplomacy##76461 |goto 50.88,62.81
step
在瓦尔德拉肯寻找摩登纳库 |q 76461/1 |goto Thaldraszus/0 33.70,62.09
step
talk Wrathion##207350
问他你要给黑翼要塞什么？
观察对话
与怒火之子交谈 |q 76461/2 |goto 33.70,62.09
step
talk Mordenaku##207352
告诉他“塔尔德拉苏斯的山脉将是绝佳的栖息地。”
与莫登卡库交谈 |q 76461/3 |goto 33.68,62.03
step
talk Wrathion##207350
turnin Draconic Diplomacy##76461 |goto 33.70,62.09
accept A Dragon's Eye View##77195 |goto 33.70,62.09
step
寻找潜在栖息地 |q 77195/1 |goto 61.22,73.18
|tip 高高在隐秘的悬崖上
step
talk Wrathion##207350
|tip 高高在隐秘的悬崖上
turnin A Dragon's Eye View##77195 |goto 61.22,73.18
step
talk Vyranoth##207351
|tip 高高在隐秘的悬崖上
accept Cavern Cleaning##76462 |goto 61.21,73.22
stickystart "Freeze_Cave_Scuttlers"
stickystart "Destroy_Tarantula_Eggs"
step
kill Hecutta##207300 |q 76462/2 |goto 62.15,72.88
|tip 山顶洞穴内。
step
label "Freeze_Cave_Scuttlers"
kill Cave Scuttler##207298+
|tip 走过去将他们冰冻在山上高处的洞穴里。
冻结 #100# 洞穴爬虫 |q 76462/1 |goto 62.17,73.57
step
label "Destroy_Tarantula_Eggs"
click Tarantula Egg+
|tip 它们看起来像山上洞穴里高处的大团白色卵子。
摧毁 #5# Tarantula 卵 |q 76462/3 |goto 62.17,73.57
step
talk Vyranoth##207351
|tip 高高在隐秘的悬崖上
turnin Cavern Cleaning##76462 |goto 61.21,73.22
step
talk Wrathion##207350
|tip 高高在隐秘的悬崖上
accept A Whelping Hand##77197 |goto 61.22,73.18
step
talk Mother Elion##185904
turnin A Whelping Hand##77197 |goto The Waking Shores/0 61.60,68.71
accept Delectable Delicacies##76463 |goto 61.60,68.71
step
kill Juicy Beetle##207567+
collect 10 Juicy Beetle Bits##208060 |q 76463/1 |goto 56.80,69.97
step
talk Mother Elion##185904
turnin Delectable Delicacies##76463 |goto 61.60,68.71
step
talk Mordenaku##207352
accept Home in Time for Tea##77198 |goto 61.54,68.75
step
退休去烤羊驼酒吧 |q 77198/1 |goto Valdrakken/0 48.43,49.64
step
talk Mordenaku##207352
|tip 在建筑物内。
turnin Home in Time for Tea##77198 |goto 46.93,47.90
step
talk Vyranoth##207351
|tip 在建筑物内。
accept The Thorignir##76464 |goto 46.72,47.77
step
click Portal to Stormheim
|tip 在建筑物内。
前往烤肉羊酒馆的传送门 |q 76464/1 |goto 46.64,47.21
step
talk Thrymjaris##207570
问问它“你为什么不去龙岛？”
与瑟瑞姆亚里斯交谈 |q 76464/2 |goto Stormheim/0 50.86,83.94
step
talk Vyranoth##207351
告诉她“如果你确定…”
与维拉诺斯交谈 |q 76464/3 |goto 51.09,83.85
step
talk Vyranoth##207351
turnin The Thorignir##76464 |goto 51.09,83.85
accept Dragon Keeping##76465 |goto 51.09,83.85
step
talk Vyranoth##207351
告诉她：“我已经准备好出发了。”
与维兰诺斯交谈前往荣耀大厅 |q 76465/1 |goto 51.09,83.85
step
进入场景 |scenariostart |q 76465
step
kill Hymdall##206644 |scenariogoal 1/60773 |goto Halls of Valor D/0 47.63,44.51
step
kill Valarjar Shieldmaiden##207027+
|tip 三个波次的敌人会在内部攻击。
击败埃伊尔的女武神 |scenariogoal 2/60969 |goto 47.80,67.89
step
进入奥丁之竞技场 |scenariogoal 3/63440 |goto Halls of Valor D/1 51.40,80.21
step
extraaction Confront Odyn##419454
观察对话
kill Odyn##207287
|tip 离开地面目标区域。
|tip 与奥丁战斗，直到你被传送。
对抗奥丁 |scenariogoal 4/61202 |goto 51.50,88.64
step
talk Vyranoth##208506
turnin Dragon Keeping##76465 |goto The Emerald Dream/0 50.81,62.73
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Tyr's Return",{
author="support@zygorguides.com",
description="This guide will help you complete the Tyr's Return questline continuing from Tyr's Fall.",
startlevel=70,
patch='100200',
},[[
leechsteps "Leveling Guides\\Dragonflight (10-70)\\Tyr's Fall"
step
talk Valunei##208703
accept Data Recovery##77339 |goto Valdrakken/0 53.90,61.11
step
进入建筑物 |goto Thaldraszus/0 59.86,63.78 < 10 |walk
talk Travard##208701
|tip 在建筑物内。
turnin Data Recovery##77339 |goto 60.60,63.64
accept To Tyrhold! For Tyr!##77377 |goto 60.60,63.64
step
talk Eternus##208832
|tip 在中环内部。
turnin To Tyrhold! For Tyr!##77377 |goto 60.43,59.03
accept Infiltrating the Nighthold##77340 |goto 60.43,59.03
step
click Portal to Nighthold
传送到夜之堡 |q 77340/1 |goto 60.49,58.93
step
开始剧情任务 |scenariostart |q 77340
step
talk Travard##208707
告诉他我已准备好。
告诉特拉瓦德你已准备好 |scenariogoal 1/61498 |goto The Nighthold T/0 69.14,28.88 |q 77340
step
在该区域击杀敌人
击败天文术士的守卫 |scenariogoal 2/61543 |goto 45.05,64.50 |q 77340
step
click Observatory Doors |goto 55.67,62.74 < 4 |walk
kill Senior Researcher Alydrus##208734 |scenariogoal 3/61876 |goto The Nighthold T/1 51.95,52.17 |q 77340
step
在该区域击杀敌人
击败楼梯上的卫兵 |scenariogoal 4/61880 |goto 53.35,45.13 |q 77340
step
kill Guardian Ordan##208727 |scenariogoal 5/61878 |goto 48.68,37.96 |q 77340
step
talk Travard##208707
|tip 他最终会跑到这个地点。
告诉他我已准备好。
告诉特拉瓦德你已准备好 |scenariogoal 6/61883 |goto 42.98,29.83 |q 77340
step
kill Elisande##208668
|tip 避免在地面上被标记的区域。
|tip 你最终会被传送走。
对决艾丽桑德 |scenariogoal 7/61893 |goto 34.15,17.77 |q 77340
step
talk Talthis##208705
告诉他我已准备好。
听取塔尔塞斯的计划 |scenariogoal 8/61894 |goto 42.58,27.99 |q 77340
step
kill Elisande##208668
|tip 避免在地面上被标记的区域。
|tip 你最终会被传送走。
对决艾丽桑德 |scenariogoal 9/61893 |goto 36.10,16.56 |q 77340
step
talk Nolaki##208706
问她“你的计划是什么，诺拉基？”
听取诺拉基的计划 |scenariogoal 10/61896 |goto 41.74,29.41 |q 77340
step
talk Valunei##208709
告诉她 "走吧！"
告诉瓦鲁奈你准备好了 |scenariogoal 11/61917 |goto 42.14,29.65 |q 77340
step
click Portal to Tyrhold
前往提尔霍德传送门 |scenariogoal 12/62716 |goto 42.66,27.99 |q 77340
step
talk Chromie##208835
|tip 在中环内部。
turnin Infiltrating the Nighthold##77340 |goto Thaldraszus/0 60.39,58.82
step
talk Nozdormu##208834
|tip 在中环内部。
accept Disc Delivery##77342 |goto 60.46,58.74
step
click Disc of Tyr
|tip 在中环内部。
放置光盘 |q 77342/1 |goto 60.53,58.74
step
观察对话
恢复提尔 |q 77342/2 |goto 60.53,58.74
step
talk Nozdormu##208834
|tip 在中环内部。
turnin Disc Delivery##77342 |goto 60.46,58.74
step
talk Alexstrasza the Life-Binder##208833
|tip 在中环内部。
accept A Tyrful Reunion##77343 |goto 60.48,58.69
step
观察对话
听提尔与众元素之灵的对话 |q 77343/1 |goto 60.48,58.80
step
talk Travard##208800
|tip 在中环内部。
turnin A Tyrful Reunion##77343 |goto 60.48,58.80
accept Time to Process##77344 |goto 60.48,58.80
step
talk Keeper Tyr##208796
|tip 在中环内部。
告诉他“提尔之警卫将很荣幸如果你能加入他们的指挥部。”
与提尔对话 |q 77344/1 |goto 60.63,58.74
step
进入建筑物 |goto 59.86,63.78 < 10 |walk
talk Travard##208839
|tip 在建筑物内。
告诉他“别客气，特拉瓦德。”
与特拉瓦德交谈 |q 77344/2 |goto 60.84,63.77
step
talk Travard##208839
|tip 在建筑物内。
turnin Time to Process##77344 |goto 60.84,63.77
step
collect Letter from Valunei##208826 |q 77341 |future
|tip 你将在你的邮箱中找到这个。
step
use the Letter from Valunei##208826
accept Logotyrapy##77341
step
进入建筑物 |goto Thaldraszus/0 59.88,63.78 < 10 |walk
talk Keeper Tyr##209890
|tip 在建筑物内。
问他“出了什么问题，泰尔？”
与提尔对话 |q 77341/1 |goto 61.00,63.78
step
talk Travard##208839
turnin Logotyrapy##77341 |goto 60.84,63.77
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Seeing Red",{
author="support@zygorguides.com",
description="This guide will help you complete the Seeing Red questline.",
startlevel=70,
patch='100105',
},[[
step
talk Virtos##209790 |only if Alliance
accept Prophecy Stirs##77408 |goto Stormwind City/0 77.95,37.26 |only if Alliance
talk Knight-Lord Dranarus##209803 |only if Horde
accept Prophecy Stirs##77408 |goto Orgrimmar/1 72.03,44.55 |only if Horde
step
use Teleportation Crystal##208206
使用传送水晶 |q 77408/1 |goto Stormwind City/0 77.95,37.27 |only if Alliance
使用传送水晶 |q 77408/1 |goto Orgrimmar/1 72.03,44.55 |only if Horde
step
talk Prophet Velen##208815
turnin Prophecy Stirs##77408 |goto Vindicaar Scenario/1 43.20,24.94
accept Uncertainty##77409 |goto 43.20,24.94
step
talk Grand Artificer Romuul##208816
告诉他“请传送我到克鲁恩。”
请问罗穆尔将你传送到克鲁昆 |q 77409/1 |goto 42.08,23.84
step
click Lightforged Beacon
fpath Krokul Hovel |goto Krokuun/0 55.49,67.36
step
进入洞穴 |goto 55.45,68.31 < 7 |walk
talk Chieftain Hatuun##208830
问他"你想讨论什么？"
与哈图恩酋长交谈 |q 77409/2 |goto 53.75,68.11
step
观察对话
talk Chieftain Hatuun##208830
turnin Uncertainty##77409 |goto 53.74,68.10
accept Opening Wounds##77410 |goto 53.74,68.10
step
talk Arzal'kal##208831
你不需要解释自己。跳过对话，完成任务。
与阿扎尔卡尔交谈 |q 77410/1 |goto 53.79,68.22
step
观察对话
听阿扎尔'卡尔的指令 |q 77410/2 |goto 53.79,68.22
step
talk Prophet Velen##208837
turnin Opening Wounds##77410 |goto 53.61,68.28
step
talk Arzal'kal##208831
accept Contrition##77411 |goto 53.79,68.23
step
click Lightforged Beacon
fpath Destiny Point |goto Krokuun/0 62.70,49.10
step
talk Arzal'kal##208858
accept Severing Ties##77789 |goto 63.49,42.48
step
talk Arzal'kal##208858
告诉他我已准备就绪。
与阿尔扎尔卡尔重新集结 |q 77411/1 |goto 63.49,42.48
stickystart "Slay_Man'ari_Cultists"
step
click Sargerei Conduit
超载萨格雷传导器 |q 77789/2 |goto 66.54,37.98 |count 1
step
click Sargerei Conduit
超载萨格雷传导器 |q 77789/2 |goto 68.90,34.75 |count 2
step
click Sargerei Conduit
超载萨格雷传导器 |q 77789/2 |goto 70.25,34.97 |count 3
step
click Sargerei Conduit
超载萨格雷传导器 |q 77789/2 |goto 70.12,32.48 |count 4
step
click Sargerei Conduit
超载萨格雷传导器 |q 77789/2 |goto 72.30,34.88 |count 5
step
label "Slay_Man'ari_Cultists"
kill Man'ari Acolyte##208855+
kill Man'ari Sycophant##208856+
消灭#10#米奈希尔邪教徒 |q 77789/1 |goto 72.33,34.36
step
kill 1 Speaker Nalridun##208862 |q 77411/2 |goto 73.13,33.66
step
click Ancient Draenic Relic##405948
取回遗物 |q 77411/3 |goto 73.43,33.85
step
talk Arzal'kal
turnin Contrition##77411 |goto 73.27,33.56
turnin Severing Ties##77789 |goto 73.27,33.56
accept Proof and Promise##77412 |goto 73.27,33.56
step
寻找军团传送门 |q 77412/2 |goto 71.77,31.57
step
click Legion Teleporter
使用军团传送门 |q 77412/3 |goto 71.77,31.57
step
归返维伦 |q 77412/4 |goto 53.63,68.30
step
talk Prophet Velen##208893
turnin Proof and Promise##77412 |goto 53.63,68.30
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\The Reclaiming of Gilneas",{
author="support@zygorguides.com",
description="This guide will help you complete the Reclaiming of Gilneas questline.",
startlevel=70,
patch='100205',
},[[
step
talk Deathguard Elite##212916
|tip 在建筑物内。
accept Clandestine Movements##78597 |goto Valdrakken/0 56.13,39.41
|tip 你也可以在奥格瑞玛拾取这个。
|only if Horde
step
talk Calia Menethil##210965
|tip 在建筑物内。
在熔木村与莉莉安和卡莉亚会面 |q 78597/1 |goto Silverpine Forest/0 43.59,73.27
|only if Horde
step
talk Lilian Voss##210964
|tip 在建筑物内。
turnin Clandestine Movements##78597 |goto 43.66,73.28
|only if Horde
step
talk Calia Menethil##210965
|tip 在建筑物内。
accept To Gilneas##78178 |goto 43.59,73.27
|only if Horde
step
talk Princess Tess Greymane##210905
告诉她我已经准备好前往吉尔尼斯。
与泰莎交谈以前往吉尔尼斯 |q 78178/1 |goto 41.68,72.22
|only if Horde
step
观察对话
抵达吉尔尼斯 |q 78178/2
|only if Horde
step
talk Princess Tess Greymane##210905
问她 "你的计划是什么？"
|tip 这个选项将要求你观看NPC之间的对话。
_Or_
告诉她“跳过对话，我没时间。”
|tip 该选项将跳过对话，让你继续进行。
与特斯对话 |q 78178/3 |goto Ruins of Gilneas/0 41.51,36.07
|only if Horde
step
talk Princess Tess Greymane##210905
turnin To Gilneas##78178 |goto 41.51,36.07
accept A Crusade of Red##78180 |goto 41.51,36.07
|only if Horde
step
talk Greyguard Elite##212899
|tip 在建筑物内。
accept Summons to Lord Greymane##78596 |goto Valdrakken/0 59.25,42.65
|tip 你也可以在暴风城找到这个。
|only if Alliance
step
talk Genn Greymane##214538
在暴风港与甘宁·乌瑞恩会面 |q 78596/1 |goto Stormwind City/0 35.76,28.29
|only if Alliance
step
talk Genn Greymane##214538
turnin Summons to Lord Greymane##78596 |goto 35.76,28.29
accept To Gilneas##78177 |goto 35.76,28.29
|only if Alliance
step
talk Genn Greymane##214538
告诉他，我准备好去吉尔尼斯了。
让根恩知道你准备好了 |q 78177/1 |goto 35.66,28.94
|only if Alliance
step
观察对话
抵达吉尔尼斯 |q 78177/2
|only if Alliance
step
talk Princess Tess Greymane##210905
问她 "你的计划是什么？"
|tip 这个选项将要求你观看NPC之间的对话。
_Or_
告诉她“跳过对话，我没时间。”
|tip 该选项将跳过对话，让你继续进行。
与特斯对话 |q 78177/3 |goto Ruins of Gilneas/0 41.51,36.07
|only if Alliance
step
talk Princess Tess Greymane##210905
turnin To Gilneas##78177 |goto 41.51,36.07
accept A Crusade of Red##78180 |goto 41.51,36.07
|only if Alliance
step
talk Genn Greymane##210904
accept Aderic's Retort##78181 |goto 41.64,36.12
stickystart "Slay_Members_of_the_Scarlet_Crusade"
step
kill Consecrator Hennas##211231 |q 78181/1 |goto 48.80,52.88
step
label "Slay_Members_of_the_Scarlet_Crusade"
在该区域击杀血色敌人
杀死10名血色十字军成员 |q 78180/1 |goto 48.47,52.16
step
talk Genn Greymane##212187
turnin A Crusade of Red##78180 |goto 49.60,57.11
turnin Aderic's Retort##78181 |goto 49.60,57.11
accept Knee-High##78182 |goto 49.60,57.11
step
冲下楼梯 |goto 49.86,57.80 < 7 |walk
extraaction Swing Torch##424546
|tip 在隧道里狂按技能，吓跑那些疫病鼠。
清理害虫隧道 |q 78182/1 |goto 52.18,55.67
step
冲下楼梯 |goto 57.25,52.90 < 7 |walk
extraaction Swing Torch##424546
|tip 继续不断使用技能清理洞穴中的害虫，直到你到达隧道的尽头。
talk Princess Tess Greymane##210905
|tip 在建筑物内。
turnin Knee-High##78182 |goto 57.10,53.18
accept Smokepowder and Mirrors##78184 |goto 57.10,53.18
step
talk Lilian Voss##210964
|tip 在建筑物内。
accept Scarlet Blood##78183 |goto 57.11,53.02
stickystart "Slay_Scarlet_Forces"
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 1 Scarlet Explosives##211248 |q 78184/1 |goto 55.97,54.03
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 2 Scarlet Explosives##211248 |q 78184/1 |goto 55.64,56.88
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 3 Scarlet Explosives##211248 |q 78184/1 |goto 56.67,58.91
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 4 Scarlet Explosives##211248 |q 78184/1 |goto 57.63,57.64
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 5 Scarlet Explosives##211248 |q 78184/1 |goto 58.66,57.61
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 6 Scarlet Explosives##211248 |q 78184/1 |goto 58.41,56.02
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 7 Scarlet Explosives##211248 |q 78184/1 |goto 58.96,55.27
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Scarlet Munitions##410877
collect 8 Scarlet Explosives##211248 |q 78184/1 |goto 58.30,53.87
step
label "Slay_Scarlet_Forces"
在该区域击杀血色敌人
extraaction Call Lilian##428190 |notinsticky
|tip 在屏幕上使用技能，同时以精英敌人为目标，指示莉莉安发起攻击，造成大量伤害。 |不粘性
击杀#12#血色军团 |q 78183/1 |goto 57.14,55.42
step
_Next to you:_
talk Princess Tess Greymane##213995
turnin Smokepowder and Mirrors##78184 |goto 56.92,53.59
turnin Scarlet Blood##78183 |goto 56.92,53.59
accept Hounds of War##78185 |goto 56.92,53.59
step
click Gilneas Gate
打开吉尔尼斯之门 |q 78185/1 |goto 55.87,58.69
step
_Next to you:_
talk Princess Tess Greymane##213995
turnin Hounds of War##78185 |goto 55.88,58.70
accept Artillerist Arsonist##78187 |goto 55.88,58.70
step
talk Lilian Voss##210964
accept Crushing the Crusade##78186 |goto 55.87,58.13
stickystart "Slay_Scarlet_Elite"
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设定首个爆炸物 |q 78187/1 |goto 56.42,48.69 |count 1
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设置第二个爆炸物 |q 78187/1 |goto 55.88,48.39 |count 2
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设置第三个炸药 |q 78187/1 |goto 56.63,44.05 |count 3
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设置第四个炸药 |q 78187/1 |goto 56.89,46.42 |count 4
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设定第五个炸药 |q 78187/1 |goto 58.04,44.64 |count 5
step
extraaction Call Lilian##428190
|tip 在锁定精英敌人时使用屏幕上的技能来指示莉莲出击，造成大量伤害。
click Bomb Location
设置最终炸药 |q 78187/1 |goto 58.46,46.78
step
label "Slay_Scarlet_Elite"
在该区域击杀血色敌人
extraaction Call Lilian##428190 |notinsticky
|tip 在屏幕上使用技能，同时以精英敌人为目标，指示莉莉安发起攻击，造成大量伤害。 |不粘性
击败#12#血色精英 |q 78186/1 |goto 58.16,46.63
step
talk Princess Tess Greymane##210905
|tip 在建筑物内。
turnin Artillerist Arsonist##78187 |goto 59.50,48.71
turnin Crushing the Crusade##78186 |goto 59.50,48.71
accept Righteous Fire, Righteous Fury##78188 |goto 59.50,48.71
step
kill Inquisitor Fairbell##211930 |q 78188/1 |goto 61.30,51.14
|tip 在建筑物内。
|tip 逃离“辉光新星”
step
kill Hallowed Monstrosity##211933 |q 78188/2 |goto 61.33,51.17
|tip 在建筑物内。
|tip 逃离“辉光新星”
|tip 离开地面的黄圈区域。
step
talk Princess Tess Greymane##210905
turnin Righteous Fire, Righteous Fury##78188 |goto 58.73,47.84
step
talk Genn Greymane##210904
accept Beginning a New Dawn##78189 |goto 58.86,47.89
step
talk Princess Tess Greymane##210905
turnin Beginning a New Dawn##78189 |goto 58.72,47.84
step
talk Princess Tess Greymane##210905
accept What We Left Behind##78190 |goto 58.72,47.84
|only if Alliance
step
talk Genn Greymane##210904
turnin What We Left Behind##78190 |goto 48.80,52.95
|only if Alliance
step
talk Calia Menethil##210965
accept The Wall Between Us##79137 |goto 58.89,48.49
|only if Horde
step
talk Lilian Voss##210964
|tip 在建筑物内。
turnin The Wall Between Us##79137 |goto Silverpine Forest/0 43.65,73.23
|only if Horde
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Sins of the Sister",{
author="support@zygorguides.com",
description="This guide will help you complete the Sins of the Sister questline.",
startlevel=70,
patch='100207',
},[[
leechsteps "Leveling Guides\\Dragonflight (10-70)\\Champion of the Dragonflights"
step
talk Malfurion Stormrage##216069
|tip 马尔富里翁可能在贝拉梅斯附近停留几分钟，直到“归来的对话”完成。
accept An Uncommon Request##82229 |goto Amirdrassil/0 48.35,70.61
step
talk Kelestra##218623
turnin An Uncommon Request##82229 |goto 72.43,72.21
accept Tears of Teldrassil##80069 |goto 72.43,72.21
step
talk Kelestra##218623
告诉凯莱斯特拉你已经准备好了。 |gossip  121061
与凯尔斯特拉对话 |q 80069/1 |goto 72.43,72.21
step
进入洞穴 |goto 72.47,72.57 < 7 |walk
与凯雷斯特同行 |q 80069/2 |goto 72.88,74.11
|tip 洞内探险
step
clicknpc Barrowstone##222914
|tip 洞内探险
收集第一块冥石 |q 80069/3 |goto 72.90,74.15
step
talk Kelestra##222914 |goto 72.88,74.11
|tip 洞内探险
告诉凯雷斯特你准备好了。 |gossip  122334
与凯雷斯特同行 |q 80069/4 |goto 72.66,75.39
step
clicknpc Barrowstone##223217
|tip 洞内探险
收集第二块石碑 |q 80069/5 |goto 72.63,75.42
step
观察对话
|tip 洞内探险
与凯雷斯特同行 |q 80069/6 |goto 73.05,76.94
step
clicknpc Barrowstone##223217
|tip 洞内探险
收集第三块坟石 |q 80069/7 |goto 73.03,77.01
step
观察对话
|tip 洞内探险
与凯雷斯特同行 |q 80069/8 |goto 72.94,78.40
step
clicknpc Barrowstone##223217
|tip 洞内探险
收集第四个坟石 |q 80069/9 |goto 72.90,78.40
step
观察对话
|tip 洞内探险
与凯雷斯特同行 |q 80069/10 |goto 72.96,79.51
step
clicknpc Burial Stones
|tip 洞内探险
安放灵魂石 |q 80069/11 |goto 72.97,79.57
step
观察对话
|tip 洞内探险
倾听讨论 |q 80069/12 |goto 72.96,79.52
step
talk Kelestra##218697
|tip 洞内探险
选择 _"<说Koroleth是个原始者。>"_ |gossip 121071
说科罗莱丝是一名原始者，她在战斗中陨落。 |gossip 121070
选择 _“说科罗雷斯是一名原始者，你在战斗中击杀了她。”_ |gossip 121069
选择 _"<说你不知道任何事情。>"_ |gossip 121068
与凯雷斯塔交谈 |q 80069/13 |goto 72.96,79.52
step
talk Kelestra##218697
|tip 洞内探险
turnin Tears of Teldrassil##80069 |goto 72.96,79.52
accept Fact Finding##80071 |goto 72.96,79.52
step
追随道路 |goto 72.63,75.69 < 7 |walk
离开洞穴 |goto 72.47,72.51 < 7 |walk
talk Kelestra##218698
turnin Fact Finding##80071 |goto 33.69,18.80
accept A Primalist Point of View##80072 |goto 33.69,18.80
step
talk Ereria Galesinger##218788
选择 _"<告诉我关于柯罗雷斯的事情。>"_ |gossip 121116
与艾瑞莉亚·风歌交谈 |q 80072/1 |goto 34.06,18.08
step
talk Idoral Starstrike##218789
选择 _"<告诉我关于柯罗雷斯的事情。>"_ |gossip 121117
与伊多拉尔·星袭交谈 |q 80072/2 |goto 35.28,20.40
step
talk Kotori Lightningstride##218790
选择 _"<告诉我关于柯罗雷斯的事情。>"_ |gossip 121118
与风行者小鸟交谈 |q 80072/3 |goto 34.10,22.67
step
talk Shalrinar Shimmersong##218791
选择 _"<告诉我关于柯罗雷斯的事情。>"_ |gossip 121119
与沙尔丽娜·闪歌交谈 |q 80072/4 |goto 32.20,21.39
step
talk Kelestra##218698
turnin A Primalist Point of View##80072 |goto 33.69,18.80
accept Bones of a Bygone Battle##80073 |goto 33.69,18.80
step
click Unidentified Remains
|tip 你将很快被几个小元素生物攻击。
调查遗骸 |gossip 121120
检查第一具遗骸 |q 80073/1 |goto 81.15,38.69
step
click Unidentified Remains
|tip 你将很快被元素攻击。
调查遗骸 |gossip 121121
检查第二具遗骸 |q 80073/2 |goto 83.58,26.43
step
click Unidentified Remains
调查遗骸 |gossip 121122
检查第三具遗骸 |q 80073/3 |goto 88.91,20.92
step
extraaction Signal Kelestra##438580
|tip 它在你的界面上显示为一个按钮。
信号凯莱斯特拉 |q 80073/4 |goto 88.91,20.92
step
观察对话
talk Kelestra##218701
|tip 她走向这个地点。
turnin Bones of a Bygone Battle##80073 |goto 88.94,20.95
accept A Barrow Den Burial##80075 |goto 88.94,20.95
step
talk Kelestra##218785
turnin A Barrow Den Burial##80075 |goto 72.29,72.00
accept Sins of the Sister##80077 |goto 72.29,72.00
step
talk Malfurion Stormrage##218629
选择 _"试图说服毛瑟里恩允许科罗列斯在墓穴中安息。"_ |gossip 121123
选择 _"<尝试说服玛法里奥，认为科罗雷斯是叛徒，不值得在此安息。>"_ |gossip 121125
不要试图劝说玛法里奥，随他自己做决定。 |gossip 121124
|tip 你选择的对话选项将决定故事的走向，所以请选择你的偏好。
|tip 这可能会对未来的副本产生影响。
与马尔菲urion交谈 |q 80077/1 |goto 72.30,72.19
step
观察对话
聆听玛法里奥的决策 |q 80077/2 |goto 72.30,72.19
step
talk Malfurion Stormrage##218629
turnin Sins of the Sister##80077 |goto 72.30,72.19
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Champion of the Dragonflights",{
author="support@zygorguides.com",
description="This guide will help you complete the Champion of the Dragonflights questline.",
startlevel=70,
patch='100205',
next="Leveling Guides\\Dragonflight (10-70)\\Sins of the Sister",
},[[
step
talk Alexstrasza##216309
accept Fair Skies and Strong Winds##78643 |goto Amirdrassil/0 50.89,61.67
step
talk Alexstrasza the Life-Binder##187678
|tip 在高塔的顶部。
与亚历瑟拉斯对话 |gossip 120503
在卓越之座与亚历丝塔萨交谈 |q 78643/1 |goto Valdrakken/0 58.14,34.91
step
talk Alexstrasza the Life-Binder##187678
|tip 在高塔的顶部。
turnin Fair Skies and Strong Winds##78643 |goto 58.14,34.91
accept A Place Beneath the Boughs##78863 |goto 58.14,34.91
step
talk Vyranoth##214051
|tip 在高塔的顶部。
accept Siblings Until the End##78865 |goto 55.94,36.72
step
talk Vyranoth##214051
|tip 在高塔的顶部。
告诉她“告诉我你与伊利达克龙的会面。” |gossip 120505
与维拉诺斯交谈 |q 78865/1 |goto 55.84,36.74
step
talk Vyranoth##214051
|tip 在高塔的顶部。
turnin Siblings Until the End##78865 |goto 55.84,36.74
step
talk Shandris Feathermoon##216067
turnin A Place Beneath the Boughs##78863 |goto Amirdrassil/0 51.09,60.52
accept The Returning##78864 |goto 51.09,60.52
step
talk Shandris Feathermoon##216067
与香德莉丝和泰兰德交谈。 |gossip 120504
与香德瑞丝·费尔摩交流 |q 78864/1 |goto 51.09,60.52
step
talk Shandris Feathermoon##216067
turnin The Returning##78864 |goto 51.96,60.95
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Hunt for the Harbinger",{
author="support@zygorguides.com",
description="This guide will help you complete the Hunt for the Harbinger questline.",
patch='100207',
},[[
step
talk Khadgar's Summons##221491
|tip 在建筑物内。
accept The Harbinger##81654 |goto Stormwind City/0 84.88,25.17 |or |only if Alliance
accept The Harbinger##81654 |goto Orgrimmar/1 41.30,75.49 |or |only if Horde
'|accept The Harbinger##79009 |or
|tip 你将自动接受这个任务。
step
use the Dalaran Hearthstone##223988
抵达达拉然
step
use the Dalaran Hearthstone##223988
接近守护者之室 |q 81654/1 |goto Dalaran L/12 36.10,48.80 |only if haveq(81654) or completedq(81654)
接近守护者之室 |q 79009/1 |goto Dalaran L/12 36.10,48.80 |only if haveq(79009) or completedq(79009)
|tip 踏上传送门，进入内室。
|tip 如果你拥有《内部战争》任务，你需要先完成那条任务链中的一部分才能继续。
|tip 完成《布朗瑟德家族》任务后，艾丽莉亚将出现在正确的位置以完成这一任务。
step
talk Alleria Windrunner##214615
|tip 守护者之穴深处
告诉她“很好。让我们去找卡德加谈谈。” |gossip 120217
与艾瑞莉亚交谈 |q 81654/2 |goto 36.10,48.80 |only if haveq(81654) or completedq(81654)
与艾瑞莉亚交谈 |q 79009/2 |goto 36.10,48.80 |only if haveq(79009) or completedq(79009)
step
talk Archmage Khadgar##214972
|tip 守护者之穴深处
turnin The Harbinger##81654 |goto 28.34,36.87 |only if haveq(81654) or completedq(81654)
turnin The Harbinger##79009 |goto 28.34,36.87 |only if haveq(79009) or completedq(79009)
step
talk Alleria Windrunner##215013
|tip 守护者之穴深处
accept Door to the Ren'dorei##79010 |goto 31.45,41.68
step
跟随艾瑞达 |q 79010/1 |goto 35.77,74.92
|tip 守护者之穴深处
|tip 如果这没有完成，请尝试重新登录。
|tip 一个紫色和黑色的传送门应该出现。
step
click Rift to Telogrus
|tip 守护者之穴深处
使用虚空裂口进入泰洛克斯裂口 |q 79010/2 |goto 33.61,78.90
step
talk Alleria Windrunner##214701
turnin Door to the Ren'dorei##79010 |goto Telogrus Rift/0 27.26,27.86
step
talk Magister Umbric##214702
accept Riftwalker Reports##79011 |goto 27.22,27.70
accept Cracks in the Void##79012 |goto 27.22,27.70
step
click Rift to Fathom's Edge
乘坐裂隙到达深渊边缘 |invehicle |goto 27.90,28.63 |q 79011
step
观察对话
抵达深渊之边 |outvehicle |goto 29.27,38.29 |q 79011
step
click Unstable Void Rift
|tip 一旦被它绑住，赶快逃离以关闭它。
|tip 避免 orb 落地的区域，否则你将受到伤害。
关闭不稳定的虚空裂缝 |q 79012/1 |goto 29.54,41.35 |count 1
step
talk Riftwalker Dellyn##215142
问她“你有什么消息要报告？” |gossip 120247
聆听来自阿贝鲁斯的报告 |q 79011/1 |goto 30.10,43.36
step
click Void Rift
乘坐裂隙前往宇宙边界 |invehicle |goto 30.05,44.14 |q 79011
step
观察对话
抵达宇宙边界 |outvehicle |goto 39.62,49.25 |q 79011
step
click Unstable Void Rift
|tip 一旦被它绑住，赶快逃离以关闭它。
|tip 避免 orb 落地的区域，否则你将受到伤害。
关闭不稳定的虚空裂缝 |q 79012/1 |goto 37.80,50.03 |count 2
step
talk Riftwalker Soran##215157
问他“你有什么新鲜事要汇报？” |gossip 120248
聆听来自卡利姆多的报告 |q 79011/2 |goto 37.70,51.73
step
click Unstable Void Rift
|tip 一旦被它绑住，赶快逃离以关闭它。
|tip 避免 orb 落地的区域，否则你将受到伤害。
关闭不稳定的虚空裂缝 |q 79012/1 |goto 38.40,52.93 |count 3
step
talk Riftwalker Orlis##215158
问他“你有什么新鲜事要汇报？” |gossip 120249
听来自东部王国的报告 |q 79011/3 |goto 39.93,53.72
step
click Unstable Void Rift
|tip 一旦被它绑住，赶快逃离以关闭它。
|tip 避免 orb 落地的区域，否则你将受到伤害。
关闭不稳定的虚空裂缝 |q 79012/1 |goto 40.71,57.22 |count 4
step
click Unstable Void Rift
|tip 一旦被它绑住，赶快逃离以关闭它。
|tip 避免 orb 落地的区域，否则你将受到伤害。
关闭不稳定的虚空裂缝 |q 79012/1 |goto 42.03,59.88 |count 5
step
talk Magister Umbric##214699
turnin Riftwalker Reports##79011 |goto 40.84,60.90
turnin Cracks in the Void##79012 |goto 40.84,60.90
step
talk Alleria Windrunner##214698
accept Galakrond's Unrest##79013 |goto 40.67,60.87
step
click Rift to Northrend
从泰洛格斯裂口传送到诺森德 |q 79013/1 |goto 39.66,60.62
step
talk Alleria Windrunner##214634
turnin Galakrond's Unrest##79013 |goto Dragonblight/0 56.68,39.00
accept Walk a Mile in Her Shadows##79014 |goto 56.68,39.00
step
extraaction Voidflare##434210
|tip 它在你的界面上显示为一个按钮。
审视虚空存在 |q 79014/1 |goto 55.97,37.43
step
extraaction Voidflare##431240
|tip 在阿丽莉亚跑过后，它会以一个按钮的形式出现在你的屏幕上。
清除暗影 |q 79014/2 |goto 56.21,35.35 |count 1
step
extraaction Voidflare##431240
|tip 它在你的界面上显示为一个按钮。
清除暗影 |q 79014/2 |goto 55.69,35.16 |count 2
step
extraaction Voidflare##431240
|tip 它在你的界面上显示为一个按钮。
清除暗影 |q 79014/2 |goto 54.91,34.78 |count 3
step
extraaction Voidflare##431240
|tip 它在你的界面上显示为一个按钮。
清除暗影 |q 79014/2 |goto 54.83,33.18 |count 4
step
talk Alleria Windrunner##214759
turnin Walk a Mile in Her Shadows##79014 |goto The Storm Peaks/0 41.50,22.70
accept Dark Descension##79015 |goto 41.50,22.70
step
kill Riftwalker Nilara##214644 |q 79015/1 |goto 41.52,21.31
step
_Next to you:_
talk Alleria Windrunner##221539
turnin Dark Descension##79015 |goto 41.52,21.31
accept Legacy of the Void##79016 |goto 41.52,21.31
step
click Void Portal to Eredath
使用虚空传送门前往艾瑞达斯 |q 79016/1 |goto 41.54,20.29
step
talk Alleria Windrunner##214645
turnin Legacy of the Void##79016 |goto Eredath/0 22.51,53.46
accept The Path Taken##79017 |goto 22.51,53.46
step
在该区域击杀敌人
|tip 在这个地方尽可能多地使用AOE技能或组队标记怪物。
|tip 只要你标记了他们，你就会获得奖励。
面对记忆 |q 79017/2 |goto 21.06,52.59 |count 1
step
extraaction Witness Memory##431507
观察记忆 |q 79017/1 |goto 20.91,50.49 |count 1
step
在该区域击杀敌人
|tip 在这个地方尽可能多地使用AOE技能或组队标记怪物。
|tip 只要你标记了他们，你就会获得奖励。
面对记忆 |q 79017/2 |goto 21.92,48.32 |count 2
step
extraaction Witness Memory##431507
观察记忆 |q 79017/1 |goto 23.19,50.14 |count 2
step
在该区域击杀敌人
|tip 在这个地方尽可能多地使用AOE技能或组队标记怪物。
|tip 只要你标记了他们，你就会获得奖励。
面对记忆 |q 79017/2 |goto 24.66,49.05 |count 3
step
extraaction Witness Memory##431507
观察记忆 |q 79017/1 |goto 24.84,52.06 |count 3
step
_Next to you:_
talk Alleria Windrunner##215597
|tip 她会冲向你。
turnin The Path Taken##79017 |goto 23.05,50.56
accept And Be One Traveler, Long I Stood##79018 |goto 23.05,50.56
step
观察对话
|tip 在建筑物内。
面对图拉扬的记忆 |q 79018/1 |goto 24.23,42.99
step
click Call of the Void
|tip 在建筑物内。
跟随图拉扬前往泰罗克鲁斯 |q 79018/2 |goto 24.24,42.74
step
talk Alleria Windrunner##214660
turnin And Be One Traveler, Long I Stood##79018 |goto Telogrus Rift/0 28.64,23.97
accept Defend Telogrus Rift##79019 |goto 28.64,23.97
stickystart "Defend_Telogrus_Rift"
step
click Rift to Fathom's Edge
乘坐裂隙前往深渊之边 |invehicle |goto 27.90,28.62 |q 79019
step
观察对话
抵达深渊之边 |outvehicle |goto 29.27,38.29 |q 79019
step
click Void Rift
乘坐裂隙前往宇宙边界 |invehicle |goto 30.05,44.13 |q 79019
step
观察对话
抵达宇宙边界 |outvehicle |goto 39.62,49.25 |q 79019
step
label "Defend_Telogrus_Rift"
在该区域击杀敌人
click Unstable Void Rift+
|tip 它们看起来像暗影云彩，周围有光球击打地面。
|tip 一旦被绑定到他们身上就逃跑以关闭他们。
|tip 避免 orb 落地的区域，否则你将受到伤害。
clicknpc Trapped Void Elf##214659+
|tip 他们看起来像是在这个区域周围跪着的虚空精灵。
保卫特洛戈斯裂口 |q 79019/1 |goto 40.49,59.03
step
talk Alleria Windrunner##216264
turnin Defend Telogrus Rift##79019 |goto 43.55,63.79
accept Null and Void##79020 |goto 43.55,63.79
step
click Void Rift
乘坐裂隙前往春分之地 |q 79020/1 |goto 43.95,63.74
step
观察对话
抵达春分之地 |outvehicle |goto 49.07,72.53 |q 79020
step
kill Corrupted Memory of Turalyon##214616 |q 79020/2 |goto 49.10,76.87
|tip 将其削弱到足以逃跑。
step
talk Alleria Windrunner##216618
turnin Null and Void##79020 |goto 50.18,75.24
step
talk Locus-Walker##214657
accept Radiant Warnings##79021 |goto 50.40,75.29
step
talk Locus-Walker##214657
告诉他我已准备好。 |gossip 120568
倾听聚焦行者 |q 79021/1 |goto 50.40,75.29
step
click Void Rift
乘坐裂隙前往宇宙边界 |invehicle |goto 48.94,72.01 |q 79021
step
观察对话
抵达宇宙边界 |outvehicle |goto 43.67,63.28 |q 79021
step
click Void Rift
乘坐裂隙到达深渊边缘 |invehicle |goto 40.04,49.32 |q 79021
step
观察对话
抵达深渊之边 |outvehicle |goto 29.82,43.68 |q 79021
step
click Rift to Telogrus
乘坐裂隙前往特洛古斯裂隙 |invehicle |goto 29.45,37.79 |q 79021
step
观察对话
抵达提洛格斯裂隙 |outvehicle |goto 27.87,28.11 |q 79021
step
click Rift to Dalaran |goto 24.95,27.90
重返达拉然 |goto Dalaran L/12 |c |noway |q 79021
step
回到达拉然找卡德加 |q 79021/2 |goto Dalaran L/12 28.38,36.91
|tip 守护者之穴深处
step
talk Archmage Khadgar##214972
|tip 守护者之穴深处
turnin Radiant Warnings##79021 |goto 28.38,36.91
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Warbands",{
author="support@zygorguides.com",
description="This guide will assist you in familiarizing yourself with the Warband feature.",
startlevel=20,
patch='110000',
},[[
step
accept Warbands: Warbanding Together##83492 |goto Stormwind City/0 63.35,72.36 |only if Alliance
accept Warbands: Warbanding Together##83492 |goto Orgrimmar/1 51.23,79.11 |only if Horde
|tip 你将自动接受这个任务。
step
talk Blue##226658
|tip 在建筑物内。
turnin Warbands: Warbanding Together##83492 |goto Tanaris/0 52.51,26.86
accept Warbands: Rift Reader##83493 |goto Tanaris/0 52.51,26.86
accept Warbands: Space Ghosts by the Coast##83494 |goto Tanaris/0 52.51,26.86
stickystart "Scan_Transpositional_Anomaly"
step
击杀这个区域内部分传送的敌人 |kill Partially Teleported Gnoll##226667, Partially Teleported Kobold##226669, Partially Teleported Trogg##226668
|tip 使用屏幕上交替出现的各种技能来造成额外伤害。
收集#8#空间残留物 |q 83494/1 |goto Tanaris/0 51.45,34.25
step
label "Scan_Transpositional_Anomaly"
clicknpc Transpositional Anomaly##226674+
扫描 #6# 传送异常 |q 83493/1 |goto Tanaris/0 51.45,34.25
step
talk Blue##226658
|tip 在建筑物内。
turnin Warbands: Rift Reader##83493 |goto Tanaris/0 52.51,26.86
turnin Warbands: Space Ghosts by the Coast##83494 |goto Tanaris/0 52.51,26.86
accept Warbands: Twinsposition##83495 |goto Tanaris/0 52.51,26.86
step
click Transpositional Signal Recombobulatron
激活转位信号重组器 |q 83495/1 |goto Tanaris/0 48.22,31.86
step
消灭你的邪恶双胞胎 |q 83495/2 |goto Tanaris/0 48.22,31.87
|tip 你会遇到一个复制的自己，必须击败它。
step
talk Blue##226658
turnin Warbands: Twinsposition##83495 |goto Tanaris/0 48.47,31.64
accept Warbands: Spacetime is Money##83496 |goto Tanaris/0 48.47,31.64
step
clicknpc De-Recombobulatron Matrix##226981
|tip 在建筑物内。
放置去重组矩阵 |q 83496/1 |goto Tanaris/0 52.27,29.70
step
talk Blue##226658
|tip 在建筑物内。
turnin Warbands: Spacetime is Money##83496 |goto Tanaris/0 52.50,26.86
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Visions of Azeroth",{
author="support@zygorguides.com",
description="This guide will assist you in completing the Visions of Azeroth campaign.",
startlevel=70,
patch='110000',
},[[
step
完成“安杜法拉斗”任务 |complete completedq(76283)
|tip 您必须完成《龙鸣之战》最后一章后才能开始此任务。
|loadguide "Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign"
step
accept The War Within##81930 |goto Stormwind City/0 63.19,72.02
|tip 你将自动接取这个任务。
|only if Alliance
step
在希利苏斯与吉安娜会面 |q 81930/2 |goto Silithus/0 41.96,45.04
|only if Alliance
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##81930 |goto Silithus/0 41.96,45.04
|only if Alliance
step
accept The War Within##78713 |goto Orgrimmar/1 50.96,78.44
|tip 你将自动接取这个任务。
|only if Horde
step
在希利苏斯与吉安娜会面 |q 78713/2 |goto Silithus/0 41.96,45.04
|only if Horde
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##78713 |goto Silithus/0 41.96,45.04
|only if Horde
step
talk Thrall##213620
accept Oh, THAT Sword##78714 |goto Silithus/0 41.96,45.05
step
click Titan Translocator
进入心脏密室 |q 78714/1 |goto Silithus/0 43.20,44.49
step
talk Magni Bronzebeard##213624
turnin Oh, THAT Sword##78714 |goto Chamber of Heart/2 50.06,65.19
accept Azeroth's Voice##78715 |goto Chamber of Heart/2 50.06,65.19
step
click Chamber Console
激活心之卵控制台 |q 78715/1 |goto Chamber of Heart/2 56.50,64.69 |count 1
step
click Chamber Console
激活心之卵控制台 |q 78715/1 |goto Chamber of Heart/2 50.14,74.00 |count 2
step
click Chamber Console
激活心之卵控制台 |q 78715/1 |goto Chamber of Heart/2 43.90,64.72 |count 3
step
talk Magni Bronzebeard##213624
告诉他我准备好了。让我们开始。 |gossip 120882
与麦格尼对话以开始仪式 |q 78715/2 |goto Chamber of Heart/2 50.06,65.21
step
talk Lady Jaina Proudmoore##213625
turnin Azeroth's Voice##78715 |goto Chamber of Heart/2 49.53,58.51
accept Painful Lessons##78716 |goto Chamber of Heart/2 49.53,58.51
step
click Portal to Dalaran
乘坐吉安娜的传送门前往达拉然 |q 78716/1 |goto Chamber of Heart/2 53.43,58.01
step
在达拉然与卡德加会面 |q 78716/2 |goto Dalaran L/12 46.80,54.47
step
talk Archmage Khadgar##213627
|tip 在建筑物内。
turnin Painful Lessons##78716 |goto Dalaran L/12 42.87,59.86
step
talk Moira Thaurissan##214651
|tip 在建筑物内。
accept The Bronzebeard Family##80500 |goto Dalaran L/12 40.39,54.13
step
talk Brann Bronzebeard##214669
|tip 在建筑物内。
告诉他“麦格尼斯受伤了。莫伊拉需要你们两个在肖像厅。” |gossip 121542
与布莱恩交谈 |q 80500/1 |goto Dalaran L/10 50.73,55.59
step
talk Moira Thaurissan##214651
|tip 在建筑物内。
turnin The Bronzebeard Family##80500 |goto Dalaran L/12 40.35,54.03
]])
