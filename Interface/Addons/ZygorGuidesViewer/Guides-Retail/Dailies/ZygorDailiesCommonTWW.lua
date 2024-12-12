local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("DailiesCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Azj'Kahet Weekly Pacts",{
author="support@zygorguides.com",
description="This guide will assist you in completing the weekly pact quest for The Weaver, The General, and The Vizier.",
startlevel=80,
patch='110002',
},[[
step
使用 “断裂的丝线 ”使声望达到 3 级 |complete factionrenown(2600) >= 3 |q 84681 |future
|tip 在 Azj-Kahet 完成每日任务、每周任务和区域任务以获得声望。
step
talk Widow Arak'nai##207471
accept Of Pacts and Patrons##84682 |goto Azj-Kahet/0 55.73,43.83
|only if not completedq(84682)
step
talk Bobbin##224734
告诉它_“告诉我与编织者签订契约的事。”_ |gossip 124125
了解编织者契约 |q 84682/1 |goto Azj-Kahet/0 56.37,43.33
|only if not completedq(84682)
step
talk Tulumun##224733
告诉他_“告诉我与大臣签订契约的事”_。 |gossip 124127
了解宰相契约 |q 84682/3 |goto Azj-Kahet/0 56.20,42.24
|only if not completedq(84682)
step
talk Anub'okki##224729
告诉他_“告诉我与将军签订契约的事”。 |gossip 124123
了解将军契约 |q 84682/2 |goto Azj-Kahet/0 55.88,42.13
|only if not completedq(84682)
step
talk Y'tekhi##220867
告诉他_“选择一名‘断线’成员与之缔结盟约”_。 |gossip 124129
|tip 每周重置时，您都可以选择一个新的契约。
|tip 明智地选择吧，因为这个选择会影响你本周的整个战队。
|tip 您不能在别名上选择不同的契约。
缔结盟约 |q 84682/4 |goto Azj-Kahet/0 55.33,41.22
|only if not completedq(84682)
step
talk Y'tekhi##220867
turnin Of Pacts and Patrons##84682 |goto Azj-Kahet/0 55.33,41.22
|only if not completedq(84682)
step
talk Y'tekhi##220867
accept Forge a Pact##80592 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
talk Y'tekhi##220867
告诉她_“选择一名‘断裂之线’的成员来更新你的契约”_。 |gossip 122838
|tip 每周重置时，您都可以选择一个新的契约。
|tip 明智地选择吧，因为这个选择会影响你本周的整个战队。
|tip 您不能在别名上选择不同的契约。
选择契约 |q 80592/1 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
talk Y'tekhi##220867
turnin Forge a Pact##80592 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
label "Accept_Weekly_Pact_Quest"
talk Y'tekhi##220867
|autoacceptany 80672,80671,80670
接受每周契约任务 |complete haveq(80672,80671,80670) or completedq(80672,80671,80670) |goto Azj-Kahet/0 55.33,41.22
step
完成 Azj-Kahet 中的活动 |q 80672/1 |goto Azj-Kahet/0 55.33,41.22
|tip 完成世界任务，每次贡献 20%。
|tip 您还可以调查间谍传闻或在墓穴中发现织鼠藏匿处。
|only if haveq(80672) or completedq(80672)
step
完成 Azj-Kahet 中的活动 |q 80671/1 |goto Azj-Kahet/0 55.33,41.22
|tip 完成世界任务，每次贡献 20%。
|tip 您还可以调查间谍传闻或在墓穴中发现织鼠藏匿处。
|only if haveq(80671) or completedq(80671)
step
完成 Azj-Kahet 中的活动 |q 80670/1 |goto Azj-Kahet/0 55.33,41.22
|tip 完成世界任务，每次贡献 20%。
|tip 您还可以调查间谍传闻或在墓穴中发现织鼠藏匿处。
|only if haveq(80670) or completedq(80670)
step
talk Tulumun##224733
turnin Hand of the Vizier##80672 |goto Azj-Kahet/0 56.20,42.24
|only if haveq(80672) or completedq(80672)
step
talk Anub'okki##224729
turnin Blade of the General##80671 |goto Azj-Kahet/0 55.89,42.14
|only if haveq(80671) or completedq(80671)
step
talk Bobbin##224734
turnin Eyes of the Weaver##80670 |goto Azj-Kahet/0 56.37,43.33
|only if haveq(80670) or completedq(80670)
step
您已完成 Azj-Kahet 的每周盟约任务
|tip 您可以在下一次每周重置时缔结新的契约。
|tip 当可以缔结新契约时，本指南将自动重置。
'|complete not haveq(80672,80671,80670) and not completedq(80672,80671,80670) |next "Accept_Weekly_Pact_Quest"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Azj'Kahet World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in the Azj'Kahet.",
condition_valid=function() return completedq(79573) end,
condition_valid_msg="You must complete the \"Surface Bound\" quest in The War Within campaign on at least one character to unlock world quests.",
startlevel=70,
worldquestzone={2255,2256,2213,2216},
patch='110002',
},[[
step
talk Widow Arak'nai##207471
accept Of Pacts and Patrons##84682 |goto Azj-Kahet/0 55.73,43.83
|only if not completedq(84682)
step
talk Bobbin##224734
告诉它_“告诉我与编织者签订契约的事。”_ |gossip 124125
了解编织者契约 |q 84682/1 |goto Azj-Kahet/0 56.37,43.33
|only if not completedq(84682)
step
talk Tulumun##224733
告诉他_“告诉我与大臣签订契约的事”_。 |gossip 124127
了解宰相契约 |q 84682/3 |goto Azj-Kahet/0 56.20,42.24
|only if not completedq(84682)
step
talk Anub'okki##224729
告诉他_“告诉我与将军签订契约的事”。 |gossip 124123
了解将军契约 |q 84682/2 |goto Azj-Kahet/0 55.88,42.13
|only if not completedq(84682)
step
talk Y'tekhi##220867
告诉他_“选择一名‘断线’成员与之缔结盟约”_。 |gossip 124129
|tip 每周重置时，您都可以选择一个新的契约。
|tip 明智地选择吧，因为这个选择会影响你本周的整个战队。
|tip 您不能在别名上选择不同的契约。
缔结盟约 |q 84682/4 |goto Azj-Kahet/0 55.33,41.22
|only if not completedq(84682)
step
talk Y'tekhi##220867
turnin Of Pacts and Patrons##84682 |goto Azj-Kahet/0 55.33,41.22
|only if not completedq(84682)
step
talk Y'tekhi##220867
accept Forge a Pact##80592 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
talk Y'tekhi##220867
告诉她_“选择一名‘断裂之线’的成员来更新你的契约”_。 |gossip 122838 |noautogossip
|tip 每周重置时，您都可以选择一个新的契约。
|tip 明智地选择吧，因为这个选择会影响你本周的整个战队。
|tip 您不能在别名上选择不同的契约。
选择契约 |q 80592/1 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
talk Y'tekhi##220867
turnin Forge a Pact##80592 |goto Azj-Kahet/0 55.33,41.22
|only if completedq(84682)
step
label "Choose_World_Quest"
#include "TWW_Choose_World_Quests"
step
label quest-78974
accept Beetle-Minded##78974 |goto Azj-Kahet/0 73.02,81.53
|tip 您将自动接受此任务。
|polish
stickystart "Fill_Food_Troughs"
step
clicknpc Stagshell Water Trough##214424+
|tip 在这个区域周围的地面上，它们看起来像长长的木箱。
填满 #4# 水槽 |q 78974/1 |goto Azj-Kahet/0 73.02,81.53
step
label "Fill_Food_Troughs"
clicknpc Stagshell Food Trough##214412+
|tip 在这个区域周围的地面上，它们看起来像长长的木箱。
填满 #4# 食物槽 |q 78974/2 |goto Azj-Kahet/0 73.02,81.53
|next "TWW_World_Quest_Emissaries"
step
label quest-82526
accept Bug Them##82526 |goto Nerub'ar/1 68.93,40.61
|tip 您将自动接受此任务。
step
click Insectformant+
|tip 它们看起来像附着在此区域周围物体上的半透明黄色虫子。
|tip 它们会以黄点的形式出现在您的小地图上。
放置 #6# 虫子 |q 82526/1 |goto Nerub'ar/1 68.93,40.61
|next "TWW_World_Quest_Emissaries"
step
label quest-82364
accept Documenting Discordance##82364 |goto Azj-Kahet/1 61.53,75.98
|tip 您将自动接受此任务。
step
clicknpc Shrouded Skysilk##223809
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
骑上笼罩的天丝 |q 82364/1 |goto Azj-Kahet/1 61.53,75.98
step
拍摄不和谐 |q 82364/2
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
|next "TWW_World_Quest_Emissaries"
step
label quest-83718
accept Eggstraction##83718 |goto Azj-Kahet/0 79.79,79.96
|tip 您将自动接受此任务。
step
click Climbing Gear
获取攀岩装备 |q 83718/1 |goto Azj-Kahet/0 79.79,79.96
step
click Handhold
在悬崖上寻找抓手 |q 83718/2 |goto Azj-Kahet/0 79.81,79.97
step
click Swarmite Egg+
|tip 它们看起来像被困在岩壁蛛网中的大蛋。
|tip 点击扶手可以爬上岩壁，点击扶手可以从岩壁上挖掘出文物。
|tip 避开会降低你的抓地力的{o}虫群。
收集 #7# 虫卵 |q 83718/3 |goto Azj-Kahet/0 79.89,79.98
|next "TWW_World_Quest_Emissaries"
step
label quest-82481
accept Enforcer Extermination##82481 |goto Azj-Kahet/0 55.97,54.98
|tip 您将自动接受此任务。
|polish
step
杀死周围的苍白虫敌人 |kill Webwarden Enforcer##223361,Pale Weavelasher Apprentice##223364,Pale Weavelasher Grunt##223363
杀死 #12# 苍白波浪虫 |q 82481/1 |goto Azj-Kahet/0 55.97,54.98
|next "TWW_World_Quest_Emissaries"
step
label quest-82536
accept Exfiltration Operation##82536 |goto Nerub'ar/1 58.37,66.49
|tip 您将自动接受此任务。
|polish
step
clicknpc Conscripted Ascendant##225660+
释放 #12# 被征召的后裔 |q 82536/1 |goto Nerub'ar/1 58.37,66.49
|next "TWW_World_Quest_Emissaries"
step
label quest-82524
accept Exterminate##82524 |goto Azj-Kahet/0 62.69,28.88
|tip 您将自动接受此任务。
step
杀死此区域周围的敌人 |kill Kaheti Threadmancer##214939,Kaheti Skirmisher##214940,Kaheti Overseer##214941,Dependable Skitterling##222153
杀死 #15# 奈鲁比安人 |q 82524/1 |goto Azj-Kahet/0 62.69,28.88
|next "TWW_World_Quest_Emissaries"
step
label quest-82324
accept Grub Run##82324 |goto Azj-Kahet/0 39.28,40.92
|tip 您将自动接受此任务。
|polish
step
clicknpc Razormouth Grub##223671+
|tip 他们看起来像紫色的蠕虫，长着牙齿和尖刺，就在这个区域周围的洞穴里。
|tip 定期停下来让震颤感应条下降，避免它充满你的震颤感应条。
|tip 满格会产生攻击你的敌人。
收集 #10# 剃刀嘴蛴螬 |q 82324/1 |goto Azj-Kahet/0 39.28,40.92
|next "TWW_World_Quest_Emissaries"
step
label quest-79722
accept Gutter Work##79722 |goto Azj-Kahet/0 57.45,68.48
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Adolchomper##217724,Gutter Scarfer##217717,Drooling Salamuncher##217720,Gutter Gorger##217718
搜刮萨林水沟 |q 79722/1 |goto Azj-Kahet/0 57.45,68.48
|next "TWW_World_Quest_Emissaries"
step
label quest-82468
accept Let Them Win##82468 |goto Azj-Kahet/0 29.26,41.97
|tip 您将自动接受此任务。
step
杀死此区域周围的敌人 |kill Skitterling##217991,Slam Scavenger##217997,Kaheti Silksinger##215711,Kaheti Preysnatcher##215170
|tip 您还可以在空中飞过金环，获得圣枪 BUFF。
|tip 当你拥有这个 BUFF 时，你可以飞过漂浮在空中的地雷，安全地引爆它们。
|tip 在未获得该 BUFF 的情况下击中地雷会让你下马。
扭转对奈鲁比人的战局 |q 82468/1 |goto Azj-Kahet/0 29.26,41.97
|next "TWW_World_Quest_Emissaries"
step
label quest-82297
accept One Hungry Worm##82297 |goto Azj-Kahet/0 53.09,31.58
|tip 您将自动接受此任务。
step
clicknpc Zaedu##223406
在宠物战中击败扎伊杜 |q 82297/1 |goto Azj-Kahet/0 53.09,31.58
|next "TWW_World_Quest_Emissaries"
step
label quest-82521
accept Pawns of Dark Masters##82521 |goto Azj-Kahet/1 64.81,82.38
|tip 您将自动接受此任务。
step
click Black Blood Extractor
|tip 他们看起来像大型机器，从这一区域周围的地面上生长的植物中吸取血液。
|tip 这将让你看到不和谐生物。
|tip 不要点击和谐之器，否则会重置你的堆叠。
杀死此区域周围的敌人 |kill Discordant Skitterling##223116,Tentacle Slime##220656
杀死不和谐生物 |q 82521/1 |goto Azj-Kahet/1 64.81,82.38
|next "TWW_World_Quest_Emissaries"
step
label quest-81824
accept Skyrider Racing - City of Threads Twist##81824 |goto Nerub'ar/1 27.01,7.92
|tip 高高的岩石上。
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219564
告诉她_“我想试试这个路线”_ |gossip 121287 |noautogossip
准备比赛 |havebuff Race Starting##439300 |goto Nerub'ar/1 27.01,7.92 |q 81824
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Nerub'ar/1 27.39,7.76 |q 81824
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81824/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81825
accept Skyrider Racing - Maddening Deep Dip##81825 |goto Azj-Kahet/0 77.92,79.65
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219565
告诉他 _“我想试试这条路”_。 |gossip 121290 |noautogossip
准备比赛 |havebuff Race Starting##439301 |goto Azj-Kahet/0 77.92,79.65 |q 81825
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Azj-Kahet/0 77.90,79.78 |q 81825
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81825/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81829
accept Skyrider Racing - Pit Plunge##81829 |goto Azj-Kahet/0 23.81,48.35
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219569
告诉她_“我想试试这个路线”_ |gossip 121299 |noautogossip
准备比赛 |havebuff Race Starting##439304 |goto Azj-Kahet/0 23.81,48.35 |q 81829
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Azj-Kahet/0 23.92,48.49 |q 81829
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81829/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81828
accept Skyrider Racing - Rak-Ahat Rush##81828 |goto Azj-Kahet/0 71.34,36.36
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219568
告诉他 _“我想试试这条路”_。 |gossip 121296 |noautogossip
准备比赛 |havebuff Race Starting##439303 |goto Azj-Kahet/0 71.34,36.36 |q 81828
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Azj-Kahet/0 71.47,36.44 |q 81828
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81828/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81831
accept Skyrider Racing - Siegehold Scuttle##81831 |goto Azj-Kahet/0 40.18,32.20
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219570
告诉她_“我想试试这个路线”_ |gossip 121281 |noautogossip
准备比赛 |havebuff Race Starting##439305 |goto Azj-Kahet/0 40.18,32.20 |q 81831
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Azj-Kahet/0 40.31,32.07 |q 81831
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81831/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81827
accept Skyrider Racing - The Weaver's Wing##81827 |goto Azj-Kahet/0 52.95,36.19
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219567
告诉她_“我想试试这个路线”_ |gossip 121293 |noautogossip
准备比赛 |havebuff Race Starting##439302 |goto Azj-Kahet/0 52.95,36.19 |q 81827
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Azj-Kahet/0 52.98,36.33 |q 81827
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81827/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-82387
accept Slay the Goo, Save the World##82332 |goto Azj-Kahet/1 65.21,82.54
|tip 您将自动接受此任务。
|polish
step
click Black Blood Extractor
|tip 他们看起来像大型机器，从这一区域周围的地面上生长的植物中吸取血液。
|tip 不要点击和谐之器，否则会重置你的堆叠。
拥有 50 堆或更多 “看似平移”（Unseeming Shift）。 |q 82387/1 |goto Azj-Kahet/1 65.21,82.54
step
kill Warped Sapling##220655 |q 82387/3 |goto Azj-Kahet/1 63.17,85.13
|tip 不要点击和谐之器，否则会重置你的堆叠。
|tip 这个敌人是精英，可能需要组队。
step
kill 1 Aberrant Deepwalker##220653 |q 82387/4 |goto Azj-Kahet/1 65.34,88.16
|tip 不要点击和谐之器，否则会重置你的堆叠。
|tip 这个敌人是精英，可能需要组队。
step
kill 1 Faceless One##223119 |q 82387/2 |goto Azj-Kahet/1 65.82,83.92
|tip 不要点击和谐之器，否则会重置你的堆叠。
|tip 这个敌人是精英，可能需要组队。
|next "TWW_World_Quest_Emissaries"
step
label quest-82531
accept Special Assignment: Bombs from Behind##82531 |goto Azj-Kahet/0 56.66,47.34
|tip 您将自动接受此任务。
step
clicknpc Stolen Skiff##226416
装备一艘快艇 |q 82531/1 |goto Azj-Kahet/0 56.66,47.34
step
击杀车队部队 |q 82531/2 |goto Azj-Kahet/0 61.88,36.92
|tip 使用车辆栏上的能力摧毁下面的部队。
|tip 第一个按钮会投掷炸弹，第二个按钮会让你返回平台。
|next "TWW_World_Quest_Emissaries"
step
label quest-78995
accept Truffle Shuffle##78995 |goto Azj-Kahet/0 70.02,77.86
|tip 您将自动接受此任务。
|polish
step
click Volatile Soil+
|tip 它们看起来就像这个区域周围地面上一小堆冒烟的泥土。
click Volatile Kaheti Truffle+
|tip 它们看起来就像推翻泥土后产生的蘑菇群。
收集 #5# Kaheti 松露 |q 78995/1 |goto Azj-Kahet/0 70.02,77.86
|next "TWW_World_Quest_Emissaries"
step
label quest-82332
accept Unassuming Delivery Spider##82332 |goto Nerub'ar/1 53.00,22.90
|tip 您将自动接受此任务。
|polish
step
运送补给品 |q 82332/1 |goto Nerub'ar/1 53.00,22.90
|tip 点击城市中的各种补给物品。
|tip 它们会以黄点的形式出现在您的小地图上。
|tip 拾取后，将它们飞到建筑物内，并走到里面的 NPC 附近。
在 [Nerub'ar/1 58.27,32.74] 处的建筑内运送物资。
|next "TWW_World_Quest_Emissaries"
step
label quest-79958
accept Worm Sign, Sealed, Delivered##79958 |goto Azj-Kahet/0 72.83,77.44
|tip 您将自动接受此任务。
step
click Worm Chow+
|tip 你移动得越多，附近的蠕虫攻击你的几率就越大。
放置食物 |q 79958/1 |goto Azj-Kahet/0 73.53,76.15 |count 1
step
click Worm Chow+
|tip 放在洞穴内。
|tip 你移动得越多，附近的蠕虫攻击你的几率就越大。
放置食物 |q 79958/1 |goto Azj-Kahet/0 73.19,74.94 |count 2
step
click Worm Chow+
|tip 你移动得越多，附近的蠕虫攻击你的几率就越大。
放置食物 |q 79958/1 |goto Azj-Kahet/0 71.83,78.18 |count 3
step
click Worm Chow+
|tip 放在洞穴内。
|tip 你移动得越多，附近的蠕虫攻击你的几率就越大。
放置食物 |q 79958/1 |goto Azj-Kahet/0 73.85,79.13 |count 4
|next "TWW_World_Quest_Emissaries"
step
label quest-79959
accept Wormcraft Rumble##79959 |goto Azj-Kahet/0 74.10,82.45
|tip 您将自动接受此任务。
|polish
step
kill Shyalude##223834 |q 79959/1 |goto Azj-Kahet/0 74.10,82.45
|next "TWW_World_Quest_Emissaries"
step
label quest-82295
accept Ziriak##82295 |goto Nerub'ar/0 61.29,36.96
|tip 您将自动接受此任务。
step
talk Ziriak##223442
告诉它_“开始宠物战斗”_。 |gossip 122403 |noautogossip
在宠物战中击败 Ziriak |q 82295/1 |goto Nerub'ar/0 61.29,36.96
|next "TWW_World_Quest_Emissaries"
step
label "TWW_World_Quest_Emissaries"
#include "TWW_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Hallowfall World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in the Hallowfall.",
condition_valid=function() return completedq(79573) end,
condition_valid_msg="You must complete the \"Surface Bound\" quest in The War Within campaign on at least one character to unlock world quests.",
startlevel=70,
worldquestzone={2215},
patch='110002',
},[[
step
label "Choose_World_Quest"
#include "TWW_Choose_World_Quests"
step
label quest-82254
accept Aquacalypse##82254 |goto Hallowfall/0 46.33,14.95
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Drowned Arathi##213335,Droopfin##213716,Murkfin Ravager##213621,Murkfin Sciomancer##213619,Murkfin Depthstalker##213622
杀死 #12# Kobyss 攻击者 |q 82254/1 |goto Hallowfall/0 46.33,14.95
|next "TWW_World_Quest_Emissaries"
step
label quest-82041
accept Beledar's Blessing##82041 |goto Hallowfall/0 24.40,61.01
|tip 您将自动接受此任务。
|polish
step
click Climbing Gear
获取攀岩装备 |q 82041/1 |goto Hallowfall/0 24.40,61.01
step
click Handhold
在悬崖上寻找抓手 |q 82041/2 |goto Hallowfall/0 24.43,61.02
step
click Radiant Cluster+
|tip 它们看起来像岩壁上的大块金色晶体。
|tip 点击扶手可以爬上岩壁，点击扶手可以从岩壁上挖掘出文物。
|tip 避开会降低你抓地力的刺蜂群。
收集 #7# 辐射簇 |q 82041/3 |goto Hallowfall/0 24.80,61.66
|next "TWW_World_Quest_Emissaries"
step
label quest-82257
accept Burrow Burial##82257 |goto Hallowfall/0 70.04,58.70
|tip 您将自动接受此任务。
|polish
step
click Nerubian Burrow##411984+
|tip 它们看起来就像这个区域周围地面上的大堆泥土。
kill Dreadstrike Ambusher##217481+
|tip 它们会在摧毁一个洞穴后产生。
摧毁 #5# 奈鲁比人洞穴 |q 82257/1 |goto Hallowfall/0 70.04,58.70
|next "TWW_World_Quest_Emissaries"
step
label quest-82133
accept Documenting: Field Manual Edition##82133 |goto Hallowfall/0 39.88,74.73
|tip 您将自动接受此任务。
|polish
step
clicknpc Cataloger's Disc##222930
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
骑乘盗贼间谍圆盘 |q 82133/1 |goto Hallowfall/0 39.88,74.73
step
拍摄不和谐 |q 82133/2
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
|next "TWW_World_Quest_Emissaries"
step
label quest-81862
accept Feline Frenzy##81862 |goto Hallowfall/0 41.98,58.11
|tip 您将自动接受此任务。
|polish
step
clicknpc Imperial Lynx##221712
骑乘帝国山猫 |q 81862/1 |goto Hallowfall/0 41.98,58.11
step
为猞猁充能 |q 81862/2 |goto Hallowfall/0 42.47,53.50
|tip 使用 “咆哮 ”和 “扑击 ”能力建立进度条。
|tip 如果你的山猫停了下来，使用 “摇晃 ”直到它重新开始移动。
|tip 跑过梅雷尔达尔的所有红色山猫点心，以获得更多进度。
|next "TWW_World_Quest_Emissaries"
step
label quest-82259
accept Honoring our Fallen##82259 |goto Hallowfall/0 71.56,61.38
|tip 您将自动接受此任务。
|polish
step
click Fallen Defender+
|tip 提示它们看起来就像躺在这一区域周围地上的 NPC。
荣誉 #6# 阵亡守卫者 |q 82259/1 |goto Hallowfall/0 71.56,61.38
|next "TWW_World_Quest_Emissaries"
step
label quest-82583
accept Igniting the Fire Within##82583 |goto Hallowfall/0 55.18,32.73
|tip 您将自动接受此任务。
|polish
step
click Torch
点燃火把 |q 82583/1 |goto Hallowfall/0 55.18,32.73
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 54.60,32.77 |count 1
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 53.68,33.01 |count 2
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 54.25,34.80 |count 3
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 55.41,34.40 |count 4
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 55.55,33.71 |count 5
step
extraaction Rally##433115
|tip 使用屏幕上出现的按钮。
集结阿拉提小组 |q 82583/2 |goto Hallowfall/0 56.16,33.63 |count 6
|next "TWW_World_Quest_Emissaries"
step
label quest-82206
accept Into Shadows##82206 |goto Hallowfall/0 49.40,50.04
|tip 您将自动接受此任务。
|polish
step
talk Venrie Flitter##223105
选择 _“<驾驶快艇出海对抗黑暗>”_ |gossip 122295
与文丽对话，登上快艇 |q 82206/1 |goto Hallowfall/0 67.47,44.51
step
kill 20 Keening Shadows##223109 |q 82206/2 |goto Hallowfall/0 65.71,44.23
|tip 使用车辆栏上的能力。
|next "TWW_World_Quest_Emissaries"
step
label quest-82088
accept Kobyss Kibosh##82088 |goto Hallowfall/0 35.35,54.64
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Ragefin Carver##213400,Ragefin Shadowcaster##213405,Ragefin Executioner##213408,Grimslice##221551,Order of Night Adept##213401,Ragefin Necromancer##213406,Ragefin Carver##215652,Darkwater Tidecrusher##220621
协助阿拉提击退科比斯人 |q 82088/1 |goto Hallowfall/0 35.35,54.64
|next "TWW_World_Quest_Emissaries"
step
label quest-82294
accept Miniature Army##82294 |goto Hallowfall/0 52.44,62.79
|tip 您将自动接受此任务。
step
talk Kyrie##223442
告诉她_"开始宠物战。 |gossip 122401 |noautogossip
在宠物战中击败凯莉 |q 82294/1 |goto Hallowfall/0 52.44,62.79
|next "TWW_World_Quest_Emissaries"
step
label quest-82582
accept Mired in Shadow##82582 |goto Hallowfall/0 74.86,52.90
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Fungal Infestor##216077,Bloatrot Stinger##216065
清除暗影密林 |q 82582/1 |goto Hallowfall/0 74.86,52.90
|next "TWW_World_Quest_Emissaries"
step
label quest-82120
accept Pool Cleaner##82120 |goto Hallowfall/0 49.40,50.04
|tip 您将自动接受此任务。
step
杀死此区域周围的敌人 |kill Hungering Slicer##215242,Hungering Necromage##215239,Drowned Arathi##225760
杀死 #15# Kobyss |q 82120/1 |goto Hallowfall/0 49.40,50.04
|next "TWW_World_Quest_Emissaries"
step
label quest-82197
accept Reserve Rumpus##82197 |goto Hallowfall/0 41.64,52.21
|tip 您将自动接受此任务。
|polish
step
talk Arathi Reserve##215727+
告诉他们_“你们的将军让我和你们比试一下。”_ |gossip 120333
决斗 #8# Arathi 新兵 |q 82197/1 |goto Hallowfall/0 41.64,52.21
|tip 在战斗中击败新兵。
|next "TWW_World_Quest_Emissaries"
step
label quest-82258
accept Sieging Siege Weapons##82258 |goto Hallowfall/0 57.06,66.10
|tip 您将自动接受此任务。
step
click Blackpowder Barrel##411930+
|tip 他们看起来像大木桶，周围的地面上有金属配件。
|tip 它们会以黄点的形式出现在您的小地图上。
collect 5 Keg of Black Powder##213630 |q 82258/1 |goto Hallowfall/0 57.06,66.10
step
click Blackpowder Barrel
放置黑火药桶 |q 82258/2 |goto Hallowfall/0 59.39,65.42 |count 1
step
click Blackpowder Barrel
放置黑火药桶 |q 82258/2 |goto Hallowfall/0 59.62,66.18 |count 2
step
click Blackpowder Barrel
放置黑火药桶 |q 82258/2 |goto Hallowfall/0 59.64,66.70 |count 3
step
click Blackpowder Barrel
放置黑火药桶 |q 82258/2 |goto Hallowfall/0 59.68,67.40 |count 4
|next "TWW_World_Quest_Emissaries"
step
label quest-81815
accept Skyrider Racing - Dunelle's Detour##81815 |goto Hallowfall/0 72.78,38.42
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219557
告诉她_“我想试试这个路线”_ |gossip 121269 |noautogossip
准备比赛 |havebuff Race Starting##439277 |goto Hallowfall/0 72.78,38.42 |q 81815
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 72.72,38.49 |q 81815
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81815/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81818
accept Skyrider Racing - Light's Redoubt Descent##81818 |goto Hallowfall/0 41.43,67.25
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219559
告诉她_“我想试试这个路线”_ |gossip 121275 |noautogossip
准备比赛 |havebuff Race Starting##439281 |goto Hallowfall/0 41.43,67.25 |q 81818
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 41.38,67.13 |q 81818
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81818/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81822
accept Skyrider Racing - Mereldar Meander##81822 |goto Hallowfall/0 38.97,61.35
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219561
告诉她_“我想试试这个路线”_ |gossip 121281 |noautogossip
准备比赛 |havebuff Race Starting##439283 |goto Hallowfall/0 38.97,61.35 |q 81822
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 39.00,61.20 |q 81822
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81822/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81819
accept Skyrider Racing - Stillstone Slalom##81819 |goto Hallowfall/0 60.41,26.01
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219560
告诉他 _“我想试试这条路”_。 |gossip 121278 |noautogossip
准备比赛 |havebuff Race Starting##439282 |goto Hallowfall/0 60.41,26.01 |q 81819
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 60.54,25.92 |q 81819
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81819/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81823
accept Skyrider Racing - Velhan's Venture##81823 |goto Hallowfall/0 54.13,17.41
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219562
告诉他 _“我想试试这条路”_。 |gossip 121284 |noautogossip
准备比赛 |havebuff Race Starting##439284 |goto Hallowfall/0 54.13,17.41 |q 81823
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 54.03,17.40 |q 81823
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81823/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-82852
accept Special Assignment: Lynx Rescue##82852 |goto Hallowfall/0 67.96,63.56
|tip 您将自动接受此任务。
|polish
step
clicknpc Amber##224919
找到并结交一只迷失的山猫 |q 82852/1 |goto Hallowfall/0 67.96,63.56
step
extraaction Crush Windpipe##453203
|tip 每次使用屏幕上的能力帮助杀死噩梦。
kill 4 Vanishing Nightmare##224922 |q 82852/2 |goto Hallowfall/0 65.89,63.67
|next "TWW_World_Quest_Emissaries"
step
label quest-82787
accept Special Assignment: Rise of the Colossals##82787 |goto Hallowfall/0 63.47,8.56
|tip 您将自动接受此任务。
stickystart "Collect_Bleak_Chum"
step
click Frothing Waters+
|tip 它们看起来就像这个区域附近海岸上的蓝色大水潭。
|tip 每次召唤巨像时都需要一个布莱克-查姆（Bleak Chum）。
杀死 #3# 巨像 |q 82787/2 |goto Hallowfall/0 63.47,8.56
|tip 出现的敌人是随机的精英。
|tip 您可能需要组队前往。
|tip 击杀其他玩家的巨像可以获得功勋，从而避免消耗查姆。
step
label "Collect_Bleak_Chum"
击杀该区域附近的布莱克敌人 |kill Bleak Claw-Eater##224749,Bleak Beastbreaker##224746,Bleak Flesh-Taker##224747,Bleak Seatamer##224745,Bleak Beak-Carver##224748
|tip 这些敌人都是精英，可能需要组队击杀。
collect 3 Bleak Chum##224183 |q 82787/1 |goto Hallowfall/0 64.07,8.80
|next "TWW_World_Quest_Emissaries"
step
label quest-81816
accept Skyrider Racing - Tenir's Traversal##81816 |goto Hallowfall/0 59.19,68.94
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219558
告诉他 _“我想试试这条路”_。 |gossip 121272 |noautogossip
准备比赛 |havebuff Race Starting##439278 |goto Hallowfall/0 59.19,68.94 |q 81816
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Hallowfall/0 59.30,68.94 |q 81816
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81816/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-82586
accept Spore Ender##82586 |goto Hallowfall/0 61.05,62.34
|tip 您将自动接受此任务。
stickystart "Collect_Fragrant_Mirespores"
step
kill Darkcap Tain##226285 |q 82586/1 |goto Hallowfall/0 60.98,65.37
step
label "Collect_Fragrant_Mirespores"
杀死此区域周围的敌人 |kill Mirehat Fungalmancer##221362,Sludgeborn Shambler##220734,Mirehat Sporedancer##221363,Cultivated Mireshroom##221464,Cultivated Mireshroom##221366
collect 30 Fragrant Mirespores##225655 |q 82586/2 |goto Hallowfall/0 61.05,62.34
|next "TWW_World_Quest_Emissaries"
step
label quest-76586
accept Spreading The Light##76586 |goto Hallowfall/0 64.50,30.35
|tip 您将自动接受此任务。
step
collect Radiant Remnant##206350 |n
|tip 它们从这片区域的所有敌人身上掉落。
click Lesser Keyflame+
|tip 它们看起来像装有水晶的碗。
|tip 你需要为每个小钥匙火焰贡献三个辐射残片。
激活 #4# 小钥匙火焰 |q 76586/1 |goto Hallowfall/0 64.50,30.35
|next "TWW_World_Quest_Emissaries"
step
label quest-82298
accept The Thing from the Swamp##82298 |goto Hallowfall/0 61.07,68.99
|tip 您将自动接受此任务。
step
clicknpc Guttergunk##223409
在宠物战中击败水沟怪 |q 82298/1 |goto Hallowfall/0 61.07,68.99
|next "TWW_World_Quest_Emissaries"
step
label quest-82585
accept With Great Pyre##82585 |goto Hallowfall/0 69.19,32.62
|tip 您将自动接受此任务。
|polish
step
use the Periapt of Pure Flame##225555
挥舞纯焰之礼 |q 82585/1 |goto Hallowfall/0 69.19,32.62
step
kill 6 Hollow Gigantobella##226065 |q 82585/1 |goto Hallowfall/0 69.19,32.62
|next "TWW_World_Quest_Emissaries"
step
label quest-82288
accept Work Hard, Play Hard##82288 |goto Hallowfall/0 41.94,55.44
|tip 您将自动接受此任务。
|polish
step
clicknpc Arathi Orphan##218493
|tip 使用车辆栏上的按钮，用石头击中其中一个目标。
与孤儿玩耍 |q 82288/1 |goto Hallowfall/0 41.94,55.44 |count 1
step
talk Arathi Orphan##218493
告诉他_"我会玩。 |gossip 122374
|tip 沿着栅栏走，不要掉下去，绕到建筑物的前面和侧面。
与孤儿玩耍 |q 82288/1 |goto Hallowfall/0 41.94,55.44 |count 2
沿着栅栏走到这里 [Hallowfall/0 41.70,55.29] 。
step
talk Arathi Orphan##218493
告诉他_"我会玩。 |gossip 121459
|tip 找到藏匿的孤儿。
与孤儿玩耍 |q 82288/1 |goto Hallowfall/0 41.83,55.26 |count 3
孤儿藏在 [Hallowfall/0 42.33,56.01] 处。
step
clicknpc Arathi Orphan##218493
告诉他_"我会玩。 |gossip 122367
|tip 使用栏上的能力直到孤儿 “杀死 ”你。
与孤儿玩耍 |q 82288/1 |goto Hallowfall/0 42.02,55.43 |count 4
|next "TWW_World_Quest_Emissaries"
step
label "TWW_World_Quest_Emissaries"
#include "TWW_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Isle of Dorn World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in the Isle of Dorn.",
condition_valid=function() return completedq(79573) end,
condition_valid_msg="You must complete the \"Surface Bound\" quest in The War Within campaign on at least one character to unlock world quests.",
startlevel=70,
worldquestzone={2248,2339},
patch='110002',
},[[
step
label "Choose_World_Quest"
#include "TWW_Choose_World_Quests"
step
label quest-82470
accept Arcane Riddles##82470 |goto Isle of Dorn/0 29.94,52.48
|tip 您将自动接受此任务。
|polish
step
click Arcane Crystal
|tip 成对点击蓝色球体，切换它们的位置和各自的线路。
|tip 将线条交叉，使它们都不重叠。
|tip 直到你点亮所有金色的锁符号。
修复魔法流 |q 82470/1 |goto Isle of Dorn/0 29.94,52.48
|next "TWW_World_Quest_Emissaries"
step
label quest-81465
accept Artifacts Galore##81465 |goto Isle of Dorn/0 79.51,29.23
|tip 您将自动接受此任务。
|polish
step
click Titan Artifacts+
|tip 它们看起来就像这个区域周围地面上的白色大圆球。
collect 7 Titan Artifact##218454 |q 81465/1 |goto Isle of Dorn/0 79.51,29.23
|next "TWW_World_Quest_Emissaries"
step
label quest-82448
accept Book It to the Library##82448 |goto Isle of Dorn/0 30.53,56.60
|tip 您将自动接受此任务。
|polish
stickystart "Collect_Lost_Tomes"
step
kill Babbling Book##223852 |q 82448/1 |goto Isle of Dorn/0 30.60,57.68
step
label "Collect_Lost_Tomes"
click Arcane Tome+
|tip 它们看起来就像这一区域周围地面上的小书。
|tip 它们会以黄点的形式出现在您的小地图上。
收集 #6# 失落的通天书 |q 82448/2 |goto Isle of Dorn/0 30.53,56.60
|next "TWW_World_Quest_Emissaries"
step
label quest-82456
accept Chew On This##82456 |goto Isle of Dorn/0 52.69,56.96
|tip 您将自动接受此任务。
|polish
step
clicknpc Hungry Ramolith##225259
|tip 它们会以黄点的形式出现在您的小地图上。
骑上饥饿的拉莫利斯 |q 82456/1 |goto Isle of Dorn/0 52.69,56.96
step
吃掉 #25# 美味草 |q 82456/2 |goto Isle of Dorn/0 52.69,56.96
|tip 跑过这一区域中的大片高亮草茎。
|tip 每跑过一棵草，你都会获得短暂的速度提升。
|next "TWW_World_Quest_Emissaries"
step
label quest-82658
accept Drop and Go##82658 |goto Isle of Dorn/0 46.16,62.08
|tip 您将自动接受此任务。
|polish
stickystart "Slay_Nerubians_82658"
step
进入洞穴 |goto Isle of Dorn/0 46.16,62.08 < 10 |walk
click Opal-Mining Tools##449528+
|tip 洞穴内的地面上有一些像木制工具箱一样的东西。
collect 6 Opal-Mining Tools##224074 |q 82658/1 |goto Isle of Dorn/0 47.23,61.31
step
label "Slay_Nerubians_82658"
杀死此区域周围的努比亚敌人 |kill Nerubian Skirmisher##224150,Nerubian Webspinner##224149
|tip 放在洞穴内。
杀死 #10# 奈鲁比人 |q 82658/2 |goto Isle of Dorn/0 47.23,61.31
|next "TWW_World_Quest_Emissaries"
step
label quest-82225
accept Excavation Extravaganza##82225 |goto Isle of Dorn/0 62.55,71.17
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Sargassum Guardian##212582,Quaking Rager##215359,Unbound Peblet##215363,Condensing Sprite##215362,Rising Tidebound##215361,Swarming Sandwhisper##215360,Sandres the Relicbearer##217534
click Titan Artifact+
|tip 他们看起来像半埋在这一区域周围地面上的白色大球。
支持挖掘工作 |q 82225/1 |goto Isle of Dorn/0 62.55,71.17
|next "TWW_World_Quest_Emissaries"
step
label quest-82234
accept A Floral Flair for Every Ram##82234 |goto Isle of Dorn/0 42.69,74.74
|tip 您将自动接受此任务。
|polish
stickystart "Collect_Crimson_Chargers"
step
click Amber Bloom+
|tip 它们就像这附近地面上的一簇簇黄色花朵。
采集 #3# 琥珀色花朵 |q 82234/2 |goto Isle of Dorn/0 42.69,74.74
step
label "Collect_Crimson_Chargers"
click Crimson Charger+
|tip 它们看起来像这一区域周围地面上的高大绿色植物。
收集 #5# 绯红魅影 |q 82234/1 |goto Isle of Dorn/0 41.67,74.73
step
clicknpc Moss-Draped Ramolith##214945+
clicknpc Vinechewer Ramolith##214946+
装饰 #8# 公羊 |q 82234/3 |goto Isle of Dorn/0 42.83,74.58
|next "TWW_World_Quest_Emissaries"
step
label quest-81639
accept Book It to the Library##81639 |goto Isle of Dorn/0 75.88,37.23
|tip 您将自动接受此任务。
|polish
stickystart "Collect_Small_Glob_of_Honey"
stickystart "Kill_Faithful_of_Zirix"
step
进入洞穴 |goto Isle of Dorn/0 75.12,38.59 < 15 |walk
kill Sazh'kel##221166 |q 81639/3 |goto Isle of Dorn/0 75.87,36.73
|tip 在洞穴的最底层。
step
label "Collect_Small_Glob_of_Honey"
click Spilled Fire honey##439463+
|tip 它们看起来像洞穴内外地面上的黄色大水坑。
collect 8 Small Glob of Honey##211811 |q 81639/2 |goto Isle of Dorn/0 75.88,37.23
step
label "Kill_Faithful_of_Zirix"
kill 10 Faithful of Zirix##216938 |q 81639/1 |goto Isle of Dorn/0 75.88,37.23
|tip 洞穴内外
|next "TWW_World_Quest_Emissaries"
step
label quest-81710
accept Mead for the Catalog##81710 |goto Isle of Dorn/0 77.64,47.91
|tip 您将自动接受此任务。
step
clicknpc Cataloger's Disc##221495
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
骑乘盗贼间谍圆盘 |q 81710/1 |goto Isle of Dorn/0 77.64,47.91
step
给野生动物拍照 |q 81710/2
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
|next "TWW_World_Quest_Emissaries"
step
label quest-82455
accept No More Bread##82455 |goto Isle of Dorn/0 40.40,61.15
|tip 您将自动接受此任务。
|polish
step
kill Bloated Sea Gull##224018+
click Salty Bread+
|tip 在这个区域周围的地面上，它们看起来像小面包。
减少海鸥栖息地 |q 82455/1 |goto Isle of Dorn/0 40.40,61.15
|next "TWW_World_Quest_Emissaries"
step
label quest-82451
accept Preserving Plush Pals##82451 |goto Isle of Dorn/0 30.88,52.58
|tip 您将自动接受此任务。
step
click Singed Plush+
|tip 在这附近的地面上，它们看起来像蓝色的小象。
收集 #8# Singed Plushes |q 82451/1 |goto Isle of Dorn/0 30.88,52.58
step
click Elekk Pile
将秃鹫带到安全地带 |q 82451/2 |goto Isle of Dorn/0 29.10,56.09
|next "TWW_World_Quest_Emissaries"
step
label quest-81512
accept Props and Incense##81512 |goto Isle of Dorn/0 66.96,56.53
|tip 您将自动接受此任务。
stickystart "Collect_Pristine_Horns"
step
click Ashenfold+
|tip 它们看起来像这一区域周围地面上的小片紫色花朵。
collect 6 Ashenfold##218740 |q 81512/2 |goto Isle of Dorn/0 66.96,56.53
step
label "Collect_Pristine_Horns"
kill Shalehorn Impaler##216970+
collect 2 Pristine Horn##218739 |q 81512/1 |goto Isle of Dorn/0 66.96,56.53
|next "TWW_World_Quest_Emissaries"
step
label quest-82237
accept Rising the Falls##82237 |goto Isle of Dorn/0 56.68,42.72
|tip 您将自动接受此任务。
|polish
step
click Climbing Gear
获取攀岩装备 |q 82237/1 |goto Isle of Dorn/0 56.68,42.72
step
click Handhold
在悬崖上寻找抓手 |q 82237/2 |goto Isle of Dorn/0 56.60,42.73
step
click Ancient Celestite+
|tip 它们看起来像岩壁上的蓝色大晶体。
|tip 点击扶手可以爬上岩壁，点击扶手可以从岩壁上挖掘出文物。
|tip 避免蓝色水流冲过石头，以免降低你的抓地力。
收集 #6# 火花泡泡矿石 |q 82237/3 |goto Isle of Dorn/0 56.49,42.89
|next "TWW_World_Quest_Emissaries"
step
label quest-82291
accept Robot Rumble##82291 |goto Isle of Dorn/0 48.17,31.96
|tip 您将自动接受此任务。
step
clicknpc Awakened Custodian##223407
在宠物战中击败觉醒守护者 |q 82291/1 |goto Isle of Dorn/0 48.17,31.96
|next "TWW_World_Quest_Emissaries"
step
label quest-82292
accept Rock Collector##82292 |goto Isle of Dorn/0 38.33,78.83
|tip 您将自动接受此任务。
step
talk Collector Dyna##223446
告诉她_"开始宠物战。 |gossip 122407 |noautogossip
在宠物战中击败收藏家戴娜 |q 82292/1 |goto Isle of Dorn/0 38.33,78.83
|next "TWW_World_Quest_Emissaries"
step
label quest-80295
accept Rocks, Water and Elemental Fodder##80295 |goto Isle of Dorn/0 71.34,52.40
|tip 您将自动接受此任务。
|polish
step
click Elemental Silt Mound##413246+
|tip 在这个区域周围的地面上有一些像沙堆一样的东西。
杀死此区域周围的敌人 |kill Scornful Sandshoal##214662,Frenzied Tidecore##213699
collect 20 Living Coalesced Silt##217343 |q 80295/1 |goto Isle of Dorn/0 71.34,52.40
|next "TWW_World_Quest_Emissaries"
step
label quest-81803
accept Skyrider Racing - Basin Bypass##81803 |goto Isle of Dorn/0 53.49,64.21
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219547
告诉她_“我想试试这个路线”_ |gossip 121239 |noautogossip
准备比赛 |havebuff Race Starting##439235 |goto Isle of Dorn/0 53.49,64.21 |q 81803
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Isle of Dorn/0 53.48,64.35 |q 81803
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81803/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81799
accept Skyrider Racing - Dornogal Drift##81799 |goto Dornogal/0 42.99,15.49
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219542
告诉她_“我想试试这个路线”_ |gossip 121233 |noautogossip
准备比赛 |havebuff Race Starting##439233 |goto Dornogal/0 42.99,15.49 |q 81799
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Dornogal/0 43.33,15.85 |q 81799
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81799/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81806
accept Skyrider Racing - Orecreg's Doglegs##81806 |goto Isle of Dorn/0 32.93,74.83
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219550
告诉他 _“我想试试这条路”_。 |gossip 121248 |noautogossip
准备比赛 |havebuff Race Starting##439239 |goto Isle of Dorn/0 32.93,74.83 |q 81806
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Isle of Dorn/0 33.00,74.80 |q 81806
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81806/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81802
accept Skyrider Racing - Storm's Watch Survey##81802 |goto Isle of Dorn/0 38.58,43.46
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219544
告诉他 _“我想试试这条路”_。 |gossip 121236 |noautogossip
准备比赛 |havebuff Race Starting##439234 |goto Isle of Dorn/0 38.58,43.46 |q 81802
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Isle of Dorn/0 38.67,43.48 |q 81802
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81802/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81805
accept Skyrider Racing - Thunderhead Trail##81805 |goto Isle of Dorn/0 58.33,24.85
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219549
告诉她_“我想试试这个路线”_ |gossip 121245 |noautogossip
准备比赛 |havebuff Race Starting##439238 |goto Isle of Dorn/0 58.33,24.85 |q 81805
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Isle of Dorn/0 58.35,24.66 |q 81805
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81805/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81804
accept Skyrider Racing - The Wold Ways##81804 |goto Isle of Dorn/0 62.16,46.02
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219548
告诉他 _“我想试试这条路”_。 |gossip 121242 |noautogossip
准备比赛 |havebuff Race Starting##439236 |goto Isle of Dorn/0 62.16,46.02 |q 81804
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto Isle of Dorn/0 62.16,46.11 |q 81804
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81804/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81649
accept Special Assignment: Titanic Resurgence##81649 |goto Isle of Dorn/0 70.33,73.99
|tip 您将自动接受此任务。
|polish
step
talk Stormrook##221533
告诉他_"（天空骑行）这次我来掌舵。 |gossip 123532
_Or_
告诉他_“你掌舵，我来射击”_。 |gossip 121731
|tip 天空骑行选项需要您飞行，否则您只需射击即可。
获得增压斯托姆洛克 |q 81649/2 |goto Isle of Dorn/0 70.20,71.80
step
kill Eroded Titan Construct##221205 |q 81649/1 |goto Isle of Dorn/0 70.33,73.99
|tip 避开空中的红色大圆球。
|tip 如果你在飞行，绿色球体会为你补充能量。
|tip 如果是天空飞行，旋风突刺会治疗你，向前突刺会为你提供护盾，而天空上升则会造成伤害。
|next "TWW_World_Quest_Emissaries"
step
label quest-81650
accept Special Assignment: Titanic Resurgence##81650 |goto Isle of Dorn/0 63.48,42.78
|tip 您将自动接受此任务。
|polish
step
talk Stormrook##221535
告诉他_"（天空骑行）这次我来掌舵。 |gossip 121732
_Or_
告诉他_“你掌舵，我来射击”_。 |gossip 121744
|tip 天空骑行选项需要您飞行，否则您只需射击即可。
获得增压斯托姆洛克 |q 81650/2 |goto Isle of Dorn/0 72.45,30.81
step
kill Eroded Titan Construct##221213 |q 81650/1 |goto Isle of Dorn/0 73.86,30.20
|tip 避开空中的红色大圆球。
|tip 如果你在飞行，绿色球体会为你补充能量。
|tip 如果是天空飞行，旋风突刺会治疗你，向前突刺会为你提供护盾，而天空上升则会造成伤害。
|next "TWW_World_Quest_Emissaries"
step
label quest-82355
accept Special Assignment: Cinderbee Surge##82355 |goto Isle of Dorn/0 72.07,37.54
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Amber Honeyslime##222846,Cinderbee Drone##215024,Cinderbee Forager##222976,Persistent Honeyslime##222843
|tip 这些敌人都是精英，可能需要组队击杀。
制服煤渣蜂 |q 82355/1 |goto Isle of Dorn/0 72.07,37.54
|next "TWW_World_Quest_Emissaries"
step
label quest-81621
accept Tunnels Be Gone!##81621 |goto Isle of Dorn/0 62.83,44.78
|tip 您将自动接受此任务。
|polish
step
use the Explosive Sticks##219284
摧毁哥布林隧道 |q 81621/1 |goto Isle of Dorn/0 62.85,44.78 |count 1
step
use the Explosive Sticks##219284
摧毁哥布林隧道 |q 81621/1 |goto Isle of Dorn/0 63.54,44.35 |count 2
step
use the Explosive Sticks##219284
摧毁哥布林隧道 |q 81621/1 |goto Isle of Dorn/0 64.18,42.96Isle of Dorn/0 64.18,42.96 |count 3
|next "TWW_World_Quest_Emissaries"
step
label quest-81675
accept Water the Sheep##81675 |goto Dornogal/0 57.82,26.40
|tip 您将自动接受此任务。
|polish
step
clicknpc Parched Mosswool##221413+
use the Globe of Nourishment##219525
|tip 用它来浇灌这附近干枯的苔藓羊。
水 #8# 苔藓羊 |q 81675/1 |goto Dornogal/0 57.82,26.40
step
clicknpc Stone Borer##221425+
|tip 在此区域周围的地面上，它们看起来像小蛇。
坑洞 #10# 害虫 |q 81675/2 |goto Dornogal/0 57.82,26.40
|next "TWW_World_Quest_Emissaries"
step
label quest-81615
accept Wick Points##81615 |goto Isle of Dorn/0 63.48,42.78
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的烛光敌人 |kill Candlelit Big-Boomer##211546,Candlelit Blind-Hound##218213,Candlelit Lootsnatcher##213197,Candlelit Hexthrower##213685,Candlelit Ouchpatcher##214252
杀死 #15# 哥布林 |q 81615/1 |goto Isle of Dorn/0 63.48,42.78
|next "TWW_World_Quest_Emissaries"
step
label "TWW_World_Quest_Emissaries"
#include "TWW_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\The Ringing Deeps World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in the The Ringing Deeps.",
condition_valid=function() return completedq(79573) end,
condition_valid_msg="You must complete the \"Surface Bound\" quest in The War Within campaign on at least one character to unlock world quests.",
startlevel=70,
worldquestzone={2214},
patch='110002',
},[[
step
label "Choose_World_Quest"
#include "TWW_Choose_World_Quests"
step
label quest-82552
accept All Worked Up##82552 |goto The Ringing Deeps/0 48.99,16.75
|tip 您将自动接受此任务。
step
click Broken Machinery
|tip 他们看起来像柱子，在此区域周围的地面上发射火球。
杀死此区域周围的敌人 |kill Dogmatic Forgecaster##212884,Dogmatic Machine Speaker##212878,Earthenwork Ironstrider##213951,Dogmatic Soot-Seer##212876,High Speaker's Construct##219635
挫败地球工厂的干扰 |q 82552/1 |goto The Ringing Deeps/0 47.74,19.62
|next "TWW_World_Quest_Emissaries"
step
label quest-82523
accept Candle Kingbreaker##82523 |goto The Ringing Deeps/0 64.37,32.75
|tip 您将自动接受此任务。
|polish
step
click Intriguing Scrap+
|tip 它们看起来像堆在这一区域周围地面上的垃圾和随机物品。
杀死此区域周围的敌人 |kill Waxtail Browbeater##213000,Waxtail Scavenger##212985,Domesticated Candlefly##213960,Waxtail Trapper##212987,Waxtail Outrider##213095
|tip 您还可以飞过此区域周围空中的金色圆环，从而获得大量进度。
解放荒原 |q 82523/1 |goto The Ringing Deeps/0 64.37,32.75
|next "TWW_World_Quest_Emissaries"
step
label quest-82256
accept Capturing the Cataract's Creatures##82256 |goto The Ringing Deeps/0 52.90,47.58
|tip 您将自动接受此任务。
step
click Cataloger's Disc
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
骑乘盗贼间谍圆盘 |q 82256/1 |goto The Ringing Deeps/0 52.90,47.58
step
拍摄不和谐 |q 82256/2
|tip 使用车辆栏上的 “目录 ”功能拍摄河边的野生动物。
|tip 当胶卷栏变空时，使用 “重新加载胶卷 ”功能重新加载并拍摄更多照片。
|tip 在野生动物被光线包围时拍摄照片，可以获得质量更好的照片。
|next "TWW_World_Quest_Emissaries"
step
label quest-81750
accept Cloud Farming##81750 |goto The Ringing Deeps/0 56.94,67.27
|tip 您将自动接受此任务。
step
农场 #30# 云 |q 81750/1 |goto The Ringing Deeps/0 56.94,67.27
|tip 飞过此区域周围空中的圆环。
|tip 避开会阻碍你飞行的紫色球体。
|next "TWW_World_Quest_Emissaries"
step
label quest-84429
accept Construct Containment##84429 |goto The Ringing Deeps/0 58.01,40.13
|tip 您将自动接受此任务。
|polish
step
kill Lava Laden Crystal Construct##226968 |q 84429/1 |goto The Ringing Deeps/0 58.01,40.13
|tip 它在废墟上到处乱跑。
|tip 从空中穿过可以眩晕它，当它试图逃跑时，使用 “弶 ”效果可以使它减速。
|tip 你可以在它叠加了 9 层眩晕后再从空中穿过。
|tip 经常使用人群控制效果，确保叠加的debuff不会掉落。
|next "TWW_World_Quest_Emissaries"
step
label quest-82580
accept Courier Mission: Ore Recovery##82580 |goto The Ringing Deeps/0 64.63,63.78
|tip 您将自动接受此任务。
step
click Ore Bucket
拾取矿石桶 |q 82580/1 |goto The Ringing Deeps/0 64.63,63.78
step
click Taelloch Ore+
|tip 矿石桶在这片区域的黄色水晶附近，看起来像闪闪发光的石块。
extraaction Stabilize!##451372
|tip 不要使用坐骑。
|tip 使用屏幕上的能力来控制你的稳定性。
|tip 在施法栏上最小的一格内开始施法，以提升速度。
|tip 如果掉落了矿石，请四处奔跑，迅速拾取所有矿石。
拾取 10 块矿石 |havebuff 10 Carrying Ore##450692 |goto The Ringing Deeps/0 67.17,63.18
step
沿路向上 |goto The Ringing Deeps/0 65.15,63.80 < 15 |only if walking
extraaction Stabilize!##451372
|tip 不要使用坐骑。
|tip 使用屏幕上的能力来控制你的稳定性。
|tip 在施法栏上最小的一格内开始施法，以提升速度。
|tip 如果掉落了矿石，请四处奔跑，迅速拾取所有矿石。
返回 #10# 矿石 |q 82580/2 |goto The Ringing Deeps/0 61.51,64.20
|next "TWW_World_Quest_Emissaries"
step
label quest-83930
accept Deworming Solution##83930 |goto The Ringing Deeps/0 58.19,37.98
|tip 您将自动接受此任务。
step
杀死此区域周围的敌人 |kill Deeps Larva##215733,Deeps Spitter##215735
杀死 #12# 蠕虫 |q 83930/1 |goto The Ringing Deeps/0 58.19,37.98
您可以在 [The Ringing Deeps/0 58.54,36.06] 的矿洞内找到更多虫子。
|next "TWW_World_Quest_Emissaries"
step
label quest-83537
accept Geothermal Gem Treatment##83537 |goto The Ringing Deeps/0 39.65,16.47
|tip 您将自动接受此任务。
step
进入洞穴 |goto The Ringing Deeps/0 40.36,17.91 < 10 |walk
click Dull Gemstone+
|tip 它们看起来像洞穴内地面上的灰色暗淡大晶体。
收集 #12# 暗淡宝石 |q 83537/1 |goto The Ringing Deeps/0 39.65,16.47
step
extraaction Heat Treatment##456605
|tip 将宝石扔进熔岩中。
|tip 如果出现锁链就站在原地不动，直到宝石处理完毕。
kill Gem-Jammed Slag Bubble##226969
|tip 杀死产生的熔渣。
click Heat-treated Gemstone+
|tip 杀死熔渣后它们就会出现。
热处理 #12# 宝石 |q 83537/2 |goto The Ringing Deeps/0 41.81,19.61
|next "TWW_World_Quest_Emissaries"
step
label quest-82300
accept Major Malfunction##82300 |goto The Ringing Deeps/0 66.85,58.09
|tip 您将自动接受此任务。
step
clicknpc Haywire Servobot##222535
在宠物大战中击败钢丝伺服机器人 |q 82300/1 |goto The Ringing Deeps/0 66.85,58.09
|next "TWW_World_Quest_Emissaries"
step
label quest-83079
accept Mineral Buildup##83079 |goto The Ringing Deeps/0 47.29,42.54
|tip 您将自动接受此任务。
step
kill 12 Mineral Deposit##225443 |q 83079/1 |goto The Ringing Deeps/0 47.29,42.54
|next "TWW_World_Quest_Emissaries"
step
label quest-81656
accept Nothing to Waste##81656 |goto The Ringing Deeps/0 58.82,52.07
|tip 您将自动接受此任务。
stickystart "Slay_Skardyn"
step
click Abandoned Tools+
|tip 它们看起来像这个区域周围地面上的小工具箱。
collect 6 Mining Tools##219468 |q 81656/2 |goto The Ringing Deeps/0 58.82,52.07
step
label "Slay_Skardyn"
杀死此区域周围的敌人 |kill Skardyn Reaver##215842,Skardyn Devastator##215844,Voidstone Behemoth##221307,Skardyn Degenerator##215843,Rampaging Blight##220273
杀死 #12# 斯卡丁 |q 81656/1 |goto The Ringing Deeps/0
|next "TWW_World_Quest_Emissaries"
step
label quest-82293
accept The Power of Friendship##82293 |goto The Ringing Deeps/0 61.58,37.60
|tip 您将自动接受此任务。
step
talk Friendhaver Grem##223444
告诉他_“开始宠物战。”_ |gossip 122405 |noautogossip
在宠物战中击败好友格雷姆 |q 82293/1 |goto The Ringing Deeps/0 61.58,37.60
|next "TWW_World_Quest_Emissaries"
step
label quest-83101
accept Reaching for Resources##83101 |goto The Ringing Deeps/0 55.19,50.83
|tip 您将自动接受此任务。
step
click Climbing Gear
获取攀岩装备 |q 83101/1 |goto The Ringing Deeps/0 55.19,50.83
step
click Handhold
在悬崖上寻找抓手 |q 83101/2 |goto The Ringing Deeps/0 55.61,51.51
step
click Ancient Celestite+
|tip 它们看起来像岩壁上的蓝色大晶体。
|tip 点击扶手可以爬上岩壁，点击扶手可以从岩壁上挖掘出文物。
|tip 避免蓝色水流冲过石头，以免降低你的抓地力。
收集 #6# 远古天青石 |q 83101/3 |goto The Ringing Deeps/0 55.61,51.51
|next "TWW_World_Quest_Emissaries"
step
label quest-82615
accept Reclaiming the Waterworks##82615 |goto The Ringing Deeps/0 44.69,44.97
|tip 您将自动接受此任务。
|polish
stickystart "Slay_Kobolds_82615"
stickystart "Kill_Waterworks_Brutes_82615"
step
click Chest of Dynamite##446357+
|tip 它们看起来像这个区域周围地面上的小木箱。
|tip 它们会以黄点的形式出现在您的小地图上。
collect 4 Unstable Dynamite##223888 |q 82615
|tip 您也可以从哥布林那里掠夺它们。
step
click Kobold Tunnel+
|tip 它们看起来就像遍布这个区域的土堆。
|tip 它们会以黄点的形式出现在您的小地图上。
炸毁 #4# 哥布林隧道 |q 82615/3 |goto The Ringing Deeps/0 44.69,44.97
step
label "Slay_Kobolds_82615"
杀死此区域周围的水厂敌人 |kill Waterworks Gem-snatcher##219789,Waterworks Opportunist##217249
杀死 #12# 哥布林 |q 82615/1 |goto The Ringing Deeps/0 44.69,44.97
step
label "Kill_Waterworks_Brutes_82615"
kill 4 Waterworks Brute##222979 |q 82615/2 |goto The Ringing Deeps/0 44.69,44.97
|next "TWW_World_Quest_Emissaries"
step
label quest-81811
accept Skyrider Racing - Cataract River Cruise##81811 |goto The Ringing Deeps/0 52.47,46.86
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219554
告诉他 _“我想试试这条路”_。 |gossip 121260 |noautogossip
准备比赛 |havebuff Race Starting##439261 |goto The Ringing Deeps/0 52.47,46.86 |q 81811
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 52.41,46.98 |q 81811
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81811/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81810
accept Skyrider Racing - Chittering Concourse##81810 |goto The Ringing Deeps/0 67.91,34.80
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219553
告诉她_“我想试试这个路线”_ |gossip 121257 |noautogossip
准备比赛 |havebuff Race Starting##439260 |goto The Ringing Deeps/0 67.91,34.80 |q 81810
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 67.89,34.99 |q 81810
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81810/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81807
accept Skyrider Racing - Earthenworks Weave##81807 |goto The Ringing Deeps/0 40.86,11.31
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219551
告诉她_“我想试试这个路线”_ |gossip 121251 |noautogossip
准备比赛 |havebuff Race Starting##439257 |goto The Ringing Deeps/0 40.86,11.31 |q 81807
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 40.91,11.20 |q 81807
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81807/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81813
accept Skyrider Racing - Opportunity Point Amble##81813 |goto The Ringing Deeps/0 63.56,75.13
|tip 您将自动接受此任务。
step
talk Bronze Timekeeper##219556
告诉他 _“我想试试这条路”_。 |gossip 121266 |noautogossip
准备比赛 |havebuff Race Starting##439263 |goto The Ringing Deeps/0 63.56,75.13 |q 81813
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 63.50,75.06 |q 81813
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81813/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81808
accept Skyrider Racing - Ringing Deeps Ramble##81808 |goto The Ringing Deeps/0 42.22,27.42
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219552
告诉她_“我想试试这个路线”_ |gossip 121233 |noautogossip
准备比赛 |havebuff Race Starting##439258 |goto The Ringing Deeps/0 42.22,27.42 |q 81808
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 42.31,27.77 |q 81808
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81808/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81812
accept Skyrider Racing - Taelloch Twist##81812 |goto The Ringing Deeps/0 66.64,68.68
|tip 您将自动接受此任务。
|polish
step
talk Bronze Timekeeper##219555
告诉她_“我想试试这个路线”_ |gossip 121263 |noautogossip
准备比赛 |havebuff Race Starting##439262 |goto The Ringing Deeps/0 66.64,68.68 |q 81812
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
等待比赛开始 |havebuff Racing##369968 |goto The Ringing Deeps/0 66.62,68.57 |q 81812
|tip 大约需要 5 秒钟。
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
step
完成比赛 |q 81812/1
|tip 沿着指定的路线飞行，穿过环形山和你看到的任何阵风。
|tip 经常使用你的龙骑术，保持快速的步伐。
|tip 紧接着的路径显示为橙色，而未来的路径显示为蓝色。
|next "TWW_World_Quest_Emissaries"
step
label quest-81691
accept Special Assignment: Shadows Below##81691 |goto The Ringing Deeps/0 68.32,52.04
|tip 您将自动接受此任务。
|polish
step
杀死此区域周围的敌人 |kill Shadow-hemmed Fog Beast##221663,Voracious Fog Beast##219446,Coalesced Shadeling##224788,Shadow-seized Loader##223866,Famished Fog Beast##219447,Deathspore Lashroom##221424
collect 12 Radiant Fuel Crystal##219522 |n
|tip 杀死敌人并收集燃料水晶为钻孔机加油。
|tip 每个钻孔机至少需要 5 个水晶。
clicknpc Trapped Emergency Militia##223938+
|tip 他们看起来像被困在阴影水坑中的 NPC。
|tip 抓住他们并逃跑，然后收集他们留下的水晶。
use the Radiant Fuel Crystal##219522
|tip 将 3 个较小的晶体合成一个辐射晶体。
加油 #3# 钻头 |q 81691/2 |goto The Ringing Deeps/0 68.32,52.04
step
click Shadowseam |goto The Ringing Deeps/0 68.16,52.12
传送到德鲁温 |goto The Ringing Deeps/0 68.16,48.73 < 10 |c |noway |q 81691
step
kill Droghung##221316 |q 81691/3 |goto The Ringing Deeps/0 67.45,48.14
|tip 放在洞穴内。
|tip 不要站在 “恐惧烟雾 ”前。
|tip 打断 "令人窒息的烟雾”
step
click Portal to the Surface |goto The Ringing Deeps/0 67.18,48.54
返回地面 |goto The Ringing Deeps/0 68.26,52.14 < 10 |c |noway
|next "TWW_World_Quest_Emissaries"
step
label quest-83229
accept Special Assignment: When the Deeps Stir##83229 |goto The Ringing Deeps/0 52.24,10.78
|tip 您将自动接受此任务。
|polish
step
kill Awakened Flamecoil Serpent##225895 |q 83229/1 |goto The Ringing Deeps/0 50.23,11.89 |count 1
|tip 它会以黄点的形式出现在你的小地图上。
|tip 这是一个 BOSS 敌人，可能需要组队前往。
step
kill Awakened Volcanic Fury##225896 |q 83229/1 |goto The Ringing Deeps/0 49.57,9.64 |count 2
|tip 它会以黄点的形式出现在你的小地图上。
|tip 这是一个 BOSS 敌人，可能需要组队前往。
step
kill Awakened Colossus##225898 |q 83229/1 |goto The Ringing Deeps/0 53.07,16.50 |count 3
|tip 它会以黄点的形式出现在你的小地图上。
|tip 这是一个 BOSS 敌人，可能需要组队前往。
step
kill Awakened Sulfuric Devastator##225894 |q 83229/1 |goto The Ringing Deeps/0 56.74,10.06 |count 4
|tip 它会以黄点的形式出现在你的小地图上。
|tip 这是一个 BOSS 敌人，可能需要组队前往。
|next "TWW_World_Quest_Emissaries"
step
label quest-83080
accept Taelloch Cleanup##83080 |goto The Ringing Deeps/0 65.15,57.97
|tip 您将自动接受此任务。
|polish
step
click Earthen Memory Gem Fragment+
|tip 它们看起来像这一区域周围地面上的小块宝石。
杀死此区域周围的敌人 |kill Voidtouched Speaker##223469,Cursed Miner##213565,Skardyn Husk##213566,Unstable Skardyn##223414,Corrupted Spellshaper##219302
杀死斯卡丁并收集土质记忆宝石 |q 83080/1 |goto The Ringing Deeps/0 65.15,57.97
|next "TWW_World_Quest_Emissaries"
step
label quest-83028
accept Thieving Snufflers##83028 |goto The Ringing Deeps/0 52.71,34.90
|tip 您将自动接受此任务。
|polish
stickystart "Kill_Sweetsnuffler"
step
clicknpc Pilfered Cinderbrew##225339
回收 #6# 偷来的煤渣酒 |q 83028/1 |goto The Ringing Deeps/0 52.71,34.90
step
label "Kill_Sweetsnuffler"
kill 12 Sweetsnuffler##219799 |q 83028/2 |goto The Ringing Deeps/0 52.71,34.90
|next "TWW_World_Quest_Emissaries"
step
label quest-83048
accept Wayward Walkers##83048 |goto The Ringing Deeps/0 43.79,36.86
|tip 您将自动接受此任务。
|polish
step
clicknpc Lost Cogwalker##225375+
|tip 它们看起来像这个区域周围的小型行走机器人。
返回 #8# 迷失的齿轮行者 |q 83048/1 |goto The Ringing Deeps/0 43.79,36.86
|next "TWW_World_Quest_Emissaries"
step
label quest-82519
accept You Go Take Candle##82519 |goto The Ringing Deeps/0 58.72,24.99
|tip 您将自动接受此任务。
|polish
step
click Flickerflame Candles##411755+
|tip 它们看起来像这一区域周围地面上的一大捆蜡烛。
杀死该区域周围的闪烁火焰敌人 |kill Flickerflame Sticker##212629,Flickerflame Candlekeeper##212524,Flickerflame Scrabbler##212515,Flickerflame Geomancer##212528,Flickerflame Enforcer##212548,Flickerflame Overseer##212542
collect 12 Flickerflame Candle##210878 |q 82519/1 |goto The Ringing Deeps/0 58.72,24.99
|next "TWW_World_Quest_Emissaries"
step
label "TWW_World_Quest_Emissaries"
#include "TWW_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Special Missions Locked",{
author="support@zygorguides.com",
startlevel=70,
areapoiid={7828,7823,7826,7827,7825,7886,7829},
patch='110002',
},[[
step
完成额外的世界任务 |complete false
|tip 特殊任务需要在同一区域完成一定数量的世界任务后才能解锁。
|tip 在点击特殊任务图标之前，请完成图标上标明的世界任务数量。
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Theater Troupe",{
author="support@zygorguides.com",
startlevel=70,
areapoiid={8076,7901,7943,7899,8078,7900,8079,7902,8077,7654,8080,7941},
patch='110002',
},[[
step
talk Stage Manager Huberta##214296
accept Thespians at the Proscenium##79150 |goto Isle of Dorn/0 56.44,51.38
step
talk Architect Brokfor##217241
告诉他 _“休伯塔要我帮你”_。 |gossip 122494
与布罗克福尔对话 |q 79150/1 |goto The Proscenium/0 38.01,43.12
step
clicknpc Bushy Weeds##217456+
|tip 在这个区域周围的楼梯上有一些绿色的大植物。
|tip 当你点击它们并将其拔出时，请逃跑。
拔掉 #6# 茂盛的杂草 |q 79150/2 |goto Isle of Dorn/0 56.44,49.31
step
talk Stage Manager Huberta##214296
turnin Thespians at the Proscenium##79150 |goto Isle of Dorn/0 56.44,51.38
accept The Grand Debut##79282 |goto Isle of Dorn/0 56.44,51.38
step
编译剧团活动 |q 79282/1 |goto Isle of Dorn/0 56.45,50.56
step
talk Stage Manager Huberta##214296
turnin The Grand Debut##79282 |goto Isle of Dorn/0 56.44,51.38
step
label "Begin_Theater"
talk Stage Manager Huberta##214296
accept The Theater Troupe##83240 |goto Isle of Dorn/0 56.44,51.38
step
等待剧场开始组装 |scenariostart |goto Isle of Dorn/0 56.44,51.38
|tip 演出每小时开始一次。
stickystart "Earn_Audience_Approval"
step
等待演出开始
|tip 活动将在 5 分钟后开始！
等待谢幕 |scenariostage 1 |goto Isle of Dorn/0 56.44,51.38
|only if scenariostage(1)
step
talk Stage Manager Huberta##214296
告诉她_“（开始剧场演出）扎拉拉纳兹，报到！”_ |gossip 120733
与舞台监督休伯塔交谈 |scenariogoal 2/66128 |goto Isle of Dorn/0 56.44,51.38
|only if scenariostage(2)
step
clicknpc Nosy Mouse##215116
clicknpc Nosy Ferret##215115
扑通 #8# 小动物 |scenariogoal 3/64669 |goto The Proscenium/0 32.34,59.86
|only if scenariostage(3)
step
click Playbill##417367+
|tip 它们看起来像悬挂在这一区域周围垂直表面上的大纸片。
悬挂 #5# 剧照 |scenariogoal 4/64800 |goto The Proscenium/0 49.74,33.88
|only if scenariostage(4)
step
click Wave Prop
click Wave Crash Prop
click Little Rock Prop
click Big Rock Prop
粉刷 #5# 海洋风光 |scenariogoal 5/64806 |goto The Proscenium/0 55.15,59.24
|only if scenariostage(5)
step
click Stone Block+
|tip 点击它们各几次。
雕刻 2#面具 |scenariogoal 6/64823 |goto The Proscenium/0 56.34,54.49
|only if scenariostage(6)
step
extraaction Break a Leg!##435494
鼓励 5 号选手和休伯塔摔断一条腿 |scenariogoal 7/64675 |goto The Proscenium/0 48.57,56.31
|only if scenariostage(7)
step
click Discarded Theater Program##417347+
|tip 在这个区域周围的地面上，它们看起来像一堆纸。
收集 #5# 废弃的剧院节目单 |scenariogoal 8/64797 |goto The Proscenium/0 43.20,35.49
|only if scenariostage(8)
step
click Blunted Weapon##419679+
|tip 在这个区域周围的地上，它们看起来像长矛、锤子和斧子。
收集 #6# 钝器 |scenariogoal 9/64883 |goto The Proscenium/0 29.18,43.72
|only if scenariostage(9)
step
click Set Piece##419732
摧毁布景 |scenariogoal 10/64918 |goto The Proscenium/0 49.29,58.68
|only if scenariostage(10)
step
click Lost Script Pages##419727+
|tip 在此区域周围的地面上，它们看起来像成堆的纸张。
收集 #5# 丢失的剧本页 |scenariogoal 11/64893 |goto The Proscenium/0 56.32,68.81
|DEVMSG CHECK PAGE COUNT!
|only if scenariostage(11)
step
talk Feuding Actor##216128
|tip 为男演员选择以下对话选项。
问他_"你在这么多观众面前表演过吗？ |gossip 120457
问他_"如果你是她的导师呢？ |gossip 120458
talk Feuding Actor##216127
|tip 为女演员选择以下对话选项。
告诉她_"像他这样无拘无束的人擅长即兴表演。 |gossip 120454
告诉她_“表演的一半是反应”_。 |gossip 120455
解决演员争议 |scenariostage 12 |goto The Proscenium/0 49.43,39.74
|only if scenariostage(12)
step
click Sprightly Wildflower##420113+
|tip 在这附近的地面上，它们看起来像小花。
采摘 #5# 鲜艳的野花 |scenariogoal 13/65044 |goto The Proscenium/0 52.44,74.69
|only if scenariostage(13)
step
追逐 #8# 小鸟 |scenariogoal 14/65232 |goto The Proscenium/0 43.30,45.03
|tip 奔向栖息在这一区域周围的各种鸟类。
|only if scenariostage(14)
step
click Scattered Mug##424353
|tip 它们看起来就像这个区域地面上的小杯子。
收集 #6# 杯子 |scenariogoal 15/66043 |goto The Proscenium/0 48.60,32.38
|only if scenariostage(15)
step
clicknpc Stampeding Shalehorn##215812+
|tip 它们会绕着这个区域跑一圈。
|tip 在驱赶它们时，您可以点击几下来阻止它们。
赶走 #10# 狂奔的夏利角马 |scenariogoal 16/64828 |goto The Proscenium/0 49.89,54.26
|only if scenariostage(16)
step
click Unpainted Ramolith Prop+
给 #5# 拉姆道具上色 |scenariogoal 17/66885 |goto The Proscenium/0 44.34,60.24
|only if scenariostage(17)
step
clicknpc Glitched Hologram##222107+
修复 #6# 全息图像 |scenariogoal 18/66044 |goto The Proscenium/0 49.92,53.75
|only if scenariostage(18)
step
click Costume Bundle##441667+
收集 #6# 服装包 |scenariogoal 19/66912 |goto The Proscenium/0 30.77,66.97
|only if scenariostage(19)
step
click Bush Prop+
click Big Rock Prop+
click Tree Prop
绘制 #5# 森林场景 |scenariogoal 20/66909 |goto The Proscenium/0 54.39,49.25
|only if scenariostage(20)
step
click Candles Prop+
click Minecart Prop
click Stalagmite Prop+
粉刷#5#地下场景 |scenariogoal 21/67386 |goto The Proscenium/0 45.87,48.42
|only if scenariostage(21)
step
click Scuffed Titan Orb##441648
修复 #5# 擦伤的泰坦宝珠 |scenariogoal 22/66910 |goto The Proscenium/0 42.75,54.37
|only if scenariostage(22)
step
舞台即将推出 |scenariogoal 23/0
|DEVMSG STAGE 23
|only if scenariostage(23)
step
kill Brew-Addled Earthen##215911
击败尽可能多的醉酒侏儒 |scenariogoal 24/64891 |goto The Proscenium/0 44.21,32.95
|only if scenariostage(24)
step
kill Nerubian Disruptor##216356
击败尽可能多的努比亚飞人 |scenariogoal 25/65241 |goto The Proscenium/0 46.89,39.35
|only if scenariostage(25)
step
kill Proscenium Punk##215791+
尽可能多地击败哥布林 |scenariogoal 26/64826 |goto The Proscenium/0 31.68,47.34
|only if scenariostage(26)
step
kill Disturbed Deepflayer##215773+
尽可能多地击败深海掠夺者 |scenariogoal 27/64827 |goto The Proscenium/0 39.98,67.55
|only if scenariostage(27)
step
kill Fungarian Creepcap##218665
尽可能多地击败蘑菇人 |scenariogoal 28/65018 |goto The Proscenium/0 37.25,63.53
|only if scenariostage(28)
step
kill Proscenium Puddlestomper##216072+
尽可能多地击败戈尔洛克人 |scenariogoal 29/65202 |goto The Proscenium/0 61.06,79.60
|only if scenariostage(29)
step
click Costume Chest##463803
|tip 穿上戏服，等待重头戏的开始。
到达中心舞台 |scenariogoal 30/66556 |goto The Proscenium/0 49.77,53.37
|only if scenariostage(30)
step
extraaction Roaring Cheer##436808
|tip 至少站在一个将军周围的巨大黄色圆圈中的一个，同时释放屏幕上的能力。
|tip 尽量同时站在两个圈内，这样每次欢呼都能获得 +10 的观众认可度。
为将军们欢呼 |scenariogoal 31/66136 |goto The Proscenium/0 49.77,54.18
|only if scenariostage(31)
step
kill Earthen Contender##215989+
击败尽可能多的土人对手 |scenariogoal 32/65013 |goto The Proscenium/0 49.89,52.96
|only if scenariostage(32)
step
clicknpc Large Ramolith Prop##220998+
|tip 这些可获得 +3 观众认可。
clicknpc Weight Bar Prop##215726+
|tip 这些可获得 +5 观众认可。
尽可能多地完成力量壮举 |scenariogoal 33/64812 |goto The Proscenium/0 46.98,53.51
|only if scenariostage(33)
step
kill General Emmerich##215371 |scenariogoal 34/69396 |goto The Proscenium/0 50.16,53.79
|tip 避免站在 “Reave ”的目标区域。
|only if scenariostage(34)
step
extraaction Throw Wood##443803
|tip 使用屏幕上木头堆附近出现的按钮，将木头扔到舞台中央。
尽可能多地向船扔木头 |scenariogoal 35/66136 |goto The Proscenium/0 49.87,53.73
|only if scenariostage(35)
step
extraaction Wind Blast##443345
|tip 对着剧场中央的船帆使用屏幕上的能力。
尽可能多地投掷风和水 |scenariogoal 36/65013 |goto The Proscenium/0 44.46,54.14
|only if scenariostage(36)
step
kill Rising Kelp##221062+
尽可能多地打败海带元素 |scenariogoal 37/64812 |goto The Proscenium/0 48.88,54.41
|only if scenariostage(37)
step
kill Wanderer Ida##220953 |scenariogoal 38/66617 |goto The Proscenium/0 50.49,52.03
|only if scenariostage(38)
step
extraaction Throw Flowers##432857
|tip 站在花篮附近，向中间的情侣反复投掷鲜花。
向土人夫妇投掷鲜花 |scenariogoal 39/66136 |goto The Proscenium/0 49.69,52.05
|only if scenariostage(39)
step
click Archival Lever##4398426+
click Archival Console##441736+
clicknpc Memory of Clodgran##222227+
尽可能多地存档记忆 |scenariogoal 40/65013 |goto The Proscenium/0 46.21,59.68
|only if scenariostage(40)
step
click Sunbrush Flower##439835+
|tip 在这一区域周围的地面上生长着像灌木丛一样的花朵。
尽可能多地收集鲜花 |scenariogoal 41/64812 |goto The Proscenium/0 45.55,58.09
|only if scenariostage(41)
step
kill Overseer Roskarrag##221071 |scenariogoal 42/68672 |goto The Proscenium/0 49.59,54.28
|only if scenariostage(42)
stickystart "Eat_Food"
stickystart "Drink_Drinks"
step
extraaction Celebrate!##444674
|tip 按屏幕上的按钮跳舞。
彻夜跳舞 |scenariogoal 43/66136 |goto The Proscenium/0 45.61,54.79
|only if scenariostage(43)
step
label "Eat_Food"
click Shalescale Grouper##440870
|tip 点击各种桌子上的石斑鱼和其他食物。
尽可能多地吃食物 |scenariogoal 43/66136 |goto The Proscenium/0 54.13,52.20
|only if scenariostage(43)
step
label "Drink_Drinks"
click Cinderbrew Mug##440861+
|tip 在不同的桌子上。
尽量多喝饮料 |scenariogoal 43/66136 |goto The Proscenium/0 54.44,55.39
|only if scenariostage(43)
step
远离球体 |scenariogoal 44/65013 |goto The Proscenium/0 43.61,53.37
|tip 躲避追逐你的球体，直到阶段结束。
|tip 使用 CC 和减速效果会让这项任务变得更容易。
|only if scenariostage(44)
step
杀死周围的泰坦球敌人 |kill Colossal Titan Orb##221730,Titan Orb##221729
|tip 球体会不断出现，直到阶段结束。
尽可能多地摧毁球体 |scenariogoal 45/64812 |goto The Proscenium/0 49.53,55.04
|only if scenariostage(45)
step
clicknpc Dorn##221756
开始拖拽多恩 |havebuff Towing Dorn##444721 |goto The Proscenium/0 49.06,45.51
|only if scenariostage(46)
step
将多恩拖到传送门 |scenariogoal 46/66625 |goto The Proscenium/0 49.54,61.52
|tip 与其他玩家一起将多恩拖到传送门处
|only if scenariostage(46)
stickystart "Saddle_Cloudrooks"
stickystart "Gather_Cinderbrew"
step
extraaction Wave Goodbye##444062
与尽可能多的平民告别 |scenariogoal 47/66136 |goto The Proscenium/0 43.93,53.18
|only if scenariostage(47)
step
label "Saddle_Cloudrooks"
clicknpc Cloudrook##221459+
为尽可能多的云龙装鞍 |scenariogoal 47/66136 |goto The Proscenium/0 49.87,53.91
|only if scenariostage(47)
step
label "Gather_Cinderbrew"
click Cinderbrew Keg##423582+
|tip 它们看起来像这个区域周围地面上的大型木桶和金属桶。
尽可能多地收集煤渣酒 |scenariogoal 47/66136 |goto The Proscenium/0 51.97,48.18
|only if scenariostage(47)
step
kill Sparkfist Kobold##215789+
保护冒险队不受哥布林的伤害 |scenariogoal 48/65013 |goto The Proscenium/0 49.79,54.32
|only if scenariostage(48)
step
待在光线范围内 |scenariogoal 49/64812 |goto The Proscenium/0 50.32,57.51
|tip 跟着 NPC 的队伍跑，待在黄色虚线圈内。
|tip 这样一直跑到下一个目标。
|only if scenariostage(49)
step
extraaction Flop##444478
|tip 使用 “英勇牺牲 ”的能力。
英勇地死在奈鲁比人手中 |scenariogoal 50/66629 |goto The Proscenium/0 49.40,48.92
|only if scenariostage(50)
step
extraaction Throw Goblet##454572
|tip 把他们扔进桶里。
如何 #6# 高脚杯 |scenariogoal 51/68238 |goto The Proscenium/0 49.60,45.41
|only if scenariostage(51)
step
舞台即将推出 |scenariogoal 52/0
|DEVMSG STAGE 52
|only if scenariostage(52)
step
舞台即将推出 |scenariogoal 53/0
|DEVMSG STAGE 53
|only if scenariostage(53)
step
click Cinderbrew Spill##453787+
清除煤渣酿造的溢出物 |scenariogoal 54/68292 |goto The Proscenium/0 38.02,49.86
|DEVMSG STAGE 54
|only if scenariostage(54)
step
click Ink Spill##453873+
|tip 它们看起来像这附近地面上的黑色大水坑。
清理 #3# 墨水溢出 |scenariogoal 55/68351 |goto The Proscenium/0 33.28,62.11
|only if scenariostage(55)
step
extraaction Sweeping##455216
|tip 使用屏幕上的能力清扫舞台区域。
清扫舞台 |scenariogoal 56/68291 |goto The Proscenium/0 49.33,52.63
|only if scenariostage(56)
step
extraaction Sweeping##455371
|tip 使用屏幕上的能力清扫舞台区域。
清扫舞台 |scenariogoal 57/68356 |goto The Proscenium/0 49.85,53.71
|only if scenariostage(57)
step
clicknpc Browsing Theatergoer##225622+
通知 #6# 浏览剧场的观众 |scenariogoal 58/68120 |goto The Proscenium/0 30.10,51.52
|only if scenariostage(58)
step
clicknpc Bubble-Snatcher##225930
扑通 #8# 小动物 |scenariogoal 59/68232 |goto The Proscenium/0 60.57,79.89
|only if scenariostage(59)
step
click Lucky Plant##453092
触摸幸运植物 |scenariogoal 60/68233 |goto The Proscenium/0 50.27,75.95
|only if scenariostage(60)
step
clicknpc Hungry Cloudrook##226153+
饲料 #5# Cloudrooks |scenariogoal 61/68290 |goto The Proscenium/0 31.71,74.77
|only if scenariostage(61)
step
clicknpc Unsightly Root##225931+
|tip 它们看起来就像这附近地面上蠕动的树根。
|tip 点击它们并跑开，就能拔掉它们。
移除 #6# 不雅观的树根 |scenariogoal 62/68234 |goto The Proscenium/0 45.39,71.82
|only if scenariostage(62)
step
extraaction Dancing##454570
在中心舞台跳舞 |scenariogoal 63/68237 |goto The Proscenium/0 49.67,53.54
|only if scenariostage(63)
step
click Brigganthony the Raptor
亲吻猛禽布里甘东尼 |scenariogoal 64/68235 |goto The Proscenium/0 51.72,79.02
|only if scenariostage(64)
step
extraaction Throw Tapestry##454574
|tip 使用屏幕上的能力将它们扔给人群中的箭头。
投掷 #6# 挂毯 |scenariogoal 65/68239 |goto The Proscenium/0 50.11,45.55
|only if scenariostage(65)
step
clicknpc Queued Theatergoer##225974+
分发 #7# 门票 |scenariogoal 66/68260 |goto The Proscenium/0 33.42,45.73
|only if scenariostage(66)
step
click Vase Prop##453878+
收集 #6# 花瓶道具 |scenariogoal 67/68352 |goto The Proscenium/0 29.88,59.95
|only if scenariostage(67)
step
click Inky Paint##453875+
|tip 它们看起来像这个区域周围地面上的小油漆瓶。
收集 #6# 墨色颜料 |scenariogoal 68/68359 |goto The Proscenium/0 34.19,62.31
|only if scenariostage(68)
step
clicknpc Greenhorn Extra##228307
kill Greenhorn Extra##228307
与  #3# 号绿角演员一起乘火车 |scenariogoal 69/69429 |goto The Proscenium/0 53.08,68.38
|only if scenariostage(69)
step
clicknpc Rabaan##228343
kill Rabaan##228343
与拉巴安一起乘火车 |scenariogoal 70/69441 |goto The Proscenium/0 63.94,51.81
|only if scenariostage(70)
step
clicknpc Elma##228419
kill Elma##228419
与艾尔玛一起坐火车 |scenariogoal 71/69444 |goto The Proscenium/0 64.42,55.39
|only if scenariostage(71)
step
clicknpc Burkhalt##228671
kill Burkhalt##228671
与伯克哈特一起乘火车 |scenariogoal 72/69497 |goto The Proscenium/0 61.96,55.75
|only if scenariostage(72)
step
click Empty Mead Chalice##459376+
|tip 它们看起来像这个区域周围最高阳台上的大杯子。
|tip 它们会以黄点的形式出现在您的小地图上。
收集 #6# 圣杯 |scenariogoal 73/69501 |goto The Proscenium/0 50.59,19.88
|only if scenariostage(73)
step
click Leftover Costume##461540+
|tip 它们看起来像此区域周围地面上的白色衣服碎片。
清理 #5# 演员区域 |scenariogoal 74/69514 |goto The Proscenium/0 53.47,77.52
|only if scenariostage(74)
step
extraaction Bow##433684
|tip 在屏幕上使用该能力，以获得更多观众的认可。
鞠躬 |scenariogoal 75/64783 |goto The Proscenium/0 49.56,53.58
|only if scenariostage(75)
step
寻找新舞台 |complete true |next "Begin_Theater"
|only if inscenario()
step
label "Earn_Audience_Approval"
赢得 #50# 观众的认可 |q 83240/1 |goto Isle of Dorn/0 56.45,50.56
|only if haveq(83240) or completedq(83240)
step
完成剧团剧目 |q 83240/2 |goto Isle of Dorn/0 56.45,50.56
|only if haveq(83240) or completedq(83240)
step
talk Stage Manager Huberta##214296
turnin The Theater Troupe##83240 |goto Isle of Dorn/0 56.44,51.38
|only if haveq(83240) or completedq(83240)
step
等待新剧本... |complete true |next "Begin_Theater"
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Daily Guides\\The War Within (70-80)\\Awakening the Machine",{
author="support@zygorguides.com",
startlevel=70,
areapoiid=8063,
patch='110002',
},[[
step
talk Gnawbles##216164
accept Gearing Up for Trouble##83333 |goto The Ringing Deeps/0 47.66,35.29
step
clicknpc Speaker Kuldas##217128
|tip 点击 {o}Begin Maintenance{} 按钮。
进入机器 |scenariostart Awakening The Machine##2392 |goto The Ringing Deeps/0 47.50,32.03
step
talk Speaker Kuldas##210318
选择 _"我准备好继续了。<开始.>"_ |gossip 120555 |noautogossip
|tip 您需要在库尔达斯抵御敌人，每次 5 波。
|tip 每一波的难度都会逐渐增加。
|tip 每五波战斗结束后，您可以休息一下，为下一波战斗做准备。
与库尔达斯议长交谈 |scenariostage 1
step
杀死一波又一波进攻的敌人 |kill Swarmbot##229691,Corrupted Machinist##229695,Explosive Bomberbot##229706
|tip {o}Swarmbots{} 被击中后会加速。
|tip 在它们在库尔达斯身边爆炸之前杀死它们。
|tip 打断机械师的攻击，瞬间杀死他们。
|tip 机械师会对目标造成伤害。
|tip {炸弹人{}需要快速击杀，以免它们在库尔达斯的攻击范围内爆炸。
防御库尔达斯议长 |q 84631 |future
step
talk Speaker Kuldas##210318
|tip 稍作休息，恢复冷却时间，为接下来的五波做准备。
|tip 除了之前的机制外，{o}故障幽能塔{}会出现并向库尔达斯发射蓝色光束。
|tip 在库尔达斯受到过多伤害之前，迅速击杀它们。
选择 _"我准备好继续了。 <开始.>"_ |gossip 120555 |noautogossip
confirm |q 84632 |future
step
杀死一波又一波进攻的敌人 |kill Swarmbot##229691,Corrupted Machinist##229695,Explosive Bomberbot##229706,Malfunctioning Pylon##229739
|tip {o}Swarmbots{} 被击中后会加速。
|tip 在它们在库尔达斯身边爆炸之前杀死它们。
|tip 打断机械师的攻击，瞬间杀死他们。
|tip 机械师会对目标造成伤害。
|tip {炸弹人{}需要快速击杀，以免它们在库尔达斯的攻击范围内爆炸。
|tip 站在{o}失灵铁塔{}发出的蓝色光束的路径上，防止它们击中库尔达斯。
|tip 如果{o}挥发性岩浆{}包围了你，请远离库尔达斯，并避开岩浆掉落的水坑。
防御库尔达斯议长 |q 84632 |future
step
talk Speaker Kuldas##210318
|tip 稍作休息，恢复冷却时间，为接下来的五波做准备。
|tip 除了之前的机制外，{o}医疗机器人{}还会掉落绿色物品，当你走过它们时，它们会治疗库尔达斯。
|tip 它们不会自动生成，因此在库尔达斯健康值缺失之前尽量避免使用它们。
|tip {无效机器人{}会对附近的敌人造成伤害减免。
选择 _"我准备好继续了。 <开始.>"_ |gossip 120555 |noautogossip
confirm |q 84633 |future
step
杀死一波又一波进攻的敌人 |kill Swarmbot##229691,Corrupted Machinist##229695,Explosive Bomberbot##229706,Malfunctioning Pylon##229739,Medbot##229769,Nullbot##229729
|tip {o}Swarmbots{} 被击中后会加速。
|tip 在它们在库尔达斯身边爆炸之前杀死它们。
|tip 打断机械师的攻击，瞬间杀死他们。
|tip 机械师会对目标造成伤害。
|tip {炸弹人{}需要快速击杀，以免它们在库尔达斯的攻击范围内爆炸。
|tip 站在{o}失灵铁塔{}发出的蓝色光束的路径上，防止它们击中库尔达斯。
|tip 如果{o}挥发性岩浆{}包围了你，请远离库尔达斯，并避开岩浆掉落的水坑。
|tip {无效机器人{}会对附近的敌人造成伤害减免。
防御库尔达斯议长 |q 84633 |future
step
talk Speaker Kuldas##210318
|tip 稍作休息，恢复冷却时间，为接下来的五波做准备。
选择 _"我准备好继续了。 <开始.>"_ |gossip 120555 |noautogossip
测试 |complete machinewave() >= 16
step
杀死一波又一波进攻的敌人 |kill Swarmbot##229691,Corrupted Machinist##229695,Explosive Bomberbot##229706,Malfunctioning Pylon##229739,Medbot##229769,Nullbot##229729
|tip {o}Swarmbots{} 被击中后会加速。
|tip 在它们在库尔达斯身边爆炸之前杀死它们。
|tip 打断机械师的攻击，瞬间杀死他们。
|tip 机械师会对目标造成伤害。
|tip {炸弹人{}需要快速击杀，以免它们在库尔达斯的攻击范围内爆炸。
|tip 站在{o}失灵铁塔{}发出的蓝色光束的路径上，防止它们击中库尔达斯。
|tip 如果{o}挥发性岩浆{}包围了你，请远离库尔达斯，并避开岩浆掉落的水坑。
|tip {无效机器人{}会对附近的敌人造成伤害减免。
防御库尔达斯议长 |q 84634 |future
step
click Awakened Cache##465243
掠夺觉醒者藏宝库 |q 84642 |future |goto The Ringing Deeps/0 47.48,31.91
|only if completedq(84631)
step
click Awakened Cache##465242
掠夺觉醒者藏宝库 |q 84644 |future |goto The Ringing Deeps/0 47.54,32.02
|only if completedq(84632)
step
click Awakened Cache##465241
掠夺觉醒者藏宝库 |q 84646 |future |goto The Ringing Deeps/0 47.55,31.89
|only if completedq(84633)
step
click Awakened Cache##464938
掠夺觉醒者藏宝库 |q 84647 |future |goto The Ringing Deeps/0 47.54,31.96
|only if completedq(84634)
step
talk Gnawbles##216164
turnin Gearing Up for Trouble##83333 |goto The Ringing Deeps/0 47.66,35.29
]])
ZGV.BETAEND()
