local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("PetsMountsCSHADOW") then return end
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Achievement Mounts\\Rampart Screecher",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Rampart, Screecher"},
mounts={332903},
patch='90001',
mounttype='Flying',
model={97368},
description="This mount is acquired by earning the \"Glory of the Nathria Raider\" achievement.",
},[[
step
获得“纳斯利亚的荣耀”成就 |achieve 14355 |or
|tip 使用“纳斯利亚的荣耀探险者”成就指南来完成此任务。
'|complete hasmount(332903) |or
step
collect Rampart Screecher##182596 |or
|tip 你可以在你的邮政邮箱中找到它。
'|complete hasmount(332903) |or
step
use the Rampart Screecher##182596
学习“高墙尖啸者”坐骑 |learnmount Rampart Screecher##332903
step
_Congratulations!_
你获得了“堡垒尖啸者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Achievement Mounts\\Silky Shimmermoth",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying, mount, anima, Shadowlands, Silky, Shimmermoth"},
mounts={318051},
patch='90001',
mounttype='Flying',
model={95205},
description="This mount is purchased for 5,000 Reservoir Anima after earning the \"Ardenweald's a Stage\" achievement.",
},[[
step
获得“阿尔登维尔的舞台”成就 |achieve 14353 |or
|tip 使用“阿尔登威尔德的舞台”成就指南来完成这个。
'|complete hasmount(318051) |or
step
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(318051)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Master Clerk Salorn##163714
buy 1 Silky Shimmermoth##180748 |goto Ardenweald/0 43.12,47.06 |or
'|complete hasmount(318051) |or
step
use the Silky Shimmermoth##180748
学习丝滑光辉蛾坐骑 |learnmount Silky Shimmermoth##318051
step
_Congratulations!_
你收集了“丝滑闪光蛾”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Achievement Mounts\\Sintouched Deathwalker",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, keystone, Sintouched, Deathwalker"},
mounts={340068},
patch='90001',
mounttype='Flying',
model={97644},
description="This mount is acquired by earning the \"Shadowlands Keystone Master: Season One\" achievement.",
},[[
step
获得“暗影国度钥石大师：第一赛季”成就 |achieve 14532 |or
|tip 使用“暗影国度钥石大师：第一季”成就指南来完成这个。
'|complete hasmount(340068) |or
step
collect Sintouched Deathwalker##182717 |or
|tip 你可以在你的邮政邮箱中找到它。
'|complete hasmount(340068) |or
step
use the Sintouched Deathwalker##182717
学习“神秘死者”坐骑 |learnmount Sintouched Deathwalker##340068
step
_Congratulations!_
你获得了“命运无常的死亡行者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Achievement Mounts\\Voracious Gorger",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Voracious, Gorger"},
mounts={344659},
patch='90001',
mounttype='Ground',
model={99091},
description="This mount is acquired by earning the \"Glory of the Shadowlands Hero\" achievement.",
},[[
step
获得“暗影国度英雄”的荣耀成就 |achieve 14322 |or
|tip 使用“暗影国度英雄的荣耀”成就攻略来完成这个。
'|complete hasmount(344659) |or
step
collect Voracious Gorger##184183 |or
|tip 你可以在你的邮政邮箱中找到它。
'|complete hasmount(344659) |or
step
use the Voracious Gorger##184183
学习“贪婪吞噬者”坐骑 |learnmount Voracious Gorger##344659
step
_Congratulations!_
你收集了“贪食吞噬者”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Kyrian Mounts\\Gruesome Flayedwing (Kyrian)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Gruesome, Flayedwing, covenant"},
mounts={336039},
patch='90001',
mounttype='Flying',
model={98153},
description="This mount is purchased for 2,500 Reservoir Anima from Binkiros after earning the \"All The Colors of the Painbow\" achievement.\n\nThis mount is obtainable by all Covenants.",
},[[
step
获得“百色痛苦楷模”成就 |achieve 14853 |or
'|complete hasmount(336039) |or
step
收集2500个储能之魂 |complete curcount(1813) >= 2500 or hasmount(336039)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Binkiros##171973
buy 1 Gruesome Flayedwing##181300 |goto Elysian Hold/0 31.38,47.90 |or
'|complete hasmount(336039) |or
step
use the Gruesome Flayedwing##181300
学习“残酷的剥皮翼”坐骑 |learnmount Gruesome Flayedwing##336039
step
_Congratulations!_
你获得了“骇人剥皮翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Kyrian Mounts\\Silvertip Dredwing (Kyrian)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Silvertip, Dredwing, covenant"},
mounts={312777},
patch='90001',
mounttype='Flying',
model={97367},
description="This mount is purchased for 2,500 Reservoir Anima from Binkiros after earning the \"Curse of Thirst\" achievement.\n\nThis mount is obtainable by all Covenants.",
},[[
step
获得“渴望的诅咒”成就 |achieve 14858 |or
'|complete hasmount(312777) |or
step
收集2500个储能之魂 |complete curcount(1813) >= 2500 or hasmount(312777)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Binkiros##171973
buy 1 Silvertip Dredwing##181316 |goto Elysian Hold/0 31.38,47.90 |or
'|complete hasmount(312777) |or
step
use the Silvertip Dredwing##181316
学习“银尖掘翼”坐骑 |learnmount Silvertip Dredwing##312777
step
_Congratulations!_
你获得了“银尖深渊翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Eternal Phalynx of Courage",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Eternal, Phalynx, of, Courage, covenant"},
mounts={334406},
patch='90001',
mounttype='Ground',
model={94338},
description="This mount is acquired by completing Chapter 6 of the Kyrian covenant questline.",
},[[
step
完成 "新纪元" 任务 |q 61697 |future |or
|tip 使用“基尔加丹圣殿任务线”升级指南来完成这个。
'|complete hasmount(334406) |or
step
collect Eternal Phalynx of Courage##180766 |or
|tip 这是“新纪元”任务的奖励。
'|complete hasmount(334406) |or
step
use the Eternal Phalynx of Courage##180766
学习永恒勇气的法林克斯坐骑 |learnmount Phalynx of Courage##334406
step
_Congratulations!_
你收集了永恒勇气法林克斯坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Eternal Phalynx of Humility",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Eternal, Phalynx, of, Humility, covenant"},
mounts={334409},
patch='90001',
mounttype='Ground',
model={94337},
description="This mount is purchased for 2,500 Reservoir Anima from Binkiros after earning the \"Learning from the Masters\" achievement.",
},[[
step
获得“向大师学习”成就 |achieve 14861 |or
'|complete hasmount(334409) |or
step
收集2500个储能之魂 |complete curcount(1813) >= 2500 or hasmount(334409)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Binkiros##171973
buy 1 Eternal Phalynx of Humility##180768 |goto Elysian Hold/0 31.38,47.90 |or
'|complete hasmount(334409) |or
step
use the Eternal Phalynx of Humility##180768
学习永恒谦卑之腊肠兽坐骑 |learnmount Eternal Phalynx of Humility##334409
step
_Congratulations!_
你收集了“永恒谦卑的法林克斯”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Eternal Phalynx of Loyalty",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Eternal, Phalynx, of, Loyalty, covenant"},
mounts={334408},
patch='90001',
mounttype='Ground',
model={94335},
description="This mount is purchased for 2,500 Reservoir Anima from Binkiros after earning the \"Death Foursworn\" achievement.",
},[[
step
获取死亡誓言成就 |achieve 14863 |or
'|complete hasmount(334408) |or
step
收集2500个储能之魂 |complete curcount(1813) >= 2500 or hasmount(334408)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Binkiros##171973
buy 1 Eternal Phalynx of Loyalty##180767 |goto Elysian Hold/0 31.38,47.90 |or
'|complete hasmount(334408) |or
step
use the Eternal Phalynx of Loyalty##180767
学习永恒的忠诚之石像兽坐骑 |learnmount Eternal Phalynx of Loyalty##334408
step
_Congratulations!_
你收集了永恒忠诚的法林克斯坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Eternal Phalynx of Purity",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Eternal, Phalynx, of, Purity, covenant"},
mounts={334403},
patch='90001',
mounttype='Ground',
model={94336},
description="This mount is purchased for 100 Reservoir Anima from Adjutant Galos after reaching Renown level 39 with the Kyrian covenant.",
},[[
step
达到声望等级39 |complete covenantrenown() >= 39 or hasmount(334403)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用"凯尔达隆日常任务"指南来完成这个。
step
收集100个储备灵魂能量 |complete curcount(1813) >= 100 or hasmount(334403)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Adjutant Galos##174937
buy 1 Eternal Phalynx of Purity##180765 |goto Elysian Hold/1 63.64,30.38 |or
'|complete hasmount(334403) |or
step
use the Eternal Phalynx of Purity##180765
学习永恒纯洁法林克斯坐骑 |learnmount Eternal Phalynx of Purity##334403
step
_Congratulations!_
你收集了永恒的纯净灵兽坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Pale Acidmaw (Kyrian)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Pale, Acidmaw, covenant"},
mounts={334365},
patch='90001',
mounttype='Ground',
model={94348},
description="This mount is purchased for 2,500 Reservoir Anima from Binkiros after earning the \"Bare Necessities\" achievement.\n\nThis mount is obtainable by all Covenants.",
},[[
step
获得“基本需求”成就 |achieve 14860 |or
'|complete hasmount(334365) |or
step
收集2500个储能之魂 |complete curcount(1813) >= 2500 or hasmount(334365)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Binkiros##171973
buy 1 Pale Acidmaw##180726 |goto Elysian Hold/0 31.38,47.90 |or
'|complete hasmount(334365) |or
step
use the Pale Acidmaw##180726
学习苍白酸噬坐骑 |learnmount Pale Acidmaw##334365
step
_Congratulations!_
你获得了"苍白酸喉"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Phalynx of Courage",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Phalynx, of, Courage, covenant"},
mounts={334391},
patch='90001',
mounttype='Ground',
model={94334},
description="This mount is acquired by completing Chapter 3 of the Kyrian covenant questline.",
},[[
step
完成“筑巢基础”任务 |q 58181 |future |or
|tip 使用“基尔加丹圣殿任务线”升级指南来完成这个。
'|complete hasmount(334391) |or
step
collect Phalynx of Courage##180763 |or
|tip 这是“建造基地”任务的奖励。
'|complete hasmount(334391) |or
step
use the Phalynx of Courage##180763
学习勇气的法林克斯坐骑 |learnmount Phalynx of Courage##334391
step
_Congratulations!_
你收集了勇气的法林克斯坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Kyrian Mounts\\Phalynx of Purity",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Phalynx, of, Purity, covenant"},
mounts={334398},
patch='90001',
mounttype='Ground',
model={94331},
description="This mount is purchased for 5000 Reservoir Anima from Adjutant Galos after reaching Renown level 23 with the Kyrian covenant.",
},[[
step
达到声望等级23 |complete covenantrenown() >= 23 or hasmount(334398)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用"凯尔达隆日常任务"指南来完成这个。
step
收集5000个蓄能灵能 |complete curcount(1813) >= 2000 or hasmount(334398)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Adjutant Galos##174937
buy 1 Phalynx of Purity##180764 |goto Elysian Hold/1 63.64,30.38 |or
'|complete hasmount(334398) |or
step
use the Phalynx of Purity##180764
学习“纯洁的狮鹫”坐骑 |learnmount Phalynx of Purity##334398
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Necrolord Mounts\\Dauntless Duskrunner (Necrolord)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Dauntless, Duskrunner, covenant"},
mounts={336064},
patch='90001',
mounttype='Flying',
model={97870},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with the Stitchmasters.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁可憎缝制 |complete covenantfeature("Covenant Unique") >= 1
step
与缝合大师达到崇敬声望 |complete rep('Stitchmasters') == Exalted or hasmount(336064)
|tip 每周完成可怕的缝合以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(336064)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
冲上楼梯 |goto Maldraxxus/0 56.24,65.12 < 20 |only if walking
继续向上攀登阶梯 |goto 53.79,66.94 < 20 |only if walking
talk Atticus##159238
buy 1 Dauntless Duskrunner##181317 |goto 55.19,68.39 |or
'|complete hasmount(336064) |or
step
use the Dauntless Duskrunner##181317
学习无畏的暮光奔马坐骑 |learnmount Dauntless Duskrunner##336064
step
_Congratulations!_
你收集了“无畏的黄昏奔跑者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Necrolord Mounts\\Gruesome Flayedwing (Necrolord)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Gruesome, Flayedwing, covenant"},
mounts={336039},
patch='90001',
mounttype='Flying',
model={98153},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with the Stitchmasters.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁可憎缝制 |complete covenantfeature("Covenant Unique") >= 1
step
与缝合大师达到崇敬声望 |complete rep('Stitchmasters') == Exalted or hasmount(336039)
|tip 每周完成可怕的缝合以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(336039)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
冲上楼梯 |goto Maldraxxus/0 56.24,65.12 < 20 |only if walking
继续向上攀登阶梯 |goto 53.79,66.94 < 20 |only if walking
talk Atticus##159238
buy 1 Gruesome Flayedwing##181300 |goto 55.19,68.39 |or
'|complete hasmount(336039) |or
step
use the Gruesome Flayedwing##181300
学习“残酷的剥皮翼”坐骑 |learnmount Gruesome Flayedwing##336039
step
_Congratulations!_
你获得了“骇人剥皮翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Necrolord Mounts\\Predatory Plagueroc",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Predatory, Plagueroc, covenant"},
mounts={336045},
patch='90001',
mounttype='Flying',
model={98150},
description="This mount is a rare drop from the rare spawn, Gieger, in Maldraxxus. Only members of the Necrolord covenant can loot this mount.",
},[[
step
kill Gieger##162741
|tip 你可能需要团队协作。
|tip 这个稀有敌人可能并不总是出现在战场上。
collect Predatory Plagueroc##182080 |goto Maldraxxus/0 31.51,35.40 |or
|tip 这个坐骑的掉率大约是2%。
|tip 只有死亡骑士盟约的成员才能拾取这只坐骑。
'|complete hasmount(336045) |or
step
use the Predatory Plagueroc##182080
学习掠食者瘟疫翼龙坐骑 |learnmount Predatory Plagueroc##336045
step
_Congratulations!_
你获得了"掠食者瘟疫骆驼"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Necrolord Mounts\\Silvertip Dredwing (Necrolord)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Silvertip, Dredwing, covenant"},
mounts={312777},
patch='90001',
mounttype='Flying',
model={97367},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with the Stitchmasters.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁可憎缝制 |complete covenantfeature("Covenant Unique") >= 1
step
与缝合大师达到崇敬声望 |complete rep('Stitchmasters') == Exalted or hasmount(312777)
|tip 每周完成可怕的缝合以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(312777)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
冲上楼梯 |goto Maldraxxus/0 56.24,65.12 < 20 |only if walking
继续向上攀登阶梯 |goto 53.79,66.94 < 20 |only if walking
talk Atticus##159238
buy 1 Silvertip Dredwing##181316 |goto 55.19,68.39 |or
'|complete hasmount(312777) |or
step
use the Silvertip Dredwing##181316
学习“银尖掘翼”坐骑 |learnmount Silvertip Dredwing##312777
step
_Congratulations!_
你获得了“银尖深渊翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Armored Bonehoof Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Armored, Bonehoof, Tauralus, covenant"},
mounts={332466},
patch='90001',
mounttype='Ground',
model={96471},
description="This mount is purchased for 5,000 Reservoir Anima and 100 Grateful Offerings or obtained as a rare drop from the rare, Sabreil the Bonecleaver, in Maldraxxus.",
},[[
step
点击这里购买装甲骨爪陶拉斯 |confirm |next "Gather_Currencies" |or
|tip
点击这里击杀稀有怪物 |confirm |next "Kill_Sabriel" |or
'|complete hasmount(332466) |or
step
label "Gather_Currencies"
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(332466)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
收集100个感恩之献 |complete curcount(1885) >= 100 or hasmount(332466)
|tip 这些是通过提升你公会的灵魂导体并完成每日任务获得的。
step
talk Su Zettai##172176
buy 1 Armored Bonehoof Tauralus##181815 |goto Seat of the Primus/0 52.21,40.74 |next "Learn_Mount" |or
'|complete hasmount(332466) |or
step
label "Kill_Sabriel"
kill Sabriel the Bonecleaver##168147
|tip 你可能需要团队协作。
|tip 这个稀有敌人可能并不总是出现在战场上。
collect Armored Bonehoof Tauralus##181815 |goto Maldraxxus/0 50.37,47.28 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(332466) |or
step
label "Learn_Mount"
use the Armored Bonehoof Tauralus##181815
学习 armored bonehoof tauralus 坐骑 |learnmount Armored Bonehoof Tauralus##332466
step
_Congratulations!_
你收集了“护甲骨蹄塔尔隆”。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Armored Plaguerot Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Armored, Plaguerot, Tauralus, covenant"},
mounts={332464},
patch='90001',
mounttype='Ground',
model={96470},
description="This mount is purchased for 100 Reservoir Anima from Su Zettai after reaching Renown level 39 with the Necrolord covenant.",
},[[
step
达到声望等级39 |complete covenantrenown() >= 39 or hasmount(332464)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“死灵领主每日任务”指南完成此任务。
step
收集100个储备灵魂能量 |complete curcount(1813) >= 100 or hasmount(332464)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Su Zettai##172176
buy 1 Armored Plaguerot Tauralus##181821 |goto Seat of the Primus/0 52.21,40.74 |or
'|complete hasmount(332464) |or
step
use the Armored Plaguerot Tauralus##181821
学习“铠甲瘟疫兽”坐骑 |learnmount Armored Plaguerot Tauralus##332464
step
_Congratulations!_
你收集了“ armored Plaguerot Tauralus”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Armored War-Bred Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Armored, War-Bred, Tauralus, covenant"},
mounts={332462},
patch='90001',
mounttype='Ground',
model={96469},
description="This mount is acquired by completing Chapter 9 of the Necrolord covenant questline.",
},[[
step
完成“基尔萨斯的第三次陨落”任务 |q 59020 |future |or
|tip 使用“灵魂缝合者任务线”升级指南来完成此任务。
'|complete hasmount(332462) |or
step
collect Armored War-Bred Tauralus##181822 |or
|tip 这是任务“凯尔萨斯的第三次陨落”的奖励。
'|complete hasmount(332462) |or
step
use the Armored War-Bred Tauralus##181822
学习“铠甲战争驯兽者塔拉卢斯”坐骑 |learnmount Armored War-Bred Tauralus##332462
step
_Congratulations!_
你收集了装甲战育塔拉斯坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Bonehoof Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Bonehoof, Tauralus, covenant"},
mounts={332457},
patch='90001',
mounttype='Ground',
model={96467},
description="This mount is a rare drop from the rare spawn, Tahonta, in Maldraxxus. Only members of the Necrolord covenant can loot this mount.",
},[[
step
kill Tahonta##162586
|tip 你可能需要团队协作。
|tip 这个稀有敌人可能并不总是出现在战场上。
collect Bonehoof Tauralus##182075 |goto Maldraxxus/0 44.64,51.78 |or
|tip 这个坐骑的掉落率大约为2-3%。
|tip 只有死亡骑士盟约的成员才能拾取这只坐骑。
'|complete hasmount(332457) |or
step
use the Bonehoof Tauralus##182075
学习骨蹄塔鲁斯坐骑 |learnmount Bonehoof Tauralus##332457
step
_Congratulations!_
你收集了“骨蹄塔罗斯”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Pale Acidmaw (Necrolord)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Pale, Acidmaw, covenant"},
mounts={334365},
patch='90001',
mounttype='Ground',
model={94348},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with the Stitchmasters.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁可憎缝制 |complete covenantfeature("Covenant Unique") >= 1
step
与缝合大师达到崇敬声望 |complete rep('Stitchmasters') == Exalted or hasmount(334365)
|tip 每周完成可怕的缝合以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(334365)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
冲上楼梯 |goto Maldraxxus/0 56.24,65.12 < 20 |only if walking
继续向上攀登阶梯 |goto 53.79,66.94 < 20 |only if walking
talk Atticus##159238
buy 1 Pale Acidmaw##180726 |goto 55.19,68.39 |or
'|complete hasmount(334365) |or
step
use the Pale Acidmaw##180726
学习苍白酸噬坐骑 |learnmount Pale Acidmaw##334365
step
_Congratulations!_
你获得了"苍白酸喉"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\Plaguerot Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Plaguerot, Tauralus, covenant"},
mounts={332456},
patch='90001',
mounttype='Ground',
model={96466},
description="This mount is purchased for 2,000 Reservoir Anima from Su Zettai after reaching Renown level 23 with the Necrolord covenant.",
},[[
step
达到声望等级23 |complete covenantrenown() >= 23 or hasmount(332456)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“死灵领主每日任务”指南完成此任务。
step
收集 2000 点蓄能灵能 |complete curcount(1813) >= 2000 or hasmount(332456)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Su Zettai##172176
buy 1 Plaguerot Tauralus##182076 |goto Seat of the Primus/0 52.21,40.74 |or
'|complete hasmount(332456) |or
step
use the Plaguerot Tauralus##182076
学习“瘟疫之蹄”坐骑 |learnmount Plaguerot Tauralus##332456
step
_Congratulations!_
你收集了"瘟疫之腐兽"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Necrolord Mounts\\War-Bred Tauralus",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, War-Bred, Tauralus, covenant"},
mounts={332455},
patch='90001',
mounttype='Ground',
model={96465},
description="This mount is acquired by completing Chapter 2 of the Necrolord covenant questline.",
},[[
step
完成“敌人在门口”任务 |q 59555 |future |or
|tip 使用“灵魂缝合者任务线”升级指南来完成此任务。
'|complete hasmount(332455) |or
step
collect War-Bred Tauralus##182077 |or
|tip 这是“敌人就在门口”任务的奖励。
'|complete hasmount(332455) |or
step
use the War-Bred Tauralus##182077
学习“战斗培育的塔乌拉斯”坐骑 |learnmount War-Bred Tauralus##332455
step
_Congratulations!_
你收集了“战争培育的塔拉乌斯”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Night Fae Mounts\\Vibrant Flutterwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Vibrant, Flutterwing, covenant"},
mounts={342667},
patch='90001',
mounttype='Flying',
model={95207},
description="This mount is purchased for 5,000 Reservoir Anima after becoming Revered with the Marasmius.",
},[[
step
与马拉斯米乌斯达到崇敬声望 |complete rep('Marasmius') >= Revered or hasmount(342667)
step
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(342667)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Cortinarius##174766
buy 1 Vibrant Flutterwing##183801 |goto Ardenweald/0 56.04,53.01 |or
'|complete hasmount(342667) |or
step
use the Vibrant Flutterwing##183801
学习"生机勃勃的微翅"坐骑 |learnmount Vibrant Flutterwing##342667
step
_Congratulations!_
你收集了"鲜艳的翅膀"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Dreamlight Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Dreamlight, Runestag, covenant"},
mounts={312759},
patch='90001',
mounttype='Ground',
model={94339},
description="This mount is acquired by completing Chapter 1 of the Night Fae covenant questline.",
},[[
step
完成“我的动机是什么？”任务 |q 58159 |future |or
|tip 使用夜之子阵营任务线升级指南完成此任务。
'|complete hasmount(312759) |or
step
collect Dreamlight Runestag##180263 |or
|tip 这是来自“我的动力是什么？”任务的奖励。
'|complete hasmount(312759) |or
step
use the Dreamlight Runestag##180263
学习梦光奔腾鹿坐骑 |learnmount Dreamlight Runestag##312759
step
_Congratulations!_
你收集了梦魇光辉符文鹿坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Enchanted Dreamlight Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Enchanted, Dreamlight, Runestag, covenant"},
mounts={312761},
patch='90001',
mounttype='Ground',
model={94362},
description="This mount is acquired by completing Chapter 9 of the Night Fae covenant questline.",
},[[
step
完成“德鲁斯特与灰烬”任务 |q 60108 |future |or
|tip 使用夜之子阵营任务线升级指南完成此任务。
'|complete hasmount(312761) |or
step
collect Enchanted Dreamlight Runestag##180721 |or
|tip 这是来自“德鲁斯特与灰烬”任务的奖励。
'|complete hasmount(312761) |or
step
use the Enchanted Dreamlight Runestag##180721
学习“魔法梦光符文鹿”坐骑 |learnmount Enchanted Dreamlight Runestag##312761
step
_Congratulations!_
你获得了 "魔法梦幻光之符文鹿" 坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Enchanted Shadeleaf Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Enchanted, Shadeleaf, Runestag, covenant"},
mounts={332246},
patch='90001',
mounttype='Ground',
model={94363},
description="This mount is purchased for 100 Reservoir Anima from Elwyn after reaching Renown level 39 with the Night Fae covenant.",
},[[
step
达到声望等级39 |complete covenantrenown() >= 39 or hasmount(332246)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“夜之精灵每日任务”指南来完成此任务。
step
收集100个储备灵魂能量 |complete curcount(1813) >= 100 or hasmount(332246)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Elwyn##174914
buy 1 Enchanted Shadeleaf Runestag##180722 |goto Heart of the Forest/0 60.14,35.97 |or
'|complete hasmount(332246) |or
step
use the Enchanted Shadeleaf Runestag##180722
学习“魔法阴影叶符文梅花鹿”坐骑 |learnmount Enchanted Shadeleaf Runestag##332246
step
_Congratulations!_
你获得了“附魔阴影叶奔跑鹿”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Enchanted Winterborn Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Enchanted, Winterborn, Runestag, covenant"},
mounts={332248},
patch='90001',
mounttype='Ground',
model={94365},
description="This mount is purchased for 5,000 Reservoir Anima after becoming Revered with the Marasmius.",
},[[
step
与马拉斯米乌斯达到崇敬声望 |complete rep('Marasmius') >= Revered or hasmount(332248)
step
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(332248)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Cortinarius##174766
buy 1 Enchanted Winterborn Runestag##180724 |goto Ardenweald/0 56.04,53.01 |or
'|complete hasmount(332248) |or
step
use the Enchanted Winterborn Runestag##180724
学习“附魔冬生符文鹿”坐骑 |learnmount Enchanted Winterborn Runestag##332248
step
_Congratulations!_
你收集到了“魔法冬雪之角鹿”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Shadeleaf Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Shadeleaf, Runestag, covenant"},
mounts={332243},
patch='90001',
mounttype='Ground',
model={94340},
description="This mount is purchased for 2,000 Reservoir Anima from Elwyn after reaching Renown level 23 with the Night Fae covenant.",
},[[
step
达到声望等级23 |complete covenantrenown() >= 23 or hasmount(332243)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“夜之精灵每日任务”指南来完成此任务。
step
收集 2000 点蓄能灵能 |complete curcount(1813) >= 2000 or hasmount(332243)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Elwyn##174914
buy 1 Shadeleaf Runestag##180413 |goto Heart of the Forest/0 60.14,35.97 |or
'|complete hasmount(332243) |or
step
use the Shadeleaf Runestag##180413
学习“阴叶符文鹿”坐骑 |learnmount Shadeleaf Runestag##332243
step
_Congratulations!_
你收集了“暗叶符文鹿”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Umbral Scythehorn",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Umbral, Scythehorn, covenant"},
mounts={340503},
patch='90001',
mounttype='Ground',
model={94344},
description="This mount is purchased for 5,000 Reservoir Anima and 5 Grateful Offerings after becoming Revered with the Court of Night.",
},[[
step
与夜之庭达到尊敬声望 |complete rep('Court of Night') >= Revered or hasmount(340503)
step
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(340503)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
收集5个感激的礼物 |complete curcount(1885) >= 5 or hasmount(340503)
|tip 这些是通过提升你公会的灵魂导体并完成每日任务获得的。
step
talk Spindlenose##162447
buy 1 Umbral Scythehorn##183053 |goto Ardenweald/0 59.58,52.84 |or
'|complete hasmount(340503) |or
step
use the Umbral Scythehorn##183053
学习“阴影镰角”坐骑 |learnmount Umbral Scythehorn##340503
step
_Congratulations!_
你收集了“幽影镰角”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Wild Glimmerfur Prowler",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Wild, Glimmerfur, Prowler, covenant"},
mounts={334366},
patch='90001',
mounttype='Ground',
model={97623},
description="This mount is purchased for 5,000 Reservoir Anima and 100 Grateful Offerings or obtained as a rare drop from the rare, Valfir the Unrelenting, in Ardenweald.",
},[[
step
点击这里购买野性闪光毛皮猎豹 |confirm |next "Gather_Currencies" |or
|tip
点击这里击杀稀有怪物 |confirm |next "Kill_Valfir" |or
'|complete hasmount(334366) |or
step
label "Gather_Currencies"
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(334366)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
收集100个感恩之献 |complete curcount(1885) >= 100 or hasmount(334366)
|tip 这些是通过提升你公会的灵魂导体并完成每日任务获得的。
step
talk Elwyn##174914
buy 1 Wild Glimmerfur Prowler##180730 |goto Heart of the Forest/0 60.14,35.97 |next "Learn_Mount" |or
'|complete hasmount(334366) |or
step
label "Kill_Valfir"
kill Valfir the Unrelenting##168647
|tip 它在这个区域徘徊。
|tip 你可能需要团队协作。
|tip 这个稀有敌人可能并不总是出现在战场上。
collect Wild Glimmerfur Prowler##180730 |goto Ardenweald/0 30.94,54.64 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(334366) |or
step
label "Learn_Mount"
use the Wild Glimmerfur Prowler##180730
学习“野生闪光皮毛猎手”坐骑 |learnmount Wild Glimmerfur Prowler##334366
step
_Congratulations!_
你获得了“野生闪光毛皮捕猎者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Night Fae Mounts\\Winterborn Runestag",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Winterborn, Runestag, covenant"},
mounts={332245},
patch='90001',
mounttype='Ground',
model={94342},
description="This mount is purchased for 5,000 Reservoir Anima and 5 Grateful Offerings after becoming Revered with the Court of Night.",
},[[
step
与夜之庭达到尊敬声望 |complete rep('Court of Night') >= Revered or hasmount(332245)
step
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(332245)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
收集5个感激的礼物 |complete curcount(1885) >= 5 or hasmount(332245)
|tip 这些是通过提升你公会的灵魂导体并完成每日任务获得的。
step
talk Spindlenose##162447
buy 1 Winterborn Runestag##180415 |goto Ardenweald/0 59.58,52.84 |or
'|complete hasmount(332245) |or
step
use the Winterborn Runestag##180415
学习冬韵符文鹿坐骑 |learnmount Winterborn Runestag##332245
step
_Congratulations!_
你收集了冬生符文鹿坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Venthyr Mounts\\Dauntless Duskrunner (Venthyr)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Dauntless, Duskrunner, covenant, Ember, Court"},
mounts={336064},
patch='90001',
mounttype='Flying',
model={97870},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with The Ember Court.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁火焰庭院 |complete covenantfeature("Covenant Unique") >= 1
|tip 使用“雾夜之翼 炽焰庭院”升级指南来完成此任务。
step
与火焰庭院达到崇敬声望 |complete rep('The Ember Court') == Exalted or hasmount(336064)
|tip 每周完成火焰宫殿以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(336064)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
进入建筑物 |goto Revendreth/0 28.72,43.01 < 7 |only if walking
talk Temel##164966
|tip 在建筑物内。
buy 1 Dauntless Duskrunner##181317 |goto 27.93,43.05 |or
'|complete hasmount(336064) |or
step
use the Dauntless Duskrunner##181317
学习无畏的暮光奔马坐骑 |learnmount Dauntless Duskrunner##336064
step
_Congratulations!_
你收集了“无畏的黄昏奔跑者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Venthyr Mounts\\Gruesome Flayedwing (Venthyr)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Gruesome, Flayedwing, covenant, Ember, Court"},
mounts={336039},
patch='90001',
mounttype='Flying',
model={98153},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with The Ember Court.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁火焰庭院 |complete covenantfeature("Covenant Unique") >= 1
|tip 使用“雾夜之翼 炽焰庭院”升级指南来完成此任务。
step
与火焰庭院达到崇敬声望 |complete rep('The Ember Court') == Exalted or hasmount(336039)
|tip 每周完成火焰宫殿以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(336039)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
进入建筑物 |goto Revendreth/0 28.72,43.01 < 7 |only if walking
talk Temel##164966
|tip 在建筑物内。
buy 1 Gruesome Flayedwing##181300 |goto 27.93,43.05 |or
'|complete hasmount(336039) |or
step
use the Gruesome Flayedwing##181300
学习“残酷的剥皮翼”坐骑 |learnmount Gruesome Flayedwing##336039
step
_Congratulations!_
你获得了“骇人剥皮翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Venthyr Mounts\\Horrid Dredwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Horrid, Dredwing, covenant"},
mounts={332882},
patch='90001',
mounttype='Flying',
model={94350},
description="This mount is purchased for 5,000 Reservoir Anima and 100 Grateful Offerings or obtained as a rare drop from the rare, Harika the Horrid, in Revendreth.",
},[[
step
点击这里购买可怕的冥翼 |confirm |next "Gather_Currencies" |or
|tip
点击这里击杀稀有怪物 |confirm |next "Kill_Harika" |or
'|complete hasmount(332882) |or
step
label "Gather_Currencies"
收集5000个储备灵魂之源 |complete curcount(1813) >= 5000 or hasmount(332882)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
收集100个感恩之献 |complete curcount(1885) >= 100 or hasmount(332882)
|tip 这些是通过提升你公会的灵魂导体并完成每日任务获得的。
step
talk Chachi the Artiste##174710
|tip 在建筑物内。
buy 1 Horrid Dredwing##180461 |goto Sinfall/0 54.10,24.63 |next "Learn_Mount" |or
'|complete hasmount(332882) |or
step
label "Kill_Harika"
talk Wingsmash##165327
|tip 与附近的破翼交谈以召唤哈里卡。
|tip 你的盟约的灵魂导体必须引导至隐密之丘，以便你自行召唤它。
kill Harika the Horrid##165290
|tip 你可能需要团队协作。
collect Horrid Dredwing##180461 |goto Revendreth/0 45.80,78.87 |or
|tip 这个坐骑的掉率大约是2%。
'|complete hasmount(332882) |or
step
label "Learn_Mount"
use the Horrid Dredwing##180461
学习“恐怖掘翼”坐骑 |learnmount Horrid Dredwing##332882
step
_Congratulations!_
你收集了“可怕的冥界之翼”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Covenant Mounts\\Venthyr Mounts\\Silvertip Dredwing (Venthyr)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying, mount, Shadowlands, Silvertip, Dredwing, covenant, Ember, Court"},
mounts={312777},
patch='90001',
mounttype='Flying',
model={97367},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with The Ember Court.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁火焰庭院 |complete covenantfeature("Covenant Unique") >= 1
|tip 使用“雾夜之翼 炽焰庭院”升级指南来完成此任务。
step
与火焰庭院达到崇敬声望 |complete rep('The Ember Court') == Exalted or hasmount(312777)
|tip 每周完成火焰宫殿以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(312777)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
进入建筑物 |goto Revendreth/0 28.72,43.01 < 7 |only if walking
talk Temel##164966
|tip 在建筑物内。
buy 1 Silvertip Dredwing##181316 |goto 27.93,43.05 |or
'|complete hasmount(312777) |or
step
use the Silvertip Dredwing##181316
学习“银尖掘翼”坐骑 |learnmount Silvertip Dredwing##312777
step
_Congratulations!_
你获得了“银尖深渊翼龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Battle Gargon Silessa",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Battle, Gargon, Silessa, covenant, mirror, transport"},
mounts={333023},
patch='90001',
mounttype='Ground',
model={94329},
description="This mount is a rare drop from a Broken Mirror after upgrading the Transport Network mirrors to level 3.",
},[[
step
talk Foreman Flatfinger##172605
|tip 在建筑物内。
升级你的运输网络到三级 |complete covenantfeature("Transport Network") == 3 or hasmount(333023) |goto Sinfall/0 55.60,26.25
|tip 使用“维瑟克运输网络”升级指南来完成这个。
step
label "Mirrors_Start"
talk Chachi the Artiste##174710
|tip 在建筑物内。
buy 4 Handcrafted Mirror Repair Kit##181363 |goto 54.10,24.63 |or
'|complete hasmount(333023) |or
step
在石头平台下跑 |goto Revendreth/0 27.67,38.22 < 7 |only if walking
沿着石头小路前进 |goto 28.24,37.97 < 7 |only if walking
冲上瓦砾堆 |goto 28.73,37.75 < 7 |only if walking
继续沿着破碎的石材平台前进 |goto 28.89,37.38 < 7 |only if walking
进入建筑物 |goto 29.49,36.87 < 7 |walk
click Broken Mirror##353237
|tip 在建筑物内。
|tip 这些镜子每日只能拾取一次。
collect Silessa's Battle Harness##183798 |goto 29.45,37.28 |next "Learn_Mount" |or
|tip 炖锅房间
|tip 这只坐骑是个稀有掉落。
点击这里获取另一个镜像 |confirm
'|complete hasmount(333023) |or
step
进入建筑物 |goto 27.05,22.01 < 7 |walk
click Broken Mirror##353237
|tip 在建筑物内。
|tip 这些镜子每日只能拾取一次。
collect Silessa's Battle Harness##183798 |goto 27.15,21.63 |next "Learn_Mount" |or
|tip 这只坐骑是个稀有掉落。
点击这里获取另一个镜像 |confirm
'|complete hasmount(333023) |or
step
进入建筑物 |goto 40.86,73.10 < 7 |walk
click Broken Mirror##353237
|tip 在建筑物内。
|tip 这些镜子每日只能拾取一次。
collect Silessa's Battle Harness##183798 |goto 40.41,73.34 |next "Learn_Mount" |or
|tip 这只坐骑是个稀有掉落。
点击这里获取另一个镜像 |confirm
'|complete hasmount(333023) |or
step
click Broken Mirror##353237
|tip 这些镜子每日只能拾取一次。
collect Silessa's Battle Harness##183798 |goto 20.02,54.03 |next "Learn_Mount" |or
|tip 这只坐骑是个稀有掉落。
点击这里重启 |confirm |next "Mirrors_Start"
'|complete hasmount(333023) |or
step
label "Learn_Mount"
use the Silessa's Battle Harness##183798
学习“战斗石像鬼西雷萨”坐骑 |learnmount Battle Gargon Silessa##333023
step
_Congratulations!_
你收集了“战斗加尔贡·西蕾萨”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Battle Gargon Vrednic",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Battle, Gargon, Vrednic, covenant, Venthyr"},
mounts={312754},
patch='90001',
mounttype='Ground',
model={94327},
description="This mount is acquired by completing Chapter 9 of the Venthyr covenant questline.",
},[[
step
完成“统治者的勋章”任务 |q 58407 |future |or
|tip 使用“维瑟鲁斯任务线”升级指南来完成此任务。
'|complete hasmount(312754) |or
step
collect Battle Gargon Vrednic##180948 |or
|tip 这是“统治勋章”任务的奖励。
'|complete hasmount(312754) |or
step
use the Battle Gargon Vrednic##180948
学习战斗瓦尔德尼克坐骑 |learnmount Battle Gargon Vrednic##312754
step
_Congratulations!_
你获得了战斗地狱犬弗雷德尼克坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Crypt Gargon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Crypt, Gargon, covenant, Venthyr"},
mounts={332932},
patch='90001',
mounttype='Ground',
model={94324},
description="This mount is acquired by completing Chapter 4 of the Venthyr covenant questline.",
},[[
step
完成“镜子，镜子……”任务 |q 58440 |future |or
|tip 使用“维瑟鲁斯任务线”升级指南来完成此任务。
'|complete hasmount(332932) |or
step
collect Crypt Gargon##180945 |or
|tip 这是来自“镜子，镜子……”任务的奖励。
'|complete hasmount(332932) |or
step
use the Crypt Gargon##180945
学习"暗影咆哮者"坐骑 |learnmount Crypt Gargon##332932
step
_Congratulations!_
你收集了“ crypt gargon”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Desire's Battle Gargon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Desire's, Battle, Gargon, covenant"},
mounts={332949},
patch='90001',
mounttype='Ground',
model={94328},
description="This mount is acquired from The Countess' Tribute in the Ember Court after reaching Best Friends reputation.",
},[[
step
与女伯爵达到最佳朋友声望 |complete rep('The Countess') == BestFriend or hasmount(332949)
|tip 完成女伯爵的RSVP任务，以招募她加入火焰宫廷。
|tip 每周完成烈焰庭院的活动，专注于奢华、放松和正式的氛围，以提升您与她的声望。
step
click The Countess' Tribute
collect Desire's Battle Gargon##182209 |goto Ember Court/0 47.66,41.07 |or
'|complete hasmount(332949) |or
step
use the Desire's Battle Gargon##182209
学习渴望的战斗巨兽坐骑 |learnmount Desire's Battle Gargon##332949
step
_Congratulations!_
你获得了"渴望之战座狼"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Gravestone Battle Armor",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Gravestone, Battle, Armor, covenant, venthyr"},
mounts={333021},
patch='90001',
mounttype='Ground',
model={94330},
description="This mount is earned by reaching Renown level 39 with the Venthyr covenant.",
},[[
step
达到声望等级39 |complete covenantrenown() >= 39 or hasmount(333021)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“冥界日常任务”指南完成此任务。
step
use the Gravestone Battle Armor##182332
|tip 达到声望等级39后，它将被放入你的背包中。
学习“墓碑战甲”坐骑 |learnmount Gravestone Battle Armor##333021
step
_Congratulations!_
你获得了墓碑战斗铠甲坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Hopecrusher Gargon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Hopecrusher, Gargon, covenant, venthyr"},
mounts={312753},
patch='90001',
mounttype='Ground',
model={95369},
description="This mount is dropped for members of the Venthyr covenant by the rare, Hopecrusher, in Revendreth.",
},[[
step
kill Hopecrusher##166679
|tip 你可能需要团队协作。
collect Hopecrusher Gargon##180581 |goto Revendreth/0 52.07,51.82 |or
|tip 这个掉率有点低。
|tip 你必须是通灵领主阵营的成员才能掉落。
|tip 你可以每天击杀希望毁灭者并获得战利品。
'|complete hasmount(312753) |or
step
use the Hopecrusher Gargon##180581
学习希望破坏者加尔贡坐骑 |learnmount Hopecrusher Gargon##312753
step
_Congratulations!_
你收集了希望破碎者戈贡坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Pale Acidmaw (Venthyr)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Pale, Acidmaw, covenant, Ember, Court"},
mounts={334365},
patch='90001',
mounttype='Ground',
model={94348},
description="This mount is purchased for 5,000 Reservoir Anima after reaching Exalted reputation with The Ember Court.\n\nThis mount is obtainable by all Covenants.",
},[[
step
解锁火焰庭院 |complete covenantfeature("Covenant Unique") >= 1
|tip 使用“雾夜之翼 炽焰庭院”升级指南来完成此任务。
step
与火焰庭院达到崇敬声望 |complete rep('The Ember Court') == Exalted or hasmount(334365)
|tip 每周完成火焰宫殿以提升你的声望。
step
收集5000点蓄能灵能 |complete curcount(1813) >= 5000 or hasmount(334365)
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有精英和开启宝藏来收集灵魂能量。
step
进入建筑物 |goto Revendreth/0 28.72,43.01 < 7 |only if walking
talk Temel##164966
|tip 在建筑物内。
buy 1 Pale Acidmaw##180726 |goto 27.93,43.05 |or
'|complete hasmount(334365) |or
step
use the Pale Acidmaw##180726
学习苍白酸噬坐骑 |learnmount Pale Acidmaw##334365
step
_Congratulations!_
你获得了"苍白酸喉"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Covenant Mounts\\Venthyr Mounts\\Sinfall Gargon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground, mount, Shadowlands, Sinfall, Gargon, covenant, venthyr"},
mounts={332927},
patch='90001',
mounttype='Ground',
model={94326},
description="This mount is purchased for 2,000 Reservoir Anima from Chachi the Artiste after reaching Renown level 23 with the Venthyr covenant.",
},[[
step
达到声望等级23 |complete covenantrenown() >= 23 or hasmount(332927)
|tip 通过完成盟约圣所任务提升你的声望。
|tip 它们是你在盟约基地中可以重复完成的任务。
|tip 使用“冥界日常任务”指南完成此任务。
step
收集 2000 点蓄能灵能 |complete curcount(1813) >= 2000 or hasmount(332927)
|tip 这些可以通过完成世界任务和击败稀有敌人获得。
step
talk Chachi the Artiste##174710
|tip 在建筑物内。
buy 1 Sinfall Gargon##183715 |goto Sinfall/0 54.10,24.63 |or
'|complete hasmount(332927) |or
step
use the Sinfall Gargon##183715
学习“堕落之谷加尔贡”坐骑 |learnmount Sinfall Gargon##332927
step
_Congratulations!_
你收集了“罪落守卫”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Callow Flayedwing",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"mount, Shadowlands, egg, hatched"},
mounts={336038},
patch='90001',
mounttype='Flying',
model={99463},
description="This mount is hatched from a Blight-Touched Egg, which has a low drop chance from chimaeras in Maldraxxus.",
},[[
step
杀死该区域周围的敌人
|tip 新生儿锋牙和满足的锯齿敌人可以掉落此物品。
collect Blight-Touched Egg##184104 |goto Maldraxxus/0 42.42,48.62 |or
|tip 掉率非常低。
'|complete hasmount(336038) |or
step
等待被疫病感染的蛋孵化
collect Cracked Blight-Touched Egg##184103 |or
|tip 被腐化的蛋需要五天才能裂开。
'|complete hasmount(336038) |or
step
use the Cracked Blight-Touched Egg##184103
collect Chewed Reins of the Callow Flayedwing##181818 |or
'|complete hasmount(336038) |or
step
use the Chewed Reins of the Callow Flayedwing##181818
学习“幼嫩剥皮翼龙”坐骑 |learnmount Callow Flayedwing##336038
step
_Congratulations!_
你获得了"幼小剥皮翼"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Endmire Flyer",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount, Shadowlands"},
mounts={332905},
patch='90001',
mounttype='Flying',
model={94353},
description="This mount is dropped by the rare spawn, Famu the Infinite, in Revendreth.",
},[[
step
talk Seeker Hilda##166483
告诉她“让我们关闭那个裂缝！”
|tip 击败按波次出现的敌人以召唤无限之法穆。
kill Famu the Infinite##166521
|tip 这个稀有敌人可能并不总是出现在战场上。
|tip 你需要队友帮助。
|tip 你每天只能拾取一次。
collect Endmire Flyer Tether##180582 |goto Revendreth/0 62.50,47.18 |or
|tip 这个坐骑不是必掉落。
'|complete hasmount(332905) |or
step
use the Endmire Flyer Tether##180582
学习末沼飞行坐骑 |learnmount Endmire Flyer##332905
step
_Congratulations!_
你收集了“终沼飞行器”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Hulking Deathroc",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount, Shadowlands"},
mounts={336042},
patch='90001',
mounttype='Flying',
model={98149},
description="This mount is dropped by the rare spawn, Violet Mistake, in Maldraxxus.",
},[[
step
kill Violet Mistake##157309
|tip 这个稀有敌人通过交还15个腐臭之液和15个粘稠油脂由附近敌人生成。
|tip 你可以通过靠近池子看到当前的总计。
|tip 击杀后点击臭水亡灵，然后将药水带到粘液池。
|tip 腐臭之液从巨型凝胶怪和庞大造物掉落。
|tip 黏稠油从燃烧提取物和巨型浆液中掉落。
|tip 你可能需要团队协作。
collect Slime-Covered Reins of the Hulking Deathroc##182079 |goto Maldraxxus/0 58.22,74.22 |or
|tip 这个坐骑不是必掉落。
汁液可以在以下区域找到：
[59.43,76.97]
[61.51,79.09]
'|complete hasmount(336042) |or
step
use the Slime-Covered Reins of the Hulking Deathroc##182079
学习猛壮死爪坐骑 |learnmount Hulking Deathroc##336042
step
_Congratulations!_
你获得了“庞大死羽鹤”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Marrowfang",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount, dungeon, mythic, Necrotic, Wake"},
mounts={336036},
patch='90001',
mounttype='Flying',
model={98151},
description="This mount has a very small chance to drop from Nalthor the Rimebinder in The Necrotic Wake dungeon on Mythic difficulty.",
},[[
step
进入亡灵觉醒地下城
|tip 以史诗难度进入副本。
进入神话难度的腐烂之醒 |goto Bastion/0 40.18,55.22 < 10 |c |or
'|complete hasmount(336036) |or
step
kill Nalthor the Rimebinder##166945
|tip 该坐骑仅在史诗难度下掉落。
|tip 掉率非常低。
collect Marrowfang's Reins##181819 |goto The Necrotic Wake/2 50.79,47.70 |or
'|complete hasmount(336036) |or
step
use Marrowfang's Reins##181819
学习“骨髓之狼”坐骑 |learnmount Marrowfang##336036
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Shimmermist Runner",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount, Shadowlands"},
mounts={332252},
patch='90002',
mounttype='Flying',
model={94356},
description="This mount is acquired by completing the Mistveil Tangle maze near Root-Home in Ardenweald.",
},[[
step
从这里开始 |goto Ardenweald/0 32.46,51.18 < 15 |walk
click Tale of the Tangle##355547 |goto 32.54,53.06 < 5 |walk
|tip 这是一块挂在树上的警示牌。
沿着小路向下走 |goto 30.96,54.58 < 15 |walk
跟着这条路走 |goto 29.60,56.28 < 10 |walk
沿着右侧小路前进 |goto 29.89,57.80 < 10 |walk
沿着右侧小路前进 |goto 29.01,58.91 < 10 |walk
跟着这条路走 |goto 28.07,58.13 < 10
继续沿着这条路走 |goto 27.04,58.23 < 10 |c |or
'|complete hasmount(332252) |or
step
kill Shizgher##171767
clicknpc Shimmermist Runner##171699
collect Shimmermist Runner##180727 |goto 26.29,58.97 |or
'|complete hasmount(332252) |or
step
use the Shimmermist Runner##180727
学习“闪雾奔行者”坐骑 |learnmount Shimmermist Runner##332252
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Swift Gloomhoof",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={312767},
patch='90002',
mounttype='Flying',
model={94357},
description="This mount is dropped by the rare spawn, Night Mare, in Ardenweald.",
},[[
step
从这里开始 |goto Ardenweald/0 18.06,62.08 < 7 |only if walking
跳到藤蔓上 |goto 17.71,62.14 < 7 |only if walking
攀爬藤蔓 |goto 17.75,62.88 < 7 |only if walking
冲向第二根藤蔓 |goto 18.10,63.48 < 7 |only if walking
小心地沿着墙壁奔跑 |goto 19.41,63.08 < 5 |only if walking
click Cracked Soulweb##355800
|tip 它看起来像是破碎马车后方地面上的一根小树枝。
collect 1 Broken Soulweb##181243 |goto 19.77,63.44 |or
'|complete hasmount(312767) |or
step
collect 10 Lightless Silk##173204 |or
|tip 使用“无光丝绸”采集指南来完成这个。
|tip 你也可以在拍卖行购买它们。
'|complete hasmount(312767) |or
step
完成阿尔登维尔的“戈姆林围栏问题”任务线 |achieve 14800/3 |or
|tip 使用阿尔登维尔升级指南来完成这个。
'|complete hasmount(312767) |or
step
完成阿尔登维尔的“狡猾的小树人”任务线 |achieve 14800/4 |or
|tip 使用阿尔登维尔升级指南来完成这个。
'|complete hasmount(312767) |or
step
talk Elder Gwenna##165704
问她 "你能告诉我关于这个破碎的灵魂之网吗？"
然后“我这里有材料。”
collect 1 Repaired Soulweb##181242 |goto 50.42,33.04 |or
'|complete hasmount(312767) |or
step
talk Elite Queensguard##158555
告诉他我想与伊瑟拉交谈。
请求审听后请点击这里 |confirm |goto 47.65,54.05 |complete itemcount(178675) == 1 or hasmount(312767)
|only if not NightFae
step
talk Ysera##160262
|tip 她将来到你身边。
|tip 在与她交谈前下马。
问她：“伊瑟拉，这个灵魂之网有能力捕捉梦想，但需要力量来实现。你能帮忙吗？”
collect 1 Dream Catcher##178675 |goto Heart of the Forest/0 69.34,45.71 |or
'|complete hasmount(312767) |or
|only if not NightFae
step
talk Ysera##160262
问她：“伊瑟拉，这个灵魂之网有能力捕捉梦想，但需要力量来实现。你能帮忙吗？”
collect 1 Dream Catcher##178675 |goto Heart of the Forest/0 44.78,38.94 |or
'|complete hasmount(312767) |or
|only if  NightFae
step
use the Dream Catcher##178675
获得暗影之梦增益 |havebuff The Shadow's Dream##327083 |goto Ardenweald/0 60.21,49.51 |or
|tip 这个增益效果只会持续五分钟，并且是看到梦魇所必需的。
'|complete hasmount(312767) |or
step
'|use the Dream Catcher##178675
kill Night Mare##168135
|tip 它沿着希伯纳尔岭的东侧南北延伸。
|tip 在这里等它跑过。
|tip 它将在你的小地图上显示为一个金星标记。
|tip 你可能需要团队协作。
|tip 如果暗影之梦增益消失，你需要再次使用梦境捕手来重新施加它。
collect Swift Gloomhoof##180728 |goto 60.21,49.51 |or
'|complete hasmount(312767) |or
step
use the Swift Gloomhoof##180728
学习迅捷暗蹄坐骑 |learnmount Swift Gloomhoof##312767
step
_Congratulations!_
你收集了迅捷阴影蹄坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Arboreal Gulper",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={339632},
patch='90001',
mounttype='Ground',
model={98498},
description="This mount is dropped by the rare spawn, Humon'gozz, in Ardenweald.",
},[[
step
达到60级 |ding 60
|tip 你可以在60级前获得坐骑物品，但你必须达到60级才能学习这个坐骑。
step
杀死该区域周围的敌人
collect Unusually Large Mushroom##175247 |goto Ardenweald/0 45.37,74.17 |or
|tip 这个掉落率大约是3-5%。
|tip 该物品只持续20分钟，然后会消失。
'|complete hasmount(339632) |or
step
跟着这条路走 |goto 32.75,33.81 < 15 |only if walking
click Damp Loam##344732
|tip 建议在点击之前清除该区域的敌人。
kill Humon'gozz##164112
|tip 你可能需要团队协作。
collect Arboreal Gulper##182650 |goto 32.43,30.27 |or
'|complete hasmount(339632) |or
step
use the Arboreal Gulper##182650
学习“树冠吞噬者”坐骑 |learnmount Arboreal Gulper##339632
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Battle-Bound Warhound",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={344228},
patch='90001',
mounttype='Ground',
model={98224},
description="This mount is a rare drop from elite enemies in the Theater of Pain in Maldraxxus.",
},[[
step
在此区域击杀精英敌人
|tip 你可能需要团队协作。
|tip 敌人持续一波一波出现。
|tip 你每天可以从六个首领身上拾取一次战利品。
collect Gnawed Reins of the Battle-Bound Warhound##184062 |goto Maldraxxus/0 50.38,47.29 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(344228) |or
step
use the Gnawed Reins of the Battle-Bound Warhound##184062
学习“战斗束缚战犬”坐骑 |learnmount Battle-Bound Warhound##344228
step
_Congratulations!_
你获得了“战斗牵绊战犬”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Blisterback Bloodtusk",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={332478},
patch='90001',
mounttype='Ground',
model={98169},
description="This mount is dropped by the rare spawn, Warbringer Mal'Korak, in Maldraxxus.",
},[[
step
kill Warbringer Mal'Korak##162819
|tip 这个稀有敌人可能并不总是出现在战场上。
|tip 你可能需要团队协作。
collect Blisterback Bloodtusk##182085 |goto Maldraxxus/0 33.70,80.17 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(332478) |or
step
use the Blisterback Bloodtusk##182085
学习“脓背血蹄”坐骑 |learnmount Blisterback Bloodtusk##332478
step
_Congratulations!_
你收集到了"水泡背血牙"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Gorespine",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={332480},
patch='90001',
mounttype='Ground',
model={98168},
description="This mount is dropped by the rare spawn, Nerissa Heartless, in Maldraxxus.",
},[[
step
kill Nerissa Heartless##162690
|tip 这个稀有敌人可能并不总是出现在战场上。
|tip 每40分钟左右刷出一次。
|tip 她在这个区域徘徊。
|tip 你可能需要团队协作。
collect Gorespine##182084 |goto Maldraxxus/0 65.88,35.31 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(332480) |or
step
use Gorespine##182084
学习“戈尔斯派恩”坐骑 |learnmount Gorespine##332480
step
_Congratulations!_
你收集了“血刺”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Loyal Gorger",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={333027},
patch='90001',
mounttype='Ground',
model={97379},
description="This mount is dropped by the rare spawn, Worldedge Gorger, in Revendreth.",
},[[
step
达到50级 |ding 50
|tip 你必须达到50级才能继续。
step
talk Tessle the Snitch##168618
accept The Endmire##60480 |goto Revendreth/0 65.12,63.52
step
click Stolen Infused Ruby##352431
|tip 这些看起来像是在这个区域地面上散落的红色宝石。
collect Infused Ruby |q 60480/1 |goto 66.40,61.30
step
talk Tessle the Snitch##168618
turnin The Endmire##60480 |goto Revendreth/0 65.12,63.52
|tip 他将赋予你激活_灵魂守卫火盆_的能力。
step
label "NO_IMPRESSIONABLE_GORGER_SPAWN_YET"
消灭此区域内的侵扰、贪婪、入侵和庞大的敌人
|tip 这里沿河床的螨虫、吞噬者、渴噬者、厄运之牙和贪食者敌人可以掉落这个物品。
|tip 你可以收集诱人的灵魂能量，但每天只能击杀精英一次以获取坐骑物品。
|tip 你只能同时拥有一个这些。
|tip 如果物品没有掉落，检查你的银行看看你是否已经拥有一个。
collect Enticing Anima##173939 |goto Revendreth/0 44.48,68.54 |or
'|complete hasmount(333027) |or
step
use the Enticing Anima##173939
|tip 在这里的两个火盆附近使用它以召唤世界边缘吞噬者。
|tip 远离边缘，以免被击下去。
kill Worldedge Gorger##160821
|tip 这个召唤的怪物是62级精英。
|tip 你可能需要团队协作。
collect Impressionable Gorger Spawn##180583 |goto Revendreth/0 38.64,72.15 |or
|tip 此物品将不会在你的背包中。
|tip 你每天只能从世界之边的吞噬者身上获取印记吞噬者幼崽一次。
|tip 这个物品的掉落率非常低。
|tip 每次想要召唤它时，你需要去收集一个新的诱人灵能。
点击这里返回上一步 |confirm |next "NO_IMPRESSIONABLE_GORGER_SPAWN_YET"
'|complete hasmount(333027) |or
step
达到60级 |ding 60 |or
'|complete hasmount(333027) |or
step
talk Impressionable Gorger Spawn##174475
|tip 它会出现在你身边。
accept Nipping at the Undergrowth##61839 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
click Endmire Vineroot##358404
|tip 他们全都在这里的河床上。
collect 18 Endmire Vineroot##182314 |q 61839/1 |goto Revendreth/0 65.20,55.40 |or
你可以在附近找到更多：
[60.10,56.90]
[57.57,60.48]
[69.39,59.92]
[71.49,63.02]
[66.09,61.89]
[65.20,65.19]
'|complete hasmount(333027) |or
step
talk Impressionable Gorger Spawn##174475
|tip 在你身边。
turnin Nipping at the Undergrowth##61839 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Impressionable Gorger Spawn##174475
accept Vineroot on the Menu##61840 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
click Endmire Vineroot##358406
|tip 他们全都在这里的河床上。
collect 35 Endmire Vineroot##182314 |q 61839/1 |goto Revendreth/0 65.20,55.40 |or
你可以在附近找到更多：
[60.10,56.90]
[57.57,60.48]
[69.39,59.92]
[71.49,63.02]
[66.09,61.89]
[65.20,65.19]
'|complete hasmount(333027) |or
step
talk Gorger Spawn##174475
|tip 在你身边。
turnin Vineroot on the Menu##61840 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Gorger Spawn##174475
accept Vineroot Will Not Do##61842 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
击杀微型敌人
|tip 灵魂小虫、吞噬小虫、入侵小虫、饥饿小虫和侵扰小虫都会掉落这些物品。
collect 10 Infused Endmire Fruit##182315 |q 61842/1 |goto Revendreth/0 58.20,59.40 |or
你可以在附近找到更多：
[62.80,47.56]
[66.19,65.39]
[46.78,66.56]
[68.19,62.01]
[40.60,71.59]
'|complete hasmount(333027) |or
step
talk Juvenile Gorger##174475
|tip 在你身边。
turnin Vineroot Will Not Do##61842 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Impressionable Gorger Spawn##174475
|tip 它会出现在你身边。
accept Hungry Hungry Gorger##61844 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
击杀微型敌人
|tip 灵魂小虫、吞噬小虫、入侵小虫、饥饿小虫和侵扰小虫都会掉落这些物品。
collect 16 Infused Endmire Fruit##182315 |q 61844/1 |goto Revendreth/0 58.20,59.40 |or
你可以在附近找到更多：
[62.80,47.56]
[66.19,65.39]
[46.78,66.56]
[68.19,62.01]
[40.60,71.59]
'|complete hasmount(333027) |or
step
talk Juvenile Gorger##174475
|tip 在你身边。
turnin Hungry Hungry Gorger##61844 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Juvenile Gorger##174475
|tip 它会出现在你身边。
accept Standing Toe To Toe##62044 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
击杀周围的食尸鬼敌人
|tip 恐惧吞噬者和终焉吞噬者都算作此任务的完成。
击杀3个盗窃者 |q 62044/1 |goto Revendreth/0 57.58,60.19 |or
你可以在[62.79,46.20]附近找到更多。
'|complete hasmount(333027) |or
step
talk Juvenile Gorger##174475
|tip 在你身边。
turnin Standing Toe To Toe##62044 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Juvenile Gorger##174475
|tip 它会出现在你身边。
accept Ready for More##62045 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
击杀周围的食尸鬼敌人
|tip 恐惧吞噬者和终焉吞噬者都算作此任务的完成。
击杀7个啃食者 |q 62045/1 |goto Revendreth/0 57.58,60.19 |or
你可以在[62.79,46.20]附近找到更多。
'|complete hasmount(333027) |or
step
talk Juvenile Gorger##174475
|tip 在你身边。
turnin Ready for More##62045 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
等待下一个任务变为激活状态
|tip 下一个任务在每日重置后激活。
talk Loyal Gorger##174475
|tip 它会出现在你身边。
accept A New Pack##62046 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
kill Unbidden Worldeater##157698
击杀无召唤的世界吞噬者 |q 62046/1 |goto Revendreth/0 65.57,56.02 |or
你可以在[67.59,61.20]附近找到更多。
'|complete hasmount(333027) |or
step
talk Loyal Gorger##174475
|tip 在你身边。
turnin A New Pack##62046 |n
collect Loyal Gorger##182589 |goto Revendreth/0 63.10,56.20 |or
'|complete hasmount(333027) |or
step
use Loyal Gorger##182589
学习忠诚的吞噬者坐骑 |learnmount Loyal Gorger##333027
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Mawsworn Soulhunter",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={312762},
patch='90001',
mounttype='Ground',
model={92631},
description="This mount is dropped by the rare spawn, Gorged Shadehound, in The Maw.",
},[[
step
接受或完成《规则6：隐匿就是一切》任务在马尔沃斯 |complete haveq(60285) or completedq(60285)
|tip 使用“深渊”升级指南来完成这个。
|tip 这个任务是解除兽人废墟区域的减益效果所必需的。
step
kill Gorged Shadehound##174827
|tip 这个稀有敌人仅在“猎杀：阴影猎犬”事件的最后阶段出现。
|tip 每周只能掠夺一次。
collect Mawsworn Soulhunter##184167 |goto The Maw/0 53.48,79.48 |or
|tip 这个坐骑掉率非常低。
'|complete hasmount(312762) |or
step
use the Mawsworn Soulhunter##184167
学习“冥狱咒印灵魂猎手”坐骑 |learnmount Mawsworn Soulhunter##312762
step
_Congratulations!_
你收集了“灵魂猎手”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Dropped Mounts\\Spinemaw Gladechewer",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={334364},
patch='90001',
mounttype='Ground',
model={94349},
description="This mount is dropped by the rare spawn, Gormtamer Tizo, in Ardenweald.",
},[[
step
kill Bristlecone Terror##166736+
|tip 他们正在骑着精英狂乱守卫。
|tip 击杀它们有小几率会召唤出一个小噬咬者。
kill Chompy##164110
|tip 击杀Chompy将召唤戈姆驯兽师提佐。
|tip 建议组队以提高效率和速度。
kill Gormtamer Tizo##164107
|tip 你可能需要团队协作。
collect Spinemaw Gladechewer##180725 |goto Ardenweald/0 29.60,56.28 |or
'|complete hasmount(334364) |or
step
use the Spinemaw Gladechewer##180725
学习“脊喉噬咬者”坐骑 |learnmount Spinemaw Gladechewer##334364
step
_Congratulations!_
你获得了“脊鳍傲骨吞噬者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Ascended Skymane",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands"},
mounts={342335},
patch='90001',
mounttype='Flying',
model={94293},
description="This mount is a rare drop from defeating the Ascended Council, which are summoned by ringing the five Vesper bells throughout Bastion.\n\nYou will likely need a raid group to ring the bells within time and defeat the Ascended Council.",
},[[
stickystart "Group_Information"
step
click Vesper of Loyalty##354036 |goto Bastion/0 32.19,17.84
confirm |or
'|complete hasmount(342335) |or
step
click Anima Gateway |goto 39.55,19.01 < 7 |only if walking
click Vesper of Wisdom##354095 |goto 39.16,20.36
confirm |or
'|complete hasmount(342335) |or
step
click Anima Gateway |goto 39.14,56.12 < 7 |only if walking
click Vesper of Courage##354097 |goto 33.38,59.74
confirm |or
'|complete hasmount(342335) |or
step
click Anima Gateway |goto 69.37,40.32 < 7 |only if walking
click Vesper of Humility##354096 |goto 71.91,38.92
confirm |or
'|complete hasmount(342335) |or
step
click Anima Gateway |goto 63.47,72.39 < 7 |only if walking
click Vesper of Purity##334847 |goto 64.34,69.84
confirm |complete hasmount(342335) |next "Collect_Ascended_Skymane"
step
label "Group_Information"
建议团队完成此指南
|tip 需要至少三名玩家共同在五分钟内完成响起五个晨星钟。
|tip 在以下每个地点放置一个玩家，然后在第一次钟声响起后五分钟内敲响钟声。
|tip 如果成功完成，你将看到信息“圣升议会已集结！他们将在1分钟内抵达追随者的觉醒。”
|tip 如果铃铛未激活，你需要等待1-2小时才能重新找寻它们的重生。
confirm |complete hasmount(342335) |notinsticky
step
label "Collect_Ascended_Skymane"
在该区域击杀冠军敌人
|tip 这是一场艰难的战斗，需要一个团队。
click Cache of the Ascended##354175
collect Ascended Skymane##183741 |goto 53.50,88.80 |or
|tip 这个坐骑掉率非常低。
|tip 你每天可以掠夺一次宝藏。
'|complete hasmount(342335) |or
step
use the Ascended Skymane##183741
学习“升华天猾”坐骑 |learnmount Ascended Skymane##342335
step
_Congratulations!_
你获得了“升天苍狮”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Bulbous Necroray",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands", "covenant"},
mounts={344574},
patch='90001',
mounttype='Flying',
model={99439},
description="This mount is a rare drop from Tribute of the Ambitious and Tribute of the Duty-Bound obtained from Covenant Callings.",
},[[
step
collect Tribute of the Ambitious##181732 |n
collect Tribute of the Duty-Bound##181733 |n
|tip 这些贡品是完成在梅尔德拉克斯发生的盟约召唤日常以及灵能回收日常的奖励。
|tip 使用你所在盟约的“盟约日常任务”指南来完成这个。
use Tribute of the Ambitious##181732 |only if itemcount(181732) == 1
use Tribute of the Duty-Bound##181733 |only if itemcount(181733) == 1
collect 1 Necroray Egg##184159 |complete hasmount(344574) or itemcount (184158) >= 1
|tip 该物品大约有2%的掉落率。
step
collect 1 Oozing Necroray Egg##184158 |or
|tip 孵化亡者之翼蛋需要三天，才能变成溢出的。
'|complete hasmount(344574) |or
step
use the Oozing Necroray Egg##184158
collect Bulbous Necroray##184160 |or
|tip 这个蛋也可以掉落感染和瘟疫死灵飞龙坐骑。
'|complete hasmount(344574) |or
step
use the Bulbous Necroray##184160
学习“膨胀死灵射线”坐骑 |learnmount Bulbous Necroray##344574
step
_Congratulations!_
你收集到了"膨体死灵光雕"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Chittering Animite",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying", "mount", "Shadowlands", "covenant", "command", "table"},
mounts={312776},
patch='90001',
mounttype='Flying',
model={94355},
description="This mount is acquired randomly by completing Adventure missions from the Command Table inside your Covenant.",
},[[
step
解锁指挥 table 宗约灵魂升级 |complete covenantfeature("Command Table") >= 1 or hasmount(312776)
|tip 使用“基尔加丹指挥桌”升级指南来完成此任务。|仅在基尔加丹时使用
|tip 使用“死灵领主指挥桌” leveling guide 来完成此任务。 |仅在 死灵领主
|tip 使用夜之 Fay 指挥桌升级指南完成此任务。 |仅在夜之 Fay 时使用
|tip 使用"Venthyr指挥表"升级指南来完成此任务。|仅当Venthyr时
step
clicknpc Command Table##176143 |goto Elysian Hold/0 43.34,41.24 |only if  Kirian
clicknpc Command Table##176143 |goto Seat of the Primus/0 39.31,46.32 |only if  Necrolord
clicknpc Command Table##176143 |goto Ardenweald/0 44.74,56.31 |only if  NightFae
clicknpc Command Table##176143 |goto Sinfall/0 55.82,61.46 |only if  Venthyr
|tip 这个坐骑会随机作为任务桌冒险的奖励出现。
|tip 定期完成冒险以提高获得正确冒险的机会。
collect Chittering Animite##183617 |or
'|complete hasmount(312776) |or
step
use the Chittering Animite##183617
学习噬鳞虫骑宠 |learnmount Chittering Animite##312776
step
_Congratulations!_
你收集到了“喃喃细语的矿石”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Highwind Darkmane",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying", "mount", "Shadowlands", "covenant", "command", "table"},
mounts={341776},
patch='90001',
mounttype='Flying',
model={93769},
description="This mount is acquired randomly by completing Adventure missions from the Command Table inside your Covenant.",
},[[
step
解锁指挥 table 宗约灵魂升级 |complete covenantfeature("Command Table") >= 1 or hasmount(312776)
|tip 使用“基尔加丹指挥桌”升级指南来完成此任务。|仅在基尔加丹时使用
|tip 使用“死灵领主指挥桌” leveling guide 来完成此任务。 |仅在 死灵领主
|tip 使用夜之 Fay 指挥桌升级指南完成此任务。 |仅在夜之 Fay 时使用
|tip 使用"Venthyr指挥表"升级指南来完成此任务。|仅当Venthyr时
step
clicknpc Command Table##176143 |goto Elysian Hold/0 43.34,41.24 |only if  Kirian
clicknpc Command Table##176143 |goto Seat of the Primus/0 39.31,46.32 |only if  Necrolord
clicknpc Command Table##176143 |goto Ardenweald/0 44.74,56.31 |only if  NightFae
clicknpc Command Table##176143 |goto Sinfall/0 55.82,61.46 |only if  Venthyr
|tip 这个坐骑会随机作为任务桌冒险的奖励出现。
|tip 定期完成冒险以提高获得正确冒险的机会。
collect Highwind Darkmane##183618 |or
'|complete hasmount(341776) |or
step
use the Highwind Darkmane##183618
学习高翅黑鬃坐骑 |learnmount Highwind Darkmane##341776
step
_Congratulations!_
你收集了“高风暗鬃”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Infested Necroray",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands", "covenant"},
mounts={344576},
patch='90001',
mounttype='Flying',
model={99441},
description="This mount is a rare drop from Tribute of the Ambitious and Tribute of the Duty-Bound obtained from Covenant Callings.",
},[[
step
collect Tribute of the Ambitious##181732 |n
collect Tribute of the Duty-Bound##181733 |n
|tip 这些贡品是完成在梅尔德拉克斯发生的盟约召唤日常以及灵能回收日常的奖励。
|tip 使用你所在盟约的“盟约日常任务”指南来完成这个。
use Tribute of the Ambitious##181732 |only if itemcount(344576) == 1
use Tribute of the Duty-Bound##181733 |only if itemcount(344576) == 1
collect 1 Necroray Egg##184159 |complete hasmount(344576) or itemcount (184158) >= 1
|tip 该物品大约有2%的掉落率。
step
collect 1 Oozing Necroray Egg##184158 |or
|tip 孵化亡者之翼蛋需要三天，才能变成溢出的。
'|complete hasmount(344576) |or
step
use the Oozing Necroray Egg##184158
collect Infested Necroray##184161 |or
|tip 这个蛋也可以掉落肿胀和瘟疫亡灵飞龙坐骑。
'|complete hasmount(344576) |or
step
use the Infested Necroray##184161
学习“肆虐死灵飞龙”坐骑 |learnmount Infested Necroray##344576
step
_Congratulations!_
你获得了"感染的死灵飞龙"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Pestilent Necroray",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands", "covenant"},
mounts={344575},
patch='90001',
mounttype='Flying',
model={99440},
description="This mount is a rare drop from Tribute of the Ambitious and Tribute of the Duty-Bound obtained from Covenant Callings.",
},[[
step
collect Tribute of the Ambitious##181732 |n
collect Tribute of the Duty-Bound##181733 |n
|tip 这些贡品是完成在梅尔德拉克斯发生的盟约召唤日常以及灵能回收日常的奖励。
|tip 使用你所在盟约的“盟约日常任务”指南来完成这个。
use Tribute of the Ambitious##181732 |only if itemcount(344575) == 1
use Tribute of the Duty-Bound##181733 |only if itemcount(344575) == 1
collect 1 Necroray Egg##184159 |complete hasmount(344575) or itemcount (184158) >= 1
|tip 该物品大约有2%的掉落率。
step
collect 1 Oozing Necroray Egg##184158 |or
|tip 孵化亡者之翼蛋需要三天，才能变成溢出的。
'|complete hasmount(344575) |or
step
use the Oozing Necroray Egg##184158
collect Pestilent Necroray##184162 |or
|tip 这个蛋也可以掉落膨胀和虫害的死灵飞龙坐骑。
'|complete hasmount(344575) |or
step
use the Pestilent Necroray##184162
学习"瘟疫死灵飞龙"坐骑 |learnmount Pestilent Necroray##344575
step
_Congratulations!_
你收集了“瘟疫死灵飞龙”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Silverwind Larion",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands"},
mounts={334433},
patch='90001',
mounttype='Flying',
model={93770},
description="This mount is acquired by finding all 50 anima crystal shards in Bastion, The Necrotic Wake dungeon and the Spires of Ascension dungeon.",
},[[
step
达到60级 |ding 60
|tip 你必须达到60级才能看到你需要收集的碎片。
|tip 使用升级指南来完成这个任务。
|tip 一堆哥布林滑翔器对于大多数职业都是有益的。
step
click Anima Crystal Shard##355534
|tip 桥下的暗影
|tip 从桥的边缘跳下，使用地精滑翔器、英勇飞跃等技能到达底部平台。
|tip 在你获得碎片后，跳下平台，一个升华的承载者会接住你并把你带回桥上。
寻找碎片1 |q 61225 |future |goto Bastion/0 39.05,77.04
step
click Anima Crystal Shard##355534
寻找碎片 2 |q 61235 |future |goto 43.63,76.22
|tip 在瀑布上方的小岩石平台上。
step
沿着道路向上走 |goto 47.05,72.33 < 10 |only if walking
继续沿着道路前进 |goto 47.31,70.01 < 15 |only if walking
跳下悬崖并滑翔 |goto 48.63,70.77 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 从悬崖使用哥布林滑翔器前往碎片。
|tip 在一座尖拱的顶部，大约在东北侧的中间位置。
寻找碎片3 |q 61236 |future |goto 48.42,72.73
step
click Anima Crystal Shard##355534
|tip 在水池上方的小悬崖上。
寻找碎片4 |q 61237 |future |goto 52.67,75.55
step
click Anima Crystal Shard##355534
|tip 在水下，桥下。
寻找碎片5 |q 61238 |future |goto 53.31,73.62
step
click Anima Crystal Shard##355534
|tip 从悬崖边缘跳下，使用地精滑翔器、英雄跃迁等到达石柱的顶部。
寻找碎片6 |q 61239 |future |goto 53.49,80.60
step
小心翼翼地走在边缘 |goto 56.01,85.55 < 3 |only if walking
click Anima Crystal Shard##355534
|tip 在第一反射之室入口处上方的岩石平台上。
寻找碎片7 |q 61241 |future |goto 55.96,86.66
step
沿着道路向上走 |goto 55.48,88.73 < 7 |only if walking
跳下这里 |goto 61.03,86.26 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 岩石悬崖上
寻找碎片8 |q 61244 |future |goto 61.04,85.66
step
跳下这里 |goto 57.98,80.13 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在水边的岩石平台上
寻找碎片9 |q 61245 |future |goto 58.10,80.08
step
沿着道路向上走 |goto 57.53,72.86 < 15 |only if walking
小心跳下这里 |goto 56.83,74.92 < 5 |only if walking
click Anima Crystal Shard##355534
|tip 在水池上方的小水泉上。
寻找碎片 10 |q 61247 |future |goto 56.87,74.98
step
过桥战斗 |goto 60.98,74.62 < 15 |only if walking
click Anima Gateway
乘坐灵能之门 |complete _G.UnitOnTaxi("player") |goto 63.46,72.39 < 7 |q 61249 |future
|only if walking
step
click Anima Crystal Shard##355534
|tip 在平台上方的支柱外缘坐着。
寻找碎片 11 |q 61249 |future |goto 65.52,71.92
step
click Anima Crystal Shard##355534
|tip 瀑布顶端桥下的地方
寻找碎片12 |q 61250 |future |goto 58.15,63.91
step
click Anima Crystal Shard##355534
|tip 在瀑布下的小型钟形结构内的地面上。
寻找碎片13 |q 61251 |future |goto 54.03,59.68
step
沿着道路向上走 |goto 49.26,59.13 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在倒下的石拱门顶端。
寻找碎片14 |q 61253 |future |goto 46.70,65.95
step
click Anima Crystal Shard##355534
|tip 在一个小木屋的屋顶上。
寻找碎片15 |q 61254 |future |goto 50.68,56.14
step
click Anima Crystal Shard##355534
|tip 在Epistasia下方的小石头平台上。
找到碎片16 |q 61257 |future |goto 34.84,65.78
step
跳上门框 |goto Bastion/0 51.06,47.53 < 5 |only if walking |region heros_rest
小心走在悬崖边缘 |goto 51.26,47.87 < 5 |only if walking |region heros_rest
click Anima Crystal Shard##355534
|tip 在英雄殿堂下方的小悬崖上。
寻找碎片17 |q 61258 |future |goto 51.67,48.02 |region heros_rest
step
click Anima Crystal Shard##355534
|tip 平台下方的地面。
寻找碎片 18 |q 61260 |future |goto 47.08,49.23
step
跟着这条路走 |goto 41.43,54.48 < 20 |only if walking
沿着岩石边缘行走 |goto 40.22,47.32 < 15 |only if walking
继续沿着岩石边缘前进 |goto 41.09,47.54 < 8 |only if walking
click Anima Crystal Shard##355534
|tip 在小石头平台上。
寻找碎片19 |q 61261 |future |goto 41.39,46.63
step
跟着这条路走 |goto 42.81,56.33 < 20 |only if walking
跳下这里 |goto 40.39,59.23 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在石柱之上。
寻找碎片20 |q 61263 |future |goto 40.04,59.12
step
click Anima Crystal Shard##355534
|tip 在倾斜的石头建筑顶端。
寻找碎片 21 |q 61264 |future |goto 38.52,53.26
step
click Anima Crystal Shard##355534
|tip 坐在树根下。
寻找碎片22 |q 61270 |future |goto 57.64,55.67
step
click Anima Crystal Shard##355534
|tip 在上层平台的书架上。
寻找碎片 23 |q 61271 |future |goto 65.25,42.88
step
沿着下方平台行走 |goto 71.48,38.97 < 5 |only if walking
click Anima Crystal Shard##355534
|tip 在悬崖下方的小石头平台上。
寻找碎片 24 |q 61273 |future |goto 72.38,40.29
step
沿着道路向上走 |goto 65.91,39.25 < 15 |only if walking
沿着岩石崖缘奔跑 |goto 66.77,26.98 < 5 |only if walking
click Anima Crystal Shard##355534
|tip 在小平台下的岩石边缘。
找到碎片 25 |q 61274 |future |goto 66.89,26.92
step
进入洞穴 |goto 55.71,42.82 < 7 |walk
跟着这条路走 |goto 56.71,40.67 < 7 |walk
click Anima Crystal Shard##355534
|tip 洞穴内的桶后面。
寻找碎片26 |q 61275 |future |goto 57.55,38.27
step
沿着道路向上走 |goto 53.54,41.22 < 15 |only if walking
click Anima Crystal Shard##355534
|tip 在石柱顶端。
|tip 你需要小心地跃下并落在它的顶部。
寻找碎片27 |q 61277 |future |goto 52.16,39.39
step
沿着道路向上走 |goto 49.55,40.36 < 15 |only if walking
小心跳下这里 |goto 49.36,38.46 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 桥下的暗影
|tip 你可能需要骑上坐骑才能跳过这个鸿沟。
寻找碎片 28 |q 61278 |future |goto 49.99,38.26
step
沿着道路向上走 |goto 49.59,40.27 < 15 |only if walking
小心跳下这里 |goto 48.30,35.02 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在石柱之巅。
|tip 直走会让你到达柱子上。
寻找碎片29 |q 61279 |future |goto 48.48,34.91
step
进入建筑物 |goto 56.90,28.84 < 7 |walk
click Anima Crystal Shard##355534
|tip 在小建筑内的桌子上。
寻找碎片 30 |q 61280 |future |goto 56.72,28.84
step
冲上楼梯 |goto 55.99,28.70 < 15 |only if walking
跳下到下面的石头平台 |goto 55.92,17.85 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在纪念献祭宝藏上方的小岩石平台上。
寻找碎片31 |q 61281 |future |goto 56.20,17.31
step
跟着这条路走 |goto 58.32,16.30 < 15 |only if walking
从这里跳下去 |goto 58.97,15.62 < 10 |only if walking
|tip 如果你的血量满了，你就不会死亡。
被背着上崖 |goto 57.54,15.28 < 7 |only if walking
小心跳下这里 |goto 59.80,13.55 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在悬崖边缘的小石头平台上
|tip 你需要一个位移技能或一个哥布林滑翔机才能避免摔死。
|tip 点击水晶碎片后，你可以再次跳下边缘返回悬崖顶端。
寻找碎片32 |q 61282 |future |goto 59.88,13.91
step
进入洞穴 |goto 53.54,9.48 < 10 |walk
click Anima Crystal Shard##355534
|tip 在洞穴里的几个桶后面。
寻找碎片33 |q 61283 |future |goto 52.44,09.42
step
沿着小路向下走 |goto 47.60,17.30 < 20 |only if walking
跳上岩石 |goto 45.49,20.08 < 10 |only if walking
跳到岩石平台上 |goto 46.00,20.15 < 5 |only if walking
沿着岩石崖缘奔跑 |goto 46.39,20.29 < 5 |only if walking
继续沿着岩石边缘前进 |goto 46.74,18.95 < 5 |only if walking
click Anima Crystal Shard##355534
|tip 在大石悬崖下的小岩石平台上。
寻找碎片 34 |q 61284 |future |goto 46.69,18.04
step
沿着道路向上走 |goto 46.09,25.50 < 10 |only if walking
跳下这里 |goto 44.14,25.76 < 10 |only if walking
跃上石门 |goto 44.68,28.41 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在瀑布背后的岩石突出部位。
|tip 小心地跳下去。
寻找碎片 35 |q 61285 |future |goto 44.94,28.45
step
沿着道路向上走 |goto 42.46,22.69 < 15 |only if walking
继续沿着这条路走 |goto 43.61,21.69 < 20 |only if walking
click Anima Crystal Shard##355534
|tip 岩石边缘上
寻找碎片36 |q 61286 |future |goto 42.30,24.02
step
沿着道路向上走 |goto 38.32,28.56 < 15 |only if walking
继续沿着这条路走 |goto 34.84,25.42 < 20 |only if walking
沿着岩石边缘走。 |goto 35.79,23.28 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在水池上方的岩石平台上
寻找碎片37 |q 61287 |future |goto 37.10,24.68
step
跟随小岩石边缘 |goto 43.54,33.83 < 5 |only if walking
click Anima Crystal Shard##355534
|tip 岩石边缘上
寻找碎片38 |q 61288 |future |goto 42.81,33.21
step
跳下这里 |goto 42.80,39.78 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 在蓝色屋顶的小建筑顶部。
寻找碎片39 |q 61289 |future |goto 42.71,39.40
step
越过栏杆 |goto 33.39,36.82 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在岩石边缘的后方
寻找碎片40 |q 61290 |future |goto 33.03,37.62
step
冲上楼梯 |goto 33.22,33.27 < 10 |only if walking
click Anima Crystal Shard##355534
|tip 水下沉没雕像旁边。
寻找碎片41 |q 61291 |future |goto 31.00,27.47
step
跟着这条路走 |goto 33.40,27.90 < 15 |only if walking
继续沿着这条路走 |goto 27.99,21.18 < 7 |only if walking
沿着小石头悬崖奔跑 |goto 27.68,19.21 < 5 |only if walking
继续沿着这条路走 |goto 29.56,21.25 < 7 |only if walking
跳下这里 |goto 30.66,22.65 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在石拱门顶端。
寻找碎片42 |q 61292 |future |goto 30.61,23.73
step
click Anima Crystal Shard##355534
|tip 在有灵能之门的平台下方的石柱顶部。
寻找碎片 43 |q 61293 |future |goto 24.64,22.98
step
click Anima Crystal Shard##355534
|tip 在桶后面
寻找碎片44 |q 61294 |future |goto 26.15,22.62
step
冲上楼梯 |goto 27.04,21.45 < 10 |only if walking
跟着这条路走 |goto 26.10,19.39 < 10 |only if walking
进入建筑物 |goto 24.84,18.31 < 7 |only if walking
click Anima Crystal Shard##355534
|tip 在建筑内的书架上。
寻找碎片 45 |q 61295 |future |goto 24.37,18.21
step
进入腐化之醒地城 |goto The Necrotic Wake/0 78.91,39.74 < 1000 |c |q 61297 |future
|tip 你可能需要一个团队才能完成这个。
step
死因之醒地牢内部：
click Anima Crystal Shard##355534
|tip 在最终钟声的南侧，击败瘟疫骨后，靠近大型棕色倒下的钟。
|tip 打开你的世界地图将会在其位置显示一个小点。
|tip 你可能需要一个团队才能完成这个。
|tip 使用《死亡之喉》副本指南来完成这个。
寻找碎片46 |q 61296 |future |goto The Necrotic Wake/0 52.50,88.60
step
死因之醒地牢内部：
click Anima Crystal Shard##355534
|tip 在勇气之陨的东北侧一堆瓦砾中的石柱后面。
|tip 打开你的世界地图将会在其位置显示一个小点。
|tip 你可能需要一个团队才能完成这个。
|tip 使用《死亡之喉》副本指南来完成这个。
寻找碎片 47 |q 61297 |future |goto 36.20,22.80
step
进入升腾尖塔地城 |goto Spires of Ascension/1 46.60,53.10 < 1000 |c |q 61300 |future
|tip 你可能需要一个团队才能完成这个。
step
在升腾之尖巢穴内
click Anima Crystal Shard##355534
|tip 在房间左后角的休息椅后面与金塔拉一起。
|tip 打开你的世界地图将会在其位置显示一个小点。
|tip 你可能需要一个团队才能完成这个。
|tip 使用“升腾之柱”副本指南来完成这个。
寻找碎片48 |q 61298 |future |goto Spires of Ascension/1 46.60,53.10
step
在升腾之尖巢穴内
click Anima Crystal Shard##355534
|tip 在击败文图纳克斯后，翅膀冠军左侧的大火炬后面。
|tip 打开你的世界地图将会在其位置显示一个小点。
|tip 你可能需要一个团队才能完成这个。
|tip 使用“升腾之柱”副本指南来完成这个。
寻找碎片49 |q 61299 |future |goto Spires of Ascension/1 69.40,38.70
step
在升腾之尖巢穴内
click Anima Crystal Shard##355534
|tip 在忠诚之泉前的中央字体结构内，翼之冠军后方的岩石边缘上。
|tip 打开你的世界地图将会在其位置显示一个小点。
|tip 你可能需要一个团队才能完成这个。
|tip 使用“升腾之柱”副本指南来完成这个。
寻找碎片50 |q 61300 |future |goto Spires of Ascension/2 49.80,46.90
step
talk Forgelite Hephaesius##171732
告诉他“我带来了灵魂碎片的水晶。”
观看对话
collect 1 Crystal Mallet of Heralds##180858 |goto Bastion/0 59.36,31.39 |or
'|complete hasmount(334433) |or
step
click Vesper of the Silver Wind##355435
click Gift of the Silver Wind##355449
collect Silverwind Larion##180772 |goto 36.13,26.61 |or
'|complete hasmount(334433) |or
step
use the Silverwind Larion##180772
学习银风拉里昂坐骑 |learnmount Silverwind Larion##334433
step
_Congratulations!_
你获得了银风兽坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Sundancer",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"flying", "mount", "Shadowlands"},
mounts={312765},
patch='90001',
mounttype='Flying',
model={94361},
description="This mount is acquired by using an Ancient Memorial buff and a glider from the Kyrian covenant to tame Sundancer in Bastion.",
},[[
step
collect Skystrider Glider##180445 |or
|tip 该物品可以通过升华工艺制作，如果你来自凯瑞安盟约。
|tip 你必须通过基尔加丹盟约的升天之路来解锁制作配方。
|tip 也可以从拍卖行购买。
|tip 请注意，你需要对抗的稀有怪是62级精英，所以你可能需要一个团队。
'|complete hasmount(312765) |or
step
click Ancient Memorial##353807
获得日行者的祝福增益 |havebuff Sunrider's Blessing##332309 |goto Bastion/0 60.04,93.99 |or
'|complete hasmount(312765) |or
step
沿着道路向上走 |goto 57.53,89.65 < 10 |only if walking
等待日行者飞近 cliff |goto 61.17,81.80 < 10 |only if walking
use the Skystrider Glider##180445
|tip 这将使你轻盈漂浮。
|tip 你需要立即前往太阳舞者并点击它。
获得空天滑翔者增益 |havebuff Skystrider Glider##332308 |goto 61.70,81.46 |or
'|complete hasmount(312765) |or
step
clicknpc Sundancer##170439
|tip 立即开始疯狂点击屏幕上的"安抚"按钮，直到它消失。
骑乘日舞者 |invehicle |goto 61.70,81.46 |or
'|complete hasmount(312765) |or
step
征服日舞者
|tip 不停点击屏幕上的安抚技能按钮，直到它消失。
|tip 你将会受到伤害，直到你征服阳炎舞者。
观看对话
骑上日舞者回到地面 |outvehicle |goto 60.08,93.60 |or
'|complete hasmount(312765) |or
step
talk Sundancer##170548
选择 _<接受挑战。>_
kill Sundancer##170548
|tip 你可能需要一个团队来完成这个。
|tip 你只需将其血量压到大约15%。
collect Sundancer##180773 |goto 60.25,93.63 |or
'|complete hasmount(312765) |or
step
use Sundancer##180773
学习“日舞者”坐骑 |learnmount Sundancer##312765
step
_Congratulations!_
你获得了“日舞者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Wildseed Cradle",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying", "mount", "Shadowlands"},
mounts={334352},
patch='90001',
mounttype='Flying',
model={98594},
description="This mount is acquired by assembling the Twinklestar's Gardening Toolkit and looting the Cache of the Moon in Ardenweald.",
},[[
step
click Gardener's Basket##355212
|tip 看起来像是一个小灰色的篮子，躺在两个岩石之间。
collect Gardener's Basket##180758 |goto Ardenweald/0 40.32,52.62 |or
'|complete itemcount(180753) == 1 or hasmount(334352) |or
step
click Gardener's Hammer##355211
|tip 看来在马车里放着一把小木锤。
collect Gardener's Hammer##180754 |goto 39.75,54.38 |or
'|complete itemcount(180753) == 1 or hasmount(334352) |or
step
跟着这条路走 |goto 40.13,53.86 < 7 |only if walking
过桥战斗 |goto 40.04,55.40 < 7 |only if walking
click Diary of the Night##355216
|tip 看起来像一本摊开的书 laying on a 小桌子在树平台上。
collect Diary of the Night##180759 |goto 39.00,56.98 |or
'|complete itemcount(180753) == 1 or hasmount(334352) |or
step
click Gardener's Flute##355215
|tip 它看起来像一个小白色的长笛，躺在发光植物旁边。
collect Gardener's Flute##180756 |goto 38.49,58.08 |or
'|complete itemcount(180753) == 1 or hasmount(334352) |or
step
click Gardener's Wand##355214
|tip 它看起来像是一根小型白色木质魔杖，躺在马车两个车轮之间的地面上。
collect Gardener's Wand##180757 |goto 38.85,60.11 |or
'|complete itemcount(180753) == 1 or hasmount(334352) |or
step
use the Gardener's Basket##180758
collect Twinklestar's Gardening Toolkit##180753 |or
'|complete hasmount(334352) |or
step
talk Twinklestar##171360
告诉她"我找到了你的园艺工具。"
获得月环增益 |havebuff Moonsight##334353 |goto 63.88,37.55 |or
'|complete hasmount(334352) |or
step
click Cache of the Moon##355041
|tip 看起来在Twinklestar身后漂浮着一个蓝紫色的魔法球。
collect Wildseed Cradle##180731 |goto 63.90,37.77 |or
'|complete hasmount(334352) |or
step
use the Wildseed Cradle##180731
获取野生种子摇篮坐骑 |learnmount Wildseed Cradle##334352
step
_Congratulations!_
你获得了野生种子摇篮坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Bound Shadehound",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"mount", "Shadowlands"},
mounts={344577},
patch='90001',
mounttype='Ground',
model={92632},
description="This mount can be acquired by completing various activities in The Maw.",
},[[
step
与维纳里建立初步声望 |complete rep("Ve'nari") >= Tentative
|tip 通过完成日常任务、击杀稀有怪和参与冥狱中的活动来获得声望。
step
收集1050斯提吉亚 |complete curcount(1767) >= 1050 |q 63217 |future
|tip 在虚空行者中通过击杀敌人和完成任务或事件可以获得斯提吉亚。
step
talk Ve'nari##162804
buy 1 Animated Levitating Chain##184653 |goto The Maw/0 46.91,41.70 |q 63217 |future
step
use the Animated Levitating Chain##184653
解锁“动画漂浮链”升级 |q 63217 |future
step
与维纳里建立感激声望 |complete rep("Ve'nari") >= Appreciative
|tip 通过完成日常任务、击杀稀有怪和参与冥狱中的活动来获得声望。
step
收集1500点斯提吉亚 |complete curcount(1767) >= 1500 |q 63641 |future
|tip 在虚空行者中通过击杀敌人和完成任务或事件可以获得斯提吉亚。
step
talk Ve'nari##162804
buy 1 Stygia Dowser##184870 |goto 46.91,41.70 |q 63641 |future
step
click Grapple Point |goto 23.74,68.20 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
过桥战斗 |goto 22.56,72.21 < 20 |c |q 63641 |future
step
label "Collect_Crumbling_Stele"
click Grapple Point |goto 23.41,74.22 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
使用"斯提吉亚狂怒"能力
|tip 它会显示为屏幕上的一个按钮。
|tip 解开出现的谜题。
|tip 面向东南方。
|tip 六个符文将出现。
|tip 你可以同时交换两个符文。
|tip 你必须将符文的顺序与平台上的符文顺序匹配。
|tip 请谨慎选择，因为你只有有限的尝试次数。
|tip 如果你未能通关，你将需要等待两个小时才能再次挑战。
click Runed Chest
collect 1 Crumbling Stele##185056 |goto 24.08,75.70 |q 63641 |future |next "Collect_2000_Stygia" |or
'|havebuff Stygia Dampening##349931 |next "Puzzle_Fail" |or
step
label "Puzzle_Fail"
_Jump down quickly!_
|tip 跳下桥，否则你会死！
等待两小时后再试一次 |nobuff Stygia Dampening##349931 |goto 23.63,74.69 |next "Collect_Crumbling_Stele"
step
label "Collect_2000_Stygia"
收集2000点阴影之息 |complete curcount(1767) >= 2000 |q 63641 |future
|tip 在虚空行者中通过击杀敌人和完成任务或事件可以获得斯提吉亚。
step
talk Ve'nari##162804
buy 1 Partial Rune Codex##185350 |goto 46.91,41.70 |q 63641 |future
step
进入洞穴 |goto 48.69,84.46 < 20 |walk
click Rune Codex Page
|tip 在洞穴内。
collect 1 Rune Codex Page: Forging##185351 |goto 51.61,83.98 |q 63641 |future
step
use the Rune Codex Page: Forging##185351
阅读部分符文文献 |q 63641 |future
step
过桥战斗 |goto 28.18,62.52 < 20 |only if walking
跑下楼梯 |goto 25.75,66.57 < 20 |only if walking
跑下楼梯 |goto 25.85,69.96 < 20 |only if walking
click Rune Codex Page
collect 1 Rune Codex Page: Souls##185352 |goto 27.24,72.34
step
use the Rune Codex Page: Souls##185352
阅读符文典籍页面：灵魂 |q 63642 |future
step
走上工作台 |goto 27.57,17.44
传送到震击台 |goto 28.20,18.90 < 5 |c |noway |q 63643 |future
step
click Rune Codex Page
collect 1 Rune Codex Page: Binding##185353 |goto 24.63,12.55 |q 63643 |future
step
use the Rune Codex Page: Binding##185353
阅读符文法典页: 绑定 |q 63643 |future
step
collect 1 Intact Rune Codex##185632 |q 63684 |future
|tip 你应该从阅读这些页面中获得这个。
step
clicknpc Stray Soul##177195
|tip 这看起来像一只狼。
|tip 它从灵魂之河的南端游荡到北端。
|tip 在北端，它消失后再在南端重新出现。
|tip 从北方的起始点出发，逐步向南方推进是最简单的。
collect Willing Wolf Soul##185471 |goto 31.2,33.8 |q 63684 |future
step
kill Soulforger Rhovus##166398
|tip 灵魂锻造师洛夫斯是一个稀有怪，重生时间大约为一个小时。
collect 1 Soulforger's Tools##185473 |goto 35.97,41.56 |q 63684 |future
stickystart "Collect_Stygia_Sliver"
step
use the Stygia Dowser##184870
|tip 在玛尔的斯提吉亚交汇处使用它。
|tip 它们看起来像随机分布在区域中的发光绿色魔法球。
|tip 它们会在你的小地图上显示为黄色点。
collect 200 Stygia Dust##185618 |goto 53.16,78.42 |q 63684 |future
step
label "Collect_Stygia_Sliver"
use the Stygia Dowser##184870 |notinsticky
|tip 在暗影界的斯提基安圣域旁边使用它。
|tip 它们看起来像随机分布在整个区域的发光绿色 orb。
|tip 它们会在你的小地图上显示为黄色点。
collect 200 Stygia Sliver##185617 |goto 53.16,78.42 |q 63684 |future
step
过桥战斗 |goto 28.00,62.68 < 30 |only if walking
click Grapple Point |goto 23.52,66.66 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
click Grapple Point |goto 22.16,71.07 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
click Grapple Point |goto 22.24,70.79 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
抵达统治之坛 |goto 22.24,70.79 |c |noway |q 63684 |future
step
click Grapple Point |goto 20.51,67.83 |only if walking
|tip 在你头顶的墙上。|仅在行走时使用
clicknpc Soulsteel Anvil##177392
_<Create 20 Stygia Bars>_
collect 20 Stygia Bar##185630 |goto 20.04,66.81 |q 63684 |future
step
clicknpc Soulsteel Anvil##177392
_<Create 1 Armored Husk>_
collect 1 Armored Husk##185474 |goto 20.04,66.81 |q 63684 |future
step
click Chaotic Rift |goto 19.77,66.17
跨越裂隙 |invehicle |q 63684 |future
step
抵达佐瓦尔的锅炉 |outvehicle |q 63684 |future
step
click Binding Altar##367761
collect 1 Feral Shadehound##185475 |goto 45.20,48.33 |q 63684 |future
step
use the Feral Shadehound##185475
accept Feral Shadehound##63684
step
use the Crumbling Stele##185056
|tip 首先阅读此内容以查看符文的顺序并记住它。
use the Feral Shadehound##185616
|tip 在笼子之间跑动影犬，以便集中注意符文顺序。
|tip 点击你技能条上的按钮，按破碎石碑中所示的顺序。
召唤并绑定你的野性影猎犬 |q 63684/1  |goto 45.20,47.38
step
_Click the Complete Quest Box:_
turnin Feral Shadehound##63684
step
use the Bound Shadehound##184168
学习“束缚阴影猎犬”坐骑 |learnmount Bound Shadehound##344577
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Corridor Creeper",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"ground", "mount", "Shadowlands"},
mounts={344578},
patch='90001',
mounttype='Ground',
model={92630},
description="This mount is acquired by reaching Layer 8 of the Twisting Corridors in Torghast, Tower of the Damned.",
},[[
step
解锁扭曲走廊 |complete completedq(62836) or hasmount(344578)
|tip 在托加斯特任务线升级指南中完成狮子的征兆任务以实现此目标。
step
在托加斯的扭曲走廊达到第8层 |achieve 14570 |or
|tip 你必须完成每个层级才能进入下一个。
|tip 每层由18层构成，每6层有一个首领，每3层有一个休息区。
|tip 预计每个等级需要花费1.5到2.5小时，可能在更高级别时会更多。
|tip 更高层级将具有显著增加的难度和装备要求。
'|complete hasmount(344578) |or
step
collect Corridor Creeper##184166 |or
|tip 你可以在你的邮政邮箱中找到它。
'|complete hasmount(344578) |or
step
use the Corridor Creeper##184166
学习走廊爬行者坐骑 |learnmount Corridor Creeper##344578
step
_Congratulations!_
你收集到了走廊爬行者坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Darkwarren Hardshell",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"ground", "mount", "Shadowlands"},
mounts={312763},
patch='90001',
mounttype='Ground',
model={94347},
description="This mount is acquired randomly by completing Adventure missions from the Command Table inside your Covenant.",
},[[
step
clicknpc Command Table##176143 |goto Elysian Hold/0 43.34,41.24 |only if  Kirian
clicknpc Command Table##176143 |goto Seat of the Primus/0 39.31,46.32 |only if  Necrolord
clicknpc Command Table##176143 |goto Ardenweald/0 44.74,56.31 |only if  NightFae
clicknpc Command Table##176143 |goto Sinfall/0 55.82,61.46 |only if  Venthyr
|tip 这个坐骑作为指挥桌冒险任务的随机奖励出现。
|tip 定期完成冒险以提高获得正确冒险的机会。
collect Darkwarren Hardshell##183052 |or
'|complete hasmount(312763) |or
step
use the Darkwarren Hardshell##183052
学习黑暗沃伦硬壳坐骑 |learnmount Darkwarren Hardshell##312763
step
_Congratulations!_
你获得了"黑暗沃恩硬壳"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Sinrunner Blanchy",{
author="support@zygorguides.com",
startlevel=55.0,
keywords={"ground", "mount", "Shadowlands"},
mounts={339588},
patch='90001',
mounttype='Ground',
model={98449},
description="This mount is acquired by bringing 6 sets of items to Dead Blanchy in Revendreth over the course of 6 days.",
},[[
step
click Sack of Oats##2724+
|tip 它们看起来像在这个地区建筑附近的棕色麻袋。
collect 8 Handful of Oats##182581 |goto Westfall/0 52.22,33.57 |q 62038 |future
|tip 你也可以在拍卖行购买它们。
你可以在附近找到更多：
[46.51,37.86]
[47.24,37.47]
[48.70,20.16] - Inside a barn
[50.48,25.08]
[51.45,32.27] - Inside a stables
[55.16,27.47]
[56.54,36.53]
step
talk Mims##167815
buy 3 Dredhollow Apple##179271 |goto Revendreth/0 40.86,46.66 |or
|tip 你可以用金币购买这些物品。
'|complete hasmount(339588) |or
step
talk Snickersnee##173570
选择 _<请求借用一把梳子>_
collect 1 Grooming Brush##182585 |goto 63.41,61.77 |q 62042 |future
step
click Empty Water Bucket##357526
collect 1 Empty Water Bucket##182620 |goto 63.26,61.55 |q 62049 |future
step
click Discarded Horseshoe##357541+
|tip 它们看起来像这个区域周围地面上的小闪光物品。
|tip 它们通常出现在车马行驶的铺砌道路旁。
|tip 通常在找到一个之后，站在同一个位置等待它重生是最简单的。
collect 4 Sturdy Horseshoe##182595 |goto 70.25,72.03 |q 62047 |future
step
use the Empty Water Bucket##182620
collect 1 Bucket of Clean Water##182599 |goto Ardenweald/0 49.41,51.51 |q 62049 |future
step
talk Ta'tru##171808
buy 1 Comfortable Saddle Blanket##182597 |goto Revendreth/0 51.14,78.84 |q 62048 |future
|tip 你必须用塔图鲁交换这个物品。
|tip 每周所需的数量和特定物品会有所变化。
|tip 检查一下你在收集材料或从拍卖行购买之前需要什么。
step
talk Dead Blanchy##173468
选择_<给予死去的布兰奇八把燕麦>_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
提供一把燕麦 |complete completedq(62038) or hasmount(339588) |goto 63.21,42.87
step
等待下一个日常重置 |complete not completedq(62107) or completedq(62038)
|tip 在下次重置后，你可以交付下一个物品。
step
talk Dead Blanchy##173468
选择_<用梳理刷去除死白兰奇皮肤上的刺激物>_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
献上梳理刷 |complete completedq(62042) or hasmount(339588) |goto 63.21,42.87
step
等待下一个日常重置 |complete not completedq(62107) or completedq(62042)
|tip 在下次重置后，你可以交付下一个物品。
step
talk Dead Blanchy##173468
选择 _轻轻检查死去的布兰基的脚并施加马蹄铁_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
提供坚固的马掌 |complete completedq(62047) or hasmount(339588) |goto 63.21,42.87
step
等待下一个日常重置 |complete not completedq(62107) or completedq(62047)
|tip 在下次重置后，你可以交付下一个物品。
step
talk Dead Blanchy##173468
选择_<将满满的水桶靠近死去的布兰奇，让她解渴>_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
提供清水桶 |complete completedq(62049) or hasmount(339588) |goto 63.21,42.87
step
等待下一个日常重置 |complete not completedq(62107) or completedq(62049)
|tip 在下次重置后，你可以交付下一个物品。
step
talk Dead Blanchy##173468
选择_<让亡者布兰奇在把鞍 blanket抬到背上之前闻一闻>_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
提供舒适的鞍毯 |complete completedq(62048) or hasmount(339588) |goto 63.21,42.87
step
等待下一个日常重置 |complete not completedq(62107) or completedq(62048)
|tip 在下次重置后，你可以交付下一个物品。
step
talk Dead Blanchy##173468
选择_<给死去的布兰奇三颗死亡林苹果>_
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 你每天只能提供一个物品，总共需要六天。
|tip 检查组队寻找器，寻找布兰奇的团队以快速找到它。
提供深渊果 |complete completedq(62050) or hasmount(339588) |goto 63.21,42.87
step
clicknpc Dead Blanchy##173468
|tip 这个NPC的重生时间大约为1-2小时。
|tip 它在这个地点刷新，并向南短距离移动。
|tip 你必须站在它面前以防止其逃跑，然后你可以与之互动。
|tip 每天给死去的布兰奇提供不同的物品组合，持续六天。
|tip 他们不需要连续六天完成，只需总共六天即可。
collect Blanchy's Reins##182614 |goto 63.21,42.87 |or
'|complete hasmount(339588) |or
step
use Blanchy's Reins##182614
学习“罪行者布兰奇”坐骑 |learnmount Sinrunner Blanchy##339588
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Warstitched Darkhound",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"ground, mount, adventure, Shadowlands, Warstitched, Darkhound"},
mounts={341766},
patch='90001',
mounttype='Ground',
model={98223},
description="This mount is acquired randomly by completing Adventure missions from the Command Table inside your Covenant.",
},[[
step
clicknpc Command Table##176143 |goto Elysian Hold/0 43.34,41.24 |only if  Kirian
clicknpc Command Table##176143 |goto Seat of the Primus/0 39.31,46.32 |only if  Necrolord
clicknpc Command Table##176143 |goto Ardenweald/0 44.74,56.31 |only if  NightFae
clicknpc Command Table##176143 |goto Sinfall/0 55.82,61.46 |only if  Venthyr
|tip 这个坐骑随机出现在这些冒险的奖励中。
|tip 定期完成冒险以提高获得正确冒险的机会。
collect Warstitched Darkhound##183615 |or
'|complete hasmount(341766) |or
step
use the Warstitched Darkhound##183615
获取“战争缝合犬”坐骑 |learnmount Warstitched Darkhound##341766
step
_Congratulations!_
你收集了“战争缝合犬”坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\The Wild Hunt Mounts\\Amber Ardenmoth",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying, mount, Shadowlands, emissary, Amber, Ardenmoth"},
mounts={342666},
patch='90001',
mounttype='Flying',
model={95208},
description="This mount has a low chance to drop from Wild Hunt Supplies gained by earning paragon ranks with The Wild Hunt after reaching Exalted reputation.",
},[[
step
与野猎组织达到崇敬声望 |complete rep('The Wild Hunt') == Exalted or hasmount(342666)
step
继续提升你与狂野之猎的声望
|tip 按“U”键打开声望面板，将鼠标移到“野性猎手”旁边的背包图标上。
|tip 获得额外的声望来填满进度条，并获取野性狩猎供应品。
collect Wild Hunt Supplies##180649 |or
'|complete hasmount(342666) |or
step
use Wild Hunt Supplies##180649
collect Amber Ardenmoth##183800 |or
|tip 这掉落几率非常低。
'|complete hasmount(342666) |or
step
use the Amber Ardenmoth##183800
学习琥珀阿登虫坐骑 |learnmount Amber Ardenmoth##342666
step
_Congratulations!_
你获得了“琥珀阿登虫”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\The Undying Army\\Colossal Slaughterclaw",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying, mount, Shadowlands, Colossal, Slaughterclaw"},
mounts={327405},
patch='90001',
mounttype='Flying',
model={98147},
description="This mount has a low chance to drop from Supplies of the Undying Army gained by earning paragon ranks with The Undying Army after reaching Exalted reputation.",
},[[
step
达到不死军团的尊敬声望到达崇敬 |complete rep('The Undying Army') == Exalted or hasmount(327405)
step
继续提升与不死军团的声望
|tip 按“U”打开声望面板，将鼠标悬停在不屈军团旁边的背包图标上。
|tip 获得额外声望以填满进度条，赢取不朽军队的物资。
collect Supplies of the Undying Army##180646 |or
'|complete hasmount(327405) |or
step
use Supplies of the Undying Army##180646
collect Reins of the Colossal Slaughterclaw##182081 |or
|tip 这掉落几率非常低。
'|complete hasmount(327405) |or
step
use the Reins of the Colossal Slaughterclaw##182081
学习“巨型屠戮爪”坐骑 |learnmount Colossal Slaughterclaw##327405
step
_Congratulations!_
你收集了“巨型屠杀爪”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\The Wild Hunt Mounts\\Duskflutter Ardenmoth",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying, mount, Shadowlands, Wild, Hunt, Duskflutter, Ardenmoth"},
mounts={332256},
patch='90001',
mounttype='Flying',
model={95206},
description="This mount is purchased for 24,000 gold after becoming Exalted with The Wild Hunt.",
},[[
step
与野猎组织达到崇敬声望 |complete rep('The Wild Hunt') == Exalted or hasmount(332256)
step
talk Aithlyn##158556
buy 1 Duskflutter Ardenmoth##180729 |goto Ardenweald/0 48.48,50.42 |or
'|complete hasmount(332256) |or
step
use the Duskflutter Ardenmoth##180729
学习“暮光翅膀阿登之蝶”坐骑 |learnmount Duskflutter Ardenmoth##332256
step
_Congratulations!_
你获得了“暮光翅膀阿登虫”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\The Ascended Mounts\\Gilded Prowler",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"flying, mount, Shadowlands, Gilded, Prowler"},
mounts={342334},
patch='90001',
mounttype='Flying',
model={93771},
description="This mount is purchased for 24,000 gold after becoming Exalted with The Ascended.",
},[[
step
与升腾者达到崇敬声望 |complete rep('The Ascended') == Exalted or hasmount(342334)
step
talk Adjutant Nikos##160470
buy 1 Gilded Prowler##183740 |goto Bastion/0 52.24,47.10 |region heros_rest |or
'|complete hasmount(342334) |or
step
use the Gilded Prowler##183740
学习“镀金猎豹”坐骑 |learnmount Gilded Prowler##342334
step
_Congratulations!_
你获得了"镀金猎 prowler"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Reputation Mounts\\Court of Harvestors Mounts\\Court Sinrunner",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"ground, mount, Shadowlands, Court, Sinrunner"},
mounts={341639},
patch='90001',
mounttype='Ground',
model={98721},
description="This mount is purchased for 24,000 gold after becoming Exalted with the Court of Harvesters.",
},[[
step
达到收获者法庭的崇敬声望。 |complete rep('Court of Harvesters') == Exalted or hasmount(341639)
step
进入建筑物 |goto Revendreth/0 62.26,63.57 < 7 |walk
talk Mistress Mihaela##156822
|tip 在建筑物内。
buy 1 Court Sinrunner##183518 |goto 61.31,63.78 |or
'|complete hasmount(341639) |or
step
use the Court Sinrunner##183518
学习“法庭罪行者”坐骑 |learnmount Court Sinrunner##341639
step
_Congratulations!_
你获得了"法庭罪行者"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Reputation Mounts\\The Avowed Mounts\\Inquisition Gargon",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"ground, mount, Shadowlands, Inquisition, Gargon"},
mounts={332923},
patch='90001',
mounttype='Ground',
model={94325},
description="This mount is purchased for 2,000 Sinstone Fragments after becoming Exalted with The Avowed.",
},[[
step
完成瑞文德斯的“权力滥用”任务线 |complete completedq(57929) or hasmount(332923)
|tip 完成此任务线将解锁誓约者阵营。
step
杀死该区域周围的敌人
|tip 堕落的敌人和雕刻目录者将掉落罪石碎片。
收集2000个罪石碎片 |complete curcount(1816) >= 2000 or hasmount(332923) |goto Revendreth/0 72.30,54.13
step
达到与宣誓者的崇敬声望尊敬等级 |complete rep('The Avowed') == Exalted or hasmount(332923)
step
进入建筑物 |goto Revendreth/0 72.98,52.46 < 10 |walk
talk Archivist Janeera##173705
|tip 在建筑物内。
buy 1 Inquisition Gargon##182954 |goto 73.07,52.14 |or
'|complete hasmount(332923) |or
step
use the Inquisition Gargon##182954
学习审判者伽尔贡坐骑 |learnmount Inquisition Gargon##332923
step
_Congratulations!_
你获得了“审判者石像鬼”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Reputation Mounts\\The Undying Army\\Lurid Bloodtusk",{
author="support@zygorguides.com",
startlevel=50.0,
keywords={"ground, mount, Shadowlands, Lurid, Bloodtusk"},
mounts={332484},
patch='90001',
mounttype='Ground',
model={98166},
description="This mount is purchased for 24,000 gold after becoming Exalted with The Undying Army.",
},[[
step
达到不死军团的尊敬声望到达崇敬 |complete rep('The Undying Army') == Exalted or hasmount(332484)
step
talk Nalcorn Talsen##173003
buy 1 Lurid Bloodtusk##182082 |goto Maldraxxus/0 50.76,53.38 |or
'|complete hasmount(332484) |or
step
use the Lurid Bloodtusk##182082
学习"艳丽的血獠"坐骑 |learnmount Lurid Bloodtusk##332484
step
_Congratulations!_
你获得了 "惹眼的血牙" 坐骑。
]])
ZGV.BETAEND()
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Amber Shardhide",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Death's, Advance"},
mounts={354356},
patch='90100',
mounttype='Ground',
model={100422},
description="This mount can be purchased for 5,000 Stygia after becoming Revered with Death's Advance.",
},[[
step
与死亡先锋达到崇敬声望 |complete rep("Death's Advance") >= Revered |or
|tip 使用“死亡之进”声望指南来帮助你完成这个任务。
'|learnmount Amber Shardhide##354356 |or
step
收集5000个斯蒂吉亚 |complete curcount(1767) >= 5000 |or
|tip 在冥狱中击杀敌人或完成每日和世界任务以赚取该货币。
|tip 使用《猛犸世界任务》和《维纳莉每日任务》指南来完成此任务。
'|learnmount Amber Shardhide##354356 |or
step
talk Duchess Mynx##179321
buy Amber Shardhide##186647 |goto Korthia/0 63.31,23.33 |or
|tip 这需要5000斯蒂吉亚。
'|learnmount Amber Shardhide##354356 |or
step
use the Amber Shardhide##186647
学习“琥珀碎皮”坐骑 |learnmount Amber Shardhide##354356
step
_Congratulations!_
你收集了琥珀碎鳞坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Ardenweald Wilderling",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Night, Fae"},
mounts={353856},
patch='90100',
mounttype='Flying',
model={100105},
description="This mount is rewarded to you after reaching Renown level 45 with the Night Fae covenant.",
},[[
step
加入夜之子盟约 |complete  NightFae |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Ardenweald Wilderling##353856 |or
step
达到声望等级45 |complete covenantrenown() >= 45 |or
|tip 使用“夜之精灵每日任务”指南来完成此任务。
'|learnmount Ardenweald Wilderling##353856 |or
step
collect Ardenweald Wilderling Harness##186493 |or
'|learnmount Ardenweald Wilderling##353856 |or
step
use the Ardenweald Wilderling Harness##186493
学习阿尔登维尔小野兽坐骑 |learnmount Ardenweald Wilderling##353856
step
_Congratulations!_
你获得了“阿尔登维尔野生坐骑”。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Ascendant's Aquilon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Bastion"},
mounts={353880},
patch='90100',
mounttype='Flying',
model={99108},
description="This mount can be purchased for 7,500 Reservoir Anima from Adjutant Galos in Bastion.",
},[[
step
加入凯尔萨斯盟约 |complete  Kyrian |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Ascendant's Aquilon##353880 |or
step
收集7500点储备灵能 |complete curcount(1813) >= 7500 |or
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有怪和开启宝藏来收集储备灵魂能量。
'|learnmount Ascendant's Aquilon##353880 |or
step
talk Adjutant Galos##174937
|tip 在建筑物内。
buy Ascendant's Aquilon##186485 |goto Elysian Hold/1 63.35,30.62 |or
|tip 这需要7500储备能量。
'|learnmount Ascendant's Aquilon##353880 |or
step
use the Ascendant's Aquilon##186485
学习“上升者的阿基隆”坐骑 |learnmount Ascendant's Aquilon##353880
step
_Congratulations!_
你收集到了“升腾者的阿基隆”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Autumnal Wilderling",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Ardenweald"},
mounts={353857},
patch='90100',
mounttype='Flying',
model={100102},
description="This mount can be purchased for 7,500 Reservoir Anima from Elwyn in Ardenweald.",
},[[
step
收集7500点储备灵能 |complete curcount(1813) >= 7500 |or
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有怪和开启宝藏来收集储备灵魂能量。
'|learnmount Autumnal Wilderling##353857 |or
step
talk Elwyn##174914
|tip 在建筑物内。
buy Autumnal Wilderling Harness##186494 |goto Heart of the Forest/0 60.14,35.97 |or
|tip 这需要7500储备能量。
'|learnmount Autumnal Wilderling##353857 |or
step
use the Autumnal Wilderling Harness##186494
学习秋季野生骑乘兽 |learnmount Autumnal Wilderling##353857
step
_Congratulations!_
你获得了秋日野马坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Beryl Shardhide",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Death's, Advance, Supplies"},
mounts={347810},
patch='90100',
mounttype='Ground',
model={100421},
description="This mount has a chance to drop from Death's Advance Supplies.",
},[[
step
与死亡军团达到尊敬声望 |complete rep("Death's Advance") == Exalted |or
|tip 通过完成每日任务、击杀稀有怪和开启科尔蒂亚的宝箱来为死亡先锋获得声望。
'|learnmount Beryl Shardhide##347810 |or
step
label "Turnin_Supply_Quest"
talk Duchess Mynx##179321
turnin Supplies from Death's Advance##64012 |goto Korthia/0 63.31,23.33 |future |or
|tip 完成10,000点死亡先锋声望后，将可以交付该任务。
|tip 通过完成每日任务、击杀稀有怪和开启科尔蒂亚的宝箱来为死亡先锋获得声望。
|tip 这个任务是可重复的。
'|learnmount Beryl Shardhide##347810 |or
step
use the Death's Advance Supplies##186650
collect Beryl Shardhide##186644
|tip 可能需要多次尝试才能获得这个。
'|complete itemcount(186650) == 0 and itemcount(186644) == 0 and not hasmount(347810) |next "Turnin_Supply_Quest" |or
'|learnmount Beryl Shardhide##347810 |or
step
use the Beryl Shardhide##186644
学习“碧玉碎hide”坐骑 |learnmount Beryl Shardhide##347810
step
_Congratulations!_
你获得了碧玉碎皮坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Cartel Master's Gearglider",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Tazavesh, The, Veiled, Market"},
mounts={353263},
patch='90100',
mounttype='Flying',
model={100051},
description="This mount has a chance to drop from So'leah in Tazavesh, The Veiled Market Mythic dungeon.",
},[[
step
进入塔兹维什，隐秘市场 |c |goto Tazavesh, the Veiled Market/7 0.00,0.00 |or
|tip 使用Tazavesh, the Veiled Market的入场证指南解锁副本。
'|learnmount Cartel Master's Gearglider##353263 |or
step
kill So'leah##178433
|tip 使用“塔扎维什，隐秘市场”副本指南完成此任务。
collect Cartel Master's Gearglider##186638 |or
|tip 这个只会在史诗难度下掉落。
|tip 可能需要多次尝试才能获得这个。
'|learnmount Cartel Master's Gearglider##353263 |or
step
use the Cartel Master's Gearglider##186638
学习“卡特尔大师的装备滑翔机”坐骑 |learnmount Cartel Master's Gearglider##353263
step
_Congratulations!_
你收集了"卡特尔大师的飞行器"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Crimson Shardhide",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Korthia"},
mounts={354357},
patch='90100',
mounttype='Ground',
model={100423},
description="This mount has a chance to drop from the rare boss Malbog in Korthia.",
},[[
step
talk Caretaker Kah-Kay##179729
告诉他“我将消灭这个威胁！”
|tip 他每天有机会在这个地点出现。
获取锐眼增益 |complete hasbuff(355078) |goto Korthia/0 60.67,23.11 |or
'|learnmount Crimson Shardhide##354357 |or
step
click Fleshy Remains##369181
|tip 跟随紫色轨迹，并保持锐眼光环状态。
|tip 他们会引导你去“肉质遗骸”的位置。
|tip 如果你跑在紫色轨迹前面，"肉质遗骸"就不会刷新，所以让轨迹引导你到这个位置。
|tip “锐眼”增益效果将持续15分钟，如果你失去增益效果，可以回到卡凯那里重新获得。
kill Malbog##179684
collect Crimson Shardhide##186645 |goto 44.24,29.33 |or
|tip 可能需要多次尝试才能获得这个。
'|learnmount Crimson Shardhide##354357 |or
step
use the Crimson Shardhide##186645
学习"红色碎鳞"坐骑 |learnmount Crimson Shardhide##354357
step
_Congratulations!_
你获得了“猩红碎皮”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Darkmaul",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Korthia"},
mounts={354358},
patch='90100',
mounttype='Ground',
model={100424},
description="This mount can be obtained by feeding 6 Tasty Mawshrooms to a Darkmaul in Korthia.",
},[[
step
click Invasive Mawshroom##369332+
|tip 它们可以看起来像生长在树枝上的微小蘑菇，或是从地面生长起来的球状白色蘑菇。
|tip 它们每天可以在科尔提亚的各个地点找到。
|tip 在某人拾取了入侵者蘑菇后，约有一分钟它会消失。
collect 6 Tasty Mawshroom##187153 |goto Korthia/0 54.2,41.2 |or
|tip 这个掉落几率为11%，可能需要多次尝试才能获得。
你也可以在周围找到它：
[57.34,39.41]
[53.8,37.9]
[39.8,34.9]
[45.7,34.3]
'|learnmount Darkmaul##354358 |or
step
click Darkmaul##180063
|tip 你必须在你的背包中拥有6个美味的麻菇。
collect Darkmaul##186646 |goto 42.8,32.7 |or
'|learnmount Darkmaul##354358 |or
step
use the Darkmaul##186646
学习暗爪坐骑 |learnmount Darkmaul##354358
step
_Congratulations!_
你获得了黑暗怒吼坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Dusklight Razorwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Korthia"},
mounts={354361},
patch='90100',
mounttype='Flying',
model={100254},
description="This mount can be obtained by bringing a Lost Razorwing Egg to a Razorwing Nest.",
},[[
step
杀死该区域周围的敌人
collect 10 Lost Razorwing Egg##187054 |goto Korthia/0 37.39,49.23 |or
|tip 只有吞噬者、 scavenger 及世界吞噬者类型的敌人会掉落这个。
'|complete hasmount(354361) |or
step
click Razorwing Nest##369246
|tip 当你将第一个蛋放入巢中时，你将会被巢守者攻击，放入第十个蛋后你将获得坐骑。
collect Dusklight Razorwing##186651 |goto 25.72,51.08 |or
'|complete hasmount(354361) |or
step
use the Dusklight Razorwing##186651
学习“暮光刃翼”坐骑 |learnmount Dusklight Razorwing##354361
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Elysian Aquilon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Kyrian"},
mounts={353875},
patch='90100',
mounttype='Flying',
model={99107},
description="This mount is rewarded to you after reaching Renown level 45 with the Kyrian covenant.",
},[[
step
加入凯尔萨斯盟约 |complete  Kyrian |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Elysian Aquilon##353875 |or
step
达到声望等级45 |complete covenantrenown() >= 45 |or
|tip 使用"凯尔达隆日常任务"指南来完成这个。
'|learnmount Elysian Aquilon##353875 |or
step
collect Elysian Aquilon##186482 |or
'|learnmount Elysian Aquilon##353875 |or
step
use the Elysian Aquilon##186482
学习“极乐神鹰”坐骑 |learnmount Elysian Aquilon##353875
step
_Congratulations!_
你收集了“天霸水鸟”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Fallen Charger",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, The, Maw"},
mounts={354353},
patch='90100',
mounttype='Ground',
model={98542},
description="This mount has a chance to drop from Fallen Charger in The Maw.",
},[[
step
kill Fallen Charger##179460
|tip 这个首领将在特雷梅库伦刷新，并在阴森之地里巡逻，直到他抵达科西亚的入口，然后会消失。
collect Fallen Charger's Reins##186659 |goto The Maw/0 29.8,15.7 |or
|tip 可能需要多次尝试才能获得这个。
它也可以在以下位置生成：
[16.27,49.49]
[27.9,62.9]
'|learnmount Fallen Charger##354353 |or
step
use the Fallen Charger's Reins##186659
学习“堕落战马”坐骑 |learnmount Fallen Charger##354353
step
_Congratulations!_
你收集到了“堕落的战马”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Fierce Razorwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Death's, Advance, Supplies"},
mounts={354359},
patch='90100',
mounttype='Flying',
model={100255},
description="This mount has a chance to drop from Death's Advance Supplies.",
},[[
step
与死亡军团达到尊敬声望 |complete rep("Death's Advance") == Exalted |or
|tip 通过完成每日任务、击杀稀有怪和开启科尔蒂亚的宝箱来为死亡先锋获得声望。
'|learnmount Fierce Razorwing##354359 |or
step
label "Turnin_Supply_Quest"
talk Duchess Mynx##179321
turnin Supplies from Death's Advance##64012 |goto Korthia/0 63.31,23.33 |future |or
|tip 完成10,000点死亡先锋声望后，将可以交付该任务。
|tip 通过完成每日任务、击杀稀有怪和开启科尔蒂亚的宝箱来为死亡先锋获得声望。
|tip 这个任务是可重复的。
'|learnmount Fierce Razorwing##354359 |or
step
use the Death's Advance Supplies##186650
collect Fierce Razorwing##186649
|tip 可能需要多次尝试才能获得这个。
'|complete itemcount(186650) == 0 and itemcount(186649) == 0 and not hasmount(354359) |next "Turnin_Supply_Quest" |or
'|learnmount Fierce Razorwing##354359 |or
step
use the Fierce Razorwing##186649
学习凶猛剃刀翼坐骑 |learnmount Fierce Razorwing##354359
step
_Congratulations!_
你获得了“凶猛的刀翼”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Foresworn Aquilon",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Korthia"},
mounts={353877},
patch='90100',
mounttype='Flying',
model={99106},
description="This mount is rewarded to you after completing the quest Intact Aquilon Core while aligned with the Kyrian covenant.",
},[[
step
加入凯尔萨斯盟约 |complete  Kyrian |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Foresworn Aquilon##353877 |or
step
talk Popo##180028
告诉她“我会在你送补给的时候保护你。”
|tip 这个稀有事件只能由与凯尔希尔 covenant 对齐的角色激活。
获得波波的药水增益 |havebuff Popo's Potion##356192 |goto Korthia/0 56.88,32.38 |or
'|learnmount Foresworn Aquilon##353877 |or
step
kill Wild Worldcracker##180032
|tip 跟随波波到这个地点。
collect Intact Aquilon Core##187282 |goto 47.0,35.5 |or
|tip 只有与基尔加丹盟约对齐的角色才能收集这个。
|tip 可能需要多次尝试才能获得这个。
'|learnmount Foresworn Aquilon##353877 |or
step
点击任务接受框
accept Intact Aquilon Core##64529 |or
'|learnmount Foresworn Aquilon##353877 |or
step
talk Deos##180339
turnin Intact Aquilon Core##64529 |goto 62.0,24.8 |or
'|learnmount Foresworn Aquilon##353877 |or
step
collect Foresworn Aquilon##186483 |or
'|learnmount Foresworn Aquilon##353877 |or
step
use the Foresworn Aquilon##186483
学习 "预言者阿基伦" 坐骑 |learnmount Foresworn Aquilon##353877
step
_Congratulations!_
你收集了“预言者之翼”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Garnet Razorwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Korthia"},
mounts={354360},
patch='90100',
mounttype='Flying',
model={100253},
description="This mount has a chance to drop from Reliwik the Defiant in Korthia.",
},[[
step
click Uncorrupted Razorwing Egg##369435
kill Reliwik the Defiant##180160
|tip 点击“未被腐化的刀锋之翼蛋”后，它会飞下来给你。
collect Garnet Razorwing##186652 |goto Korthia/0 56.27,66.13 |or
|tip 可能需要多次尝试才能获得这个。
'|learnmount Garnet Razorwing##354360 |or
step
use the Garnet Razorwing##186652
学习"石榴石刀翼"坐骑 |learnmount Garnet Razorwing##354360
step
_Congratulations!_
你收集了“石榴石刃翅”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Hand of Bahmethra",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Tomentors, Of, Torghast"},
mounts={352309},
patch='90100',
mounttype='Ground',
model={101220},
description="This mount can be created after collecting 200 Bahmeht Chain Links during the Tormentors of Torghast event.",
},[[
step
在“托尔戈斯的折磨”事件中击杀敌人
|tip “托加斯特的折磨者”事件将在马尔的随机地点每小时刷新。
|tip 在你的地图上寻找POI图标，前往那个区域。
|tip 每个"托加斯的折磨者"事件将会召唤3个精英副官和1个首领来击杀。
collect 200 Bahmeht Chain Link##185974 |or
|tip 副官有几率掉落1个巴梅特链环。
|tip 首领总是会掉落1个巴赫梅特链环。
|tip 这将需要一些时间。
'|complete hasmount(352309) |or
step
use the Bahmeht Chain Link##185974
collect Chain of Bahmethra##185973 |or
'|complete hasmount(352309) |or
step
use the Chain of Bahmehthra##185973
学习“巴哈姆特之手”坐骑 |learnmount Hand of Bahmeht##352309
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Lord of the Corpseflies",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Korthia"},
mounts={347250},
patch='90100',
mounttype='Flying',
model={100238},
description="This mount has a chance to drop from Fleshwing in Korthia for characters aligned with the Necrolord covenant.",
},[[
step
加入死亡骑士盟约 |complete  Necrolord |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Lord of the Corpseflies##347250 |or
step
talk Cadaverous##180079
|tip 他每天都有机会在这里刷出。
|tip 你需要与死亡骑士契约保持一致才能开始此事件。
kill Fleshwing##180042
|tip 在该区域击杀敌人波浪。
|tip 他最终会降落到这个地方。
collect Lord of the Corpseflies##186489 |goto Korthia/0 59.87,43.49 |or
|tip 这只能在与死亡骑士盟约对齐时收集。
|tip 可能需要多次尝试才能获得这个。
'|learnmount Lord of the Corpseflies##347250 |or
step
use the Lord of the Corpseflies##186489
学习尸蝇之王坐骑 |learnmount Lord of the Corpseflies##347250
step
_Congratulations!_
你获得了死尸苍蝇之王坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Maldraxxian Corpsefly",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Necrolord"},
mounts={353883},
patch='90100',
mounttype='Flying',
model={100240},
description="This mount is rewarded to you after reaching Renown level 45 as a member of the Necrolord covenant.",
},[[
step
加入死亡骑士盟约 |complete  Necrolord |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Maldraxxian Corpsefly##353883 |or
step
达到声望等级45 |complete covenantrenown() >= 45 |or
|tip 使用“死灵领主每日任务”指南完成此任务。
'|learnmount Maldraxxian Corpsefly##353883 |or
step
collect Maldraxxian Corpsefly Harness##186487 |or
'|learnmount Maldraxxian Corpsefly##353883 |or
step
use the Maldraxxian Corpsefly Harness##186487
学习马尔德拉克斯尸虫坐骑 |learnmount Maldraxxian Corpsefly##353883
step
_Congratulations!_
你获得了“马尔德拉克斯尸虫”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Obsidian Gravewing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Revendreth"},
mounts={353866},
patch='90100',
mounttype='Flying',
model={100109},
description="This mount can be purchased for 7,500 Reservoir Anima from Chachi the Artiste in Revendreth.",
},[[
step
收集7500点储备灵能 |complete curcount(1813) >= 7500 |or
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有怪和开启宝藏来收集储备灵魂能量。
'|learnmount Obsidian Gravewing##353866 |or
step
talk Chachi the Artiste##174710
|tip 在建筑物内。
buy Obsidian Gravewing##186478 |goto Sinfall/0 54.10,24.63 |or
|tip 这需要7500储备能量。
'|learnmount Obsidian Gravewing##353866 |or
step
collect Obsidian Gravewing##186478 |or
'|learnmount Obsidian Gravewing##353866 |or
step
use the Obsidian Gravewing##186478
学习黑曜石墓翼坐骑 |learnmount Obsidian Gravewing##353866
step
_Congratulations!_
你收集了黑曜石墓翼坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Regal Corpsefly",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Maldraxxus"},
mounts={353884},
patch='90100',
mounttype='Flying',
model={100241},
description="This mount can be purchased for 7,500 Reservoir Anima from Su Zettai in Maldraxxus.",
},[[
step
与尼克罗洛德盟约达到声望70级 |complete covenantrenown() >= 70
step
收集7500点储备灵能 |complete curcount(1813) >= 7500 |or
|tip 通过完成世界任务、地下城、盟约召唤任务、击杀稀有怪和开启宝藏来收集储备灵魂能量。
'|learnmount Regal Corpsefly##353884 |or
step
talk Su Zettai##172176
|tip 在建筑物内。
buy Regal Corpsefly Harness##186488 |goto Seat of the Primus/0 52.21,40.74 |or
|tip 这需要7500储备能量。
'|learnmount Regal Corpsefly##353884 |or
step
collect Regal Corpsefly Harness##186488 |or
'|learnmount Regal Corpsefly##353884 |or
step
use the Regal Corpsefly Harness##186488
学习“华丽尸虫”坐骑 |learnmount Regal Corpsefly##353884
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Sanctum Gloomcharger",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Sanctum, Of, Domination"},
mounts={354351},
patch='90100',
mounttype='Ground',
model={98540},
description="This mount has a chance to drop from Kyra in the Sanctum of Domination raid.",
},[[
step
kill Kyra##178738
|tip 使用圣所禁闭攻略来完成这个。
collect Sanctum Gloomcharger's Reins##186656 |or
|tip 可能需要多次尝试才能获得这个。
'|learnmount Sanctum Gloomcharger##354351 |or
step
use the Sanctum Gloomcharger's Reins##186656
学习"圣所幽暗战马"坐骑 |learnmount Sanctum Gloomcharger##354351
step
_Congratulations!_
你收集了圣所阴影战争马坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Sinfall Gravewing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Venthyr"},
mounts={353872},
patch='90100',
mounttype='Flying',
model={100110},
description="This mount is rewarded to you after reaching Renown level 45 as a member of the Venthry covenant.",
},[[
step
加入通灵领主 covenant |complete  Venthyr |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|learnmount Sinfall Gravewing##353872 |or
step
达到声望等级45 |complete covenantrenown() >= 45 |or
|tip 使用“冥界日常任务”指南完成此任务。
'|learnmount Sinfall Gravewing##353872 |or
step
collect Sinfall Gravewing##186476 |or
'|learnmount Sinfall Gravewing##353872 |or
step
use the Sinfall Gravewing##186476
学习“罪恶之秋墓翼”坐骑 |learnmount Sinfall Gravewing##353872
step
_Congratulations!_
你收集了“罪落墓翼”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Soaring Razorwing",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Death's, Advance"},
mounts={347251},
patch='90100',
mounttype='Flying',
model={100251},
description="This mount can be purchased for 5,000 Cataloged Research after reaching Tier 6 reputation with The Archivists' Codex.",
},[[
step
与档案管理员协会达到6级声望 |complete rep("The Archivists' Codex") == Tier6 |or
|tip 使用“科斯里亚的档案员”任务线升级指南来完成此任务。
'|learnmount Soaring Razorwing##347251 |or
step
收集#5000#份编目研究 |complete curcount(1931) >= 5000 |or
|tip 通过完成日常任务、击杀稀有精英和打开科西亚的宝藏来收集 cataloged research。
'|learnmount Soaring Razorwing##347251 |or
step
进入洞穴 |goto Korthia/0 61.63,21.71 < 30 |walk
talk Archivist Roh-Suir##178257
|tip 在洞穴内。
buy Soaring Razorwing##186648 |goto 62.78,22.61 |or
|tip 这需要5000点可记录的研究。
'|learnmount Soaring Razorwing##347251 |or
step
use the Soaring Razorwing##186648
学习飞翔的刀锋之翼坐骑 |learnmount Soaring Razorwing##347251
step
_Congratulations!_
你获得了飞翔的锐爪坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Soulbound Gloomcharger",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Ve'nari"},
mounts={354352},
patch='90100',
mounttype='Ground',
model={98541},
description="This mount has a chance to drop from Mysterious Gift from Ve'nari in The Maw.",
},[[
step
与维纳里建立感激声望 |complete rep("Ve'nari") == Appreciative |or
|tip 你可以通过完成日常任务、击杀稀有怪和开启魔爪中的宝箱来获得声望。
|tip 使用Ve'nari每日任务指南完成此任务。
'|learnmount Soulbound Gloomcharger##354352 |or
step
label "Turnin_Supply_Quest"
talk Ve'nari##162804
turnin Mysterious Gifts from Ve'nari##64267 |goto The Maw/0 46.91,41.69 |future |or
|tip 在你为维纳里获得1万声望后，这个任务将变为可交付状态。
|tip 你可以通过完成日常任务、击杀稀有怪和开启魔爪中的宝箱来获得声望。
|tip 这个任务是可重复的。
'|learnmount Soulbound Gloomcharger##354352 |or
step
use the Mysterious Gift from Ve'nari##187029
collect Soulbound Gloomcharger's Reins##186657 |or
|tip 可能需要多次尝试才能获得这个。
'|complete itemcount(187029) == 0 and itemcount(186657) == 0 and not hasmount(354352) |next "Turnin_Supply_Quest" |or
'|learnmount Soulbound Gloomcharger##354352 |or
step
use the Soulbound Gloomcharger's Reins##186657
学习灵魂绑定的暗影战马坐骑 |learnmount Soulbound Gloomcharger##354352
step
_Congratulations!_
你获得了“灵魂绑定的暗影战马”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Summer Wilderling",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Night, Fae"},
mounts={353859},
patch='90100',
mounttype='Flying',
model={101002},
description="This mount is rewarded to you after completing the quest Wilderling Saddle in Korthia as a member of the Night Fae covenant.",
},[[
step
加入夜之子盟约 |complete  NightFae |or
|tip 利用“暗影国度引导与主线任务”升级指南完成此任务。
'|complete hasmount(353859) |or
step
click Alluring Drum##180009
|tip 这将开始稀有事件“逃逸的野生幼崽”。
|tip 当这个事件激活时，你的迷你地图上会出现一个金色星星。
kill Escaped Wilderling##180014 |goto Korthia/0 33.19,39.39 |or
'|complete hasmount(353859) |or
step
click Escaped Wilderling##180014
开始骑乘逃脱的野生幼兽 |invehicle |c |goto 33.05,39.32 |or
'|complete hasmount(353859) |or
step
骑乘逃脱的野兽
|tip 使用技能条上出现的“紧紧抓住”按钮，随“逃脱的野生生物”获得极速时按下。
collect Wilderling Saddle##187281 |or
|tip 这只能由与夜行者盟约对齐的角色收集。
|tip 完成骑乘逃脱的野性之后，有机会掉落这个。
|tip 可能需要多次尝试才能获得这个。
'|complete hasmount(353859) |or
step
点击任务接受框
accept Wilderling Saddle##64528 |or
'|complete hasmount(353859) |or
step
talk Reldorn##180340
turnin Wilderling Saddle##64528 |goto 60.53,21.06 |or
'|complete hasmount(353859) |or
step
collect Summer Wilderling Harness##186492 |or
'|complete hasmount(353859) |or
step
use the Summer Wilderling Harness##186492
学习夏日野性兽坐骑 |learnmount Summer Wilderling##353859
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Tamed Mauler",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, Supplies, Of, The, Archivists', Codex"},
mounts={347536},
patch='90100',
mounttype='Ground',
model={100367},
description="This mount has a chance to drop from Supplies of the Archivists' Codex in Korthia.",
},[[
step
与档案管理员协会达到6级声望 |complete rep("The Archivists' Codex") == Tier6 |or
|tip 使用“科斯里亚的档案员”任务线升级指南来完成此任务。
'|learnmount Tamed Mauler##347536 |or
step
label "Turnin_Supply_Quest"
进入洞穴 |goto Korthia/0 61.63,21.71 < 30 |walk
talk Archivist Roh-Suir##178257
|tip 在洞穴内。
turnin Supplies from The Archivists' Codex##64266 |goto 62.78,22.61 |future |or
|tip 这个任务将在你为档案馆编纂者获得1万声望后可交付。
|tip 你可以通过完成日常任务、击杀稀有怪和开宝箱在科尔希亚获得声望。
|tip 这个任务是可重复的。
'|learnmount Tamed Mauler##347536 |or
step
use the Supplies of the Archivists' Codex##187028
collect Tamed Mauler Harness##186641 |or
|tip 可能需要多次尝试才能获得这个。
'|complete itemcount(187028) == 0 and itemcount(186641) == 0 and not hasmount(347536) |next "Turnin_Supply_Quest" |or
'|learnmount Tamed Mauler##347536 |or
step
use the Tamed Mauler Harness##186641
学习驯服的撕裂者坐骑 |learnmount Tamed Mauler##347536
step
_Congratulations!_
你收集了驯服的撕裂者坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Undying Darkhound",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, War, Chest, Of, The, Undying, Army"},
mounts={352742},
patch='90100',
mounttype='Ground',
model={98225},
description="This mount has a chance to drop from War Chest of the Undying Army in The Maw.",
},[[
step
完成亡灵议会在马尔的攻击
|tip 使用“盟约突袭”升级指南来完成这个目标。
collect War Chest of the Undying Army##185992 |or
'|learnmount Undying Darkhound##352742 |or
step
use the War Chest of the Undying Army##185992
collect Undying Darkhound's Harness##186103 |or
|tip 可能需要多次尝试才能获得这个。
'|learnmount Undying Darkhound##352742 |or
step
use the Undying Darkhound's Harness##186103
学习不灭黑犬坐骑 |learnmount Undying Darkhound##352742
step
_Congratulations!_
你收集了不灭暗犬坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Vengeance",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount, Sanctum, Of, Domination"},
mounts={351195},
patch='90100',
mounttype='Flying',
model={100912},
description="This mount has a chance to drop from Sylvanas Windrunner in the Sanctum of Domination Mythic raid.",
},[[
step
kill Sylvanas Windrunner##179687
|tip 使用“统治圣所”团队副本指南来帮助你完成这个。
collect Vengeance's Reins##186642 |or
|tip 这个只会在史诗难度下掉落。
|tip 可能需要多次尝试才能获得这个。
'|learnmount Vengeance##351195 |or
step
use the Vengeance's Reins##186642
学习“复仇”坐骑 |learnmount Vengeance##351195
step
_Congratulations!_
你收集了“复仇”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Vicious War Gorm (Alliance)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, PVP, Alliance"},
mounts={348770},
patch='90100',
mounttype='Ground',
model={100579},
description="This mount is a Shadowlands Season 2 Rated Arena and Rated Battleground seasonal reward for Alliance characters.",
},[[
step
参加评级竞技场或评级战场
collect Vicious War Gorm##186178 |or
|tip 在暗影国度第二季排名 PvP 赛季中与联盟角色一起参与以获得这只坐骑。
'|learnmount Vicious War Gorm##348770 |or
step
use the Vicious War Gorm##186178
学习恶毒战争戈尔姆坐骑 |learnmount Vicious War Gorm##348770
step
_Congratulations!_
你收集了“凶暴的战争戈尔姆”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Vicious War Gorm (Horde)",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, PVP, Horde"},
mounts={348769},
patch='90100',
mounttype='Ground',
model={100580},
description="This mount is a Shadowlands Season 2 Rated Arena and Rated Battleground seasonal reward for Horde characters.",
},[[
step
参加评级竞技场或评级战场
collect Vicious War Gorm##186179 |or
|tip 在暗影国度第二季评级PvP赛季中与部落角色参与以获得此坐骑。
'|learnmount Vicious War Gorm##348769 |or
step
use the Vicious War Gorm##186179
学习恶毒战争戈尔姆坐骑 |learnmount Vicious War Gorm##348769
step
_Congratulations!_
你收集了“凶暴的战争戈尔姆”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Wandering Arden Doe",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Flying, Mount"},
mounts={354362},
patch='90100',
mounttype='Flying',
model={94296},
description="This mount is rewarded to you after completing the quest Maelie, The Wanderer.",
},[[
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
归还游荡者梅莉的任务请点击这里 |confirm |goto Korthia/0 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
返回游荡者梅莉的家，点击此处两次 |confirm |goto 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
当你将游荡者 玛艾莉 三次带回家时点击这里 |confirm |goto 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
点击这里，将流浪者梅莉带回家四次 |confirm |goto 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
点击这里，当你五次将游荡者梅莉返回家时 |confirm |goto 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
click Maelie the Wanderer##179912
|tip 她看起来像一只红褐色的独角兽，银色的鬃毛和紫色的角。
|tip 每天“游荡者梅利”将在随机位置刷新，主要出现在克希利亚的悬崖和巨树根部。
|tip Tinybell会在你成功定位并将“流浪者梅莉”返还给她6次后给你一个任务。
|tip “游荡者梅丽”每天只能救一次。
回家六次时点击这里召唤游荡者梅利 |confirm |goto 49.4,42.2 |or
你也可以在周围找到它：
[41.0,39.8]
[35.8,46.4]
[30.0,55.6]
[38.4,31.4]
[43.2,31.4]
[50.4,23.2]
[60.0,15.2]
[62.4,49.8]
'|learnmount Wandering Arden Doe##354362 |or
step
talk Tinybell##179930
accept Maelie, The Wanderer##64292 |goto 60.6,21.8 |or
turnin Maelie, The Wanderer##64292 |goto 60.6,21.8 |or
'|learnmount Wandering Arden Doe##354362 |or
step
collect Reins of the Wanderer##186643 |or
'|learnmount Wandering Arden Doe##354362 |or
step
use the Reins of the Wanderer##186643
学习“游荡的阿登鹿”坐骑 |learnmount Wandering Arden Doe##354362
step
_Congratulations!_
你获得了“徘徊的阿登梅鹿”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Wild Hunt Legsplitter",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Ground, Mount, War, Chest, Of, The, Wild, Hunt"},
mounts={352441},
patch='90100',
mounttype='Ground',
model={94346},
description="This mount has a chance to drop from War Chest of the Wild Hunt in The Maw.",
},[[
step
在冥狱完成夜之子突袭
|tip 使用“盟约突袭”指南来帮助你完成这个。
collect War Chest of the Wild Hunt##185991 |or
'|learnmount Wild Hunt Legsplitter##352441 |or
step
use the War Chest of the Wild Hunt##185991
collect Legsplitter War Harness##186000 |or
|tip 可能需要多次尝试才能获得这个。
'|learnmount Wild Hunt Legsplitter##352441 |or
step
use the Legsplitter War Harness##186000
学习野猎腿断者坐骑 |learnmount Wild Hunt Legsplitter##352441
step
_Congratulations!_
你获得了野性狩猎者腿劈者坐骑。
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Patient Bufonid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={363701},
patch='90200',
mounttype='Ground',
model={104886},
description="This guide will walk you through collecting the \"Patient Bufonid\" mount.",
},[[
step
完成“集结力量”任务 |complete completedq(64958) |or
|tip 这是塞雷之境战役第一章的最终任务。
点击这里加载泽雷斯摩提斯升级指南 |loadguide "Leveling Guides\\Shadowlands (50-60)\\Eternity's End\\Zereth Mortis" |or
step
talk Avna##180950
accept The Burrowed Bufonid##65727 |goto Zereth Mortis/0 34.34,65.89
step
在该区域击杀维斯波伊敌人
collect 15 Vespoid Honey##190852 |q 65727/1 |goto 63.05,58.59
step
talk Avna##180950
turnin The Burrowed Bufonid##65727 |goto 34.34,65.89
step
collect 30 Tenebrous Ribs##172053 |q 65725 |future
step
等待下一个任务可用 |complete not completedq(65724) |q 65725 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65725 |goto 34.34,65.88
step
collect 200 Shrouded Cloth##173202 |q 65726 |future
step
等待下一个任务可用 |complete not completedq(65724) |q 65726 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65726 |goto 34.34,65.88
step
collect 10 Elysian Thade##173037 |q 65728 |future
step
等待下一个任务可用 |complete not completedq(65724) |q 65728 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65728 |goto 34.34,65.89
step
collect 5 Protoflesh##187704 |q 65729 |future
step
等待下一个任务可用 |complete not completedq(65724) |q 65729 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65729 |goto 34.34,65.88
step
talk Mai Toa##185748
buy 5 Catalyzed Apple Pie##190880 |goto 58.55,49.81 |q 65730 |future
step
等待下一个任务可用 |complete not completedq(65724) |q 65730 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65730 |goto 34.34,65.89
step
talk Fruit Vendor##180114
|tip 在塔兹维什，披风市场的地下城内，在楼梯前左侧帐篷下。
buy 1 Organic Melon##187171 |goto Tazavesh, the Veiled Market/7 86.37,47.60 |q 65731 |future
|tip 这些数量限制为10个。
|tip 如果它们没有库存，你需要等待商人重新补货。
step
等待下一个任务可用 |complete not completedq(65724) |q 65731 |future
step
talk Avna##180950
accept The Burrowed Bufonid##65731 |goto Zereth Mortis/0 34.34,65.89
step
观看对话
talk Avna##180950
accept The Patient Bufonid##65732 |goto 34.34,65.88
step
talk Avna##180950
turnin The Patient Bufonid##65732 |goto 34.34,65.88
step
use the Patient Bufonid##188808
学习“耐心蛙人”坐骑 |learnmount Patient Bufonid##363701
step
_Congratulations!_
你收集了“耐心的牛头人坐骑”。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Bronze Helicid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359376},
patch='90200',
mounttype='Ground',
model={100125},
description="This guide will walk you through collecting the \"Bronze Helicid\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Bronze Helicid"
step
use the Schematic: Bronze Helicid##189462
accept Schematic Reassimilation: Bronze Helicid##65385
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Bronze Helicid##65385 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Unalloyed_Bronze_Ingot"
stickystart "Collect_Helicid_Lattice"
step
杀死该区域周围的敌人
collect 400 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Unalloyed_Bronze_Ingot"
collect Unalloyed Bronze Ingot##189179
|tip 目前尚不清楚该物品的掉落来源。
step
label "Collect_Helicid_Lattice"
在这些区域消灭赫利西德敌人
collect Helicid Lattice##189145 |goto 57.33,82.92
你可以在[55.88,69.41]附近找到更多。
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择青铜直升机坐骑并点击“创建”按钮。
collect Bronze Helicid##187670 |goto 70.21,28.56
step
use the Bronze Helicid##187670
学习青铜飞行器坐骑 |learn Bronze Helicid##359376
step
_Congratulations!_
你收集了青铜直升机坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Aquatic Mounts\\Miscellaneous Mounts\\Deepstar Aurelid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={342680},
patch='90200',
mounttype='Aquatic',
model={98891},
description="This guide will walk you through collecting the \"Deepstar Aurelid\" mount.",
},[[
step
kill Hirukon##180978
|tip 点击地图上的图标使用该怪物的POI稀有指南。
collect Deepstar Polyp##187676 |goto Zereth Mortis/0 52.20,75.30
step
use Deepstar Polyp##187676
学习深海星辰水陆生物坐骑 |learnmount Deepstar Aurelid##342680
step
_Congratulations!_
你获得了深海星辉飞马坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Bronzewing Vespoid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359364},
patch='90200',
mounttype='Flying',
model={98888},
description="This guide will walk you through collecting the \"Bronzewing Vespoid\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Bronzewing Vespoid"
step
use the Schematic: Bronzewing Vespoid##189473
accept Schematic Reassimilation: Bronzewing Vespoid##65396
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Bronzewing Vespoid##65396 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Unalloyed_Bronze_Ingot"
stickystart "Collect_Vespoid_Lattice"
step
杀死该区域周围的敌人
collect 350 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Unalloyed_Bronze_Ingot"
collect Unalloyed Bronze Ingot##189179
|tip 目前尚不清楚该物品的掉落来源。
step
label "Collect_Vespoid_Lattice"
在这些区域击杀韦斯波伊德敌人
collect Vespoid Lattice##189154 |goto 51.47,42.07
你可以在[62.93,57.96]附近找到更多。
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择青铜翼蜂虫坐骑并点击“创建”按钮。
collect Bronzewing Vespoid##187663 |goto 70.21,28.56
step
use the Bronzewing Vespoid##187663
学习青铜翼蜂虫坐骑 |learn Bronzewing Vespoid##359364
step
_Congratulations!_
你获得了“青铜翅膀蜂虫”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Buzz",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={365048},
patch='90200',
mounttype='Flying',
model={98889},
description="This guide will walk you through collecting the \"Buzz\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Buzz"
step
use the Schematic: Buzz##189474
accept Schematic Reassimilation Buzz##65397
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Buzz##65397 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Protoform_Sentience_Crown"
stickystart "Collect_Vespoid_Lattice"
step
杀死该区域周围的敌人
collect 500 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Protoform_Sentience_Crown"
杀死该区域周围的敌人
|tip 被支配的吉罗和自动机械体最有可能掉落这些物品。
|tip 寻找被统治、被制服、被束缚和被锁链缠绕的敌人。
|tip 这些敌人大多数都是精英。
collect Protoform Sentience Crown##189176 |goto 47.87,10.52
step
label "Collect_Vespoid_Lattice"
在这些区域击杀韦斯波伊德敌人
collect Vespoid Lattice##189154 |goto 51.47,42.07
你可以在[62.93,57.96]附近找到更多。
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择嗡嗡骑乘并点击“创建”按钮。
collect Buzz##187665 |goto 70.21,28.56
step
use the Buzz##187665
学习嗡嗡坐骑 |learn Buzz##359364
step
_Congratulations!_
你收集了"嗡嗡"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Forged Spiteflyer",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359367},
patch='90200',
mounttype='Flying',
model={98890},
description="This guide will walk you through collecting the \"Forged Spiteflyer\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Forged Spiteflyer"
step
use the Schematic: Forged Spiteflyer##189475
accept Schematic Reassimilation: Forged Spiteflyer##65398
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Forged Spiteflyer##65398 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Eternal_Ragepearl"
stickystart "Collect_Vespoid_Lattice"
step
杀死该区域周围的敌人
collect 450 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Eternal_Ragepearl"
在这个区域击杀被束缚的敌人 |goto 62.22,25.36
|tip 束缚的炮手和束缚的守望者可以掉落此物品。
消灭该区域内被控制的敌人 |goto 47.87,10.52
|tip 被支配的世界毁灭者和被支配的符文塑造者可以掉落该物品。
collect Eternal Ragepearl##189173
step
label "Collect_Vespoid_Lattice"
在这些区域击杀韦斯波伊德敌人
collect Vespoid Lattice##189154 |goto 51.47,42.07
你可以在[62.93,57.96]附近找到更多。
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择锻造怨蝇坐骑并点击“创建”按钮。
collect Forged Spiteflyer##187664 |goto 70.21,28.56
step
use Forged Spiteflyer##187664
学习“锻造怨怒飞行器”坐骑 |learnmount Forged Spiteflyer##359367
step
_Congratulations!_
你获得了“锻造的怨恨飞行器”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Adorned Vombata",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359232},
patch='90200',
mounttype='Ground',
model={98898},
description="This guide will walk you through collecting the \"Adorned Vombata\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Adorned Vombata"
step
use the Schematic: Adorned Vombata##189478
accept Schematic Reassimilation: Adorned Vombata##65401
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Adorned Vombata##65401 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Vombata_Lattice"
step
杀死该区域周围的敌人
collect 450 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Vombata_Lattice"
kill Mawtouched Bull##181359+
|tip 你也可以消灭草地沃巴塔和沃巴塔母兽，如果你看到它们的话。
collect Vombata Lattice##189156 |goto 43.96,59.04
你可以在[49.13,60.50]附近找到更多的宝藏。
step
与启迪者达到尊敬声望 |complete rep("The Enlightened") >= Revered
|tip 这可以通过完成泽雷思·莫提斯的日常任务和世界任务来实现。
|tip 稀有怪和宝藏有机会掉落声望 Tokens。
step
talk Vilo##182257
buy 1 Lens of Focused Intention##189174 |goto 34.76,64.13
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择装饰的沃姆巴塔坐骑并点击“创建”按钮。
collect Adorned Vombata##187632 |goto 70.21,28.56
step
use the Adorned Vombata##187632
学习“装饰的沃姆巴塔”坐骑 |learn Adorned Vombata##359232
step
_Congratulations!_
你收集了“装饰的沃姆巴塔”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Deathrunner",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359278},
patch='90200',
mounttype='Ground',
model={98882},
description="This guide will walk you through collecting the \"Deathrunner\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Deathrunner"
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Deathrunner##65380 |goto Zereth Mortis/0 70.21,28.56
stickystart "Collect_Tools_of_Incomprehensible_Experimentation"
stickystart "Collect_Cervid_Lattice"
step
杀死该区域周围的敌人
collect 450 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Tools_of_Incomprehensible_Experimentation"
collect Tools of Incomprehensible Experimentation##189178
|tip 目前尚不清楚该物品的掉落来源。
step
label "Collect_Cervid_Lattice"
在这些区域击杀角兽敌人
|tip 你也可以使用POI指南击杀长老奇塔利。
collect Cervid Lattice##187635 |goto 52.08,66.66
你可以在附近找到更多：
[56.33,61.35]
[49.74,69.15]
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择死亡奔行者坐骑并点击“创建”按钮。
collect Deathrunner##187638 |goto 70.21,28.56
step
use Deathrunner##187638
学习死跑者坐骑 |learnmount Deathrunner##359278
step
_Congratulations!_
你获得了死亡奔跑者坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Genesis Crawler",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359401},
patch='90200',
mounttype='Ground',
model={98883},
description="This guide will walk you through collecting the \"Genesis Crawler\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Genesis Crawler"
step
use the Schematic: Genesis Crawler##189465
accept Schematic Reassimilation: Genesis Crawler##65388
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Genesis Crawler##65388 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Bauble_of_Pure_Innovation"
stickystart "Collect_Tarachnid_Lattice"
step
杀死该区域周围的敌人
collect 400 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Bauble_of_Pure_Innovation"
click Bauble of Pure Innovation
|tip 在洞穴内。
|tip 它看起来像一个微小的漂浮水晶形状的物体，散发着小光点，位于流亡者的空心处。
|tip 这个物品的复活时间非常长。
collect Bauble of Pure Innovation##189171 |goto 34.49,49.72
step
label "Collect_Tarachnid_Lattice"
进入建筑物 |goto 55.93,32.65 < 10 |walk
杀死该区域周围的敌人
|tip 在建筑物内。
|tip 你可以在建筑外找到更多。
collect Tarachnid Lattice##189152 |goto 54.09,34.93
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择创世爬行者坐骑并点击“创建”按钮。
collect Genesis Crawler##187677 |goto 70.21,28.56
step
use Genesis Crawler##187677
学习“创世爬行者”坐骑 |learnmount Genesis Crawler##359401
step
_Congratulations!_
你收集了"起源爬虫"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Pale Regal Cervid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={342671},
patch='90200',
mounttype='Ground',
model={98879},
description="This guide will walk you through collecting the \"Pale Regal Cervid\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Pale Regal Cervid"
step
use the Schematic: Pale Regal Cervid##189455
accept Schematic Reassimilation: Pale Regal Cervid##65375
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Pale Regal Cervid##65375 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Protoform_Sentience_Crown"
stickystart "Collect_Cervid_Lattice"
step
杀死该区域周围的敌人
collect 400 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Protoform_Sentience_Crown"
杀死该区域周围的敌人
|tip 被支配的吉罗和自动机械体最有可能掉落这些物品。
|tip 寻找被统治、被制服、被束缚和被锁链缠绕的敌人。
|tip 这些敌人大多数都是精英。
collect Protoform Sentience Crown##189176 |goto 47.87,10.52
step
label "Collect_Cervid_Lattice"
在这些区域击杀角兽敌人
|tip 你也可以使用POI指南击杀长老奇塔利。
collect Cervid Lattice##187635 |goto 52.08,66.66
你可以在附近找到更多：
[56.33,61.35]
[49.74,69.15]
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择苍白华丽的鹿坐骑并点击“创建”按钮。
collect Pale Regal Cervid##187639 |goto 70.21,28.56
step
use Pale Regal Cervid##187639
学习苍白华丽的鹿坐骑 |learnmount Pale Regal Cervid##342671
step
_Congratulations!_
您获得了苍白华丽的鹿坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Raptora Swooper",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359373},
patch='90200',
mounttype='Flying',
model={98878},
description="This guide will walk you through collecting the \"Raptora Swooper\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Raptora Swooper"
step
use the Schematic: Raptora Swooper##189460
accept Schematic Reassimilation: Raptora Swooper##65383
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Raptora Swooper##65383 |goto Zereth Mortis/0 70.21,28.57
step
杀死该区域周围的敌人
collect 450 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
stickystart "Collect_Eternal_Ragepearl"
stickystart "Collect_Raptora_Lattice"
step
label "Collect_Eternal_Ragepearl"
在这个区域击杀被束缚的敌人 |goto 62.22,25.36
|tip 束缚的炮手和束缚的守望者可以掉落此物品。
消灭该区域内被控制的敌人 |goto 47.87,10.52
|tip 被支配的世界毁灭者和被支配的符文塑造者可以掉落该物品。
collect Eternal Ragepearl##189173
step
label "Collect_Raptora_Lattice"
在泽雷特莫提斯击杀拉普托拉敌人
|tip 你可以在整个区域中找到它们在飞翔。
|tip 加鲁登和塔克维茨是稀有怪物，会掉落它。
collect Raptora Lattice##189150
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择掠风猛禽坐骑并点击“创建”按钮。
collect Raptora Swooper##187668 |goto 70.21,28.56
step
use Raptora Swooper##187668
学习“迅猛龙掠夺者”坐骑 |learnmount Raptora Swooper##359373
step
_Congratulations!_
你收集了“掠翼猛禽”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Russet Bufonid",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={363706},
patch='90200',
mounttype='Ground',
model={104888},
description="This guide will walk you through collecting the \"Russet Bufonid\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Russet Bufonid"
step
use the Schematic: Russet Bufonid##189471
accept Schematic Reassimilation: Russet Bufonid##65394
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Russet Bufonid##65394 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Bufonid_Lattice"
step
杀死该区域周围的敌人
collect 350 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Bufonid_Lattice"
在这些区域击杀布法尼德敌人
|tip 加速和过度生长的蟾蜍掉落此物品，还有稀有怪物戈尔凯克。
collect Bufonid Lattice##187633 |goto 50.62,73.68
你可以在附近找到更多：
[43.65,88.44]
[76.43,53.07]
[75.52,60.47]
[75.91,46.29]
step
与启迪者达到尊敬声望 |complete rep("The Enlightened") >= Revered
|tip 这可以通过完成泽雷思·莫提斯的日常任务和世界任务来实现。
|tip 稀有怪和宝藏有机会掉落声望 Tokens。
step
talk Vilo##182257
buy 1 Lens of Focused Intention##189174 |goto 34.76,64.13
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择红褐色冠蛙坐骑，然后点击“创建”按钮。
collect Russet Bufonid##188810 |goto 70.21,28.56
step
use Russet Bufonid##188810
学习“赤褐色大蝾螈”坐骑 |learnmount Russet Bufonid##363706
step
_Congratulations!_
你获得了"红色牛蛙"坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Sundered Zerethsteed",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359277},
patch='90200',
mounttype='Ground',
model={98880},
description="This guide will walk you through collecting the \"Sundered Zerethsteed\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Sundered Zerethsteed"
step
use the Schematic: Sundered Zerethsteed##189456
accept Schematic Reassimilation: Sundered Zerethsteed##65379
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Sundered Zerethsteed##65379 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Mawforged_Bridle"
stickystart "Collect_Cervid_Lattice"
step
杀死该区域周围的敌人
collect 300 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Mawforged_Bridle"
collect Mawforged Bridle##189175
|tip 目前尚不清楚该物品的掉落来源。
step
label "Collect_Cervid_Lattice"
在这些区域击杀角兽敌人
|tip 你也可以使用POI指南击杀长老奇塔利。
collect Cervid Lattice##187635 |goto 52.08,66.66
你可以在附近找到更多：
[56.33,61.35]
[49.74,69.15]
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择破碎的泽雷斯骑乘并点击“创建”按钮。
collect Reins of the Sundered Zerethsteed##187641 |goto 70.21,28.56
step
use Reins of the Sundered Zerethsteed##187641
学习撕裂的泽雷斯骑兽坐骑 |learnmount Sundered Zerethsteed##359277
step
_Congratulations!_
你收集了破碎的泽雷斯马。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Miscellaneous Mounts\\Tarachnid Creeper",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={359402},
patch='90200',
mounttype='Ground',
model={98884},
description="This guide will walk you through collecting the \"Tarachnid Creeper\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Tarachnid Creeper"
step
use the Schematic: Tarachnid Creeper##189466
accept Schematic Reassimilation: Tarachnid Creeper##65389
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Tarachnid Creeper##65389 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Revelation_Key"
stickystart "Collect_Tarachnid_Lattice"
step
杀死该区域周围的敌人
collect 450 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Revelation_Key"
kill Protector of the First Ones##180746
|tip 这是一只稀有怪。
|tip 使用POI稀有指南来完成此任务。
collect Revelation Key##189177 |goto 38.87,27.62
step
label "Collect_Tarachnid_Lattice"
进入建筑物 |goto 55.93,32.65 < 10 |walk
杀死该区域周围的敌人
|tip 在建筑物内。
|tip 你可以在建筑外找到更多。
collect Tarachnid Lattice##189152 |goto 54.09,34.93
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择塔拉克尼德爬行者坐骑并点击“创建”按钮。
collect Tarachnid Creeper##187678 |goto 70.21,28.56
step
use Tarachnid Creeper##187678
学习“塔拉克尼德爬行者”坐骑 |learnmount Tarachnid Creeper##359402
step
_Congratulations!_
你收集了“塔拉克尼德爬行者”坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Miscellaneous Mounts\\Vespoid Flutterer",{
author="support@zygorguides.com",
startlevel=60.0,
keywords={"Mount"},
mounts={342678},
patch='90200',
mounttype='Flying',
model={98887},
description="This guide will walk you through collecting the \"Vespoid Flutterer\" mount.",
},[[
leechsteps "Profession Guides\\Protoform Synthesis\\Schematic: Vespoid Flutterer"
step
use the Schematic: Vespoid Flutterer##189472
accept Schematic Reassimilation: Vespoid Flutterer##65395
step
talk Servitor Interface##181135
|tip 在建筑物内。
turnin Schematic Reassimilation: Vespoid Flutterer##65395 |goto Zereth Mortis/0 70.21,28.57
stickystart "Collect_Wind's_Infinite_Call"
stickystart "Collect_Vespoid_Lattice"
step
杀死该区域周围的敌人
collect 400 Genesis Mote##188957 |goto 41.74,72.00
|tip 这些从泽雷德摩提斯的任何敌人掉落。
|tip 在创世领域，吞噬者和 scavenger 的重生速度很快。
step
label "Collect_Wind's_Infinite_Call"
kill Enhanced Avian##182096+
|tip 你可以在第一位者圣墓岛的各个地方找到它们。
collect Wind's Infinite Call##189180 |goto 76.46,53.35
step
label "Collect_Vespoid_Lattice"
在这些区域击杀韦斯波伊德敌人
collect Vespoid Lattice##189154 |goto 51.47,42.07
你可以在[62.93,57.96]附近找到更多。
step
talk Servitor Interface##181135
|tip 在建筑物内。
选择“开始原型合成。”
|tip 选择维斯波德蝴蝶飞行器坐骑并点击“创建”按钮。
collect Vespoid Flutterer##187660 |goto 70.21,28.56
step
use Vespoid Flutterer##187660
学习“维斯波伊德蝴蝶”坐骑 |learnmount Vespoid Flutterer##342678
step
_Congratulations!_
你获得了“维斯波德翅膀”坐骑。
]])
