local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Orgrimmar Trading Post Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Orgrimmar Trading Post.",
patch='100005',
},[[
step
talk Shiri##185472
accept Tour the Trading Post##66959 |goto Orgrimmar/1 48.91,76.12
step
click Collector's Cache
Collect the Trader's Tender from the Collector's Cache |q 66959/1 |goto 48.47,75.66
step
talk Zaa'je##199164
Speak to Zaa'je |q 66959/3 |goto 48.22,75.01
step
talk Gothal##199115
Speak to Gothal |q 66959/2 |goto 47.43,76.45
step
click Trading Post Post
Review the Trading Post Post |q 66959/4 |goto 48.91,76.31
step
talk Zen'kala##185473
Tell him _"I'd like to see what you have to offer this month."_
|tip You will need to exit the interface after doing this to continue.
Look at Zen'kala's Inventory |q 66959/5 |goto 48.76,75.96
step
talk Shiri##185472
turnin Tour the Trading Post##66959 |goto 48.91,76.12
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Primal Storms pre-patch invasion intro quests.",
keywords={"10.0.2"},
patch='100002',
condition_end=function() return completedq(66323) end,
startlevel=10,
},[[
step
accept The Dragon Isles Await##65435
|tip You will accept this quest automatically.
step
talk Ebyssian##190239
|tip On the platform above the city.
turnin The Dragon Isles Await##65435 |goto Orgrimmar/1 44.05,37.96
accept Aspectral Invitation##65437 |goto Orgrimmar/1 44.05,37.96
step
talk Ebyssian##190239
|tip On the platform above the city.
Choose _"<Listen to Ebonhorn.>"_
Speak with Ebyssian |q 65437/1 |goto 44.05,37.96
step
talk Ebyssian##190239
|tip On the platform above the city.
turnin Aspectral Invitation##65437 |goto 44.05,37.96
step
talk Scalecommander Cindrethresh##184786
|tip On the platform above the city.
accept The Dark Talons##72256 |goto 44.02,38.25
step
talk Naleidea Rivergleam##184793
|tip On the platform above the city.
accept Expeditionary Coordination##65443 |goto 44.18,37.78
step
talk Pathfinder Tacha##184796
|tip On top of the rocks above the city.
Tell her _"We need explorers for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Explorers |q 65443/2 |goto 38.60,56.95
step
talk Boss Magor##184787
|tip On the ground, on the fishing dock.
Tell him _"We need artisans for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Artisans |q 65443/1 |goto 57.10,54.11
step
Enter the building |goto 70.36,49.01 < 10 |walk |only if not (subzone("The Wyvern's Tail") and _G.IsIndoors())
talk Cataloger Coralie##184795
|tip Upstairs inside the building.
Tell her _"We need scholars for an expedition to the Dragon Isles. Will you join us?"_
Recruit the Scholars |q 65443/3 |goto 71.45,50.63
step
talk Kodethi##198442
|tip On top of the wall.
Tell him _"Scalecommander Cindrethresh would like you to meet her at the zeppelin tower."_
Deliver the Orders to Kodethi |q 72256/1 |goto 55.08,89.61
step
talk Naleidea Rivergleam##197279
|tip On top of the tower.
turnin Expeditionary Coordination##65443 |goto Durotar/0 55.81,12.66
turnin The Dark Talons##72256 |goto Durotar/0 55.81,12.66
step
Watch the dialogue
talk Archmage Khadgar##193450
|tip On top of the tower.
|tip He appears out of a portal.
accept Whispers on the Winds##65439 |goto 55.92,12.60
step
talk Archmage Khadgar##193450
|tip On top of the tower.
Tell him _"<Ask Khadgar what happened.>"_
Speak with Archmage Khadgar |q 65439/1 |goto 55.92,12.60
step
talk Ebyssian##190239
|tip On top of the tower.
turnin Whispers on the Winds##65439 |goto 55.84,12.75
accept Legacy of Tyr: Secrets of the Past##66586 |goto 55.84,12.75
|only if level >= 70
step
talk Naleidea Rivergleam##197279
|tip On top of the tower.
accept Chasing Storms##69944 |goto 55.81,12.66
step
talk Archmage Khadgar##193450
|tip On top of the tower.
accept A Primal Threat##69923 |goto 55.92,12.60
step
talk Storm Huntress Suhrakka##195899
|tip On top of the tower.
turnin Chasing Storms##69944 |goto 55.95,12.32
stickystart "Collect_Sigil_of_Storms"
step
Kill enemies at Primal Invasion sites
|tip Go to an active primalist invasion site on the map in Northern Barrens, Tirisfal Glades, Badlands, or Un'Goro Crater.
|tip Going to Badlands will allow you to enter the dungeon right after for the next quest if you plan to use a pre-made group.
|tip Kill enemies and collect motes of energy.
collect 10 Mote of Primal Energy##192493 |q 69923/1 |goto Badlands/0 28.47,45.68
step
label "Collect_Sigil_of_Storms"
collect Sigil of Storms##198080 |q 69992 |future
|tip Kill a Lord that spawns at the end of an invasion to collect this item.
step
Recover the Disc of Tyr's Memories |q 66586/1 |goto Uldaman Legacy of Tyr/1 40.24,26.42 |or
|tip Make your way towards Chrono-Lord Deios in the Uldaman: Legacy of Tyr dungeon.
|tip You will recover the memory in the room before reaching him.
Click Here to Load the "Uldaman: Legacy of Tyr" Dungeon Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Uldaman: Legacy of Tyr" |or
|only if haveq(66586) or completedq(66586)
step
kill Chrono-Lord Deios##184125 |q 66586/2 |goto Uldaman Legacy of Tyr/1 40.24,26.42 |or
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
|only if haveq(66586) or completedq(66586)
step
talk Storm Huntress Suhrakka##195899
|tip On top of the tower.
turnin Sigil of Storms##69992 |goto Durotar/0 55.95,12.32
step
talk Ebyssian##190239
|tip On top of the tower.
turnin Legacy of Tyr: Secrets of the Past##66586 |goto 55.84,12.75
|only if haveq(66586) or completedq(66586)
step
talk Archmage Khadgar##193450
|tip On top of the tower.
turnin A Primal Threat##69923 |goto 55.92,12.60
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Primal Storms Daily Quest",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Primal Storms pre-patch invasion daily quest.",
keywords={"10.0.2"},
patch='100002',
condition_end=function() return completedq(69925) end,
startlevel=10,
},[[
step
Complete the "A Primal Threat" Quest |q 69923 |future |or
|tip Use the "Primal Storms Questline" guide to accomplish this.
Click Here to Load the "Primal Storms Questline" Leveling Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline" |or
step
label "Begin_Daily_Quest"
talk Archmage Khadgar##193450
|tip On top of the tower.
accept Calming the Storms##69925 |goto Durotar/0 55.92,12.60
step
Kill enemies at Primal Invasion sites
|tip Go to an active primalist invasion site on the map in Northern Barrens, Tirisfal Glades, Badlands, or Un'Goro Crater.
|tip Going to Badlands will allow you to enter the dungeon right after for the next quest if you plan to use a pre-made group.
|tip Kill enemies and collect motes of energy.
collect 10 Mote of Primal Energy##192493 |q 69925/1 |goto Badlands/0 28.47,45.68
step
talk Archmage Khadgar##193450
|tip On top of the tower.
turnin Calming the Storms##69925 |goto Durotar/0 55.92,12.60
step
You completed the daily quest for today
|tip This guide will reset when it can be completed again.
'|complete not completedq(69925) |next "Begin_Daily_Quest"
]])
