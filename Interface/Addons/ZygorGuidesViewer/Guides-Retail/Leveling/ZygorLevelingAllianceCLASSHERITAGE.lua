local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("LevelingACLASSHERITAGE") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Draenei Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Draenei Heritage Armor.",
patch='100207',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Draenei Character |complete Draenei and level >= 50
|tip You must complete this on a 50+ Draenei character.
|tip Refer to our various leveling guides to help you accomplish this.
step
click Magically-Sealed Parcel
accept An Artificer's Appeal##78068 |goto Stormwind City/0 53.02,15.48
step
use the Spare Hologem##210454
Use the Spare Hologem |q 78068/1 |goto 52.92,15.47
step
Meet Romuul in the Exodar |q 78068/2 |goto The Exodar/0 54.79,79.85
step
talk Grand Artificer Romuul##210340
turnin An Artificer's Appeal##78068 |goto 54.79,79.85
accept Reviving Tradition##78069 |goto 54.79,79.85
step
click Artificing Tools
collect 1 Empyrium Filament##210167 |q 78069/1 |goto 58.04,79.90
step
click Artificing Tools
collect 1 Hyperthermal Soldering Tool##210168 |q 78069/2 |goto 51.32,74.64
step
talk Grand Artificer Romuul##210340
Select _"<Hand the materials to Romuul.>"_ |gossip 114137
Bring the Materials to Romuul |q 78069/3 |goto 54.78,79.80
step
click Arkonite Pillar
|tip Click the sparkling pillars one at a time to connect them on both sides.
click Arkonite Generator
|tip Click the generator after connecting the pair of pillars on both sides.
Connect #2# Arkonite Arrays |q 78069/4 |goto 53.82,78.98
step
talk Grand Artificer Romuul##210340
turnin Reviving Tradition##78069 |goto 54.78,79.79
accept Pressing Deadlines##78070 |goto 54.78,79.79
step
use the Spare Hologem##210454
Use the Spare Hologem |q 78070/1 |goto 54.78,79.79
step
talk High Artificer Ataanya##208494
Tell her _"Romuul needs you to bring your schematics to Exodar and present them at the Tishamaat."_ |gossip 114139
Speak to Ataanya |q 78070/2 |goto 38.94,46.90
step
Watch the dialogue
talk High Artificer Ataanya##208494
turnin Pressing Deadlines##78070 |goto 38.94,46.90
accept Rush Order##78071 |goto 38.94,46.90
step
talk Apprentice Beruun##208496
Tell him _"I'll try to locate the draenite shipment."_ |gossip 114140
Speak to Beruun |q 78071/1 |goto 37.95,46.95
step
Locate the Draenite Miners |q 78071/2 |goto Terokkar Forest/0 40.62,25.19
step
click Draenite Crate
Load the Draenite Crate |q 78071/3 |goto 40.60,25.23 |count 1
step
click Draenite Crate
Load the Draenite Crate |q 78071/3 |goto 40.67,25.20 |count 2
step
click Draenite Crate
Load the Draenite Crate |q 78071/3 |goto 40.63,25.14 |count 3
step
talk Crystalsmith Laharu##212120
Tell him _"Here is some of the High Artificer's draenite order. The rest is on the way."_ |gossip 114147
Deliver the Draenite to the Crystalsmiths |q 78071/5 |goto Shattrath City/0 76.15,47.52
step
talk Crystalsmith Laharu##212120
Tell him _"Here is some of the High Artificer's draenite order. The rest is on the way."_ |gossip 114147
Get the Signed Work Orders |q 78071/6 |goto 76.15,47.52
step
talk High Artificer Ataanya##208494
Tell her _"I took your draenite shipment to the crystalsmiths. Here are your completed work orders."_ |gossip 120519
Bring the Work Orders to Ataanya |q 78071/7 |goto 38.95,46.90
step
Watch the dialogue
talk Apprentice Beruun##208496
turnin Rush Order##78071 |goto 37.96,46.95
accept An Old Wound##78072 |goto 37.96,46.95
step
talk Soultender Nemuraan##210575
Ask him _"High Artificer Ataanya will not attend the Tishamaat because she still mourns her father. Can you help her?"_ |gossip 113996
Speak to the Auchenai Soulpriests |q 78072/1 |goto Terokkar Forest/0 37.49,64.22
step
talk Exarch Maladaar##210578
turnin An Old Wound##78072 |goto 37.49,64.30
accept Lingering Scars##78073 |goto 37.49,64.30
step
click Auchenai Translocator
Use the Auchenai Translocator |q 78073/1 |goto 37.35,64.75
step
Begin Travelling |invehicle |q 78073
step
Watch the dialogue
Reach the Upper Platform |outvehicle |goto 38.32,69.41 |q 78073
step
extraaction Commune##424689
|tip It appears as a button on your screen.
Commune with Exarch Larohir |q 78073/2 |goto 38.16,69.72
step
Return #8# Shattrath Victims to Rest |q 78073/3 |goto 38.40,69.95
|tip Click the NPCs on the platform.
step
click Larohir's Ashes
Calm Exarch Larohir |q 78073/4 |goto 38.09,69.66
step
click Auchenai Translocator
Use the Auchenai Translocator |invehicle |goto 38.29,69.37 |q 78073
step
Watch the dialogue
Reach the Next Platform |outvehicle |goto 42.12,67.64 |q 78073
step
extraaction Commune##427396
|tip It appears as a button on your screen.
Commune with Exarch Kelios |q 78073/5 |goto 42.37,67.81
step
click Karabor Prayer Candle+
|tip Click all of the candles quickly before they go out.
|tip Click the largest candles first as they burn the longest and take the longest to light.
|tip Alternatively, you can click the altar nearby to channel a long cast and bypass, though it will take much more time.
Light All Karabor Prayer Candles at Once |q 78073/6 |goto 42.46,67.96
step
click Kelios's Ashes
Calm Exarch Kelios |q 78073/7 |goto 42.34,67.92
step
click Auchenai Translocator
Use the Auchenai Translocator |invehicle |goto 42.14,67.60 |q 78073
step
Watch the dialogue
Reach the Next Platform |outvehicle |goto 41.46,62.23 |q 78073
step
extraaction Commune##430931
|tip It appears as a button on your screen.
|tip Two enemies will attack you.
Commune with Restalaan |q 78073/8 |goto 41.52,61.87
step
kill Memory of Death##210584+
|tip Two enemies will attack you.
Slay #2# Memories of Death |q 78073/9 |goto 41.52,61.87
step
click Restalaan's Ashes
Calm Restalaan |q 78073/10 |goto 41.45,61.81
step
talk Exarch Maladaar##210581
turnin Lingering Scars##78073 |goto 41.60,61.60
accept To See Clearly##78074 |goto 41.60,61.60
step
click Auchenai Translocator
Use the Auchenai Translocator |q 78074/1 |goto 41.43,62.24
step
Begin Travelling |invehicle |q 78074
step
Watch the dialogue
Reach the Next Platform |outvehicle |goto 37.36,62.88 |q 78074
step
click Hataaru's Ashes
Tell _"I think your daughter Ataanya still grieves for you."_ |gossip 114044
Request to Speak to Hataaru's Ashes |q 78074/2 |goto 37.10,62.89
step
click Artificer's Lockbox##408954
collect 1 Exarch Hataaru's Artificing Lens##210189 |q 78074/3 |goto 36.83,62.66
step
talk High Artificer Ataanya##210569
Select _"<Offer the artificing lens to her.> I spoke to your father. He wanted you to have this."_ |gossip 120282
Take the Lens to Ataanya in Shattrath |q 78074/4 |goto Shattrath City/0 39.06,46.25
step
Watch the dialogue
talk High Artificer Ataanya##210569
turnin To See Clearly##78074 |goto 39.06,46.25
accept Moving Past##78075 |goto 39.06,46.25
step
use the Spare Hologem##210454
Use the Spare Hologem |q 78075/1 |goto 39.06,46.25
step
Return to Romuul in the Exodar |q 78075/2 |goto The Exodar/0 55.38,79.12
step
talk Grand Artificer Romuul##210562
turnin Moving Past##78075 |goto 55.38,79.12
step
talk Chieftain Hatuun##210563
accept Emergency Efforts##78076 |goto 53.98,76.62
step
clicknpc Argussian Mana Ray##211689
Mount the Argussian Mana Ray |q 78076/1 |goto 53.71,75.81
step
Begin Flying |invehicle |q 78076
step
Watch the dialogue
Ride to Bloodmyst Isle |q 78076/2 |goto Bloodmyst Isle/0 52.17,74.11 |notravel
step
talk Prophet Velen##210390
turnin Emergency Efforts##78076 |goto 52.03,75.57
step
talk Arzaal##210588
accept Assessing the Enemy##78078 |goto 51.91,75.67
step
talk Chieftain Hatuun##210391
accept Beneath the Skin##78077 |goto 51.90,75.52
stickystart "Collect_Pitted_Bones"
step
click Satyr Totem
collect 1 Satyr Totem##210238 |q 78078/1 |goto 54.49,74.84
step
click Satyr Totem
collect 2 Satyr Totem##210238 |q 78078/1 |goto 54.70,72.74
step
click Satyr Totem
collect 3 Satyr Totem##210238 |q 78078/1 |goto 56.38,72.10
step
click Satyr Totem
collect 4 Satyr Totem##210238 |q 78078/1 |goto 57.72,68.61
step
click Satyr Totem
collect 5 Satyr Totem##210238 |q 78078/1 |goto 54.99,67.47
step
click Satyr Totem
collect 6 Satyr Totem##210238 |q 78078/1 |goto 52.31,68.27
step
label "Collect_Pitted_Bones"
Kill enemies around this area |kill Infected Nightsaber##210397+, Corrupted Grizzly##210395+
collect 8 Pitted Bones##210239 |q 78077/1 |goto 52.00,70.21
step
talk Chieftain Hatuun##210391
turnin Beneath the Skin##78077 |goto 51.90,75.54
step
talk Arzaal##210588
turnin Assessing the Enemy##78078 |goto 51.91,75.67
step
talk Prophet Velen##210390
accept Excision##78079 |goto 52.03,75.59
step
Meet Velen and Hatuun in Nazzivian |q 78079/1 |goto 43.15,77.85
step
click Crystalline Felspreader
Find the Man'ari Evidence |q 78079/2 |goto 41.31,77.73 |count 1
step
click Crystalline Felspreader
Find the Man'ari Evidence |q 78079/2 |goto 36.52,71.91 |count 2
step
click Crystalline Felspreader
Find the Man'ari Evidence |q 78079/2 |goto 35.71,80.92 |count 3
step
talk Prophet Velen##210600
turnin Excision##78079 |goto 42.27,36.82
step
talk Arzaal##210598
accept At the Source##78080 |goto 42.22,36.58
step
Watch the dialogue
Reveal the Source of Fel |q 78080/1 |goto 41.67,32.59
step
extraaction Call Romuul##428008
|tip It appears as a button on your screen.
Watch the dialogue
Call Romuul for aid |q 78080/2 |goto 41.67,32.59
step
talk Prophet Velen##210605
Tell him _"I am ready."_ |gossip 114169
Speak to Velen |q 78080/3 |goto 41.46,33.03
step
Kill enemies that attack in waves
|tip Standing in Velen's light will heal you.
kill Sironas##210604
|tip This is the final enemy to appear.
Defend the Generator |q 78080/4 |goto 41.46,32.91
step
talk Prophet Velen##210605
turnin At the Source##78080 |goto 41.46,33.03
accept Pain Recedes##78081 |goto 41.46,33.03
step
use the Spare Hologem##210454
Use the Spare Hologem |q 78081/1 |goto 41.46,33.03
step
Return to Velen in the Exodar |q 78081/2 |goto The Exodar/0 54.76,80.68
step
talk Prophet Velen##214021
turnin Pain Recedes##78081 |goto 54.76,80.68
accept A Burden Shared##78082 |goto 54.76,80.68
step
talk Grand Artificer Romuul##210565
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114201
Collect the Memory Stone |q 78082/1 |goto 55.42,78.98 |count 1
step
talk High Artificer Ataanya##210673
Ask her _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114202
Collect the Memory Stone |q 78082/1 |goto 55.61,78.66 |count 2
step
talk Prophet Velen##210670
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114203
Collect the Memory Stone |q 78082/1 |goto 53.77,83.75 |count 3
step
talk Chieftain Hatuun##210671
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 122502
Collect the Memory Stone |q 78082/1 |goto 53.73,84.17 |count 4
step
talk High Priestess Ishanah##212344
Ask her _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114214
Collect the Memory Stone |q 78082/1 |goto 47.70,81.68 |count 5
step
talk Vindicator Boros##212342
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114215
Collect the Memory Stone |q 78082/1 |goto 57.32,92.89 |count 6
step
talk Arzaal##210672
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114205
Collect the Memory Stone |q 78082/1 |goto 57.21,93.25 |count 7
step
talk Exarch Naielle##212347
Ask her _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114209
Collect the Memory Stone |q 78082/1 |goto 57.17,69.89 |count 8
step
talk Farseer Nobundo##212343
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114213
Collect the Memory Stone |q 78082/1 |goto 68.43,80.27 |count 9
step
talk Akama##212349
Ask him _"May I take your memory stone to the Flame of Reprieve?"_ |gossip 114206
Collect the Memory Stone |q 78082/1 |goto 67.84,85.08 |count 10
step
talk Grand Anchorite Almonen##212387
|tip Inscribe whatever name you prefer on your stone by picking the corresponding dialogue option.
|tip Choose any follow-up dialogue option you prefer.
Create a Personal Memory Stone |q 78082/2 |goto 64.40,87.26
step
extraaction Dissolve Memory Stones##426960
|tip It appears as a button on your screen.
Dissolve the Memory Stones |q 78082/3 |goto 65.13,87.62
step
talk Grand Anchorite Almonen##212387
turnin A Burden Shared##78082 |goto 64.39,87.28
accept Our Path Forward##78083 |goto 64.39,87.28
step
talk Prophet Velen##212402
Tell him _"Please begin the ceremony."_ |gossip 114223
Ask Velen to Begin the Ceremony |q 78083/1 |goto 54.76,80.68
step
talk Prophet Velen##212402
turnin Our Path Forward##78083 |goto 54.76,80.68
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Dwarf Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Dwarf Heritage Armor.",
patch='80100',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Dwarf Character |complete Dwarf and level >= 50
|tip You must complete this on a 50+ Dwarf character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Digger Golad##146988
accept Keep Yer Feet On The Ground##53838 |goto Stormwind City/0 54.48,18.29
step
Enter the cave |goto Dun Morogh/0 77.85,54.88 < 15 |walk
Follow the path |goto Dun Morogh/11 37.95,68.78 < 15 |walk
Continue following the path |goto Dun Morogh/11 44.70,37.03 < 15 |walk
Follow the path |goto Dun Morogh/11 50.17,19.77 < 10 |walk
Find the Missing Excavators |q 53838/1 |goto 40.27,21.73
|tip Inside the cave.
step
kill Maw'roc the Thief##146994 |q 53838/2 |goto 40.27,21.73
|tip Inside the cave.
step
click Ancient Tablet
|tip Inside the cave.
turnin Keep Yer Feet On The Ground##53838 |goto 39.81,22.55
accept Something Valuable, Perhaps?##53835 |goto 39.81,22.55
step
Enter the building |goto Ironforge/0 66.16,19.39 < 20 |walk
talk Brann Bronzebeard##145462
|tip Inside the building.
turnin Something Valuable, Perhaps?##53835 |goto Ironforge/0 77.45,9.51
accept Ancient Armor, Ancient Mystery##53836 |goto Ironforge/0 77.45,9.51
step
Enter the building |goto 44.54,49.53 < 10 |walk
Follow the path down |goto 44.21,51.97 < 7 |walk
Continue down the path |goto Ironforge/1 79.81,87.01 < 7 |c |q 53836
step
Follow the path down |goto 80.27,53.41 < 10 |walk
talk Advisor Belgrum##145464
|tip Downstairs inside the cave.
turnin Ancient Armor, Ancient Mystery##53836 |goto 56.98,47.92
accept Watch Yer Back##53837 |goto 56.98,47.92
stickystart "Kill_Trogg_Invaders"
step
Follow the path |goto 55.32,60.02 < 7 |walk
Continue following the path |goto 45.04,62.24 < 7 |walk
kill Roc'maw the Burrower##145698 |q 53837/2 |goto 19.61,51.79
|tip Downstairs inside the cave.
|tip Follow the winding path down.
|tip He will appear on your minimap as a yellow dot.
step
label "Kill_Trogg_Invaders"
kill 8 Trogg Invader##145469 |q 53837/1 |goto 36.57,43.02
step
_Next to you:_
talk Advisor Belgrum
turnin Watch Yer Back##53837
accept Aegrim's Study##53839
step
click Door to Aegrim's Study |goto 18.53,52.59
|tip Downstairs inside the cave.
Enter Aegrim's Study |goto Ironforge/0 23.78,49.83 < 10 |noway |c |q 53839
step
click Armor Stand
|tip Inside the building.
turnin Aegrim's Study##53839 |goto 19.53,52.05
accept Shards of the Past##53841 |goto 19.53,52.05
step
click Pile of Disenchanted Metal+
|tip They look like piles of sheets of grey metal on the ground around this area inside the building.
|tip You will be attacked.
collect 6 Fragments of Shattered Armor##164946 |q 53841/1 |goto 20.67,51.42
step
click Door to Old Ironforge |goto 24.82,49.31
|tip Inside the building.
Leave Aegrim's Study |goto Ironforge/1 21.16,51.28 < 10 |noway |c |q 53841
step
Follow the path up |goto 37.74,44.24 < 10 |walk
Continue up the path |goto 63.44,48.30 < 10 |walk
Continue up the path |goto 78.75,88.32 < 7 |c |q 53841
|tip Follow the winding path up.
step
Continue up the path |goto Ironforge/0 46.02,52.63 < 7 |walk
Leave the building |goto Ironforge/0 44.58,49.48 < 7 |walk
Enter the building |goto Ironforge/0 66.91,23.11 < 20 |walk
talk Brann Bronzebeard##145462
|tip Inside the building.
turnin Shards of the Past##53841 |goto Ironforge/0 77.43,9.53
accept Interest Yah In A Pint?##53840 |goto Ironforge/0 77.43,9.53
step
Enter the building |goto Loch Modan/0 35.24,47.75 < 15 |walk
talk Grumnus Steelshaper##5164
|tip Inside the building.
turnin Interest Yah In A Pint?##53840 |goto Loch Modan/0 35.00,48.78
step
talk Brann Bronzebeard##145462
|tip Inside the building.
accept Recruiting the Furnace Master##53844 |goto 35.00,48.66
step
Travel to Ulduar |q 53844/1 |goto The Storm Peaks/0 41.57,17.67
|tip Walk into the swirling portal.
stickystart "Kill_Titan_Flames"
step
_Inside Ulduar:_
Watch the dialogue
|tip Follow Brann Bronzebeard as he walks.
|tip Walk down the hallway and take the first path to the left.
kill Magmarion of the Furnace##145909 |q 53844/3
step
label "Kill_Titan_Flames"
_Inside Ulduar:_
kill 6 Titan Flame##145905 |q 53844/2
|tip In the same room you kill Magmarion of the Furnace.
step
Watch the dialogue
|tip Follow Brann Bronzebeard as he walks.
click Brann's Flying Machine
|tip It looks like a small airplane near the door where you entered Ulduar.
Choose _"I am ready to go back to Loch Modan."_
Return to Loch Modan |goto Loch Modan/0 33.78,50.83 < 20 |noway |c |q 53844
step
Enter the building |goto 35.24,47.75 < 15 |walk
talk Brann Bronzebeard##145462
|tip Inside the building.
turnin Recruiting the Furnace Master##53844 |goto 35.00,48.67
accept Earthen Blessing##53842 |goto 35.00,48.67
step
Leave the building |goto 35.22,47.74 < 10 |walk
Enter the building |goto Ironforge/0 44.54,49.53 < 10 |walk
Follow the path down |goto Ironforge/0 44.21,51.97 < 7 |walk
Continue down the path |goto Ironforge/1 79.81,87.01 < 7 |c |q 53842
step
Continue down the path |goto 80.33,52.98 < 10 |walk
Run up the stairs |goto 58.14,49.72 < 10 |walk
Run up the stairs |goto 45.51,68.79 < 10 |walk
click Remnant of the Earthen Ritual
|tip Downstairs inside the cave.
collect Remnant of the Earthen Ritual##164960 |q 53842/1 |goto 36.01,54.06
step
Run down the stairs |goto 51.54,68.20 < 10 |walk
Follow the path up |goto 63.77,48.33 < 10 |walk
Continue up the path |goto 81.44,55.68 < 10 |walk
Continue up the path |goto Ironforge/0 46.18,58.82 < 7 |c |q 53842
step
Continue up the path |goto 46.10,52.41 < 10 |walk
Leave the building |goto 44.54,49.53 < 10 |walk
talk Bouldercrag the Rockshaper##145866
turnin Earthen Blessing##53842 |goto 49.15,45.83
step
talk Grumnus Steelshaper##5164
accept Forging the Armor##53845 |goto 48.76,45.78
step
Watch the dialogue
|tip Use the "Empowered Stoneform" ability.
|tip It appears as a button on the screen.
Help Bouldercrag's Ritual |q 53845/1 |goto 48.97,45.15
step
click Pile of Ancient Metal
Carry the Ancient Metal |havebuff Carry Ancient Metal##284908 |goto 49.57,44.37 |q 53845
step
Watch the dialogue
Present Ignis the Armor Shards |q 53845/2 |goto 51.41,44.01
step
click Molten Metal
|tip In the pool of yellow molten metal.
Carry the Molten Metal |havebuff Carry Molten Metal##284955 |goto 51.96,43.78 |q 53845
step
Watch the dialogue
Bring the Molten Metal to the Great Anvil |q 53845/3 |goto 50.14,43.99
step
Forge the Bulwark of the Mountain Kings |q 53845/4 |goto 50.14,43.99
|tip Use the "Forge!" ability.
|tip It appears as a button on the screen.
step
click Bulwark of the Mountain King
collect Bulwark of the Mountain King##165704 |q 53845/5 |goto 49.70,43.76
step
talk Grumnus Steelshaper##5164
turnin Forging the Armor##53845 |goto 46.11,50.18
step
talk Brann Bronzebeard##145462
accept Legacy of the Bronzebeard##53846 |goto 45.85,49.98
step
Enter the building |goto 44.46,49.62 < 10 |walk
talk Muradin Bronzebeard##42928
|tip Inside the building.
turnin Legacy of the Bronzebeard##53846 |goto 39.17,56.10
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Gnome Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Gnome Heritage Armor.",
patch='80200',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Gnome Character |complete Gnome and level >= 50
|tip You must complete this on a 50+ Gnome character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Ace Pilot Stormcog##147939
accept Shifting Gears##54402 |goto Stormwind City/0 54.67,18.53
step
talk Captain Tread Sparknozzle##147943
turnin Shifting Gears##54402 |goto New Tinkertown/0 41.77,31.62
accept Gnomeregan's Finest##54576 |goto 41.77,31.62
step
talk Fizzi Tinkerbow##147952
Tell her _"Report, Tinker!"_
Speak with Fizzi Tinkerbow |q 54576/2 |goto 37.95,33.93
step
talk Emaedi Autoblast##147491
|tip Upstairs inside the building.
Choose _<Introduce yourself.>_
Speak with Emaedi Autoblast |q 54576/1 |goto 38.19,38.91
step
talk Cog Captain Winklespring##147950
Choose _<Introduce yourself.>_
Speak with Cog Captain Winklespring |q 54576/3 |goto 40.27,38.07
step
talk Captain Tread Sparknozzle##147943
turnin Gnomeregan's Finest##54576 |goto 41.77,31.62
accept Shadowed Halls and Dusty Cogs##54577 |goto 41.77,31.62
step
Enter the tunnel |goto 32.48,36.97 < 20 |walk
Follow the path |goto 53.96,81.62 < 15 |walk
Run down the stairs |goto 54.13,45.77 < 10 |walk
Follow the path |goto 54.81,15.19 < 10 |walk
click Workshop Door
Enter Gnomeregan Through the Workshop |goto Gnomeregan Heritage/0 84.92,59.41 |c |noway |q 54577
step
Follow the path |goto 74.88,64.99 < 15 |walk
Continue following the path |goto 73.72,73.40 < 15 |walk
Continue following the path |goto 63.69,72.11 < 15 |only if walking
click Workshop Door
Enter the Workshop |goto 53.79,65.67 < 15 |c |q 54577
|tip Avoid broken robots and steam vents along the way.
step
Follow the path |goto 50.38,88.86 < 10 |walk
Continue following the path |goto 36.08,86.04 < 10 |walk
click Prototype Arcane Engine
Collect the Prototype Arcane Engine |q 54577/2 |goto 35.95,73.04
step
click Broken Teleporter |goto 37.77,72.25
Leave Gnomeregan |goto New Tinkertown/0 38.46,32.97 < 1000 |c |q 54577
step
talk Captain Tread Sparknozzle##147943
turnin Shadowed Halls and Dusty Cogs##54577 |goto 41.77,31.62
accept A Tundra Conundrum##54580 |goto 41.77,31.62
step
talk Cog Captain Winklespring##147950
turnin A Tundra Conundrum##54580 |goto Borean Tundra/0 55.36,18.81
step
talk Fizzi Tinkerbow##147952
accept Now With More Mechanical Fowl##54581 |goto 55.30,18.97
step
Kill Ironbound enemies around this area
|tip Click the "Prototype Bomber Gun" ability on-screen to instantly kill them.
Slay #10# Ironbound Brute |q 54581/1 |goto 63.07,22.46
step
Click the Complete Quest Box
turnin Now With More Mechanical Fowl##54581
accept Smarter Than Your Average Trogg##54582
step
kill Krugg the Smart##148028 |q 54582/1 |goto 64.63,23.10
step
collect Broken Communication Device##166584 |q 54582/2 |goto 64.62,23.08
|tip Loot it from Krugg's corpse.
step
talk Fizzi Tinkerbow##147952
turnin Smarter Than Your Average Trogg##54582 |goto 55.30,18.97
accept The Gnome Behind the Trogg##54579 |goto 55.30,18.97
step
click RCV Control Switch
Activate the RCV Control Switch |q 54579/1 |goto 55.27,18.96
step
talk Fizzi Tinkerbow##147952
turnin The Gnome Behind the Trogg##54579 |goto 55.30,18.97
accept A Signal in Storm Peaks##54639 |goto 55.30,18.97
step
clicknpc First Squadron Prototype##149278
Jump in the First Squadron Prototype |q 54639/1 |goto 55.19,18.83
step
Watch the dialogue
Fly to Storm Peaks |outvehicle |q 54639
step
talk Cog Captain Winklespring##147950
turnin A Signal in Storm Peaks##54639 |goto The Storm Peaks/0 37.60,60.23
accept Gnomercy!##54640 |goto 37.60,60.23
step
clicknpc Shrinkified Assault Tank##149328
De-Shrinkify the Assault Tank |q 54640/1 |goto 37.42,60.53
step
clicknpc Gnomeregan Assault Tank##148931
Commandeer the Assault Tank |q 54640/2 |goto 37.42,60.53
step
Kill enemies around this area
|tip Use the abilities on your action bar.
Slay #30# Ironbound Invaders |q 54640/3 |goto 38.00,57.66
step
Arrive at the Terrace of the Makers |goto 56.27,51.40 < 100 |c |noway |q 54640
step
talk Cog Captain Winklespring##147950
turnin Gnomercy!##54640 |goto 56.13,51.42
accept Operation: Troggageddon##54850 |goto 56.13,51.42
step
clicknpc First Squadron Prototype##149520
Jump in the First Squadron Prototype |q 54850/1 |goto 56.18,51.52
step
Kill enemies around this area
|tip Use the abilities on your action bar.
Defeat Sparkspanner's Army |q 54850/2 |goto 45.23,38.58
step
Click the Complete Quest Box
turnin Operation: Troggageddon##54850
step
talk Cog Captain Winklespring##149503
|tip Next to you in the plane.
accept For Gnomeregan!##54641
step
Watch the dialogue
Enter the Halls of Stone |q 54641/1
step
Run down the stairs |goto HoS Heritage/1 49.98,27.71 < 20 |walk
kill Smasher X900##149394 |q 54641/2 |goto 50.04,12.12
step
talk Cog Captain Winklespring##149503
turnin For Gnomeregan!##54641 |goto 50.06,12.65
accept G.E.A.R. Up##54642 |goto 50.06,12.65
step
click Teleporter |goto 48.34,10.51
Leave the Halls of Stone |goto The Storm Peaks/0 39.66,26.93 < 1000 |c |noway |q 54642
step
talk Captain Tread Sparknozzle##147943
turnin G.E.A.R. Up##54642 |goto New Tinkertown/0 41.77,31.62
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Human Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Human Heritage Armor.",
patch='100007',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Human Character |complete Human and level >= 50
|tip You must complete this on a 50+ Human character.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept An Urgent Matter##72644 |goto Stormwind City/0 43.84,73.32
|tip You will accept this quest automatically.
|tip If you reached level 50 recently and haven't logged out since, you may need to do so or the quest may not appear.
step
talk Master Mathias Shaw##198884
turnin An Urgent Matter##72644 |goto 87.45,30.80
accept An Unlikely Informant##72405 |goto 87.45,30.80
step
Enter the building |goto Elwynn Forest/0 43.01,65.65 < 7 |walk
talk Master Mathias Shaw##198896
|tip Downstairs inside the building.
Choose _"<Tell Shaw to signal his informant.>"_
Watch the Dialogue
Meet Shaw in the Lion's Pride Inn Basement |q 72405/1 |goto 44.33,66.22
step
talk Master Mathias Shaw##198896
|tip Downstairs inside the building.
turnin An Unlikely Informant##72405 |goto 44.33,66.22
accept A Window to the Past##72408 |goto 44.33,66.22
step
talk Master Mathias Shaw##198896
|tip Downstairs inside the building.
Choose _"<Tell Shaw you are ready to hear about the history of the Drakefire Amulet.>"_
Speak with Shaw |q 72408/1 |goto 44.33,66.22
step
talk Vanessa VanCleef##198883
|tip Downstairs inside the building.
turnin A Window to the Past##72408 |goto 44.34,66.05
accept Rotten Old Memories##72409 |goto 44.34,66.05
step
talk Ragged John##9563
Ask him _"The Drakefire Amulet has been stolen. Did Windsor have any other information on it or Onyxia?"_
Speak to Ragged John |q 72409/1 |goto Burning Steppes/0 72.85,64.78
step
Enter the cave |goto Burning Steppes/0 62.07,64.44 < 10 |walk
click Hoarded Debris##384644
collect 1 Chewed Piece of Journal##202106 |q 72409/2 |goto 61.24,65.27
step
click Hoarded Debris##384644
collect 2 Chewed Piece of Journal##202106 |q 72409/2 |goto 60.25,66.23
step
click Hoarded Debris##384644
collect 3 Chewed Piece of Journal##202106 |q 72409/2 |goto 61.22,67.23
step
click Hoarded Debris##384644
collect 4 Chewed Piece of Journal##202106 |q 72409/2 |goto 61.74,66.73
step
talk Ragged John##9563
turnin Rotten Old Memories##72409 |goto 72.85,64.78
accept Looking for Something Specific##72424 |goto 72.85,64.78
step
Enter the building |goto Elwynn Forest/0 43.01,65.65 < 7 |walk
talk Master Mathias Shaw##198896
|tip Downstairs inside the building.
turnin Looking for Something Specific##72424 |goto 44.33,66.22
accept The New Clessington Estate##72426 |goto 44.33,66.22
step
Enter the building |goto Duskwood/0 18.03,55.23 < 7 |walk
talk Cecilia Clessington##198912
|tip Upstairs inside the building.
Ask her _"What do you know about the Drakefire Amulet?"_
Investigate the Clessington Manor |q 72426/1 |goto 18.07,54.01
step
Escort Cecilia from the building |q 72426/2 |goto 18.35,54.99
|tip Kill the attackers that appear.
step
talk Cecilia Clessington##198912
Choose _"<Tell Cecilia that the Drakefire Amulet has been stolen.>"_
Watch the Dialogue
Explain the Circumstances to Cecilia |q 72426/3 |goto 18.34,55.08
step
talk Cecilia Clessington##198912
turnin The New Clessington Estate##72426 |goto 18.34,55.08
step
talk Vanessa VanCleef##198883
accept Misdeeds in Moonbrook##72430 |goto 18.31,54.97
step
talk Vanessa VanCleef##198923
turnin Misdeeds in Moonbrook##72430 |goto Westfall/0 46.76,66.90
accept A Hungry Heritage##72431 |goto 46.72,66.98
step
talk Cecilia Clessington##198922
accept Supply Only the Finest Goons##72432 |goto 46.73,66.75
stickystart "Kill_16_Clessington_Attendants"
step
Enter the Defias Hideout |q 72431/1 |goto Westfall/0 42.56,71.86
step
Run up the stairs |goto Westfall/0 43.38,71.92 < 7 |walk
Jump down here |goto 43.41,72.88 < 7 |walk
Jump down here |goto 64.72,25.10 < 7 |walk
Follow the path |goto 55.78,39.40 < 10 |walk
Find Count Clessington |q 72431/2 |goto 60.41,60.59
step
Next to You:
talk Vanessa VanCleef##199598
turnin A Hungry Heritage##72431
accept Betrayal of the Brotherhood##72453
step
label "Kill_16_Clessington_Attendants"
Follow the path |goto 47.40,47.24 < 7 |walk |notinsticky
Continue following the path |goto 57.32,37.63 < 7 |walk |notinsticky
Run up the ramp |goto 58.62,13.30 < 7 |walk |notinsticky
Continue up the ramp |goto 43.62,72.89 < 7 |walk |notinsticky
Leave the building |goto Westfall/0 42.57,71.89 < 7 |walk |notinsticky
extraaction VanCleef's Elixir of Speed##397607 |notinsticky
|tip It appears as a button on the screen. |notinsticky
kill 16 Clessington Attendant##198925 |q 72432/1 |goto 43.18,70.55
step
Escape the Defias Hideout |q 72453/1 |goto 46.68,66.82
step
talk Vanessa VanCleef##198923
turnin Betrayal of the Brotherhood##72453 |goto 46.66,66.78
step
talk Cecilia Clessington##198922
turnin Supply Only the Finest Goons##72432 |goto 46.74,66.74
step
talk Master Mathias Shaw##198924
accept To Northshire##72445 |goto 46.70,66.71
step
talk Master Mathias Shaw##198983
turnin To Northshire##72445 |goto Northshire/0 27.93,66.68
accept Knock It Off!##72449 |goto 27.93,66.68
step
talk Marshal McBride##198990
accept What's Their Problem?##72446 |goto 27.67,66.68
stickystart "Defend_Northshire"
step
kill Enforcer Grant##202508
collect 1 Enforcer Grant's Signet##202238 |q 72449/1 |goto 35.70,60.94
step
kill Enforcer Jennive##199003
collect 1 Enforcer Jennive's Signet##204171 |q 72449/2 |goto 49.47,63.13
step
kill Enforcer Tera##202509
collect 1 Enforcer Tera's Signet##204172 |q 72449/3 |goto 35.33,38.85
step
kill Enforcer Horb##202511
collect 1 Enforcer Horb's Signet##204173 |q 72449/4 |goto 31.34,17.75
step
label "Defend_Northshire"
Kill Defias enemies around this area
Defend Northshire |q 72446/1 |goto 31.93,33.46
step
talk Marshal McBride##198990
turnin What's Their Problem?##72446 |goto 27.69,66.64
step
talk Master Mathias Shaw##198983
turnin Knock It Off!##72449 |goto 27.89,66.75
step
talk Cecilia Clessington##198984
accept The Clessington Will##72450 |goto 28.05,67.22
step
click Shadow Barrier
Dispel the Barrier |q 72450/1 |goto 35.49,51.73
step
Watch the Dialogue
Kill enemies that spawn
extraaction Will to Survive##59752
|tip Use the button that appears to resist.
kill Count Clessington##199006 |q 72450/2 |goto 37.66,50.29
step
talk Cecilia Clessington##198984
turnin The Clessington Will##72450 |goto 37.56,50.11
step
talk Master Mathias Shaw##198983
accept Will to Survive##72451 |goto 36.47,51.12
step
click Drakefire Amulet##384651
collect 1 Drakefire Amulet##204214 |q 72451/1 |goto 37.55,50.51
step
talk Master Mathias Shaw##198983
Choose _"<Give Shaw the Drakefire Amulet.>"_
Watch the Dialogue
Give the Amulet to Shaw |q 72451/2 |goto 36.47,51.08
step
extraaction Will to Survive##59752
|tip Use the button that appears to resist.
Resist |q 72451/3 |goto 36.48,51.08
step
kill Shade of Onyxia##199008 |q 72451/4 |goto 36.66,50.79
step
talk Vanessa VanCleef##198988
turnin Will to Survive##72451 |goto 36.58,51.37
step
talk Master Mathias Shaw##198983
accept Go with Honor, Friend##72452 |goto 36.74,51.16
step
talk Master Mathias Shaw##198884
Tell him _"I am ready."_
Meet Shaw Outside of Stormwind |q 72452/1 |goto Stormwind City/0 71.05,85.77
step
Approach General Hammond Clay |q 72452/2 |goto 69.52,83.38
step
extraaction Honor of the Lionguard##398746
|tip It appears as a button on the screen.
Receive the Honor |q 72452/3 |goto 69.39,83.14
step
talk General Hammond Clay##65153
turnin Go with Honor, Friend##72452 |goto 69.20,82.75
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Night Elf Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Night Elf Heritage Armor.",
patch='100107',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Night Elf Character |complete NightElf and level >= 50
|tip You must complete this on a 50+ Night Elf character.
|tip Refer to our various leveling guides to help you accomplish this.
step
click Sealed Kaldorei Scroll
|tip Inside the building.
accept The Clarion Call##75890 |goto Stormwind City/0 52.30,14.19
step
talk Arko'narin Starshade##207353
turnin The Clarion Call##75890 |goto 52.33,4.52
accept Ancient Curses##75891 |goto 52.33,4.52
step
Meet Maiev Shadowsong in Felwood |q 75891/1 |goto Felwood/0 37.50,60.28
|tip This may take a minute to complete.
step
talk Maiev Shadowsong##202702
turnin Ancient Curses##75891 |goto 37.50,60.28
accept A Grim Portent##76194 |goto 37.50,60.28
step
talk Arko'narin Starshade##202701
Ask her _"Tell me why we're here in Felwood, Arko'narin?"_
Watch the dialogue
Speak with Arko'narin |q 76194/1 |goto 37.46,60.34
step
talk Maiev Shadowsong##202702
turnin A Grim Portent##76194 |goto 37.51,60.28
step
talk Arko'narin Starshade##202701
accept Mercy or Misery##76196 |goto 37.46,60.34
step
talk Lysander Starshade##202700
accept Countering Corruption##76195 |goto 37.49,60.35
stickystart "Kill_Enemies_in_Jaedenar"
step
Kill Feltouched enemies around this area
use the Incanter's Tome##207004
|tip Use it on enemy Feltouched corpses.
Neutralize #6# Satyr Corpses |q 76195/1 |goto 36.17,60.26
step
label "Kill_Enemies_in_Jaedenar"
Kill enemies around this area
Kill #15# Enemies in Jaedenar |q 76196/1 |goto 36.17,60.26
step
talk Maiev Shadowsong##202702
|tip Inside the building.
turnin Countering Corruption##76195 |goto 36.15,57.89
turnin Mercy or Misery##76196 |goto 36.15,57.89
accept Stepping into the Shadows##76203 |goto 36.15,57.89
step
talk Maiev Shadowsong##202702
|tip Inside the cave.
Tell her _"Let's put a stop to this, Warden."_
Speak with Maiev Shadowsong |q 76203/1 |goto 36.15,57.89
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 36.18,56.85 |count 1
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 36.82,56.17 |count 2
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 37.06,55.37 |count 3
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 37.16,54.66 |count 4
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 37.92,54.77 |count 5
step
click Felflame Brazier
|tip Inside the cave.
|tip Follow Maiev closely and stay in her bubble.
Extinguish the Felflame Braziers |q 76203/2 |goto 38.45,54.40 |count 6
step
Discover What Lurks in the Depths of Shadow Hold |q 76203/3 |goto 38.05,53.67
|tip Inside the cave.
|tip Wait for Maive to walk with you.
step
talk Maiev Shadowsong##202702
|tip Inside the cave.
turnin Stepping into the Shadows##76203 |goto 38.05,53.67
accept A Glimpse of Terror##76197 |goto 38.05,53.67
step
kill Cultist Nethus##205940 |q 76197/1 |goto 37.83,52.77
|tip Inside the cave.
step
talk Maiev Shadowsong##202702
|tip Inside the cave.
turnin A Glimpse of Terror##76197 |goto 36.71,51.59
accept Balancing the Scales##76205 |goto 36.71,51.59
step
talk Lysander Starshade##202700
|tip Inside the cave.
accept Heart of the Issue##76206 |goto 36.68,51.65
stickystart "Slay_Enemies_in_Shadow_Hold"
step
click Portal to the Twisting Nether
|tip Kill enemies that attack inside the cave.
Close the Portal |q 76206/1 |goto 39.02,50.30 |count 1
step
Cross the bridge |goto 40.50,48.94 < 7 |walk
|tip Continue down into the cave.
click Portal to the Twisting Nether
|tip Kill enemies that attack inside the cave.
Close the Portal |q 76206/1 |goto 41.17,48.41 |count 2
step
click Portal to the Twisting Nether
|tip Kill enemies that attack inside the cave.
|tip Under the bridge you crossed.
Close the Portal |q 76206/1 |goto 41.04,49.60 |count 3
step
click Portal to the Twisting Nether
|tip Kill enemies that attack inside the cave.
Close the Portal |q 76206/1 |goto 39.29,46.94 |count 4
step
label "Slay_Enemies_in_Shadow_Hold"
Kill enemies around this area
|tip Inside the cave.
Slay Enemies in Shadow Hold |q 76205/1 |goto 39.52,46.92
step
talk Maiev Shadowsong##202702
|tip Inside the cave.
turnin Balancing the Scales##76205 |goto 37.97,46.19
step
talk Arko'narin Starshade##202701
|tip Inside the cave.
turnin Heart of the Issue##76206 |goto 37.92,46.25
accept Wardens' Wrath##76207 |goto 37.92,46.25
step
talk Maiev Shadowsong##208120
|tip Inside the cave.
Tell her _"Let's end this, Warden."_
Signal Maiev |q 76207/1 |goto 38.57,46.60
step
Kill enemies that attack in waves
|tip Inside the cave.
Protect Lysander |q 76207/2 |goto 38.21,47.50
step
talk Lysander Starshade##202700
turnin Wardens' Wrath##76207 |goto 35.92,58.85
step
talk Maiev Shadowsong##208151
accept A Mark For A Protector##76212 |goto 35.93,58.95
step
Take Your Position |q 76212/1 |goto 35.82,58.76
step
extraaction Observe the Ceremony##421556
Watch the dialogue
Witness the Facial Marking Ceremony |q 76212/2 |goto 35.81,58.77
step
click Portal to Stormwind |goto 35.97,58.87
Return to Stormwind |goto Stormwind City/0 46.35,90.23 < 1000 |c |noway |q 76212
step
talk Lysander Starshade##209141
turnin A Mark For A Protector##76212 |goto 52.43,4.48
step
talk Maiev Shadowsong##209140
accept Honor of the Goddess##76213 |goto 52.65,3.87
step
Watch the dialogue
talk Maiev Shadowsong##209140
turnin Honor of the Goddess##76213 |goto 52.65,3.87
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Worgen Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Worgen Heritage Armor.",
patch='80300',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Worgen Character |complete Worgen and level >= 50
|tip You must complete this on a 50+ Worgen character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Courier Claridge##150200
accept The Shadow of Gilneas##54976 |goto Stormwind City/0 54.67,18.53
step
talk Princess Tess Greymane##155313
turnin The Shadow of Gilneas##54976 |goto 82.50,28.07
step
talk Mia Greymane##151784
accept Into Duskwood##54977 |goto 82.35,27.76
step
talk Vassandra Stormclaw##151761
turnin Into Duskwood##54977 |goto Duskwood/0 18.10,57.23
accept Bane of the Nightbane##54980 |goto 18.10,57.23
step
Place the Pungent Meat
|tip Use the ability that appears on-screen.
kill Bloodeyes##150721
Subdue Bloodeyes |q 54980/2 |goto 51.99,61.59
step
Bring Bloodeyes to Raven Hill |q 54980/3 |goto 18.12,57.25
step
talk Vassandra Stormclaw##151761
turnin Bane of the Nightbane##54980 |goto 18.08,57.23
accept Cry to the Moon##54981 |goto 18.08,57.23
accept The Spirit of the Hunter##54982 |goto 18.08,57.23
stickystart "Collect_Bloodstained_Fangs"
step
click Elune's Grace##321836
collect Elune's Grace##167032 |q 54981/1 |goto 82.35,33.95
step
label "Collect_Bloodstained_Fangs"
kill Bloodeyes##150721+
collect 6 Bloodstained Fangs##167031 |q 54982/1 |goto 78.57,34.61
step
talk Vassandra Stormclaw##151761
turnin Cry to the Moon##54981 |goto 46.39,36.90
turnin The Spirit of the Hunter##54982 |goto 46.39,36.90
accept Waking a Dreamer##54983 |goto 46.39,36.90
step
talk Vassandra Stormclaw##151761
Tell her _"Begin the ritual."_
Speak with Vassandra Stormclaw |q 54983/1 |goto 46.39,36.90
step
Kill enemies that attack in waves
Defend Vassandra during the ritual |q 54983/2 |goto 46.60,36.54
step
Watch the dialogue
talk Goldrinn##150106
turnin Waking a Dreamer##54983 |goto 46.57,36.55
accept Let Sleeping Wolves Lie##54984 |goto 46.57,36.55
step
Enter the Emerald Dream |scenariostart |goto 46.57,35.47 |q 54984
step
talk Princess Tess Greymane##150851
Choose _<Give her a good wake-up slap.>_
Watch the dialogue
Wake Tess |scenariogoal 1/44887 |goto Gilneas Scenario/0 65.89,21.00 |q 54984
step
Kill enemies around this area
click Plague Thrower+
|tip They look like large catapaults on the ground around this area.
Push back the Forsaken assault force |scenariostage 2 |goto 59.99,27.67 |q 54984
step
kill Dark Ranger Thyala##150498 |scenariostage 3 |goto 60.15,40.32 |q 54984
step
Run down the stairs |goto 69.23,45.39 < 10 |walk
Run down the stairs |goto 69.17,64.70 < 10 |walk
Run up the stairs |goto 66.06,65.15 < 10 |walk
kill Nathanos Blightcaller##152329
Follow Nathanos's Trail |scenariogoal 4/44890 |goto 67.16,79.63 |q 54984
|tip Kill enemies that attack along the way and attack Nathanos when he stops.
|tip Use the action button that appears on-screen to track Nathanos.
step
kill Nathanos Blightcaller##152329 |scenariogoal 5/44891 |goto 58.98,63.82 |q 54984
step
Follow the path |goto 62.54,81.51 < 15 |walk
Continue following the path |goto 40.53,82.09 < 15 |walk
Follow Tess |scenariogoal 6/44892 |goto 31.58,73.29 |q 54984
step
kill Essence of Rage##150495 |scenariogoal 7/44893 |goto 34.15,65.78 |q 54984
step
click Dream Rift
Leave the Emerald Dream |goto 33.63,67.81 > 200 |c |q 54984
step
talk Princess Tess Greymane##150115
turnin Let Sleeping Wolves Lie##54984 |goto Duskwood/0 46.33,37.07
accept The New Guard##54990 |goto 46.33,37.07
step
talk Princess Tess Greymane##155313
Choose _<Take a knee.>_
Speak with Tess at Stormwind Keep |q 54990/1 |goto Stormwind City/0 82.49,28.06
step
Watch the dialogue
talk Princess Tess Greymane##155313
turnin The New Guard##54990 |goto 82.49,28.06
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Dark Iron Dwarf Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Dark Iron Dwarf Heritage Armor.",
patch='80001',
achieveid={13076},
},[[
step
Unlock the Dark Iron Dwarf Race |achieve 12515
|loadguide "Leveling Guides\\Allied Races\\Dark Iron Dwarf Race Unlock"
step
Raise a New Dark Iron Dwarf Character to Level 50 |achieve 13076
|tip Earn the "Heritage of the Dark Iron" achievement.
|tip To earn this achievement, create a new Dark Iron Dwarf character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage o' the Dark Iron##51483
|tip You will accept this quest automatically.
step
talk Moira Thaurissan##144152
turnin Heritage o' the Dark Iron##51483 |goto Shadowforge City/0 56.42,31.85
step
talk Anvil-Thane Thurgaden##144154
accept The Anvil-Thane's Designs##63494 |goto Shadowforge City/0 57.22,31.97
step
Run up the ramp |goto 62.15,23.27 < 15 |only if walking
Run up the ramp |goto 66.69,26.68 < 15 |only if walking
Follow the path |goto 63.59,30.91 < 15 |only if walking
Enter the building |goto 53.54,33.84 < 7 |only if walking
talk Strongarm Jarden##176828
turnin The Anvil-Thane's Designs##63494 |goto 51.79,33.15
accept Brawl or Brew##63498 |goto 51.79,33.15
step
talk Strongarm Jarden##176828
Choose _"Brawl."_
|tip She will attack you.
Choose Brawl or Brew |q 63498/1 |goto 51.79,33.15
step
kill Strongarm Jarden##176828 |q 63498/2 |goto 51.84,33.04
|tip Defeat her in combat.
step
talk Strongarm Jarden##176828
turnin Brawl or Brew##63498 |goto 51.83,33.07
step
accept It's Called Borrowing##63501 |goto 51.83,33.07
|tip You will accept this quest automatically.
step
Jump down here |goto 49.76,33.64 < 7 |walk
kill Boiling Flamebringer##176995
collect 1 Boiling Flamecore##184916 |q 63501/2 |goto 48.78,29.36
step
Run up the ramp |goto 51.43,37.46 < 7 |walk
click Darkforged Ingot##367037
collect 1 Darkforged Ingot##184915 |q 63501/1 |goto Shadowforge City/0 54.21,26.93
step
click Darkforged Ingot##367037
collect 2 Darkforged Ingot##184915 |q 63501/1 |goto 59.76,28.59
step
click Darkforged Ingot##367037
collect 3 Darkforged Ingot##184915 |q 63501/1 |goto 66.43,30.56
step
click Darkforged Ingot##367037
collect 4 Darkforged Ingot##184915 |q 63501/1 |goto 67.59,28.38
step
click Darkforged Ingot##367037
collect 5 Darkforged Ingot##184915 |q 63501/1 |goto 63.79,20.30
step
talk Kasea Angerforge##144119
|tip She walks around this area.
Tell her _"I need Thurgaden's Flamepoint Engraver."_
Retreive the Flamepoint Engraver |q 63501/3 |goto 47.33,47.65
step
talk Anvil-Thane Thurgaden##144154
turnin It's Called Borrowing##63501 |goto 57.22,31.97
accept Weapons o' the Dark Iron##63502 |goto 57.22,31.97
step
talk Anvil-Thane Thurgaden##144154
Tell him _"I am ready."_
Speak to Anvil-Thane Thurgaden |q 63502/1 |goto 57.22,31.97
step
click Darkforged Ingot
Place the Darkforged Ingot |q 63502/2 |goto 56.69,31.32
step
Watch the dialogue
Complete the Forging |q 63502/3 |goto 56.69,31.32
step
talk Anvil-Thane Thurgaden##144154
turnin Weapons o' the Dark Iron##63502 |goto 57.23,31.97
accept Delivery for Kasea##65563 |goto 57.23,31.97
step
talk Kasea Angerforge##144119
|tip She walks around this area.
turnin Delivery for Kasea##65563 |goto 47.33,47.65
accept Good Fiery Boy##65564 |goto 47.33,47.65
step
click Blackrock Ball
|tip Throw it a short distance on the ground.
Play Fetch |q 65564/2 |goto 47.27,47.86 |count 1
step
click Blackrock Ball
|tip Throw it a short distance on the ground.
Play Fetch Again |q 65564/2 |goto 47.27,47.86 |count 2
step
clicknpc Grimhowl##185305
Pet Grimhowl |q 65564/1 |goto 47.13,48.12
step
click Crate of Provisions##375827
collect 1 Charred Steak##190606 |goto 46.12,50.09 |q 65564
step
click Crate of Provisions##375827
collect 2 Charred Steak##190606 |goto 47.25,42.39 |q 65564
step
click Crate of Provisions##375827
collect 3 Charred Steak##190606 |goto 47.70,42.30 |q 65564
step
click Crate of Provisions##375827
collect 4 Charred Steak##190606 |goto 50.46,43.21 |q 65564
step
use the Charred Steak##190606
Feed Grimhowl #4# Times |q 65564/3 |goto 47.15,48.09
step
extraaction Apply Blackrock Barding##367727
|tip Apply it to Grimhowl.
Apply the Blackrock Barding |q 65564/4 |goto 47.14,48.09
step
talk Kasea Angerforge##144119
|tip She walks around this area.
turnin Good Fiery Boy##65564 |goto 47.33,47.65
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Kul Tiran Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Kul Tiran Heritage Armor.",
patch='80105',
achieveid={13504},
},[[
step
Unlock the Kul Tiran Race |achieve 13163
|loadguide "Leveling Guides\\Allied Races\\Kul Tiran Race Unlock"
step
Raise a New Kul Tiran Character to Level 50 |achieve 13504
|tip Earn the "Heritage of the Kul Tirans" achievement.
|tip To earn this achievement, create a new Kul Tiran character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Kul Tiran##53722
|tip You will accept this quest automatically.
step
talk Katherine Proudmoore##150941
turnin Heritage of the Kul Tiran##53722 |goto Boralus/0 43.95,62.60
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Lightforged Draenei Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Lightforged Draenei Heritage Armor.",
patch='70305',
achieveid={12414},
},[[
step
Unlock the Lightforged Draenei Race |achieve 12243
|loadguide "Leveling Guides\\Allied Races\\Lightforged Draenei Race Unlock"
step
Raise a New Lightforged Draenei Character to Level 50 |achieve 12414
|tip Earn the "Heritage of the Lightforged" achievement.
|tip To earn this achievement, create a new Lightforged Draenei character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Lightforged##49782
|tip You will accept this quest automatically.
step
click Lightforged Beacon |goto Stormwind City/0 54.41,14.37
Teleport to the Vindicaar |goto Vindicaar Scenario/1 |c |noway
step
talk Captain Fareeya##130993
turnin Heritage of the Lightforged##49782 |goto Vindicaar Scenario/1 42.93,24.08
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Mechagnome Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Mechagnome Heritage Armor.",
patch='80300',
achieveid={14014},
},[[
step
Unlock the Mechagnome Race |achieve 14013
|loadguide "Leveling Guides\\Allied Races\\Mechagnome Race Unlock"
step
Raise a New Mechagnome Character to Level 50 |achieve 14014
|tip Earn the "Heritage of the Mechagnome" achievement.
|tip To earn this achievement, create a new Mechagnome character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Mechagnome##58436
|tip You will accept this quest automatically.
step
talk Prince Erazmin##158145
turnin Heritage of the Mechagnome##58436 |goto Mechagon Island/0 74.12,37.01
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Void Elf Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Void Elf Heritage Armor.",
patch='70305',
achieveid={12291},
},[[
step
Unlock the Void Elf Race |achieve 12242
|loadguide "Leveling Guides\\Allied Races\\Void Elf Race Unlock"
step
Raise a New Void Elf Character to Level 50 |achieve 12291
|tip Earn the "Heritage of the Void" achievement.
|tip To earn this achievement, create a new Void Elf character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Void##49928
|tip You will accept this quest automatically.
step
talk Alleria Windrunner##131345
turnin Heritage of the Void##49928 |goto Telogrus Rift/0 28.54,22.27
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Dark Iron Dwarf Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('DarkIronDwarf') and not raceclass('DeathKnight') end,
condition_valid_msg="Dark Iron Dwarf only.",
condition_suggested=function() return raceclass('DarkIronDwarf') and level < 10.5 and not completedq(53500) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Moira Thaurissan##144152
accept Fer the Alliance##51486 |goto Shadowforge City/0 56.43,31.84
step
talk Ambassador Moorgard##133362
turnin Fer the Alliance##51486 |goto Stormwind City/0 53.06,15.26
accept Stranger in a Strange Land##53500 |goto Stormwind City/0 53.06,15.26
step
talk Chromie##167032
Find Chromie |q 53500/1 |goto 56.26,17.32
step
talk Mudrik Leger##143978
turnin Stranger in a Strange Land##53500 |goto 56.19,17.69
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Kul Tiran Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('KulTiran') and not raceclass('DeathKnight') end,
condition_valid_msg="Kul Tiran only.",
condition_suggested=function() return raceclass('KulTiran') and level < 10.5 and not completedq(55146) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Katherine Proudmoore##150941
|tip Inside the building.
accept For the Alliance##55142 |goto Boralus/0 67.71,21.78
step
click Portal to Stormwind
|tip Inside the building.
Take the Portal to Stormwind |q 55142/1 |goto 70.11,16.79
step
talk Ambassador Moorgard##133362
turnin For the Alliance##55142 |goto Stormwind City/0 53.06,15.26
accept Stranger in a Strange Land##55146 |goto Stormwind City/0 53.06,15.26
step
talk Chromie##167032
Find Chromie |q 55146/1 |goto 56.26,17.32
step
talk Provisioner Fray##150947
turnin Stranger in a Strange Land##55146 |goto 56.19,17.69
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Lightforged Draenei Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('LightforgedDraenei') and not raceclass('DeathKnight') end,
condition_valid_msg="Lightforged Draenei only.",
condition_suggested=function() return raceclass('LightforgedDraenei') and level < 10.5 and not completedq(50313) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Captain Fareeya##130993
accept For the Alliance##49772 |goto Vindicaar Scenario/1 49.22,43.80
step
talk Ambassador Moorgard##133362
turnin For the Alliance##49772 |goto Stormwind City/0 53.06,15.26
accept Stranger in a Strange Land##50313 |goto Stormwind City/0 53.06,15.26
step
talk Chromie##167032
Find Chromie |q 50313/1 |goto 56.26,17.32
step
talk Vindicator Minkey##131334
turnin Stranger in a Strange Land##50313 |goto 56.19,17.69
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Mechagnome Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('Mechagnome') and not raceclass('DeathKnight') end,
condition_valid_msg="Mechagnome only.",
condition_suggested=function() return raceclass('Mechagnome') and level < 10.5 and not completedq(58147) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Gelbin Mekkatorque##159587
accept For the Alliance##58146 |goto Mechagon City/1 18.65,67.50
step
Teleport to Stormwind |q 58146/1 |goto 20.44,59.96
|tip Step onto the grate.
step
talk Ambassador Moorgard##133362
turnin For the Alliance##58146 |goto Stormwind City/0 53.06,15.26
accept Stranger in a Strange Land##58147 |goto Stormwind City/0 53.06,15.26
step
talk Chromie##167032
Find Chromie |q 58147/1 |goto 56.26,17.32
step
talk Lulana##160600
turnin Stranger in a Strange Land##58147 |goto 56.19,17.69
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Void Elf Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('VoidElf') and not raceclass('DeathKnight') end,
condition_valid_msg="Void Elf only.",
condition_suggested=function() return raceclass('VoidElf') and level < 10.5 and not completedq(50305) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Alleria Windrunner##131345
accept For the Alliance##49788 |goto Telogrus Rift/0 28.54,22.27
step
talk Ambassador Moorgard##133362
turnin For the Alliance##49788 |goto Stormwind City/0 53.06,15.26
accept Stranger in a Strange Land##50305 |goto Stormwind City/0 53.06,15.26
step
talk Chromie##167032
Find Chromie |q 50305/1 |goto 56.26,17.32
step
talk Keira Onyxraven##131347
turnin Stranger in a Strange Land##50305 |goto 56.19,17.69
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Allied Race Death Knight Starter",{
author="support@zygorguides.com",
description="This guide will walk you through completing the brief introduction for Pandaren and Allied Race Death Knights.",
condition_suggested=function() return raceclass{'pandaren','voidelf','lightforgeddraenei','darkirondwarf','kultiran','mechagnome'} and raceclass('DeathKnight') and level < 10.5 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass{'pandaren','voidelf','lightforgeddraenei','darkirondwarf','kultiran','mechagnome'} and raceclass('DeathKnight') and level < 10.5 end,
condition_valid_msg="You must be a Pandaren or Allied Race Death Knight to complete this guide!",
condition_end=function() return completedq(58902) end,
startlevel=10,
endlevel=11,
},[[
step
talk The Lich King##163016
accept Death's Power Grows##58877 |goto The Frozen Throne/0 49.51,90.71
step
Swear Fealty |q 58877/1 |goto 49.51,90.71
|tip Use the {o}Swear Fealty{} ability.
|tip It appears as a button on the screen.
step
talk The Lich King##163016
turnin Death's Power Grows##58877 |goto 49.51,90.71
accept Defender of Azeroth##58902 |goto 49.51,90.71
step
talk Highlord Darion Mograine##161709
Tell him _"Reporting for duty."_ |gossip 51183
Speak with Highlord Darion Mograine |q 58902/1 |goto 50.70,71.16
step
click Death Gate
Use the Death Gate |q 58902/3 |goto 49.97,38.80
step
talk Chromie##167032
Talk to Chromie |q 58902/4 |goto Stormwind City/0 56.26,17.30
step
_Click the Complete Quest Box:_
turnin Defender of Azeroth##58902
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Dark Iron Dwarf Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Dark Iron Dwarf allied race.",
condition_suggested=function() return achieved(12510) and not achieved(12515) end,
condition_valid=function() return level >= 50 end,
condition_valid_msg="You must be level 50 or higher to use this guide.",
condition_end=function() return achieved(12515) end,
image=ZGV.IMAGESDIR.."DarkIronDwarfUnlock",
patch='80001',
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
accept The Call for Allies##49929 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin The Call for Allies##49929 |goto Stormwind City/0 52.05,13.40
accept A Choice of Allies##50239 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
click Dark Iron Dwarf
|tip Inside the building.
Learn About the Dark Iron Dwarves |q 50239/3 |goto Stormwind City/0 51.78,13.91
step
click LIghtforged Draenei
|tip Inside the building.
Learn About the Lightforged Draenei |q 50239/1 |goto Stormwind City/0 51.90,13.73
step
click Mechagnome
|tip Inside the building.
Learn About the Mechagnomes |q 50239/5 |goto Stormwind City/0 51.66,13.50
step
click Void Elf
|tip Inside the building.
Learn About the Void Elves |q 50239/2 |goto Stormwind City/0 52.22,13.20
step
click Kul Tiran
|tip Inside the building.
Learn About the Kul Tirans |q 50239/4 |goto Stormwind City/0 52.34,13.04
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin A Choice of Allies##50239 |goto Stormwind City/0 52.05,13.40
accept Blackrock Depths##51813 |goto Stormwind City/0 52.05,13.40
step
talk Moira Thaurissan##133197
|tip Inside the building.
Tell her _"I am ready to go to Blackrock Depths."_ |gossip 48178
Transport to Blackrock Depths |scenariostart Blackrock Depths##1571 |goto Stormwind City/0 51.88,14.05 |q 51813
step
Watch the dialogue
Meet the Dark Iron at the Black Anvil |scenariogoal 1/40480 |goto Blackrock Scenario/0 56.66,31.33 |q 51813
step
click Crate o' Azerite##292617
Pick Up the Azerite Crate |havebuff Carry Azerite Crate##274627 |goto 55.84,31.93 |q 51813
step
click Place Crate o' Azerite##292882
Place the Azerite on the Black Anvil |scenariogoal 2/40528 |goto 56.66,31.33 |q 51813
step
Kill the enemies that attack in waves
Defeat the Azerite Elementals |scenariogoal 3/40527 |goto 56.66,31.33 |q 51813
'|kill Congealed Azerite##139689, Unleashed Azerite##139687, Unbound Azerite##139686
step
Watch the dialogue
Receive Orders from Moira |scenariogoal 4/40540 |goto 57.05,30.34 |q 51813
step
kill 8 Venture Co. Skyscorcher##139268 |scenariogoal 5/40539 |goto 47.51,45.31 |q 51813
step
Kill enemies around this area
|tip {o}Avoid the spiked metal mines{} on the ground.
Defend the Dark Iron Highway |scenariogoal 6/40545 |goto 29.27,56.58 |q 51813
'|kill Azerite Extractor##139272, Wanton Sapper##139267, Fanatical Driller##140504, Venture Co. Earthshaper##139896
step
kill Rixxa Fluxflame##139273 |scenariogoal 7/40547 |goto 35.72,63.83 |q 51813
|tip You only need to get her to {o}about 70% health{}.
step
Return to the Black Anvil |scenariogoal 8/40548 |goto 56.66,31.33 |q 51813
step
Complete the Blackrock Depths Scenario |q 51813/1 |goto 57.04,30.34
step
talk Moira Thaurissan##140309
turnin Blackrock Depths##51813 |goto 57.04,30.34
accept The MOTHERLODE!!: Ironfoe##53351 |goto 57.04,30.34
step
clicknpc Mole Machine to Stormwind##143567
Return to Stormwind |complete zone("Stormwind City") |goto 57.50,30.09 |q 53351
step
talk Moira Thaurissan##133197
|tip Inside the building.
Select  _"I entrust you to handle this mission <Skip the dungeon quest>."_ |gossip 48181
collect Ironfoe##163708 |q 53351/1 |goto Stormwind City/0 51.88,14.05
step
talk Moira Thaurissan##133197
|tip Inside the building.
turnin The MOTHERLODE!!: Ironfoe##53351 |goto Stormwind City/0 51.88,14.05
accept Molten Core##53342 |goto 51.88,14.05
step
Watch the dialogue
|tip Inside the building.
Retrieve a Shocking Amount o' Dark Iron Ingots |q 53342/1 |goto 51.88,14.05
step
talk Moira Thaurissan##133197
|tip Inside the building.
Tell her _"I am ready to go to Molten Core."_ |gossip 48179
Transport to Molten Core |complete subzone("The Molten Core") |goto 51.88,14.05 |q 53342
step
clicknpc The Tank##143390
Board the Tank |invehicle |goto Blackrock Scenario/1 29.15,26.42 |q 53342
step
Follow the path |goto Blackrock Scenario/1 43.38,62.89 < 20 |walk
Ride Through the Molten Core |outvehicle |goto 52.84,65.18 |q 53342
|tip Kill enemies as you travel to this location.
|tip Use the abilities on your action bar.
step
Watch the dialogue
kill Gezzrok the Keeper##143542
|tip Follow the spiral path to get to him.
click Molten Core##297702
|tip It looks like a huge {o}floating ball of lava{} nearby.
collect Fragment o' the Molten Core##163693 |q 53342/2 |goto 56.08,56.67
step
clicknpc Mole Machine to Stormwind##143567
Return to Stormwind |complete zone("Stormwind City") |goto 57.24,59.13 |q 53342
step
talk Moira Thaurissan##133197
|tip Inside the building.
turnin Molten Core##53342 |goto Stormwind City/0 51.88,14.05
accept Firelands##53352 |goto Stormwind City/0 51.88,14.05
step
talk Moira Thaurissan##133197
|tip Inside the building.
Tell her _"I am ready to go to the Firelands."_ |gossip 48180
Travel to the Firelands |complete not zone ("Stormwind City") |goto 51.88,14.05 |q 53352
step
Watch the dialogue
kill Dark Iron Cultist##143645
Speak with the Bridgekeeper |scenariogoal 1/41550 |goto Firelands Scenario/0 49.21,29.52 |q 53352
step
Kill enemies around this area
|tip Inside and outside the building.
|tip Make sure to kill {o}every enemy{} you see.
|tip To get to the building, {o}cross the bridge{} after it {o}appears{}.
Defeat the Cultists and Their Allies |scenariogoal 2/41551 |goto Firelands Scenario/1 50.80,67.20 |q 53352
'|kill Blazing Elemental##143405, Molten Giant##143414, Flamewalker Sentinel##143415, Ancient Core Hound##143416, Dark Iron Cultist##143645, Lava Burster##143648
step
Watch the dialogue
|tip Inside the building.
|tip At the end of the path.
Confront High-Justice Grimstone |scenariogoal 3/41563 |goto Firelands Scenario/1 50.52,20.81 |q 53352
|tip You will be attacked.
step
kill High Justice Grimstone##143607 |scenariogoal 4/41561 |goto Firelands Scenario/1 50.52,20.81 |q 53352
step
Watch the dialogue
|tip Inside the building.
Approach the Lava Pool to Infuse the Molten Core with the Power of Ragnaros |scenariogoal 5/41562 |goto Firelands Scenario/1 50.52,19.27 |q 53352
Charge the Fragment of the Molten Core |q 53352/1 |goto Firelands Scenario/1 50.52,19.27
step
clicknpc Mole Machine to Stormwind##143567
|tip Inside the building.
Return to Stormwind |complete zone("Stormwind City") |goto Firelands Scenario/1 50.29,21.35 |q 53352
step
talk Moira Thaurissan##133197
|tip Inside the building.
turnin Firelands##53352 |goto Stormwind City/0 51.88,14.05
accept Forged in Fire an' Flame##51474 |goto Stormwind City/0 51.88,14.05
step
talk Moira Thaurissan##133197
|tip Inside the building.
Tell her _"I am ready to go to Blackrock Depths."_ |gossip 48178
Travel to Blackrock Depths |complete subzone("Hall of Crafting") |goto Stormwind City/0 51.88,14.05 |q 51474
step
click Fragment 'o the Molten Core##298887
Repair the Black Anvil |q 51474/1 |goto Blackrock Scenario/0 56.65,31.36
step
talk Moira Thaurissan##140309
turnin Forged in Fire an' Flame##51474 |goto 57.19,30.88
accept Dark Iron Dwarves##53566 |goto 57.19,30.88
step
clicknpc Mole Machine to Stormwind##143567
Return to Stormwind |complete zone("Stormwind City") |goto 57.50,30.09 |q 53566
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin Dark Iron Dwarves##53566 |goto Stormwind City/0 52.08,13.43
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Dark Iron Dwarf Mole Machine Locations",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Dark Iron Dwarf Mole Machine locations.",
condition_end=function() return completedq(53589) end,
patch='80001',
},[[
step
clicknpc Dark Iron Mole Machine##144281
Unlock the Throne of Flame Mole Machine |goto Mount Hyjal/0 57.17,77.11 |q 53601 |future
step
clicknpc Dark Iron Mole Machine##144280
Unlock The Great Divide Mole Machine |goto Southern Barrens/0 39.12,9.29 |q 53600 |future
step
clicknpc Dark Iron Mole Machine##144271
Unlock the Fire Plume Ridge Mole Machine |goto Un'Goro Crater/0 52.90,55.77 |q 53591 |future
step
clicknpc Dark Iron Mole Machine##144274
Unlock the Nethergarde Keep Mole Machine |goto Blasted Lands/0 61.97,12.81 |q 53594 |future
step
clicknpc Dark Iron Mole Machine##144265
Unlock the Aerie Peak Mole Machine |goto The Hinterlands/0 13.52,46.80 |q 53585 |future
step
clicknpc Dark Iron Mole Machine##144267
Unlock The Masonary Mole Machine |goto Burning Steppes/16 33.33,24.77 |q 53587 |future
step
clicknpc Dark Iron Mole Machine##144279
Unlock the Fel Pits Mole Machine |goto Shadowmoon Valley/0 50.77,35.31 |q 53599 |future
step
clicknpc Dark Iron Mole Machine##144277
Unlock the Skald Mole Machine |goto Blade's Edge Mountains/0 72.42,17.66 |q 53597 |future
step
clicknpc Dark Iron Mole Machine##144276
Unlock the Ruby Dragonshrine Mole Machine |goto Dragonblight/0 45.35,49.92 |q 53596 |future
step
clicknpc Dark Iron Mole Machine##144266
Unlock the Argent Tournament Grounds Mole Machine |goto Icecrown/0 76.97,18.67 |q 53586 |future
step
clicknpc Dark Iron Mole Machine##144278
Unlock the Stormstout Brewery Mole Machine |goto Valley of the Four Winds/0 31.52,73.61 |q 53598 |future
step
clicknpc Dark Iron Mole Machine##144275
Unlock the One Keg Mole Machine |goto Kun-Lai Summit/0 57.70,62.80 |q 53595 |future
step
clicknpc Dark Iron Mole Machine##144268
Unlock the Blackrock Foundry Overlook Mole Machine |goto Gorgrond/0 46.69,38.75 |q 53588 |future
step
clicknpc Dark Iron Mole Machine##144270
Unlock the Elemental Plateau Machine |goto Nagrand D/0 65.74,8.27 |q 53590 |future
step
clicknpc Dark Iron Mole Machine##144273
Unlock the Neltharion's Vault Mole Machine |goto Highmountain/0 44.66,72.89 |q 53593 |future
step
clicknpc Dark Iron Mole Machine##144269
Unlock the Broken Shore Mole Machine |goto Broken Shore/0 71.71,48.01 |q 53589 |future
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Kul Tiran Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Kul Tiran allied race.",
condition_suggested=function() return (achieved(13467) and achieved(12891)) and not achieved(13163) end,
condition_end=function() return achieved(13163) end,
image=ZGV.IMAGESDIR.."KulTiranUnlock",
patch='80105',
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
accept The Call for Allies##49929 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin The Call for Allies##49929 |goto Stormwind City/0 52.05,13.40
accept A Choice of Allies##50239 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
click Dark Iron Dwarf
|tip Inside the building.
Learn About the Dark Iron Dwarves |q 50239/3 |goto Stormwind City/0 51.78,13.91
step
click LIghtforged Draenei
|tip Inside the building.
Learn About the Lightforged Draenei |q 50239/1 |goto Stormwind City/0 51.90,13.73
step
click Mechagnome
|tip Inside the building.
Learn About the Mechagnomes |q 50239/5 |goto Stormwind City/0 51.66,13.50
step
click Void Elf
|tip Inside the building.
Learn About the Void Elves |q 50239/2 |goto Stormwind City/0 52.22,13.20
step
click Kul Tiran
|tip Inside the building.
Learn About the Kul Tirans |q 50239/4 |goto Stormwind City/0 52.34,13.04
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin A Choice of Allies##50239 |goto Stormwind City/0 52.05,13.40
accept Made in Kul Tiras##54706 |goto 52.05,13.40
step
talk Cyrus Crestfall##122370
|tip Inside the building.
Ask him _"I am told you know where to find the shipwright, Dorian Atwater?"_ |gossip 48243
Speak to Cyrus |q 54706/2 |goto Boralus/0 67.99,21.91
step
Watch the dialogue
|tip Inside the building.
talk Cyrus Crestfall##122370
turnin Made in Kul Tiras##54706 |goto 68.00,21.91
accept The Master Shipwright##55039 |goto 68.00,21.91
step
talk Lady Jaina Proudmoore##148798
|tip Inside the building.
Select  _"<Take the letter.>"_ |gossip 50746
collect Letter from the Lord Admiral##166462 |q 55039/1 |goto 67.95,22.21
step
talk Cyrus Crestfall##150515
turnin The Master Shipwright##55039 |goto Stormsong Valley/0 59.39,70.27
accept Fish Tales and Distant Sails##55043 |goto 59.39,70.27
step
talk Talkative Brennadam Citizen##150522+
|tip You may need to talk to many of them.
Ask them _"Do you know where I can find Dorian Atwater?"_ |gossip 50031
Learn Dorian's Location |q 55043/1 |goto Stormsong Valley/0 58.78,69.26
step
talk Cyrus Crestfall##150515
|tip Inside the building.
turnin Fish Tales and Distant Sails##55043 |goto 58.67,70.36
accept Home, Home On the Range##54708 |goto 58.67,70.36
step
Find the Homestead |q 54708/1 |goto 49.94,50.03
step
talk Old Atwater##148872
Ask him _"Are you Dorian Atwater?"_ |gossip 51048
Meet the Shipwright |q 54708/2 |goto 49.94,50.03
step
Meet the Actual Shipwright |q 54708/3 |goto 50.23,49.87
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
talk Dorian Atwater##148870
turnin Home, Home On the Range##54708 |goto 50.23,49.87
accept I'm Too Old for This Ship##54721 |goto 50.23,49.87
step
clicknpc Hurricane##150581
|tip {o}Keep trying{} until the goal completes.
Saddle Hurricane |q 54721/1 |goto 50.37,50.46
step
talk Dorian Atwater##148870
turnin I'm Too Old for This Ship##54721 |goto 66.12,47.36
accept Covering Our Masts##54723 |goto 66.12,47.36
accept The Deep Ones##54725 |goto 66.12,47.36
stickystart "Slay_Drowned_Forces"
step
click Fog Ward
Southern Fog Ward |q 54723/1 |goto 66.91,44.68
step
click Fog Ward
Place the Western Fog Ward |q 54723/2 |goto 65.94,43.50
step
click Fog Ward
Place the Northern Fog Ward |q 54723/3 |goto 67.95,41.97
step
label "Slay_Drowned_Forces"
Kill enemies around this area
Slay #12# Drowned Forces |q 54725/1 |goto Stormsong Valley/0 66.90,43.07
'|kill Drowned Harbinger##148912, Grasp of the Deep##148916, Drowned Convert##148911, Umbral Hulk##148913
step
talk Dorian Atwater##148870
turnin Covering Our Masts##54723 |goto 66.12,47.36
turnin The Deep Ones##54725 |goto 66.12,47.36
accept Frame Work##54726 |goto 66.12,47.36
step
Watch the dialogue
|tip Inside the building.
talk Dorian Atwater##148870
turnin Frame Work##54726 |goto Tiragarde Sound/0 68.95,20.55
accept Team Carry##54727 |goto Tiragarde Sound/0 68.95,20.55
step
click Heavy Lumber+
|tip They look like {o}large piles of logs{}.
|tip Use the abilities that appear on your action bar.
Collect #4# Heavy Lumber |q 54727/1 |goto Tiragarde Sound/0 67.69,17.52
step
Watch the dialogue
|tip Follow {o}Dorian{} as she walks.
|tip Use the abilities on your action bar.
|tip She eventually walks to this location.
Follow Dorian to the Drop Point |q 54727/2 |goto 67.10,12.33
'|clicknpc Dorian Atwater##149036
step
Watch the dialogue
talk Dorian Atwater##148870
turnin Team Carry##54727 |goto 67.10,12.33
accept This Lumber is Haunted##54728 |goto 67.10,12.33
accept The Bleak Hills##54729 |goto 67.10,12.33
step
Seek out Thornspeaker Birchgrove in Gol Koval |q 54728/1 |goto 67.11,12.34
step
talk Thornspeaker Birchgrove##139926
turnin This Lumber is Haunted##54728 |goto Drustvar/0 61.88,59.33
accept Gorak Tul's Influence##54730 |goto Drustvar/0 61.88,59.33
step
Kill enemies around this area
click Empowered Major Cairn+
|tip They look like {o}larger stone slabs{} standing upright.
click Empowered Minor Cairn+
|tip They look like {o}smaller stone slabs{} standing upright.
Fill the Drust Vessel |q 54730/1 |goto Drustvar/0 61.26,66.10
'|kill Vengeful Bones##128703, Awoken Guardian##126355, Ancient Sentinel##126542
step
talk Thornspeaker Birchgrove##139926
turnin Gorak Tul's Influence##54730 |goto 61.88,59.33
accept Balance in All Things##54731 |goto 61.88,59.33
step
talk Arthur Tradewind##149293
Ask it _"Can you take me to the High Thornspeaker?"_ |gossip 50185
clicknpc Arthur Tradewind##149294
Ride with Ulfar |invehicle |goto 61.85,59.37 |q 54731
step
Watch the dialogue
Travel to Ulfar's Den |outvehicle |goto 46.27,44.96 |q 54731 |notravel
step
talk Ulfar##141159
|tip Inside the cave.
Tell it _"Tell me how I can help."_ |gossip 49067
Watch the dialogue
Speak to Ulfar |q 54731/1 |goto Drustvar/0 45.20,45.84
step
click Ancient Seedling
|tip Inside the cave.
Begin the Ritual |q 54731/2 |goto 44.97,45.83
step
Restore Balance |q 54731/3 |goto 44.97,45.83
|tip Run over the {o}green orbs{} that appear on the ground.
|tip {o}Avoid{} the {o}blue orbs{}.
|tip Inside the cave.
step
Watch the dialogue
|tip Inside the cave.
talk Ulfar##141159
turnin Balance in All Things##54731 |goto 45.21,45.84
step
Find Chelsea Wright |q 54729/1 |goto 33.16,30.38
step
Watch the dialogue
talk Chelsea Wright##150884
turnin The Bleak Hills##54729 |goto 33.17,30.37
accept Drop It!##54732 |goto 33.17,30.37
step
Enter the cave |goto 36.32,29.25 < 15 |walk
Watch the dialogue
|tip Follow the {o}Wicker Beast{} as it walks.
|tip It eventually leads you into a cave.
click Storeroom Keys##322620
|tip Inside the cave.
collect Storehouse Key##167168 |q 54732/1 |goto 36.60,28.88
'|clicknpc Wicker Beast##150891
step
talk Wicker Beast##150885
|tip Inside the cave.
turnin Drop It!##54732 |goto 36.62,28.84
accept Her Dog Days Are Over##55136 |goto 36.62,28.84
step
click Gnawed Bone##322638
collect Gnawed Bone##167174 |q 55136/3 |goto 35.31,28.91
step
click Worn Collar##322636
collect Worn Collar##167172 |q 55136/1 |goto 36.01,30.95
step
click Squeaky Toy##322637
|tip Inside the building.
collect Squeaky Toy##167173 |q 55136/2 |goto 34.60,30.55
step
talk Chelsea Wright##150884
turnin Her Dog Days Are Over##55136 |goto 33.17,30.37
accept Make it Wright##54733 |goto 33.17,30.37
step
click Storage Crate
turnin Make it Wright##54733 |goto 33.11,30.30
step
talk Bound Sky##149252
|tip It moves to this location.
accept Summons from Dorian##54734 |goto 33.04,30.39
step
talk Dorian Atwater##148870
turnin Summons from Dorian##54734 |goto Stormsong Valley/0 66.51,44.24
step
talk Lady Jaina Proudmoore##148798
accept A Worthy Crew##54735 |goto 66.50,44.29
step
talk Tandred Proudmoore##149474
Tell him _"Jaina sent me to speak with you."_ |gossip 50526
Speak to Tandred Proudmoore |q 54735/1 |goto Boralus/0 42.99,56.31
step
talk Brother Pike##149481
Ask him _"Tandred Proudmoore is putting together a crew. He needs a tidesage. Are you interested?"_ |gossip 50940
Recruit Brother Pike |q 54735/2 |goto 75.97,22.98
step
talk Lieutenant Tarenfold##151040
Ask him _"Tandred Proudmoore is putting together a crew. He needs a master gunner. Are you interested?"_ |gossip 50527
Recruit Lieutenant Tarenfold |q 54735/3 |goto Tiragarde Sound/0 56.68,61.18
step
talk Rosaline Madison##149486
Ask her _"Tandred Proudmoore is putting together a crew. He needs a first mate. Are you interested?"_ |gossip 50528
Watch the dialogue
Recruit the Outriggers |q 54735/4 |goto 35.26,24.15
step
talk Dorian Atwater##148870
Tell her _"Well, you heard the man."_ |gossip 50529
Watch the dialogue
Recruit Boatswain |q 54735/5 |goto Stormsong Valley/0 67.63,44.89
step
talk Lady Jaina Proudmoore##148798
turnin A Worthy Crew##54735 |goto 67.62,44.67
accept Blessing of the Tides##54851 |goto 67.62,44.67
step
Watch the dialogue
talk Lady Jaina Proudmoore##148798
Tell her _"Anduin's Wrath"_ |gossip 50742
Name the Vessel |q 54851/1 |goto 67.62,44.67
step
click Rowboat
Bless the Vessel |q 54851/2 |goto 68.14,45.68
step
talk Lady Jaina Proudmoore##148798
turnin Blessing of the Tides##54851 |goto 71.13,44.02
accept Allegiance of Kul Tiras##53720 |goto 71.13,44.02
step
click Captain's Helm
Sail to Stormwind Harbor |q 53720/1 |goto 71.17,44.02
step
talk Anduin Wrynn##149518
turnin Allegiance of Kul Tiras##53720 |goto Stormwind City/0 22.53,18.39
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Lightforged Draenei Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Lightforged Draenei allied race.",
condition_suggested=function() return achieved(12066) and not achieved(12243) end,
condition_end=function() return achieved(12243) end,
image=ZGV.IMAGESDIR.."LightforgedDraeneiUnlock",
patch='70305',
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
accept The Call for Allies##49929 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin The Call for Allies##49929 |goto Stormwind City/0 52.05,13.40
accept A Choice of Allies##50239 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
click Dark Iron Dwarf
|tip Inside the building.
Learn About the Dark Iron Dwarves |q 50239/3 |goto Stormwind City/0 51.78,13.91
step
click LIghtforged Draenei
|tip Inside the building.
Learn About the Lightforged Draenei |q 50239/1 |goto Stormwind City/0 51.90,13.73
step
click Mechagnome
|tip Inside the building.
Learn About the Mechagnomes |q 50239/5 |goto Stormwind City/0 51.66,13.50
step
click Void Elf
|tip Inside the building.
Learn About the Void Elves |q 50239/2 |goto Stormwind City/0 52.22,13.20
step
click Kul Tiran
|tip Inside the building.
Learn About the Kul Tirans |q 50239/4 |goto Stormwind City/0 52.34,13.04
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin A Choice of Allies##50239 |goto Stormwind City/0 52.05,13.40
accept The Lightforged##49698 |goto Stormwind City/0 52.05,13.40
step
clicknpc Lightforged Beacon##130758
Board the Vindicaar |complete subzone("The Vindicaar") |goto Stormwind City/0 48.05,11.06 |q 49698
step
talk Captain Fareeya##130549
turnin The Lightforged##49698 |goto Vindicaar Scenario/1 43.83,27.05
accept Forge of Aeons##49266 |goto Vindicaar Scenario/1 43.83,27.05
step
clicknpc Lightforged Beacon##130511
Begin the Forge of Aeons Scenario |complete subzone("Forge of Aeons") |goto 49.90,46.22 |q 49266
step
Meet with T'paartos |scenariogoal Meet with T'paartos##1/37571 |goto Draenei Scenario/0 88.01,44.45 |q 49266
step
Follow T'paartos |scenariogoal Follow T'paartos##2/37710 |goto 88.76,28.34 |q 49266
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
See the Past |scenariogoal See the past##3/37711 |goto 88.76,28.34 |q 49266
step
Enter the Swamp |scenariogoal Swamp entered##4/37712 |goto 83.67,32.38 |q 49266
step
Watch the dialogue
Find the Child |scenariogoal Child found##5/37718 |goto 66.79,29.70 |q 49266
step
kill Swamp Serpent##128115 |scenariogoal Swamp Serpent slain##6/37717 |goto 66.79,29.70 |q 49266
step
Find the Refuge |scenariogoal Refuge found##7/37931 |goto 57.10,23.78 |q 49266
step
clicknpc Crystal##128036
|tip Inside the underground cave.
|tip You will be attacked.
Collect the Crystal |scenariogoal Crystal collected##8/37932 |goto 47.01,27.36 |q 49266
step
kill Crystal Fury##128038 |scenariogoal Crystal Fury slain##9/37968 |goto 47.55,27.88 |q 49266
|tip Inside the underground cave.
step
Kill enemies around this area
Conquer #7# Doubts and Fears |scenariogoal Doubts and Fears conquered##10/37933 |goto Draenei Scenario/0 39.41,36.12 |q 49266
'|kill Doubt##128120, Fear##128713
step
Find the Cave |scenariogoal Cave found##11/38069 |goto 16.63,46.71 |q 49266
step
kill Terror##128427
|tip Inside the underground cave.
Defeat Terror |scenariogoal Terror defeated##12/38070 |goto 8.61,50.26 |q 49266
step
Follow T'paartos |scenariogoal Follow T'paartos##13/38071 |goto 45.67,59.90 |q 49266
|tip Follow {o}T'paartos{} as he walks.
|tip He eventually walks to this location.
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128424
Free T'paartos |scenariogoal T'paartos freed##14/38072 |goto 46.80,65.95 |q 49266
step
Follow T'paartos |scenariogoal Follow T'paartos##15/38103 |goto 66.64,77.57 |q 49266
|tip Follow {o}T'paartos{} as he walks.
|tip He eventually walks to this location.
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128550
|tip Follow {o}T'paartos{} as he walks down the spiral path.
|tip Inside the underground cave.
Free Kind |scenariogoal Kind##16/38082 |goto 68.44,77.13 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128561
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Free Brave |scenariogoal Brave##16/38084 |goto 65.72,73.60 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128560
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Free Strong |scenariogoal Strong##16/38083 |goto 72.31,86.51 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128562
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Free Boastful |scenariogoal Boastful##16/38085 |goto 69.63,68.26 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128563
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Free Frightened |scenariogoal Frightened##16/38086 |goto 63.02,74.48 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc T'paartos##128566
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Free Inadequate |scenariogoal Inadequate##16/38087 |goto 69.57,77.86 |q 49266
'|clicknpc T'paartos##127827
step
kill T'paartos the Fallen##127924
|tip Follow {o}T'paartos{} as he walks.
|tip Inside the underground cave.
Watch the dialogue
Help T'paartos |scenariogoal Help T'paartos##17/38088 |goto 73.72,94.30 |q 49266
'|clicknpc T'paartos##127827
step
clicknpc Lightforged Beacon##127964
|tip Inside the underground cave.
Leave the Forge of Aeons |complete subzone("The Vindicaar") |goto 71.67,95.43 |q 49266
step
talk Captain Fareeya##130549
turnin Forge of Aeons##49266 |goto Vindicaar Scenario/1 48.41,39.51
step
talk High Exarch Turalyon##130810
accept For the Light!##50071 |goto 47.53,40.22
step
click Portal to Stormwind
|tip Downstairs inside the building.
Return to Stormwind |complete zone("Stormwind City") |goto Vindicaar Scenario/2 43.29,24.97 |q 50071
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin For the Light!##50071 |goto Stormwind City/0 52.07,13.41
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Mechagnome Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Mechagnome allied race.",
condition_suggested=function() return achieved(13553) and not achieved(14013) end,
condition_end=function() return achieved(14013) end,
image=ZGV.IMAGESDIR.."MechagnomeUnlock",
patch='80300',
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
accept The Call for Allies##49929 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin The Call for Allies##49929 |goto Stormwind City/0 52.05,13.40
accept A Choice of Allies##50239 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
click Dark Iron Dwarf
|tip Inside the building.
Learn About the Dark Iron Dwarves |q 50239/3 |goto Stormwind City/0 51.78,13.91
step
click LIghtforged Draenei
|tip Inside the building.
Learn About the Lightforged Draenei |q 50239/1 |goto Stormwind City/0 51.90,13.73
step
click Mechagnome
|tip Inside the building.
Learn About the Mechagnomes |q 50239/5 |goto Stormwind City/0 51.66,13.50
step
click Void Elf
|tip Inside the building.
Learn About the Void Elves |q 50239/2 |goto Stormwind City/0 52.22,13.20
step
click Kul Tiran
|tip Inside the building.
Learn About the Kul Tirans |q 50239/4 |goto Stormwind City/0 52.34,13.04
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin A Choice of Allies##50239 |goto Stormwind City/0 52.05,13.40
accept Urgent Care##58214 |goto Stormwind City/0 52.05,13.40
step
talk Kelsey Steelspark##160101
turnin Urgent Care##58214 |goto Boralus/0 73.13,16.92
accept Waning Energy##57486 |goto 73.13,16.92
step
talk Kelsey Steelspark##157997
turnin Waning Energy##57486 |goto 36.90,62.55
accept Someone Who Can Help##57487 |goto 36.90,62.55
step
clicknpc Homing Copter##158230
Acquire the Homing Copter |q 57487/1 |goto 49.49,40.17
step
clicknpc Mekkatorque's Escape Pod##160046
Watch the dialogue
Send the Escape Pod to Mechagon |q 57487/2 |goto 36.74,62.62
step
clicknpc Homing Copter##204917
|tip It flies to this location.
Ride the Homing Copter to Mechagon |q 57487/3 |goto Boralus/0 36.84,63.47
step
Begin Riding the Homing Copter to Mechagon |invehicle |q 57487
step
Ride the Homing Copter to Mechagon |outvehicle |goto Mechagon Island/0 73.78,35.63 |q 57487
step
Meet Prince Erazmin |q 57487/4 |goto Mechagon Island/0 74.11,36.99 |notravel
step
talk Prince Erazmin##149816
turnin Someone Who Can Help##57487 |goto 74.11,36.99
step
talk Waren Gearhart##150555
accept The Current Schematic##57488 |goto 73.12,33.36
step
Kill enemies around this area
collect 6 Acquisitioned Machine Part##172521 |q 57488/2 |goto Mechagon Island/0 72.64,45.52
'|kill Malfunctioning Scraphound##151301, Malfunctioning Scrapbot##151640
step
Kill enemies around this area
collect 4 Heat Tolerant Ooze##172522 |q 57488/1 |goto Mechagon Island/0 74.01,61.04
'|kill Congealed Oil##150698, Slime Elemental##151792
step
talk Waren Gearhart##150555
turnin The Current Schematic##57488 |goto 73.12,33.36
step
talk Prince Erazmin##158145
accept Voyage to Safety##57490 |goto 73.04,33.43
step
Watch the dialogue
Activate the Piston and Crew |q 57490/1 |goto 63.13,37.64
step
kill Rust-Eye the Clever##158851 |q 57490/2 |goto 86.95,73.84
step
Retrieve the Pod |q 57490/3 |goto 86.95,73.84
step
Watch the dialogue
Deliver the Pod |q 57490/4 |goto 73.55,32.11
step
talk Waren Gearhart##150555
turnin Voyage to Safety##57490 |goto 73.13,33.35
step
talk Christy Punchcog##160232
accept Better... Stronger... Less Dead##57491 |goto 73.19,33.47
step
kill Insurgent Cycloid##159271
|tip It walks around this area.
collect Omni Electromagnetic Amplifier##173026 |q 57491/2 |goto Mechagon Island/0 54.30,27.52
step
kill Insurgent Crawler##159262
|tip It walks around this area.
collect Flux Energized Servos##173028 |q 57491/3 |goto Mechagon Island/0 54.30,52.36
step
kill HK-3 Aerial Dissuasion Unit##159261
|tip It flies around this area.
collect Neural Accelerator##172511 |q 57491/1 |goto 34.97,59.87
step
talk Christy Punchcog##160232
turnin Better... Stronger... Less Dead##57491 |goto 73.51,31.88
step
talk Prince Erazmin##158145
accept Him?##57492 |goto 73.04,33.43
step
talk Pegi Cogster##159558
Ask her _"What do you want in a leader?"_ |gossip 49517
Speak with Pegi Cogster |q 57492/3 |goto 74.30,34.82
step
talk Flouresce Brightgear##159571
Ask her _"What do you want in a leader?"_ |gossip 49519
Speak with Flouresce Brightgear |q 57492/5 |goto 75.43,36.02
step
talk Quimby Sparklighter##159570
Ask him _"What makes a good leader?"_ |gossip 49518
Speak with Quimby Sparklighter |q 57492/4 |goto 72.09,38.64
step
talk Idee Quickcoil##159567
Ask her _"What makes a good leader?"_ |gossip 49516
Speak with Idee Quickcoil |q 57492/2 |goto 71.29,34.28
step
talk Stuard Sharpsprocket##159545
Ask him _"Why do you appreciate Gelbin Mekkatorque?"_ |gossip 49520
Speak with Stuard Sharpsprocket |q 57492/6 |goto 69.93,32.06
step
talk Elya Codepunch##159559
Ask her _"What do you want in a leader?"_ |gossip 49586
Speak with Elya Codepunch |q 57492/1 |goto 70.46,30.94
step
talk Prince Erazmin##158145
turnin Him?##57492 |goto 73.04,33.43
step
talk Christy Punchcog##160232
accept Mental Attunement##57493 |goto 73.51,31.89
step
click Synchroscope##159574
Initiate the Synchronization |q 57493/1 |goto 73.59,32.87
step
Watch the dialogue
Complete the Synchronization |q 57493/2 |goto 73.55,32.09
step
clicknpc Mekkatorque's Escape Pod##158100
Open the Escape Pod |q 57493/3 |goto 73.55,32.09
step
talk Christy Punchcog##160232
turnin Mental Attunement##57493 |goto 73.51,31.89
accept A Strong Heart##57494 |goto 73.51,31.89
step
Find Kelsey |q 57494/1 |goto 59.54,55.83
step
kill Insurgent Coilbearer##159751 |q 57494/2 |goto 59.50,55.88
step
Watch the dialogue
Retrieve the Unit |q 57494/3 |goto 59.50,55.88
step
click Spark Reactor##159785
Deliver the Spark Reactor |q 57494/4 |goto 73.59,32.15
step
Watch the dialogue
Calibrate the Circuit |q 57494/5 |goto 73.59,32.15
step
click Genny##159573
Activate the Generator |q 57494/6 |goto 73.72,31.84
step
Defibrillate Mekkatorque |q 57494/7 |goto 73.54,32.11
|tip Use the {o}Resuscitation{} ability.
|tip It appears as a button on the screen.
step
talk Prince Erazmin##158145
turnin A Strong Heart##57494 |goto 73.03,33.43
step
talk Gelbin Mekkatorque##159587
|tip He walks to this location.
accept Ascension##57496 |goto 73.07,33.58
step
Take the Teleporter to Mechagon City |q 57496/1 |goto 72.35,31.27
|tip Step onto the grate.
step
Teleport to Mechagon City |complete zone("Mechagon City") |q 57496
step
kill Blastatron X-81##160087 |q 57496/2 |goto Mechagon City/1 65.46,48.18
|tip {o}Avoid{} the {o}blue areas{} on the ground.
step
talk Gelbin Mekkatorque##162806
turnin Ascension##57496 |goto 58.14,41.20
accept The Future of Mechagon##57495 |goto 58.14,41.20
step
Teleport to the High Tinkertory |q 57495/1 |goto 47.91,31.46
|tip Step onto the grate.
step
Witness the Speech |q 57495/2 |goto 19.99,66.06
|tip Inside the building.
step
talk Gelbin Mekkatorque##159587
|tip Inside the building.
turnin The Future of Mechagon##57495 |goto 18.70,67.41
step
talk Kelsey Steelspark##157997
|tip Inside the building.
accept Propagate the News##57497 |goto 17.80,65.60
step
Teleport to Stormwind |q 57497/1 |goto 20.42,59.84
|tip Step onto the grate.
|tip Inside the building.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin Propagate the News##57497 |goto Stormwind City/0 52.06,13.41
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Void Elf Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Void Elf allied race.",
condition_suggested=function() return achieved(12066) and not achieved(12242) end,
condition_end=function() return achieved(12242) end,
image=ZGV.IMAGESDIR.."VoidElfUnlock",
patch='70305',
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
accept The Call for Allies##49929 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin The Call for Allies##49929 |goto Stormwind City/0 52.05,13.40
accept A Choice of Allies##50239 |goto Stormwind City/0 Stormwind City/0 52.05,13.40
step
click Dark Iron Dwarf
|tip Inside the building.
Learn About the Dark Iron Dwarves |q 50239/3 |goto Stormwind City/0 51.78,13.91
step
click LIghtforged Draenei
|tip Inside the building.
Learn About the Lightforged Draenei |q 50239/1 |goto Stormwind City/0 51.90,13.73
step
click Mechagnome
|tip Inside the building.
Learn About the Mechagnomes |q 50239/5 |goto Stormwind City/0 51.66,13.50
step
click Void Elf
|tip Inside the building.
Learn About the Void Elves |q 50239/2 |goto Stormwind City/0 52.22,13.20
step
click Kul Tiran
|tip Inside the building.
Learn About the Kul Tirans |q 50239/4 |goto Stormwind City/0 52.34,13.04
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin A Choice of Allies##50239 |goto Stormwind City/0 52.05,13.40
accept The Ghostlands##49787 |goto Stormwind City/0 52.05,13.40
step
click Rift to Ghostlands
|tip Inside the building.
Travel to the Ghostlands |q 49787/1 |goto Stormwind City/0 52.39,13.29
step
click Umbric's Notes - Sanctum of the Moon
|tip Inside the building.
Locate Umbric's Notes - Sanctum of the Moon |q 49787/2 |goto Ghostlands/0 33.63,34.46
step
click Umbric's Notes - Andilien Estate
|tip Inside the building.
Locate Umbric's Notes - Andilien Estate |q 49787/3 |goto 46.87,54.97
step
click Teleportation Console
|tip Up on the balcony of the building.
Teleport to the Dawnstar Spire |complete subzone("Dawnstar Spire") |goto Ghostlands/0 79.65,17.51 |q 49787
step
click Umbric's Notes - Dawnstar Spire
|tip At the top of the building.
Locate Umbric's Notes - Dawnstar Spire |q 49787/4 |goto Ghostlands/0 79.64,19.68
step
talk Alleria Windrunner##126321
|tip At the top of the building.
turnin The Ghostlands##49787 |goto 79.69,19.62
accept Telogrus Rift##48962 |goto 79.69,19.62
step
click Rift to Telogrus
|tip At the top of the building.
Enter the Rift to Telogrus |complete subzone("Telogrus Rift") |goto 79.64,19.86 |q 48962
step
talk Magister Umbric##126646
Ask him _"What is this place?"_ |gossip 47941
Speak with Umbric |scenariogoal Speak with Umbric##1/37328 |goto Void Elf Scenario/0 47.83,73.88 |q 48962
step
Watch the dialogue
|tip Follow {o}Magister Umbric{} and {o}Alleria Windrunner{} as they walk.
|tip They eventually walk to this location.
Walk with Umbric and Alleria |scenariogoal Walk with Umbric and Alleria.##2/37282 |goto Void Elf Scenario/0 49.30,76.78 |q 48962
'|clicknpc Magister Umbric##126646, Alleria Windrunner##126602
step
click Void Rift
Use the Void Portal |scenariogoal Use the void portal.##3/38503 |goto 48.97,72.91 |q 48962
step
Kill enemies around this area
|tip Follow {o}Alleria Windrunner{}.
|tip She will help you fight.
Repel the Void |scenariostage 4 |goto 39.30,54.49 |q 48962
'|kill Netherguard Transmogrifier##126493, Netherguard Adept##126492, Netherguard Phaseblade##126491, Creeping Void##126489
'|clicknpc Alleria Windrunner##126602
step
click Void Rift
Use the Void Portal |scenariogoal Use the void portal.##5/38971 |goto 37.32,49.26 |q 48962
step
kill Dark Manifestation##126559+
Close the Rift |scenariogoal Rift sealed##6/37295 |goto 28.92,40.34 |q 48962
step
kill Nhr'ghesh##126589
Defeat Nhr'ghesh |scenariogoal Nhr'ghesh defeated##7/37296 |goto 28.92,40.34 |q 48962
step
click Void Rift
Use the Void Portal |scenariogoal Use the void portal.##8/38972 |goto 28.89,38.30 |q 48962
step
click Voidforge
Shut Down the Voidforge |scenariogoal Voidforges shut down##9/37329 |goto 29.00,27.81 |count 1 |q 48962
step
click Voidforge
Shut Down the Voidforge |scenariogoal Voidforges shut down##9/37329 |goto 28.49,21.70 |count 2 |q 48962
step
click Voidforge
Shut Down the Voidforge |scenariogoal Voidforges shut down##9/37329 |goto 26.21,24.46 |count 3 |q 48962
step
kill Nether-Prince Durzaan##126470
Defeat Nether-Prince Durzaan |scenariogoal Nether-Walker defeated##10/37284 |goto 27.90,24.09 |q 48962
Complete the "Telogrus Rift" Scenario |q 48962/1 |goto 27.90,24.09
step
click Rift to Stormwind
Leave the Telogrus Rift |complete zone("Stormwind City") |goto 27.95,24.50 |q 48962
step
talk Aysa Cloudsinger##126332
|tip Inside the building.
turnin Telogrus Rift##48962 |goto Stormwind City/0 52.06,13.41 |complete achieved(12242)
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Death Knight Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('DeathKnight') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('DeathKnight') end,
condition_valid_msg="You must be a Death Knight to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Raise Dead |scenariogoal 2/30662
step
_On the Deck of the Airship:_
Watch the dialogue
Use Outbreak on the Target Dummy |scenariogoal 3/30663
step
_On the Deck of the Airship:_
Watch the dialogue
Use your Festering Strike ability on the Target Dummy
|tip It appears on your action bar.
Use Festering Strike on the Target Dummy |scenariogoal 4/30664
step
_On the Deck of the Airship:_
Watch the dialogue
Use Festering Strike then Scourge Strike on the Target Dummy |scenariogoal 5/30665
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Coil on the Target Dummy |scenariogoal 6/30666
|tip Use your other abilities to generate Runic Power.
step
_On the Deck of the Airship:_
Use your abilities on the Target Dummy
Use Outbreak |scenariogoal 7/30663
Use Festering Strike |scenariogoal 7/30664
Use Scourge Strike |scenariogoal 7/30665
Use Death Coil |scenariogoal 7/30666
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Strike |scenariogoal Use Death Strike##8/31703
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Grip |scenariogoal 9/30667
step
_On the Deck of the Airship:_
Watch the dialogue
Use Army of the Dead |scenariogoal 10/31018
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 12/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Demon Hunter Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('DemonHunter') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('DemonHunter') end,
condition_valid_msg="You must be a Demon Hunter to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Fel Rush |scenariogoal 2/38303
step
_On the Deck of the Airship:_
Watch the dialogue
Use Demon's Bite on the Target Dummy #3# Times |scenariogoal 3/38304
step
_On the Deck of the Airship:_
Watch the dialogue
Use Chaos Strike on the Target Dummy |scenariogoal 4/38305
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
Use Eye Beam on the Target Dummy |scenariogoal 5/38308
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Use Demon's Bite |scenariogoal 6/38304
Use Eye Beam |scenariogoal 6/38308
Use Chaos Strike |scenariogoal 6/38305
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Use Blade Dance to kill the Arcane Constructs |scenariogoal 7/38307 |goto 0.00,0.00
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 7/29840
|tip Use Demon's Bite to build fury.
|tip Then use Blade Dance and Eye Beam to destroy the Arcane Constructs.
step
_On the Deck of the Airship:_
Watch the dialogue
Use Metamorphasis |scenariogoal 8/38306
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
Defeat Both Attackers |scenariogoal 10/30919
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariogoal 11/0
|tip Use Demon's Bite to build fury.
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Druid Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Druid') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Druid') end,
condition_valid_msg="You must be a Druid to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Moonkin Form |scenariogoal 2/32840
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Moonfire on the Target Dummy |scenariogoal 3/32841
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Sunfire on the Target Dummy |scenariogoal 3/32842
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Wrath on the Target Dummy |scenariogoal 4/32843
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Starsurge on the Target Dummy |scenariogoal 5/32844
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Starfire on the Target Dummy |scenariogoal 6/32845
|only if Balance
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 6/29840
|only if Balance
step
_On the Deck of the Airship:_
Cast Moonfire |scenariogoal 7/32841
Cast Sunfire |scenariogoal 7/32842
Cast Wrath |scenariogoal 7/32843
Cast Starsurge |scenariogoal 7/32844
Cast Starfire |scenariogoal 7/32845
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Use Regrowth to Heal Yourself |scenariogoal 8/30432
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Entangling Roots |scenariogoal 9/32846
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Use Cat Form to Shapeshift into a Cat |scenariogoal 2/30425
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Prowl to Enter Stealth |scenariogoal 3/30426
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rake on the Target Dummy |scenariogoal 4/30428
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Shred on the Target Dummy |scenariogoal 5/30427
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Ferocious Bite with Combo Points on the Target Dummy |scenariogoal 6/30430
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rip with Combo Points on the Target Dummy |scenariogoal 7/30429
|only if Feral
step
_On the Deck of the Airship:_
Use Rake |scenariogoal 8/30428
Use Shred |scenariogoal Use Shred##8/30427
Use Ferocious Bite |scenariogoal 8/30430
Use Rip |scenariogoal 8/30429
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Dash to Move Faster in Cat Form |scenariogoal 9/30431
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Regrowth to Heal Yourself |scenariogoal 10/30432
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariostage 12
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Feral
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Hunter Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Hunter') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Hunter') end,
condition_valid_msg="You must be a Hunter to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Call Pet |scenariogoal 2/29828
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Kill Command to Command your Pet to Attack the Target Dummy |scenariogoal 3/29829
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Barbed Shot on the Target Dummy |scenariogoal 4/40240
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Cobra Shot on the Target Dummy |scenariogoal 5/29831
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Bestial Wrath |scenariogoal 6/29832
|only if BeastMastery
step
_On the Deck of the Airship:_
Use Kill Command |scenariogoal 7/29829
Use Barbed Shot |scenariogoal 7/40240
Use Cobra Shot |scenariogoal 7/29831
Use Beastial Wrath |scenariogoal 7/29832
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Multi-Shot on the Arcane Constructs |scenariogoal 8/29839
|only if BeastMastery
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feign Death |scenariogoal 9/29835
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Attacker |scenariogoal 10/30919
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Call Pet |scenariogoal 2/29828
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Harpoon on the Target Dummy |scenariogoal 3/34617
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Raptor Strike on the Target Dummy |scenariogoal 4/34622
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Kill Command on the Target Dummy |scenariogoal 5/40249
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Serpent Sting on the Target Dummy |scenariogoal 6/40243
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Wildfire Bomb on the Target Dummy |scenariogoal 7/40244
|only if Survival
step
_On the Deck of the Airship:_
Use Wildfire Bomb on the Target Dummy |scenariogoal 8/40244
Use Kill Command on the Target Dummy |scenariogoal 8/40249
Use Serpent Sting on the Target Dummy |scenariogoal 8/40243
Use Raptor Strike on the Target Dummy |scenariogoal 8/34622
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feign Death |scenariogoal 9/29835
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Attacker |scenariogoal 10/30919
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
|only if Survival
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Mage Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Mage') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Mage') end,
condition_valid_msg="You must be a Mage to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Summon Water Elemental |scenariogoal 2/29591
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Frostbolt on the Target Dummy |scenariogoal 3/30560
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Ice Lance on the Target Dummy |scenariogoal 4/30561
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Ice Lance with Fingers of Frost |scenariogoal 5/30614
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Flurry while under the Effects of Brainfreeze |scenariogoal 6/34628
step
_On the Deck of the Airship:_
Cast Frostbolt |scenariogoal 7/30560
Cast Ice Lance |scenariogoal 7/30561
Cast Flurry |scenariogoal 7/34687
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Blink |scenariogoal 8/29248
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Frost Nova to Freeze the Enemy |scenariogoal 9/30623
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Blizzard on the Arcane Constructs |scenariogoal 10/30622
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 10/29840
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 12/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Monk Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Monk') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="You must be a Monk to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Tiger Palm on the Target Dummy |scenariogoal 2/30392
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rising Sun Kick on the Target Dummy |scenariogoal 3/30393
step
_On the Deck of the Airship:_
Watch the dialogue
Use Blackout Kick on the Target Dummy |scenariogoal 4/30395
step
_On the Deck of the Airship:_
Watch the dialogue
Use Fists of Fury on the Target Dummy |scenariogoal 5/30396
step
_On the Deck of the Airship:_
Use Tiger Palm |scenariogoal 6/30392
Use Rising Sun Kick |scenariogoal 6/30393
Use Blackout Kick |scenariogoal 6/30395
Use Fists of Fury |scenariogoal 6/30396
step
_On the Deck of the Airship:_
Watch the dialogue
Use Roll |scenariogoal 7/30397
step
_On the Deck of the Airship:_
Watch the dialogue
Use Vivify to Heal Yourself |scenariogoal 8/40572
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Paladin Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Paladin') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Paladin') end,
condition_valid_msg="You must be a Paladin to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Judgement on the Target Dummy |scenariogoal 2/29793
step
_On the Deck of the Airship:_
Watch the dialogue
Use Blade of Justice on the Target Dummy |scenariogoal 3/29773
step
_On the Deck of the Airship:_
Watch the dialogue
Use Crusader Strike on the Target Dummy |scenariogoal 4/29769
step
_On the Deck of the Airship:_
Watch the dialogue
Use Templar's Verdict on the Target Dummy |scenariogoal 5/29770
step
_On the Deck of the Airship:_
Use Judgement |scenariogoal 6/29793
Use Blade of Justice |scenariogoal 6/29773
Use Crusader Strike |scenariogoal 6/29769
Use Templar's Verdict |scenariogoal 6/29770
step
_On the Deck of the Airship:_
Watch the dialogue
Earn 3 Holy Power and then Use Divine Storm |scenariogoal 7/32067
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 7/29840
step
_On the Deck of the Airship:_
Watch the dialogue
Use Divine Shield |scenariogoal 8/29771
step
_On the Deck of the Airship:_
Watch the dialogue
Allow Fireball to be Cast on You |scenariogoal 8/29797
step
_On the Deck of the Airship:_
Watch the dialogue
Use Flash of Light to Heal Yourself |scenariogoal 9/29772
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Priest Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Priest') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Priest') end,
condition_valid_msg="You must be a Priest to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Shadow Word: Pain on the Target Dummy |scenariogoal 2/30502
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Penance on the Target Dummy |scenariogoal 3/30503
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Smite on the Target Dummy |scenariogoal 4/30504
step
_On the Deck of the Airship:_
Cast Shadow Word: Pain |scenariogoal 5/30502
Cast Penance |scenariogoal 5/30503
Cast Smite |scenariogoal 5/30504
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Psychic Scream to Fear the Enemies Around You |scenariogoal 6/30520
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Power Word: Shield on Yourself |scenariogoal 7/34732
step
_On the Deck of the Airship:_
Watch the dialogue
Allow Fireball to be Cast on You |scenariogoal 7/29797
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Power Word: Shield on Yourself |scenariogoal 8/34732
step
_On the Deck of the Airship:_
Heal Yourself Through Atonement |scenariogoal 8/40714
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Rogue Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Rogue') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Rogue') end,
condition_valid_msg="You must be a Rogue to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Boralus/0 73.94,12.62 < 100 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Deadly Poison |scenariogoal 2/30644
step
_On the Deck of the Airship:_
Watch the dialogue
Use Stealth |scenariogoal 3/29617
step
_On the Deck of the Airship:_
Watch the dialogue
Use Garrote on the Target Dummy |scenariogoal 4/30645
step
_On the Deck of the Airship:_
Watch the dialogue
Use Mutilate on the Target Dummy |scenariogoal 5/30646
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rupture on the Target Dummy |scenariogoal 6/30647
step
_On the Deck of the Airship:_
Watch the dialogue
Use Envenom on the Target Dummy |scenariogoal 7/30648
step
_On the Deck of the Airship:_
Use Garrote |scenariogoal 8/30645
Use Mutilate |scenariogoal 8/30646
Use Rupture |scenariogoal 8/30647
Use Envenom |scenariogoal 8/30648
step
_On the Deck of the Airship:_
Watch the dialogue
Use Vanish |scenariogoal 9/29646
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Shaman Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Shaman') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Shaman') end,
condition_valid_msg="You must be a Shaman to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Flame Shock on the Target Dummy |scenariogoal 2/29959
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lava Burst on the Target Dummy |scenariogoal 3/29960
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lightning Bolt on the Target Dummy |scenariogoal 4/29961
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Earth Shock on the Target Dummy |scenariogoal 5/29962
|only if Elemental
step
_On the Deck of the Airship:_
Cast Flame Shock |scenariogoal 6/29959
Cast Lava Burst |scenariogoal 6/29960
Cast Lightning Bolt |scenariogoal 6/29961
Cast Earth Shock |scenariogoal 6/29962
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Hex on the Soldier |scenariogoal 7/29963
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Chain Lightning on the Arcane Constructs |scenariogoal 8/29964
|only if Elemental
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Healing Surge to Heal Yourself |scenariogoal 9/32737
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Fire Elemental |scenariogoal 10/31313
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 12/30919
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Flametongue on the Target Dummy |scenariogoal 2/32847
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Rockbiter on the Target Dummy |scenariogoal 3/32848
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lava Lash on the Target Dummy |scenariogoal 4/32849
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Stormstrike on the Target Dummy |scenariogoal 5/32850
|only if Enhancement
step
_On the Deck of the Airship:_
Cast Lava Lash |scenariogoal 6/32849
Cast Flametongue |scenariogoal 6/32847
Cast Rockbiter |scenariogoal 6/32848
Cast Stormstrike |scenariogoal 6/32850
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Hex on the Attacker |scenariogoal 7/29963
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Healing Surge to Heal Yourself |scenariogoal 8/29965
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feral Spirit |scenariogoal 9/32851
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Enhancement
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Warlock Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Warlock') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Warlock') end,
condition_valid_msg="You must be a Warlock to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariostage 1 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Seething Shore/0 0.00,0.00 > 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Summon Voidwalker |scenariogoal 2/29810
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Agony on the Target Dummy |scenariogoal 3/29811
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Corruption on the Target Dummy |scenariogoal 4/29812
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Shadow Bolt on the Target Dummy |scenariogoal 5/40241
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Unstable Affliction on the Target Dummy |scenariogoal 6/29814
step
_On the Deck of the Airship:_
Cast Agony |scenariogoal 7/29811
Cast Corruption |scenariogoal 7/29812
Cast Unstable Affliction |scenariogoal 7/29814
Cast Shadow Bolt |scenariogoal 7/40241
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Drain Life on the Target Dummy |scenariogoal 8/40242
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Fear on the Soldier |scenariogoal 9/29815
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Attacker |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Warrior Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and raceclass('Warrior') and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Warrior') end,
condition_valid_msg="You must be a Warrior to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk General Bret Hughes##100448
Tell him _"I'm ready to begin."_
Talk to General Bret Hughes |scenariostage 1 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Seething Shore/0 0.00,0.00 > 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Charge on the Target Dummy |scenariogoal 2/30115
step
_On the Deck of the Airship:_
Watch the dialogue
Use Mortal Strike on the Target Dummy |scenariogoal 3/30116
step
_On the Deck of the Airship:_
Watch the dialogue
Use Slam on the Target Dummy |scenariogoal 4/30117
step
_On the Deck of the Airship:_
Watch the dialogue
Use Overpower on the Target Dummy |scenariogoal 5/40181
step
_On the Deck of the Airship:_
Use Overpower |scenariogoal 6/40181
Use Mortal Strike |scenariogoal 6/30116
Use Slam |scenariogoal 6/30117
step
_On the Deck of the Airship:_
Watch the dialogue
kill Arcane Construct##101738+
Kill an Arcane Construct and then Use Victory Rush on the Others |scenariogoal 7/30119
step
_On the Deck of the Airship:_
Watch the dialogue
Use Whirlwind on the Arcane Constructs |scenariogoal 8/30120
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
step
_On the Deck of the Airship:_
Watch the dialogue
Use Heroic Leap |scenariogoal 9/30121
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Snowy Gryphon##32335
|tip At the top of the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##60545
step
talk High Inquisitor Whitemane##171789
Tell her _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 60545/1 |goto Stormwind City/0 76.70,42.74
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
