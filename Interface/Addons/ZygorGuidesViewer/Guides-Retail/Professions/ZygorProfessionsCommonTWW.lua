local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("ProfessionsCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Alchemy\\Leveling Guides\\Khaz Algar Alchemy 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Alchemy profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Alchemy') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Alchemy') > 0 and skill('Khaz Algar Alchemy') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 菌类之花: 84
|tip 阿拉索之矛: 72
|tip 额外草药自选: 50
|tip 这些总数是大概的。由于野外实验的性质，我们无法知道你会得到哪些配方。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约50。
点击这里继续 |confirm
step
talk Darean##223644
学习炼金术 |skillmax Alchemy,300 |goto Dornogal/0 47.10,70.48
step
talk Darean##223644
训练卡兹亚尔加炼金术 |skillmax Khaz Algar Alchemy,100 |goto Dornogal/0 47.10,70.48
step
talk Grink##219091
buy 50 Gilded Vial##211806 |goto Dornogal/0 47.33,70.76 |or
'|complete skill("Khaz Algar Alchemy") >= 21 |or |only if default
'|complete skill("Khaz Algar Alchemy") >= 26 |or |only if KulTiran
'|complete skill("Khaz Algar Alchemy") >= 36 |or |only if Goblin
step
collect 50 Mycobloom##210796 |or
_Or_
collect 50 Mycobloom##210797 |or
_Or_
collect 50 Mycobloom##210798 |or
|tip 使用草药学来刷或者从拍卖行购买
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Azj-Kahet)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Hallowfall)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Isle of Dorn)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (The Ringing Deeps)"
'|complete skill("Khaz Algar Alchemy") >= 21 |or |only if default
'|complete skill("Khaz Algar Alchemy") >= 26 |or |only if KulTiran
'|complete skill("Khaz Algar Alchemy") >= 36 |or |only if Goblin
step
create 10 Algari Healing Potion##430590,Khaz Algar Alchemy,21 |goto Dornogal/0 47.10,70.48 |only if default
create 10 Algari Healing Potion##430590,Khaz Algar Alchemy,26 |goto Dornogal/0 47.10,70.48 |only if KulTiran
create 10 Algari Healing Potion##430590,Khaz Algar Alchemy,36 |goto Dornogal/0 47.10,70.48 |only if Goblin
step
create Neutralize Concoctions##427214,Khaz Algar Alchemy,27 |goto Dornogal/0 47.10,70.48 |n |only if default
create Neutralize Concoctions##427214,Khaz Algar Alchemy,32 |goto Dornogal/0 47.10,70.48 |n |only if KulTiran
create Neutralize Concoctions##427214,Khaz Algar Alchemy,42 |goto Dornogal/0 47.10,70.48 |n |only if Goblin
|tip 将Neutralize Concoctions用于你的Healing Potions，以获取Coreway Catalysts。
collect 4 Coreway Catalyst##210815 |or
'|complete skill("Khaz Algar Alchemy") >= 27 |or |only if default
'|complete skill("Khaz Algar Alchemy") >= 32 |or |only if KulTiran
'|complete skill("Khaz Algar Alchemy") >= 42 |or |only if Goblin
step
create 4 Wild Experimentation##427174,Khaz Algar Alchemy,27 |goto Dornogal/0 47.10,70.48 |only if default
create 4 Wild Experimentation##427174,Khaz Algar Alchemy,32 |goto Dornogal/0 47.10,70.48 |only if KulTiran
create 4 Wild Experimentation##427174,Khaz Algar Alchemy,42 |goto Dornogal/0 47.10,70.48 |only if Goblin
|tip 这将教你随机配方。
step
talk Darean##223644
训练花粉 |learn Petal Powder##462122 |goto Dornogal/0 47.10,70.48
stickystart "Collect_Arathor's_Spear_35"
step
collect 24 Mycobloom##210796 |or
_Or_
collect 24 Mycobloom##210797 |or
_Or_
collect 24 Mycobloom##210798 |or
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Azj-Kahet)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Hallowfall)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Isle of Dorn)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (The Ringing Deeps)"
'|complete skill("Khaz Algar Alchemy") >= 35 |or |only if default
'|complete skill("Khaz Algar Alchemy") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Alchemy") >= 50 |or |only if Goblin
step
label "Collect_Arathor's_Spear_35"
collect 72 Arathor's Spear##210808 |or
_Or_
collect 72 Arathor's Spear##210809 |or
_Or_
collect 72 Arathor's Spear##210810 |or
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (Hallowfall)" |notinsticky
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (The Ringing Deeps)" |notinsticky
'|complete skill("Khaz Algar Alchemy") >= 35 |or |only if default
'|complete skill("Khaz Algar Alchemy") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Alchemy") >= 50 |or |only if Goblin
step
create 12 Petal Powder##462122,Khaz Algar Alchemy,35 |goto Dornogal/0 47.10,70.48 |only if default
create 12 Petal Powder##462122,Khaz Algar Alchemy,40 |goto Dornogal/0 47.10,70.48 |only if KulTiran
create 12 Petal Powder##462122,Khaz Algar Alchemy,50 |goto Dornogal/0 47.10,70.48 |only if Goblin
step
提升在卡兹·阿尔加尔炼金术中的技能等级到100 |skill Khaz Algar Alchemy,100 |or |only if default
卡尔扎尔炼金术技能等级达到105 |skill Khaz Algar Alchemy,105 |or |only if KulTiran
卡尔扎尔炼金术技能等级达到105 |skill Khaz Algar Alchemy,115 |or |only if Goblin
|tip 从这一刻起，由于野性实验，玩家学到的配方便变得无法预知。
|tip 制造你拥有的便宜的黄色或橙色配方。
|tip 当你没有黄色或橙色配方时，使用Meticulous Experimentation找到一个Flask配方。
|tip 合剂能让你达到最高技能等级。
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Leveling Guides\\Khaz Algar Blacksmithing 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Blacksmithing profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Blacksmithing') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Blacksmithing') > 0 and skill('Khaz Algar Blacksmithing') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 铋: 533
|tip 铁爪矿石: 33
|tip 结晶粉末: 18
|tip 这些总数是大概的。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约50。
点击这里继续 |confirm
step
talk Darean##223644
|tip 在建筑内。
训练锻造术 |skillmax Blacksmithing,300 |goto Dornogal/0 49.19,63.49
step
talk Darean##223644
|tip 在建筑内。
训练卡扎尔加尔锻造 |skillmax Khaz Algar Blacksmithing,100 |goto Dornogal/0 49.19,63.49
step
talk Darean##223644
|tip 在建筑内。
训练核心合金 |learn Core Alloy##450216 |goto Dornogal/0 49.19,63.49
step
talk Borgos##223643
buy 320 Echoing Flux##226202 |goto Dornogal/0 48.71,62.52 |or
'|complete skill("Khaz Algar Blacksmithing") >= 15 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 20 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 25 |or |only if LightforgedDraenei
step
collect 400 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"
'|complete skill("Khaz Algar Blacksmithing") >= 15 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 20 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 25 |or |only if LightforgedDraenei
step
create 40 Core Alloy##450216,Khaz Algar Blacksmithing,40 total |goto Dornogal/0 49.19,63.49
|tip 制造这个物品你需要站在铁砧旁边
|tip 你可能需要额外的制作来达到15。
|tip 保存这些，我们稍后会用到它们。
step
create Core Alloy##450216,Khaz Algar Blacksmithing,15 |goto Dornogal/0 49.19,63.49 |only if default
create Core Alloy##450216,Khaz Algar Blacksmithing,15 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create Core Alloy##450216,Khaz Algar Blacksmithing,15 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
|tip 你可能需要额外的制作来达到15。
|tip 保存这些，我们稍后会用到它们。
step
talk Darean##223644
|tip 在建筑内。
训练挖掘者的板甲胸甲 |learn Dredger's Plate Breastplate##450259 |goto Dornogal/0 49.19,63.49
stickystart "Collect_Core_Alloy_21"
step
collect 9 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"
'|complete skill("Khaz Algar Blacksmithing") >= 21 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 26 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if LightforgedDraenei
step
label "Collect_Core_Alloy_21"
collect 6 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 21 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 26 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if LightforgedDraenei
step
create 3 Dredger's Plate Breastplate##450259,Khaz Algar Blacksmithing,21 |goto Dornogal/0 49.19,63.49 |only if default
create 3 Dredger's Plate Breastplate##450259,Khaz Algar Blacksmithing,26 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 3 Dredger's Plate Breastplate##450259,Khaz Algar Blacksmithing,31 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
talk Darean##223644
|tip 在建筑内。
训练熟练铁匠之锤 |learn Proficient Blacksmith's Hammer##450273 |goto Dornogal/0 49.19,63.49
step
collect 1 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 22 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 27 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 32 |or |only if LightforgedDraenei
step
create 1 Proficient Blacksmith's Hammer##450273,Khaz Algar Blacksmithing,22 |goto Dornogal/0 49.19,63.49 |only if default
create 1 Proficient Blacksmith's Hammer##450273,Khaz Algar Blacksmithing,27 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 1 Proficient Blacksmith's Hammer##450273,Khaz Algar Blacksmithing,32 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
talk Darean##223644
|tip 在建筑内。
训练挖掘者的发达巨带 |learn Dredger's Developed Greatbelt##450260 |goto Dornogal/0 49.19,63.49
stickystart "Collect_Core_Alloy_26"
step
collect 2 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"
'|complete skill("Khaz Algar Blacksmithing") >= 26 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 36 |or |only if LightforgedDraenei
step
label "Collect_Core_Alloy_26"
collect 4 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 26 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 36 |or |only if LightforgedDraenei
step
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,26 |goto Dornogal/0 49.19,63.49 |only if default
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,31 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,36 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
talk Darean##223644
|tip 在建筑内。
训练精通铁匠工具箱 |learn Proficient Blacksmith's Toolbox##450274 |goto Dornogal/0 49.19,63.49
step
collect 1 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 27 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 32 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 37 |or |only if LightforgedDraenei
step
create 1 Proficient Blacksmith's Toolbox##450274,Khaz Algar Blacksmithing,27 |goto Dornogal/0 49.19,63.49 |only if default
create 1 Proficient Blacksmith's Toolbox##450274,Khaz Algar Blacksmithing,32 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 1 Proficient Blacksmith's Toolbox##450274,Khaz Algar Blacksmithing,37 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
stickystart "Collect_Core_Alloy_31"
step
collect 2 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 36 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 41 |or |only if LightforgedDraenei
step
label "Collect_Core_Alloy_31"
collect 4 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 31 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 36 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 41 |or |only if LightforgedDraenei
step
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,31 |goto Dornogal/0 49.19,63.49 |only if default
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,36 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 2 Dredger's Developed Greatbelt##450260,Khaz Algar Blacksmithing,41 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
talk Darean##223644
|tip 在建筑内。
训练挖掘者的进化头盔 |learn Dredger's Developed Helm##450262 |goto Dornogal/0 49.19,63.49
stickystart "Collect_Core_Alloy_41"
step
collect 20 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"
|loadguide "Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"
'|complete skill("Khaz Algar Blacksmithing") >= 41 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 46 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 51 |or |only if LightforgedDraenei
step
label "Collect_Core_Alloy_41"
collect 15 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 41 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 46 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 51 |or |only if LightforgedDraenei
step
create 5 Dredger's Developed Helm##450262,Khaz Algar Blacksmithing,41 |goto Dornogal/0 49.19,63.49 |only if default
create 5 Dredger's Developed Helm##450262,Khaz Algar Blacksmithing,46 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 5 Dredger's Developed Helm##450262,Khaz Algar Blacksmithing,51 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
talk Darean##223644
|tip 在建筑内。
训练淬火框架 |learn Tempered Framework##450289 |goto Dornogal/0 49.19,63.49
stickystart "Collect_Core_Alloy_50"
step
collect 9 Crystalline Powder##213610 |or
|tip 从Khaz Algar专业点收集它们或从拍卖行购买。
'|complete skill("Khaz Algar Blacksmithing") >= 50 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 55 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 60 |or |only if LightforgedDraenei
step
label "Collect_Core_Alloy_50"
collect 9 Core Alloy##222417 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Blacksmithing") >= 50 |or |only if default
'|complete skill("Khaz Algar Blacksmithing") >= 55 |or |only if DarkIronDwarf or KulTiran
'|complete skill("Khaz Algar Blacksmithing") >= 60 |or |only if LightforgedDraenei
step
create 9 Tempered Framework##450289,Khaz Algar Blacksmithing,50 |goto Dornogal/0 49.19,63.49 |only if default
create 9 Tempered Framework##450289,Khaz Algar Blacksmithing,55 |goto Dornogal/0 49.19,63.49 |only if DarkIronDwarf or KulTiran
create 9 Tempered Framework##450289,Khaz Algar Blacksmithing,60 |goto Dornogal/0 49.19,63.49 |only if LightforgedDraenei
|tip 制造这个物品你需要站在铁砧旁边
step
卡兹·阿尔加锻造技能达到100级 |skill Khaz Algar Blacksmithing,100 |or |only if default
在卡兹·阿尔加锻造技能达到105级 |skill Khaz Algar Blacksmithing,105 |or |only if DarkIronDwarf or KulTiran
在卡兹·阿尔加锻造技能达到105级 |skill Khaz Algar Blacksmithing,110 |or |only if LightforgedDraenei
|tip 从这一点开始，由于需要灵魂绑定材料，继续获取点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Leveling Guides\\Khaz Algar Cooking 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Cooking profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Cooking') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Cooking') > 0 and skill('Khaz Algar Cooking') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 基本牛肉：170
|tip 切分牛排: 580
|tip 新鲜鱼片 400
|tip 卡兹阿尔加番茄: 190
|tip 晶化香料：180
|tip 核心之尘: 360
|tip 双生药草: 184
|tip 辣椒: 40
|tip 这些总数是大概的。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级达到大约70。
点击这里继续 |confirm
step
talk Athodas##219104
|tip 旅店内
训练烹饪 |skillmax Cooking,300 |goto Dornogal/0 44.17,45.85
step
talk Athodas##219104
|tip 旅店内
训练卡兹阿尔加尔烹饪 |skillmax Khaz Algar Cooking,100 |goto Dornogal/0 44.17,45.85
step
collect 170 Basically Beef##223512 |or
|tip 从卡兹·阿加尔的生物那里刷，或者从拍卖行购买。
'|complete skill("Khaz Algar Cooking") >= 25 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 40 |or |only if Pandaren
step
create 17 Portioned Steak##445118,Khaz Algar Cooking,100 total |goto Dornogal/0 44.17,45.85
step
create 17 Spiced Meat Stock##445119,Khaz Algar Cooking,50 total |goto Dornogal/0 44.17,45.85
step
talk Athodas##219104
|tip 旅店内
训练腌制里脊 |learn Marinated Tenderloin##445103 |goto Dornogal/0 44.17,45.85
stickystart "Collect_Spiced_Meat_Stock_40"
step
collect 100 Portioned Steak##222738 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Cooking") >= 40 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 55 |or |only if Pandaren
step
label "Collect_Spiced_Meat_Stock_40"
collect 50 Spiced Meat Stock##222739 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Cooking") >= 40 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 55 |or |only if Pandaren
step
talk Kronzon##219103
buy 150 Khaz Algar Tomato##222699 |goto Dornogal/0 43.60,45.67 |or 2
buy 100 Granulated Spices##222700 |goto Dornogal/0 43.60,45.67 |or 2
'|complete skill("Khaz Algar Cooking") >= 40 |override |only if default
'|complete skill("Khaz Algar Cooking") >= 55 |override |only if Pandaren
step
create 10 Marinated Tenderloin##445103,Khaz Algar Cooking,40 |goto Dornogal/0 44.17,45.85 |only if default
create 10 Marinated Tenderloin##445103,Khaz Algar Cooking,55 |goto Dornogal/0 44.17,45.85 |only if Pandaren
step
talk Athodas##219104
|tip 旅店内
训练管理员暮光肉干 |learn Tender Twilight Jerky##445093 |goto Dornogal/0 44.17,45.85
step
collect 120 Portioned Steak##222738 |or
|tip 用烹饪制造它们或从拍卖行购买。
'|complete skill("Khaz Algar Cooking") >= 50 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 65 |or |only if Pandaren
step
talk Kronzon##219103
buy 64 Twined Herbs##222695 |goto Dornogal/0 43.60,45.67 |or 2
buy 40 Coreway Dust##222697 |goto Dornogal/0 43.60,45.67 |or 2
'|complete skill("Khaz Algar Cooking") >= 50 |override |only if default
'|complete skill("Khaz Algar Cooking") >= 65 |override |only if Pandaren
step
create 8 Tender Twilight Jerky##445093,Khaz Algar Cooking,50 |goto Dornogal/0 44.17,45.85 |only if default
create 8 Tender Twilight Jerky##445093,Khaz Algar Cooking,65 |goto Dornogal/0 44.17,45.85 |only if Pandaren
step
talk Athodas##219104
|tip 旅店内
塞满东西的洞穴辣椒 |learn Stuffed Cave Peppers##445106 |goto Dornogal/0 44.17,45.85
step
collect 200 Portioned Steak##222738 |or
|tip 用烹饪制造它们或从拍卖行购买。
'|complete skill("Khaz Algar Cooking") >= 60 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 75 |or |only if Pandaren
step
talk Kronzon##219103
buy 40 Crunchy Peppers##222696  |goto Dornogal/0 43.60,45.67 |or 3
buy 40 Khaz Algar Tomato##222699 |goto Dornogal/0 43.60,45.67 |or 3
buy 80 Granulated Spices##222700 |goto Dornogal/0 43.60,45.67 |or 3
'|complete skill("Khaz Algar Cooking") >= 60 |override |only if default
'|complete skill("Khaz Algar Cooking") >= 75 |override |only if Pandaren
step
create 8 Stuffed Cave Peppers##445106,Khaz Algar Cooking,60 |goto Dornogal/0 44.17,45.85 |only if default
create 8 Stuffed Cave Peppers##445106,Khaz Algar Cooking,75 |goto Dornogal/0 44.17,45.85 |only if Pandaren
step
talk Athodas##219104
|tip 旅店内
戏谑之棋训练 |learn Jester's Board##445110 |goto Dornogal/0 44.17,45.85
step
collect 400 Fresh Fillet##222741 |or
|tip 把抓到的鱼去骨或从拍卖行购买
'|complete skill("Khaz Algar Cooking") >= 70 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 85 |or |only if Pandaren
step
collect 160 Portioned Steak##222738 |or
|tip 用烹饪制造它们或从拍卖行购买。
'|complete skill("Khaz Algar Cooking") >= 70 |or |only if default
'|complete skill("Khaz Algar Cooking") >= 85 |or |only if Pandaren
step
talk Kronzon##219103
buy 120 Twined Herbs##222695 |goto Dornogal/0 43.60,45.67 |or 2
buy 320 Coreway Dust##222697 |goto Dornogal/0 43.60,45.67 |or 2
'|complete skill("Khaz Algar Cooking") >= 70 |override |only if default
'|complete skill("Khaz Algar Cooking") >= 85 |override |only if Pandaren
step
create 8 Jester's Board##445110,Khaz Algar Cooking,70 |goto Dornogal/0 44.17,45.85 |only if default
create 8 Jester's Board##445110,Khaz Algar Cooking,85 |goto Dornogal/0 44.17,45.85 |only if Pandaren
step
在卡兹·阿尔加尔烹饪技能达到100级 |skill Khaz Algar Cooking,100 |goto 46.53,46.25 |or |only if default
在卡兹·阿尔加尔烹饪技能达到115 |skill Khaz Algar Cooking,115 |goto 46.53,46.25 |or |only if Pandaren
|tip 从此处开始，可以根据你从掉落或每周事件中获得的配方制作大量的配方
|tip 建议尽量制作顶级佳肴或宴席。如果可能的话
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Leveling Guides\\Khaz Algar Enchanting 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Enchanting profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Enchanting') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Enchanting') > 0 and skill('Khaz Algar Enchanting') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 风暴之尘: 405
|tip 编码绿林: 4
|tip 这些总数是大概的。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约65
点击这里继续 |confirm
step
talk Nagad##219085
学习附魔 |skillmax Enchanting,300 |goto Dornogal/0 52.90,71.32
step
talk Nagad##219085
训练卡兹·阿尔加尔附魔 |skillmax Khaz Algar Enchanting,100 |goto Dornogal/0 52.90,71.32
step
talk Llande##219086
collect 87 Enchanting Vellum##38682 |goto Dornogal/0 52.34,71.67 |or
|tip 用这些卖你的附魔。
'|complete skill("Khaz Algar Enchanting") >= 10 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 15 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 25 |or |only if BloodElf
step
collect 45 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 10 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 15 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 25 |or |only if BloodElf
step
create 9 Enchant Ring - Glimmering Haste##445384,Khaz Algar Enchanting,10 |goto Dornogal/0 52.90,71.32 |only if default
create 9 Enchant Ring - Glimmering Haste##445384,Khaz Algar Enchanting,15 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 9 Enchant Ring - Glimmering Haste##445384,Khaz Algar Enchanting,25 |goto Dornogal/0 52.90,71.32 |only if BloodElf
|tip 你如果想省材料的话，也可以通过分解铸铸迦的物品来提升1-25级附魔技能等级
step
talk Nagad##219085
训练闪烁的暴击 |learn Glimmering Critical Strike##445358 |goto Dornogal/0 52.90,71.32
step
collect 25 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 15 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 20 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 30 |or |only if BloodElf
step
create 5 Enchant Ring - Glimmering Critical Strike##445358,Khaz Algar Enchanting,15 |goto Dornogal/0 52.90,71.32 |only if default
create 5 Enchant Ring - Glimmering Critical Strike##445358,Khaz Algar Enchanting,20 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 5 Enchant Ring - Glimmering Critical Strike##445358 ,Khaz Algar Enchanting,30 |goto Dornogal/0 52.90,71.32 |only if BloodElf
|tip 你如果想省材料的话，也可以通过分解铸铸迦的物品来提升1-25级附魔技能等级
step
talk Nagad##219085
训练蛛丝般的闪避之语 |learn Whisper of Silken Avoidance##445344 |goto Dornogal/0 52.90,71.32
step
collect 100 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 25 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 30 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 40 |or |only if BloodElf
step
create 10 Enchant Cloak - Whisper of Silken Avoidance##445344,Khaz Algar Enchanting,25 |goto Dornogal/0 52.90,71.32 |only if default
create 10 Enchant Cloak - Whisper of Silken Avoidance##445344,Khaz Algar Enchanting,30 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 10 Enchant Cloak - Whisper of Silken Avoidance##445344,Khaz Algar Enchanting,40 |goto Dornogal/0 52.90,71.32 |only if BloodElf
|tip 如果你想节省材料，你可以通过分解物品将等级提升到1-25。
step
talk Nagad##219085
训练微光精通 |learn Glimmering Mastery##445381 |goto Dornogal/0 52.90,71.32
step
collect 50 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 35 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 50 |or |only if BloodElf
step
create 10 Enchant Ring - Glimmering Mastery##445381,Khaz Algar Enchanting,35 |goto Dornogal/0 52.90,71.32 |only if default
create 10 Enchant Ring - Glimmering Mastery##445381,Khaz Algar Enchanting,40 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 10 Enchant Ring - Glimmering Mastery##445381,Khaz Algar Enchanting,50 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
talk Nagad##219085
训练装甲速度之影 |learn Whisper of Armored Speed##445376 |goto Dornogal/0 52.90,71.32
step
collect 50 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 40 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 45 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 55 |or |only if BloodElf
step
create 5 Enchant Bracer - Whisper of Armored Speed##445376,Khaz Algar Enchanting,40 |goto Dornogal/0 52.90,71.32 |only if default
create 5 Enchant Bracer - Whisper of Armored Speed##445376,Khaz Algar Enchanting,45 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 5 Enchant Bracer - Whisper of Armored Speed##445376,Khaz Algar Enchanting,55 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
talk Nagad##219085
训练魔化矛木魔杖 |learn Enchanted Spearwood Wand##445324 |goto Dornogal/0 52.90,71.32
stickystart "Collect_Codified_Greenwood_52"
step
collect 20 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 52 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 57 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 67 |or |only if BloodElf
step
label "Collect_Codified_Greenwood_52"
collect 4 Codified Greenwood##222555 |or
|tip 用雕文制造它们或者从拍卖行购买
'|complete skill("Khaz Algar Enchanting") >= 52 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 57 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 67 |or |only if BloodElf
step
create 3 Enchanted Spearwood Wand##445324,Khaz Algar Enchanting,52 |goto Dornogal/0 52.90,71.32 |only if default
create 3 Enchanted Spearwood Wand##445324,Khaz Algar Enchanting,57 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 3 Enchanted Spearwood Wand##445324,Khaz Algar Enchanting,67 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
talk Nagad##219085
训练闪光全能 |learn Glimmering Versatility##445340 |goto Dornogal/0 52.90,71.32
step
collect 15 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 55 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 60 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 70 |or |only if BloodElf
step
create 3 Enchant Ring - Glimmering Versatility##445340,Khaz Algar Enchanting,55 |goto Dornogal/0 52.90,71.32 |only if default
create 3 Enchant Ring - Glimmering Versatility##445340,Khaz Algar Enchanting,60 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 3 Enchant Ring - Glimmering Versatility##445340,Khaz Algar Enchanting,70 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
talk Nagad##219085
训练丝滑疾速低语 |learn Whisper of Silken Speed##445373 |goto Dornogal/0 52.90,71.32
step
collect 50 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 60 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 65 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 75 |or |only if BloodElf
step
create 5 Enchant Cloak - Whisper of Silken Speed##445373,Khaz Algar Enchanting,60 |goto Dornogal/0 52.90,71.32 |only if default
create 5 Enchant Cloak - Whisper of Silken Speed##445373,Khaz Algar Enchanting,65 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 5 Enchant Cloak - Whisper of Silken Speed##445373,Khaz Algar Enchanting,75 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
talk Nagad##219085
训练装甲水蛭低语 |learn Whisper of Armored Leech##445374 |goto Dornogal/0 52.90,71.32
step
collect 50 Storm Dust##219946 |or
|tip 从卡兹·艾尔加物品中分解或从拍卖行购买它们
'|complete skill("Khaz Algar Enchanting") >= 65 |or |only if default
'|complete skill("Khaz Algar Enchanting") >= 70 |or |only if KulTiran
'|complete skill("Khaz Algar Enchanting") >= 80 |or |only if BloodElf
step
create 5 Enchant Bracer - Whisper of Armored Leech##445374,Khaz Algar Enchanting,65 |goto Dornogal/0 52.90,71.32 |only if default
create 5 Enchant Bracer - Whisper of Armored Leech##445374,Khaz Algar Enchanting,70 |goto Dornogal/0 52.90,71.32 |only if KulTiran
create 5 Enchant Bracer - Whisper of Armored Leech##445374,Khaz Algar Enchanting,80 |goto Dornogal/0 52.90,71.32 |only if BloodElf
step
卡兹阿尔加附魔技能达到100级 |skill Khaz Algar Enchanting,100 |or |only if default
提升卡兹阿尔加尔附魔技能等级至105级 |skill Khaz Algar Enchanting,105 |or |only if KulTiran
赫兹阿尔加附魔达到110级技能 |skill Khaz Algar Enchanting,115 |or |only if BloodElf
|tip 从这一点开始，由于需要灵魂绑定材料，继续获取点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Leveling Guides\\Khaz Algar Engineering 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Engineering profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Engineering') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Engineering') > 0 and skill('Khaz Algar Engineering') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 一堆废料：85
|tip 铋: 200
|tip 回旋齿轮: 20
|tip 稀奇古怪的电线：20
|tip 这些总数是大概的。
|tip 由于通过Scouring学习配方的随机性，我们无法准确预测你能制作哪些配方。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能提高到大约40级。
点击这里继续 |confirm
step
talk Thermalseer Arhdas##219099
训练工程学 |skillmax Engineering,300 |goto Dornogal/0 49.21,55.94
step
talk Thermalseer Arhdas##219099
训练卡兹阿尔加工程学 |skillmax Khaz Algar Engineering,100 |goto Dornogal/0 49.21,55.94
step
talk Supply Foreman Drezmol##219098
buy Arclight Spanner##6219 |goto Dornogal/0 49.30,55.62 |or 2
buy Gyromatic Micro-Adjustor##10498 |goto Dornogal/0 49.30,55.62 |or 2
|tip 你也可以从拍卖行购买或者制作Gnomish Army Knife或者Utimate Gnomish Army Knife，跳过这一步。
'|complete skill("Khaz Algar Engineering") >= 15 |override |only if default
'|complete skill("Khaz Algar Engineering") >= 20 |override |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 30 |override |only if Goblin
step
击杀此区域的敌人
collect 85 Pile of Rusted Scrap##219150 |goto Isle of Dorn/0 63.70,43.15 |or
|tip 这些掉落自卡兹阿尔加的所有怪物。
'|complete skill("Khaz Algar Engineering") >= 15 |or |only if default
'|complete skill("Khaz Algar Engineering") >= 20 |or |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 30 |or |only if Goblin
step
create 17 Scour Through Scrap##447310,Khaz Algar Engineering,15 |goto Dornogal/0 49.21,55.94 |only if default
create 17 Scour Through Scrap##447310,Khaz Algar Engineering,20 |goto Dornogal/0 49.21,55.94 |only if KulTiran
create 17 Scour Through Scrap##447310,Khaz Algar Engineering,30 |goto Dornogal/0 49.21,55.94 |only if Goblin
|tip 你可能需要制造更多或更少这些东西。
step
collect 200 Bismuth##210930 |or
|tip 通过采矿刷或从拍卖行购买
'|complete skill("Khaz Algar Engineering") >= 20 |or |only if default
'|complete skill("Khaz Algar Engineering") >= 25 |or |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 35 |or |only if Goblin
step
create 50 Handful of Bismuth Bolts##447336,Khaz Algar Engineering,80 total |goto Dornogal/0 49.21,55.94
|tip 你应该已经发现了这个清道夫废料。
step
collect 80 Handful of Bismuth Bolts##221853 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Engineering") >= 40 |or |only if default
'|complete skill("Khaz Algar Engineering") >= 45 |or |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 55 |or |only if Goblin
stickystart "Collect_Whimsical_Wiring_40"
step
collect 20 Gyrating Gear##221859 |or
|tip 通过工程学制作它们或者从拍卖行购买它们。
|tip 每个 Gyrating Gear 需要 1个 Junk Bucket，3个 Bismuth，和 1个 Aqirite
'|complete skill("Khaz Algar Engineering") >= 40 |or |only if default
'|complete skill("Khaz Algar Engineering") >= 45 |or |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 55 |or |only if Goblin
step
label "Collect_Whimsical_Wiring_40"
collect 20 Whimsical Wiring##221856 |or
|tip 通过工程学制作它们或者从拍卖行购买它们。
|tip 每个异想天开的电线需要1个破旧的电线和3个铋
'|complete skill("Khaz Algar Engineering") >= 40 |or |only if default
'|complete skill("Khaz Algar Engineering") >= 45 |or |only if KulTiran
'|complete skill("Khaz Algar Engineering") >= 55 |or |only if Goblin
step
create 10 Bismuth Fueled Samophlange##447332,Khaz Algar Engineering,40 |goto Dornogal/0 49.21,55.94 |only if default
create 10 Bismuth Fueled Samophlange##447332,Khaz Algar Engineering,45 |goto Dornogal/0 49.21,55.94 |only if KulTiran
create 10 Bismuth Fueled Samophlange##447332,Khaz Algar Engineering,55 |goto Dornogal/0 49.21,55.94 |only if Goblin
step
达到卡兹阿尔加工程学技能等级100 |skill Khaz Algar Engineerin,100 |or |only if default
在卡兹阿尔加工程学达到技能等级105 |skill Khaz Algar Engineerin,105 |or |only if KulTiran
在卡兹阿尔加工程学中达到技能等级110 |skill Khaz Algar Engineering,115 |or |only if Goblin
|tip 从这一点开始，要继续获取积分变得非常困难，因为你必须依赖发明来获取配方。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Leveling Guides\\Khaz Algar Fishing 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Fishing profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Fishing') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Fishing') > 0 and skill('Khaz Algar Fishing') < 100 and level >= 70 end,
},[[
step
talk Drokar##219106
训练钓鱼 |skillmax Fishing,300 |goto Dornogal/0 50.49,26.87
step
talk Drokar##219106
训练卡兹阿尔加钓鱼 |skillmax Khaz Algar Fishing,100 |goto Dornogal/0 50.49,26.87
step
在开放水域中捕鱼
|tip 你可以在任何地方钓鱼并提高技能
|tip 如果你想钓特定的鱼，请参考我们的打鱼指南。
在卡兹阿尔加钓鱼技能达到100 |skill Khaz Algar Fishing,100 |goto Dornogal/0 50.49,26.87
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Cursed Ghoulfish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Cursed Ghoulfish.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 这条鱼可以在任何地方钓到，但是只有在你的钓鱼技能很低的时候才会出现！
|tip 如果你的钓鱼技能满级，你可能永远看不到它。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Cursed Ghoulfish##220152 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Bismuth Bitterling",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Bismuth Bitterling.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在微光池中钓鱼。这些与星辰观测者群共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Bismuth Bitterling##220137 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Crystalline Sturgeon",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Crystalline Sturgeon.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在微光池中钓鱼。这些与星辰观测者群共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Crystalline Sturgeon##220136 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Dornish Pike",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Dornish Pike.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	58.74,46.20	59.92,48.97	59.64,54.13	59.61,57.47	60.12,59.50
path	60.50,61.59	59.30,64.50	57.78,68.13	56.43,71.59	57.89,68.76
path	59.37,64.60	60.60,61.09	62.40,61.73	64.68,64.05	66.68,62.48
path	68.76,60.05	69.45,55.55	68.78,52.48	67.55,51.54	66.83,50.80
path	64.87,49.32	63.30,47.32	60.66,46.85
cast Fishing##131474
|tip 平静涟漪中的鱼。这些鱼和其他钓鱼池共享刷点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Dornish Pike##220143 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Specular Rainbowfish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Specular Rainbowfish.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在微光池中钓鱼。这些与星辰观测者群共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Specular Rainbowfish##220141 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Whispering Stargazer",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Whispering Stargazer.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在Stargazer Swarms中钓鱼。这些与Glimmerpools共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Whispering Stargazer##220139 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Spiked Sea Raven",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Spiked Sea Raven.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在微光水池、星空虫群和和平涌动涟漪中钓鱼。这是一条稀有鱼。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Spiked Sea Raven##220150 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Goldengill Trout",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Goldengill Trout.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	70.75,23.89	69.56,22.30	68.79,20.68	68.66,18.79	71.40,17.07
path	72.96,18.32	72.49,21.20	72.00,23.72	72.40,26.05	73.67,27.79
path	75.90,27.81	77.31,25.57	78.30,23.23	77.91,19.30	80.55,27.22
path	81.50,29.39	80.75,31.01	79.51,31.32	77.42,29.03	74.26,28.48
cast Fishing##131474
|tip 在微光池中钓鱼。这些与星辰观测者群共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Goldengill Trout##222533 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Nibbling Minnow",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Nibbling Minnow.",
startlevel=68.0,
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	58.74,46.20	59.92,48.97	59.64,54.13	59.61,57.47	60.12,59.50
path	60.50,61.59	59.30,64.50	57.78,68.13	56.43,71.59	57.89,68.76
path	59.37,64.60	60.60,61.09	62.40,61.73	64.68,64.05	66.68,62.48
path	68.76,60.05	69.45,55.55	68.78,52.48	67.55,51.54	66.83,50.80
path	64.87,49.32	63.30,47.32	60.66,46.85
cast Fishing##131474
|tip 平静涟漪中的鱼。这些鱼和其他钓鱼池共享刷点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Nibbling Minnow##220138 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Quiet River Bass",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Quiet River Bass.",
startlevel=68.0,
},[[
step
map Isle of Dorn
path follow smart; loop on; ants curved; dist 50
path	58.74,46.20	59.92,48.97	59.64,54.13	59.61,57.47	60.12,59.50
path	60.50,61.59	59.30,64.50	57.78,68.13	56.43,71.59	57.89,68.76
path	59.37,64.60	60.60,61.09	62.40,61.73	64.68,64.05	66.68,62.48
path	68.76,60.05	69.45,55.55	68.78,52.48	67.55,51.54	66.83,50.80
path	64.87,49.32	63.30,47.32	60.66,46.85
cast Fishing##131474
|tip 平静的水面涟漪和河鲈鱼池中钓鱼。这些和其他钓鱼池共享刷新点。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Quiet River Bass##220142 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Roaring Anglerseeker",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Roaring Anglerseeker.",
startlevel=68.0,
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	46.97,45.55	47.76,43.99	50.24,45.40	51.74,49.09	52.05,51.71
path	52.92,54.66	53.05,57.41	52.69,59.30	53.67,62.17	53.60,64.62
path	49.83,65.78
cast Fishing##131474
|tip 在寻鱼者急流中钓鱼。这些共享刷新与其他鱼群。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Roaring Anglerseeker##220144 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Queen's Lurefish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Queen's Lurefish.",
startlevel=68.0,
},[[
step
map Azj-Kahet
path follow smart; loop on; ants curved; dist 50
path	68.77,21.77	64.08,21.95	59.65,25.02	57.70,28.22	55.29,29.36
path	49.73,35.95	46.43,39.83	44.80,44.21	44.94,47.06	44.34,49.93
path	45.19,52.88	46.22,56.26
map Azj-Kahet
path	46.11,62.00	47.81,64.39	50.31,65.01	50.89,61.28	50.60,57.76
path	52.97,56.11
map Azj-Kahet
path	55.57,55.62	57.85,58.82	58.04,61.43	58.04,67.97	56.56,68.50
path	54.32,67.48
map Azj-Kahet
path	49.41,65.47	46.55,63.81
map Azj-Kahet
path	43.55,62.98	41.60,60.57	39.24,57.81	37.13,54.93	35.38,51.86
path	31.78,47.43
cast Fishing##131474
|tip 皇家涟漪中有鱼。它们与其他钓鱼池共享刷新，可能非常稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Queen's Lurefish##220151 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Regal Dottyback",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Regal Dottyback.",
startlevel=68.0,
},[[
step
map Azj-Kahet
path follow smart; loop on; ants curved; dist 50
path	68.77,21.77	64.08,21.95	59.65,25.02	57.70,28.22	55.29,29.36
path	49.73,35.95	46.43,39.83	44.80,44.21	44.94,47.06	44.34,49.93
path	45.19,52.88	46.22,56.26
map Azj-Kahet
path	46.11,62.00	47.81,64.39	50.31,65.01	50.89,61.28	50.60,57.76
path	52.97,56.11
map Azj-Kahet
path	55.57,55.62	57.85,58.82	58.04,61.43	58.04,67.97	56.56,68.50
path	54.32,67.48
map Azj-Kahet
path	49.41,65.47	46.55,63.81
map Azj-Kahet
path	43.55,62.98	41.60,60.57	39.24,57.81	37.13,54.93	35.38,51.86
path	31.78,47.43
cast Fishing##131474
|tip 皇家涟漪中有鱼。它们与其他钓鱼池共享刷新，可能非常稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Regal Dottyback##220146 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Awoken Coelacanth",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Awoken Coelacanth.",
startlevel=68.0,
},[[
step
map Azj-Kahet
path follow smart; loop on; ants curved; dist 50
path	68.77,21.77	64.08,21.95	59.65,25.02	57.70,28.22	55.29,29.36
path	49.73,35.95	46.43,39.83	44.80,44.21	44.94,47.06	44.34,49.93
path	45.19,52.88	46.22,56.26
map Azj-Kahet
path	46.11,62.00	47.81,64.39	50.31,65.01	50.89,61.28	50.60,57.76
path	52.97,56.11
map Azj-Kahet
path	55.57,55.62	57.85,58.82	58.04,61.43	58.04,67.97	56.56,68.50
path	54.32,67.48
map Azj-Kahet
path	49.41,65.47	46.55,63.81
map Azj-Kahet
path	43.55,62.98	41.60,60.57	39.24,57.81	37.13,54.93	35.38,51.86
path	31.78,47.43
use the Whispering Stargazer##220139
|tip 用低语星辰引诱矛尾鱼出水
|tip 你可以使用耳语星辰指南来刷这些
collect Awoken Coelacanth##220153 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Arathor Hammerfish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Arathor Hammerfish.",
startlevel=68.0,
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	33.10,46.79	34.91,45.09	38.16,44.25	40.26,44.65	44.29,44.47
path	49.36,44.89	52.18,45.72	54.53,46.74	56.81,46.18	58.48,45.29
path	60.16,42.28	59.65,40.00	60.87,40.72	62.26,37.45	62.79,34.59
path	62.37,29.01	63.34,25.39	61.66,22.29	60.74,19.25	59.50,15.66
path	57.91,14.56	55.11,13.40	52.15,13.94	49.30,12.41	47.33,16.08
path	46.75,19.87	45.99,23.04	44.21,24.51	42.40,21.00	38.67,22.41
path	36.74,24.57	33.68,27.94	31.33,31.48	27.77,34.14	28.65,38.00
path	29.42,44.33
cast Fishing##131474
|tip 在血红鲈鱼群、血水中或贫民区鲨鱼群中钓鱼。这些与其他鱼群共享刷新，并且可能很稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Arathor Hammerfish##220145 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Bloody Perch",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Bloody Perch.",
startlevel=68.0,
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	33.10,46.79	34.91,45.09	38.16,44.25	40.26,44.65	44.29,44.47
path	49.36,44.89	52.18,45.72	54.53,46.74	56.81,46.18	58.48,45.29
path	60.16,42.28	59.65,40.00	60.87,40.72	62.26,37.45	62.79,34.59
path	62.37,29.01	63.34,25.39	61.66,22.29	60.74,19.25	59.50,15.66
path	57.91,14.56	55.11,13.40	52.15,13.94	49.30,12.41	47.33,16.08
path	46.75,19.87	45.99,23.04	44.21,24.51	42.40,21.00	38.67,22.41
path	36.74,24.57	33.68,27.94	31.33,31.48	27.77,34.14	28.65,38.00
path	29.42,44.33
cast Fishing##131474
|tip 在血红鲈鱼群、血水中或贫民区鲨鱼群中钓鱼。这些与其他鱼群共享刷新，并且可能很稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Bloody Perch##220135 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Dilly-Dally Dace",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Dilly-Dally Dace.",
startlevel=68.0,
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	33.10,46.79	34.91,45.09	38.16,44.25	40.26,44.65	44.29,44.47
path	49.36,44.89	52.18,45.72	54.53,46.74	56.81,46.18	58.48,45.29
path	60.16,42.28	59.65,40.00	60.87,40.72	62.26,37.45	62.79,34.59
path	62.37,29.01	63.34,25.39	61.66,22.29	60.74,19.25	59.50,15.66
path	57.91,14.56	55.11,13.40	52.15,13.94	49.30,12.41	47.33,16.08
path	46.75,19.87	45.99,23.04	44.21,24.51	42.40,21.00	38.67,22.41
path	36.74,24.57	33.68,27.94	31.33,31.48	27.77,34.14	28.65,38.00
path	29.42,44.33
cast Fishing##131474
|tip 血水中的鱼或平静水面的涟漪。它们与其他钓鱼点共享刷新，可能很稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Dilly-Dally Dace##220134 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Kaheti Slum Shark",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Kaheti Slum Shark.",
startlevel=68.0,
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	33.10,46.79	34.91,45.09	38.16,44.25	40.26,44.65	44.29,44.47
path	49.36,44.89	52.18,45.72	54.53,46.74	56.81,46.18	58.48,45.29
path	60.16,42.28	59.65,40.00	60.87,40.72	62.26,37.45	62.79,34.59
path	62.37,29.01	63.34,25.39	61.66,22.29	60.74,19.25	59.50,15.66
path	57.91,14.56	55.11,13.40	52.15,13.94	49.30,12.41	47.33,16.08
path	46.75,19.87	45.99,23.04	44.21,24.51	42.40,21.00	38.67,22.41
path	36.74,24.57	33.68,27.94	31.33,31.48	27.77,34.14	28.65,38.00
path	29.42,44.33
cast Fishing##131474
|tip 血水中的鱼或破败之地鲨群。这些与其他钓鱼点共享刷新，并且可能很稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Kaheti Slum Shark##220147 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Pale Huskfish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Pale Huskfish.",
startlevel=68.0,
},[[
step
map Azj-Kahet
path follow smart; loop on; ants curved; dist 50
path	68.77,21.77	64.08,21.95	59.65,25.02	57.70,28.22	55.29,29.36
path	49.73,35.95	46.43,39.83	44.80,44.21	44.94,47.06	44.34,49.93
path	45.19,52.88	46.22,56.26
map Azj-Kahet
path	46.11,62.00	47.81,64.39	50.31,65.01	50.89,61.28	50.60,57.76
path	52.97,56.11
map Azj-Kahet
path	55.57,55.62	57.85,58.82	58.04,61.43	58.04,67.97	56.56,68.50
path	54.32,67.48
map Azj-Kahet
path	49.41,65.47	46.55,63.81
map Azj-Kahet
path	43.55,62.98	41.60,60.57	39.24,57.81	37.13,54.93	35.38,51.86
path	31.78,47.43
cast Fishing##131474
|tip 在溃烂的腐池或注入灵质的溢液中钓鱼。这些与其他钓鱼点共享刷新，并且可能稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Pale Huskfish##220148 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Sanguine Dogfish",{
author="support@zygorguides.com",
description="This guide will walk you through gathering Sanguine Dogfish.",
startlevel=68.0,
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	33.10,46.79	34.91,45.09	38.16,44.25	40.26,44.65	44.29,44.47
path	49.36,44.89	52.18,45.72	54.53,46.74	56.81,46.18	58.48,45.29
path	60.16,42.28	59.65,40.00	60.87,40.72	62.26,37.45	62.79,34.59
path	62.37,29.01	63.34,25.39	61.66,22.29	60.74,19.25	59.50,15.66
path	57.91,14.56	55.11,13.40	52.15,13.94	49.30,12.41	47.33,16.08
path	46.75,19.87	45.99,23.04	44.21,24.51	42.40,21.00	38.67,22.41
path	36.74,24.57	33.68,27.94	31.33,31.48	27.77,34.14	28.65,38.00
path	29.42,44.33
cast Fishing##131474
use the Bloody Perch##220135
|tip 使用血腥栖木增加捕捉鲜血狗鱼的几率 增益效果最多叠加10层
|tip 猎杀血水中的鱼或血腥的狗鱼群。这些渔点与其他钓鱼点共享刷新，并且可能稀有。
|tip 点击钓鱼浮标当它在水中晃动时。
|tip 继续重复这个过程。
collect Sanguine Dogfish##220149 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Leveling Guides\\Khaz Algar Herbalism 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Herbalism profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Herbalism') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Herbalism') > 0 and skill('Khaz Algar Herbalism') < 100 and level >= 70 end,
},[[
step
talk Akdan##219101
|tip 在建筑内。
习草药学 |skillmax Herbalism,300 |goto Dornogal/0 44.79,69.27
step
talk Akdan##219101
|tip 在建筑内。
训练卡兹阿尔加的草药学 |skillmax Khaz Algar Herbalism,100 |goto Dornogal/0 44.79,69.27
step
在卡兹·阿尔加尔草药学中达到100级技能 |skill Khaz Algar Herbalism,100 |only if default
在卡兹阿尔加草药学中达到技能等级105 |skill Khaz Algar Herbalism,105 |only if KulTiran
在卡兹·阿尔加草药学中达到技能等级115 |skill Khaz Algar Herbalism,115 |only if Tauren
|tip 选择你想要的任意草药学指南，加载并采集以提升技能等级到60并获取点数。
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet
path follow smart; loop on; ants curved; dist 50
path	65.46,20.88	58.67,29.88	62.04,35.89	68.28,38.38	75.77,35.00
path	78.00,40.00	77.25,44.78	67.78,56.80	76.55,66.73	76.92,72.04
path	76.89,77.53	72.42,82.38	69.29,81.24	67.06,86.59	62.24,82.03
path	60.25,71.14	56.94,67.00	54.02,68.45	48.16,60.20	43.13,64.43
path	39.23,58.81	33.73,51.16	29.63,52.04	25.12,50.17	23.81,46.94
path	25.20,40.32	26.75,34.16	28.88,33.56	33.18,37.99	38.62,36.24
path	42.32,31.42	48.89,29.14	53.03,24.47	57.87,21.70	62.44,18.66
click Mycobloom##440204+
|tip 它们看起来像是大型粉色和绿色花朵的簇拥。
|tip 它们与其他草药节点共享刷新时间
collect Mycobloom##210796 |n
collect Mycobloom##210797 |n
collect Mycobloom##210798 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Hallowfall)",{
author="support@zygorguides.com",
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	40.20,67.02	39.87,62.21	37.36,58.56	32.71,58.29	28.32,59.16
path	22.74,59.13	22.91,55.20	28.09,50.10	30.78,43.37	32.74,35.04
path	34.12,28.78	38.75,25.03	42.11,22.08	45.33,15.94	46.06,12.40
path	49.54,15.92	53.18,16.82	55.26,22.04	54.84,27.84	52.38,31.60
path	47.76,31.31	44.92,36.31	42.15,41.78	40.06,44.96	41.48,47.07
path	47.17,49.95	54.18,52.80	57.26,54.33	59.09,51.42	62.48,50.96
path	64.90,47.49	62.70,44.01	59.71,41.50	59.49,37.02	60.26,31.55
path	64.90,27.56	67.96,29.79	69.43,37.79	71.97,42.88	70.31,48.47
path	69.73,51.94	70.32,57.43	68.25,63.06	64.23,66.51	63.01,66.62
path	60.90,66.00	57.91,66.76	53.68,67.43	44.87,67.23
click Mycobloom##440204+
|tip 它们看起来像是大型粉色和绿色花朵的簇拥。
|tip 它们与其他草药节点共享刷新时间
collect Mycobloom##210796 |n
collect Mycobloom##210797 |n
collect Mycobloom##210798 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	45.94,58.40	44.66,62.76	42.04,66.98	38.10,66.70	33.09,62.58
path	32.25,57.76	30.50,52.12	27.02,52.43	22.98,53.07	21.13,56.88
path	21.79,62.61	24.56,66.34	29.04,69.50	32.36,75.29	34.55,79.25
path	39.00,83.25	44.02,82.45	47.26,77.31	49.93,76.74	53.36,78.01
path	56.45,74.35	61.70,72.16	64.25,66.18	66.55,60.41	68.97,53.75
path	71.52,50.04	71.65,44.15	68.63,40.51	65.97,33.68	65.30,24.70
path	63.87,19.09	61.26,15.76	56.40,16.52	53.13,18.53	49.27,17.64
path	44.88,16.86	41.15,21.04	40.72,26.42	42.32,31.51
map Dornogal/0
path	28.91,20.98	25.42,42.09
map Isle of Dorn/0
path	43.16,47.12
map Dornogal/0
path	31.13,78.95
map Isle of Dorn/0
path	50.30,53.80	53.69,50.76	56.02,43.98	56.28,37.75	56.69,32.34
path	59.91,26.26	62.72,28.79	63.05,34.56	63.21,42.55	63.80,47.70
path	61.72,52.91	57.38,58.46	54.43,60.73	50.96,59.29
click Mycobloom##440204+
|tip 它们看起来像是大型粉色和绿色花朵的簇拥。
|tip 它们与其他草药节点共享刷新时间
collect Mycobloom##210796 |n
collect Mycobloom##210797 |n
collect Mycobloom##210798 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Mycobloom##440204+
|tip 它们看起来像是大型粉色和绿色花朵的簇拥。
|tip 它们与其他草药节点共享刷新时间
collect Mycobloom##210796 |n
collect Mycobloom##210797 |n
collect Mycobloom##210798 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (Hallowfall)",{
author="support@zygorguides.com",
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	40.20,67.02	39.87,62.21	37.36,58.56	32.71,58.29	28.32,59.16
path	22.74,59.13	22.91,55.20	28.09,50.10	30.78,43.37	32.74,35.04
path	34.12,28.78	38.75,25.03	42.11,22.08	45.33,15.94	46.06,12.40
path	49.54,15.92	53.18,16.82	55.26,22.04	54.84,27.84	52.38,31.60
path	47.76,31.31	44.92,36.31	42.15,41.78	40.06,44.96	41.48,47.07
path	47.17,49.95	54.18,52.80	57.26,54.33	59.09,51.42	62.48,50.96
path	64.90,47.49	62.70,44.01	59.71,41.50	59.49,37.02	60.26,31.55
path	64.90,27.56	67.96,29.79	69.43,37.79	71.97,42.88	70.31,48.47
path	69.73,51.94	70.32,57.43	68.25,63.06	64.23,66.51	63.01,66.62
path	60.90,66.00	57.91,66.76	53.68,67.43	44.87,67.23
click Arathor's Spear##414319+
|tip 它们看起来像大型的粉色和白色的花朵。
|tip 这些草药点与其他草药点共享刷新时间。
collect Arathor's Spear##210808 |n
collect Arathor's Spear##210809 |n
collect Arathor's Spear##210810 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Arathor's Spear##414319+
|tip 它们看起来像大型的粉色和白色的花朵。
|tip 这些草药点与其他草药点共享刷新时间。
collect Arathor's Spear##210808 |n
collect Arathor's Spear##210809 |n
collect Arathor's Spear##210810 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (Hallowfall)",{
author="support@zygorguides.com",
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	40.20,67.02	39.87,62.21	37.36,58.56	32.71,58.29	28.32,59.16
path	22.74,59.13	22.91,55.20	28.09,50.10	30.78,43.37	32.74,35.04
path	34.12,28.78	38.75,25.03	42.11,22.08	45.33,15.94	46.06,12.40
path	49.54,15.92	53.18,16.82	55.26,22.04	54.84,27.84	52.38,31.60
path	47.76,31.31	44.92,36.31	42.15,41.78	40.06,44.96	41.48,47.07
path	47.17,49.95	54.18,52.80	57.26,54.33	59.09,51.42	62.48,50.96
path	64.90,47.49	62.70,44.01	59.71,41.50	59.49,37.02	60.26,31.55
path	64.90,27.56	67.96,29.79	69.43,37.79	71.97,42.88	70.31,48.47
path	69.73,51.94	70.32,57.43	68.25,63.06	64.23,66.51	63.01,66.62
path	60.90,66.00	57.91,66.76	53.68,67.43	44.87,67.23
click Blessing Blossom##414318+
|tip 它们看起来像带有绿色叶子的紫色和白色花朵
|tip 这些草药点与其他草药点共享刷新时间。
collect Blessing Blossom##210805 |n
collect Blessing Blossom##210806 |n
collect Blessing Blossom##210807 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Blessing Blossom##414318+
|tip 它们看起来像带有绿色叶子的紫色和白色花朵
|tip 这些草药点与其他草药点共享刷新时间。
collect Blessing Blossom##210805 |n
collect Blessing Blossom##210806 |n
collect Blessing Blossom##210807 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	45.94,58.40	44.66,62.76	42.04,66.98	38.10,66.70	33.09,62.58
path	32.25,57.76	30.50,52.12	27.02,52.43	22.98,53.07	21.13,56.88
path	21.79,62.61	24.56,66.34	29.04,69.50	32.36,75.29	34.55,79.25
path	39.00,83.25	44.02,82.45	47.26,77.31	49.93,76.74	53.36,78.01
path	56.45,74.35	61.70,72.16	64.25,66.18	66.55,60.41	68.97,53.75
path	71.52,50.04	71.65,44.15	68.63,40.51	65.97,33.68	65.30,24.70
path	63.87,19.09	61.26,15.76	56.40,16.52	53.13,18.53	49.27,17.64
path	44.88,16.86	41.15,21.04	40.72,26.42	42.32,31.51
map Dornogal
path	28.91,20.98	25.42,42.09
map Isle of Dorn
path	43.16,47.12
map Dornogal
path	31.13,78.95
map Isle of Dorn
path	50.30,53.80	53.69,50.76	56.02,43.98	56.28,37.75	56.69,32.34
path	59.91,26.26	62.72,28.79	63.05,34.56	63.21,42.55	63.80,47.70
path	61.72,52.91	57.38,58.46	54.43,60.73	50.96,59.29
click Blessing Blossom##414318+
|tip 它们看起来像带有绿色叶子的紫色和白色花朵
|tip 这些草药点与其他草药点共享刷新时间。
collect Blessing Blossom##210805 |n
collect Blessing Blossom##210806 |n
collect Blessing Blossom##210807 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Orbinid (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	65.46,20.88	58.67,29.88	62.04,35.89	68.28,38.38	75.77,35.00
path	78.00,40.00	77.25,44.78	67.78,56.80	76.55,66.73	76.92,72.04
path	76.89,77.53	72.42,82.38	69.29,81.24	67.06,86.59	62.24,82.03
path	60.25,71.14	56.94,67.00	54.02,68.45	48.16,60.20	43.13,64.43
path	39.23,58.81	33.73,51.16	29.63,52.04	25.12,50.17	23.81,46.94
path	25.20,40.32	26.75,34.16	28.88,33.56	33.18,37.99	38.62,36.24
path	42.32,31.42	48.89,29.14	53.03,24.47	57.87,21.70	62.44,18.66
click Orbinid##414317+
|tip 它们看起来像内部有球体的紫色花朵
|tip 这些草药点与其他草药点共享刷新时间。
collect Orbinid##210802 |n
collect Orbinid##210803 |n
collect Orbinid##210804 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Orbinid (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Orbinid##414317+
|tip 它们看起来像内部有球体的紫色花朵
|tip 这些草药点与其他草药点共享刷新时间。
collect Orbinid##210802 |n
collect Orbinid##210803 |n
collect Orbinid##210804 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Luredrop (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	65.46,20.88	58.67,29.88	62.04,35.89	68.28,38.38	75.77,35.00
path	78.00,40.00	77.25,44.78	67.78,56.80	76.55,66.73	76.92,72.04
path	76.89,77.53	72.42,82.38	69.29,81.24	67.06,86.59	62.24,82.03
path	60.25,71.14	56.94,67.00	54.02,68.45	48.16,60.20	43.13,64.43
path	39.23,58.81	33.73,51.16	29.63,52.04	25.12,50.17	23.81,46.94
path	25.20,40.32	26.75,34.16	28.88,33.56	33.18,37.99	38.62,36.24
path	42.32,31.42	48.89,29.14	53.03,24.47	57.87,21.70	62.44,18.66
click Luredrop##454010+
|tip 它们看起来像巨大的蓝色和粉色花朵。
|tip 它们与其他草药节点共享刷新时间
collect Luredrop##210799 |n
collect Luredrop##210800 |n
collect Luredrop##210801 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Luredrop (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Luredrop##454010+
|tip 它们看起来像巨大的蓝色和粉色花朵。
|tip 它们与其他草药节点共享刷新时间
collect Luredrop##210799 |n
collect Luredrop##210800 |n
collect Luredrop##210801 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Inscription\\Leveling Guides\\Khaz Algar Inscription 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Inscription profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Inscription') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Inscription') > 0 and skill('Khaz Algar Inscription') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 诱捕掉落: 250
|tip 菌菇花: 500
|tip 翡翠孢子: 75
|tip 这些合计是近似的。由于研磨的性质，你可能需要更多或更少。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约50。
点击这里继续 |confirm
step
talk Brrigan##219090
训练铭文 |skillmax Inscription,300 |goto Dornogal/0 48.76,70.90
step
talk Brrigan##219090
训练卡扎尔加尔铭文 |skillmax Khaz Algar Inscription,100 |goto Dornogal/0 48.76,70.90
step
collect 200 Luredrop##210799 |or
|tip 我们稍后会用这些制作墨水
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Luredrop (Azj-Kahet)"
'|complete skill("Khaz Algar Inscription") >= 20 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 25 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 35 |or |only if Nightborne
step
collect 350 Mycobloom##210796 |or
|tip 我们稍后会用这些制作墨水
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Azj-Kahet)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Hallowfall)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Isle of Dorn)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (The Ringing Deeps)"
'|complete skill("Khaz Algar Inscription") >= 20 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 25 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 35 |or |only if Nightborne
step
create 20 Khaz Algar Milling##444181,Khaz Algar Inscription,20 |goto Dornogal/0 49.51,70.86 |only if default
create 20 Khaz Algar Milling##444181,Khaz Algar Inscription,25 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 20 Khaz Algar Milling##444181,Khaz Algar Inscription,35 |goto Dornogal/0 49.51,70.86 |only if Nightborne
|tip 保存你的颜料，我们将用这些来制作墨水。
step
talk Brrigan##219090
训练焕日墨水 |learn Apricate Ink##444222 |goto Dornogal/0 48.76,70.90
step
talk Kardu##219089
buy 900 Distilled Algari Freshwater##226205 |goto Dornogal/0 48.79,70.69 |or
'|complete skill("Khaz Algar Inscription") >= 25 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 30 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if Nightborne
stickystart "Collect_Nacreous_Pigment_25"
step
collect 225 Luredrop Pigment##222612 |or
|tip 用铭文研磨草药或者从拍卖行购买草药
'|complete skill("Khaz Algar Inscription") >= 25 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 30 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if Nightborne
step
label "Collect_Nacreous_Pigment_25"
collect 400 Nacreous Pigment##222618 |or
|tip 用铭文研磨草药或者从拍卖行购买草药
'|complete skill("Khaz Algar Inscription") >= 25 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 30 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if Nightborne
step
create 45 Apricate Ink##444222,Khaz Algar Inscription,25 |goto Dornogal/0 49.51,70.86 |only if default
create 45 Apricate Ink##444222,Khaz Algar Inscription,30 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 45 Apricate Ink##444222,Khaz Algar Inscription,40 |goto Dornogal/0 49.51,70.86 |only if Nightborne
|tip 我们稍后会使用这些
|tip 你可以用这个配方把铭文技能提升到30，虽然会更贵，但你总是需要更多的墨水。
step
talk Brrigan##219090
训练无尽密码 |learn Boundless Cipher##444191 |goto Dornogal/0 48.76,70.90
stickystart "Collect_Arathor's_Spear_35"
step
collect 30 Apricate Ink##222615 |or
|tip 通过铭文制造或从拍卖行购买。
'|complete skill("Khaz Algar Inscription") >= 35 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if Nightborne
step
label "Collect_Arathor's_Spear_35"
collect 75 Arathor's Spear##210808 |or
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (Hallowfall)"
|loadguide "Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (The Ringing Deeps)"
'|complete skill("Khaz Algar Inscription") >= 35 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if Nightborne
step
talk Kardu##219089
buy 300 Distilled Algari Freshwater##226205 |goto Dornogal/0 48.79,70.69 |or
'|complete skill("Khaz Algar Inscription") >= 35 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 40 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if Nightborne
step
create 15 Boundless Cipher##444191,Khaz Algar Inscription,35 |goto Dornogal/0 49.51,70.86 |only if default
create 15 Boundless Cipher##444191,Khaz Algar Inscription,40 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 15 Boundless Cipher##444191,Khaz Algar Inscription,50 |goto Dornogal/0 49.51,70.86 |only if Nightborne
|tip 你可能需要根据你的运气额外制造一些密文或墨水。
|tip 保存这些，你之后需要用到
step
talk Brrigan##219090
训练火闪阿尔加里密信 |learn Algari Missive of the Fireflash##444212 |goto Dornogal/0 48.76,70.90
step
talk Kardu##219089
buy 50 Distilled Algari Freshwater##226205 |goto Dornogal/0 48.79,70.69 |or 2
buy 20 Fresh Parchment |goto Dornogal/0 48.79,70.69 |or 2
'|complete skill("Khaz Algar Inscription") >= 45 |override |only if default
'|complete skill("Khaz Algar Inscription") >= 50 |override |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 60 |override |only if Nightborne
step
collect 10 Boundless Cipher##222558 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Inscription") >= 45 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 60 |or |only if Nightborne
stickystart "Collect_Viridescent_Spores_45"
step
collect 10 Apricate Ink##222615 |or
|tip 用雕文制造它们或者从拍卖行购买
'|complete skill("Khaz Algar Inscription") >= 45 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 60 |or |only if Nightborne
step
label "Collect_Viridescent_Spores_45"
collect 50 Viridescent Spores##210808 |or
|tip 通过草药学采集草药，或者在拍卖行购买
'|complete skill("Khaz Algar Inscription") >= 45 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 60 |or |only if Nightborne
step
create 10 Algari Missive of the Fireflash##444212,Khaz Algar Inscription,45 |goto Dornogal/0 49.51,70.86 |only if default
create 10 Algari Missive of the Fireflash##444212,Khaz Algar Inscription,50 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 10 Algari Missive of the Fireflash##444212,Khaz Algar Inscription,60 |goto Dornogal/0 49.51,70.86
step
talk Brrigan##219090
训练无双名士的书信 |learn Algari Missive of the Peerless##444214 |goto Dornogal/0 48.76,70.90
step
talk Kardu##219089
buy 25 Distilled Algari Freshwater##226205 |goto Dornogal/0 48.79,70.69 |or 2
buy 10 Fresh Parchment |goto Dornogal/0 48.79,70.69 |or 2
'|complete skill("Khaz Algar Inscription") >= 50 |override |only if default
'|complete skill("Khaz Algar Inscription") >= 55 |override |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 65 |override |only if Nightborne
step
collect 5 Boundless Cipher##222558 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 65 |or |only if Nightborne
stickystart "Collect_Viridescent_Spores_50"
step
collect 5 Apricate Ink##222615 |or
|tip 用雕文制造它们或者从拍卖行购买
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 65 |or |only if Nightborne
step
label "Collect_Viridescent_Spores_50"
collect 25 Viridescent Spores##210808 |or
|tip 通过草药学采集草药，或者在拍卖行购买
'|complete skill("Khaz Algar Inscription") >= 50 |or |only if default
'|complete skill("Khaz Algar Inscription") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Inscription") >= 65 |or |only if Nightborne
step
create 5 Algari Missive of the Peerless##444214,Khaz Algar Inscription,50 |goto Dornogal/0 49.51,70.86 |only if default
create 5 Algari Missive of the Peerless##444214,Khaz Algar Inscription,55 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 5 Algari Missive of the Peerless##444214,Khaz Algar Inscription,65 |goto Dornogal/0 49.51,70.86 |only if Nightborne
step
在卡兹阿尔加铭文学专业技能等级达到100级 |skill Khaz Algar Inscription,100 |goto Valdrakken/0 39.61,73.67 |or |only if default
在卡兹·阿尔加铭文学中达到105级技能等级 |skill Khaz Algar Inscription,105 |goto Valdrakken/0 39.61,73.67 |or |only if KulTiran
在卡兹阿尔加铭文技能达到115级 |skill Khaz Algar Inscription,115 |goto Valdrakken/0 39.61,73.67 |or |only if Nightborne
|tip 从这点开始，继续积攒点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Jewelcrafting\\Leveling Guides\\Khaz Algar Jewelcrafting 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Jewelcrafting profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Jewelcrafting') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Jewelcrafting') > 0 and skill('Khaz Algar Jewelcrafting') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 铋: 125
|tip 任意未切割的宝石: 45
|tip 矛盾的琥珀 35
|tip 震慑蓝宝石: 15
|tip 这些总数是大概的。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约50。
点击这里继续 |confirm
step
talk Makir##219087
训练珠宝加工 |skillmax Jewelcrafting,300 |goto Dornogal/0 49.51,70.86
step
talk Makir##219087
训练卡兹阿尔加珠宝加工术 |skillmax Khaz Algar Jewelcrafting,100 |goto Dornogal/0 49.51,70.86
step
create 25 Algari Prospecting##434018,Khaz Algar Jewelcrafting,15 |goto Dornogal/0 49.51,70.86 |only if default
create 25 Algari Prospecting##434018,Khaz Algar Jewelcrafting,20 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 25 Algari Prospecting##434018,Khaz Algar Jewelcrafting,30 |goto Dornogal/0 49.51,70.86 |only if Draenei
|tip 采矿获取任意125个Khaz Algar矿石或者从拍卖行购买
|tip 探矿矿石并收集宝石
step
create 15 Algari Crushing##434020,Khaz Algar Jewelcrafting,25 |goto Dornogal/0 49.51,70.86 |only if default
create 15 Algari Crushing##434020,Khaz Algar Jewelcrafting,30 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 15 Algari Crushing##434020,Khaz Algar Jewelcrafting,40 |goto Dornogal/0 49.51,70.86 |only if Draenei
|tip 粉碎从探矿中获得的宝石
'|complete skill("Khaz Algar Jewelcrafting") >= 25
step
step
talk Uthaga##219088
buy 30 Glittering Glass##213399 |goto Dornogal/0 49.54,71.53 |or
'|complete skill("Khaz Algar Jewelcrafting") >= 30 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 35 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 45 |or |only if Draenei
stickystart "Collect_Crushed_Gemstones_30"
step
collect 5 Ambivalent Amber##212498 |or
|tip 用珠宝加工分解它们或者从拍卖行购买它们
'|complete skill("Khaz Algar Jewelcrafting") >= 30 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 35 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 45 |or |only if Draenei
step
label "Collect_Crushed_Gemstones_30"
collect 15 Crushed Gemstones##213219 |or
|tip 用珠宝加工粉碎前景宝石，或者从拍卖行购买它们。
'|complete skill("Khaz Algar Jewelcrafting") >= 30 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 35 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 45 |or |only if Draenei
step
talk Makir##219087
训练镀金瓶 |learn Gilded Vial##435323 |goto Dornogal/0 49.51,70.86
step
create 5 Gilded Vial##435323,Khaz Algar Jewelcrafting,30 |goto Dornogal/0 49.51,70.86 |only if default
create 5 Gilded Vial##435323,Khaz Algar Jewelcrafting,35 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 5 Gilded Vial##435323,Khaz Algar Jewelcrafting,45 |goto Dornogal/0 49.51,70.86 |only if Draenei
step
talk Makir##219087
训练可塑挂坠 |learn Malleable Pendant##435380 |goto Dornogal/0 49.51,70.86
stickystart "Collect_Stunning_Sapphire_50"
stickystart "Collect_Crushed_Gemstones_50"
step
collect 30 Ambivalent Amber##212498 |or
|tip 用珠宝加工分解它们或者从拍卖行购买它们
'|complete skill("Khaz Algar Jewelcrafting") >= 50 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 65 |or |only if Draenei
step
label "Collect_Stunning_Sapphire_50"
collect 15 Stunning Sapphire##212508 |or
|tip 用珠宝加工分解它们或者从拍卖行购买它们
'|complete skill("Khaz Algar Jewelcrafting") >= 50 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 65 |or |only if Draenei
step
label "Collect_Crushed_Gemstones_50"
collect 30 Crushed Gemstones##213219 |or
|tip 用珠宝加工粉碎前景宝石，或者从拍卖行购买它们。
'|complete skill("Khaz Algar Jewelcrafting") >= 50 |or |only if default
'|complete skill("Khaz Algar Jewelcrafting") >= 55 |or |only if KulTiran
'|complete skill("Khaz Algar Jewelcrafting") >= 65 |or |only if Draenei
step
create 5 Malleable Pendant##435380,Khaz Algar Jewelcrafting,50 |goto Dornogal/0 49.51,70.86 |only if default
create 5 Malleable Pendant##435380,Khaz Algar Jewelcrafting,55 |goto Dornogal/0 49.51,70.86 |only if KulTiran
create 5 Malleable Pendant##435380,Khaz Algar Jewelcrafting,65 |goto Dornogal/0 49.51,70.86 |only if Draenei
step
在卡兹·阿加尔的珠宝加工中达到100级技能水平 |skill Khaz Algar Jewelcrafting,100 |only if default
在卡兹阿尔加珠宝加工中达到技能等级105 |skill Khaz Algar Jewelcrafting,105 |only if KulTiran
卡兹·阿尔加珠宝加工技能等级达到110级 |skill Khaz Algar Jewelcrafting,115 |only if Draenei
|tip 从这一点开始，由于需要灵魂绑定材料，继续获取点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Leveling Guides\\Khaz Algar Leatherworking 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Leatherworking profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Leatherworking') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Leatherworking') > 0 and skill('Khaz Algar Leatherworking') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 风暴充能皮革: 505
|tip 阴暗甲壳: 185
|tip 雷霆飞扑: 5
|tip 这些总数是大致的。你可以根据你服务器上的价格互换风暴充能皮革和幽暗甲壳的数量。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将使你的技能等级提升到大约50。
点击这里继续 |confirm
step
talk Darean##223644
训练制皮 |skillmax Leatherworking,300 |goto Dornogal/0 54.29,58.46
step
talk Darean##223644
训练卡兹阿尔加尔制皮术 |skillmax Khaz Algar Leatherworking,100 |goto Dornogal/0 54.29,58.46
step
create 3 Spelunker's Leather Bands##443702,Khaz Algar Leatherworking,10 |goto Dornogal/0 54.29,58.46 |only if default
create 3 Spelunker's Leather Bands##443702,Khaz Algar Leatherworking,15 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每个探洞者皮甲束带需要15块风暴充能皮革和5块阴暗甲壳
|tip 你可以制作追踪者的甲壳护腕如果你有更多的幽暗甲壳
|tip 每个追踪者的甲壳锁甲需要5个风暴充能皮革和15个阴暗甲壳。
step
talk Darean##223644
训练洞穴探险者的皮甲上衣 |learn Spelunker's Leather Jerkin##443695 |goto Dornogal/0 54.29,58.46 |or
_Or_
火车追踪者的甲虫外壳战甲 |learn Tracker's Chitin Hauberk##443703 |goto Dornogal/0 54.29,58.46 |or
step
create 3 Spelunker's Leather Jerkin##443695,Khaz Algar Leatherworking,22 |goto Dornogal/0 54.29,58.46 |only if default
create 3 Spelunker's Leather Jerkin##443695,Khaz Algar Leatherworking,27 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每个探险者皮夹克需要30块风暴皮革和15块晦暗甲壳。
|tip 如果你有更多暗蚀甲壳，你可以制作追踪者的甲壳护甲
|tip 每个追踪者的甲壳胸甲需要15块风暴充能皮革和30块幽暗甲壳
step
talk Darean##223644
训练探险者的熟练腰带 |learn Spelunker's Leather Sash##443701 |goto Dornogal/0 54.29,58.46 |or
_Or_
追踪者耐用束带 |learn Tracker's Toughened Girdle##443709 |goto Dornogal/0 54.29,58.46 |or
step
create 1 Spelunker's Practiced Sash##443701,Khaz Algar Leatherworking,25 |goto Dornogal/0 54.29,58.46 |only if default
create 1 Spelunker's Practiced Sash##443701,Khaz Algar Leatherworking,30 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每条探洞者的精练腰带需要三十片风暴皮革和十片幽暗甲胄
|tip 如果你有更多的Gloom Chitin，你就可以制作Tracker's Toughened Girdle。
|tip 每个追踪者的坚韧束腰需要10风暴皮革和30阴翳虫鳞
step
talk Darean##223644
训练潜地者的熟练手套 |learn Spelunker's Practiced Mitts##443697 |goto Dornogal/0 54.29,58.46 |or
_Or_
列车追踪者的强化护手 |learn Tracker's Toughened Handguards##443705 |goto Dornogal/0 54.29,58.46 |or
step
create 4 Spelunker's Practiced Mitts##443697,Khaz Algar Leatherworking,37 |goto Dornogal/0 54.29,58.46 |only if default
create 4 Spelunker's Practiced Mitts##443697,Khaz Algar Leatherworking,42 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每个矿探者的练习手套需要25风暴皮和20黑暗甲壳
|tip 如果你有更多的幽暗甲壳，你可以制造追踪者的强化护手
|tip 每个追踪者的强化护手需要20风暴皮革和25阴暗甲壳。
step
talk Darean##223644
训练钢铁匠围裙 |learn Steelsmith's Apron##444107 |goto Dornogal/0 54.29,58.46
stickystart "Collect_Thunderous_Hide_40"
step
collect 20 Gloom Chitin##212667 |or
|tip 用剥皮专业刷他们或者在拍卖行购买
|loadguide "Profession Guides\\Skinning\\Farming Guides\\Gloom Chitin (Azj-Kahet)"
'|complete skill("Khaz Algar Skinning") >= 40 |or |only if default
'|complete skill("Khaz Algar Skinning") >= 45 |or |only if KulTiran
step
label "Collect_Thunderous_Hide_40"
collect 1 Thunderous Hide##212670 |or
|tip 用剥皮术刷，或者从拍卖行购买。
|loadguide "Profession Guides\\Skinning\\Farming Guides\\Thunderous Hide (Isle of Dorn)"
'|complete skill("Khaz Algar Skinning") >= 40 |or |only if default
'|complete skill("Khaz Algar Skinning") >= 45 |or |only if KulTiran
step
create 1 Steelsmith's Apron##444107,Khaz Algar Leatherworking,40 |goto Dornogal/0 54.29,58.46 |only if default
create 1 Steelsmith's Apron##444107,Khaz Algar Leatherworking,45 |goto Dornogal/0 54.29,58.46 |only if KulTiran
step
talk Darean##223644
训练探险者的熟练护肩 |learn Spelunker's Practiced Shoulders##443700 |goto Dornogal/0 54.29,58.46 |or
_Or_
训练追踪者的硬化护肩 |learn Tracker's Toughened Shoulderguards##219482 |goto Dornogal/0 54.29,58.46 |or
step
create 4 Spelunker's Practiced Shoulders##443700,Khaz Algar Leatherworking,52 |goto Dornogal/0 54.29,58.46 |only if default
create 4 Spelunker's Practiced Shoulders##443700,Khaz Algar Leatherworking,57 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每个洞穴探险者的熟练肩甲需要30块风暴充能皮革和1块雷鸣的兽皮。
|tip 如果你有更多Gloom Chitin，你就可以制作Tracker's Toughened Shoulderguards。
|tip 每个追踪者的坚固护肩需要30块暗影甲壳和1块无光壳片。
step
talk Darean##223644
地精矿洞探险者训练帽 |learn Spelunker's Practiced Hat##443698 |goto Dornogal/0 54.29,58.46 |or
_Or_
火车追踪者的强化头盔 |learn Tracker's Toughened Headgear##443706 |goto Dornogal/0 54.29,58.46 |or
step
create 4 Spelunker's Practiced Hat##443698,Khaz Algar Leatherworking,61 |goto Dornogal/0 54.29,58.46 |only if default
create 4 Spelunker's Practiced Hat##443698,Khaz Algar Leatherworking,66 |goto Dornogal/0 54.29,58.46 |only if KulTiran
|tip 每个探险者的练习帽需要30雷霆皮革和1雷鸣兽皮
|tip 如果你有更多的阴翳鳞质壳片，你可以制作追踪者的硬化头饰。
|tip 每个追踪者的坚固护肩需要30块暗影甲壳和1块无光壳片。
step
卡扎尔加皮革加工技能达到100级 |skill Khaz Algar Leatherworking,100 |or |only if default
卡兹阿尔加制皮技能达到105级 |skill Khaz Algar Leatherworking,105 |or |only if KulTiran
|tip 从这一点开始，由于需要灵魂绑定材料，继续获取点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Leveling Guides\\Khaz Algar Mining 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Mining profession from 1-100.",
startlevel=60.0,
condition_end=function() return skill('Khaz Algar Mining') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Mining') > 0 and skill('Khaz Algar Mining') < 100 and level >= 60 end,
},[[
step
talk Tarib##219097
学习采矿 |skillmax Mining,300 |goto Dornogal/0 52.64,52.53
step
talk Tarib##219097
训练卡扎尔加矿业 |skillmax Khaz Algar Mining,100 |goto Dornogal/0 52.64,52.53
step
在卡兹·阿尔加矿业中达到100技能等级 |skill Khaz Algar Mining,100 |only if default
在卡兹•阿尔格采矿中达到技能等级105 |skill Khaz Algar Mining,105 |only if KulTiran
卡兹·阿尔加采矿技能等级达到115 |skill Khaz Algar Mining,115 |only if HighmountainTauren
|tip 加载你选择的任何矿业练级指南直到技能等级60并刷分
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	65.46,20.88	58.67,29.88	62.04,35.89	68.28,38.38	75.77,35.00
path	78.00,40.00	77.25,44.78	67.78,56.80	76.55,66.73	76.92,72.04
path	76.89,77.53	72.42,82.38	69.29,81.24	67.06,86.59	62.24,82.03
path	60.25,71.14	56.94,67.00	54.02,68.45	48.16,60.20	43.13,64.43
path	39.23,58.81	33.73,51.16	29.63,52.04	25.12,50.17	23.81,46.94
path	25.20,40.32	26.75,34.16	28.88,33.56	33.18,37.99	38.62,36.24
path	42.32,31.42	48.89,29.14	53.03,24.47	57.87,21.70	62.44,18.66
click Bismuth##413046+
|tip 他们与其他矿点共用刷新点
collect Bismuth##210930 |n
collect Bismuth##210931 |n
collect Bismuth##210932 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)",{
author="support@zygorguides.com",
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	40.20,67.02	39.87,62.21	37.36,58.56	32.71,58.29	28.32,59.16
path	22.74,59.13	22.91,55.20	28.09,50.10	30.78,43.37	32.74,35.04
path	34.12,28.78	38.75,25.03	42.11,22.08	45.33,15.94	46.06,12.40
path	49.54,15.92	53.18,16.82	55.26,22.04	54.84,27.84	52.38,31.60
path	47.76,31.31	44.92,36.31	42.15,41.78	40.06,44.96	41.48,47.07
path	47.17,49.95	54.18,52.80	57.26,54.33	59.09,51.42	62.48,50.96
path	64.90,47.49	62.70,44.01	59.71,41.50	59.49,37.02	60.26,31.55
path	64.90,27.56	67.96,29.79	69.43,37.79	71.97,42.88	70.31,48.47
path	69.73,51.94	70.32,57.43	68.25,63.06	64.23,66.51	63.01,66.62
path	60.90,66.00	57.91,66.76	53.68,67.43	44.87,67.23
click Bismuth##413046+
|tip 他们与其他矿点共用刷新点
collect Bismuth##210930 |n
collect Bismuth##210931 |n
collect Bismuth##210932 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	45.94,58.40	44.66,62.76	42.04,66.98	38.10,66.70	33.09,62.58
path	32.25,57.76	30.50,52.12	27.02,52.43	22.98,53.07	21.13,56.88
path	21.79,62.61	24.56,66.34	29.04,69.50	32.36,75.29	34.55,79.25
path	39.00,83.25	44.02,82.45	47.26,77.31	49.93,76.74	53.36,78.01
path	56.45,74.35	61.70,72.16	64.25,66.18	66.55,60.41	68.97,53.75
path	71.52,50.04	71.65,44.15	68.63,40.51	65.97,33.68	65.30,24.70
path	63.87,19.09	61.26,15.76	56.40,16.52	53.13,18.53	49.27,17.64
path	44.88,16.86	41.15,21.04	40.72,26.42	42.32,31.51
map Dornogal/0
path	28.91,20.98	25.42,42.09
map Isle of Dorn/0
path	43.16,47.12
map Dornogal/0
path	31.13,78.95
map Isle of Dorn/0
path	50.30,53.80	53.69,50.76	56.02,43.98	56.28,37.75	56.69,32.34
path	59.91,26.26	62.72,28.79	63.05,34.56	63.21,42.55	63.80,47.70
path	61.72,52.91	57.38,58.46	54.43,60.73	50.96,59.29
click Bismuth##413046+
|tip 他们与其他矿点共用刷新点
collect Bismuth##210930 |n
collect Bismuth##210931 |n
collect Bismuth##210932 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Bismuth##413046+
|tip 他们与其他矿点共用刷新点
collect Bismuth##210930 |n
collect Bismuth##210931 |n
collect Bismuth##210932 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Ironclaw (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	45.94,58.40	44.66,62.76	42.04,66.98	38.10,66.70	33.09,62.58
path	32.25,57.76	30.50,52.12	27.02,52.43	22.98,53.07	21.13,56.88
path	21.79,62.61	24.56,66.34	29.04,69.50	32.36,75.29	34.55,79.25
path	39.00,83.25	44.02,82.45	47.26,77.31	49.93,76.74	53.36,78.01
path	56.45,74.35	61.70,72.16	64.25,66.18	66.55,60.41	68.97,53.75
path	71.52,50.04	71.65,44.15	68.63,40.51	65.97,33.68	65.30,24.70
path	63.87,19.09	61.26,15.76	56.40,16.52	53.13,18.53	49.27,17.64
path	44.88,16.86	41.15,21.04	40.72,26.42	42.32,31.51
map Dornogal/0
path	28.91,20.98	25.42,42.09
map Isle of Dorn/0
path	43.16,47.12
map Dornogal/0
path	31.13,78.95
map Isle of Dorn/0
path	50.30,53.80	53.69,50.76	56.02,43.98	56.28,37.75	56.69,32.34
path	59.91,26.26	62.72,28.79	63.05,34.56	63.21,42.55	63.80,47.70
path	61.72,52.91	57.38,58.46	54.43,60.73	50.96,59.29
click Ironclaw##413049+
|tip 他们与其他矿点共用刷新点
collect Ironclaw Ore##210936 |n
collect Ironclaw Ore##210937 |n
collect Ironclaw Ore##210938 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Ironclaw (The Ringing Deeps)",{
author="support@zygorguides.com",
},[[
step
map The Ringing Deeps/0
path follow smart; loop on; ants curved; dist 50
path	51.52,64.64	52.33,58.68	51.88,53.19	50.50,46.89	47.88,40.79
path	45.57,36.81	44.89,28.16	43.11,20.83	42.81,13.90	45.11,10.69
path	49.98,10.14	53.54,11.32	52.00,17.48	52.14,24.44	54.58,30.49
path	57.83,33.25	64.05,31.55	66.12,35.78	71.11,38.74	71.13,42.93
path	68.27,42.54	62.41,41.64	60.04,52.05	58.56,62.72	61.15,72.11
path	64.30,81.52	65.05,89.01	62.06,90.56	59.50,84.25	57.94,77.97
path	54.35,70.71	51.15,68.03
click Ironclaw##413049+
|tip 他们与其他矿点共用刷新点
collect Ironclaw Ore##210936 |n
collect Ironclaw Ore##210937 |n
collect Ironclaw Ore##210938 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Aqirite (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	65.46,20.88	58.67,29.88	62.04,35.89	68.28,38.38	75.77,35.00	78.00,40.00
path	77.25,44.78	67.78,56.80	76.55,66.73	76.92,72.04	76.89,77.53
path	72.42,82.38	69.29,81.24	67.06,86.59	62.24,82.03
path	60.25,71.14	56.94,67.00	54.02,68.45	48.16,60.20	43.13,64.43
path	39.23,58.81	33.73,51.16
path	29.63,52.04	25.12,50.17	23.81,46.94	25.20,40.32	26.75,34.16
path	28.88,33.56	33.18,37.99	38.62,36.24	42.32,31.42	48.89,29.14
path	53.03,24.47	57.87,21.70	62.44,18.66
click Aqirite##413047+
|tip 他们与其他矿点共用刷新点
collect Aqirite##210933 |n
collect Aqirite##210934 |n
collect Aqirite##210935 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Aqirite (Hallowfall)",{
author="support@zygorguides.com",
},[[
step
map Hallowfall/0
path follow smart; loop on; ants curved; dist 50
path	40.20,67.02	39.87,62.21	37.36,58.56	32.71,58.29	28.32,59.16
path	22.74,59.13	22.91,55.20	28.09,50.10	30.78,43.37	32.74,35.04
path	34.12,28.78	38.75,25.03	42.11,22.08	45.33,15.94	46.06,12.40
path	49.54,15.92	53.18,16.82	55.26,22.04	54.84,27.84	52.38,31.60
path	47.76,31.31	44.92,36.31	42.15,41.78	40.06,44.96	41.48,47.07
path	47.17,49.95	54.18,52.80	57.26,54.33	59.09,51.42	62.48,50.96
path	64.90,47.49	62.70,44.01	59.71,41.50	59.49,37.02	60.26,31.55
path	64.90,27.56	67.96,29.79	69.43,37.79	71.97,42.88	70.31,48.47
path	69.73,51.94	70.32,57.43	68.25,63.06	64.23,66.51	63.01,66.62
path	60.90,66.00	57.91,66.76	53.68,67.43	44.87,67.23
click Aqirite##413047+
|tip 他们与其他矿点共用刷新点
collect Aqirite##210933 |n
collect Aqirite##210934 |n
collect Aqirite##210935 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Leveling Guides\\Khaz Algar Skinning 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Skinning profession from 1-100.",
startlevel=60.0,
condition_end=function() return skill('Khaz Algar Skinning') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Skinning') > 0 and skill('Khaz Algar Skinning') < 100 and level >= 60 end,
},[[
step
talk Ginnad##219083
训练剥皮 |skillmax Skinning,300 |goto Dornogal/0 54.27,57.40
step
talk Ginnad##219083
训练卡兹阿尔加尔剥皮技能 |skillmax Khaz Algar Skinning,100 |goto Dornogal/0 54.27,57.40
step
在卡兹·阿尔加剥皮中达到技能等级100 |skill Khaz Algar Skinning,100 |only if default
在卡兹阿尔加剥皮技能达到105级 |skill Khaz Algar Skinning,105 |only if KulTiran
在卡兹阿尔加剥皮术达到技能等级115 |skill Khaz Algar Skinning,115 |only if Worgen
|tip 加载你选择的任何剥皮刷点指南并开始刷点数。
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Stormcharged Leather (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	69.67,45.88	70.22,50.45	68.31,53.84	67.25,57.46	65.82,59.91
path	64.24,60.24	62.15,60.04	59.92,57.92	59.85,54.80	62.26,53.97
path	63.56,51.86	64.73,49.76	66.83,47.40
沿路杀敌
|tip 确保你拾取他们然后再剥皮
collect Stormcharged Leather##212664 |n
collect Stormcharged Leather##212665 |n
collect Stormcharged Leather##212666 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thunderous Hide (Isle of Dorn)",{
author="support@zygorguides.com",
},[[
step
map Isle of Dorn/0
path follow smart; loop on; ants curved; dist 50
path	69.67,45.88	70.22,50.45	68.31,53.84	67.25,57.46	65.82,59.91
path	64.24,60.24	62.15,60.04	59.92,57.92	59.85,54.80	62.26,53.97
path	63.56,51.86	64.73,49.76	66.83,47.40
沿路杀敌
|tip 确保你拾取他们然后再剥皮
|tip 雷霆之皮比风暴皮革更稀有
collect Thunderous Hide##212670 |n
collect Thunderous Hide##212672 |n
collect Thunderous Hide##212673 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Gloom Chitin (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	57.38,33.42	57.02,36.25	59.35,38.69	60.22,44.64	62.74,48.07
path	62.93,52.95	65.93,54.84	68.17,57.06	70.01,57.08	69.30,54.64
path	69.11,53.60	67.50,53.27	66.24,50.62	63.95,47.64	62.75,41.99
path	63.21,37.57	61.43,31.91
沿路杀敌
|tip 确保你拾取他们然后再剥皮
collect Gloom Chitin##212667 |n
collect Gloom Chitin##212668 |n
collect Gloom Chitin##212669 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Sunless Carapace (Azj-Kahet)",{
author="support@zygorguides.com",
},[[
step
map Azj-Kahet/0
path follow smart; loop on; ants curved; dist 50
path	57.38,33.42	57.02,36.25	59.35,38.69	60.22,44.64	62.74,48.07
path	62.93,52.95	65.93,54.84	68.17,57.06	70.01,57.08	69.30,54.64
path	69.11,53.60	67.50,53.27	66.24,50.62	63.95,47.64	62.75,41.99
path	63.21,37.57	61.43,31.91
沿路杀敌
|tip 确保你拾取他们然后再剥皮
|tip 无光甲壳比阴郁蟾蜍甲更加罕见
collect Sunless Carapace##212674 |n
collect Sunless Carapace##212675 |n
collect Sunless Carapace##212676 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Leveling Guides\\Khaz Algar Tailoring 1-100",{
author="support@zygorguides.com",
description="This guide will walk you through leveling your Khaz Algar Tailoring profession from 1-100.",
startlevel=68.0,
condition_end=function() return skill('Khaz Algar Tailoring') >= 100 end,
condition_suggested=function() return skill('Khaz Algar Tailoring') > 0 and skill('Khaz Algar Tailoring') < 100 and level >= 70 end,
},[[
step
大致材料清单：
|tip 织梦布: 175
|tip 这些总数是大概的。
|tip 建议你至少制作每个配方一次并利用制作订单系统，这将使所需材料有所不同。
|tip 这些材料将让你达到大约45的技能等级
点击这里继续 |confirm
step
talk Kotag##219094
训练裁缝 |skillmax Tailoring,300 |goto Dornogal/0 54.69,63.67
step
talk Kotag##219094
训练卡兹阿尔加裁缝 |skillmax Khaz Algar Tailoring,100 |goto Dornogal/0 54.69,63.67
step
talk Krinn##219081
buy 230 Mosswool Thread##224764 |goto Dornogal/0 54.43,59.25 |or
'|complete skill("Khaz Algar Tailoring") >= 15 |or |only if default
'|complete skill("Khaz Algar Tailoring") >= 20 |or |only if KulTiran
step
create 35 Unraveling##446926,Khaz Algar Tailoring,10 |goto Dornogal/0 54.69,63.67 |only if default
create 35 Unraveling##446926,Khaz Algar Tailoring,15 |goto Dornogal/0 54.69,63.67 |only if KulTiran
|tip 稍后我们会用到这些物品
step
talk Kotag##219094
训练织夫布卷 |learn Weavercloth Bolt##446929 |goto Dornogal/0 54.69,63.67
step
create 40 Weavercloth Bolt##446929,Khaz Algar Tailoring,25 |goto Dornogal/0 54.69,63.67 |only if default
create 40 Weavercloth Bolt##446929,Khaz Algar Tailoring,30 |goto Dornogal/0 54.69,63.67 |only if KulTiran
|tip 稍后我们会用到这些物品
|tip 你可能需要更多才能达到25，如果你的运气不好。
step
talk Kotag##219094
训练先锋的完美披风 |learn Pioneer's Perfected Cloak##446958 |goto Dornogal/0 54.69,63.67
step
talk Berred##219100
buy 10 Adorning Ribbon##228930 |goto Dornogal/0 54.78,63.91 |or 2
buy 20 Mosswool Thread##224764 |goto Dornogal/0 54.78,63.91 |or 2
'|complete skill("Khaz Algar Tailoring") >= 35 |override |only if default
'|complete skill("Khaz Algar Tailoring") >= 40 |override |only if KulTiran
step
collect 20 Weavercloth Bolt##222806 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Tailoring") >= 35 |or |only if default
'|complete skill("Khaz Algar Tailoring") >= 40 |or |only if KulTiran
step
create 10 Pioneer's Perfected Cloak##446958,Khaz Algar Tailoring,35 |goto Dornogal/0 54.69,63.67 |only if default
create 10 Pioneer's Perfected Cloak##446958,Khaz Algar Tailoring,40 |goto Dornogal/0 54.69,63.67 |only if KulTiran
step
talk Kotag##219094
开拓者完美护肩 |learn Pioneer's Perfected Mantle##446962 |goto Dornogal/0 54.69,63.67
step
talk Berred##219100
buy 10 Adorning Ribbon##228930 |goto Dornogal/0 54.78,63.91 |or 2
buy 30 Mosswool Thread##224764 |goto Dornogal/0 54.78,63.91 |or 2
'|complete skill("Khaz Algar Tailoring") >= 45 |override |only if default
'|complete skill("Khaz Algar Tailoring") >= 50 |override |only if KulTiran
step
collect 20 Weavercloth Bolt##222806 |or
|tip 你在上一步中创建了这些。
'|complete skill("Khaz Algar Tailoring") >= 45 |or |only if default
'|complete skill("Khaz Algar Tailoring") >= 50 |or |only if KulTiran
step
create 10 Pioneer's Perfected Mantle##446962,Khaz Algar Tailoring,45 |goto Dornogal/0 54.69,63.67 |only if default
create 10 Pioneer's Perfected Mantle##446962,Khaz Algar Tailoring,50 |goto Dornogal/0 54.69,63.67 |only if KulTiran
step
在卡兹艾加裁缝学技能达到100级 |skill Khaz Algar Tailoring,100 |only if default
在喀兹阿尔加裁缝技能达到105级 |skill Khaz Algar Tailoring,105 |only if KulTiran
|tip 从这一点开始，由于需要灵魂绑定材料，继续获取点数变得非常困难。
|tip 你最好的路径是使用定制打造成系统，使用其他玩家提供的材料来制作物品。
|tip 这样可以更便宜地制作每个配方以获得首次制作奖励
]])
