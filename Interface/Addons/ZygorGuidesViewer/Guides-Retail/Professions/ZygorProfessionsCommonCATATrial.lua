local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("ProfessionsC") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Bear Flank",{
author="support@zygorguides.com",
description="\nBear Flanks can be gathered from the western end of Western Plaguelands.",
},[[
step
Kill Black Bear enemies around this area
collect Bear Flank##35562 |n |goto Western Plaguelands/0 35.87,64.80
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Bear Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Crawler Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Crocolisk Tail")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Giant Egg")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crawler Meat",{
author="support@zygorguides.com",
description="\nCrawler Meat can be gathered from Darkshore.",
},[[
step
talk Zidormi##141489
Ask her _"Can you show me what Darkshore was like before the battle?"_
Travel to the Past |complete ZGV.InPhase('Old Darnassus') |goto Darkshore/0 48.86,24.46
step
map Darkshore/0
path loop off; follow strict; dist 40
path	36.96,64.39	37.28,67.03	37.91,69.20	36.88,71.44	37.76,73.92
path	39.04,74.72	38.59,77.78	38.25,80.50	35.95,82.80	36.40,86.66
kill Encrusted Tide Crawler##2233+
|tip They are generally in the water.
collect Crawler Meat##2674 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Crocolisk Tail")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Giant Egg")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Raptor Egg")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Flesh",{
author="support@zygorguides.com",
description="\nRaptor Flesh can be gathered from southern Arathi Highlands.",
},[[
step
talk Zidormi##141649
Ask her _"Can you show me what Arathi Highlands was like before the war broke out?"_
Travel to the Past |complete ZGV.InPhase('Old Arathi') |goto Arathi Highlands/0 38.24,90.09
step
kill Highland Fleshstalker##2561+
|tip All over this area.
collect Raptor Flesh##12184 |n |goto 42.69,77.33
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Sandworm Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Raptor Ribs")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Ravager Flesh")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Talbuk Venison")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Shoveltusk Flank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Giant Turtle Tongue")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Farming Guides\\Snake Eye")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Black Lotus")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blindweed",{
author="support@zygorguides.com",
description="\nBlindweed can be gathered from Western Plaguelands.",
condition_end=function() return skill('Herbalism') >= 50 end,
},[[
step
map Western Plaguelands/0
path follow smart; loop on; ants curved; dist 60
path	32.29,67.51	34.15,69.05	37.72,68.67	39.01,73.99	43.24,75.29
path	47.27,73.61	50.96,70.89	56.20,69.13	62.13,63.79	67.86,62.48
path	62.26,82.75	57.56,80.20	54.19,74.69	50.00,72.33	46.39,78.06
path	40.17,77.54	35.38,73.50	30.74,70.77
click Blindweed##142143+
|tip Gather Blindweed along the path.
collect Blindweed##8839 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Bloodthistle")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Briarthorn")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Bruiseweed")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Dragon's Teeth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Dreamfoil")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Fadeleaf")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Firebloom")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Ghost Mushroom",{
author="support@zygorguides.com",
description="\nGhost Mushroom can be gathered from Un'Goro Crater.",
condition_end=function() return skill('Herbalism') >= 50 end,
},[[
step
Enter the cave |goto Un'Goro Crater/0 63.98,16.43 < 15 |c
step
map Un'Goro Crater/0
path follow smart; loop on; ants curved
path	65.63,16.38	66.45,17.56	67.30,17.33	67.68,16.59	68.36,16.58
path	69.09,17.67	69.56,17.07	69.21,15.99	68.56,14.63	68.65,13.56
path	68.40,13.00	67.66,13.96	67.33,14.46	66.46,14.38	65.66,14.92
click Ghost Mushroom##142144+
|tip Gather Ghost Mushrooms along the path.
|tip They are found inside the cave.
collect Ghost Mushroom##8845 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Golden Sansam")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Goldthorn")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Grave Moss")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Gromsblood")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Icecap")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Khadgar's Whisker")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Kingsblood")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Liferoot",{
author="support@zygorguides.com",
description="\nLiferoot can be gathered from Western Plaguelands.",
condition_end=function() return skill('Herbalism') >= 250 end,
},[[
step
map Western Plaguelands/0
path follow smart; loop on; ants curved; dist 60
path	32.29,67.51	34.15,69.05	37.72,68.67	39.01,73.99	43.24,75.29
path	47.27,73.61	50.96,70.89	56.20,69.13	62.13,63.79	67.86,62.48
path	62.26,82.75	57.56,80.20	54.19,74.69	50.00,72.33	46.39,78.06
path	40.17,77.54	35.38,73.50	30.74,70.77
click Liferoot##2041+
|tip Gather Liferoot along the path.
collect Liferoot##3357 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Mageroyal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Mountain Silversage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Purple Lotus")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Sorrowmoss")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Stranglekelp")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Sungrass")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Wild Steelbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Ancient Lichen")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Dreaming Glory")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Fel Lotus")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Felweed")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mana Thistle",{
author="support@zygorguides.com",
description="\nMana Thistle can be gathered from Terokkar Forest and Shadowmoon Valley.",
condition_end=function() return skill('Outland Herbalism') >= 50 end,
},[[
step
label "Start_Path"
map Terokkar Forest/0
path	follow smart; loop on; ants curved; dist 20
path	27.11,10.51	22.10,6.50	20.21,14.21	23.90,10.50
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
collect Mana Thistle##22793 |n
Farm Along the Path |goto 23.90,10.50 < 30 |noway |c
step
map Terokkar Forest/0
path	follow smart; loop on; ants curved; dist 20
path	62.42,73.60	65.70,79.21	68.72,85.72	72.21,88.52	74.91,87.50
path	72.31,82.01	69.31,74.60	62.41,73.60
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
collect Mana Thistle##22793 |n
Farm Along the Path |goto 62.41,73.60 < 30 |noway |c
step
map Shadowmoon Valley/0
path	follow smart; loop on; ants curved; dist 20
path	65.81,80.63	70.21,79.12	74.31,80.80	79.20,87.53	77.51,88.40
path	74.32,88.92	71.12,88.31	68.33,87.51	70.21,83.92	72.02,85.91
path	74.60,86.41
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
collect Mana Thistle##22793 |n
Farm Along the Path |goto 74.60,86.41 < 30 |noway |c |next "Start_Path"
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Netherbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Nightmare Vine")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Ragveil")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Terocone")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Adder's Tongue")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Deadnettle")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Fire Leaf")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Frost Lotus")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Goldclover",{
author="support@zygorguides.com",
description="\nGoldclover can be gathered from Borean Tundra.",
condition_end=function() return skill('Northrend Herbalism') >= 50 end,
},[[
step
map Borean Tundra/0
path follow smart; loop on; ants curved; dist 60
path	51.92,47.73	53.71,43.42	53.20,38.81	54.83,29.93	51.32,20.81
path	49.41,26.22	42.92,41.31	36.51,54.92	44.12,64.22	52.21,60.72
path	57.73,52.11
click Goldclover##189973+
|tip Gather Goldclover along the path.
collect Goldclover##36901 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Icethorn")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Lichbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Talandra's Rose")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Tiger Lily")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Azshara's Veil")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Cinderbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Heartblossom")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Stormvine")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Twilight Jasmine")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Farming Guides\\Whiptail")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Dark Iron")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Gold")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Iron",{
author="support@zygorguides.com",
description="\nIron can be gathered from Feralas.",
condition_end=function() return skill('Mining') >= 50 end,
},[[
step
map Feralas/0
path follow smart; loop on; ants curved
path	79.41,40.49	79.24,37.50	77.83,36.52	77.07,35.98	77.27,33.61
path	76.69,32.61	76.70,30.67	76.13,28.72	74.13,29.39	75.02,30.39
path	76.00,31.51	75.84,32.81	74.90,34.66	73.22,35.06	71.04,35.08
path	70.06,37.08	69.24,38.87	68.71,41.35	68.35,44.13	67.70,45.81
path	66.22,46.93	63.94,48.02	62.49,46.80	61.98,45.04	60.44,44.90
path	59.75,44.65	58.44,44.61	57.48,45.11	56.19,45.07	54.91,46.33
path	53.52,46.24	51.07,45.41	50.10,44.97	49.30,43.88	48.54,42.63
path	48.68,40.42	48.53,39.28	49.48,34.88	50.79,33.93	51.64,32.54
path	52.29,31.05	51.26,29.46	50.92,28.37	51.21,26.15	51.62,21.59
path	52.01,18.44	52.97,15.94	53.81,12.82	54.23,10.36	54.60,7.91
path	53.30,5.86	51.59,5.12	49.55,4.85	48.23,5.35	47.57,6.60
path	46.56,6.70	45.44,7.67	44.34,7.35	42.76,7.51	41.65,8.12
path	40.11,8.09	38.86,9.54	37.71,10.97	36.92,13.40	37.31,15.06
path	37.72,16.84	37.46,19.45	37.16,20.55	37.06,22.81	37.17,24.73
path	38.01,25.42	39.62,26.02	41.06,25.98	42.85,25.77	44.73,26.18
path	45.55,27.51	46.81,30.05	47.66,30.97	48.22,33.84	47.06,37.24
path	44.71,39.85	43.99,42.43	44.50,45.10	44.84,49.19	45.25,51.45
path	47.71,54.13	49.97,53.46	51.25,51.68	52.95,52.20	54.51,52.99
path	54.99,54.46	55.08,56.57	54.58,59.25	55.03,61.95	55.07,63.87
path	53.65,65.16	52.99,66.69	52.77,67.96	52.98,70.03	53.39,72.04
path	53.53,73.83	54.82,75.40	55.98,75.42	57.06,75.42	58.19,74.99
path	59.07,74.08	60.23,74.38	61.30,74.49	62.31,73.35	62.17,71.46
path	62.30,69.14	61.66,67.36	61.50,66.28	62.22,64.44	63.16,63.89
path	63.25,62.37	64.07,62.21	65.40,63.08	66.05,63.45	67.02,62.72
path	67.83,61.96	69.54,62.73	70.51,63.96	71.47,64.99	72.61,64.62
path	73.90,64.39	75.11,63.63	76.02,62.79	75.86,60.47	76.50,59.70
path	76.33,57.90	75.76,55.49	75.58,52.57	75.70,49.77	76.19,48.96
path	77.40,48.26	78.76,47.54	79.49,46.96	80.10,47.23	81.21,46.06
path	82.69,45.69	82.75,42.73	82.26,39.84	80.69,39.42
click Iron Deposit##1735+
|tip Gather Iron along the path.
|tip Enter caves along the path for better results.
collect Iron Ore##2772 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Mithril")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Silver")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Thorium")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Tin",{
author="support@zygorguides.com",
description="\nTin can be gathered from Hillsbrad Foothills.",
condition_end=function() return skill('Mining') >= 50 end,
},[[
step
map Hillsbrad Foothills/0
path follow smart; loop on; ants curved
path	39.25,33.57	39.97,37.22	41.74,41.11	44.67,40.68	49.05,32.72
path	51.59,31.48	50.32,28.95	49.31,26.49	50.36,24.48	48.95,20.08
path	46.36,21.61	43.54,21.17	41.21,23.03	40.10,27.54	39.38,32.29
click Tin Vein##1732+
|tip Gather Tin along the path.
|tip Enter caves along the path for better results.
collect Tin Ore##2771 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Truesilver")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Adamantite")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Fel Iron")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Khorium")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Cobalt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Saronite")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Titanium")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Elementium")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Obsidium")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Pyrite")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Heavy Hide")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Heavy Leather")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Medium Hide",{
author="support@zygorguides.com",
description="\nMedium Hide can be gathered from Northern Stranglethorn.",
condition_end=function() return skill('Skinning') >= 50 end,
},[[
step
map Northern Stranglethorn/0
path follow smart; loop on; ants curved; dist 60
path	41.12,45.22	37.12,38.65	36.53,30.93	35.70,25.83	35.83,19.72
path	40.54,20.62	45.81,25.41	48.31,30.01	48.22,35.51	42.93,47.42
Kill enemies around this area
collect Medium Hide##4232 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Medium Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Rugged Leather")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Leather",{
author="support@zygorguides.com",
description="\nThick Leather can be gathered from Badlands.",
condition_end=function() return skill('Skinning') >= 50 end,
},[[
step
kill Nyxondra's Broodling##46916+
collect Thick Leather##4304 |n |goto Badlands/0 11.0,38.2
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Fel Scales")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Knothide Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Thick Clefthoof Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Borean Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Nerubian Chitin")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Blackened Dragonscale")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Skinning\\Farming Guides\\Savage Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Tailoring\\Farming Guides\\Mageweave Cloth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\Tailoring\\Farming Guides\\Wool Cloth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Essence of Air")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Essence of Earth")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Essence of Fire",{
author="support@zygorguides.com",
description="\nEssence of Fire can be gathered from Molten Core.",
},[[
step
Kill enemies around this area
|tip All mobs but Corehounds can drop Essence of Fire.
|tip Kill mobs throughout the instance.
collect Essence of Fire##7078 |n |goto Molten Core/1 00.00,00.00
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Essence of Undeath")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Essence of Water")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Living Essence")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Air",{
author="support@zygorguides.com",
description="\nPrimal Air can be gathered from Shadowmoon Valley, Outland.",
},[[
step
label "Start"
map Shadowmoon Valley/0
path follow smart; loop off; ants curved; dist 30
path	55.53,72.49	59.06,69.81	61.40,66.56	62.46,62.66	61.26,59.46
path	57.67,56.49	59.53,53.73	63.10,55.41	65.02,57.56	65.87,62.28
path	63.43,60.68
kill Enraged Air Spirit##21060+
|tip Follow the path, killing any that you see.
collect Mote of Air##22572 |n
|tip Combine 10 Motes of Air into 1 Primal Air.
'|goto 63.43,60.68 < 30 |c |noway
step
map Shadowmoon Valley/0
path follow smart; loop off; ants curved; dist 30
path	62.59,62.13	61.28,67.03	59.70,69.75	55.35,71.72
kill Enraged Air Spirit##21060+
|tip Follow the path, killing any that you see.
collect Mote of Air##22572 |n
|tip Combine 10 Motes of Air into 1 Primal Air.
'|goto 55.35,71.72 < 30 |c |noway |next "Start"
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Earth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Fire")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Life")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Mana")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Shadow")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Primal Water")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Eternal Air")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Eternal Earth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Eternal Fire")
ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Eternal Life",{
author="support@zygorguides.com",
description="\nEternal Life can be gathered from the Howling Fjord in Northrend.",
},[[
step
kill Thornvine Creeper##23874+
collect Eternal Life##35625 |n |goto Howling Fjord/0 53.40,16.60
|tip Combine 10 Crystallized Life into one Eternal Life.
You can find more around here [52.52,18.73]
You can find more around here [54.66,19.78]
You can find more around here [55.22,16.30]
'|confirm
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Eternal Shadow")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Eternal Water")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Volatile Air")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Volatile Earth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Volatile Fire")
ZygorGuidesViewer:RegisterGuidePlaceholder("Profession Guides\\General Farming Guides\\Volatile Life")
