local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("LevelingCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Earthen Starter (10-11)",{
condition_valid=function() return raceclass('EarthenDwarf') and not raceclass('DeathKnight') end,
condition_valid_msg="Earthen only.",
condition_suggested=function() return raceclass('EarthenDwarf') and level < 12 and not completedq(50305) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
},[[
step
talk Dawn##221839
accept Who am I?##79200 |goto Hall of Awakening/0 89.46,48.03
step
click Diagnostics Scanner##222024
完成诊断扫描 |q 79200/1 |goto Hall of Awakening/0 87.04,49.47
step
clicknpc Cognitive Scanner##223110
完成认知扫描 |q 79200/2 |goto Hall of Awakening/0 83.70,60.93
step
click Anomaly Scanner
完成异常扫描 |q 79200/3 |goto Hall of Awakening/0 83.77,37.91
step
破坏遏制协议 |q 79200/4 |goto Hall of Awakening/0 83.77,37.91
|tip 使用{o}内歌{}功能。
|tip 它会以按钮的形式出现在屏幕上。
step
talk Dawn##221887
turnin Who am I?##79200 |goto Hall of Awakening/0 62.65,49.65
step
talk Foreman Uzjax##221891
accept The Analysis Interface##83328 |goto Hall of Awakening/0 62.65,49.30 |only if Hunter
accept The Analysis Interface##79201 |goto Hall of Awakening/0 62.64,49.31 |only if not Hunter
step
clicknpc Primary Interface##224809
告诉它 _“我准备好开始分析序列了”_。 |gossip 122137
告诉它_“我选择省略一个答案”_。 |gossip 122227
告诉它_“我选择省略一个答案”_。 |gossip 122214
完成初级分析 |q 83328/1 |goto Hall of Awakening/0 61.36,47.01 |only if Hunter
完成初级分析 |q 79201/1 |goto Hall of Awakening/0 61.36,47.01 |only if not Hunter
step
clicknpc Secondary Interface##224797
告诉它_“我准备好继续分析序列了”_。 |gossip 122312
告诉它_“我选择省略一个答案”_。 |gossip 122229
告诉它_“我选择省略一个答案”_。 |gossip 122228
完成二次分析 |q 83328/2 |goto Hall of Awakening/0 61.38,52.03 |only if Hunter
完成二次分析 |q 79201/2 |goto Hall of Awakening/0 61.38,52.03 |only if not Hunter
step
clicknpc Tertiary Interface##224810
talk Tertiary Interface##224810
告诉它_“我准备好完成分析序列了”_。 |gossip 122313
告诉它_“我选择省略一个答案”_。 |gossip 122230
告诉它_“我选择省略一个答案”_。 |gossip 122231
完成三级分析 |q 83328/3 |goto Hall of Awakening/0 57.32,49.52 |only if Hunter
完成三级分析 |q 79201/3 |goto Hall of Awakening/0 57.32,49.52 |only if not Hunter
step
talk Dawn##221888
turnin The Analysis Interface##83328 |goto Hall of Awakening/0 47.77,54.82 |only if Hunter
turnin The Analysis Interface##79201 |goto Hall of Awakening/0 47.77,54.82 |only if not Hunter
accept Rock Beats Rock##79202 |goto Hall of Awakening/0 47.77,54.82
step
talk Awakened Machinist##227273+
告诉他们_“我们来比划比划！”_ |gossip 122263
在战斗中击败 #6# 土人 |q 79202/1 |goto Hall of Awakening/0 43.61,49.87
'|talk Awakened Stormhand##221912
step
talk Dawn##221889
turnin Rock Beats Rock##79202 |goto Hall of Awakening/0 30.77,48.21
step
talk Speaker Kuldas##221898
accept Authorization: Negated##79203 |goto Hall of Awakening/0 30.92,48.57
step
kill Phalanx of Authorization##221917 |q 79203/1 |goto Hall of Awakening/0 25.53,49.56
step
talk Speaker Kuldas##221900
|tip 他就会跑到这个位置。
turnin Authorization: Negated##79203 |goto Hall of Awakening/0 16.28,48.09
accept Whoever You Want to Be##79204 |goto Hall of Awakening/0 16.28,48.09
step
在觉醒前厅与黎明会合 |q 79204/1 |goto Hall of Awakening/0 8.61,49.68
step
talk Dawn##221890
turnin Whoever You Want to Be##79204 |goto Hall of Awakening/0 8.61,49.68
accept For the Alliance##81886 |goto Hall of Awakening/0 8.61,49.68	|only if Alliance
accept For the Horde##81888 |goto Hall of Awakening/0 8.61,49.69	|only if Horde
step
click Portal to Stormwind
传送到暴风城 |complete zone("Stormwind City") |goto Hall of Awakening/0 7.26,46.31 |q 81886
|only if Alliance
step
talk Ambassador Moorgard##133362
turnin For the Alliance##81886 |goto Stormwind City/0 53.05,15.26
accept Stranger in a Strange Land##81887 |goto Stormwind City/0 53.05,15.26 |next
|only if Alliance
step
talk Chromie##167032
与克罗米交谈 |q 81887/1 |goto Stormwind City/0 56.28,17.31
|only if Alliance
step
talk Adhelda##224806
turnin Stranger in a Strange Land##81887 |goto Stormwind City/0 56.21,17.68
|only if Alliance
step
click Portal to Orgrimmar
传送到奥格瑞玛 |complete zone("Orgrimmar") |goto Hall of Awakening/0 7.12,52.76 |q 81888
|only if Horde
step
talk Ambassador Blackguard##133407
turnin For the Horde##81888 |goto Orgrimmar/1 39.39,79.56
accept Stranger in a Strange Land##81889 |goto Orgrimmar/1 39.39,79.56
|only if Horde
step
talk Chromie##167032
与克罗米交谈 |q 81889/1 |goto Orgrimmar/1 40.84,80.16
|only if Horde
step
talk Brunhold##224807
turnin Stranger in a Strange Land##81889 |goto Orgrimmar/1 40.78,80.41
|only if Horde
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Earthen Race Unlock",{
description="This guide will walk you through unlocking the Earthen allied race.",
},[[
step
achieve The Isle of Dorn##20118
achieve The Ringing Deeps##19560
achieve Hallowfall##20598
achieve Azj-Kahet##19559
|tip 使用{o}“内战 ”等级提升指南{}来完成这项任务。
|tip 如果你使用{o}全区{}等级指南来提升等级，你将{o}自然而然地完成解锁土人同盟种族所需的任务{}。
|tip 你还将{o}达到 80 级{}，这也是本攻略稍后部分开启 “内部战争 ”战役{}的{o}必要条件。
step
talk Aldra##219393
accept How Scandalous!##80207 |goto Dornogal/0 62.71,21.74
step
调查锻造场附近的骚乱 |q 80207/1 |goto 49.89,49.32
|tip 在建筑门口的旁边。
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin How Scandalous!##80207 |goto 49.89,49.32
accept Seizing Evidence##79521 |goto 49.89,49.32
step
click Shipment Crate+
|tip 它们看起来像是{o}宝箱{}。
收集 #3# 被扣押的货物 |q 79521/1 |goto 51.38,51.24
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Seizing Evidence##79521 |goto 49.89,49.32
accept Withheld Information##79522 |goto 49.89,49.32
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 50.06,48.33 |count 1
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 49.78,48.03 |count 2
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 49.59,48.25 |count 3
step
talk Line Worker##219395
审问生产线工人 |q 79522/1 |goto 48.98,49.49 |count 4
step
talk Line Worker##219395
审问生产线工人 |q 79522/1 |goto 48.90,49.59 |count 5
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Withheld Information##79522 |goto 49.88,49.32
accept Something Hidden##79523 |goto 49.88,49.32
step
click False-Bottomed Crate+
|tip 它们看起来像是{o}宝箱{}。
砸碎 3# 个箱子 |q 79523/1 |goto 51.39,51.23
step
click Nerubian Silk Ropes
收集证据 |q 79523/2 |goto 51.26,51.18 |count 1
step
click Infused Underclay
收集证据 |q 79523/2 |goto 51.37,51.38 |count 2
step
click Bag of Glowing Shards
收集证据 |q 79523/2 |goto 51.49,51.25 |count 3
step
click Bundle of Receipts
收集证据 |q 79523/2 |goto 51.55,51.29 |count 4
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Something Hidden##79523 |goto 49.89,49.32
accept Report to the Councilward##79525 |goto 49.89,49.32
step
click Open Ledger
|tip 建筑内部
|tip 高高的山上
在议会大厦找到梅里克斯 |q 79525/1 |goto 55.62,6.08
step
click Open Ledger
|tip 建筑内部
接近梅里克斯的办公桌 |q 79525/2 |goto 55.62,6.08
step
click Open Ledger
|tip 建筑内部
turnin Report to the Councilward##79525 |goto 55.62,6.08
step
talk Korgran##213184
accept Before I Depart##78743 |goto Isle of Dorn/0 57.45,42.96
step
talk Urtago##213687
turnin Before I Depart##78743 |goto 61.70,41.59
accept Honor Their Memories##78744 |goto 61.70,41.59
stickystart "Deal_With_The_Kobold_Infestation"
step
click Earthen Figurine
摆放泥土雕像 |q 78744/2 |goto 62.01,41.77
step
click Deck of Cards
放置纸牌 |q 78744/1 |goto 62.11,41.38
step
click Precious Gem
放置珍贵宝石 |q 78744/3 |goto 62.52,40.95
step
label "Deal_With_The_Kobold_Infestation"
杀死周围的敌人
处理哥布林入侵 |q 78744/4 |goto 62.47,41.33
'|kill Candlelit Desecrator##215236, Candlelit Pebblemaker##218658
step
talk Urtago##213687
turnin Honor Their Memories##78744 |goto 61.70,41.59
accept You No Take Plunder!##78745 |goto 61.70,41.59
accept Laws Apply to All##78746 |goto 61.70,41.59
stickystart "Slay_Kobold_Invaders"
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 62.70,44.33 |count 1
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 63.19,43.35 |count 2
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 63.87,42.33 |count 3
step
label "Slay_Kobold_Invaders"
杀死周围的敌人 |notinsticky
杀死 #12# 哥布林入侵者 |q 78746/1 |goto 63.33,42.54
'|kill Candlelit Hexthrower##213685, Candlelit Lootsnatcher##213197, Candlelit Boomer##213683, Candlelit Ouchpatcher##214252, Candlelit Big-Boomer##211546, Candlelit Blind-Hound##218213
step
talk Urtago##213688
turnin You No Take Plunder!##78745 |goto 63.30,42.64
turnin Laws Apply to All##78746 |goto 63.30,42.64
accept The Great Collapse##78747 |goto 63.30,42.64
accept Cutting the Wick##78748 |goto 63.30,42.64
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 62.85,44.78 |count 1
step
kill Workmaster Nast##213200 | q 78748/3 |goto 63.26,45.01
|tip 他在这附近走动。
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 63.54,44.34 |count 2
step
kill Workmaster Earwax##213195 | q 78748/2 |goto 64.35,44.09
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 64.19,42.96 |count 3
step
kill Hairless the Menace##213550 |q 78748/1 |goto 64.74,42.51
|tip 他在这附近走动。
step
talk Urtago##213688
turnin The Great Collapse##78747 |goto 63.30,42.64
turnin Cutting the Wick##78748 |goto 63.30,42.64
accept Who Runs this Fine Establishment?##78749 |goto 63.30,42.64
step
kill Grand-Heister Bokk##213679 |q 78749/1 |goto 62.23,38.63
|tip 他在这附近走动。
|tip 小山洞内
step
talk Urtago##214292
告诉她_“完成了”_ |gossip 120867
与乌尔塔戈对话 |q 78749/2 |goto 62.46,39.55
step
talk Urtago##213187
turnin Who Runs this Fine Establishment?##78749 |goto 57.47,42.94
step
talk Korgran##213184
accept One More Tradition##79335 |goto 57.45,42.96
stickystart "Collect_Charged_Cores"
step
click Vein of Ore+
|tip 它们看起来像{o}灰色的采矿节点{}，里面有{o}蓝色的水晶{}。
collect 5 Clump of Ore##213001 |q 79335/2 |goto 59.50,42.45
step
label "Collect_Charged_Cores"
杀死周围的敌人
collect 5 Charged Core##213002 |q 79335/1 |goto 59.50,42.45
'|kill Scavenging Stormfang##218401, Great Stormfang##216017
step
进入建筑 |goto 57.39,42.91 < 15 |walk
talk Korgran##216169
|tip 建筑内部
turnin One More Tradition##79335 |goto 57.06,42.49
accept The Forging of Memories##79336 |goto 57.06,42.49
step
_NOTE:_
任务期间
|tip {科格兰会开始锻造，并告诉你把附近的东西交给他。
|tip {当他让你点击物品时{}。
点击此处继续 |confirm |q 79336
step
talk Korgran##216169
|tip 建筑内部
告诉他_“我准备好开始了！”_ |gossip 120605
与 Korgran 对话，开始锻造灯笼 |q 79336/1 |goto 57.06,42.49
step
观看对话
|tip {科格兰会开始锻造，并告诉你把附近的东西交给他。
|tip {当他让你点击物品时{}。
|tip 建筑内部
click A Pile of Coals
|tip 看起来附近有一堆{o}较小的黑色石头{}。
click Charged Core
|tip 它们看起来像桌子上的{o}蓝色水晶{}。
click Ore Barrel
|tip 附近好像有一个{o}装满泥土和石头的桶{}。
锻造灯笼 |q 79336/2 |goto 57.06,42.45
step
talk Korgran##216169
|tip 建筑内部
turnin The Forging of Memories##79336 |goto 57.06,42.49
accept The Last Journey##79337 |goto 57.06,42.49
step
观看对话
talk Urtago##213187
|tip 她最终跑到了这里。
turnin The Last Journey##79337 |goto 57.47,42.94
accept The Lost Earthen##79338 |goto 57.47,42.94
step
与乌尔塔戈会面 |q 79338/1 |goto 61.00,43.89
step
click Korgran's Lantern
找到科格兰 |q 79338/2 |goto 61.36,43.70
step
talk Korgran##216171
选择 _“<向 Korgran 展示灯笼>”_ |gossip 120893
告诉他_"她叫乌塔戈。她在等你。"_ |gossip 120892
观看对话
|tip 跟着{o}科格兰{}走。
与 Korgran 交谈 |q 79338/3 |goto Isle of Dorn/0 61.38,43.71
'|clicknpc Korgran##216877
step
talk Urtago##216878
turnin The Lost Earthen##79338 |goto 60.99,43.90
accept A Change of Tradition##79339 |goto 60.99,43.90
step
talk Urtago##216173
turnin A Change of Tradition##79339 |goto 69.82,56.77
accept Tools of Declaration##79340 |goto 69.82,56.77
accept Cleansing Ashes##79341 |goto 69.82,56.77
stickystart "Collect_Ashenfolds"
step
kill Shalehorn Impaler##216970+
collect 4 Pristine Horn##213171 |q 79340/1 |goto 66.94,56.06
step
label "Collect_Ashenfolds"
click Ashenfold+
|tip 它们看起来像是{o}一群白色的花朵{}。
collect 6 Ashenfold##213157 |q 79341/1 |goto 67.38,55.97
step
talk Urtago##216173
turnin Tools of Declaration##79340 |goto 69.82,56.77
turnin Cleansing Ashes##79341 |goto 69.82,56.77
accept As He Departs##79342 |goto 69.82,56.77
step
click Incense
上香 |q 79342/1 |goto 69.84,56.79
step
talk Korgran##216174
选择_"<把号角交给 Korgran。 |gossip 120638
将号角交给科格兰 |q 79342/2 |goto 69.85,56.76
step
观看对话
结束仪式 |q 79342/3 |goto 69.85,56.76
step
talk Urtago##216173
turnin As He Departs##79342 |goto 69.82,56.77
step
观看对话
talk Urtago##224930
accept The Weight of Duty##82895 |goto 69.89,57.04
step
talk Urtago##224948
|tip 建筑内部
告诉她_"我准备好帮忙了。 |gossip 122723
在瀑布哨站与乌尔塔戈对话 |q 82895/1 |goto 57.30,42.86
step
click New Placard
|tip 建筑内部
收集新牌匾 |q 82895/2 |goto 57.36,42.53
step
click Forge Tongs
|tip 建筑内部
加热牌 |q 82895/3 |goto 57.23,42.79
step
click Quenching Oil
淬火牌 |q 82895/4 |goto 57.37,43.05
step
click Tempered Placard
雕刻回火牌 |q 82895/5 |goto 57.06,43.49
step
talk Urtago##224948
turnin The Weight of Duty##82895 |goto 57.18,43.36
step
完成 “华而不实 ”任务 |complete completedq(78837)
|tip 使用 {o}Ringing Deeps (Story Only) leveling guide{} 来完成这个任务。
|tip 你可能需要使用{o}多恩岛（仅限剧情）{}通关指南来解锁{o}响铃深渊{}的战役任务。
step
talk Saradi##225426
accept The Councilward's Summons##79542 |goto The Ringing Deeps/0 47.50,32.67
step
talk Machinist Kittrin##212695
|tip 建筑内部
accept Discarded and Broken##78562 |goto 48.24,33.39
step
click Machinist Plinth
collect Machinist's Gauge##210733 |q 78562/1 |goto 46.68,29.38
step
click Machinist Plinth##411622
collect Machinist's Calipers##210732 |q 78562/2 |goto 52.47,34.11
step
click Machinist Plinth##411624
|tip 在靠近地面的建筑顶部。
collect Machinist's Wrench##210734 |q 78562/3 |goto 50.06,36.64
step
talk Machinist Kittrin##212695
|tip 建筑内部
turnin Discarded and Broken##78562 |goto The Ringing Deeps/0 48.24,33.39
accept The Weight of a World##78563 |goto The Ringing Deeps/0 48.24,33.39
step
kill Oath-Eater##206844
collect Machinist's Calibrated Weight##210740 |q 78563/1 |goto The Ringing Deeps/0 44.61,31.48
step
talk Machinist Kittrin##212695
|tip 建筑内部
turnin The Weight of a World##78563 |goto The Ringing Deeps/0 48.24,33.39
accept Reforged Purpose##78564 |goto The Ringing Deeps/0 48.24,33.39
step
talk Machinist Kittrin##212695
|tip 建筑内部
告诉他 _“我准备好帮你重新锻造工具了”_ |gossip 120147
与凯特琳对话 |q 78564/1 |goto The Ringing Deeps/0 48.24,33.39
step
clicknpc Spattered Charcoal##214843+
|tip 他们会出现在附近的地面上。
|tip 建筑内部
踢碎飞溅的木炭 |q 78564/2 |goto The Ringing Deeps/0 48.24,33.39
修复所有工具 |q 78564/3 |goto The Ringing Deeps/0 48.24,33.39
step
观看对话
|tip 建筑内部
talk Machinist Kittrin##212695
turnin Reforged Purpose##78564 |goto The Ringing Deeps/0 48.23,33.39
step
talk Merrix##217069
|tip 建筑内部
告诉他_"和平守护者克拉加德让我把这些收据带给您。 |gossip 121397
在理事长崛起处与梅里克斯会面 |q 79542/1 |goto Dornogal/0 55.23,6.19
step
talk Merrix##217069
|tip 建筑内部
turnin The Councilward's Summons##79542 |goto Dornogal/0 55.23,6.19
accept Dornogal's Benefactor##79543 |goto Dornogal/0 55.23,6.19
step
talk Aufta##219431
|tip 建筑内部
告诉她_“我有一批来自共同朋友的货物要给你”_ |gossip 121217
交付水疗用品 |q 79543/1 |goto Dornogal/0 32.11,24.67
step
talk Gostrof##217080
告诉他_“我从一位共同的朋友那里带来了一份礼物”_ |gossip 121218
运送乡村用品 |q 79543/2 |goto Dornogal/0 58.45,62.12
step
talk Trader Harthan##217081
告诉他_“我从一位共同的朋友那里带来了一份礼物”_ |gossip 121219
递送关怀包裹 |q 79543/3 |goto Dornogal/0 52.29,52.24
step
talk Trader Harthan##217081
告诉他_“我在听”_ |gossip 121405
与哈桑通话 |q 79543/4 |goto Dornogal/0 52.29,52.24
step
talk Merrix##217095
turnin Dornogal's Benefactor##79543 |goto Dornogal/0 49.34,26.26
accept Security Through Trade##79544 |goto Dornogal/0 49.34,26.26
step
talk Bevrusi##217072
告诉她_“我听说你能让我进私人的机器音箱酒吧”_ Tell her _“I'm told you could get me into the private Machine Speaker speakeasy.” _ |gossip 121407
与贝弗鲁西交谈 |q 79544/1 |goto Dornogal/0 55.61,50.23
step
talk Bevrusi##217072
问她 _“您想交易什么？”_ |gossip 121412
看看贝弗鲁西会交易什么 |q 79544/2 |goto Dornogal/0 55.61,50.23
step
talk Bevrusi##217072
turnin Security Through Trade##79544 |goto Dornogal/0 55.61,50.23
accept The Market Reeve of the Forgegrounds##79545 |goto Dornogal/0 55.61,50.23
step
接近沃克格雷特 |q 79545/1 |goto Dornogal/0 45.06,48.93
step
talk Ronesh##212370
|tip 建筑内部
buy Fresh Mug of Cinderbrew Mead##219961 |n
获得煤渣酒 |q 79545/2 |goto Dornogal/0 44.72,46.40
step
talk Vokgret##217091
问她_"这是你的煤渣酒。现在，我们可以做生意了吗？ |gossip 121505
把煤渣酒带给沃克格雷特 |q 79545/3 |goto Dornogal/0 45.06,48.93
step
talk Vokgret##217091
告诉她_"我在寻找液态蛋白石。我听说你有资源可以获得一些。 |gossip 121504
询问如何获得一小瓶液体蛋白石 |q 79545/4 |goto Dornogal/0 45.06,48.93
step
talk Loldren##217090
|tip 建筑内部
告诉他_“沃克格雷特派我来收集一些文件”。 |gossip 121507
与洛德伦对话 |q 79545/5 |goto Dornogal/0 48.33,73.09
step
click Auditor's Manifest
|tip 建筑内部
选择 _“<开始填写表格上的空白部分>”________________________。 |gossip 121512
告诉他_"平底锅之王： 土制烹饪工具历史指南"_ |gossip 121509
告诉_“贝尔加”_ |gossip 121519
告诉_“辣椒供应商”_ |gossip 123990
签署采购单 |q 79545/6 |goto Dornogal/0 48.27,73.18
审核洛德伦的市场 |q 79545/7 |goto Dornogal/0 48.27,73.18
step
talk Nernabel##217088
|tip 建筑内部
告诉她_“洛德伦要求您在这份文件上签名”_。 |gossip 121452
问她_“我在哪里能为你找到岩浆核心？”_ |gossip 121528
与奈娜贝尔通话 |q 79545/8 |goto Dornogal/0 49.59,73.11
step
click Sizzling Magma Core
|tip 建筑内部
|tip 你会受到攻击。
collect Sizzling Magma Core##211863 |q 79545/9 |goto Dornogal/0 50.44,63.78
step
talk Nernabel##217088
|tip 建筑内部
告诉她_"我给你带来了一个岩浆核心。一个元素攻击了我，让我惹了麻烦。 |gossip 121547
获得妮娜贝尔的签名 |q 79545/10 |goto Dornogal/0 49.59,73.11
step
talk Vokgret##217091
turnin The Market Reeve of the Forgegrounds##79545 |goto Dornogal/0 45.06,48.93
accept Opals and Runes##79176 |goto Dornogal/0 45.06,48.93
step
talk Bevrusi##217072
问她 _“您想交易什么？”_ |gossip 121412
buy Speakeasy Passrune##217414 |n
交换通行证 |q 79176/1 |goto Dornogal/0 55.61,50.23
step
talk Merrix##217097
turnin Opals and Runes##79176 |goto Dornogal/0 60.52,33.07
accept The Machine Speakeasy##79546 |goto Dornogal/0 60.52,33.07
step
进入建筑 |goto Dornogal/0 61.51,34.55 < 15 |walk
在隧道中与梅里克斯会面 |q 79546/1 |goto Dornogal/0 62.86,40.69
|tip 建筑内部
step
talk Speakeasy Runeguard##220564
|tip 建筑内部
选择 _“<将帕斯鲁恩追踪到巨人身上>”_ |gossip 121576
打开酒馆 |q 79546/2 |goto Dornogal/0 62.36,40.28
step
talk Obstorn##217082
|tip 建筑内部
告诉他_"听他说完。梅里克斯只想让你转告阿德格林一个消息。 |gossip 121577
kill Obstorn##217082
面对奥布斯托恩 |q 79546/3 |goto Dornogal/0 62.04,37.65
step
talk Merrix##219566
|tip 建筑内部
turnin The Machine Speakeasy##79546 |goto Dornogal/0 62.10,38.67
step
ding 80
step
click Angrily-Scrawled Poster##429303
accept Sedition##79526 |goto Dornogal/0 45.90,47.17
step
talk Merrix##219400
|tip 建筑内部
turnin Sedition##79526 |goto Dornogal/0 55.61,5.58
accept Damage Mitigation##79527 |goto Dornogal/0 55.61,5.58
accept Dispelling Rumors##79528 |goto Dornogal/0 55.61,5.58
stickystart "Tear_Down_Seditious_Posters"
step
clicknpc Murmuring Peacekeeper##219449+
|tip 他们看起来像{o}装甲矮人{}。
|tip 你可能会遭到攻击。
驱散#6#喃喃自语的和平卫士 |q 79528/1 |goto Dornogal/0 47.93,28.31
step
label "Tear_Down_Seditious_Posters"
click Seditious Poster+
|tip 他们看起来像钉在墙上的{o}纸张{}。
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
撕下 #8# 煽动叛乱的海报 |q 79527/1 |goto Dornogal/0 47.93,28.31
step
talk Merrix##219400
|tip 建筑内部
turnin Damage Mitigation##79527 |goto Dornogal/0 55.61,5.57
turnin Dispelling Rumors##79528 |goto Dornogal/0 55.61,5.57
accept Forcing My Hand##79529 |goto Dornogal/0 55.61,5.57
step
click Bundled Cloak
|tip 建筑内部
携带斗篷 |havebuff Carrying Cloak##441006 |goto Dornogal/0 55.08,6.38 |q 79529
step
clicknpc Merrix##219400
|tip 建筑内部
把斗篷交给梅里克斯 |q 79529/1 |goto Dornogal/0 55.61,5.57
step
click Accessory Chest
|tip 建筑内部
携带手套 |havebuff Carrying Gloves##441007 |goto Dornogal/0 56.38,5.95 |q 79529
step
clicknpc Merrix##219400
|tip 建筑内部
将手套交给梅里克斯 |q 79529/2 |goto Dornogal/0 55.61,5.58
step
clicknpc Gilded Knuckles##220092
|tip 建筑内部
携带武器 |havebuff Carrying Weapons##441008 |goto Dornogal/0 55.36,5.60 |q 79529
step
clicknpc Merrix##219400
|tip 建筑内部
将武器交给梅里克斯 |q 79529/3 |goto Dornogal/0 55.61,5.57
step
click Titan Device
|tip 建筑内部
携带泰坦装置 |havebuff Carrying Titan Device##441009 |goto Dornogal/0 55.85,6.67 |q 79529
step
clicknpc Merrix##219400
|tip 建筑内部
将泰坦装置交给梅里克斯 |q 79529/4 |goto Dornogal/0 55.61,5.58
step
talk Steelvein##219475
|tip 建筑内部
turnin Forcing My Hand##79529 |goto Dornogal/0 55.61,5.58
accept Bad Business##79530 |goto Dornogal/0 55.61,5.58
step
在环形深渊与钢爪重组 |q 79530/1 |goto The Ringing Deeps/0 42.78,23.93
step
talk Overseer Ardgrin##219477
|tip 建筑内部
告诉他_“钢铁之躯来找你了”_ |gossip 121524
观看对话
kill Sparking Haulbot##219497+
与监督者阿德格林对峙 |q 79530/2 |goto The Ringing Deeps/0 42.21,24.12
'|kill Sparking Haulbot##220191
step
talk Steelvein##220192
turnin Bad Business##79530 |goto The Ringing Deeps/0 42.48,23.94
step
achieve The War Within##20597
|tip 使用{o}内部战争战役{}指南来完成这个任务。
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Intro & Isle of Dorn (Story Only)",{
author="support@zygorguides.com",
},[[
step
accept The War Within##81930 |goto Stormwind City/0 63.19,72.02
|tip 你将自动接受这个任务。
|only if Alliance
step
use the Teleportation Scroll##227669
传送到西里瑟斯 |complete zone("Silithus") |q 81930
|only if Alliance
step
在西里瑟斯见到杰娜 |q 81930/2 |goto Silithus/0 41.93,45.11
|only if Alliance
step
talk Zidormi##128607
问她_"你能让我回到现在吗？ |gossip 47635
穿越时空前往新西里图斯 |complete not ZGV.InPhase("Old Silithus") |goto Silithus/0 78.93,21.97 |q 81930
|only if Alliance
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##81930 |goto 41.93,45.11
|only if Alliance
step
accept The War Within##78713
|tip 你将自动接受这个任务。
|only if Horde
step
use the Teleportation Scroll##227669
传送到西里瑟斯 |complete zone("Silithus") |q 78713
|only if Horde
step
在西里瑟斯见到鲛人 |q 78713/2 |goto Silithus/0 41.93,45.11
|only if Horde
step
talk Zidormi##128607
问她_"你能让我回到现在吗？ |gossip 47635
穿越时空前往新西里图斯 |complete not ZGV.InPhase("Old Silithus") |goto Silithus/0 78.93,21.97 |q 78713
|only if Horde
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##78713 |goto 41.93,45.11
|only if Horde
step
talk Thrall##213620
accept A Poor Reception##78714 |goto Silithus/0 41.96,45.05 |noautoaccept
_Or_
选择 _"我以前听过这个故事。<跳过达拉然介绍，前往多诺加尔。 |gossip 123176 |noautogossip
|tip 如果你{o}已经完成了这个任务{}，你可以{o}跳过介绍任务{}。
step
重定向至跳过介绍 |next "Skip_Isle_Of_Dorn_Intro"
|only if completedq(83621) or completedq(83543)
step
click Titan Translocator
进入心之密室 |q 78714/1 |goto 43.20,44.49
step
talk Magni Bronzebeard##213624
turnin A Poor Reception##78714 |goto Chamber of Heart/2 50.06,65.19
accept Azeroth's Voice##78715 |goto Chamber of Heart/2 50.06,65.19
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 56.50,64.69 |count 1
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 50.14,74.00 |count 2
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 43.90,64.72 |count 3
step
talk Magni Bronzebeard##213624
告诉他_"我准备好了。我们开始吧。 |gossip 120882
与麦格尼对话以开始仪式 |q 78715/2 |goto 50.06,65.21
step
talk Lady Jaina Proudmoore##213625
turnin Azeroth's Voice##78715 |goto 49.53,58.51
accept Painful Lessons##78716 |goto 49.53,58.51
step
click Portal to Dalaran
带着杰娜的传送门前往达拉然 |q 78716/1 |goto 53.43,58.01
step
在达拉然与卡德加会面 |q 78716/2 |goto Dalaran L/12 46.80,54.47
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin Painful Lessons##78716 |goto 42.87,59.86
step
talk Moira Thaurissan##214651
|tip 建筑内部
accept The Bronzebeard Family##80500 |goto 40.39,54.13
step
talk Brann Bronzebeard##214669
|tip 建筑内部
告诉他_"麦格尼受伤了。莫伊拉需要你们两个去肖像室。"_ |gossip 121542
與布蘭恩對話 |q 80500/1 |goto Dalaran L/10 50.73,55.59
step
talk Moira Thaurissan##214651
|tip 建筑内部
turnin The Bronzebeard Family##80500 |goto Dalaran L/12 40.35,54.03
step
talk Moira Thaurissan##214651
turnin Slept Like a Rock##81966 |goto Dalaran L/12 43.48,54.90
|only if haveq(81966) or completedq(81966)
step
talk Magni Bronzebeard##213624
|tip 建筑内部
accept A Mysterious Warning##78717 |goto Dalaran L/12 45.33,57.32
step
talk Archmage Khadgar##213627
|tip 建筑内部
告诉他_“我在这里等你”_ |gossip 121395
与卡德加交谈 |q 78717/1 |goto Dalaran L/12 42.84,59.91
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin A Mysterious Warning##78717 |goto Dalaran L/12 41.13,62.32
accept Citizens of Dalaran##78719 |goto Dalaran L/12 41.13,62.32
step
talk Brann Bronzebeard##214669
|tip 建筑内部
accept Meet the Team##78721 |goto Dalaran L/12 47.05,49.11
step
talk Archmage Drenden##214665
|tip 建筑内部
accept Strengthen the Wards##78718 |goto Dalaran L/12 56.41,33.22
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 52.66,35.03 |count 1
|tip 使用{o}吃食物{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 51.00,23.72 |count 1
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 42.65,34.27 |count 2
|tip 使用{o}捕捉蝴蝶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Elise Starseeker##220018
告诉她_“布兰恩让我来看看你”_ |gossip 121860
查看阿尔加里远征队的情况 |q 78721/1 |goto Dalaran L/10 37.62,46.25
step
use the Tuning Wand##220483
|tip 建筑内部
加强守卫 |q 78718/1 |goto Dalaran L/10 30.90,48.96 |count 2
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 45.04,72.14 |count 3
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 53.95,61.58 |count 3
|tip 使用{o}保护货架{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 60.73,61.58 |count 4
step
talk Archmage Drenden##214665
|tip 建筑内部
turnin Strengthen the Wards##78718 |goto Dalaran L/12 56.42,33.15
step
talk Brann Bronzebeard##214669
|tip 建筑内部
turnin Meet the Team##78721 |goto Dalaran L/12 47.06,49.12
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin Citizens of Dalaran##78719 |goto Dalaran L/12 41.11,62.31
accept To Khaz Algar!##78722 |goto Dalaran L/12 41.11,62.31
step
talk Archmage Khadgar##213627
|tip 建筑内部
告诉他_“我准备出发了”_ |gossip 120143
与卡德加交谈 |q 78722/1 |goto Dalaran L/12 41.11,62.31
step
talk Alleria Windrunner##214908
|tip 建筑内部
turnin To Khaz Algar!##78722 |goto Dalaran TWW/0 50.45,50.45
accept Breach##79105 |goto Dalaran TWW/0 50.45,50.45
stickystart "Slay_The_Nerubians_79105"
step
clicknpc Professor Pallin##222425
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 58.68,50.37 |count 1
step
clicknpc Sabriana Sorrowgaze##222424
拯救公民 |q 79105/1 |goto Dalaran TWW/0 57.82,52.89 |count 2
step
clicknpc Lianna Tai##222426
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 58.83,54.36 |count 3
step
clicknpc Glaciela Rimebang##222474
拯救公民 |q 79105/1 |goto Dalaran TWW/0 57.93,57.12 |count 4
step
clicknpc Sandra Bartan##222446
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 53.34,53.45 |count 5
step
clicknpc Ol' Toomba##222447
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.89,53.22 |count 6
step
clicknpc Amisi Azuregaze##222445
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.56,57.24 |count 7
step
clicknpc Fialla Sweetberry##222473
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.03,62.21 |count 8
step
clicknpc Lucian Trias##222433
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.32,65.78 |count 9
step
clicknpc Kizi Copperclip##222449
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 53.24,66.66 |count 10
step
label "Slay_The_Nerubians_79105"
杀死周围的敌人
杀死努比亚人 |q 79105/2 |goto Dalaran TWW/0 56.03,64.29
'|kill Drone Abductor##219655, Nerubian Venomspitter##219661, Nerubian War-Weaver##219657, Pestilent Drone##219653, Rampaging Threadling##219664, Small Threadling##219662
step
talk Alleria Windrunner##214908
turnin Breach##79105 |goto Dalaran TWW/0 35.73,71.34
accept Rupture##79106 |goto Dalaran TWW/0 35.73,71.34
step
返回城市 |q 79106/1 |goto Dalaran TWW/0 41.20,59.43
step
浏览下水道 |q 79106/2 |goto Dalaran TWW/1 39.37,51.95
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 51.31,51.12 |count 1
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 50.57,59.01 |count 2
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 55.06,57.76 |count 3
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 58.04,53.06 |count 4
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 60.85,49.00 |count 5
step
click Sewer Grate
进入下水道 |q 79106/4 |goto Dalaran TWW/1 66.80,50.81
step
将市民带到安全地带 |q 79106/5 |goto Dalaran TWW/2 72.55,57.77
step
talk Anduin Wrynn##219885
|tip 他就会跑到这个位置。
turnin Rupture##79106 |goto Dalaran TWW/2 72.55,57.77
accept Departure##80321 |goto Dalaran TWW/2 72.55,57.77
step
寻找其他出口 |q 80321/1 |goto Dalaran TWW/2 23.20,79.68
step
跑上楼梯 |goto Dalaran TWW/2 12.46,78.64 < 10 |walk
返回地面 |q 80321/2 |goto Dalaran TWW/0 40.95,36.44
step
kill Queensguard An'Jak Shabtir##219665 |q 80321/3 |goto Dalaran TWW/0 42.80,33.73
step
talk Archmage Khadgar##219956
问他_“你需要我做什么？”_ |gossip 124153
与卡德加交谈 |q 80321/4 |goto Dalaran TWW/0 44.47,37.57
step
click Khadgar's Portal##433329
turnin Departure##80321 |goto Dalaran TWW/0 44.13,36.59
step
accept Violent Impact##78529
|tip 你将自动接受这个任务。
|only if not (completedq(83621) or completedq(83543))
step
click Pile of Rubble
|tip 你被埋在下面的{o}灰色大石头。
|tip 点击{o}多次{}。
逃离废墟 |q 78529/1 |goto Isle of Dorn/0 28.91,54.53
|only if not (completedq(83621) or completedq(83543))
step
label "Skip_Isle_Of_Dorn_Intro"
talk Brann Bronzebeard##206017
|tip 建筑内部
accept Adventuring in Khaz Algar##83543 |goto Dornogal/0 47.40,44.41
|only if completedq(83621) or completedq(83543)
step
click Scouting Map
|tip 它看起来就像桌子上的一张{o}大牛皮纸地图{}。
|tip 你正在选择要在哪个区域做任务。
|tip {随便选一个，无所谓。
accept Isle of Dorn##83548 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83548)
accept The Ringing Deeps##83550 |goto Dornogal/0 48.26,43.79	|or |only if not completedq(83550)
accept Hallowfall##83551 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83551)
accept Azj-Kahet##83552 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83552)
从侦察地图中选择一个区域 |q 83543/1 |goto Dornogal/0 48.26,43.79 |only if haveq(83543)
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
_Click the Quest Complete Box:_
|tip 在任务追踪区
turnin Adventuring in Khaz Algar##83543
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
_Which Zone Did You Choose?_
|tip 点击下方你想要完成任务的区域。
多恩岛		|confirm	|next "Isle_Of_Dorn"
响铃深渊	|confirm	|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\响铃深渊 (Story Only)"
万圣节降临		|confirm	|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\万圣节降临 (Story Only)"
阿兹-卡赫特岛		|confirm	|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\阿兹-卡赫特岛 (Story Only)"
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
label "Isle_Of_Dorn"
talk Thrall##211993
turnin Violent Impact##78529 |goto Isle of Dorn/0 29.45,55.07
|only if ((haveq(78529) or completedq(78529)) and not haveq(83548)) and Horde
step
talk Lady Jaina Proudmoore##211994
turnin Violent Impact##78529 |goto Isle of Dorn/0 29.51,55.01		|only if ((haveq(78529) or completedq(78529)) and not haveq(83548)) and Alliance
turnin Isle of Dorn##83548 |goto Isle of Dorn/0 29.51,55.01		|only if haveq(83548) or completedq(83548)
accept Slay the Saboteurs##78530 |goto Isle of Dorn/0 29.51,55.01
step
talk Thrall##211993
accept Urgent Recovery##78531 |goto 29.45,55.07
stickystart "Slay_Nerubians"
step
click Hastily-Prepared Antidote
援助坠机幸存者 |q 78531/1 |goto 30.22,54.60 |count 1
step
click Tower Fragment
援助坠机幸存者 |q 78531/1 |goto 30.57,53.86 |count 3
step
click Dalaran Power Shard
援助坠机幸存者 |q 78531/1 |goto 30.36,52.74 |count 4
step
click Rittsyn's Soulstone
援助坠机幸存者 |q 78531/1 |goto 31.41,54.20 |count 5
step
clicknpc Polymorphed Victim##214543
|tip 它看起来像一只只{o}友好的绵羊{}，在这个小区域里走来走去。
援助坠机幸存者 |q 78531/1 |goto 31.09,55.32 |count 6
step
click Sunreaver Satchel
援助坠机幸存者 |q 78531/1 |goto 30.92,55.13 |count 7
step
talk Archmage Aethas Sunreaver##223166
accept Erratic Artifacts##78532 |goto 30.95,55.11
step
clicknpc Damaged Arcane Relic##212795+
|tip 它们看起来像是{o}蓝色和粉色的漂浮水晶{}。
摧毁 #5# 损坏的奥术遗物 |q 78532/1 |goto 31.50,55.94
step
label "Slay_Nerubians"
杀死周围的敌人
杀死 #12# 奈鲁比人 |q 78530/1 |goto 30.69,54.44
'|kill Devious Webspinner##212717, Burrowing Saboteur##212715, Burrowing Saboteur##228057
step
talk Lady Jaina Proudmoore##211994
turnin Slay the Saboteurs##78530 |goto 29.50,55.01
turnin Erratic Artifacts##78532 |goto 29.50,55.01
step
talk Lady Jaina Proudmoore##211994
turnin Slay the Saboteurs##78530 |goto 29.50,55.01
turnin Erratic Artifacts##78532 |goto 29.50,55.01
step
talk Thrall##211993
turnin Urgent Recovery##78531 |goto 29.45,55.07
step
观看对话
talk Anduin Wrynn##212450
accept Secure the Beach##78533 |goto 29.53,54.98
step
与麦格尼重组 |q 78533/1 |goto 30.31,56.08
step
kill Queensguard Zirix##211858
抵挡女王卫队齐里克斯 |q 78533/2 |goto 30.19,56.53
step
观看对话
抵御齐里克斯的虫群 |q 78533/3 |goto 30.19,56.53
step
talk Baelgrim##211859
turnin Secure the Beach##78533 |goto 30.42,55.73
accept To Dornogal##78534 |goto 30.42,55.73
step
在多诺加尔与贝尔格里姆会面 |q 78534/3 |goto Dornogal/0 33.57,75.20
|tip 在墙的顶端。
step
talk Baelgrim##216628
|tip 在墙的顶端。
turnin To Dornogal##78534 |goto 33.57,75.20
accept They Come from Below##78535 |goto 33.57,75.20
step
clicknpc Lokren##212696
|tip 在墙的顶端。
登上洛肯山 |q 78535/1 |goto 33.91,75.71
step
_As You Fly:_
杀死周围的敌人
|tip 它们看起来像{o}各种蜘蛛敌人{}。
|tip 使用行动条上的能力。
杀死努比亚入侵者 |q 78535/2
step
观看样片
与贝尔格里姆会合 |q 78535/3
step
talk Baelgrim##217852
turnin They Come from Below##78535 |goto 36.20,64.23
accept Impossible Odds##78536 |goto 36.20,64.23
step
talk Thrall##219757
问他 _“计划是什么？”_ |gossip 121391
与鲛人对话 |q 78536/1 |goto 36.49,65.37
step
talk Baelgrim##217852
turnin Impossible Odds##78536 |goto Dornogal/0 36.21,64.22
accept Hypocenter##78460 |goto Dornogal/0 36.21,64.22
step
clicknpc Coreway Worker##216985
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 35.08,66.48 |count 1
step
clicknpc Coreway Worker##219992
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.47,66.77 |count 2
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.36,64.73 |count 3
step
click Dead Earthen
|tip 他在瓦砾下面。
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.42,64.73 |count 4
step
clicknpc Coreway Worker##219993
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.64,64.10 |count 5
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.95,62.60 |count 6
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.27,60.80 |count 7
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.27,59.37 |count 8
step
talk Baelgrim##217853
|tip 建筑内部
turnin Hypocenter##78460 |goto Dornogal/0 29.65,59.68
step
talk Speaker Brinthe##217857
|tip 建筑内部
accept The Archive##78468 |goto Dornogal/0 29.39,59.94
step
talk Merrix##217854
|tip 建筑内部
accept Stones of Dornogal##78457 |goto Dornogal/0 29.40,59.45
step
使用棱镜法典查看记忆宝石 |q 78468/1 |goto Dornogal/0 29.22,59.68
|tip 使用 {o}Prismatic Codex{} 能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 楼内楼上
step
click Archival Repository
|tip 楼内楼上
将记忆宝石存入档案库 |q 78468/2 |goto Dornogal/0 29.22,59.68
step
talk Speaker Brinthe##217857
|tip 建筑内部
turnin The Archive##78468 |goto Dornogal/0 29.39,59.94
step
talk Oathsworn Peacekeeper##219014
告诉他们_“职业训练师”_ |gossip 122786
向守卫询问有关职业训练师的信息 |q 78457/1 |goto Dornogal/0 30.64,60.17
step
talk Breem##212369
|tip 楼外楼上。
选择 _“<用议会守护者的标记介绍自己>”_ |gossip 120909
与飞行大师布雷姆对话 |q 78457/2 |goto Dornogal/0 44.67,51.16
step
talk Breem##212369
fpath Dornogal |goto Dornogal/0 44.67,51.16
step
talk Ronesh##212370
|tip 建筑内部
选择 _“<用议会守护者的标记介绍自己>”_ |gossip 120913
与旅店老板罗内什交谈 |q 78457/3 |goto Dornogal/0 44.73,46.41
step
talk Ronesh##212370
|tip 建筑内部
home Dornogal |goto Dornogal/0 44.73,46.41 |q 78457
step
talk Brann Bronzebeard##206017
|tip 建筑内部
问他 _"你来了，布兰！这是怎么回事？ |gossip 122129
与布兰恩-铜须对话 |q 78457/4 |goto Dornogal/0 47.39,44.41
step
talk Auditor Balwurz##223728
|tip 建筑内部
对审计员巴尔沃茨说 |q 78457/5 |goto Dornogal/0 39.09,24.15
step
talk Merrix##217861
|tip 建筑内部
turnin Stones of Dornogal##78457 |goto Dornogal/0 39.87,26.00
accept State of the Union##78459 |goto Dornogal/0 39.87,26.00
step
talk Merrix##217861
|tip 建筑内部
告诉他_“告诉我多诺戈尔议会的事”_ Tell him _“Tell me about the Council of Dornogal.” _ |gossip 122305 |noautogossip
|tip 你可以观看对话，或者选择{o}“<略过对话>下次再告诉我”{}。
与梅瑞克斯对话 |q 78459/1 |goto Dornogal/0 39.87,26.00
step
talk Merrix##217861
|tip 建筑内部
turnin State of the Union##78459 |goto Dornogal/0 39.87,26.00
step
talk Moira Thaurissan##217864
|tip 建筑内部
accept The Fourth Seat##78461 |goto Dornogal/0 40.55,25.84
step
click Earthen Teleporter
|tip 建筑内部
使用土遁术 |q 78461/1 |goto Dornogal/0 40.73,22.33
step
在基础大厅顶端与贝尔格里姆会合 |q 78461/2 |goto Dornogal/0 40.68,28.37
step
talk Adelgonn##217879
问她_“你是阿德尔贡吗？”_ |gossip 122307
找到阿德尔贡 |q 78461/3 |goto Isle of Dorn/0 41.86,72.64
step
talk Adelgonn##217879
turnin The Fourth Seat##78461 |goto 41.86,72.64
accept Delve into the Earth##78464 |goto 41.86,72.64
step
talk Iridi##217439
fpath Freywold Village |goto 41.04,72.93
step
前往地爬矿洞潜行 |q 78464/1 |goto 38.87,73.27
step
talk Brann Bronzebeard##213030
告诉他_"我们去拯救地穴中的土人吧。 |gossip 120958
与布兰恩-铜须对话 |q 78464/2 |goto 38.87,73.27
step
click Explorer's League Supplies
选择 _“<查看布兰恩-铜须的补给>”_ |gossip 122660
打开探险家联盟补给 |q 78464/3 |goto 38.90,73.28
step
为布兰恩-铜须选择战斗角色 |q 78464/4 |goto 38.90,73.28
|tip 按照屏幕上的指示操作。
step
进入地爬矿洞 |q 78464/5 |goto 38.55,73.93
|tip 穿过{o}传送门{}进入深渊。
|tip 进入小矿洞。
step
完成地爬矿洞目标 |q 78464/6
|tip 完成探险非常简单。
step
找到地窖宝藏 |q 78464/7
|tip 打开矿洞里的宝箱
step
离开地爬矿洞深入探险 |complete not subzone("Earthcrawl Mines") |q 78464
|tip 点击矿洞内{o}宝藏{}附近的{o}Leave-O-Bot 7000{}。
|tip 穿过{o}传送门{}离开深渊。
step
talk Brann Bronzebeard##213030
问他 _“你现在要做什么？”_ |gossip 120969
在地穴外与布兰恩-布朗泽比德交谈 |q 78464/8 |goto Isle of Dorn/0 38.75,73.30
step
talk Adelgonn##217879
turnin Delve into the Earth##78464 |goto 41.86,72.64
accept A Natural Remedy##79553 |goto 41.86,72.64
step
talk Baelgrim##217881
accept Building Blocks##78463 |goto 41.77,72.66
stickystart "Collect_Glittering_Ore"
step
杀死周围的敌人
collect 10 Fungarian Chunks##213233 |q 79553/1 |goto 36.07,74.91
'|kill Scarlet Stinkcap##212579, Budling Morel##212577, Rustul Titancap##213115, Agaric Spreader##212578
step
label "Collect_Glittering_Ore"
click Unsorted Ore Pile+
|tip 它们看起来像一大堆{o}灰色岩石{}，里面有{o}红色宝石{}。
click Ore Fragment+
|tip 它们看起来像{o}红色的小晶体{}。
collect 20 Glittering Ore##211962 |q 78463/1 |goto 36.07,74.91
step
talk Baelgrim##217881
turnin Building Blocks##78463 |goto 41.76,72.91
step
talk Adelgonn##217879
turnin A Natural Remedy##79553 |goto 41.86,72.63
accept Echoes of Compassion##78462 |goto 41.86,72.63
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.75,72.43 |count 1
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.83,72.35 |count 2
step
clicknpc Injured Earthen##223459
医治受伤的艾尔特恩 |q 78462/1 |goto 42.07,72.62 |count 3
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.94,72.99 |count 4
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.92,73.01 |count 5
step
talk Findorn##216109
选择 _“<把芬多恩抬到水池边>”_ |gossip 120682
拾起芬多恩 |q 78462/2 |goto 41.79,72.96
step
clicknpc Findorn##217502
将芬多恩放入水池中 |q 78462/3 |goto 41.87,72.75
step
talk Ebona##216111
询问她_"艾伯纳怎么样了？ |gossip 120684
评估艾伯纳 |q 78462/4 |goto 41.86,72.67
step
观看对话
talk Adelgonn##217879
turnin Echoes of Compassion##78462 |goto 41.86,72.64
step
talk Moira Thaurissan##217878
accept The Proscenium##78470 |goto Isle of Dorn/0 41.89,72.69
step
talk Moira Thaurissan##217898
turnin The Proscenium##78470 |goto 56.53,52.03
step
talk Baelgrim##217766
accept The Cavalry is Here##79701 |goto 56.56,52.02
step
talk Wenbrandt##212295
accept Fire in the Hole##79721 |goto 56.67,52.10
step
click Cinderbrew Keg
拿起煤渣酒桶 |q 79721/1 |goto 56.66,52.02
step
把煤渣酒扔进洞穴 |q 79721/2 |goto 56.74,52.13
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
stickystart "Repel_The_Nerubian_Invasion"
step
让尼鲁比安崩溃  |q 79721/3 |goto 58.22,50.49 |count 1
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
让尼鲁比安崩溃  |q 79721/3 |goto 56.79,49.37 |count 2
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
让尼鲁比安崩溃  |q 79721/3 |goto 55.03,49.49 |count 3
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
检查 Alleria Windrunner |q 79701/2 |goto 56.26,50.25
step
label "Repel_The_Nerubian_Invasion"
杀死周围的敌人
|tip 其中一些会飞向空中。
击退努比亚人的入侵 |q 79701/1 |goto 56.59,50.94
'|kill Nerubian Swarmer##216197, Clotweave Widow##216193, Venombane Spitter##216192, Armored Scuttler##216194, Necrofang Reaper##216191
step
talk Baelgrim##217766
turnin The Cavalry is Here##79701 |goto 56.45,48.09
step
talk Wenbrandt##212295
turnin Fire in the Hole##79721 |goto Isle of Dorn/0 56.42,47.95
step
talk Moira Thaurissan##217898
accept Convergence##78471 |goto Isle of Dorn/0 56.48,47.96
step
talk Moira Thaurissan##217905
|tip 建筑内部
turnin Convergence##78471 |goto Dornogal/0 40.17,26.03
step
talk Merrix##217904
|tip 建筑内部
accept Group Effort##78538 |goto 39.87,26.01
step
use the Work Orders##213271+
|tip 用它们来对付{o}出境工人{}。
|tip 它们看起来就像附近大洞周围的{o}矮人{}。
分发 #10# 订单 |q 78538/1 |goto 36.01,52.58
'|clicknpc Unbound Worker##222539
step
talk Merrix##212746
turnin Group Effort##78538 |goto 36.01,52.58
step
talk Baelgrim##212747
accept Calling the Stormriders##80022 |goto 36.05,52.80
step
在斯托姆佩奇城外与贝尔格里姆会合 |q 80022/1 |goto 32.16,35.72
step
talk Baelgrim##222177
选择 _"我们走 <追随者地牢排队>"_ |gossip 122130
与贝尔格里姆对话以继续前进 |q 80022/2 |goto 32.16,35.72
step
进入地牢 |goto The Rookery/5 |q 80022
|tip 你将自动排队进入地牢。
step
清除风暴池的腐化 |q 80022/3
|tip 使用{o}Rookery{}地牢指南来完成这个任务。
|tip 你也可以使用{o}地牢援助{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你的{o}助手会带领你{}通过地牢。
step
clicknpc Stormrook##222818
|tip 完成地牢后，它看起来就像一只{o}巨大的蓝色麒麟{}站在附近的平台上。
返回多诺戈尔 |complete zone("Dornogal") |goto The Rookery/1 55.08,40.85 |q 80022
step
talk Merrix##212746
turnin Calling the Stormriders##80022 |goto Dornogal/0 36.00,52.58
step
talk Baelgrim##222555
accept Lasting Repairs##78539 |goto 35.92,52.71
step
talk Baelgrim##222555
问他 _“计划是什么？”_ |gossip 120626 |noautogossip
|tip 你可以观看对话，也可以选择{o}“<略过对话>你们可以自己讨论”{}。
讨论对抗奈鲁比尔人的计划 |q 78539/1 |goto 35.92,52.71
step
talk Baelgrim##222555
turnin Lasting Repairs##78539 |goto 35.92,52.71
accept To the Meadery##78540 |goto 35.92,52.71
step
talk Drelda##217542
fpath Durgaz Cabin |goto Isle of Dorn/0 67.48,43.31
step
talk Baelgrim##212749
turnin To the Meadery##78540 |goto Isle of Dorn/0 75.31,43.13
accept Lay the Trap##78541 |goto Isle of Dorn/0 75.31,43.13
step
talk Wenbrandt##212750
accept Evacuation Area##78542 |goto 75.31,43.17
stickystart "Evacuate_Unbound_Meadworkers"
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##434279 |goto 74.75,42.64 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.78,42.71 |count 1
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450651 |goto 74.50,42.20 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.51,42.27 |count 2
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450652 |goto 74.45,41.75 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.41,41.75 |count 3
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450653 |goto 74.79,41.71 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.79,41.66 |count 4
step
label "Evacuate_Unbound_Meadworkers"
clicknpc Unbound Meadworker##212452+
|tip 他们看起来像{o}矮人{}。
撤离 #8# 未被束缚的蜂蜜酒工人 |q 78542/1 |goto 74.64,43.21
step
talk Wenbrandt##212750
turnin Evacuation Area##78542 |goto 75.31,43.17
step
talk Baelgrim##212749
turnin Lay the Trap##78541 |goto 75.31,43.13
accept Poking the Spider Nest##78543 |goto 75.31,43.13
step
click Keg of Cinderbrew Mead
带走一桶煤渣酿蜂蜜酒 |q 78543/1 |goto 74.53,40.97
step
扰乱努比亚人的巢穴 |q 78543/2 |goto 75.08,38.81
|tip 对附近的{o}大蜘蛛网{}使用{o}投掷木桶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
talk Baelgrim##212756
turnin Poking the Spider Nest##78543 |goto 74.78,42.34
accept Bring the Thunder##78544 |goto 74.78,42.34
step
设置防御 |q 78544/1 |goto 74.63,42.43 |count 1
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.65,42.22 |count 2
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.74,42.14 |count 3
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.84,42.13 |count 4
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.89,41.33 |count 5
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.46,41.26 |count 6
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
talk Baelgrim##212756
告诉他_“我已经完成了防御工事”_ |gossip 120672
与贝尔格里姆对话，开始防御 |q 78544/2 |goto 74.78,42.34
step
杀死一波又一波进攻的敌人
|tip 当你飞行时，它们就在地面上。
|tip 使用行动条上的能力。
杀死努比亚人 |q 78544/3 |goto 74.78,42.34
step
观看对话
见证贝尔格里姆的计划 |q 78544/4 |goto 74.78,42.34
step
talk Adelgonn##217849
turnin Bring the Thunder##78544 |goto Isle of Dorn/0 75.10,43.82
accept Return to the Coreway##78545 |goto Isle of Dorn/0 75.10,43.82
step
talk Tordrin##217543
fpath Rambleshire |goto Isle of Dorn/0 59.16,28.58
step
返回多诺加尔的梅瑞克斯 |q 78545/1 |goto Dornogal/0 32.07,59.69
step
talk Merrix##217880
turnin Return to the Coreway##78545 |goto 32.07,59.69
accept Recompense##78546 |goto 32.07,59.69
step
观看对话
talk Adelgonn##217883
告诉她_“告诉他们在蜂蜜酒厂发生了什么”_ |gossip 120772 |noautogossip
|tip 你可以观看对话，或者选择{o}“<略过对话>我们可以稍后再告诉他们细节”{}。
与阿德尔贡交谈 |q 78546/1 |goto 31.85,59.27
step
观看对话
听取汇报 |q 78546/2 |goto 31.85,59.27
step
talk Merrix##217880
告诉他_“我们开始吧”_ |gossip 120762
见证核心通道的修复 |q 78546/3 |goto 32.07,59.69
step
talk Merrix##217880
turnin Recompense##78546 |goto 32.06,59.69
step
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Intro & Isle of Dorn (Story Only)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The Ringing Deeps (Story Only)"	|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The Ringing Deeps (Story Only)",{
author="support@zygorguides.com",
},[[
step
talk Moira Thaurissan##217887
accept Into the Deeps##80434 |goto Dornogal/0 31.98,59.86
|only if not (haveq(83550) or completedq(83550))
step
talk Speaker Brinthe##212592
turnin Into the Deeps##80434 |goto The Ringing Deeps/0 42.10,28.34	|only if (haveq(80434) or completedq(80434)) and not haveq(83550)
turnin The Ringing Deeps##83550 |goto The Ringing Deeps/0 42.10,28.34	|only if haveq(83550) or completedq(83550)
accept Underground and Overwhelmed##78555 |goto The Ringing Deeps/0 42.10,28.34
step
talk Foreman Uzjax##218290
accept Getting Off Track##78557 |goto 42.12,28.27
stickystart "Help_The_Machine_Speakers_Secure_Ironhaul_Station"
step
clicknpc Buried Legs##215249
|tip 你会受到攻击。
调查翻倒的矿车周围区域 |q 78557/1 |goto 43.90,29.90
step
label "Help_The_Machine_Speakers_Secure_Ironhaul_Station"
clicknpc Injured Railhand##212390+
|tip 他们看起来像{o}躺在地上的勇士。
click Nerubian Explosive Cache+
|tip 它们看起来像{o}巨大的带刺金属球{}。
click Priority Transport Crate+
|tip 它们看起来像大型木箱和金属箱
kill Malfunctioning Railbot##218251+
|tip 它们看起来像{o}类人机器人{}。
帮助机器音箱确保 Ironhaul 站的安全 |q 78555/1 |goto 43.83,28.32
step
talk Foreman Uzjax##218290
turnin Getting Off Track##78557 |goto 42.13,28.27
step
talk Speaker Brinthe##212592
turnin Underground and Overwhelmed##78555 |goto 42.10,28.34
accept Pomp and Dire Circumstance##78837 |goto 42.10,28.34
step
talk Speaker Brinthe##212592
问她_“大家一直在谈论的 ”高级发言人 "是谁？ |gossip 122955
向布林特议长询问 “高级议长 ”的情况 |q 78837/1 |goto 42.10,28.34
step
talk Igram Underwing##215563
fpath Gundargaz |goto 46.87,33.36
step
talk Speaker Brinthe##212741
|tip 建筑内部
turnin Pomp and Dire Circumstance##78837 |goto The Ringing Deeps/0 47.19,34.17
accept Cogs in the Machine##78838 |goto The Ringing Deeps/0 47.19,34.17
step
talk Igram Underwing##215563
问他_"你是 Underwing 吗？ |gossip 121192
认识伊格拉姆-暗翼 |q 78838/1 |goto 46.87,33.36
step
talk Speaker Jurlax##213875
问他_"Jurlax 议长？ |gossip 121195
见见 Jurlax 议长 |q 78838/2 |goto 46.95,32.41
step
talk Watcher Toki##213869
问她_“我猜你是守望者岐？”_ |gossip 121196
见到守望者岐 |q 78838/3 |goto 48.04,34.83
step
回到布林特的房子 |q 78838/4 |goto 47.19,34.17
|tip 建筑内部
step
talk Speaker Brinthe##212741
|tip 建筑内部
turnin Cogs in the Machine##78838 |goto 47.19,34.17
accept Speaking to the Speakers##78631 |goto 47.19,34.17
step
talk Emergency Militia##212839+
告诉他们_"布林特议长和我要去调查哥布林入侵事件。在我们回来之前，你要坚持住。"_ |gossip 120320
安抚 3#守卫者 |q 78631/1 |goto 51.84,29.58
step
侦察制高点 |q 78631/2 |goto The Ringing Deeps/0 57.65,29.14
step
观看对话
talk Speaker Brinthe##212519
turnin Speaking to the Speakers##78631 |goto The Ringing Deeps/0 57.65,29.14
accept Leave No Stone Behind##78634 |goto The Ringing Deeps/0 57.65,29.14
accept Kobold Shoulder##78839 |goto The Ringing Deeps/0 57.65,29.14
step
talk Skitter##212269
accept Death and Waxes##78635 |goto The Ringing Deeps/0 57.68,29.15
stickystart "Collect_Flickerflame_Candles"
stickystart "Slay_Flickerflame_Kobolds"
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 56.47,24.85 |count 1
collect Faded Memory Gem##212178 |n |only if not completedq(78634)
accept Broken Memories##79206 |goto 56.47,24.85 |only if not completedq(78634)
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 58.82,25.07 |count 2
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 61.51,23.53 |count 3
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 58.16,20.94 |count 4
step
label "Collect_Flickerflame_Candles"
杀死周围的闪烁火焰敌人
|tip 有的会在空中飞行。|无趣
|tip {o}闪烁火焰土爪动物{o}不会掉落{o}任务物品{o}。|注释
click Flickerflame Candles+
|tip 它们看起来就像一束束白色的蜡烛。
collect 12 Flickerflame Candle##210878 |q 78635/1 |goto 59.33,25.41
'|kill Flickerflame Kobold##212536, Flickerflame Sticker##212629, Flickerflame Scrabbler##212515, Flickerflame Geomancer##212528, Flickerflame Enforcer##212548, Flickerflame Candlekeeper##212524, Flickerflame Candleflyer##219341, Flickerflame Overseer##212542
step
label "Slay_Flickerflame_Kobolds"
杀死周围的闪烁火焰敌人 |notinsticky
|tip 有的会在空中飞行。|无趣
|tip {o}闪焰邋遢爪{ {o}动物{o}不会掉落{ {o}任务物品{ {o}。|不算
杀死 #24# 闪烁火焰哥布林 |q 78839/1 |goto 58.78,25.48
'|kill Flickerflame Kobold##212536, Flickerflame Sticker##212629, Flickerflame Scrabbler##212515, Flickerflame Geomancer##212528, Flickerflame Enforcer##212548, Flickerflame Candlekeeper##212524, Flickerflame Candleflyer##219341, Flickerflame Overseer##212542
step
talk Skitter##212269
turnin Death and Waxes##78635 |goto 57.68,29.14
step
talk Speaker Brinthe##212519
turnin Leave No Stone Behind##78634 |goto The Ringing Deeps/0 57.65,29.14
turnin Kobold Shoulder##78839 |goto The Ringing Deeps/0 57.65,29.14
turnin Broken Memories##79206 |goto The Ringing Deeps/0 57.65,29.14 |only if haveq(79206) or completedq(79206)
accept Engineering Destruction##78638 |goto The Ringing Deeps/0 57.65,29.14
step
talk Skitter##212269
accept Cracking Cogchewer##78637 |goto 57.69,29.15
step
进入储存库 |q 78638/1 |goto 57.64,24.20
stickystart "Scuttle_Mining_Rigs"
step
kill Cogchewer##212617
collect Cogchewer's Keys##211865 |q 78637/2 |goto 55.88,21.01
step
label "Scuttle_Mining_Rigs"
click Abandoned Mining Rig+
|tip 它们看起来像{o}坏掉的机器人{}。
kill Sparklit Rust Crusher##212597+
|tip 它们看起来像{o}棕色的人形机器人{}。
Scuttle #8# 采矿钻机 |q 78638/2 |goto 56.03,22.65
step
离开储存库 |goto 57.65,24.20 < 15 |walk |only if subzone("Lost Mines") and indoors()
talk Skitter##212269
turnin Cracking Cogchewer##78637 |goto 57.69,29.15
step
talk Speaker Brinthe##212519
turnin Engineering Destruction##78638 |goto 57.65,29.14
accept Retaking the Mines##78636 |goto 57.65,29.14
step
click Sealed Gate
观看对话
打开大门 |q 78636/1 |goto 59.65,21.52
step
kill Wickbreaker##215077 |q 78636/2 |goto 59.43,22.16
step
talk Speaker Brinthe##215671
|tip 她走到这里
turnin Retaking the Mines##78636 |goto 59.51,21.74
step
talk Skitter##215672
accept Manifesto Destiny##78640 |goto 59.54,21.75
step
侦察安全区域 |q 78640/2 |goto 61.50,32.00
step
分发 120# 小册子 |q 78640/3 |goto 64.78,32.29
|tip 你将在骑乘时{o}自动投掷小册子{}。
|tip 飞过空中的{o}大环{}，快速投掷{o}许多小册子{}。
step
talk Skitter##212991
turnin Manifesto Destiny##78640 |goto 61.50,32.02
accept Ko-boldening##78639 |goto 61.50,32.02
accept Not Waste, Not Want##79205 |goto 61.50,32.02
stickystart "Free_Oppressed_Kobolds"
stickystart "Collect_Useful_Looking_Scraps"
step
click Sizzling Barrel+
|tip 它们看起来像{o}更大的木桶{}。
collect 3 Unstable Cinderbrew Barrel##217015 |q 79205/2 |goto 64.53,33.00
step
label "Free_Oppressed_Kobolds"
kill Waxtail Browbeater##213000+
|tip 它们看起来像{o}大得多的哥布林{}。
kill Waxtail Tormentor##212983+
|tip 它们看起来像{o}拿着鞭子的大哥布林{}。
释放 #10# 被压迫的哥布林 |q 78639/1 |goto 64.53,33.00
step
label "Collect_Useful_Looking_Scraps"
杀死该区域周围的蜡尾敌人
|tip 蜡尾眉蝠和折磨者不会掉落任务物品。|不粘
click Intriguing Scrap+
|tip 它们看起来像{o}各种不同的物体{}。
collect 24 Useful Looking Scrap##212177 |q 79205/1 |goto 64.53,33.00
'|kill Waxtail Scavenger##212985, Waxtail Trapper##212987, Waxtail Candleflyer##219343, Waxtail Outrider##213095, Waxtail Dirtcaller##212988
step
talk Skitter##212991
turnin Ko-boldening##78639 |goto 61.50,32.02
turnin Not Waste, Not Want##79205 |goto 61.50,32.02
accept Tackling Torchsnarl##78641 |goto 61.50,32.02
step
talk Speaker Brinthe##212992
accept Wax On, Pot Off##79267 |goto 61.49,31.98
stickystart "Ruin_Wax_Pots"
step
进入洞穴 |goto 66.79,29.13 < 30 |walk
kill Torchsnarl##212993
|tip 在洞穴里面。
击败火炬熊 |q 78641/1 |goto 67.25,28.25
step
label "Ruin_Wax_Pots"
click Kobold Cauldron+
|tip 它们看起来像{o}装着黄色液体的大罐子。
毁掉 #6# 蜡罐 |q 79267/1 |goto 66.22,30.26
step
talk Speaker Brinthe##212992
turnin Wax On, Pot Off##79267 |goto 61.49,31.98
step
talk Skitter##212991
turnin Tackling Torchsnarl##78641 |goto 61.50,32.02
accept New Candle, New Hope##78642 |goto 61.50,32.02
step
talk Skitter##212991
告诉她_“我准备好潜入暗焰裂隙了”_。 |gossip 119957
与斯基特对话，进入暗焰裂隙 |q 78642/1 |goto 61.50,32.02
step
click Discarded Loot
|tip 杀死洞穴里的最后一个 Boss{} 之后就可以打开它。
|tip 完成暗焰裂缝探险就能打开它。
|tip 完成探险非常简单。
取回烛冠 |q 78642/2 |goto Darkflame Cleft Scenario/0 44.45,89.81
step
观看对话
talk Skitter##216103
告诉她_“我们快离开这里！”_ |gossip 119961
与斯奇特对话以离开暗焰裂隙 |complete subzone("The Warrens") |goto Darkflame Cleft Scenario/0 41.53,90.00 |q 78642
step
talk Skitter##212991
turnin New Candle, New Hope##78642 |goto The Ringing Deeps/0 61.49,32.02
step
talk Speaker Brinthe##212992
accept Back to Gundargaz##80082 |goto 61.49,31.98
step
talk Speaker Brinthe##218715
turnin Back to Gundargaz##80082 |goto 47.09,33.23
step
talk Moira Thaurissan##218714
accept A Wrench in the Works##80079 |goto 47.13,33.24
step
talk Concerned Machine Speaker##219158
告诉他_“现在是说出来的时候了”_ |gossip 121184
聆听怨言 |q 80079/1 |goto 47.22,32.33 |count 1
step
talk Concerned Machine Speaker##218722
告诉她_“现在是说出来的时候了”。 |gossip 121182
聆听怨言 |q 80079/1 |goto 47.27,32.21 |count 2
step
talk Agitated Machine Speaker##218724
告诉他_“现在是说出来的时候了”_ |gossip 121038
聆听怨言 |q 80079/1 |goto 47.22,32.01 |count 3
step
talk Agitated Machine Speaker##219155
告诉她_“现在是说出来的时候了”。 |gossip 121181
聆听怨言 |q 80079/1 |goto 47.14,32.13 |count 4
step
talk Moira Thaurissan##218714
turnin A Wrench in the Works##80079 |goto 47.13,33.23
step
talk Speaker Brinthe##218715
accept The Tunnel's End##78685 |goto 47.09,33.23
step
talk Milgrit Stonefeather##218388
fpath Shadowvein Point |goto 61.44,47.95
step
talk Kargen Ironbrow##224940
fpath Camp Murroch |goto 58.16,64.05
step
talk Clixi Fastfare##224884
fpath Opportunity Point |goto 64.71,78.08
step
在泰洛奇附近找到麦格尼和达格兰 |q 78685/1 |goto The Ringing Deeps/0 60.40,59.79
step
talk Magni Bronzebeard##213612
turnin The Tunnel's End##78685 |goto The Ringing Deeps/0 60.40,59.79
accept We Don't Go to Taelloch##78696 |goto The Ringing Deeps/0 60.40,59.79
step
杀死周围的敌人
杀死 #6# 入侵的野生动物 |q 78696/1 |goto 62.13,59.83
'|kill Invasive Witherling##219913, Territorial Deepflayer##219902, Emboldened Fog Wither##219909
step
找到麦格尼和达格兰 |q 78696/2 |goto 62.51,58.69
|tip 在建筑的门口。
step
talk Dagran Thaurissan II##213634
|tip 建筑内部
turnin We Don't Go to Taelloch##78696 |goto 62.31,58.14
accept Ghost of a Company Town##78697 |goto 62.31,58.14
step
talk Magni Bronzebeard##213633
|tip 建筑内部
告诉他_“我准备好出发了”_ |gossip 123513
告诉麦格尼你准备好出发了 |q 78697/1 |goto 62.31,58.08
step
进入城镇 |q 78697/2 |goto 63.85,58.36
step
click Earthen Slate
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 64.16,58.06 |count 1
step
click Full Mug
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 64.13,58.63 |count 2
step
click Hastily Constructed Blockade
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 63.49,57.83 |count 3
step
click Earthen Slate
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.08,57.85 |count 4
step
click Earthen Hammer
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.32,58.70 |count 5
step
click Hastily Constructed Blockade
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.84,57.41 |count 6
step
click Barricade
调查求救信号 |q 78697/4 |goto 66.05,58.34
step
talk Magni Bronzebeard##216479
|tip 建筑内部
turnin Ghost of a Company Town##78697 |goto 66.14,58.36
accept Controlled Demolition##78700 |goto 66.14,58.36
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept The Truth in Chalk##78701
stickystart "Slay_Skardyn"
step
click Earthen Slate
找到第一块石板 |q 78701/1 |goto 66.02,60.43
step
click Earthen Slate
|tip 小山洞内
找到第二块石板 |q 78701/2 |goto 61.47,62.66
step
click Earthen Slate
|tip 小山洞内
查找第三块石板 |q 78701/3 |goto 64.44,65.06
step
click Earthen Slate
找到第四块石板 |q 78701/4 |goto 67.26,63.99
step
_Next to you:_
talk Dagran Thaurissan II##214892
turnin The Truth in Chalk##78701
step
label "Slay_Skardyn"
杀死周围的敌人
杀死 #18# 斯卡丁 |q 78700/1 |goto 64.86,62.11
'|kill Reconstructed Skardyn##219245, Corrupted Spellshaper##219302, Unstable Skardyn##223414, Cursed Miner##213565, Hijacked Ironstrider##219287, Voidtouched Speaker##223469, Skardyn Husk##213566
step
_Next to you:_
talk Magni Bronzebeard
turnin Controlled Demolition##78700
'|talk Magni Bronzebeard##214890
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept Buried in Stone##78703
step
找到洞穴入口 |goto 67.39,62.00 < 15 |walk
进入洞穴 |q 78703/1 |goto 68.00,61.81
|tip 在洞穴里面。
step
探索洞穴 |q 78703/2 |goto The Ringing Deeps/0 68.46,62.88
|tip 在洞穴里面。
step
kill Cave Blockage##216508
|tip 它看起来像是一堵{o}巨石墙{}挡住了去路。
|tip 在洞穴里面。
摧毁堵塞物 |q 78703/3 |goto The Ringing Deeps/0 68.46,62.88
step
_Next to you:_
talk Dagran Thaurissan II##214892
turnin Buried in Stone##78703
step
_Next to you:_
talk Magni Bronzebeard
accept Find the Foreman##78704
'|talk Magni Bronzebeard##214890
step
kill Kol Bruncrag##213658
|tip 山洞的楼上
面对工头 |q 78704/1 |goto 68.47,64.18
step
_Next to you:_
talk Magni Bronzebeard
turnin Find the Foreman##78704
'|talk Magni Bronzebeard##214890
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept What She Saw##78705
step
click Memory Gem
|tip 山洞内，一楼。
检查宝石 |q 78705/1 |goto 68.58,64.45
step
观看对话
|tip 山洞内，一楼。
查看记忆 |q 78705/2 |goto 68.57,64.35
step
talk Dagran Thaurissan II##219453
|tip 山洞内，一楼。
turnin What She Saw##78705 |goto 68.57,64.35
step
talk Magni Bronzebeard##219452
|tip 山洞内，一楼。
accept The High Speaker's Secret##78706 |goto 68.55,64.35
step
离开洞穴 |goto The Ringing Deeps/0 67.61,62.01 < 20 |walk |only if subzone("Taelloch Mine") and indoors()
talk Speaker Brinthe##212741
|tip 建筑内部
turnin The High Speaker's Secret##78706 |goto The Ringing Deeps/0 47.19,34.17
accept Absent Speaker##78738 |goto The Ringing Deeps/0 47.19,34.17
step
talk Speaker Brinthe##213569
|tip 山的另一边
turnin Absent Speaker##78738 |goto 47.13,20.72
accept Sympathetic Speakers##78741 |goto 47.13,20.72
step
talk Moira Thaurissan##213763
accept Battle of the Earthenworks##78742 |goto 47.08,20.71
stickystart "Fight_The_High_Speakers_Followers_In_The_Earthenworks"
step
talk Foreman Gesa##213674
|tip 他在这附近走动。
问她_“你能帮我们吗？”_ |gossip 121209
kill Foreman Gesa##213674
面对工头格萨 |q 78741/1 |goto 50.33,21.20
step
talk Foreman Otan##213673
问他_"你能帮我们吗？ |gossip 121212
kill Foreman Otan##213673
面对工头奥坦 |q 78741/2 |goto 45.80,14.04
step
面对乌贾克斯工头 |q 78741/3 |goto 48.99,17.44
|tip 桥下的小房间里
step
观看对话
talk Speaker Brinthe##219428
|tip 她出现在这个地方。
turnin Sympathetic Speakers##78741 |goto 49.02,17.31
step
talk Foreman Uzjax##213672
accept Return to Moira##81798 |goto The Ringing Deeps/0 48.97,17.44
step
label "Fight_The_High_Speakers_Followers_In_The_Earthenworks"
杀死周围的敌人
clicknpc Assembly Worker##213543+
|tip 他们看起来像{o}害怕的矮人{}。
click Broken Machinery+
|tip 他们看起来像会发射火球的{o}虫子
在 Earthenworks 中对抗高级议长的追随者 |q 78742/1 |goto 47.63,17.18
'|kill Dogmatic Machine Speaker##212878, High Speaker's Construct##219635, Dogmatic Forgecaster##212884, Swarming Cogwalker##213962, Earthenwork Ironstrider##213951, Dogmatic Soot-Seer##212876, Slag Elemental##212885
step
talk Moira Thaurissan##213763
turnin Battle of the Earthenworks##78742 |goto 47.08,20.71
turnin Return to Moira##81798 |goto The Ringing Deeps/0 47.08,20.71
accept Dark Iron from Above##78760 |goto 47.08,20.71
step
观看对话
talk Moira Thaurissan##213763
告诉她_“我准备好了，我们走吧！”_ |gossip 120506
与莫伊拉对话 |q 78760/1 |goto 47.08,20.71
step
开始飞往瓦里克主管处 |invehicle |goto 47.08,20.71 |q 78760
step
飞向监工瓦里克 |outvehicle |goto 49.60,15.39 |q 78760
step
kill Supervisor Varric##223263 |q 78760/2 |goto 49.58,14.39
step
click Varric's Damaged Ironstrider
登上瓦里克受损的铁甲舰 |q 78760/3 |goto 46.84,14.06
step
杀死周围的敌人
|tip 使用行动条上的能力。
击败攻击部队 |q 78760/4 |goto 46.84,14.06
'|kill Swarming Cogwalker##213962, Zealous Ironguard##223904, Zealot's Guardbot##223911
step
talk Moira Thaurissan##213796
turnin Dark Iron from Above##78760 |goto 46.70,10.26
accept Into the Machine##78761 |goto 46.70,10.26
step
进入觉醒大厅 |q 78761/1 |goto 46.44,8.76
|tip {跟着你的盟友进入旋转传送门
|tip 建筑内部
step
开始剧情 |scenariostart |q 78761
step
_Inside the Halls of Awakening:_
沿着高级发言人的足迹进入觉醒大厅 |scenariogoal 1/65229 |goto Hall of Awakening Scenario/0 22.65,49.54 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
click Ironfuse Bomb+
|tip 他们看起来就像地上的{o}灰色圆球{}。
|tip 你会获得一个{o}有时间限制的BUFF{}，它能赋予你一种能力，{o}所以要抓紧时间{}。
摧毁 #4# 地狱喷雾器 |scenariogoal 2/66045 |goto Hall of Awakening Scenario/0 28.75,49.61 |q 78761
|tip 它们看起来像{o}发射火球的炮塔{}。
|tip 对他们使用{o}铁幕炸弹{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
_Inside the Halls of Awakening:_
深入觉醒大厅 |scenariogoal 3/65469 |goto Hall of Awakening Scenario/0 37.08,49.59 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
click Earthen Console
|tip 和你的盟友一起沿着路径前进。
帮助达格兰激活符文锁序列 |scenariogoal 4/65423 |goto Hall of Awakening Scenario/0 42.73,45.18 |q 78761
step
_Inside the Halls of Awakening:_
杀死攻击的敌人
在达格兰解开 Runelock 组合时保护他 |scenariostage 5 |goto Hall of Awakening Scenario/0 43.29,43.26 |q 78761
'|kill Deranged Skardyn##217672, Skardyn Remnants##216487, Skardyn Metamorphosis##219148, Deviant Skardyn##217610, Enraged Skardyn##213743, Void Crystal Monstrosity##217200, Deranged Skardyn##217684
step
_Inside the Halls of Awakening:_
进入湮灭界面 |scenariogoal 6/65482 |goto Hall of Awakening Scenario/0 55.43,49.58 |q 78761
|tip 和你的盟友一起沿着路径前进。
stickystart "Defeat_The_Iron_Runed_Protector"
step
_Inside the Halls of Awakening:_
kill Earthen-Ward Sentinel##216221
击败土墙哨兵 |scenariogoal 6/65444 |goto Hall of Awakening Scenario/0 59.68,49.51 |q 78761
step
label "Defeat_The_Iron_Runed_Protector"
_Inside the Halls of Awakening:_ |notinsticky
kill Iron-Runed Protector##214576
击败铁流保护者 |scenariogoal 6/65446 |goto Hall of Awakening Scenario/0 59.68,49.51 |q 78761
step
_Inside the Halls of Awakening:_
进入最终密室 |scenariogoal 7/65497 |goto Hall of Awakening Scenario/0 77.34,49.46 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
kill Master Machinist Dunstan##217353
击败机械大师邓斯坦 |scenariogoal 8/65464 |goto Hall of Awakening Scenario/0 85.44,49.38 |q 78761
'|kill Master Machinist Dunstan##217435
step
_Inside the Halls of Awakening:_
观看对话
在觉醒机器中与高级议长艾瑞克对峙 |scenarioend |goto Hall of Awakening Scenario/0 87.40,49.44 |q 78761
在觉醒大厅与高级议长对峙 |q 78761/2 |goto Hall of Awakening Scenario/0 87.40,49.44
step
talk Moira Thaurissan##212742
|tip 建筑内部
turnin Into the Machine##78761 |goto The Ringing Deeps/0 47.17,34.12
accept The Machine Speakers##79354 |goto The Ringing Deeps/0 47.17,34.12
step
观看对话
|tip 建筑内部
talk Moira Thaurissan##212742
turnin The Machine Speakers##79354 |goto 47.17,34.12
accept Orientation: Gundargaz##81689 |goto 47.17,34.12
step
talk Waxmonger Squick##221390
与蜡匠斯奎克交谈 |q 81689/1 |goto The Ringing Deeps/0 47.30,32.93
step
观看对话
|tip 建筑内部
talk Moira Thaurissan##212742
turnin Orientation: Gundargaz##81689 |goto 47.17,34.12
step
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Intro & Isle of Dorn (Story Only)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Hallowfall (Story Only)"		|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Hallowfall (Story Only)",{
author="support@zygorguides.com",
},[[
step
talk Anduin Wrynn##213983
accept The Hallowed Path##78658 |goto The Ringing Deeps/0 47.08,32.22
step
找到通往万圣降临之门 |q 78658/1 |goto 40.68,24.11
step
talk Anduin Wrynn##213120
告诉他_“我准备好了”_ |gossip 120906
在万圣降临与安度因对话 |q 78658/2 |goto Hallowfall/0 77.17,43.00
step
在杜奈尔的仁慈之地与阿拉提会面 |q 78658/3 |goto 68.40,45.11
step
观看对话
talk Faerin##213116
turnin The Hallowed Path##78658 |goto 68.40,45.11	|only if (haveq(78658) or completedq(78658)) and not haveq(83551)
turnin Hallowfall##83551 |goto 68.40,45.11		|only if haveq(83551) or completedq(83551)
accept Where the Light Touches##78659 |goto 68.40,45.11
step
talk Auro Flitter##217639
fpath Dunelle's Kindness |goto 67.48,44.62
step
click Relief Cart
|tip 这一步是可选的
|tip 如果你不想听故事，可以省略这一步。
和法林一起骑马前往宙斯之墙 |q 78659/1 |goto 68.22,45.17
step
抵达宙斯之墙 |q 78659/2 |goto 71.43,57.50 |notravel
step
talk Great Kyron##224310
turnin Where the Light Touches##78659 |goto 71.62,57.59
accept Tunnel Trouble##78665 |goto 71.62,57.59
step
talk Faerin##213116
accept Igniting Hope##79999 |goto 71.57,57.59
step
talk Vellas Tearen##218298
fpath The Aegis Wall |goto 71.37,56.50
stickystart "Collect_Shattered_Remnants_From_Nerubians"
step
click Nerubian Burrow+
|tip 它们看起来就像一大堆裂开的泥土。
|tip 你会受到攻击。
摧毁 #6# 奈鲁伯人的洞穴 |q 78665/1 |goto 69.96,58.78
step
label "Collect_Shattered_Remnants_From_Nerubians"
杀死周围的敌人
|tip 其中一些会飞向空中。
从奈鲁伯人那里收集 #5# 碎裂残片 |q 79999/1 |goto 71.34,61.09
'|kill Dreadstrike Subjugator##213129, Dreadstrike Flitterer##213320, Dreadstrike Priest##213189, Dreadstrike Ambusher##217481
step
click Aegis Keyflame
|tip 在墙上
|tip 反复点击
用 #5# 次破碎残片增强宙斯之墙钥匙火焰的威力 |q 79999/2 |goto 70.04,61.06
step
talk Faerin##213116
|tip 在墙上
turnin Igniting Hope##79999 |goto 70.12,61.00
step
talk Great Kyron##224310
|tip 在墙上
turnin Tunnel Trouble##78665 |goto 70.06,61.31
accept The Only Good Spider##78666 |goto 70.06,61.31
step
talk Faerin##213116
|tip 在墙上
accept Rekindled Memories##78667 |goto 70.12,60.99
stickystart "Slay_Nerubian_Attackers"
step
click Fallen Defender+
|tip 他们看起来就像躺在地上的{o}装甲人{}。
回收 #6# 煤球箱 |q 78667/1 |goto 71.61,61.20
step
label "Slay_Nerubian_Attackers"
杀死周围的敌人
|tip 其中一些会飞向空中。
杀死 #12# 奈鲁比攻击者 |q 78666/1 |goto 71.17,60.94
'|kill Dreadstrike Subjugator##213129, Dreadstrike Flitterer##213320, Dreadstrike Priest##213189
step
talk Great Kyron##224310
|tip 在墙上
turnin The Only Good Spider##78666 |goto 70.06,61.31
step
talk Faerin##213116
|tip 在墙上
turnin Rekindled Memories##78667 |goto 70.12,61.00
accept Rally on the Dawnbreaker##78668 |goto 70.12,61.00
step
talk Faerin##224945
|tip 飞艇甲板上
turnin Rally on the Dawnbreaker##78668 |goto 57.50,64.43
accept Siege Weapon Sabotage##78670 |goto 57.50,64.43
step
talk Great Kyron##224946
|tip 飞艇甲板上
accept For Their Eyes Only##78669 |goto 57.50,64.39
stickystart "Collect_Sureki_Shadecasters"
step
click Blackpowder Barrel+
|tip 它们看起来像{o}棕色的木桶{}。
collect 4 Keg of Black Powder##213630 |q 78670/1 |goto 57.01,65.95
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.40,65.43 |count 1
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.62,66.18 |count 2
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.64,66.70 |count 3
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.69,67.40 |count 4
step
label "Collect_Sureki_Shadecasters"
杀死周围的敌人
|tip 只有长得像{o}蜘蛛{}的敌人才会掉落任务物品。
collect 3 Sureki Shadecaster##216658 |q 78669/1 |goto 57.01,65.95
'|kill Direweb Marauder##221302, Direweb Lasher##221303, Direweb Ritualist##221300
step
talk Anduin Wrynn##213120
|tip 飞艇甲板上
turnin For Their Eyes Only##78669 |goto 57.54,64.33
turnin Siege Weapon Sabotage##78670 |goto 57.54,64.33
accept Zero out Xerosh##82836 |goto 57.54,64.33
step
kill Siegelord Xerosh##224311 |q 82836/1 |goto 57.71,68.14
step
talk Anduin Wrynn##213120
turnin Zero out Xerosh##82836 |goto 56.90,68.27
accept The Light of the Dawntower##78671 |goto 56.90,68.27
step
talk Anduin Wrynn##217826
告诉他_“我准备好了”_ |gossip 120738
见证黎明塔的点亮 |q 78671/1 |goto 54.10,64.65
step
talk Faerin##213116
turnin The Light of the Dawntower##78671 |goto 54.11,64.70
accept A Lamplighter's Duty##78672 |goto 54.11,64.70
step
talk Gear Flamepierce##218300
fpath Lightspark |goto 52.86,61.33
step
clicknpc Lamplighter Skiff##215779
开始乘坐快艇前往罗瑞尔渡口 |invehicle |goto 53.89,64.09 |q 78672
step
观看对话
杀死攻击的敌人
|tip 飞艇会{o}停多次{}。
|tip 敌人会飞向小艇。
|tip 使用行动条上的能力。
驾驶快艇前往罗瑞尔十字路口 |q 78672/1 |goto 48.39,40.63 |notravel
step
talk Bastian Wynfall##218295
fpath Lorel's Crossing |goto 48.38,40.71
step
talk Tristan Lyte##218323
|tip 飞上窗台
fpath Priory of the Sacred Flame |goto 41.14,33.67
step
talk Faerin##214378
turnin A Lamplighter's Duty##78672 |goto 53.91,31.44
accept Tricks of the Dark##78929 |goto 53.91,31.44
step
talk General Steelstrike##214376
accept Fickle Fiendish Fish##78932 |goto 53.93,31.48
stickystart "Slay_Kobyss_Invaders"
step
talk Arathi Captive##215891+
|tip 他们看起来像{o}害怕的人类{}。
营救 #5# 阿拉提 |q 78929/1 |goto 54.11,28.61
step
label "Slay_Kobyss_Invaders"
杀死周围的敌人
|tip 长得像{o}阿拉伯人的敌人不算数{}。
杀死 #13# 科比斯入侵者 |q 78932/1 |goto 54.02,29.08
'|kill Deepwater Eel##215680, Deepwater Kobyss##215750, Drowned Arathi##215684, Deepwater Abomination##215654, Awakener Kobyss##215683
step
talk Anduin Wrynn##214377
turnin Tricks of the Dark##78929 |goto 53.91,30.78
turnin Fickle Fiendish Fish##78932 |goto 53.91,30.78
step
talk Faerin##214378
accept Blades of the Arathi##78934 |goto 53.93,30.74
step
talk General Steelstrike##214376
accept Something's Fishy##78936 |goto 55.18,32.69
step
click Torch
点燃火炬 |q 78934/1 |goto 55.16,32.72
stickystart "Rally_Arathi_Groups"
step
kill Tidelord Teethwretch##216527 |q 78936/3 |goto 56.10,34.08
step
kill The Abominable Wavecrasher##216526 |q 78936/2 |goto 54.47,33.84
step
kill Deepsludger##216536 |q 78936/1 |goto 53.32,32.65
|tip 他在这附近走动。
step
label "Rally_Arathi_Groups"
集结 #6# 阿拉提小组 |q 78934/2 |goto 54.92,33.46
|tip 它们看起来像{o}小群人类{}。
|tip 在他们旁边使用{o}集结{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
talk General Steelstrike##214376
turnin Something's Fishy##78936 |goto 55.18,32.69
step
talk Faerin##221100
turnin Blades of the Arathi##78934 |goto 55.15,32.69
step
观看对话
talk Faerin##221100
accept Shadow upon Shadow##78937 |goto 55.15,32.69
step
talk Faerin Lothar##214407
选择 _“<与法瑞恩和安度因一起靠近塔楼>”_ |gossip 121725
在塔楼眺望处找到法瑞恩 |q 78937/1 |goto 55.20,35.03
step
观看对话
talk Alleria Windrunner##214405
turnin Shadow upon Shadow##78937 |goto 55.77,41.31
accept The Darkened Flame##78939 |goto 55.77,41.31
step
click Darkfire
|tip 进入塔楼，在一楼。
观看对话
调查黑暗之火 |q 78939/1 |goto 56.17,41.89
step
click Order of Night Polearm
在塔外寻找线索 |q 78939/2 |goto 56.30,40.64 |count 1
step
clicknpc Kelther Hearthen##221411
选择 _“<祝愿他的灵魂安息>”_ |gossip 121757
在塔外寻找线索 |q 78939/2 |goto 55.93,42.02 |count 2
step
click Order of Night Poster
在塔外寻找线索 |q 78939/2 |goto 55.38,42.02 |count 3
step
click Order of Night Journal
在塔外寻找线索 |q 78939/2 |goto 54.72,43.03 |count 4
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
选择 _“<告诉费林你学到了什么>”_ |gossip 120685
返回法林 |q 78939/3 |goto 56.28,41.97
step
观看对话
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
turnin The Darkened Flame##78939 |goto 56.22,42.01
accept Ever Deeper Shadow##78951 |goto 56.22,42.01
step
杀死周围的敌人
|tip 在洞穴里面。
杀死 #10# 暗夜教团信徒 |q 78951/1 |goto 56.22,42.81
'|kill Glooming Belligerent##216865, Glooming Skulk##216869, Glooming Disciple##216867, Glooming Darkweaver##216868
step
talk Faerin Lothar##214413
|tip 在洞穴里面。
turnin Ever Deeper Shadow##78951 |goto 55.83,40.50
accept The Final Resistance##78952 |goto 55.83,40.50
step
click Shadow Rift
|tip 在洞穴里面。
摧毁暗影裂隙 |q 78952/1 |goto 55.09,40.11
step
kill Anguishing Nightmare##214415 |q 78952/2 |goto 55.09,40.11
|tip 在洞穴里面。
step
talk Faerin Lothar##221733
|tip 在洞穴里面。
turnin The Final Resistance##78952 |goto 55.13,40.23
accept The Light at the End of the Tunnel##81690 |goto 55.13,40.23
step
观看对话
|tip 跟着{o}法琳-洛萨{ }，并在她行走时保护她。
|tip 她最终会走到这个位置的洞穴入口。
跟随法林 |q 81690/1 |goto 56.50,42.58
'|clicknpc Faerin Lothar##221736
step
talk Alleria Windrunner##214405
|tip 她跑到这个位置。
turnin The Light at the End of the Tunnel##81690 |goto 55.72,43.36
step
talk Faerin Lothar##221733
accept Restore the Flame##78954 |goto 55.78,43.43
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
告诉她_“我准备好了”_ |gossip 120602
让黎明塔重现光明 |q 78954/1 |goto 56.22,42.01
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
turnin Restore the Flame##78954 |goto 56.22,42.01
accept To Mereldar##78607 |goto 56.22,42.01
step
talk Rubaen Hillhelm##206537
fpath Hillhelm Family Farm |goto 61.34,30.99
step
talk Faerin Lothar##214364
turnin To Mereldar##78607 |goto Hallowfall/0 43.45,48.58
step
talk General Steelstrike##213108
accept The Bastion of Hallowfall##78613 |goto Hallowfall/0 43.42,48.63
step
talk Anje Noon##218305
|tip 在墙上
fpath Mereldar |goto 41.57,52.59
step
在帝国边缘旅店与费林、安度因和阿莱利亚会面 |q 78613/1 |goto Hallowfall/0 42.72,55.70
|tip 建筑内部
step
talk Nalina Ironsong##217642
|tip 建筑内部
选择 _“购买一轮酒水。”_ |gossip 122686
buy A Round of Drinks##217708 |q 78613/2 |goto Hallowfall/0 42.81,55.83
step
click Drink+
|tip 建筑内部
分发 #4# 饮料 |q 78613/3 |goto Hallowfall/0 42.72,55.65
step
talk Faerin Lothar##220124
|tip 建筑内部
turnin The Bastion of Hallowfall##78613 |goto 42.75,55.63
step
talk Alleria Windrunner##218182
|tip 建筑内部
accept Nightwatch##79297 |goto 42.75,55.67
step
click Order of Night Propaganda+
|tip 这些东西看起来像是{o}卷起来的卷轴{}和{o}钉在物体上的纸片{}。
collect 8 Order of Night Propaganda##217990 |q 79297/1 |goto 43.46,56.60
step
在军营里见到钢钉将军 |q 79297/4 |goto 41.26,52.98
|tip 进入帐篷。
step
talk General Steelstrike##213108
|tip 进入帐篷。
turnin Nightwatch##79297 |goto 41.26,52.98
accept Spar Day##78626 |goto 41.26,52.98
step
talk Arathi Reserve##215727
告诉他们_“你们的将军让我和你们比试一下。”_ |gossip 120333
|tip 他们会攻击你。
决斗 #8# 阿拉提新兵 |q 78626/1 |goto 41.83,52.24
'|talk Arathi Reserve##214429
step
talk General Steelstrike##213108
|tip 进入帐篷。
turnin Spar Day##78626 |goto 41.26,52.98
accept Mereldar's Light##78614 |goto 41.26,52.98
step
clicknpc Arathi Orphan##218456+
|tip 它们看起来像{o}两个跑在一起的孩子{}。
与孤儿们玩耍 |q 78614/1 |goto Hallowfall/0 41.85,55.10 |count 1
step
talk Arathi Orphan##223365
告诉他_"我会玩。 |gossip 122367
开始与孤儿玩耍 |havebuff Scary Monster##448382 |goto 42.02,55.43 |q 78614
step
与孤儿们玩耍 |q 78614/1 |goto 42.00,55.40 |count 2
|tip 使用行动条上的能力。
|tip 使用能力{o}直到他们杀死你{}。
step
talk Arathi Orphan##218493
开始与孤儿玩耍 |invehicle |goto 41.90,55.53 |q 78614
step
与孤儿们玩耍 |q 78614/1 |goto 42.00,55.40 |count 3
|tip 使用行动条上的能力。
|tip 瞄准附近的{o}红白目标{}。
step
talk Faerin Lothar##220124
|tip 建筑内部
turnin Mereldar's Light##78614 |goto 41.68,55.51
step
观看对话
|tip 建筑内部
talk Faerin Lothar##220124
accept The Bell Tolls##78615 |goto 41.68,55.51
step
前往梅雷达尔之门 |q 78615/1 |goto 41.06,54.71
step
talk Faerin Lothar##213107
turnin The Bell Tolls##78615 |goto 41.06,54.71
step
talk General Steelstrike##213108
accept Crossroads of Twilight##78620 |goto 41.06,54.76
step
talk Alleria Windrunner##214402
accept The Shadow Rising##78621 |goto 41.05,54.67
stickystart "Slay_Kobyss_Attackers_78620"
step
kill Lighteater##216036 |q 78621/3 |goto 35.09,52.37
step
kill Old Grim##213403 |q 78621/1 |goto 34.87,54.64
step
kill Heartfang##216035 |q 78621/2 |goto 35.04,56.85
step
label "Slay_Kobyss_Attackers_78620"
杀死周围的敌人
杀死 #15# Kobyss 攻击者 |q 78620/1 |goto 35.38,54.75
'|kill Ragefin Carver##215652, Ragefin Executioner##213408, Ragefin Necromancer##213406, Darkwater Tidecrusher##220621, Ragefin Shadowcaster##213405
step
talk Alleria Windrunner##214402
turnin The Shadow Rising##78621 |goto 34.07,54.74
step
talk General Steelstrike##213108
turnin Crossroads of Twilight##78620 |goto 34.07,54.68
accept A Candle in the Dark##78624 |goto 34.07,54.68
step
talk Alleria Windrunner##214402
告诉她_“把气泡放下来”_ |gossip 121810
观看对话
让 Alleria 放出虚空泡泡 |q 78624/1 |goto 34.07,54.74
step
kill Aelric Leid##213208 |q 78624/2 |goto 33.40,54.60
step
talk General Steelstrike##225188
turnin A Candle in the Dark##78624 |goto 33.62,54.63
accept Consecrated Cleanup##79089 |goto 33.62,54.63
step
talk Faerin Lothar##213107
accept The Flame Still Burns##80049 |goto 33.59,54.80
stickystart "Clear_The_Veneration_Grounds"
step
talk Arathi Stalwart##225226
告诉他_“只有死掉的哥比斯才是好哥比斯”_ |gossip 122722
与阿拉提幸存者对话 |q 80049/1 |goto 35.32,55.81 |count 1
step
talk Arathi Stalwart##225226
告诉他 你别无选择 |gossip 122719
与阿拉提幸存者对话 |q 80049/1 |goto 36.01,56.01 |count 2
step
talk Arathi Stalwart##225226
告诉他 "你做得很好” |gossip 122712
与阿拉提幸存者对话 |q 80049/1 |goto 36.95,54.79 |count 3
step
talk Arathi Stalwart##225226
告诉他阿拉提人是幸存者 你们会挺过来的 |gossip 122713
与阿拉提幸存者对话 |q 80049/1 |goto 35.73,54.05 |count 4
step
talk Arathi Stalwart##225226
告诉他 "你为保护你爱的人而战斗” |gossip 122717
与阿拉提幸存者对话 |q 80049/1 |goto 35.39,52.72 |count 5
step
label "Clear_The_Veneration_Grounds"
click Kobyss Spear+
|tip 它们看起来像插在地面和物体上的{o}柱子{}。
click Memorial Plant+
|tip 它们看起来像被打翻的{o}各种花盆和花瓶{}。
清理祭拜场 |q 79089/1 |goto 35.22,54.63
step
talk General Steelstrike##225188
turnin Consecrated Cleanup##79089 |goto 33.62,54.64
turnin The Flame Still Burns##80049 |goto 33.62,54.64
step
观看对话
talk General Steelstrike##225188
accept The Final Front##78627 |goto 33.62,54.64
step
talk 'Red' Fearon##218304
fpath Light's Redoubt |goto 40.46,71.31
step
前往光之堡 |q 78627/1 |goto 38.97,71.61
|tip 飞艇甲板上
step
talk General Steelstrike##213108
|tip 飞艇甲板上
turnin The Final Front##78627 |goto 38.97,71.61
accept Trapdoor Sprung##78628 |goto 38.97,71.61
step
talk Faerin Lothar##213107
|tip 飞艇甲板上
accept Running on Reserves##78629 |goto 38.95,71.59
stickystart "Slay_Nerubians"
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 39.06,81.32 |count 1
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 38.86,83.12 |count 2
step
talk Arathi Reserve##213286
|tip 塔楼门洞内。
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 38.06,82.70 |count 3
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉她_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 37.47,81.90 |count 4
step
talk Arathi Reserve##213286
|tip 大楼门口
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 36.88,81.00 |count 5
step
label "Slay_Nerubians"
杀死周围的敌人
杀死 #15# 奈鲁伯人 |q 78628/1 |goto 38.63,80.28
'|kill Kaheti Swarmer##213398, Kaheti Ravager##213395, Kaheti Ambusher##217448, Kaheti Fighter##217362, Kaheti Shadeweaver##213396
step
talk Faerin Lothar##213107
|tip 平台上
turnin Trapdoor Sprung##78628 |goto 38.78,81.52
turnin Running on Reserves##78629 |goto 38.78,81.52
accept The Rise of the Reckoning##78630 |goto 38.78,81.52
step
click Rope Ladder
登上讨伐号 |q 78630/1 |goto 38.87,81.58
step
_As Your Fly:_
杀死周围的敌人
|tip 当你飞行时，它们就在地面上。
|tip 使用行动条上的能力。
击毙150名努比亚人 |q 78630/2
step
观看对话
到达阿兹-卡赫特 |complete zone("Azj-Kahet") |q 78630
step
talk Faerin##211699
turnin The Rise of the Reckoning##78630 |goto Azj-Kahet/0 29.39,42.20
step
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Intro & Isle of Dorn (Story Only)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Azj-Kahet (Story Only)"		|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Azj-Kahet (Story Only)",{
author="support@zygorguides.com",
},[[
step
把洞穴带到阿兹-卡赫特 |complete zone("Azj-Kahet") |goto Dornogal/0 63.61,52.55 |q 83552
|tip 走进{o}旋转入口{}。
|only if haveq(83552) or completedq(83552)
step
talk Faerin##211699
|tip 飞船上
turnin Azj-Kahet##83552 |goto Azj-Kahet/0 29.39,42.20 |only if haveq(83552) or completedq(83552)
accept Heroes Never Die##78350 |goto Azj-Kahet/0 29.39,42.20
step
talk Alleria Windrunner##211752
|tip 飞船上
accept Chasing the Light##78384 |goto Azj-Kahet/0 29.35,42.64
stickystart "Rescue_Wounded_Aeroknights"
step
click Airship Rubble##411102
|tip 你可能会遭到攻击。
collect Crumpled Lion Gauntlet##211774 |q 78384/1 |goto Azj-Kahet/0 29.14,44.62
step
click Well-Bleached Bones##411104
|tip 你可能会遭到攻击。
collect Bleached Bones##211775 |q 78384/2 |goto Azj-Kahet/0 26.55,43.02
step
click Weathered Cloth##411106
collect Scrap of Weathered Fabric##211783 |q 78384/3 |goto Azj-Kahet/0 32.55,38.85
step
label "Rescue_Wounded_Aeroknights"
clicknpc Wounded Aeroknight##214767+
|tip 他们看起来像躺在地上的{o}人类{}。
营救 #12# 受伤的阿罗克夜人 |q 78350/1 |goto 32.69,46.17
step
talk Alleria Windrunner##211752
|tip 飞船上
turnin Chasing the Light##78384 |goto Azj-Kahet/0 32.47,47.19
step
talk Faerin##211699
|tip 飞船上
turnin Heroes Never Die##78350 |goto Azj-Kahet/0 32.48,47.14
accept Friends in Low Places##78348 |goto Azj-Kahet/0 32.48,47.14
step
talk Courier Nailen##208384
fpath Wildcamp Or'lay |goto Azj-Kahet/0 23.14,51.14
step
跳入呼吸坑 |q 78348/1 |goto Azj-Kahet/0 33.37,55.94
|tip 飞下洞口，进入洞穴。
step
找到神秘的保护者 |q 78348/2 |goto Azj-Kahet/0 32.99,56.33
|tip 在洞穴里面。
step
talk Orweyna##215944
|tip 在洞穴里面。
turnin Friends in Low Places##78348 |goto Azj-Kahet/0 32.99,56.33
accept For Naught, So Vial##78352 |goto Azj-Kahet/0 32.99,56.33
accept Fear the Old Blood##78353 |goto Azj-Kahet/0 32.99,56.33
stickystart "Cleanse_The_Breathing_Pit"
step
click Nerubian Extractor+
|tip 他们看起来像{o}红色的球体，基座{}贴在墙壁上。
|tip {在完成任务的过程中，沿着螺旋路径往上走{}到这里。
|tip 在洞穴里面。
摧毁 #8# 奈鲁比提取器 |q 78352/1 |goto Azj-Kahet/0 35.58,58.08
step
label "Cleanse_The_Breathing_Pit"
杀死周围的敌人
|tip {完成任务后，沿着螺旋形的小路往上走。|注意
|tip 洞穴内部 |注释
清理呼吸坑 |q 78353/1 |goto Azj-Kahet/0 35.58,58.08
'|kill Horrid Effusia##211866, Blackblood Coalescence##215205
step
沿着向上的路径离开洞穴 |goto Azj-Kahet/0 35.58,58.08 < 20 |walk |only if subzone("Breathing Pit") and indoors()
观看对话
talk Orweyna##215113
turnin For Naught, So Vial##78352 |goto Azj-Kahet/0 35.74,58.19
turnin Fear the Old Blood##78353 |goto Azj-Kahet/0 35.74,58.19
accept Alone in the Dark##79139 |goto Azj-Kahet/0 35.74,58.19
step
在安苏瑞克之眼见到奥薇娜 |q 79139/1 |goto Azj-Kahet/0 42.32,54.15
step
talk Orweyna##219109
问她_"我们该何去何从？ |gossip 121150
调查眺望台 |q 79139/2 |goto Azj-Kahet/0 44.29,57.22
step
观看对话
talk Spindle##216213
turnin Alone in the Dark##79139 |goto Azj-Kahet/0 44.25,56.77
accept A Guiding Thread##78354 |goto Azj-Kahet/0 44.25,56.77
step
跟随斯宾德前往城市 |q 78354/1 |goto Azj-Kahet/0 47.14,53.01
'|clicknpc Spindle##216215
step
使用 "编织者之语 |q 78354/2 |goto Azj-Kahet/0 47.14,53.01
|tip 使用{o}编织者的狡猾{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
跟随纺锤过桥 |q 78354/3 |goto Azj-Kahet/0 48.47,50.35
|tip 你会受到攻击。
'|clicknpc Spindle##216216
step
跟随纺锤进入悬崖 |q 78354/4 |goto Azj-Kahet/0 49.47,46.79
'|clicknpc Spindle##216217
step
talk Widow Arak'nai##207471
turnin A Guiding Thread##78354 |goto Azj-Kahet/0 55.73,43.84
accept The Tangled Web##78392 |goto Azj-Kahet/0 55.73,43.84
accept A Seeming Respite##78393 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我你的情况”_ |gossip 122860
了解织女 |q 78392/1 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我敌军的情况”_ |gossip 122859
了解 Sureki 部队 |q 78392/2 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我关于飞升者的信息。”_ 了解关于飞升者的信息 |gossip 122858
了解飞升者 |q 78392/3 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我女王的核心圈子。”_ 了解女王的盟友 |gossip 122863
了解女王的盟友 |q 78392/4 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin The Tangled Web##78392 |goto Azj-Kahet/0 55.73,43.84
step
找到修理商 |q 78393/2 |goto Azj-Kahet/0 56.88,41.78
step
找到旅店老板 |q 78393/3 |goto Azj-Kahet/0 56.95,38.79
|tip 建筑内部
step
找到飞行大师 |q 78393/1 |goto Azj-Kahet/0 56.88,47.04
step
talk Wings of the Widow##207470
fpath Weaver's Lair |goto Azj-Kahet/0 56.88,47.04
step
talk Widow Arak'nai##207471
turnin A Seeming Respite##78393 |goto Azj-Kahet/0 55.73,43.84
accept The Weaver's Gift##78233 |goto Azj-Kahet/0 55.73,43.84
step
找到编织者的礼物 |q 78233/1 |goto Azj-Kahet/0 59.37,19.36
step
talk Faerin Lothar##211409
turnin The Weaver's Gift##78233 |goto Azj-Kahet/0 59.37,19.36
accept Rations and Revelations##80399 |goto Azj-Kahet/0 59.37,19.36
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 59.38,19.23 |count 1
step
talk Courier Aidal##216973
fpath Faerin's Advance |goto Azj-Kahet/0 60.00,18.70
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 59.02,19.04 |count 2
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 58.76,20.00 |count 3
step
talk Faerin Lothar##211409
turnin Rations and Revelations##80399 |goto Azj-Kahet/0 59.37,19.36
accept Scrappy Straggler##78236 |goto Azj-Kahet/0 59.37,19.36
step
找到流浪者 |q 78236/1 |goto Azj-Kahet/0 63.04,27.15
step
talk Flynn Fairwind##220051
选择 _“<看 Flynn 指示的位置>”_ |gossip 121919
与弗林对话 |q 78236/2 |goto Azj-Kahet/0 63.04,27.15
step
talk Flynn Fairwind##220051
turnin Scrappy Straggler##78236 |goto Azj-Kahet/0 63.04,27.15
accept Force Your Way##78234 |goto Azj-Kahet/0 63.04,27.15
step
_Next to you:_
talk Flynn Fairwind##211444
accept Strategic Edge##78383
stickystart "Slay_Kaheti_Forces"
step
click Crate of Emptied Vials##441587
|tip 平台上
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 62.87,27.83 |count 1
step
click Military Correspondence##441586
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 60.99,28.44 |count 2
step
进入洞穴 |goto Azj-Kahet/0 64.75,29.64 < 15 |walk
click Confiscated Weapons##441588
collect Flynn's Blades##211870 |q 78383/1 |goto Azj-Kahet/0 66.53,31.38
step
click Burning Venom Flask##441585
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 67.68,28.24 |count 3
step
_Next to you:_
talk Flynn Fairwind##211444
turnin Strategic Edge##78383
step
label "Slay_Kaheti_Forces"
杀死周围的敌人
杀死 #8# Kaheti 部队 |q 78234/1 |goto Azj-Kahet/0 63.97,28.89
'|kill Kaheti Skirmisher##214940, Kaheti Overseer##214941, Kaheti Threadmancer##214939, Dependable Skitterling##222153, Stalwart Hauler##214935
step
_Next to you:_
talk Flynn Fairwind##211444
turnin Force Your Way##78234
accept Let Fly!##78237
step
click Inconspicuous Box
检查不起眼的盒子 |q 78237/1 |goto Azj-Kahet/0 62.79,31.10
step
观看对话
开始飞往 Siegehold |invehicle |goto Azj-Kahet/0 62.79,31.10 |q 78237
step
飞往 Siegehold |outvehicle |goto Azj-Kahet/0 45.39,20.29 |q 78237 |notravel
step
talk Anub'azal##217330
|tip 建筑内部
turnin Let Fly!##78237 |goto Azj-Kahet/0 45.50,19.69
accept Not Quite Dead##79625 |goto Azj-Kahet/0 45.50,19.69
step
talk Monte Gazlowe##219156
|tip 建筑内部
选择 _“<轻推加兹洛>”_ |gossip 121784
找到有用的东西 |q 79625/1 |goto Azj-Kahet/0 45.18,20.21
step
talk Anub'azal##217330
|tip 建筑内部
turnin Not Quite Dead##79625 |goto Azj-Kahet/0 45.50,19.69
accept I Think I'm a Drone Now##79175 |goto Azj-Kahet/0 45.50,19.69
step
使用阿努巴尔印记 |q 79175/1 |goto Azj-Kahet/0 45.32,19.84
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Anub'azal##217330
|tip 建筑内部
turnin I Think I'm a Drone Now##79175 |goto Azj-Kahet/0 45.50,19.69
accept Specific Personages##78249 |goto Azj-Kahet/0 45.50,19.69
accept General Admission##78250 |goto Azj-Kahet/0 45.50,19.69
step
_NOTE:_
在接下来的步骤中
|tip {避免头顶有蓝色圆圈的敌人。
|tip 他们可以看穿你的伪装。
点击此处继续 |confirm |q 78249
step
click Siegehold Records
|tip 你的伪装看起来就像挂在架子上的卷轴。
|tip 建筑内部
collect Zev'kall's Attrition Log##217165 |q 78250/1 |goto Azj-Kahet/0 43.24,25.32
step
kill Hevo'myk##211591 |q 78249/3 |goto Azj-Kahet/0 44.51,27.66
step
kill Mi'thk##211582 |q 78249/1 |goto Azj-Kahet/0 46.74,28.69
step
kill Diu'mik##211564 |q 78249/2 |goto Azj-Kahet/0 48.93,23.82
|tip 建筑内部
step
进入建筑 |goto Azj-Kahet/0 45.60,21.80 < 15 |walk
talk Anub'azal##217330
|tip 建筑内部
turnin Specific Personages##78249 |goto Azj-Kahet/0 45.50,19.69
turnin General Admission##78250 |goto Azj-Kahet/0 45.50,19.69
accept Stolen Influence##78254 |goto Azj-Kahet/0 45.50,19.69
step
talk Monte Gazlowe##211399
|tip 建筑内部
accept Dalaran's Most Distressed##78251 |goto Azj-Kahet/0 45.33,19.85
step
click Gazlowe's Detonator
帮助加兹勒 |q 78251/3 |goto Azj-Kahet/0 45.14,23.06
step
talk High Arcanist Savor##221806
问他_"你好？ |gossip 121832
问他_“你看到安度因了吗？”_ |gossip 121834
告诉他_“在运输马车那里碰头”_ |gossip 121833
释放笼中囚犯 |q 78251/2 |goto Azj-Kahet/0 43.99,24.86
'|talk High Arcanist Savor##221757
step
talk Wriggling Web##221722
告诉它_"我是来救你的。假装你是下一队囚犯中的一员！"_释放被关在笼子里的囚犯 |gossip 121812
释放带网囚犯 |q 78251/1 |goto Azj-Kahet/0 47.22,26.94
step
kill Tij'allet##215600
|tip 建筑内部
collect Zev'kall's Pheromone Emitter##212528 |q 78254/1 |goto Azj-Kahet/0 48.54,19.95
step
talk Monte Gazlowe##215413
turnin Dalaran's Most Distressed##78251 |goto Azj-Kahet/0 47.39,23.90
turnin Stolen Influence##78254 |goto Azj-Kahet/0 47.39,23.90
accept Just Act Casual##78255 |goto Azj-Kahet/0 47.39,23.90
step
talk Monte Gazlowe##215413
告诉他_“我准备好了”_ |gossip 121494
告诉加兹罗你准备好了 |q 78255/1 |goto Azj-Kahet/0 47.39,23.90
step
talk Siegehold Gateminder##215419
告诉她_“我身上有阿努布扎尔将军的费洛蒙标记，让我们过去”_ |gossip 120311
与守门人对话 |q 78255/2 |goto Azj-Kahet/0 48.16,25.35
step
观看对话
在外面迎接车队 |q 78255/3 |goto Azj-Kahet/0 48.95,26.63
step
talk Monte Gazlowe##215845
turnin Just Act Casual##78255 |goto Azj-Kahet/0 51.80,25.77
accept The General's Consensus##78256 |goto Azj-Kahet/0 51.80,25.77
step
click Inconspicuous Box
collect Zev'kall's Pheromone Emitter##212528 |q 78256/1 |goto Azj-Kahet/0 51.78,25.87
step
talk Widow Arak'nai##207471
turnin The General's Consensus##78256 |goto Azj-Kahet/0 55.73,43.84
accept A Most Intriguing Invitation##78226 |goto Azj-Kahet/0 55.73,43.84
step
使用信息素 |q 78226/1 |goto Azj-Kahet/0 55.99,43.51
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
clicknpc Vizier's Personal Swarmite##219239
|tip 如果你{o}想自己飞的话，可以{o}往前跳{}。
乘坐大臣的飞行器 |q 78226/3 |goto Azj-Kahet/0 55.63,44.30
step
开始飞往暗堡 |invehicle |goto Azj-Kahet/0 55.63,44.30 |q 78226
step
飞往暗堡 |outvehicle |goto Nerub'ar/0 67.19,25.01 |q 78226 |notravel
step
抵达墓穴 |q 78226/2 |goto Nerub'ar/0 67.19,25.01
step
会见大臣 |q 78226/4 |goto Nerub'ar/0 67.12,31.50
|tip 建筑内部
step
观看对话
talk Anduin Wrynn##211351
|tip 建筑内部
turnin A Most Intriguing Invitation##78226 |goto Nerub'ar/0 67.12,31.50
accept Into a Skittering City##78228 |goto Nerub'ar/0 67.12,31.50
step
talk Executor Nizrek##211499
|tip 建筑内部
告诉他 _"织布工想要除掉夏尔塔斯，让安苏瑞克女王摆脱她的影响。 |gossip 121538
与大臣交谈 |q 78228/1 |goto Nerub'ar/0 67.46,32.44
step
让图鲁蒙施放信息素 |q 78228/2 |goto Nerub'ar/0 66.99,32.60
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Executor Nizrek##211499
|tip 建筑内部
turnin Into a Skittering City##78228 |goto Nerub'ar/0 67.47,32.45
accept Rewriting the Rewritten##78232 |goto Nerub'ar/0 67.47,32.45
step
观看对话
|tip 建筑内部
talk Anduin Wrynn##211351
accept Like a Spider on the Wall##78231 |goto Nerub'ar/0 66.90,31.91
step
_NOTE:_
在接下来的步骤中
|tip {避免头顶有蓝色圆圈的敌人。
|tip 他们可以看穿你的伪装。
点击此处继续 |confirm |q 78231
step
click Shadecaster
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 58.19,28.97 |count 1
step
talk Nana Lek'kel##222139
问他_"我？ |gossip 120653
选择_“<走开>”_ |gossip 120657
尝试与米斯克会面 |q 78231/5 |goto Nerub'ar/1 62.11,20.72
step
click Shadecaster
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 60.93,18.81 |count 2
step
聆听 Sureki 报信者 |q 78231/1 |goto Nerub'ar/1 54.84,20.29
step
click Shadecaster
|tip 建筑内部
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 53.11,16.00 |count 3
step
观察裁缝 |q 78231/4 |goto Nerub'ar/1 49.72,17.41
step
click Catalogue of Cagables
|tip 建筑内部
阅读 “Twitchery ”目录 |q 78231/3 |goto Nerub'ar/1 43.42,16.55
step
发现美食摊位 |q 78231/2 |goto Nerub'ar/1 49.05,26.54
step
talk Tekazza of the Aimless Few##209330
|tip 在地面上
fpath The Burrows |goto Nerub'ar/0 53.98,44.33
step
talk Alleria Windrunner##211375
|tip 平台上
turnin Rewriting the Rewritten##78232 |goto Nerub'ar/1 54.97,45.84
step
talk Anduin Wrynn##217386
|tip 平台上
turnin Like a Spider on the Wall##78231 |goto Nerub'ar/1 55.29,46.06
accept Kaheti Hospitality##78244 |goto Nerub'ar/1 55.29,46.06
step
talk Anduin Wrynn##217386
|tip 平台上
告诉他_“是的，我已经准备好参加登基日演讲了”_ |gossip 120665
与安度因交谈 |q 78244/1 |goto Nerub'ar/1 55.29,46.06
step
观看对话
观看苏莱奇女王的演讲 |q 78244/2 |goto Nerub'ar/1 55.29,46.06
step
开始剧情 |scenariostart |q 78244
step
杀死攻击的敌人
|tip 向前{o}直走{}，开始攻击敌人。
|tip {击败敌人后，{o}“螺纹马斯特罗-福斯 ”会攻击你。
kill Threadmaestro Fothis##216541 |scenariogoal 1/65266 |q 78244
step
click Web Blockade
|tip {跟随你的盟友。
|tip 它会在你的{o}小地图上出现一个{o}黄色小点。
摧毁网墙 |scenariogoal 1/65318 |q 78244
step
kill Swarm-Maven Donmiss##216578 |scenariogoal 2/65267 |q 78244
|tip {o}当你跑向她时，避开地面上的绿色圆圈{}。
|tip 她会以一个{o}黄点{}的形式出现在你的{o}迷你地图{}上。
step
观看对话
|tip {跟随你的盟友。
clicknpc Vizier's Getaway Flyer##216581
|tip 在你的{o}迷你地图{}上，它们会以{o}黄色圆点{}的形式出现。
到达大臣的飞行器 |scenariogoal 3/65268 |q 78244
step
kill Kx##216582
杀死女王之牙 Kx |scenariogoal 4/65269 |q 78244
step
逃离墓穴 |q 78244/3
|tip {跟随你的盟友。
|tip {跳下平台{}逃生。
step
观看对话
talk Anduin Wrynn##217386
|tip 他走到这个位置。
turnin Kaheti Hospitality##78244 |goto Azj-Kahet/0 60.63,68.89
step
talk Alleria Windrunner##217385
accept What We Still Have##78248 |goto Azj-Kahet/0 60.63,68.78
step
talk Courier Lyan##216972
fpath Wildcamp Ul'ar |goto Azj-Kahet/0 44.49,67.48
step
talk Roughrider Tany##216979
fpath Mmarl |goto Azj-Kahet/0 76.84,64.45
step
talk Widow Arak'nai##207471
告诉她_"我需要向您报告城里发生的事情。 |gossip 120666
向编织者报告 |q 78248/1 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin What We Still Have##78248 |goto Azj-Kahet/0 55.73,43.84
accept Uniting Severed Threads##84022 |goto Azj-Kahet/0 55.73,43.84
step
click General's Shadecaster
激活将军的暗影使者 |q 84022/1 |goto Azj-Kahet/0 55.50,43.79
step
click Vizier's Shadecaster
启动大臣的遮蔽者 |q 84022/2 |goto Azj-Kahet/0 55.53,44.02
step
talk Widow Arak'nai##207471
选择_“<开始断线会议>”_ |gossip 123526
与编织者对话，开始会议 |q 84022/3 |goto Azj-Kahet/0 55.73,43.84
step
观看对话
见证断裂之线的形成 |q 84022/4 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin Uniting Severed Threads##84022 |goto Azj-Kahet/0 55.73,43.84
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Intro & Isle of Dorn (Full Zone)",{
author="support@zygorguides.com",
},[[
step
_NOTE:_
某些支线任务需要玩家达到 80 级
|tip 本指南包含{o}需要80级才能完成的{o}支线任务{}。
|tip 由于你还未达到80级，所以{o}不会显示这些任务{}。
|tip 一旦你{o}达到80级{}，要完成这些任务，{o}重新加载本指南，然后从头开始{}。
点击此处继续 |confirm
|only if level < 80
step
accept The War Within##81930 |goto Stormwind City/0 63.19,72.02
|tip 你将自动接受这个任务。
|only if Alliance
step
use the Teleportation Scroll##227669
传送到西里瑟斯 |complete zone("Silithus") |q 81930
|only if Alliance
step
在西里瑟斯见到杰娜 |q 81930/2 |goto Silithus/0 41.93,45.11
|only if Alliance
step
talk Zidormi##128607
问她_"你能让我回到现在吗？ |gossip 47635
穿越时空前往新西里图斯 |complete not ZGV.InPhase("Old Silithus") |goto Silithus/0 78.93,21.97 |q 81930
|only if Alliance
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##81930 |goto 41.93,45.11
|only if Alliance
step
accept The War Within##78713
|tip 你将自动接受这个任务。
|only if Horde
step
use the Teleportation Scroll##227669
传送到西里瑟斯 |complete zone("Silithus") |q 78713
|only if Horde
step
在西里瑟斯见到鲛人 |q 78713/2 |goto Silithus/0 41.96,45.04
|only if Horde
step
talk Zidormi##128607
问她_"你能让我回到现在吗？ |gossip 47635
穿越时空前往新西里图斯 |complete not ZGV.InPhase("Old Silithus") |goto Silithus/0 78.93,21.97 |q 78713
|only if Horde
step
talk Thrall##213620
turnin The War Within##78713 |goto Silithus/0 41.96,45.04
|only if Horde
step
talk Thrall##213620
accept A Poor Reception##78714 |goto Silithus/0 41.96,45.05 |noautoaccept
_Or_
选择 _"我以前听过这个故事。<跳过达拉然介绍，前往多诺加尔。 |gossip 123176 |noautogossip
|tip 如果你{o}已经完成了这个任务{}，你可以{o}跳过介绍任务{}。
step
重定向至跳过介绍 |next "Skip_Isle_Of_Dorn_Intro"
|only if completedq(83621) or completedq(83543)
step
click Titan Translocator
进入心之密室 |q 78714/1 |goto 43.20,44.49
step
talk Magni Bronzebeard##213624
turnin A Poor Reception##78714 |goto Chamber of Heart/2 50.06,65.19
accept Azeroth's Voice##78715 |goto Chamber of Heart/2 50.06,65.19
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 56.50,64.69 |count 1
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 50.14,74.00 |count 2
step
click Chamber Console
启动心室控制台 |q 78715/1 |goto 43.90,64.72 |count 3
step
talk Magni Bronzebeard##213624
告诉他_"我准备好了。我们开始吧。 |gossip 120882
与麦格尼对话以开始仪式 |q 78715/2 |goto 50.06,65.21
step
talk Lady Jaina Proudmoore##213625
turnin Azeroth's Voice##78715 |goto 49.53,58.51
accept Painful Lessons##78716 |goto 49.53,58.51
step
click Portal to Dalaran
带着杰娜的传送门前往达拉然 |q 78716/1 |goto 53.43,58.01
step
在达拉然与卡德加会面 |q 78716/2 |goto Dalaran L/12 46.80,54.47
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin Painful Lessons##78716 |goto 42.87,59.86
step
talk Moira Thaurissan##214651
|tip 建筑内部
accept The Bronzebeard Family##80500 |goto 40.39,54.13
step
talk Brann Bronzebeard##214669
|tip 建筑内部
告诉他_"麦格尼受伤了。莫伊拉需要你们两个去肖像室。"_ |gossip 121542
與布蘭恩對話 |q 80500/1 |goto Dalaran L/10 50.73,55.59
step
talk Moira Thaurissan##214651
|tip 建筑内部
turnin The Bronzebeard Family##80500 |goto Dalaran L/12 40.35,54.03
step
talk Moira Thaurissan##214651
turnin Slept Like a Rock##81966 |goto Dalaran L/12 43.48,54.90
|only if haveq(81966) or completedq(81966)
step
talk Magni Bronzebeard##213624
|tip 建筑内部
accept A Mysterious Warning##78717 |goto Dalaran L/12 45.33,57.32
step
talk Archmage Khadgar##213627
|tip 建筑内部
告诉他_“我在这里等你”_ |gossip 121395
与卡德加交谈 |q 78717/1 |goto Dalaran L/12 42.84,59.91
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin A Mysterious Warning##78717 |goto Dalaran L/12 41.13,62.32
accept Citizens of Dalaran##78719 |goto Dalaran L/12 41.13,62.32
step
talk Brann Bronzebeard##214669
|tip 建筑内部
accept Meet the Team##78721 |goto Dalaran L/12 47.05,49.11
step
talk Archmage Drenden##214665
|tip 建筑内部
accept Strengthen the Wards##78718 |goto Dalaran L/12 56.41,33.22
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 52.66,35.03 |count 1
|tip 使用{o}吃食物{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 51.00,23.72 |count 1
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 42.65,34.27 |count 2
|tip 使用{o}捕捉蝴蝶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Elise Starseeker##220018
告诉她_“布兰恩让我来看看你”_ |gossip 121860
查看阿尔加里远征队的情况 |q 78721/1 |goto Dalaran L/10 37.62,46.25
step
use the Tuning Wand##220483
|tip 建筑内部
加强守卫 |q 78718/1 |goto Dalaran L/10 30.90,48.96 |count 2
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 45.04,72.14 |count 3
step
帮助达拉然公民 |q 78719/1 |goto Dalaran L/10 53.95,61.58 |count 3
|tip 使用{o}保护货架{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
use the Tuning Wand##220483
加强守卫 |q 78718/1 |goto Dalaran L/10 60.73,61.58 |count 4
step
talk Archmage Drenden##214665
|tip 建筑内部
turnin Strengthen the Wards##78718 |goto Dalaran L/12 56.42,33.15
step
talk Brann Bronzebeard##214669
|tip 建筑内部
turnin Meet the Team##78721 |goto Dalaran L/12 47.06,49.12
step
talk Archmage Khadgar##213627
|tip 建筑内部
turnin Citizens of Dalaran##78719 |goto Dalaran L/12 41.11,62.31
accept To Khaz Algar!##78722 |goto Dalaran L/12 41.11,62.31
step
talk Archmage Khadgar##213627
|tip 建筑内部
告诉他_“我准备出发了”_ |gossip 120143
与卡德加交谈 |q 78722/1 |goto Dalaran L/12 41.11,62.31
step
talk Alleria Windrunner##214908
|tip 建筑内部
turnin To Khaz Algar!##78722 |goto Dalaran TWW/0 50.45,50.45
accept Breach##79105 |goto Dalaran TWW/0 50.45,50.45
stickystart "Slay_The_Nerubians_79105"
step
clicknpc Professor Pallin##222425
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 58.68,50.37 |count 1
step
clicknpc Sabriana Sorrowgaze##222424
拯救公民 |q 79105/1 |goto Dalaran TWW/0 57.82,52.89 |count 2
step
clicknpc Lianna Tai##222426
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 58.83,54.36 |count 3
step
clicknpc Glaciela Rimebang##222474
拯救公民 |q 79105/1 |goto Dalaran TWW/0 57.93,57.12 |count 4
step
clicknpc Sandra Bartan##222446
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 53.34,53.45 |count 5
step
clicknpc Ol' Toomba##222447
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.89,53.22 |count 6
step
clicknpc Amisi Azuregaze##222445
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.56,57.24 |count 7
step
clicknpc Fialla Sweetberry##222473
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.03,62.21 |count 8
step
clicknpc Lucian Trias##222433
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 51.32,65.78 |count 9
step
clicknpc Kizi Copperclip##222449
|tip 建筑内部
拯救公民 |q 79105/1 |goto Dalaran TWW/0 53.24,66.66 |count 10
step
label "Slay_The_Nerubians_79105"
杀死周围的敌人
杀死努比亚人 |q 79105/2 |goto Dalaran TWW/0 56.03,64.29
'|kill Drone Abductor##219655, Nerubian Venomspitter##219661, Nerubian War-Weaver##219657, Pestilent Drone##219653, Rampaging Threadling##219664, Small Threadling##219662
step
talk Alleria Windrunner##214908
turnin Breach##79105 |goto Dalaran TWW/0 35.73,71.34
accept Rupture##79106 |goto Dalaran TWW/0 35.73,71.34
step
返回城市 |q 79106/1 |goto Dalaran TWW/0 41.20,59.43
step
浏览下水道 |q 79106/2 |goto Dalaran TWW/1 39.37,51.95
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 51.31,51.12 |count 1
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 50.57,59.01 |count 2
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 55.06,57.76 |count 3
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 58.04,53.06 |count 4
step
clicknpc Webbed Victim##219873
释放带网公民 |q 79106/3 |goto Dalaran TWW/1 60.85,49.00 |count 5
step
click Sewer Grate
进入下水道 |q 79106/4 |goto Dalaran TWW/1 66.80,50.81
step
将市民带到安全地带 |q 79106/5 |goto Dalaran TWW/2 72.55,57.77
step
talk Anduin Wrynn##219885
|tip 他就会跑到这个位置。
turnin Rupture##79106 |goto Dalaran TWW/2 72.55,57.77
accept Departure##80321 |goto Dalaran TWW/2 72.55,57.77
step
寻找其他出口 |q 80321/1 |goto Dalaran TWW/2 23.20,79.68
step
跑上楼梯 |goto Dalaran TWW/2 12.46,78.64 < 10 |walk
返回地面 |q 80321/2 |goto Dalaran TWW/0 40.95,36.44
step
kill Queensguard An'Jak Shabtir##219665 |q 80321/3 |goto Dalaran TWW/0 42.80,33.73
step
talk Archmage Khadgar##219956
问他_“你需要我做什么？”_ |gossip 124153
与卡德加交谈 |q 80321/4 |goto Dalaran TWW/0 44.47,37.57
step
click Khadgar's Portal##433329
turnin Departure##80321 |goto Dalaran TWW/0 44.13,36.59
step
accept Violent Impact##78529
|tip 你将自动接受这个任务。
|only if not (completedq(83621) or completedq(83543))
step
click Pile of Rubble
|tip 你被埋在下面的{o}灰色大石头。
|tip 点击{o}多次{}。
逃离废墟 |q 78529/1 |goto Isle of Dorn/0 28.91,54.53
|only if not (completedq(83621) or completedq(83543))
step
label "Skip_Isle_Of_Dorn_Intro"
talk Brann Bronzebeard##206017
|tip 建筑内部
accept Adventuring in Khaz Algar##83543 |goto Dornogal/0 47.40,44.41
|only if completedq(83621) or completedq(83543)
step
click Scouting Map
|tip 它看起来就像桌子上的一张{o}大牛皮纸地图{}。
|tip 你正在选择要在哪个区域做任务。
|tip {随便选一个，无所谓。
accept Isle of Dorn##83548 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83548)
accept The Ringing Deeps##83550 |goto Dornogal/0 48.26,43.79	|or |only if not completedq(83550)
accept Hallowfall##83551 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83551)
accept Azj-Kahet##83552 |goto Dornogal/0 48.26,43.79		|or |only if not completedq(83552)
从侦察地图中选择一个区域 |q 83543/1 |goto Dornogal/0 48.26,43.79 |only if haveq(83543)
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
_Click the Quest Complete Box:_
|tip 在任务追踪区
turnin Adventuring in Khaz Algar##83543
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
_Which Zone Did You Choose?_
|tip 点击下方你想要完成任务的区域。
多恩岛		|confirm	|next "Isle_Of_Dorn"
响铃深渊	|confirm	|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\响铃深渊 (Full Zone)"
万圣节降临		|confirm	|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\万圣节降临 (Full Zone)"
阿兹-卡赫特岛		|confirm	|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\阿兹-卡赫特岛 (Full Zone)"
|only if (haveq(83543) or completedq(83543)) and not haveq(78529)
step
label "Isle_Of_Dorn"
talk Thrall##211993
turnin Violent Impact##78529 |goto Isle of Dorn/0 29.45,55.07
|only if ((haveq(78529) or completedq(78529)) and not haveq(83548)) and Horde
step
talk Lady Jaina Proudmoore##211994
turnin Violent Impact##78529 |goto Isle of Dorn/0 29.51,55.01		|only if ((haveq(78529) or completedq(78529)) and not haveq(83548)) and Alliance
turnin Isle of Dorn##83548 |goto Isle of Dorn/0 29.51,55.01		|only if haveq(83548) or completedq(83548)
accept Slay the Saboteurs##78530 |goto Isle of Dorn/0 29.51,55.01
step
talk Thrall##211993
accept Urgent Recovery##78531 |goto 29.45,55.07
stickystart "Slay_Nerubians"
step
click Hastily-Prepared Antidote
援助坠机幸存者 |q 78531/1 |goto 30.22,54.60 |count 1
step
click Tower Fragment
援助坠机幸存者 |q 78531/1 |goto 30.57,53.86 |count 3
step
click Dalaran Power Shard
援助坠机幸存者 |q 78531/1 |goto 30.36,52.74 |count 4
step
click Rittsyn's Soulstone
援助坠机幸存者 |q 78531/1 |goto 31.41,54.20 |count 5
step
clicknpc Polymorphed Victim##214543
|tip 它看起来像一只只{o}友好的绵羊{}，在这个小区域里走来走去。
援助坠机幸存者 |q 78531/1 |goto 31.09,55.32 |count 6
step
click Sunreaver Satchel
援助坠机幸存者 |q 78531/1 |goto 30.92,55.13 |count 7
step
talk Archmage Aethas Sunreaver##223166
accept Erratic Artifacts##78532 |goto 30.95,55.11
step
clicknpc Damaged Arcane Relic##212795+
|tip 它们看起来像是{o}蓝色和粉色的漂浮水晶{}。
摧毁 #5# 损坏的奥术遗物 |q 78532/1 |goto 31.50,55.94
step
label "Slay_Nerubians"
杀死周围的敌人
杀死 #12# 奈鲁比人 |q 78530/1 |goto 30.69,54.44
'|kill Devious Webspinner##212717, Burrowing Saboteur##212715, Burrowing Saboteur##228057
step
talk Lady Jaina Proudmoore##211994
turnin Slay the Saboteurs##78530 |goto 29.50,55.01
turnin Erratic Artifacts##78532 |goto 29.50,55.01
step
talk Lady Jaina Proudmoore##211994
turnin Slay the Saboteurs##78530 |goto 29.50,55.01
turnin Erratic Artifacts##78532 |goto 29.50,55.01
step
talk Thrall##211993
turnin Urgent Recovery##78531 |goto 29.45,55.07
step
观看对话
talk Anduin Wrynn##212450
accept Secure the Beach##78533 |goto 29.53,54.98
step
与麦格尼重组 |q 78533/1 |goto 30.31,56.08
step
kill Queensguard Zirix##211858
抵挡女王卫队齐里克斯 |q 78533/2 |goto 30.19,56.53
step
观看对话
抵御齐里克斯的虫群 |q 78533/3 |goto 30.19,56.53
step
talk Baelgrim##211859
turnin Secure the Beach##78533 |goto 30.42,55.73
accept To Dornogal##78534 |goto 30.42,55.73
step
在多诺加尔与贝尔格里姆会面 |q 78534/3 |goto Dornogal/0 33.57,75.20
|tip 在墙的顶端。
step
talk Baelgrim##216628
|tip 在墙的顶端。
turnin To Dornogal##78534 |goto 33.57,75.20
accept They Come from Below##78535 |goto 33.57,75.20
step
clicknpc Lokren##212696
|tip 在墙的顶端。
登上洛肯山 |q 78535/1 |goto 33.91,75.71
step
_As You Fly:_
杀死周围的敌人
|tip 它们看起来像{o}各种蜘蛛敌人{}。
|tip 使用行动条上的能力。
杀死努比亚入侵者 |q 78535/2
step
观看样片
与贝尔格里姆会合 |q 78535/3
step
talk Baelgrim##217852
turnin They Come from Below##78535 |goto 36.20,64.23
accept Impossible Odds##78536 |goto 36.20,64.23
step
talk Thrall##219757
问他 _“计划是什么？”_ |gossip 121391
与鲛人对话 |q 78536/1 |goto 36.49,65.37
step
talk Baelgrim##217852
turnin Impossible Odds##78536 |goto Dornogal/0 36.21,64.22
accept Hypocenter##78460 |goto Dornogal/0 36.21,64.22
step
clicknpc Coreway Worker##216985
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 35.08,66.48 |count 1
step
clicknpc Coreway Worker##219992
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.47,66.77 |count 2
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.36,64.73 |count 3
step
click Dead Earthen
|tip 他在瓦砾下面。
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.42,64.73 |count 4
step
clicknpc Coreway Worker##219993
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 33.64,64.10 |count 5
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.95,62.60 |count 6
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.27,60.80 |count 7
step
click Coreway Rubble
清除危险并营救逸仙 |q 78460/1 |goto Dornogal/0 31.27,59.37 |count 8
step
talk Baelgrim##217853
|tip 建筑内部
turnin Hypocenter##78460 |goto Dornogal/0 29.65,59.68
step
talk Speaker Brinthe##217857
|tip 建筑内部
accept The Archive##78468 |goto Dornogal/0 29.39,59.94
step
talk Merrix##217854
|tip 建筑内部
accept Stones of Dornogal##78457 |goto Dornogal/0 29.40,59.45
step
使用棱镜法典查看记忆宝石 |q 78468/1 |goto Dornogal/0 29.22,59.68
|tip 使用 {o}Prismatic Codex{} 能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 楼内楼上
step
click Archival Repository
|tip 楼内楼上
将记忆宝石存入档案库 |q 78468/2 |goto Dornogal/0 29.22,59.68
step
talk Speaker Brinthe##217857
|tip 建筑内部
turnin The Archive##78468 |goto Dornogal/0 29.39,59.94
step
talk Oathsworn Peacekeeper##219014
告诉他们_“职业训练师”_ |gossip 122786
向守卫询问有关职业训练师的信息 |q 78457/1 |goto Dornogal/0 30.64,60.17
step
talk Breem##212369
|tip 楼外楼上。
选择 _“<用议会守护者的标记介绍自己>”_ |gossip 120909
与飞行大师布雷姆对话 |q 78457/2 |goto Dornogal/0 44.67,51.16
step
talk Breem##212369
fpath Dornogal |goto Dornogal/0 44.67,51.16
step
talk Ronesh##212370
|tip 建筑内部
选择 _“<用议会守护者的标记介绍自己>”_ |gossip 120913
与旅店老板罗内什交谈 |q 78457/3 |goto Dornogal/0 44.73,46.41
step
talk Ronesh##212370
|tip 建筑内部
home Dornogal |goto Dornogal/0 44.73,46.41 |q 78457
step
talk Brann Bronzebeard##206017
|tip 建筑内部
问他 _"你来了，布兰！这是怎么回事？ |gossip 122129
与布兰恩-铜须对话 |q 78457/4 |goto Dornogal/0 47.39,44.41
step
talk Auditor Balwurz##223728
|tip 建筑内部
对审计员巴尔沃茨说 |q 78457/5 |goto Dornogal/0 39.09,24.15
step
talk Merrix##217861
|tip 建筑内部
turnin Stones of Dornogal##78457 |goto Dornogal/0 39.87,26.00
accept State of the Union##78459 |goto Dornogal/0 39.87,26.00
step
talk Merrix##217861
|tip 建筑内部
告诉他_“告诉我多诺戈尔议会的事”_ Tell him _“Tell me about the Council of Dornogal.” _ |gossip 122305 |noautogossip
|tip 你可以观看对话，或者选择{o}“<略过对话>下次再告诉我”{}。
与梅瑞克斯对话 |q 78459/1 |goto Dornogal/0 39.87,26.00
step
talk Merrix##217861
|tip 建筑内部
turnin State of the Union##78459 |goto Dornogal/0 39.87,26.00
step
talk Moira Thaurissan##217864
|tip 建筑内部
accept The Fourth Seat##78461 |goto Dornogal/0 40.55,25.84
step
click Earthen Teleporter
|tip 建筑内部
使用土遁术 |q 78461/1 |goto Dornogal/0 40.73,22.33
step
在基础大厅顶端与贝尔格里姆会合 |q 78461/2 |goto Dornogal/0 40.68,28.37
step
talk Rannida##224544
accept Crossroads Plaza##82747 |goto Dornogal/0 46.76,32.95
step
talk Peacekeeper Leif##222224
|tip 你可能需要完成{o}Hallowfall故事战役{}才能接受这个任务。
accept An Oddball in Dornogal##80209 |goto 54.34,19.28
|only if level >= 80
step
talk Concerned Dornogal Citizen##222259
|tip 建筑内部
询问他_“你能告诉我关于阿拉提点灯人的信息吗？”_ |gossip 123322
询问关心此事的多诺加尔公民 |q 80209/1 |goto 54.44,24.28 |count 1
|only if level >= 80
step
talk Concerned Dornogal Citizen##222260
询问她_"你能告诉我关于阿拉提点灯人的什么信息？ |gossip 122511
询问关心此事的多诺加尔公民 |q 80209/1 |goto 56.80,28.05 |count 2
|only if level >= 80
step
talk Concerned Dornogal Citizen##222263
|tip 他在这附近走动。
|tip 建筑内部
询问他_“你能告诉我关于阿拉提点灯人的信息吗？”_ |gossip 122512
询问关心此事的多诺加尔公民 |q 80209/1 |goto 51.66,11.65 |count 3
|only if level >= 80
step
talk Aldra##219393
accept How Scandalous!##80207 |goto 62.71,21.74
step
进入高山上的建筑 |goto 65.72,17.08 < 10 |walk
talk Peacekeeper Leif##222268
|tip 建筑内部
turnin An Oddball in Dornogal##80209 |goto 67.18,18.72
accept Found Around the Unbound##80210 |goto 67.18,18.72
|only if level >= 80
step
调查锻造场附近的骚乱 |q 80207/1 |goto 49.89,49.32
|tip 在建筑门口的旁边。
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin How Scandalous!##80207 |goto 49.89,49.32
accept Seizing Evidence##79521 |goto 49.89,49.32
step
click Shipment Crate+
|tip 它们看起来像是{o}宝箱{}。
收集 #3# 被扣押的货物 |q 79521/1 |goto 51.38,51.24
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Seizing Evidence##79521 |goto 49.89,49.32
accept Withheld Information##79522 |goto 49.89,49.32
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 50.06,48.33 |count 1
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 49.78,48.03 |count 2
step
talk Line Worker##219395
|tip 建筑内部
审问生产线工人 |q 79522/1 |goto 49.59,48.25 |count 3
step
talk Line Worker##219395
审问生产线工人 |q 79522/1 |goto 48.98,49.49 |count 4
step
talk Line Worker##219395
审问生产线工人 |q 79522/1 |goto 48.90,49.59 |count 5
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Withheld Information##79522 |goto 49.88,49.32
accept Something Hidden##79523 |goto 49.88,49.32
step
click False-Bottomed Crate+
|tip 它们看起来像是{o}宝箱{}。
砸碎 3# 个箱子 |q 79523/1 |goto 51.39,51.23
step
click Nerubian Silk Ropes
收集证据 |q 79523/2 |goto 51.26,51.18 |count 1
step
click Infused Underclay
收集证据 |q 79523/2 |goto 51.37,51.38 |count 2
step
click Bag of Glowing Shards
收集证据 |q 79523/2 |goto 51.49,51.25 |count 3
step
click Bundle of Receipts
收集证据 |q 79523/2 |goto 51.55,51.29 |count 4
step
talk Peacekeeper Kragad##219394
|tip 在建筑门口的旁边。
turnin Something Hidden##79523 |goto 49.89,49.32
accept Report to the Councilward##79525 |goto 49.89,49.32
step
click Open Ledger
|tip 建筑内部
|tip 高高的山上
在议会大厦找到梅里克斯 |q 79525/1 |goto 55.62,6.08
step
click Open Ledger
|tip 建筑内部
接近梅里克斯的办公桌 |q 79525/2 |goto 55.62,6.08
step
click Open Ledger
|tip 建筑内部
turnin Report to the Councilward##79525 |goto 55.62,6.08
step
talk Bondaz##224566
turnin Crossroads Plaza##82747 |goto Isle of Dorn/0 55.21,55.85
step
click Wanted: The Boroughbreaker
accept Wanted: The Boroughbreaker##83335 |goto 55.24,55.92
step
talk Freysworn Etterca##226750
accept The Earthwound##83336 |goto 55.51,55.88
step
talk Urtago##221355
accept To Mourning Rise##81661 |goto 55.75,56.05
step
click Dropped Package
accept Lost Delivery##78754 |goto 55.54,56.50
step
talk Natalia Pearce##223637
accept For The Love of Gems##82441 |goto 43.04,70.04
step
talk Peacekeeper Leif##222314
turnin Found Around the Unbound##80210 |goto 42.66,70.96
accept The Pillage of Freywold Village##80211 |goto 42.66,70.96
|only if level >= 80
step
talk Aggartha##214444
accept Weapons and Warriors##78996 |goto Isle of Dorn/0 42.73,71.75
step
进入建筑 |goto 42.09,71.32 < 10 |walk
talk Freysworn Cruton##212708
|tip 建筑内部
accept Frayed Legacy##78570 |goto 41.63,71.34
step
talk Hreka##217961
|tip 大楼外
accept Prairie Fever##78469 |goto 41.75,70.84
step
click Pottery Jar
选择 _“<拾起罐子>”_ |gossip 121544
获得陶器 |q 78469/1 |goto Isle of Dorn/0 41.62,70.88 |count 1
step
click Pottery Jar
选择 _“<拾起罐子>”_ |gossip 121673
获得 #3# 陶器 |q 78469/1 |goto Isle of Dorn/0 41.63,70.87 |count 2
step
click Pottery Jar
选择 _“<拾起罐子>”_ |gossip 121546
获得 #3# 陶器 |q 78469/1 |goto Isle of Dorn/0 41.62,70.85 |count 3
step
进入建筑 |goto 41.55,72.36 < 10 |walk
talk Betta##223648
|tip 建筑内部
问她_"你对 Basalteous 了解多少？ |gossip 122466
与贝塔交谈 |q 82441/1 |goto 41.67,71.79
step
talk Kurron##223652
问他_"我在哪里可以找到巴萨尔铁斯？ |gossip 122467
与库伦对话 |q 82441/2 |goto 40.93,71.83
step
talk Germira##218535
accept All Ore Nothing##82792 |goto 41.04,72.09
step
talk Iridi##217439
fpath Freywold Village |goto 41.04,72.93
step
click Weapons Crate
获得武器箱 |q 78996/2 |goto 41.04,73.07 |count 1
step
talk Garrak##214459
选择 _"<解释农民的处境和他们提供的珍珠作为奖励。 |gossip 120276
招募勇士 |q 78996/1 |goto 41.40,73.96 |count 1
step
click Weapons Crate
|tip 建筑内部
获得武器箱 |q 78996/2 |goto 41.61,74.46 |count 2
step
talk Maluc##223649
|tip 建筑内部
问他 _“你对 Basalteous 了解多少？”_ |gossip 122463
与马鲁克交谈 |q 82441/3 |goto 41.63,74.96
step
click Arathi Journal
|tip 建筑内部
选择 _“<拿走日记>”_ |gossip 122552
收集第一条线索 |q 80211/1 |goto 41.85,73.87
|only if level >= 80
step
click Conspicuous Arathi Candle
|tip 楼内楼下
选择 _“<拿走烧焦的信件碎片>”___________________________。 |gossip 122553
|tip 你会受到攻击。
收集第二条线索 |q 80211/2 |goto 41.48,75.10
|only if level >= 80
step
talk Adelgonn##217879
问她_“你是阿德尔贡吗？”_ |gossip 122307
找到阿德尔贡 |q 78461/3 |goto Isle of Dorn/0 41.86,72.64
step
talk Adelgonn##217879
turnin The Fourth Seat##78461 |goto 41.86,72.64
accept Delve into the Earth##78464 |goto 41.86,72.64
step
talk Kaldrinn##214460
选择 _"<解释农民的处境和他们提供的珍珠作为奖励。 |gossip 120275
招募勇士 |q 78996/1 |goto 42.16,72.28 |count 2
step
talk Kodun##216094
|tip 建筑内部
选择 _"<交出陶器。 |gossip 121126
交出陶器 |q 78469/2 |goto 42.26,73.34
step
talk Kodun##216094
|tip 建筑内部
turnin Prairie Fever##78469 |goto 42.26,73.34
accept Monsters in the Dark##79691 |goto 42.26,73.34
accept Buried, Not Forgotten##79692 |goto 42.26,73.34
step
talk Arathi Soldier##222338
选择 _“<拿走纸条>”_ |gossip 122554
|tip 你会受到攻击。
收集第三条线索 |q 80211/3 |goto 43.87,75.91
|only if level >= 80
step
click Weapons Crate
获得武器箱 |q 78996/2 |goto 43.94,78.84 |count 3
step
talk Bertola##214462
|tip 进入塔楼，在一楼。
选择 _"<解释农民的处境和他们提供的珍珠作为奖励。 |gossip 120267
招募勇士 |q 78996/1 |goto 44.43,79.26 |count 3
step
talk Eiggard##214461
|tip 进入塔楼，在一楼。
选择 _"<解释农民的处境和他们提供的珍珠作为奖励。 |gossip 120274
招募勇士 |q 78996/1 |goto 44.46,79.26 |count 4
step
talk Merrimack##214463
|tip 外面，塔顶。
选择 _"<解释农民的处境和他们提供的珍珠作为奖励。 |gossip 120277
招募勇士 |q 78996/1 |goto 44.72,79.27 |count 5
step
talk Aggartha##215201
turnin Weapons and Warriors##78996 |goto 49.81,76.66
accept Pilfered Pearls##78997 |goto 49.81,76.66
accept Frontline Farmers##78998 |goto 49.81,76.66
stickystart "Collect_Pilfered_Pearls"
step
click Weapons Crate
分发武器箱 |q 78998/1 |goto 49.19,79.45 |count 1
step
click Weapons Crate
分发武器箱 |q 78998/1 |goto 50.74,77.56 |count 2
step
click Weapons Crate
分发武器箱 |q 78998/1 |goto 52.07,79.12 |count 3
step
label "Collect_Pilfered_Pearls"
杀死此区域周围的珍珠芬敌人
|tip 他们看起来像{o}哥洛克人{}。
collect 8 Pilfered Pearl##212176 |q 78997/1 |goto 50.55,80.54
'|kill Pearlfin Sparkleseeker##214432, Pearlfin Sea-Shaman##214435, Pearlfin Waterweaver##214434, Pearlfin Tiderunner##214433
step
talk Aggartha##215327
turnin Pilfered Pearls##78997 |goto 49.55,76.59
turnin Frontline Farmers##78998 |goto 49.55,76.59
accept Heart of a Hero##78999 |goto 49.55,76.59
step
kill Purgle-lurgle##214544 |q 78999/3 |goto 51.65,82.87
|tip 小屋内
step
kill Murgle-whurgle##214546 |q 78999/2 |goto 51.12,84.63
step
kill Burgle-gurgle##214545 |q 78999/1 |goto 49.34,83.85
step
talk Dorbund##215420
turnin Heart of a Hero##78999 |goto 50.51,78.62
step
talk Natalia Pearce##223637
turnin For The Love of Gems##82441 |goto 43.04,70.04
accept Precious Gems##82465 |goto 43.04,70.04
step
talk Peacekeeper Leif##222314
turnin The Pillage of Freywold Village##80211 |goto 42.66,70.96
accept The Abductors' Obstructors##80212 |goto 42.66,70.96
|only if level >= 80
step
前往地爬矿洞潜行 |q 78464/1 |goto 38.87,73.27
step
talk Brann Bronzebeard##213030
告诉他_"我们去拯救地穴中的土人吧。 |gossip 120958
与布兰恩-铜须对话 |q 78464/2 |goto 38.87,73.27
step
click Explorer's League Supplies
选择 _“<查看布兰恩-铜须的补给>”_ |gossip 122660
打开探险家联盟补给 |q 78464/3 |goto 38.90,73.28
step
为布兰恩-铜须选择战斗角色 |q 78464/4 |goto 38.90,73.28
|tip 按照屏幕上的指示操作。
step
进入地爬矿洞 |q 78464/5 |goto 38.55,73.93
|tip 穿过{o}传送门{}进入深渊。
|tip 进入小矿洞。
step
完成地爬矿洞目标 |q 78464/6
|tip 完成探险非常简单。
step
找到地窖宝藏 |q 78464/7
|tip 打开矿洞里的宝箱
step
离开地爬矿洞深入探险 |complete not subzone("Earthcrawl Mines") |q 78464
|tip 点击矿洞内{o}宝藏{}附近的{o}Leave-O-Bot 7000{}。
|tip 穿过{o}传送门{}离开深渊。
step
talk Brann Bronzebeard##213030
问他 _“你现在要做什么？”_ |gossip 120969
在地穴外与布兰恩-布朗泽比德交谈 |q 78464/8 |goto Isle of Dorn/0 38.75,73.30
step
click Discarded Botanist Notes
|tip 建筑内部
accept Concerning Fungarians##79686 |goto 35.79,77.17
step
click Discarded Research Notes
|tip 楼内楼上
收集研究笔记 |q 79686/1 |goto 35.82,77.18 |count 1
step
click Discarded Research Notes
|tip 楼内楼上
收集研究笔记 |q 79686/1 |goto 35.65,77.14 |count 2
step
kill Mossbloom Hazewalker##219019
|tip 楼上，楼顶
收集研究笔记 |q 79686/1 |goto 35.68,76.99 |count 3
stickystart "Collect_Modhinas_Belongings"
step
进入矿井 |goto 34.92,75.48 < 15 |walk
kill Ashen Stonestalker##217624 |q 79691/1 |goto 34.73,74.11
|tip 看起来像一只{o}没有翅膀的大蝙蝠{}，在这附近走来走去
|tip 矿洞内
step
clicknpc Modhina##219218
|tip 矿洞内
找到莫德希纳 |q 79692/2 |goto 34.60,74.32
step
label "Collect_Modhinas_Belongings"
杀死周围的敌人
|tip 矿洞内 |notinsticky{}。
收集 #3# 莫德希纳的遗物 |q 79692/1 |goto 34.92,75.48
'|kill Festering Sporemass##217963, Acute Blightspore##218423
step
沿着小路返回并离开矿井 |goto 34.92,75.48 < 15 |walk |only if subzone("Gemvein Tunnels") and indoors()
talk Natalia Pearce##223923
|tip 洞穴入口旁边。
告诉她_“你先请”_ |gossip 122493
在洞穴外见到娜塔莉亚 |q 82465/1 |goto 33.56,80.26
step
talk Natalia Pearce##223924
|tip 小山洞内
turnin Precious Gems##82465 |goto 33.87,79.59
accept What We Do For Gems##82466 |goto 33.87,79.59
step
kill Igneous Elemental##223657+
收集 #4# 元素核心 |q 82466/1 |goto 32.07,76.50
step
talk Natalia Pearce##223924
|tip 小山洞内
turnin What We Do For Gems##82466 |goto 33.87,79.59
accept Gems Are Forever##82467 |goto 33.87,79.59
step
click Igneous Core
|tip 小山洞内
放入第一个元素核心 |q 82467/1 |goto 33.79,79.37
step
click Igneous Core
|tip 小山洞内
放入第二个核心 |q 82467/2 |goto 33.96,79.67
step
click Igneous Core
|tip 小山洞内
放入第三个核心 |q 82467/3 |goto 33.88,79.38
step
click Igneous Core
|tip 小山洞内
放置第四个核心 |q 82467/4 |goto 33.97,79.55
step
观看对话
|tip 小山洞内
打败巴萨尔提奥斯 |q 82467/5 |goto 33.87,79.59
step
talk Natalia Pearce##223924
|tip 在洞穴里面。
turnin Gems Are Forever##82467 |goto 33.87,79.59
step
talk Adelgonn##217879
turnin Delve into the Earth##78464 |goto 41.86,72.64
accept A Natural Remedy##79553 |goto 41.86,72.64
step
talk Baelgrim##217881
accept Building Blocks##78463 |goto 41.77,72.66
step
talk Kodun##216094
|tip 建筑内部
turnin Monsters in the Dark##79691 |goto 42.26,73.34
turnin Buried, Not Forgotten##79692 |goto 42.26,73.34
step
观看对话
|tip 建筑内部
talk Hreka##217961
accept Hope, An Anomaly##79703 |goto 42.29,73.21
step
click Forge Vessel
|tip 建筑内部
将矿石放入锻炉 |q 79703/1 |goto 42.40,73.12
step
click Ball of Clay
|tip 建筑内部
制作粘土球 |q 79703/2 |goto 42.32,73.11
step
click Unfired Pot
|tip 建筑内部
拾起未烧制的陶罐 |q 79703/3 |goto 42.32,73.11
step
click Unfired Pot
|tip 建筑内部
将未烧制的罐子放入锻炉 |q 79703/4 |goto 42.39,73.08
step
talk Hreka##217961
|tip 建筑内部
turnin Hope, An Anomaly##79703 |goto 42.35,73.08
step
进入建筑 |goto 42.09,71.32 < 10 |walk
talk Yeonin##218729
|tip 建筑内部
turnin Concerning Fungarians##79686 |goto 41.46,71.39
stickystart "Collect_Glittering_Ore"
step
杀死周围的敌人
collect 10 Fungarian Chunks##213233 |q 79553/1 |goto 36.07,74.91
'|kill Scarlet Stinkcap##212579, Budling Morel##212577, Rustul Titancap##213115, Agaric Spreader##212578
step
label "Collect_Glittering_Ore"
click Unsorted Ore Pile+
|tip 它们看起来像一大堆{o}灰色岩石{}，里面有{o}红色宝石{}。
click Ore Fragment+
|tip 它们看起来像{o}红色的小晶体{}。
collect 20 Glittering Ore##211962 |q 78463/1 |goto 36.07,74.91
step
talk Baelgrim##217881
turnin Building Blocks##78463 |goto 41.76,72.91
step
talk Adelgonn##217879
turnin A Natural Remedy##79553 |goto 41.86,72.63
accept Echoes of Compassion##78462 |goto 41.86,72.63
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.75,72.43 |count 1
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.83,72.35 |count 2
step
clicknpc Injured Earthen##223459
医治受伤的艾尔特恩 |q 78462/1 |goto 42.07,72.62 |count 3
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.94,72.99 |count 4
step
clicknpc Injured Earthen##215765
医治受伤的艾尔特恩 |q 78462/1 |goto 41.92,73.01 |count 5
step
talk Findorn##216109
选择 _“<把芬多恩抬到水池边>”_ |gossip 120682
拾起芬多恩 |q 78462/2 |goto 41.79,72.96
step
clicknpc Findorn##217502
将芬多恩放入水池中 |q 78462/3 |goto 41.87,72.75
step
talk Ebona##216111
询问她_"艾伯纳怎么样了？ |gossip 120684
评估艾伯纳 |q 78462/4 |goto 41.86,72.67
step
观看对话
talk Adelgonn##217879
turnin Echoes of Compassion##78462 |goto 41.86,72.64
step
talk Moira Thaurissan##217878
accept The Proscenium##78470 |goto Isle of Dorn/0 41.89,72.69
step
talk Dagran Thaurissan II##225451
accept Not Enough Minerals##83081 |goto 44.82,64.41
step
talk Peacekeeper Hektare##225454
|tip 她在这附近打斗。
accept The Opalfront##83082 |goto 44.84,64.28
stickystart "Collect_Opals"
stickystart "Kill_Nerubian_Webspinners"
stickystart "Kill_Nerubian_Skirmishers"
step
talk Alvegar##224707
turnin All Ore Nothing##82792 |goto 45.87,62.83
accept Third Mine Blind##82796 |goto 45.87,62.83
step
label "Collect_Opals"
click Loose Opal Mound+
|tip 它们看起来像{o}一堆灰色的石头{}，里面有{o}蓝色的宝石{}。
收集 #6# 蛋白石 |q 83081/1 |goto 45.30,61.61
stickystop "Kill_Nerubian_Webspinners"
stickystop "Kill_Nerubian_Skirmishers"
step
kill Boroughbreaker Stik'kar##226294 |q 83335/1 |goto 45.37,55.44
|tip 它看起来像一只{o}巨大的昆虫{}。
|tip 它在这个地方诞生，并沿着这座桥行走。
step
talk Alvegar##224707
|tip 外面，洞穴上方。
turnin Third Mine Blind##82796 |goto 47.32,61.62
accept Hit Rock Bottom##82797 |goto 47.32,61.62
step
click Parachute
装备降落伞 |q 82797/1 |goto 47.32,61.66
step
探索奥帕克雷格 |q 82797/2 |goto 47.75,61.73
|tip {跳下洞口，进入洞穴。
|tip 在落地之前使用{o}降落伞{}能力。
|tip 它会以按钮的形式出现在屏幕上。
stickystart "Kill_Nerubian_Webspinners"
stickystart "Kill_Nerubian_Skirmishers"
step
talk Cenderragg##224708
|tip 在山洞的楼下
turnin Hit Rock Bottom##82797 |goto Isle of Dorn/0 48.59,60.74
accept An Opal of Mine##82798 |goto Isle of Dorn/0 48.59,60.74
accept Web Beats Rock##82799 |goto Isle of Dorn/0 48.59,60.74
stickystart "Collect_Opals_82798"
step
clicknpc Opalcreg Worker##226292+
|tip 它们看起来像{o}蠕动的茧{}。
|tip 在洞穴里面。
|tip {沿着螺旋形的小路向洞穴出口走去 一边做任务一边走
拯救 #6# 奥帕克雷格矿工 |q 82799/1 |goto 47.35,60.90
step
label "Collect_Opals_82798"
杀死周围的敌人
|tip 洞穴内部 |注释
|tip {沿着螺旋形的小路向洞穴出口走去 |注意
click Opal Ore##454189+
|tip 它们看起来像{o}一堆灰色的石头{}，里面有{o}蓝色的宝石{}。
收集 #8# 蛋白石 |q 82798/1 |goto 47.35,60.90
'|kill Nerubian Webspinner##224149, Nerubian Skirmisher##224150
step
talk Cenderragg##224708
|tip 在洞穴里面，出口附近。
turnin An Opal of Mine##82798 |goto 47.35,60.90
turnin Web Beats Rock##82799 |goto 47.35,60.90
accept A Sedimental Moment##82800 |goto 47.35,60.90
step
talk Opalcreg Worker##226838+
|tip 在洞穴里面。
告诉他们 _a "我们还抢到了很多。别担心。 |gossip 123365
启发 #4# 泥土 |q 82800/1 |goto 47.35,60.90
step
talk Cenderragg##224708
|tip 在洞穴里面。
turnin A Sedimental Moment##82800 |goto 47.35,60.90
accept Beetlejeweled##82801 |goto 47.35,60.90
step
离开洞穴 |goto 46.07,60.15 < 15 |walk |only if subzone("The Opalcreg") and indoors()
kill Kix'arak##224710 |q 82801/1 |goto 45.42,61.28
|tip 它看起来像一只{o}巨大的昆虫{}，在这附近走来走去。
step
label "Kill_Nerubian_Webspinners"
kill 6 Nerubian Webspinner##224149 |q 83082/2 |goto 46.07,60.14
|tip 矿洞内外。|注意
step
label "Kill_Nerubian_Skirmishers"
kill 8 Nerubian Skirmisher##224150 |q 83082/1 |goto 46.07,60.14
|tip 矿洞内外。|注意
step
talk Peacekeeper Hektare##225454
|tip 她在这附近打斗。
turnin The Opalfront##83082 |goto 44.84,64.28
step
talk Dagran Thaurissan II##225451
turnin Not Enough Minerals##83081 |goto 44.82,64.41
accept Golgrin's Reach##78465 |goto 44.82,64.41
step
talk Germira##218535
turnin Beetlejeweled##82801 |goto 41.05,72.09
step
talk Woldtender Igris##212700
turnin Frayed Legacy##78570 |goto 53.55,69.90
accept Mycomayhem##78571 |goto 53.55,69.90
step
杀死周围的敌人
collect 30 Boskroot Spores##210845 |q 78571/1 |goto 52.95,67.95
'|kill Boskroot Lashbane##217648, Boskroot Guardener##212697, kill Rotbark the Unfelled##217670, Boskroot Brute##212736, Boskroot Button##212766, Elder Shalehorn##212701, Infected Peafowl##212710, Boskroot Mycomancer##212698, Murmuring Trapcap##217719, Mycotic Shalehorn##212702, Mycotic Shalehorn##212704
step
talk Woldtender Igris##212700
turnin Mycomayhem##78571 |goto 53.55,69.90
accept Wold Memories##78572 |goto 53.55,69.90
step
调查弗雷德林的小屋 |q 78572/1 |goto 54.11,65.45
|tip 建筑内部
step
click Fine Earthen Urn
|tip 建筑内部
搜索骨灰瓮 |q 78572/2 |goto 54.28,65.52
step
click Dusty Memory Gem
|tip 建筑内部
聆听弗雷德林的回忆 |q 78572/3 |goto 54.17,65.23
step
click Oathbinder's Pledge
|tip 建筑内部
阅读誓言 |q 78572/4 |goto 54.57,65.19
step
click Freydrin's Shillelagh##411571
|tip 建筑内部
collect Freydrin's Shillelagh##216858 |q 78572/5 |goto 54.32,65.02
step
talk Woldtender Igris##218333
|tip 建筑内部
turnin Wold Memories##78572 |goto 54.23,65.28
accept Keeper's Aid##78573 |goto 54.23,65.28
stickystart "Cleanse_Infected_Wildlife"
step
click Ancient Stone Ward
摧毁石室 |q 78573/2 |goto 53.87,65.32 |count 1
step
click Ancient Stone Ward
摧毁石室 |q 78573/2 |goto 54.81,66.94 |count 2
step
click Ancient Stone Ward
摧毁石室 |q 78573/2 |goto 52.62,69.84 |count 3
step
click Ancient Stone Ward
摧毁石室 |q 78573/2 |goto 51.73,67.77 |count 4
step
label "Cleanse_Infected_Wildlife"
use Freydrin's Shillelagh##215158
|tip 对{o}野兽敌人使用{}。
清除 #4# 受感染的野生动物 |q 78573/1 |goto 52.97,68.00
'|clicknpc Elder Shalehorn##212701, Infected Peafowl##212710, Mycotic Shalehorn##212702
step
talk Woldtender Igris##218333
|tip 建筑内部
turnin Keeper's Aid##78573 |goto 54.24,65.28
accept Boss of the Bosk##78574 |goto 54.24,65.28
step
use Freydrin's Shillelagh##215142
|tip 对{o}未驯化的树皮{}使用。
|tip 它看起来像一棵四处走动的{o}大树{}。
|tip 它会变得虚弱，更容易被杀死。
|tip 它会以{o}黄色小点的形式出现在你的{o}迷你地图上。
kill Rotbark the Unfelled##217670 |q 78574/2 |goto 52.66,69.68
同时查看 [54.05,66.71] 附近的情况
step
talk Woldtender Igris##218333
|tip 建筑内部
turnin Boss of the Bosk##78574 |goto 54.23,65.28
step
talk Dagran Thaurissan II##225453
turnin Golgrin's Reach##78465 |goto 61.63,70.18
accept The History Beneath Us##79716 |goto 61.63,70.18
step
talk Speaker Brinthe##225478
accept Charge for a Charge##78467 |goto 61.66,70.19
stickystart "Collect_Shattered_Relic_Fragments"
step
click Sand Pile
|tip 站在这个{o}准确的位置{}，它就会出现。
collect Power Cell##215179 |q 78467/1 |goto 62.64,68.79 |count 1
step
click Sand Pile
|tip 站在这个{o}准确的位置{}，它就会出现。
collect Power Cell##215179 |q 78467/1 |goto 63.72,70.87 |count 2
step
click Sand Pile
|tip 移动到这个{o}准确位置{}，它就会出现。
|tip 水下。
collect Power Cell##215179 |q 78467/1 |goto Isle of Dorn/0 63.14,72.94 |count 3
step
label "Collect_Shattered_Relic_Fragments"
杀死周围的敌人
collect 20 Shattered Relic Fragments##225886 |q 79716/1 |goto 62.50,71.05
'|kill Swarming Sandwhisper##215360, Rising Tidebound##215361, Unbound Peblet##215363, Quaking Rager##215359
step
talk Dagran Thaurissan II##225453
turnin The History Beneath Us##79716 |goto 61.63,70.19
step
talk Speaker Brinthe##225478
turnin Charge for a Charge##78467 |goto 61.66,70.19
accept The Anachronism##79213 |goto 61.66,70.19
step
click Excavated Console
插入动力电池 |q 79213/1 |goto 61.75,69.97
step
click Titan Device
回收泰坦装置 |q 79213/2 |goto 61.75,69.97
step
use Titan Emitter##212602
|tip 对{o}鱼腥草守护者{}使用。
从元素中汲取能量 |q 79213/3 |goto 62.78,72.27
|tip 你会受到攻击。
'|clicknpc Sargassum Guardian##212582
step
kill Sargassum Guardian##212582 |q 79213/4 |goto 62.78,72.27
step
talk Speaker Brinthe##225478
turnin The Anachronism##79213 |goto 61.66,70.18
accept A Place Forgotten##83083 |goto 61.66,70.18
step
kill Roth the Earthwound##226300
collect Broken Stoneheart##225674 |q 83336/1 |goto 60.22,53.35
step
talk Freysworn Etterca##226750
turnin The Earthwound##83336 |goto 55.51,55.88
step
talk Moira Thaurissan##217898
turnin The Proscenium##78470 |goto 56.53,52.03
step
talk Baelgrim##217766
accept The Cavalry is Here##79701 |goto 56.56,52.02
step
talk Wenbrandt##212295
accept Fire in the Hole##79721 |goto 56.67,52.10
step
click Cinderbrew Keg
拿起煤渣酒桶 |q 79721/1 |goto 56.66,52.02
step
把煤渣酒扔进洞穴 |q 79721/2 |goto 56.74,52.13
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
stickystart "Repel_The_Nerubian_Invasion"
step
让尼鲁比安崩溃  |q 79721/3 |goto 58.22,50.49 |count 1
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
让尼鲁比安崩溃  |q 79721/3 |goto 56.79,49.37 |count 2
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
让尼鲁比安崩溃  |q 79721/3 |goto 55.03,49.49 |count 3
|tip 对着一大堆{o}裂开的泥土{}使用{o}煤渣酒瓶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
检查 Alleria Windrunner |q 79701/2 |goto 56.26,50.25
step
label "Repel_The_Nerubian_Invasion"
杀死周围的敌人
|tip 其中一些会飞向空中。
击退努比亚人的入侵 |q 79701/1 |goto 56.59,50.94
'|kill Nerubian Swarmer##216197, Clotweave Widow##216193, Venombane Spitter##216192, Armored Scuttler##216194, Necrofang Reaper##216191
step
talk Baelgrim##217766
turnin The Cavalry is Here##79701 |goto 56.45,48.09
step
talk Wenbrandt##212295
turnin Fire in the Hole##79721 |goto Isle of Dorn/0 56.42,47.95
step
talk Moira Thaurissan##217898
accept Convergence##78471 |goto Isle of Dorn/0 56.48,47.96
step
talk Peacekeeper Alef##226761
turnin Wanted: The Boroughbreaker##83335 |goto Dornogal/0 54.00,19.83
step
talk Moira Thaurissan##217905
|tip 建筑内部
turnin Convergence##78471 |goto 40.17,26.03
step
talk Merrix##217904
|tip 建筑内部
accept Group Effort##78538 |goto 39.87,26.01
step
use the Work Orders##213271+
|tip 用它们来对付{o}出境工人{}。
|tip 它们看起来就像附近大洞周围的{o}矮人{}。
分发 #10# 订单 |q 78538/1 |goto 36.01,52.58
'|clicknpc Unbound Worker##222539
step
talk Merrix##212746
turnin Group Effort##78538 |goto 36.01,52.58
step
talk Baelgrim##212747
accept Calling the Stormriders##80022 |goto 36.05,52.80
step
在斯托姆佩奇城外与贝尔格里姆会合 |q 80022/1 |goto 32.16,35.72
step
talk Baelgrim##222177
选择 _"我们走 <追随者地牢排队>"_ |gossip 122130
与贝尔格里姆对话以继续前进 |q 80022/2 |goto 32.16,35.72
step
进入地牢 |goto The Rookery/5 |q 80022
|tip 你将自动排队进入地牢。
step
清除风暴池的腐化 |q 80022/3
|tip 使用{o}Rookery{}地牢指南来完成这个任务。
|tip 你也可以使用{o}地牢援助{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你的{o}助手会带领你{}通过地牢。
step
clicknpc Stormrook##222818
|tip 完成地牢后，它看起来就像一只{o}巨大的蓝色麒麟{}站在附近的平台上。
返回多诺戈尔 |complete zone("Dornogal") |goto The Rookery/1 55.08,40.85 |q 80022
step
talk Rooktender Otwin##214352
accept To Rambleshire##78289 |goto Dornogal/0 32.76,33.63
step
talk Merrix##212746
turnin Calling the Stormriders##80022 |goto 36.00,52.58
step
talk Baelgrim##222555
accept Lasting Repairs##78539 |goto 35.92,52.71
step
talk Baelgrim##222555
问他 _“计划是什么？”_ |gossip 120626 |noautogossip
|tip 你可以观看对话，也可以选择{o}“<略过对话>你们可以自己讨论”{}。
讨论对抗奈鲁比尔人的计划 |q 78539/1 |goto 35.92,52.71
step
talk Baelgrim##222555
turnin Lasting Repairs##78539 |goto 35.92,52.71
accept To the Meadery##78540 |goto 35.92,52.71
step
talk Urtago##213187
turnin To Mourning Rise##81661 |goto Isle of Dorn/0 57.47,42.94
step
talk Korgran##213184
accept Before I Depart##78743 |goto 57.45,42.96
step
talk Urtago##213687
turnin Before I Depart##78743 |goto 61.70,41.59
accept Honor Their Memories##78744 |goto 61.70,41.59
stickystart "Deal_With_The_Kobold_Infestation"
step
click Earthen Figurine
摆放泥土雕像 |q 78744/2 |goto 62.01,41.77
step
click Deck of Cards
放置纸牌 |q 78744/1 |goto 62.11,41.38
step
click Precious Gem
放置珍贵宝石 |q 78744/3 |goto 62.52,40.95
step
label "Deal_With_The_Kobold_Infestation"
杀死周围的敌人
处理哥布林入侵 |q 78744/4 |goto 62.47,41.33
'|kill Candlelit Desecrator##215236, Candlelit Pebblemaker##218658
step
talk Urtago##213687
turnin Honor Their Memories##78744 |goto 61.70,41.59
accept You No Take Plunder!##78745 |goto 61.70,41.59
accept Laws Apply to All##78746 |goto 61.70,41.59
stickystart "Slay_Kobold_Invaders"
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 62.70,44.33 |count 1
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 63.19,43.35 |count 2
step
click Pile of Earthen Belongings
|tip 小房间里
collect Earthen Belongings##211428 |q 78745/1 |goto 63.87,42.33 |count 3
step
label "Slay_Kobold_Invaders"
杀死周围的敌人 |notinsticky
杀死 #12# 哥布林入侵者 |q 78746/1 |goto 63.33,42.54
'|kill Candlelit Hexthrower##213685, Candlelit Lootsnatcher##213197, Candlelit Boomer##213683, Candlelit Ouchpatcher##214252, Candlelit Big-Boomer##211546, Candlelit Blind-Hound##218213
step
talk Urtago##213688
turnin You No Take Plunder!##78745 |goto 63.30,42.64
turnin Laws Apply to All##78746 |goto 63.30,42.64
accept The Great Collapse##78747 |goto 63.30,42.64
accept Cutting the Wick##78748 |goto 63.30,42.64
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 62.85,44.78 |count 1
step
kill Workmaster Nast##213200 | q 78748/3 |goto 63.26,45.01
|tip 他在这附近走动。
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 63.54,44.34 |count 2
step
kill Workmaster Earwax##213195 | q 78748/2 |goto 64.35,44.09
step
use Explosive Sticks##211435
|tip 在伸出地面的{o}梯子上使用。
摧毁哥布林隧道 |q 78747/1 |goto 64.19,42.96 |count 3
step
kill Hairless the Menace##213550 |q 78748/1 |goto 64.74,42.51
|tip 他在这附近走动。
step
talk Urtago##213688
turnin The Great Collapse##78747 |goto 63.30,42.64
turnin Cutting the Wick##78748 |goto 63.30,42.64
accept Who Runs this Fine Establishment?##78749 |goto 63.30,42.64
step
kill Grand-Heister Bokk##213679 |q 78749/1 |goto 62.23,38.63
|tip 他在这附近走动。
|tip 小山洞内
step
talk Urtago##214292
告诉她_“完成了”_ |gossip 120867
与乌尔塔戈对话 |q 78749/2 |goto 62.46,39.55
step
talk Urtago##213187
turnin Who Runs this Fine Establishment?##78749 |goto 57.47,42.94
step
talk Korgran##213184
accept One More Tradition##79335 |goto 57.45,42.96
stickystart "Collect_Charged_Cores"
step
click Vein of Ore+
|tip 它们看起来像{o}灰色的采矿节点{}，里面有{o}蓝色的水晶{}。
collect 5 Clump of Ore##213001 |q 79335/2 |goto 59.50,42.45
step
label "Collect_Charged_Cores"
杀死周围的敌人
collect 5 Charged Core##213002 |q 79335/1 |goto 59.50,42.45
'|kill Scavenging Stormfang##218401, Great Stormfang##216017
step
进入建筑 |goto 57.39,42.91 < 15 |walk
talk Korgran##216169
|tip 建筑内部
turnin One More Tradition##79335 |goto 57.06,42.49
accept The Forging of Memories##79336 |goto 57.06,42.49
step
_NOTE:_
任务期间
|tip {科格兰会开始锻造，并告诉你把附近的东西交给他。
|tip {当他让你点击物品时{}。
点击此处继续 |confirm |q 79336
step
talk Korgran##216169
|tip 建筑内部
告诉他_“我准备好开始了！”_ |gossip 120605
与 Korgran 对话，开始锻造灯笼 |q 79336/1 |goto 57.06,42.49
step
观看对话
|tip {科格兰会开始锻造，并告诉你把附近的东西交给他。
|tip {当他让你点击物品时{}。
|tip 建筑内部
click A Pile of Coals
|tip 看起来附近有一堆{o}较小的黑色石头{}。
click Charged Core
|tip 它们看起来像桌子上的{o}蓝色水晶{}。
click Ore Barrel
|tip 附近好像有一个{o}装满泥土和石头的桶{}。
锻造灯笼 |q 79336/2 |goto 57.06,42.45
step
talk Korgran##216169
|tip 建筑内部
turnin The Forging of Memories##79336 |goto 57.06,42.49
accept The Last Journey##79337 |goto 57.06,42.49
step
观看对话
talk Urtago##213187
|tip 她最终跑到了这里。
turnin The Last Journey##79337 |goto 57.47,42.94
accept The Lost Earthen##79338 |goto 57.47,42.94
step
与乌尔塔戈会面 |q 79338/1 |goto 61.00,43.89
step
click Korgran's Lantern
找到科格兰 |q 79338/2 |goto 61.36,43.70
step
talk Korgran##216171
选择 _“<向 Korgran 展示灯笼>”_ |gossip 120893
告诉他_"她叫乌塔戈。她在等你。"_ |gossip 120892
观看对话
|tip 跟着{o}科格兰{}走。
与 Korgran 交谈 |q 79338/3 |goto Isle of Dorn/0 61.38,43.71
'|clicknpc Korgran##216877
step
talk Urtago##216878
turnin The Lost Earthen##79338 |goto 60.99,43.90
accept A Change of Tradition##79339 |goto 60.99,43.90
step
talk Urtago##216173
turnin A Change of Tradition##79339 |goto 69.82,56.77
accept Tools of Declaration##79340 |goto 69.82,56.77
accept Cleansing Ashes##79341 |goto 69.82,56.77
stickystart "Collect_Ashenfolds"
step
kill Shalehorn Impaler##216970+
collect 4 Pristine Horn##213171 |q 79340/1 |goto 66.94,56.06
step
label "Collect_Ashenfolds"
click Ashenfold+
|tip 它们看起来像是{o}一群白色的花朵{}。
collect 6 Ashenfold##213157 |q 79341/1 |goto 67.38,55.97
step
talk Urtago##216173
turnin Tools of Declaration##79340 |goto 69.82,56.77
turnin Cleansing Ashes##79341 |goto 69.82,56.77
accept As He Departs##79342 |goto 69.82,56.77
step
click Incense
上香 |q 79342/1 |goto 69.84,56.79
step
talk Korgran##216174
选择_"<把号角交给 Korgran。 |gossip 120638
将号角交给科格兰 |q 79342/2 |goto 69.85,56.76
step
观看对话
结束仪式 |q 79342/3 |goto 69.85,56.76
step
talk Urtago##216173
turnin As He Departs##79342 |goto 69.82,56.77
step
观看对话
talk Urtago##224930
accept The Weight of Duty##82895 |goto 69.89,57.04
step
talk Urtago##224948
|tip 建筑内部
告诉她_"我准备好帮忙了。 |gossip 122723
在瀑布哨站与乌尔塔戈对话 |q 82895/1 |goto 57.30,42.86
step
click New Placard
|tip 建筑内部
收集新牌匾 |q 82895/2 |goto 57.36,42.53
step
click Forge Tongs
|tip 建筑内部
加热牌 |q 82895/3 |goto 57.23,42.79
step
click Quenching Oil
淬火牌 |q 82895/4 |goto 57.37,43.05
step
click Tempered Placard
雕刻回火牌 |q 82895/5 |goto 57.06,43.49
step
talk Urtago##224948
turnin The Weight of Duty##82895 |goto 57.18,43.36
step
talk Harvester Farnee##214640
turnin Lost Delivery##78754 |goto 66.99,43.91
step
talk Harmot##213691
accept Honey and Clay the Pain Away##78757 |goto 67.00,43.83
step
click Earthen Mortar
打碎粘土 |q 78757/1 |goto 67.12,43.79
step
click Pot of Fire Honey
拾取火蜂蜜 |havebuff Holding Fire Honey##435155 |goto 66.81,44.05 |q 78757
step
将火蜂蜜放入灰泥中 |q 78757/2 |goto 67.11,43.79
|tip 使用{o}投掷火蜜{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
click Earthen Mortar
将蜂蜜与粘土混合 |q 78757/3 |goto 67.11,43.79
step
clicknpc Shalehoof##217815
将蜂蜜混合物涂抹在沙利欧夫上 |q 78757/4 |goto 67.00,43.80
step
talk Harmot##213691
turnin Honey and Clay the Pain Away##78757 |goto 67.00,43.83
accept Pulse Within the Earth##78758 |goto 67.00,43.83
step
talk Drelda##217542
fpath Durgaz Cabin |goto 67.48,43.31
step
click Tremor Stone
|tip 在{o}瀑布顶端{}。
|tip 你会受到攻击。
放置震颤石 |q 78758/1 |goto 65.23,46.20 |count 1
step
click Tremor Stone
|tip 你会受到攻击。
放置震颤石 |q 78758/1 |goto 65.80,47.18 |count 2
step
click Tremor Stone
|tip 你会受到攻击。
放置震颤石 |q 78758/1 |goto 66.30,46.26 |count 3
step
click Tremor Stone
|tip 你会受到攻击。
放置震颤石 |q 78758/1 |goto 66.20,46.82 |count 4
step
talk Harmot##214921
告诉他_"我已经放置了震颤石。 |gossip 120785
与哈莫特对话 |q 78758/2 |goto 66.99,47.37
step
talk Harmot##214921
turnin Pulse Within the Earth##78758 |goto 66.99,47.37
accept Playing in the Mud##78755 |goto 66.99,47.37
step
talk Harvester Farnee##214922
accept Lots and Lots of Fire Honey##78756 |goto 67.01,47.29
step
kill Scornful Sandshoal##214662+
collect Frenzied Sand Globule##211483+ |n
kill Frenzied Tidecore##213699+
collect Frenzied Water Globule##211484+ |n
use the Frenzied Sand Globule##211483+
|tip 你需要每种球状物{o}一个来组合它们。
click Elemental Silt Mound+
|tip 它们看起来像{o}一堆沙子{}。
collect 20 Elementally Charged Silt##211485 |q 78755/2 |goto 70.29,53.57
step
kill Coalesced Living Honey##217833
|tip 它看起来像一个{o}黄色的元素{}，在这附近走来走去。
collect Enormous Glob of Fire Honey##211489 |q 78756/1 |goto 70.77,43.49
step
talk Harvester Farnee##214922
turnin Lots and Lots of Fire Honey##78756 |goto 67.01,47.30
step
talk Harmot##214921
turnin Playing in the Mud##78755 |goto 66.99,47.37
accept To Wake a Giant##78759 |goto 66.99,47.37
step
clicknpc Slumbering Mountain Giant##217509
给山岭巨人涂上元素药膏 |q 78759/1 |goto 66.44,47.05
step
talk Harmot##214921
turnin To Wake a Giant##78759 |goto 66.99,47.37
step
talk Baelgrim##212749
turnin To the Meadery##78540 |goto 75.31,43.13
accept Lay the Trap##78541 |goto 75.31,43.13
step
talk Wenbrandt##212750
accept Evacuation Area##78542 |goto 75.31,43.17
stickystart "Evacuate_Unbound_Meadworkers"
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##434279 |goto 74.75,42.64 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.78,42.71 |count 1
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450651 |goto 74.50,42.20 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.51,42.27 |count 2
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450652 |goto 74.45,41.75 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.41,41.75 |count 3
step
click Rope Fuse
|tip 在{o}木梁{}的顶端。
握住引信 |havebuff Holding Fuse##450653 |goto 74.79,41.71 |q 78541
step
click Sizzling Keg
将保险丝连接到酒桶 |q 78541/1 |goto 74.79,41.66 |count 4
step
label "Evacuate_Unbound_Meadworkers"
clicknpc Unbound Meadworker##212452+
|tip 他们看起来像{o}矮人{}。
撤离 #8# 未被束缚的蜂蜜酒工人 |q 78542/1 |goto 74.64,43.21
step
talk Wenbrandt##212750
turnin Evacuation Area##78542 |goto 75.31,43.17
step
talk Baelgrim##212749
turnin Lay the Trap##78541 |goto 75.31,43.13
accept Poking the Spider Nest##78543 |goto 75.31,43.13
step
click Keg of Cinderbrew Mead
带走一桶煤渣酿蜂蜜酒 |q 78543/1 |goto 74.53,40.97
step
扰乱努比亚人的巢穴 |q 78543/2 |goto 75.08,38.81
|tip 对附近的{o}大蜘蛛网{}使用{o}投掷木桶{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
talk Baelgrim##212756
turnin Poking the Spider Nest##78543 |goto 74.78,42.34
accept Bring the Thunder##78544 |goto 74.78,42.34
step
设置防御 |q 78544/1 |goto 74.63,42.43 |count 1
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.65,42.22 |count 2
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.74,42.14 |count 3
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.84,42.13 |count 4
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.89,41.33 |count 5
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
设置防御 |q 78544/1 |goto 74.46,41.26 |count 6
|tip 在地面上使用{o}放置粘性煤渣蜂蜜{}能力。
|tip {敌人很快就会蜂拥而至，而{o}蜂蜜会将他们{}扎根在原地，使他们{o}更容易成为目标{}。
|tip 如果你愿意，也可以使用其他能力。
|tip 这并不重要。
step
talk Baelgrim##212756
告诉他_“我已经完成了防御工事”_ |gossip 120672
与贝尔格里姆对话，开始防御 |q 78544/2 |goto 74.78,42.34
step
杀死一波又一波进攻的敌人
|tip 当你飞行时，它们就在地面上。
|tip 使用行动条上的能力。
杀死努比亚人 |q 78544/3 |goto 74.78,42.34
step
观看对话
见证贝尔格里姆的计划 |q 78544/4 |goto 74.78,42.34
step
talk Adelgonn##217849
turnin Bring the Thunder##78544 |goto Isle of Dorn/0 75.10,43.82
accept Return to the Coreway##78545 |goto Isle of Dorn/0 75.10,43.82
step
talk Harmot##224394
accept Birdman of the Three Shields##82680 |goto 60.17,28.38
step
talk Tordrin##217543
fpath Rambleshire |goto 59.16,28.58
step
talk Rannan Korren##217763
accept A Titanic Expedition!##79724 |goto 58.79,28.27
step
进入建筑 |goto 58.64,27.75 < 10 |walk
在兰博郡寻找露芙塞拉 |q 78289/1 |goto 58.34,27.12
|tip 建筑内部
step
talk Violet Warden##226791
|tip 建筑内部
accept The Spirebreaker##83339 |goto 58.34,27.12
accept The Mage Slayer##83338 |goto 58.34,27.12
step
talk Rancher Edidithet##226792
|tip 建筑内部
accept Stormscarred##83337 |goto 58.38,28.33
step
talk Peacekeeper Leif##222353
turnin The Abductors' Obstructors##80212 |goto 57.56,30.05
|only if level >= 80
step
talk Lamplighter Kaerter##222352
accept Holy Fire in Rambleshire##80213 |goto 57.56,30.11
|only if level >= 80
step
kill Mage Slayer Phytethil##226298 | q 83338/1 |goto 55.49,32.20
|tip 他在这附近走动。
|tip 在山上
step
kill Stormscar##226295 |q 83337/1 |goto 59.75,34.59
step
kill Anub'esska##226299 |q 83339/1 |goto 61.16,37.91
|tip 它从地下钻出来
step
talk Rooktender Lufsela##211740
turnin To Rambleshire##78289 |goto 61.44,31.66
accept Power Predators##78291 |goto 61.44,31.66
accept Sleepy Sheep##78290 |goto 61.44,31.66
step
click Highlands Lodestone##410459+
|tip 它们看起来像{o}深灰色的小石头{}。
collect Lodestone##210489 |n
找到一块神石 |q 78290/1 |goto Isle of Dorn/0 62.06,31.09
step
clicknpc Shraubendre##212363
在 Shraubendre 旁为洛德石充电 |q 78290/2 |goto 61.51,31.61
stickystart "Slay_Mosswool_Predators"
step
clicknpc Lethargic Mosswool##212371+
唤醒 #8# 嗜睡苔藓人 |q 78290/3 |goto 61.04,29.09
你可以在 [59.72,32.44] 附近找到更多苔藓。
step
label "Slay_Mosswool_Predators"
杀死周围的敌人
杀死 #10# 苔藓掠食者 |q 78291/1 |goto 59.51,32.08
'|kill Stormtop Shalemaw##212364, Stormtop Terralisk##214581, Stormtop Shalemaw Young##212368
你可以在 [60.86,26.95] 附近找到更多
step
use the Flashfire Thurible##224104
|tip 用它来对付各种绵羊和矮人
|tip 你需要使用这个道具的{o}羊身上会{o}出现三条黄线{}。
|tip 你会受到攻击。
kill 6 Nightshade Abductor##224372 |q 80213/2 |goto 59.62,29.26
collect Nightshade Letter##224118 |q 80213/3 |goto 59.62,29.26
'|clicknpc Rambleshire Mosswool##214136, Rambleshire Mosswool##214137, Rambleshire Buck##226891, Rancher Langan##214561, Ramble Rider Enkor##226813, Tordrin##217543, Head Rancher Stenspor##209918, Rancher Tofstrun##214560, Rancher Fuoleim##214558, Rancher Kiespuch##209901, Rancher Kinnisant##214556, Rancher Silbarspra##214559, Rancher Buhisan##214557, Unthen##226509
|only if level >= 80
step
talk Rooktender Lufsela##211740
turnin Sleepy Sheep##78290 |goto 59.72,29.01
turnin Power Predators##78291 |goto 59.72,29.01
step
talk Head Rancher Stenspor##209918
accept Lost Lord of the Storm##78292 |goto 59.69,29.05
step
进入建筑 |goto 58.64,27.75 < 15 |walk
talk Violet Warden##226791
|tip 建筑内部
turnin The Spirebreaker##83339 |goto 58.33,27.12
turnin The Mage Slayer##83338 |goto 58.33,27.12
step
talk Rancher Edidithet##226792
|tip 建筑内部
turnin Stormscarred##83337 |goto 58.38,28.33
step
找到杜赞 |q 78292/2 |goto 55.56,28.79
step
click Nerubian Webbing+
|tip 它们看起来就像{o}大{o}ram脚上的{o}白色网{o}。
移除 #4# Webbings |q 78292/3 |goto 55.56,28.79
step
talk Head Rancher Stenspor##209918
turnin Lost Lord of the Storm##78292 |goto 58.73,30.24
accept Their Moss, Our Gain##78293 |goto 58.73,30.24
step
clicknpc Rambleshire Mosswool##214136+
|tip 其中一些可能会攻击你。
collect 8 Electrified Mosswool##211858 |q 78293/1 |goto 59.71,29.44
'|clicknpc Rambleshire Mosswool##214137, Rambleshire Mosswool##212373
step
click Harvested Mosswool
喂养杜赞 |q 78293/2 |goto 58.79,30.36
step
talk Head Rancher Stenspor##209918
turnin Their Moss, Our Gain##78293 |goto 58.73,30.24
step
talk Rooktender Lufsela##211740
accept Thunderhead Butt##78294 |goto 58.79,30.24
step
观看对话
|tip 跟着{o}杜尔赞{}走，{o}保护他{}。
|tip 他看起来像一只{o}大公羊{}。
|tip 他最终会把你带到这个地方。
让杜赞和贝尔茨特团聚 |q 78294/1 |goto 57.39,23.95
'|clicknpc Durzan##213112
step
talk Rooktender Lufsela##211740
turnin Thunderhead Butt##78294 |goto 58.94,29.89
step
talk Lamplighter Kaerter##222356
turnin Holy Fire in Rambleshire##80213 |goto 62.05,30.71
accept A Time to Kill at the Lumber Mill##80214 |goto 62.05,30.71
|only if level >= 80
step
talk Lamplighter Kaerter##222360
turnin A Time to Kill at the Lumber Mill##80214 |goto 67.04,31.18
accept Ungirthin' the Earthen##80215 |goto 67.04,31.18
|only if level >= 80
step
talk Peacekeeper Leif##222358
accept Concealed in the Weald##80216 |goto 67.06,31.25
|only if level >= 80
stickystart "Eliminate_Shadowsilk_Forces_At_The_Skolzgal_Mill"
step
click Lumberjack Restraints+
|tip 他们看起来像是被锁在矮人身上的{o}金属球。
|tip 你可能会遭到攻击。
释放 #8# 被绑架的伐木工人 |q 80215/1 |goto 66.64,27.85
'|clicknpc Abducted Lumberjack##219622
|only if level >= 80
step
label "Eliminate_Shadowsilk_Forces_At_The_Skolzgal_Mill"
杀死周围的敌人
消灭斯科尔兹格尔磨坊的暗影蚕丝部队 |q 80216/1 |goto 66.64,27.85
'|kill Shadowsilk Wallclimber##224844, Shadowsilk Burrower##224846, Shadowsilk Taskmaster##224843, Shadowsilk Woodwebber##224845, Shadowsilk Jailer##224842
|only if level >= 80
step
talk Peacekeeper Leif##222362
turnin Ungirthin' the Earthen##80215 |goto 65.94,24.70
turnin Concealed in the Weald##80216 |goto 65.94,24.70
accept A Lamplight for the Shipwright##80217 |goto 65.94,24.70
|only if level >= 80
step
进入洞穴 |goto 64.00,22.92 < 15 |walk
talk Shipwright Isaebela##219702
|tip 在洞穴里面。
观看对话
对抗船工伊萨贝拉 |q 80217/1 |goto 63.53,22.97
|only if level >= 80
step
kill 2 Shipwright Bodyguard##225218 | q 80217/2 |goto 63.53,22.97
|tip 在洞穴里面。
|only if level >= 80
step
clicknpc Lamplighter Kaerter##225440
|tip 在洞穴里面。
营救点灯人卡尔特 |q 80217/3 |goto 63.51,22.99
|only if level >= 80
step
talk Peacekeeper Leif##222363
turnin A Lamplight for the Shipwright##80217 |goto 65.98,23.86
accept Best Friends, Same Ends##83181 |goto 65.98,23.86
|only if level >= 80
step
talk Lamplighter Kaerter##222364
accept Up to No Good Down in Silkwood##80218 |goto 65.96,23.89
|only if level >= 80
step
进入海滩上的洞穴 |goto 64.65,20.06 < 20 |walk
click Silkwood Explosive Barrel
|tip 在洞穴里面。
收集丝克伍德炸药桶 |q 80218/1 |goto 63.88,20.04 |count 1
|only if level >= 80
step
click Silkwood Explosive Barrel
|tip 在洞穴里面。
收集丝克伍德炸药桶 |q 80218/1 |goto 64.12,21.37 |count 2
|only if level >= 80
step
kill Shipwright Isaebela##219801 | q 83181/1 |goto 64.49,21.13
kill Shadowspinner Azarak##222612 | q 83181/2 |goto 64.49,21.13
|tip 山洞的楼上
|only if level >= 80
step
click Silkwood Explosive Barrel
|tip 山洞的楼上
收集丝克伍德炸药桶 |q 80218/1 |goto 64.41,20.58 |count 3
|only if level >= 80
step
click Pile of Explosive Barrels
|tip 在洞穴里面。
炸塌丝克伍德隧道 |q 80218/2 |goto 63.69,20.68
|only if level >= 80
step
talk Peacekeeper Leif##222366
turnin Best Friends, Same Ends##83181 |goto 65.49,20.45
|only if level >= 80
step
talk Lamplighter Kaerter##222365
turnin Up to No Good Down in Silkwood##80218 |goto 65.51,20.45
|only if level >= 80
step
talk Olbarig##224392
turnin Birdman of the Three Shields##82680 |goto 74.56,19.71
accept Cloudrook Down##82681 |goto 74.56,19.71
step
杀死周围的敌人
杀死 #12# 元素 |q 82681/1 |goto 73.80,24.54
'|kill Riled Sandtwister##225900, Riled Dirtdiver##225905, Riled Rockwalker##225904, Riled Kelpcoil##225901
step
talk Olbarig##224392
turnin Cloudrook Down##82681 |goto 74.56,19.71
accept Elemental Hors D'Oeuvres##82682 |goto 74.56,19.71
step
click Electric Eel+
|tip 他们看起来像{o}蠕动的蓝鱼{}。
click Fishing Rod+
|tip 它们看起来像{o}靠在岩石上的柱子{}。
|tip 你可能会遭到攻击。
kill Angry Sandsnapper##225889+
collect 10 Electric Eel##224119 |q 82682/1 |goto 76.52,18.93
step
talk Olbarig##224392
turnin Elemental Hors D'Oeuvres##82682 |goto 74.56,19.71
accept Cloud Fishing##82768 |goto 74.56,19.71
step
喂养 #8# 狂野云龙 |q 82768/1 |goto 70.59,19.22
|tip 使用{o}喂食云龙的能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip {避开出现的龙卷风。
step
talk Olbarig##224392
|tip 他走到这个位置。
turnin Cloud Fishing##82768 |goto 70.74,19.85
step
talk Rannan Korren##217657
turnin A Titanic Expedition!##79724 |goto 77.92,30.29
step
talk Tuberros##217656
accept "Cataloguing"##79726 |goto 77.91,30.33
step
talk Rannan Korren##217828
accept Not a Heating Pack##79725 |goto 77.96,30.31
stickystart "Slay_Gorlocs"
step
click Titan Artifacts+
|tip 它们看起来像{o}白色的大球{}。
收集 #7# 泰坦神器 |q 79726/1 |goto 79.66,28.89
step
label "Slay_Gorlocs"
杀死周围的敌人
杀死 #12# 戈洛克人 |q 79725/1 |goto 79.72,29.19
'|kill Shimmerfin Mender##220246, Shimmerfin Scrapper##220252, Shimmerfin Oracle##220249
step
talk Rannan Korren##217828
turnin Not a Heating Pack##79725 |goto 77.96,30.31
step
talk Tuberros##217656
turnin "Cataloguing"##79726 |goto 77.91,30.33
step
talk Tharessa Sunstrand##217659
accept Because It's Shiny##79727 |goto 77.95,30.32
step
kill Gramwharl##220308+
collect Titan Artifact##215234 |q 79727/1 |goto 80.63,30.93
step
talk Tharessa Sunstrand##217659
turnin Because It's Shiny##79727 |goto 77.94,30.32
step
talk Rannan Korren##217828
accept It's Probably Nothing##79728 |goto 77.96,30.31
step
click Titan Orb
选择 _“<按中间按钮>”_ |gossip 121100
选择_"<先按右键再按左键>_” |gossip 121103
观看对话
与泰坦球互动 |q 79728/1 |goto 77.94,30.27
step
talk Rannan Korren##217828
turnin It's Probably Nothing##79728 |goto 77.96,30.31
step
talk Speaker Brinthe##226841
turnin A Place Forgotten##83083 |goto 44.92,20.56
accept The Old Orders##83084 |goto 44.92,20.56
step
click Forgotten Weapon Rack
|tip 建筑物内，一楼
检查遗忘武器架 |q 83084/1 |goto 44.63,20.83
step
click Crumbling Ironwood Parchment##455170
|tip 大楼内，顶楼
找到石化羊皮纸 |q 83084/2 |goto 44.58,20.52
step
在塔外见到达格兰 |q 83084/3 |goto 44.89,20.59
step
使用泰坦发射器 |q 83084/4 |goto 44.86,20.77
|tip 使用{o}Archaic Quandary{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
观看对话
talk Dagran Thaurissan II##225472
turnin The Old Orders##83084 |goto 44.89,20.58
accept The Old Guard##83087 |goto 44.89,20.58
step
调查坍塌的隧道 |q 83087/1 |goto 47.63,23.17
step
使用泰坦发射器 |q 83087/2 |goto 47.81,23.27
|tip 使用{o}Archaic Revelation{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你会受到攻击。
step
kill Manifested Protocol##222946 |q 83087/3 |goto 47.81,23.27
step
talk Dagran Thaurissan II##225472
turnin The Old Guard##83087 |goto 44.89,20.58
step
返回多诺加尔的梅瑞克斯 |q 78545/1 |goto Dornogal/0 32.07,59.69
step
talk Merrix##217880
turnin Return to the Coreway##78545 |goto 32.07,59.69
accept Recompense##78546 |goto 32.07,59.69
step
观看对话
talk Adelgonn##217883
告诉她_“告诉他们在蜂蜜酒厂发生了什么”_ |gossip 120772 |noautogossip
|tip 你可以观看对话，或者选择{o}“<略过对话>我们可以稍后再告诉他们细节”{}。
与阿德尔贡交谈 |q 78546/1 |goto 31.85,59.27
step
观看对话
听取汇报 |q 78546/2 |goto 31.85,59.27
step
talk Merrix##217880
告诉他_“我们开始吧”_ |gossip 120762
见证核心通道的修复 |q 78546/3 |goto 32.07,59.69
step
talk Merrix##217880
turnin Recompense##78546 |goto 32.06,59.69
step
完成响铃深渊故事活动 |complete completedq(79354)
|tip 使用 {o}The Ringing Deeps (Story Only){} 指南来完成。
|only if level >= 80
step
talk Saradi##225426
accept The Councilward's Summons##79542 |goto Dornogal/0 45.94,47.21
|only if level >= 80
step
talk Merrix##217069
|tip 建筑内部
告诉他_"和平守护者克拉加德让我把这些收据带给您。 |gossip 121397
在理事长崛起处与梅里克斯会面 |q 79542/1 |goto Dornogal/0 55.23,6.19
|only if level >= 80
step
talk Merrix##217069
|tip 建筑内部
turnin The Councilward's Summons##79542 |goto Dornogal/0 55.23,6.19
accept Dornogal's Benefactor##79543 |goto Dornogal/0 55.23,6.19
|only if level >= 80
step
talk Aufta##219431
|tip 建筑内部
告诉她_“我有一批来自共同朋友的货物要给你”_ |gossip 121217
交付水疗用品 |q 79543/1 |goto Dornogal/0 32.11,24.67
|only if level >= 80
step
talk Gostrof##217080
告诉他_“我从一位共同的朋友那里带来了一份礼物”_ |gossip 121218
运送乡村用品 |q 79543/2 |goto Dornogal/0 58.45,62.12
|only if level >= 80
step
talk Trader Harthan##217081
告诉他_“我从一位共同的朋友那里带来了一份礼物”_ |gossip 121219
递送关怀包裹 |q 79543/3 |goto Dornogal/0 52.29,52.24
|only if level >= 80
step
talk Trader Harthan##217081
告诉他_“我在听”_ |gossip 121405
与哈桑通话 |q 79543/4 |goto Dornogal/0 52.29,52.24
|only if level >= 80
step
talk Merrix##217095
turnin Dornogal's Benefactor##79543 |goto Dornogal/0 49.34,26.26
accept Security Through Trade##79544 |goto Dornogal/0 49.34,26.26
|only if level >= 80
step
talk Bevrusi##217072
告诉她_“我听说你能让我进私人的机器音箱酒吧”_ Tell her _“I'm told you could get me into the private Machine Speaker speakeasy.” _ |gossip 121407
与贝弗鲁西交谈 |q 79544/1 |goto Dornogal/0 55.61,50.23
|only if level >= 80
step
talk Bevrusi##217072
问她 _“您想交易什么？”_ |gossip 123489
看看贝弗鲁西会交易什么 |q 79544/2 |goto Dornogal/0 55.61,50.23
|only if level >= 80
step
talk Bevrusi##217072
turnin Security Through Trade##79544 |goto Dornogal/0 55.61,50.23
accept The Market Reeve of the Forgegrounds##79545 |goto Dornogal/0 55.61,50.23
|only if level >= 80
step
接近沃克格雷特 |q 79545/1 |goto Dornogal/0 45.06,48.93
|only if level >= 80
step
talk Ronesh##212370
|tip 建筑内部
告诉他_“我想浏览一下您的商品”_ |gossip 121503
buy Fresh Mug of Cinderbrew Mead##219961 |n
获得煤渣酒 |q 79545/2 |goto Dornogal/0 44.72,46.40
|only if level >= 80
step
talk Vokgret##217091
问她_"这是你的煤渣酒。现在，我们可以做生意了吗？ |gossip 121505
把煤渣酒带给沃克格雷特 |q 79545/3 |goto Dornogal/0 45.06,48.93
|only if level >= 80
step
talk Vokgret##217091
告诉她_"我在寻找液态蛋白石。我听说你有资源可以获得一些。 |gossip 121504
询问如何获得一小瓶液体蛋白石 |q 79545/4 |goto Dornogal/0 45.06,48.93
|only if level >= 80
step
talk Loldren##217090
|tip 建筑内部
告诉他_“沃克格雷特派我来收集一些文件”。 |gossip 121507
与洛德伦对话 |q 79545/5 |goto Dornogal/0 48.33,73.09
|only if level >= 80
step
click Auditor's Manifest
|tip 建筑内部
选择 _“<开始填写表格上的空白部分>”________________________。 |gossip 121512
告诉他_"平底锅之王： 土制烹饪工具历史指南"_ |gossip 121509
告诉_“贝尔加”_ |gossip 121519
告诉_“辣椒供应商”_ |gossip 123990
签署采购单 |q 79545/6 |goto Dornogal/0 48.27,73.18
审核洛德伦的市场 |q 79545/7 |goto Dornogal/0 48.27,73.18
|only if level >= 80
step
talk Nernabel##217088
|tip 建筑内部
告诉她_“洛德伦要求您在这份文件上签名”_。 |gossip 121452
问她_“我在哪里能为你找到岩浆核心？”_ |gossip 121528
与奈娜贝尔通话 |q 79545/8 |goto Dornogal/0 49.59,73.11
|only if level >= 80
step
click Sizzling Magma Core
|tip 建筑内部
|tip 你会受到攻击。
collect Sizzling Magma Core##211863 |q 79545/9 |goto Dornogal/0 50.44,63.78
|only if level >= 80
step
talk Nernabel##217088
|tip 建筑内部
告诉她_"我给你带来了一个岩浆核心。一个元素攻击了我，让我惹了麻烦。 |gossip 121547
获得妮娜贝尔的签名 |q 79545/10 |goto Dornogal/0 49.59,73.11
|only if level >= 80
step
talk Vokgret##217091
turnin The Market Reeve of the Forgegrounds##79545 |goto Dornogal/0 45.06,48.93
accept Opals and Runes##79176 |goto Dornogal/0 45.06,48.93
|only if level >= 80
step
talk Bevrusi##217072
问她 _“您想交易什么？”_ |gossip 121412
buy Speakeasy Passrune##217414 |n
交换通行证 |q 79176/1 |goto Dornogal/0 55.61,50.23
|only if level >= 80
step
talk Merrix##217097
turnin Opals and Runes##79176 |goto Dornogal/0 60.52,33.07
accept The Machine Speakeasy##79546 |goto Dornogal/0 60.52,33.07
|only if level >= 80
step
进入建筑 |goto Dornogal/0 61.51,34.55 < 15 |walk
在隧道中与梅里克斯会面 |q 79546/1 |goto Dornogal/0 62.86,40.69
|tip 建筑内部
|only if level >= 80
step
talk Speakeasy Runeguard##220564
|tip 建筑内部
选择 _“<将帕斯鲁恩追踪到巨人身上>”_ |gossip 121576
打开酒馆 |q 79546/2 |goto Dornogal/0 62.36,40.28
|only if level >= 80
step
talk Obstorn##217082
|tip 建筑内部
告诉他_"听他说完。梅里克斯只想让你转告阿德格林一个消息。 |gossip 121577
kill Obstorn##217082
面对奥布斯托恩 |q 79546/3 |goto Dornogal/0 62.04,37.65
|only if level >= 80
step
talk Merrix##219566
|tip 建筑内部
turnin The Machine Speakeasy##79546 |goto Dornogal/0 62.10,38.67
|only if level >= 80
step
离开建筑 |goto Dornogal/0 61.51,34.55 < 15 |walk |only if (subzone("The Corridors") or subzone("Cinderside Hall")) and indoors()
click Angrily-Scrawled Poster##429303
accept Sedition##79526 |goto Dornogal/0 45.90,47.17
|only if level >= 80
step
talk Merrix##219400
|tip 建筑内部
turnin Sedition##79526 |goto Dornogal/0 55.61,5.58
accept Damage Mitigation##79527 |goto Dornogal/0 55.61,5.58
accept Dispelling Rumors##79528 |goto Dornogal/0 55.61,5.58
|only if level >= 80
stickystart "Tear_Down_Seditious_Posters"
step
clicknpc Murmuring Peacekeeper##219449+
|tip 他们看起来像{o}装甲矮人{}。
|tip 你可能会遭到攻击。
驱散#6#喃喃自语的和平卫士 |q 79528/1 |goto Dornogal/0 47.93,28.31
|only if level >= 80
step
label "Tear_Down_Seditious_Posters"
click Seditious Poster+
|tip 他们看起来像钉在墙上的{o}纸张{}。
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
撕下 #8# 煽动叛乱的海报 |q 79527/1 |goto Dornogal/0 47.93,28.31
|only if level >= 80
step
talk Merrix##219400
|tip 建筑内部
turnin Damage Mitigation##79527 |goto Dornogal/0 55.61,5.57
turnin Dispelling Rumors##79528 |goto Dornogal/0 55.61,5.57
accept Forcing My Hand##79529 |goto Dornogal/0 55.61,5.57
|only if level >= 80
step
click Bundled Cloak
|tip 建筑内部
携带斗篷 |havebuff Carrying Cloak##441006 |goto Dornogal/0 55.08,6.38 |q 79529
|only if level >= 80
step
clicknpc Merrix##219400
|tip 建筑内部
把斗篷交给梅里克斯 |q 79529/1 |goto Dornogal/0 55.61,5.57
|only if level >= 80
step
click Accessory Chest
|tip 建筑内部
携带手套 |havebuff Carrying Gloves##441007 |goto Dornogal/0 56.38,5.95 |q 79529
|only if level >= 80
step
clicknpc Merrix##219400
|tip 建筑内部
将手套交给梅里克斯 |q 79529/2 |goto Dornogal/0 55.61,5.58
|only if level >= 80
step
clicknpc Gilded Knuckles##220092
|tip 建筑内部
携带武器 |havebuff Carrying Weapons##441008 |goto Dornogal/0 55.36,5.60 |q 79529
|only if level >= 80
step
clicknpc Merrix##219400
|tip 建筑内部
将武器交给梅里克斯 |q 79529/3 |goto Dornogal/0 55.61,5.57
|only if level >= 80
step
click Titan Device
|tip 建筑内部
携带泰坦装置 |havebuff Carrying Titan Device##441009 |goto Dornogal/0 55.85,6.67 |q 79529
|only if level >= 80
step
clicknpc Merrix##219400
|tip 建筑内部
将泰坦装置交给梅里克斯 |q 79529/4 |goto Dornogal/0 55.61,5.58
|only if level >= 80
step
talk Steelvein##219475
|tip 建筑内部
turnin Forcing My Hand##79529 |goto Dornogal/0 55.61,5.58
accept Bad Business##79530 |goto Dornogal/0 55.61,5.58
|only if level >= 80
step
在环形深渊与钢爪重组 |q 79530/1 |goto The Ringing Deeps/0 42.78,23.93
|only if level >= 80
step
talk Overseer Ardgrin##219477
|tip 建筑内部
告诉他_“钢铁之躯来找你了”_ |gossip 121524
观看对话
kill Sparking Haulbot##219497+
与监督者阿德格林对峙 |q 79530/2 |goto The Ringing Deeps/0 42.21,24.12
'|kill Sparking Haulbot##220191
|only if level >= 80
step
观看对话
talk Steelvein##220192
turnin Bad Business##79530 |goto The Ringing Deeps/0 42.48,23.94
|only if level >= 80
step
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Intro & Isle of Dorn (Full Zone)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\The Ringing Deeps (Full Zone)"	|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\The Ringing Deeps (Full Zone)",{
author="support@zygorguides.com",
},[[
step
talk Moira Thaurissan##217887
accept Into the Deeps##80434 |goto Dornogal/0 31.98,59.86
|only if not (haveq(83550) or completedq(83550))
step
talk Speaker Brinthe##212592
turnin Into the Deeps##80434 |goto The Ringing Deeps/0 42.10,28.34	|only if (haveq(80434) or completedq(80434)) and not haveq(83550)
turnin The Ringing Deeps##83550 |goto The Ringing Deeps/0 42.10,28.34	|only if haveq(83550) or completedq(83550)
accept Underground and Overwhelmed##78555 |goto The Ringing Deeps/0 42.10,28.34
step
talk Foreman Uzjax##218290
accept Getting Off Track##78557 |goto 42.12,28.27
stickystart "Help_The_Machine_Speakers_Secure_Ironhaul_Station"
step
clicknpc Buried Legs##215249
|tip 你会受到攻击。
调查翻倒的矿车周围区域 |q 78557/1 |goto 43.90,29.90
step
label "Help_The_Machine_Speakers_Secure_Ironhaul_Station"
clicknpc Injured Railhand##212390+
|tip 他们看起来像{o}躺在地上的勇士。
click Nerubian Explosive Cache+
|tip 它们看起来像{o}巨大的带刺金属球{}。
click Priority Transport Crate+
|tip 它们看起来像大型木箱和金属箱
kill Malfunctioning Railbot##218251+
|tip 它们看起来像{o}类人机器人{}。
帮助机器音箱确保 Ironhaul 站的安全 |q 78555/1 |goto 43.83,28.32
step
talk Foreman Uzjax##218290
turnin Getting Off Track##78557 |goto 42.13,28.27
step
talk Speaker Brinthe##212592
turnin Underground and Overwhelmed##78555 |goto 42.10,28.34
accept Pomp and Dire Circumstance##78837 |goto 42.10,28.34
step
talk Speaker Brinthe##212592
问她_“大家一直在谈论的 ”高级发言人 "是谁？ |gossip 122955
向布林特议长询问 “高级议长 ”的情况 |q 78837/1 |goto 42.10,28.34
step
talk Igram Underwing##215563
fpath Gundargaz |goto 46.87,33.36
step
talk Speaker Brinthe##212741
|tip 建筑内部
turnin Pomp and Dire Circumstance##78837 |goto 47.19,34.17
accept Cogs in the Machine##78838 |goto 47.19,34.17
step
talk Igram Underwing##215563
问他_"你是 Underwing 吗？ |gossip 121192
认识伊格拉姆-暗翼 |q 78838/1 |goto 46.87,33.36
step
talk Speaker Jurlax##213875
问他_"Jurlax 议长？ |gossip 121195
见见 Jurlax 议长 |q 78838/2 |goto 46.95,32.41
step
talk Innkeeper Brax##213840
|tip 建筑内部
accept Brax's Brass Knuckles##78918 |goto 47.99,32.17
step
talk Watcher Toki##213869
问她_“我猜你是守望者岐？”_ |gossip 121196
见到守望者岐 |q 78838/3 |goto 48.04,34.83
step
回到布林特的房子 |q 78838/4 |goto 47.19,34.17
|tip 建筑内部
step
talk Speaker Brinthe##212741
|tip 建筑内部
turnin Cogs in the Machine##78838 |goto 47.19,34.17
accept Speaking to the Speakers##78631 |goto 47.19,34.17
step
talk Machinist Kittrin##212695
|tip 建筑内部
accept Discarded and Broken##78562 |goto 48.24,33.39
step
talk Watcher Toki##213869
accept On Cold, Dark Wings##78900 |goto 48.04,34.83
step
click Machinist Plinth
collect Machinist's Gauge##210733 |q 78562/1 |goto 46.68,29.38
step
talk Batzvara##219784
accept The Caretaker of Brunwin's Terrace##80392 |goto 51.27,30.21
step
talk Emergency Militia##212839+
告诉他们_"布林特议长和我要去调查哥布林入侵事件。在我们回来之前，你要坚持住。"_ |gossip 120320
安抚 3#守卫者 |q 78631/1 |goto 51.84,29.58
stickystart "Kill_Sweetsnufflers"
stickystart "Find_Braxs_Brass_Knuckles"
step
clicknpc Inert Earthen##219785
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto 52.47,30.96 |count 1
step
clicknpc Inert Earthen##219785
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto 52.34,32.81 |count 2
step
clicknpc Inert Earthen##219785
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto 53.56,32.33 |count 3
step
clicknpc Inert Earthen##219785
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto The Ringing Deeps/0 54.43,31.95 |count 4
step
clicknpc Inert Earthen##219785
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto The Ringing Deeps/0 54.99,35.07 |count 5
step
clicknpc Inert Earthen##219785
|tip 在山上
|tip 你可能会遭到攻击。
向土人致敬 |q 80392/1 |goto 53.71,34.87 |count 6
step
click Machinist Plinth##411622
collect Machinist's Calipers##210732 |q 78562/2 |goto 52.47,34.11
step
kill The Ringing Death##214162 |q 78900/1 |goto 51.49,35.89
|tip 它看起来像一只{o}大蝙蝠挂在管道的{o}边上。
step
click Machinist Plinth##411624
|tip 在靠近地面的建筑顶部。
collect Machinist's Wrench##210734 |q 78562/3 |goto 50.06,36.64
step
label "Kill_Sweetsnufflers"
kill 10 Sweetsnuffler##219799 |q 80392/2 |goto 53.10,34.14
step
label "Find_Braxs_Brass_Knuckles"
杀死周围的敌人
collect Brax's Brass Knuckles##211493 |n
找到布拉克斯的铜指环 |q 78918/1 |goto 53.10,34.14
您可以在 [51.08,44.03] 附近找到更多。
'|kill Sweetsnuffler##219799, Underdrip Crawler##223069
step
talk Mindi Maxlof##224966
accept An Opportunity to Relax##82952 |goto The Ringing Deeps/0 53.80,43.79
step
click Rusted Lever##443532
accept Rust and Redemption##82195 |goto The Ringing Deeps/0 53.35,44.59
step
杀死周围的敌人
|tip 它们看起来像绿色的渗出物
collect 3 Pure Crawler Extract##221970 |q 82195/1 |goto The Ringing Deeps/0 52.11,42.56
'|kill Crawler Sproutling##223085, Underdrip Crawler##223069
step
click Rusted Lever##443532
turnin Rust and Redemption##82195 |goto The Ringing Deeps/0 53.35,44.59
step
talk Batzvara##224362
turnin The Caretaker of Brunwin's Terrace##80392 |goto 50.81,40.64
accept Shimmermist Falls##80408 |goto 50.81,40.64
step
talk Batzvara##219899
turnin Shimmermist Falls##80408 |goto 46.25,36.79
accept A Perfect Sponge##80401 |goto 46.25,36.79
accept Buckets and Blooms##80402 |goto 46.25,36.79
stickystart "Collect_Perfect_Lashroom_Cap"
stickystart "Collect_Caustic_Blooms"
step
kill Bytta##222653
|tip 它看起来像一只{o}大蜘蛛{}，在这个小地方走来走去。
collect Missing Bucket##218355 |n
寻找丢失的水桶 |q 80402/2 |goto 42.07,38.17
step
label "Collect_Perfect_Lashroom_Cap"
kill Creeping Lashroom##214958+
collect Perfect Lashroom Cap##218131 |q 80401/1 |goto 44.23,35.40
step
label "Collect_Caustic_Blooms"
click Caustic Bloom+
|tip 它们看起来像{o}开着粉色和白色花朵的小植物{}。
collect 8 Caustic Bloom##218187 |q 80402/1 |goto 43.89,36.93
step
talk Batzvara##219899
turnin A Perfect Sponge##80401 |goto 46.25,36.79
turnin Buckets and Blooms##80402 |goto 46.25,36.79
accept Mossy Earthen##80404 |goto 46.25,36.79
step
clicknpc Mossy Inert Earthen##219802
照料苔藓土人 |q 80404/1 |goto 46.25,36.76 |count 1
step
clicknpc Mossy Inert Earthen##219802
照料苔藓土人 |q 80404/1 |goto 45.38,36.69 |count 2
step
clicknpc Mossy Inert Earthen##219802
照料苔藓土人 |q 80404/1 |goto 44.80,36.94 |count 3
step
clicknpc Mossy Inert Earthen##219802
照料苔藓土人 |q 80404/1 |goto 44.99,37.93 |count 4
step
talk Batzvara##219899
turnin Mossy Earthen##80404 |goto 46.25,36.79
accept Tending to Ausgazur##80689 |goto 46.25,36.79
step
talk Batzvara##220784
turnin Tending to Ausgazur##80689 |goto 44.11,40.15
accept Too Much Drip##80405 |goto 44.11,40.15
step
talk Ausgazur##219900
检查奥斯卡祖尔 |q 80405/1 |goto 44.06,40.12
step
click Cooling Wax Puddle
调查冷却蜡 |q 80405/2 |goto 44.09,40.02
step
click Cooling Wax Puddle
追踪冷却蜡的踪迹 |q 80405/3 |goto 44.55,39.18
step
kill Waterworks Gem-thief##219788+
collect Stolen Gem##219216 |n
找到宝石大盗 |q 80405/4 |goto 45.49,41.31
step
talk Batzvara##220784
turnin Too Much Drip##80405 |goto 44.11,40.15
accept Seeking Ausgazur's Gems##80406 |goto 44.11,40.15
accept Glintwick the Gem Grabber##80407 |goto 44.11,40.15
stickystart "Collect_Gems_Of_Ausgazur"
step
进入建筑 |goto The Ringing Deeps/0 44.67,46.36 < 15 |walk
kill Glintwick##219797
|tip 建筑内部
collect Unfaceted Purple Gemstone##219213 |n
收集最后的宝石 |q 80407/1 |goto The Ringing Deeps/0 44.29,46.98
step
label "Collect_Gems_Of_Ausgazur"
杀死周围的敌人
|tip 只有名字中带有{o}宝石{}的才会{o}掉落任务物品{}。
collect 4 Gem of Ausgazur##219015 |q 80406/1 |goto The Ringing Deeps/0 45.06,44.27
'|kill Waterworks Gem-snatcher##219789, Waterworks Gem-nabber##219786, Waterworks Gem-thief##219788
step
talk Batzvara##220784
turnin Seeking Ausgazur's Gems##80406 |goto The Ringing Deeps/0 44.11,40.15
turnin Glintwick the Gem Grabber##80407 |goto The Ringing Deeps/0 44.11,40.15
step
talk Watcher Toki##213869
turnin On Cold, Dark Wings##78900 |goto The Ringing Deeps/0 48.04,34.83
step
talk Tired Worker##224967
散发传单 |q 82952/1 |goto The Ringing Deeps/0 47.66,34.56 |count 1
step
talk Tired Worker##224967
散发传单 |q 82952/1 |goto The Ringing Deeps/0 47.81,34.29 |count 2
step
进入建筑 |goto The Ringing Deeps/0 48.36,34.20 < 15 |walk
talk Tired Worker##224967
|tip 建筑内部
散发传单 |q 82952/1 |goto The Ringing Deeps/0 48.83,34.00 |count 3
step
talk Machinist Kittrin##212695
|tip 建筑内部
turnin Discarded and Broken##78562 |goto The Ringing Deeps/0 48.24,33.39
accept The Weight of a World##78563 |goto The Ringing Deeps/0 48.24,33.39
step
talk Tired Worker##224967
散发传单 |q 82952/1 |goto The Ringing Deeps/0 47.50,33.19 |count 4
step
talk Tired Worker##224967
散发传单 |q 82952/1 |goto The Ringing Deeps/0 47.49,32.50 |count 5
step
talk Tired Worker##224967
散发传单 |q 82952/1 |goto The Ringing Deeps/0 47.10,31.34 |count 6
step
进入建筑 |goto The Ringing Deeps/0 47.74,32.17 < 15 |walk
安抚 #6# 暴躁的顾客 |q 78918/2 |goto The Ringing Deeps/0 48.31,32.24
|tip 在{o}罗迪赞助人{ }旁边使用{o}铜指关节三明治{ }能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
'|clicknpc Rowdy Patron##214479
step
talk Innkeeper Brax##213840
|tip 建筑内部
turnin Brax's Brass Knuckles##78918 |goto The Ringing Deeps/0 47.99,32.17
step
kill Oath-Eater##206844
collect Machinist's Calibrated Weight##210740 |q 78563/1 |goto The Ringing Deeps/0 44.61,31.48
step
talk Machinist Kittrin##212695
|tip 建筑内部
turnin The Weight of a World##78563 |goto The Ringing Deeps/0 48.24,33.39
accept Reforged Purpose##78564 |goto The Ringing Deeps/0 48.24,33.39
step
talk Machinist Kittrin##212695
|tip 建筑内部
告诉他 _“我准备好帮你重新锻造工具了”_ |gossip 120147
与凯特琳对话 |q 78564/1 |goto The Ringing Deeps/0 48.24,33.39
step
clicknpc Spattered Charcoal##214843+
|tip 他们会出现在附近的地面上。
|tip 建筑内部
踢碎飞溅的木炭 |q 78564/2 |goto The Ringing Deeps/0 48.24,33.39
修复所有工具 |q 78564/3 |goto The Ringing Deeps/0 48.24,33.39
step
观看对话
|tip 建筑内部
talk Machinist Kittrin##212695
turnin Reforged Purpose##78564 |goto The Ringing Deeps/0 48.23,33.39
step
侦察制高点 |q 78631/2 |goto The Ringing Deeps/0 57.65,29.14
step
观看对话
talk Speaker Brinthe##212519
turnin Speaking to the Speakers##78631 |goto The Ringing Deeps/0 57.65,29.14
accept Leave No Stone Behind##78634 |goto The Ringing Deeps/0 57.65,29.14
accept Kobold Shoulder##78839 |goto The Ringing Deeps/0 57.65,29.14
step
talk Skitter##212269
accept Death and Waxes##78635 |goto The Ringing Deeps/0 57.68,29.15
stickystart "Collect_Flickerflame_Candles"
stickystart "Slay_Flickerflame_Kobolds"
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 56.47,24.85 |count 1
collect Faded Memory Gem##212178 |n |only if not completedq(78634)
accept Broken Memories##79206 |goto 56.47,24.85 |only if not completedq(78634)
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 58.82,25.07 |count 2
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 61.51,23.53 |count 3
step
click Fallen Earthen
收集土制身份牌 |q 78634/1 |goto 58.16,20.94 |count 4
step
label "Collect_Flickerflame_Candles"
杀死周围的闪烁火焰敌人
|tip 有的会在空中飞行。|无趣
|tip {o}闪烁火焰土爪动物{o}不会掉落{o}任务物品{o}。|注释
click Flickerflame Candles+
|tip 它们看起来就像一束束白色的蜡烛。
collect 12 Flickerflame Candle##210878 |q 78635/1 |goto 59.33,25.41
'|kill Flickerflame Kobold##212536, Flickerflame Sticker##212629, Flickerflame Scrabbler##212515, Flickerflame Geomancer##212528, Flickerflame Enforcer##212548, Flickerflame Candlekeeper##212524, Flickerflame Candleflyer##219341, Flickerflame Overseer##212542
step
label "Slay_Flickerflame_Kobolds"
杀死周围的闪烁火焰敌人 |notinsticky
|tip 有的会在空中飞行。|无趣
|tip {o}闪焰邋遢爪{ {o}动物{o}不会掉落{ {o}任务物品{ {o}。|不算
杀死 #24# 闪烁火焰哥布林 |q 78839/1 |goto 58.78,25.48
'|kill Flickerflame Kobold##212536, Flickerflame Sticker##212629, Flickerflame Scrabbler##212515, Flickerflame Geomancer##212528, Flickerflame Enforcer##212548, Flickerflame Candlekeeper##212524, Flickerflame Candleflyer##219341, Flickerflame Overseer##212542
step
talk Skitter##212269
turnin Death and Waxes##78635 |goto 57.68,29.14
step
talk Speaker Brinthe##212519
turnin Leave No Stone Behind##78634 |goto The Ringing Deeps/0 57.65,29.14
turnin Kobold Shoulder##78839 |goto The Ringing Deeps/0 57.65,29.14
turnin Broken Memories##79206 |goto The Ringing Deeps/0 57.65,29.14 |only if haveq(79206) or completedq(79206)
accept Engineering Destruction##78638 |goto The Ringing Deeps/0 57.65,29.14
step
talk Skitter##212269
accept Cracking Cogchewer##78637 |goto 57.69,29.15
step
进入储存库 |q 78638/1 |goto 57.64,24.20
stickystart "Scuttle_Mining_Rigs"
step
kill Cogchewer##212617
collect Cogchewer's Keys##211865 |q 78637/2 |goto 55.88,21.01
step
label "Scuttle_Mining_Rigs"
click Abandoned Mining Rig+
|tip 它们看起来像{o}坏掉的机器人{}。
kill Sparklit Rust Crusher##212597+
|tip 它们看起来像{o}棕色的人形机器人{}。
Scuttle #8# 采矿钻机 |q 78638/2 |goto 56.03,22.65
step
离开储存库 |goto 57.65,24.20 < 15 |walk |only if subzone("Lost Mines") and indoors()
talk Skitter##212269
turnin Cracking Cogchewer##78637 |goto 57.69,29.15
step
talk Speaker Brinthe##212519
turnin Engineering Destruction##78638 |goto 57.65,29.14
accept Retaking the Mines##78636 |goto 57.65,29.14
step
click Sealed Gate
观看对话
打开大门 |q 78636/1 |goto 59.65,21.52
step
kill Wickbreaker##215077 |q 78636/2 |goto 59.43,22.16
step
talk Speaker Brinthe##215671
|tip 她走到这里
turnin Retaking the Mines##78636 |goto 59.51,21.74
step
talk Skitter##215672
accept Manifesto Destiny##78640 |goto 59.54,21.75
step
侦察安全区域 |q 78640/2 |goto 61.50,32.00
step
分发 120# 小册子 |q 78640/3 |goto 64.78,32.29
|tip 你将在骑乘时{o}自动投掷小册子{}。
|tip 飞过空中的{o}大环{}，快速投掷{o}许多小册子{}。
step
talk Skitter##212991
turnin Manifesto Destiny##78640 |goto 61.50,32.02
accept Ko-boldening##78639 |goto 61.50,32.02
accept Not Waste, Not Want##79205 |goto 61.50,32.02
stickystart "Free_Oppressed_Kobolds"
stickystart "Collect_Useful_Looking_Scraps"
step
click Sizzling Barrel+
|tip 它们看起来像{o}更大的木桶{}。
collect 3 Unstable Cinderbrew Barrel##217015 |q 79205/2 |goto 64.53,33.00
step
label "Free_Oppressed_Kobolds"
kill Waxtail Browbeater##213000+
|tip 它们看起来像{o}大得多的哥布林{}。
kill Waxtail Tormentor##212983+
|tip 它们看起来像{o}拿着鞭子的大哥布林{}。
释放 #10# 被压迫的哥布林 |q 78639/1 |goto 64.53,33.00
step
label "Collect_Useful_Looking_Scraps"
杀死该区域周围的蜡尾敌人
|tip 蜡尾眉蝠和折磨者不会掉落任务物品。|不粘
click Intriguing Scrap+
|tip 它们看起来像{o}各种不同的物体{}。
collect 24 Useful Looking Scrap##212177 |q 79205/1 |goto 64.53,33.00
'|kill Waxtail Scavenger##212985, Waxtail Trapper##212987, Waxtail Candleflyer##219343, Waxtail Outrider##213095, Waxtail Dirtcaller##212988
step
talk Skitter##212991
turnin Ko-boldening##78639 |goto 61.50,32.02
turnin Not Waste, Not Want##79205 |goto 61.50,32.02
accept Tackling Torchsnarl##78641 |goto 61.50,32.02
step
talk Speaker Brinthe##212992
accept Wax On, Pot Off##79267 |goto 61.49,31.98
stickystart "Ruin_Wax_Pots"
step
进入洞穴 |goto 66.79,29.13 < 30 |walk
kill Torchsnarl##212993
|tip 在洞穴里面。
击败火炬熊 |q 78641/1 |goto 67.25,28.25
step
label "Ruin_Wax_Pots"
click Kobold Cauldron+
|tip 它们看起来像{o}装着黄色液体的大罐子。
毁掉 #6# 蜡罐 |q 79267/1 |goto 66.22,30.26
step
talk Speaker Brinthe##212992
turnin Wax On, Pot Off##79267 |goto 61.49,31.98
step
talk Skitter##212991
turnin Tackling Torchsnarl##78641 |goto 61.50,32.02
accept New Candle, New Hope##78642 |goto 61.50,32.02
step
talk Skitter##212991
告诉她_“我准备好潜入暗焰裂隙了”_。 |gossip 119957
与斯基特对话，进入暗焰裂隙 |q 78642/1 |goto 61.50,32.02
step
click Discarded Loot
|tip 杀死洞穴里的最后一个 Boss{} 之后就可以打开它。
|tip 完成暗焰裂缝探险就能打开它。
|tip 完成探险非常简单。
取回烛冠 |q 78642/2 |goto Darkflame Cleft Scenario/0 44.45,89.81
step
观看对话
talk Skitter##216103
告诉她_“我们快离开这里！”_ |gossip 119961
与斯奇特对话以离开暗焰裂隙 |complete subzone("The Warrens") |goto Darkflame Cleft Scenario/0 41.53,90.00 |q 78642
step
talk Skitter##212991
turnin New Candle, New Hope##78642 |goto The Ringing Deeps/0 61.49,32.02
step
talk Speaker Brinthe##212992
accept Back to Gundargaz##80082 |goto 61.49,31.98
step
talk Speaker Brinthe##218715
turnin Back to Gundargaz##80082 |goto 47.09,33.23
step
talk Moira Thaurissan##218714
accept A Wrench in the Works##80079 |goto 47.13,33.24
step
talk Skitter##222803
accept Home Is Where the Candle Is##79683 |goto The Ringing Deeps/0 47.11,33.27
同时查看 [The Ringing Deeps/0 47.17,34.16] 处的建筑内部。
step
talk Fourman Grimes##216568
|tip 建筑内部
accept Kobold Kleanup##80058 |goto The Ringing Deeps/0 47.81,35.40
step
talk Janky##216567
|tip 建筑内部
accept New Home, New Candle!##81999 |goto The Ringing Deeps/0 47.76,35.41
step
talk Granny Scribbles##216438
|tip 建筑内部
accept Dripsy Forgot Her Candle##79504 |goto The Ringing Deeps/0 47.98,35.73
step
talk Granny Scribbles##216438
|tip 建筑内部
告诉她_“跟我说说滴水侠吧，斯克布里老奶奶”_ |gossip 121559
向斯克里布斯老奶奶询问有关滴水症的信息 |q 79504/1 |goto The Ringing Deeps/0 47.98,35.73
step
kill Sweetshine Grub##216957+
|tip {避开{o}精英敌人{ }。
collect Sweetmeat##217998+ |n
click Shinies+
|tip 他们看起来像{o}深紫色的水晶{}。
collect Shiny Rock##217997+ |n
收集 #12# 闪亮的石头或糖果 |q 79504/2 |goto The Ringing Deeps/0 67.40,49.51
step
观看对话
回到斯克布里老奶奶身边 |complete subzone("Gundargaz") |q 79504
step
talk Granny Scribbles##216438
|tip 建筑内部
turnin Dripsy Forgot Her Candle##79504 |goto The Ringing Deeps/0 47.98,35.73
accept Chomps and the Cave-In##79505 |goto The Ringing Deeps/0 47.98,35.73
step
talk Granny Scribbles##216438
|tip 建筑内部
告诉她_“跟我说说 Chomps，Scribbles 奶奶。”_ |gossip 121585
向斯克里布老奶奶询问 Chomps 的情况 |q 79505/1 |goto The Ringing Deeps/0 47.98,35.73
step
click Rock Face
|tip 在洞穴里面。
挖到高处 |q 79505/2 |goto The Ringing Deeps/0 64.78,40.43
step
clicknpc Trapped Kobold##220532+
|tip 在洞穴里面。
释放 #8# 被困住的哥布林 |q 79505/3 |goto The Ringing Deeps/0 65.86,39.15
step
观看对话
回到斯克布里老奶奶身边 |complete subzone("Gundargaz") |q 79505
step
talk Granny Scribbles##216438
|tip 建筑内部
turnin Chomps and the Cave-In##79505 |goto The Ringing Deeps/0 47.97,35.73
accept The Day the Stoneheads Came##79507 |goto The Ringing Deeps/0 47.97,35.73
step
talk Granny Scribbles##216438
|tip 建筑内部
告诉她_“告诉我石头人来的那天，Scribbles 奶奶。”_ |gossip 121599
向斯克里布老奶奶询问石头人到来的日子 |q 79507/1 |goto The Ringing Deeps/0 47.97,35.73
step
观看对话
找到软脚虾 |complete subzone("Lost Mines") |q 79507
step
click Softsnout's Favorite Shovel##436933
|tip 在洞穴里面。
collect Softsnout's Favorite Shovel##218249 |q 79507/2 |goto The Ringing Deeps/0 56.07,23.23
step
clicknpc Panicking Kobold##220755+
|tip 点击{o}登山梯{ }，走出深坑{ }。
|tip 在洞穴里面。
click Various Object+
|tip 它们看起来像{o}各种不同名称的物体{}。
kill Stonehead Koboldcrusher##220792+
保存可以保存的东西 |q 79507/3 |goto The Ringing Deeps/0 55.88,22.69
step
观看对话
回到斯克布里老奶奶身边 |complete subzone("Gundargaz") |q 79507
step
talk Granny Scribbles##216438
|tip 建筑内部
turnin The Day the Stoneheads Came##79507 |goto The Ringing Deeps/0 47.98,35.73
accept Mipsy Mole-Rider##79508 |goto The Ringing Deeps/0 47.98,35.73
step
talk Granny Scribbles##216438
|tip 建筑内部
告诉她_“跟我说说米普西，涂鸦奶奶”_ |gossip 121622
向涂鸦奶奶询问有关米普西的事情 |q 79508/1 |goto The Ringing Deeps/0 47.98,35.73
step
观看对话
到达叽叽喳喳巢穴 |complete subzone("Chittering Den") |q 79508
step
clicknpc Hungry Mole##217013
骑上饥饿的鼹鼠 |q 79508/2 |goto The Ringing Deeps/0 72.51,39.45
step
clicknpc Juicy Grub##217011
收集多汁的蛴螬 |q 79508/3 |goto The Ringing Deeps/0 72.51,39.45
step
clicknpc Hungry Mole##217013
骑上饥饿的鼹鼠 |q 79508/4 |goto The Ringing Deeps/0 72.51,39.45
step
_While Riding the Hungry Mole:_
完成鼹鼠骑术课程 |q 79508/5
|tip {跑过{o}米普西鼹鼠的{o}赛道标记{}。
|tip 它们看起来像{o}黄色的杆状结构{}，上面有{o}箭头在跳动{}。
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
step
观看对话
回到斯克布里老奶奶身边 |complete subzone("Gundargaz") |q 79508
step
talk Granny Scribbles##216438
|tip 建筑内部
turnin Mipsy Mole-Rider##79508 |goto The Ringing Deeps/0 47.98,35.73
accept The Wickless Candle##79510 |goto The Ringing Deeps/0 47.98,35.73
step
talk Granny Scribbles##216438
|tip 建筑内部
告诉她_“跟我说说无芯蜡烛的事，涂鸦奶奶”_ |gossip 121650
向涂鸦奶奶询问无芯蜡烛的事 |q 79510/1 |goto The Ringing Deeps/0 47.98,35.73
step
观看对话
到达叽叽喳喳巢穴 |complete subzone("Chittering Den") |q 79510
step
click Grabby Rock+
|tip 它们看起来像{o}谭石{}，沿着柱子的{o}边{}。
开始攀爬 |q 79510/2 |goto The Ringing Deeps/0 70.05,38.43
step
click Grabby Rock+
|tip 它们看起来像{o}谭石{}，沿着柱子的{o}边{}。
|tip {点击它们，直到到达柱子顶端。
|tip {避开蜘蛛，它们会把你撞倒，让你失去一些进展。
click Squeezy Hole
|tip 它看起来像一个{o}棕色裂开的大土堆{}。
|tip 在柱子顶端的一侧
向上爬 |q 79510/3 |goto The Ringing Deeps/0 69.66,38.64
step
观看对话
到达多恩岛 |complete zone("Isle of Dorn") |q 79510
step
离开洞穴 |q 79510/4 |goto Isle of Dorn/0 74.98,23.89
step
click Prooftelling Flower+
|tip 它们看起来像开着白花的植物
collect Prooftelling Flower##219224 |q 79510/5 |goto Isle of Dorn/0 74.53,24.64
step
观看对话
回到斯克布里老奶奶身边 |complete subzone("Gundargaz") |q 79510
step
talk Granny Scribbles##216438
|tip 建筑内部
turnin The Wickless Candle##79510 |goto The Ringing Deeps/0 47.98,35.73
向涂鸦老奶奶学习 |q 79683/2 |goto The Ringing Deeps/0 47.98,35.73
stickystart "Pull_Overgrowths"
stickystart "Clear_Rubble"
stickystart "Catch_Stoneskitterers"
step
talk Concerned Machine Speaker##219158
告诉他_“现在是说出来的时候了”_ |gossip 121184
聆听怨言 |q 80079/1 |goto 47.22,32.33 |count 1
step
talk Concerned Machine Speaker##218722
告诉她_“现在是说出来的时候了”。 |gossip 121182
聆听怨言 |q 80079/1 |goto 47.27,32.21 |count 2
step
talk Agitated Machine Speaker##218724
告诉他_“现在是说出来的时候了”_ |gossip 121038
聆听怨言 |q 80079/1 |goto 47.22,32.01 |count 3
step
talk Agitated Machine Speaker##219155
告诉她_“现在是说出来的时候了”。 |gossip 121181
聆听怨言 |q 80079/1 |goto 47.14,32.13 |count 4
step
talk Moira Thaurissan##218714
turnin A Wrench in the Works##80079 |goto 47.13,33.23
step
talk Speaker Brinthe##218715
accept The Tunnel's End##78685 |goto 47.09,33.23
step
label "Pull_Overgrowths"
click Encroaching Overgrowth+
|tip 它们看起来像{o}成片的绿藻{}。
拔除 3#杂草 |q 80058/1 |goto The Ringing Deeps/0 47.70,32.49
step
label "Clear_Rubble"
click Rubble+
|tip 它们看起来像{o}成堆的石头{}。
清除 #6# 碎石 |q 80058/2 |goto The Ringing Deeps/0 47.70,32.49
step
label "Catch_Stoneskitterers"
clicknpc Infesting Stoneskitterer##218638+
|tip 它们看起来像{o}蜥蜴{}。
抓住 6 号石匠 |q 80058/3 |goto The Ringing Deeps/0 47.70,32.49
step
talk Fourman Grimes##217131
turnin Kobold Kleanup##80058 |goto The Ringing Deeps/0 47.32,31.86
accept On the Job Training##79556 |goto The Ringing Deeps/0 47.32,31.86
step
talk Steamwarden Hurlt##216600
与蒸汽主管赫尔特交谈 |q 79556/1 |goto The Ringing Deeps/0 47.22,31.60
step
talk Steamwarden Hurlt##216600
告诉他_"我就是。告诉我该怎么做。 |gossip 121058
观看对话
|tip {当他告诉你的时候，点击附近的物体
修理蒸汽厂 |q 79556/2 |goto The Ringing Deeps/0 47.22,31.60
step
talk Fourman Grimes##217131
turnin On the Job Training##79556 |goto The Ringing Deeps/0 47.32,31.86
accept Pipe Patching##79680 |goto The Ringing Deeps/0 47.32,31.86
accept Plumber Power##79681 |goto The Ringing Deeps/0 47.32,31.86
step
talk Tunnel Rat Crew Boss##218474
|tip 在墙上
告诉他_"让我们一起研究一下图纸。警告：这会跳过谜题，但要花很长时间。 |gossip 120927
疏通蒸汽隧道 |q 79681/2 |goto The Ringing Deeps/0 48.50,31.03
|tip 完成目标需要{o}一些时间{}。
step
修补 #12# 漏水管道 |q 79680/1 |goto The Ringing Deeps/0 48.86,32.16
|tip 飞到{o}从管道里喷出的蒸汽旁边{}。
step
talk Fourman Grimes##217131
turnin Pipe Patching##79680 |goto The Ringing Deeps/0 47.31,31.86
turnin Plumber Power##79681 |goto The Ringing Deeps/0 47.31,31.86
accept Critical Pressure!##79682 |goto The Ringing Deeps/0 47.31,31.86
step
click Main Release Valve
|tip 你会受到攻击。
缓解压力 |q 79682/1 |goto The Ringing Deeps/0 48.10,32.18
step
kill Geothermus##217416 |q 79682/2 |goto The Ringing Deeps/0 48.10,32.18
step
talk Fourman Grimes##217131
turnin Critical Pressure!##79682 |goto The Ringing Deeps/0 47.32,31.86
协助福尔曼-格兰姆斯 |q 79683/1 |goto The Ringing Deeps/0 47.32,31.86
step
在煤渣围城遇到扬基 |q 81999/1 |goto Isle of Dorn/0 72.07,42.03
step
talk Janky##219674
turnin New Home, New Candle!##81999 |goto Isle of Dorn/0 72.07,42.03
accept Hot Wax##79552 |goto Isle of Dorn/0 72.07,42.03
accept Mite Not Right##79998 |goto Isle of Dorn/0 72.07,42.03
stickystart "Kill_Infesting_Cindermites"
step
click Molten Wax+
|tip 它们看起来像{o}黄色的水坑{}。
|tip 你可能会遭到攻击。
kill Freed Honeywax##222313+
collect 12 Fire Bee Wax##216670 |q 79552/1 |goto Isle of Dorn/0 71.17,42.08
step
label "Kill_Infesting_Cindermites"
kill 24 Infesting Cindermite##222276 | q 79998/2 |goto Isle of Dorn/0 71.17,42.08
|tip 对周围的敌人使用{o}强奇的烟雾泵{}能力。
|tip 它们看起来像{o}蜜蜂，上面有绿色气泡{}。
|tip 使用该能力后，{o}灰飞虱就会出现{}。
'|clicknpc Drained Cinderbee##224080, Agitated Hive Worker##224096
step
talk Janky##219674
turnin Hot Wax##79552 |goto Isle of Dorn/0 72.07,42.03
turnin Mite Not Right##79998 |goto Isle of Dorn/0 72.07,42.03
accept Hot Pollenate-o##80202 |goto Isle of Dorn/0 72.07,42.03
accept Beebiter##80000 |goto Isle of Dorn/0 72.07,42.03
stickystart "Deliver_Pollen_To_Bees"
step
kill Beebiter##222284 |q 80000/1 |goto Isle of Dorn/0 69.89,41.97
|tip 小山洞内
step
label "Deliver_Pollen_To_Bees"
为蜜蜂送去 6# 号花粉 |q 80202/2 |goto Isle of Dorn/0 71.00,42.77
|tip 走到{o}富含花粉的煤渣花旁边{}，获得一个临时的{o}花粉buff{}。
|tip 它们看起来就像开着红色花朵{o}的高大植物{}，其中有{o}橙色球体{}向上飞出。
|tip 激活 BUFF 后，走到蜜蜂旁边传递花粉。
step
talk Janky##219674
turnin Hot Pollenate-o##80202 |goto Isle of Dorn/0 72.07,42.03
turnin Beebiter##80000 |goto Isle of Dorn/0 72.07,42.03
accept Janky Candles##79565 |goto Isle of Dorn/0 72.07,42.03
step
talk Bosh##217722
问他 _“你有摆摊所需的零件吗？”_ |gossip 121379
与波什交谈 |q 79565/1 |goto The Ringing Deeps/0 47.48,32.54
step
talk Innkeeper Brax##213840
|tip 建筑内部
告诉他_“我想和你谈谈波什的账单”_ |gossip 121380
问他_"我能为你做什么吗？也许是个任务？"_ |gossip 121385
与旅馆老板布拉克斯谈论博什的帐单 |q 79565/2 |goto The Ringing Deeps/0 48.00,32.17
step
talk Foreman Shalea##219705
问她_“有什么我可以做的事来加快修理进度吗？”_ |gossip 121387
与工头莎莉娅谈论建筑工程 |q 79565/3 |goto The Ringing Deeps/0 47.58,31.60
step
talk Machinist Valyka##217730
告诉她_“我是来检查 Shalea 工头的订单的”_ |gossip 121389
与机械师 Valyka 谈工具 |q 79565/4 |goto The Ringing Deeps/0 47.68,32.93
step
talk Foreman Svart##213841
问他_"你有机械师 Valyka 订购的煤炭吗？ |gossip 121390
向领班斯瓦特询问运煤事宜 |q 79565/5 |goto The Ringing Deeps/0 47.42,28.31
step
click Coal Shipment+
|tip 它们看起来像{o}一堆黑色的石头{}。
|tip 你可能会遭到攻击。
kill Coal Rager##219726+
collect 12 Elementally Active Coal##224253 |q 79565/6 |goto The Ringing Deeps/0 47.54,27.22
step
talk Machinist Valyka##217730
告诉她_"我把煤带来了。我把煤带来了。 |gossip 121388
把煤炭交给瓦莉卡 |q 79565/7 |goto The Ringing Deeps/0 47.68,32.94
step
talk Foreman Shalea##219705
告诉她_"我有一批新的工具。锻炉里还冒着热气。 |gossip 121386
把订单交给莎莉娅 |q 79565/8 |goto The Ringing Deeps/0 47.58,31.60
step
talk Innkeeper Brax##213840
|tip 建筑内部
告诉他_“莎莱亚和她的船员会尽快收工”_ |gossip 121384
把承诺交给布拉克斯 |q 79565/9 |goto The Ringing Deeps/0 47.99,32.17
step
talk Bosh##217722
告诉他_"布拉克斯说他不会切断你们的联系 反正现在不会 |gossip 121378
把消息带给波什 |q 79565/10 |goto The Ringing Deeps/0 47.48,32.54
step
talk Janky##216598
turnin Janky Candles##79565 |goto The Ringing Deeps/0 47.56,33.37
帮助扬基 |q 79683/3 |goto The Ringing Deeps/0 47.56,33.38
step
talk Skitter##213152
|tip 建筑内部
turnin Home Is Where the Candle Is##79683 |goto The Ringing Deeps/0 47.17,34.16
step
talk Mindi Maxlof##224966
turnin An Opportunity to Relax##82952 |goto The Ringing Deeps/0 53.80,43.79
accept To Opportunity Point##82956 |goto The Ringing Deeps/0 53.80,43.79
step
talk Haimaz##220600
accept Listener Lost##80576 |goto The Ringing Deeps/0 60.43,45.70
step
talk Milgrit Stonefeather##218388
fpath Shadowvein Point |goto 61.44,47.95
step
talk Hrandaz##220415
accept Desparately Seeking Skorthuz##81693 |goto The Ringing Deeps/0 62.45,47.98
step
talk Kagfritha##220417
accept Juicy Krolusk Meat##81655 |goto The Ringing Deeps/0 62.19,46.89
accept Sticks and Bones##81669 |goto The Ringing Deeps/0 62.19,46.89
step
talk Scrit##222234
accept Dread in the Den##80508 |goto The Ringing Deeps/0 62.67,45.64
step
找到布伦诺克 |q 80576/1 |goto The Ringing Deeps/0 63.01,43.69
|tip 飞上窗台
step
talk Brennok##220597
turnin Listener Lost##80576 |goto The Ringing Deeps/0 63.39,43.37
accept Defragmenting Memory##80676 |goto The Ringing Deeps/0 63.39,43.37
step
杀死周围的敌人
click Suspicious Rock+
|tip 它们看起来像{o}灰色的石头{}。
|tip 你可能会遭到攻击。
collect 100 Missing Page##220999 |q 80676/1 |goto The Ringing Deeps/0 61.62,41.99
'|kill Scavenging Swarmer##222873, Shadowsting Lurker##222645, Shadowsting Scavenger##222872, Lurking Hatchling##222874
step
talk Brennok##220597
turnin Defragmenting Memory##80676 |goto The Ringing Deeps/0 63.39,43.36
accept Let's Not Worry Her##81613 |goto The Ringing Deeps/0 63.39,43.36
step
talk Skorthuz##220446
turnin Desparately Seeking Skorthuz##81693 |goto The Ringing Deeps/0 64.93,41.55
accept Lisky Business##81712 |goto The Ringing Deeps/0 64.93,41.55
accept Oozemodious##81713 |goto The Ringing Deeps/0 64.93,41.55
stickystart "Kill_Tentacular_Slimes"
step
进入洞穴 |goto The Ringing Deeps/0 64.93,40.91 < 20 |walk
kill Oozemodius##220410 |q 81713/2 |goto The Ringing Deeps/0 66.85,38.99
|tip 他在这附近走动。
|tip 山洞的楼上
step
找到利斯基 |q 81712/1 |goto The Ringing Deeps/0 66.24,39.08
|tip 使用{o}呼叫莉斯基{ ^_^}按钮的能力{o}，同时面对莉斯基{ ^_^。｝
|tip 它看起来就像一只到处乱跑的{o}蓝色小玄武{}。
|tip 山洞内，一楼。
stickystart "Bring_Lusky_To_Skorthuz"
step
label "Kill_Tentacular_Slimes"
kill 6 Tentacular Slime##220364 |q 81713/1 |goto The Ringing Deeps/0 64.93,40.91
|tip 洞穴内部 |注释
step
label "Bring_Lusky_To_Skorthuz"
离开洞穴 |goto The Ringing Deeps/0 64.93,40.91 < 20 |walk |only if subzone("Fetid Grotto") and indoors()
把利斯基带到斯科尔图兹 |q 81712/2 |goto The Ringing Deeps/0 64.93,41.55
|tip 当利斯基分心时，使用{o}唤回利斯基{}按钮能力。
|tip 使用{o}唤回莉斯基{ }时，请面向莉斯基{ }。
step
talk Skorthuz##220446
turnin Lisky Business##81712 |goto The Ringing Deeps/0 64.93,41.55
turnin Oozemodious##81713 |goto The Ringing Deeps/0 64.93,41.55
step
talk Nebb##215737
accept A Nebb in Need##79367 |goto The Ringing Deeps/0 65.87,42.64
step
click Crate of Candles##429003
collect Bundle of Candles##217116 |q 79367/1 |goto The Ringing Deeps/0 65.87,42.79
step
click Kobold Candle
放置蜡烛 |q 79367/2 |goto The Ringing Deeps/0 65.80,42.78 |count 1
step
click Kobold Candle
放置蜡烛 |q 79367/2 |goto The Ringing Deeps/0 65.81,42.70 |count 2
step
click Kobold Candle
放置蜡烛 |q 79367/2 |goto The Ringing Deeps/0 65.93,42.56 |count 3
step
click Kobold Candle
放置蜡烛 |q 79367/2 |goto The Ringing Deeps/0 65.96,42.57 |count 4
step
talk Nebb##215737
turnin A Nebb in Need##79367 |goto The Ringing Deeps/0 65.87,42.64
accept Hair of the Spider##79368 |goto The Ringing Deeps/0 65.87,42.64
step
talk Snubjaw##217152
accept Protecting the Harvest##79369 |goto The Ringing Deeps/0 65.90,42.70
accept Tending to the Terrified##79481 |goto The Ringing Deeps/0 65.90,42.70
stickystart "Collect_Undercrawler_Venom"
stickystart "Collect_Grub_Eggs"
step
clicknpc Terrified Grubtender##216383+
|tip 他们看起来像{o}害怕的老鼠人{}。
释放 #6# 惊恐的啃食者 |q 79481/1 |goto The Ringing Deeps/0 67.64,42.64
step
label "Collect_Undercrawler_Venom"
杀死周围的敌人
collect 12 Undercrawler Venom##213178 |q 79368/1 |goto The Ringing Deeps/0 67.42,42.40
'|kill Invasive Undercrawler##215739, Encroaching Undercrawler##215771, Infested Jawgrub##217379, Invasive Hatchling##215769, Bursting Hatchling##217484
step
label "Collect_Grub_Eggs"
click Grub Eggs+
|tip 它们看起来像{o}一团团棕色的蛋{}。
|tip 你可能会遭到攻击。
collect 20 Grub Egg##213209 |q 79369/1 |goto The Ringing Deeps/0 67.53,42.52
step
talk Snubjaw##217152
turnin Protecting the Harvest##79369 |goto The Ringing Deeps/0 65.90,42.70
turnin Tending to the Terrified##79481 |goto The Ringing Deeps/0 65.90,42.70
step
talk Nebb##215737
turnin Hair of the Spider##79368 |goto The Ringing Deeps/0 65.87,42.64
accept A Poultice for Poison##79370 |goto The Ringing Deeps/0 65.87,42.64
step
clicknpc Snubjaw##217154
给斯诺布琼涂上药膏 |q 79370/1 |goto The Ringing Deeps/0 65.90,42.70
step
talk Nebb##215737
turnin A Poultice for Poison##79370 |goto The Ringing Deeps/0 65.87,42.64
accept A Royal Cure##79371 |goto The Ringing Deeps/0 65.87,42.64
step
进入洞穴 |goto The Ringing Deeps/0 68.70,40.49 < 20 |walk
click Broodmother's Egg##423581
|tip 在洞穴里面。
accept A Clutch of Hope##79372 |goto The Ringing Deeps/0 68.07,39.03
step
kill Queen Rickiticka##215772
|tip 她在这个区域走来走去。
|tip 在洞穴里面。
collect Queen Rickiticka's Venom##213218 |q 79371/1 |goto The Ringing Deeps/0 68.19,39.75
step
离开洞穴 |goto The Ringing Deeps/0 68.70,40.49 < 20 |walk |only if subzone("Chittering Den") and indoors()
找到斯克里特的营地 |q 80508/1 |goto The Ringing Deeps/0 69.64,41.14
step
talk Scrit##222234
turnin Dread in the Den##80508 |goto The Ringing Deeps/0 69.64,41.14
accept A Suit of Slime##80509 |goto The Ringing Deeps/0 69.64,41.14
accept Healing the Headwaters##80510 |goto The Ringing Deeps/0 69.64,41.14
stickystart "Collect_Sticky_Wax"
step
click Polluting Scrap+
|tip 它们看起来像{o}成团的物体{}漂浮在水面上{o}。
清除 6# 污染废料 |q 80510/1 |goto The Ringing Deeps/0 69.26,38.65
step
label "Collect_Sticky_Wax"
杀死周围的敌人
clicknpc Wax-addled Hopper##221927+
|tip 它们看起来像{o}鱼儿在陆地上{o}跳来跳去。
collect 20 Sticky Wax##220218 |q 80509/1 |goto The Ringing Deeps/0 69.49,38.15
'|kill Congealed Wax-hulk##223206, Waxy Runoff##220210
step
talk Scrit##222234
选择 _“<把黏蜡交给斯克里特>”_ |gossip 121872
与斯克里特对话 |q 80509/2 |goto The Ringing Deeps/0 69.65,41.14
step
talk Scrit##222234
turnin Healing the Headwaters##80510 |goto The Ringing Deeps/0 69.65,41.14
step
click Flappy Bits
选择伪装 |q 80509/3 |goto The Ringing Deeps/0 69.57,41.20
step
talk Scrit##222234
turnin A Suit of Slime##80509 |goto The Ringing Deeps/0 69.64,41.14
accept Casing the Camp##80511 |goto The Ringing Deeps/0 69.64,41.14
step
换上无瑕虫伪装 |q 80511/1 |goto The Ringing Deeps/0 69.64,41.14
|tip 使用{o}无懈可击的虫子伪装{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
打动守卫 |q 80511/2 |goto The Ringing Deeps/0 68.19,39.21
|tip 使用{o}炫耀{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
_NOTE:_
在接下来的步骤中
|tip {避开周围有{o}蓝色圆圈{}的敌人{}。
|tip 他们会看穿你的伪装。
点击此处继续 |confirm |q 80511
step
调查营地 |q 80511/3 |goto The Ringing Deeps/0 67.01,38.13
step
调查格斗场 |q 80511/4 |goto The Ringing Deeps/0 66.79,38.90
step
_Next to you:_
talk Scrit##222239
turnin Casing the Camp##80511
accept Beat the Best##80512
accept Snouty Sabotage##80513
step
click Pilfered Supplies
放置煤渣闪光蜡烛 |q 80513/1 |goto The Ringing Deeps/0 66.96,38.82 |count 1
step
click Hitching Post
松开虫链 |q 80513/2 |goto The Ringing Deeps/0 67.68,38.46 |count 1
step
click Hitching Post
松开虫链 |q 80513/2 |goto The Ringing Deeps/0 67.94,39.57 |count 2
step
clicknpc Squinch##220228
kill Siltsliver##220236
打败斯奎奇 |q 80512/2 |goto The Ringing Deeps/0 67.64,39.58
step
clicknpc Flindersnik##220231
kill Cindersting##220238
打败弗林德斯尼克 |q 80512/3 |goto The Ringing Deeps/0 67.45,38.00
step
click Purloined Goods
放置煤渣闪光蜡烛 |q 80513/1 |goto The Ringing Deeps/0 66.50,38.36 |count 2
step
clicknpc Brekk##220230
kill Rockgore##220241
打败布雷克 |q 80512/1 |goto The Ringing Deeps/0 65.68,39.73
step
_Next to you:_
talk Scrit##222239
turnin Beat the Best##80512
step
click Purloined Goods
放置煤渣闪光蜡烛 |q 80513/1 |goto The Ringing Deeps/0 66.27,39.69 |count 3
step
click Purloined Goods
|tip 爬上木结构建筑
放置煤渣闪光蜡烛 |q 80513/1 |goto The Ringing Deeps/0 66.55,39.02 |count 4
step
_Next to you:_
talk Scrit##222239
turnin Snouty Sabotage##80513
accept Break out Berrund!##80514
step
talk Berrund the Gleaming##223730
告诉他 _“准备好，蜡烛就要爆炸了！”_ |gossip 121909
与贝鲁德对话 |q 80514/1 |goto The Ringing Deeps/0 66.88,39.29
step
观看对话
|tip 跟着贝伦德，并在他行走时保护他。
|tip 他最终会走到这里。
护送贝鲁德 |q 80514/2 |goto The Ringing Deeps/0 68.67,39.45
'|clicknpc Berrund the Gleaming##222062
step
talk Berrund the Gleaming##220220
turnin Break out Berrund!##80514 |goto The Ringing Deeps/0 69.63,40.91
step
talk Scrit##222234
accept Put the Shine On##80515 |goto The Ringing Deeps/0 69.65,41.14
step
clicknpc Brilliant Candlefly##222652+
|tip 他们看起来像被网住的飞虫
collect 6 Candlefly Luminescence##220485 |q 80515/1 |goto The Ringing Deeps/0 72.05,39.39
step
talk Scrit##222234
turnin Put the Shine On##80515 |goto The Ringing Deeps/0 69.64,41.14
step
talk Berrund the Gleaming##220220
accept Bump off the Boss##80516 |goto The Ringing Deeps/0 69.63,40.91
step
kill Boss Whiskerlash##220385 |q 80516/1 |goto The Ringing Deeps/0 73.89,34.62
|tip 小山洞内
step
talk Scrit##222234
turnin Bump off the Boss##80516 |goto The Ringing Deeps/0 69.65,41.14
step
talk Nebb##215737
选择 _“<给内布女王的毒液来制作新的膏药>”_ |gossip 121187
将瑞奇提卡女王的毒液交给奈博 |q 79371/2 |goto The Ringing Deeps/0 65.87,42.63
step
talk Nebb##215737
turnin A Clutch of Hope##79372 |goto The Ringing Deeps/0 65.87,42.63
step
clicknpc Snubjaw##217163
治疗斯诺伯杰 |q 79371/3 |goto The Ringing Deeps/0 65.90,42.70
step
talk Nebb##215737
turnin A Royal Cure##79371 |goto The Ringing Deeps/0 65.87,42.64
step
返回海马兹 |q 81613/1 |goto The Ringing Deeps/0 62.03,45.53
step
talk Haimaz##220600
turnin Let's Not Worry Her##81613 |goto The Ringing Deeps/0 62.03,45.53
accept Readying the Recitation##80577 |goto The Ringing Deeps/0 62.03,45.53
step
talk Brennok##220597
accept The Common Costume##80578 |goto The Ringing Deeps/0 61.88,45.51
step
talk Resting Miner##221011
|tip 楼内楼上
选择 _"<询问矿工是否知道备用衣服在哪里。 |gossip 122206
告诉他_“这是朗诵仪式的一部分。”_ |gossip 122205
与休息的矿工交谈 |q 80578/1 |goto The Ringing Deeps/0 61.68,46.02
step
click Spare Miner's Clothes##442658
|tip 大楼内，顶楼
collect Miner's Clothes##221472 |q 80578/2 |goto The Ringing Deeps/0 61.91,45.94
step
talk Brennok##220597
|tip 大楼外
turnin The Common Costume##80578 |goto The Ringing Deeps/0 61.88,45.51
step
click Stuck Mine Cart
|tip 平台上
移动卡住的矿车 |q 80577/1 |goto The Ringing Deeps/0 62.67,44.47
step
click Mislaid Tool+
|tip 它们看起来像{o}各种锤子{}。
collect 3 Mislaid Tool##224008 |q 80577/2 |goto The Ringing Deeps/0 62.58,44.36
step
click Stubborn Moss
清理牌匾 |q 80577/3 |goto The Ringing Deeps/0 62.83,44.23
step
talk Haimaz##220600
turnin Readying the Recitation##80577 |goto The Ringing Deeps/0 62.78,44.18
accept A Sip of Cinder##80593 |goto The Ringing Deeps/0 62.78,44.18
stickystart "Burn_Deepsflayer_Nests"
stickystart "Fill_The_Cask"
step
杀死周围的克洛卢斯克敌人
collect 4 Juicy Krolusk Meat##219493 |q 81655/1 |goto The Ringing Deeps/0 62.37,49.57
'|kill Waste Krolusk##221358, Krolusk Whelpling##225388
step
label "Burn_Deepsflayer_Nests"
click Deepsflayer Nest+
|tip 它们看起来像{o}巨大的鸟巢{}。
烧毁 #6# 深层巢穴 |q 81669/1 |goto The Ringing Deeps/0 63.27,50.61
step
label "Fill_The_Cask"
杀死此区域周围的深海噬食者敌人
collect Cinderbrew Flask##221001+ |n
click Nearly-empty Cask+
|tip 它们看起来像{o}木桶{}。
collect Nearly-empty Cask##221000+ |n
装满木桶 |q 80593/1 |goto The Ringing Deeps/0 61.97,49.26
'|kill Waste Flayer##220363, Mead-Mad Flayer##222898
step
talk Kagfritha##220417
turnin Juicy Krolusk Meat##81655 |goto The Ringing Deeps/0 62.18,46.89
turnin Sticks and Bones##81669 |goto The Ringing Deeps/0 62.18,46.89
accept In a Pinch##81672 |goto The Ringing Deeps/0 62.18,46.89
step
talk Haimaz##220600
turnin A Sip of Cinder##80593 |goto The Ringing Deeps/0 62.03,45.53
step
talk Brennok##220597
accept One Last Story##80682 |goto The Ringing Deeps/0 61.88,45.51
step
talk Brennok##220597
|tip 平台上
选择 _“<聆听布伦诺克的最后朗诵>”_ |gossip 122202 |noautogossip
|tip 你可以观看对话，或者选择{o}“<略过背诵>我在桥边等你”{}。
click Stool
|tip 附近。
观看对话
聆听朗诵 |q 80682/1 |goto The Ringing Deeps/0 62.64,44.47
step
在桥边见到布伦诺克 |q 80682/2 |goto The Ringing Deeps/0 57.37,43.04
step
talk Haimaz##220600
turnin One Last Story##80682 |goto The Ringing Deeps/0 57.37,43.04
accept On the Road##82144 |goto The Ringing Deeps/0 57.37,43.04
step
kill Grimlurk##223091
营救布伦诺克 |q 82144/1 |goto The Ringing Deeps/0 56.73,40.76
step
talk Haimaz##220600
turnin On the Road##82144 |goto The Ringing Deeps/0 57.33,43.06
step
click Meaty Bait
|tip 你会受到攻击。
放置肉质诱饵 |q 81672/1 |goto The Ringing Deeps/0 61.96,50.87
step
kill Smaragthr##220362 | q 81672/2 |goto The Ringing Deeps/0 61.96,50.88
step
talk Sinruna##223759
|tip 她在这个区域走来走去。
accept Badly Behaved Bot##83165 |goto The Ringing Deeps/0 60.33,56.99
step
在泰洛奇附近找到麦格尼和达格兰 |q 78685/1 |goto The Ringing Deeps/0 60.40,59.79
step
talk Magni Bronzebeard##213612
turnin The Tunnel's End##78685 |goto The Ringing Deeps/0 60.40,59.79
accept We Don't Go to Taelloch##78696 |goto The Ringing Deeps/0 60.40,59.79
step
杀死周围的敌人
杀死 #6# 入侵的野生动物 |q 78696/1 |goto 62.13,59.83
'|kill Invasive Witherling##219913, Territorial Deepflayer##219902, Emboldened Fog Wither##219909
step
找到麦格尼和达格兰 |q 78696/2 |goto 62.51,58.69
|tip 在建筑的门口。
step
talk Dagran Thaurissan II##213634
|tip 建筑内部
turnin We Don't Go to Taelloch##78696 |goto 62.31,58.14
accept Ghost of a Company Town##78697 |goto 62.31,58.14
step
talk Magni Bronzebeard##213633
|tip 建筑内部
告诉他_“我准备好出发了”_ |gossip 123513
告诉麦格尼你准备好出发了 |q 78697/1 |goto 62.31,58.08
step
进入城镇 |q 78697/2 |goto 63.85,58.36
step
click Earthen Slate
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 64.16,58.06 |count 1
step
click Full Mug
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 64.13,58.63 |count 2
step
click Hastily Constructed Blockade
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 63.49,57.83 |count 3
step
click Earthen Slate
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.08,57.85 |count 4
step
click Earthen Hammer
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.32,58.70 |count 5
step
click Hastily Constructed Blockade
|tip 使用{o}调查{}能力来揭开它。
|tip 它会以按钮的形式出现在屏幕上。
调查并查看线索 |q 78697/3 |goto 65.84,57.41 |count 6
step
click Barricade
调查求救信号 |q 78697/4 |goto 66.05,58.34
step
talk Magni Bronzebeard##216479
|tip 建筑内部
turnin Ghost of a Company Town##78697 |goto 66.14,58.36
accept Controlled Demolition##78700 |goto 66.14,58.36
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept The Truth in Chalk##78701
stickystart "Slay_Skardyn"
step
click Earthen Slate
找到第一块石板 |q 78701/1 |goto 66.02,60.43
step
click Earthen Slate
|tip 小山洞内
找到第二块石板 |q 78701/2 |goto 61.47,62.66
step
click Earthen Slate
|tip 小山洞内
查找第三块石板 |q 78701/3 |goto 64.44,65.06
step
click Earthen Slate
找到第四块石板 |q 78701/4 |goto 67.26,63.99
step
_Next to you:_
talk Dagran Thaurissan II##214892
turnin The Truth in Chalk##78701
step
label "Slay_Skardyn"
杀死周围的敌人
杀死 #18# 斯卡丁 |q 78700/1 |goto 64.86,62.11
'|kill Reconstructed Skardyn##219245, Corrupted Spellshaper##219302, Unstable Skardyn##223414, Cursed Miner##213565, Hijacked Ironstrider##219287, Voidtouched Speaker##223469, Skardyn Husk##213566
step
_Next to you:_
talk Magni Bronzebeard
turnin Controlled Demolition##78700
'|talk Magni Bronzebeard##214890
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept Buried in Stone##78703
step
找到洞穴入口 |goto 67.39,62.00 < 15 |walk
进入洞穴 |q 78703/1 |goto 68.00,61.81
|tip 在洞穴里面。
step
探索洞穴 |q 78703/2 |goto The Ringing Deeps/0 68.46,62.88
|tip 在洞穴里面。
step
kill Cave Blockage##216508
|tip 它看起来像是一堵{o}巨石墙{}挡住了去路。
|tip 在洞穴里面。
摧毁堵塞物 |q 78703/3 |goto The Ringing Deeps/0 68.46,62.88
step
_Next to you:_
talk Dagran Thaurissan II##214892
turnin Buried in Stone##78703
step
_Next to you:_
talk Magni Bronzebeard
accept Find the Foreman##78704
'|talk Magni Bronzebeard##214890
step
kill Kol Bruncrag##213658
|tip 山洞的楼上
面对工头 |q 78704/1 |goto 68.47,64.18
step
_Next to you:_
talk Magni Bronzebeard
turnin Find the Foreman##78704
'|talk Magni Bronzebeard##214890
step
_Next to you:_
talk Dagran Thaurissan II##214892
accept What She Saw##78705
step
click Memory Gem
|tip 山洞内，一楼。
检查宝石 |q 78705/1 |goto 68.58,64.45
step
观看对话
|tip 山洞内，一楼。
查看记忆 |q 78705/2 |goto 68.57,64.35
step
talk Dagran Thaurissan II##219453
|tip 山洞内，一楼。
turnin What She Saw##78705 |goto 68.57,64.35
step
talk Magni Bronzebeard##219452
|tip 山洞内，一楼。
accept The High Speaker's Secret##78706 |goto 68.55,64.35
step
离开洞穴 |goto The Ringing Deeps/0 67.61,62.01 < 20 |walk |only if subzone("Taelloch Mine") and indoors()
talk Kargen Ironbrow##224940
fpath Camp Murroch |goto 58.16,64.05
step
talk Kagfritha##220417
turnin In a Pinch##81672 |goto The Ringing Deeps/0 62.18,46.89
turnin Badly Behaved Bot##83165 |goto The Ringing Deeps/0 62.18,46.89
step
talk Speaker Brinthe##212741
|tip 建筑内部
turnin The High Speaker's Secret##78706 |goto The Ringing Deeps/0 47.19,34.17
accept Absent Speaker##78738 |goto The Ringing Deeps/0 47.19,34.17
step
talk Cogwin##225616
accept Cinderbrew Reserve##83160 |goto The Ringing Deeps/0 41.35,22.45
step
click Cinderbrew Reserve
|tip 墙底的小房间里。
搬运煤渣酒储备 |havebuff Cinderbrew Reserve##453877 |goto The Ringing Deeps/0 42.39,24.79 |q 83160
step
_NOTE:_
在下一步中
|tip {不要上马，否则你会失去木桶，只能重新拿一次。
|tip {避开周围地上有蓝色圆圈的 NPC。
点击此处继续 |confirm |q 83160
step
跑上楼梯 |goto The Ringing Deeps/0 42.98,24.77 < 15 |only if walking
继续上楼 |goto The Ringing Deeps/0 41.74,25.25 < 15 |only if walking
归还煤渣酒储备 |q 83160/1 |goto The Ringing Deeps/0 41.36,22.45
step
talk Cogwin##225616
turnin Cinderbrew Reserve##83160 |goto The Ringing Deeps/0 41.36,22.45
step
talk Foreman Duinth##225582
accept An Igneous End##83092 |goto The Ringing Deeps/0 41.08,21.40
accept Magmanagement##83152 |goto The Ringing Deeps/0 41.08,21.40
step
talk Machinist Kilton##225583
accept Sampling Steam##83153 |goto The Ringing Deeps/0 41.10,21.41
stickystart "Collect_Gas_Samples"
stickystart "Slay_Magma_Elementals"
step
talk Entombed Earthen##225471+
|tip 他们看起来像{o}矮人{}。
释放 #6# 煤渣 |q 83092/1 |goto The Ringing Deeps/0 41.47,19.58
step
label "Collect_Gas_Samples"
收集 #8# 气体样本 |q 83153/1 |goto The Ringing Deeps/0 41.50,19.84
|tip {站在地上有蒸汽喷出的地方。
step
label "Slay_Magma_Elementals"
杀死周围的敌人
杀死 #12# 岩浆元素 |q 83152/1 |goto The Ringing Deeps/0 41.60,19.93
'|kill Slag Bubble##225389, Risen Magma##225390
step
talk Machinist Kilton##225583
turnin Sampling Steam##83153 |goto The Ringing Deeps/0 41.10,21.41
step
talk Foreman Duinth##225582
turnin An Igneous End##83092 |goto The Ringing Deeps/0 41.08,21.40
turnin Magmanagement##83152 |goto The Ringing Deeps/0 41.08,21.40
step
talk Speaker Brinthe##213569
|tip 山的另一边
turnin Absent Speaker##78738 |goto 47.13,20.72
accept Sympathetic Speakers##78741 |goto 47.13,20.72
step
talk Moira Thaurissan##213763
accept Battle of the Earthenworks##78742 |goto 47.08,20.71
stickystart "Fight_The_High_Speakers_Followers_In_The_Earthenworks"
step
talk Foreman Gesa##213674
|tip 他在这附近走动。
问她_“你能帮我们吗？”_ |gossip 121209
kill Foreman Gesa##213674
面对工头格萨 |q 78741/1 |goto 50.33,21.20
step
talk Foreman Otan##213673
问他_"你能帮我们吗？ |gossip 121212
kill Foreman Otan##213673
面对工头奥坦 |q 78741/2 |goto 45.80,14.04
step
面对乌贾克斯工头 |q 78741/3 |goto 48.99,17.44
|tip 桥下的小房间里
step
观看对话
talk Speaker Brinthe##219428
|tip 她出现在这个地方。
turnin Sympathetic Speakers##78741 |goto 49.02,17.31
step
talk Foreman Uzjax##213672
accept Return to Moira##81798 |goto The Ringing Deeps/0 48.97,17.44
step
label "Fight_The_High_Speakers_Followers_In_The_Earthenworks"
杀死周围的敌人
clicknpc Assembly Worker##213543+
|tip 他们看起来像{o}害怕的矮人{}。
click Broken Machinery+
|tip 他们看起来像会发射火球的{o}虫子
在 Earthenworks 中对抗高级议长的追随者 |q 78742/1 |goto 47.63,17.18
'|kill Dogmatic Machine Speaker##212878, High Speaker's Construct##219635, Dogmatic Forgecaster##212884, Swarming Cogwalker##213962, Earthenwork Ironstrider##213951, Dogmatic Soot-Seer##212876, Slag Elemental##212885
step
talk Orsenth##215208
|tip 建筑内部
accept The Nibelgaz Refinery##79148 |goto The Ringing Deeps/0 51.03,14.87
step
talk Ferdagor##215234
accept Rampage in the Refinery##79149 |goto The Ringing Deeps/0 51.36,14.33
stickystart "Slay_Rampaging_Elementals"
step
talk Injured Refinery Worker##215210+
|tip 他们看起来像{o}矮人{}。
营救 #6# 炼油厂工人 |q 79148/1 |goto The Ringing Deeps/0 50.85,11.16
step
label "Slay_Rampaging_Elementals"
杀死周围的敌人
杀死 #10# 狂暴元素 |q 79149/1 |goto The Ringing Deeps/0 52.96,11.38
'|kill Rampaging Elemental##215232, Rampaging Elemental##216025
step
talk Ferdagor##215234
turnin Rampage in the Refinery##79149 |goto The Ringing Deeps/0 51.36,14.33
step
talk Orsenth##215208
|tip 建筑内部
turnin The Nibelgaz Refinery##79148 |goto The Ringing Deeps/0 51.03,14.87
accept Muddled Mind in the Mine##79679 |goto The Ringing Deeps/0 51.03,14.87
step
talk Munderut##215209
|tip 他在这附近走动。
turnin Muddled Mind in the Mine##79679 |goto The Ringing Deeps/0 52.75,8.80
accept Spinning Spore Spines##79193 |goto The Ringing Deeps/0 52.75,8.80
step
kill Underground Spore##215235+
collect Spore Spines##212529+ |n
收集 #150# 刺 |q 79193/1 |goto The Ringing Deeps/0 54.49,11.08
step
talk Munderut##215209
|tip 建筑内部
turnin Spinning Spore Spines##79193 |goto The Ringing Deeps/0 51.13,14.72
step
talk Keldaz##217474
|tip 建筑内部
accept To the Source##79194 |goto The Ringing Deeps/0 51.08,14.85
step
在东北部矿井外见到凯尔达斯 |q 79194/1 |goto The Ringing Deeps/0 51.08,14.85
step
talk Keldaz##223000
turnin To the Source##79194 |goto The Ringing Deeps/0 55.35,11.09
accept Raging Rifts##79944 |goto The Ringing Deeps/0 55.35,11.09
stickystart "Accept_The_Glittering_Shard"
stickystart "Defeat_Elemental_Rifts"
step
进入洞穴 |q 79944/2 |goto The Ringing Deeps/0 55.71,12.30
step
kill Urthgrafr Riftcaller##215233
|tip 在洞穴里面。
摧毁裂缝源 |q 79944/3 |goto The Ringing Deeps/0 57.01,16.75
step
label "Accept_The_Glittering_Shard"
杀死周围的敌人
|tip 洞穴内部 |注释
collect Glittering Shard##212595 |n
accept The Glittering Shard##79327 |goto The Ringing Deeps/0 55.71,12.30
'|kill Rampaging Elemental##216025, Crystal-infused Shard##215328
step
label "Defeat_Elemental_Rifts"
kill Elemental Rift##217914+
|tip 洞穴内外。|注意
打败 #4# 元素裂缝 |q 79944/1 |goto The Ringing Deeps/0 55.71,12.30
step
离开洞穴 |goto The Ringing Deeps/0 55.71,12.30 < 15 |walk |only if subzone("Nibelgaz Mine") and indoors()
talk Keldaz##223000
turnin Raging Rifts##79944 |goto The Ringing Deeps/0 55.35,11.09
step
talk Orsenth##219042
|tip 建筑内部
turnin The Glittering Shard##79327 |goto The Ringing Deeps/0 51.14,14.74
step
talk Moira Thaurissan##213763
turnin Battle of the Earthenworks##78742 |goto 47.08,20.71
turnin Return to Moira##81798 |goto The Ringing Deeps/0 47.08,20.71
accept Dark Iron from Above##78760 |goto 47.08,20.71
step
观看对话
talk Moira Thaurissan##213763
告诉她_“我准备好了，我们走吧！”_ |gossip 120506
与莫伊拉对话 |q 78760/1 |goto 47.08,20.71
step
开始飞往瓦里克主管处 |invehicle |goto 47.08,20.71 |q 78760
step
飞向监工瓦里克 |outvehicle |goto 49.60,15.39 |q 78760
step
kill Supervisor Varric##223263 |q 78760/2 |goto 49.58,14.39
step
click Varric's Damaged Ironstrider
登上瓦里克受损的铁甲舰 |q 78760/3 |goto 46.84,14.06
step
杀死周围的敌人
|tip 使用行动条上的能力。
击败攻击部队 |q 78760/4 |goto 46.84,14.06
'|kill Swarming Cogwalker##213962, Zealous Ironguard##223904, Zealot's Guardbot##223911
step
talk Moira Thaurissan##213796
turnin Dark Iron from Above##78760 |goto 46.70,10.26
accept Into the Machine##78761 |goto 46.70,10.26
step
进入觉醒大厅 |q 78761/1 |goto 46.44,8.76
|tip {跟着你的盟友进入旋转传送门
|tip 建筑内部
step
开始剧情 |scenariostart |q 78761
step
_Inside the Halls of Awakening:_
沿着高级发言人的足迹进入觉醒大厅 |scenariogoal 1/65229 |goto Hall of Awakening Scenario/0 22.65,49.54 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
click Ironfuse Bomb+
|tip 他们看起来就像地上的{o}灰色圆球{}。
|tip 你会获得一个{o}有时间限制的BUFF{}，它能赋予你一种能力，{o}所以要抓紧时间{}。
摧毁 #4# 地狱喷雾器 |scenariogoal 2/66045 |goto Hall of Awakening Scenario/0 28.75,49.61 |q 78761
|tip 它们看起来像{o}发射火球的炮塔{}。
|tip 对他们使用{o}铁幕炸弹{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
_Inside the Halls of Awakening:_
深入觉醒大厅 |scenariogoal 3/65469 |goto Hall of Awakening Scenario/0 37.08,49.59 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
click Earthen Console
|tip 和你的盟友一起沿着路径前进。
帮助达格兰激活符文锁序列 |scenariogoal 4/65423 |goto Hall of Awakening Scenario/0 42.73,45.18 |q 78761
step
_Inside the Halls of Awakening:_
杀死攻击的敌人
在达格兰解开 Runelock 组合时保护他 |scenariostage 5 |goto Hall of Awakening Scenario/0 43.29,43.26 |q 78761
'|kill Deranged Skardyn##217672, Skardyn Remnants##216487, Skardyn Metamorphosis##219148, Deviant Skardyn##217610, Enraged Skardyn##213743, Void Crystal Monstrosity##217200, Deranged Skardyn##217684
step
_Inside the Halls of Awakening:_
进入湮灭界面 |scenariogoal 6/65482 |goto Hall of Awakening Scenario/0 55.43,49.58 |q 78761
|tip 和你的盟友一起沿着路径前进。
stickystart "Defeat_The_Iron_Runed_Protector"
step
_Inside the Halls of Awakening:_
kill Earthen-Ward Sentinel##216221
击败土墙哨兵 |scenariogoal 6/65444 |goto Hall of Awakening Scenario/0 59.68,49.51 |q 78761
step
label "Defeat_The_Iron_Runed_Protector"
_Inside the Halls of Awakening:_ |notinsticky
kill Iron-Runed Protector##214576
击败铁流保护者 |scenariogoal 6/65446 |goto Hall of Awakening Scenario/0 59.68,49.51 |q 78761
step
_Inside the Halls of Awakening:_
进入最终密室 |scenariogoal 7/65497 |goto Hall of Awakening Scenario/0 77.34,49.46 |q 78761
|tip 和你的盟友一起沿着路径前进。
step
_Inside the Halls of Awakening:_
kill Master Machinist Dunstan##217353
击败机械大师邓斯坦 |scenariogoal 8/65464 |goto Hall of Awakening Scenario/0 85.44,49.38 |q 78761
'|kill Master Machinist Dunstan##217435
step
_Inside the Halls of Awakening:_
观看对话
在觉醒机器中与高级议长艾瑞克对峙 |scenarioend |goto Hall of Awakening Scenario/0 87.40,49.44 |q 78761
在觉醒大厅与高级议长对峙 |q 78761/2 |goto Hall of Awakening Scenario/0 87.40,49.44
step
talk Moira Thaurissan##212742
|tip 建筑内部
turnin Into the Machine##78761 |goto The Ringing Deeps/0 47.17,34.12
accept A Hint of Fear##79256 |goto The Ringing Deeps/0 47.17,34.12
accept The Machine Speakers##79354 |goto The Ringing Deeps/0 47.17,34.12
step
观看对话
|tip 建筑内部
talk Moira Thaurissan##212742
turnin The Machine Speakers##79354 |goto 47.17,34.12
accept Orientation: Gundargaz##81689 |goto 47.17,34.12
step
talk Waxmonger Squick##221390
与蜡匠斯奎克交谈 |q 81689/1 |goto The Ringing Deeps/0 47.30,32.93
step
观看对话
|tip 建筑内部
talk Moira Thaurissan##212742
turnin Orientation: Gundargaz##81689 |goto 47.17,34.12
step
talk Danagh##224602
|tip 建筑内部
accept A Functional Favor##82773 |goto The Ringing Deeps/0 58.95,64.18
step
talk Noli Marlen##221043
accept Foreign Fog##81556 |goto The Ringing Deeps/0 58.45,62.36
step
到达第一个迷雾地点 |q 81556/1 |goto The Ringing Deeps/0 58.79,60.75
step
杀死一波又一波进攻的敌人
|tip 使用{o}放置雾气收集器{}能力。
|tip 它会以按钮的形式出现在屏幕上。
填满第一个雾气收集器 |q 81556/2 |goto The Ringing Deeps/0 58.79,60.75
'|kill Frenzied Glowmite##221304
step
到达第二个雾点 |q 81556/3 |goto The Ringing Deeps/0 58.35,47.47
step
杀死一波又一波进攻的敌人
|tip 使用{o}放置雾气收集器{}能力。
|tip 它会以按钮的形式出现在屏幕上。
收集第二个雾样本 |q 81556/4 |goto The Ringing Deeps/0 58.35,47.47
'|kill Frenzied Glowmite##221304
step
到达第三个雾点 |q 81556/5 |goto The Ringing Deeps/0 64.16,58.10
step
杀死一波又一波进攻的敌人
|tip 使用{o}放置雾气收集器{}能力。
|tip 它会以按钮的形式出现在屏幕上。
收集第三个雾气样本 |q 81556/6 |goto The Ringing Deeps/0 64.16,58.10
'|kill Deepflayer Hunter##221342
step
talk Noli Marlen##221043
turnin Foreign Fog##81556 |goto The Ringing Deeps/0 58.45,62.36
accept Fog Tags##81557 |goto The Ringing Deeps/0 58.45,62.36
accept Unnatural Predators##81558 |goto The Ringing Deeps/0 58.45,62.36
stickystart "Kill_Deepflayer_Hunters"
step
use the Fog Beast Tracker##219469
|tip 对{o}雾凋零者{}使用。
在 6# 雾兽身上安装追踪器 |q 81557/1 |goto The Ringing Deeps/0 60.83,60.52
'|clicknpc Fog Wither##213952
step
label "Kill_Deepflayer_Hunters"
kill 8 Deepflayer Hunter##221198 |q 81558/1 |goto The Ringing Deeps/0 59.01,57.90
step
talk Noli Marlen##221043
turnin Fog Tags##81557 |goto The Ringing Deeps/0 58.45,62.37
turnin Unnatural Predators##81558 |goto The Ringing Deeps/0 58.45,62.37
accept Fog Follower##81559 |goto The Ringing Deeps/0 58.45,62.37
step
talk Moira Thaurissan##215781
turnin A Hint of Fear##79256 |goto The Ringing Deeps/0 55.03,63.34
accept Put On a Good Face##79259 |goto The Ringing Deeps/0 55.03,63.34
step
talk Berrund the Gleaming##215788
accept Mineral Water Woes##79258 |goto The Ringing Deeps/0 55.02,63.26
step
找到并跟随雾踪 |q 81559/1 |goto The Ringing Deeps/0 45.49,63.09
step
跟随诺利 |q 81559/2 |goto The Ringing Deeps/0 41.80,61.89
|tip 在{o}瀑布顶端{}。
|tip 跟着{o}诺莉{}飞行。
'|clicknpc Noli Marlen##221610
step
clicknpc Noli's Camera##221666
拍摄照片 |q 81559/3 |goto The Ringing Deeps/0 41.85,61.92
step
观看对话
返回默洛克营地 |complete subzone("Ancient Falls") |q 81559
stickystart "Collect_Lashroom_Dust"
step
clicknpc Collection Bowl##217401
从第一个水潭取水 |q 79258/1 |goto The Ringing Deeps/0 55.95,69.13
step
clicknpc Collection Bowl##217473
从第二个水潭取水 |q 79258/2 |goto The Ringing Deeps/0 54.40,72.95
step
clicknpc Collection Bowl##217475
从第三个水潭取水 |q 79258/3 |goto The Ringing Deeps/0 51.59,68.81
step
label "Collect_Lashroom_Dust"
杀死此区域周围的拉什姆敌人
collect 12 Lashroom Dust##212490 |q 79259/1 |goto The Ringing Deeps/0 55.76,68.56
'|kill Gorged Lashroom##217314, Vigorous Lashroom##215793, Vigorous Lashroom##215792
step
talk Moira Thaurissan##215821
turnin Mineral Water Woes##79258 |goto The Ringing Deeps/0 53.97,66.66
step
talk Berrund the Gleaming##215822
turnin Put On a Good Face##79259 |goto The Ringing Deeps/0 54.00,66.62
accept Epicenter##79260 |goto The Ringing Deeps/0 54.00,66.62
step
接近绿巨人 |q 79260/1 |goto The Ringing Deeps/0 53.26,65.95
|tip 你会受到攻击。
'|kill Verdant Hulk##215813
step
kill Verdant Hulk##215813 | q 79260/2 |goto The Ringing Deeps/0 53.26,65.95
step
talk Moira Thaurissan##215821
turnin Epicenter##79260 |goto The Ringing Deeps/0 54.36,65.36
accept Boiling Mad##79261 |goto The Ringing Deeps/0 54.36,65.36
step
click Seismic Contusion
追踪贝鲁德 |q 79261/1 |goto The Ringing Deeps/0 55.00,59.80 |count 1
step
click Seismic Contusion
追踪贝鲁德 |q 79261/1 |goto The Ringing Deeps/0 53.88,58.46 |count 2
step
click Seismic Contusion
追踪贝鲁德 |q 79261/1 |goto The Ringing Deeps/0 54.42,54.95 |count 3
step
talk Moira Thaurissan##215824
turnin Boiling Mad##79261 |goto The Ringing Deeps/0 56.09,50.03
accept Fault Lines##79263 |goto The Ringing Deeps/0 56.09,50.03
accept Clean Up House##79262 |goto The Ringing Deeps/0 56.09,50.03
step
杀死周围的敌人
杀死 #10# 焦虑生物 |q 79262/1 |goto The Ringing Deeps/0 57.34,47.66
'|kill Agitated Borer Spawn##215831, Agitated Scorpid##215830
step
找到洞穴入口 |q 79263/1 |goto The Ringing Deeps/0 57.16,47.02
step
talk Moira Thaurissan##215837
|tip 在洞穴里面。
turnin Clean Up House##79262 |goto The Ringing Deeps/0 57.17,45.63
step
talk Berrund the Gleaming##215836
|tip 在洞穴里面。
turnin Fault Lines##79263 |goto The Ringing Deeps/0 57.15,45.49
accept These Strong Hands##79264 |goto The Ringing Deeps/0 57.15,45.49
step
观看对话
|tip 在洞穴里面。
见证莫伊拉-陶瑞桑 |q 79264/1 |goto The Ringing Deeps/0 57.15,45.49
step
talk Moira Thaurissan##217598
|tip 在洞穴里面。
turnin These Strong Hands##79264 |goto The Ringing Deeps/0 57.17,45.64
accept Fearbreaker##79265 |goto The Ringing Deeps/0 57.17,45.64
stickystart "Slay_Skardyn_And_Rescue_Earthen"
step
click Fearbreaker
疏散守卫人群 |q 79265/3 |goto The Ringing Deeps/0 60.43,50.63 |count 1
step
click Fearbreaker
疏散守卫人群 |q 79265/3 |goto The Ringing Deeps/0 60.95,54.80 |count 2
step
click Fearbreaker
疏散守卫人群 |q 79265/3 |goto The Ringing Deeps/0 59.03,54.48 |count 3
step
click Fearbreaker
疏散守卫人群 |q 79265/3 |goto The Ringing Deeps/0 57.82,53.27 |count 4
step
label "Slay_Skardyn_And_Rescue_Earthen"
杀死周围的敌人
talk Injured Earthen##216084+
|tip 他们看起来像{o}友好的矮人{}。
杀死 Skardyn 并营救 Earthen |q 79265/2 |goto The Ringing Deeps/0 59.17,52.08
'|kill Skardyn Devastator##215844, Skardyn Reaver##215842, Skardyn Degenerator##215843, Voidstone Behemoth##221307
step
talk Moira Thaurissan##216085
turnin Fearbreaker##79265 |goto The Ringing Deeps/0 61.76,46.62
accept The Bronzebeard Legacy##79266 |goto The Ringing Deeps/0 61.76,46.62
step
进入建筑 |goto The Ringing Deeps/0 58.85,64.23 < 15 |walk
talk Noli Marlen##221043
|tip 建筑内部
turnin Fog Follower##81559 |goto The Ringing Deeps/0 59.30,63.96
step
杀死周围的敌人
collect 6 Galvanic Gland##224271 |q 82773/1 |goto The Ringing Deeps/0 61.03,77.08
'|kill Juvenile Lurker##224753, Galvanized Lurker##224779
step
talk Prospera Cogwail##225608
accept Tired of Tripping##83155 |goto The Ringing Deeps/0 63.77,79.20
step
talk Griz Finglebur##225067
turnin To Opportunity Point##82956 |goto The Ringing Deeps/0 63.34,78.87
step
talk Clixi Fastfare##224884
fpath Opportunity Point |goto 64.71,78.08
step
talk Garv Gearwhistle##223184
accept Papers? Please!##82226 |goto The Ringing Deeps/0 64.95,78.59
step
对付 6# 捣乱者 |q 82226/1 |goto The Ringing Deeps/0 64.89,78.48
|tip 对{o}抵达的探矿者{}使用行动条上的能力。
|tip 他们看起来像是在附近小路上行走的{o}妖精{}。
|tip 对他们使用{o}呼唤{}能力。
|tip 有些人会逃跑。
|tip 对{o}试图逃跑的{o}使用{o}召唤空袭{}能力。
'|clicknpc Arriving Prospector##223180
step
talk Garv Gearwhistle##223184
turnin Papers? Please!##82226 |goto The Ringing Deeps/0 64.95,78.59
step
杀死周围的敌人
|tip 打败{o}入侵硬头怪{}后，你可以点击它们来{o}骑乘它们{}，获得一项能力并增加急速。
clicknpc Panicked Shredder Pilot##226108+
|tip 它们看起来就像{o}害怕的小妖精{}。
对付 15 号鼹鼠 |q 83155/1 |goto The Ringing Deeps/0 61.19,86.17
'|kill Invasive Hardhead##219163, Feral Hardhead##225938, Invasive Thickhead##219257
step
talk Prospera Cogwail##225608
turnin Tired of Tripping##83155 |goto The Ringing Deeps/0 63.77,79.20
accept A Little off the Top##83159 |goto The Ringing Deeps/0 63.77,79.20
step
kill Alhainr##225610
|tip 它在这片区域四处走动。
collect Alhainr's Skull##224779 |q 83159/1 |goto The Ringing Deeps/0 63.15,92.47
step
talk Prospera Cogwail##226336
turnin A Little off the Top##83159 |goto The Ringing Deeps/0 63.78,79.19
accept Put it Back, Put it Back!##83162 |goto The Ringing Deeps/0 63.78,79.19
step
clicknpc Ectoplasmic Excretion##225714+
|tip 它们看起来像绿色的渗出物
踩死 6# 史莱姆 |q 83162/1 |goto The Ringing Deeps/0 64.09,78.98
step
click Alhainr's Skull
将骷髅头带离城镇 |q 83162/3 |goto The Ringing Deeps/0 60.99,94.41
step
talk Prospera Cogwail##225608
turnin Put it Back, Put it Back!##83162 |goto The Ringing Deeps/0 63.77,79.20
step
talk Danagh##224602
|tip 建筑内部
turnin A Functional Favor##82773 |goto The Ringing Deeps/0 58.95,64.18
accept Antifogmatic##82774 |goto The Ringing Deeps/0 58.95,64.18
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.74,64.39 |count 1
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.54,64.93 |count 2
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.36,65.48 |count 3
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.03,64.52 |count 4
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.12,63.88 |count 5
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
驱散浓雾 |q 82774/1 |goto The Ringing Deeps/0 58.49,63.74 |count 6
|tip 使用{o}Antifogmatic{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你可能会遭到攻击。
step
talk Danagh##224602
|tip 建筑内部
turnin Antifogmatic##82774 |goto The Ringing Deeps/0 58.95,64.18
step
观看对话
|tip 建筑内部
talk Danagh##224602
accept Ghosts in the Machine##82785 |goto The Ringing Deeps/0 58.95,64.18
step
调查变电站 |q 82785/1 |goto The Ringing Deeps/0 58.53,61.57
|tip 在小洞穴的入口处。
step
clicknpc Arbauch's Ward##224010
|tip 小山洞内
移除病房 |q 82785/2 |goto The Ringing Deeps/0 58.48,61.85
step
talk Danagh##224602
|tip 小山洞内
turnin Ghosts in the Machine##82785 |goto The Ringing Deeps/0 58.31,62.02
accept Undoing the Damage##82990 |goto The Ringing Deeps/0 58.31,62.02
step
观看对话
|tip 小山洞内
talk Danagh##224602
告诉他_“我准备好了”_ |gossip 122684
杀死一波又一波进攻的敌人
保卫达纳 |q 82990/1 |goto The Ringing Deeps/0 58.36,62.65
'|kill Memory Leak##224593, Fouled Coolant##225395
step
talk Danagh##224602
|tip 建筑内部
turnin Undoing the Damage##82990 |goto The Ringing Deeps/0 59.01,64.11
accept Duty of Care##82786 |goto The Ringing Deeps/0 59.01,64.11
step
talk Clive DelGizmo##216311
|tip 建筑内部
accept Stone Tracing##82969 |goto The Ringing Deeps/0 58.92,64.11
stickystart "Exterminate_Pests"
step
三角定位泥巨人的位置 |q 82969/1 |goto The Ringing Deeps/0 53.67,60.90 |count 1
|tip 使用{o}三角矩阵{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你会受到攻击。
step
三角定位泥巨人的位置 |q 82969/1 |goto The Ringing Deeps/0 52.67,53.36 |count 2
|tip 使用{o}三角矩阵{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你会受到攻击。
step
三角定位泥巨人的位置 |q 82969/1 |goto The Ringing Deeps/0 51.07,47.20 |count 3
|tip 使用{o}三角矩阵{}能力。
|tip 在悬岩顶上。
|tip 它会以按钮的形式出现在屏幕上。
|tip 你会受到攻击。
step
_Next to you:_
talk Danagh's Cogwalker##224618
turnin Stone Tracing##82969
step
进入洞穴 |goto The Ringing Deeps/0 50.12,47.04 < 15 |walk
click Leaking Pipe
|tip 小山洞内
修补泄漏的管道 |q 82786/2 |goto The Ringing Deeps/0 49.64,47.51 |count 1
step
click Backup Substation Terminal
|tip 小山洞内
改变供电路线 |q 82786/1 |goto The Ringing Deeps/0 49.68,47.96
step
click Leaking Pipe
|tip 小山洞内
修补泄漏的管道 |q 82786/2 |goto The Ringing Deeps/0 49.81,47.96 |count 2
step
click Leaking Pipe
|tip 小山洞内
修补泄漏的管道 |q 82786/2 |goto The Ringing Deeps/0 50.03,47.77 |count 3
step
label "Exterminate_Pests"
杀死周围的敌人
消灭 #12# 害虫 |q 82786/3 |goto The Ringing Deeps/0 52.23,52.54
'|kill Budding Lashroom##224949, Lashroom Ambusher##224607, Rummaging Mudnose##225482, Roiling Steam##226621
step
_Next to you:_
talk Danagh's Cogwalker##224618
turnin Duty of Care##82786
accept Decommissioning Darkness##82814
step
进入洞穴 |goto The Ringing Deeps/0 49.62,63.57 < 15 |walk
kill Corrupted Golem##224791 |q 82814/1 |goto The Ringing Deeps/0 48.69,61.95
|tip 它在这片区域四处走动。
|tip 在洞穴里面。
collect Arbauch's Memory Gem##224555 |q 82814/2 |goto The Ringing Deeps/0 48.69,61.95
step
talk Danagh##224602
|tip 建筑内部
turnin Decommissioning Darkness##82814 |goto The Ringing Deeps/0 59.01,64.11
step
talk Moira Thaurissan##217827
|tip 建筑内部
turnin The Bronzebeard Legacy##79266 |goto The Ringing Deeps/0 47.18,34.12
step
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Intro & Isle of Dorn (Full Zone)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Hallowfall (Full Zone)"		|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Hallowfall (Full Zone)",{
author="support@zygorguides.com",
},[[
step
_NOTE:_
某些支线任务需要玩家达到 80 级
|tip 本指南包含{o}需要80级才能完成的{o}支线任务{}。
|tip 由于你还未达到80级，所以{o}不会显示这些任务{}。
|tip 一旦你{o}达到80级{}，要完成这些任务，{o}重新加载本指南，然后从头开始{}。
点击此处继续 |confirm
|only if level < 80
step
talk Anduin Wrynn##213983
accept The Hallowed Path##78658 |goto The Ringing Deeps/0 47.08,32.22
step
找到通往万圣降临之门 |q 78658/1 |goto 40.68,24.11
step
talk Anduin Wrynn##213120
告诉他_“我准备好了”_ |gossip 120906
在万圣降临与安度因对话 |q 78658/2 |goto Hallowfall/0 77.17,43.00
step
talk Captain Trueflame##216061
accept Status Report##79309 |goto Hallowfall/0 70.50,44.91
step
talk Barahl Lynflayme##217609
|tip 建筑内部
accept Care Package##79304 |goto Hallowfall/0 69.25,43.83
step
在杜奈尔的仁慈之地与阿拉提会面 |q 78658/3 |goto 68.40,45.11
step
观看对话
talk Faerin##213116
turnin The Hallowed Path##78658 |goto 68.40,45.11	|only if (haveq(78658) or completedq(78658)) and not haveq(83551)
turnin Hallowfall##83551 |goto 68.40,45.11		|only if haveq(83551) or completedq(83551)
accept Where the Light Touches##78659 |goto 68.40,45.11
step
talk Derill Fayn##225879
accept Suspicious Minds##83247 |goto Hallowfall/0 68.06,44.22
step
talk Lerrenai Fayn##225857
accept For Morale##83283 |goto Hallowfall/0 68.00,44.21
step
talk Auro Flitter##217639
fpath Dunelle's Kindness |goto 67.48,44.62
stickystart "Collect_Salamanther_Hearts"
step
click Arathi Wine+
|tip 它们看起来像{o}木桶{}。
collect 6 Imperial Brut##225340 |q 83283/1 |goto Hallowfall/0 65.39,42.26
step
label "Collect_Salamanther_Hearts"
kill Thieving Salamanther##225919
collect 9 Salamanther Heart##225179 |q 83247/1 |goto Hallowfall/0 65.11,41.48
step
talk Lerrenai Fayn##225857
turnin For Morale##83283 |goto Hallowfall/0 68.00,44.21
step
talk Derill Fayn##225879
turnin Suspicious Minds##83247 |goto Hallowfall/0 68.06,44.22
step
talk Scout Wayshelm##216063
turnin Status Report##79309 |goto Hallowfall/0 75.37,49.64
accept Seek the Lost##79310 |goto Hallowfall/0 75.37,49.64
step
_NOTE:_
在接下来的步骤中
|tip {o}避免在{o}水潭中站太久。
|tip 如果你在{o}水中站得太久{}，就会受到{o}伤害{}。
|tip {跳入水中{}可能有助于{o}防止{o}获得{o}debuff{}。
点击此处继续 |confirm |q 79310
step
寻找韦谢尔姆的童子军成员 |q 79310/1 |goto Hallowfall/0 74.46,51.26
step
clicknpc Scout Maevest##216064
|tip 你可能会遭到攻击。
检查倒下的童子军 |q 79310/2 |goto Hallowfall/0 74.46,51.26
step
click Maevest's Compass##422560
为威瑟姆找回纪念品 |q 79310/3 |goto Hallowfall/0 74.45,51.24
step
talk Scout Wayshelm##216063
turnin Seek the Lost##79310 |goto Hallowfall/0 75.37,49.64
accept Stem the Flow##79311 |goto Hallowfall/0 75.37,49.64
accept Mow the Masses##79312 |goto Hallowfall/0 75.37,49.64
stickystart "Slay_Shadowmire_Monsters"
step
click Foulnectar Frond+
|tip 它们看起来就像水池里的{o}植物{}。
摧毁 #8# 粗叶蕨类植物 |q 79312/1 |goto Hallowfall/0 74.95,52.40
step
label "Slay_Shadowmire_Monsters"
杀死周围的敌人
杀死 #12# 暗影魔怪 |q 79311/1 |goto Hallowfall/0 74.46,51.87
'|kill Bloatrot Stinger##216065, Fungal Infestor##216077
step
talk Scout Wayshelm##216063
turnin Stem the Flow##79311 |goto Hallowfall/0 75.53,51.85
turnin Mow the Masses##79312 |goto Hallowfall/0 75.53,51.85
accept What Grows in the Dark##79313 |goto Hallowfall/0 75.53,51.85
step
进入洞穴 |goto Hallowfall/0 76.11,53.73 < 30 |walk
kill Fallowbarb##216078 |q 79313/1 |goto Hallowfall/0 76.28,55.20
|tip 在洞穴里面。
step
talk Captain Trueflame##216061
turnin What Grows in the Dark##79313 |goto Hallowfall/0 70.50,44.90
step
click Relief Cart
|tip 这一步是可选的
|tip 如果你不想听故事，可以省略这一步。
和法林一起骑马前往宙斯之墙 |q 78659/1 |goto 68.22,45.17
step
抵达宙斯之墙 |q 78659/2 |goto 71.43,57.50 |notravel
step
talk Great Kyron##224310
turnin Where the Light Touches##78659 |goto 71.62,57.59
accept Tunnel Trouble##78665 |goto 71.62,57.59
step
talk Faerin##213116
accept Igniting Hope##79999 |goto 71.57,57.59
step
talk Vellas Tearen##218298
fpath The Aegis Wall |goto 71.37,56.50
stickystart "Collect_Shattered_Remnants_From_Nerubians"
step
click Nerubian Burrow+
|tip 它们看起来就像一大堆裂开的泥土。
|tip 你会受到攻击。
摧毁 #6# 奈鲁伯人的洞穴 |q 78665/1 |goto 69.96,58.78
step
label "Collect_Shattered_Remnants_From_Nerubians"
杀死周围的敌人
|tip 其中一些会飞向空中。
从奈鲁伯人那里收集 #5# 碎裂残片 |q 79999/1 |goto 71.34,61.09
'|kill Dreadstrike Subjugator##213129, Dreadstrike Flitterer##213320, Dreadstrike Priest##213189, Dreadstrike Ambusher##217481
step
click Aegis Keyflame
|tip 在墙上
|tip 反复点击
用 #5# 次破碎残片增强宙斯之墙钥匙火焰的威力 |q 79999/2 |goto 70.04,61.06
step
talk Faerin##213116
|tip 在墙上
turnin Igniting Hope##79999 |goto 70.12,61.00
step
talk Great Kyron##224310
|tip 在墙上
turnin Tunnel Trouble##78665 |goto 70.06,61.31
accept The Only Good Spider##78666 |goto 70.06,61.31
step
talk Faerin##213116
|tip 在墙上
accept Rekindled Memories##78667 |goto 70.12,60.99
stickystart "Slay_Nerubian_Attackers"
step
click Fallen Defender+
|tip 他们看起来就像躺在地上的{o}装甲人{}。
回收 #6# 煤球箱 |q 78667/1 |goto 71.61,61.20
step
label "Slay_Nerubian_Attackers"
杀死周围的敌人
|tip 其中一些会飞向空中。
杀死 #12# 奈鲁比攻击者 |q 78666/1 |goto 71.17,60.94
'|kill Dreadstrike Subjugator##213129, Dreadstrike Flitterer##213320, Dreadstrike Priest##213189
step
talk Great Kyron##224310
|tip 在墙上
turnin The Only Good Spider##78666 |goto 70.06,61.31
step
talk Faerin##213116
|tip 在墙上
turnin Rekindled Memories##78667 |goto 70.12,61.00
accept Rally on the Dawnbreaker##78668 |goto 70.12,61.00
step
talk Maera Ashyld##220718
accept Runway Scare-a-way##80673 |goto Hallowfall/0 60.49,60.21
accept Torching Lights##80677 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
stickystart "Kill_Flickering_Glowmoths"
step
use the Lamplighter Firearm##219943
|tip 用它来对付{o}蛾卵{}。
|tip 它们看起来像{o}一团团棕色的蛋{}。
|tip 它们在高大的植物上
烧掉 #15# 飞蛾卵束 |q 80677/1 |goto Hallowfall/0 61.14,62.53
|only if level >= 80
step
label "Kill_Flickering_Glowmoths"
kill 25 Flickering Glowmoth##220691 |q 80673/1 |goto Hallowfall/0 61.14,62.53
|tip 它们飞在高大的植物上面
|tip {飞过它们（空中飞人）{}杀死它们。
|only if level >= 80
step
talk Maera Ashyld##220718
turnin Runway Scare-a-way##80673 |goto Hallowfall/0 60.49,60.21
turnin Torching Lights##80677 |goto Hallowfall/0 60.49,60.21
accept Time Lost##80678 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
step
杀死周围的敌人
click Sludge Pile+
|tip 它们看起来就像{o}小垃圾堆{}。
收集 #6# 纪念品 |q 80678/1 |goto Hallowfall/0 60.39,61.79
'|kill Sludgeborn Shambler##220734, Mirehat Fungalmancer##221362, Mirehat Sporedancer##221363, Cultivated Mireshroom##221366
|only if level >= 80
step
talk Maera Ashyld##220718
turnin Time Lost##80678 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
step
离开洞穴 |goto Hallowfall/0 66.42,61.79 < 20 |walk |only if subzone("Sanguine Grasps") and indoors()
talk Faerin##224945
|tip 飞艇甲板上
turnin Rally on the Dawnbreaker##78668 |goto 57.50,64.43
accept Siege Weapon Sabotage##78670 |goto 57.50,64.43
step
talk Great Kyron##224946
|tip 飞艇甲板上
accept For Their Eyes Only##78669 |goto 57.50,64.39
stickystart "Collect_Sureki_Shadecasters"
step
click Blackpowder Barrel+
|tip 它们看起来像{o}棕色的木桶{}。
collect 4 Keg of Black Powder##213630 |q 78670/1 |goto 57.01,65.95
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.40,65.43 |count 1
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.62,66.18 |count 2
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.64,66.70 |count 3
step
click Blackpowder Barrel
摧毁攻城武器 |q 78670/2 |goto Hallowfall/0 59.69,67.40 |count 4
step
label "Collect_Sureki_Shadecasters"
杀死周围的敌人
|tip 只有长得像{o}蜘蛛{}的敌人才会掉落任务物品。
collect 3 Sureki Shadecaster##216658 |q 78669/1 |goto 57.01,65.95
'|kill Direweb Marauder##221302, Direweb Lasher##221303, Direweb Ritualist##221300
step
talk Anduin Wrynn##213120
|tip 飞艇甲板上
turnin For Their Eyes Only##78669 |goto 57.54,64.33
turnin Siege Weapon Sabotage##78670 |goto 57.54,64.33
accept Zero out Xerosh##82836 |goto 57.54,64.33
step
kill Siegelord Xerosh##224311 |q 82836/1 |goto 57.71,68.14
step
talk Anduin Wrynn##213120
turnin Zero out Xerosh##82836 |goto 56.90,68.27
accept The Light of the Dawntower##78671 |goto 56.90,68.27
step
talk Anduin Wrynn##217826
告诉他_“我准备好了”_ |gossip 120738
见证黎明塔的点亮 |q 78671/1 |goto 54.10,64.65
step
talk Faerin##213116
turnin The Light of the Dawntower##78671 |goto 54.11,64.70
accept A Lamplighter's Duty##78672 |goto 54.11,64.70
step
talk Gear Flamepierce##218300
fpath Lightspark |goto 52.86,61.33
step
talk Sophietta Lynflayme##216001
turnin Care Package##79304 |goto Hallowfall/0 52.71,60.29
accept The Notebook##79300 |goto Hallowfall/0 52.71,60.29
step
talk Flight Observer Viktorina##216313
问她 _“你看到索菲塔的笔记本了吗？”_ |gossip 122775
向 Flight Observer Viktorina 询问关于 Sophietta 笔记本的情况 |q 79300/1 |goto Hallowfall/0 52.11,59.75
step
talk Caretaker Ryston##216316
|tip 建筑内部
问他_"看到埃德温了吗？或者索菲塔的笔记本？ |gossip 122777
向看守人 Ryston 询问有关 Edwyn 的情况 |q 79300/2 |goto Hallowfall/0 52.27,60.83
step
talk Headmaster Fynch##216011
|tip 楼内楼上
问他_"你见过埃德温吗？ |gossip 122778
向 Fynch 校长询问有关 Edwyn 的情况 |q 79300/3 |goto Hallowfall/0 52.39,60.73
step
talk Engineering Instructor Morgaen##216314
|tip 大楼外
问她 "埃德温来过这里吗？” |gossip 122830
向工程指导员 Morgaen 询问有关 Edwyn 的情况 |q 79300/4 |goto Hallowfall/0 53.66,59.47
step
talk Sophietta Lynflayme##225925
turnin The Notebook##79300 |goto Hallowfall/0 53.40,59.45
accept Height Club##79301 |goto Hallowfall/0 53.40,59.45
step
talk Edwyn Wyndsmithe##216014
告诉他_“索菲塔需要她的笔记本”_ |gossip 122835
kill Edwyn Wyndsmithe##216014
|tip 他最终会逃脱的
向 Edwyn 询问笔记本的事 |q 79301/1 |goto Hallowfall/0 53.08,59.05
step
talk Sophietta Lynflayme##225925
turnin Height Club##79301 |goto Hallowfall/0 53.40,59.45
accept Gone with the Wind##79302 |goto Hallowfall/0 53.40,59.45
step
kill Learned Mongrel##225445+
click Lost Page+
|tip 它们看起来像{o}纸片{}。
collect 10 Stained and Tattered Page##225180 |q 79302/1 |goto Hallowfall/0 54.62,56.12
step
talk Sophietta Lynflayme##225926
turnin Gone with the Wind##79302 |goto Hallowfall/0 53.45,60.58
accept A Principled Principal##79303 |goto Hallowfall/0 53.45,60.58
step
在教室里见到 Fynch |q 79303/1 |goto Hallowfall/0 52.39,60.73
|tip 楼内楼上
step
观看对话
|tip 楼内楼上
talk Sophietta Lynflayme##225927
告诉她_"我们必须继续努力。我们会打通他的电话的！"_ |gossip 122848
对索菲塔说 |q 79303/2 |goto Hallowfall/0 52.40,60.82
step
talk Headmaster Fynch##226082
|tip 建筑内部
告诉他_“接受索菲塔的报告是公平的”_ |gossip 122873
与芬奇校长交谈 |q 79303/3 |goto Hallowfall/0 52.73,59.26
step
talk Headmaster Fynch##226074
|tip 建筑内部
turnin A Principled Principal##79303 |goto Hallowfall/0 52.75,59.28
step
talk Orren Masyn##223920
accept A Helping Farmhand##82477 |goto Hallowfall/0 49.12,61.95
stickystart "Collect_Slightly_Chewed_Harvest_Bounty"
step
talk Wenren Althal##219135
|tip 建筑内部
accept Arcane Trickles##80176 |goto Hallowfall/0 48.80,64.51
step
label "Collect_Slightly_Chewed_Harvest_Bounty"
kill Gluttonous Jawcrawler##223931+
collect 8 Slightly Chewed Harvest Bounty##224051 |q 82477/1 |goto Hallowfall/0 47.77,63.06
step
talk Orren Masyn##224378
turnin A Helping Farmhand##82477 |goto Hallowfall/0 47.29,64.82
accept Regularly Scheduled Maintenance##82478 |goto Hallowfall/0 47.29,64.82
stickystart "Collect_Amber_Blooms"
step
click Crimson Charmer+
|tip 它们看起来像{o}开着红花的绿色植物{}。
|tip 你可能会遭到攻击。
collect 6 Crimson Charmer##224098 |q 82478/1 |goto Hallowfall/0 49.97,68.01
step
label "Collect_Amber_Blooms"
click Amber Bloom+
|tip 它们看起来像{o}一簇簇黄色的花朵{}。
|tip 你可能会被攻击。|注意
collect 6 Amber Bloom##224099 |q 82478/2 |goto Hallowfall/0 49.97,68.01
step
talk Phillip Taversil##218486
accept Stuffed Lynx Toy##80679 |goto Hallowfall/0 43.28,55.44 |instant
|only if completedq(80678)
step
talk Endiri Dawnsurge##215306
accept Dereliction of Duty##79159 |goto Hallowfall/0 41.45,52.40
step
talk Anje Noon##218305
|tip 在墙上
fpath Mereldar |goto 41.57,52.59
step
click Grave Offering Location##439890
accept Tarnished Compass##80680 |goto Hallowfall/0 43.48,51.73 |instant
|only if level >= 80
step
talk Great Kyron##215341
|tip 建筑内部
accept A Moment to Rest##79165 |goto Hallowfall/0 43.16,52.41
|only if level >= 80
step
talk Shinda Creedpike##215301
|tip 建筑内部
问他 "你是辛达-克里德派克吗？” |gossip 120465
问他 "你为什么没来上班？” |gossip 120557
告诉他 我很抱歉 |gossip 120574
告诉他 "对自己好点 给自己一点时间 |gossip 120584
与信达-克里德派克交谈 |q 79159/1 |goto Hallowfall/0 40.74,50.63
step
talk Shinda Creedpike##215301
|tip 建筑内部
turnin Dereliction of Duty##79159 |goto Hallowfall/0 40.74,50.63
accept Fishing is Good for the Soul##79160 |goto Hallowfall/0 40.74,50.63
step
talk General Steelstrike##215335
|tip 建筑内部
accept The Brothers Braunpyke##82628 |goto Hallowfall/0 40.51,50.75
step
kill Strange Shore Crawler##219365+
collect 5 Arcane Suffused Organ##217269 |q 80176/1 |goto Hallowfall/0 36.66,46.50
step
talk Baron Sybaestan Braunpyke##217424
turnin The Brothers Braunpyke##82628 |goto Hallowfall/0 30.94,55.61
accept Wipe Away Their Smiles##79641 |goto Hallowfall/0 30.94,55.61
step
talk Sir Theleon Braunpyke##217426
accept Stave Them Off##79642 |goto Hallowfall/0 30.96,55.63
stickystart "Collect_Darkwater_Teeth"
step
click Darkwater Staff+
收集 #5# Staves |q 79642/1 |goto Hallowfall/0 29.70,59.54
step
_Next to you:_
talk Sir Theleon Braunpyke
turnin Stave Them Off##79642
'|talk Sir Theleon Braunpyke##221486
step
label "Collect_Darkwater_Teeth"
杀死周围的敌人
collect 100 Darkwater Tooth##219211 |q 79641/1 |goto Hallowfall/0 30.25,59.28
'|kill Darkwater Belly-gutter##220992, Darkwater Evoker##220990, Darkwater Necromage##225576, Darkwater Ranger##220991
step
_Next to you:_
talk Baron Sybaestan Braunpyke
turnin Wipe Away Their Smiles##79641
accept Dreaded Dreadfang##79643
'|talk Baron Sybaestan Braunpyke##221492
step
kill Dreadfang the Merciless##220302 |q 79643/1 |goto Hallowfall/0 29.03,61.98
|tip 小屋内
step
talk Baron Sybaestan Braunpyke##217424
turnin Dreaded Dreadfang##79643 |goto Hallowfall/0 29.07,61.83
accept Go to the Priory##79644 |goto Hallowfall/0 29.07,61.83
step
在信达-克里德派克的渔洞旁与他会面 |q 79160/1 |goto Hallowfall/0 39.46,63.93
'|clicknpc Shinda Creedpike##215301
step
杀死周围的敌人
清除渔洞周围的 #4# 生物 |q 79160/2 |goto Hallowfall/0 39.82,63.35
'|kill Horrific Baelgat##229059, Enraged Kodiak##229060
step
talk Shinda Creedpike##215301
turnin Fishing is Good for the Soul##79160 |goto Hallowfall/0 39.46,63.93
accept Burnout##79162 |goto Hallowfall/0 39.46,63.93
step
talk Faerin Lothar##215331
选择 _“<清清喉咙，什么也别说>”_ |gossip 120710
找到费林 |q 79165/1 |goto Hallowfall/0 40.72,70.96
|only if level >= 80
step
观看对话
talk Anduin Wrynn##218541
turnin A Moment to Rest##79165 |goto Hallowfall/0 40.69,70.90
accept Lost Pieces##79166 |goto Hallowfall/0 40.69,70.90
|only if level >= 80
step
杀死周围的敌人
收集 #8# 丢失的物品 |q 79166/1 |goto Hallowfall/0 41.52,75.22
'|kill Coalescing Shadow##217649, Lone Murkwalker##217612, Deep Murkmoth##217694, Dark Hound##217698
|only if level >= 80
step
talk Wenren Althal##219135
|tip 建筑内部
turnin Arcane Trickles##80176 |goto Hallowfall/0 48.80,64.51
accept Arcane Experiments##80177 |goto Hallowfall/0 48.80,64.51
step
观看对话
clicknpc Telerune Node##220035
|tip 建筑内部
开始校准节点 |havebuff Calibrating##440726 |goto Hallowfall/0 48.73,64.42 |q 80177
step
clicknpc Telerune Node##220035
|tip 建筑内部
连接节点 |q 80177/1 |goto Hallowfall/0 48.67,64.67 |count 1
step
clicknpc Telerune Node##220035
|tip 建筑内部
开始校准节点 |havebuff Calibrating##440727 |goto Hallowfall/0 48.67,64.67 |q 80177
step
clicknpc Telerune Node##220035
|tip 建筑内部
连接节点 |q 80177/1 |goto Hallowfall/0 48.79,64.67 |count 2
step
clicknpc Telerune Node##220035
|tip 建筑内部
开始校准节点 |havebuff Calibrating##440722 |goto Hallowfall/0 48.79,64.67 |q 80177
step
clicknpc Telerune Node##220035
|tip 建筑内部
连接节点 |q 80177/1 |goto Hallowfall/0 Hallowfall/0 48.73,64.42 |count 3
step
click Portal to Somewhere
|tip 建筑内部
进入传送门 |q 80177/2 |goto Hallowfall/0 48.73,64.53
step
click Portal to Wenren's Lab
帮助温仁通过传送门 |q 80177/3 |goto Hallowfall/0 53.87,66.89
step
观看对话
click Portal to Somewhere
进入传送门 |q 80177/4 |goto Hallowfall/0 53.92,67.01
step
帮助温仁通过传送门 |q 80177/5 |goto Hallowfall/0 63.47,43.85
step
clicknpc Wenren Althal##219173
|tip 建筑内部
turnin Arcane Experiments##80177 |goto Hallowfall/0 48.68,64.58
accept A Murder Most Foul##80178 |goto Hallowfall/0 48.68,64.58
step
clicknpc Wenren Althal##219173
|tip 建筑内部
选择 _“<检查身体>”_ |gossip 122070
调查尸体 |q 80178/2 |goto Hallowfall/0 48.68,64.58
step
click Burnt Research
|tip 建筑内部
调查烧毁的研究 |q 80178/1 |goto Hallowfall/0 48.79,64.61
step
click Smashed Accoutrements
|tip 建筑内部
调查被打碎的装备 |q 80178/3 |goto Hallowfall/0 48.64,64.45
step
clicknpc Wenren Althal##219173
|tip 建筑内部
turnin A Murder Most Foul##80178 |goto Hallowfall/0 48.68,64.58
accept Finding Justice##80179 |goto Hallowfall/0 48.68,64.58
step
talk Tefferty Ulreth##219189
|tip 建筑内部
选择 _"<询问他对温仁-阿尔塔尔做了什么？ |gossip 122071
kill Tefferty Ulreth##219189
找到杀害温仁的凶手 |q 80179/2 |goto Hallowfall/0 46.02,64.60
step
talk Faerin Lothar##215331
|tip 建筑内部
turnin Lost Pieces##79166 |goto Hallowfall/0 43.16,52.60
|only if level >= 80
step
观看对话
talk Faerin Lothar##215331
|tip 建筑内部
accept Crowdsourcing##79167 |goto Hallowfall/0 43.16,52.60
|only if level >= 80
step
talk Kiera Horth##217813
|tip 建筑内部
问她_"法厄林想知道你是否有光之赌局的棋子可以借用？ |gossip 120737
借一枚棋子 |q 79167/1 |goto Hallowfall/0 43.97,49.71 |count 1
|only if level >= 80
step
talk Endiri Dawnsurge##215306
turnin Burnout##79162 |goto Hallowfall/0 41.45,52.40
step
talk General Steelstrike##215335
|tip 建筑内部
turnin Finding Justice##80179 |goto Hallowfall/0 40.51,50.75
step
talk Marja Lenglow##217830
|tip 建筑内部
问她_"法厄林想知道你是否有光之赌局的棋子可以借用？ |gossip 120739
借一枚棋子 |q 79167/1 |goto Hallowfall/0 40.32,51.00 |count 2
|only if level >= 80
step
talk Keth Wernt##217831
|tip 楼内楼上
问他_"Faerin 想知道你是否有一枚光明棋子？ |gossip 120740
借一枚棋子 |q 79167/1 |goto Hallowfall/0 41.76,55.83 |count 3
|only if level >= 80
step
talk Cargen Fairleifen##217808
问他_"Faerin 想知道你是否有一枚光明棋子？ |gossip 120735
借一枚棋子 |q 79167/1 |goto Hallowfall/0 43.00,56.84 |count 4
|only if level >= 80
step
talk Faerin Lothar##218267
|tip 楼内楼上
turnin Crowdsourcing##79167 |goto Hallowfall/0 43.17,52.35
accept Light's Gambit##79168 |goto Hallowfall/0 43.17,52.35
|only if level >= 80
step
clicknpc Light's Gambit##217926
|tip 楼内楼上
开始游戏 |invehicle |goto Hallowfall/0 43.19,52.39 |q 79168
|only if level >= 80
step
观看对话
|tip 使用行动条上的能力。
|tip 移动你的{o}2颗小棋子靠近敌方城堡{}。
|tip 对敌方城堡使用你的棋子的破坏能力。
|tip 使用能力后，{o}迅速切换你的棋子{}，这样你就可以{o}在冷却时间内使用能力{}。
玩光明棋局 |q 79168/1 |goto Hallowfall/0 43.16,52.39
|only if level >= 80
step
talk Anduin Wrynn##215333
|tip 楼内楼上
选择 _"我想我们该走了。<完成任务目标。 |gossip 120755
逗留片刻，聊聊天 |q 79168/2 |goto Hallowfall/0 43.19,52.41
|only if level >= 80
step
talk Anduin Wrynn##217909
|tip 楼内楼上
turnin Light's Gambit##79168 |goto Hallowfall/0 43.17,52.43
|only if level >= 80
step
clicknpc Lamplighter Skiff##215779
开始乘坐快艇前往罗瑞尔渡口 |invehicle |goto 53.89,64.09 |q 78672
step
观看对话
杀死攻击的敌人
|tip 飞艇会{o}停多次{}。
|tip 敌人会飞向小艇。
|tip 使用行动条上的能力。
驾驶快艇前往罗瑞尔十字路口 |q 78672/1 |goto 48.39,40.63 |notravel
step
talk Bastian Wynfall##218295
fpath Lorel's Crossing |goto 48.38,40.71
step
talk Aegor Irynbawnd##214019
accept Lights Out##78686 |goto Hallowfall/0 49.19,41.10
step
talk Haelmut Aegisaxe##222683
|tip 建筑内部
accept Hungry in Hollow##84392 |goto Hallowfall/0 49.25,39.52
也可在 [Hallowfall/0 48.43,39.42] 处查看。
step
talk Sister Etna Blayze##217398
turnin Go to the Priory##79644 |goto Hallowfall/0 40.49,34.98
accept Sweet-Sting Infestation##79645 |goto Hallowfall/0 40.49,34.98
accept Memorial Wine##79646 |goto Hallowfall/0 40.49,34.98
step
talk Tristan Lyte##218323
|tip 飞上窗台
fpath Priory of the Sacred Flame |goto 41.14,33.67
step
talk Brother Abealard##221530
告诉他_“我准备好开始了！”_ |gossip 121794
与阿比阿拉德修士交谈 |q 79646/1 |goto Hallowfall/0 39.44,33.24
step
观看对话
|tip {阿比阿拉德兄弟会给你{o}指示{}。
|tip {点击物品{}，然后按照他的指示{o}跳到附近的葡萄上{}。
酿制纪念酒 |q 79646/2 |goto Hallowfall/0 39.52,33.28
step
杀死周围的敌人
collect 10 Sweet-sting venom##218113 |q 79645/1 |goto Hallowfall/0 39.55,32.84
'|kill Invasive Sweet-sting##220502, Sweet-sting Worker##220500
step
talk Sister Etna Blayze##217398
turnin Sweet-Sting Infestation##79645 |goto Hallowfall/0 40.49,34.98
turnin Memorial Wine##79646 |goto Hallowfall/0 40.49,34.98
accept Burning Reflections##79647 |goto Hallowfall/0 40.49,34.98
step
talk Baron Sybaestan Braunpyke##217424
选择 _“<您静静地告诉西巴伊斯坦，只要他准备好了，您就可以开始了>”_ |gossip 121923
与西拜斯坦对话开始 |q 79647/1 |goto Hallowfall/0 39.54,37.40
step
click Memory
观看对话
燃烧记忆 |q 79647/2 |goto Hallowfall/0 39.52,37.50 |count 1
step
click Memory
观看对话
燃烧记忆 |q 79647/2 |goto Hallowfall/0 39.50,37.47 |count 2
step
click Memory
观看对话
燃烧记忆 |q 79647/2 |goto Hallowfall/0 39.49,37.44 |count 3
step
talk Sister Etna Blayze##217398
turnin Burning Reflections##79647 |goto Hallowfall/0 39.63,37.17
accept Missing Somebody##79648 |goto Hallowfall/0 39.63,37.17
step
click Funerary Platform
检查殡葬平台 |q 79648/1 |goto Hallowfall/0 38.53,37.81
step
talk Sister Etna Blayze##217398
turnin Missing Somebody##79648 |goto Hallowfall/0 39.63,37.17
accept Sacred Flame Inquisition##79649 |goto Hallowfall/0 39.63,37.17
step
talk Various NPCs
|tip 他们看起来像是{o}友好的 NPC，名字各不相同{}。
选择_“<向他们询问失踪尸体的情况>”_ |gossip 121830
|tip 其中一些会攻击你。
|tip {打败攻击你的NPC{o}，完成任务目标。
询问 #5# 可疑的神职人员 |q 79649/1 |goto Hallowfall/0 40.00,36.92
'|talk Vitner Monk##217452, Pious Disciple##217464, Helpful Clergy##217434
step
talk Sister Etna Blayze##217398
turnin Sacred Flame Inquisition##79649 |goto Hallowfall/0 40.33,34.91
step
talk Faerin##214378
turnin A Lamplighter's Duty##78672 |goto 53.91,31.44
accept Tricks of the Dark##78929 |goto 53.91,31.44
step
talk General Steelstrike##214376
accept Fickle Fiendish Fish##78932 |goto 53.93,31.48
stickystart "Accept_Gasping_Plea"
stickystart "Slay_Kobyss_Invaders"
step
talk Arathi Captive##215891+
|tip 他们看起来像{o}害怕的人类{}。
营救 #5# 阿拉提 |q 78929/1 |goto 54.11,28.61
step
label "Accept_Gasping_Plea"
talk Arathi Captive##215623+
|tip 和身后有{o}Kobyss Shadeshapers{} 的人对话。
kill Kobyss Shadeshaper##215653+
collect Gasping Fish##217352 |n
accept Gasping Plea##80312 |goto Hallowfall/0 54.11,28.61
step
label "Slay_Kobyss_Invaders"
杀死周围的敌人
|tip 长得像{o}阿拉伯人的敌人不算数{}。
杀死 #13# 科比斯入侵者 |q 78932/1 |goto 54.02,29.08
'|kill Deepwater Eel##215680, Deepwater Kobyss##215750, Drowned Arathi##215684, Deepwater Abomination##215654, Awakener Kobyss##215683
step
将鱼扔进无日海滩附近的水中 |q 80312/1 |goto Hallowfall/0 54.52,25.33
|tip 使用{o}将我放入水中{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
clicknpc Peculiar Fish##219430
turnin Gasping Plea##80312 |goto Hallowfall/0 54.52,25.33
accept Tidal Charms##80313 |goto Hallowfall/0 54.52,25.33
accept Voices from the Deep##80314 |goto Hallowfall/0 54.52,25.33
stickystart "Collect_Sunless_Shards"
step
click Kobyss Shrine
研究升起的神殿 |q 80314/1 |goto Hallowfall/0 55.29,24.18
step
click Kobyss Shrine
研究水下神殿 |q 80314/2 |goto Hallowfall/0 56.31,22.59
step
click Kobyss Shrine
研究守卫神殿 |q 80314/3 |goto Hallowfall/0 56.96,24.75
step
label "Collect_Sunless_Shards"
杀死周围的敌人
collect 12 Sunless Shard##217709 |q 80313/1 |goto Hallowfall/0 56.11,24.31
'|kill Sunless Carver##219604, Sunless Beckoner##219601
step
clicknpc Peculiar Fish##219430
turnin Tidal Charms##80313 |goto Hallowfall/0 54.52,25.33
turnin Voices from the Deep##80314 |goto Hallowfall/0 54.52,25.33
accept Alluring Offer##80315 |goto Hallowfall/0 54.52,25.33
stickystart "Kill_Sunless_Tidemarshals"
step
kill Chieftain Gillcarver##219633 |q 80315/3 |goto Hallowfall/0 53.96,20.03
|tip 使用{o}脱离战斗的{o}障眼法诱饵{ }能力。
|tip 走{o}到他旁边{}，使用{o}伏击引诱{}能力。
|tip 他们会被{o}削弱{}。
|tip 它会以按钮的形式出现在屏幕上。
|tip 他在这附近走动。
step
label "Kill_Sunless_Tidemarshals"
kill 5 Sunless Tidemarshal##219602 |q 80315/2 |goto Hallowfall/0 53.87,20.51
|tip 在脱离战斗的同时使用{o}“掩盖引诱{ }”能力。|注意
|tip 走到敌人{o}旁边{}，使用{o}伏击引诱{}能力。|注释
|tip 他们会被{o}削弱{}。|注释
|tip 在屏幕上显示为一个按钮。|注释
step
clicknpc Peculiar Fish##219430
turnin Alluring Offer##80315 |goto Hallowfall/0 54.52,25.33
accept Return to the Sea##80316 |goto Hallowfall/0 54.52,25.33
step
clicknpc Peculiar Fish##220117
收集鱼 |q 80316/1 |goto Hallowfall/0 54.52,25.33
step
把鱼扔到凄凉之沙的深水区 |q 80316/2 |goto Hallowfall/0 56.92,8.70
|tip 使用{o}将我放入水中{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
clicknpc Peculiar Fish##219430
turnin Return to the Sea##80316 |goto Hallowfall/0 56.92,8.70
step
talk Taenar Strongoth##213614
turnin Lights Out##78686 |goto Hallowfall/0 49.94,20.91
accept If it Leads, it Bleeds##78689 |goto Hallowfall/0 49.94,20.91
step
talk Aemyra Acton##213613
turnin Regularly Scheduled Maintenance##82478 |goto Hallowfall/0 49.98,20.83
accept The Sword is Mightier##82479 |goto Hallowfall/0 49.98,20.83
step
talk Aemyra Acton##213613
turnin Regularly Scheduled Maintenance##82478 |goto Hallowfall/0 49.98,20.83
accept The Sword is Mightier##82479 |goto Hallowfall/0 49.98,20.83
step
talk Aemyra Acton##213613
告诉她_“我准备好了”_ |gossip 122576
告诉她_"希望你不要担心，奥伦！我本来已经打算回农场了，但是在维尔汉的领地有很多科比斯。 |gossip 122577
告诉她_"我喜欢你送的花！能提醒我你在想我真是太好了。 |gossip 122584
告诉她_"我想你，奥尔，而且恐怕我还会想你一阵子，因为我要让人们在维尔汉领地安全地生活。 |gossip 122588
告诉她_"你和ELIZA一起做的工作非常出色。很快你就能让她照顾田地了，我们就有更多时间在一起了。 |gossip 122592
告诉她 "我真的很感激 你给我的生活带来的一切美好 奥伦” |gossip 122596
告诉她_“你的，Aemyra”_ |gossip 122600
把艾米拉的情感写在纸上 |q 82479/1 |goto Hallowfall/0 49.98,20.83
step
talk Aemyra Acton##213613
accept Cage, Match##78688 |goto Hallowfall/0 49.98,20.83
stickystart "Burn_Cages"
step
kill Sharpfang##213718 |q 78689/3 |goto Hallowfall/0 47.99,17.89
|tip 他在这附近走动。
同时查看 [Hallowfall/0 47.77,15.20] 附近的情况
step
label "Burn_Cages"
use the Torch of Holy Flame##211945
|tip 把它用在这个区域周围的{o}骨头笼子上。
烧掉 #10# 笼子 |q 78688/1 |goto Hallowfall/0 47.20,16.27
step
kill Droopfin##213716 |q 78689/1 |goto Hallowfall/0 46.58,16.43
|tip 他在这附近走动。
同时检查 [Hallowfall/0 45.55,15.75] 附近的情况
step
kill Bristlespine##213717 |q 78689/2 |goto Hallowfall/0 44.72,14.86
|tip 他在这附近走动。
也去周围看看： |notinsticky
[Hallowfall/0 44.00,15.59]
[Hallowfall/0 44.06,13.96]
step
talk Taenar Strongoth##213614
turnin If it Leads, it Bleeds##78689 |goto Hallowfall/0 45.74,13.09
step
talk Aemyra Acton##213613
turnin Cage, Match##78688 |goto Hallowfall/0 45.79,13.09
accept Situational Awareness##78690 |goto Hallowfall/0 45.79,13.09
stickystart "Reassure_Citizens"
step
talk Maximillian Velhan##213836
|tip 大楼内，顶楼
告诉他_"别担心，麦克斯。灯神会......"_ |gossip 120323
让马克西米利安放心 |q 78690/2 |goto Hallowfall/0 45.77,12.96
step
label "Reassure_Citizens"
talk Velhanite Citizen##213748+
|tip 在建筑内部的多个楼层。|注释
选择 _“<向他们保证点灯侠会处理好一切>”_ |gossip 120326
安抚 8# 公民 |q 78690/1 |goto Hallowfall/0 45.75,12.79
'|talk Velhanite Citizen##213749, Velhanite Child##213745
step
talk Aemyra Acton##213613
|tip 大楼外
turnin Situational Awareness##78690 |goto Hallowfall/0 45.79,13.09
accept Spears for Fears##78693 |goto Hallowfall/0 45.79,13.09
step
talk Taenar Strongoth##213614
accept Reclaiming Velhan's Claim##78694 |goto Hallowfall/0 45.74,13.09
stickystart "Slay_Kobyss_Attackers"
step
杀死周围的敌人
click Kobyss Spear+
collect 8 Kobyss Spear##211948 |q 78693/1 |goto Hallowfall/0 45.55,13.03
'|kill Murkfin Sciomancer##213619, Murkfin Ravager##213621, Murkfin Depthstalker##213622
step
label "Slay_Kobyss_Attackers"
杀死周围的敌人 |notinsticky
杀死 #12# Kobyss 攻击者 |q 78694/1 |goto Hallowfall/0 46.30,14.86
'|kill Murkfin Sciomancer##213619, Murkfin Ravager##213621, Bristlespine##213717, Droopfin##213716, Sharpfang##213718, Murkfin Depthstalker##213622
step
talk Taenar Strongoth##213614
turnin Reclaiming Velhan's Claim##78694 |goto Hallowfall/0 45.74,13.09
step
talk Aemyra Acton##213613
turnin Spears for Fears##78693 |goto Hallowfall/0 45.79,13.09
accept Teach a Man to Fish##78692 |goto Hallowfall/0 45.79,13.09
step
talk Velhanite Citizen##215667+
|tip 建筑内部，多层。
告诉他们_“这是保卫维尔汉领地的长矛”_ |gossip 120328
分发 #8# 长矛 |q 78692/1 |goto Hallowfall/0 45.74,12.72
'|talk Velhanite Citizen##215666
step
talk Aemyra Acton##213613
|tip 大楼外
turnin Teach a Man to Fish##78692 |goto Hallowfall/0 45.79,13.09
step
talk Duke Velhan##213787
accept The One That Got Away##78691 |goto Hallowfall/0 45.76,13.02
step
talk Taenar Strongoth##213614
accept Crash Recovery##78687 |goto Hallowfall/0 45.74,13.09
stickystart "Collect_Recovered_Tinderboxes"
step
kill Boneseer Hookjaw##213805
|tip 他在这附近走动。
打败侏儒钩爪 |q 78691/1 |goto Hallowfall/0 49.83,16.75
step
帮助马克西米利安 |q 78691/2 |goto Hallowfall/0 49.84,16.59
|tip 在破船下面。
'|clicknpc Maximillian Velhan##213836
step
label "Collect_Recovered_Tinderboxes"
kill Indominatable Stalwart##215577+
collect 4 Recovered Tinderbox##212317 |q 78687/1 |goto Hallowfall/0 50.30,17.07
step
talk Duke Velhan##213787
turnin The One That Got Away##78691 |goto Hallowfall/0 45.76,13.02
step
talk Taenar Strongoth##213614
turnin Crash Recovery##78687 |goto Hallowfall/0 45.74,13.09
accept Lamp Lit##78695 |goto Hallowfall/0 45.74,13.09
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 46.28,12.64 |count 1
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 46.34,13.22 |count 2
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 46.09,13.54 |count 3
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 45.84,13.57 |count 4
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 45.54,13.92 |count 5
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 45.22,13.94 |count 6
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 45.03,13.70 |count 7
step
click Arathi Torch
放置火把 |q 78695/1 |goto Hallowfall/0 44.94,13.25 |count 8
step
talk Taenar Strongoth##213614
|tip 进入塔楼，在一楼。
告诉他_“让我们点燃圣火”_ |gossip 120324
在黎明塔与泰纳尔对话 |q 78695/2 |goto Hallowfall/0 45.95,10.55
step
观看对话
|tip 进入塔楼，在一楼。
点燃黎明塔 |q 78695/3 |goto Hallowfall/0 45.95,10.55
step
talk Duke Velhan##213787
|tip 进入塔楼，在一楼。
turnin Lamp Lit##78695 |goto Hallowfall/0 45.87,10.46
step
talk Anduin Wrynn##214377
turnin Tricks of the Dark##78929 |goto 53.91,30.78
turnin Fickle Fiendish Fish##78932 |goto 53.91,30.78
step
talk Faerin##214378
accept Blades of the Arathi##78934 |goto 53.93,30.74
step
talk General Steelstrike##214376
accept Something's Fishy##78936 |goto 55.18,32.69
step
click Torch
点燃火炬 |q 78934/1 |goto 55.16,32.72
stickystart "Rally_Arathi_Groups"
step
kill Tidelord Teethwretch##216527 |q 78936/3 |goto 56.10,34.08
step
kill The Abominable Wavecrasher##216526 |q 78936/2 |goto 54.47,33.84
step
kill Deepsludger##216536 |q 78936/1 |goto 53.32,32.65
|tip 他在这附近走动。
step
label "Rally_Arathi_Groups"
集结 #6# 阿拉提小组 |q 78934/2 |goto 54.92,33.46
|tip 它们看起来像{o}小群人类{}。
|tip 在他们旁边使用{o}集结{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
talk General Steelstrike##214376
turnin Something's Fishy##78936 |goto 55.18,32.69
step
talk Faerin##221100
turnin Blades of the Arathi##78934 |goto 55.15,32.69
step
观看对话
talk Faerin##221100
accept Shadow upon Shadow##78937 |goto 55.15,32.69
step
talk Faerin Lothar##214407
选择 _“<与法瑞恩和安度因一起靠近塔楼>”_ |gossip 121725
在塔楼眺望处找到法瑞恩 |q 78937/1 |goto 55.20,35.03
step
观看对话
talk Alleria Windrunner##214405
turnin Shadow upon Shadow##78937 |goto 55.77,41.31
accept The Darkened Flame##78939 |goto 55.77,41.31
step
click Darkfire
|tip 进入塔楼，在一楼。
观看对话
调查黑暗之火 |q 78939/1 |goto 56.17,41.89
step
click Order of Night Polearm
在塔外寻找线索 |q 78939/2 |goto 56.30,40.64 |count 1
step
clicknpc Kelther Hearthen##221411
选择 _“<祝愿他的灵魂安息>”_ |gossip 121757
在塔外寻找线索 |q 78939/2 |goto 55.93,42.02 |count 2
step
click Order of Night Poster
在塔外寻找线索 |q 78939/2 |goto 55.38,42.02 |count 3
step
click Order of Night Journal
在塔外寻找线索 |q 78939/2 |goto 54.72,43.03 |count 4
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
选择 _“<告诉费林你学到了什么>”_ |gossip 120685
返回法林 |q 78939/3 |goto 56.28,41.97
step
观看对话
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
turnin The Darkened Flame##78939 |goto 56.22,42.01
accept Ever Deeper Shadow##78951 |goto 56.22,42.01
step
杀死周围的敌人
|tip 在洞穴里面。
杀死 #10# 暗夜教团信徒 |q 78951/1 |goto 56.22,42.81
'|kill Glooming Belligerent##216865, Glooming Skulk##216869, Glooming Disciple##216867, Glooming Darkweaver##216868
step
talk Faerin Lothar##214413
|tip 在洞穴里面。
turnin Ever Deeper Shadow##78951 |goto 55.83,40.50
accept The Final Resistance##78952 |goto 55.83,40.50
step
click Shadow Rift
|tip 在洞穴里面。
摧毁暗影裂隙 |q 78952/1 |goto 55.09,40.11
step
kill Anguishing Nightmare##214415 |q 78952/2 |goto 55.09,40.11
|tip 在洞穴里面。
step
talk Faerin Lothar##221733
|tip 在洞穴里面。
turnin The Final Resistance##78952 |goto 55.13,40.23
accept The Light at the End of the Tunnel##81690 |goto 55.13,40.23
step
观看对话
|tip 跟着{o}法琳-洛萨{ }，并在她行走时保护她。
|tip 她最终会走到这个位置的洞穴入口。
跟随法林 |q 81690/1 |goto 56.50,42.58
'|clicknpc Faerin Lothar##221736
step
talk Alleria Windrunner##214405
|tip 她跑到这个位置。
turnin The Light at the End of the Tunnel##81690 |goto 55.72,43.36
step
talk Faerin Lothar##221733
accept Restore the Flame##78954 |goto 55.78,43.43
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
告诉她_“我准备好了”_ |gossip 120602
让黎明塔重现光明 |q 78954/1 |goto 56.22,42.01
step
talk Faerin Lothar##214404
|tip 进入塔楼，在一楼。
turnin Restore the Flame##78954 |goto 56.22,42.01
accept To Mereldar##78607 |goto 56.22,42.01
step
talk Rubaen Hillhelm##206537
fpath Hillhelm Family Farm |goto 61.34,30.99
step
click Egg Basket##430581
accept Eggs in One Basket##80382 |goto Hallowfall/0 60.79,27.88
|only if level >= 80
step
click Hillhelm Egg##430601+
|tip 它们看起来像{o}小鸡蛋{}。
collect 10 Hillhelm Egg##217396 |q 80382/1 |goto Hallowfall/0 60.89,27.92
|only if level >= 80
step
talk Aliya Hillhelm##206528
turnin Eggs in One Basket##80382 |goto Hallowfall/0 61.18,30.50
|only if level >= 80
step
talk Keyrra Flamestonge##215527
accept Broken Bracelet##80681 |goto Hallowfall/0 65.45,32.23 |instant
|only if completedq(80678)
step
talk Dolena##224741
turnin Hungry in Hollow##84392 |goto Hallowfall/0 69.95,32.57
accept Something Earthy##82843 |goto Hallowfall/0 69.95,32.57
step
clicknpc Cave Taro##224757
收获一个芋头 |q 82843/1 |goto Hallowfall/0 69.09,34.08
step
talk Dolena##224741
turnin Something Earthy##82843 |goto Hallowfall/0 69.95,32.57
accept Something Not Ruined##82844 |goto Hallowfall/0 69.95,32.57
step
clicknpc Cave Taro##224757
|tip {o}点击它后，远离它{}。
正确收获一个芋头 |q 82844/1 |goto Hallowfall/0 69.26,34.14
step
clicknpc Cave Taro##224757+
|tip {点击它们之后就跑开
收获 #6# 芋头 |q 82844/2 |goto Hallowfall/0 69.26,34.14
step
talk Dolena##224741
turnin Something Not Ruined##82844 |goto Hallowfall/0 69.94,32.57
accept Enough Garlic##82847 |goto Hallowfall/0 69.94,32.57
step
click Secret Garlic
收集大蒜 |q 82847/1 |goto Hallowfall/0 70.45,28.09
step
click Secret Garlic+
收集 #6# 更多大蒜 |q 82847/2 |goto Hallowfall/0 70.45,28.09
step
talk Dolena##224741
turnin Enough Garlic##82847 |goto Hallowfall/0 69.94,32.58
accept Sous##82848 |goto Hallowfall/0 69.94,32.58
step
帮助厨师准备饭菜 |q 82848/1 |goto Hallowfall/0 69.97,32.55
|tip 使用行动条上的能力。
|tip 使用它们的顺序{o}并不重要。
step
talk Dolena##224741
turnin Sous##82848 |goto Hallowfall/0 69.92,32.57
step
talk Orren Masyn##224379
turnin The Sword is Mightier##82479 |goto Hallowfall/0 46.58,59.77
accept Job Killing Robot Or...##82480 |goto Hallowfall/0 46.58,59.77
step
kill ELIZA##224060
|tip 它在这片区域四处走动。
拦住 ELIZA |q 82480/1 |goto Hallowfall/0 45.80,57.35
step
talk Orren Masyn##224380
|tip 建筑内部
告诉他_“这是艾米拉给你的”_ |gossip 122601
传达艾米拉的信息 |q 82480/2 |goto Hallowfall/0 49.38,62.09
step
talk Orren Masyn##224380
|tip 建筑内部
turnin Job Killing Robot Or...##82480 |goto Hallowfall/0 49.38,62.09
step
talk Faerin Lothar##214364
turnin To Mereldar##78607 |goto Hallowfall/0 43.45,48.58
step
talk General Steelstrike##213108
accept The Bastion of Hallowfall##78613 |goto Hallowfall/0 43.42,48.63
step
talk General Steelstrike##215335
|tip 建筑内部
accept The Price of Hope##82894 |goto Hallowfall/0 40.51,50.75
step
到医务室去见将军 |q 82894/1 |goto Hallowfall/0 43.07,51.78
step
click Medical Supplies
|tip 建筑内部
取回绷带 |q 82894/3 |goto Hallowfall/0 43.27,51.79
step
clicknpc Injured Soldier##220225+
|tip 建筑内部
治疗一名受伤士兵 |q 82894/2 |goto Hallowfall/0 43.19,51.77
'|clicknpc Injured Soldier##215678, Injured Soldier##215677, Injured Soldier##213306
step
talk General Steelstrike##218289
|tip 建筑内部
turnin The Price of Hope##82894 |goto Hallowfall/0 43.19,51.77
step
talk Auralia Steelstrike##213145
|tip 进入帐篷。
accept Economical Request##82216 |goto Hallowfall/0 41.27,53.05
step
talk Auralia Steelstrike##213145
|tip 进入帐篷。
告诉她_"我可以联系我的人民的贸易代表。 |gossip 122432
建议其他贸易伙伴 |q 82216/1 |goto Hallowfall/0 41.27,53.05
step
click Letter of Recommendation
|tip 进入帐篷。
选择_“前往梅里克斯，议会议长”_ |gossip 122416
选择_“一个四面八方都被黑暗中的怪物包围的民族”_ |gossip 122431
选择 _“他们希望与贵国人民重开贸易。”_ |gossip 122427
选择 _“{_G.UnitName(”玩家“)}.”_ |gossip 122423
写一封推荐信 |q 82216/2 |goto Hallowfall/0 41.24,53.12
step
talk Auralia Steelstrike##213145
|tip 进入帐篷。
turnin Economical Request##82216 |goto Hallowfall/0 41.27,53.05
accept A Batty Request##82213 |goto Hallowfall/0 41.27,53.05
accept Does Anyone Like Wasps?##82214 |goto Hallowfall/0 41.27,53.05
accept Regular Fiber##82215 |goto Hallowfall/0 41.27,53.05
step
talk Alyza Bowblaze##215237
|tip 建筑内部
accept An Orphan's Request##79151 |goto Hallowfall/0 41.76,55.61
step
在帝国边缘旅店与费林、安度因和阿莱利亚会面 |q 78613/1 |goto Hallowfall/0 42.72,55.70
|tip 建筑内部
step
talk Nalina Ironsong##217642
|tip 建筑内部
选择 _“购买一轮酒水。”_ |gossip 122686
buy A Round of Drinks##217708 |q 78613/2 |goto Hallowfall/0 42.81,55.83
step
click Drink+
|tip 建筑内部
分发 #4# 饮料 |q 78613/3 |goto Hallowfall/0 42.72,55.65
step
talk Faerin Lothar##220124
|tip 建筑内部
turnin The Bastion of Hallowfall##78613 |goto 42.75,55.63
step
talk Alleria Windrunner##218182
|tip 建筑内部
accept Nightwatch##79297 |goto 42.75,55.67
step
click Order of Night Propaganda+
|tip 这些东西看起来像是{o}卷起来的卷轴{}和{o}钉在物体上的纸片{}。
collect 8 Order of Night Propaganda##217990 |q 79297/1 |goto 43.46,56.60
step
在军营里见到钢钉将军 |q 79297/4 |goto 41.26,52.98
|tip 进入帐篷。
step
talk General Steelstrike##213108
|tip 进入帐篷。
turnin Nightwatch##79297 |goto 41.26,52.98
accept Spar Day##78626 |goto 41.26,52.98
step
talk Arathi Reserve##215727
告诉他们_“你们的将军让我和你们比试一下。”_ |gossip 120333
|tip 他们会攻击你。
决斗 #8# 阿拉提新兵 |q 78626/1 |goto 41.83,52.24
'|talk Arathi Reserve##214429
step
talk General Steelstrike##213108
|tip 进入帐篷。
turnin Spar Day##78626 |goto 41.26,52.98
accept Mereldar's Light##78614 |goto 41.26,52.98
step
clicknpc Arathi Orphan##218456+
|tip 它们看起来像{o}两个跑在一起的孩子{}。
与孤儿们玩耍 |q 78614/1 |goto Hallowfall/0 41.85,55.10 |count 1
step
talk Arathi Orphan##223365
告诉他_"我会玩。 |gossip 122367
开始与孤儿玩耍 |havebuff Scary Monster##448382 |goto 42.02,55.43 |q 78614
step
与孤儿们玩耍 |q 78614/1 |goto 42.00,55.40 |count 2
|tip 使用行动条上的能力。
|tip 使用能力{o}直到他们杀死你{}。
step
talk Arathi Orphan##218493
开始与孤儿玩耍 |invehicle |goto 41.90,55.53 |q 78614
step
与孤儿们玩耍 |q 78614/1 |goto 42.00,55.40 |count 3
|tip 使用行动条上的能力。
|tip 瞄准附近的{o}红白目标{}。
step
talk Faerin Lothar##220124
|tip 建筑内部
turnin Mereldar's Light##78614 |goto 41.68,55.51
step
观看对话
|tip 建筑内部
talk Faerin Lothar##220124
accept The Bell Tolls##78615 |goto 41.68,55.51
step
click Arathi Chest
|tip 坍塌的小楼里
collect "Much Loved" Teddy Bear##216604 |q 79151/1 |goto Hallowfall/0 52.31,50.20
step
talk Alyza Bowblaze##218062
告诉她_"无论你接下来做什么，我都会帮你。 |gossip 120791
与 Alyza 交谈 |q 79151/2 |goto Hallowfall/0 52.42,50.19
step
talk Alyza Bowblaze##218062
turnin An Orphan's Request##79151 |goto Hallowfall/0 52.42,50.19
accept Gutting the Pool##79152 |goto Hallowfall/0 52.42,50.19
accept A Bloody Inheritance##83182 |goto Hallowfall/0 52.42,50.19
stickystart "Slay_Kobyss"
step
click Kobyss Chest
收集父母效应 |q 83182/1 |goto Hallowfall/0 50.95,47.72 |count 1
step
click Kobyss Chest
收集父母效应 |q 83182/1 |goto Hallowfall/0 49.72,48.21 |count 2
step
click Kobyss Chest
收集父母效应 |q 83182/1 |goto Hallowfall/0 48.79,50.46 |count 3
step
click Kobyss Chest
收集父母效应 |q 83182/1 |goto Hallowfall/0 50.04,53.07 |count 4
step
_Next to you:_
talk Alyza Bowblaze##215254
turnin A Bloody Inheritance##83182
step
label "Slay_Kobyss"
杀死周围的敌人
|tip 巨洞周围的{o}水域里。
杀死 #10# Kobyss |q 79152/1 |goto Hallowfall/0 50.48,50.27
'|kill Hungering Necromage##215239, Hungering Slicer##215242, Hungering Shimmerfin##215243
step
_Next to you:_
talk Alyza Bowblaze##215254
turnin Gutting the Pool##79152
accept Vae Victis##79153
step
kill Sharpscale the Devourer##215252
collect Sharpscale's Head##217175 |q 79153/1 |goto Hallowfall/0 48.74,53.89
step
_Next to you:_
talk Alyza Bowblaze##215254
turnin Vae Victis##79153
accept A Final Goodbye##79154
step
click Parents Personal Effects
|tip 悬崖上
烧毁效果 |q 79154/1 |goto Hallowfall/0 52.02,50.33
stickystart "Collect_Shacklefang_Leafnose_Meat"
stickystart "Kill_Shacklefang_Hornets"
step
click Tough Ivy##444010+
|tip 它们看起来像挂在岩石边上的{o}植物。
collect 5 Tough Ivy Fiber##222925 |q 82215/1 |goto Hallowfall/0 60.98,47.81
step
label "Collect_Shacklefang_Leafnose_Meat"
kill Shacklefang Leafnose##223167+
collect 8 Shacklefang Leafnose Meat##222920 |q 82213/1 |goto Hallowfall/0 60.98,47.81
step
label "Kill_Shacklefang_Hornets"
kill 10 Shacklefang Hornet##223178 |q 82214/1 |goto Hallowfall/0 60.98,47.81
step
talk Auralia Steelstrike##223267
turnin A Batty Request##82213 |goto Hallowfall/0 68.41,44.57
turnin Does Anyone Like Wasps?##82214 |goto Hallowfall/0 68.41,44.57
turnin Regular Fiber##82215 |goto Hallowfall/0 68.41,44.57
step
talk General Steelstrike##225711
accept Underground Economics##82217 |goto Hallowfall/0 68.41,44.63
step
click Arathi Chest
收集阿拉提贸易物品 |q 82217/1 |goto Hallowfall/0 68.39,44.71 |count 1
step
click Arathi Chest
收集阿拉提贸易物品 |q 82217/1 |goto Hallowfall/0 68.39,44.62 |count 2
step
click Arathi Crate Stacked
收集阿拉提贸易物品 |q 82217/1 |goto Hallowfall/0 68.39,44.53 |count 3
step
click Flame Touched Steel Weaponry
展示阿拉提贸易物品 |q 82217/2 |goto Hallowfall/0 68.44,44.51 |count 1
step
click Tough Ivy Fiber Rope
展示阿拉提贸易物品 |q 82217/2 |goto Hallowfall/0 68.42,44.67 |count 2
step
click Spices
展示阿拉提贸易物品 |q 82217/2 |goto Hallowfall/0 68.43,44.74 |count 3
step
talk Andee Seabraid##223193
告诉她_"（联盟）我为阿拉提人担保。我们应该与他们开展贸易。"_ |gossip 122456 |only if Alliance
问她_"要怎样才能说服你与阿拉提人开展贸易？ |gossip 122455 |only if Horde
告诉她_"他们正在为生存而挣扎。有了额外的资源，他们就能茁壮成长。到那时，你会得到优惠的价格。 |gossip 122454 |only if Horde
说服 Andee Seabraid 与阿拉提人贸易 |q 82217/3 |goto Hallowfall/0 68.48,44.68
step
talk Teha##223194
问她_"要怎样才能说服你与阿拉提人开展贸易？ |gossip 122461 |only if Alliance
告诉她_"他们正在为生存而挣扎。有了额外的资源，他们就能茁壮成长。到那时，你会得到优惠的价格。 |gossip 122465 |only if Alliance
告诉她_"（部落）我为阿拉提人担保。我们应该与他们开展贸易。"_ |gossip 122462 |only if Horde
说服 Teha 与阿拉提人贸易 |q 82217/4 |goto Hallowfall/0 68.48,44.55
step
talk General Steelstrike##225711
turnin Underground Economics##82217 |goto Hallowfall/0 68.41,44.63
step
talk Alyza Bowblaze##219368
|tip 在建筑的门口。
turnin A Final Goodbye##79154 |goto Hallowfall/0 41.82,55.40
step
前往梅雷达尔之门 |q 78615/1 |goto 41.06,54.71
step
talk Faerin Lothar##213107
turnin The Bell Tolls##78615 |goto 41.06,54.71
step
talk General Steelstrike##213108
accept Crossroads of Twilight##78620 |goto 41.06,54.76
step
talk Alleria Windrunner##214402
accept The Shadow Rising##78621 |goto 41.05,54.67
stickystart "Slay_Kobyss_Attackers_78620"
step
kill Lighteater##216036 |q 78621/3 |goto 35.09,52.37
step
kill Old Grim##213403 |q 78621/1 |goto 34.87,54.64
step
kill Heartfang##216035 |q 78621/2 |goto 35.04,56.85
step
label "Slay_Kobyss_Attackers_78620"
杀死周围的敌人
杀死 #15# Kobyss 攻击者 |q 78620/1 |goto 35.38,54.75
'|kill Ragefin Carver##215652, Ragefin Executioner##213408, Ragefin Necromancer##213406, Darkwater Tidecrusher##220621, Ragefin Shadowcaster##213405
step
talk Alleria Windrunner##214402
turnin The Shadow Rising##78621 |goto 34.07,54.74
step
talk General Steelstrike##213108
turnin Crossroads of Twilight##78620 |goto 34.07,54.68
accept A Candle in the Dark##78624 |goto 34.07,54.68
step
talk Alleria Windrunner##214402
告诉她_“把气泡放下来”_ |gossip 121810
观看对话
让 Alleria 放出虚空泡泡 |q 78624/1 |goto 34.07,54.74
step
kill Aelric Leid##213208 |q 78624/2 |goto 33.40,54.60
step
talk General Steelstrike##225188
turnin A Candle in the Dark##78624 |goto 33.62,54.63
accept Consecrated Cleanup##79089 |goto 33.62,54.63
step
talk Faerin Lothar##213107
accept The Flame Still Burns##80049 |goto 33.59,54.80
stickystart "Clear_The_Veneration_Grounds"
step
talk Arathi Stalwart##225226
告诉他_“只有死掉的哥比斯才是好哥比斯”_ |gossip 122722
与阿拉提幸存者对话 |q 80049/1 |goto 35.32,55.81 |count 1
step
talk Arathi Stalwart##225226
告诉他 你别无选择 |gossip 122719
与阿拉提幸存者对话 |q 80049/1 |goto 36.01,56.01 |count 2
step
talk Arathi Stalwart##225226
告诉他 "你做得很好” |gossip 122712
与阿拉提幸存者对话 |q 80049/1 |goto 36.95,54.79 |count 3
step
talk Arathi Stalwart##225226
告诉他阿拉提人是幸存者 你们会挺过来的 |gossip 122713
与阿拉提幸存者对话 |q 80049/1 |goto 35.73,54.05 |count 4
step
talk Arathi Stalwart##225226
告诉他 "你为保护你爱的人而战斗” |gossip 122717
与阿拉提幸存者对话 |q 80049/1 |goto 35.39,52.72 |count 5
step
label "Clear_The_Veneration_Grounds"
click Kobyss Spear+
|tip 它们看起来像插在地面和物体上的{o}柱子{}。
click Memorial Plant+
|tip 它们看起来像被打翻的{o}各种花盆和花瓶{}。
清理祭拜场 |q 79089/1 |goto 35.22,54.63
step
talk General Steelstrike##225188
turnin Consecrated Cleanup##79089 |goto 33.62,54.64
turnin The Flame Still Burns##80049 |goto 33.62,54.64
step
观看对话
talk General Steelstrike##225188
accept The Final Front##78627 |goto 33.62,54.64
step
talk 'Red' Fearon##218304
fpath Light's Redoubt |goto 40.46,71.31
step
前往光之堡 |q 78627/1 |goto 38.97,71.61
|tip 飞艇甲板上
step
talk General Steelstrike##213108
|tip 飞艇甲板上
turnin The Final Front##78627 |goto 38.97,71.61
accept Trapdoor Sprung##78628 |goto 38.97,71.61
step
talk Faerin Lothar##213107
|tip 飞艇甲板上
accept Running on Reserves##78629 |goto 38.95,71.59
stickystart "Slay_Nerubians"
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 39.06,81.32 |count 1
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 38.86,83.12 |count 2
step
talk Arathi Reserve##213286
|tip 塔楼门洞内。
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 38.06,82.70 |count 3
step
talk Arathi Reserve##213286
|tip 建筑内部
告诉她_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 37.47,81.90 |count 4
step
talk Arathi Reserve##213286
|tip 大楼门口
告诉他_“我会为你争取时间”_ |gossip 120658
|tip 你会受到攻击。
营救后备军人 |q 78629/1 |goto 36.88,81.00 |count 5
step
label "Slay_Nerubians"
杀死周围的敌人
杀死 #15# 奈鲁伯人 |q 78628/1 |goto 38.63,80.28
'|kill Kaheti Swarmer##213398, Kaheti Ravager##213395, Kaheti Ambusher##217448, Kaheti Fighter##217362, Kaheti Shadeweaver##213396
step
talk Faerin Lothar##213107
|tip 平台上
turnin Trapdoor Sprung##78628 |goto 38.78,81.52
turnin Running on Reserves##78629 |goto 38.78,81.52
accept The Rise of the Reckoning##78630 |goto 38.78,81.52
step
click Rope Ladder
登上讨伐号 |q 78630/1 |goto 38.87,81.58
step
_As Your Fly:_
杀死周围的敌人
|tip 当你飞行时，它们就在地面上。
|tip 使用行动条上的能力。
击毙150名努比亚人 |q 78630/2
step
观看对话
到达阿兹-卡赫特 |complete zone("Azj-Kahet") |q 78630
step
talk Faerin##211699
turnin The Rise of the Reckoning##78630 |goto Azj-Kahet/0 29.39,42.20
step
解锁世界任务 |complete completedq(79197)
|tip 使用{o}“内部战争 ”指南来完成这个任务。
|tip 这是{o}解锁其他支线任务{}的必要条件。
|only if level >= 80
step
talk Auralia Steelstrike##213145
accept The Light's Call##81990 |goto Hallowfall/0 42.35,55.00
|only if level >= 80
step
talk Aliya Hillhelm##206528
accept Keep the Home Fires Burning##76247 |goto Hallowfall/0 61.18,30.50
accept Seeds of Evil##79108 |goto Hallowfall/0 61.18,30.50
|only if level >= 80
stickystart "Collect_Corrupted_Shadowleaf_Seeds"
step
click Hillhelm Remnant Supply##409464+
|tip 它们看起来像{o}木箱{}。
collect 5 Hillhelm Remnant Supply##209854 |q 76247/1 |goto Hallowfall/0 61.33,28.27
|only if level >= 80
step
label "Collect_Corrupted_Shadowleaf_Seeds"
杀死周围的敌人
collect 16 Corrupted Shadowleaf Seed##212153 |q 79108/1 |goto Hallowfall/0 61.29,28.55
'|kill Giant Shadowbloom##210950, Shadowleaf Seedling##210951, Invasive Shadowblossom##214923
|only if level >= 80
step
click Hillhelm Keyflame
|tip 点击{o}多次{}。
使用 #5# 希尔赫姆残骸增强钥匙火焰的威力 |q 76247/2 |goto Hallowfall/0 61.01,28.80
|only if level >= 80
step
talk Aliya Hillhelm##206528
turnin Keep the Home Fires Burning##76247 |goto Hallowfall/0 61.18,30.50
turnin Seeds of Evil##79108 |goto Hallowfall/0 61.18,30.50
accept A Flickering of Hope##50690 |goto Hallowfall/0 61.18,30.50
accept Follow Miral##79109 |goto Hallowfall/0 61.18,30.50
|only if level >= 80
step
click Tomothy's Hoe
检查锄头 |q 79109/1 |goto Hallowfall/0 60.75,25.14
|only if level >= 80
step
click Tomothy's Bag
检查袋子 |q 79109/2 |goto Hallowfall/0 60.12,24.27
|only if level >= 80
step
click Tomothy's Lamp
检查灯 |q 79109/3 |goto Hallowfall/0 60.29,22.84
|only if level >= 80
step
clicknpc Miral Murder-Mittens##215041
turnin Follow Miral##79109 |goto Hallowfall/0 60.29,21.15
accept Save Tomothy##79110 |goto Hallowfall/0 60.29,21.15
|only if level >= 80
step
kill The Grasping Darkness##215064 |q 79110/1 |goto Hallowfall/0 60.16,20.59
|tip 建筑内部
|only if level >= 80
step
talk Aliya Hillhelm##206528
turnin Save Tomothy##79110 |goto Hallowfall/0 61.18,30.50
|only if level >= 80
step
talk Keyrra Flamestonge##215527
turnin A Flickering of Hope##50690 |goto Hallowfall/0 65.45,32.23
turnin The Light's Call##81990 |goto Hallowfall/0 65.45,32.23
accept Those Who Fell##79232 |goto Hallowfall/0 65.45,32.23
|only if level >= 80
step
kill Invasive Lashroom##206194+
collect Idona Seerstone's Tinderbox##219453 |q 79232/3 |goto Hallowfall/0 63.78,32.53
|only if level >= 80
step
kill Skulldunk##221310
collect Oskaer Daleclash's Tinderbox##219451 |q 79232/1 |goto Hallowfall/0 57.88,22.92
|only if level >= 80
step
click Dalian Ironlink's Tinderbox##439789
collect Dalian Ironlink's Tinderbox##219499 |q 79232/2 |goto Hallowfall/0 66.98,20.89
|only if level >= 80
step
talk Keyrra Flamestonge##215527
turnin Those Who Fell##79232 |goto Hallowfall/0 65.45,32.23
accept Honor Your Efforts##81673 |goto Hallowfall/0 65.45,32.23
|only if level >= 80
step
talk Keyrra Flamestonge##215527
告诉她_"我接受这份荣誉。 |gossip 121756
与凯尔拉对话 |q 81673/1 |goto Hallowfall/0 65.45,32.23
|only if level >= 80
step
观看对话
talk Keyrra Flamestonge##215527
turnin Honor Your Efforts##81673 |goto Hallowfall/0 65.45,32.23
|only if level >= 80
step
talk Auralia Steelstrike##213145
|tip 这些任务可能有{o}时间限制{}。
|tip 如果没有，请在{o}服务器每周重置{}后{o}再次检查{}。
accept Spice Up Your Life##82219 |goto Hallowfall/0 42.35,55.00
accept Eagle Eye, Eagle Die##82220 |goto Hallowfall/0 42.35,55.00
|only if level >= 80
stickystart "Collect_Light_Bathed_Lotus_Cuttings"
step
clicknpc Light-Bathed Eagle##223191+
|tip 它们看起来像{o}在空中飞翔的鸟儿{}。
|tip 它们会{o}飞下来{}攻击你。
kill Light-Bathed Eagle##223191+
collect 5 Eagle Fillet##222951 |q 82220/1 |goto Hallowfall/0 26.23,55.95
|only if level >= 80
step
label "Collect_Light_Bathed_Lotus_Cuttings"
click Light-Bathed Lotus##444030+
|tip 它们看起来像{o}开着黄色大花的高大植物{}。
collect 7 Light-Bathed Lotus Cuttings##222953 |q 82219/1 |goto Hallowfall/0 25.89,56.21
|only if level >= 80
step
talk Auralia Steelstrike##223267
|tip 建筑内部
turnin Spice Up Your Life##82219 |goto Hallowfall/0 44.53,50.82
turnin Eagle Eye, Eagle Die##82220 |goto Hallowfall/0 44.53,50.82
accept Full Dress##82221 |goto Hallowfall/0 44.53,50.82
|only if level >= 80
step
click Incense
|tip 建筑内部
装饰房子 |q 82221/1 |goto Hallowfall/0 44.56,50.81 |count 20
|only if level >= 80
step
click Magnifying Glass
|tip 建筑内部
装饰房子 |q 82221/1 |goto Hallowfall/0 44.60,50.70 |count 40
|only if level >= 80
step
click Military Banner
|tip 建筑内部
装饰房子 |q 82221/1 |goto Hallowfall/0 44.54,50.59 |count 60
|only if level >= 80
step
click Tinderbox
|tip 建筑内部
装饰房子 |q 82221/1 |goto Hallowfall/0 44.69,50.79 |count 80
|only if level >= 80
step
click Lamplighter Banner
|tip 建筑内部
装饰房子 |q 82221/1 |goto Hallowfall/0 44.68,51.05 |count 100
|only if level >= 80
step
talk Auralia Steelstrike##223267
|tip 建筑内部
turnin Full Dress##82221 |goto Hallowfall/0 44.53,50.82
|only if level >= 80
step
talk General Steelstrike##223268
|tip 建筑内部
accept Cooking With Style##82222 |goto Hallowfall/0 44.58,50.68
|only if level >= 80
step
在灶房加入钢铁罢工队 |q 82222/1 |goto Hallowfall/0 43.93,49.73
|tip 建筑内部
|only if level >= 80
step
click Cheese for Throwing
|tip 建筑内部
把奶酪扔进锅里 |q 82222/3 |goto Hallowfall/0 43.86,49.67
|only if level >= 80
step
click Carrots for Chopping
|tip 建筑内部
切蔬菜 |q 82222/2 |goto Hallowfall/0 43.93,49.62
|only if level >= 80
step
click Water
|tip 瞄准附近的{o}煮锅{}。
|tip 使用行动条上的能力。
|tip 建筑内部
向锅里泼水 |q 82222/4 |goto Hallowfall/0 44.05,49.76
|only if level >= 80
step
talk General Steelstrike##224154
|tip 建筑内部
告诉她 _“我不认为这是办法”_____________________________。 |gossip 122519
与钢条将军对话，开始烹饪 |q 82222/5 |goto Hallowfall/0 43.95,49.66
|only if level >= 80
step
观看对话
|tip 如果你不愿意，除了等待，你{o}什么都不用做{}。
|tip 如果你想参加，{o}当钢条将军告诉你时，{o}点击附近的物体{}。
|tip 建筑内部
烹饪！ |q 82222/6 |goto Hallowfall/0 43.92,49.76
|only if level >= 80
step
clicknpc Cooking Pot##224237
|tip 建筑内部
选择_“足够好！”_ |gossip 122559
品尝炖菜 |q 82222/7 |goto Hallowfall/0 43.97,49.68
|only if level >= 80
step
talk General Steelstrike##224154
|tip 建筑内部
turnin Cooking With Style##82222 |goto Hallowfall/0 43.95,49.66
accept A Home Cooked Meal##82223 |goto Hallowfall/0 43.95,49.66
|only if level >= 80
step
click Chair
|tip 建筑内部
在钢条餐桌旁就座 |q 82223/1 |goto Hallowfall/0 44.61,50.72
|only if level >= 80
step
click Your Stew
|tip 在你面前，{o}在桌子上{}。
|tip 建筑内部
选择 _“吃炖肉”__。 |gossip 122754
吃炖肉 |q 82223/2 |goto Hallowfall/0 44.61,50.72
|only if level >= 80
step
talk Vaelisia Steelstrike##225745
|tip 建筑内部
与薇莉西亚-钢之罢工交谈 |q 82223/6 |goto Hallowfall/0 44.58,50.68
|only if level >= 80
step
talk Vaelisia Steelstrike##225745
|tip 建筑内部
turnin A Home Cooked Meal##82223 |goto Hallowfall/0 44.58,50.68
|only if level >= 80
step
talk Maera Ashyld##220718
|tip 这个任务可能有{o}时间限制{}。
|tip 如果没有，请在服务器每周重置后{o}再次查看{}。
accept Time Found##82810 |goto Hallowfall/0 60.49,60.21
step
杀死周围的敌人
click Sludge Pile+
|tip 它们看起来就像{o}小垃圾堆{}。
收集 #6# 纪念品 |q 82810/1 |goto Hallowfall/0 60.39,61.79
'|kill Sludgeborn Shambler##220734, Mirehat Fungalmancer##221362, Mirehat Sporedancer##221363, Cultivated Mireshroom##221366
|only if level >= 80
step
talk Maera Ashyld##220718
turnin Time Found##82810 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
step
talk Auralia Steelstrike##213145
accept Dented Spearhead##82846 |goto Hallowfall/0 42.35,55.00 |instant
|only if level >= 80
step
talk Kiera Horth##217813
|tip 建筑内部
accept Filigreed Cleric##82849 |goto Hallowfall/0 43.97,49.71 |instant
|only if level >= 80
step
talk Haverd Sunhart##226051
|tip 平台上
accept Ivory Tinderbox##82845 |goto Hallowfall/0 41.64,34.76 |instant
|only if level >= 80
step
talk Maera Ashyld##220718
|tip 这个任务可能有{o}时间限制{}。
|tip 如果没有，请在服务器每周重置后{o}再次查看{}。
accept Time Borrowed##82813 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
step
杀死周围的敌人
click Sludge Pile+
|tip 它们看起来就像{o}小垃圾堆{}。
收集 #6# 纪念品 |q 82813/1 |goto Hallowfall/0 60.39,61.79
'|kill Sludgeborn Shambler##220734, Mirehat Fungalmancer##221362, Mirehat Sporedancer##221363, Cultivated Mireshroom##221366
|only if level >= 80
step
talk Maera Ashyld##220718
turnin Time Borrowed##82813 |goto Hallowfall/0 60.49,60.21
|only if level >= 80
step
talk Barahl Lynflayme##217609
|tip 建筑内部
accept Wooden Figure##82832 |goto Hallowfall/0 69.25,43.83 |instant
|only if level >= 80
step
talk Lorel Ironglen##222813
accept Calcified Journal##82835 |goto Hallowfall/0 48.42,38.89 |instant
|only if level >= 80
step
talk Amy Lychenstone##220859
|tip 建筑内部
accept Sturdy Locket##82815 |goto Hallowfall/0 43.19,49.79 |instant
同时查看 [Hallowfall/0 42.07,49.39] 附近的情况
|only if level >= 80
step
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Intro & Isle of Dorn (Full Zone)"	|only if achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559)
|next "Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Azj-Kahet (Full Zone)"		|only if not (achieved(20118) and achieved(19560) and achieved(20598) and achieved(19559))
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Azj-Kahet (Full Zone)",{
author="support@zygorguides.com",
},[[
step
_NOTE:_
某些支线任务需要玩家达到 80 级
|tip 本指南包含{o}需要80级才能完成的{o}支线任务{}。
|tip 由于你还未达到80级，所以{o}不会显示这些任务{}。
|tip 一旦你{o}达到80级{}，要完成这些任务，{o}重新加载本指南，然后从头开始{}。
点击此处继续 |confirm
|only if level < 80
step
把洞穴带到阿兹-卡赫特 |complete zone("Azj-Kahet") |goto Dornogal/0 63.61,52.55 |q 83552
|tip 走进{o}旋转入口{}。
|only if haveq(83552) or completedq(83552)
step
talk Faerin##211699
|tip 飞船上
turnin Azj-Kahet##83552 |goto Azj-Kahet/0 29.39,42.20 |only if haveq(83552) or completedq(83552)
accept Heroes Never Die##78350 |goto Azj-Kahet/0 29.39,42.20
step
talk Alleria Windrunner##211752
|tip 飞船上
accept Chasing the Light##78384 |goto Azj-Kahet/0 29.35,42.64
step
talk Kal Smoulderbrow##217133
|tip 在网桥上
accept The Second Front##79574 |goto Azj-Kahet/0 29.44,41.65
stickystart "Rescue_Wounded_Aeroknights"
step
click Airship Rubble##411102
|tip 你可能会遭到攻击。
collect Crumpled Lion Gauntlet##211774 |q 78384/1 |goto Azj-Kahet/0 29.14,44.62
step
click Flare Box
信号降落场 |q 79574/1 |goto Azj-Kahet/0 27.61,45.04
step
观看对话
talk General Steelstrike##212076
turnin The Second Front##79574 |goto Azj-Kahet/0 27.55,45.13
accept That Airspace is Mine(d)!##79579 |goto Azj-Kahet/0 27.55,45.13
accept Offensive Counter##79580 |goto Azj-Kahet/0 27.55,45.13
stickystart "Slay_Nerubian_Silk_Balloon_Mines"
stickystart "Slay_Nerubians_79580"
step
click Well-Bleached Bones##411104
|tip 你可能会遭到攻击。
collect Bleached Bones##211775 |q 78384/2 |goto Azj-Kahet/0 26.55,43.02
step
click Weathered Cloth##411106
collect Scrap of Weathered Fabric##211783 |q 78384/3 |goto Azj-Kahet/0 32.55,38.85
step
label "Slay_Nerubian_Silk_Balloon_Mines"
杀死 #5# 奈鲁比亚丝气球地雷 |q 79579/1 |goto Azj-Kahet/0 30.22,44.48
|tip {飞过{o}这个区域周围{o}漂浮着的人类{o}上方的{o}发光环{o}。
|tip 你将获得一个{o}临时 BUFF{}。
|tip 带着BUFF飞过{o}努比亚丝绸气球地雷{}。
|tip 它们看起来像{o}大型漂浮的带刺网状气球{}，与地面上的绳索相连。
'|clicknpc Arathi War Priest##219950
step
label "Rescue_Wounded_Aeroknights"
clicknpc Wounded Aeroknight##214767+
|tip 他们看起来像躺在地上的{o}人类{}。
营救 #12# 受伤的阿罗克夜人 |q 78350/1 |goto 32.69,46.17
step
label "Slay_Nerubians_79580"
杀死周围的敌人
杀死 #12# 奈鲁比人 |q 79580/1 |goto Azj-Kahet/0 28.37,39.61
'|kill Kaheti Silksinger##215711, Kaheti War-Weaver##215708, Kaheti Preysnatcher##215170, Slam Scavenger##217997, Skitterling##217991, Kaheti Preysnatcher##217845, Nerubian Abductor##211742
step
talk Alleria Windrunner##211752
turnin Chasing the Light##78384 |goto Azj-Kahet/0 32.47,47.19
step
talk Faerin##211699
turnin Heroes Never Die##78350 |goto Azj-Kahet/0 32.48,47.14
accept Friends in Low Places##78348 |goto Azj-Kahet/0 32.48,47.14
step
talk General Steelstrike##212076
turnin That Airspace is Mine(d)!##79579 |goto Azj-Kahet/0 27.55,45.13
turnin Offensive Counter##79580 |goto Azj-Kahet/0 27.55,45.13
step
跳入呼吸坑 |q 78348/1 |goto Azj-Kahet/0 33.37,55.94
|tip 飞下洞口，进入洞穴。
step
找到神秘的保护者 |q 78348/2 |goto Azj-Kahet/0 32.99,56.33
|tip 在洞穴里面。
step
talk Orweyna##215944
|tip 在洞穴里面。
turnin Friends in Low Places##78348 |goto Azj-Kahet/0 32.99,56.33
accept For Naught, So Vial##78352 |goto Azj-Kahet/0 32.99,56.33
accept Fear the Old Blood##78353 |goto Azj-Kahet/0 32.99,56.33
stickystart "Cleanse_The_Breathing_Pit"
step
click Nerubian Extractor+
|tip 他们看起来像{o}红色的球体，基座{}贴在墙壁上。
|tip {在完成任务的过程中，沿着螺旋路径往上走{}到这里。
|tip 在洞穴里面。
摧毁 #8# 奈鲁比提取器 |q 78352/1 |goto Azj-Kahet/0 35.58,58.08
step
label "Cleanse_The_Breathing_Pit"
杀死周围的敌人
|tip {完成任务后，沿着螺旋形的小路往上走。|注意
|tip 洞穴内部 |注释
清理呼吸坑 |q 78353/1 |goto Azj-Kahet/0 35.58,58.08
'|kill Horrid Effusia##211866, Blackblood Coalescence##215205
step
沿着向上的路径离开洞穴 |goto Azj-Kahet/0 35.58,58.08 < 20 |walk |only if subzone("Breathing Pit") and indoors()
观看对话
talk Orweyna##215113
turnin For Naught, So Vial##78352 |goto Azj-Kahet/0 35.74,58.19
turnin Fear the Old Blood##78353 |goto Azj-Kahet/0 35.74,58.19
accept Alone in the Dark##79139 |goto Azj-Kahet/0 35.74,58.19
step
talk Greenspeaker Na'layro##211652
accept Boom or Blight##78897 |goto Azj-Kahet/0 42.27,42.50
accept Intention vs Instinct##78898 |goto Azj-Kahet/0 42.27,42.50
stickystart "Slay_Worms_Of_The_Wormlands"
step
accept Heeeelllp!!!##78901 |goto Azj-Kahet/0 41.42,41.88
|tip 你将自动接受这个任务。
|tip 在洞穴里面。
step
clicknpc Skedgit Cinderbangs##214076
|tip 在洞穴里面。
营救斯凯吉特煤渣班 |q 78901/1 |goto Azj-Kahet/0 40.67,39.95
step
talk Skedgit Cinderbangs##214168
|tip 在洞穴里面。
turnin Heeeelllp!!!##78901 |goto Azj-Kahet/0 40.74,39.73
accept Delegated Dig##78902 |goto Azj-Kahet/0 40.74,39.73
step
进入洞穴内的地洞 |goto Azj-Kahet/0 39.94,39.96 < 15 |walk
继续下行 |goto Azj-Kahet/0 39.90,40.97 < 10 |walk
kill Wormcaller Iz'tikrine##214153
|tip 在山洞的楼下
collect Singing Stone##211412 |q 78898/1 |goto Azj-Kahet/0 38.95,42.24
step
click Sivstone Deposit##414113+
|tip 它们看起来像{o}灰色的采矿节点{}。
|tip 你可以在整个洞穴的{o}侧面小洞穴里找到它们。
collect 25 Sivstone Chunk##211415 |q 78902/1 |goto Azj-Kahet/0 39.81,38.86
step
label "Slay_Worms_Of_The_Wormlands"
杀死周围的敌人
|tip 洞穴内部 |注释
杀死 #10# 虫地的蠕虫 |q 78897/1 |goto Azj-Kahet/0 41.92,42.40
'|kill Razormouth Devourer##214081, Wild Razormouth##213922, Chasm Maker##214453, Ahg'zagall##214151
step
talk Skedgit Cinderbangs##214168
|tip 在洞穴里面。
turnin Delegated Dig##78902 |goto Azj-Kahet/0 40.74,39.73
accept Entrepreneur, Inc.##79349 |goto Azj-Kahet/0 40.74,39.73
step
离开洞穴 |goto Azj-Kahet/0 41.98,42.44 < 20 |walk |only if subzone("The Wormlands")
talk Greenspeaker Na'layro##211652
turnin Boom or Blight##78897 |goto Azj-Kahet/0 42.27,42.51
turnin Intention vs Instinct##78898 |goto Azj-Kahet/0 42.27,42.51
step
在安苏瑞克之眼见到奥薇娜 |q 79139/1 |goto Azj-Kahet/0 42.32,54.15
step
talk Orweyna##219109
问她_"我们该何去何从？ |gossip 121150
调查眺望台 |q 79139/2 |goto Azj-Kahet/0 44.29,57.22
step
观看对话
talk Spindle##216213
turnin Alone in the Dark##79139 |goto Azj-Kahet/0 44.25,56.77
accept A Guiding Thread##78354 |goto Azj-Kahet/0 44.25,56.77
step
talk Courier Nailen##208384
fpath Wildcamp Or'lay |goto Azj-Kahet/0 23.14,51.14
step
talk Ysabel Gleamgaard##227222
accept Tense Recovery##83628 |goto Azj-Kahet/0 23.62,52.18
step
talk On'hiea##217958
问他_"你和阿拉提人之间的关系似乎很紧张。他们能做些什么？ |gossip 123219
告诉他_“那好吧”_ |gossip 123220
与昂希亚交谈 |q 83628/1 |goto Azj-Kahet/0 23.20,52.40
step
talk Ney'leia##215724
问她_"你和阿拉提之间的关系似乎很紧张。他们能做什么？ |gossip 123221
告诉她 "我会找到一个古人” |gossip 123222
与奈蕾亚对话 |q 83628/2 |goto Azj-Kahet/0 23.05,53.24
step
talk Goehi##227224
|tip {飞上去找他。
turnin Tense Recovery##83628 |goto Azj-Kahet/0 23.94,40.73
accept Ancient Respite##83629 |goto Azj-Kahet/0 23.94,40.73
step
kill 15 Feasting Mite##227280 |q 83629/1 |goto Azj-Kahet/0 24.01,41.99
step
talk Goehi##227224
turnin Ancient Respite##83629 |goto Azj-Kahet/0 23.94,40.73
accept Rings of Memory##83632 |goto Azj-Kahet/0 23.94,40.73
step
talk Ney'leia##215724
turnin Rings of Memory##83632 |goto Azj-Kahet/0 23.05,53.25
accept Open Communications##83639 |goto Azj-Kahet/0 23.05,53.25
step
talk Ysabel Gleamgaard##227222
告诉她 涅蕾雅说他们没有被冒犯 |gossip 123232
告诉她 "当然” |gossip 123233
和伊莎贝尔说话 |q 83639/1 |goto Azj-Kahet/0 23.62,52.18
step
talk Baer##227185
问它_"对不起，我们需要一些草药在你后面。你介意移动一下吗？ |gossip 123235
移动贝尔 |q 83639/2 |goto Azj-Kahet/0 23.73,52.54
step
talk Ysabel Gleamgaard##227222
turnin Open Communications##83639 |goto Azj-Kahet/0 23.62,52.18
step
跟随斯宾德前往城市 |q 78354/1 |goto Azj-Kahet/0 47.14,53.01
'|clicknpc Spindle##216215
step
使用 "编织者之语 |q 78354/2 |goto Azj-Kahet/0 47.14,53.01
|tip 使用{o}编织者的狡猾{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
跟随纺锤过桥 |q 78354/3 |goto Azj-Kahet/0 48.47,50.35
|tip 你会受到攻击。
'|clicknpc Spindle##216216
step
跟随纺锤进入悬崖 |q 78354/4 |goto Azj-Kahet/0 49.47,46.79
'|clicknpc Spindle##216217
step
talk Widow Arak'nai##207471
turnin A Guiding Thread##78354 |goto Azj-Kahet/0 55.73,43.84
accept The Tangled Web##78392 |goto Azj-Kahet/0 55.73,43.84
accept A Seeming Respite##78393 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我你的情况”_ |gossip 122860
了解织女 |q 78392/1 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我敌军的情况”_ |gossip 122859
了解 Sureki 部队 |q 78392/2 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我关于飞升者的信息。”_ 了解关于飞升者的信息 |gossip 122858
了解飞升者 |q 78392/3 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
告诉她_“告诉我女王的核心圈子。”_ 了解女王的盟友 |gossip 122863
了解女王的盟友 |q 78392/4 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin The Tangled Web##78392 |goto Azj-Kahet/0 55.73,43.84
step
talk Linny Leadfinger##223754
accept Making the Underworld Go Round##84664 |goto Azj-Kahet/0 55.77,43.74
step
找到修理商 |q 78393/2 |goto Azj-Kahet/0 56.88,41.78
step
找到旅店老板 |q 78393/3 |goto Azj-Kahet/0 56.95,38.79
|tip 建筑内部
step
talk Yamas the Provider##228184
问她_“你们有什么要出售的？”_ |gossip 123902
buy Dubious Vial of Vigor##228913 |q 84664/1 |goto Azj-Kahet/0 55.38,41.50
step
talk Linny Leadfinger##223754
turnin Making the Underworld Go Round##84664 |goto Azj-Kahet/0 55.77,43.74
step
找到飞行大师 |q 78393/1 |goto Azj-Kahet/0 56.88,47.04
step
talk Wings of the Widow##207470
fpath Weaver's Lair |goto Azj-Kahet/0 56.88,47.04
step
talk Widow Arak'nai##207471
turnin A Seeming Respite##78393 |goto Azj-Kahet/0 55.73,43.84
accept The Weaver's Gift##78233 |goto Azj-Kahet/0 55.73,43.84
step
talk Great Hexer Ohodo##215349
accept Infested Infestation##79174 |goto Azj-Kahet/0 57.78,19.77
accept Prisoner Preservation##79355 |goto Azj-Kahet/0 57.78,19.77
stickystart "Slay_Spore_Afflicted_Beasts"
step
clicknpc Jeti Amberhoof##216988
找到探险队员 |q 79355/1 |goto Azj-Kahet/0 54.85,18.66 |count 1
step
clicknpc Drog Skullbreaker##215406
找到探险队员 |q 79355/1 |goto Azj-Kahet/0 54.93,21.23 |count 2
step
clicknpc Aemara##216986
找到探险队员 |q 79355/1 |goto Azj-Kahet/0 53.91,21.78 |count 3
step
clicknpc Mimbihi##216906
找到探险队员 |q 79355/1 |goto Azj-Kahet/0 55.29,24.01 |count 4
step
label "Slay_Spore_Afflicted_Beasts"
杀死周围的敌人
杀死 #12# 受孢子影响的野兽 |q 79174/1 |goto Azj-Kahet/0 55.16,20.60
'|kill Spored Stinger##216300, Spored Skitterer##216844, Spored Gnasher##215386, Spored Threadling##215532
step
talk Great Hexer Ohodo##215349
turnin Infested Infestation##79174 |goto Azj-Kahet/0 57.78,19.77
turnin Prisoner Preservation##79355 |goto Azj-Kahet/0 57.78,19.77
accept Antifungal Firestarter##79356 |goto Azj-Kahet/0 57.78,19.77
accept Removing the Cap##79357 |goto Azj-Kahet/0 57.78,19.77
stickystart "Burn_Invasive_Fungal_Pods"
step
进入地下洞穴 |goto Azj-Kahet/0 55.23,19.14 < 30 |walk
kill Agaricus Festerbloom##215545 |q 79357/1 |goto Azj-Kahet/0 56.62,16.96
|tip 在地下洞穴里
step
label "Burn_Invasive_Fungal_Pods"
clicknpc Invasive Fungal Pod##217553+
|tip 它们看起来像{o}大蘑菇{}。
|tip 地下洞穴内。|注意
烧毁 #8# 入侵真菌荚膜 |q 79356/1 |goto Azj-Kahet/0 55.23,19.14
step
离开地下洞穴 |goto Azj-Kahet/0 55.23,19.14 < 30 |walk |only if subzone("Pillar-nest Vosh") and indoors()
talk Great Hexer Ohodo##215349
turnin Antifungal Firestarter##79356 |goto Azj-Kahet/0 57.78,19.77
turnin Removing the Cap##79357 |goto Azj-Kahet/0 57.78,19.77
step
找到编织者的礼物 |q 78233/1 |goto Azj-Kahet/0 59.37,19.36
step
talk Faerin Lothar##211409
turnin The Weaver's Gift##78233 |goto Azj-Kahet/0 59.37,19.36
accept Rations and Revelations##80399 |goto Azj-Kahet/0 59.37,19.36
accept Where the Wild Things Camp##83306 |goto Azj-Kahet/0 59.37,19.36
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 59.38,19.23 |count 1
step
talk Courier Aidal##216973
fpath Faerin's Advance |goto Azj-Kahet/0 60.00,18.70
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 59.02,19.04 |count 2
step
click Arathi Rations
分发阿拉提口粮 |q 80399/1 |goto Azj-Kahet/0 58.76,20.00 |count 3
step
talk Faerin Lothar##211409
turnin Rations and Revelations##80399 |goto Azj-Kahet/0 59.37,19.36
accept Scrappy Straggler##78236 |goto Azj-Kahet/0 59.37,19.36
step
找到流浪者 |q 78236/1 |goto Azj-Kahet/0 63.04,27.15
step
talk Flynn Fairwind##220051
选择 _“<看 Flynn 指示的位置>”_ |gossip 121919
与弗林对话 |q 78236/2 |goto Azj-Kahet/0 63.04,27.15
step
talk Flynn Fairwind##220051
turnin Scrappy Straggler##78236 |goto Azj-Kahet/0 63.04,27.15
accept Force Your Way##78234 |goto Azj-Kahet/0 63.04,27.15
step
_Next to you:_
talk Flynn Fairwind##211444
accept Strategic Edge##78383
stickystart "Slay_Kaheti_Forces"
step
click Crate of Emptied Vials##441587
|tip 平台上
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 62.87,27.83 |count 1
step
click Military Correspondence##441586
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 60.99,28.44 |count 2
step
进入洞穴 |goto Azj-Kahet/0 64.75,29.64 < 15 |walk
click Confiscated Weapons##441588
collect Flynn's Blades##211870 |q 78383/1 |goto Azj-Kahet/0 66.53,31.38
step
click Burning Venom Flask##441585
收集奈鲁比人的情报 |q 78383/2 |goto Azj-Kahet/0 67.68,28.24 |count 3
step
_Next to you:_
talk Flynn Fairwind##211444
turnin Strategic Edge##78383
step
label "Slay_Kaheti_Forces"
杀死周围的敌人
杀死 #8# Kaheti 部队 |q 78234/1 |goto Azj-Kahet/0 63.97,28.89
'|kill Kaheti Skirmisher##214940, Kaheti Overseer##214941, Kaheti Threadmancer##214939, Dependable Skitterling##222153, Stalwart Hauler##214935
step
_Next to you:_
talk Flynn Fairwind##211444
turnin Force Your Way##78234
accept Let Fly!##78237
step
click Inconspicuous Box
检查不起眼的盒子 |q 78237/1 |goto Azj-Kahet/0 62.79,31.10
step
观看对话
开始飞往 Siegehold |invehicle |goto Azj-Kahet/0 62.79,31.10 |q 78237
step
飞往 Siegehold |outvehicle |goto Azj-Kahet/0 45.39,20.29 |q 78237 |notravel
step
talk Anub'azal##217330
|tip 建筑内部
turnin Let Fly!##78237 |goto Azj-Kahet/0 45.50,19.69
accept Not Quite Dead##79625 |goto Azj-Kahet/0 45.50,19.69
step
talk Monte Gazlowe##219156
|tip 建筑内部
选择 _“<轻推加兹洛>”_ |gossip 121784
找到有用的东西 |q 79625/1 |goto Azj-Kahet/0 45.18,20.21
step
talk Anub'azal##217330
|tip 建筑内部
turnin Not Quite Dead##79625 |goto Azj-Kahet/0 45.50,19.69
accept I Think I'm a Drone Now##79175 |goto Azj-Kahet/0 45.50,19.69
step
使用阿努巴尔印记 |q 79175/1 |goto Azj-Kahet/0 45.32,19.84
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Anub'azal##217330
|tip 建筑内部
turnin I Think I'm a Drone Now##79175 |goto Azj-Kahet/0 45.50,19.69
accept Specific Personages##78249 |goto Azj-Kahet/0 45.50,19.69
accept General Admission##78250 |goto Azj-Kahet/0 45.50,19.69
step
_NOTE:_
在接下来的步骤中
|tip {避免头顶有蓝色圆圈的敌人。
|tip 他们可以看穿你的伪装。
点击此处继续 |confirm |q 78249
step
click Siegehold Records
|tip 你的伪装看起来就像挂在架子上的卷轴。
|tip 建筑内部
collect Zev'kall's Attrition Log##217165 |q 78250/1 |goto Azj-Kahet/0 43.24,25.32
step
kill Hevo'myk##211591 |q 78249/3 |goto Azj-Kahet/0 44.51,27.66
step
kill Mi'thk##211582 |q 78249/1 |goto Azj-Kahet/0 46.74,28.69
step
kill Diu'mik##211564 |q 78249/2 |goto Azj-Kahet/0 48.93,23.82
|tip 建筑内部
step
进入建筑 |goto Azj-Kahet/0 45.60,21.80 < 15 |walk
talk Anub'azal##217330
|tip 建筑内部
turnin Specific Personages##78249 |goto Azj-Kahet/0 45.50,19.69
turnin General Admission##78250 |goto Azj-Kahet/0 45.50,19.69
accept Stolen Influence##78254 |goto Azj-Kahet/0 45.50,19.69
step
talk Monte Gazlowe##211399
|tip 建筑内部
accept Dalaran's Most Distressed##78251 |goto Azj-Kahet/0 45.33,19.85
step
click Gazlowe's Detonator
帮助加兹勒 |q 78251/3 |goto Azj-Kahet/0 45.14,23.06
step
talk High Arcanist Savor##221806
问他_"你好？ |gossip 121832
问他_“你看到安度因了吗？”_ |gossip 121834
告诉他_“在运输马车那里碰头”_ |gossip 121833
释放笼中囚犯 |q 78251/2 |goto Azj-Kahet/0 43.99,24.86
'|talk High Arcanist Savor##221757
step
talk Wriggling Web##221722
告诉它_"我是来救你的。假装你是下一队囚犯中的一员！"_释放被关在笼子里的囚犯 |gossip 121812
释放带网囚犯 |q 78251/1 |goto Azj-Kahet/0 47.22,26.94
step
kill Tij'allet##215600
|tip 建筑内部
collect Zev'kall's Pheromone Emitter##212528 |q 78254/1 |goto Azj-Kahet/0 48.54,19.95
step
talk Monte Gazlowe##215413
turnin Dalaran's Most Distressed##78251 |goto Azj-Kahet/0 47.39,23.90
turnin Stolen Influence##78254 |goto Azj-Kahet/0 47.39,23.90
accept Just Act Casual##78255 |goto Azj-Kahet/0 47.39,23.90
step
talk Monte Gazlowe##215413
告诉他_“我准备好了”_ |gossip 121494
告诉加兹罗你准备好了 |q 78255/1 |goto Azj-Kahet/0 47.39,23.90
step
talk Siegehold Gateminder##215419
告诉她_“我身上有阿努布扎尔将军的费洛蒙标记，让我们过去”_ |gossip 120311
与守门人对话 |q 78255/2 |goto Azj-Kahet/0 48.16,25.35
step
观看对话
在外面迎接车队 |q 78255/3 |goto Azj-Kahet/0 48.95,26.63
step
talk Monte Gazlowe##215845
turnin Just Act Casual##78255 |goto Azj-Kahet/0 51.80,25.77
accept The General's Consensus##78256 |goto Azj-Kahet/0 51.80,25.77
step
click Inconspicuous Box
collect Zev'kall's Pheromone Emitter##212528 |q 78256/1 |goto Azj-Kahet/0 51.78,25.87
step
talk Widow Arak'nai##207471
turnin The General's Consensus##78256 |goto Azj-Kahet/0 55.73,43.84
accept A Most Intriguing Invitation##78226 |goto Azj-Kahet/0 55.73,43.84
step
talk Linny Leadfinger##223754
accept Trade Partners##79651 |goto Azj-Kahet/0 55.77,43.74
accept A Silken Thread##83324 |goto Azj-Kahet/0 55.77,43.74
step
使用信息素 |q 78226/1 |goto Azj-Kahet/0 55.99,43.51
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
talk Anub'okki##224729
accept Bountiful Beetles##83325 |goto Azj-Kahet/0 55.89,42.13
step
clicknpc Vizier's Personal Swarmite##219239
|tip 如果你{o}想自己飞的话，可以{o}往前跳{}。
乘坐大臣的飞行器 |q 78226/3 |goto Azj-Kahet/0 55.63,44.30
step
开始飞往暗堡 |invehicle |goto Azj-Kahet/0 55.63,44.30 |q 78226
step
飞往暗堡 |outvehicle |goto Nerub'ar/0 67.19,25.01 |q 78226 |notravel
step
抵达墓穴 |q 78226/2 |goto Nerub'ar/0 67.19,25.01
step
会见大臣 |q 78226/4 |goto Nerub'ar/0 67.12,31.50
|tip 建筑内部
step
观看对话
talk Anduin Wrynn##211351
|tip 建筑内部
turnin A Most Intriguing Invitation##78226 |goto Nerub'ar/0 67.12,31.50
accept Into a Skittering City##78228 |goto Nerub'ar/0 67.12,31.50
step
talk Executor Nizrek##211499
|tip 建筑内部
告诉他 _"织布工想要除掉夏尔塔斯，让安苏瑞克女王摆脱她的影响。 |gossip 121538
与大臣交谈 |q 78228/1 |goto Nerub'ar/0 67.46,32.44
step
让图鲁蒙施放信息素 |q 78228/2 |goto Nerub'ar/0 66.99,32.60
|tip 使用{o}应用信息素{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 建筑内部
step
talk Executor Nizrek##211499
|tip 建筑内部
turnin Into a Skittering City##78228 |goto Nerub'ar/0 67.47,32.45
accept Rewriting the Rewritten##78232 |goto Nerub'ar/0 67.47,32.45
step
观看对话
|tip 建筑内部
talk Anduin Wrynn##211351
accept Like a Spider on the Wall##78231 |goto Nerub'ar/0 66.90,31.91
step
_NOTE:_
在接下来的步骤中
|tip {避免头顶有蓝色圆圈的敌人。
|tip 他们可以看穿你的伪装。
点击此处继续 |confirm |q 78231
step
talk Mr. Sunflower##223723
|tip 建筑内部
accept Loss of Limb##82340 |goto Nerub'ar/0 63.33,37.46
step
talk Vi'azl##224352
|tip 建筑内部
告诉他_“我只是来谈谈”_ |gossip 122842
与 Vi'azl 交谈 |q 82340/1 |goto Nerub'ar/0 63.44,38.62
step
clicknpc Vi'azl##224352
|tip 建筑内部
喝下降低威胁药水 |q 82340/2 |goto Nerub'ar/0 63.32,36.68
step
talk Vi'azl##224352
|tip 建筑内部
问他_"我现在变小了。这样好些吗？ |gossip 122844
安慰 Vi'azl |q 82340/3 |goto Nerub'ar/0 63.44,38.61
step
观看对话
talk Vi'azl##225438
告诉他_“告诉我们发生了什么事，Vi'azl”_ |gossip 122846
与 Vi'azl 交谈 |q 82340/4 |goto Nerub'ar/0 54.87,39.20
step
talk Mr. Sunflower##223723
turnin Loss of Limb##82340 |goto Nerub'ar/0 55.03,39.14
accept Setting Boundaries##83057 |goto Nerub'ar/0 55.03,39.14
step
click Shadecaster
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 58.19,28.97 |count 1
step
talk Nana Lek'kel##222139
问他_"我？ |gossip 120653
选择_“<走开>”_ |gossip 120657
尝试与米斯克会面 |q 78231/5 |goto Nerub'ar/1 62.11,20.72
step
talk Arax'ne##217356
accept Searching the Web##79630 |goto Nerub'ar/1 64.08,15.92
step
click Shadecaster
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 60.93,18.81 |count 2
step
kill Vek'kix##225425 |q 83057/1 |goto Nerub'ar/1 57.89,19.93
|tip 他在这附近走动。
|tip 建筑内部
step
聆听 Sureki 报信者 |q 78231/1 |goto Nerub'ar/1 54.84,20.29
step
click Shadecaster
|tip 建筑内部
改写遮蔽者 |q 78232/1 |goto Nerub'ar/1 53.11,16.00 |count 3
step
观察裁缝 |q 78231/4 |goto Nerub'ar/1 49.72,17.41
step
click Catalogue of Cagables
|tip 建筑内部
阅读 “Twitchery ”目录 |q 78231/3 |goto Nerub'ar/1 43.42,16.55
step
发现美食摊位 |q 78231/2 |goto Nerub'ar/1 49.05,26.54
step
talk Klaskin##217355
问他_“你是阿拉克斯涅的丈夫吗？”_ |gossip 123185
与克拉斯金交谈 |q 79630/1 |goto Nerub'ar/1 47.92,13.22
step
talk Klaskin##217355
turnin Searching the Web##79630 |goto Nerub'ar/1 47.92,13.22
accept Klaskin's Great Escape##79631 |goto Nerub'ar/1 47.92,13.22
step
_NOTE:_
在下一步中
|tip 一边走，一边对{o}克拉金使用{o}“海岸安全了！{}”能力。
|tip {避开头顶有蓝色圆圈{}的守卫敌人。
|tip 他会{o}跟着你{}，所以一定要让他远离守卫。
|tip 你将{o}带领他{}到达某个地点。
点击此处继续 |confirm |q 79631
step
躲开守卫，因为克莱斯金会跟着你 |goto Nerub'ar/1 49.60,16.92 < 30 |walk
跟着克莱斯金跑上楼梯 |goto Nerub'ar/1 52.64,13.70 < 15 |walk
跟着克莱斯金跑上楼梯 |goto Nerub'ar/1 57.13,16.00 < 15 |walk
将拉斯金还给他的妻子 |q 79631/1 |goto Nerub'ar/1 63.51,16.42
|tip 一边走，一边对{o}克拉金使用{o}“海岸安全了！{}”能力。
|tip {避开头顶有蓝色圆圈{}的守卫敌人。
|tip 他会{o}跟着你{}，所以一定要让他远离守卫。
|tip {带他到这个地方
|tip 外面，大楼后面
'|clicknpc Klaskin##220377
step
talk Arax'ne##217356
turnin Klaskin's Great Escape##79631 |goto Nerub'ar/1 64.09,15.92
step
clicknpc Klaskin##220690
accept Don't Cry for Me, Azj-Kahet##80502 |goto Nerub'ar/1 63.86,16.26
step
kill Arax'ne##217465 |q 80502/1 |goto Nerub'ar/1 62.59,15.46
|tip 建筑内部
step
click Klaskin's Chest##433914
|tip 建筑内部
turnin Don't Cry for Me, Azj-Kahet##80502 |goto Nerub'ar/1 63.05,15.04
step
talk Mr. Sunflower##223723
turnin Setting Boundaries##83057 |goto Nerub'ar/0 55.03,39.12
step
talk Tekazza of the Aimless Few##209330
|tip 在地面上
fpath The Burrows |goto Nerub'ar/0 53.98,44.33
step
talk Alleria Windrunner##211375
|tip 平台上
turnin Rewriting the Rewritten##78232 |goto Nerub'ar/1 54.97,45.84
step
talk Anduin Wrynn##217386
|tip 平台上
turnin Like a Spider on the Wall##78231 |goto Nerub'ar/1 55.29,46.06
accept Kaheti Hospitality##78244 |goto Nerub'ar/1 55.29,46.06
step
talk Anduin Wrynn##217386
|tip 平台上
告诉他_“是的，我已经准备好参加登基日演讲了”_ |gossip 120665
与安度因交谈 |q 78244/1 |goto Nerub'ar/1 55.29,46.06
step
观看对话
观看苏莱奇女王的演讲 |q 78244/2 |goto Nerub'ar/1 55.29,46.06
step
开始剧情 |scenariostart |q 78244
step
杀死攻击的敌人
|tip 向前{o}直走{}，开始攻击敌人。
|tip {击败敌人后，{o}“螺纹马斯特罗-福斯 ”会攻击你。
kill Threadmaestro Fothis##216541 |scenariogoal 1/65266 |q 78244
step
click Web Blockade
|tip {跟随你的盟友。
|tip 它会在你的{o}小地图上出现一个{o}黄色小点。
摧毁网墙 |scenariogoal 1/65318 |q 78244
step
kill Swarm-Maven Donmiss##216578 |scenariogoal 2/65267 |q 78244
|tip {o}当你跑向她时，避开地面上的绿色圆圈{}。
|tip 她会以一个{o}黄点{}的形式出现在你的{o}迷你地图{}上。
step
观看对话
|tip {跟随你的盟友。
clicknpc Vizier's Getaway Flyer##216581
|tip 在你的{o}迷你地图{}上，它们会以{o}黄色圆点{}的形式出现。
到达大臣的飞行器 |scenariogoal 3/65268 |q 78244
step
kill Kx##216582
杀死女王之牙 Kx |scenariogoal 4/65269 |q 78244
step
逃离墓穴 |q 78244/3
|tip {跟随你的盟友。
|tip {跳下平台{}逃生。
step
观看对话
talk Anduin Wrynn##217386
|tip 他走到这个位置。
turnin Kaheti Hospitality##78244 |goto Azj-Kahet/0 60.63,68.89
step
talk Alleria Windrunner##217385
accept What We Still Have##78248 |goto Azj-Kahet/0 60.63,68.78
step
talk Al'kubian##217565
accept A Fin of Every Kind##79710 |goto Azj-Kahet/0 59.99,66.17
stickystart "Fill_The_Innards_Sack"
step
杀死周围的敌人
collect Familiar-Looking Appendage##214504 |n
accept That's Pretty Gross##79711 |goto Azj-Kahet/0 56.98,71.39
'|kill Gutter Scarfer##217717, Drooling Salamuncher##217720, Adolchomper##217724, Gutter Gorger##217718
step
label "Fill_The_Innards_Sack"
杀死周围的敌人
|tip {从他们身上掠夺各种物品
click Dead Kobyss+
|tip 他们看起来像躺在地上的鱼人。
装满内脏袋 |q 79710/1 |goto Azj-Kahet/0 56.98,71.39
'|kill Gutter Scarfer##217717, Drooling Salamuncher##217720, Adolchomper##217724, Gutter Gorger##217718
step
talk Al'kubian##217565
turnin A Fin of Every Kind##79710 |goto Azj-Kahet/0 60.00,66.17
turnin That's Pretty Gross##79711 |goto Azj-Kahet/0 60.00,66.17
accept Moonlight Gutter Swim##79713 |goto Azj-Kahet/0 60.00,66.17
accept Rescuing the Food##79714 |goto Azj-Kahet/0 60.00,66.17
step
talk Al'kubian##217565
选择 _“<查看阿尔库比安的药剂>”_ |gossip 122393
buy Atomized Salien Slime##223287+ |n
|tip 买几个吧
|tip 它们可以帮助你更快地完成任务。
购买雾化萨林粘液 |q 79714/1 |goto Azj-Kahet/0 60.08,66.06
stickystart "Rescue_Captured_Victims"
step
use the Atomized Salien Slime##223287+
|tip 用它们可以游得更快
kill Liverseeker##217744
|tip 水下。
collect Liverseeker's Intestines##222924 |q 79713/1 |goto Azj-Kahet/0 59.21,69.43
step
use the Atomized Salien Slime##223287+
|tip 用它们可以游得更快
kill Leg Chewer##217743
|tip 他在这片区域游来游去。
|tip 水下。
collect Leg Chewers' Stomach##222926 |q 79713/2 |goto Azj-Kahet/0 56.57,67.87
step
label "Rescue_Captured_Victims"
use the Atomized Salien Slime##223287+ |notinsticky
|tip 用它们可以游得更快 |注意
clicknpc Captured Kaheti##217728+
|tip 它们看起来就像{o}泡泡里的大昆虫{}。
|tip 在水下 |注释
营救 #5# 被捕的受害者 |q 79714/2 |goto Azj-Kahet/0 57.91,68.08
step
talk Al'kubian##217565
turnin Moonlight Gutter Swim##79713 |goto Azj-Kahet/0 59.99,66.18
turnin Rescuing the Food##79714 |goto Azj-Kahet/0 59.99,66.18
accept Grand, Gutsy Solutions##79715 |goto Azj-Kahet/0 59.99,66.18
step
kill Grand Gluttony##217747
collect Swollen Brain of Gluttony##222944 |q 79715/1 |goto Azj-Kahet/0 56.66,65.46
step
talk Al'kubian##217565
turnin Grand, Gutsy Solutions##79715 |goto Azj-Kahet/0 59.99,66.17
step
talk Orweyna##220595
turnin Where the Wild Things Camp##83306 |goto Azj-Kahet/0 44.59,66.39
accept Tool of Attunement##80563 |goto Azj-Kahet/0 44.59,66.39
accept Field Research##80564 |goto Azj-Kahet/0 44.59,66.39
step
talk Courier Lyan##216972
fpath Wildcamp Ul'ar |goto Azj-Kahet/0 44.49,67.48
stickystart "Collect_Tuning_Crystal"
step
click Storage Rack
检查储藏架 |q 80564/1 |goto Azj-Kahet/1 49.33,64.53
step
click Functional Extractor
检查功能提取器 |q 80564/2 |goto Azj-Kahet/1 48.13,61.85
step
click Harmonizing Instrument
检查调和仪器 |q 80564/3 |goto Azj-Kahet/1 49.22,60.18
step
talk Orweyna##226672
turnin Field Research##80564 |goto Azj-Kahet/1 49.27,60.21
step
label "Collect_Tuning_Crystal"
杀死周围的敌人
collect Tuning Crystal##218188 |q 80563/1 |goto Azj-Kahet/1 48.46,61.52
'|kill Black Blood Harvester##220712, Harvest Overseer##220713
step
talk Orweyna##226672
turnin Tool of Attunement##80563 |goto Azj-Kahet/1 49.27,60.21
accept The Path of Dissonance##82143 |goto Azj-Kahet/1 49.27,60.21
step
talk Sum'latha##221948
|tip 平台上
turnin A Silken Thread##83324 |goto Azj-Kahet/0 51.40,63.95
accept The Voice of the People##81928 |goto Azj-Kahet/0 51.40,63.95
step
talk Worker Yareh'losh##222063
询问她_"丝绸病房里发生了什么事？ |gossip 122159
与丝绸病房公民交谈 |q 81928/1 |goto Azj-Kahet/0 53.70,61.32 |count 1
step
talk Teacher Zas'rush##222064
问他_"丝绸病房里发生了什么事？ |gossip 122259
与丝绸病房公民交谈 |q 81928/1 |goto Azj-Kahet/0 54.16,52.29 |count 2
step
talk Priest Maro'zik##222065
问他_"丝绸病房里发生了什么事？ |gossip 122264
与丝绸病房公民交谈 |q 81928/1 |goto Azj-Kahet/0 57.48,50.23 |count 3
step
talk Alchemist Talbax##221842
turnin The Voice of the People##81928 |goto Azj-Kahet/0 59.93,54.19
accept Collecting a Concoction##81959 |goto Azj-Kahet/0 59.93,54.19
step
click Crate of Alchemical Potions##441257+
|tip 它们看起来就像水边的{o}木箱{}。
collect 8 Brightshade Potion##221755 |q 81959/1 |goto Azj-Kahet/0 55.72,56.12
step
talk Alchemist Talbax##221842
turnin Collecting a Concoction##81959 |goto Azj-Kahet/0 59.93,54.19
accept A Nudge in the Right Direction##81962 |goto Azj-Kahet/0 59.93,54.19
step
杀死周围的敌人
|tip 使用{o}各种药水能力{}。
|tip 它们会以按钮的形式出现在屏幕上。
|tip 在有建筑物的区域。
杀死 #10#苍白女巫 |q 81962/1 |goto Azj-Kahet/0 55.89,54.91
'|kill Pale Weavelasher Apprentice##223364, Webwarden Enforcer##223361, Boltweaver Enforcer##223362, Pale Weavelasher Grunt##223363
step
talk Alchemist Talbax##221842
turnin A Nudge in the Right Direction##81962 |goto Azj-Kahet/0 59.93,54.19
accept The Fruits of Our Labor##81963 |goto Azj-Kahet/0 59.93,54.19
step
talk Priest Maro'zik##223173
选择_“<递上药水>”_ |gossip 122341
递交光明药水 |q 81963/1 |goto Azj-Kahet/0 57.56,50.10 |count 1
step
talk Teacher Zas'rush##223174
选择_“<递上药水>”_ |gossip 122343
递交光明药水 |q 81963/1 |goto Azj-Kahet/0 54.15,52.30 |count 2
step
talk Worker Yareh'losh##223175
选择_“<递上药水>”_ |gossip 122345
递交光明药水 |q 81963/1 |goto Azj-Kahet/0 53.67,61.32 |count 3
step
talk Alchemist Talbax##221842
turnin The Fruits of Our Labor##81963 |goto Azj-Kahet/0 59.93,54.19
step
在萨林水沟见到奥薇娜 |q 82143/1 |goto Azj-Kahet/0 59.91,63.77
step
click Broken Extractor
清空破碎的提取器 |q 82143/2 |goto Azj-Kahet/0 59.91,63.77
step
talk Orweyna##220603
turnin The Path of Dissonance##82143 |goto Azj-Kahet/0 59.88,63.81
accept Resounding Repercussions##80565 |goto Azj-Kahet/0 59.88,63.81
step
进入洞穴 |goto Azj-Kahet/0 60.28,63.29 < 15 |walk
跟随汉南进入废弃的收获地洞穴 |q 80565/1 |goto Azj-Kahet/0 61.87,62.64
|tip 在洞穴里面。
step
talk Hannan##220608
|tip 在洞穴里面。
选择 _"<告诉汉南跟着你离开山洞。 |gossip 123210
营救汉南 |q 80565/2 |goto Azj-Kahet/0 61.87,62.64
step
talk Hannan##220608
|tip 在洞穴里面。
turnin Resounding Repercussions##80565 |goto Azj-Kahet/0 61.87,62.64
accept Enemies Abound##80566 |goto Azj-Kahet/0 61.87,62.64
step
click Extractor Bulb
|tip 在洞穴里面。
摧毁提取器灯泡 |q 80566/1 |goto Azj-Kahet/0 61.81,62.36
step
kill 3 Lost Threadling##223065 |q 80566/2 |goto Azj-Kahet/0 61.64,62.77
|tip 在洞穴里面。
step
click Extractor Tripod
|tip 你会受到攻击。
|tip 在洞穴里面。
摧毁提取器三脚架 |q 80566/3 |goto Azj-Kahet/0 61.76,63.49
step
kill 3 Lost Skitterling##227267 |q 80566/4 |goto Azj-Kahet/0 61.76,63.49
|tip 在洞穴里面。
step
click Extractor Storage
|tip 你会受到攻击。
|tip 在洞穴里面。
摧毁提取器储藏室 |q 80566/5 |goto Azj-Kahet/0 61.95,63.32
step
kill 3 Lost Harvester##228503 |q 80566/6 |goto Azj-Kahet/0 61.95,63.32
|tip 在洞穴里面。
step
离开洞穴 |goto Azj-Kahet/0 60.28,63.29 < 15 |walk |only if subzone("Abandoned Harvest Site") and indoors()
talk Orweyna##223285
turnin Enemies Abound##80566 |goto Azj-Kahet/0 59.81,63.91
accept Song of Restoring##80567 |goto Azj-Kahet/0 59.81,63.91
step
click Harmonizing Instrument
使用 Hamonizing 仪器 |q 80567/1 |goto Azj-Kahet/0 59.80,63.91
step
talk Hannan##223286
turnin Song of Restoring##80567 |goto Azj-Kahet/0 59.76,63.97
accept Leave No Trace##80568 |goto Azj-Kahet/0 59.76,63.97
step
clicknpc Magic Trace##223565+
|tip 它们看起来像{o}漂浮在地面附近的绿色球体{}。
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
|tip {从北面开始收集，然后往南面移动。
收集 #10# 魔法痕迹 |q 80568/1 |goto Azj-Kahet/0 61.04,71.52
step
talk Hannan##227158
turnin Leave No Trace##80568 |goto Azj-Kahet/1 62.52,79.07
step
talk Orweyna##220610
accept Staunch the Flow##80570 |goto Azj-Kahet/1 62.57,79.21
accept Decipher the Cacophony##80571 |goto Azj-Kahet/1 62.57,79.21
stickystart "Collect_Discordant_Essences"
step
click Black Blood Extractor+
|tip 它们看起来像{o}装在金属外壳里的红色玻璃球{}。
click Extractor Storage+
|tip 它们看起来像{o}一排排红色玻璃球{}。
摧毁 #8# 提取器 |q 80570/1 |goto Azj-Kahet/1 63.88,82.70
step
label "Collect_Discordant_Essences"
杀死周围的敌人
collect 10 Discordant Essence##221776 |q 80571/1 |goto Azj-Kahet/1 63.88,82.70
'|kill Discordant Skitterling##223116, Discordant Harvester##223115
step
talk Orweyna##220610
turnin Staunch the Flow##80570 |goto Azj-Kahet/1 62.57,79.21
turnin Decipher the Cacophony##80571 |goto Azj-Kahet/1 62.57,79.21
accept Discordant Measures##80572 |goto Azj-Kahet/1 62.57,79.21
step
talk Hannan##227158
accept Harmonious Approach##80569 |goto Azj-Kahet/1 62.52,79.07
stickystart "Acquire_50_Stacks_Of_Unseeming_Shift"
step
kill Harvest Warden Izk'tilak##220644 |q 80569/1 |goto Azj-Kahet/1 61.27,83.74
step
label "Acquire_50_Stacks_Of_Unseeming_Shift"
click Black Blood Extractor+
|tip 它们看起来像{o}装在金属外壳里的红色玻璃球{}。
click Extractor Storage+
|tip 它们看起来像{o}一排排红色玻璃球{}。
获得 50 叠不显眼的移位器 |q 80572/1 |goto Azj-Kahet/1 63.61,83.02
step
kill Warped Sapling##220655
collect Root Sliver##225698 |q 80572/4 |goto Azj-Kahet/1 63.17,85.11
step
kill Aberrant Deepwalker##220653
collect Corrupted Heart##225696 |q 80572/2 |goto Azj-Kahet/1 65.34,88.18
step
kill Faceless One##223119
collect Sightless Eye##225697 |q 80572/3 |goto Azj-Kahet/1 65.81,83.94
step
在眺望处与奥维娜会面 |q 80572/5 |goto Azj-Kahet/1 62.57,79.20
step
talk Orweyna##220610
turnin Discordant Measures##80572 |goto Azj-Kahet/1 62.57,79.20
step
talk Hannan##227158
turnin Harmonious Approach##80569 |goto Azj-Kahet/1 62.52,79.07
step
talk Kish'nal##214359
|tip 建筑内部
turnin Bountiful Beetles##83325 |goto Azj-Kahet/0 76.02,82.33
accept It's Rough to Be a Bug!##79119 |goto Azj-Kahet/0 76.02,82.33
step
click Various Objects
|tip 它们看起来像{o}不同名称的破碎物体{}。
|tip 建筑内部
清除 #8# 碎片 |q 79119/1 |goto Azj-Kahet/0 75.94,82.51
step
talk Kish'nal##214359
|tip 建筑内部
turnin It's Rough to Be a Bug!##79119 |goto Azj-Kahet/0 76.02,82.33
accept Beautification Project##79114 |goto Azj-Kahet/0 76.02,82.33
step
clicknpc Overgrown Plant##225232+
|tip 它们看起来像{o}绿色的管状植物{}。
clicknpc Overgrown Bush##225239+
|tip 它们看起来像白色的灌木丛
|tip {o}点击它们之后，赶紧跑开{}。
|tip 你可能会遭到攻击。
移除 #8# 植物 |q 79114/1 |goto Azj-Kahet/0 73.13,81.49
step
talk Kish'nal##214359
|tip 建筑内部
turnin Beautification Project##79114 |goto Azj-Kahet/0 76.02,82.33
step
talk Vix'aron##214356
|tip 建筑内部
accept Expert Consultant##79115 |goto Azj-Kahet/0 76.13,82.50
step
talk Roughrider Tany##216979
fpath Mmarl |goto Azj-Kahet/0 76.84,64.45
step
talk Vetiverian##215037
turnin Expert Consultant##79115 |goto Azj-Kahet/0 77.21,64.49
accept Bright Young Niffen##79117 |goto Azj-Kahet/0 77.21,64.49
step
talk Monte Gazlowe##217029
turnin Trade Partners##79651 |goto Azj-Kahet/0 77.08,64.16
accept Nothing Ventured##80558 |goto Azj-Kahet/0 77.08,64.16
step
talk Ripsnoodle##216308
turnin Entrepreneur, Inc.##79349 |goto Azj-Kahet/0 78.25,61.71
step
talk Sammy Fizzvolt##220584
问他 _“关于这里的地精，你能告诉我什么？”_ |gossip 121582
与玛尔妖精交谈 |q 80558/1 |goto Azj-Kahet/0 78.63,61.85 |count 1
step
talk Murfie##220583
|tip 他在这附近走动。
问他 _“关于这里的地精，你能告诉我什么？”_ |gossip 121581
与玛尔妖精交谈 |q 80558/1 |goto Azj-Kahet/0 78.88,60.07 |count 2
step
talk Grigg##217402
问他 _“关于这里的地精，你能告诉我什么？”_ |gossip 121583
与玛尔妖精交谈 |q 80558/1 |goto Azj-Kahet/0 77.69,59.59 |count 3
step
talk Jenni Boombuckle##216994
|tip 建筑内部
问她_"你是这里的负责人吗？ |gossip 121584
与地精首领交谈 |q 80558/2 |goto Azj-Kahet/0 77.83,62.85
step
talk Monte Gazlowe##217029
|tip 建筑内部
turnin Nothing Ventured##80558 |goto Azj-Kahet/0 77.81,62.90
step
talk Jenni Boombuckle##216994
|tip 建筑内部
accept Electrifying!##79539 |goto Azj-Kahet/0 77.83,62.84
step
talk Rhubarn##216996
|tip 建筑内部
accept Smelly Shrubberies##79538 |goto Azj-Kahet/0 77.90,62.88
stickystart "Collect_Smellsage_Branches"
stickystart "Perform_Debugger_Hat_Tests"
step
clicknpc Patchoulisa##217678
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 73.47,61.81 |count 1
step
clicknpc Aromash##215730
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 74.56,63.29 |count 2
step
clicknpc Limoni##217682
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 74.49,65.05 |count 3
step
clicknpc Anisen##217681
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 75.00,66.26 |count 4
step
clicknpc Papriki##217679
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 75.47,68.19 |count 5
step
clicknpc Saffrin##217680
|tip 你可能需要杀死一个敌人{}。
招募尼芬蛛网学家 |q 79117/1 |goto Azj-Kahet/0 76.54,67.17 |count 6
step
label "Collect_Smellsage_Branches"
click Smellsage Shrub+
|tip 它们看起来像开着白花的{o}小灌木丛{}。
collect 6 Smellsage Branch##213514 |q 79538/1 |goto Azj-Kahet/0 73.84,63.85
step
label "Perform_Debugger_Hat_Tests"
use the Debugger Hat##213629
|tip 用它来对付这个区域周围的敌人。
执行 #15# 调试器帽子测试 |q 79539/1 |goto Azj-Kahet/0 74.64,64.51
'|clicknpc Intrusive Nothwing##217038, Noth Drone##218308, Noth Drone##218309, Noth Drone##218310, Noth Drone##218312, Noth Drone##218314, Noth Swarmer##217796, Noth Venomsprayer##217040, Noth Drone##218311
step
talk Vetiverian##215037
turnin Bright Young Niffen##79117 |goto Azj-Kahet/0 77.21,64.50
accept Rak-Ush Under New Management##79118 |goto Azj-Kahet/0 77.21,64.50
step
talk Jenni Boombuckle##216994
|tip 建筑内部
turnin Electrifying!##79539 |goto Azj-Kahet/0 77.83,62.84
step
talk Rhubarn##216996
|tip 建筑内部
turnin Smelly Shrubberies##79538 |goto Azj-Kahet/0 77.89,62.87
step
talk Grigg##217402
|tip 建筑内部
accept The Party's Over##79540 |goto Azj-Kahet/0 77.91,62.82
step
找到问题所在 |q 79540/1 |goto Azj-Kahet/0 77.67,59.51
step
talk Rhubarn##216996
turnin The Party's Over##79540 |goto Azj-Kahet/0 77.67,59.51
step
观看对话
talk Monte Gazlowe##217029
accept Burn It With Fire##79541 |goto Azj-Kahet/0 77.58,59.55
step
click Pillar-nest Heart
|tip 在洞穴里面。
摧毁柱巢之心 |q 79541/1 |goto Azj-Kahet/0 76.87,58.23 |count 1
step
click Pillar-nest Heart
|tip 在洞穴里面。
摧毁柱巢之心 |q 79541/1 |goto Azj-Kahet/0 76.01,58.74 |count 2
step
click Pillar-nest Heart
|tip 在洞穴里面。
摧毁柱巢之心 |q 79541/1 |goto Azj-Kahet/0 76.03,58.96 |count 3
step
click Pillar-nest Heart
|tip 山洞的楼上
摧毁柱巢之心 |q 79541/1 |goto Azj-Kahet/0 76.41,59.31 |count 4
step
click Niffen Protection Incense
|tip 山洞的楼上
更换妮芬保护香 |q 79541/2 |goto Azj-Kahet/0 76.79,58.65
step
talk Jenni Boombuckle##216994
turnin Burn It With Fire##79541 |goto Azj-Kahet/0 77.63,59.52
step
talk Vix'aron##214356
turnin Rak-Ush Under New Management##79118 |goto Azj-Kahet/0 75.04,80.86
accept Beetle in a Haystack##79120 |goto Azj-Kahet/0 75.04,80.86
step
clicknpc Feral Stagshell##219127+
取回 #6# 战贝 |q 79120/1 |goto Azj-Kahet/0 69.67,74.57
'|clicknpc Feral Stagshell##219128, Feral Stagshell##219129, Feral Stagshell##219130, Feral Stagshell##219131, Feral Stagshell##219132
step
talk Vix'aron##214356
turnin Beetle in a Haystack##79120 |goto Azj-Kahet/0 75.04,80.86
step
talk Kish'nal##214359
accept Bug Test##79121 |goto Azj-Kahet/0 75.07,80.72
stickystart "Fill_Food_Troughs"
step
clicknpc Stagshell Water Trough##214424+
|tip 它们看起来像{o}空的长方形木制容器{}。
|tip 你可能会遭到攻击。
装满 #4# 水槽 |q 79121/1 |goto Azj-Kahet/0 73.07,81.30
step
label "Fill_Food_Troughs"
clicknpc Stagshell Food Trough##214412+
|tip 它们看起来像{o}空的长方形木制容器{}。|不粘
|tip 你可能会被攻击。|注意
装满 #4# 食物槽 |q 79121/2 |goto Azj-Kahet/0 73.07,81.30
step
talk Kish'nal##214359
turnin Bug Test##79121 |goto Azj-Kahet/0 75.07,80.72
accept Scarab Scouting##79122 |goto Azj-Kahet/0 75.07,80.72
step
talk Aromash##214360
问它 _“基什纳尔说过关于松露的事情吗？”_ |gossip 120647
与阿罗玛什对话 |q 79122/1 |goto Azj-Kahet/0 72.77,80.26
step
click Various Insect+
|tip 它们看起来像{o}不同名字的{o}虫子{}。
|tip 随便挑一个，{o}无所谓{}。
选择 _“<选择这种食肉动物>”_ |gossip 121154 |noautogossip
选择一个鹿壳 |q 79122/2 |goto Azj-Kahet/0 72.64,80.85
'|clicknpc Helioceros##219057, Rafflesian##219058, Bulbophyll##219059, Durania##219062, Stapellia##219061, Titannirum##219060
step
clicknpc Volatile Soil##214518+
|tip 它们看起来像一堆棕色的泥土
clicknpc Volatile Kaheti Truffle##214518+
|tip 你的昆虫会把它们挖出来
采集 #5# Kaheti 松露 |q 79122/3 |goto Azj-Kahet/0 69.71,77.73
step
talk Kish'nal##214359
turnin Scarab Scouting##79122 |goto Azj-Kahet/0 75.07,80.72
accept Permanent Hire##79123 |goto Azj-Kahet/0 75.07,80.72
step
talk Saffrin##217250
问它_"拉克乌什的下一步计划是什么？ |gossip 120644
和莎芙琳说话 |q 79123/1 |goto Azj-Kahet/0 74.78,81.18
step
talk Saffrin##217250
turnin Permanent Hire##79123 |goto Azj-Kahet/0 74.78,81.18
step
talk Teth##222136
accept The Upstart##81667 |goto Azj-Kahet/0 69.73,47.97
accept The Entrenched##83616 |goto Azj-Kahet/0 69.73,47.97
step
talk Grand Overspinner Antourix##221557
|tip 建筑内部
|tip 在最上面一层
告诉她_“Ren'khat 认为他应该负责你的行动”_ |gossip 122668
向安图里克斯大掮客示好 |q 83616/1 |goto Azj-Kahet/0 75.81,52.56
step
talk Grand Overspinner Antourix##221557
|tip 建筑内部
turnin The Entrenched##83616 |goto Azj-Kahet/0 75.81,52.56
accept Spring Collection##81683 |goto Azj-Kahet/0 75.81,52.56
stickystart "Collect_Eyeless_Petals"
stickystart "Collect_Luminous_Strangler_Sap"
stickystart "Collect_Reclaimed_Catalysts"
step
kill Cochineal Crawler##224785+
|tip 它们看起来像红色的小昆虫
|tip 在地面上
collect 3 Cochineal Crawler##224286 |q 81683/4 |goto Azj-Kahet/0 70.70,42.58
step
label "Collect_Eyeless_Petals"
click Eyeless Violet+
|tip 它们看起来像{o}紫色花瓣的矮小植物{}。
|tip 在地上 |不粘
collect 3 Eyeless Petal##224284 |q 81683/3 |goto Azj-Kahet/0 72.31,43.39
step
label "Collect_Luminous_Strangler_Sap"
click Luminous Shore-Strangler+
|tip 它们看起来像{o}大灌木丛{}。
|tip 在地上 |不粘
collect 3 Luminous Strangler Sap##224285 |q 81683/2 |goto Azj-Kahet/0 72.31,43.39
step
label "Collect_Reclaimed_Catalysts"
杀死周围的敌人
|tip 在地上 |不粘
collect 12 Reclaimed Catalyst##224283 |q 81683/1 |goto Azj-Kahet/0 72.31,43.39
'|kill Coagulated Mordant##222086, Malignant Mordant##222091, Volatile Droplet##222090
step
talk Ren'khat##221550
|tip 外面，大楼后面
告诉他_“我听说你想和大翻转者作对”_ |gossip 122667
向 Ren'htak 示好 |q 81667/1 |goto Azj-Kahet/0 66.61,41.34
step
talk Ren'khat##221550
|tip 外面，大楼后面
turnin The Upstart##81667 |goto Azj-Kahet/0 66.61,41.34
accept Measure Once, Cut Thrice##81668 |goto Azj-Kahet/0 66.61,41.34
step
kill Seam Reaper Zhir'ix##221934 |q 81668/2 |goto Azj-Kahet/0 74.19,50.07
|tip 建筑内部
|tip 在{o}底层{}。
step
kill Colormancer Nirethi##222150 |q 81668/3 |goto Azj-Kahet/0 74.51,51.71
|tip 建筑内部
|tip 在{o}中层{}。
step
kill Webwarper Tath'rhiz##221932 |q 81668/1 |goto Azj-Kahet/0 73.46,52.51
|tip 它在这片区域四处走动。
|tip 建筑内部
|tip 在{o}底层{}。
step
talk Grand Overspinner Antourix##222135
|tip 平台上
turnin Spring Collection##81683 |goto Azj-Kahet/0 72.89,42.61
step
talk Ren'khat##222133
turnin Measure Once, Cut Thrice##81668 |goto Azj-Kahet/0 72.81,42.46
step
talk Teth##222132
accept Azj-Kahet's Next Top Dyemaster##81685 |goto Azj-Kahet/0 72.89,42.81
accept I Expect You To Dye##81687 |goto Azj-Kahet/0 72.89,42.81
stickystart "Slay_Dyeworks_Nerubians"
step
测试紫色染色浴 |q 81687/3 |goto Azj-Kahet/0 74.36,42.90
|tip 使用{o}皇家紫色{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
测试蓝色染缸 |q 81687/4 |goto Azj-Kahet/0 75.91,41.62
|tip 对附近的敌人使用{o}蓝色闪电能力{o}。
|tip 它会以按钮的形式出现在屏幕上。
step
测试绿色染缸 |q 81687/6 |goto Azj-Kahet/0 75.94,38.96
|tip 使用{o}砷绿{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
测试黄色染缸 |q 81687/5 |goto Azj-Kahet/0 74.43,37.59
|tip 使用{o}黄赭石{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
测试红色浴池 |q 81687/2 |goto Azj-Kahet/0 72.88,38.87
|tip 使用{o}胭脂红{}能力。
|tip 它会以按钮的形式出现在屏幕上。
step
kill Ren'khat##222152 |q 81685/1 |goto Azj-Kahet/0 74.36,40.29
kill Grand Overspinner Antourix##225263 |q 81685/2 |goto Azj-Kahet/0 74.36,40.29
|tip 建筑内部
step
label "Slay_Dyeworks_Nerubians"
杀死周围的敌人
杀死 #8# 耐鲁比安人 |q 81687/1 |goto Azj-Kahet/0 73.58,41.44
'|kill Carmine Alchemist##222124, Cupric Alchemist##222121, Gaudy Web-Vandal##224567, Ochre Alchemist##222123, Spinneret Scuttler##221852, Spinneret Silkbearer##221939, Violet Alchemist##222117
step
talk Teth##222136
turnin Azj-Kahet's Next Top Dyemaster##81685 |goto Azj-Kahet/0 69.73,47.97
turnin I Expect You To Dye##81687 |goto Azj-Kahet/0 69.73,47.97
accept That's All##81688 |goto Azj-Kahet/0 69.73,47.97
step
talk Widow Arak'nai##207471
告诉她_"我需要向您报告城里发生的事情。 |gossip 120666
向编织者报告 |q 78248/1 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin What We Still Have##78248 |goto Azj-Kahet/0 55.73,43.84
turnin That's All##81688 |goto Azj-Kahet/0 55.73,43.84
accept Uniting Severed Threads##84022 |goto Azj-Kahet/0 55.73,43.84
step
click General's Shadecaster
激活将军的暗影使者 |q 84022/1 |goto Azj-Kahet/0 55.50,43.79
step
click Vizier's Shadecaster
启动大臣的遮蔽者 |q 84022/2 |goto Azj-Kahet/0 55.53,44.02
step
talk Widow Arak'nai##207471
选择_“<开始断线会议>”_ |gossip 123526
与编织者对话，开始会议 |q 84022/3 |goto Azj-Kahet/0 55.73,43.84
step
观看对话
见证断裂之线的形成 |q 84022/4 |goto Azj-Kahet/0 55.73,43.84
step
talk Widow Arak'nai##207471
turnin Uniting Severed Threads##84022 |goto Azj-Kahet/0 55.73,43.84
step
talk Ag'thax##217255
accept Spiders!##79954 |goto Nerub'ar/1 77.37,68.51
step
进入地下洞穴 |goto Nerub'ar/0 71.79,57.09 < 30 |walk
click Missing Key
|tip 在地下洞穴里
collect High Hollows Key##216688 |q 79954/1 |goto Nerub'ar/0 68.20,55.83
step
talk Albert##217640
|tip 在地下洞穴里
accept ...And Now I'm Arachnophobic##79955 |goto Nerub'ar/0 66.77,54.89
step
clicknpc Lost Companion##218055
|tip 在地下洞穴里
检查失落的同伴 |q 79955/1 |goto Nerub'ar/0 65.01,55.23 |count 1
step
clicknpc Lost Companion##218055
|tip 在地下洞穴里
检查失落的同伴 |q 79955/1 |goto Nerub'ar/0 66.94,56.97 |count 2
step
clicknpc Lost Companion##218055
|tip 在地下洞穴里
检查失落的同伴 |q 79955/1 |goto Nerub'ar/0 65.95,58.60 |count 3
step
clicknpc Lost Companion##218055
|tip 在地下洞穴里
检查失落的同伴 |q 79955/1 |goto Nerub'ar/0 69.49,60.32 |count 4
step
clicknpc Lost Companion##218055
|tip 在地下洞穴里
检查失落的同伴 |q 79955/1 |goto Nerub'ar/0 71.05,64.63 |count 5
step
talk Albert##217640
|tip 在地下洞穴里
turnin ...And Now I'm Arachnophobic##79955 |goto Nerub'ar/0 69.99,63.34
accept Legs in the Ceiling##79956 |goto Nerub'ar/0 69.99,63.34
step
click Web Strand
|tip 在地下洞穴里
杀死攻击的敌人
kill Scalpel of Xishirra##218065 |q 79956/2 |goto Nerub'ar/0 70.08,62.80
'|kill Xesh Cavewalker##218014, Xesh Hatchling##218066
step
观看对话
|tip 在地下洞穴里
talk Albert##217994
turnin Legs in the Ceiling##79956 |goto Nerub'ar/0 68.67,62.26
accept Maggots in your Eyes##79957 |goto Nerub'ar/0 68.67,62.26
step
离开地下洞穴 |goto Nerub'ar/0 71.79,57.09 < 30 |walk |only if subzone("Pillar-nest Xesh") and indoors()
talk Ag'thax##217255
|tip 平台上
turnin Spiders!##79954 |goto Nerub'ar/1 77.37,68.51
step
talk Orator Tx'itk##219357
|tip 建筑内部
accept Social Clues##80203 |goto Nerub'ar/1 71.46,44.50
step
观看对话
talk Profiteer Z'kaxt##219375
选择 _“<询问有关地方长官的传闻>”_ |gossip 121667
与暴发户 Z'kaxt 交谈 |q 80203/1 |goto Nerub'ar/1 71.41,34.87
step
观看对话
|tip 建筑内部
talk Tox##219373
选择 _“<询问有关地方长官的传闻>”_ |gossip 121666
与托克斯交谈 |q 80203/3 |goto Nerub'ar/1 71.33,28.90
step
观看对话
|tip 建筑内部
talk Van'atka##219374
选择 _“<打听关于傀儡师的传闻>”_ |gossip 121668
与范阿特卡对话 |q 80203/5 |goto Nerub'ar/1 67.01,32.23
step
观看对话
talk Duelist Kahtex##219372
选择 _“<打听关于傀儡师的传闻>”_ |gossip 121669
与决斗者 Kahtex 交谈 |q 80203/7 |goto Nerub'ar/1 65.90,40.32
step
talk Orator Tx'itk##221092
turnin Social Clues##80203 |goto Nerub'ar/1 65.77,40.08
accept Espionage and Ventriloquism##80204 |goto Nerub'ar/1 65.77,40.08
step
观看对话
|tip 建筑内部
调查傀儡大师的工作室 |q 80204/1 |goto Nerub'ar/1 65.37,43.11
step
click Web Scraps+
|tip 它们看起来像{o}巨大的白色土丘{}。
|tip 建筑内部
清除 #4# 网络碎片 |q 80204/2 |goto Nerub'ar/1 65.89,42.98
step
click Suspicious Syringe
|tip 建筑内部
携带可疑注射器 |havebuff Carrying Suspicious Syringe##443561 |goto Nerub'ar/1 65.93,44.11 |q 80204
step
click Suspicious Syringe
|tip 建筑内部
整理用品 |q 80204/3 |goto Nerub'ar/1 65.70,41.76 |count 1
step
click Web Spool
|tip 建筑内部
携带线轴 |havebuff Carrying Web Spool##443419 |goto Nerub'ar/1 66.00,41.85 |q 80204
step
click Web Spool
|tip 建筑内部
整理用品 |q 80204/3 |goto Nerub'ar/1 65.49,44.29 |count 2
step
click Sewing Shear
|tip 建筑内部
携带缝纫剪 |havebuff Carrying Sewing Shear##443562 |goto Nerub'ar/1 65.19,43.99 |q 80204
step
click Sewing Shear
|tip 建筑内部
整理用品 |q 80204/3 |goto Nerub'ar/1 66.46,43.59 |count 3
step
click Paralytic Draught##439611
|tip 建筑内部
collect Paralytic Draught##219443 |q 80204/4 |goto Nerub'ar/1 66.52,43.47
step
麻痹 #12# 不安的害虫 |q 80204/5 |goto Nerub'ar/1 65.88,42.98
|tip 对{o}不安定的害虫{}使用{o}投掷麻痹药水{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 它们看起来像{o}小蛴螬{}。
|tip 建筑内部
'|clicknpc Unsettled Vermin##219388
step
talk Orator Tx'itk##221093
|tip 建筑内部
turnin Espionage and Ventriloquism##80204 |goto Nerub'ar/1 65.61,42.31
accept Marionette Mercy##80206 |goto Nerub'ar/1 65.61,42.31
step
click Antiparalytic Serum##439466
|tip 建筑内部
collect Antiparalytic Serum##219385 |q 80206/1 |goto Nerub'ar/1 65.61,41.74
step
click Incomplete Puppet##221702
|tip 建筑内部
治愈不完整的木偶 |q 80206/2 |goto Nerub'ar/1 65.96,41.83 |count 1
step
clicknpc Incomplete Puppet##224772
|tip 建筑内部
治愈不完整的木偶 |q 80206/2 |goto Nerub'ar/1 66.62,42.57 |count 2
step
clicknpc Incomplete Puppet##224773
|tip 建筑内部
治愈不完整的木偶 |q 80206/2 |goto Nerub'ar/1 66.34,43.55 |count 3
step
clicknpc Incomplete Puppet##224774
|tip 建筑内部
治愈不完整的木偶 |q 80206/2 |goto Nerub'ar/1 65.98,44.12 |count 4
step
talk Orator Tx'itk##221093
|tip 建筑内部
turnin Marionette Mercy##80206 |goto Nerub'ar/1 65.61,42.32
accept Pulling Strings##80205 |goto Nerub'ar/1 65.61,42.32
step
观看对话
|tip 建筑内部
在木偶大师剧院与演说家特克斯伊特克会面 |q 80205/1 |goto Nerub'ar/1 61.26,48.83
step
talk Orator Tx'itk##221094
|tip 建筑内部
选择 _“<开始表演.>”_ |gossip 121776
与 Orator Tx'itk 交谈 |q 80205/2 |goto Nerub'ar/1 61.26,48.83
step
观看对话
|tip 建筑内部
聆听傀儡师的问候语 |q 80205/3 |goto Nerub'ar/1 62.05,48.86
step
杀死周围的敌人
|tip 建筑内部
杀死 #12# 木偶 |q 80205/4 |goto Nerub'ar/1 62.05,48.86
'|kill Civilian Puppet##219495, Nerubian Puppet##221514
step
clicknpc High Elevator Etak'kaht##221096
|tip 建筑内部
营救高空电梯 Etak'kaht |q 80205/5 |goto Nerub'ar/1 62.14,48.84
step
返回治安官办公室 |q 80205/6 |goto Nerub'ar/1 71.48,45.63
|tip 建筑内部
step
talk Orator Tx'itk##221088
|tip 建筑内部
turnin Pulling Strings##80205 |goto Nerub'ar/1 71.48,45.63
step
talk Pathfinder Jeb##211708
turnin Maggots in your Eyes##79957 |goto Azj-Kahet/0 59.31,19.21
step
talk Widow Arak'nai##207471
accept Saving Private Spindle##83276 |goto Azj-Kahet/0 55.73,43.84
|only if level >= 80
step
在高处的空洞中找到斯宾德 |q 83276/1 |goto Nerub'ar/1 87.79,59.31
|tip 在悬空建筑里
|only if level >= 80
step
click Cage
|tip 在悬空建筑里
释放纺锤 |q 83276/2 |goto Nerub'ar/1 87.79,59.31
|only if level >= 80
step
talk Spindle##226019
|tip 在悬空建筑里
turnin Saving Private Spindle##83276 |goto Nerub'ar/1 87.79,59.31
accept Personal Pilfering##83277 |goto Nerub'ar/1 87.79,59.31
|only if level >= 80
step
click Dishevelled Cabinet##422275
|tip 在悬空建筑里
收集罪证 |q 83277/1 |goto Nerub'ar/1 88.26,59.32 |count 1
|only if level >= 80
step
click Dingy Shadecaster##422146
|tip 在悬空建筑里
收集罪证 |q 83277/1 |goto Nerub'ar/1 88.09,58.33 |count 2
|only if level >= 80
step
click Worn Scroll-Reader##422274
|tip 在悬空建筑里
收集罪证 |q 83277/1 |goto Nerub'ar/1 87.89,58.09 |count 3
|only if level >= 80
step
talk Widow Arak'nai##207471
turnin Personal Pilfering##83277 |goto Azj-Kahet/0 55.73,43.84
accept Advance to Faerin##82248 |goto Azj-Kahet/0 55.73,43.84 |only if not (haveq(81929) or completedq(81929))
|only if level >= 80
step
talk Faerin Lothar##211409
turnin Advance to Faerin##82248 |goto Azj-Kahet/0 59.37,19.36 |only if not (haveq(81929) or completedq(81929))
accept Here's the Plan##81929 |goto Azj-Kahet/0 59.37,19.36
|only if level >= 80
step
talk Faerin Lothar##211409
问她 _“计划是什么？”_ |gossip 122308
与费林-洛塔对话 |q 81929/1 |goto Azj-Kahet/0 59.37,19.36
|only if level >= 80
step
观看对话
听费林说话 |q 81929/2 |goto Azj-Kahet/0 59.37,19.36
|only if level >= 80
step
clicknpc Faerin's Shield##227076
携带花琳的盾牌 |q 81929/3 |goto Azj-Kahet/0 59.34,19.46
|only if level >= 80
step
talk Faerin Lothar##211409
选择 _"<把她的盾牌交给 Faerin。 |gossip 122311
归还花琳的盾牌 |q 81929/4 |goto Azj-Kahet/0 59.37,19.36
|only if level >= 80
step
click Bag of Betelsnax
取回贝特斯纳克斯之袋 |q 81929/5 |goto Azj-Kahet/0 59.07,18.86
|only if level >= 80
step
talk Faerin Lothar##211409
turnin Here's the Plan##81929 |goto Azj-Kahet/0 59.37,19.36
accept To Arathi's End##81945 |goto Azj-Kahet/0 59.37,19.36
|only if level >= 80
step
talk Monte Gazlowe##221977
turnin To Arathi's End##81945 |goto Azj-Kahet/0 63.75,17.91
accept BOOM Treats!##81950 |goto Azj-Kahet/0 63.75,17.91
|only if level >= 80
step
_Next to you:_
talk Faerin Lothar
accept Invasion Disruption##81965
accept The Blacksmith's Fate##81964
'|talk Faerin Lothar##221980
|only if level >= 80
stickystart "Destroy_Nerubian_Ballistae"
stickystart "Disrupt_Arathis_End"
step
talk Sir Ashrealm##223353
问他 _"她和我在一起。我们在找铁匠 Ryton Blackholme。你见过他吗？ |gossip 122364
问他_“这个铁匠还活着吗？”_ |gossip 122369
问他_"先生 先生” |gossip 122370
找到幸存者 |q 81964/1 |goto Azj-Kahet/0 65.81,14.24
|only if level >= 80
step
kill Mother Aza'na##222180 |q 81964/2 |goto Azj-Kahet/0 65.68,3.29
|tip 小山洞内
|only if level >= 80
step
kill Anub'ilith##222185 |q 81964/3 |goto Azj-Kahet/0 59.30,12.99
|only if level >= 80
step
collect Blacksmith's Breastplate##223157 |q 81964/4 |goto Azj-Kahet/0 59.30,12.99
|tip {在你刚刚杀死它的地方掠夺阿努比利斯
|only if level >= 80
step
_Next to you:_
talk Faerin Lothar
turnin The Blacksmith's Fate##81964
'|talk Faerin Lothar##221980
|only if level >= 80
step
label "Destroy_Nerubian_Ballistae"
clicknpc Nerubian Ballista##222007+
|tip 它们看起来像大炮
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
摧毁 #5# 努鲁比亚弩炮 |q 81950/1 |goto Azj-Kahet/0 63.31,7.21
|only if level >= 80
step
_Next to you:_
talk Monte Gazlowe
turnin BOOM Treats!##81950
'|talk Monte Gazlowe##221982
|only if level >= 80
step
label "Disrupt_Arathis_End"
杀死周围的敌人
clicknpc Arathi Prisoner##222119+
|tip 它们看起来像白色的蠕动蚕茧
click Nerubian Burrow+
|tip 它们看起来像{o}裂开的大土堆{}。
破坏阿拉提的终点 |q 81965/1 |goto Azj-Kahet/0 63.34,7.00
'|kill Battlefront Hauler##222719, Crimson Deathweaver##222692, Skitterling Soldier##222724, Sureki Priestess##222688, Sureki Raider##222677, Sureki Warrior##222693, Toxic Swarmite##222721, Venomous Flyer##222722
|only if level >= 80
step
_Next to you:_
talk Faerin Lothar
turnin Invasion Disruption##81965
accept An End to the End##81969
'|talk Faerin Lothar##221980
|only if level >= 80
step
飞起来，进入洞穴 |goto Azj-Kahet/0 64.38,0.64 < 50 |q 81969
|tip 进入洞穴后，路标箭头就失效了
|only if level >= 80
step
talk Faerin Lothar##223507
|tip {沿着东边的路{}去找她。
|tip 在洞穴里面。
告诉她_“让我们结束这一切吧！”_ |gossip 122400
|tip 如果她已经在附近战斗，你{o}可能无法和她交谈{}。
|tip 她会帮你对付附近的敌人。
kill Surek'Tak the Sundered##222190 |q 81969/1
|tip 对他使用{o}火球术！{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|only if level >= 80
step
talk Faerin Lothar##223467
|tip {沿着小路向西{}去找她。
turnin An End to the End##81969
accept The Sorrowful Journey Home##82268
|only if level >= 80
step
穿越阿拉提的尽头前往万圣节降临 |complete zone("Hallowfall") |q 82268
|tip {向西飞向地图上的黄点。
|only if level >= 80
step
talk Faerin Lothar##220406
turnin The Sorrowful Journey Home##82268 |goto Hallowfall/0 43.24,56.30
accept Remembrance for the Fallen##82284 |goto Hallowfall/0 43.24,56.30
|only if level >= 80
step
use the Breastplate and Tinderbox##223515
将胸甲和火药盒放入锻造场 |q 82284/1 |goto Hallowfall/0 43.33,56.41
|only if level >= 80
step
talk Faerin Lothar##220406
turnin Remembrance for the Fallen##82284 |goto Hallowfall/0 43.24,56.30
|only if level >= 80
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The War Within Campaign",{
author="support@zygorguides.com",
},[[
step
完成多恩岛的故事情节 |complete completedq(78546)
完成响铃深渊的剧情 |complete completedq(81689)
完成万圣降临剧情 |complete completedq(78630)
完成 Azj-Kahet 故事情节 |complete completedq(84022)
|tip 使用{o}“内战 ”等级提升指南{}来完成这项任务。
|tip 你可以使用{o}仅限故事{}或{o}完整区域{}向导。
|only if not (haveq(84365) or completedq(84365))
step
talk Brann Bronzebeard##206017
|tip 建筑内部
turnin Something on the Horizon##84365 |goto Dornogal/0 47.39,44.41
|only if haveq(84365) or completedq(84365)
step
talk Alleria Windrunner##219252
accept Surface Bound##79197 |goto Azj-Kahet/0 55.62,44.20
step
进入多诺加尔传送门 |q 79197/2 |goto Azj-Kahet/0 57.48,41.61
|tip 走进漩涡传送门。
step
在多诺加尔与莫伊拉-陶里森会面 |q 79197/1 |goto Dornogal/0 36.13,80.35
step
talk Moira Thaurissan##216149
turnin Surface Bound##79197 |goto Dornogal/0 36.13,80.35
accept Renown of Khaz Algar##84446 |goto Dornogal/0 36.13,80.35
step
talk Faerin Lothar##223875
turnin Renown of Khaz Algar##84446 |goto Dornogal/0 46.08,49.62
step
ding 80
step
与所有派别一起达到声望 4 级 |complete factionrenown(2590) >= 4 and factionrenown(2570) >= 4 and factionrenown(2594) >= 4 and factionrenown(2600) >= 4
|tip 完成卡兹阿尔加每个区域的世界任务和完整区域指南。
|tip 你需要通过多诺加尔议会、深渊集会、万圣降临阿拉提和断丝达到 4 级声望。
step
talk Moira Thaurissan##216149
accept The Fleet Arrives##79333 |goto Dornogal/0 36.13,80.35
step
click Telescope
使用望远镜 |q 79333/1 |goto Dornogal/0 35.13,80.28
step
talk Moira Thaurissan##216149
告诉她_"联盟和部落到了。 |gossip 121591
向莫伊拉报告 |q 79333/2 |goto Dornogal/0 36.13,80.34
step
观看对话
talk Lady Jaina Proudmoore##216168
turnin The Fleet Arrives##79333 |goto Dornogal/0 35.88,81.49
accept Embassies and Envoys##82153 |goto Dornogal/0 35.88,81.49
|only if Alliance
step
talk Dornogal Steward##220963
告诉他_"我是来帮助准备大使馆的。 |gossip 122277
在多诺加尔找到联盟大使馆管家 |q 82153/1 |goto Dornogal/0 30.33,56.01
|only if Alliance
step
click Alliance Banner
插上联盟旗帜 |q 82153/2 |goto Dornogal/0 30.13,56.50 |count 1
|only if Alliance
step
click Alliance Banner
插上联盟旗帜 |q 82153/2 |goto Dornogal/0 30.65,55.71 |count 2
|only if Alliance
step
click Small Alliance Banner
|tip 建筑内部
把装饰品放在里面 |q 82153/3 |goto Dornogal/0 28.85,51.06 |count 1
|only if Alliance
step
click Supplies
|tip 建筑内部
把装饰品放在里面 |q 82153/3 |goto Dornogal/0 27.84,49.91 |count 2
|only if Alliance
step
click Alliance Weapon Rack
|tip 建筑内部
把装饰品放在里面 |q 82153/3 |goto Dornogal/0 27.60,49.85 |count 3
|only if Alliance
step
click Large Alliance Banner
|tip 建筑内部
把装饰品放在里面 |q 82153/3 |goto Dornogal/0 27.38,50.00 |count 4
|only if Alliance
step
click Large Alliance Banner
|tip 建筑内部
把装饰品放在里面 |q 82153/3 |goto Dornogal/0 26.35,51.58 |count 5
|only if Alliance
step
talk Dornogal Steward##221143
|tip 建筑内部
问他_“你想让我签什么东西？”_ |gossip 121721
选择 _“{_G.UnitName(”玩家“)}.”_ |gossip 122278
签署文件 |q 82153/4 |goto Dornogal/0 28.35,53.05
|only if Alliance
step
talk Moira Thaurissan##214917
turnin Embassies and Envoys##82153 |goto Dornogal/0 31.78,59.35
|only if Alliance
step
观看对话
talk Thrall##216167
turnin The Fleet Arrives##79333 |goto Dornogal/0 36.19,81.54
accept Embassies and Envoys##79328 |goto Dornogal/0 36.19,81.54
|only if Horde
step
talk Dornogal Steward##220963
告诉他_"我是来帮助准备大使馆的。 |gossip 121623
在多诺加尔找到部落大使馆管家 |q 79328/1 |goto Dornogal/0 30.34,63.25
|only if Horde
step
click Horde Banner
放置部落旗帜 |q 79328/2 |goto Dornogal/0 30.66,63.57 |count 1
|only if Horde
step
click Horde Banner
放置部落旗帜 |q 79328/2 |goto Dornogal/0 30.14,62.78 |count 2
|only if Horde
step
click Small Horde Banner
|tip 建筑内部
把装饰品放在里面 |q 79328/3 |goto Dornogal/0 27.03,65.48 |count 1
|only if Horde
step
click Strongbox
|tip 建筑内部
把装饰品放在里面 |q 79328/3 |goto Dornogal/0 26.23,67.09 |count 2
|only if Horde
step
click Weapon Rack
|tip 建筑内部
把装饰品放在里面 |q 79328/3 |goto Dornogal/0 26.31,67.33 |count 3
|only if Horde
step
click Large Horde Banner
|tip 建筑内部
把装饰品放在里面 |q 79328/3 |goto Dornogal/0 26.33,67.69 |count 4
|only if Horde
step
click Large Horde Banner
|tip 建筑内部
把装饰品放在里面 |q 79328/3 |goto Dornogal/0 27.37,69.24 |count 5
|only if Horde
step
talk Dornogal Steward##221143
|tip 建筑内部
问他_“你想让我签什么东西？”_ |gossip 121721
选择 _“{_G.UnitName(”玩家“)}.”_ |gossip 121722
签署文件 |q 79328/4 |goto Dornogal/0 28.36,66.23
|only if Horde
step
talk Moira Thaurissan##214917
turnin Embassies and Envoys##79328 |goto Dornogal/0 31.78,59.35
|only if Horde
step
talk Moira Thaurissan##214917
accept There's Always Another Secret##83271 |goto Dornogal/0 31.78,59.35
step
talk Dagran Thaurissan II##217859
|tip 建筑内部
告诉他_“我准备好了”_ |gossip 122851
与达格兰-陶里森二世对话 |q 83271/1 |goto Dornogal/0 29.76,59.97
step
click Deactivated Waygate
|tip 建筑内部
选择_“<轻轻点击航路点的中心点>”_ |gossip 122852
激活道门 |q 83271/2 |goto Dornogal/0 29.77,59.67
step
click Deactivated Waygate
|tip 建筑内部
使用道门 |q 83271/3 |goto Dornogal/0 29.77,59.67
step
talk High Speaker Brinthe##226040
turnin There's Always Another Secret##83271 |goto Vault of Memory/0 49.89,60.73
accept What's Hidden Beneath Dornogal##83286 |goto Vault of Memory/0 49.89,60.73
step
click Central Archives Console
选择 _"<尝试重启控制台。 |gossip 122926
解决谜题
|tip 点击{o}蓝色球体{}来{o}交换它们{}，使{o}线成为水平线{}。
重启中央控制台 |q 83286/1 |goto Vault of Memory/0 49.85,63.66
step
talk High Speaker Brinthe##226040
turnin What's Hidden Beneath Dornogal##83286 |goto Vault of Memory/0 49.90,60.69
accept Preparing for the Unknown##83315 |goto Vault of Memory/0 49.90,60.69
step
talk Moira Thaurissan##214917
turnin Preparing for the Unknown##83315 |goto Dornogal/0 31.78,59.35
accept Urban Odyssey##79344 |goto Dornogal/0 31.78,59.35
step
talk Brann Bronzebeard##206017
|tip 建筑内部
找到德尔弗总部 |q 79344/1 |goto Dornogal/0 47.40,44.41
step
talk Vaskarn##219226
|tip 建筑内部
找到物品升级和头盔兑换商 |q 79344/3 |goto Dornogal/0 52.08,42.23
step
找到声望守护者 |q 79344/2 |goto Dornogal/0 39.09,24.16
|tip 建筑内部
step
talk Moira Thaurissan##214917
turnin Urban Odyssey##79344 |goto Dornogal/0 31.77,59.36
step
talk Alleria Windrunner##223944
accept After the Storm##79107 |goto Dornogal/0 31.54,59.66
step
talk Stormrider Meirand##214965
问她_"你还好吗？ |gossip 121930
问她_“外面发生了什么事？”_ |gossip 121934
评估风暴骑士 |q 79107/1 |goto Dornogal/0 38.28,70.65 |count 1
step
talk Stormrider Vokmar##214966
问他_“你还好吗？”_ |gossip 121936
问他 "就剩你们四个了吗” |gossip 121948
评估风暴骑士 |q 79107/1 |goto Dornogal/0 38.29,70.87 |count 2
step
talk Stormrider Edeltrau##214964
问她 "你还好吗？” |gossip 121935
问她 "暴风咆哮者是从哪里来的？” |gossip 121943
评估风暴骑士 |q 79107/1 |goto Dornogal/0 38.29,71.11 |count 3
step
talk Stormrider Hunfrid##220669
问他_"你好？ |gossip 121937
贝尔格林会告诉别人如何召唤风暴蛙吗？ |gossip 121938
评估风暴骑士 |q 79107/1 |goto Dornogal/0 38.39,71.15 |count 4
step
talk Rooktender Lufsela##222279
问她 "你知道怎么找到更多风暴蛙吗？” |gossip 122017
询问露芙塞拉 |q 79107/2 |goto Dornogal/0 38.33,71.70
step
talk Rooktender Lufsela##215039
turnin After the Storm##79107 |goto Dornogal/0 37.45,82.17
accept Dhar Oztan##81914 |goto Dornogal/0 37.45,82.17
step
talk Olbarig##214995
turnin Dhar Oztan##81914 |goto Isle of Dorn/0 28.54,61.01
accept Conduit of the Southern Storm##79124 |goto Isle of Dorn/0 28.54,61.01
step
click Storage Chest
|tip 楼内楼上
选择 _“<打开箱子>”_ |gossip 122158
collect Conduit of the Southern Storm##218455 |q 79124/2 |goto Isle of Dorn/0 27.79,59.70
step
talk Rooktender Lufsela##215039
turnin Conduit of the Southern Storm##79124 |goto Isle of Dorn/0 27.64,60.49
step
talk Olbarig##214995
accept Charging Up That Hill##79475 |goto Isle of Dorn/0 27.64,60.53
accept Heeding the Call##79476 |goto Isle of Dorn/0 27.64,60.53
stickystart "Charge_The_Conduit"
step
clicknpc Stranded Pilgrim##217758+
|tip 他们看起来像{o}害怕的矮人{}。
帮助 #8# 搁浅的土人 |q 79476/1 |goto Isle of Dorn/0 26.76,57.69
step
label "Charge_The_Conduit"
杀死周围的敌人
给导管充电 |q 79475/1 |goto Isle of Dorn/0 27.03,57.55
'|kill Charged Spirecrystal##217736, Charged Storm Wolf##217735, Stirred Cobblestone##217738
step
talk Rooktender Lufsela##215039
turnin Charging Up That Hill##79475 |goto Isle of Dorn/0 25.62,57.21
turnin Heeding the Call##79476 |goto Isle of Dorn/0 25.62,57.21
accept Rook Rally##79129 |goto Isle of Dorn/0 25.62,57.21
step
杀死攻击的敌人
保护仪式 |q 79129/1 |goto Isle of Dorn/0 24.98,58.40
'|kill Rampant Air Elemental##215048, Rampant Thunder Elemental##222888
step
talk Rooktender Lufsela##215039
选择 _“<提供你的力量.>”_ |gossip 120784
鼓励路夫塞拉 |q 79129/2 |goto Isle of Dorn/0 24.91,58.61
step
talk Thrall##214919
turnin Rook Rally##79129 |goto Isle of Dorn/0 27.81,60.81
accept Ground Pounders##79146 |goto Isle of Dorn/0 27.81,60.81
step
talk Adelgonn##215277
turnin Ground Pounders##79146 |goto Isle of Dorn/0 33.32,63.32
step
talk Overlord Geya'rah##215187
accept Goldbricking##79140 |goto Isle of Dorn/0 33.28,63.32
step
talk High Exarch Turalyon##223205
accept Metal and Stone##79145 |goto Isle of Dorn/0 33.33,63.38
step
观看对话
|tip {o}戊土受训者{}走到建筑物前。
|tip {平反者杰拉娜{}会告诉他们每人去拿一种{o}特定类型的武器{}。
|tip 点击附近{o}符合她所说武器类型{}的{o}架。
武装 #10# 土人受训者 |q 79145/1 |goto Isle of Dorn/0 34.24,63.73
'|clicknpc Vindicator Jaelaana##223197
step
talk Undisciplined Earthen##218118+
告诉他_“我们比试一下吧！”_ |gossip 120807
kill Undisciplined Earthen##218118+
与 8#不守纪律的土人比武 |q 79140/1 |goto Isle of Dorn/0 33.92,62.34
'|talk Undisciplined Earthen##218119
step
talk Overlord Geya'rah##215187
turnin Goldbricking##79140 |goto Isle of Dorn/0 33.28,63.32
step
talk High Exarch Turalyon##223205
turnin Metal and Stone##79145 |goto Isle of Dorn/0 33.33,63.38
step
talk Adelgonn##215277
accept Home to Roost##81915 |goto Isle of Dorn/0 33.31,63.32
step
talk Rooktender Lufsela##215039
turnin Home to Roost##81915 |goto Isle of Dorn/0 28.99,61.74
accept Strays##79477 |goto Isle of Dorn/0 28.99,61.74
step
talk Stormrider Kothilde##218745
告诉她_“达尔奥兹坦需要你”_ Tell her _“You're needed back at Dhar Oztan.” _ |gossip 120979
找到流浪新兵 |q 79477/1 |goto Isle of Dorn/0 31.47,56.35 |count 1
step
talk Stormrider Adalar##218744
告诉他_“达尔奥兹坦需要你回去”_ |gossip 120968
找到流浪新兵 |q 79477/1 |goto Isle of Dorn/0 23.47,51.07 |count 2
step
talk Stormrider Gurnot##218743
告诉他_“达尔奥兹坦需要你回去”_ |gossip 120977
找到流浪新兵 |q 79477/1 |goto Isle of Dorn/0 23.66,67.14 |count 3
step
talk Kurdran Wildhammer##215211
turnin Strays##79477 |goto Isle of Dorn/0 29.07,61.59
accept Flight Training 101##79147 |goto Isle of Dorn/0 29.07,61.59
step
观看对话
目睹 “路克 ”超能 |q 79147/1 |goto Isle of Dorn/0 28.94,61.61
step
clicknpc Shraubendre##217835
告诉他_“（天空骑行）听我指挥，肖本德雷”_
|tip 你可以选择{o}其他对话选项{}来更轻松地完成{o}任务目标{}。
登上施劳本德尔山 |q 79147/2 |goto Isle of Dorn/0 28.94,61.61
step
完成操纵课程 |q 79147/3
|tip 沿着{o}线迹{}，{o}飞过圆环{}。
step
talk Kurdran Wildhammer##215211
turnin Flight Training 101##79147 |goto Isle of Dorn/0 35.02,72.22
accept Flight Training 102##81912 |goto Isle of Dorn/0 35.02,72.22
step
clicknpc Shraubendre##223762
告诉他_“（天空骑行）听我指挥，肖本德雷”_
|tip 你可以选择{o}其他对话选项{}来更轻松地完成{o}任务目标{}。
登上施劳本德尔山 |havebuff Algarian Stormrider##417888 |goto Isle of Dorn/0 34.94,72.10 |or |q 81912
'|invehicle |or |q 81912
step
击中 15# 个目标 |q 81912/1 |goto Isle of Dorn/0 50.62,69.97
|tip “{o}按照屏幕上的指示{}，利用你的{o}滑行能力{}射击{o}目标{}。
|tip “使用操作栏上的能力在飞行过程中射击目标。
|tip 它们在空中看起来就像{o}巨大的蓝色牛眼目标符号{}。
step
talk Kurdran Wildhammer##215211
turnin Flight Training 102##81912 |goto Isle of Dorn/0 61.75,65.52
accept Flight Training 103##81913 |goto Isle of Dorn/0 61.75,65.52
step
clicknpc Shraubendre##223762
告诉他_“（天空骑行）听我指挥，肖本德雷”_
|tip 你可以选择{o}其他对话选项{}来更轻松地完成{o}任务目标{}。
登上施劳本德尔山 |havebuff Algarian Stormrider##417888 |goto Isle of Dorn/0 61.62,65.41 |or |q 81913
'|invehicle |or |q 81913
step
炸毁 #50# 个沙雷莫 |q 81913/1 |goto Isle of Dorn/0 69.03,70.50
|tip “{o}按照屏幕上的指示{}，利用你的{o}滑翔能力{}射击{o}Tiderusher Shalemaws{}。
|tip “使用操作栏上的能力，在飞行过程中{o}射击Tiderusher Shalemaws{}。
'|kill Tiderusher Shalemaw##220887
step
talk Olbarig##214995
turnin Flight Training 103##81913 |goto Isle of Dorn/0 75.97,39.88
accept Paying Respects##79480 |goto Isle of Dorn/0 75.97,39.88
step
kill 8 Faithful of Zirix##216938 |q 79480/1 |goto Isle of Dorn/0 75.93,37.07
step
talk Olbarig##214995
turnin Paying Respects##79480 |goto Isle of Dorn/0 76.56,35.67
accept The Edicts##79156 |goto Isle of Dorn/0 76.56,35.67
step
talk Merrix##214916
告诉他_“报告情况”_ |gossip 121537
向梅里克斯报告 |q 79156/1 |goto Isle of Dorn/0 57.06,50.52
step
talk Merrix##214916
turnin The Edicts##79156 |goto Isle of Dorn/0 57.06,50.52
accept Titanic Failsafe##79157 |goto Isle of Dorn/0 57.06,50.52
step
clicknpc Shraubendre##223764
告诉他_“（天空骑行）听我指挥，肖本德雷”_
|tip 你可以选择{o}其他对话选项{}来更轻松地完成{o}任务目标{}。
登上施劳本德尔山 |havebuff Algarian Stormrider##417888 |goto Isle of Dorn/0 57.25,50.70 |or |q 79157
'|invehicle |or |q 79157
step
kill Colossal Titan Construct##212213 |q 79157/2 |goto Isle of Dorn/0 59.16,74.45
|tip “{o}按照屏幕上的指示{}，使用你的{o}滑行能力{}射击{o}巨型泰坦建筑{}。
|tip “使用操作栏上的能力，在飞行过程中{o}射击巨型泰坦建筑{}。
step
talk Alleria Windrunner##223944
turnin Titanic Failsafe##79157 |goto Dornogal/0 31.54,59.65
accept Gathering Intel##79224 |goto Dornogal/0 31.54,59.65
step
talk Widow Arak'nai##207471
turnin Gathering Intel##79224 |goto Azj-Kahet/0 55.73,43.84
accept A Spider's-Eye View##79227 |goto Azj-Kahet/0 55.73,43.84
step
clicknpc General's Scouting Shadecaster##220665
|tip 在塔顶。
侦查东跨度 |q 79227/2 |goto Azj-Kahet/0 64.18,74.20
step
clicknpc Weaver's Scouting Shadecaster##224205
|tip 在塔顶。
侦查抽搐峡谷 |q 79227/3 |goto Nerub'ar/1 78.73,41.77
step
clicknpc Vizier's Scouting Shadecaster##220661
|tip 在楼顶。
侦查安布尔集市 |q 79227/1 |goto Nerub'ar/1 49.73,20.23
step
talk Lilian Voss##215626
turnin A Spider's-Eye View##79227 |goto Nerub'ar/1 69.55,71.70
accept Creeping Through Corridors##79230 |goto Nerub'ar/1 69.55,71.70
step
talk Y'tekhi##215637
accept Lab Access##79233 |goto Nerub'ar/1 69.47,72.20
step
_NOTE:_
在接下来的步骤中
|tip 使用屏幕上的{o}侵略信息素瓶{}来对付{o}巡逻守卫{}。
|tip 他们看起来像{o}敌人，头上有蓝色圆圈{}。
|tip 他们会分心
点击此处继续 |confirm |q 79230
stickystart "Collect_Loyalist_Secretions"
step
click Cannister of Vile Ooze
|tip 建筑内部
调查东部仓库 |q 79230/1 |goto Nerub'ar/1 68.64,81.55
step
click Suspicious Shipping Container
|tip 建筑内部
kill Ascension-Crazed Soldier##220090
调查中央仓库 |q 79230/2 |goto Nerub'ar/1 61.85,89.60
step
label "Collect_Loyalist_Secretions"
击杀该区域周围的忠诚者敌人
|tip 在这栋楼的四周
collect 6 Loyalist Secretions##215457 |q 79233/1 |goto Nerub'ar/1 61.99,74.43
'|kill Loyalist Bio-smith##220814, Loyalist Mutagenician##215980
step
进入建筑 |goto Nerub'ar/1 56.89,89.26 < 15 |walk
观看对话
|tip 建筑内部
调查第一升天者监狱 |q 79230/3 |goto Nerub'ar/1 56.97,93.95
step
talk Y'tekhi##215659
|tip 建筑内部
turnin Lab Access##79233 |goto Nerub'ar/1 57.09,90.99
step
talk Lilian Voss##215628
|tip 建筑内部
turnin Creeping Through Corridors##79230 |goto Nerub'ar/1 56.68,90.62
accept Making of a Monster##79237 |goto Nerub'ar/1 56.68,90.62
step
click Air Duct
|tip 在楼顶。
进入通风管道 |q 79237/1 |goto Nerub'ar/1 62.14,77.08
step
click Caustic Alchemical Supplies
|tip 建筑内部
检查苛性炼金用品 |q 79237/3 |goto Nerub'ar/1 60.96,79.01
step
click Experiment Notes
|tip 建筑内部
检查实验笔记 |q 79237/4 |goto Nerub'ar/1 63.40,78.93
step
click Discarded Shadecaster
|tip 建筑内部
调查废弃的阴影铸造器 |q 79237/5 |goto Nerub'ar/1 62.70,79.92
step
click Escape Line
|tip 建筑内部
走逃生路线 |q 79237/6 |goto Nerub'ar/1 63.13,79.57
step
talk Lilian Voss##215628
|tip 建筑内部
turnin Making of a Monster##79237 |goto Nerub'ar/1 56.68,90.61
step
talk Y'tekhi##215659
|tip 建筑内部
accept The Queen's Chains##79239 |goto Nerub'ar/1 57.10,90.99
step
clicknpc Caustic Chemicals##223696
|tip 建筑内部
收集苛性化学品 |q 79239/1 |goto Nerub'ar/1 58.18,92.32 |count 1
step
clicknpc Caustic Chemicals##223696
|tip 建筑内部
收集苛性化学品 |q 79239/1 |goto Nerub'ar/1 57.98,91.93 |count 2
step
clicknpc Caustic Chemicals##223696
|tip 建筑内部
收集苛性化学品 |q 79239/1 |goto Nerub'ar/1 55.66,92.73 |count 3
step
clicknpc Caustic Chemicals##223696
|tip 建筑内部
收集苛性化学品 |q 79239/1 |goto Nerub'ar/1 55.54,93.40 |count 4
step
clicknpc Shackle Anchor##219922
|tip 建筑内部
释放妮菲蕾丝的右腿 |q 79239/2 |goto Nerub'ar/1 58.18,93.65
step
clicknpc Shackle Anchor##224312
|tip 建筑内部
释放妮菲蕾丝的左腿 |q 79239/4 |goto Nerub'ar/1 55.81,93.68
step
clicknpc Shackle Anchor##224313
|tip 建筑内部
释放妮菲蕾丝的右臂 |q 79239/6 |goto Nerub'ar/1 57.45,92.72
step
释放妮菲蕾丝 |q 79239/8 |goto Nerub'ar/1 56.47,92.75
|tip 建筑内部
step
talk Lilian Voss##215661
turnin The Queen's Chains##79239 |goto Nerub'ar/1 78.75,57.37
accept Rogue Agent##79240 |goto Nerub'ar/1 78.75,57.37
step
kill Y'tekhi##215660
制服叶泰基 |q 79240/1 |goto Nerub'ar/1 78.13,54.86
step
将叶泰基带到安全地带 |q 79240/2 |goto Nerub'ar/1 78.64,39.60
step
talk Lilian Voss##215662
turnin Rogue Agent##79240 |goto Nerub'ar/1 78.64,39.60
accept Go Loud##79241 |goto Nerub'ar/1 78.64,39.60
accept Manufactured Mutiny##79243 |goto Nerub'ar/1 78.64,39.60
step
clicknpc Repurposed Nerubian Charge##220213
|tip 在桥上
安放炸药 |q 79241/1 |goto Azj-Kahet/0 59.38,75.06 |count 1
step
kill Siege Marshal Tekhzok##215987 |q 79243/1 |goto Azj-Kahet/0 61.14,73.47
|tip 对它使用{o}费洛蒙手雷{}能力。
|tip 它会以按钮的形式出现在屏幕上。
|tip 它在这片区域四处走动。
step
clicknpc Repurposed Nerubian Charge##220213
安放炸药 |q 79241/1 |goto Azj-Kahet/0 61.00,74.60 |count 2
step
clicknpc Repurposed Nerubian Charge##220213
安放炸药 |q 79241/1 |goto Azj-Kahet/0 61.64,72.52 |count 3
step
clicknpc Repurposed Nerubian Charge##220213
安放炸药 |q 79241/1 |goto Azj-Kahet/0 63.62,71.47 |count 4
step
clicknpc Repurposed Nerubian Charge##220213
安放炸药 |q 79241/1 |goto Azj-Kahet/0 66.48,70.59 |count 5
step
kill Royal Quartermaster Ze'erik##215988 |q 79243/2 |goto Azj-Kahet/0 66.76,69.71
|tip 对他使用 “费洛蒙手雷 ”技能
|tip 它会以按钮的形式出现在屏幕上。
|tip 他在这附近走动。
step
clicknpc Repurposed Nerubian Charge##220213
安放炸药 |q 79241/1 |goto Azj-Kahet/0 66.61,68.15 |count 6
step
clicknpc Dry Webbing##220384
点燃引信 |q 79241/2 |goto Azj-Kahet/0 67.59,64.78
step
talk Lilian Voss##215625
turnin Go Loud##79241 |goto Azj-Kahet/0 55.72,44.11
turnin Manufactured Mutiny##79243 |goto Azj-Kahet/0 55.72,44.11
accept News From Below##79244 |goto Azj-Kahet/0 55.72,44.11
step
talk Widow Arak'nai##207471
选择 _“<告知编织者你在变形神殿的发现>”_ |gossip 121590
通知编织者 |q 79244/1 |goto Azj-Kahet/0 55.73,43.84
step
向多诺加尔核心通道的艾勒瑞亚报告 |q 79244/2 |goto Dornogal/0 31.54,59.66
step
talk Alleria Windrunner##223944
turnin News From Below##79244 |goto Dornogal/0 31.54,59.66
accept A Mysterious Signal##79022 |goto Dornogal/0 31.54,59.66
step
talk High Speaker Brinthe##214663
turnin A Mysterious Signal##79022 |goto The Ringing Deeps/0 56.27,74.92
accept Small Friend, Big Plans##79023 |goto The Ringing Deeps/0 56.27,74.92
step
talk ZZ-01-47##214664
选择 _"<发出一连串声音，试图模仿她的问候。 |gossip 120640
向 ZZ-01-47 介绍自己 |q 79023/1 |goto The Ringing Deeps/0 56.29,74.90
step
talk High Speaker Brinthe##214663
turnin Small Friend, Big Plans##79023 |goto The Ringing Deeps/0 56.27,74.92
accept Factory Recon##79024 |goto The Ringing Deeps/0 56.27,74.92
step
talk ZZ-01-47##214664
告诉_"我们需要你进入 Golemworks 帮我们看看。 |gossip 121305
命令 ZZ-01-47 对设施进行侦察 |q 79024/1 |goto The Ringing Deeps/0 56.29,74.90
step
_NOTE:_
在接下来的步骤中
|tip {避开周围有蓝色圆圈的敌人。
|tip 你可以使用行动条上的{o}诱饵{}能力来分散他们的注意力。
点击此处继续 |confirm |q 79024
step
click Pipe Grate
进入管栅 |q 79024/2 |goto The Ringing Deeps/0 57.95,75.87
step
侦察黑暗引信长 |q 79024/3 |goto The Ringing Deeps/0 58.04,76.90
step
侦察制造车间 |q 79024/4 |goto The Ringing Deeps/0 56.54,77.62
|tip 建筑内部
step
click Sewer Grate
潜入管道 |q 79024/5 |goto The Ringing Deeps/0 57.22,78.30
step
侦察货舱 |q 79024/6 |goto The Ringing Deeps/0 58.13,79.85
|tip 建筑内部
step
click Pipe Exit Grate
从管道返回 |q 79024/7 |goto The Ringing Deeps/0 58.38,76.59
step
返回布林特 |q 79024/8 |goto The Ringing Deeps/0 56.27,74.92
step
talk High Speaker Brinthe##214663
turnin Factory Recon##79024 |goto The Ringing Deeps/0 56.27,74.92
accept Back to Base##79217 |goto The Ringing Deeps/0 56.27,74.92
step
在刚达加兹的家中与布林特见面 |q 79217/1 |goto The Ringing Deeps/0 47.10,34.22
|tip 建筑内部
step
talk High Speaker Brinthe##217245
|tip 建筑内部
turnin Back to Base##79217 |goto The Ringing Deeps/0 47.10,34.22
accept A Plan Comes Together##79025 |goto The Ringing Deeps/0 47.10,34.22
step
click Deactivated War Golem##215568
|tip 建筑内部
指出泥巨人工厂 |q 79025/1 |goto The Ringing Deeps/0 47.08,34.21
step
click Waterworks##417283
|tip 建筑内部
指出水厂 |q 79025/2 |goto The Ringing Deeps/0 47.08,34.23
step
click Hammer##417282
|tip 建筑内部
指出暗影森林采掘点 |q 79025/3 |goto The Ringing Deeps/0 47.06,34.23
step
talk High Speaker Brinthe##217245
|tip 建筑内部
turnin A Plan Comes Together##79025 |goto The Ringing Deeps/0 47.10,34.22
accept To the Waterworks##79324 |goto The Ringing Deeps/0 47.10,34.22
step
talk Dagran Thaurissan II##217331
turnin To the Waterworks##79324 |goto The Ringing Deeps/0 47.30,42.39
accept Putting the Works in Waterworks##79026 |goto The Ringing Deeps/0 47.30,42.39
step
talk ZZ-01-47##216137
accept Elemental Trepidation##79027 |goto The Ringing Deeps/0 47.28,42.38
stickystart "Defeat_The_Elementals"
step
click Congealed Wax
click Right Waterwheel Control Console
启动水车 |q 79026/1 |goto The Ringing Deeps/0 45.44,46.36 |count 1
step
click Congealed Wax
click Left Waterwheel Control Console
启动水车 |q 79026/1 |goto The Ringing Deeps/0 48.39,46.06 |count 2
step
label "Defeat_The_Elementals"
杀死周围的敌人
打败元素精灵 |q 79027/1 |goto The Ringing Deeps/0 47.17,44.95
'|kill Disrupted Slime##215703, Disturbed Kelp##215702
step
进入建筑 |goto The Ringing Deeps/0 46.28,48.16 < 15 |walk
进入地穴 |q 79026/2 |goto The Ringing Deeps/0 46.35,48.68
|tip 穿过{o}传送门{}进入深渊。
|tip 建筑内部
step
kill Waxface##214263
|tip 完成 {o}Waterworks{} delve 可以达到这个目的。
|tip 完成探险非常简单。
完成地穴 |q 79026/4 |goto The Waterworks/0 46.94,81.68
step
clicknpc Obstructed Drain##220374
|tip 点击后，{o}跑开{}。
kill Enraged Kelp##220542
恢复主排水沟 |q 79026/3 |goto The Waterworks/0 46.09,83.03
step
click Leave-O-Bot 7000
领取奖励后使用 “Leave-O-Bot ”离开地穴 |scenarioend |goto The Waterworks/0 46.88,90.61 |q 79026
step
离开水厂地穴 |complete not zone("The Waterworks") |goto The Waterworks/0 46.54,10.57 |q 79026
|tip 穿过{o}传送门{}离开深渊。
step
click Waterworks Primary Activation
修复水厂 |q 79026/5 |goto The Ringing Deeps/0 47.23,42.35
step
talk Dagran Thaurissan II##217331
turnin Putting the Works in Waterworks##79026 |goto The Ringing Deeps/0 47.30,42.38
turnin Elemental Trepidation##79027 |goto The Ringing Deeps/0 47.30,42.38
accept Shadowvein Extraction##79325 |goto The Ringing Deeps/0 47.30,42.38
step
talk ZZ-01-47##216140
turnin Shadowvein Extraction##79325 |goto The Ringing Deeps/0 55.69,41.09
accept We Require More Minerals##79028 |goto The Ringing Deeps/0 55.69,41.09
step
观看对话
听取达格兰的报告 |q 79028/1 |goto The Ringing Deeps/0 55.69,41.09
step
进入建筑 |goto The Ringing Deeps/0 56.42,38.57 < 15 |walk
click Power Substation Console
|tip 建筑内部
观看对话
调查 Shadowvein 变电站 |q 79028/2 |goto The Ringing Deeps/0 56.42,36.98
step
观看对话
|tip 建筑内部
找到管道室 |q 79028/3 |goto The Ringing Deeps/0 55.80,37.16
step
click Valve
|tip 它们看起来像{o}红色的轮子把手{}。
|tip 点击{o}中间的阀门{}。
|tip 建筑内部
提高压力 |havebuff Pressure Rising...##435416 |goto The Ringing Deeps/0 55.67,37.29 |q 79028
step
click Valve
|tip 它们看起来像{o}红色的轮子把手{}。
|tip 点击{o}底部阀门{}。
|tip 建筑内部
进一步提高压力 |havebuff And Rising...##435421 |goto The Ringing Deeps/0 55.66,36.96 |q 79028
step
click Valve
|tip 它们看起来像{o}红色的轮子把手{}。
|tip 点击{o}顶部阀门{}。
|tip 建筑内部
向阴影谷锅炉供水 |q 79028/4 |goto The Ringing Deeps/0 55.91,36.59
step
click Power Substation Console
|tip 建筑内部
重启变电站 |q 79028/5 |goto The Ringing Deeps/0 56.42,36.98
stickystart "Decontaminate_Infested_Crushers"
step
click Rubble
清理采矿车轨道 |q 79028/7 |goto The Ringing Deeps/0 59.27,41.11
step
label "Decontaminate_Infested_Crushers"
清除5#破碎机的污染 |q 79028/6 |goto The Ringing Deeps/0 57.85,38.54
|tip 使用{o}被侵染的破碎机{}旁边的{o}弧光发射器{}按钮。
|tip 它们看起来像{o}大型金属泵机{}。
|tip 它们会以{o}黄色小点{}的形式出现在你的{o}迷你地图{}上。
|tip 你会受到攻击。
step
_Next to you:_
talk ZZ-01-47
turnin We Require More Minerals##79028
accept The Motherlode##80145
'|talk ZZ-01-47##230643
step
进入洞穴 |goto The Ringing Deeps/0 58.54,36.00 < 15 |walk |only if not (subzone("Shadowvein Mine") and indoors())
click Activation Lever
|tip 在洞穴里面。
激活洞穴破碎机 |q 80145/1 |goto The Ringing Deeps/0 58.57,33.91
step
kill Magma Serpent##215770
|tip 在洞穴里面。
击败岩浆巨蛇 |q 80145/2 |goto The Ringing Deeps/0 58.68,33.73
step
_Next to you:_
talk ZZ-01-47
选择 _“<向达格兰报告你的发现>”_ |gossip 121561
与 ZZ-01-47 对话 |q 80145/3
'|talk ZZ-01-47##230643
step
_Next to you:_
talk ZZ-01-47
turnin The Motherlode##80145
accept Back to Where it Began##80517
'|talk ZZ-01-47##230643
step
离开洞穴 |goto The Ringing Deeps/0 58.54,36.00 < 15 |walk |only if subzone("Shadowvein Mine") and indoors()
talk High Speaker Brinthe##214663
turnin Back to Where it Began##80517 |goto The Ringing Deeps/0 56.27,74.91
accept It's Sabotage##79029 |goto The Ringing Deeps/0 56.27,74.91
step
杀死周围的敌人
|tip 只有{o}特定的敌人才会被算作{}任务目标。
|tip 它们是{o}精英敌人{}，在你点击{o}高仑和电池{}后最终会发动攻击。
click Various Object+
|tip 它们看起来像不同的物体，名字也各不相同。
|tip 点击{o}高仑和电池{}后，你会受到{o}波敌人{}的攻击。
制造混乱 |q 79029/1 |goto The Ringing Deeps/0 58.44,77.96
'|kill Foreman-in-Training##220517, Livid Enforcer##227356
step
进入建筑 |goto The Ringing Deeps/0 57.09,77.62 < 15 |walk
talk High Speaker Brinthe##220896
|tip 建筑内部
告诉她_“我们开始吧”。 |gossip 121606
与布林特对话 |q 79029/2 |goto The Ringing Deeps/0 56.06,77.62
step
观看对话
|tip 建筑内部
kill Supervisor Radlock##220897
启动并保护设施 |q 79029/3 |goto The Ringing Deeps/0 56.06,77.62
step
talk High Speaker Brinthe##220928
|tip 建筑内部
turnin It's Sabotage##79029 |goto The Ringing Deeps/0 56.06,77.62
accept The Voice of the Speakers##79030 |goto The Ringing Deeps/0 56.06,77.62
step
talk Alleria Windrunner##223944
turnin The Voice of the Speakers##79030 |goto Dornogal/0 31.55,59.66
accept A Tide Needing Turned##78941 |goto Dornogal/0 31.55,59.66
step
talk General Steelstrike##214271
turnin A Tide Needing Turned##78941 |goto Hallowfall/0 71.64,59.21
accept The Might of Khaz Algar##78942 |goto Hallowfall/0 71.64,59.21
accept Steel and Flames##78943 |goto Hallowfall/0 71.64,59.21
stickystart "Stem_The_Nerubian_Tide"
step
use the Arathi Warhorn##217309
|tip 在{o}盟友{}附近使用它。
|tip 他们看起来像{o}各种友好的 NPC{}。
集结 #20# 阿尔加里部队 |q 78943/1 |goto Hallowfall/0 71.00,61.44
'|clicknpc Machine Speaker Mech##217552, Unbound Fighter##217628, Hallowfall Lightblade##217554, Unbound Stormrider##217555, Arathi Warlynx##217634
step
talk Thrall##214275
turnin Steel and Flames##78943 |goto Hallowfall/0 68.57,64.22
step
talk Lady Jaina Proudmoore##214276
accept Cutting Off the Legs##78950 |goto Hallowfall/0 68.55,64.15
step
kill Kaz'vik##219751 |q 78950/2 |goto Hallowfall/0 67.89,67.61
step
kill Nix'k the Wicked##219749 |q 78950/1 |goto Hallowfall/0 66.69,64.91
step
kill Anub'ata##219855 |q 78950/3 |goto Hallowfall/0 64.78,68.45
step
label "Stem_The_Nerubian_Tide"
杀死周围的敌人
阻止努比亚人的浪潮 |q 78942/1 |goto Hallowfall/0 68.00,63.39
'|kill Agitated Chitterer##216599, Chitin Ravager##214394, Frenzied Swarmer##214397, Loyal Shadeweaver##214400, Maddened Hierophant##214398, Nerubian Crypt Lord##214395, Nerubian Fighter##214411, Nerubian Hulk##214396
step
talk Faerin Lothar##214274
turnin The Might of Khaz Algar##78942 |goto Hallowfall/0 64.58,61.79
step
talk Anduin Wrynn##214273
turnin Cutting Off the Legs##78950 |goto Hallowfall/0 64.53,61.78
accept A Light in the Dark##78948 |goto Hallowfall/0 64.53,61.78
step
talk Anduin Wrynn##214273
告诉它_"我已经准备好追上阿勒丽雅了。(开始剧情）。"_ |gossip 122377
与安度因对话，追击萨尔塔斯 |q 78948/1 |goto Hallowfall/0 64.53,61.78
step
开始剧情 |scenariostart |q 78948
step
click Corrupted Flame
|tip 当{o}求援{}按钮出现时，使用它。
|tip {站在出现的光照区域{}。
|tip 它会{o}增加希望条{}。
杀死攻击的敌人
点燃北火盆 |scenariogoal 1/67322 |goto Priory Scenario/0 64.77,33.05 |q 78948
|tip 站在{o}点燃的篝火旁，来填满希望条{}。
step
click Corrupted Flame
|tip 当{o}求援{}按钮出现时，使用它。
|tip {站在出现的光照区域{}。
|tip 它会{o}增加希望条{}。
杀死攻击的敌人
点燃南火盆 |scenariogoal 1/66409 |goto Priory Scenario/0 62.86,74.47 |q 78948
|tip 站在{o}点燃的篝火旁，来填满希望条{}。
step
进入建筑 |goto Priory Scenario/0 66.76,49.82 < 30 |walk
kill Shadesworn Crusher##218527 |scenariogoal 2/66412 |goto Priory Scenario/0 60.23,50.70 |q 78948
step
click Oil Brazier
清洁圣油井 |scenariogoal 3/66413 |goto Priory Scenario/0 56.57,51.25 |q 78948
step
kill The Broken Queen##214368 |scenariogoal 4/66415 |goto Priory Scenario/0 37.90,54.29 |q 78948
step
进入修道院 |scenariogoal 5/66416 |goto Priory Scenario/0 27.32,55.85 |q 78948
击败萨尔塔斯 |q 78948/2 |goto Priory Scenario/0 27.32,55.85
step
完成剧情 |scenarioend |q 78948
step
talk Alleria Windrunner##220688
turnin A Light in the Dark##78948 |goto Hallowfall/0 35.93,35.46
accept Return to Dornogal##83503 |goto Hallowfall/0 35.93,35.46
step
talk Merrix##226362
|tip 建筑内部
选择 _“<报告在万圣降临中发生的事情>”_ |gossip 123407
向多诺加尔的梅里克斯报告 |q 83503/1 |goto Dornogal/0 39.86,26.01
step
talk Anduin Wrynn##225897
|tip 在山顶上
turnin Return to Dornogal##83503 |goto Dornogal/0 25.35,66.19
step
_NOTE:_
战役继续
|tip 更多的{o}活动任务将会在本攻略中添加{o}。
点击此处继续 |confirm
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The War Within (70-80)\\Dragon Glyphs\\The War Within Dragon Glyphs (All Zones)",{
author="support@zygorguides.com",
achieveid={16575,16576,16577,16578,17411},
},[[
step
_NOTE:_
飞行符文与飞行技能
|tip 天空骑行符文看起来就像漂浮在空中的巨大圆形金色符文，遍布整个大陆。
|tip 你可以骑着天空骑乘坐骑飞过这些符文，收集它们。
|tip 收集这些符文可以获得天空骑术技能点数，用来提升天空骑术能力的威力。
|tip 本指南将指导您收集所有的天空骑术图腾，这样您就可以快速提升天空骑术技能。
|tip 在收集天空骑行石刻时，点击小地图上的 “龙岛摘要 ”按钮，然后点击 “龙骑技能和解锁 ”下的 “查看 ”按钮，即可消耗技能点数。
点击此处继续 |confirm
step
收集飞行符文：风暴守望 |achieve 40166/3 |goto Isle of Dorn/0 37.90,40.98
|tip 大树树冠下。
step
收集飞行符文：达尔-奥兹坦 |achieve 40166/2 |goto Isle of Dorn/0 23.14,58.55 |notravel
|tip 在山顶上
step
收集飞行符文：达尔-杜尔加兹 |achieve 40166/4 |goto Isle of Dorn/0 44.47,79.73 |notravel
|tip 塔旁边
step
收集飞行符文：沉没之盾 |achieve 40166/5 |goto Isle of Dorn/0 68.24,71.79 |notravel
|tip 柱子顶端
step
收集飞行符文：哀伤崛起 |achieve 40166/9 |goto Isle of Dorn/0 62.11,44.92 |notravel
step
收集飞行符文：铁堡 |achieve 40166/10 |goto Isle of Dorn/0 71.89,47.21 |notravel
|tip 桥下
step
收集飞行符文：煤渣酿造蜂蜜酒厂 |achieve 40166/8 |goto Isle of Dorn/0 78.22,42.75 |notravel
|tip 在山顶上
step
收集飞行符文：三面盾牌 |achieve 40166/1 |goto Isle of Dorn/0 75.75,22.22 |notravel
|tip 在山顶上
step
收集飞行符文：雷头峰 |achieve 40166/7 |goto Isle of Dorn/0 56.21,17.85 |notravel
|tip 两座悬崖之间的缝隙中
step
收集飞行符文：图尔梅德兰 |achieve 40166/6 |goto Isle of Dorn/0 47.75,26.72 |notravel
|tip 山顶上
step
收集飞行符文：石穹外景 |achieve 40703/2 |goto The Ringing Deeps/0 46.88,10.08
|tip 建筑物顶部
step
收集飞行符文：冈达加兹 |achieve 40703/1 |goto The Ringing Deeps/0 48.99,31.52 |notravel
|tip 管道和石柱之间
step
收集飞行符文：失落矿井 |achieve 40703/3 |goto The Ringing Deeps/0 57.28,31.57 |notravel
|tip 岩石山脊上方。
step
收集飞行符文：奇特巢穴 |achieve 40703/4 |goto The Ringing Deeps/0 69.45,34.50 |notravel
|tip 瀑布顶端。
step
收集飞行符文：隆隆荒原 |achieve 40703/5 |goto The Ringing Deeps/0 56.21,56.20 |notravel
|tip 红色水晶附近的高处。
step
收集飞行符文：泰洛奇矿井 |achieve 40703/8 |goto The Ringing Deeps/0 62.93,66.06 |notravel
|tip 大石洞支架顶部
step
收集飞行符文：深渊挖掘 |achieve 40703/7 |goto The Ringing Deeps/0 63.96,94.94 |notravel
|tip 悬挂的藤蔓附近
step
收集飞行符文：生命石窟 |achieve 40703/6 |goto The Ringing Deeps/0 49.30,66.06 |notravel
step
收集飞行符文：水厂 |achieve 40703/9 |goto The Ringing Deeps/0 46.47,51.74 |notravel
|tip 瀑布顶端。
step
收集飞行符文：杜奈尔的仁慈 |achieve 40704/4 |goto Hallowfall/0 69.94,44.23
|tip 高塔的阳台上
step
收集飞行符文：獠牙 |achieve 40704/1 |goto Hallowfall/0 62.86,51.77 |notravel
|tip 岩石上方的高处
step
收集飞行符文：西娜的渴望 |achieve 40704/2 |goto Hallowfall/0 57.23,32.60 |notravel
|tip 悬岩之间
step
收集飞行符文：凄凉之沙 |achieve 40704/5 |goto Hallowfall/0 62.76,7.21 |notravel
step
收集飞行符文：维尔汉的要求 |achieve 40704/9 |goto Hallowfall/0 45.77,12.28 |notravel
|tip 拱门下方
step
收集飞行符文：圣焰修道院 |achieve 40704/7 |goto Hallowfall/0 35.40,33.88 |notravel
|tip 塔顶
step
收集飞行符文：财富的陨落 |achieve 40704/8 |goto Hallowfall/0 30.77,51.57 |notravel
step
收集飞行符文：梅勒达尔 |achieve 40704/6 |goto Hallowfall/0 43.32,52.78 |notravel
|tip 拱顶之间
step
收集飞行符文：泰尼尔的上升 |achieve 40704/10 |goto Hallowfall/0 57.67,64.67 |notravel
|tip 船与墙之间
step
收集飞行符文：圣光之握 |achieve 40704/3 |goto Hallowfall/0 63.70,65.34 |notravel
step
收集飞行符文：涓流深渊 |achieve 40705/10 |goto Azj-Kahet/1 70.10,25.20
|tip 悬岩后面的洞穴里
step
收集飞行符文：阿拉提的尽头 |achieve 40705/1 |goto Azj-Kahet/1 63.41,13.76 |notravel
|tip 两块悬岩之间
step
收集飞行符文：围攻堡垒 |achieve 40705/2 |goto Azj-Kahet/1 47.59,21.20 |notravel
|tip 紫色天花板附近的岩石上方。
step
收集飞行符文：破裂之湖 |achieve 40705/3 |goto Azj-Kahet/1 27.33,40.99 |notravel
|tip 靠近天花板的卷曲树根内的高处
step
收集飞行符文：安苏瑞克之眼 |achieve 40705/4 |goto Azj-Kahet/1 44.08,57.89 |notravel
|tip 塔顶
step
收集飞行符文：旧祭祀坑 |achieve 40705/5 |goto Nerub'ar/1 13.09,33.24 |notravel
|tip 洞穴天花板上方的凹室中。
step
收集飞行符文：深行者隘口 |achieve 40705/6 |goto Azj-Kahet/1 58.81,91.28 |notravel
|tip 悬挂平台顶部下方
step
收集飞行符文：疯狂深渊 |achieve 40705/7 |goto Azj-Kahet/1 66.30,84.50 |notravel
|tip 网桥下方
step
收集飞行符文：拉克乌什 |achieve 40705/8 |goto Azj-Kahet/1 72.56,85.56 |notravel
|tip 坠落的水汽旁岩石旁的蜂巢下方。
step
收集飞行符文：丝绸病房 |achieve 40705/9 |goto Azj-Kahet/1 57.85,58.13 |notravel
|tip 悬挂平台下方
step
收集飞行符文：桀骜山谷 |achieve 40705/11 |goto Azj-Kahet/1 65.25,52.44 |notravel
|tip 洞穴的高处
]])
