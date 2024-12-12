local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldGatherCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Ribbed Mollusk Meat",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{197742,116},{194730,72},{194968,48},{194967,68},{194970,40},{198397,8}},
maps={"The Waking Shores"},
},[[
step
label "Start"
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip Don't fish from pools.
collect Dull Spined Clam##198395 |n
use Dull Spined Clam##198395
|goldcollect 116 Ribbed Mollusk Meat##197742 |goto The Waking Shores/0 63.13,77.21 |n
|goldcollect 72 Scalebelly Mackerel##194730 |goto 63.13,77.21 |n
|goldcollect 48 Cerulean Spinefish##194968 |goto 63.13,77.21 |n
|goldcollect 68 Aileron Seamoth##194967 |goto 63.13,77.21 |n
|goldcollect 40 Islefin Dorado##194970 |goto 63.13,77.21 |n
|goldcollect 8 Rainbow Pearl##198397 |goto 63.13,77.21 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm  |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Aileron Seamoth",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{194967,68},{194966,32},{194970,20},{194969,20},{194730,60},{194968,48},{197742,16}},
maps={"The Waking Shores"},
},[[
step
label "Start"
map The Waking Shores/0
path follow strictbounce; loop on; ants curved; dist 30
path	66.39,74.10	64.76,74.42	63.35,77.00	63.41,80.03	62.94,82.80
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip Schools share a spawn with Thousandbite Piranhas.
|tip You can also catch them in the open water.
|goldcollect 68 Aileron Seamoth##194967 |n
|goldcollect 32 Thousandbite Piranha##194966 |n
|goldcollect 20 Islefin Dorado##194970 |n
|goldcollect 20 Temporal Dragonhead##194969 |n
|goldcollect 60 Scalebelly Mackerel##194730 |n
|goldcollect 48 Cerulean Spinefish##194968 |n
|goldcollect 16 Ribbed Mollusk Meat##197742 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fish |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Cerulean Spinefish/Scalebelly Mackerel",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{194968,56},{194730,100},{194970,32},{194967,20}},
maps={"The Waking Shores"},
},[[
step
label "Start"
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip You can fish from pools or open water.
|tip Note that pools share spawn with several other fish.
|goldcollect 56 Cerulean Spinefish##194968 |goto The Waking Shores/0 63.13,77.21 |n
|goldcollect 100 Scalebelly Mackerel##194730 |goto 63.13,77.21 |n
|goldcollect 32 Islefin Dorado##194970 |goto 63.13,77.21 |n
|goldcollect 20 Aileron Seamoth##194967 |goto 63.13,77.21 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fish |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Islefin Dorado",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{194970,32},{194967,68},{194968,60},{194730,80},{197742,112},{198397,8}},
maps={"The Azure Span"},
},[[
step
label "Start"
collect Islefin Dorado Lure##198403 |n
|tip These are made by Dragon Isles Skinning: Harvesting - Lure Crafters.
|tip They require 2 "Exceptional Morsel", which are gathered by Lure Crafters as well.
|tip It also requires 1 "Flawless Proto Dragon Scale".
Click Here to Continue |confirm
step
use the Islefin Dorado Lure##198403
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|goldcollect 32 Islefin Dorado##194970 |goto The Azure Span/0 12.40,50.11 |n
|goldcollect 68 Aileron Seamoth##194967 |goto 12.40,50.11 |n
|goldcollect 60 Cerulean Spinefish##194968 |goto 12.40,50.11 |n
|goldcollect 80 Scalebelly Mackerel##194730 |goto 12.40,50.11 |n
|goldcollect 112 Ribbed Mollusk Meat##197742 |goto 12.40,50.11 |n
|goldcollect 8 Rainbow Pearl##198397 |goto 12.40,50.11 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Islefin Dorado |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lava Beetle",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{197755,44},{199344,8},{197754,28},{190320,20}},
maps={"The Waking Shores"},
},[[
step
label "Start"
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the lava.
|tip Keep repeating this process.
|goldcollect 44 Lava Beetle##197755 |goto The Waking Shores/0 31.99,61.74 |n
|goldcollect 8 Magma Thresher##199344 |goto 31.99,61.74 |n
|goldcollect 28 Salt Deposit##197754 |goto 31.99,61.74 |n
|goldcollect 20 Rousing Fire##190320 |goto 31.99,61.74 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Lava Beetle |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Temporal Dragonhead/Thousandbite Piranha",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{194969,132},{194966,68}},
maps={"The Waking Shores"},
},[[
step
label "Start"
map The Waking Shores/0
path follow strictbounce; loop off; ants curved; dist 25
path	52.81,35.05	50.11,38.80	49.39,42.93	50.88,47.58	52.53,51.10
path	54.40,55.92	55.83,60.49	54.18,62.21	54.46,66.63
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip Fish from Schools along the river.
|tip Schools share a spawn with Thousandbite Piranha.
|goldcollect 132 Temporal Dragonhead##194969 |n
|goldcollect 68 Thousandbite Piranha##194966 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Temporal Dragonhead |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Magma Thresher",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{199344,204}},
maps={"The Waking Shores"},
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 15 with the Iskaara Tuskarr |complete factionrenown(2511) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
cast Fishing##131474
|tip Fish in any water in the Dragon Isles to gain skill points.
Reach Skill Level 50 in Dragon Isles Fishing |skill Dragon Isles Fishing,50
step
click Sea-Polished Basalt+
|tip They look like small rocks near the waterline around the fishing trainer.
collect 3 Sea-Polished Basalt##200079 |goto The Waking Shores/0 81.26,31.32 |q 67140 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Polished Basalt Bracelet" entry.
|tip Click the "Create" button.
Create a Polished Basalt Bracelet |q 67140 |goto The Azure Span/0 12.82,49.18 |future
step
label "Start"
map The Waking Shores/0
path follow strictbounce; loop off; ants curved; dist 25
path	55.11,23.28	57.35,24.97	62.55,25.28	63.51,25.83	67.02,30.47
path	67.99,26.41
cast Fishing##131474
|tip Lava stepping stones may occasionally appear.
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|goldcollect 204 Magma Thresher##199344 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Magma Thresher |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Prismatic Leaper (Ohn'ahran Plains)",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{200061,52}},
maps={"Ohn'ahran Plains"},
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 7 with the Iskaara Tuskarr |complete factionrenown(2511) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
click Flying Fish Bones
collect Flying Fish Bones##200075 |goto The Azure Span/0 12.50,49.94 |q 67139 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Flying Fish Bone Charm" entry.
|tip Click the "Create" button.
Create a Flying Fish Bone Charm |q 67139 |goto The Azure Span/0 12.82,49.18 |future
step
label "Start"
map Ohn'ahran Plains/0
path follow smart; loop off; ants curved; dist 25
path	58.4,31.4	64.6,38.7	86.2,51.9	56.7,80.5
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|goldcollect 52 Prismatic Leaper##200061 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Prismatic Leaper |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Prismatic Leaper (The Azure Span)",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{200061,144},{194966,40},{194730,40},{194969,36},{194970,20}},
maps={"The Azure Span"},
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 7 with the Iskaara Tuskarr |complete factionrenown(2511) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
click Flying Fish Bones
collect Flying Fish Bones##200075 |goto The Azure Span/0 12.50,49.94 |q 67139 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Flying Fish Bone Charm" entry.
|tip Click the "Create" button.
Create a Flying Fish Bone Charm |q 67139 |goto The Azure Span/0 12.82,49.18 |future
step
label "Start"
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip Fish from the schools.
|goldcollect 144 Prismatic Leaper##200061 |goto The Azure Span/0 30.5,24.9 |n
|goldcollect 40 Thousandbite Piranha##194966 |n
|goldcollect 40 Scalebelly Mackerel##194730 |n
|goldcollect 36 Temporal Dragonhead##194969 |n
|goldcollect 20 Islefin Dorado##194970 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Prismatic Leaper |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Prismatic Leaper (Thaldraszus)",{
meta={goldtype="route",skillreq={dragon_isles_fishing=1},levelreq={60}},
items={{200061,48},{194966,32},{194730,116},{194969,32},{194970,36},{197742,76},{198397,4}},
maps={"Thaldraszus"},
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 7 with the Iskaara Tuskarr |complete factionrenown(2511) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
click Flying Fish Bones
collect Flying Fish Bones##200075 |goto The Azure Span/0 12.50,49.94 |q 67139 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Flying Fish Bone Charm" entry.
|tip Click the "Create" button.
Create a Flying Fish Bone Charm |q 67139 |goto The Azure Span/0 12.82,49.18 |future
step
label "Start"
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
|tip Fish from the schools.
|goldcollect 48 Prismatic Leaper##200061 |goto Thaldraszus/0 64.3,59.8 |n
|goldcollect 32 Thousandbite Piranha##194966 |n
|goldcollect 116 Scalebelly Mackerel##194730 |n
|goldcollect 32 Temporal Dragonhead##194969 |n
|goldcollect 36 Islefin Dorado##194970 |n
|goldcollect 76 Ribbed Mollusk Meat##197742 |n
|goldcollect 4 Rainbow Pearl##198397 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Prismatic Leaper |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Hochenblume",{
meta={goldtype="route",skillreq={dragon_isles_herbalism=1},levelreq={60}},
items={{191460,356},{190328,76},{197755,16},{191470,12},{191467,20},{190330,12}},
maps={"The Azure Span"},
},[[
step
label "Start"
map The Azure Span/0
path follow smart; loop on; ants curved; dist 35
path	15.75,46.71	17.58,41.19	16.46,39.23	18.69,29.45	17.11,26.36
path	21.19,25.67	25.00,30.93	31.47,36.84	37.16,29.24	42.99,36.12
path	46.49,32.25	49.87,29.25	52.99,26.54	55.46,24.84	58.80,24.19
path	61.63,22.73	63.67,22.82	65.40,19.81	68.93,23.31	72.46,26.81
path	66.18,31.47	62.44,37.47	63.50,40.89	58.10,49.22	58.80,55.63
path	49.27,61.93	45.62,56.80	45.00,53.05	35.88,49.80	34.69,47.15
path	29.79,46.25	24.62,47.46	17.61,48.43
click Hochenblume##381209+
|tip They look like green and purple flowers that grow over all terrain types.
|goldcollect 356 Hochenblume##191460,191461,191462 |n
|goldcollect 12 Writhebark##191470,191471,191472 |n
|goldcollect 76 Rousing Frost##190328 |n
|goldcollect 12 Rousing Decay##190330 |n
|goldcollect 16 Lava Beetle##197755 |n
|goldcollect 20 Bubble Poppy##191467,191468,191469 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Hochenblume |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Bubble Poppy/Saxifrage",{
meta={goldtype="route",skillreq={dragon_isles_herbalism=1},levelreq={60}},
items={{191460,176},{191467,40},{191464,40},{197755,32},{190326,32},{190328,40}},
maps={"The Waking Shores"},
},[[
step
label "Start"
map The Waking Shores/0
path follow strictbounce; loop off; ants curved; dist 30
path	36.92,89.27	37.93,84.73	38.97,77.03	42.45,76.05	47.14,76.93
path	50.08,68.71	53.04,61.02	58.64,62.85	64.08,69.87	69.45,72.53
path	74.07,67.94	76.06,62.90	78.51,57.95	78.12,52.67	75.69,47.78
path	70.28,42.66	67.21,47.71	68.79,55.52	66.42,60.25	61.47,55.31
path	60.03,47.41	59.98,39.24	55.17,35.69	50.97,36.67	49.38,41.87
path	51.32,48.73	54.07,55.64
Follow the path
click Bubble Poppy##375241+
|tip They look like white and green flowers that grow in damp areas.
click Saxifrage##381207+
|tip They look like bushy plants that grown on rocks and cliffs.
|goldcollect 40 Bubble Poppy##191467,191468,191469 |n
|goldcollect 176 Hochenblume##191460,191461,191462 |n
|goldcollect 40 Saxifrage##191464,191465,191466 |n
|goldcollect 32 Lava Beetle##197755 |n
|goldcollect 32 Rousing Air##190326 |n
|goldcollect 40 Rousing Frost##190328 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Bubble Poppy and Saxifrage |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Writhebark",{
meta={goldtype="route",skillreq={dragon_isles_herbalism=1},levelreq={60}},
items={{191470,84},{191460,332},{191467,20},{190330,32},{190328,92},{197755,12}},
maps={"The Azure Span"},
},[[
step
label "Start"
map The Azure Span/0
path follow smart; loop on; ants curved; dist 40
path	23.67,48.05	22.43,48.08	19.37,46.87	17.35,42.24	19.66,38.24
path	19.97,33.96	21.71,28.38	25.63,32.27	25.90,41.19	28.80,36.28
path	29.86,34.48	33.69,35.89	34.56,33.74	37.99,33.57	39.06,38.48
path	40.53,44.13	35.55,42.66	32.68,42.15	30.07,45.87	27.81,46.14
click Writhebark##381154+
|tip They look like twisted roots in areas of dense foliage.
|goldcollect 84 Writhebark##191470,191471,191472 |n
|goldcollect 332 Hochenblume##191460,191461,191462 |n
|goldcollect 20 Bubble Poppy##191467,191468,191469 |n
|goldcollect 32 Rousing Decay##190330 |n
|goldcollect 92 Rousing Frost##190328 |n
|goldcollect 12 Lava Beetle##197755 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Writhebark |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Serevite/Draconium/Khaz'gorite Ore",{
meta={goldtype="route",skillreq={dragon_isles_mining=1},levelreq={60}},
items={{190395,488},{189143,84},{190312,20},{190322,20},{190320,36},{190315,16},{197754,56}},
maps={"The Waking Shores"},
},[[
step
label "Start"
map The Waking Shores/0
path follow smart; loop on; ants curved; dist 20
path	66.99,56.32	72.07,57.48	76.01,51.77	77.00,48.25	78.52,39.32
path	76.25,38.51	77.05,29.45	67.70,30.98	64.98,38.14	62.93,41.23
path	50.62,39.10	45.45,41.52	40.65,48.92	34.18,51.79	30.72,51.38
path	28.48,64.72	28.12,69.86	30.23,75.73	33.29,80.37	36.68,80.94
path	37.23,84.57	37.03,90.38	40.06,92.50	43.83,87.39	50.72,77.14
path	55.12,78.57	56.50,71.05	60.66,63.30	64.02,60.01
click Serevite Deposit##381102+
click Draconium Deposit##379248+
|tip These share spawns with each other.
|tip Khaz'gorite is a rare drop from both.
|goldcollect 24 Serevite Ore##190395,190396,190394 |n
|goldcollect 84 Draconium Ore##189143,188658,190311 |n
|goldcollect 20 Khaz'gorite Ore##190312,190313,190314 |n
|goldcollect 20 Rousing Order##190322 |n
|goldcollect 36 Rousing Fire##190320 |n
|goldcollect 16 Rousing Earth##190315 |n
|goldcollect 56 Salt Deposit##197754 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Ore |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Resilient Leather/Dense Hide",{
meta={goldtype="route",skillreq={dragon_isles_skinning=1},levelreq={60}},
items={{193208,444},{193216,8},{201403,4},{197741,88},{197746,108},{197747,48}},
maps={"Ohn'ahran Plains"},
},[[
step
label "Start"
map Ohn'ahran Plains/0
path follow smart; loop on; ants curved; dist 20
path	48.35,34.04	48.35,36.35	50.16,38.65	52.36,38.77	52.28,35.91
path	53.50,34.79	53.10,32.32	51.74,31.27	50.41,30.72	49.13,28.85
Kill enemies along the path
|tip Make sure you loot them so you can skin them after.
|goldcollect 444 Resilient Leather##193208,193210,193211 |n
|goldcollect 8 Dense Hide##193216,193217,193218 |n
|goldcollect 56 Mastodon Tusk##201403 |n
|goldcollect 88 Maybe Meat##197741 |n
|goldcollect 108 Bruffalon Flank##197746 |n
|goldcollect 48 Mighty Mammoth Ribs##197747 |n
|tip These have a low drop rate.
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Adamant Scales/Lustrous Scaled Hide",{
meta={goldtype="route",skillreq={dragon_isles_skinning=1},levelreq={60}},
items={{193213,516},{193208,102},{193222,12},{197741,52},{193252,4},{197748,8},{193255,48}},
maps={"Thaldraszus"},
},[[
step
label "Start"
map Thaldraszus/0
path follow smart; loop on; ants curved; dist 20
path	56.64,77.91	55.56,78.52	54.53,77.51	54.36,76.16	56.13,75.27
path	57.16,76.41	57.20,77.57
Kill enemies along the path
|tip Make sure you loot them so you can skin them after.
|goldcollect 516 Adamant Scales##193213,193214,193215 |n
|goldcollect 102 Resilient Leather##193208,193210,193211 |n
|goldcollect 12 Lustrous Scaled Hide##193222,193223,193224 |n
|goldcollect 52 Maybe Meat##197741 |n
|goldcollect 4 Salamanther Scale##193252 |n
|goldcollect 8 Burly Bear Haunch##197748 |n
|goldcollect 48 Pristine Vorquin Horn##193255 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Adamant Scales |confirm |next "Start"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Tattered Wildercloth/Wildercloth (Tailoring)",{
meta={goldtype="route",levelreq={60},itemtype="cloth"},
items={{193050,304},{193922,52}},
maps={"The Azure Span"},
},[[
step
talk Threadfinder Pax##195850
Train Tailoring |skillmax Tailoring,300 |goto Valdrakken/0 32.13,66.24
step
talk Threadfinder Pax##195850
Train Dragon Isles Tailoring |skillmax Dragon Isles Tailoring,100 |goto Valdrakken/0 32.13,66.24
step
label "Start"
Kill Brinetooth enemies around this area
|goldcollect 304 Tattered Wildercloth##193050 |goto The Azure Span/0 10.08,43.41 |n
|goldcollect 52 Wildercloth##193922 |goto The Azure Span/0 10.08,43.41 |n
|goldtracker
|tip
_Ready to Sell?_
Click Here to Sell Your Items on the Auction House |confirm
step
talk Auctioneer Antiqdormi##197911 |goto Valdrakken/0 42.39,59.99
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Cloth |confirm |next "Start"
]])
