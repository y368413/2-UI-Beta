local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("PetsCDRAGON") then return end
if not ZGV.CommonPets then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Polliswog",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These critters often leave their spawning groups as soon as they can move around on land.",
keywords={"Aquatic"},
pet=3404,
},[[
step
clicknpc Polliswog##197637
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习 Polliswog 战斗宠物 |learnpet Polliswog##3404 |goto Thaldraszus/0 53.48,41.74
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Chalkshell Turtle",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Despite its name, its shell is actually much tougher than chalk.",
keywords={"Aquatic"},
pet=3356,
},[[
step
talk Lani##199255
告诉她 “我要一些乌龟饵”
获得“海龟诱饵”Buff |complete hasbuff(396095) or haspet(3356) |goto The Azure Span/0 10.77,48.02
step
extraaction Use Turtle Bait##396095
|tip 一只粉贝乌龟会出现在你旁边的海滩上。
召唤白垩壳龟 |complete not hasbuff(396095) or haspet(3356) |goto The Azure Span/0 10.77,48.02
step
clicknpc Chalkshell Turtle##192260
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
|tip 你可以重复这些步骤来对抗另外一只粉甲龟
学习“粉壳龟”战斗宠物 |learnpet Chalkshell Turtle##3356 |goto The Azure Span/0 10.82,48.01
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Palamanther",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="This salamanther wants to be your best friend.",
keywords={"Aquatic"},
pet=3296,
},[[
step
clicknpc Palamanther##189122
|tip 这只野生宠物通常出现在水源附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Palamanther战斗宠物 |learnpet Palamanther##3296 |goto The Waking Shores/0 69.19,43.18
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Scruffy Ottuk",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Between battling, bathing, and playing, these ottuks have very busy schedules.",
keywords={"Aquatic"},
pet=3281,
},[[
step
clicknpc Scruffy Ottuk##189103
|tip 这只野生宠物通常出现在水源附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习战斗宠物Scruffy Ottuk |learnpet Scruffy Ottuk##3281 |goto The Waking Shores/0 47.79,29.67
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Stoneshell",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These creatures' shells are not literally made of stone, but they're strong enough that they might as well be.",
keywords={"Aquatic"},
pet=3353,
},[[
step
clicknpc Stoneshell##192254
|tip 这只野生宠物通常出现在水源附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习战斗宠物石壳 |learnpet Stoneshell##3353 |goto Ohn'ahran Plains/0 72.25,28.03
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Storm-Touched Ottuk",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="A playful splash from this otter will give you quite a shock.",
keywords={"Aquatic"},
pet=3354,
},[[
step
clicknpc Storm-Touched Ottuk##192256
|tip 此宠物仅在元素风暴事件期间刷新
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习风暴之触奥图克宠物 |learnpet Storm-Touched Ottuk##3354 |goto The Azure Span/0 14.80,34.40
你也可以在元素风暴期间找到这些：
[15.80,35.80]
[44.20,32.20]
[60.20,66.20]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Swoglet",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="The reverberating sound of an adult hornswog's belch can be heard for leagues. Less far-reaching, but far more musical, is the dainty sound of a swoglet belching.",
keywords={"Aquatic"},
pet=3282,
},[[
step
clicknpc Swoglet##189104
|tip 这只野生宠物通常出现在水源附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Swoglet战斗宠物 |learnpet Swoglet##3282 |goto The Azure Span/0 12.51,44.72
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Wild Duckling",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Quack.",
keywords={"Aquatic"},
pet=3301,
},[[
step
clicknpc Wild Duckling##189136
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习野鸭宝宝战斗宠物 |learnpet Wild Duckling##3301 |goto Valdrakken/0 60.62,57.39
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Azure Frillfish",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Oddly enough, you met this fish drifting through the air.",
keywords={"Aquatic"},
pet=3269,
},[[
step
talk Cataloger Jakes##189226
|tip 帐篷内
|tip 在觉醒海岸各处的宝箱和补给包中上交龙岛神器。
'|turnin Multiple Dragon Isles Artifacts##72876 |n
'|turnin Multiple Dragon Isles Artifacts##71035 |n
'|turnin Dragon Isles Artifacts##71034 |n
提升龙鳞探险队的声望等级至5级 |complete factionrenown(2507) >= 5 or haspet(3269) |goto The Waking Shores/0 47.11,82.58
|tip 在觉醒海岸完成日常任务、周常任务和区域任务以获取名望
|tip 您还可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
step
talk Cataloger Jakes##189226
|tip 帐篷内
buy Small Expedition Shovel##191294 |goto The Waking Shores/0 47.11,82.58 |or
'|complete haspet(3269) |or
step
拾取扰动的泥土或探险队斥候背包
|tip 这些可以在巨龙群岛的任何地方找到
collect A Guide to Rare Fish##199061 |or
'|complete haspet(3269) |or
step
use A Guide to Rare Fish##199061
使用稀有鱼指南 |complete completedq(70527) or haspet(3269)
step
click Fragrant Plant##381399
获得“芳香植物气息”增益 |complete hasbuff(388331) or haspet(3269) |goto The Waking Shores/0 40.93,41.46
step
clicknpc Bubble Drifter##195939
|tip 看起来像是一条小鱼在这个区域的水里绕圈游泳
collect Azure Frillfish##193852 |goto The Waking Shores/0 40.27,41.33 |or
'|complete haspet(3269) |or
step
use the Azure Frillfish##193852
学习“Azure Frillfish”战斗宠物 |learnpet Azure Frillfish##3269
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Roseate Hopper",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Most brightly colored frogs are incredibly poisonous. The Roseate Hoppers are different because they are only credibly poisonous.",
keywords={"Aquatic"},
pet=3365,
},[[
step
click Marmoni's Prize##381483
|tip 这个开放的箱子在这里的一堆箱子上。
collect Marmoni's Prize##200064 |goto The Waking Shores/0 47.72,83.60 |or
'|complete haspet(3365) |or
step
click Adventurer's Lost Soap Bar##381485
|tip 水桶里的Inside the barrel of water。
collect Adventurer's Lost Soap Bar##200065 |goto 39.64,84.68 |or
'|complete haspet(3365) |or
step
click Well-Preserved Bone##381484
|tip 在塔顶
collect Well-Preserved Bone##200066 |goto 66.17,55.29 |or
'|complete haspet(3365) |or
step
use Marmoni's Prize##200064
|tip 这会将它们结合成一个美味佳肴给Possessive Hornswog。
|tip 你需要在这个位置才能将它们合成
collect Observant Riddle 'Treat'##200063 |goto 64.50,69.33 |or
'|complete haspet(3365) |or
step
use the Observant Riddle 'Treat'##200063
|tip 将circle目标放在Protective Hornswog上
把糖果扔向保护者角蜥 |complete completedq(70864) or haspet(3365)
step
click Hidden Hornswog Hostage##377899
|tip 洞穴内部
collect Roseate Hopper##199916 |goto 64.95,69.61 |or
'|complete haspet(3365) |or
step
use Roseate Hopper##199916
|tip 这个物品将会在你的背包中。
学习玫粉小跳蛙战斗宠物 |learnpet Roseate Hopper##3365
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Bugbiter Tortoise",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This turtle eats bugs, as you'd expect from its name, but you wouldn't believe how large the bugs are.",
keywords={"Aquatic"},
pet=3360,
},[[
step
完成"巨龙群岛博学者"成就 |complete achieved(16585) or haspet(3360)
|tip 你必须解锁世界任务才能接触到这个宠物的商贩。
|tip 使用 完整区域（故事+支线任务） 来完成此事。
|tip 这只宠物也可以在拍卖行购买。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
step
达到70级 |ding 70 |or
'|complete haspet(3360) |or
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 在觉醒海岸各处的宝箱和补给包中上交龙岛神器。
'|turnin Multiple Dragon Isles Artifacts##72876 |n
'|turnin Multiple Dragon Isles Artifacts##71035 |n
'|turnin Dragon Isles Artifacts##71034 |n
与龙鳞远征队达到名望等级6 |complete factionrenown(2507) >= 6 or haspet(3360)
|tip 在觉醒海岸完成日常任务、周常任务和区域任务以获取名望
|tip 您还可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
step
click Petrified Dragon Egg##385021
|tip 它看起来像一个多刺的黑暗龙蛋
|tip 这个可以在觉醒海岸的洞穴中找到
collect Petrified Dragon Egg##202082 |or
你可以在以下地点找到洞穴入口:
[32.80,73.62]
[36.12,89.79]
[36.18,83.93]
[22.58,95.12]
[24.60,94.96]
[36.11,89.83]
[40.93,93.37]
[23.25,90.91]
[25.64,95.90]
[36.06,91.97]
'|complete haspet(3360) |or
step
click Eroded Fossil##385022
|tip 它看起来像一具恐龙的颅骨
|tip 这个可以在瀑布下的水中找到
collect Eroded Fossil##202084 |goto The Waking Shores/0 21.56,92.14 |or
亦可于以下地点找到：
[26.07,94.56]
[24.70,91.10]
[21.77,94.47]
[23.34,94.20]
[21.70,92.12]
[21.78,94.50]
[22.06,95.66]
[23.05,95.46]
[23.38,96.73]
'|complete haspet(3360) |or
step
等待"Brightblade's Bones"世界任务 |complete questactive(66070) or haspet(3360)
|tip 当这个世界任务激活时，你需要交谈的NPC才会出现。
|tip 世界任务每周重置两次。
step
talk Cymre Brightblade##187077
告诉她_"我准备好交易了."_
|tip 仅在任务“Brightblade's Bones”世界任务激活时，她才会出现。
collect Bugbiter Tortoise##202085 |goto The Waking Shores/0 22.80,95.11 |or
'|complete haspet(3360) |or
step
use the Bugbiter Tortoise##202085
学习Bugbiter Tortoise战斗宠物 |learnpet Bugbiter Tortoise##3360
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Pilot",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Still learning how to fly.",
keywords={"Aquatic"},
pet=3302,
},[[
step
达到62级 |ding 62 |or
'|complete haspet(3302) |or
step
talk Gracus##186503
|tip 他看起来像一棵巨大的树。
|tip 他在这个区域巡逻。
accept Some Call Me Bug Catcher##70062 |goto Ohn'ahran Plains/0 29.91,58.42
step
kill Flyspawn Beetle##193996+
|tip 它们看起来像昆虫在这个区域的空中飞舞。
收集#6#飞蛾甲虫零件 |q 70062/1 |goto 29.73,58.08
step
talk Gracus##186503
|tip 他看起来像一棵巨大的树。
|tip 他在这个区域巡逻。
turnin Some Call Me Bug Catcher##70062 |goto 29.91,58.42
accept Others Call Me Duck Herder##70069 |goto 29.91,58.42
step
click Duck+
|tip 它们看起来像小鸟，有各种不同的名字。
|tip 他们在这片区域巡逻。
喂养#4#小鸭 |q 70069/1 |goto 30.96,56.14
step
talk Gracus##186503
|tip 他看起来像一棵巨大的树。
|tip 他在这个区域巡逻。
turnin Others Call Me Duck Herder##70069 |goto 29.91,58.42
accept But... I Am the Hero of Ducks##70070 |goto 29.91,58.42
step
寻找火焰炮羊 |q 70070/1 |goto 27.19,56.43
step
kill Queasy Hornswog##194003
|tip 它看起来像一只大灰色的带角青蛙。
|tip 把它的血量削减到20%，然后它会呕吐。
让恶心的霍恩斯沃格呕吐 |q 70070/2 |goto 27.19,56.43
step
talk Gracus##186503
|tip 他看起来像一棵巨大的树。
|tip 他在这个区域巡逻。
turnin But... I Am the Hero of Ducks##70070
step
use Pilot##193484
学习Pilot战斗宠物 |learnpet Pilot##3302
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Mallard Duckling",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="What do you feed a cute little duckling? What? No, not cheese and quackers! Quackers aren't healthy for ducks.",
keywords={"Aquatic","Pakak"},
pet=3303,
},[[
step
collect 1 Braised Bruffalon Brisket##197788 |or
|tip 使用巨龙群岛烹饪制造，或从拍卖行购买。
|tip 需要1个艾勒隆海蛾，4个野牛肋排，和1个异域香料组合来制作。
'|complete haspet(3303) |or
step
collect 1 Riverside Picnic##197789 |or
|tip 使用巨龙群岛烹饪制造，或从拍卖行购买。
|tip 这需要1根碧蓝脊刺鱼，4块粗壮熊肉和1包异域香料才能制作。
'|complete haspet(3303) |or
step
collect 3 Fated Fortune Cookie##197792 |or
|tip 使用巨龙群岛烹饪制造，或从拍卖行购买。
|tip 每一个需要1张命运卡牌，3份索德拉苏可可粉，和5份糕点包来制作
'|complete haspet(3303) |or
step
talk Pakak##187783
|tip 他在这个区域巡逻。
buy Mallard Duckling##193571 |goto Valdrakken/0 43.98,74.87 |or
'|complete haspet(3303) |or
step
use the Mallard Duckling##193571
学习 Mallard Duckling 战斗宠物 |learnpet Mallard Duckling##3303
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Jean's Lucky Fish",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="Jean's Lucky Fish was the pick of the yard when he went to go get a new pet. The swift and clean way he reached into the pond to grab hold of the fish and put it into a magic bubble became known as the Pick Yard maneuver.",
keywords={"Aquatic","Iskaara Tuskarr","Patchu"},
pet=3270,
},[[
step
collect 300 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3270) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Jean's Lucky Fish##192459 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3270) |or
step
use Jean's Lucky Fish##192459
学习Jean's Lucky Fish宠物 |learnpet Jean's Lucky Fish##3270
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Quack-E",{
patch='100005',
source='Crafted',
author="support@zygorguides.com",
description="Beep. Beep. Beep. Quack.",
keywords={"Aquatic","Crafted","Engineering"},
pet=3306,
},[[
step
collect Quack-E##193572 |or
|tip 这个可以使用巨龙群岛工程学在技能50制作
|tip 你也可以从拍卖行购买。
'|complete haspet(3306) |or
step
use Quack-E##193572
学习Quack-E战斗宠物 |learnpet Quack-E##3306
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Secretive Frogduck",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="It looks like a duck and it smells like a duck and it quacks like a duck... what's a duck?",
keywords={"Aquatic","Achievement"},
pet=3263,
},[[
step
完成 "Proven Pet Parent" 成就 |achieve 15642 |or
|tip 收集1400只独特的宠物。
'|complete haspet(3263) |or
step
学习秘密鸭蛙战斗宠物 |learnpet Secretive Frogduck##3263
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Dusky Timbertooth",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Hunters value these critters more for their companionship than their pelts.",
keywords={"Beast"},
pet=3327,
},[[
step
clicknpc Dusky Timbertooth##189657
|tip 河湾啃咬者需要在这个战斗宠物变为活动状态之前建造可点击的海狸坝
|tip 巨大的白桦树上会有小枝丫。
|tip 等到有4-5堆小树枝可以清理时，似乎是宠物刷新的最佳机会
|tip 当你可以点击海狸坝的木棍时，你可以选择击杀或避开河岸撕咬者
|tip 点击树枝一根一根地清理掉。
|tip 在点击树枝或者与Riverbend Chompers战斗时，不要意外杀死战斗宠物。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Dusky Timbertooth战斗宠物 |learnpet Dusky Timbertooth##3327 |goto Ohn'ahran Plains/0 71.66,74.18
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Grassland Stomper",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Each of this creature's steps shakes the ground. When enough of them run together it sounds like a raging thunderstorm.",
keywords={"Beast"},
pet=3313,
},[[
step
clicknpc Grassland Stomper##189153
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习草原践踏者战斗宠物 |learnpet Grassland Stomper##3313 |goto Ohn'ahran Plains/0 55.42,49.01
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Grizzlefur Cub",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These small bears will not normally attack people, but they have been known to steal the occasional picnic basket.",
keywords={"Beast"},
pet=3351,
},[[
step
clicknpc Grizzlefur Cub##194720
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Grizzlefur Cub战斗宠物 |learnpet Grizzlefur Cub##3351 |goto The Azure Span/0 42.97,38.41
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Storm-Touched Stomper",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="This what your mother always warned you would happen if you ate grass that was struck by lightning.",
keywords={"Beast"},
pet=3385,
},[[
step
clicknpc Storm-Touched Stomper##192029
|tip 此宠物仅在元素风暴事件期间刷新
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习暴风触摸践踏者战斗宠物 |learnpet Storm-Touched Stomper##3385 |goto The Waking Shores/0 63.86,29.95
你也可以在元素风暴期间找到这些：
[32.00,51.40]
[30.20,57.20]
[30.60,69.60]
[27.00,73.80]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Storm-Touched Timbertooth",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="A timbertooth with lighting inside? Shocking!",
keywords={"Beast"},
pet=3329,
},[[
step
clicknpc Storm-Touched Timbertooth##189660
|tip 此宠物仅在元素风暴事件期间刷新
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习风暴触碰的木牙配战宠 |learnpet Storm-Touched Timbertooth##3329 |goto Ohn'ahran Plains/0 35.60,34.80
你也可以在元素风暴期间找到这些：
[35.80,42.80]
[32.60,39.60]
[34.60,44.60]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Thunderfoot Calf",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="When these creatures stampede, they sound like a thunderstorm. When these creatures stampede in a thunderstorm, they sound like a cataclysm.",
keywords={"Beast"},
pet=3318,
},[[
step
clicknpc Thunderfoot Calf##189155
|tip 洞穴内部
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习 雷霆蹄小牛 战斗宠物 |learnpet Thunderfoot Calf##3318 |goto The Waking Shores/0 45.82,35.26
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Tiny Timbertooth",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="As good as good and better. These little guys are quite frail but exceedingly brave. - Bob Bigheart",
keywords={"Beast"},
pet=3328,
},[[
step
clicknpc Tiny Timbertooth##189658
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习 Tiny Timbertooth 战斗宠物 |learnpet Tiny Timbertooth##3328 |goto The Azure Span/0 20.17,47.42
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Trunkalumpf",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="While their tiny tusks may not help much in a fight, the trunkalumpfs make up for it in sheer weight.",
keywords={"Beast"},
pet=3288,
},[[
step
clicknpc Trunkalumpf##189110
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Trunkalumpf战斗宠物 |learnpet Trunkalumpf##3288 |goto Ohn'ahran Plains/0 76.60,27.20
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Vorquin Runt",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="It will probably grow bigger. Probably.",
keywords={"Beast"},
pet=3336,
},[[
step
clicknpc Vorquin Runt##191323
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Vorquin Runt战斗宠物 |learnpet Vorquin Runt##3336 |goto The Waking Shores/0 62.78,48.06
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Razortooth Bear Cub",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="It's not easy having red fur during the winter, but in the autumn it's very fashionable.",
keywords={"Beast"},
pet=3352,
},[[
step
clicknpc Razortooth Bear Cub##192251
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习战斗宠物剃刀熊崽 |learnpet Razortooth Bear Cub##3352 |goto Thaldraszus/0 48.80,55.80
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Backswimmer Timbertooth",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="When not lazily floating down a river, this Timbertooth is fond of snacks and snuggles.",
keywords={"Beast","Iskaara"},
pet=3326,
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 在建筑物内。
|tip 上交从The Azure Span的宝藏中获取的Stolen Totems以获取声望。
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
与艾卡拉海象人达到名望等级9 |complete factionrenown(2511) >= 9 or haspet(3326)
|tip 在碧蓝林海完成日常任务、每周任务和区域任务以获得名望
step
map The Azure Span/0
path follow smart; loop on; ants curved; dist 20
path	13.23,48.97	12.93,49.40	12.96,49.99	13.38,50.08	13.73,49.87
path	13.74,49.48	13.39,48.94
talk Jiq##186564
|tip 他围绕伊斯卡拉跑一个大圈
accept Cute and Cuddly##70959
|tip 从这个任务中选择蝌蚪伐齿泰姆布托斯
|tip Backswimmer Timbertooth 需要昂贵的材料才能购买。
step
collect 1 Runed Writhebark##194863 |or
|tip 这些由20级龙岛铭文制造。
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3326) |or
step
击杀此区域周围的敌人
|tip 击杀鸵鸟类动物，例如Hornstriders、Tallstriders和Runner birds。
collect 5 Tallstrider Sinew##201404 |goto Thaldraszus/0 51.00,47,20 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3326) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3326) |or
step
talk Murik##193006
|tip 他是一个海象人站在建筑外。
buy Backswimmer Timbertooth##193837 |goto The Azure Span/0 13.14,49.26 |or
|tip 这只战斗宠物也可以从任务Cute and Cuddly in The Azure Span中获得
'|complete haspet(3326) |or
step
use Backswimmer Timbertooth##193837
学习战斗宠物“倒游者木牙” |learnpet Backswimmer Timbertooth##3326
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Snowclaw Cub",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="An adult Snowclaw can rattle the very trees with its roar. A cub can rattle one of the smaller branches.",
keywords={"Beast"},
pet=3359,
},[[
step
此任务链已完成 |only if completedq(67606)
|tip 你已经完成了这个任务线。|only if completedq(67606)
|tip 你必须在另一个角色上完成这个指南，除非你仍然拥有“荣誉树妖”称号。 |only if completedq(67606)
点击此处确认  |confirm |only if completedq(67606)
step
达到等级68 |ding 68
step
talk Thalendra##192522
|tip 她看起来像一个站在喷泉前的树妖。
accept A Dryadic Remedy##67606 |goto Valdrakken/0 72.78,66.17
step
collect Tasty Hatchling's Treat##197769 |q 67606/1
|tip 你可以用35级龙岛烹饪制作这个，或者从拍卖行购买。
step
talk Despondent Duckling##192970
|tip 这是一只小小的，黄色的小鸭子，睡在岸边靠近其他小鸭子。
选择“谨慎服用萨琳德拉推荐的药剂。”
治疗绝望的小鸭子 |q 67606/2 |goto 66.46,58.29
step
talk Thalendra##192522
|tip 她看起来像一个站在喷泉前的树妖。
|tip 在完成这篇攻略之前不要下线，否则你将失去你需要的临时头衔。
turnin A Dryadic Remedy##67606 |goto Valdrakken/0 72.78,66.17
step
kill River Hornswog##191618
|tip 它们看起来像带有角和鳍的大型青蛙，在觉醒海岸。
|tip 这些也可以从拍卖行购买
collect 3 Hornswog Hunk##197744 |goto The Waking Shores/0 66.20,42.80 |or
'|complete haspet(3359) |or
step
点击这里解锁商人Vexil以购买甘蜜零食 |confirm |next |or
|tip 这将需要相当多的刷怪时间。
点击这里在拍卖行购买蜂蜜小吃 |confirm |next "Purchase_Honey_Snack_From_Auction_House" |or
'|havebuff Worldbreaker Membership##386848 |next "Dealer_Vexil_Already_Unlocked" |or
'|complete haspet(3359) |or
step
达到70级 |ding 70 |or
'|complete haspet(3359) |or
step
完成任务  "The Shadow of His Wings" |complete completedq(65691) or haspet(3359) |or
|tip 使用完整的The Waking Shores区域升级指南来完成这个。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
accept Allegiance to One##66419 |goto The Waking Shores/0 24.51,55.83 |or
|tip 你选择哪个都没有关系。
|tip 你将被你选择的那个锁定一周。
'|complete haspet(3359) |or
step
talk Sabellian##185894
_Or_
talk Wrathion##187495
告诉他们 _“我发誓全力支持你们当前的努力”_
|tip 在阳台上
|tip 你将解锁一个额外的任务来获取你本周选择阵营的声望
支持Wrathion或Sabellian |q 66419/1 |goto 24.38,55.69 |or
'|complete haspet(3359) |or
step
accept Keys of Loyalty##66133 |or
accept Keys of Loyalty##66805 |or
|tip 根据你选择的阵营，你将自动接受其中一个任务
'|complete haspet(3359) |or
step
collect Restored Obsidian Key##191264 |n
|tip 将30片钥匙碎片和3片钥匙框架碎片组合成1把修复的黑曜石钥匙
|tip 这些碎片掉落于黑曜石城堡周围的怪物和稀有怪物。
talk Igys the Believer##187275
accept Unlocking Our Past##66129 |n |repeatable
use the Obsidian Cache##200069
|tip 每次你提交任务，你将获得一个。
collect Twilight Cache##201817 |n
|tip 这个可以从宝箱中掉落
use Twilight Cache##201817
collect Worldbreaker Membership##199215 |goto 32.28,52.49 |or
|tip 该物品是稀有掉落。
|tip 你可能需要打开几个暮光宝箱才能获得此物品
'|complete haspet(3359) |or
step
use the Worldbreaker Membership##199215
|tip 使用该物品后，它会被消耗并授予The Worldbreaker头衔和Worldbreaker Membership增益，持续2天。
获得Worldbreaker Membership增益 |havebuff Worldbreaker Membership##386848 |or
'|complete haspet(3359) |or
step
label "Dealer_Vexil_Already_Unlocked"
talk Dealer Vexil##193310
|tip 洞穴内部
buy Honey Snack##198356 |goto The Waking Shores/0 34.74,46.73 |or
|tip 不要使用蜜饯点心，因为商贩维克希尔可能不允许你再购买一个用于任务。
'|complete haspet(3359) |or
step
label "Purchase_Honey_Snack_From_Auction_House"
buy Honey Snack##198356 |or
|tip 去拍卖行购买
'|complete haspet(3359) |or
step
设定称号荣誉树妖
|tip 在你的角色面板，将你的称号设置为荣誉树妖。
|tip 如果你不这样做，下一步的NPC将会逃跑
设定“荣誉树精”头衔 |complete hastitle(728) |or
'|complete haspet(3359) |or
step
talk Primal Bear Cub##196768
|tip 他是一只名字是黄色的幼年熊崽子，在这个区域跑来跑去。
|tip 小熊的刷新时间可能长达六十分钟，如果它不在这里的话。
|tip 你必须装备头衔 Honorary Dryad 否则熊宝宝会逃离你
选择 _<提供幼崽一些角鲨肉和蜂蜜>_
collect Snowclaw Cub##201838 |goto The Azure Span/0 67.60,18.60 |or
'|complete haspet(3359) |or
step
use the Snowclaw Cub##201838
学习 Snowclaw Cub 战斗宠物 |learnpet Snowclaw Cub##3359
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bakar Companion",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Faithful and ferocious, this bakar is a hero's best friend.",
keywords={"Beast","Grand Hunt Spoils","Maruuk Centaur"},
pet=3325,
},[[
step
use Grand Hunt Spoils##200468
use Grand Hunt Spoils##200513
use Grand Hunt Spoils##200515
|tip 本周第一次参加盛大狩猎掉落史诗盛大狩猎战利品，其中包含宠物的几率最高
|tip 当你在一个有活跃盛宴狩猎的区域内时，点击图标，然后点击弹出窗口以加载指引。
collect Bakar Companion##200290 |or
'|complete haspet(3325) |or
step
use the Bakar Companion##200290
学习“巴卡伙伴”战斗宠物 |learnpet Bakar Companion##3325
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Hoofhelper",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Though it's rare, thunder lizards have been known to bond with centaurs. And their close allies. Lucky you!",
keywords={"Beast","Maruuk Centaur","renown"},
pet=3317,
},[[
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 交上大型狩猎的狩猎战利品以获取声望。
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
达到马鲁克半人马声望等级8级 |complete factionrenown(2503) >= 8 or haspet(3317)
|tip 在欧恩哈拉平原完成日常任务、每周任务和区域任务以获得声望
|tip 你也可以在Aylaag Outpost每次他们在新地点设营时完成任务
step
collect 20 Resilient Leather##193210 |or
|tip 这需要是T2品质的制造材料。
|tip 用巨龙群岛剥皮专业刷或者从拍卖行购买。
'|complete haspet(3317) |or
step
击杀此区域周围的敌人
|tip 击杀鸵鸟类动物，例如Hornstriders、Tallstriders和Runner birds。
collect 5 Tallstrider Sinew##201404 |goto Thaldraszus/0 51.00,47,20 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3317) |or
step
talk Quartermaster Huseng##196707
|tip 在建筑物内。
buy Hoofhelper##193618 |goto Ohn'ahran Plains/0 60.39,37.72 |or
'|complete haspet(3317) |or
step
use Hoofhelper##3317
学习 Hoofhelper 战斗宠物 |learnpet Hoofhelper##3317
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Pinkie",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="With her distinctive coloration and impeccable work ethic, Pinkie has propelled herself to the top of the tallstrider fashion world.",
keywords={"Beast","Iskaara Tuskarr","Patchu"},
pet=3417,
},[[
step
collect 500 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3417) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Pinkie##201703 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3417) |or
step
use Pinkie##201703
学习“Pinky”战斗宠物 |learnpet Pinkie##3417
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Scout",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="Scout came to the Dragon Isles for adventure and excitement. After finding you, he got both.",
keywords={"Beast","Iskaara Tuskarr","Patchu"},
pet=3407,
},[[
step
collect 5000 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3407) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Scout##201441 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3407) |or
step
use Scout##201441
学习"侦查兵"战斗宠物 |learnpet Scout##3407
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Violet Violence",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Some very clever wizard or dragon or other magical being thought they were being clever when they decided to color an ice elemental purple for a very elaborate bit of wordplay. They were probably right.",
keywords={"Beast","Achievement"},
pet=3262,
},[[
step
完成 "What Can I Say? They Love Me." 成就 |achieve 15643 |or
|tip 收集1600个唯一的宠物
'|complete haspet(3262) |or
step
学习Violet Violence战斗宠物 |learnpet Violet Violence##3262
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Mister Toots",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="His name is Mister Toots because of the melodious sounds he can make with his trunk.",
keywords={"Beast"},
pet=3286,
},[[
step
achieve Just Don't Ask Me To Spell It##16363 |or
|tip 完成Thaldraszus所有的主线任务
|tip 这个成就包含在 Full Zones (Story + Side Quests) Leveling Guide 中
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
'|complete haspet(3286) |or
step
talk Jyhanna##185563
|tip 她是一个赎罪之地中心的龙希尔
accept Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.43,58.29
step
寻找拉宾斯 |q 70647/1 |goto Thaldraszus/0 34.80,63.75
|tip 他是一只小小的、受伤的始祖幼龙躺在地上
step
talk Jyhanna##185563
|tip 她是一个赎罪之地中心的龙希尔
turnin Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.43,58.29
accept An Expert Opinion##70697 |goto Valdrakken/0 10.43,58.29
step
talk Patchu##196069
turnin An Expert Opinion##70697 |goto The Azure Span/0 13.88,49.85
accept What Lubbins Needs##70722 |goto The Azure Span/0 13.88,49.85
step
talk Patchu##196069
告诉他 感谢你。我相信我明白了。
turnin What Lubbins Needs##70722 |goto The Azure Span/0 13.88,49.85
accept A Practice Bout##70732 |goto The Azure Span/0 13.88,49.85
step
clicknpc Gwosh##196206
|tip 他是一只角蛙坐在几块大石头旁。
|tip 尝试用Lubbins击败他。
|tip 你在前一步获得了Lubbins
在宠物对战中击败Gwosh |q 70732/1 |goto The Azure Span/0 14.26,47.60
step
talk Patchu##196069
turnin A Practice Bout##70732 |goto The Azure Span/0 13.88,49.85
accept This Calls for a Specialist##70849 |goto The Azure Span/0 13.88,49.85
step
talk Haniko##196264
|tip 她是一个戴着帽子的狐人。
turnin This Calls for a Specialist##70849 |goto The Waking Shores/0 38.91,83.27
accept Born to Be Wilder##70851 |goto The Waking Shores/0 38.91,83.27
step
talk Haniko##196264
|tip 她是一个戴着帽子的狐人。
告诉她“我该怎么做？”
告诉她我明白
turnin Born to Be Wilder##70851 |goto The Waking Shores/0 38.91,83.27
accept A Friend for Lubbins##70853 |goto The Waking Shores/0 38.91,83.27
step
clicknpc Shyfly##189102
|tip 害羞的小飞宠应该就在附近
|tip 25级魔法战斗宠物将会表现最佳。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习“畏飞”战斗宠物 |learnpet Shyfly##3280 |goto The Waking Shores/0 44.00,78.80
step
talk Haniko##196264
|tip 她是一个戴着帽子的狐人。
turnin A Friend for Lubbins##70853 |goto The Waking Shores/0 38.91,83.27
accept So How Did It Go?##70854 |goto The Waking Shores/0 38.91,83.27
step
talk Jyhanna##185563
|tip 她是一个赎罪之地中心的龙希尔
turnin So How Did It Go?##70854 |goto Valdrakken/0 10.43,58.29
collect Mister Toots##200519 |goto Valdrakken/0 10.43,58.29
step
use Mister Toots##200519
学习Mister Toots战斗宠物 |learnpet Mister Toots##3286
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cubbly",{
patch='100005',
source='Puzzle',
author="support@zygorguides.com",
description="Cubbly's extended proximity to time magic has given him powers far beyond the average bear.",
keywords={"Beast"},
pet=3415,
},[[
'|complete haspet(3415) |or
step
进入洞穴 |goto Thaldraszus/0 52.71,83.30 < 10
|tip 你需要掌握巨龙群岛采矿或获得龙鳞探险队声望20才能购买探险炸药来清除障碍
|tip 探险爆炸物由编目员杰克斯和探路者杰布在巨龙鳞片营地出售
clicknpc Strange Bear Cub##198604
|tip 这看起来像一个小熊幼崽在洞穴里。
collect Cubbly##201463 |goto Thaldraszus/0 52.46,83.61 |or
'|complete haspet(3415) |or
step
use Cubbly##201463
学习Cubbly战斗宠物 |learnpet Cubbly##3415
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Chestnut",{
patch='100005',
source='Puzzle',
author="support@zygorguides.com",
description="Chestnut once found an acorn larger than he was, ate the whole thing, and doubled in size. It's a good thing he didn't eat a Trunkalumpf.",
keywords={"Critter"},
pet=3275,
},[[
step
click Acorn##381424
|tip 这是一个小橡果在大树旁的地面上。
获取Acorn增益效果 |complete hasbuff(388485) or haspet(3275) |goto Thaldraszus/0 49.38,62.66 |or
你可以在[49.37,63.06]找到更多
step
clicknpc Acorn Harvester##196172
collect Chestnut##193066 |goto 49.43,62.89 |or
'|complete haspet(3275) |or
step
use the Chestnut##193066
学习Chestnut战斗宠物 |learnpet Chestnut##3275
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Pricklefury Hare",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="This is the most pettable pointy creature you will ever meet.",
keywords={"Critter"},
pet=3272,
},[[
step
clicknpc Pricklefury Hare##189093
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Pricklefury Hare战斗宠物 |learnpet Pricklefury Hare##3272 |goto The Waking Shores/0 78.08,33.54
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Pistachio",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="Pistachio got her name in exactly the way you would expect.",
keywords={"Critter","Iskaara Tuskarr","Patchu"},
pet=3278,
},[[
step
collect 50 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3278) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Pistachio##193071 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3278) |or
step
use Pistachio##193071
学习Pistachio战斗宠物 |learnpet Pistachio##3278
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Shaggy",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This little rabbit is cute from the tip of her button nose to the tips of her deadly claws.",
keywords={"Critter"},
pet=3259,
},[[
step
完成成就 Waking Hope。 |confirm |complete achieved(16334) or haspet(3259)
|tip 完成所有主线任务
|tip 使用完整区域升级指南来完成这个
|tip 你也可以从拍卖行购买这个宠物。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
step
达到70级 |ding 70 |or
'|complete haspet(3259) |or
step
解锁莫鲁特村的禁忌之岛使者 |confirm |complete completedq(73157) or haspet(3259)
|tip 完成禁忌之境任务链
|tip 使用禁忌之触升级指南来完成这项任务。
点击这里加载"禁忌离岛任务"升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach"
step
earn 2000 Elemental Overflow##2118 |or
|tip 这些从怪物、宝箱以及禁忌离岛和元素风暴影响的区域中的日常任务掉落
'|complete haspet(3259) |or
step
talk Cataloger Daela##200566
|tip 她在建筑物里面，是个黑铁矮人
buy Sack of Oddities##204383 |goto The Forbidden Reach/5 34.32,59.98 |or
'|complete haspet(3259) |or
step
use Sack of Oddities##204383
|tip 宠物有小几率从这个容器中掉落
|tip 你可能需要购买并打开几个这个才能获得宠物。
collect Shaggy##191915 |or
'|complete haspet(3259) |or
step
use Shaggy##191915
学习战斗宠物“蓬蓬” |learnpet Shaggy##3259
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Snowy Treeflitter",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Nearly invisible, this creature leaps from tree to snow-covered tree.",
keywords={"Critter"},
pet=3260,
},[[
step
clicknpc Snowy Treeflitter##188792
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习宠物“雪地小树灵” |learnpet Snowy Treeflitter##3260 |goto The Azure Span/0 69.09,29.93
你可以在附近找到更多 大约在[72.32,28.31]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Treeflitter",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Many have tried to boop the cute little noses of creatures like this. Most have lost fingers.",
keywords={"Critter"},
pet=3276,
},[[
step
clicknpc Treeflitter##189097
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Treeflitter战斗宠物 |learnpet Treeflitter##3276 |goto Ohn'ahran Plains/0 55.58,42.26
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Obsidian Proto-Whelp",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="After finding a clutch of black proto-whelps, Wrathion took them under his wing.",
keywords={"Dragonkin","Wrathion","Lorena Belle","Obsidian Citadel"},
pet=3414,
},[[
step
kill Shortcoat Bear##193627+
collect 3 Primal Bear Spine##201399 |goto The Azure Span/0 49.00 14.60 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3414) |or
step
击杀这些地区周围的敌人
|tip 击杀水牛类或鹿类动物，例如布鲁法隆、宽蹄、公牛、奶牛、母鹿和雄鹿野兽。
|tip 你也可以从拍卖行购买这个
collect 1 Large Sturdy Femur##201402 |goto Ohn'ahran Plains/0 73.46,45.01 |or
你可以在[82.42,58.99]找到更多
'|complete haspet(3414) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3414) |or
step
talk Lorena Belle##188625
告诉她 _"我可以看看你的货物吗？"_
buy Obsidian Proto-Whelp##200930 |goto The Waking Shores/0 25.16,55.80 |or
'|complete haspet(3414) |or
step
use the Obsidian Proto-Whelp##200930
学习“黑曜石始祖雏龙”战斗宠物 |learnpet Obsidian Proto-Whelp##3414
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Obsidian Warwhelp",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="A war-obsessed world turned her into a weapon... but they couldn't break her spirit.",
keywords={"Dragonkin"},
pet=4261,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Warden Krizzik##208346
buy 1 Obsidian Warwhelp##208011 |goto Thaldraszus/0 51.05,56.68 |or
'|learnpet Obsidian Warwhelp##4261 |or
step
use the Obsidian Warwhelp##208011
学习“黑曜石战争幼龙”战斗宠物 |learnpet Obsidian Warwhelp##4261
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Bronze Racing Enthusiast",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This little racing enthusiast has never missed a race and has never met a racer she didn't like.",
keywords={"Dragonkin","Achievement"},
pet=3279,
},[[
step
完成“驭龙赛成就达人：白银”成就 |achieve 15940 |or
|tip 在所有巨龙群岛地区完成所有巨龙竞速并达到银牌或更好成绩
|tip 你可以使用龙骑世界巡回指南来找到每个赛事
'|complete haspet(3279) |or
step
use the Bronze Racing Enthusiast##199688
学习Bronze Racing Enthusiast战斗宠物 |learnpet Bronze Racing Enthusiast##3279
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Stormie",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="As an egg, this proto-drake was struck by a freak bolt of lightning. Years later, the lightning still lives inside.",
keywords={"Dragonkin"},
pet=3382,
},[[
step
完成成就 Waking Hope。 |confirm |complete achieved(16334) or haspet(3382)
|tip 完成所有主线任务
|tip 使用完整区域升级指南来完成这个
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
'|complete haspet(3382) |or
step
达到70级 |ding 70 |or
'|complete haspet(3382) |or
step
earn 1000 Elemental Overflow##2118 |or
|tip 这些掉落自受到元素风暴影响的区域中的怪物
'|complete haspet(3382) |or
step
talk Mythressa##196516
|tip 她是一个龙希尔在建筑物里面
buy Stormie##200173 |goto Valdrakken/0 38.10,37.72 |or
'|complete haspet(3382) |or
step
use Stormie##200173
学习战斗宠物Stormie |learnpet Stormie##3382
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Magic Nibbler",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="It's tried to cut down, but magic is just so tasty.",
keywords={"Dragonkin","Groundskeeper Kama"},
pet=3378,
},[[
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip 在建筑物内。
|tip 提交来自泰坦、巨龙和原始者宝物的泰坦遗物
'|turnin More Titan Relics##70841 |n
'|turnin A Titan Relic##70840 |n
在瓦德拉肯协议中达到名望等级18 |complete factionrenown(2510) >= 18 or haspet(3378)
|tip 在碧蓝林海完成日常任务、每周任务和区域任务以获得名望
step
talk Groundskeeper Kama##189197
accept A Collection of Creatures##70901 |goto 74.51,63.04
|tip 如果你还没有完成的话，选择 Magic Nibbler 宠物
step
kill Shortcoat Bear##193627
|tip 他们是生活在这个区域的棕熊
|tip 你也可以从拍卖行购买这些。
collect 3 Primal Bear Spine##201399 |goto The Azure Span/0 49.00 14.60 |or
'|complete haspet(3378) |or
step
击杀这些地区周围的敌人
|tip 击杀水牛类或鹿类动物，例如布鲁法隆、宽蹄、公牛、奶牛、母鹿和雄鹿野兽。
|tip 你也可以从拍卖行购买这个
collect 1 Large Sturdy Femur##201402 |goto Ohn'ahran Plains/0 73.46,45.01 |or
你可以在[82.42,58.99]找到更多
'|complete haspet(3378) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3378) |or
step
talk Groundskeeper Kama##189197
|tip 他是一个巨大的绿色龙人，坐在草地上。
buy Magic Nibbler##199757 |goto Valdrakken/0 74.50,63.15 |or
'|complete haspet(3378) |or
step
use Magic Nibbler##199757
学习魔法啃啃战斗宠物 |learnpet Magic Nibbler##3378
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Crimson Proto-Whelp",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="This proto-whelp's distinctive coloration is highly prized by pet trainers.",
keywords={"Dragonkin","Groundskeeper Kama"},
pet=3379,
},[[
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip 在建筑物内。
|tip 提交来自泰坦、巨龙和原始者宝物的泰坦遗物
'|turnin More Titan Relics##70841 |n
'|turnin A Titan Relic##70840 |n
在瓦德拉肯协议中达到名望等级18 |complete factionrenown(2510) >= 18 or haspet(3379)
|tip 在碧蓝林海完成日常任务、每周任务和区域任务以获得名望
step
talk Groundskeeper Kama##189197
accept A Collection of Creatures##70901 |goto 74.51,63.04
|tip 如果尚未完成此任务，请选择Crimson Proto-Whelp宠物。
step
kill Shortcoat Bear##193627
|tip 他们是生活在这个区域的棕熊
|tip 你也可以从拍卖行购买这些。
collect 3 Primal Bear Spine##201399 |goto The Azure Span/0 49.00 14.60 |or
'|complete haspet(3379) |or
step
击杀这些地区周围的敌人
|tip 击杀水牛类或鹿类动物，例如布鲁法隆、宽蹄、公牛、奶牛、母鹿和雄鹿野兽。
|tip 你也可以从拍卖行购买这个
collect 1 Large Sturdy Femur##201402 |goto Ohn'ahran Plains/0 73.46,45.01 |or
你可以在[82.42,58.99]找到更多
'|complete haspet(3379) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3379) |or
step
talk Groundskeeper Kama##189197
|tip 他是一个巨大的绿色龙人，坐在草地上。
buy Crimson Proto-Whelp##199758 |goto Valdrakken/0 74.50,63.15 |or
'|complete haspet(3379) |or
step
use Crimson Proto-Whelp##199758
学习战斗宠物Crimson Proto-Whelp |learnpet Crimson Proto-Whelp##3379
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Lubbins",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Who's the cutest little monster? You are!",
keywords={"Dragonkin"},
pet=3316,
},[[
step
获得 Just Don't Ask Me To Spell It 成就 |achieve 16363 |or
|tip 参考 "Thaldraszus (Full Zone)" 升级指南来完成这个任务。
点击此处加载Thaldraszus（全区域）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)" |or
'|complete haspet(386575) |or
step
talk Jyhanna##185563
|tip 她是一个赎罪之地中心的龙希尔
accept Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.43,58.29
step
clicknpc Injured Lubbins##195911
|tip 他是一只小小的、受伤的始祖幼龙躺在地上
找并帮助Lubbins |q 70647/1 |goto Thaldraszus/0 34.80,63.75
step
talk Jyhanna##185563
|tip 她是一个赎罪之地中心的龙希尔
turnin Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.41,58.27
step
use Lubbins##199175
学习Lubbins战斗宠物 |learnpet Lubbins##3316
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Emberling",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="The core temperature of an Emberling is hot enough to dissolve anything organic, so make sure to wear gloves if you want to pet it.",
keywords={"Elemental"},
pet=3367,
},[[
step
clicknpc Emberling##193024
|tip 这只野生宠物出现在熔岩流附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习小火灵战斗宠物 |learnpet Emberling##3367 |goto The Waking Shores/0 83.90,34.62
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Igneoid",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="An Igneoid is formed when magma makes it to Azeroth's surface and is infused with dark elemental magic. The resulting creature is tiny, fierce, and very cute.",
keywords={"Elemental"},
pet=3295,
},[[
step
clicknpc Igneoid##189121
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习 Igneoid 战斗宠物 |learnpet Igneoid##3295 |goto Thaldraszus/0 46.56,64.01
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Kindlet",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="A troublesome mage named McGwire decided to start a small fire. He summoned a flame which caused him to exclaim: 'This is much more alive than required!'",
keywords={"Elemental"},
pet=3366,
},[[
step
clicknpc Kindlet##193000
|tip 这只野生宠物出现在熔岩流附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Kindlet战斗宠物 |learnpet Kindlet##3366 |goto The Waking Shores/0 73.99,34.84
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Magma Slug",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Somehow this creature manages to be hot, rocky, and slimy all at the same time.",
keywords={"Elemental"},
pet=3273,
},[[
step
clicknpc Magma Slug##189094
|tip 这只野生宠物出现在熔岩流附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习“熔岩蜗牛”战斗宠物 |learnpet Magma Slug##3273 |goto The Waking Shores/0 83.68,33.12
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Snowlemental",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="When you feel a chill run down your spine, don't be afraid. It's probably just your pet snowlemental.",
keywords={"Elemental"},
pet=3283,
},[[
step
clicknpc Snowlemental##189107
|tip 这只野生宠物通常出现在冰雪附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习“雪元素”战斗宠物 |learnpet Snowlemental##3283 |goto The Azure Span/0 72.55,25.63
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Chip",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Born of living stone. Reforged by the hands of Wrathion's agents. Sadly much too tiny to make a difference in the black dragons' war against the djaradin.",
keywords={"Elemental"},
pet=3376,
},[[
step
kill Molded Boulder##190213+
|tip 这些是围绕黑曜石王座和化身巨窟内部的石元素生物。
|tip 你也可以从拍卖行购买这些。
collect 2 Pre-Sentient Rock Cluster##198082 |goto Thaldraszus/0 39.00,85.60 |or
'|complete haspet(3376) |or
step
kill Stonescale Proto-Dragon##198200+
|tip 这些是飞行在该地区的石质始祖龙
|tip 你也可以从拍卖行购买这些。
collect 5 Element-Infused Blood##199219 |goto The Waking Shores/0 42.50,52.28 |or
'|complete haspet(3376) |or
step
在这一片区域击杀Qalashi敌人
|tip 这些是精英元素人型生物，它们在黑曜石王座周围和始祖宝库内部巡逻
collect Rock of Aegis##198357 |goto The Waking Shores/0 28.41,58.67 |or
'|complete haspet(3376) |or
step
talk Yries Lightfingers##191135
|tip 他在黑曜王座的顶层平台。
buy Chip##199326 |goto 26.43,55.44 |or
'|complete haspet(3376) |or
step
use Chip##199326
学习战斗宠物 Chip |learnpet Chip##3376
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Echo of the Cave",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Formed by the reckless use of elemental magic, the slumbering earth awakens. It is angry.",
keywords={"Elemental"},
pet=3355,
},[[
step
在元素风暴事件周围杀死敌人
|tip 按M打开你在游戏内的地图来找到元素风暴。
|tip 这个宠物有一定几率掉落自魔兽世界巨龙群岛任意区域有元素风暴事件活动时的小怪
collect Echo of the Cave##200183 |or
'|complete haspet(3355) |or
step
use the Echo of the Cave##200183
学习Echo of the Cave战斗宠物 |learnpet Echo of the Cave##3355
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Echo of the Depths",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="What the deep claims, none can reclaim.",
keywords={"Elemental"},
pet=3299,
},[[
step
在元素风暴事件周围杀死敌人
|tip 按M打开你在游戏内的地图来找到元素风暴。
|tip 这个宠物有一定几率掉落自魔兽世界巨龙群岛任意区域有元素风暴事件活动时的小怪
collect Echo of the Depths##200260 |or
'|complete haspet(3299) |or
step
use the Echo of the Depths##200260
学习“深渊之回声”战斗宠物 |learnpet Echo of the Depths##3299
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Echo of the Heights",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="In the mountain air, frost lingers upon the grass as a storm rolls in.",
keywords={"Elemental"},
pet=3310,
},[[
step
在元素风暴事件周围杀死敌人
|tip 按M打开你在游戏内的地图来找到元素风暴。
|tip 这个宠物有一定几率掉落自魔兽世界巨龙群岛任意区域有元素风暴事件活动时的小怪
collect Echo of the Heights##200263 |or
'|complete haspet(3310) |or
step
use the Echo of the Heights##200263
学习回响岭的战斗宠物 |learnpet Echo of the Heights##3310
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Echo of the Inferno",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="A spark can become an ember. An ember can become a raging fire. This creature was never a spark or an ember, it has only ever been a raging fire.",
keywords={"Elemental"},
pet=3289,
},[[
step
在元素风暴事件周围杀死敌人
|tip 按M打开你在游戏内的地图来找到元素风暴。
|tip 这个宠物有一定几率掉落自魔兽世界巨龙群岛任意区域有元素风暴事件活动时的小怪
collect Echo of the Inferno##200255 |or
'|complete haspet(3289) |or
step
use the Echo of the Inferno##200255
学习Echo of the Inferno战斗宠物 |learnpet Echo of the Inferno##3289
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Mote of Nasz'uro",{
author="support@zygorguides.com",
description="This guide will help you acquire the Mote of Nasz'uro pet.",
startlevel=70,
source='Treasures',
pet=3581,
patch='100105',
},[[
step
click Mote of Nasz'uro
收集微粒 |q 76184 |future |goto The Waking Shores/0 22.84,88.41
step
click Mote of Nasz'uro
|tip 在 Obsidian Throne 旁边，站在 Sabellian 和 Wrathion 后面。
收集微粒 |q 76185 |future |goto The Waking Shores/0 24.15,55.56
step
click Mote of Nasz'uro
|tip 巨龙雕像的爪子后面
收集微粒 |q 76186 |future |goto The Waking Shores/0 58.50,67.65
step
click Mote of Nasz'uro
|tip 在世界之树的树枝和树叶下。
收集微粒 |q 76187 |future |goto The Waking Shores/0 63.89,44.81
step
click Mote of Nasz'uro
|tip 石柱之巅
收集微粒 |q 76182 |future |goto Ohn'ahran Plains/0 61.23,64.36
step
click Mote of Nasz'uro
收集微粒 |q 76183 |future |goto Ohn'ahran Plains/0 34.33,58.74
step
click Mote of Nasz'uro
|tip 在破碎的塔内
收集微粒 |q 76178 |future |goto The Azure Span/0 78.84,34.13
step
click Mote of Nasz'uro
|tip 在树桩顶端
收集微粒 |q 76179 |future |goto The Azure Span/0 61.57,71.43
step
click Mote of Nasz'uro
收集微粒 |q 76180 |future |goto The Azure Span/0 36.40,56.46
step
click Mote of Nasz'uro
收集微粒 |q 76181 |future |goto The Azure Span/0 8.23,53.08
step
click Mote of Nasz'uro
收集微粒 |q 76189 |future |goto Thaldraszus/0 62.67,13.23
step
click Mote of Nasz'uro
|tip 在塔的边缘。
收集微粒 |q 76190 |future |goto Thaldraszus/0 61.24,40.71
step
click Mote of Nasz'uro
|tip 在雕像脚下。
收集微粒 |q 76191 |future |goto Thaldraszus/0 72.88,55.05
step
click Mote of Nasz'uro
|tip 高高在山顶上
收集微粒 |q 76192 |future |goto Thaldraszus/0 70.87,69.85
step
click Mote of Nasz'uro
|tip 在雕像的双角之间
收集微粒 |q 76193 |future |goto Thaldraszus/0 62.61,85.07
step
click Mote of Nasz'uro
|tip 塔顶内部
收集微粒 |q 76188 |future |goto The Forbidden Reach/5 36.01,34.23
step
use the Mote of Nasz'uro##206040
学习Mote of Nasz'uro战斗宠物 |learnpet Mote of Nasz'uro##3581
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Sophic Amalgamation",{
patch='100005',
source='Crafted',
author="support@zygorguides.com",
description="A small fraction of the titans' power, an even smaller fraction of their size.",
keywords={"Elemental","Crafted","Enchanting"},
pet=3390,
},[[
step
collect Sophic Amalgamation##200479 |or
|tip 这可以用巨龙群岛附魔在技能50制作。
|tip 你也可以从拍卖行购买。
'|complete haspet(3390) |or
step
use the Sophic Amalgamation##200479
学习Sophic Amalgamation战斗宠物 |learnpet Sophic Amalgamation##3390
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Shiverweb Broodling",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Ironically, she has a warm personality.",
keywords={"Elemental","Kill the Queen"},
pet=3368,
},[[
step
达到65级 |ding 65 |or
|tip 这个宠物是从“完整地区（剧情+支线任务）”升级指南中的可选支线任务获得的
|tip 如果你想完成所有的剧情和支线任务，请打开The Azure Span的完整指南
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
'|complete haspet(3368) |or
step
talk Lilial Dawnburst##185778
|tip 倒地
accept Eight-Legged Menace##65750 |goto The Azure Span/0 51.73,61.98
accept Icy Webs##65769 |goto 51.73,61.98
stickystart "Free_Cocooned_Survivors"
stickystart "Slay_Shiverweb_Creepers_Or_Shiverweb_Crawlers"
step
kill 3 Primalist Tender##186111 |q 65750/2 |goto 50.58,60.58
|tip 他们看起来像人型生物。
step
label "Free_Cocooned_Survivors"
clicknpc Cocooned Survivor##186222+
|tip 它们看起来像是这片区域地面上的巨大白色蠕动茧
解救 #6# 被茧缚的幸存者 |q 65769/1 |goto 50.58,60.58
step
label "Slay_Shiverweb_Creepers_Or_Shiverweb_Crawlers"
在这个区域击杀 Shiverweb 敌人
|tip 他们看起来像蜘蛛。
击杀#10# 颤网爬行者或颤网潜伏者 |q 65750/1 |goto 50.58,60.58
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
|tip 在洞穴内。
collect Nai'jin's Runestone##191135 |q 65833/2 |goto 47.60,64.63
step
kill Frostcaller Julh'ek##186923
collect Julh'ek's Runestone##191137 |q 65833/1 |goto 47.66,62.40
step
label "Collect_Flasks_Of_Dwarven_Antifreeze"
击杀此区域周围的敌人
|tip 冰元素不会掉落任务物品。
collect 6 Flask of Dwarven Antifreeze##191042 |q 65832/1 |goto 49.08,63.73
step
talk Grungir Ironspout##185806
turnin Dwarven Antifreeze##65832 |goto 48.99,64.22
turnin Primalist Tampering##65833 |goto 48.99,64.22
accept Kill the Queen##65834 |goto 48.99,64.22
step
use the Spider Squasher##191044
|tip 用它对付Shiverweb Queen，这会对她造成重大伤害。
|tip 她看起来像一个大型的蓝色蛛魔
|tip 洞穴内的二楼
|tip 她是精英，不过有了任务物品的帮助，你应该可以很轻松地杀掉她。
|tip 任务物品只能伤害她一次，所以你不能重复使用。
kill Shiverweb Queen##186064 |q 65834/1 |goto 47.23,65.57
step
talk Grungir Ironspout##185806
turnin Kill the Queen##65834 |goto 48.99,64.22
step
use the Shiverweb Broodling##194004
学习“冷网幼虫”战斗宠物 |learnpet Shiverweb Broodling##3368
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Dust Spirit",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="When it was captured and bound to a cage made of enchanted metal, this spirit managed to twist and reshape the metal into the suit of armor it now wears.",
keywords={"Elemental"},
pet=3410,
},[[
step
完成成就《唤醒希望》 |complete achieved(16334) or haspet(3410) |or
|tip 完成龙岛的所有主线任务线
|tip 使用完整区域升级指南完成龙岛的任务
|tip 你也可以在拍卖行购买这个战斗宠物。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
达到70级 |ding 70 |or
'|complete haspet(3410) |or
step
collect 20 Empty Soul Cage##200938 |or
|tip 用巨龙群岛珠宝加工制作或在拍卖行购买。
|tip 以后你可能需要再买一些这些。
'|complete haspet(3410) |or
step
collect Zapthrottle Soul Inhaler##199414 |or
|tip 用巨龙群岛工程学制造或从拍卖行购买
'|complete haspet(3410) |or
step
kill Earthshatter Elemental##194524
|tip 这是一只精英元素生物。
use the Zapthrottle Soul Inhaler##199414
|tip 在元素死亡时用它
|tip 必须在你引导时死亡。
collect Encaged Earthen Soul##200936 |n
|tip 这将消耗1个空的灵魂笼。
collect Docile Earthen Soul##201297 |n
|tip 15分钟后，Engaged soul会变得Docile
use the Docile Earthen Soul##201297
|tip 你有小几率从这些中获得战斗宠物
|tip 你可能需要多次重复捕捉元素之魂的过程。
collect Dust Spirit##201261 |goto The Waking Shores/0 52.80,30.60 |or
你可以在[47.60,36.20]找到更多
'|complete haspet(3410) |or
step
use the Dust Spirit##201261
学习战斗宠物“尘灵” |learnpet Dust Spirit##3410
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Gale Spirit",{
patch='100005',
source='Drop',
author="support@zygorguides.com",
description="When it was the wind, this spirit carried scents to every corner of Azeroth. Sometimes you can still smell on it the barest hint of food, smoke, or the carnage of battle.",
keywords={"Elemental"},
pet=3412,
},[[
step
完成成就《唤醒希望》 |complete achieved(16334) or haspet(3412) |or
|tip 完成龙岛的所有主线任务线
|tip 使用完整区域升级指南完成龙岛的任务
|tip 你也可以在拍卖行购买这个战斗宠物。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
达到70级 |ding 70 |or
'|complete haspet(3412) |or
step
collect 20 Empty Soul Cage##200938 |or
|tip 用巨龙群岛珠宝加工制作或在拍卖行购买。
|tip 以后你可能需要再买一些这些。
'|complete haspet(3412) |or
step
collect Zapthrottle Soul Inhaler##199414 |or
|tip 用巨龙群岛工程学制造或从拍卖行购买
'|complete haspet(3412) |or
step
kill Stormbound Colossus##187843
|tip 这是一只精英元素生物。
use the Zapthrottle Soul Inhaler##199414
|tip 在元素死亡时用它
|tip 必须在你引导时死亡。
collect Encaged Airy Soul##200932 |n
|tip 这将消耗1个空的灵魂笼。
collect Docile Airy Soul##201296 |n
|tip 15分钟后，囚禁的灵魂会变得温顺。
use Docile Airy Soul##201296
|tip 你有小几率获得战斗宠物。
|tip 你可能需要多次重复捕捉元素之魂的过程。
collect Gale Spirit##201262 |goto Ohn'ahran Plains/0 23.11,37.39 |or
你可以在更多地方找到:
[23.93,39.34]
[24.30,33.65]
[21.30,38.05]
'|complete haspet(3412) |or
step
use the Gale Spirit##201262
学习“疾风之灵”战斗宠物 |learnpet Gale Spirit##3412
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tide Spirit",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="I wish that I could bind the tides and bend them to my will. But in its depths the sea abides and waits for no one still.",
keywords={"Elemental"},
pet=3409,
},[[
step
完成成就《唤醒希望》 |complete achieved(16334) or haspet(3409) |or
|tip 完成龙岛的所有主线任务线
|tip 使用完整区域升级指南完成龙岛的任务
|tip 你也可以在拍卖行购买这个战斗宠物。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
达到70级 |ding 70 |or
'|complete haspet(3409) |or
step
collect 20 Empty Soul Cage##200938 |or
|tip 用巨龙群岛珠宝加工制作或在拍卖行购买。
|tip 以后你可能需要再买一些这些。
'|complete haspet(3409) |or
step
collect Zapthrottle Soul Inhaler##199414 |or
|tip 用巨龙群岛工程学制造或从拍卖行购买
'|complete haspet(3409) |or
step
kill Force of the Springs##197008
|tip 这是一只精英元素生物。
use the Zapthrottle Soul Inhaler##199414
|tip 在元素死亡时用它
|tip 必须在你引导时死亡。
collect Encaged Frosty Soul##200934 |n
|tip 这将消耗1个空的灵魂笼。
collect Docile Frosty Soul##201299 |n
|tip 15分钟后，Engaged soul会变得Docile
use Docile Frosty Soul##201299
|tip 你有小几率获得战斗宠物。
|tip 你可能需要多次重复捕捉元素之魂的过程。
collect Tide Spirit##201265 |goto Ohn'ahran Plains/0 55.80,78.20 |or
你可以在[55.20,76.60]找到更多
'|complete haspet(3409) |or
step
use Tide Spirit##201265
学习潮汐之灵宠物 |learnpet Tide Spirit##3409
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Blaze Spirit",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This is the soul of a forest fire. Though its armor keeps its flames under control, you sometimes notice it gazing longingly at dead trees and dry underbrush.",
keywords={"Elemental"},
pet=3411,
},[[
step
完成成就《唤醒希望》 |complete achieved(16334) or haspet(3411) |or
|tip 完成龙岛的所有主线任务线
|tip 使用完整区域升级指南完成龙岛的任务
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
达到70级 |ding 70 |or
'|complete haspet(3411) |or
step
collect 20 Empty Soul Cage##200938 |or
|tip 用巨龙群岛珠宝加工制作或在拍卖行购买。
|tip 以后你可能需要再买一些这些。
'|complete haspet(3411) |or
step
collect Zapthrottle Soul Inhaler##199414 |or
|tip 用巨龙群岛工程学制造或从拍卖行购买
'|complete haspet(3411) |or
step
kill Fire Elemental##189843
|tip 这是一只精英元素生物。
use the Zapthrottle Soul Inhaler##199414
|tip 在元素死亡时用它
|tip 必须在你引导时死亡。
collect Encaged Fiery Soul##200931 |n
|tip 这将消耗1个空的灵魂笼。
collect Docile Fiery Soul##201298 |n
|tip 15分钟后，Engaged soul会变得Docile
use Docile Fiery Soul##201298
|tip 你有小几率获得战斗宠物。
|tip 你可能需要多次重复捕捉元素之魂的过程。
collect Blaze Spirit##201261 |goto The Azure Span/0 77.56,39.25 |or
'|complete haspet(3411) |or
step
use Blaze Spirit##201261
学习烈焰精灵战斗宠物 |learnpet Blaze Spirit##3411
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Black Slyvern Pup",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Above the vast green plains and rolling hills the slyvern fly, leaving only tiny shadows on the ground to mark their path through the sky.",
keywords={"Flying"},
pet=3266,
},[[
step
clicknpc Black Slyvern Pup##189160
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习黑暗幼龙宠物 |learnpet Black Slyvern Pup##3266 |goto Ohn'ahran Plains/0 55.42,49.01
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blue Dasher",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="The bad news is that these bugs are carnivorous. The good news is that they usually just eat other bugs.",
keywords={"Flying"},
pet=3403,
},[[
step
clicknpc Blue Dasher##197629
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习蓝色鸬鹚战斗宠物 |learnpet Blue Dasher##3403 |goto Thaldraszus/0 36.44,65.34
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Ironbeak Duck",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Though many creatures of the Dragon Isles are mysterious, the ducks are perhaps the most so. Where did they come from? Where are they going? What are they planning? We may never know.",
keywords={"Flying"},
pet=3300,
},[[
step
clicknpc Ironbeak Duck##189131
|tip 这只野生宠物通常出现在水源附近。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习铁喙鸭战斗宠物 |learnpet Ironbeak Duck##3300 |goto Ohn'ahran Plains/0 70.06,37.83
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Plucky Duckling",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="This is the terror that flaps o'er the dragon isles. This is the winged nightmare that pecks at your emerald dreams. What? No its not Deathwing, its a duck!",
keywords={"Flying"},
pet=3307,
},[[
step
clicknpc Plucky Duckling##189144
|tip 这只野生宠物通常在红玉新生池附近可以找到
|tip 你可能需要击杀野鸭崽来刷新一只勇敢的小鸭。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习小鸭宠物 |learnpet Plucky Duckling##3307 |goto Valdrakken/0 60.62,57.39
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Jeepers",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="This eye has witnessed untold horrors, and these fangs may be responsible for a few of their own.",
keywords={"Flying"},
pet=4258,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Provisioner Qorra##208347
buy 1 Jeepers##208010 |goto Thaldraszus/0 51.06,56.70 |or
'|learnpet Jeepers##4258 |or
step
use Jeepers##208010
学习 Jeepers 宠物 |learnpet Jeepers##4258
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Shyfly",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These elusive creatures are famous for being hard to find unless you already know where to look. Fortunately, Haniko told you where to look.",
keywords={"Flying"},
pet=3280,
},[[
step
clicknpc Shyfly##189102
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习“畏飞”战斗宠物 |learnpet Shyfly##3280 |goto The Waking Shores/0 44.00,78.80
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Woodbiter Piculet",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These birds use their sharp beaks and dragon-like talons to forage for prey on tree trunks and branches. They communicate with each other by drumming on the trees with their beaks, which makes a sound that can be heard over great distances.",
keywords={"Flying"},
pet=3322,
},[[
step
clicknpc Woodbiter Piculet##189157
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习"啄木小啄"战斗宠物 |learnpet Woodbiter Piculet##3322 |goto Ohn'ahran Plains/0 61.01,52.00
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Storm-Touched Bluefeather",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="Peck. Peck. Zap!",
keywords={"Flying","The Primalist Future"},
pet=3384,
},[[
step
clicknpc Storm-Touched Bluefeather##192259
|tip 此宠物仅在元素风暴事件期间刷新
|tip 你也可以在原始未来找到这些宠物。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Storm-Touched Bluefeather战斗宠物 |learnpet Storm-Touched Bluefeather##3384 |goto Primalist Tomorrow/0 53.00,40.60
你也可以在元素风暴期间找到这些：
[53.20,39.80]
[47.60,13.60]
[38.60,53.80]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Black Skitterbug",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="After pestering the Dragonscale Basecamp for weeks, Granpap Whiskers discovered a way to catch them and use them to get rid of other more annoying insects.",
keywords={"Flying","Dragonscale Expedition","Granpap Whiskers"," Dragonscale Basecamp"},
pet=3380,
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 在觉醒海岸各处的宝箱和补给包中上交龙岛神器。
'|turnin Multiple Dragon Isles Artifacts##72876 |n
'|turnin Multiple Dragon Isles Artifacts##71035 |n
'|turnin Dragon Isles Artifacts##71034 |n
与龙鳞远征队达到名望等级11 |complete factionrenown(2507) >= 11 or haspet(3380)
|tip 在觉醒海岸完成日常任务、周常任务和区域任务以获取名望
|tip 您还可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
step
talk Granpap Whiskers##187408
accept The Basecamp 'Pets'##70820 |goto The Waking Shores/0 47.73,83.23
|tip 如果还没有完成，选择'Black Skitterbug'下注
step
击杀此区域内的天羽敌人
|tip 你也可以在巨龙群岛的任何地区击杀任何飞行的鸟类。
collect 3 Iridescent Plume##201401 |goto Thaldraszus/0 52.50,60.60 |or
|tip 你也可以从拍卖行购买这些。
更多信息可以在[52.00,57.30]找到
'|complete haspet(3380) |or
step
击杀此区域周围的敌人
|tip 击杀鸵鸟类动物，例如Hornstriders、Tallstriders和Runner birds。
collect 5 Tallstrider Sinew##201404 |goto Thaldraszus/0 51.00,47,20 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3380) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3380) |or
step
talk Cataloger Jakes##189226
|tip 帐篷内
buy Black Skitterbug##198726 |goto Thaldraszus/0 47.11,82.58 |or
'|complete haspet(3380) |or
step
use the Black Skitterbug##198726
学习黑幽潜伏者战斗宠物 |learnpet Black Skitterbug##3380
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Viridescent Duck",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="These beautiful, elusive birds have very erratic migratory patterns, which can be difficult to track, leading some explorers to erroneously believe ducks simply didn't exist.",
keywords={"Flying"},
pet=3309,
},[[
step
clicknpc Ludo##192997
|tip 他是一只在Maruukai附近跑来跑去的棕色狗。
collect Ludo's Stash Map##195453 |goto Ohn'ahran Plains/0 61.77,41.86 |or
你可以在这个区域找到他四处走动: 61.16,41.74
'|complete haspet(3309) |or
step
use Ludo's Stash Map##195453
学习Ludo的宝藏位置 |complete completedq(67718) or haspet(3309)
step
click Dirt Mound##380991
collect Slightly Chewed Duck Egg##199171 |goto 70.59,35.46 |or
'|complete haspet(3309) |or
step
collect Viridescent Duck##199172 |or
|tip 等待3天“Slightly Chewed Duck Egg”孵化
'|complete haspet(3309) |or
step
use the Viridescent Duck##199172
学习战斗宠物Viridescent Duck |learnpet Viridescent Duck##3309
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Ohuna Companion",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Its eyes can see the flick of a mouse tail from leagues away.",
keywords={"Flying","Grand Hunt Spoils","Maruuk Centaur"},
pet=3311,
},[[
step
use Grand Hunt Spoils##200468
use Grand Hunt Spoils##200513
use Grand Hunt Spoils##200515
|tip 本周第一次参加盛大狩猎掉落史诗盛大狩猎战利品，其中包含宠物的几率最高
|tip 当你在一个有活跃盛宴狩猎的区域内时，点击图标，然后点击弹出窗口以加载指引。
collect Ohuna Companion##200276 |or
'|complete haspet(3311) |or
step
use the Ohuna Companion##200276
学习哦翼伴侣战斗宠物 |learnpet Ohuna Companion##3311
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Whitewhisker",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="These critters' white coats help them hide in the snow when predators are around.",
keywords={"Flying"},
pet=3320,
},[[
step
talk Nuptuk##199180
|tip 他是一个年轻的海象人，站在帐篷和挂着钩子的架子之间。
告诉他_"我想要雪地炫光护目镜."_
获取“佩戴雪炫目太阳镜”增益 |complete hasbuff(395978) or haspet(3320) |goto The Azure Span/0 50.88,54.75
step
clicknpc Whitewhisker##189209
|tip 当你有这个增益效果时，你会在无人营地周围找到这些
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习小宠物白须 |learnpet Whitewhisker##3320 |goto The Azure Span/0 45.32,39.35
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blackfeather Nester",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="There is no fury quite like that of a mother Blackfeather defending her nest.",
keywords={"Flying"},
pet=3321,
},[[
step
达到等级63 |ding 63 |or
'|complete haspet(3321) |or
step
click Tree Sap##380895
|tip 这在空心树干里面。
获取“树汁”增益 |complete hasbuff(385908) or haspet(3321) |goto The Azure Span/0 26.29,46.32
step
click Stick##380899
|tip 这看起来像一个微小的法杖，同样躺在空心的树干内部，但位置更高，靠近折断的末端。
失去树液增益 |complete not hasbuff(385908) or haspet(3321) |goto The Azure Span/0 26.55,46.27
step
clicknpc Pepper Hammer##195373
|tip 几秒钟后，这只鸟会飞到你的位置。
|tip 点击鸟以获得宠物。
collect Blackfeather Nester##193834 |goto The Azure Span/0 26.55,46.27 |or
'|complete haspet(3321) |or
step
use the Blackfeather Nester##193834
学习黑羽筑巢者战斗宠物 |learnpet Blackfeather Nester##3321
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Yipper",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Soon after you put down this slyvern's decay-twisted mother, you learned the hard way both how it got its name and why Zon'Wogi asked you to care for it.",
keywords={"Flying","The Great Shokhari"},
pet=3319,
},[[
step
达到65级 |ding 65 |or
|tip 这个宠物是从包含在"完整版区域（剧情+支线任务）"升级指南中的一个可选支线任务中获取的
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
'|complete haspet(3319) |or
step
talk Zon'Wogi##190892
accept The Great Shokhari##66844 |goto The Azure Span/0 19.05,23.97
step
kill Sky Vixen Shokhari##190761 |q 66844/1 |goto 13.33,26.37
|tip 她看起来像一只巨大的棕色狼形龙。
|tip 她在这个区域巡逻。
step
talk Zon'Wogi##190892
turnin The Great Shokhari##6684
step
use Yipper##193619
学习“Yipper”战斗宠物 |learnpet Yipper##3319
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Gray Marmoni",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Under the invitation and tutelage of Doc Nanners many Gray Marmoni have become common, but not always desired guests at the Dragonscale Expedition Basecamp.",
keywords={"Humanoid","Dragonscale Expedition","Granpap Whiskers"," Dragonscale Basecamp"},
pet=3381,
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip 帐篷内
|tip 在觉醒海岸各处的宝箱和补给包中上交龙岛神器。
'|turnin Multiple Dragon Isles Artifacts##72876 |n
'|turnin Multiple Dragon Isles Artifacts##71035 |n
'|turnin Dragon Isles Artifacts##71034 |n
与龙鳞远征队达到名望等级11 |complete factionrenown(2507) >= 11 or haspet(3381)
|tip 在觉醒海岸完成日常任务、周常任务和区域任务以获取名望
|tip 您还可以通过完成每周任务来获得声望，使用Dragonscale Basecamp Weekly Quests指南。
step
talk Granpap Whiskers##187408
accept The Basecamp 'Pets'##70820 |goto The Waking Shores/0 47.73,83.23
|tip 如果你还没有完成，选择“灰色玛尔摩尼”的赌注
step
击杀此区域内的天羽敌人
|tip 你也可以在巨龙群岛的任何地区击杀任何飞行的鸟类。
collect 3 Iridescent Plume##201401 |goto Thaldraszus/0 52.50,60.60 |or
|tip 你也可以从拍卖行购买这些。
更多信息可以在[52.00,57.30]找到
'|complete haspet(3381) |or
step
击杀此区域周围的敌人
|tip 击杀鸵鸟类动物，例如Hornstriders、Tallstriders和Runner birds。
collect 5 Tallstrider Sinew##201404 |goto Thaldraszus/0 51.00,47,20 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3381) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3381) |or
step
talk Cataloger Jakes##189226
|tip 帐篷内
buy Gray Marmoni##198725 |goto Thaldraszus/0 47.11,82.58 |or
'|complete haspet(3381) |or
step
use the Gray Marmoni##198725
学习灰色玛尔莫尼战斗宠物 |learnpet Gray Marmoni##3381
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Gill'dan",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="Gill'dan earned his great power by drinking the blood of a demon, which would also have turned his scales green had they not already been that color.",
keywords={"Humanoid"},
pet=4257,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Sir Finley Mrrgglton##208345
|tip 他在这个区域巡逻。
buy 1 Gill'dan##208009 |goto Thaldraszus/0 51.06,56.62 |or
'|learnpet Gill'dan##4257 |or
step
use Gill'dan##208009
学习宠物吉尔丹 |learnpet Gill'dan##4257
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Azure Crystalspine",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="These creatures are highly sought after by hunters looking to make weapons from the sharp crystals on its back.",
keywords={"Magic"},
pet=3357,
},[[
step
clicknpc Azure Crystalspine##192265
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
习得宠物蓝晶刃针 |learnpet Azure Crystalspine##3357 |goto The Azure Span/0 48.63,49.14
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Crimsonspine",{
patch='100005',
source='PetBattle',
author="support@zygorguides.com",
description="The blood of a crimsonspine flows through the clear crystal structures that make up its body, which causes its unique coloration.",
keywords={"Magic"},
pet=3358,
},[[
step
clicknpc Crimsonspine##192268
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习战斗宠物Crimsonspine |learnpet Crimsonspine##3358 |goto Thaldraszus/0 50.80,64.77
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Doomrubble",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="He seems to be very angry, but it's possible he's just hungry.",
keywords={"Magic"},
pet=4259,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Falara Nightsong##208341
buy 1 Doomrubble##208008 |goto Thaldraszus/0 51.05,56.72 |or
'|learnpet Doomrubble##4259 |or
step
use Doomrubble##208008
学习Doomrubble战斗宠物 |learnpet Doomrubble##4259
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\N'Ruby",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="A lifetime of servitude to Anub'arak, then the Lich King, and now... you!",
keywords={"Magic"},
pet=4262,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Baron Sliver##208338
buy 1 N'Ruby##208138 |goto Thaldraszus/0 51.00,56.65 |or
'|learnpet N'Ruby##4262 |or
step
use N'Ruby##208138
学习N'Ruby战斗宠物 |learnpet N'Ruby##4262
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Whiskuk",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Baby ottuks spend their days swimming, chasing butterflies, and practicing their intimidating roars.",
keywords={"Magic","Iskaara"},
pet=3284,
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip 在建筑物内。
|tip 上交从The Azure Span的宝藏中获取的Stolen Totems以获取声望。
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
与艾卡拉海象人达到名望等级9 |complete factionrenown(2511) >= 9 or haspet(3284)
|tip 在碧蓝林海完成日常任务、每周任务和区域任务以获得名望
step
map The Azure Span/0
path follow smart; loop on; ants curved; dist 20
path	13.23,48.97	12.93,49.40	12.96,49.99	13.38,50.08	13.73,49.87
path	13.74,49.48	13.39,48.94
talk Jiq##186564
|tip 他围绕伊斯卡拉跑一个大圈
accept Cute and Cuddly##70959
|tip 从这个任务中选择蝌蚪伐齿泰姆布托斯
|tip Backswimmer Timbertooth 需要昂贵的材料才能购买。
step
击杀这些地区周围的敌人
|tip 击杀水牛类或鹿类动物，例如布鲁法隆、宽蹄、公牛、奶牛、母鹿和雄鹿野兽。
|tip 你也可以从拍卖行购买这个
collect 1 Large Sturdy Femur##201402 |goto Ohn'ahran Plains/0 73.46,45.01 |or
你可以在[82.42,58.99]找到更多
'|complete haspet(3284) |or
step
击杀此区域周围的敌人
|tip 击杀鸵鸟类动物，例如Hornstriders、Tallstriders和Runner birds。
collect 5 Tallstrider Sinew##201404 |goto Thaldraszus/0 51.00,47,20 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3284) |or
step
earn 150 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3284) |or
step
talk Murik##193006
buy Whiskuk##193225 |goto The Azure Span/0 13.14,49.26 |or
|tip 这只战斗宠物也可以从任务Cute and Cuddly in The Azure Span中获得
'|complete haspet(3284) |or
step
use Whiskuk##193225
学习战斗宠物Whiskuk |learnpet Whiskuk##3284
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Spyragos",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This little dragon is all fired up! It looks like he's got some things to do.",
keywords={"Dragonkin"},
pet=3342,
},[[
step
达到60级 |ding 60 |or
'|complete haspet(3342) |or
step
完成“重拾信仰”任务 |complete completedq(66057) or haspet(3342) |or
|tip 这要求你完成觉醒海岸的黑曜石堡垒。
|tip 使用完整的The Waking Shores区域任务指南来完成这个任务以及The Shadow of His Wings任务
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
step
talk Vazallia##192662
|tip 她最终会降落在这个避难所，并变形为她的人形
问她_“你在这里干什么？”
观看对话
accept A Dragon's Day Off##65875 |goto The Waking Shores/0 20.14,39.54 |or
|tip 这个任务在你接受前没有任务标记
'|complete haspet(3342) |or
step
达到70级 |ding 70 |or
'|complete haspet(3342) |or
step
完成任务  "The Shadow of His Wings" |complete completedq(65691) or haspet(3342) |or
|tip 使用完整的The Waking Shores区域升级指南来完成这个。
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
step
accept Allegiance to One##66419 |goto The Waking Shores/0 24.51,55.83 |or
|tip 你选择哪个都没有关系。
|tip 你将被你选择的那个锁定一周。
'|complete haspet(3342) |or
step
talk Sabellian##185894
_Or_
talk Wrathion##187495
告诉他们  我发誓支持你们当前的努力
|tip 在阳台上
|tip 你将解锁一个额外的任务来获取你本周选择阵营的声望
支持Wrathion或Sabellian |q 66419/1 |goto 24.38,55.69 |or
'|complete haspet(3342) |or
step
accept Keys of Loyalty##66133 |or
accept Keys of Loyalty##66805 |or
|tip 根据你选择的阵营，你将自动接受其中一个任务
'|learnpet Spyragos##3342 |or
step
collect Restored Obsidian Key##191264 |n
|tip 将30片钥匙碎片和3片钥匙框架碎片组合成1把修复的黑曜石钥匙
|tip 这些碎片掉落于黑曜石城堡周围的怪物和稀有怪物。
talk Igys the Believer##187275
accept Unlocking Our Past##66129 |n |repeatable
use the Obsidian Cache##200069
|tip 每次你提交任务，你将获得一个。
collect Twilight Cache##201817 |n
|tip 这个可以从宝箱中掉落
use Twilight Cache##201817
collect Worldbreaker Membership##199215 |goto 32.28,52.49 |or
|tip 该物品是稀有掉落。
|tip 你可能需要打开几个暮光宝箱才能获得此物品
'|complete haspet(3342) |or
step
use the Worldbreaker Membership##199215
|tip 使用该物品后，它会被消耗并授予The Worldbreaker头衔和Worldbreaker Membership增益，持续2天。
获得Worldbreaker Membership增益 |havebuff Worldbreaker Membership##386848 |or
'|complete haspet(3342) |or
step
talk Dealer Vexil##193310
|tip 洞穴内部
buy Flameslinger Rum##197738 |q 65875/1 |goto The Waking Shores/0 34.74,46.73 |or
|tip 不要使用Flameslinger Rum，因为Dealer Vexil可能不会让你再买一个用于任务。
'|complete haspet(3342) |or
step
click Popfizz Punch##378820
|tip 它看起来像是沉没一半的沉船甲板上的一个小瓶。
collect Popfizz Punch##197737 |q 65875/3 |goto 39.29,38.33 |or
'|complete haspet(3342) |or
step
click Slam Bam Swill##379297
|tip 它看起来像是一个小瓶子 在树屋上的平台顶端 在山上的顶部
collect Slam Bam Swill##198045 |q 65875/5 |goto 46.92,30.71 |or
'|complete haspet(3342) |or
step
clicknpc Rampaging Wind##187494
use Kul Tiran Red##198047 |n
|tip 瞄准Rampaging Wind并点击Kul Tiran Red来投掷它。
collect Whirlwind Wine##198044 |q 65875/6 |goto 76.35,46.54 |or
你可以在[74.16,44.05]找到更多
'|complete haspet(3342) |or
step
talk Kora Fullsails##186454
|tip 她是库尔提拉斯女士，站在黑曜堡垒的Kaleson大副旁边。
buy Kul Tiran Red##198047 |goto 43.13,67.36 |or
'|complete haspet(3342) |or
step
talk Firstmate Kaleson##186752
|tip 他在黑曜石壁垒这片区域巡逻。
buy Happy Trigger Sour##197739 |q 65875/4 |goto 43.12,67.41 |or
'|complete haspet(3342) |or
step
talk Outfitter Tipech##188349
|tip 他在黑曜石王座平台上拉希奥那一边。
buy Stealthy Elven Port##198043 |q 65875/7 |goto 25.70,55.18 |or
'|complete haspet(3342) |or
step
click Riptide Brew##378054
|tip 洞穴里好像有个酒桶
|tip 你可能需要在洞穴内击杀溺亡者拉戈
collect Riptide Brew##195543 |q 65875/2 |goto 62.95,79.72 |or
'|complete haspet(3342) |or
step
talk Vazallia##192662
turnin A Dragon's Day Off##65875 |goto 20.14,39.55 |or
'|complete haspet(3342) |or
step
use Spyragos##198622
学习Spyragos战斗宠物 |learnpet Spyragos##3342
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Pale Baby Vorquin",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Behold! A pale vorquin.",
keywords={"Beast"},
pet=3335,
},[[
step
click Magical Creature Manual##384843
|tip 在建筑物内。
获得"难捕沃尔昆之视"增益 |complete hasbuff(396118) or haspet(3335) |goto The Azure Span/0 45.86,38.31
step
clicknpc Pale Baby Vorquin##191316
|tip 当你拥有这个5分钟增益时，你会在安东尼达斯营地周围找到这些
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习Pale Baby Vorquin战斗宠物 |learnpet Pale Baby Vorquin##3335 |goto The Azure Span/0 45.32,39.35
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Petal",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="When the Bushbeard clan decided they were going to have a wedding, they chose Petal to be the flower girl. She was spectacular.",
keywords={"Magic","Iskaara Tuskarr","Patchu"},
pet=3408,
},[[
step
collect 100 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3408) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Petal##200927 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3408) |or
step
use Petal##200927
学习宠物战斗宠物Petal |learnpet Petal##3408
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Troubled Tome",{
patch='100005',
source='Vendor',
author="support@zygorguides.com",
description="Do you dare to open this book of draconic secrets?",
keywords={"Magic","Iskaara Tuskarr","Patchu"},
pet=3416,
},[[
step
collect 200 Polished Pet Charm##163036 |or
|tip 从赢得BFA、暗影国度和龙岛区域奖励闪亮宠物符咒的宠物对战世界任务中获取。
'|complete haspet(3416) |or
step
talk Patchu##196069
告诉她 _ "想要互换一些宠物徽章吗？"
buy Troubled Tome##201707 |goto The Azure Span/0 13.89,49.85 |or
'|complete haspet(3416) |or
step
use Troubled Tome##201707
学习不安之书战斗宠物 |learnpet Troubled Tome##3416
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Crystalline Mini-Monster",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="A shard of a fragment of a piece of a sliver of a piece of crystal, but walking around like it owns the place. Good thing it likes you.",
keywords={"Magic","Achievement"},
pet=3264,
},[[
step
完成 "更多的小宠物" 成就 |achieve 15641 |or
|tip 收集1200个唯一宠物。
'|complete haspet(3264) |or
step
学习晶化小怪物战斗宠物 |learnpet Crystalline Mini-Monster##3264
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Living Mud Mask",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="The greatest souvenir available in a dragon's spa in the clouds. Not so good at facials any more, though.",
keywords={"Magic"},
pet=3405,
},[[
step
kill Mudgatu##197346
|tip 这是68级精英史莱姆在池塘里
|tip 你可能需要帮助。
collect Derelict Sunglasses##200586 |goto Thaldraszus/0 40.47,45.32 |or
'|complete haspet(3405) |or
step
use the Derelict Sunglasses##200586
accept Derelict Fashion##70377 |goto Thaldraszus/0 40.48,45.32
step
talk Zeldis##198062
|tip 在水池上方的悬崖上。
turnin Derelict Fashion##70377 |goto 39.50,48.47
step
talk Zeldis##198062
|tip 再和他对话。
告诉他 或者另外一个奖励
跟随Zeldis |q 72270 |goto 39.50,48.47 |future
step
talk Zeldis##198062
|tip 他躺在浮动平台的地上。
告诉他“你看起来像个亡灵，Zeldis。”
唤醒泽尔迪斯 |q 72351 |future |goto 39.33,46.79
step
talk Sneaky Mud Mask##198590
|tip 任务出现在你接近潜行泥浆面具时
|tip 小心地踏上树枝接受它
accept Special Treatment##72060 |goto 38.59,46.42
step
talk Zeldis##198062
turnin Special Treatment##72060 |goto 39.14,47.00
step
use the Living Mud Mask##200872
学习战斗宠物“活力泥面具” |learnpet Living Mud Mask##3405
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Lady Feathersworth",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="Though she may be fashionably late, Lady Feathersworth will always show up for a party.",
keywords={"Magic","Achievement"},
pet=3406,
},[[
step
完成成就"龙岛的家族斗士" |achieve 16512 |or
|tip 使用25级满级宠物队伍战胜巨龙群岛的8个精英宠物与驯宠师
|tip 前往每个训练师并击败他们10次，每次用一个满编单一宠物类型的队伍
|tip 宠物也必须是25级。
训练师可以在：
Patchu [碧蓝林海/0 13.89,49.85]
阿坎图斯 [碧蓝林海/0 40.98,59.41]
巴库夏克 [欧恩哈拉平原/0 61.96,41.59]
斯托玛穆 [欧恩哈拉平原/0 24.41,42.36]
埃纽博恩 [萨尔德拉苏斯/0 39.46,73.54]
赛提莫斯 [索德拉苏斯/0 56.27,49.26]
Haniko [觉醒海岸/0 38.91,83.27]
Swog [觉醒海岸/0 26.17,92.39]
|tip Swog在洞穴里面。
'|complete haspet(3406) |or
step
学习 Lady Feathersworth 战斗宠物 |learnpet Lady Feathersworth##3406
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Lord Basilton",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="A brilliant executive assistant and apprentice, Lord Basilton also loves to stick his nose into piles of anything interesting.",
keywords={"Magic","Carry On, Basilton"},
pet=3350,
},[[
step
达到等级68 |ding 68 |or
|tip 这个宠物是从包含在"完整版区域（剧情+支线任务）"升级指南中的一个可选支线任务中获取的
|tip 如果你想完成所有的剧情和支线任务，请打开The Azure Span的完整指南
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)" |or
'|complete haspet(3350) |or
step
talk Tender Xina##189364
|tip 他在这个区域巡逻。
accept Garden Variety##72189 |goto Thaldraszus/0 77.43,67.31
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin Garden Variety##72189 |goto Thaldraszus/0 37.86,75.46
accept Azeroth Pest Control##66134 |goto Thaldraszus/0 37.86,75.46
step
kill 8 Agitated Seedling##187687 |q 66134/1 |goto 37.77,75.26
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin Azeroth Pest Control##66134 |goto 37.86,75.47
accept The Gardener's Apprentice##66135 |goto 37.86,75.47
step
click Garden Junk
|tip 在建筑物内。
accept One Drakonid's Junk##66278 |goto 38.91,74.25
step
寻找巴希尔顿领主 |q 66135/1 |goto 38.87,74.17
|tip 点击建筑物内的各种物品
|tip 在你点击最后一个物品之后找到他，搜寻所有物品。
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin The Gardener's Apprentice##66135 |goto 37.86,75.46
turnin One Drakonid's Junk##66278 |goto 37.86,75.46
accept Elemental Extract##66136 |goto 37.86,75.46
accept Lashing Out##66137 |goto 37.86,75.46
accept New Kid on the Clock##66279 |goto 37.86,75.46
step
clicknpc Lord Basilton##187400
|tip 在开放式建筑里
让巴希尔顿嗅你的手 |q 66279/1 |goto 37.88,75.44
step
击杀此区域周围的敌人
|tip 它们看起来像水元素。
collect 5 Watery Essence##191473 |q 66136/1 |goto 37.11,71.19
step
talk Orizmu##187310
带怀表去花园交给奥里兹姆 |q 66279/2 |goto 35.24,72.64
step
talk Orizmu##187310
turnin New Kid on the Clock##66279 |goto 35.24,72.64
accept Like Sands Through the Hourglass##66138 |goto 35.24,72.64
step
click Pile of Windswept Time Sand+
|tip 它们看起来像这个区域地面上的棕色土堆。
|tip 可能受到攻击
收集#8#堆被风吹过的时间砂 |q 66138/1 |goto 36.02,72.73
step
talk Orizmu##187310
turnin Like Sands Through the Hourglass##66138 |goto 35.24,72.64
step
击杀此区域周围的敌人
|tip 它们看起来像是行走的植物
击杀 #10# 鞭笞者 |q 66137/1 |goto 34.45,72.41
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin Elemental Extract##66136 |goto 37.86,75.46
turnin Lashing Out##66137 |goto 37.86,75.46
accept Flame at Last##66139 |goto 37.86,75.46
step
use the Concentrated Essence of Water##191676
|tip 对烈焰打击使用它。
|tip 看起来像个大型火元素。
|tip 它会变得虚弱、更容易被击杀。
kill Blazing Inferno##189043 |q 66139/2 |goto 35.63,75.23
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin Flame at Last##66139 |goto 37.86,75.46
accept Carry On, Basilton##66412 |goto 37.86,75.46
step
clicknpc Lord Basilton##187400
|tip 在开放式建筑里
与巴斯尔顿领主交谈 |q 66412/1 |goto 37.88,75.44
step
talk Gryrmpech##187300
|tip 在开放式建筑里
turnin Carry On, Basilton##66412 |goto 37.86,75.46
step
use Lord Basilton##194098
学习巴兹尔顿领主战斗宠物 |learnpet Lord Basilton##3350
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Alvin the Anvil",{
patch='100005',
source='Crafted',
author="support@zygorguides.com",
description="When Alvin said he wanted to be the best anvil ever, everyone doubted him. If anvils could laugh, he'd be the one laughing now.",
keywords={"Mechanical","Dragon Isles","Blacksmithing","Crafted"},
pet=3274,
},[[
step
collect Alvin the Anvil##191886 |or
|tip 这可以用巨龙群岛锻造在技能50时制作。
|tip 你也可以从拍卖行购买。
'|complete haspet(3274) |or
step
use Alvin the Anvil##191886
学习战斗宠物Alvin the Anvil |learnpet Alvin the Anvil##3274
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Briarhorn Hatchling",{
patch='100105',
source='Vendor',
author="support@zygorguides.com",
description="Loves: Broccoli, playing, and smashing things. Hates: Meat, sleeping, and mean Titan Keepers who won't let you smash things.",
keywords={"Mechanical"},
pet=4255,
},[[
step
获取 #2750# 超因果碎片 |earn 2750 Paracausal Flakes##2594 |or
|tip 通过完成时间裂隙来获得这些。
|tip 使用Time Rifts指南完成此任务
点击此处加载Time Rifts指南 |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Sorotis##208343
buy 1 Briarhorn Hatchling##208012 |goto Thaldraszus/0 51.09,56.58 |or
'|learnpet Briarhorn Hatchling##4255 |or
step
use the Briarhorn Hatchling##208012
学习Briarhorn Hatchling战斗宠物 |learnpet Briarhorn Hatchling##4255
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\The Quackcestor",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="This is not your grandfather's duck! Or.. maybe it is?",
keywords={"Undead"},
pet=3389,
},[[
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip 交上大型狩猎的狩猎战利品以获取声望。
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
提高与马鲁克半人马的名望等级到7级 |complete factionrenown(2503) >= 7 or haspet(3389)
|tip 在欧恩哈拉平原完成日常任务、每周任务和区域任务以获得声望
|tip 你也可以在Aylaag Outpost每次他们在新地点设营时完成任务
step
kill Eternal Sand##187475+
collect 1 Occasional Sand##194562 |goto Thaldraszus/0 57.60,82.60 |or
|tip 你也可以从拍卖行购买这些。
'|complete haspet(3389) |or
step
earn 50 Dragon Isles Supplies##2003 |or
|tip 通过完成世界任务、周常任务和日常任务来收集这些。
|tip 你也可以通过击杀稀有怪或打开宝藏来收集它们
'|complete haspet(3389) |or
step
talk Quartermaster Huseng##196707
|tip 在建筑物内。
buy Essence of Awakening##201323 |goto Ohn'ahran Plains/0 60.40,37.60 |or
'|complete haspet(3389) |or
step
use the Essence of Awakening##201323
|tip 在这个位置使用它。
获得觉醒精华增益效果 |complete hasbuff(369277) or haspet(3389) |goto Ohn'ahran Plains/0 43.05,46.91
|tip 你将获得一个持续一小时的增益效果，使你可以看到并与The Quackcestor战斗宠物进行战斗
step
clicknpc The Quackcestor##197063
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
学习The Quackcestor战斗宠物 |learnpet The Quackcestor##3389 |goto Ohn'ahran Plains/0 60.62,57.39
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Ghostflame",{
patch='100005',
source='Quest',
author="support@zygorguides.com",
description="A dream of the memory of fire.",
keywords={"Undead"},
pet=3287,
},[[
step
完成成就 Waking Hope。 |confirm |complete achieved(16334) or haspet(3287)
|tip 完成所有主线任务
|tip 使用完整区域升级指南来完成这个
点击此处加载Full Zones（主线任务+支线任务）升级指南 |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
step
达到70级 |ding 70
step
earn 1000 Elemental Overflow##2118 |or
|tip 这些掉落自受到元素风暴影响的区域中的怪物
'|complete haspet(3287) |or
step
talk Mythressa##196516
|tip 她是一个龙希尔在建筑物里面
buy Ghostflame##200173 |goto Valdrakken/0 38.10,37.72 |or
'|complete haspet(3287) |or
step
use Ghostflame##200173
学习幽灵焰战斗宠物 |learnpet Ghostflame##3287
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Dream Badger",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="A brown dream badger is a rare sight. Not so rare a smell though.",
keywords={"Critter"},
pet=4304,
},[[
step
map The Emerald Dream/0
path	48.86,57.94	49.98,54.53	51.40,57.75	53.70,59.48	52.69,77.74
跟随路径
|tip 沿着小径寻找梦境獾
clicknpc Dream Badger##212557
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Dream Badger战斗宠物 |learnpet Dream Badger##4304
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Flooftalon",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="The first thing you might notice about this creature is its huge expressive eyes. This is a mistake. Instead focus on its razor-sharp claws.",
keywords={"Beast"},
pet=4275,
},[[
step
clicknpc Flooftalon##211110
|tip 你可能需要击杀这些的小动物版才能让战斗宠物版出现。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Flooftalon战斗宠物 |learnpet Flooftalon##4275 |goto The Emerald Dream/0 47.04,73.84
周围可以找到更多:
[48.80,74.51]
[48.85,76.55]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fol'ya Pup",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="Keep it out of your backpack or it will eat all your food and then take a nap.",
keywords={"Critter"},
pet=4276,
},[[
step
clicknpc Fol'ya Pup##211177
|tip 他们可以在整个区域作为前线战斗人员找到。
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Fol'ya幼犬战斗宠物 |achieve 19401/3 |goto The Emerald Dream/0 50.96,62.13
捕捉"Fol'ya Pup"战斗宠物 |learnpet Fol'ya Pup##4276
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Leyhart",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="This little one likes cheese, but most fawn do.",
keywords={"Critter"},
pet=4278,
},[[
step
clicknpc Leyhart##211288
|tip 这些在这个区域遍布
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Leyhart战斗宠物 |learnpet Leyhart##4278 |goto The Emerald Dream/0 52.79,65.58
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Pewling",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="If you think the skunks of the Emerald Dream smell bad, pray that you never smell the skunks of the Emerald Nightmare.",
keywords={"Critter"},
pet=4280,
},[[
step
clicknpc Pewling##211302
|tip 这些在这个区域遍布
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Pewling战斗宠物 |learnpet Pewling##4280 |goto The Emerald Dream/0 52.35,64.44
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Sapnibbler",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="Sapnibblers are always up for a game of hide and squeak.",
keywords={"Critter"},
pet=4277,
},[[
step
clicknpc Sapnibbler##211182
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉魔兽世界战斗宠物Sapnibbler |learnpet Sapnibbler##4277 |goto The Emerald Dream/0 55.25,72.32
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Slumbertooth",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="As younglings, these critters need a lot of naps. Fortunately, adventurers' backpacks make good napping spots.",
keywords={"Beast"},
pet=4279,
},[[
step
clicknpc Slumbertooth##211295
|tip 这个宠物在超级绽放期间更常出现。
|tip 击杀这里的瞌睡牙小动物。
|tip 最终一个可捕捉的会刷新
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉“沉睡牙”战斗宠物 |learnpet Slumbertooth##4279 |goto The Emerald Dream/0 44.41,72.20
你可以在这里找到更多：
[50.13,78.04]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Snaggletoof",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="Such toof. Such snaggle.",
keywords={"Beast"},
pet=4303,
},[[
step
map The Emerald Dream/0
path loop off; bounce
path	25.53,22.90	57.71,26.31	49.74,47.80	37.46,57.65
path	33.58,68.88
跟随路径
|tip 你可能需要击杀这些的小动物版才能让战斗宠物版出现。
clicknpc Snaggletoof##212459
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉Snaggletoof战斗宠物 |learnpet Snaggletoof##4303
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Pale Slumbertooth",{
patch='100200',
source='PetBattle',
author="support@zygorguides.com",
description="These creatures live in bushes and near trees, but they sleep so soundly they're practically invisible. If you want to interrupt their dreaming, you'd best bring friends.",
keywords={"Beast"},
pet=4302,
},[[
step
talk Celestine of the Harvest##210608
|tip 她与梦境涌动营地同行。
buy Friendsurge Defenders##209944 |or
|tip 这需要 500 梦涌合剂
|tip 完成每周梦境涌动任务，稀有，关闭传送门，一些世界任务，龙岛补给点，和通过可能出现的绿色光球来收集它们
'|achieve 19401/5 |or
step
use the Friendsurge Defenders##209944
获得Friendsurge Defenders增益 |complete hasbuff(423865) |or
|tip 效果持续30分钟
'|achieve 19401/5 |or
step
map The Emerald Dream/0
path loop off; bounce
path	58.47,35.07	53.61,65.31	48.36,69.42	35.75,62.29	34.60,62.26
path	34.31,67.65
跟随路径
clicknpc Pale Slumbertooth##212437
|tip 他们会藏在草丛中
|tip 将其生命值降低到35%以下并使用你的宠物栏中的Trap技能
|tip 你可能需要多次尝试陷阱。
捕捉苍白的沉眠之牙战斗宠物 |learnpet Pale Slumbertooth##4302
]])
