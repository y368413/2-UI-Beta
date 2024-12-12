local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("EventsC") then return end
ZygorGuidesViewer.GuideMenuTier = "CAT"
ZygorGuidesViewer:RegisterGuide("Events Guides\\The War Within (70-80)\\Radiant Echoes",{
author="support@zygorguides.com",
description="This guide will assist you in completing Radiant Echoes in Dragonblight, Dustwallow Marsh, and Searing Gorge.",
startlevel=10,
patch='110000',
},[[
step
confirm
|tip This event rotates from Dustwallow Marsh to Dragonblight to Searing Gorge in a sequence every 90 minutes.
|tip Week two will reduce the event cycle to every 60 minutes, and the week following will reduce the cycle to every 30 minutes.
|tip There will be 4 separate stages to each zone event.
|tip The first stage you will need to defeat Congealed Memories with other players.
|tip In the second stage, you will need to complete 6 memory events around the zone from a pool of 9 possibilites unique to that zone.
|tip In stage three, a remembered version of the Lich King, Ragnaros, or Onyxia will spawn respective to the apropriate zone.
|tip After defeating the boss, stage 4 persists until the end of the zone event.
|tip During the final stage, you can farm enemies from memories on the map for Residual Memories.
step
accept The War Within##81930 |goto Stormwind City/0 63.19,72.02
|tip You will automatically accept this quest.
|only if Alliance and completedq(76283)
step
Meet Jaina in Silithus |q 81930/2 |goto Silithus/0 41.96,45.04
|only if Alliance and completedq(76283)
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##81930 |goto Silithus/0 41.96,45.04
|only if Alliance and completedq(76283)
step
accept The War Within##78713 |goto Orgrimmar/1 50.96,78.44
|tip You will automatically accept this quest.
|only if Horde and completedq(76283)
step
Meet Jaina in Silithus |q 78713/2 |goto Silithus/0 41.96,45.04
|only if Horde and completedq(76283)
step
talk Lady Jaina Proudmoore##213625
turnin The War Within##78713 |goto Silithus/0 41.96,45.04
|only if Horde and completedq(76283)
step
talk Thrall##213620
accept Oh, THAT Sword##78714 |goto Silithus/0 41.96,45.05
|only if completedq(76283)
step
click Titan Translocator
Enter the Heart Chamber |q 78714/1 |goto Silithus/0 43.20,44.49
|only if completedq(76283)
step
talk Magni Bronzebeard##213624
turnin Oh, THAT Sword##78714 |goto Chamber of Heart/2 50.06,65.19
accept Azeroth's Voice##78715 |goto Chamber of Heart/2 50.06,65.19
|only if completedq(76283)
step
click Chamber Console
Activate the Chamber of Heart Console |q 78715/1 |goto Chamber of Heart/2 56.50,64.69 |count 1
|only if completedq(76283)
step
click Chamber Console
Activate the Chamber of Heart Console |q 78715/1 |goto Chamber of Heart/2 50.14,74.00 |count 2
|only if completedq(76283)
step
click Chamber Console
Activate the Chamber of Heart Console |q 78715/1 |goto Chamber of Heart/2 43.90,64.72 |count 3
|only if completedq(76283)
step
talk Magni Bronzebeard##213624
Tell him _"I'm ready. Let's begin."_ |gossip 120882
Talk to Magni to Begin the Ritual |q 78715/2 |goto Chamber of Heart/2 50.06,65.21
|only if completedq(76283)
step
talk Lady Jaina Proudmoore##213625
turnin Azeroth's Voice##78715 |goto Chamber of Heart/2 49.53,58.51
accept Painful Lessons##78716 |goto Chamber of Heart/2 49.53,58.51
|only if completedq(76283)
step
click Portal to Dalaran
Take Jaina's Portal to Dalaran |q 78716/1 |goto Chamber of Heart/2 53.43,58.01
|only if completedq(76283)
step
Meet with Khadgar in Dalaran |q 78716/2 |goto Dalaran L/12 46.80,54.47
|only if completedq(76283)
step
talk Archmage Khadgar##213627
|tip Inside the building.
turnin Painful Lessons##78716 |goto Dalaran L/12 42.87,59.86
|only if completedq(76283)
step
talk Moira Thaurissan##214651
|tip Inside the building.
accept The Bronzebeard Family##80500 |goto Dalaran L/12 40.39,54.13
|only if completedq(76283)
step
talk Brann Bronzebeard##214669
|tip Inside the building.
Tell him _"Magni's hurt. Moira needs you both in the Portrait Room."_ |gossip 121542
Talk to Brann |q 80500/1 |goto Dalaran L/10 50.73,55.59
|only if completedq(76283)
step
talk Moira Thaurissan##214651
|tip Inside the building.
turnin The Bronzebeard Family##80500 |goto Dalaran L/12 40.35,54.03
|only if completedq(76283)
step
accept Radiant Echoes##82539 |goto Orgrimmar/1 51.36,79.02 |only if Horde
accept Radiant Echoes##82539 |goto Stormwind City/0 63.25,72.21 |only if Alliance
|tip You will accept this quest automatically.
|tip You will need to relog to trigger this quest accept. |only if completedq(76283)
step
talk Archmage Khadgar##213627
|tip Inside Dalaran through the teleportation pad.
turnin Radiant Echoes##82539 |goto Dalaran L/12 42.94,59.82 |only if default
turnin Radiant Echoes##82539 |goto Dalaran L/12 36.28,77.34 |only if not completedq(76283)
step
talk Archmage Khadgar##213627
|tip Inside Dalaran through the teleportation pad.
accept Memories of Adventures Past##82540 |goto Dalaran L/12 42.94,59.82 |only if default
accept Memories of Adventures Past##82540 |goto Dalaran L/12 36.28,77.34 |only if not completedq(76283)
step
label "Turnin_Memories_of_Adventures_Past"
talk Archmage Khadgar##213627
|tip Inside Dalaran through the teleportation pad.
turnin Memories of Adventures Past##82540 |goto Dalaran L/12 42.94,59.82 |only if default
turnin Memories of Adventures Past##82540 |goto Dalaran L/12 36.28,77.34 |only if not completedq(76283)
|only if readyq(82540)
step
label "Radiant_Echo_Menu"
The Current Echo is:
Searing Gorge |complete areapoi(13,7637) |next "Searing_Gorge_Echo" |or
Dustwallow Marsh |complete areapoi(12,7818) |next "Dustwallow_Marsh_Echo" |or
Dragonblight |complete areapoi(113,7615) |next "Dragonblight_Echo" |or
step
label "Searing_Gorge_Echo"
talk Memory of a Duke##214399
accept Champion of the Waterlords##78938 |goto Searing Gorge/0 43.63,67.38 |or
'|complete areapoi(12,7818) or areapoi(113,7615) |or
step
Travel to Searing Gorge |goto Searing Gorge/0 43.63,67.38 < 10000 |c
|only if areapoi(13,7637)
step
label "Travel_To_Memory_Searing_Gorge"
Travel to A Memory on the Map |complete inscenario() |or
|tip Each of the bubbles on the map starts a new memory scenario.
'|complete not zone("Searing Gorge") |next "Radiant_Echo_Menu" |or
|only if areapoi(13,7637)
step
kill Remembered Boar##213456+
Collect the Impossibly Rare Boar Liver of Pristine Perfection |scenariogoal 1/0 |goto Searing Gorge/0 65.84,45.23
|only if inscenario(2330)
step
clicknpc Remembered Pumpkin##213552+
|tip They look like large blue translucent pumpkins on the ground around this area.
Poison #50# Pumpkins |scenariogoal 1/63281 |goto Searing Gorge/0 45.56,41.45
|only if inscenario(2333)
step
click Keg o' Scalding Mornbrew##413213+
|tip They look like large blue barrels on the ground around this area.
|tip Avoid Caffeinated Trogg that knock you around and stun you.
|tip Colored areas on the ground are slippery.
Deliver Scalding Mornbrew |scenariogoal 1/0 |goto Searing Gorge/0 35.15,64.13
Run them to the tower here [Searing Gorge/0 35.79,59.96]
|only if inscenario(2345)
step
Kill enemies around this area |kill Alliance Paladin##214148,Alliance Rogue##214166,Alliance Priest##214152,Alliance Mage##214167,Southshore Guard##212087
Slay Combatants |scenariogoal 1/0 |goto Searing Gorge/0 35.12,45.60
|only if inscenario(2344)
step
kill Remembered Hakkar##213579 |scenariogoal 1/63303 |goto Searing Gorge/0 27.75,54.36
|only if inscenario(2339)
step
kill Remembered Hogger##213570 |scenariogoal 1/63302 |goto Searing Gorge/0 56.36,37.21
|only if inscenario(2337)
step
kill Remembered Stitches##213529 |scenariogoal 1/63280 |goto Searing Gorge/0 55.68,52.62
|only if inscenario(2332)
step
kill Auctioned Pages Past##214069
kill Remembered Lashtail##214058
kill Remembered Bloodscalp##214059
Collect the Green Hills of Stranglethorn Pages |scenariostage 1 |goto Searing Gorge/0 61.57,70.02
|only if inscenario(2353)
step
Kill Remembered enemies around this area |kill Remembered Alarm-o-Bot##213768,Remembered Mechano-Tank##213785,Remembered Leper Gnome##213766
Defeat the Leper Gnome Memories! |scenariogoal 1/0 |goto Searing Gorge/0 48.20,63.85
|only if inscenario(2348)
step
Rerouting |complete not inscenario(2558) |next "Travel_To_Memory_Searing_Gorge" |or
'|complete inscenario(2558) |or
|only if areapoi(13,7637)
step
Wait for the Remembered Firelord to Spawn |complete inscenario(2558)
|only if areapoi(13,7637)
step
kill Remembered Firelord##212088 |scenariogoal 1/0 |goto Searing Gorge/0 56.14,44.15 |future
|tip This fight is similar to Ragnaros but much easier to complete.
|tip Move out of fire on the ground.
|tip If you are targeted with an ability that puts a circle on you, stay away from other players.
|tip Kill mobs that spawn quickly, preferrably with AoE off of the Firelord.
|only if areapoi(13,7637) and inscenario(2558)
step
label "Turnin_Champion_Waterlords"
talk Memory of a Duke##214399
turnin Champion of the Waterlords##78938 |goto Searing Gorge/0 43.63,67.38
|only if readyq(78938)
step
Routing
'|complete areapoi(13,7637) |next "Travel_To_Memory_Searing_Gorge" |or
'|complete readyq(78938) and not completedq(78938) |next "Turnin_Champion_Waterlords" |or
'|complete areapoi(12,7818) or areapoi(113,7615) |or
|next "Radiant_Echo_Menu" |only if default
|next "Turnin_Memories_of_Adventures_Past" |only if readyq(82540)
step
label "Dustwallow_Marsh_Echo"
talk Forgotten Hero##224367
accept Broken Masquerade##82676 |goto Dustwallow Marsh/0 45.45,57.65 |or
'|complete areapoi(13,7637) or areapoi(113,7615) |or
step
Travel to Duswallow Marsh |goto Dustwallow Marsh/0 45.45,57.65 < 10000 |c
|only if areapoi(12,7818)
step
label "Travel_To_Memory_Dustwallow"
Travel to A Memory on the Map |complete inscenario() |or
|tip Each of the bubbles on the map starts a new memory scenario.
'|complete not zone("Dustwallow Marsh") |next "Radiant_Echo_Menu" |or
|only if areapoi(12,7818)
step
kill Remembered King Mosh##212128 |scenariogoal 1/62793 |goto Dustwallow Marsh/0 32.36,65.30
|only if inscenario(2323)
step
Kill Remembered Deviate enemies around this area |kill Remembered Deviate Fish##221478,Remembered Deviate Raptor##221516
Catch the Remembered Deviate Fish! |scenariogoal 1/0 |goto Dustwallow Marsh/0 55.30,71.22
|only if inscenario(2495)
step
Kill Remembered enemies around this area |kill Remembered Darkmist##221612,Remembered Threadling##221647,Remembered Mother Smolderweb##221655
|tip You can walk over Threadlings to kill them
Collect a Whole Mess of Spider Eyes |scenariogoal 1/0 |goto Dustwallow Marsh/0 55.86,80.97
|only if inscenario(2523)
step
Kill Remembered enemies around this area |kill Remembered Scorpid##221905,Remembered Lazy Peon##221895
Discipline Lazy Peons |scenariogoal 1/0 |goto Dustwallow Marsh/0 45.69,78.22
|only if inscenario(2530)
step
Click Power Crystals
|tip Click the various colored power crystals on the ground around this area.
Bring as Many Crystals as You Can to the Pylons |scenariogoal 1/0 |goto Dustwallow Marsh/0 36.46,68.93
|only if inscenario(2527)
step
Kill enemies around this area
Quell the Quilboar |scenariogoal 1/0 |goto Dustwallow Marsh/0 37.02,55.07
|only if inscenario(2524)
step
kill Remembered King Gordok##221574 |scenariogoal 1/66859 |goto Dustwallow Marsh/0 44.73,65.92
|only if inscenario(2521)
step
kill Remembered Gahz'rilla##221578 |scenariogoal 1/66860 |goto Dustwallow Marsh/0 59.95,65.00
|only if inscenario(2522)
step
click Remembered Fel Cone##441229+
|tip They look like small pine cones on the ground around this area.
clicknpc Remembered Zenn Foulhoof##221944
Kill enemies around this area
Help Zenn Foulhoof Deal with the Abundance of Cute and Fluffly Wildlife |scenariogoal 1/0 |goto Dustwallow Marsh/0 48.44,61.75
|only if inscenario(2532)
step
Rerouting |complete not inscenario(2557) |next "Travel_To_Memory_Dustwallow" |or
'|complete inscenario(2557) |or
|only if areapoi(12,7818)
step
Wait for the Remembered Onyxia to Spawn |complete inscenario(2557)
|only if areapoi(12,7818)
step
kill Remembered Onyxia##221585 |scenariogoal 1/0 |goto Dustwallow Marsh/0 51.50,74.35 |future
|tip Shortly after becoming active, she will AoE fear everyone.
|tip Avoid standing in front of Onyxia when she starts her breath attack.
|tip AoE whelps that spawn quickly, cleaving off Onyxia.
|tip Avoid standing directly behind her.
|only if areapoi(12,7818) and inscenario(2557)
step
label "Turnin_Broken_Masquerade"
talk Forgotten Hero##224367
turnin Broken Masquerade##82676 |goto Dustwallow Marsh/0 45.45,57.65
|only if readyq(82676)
step
Routing
'|complete areapoi(12,7818) |next "Travel_To_Memory_Dustwallow" |or
'|complete readyq(82676) and not completedq(82676) |next "Turnin_Broken_Masquerade" |or
'|complete areapoi(13,7637) or areapoi(113,7615) |or
|next "Radiant_Echo_Menu" |only if default
|next "Turnin_Memories_of_Adventures_Past" |only if readyq(82540)
step
label "Dragonblight_Echo"
talk Echo of the Silver Hand##224373
accept Only Darkness##82689 |goto Dragonblight/0 59.50,51.98 |or
'|complete areapoi(12,7818) or areapoi(13,7637) |or
step
Travel to Dragonblight |goto Dragonblight/0 59.50,51.98 < 10000 |c
|only if areapoi(113,7615)
step
label "Travel_To_Memory_Dragonblight"
Travel to A Memory on the Map |complete inscenario() |or
|tip Each of the bubbles on the map starts a new memory scenario.
'|complete not zone("Dragonblight") |next "Radiant_Echo_Menu" |or
|only if areapoi(113,7615) and not inscenario(2571)
step
kill Recalled Webbed Crusader+
Free Webbed Crusaders |scenariogoal 1/0 |goto Dragonblight/0 53.02,56.31
|only if inscenario(2550)
step
click Log Pile+
|tip They look like memories of wood stacks on the ground around this area.
click Covered Log Pile
extraaction Lumber Swing##455248
|tip Use the ability on your screen to attack enemies.
Collect Lumber |scenariogoal 1/0 |goto Dragonblight/0 52.61,25.56
|only if inscenario(2560)
step
Kill Recalled enemies around this area |kill Recalled Heretic##221343,Recalled Drakkari##221319,Recalled Scourgeheart Drakkari##221320
Kill NPCs attacking Sseratus |scenariogoal 1/0 |goto Dragonblight/0 62.07,26.25
|only if inscenario(2454)
stickystart "Find_the_Maiden"
step
clicknpc Recalled Lake Frog##222048
'|script DoEmote("KISS")
|tip If one turns into a maiden, wait for a minute until you find her.
Kiss Frogs |scenariogoal 1/0 |goto Dragonblight/0 63.55,73.22
|only if inscenario(2533)
step
label "Find_the_Maiden"
talk Maiden of Ashwood Lake##222048
|tip A random frog will turn into the maiden after being kissed.
Find the Maiden |scenariogoal 1/68029 |goto Dragonblight/0 63.55,73.22
|only if inscenario(2533)
step
extraaction Olakin's Torch##444035
|tip Use it on objects and corpses on the ground around this area.
Burn Corpses |scenariogoal 1/0 |goto Dragonblight/0 67.32,52.76
|only if inscenario(2487)
step
kill Recalled Orinoko Tuskbreaker##221719 |scenariogoal 1/66869 |goto Dragonblight/0 71.76,39.33
|only if inscenario(2526)
step
click Cage+
Rescue the Tadpoles |scenariogoal 1/0 |goto Dragonblight/0 66.22,35.76
|only if inscenario(2518)
step
click Argent Banner
Plant the Banner |scenariogoal 1/66880 |goto Dragonblight/0 44.89,24.10
|only if inscenario(2529)
step
Watch the dialogue
Defeat Wilfred Fizzlebang! |scenariogoal 2/66879 |goto Dragonblight/0 44.89,24.10
|only if inscenario(2529)
step
kill Recalled Lord Jaraxxus##221861 |scenariogoal 3/66881 |goto Dragonblight/0 44.89,24.10
|only if inscenario(2529)
step
kill Recalled Thorim##221923 |scenariogoal 1/68028 |goto Dragonblight/0 56.88,42.74
|only if inscenario(2531)
step
Rerouting |complete not inscenario(2571) |next "Travel_To_Memory_Dragonblight" |or
'|complete inscenario(2571) |or
|only if areapoi(113,7615)
step
Wait for the Remembered Lich King to Spawn |complete inscenario(2571)
|only if areapoi(113,7615)
step
kill Remembered Lich King##224157 |scenariogoal 1/0 |goto Dragonblight/0 60.65,62.75 |future
|tip Don't stand in dark areas on the ground.
|tip AoE the adds that spawn, cleaving off of the Lich King.
|tip Avoid standing in front of the adds when they charge in a straight line.
|only if areapoi(113,7615) and inscenario(2571)
step
label "Turnin_Only_Darkness"
talk Echo of the Silver Hand##224373
turnin Only Darkness##82689 |goto Dragonblight/0 59.50,51.98
|only if readyq(82689)
step
Routing
'|complete areapoi(113,7615) |next "Travel_To_Memory_Dragonblight" |or
'|complete readyq(82689) and not completedq(82689) |next "Turnin_Only_Darkness" |or
'|complete areapoi(12,7818) or areapoi(13,7637) |or
|next "Radiant_Echo_Menu" |only if default
|next "Turnin_Memories_of_Adventures_Past" |only if readyq(82540)
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Azerothian Archives!",{
author="support@zygorguides.com",
description="This guide will help you complete Azerothian Archives activities.",
startlevel=70,
patch='100205',
},[[
step
click Azerothian Archives!
|tip Inside the building.
accept To the Archives!##77325 |goto Valdrakken/0 46.60,47.61
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin To the Archives!##77325 |goto Thaldraszus/0 61.57,31.32
accept The Big Dig: Traitor's Rest##79226 |goto 61.57,31.32
step
talk Zenata##208355
|tip Inside the base of the tower on the floating island.
accept Technoscrying 101##77231 |goto 61.62,31.12
step
talk Roska Rocktooth##208614
|tip Inside the base of the tower on the floating island.
accept Excavation 101##77267 |goto 61.60,31.08
step
Meet Zenata Outside |q 77231/1 |goto 61.26,30.75
step
use the Technoscryers##208084
Put on the Goggles |q 77231/2 |goto 61.26,30.75
step
use the Technoscryers##208084
Activate the Auto-Adjuster |q 77231/3 |goto 61.26,30.75
|tip Use the "Auto Adjusting..." ability on your action bar.
|tip It is highlighted in yellow.
step
use the Technoscryers##208084
Activate Scrying Mode |q 77231/4 |goto 61.26,30.75
|tip Use the "Scrying Mode" ability on your action bar.
|tip It is highlighted in yellow.
step
use the Technoscryers##208084
Remove the Goggles |q 77231/5 |goto 61.26,30.75
|tip Use the "Remove Goggles" ability on your action bar.
|tip It is highlighted in yellow.
step
talk Zenata##208355
turnin Technoscrying 101##77231 |goto 61.26,30.75
accept A Practical Test##77166 |goto 61.26,30.75
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
click Nirobin's Spectacles
Recover the Attunement "Relic" |q 77166/1 |goto 61.87,29.84
step
talk Zenata##208355
turnin A Practical Test##77166 |goto 61.69,29.87
accept I Can See Through Time!##77176 |goto 61.69,29.87
step
Reach the Nexus Point |q 77176/1 |goto 61.81,29.84
step
use the Technoscryers##202247
Put On the Goggles |q 77176/2 |goto 61.81,29.84
step
use the Technoscryers##202247
Activate Observation Mode |q 77176/3 |goto 61.81,29.84
|tip Use the "Observation Mode" ability in the second slot on your action bar.
step
Watch the dialogue
Observe the Temporal Scene |q 77176/4 |goto 61.81,29.84
step
talk Zenata##208355
turnin I Can See Through Time!##77176 |goto 61.69,29.87
accept Technoscrying: Observatory##77434 |goto 61.69,29.87
step
Meet Roska Outside |q 77267/1 |goto 61.06,30.60
step
use the Archivist's Fire Totem##210956
Place the Fire Totem |q 77267/2 |goto 61.06,30.60
step
talk Roska Rocktooth##208614
Tell her _"I'm ready to start digging!"_
Speak to Roska to Start the Dig |q 77267/3 |goto 61.06,30.60
step
use the Archivist's Fire Totem##210956
|tip Use it next to the smoking dirt patch on the ground.
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
Watch the dialogue
Unearth the First Find |q 77267/4 |goto 61.16,30.48
step
use the Archivist's Fire Totem##210956
|tip Use it next to the smoking dirt patch on the ground.
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
Watch the dialogue
|tip You will be attacked by an elemental shortly.
Unearth the Second Find |q 77267/5 |goto 61.32,30.47
step
use the Archivist's Fire Totem##210956
|tip Use it next to the smoking dirt patch on the ground.
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
Watch the dialogue
Unearth the Third Find |q 77267/6 |goto 61.34,30.22
step
talk Roska Rocktooth##208614
turnin Excavation 101##77267 |goto 61.39,30.22
accept Your First Find##78762 |goto 61.39,30.22
step
use the Archivist's Fire Totem##210956
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
Use the Fire Totem to Increase Heat |q 78762/1 |goto 61.34,30.22
step
Step Through Spontaneous Puddles to Lower Heat |q 78762/2 |goto 61.34,30.22
|tip Run through the swirling water patches to lower the heat and move the bar toward water.
step
use the Archivist's Fire Totem##210956
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
|tip Alternate between this and stepping in water puddles to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards heat or water.
click Outdated Geology Textbook
|tip While the indicator is in the colored area, click the textbook to fill the progress bar.
Fully Excavate the Find |q 78762/3 |goto 61.34,30.21
step
talk Roska Rocktooth##208614
turnin Your First Find##78762 |goto 61.38,30.23
accept Hands-On Experience##77268 |goto 61.38,30.23
step
use the Archivist's Fire Totem##210956
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
Unearth the Major Find |q 77268/1 |goto 61.50,30.04
step
use the Archivist's Fire Totem##210956
clicknpc Roska's Fire Totem##208853
|tip It appears after using the totem.
|tip Alternate between this and stepping in water puddles to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards heat or water.
click Scholar's Chest
|tip While the indicator is in the colored area, click the textbook to fill the progress bar.
Excavate the Scholar's Chest |q 77268/2 |goto 61.50,30.04
step
talk Roska Rocktooth##208614
turnin Hands-On Experience##77268 |goto 61.58,30.02
accept Excavation: Riverbed##77433 |goto 61.58,30.02
step
talk Zenata##204835
turnin Technoscrying: Observatory##77434 |goto The Waking Shores/0 56.38,43.95
accept Attune to the Observer##75729 |goto 56.38,43.95
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Weathered Staff
|tip Inside the building.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 75729/1 |goto 56.00,45.40 |count 33
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Tattered Hood
|tip Inside the building.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 75729/1 |goto 57.85,44.55 |count 66
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Cracked Epaulet
|tip Inside the building.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 75729/1 |goto 56.83,41.91
step
talk Zenata##204835
turnin Attune to the Observer##75729 |goto 56.38,43.95
accept A Link to the Past##75867 |goto 56.38,43.95
step
Reach the Nexus Point |q 75867/1 |goto 56.35,43.68
step
use the Technoscryers##202247
Put On the Goggles |q 75867/2 |goto 56.35,43.68
step
use the Technoscryers##202247
|tip Use the "Observation Mode" ability in the second slot on your action bar.
Activate Observation Mode |q 75867/3 |goto 56.35,43.68
step
Watch the dialogue
Observe the Temporal Scene |q 75867/4 |goto 56.36,43.69
step
talk Zenata##204835
turnin A Link to the Past##75867 |goto 56.37,43.95
accept A Window into the Future##75868 |goto 56.37,43.95
step
click Dreadsquall Nest##404849+
|tip They look like giant bird nests in high locations around this area.
kill Agitated Dreadsquall##208141+
|tip They will sometimes attack you after investigating a nest.
|tip Loot them and the nests until you find the lens.
Search Dreadsquall Nests for the Lens |q 75868/1 |goto 55.32,44.35
You can find more around:
[57.86,44.39]
[56.30,46.25]
[56.37,45.47]
[55.59,45.38]
[55.54,46.31]
[56.82,48.08]
step
talk Zenata##204835
turnin A Window into the Future##75868 |goto 56.38,43.95
step
talk Roska Rocktooth##204094
turnin Excavation: Riverbed##77433 |goto Ohn'ahran Plains/0 67.34,47.55
accept Surveying the Riverbed##75493 |goto 67.34,47.55
step
talk Roska Rocktooth##204094
Tell her _"I'm ready to start digging!"_
Watch the dialogue
Tell Roska to Start the Dig |q 75493/1 |goto 67.34,47.55
step
use the Archivist's Water Totem##210435
clicknpc Roska's Water Totem##204704
|tip It appears after using the totem.
|tip Alternate between this and clicking Sturdy Earth to keep the indicator in the colored section of the bar.
click Sturdy Earth
|tip They look like piles of dirt on the ground around this area.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards earth or water.
|tip While the indicator is in the colored area, click the textbook to fill the progress bar.
Unearth the Find |q 75493/2 |goto 66.20,47.98 |count 1
step
use the Archivist's Water Totem##210435
clicknpc Roska's Water Totem##204704
|tip It appears after using the totem.
|tip Alternate between this and clicking Sturdy Earth to keep the indicator in the colored section of the bar.
click Sturdy Earth
|tip They look like piles of dirt on the ground around this area.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards earth or water.
|tip While the indicator is in the colored area, click the relic to fill the progress bar.
Unearth the Find |q 75493/2 |goto 64.91,48.22 |count 2
step
use the Archivist's Water Totem##210435
clicknpc Roska's Water Totem##204704
|tip It appears after using the totem.
Watch the dialogue
Unearth the Major Find |q 75493/3 |goto 66.46,46.17
step
talk Ancient Centaur Corpse##204245
accept The Body on the Banks##75518 |goto 66.45,46.23
step
talk Roska Rocktooth##204094
Tell her _"Let's start excavating!"_
Tell Roska to Start the Dig |q 75518/1 |goto 66.40,46.00
step
use the Archivist's Water Totem##210435
clicknpc Roska's Water Totem##204704
|tip It appears after using the totem.
|tip Alternate between this and clicking Sturdy Earth to keep the indicator in the colored section of the bar.
click Sturdy Earth
|tip They look like piles of dirt on the ground around this area.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards earth or water.
clicknpc Ancient Centaur Corpse##204245
|tip While the indicator is in the colored area, click the corpse to fill the progress bar.
Excavate the Body |q 75518/2 |goto 66.47,46.22
step
talk Roska Rocktooth##204094
turnin Surveying the Riverbed##75493 |goto 66.40,46.00
turnin The Body on the Banks##75518 |goto 66.40,46.00
accept Do Rites by Her##75603 |goto 66.40,46.00
step
talk Farrier Rondare##195547
Select _"<Share your archaeological finds.>"_
Inform Farrier Rondare |q 75603/2 |goto 62.54,42.47
step
talk Storykeeper Jaru##195888
Select _"<Share your archaeological finds.>"_
Inform Storykeeper Jaru |q 75603/1 |goto 60.97,39.18
step
talk Tigari Khan##187092
|tip Inside the building.
Select _"<Share your archaeological finds.>"_
Inform Tigari Khan |q 75603/3 |goto 62.96,33.61
step
talk Tigari Khan##204383
Tell her _"Let's finally put her to rest."_
Meet Tigari Khan at the Riverbed Site |q 75603/4 |goto 66.57,45.96
step
talk Roska Rocktooth##204643
turnin Do Rites by Her##75603 |goto 66.39,46.00
accept Nirobin and the Office##77327 |goto 66.39,46.00
step
talk Nirobin##205967
|tip Inside the building.
turnin Nirobin and the Office##77327 |goto Thaldraszus/0 58.48,36.75
accept Living History##76217 |goto 58.48,36.75
step
click Hourglass of Time
|tip Inside the building.
Analyze the Relic's Time Era |q 76217/1 |goto 58.52,36.75
step
click Compass of Placement
|tip Inside the building.
Analyze Relic's Origin |q 76217/2 |goto 58.55,36.76
step
click Specimens of Inspiration
|tip Inside the building.
Analyze Relic's Context |q 76217/3 |goto 58.57,36.79
step
click Intriguing Dracthyr Goblet
|tip Inside the building.
Analyze the Relic |q 76217/4 |goto 58.52,36.81
step
talk Nirobin##205967
|tip Inside the building.
turnin Living History##76217 |goto 58.48,36.75
accept Lab Partners with a Squirrel##76241 |goto 58.48,36.75
step
talk Reese##205975
turnin Lab Partners with a Squirrel##76241 |goto The Forbidden Reach/5 53.66,47.56
accept A Research Thesis Worth Publishing##76242 |goto 53.66,47.56
step
Watch the dialogue
Watch Reese Activate Clues |q 76242/1 |goto 53.66,47.56
step
extraaction Gain Clue##412948
|tip Search around for groups of purple and blue ghostly animals and stand in the middle of them.
|tip Use the button that appears on the screen to collect the information from them.
clicknpc Juicy Clue##206895+
|tip They look like a white and blue animals running around this area.
Collect Information |q 76242/2 |goto 54.98,42.32
step
Return to Nirobin's Office |q 76242/3 |goto Thaldraszus/0 58.48,36.76
|tip Inside the building.
step
extraaction Transmute Information##417012
|tip Inside the building.
|tip Stand with Reese and use the ability that appears on the screen.
Transmute Reese's Information |q 76242/4 |goto 58.49,36.86
step
click Tome of Archived Isels Research
|tip Inside the building.
Read the Research Tome |q 76242/5 |goto 58.47,36.73
step
talk Nirobin##205967
|tip Inside the building.
turnin A Research Thesis Worth Publishing##76242 |goto 58.48,36.76
accept Back to Headquarters!##77328 |goto 58.48,36.76
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin Back to Headquarters!##77328 |goto 61.57,31.32
accept Finally, An Archivist!##79223 |goto 61.57,31.32
step
talk Provisioner Aristta##209192
|tip Inside the base of the tower on the floating island.
buy 1 Archivist's Buckled Cap##208451 |q 79223/1 |goto 61.37,31.40
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin Finally, An Archivist!##79223 |goto 61.57,31.32
step
talk Zenata##208355
|tip Inside the base of the tower on the floating island.
accept Technoscrying: Dragonskull Island##77483 |goto 61.62,31.12
accept Technoscrying: Igira's Watch##77484 |goto 61.62,31.12
step
talk Roska Rocktooth##208614
|tip Inside the base of the tower on the floating island.
accept Excavation: Gaze of Neltharion##77486 |goto 61.60,31.08
accept Excavation: Winglord's Perch##77487 |goto 61.60,31.08
step
talk Zenata##207311
turnin Technoscrying: Dragonskull Island##77483 |goto The Forbidden Reach/5 77.14,38.37
accept The Fate of Scalecommander Abereth##76448 |goto 77.14,38.37
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Drakonid Blade
|tip Inside the cave.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relics |q 76448/1 |goto Dragonskull Island/0 70.56,71.32 |count 33
step
Enter the side cave |goto 54.73,19.80 < 10 |walk
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Pitted Blade
|tip Inside the cave.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relics |q 76448/1 |goto 69.42,22.47 |count 66
step
Enter the side cave |goto 33.29,36.23 < 10 |walk
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Drakonid Spyglass
|tip Inside the cave.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relics |q 76448/1 |goto 29.39,29.81
step
talk Zenata##207311
turnin The Fate of Scalecommander Abereth##76448 |goto The Forbidden Reach/5 77.14,38.37
accept Without Honor##76557 |goto 77.14,38.37
step
Reach the Nexus Point |q 76557/1 |goto 76.92,38.59
step
use the Technoscryers##202247
Put On the Goggles |q 76557/2 |goto 76.92,38.59
step
Activate Observation Mode |q 76557/3 |goto 76.92,38.59
|tip Use the "Observation Mode" ability in the second slot on your action bar.
step
Watch the dialogue
Observe the Temporal Scene |q 76557/4 |goto 76.92,38.59
step
talk Zenata##207311
turnin Without Honor##76557 |goto 77.14,38.37
accept The Hidden Hand##77415 |goto 77.14,38.37
step
click Drakonid Scroll Case##405944
|tip Inside and outside the cave near piles of treasure.
|tip They appear on your minimap as yellow dots.
|tip You can run the elites out of the cave to despawn them for a short period of time.
Recover the Neltharion Agent Instructions |q 77415/1 |goto 67.78,45.09
step
talk Zenata##207311
turnin The Hidden Hand##77415 |goto 77.14,38.37
step
talk Roska Rocktooth##208362
turnin Excavation: Winglord's Perch##77487 |goto 17.19,16.29
accept Surveying the Cliffside##77100 |goto 17.19,16.29
step
talk Roska Rocktooth##208362
Tell her _"I'm ready to start digging!"_
Tell Roska to Start the Dig |q 77100/1 |goto 17.19,16.29
step
use the Archivist's Wind Totem##210778
|tip Use it near rumbling earth areas around this area.
|tip They appear on your minimap as yellow dots.
clicknpc Roska's Wind Totem##208951
|tip It appears after using the totem.
|tip Alternate between this and stepping in water spouts to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards air or water.
click Rustic Dragonkin Pottery
|tip While the indicator is in the colored area, click the relic to fill the progress bar.
Unearth #2# Finds |q 77100/2 |goto 16.39,14.98
step
use the Archivist's Wind Totem##210778
clicknpc Roska's Wind Totem##208951
|tip It appears after using the totem.
Watch the dialogue
Unearth the Major Find |q 77100/3 |goto 14.06,14.69
step
click Intact Dragonkin Cache
accept The Cache in the Crag##77151 |goto 14.07,14.67
step
talk Roska Rocktooth##208398
|tip She parachutes to this location.
Tell her _"Let's start excavating!"_
Speak to Ruska to Start the Excavation |q 77151/1 |goto 14.19,14.96
step
use the Archivist's Wind Totem##210778
clicknpc Roska's Wind Totem##208951
|tip It appears after using the totem.
click Salty Waterspout
|tip Alternate between this and stepping in water spouts to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards air or water.
click Intact Dragonkin Cache
|tip While the indicator is in the colored area, click the relic to fill the progress bar.
Excavate the Cache |q 77151/2 |goto 14.07,14.66
step
talk Roska Rocktooth##208398
turnin Surveying the Cliffside##77100 |goto 14.19,14.95
turnin The Cache in the Crag##77151 |goto 14.19,14.95
accept A Taste of the Past##77154 |goto 14.19,14.95
step
talk Atrenosh Hailstone##200010
Select _"<Share your archaeological finds.>"_
Inform Atrenosh Hailstone |q 77154/1 |goto 34.65,57.56
step
click Intact Dragonkin Cache
Open the Intact Dragonkin Cache |q 77154/2 |goto 17.28,16.41
step
talk Roska Rocktooth##208362
turnin A Taste of the Past##77154 |goto 17.19,16.28
step
talk Roska Rocktooth##205413
turnin Excavation: Gaze of Neltharion##77486 |goto Zaralek Cavern/0 48.69,48.36
accept Surveying the Tower##76026 |goto 48.69,48.36
step
talk Roska Rocktooth##205413
Tell her _"I'm ready to start digging!"_
Tell Roska to Start the Dig |q 76026/1 |goto 48.69,48.36
step
use Archivist's Earth Totem##210834
|tip Use it near rumbling earth areas around this area.
|tip They appear on your minimap as yellow dots.
clicknpc Roska's Earth Totem##208059
|tip It appears after using the totem.
|tip Alternate between this and stepping on small lava oozes to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards fire or earth.
click Antique Niffen Salvage
|tip While the indicator is in the colored area, click the relic to fill the progress bar.
Unearth #2# Finds |q 76026/2 |goto 47.66,47.41
step
use Archivist's Earth Totem##210834
clicknpc Roska's Earth Totem##208059
|tip It appears after using the totem.
Watch the dialogue
Unearth the Major Find |q 76026/3 |goto 47.56,48.57
step
click Defaced Dragon Statue
accept Hidden in the Midden##76032 |goto 47.55,48.58
step
talk Roska Rocktooth##208055
|tip She eventually parachutes to this location.
Tell her _"Let's start excavating!"_
Speak to Roska to Start the Excavation |q 76032/1 |goto 47.66,48.64
step
use Archivist's Earth Totem##210834
clicknpc Roska's Earth Totem##208059
|tip It appears after using the totem.
|tip Alternate between this and stepping on small lava oozes to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards fire or earth.
click Defaced Dragon Statue
|tip While the indicator is in the colored area, click the statue to fill the progress bar.
Unearth the Find |q 76032/2 |goto 47.55,48.58
step
talk Roska Rocktooth##208055
turnin Surveying the Tower##76026 |goto 47.66,48.64
turnin Hidden in the Midden##76032 |goto 47.66,48.64
accept Antiquated Antics##75604 |goto 47.66,48.64
step
talk Kiln-Singer Malraka##204215
Select _"<Share your archaeological finds.>"_
Inform Kiln-Singer Malraka |q 75604/2 |goto 57.80,54.35
step
talk Archivist Edress##215736
Select _"<Share your archaeological finds.>"_
Inform Archivist Edress |q 75604/1 |goto 52.68,26.35
step
talk Roska Rocktooth##208055
turnin Antiquated Antics##75604 |goto 47.66,48.65
step
Enter the cave |goto 38.57,50.28 < 7 |walk
talk Zenata##207763
|tip Inside the cave.
turnin Technoscrying: Igira's Watch##77484 |goto 38.14,49.85
accept The Tools of the Dragonkillers##76564 |goto 38.14,49.85
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Dragonkiller Harpoon
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 76564/1 |goto 39.38,51.44 |count 33
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Gnawed Fish Kebab
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 76564/1 |goto 40.94,48.81 |count 66
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
click Tuskarr Scaling Knife
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Attunement Relic |q 76564/1 |goto 42.15,51.12
step
Enter the cave |goto 38.57,50.28 < 7 |walk
talk Zenata##207763
|tip Inside the cave.
turnin The Tools of the Dragonkillers##76564 |goto 38.14,49.85
accept An Unlikely Proposal##76576 |goto 38.14,49.85
step
Reach the Nexus Point |q 76576/1 |goto 38.25,49.75
|tip Inside the cave.
step
use the Technoscryers##202247
|tip Inside the cave.
Put on the Goggles |q 76576/2 |goto 38.25,49.75
step
use the Technoscryers##202247
|tip Inside the cave.
|tip Use the "Observation Mode" ability in the second slot on your action bar.
Activate Observation Mode |q 76576/3 |goto 38.25,49.75
step
Watch the dialogue
|tip Inside the cave.
Observe the Temporal Scene |q 76576/4 |goto 38.25,49.75
step
talk Zenata##207763
|tip Inside the cave.
turnin An Unlikely Proposal##76576 |goto 38.14,49.86
accept The Scale of it All##77425 |goto 38.14,49.86
step
click Ancient Zaqali Trade-bond Tablet##405996
Recover the Trade-Bonded Tablet |q 77425/1 |goto 42.08,34.88
step
Enter the cave |goto 38.57,50.28 < 7 |walk
talk Zenata##207763
|tip Inside the cave.
turnin The Scale of it All##77425 |goto 38.14,49.85
accept Back to Headquarters! Again!##79231 |goto 38.14,49.85
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin Back to Headquarters! Again!##79231 |goto Thaldraszus/0 61.53,31.29
accept Graduation Day##77331 |goto 61.53,31.29
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
Tell him _"Thank you."_
Speak with Eadweard |q 77331/5 |goto 61.53,31.29
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin Graduation Day##77331 |goto 61.53,31.29
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\The Big Dig: Traitor's Rest",{
author="support@zygorguides.com",
description="This guide will help you complete the Azerothian Archives big dig in Traitor's Rest.",
startlevel=70,
patch='100205',
areapoiid=7657,
areapoitype="BigDig",
},[[
step
label "Begin_Scenario"
talk Eadweard Dalyngrigge##209134
accept The Big Dig: Traitor's Rest##79226 |goto The Azure Span/0 26.96,46.46
step
Wait for the Scenario to Begin |complete areapoi(2024,7657) and inscenario() |goto The Azure Span/0 26.96,46.46
|tip The scenario starts every hour on the half hour. |only if not inscenario()
|tip Steps that have progress bars are currently bugged and may complete early. |only if not inscenario()
|tip This scenario has been heavily bugged. |only if not inscenario()
step
Stand Near Eadweard for Instructions |scenariogoal 1/60758 |goto Traitor's Rest/0 55.33,51.34
|only if scenariostage(1)
step
click Wild Restweed+
|tip They look like small plants on the ground around this area.
Clear #6# Restweed |scenariogoal 2/60772 |goto 58.21,46.77
|only if scenariostage(2)
step
click Wild Traitor's Bramble+
|tip They look like large red bushes around the bones.
Clear #5# Traitor's Bramble |scenariogoal 3/65236 |goto Traitor's Rest/0 53.85,49.04
|only if scenariostage(3)
step
click Wild Restweed+
|tip They look like small plants on the ground around this area.
Clear #6# Restweed |scenariogoal 4/65237 |goto 51.93,45.29
|only if scenariostage(4)
step
click Wild Boneclover+
|tip They look like small plants on the ground around this area.
Clear #5# Boneclover |scenariogoal 5/65239 |goto 56.37,49.07
|only if scenariostage(5)
step
click Wild Boneclover+
|tip They look like small plants on the ground around this area.
Clear #6# Boneclover |scenariogoal 6/65238 |goto 50.99,47.79
|only if scenariostage(6)
step
click Traitor's Bramble+
|tip They look like bushy plants on the ground around this area.
Clear #7# Traitor's Bramble |scenariogoal 7/65240 |goto 51.09,51.19
|only if scenariostage(7)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(8)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(9)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(10)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(11)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
Uncover and Analyze Hidden Runes Around the Site |scenariogoal 12/0 |goto 54.43,49.91
|only if scenariostage(12)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
Uncover and Analyze Hidden Runes Around the Site |scenariogoal 13/0 |goto 53.93,50.06
|only if scenariostage(13)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
Uncover and Analyze Hidden Runes Around the Site |scenariogoal 14/0 |goto 54.54,49.71
|only if scenariostage(14)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
|tip Relics look like small sparkling patches on the ground.
Uncover and Analyze Ancient Relics Around the Site |scenariogoal 15/0 |goto 52.36,49.04
|only if scenariostage(15)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
|tip Relics look like small sparkling patches on the ground.
Uncover and Analyze Ancient Relics Around the Site |scenariogoal 16/0 |goto 52.36,49.04
|only if scenariostage(16)
step
extraaction Analysis##398015
|tip Run to yellow dots on the minimap and use the button that appears on the screen.
|tip Relics look like small sparkling patches on the ground.
Uncover and Analyze Ancient Relics Around the Site |scenariogoal 17/0 |goto 52.98,50.15
|only if scenariostage(17)
step
extraaction Roska's Fire Totem##427611
|tip Use the button on the screen to summon Roska's Fire Totem.
clicknpc Roska's Fire Totem##208853
|tip Click the fire totem to excavate smoky rumbling areas of earth on the ground around this area.
|tip They appear on your minimap as yellow dots.
Survey Disturbed Earth |scenariogoal 18/0 |goto 53.80,46.86
|only if scenariostage(18)
step
extraaction Roska's Fire Totem##427611
|tip Use the button on the screen to summon Roska's Fire Totem.
clicknpc Roska's Fire Totem##208853
|tip Click the fire totem to start it channeling on the rubble.
click Warped Dragon Bone
|tip While the elemental is channeling, excavate the bone.
Excavate Dragon Bones |scenariogoal 19/0 |goto 52.29,45.83
|only if scenariostage(19)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(20)
step
click Promising Rock+
|tip They look like half-buried rocks.
Inspect Stones Around the Site for Achaelogical Value |scenariogoal 21/0 |goto 50.92,47.75
|only if scenariostage(21)
step
click Promising Rock+
|tip They look like half-buried rocks.
Inspect Stones Around the Site for Achaelogical Value |scenariogoal 22/0 |goto 53.02,53.39
|only if scenariostage(22)
step
click Promising Rock+
|tip They look like half-buried rocks.
Inspect Stones Around the Site for Achaelogical Value |scenariogoal 23/0 |goto 54.83,42.01
|only if scenariostage(23)
step
click Promising Rock+
|tip They look like half-buried rocks.
Inspect Stones Around the Site for Achaelogical Value |scenariogoal 24/0 |goto 59.45,47.34
|only if scenariostage(24)
step
click Pile of Unsorted Rocks
|tip Run them to the nearby highlighted flag each time you click the pile.
Sort Significant Stones |scenariogoal 25/0 |goto 52.40,45.92
|only if scenariostage(25)
step
click Pile of Unsorted Rocks
|tip Run them to the nearby highlighted flag each time you click the pile.
Sort Significant Stones |scenariogoal 26/0 |goto 57.62,53.73
|only if scenariostage(26)
step
click Pile of Unsorted Rocks
|tip Run them to the nearby highlighted flag each time you click the pile.
Sort Significant Stones |scenariogoal 27/0 |goto 48.52,48.75
|only if scenariostage(27)
step
click Broken Shovel+
Repair #3# Shovels |scenariogoal 28/61195 |goto Traitor's Rest/0 53.09,47.25
|only if scenariostage(28)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(29)
step
clicknpc Clue-Compiling Familiar##209451
|tip It appears on your minimap as a yellow dot.
|tip Stand still while channeling.
Release the Otters! |scenariogoal 30/0 |goto 51.86,50.59
|only if scenariostage(30)
step
kill Information-Stuffed Clue##210079 |scenariogoal 31/64388 |goto 52.38,53.25
|tip It walks all over this area.
|only if scenariostage(31)
step
kill Clue Morsel##210080
Morsel Clues |scenariogoal 31/61900 |goto 54.77,46.68
|only if scenariostage(31)
step
click Azerothian Tome+
|tip They look like books scattered all over the ground.
Return Scattered Tomes |scenariogoal 32/0 |goto 52.35,51.84
|only if scenariostage(32)
step
click Pot of Azer-Broth
Pick up Azer-Broth |scenariogoal 33/61288 |goto 55.82,51.83
|only if scenariostage(33)
step
extraaction Deliver That Lunch!##420139
|tip It appears on the screen when you are near hungry workers.
Feed #3# Hungry Archivists |scenariogoal 33/61287 |goto 58.11,50.92
|only if scenariostage(33)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(34)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(35)
step
Click objects around this area
|tip Click the four objects to set up the dig.
Set up a Satellite Dig |scenariogoal 36/0 |goto Traitor's Rest/0 47.65,45.10
|only if scenariostage(36)
step
extraaction Gain Clue##421550
|tip Use the ability that appears on the screen near clue spots.
|tip They look like small blue creatures running around this area.
|tip They appear on your minimap as yellow dots.
|tip You may need to dismount to get the button to appear.
Discover #3# Clue spots |scenariogoal 37/61898 |goto 53.09,47.70
|only if scenariostage(37)
step
clicknpc Juicy Clue##210076+
|tip They look like small blue creatures running around this area.
|tip They appear on your minimap as yellow dots.
Discover the First Juicy Clue |scenariogoal 38/61899 |goto 26.82,46.75 |count 1
|only if scenariostage(38)
step
clicknpc Juicy Clue##210076+
|tip They look like small blue creatures running around this area.
|tip They appear on your minimap as yellow dots.
Discover the Second Juicy Clue |scenariogoal 38/61899 |goto 26.50,45.79 |count 2
|only if scenariostage(38)
step
clicknpc Juicy Clue##210076+
|tip They look like small blue creatures running around this area.
|tip They appear on your minimap as yellow dots.
Discover the Third Juicy Clue |scenariogoal 38/61899 |goto 25.74,46.72 |count 3
|only if scenariostage(38)
step
click Crate of Crchaeologist Hats
|tip They look like large brown crates around the bones.
clicknpc Sun-baked Archeologist##210146+
|tip They look like dizzy NPCs in beams of light.
|tip Use the Hat Toss ability on screen while targeting them.
|tip Return to a crate for another hat after each NPC.
extraaction Hat Toss##421669
Throw Hats at Archivists |scenariogoal 39/0 |goto 53.23,49.56
|only if scenariostage(39)
step
click Crate of Archivist Hats
|tip Click the wooden crate to pick up a hat for each elemental.
|tip Return to the crate after using it to get another.
extraaction Recruit an Elemental##422145
|tip Use the ability on the screen to toss a hat on the targeted elemental.
clicknpc Eager Elemental##210408
Recruit Eager Elementals |scenariogoal 40/0 |goto 52.48,45.42
|only if scenariostage(40)
step
talk Eadweard Dalyngrigge##209134
Ask him _"Do you have that thing Zenata needed?"_
Retrieve Supplies for Zenata's Study |havebuff Artifact Delivery for Zenata!##428891 |goto 55.33,51.36
|only if scenariostage(41)
step
Resupply Zenata's Study |scenariogoal 41/64341 |goto 56.40,45.73
|only if scenariostage(41)
step
talk Eadweard Dalyngrigge##209134
Ask him _"Do you have that thing Roksa needed?"_
Retrieve Supplies for Roska |havebuff Artifact Delivery for Roska!##429291 |goto 55.33,51.36
|only if scenariostage(42)
step
Deliver Supplies to Roska! |scenariogoal 42/0 |goto 53.26,46.68
|only if scenariostage(42)
step
talk Eadweard Dalyngrigge##209134
Ask him _"Do you have that thing Nirobin needed?"_
Retrieve Supplies for Nirobin |havebuff Artifact Delivery for Nirobin!##429293 |goto 55.33,51.35
|only if scenariostage(43)
step
Deliver a Crate of Artifacts to Nirobin to Study |scenariogoal 43/64412 |goto 51.59,51.80
|only if scenariostage(43)
step
click Archivist's Bone Brush+
|tip They look like tiny brushes moving on the big bones.
Brush the Bones |scenariogoal 44/0 |goto 55.46,50.35
|only if scenariostage(44)
step
Stomp Book Beetles |scenariogoal 45/0 |goto 55.23,50.73
|tip Walk over the beetles around the camp.
|only if scenariostage(45)
step
talk Roska Rocktooth##209133
Ask her _"Do you have that thing Eadweard needed?"_
Speak to Roska to Get shovels |havebuff Shovels for Eadweard!##430028 |goto 53.27,46.72
|only if scenariostage(46)
step
Deliver Shovels to Eadweard |scenariogoal 46/64615 |goto 55.33,51.35
|only if scenariostage(46)
step
talk Zenata##209132
Ask her _"Do you have that thing Eadweard needed?"_
Talk to Zenata to Get runes |havebuff Runes for Eadweard!##430344 |goto 56.32,46.08
|only if scenariostage(47)
step
Deliver them to Eadweard |scenariogoal 47/64614 |goto 55.32,51.38
|only if scenariostage(47)
step
talk Nirobin##209135
Ask him _"Do you have that thing Eadweard needed?"_
Talk to Nirobin to Get Books |havebuff Books for Eadweard!##430033 |goto 51.60,51.77
|only if scenariostage(48)
step
Deliver the Books |scenariogoal 48/64616 |goto 55.33,51.34
|only if scenariostage(48)
step
Scenario Stage Coming Soon! |confirm
|only if scenariostage(49)
step
Stand by Eadweard for Instructions |scenariogoal 50/64424 |goto 55.33,51.34
|only if scenariostage(50)
step
kill Doomshadow##208029 |scenariogoal 51/63299 |goto 59.69,49.72
|tip Move out of areas targeted on the ground.
|only if scenariostage(51)
step
Wait for a New Scenario Stage |complete areapoi(2024,7657) and inscenario() |goto 55.33,51.36 |next "Begin_Scenario" |notravel
|only if inscenario()
step
talk Eadweard Dalyngrigge##209134
turnin The Big Dig: Traitor's Rest##79226 |goto The Azure Span/0 26.96,46.46
|only if readyq(79226)
step
talk Eadweard Dalyngrigge##206107
|tip Inside the base of the tower on the floating island.
turnin Curious Find: Hole-Punched Bakar Tooth##77766 |goto Thaldraszus/0 61.53,31.29 |only if haveq(77766)
turnin Curious Find: Dragonhorn Flute##77760 |goto 61.53,31.29 |only if haveq(77760)
turnin Curious Find: Waterlogged Ledger##77763 |goto 61.53,31.29 |only if haveq(77763)
|only if haveq(77766,77760,77763)
step
Wait for the Dig to Begin |complete areapoi(2024,7657) and inscenario() |goto The Azure Span/0 26.96,46.46 |next "Begin_Scenario"
|tip The scenario starts every hour on the half hour.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (Thaldraszus)",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dreamsurge in Thaldraszus.",
startlevel=70,
patch='100107',
areapoiid=7588,
areapoitype="Dreamsurge",
},[[
step
talk Archdruid Hamuul Runetotem##211031
accept Surging Dreams##77423 |goto Valdrakken/0 50.64,57.48
step
talk Gearweaver##208649
turnin Surging Dreams##77423 |goto Thaldraszus/0 51.21,43.34
accept Shaping the Dreamsurge##77251 |goto 51.21,43.34
accept Dreamsurge Investigation##77414 |goto 51.21,43.34 |only if not completedq(77414)
stickystart "Collect_Dreamsurge_Coalescence"
stickystart "Slay_a_Rare_Elite"
step
Complete #3# World Quests in the Dreamsurge |q 77414/1
|tip Click world quest icons on the map to load their guides and complete them.
|only if not completedq(77414)
step
label "Slay_a_Rare_Elite"
Slay a Rare elite Empowered by the Dreamsurge |q 77414/2
|tip Click a rare elite icon on the map to load its guide.
|tip Rare elite enemies might not always be active.
|only if not completedq(77414)
step
Wait for a Dreamsurge to Begin |complete vignette(5751)
|tip Dreamsurges start every half hour.
step
Join the Fight |scenariostart |goto 60.78,23.55
step
Kill enemies around this area
|tip You can also fly through birds in the air on your mount.
click Burning Root+
|tip They look like flame-topped roots growing out of the ground around this area.
Fight Back Against the Druids of the Flame Incursion |scenariogoal 1/0 |goto 60.78,23.55
|only if not completedq(77414)
step
Defeat the Dreamsurge Champion |scenariostage 2 |goto 61.84,26.37
|tip This enemy is elite and will require a group.
|only if not completedq(77414)
step
Close a Waking Dream Portal |q 77414/3
|tip Loot the corpse of the Allied Cinderrager.
|only if not completedq(77414)
step
label "Collect_Dreamsurge_Coalescence"
click Dreaming Growth+
|tip They look like large green and purple plants growing all over the zone.
|tip You can also fly through green orbs scattered all over the zone.
|tip Enemies also drop Coalescence.
Collect #100# Dreamsurge Coalescence |q 77251/1
step
talk Naralex##207962
Vote for a Dreamsurge Effect |q 77414/4 |goto 51.19,43.39
|only if not completedq(77414)
step
talk Gearweaver##208649
turnin Shaping the Dreamsurge##77251 |goto Thaldraszus/0 51.21,43.34
turnin Dreamsurge Investigation##77414 |goto 51.21,43.34 |only if not completedq(77414)
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (The Waking Shores)",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dreamsurge in The Waking Shores.",
startlevel=70,
patch='100107',
areapoiid=7587,
areapoitype="Dreamsurge",
},[[
step
talk Archdruid Hamuul Runetotem##211031
accept Surging Dreams##77423 |goto Valdrakken/0 50.64,57.48
step
talk Archdruid Hamuul Runetotem##208649
turnin Surging Dreams##77423 |goto The Waking Shores/0 58.39,67.74
accept Shaping the Dreamsurge##77251 |goto The Waking Shores/0 58.39,67.74
accept Dreamsurge Investigation##77414 |goto 58.39,67.74 |only if not completedq(77414)
stickystart "Collect_Dreamsurge_Coalescence"
stickystart "Slay_a_Rare_Elite"
step
Complete #3# World Quests in the Dreamsurge |q 77414/1 |goto 51.11,42.66
|tip Click world quest icons on the map to load their guides and complete them.
|only if not completedq(77414)
step
label "Slay_a_Rare_Elite"
Slay a Rare Elite Empowered By the Dreamsurge |q 77414/2 |goto 51.11,42.66
|tip Click a rare elite icon on the map to load its guide.
|tip Rare elite enemies might not always be active.
|only if not completedq(77414)
step
Wait for a Dreamsurge to Begin |complete vignette(5751)
|tip Dreamsurges start every half hour.
step
Join the Fight |scenariostart |goto 41.14,76.74
step
Kill enemies around this area
|tip You can also fly through birds in the air on your mount.
click Burning Root+
|tip They look like flame-topped roots growing out of the ground around this area.
Fight Back Against the Druids of the Flame Incursion |scenariogoal 1/0 |goto 41.14,76.74
|only if not completedq(77414)
step
Defeat the Dreamsurge Champion |scenariostage 2 |goto 41.18,77.46
|tip This enemy is elite and will require a group.
|only if not completedq(77414)
step
Close a Waking Dream Portal |q 77414/3
|tip Loot the corpse of the Molten General.
|only if not completedq(77414)
step
label "Collect_Dreamsurge_Coalescence"
click Dreaming Growth+
|tip They look like large green and purple plants growing all over the zone.
|tip You can also fly through green orbs scattered all over the zone.
|tip Enemies also drop Coalescence.
Collect #100# Dreamsurge Coalescence |q 77251/1
step
talk Naralex##207962
Vote for a Dreamsurge Effect |q 77414/4 |goto 58.43,67.79
|only if not completedq(77414)
step
talk Archdruid Hamuul Runetotem##208649
turnin Shaping the Dreamsurge##77251 |goto 58.39,67.74
turnin Dreamsurge Investigation##77414 |goto 58.39,67.74 |only if not completedq(77414)
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (Ohn'ahran Plains)",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dreamsurge in Ohn'ahran Plains.",
startlevel=70,
patch='100107',
areapoiid=7586,
areapoitype="Dreamsurge",
},[[
step
talk Archdruid Hamuul Runetotem##211031
accept Surging Dreams##77423 |goto Valdrakken/0 50.64,57.48
step
talk Archdruid Hamuul Runetotem##208649
turnin Surging Dreams##77423 |goto Ohn'ahran Plains/0 64.11,41.73
accept Shaping the Dreamsurge##77251 |goto 64.11,41.73
accept Dreamsurge Investigation##77414 |goto 64.11,41.73 |only if not completedq(77414)
stickystart "Collect_Dreamsurge_Coalescence"
stickystart "Slay_a_Rare_Elite"
step
Complete #3# World Quests in the Dreamsurge |q 77414/1
|tip Click world quest icons on the map to load their guides and complete them.
|only if not completedq(77414)
step
label "Slay_a_Rare_Elite"
Slay a Rare Elite Empowered By the Dreamsurge |q 77414/2
|tip Click a rare elite icon on the map to load its guide.
|tip Rare elite enemies might not always be active.
|only if not completedq(77414)
step
Wait for a Dreamsurge to Begin |complete vignette(5751)
|tip Dreamsurges start every half hour.
step
Kill enemies around this area
|tip You can also fly through birds in the air on your mount.
click Burning Root+
|tip They look like flame-topped roots growing out of the ground around this area.
Fight Back Against the Druids of the Flame Incursion |scenariogoal 1/0 |goto 25.18,60.95
|only if not completedq(77414)
step
Defeat the Dreamsurge Champion |scenariostage 2 |goto 24.29,60.98
|tip This enemy is elite and will require a group.
|only if not completedq(77414)
step
Close a Waking Dream Portal |q 77414/3
|tip Loot the corpse of the Planesborn Annihilator.
|only if not completedq(77414)
step
label "Collect_Dreamsurge_Coalescence"
click Dreaming Growth+
|tip They look like large green and purple plants growing all over the zone.
|tip You can also fly through green orbs scattered all over the zone.
|tip Enemies also drop Coalescence.
Collect #100# Dreamsurge Coalescence |q 77251/1
step
talk Naralex##207962
Vote for a Dreamsurge Effect |q 77414/4
|only if not completedq(77414)
step
talk Archdruid Hamuul Runetotem##208649
turnin Shaping the Dreamsurge##77251 |goto 64.11,41.73
turnin Dreamsurge Investigation##77414 |goto 64.11,41.73 |only if not completedq(77414)
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (The Azure Span)",{
author="support@zygorguides.com",
description="This guide will help you complete the Emerald Dreamsurge in The Azure Span.",
startlevel=70,
patch='100107',
areapoiid=7585,
areapoitype="Dreamsurge",
},[[
step
talk Archdruid Hamuul Runetotem##211031
accept Surging Dreams##77423 |goto Valdrakken/0 50.64,57.48
step
talk Archdruid Hamuul Runetotem##208649
turnin Surging Dreams##77423 |goto The Azure Span/0 45.55,39.81
accept Shaping the Dreamsurge##77251 |goto 45.55,39.81
accept Dreamsurge Investigation##77414 |goto 45.55,39.81 |only if not completedq(77414)
stickystart "Collect_Dreamsurge_Coalescence"
stickystart "Slay_a_Rare_Elite"
step
Complete #3# World Quests in the Dreamsurge |q 77414/1
|tip Click world quest icons on the map to load their guides and complete them.
|only if not completedq(77414)
step
label "Slay_a_Rare_Elite"
Slay a Rare Elite Empowered By the Dreamsurge |q 77414/2
|tip Click a rare elite icon on the map to load its guide.
|tip Rare elite enemies might not always be active.
|only if not completedq(77414)
step
Wait for a Dreamsurge to Begin |complete vignette(5751)
|tip Dreamsurges start every half hour.
step
Kill enemies around this area
|tip You can also fly through birds in the air on your mount.
click Burning Root+
|tip They look like flame-topped roots growing out of the ground around this area.
Fight Back Against the Druids of the Flame Incursion |scenariogoal 1/0 |goto 32.68,39.72
|only if not completedq(77414)
step
Defeat the Dreamsurge Champion |scenariostage 2 |goto 32.64,39.63
|tip This enemy is elite and will require a group.
|only if not completedq(77414)
step
Close a Waking Dream Portal |q 77414/3
|tip Loot the corpse of the Planesborn Annihilator.
|only if not completedq(77414)
step
label "Collect_Dreamsurge_Coalescence"
click Dreaming Growth+
|tip They look like large green and purple plants growing all over the zone.
|tip You can also fly through green orbs scattered all over the zone.
|tip Enemies also drop Coalescence.
Collect #100# Dreamsurge Coalescence |q 77251/1
step
talk Naralex##207962
Vote for a Dreamsurge Effect |q 77414/4 |goto 45.57,39.76
|only if not completedq(77414)
step
talk Archdruid Hamuul Runetotem##208649
turnin Shaping the Dreamsurge##77251 |goto 45.55,39.81
turnin Dreamsurge Investigation##77414 |goto 45.55,39.81 |only if not completedq(77414)
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Secrets of Azeroth\\Secrets of Azeroth",{
author="support@zygorguides.com",
condition_suggested=function() return isevent("Secrets of Azeroth") end,
description="\nThis guide section will walk you through completing the quests for the Secrets of Azeroth event.",
},[[
step
talk Preservationist Kathos##206864
|tip Inside the building.
accept Preserving Rarities##77203 |goto Valdrakken/0 47.35,48.21
step
talk Preservationist Kathos##206864
Tell her _"I'm ready!"_
|tip Inside the building.
collect 1 A Mystery Box##208054 |goto 47.35,48.21 |q 77203 |future
step
use A Mystery Box##208054
collect Golden Chalice##208056 |q 77203 |future
step
click Golden Chalice
|tip Inside the building.
Select _"<Sneak the chalice into the hoard.>"_
Solve the Mystery |q 77203/1 |goto 58.87,54.15
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin Preserving Rarities##77203 |goto 47.35,48.21
step
talk Preservationist Kathos##206864
|tip Inside the building.
'|accept Rise in Relic Theft##76735 |n
collect Tuskarr Ceremonial Spear##207105 |goto 47.35,48.21 |q 76987 |future
step
talk Elder Ko'nani##26194
|tip Inside the building.
Ask it _"Someone stole this ceremonial spear from the tuskarr. Do you know where it was taken from?"_
collect Shomko's Unyielding Spear##207580 |goto Dragonblight/0 48.01,74.87 |q 76987 |future
step
click Shomko's Unyielding Spear
Select _"<Place the spear on the weapon rack.>"_
Place Shomko's Unyielding Spear |q 76987 |goto Borean Tundra/0 33.62,58.43 |future
step
talk Bobby Carlisle##207696
|tip Inside the building.
'|accept A Secretive Contact##77165 |n
collect Bobby Carlisle's Thinking Cap Notes##207802 |goto Valdrakken/0 47.95,46.78 |q 77230 |future
step
|script DoEmote("Bow")
clicknpc Odd Statue##189827
|tip Inside the building.
|tip Target the statue before bowing.
Bow Before the Odd Statue |complete subzone("The Dragon's Hoard") |goto 46.87,45.04 |q 77237 |future
step
talk Kritha##192814
Tell him _"I would like to talk to you about Shakey Flatlap."_
Settle Shakey's Tab |complete completedq(77230) or completedq(77237) |goto 47.34,41.12
step
Leave The Dragon's Hoard Bar |complete not subzone("The Dragon's Hoard") |goto 47.33,49.72
step
talk Shakey Flatlap##198586
Tell him _"I settled your tab with Kritha. He says you have to pay up front from now on."_
collect Crystal Ocular Lenses##207816 |goto 39.06,61.85 |q 77237 |future
step
talk Gorgonzormu##196729
buy 5 Apexis Asiago##201419 |goto 29.03,65.02 |q 77237 |future
step
kill Hungering Tyranha##191451+
collect Fresh Tyranha##207812 |goto Thaldraszus/0 38.70,68.45 |q 77237 |future
step
talk Agurahl the Butcher##194152
buy 5 Thunderspine Tenders##198441 |goto Ohn'ahran Plains/0 85.17,23.48 |q 77237 |future
step
talk Sniktak##204371
buy 5 Latticed Stinkhorn##205693 |goto Zaralek Cavern/0 54.08,56.66 |q 77237 |future
step
talk Erugosa##185556
|tip Inside the building.
Tell her _"I have the ingredients for the thunderspine nest."_
collect Thunderspine Nest##207956 |goto Valdrakken/0 46.51,46.23 |q 77237 |future
step
talk Gryffin##197781
Select  _"<Hold up the fresh tyranha to Gryffin.>"_
collect Downy Helmet Liner##207813 |goto 42.48,49.47 |q 77237 |future
step
talk Clinkyclick Shatterboom##185548
Ask her _"What do you know about a Thinking Cap?"_
collect Thought Calculating Apparatus##207814 |goto 42.25,48.64 |q 77237 |future
step
use the Thought Calculating Apparatus##207814
accept Unfinished Thinking Cap##77237
step
talk Fangli Hoot##207697
turnin Unfinished Thinking Cap##77237 |goto 26.65,53.87
step
use the Tricked Out THinking Cap##206696
Collect the Tricked-Out Thinking Cap |toy Tricked-Out Thinking Cap##206696
step
use the Tricked Out THinking Cap##206696
Put on Your Thinking Cap |havebuff Tricked-Out Thinking Cap##414103 |goto 26.65,53.89
step
talk Fangli Hoot##207697
accept The Tricked-Out Thinking Cap##76504 |goto 26.67,53.89
step
click Riddle Solved!
Solve the Riddle |q 76504/1 |goto 64.65,53.72
step
talk Fangli Hoot##207697
turnin The Tricked-Out Thinking Cap##76504 |goto 26.67,53.89
step
talk Bobby Carlisle##207696
|tip Inside the building.
accept An Inside Job?##77276 |goto 47.96,46.85 |or
'|complete completedq(77397) |or
step
talk Fangli Hoot##207697
turnin An Inside Job?##77276 |goto 26.67,53.88 |or
'|complete completedq(77397) |or
step
click Preservationist's Locker
|tip Upstairs inside the building.
Select _"<Take the item.>"_
collect Maruuk Burial Banner##208130 |goto 48.83,47.81 |q 77276 |or
'|complete completedq(77397) |or
step
talk "Appraiser" Sazsel Stickyfingers##208620
|tip Inside the building.
Tell her _"Fangli said you could appraise this item to see if it is genuine."_
Talk to Stickyfingers About the Banner |q 77397 |goto 62.81,72.87 |future
step
talk "Appraiser" Sazsel Stickyfingers##208620
|tip Inside the building.
accept Preservationist Cleared##77277 |goto 62.81,72.87
step
click Preservationist's Locker
|tip Upstairs inside the building.
Select _"<Return the burial banner.>"_
Return the Burial Banner |q 77277/1 |goto 48.81,47.82
step
talk Fangli Hoot##207697
turnin Preservationist Cleared##77277 |goto 26.67,53.89
step
talk Tithris##185562
|tip Inside the building.
'|accept Securing an Artifact##77281 |n
collect Preservationist's Dispatch##208131 |goto Valdrakken/0 47.47,46.19 |q 77403 |future
step
use the Tricked Out THinking Cap##206696
Put on Your Thinking Cap |havebuff Tricked-Out Thinking Cap##414103 |goto The Waking Shores/0 56.99,25.51 |q 77403 |future
step
click Ancient Lever
Throw the Lever |q 77403 |goto 56.99,25.51 |future
step
click Ancient Lever
|tip Inside the tower.
Throw the Lever |q 77402 |goto 57.77,23.82 |future
step
click Ancient Lever
|tip Inside the building.
Throw the Lever |q 77401 |goto 56.61,20.31 |future
step
click Torch of Pyrreth
|tip Inside the building.
accept Artifact Secured##77282 |goto 54.57,20.39
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin Artifact Secured##77282 |goto Valdrakken/0 47.33,48.22
accept The Torch of Pyrreth##77263 |goto 47.33,48.22
step
use the Torch of Pyrreth##208092
Collect the Torch of Pyrreth |toy Torch of Pyrreth##208092
step
use the Torch of Pyrreth##208092
|tip Inside the building.
Use the Torch |havebuff Flame Bearer##419127 |goto 58.48,23.61 |q 77263 |future
step
click Enchanted Box
|tip Inside the building.
collect 1 Kathos' Field Glasses##208107 |q 77263/1 |goto 58.48,23.61
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin The Torch of Pyrreth##77263 |goto 47.33,48.21
step
talk Bobby Carlisle##207696
|tip Inside the building.
'|accept A Chilling Ascent##77284 |n
collect The Clerk's Notes##208137 |goto 47.93,46.83
step
use the Torch of Pyrreth##208092
Use the Torch |havebuff Flame Bearer##419127 |goto The Azure Span/0 78.88,32.45 |q 77286 |future
step
click Unveiled Tablet
Select _"<Use paper and charcoal to make an etching.>"_
accept A Knowledgeable Descent##77286 |goto 78.88,32.45
step
talk Bobby Carlisle##207696
|tip Inside the building.
turnin A Knowledgeable Descent##77286 |goto Valdrakken/0 47.95,46.83
step
talk Tithris##185562
|tip Inside the building.
'|accept Idol Searching##77303 |n
collect 1 Preservationist's Dispatch Two##208144 |goto 47.46,46.22
step
Enter the building |goto Ohn'ahran Plains/0 31.67,70.45 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the mound.
Light the Brazier |q 77405 |goto 31.08,70.79 |future
step
Enter the building |goto 32.58,68.29 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the mound.
Light the Brazier |q 77406 |goto 32.37,67.95 |future
step
Enter the building |goto 35.28,66.05 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the mound.
Light the Brazier |q 77407 |goto 35.19,65.74 |future
step
Enter the building |goto 40.30,59.43 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the mound.
Light the Brazier |q 77404 |goto 39.55,58.92 |future
step
click Idol of Ohn'ahra
|tip Inside the mound.
accept An Idol in Hand##77304 |goto 39.56,58.89
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin An Idol in Hand##77304 |goto Valdrakken/0 47.34,48.21
accept Using the Idol##76456 |goto 47.34,48.21
step
use the Idol of Ohn'ahra##207730
Collect the Idol of Ohn'ahra |toy Idol of Ohn'ahra##207730
step
use the Idol of Ohn'ahra##207730
Activate the Idol of Ohn'ahra |havebuff Idol of Ohn'ahra##414338 |q 76456
step
click Hidden Gem
Loot the Hidden Gem |q 76456/1 |goto 49.00,51.23 |count 1
step
click Hidden Gem
Loot the Hidden Gem |q 76456/1 |goto 45.70,59.37 |count 2
step
click Hidden Gem
Loot the Hidden Gem |q 76456/1 |goto 55.15,64.62 |count 3
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin Using the Idol##76456 |goto 47.34,48.21
step
talk Preservationist Kathos##206864
|tip Inside the building.
'|accept Into the Sands##76509 |n
collect 1 A Clue: The Shifting Sands##206948 |goto 47.32,48.22
step
use the Idol of Ohn'ahra##207730
Activate the Idol of Ohn'ahra |havebuff Idol of Ohn'ahra##414338 |q 77305 |future
step
click Time-Lost Fragment##404319
collect 1 Time-Lost Fragment##208191 |goto Thaldraszus/0 58.51,78.43 |q 77305 |future
step
click Time-Lost Fragment##404319
collect 2 Time-Lost Fragment##208191 |goto 58.79,78.24 |q 77305 |future
step
click Time-Lost Fragment##404319
collect 3 Time-Lost Fragment##208191 |goto 59.30,78.82 |q 77305 |future
step
use the Time-Lost Fragment##208191
accept Out of the Sands##77305
step
talk Preservationist Kathos##206864
|tip Inside the building.
turnin Out of the Sands##77305 |goto Valdrakken/0 47.33,48.20
step
talk Bobby Carlisle##207696
|tip Inside the building.
accept A Key Story##77653 |goto 47.95,46.81 |or
'|q 77406 |future |or
step
talk Weaponsmith Koref##195769
|tip Inside the building.
turnin A Key Story##77653 |goto 36.19,51.94 |or
'|q 77406 |future |or
step
Enter the cave |goto Ohn'ahran Plains/0 53.31,56.85 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the mound.
Light the Brazier |q 77406 |goto 32.37,67.95 |future
step
click Titan Key Mold
accept A Titanic Mold##77822 |goto 63.00,57.37
step
talk Weaponsmith Koref##195769
|tip Inside the building.
turnin A Titanic Mold##77822 |goto Valdrakken/0 36.19,51.94
step
talk Bobby Carlisle##207696
|tip Inside the building.
accept Reforging a Legend##77829 |goto 47.94,46.82 |or
'|q 77893 |future |or
step
talk Weaponsmith Koref##195769
|tip Inside the building.
turnin Reforging a Legend##77829 |goto 36.19,51.91
'|q 77893 |future |or
step
use the Idol of Ohn'ahra##207730
Activate the Idol of Ohn'ahra |havebuff Idol of Ohn'ahra##414338 |q 77831 |future
step
click Dusty Red Pellets+
|tip They look like tiny clusters of red rocks on the ground around the shore.
|tip It helps to zoom your camera in close to see them.
collect 50 Rose Gold Dust##208835 |goto The Waking Shores/0 48.24,46.28 |q 77831 |future
step
click Igneous Flux+
|tip They look like small piles of ash around areas of cooling magma.
collect 8 Igneous Flux##208836 |goto The Waking Shores/0 21.10,76.86 |q 77831 |future
step
talk Weaponsmith Koref##210837
accept A Key To Reforg(ing)##77831 |goto 24.52,60.74
step
use the Torch of Pyrreth##208092
Use the Torch |havebuff Flame Bearer##419127 |goto 24.52,60.74 |q 77831 |future
step
talk Weaponsmith Koref##210837
Tell him _"I am ready to begin."_
Talk to Weaponsmith Koref to Begin |q 77831/1 |goto 24.52,60.74
step
extraaction Add Dusty Red Pellets##422252
Add the Dusty Red Pellets |q 77831/2 |goto 24.52,60.74
step
extraaction Add Igneous Flux##422255
Add the Igneous Flux |q 77831/3 |goto 24.52,60.74
step
use the Torch of Pyrreth##208092
Infuse the Key with the Torch of Pyrreth |q 77831/4 |goto 24.52,60.74
step
click Reforged Titan Key
collect 1 Reforged Titan Key##208830 |q 77831/5 |goto 24.54,60.90
step
talk Weaponsmith Koref##210837
turnin A Key To Reforg(ing)##77831 |goto 24.51,60.75
step
talk Preservationist Kathos##206864
|tip Inside the building.
accept A Proper Burial##77865 |goto Valdrakken/0 47.35,48.21 |or
'|q 77578 |future |or
step
use the Torch of Pyrreth##208092
Use the Torch |havebuff Flame Bearer##419127 |goto 24.52,60.74 |q 77578 |future
step
Enter the cave |goto Ohn'ahran Plains/0 43.65,48.13 < 7 |walk
click Banner Stand
|tip In the upper part of the cave.
Select _"<Tie the burial banner back up to the stand.>"_
Plant the Banner |q 77578 |goto 42.65,50.99 |future
step
talk Bobby Carlisle##207696
|tip Inside the building.
'|accept A Special Book##77897 |n
collect Kirin Tor Contact's Note##208888 |goto Valdrakken/0 47.94,46.84 |q 78050 |future
step
use the Idol of Ohn'ahra##207730
|tip Kill Moroes, then do the Opera event and move on to kill The Curator.
|tip Use it in The Menagerie inside Karazhan.
Activate the Idol of Ohn'ahra |havebuff Idol of Ohn'ahra##414338 |q 78050 |future
step
click Ancient Tome
Check the Ancient Tome |q 78050 |goto Karazhan/9 32.39,49.12 |future
step
click Ancient Tome
Check the Ancient Tome |q 78051 |goto 36.52,37.22 |future
step
click Ancient Tome
Check the Ancient Tome |q 78052 |goto 47.39,64.63 |future
step
click Tyr's Legacy
accept A Legacy of Secrets##77908 |goto 33.29,50.93
step
talk Bobby Carlisle##207696
|tip Inside the building.
turnin A Legacy of Secrets##77908 |goto Valdrakken/0 47.99,46.82
step
talk Bobby Carlisle##207696
|tip Inside the building.
accept They Are Always Listening##77928 |goto 47.95,46.81 |or
'|complete completedq(77916) |or
step
talk Fangli Hoot##207697
turnin They Are Always Listening##77928 |goto 26.67,53.90 |or
'|complete completedq(77916) |or
step
click Auction House Bill of Sale
|tip Inside the building.
Retrieve the Auction House Bill of Sale |q 78053 |goto 44.21,60.40 |future
step
click Void Storage Receipt
|tip Inside the building.
Retrieve the Void Storage Receipt |q 78054 |goto 73.96,57.48 |future
step
click Garden Supply Receipt
|tip Inside the building.
Retrieve the Garden Supply Receipt |q 78055 |goto 53.02,28.51 |future
step
click Researcher's Note
|tip Inside the building.
Retrieve the Researcher's Note |q 78056 |goto 37.61,37.16 |future
step
click Hastily Scrawled Note
|tip Inside the building.
Retrieve the Hastily Scrawled Note |q 78057 |goto 31.65,70.27 |future
step
click Researcher's Note
|tip Inside the building.
Retrieve the Researcher's Note |q 78056 |goto 37.61,37.16 |future
step
|script DoEmote("Bow")
clicknpc Odd Statue##189827 |goto 46.87,45.04
|tip Inside the building.
|tip Target the statue before bowing.
Bow Before the Odd Statue |complete subzone("The Dragon's Hoard") |goto 46.87,45.04 |q 77934 |future
step
use the Idol of Ohn'ahra##207730
|tip Inside the building.
Activate the Idol of Ohn'ahra |havebuff Idol of Ohn'ahra##414338 |q 77934 |future
step
click Note to Kritha
|tip Inside the building.
Retrieve the Note to Kritha |q 78058 |goto 46.00,41.45 |future
step
Leave The Dragon's Hoard Bar |complete not subzone("The Dragon's Hoard") |goto 47.33,49.72
step
talk Fangli Hoot##207697
turnin A Complete Inventory##77934 |goto 26.67,53.90
step
talk Tithris##185562
'|accept A Sphere in Danger##77953 |n
collect Preservationist's Dispatch Three##208942 |goto Valdrakken/0 47.48,46.18 |q 77951 |future
step
Enter the cave |goto Thaldraszus/0 47.03,78.10 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the cave.
|tip Wait for it to reveal the tablet.
Activate the Tablet |q 78109 |goto 46.62,77.61 |future
step
click Buried Object
collect Piece of the Orb of Rathmus##209797 |goto 45.90,79.71 |q 78108 |future
step
Enter the cave |goto Thaldraszus/0 49.78,80.21 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the cave.
|tip Wait for it to reveal the tablet.
Activate the Tablet |q 78108 |goto 50.15,81.01 |future
step
click Buried Object
collect Piece of the Orb of Rathmus##209795 |goto 49.52,79.74 |q 78111 |future
step
Enter the cave |goto Thaldraszus/0 47.91,77.83 < 7 |walk
use the Torch of Pyrreth##208092
|tip Inside the cave.
|tip Wait for it to reveal the tablet.
Activate the Tablet |q 78111 |goto 48.69,76.32 |future
step
click Buried Object
collect Piece of the Orb of Rathmus##209799 |goto 50.16,78.00 |q 77954 |future
step
use the Piece of the Orb of Rathmus##209799
accept A Curious Orb##77954 |goto 50.16,78.00
step
talk Tithris##185562
|tip Inside the building.
turnin A Curious Orb##77954 |goto Valdrakken/0 47.46,46.22
step
talk Preservationist Kathos##206864
|tip Inside the building.
'|accept A Treacherous Race##77957 |n
collect Ancient Tyrhold Artifact Notes##208958 |goto Valdrakken/0 47.43,48.22
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77960 |goto Thaldraszus/0 57.25,64.53 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77961 |goto 57.06,63.03 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77962 |goto 57.85,61.98 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77963 |goto 57.85,60.51 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77964 |goto 59.79,61.04 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77965 |goto 57.85,57.03 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77966 |goto 57.93,55.93 |future
step
use the Torch of Pyrreth##208092
|tip Wait for the channeling to complete and the orb to catch fire.
Activate the Statue |q 77967 |goto 59.77,56.32 |future
step
use the Torch of Pyrreth##208092
|tip In the back of the building in front of the giant face.
Activate the Lock |q 77975 |goto 61.17,58.74 |future
step
click Broken Urn
|tip On the first floor from the surface.
collect Titan Cube Housing##208971 |goto 59.95,54.69 |q 77969 |future
step
click Broken Urn
|tip On the third floor from the surface.
collect Titan Focusing Crystal##208960 |goto 59.72,54.87 |q 77969 |future
step
click Broken Urn
|tip On the first floor from the surface.
collect Titan Energy Core##208970 |goto 59.83,62.26 |q 77969 |future
step
click Broken Urn
|tip On the third floor from the surface.
collect Large Titan Capacitor##208973 |goto 59.68,62.63 |q 77969 |future
step
use the Titan Energy Core##208970
collect Titan Energy Cube##208969 |q 77969 |future
step
click Broken Urn
|tip On the bottom floor.
collect Titan Block Key Fragment##208967 |goto 61.96,61.93 |q 77969 |future
step
click Broken Urn
|tip On the bottom floor.
collect Titan Block Key Fragment##208966 |goto 61.66,55.08 |q 77969 |future
step
use the Titan Block Key Fragment##208966
collect Titan Block Key##208965 |q 77969 |future
step
click Titan Power Relay
|tip Inside the tower.
Select _"<Install the missing component.>"_
Install the Missing Component |q 77969 |goto 61.04,55.05 |future
step
click Titan Power Relay
|tip Inside the tower.
Select _"<Install the missing component.>"_
Install the Missing Component |q 77968 |goto 59.33,56.89 |future
step
click Titan Power Relay
|tip Inside the tower.
Select _"<Install the missing component.>"_
Install the Missing Component |q 77970 |goto 59.53,60.58 |future
step
click Titan Power Relay
|tip Inside the tower.
Select _"<Install the missing component.>"_
Install the Missing Component |q 77971 |goto 61.03,62.35 |future
step
click Orb Location
accept An Ominous Artifact##77977 |goto 60.16,58.73
step
click Orb Location
Select _"<Investigate to see if you can bypass the orb.>"_
Investigate the Orb Slot on the Console |q 77977/1 |goto 60.16,58.73
stickystart "Kill_Amerinth"
step
kill 1 Tithris##210674 |q 77977/3 |goto 60.41,58.74
step
label "Kill_Amerinth"
kill 1 Amerinth##210675 |q 77977/2 |goto 60.41,58.74
step
collect 1 Orb of Rathmus##209555 |q 77977/4 |goto 60.41,58.68
|tip Loot it from their corpse.
step
click Orb Location
Select _"<Place the Orb of Rathmus.>"_
Place the Orb of Rathmus Atop the Console |q 77977/5 |goto 60.16,58.74
step
click Cache of Cosmic Mysteries
Secure the Mysterious Artifact |q 77977/6 |goto 60.14,58.74
step
click Orb of Rathmus
Select _"<Retrieve the Orb of Rathmus.>"_
Retrieve the Orb of Rathmus |q 77977/7 |goto 60.16,58.74
step
talk Preservationist Kathos##206864
turnin An Ominous Artifact##77977 |goto 60.45,59.11
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Secrets of Azeroth\\Community Rumors",{
author="support@zygorguides.com",
condition_suggested=function() return isevent("Secrets of Azeroth") end,
description="\nThis guide section will walk you through finding the community rumors for the Secrets of Azeroth event.",
},[[
step
use the Torch of Pyrreth##208092
|tip Work through the "Secrets of Azeroth" event guide to collect this toy.
|tip It is require to complete the following steps.
Collect the Torch of Pyrreth |toy Torch of Pyrreth##208092
step
use the Torch of Pyrreth##208092
Use the Torch Near the Crystal and Wait for the Dirt to Spawn |q 78152 |goto Blasted Lands/0 64.67,55.44 |future
step
click Loose Dirt Mound
Loot the Buried Satchel |q 77298 |goto Blasted Lands/0 64.67,55.44 |future
step
click Loose Dirt Mound
Loot the Buried Satchel |q 78207 |goto Western Plaguelands/0 68.81,73.21 |future
step
click Loose Dirt Mound
Loot the Buried Satchel |q 77289 |goto Eastern Plaguelands/0 55.25,59.44 |future
step
click Loose Dirt Mound
|tip At the mouth of the statue.
Loot the Buried Satchel |q 77297 |goto Northern Barrens/0 46.05,50.68 |future
step
Enter the underwater cave |goto Thousand Needles/0 44.10,37.23 < 10 |walk
click Loose Dirt Mound
|tip Inside the underwater cave.
Loot the Buried Satchel |q 77291 |goto 42.74,30.65 |future
step
click Loose Dirt Mound
Loot the Buried Satchel |q 77288 |goto Felwood/0 42.23,48.04 |future
step
click Loose Dirt Mound
|tip on the floating island.
Loot the Buried Satchel |q 77299 |goto Nagrand/0 57.90,26.37 |future
step
use the Torch of Pyrreth##208092
|tip Three players must use each use their torch near a small crystal surrounding the bigger crystal.
click Loose Dirt Mound
Loot the Buried Satchel |q 77290 |goto Netherstorm/0 26.26,68.57 |future
step
click Loose Dirt Mound
|tip At the mouth of the statue.
Loot the Buried Satchel |q 77294 |goto Dragonblight/0 63.91,72.62 |future
step
click Loose Dirt Mound
|tip on the floating island.
Loot the Buried Satchel |q 77302 |goto Dragonblight/0 73.15,39.54 |future
step
talk Darrok##27425 |only if Horde
talk Gordun##27414 |only if Alliance
Tell him _"Yes, I am ready to travel to Venture Bay!"_
Begin the Log Ride |invehicle |goto Grizzly Hills/0 35.06,34.74 |only if Horde
Begin the Log Ride |invehicle |goto Grizzly Hills/0 36.81,35.73 |only if Alliance
step
Ride the Log Ride |outvehicle |goto 10.73,75.23 |only if Horde
Ride the Log Ride |outvehicle |goto 20.40,81.51 |only if Alliance
step
click Loose Dirt Mound
|tip Click it before the WHEE! buff wears off.
Loot the Buried Satchel |q 77300 |goto 10.98,74.90 |future |only if Horde
Loot the Buried Satchel |q 77300 |goto 20.29,81.35 |future |only if Alliance
step
click Loose Dirt Mound
|tip At the mouth of the statue.
Loot the Buried Satchel |q 77293 |goto Valley of the Four Winds/0 56.83,21.41 |future
step
click Loose Dirt Mound
|tip At the mouth of the statue.
Loot the Buried Satchel |q 77301 |goto Timeless Isle/0 38.70,54.94 |future
step
click Loose Dirt Mound
Loot the Buried Satchel |q 77292 |goto Shadowmoon Valley D/0 35.31,48.96 |future
step
click Loose Dirt Mound
|tip on the floating island.
Loot the Buried Satchel |q 78208 |goto Highmountain/0 53.35,87.50 |future
step
click Loose Dirt Mound
|tip on the floating island.
Loot the Buried Satchel |q 77295 |goto Tiragarde Sound/0 74.56,86.13 |future
step
use the Torch of Pyrreth##208092
|tip Walk up to the snowman with it lit a waint for it to melt.
click Loose Dirt Mound
|tip At the mouth of the statue.
Loot the Buried Satchel |q 77296 |goto The Azure Span/0 25.24,71.47 |future
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Secrets of Azeroth\\Secrets of Azeroth Mimiron's Jumpjets Mount",{
author="support@zygorguides.com",
condition_suggested=function() return isevent("Secrets of Azeroth") end,
description="\nThis guide section will walk you through assembling the Mimiron's Jumpjets.",
},[[
step
use the Torch of Pyrreth##208092
|tip Work through the "Secrets of Azeroth" event guide to collect this toy.
|tip It is require to complete the following steps.
Collect the Torch of Pyrreth |toy Torch of Pyrreth##208092
step
use the Torch of Pyrreth##208092
|tip 3 people are needed, each using their Torch near a brazier to summon the Enigma Ward.
kill Enigma Ward##210398 |q 78098 |goto The Cape of Stranglethorn/0 58.99,78.25 |future
step
collect 1 First Booster Part##208984
|tip Loot it from the corpse.
step
extraaction Envelope##423412
click Mimiron's Booster Part
|tip One person needs to click the part while the other three need to use the ability that appears on-screen by the elemental.
collect Second Booster Part##209781 |goto Felwood/0 49.91,26.37 |q 78099 |future
step
click Mimiron's Booster Part
collect Third Booster Part##209055 |goto Blasted Lands/0 54.86,52.28 |q 78100 |future
step
use First Booster Part##208984
|tip The Arcane Forge must be empowered to assemble this.
|tip The icon on the map indicates the start of the next event and the number of completions required to make the forge permanent.
|tip Wait for the next event completion to assemble your mount.
collect Mimiron's Jumpjets##210022 |goto Valdrakken/0 36.47,61.98
step
use Mimiron's Jumpjets##210022
Collect the Mimiron's Jumpjets Mount |learnmount Mimiron's Jumpjets##424082
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\The Emerald Dream Superbloom",{
author="support@zygorguides.com",
description="This guide will help you complete the Superbloom event in The Emerald Dream.",
startlevel=70,
patch='100200',
viginette=5813,
areapoitype="Superbloom",
},[[
step
label "Accept_The_Superbloom"
talk Clarelle##208474
accept The Superbloom##78319 |goto The Emerald Dream/0 51.42,59.61
step
Wait for the Superbloom Event to Start |scenariostart |goto 51.42,59.61
|tip The event starts at the top of every hour.
stickystart "Earn_Blooms"
step
click Dreamfruit
|tip Choose from the powers available for the remainder of the Superbloom event.
|tip Depending on your reputation with the Dream Wardens, you may be able to choose more than one.
Consume Dreamfruit for the Journey |scenariogoal 1/60388 |goto 51.27,59.83
step
map The Emerald Dream/0
path follow smart; loop off; ants curved; dist 30
path	51.51,59.79	52.08,60.78	54.28,62.10	54.87,63.82	56.08,66.67
path	57.38,68.17	55.54,71.50	53.13,73.70
click Rain-Starved Flower+
|tip They look like large flowers surrounded by light on the ground all over the area.
|tip Each flower will increase the Bloom Quality by a small amount.
Help as Many Rain-Starved Flowers as You Can |scenariogoal 2/60395
|only if scenariostage(2)
step
Kill enemies that attack in waves
Defeat the Primalists |scenariogoal 3/0 |goto 53.06,73.68
|only if scenariostage(3)
step
map The Emerald Dream/0
path follow smart; loop off; ants curved; dist 30
path	52.85,74.18	51.24,77.10	49.77,76.64	47.56,76.14	46.85,74.46
path	45.74,72.83	44.72,72.09 |goto 44.10,71.76
clicknpc Tenacious Weed##207675+
|tip They look like small plants growing out of the ground around Sprucecrown.
click Rain-Starved Flowers
|tip They look like large flowers surrounded by light on the ground all over the area.
|tip Each flower and weed will increase the Bloom Quality by a small amount.
Pull Weeds and Help as Much as You Can |scenariogoal 4/60396
|only if scenariostage(4)
step
map The Emerald Dream/0
path follow smart; loop off; ants curved; dist 30
path	51.53,59.92	49.56,58.84	48.82,58.40	47.07,58.76	46.33,61.46
path	46.15,63.57
clicknpc Vision of Innocence##208693+
|tip They look like small creatures hopping around this area.
Shoo as Many Insect Swarms as you Can Near Sprucecrown |scenariogoal 5/60398
|only if scenariostage(5)
stickystart "Defeat_the_Western_Patrol"
step
Kill enemies that attack in waves
Defeat the Northern Patrol |scenariogoal 6/60314 |goto 46.46,61.21
|only if scenariostage(6)
step
label "Defeat_the_Western_Patrol"
Kill enemies that attack in waves
Defeat the Western Patrol |scenariogoal 6/60315 |goto 46.00,63.64
|only if scenariostage(6)
step
map The Emerald Dream/0
path follow smart; loop off; ants curved; dist 30
path	46.15,63.57	45.17,64.11	44.44,67.32	42.44,67.98	42.24,68.91
path	44.01,72.01
click Mulch Pile+
|tip THey look like piles of dirt on the ground around this area.
Dig up mulch and help as much as you can |scenariogoal 7/60397
|only if scenariostage(7)
step
Kill enemies that attack in waves
Defend Sprucecrown from All Primalist Attackers |scenariogoal 8/64358 |goto 44.06,71.79
step
kill 1 Verlann Timbercrush##207554 |scenariogoal 9/60311 |goto 43.98,72.35
step
label "Earn_Blooms"
Earn #50# Blooms |q 78319/2 |goto 51.42,59.61
|tip Run through Insect Swarms to disperse them.
|tip Click flowers and fruits along the way.
step
Complete the Superbloom |q 78319/3 |goto 51.42,59.61
step
talk Clarelle##208474
turnin The Superbloom##78319 |goto 44.62,71.96
|next "Accept_The_Superbloom"
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\19th Anniversary Event",{
author="support@zygorguides.com",
description="This guide will help you complete the 19th anniversary event weekly quest.",
startlevel=30,
patch='100200',
pet=4265,
mounts={420097},
},[[
step
collect Anniversary Gift##208211 |q 57249 |future
|tip Collect this from the nearest mailbox.
step
use the Anniversary Gift##208211
collect Lil' Frostwing##208543 |or
'|learnpet Lil' Frostwing##4265 |or
step
use the Anniversary Gift##208211
accept A Timely Invitation##57249
|tip You will accept this quest automatically.
step
use Lil' Frostwing##208543
learnpet Lil' Frostwing##4265
step
talk Chromie##157113
turnin A Timely Invitation##57249 |goto Tanaris/18 53.21,54.66
step
label "Accept_Weekly_Quest"
talk Chromie##157113
accept Doomwalkin' Has Come Knockin'##60215 |goto 53.21,54.66
step
talk Historian Ju'pa##110035
accept A Time to Reflect##43461 |goto 51.71,38.75
|only if Horde
step
talk Historian Ju'pa##110035
accept The Originals##47254 |goto 51.75,38.75
|only if Horde
step
talk Historian Llore##110034
accept A Time to Reflect##43323 |goto 51.49,38.55
|only if Alliance
step
talk Historian Llore##110034
accept The Originals##47253 |goto 51.49,38.55
|only if Alliance
step
talk Historian Ju'pa##110035
|tip There are 43 possible questions.
|tip If you choose incorrectly, you can close the window and reopen it for a new question.
Answer Ju'Pa's Question |q 43461/1 |goto 51.71,38.75
|only if Horde
step
talk Historian Llore##110034
|tip There are 43 possible questions.
|tip If you choose incorrectly, you can close the window and reopen it for a new question.
Answer Ju'Pa's Question |q 43323/1 |goto 51.49,38.55
|only if Alliance
step
talk Historian Ju'pa##110035
turnin A Time to Reflect##43461 |goto 51.71,38.75
|only if Horde
step
talk Historian Llore##110034
turnin A Time to Reflect##43323 |goto 51.49,38.55
|only if Alliance
step
Follow the path up |goto Tanaris/17 34.76,74.74 < 40 |walk |notravel
kill Doomwalker##167749 |q 60215/1 |goto Tanaris/0 63.50,50.39
step
collect Azure Worldchiller##208572 |or
|tip Loot it from Doomwalker.
'|learnmount Azure Worldchiller##420097 |or
step
use the Azure Worldchiller##208572
learnmount Azure Worldchiller##420097
stickystart "Kill_Lord_Kazzak"
stickystart "Slay_a_Dragon_of_Nightmare"
step
kill Azuregos##121820 |q 47254/2 |goto Azshara/0 48.77,84.24 |only if Horde
kill Azuregos##121820 |q 47253/2 |goto Azshara/0 48.77,84.24 |only if Alliance
|tip Use the group finder to find a group for this boss.
step
label "Kill_Lord_Kazzak"
kill Lord Kazzak##121818 |q 47254/1 |goto Blasted Lands/0 32.37,49.03 |only if Horde
kill Lord Kazzak##121818 |q 47253/1 |goto Blasted Lands/0 32.37,49.03 |only if Alliance
|tip Use the group finder to find a group for this boss. |notinsticky
step
label "Slay_a_Dragon_of_Nightmare"
Slay a Dragon of Nightmare |q 47254/3 |goto The Hinterlands/0 63.01,26.00 |only if Horde
Slay a Dragon of Nightmare |q 47253/3 |goto The Hinterlands/0 63.01,26.00 |only if Alliance
|tip Use the group finder to find a group for this boss. |notinsticky
You can find Lethon at [The Hinterlands/0 63.01,26.00]
|tip Lethon spawns on 11/19, 11/23, 11/27, 12/1, and 12/5.
You can find Taerar at [Ashenvale/0 93.78,39.66]
|tip Taerar spawns on 11/17, 11/21, 11/25, 11/29, 12/3, and 12/7.
You can find Ysondre at [Feralas/0 51.69,10.49]
|tip Ysondre spawns on 11/18, 11/22, 11/26, 11/30, and 12/4.
You can find Emeriss at [Duskwood/0 46.65,38.11]
|tip Emeriss spawns on 11/16, 11/20, 11/24, 11/28, 12/2, and 12/6.
step
talk Chromie##157113
turnin Doomwalkin' Has Come Knockin'##60215 |goto Tanaris/18 53.21,54.66
step
talk Historian Ju'pa##110035
turnin The Originals##47254 |goto 51.75,38.75
|only if Horde
step
talk Historian Llore##110034
turnin The Originals##47253 |goto 51.49,38.55
|only if Alliance
step
Wait for the Next Daily Reset |complete not completedq(60215) and (not completedallq(43461,47254) or not completedallq(47253,43323)) |next "Accept_Weekly_Quest"
|tip You can repeat the weekly quests every Tuesday.
|tip You can complete "A Time to Reflect" every day.
|tip You can also accept the PvP quest and queue for Korrak's Revenge.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Dragonflight (10-70)\\Hearthstone 10th Anniversary Event",{
author="support@zygorguides.com",
description="This guide will help you complete the Hearthstone 10th Anniversary event activities.",
startlevel=1,
patch='100205',
achieveid={20033,19724},
mounts={212522,278966},
pet=432486,
},[[
step
learnmount Fiery Hearthsteed##278966
|tip Log in between March 11th and March 18th to receive this mount.
|tip You must install Hearthstone and log in at least once to unlock this mount.
|tip You will see a popup for this mount in Hearthstone.
step
collect Hearthstone Invitation Letter##212154 |q 79184 |future
|tip Collect this from the nearest mailbox.
step
use the Hearthstone Invitation Letter##212154
accept It's Hearthstone's Anniversary!##79184
step
talk MC Farala##215409
|tip Up on the platform.
turnin It's Hearthstone's Anniversary!##79184| goto Valdrakken/0 62.75,64.87
accept Play Hearthstone!##79178| goto 62.75,64.87
step
talk Shady Dealer##215385
|tip Up on the bridge.
buy 5 Hearthstone Wild Card##211965 |goto 60.55,59.28 |q 79178
step
use the Hearthstone Wild Card##211965
|tip Use them on cooldown next to the table up on the platform.
Play #5# Cards |q 79178/1 |goto 62.33,67.66
step
talk MC Farala##215409
|tip Up on the platform.
turnin Play Hearthstone!##79178| goto 62.75,64.81
step
Every Hour a Portal Will Spawn
|tip The location where the portal spawns follows a cycle.
|tip The portals spawn in Stormwind, then Durotar, then Valdrakken.
|tip Ask around to see where the last portal spawned.
|tip Then head to the next portal location in the cycle.
|tip The remaining rewards from the event have a random chance to drop from the rares that spawn from the portals.
|tip Open Hearthstone Starter Packs to collect cards and other rewards.
|tip You have not collected the Compass Rose mount. |only if not hasmount(212522)
|tip You have not collected the Sarge pet. |only if not haspet(432486)
The poral locations are as follows:
Stormwind [Stormwind City/0 33.99,20.52]
Durotar [Durotar/0 53.10,16.17]
Valdrakken [Valdrakken/0 62.24,66.97]
'|complete false
]])
