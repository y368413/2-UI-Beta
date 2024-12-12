local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHSHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Blood Elf Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Blood Elf exclusive questline.",
keywords={"9.2.5"},
patch='90205',
condition_valid=function() return raceclass("BloodElf") end,
condition_valid_msg="You must be a Blood Elf to complete this guide!",
condition_end=function() return completedq(65653) end,
startlevel=60,
},[[
step
Reach Level 60 |ding 60
|tip Use various leveling guides to accomplish this.
step
Reach Exalted Reputation with Silvermoon City |complete rep("Silvermoon City") >= Exalted
|tip Use the "Silvermoon City" reputation guide to accomplish this.
Click Here to Load the Silvermoon City Reputation Guide |loadguide "Reputation Guides\\Burning Crusade Reputations\\Silvermoon City"
step
talk Lady Liadrin##176789
accept Summons from the Matriarch##65652 |goto Oribos/0 25.45,52.16
step
Enter the building |goto Silvermoon City/0 88.75,37.56 < 7 |walk
talk Lady Liadrin##176796
|tip Inside the building.
turnin Summons from the Matriarch##65652 |goto 90.06,37.52
accept Briefing##63480 |goto 90.06,37.52
step
Watch the dialogue
|tip Inside the building.
Listen to the Briefing |q 63480/1 |goto 90.06,37.52
step
talk Lady Liadrin##176796
|tip Inside the building.
turnin Briefing##63480 |goto 90.06,37.52
accept Tranquillien Besieged##63481 |goto 90.06,37.52
step
click Portal to Tranquillien
|tip Inside the building.
Take the Portal to Tranquillien |q 63481/1 |goto 89.90,38.89
step
Enter the building |goto Ghostlands/0 48.34,31.98 < 7
talk Lady Liadrin##176826
|tip Inside the building.
turnin Tranquillien Besieged##63481 |goto 48.53,32.13
accept Death to the Scourge##63482 |goto 48.53,32.13
step
talk Archmage Aethas Sunreaver##176829
|tip Inside the building.
accept Magus Installation##63483 |goto 48.65,32.11
stickystart "Slay_15_Scourge"
step
clicknpc Protection Ward##176843
kill Vorath##176856
Arm the Southeast Ward |q 63483/1 |goto 49.35,36.74
step
clicknpc Protection Ward##176860
kill Vorath##176862
Arm the Southwest Ward |q 63483/2 |goto 45.38,34.95
step
clicknpc Protection Ward##176866
kill Vorath##176868
Arm the North Ward |q 63483/3 |goto 44.95,30.79
step
label "Slay_15_Scourge"
Kill enemies around this area
Slay #15# Scourge |q 63482/1 |goto 45.28,31.52
step
Enter the building |goto 48.33,31.97 < 7
talk Archmage Aethas Sunreaver##176829
|tip Inside the building.
turnin Magus Installation##63483 |goto 48.65,32.11
step
talk Lady Liadrin##176826
|tip Inside the building.
turnin Death to the Scourge##63482 |goto 48.53,32.12
accept A Knight's Weapon##63484 |goto 48.53,32.12
step
Run up the ramp |goto 48.75,30.91 < 10 |only if walking
click Weapons Rack##366592
collect 1 Forged Ranseur##184895 |q 63484/1 |goto 48.47,32.39
step
Enter the building |goto 48.33,31.98 < 7 |walk
talk Lady Liadrin##176826
|tip Inside the building.
turnin A Knight's Weapon##63484 |goto 48.54,32.13
accept An Honest Heart##63485 |goto 48.54,32.13
accept An Unbreakable Will##63486 |goto 48.54,32.13
step
click Portal to Orgrimmar |goto 48.90,32.50
Return to Orgrimmar |goto Orgrimmar/1 57.10,89.81 < 10 |c |noway |q 63486
step
Enter the building |goto Maldraxxus/0 47.81,46.02 < 7 |walk
talk Salandria##176914
|tip Inside the building.
turnin An Unbreakable Will##63486 |goto 46.70,45.79
step
talk Fightlord San##176915
|tip Inside the building.
accept Unfair Fight##63519 |goto 46.74,45.85
step
talk Fightlord San##176915
|tip Inside the building.
Tell him _"I'm ready to fight!"_
Speak to Fightlord San to Begin Combat |q 63519/1 |goto 46.74,45.85
step
kill 1 Frisson##176917 |q 63519/2 |goto 46.82,45.54
step
talk Fightlord San##176918 |goto 47.25,46.01
Tell him _"Take me back down."_
Return to the Theater of Pain |goto 46.40,45.33 < 20 |c |noway |q 63519
step
talk Fightlord San##176915
|tip Inside the building.
turnin Unfair Fight##63519 |goto 46.74,45.84
step
talk Salandria##176930
turnin An Honest Heart##63485 |goto Bastion/0 45.02,68.88
step
talk Vandellor##176932
accept A Fair Race##63522 |goto 45.05,68.89
step
talk Vandellor##176932
Tell him _"I'm ready to race."_
|tip Be prepared to run quickly and click Racing Bells along the path.
Speak with Vandellor to Begin the Race |q 63522/1 |goto 45.05,68.89
step
map Bastion/0
path follow smart; loop off; ants curved; dist 7
path	45.52,68.41	46.23,67.50	46.19,66.81	45.62,65.32	45.89,64.15
path	46.33,63.83	47.41,64.89	47.02,66.39
click Racing Bell+
|tip Click the large white bells along the path to progress through the race.
|tip They can be clicked while moving and each one grants a stacking speed buff.
Race Against Vandellor |goto 47.02,66.39 < 7 |c |noway |q 63522
step
map Bastion/0
path follow smart; loop off; ants curved; dist 7
path	46.18,66.79	46.18,67.52	45.52,68.41	45.06,68.65
click Racing Bell+
|tip Click the large white bells along the path to progress through the race.
|tip They can be clicked while moving and each one grants a stacking speed buff.
Run the Race Against Vandellor |q 63522/2
step
talk Vandellor##176932
|tip It may take a moment for Vandellor to return, depending on your lead.
turnin A Fair Race##63522 |goto 45.05,68.89
step
talk Salandria##176930
accept Return to the Ghostlands##63487 |goto 45.02,68.88
step
Enter the building |goto Ghostlands/0 48.33,31.98 < 7 |walk
talk Lady Liadrin##176826
|tip Inside the building.
turnin Return to the Ghostlands##63487 |goto 48.53,32.12
accept I Am the Blade of the Light##63488 |goto 48.53,32.12
step
clicknpc Thalassian Warstrider##176991
Mount the Thalassian Warstrider |q 63488/1 |goto 39.42,47.02
step
extraaction Brandish Ranseur##367787
Kill enemies around this area
Slay Scourge in the Dead Scar |q 63488/2 |goto 37.34,64.95
step
talk Lady Liadrin##176882
turnin I Am the Blade of the Light##63488 |goto 35.56,72.99
accept Justice Long Overdue##63489 |goto 35.56,72.99
step
extraaction Throw Ranseur##349270
|tip Use it the first time you kill Vorath.
kill 1 Vorath##176864 |q 63489/1 |goto 33.58,77.91
|tip Avoid dark orbs that move in straight lines.
|tip Kill any Shards of Entropy that spawn.
|tip Move out of green areas on the ground.
|tip After Vorath resurrects, kill ravens that spawn or kite him away from them.
|tip Ravens that reach Vorath will heal him.
step
talk Lady Liadrin##176882
turnin Justice Long Overdue##63489 |goto Ghostlands/0 34.20,77.40
accept Victory for the Sin'dorei##65653 |goto 34.20,77.40
step
Enter the building |goto Silvermoon City/0 88.77,37.54 < 7 |walk
talk Lady Liadrin##176796
|tip Inside the building.
turnin Victory for the Sin'dorei##65653 |goto 90.06,37.52
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Stolen Shipments",{
author="support@zygorguides.com",
description="This guide will walk you through completing the new small quest chain in Orgrimmar.",
keywords={"9.2.5"},
patch='90205',
condition_end=function() return completedq(66323) end,
startlevel=1,
},[[
step
talk Zaa'je##187758
accept Stolen Shipments##66253 |goto Orgrimmar/1 48.54,75.90
step
use the Explosive Pie##191408
|tip Use it on the Thief.
Deter the Thief |q 66253/1 |goto 44.73,62.57
step
clicknpc Shiri's Shipment##187987
Collect the Shipment |q 66253/2 |goto 44.73,62.57
step
talk Zaa'je##187758
turnin Stolen Shipments##66253 |goto 48.54,75.90
accept Idling Pie##66323 |goto 48.54,75.90
step
use the Explosive Pie##191682
|tip Use it on the Worker.
Wake the Worker in the Valley of Strength |q 66323/3 |goto 54.38,75.83
step
use the Explosive Pie##191682
|tip Use it on the Worker.
Wake the Worker in The Drag |q 66323/2 |goto 60.92,56.26
step
use the Explosive Pie##191682
|tip Use it on the Worker.
Wake the Worker Near the Orgrimmar Embassy |q 66323/1 |goto 36.58,83.88
step
talk Zaa'je##187758
turnin Idling Pie##66323 |goto 48.54,75.90
]])
