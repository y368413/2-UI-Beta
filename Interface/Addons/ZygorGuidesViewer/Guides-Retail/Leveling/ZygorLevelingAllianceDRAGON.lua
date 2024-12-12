local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("LevelingADRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Stormwind Trading Post Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Stormwind Trading Post.",
patch='100005',
},[[
step
talk Tawny Seabraid##185468
accept Tour the Trading Post##66858 |goto Stormwind City/0 50.97,71.85
step
click Collector's Cache
Collect the Trader's Tender from the Collector's Cache |q 66858/1 |goto 51.31,72.33
step
talk Valarian##198579
Speak to Valarian |q 66858/2 |goto 49.17,71.71
step
talk Dilya##198589
|tip She walks around this area.
Speak to Dilya |q 66858/3 |goto 51.33,70.86
step
click Trading Post Post
Review the Trading Post Post |q 66858/4 |goto 51.04,71.62
step
talk Wilder Seabraid##185467
Tell him _"I'd like to see what you have to offer this month."_
|tip You will need to exit the interface after doing this to continue.
Look at Wilder Seabraid's Inventory |q 66858/5 |goto 51.08,72.08
step
talk Tawny Seabraid##185468
turnin Tour the Trading Post##66858 |goto 50.97,71.85
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Primal Storms pre-patch invasion intro quests.",
keywords={"10.0.2"},
patch='100002',
condition_end=function() return completedq(70048) end,
startlevel=10,
},[[
step
accept The Dragon Isles Await##65436
|tip You will accept this quest automatically.
step
talk Wrathion##189569
|tip Standing in an open window on the outer wall of Stormwind Keep.
turnin The Dragon Isles Await##65436 |goto Stormwind City/0 79.80,27.02
accept Aspectral Invitation##66577 |goto Stormwind City/0 79.80,27.02
step
talk Wrathion##189569
|tip Inside the building.
Choose _<Listen to Wrathion and Turalyon.>_
Speak with Wrathion |q 66577/1 |goto 79.80,27.02
step
talk Wrathion##189569
|tip Inside the building.
turnin Aspectral Invitation##66577 |goto 79.80,27.02
step
talk Scalecommander Azurathel##189603
|tip Inside the building.
accept The Obsidian Warders##72240 |goto 79.94,26.95
step
talk Toddy Whiskers##189602
|tip Inside the building.
accept Expeditionary Coordination##66589 |goto 79.72,27.33
step
talk Thaelin Darkanvil##189767
Tell him _"We need artisans for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Artisans |q 66589/1 |goto 64.14,37.22
step
talk Cataloger Wulferd##189765
Tell him _"We need scholars for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Scholars |q 66589/3 |goto 63.35,69.90
step
talk Dervishian##198401
|tip On top of the building.
Tell her _"Scalecommander Azurathel would like you to meet him at the docks."_
Deliver the Orders to Dervishian |q 72240/1 |goto 50.91,67.39
step
talk Pathfinder Jeb##189763
Tell him _"We need explorers for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Explorers |q 66589/2 |goto 38.31,45.55
step
talk Toddy Whiskers##189077
turnin Expeditionary Coordination##66589 |goto 22.71,55.66
turnin The Obsidian Warders##72240 |goto 22.71,55.66
step
Watch the dialogue
talk Archmage Khadgar##193450
|tip He appears out of a portal.
accept Whispers on the Winds##66596 |goto 23.01,56.14
step
talk Archmage Khadgar##193450
Choose _<Ask Khadgar what happened.>_
Speak with Archmage Khadgar |q 66596/1 |goto 23.01,56.14
step
talk Wrathion##189569
turnin Whispers on the Winds##66596 |goto 22.94,55.99
step
talk Toddy Whiskers##189077
accept Chasing Storms##70050 |goto 22.72,55.66
step
talk Wrathion##189569
accept Legacy of Tyr: Secrets of the Past##66458 |goto 22.94,56.00
|only if level >= 70
step
talk Archmage Khadgar##193450
accept A Primal Threat##70048 |goto 23.00,56.15
step
talk Storm Hunter William##195912
turnin Chasing Storms##70050 |goto 24.99,53.07
stickystart "Collect_Sigil_of_Storms"
step
Kill enemies at Primal Invasion sites
|tip Go to an active primalist invasion site on the map in Northern Barrens, Tirisfal Glades, Badlands, or Un'Goro Crater.
|tip Going to Badlands will allow you to enter the dungeon right after for the next quest if you plan to use a pre-made group.
|tip Kill enemies and collect motes of energy.
collect 10 Mote of Primal Energy##192493 |q 70048/1 |goto Badlands/0 28.47,45.68
step
label "Collect_Sigil_of_Storms"
collect Sigil of Storms##198352 |q 70055 |future
|tip Kill a Lord that spawns at the end of an invasion to collect this item.
step
Recover the Disc of Tyr's Memories |q 66458/1 |goto Uldaman Legacy of Tyr/1 40.24,26.42 |or
|tip Make your way towards Chrono-Lord Deios in the Uldaman: Legacy of Tyr dungeon.
|tip You will recover the memory in the room before reaching him.
Click Here to Load the "Uldaman: Legacy of Tyr" Dungeon Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Uldaman: Legacy of Tyr" |or
|only if haveq(66458) or completedq(66458)
step
kill Chrono-Lord Deios##184125 |q 66458/2 |goto Uldaman Legacy of Tyr/1 40.24,26.42 |or
_EVERYONE:_ |grouprole EVERYONE
|tip "Temporal Zone" increases haste by 50%. |grouprole EVERYONE
|tip Avoid standing in "Eternity Zones." |grouprole EVERYONE
|tip Dodge "Eternity Orbs" before they reach you. |grouprole EVERYONE
|tip "Wing Buffet" deals damage and knocks everyone back. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip The party will take heavy damage during "Rewind Timeflow" at 0 energy. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Sand Breath" deals heavy damage. |grouprole TANK
Click Here to Load the "Uldaman: Legacy of Tyr" Dungeon Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Uldaman: Legacy of Tyr" |or
|only if haveq(66458) or completedq(66458)
step
talk Storm Hunter William##195912
turnin Sigil of Storms##70055 |goto Stormwind City/0 24.99,53.07
step
talk Wrathion##189569
turnin Legacy of Tyr: Secrets of the Past##66458 |goto 22.94,56.00
|only if haveq(66458) or completedq(66458)
step
talk Archmage Khadgar##193450
turnin A Primal Threat##70048 |goto 23.00,56.15
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Primal Storms Daily Quest",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Primal Storms pre-patch invasion daily quest.",
keywords={"10.0.2"},
patch='100002',
condition_end=function() return completedq(70049) end,
startlevel=10,
},[[
step
Complete the "A Primal Threat" Quest |q 70048 |future |or
|tip Use the "Primal Storms Questline" guide to accomplish this.
Click Here to Load the "Primal Storms Questline" Leveling Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline" |or
step
label "Begin_Daily_Quest"
talk Archmage Khadgar##193450
accept Calming the Storms##70049 |goto Stormwind City/0 23.00,56.15
step
Kill enemies at Primal Invasion sites
|tip Go to an active primalist invasion site on the map in Northern Barrens, Tirisfal Glades, Badlands, or Un'Goro Crater.
|tip Going to Badlands will allow you to enter the dungeon right after for the next quest if you plan to use a pre-made group.
|tip Kill enemies and collect motes of energy.
collect 10 Mote of Primal Energy##192493 |q 70049/1 |goto Badlands/0 28.47,45.68
step
talk Archmage Khadgar##193450
turnin Calming the Storms##70049 |goto Stormwind City/0 23.00,56.15
step
You completed the daily quest for today
|tip This guide will reset when it can be completed again.
'|complete not completedq(70049) |next "Begin_Daily_Quest"
]])
