local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("PetsMountsCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Achievement Mounts\\Otterworldly Ottuk Carrier",{
author="support@zygorguides.com",
description="Some ottuks get into the spirit of carrying people around more than others.",
mounts={376912},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
完成成就“Thanks for the Carry!” |achieve 15834 |only if Alliance
完成成就“Thanks for the Carry!” |achieve 15833 |only if Horde
|tip 需要你获取单个角色可用的500坐骑
step
collect Otterworldly Ottuk Carrier##198654 |or
|tip 这可能是你背包中的一件物品，邮箱中的邮件，或坐骑收藏中的礼物，右键点击并打开。
'|learnmount Otterworldly Ottuk Carrier##376912 |or
step
use the Otterworldly Ottuk Carrier##198654
学习坐骑 Otterworldly Ottuk Carrier |learnmount Otterworldly Ottuk Carrier##376912
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Achievement Mounts\\Hailstorm Armoredon",{
author="support@zygorguides.com",
description="Born in the middle of an ice storm, this armoredon prefers its meals partially frozen.",
mounts={387231},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
获得成就"巨龙时代钥石大师：第一赛季" |achieve 16649
step
collect Hailstorm Armoredon##199412 |or
|tip 这可能是你背包中的一件物品，邮箱中的邮件，或坐骑收藏中的礼物，右键点击并打开。
'|learnmount Hailstorm Armoredon##387231 |or
step
use the Hailstorm Armoredon##199412
学习Hailstorm Armoredon坐骑 |learnmount Hailstorm Armoredon##387231
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Achievement Mounts\\Raging Magmammoth",{
author="support@zygorguides.com",
description="Most lava flows. This lava charges.",
mounts={374275},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
获得成就“奥达曼的荣耀” |achieve 16355
step
collect Raging Magmammoth##192806 |or
|tip 这可能是你背包中的一件物品，邮箱中的邮件，或坐骑收藏中的礼物，右键点击并打开。
'|learnmount Raging Magmammoth##374275 |or
step
use the Raging Magmammoth##192806
学习坐骑：狂怒的熔岩猛犸 |learnmount Raging Magmammoth##374275
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Achievement Mounts\\Shellack",{
author="support@zygorguides.com",
description="Fed by victory and hardened by glory, this snail is nothing less than a tribute to mastery.",
mounts={374155},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
获取龙翼英雄荣耀成就 |achieve 16295
step
collect Shellack##192784 |or
|tip 这可能是你背包中的一件物品，邮箱中的邮件，或坐骑收藏中的礼物，右键点击并打开。
'|learnmount Shellack##374155 |or
step
use Shellack##192784
学习座驾Shellack |learnmount Shellack##374155
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Jade, Bright Foreseer",{
author="support@zygorguides.com",
description="The presence of this majestic Pandaren rabbit spirit brings joy and happiness and is heralded as a wonderful omen. Legend says that in its eyes, you can glimpse the greatest happiness of your life, even if it is yet to come.",
mounts={369451},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
学习坐骑翡翠莹亮先知 |learnmount Jade, Bright Foreseer##369451
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 你也可以通过购买六个月的魔兽世界订阅来获得这个坐骑。
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Blizzard Store Mounts\\Viridian Phase-Hunter",{
author="support@zygorguides.com",
description="The otherworldly energies that transformed Draenor gave these creatures the ability to shift through space.",
mounts={346136},
mounttype='Ground',
startlevel=60,
keywords={"Shadowlands"},
patch='100002',
},[[
step
学习Viridian Phase-Hunter坐骑 |learnmount Viridian Phase-Hunter##346136
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 您还可以通过购买Burning Crusade Classic Deluxe Edition获取此坐骑。
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Lucky Yun",{
author="support@zygorguides.com",
description="Pandaren elders claim he will bestow good fortune upon those who touch his glittering hide.",
mounts={308087},
model={93352},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
学习幸运云坐骑 |learnmount Lucky Yun##308087
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Nether-Gorged Greatwyrm",{
author="support@zygorguides.com",
description="Bristling with arcane energy, this mount carries you to the far horizons of whatever plane of existence your adventures require.",
mounts={367676},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
collect Nether-Gorged Greatwyrm##190581 |or
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 这可能是你背包中的一件物品，邮箱中的邮件，或坐骑收藏中的礼物，右键点击并打开。
'|learnmount Nether-Gorged Greatwyrm##367676
step
use the Nether-Gorged Greatwyrm##190581
学习虚渊巨龙坐骑 |learnmount Nether-Gorged Greatwyrm##367676
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Sapphire Skyblazer",{
author="support@zygorguides.com",
description="These birds burn hotter and brighter than than any avian to ever soar across the skies.",
mounts={347812},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
学习蓝玉焰翼翔龙坐骑 |learnmount Sapphire Skyblazer##347812
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Sunwarmed Furline",{
author="support@zygorguides.com",
description="The fuzziest mount Azeroth has ever seen.",
mounts={317177},
model={95057},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
学习坐骑阳煦线尾猫 |learnmount Sunwarmed Furline##317177
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Sylverian Dreamer",{
author="support@zygorguides.com",
description="A beautiful feathered dragon, born of an artist's dream in the magical city of Dalaran.",
mounts={290132},
model={90396},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
collect Sylverian Dreamer##166776 |or
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
'|learnmount Sylverian Dreamer##290132 |or
step
use Sylverian Dreamer##166776
学习 Sylverian Dreamer 坐骑 |learnmount Sylverian Dreamer##290132
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Wen Lo, the River's Edge",{
author="support@zygorguides.com",
description="The rivers of Pandaria, like Wen Lo, are unpredictable in nature. They may remain calm, bringing water to the crops, or flood, bringing ruin. Wen Lo reminds us that we must adapt to the challenges of life.",
mounts={359317},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
学习坐骑 Wen Lo, the River's Edge |learnmount Wen Lo, the River's Edge##359317
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
|tip 您还可以通过购买Burning Crusade Classic Deluxe Edition获取此坐骑。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Blizzard Store Mounts\\Gilded Ravasaur",{
author="support@zygorguides.com",
description="Horses in the Kul Tiran military are bred from an early age not to fear the sea, and revel in galloping along the shoreline and through the spray.",
mounts={255696},
model={80358},
mounttype='Flying',
startlevel=60,
keywords={"BFA"},
patch='100002',
},[[
step
collect Gilded Ravasaur##153540 |or
|tip 此坐骑可在暴雪商城购买
|tip 在角色登录界面点击商店打开暴雪商店，或者在游戏内点击商店菜单，然后前往坐骑
|tip 购买后，您可能需要在坐骑面板中点击以解锁。
|tip 你也可以通过购买Battle for Azeroth Collector's Edition获取这个坐骑
'|learnmount Gilded Ravasaur##255696 |or
step
use Gilded Ravasaur##153540
学习Gilded Ravasaur坐骑 |learnmount Gilded Ravasaur##255696
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Liberated Slyvern",{
author="support@zygorguides.com",
description="It's difficult to tell because it's far too angry, but this slyvern is actually glad it's not owned by gnolls anymore.",
mounts={359622},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
kill Breezebiter##195353 |goto The Azure Span/0 29.80,46.31
|tip 这个精英怪从这个洞穴刷新并在这个区域飞来飞去
|tip 看起来像一只被鬣狗人骑着的双足飞龙。
|tip 你可以反复击杀他以尝试获得掉落。
collect Reins of the Liberated Slyvern##201440 |or
|tip 该物品是稀有掉落
'|learnmount Liberated Slyvern##359622 |or
step
use the Reins of the Liberated Slyvern##201440
学习解锁坐骑解放的狡黠翼龙 |learnmount Liberated Slyvern##359622
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Dropped Mounts\\Zenet Hatchling",{
author="support@zygorguides.com",
description="The hardest winds begin with a gust and a flap.",
mounts={385266},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
kill Zenet Avis##193209
|tip 这个稀有刷新在这个区域的山脊周围飞行。
|tip 她看起来像一只巨大的红色猛禽
collect Zenet Egg##200879 |goto Ohn'ahran Plains/0 30.52,65.73 |or
你也可以在[31.50,62.08]附近找到她
'|learnmount Zenet Hatchling##385266 |or
step
学习坐骑Zenet Hatchling |learnmount Zenet Hatchling##385266
|tip 7天后，泽内特蛋应该会自动孵化。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Puzzle Mounts\\Divine Kiss of Ohn'ahra",{
author="support@zygorguides.com",
description="...as though welcomed by the wind itself.",
mounts={359408},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到等级63 |ding 63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 上交大狩猎所得的狩猎战利品获取声望
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
提升玛鲁克半人马的声望至9级 |complete factionrenown(2503) >= 9
|tip 完成日常任务、每周任务和欧恩哈拉平原区域任务来获得名望
|tip 每次亚亚格哨站在新地点安营扎寨时，你也可以完成任务
step
talk Windsage Ordven##195302
accept A Disgruntled Initiate##65906 |goto Ohn'ahran Plains/0 63.12,34.04
step
talk Initiate Radiya##190014
turnin A Disgruntled Initiate##65906 |goto 56.26,75.96
accept Sneaking Out##65901 |goto 56.26,75.96
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 56.65,76.27 |count 1
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 57.36,76.33 |count 2
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 57.01,75.48 |count 3
step
talk Initiate Radiya##190014
告诉她 _"图腾已经安放。"
通知 Radiya |q 65901/2 |goto 56.25,75.95
step
talk Initiate Radiya##190014
turnin Sneaking Out##65901 |goto 54.79,66.40
accept Favorite Fruit##65907 |goto 54.79,66.40
step
click Wildsprings Shrub+
|tip 它们看起来像是这一片地面上的绿色灌木丛。
collect 6 Wild Bushfruit##192743 |q 65907/1 |goto 53.53,71.02
step
use the Wild Bushfruit##192743+
|tip 将此用在泥浆践踏者。
|tip 它们看起来像这个地区的大小河马
喂养#6#踩泥者 |q 65907/2 |goto 54.28,66.61
step
talk Initiate Radiya##190014
turnin Favorite Fruit##65907 |goto 54.79,66.40
accept A Promise Is A Promise##65770 |goto 54.79,66.40
step
talk Initiate Radiya##190014
告诉她 _“我保证会保守你的秘密。”_
诺言·拉迪亚 |q 65770/1 |goto 54.79,66.40
step
前往更北面的Radiya会面 |q 65770/2 |goto 53.11,64.01
step
talk Godoloto##190022
|tip 他飞到岩石上
turnin A Promise Is A Promise##65770 |goto 52.05,63.24
accept More Adventure Than Expected##65761 |goto 52.05,63.24
step
进入建筑物 |goto 47.49,54.23 < 10 |walk
talk Initiate Radiya##190014
|tip 建筑物内部
寻找 Radiya |q 65761/3 |goto 47.51,54.12
step
talk Initiate Radiya##190014
|tip 建筑物内部
turnin More Adventure Than Expected##65761 |goto 47.51,54.12
accept Stealing Its Thunder##65711 |goto 47.51,54.12
step
进入洞穴 |goto 47.54,56.07 < 15 |walk
kill Storm Extractor##190011 |q 65711/1 |goto 47.29,56.72
|tip 他们看起来像是在对一只恐龙施展蓝色闪电法术的半人马
|tip 洞穴内
step
离开洞穴 |goto 47.54,56.07 < 15 |walk |only if subzone("Kaighan Camp") and _G.IsIndoors()
talk Lizi##190009
选择_<温柔地递上草莓。>
安抚迅捷雷蜥Lizi |q 65711/2 |goto 48.31,56.60
step
talk Initiate Radiya##190014
|tip 她跑到这个位置
turnin Stealing Its Thunder##65711 |goto 48.27,56.49
accept Sneaking In##66676 |goto 48.27,56.49
step
talk Initiate Radiya##190014
返回拉迪亚在奥恩伊尔泉水 |q 66676/1 |goto 56.20,77.10
step
talk Initiate Radiya##190014
turnin Sneaking In##66676 |goto 56.20,77.10
step
kill Balakar Khan##186151
|tip 组建一个队伍并进入地下城或通过地下城查找器排队。
|tip 这是副本中的最后首领。
collect 3 Stolen Breath of Ohn'ahra##201929 |goto The Nokhud Offensive/0 34.84,38.81 |q 72512 |future |or
|tip 你需要击败这个boss至少三次才能获得这些物品
'|learnmount Divine Kiss of Ohn'ahra##359408 |or
step
达到70级 |ding 70
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 上交大狩猎所得的狩猎战利品获取声望
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
与马鲁克半人马声望达到25级 |complete factionrenown(2503) >= 25
|tip 完成日常任务、每周任务和欧恩哈拉平原区域任务来获得名望
|tip 每次亚亚格哨站在新地点安营扎寨时，你也可以完成任务
step
talk Godoloto##190022
accept A Whispering Breeze##72512 |goto Ohn'ahran Plains/0 51.00,62.20
step
collect Exultant Incense##191507 |or
|tip 该物品必须是T3品质。
|tip 你可以用炼金术制造这个物品，与其他玩家交易，或在拍卖行购买。
|tip 这个物品是消耗品，不要右键点击

'|learnmount Divine Kiss of Ohn'ahra##359408 |or
step
kill Eternal Sand##187475+
collect Occasional Sand##194562 |goto Thaldraszus/0 59.80,82.40 |or
'|learnmount Divine Kiss of Ohn'ahra##359408 |or
step
earn 50 Dragon Isles Supplies##2003 |or
|tip 你可以通过任务、宝箱、包裹、储物箱以及击杀怪物和稀有怪物获得这些。
'|learnmount Divine Kiss of Ohn'ahra##359408 |or
step
talk Quartermaster Huseng##196707
|tip 建筑物内部
buy Essence of Awakening##201323 |goto Ohn'ahran Plains/0 60.40,37.60 |or
|tip 这个物品是消耗品，不要右键点击

'|learnmount Divine Kiss of Ohn'ahra##359408 |or
step
talk Ohn'ahra##191248
|tip 她在这个位置坐在一个巢上
turnin A Whispering Breeze##72512 |goto Ohn'ahran Plains/0 57.60,31.80
|tip 她将把你变成白风鹰。
step
学习德莱尼之吻奥娜拉坐骑 |learnmount Divine Kiss of Ohn'ahra##359408
|tip 这坐骑会自动加入你的账号共享坐骑列表。
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Quest Mounts\\Temperamental Skyclaw",{
author="support@zygorguides.com",
description=" Slyverns are rarely comfortable acting as mounts. Only those willing to feed their gluttonous appetites and keep a careful eye on them should attempt to ride.",
mounts={385738},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
消灭这个区域周围的雪皮敌人
collect 20 Flash Frozen Meat##201422 |goto The Azure Span/0 58.14,41.77 |or
|tip 你也可以从拍卖行购买这些物品。
你可以在[57.05,42.90]附近找到更多
'|complete hasmount(385738) |or
step
击杀该区域的Stormfang敌人
collect 20 Gnolan's House Special##201420 |goto The Azure Span/0 23.00,43.60 |or
|tip 你也可以从拍卖行购买这些物品。
'|complete hasmount(385738) |or
step
在这个区域击杀Darktooth敌人
collect 20 Tuskarr Jerky##201421 |goto The Azure Span/0 34.40,44.40 |or
|tip 你也可以从拍卖行购买这些物品。
'|complete hasmount(385738) |or
step
talk Zon'Wogi##190892
选择《询问已驯服的狡诈双足飞龙》
|tip 将食物呈上给Zon'Wogi
collect Temperamental Skyclaw##201454 |goto The Azure Span/0 19.04,23.98 |or
'|complete hasmount(385738) |or
step
use Temperamental Skyclaw##201454
|tip 该物品将被放入你的背包中
学习暴躁的苍穹爪坐骑 |learnmount Temperamental Skyclaw##385738
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Quest Mounts\\Lizi, Thunderspine Tramper",{
author="support@zygorguides.com",
description="Raise your very own Thuderspine mount.",
condition_suggested=function() return level == 60 and not achieved(16584) end,
mounts={374247},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 上交大狩猎所得的狩猎战利品获取声望
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
提升玛鲁克半人马的声望至9级 |complete factionrenown(2503) >= 9
|tip 完成日常任务、每周任务和欧恩哈拉平原区域任务来获得名望
|tip 每次亚亚格哨站在新地点安营扎寨时，你也可以完成任务
step
talk Windsage Ordven##195302
accept A Disgruntled Initiate##65906 |goto Ohn'ahran Plains/0 63.12,34.04
step
talk Initiate Radiya##190014
turnin A Disgruntled Initiate##65906 |goto 56.26,75.96
accept Sneaking Out##65901 |goto 56.26,75.96
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 56.65,76.27 |count 1
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 57.36,76.33 |count 2
step
click Wind Totem
放置风之图腾 |q 65901/1 |goto 57.01,75.48 |count 3
step
talk Initiate Radiya##190014
告诉她 _"图腾已经安放。"
通知 Radiya |q 65901/2 |goto 56.25,75.95
step
talk Initiate Radiya##190014
turnin Sneaking Out##65901 |goto 54.79,66.40
accept Favorite Fruit##65907 |goto 54.79,66.40
step
click Wildsprings Shrub+
|tip 它们看起来像是这一片地面上的绿色灌木丛。
collect 6 Wild Bushfruit##192743 |q 65907/1 |goto 53.53,71.02
step
use the Wild Bushfruit##192743+
|tip 将此用在泥浆践踏者。
|tip 它们看起来像这个地区的大小河马
喂养#6#踩泥者 |q 65907/2 |goto 54.28,66.61
step
talk Initiate Radiya##190014
turnin Favorite Fruit##65907 |goto 54.79,66.40
accept A Promise Is A Promise##65770 |goto 54.79,66.40
step
talk Initiate Radiya##190014
告诉她 _“我保证会保守你的秘密。”_
诺言·拉迪亚 |q 65770/1 |goto 54.79,66.40
step
前往更北面的Radiya会面 |q 65770/2 |goto 53.11,64.01
step
talk Godoloto##190022
|tip 他飞到岩石上
turnin A Promise Is A Promise##65770 |goto 52.05,63.24
accept More Adventure Than Expected##65761 |goto 52.05,63.24
step
进入建筑物 |goto 47.49,54.23 < 10 |walk
talk Initiate Radiya##190014
|tip 建筑物内部
寻找 Radiya |q 65761/3 |goto 47.51,54.12
step
talk Initiate Radiya##190014
|tip 建筑物内部
turnin More Adventure Than Expected##65761 |goto 47.51,54.12
accept Stealing Its Thunder##65711 |goto 47.51,54.12
step
进入洞穴 |goto 47.54,56.07 < 15 |walk
kill Storm Extractor##190011 |q 65711/1 |goto 47.29,56.72
|tip 他们看起来像是在对一只恐龙施展蓝色闪电法术的半人马
|tip 洞穴内
step
离开洞穴 |goto 47.54,56.07 < 15 |walk |only if subzone("Kaighan Camp") and _G.IsIndoors()
talk Lizi##190009
选择_<温柔地递上草莓。>
安抚迅捷雷蜥Lizi |q 65711/2 |goto 48.31,56.60
step
talk Initiate Radiya##190014
|tip 她跑到这个位置
turnin Stealing Its Thunder##65711 |goto 48.27,56.49
accept Sneaking In##66676 |goto 48.27,56.49
step
talk Initiate Radiya##190014
返回拉迪亚在奥恩伊尔泉水 |q 66676/1 |goto 56.20,77.10
step
talk Initiate Radiya##190014
turnin Sneaking In##66676 |goto 56.20,77.10
|tip 提交这个引导任务将会解锁制作丽兹缰绳的5天任务链
|tip 这是一只雷霆蜥蜴坐骑。
step
talk Initiate Radiya##190014
accept To Tame A Thunderspine##71196 |goto 56.20,77.10
stickystart "Collect_Dragon_Isles_Supplies_71196"
step
kill Frenzied Pollenstag##190611+
collect 20 Fluorescent Fluid##192615 |q 71196/1 |goto 82.30,25.12
|tip 你也可以从拍卖行购买他们。
step
label "Collect_Dragon_Isles_Supplies_71196"
earn 150 Dragon Isles Supplies##2003 |q 71196/2
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝箱来收集它们。
step
talk Initiate Radiya##190014
turnin To Tame A Thunderspine##71196 |goto 56.20,77.10
stickystart "Collect_Dragon_Isles_Supplies_71197"
step
击杀这个区域的鞭笞者敌人
collect 20 High-Fiber Leaf##192658 |q 71197 |goto 30.76,52.56 |future
|tip 你也可以从拍卖行购买他们。
|tip 保存这些，你明天会用到
step
label "Collect_Dragon_Isles_Supplies_71197"
earn 150 Dragon Isles Supplies##2003 |q 71197 |future
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝箱来收集它们。
|tip 保存这些，你明天会用到
step
等待下一个任务变为可用 |complete not completedq(71203) or completedq(71197)
|tip 每天重置后会完成一个新任务
|tip 你需要完成5个任务，总计每天1个。
|tip 你还有4个任务要完成。
step
talk Initiate Radiya##190014
accept To Tame A Thunderspine##71197 |goto 56.20,77.10
stickystart "Collect_Dragon_Isles_Supplies_71198"
step
cast Fishing##131474
collect 10 Thousandbite Piranha##194966 |q 71198 |goto 56.29,78.28 |future
|tip 这些可以在龙岛的任何地方钓到
|tip 你也可以从拍卖行购买他们。
|tip 保存这些，你明天会用到
step
label "Collect_Dragon_Isles_Supplies_71198"
earn 150 Dragon Isles Supplies##2003 |q 71198 |future
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝箱来收集它们。
|tip 保存这些，你明天会用到
step
等待下一个任务变为可用 |complete not completedq(71203) or completedq(71198)
|tip 每天重置后会完成一个新任务
|tip 你需要完成5个任务，总计每天1个。
|tip 你还有3个任务未完成。
step
talk Initiate Radiya##190014
accept To Tame A Thunderspine##71198 |goto 57.09,77.65
stickystart "Collect_Dragon_Isles_Supplies_71199"
step
杀死该地区的Musken和Goat敌人
collect 20 Woolly Mountain Pelt##192636 |q 71199 |goto 49.44,36.91 |future
|tip 你也可以从拍卖行购买他们。
|tip 保存这些，你明天会用到
step
label "Collect_Dragon_Isles_Supplies_71199"
earn 150 Dragon Isles Supplies##2003 |q 71199 |future
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝箱来收集它们。
|tip 保存这些，你明天会用到
step
等待下一个任务变为可用 |complete not completedq(71203) or completedq(71199)
|tip 每天重置后会完成一个新任务
|tip 你需要完成5个任务，总计每天1个。
|tip 你还有2个任务未完成
step
talk Initiate Radiya##190014
accept To Tame A Thunderspine##71199 |goto 56.73,76.32
step
等待下一个任务变为可用 |complete not completedq(71203) or completedq(71195)
|tip 每天重置后会完成一个新任务
|tip 你需要完成5个任务，总计每天1个。
|tip 你还有 1 个任务。
step
talk Initiate Radiya##190014
accept To Tame A Thunderspine##71195 |goto 57.66,72.32
stickystart "Collect_Dragon_Isles_Supplies_71195"
step
talk Ohn Meluun##190015
|tip 帐篷内
告诉她 Radiya告诉我关于你的绿色咖喱
收集梅鲁恩的绿咖喱 |q 71195/1 |goto 53.50,79.02
step
label "Collect_Dragon_Isles_Supplies_71195"
earn 150 Dragon Isles Supplies##2003 |q 71195/2
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝箱来收集它们。
step
talk Initiate Radiya##190014
turnin To Tame A Thunderspine##71195 |goto 57.66,72.32
step
talk Initiate Radiya##190014
accept Beast of the Plains##71209 |goto 57.66,72.32
step
talk Initiate Radiya##190014
turnin Beast of the Plains##71209 |goto 57.66,72.32
step
use Lizi's Reins##192799
学习Lizi，雷脊蛮行者坐骑 |learnmount Lizi, Thunderspine Tramper##374247
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Quest Mounts\\Ochre Dreamtalon",{
author="support@zygorguides.com",
description="Playful dreamtalons often decorate themselves in a myriad of colors that only autumn offers.",
mounts={427041},
mounttype='Ground',
startlevel=70,
keywords={"Dragonflight"},
patch='100200',
},[[
step
clicknpc Smoldering Sprout##209253
选择_<扑灭火焰。>
|tip 你必须先下坐骑。
扑灭火焰 |q 77712 |goto The Emerald Dream/0 48.67,67.90 |future
step
clicknpc Blackened Sprout##209468
选择_<清理植物>
|tip 你必须先下坐骑。
清理植物 |q 77713 |goto 48.67,67.90 |future
step
clicknpc Sprout##209292
accept Some Water...##77677 |goto 48.67,67.90
step
talk Professor Ash##208337
问它 _"教授，您对遭受灼伤和严重脱水的植物有什么建议？"_
在中央营地与专家交谈 |q 77677/1 |goto 49.57,62.81
step
clicknpc Empty Gardening Bucket
捡起桶 |q 77677/2 |goto 49.59,62.87
step
use the Unfilled Bucket##208779
填满水桶 |q 77677/3 |goto 51.14,65.77
step
clicknpc Sprout##209292
选择 _<用月井水浇灌植物。>_
浇灌植物 |q 77677/4 |goto 48.67,67.90
step
talk Sprout##209292
选择_<讲一个笑话>
|tip 选择任一对话选项
与植物交谈 |q 77677/5 |goto 48.67,67.90
step
talk Sprout##209292
turnin Some Water...##77677 |goto 48.67,67.90
step
等待植物生长 |complete not completedq(77717) or completedq(78398)
|tip 5天后再回来培养嫩芽。
step
talk Professor Ash##209571
accept A Dash of Minerals...##78398 |goto 48.69,68.06
step
kill Fathomless Lurker##209580+
|tip 在水下
collect 5 Fish Bones##210457 |q 78398/1 |goto 50.92,31.98
step
talk Professor Ash##209571
turnin A Dash of Minerals...##78398 |goto 48.69,68.06
step
等待植物生长 |complete not completedq(77717) or completedq(77697)
|tip 再过五天后再来照顾幼苗。
step
talk Dewy Sapling##209458
accept The Right Food...##77697 |goto 48.68,67.90
step
talk Professor Ash##209571
问它 教授，关于给植物施肥你知道些什么
向阿什教授咨询意见 |q 77697/1 |goto 48.69,68.06
step
click Turtle Egg##408997+
|tip 它们看起来像小蛋散落在这个区域的地面上。
collect 3 Turtle Eggshell Shards##209416 |goto 41.63,76.48 |q 77697
step
击杀这个区域的鞭笞者敌人
collect 5 Lasher Plant Matter##208644 |goto 59.46,79.81 |q 77697
step
talk Saelienne##207627
|tip 帐篷内
buy 5 Tel'Abim Banana##4537 |q 77697 |goto 49.85,61.64
step
use the Lasher Plant Matter##208644
collect Combined Fertilizer Ingredients##208646 |q 77697
step
collect Primed Emerald Dream Fertilizer##208647 |q 77697/4
|tip 你将会在三天的等待后收到这个
step
talk Dewy Sapling##209458
选择 _"<在植物下方撒肥料。>"_
clicknpc Dewy Sapling##209458
将完成的肥料撒在幼苗周围 |q 77697/5 |goto The Emerald Dream/0 48.68,67.89
step
talk Dewy Sapling##209458
选择 _"<讲个笑话。>"_
用几句话来娱悦植物 |q 77697/6 |goto 48.68,67.89
step
talk Dewy Sapling##209458
turnin The Right Food...##77697 |goto 48.68,67.90
step
等待植物生长 |complete not completedq(77717) or completedq(77711)
|tip 再过五天后再来照顾幼苗。
step
talk Professor Ash##209571
accept And a Pinch of Magic##77711 |goto 48.69,68.06
step
use the Druidic Totem##208705
击杀该区域内的Roottender敌人
|tip 在地上绿色区域内击杀他们。
|tip 继续使用图腾来维持绿色区域
|tip 不要杀得太快，否则能量不会被抽干。
从被烈焰腐化的根护者生物身上抽取能量 |q 77711/1 |goto 63.24,53.48
step
talk Professor Ash##209571
turnin And a Pinch of Magic##77711 |goto 48.69,68.06
step
等待植物生长 |complete not completedq(77717) or completedq(77762)
|tip 再过五天后再来照顾幼苗。
step
talk Professor Ash##209571
accept A Little Hope is Never without Worth##77762 |goto 48.69,68.06
step
talk Professor Ash##209571
turnin A Little Hope is Never without Worth##77762 |goto 48.69,68.06
step
use the Reins of the Ochre Dreamtalon##210774
学习坐骑：赭色梦爪 |learnmount Ochre Dreamtalon##427041
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Quest Mounts\\Otto",{
author="support@zygorguides.com",
description="Relax. The future will unfold as it was meant to, one way or an otter.",
mounts={376873},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
talk Toklo##185359
训练钓鱼 |skillmax Fishing,300 |goto Valdrakken/0 44.84,74.72
step
talk Toklo##185359
训练巨龙群岛钓鱼 |skillmax Dragon Isles Fishing,100 |goto 44.84,74.72
step
cast Fishing##131474
collect Rusted Coin of the Isles##202105 |q 72729 |future
|tip 使用巨龙群岛钓鱼技能，可以在巨龙群岛的任意地方钓到这个。
step
talk The Great Swog##191608
turnin The Great Swog##72729 |goto Ohn'ahran Plains/0 82.31,73.21
step
collect Gold Coin of the Isles##199340 |or
|tip 这是从龙岛垂钓、打开Tuskaar Tackleboxes，或者使用Iskaaran Harpoon击杀“Lunkers”时非常罕见的掉落。
|tip 你可以用5枚群岛银币从巨鳄斯沃格那里购买群岛金币。
|tip 你可以用15个海岛铜币从大Swog那里购买海岛银币
|tip 所有的硬币可以通过钓鱼或从钓鱼奖励宝箱和体型巨大的鱼中获取
|tip 地图上的钓鱼点是与其他玩家分享巨型怪物击杀的好地方。
|tip 使用Fishing Gear Crafting声望指南来解锁达成这一目标的方法。
点击这里打开Fishing Gear Crafting声望指南 |confirm |loadguide "Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Fishing Gear Crafting"
|tip 这可能需要一些时间。
'|complete hasmount(376873) |or
step
talk The Great Swog##191608
|tip 洞穴内
buy Immaculate Sac of Swog Treasures##202102 |goto 82.31,73.21 |or
|tip 它的价格是1金币岛。
'|complete hasmount(376873) |or
step
use the Immaculate Sac of Swog Treasures##202102
collect Aquatic Shades##202042 |or
'|complete hasmount(376873) |or
step
use the Aquatic Shades##202042
获取Aquatic Shades玩具 |toy Aquatic Shades##202042
step
use the Aquatic Shades##202042
|tip 在The Bubble Bath酒吧的disco pad下水使用。
获得 Cooler Than You Buff |havebuff Cooler Than You##396358 |goto The Waking Shores/0 19.62,36.50 |or
'|complete hasmount(376873) |or
step
'|script DoEmote("Dance")
开始跳舞 |havebuff Dance, Dance 'Til You're Dead##396539 |goto 19.62,36.50 |or
|tip 你需要原地站着跳舞五分钟。
|tip 五分钟结束时，“跳舞，跳到你死”增益效果会消失，你会被传送。
|tip 如果你没有获得任务进度，离开垫子，重新使用Aquatic Shades，然后再踏上垫子。
'|complete hasmount(376873) |or
step
不间断地跳舞五分钟 |nobuff Dance, Dance 'Til You're Dead##396539 |goto 19.62,36.50
|tip 你需要原地站着跳舞五分钟。
|tip 五分钟结束后，Dance, Dance 'Til You're Dead减益效果会消失并且你会被传送
step
click Empty Fish Barrel##385001
collect Empty Fish Barrel##202061 |or
'|complete hasmount(376873) |or
step
cast Fishing##131474
|tip 在 Iskaara 周围的开放水域钓鱼。
|tip 抓这些可能需要一段时间。
collect 100 Frigid Floe Fish##202072 |goto The Azure Span/0 13.20,48.02 |or
'|complete hasmount(376873) |or
step
use the Empty Fish Barrel##202061
collect Half-Filled Fish Barrel##202066 |or
'|complete hasmount(376873) |or
step
cast Fishing##131474
|tip 从岩浆中钓鱼。
|tip 抓这些可能需要一段时间。
collect 25 Calamitous Carp##202073 |goto The Waking Shores/0 33.16,61.20 |or
'|complete hasmount(376873) |or
step
use the Half-Filled Fish Barrel##202066
collect Brimming Fish Barrel##202068 |or
'|complete hasmount(376873) |or
step
cast Fishing##131474
|tip 从阿尔盖萨学院周围的水域钓鱼。
|tip 抓这些可能需要一段时间。
collect Kingfin, the Wise Whiskerfish##202074 |goto Thaldraszus/0 57.84,44.23 |or
'|complete hasmount(376873) |or
step
use the Brimming Fish Barrel##202068
collect Overflowing Fish Barrel##202069 |or
'|complete hasmount(376873) |or
step
use the Overflowing Fish Barrel##202069
|tip 在蛇鸣洞窟的这个地点使用桶。
talk Otto##199563
|tip 使用木桶后会在这个地方出现。
accept The Way to an Otto's Heart##72738 |goto The Waking Shores/0 20.39,39.69
step
use Otto##198870
学习坐骑 Otto |learnmount Otto##376873
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Quest Mounts\\Scrappy Worldsnail",{
author="support@zygorguides.com",
description="For the Worldbreakers, a portable footstool. For you, a hardy mount.",
mounts={374162},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
完成任务《他的翼影》 |complete completedq(65691) or hasmount(374162) |or
|tip 使用完整区域升级指南完成这一关卡任务，该地区为觉醒海岸。
点击此处加载 Full Zones (Story + Side Quests) 升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
accept Allegiance to One##66419 |goto The Waking Shores/0 24.51,55.83 |or
|tip 随便你选哪个都行
|tip 你选择的将会被锁定一周。
'|learnmount Scrappy Worldsnail##374162 |or
step
talk Sabellian##185894
_Or_
talk Wrathion##187495
告诉他们我发誓支持你们当前的努力
|tip 在阳台上
|tip 你将解锁一个额外的任务，以提升你本周选择声望的阵营。
给予 Wrathion 或 Sabellian 支持 |q 66419/1 |goto 24.38,55.69 |or
'|learnmount Scrappy Worldsnail##374162 |or
step
accept Keys of Loyalty##66133 |or
accept Keys of Loyalty##66805 |or
|tip 根据您选择的阵营，您将自动接受其中一个任务
'|learnmount Scrappy Worldsnail##374162 |or
step
collect Restored Obsidian Key##191264 |n
|tip 将30块钥匙碎片和3块钥匙轮廓碎片合成为1把修复的黑曜石钥匙。
|tip 这些碎片掉落自黑曜堡的怪物和稀有怪物。
talk Igys the Believer##187275
accept Unlocking Our Past##66129 |n |repeatable
use the Obsidian Cache##200069
|tip 每次你交任务时，你都会收到一个
collect Twilight Cache##201817 |n
|tip 这有几率从宝箱中掉落。
use Twilight Cache##201817
collect Worldbreaker Membership##199215 |goto 32.28,52.49 |or
|tip 该物品是稀有掉落
|tip 你可能需要打开几个暮光宝箱才能获得这个物品。
'|learnmount Scrappy Worldsnail##374162 |or
step
_READ THE FOLLOWING STEP CAREFULLY!_
|tip 在使用该物品之前需注意重要信息。
点击此处继续 |confirm |or
'|learnmount Scrappy Worldsnail##374162 |or
step
use Worldbreaker Membership##199215
|tip 在下一步准备开始刷岩浆元素之前不要使用该物品
|tip 使用该物品后，它会被消耗，并获得The Worldbreaker头衔和Worldbreaker Membership增益，持续2天。
|tip 你可以从商人维克希尔处购买 Worldbreaker Membership 来延长你的会员期限，只要你有激活的增益效果。
|tip 如果你在2天内死亡，你将失去头衔和会员增益，还会失去收集Magmotes和与Dealer Vexil互动的能力
|tip 然后你需要从暮光宝箱中收集另一个碎界者会员卡
获得 Worldbreaker Membership 辅助效果 |havebuff Worldbreaker Membership##386848 |or
'|learnmount Scrappy Worldsnail##374162 |or
step
在黑曜王座周围杀死敌人
collect 1000 Magmote##202173 |goto 28.76,58.40 |or
|tip 不要死亡，这会移除你的增益效果并失去从怪物收集熔火精华的能力
|tip 上交修复的黑曜石钥匙给信徒伊吉斯可能会在暮光宝箱中获得岩浆粒子。
|tip 你也可以在Igys附近完成每周任务「Same as the Old Boss」以获得额外的25
'|learnmount Scrappy Worldsnail##374162 |or
step
进入洞穴 |goto 35.79,47.96 < 10 |walk
talk Dealer Vexil##193310
|tip 洞穴内
buy Slumbering Worldsnail Shell##192786 |goto 34.73,46.73
'|learnmount Scrappy Worldsnail##374162 |or
step
use Slumbering Worldsnail Shell##192786
学习Scrappy世界蜗牛坐骑 |learnmount Scrappy Worldsnail##374162
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\Azure Skitterfly",{
author="support@zygorguides.com",
description="Once Granpap Whiskers finally taught them how to take riders, the azure skitterflies proved to bond closely and loyally to their riders.",
mounts={374034},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 上交龙岛神器从宝藏和补给包获取遍布觉醒海岸
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
与龙鳞远征队达到名望等级25 |complete factionrenown(2507) >= 25 |or
|tip 完成日常任务、周常任务以及觉醒海岸的区域任务来获得声望
|tip 你也可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
'|learnmount Azure Skitterfly##374034 |or
step
talk Granpap Whiskers##187408
accept Skitterfly Riding##70821 |goto The Waking Shores/0 47.73,83.23
|tip 如果你还没有完成这个任务，请选择Azure Skitterfly。
stickystart "Collect_5_Iridescent_Plumes"
stickystart "Collect_20_Contoured_Fowlfeathers"
step
earn 750 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Azure Skitterfly##374034 |or
step
label "Collect_5_Iridescent_Plumes"
collect 5 Iridescent Plume##201401 |or
|tip 通过击杀巨龙群岛的哈比和大型飞禽获得这些物品，或从拍卖行购买。
'|learnmount Azure Skitterfly##374034 |or
step
label "Collect_20_Contoured_Fowlfeathers"
collect 20 Contoured Fowlfeather##193053 |or
|tip 在龙岛的河流和池塘附近通过击杀鸭子来获取这些，或者从拍卖行购买
'|learnmount Azure Skitterfly##374034 |or
step
talk Granpap Whiskers##187408
buy Azure Skitterfly##192762 |goto The Waking Shores/0 47.73,83.24 |or
'|learnmount Azure Skitterfly##374034 |or
step
use the Azure Skitterfly##192762
学习坐骑Azure Skitterfly |learnmount Azure Skitterfly##374034
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\Verdant Skitterfly",{
author="support@zygorguides.com",
description="Verdant skitterflies are the perfect mount for the scouts of the Dragonscale Expedition scouts, as they are fast and blend into the foliage of the Dragon Isles.",
mounts={374048},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 上交龙岛神器从宝藏和补给包获取遍布觉醒海岸
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
与龙鳞远征队达到名望等级25 |complete factionrenown(2507) >= 25 |or
|tip 完成日常任务、周常任务以及觉醒海岸的区域任务来获得声望
|tip 你也可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
'|learnmount Verdant Skitterfly##374048 |or
step
click Expedition Scout's Pack##376587+
|tip 这个物体可以在觉醒海岸，欧恩哈拉平原，碧蓝林海，索德拉苏斯和瓦德拉肯找到。
|tip 你可能需要拾取很多Expedition Scout's Pack才能找到这个坐骑
collect Verdant Skitterfly##192764 |or
|tip 这是一个稀有掉落
'|learnmount Verdant Skitterfly##374048 |or
step
use the Verdant Skitterfly##192764
学习坐骑：碧绿疾翔翅 |learnmount Verdant Skitterfly##374048
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Reputation Mounts\\Tamed Skitterfly",{
author="support@zygorguides.com",
description="It didn't take long for Grandpap Whiskers to tame the skitterflies around the Dragonscale Basecamp and set them to helping move Expedition personnel and cargo.",
mounts={374032},
mounttype='Flying',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 上交龙岛神器从宝藏和补给包获取遍布觉醒海岸
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
与龙鳞远征队达到名望等级25 |complete factionrenown(2507) >= 25 |or
|tip 完成日常任务、周常任务以及觉醒海岸的区域任务来获得声望
|tip 你也可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
'|learnmount Tamed Skitterfly##374032 |or
step
talk Granpap Whiskers##187408
accept Skitterfly Riding##70821 |goto The Waking Shores/0 47.73,83.23
|tip 选择Tamed Skitterfly如果你还没有完成这个任务
stickystart "Collect_5_Iridescent_Plumes"
stickystart "Collect_20_Contoured_Fowlfeathers"
step
earn 750 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Tamed Skitterfly##374032 |or
step
label "Collect_5_Iridescent_Plumes"
collect 5 Iridescent Plume##201401 |or
|tip 通过击杀巨龙群岛的哈比和大型飞禽获得这些物品，或从拍卖行购买。
'|learnmount Tamed Skitterfly##374032 |or
step
label "Collect_20_Contoured_Fowlfeathers"
collect 20 Contoured Fowlfeather##193053 |or
|tip 在龙岛的河流和池塘附近通过击杀鸭子来获取这些，或者从拍卖行购买
'|learnmount Tamed Skitterfly##374032 |or
step
talk Granpap Whiskers##187408
buy Tamed Skitterfly##192761 |goto The Waking Shores/0 47.73,83.24
'|learnmount Tamed Skitterfly##374032 |or
step
use the Tamed Skitterfly##192761
学习坐骑：驯化的滑翔蝇 |learnmount Tamed Skitterfly##374032
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Reputation Mounts\\Loyal Magmammoth",{
author="support@zygorguides.com",
description="Liberated from the Qalashi and harnessed by your ingenuity (and your harness) this magmammoth is ready to lava stomp wherever you want to go.",
mounts={373859},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
与拉希奥达到“挚友”声望 |complete rep("Wrathion") >= TrueFriend |or
|tip 使用 Obsidian Citadel 指南来完成这个。
|tip 在地图上点击Obsidian Citadel图标，然后点击弹出窗口载入指南
'|learnmount Loyal Magmammoth##373859 |or
step
与萨贝里安达到“挚友”声望 |complete rep("Sabellian") >= TrueFriend |or
|tip 使用 Obsidian Citadel 指南来完成这个。
|tip 在地图上点击Obsidian Citadel图标，然后点击弹出窗口载入指南
'|learnmount Loyal Magmammoth##373859 |or
step
talk Lorena Belle##188625
buy Sturdy Obsidian Glasses##201840 |goto The Waking Shores/0 25.16,55.80 |or
|tip 这些需要800金币。
'|learnmount Loyal Magmammoth##373859 |or
step
talk Samia Inkling##188623
buy Netherforged Lavaproof Boots##201839 |goto 24.69,56.78 |or
|tip 这些需要800金币。
'|learnmount Loyal Magmammoth##373859 |or
step
talk Yries Lightfingers##191135
buy Magmammoth Harness##201837 |goto 26.43,55.44 |or
|tip 他是一个男性德莱尼在顶层阳台上
'|learnmount Loyal Magmammoth##373859 |or
step
clicknpc Tame Magmammoth##198150
驾驭驯服的熔岩猛犸象 |invehicle |goto 33.43,72.08 |or
你也可以在周围找到他们：
[23.66,71.44]
[37.10,44.52]
'|learnmount Loyal Magmammoth##373859 |or
step
use the Magmammoth Harness##201837
学习坐骑忠诚的熔岩猛犸 |learnmount Loyal Magmammoth##373859
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Brown Scouting Ottuk",{
author="support@zygorguides.com",
description="Wily and playful in their natural habitat, ottuks possess keen eyes that can scout far afield as ably as they watch for predators.",
mounts={376875},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
|tip 使用升级指南来完成这个任务。
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 建筑物内部
|tip 上交从碧蓝林海宝藏中获得的被盗图腾以换取声望
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
提升与伊斯卡拉巨牙海民的声望等级至25级 |complete factionrenown(2511) >= 25 |or
|tip 完成日常任务、每周任务和The Azure Span的区域任务以获得声望。
'|learnmount Brown Scouting Ottuk##376875 |or
stickystart "Collect_2_Aquatic_Maws"
stickystart "Collect_2_Mastodon_Tusks"
step
earn 750 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Brown Scouting Ottuk##376875 |or
step
label "Collect_2_Aquatic_Maws"
collect 2 Aquatic Maw##201400 |or
|tip 通过击杀和掠夺龙岛本地的大鱼来获取这些物品，或者从拍卖行购买。
'|learnmount Brown Scouting Ottuk##376875 |or
step
label "Collect_2_Mastodon_Tusks"
collect 2 Mastodon Tusk##201403 |or
|tip 通过击杀和掠夺巨龙群岛上的大象型野兽获取这些物品，或者从拍卖行购买。
'|learnmount Brown Scouting Ottuk##376875 |or
step
talk Tatto##186462
buy Brown Scouting Ottuk##198872 |goto The Azure Span/0 13.80,49.73 |or
'|learnmount Brown Scouting Ottuk##376875 |or
step
use the Brown Scouting Ottuk##198872
学习坐骑 棕色侦察奥图克 |learnmount Brown Scouting Ottuk##376875
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Brown War Ottuk",{
author="support@zygorguides.com",
description="The tuskarr of Iskaara are loathe to war against anyone, but many tuskarr and their allies have nonetheless taken up the spear with a war ottuk beside them.",
mounts={376910},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 建筑物内部
|tip 上交从碧蓝林海宝藏中获得的被盗图腾以换取声望
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
提升与伊斯卡拉塔斯卡尔的声望等级至30级 |complete factionrenown(2511) >= 30 |or
|tip 完成日常任务、每周任务和The Azure Span的区域任务以获得声望。
'|learnmount Brown War Ottuk##376910 |or
stickystart "Collect_5_Aquatic_Maws"
stickystart "Collect_5_Mastodon_Tusks"
step
earn 1000 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Brown War Ottuk##376910 |or
step
label "Collect_5_Aquatic_Maws"
collect 5 Aquatic Maw##201400 |or
|tip 通过击杀和掠夺龙岛本地的大鱼来获取这些物品，或者从拍卖行购买。
'|learnmount Brown War Ottuk##376910 |or
step
label "Collect_5_Mastodon_Tusks"
collect 5 Mastodon Tusk##201403 |or
|tip 通过击杀和掠夺巨龙群岛上的大象型野兽获取这些物品，或者从拍卖行购买。
'|learnmount Brown War Ottuk##376910 |or
step
talk Tatto##186462
buy Brown War Ottuk##201426 |goto The Azure Span/0 13.80,49.73 |or
'|learnmount Brown War Ottuk##376910 |or
step
use the Brown War Ottuk##201426
学习「Brown War Ottuk」坐骑 |learnmount Brown War Ottuk##376910
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Morsel Sniffer",{
author="support@zygorguides.com",
description="A breed of shalewings trained by the niffen to find the deepest of morsels.",
mounts={408655},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='101000',
},[[
step
提升挖掘匠诺芬声望至18级 |complete factionrenown(2564) >= 18 |or
'|complete hasmount(408655) |or
step
earn 800 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|complete hasmount(408655) |or
step
talk Harlowe Marl <Loamm Niffen Quartermaster>##202468
buy Morsel Sniffer Reins##205207 |goto Zaralek Cavern/0 56.40,55.60 |or
'|complete hasmount(408655) |or
step
use Morsel Sniffer Reins##205207
学习坐骑 Morsel Sniffer |learnmount Morsel Sniffer##408655
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Yellow Scouting Ottuk",{
author="support@zygorguides.com",
description="The yellow scouting ottuk love to hide and they blend in well to their surroundings. When not 'playing' hide and seek with their riders, they are perfect companions when scouting enemy encampments.",
mounts={376880},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 建筑物内部
|tip 上交从碧蓝林海宝藏中获得的被盗图腾以换取声望
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
提升与伊斯卡拉巨牙海民的声望等级至25级 |complete factionrenown(2511) >= 25 |or
|tip 完成日常任务、每周任务和The Azure Span的区域任务以获得声望。
'|learnmount Yellow Scouting Ottuk##376880 |or
stickystart "Collect_2_Aquatic_Maws"
stickystart "Collect_2_Mastodon_Tusks"
step
earn 750 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Yellow Scouting Ottuk##376880 |or
step
label "Collect_2_Aquatic_Maws"
collect 2 Aquatic Maw##201400 |or
|tip 通过击杀和掠夺龙岛上的大型鱼类获得这些物品，或者从拍卖行购买。
'|learnmount Yellow Scouting Ottuk##376880 |or
step
label "Collect_2_Mastodon_Tusks"
collect 2 Mastodon Tusk##201403 |or
|tip 通过击杀和掠夺巨龙群岛上的任何象类野兽来获取这些，或者在拍卖行购买他们
'|learnmount Yellow Scouting Ottuk##376880 |or
step
talk Tatto##186462
buy Yellow Scouting Ottuk##200118 |goto The Azure Span/0 13.80,49.73 |or
'|learnmount Yellow Scouting Ottuk##376880 |or
step
use the Yellow Scouting Ottuk##200118
学习黄色侦察奥图克坐骑 |learnmount Yellow Scouting Ottuk##376880
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Yellow War Ottuk",{
author="support@zygorguides.com",
description="The yellow ottuks of the Azure Span are sleek, sneaky, and smart. Those trained for war are the finest tuskarr cavalry mounts, equally capable on the ground and in the waters.",
mounts={376913},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 建筑物内部
|tip 上交从碧蓝林海宝藏中获得的被盗图腾以换取声望
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
提升与伊斯卡拉塔斯卡尔的声望等级至30级 |complete factionrenown(2511) >= 30 |or
|tip 完成日常任务、每周任务和The Azure Span的区域任务以获得声望。
'|learnmount Yellow War Ottuk##201425 |or
stickystart "Collect_5_Aquatic_Maws"
stickystart "Collect_5_Mastodon_Tusks"
step
earn 1000 Dragon Isles Supplies##2003 |or
|tip 通过完成任务和世界任务、击杀稀有怪、进行地下城以及打开宝箱、袋子和宝藏等消耗品获得这些。
'|learnmount Yellow War Ottuk##201425 |or
step
label "Collect_5_Aquatic_Maws"
collect 5 Aquatic Maw##201400 |or
|tip 通过击杀和掠夺龙岛上的大型鱼类获得这些物品，或者从拍卖行购买。
'|learnmount Yellow War Ottuk##201425 |or
step
label "Collect_5_Mastodon_Tusks"
collect 5 Mastodon Tusk##201403 |or
|tip 通过击杀和掠夺巨龙群岛上的任何象类野兽来获取这些，或者在拍卖行购买他们
'|learnmount Yellow War Ottuk##201425 |or
step
talk Tatto##186462
buy Yellow War Ottuk##201425 |goto The Azure Span/0 13.80,49.73 |or
'|learnmount Yellow War Ottuk##201425 |or
step
use the Yellow War Ottuk##201425
学习 Yellow War Ottuk 坐骑 |learnmount Yellow War Ottuk##376913
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Ivory Trader's Ottuk",{
author="support@zygorguides.com",
description="No adult knows why some ottuks are white, but any tuskarr child can tell you: it's because they eat too much snow.",
mounts={376879},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
kill The Raging Tempest##186615
|tip 组建一个队伍并进入地下城或通过地下城查找器排队。
|tip 这是地下城的第二个Boss。
|tip 你可能需要多次击杀这个boss来获取这枚戒指。
collect Thunderous Downburst Ring##193696 |goto The Nokhud Offensive/0 53.13,76.83 |or
'|learnmount Ivory Trader's Ottuk##376879 |or
step
kill Leymor##186644
|tip 组建一个队伍并进入地下城或通过地下城查找器排队。
|tip 这是在地下城中的1号首领
|tip 你可能需要多次击杀这个boss来获取这枚戒指。
collect Unstable Arcane Loop##193633 |goto The Azure Vault/4 37.11,54.16 |or
'|learnmount Ivory Trader's Ottuk##376879 |or
step
talk Kalecgos##187676
|tip 在塔顶
accept The Algeth'ar Academy##72193 |goto Valdrakken/0 61.69,36.03
|only if level >= 70 and not (itemcount(193708) >= 1 and hasmount(376879))
step
kill Echo of Doragosa##190609 |q 72193/1 |goto Algeth'ar Academy/0 61.38,60.62
|only if level >= 70 and not (itemcount(193708) >= 1 and hasmount(376879))
step
_Choose the Platinum Star Band Quest Reward!_
|tip 你需要这个物品来购买这个坐骑。
|tip 你也可以从第一关BOSS那里刷，如果这次没掉落的话，如果你想要另一个任务奖励。
talk Kalecgos##187676
|tip 在塔顶
turnin The Algeth'ar Academy##72193 |goto Valdrakken/0 61.69,36.03
|only if level >= 70 and not (itemcount(193708) >= 1 and hasmount(376879))
step
kill Vexamus##194181
|tip 组建一个队伍并进入地下城或通过地下城查找器排队。
|tip 这是在地下城中的1号首领
|tip 你可能需要多次击杀这个boss来获取这枚戒指。
|tip 你可能可以通过完成阿尔格萨学院任务获得这个戒指作为奖励
collect Platinum Star Band##193708 |goto Algeth'ar Academy/1 30.42,35.51 |or
'|learnmount Ivory Trader's Ottuk##376879 |or
step
talk Tattukiaka##199448
|tip 她收下你收集的戒指并交换这坐骑
|tip 购买坐骑后戒指消失
buy Ivory Trader's Ottuk##198873 |goto The Azure Span/0 14.03,49.71 |or
'|learnmount Ivory Trader's Ottuk##376879 |or
step
use the Ivory Trader's Ottuk##198873
学习象牙商贩的奥特克坐骑 |learnmount Ivory Trader's Ottuk##376879
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Iskaara Trader's Ottuk",{
author="support@zygorguides.com",
description="No adult knows why some ottuks are white, but any tuskarr child can tell you: it's because they eat too much snow.",
mounts={376879},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
kill Terros##190496
|tip 组队进入团队副本或在团队查找器排队
|tip 这是团队副本中的第2个首领
|tip 你可能需要杀死这个首领好几次来获取这条项链
|tip 你也可以在时光漫游宝箱中获得这个项链，或者作为Great Vault奖励获得。
collect Terros's Captive Core##195502 |goto Vault of the Incarnates/2 21.62,75.78 |or
'|learnmount Iskaara Trader's Ottuk##376879 |or
step
kill Dathea, Ascended##189813
|tip 组队进入团队副本或在团队查找器排队
|tip 这是团队副本中的第5个首领
|tip 你可能需要杀死这个首领好几次来获取这条项链
collect Eye of the Vengeful Hurricane##195496 |goto Vault of the Incarnates/6 55.93,51.33 |or
'|learnmount Iskaara Trader's Ottuk##376879 |or
step
talk Tattukiaka##199448
|tip 她用你收集的项链来交换这坐骑。
|tip 项链在购买坐骑后丢失了。
buy Iskaara Trader's Ottuk##198873 |goto The Azure Span/0 14.03,49.71 |or
'|learnmount Iskaara Trader's Ottuk##376879 |or
step
use the Iskaara Trader's Ottuk##198873
学习乘骑伊斯卡拉商人海獭 |learnmount Iskaara Trader's Ottuk##376879
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Perfected Juggernaut",{
author="support@zygorguides.com",
description="Perfection, like beauty, is in the eye of the beholder. But eyesight can be surgically enhanced.",
mounts={414328},
mounttype='Ground',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
获得 #3000# 超因果薄片 |earn 3000 Paracausal Flakes##2594 |or
|tip 通过完成时光裂隙来获取这些
|tip 使用Time Rifts指南来完成这个
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Gill the Drill##208342
buy 1 Perfected Juggernaut##206679 |goto Thaldraszus/0 50.99,56.70 |or
'|learnmount Perfected Juggernaut##414328 |or
step
use the Perfected Juggernaut##206679
学习坐骑 完美巨兽 |learnmount Perfected Juggernaut##414328
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\Sulfur Hound",{
author="support@zygorguides.com",
description="The Black Empire subjugated these humbled and hateful hounds. Utterly obedient, they still serve the strong.",
mounts={414327},
mounttype='Ground',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
获得 #3000# 超因果薄片 |earn 3000 Paracausal Flakes##2594 |or
|tip 通过完成时光裂隙来获取这些
|tip 使用Time Rifts指南来完成这个
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Provisioner Qorra##208347
buy 1 Sulfur Hound's Leash##206678 |goto Thaldraszus/0 51.06,56.70 |or
'|learnmount Sulfur Hound##414327 |or
step
use the Sulfur Hound's Leash##206678
学习Sulfur Hound坐骑 |learnmount Sulfur Hound##414327
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Vendor Mounts\\Scourgebound Vanquisher",{
author="support@zygorguides.com",
description="Once bound in service to the Scourge, these undead dragons exist only to spread death, disease, and destruction.",
mounts={414334},
mounttype='Flying',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
获得 #3000# 超因果薄片 |earn 3000 Paracausal Flakes##2594 |or
|tip 通过完成时光裂隙来获取这些
|tip 使用Time Rifts指南来完成这个
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Baron Sliver##208338
buy 1 Reigns of the Scourgebound Vanquisher##206680 |goto Thaldraszus/0 51.00,56.65 |or
'|learnmount Scourgebound Vanquisher##414334 |or
step
use the Reigns of the Scourgebound Vanquisher##206680
学习Scourgebound Vanquisher坐骑 |learnmount Scourgebound Vanquisher##414334
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Vendor Mounts\\Felstorm Dragon",{
author="support@zygorguides.com",
description="The Burning Legion defeated dragons in a distant timeway. These foul fel wyrms chose corruption and servitude over destruction.",
mounts={414326},
mounttype='Flying',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
获得 #3000# 超因果薄片 |earn 3000 Paracausal Flakes##2594 |or
|tip 通过完成时光裂隙来获取这些
|tip 使用Time Rifts指南来完成这个
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Falara Nightsong##208341
buy 1 Felstorm Dragon##206676 |goto Thaldraszus/0 51.05,56.72 |or
'|learnmount Felstorm Dragon##414326 |or
step
use the Felstorm Dragon##206676
学习Felstorm Dragon坐骑 |learnmount Felstorm Dragon##414326
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Vendor Mounts\\Gold-Toed Albatross",{
author="support@zygorguides.com",
description="Soaring from a distant timeway, this never-before-seen avian variant was born in a world of order",
mounts={414324},
mounttype='Flying',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
获得 #3000# 超因果薄片 |earn 3000 Paracausal Flakes##2594 |or
|tip 通过完成时光裂隙来获取这些
|tip 使用Time Rifts指南来完成这个
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Sorotis##208343
buy 1 Gold-Toed Albatross##206675 |goto Thaldraszus/0 51.09,56.58 |or
'|learnmount Gold-Toed Albatross##414324 |or
step
use the Gold-Toed Albatross##206675
学习坐骑金翅海鹦 |learnmount Gold-Toed Albatross##414324
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\World Event Mounts\\Plainswalker Bearer",{
author="support@zygorguides.com",
description="The mammoths of the Ohn'ahran Plains are unaccustomed to carrying people, as their centaur neighbors do not typically ride mounts. They can learn to bear riders, however. Some even do so enthusiastically.",
mounts={374196},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
达到70级 |ding 70
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 上交大狩猎所得的狩猎战利品获取声望
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
提升玛鲁克半人马的名望等级至5级 |complete factionrenown(2503) >= 5 |or
|tip 完成日常任务、每周任务和欧恩哈拉平原区域任务来获得名望
'|learnmount Plainswalker Bearer##374196 |or
step
collect Grand Hunt Spoils##200468 |n
|tip 使用各种Grand Hunt指南找到一个Grand Hunt并每周完成你的第一次。
|tip 此坐骑仅从本周第一次史诗版本的大狩猎战利品中掉落
|tip 你可以从当前所在区域地图上点击大型狩猎图标，然后点击弹出窗口加载指南
use Grand Hunt Spoils##200468
collect Plainswalker Bearer##192791 |or
|tip 这是每周第一次大型狩猎战利品中才有的稀有掉落
|tip 你可能需要下周再试一次才能获得这个物品
'|learnmount Plainswalker Bearer##374196 |or
step
use the Plainswalker Bearer##192791
学习坐骑Plainswalker Bearer |learnmount Plainswalker Bearer##374196
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\World Event Mounts\\Stormhide Salamanther",{
author="support@zygorguides.com",
description="Sometimes when storm energies infuse a creature, it simply... becomes larger and more placid. Few salamanthers are willing to be ridden, but these children of the storm are a notable exception.",
mounts={374098},
mounttype='Ground',
startlevel=60,
keywords={"Dragonflight"},
patch='100002',
},[[
step
earn 2000 Elemental Overflow##2118 |or
|tip 击杀4个活动区域中的怪物获取这些物品在一次"元素风暴"期间
|tip 你也可以通过参加原始入侵来获得这些
|tip 你可以在游戏中的龙岛地图上找到这些区域
'|learnmount Stormhide Salamanther##374098 |or
step
talk Mythressa##196516
|tip 建筑物内部
buy Stormhide Salamanther##192775 |goto Valdrakken/0 38.10,37.73 |or
'|learnmount Stormhide Salamanther##374098 |or
step
use the Stormhide Salamanther##192775
学习坐骑风暴皮蜥蜴 |learnmount Stormhide Salamanther##374098
]])
