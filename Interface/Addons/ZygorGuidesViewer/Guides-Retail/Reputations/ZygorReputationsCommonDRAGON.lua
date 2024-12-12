local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("ReputationsCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition",{
author="support@zygorguides.com",
description="\nThis guide will walk you through gaining renown and completing activities for the \n"..
"Dragonscale Expedition faction of the Dragon Isles.",
condition_suggested=function() return level == 60 and completedq(65452,70122) and not completedq(70834) end,
condition_end=function() return completedq(70834) end,
areapoiid=7365,
areapoitype="faction (Dragonscale Expedition)",
startlevel=60,
patch='100002',
},[[
step
Complete the "Explorers in Peril" Quest |q 65452 |future |or
|tip This quest is required to unlock Dragonscale Expedition renown.
|tip Progress through The Waking Shores leveling guide to unlock it.
Click Here to Load the Full Zone Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
_Or_
Click Here to Load the Story Only Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 2 with the Dragonscale Expedition |complete factionrenown(2507) >= 2
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept Lost Expedition Scouts##70822 |goto The Waking Shores/0 47.33,83.40
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 3 with the Dragonscale Expedition |complete factionrenown(2507) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Simple Excavation Tools##70335 |goto The Waking Shores/0 47.92,82.08
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 4 with the Dragonscale Expedition |complete factionrenown(2507) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept Expedition Cloaks##70812 |goto The Waking Shores/0 47.33,83.40
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 5 with the Dragonscale Expedition |complete factionrenown(2507) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept Digging Up Treasure##70813 |goto The Waking Shores/0 47.33,83.40
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Boss Magor##189065
accept Sturdy Expedition Shovel##70835 |goto The Waking Shores/0 46.94,82.90
|only if hasprof("Dragon Isles Blacksmithing",100)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 6 with the Dragonscale Expedition |complete factionrenown(2507) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
_Next to you:_
talk Doc Nanners##188103
accept A Climber's Calling##69855
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Pathfinder Jeb##187700
turnin A Climber's Calling##69855 |goto The Waking Shores/0 47.33,83.40
accept Basic Climbing Gear##72524 |goto 47.33,83.40
|only if haveq(69855) or completedq(69855)
step
click Climbing Gear
|tip Click the "Climbing Gear" ability at the top of the middle row.
Research the Climbing Gear Ability |q 72524/1 |goto 47.30,83.39
|only if haveq(72524) or completedq(72524)
step
talk Pathfinder Jeb##187700
turnin Basic Climbing Gear##72524 |goto 47.33,83.40
accept Smoke Over the Mountain##66351 |goto 47.33,83.40
|only if haveq(72524) or completedq(72524)
step
talk Rocky Dustbeard##181039
turnin Smoke Over the Mountain##66351 |goto 62.35,50.45
accept Climb Every Mountain##65421 |goto 62.35,50.45
|only if haveq(66351) or completedq(66351)
step
click Climbing Gear
Put on the Climbing Gear |q 65421/1 |goto 62.35,50.54
|only if haveq(65421) or completedq(65421)
step
click Handhold
Find a Handhold on the Cliff |q 65421/2 |goto 63.30,50.14
|only if haveq(65421) or completedq(65421)
step
click Clinging Gustbloom Sample
|tip Click the handholds to reach the Gustbloom.
collect Clinging Gustbloom Sample##191138 |q 65421/3 |goto 63.25,49.81
|only if haveq(65421) or completedq(65421)
step
Climb to the right |goto 63.46,50.02 < 5 |walk
clicknpc Pathfinder Yips##187349
Rescue Pathfinder Yips |q 65421/4 |goto 63.09,49.82
|only if haveq(65421) or completedq(65421)
step
talk Rocky Dustbeard##181039
turnin Climb Every Mountain##65421 |goto 62.35,50.45
|only if haveq(65421) or completedq(65421)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 7 with the Dragonscale Expedition |complete factionrenown(2507) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Advanced Excavation Tools##70807 |goto The Waking Shores/0 47.92,82.08
|tip If you have completed this quest on an alt, you may need to skip this step.
step
accept Dormant Discovery##66595
|tip You will accept this quest automatically.
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Dormant Discovery##66595 |goto The Waking Shores/0 47.20,90.25
accept This Old Stone##66597 |goto 47.20,90.25
|only if haveq(66595) or completedq(66595)
step
click Etched Ancient Monolith
Choose _<Inspect the monolith.>_
Investigate the Etched Ancient Monolith |q 66597/1 |goto 47.28,90.30
|only if haveq(66597) or completedq(66597)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin This Old Stone##66597 |goto 47.20,90.25
accept Nightborne Know-How##66598 |goto 47.20,90.25
|only if haveq(66597) or completedq(66597)
step
talk Warpcaster Delandra##189764
turnin Nightborne Know-How##66598 |goto The Azure Span/0 45.93,40.65
accept Curiosity is Key##70215 |goto 45.93,40.65
|only if haveq(66598) or completedq(66598)
step
talk Warpcaster Delandra##189764
Ask her _"What can you tell me about the symbols?"_
Inquire About the Stones |q 70215/1 |goto 45.93,40.65
|only if haveq(70215) or completedq(70215)
step
talk Warpcaster Delandra##189764
turnin Curiosity is Key##70215 |goto 45.93,40.65
accept Power Procurement##66582 |goto 45.93,40.65
|only if haveq(70215) or completedq(70215)
step
Kill enemies around this area
Capture the Energy |q 66582/1 |goto 40.26,61.77
|only if haveq(66582) or completedq(66582)
step
talk Warpcaster Delandra##189764
turnin Power Procurement##66582 |goto 45.93,40.65
accept A Gateway to Somewhere##70154 |goto 45.93,40.65
|only if haveq(66582) or completedq(66582)
step
Watch the dialogue
click Warpcaster's Portal
Take Warpcaster Delandra's Portal |q 70154/1 |goto 45.92,40.90
|only if haveq(70154) or completedq(70154)
step
click Warpcaster's Portal
Take the Warpcaster Spire Portal |q 70154/2 |goto 52.82,35.66
|only if haveq(70154) or completedq(70154)
step
Watch the dialogue
kill Frenzied Arcane Thirster##195202 |q 70154/3 |goto 64.63,42.84
|only if haveq(70154) or completedq(70154)
step
click A Gateway to Somewhere
Escape with Warpcaster Delandra |q 70154/4 |goto 64.69,42.96
|only if haveq(70154) or completedq(70154)
step
talk Warpcaster Delandra##189764
turnin A Gateway to Somewhere##70154 |goto 48.60,30.30
accept An Ancient Awakening##70156 |goto 48.60,30.30
|only if haveq(70154) or completedq(70154)
step
Watch the dialogue
Prepare to Charge the Waygate |q 70156/1 |goto 48.38,30.24
|only if haveq(70156) or completedq(70156)
step
extraaction Open Vessel##386193
Watch the dialogue
Empower the Waygate |q 70156/2 |goto 48.38,30.13
|only if haveq(70156) or completedq(70156)
step
Kill enemies at the top of the tower
clicknpc Latent Arcana##195535+
|tip They look like glowing motes of energy at the top of the tower.
Transfer Energy to the Waygate |q 70156/3 |goto 48.33,30.13
|only if haveq(70156) or completedq(70156)
step
click Ancient Waygate
Use the Cobalt Assembly Waygate |q 70156/4 |goto 48.33,30.13
|only if haveq(70156) or completedq(70156)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin An Ancient Awakening##70156 |goto The Waking Shores/0 47.20,90.25
|only if haveq(70156) or completedq(70156)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 8 with the Dragonscale Expedition |complete factionrenown(2507) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##70702
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##70702 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 0 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
_Next to you:_
talk Doc Nanners##196643
|tip He should eventually appear.
accept A Cataloger's Paradise##69869
step
talk Cataloger Coralie##187707
turnin A Cataloger's Paradise##69869 |goto The Waking Shores/0 48.53,82.67
accept Basic Cataloging Gear##72525 |goto 48.53,82.67
step
click Expedition Supply Kit
|tip Click the "Cataloging Gear" ability at the top of the middle row.
Research the Cataloging Gear Ability |q 72525/1 |goto 47.30,83.38
step
talk Cataloger Coralie##187707
turnin Basic Cataloging Gear##72525 |goto 48.53,82.67
accept Pictures with Purpose##69870 |goto 48.53,82.67
step
talk Akunda the Cataloger##185651
turnin Pictures with Purpose##69870 |goto 49.88,68.42
accept Picture Perfect##65486 |goto 49.88,68.42
step
click Cataloger's Raft
Ride the Cataloger's Raft |q 65486/1 |goto 49.98,68.51
step
Take Pictures of Wildlife |q 65486/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
step
talk Akunda the Cataloger##185651
turnin Picture Perfect##65486 |goto 49.88,68.42
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 9 with the Dragonscale Expedition |complete factionrenown(2507) >= 9
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Initial Mysteries of the Dragon Isles Drakes##70808 |goto The Waking Shores/0 47.92,82.08
step
talk Pathfinder Jeb##187700
accept Wayfinder's Compass##70828 |goto The Waking Shores/0 47.33,83.40
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 10 with the Dragonscale Expedition |complete factionrenown(2507) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##71146
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##71146 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 1 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 11 with the Dragonscale Expedition |complete factionrenown(2507) >= 11
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Granpap Whiskers##187408
accept The Basecamp 'Pets'##70820 |goto The Waking Shores/0 47.73,83.23
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 12 with the Dragonscale Expedition |complete factionrenown(2507) >= 12
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept New Dragonscale Equipment##70817 |goto The Waking Shores/0 47.33,83.40
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 13 with the Dragonscale Expedition |complete factionrenown(2507) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
_Next to you:_
talk Doc Nanners##196643
accept A New Mystery##69093
step
talk Naleidea Rivergleam##186869
turnin A New Mystery##69093 |goto The Waking Shores/0 47.88,82.42
accept The Sealed Door##66012 |goto 47.88,82.42
step
talk Naleidea Rivergleam##186870
turnin The Sealed Door##66012 |goto Thaldraszus/0 54.49,55.67
accept Investigate the Door##66013 |goto 54.49,55.67
step
click Broken Watcher##376932
Inspect the Broken Watcher |q 66013/1 |goto 54.47,55.73
step
click Titan Door##376116
Inspect the Door |q 66013/2 |goto 54.65,55.74
step
click Broken Watcher Staff##376957
Inspect the Snapped Staff |q 66013/3 |goto 54.26,55.40
step
talk Naleidea Rivergleam##186870
turnin Investigate the Door##66013 |goto 54.49,55.67
accept Speak to Koranos##66673 |goto 54.49,55.67
step
talk Watcher Koranos##197231
Tell him _"I'm here on behalf of the Dragonscale Expedition. What can  you tell me about the sealed Titan facility near Tyrhold?"_
Speak to Koranos |q 66673/1 |goto Valdrakken/0 54.15,46.65
step
Enter the building |goto 34.13,30.17 < 7 |walk
click Watcher Log
|tip Inside the building.
Search the Archives for the Watcher Log |q 66673/2 |goto 34.83,24.95
step
click Watcher Log
|tip Inside the building.
Choose _<Read the first entry.>_
Read the First Entry |q 66673/3 |goto 34.83,24.95
step
click Watcher Log
|tip Inside the building.
Choose _<Read the next entry.>_
Read the Second Entry |q 66673/4 |goto 34.83,24.95
step
click Watcher Log
|tip Inside the building.
Choose _<Read the next entry.>_
Read the Third Entry |q 66673/5 |goto 34.83,24.95
step
click Watcher Log
|tip Inside the building.
Choose _<Take the watcher log.>_
Take the Watcher Log |q 66673/6 |goto 34.83,24.95
step
Exit the Library |q 66673/7 |goto 34.21,28.03
|tip You will be attacked by a weak elite.
step
talk Naleidea Rivergleam##186870
Choose _<Fill her in on the log's contents and the daring attack and theft by Sarkareth.
Speak to Naleidea About What You've Learned |q 66673/8 |goto Thaldraszus/0 54.48,55.67
step
talk Naleidea Rivergleam##186870
turnin Speak to Koranos##66673 |goto 54.48,55.67
accept The Ruins of Szar Skeleth##66094 |goto 54.48,55.67
accept The Abandoned Outpost##70784 |goto 54.48,55.67
accept The City of the Dead##70785 |goto 54.48,55.67
step
talk Naleidea Rivergleam##190855
turnin The City of the Dead##70785 |goto 62.24,18.27
accept The Judgment of Tyr##66814 |goto 62.24,18.27
step
talk Naleidea Rivergleam##190855
Tell her _"Let's get started then."_
Speak to Naleidea |q 66814/1 |goto 62.24,18.27
step
Follow Naleidea |q 66814/2 |goto 62.92,16.87
step
kill Sundered Lookout##196926+
Defeat the Ambushers |q 66814/3 |goto 62.90,16.96
step
Follow Naleidea |q 66814/4 |goto 63.18,15.94
step
kill Sundered Vanguard##196927+
Defeat the Ambushers |q 66814/5 |goto 63.17,15.95
step
Follow Naleidea |q 66814/6 |goto 63.67,14.73
step
kill Sundered Shadetalon##190924+
Defeat the Ambushers |q 66814/7 |goto 63.67,14.73
step
Reach Naleidea |q 66814/8 |goto 64.46,15.14
|tip Inside the building.
step
Click Destroyed objects
|tip Uncover the rubble pile.
|tip Some bugs will attack you.
click Judgment of Tyr
collect The Judgment of Tyr##193072 |q 66814/9 |goto 64.54,15.08
step
talk Naleidea Rivergleam##190865
|tip Inside the building.
turnin The Judgment of Tyr##66814 |goto 64.46,15.14
step
talk Toddy Whiskers##191159
turnin The Ruins of Szar Skeleth##66094 |goto Ohn'ahran Plains/0 39.96,67.50
accept The Insight of Tyr##70507 |goto 39.96,67.50
step
kill Reclaimer Makko##191536 |q 70507/1 |goto 43.84,63.69
step
collect The Insight of Tyr##193070 |q 70507/2 |goto 43.84,63.69
|tip Loot it from Makko.
step
talk Toddy Whiskers##191159
turnin The Insight of Tyr##70507 |goto 39.96,67.50
step
talk Naleidea Rivergleam##193350
turnin The Abandoned Outpost##70784 |goto The Azure Span/0 53.88,50.70
accept The Vigilance of Tyr##70503 |goto 53.88,50.70
stickystart "Collect_6_Magnetized_Splinters"
stickystart "Collect_4_Agitated_Fragment"
stickystart "Collect_2_Tarasek_Pillaged_Piece"
step
kill Obstructed Hornswog##196403
clicknpc Tarasek Hauler##196405
|tip It will be huddle on the ground after the frog dies.
Retrieve the Half Swallowed Sliver |q 70503/5 |goto 53.60,49.61
step
click Far-Flung Fragment
|tip At the top of the tower.
collect Far-Flung Fragment##200478 |q 70503/4 |goto 54.98,49.75
step
label "Collect_6_Magnetized_Splinters"
kill Crystallized Horror##197024
|tip It won't attack you back.
click Magnetized Splinter##381738+
|tip They fall off the Crystallized Horror.
collect 6 Magnetized Splinter##200471 |q 70503/1 |goto 54.26,50.71
step
label "Collect_4_Agitated_Fragment"
kill Crystallized Horror##197024
|tip It won't attack you back.
kill Agitated Shard##197045+
|tip They fall off the Crystallized Horror and attack.
collect 4 Agitated Fragment##200473 |q 70503/2 |goto 54.26,50.71
step
label "Collect_2_Tarasek_Pillaged_Piece"
kill Tarasek Scavenger##197085+
collect 2 Tarasek Pillaged Piece##200474 |q 70503/3 |goto 54.26,50.71
step
talk Naleidea Rivergleam##193350
turnin The Vigilance of Tyr##70503 |goto 53.88,50.70
accept Next Steps##66128 |goto 53.88,50.70
step
Meet Up with Toddy and Naleidea in the Explorer's Tent |q 66128/1 |goto The Waking Shores/0 47.21,82.72
|tip Inside the tent.
step
Watch the dialogue
|tip Inside the tent.
Listen to Toddy and Naleidea |q 66128/2 |goto 47.21,82.72
step
talk Toddy Whiskers##187276
|tip Inside the tent.
turnin Next Steps##66128 |goto 47.22,82.72
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 14 with the Dragonscale Expedition |complete factionrenown(2507) >= 14
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept Renowned Explorer's Armor##70819 |goto The Waking Shores/0 47.33,83.40
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 15 with the Dragonscale Expedition |complete factionrenown(2507) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Deeper Mysteries of the Dragon Isles Drakes##70809 |goto The Waking Shores/0 47.92,82.08
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##71148
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##71148 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 2 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 16 with the Dragonscale Expedition |complete factionrenown(2507) >= 16
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Unlocking Magical Treasures##70814 |goto The Waking Shores/0 47.92,82.08
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 17 with the Dragonscale Expedition |complete factionrenown(2507) >= 17
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Researching in Comfort##70831 |goto The Waking Shores/0 47.92,82.08
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##71149
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##71149 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 3 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 18 with the Dragonscale Expedition |complete factionrenown(2507) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept New Dragonscale Equipment##70818 |goto The Waking Shores/0 47.33,83.40
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 19 with the Dragonscale Expedition |complete factionrenown(2507) >= 19
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Cataloger Jakes##189226
|tip Inside the tent.
accept One of Us Now##70832 |goto The Waking Shores/0 47.11,82.58
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 20 with the Dragonscale Expedition |complete factionrenown(2507) >= 20
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
accept Demolitions Access##70815 |goto The Waking Shores/0 47.33,83.40
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##71150
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##71150 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 4 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 21 with the Dragonscale Expedition |complete factionrenown(2507) >= 21
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Boss Magor##189065
accept Rumors of the Jeweled Whelplings##70833 |goto The Waking Shores/0 46.94,82.90
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 22 with the Dragonscale Expedition |complete factionrenown(2507) >= 22
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Rae'ana##188265
accept Broader Mysteries of the Dragon Isles Drakes##70810 |goto The Waking Shores/0 47.92,82.08
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 23 with the Dragonscale Expedition |complete factionrenown(2507) >= 23
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
_Next to you:_
talk Doc Nanners##188103
|tip He should appear next to you.
accept Continued Waygate Exploration##71151
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Continued Waygate Exploration##71151 |goto The Waking Shores/0 47.20,90.25
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
accept Waygate: Algeth'era##71162 |goto 47.20,90.25 |only if not completedq(71162) |noautoaccept |or
accept Waygate: Eon's Fringe##71165 |goto 47.20,90.25 |only if not completedq(71165) |noautoaccept |or
|tip Algeth'era and Eon's Fringe are in Thaldraszus. |only if not completedallq(71162,71165)
accept Waygate: Shady Sanctuary##71178 |goto 47.20,90.25 |only if not completedq(71178) |noautoaccept |or
accept Waygate: Rusza'thar Reach##71138 |goto 47.20,90.25 |only if not completedq(71138) |noautoaccept |or
|tip Shady Sanctuary and Rusza'thar Reach are in Ohn'ahran Plains. |only if not completedallq(71178,71138)
accept Waygate: Vakthros##71161 |goto 47.20,90.25 |only if not completedq(71161) |noautoaccept |or
|tip Vakthros is in The Azure Span. |only if not completedq(71161)
accept Waygate: Skytop Observatory##71157 |goto 47.20,90.25 |only if not completedq(71157) |noautoaccept |or
|tip Skytop Observatory is in The Waking Shores. |only if not completedq(71157)
|tip Choose a location to link your waygate network to.
|tip You can only choose one location until your next renown unlock.
|only if countcompletedq(71162,71178,71165,71161,71138,71157) == 5 and completedq(70156)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71162/1 |goto Thaldraszus/0 62.42,40.47
|only if haveq(71162)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Algeth'era |goto 62.42,40.47
|only if haveq(71162)
step
click Dormant Waygate
Activate the Waygate |q 71178/1 |goto Ohn'ahran Plains/0 30.66,55.48
|only if haveq(71178)
step
click Ancient Waygate
fpath Shady Sanctuary |goto 30.66,55.48
|only if haveq(71178)
step
click Dormant Waygate
|tip Inside the tower.
Activate the Waygate |q 71165/1 |goto Thaldraszus/0 52.34,78.54
|only if haveq(71165)
step
click Ancient Waygate
|tip Inside the tower.
fpath Eon's Fringe |goto 52.34,78.54
|only if haveq(71165)
step
click Dormant Waygate
|tip At the top of the tower.
Activate the Waygate |q 71161/1 |goto The Azure Span/0 77.59,30.79
|only if haveq(71161)
step
click Ancient Waygate
|tip At the top of the tower.
fpath Vakthros |goto 77.59,30.79
|only if haveq(71161)
step
click Dormant Waygate
Activate the Waygate |q 71138/1 |goto Ohn'ahran Plains/0 81.31,38.98
|only if haveq(71138)
step
click Ancient Waygate
fpath Rusza'thar Reach |goto 81.31,38.98
|only if haveq(71138)
step
click Dormant Waygate
Activate the Waygate |q 71157/1 |goto The Waking Shores/0 75.28,57.02
|only if haveq(71157)
step
click Ancient Waygate
fpath Skytop Observatory |goto 75.28,57.02
|only if haveq(71157)
step
talk Thaelin Darkanvil##189066
|tip Inside the building.
turnin Waygate: Skytop Observatory##71157 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71157)
turnin Waygate: Algeth'era##71162 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71162)
turnin Waygate: Shady Sanctuary##71178 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71178)
turnin Waygate: Eon's Fringe##71165 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71165)
turnin Waygate: Vakthros##71161 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71161)
turnin Waygate: Rusza'thar Reach##71138 |goto The Waking Shores/0 47.20,90.25 |only if haveq(71138)
|only if haveq(71162,71178,71165,71161,71138,71157)
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 24 with the Dragonscale Expedition |complete factionrenown(2507) >= 24
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
label "In_the_Halls_of_Titans_Chapter"
_Next to you:_
talk Doc Nanners##196643
accept A Vault Unsealed##69097
step
talk Cataloger Jakes##189226
|tip Inside the building.
turnin A Vault Unsealed##69097 |goto The Waking Shores/0 47.11,82.57
accept Break on Through##67722 |goto 47.11,82.57
step
talk Toddy Whiskers##191838
turnin Break on Through##67722 |goto Thaldraszus/0 54.27,55.41
accept The Other Side##66636 |goto 54.27,55.41
step
Run up the ramp |goto 54.19,55.18 < 7 |walk
Ascend the Scaffolding to the Location of the Third Watcher |q 66636/1 |goto 54.29,55.30
step
extraaction The Third Watcher##376616
Complete the Unlocking Sequence |q 66636/2 |goto 54.29,55.30
step
Enter the building |goto 54.70,55.79 < 7 |walk
Make your Way Inside |q 66636/3 |goto 54.92,56.04
step
talk Toddy Whiskers##192820
|tip Inside the building.
turnin The Other Side##66636 |goto 55.13,56.34
accept Hall of Samples##66173 |goto 55.13,56.34
accept Hall of the Aspects##66174 |goto 55.13,56.34
step
Enter the Hall of Samples Through the Nearby Teleporter |q 66173/1 |goto 54.87,55.85
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
Listen to Toddy |q 66173/2 |goto 57.20,53.76
step
click Titan Lure
|tip Inside the building.
Pick Up the Titan Lure |q 66173/3 |goto 57.20,53.75
step
clicknpc Escaped Earth Proto-dragon##192618
extraaction Lure Proto-dragon##378253
|tip Inside the building.
|tip It appears as a button on your screen.
|tip Use it on the Proto-dragon.
Lure the Earth Proto-Dragon to the Containment Sphere |q 66173/5 |goto 57.35,53.80 |count 1
Take it to the Sphere at [57.46,53.62]
|tip Make sure you pull it completely inside the circle.
step
clicknpc Escaped Ice Proto-dragon##192617
extraaction Lure Proto-dragon##378253
|tip Inside the building.
|tip It appears as a button on your screen.
|tip Use it on the Proto-dragon.
Lure the Ice Proto-Dragon to the Containment Sphere |q 66173/5 |goto 57.12,53.20 |count 2
Take it to the Sphere at [57.45,53.28]
|tip Make sure you pull it completely inside the circle.
step
clicknpc Escaped Air Proto-dragon##192590
extraaction Lure Proto-dragon##378253
|tip Inside the building.
|tip It appears as a button on your screen.
|tip Use it on the Proto-dragon.
Lure the Air Proto-Dragon to the Containment Sphere |q 66173/5 |goto 57.25,53.02 |count 3
Take it to the Sphere at [57.03,53.63]
|tip Make sure you pull it completely inside the circle.
step
clicknpc Escaped Fire Proto-dragon##192614
extraaction Lure Proto-dragon##378253
|tip Inside the building.
|tip It appears as a button on your screen.
|tip Use it on the Proto-dragon.
Lure the Flame Proto-Dragon to the Containment Sphere |q 66173/5 |goto 57.04,53.51 |count 4
Take it to the Sphere at [57.03,53.29]
|tip Make sure you pull it completely inside the circle.
step
click Security Console
|tip Inside the building.
Activate the Security Console |q 66173/6 |goto 57.24,52.67
step
talk Toddy Whiskers##193374
|tip Inside the building.
turnin Hall of Samples##66173 |goto 57.27,52.74
step
Walk onto the Teleporter |goto 57.25,54.24
|tip Inside the building.
Return to the Hall of Records |goto 54.83,55.93 < 3 |c |noway |q 66174
step
Enter the Hall of the Aspects Through the Nearby Teleporter |q 66174/1 |goto 54.79,56.01
|tip Inside the building.
step
talk Toddy Whiskers##191853
|tip Inside the building.
Speak to Toddy |q 66174/2 |goto 58.24,54.09
step
talk Toddy Whiskers##191853
|tip Inside the building.
Tell her _"Right, I'll watch your back."_
Let Toddy Know You're Ready |q 66174/3 |goto 58.24,54.09
step
kill Security Construct##191868+
|tip Inside the building.
|tip One attacks at each console.
Access the Nozdormu Console |q 66174/4 |goto 58.19,53.43
step
kill Security Construct##191868+
|tip Inside the building.
|tip One attacks at each console.
Access the Alexstrasza Console |q 66174/5 |goto 58.19,53.43
step
kill Security Construct##191868+
|tip Inside the building.
|tip One attacks at each console.
Access the Ysera Console |q 66174/6 |goto 58.19,53.43
step
kill Security Construct##191868+
|tip Inside the building.
|tip One attacks at each console.
Access the Kalecgos Console |q 66174/7 |goto 58.19,53.43
step
kill Security Construct##191868+
|tip Inside the building.
|tip One attacks at each console.
Access the Neltharion Console |q 66174/8 |goto 58.19,53.43
step
click Security Console
|tip Inside the building.
Access the Access Security |q 66174/9 |goto 58.20,52.98
step
talk Toddy Whiskers##191853
|tip Inside the building.
turnin Hall of the Aspects##66174 |goto 58.23,53.06
accept Back to the Main Hall##71152 |goto 58.23,53.06
step
Walk onto the Teleporter |goto 58.19,54.31
|tip Inside the building.
Return to the Hall of Records |goto 54.83,55.93 < 3 |c |noway |q 71152
step
talk Toddy Whiskers##192820
|tip Inside the building.
turnin Back to the Main Hall##71152 |goto 55.13,56.34
accept Retrieve the Discs##66546 |goto 55.13,56.34
step
Watch the dialogue
|tip Inside the building.
Bring the Barrier Down |q 66546/1 |goto 55.13,56.34
step
click Burden Key
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Avoid blue and brown areas on the ground.
Use the Burden Key |q 66546/3 |goto 55.08,56.11
step
click Tyr's Burden##377064
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Avoid blue and brown areas on the ground.
Retrieve the Burden Disc |q 66546/5 |goto 55.42,57.16 |count 1
step
click Vigilance Key
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Avoid blue areas on the ground.
|tip Before nearing the elites, quickly run around 5 brown unique puddles to turn into a titan.
|tip Then quickly run and click the console before the titan buff wears off.
Use the Vigilance Key |q 66546/2 |goto 55.02,56.02
step
click Tyr's Vigilance##377063
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Avoid blue areas on the ground.
|tip Before nearing the elites, quickly run around 5 brown unique puddles to turn into a titan.
|tip Then quickly run and click the console before the titan buff wears off.
Retrieve the Vigilance Disc |q 66546/5 |goto 55.75,56.47 |count 2
step
click Judgement Key
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Move from blue puddle to blue puddle to avoid droppping the key.
|tip Stepping out of a blue puddle will cause you to drop it in 5 seconds.
Use the Judgement Key |q 66546/4 |goto 55.00,56.26
step
click Tyr's Judgment##377062
|tip Inside the building.
|tip You will only have 30 seconds to get it to the console.
|tip Using speed or movement boosts for this may be required.
|tip If you drop it, return to the key and pick it back up.
|tip Avoid brown areas on the ground.
|tip Move from blue puddle to blue puddle to avoid droppping the key.
|tip Stepping out of a blue puddle will cause you to drop it in 5 seconds.
Retrieve the Judgement Disc |q 66546/5 |goto 55.85,57.11 |count 3
step
Escape the Facility |q 66546/6 |goto 54.45,55.55
|tip Avoid blue and brown areas on the ground.
|tip Run out and wait for Toddy to finish talking.
step
talk Toddy Whiskers##192967
turnin Retrieve the Discs##66546 |goto 54.45,55.55
accept It Belongs in a Museum... Eventually##66547 |goto 54.45,55.55
step
Meet Up with Toddy and Naleidea at the Dragonscale Basecamp |q 66547/1 |goto The Waking Shores/0 47.30,82.76
|tip Inside the building.
step
Watch the dialogue
Listen to Toddy and Naleidea |q 66547/2 |goto 47.25,82.77
step
talk Naleidea Rivergleam##192980
turnin It Belongs in a Museum... Eventually##66547
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 25 with the Dragonscale Expedition |complete factionrenown(2507) >= 25
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Cataloger Jakes##189226
|tip Inside the tent.
accept Titled Story##70834 |goto The Waking Shores/0 47.11,82.58
step
talk Granpap Whiskers##187408
accept Skitterfly Riding##70821 |goto 47.73,83.23
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition Flags",{
author="support@zygorguides.com",
description="\nThis guide will walk you through placing flags on the highest peaks in Dragon Isles, gaining 5,000 renown points in the process.",
condition_end=function() return completedq(70824,70823,70825,70826,71204,71208,70827,71207,71200,71215,71218,71216,71220,71221,71217,71223,71224,70039,70024,71222) end,
patch='100002',
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876 |n |repeatable
'|turnin Multiple Dragon Isles Artifacts##71035 |n |repeatable
'|turnin Dragon Isles Artifacts##71034 |n |repeatable
Reach Renown Level 6 with the Dragonscale Expedition |complete factionrenown(2507) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
click Expedition Supply Kit
Learn the Cartographer's Flag Ability |specialtalent Cartographer's Flag##2164 |goto The Waking Shores/0 47.31,83.38
step
click Dragonscale Expedition Flag
Plant the Wingrest Embassy Flag |q 70824 |goto The Waking Shores/0 73.36,38.85 |future |notravel
step
click Dragonscale Expedition Flag
|tip Up on the top of the tower.
Plant the Concord Observatory Flag |q 70823 |goto The Waking Shores/0 56.02,45.41 |future |notravel
step
click Dragonscale Expedition Flag
|tip Up on the top of the tower.
Plant the Obsidian Observatory Flag |q 70825 |goto The Waking Shores/0 43.97,62.95 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
|tip If you have trouble landing, fly into the side of the mountain and then straight up to stall your speed.
|tip Then try to descend onto the peak.
Plant the Dragonbane Keep Flag |q 70826 |goto The Waking Shores/0 28.71,47.73 |future |notravel
step
click Dragonscale Expedition Flag
|tip On top of the mountain.
Plant the Flashfrost Enclave Flag |q 71204 |goto The Waking Shores/0 54.80,74.12 |future |notravel
step
click Dragonscale Expedition Flag
|tip Inside the top of the tower.
Plant the Rusza'thar Reach Flag |q 71208 |goto Ohn'ahran Plains/0 86.31,39.28 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the top of the statue.
Plant the Ohn'ahra's Roost Flag |q 70827 |goto Ohn'ahran Plains/0 57.75,30.81 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
|tip If you have trouble landing, fly into the side of the mountain and then straight up to stall your speed.
|tip Then try to descend onto the peak.
Plant the Nokhudon Hold Flag |q 71207 |goto Ohn'ahran Plains/0 30.39,36.46 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Teerakai Flag |q 71200 |goto Ohn'ahran Plains/0 28.32,77.64 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Ancient Outlook Flag |q 71215 |goto The Azure Span/0 31.91,27.03 |future |notravel
step
click Dragonscale Expedition Flag
|tip On the balcony at the top of the tower.
Plant the Cobalt Assembly Flag |q 71218 |goto The Azure Span/0 46.14,24.99 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Azure Archives Flag |q 71216 |goto The Azure Span/0 37.47,66.21 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Snowhide Camp Flag |q 71220 |goto The Azure Span/0 63.08,48.66 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the top of the mountain.
Plant the Vakthros Range Flag |q 71221 |goto The Azure Span/0 74.85,43.24 |future |notravel
step
click Dragonscale Expedition Flag
Plant the Theron's Watch Flag |q 71217 |goto The Azure Span/0 77.44,18.38 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Eon's Fringe Flag |q 71223 |goto Thaldraszus/0 65.72,74.98 |future |notravel
step
click Dragonscale Expedition Flag
|tip On top of the floating rock.
Plant the Vault of the Incarnates Flag |q 71224 |goto Thaldraszus/0 64.63,56.72 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Stormshroud Peak Flag |q 70039 |goto Thaldraszus/0 50.16,81.63 |future |notravel
step
click Dragonscale Expedition Flag
|tip At the tip of the mountain.
Plant the Bluefeather Cliffs Flag |q 70024 |goto Thaldraszus/0 46.10,73.98 |future |notravel
step
click Dragonscale Expedition Flag
Plant the South Hold Gate Flag |q 71222 |goto Thaldraszus/0 34.04,84.85 |future |notravel
step
click Dragonscale Expedition Flag
Plant the Morqut Village Flag |q 73696 |future |goto The Forbidden Reach/5 27.96,59.84 |notravel
step
click Dragonscale Expedition Flag
Plant the Caldera of the Menders Flag |q 73700 |future |goto The Forbidden Reach/5 36.93,37.91 |notravel
step
click Dragonscale Expedition Flag
|tip On top of the broken wall.
Plant the Froststone Vault Flag |q 73699 |future |goto The Forbidden Reach/5 54.59,34.64 |notravel
step
click Dragonscale Expedition Flag
Plant the Stormsunder Mountain Flag |q 73702 |future |goto The Forbidden Reach/5 76.29,53.45 |notravel
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Iskaara Tuskarr",{
author="support@zygorguides.com",
description="\nThis guide will walk you through gaining renown and completing activities for the \n"..
"Iskaara Tuskarr faction of the Dragon Isles.",
condition_suggested=function() return level == 60 and completedq(65849) and not completedq(70969) end,
condition_end=function() return completedq(70969) end,
startlevel=60,
areapoiid=7393,
areapoitype="faction (Iskaara Tuskarr)",
patch='100002',
},[[
step
Complete the "To Iskaara" Quest |q 65849 |future |or
|tip This quest is required to unlock Iskaara Tuskarr renown.
|tip Progress through The Azure Span leveling guide to unlock it.
Click Here to Load the Full Zone Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)"
_Or_
Click Here to Load the Story Only Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)"
step
Reach Renown Level 2 with the Iskaara Tuskarr |complete factionrenown(2511) >= 2
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Elder Poa##186448
|tip Inside the building.
accept Stolen Tuskarr Totems##70936 |goto The Azure Span/0 12.41,49.34
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 3 with the Iskaara Tuskarr |complete factionrenown(2511) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Community Feasts##70938
step
talk Big Kinook##186126
turnin Community Feasts##70938 |goto The Azure Span/0 13.48,48.62
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto The Azure Span/0 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto The Azure Span/0 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto The Azure Span/0 13.94,49.24
step
talk Lil Ki##186547
|tip He walks around this area.
accept Cooking Utensils##70939 |goto 13.53,48.66
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 5 with the Iskaara Tuskarr |complete factionrenown(2511) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Elder Poa##186448
|tip Inside the building.
accept Tuskarr Champion's Tales##70940 |goto 12.41,49.34
step
_Next to you:_
talk Rowie##197631
accept Tuskarr Fishing Gear##71230
step
talk Tavio##195935
turnin Tuskarr Fishing Gear##71230 |goto The Azure Span/0 12.82,49.18
step
talk Tavio##195935
accept Iskaaran Fishing Net##70871 |goto The Azure Span/0 12.82,49.18
step
click Strong Sea Kelp+
|tip They look like clumps of seaweed next to the water around Iskaara.
|tip They appear on your minimap as yellow dots.
collect 3 Strong Sea Kelp##199924 |q 70871/1 |goto 13.78,49.44
step
click Stone With Hole+
|tip They look like stones at the edge of the water on both sides of the river.
|tip They appear on your minimap as yellow dots.
collect 2 Stone With Hole##199925 |q 70871/2 |goto 12.31,47.39
step
talk Tavio##195935
Tell him _"I'd like to obtain or improve Iskaaran fishing gear."_
|tip Choose the "Iskaaran Fishing Net" and click the "Create" button.
Have Tavio Craft an Iskaaran Fishing Net |q 70871/3 |goto 12.82,49.18
step
talk Tavio##195935
turnin Iskaaran Fishing Net##70871 |goto 12.82,49.18
accept Setting Your Very Own Net##72584 |goto 12.82,49.18
step
click Set Fishing Net
Set Fishing Net |q 72584/1 |goto The Waking Shores/0 63.60,75.36
step
talk Tavio##195935
turnin Setting Your Very Own Net##72584 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 6 with the Iskaara Tuskarr |complete factionrenown(2511) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Highland Fishing##70942 |goto The Azure Span/0 12.82,49.18
step
talk Omapurita##196018
accept Tuskarr Headwear##70953 |goto 14.01,49.35
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 7 with the Iskaara Tuskarr |complete factionrenown(2511) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Harpooning##70943 |goto The Azure Span/0 12.82,49.18
step
talk Norukk##196544
accept Mounting Curiosity##70954 |goto 12.93,48.62
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 8 with the Iskaara Tuskarr |complete factionrenown(2511) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 9 with the Iskaara Tuskarr |complete factionrenown(2511) >= 9
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
map The Azure Span/0
path follow smart; loop on; ants curved; dist 20
path	13.23,48.97	12.93,49.40	12.96,49.99	13.38,50.08	13.73,49.87
path	13.74,49.48	13.39,48.94
talk Jiq##186564
|tip He runs in a large circle around Iskaara.
accept Cute and Cuddly##70959
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 10 with the Iskaara Tuskarr |complete factionrenown(2511) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Ice Fishing##70944 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 11 with the Iskaara Tuskarr |complete factionrenown(2511) >= 11
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept A Lost Tribe##68863
step
talk Murik##193006
turnin A Lost Tribe##68863 |goto The Azure Span/0 13.14,49.26
accept Sudden Isolation##68640 |goto 13.14,49.26
step
talk Guard Hakota##188301
turnin Sudden Isolation##68640 |goto The Waking Shores/0 55.12,38.26
accept Pressing Matters##66409 |goto 55.12,38.26
step
kill Flameshaper Lorak##197260
collect Qalashi Trophy##191855 |q 66409/1 |goto 65.53,31.77
step
talk Guard Hakota##188301
turnin Pressing Matters##66409 |goto 55.12,38.26
accept Worst Impressions##66410 |goto 55.12,38.26
step
Watch the dialogue
Follow Guard Hakota |q 66410/1 |goto 53.61,37.96
step
talk Tutaqan##187323
Tell him _"I have slain your enemies. You have seen proof of my deeds."_
Speak to Tutaqan |q 66410/3 |goto 53.61,37.96
step
talk Tutaqan##187323
turnin Worst Impressions##66410 |goto 53.61,37.96
step
talk Crafter Kuliqa##188285
accept Salvaging Supplies##66417 |goto 53.65,38.01
step
talk Elder Unujaak##188283
accept Troubled Waters##66411 |goto 53.66,37.91
stickystart "Collect_Whalebone_Fragments"
stickystart "Collect_Waterlogged_Wood"
stickystart "Collect_Succulent_Snapper_Meat"
step
use the Tuskarr Fishing Net##192191
|tip Use it on fish in the water.
Catch #10# Warmwater Riverfish |q 66411/1 |goto 52.60,35.00
step
label "Collect_Whalebone_Fragments"
click Whalebone Fragment##376805+
|tip They look like large pieces of bone around the river bank.
collect 8 Whalebone Fragment##191862 |q 66417/1 |goto 52.60,35.00
step
label "Collect_Waterlogged_Wood"
click Pile of Driftwood##376802+
|tip They look like large piles of sticks around the water.
collect 30 Waterlogged Wood##191863 |q 66417/2 |goto 52.60,35.00
step
label "Collect_Succulent_Snapper_Meat"
kill Agitated Snapper##188334+
collect 6 Succulent Snapper Meat##191858 |q 66411/2 |goto 52.60,35.00
step
talk Elder Unujaak##188283
turnin Troubled Waters##66411 |goto 54.11,38.19
step
talk Crafter Kuliqa##188285
Choose _<Hand over the materials.>_
Deliver the Materials to Crafter Kuliqa |q 66417/3 |goto 54.26,38.67
step
talk Crafter Kuliqa##188285
turnin Salvaging Supplies##66417 |goto 54.26,38.67
accept Testing the Tuskarrsenal##66418 |goto 54.26,38.67
step
click Uktulut Bone Spear
Take the Uktulut Bone Spear |q 66418/1 |goto 54.25,38.64
step
extraaction Tuskarr Spear Strike##372582
|tip Use it on the dummies.
Destroy #4# Tuskarr Training Dummies |q 66418/2 |goto 54.08,36.83
step
talk Crafter Kuliqa##188285
turnin Testing the Tuskarrsenal##66418 |goto 54.26,38.67
step
talk Tutaqan##187323
accept All But One##66414 |goto 53.70,37.97
step
Find Ipko |q 66414/1 |goto 56.18,35.56
step
clicknpc Ipko##189808
Pick up Ipko |havebuff Carrying Ipko##372806 |goto 56.18,35.56 |q 66414
step
Return Ipko |q 66414/2 |goto 54.92,36.41
|tip You will periodically be attacked.
|tip Afterwards click Ipko again to pick it back up.
step
talk Tutaqan##187323
turnin All But One##66414 |goto 54.92,36.40
step
talk Elder Unujaak##188283
accept Closure##66440 |goto 54.95,36.47
step
talk Tutaqan##187323
Choose _<Begin the ritual.>_
Speak to Tutaqan |q 66440/1 |goto 53.61,39.23
step
click Tuskarr Incense
Burn the Incense |q 66440/2 |goto 53.59,39.34
step
click Fish Offering
Place the Offering |q 66440/3 |goto 53.60,39.31
step
click Lantern of Karkut
Take the Lantern |q 66440/4 |goto 53.58,39.29
step
Watch the dialogue
Complete the Ritual |q 66440/5 |goto 53.61,39.23
step
talk Tutaqan##187323
turnin Closure##66440 |goto 53.61,39.23
step
talk Elder Unujaak##188283
accept In Mourning##66431 |goto 53.64,39.31
step
talk Tutaqan##187323
Ask him _"Is there anything I can do to help?"_
Offer to Help Tutaqan |q 66431/1 |goto 53.89,41.29
step
talk Tutaqan##187323
turnin In Mourning##66431 |goto 53.89,41.29
accept The Only Way Past Is Through##66415 |goto 53.89,41.29
step
talk Peaceful Ottuk##188816
Approach the Peaceful Ottuk |q 66415/1 |goto 52.85,40.99
step
talk Peaceful Ottuk##188816
Choose _<Pet the ottuk.>_
Pet the Peaceful Ottuk |q 66415/2 |goto 52.85,40.99
step
Take the Peaceful Ottuk to Tutaqan |q 66415/3 |goto 53.89,41.29
step
talk Territorial Ottuk##188813
Approach the Territorial Ottuk |q 66415/4 |goto 54.12,40.25
step
talk Territorial Ottuk##188813
Pet the Territorial Ottuk |q 66415/5 |goto 54.12,40.25
step
click Broken Fishing Pole##381654
collect Broken Fishing Pole##200188 |q 66415/5 |goto 54.48,41.05
step
click Stuffed Duckling Toy##381655
collect Stuffed Duckling Toy##200190 |q 66415/6 |goto 52.92,39.26
step
extraaction Create Lure##389867
|tip It appears as a button on your screen.
Create the Ottuk Lure |q 66415/7 |goto 52.92,39.26
step
talk Territorial Ottuk##188813
Choose _<Wiggle the toy in front of the ottuk.>_
Get the Ottuk to Follow You |havebuff Territorial Ottuk##373615 |goto 54.12,40.25 |q 66415
step
Take the Territorial Ottuk to Tutaqan |q 66415/8 |goto 53.89,41.29
step
talk Dutiful Ottuk##188817
Approach the Dutiful Ottuk |q 66415/9 |goto 54.31,41.97
step
clicknpc Meaty Crab##196815
Collect the Meaty Crab |q 66415/10 |goto 53.30,41.50
step
talk Dutiful Ottuk##188817
Choose _<Offer the crab to the ottuk.>_
Offer the Meaty Crab |q 66415/11 |goto 54.31,41.97
step
Watch the dialogue
Take the Dutiful Ottuk to Tutaqan |q 66415/12 |goto 53.89,41.29
step
talk Tutaqan##187323
turnin The Only Way Past Is Through##66415 |goto 53.89,41.29
step
accept Calling the Hunting Party##66443 |goto 53.89,41.29
|tip You will accept this quest automatically.
step
talk Guard Hakota##188301
Ask him _"What's going on?"_
Investigate the Hunting call |q 66443/1 |goto 53.93,38.14
step
talk Guard Hakota##188301
Choose _"We must go quickly." <Skip current conversation.>_
|tip You can skip the dialogue if you would like.
Listen to the Plan |q 66443/2 |goto 53.93,38.14
step
talk Guard Hakota##188301
turnin Calling the Hunting Party##66443 |goto 53.93,38.14
step
talk Tutaqan##187323
accept While the Iron Is Hot##66444 |goto 53.87,38.14
step
kill Zhurtan the Riverboiler##188687 |q 66444/1 |goto 48.59,46.00
|tip This enemy is elite but NPCs will help you kill it.
step
talk Tutaqan##187323
turnin While the Iron Is Hot##66444 |goto 53.66,37.96
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 12 with the Iskaara Tuskarr |complete factionrenown(2511) >= 12
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Lontupit##196016
|tip He walks around this area.
accept Trader's Apparel##70960 |goto 13.99,49.36
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 13 with the Iskaara Tuskarr |complete factionrenown(2511) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Netting More##70945 |goto The Azure Span/0 12.82,49.18
step
talk Norukk##196544
accept Fascinating Fliers##70955 |goto 12.93,48.62
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 14 with the Iskaara Tuskarr |complete factionrenown(2511) >= 14
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Arvik##186449
accept Wrist Support##70963 |goto 12.90,48.82
step
talk Rokkutuk##194059
accept Iskaaran Crafter's Knowledge##72318 |goto 13.91,50.08 |only if questactive(72318)
accept Iskaaran Crafter's Knowledge##72320 |goto 13.91,50.08 |only if questactive(72320)
accept Iskaaran Crafter's Knowledge##72319 |goto 13.91,50.08 |only if questactive(72319)
accept Iskaaran Crafter's Knowledge##72322 |goto 13.91,50.08 |only if questactive(72322)
accept Iskaaran Crafter's Knowledge##72321 |goto 13.91,50.08 |only if questactive(72321)
|tip You may not receive this quest on an alt.
|only if questactive(72318) or questactive(72320) or questactive(72319) or questactive(72322) or questactive(72321)
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 15 with the Iskaara Tuskarr |complete factionrenown(2511) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Elder Poa##186448
|tip Inside the building.
accept Dragon Isles Champion's Tales##70978 |goto 12.41,49.34
step
talk Tavio##195935
accept Hook, Line, and Swelter!##70948 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 16 with the Iskaara Tuskarr |complete factionrenown(2511) >= 16
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tikukk##187869
accept Trading Made Easier##70966 |goto 12.71,50.34
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 17 with the Iskaara Tuskarr |complete factionrenown(2511) >= 17
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Nunvuq##186554
accept Fishy Entertainment##70967 |goto 13.94,49.25
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 18 with the Iskaara Tuskarr |complete factionrenown(2511) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Skewering Even Bigger Fish##70950 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 19 with the Iskaara Tuskarr |complete factionrenown(2511) >= 19
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Norukk##196544
accept Of Azure Scales##70956 |goto 12.93,48.62
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 20 with the Iskaara Tuskarr |complete factionrenown(2511) >= 20
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 21 with the Iskaara Tuskarr |complete factionrenown(2511) >= 21
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Murik##193006
accept Of the Cloth, of the Community##70968 |goto The Azure Span/0 13.14,49.27
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 22 with the Iskaara Tuskarr |complete factionrenown(2511) >= 22
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Arvik##186449
accept Shrug it On!##70964 |goto 12.90,48.82
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 23 with the Iskaara Tuskarr |complete factionrenown(2511) >= 23
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Lontupit##196016
|tip He walks around this area.
accept A Comfy Seat##70962 |goto 13.99,49.36
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 24 with the Iskaara Tuskarr |complete factionrenown(2511) >= 24
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Hanu##186186
accept Arms for Every Arm##70971 |goto 12.90,48.70
step
talk Rokkutuk##194059
accept Iskaaran Crafting Mastery##72323 |goto 13.91,50.08 |only if questactive(72323)
accept Iskaaran Crafting Mastery##72327 |goto 13.91,50.08 |only if questactive(72327)
accept Iskaaran Crafting Mastery##72326 |goto 13.91,50.08 |only if questactive(72326)
accept Iskaaran Crafting Mastery##72325 |goto 13.91,50.08 |only if questactive(72325)
accept Iskaaran Crafting Mastery##72324 |goto 13.91,50.08 |only if questactive(72324)
|tip You may not receive this quest on an alt.
|only if questactive(72323) or questactive(72327) or questactive(72326) or questactive(72325) or questactive(72324)
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 25 with the Iskaara Tuskarr |complete factionrenown(2511) >= 25
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tatto##186462
accept Our Loyal, Lanky Steeds##70972 |goto 13.80,49.73
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 26 with the Iskaara Tuskarr |complete factionrenown(2511) >= 26
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Murik##193006
accept Slacking and Sledding##70976 |goto 13.14,49.27
step
talk Kiopo##194318
turnin Slacking and Sledding##70976 |goto 24.50,70.82
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 27 with the Iskaara Tuskarr |complete factionrenown(2511) >= 27
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Abandoned... or Hidden Caches##70952 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 28 with the Iskaara Tuskarr |complete factionrenown(2511) >= 28
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Lontupit##196016
|tip He walks around this area.
accept Shouldering the Needed Armor##70961 |goto 13.99,49.36
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 29 with the Iskaara Tuskarr |complete factionrenown(2511) >= 29
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Hanu##186186
accept Scampering Scamps##66218 |goto 12.90,48.70
step
talk Neelo##187674
Choose _"<Ask Neelo what he's doing.>"_
Find Neelo and Nau |q 66218/1 |goto 10.59,46.87
step
Watch the dialogue
talk Neelo##187674
turnin Scampering Scamps##66218 |goto 10.59,46.87
accept Can We Keep It?##66223 |goto 10.59,46.87
step
talk Jinkutuk##193637
buy 7 Frigidfish##192153 |q 66223/1 |goto 13.85,49.48
step
talk Neelo##187674
turnin Can We Keep It?##66223 |goto 10.59,46.87
step
talk Scaps##187680
accept Scaps Packs##70977 |goto 12.86,48.58
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 30 with the Iskaara Tuskarr |complete factionrenown(2511) >= 30
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Murik##193006
accept Becoming One of Our Community##70969 |goto The Azure Span/0 13.14,49.27
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Community Feast",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing tasks for the Iskaara Tuskarr Community Feast event.",
condition_suggested=function() return completedq(70938) and areapoi(2024,7218) end,
patch='100002',
areapoiid=7219,
areapoitype="Community Feast",
},[[
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,300 |goto The Azure Span/0 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |skillmax Dragon Isles Fishing,100 |goto 13.94,49.24
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 3 with the Iskaara Tuskarr |complete factionrenown(2511) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Community Feasts##70938
step
talk Big Kinook##186126
turnin Community Feasts##70938 |goto The Azure Span/0 13.48,48.61
step
label "Wait_For_Feast_To_Begin"
Wait for the Community Feast Event to Begin Preparations |complete inscenario() |goto The Azure Span/0 13.53,48.48
|tip The feast occurs every hour.
|tip It lasts for 15 minutes, during which you will complete tasks repeatedly to increase the quality of the soup.
|tip After completion, you can eat the soup to gain a food buff based on the quality of the resulting soup.
step
talk Pleeqi##196620
accept Community Feast##70893 |goto 13.50,48.51
|tip It may take a moment for Pleeqi to offer you this quest.
step
Get Your Orders from Big Kinook |scenariostart |goto The Azure Span/0 13.48,48.62
|tip Wait for a moment for Big Kinook to start the feast and give you a task.
|tip Stay close to the pot and defend it from enemies if they attack.
|tip If you get pull into the pot, spam the button on your screen as quickly as possible to stir the soup.
stickystart "Complete_Tasks_in_the_Community_Feast"
step
label "Get_Orders_from_Big_Kinook"
Get Your Orders from Big Kinook |scenariogoal 1/54615 |goto 13.48,48.62
|tip Wait for a moment for Big Kinook to give you another task.
|tip Stay close to the pot and defend it from enemies if they attack.
|tip If you get pull into the pot, spam the button on your screen as quickly as possible to stir the soup.
|only if scenariogoal(54615)
step
Proceeding... |complete inscenario()
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Rubbery Fish Head##195808
Tenderize the Rubbery Fish Head |scenariogoal 1/54738 |goto 13.52,48.46
|only if scenariogoal(54738)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Not-So-Tender Morsel##195817
Tenderize the Not-So-Tender Morsel |scenariogoal 1/54739 |goto 13.61,48.51
|only if scenariogoal(54739)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Tough Carp##195819
Tenderize the Tough Carp |scenariogoal 1/54740 |goto 13.60,48.65
|only if scenariogoal(54740)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Bittershell Hermit##195925+
|tip They look like small fish flopping around on the ground next to the Communal Pot.
Stomp them Before they Ruin the Soup |scenariogoal 1/54745 |goto 13.60,48.65
|only if scenariogoal(54745)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Communal Pot
|tip Choose any dialogue options you want.
talk Big Kinook##186126
|tip Select the available dialogue option.
Taste the Soup |scenariogoal 1/54742 |goto 13.47,48.61
|only if scenariogoal(54742)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Big Kinook##186126
|tip Use the abilities on your vehicle bar 8 times to complete this.
Speak with Big Kinook #8# Times to Regain Soupervisor |scenariogoal 1/54743 |goto 13.47,48.61
|only if scenariogoal(54743)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Escaping Fish##195920+
|tip They look like small fish flopping around on the ground next to the Communal Pot.
Toss the Fish Back into the Pot |scenariogoal 1/54744 |goto 13.59,48.65
|only if scenariogoal(54744)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Jinkutuk##194100
buy Salted Fish Scraps##199063 |scenariogoal 1/54998 |goto 13.85,49.48
|only if scenariogoal(54998)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Jarii##194100
Ask him _"Got any Peppersmelt?"_
collect Peppersmelt##199100 |scenariogoal 1/55000 |goto 13.94,49.27
|only if scenariogoal(55000)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Dragonhead Eel##196399
collect Dragonhead Eel##199833 |scenariogoal 1/55013 |goto 13.48,49.94
|only if scenariogoal(55013)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Dried Wyldermane Kelp##380950
collect Dried Wyldermane Kelp##199101 |scenariogoal 1/55001 |goto 13.41,48.07
|only if scenariogoal(55001)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Bukarakikk##186568
buy Hunk o' Blubber##199102 |scenariogoal 1/55002 |goto 12.51,49.80
|only if scenariogoal(55002)
step
extraaction Yes Chef!##386907
Enter the building |goto 12.78,49.34 < 7 |walk
talk Elder Nappa##186446
buy Nappa's Famous Tea##199103 |scenariogoal 1/55003 |goto 12.40,49.41
|only if scenariogoal(55003)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tuukanit##192560
|tip Inside the building.
buy Piping-Hot Orca Milk##199104 |scenariogoal 1/55004 |goto 13.22,49.57
|only if scenariogoal(55004)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Ancheevy##380952+
collect 3 Ancheevy##199105 |scenariogoal 1/55005 |goto 12.94,48.85
|only if scenariogoal(55005)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Tiny Leviathan Bone##380951
collect Tiny Leviathan Bone##199106 |scenariogoal 1/55006 |goto 12.55,49.75
|only if scenariogoal(55006)
step
cast Fishing##131474
|tip Fish in Clubfish Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Clubfish##199212 |scenariogoal 1/55007 |goto 13.20,48.02
|only if scenariogoal(55007)
step
cast Fishing##131474
|tip Fish in Grungle Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Grungle##199208 |scenariogoal 1/55008 |goto 13.72,48.43
|only if scenariogoal(55008)
step
cast Fishing##131474
|tip Fish in Iceback Sculpin Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Iceback Sculpin##199207 |scenariogoal 1/55009 |goto 13.84,49.00
|only if scenariogoal(55009)
step
cast Fishing##131474
|tip Fish in Lakkamuk Blenny Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Lakkamuk Blenny##199213 |scenariogoal 1/55010 |goto 14.22,49.39
|only if scenariogoal(55010)
step
cast Fishing##131474
|tip Fish in Manasucker Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Manasucker##199205 |scenariogoal 1/55011 |goto 13.57,47.41
|only if scenariogoal(55011)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Smoked Seaviper##196400
collect Smoked Seaviper##199832 |scenariogoal 1/55012 |goto 12.92,48.65
|only if scenariogoal(55012)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Pulpy Seagrass##381351
collect Pulpy Seagrass##199834 |scenariogoal 1/55014 |goto 12.63,50.46
|only if scenariogoal(55014)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Torga's Braid##381352
collect Torga's Braid##199835 |scenariogoal 1/55015 |goto 14.11,49.38
|only if scenariogoal(55015)
step
extraaction Stir the Soup##386933
|tip Spam the button as quickly as possible to stir the soup.
|tip Clear the "Yes Chef!" ability from your screen first to use this ability.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
Hop into the Pot and Stir! |scenariogoal 1/55061 |goto 13.52,48.60
|only if scenariogoal(55061)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
|tip It walks around this area.
buy Juicy Bushfruit##204295 |scenariogoal 1/58319 |goto 13.35,48.91
|only if scenariogoal(58319)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
|tip It walks around this area.
buy Greenberry##204293 |scenariogoal 1/58317 |goto 13.35,48.91
|only if scenariogoal(58317)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
buy Fresh Dragon Fruit##204294 |scenariogoal 1/58318 |goto 13.41,48.92
|only if scenariogoal(58318)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Westfall Stew##204303 |scenariogoal 1/58327 |goto 13.63,47.93
|only if scenariogoal(58327)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Dragonbreath Chili##204304 |scenariogoal 1/58328 |goto 13.63,47.92
|only if scenariogoal(58328)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Undermine Clam Chowder##204302 |scenariogoal 1/58326 |goto 13.63,47.92
|only if scenariogoal(58326)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Scorpid Surprise##204301 |scenariogoal 1/58325 |goto 13.63,47.92
|only if scenariogoal(58325)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
buy Seven Spices Bruffalon##204289 |scenariogoal 1/58313 |goto 13.71,49.19
|only if scenariogoal(58313)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
|tip She walks around this area.
buy "Volcano" Duck##204292 |scenariogoal 1/58316 |goto 13.71,49.12
|only if scenariogoal(58316)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
|tip She walks around this area.
buy Dragonflame Argali##204290 |scenariogoal 1/58314 |goto 13.64,48.90
|only if scenariogoal(58314)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
buy Thrice-Charred Mammoth Ribs##204291 |scenariogoal 1/58315 |goto 13.64,48.89
|only if scenariogoal(58315)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Norukk##196544
buy Norukk's "All-Purpose" Fish Powder##204284 |scenariogoal 1/58308 |goto 12.93,48.62
|only if scenariogoal(58308)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Four-Cheese Blend##204300 |scenariogoal 1/58324 |goto 13.47,48.45
|only if scenariogoal(58324)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Flaky Pastry Dough##204298  |scenariogoal 1/58322 |goto 13.47,48.45
|only if scenariogoal(58322)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Exquisite Ohn'ahran Potato##204297 |scenariogoal 1/58321 |goto 13.47,48.45
|only if scenariogoal(58321)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Dark Thaldraszian Cocoa Powder##204299 |scenariogoal 1/58323 |goto 13.47,48.45
|only if scenariogoal(58323)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Rokkutuk##194059
buy Deepsquid Ink##204286 |scenariogoal 1/58310 |goto 13.91,50.08
|only if scenariogoal(58310)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tattukiaka##199448
buy Fermented Mackerel Paste##204285 |scenariogoal 1/58309 |goto 14.03,49.71
|only if scenariogoal(58309)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Hanu##186186
buy Eye of Bass##204288 |scenariogoal 1/58312 |goto 12.90,48.70
|only if scenariogoal(58312)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tikukk##187869
buy Island Crab Jerky##204287 |scenariogoal 1/58311 |goto 12.71,50.34
|only if scenariogoal(58311)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Arvik##186449
buy Skrog Liver Oil##204283 |scenariogoal 1/58307 |goto 12.90,48.82
|only if scenariogoal(58307)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Junnik##186558
buy Thousandbite Piranha Collar##204281 |scenariogoal 1/58305 |goto 13.89,49.50
|only if scenariogoal(58305)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Patchu##196069
buy Lunker Bits##204282 |scenariogoal 1/58306 |goto 13.89,49.85
|only if scenariogoal(58306)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
buy Dried Coldsnap Sagittate##204296 |scenariogoal 1/58320 |goto 13.27,48.79
|only if scenariogoal(58320)
step
Waiting for Next Stage |complete scenariogoal(54615) |or |next "Get_Orders_from_Big_Kinook"
'|complete scenariogoal(54614,54647,54648,54649,54652,54733,54735,54736,54737,54650,54651,54653,54734,58341,58342,58351,58343,58352,58350,58349,58337,58340,58338,58339,58332,58348,58346,58345,58347,58334,58333,58336,58335,58331) |or
|only if inscenario()
step
extraaction Salted Fish Scraps##386267
Throw Salted Fish Scraps in the Pot |scenariogoal 2/54614 |goto 13.57,48.57
|only if scenariogoal(54614)
step
extraaction Spicy Fish##386413
Throw Spicy Fish in the Pot |scenariogoal 2/54647 |goto 13.57,48.59
|only if scenariogoal(54647)
step
extraaction Assorted Kelp##386414
Throw the Seaweed in the Pot |scenariogoal 2/54648 |goto 13.57,48.57
|only if scenariogoal(54648)
step
extraaction Hunk o' Blubber##386415
Throw a Hunk o' Blubber in the Pot |scenariogoal 2/54649 |goto 13.57,48.57
|only if scenariogoal(54649)
step
extraaction Ancheevies##386418
Throw Ancheevies in the Pot |scenariogoal 2/54652 |goto 13.57,48.57
|only if scenariogoal(54652)
step
extraaction Clubfish##386890
Throw a Clubfish in the Pot |scenariogoal 2/54733 |goto 13.58,48.60
|only if scenariogoal(54733)
step
extraaction Iceback Sculpin##386888
Throw an Iceback Sculpin in the Pot |scenariogoal 2/54735 |goto 13.57,48.57
|only if scenariogoal(54735)
step
extraaction Lakkamuk Blenny##386891
Throw a Lakkamuk Blenny in the Pot |scenariogoal 2/54736 |goto 13.57,48.57
|only if scenariogoal(54736)
step
extraaction Manasucker##386886
Throw a Manasucker in the Pot |scenariogoal 2/54737 |goto 13.57,48.57
|only if scenariogoal(54737)
step
extraaction Nappa's Famous Tea##386416
Pour Nappa's Famous Tea in the Pot |scenariogoal 2/54650  |goto 13.57,48.57
|only if scenariogoal(54650)
step
extraaction Piping-Hot Orca Milk##386417
Pour Piping-Hot Orca Milk in the Pot |scenariogoal 2/54651 |goto 13.57,48.57
|only if scenariogoal(54651)
step
extraaction Tiny Leviathan Bone##386419
Throw the Tiny Leviathan Bone in the Pot |scenariogoal 2/54653 |goto 13.57,48.57
|only if scenariogoal(54653)
step
extraaction Grungle##386889
Throw a Grungle in the Pot |scenariogoal 2/54734 |goto 13.57,48.57
|only if scenariogoal(54734)
step
extraaction Greenberry##404101
Throw a Greenberry in the Pot |scenariogoal 2/58341 |goto 13.53,48.52
|only if scenariogoal(58341)
step
extraaction Fresh Dragon Fruit##404102
Throw the Fresh Dragon Fruit in the Pot |scenariogoal 2/58342 |goto 13.57,48.61
|only if scenariogoal(58342)
step
extraaction Rations: Westfall Stew##404111
Pour the Rations: Westfall Stew in the Pot |scenariogoal 2/58351 |goto 13.54,48.51
|only if scenariogoal(58351)
step
extraaction Juicy Bushfruit##404103
Throw the Juicy Bushfruit in the Pot |scenariogoal 2/58343 |goto 13.53,48.52
|only if scenariogoal(58343)
step
extraaction Rations: Dragonbreath Chili##404112
Throw the Rations: Dragonbreath Chili in the Pot |scenariogoal 2/58352 |goto 13.54,48.54
|only if scenariogoal(58352)
step
extraaction Rations: Undermine Clam Chowder##404110
Pour the Rations: Undermine Clam Chowder in the Pot |scenariogoal 2/58350 |goto 13.55,48.53
|only if scenariogoal(58350)
step
extraaction Rations: Scorpid Surprise##404109
Throw the Rations: Scorpid Surprise in the Pot |scenariogoal 2/58349 |goto 13.54,48.54
|only if scenariogoal(58349)
step
extraaction Seven Spices Bruffalon##404097
Throw the Seven Spices Bruffalon in the Pot |scenariogoal 2/58337 |goto 13.58,48.65
|only if scenariogoal(58337)
step
extraaction "Volcano" Duck##404100
Throw the "Volcano" Duck in the Pot |scenariogoal 2/58340 |goto 13.57,48.60
|only if scenariogoal(58340)
step
extraaction Dragonflame Argali##404098
Throw the Dragonflame Argali in the Pot |scenariogoal 2/58338 |goto 13.57,48.62
|only if scenariogoal(58338)
step
extraaction Thrice-Charred Mammoth Ribs##404099
Throw the Thrice-Charred Mammoth Ribs in the Pot |scenariogoal 2/58339 |goto 13.57,48.64
|only if scenariogoal(58339)
step
extraaction Norukk's "All-Purpose" Fish Powder##404092
Sprinkle Norukk's "All-Purpose" Fish Powder Into the Pot |scenariogoal 2/58332 |goto 13.51,48.53
|only if scenariogoal(58332)
step
extraaction Four-Cheese Blend##404108
Sprinkle the Four-Cheese Blend in the Pot |scenariogoal 2/58348 |goto 13.54,48.53
|only if scenariogoal(58348)
step
extraaction Flaky Pastry Dough##404106
Throw the Flaky Pastry Dough in the Pot |scenariogoal 2/58346 |goto 13.54,48.54
|only if scenariogoal(58346)
step
extraaction Exquisite Ohn'ahran Potato##404129
Throw the Exquisite Ohn'ahran Potato in the Pot |scenariogoal 2/58345 |goto 13.55,48.52
|only if scenariogoal(58345)
step
extraaction Dark Thaldraszian Cocoa Powder##404107
Sprinkle some Dark Thaldraszian Cocoa Powder in the Pot |scenariogoal 2/58347 |goto 13.55,48.54
|only if scenariogoal(58347)
step
extraaction Deepsquid Ink##404094
Pour the Deepsquid Ink in the Pot |scenariogoal 2/58334 |goto 13.58,48.65
|only if scenariogoal(58334)
step
extraaction Fermented Mackerel Paste##404093
Squeeze the Fermented Mackerel Paste in the Pot |scenariogoal 2/58333 |goto 13.58,48.65
|only if scenariogoal(58333)
step
extraaction Eye of Bass##404096
Throw the Eye of Bass in the Pot |scenariogoal 2/58336 |goto 13.57,48.62
|only if scenariogoal(58336)
step
extraaction Island Crab Jerky##404095
Throw the Island Crab Jerky In the Pot |scenariogoal 2/58335 |goto 13.52,48.51
|only if scenariogoal(58335)
step
extraaction Skrog Liver Oil##404091
Pour Some Skrog Liver Oil In the Pot |scenariogoal 2/58331 |goto 13.49,48.52
|only if scenariogoal(58331)
step
extraaction Thousandbite Piranha Collar##404089
Throw Thousandbite Piranha Collar in the pot |scenariogoal 2/58329 |goto 13.57,48.63
|only if scenariogoal(58329)
step
extraaction Lunker Bits##404090
Throw Some Lunker Bits in the pot |scenariogoal 2/58330 |goto 13.57,48.63
|only if scenariogoal(58330)
step
extraaction Dried Coldsnap Sagittate##404104
Throw the Dried Coldsnap Sagittate in the Pot |scenariogoal 2/58344 |goto 13.52,48.50
|only if scenariogoal(58344)
step
Waiting for New Stage |complete scenariogoal(54615) |next "Get_Orders_from_Big_Kinook"
|only if inscenario()
step
label "Complete_Tasks_in_the_Community_Feast"
Complete #5# Tasks in the Community Feast |q 70893/1 |goto 13.57,48.59 |or
|tip Complete various tasks for Big Kinook.
|only if inscenario()
step
talk Pleeqi##196620
turnin Community Feast##70893 |goto 13.50,48.51
|only if readyq(70893) or completedq(70893)
step
click Communal Pot
Choose _<Eat some soup.>_
|tip The soup will stay hot for one hour after the feast ends.
Tip Wait for the Feast to Begin Again |complete inscenario() |next "Wait_For_Feast_To_Begin" |goto The Azure Span/0 13.53,48.60
|tip A new feast begins every hour.
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Fishing Gear Crafting",{
author="support@zygorguides.com",
description="\nThis guide will walk you through crafting the Iskaara fishing gear that unlocks activities across the Dragon Isles.",
condition_suggested=function() return factionrenown(2503) >= 5 end,
patch='100002',
},[[
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto The Azure Span/0 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |skillmax Dragon Isles Fishing,100 |goto The Azure Span/0 13.94,49.24
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 5 with the Iskaara Tuskarr |complete factionrenown(2511) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Tuskarr Fishing Gear##71230
step
talk Tavio##195935
turnin Tuskarr Fishing Gear##71230 |goto The Azure Span/0 12.82,49.18
step
talk Tavio##195935
accept Iskaaran Fishing Net##70871 |goto The Azure Span/0 12.82,49.18
step
click Strong Sea Kelp+
|tip They look like clumps of seaweed next to the water around Iskaara.
|tip They appear on your minimap as yellow dots.
collect 3 Strong Sea Kelp##199924 |q 70871/1 |goto 13.78,49.44
step
click Stone With Hole+
|tip They look like stones at the edge of the water on both sides of the river.
|tip They appear on your minimap as yellow dots.
collect 2 Stone With Hole##199925 |q 70871/2 |goto 12.31,47.39
step
talk Tavio##195935
Tell him _"I'd like to obtain or improve Iskaaran fishing gear."_
|tip Choose the "Iskaaran Fishing Net" and click the "Create" button.
Have Tavio Craft an Iskaaran Fishing Net |q 70871/3 |goto 12.82,49.18
step
talk Tavio##195935
turnin Iskaaran Fishing Net##70871 |goto 12.82,49.18
accept Setting Your Very Own Net##72584 |goto 12.82,49.18
step
click Set Fishing Net
Set Fishing Net |q 72584/1 |goto The Waking Shores/0 63.60,75.36
step
talk Tavio##195935
turnin Setting Your Very Own Net##72584 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 6 with the Iskaara Tuskarr |complete factionrenown(2511) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Highland Fishing##70942 |goto The Azure Span/0 12.82,49.18
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 7 with the Iskaara Tuskarr |complete factionrenown(2511) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
accept Harpooning##70943 |goto The Azure Span/0 12.82,49.18
step
cast Fishing##131474
|tip Fish in any water in the Dragon Isles to gain skill points.
Reach Skill Level 25 in Dragon Isles Fishing |skill Dragon Isles Fishing,25
step
click Harpoon Head
|tip Laying on the anvil.
collect Harpoon Head##200076 |goto 12.90,48.79 |q 70792 |future
step
click Wooden Pole
|tip It looks like a stick laying on the ground.
collect Wooden Pole##200077 |goto 12.07,41.15 |q 70792 |future
It can also spawn at [20.79,36.17]
step
click Broken Fishing Pole |goto 50.49,36.66
click Torn Fishing Net |goto 50.07,38.08
click Old Harpoon |goto 49.20,38.42
kill Fisherman Tinnak##193691
|tip This is a rare spawn event that will not always be active.
collect Tattered Seavine##198070 |goto 49.20,38.42 |q 70792 |future
step
talk Tavio##195935
|tip Choose the "Fishing Gear" category and then the "Iskaaran Harpoon" entry.
|tip Click the "Create" button.
Create an Iskaaran Harpoon |q 70792 |goto The Azure Span/0 12.82,49.18 |future
step
click Flying Fish Bones
collect Flying Fish Bones##200075 |goto 12.50,49.94 |q 67139 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Flying Fish Bone Charm" entry.
|tip Click the "Create" button.
Create a Flying Fish Bone Charm |q 67139 |goto The Azure Span/0 12.82,49.18 |future
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 10 with the Iskaara Tuskarr |complete factionrenown(2511) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
cast Fishing##131474
|tip Fish in any water in the Dragon Isles to gain skill points.
Reach Skill Level 50 in Dragon Isles Fishing |skill Dragon Isles Fishing,50
step
talk Tavio##195935
accept Ice Fishing##70944 |goto The Azure Span/0 12.82,49.18
step
click Old Pickaxe
collect Pickaxe Blade##200078 |goto 18.88,24.29 |q 67141 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Iskaaran Ice Axe" entry.
|tip Click the "Create" button.
Create an Iskaaran Ice Axe |q 67141 |goto The Azure Span/0 12.82,49.18 |future
stickystart "Collect_Battered_Imbu-made_Net"
stickystart "Reach_Renown_13"
step
cast Fishing##131474
|tip Fish from Prismatic Leaper Schools at the top of the mountain.
|tip A pool should respawn roughly every 5-10 minutes.
|tip You can also farm these from special "Deep" ice fishing holes at "Grimtusk's Fishing Hole" in The Azure Span.
|tip "Overheated Magma Pools" in The Waking Shores can also drop these.
|tip They are a rare drop and may take a while to catch.
collect 3 Draconium Nugget##200080 |goto Ohn'ahran Plains/0 58.36,31.67 |q 70800 |future
step
label "Collect_Battered_Imbu-made_Net"
cast Fishing##131474 |notinsticky
|tip Fish from Prismatic Leaper Schools at the top of the mountain. |notinsticky
|tip A pool should respawn roughly every 5-10 minutes. |notinsticky
|tip You can also farm these from special "Deep" ice fishing holes at "Grimtusk's Fishing Hole" in The Azure Span. |notinsticky
|tip They are a rare drop and may take a while to catch. |notinsticky
collect 3 Battered Imbu-made Net##200082 |goto Ohn'ahran Plains/0 58.36,31.67 |q 70802 |future
step
label "Reach_Renown_13"
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34 |notinsticky
|tip Inside the building. |notinsticky
|tip Turn in Stolen Totems from treasures in The Azure Span for rep. |notinsticky
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 13 with the Iskaara Tuskarr |complete factionrenown(2511) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
|tip Choose the "Fishing Gear Upgrades" category and then the "Draconium Net Weights" entry.
|tip Click the "Create" button.
Create a Draconium Net Weight |q 70800 |goto The Azure Span/0 12.82,49.18 |future
step
talk Tavio##195935
|tip Choose the "Fishing Gear Upgrades" category and then the "Imbu Knot" entry.
|tip Click the "Create" button.
Create an Imbu Knot |q 70802 |goto The Azure Span/0 12.82,49.18 |future
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 15 with the Iskaara Tuskarr |complete factionrenown(2511) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
click Sea-Polished Basalt+
|tip They look like small rocks near the waterline around the fishing trainer.
collect 3 Sea-Polished Basalt##200079 |goto The Waking Shores/0 81.26,31.32 |q 67140 |future
step
talk Tavio##195935
|tip Choose the "Fishing Spots" category and then the "Polished Basalt Bracelet" entry.
|tip Click the "Create" button.
Create a Polished Basalt Bracelet |q 67140 |goto The Azure Span/0 12.82,49.18 |future
stickystart "Collect_Strong_Seavine"
stickystart "Collect_Salinated_Serevite"
stickystart "Reach_Renown_18"
step
cast Fishing##131474
|tip Fish from Prismatic Leaper Schools at the top of the mountain.
|tip A pool should respawn roughly every 5-10 minutes.
|tip You can also farm these from ice fishing holes at "Grimtusk's Fishing Hole" in The Azure Span.
collect 3 Irontree Branch##200083 |goto Ohn'ahran Plains/0 58.36,31.67 |q 70794 |future
step
label "Collect_Strong_Seavine"
cast Fishing##131474
|tip Fish from Prismatic Leaper Schools at the top of the mountain.
|tip A pool should respawn roughly every 5-10 minutes.
|tip You can also farm these from ice fishing holes at "Grimtusk's Fishing Hole" in The Azure Span.
collect 3 Strong Seavine##200081 |goto Ohn'ahran Plains/0 58.36,31.67 |q 70798 |future
step
label "Collect_Salinated_Serevite"
cast Fishing##131474
|tip Fish from Prismatic Leaper Schools at the top of the mountain.
|tip A pool should respawn roughly every 5-10 minutes.
|tip You can also farm these from ice fishing holes at "Grimtusk's Fishing Hole" in The Azure Span.
collect 3 Salinated Serevite##200084 |goto Ohn'ahran Plains/0 58.36,31.67 |q 70796 |future
step
label "Reach_Renown_18"
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34 |notinsticky
|tip Inside the building. |notinsticky
|tip Turn in Stolen Totems from treasures in The Azure Span for rep. |notinsticky
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 18 with the Iskaara Tuskarr |complete factionrenown(2511) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Tavio##195935
|tip Choose the "Fishing Gear Upgrades" category and then the "Irontree Harpoon Handle" entry.
|tip Click the "Create" button.
Create an Irontree Harpoon Handle |q 70794 |goto The Azure Span/0 12.82,49.18 |future
step
talk Tavio##195935
|tip Choose the "Fishing Gear Upgrades" category and then the "Seavine Harpoon Rope" entry.
|tip Click the "Create" button.
Create a Seavine Harpoon Rope |q 70798 |goto The Azure Span/0 12.82,49.18 |future
step
talk Tavio##195935
|tip Choose the "Fishing Gear Upgrades" category and then the "Serevite Harpoon Head" entry.
|tip Click the "Create" button.
Create a Serevite Harpoon Head |q 70796 |goto The Azure Span/0 12.82,49.18 |future
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Maruuk Centaur",{
author="support@zygorguides.com",
description="\nThis guide will walk you through gaining renown and completing activities for the \n"..
"Maruuk Centaur faction of the Dragon Isles.",
condition_suggested=function() return level == 60 and completedq(65806) and not completedq(71091) end,
condition_end=function() return completedq(71091) end,
areapoiid=7392,
areapoitype="faction (Maruuk Centaur)",
startlevel=60,
patch='100002',
},[[
step
Complete the "Maruukai" Quest |q 65806 |future |or
|tip This quest is required to unlock Maruuk Centaur renown.
|tip Progress through the Ohn'ahran Plains leveling guide to unlock it.
Click Here to Load the Full Zone Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)"
_Or_
Click Here to Load the Story Only Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)"
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 2 with the Maruuk Centaur |complete factionrenown(2503) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 3 with the Maruuk Centaur |complete factionrenown(2503) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Cultural Exchange##72117 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 4 with the Maruuk Centaur |complete factionrenown(2503) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip The Aylaag Nomads will offer you quests each time they set up camp in Ohn'ahran Plains.
step
_Next to you:_
talk Roki##197627
accept Call of the Plains##71229
step
talk Hadari Khan##185853 |only if areapoi(2023,7101) or areapoi(2023,7102) or areapoi(2023,7103)
Wait for the Camp to Stop |complete false |only if default
|tip The camp will stop shortly at a new location. |only if default
|tip You need to be inside Ohn'ahran Plains to detect its location. |only if default
turnin Call of the Plains##71229 |goto Ohn'ahran Plains/0 70.98,62.59 |only if areapoi(2023,7101)
turnin Call of the Plains##71229 |goto Ohn'ahran Plains/0 71.39,31.04 |only if areapoi(2023,7102)
turnin Call of the Plains##71229 |goto Ohn'ahran Plains/0 55.92,51.78 |only if areapoi(2023,7103)
|only if not completedq(71229)
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 5 with the Maruuk Centaur |complete factionrenown(2503) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
_Next to you:_
talk Roki##197627
accept Call of the Hunt##71231
step
talk Trainer Frodrum##192926
turnin Call of the Hunt##71231 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Hunt Instructor Basku##195454
accept License to Hunt##70501 |goto 64.01,41.00
stickystart "Hunt_Creatures"
step
kill Nubagh##195514 |q 70501/4 |goto 66.77,33.08
step
kill 3 Invasive Clearwater Snapper##195506 |q 70501/3 |goto 67.65,32.83
step
clicknpc Injured Baby Salamanther##195462+
|tip They look like tiny salamanthers laying near the water around this area.
Revive #5# Injured Baby Salamanthers |q 70501/2 |goto 66.97,34.82
step
label "Hunt_Creatures"
Kill enemies around this area
Hunt Creatures |q 70501/1 |goto 67.41,35.44
step
talk Hunt Instructor Basku##195454
turnin License to Hunt##70501 |goto Ohn'ahran Plains/0 64.01,41.00
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 6 with the Maruuk Centaur |complete factionrenown(2503) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Observing the Wind##71058 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 7 with the Maruuk Centaur |complete factionrenown(2503) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Farrier Rondare##195547
accept To Adorn Your Head##71060 |goto Ohn'ahran Plains/0 62.54,42.47
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Good at Doings, Not Understandings##72363 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 8 with the Maruuk Centaur |complete factionrenown(2503) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Hatchling Plans##72137 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 9 with the Maruuk Centaur |complete factionrenown(2503) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Companion##70541 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Trainer Frodrum##192926
Tell him _"I want to choose my Shikaar hunting tactics."_
Select a Hunting Companion |q 70541/1 |goto 62.49,41.63
|tip Choose one of the talents from the first row based on your preference.
step
talk Trainer Frodrum##192926
turnin Hunting Tactics: Companion##70541 |goto 62.49,41.63
step
talk Windsage Ordven##195302
accept A Disgruntled Initiate##65906 |goto Ohn'ahran Plains/0 63.12,34.04
step
talk Initiate Radiya##190014
turnin A Disgruntled Initiate##65906 |goto 56.26,75.96
accept Sneaking Out##65901 |goto 56.26,75.96
step
click Wind Totem
Place the Wind Totem |q 65901/1 |goto 56.65,76.27 |count 1
step
click Wind Totem
Place the Wind Totem |q 65901/1 |goto 57.36,76.33 |count 2
step
click Wind Totem
Place the Wind Totem |q 65901/1 |goto 57.01,75.48 |count 3
step
talk Initiate Radiya##190014
Tell her _"The totems are placed."_
Inform Radiya |q 65901/2 |goto 56.25,75.95
step
talk Initiate Radiya##190014
turnin Sneaking Out##65901 |goto 54.79,66.40
accept Favorite Fruit##65907 |goto 54.79,66.40
step
click Wildsprings Shrub+
|tip They look like green bushes on the ground around this area.
collect 6 Wild Bushfruit##192743 |q 65907/1 |goto 53.53,71.02
step
use the Wild Bushfruit##192743+
|tip Use it on Mudstompers.
|tip They look like small and large hippos around this area.
Feed #6# Mudstompers |q 65907/2 |goto 54.28,66.61
step
talk Initiate Radiya##190014
turnin Favorite Fruit##65907 |goto 54.79,66.40
accept A Promise Is A Promise##65770 |goto 54.79,66.40
step
talk Initiate Radiya##190014
Tell her _"I promise to keep your secret."_
Promise Radiya |q 65770/1 |goto 54.79,66.40
step
Meet Radiya Further North |q 65770/2 |goto 53.11,64.01
step
talk Godoloto##190022
|tip He flies down onto the rock.
turnin A Promise Is A Promise##65770 |goto 52.05,63.24
accept More Adventure Than Expected##65761 |goto 52.05,63.24
step
Enter the building |goto 47.49,54.23 < 10 |walk
talk Initiate Radiya##190014
|tip Inside the building.
Find Radiya |q 65761/3 |goto 47.51,54.12
step
talk Initiate Radiya##190014
|tip Inside the building.
turnin More Adventure Than Expected##65761 |goto 47.51,54.12
accept Stealing Its Thunder##65711 |goto 47.51,54.12
step
Enter the cave |goto 47.54,56.07 < 15 |walk
kill Storm Extractor##190011 |q 65711/1 |goto 47.29,56.72
|tip They look like centaurs channeling a blue lightning spell on a dinosaur.
|tip Inside the cave.
step
Leave the cave |goto 47.54,56.07 < 15 |walk |only if subzone("Kaighan Camp") and _G.IsIndoors()
talk Lizi##190009
Choose _"<Gently offer the bushfruit.>"_
Soothe Lizi the Thunder Lizard |q 65711/2 |goto 48.31,56.60
step
talk Initiate Radiya##190014
|tip She runs to this location.
turnin Stealing Its Thunder##65711 |goto 48.27,56.49
accept Sneaking In##66676 |goto 48.27,56.49
step
talk Initiate Radiya##190014
Return to Radiya in Ohn'iri Springs |q 66676/1 |goto 56.20,77.10
step
talk Initiate Radiya##190014
turnin Sneaking In##66676 |goto 56.20,77.10 |or
|tip Turning in this guide quest will unlock the 5-day quest chain to create Lizi's Reins.
|tip This grants you the Lizi, Thunderspine Tramper ground mount.
|tip Use the "Lizi, Thunderspine Tramper" mount guide if you wish to continue this quest chain.
Click Here to Load the "Lizi, Thunderspine Tramper" Mount Guide |confirm |loadguide "Pets & Mounts Guides\\Mounts\\Ground Mounts\\Quest Mounts\\Lizi, Thunderspine Tramper" |or
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 10 with the Maruuk Centaur |complete factionrenown(2503) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Blessing of Ohn'ahra##71028 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Trainer Frodrum##192926
Tell him _"I want to choose my Shikaar hunting tactics."_
Select a Blessing of Ohn'ahra |q 71028/1 |goto 62.49,41.63
|tip Choose one of the talents from the second row based on your preference.
step
talk Trainer Frodrum##192926
turnin Hunting Tactics: Blessing of Ohn'ahra##71028 |goto 62.49,41.63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 11 with the Maruuk Centaur |complete factionrenown(2503) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept A Useful Curiosity##71066 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Whistling Rocks##71067 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 12 with the Maruuk Centaur |complete factionrenown(2503) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Companion Training##71029 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Trainer Frodrum##192926
Tell him _"I want to choose my Shikaar hunting tactics."_
Select a Companion Ability |q 71029/1 |goto 62.49,41.63
|tip Choose one of the talents from the third row based on your preference.
step
talk Trainer Frodrum##192926
turnin Hunting Tactics: Companion Training##71029 |goto 62.49,41.63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 13 with the Maruuk Centaur |complete factionrenown(2503) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Farrier Rondare##195547
accept Mantle of Friendship##71073 |goto Ohn'ahran Plains/0 62.54,42.47
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 14 with the Maruuk Centaur |complete factionrenown(2503) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Befriending Wings and Wind##71074 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Quartermaster Huseng##196707
accept A Gift of Knowledge##72311 |goto 60.40,37.72
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept A Gift of Knowledge##72313 |goto 60.40,37.72 |only if storyactive(72313,2023)
accept A Gift of Knowledge##72312 |goto 60.40,37.72 |only if storyactive(72312,2023)
accept A Gift of Knowledge##72310 |goto 60.40,37.72 |only if storyactive(72310,2023)
accept A Gift of Knowledge##72296 |goto 60.40,37.72 |only if storyactive(72296,2023)
accept A Gift of Knowledge##72311 |goto 60.40,37.72 |only if storyactive(72311,2023)
|tip You may not receive this quest on an alt.
|only if storyactive(72313,2023) or storyactive(72312,2023) or storyactive(72310,2023) or storyactive(72296,2023) or storyactive(72311,2023)
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 15 with the Maruuk Centaur |complete factionrenown(2503) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Understanding Their Grace##71075 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 16 with the Maruuk Centaur |complete factionrenown(2503) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Shikaar Mentorship##71030 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 17 with the Maruuk Centaur |complete factionrenown(2503) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Weaponmaster Aloom##195529
|tip Inside the tent.
accept Getting to the Point##71079 |goto Ohn'ahran Plains/0 62.39,42.28
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 18 with the Maruuk Centaur |complete factionrenown(2503) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 19 with the Maruuk Centaur |complete factionrenown(2503) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept An Expected Unexpected Gift##71083 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 20 with the Maruuk Centaur |complete factionrenown(2503) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Proof of Prowess##71031 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 21 with the Maruuk Centaur |complete factionrenown(2503) >= 21
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Farrier Rondare##195547
accept Representation Matters##71085 |goto Ohn'ahran Plains/0 62.54,42.47
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 22 with the Maruuk Centaur |complete factionrenown(2503) >= 22
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Trainer Frodrum##192926
accept Hunting Tactics: Apex Hunter##71032 |goto Ohn'ahran Plains/0 62.49,41.63
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 23 with the Maruuk Centaur |complete factionrenown(2503) >= 23
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept Get on the Horn##71089 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 24 with the Maruuk Centaur |complete factionrenown(2503) >= 24
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept From the Heart, For the Heart##71090 |goto Ohn'ahran Plains/0 60.40,37.72
step
talk Quartermaster Huseng##196707
|tip Inside the building.
accept A Gift of Secrets##72315 |goto 60.40,37.72 |only if storyactive(72315,2023)
accept A Gift of Secrets##72316 |goto 60.40,37.72 |only if storyactive(72316,2023)
accept A Gift of Secrets##72297 |goto 60.40,37.72 |only if storyactive(72297,2023)
accept A Gift of Secrets##72317 |goto 60.40,37.72 |only if storyactive(72317,2023)
accept A Gift of Secrets##72314 |goto 60.40,37.72 |only if storyactive(72314,2023)
|tip You may not receive this quest on an alt.
|only if storyactive(72315,2023) or storyactive(72316,2023) or storyactive(72297,2023) or storyactive(72317,2023) or storyactive(72314,2023)
step
talk Hunt Instructor Basku##195454 |goto Ohn'ahran Plains/0 64.01,41.00
|tip Turn in hunting trophies from grand hunts for rep.
'|turnin More Hunting Trophies##72868 |repeatable |n
'|turnin More Hunting Trophies##70929 |repeatable |n
'|turnin More Hunting Trophies##70928 |repeatable |n
Reach Renown Level 25 with the Maruuk Centaur |complete factionrenown(2503) >= 25
|tip Complete daily quests, weekly quests, and zone quests in Ohn'ahran Plains to gain renown.
|tip You can also complete quests at the Aylaag Outpost each time they set up camp at a new location.
step
talk Khanam Matra Sarest##181198
|tip Upstairs inside the building.
accept The Highest Honor##71091 |goto Ohn'ahran Plains/0 60.00,37.47
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Azure Span Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7095) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7095,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2024,7095)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Azure Span/0 69.64,25.95
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Azure Span/0 69.64,25.95
step
label "Scenario_Stage_2"
clicknpc Injured Hunter##195620+
Revive #13# Injured Hunters |scenariogoal 2/54635 |goto The Azure Span/0 67.72,27.01
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures West or on the Frozen River |scenariogoal 3/0 |goto The Azure Span/0 67.57,26.79
|only if scenariostage(3)
step
label "Scenario_Stage_4"
kill Unruly Goat##197176+
kill Rowdy Goat##195003+
|tip They attack in waves.
Clear out the Rowdy and Unruly Goats |scenariogoal 4/54484 |goto 67.54,27.85
|only if scenariostage(4)
step
label "Scenario_Stage_5"
Enter the cave |goto 67.46,28.04 < 7 |walk
kill Moskhoi##195093 |scenariogoal 5/54511 |goto The Azure Span/0 67.33,28.42
|tip Inside the cave.
|tip It will erupt from the ground and become active when you approach.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Ice Burrower Hatchling##196230+
Free #15# Trapped Ice Burrower Hatchlings |scenariogoal 6/53742 |goto 69.26,26.65
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Creatures to the East of the Frozen River |scenariogoal 7/0 |goto 69.85,26.51
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill Ice Burrower enemies around this area
|tip They attack in waves.
Free #15# Trapped Ice Burrower Hatchlings |scenariogoal 8/54485 |goto 69.80,27.25
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Yaankhi##195101 |scenariogoal 9/54512 |goto 69.15,26.40
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
clicknpc Lost Supplies##196242+
|tip They look like wooden crates on the ground around this area.
talk Shikaar Supplies Master##196248
Return #15# Lost Supplies |scenariogoal 10/53742 |goto 71.69,28.03
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures in the Hills East of the River |scenariogoal 11/0 |goto 71.86,27.66
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill enemies around this area
|tip They attack in waves.
Clear out the Yetis |scenariogoal 12/54500 |goto 71.20,26.51
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Tevgai##195132 |scenariogoal 13/54513 |goto 72.67,26.86
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Azure Span/0 69.64,25.95 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Azure Span Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Azure Span Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7096) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7096,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2024,7096)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Azure Span/0 68.78,53.10
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Azure Span/0 68.78,53.10
step
label "Scenario_Stage_2"
click Ladder
|tip Use the ability on your vehicle bar to throw a bear cub to a larger one nearby.
Save #10# Stuck Shortcoat Cubs |scenariogoal 2/53742 |goto 66.48,54.36
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures West of the River |scenariogoal 3/0 |goto 65.66,53.75
|only if scenariostage(3)
step
label "Scenario_Stage_4"
kill Parched Shortcoat Bear##195247+
kill Parched Shortcoat Mauler##195248+
|tip They attack in waves.
Clear the Parched Shortcoats |scenariogoal 4/54569 |goto 65.82,54.66
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Yamakh##195283 |scenariogoal 5/54573 |goto 66.01,51.67
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
Click weapons on the ground
|tip They look like tiny weaons all over this area.
|tip They appear on your minimap as yellow dots.
Collect #18# Lost Equipment |scenariogoal 6/54617 |goto 68.40,53.23
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill Wildwater enemies around this area
Hunt Beavers and Ottuks Around the River |scenariogoal 7/0 |goto 67.97,55.73
|only if scenariostage(7)
step
label "Scenario_Stage_8"
kill Vicious Crystalspine##195255+
Clear out the Vicious Crystalspine |scenariogoal 8/54571 |goto 67.76,57.62
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Mantai##195286 |scenariogoal 9/54576 |goto 67.73,55.60
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
Enter the cave |goto 66.75,59.57 < 10 |walk
kill Arkhuu##195300 |scenariogoal 10/54577 |goto 66.39,59.59
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(10)
step
label "Scenario_Stage_11"
clicknpc Impaled Shikaar Hunter##196328+
|tip They look like centaur NPCs around this area.
Help #15# Impaled Shikaar Hunters |scenariogoal 11/53742 |goto 69.76,56.36
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill enemies around this area
Hunt Creatures East of the River |scenariogoal 12/0 |goto 70.55,54.34
|only if scenariostage(12)
step
label "Scenario_Stage_13"
Kill Ottuk enemies that attack in waves
Clear out the Frantic and Hectic Wildwater Ottuk |scenariogoal 13/54572 |goto 73.17,53.99
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Azure Span/0 68.78,53.10 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Azure Span Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Azure Span Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7094) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7094,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2024,7094)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Azure Span/0 36.91,36.05
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Azure Span/0 36.91,36.05
step
label "Scenario_Stage_2"
clicknpc Injured Young Horned Armoredon##196134+
|tip They look like small blue Armoredon creatures on the ground around this area.
Heal #15# Injured Young Horned Armoredon |scenariogoal 2/53742 |goto 37.27,36.66
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures Around the Forked Road |scenariogoal 3/0 |goto The Azure Span/0 37.13,36.80
|only if scenariostage(3)
step
label "Scenario_Stage_4"
kill Rampaging Forest Giant##194741+
|tip They attack in waves.
Stop the Rampage |scenariogoal 4/54455 |goto The Azure Span/0 37.28,36.06
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Uurhilt##194760 |scenariogoal 5/54458 |goto The Azure Span/0 37.41,36.14
|tip It runs all over this area.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
click Perfect Throwing Rock
|tip Use the ability on your vehicle bar to throw rocks at nearby nests.
Use Rocks to Clear All the Horned Filcher Nests from the Trees |scenariogoal 6/53742 |goto 37.46,42.06
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Creatures in the Southeast Hunt Area |scenariogoal 7/0 |goto 38.14,42.70
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill Caprine enemies around this area
|tip They attack in waves.
Clear out the Caprine |scenariogoal 8/54456 |goto 38.59,42.85
|only if scenariostage(8)
step
label "Scenario_Stage_9"
clicknpc Khuumog##194761
|tip It will wake up and attack.
kill Khuumog##194761 |scenariogoal 9/54459 |goto 38.64,43.64
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Vorquin Bones##380937+
Collect #18# Vorquin Bones |scenariogoal 10/53742 |goto 33.28,40.39
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures in the Southwest Hunt Area |scenariogoal 11/0 |goto The Azure Span/0 33.21,39.95
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill Agitated and Furious enemies around this area
|tip You can find them on the ground and flying in the air.
|tip Some of these enemies are elite and may require a group.
Agitated and Furious Horned Filchers cleared |scenariogoal 12/54457 |goto The Azure Span/0 33.47,40.23
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Tenmod##194763 |scenariogoal 13/54460 |goto The Azure Span/0 33.64,40.46
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Azure Span/0 36.91,36.05 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Azure Span Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Ohn'ahran Plains Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7090) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7090,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2023,7090)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Ohn'ahran Plains/0 81.39,49.86
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Ohn'ahran Plains/0 81.39,49.86
step
label "Scenario_Stage_2"
clicknpc Dehydrated Ottuk Pup##195786+
|tip They look like baby otters.
|tip They appear on your minimap as yellow dots.
|tip Drop them in the river using the "Drop Dehydrated Ottuk Pup" ability.
Rescue #15# Dehydrated Ottuk Pups |scenariogoal 2/54712 |goto Ohn'ahran Plains/0 77.99,52.15
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Beasts Around the River |scenariogoal 3/0 |goto 77.15,53.39
|only if scenariostage(3)
step
label "Scenario_Stage_4"
kill Disruptive Corpsewing##194545+
|tip They attack in waves
Defeat the Disruptive Corpsewings |scenariogoal 4/54429 |goto Ohn'ahran Plains/0 79.14,51.94
|only if scenariostage(4)
step
label "Scenario_Stage_5"
click Rotting Fish
|tip Zagdech will spawn and begin running around.
kill Zagdech##194601 |scenariogoal 5/54438 |goto Ohn'ahran Plains/0 77.15,54.03
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Injured Ohuna##195591+
|tip They look like white and gray birds standing on the ground around this area.
Revive #17# Injured Ohuna |scenariogoal 6/54616 |goto Ohn'ahran Plains/0 78.78,55.49
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Beasts South of the River |scenariogoal 7/0 |goto Ohn'ahran Plains/0 78.40,56.16
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill Slyvern enemies that attack in waves
Clear out the Restless Slyvern south of the river |scenariogoal 8/54431 |goto Ohn'ahran Plains/0 78.46,56.12
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Kholdeg##194608 |scenariogoal 9/54439 |goto Ohn'ahran Plains/0 80.18,55.12
|tip It will run in when you approach the Mangled Shikaar Hunter.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Mangled Bush
|tip They look like dead branches sticking out of the ground around this area.
|tip They appear on your minimap as yellow dots.
Find and Investigate the Creature Tracks |scenariogoal 10/0 |goto Ohn'ahran Plains/0 74.65,47.17
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Beasts North of the River |scenariogoal 11/0 |goto Ohn'ahran Plains/0 73.16,49.01
|only if scenariostage(11)
step
label "Scenario_Stage_12"
kill Famished Proto-Drake##194570+
|tip They attack in waves.
Defeat the Famished Proto-Drakes |scenariogoal 12/54432 |goto Ohn'ahran Plains/0 74.85,46.69
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Zumakh##194624 |scenariogoal 13/54440 |goto Ohn'ahran Plains/0 72.64,46.94
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip This enemy is elite and may require a group.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Ohn'ahran Plains/0 81.39,49.86 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Ohn'ahran Plains Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Ohn'ahran Plains Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7053) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7053,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2023,7053)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Ohn'ahran Plains/0 81.84,17.16
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Ohn'ahran Plains/0 81.84,17.16
step
label "Scenario_Stage_2"
click Mangled Bush+
|tip They look like dead branches sticking out of the ground around this area.
click Suspicious Bush+
|tip They look like bushy plants around this area.
click Fowl Feather+
|tip They look like small feathers on the ground around this area.
|tip They appear on your minimap as yellow dots.
Examine the Tracks |scenariogoal 2/0 |scenariogoal 2/0 |goto Ohn'ahran Plains/0 80.02,20.43
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures Around the Plains |scenariogoal 3/0 |goto Ohn'ahran Plains/0 80.21,20.37
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Wind Eagle enemies that attack in waves
Clear out the Angry Wind Eagles |scenariogoal 4/0 |goto Ohn'ahran Plains/0 80.98,22.74
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Uranto the Swift##191103 |scenariogoal 5/0 |goto Ohn'ahran Plains/0 78.31,20.60
|tip Uranto runs in circles around this area.
|tip Your group must reduce its health to 90% before it will stop running and fight you.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
click Baby Mammoth
|tip It walks around this area.
|tip Blitztusk will attack shortly after.
kill Blitztusk##190907 |scenariogoal 6/0 |goto Ohn'ahran Plains/0 76.41,20.27
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(6)
step
label "Scenario_Stage_7"
clicknpc Injured Beaver Kit##192688+
|tip They look like injured beavers laying on the ground around this area.
|tip They appear on your minimap as yellow dots.
talk Shikaar Healer##192722
Tell it _"Here is an inured kit, please help them!"_
Heal #16# Injured Beaver Kits |scenariogoal 7/53742 |goto Ohn'ahran Plains/0 82.87,18.61
You can find a Shikaar Healer here:
[81.61,20.36]
[83.23,21.13]
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill beaver enemies around the river
Hunt Beavers Around the River |scenariogoal 8/0 |goto Ohn'ahran Plains/0 82.45,19.33
|only if scenariostage(8)
step
label "Scenario_Stage_9"
click Beaver Dam
kill Norbett##190968 |scenariogoal 9/0 |goto Ohn'ahran Plains/0 83.10,18.81
|tip Norbett will immediately spawn
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Bone Pile+
|tip They look like large piles of bones on the ground around this area.
Collect #15# Bones from Rockfang Ravine |scenariogoal 10/53742 |goto Ohn'ahran Plains/0 85.23,15.61
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures Around the Ravine |scenariogoal 11/0 |goto Ohn'ahran Plains/0 84.75,16.31
|only if scenariostage(11)
step
label "Scenario_Stage_12"
clicknpc Lost Lamb##191120
kill Boolk##191450 |scenariogoal 12/0 |goto Ohn'ahran Plains/0 87.03,18.03
|tip Boolk will fly down and kill the Lost Lamb.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Sarana##190161 |scenariogoal 13/0 |goto Ohn'ahran Plains/0 84.98,15.56
|tip Move around the area looking for yellow dots on your minimap.
|tip Keep checking for signs of Saran until it appears and attacks.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Ohn'ahran Plains/0 81.84,17.16 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Ohn'ahran Plains Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Ohn'ahran Plains Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7089) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7089,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2023,7089)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Ohn'ahran Plains/0 61.70,53.00
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Ohn'ahran Plains/0 61.70,53.00
step
label "Scenario_Stage_2"
clicknpc Discarded Turtle Shell##195586+
|tip They look like empty turtle shells along the river bank.
Collect Discarded Turtle Shells |scenariogoal 2/54613 |goto Ohn'ahran Plains/0 57.87,46.15
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
|tip Kill mobs along the sides and in the river.
Hunt Beasts Around the River to the North |scenariogoal 3/0 |goto Ohn'ahran Plains/0 57.59,46.66
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Parched enemies around this area
Defeat the Parched Broadhooves |scenariogoal 4/54231 |goto Ohn'ahran Plains/0 57.38,47.83
|only if scenariostage(4)
step
label "Scenario_Stage_5"
clicknpc Sunscale Snapper##194410
|tip Ergburk will spawn and attack.
kill Ergburk##194409 |scenariogoal 5/54349 |goto Ohn'ahran Plains/0 57.53,47.66
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Deranged Hunter Trap##195724+
|tip They look like small traps with Thunderspine Calves trapped inside.
Free #14# Trapped Thunderspine Calves |scenariogoal 6/54668 |goto Ohn'ahran Plains/0 53.12,50.65
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Beasts in the Western Plains |scenariogoal 7/0 |goto Ohn'ahran Plains/0 53.25,50.12
|only if scenariostage(7)
step
label "Scenario_Stage_8"
kill Enraged Riverbeast##197073+
Defeat the Encroaching Riverbeasts |scenariogoal 8/54233 |goto Ohn'ahran Plains/0 53.02,46.40
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Khomuur##194438 |scenariogoal 9/54410 |goto 50.97,48.96
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
Enter the cave |goto Ohn'ahran Plains/0 57.67,50.93 < 10 |walk
clicknpc Rock##195733+
|tip Click rocks to free Bakar inside the cave.
Rescue #9# Trapped Bakar |scenariogoal 10/53742 |goto Ohn'ahran Plains/0 56.31,51.50
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Enter the cave |goto Ohn'ahran Plains/0 57.67,50.93 < 10 |walk
kill Sedentary Sediment##194284+
|tip Inside the cave.
Hunt Elementals in the Western Cave |scenariogoal 11/0 |goto Ohn'ahran Plains/0 56.31,51.50
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Enter the cave |goto Ohn'ahran Plains/0 57.67,50.93 < 10 |walk |only if not _G.IsIndoors()
Kill Concretions enemies that attack in waves
|tip Inside the cave.
Defeat the Converging Concretions |scenariogoal 12/54234 |goto Ohn'ahran Plains/0 56.46,51.57
|only if scenariostage(12)
step
label "Scenario_Stage_13"
Enter the cave |goto Ohn'ahran Plains/0 57.67,50.93 < 10 |walk |only if not _G.IsIndoors()
kill Rokzul##194458 |scenariogoal 13/54411 |goto Ohn'ahran Plains/0 56.46,51.57
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Ohn'ahran Plains/0 61.70,53.00 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Ohn'ahran Plains Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Thaldraszus Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7099) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7099,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2025,7099)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Thaldraszus/0 50.74,46.69
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Thaldraszus/0 50.74,46.69
step
label "Scenario_Stage_2"
clicknpc Mountain Scarab##196347+
|tip They look like bright green beetles covering Bakar NPCs around this area.
|tip Click each one to remove them and free the NPC.
Free #12# Swarmed Shikaar Bakar |scenariogoal 2/53742 |goto Thaldraszus/0 50.90,47.00
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures in the Southern Portion of the Wildlife Passage |scenariogoal 3/0 |goto Thaldraszus/0 50.49,47.97
|only if scenariostage(3)
step
label "Scenario_Stage_4"
kill Destructive Proto-Drake##195398+
|tip They attack in groups.
Clear out the Destructive Proto-Drakes |scenariogoal 4/54598 |goto Thaldraszus/0 50.21,47.93
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Tsokorg##195417 |scenariogoal 5/54601 |goto Thaldraszus/0 50.12,47.93
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Disorientated Wooly Lamb##196436+
Expel #12# Disorientated Wooly Lambs |scenariogoal 6/53742 |goto Thaldraszus/0 51.97,47.12
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Creatures in the Upper Portion of the Wildlife Passage |scenariogoal 7/0 |goto Thaldraszus/0 51.52,47.44
|only if scenariostage(7)
step
label "Scenario_Stage_8"
kill Swarming Mountain Scarab##195400+
|tip They attack in waves.
Clear Out the Swarming Mountain Scarabs |scenariogoal 8/54599 |goto Thaldraszus/0 51.93,47.43
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Molkeej##195430 |scenariogoal 9/54602 |goto Thaldraszus/0 51.11,49.09
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Winghunter Nest+
|tip They look like large nests around this area.
|tip They appear on your minimap as yellow dots.
Destroy #13# Winghunter Nests |scenariogoal 10/53742 |goto Thaldraszus/0 51.32,45.96
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures in the Northern Portion of the Wildlife Passage |scenariogoal 11/0 |goto 51.25,45.61
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill Wooly Ewe enemies around this area
Clear Out the Rampaging Wooly Ewe |scenariogoal 12/54600 |goto Thaldraszus/0 52.20,43.60
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Diluu##195431 |scenariogoal 13/54603 |goto Thaldraszus/0 51.30,46.34
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Thaldraszus/0 50.74,46.69 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Thaldraszus Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Thaldraszus Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7097) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7097,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2025,7097)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Thaldraszus/0 34.58,66.62
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Thaldraszus/0 34.58,66.62
step
label "Scenario_Stage_2"
clicknpc Swarmed Shikaar Bakar##193480+
|tip They look like frogs surround animals around this area.
|tip You may need to click more than one to free the Bakar.
|tip They appear on your minimap as yellow dots.
Save #12# Swarmed Bakar |scenariogoal 2/56026 |goto Thaldraszus/0 34.35,67.73
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures Around the Lower Cascades |scenariogoal 3/0 |goto Thaldraszus/0 34.33,67.82
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Dismay enemies that attack in waves
|tip Waves of dragonflies will attack.
Clear the Swarming Dismay Flies |q 70541/1 |goto Thaldraszus/0 34.10,68.70
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Melkhop##193311 |scenariogoal 5/53860 |goto Thaldraszus/0 33.34,67.49
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Overturned Hatchling##193470+
|tip They look like tiny overturned turtles on the ground around this area.
|tip They appear on your minimap as yellow dots.
Save #16# Overturned Hatchlings |scenariogoal 6/53742 |goto Thaldraszus/0 36.85,67.98
You can find more around [35.44,69.79]
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt creatures around the Southeast Cascades |scenariogoal 7/0 |goto Thaldraszus/0 37.02,67.01
|only if scenariostage(7)
step
label "Scenario_Stage_8"
kill Towering Fickleshells##193391 |scenariogoal 8/53865 |goto Thaldraszus/0 36.82,67.94
|tip Stay away from it while it is spinning.
|tip Keep killing them until the stage completes.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Galzuda##193330 |scenariogoal 9/53861 |goto Thaldraszus/0 36.02,68.71
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Winghunter Nest+
|tip They look like large nests around this area.
|tip They appear on your minimap as yellow dots.
Clear #12# Winghunter Nests |scenariogoal 10/53742 |goto Thaldraszus/0 33.41,71.04
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures Around the Southwest Cascades |scenariogoal 11/0 |goto Thaldraszus/0 33.14,71.88
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill Scythid enemies that attack in waves
Defeat the Scythid Raid |scenariogoal 12/53864 |goto Thaldraszus/0 35.15,70.45
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Angen##193341 |scenariogoal 13/53862 |goto Thaldraszus/0 32.87,72.96
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Thaldraszus/0 34.58,66.62 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Thaldraszus Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Waking Shores Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7093) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7093,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2022,7093)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Waking Shores/0 42.81,80.63
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Waking Shores/0 42.81,80.63
step
label "Scenario_Stage_2"
kill Hungry Proto-Whelp##196014+
Save #8# Calves |scenariogoal 2/53742 |goto The Waking Shores/0 45.92,77.60
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Beasts and Dragonkin in the Eastern Wild Preserve |scenariogoal 3/0 |goto The Waking Shores/0 43.46,80.80
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Thunder Lizard enemies that attack in waves
Stop the Invasion |scenariogoal 4/54112 |goto The Waking Shores/0 45.33,75.89
|only if scenariostage(4)
step
label "Scenario_Stage_5"
clicknpc Tired Riverbeast Calf##194223
|tip Muugurv will come down and eat the calf.
kill Muugurv##194225 |scenariogoal 5/54183 |goto The Waking Shores/0 47.75,77.07
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Injured Hunter##195620+
|tip They look like exhausted NPCs slumped over around this area.
|tip They appear on your minimap as yellow dots.
Revive #17# Injured Hunters |scenariogoal 6/54635 |goto The Waking Shores/0 39.39,77.52
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Beasts and Dragonkin in the Western Wild Preserve |scenariogoal 7/0 |goto The Waking Shores/0 40.62,77.32
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill Fire Elemental enemies that attack in waves
Stop the Intrusion |scenariogoal 8/54114 |goto The Waking Shores/0 40.30,73.32
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Gamgus##194240 |scenariogoal 9/54212 |goto The Waking Shores/0 37.44,77.02
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Mangled Riverbeast Corpse+
|tip They will explode when you run away from them.
click Fresh Meat+
|tip They appear on the ground after blowing up riverbeast corpses.
Collect #30# Fresh Meat |scenariogoal 10/53742 |goto The Waking Shores/0 41.11,84.02
|only if scenariostage(10)
step
label "Scenario_Stage_11"
kill Wild Proto-Drake##194146+
Hunt dragonkin in the southern Wild Preserve |scenariogoal 11/0 |goto The Waking Shores/0 37.73,86.37
|only if scenariostage(11)
step
label "Scenario_Stage_12"
kill Infused Proto-Drake##194200+
|tip They will attack in waves.
Stop the Infused Proto-Drakes Assaults |scenariogoal 12/54115 |goto The Waking Shores/0 41.10,84.50
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Degmakh##194251 |scenariogoal 13/54223 |goto The Waking Shores/0 40.99,84.51
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Waking Shores/0 42.81,80.63 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Waking Shores Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Waking Shores Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7092) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7092,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2022,7092)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Waking Shores/0 69.77,68.36
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Waking Shores/0 69.77,68.36
step
label "Scenario_Stage_2"
clicknpc Injured Shikaar Bakar##195599+
|tip They look like dogs all over this area.
|tip They appear on your minimap as yellow dots.
Revive #14# Injured Huntdogs |scenariogoal 2/54618 |goto The Waking Shores/0 69.12,66.44
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Elementals in the Eastern Portion of Hornswog Hollow |scenariogoal 3/0 |goto The Waking Shores/0 68.68,63.80
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Spiteful enemies around this area
|tip Lines of Spiteful snails will travel around this area.
Clear Out the Spiteful Snails |scenariogoal 4/54063 |goto The Waking Shores/0 70.18,68.04
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Galnmor##193853 |scenariogoal 5/54060 |goto The Waking Shores/0 69.51,64.72
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
clicknpc Exhausted Hornswog##195936+
|tip They appear on your minimap as yellow dots.
|tip Find groups of Swarmed Hornswog and use the Roll ability to bowl it into them.
Free #12# Swarmed Hunters |scenariogoal 6/53742 |goto The Waking Shores/0 67.03,64.41
|only if scenariostage(6)
step
label "Scenario_Stage_7"
Kill enemies around this area
Hunt Elementals and Hornswog in the Western Portion of Hornswog Hollow |scenariogoal 7/0 |goto The Waking Shores/0 65.98,63.38
|only if scenariostage(7)
step
label "Scenario_Stage_8"
kill Ruffian Hornswog##193819+
Clear out the Ruffian Hornswog |scenariogoal 8/54064 |goto The Waking Shores/0 67.27,63.80
|only if scenariostage(8)
step
label "Scenario_Stage_9"
kill Salkii##193885 |scenariogoal 9/54061 |goto The Waking Shores/0 65.37,62.25
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Depleted Elemental Core
|tip They look like small purple crystals on the ground around this area.
|tip Use the ability on your vehicle bar to shoot at water prisons along the river.
Free #11# Companions |scenariogoal 10/53742 |goto The Waking Shores/0 69.13,58.89
|only if scenariostage(10)
step
label "Scenario_Stage_11"
kill Diverted Stream##187948+
Hunt Elementals in the Northern River Area |scenariogoal 11/0 |goto The Waking Shores/0 69.23,57.82
|only if scenariostage(11)
step
label "Scenario_Stage_12"
Kill Expelled enemies that attack in waves
Clear out the Expelled Earth Elementals |scenariogoal 12/54065 |goto The Waking Shores/0 68.87,59.85
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Borzgas##193896 |scenariogoal 13/54062 |goto The Waking Shores/0 69.44,56.72
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Waking Shores/0 69.77,68.36 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Waking Shores Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Waking Shores Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7091) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7091,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2022,7091)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Waking Shores/0 25.25,88.48
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Waking Shores/0 25.25,88.48
step
label "Scenario_Stage_2"
clicknpc Clumsy Hunter##195904+
|tip They look like cauntaur turned over on their backs near bushes around this area.
|tip Click them and then run away from them to pull them upright.
|tip They appear on your minimap as yellow dots.
Help #14# Clumsy Centaur |scenariogoal 2/54747 |goto The Waking Shores/0 24.64,93.50
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt creatures around Apex Canopy |scenariogoal 3/0 |goto The Waking Shores/0 24.04,92.86
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill enemies that attack in waves
|tip They will try to attack the foal inside the cave.
Defend the Injured Foal |scenariogoal 4/54017 |goto The Waking Shores/0 25.78,96.09
|only if scenariostage(4)
step
label "Scenario_Stage_5"
Enter the cave |goto The Waking Shores/0 24.56,95.18 < 10 |walk
kill Honmor##193704 |scenariogoal 5/54014 |goto The Waking Shores/0 23.86,96.06
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
Enter the cave |goto The Waking Shores/0 23.17,90.69 < 7 |walk
kill Tomnu##193722 |scenariogoal 6/54015 |goto The Waking Shores/0 23.42,88.97
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(6)
step
label "Scenario_Stage_7"
clicknpc Drowning Foal##195913+
|tip You can find them in the water.
|tip Pick them up and carry them to dry land to save them.
Save #10# Drowning Foals |scenariogoal 7/54748 |goto The Waking Shores/0 28.30,87.41
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Hunt creatures around the northeast falls |scenariogoal 8/0
|only if scenariostage(8)
step
label "Scenario_Stage_9"
Kill Swoglet and Hornswog enemies that attack in waves
Clear out the Intrusive Swoglets and Hornswog |scenariogoal 9/54018 |goto The Waking Shores/0 28.36,85.85
|only if scenariostage(9)
step
label "Scenario_Stage_10"
Click objects around this area
|tip Click various weapons you find on the ground.
|tip They appear on your minimap as yellow dots.
Collect #18# Lost Shikaar Equipment |scenariogoal 10/54617 |goto The Waking Shores/0 26.81,89.74
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill elemental enemies around this area
Hunt Elementals Around Genesis Falls |scenariogoal 11/0 |goto The Waking Shores/0 26.73,89.25
|only if scenariostage(11)
step
label "Scenario_Stage_12"
click Roasted Boar
Kill Proto-Drake enemies that attack in waves
Defeat the Starving Proto-Drakes |scenariogoal 12/54019 |goto The Waking Shores/0 25.75,85.03
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Uurtus##193724 |scenariogoal 13/54016 |goto The Waking Shores/0 26.66,88.91
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Waking Shores/0 25.25,88.48 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Waking Shores Hunt"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Valdrakken Accord\\Valdrakken Accord",{
author="support@zygorguides.com",
description="\nThis guide will walk you through gaining renown and completing activities for the \n"..
"Valdrakken Accord faction of the Dragon Isles.",
condition_suggested=function() return level == 60 and completedq(66114) and not completedq(70916) end,
condition_end=function() return completedq(70916) end,
areapoiid=7391,
areapoitype="faction (Valdrakken Accord)",
startlevel=60,
patch='100002',
},[[
step
Complete the "For the Benefit of the Queen" Quest |q 66114 |future |or
|tip This quest is required to unlock Valdrakken Accord renown.
|tip Progress through The Waking Shores leveling guide to unlock it.
Click Here to Load the Full Zone Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
_Or_
Click Here to Load the Story Only Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 2 with the Valdrakken Accord |complete factionrenown(2510) >= 2
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Sorotis##195768
|tip Inside the building.
accept The Search for Titan Relics##70839 |goto Valdrakken/0 26.08,40.03
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 3 with the Valdrakken Accord |complete factionrenown(2510) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Erugosa##185556
|tip Inside the building.
accept To Cook With Finery##70880 |goto 46.51,46.24
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 4 with the Valdrakken Accord |complete factionrenown(2510) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept Renown Supplies##70882 |goto 58.18,35.15
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 5 with the Valdrakken Accord |complete factionrenown(2510) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
|tip Renown level 5 unlocks the assault on Dragonbane Keep event in The Waking Shores.
step
_Next to you:_
talk Herald Flaps##197478
accept To Dragonbane Keep!##71210
step
Wait for the Assault on Dragonbane Keep to Begin |complete areapoitime(7267) == 0 or completedq(71210) |goto The Waking Shores/0 30.42,78.08 |or
|tip The assault group will take one hour to assemble.
|tip You will need a small group to complete this.
Click Here to Load the "Siege on Dragonbane Keep" Guide |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Siege on Dragonbane Keep" |or
step
Complete the Siege on Dragonbane Keep |q 71210/1 |or
|tip The assault group will take one hour to assemble.
|tip You will need a small group to complete this.
Click Here to Load the "Siege on Dragonbane Keep" Guide |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Siege on Dragonbane Keep" |or
step
talk Boss##194404
turnin To Dragonbane Keep!##71210 |goto 30.53,77.86
You can find him outside Dragonbane Keep at [24.77,70.47]
You can also find him inside Dragonbane Keep at [24.20,70.52]
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 6 with the Valdrakken Accord |complete factionrenown(2510) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept A Hand in Cultivation##70883 |goto 58.18,35.15
|tip If you have completed this quest on an alt, you may need to skip this step.
step
talk Gryrmpech##187300
turnin A Hand in Cultivation##70883 |goto Thaldraszus/0 37.86,75.46
|only if haveq(70883) or completedq(70883)
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 7 with the Valdrakken Accord |complete factionrenown(2510) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Herald Flaps##197478
accept Aerial Challenges##71227
step
talk Bronze Timekeeper##190551
|tip Open your map and look for the quest marker for this quest.
|tip There are Bronze Timekeepers all over each zone.
|tip You may need to fly around to find one that will allow you to turn in the quest.
turnin Aerial Challenges##71227
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 8 with the Valdrakken Accord |complete factionrenown(2510) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept Renown Supplies##70885 |goto 58.18,35.15
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 9 with the Valdrakken Accord |complete factionrenown(2510) >= 9
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Kaestrasz##185561
accept Feeling Freedom##70887 |goto 46.67,78.95
Click Here if the Quest Isn't Available |confirm
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 10 with the Valdrakken Accord |complete factionrenown(2510) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Armorsmith Terisk##195770
|tip Inside the building.
accept Rubbing Shoulders With The Best##70888 |goto 35.95,49.70
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 11 with the Valdrakken Accord |complete factionrenown(2510) >= 11
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 12 with the Valdrakken Accord |complete factionrenown(2510) >= 12
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Herald Flaps##197478
accept Ally of Dragons##68794
step
talk Alexstrasza the Life-Binder##187678
|tip At the top of the tower.
turnin Ally of Dragons##68794 |goto 58.16,34.92
accept The Gift of Silver##67074 |goto 58.16,34.92
step
talk Alexstrasza the Life-Binder##187678
Ask her _"What is this gift from Tyr?"_
Speak to Alexstrasza |q 67074/1 |goto 58.16,34.92
step
Watch the dialogue
Reveal the Gift |q 67074/2 |goto 59.22,37.97
step
click Silver Scale
collect Silver Scale##197845 |q 67074/3 |goto 59.22,37.93
step
talk Alexstrasza the Life-Binder##187678
|tip At the top of the tower.
turnin The Gift of Silver##67074 |goto 58.16,34.92
accept The Legacy of Tyrhold##70703 |goto 58.16,34.92
step
Meet Koranos at Tyrhold |q 70703/1 |goto Thaldraszus/0 58.18,58.74
step
click Silver Scale
|tip On top of the console.
Place the Silver Scale |q 70703/2 |goto 58.18,58.74
step
click Tyrhold Console
Activate the Tyrhold Device |q 70703/3 |goto 58.17,58.74
step
talk Watcher Koranos##192480
turnin The Legacy of Tyrhold##70703 |goto 58.15,58.84
accept The Magic Within##67075 |goto 58.15,58.84
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 58.34,57.83 |count 1
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 57.88,55.61 |count 2
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 59.80,56.37 |count 3
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 58.34,59.65 |count 4
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 59.89,61.13 |count 5
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Tyrhold Console
Find the Hidden Magic |q 67075/1 |goto 57.90,61.96 |count 6
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
click Silver Scale
|tip On top of the console.
Place the Silver Scale |q 67075/2 |goto 58.18,58.74
step
Watch the dialogue
talk Watcher Koranos##192480
turnin The Magic Within##67075 |goto 58.15,58.84
accept A Spark of Discovery##67076 |goto 58.15,58.84
step
talk Titan Spark##192707
Choose _<Investigate the spark.>_
Investigate the Spark |q 67076/1 |goto 58.14,58.55
step
map Thaldraszus/0
path follow smart; loop off; ants curved; dist 15
path	57.71,59.43	58.30,60.39	59.50,61.41	60.07,61.20	61.64,60.50
path	62.20,59.20
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
Follow the Spark |q 67076/2 |goto 62.20,59.21
step
talk Kalecgos##193492
turnin A Spark of Discovery##67076 |goto 62.20,59.39
step
talk Alexstrasza the Life-Binder##192573
accept Memories of the Past##67077 |goto 62.12,59.28
step
talk Nozdormu##192492
Tell him _"Timeless One, I need to borrow your sight."_
Watch the dialogue
Share in Timeless Sight |q 67077/1 |goto 62.13,59.41
step
Watch the dialogue
Witness the Memory |q 67077/2 |goto 62.13,59.41
step
talk Nozdormu##192492
Choose _<Ask about the memory.>
Speak to Nozdormu |q 67077/4 |goto 62.14,59.41
step
talk Kalecgos##193492
Choose _<Ask about the memory.>
Speak to Kalecgos |q 67077/3 |goto 62.20,59.38
step
talk Alexstrasza the Life-Binder##192573
Choose _<Ask about the memory.>
Speak to Alexstrasza |q 67077/5 |goto 62.12,59.28
step
talk Alexstrasza the Life-Binder##192573
turnin Memories of the Past##67077 |goto 62.12,59.28
step
Watch the dialogue
talk Keeper Tyr##192496
accept Parting Instructions##67078 |goto 62.20,59.20
step
Enter the building |goto 59.81,58.74 < 30 |walk
click Silver Scale
|tip Inside the building.
Place the Silver Scale |q 67078/1 |goto 60.55,58.74
step
click Forge Console
|tip Inside the building.
Activate the Forge |q 67078/2 |goto 60.55,58.74
step
talk Watcher Koranos##192480
|tip Inside the building.
turnin Parting Instructions##67078 |goto 60.36,58.87
accept Hard Lock Life##67079 |goto 60.36,58.87
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
kill Maiden of Patience##192720
collect Secondary Security Disc##197863 |q 67079/2 |goto 57.66,63.69
step
extraaction Titanic Overload##382822
|tip Use it on elite enemies to stun them if needed.
kill Maiden of Diligence##192718
collect Primary Security Disc##197862 |q 67079/1 |goto 57.59,53.62
step
talk Watcher Koranos##192480
|tip Inside the building.
turnin Hard Lock Life##67079 |goto 60.37,58.87
step
Watch the dialogue
talk Keeper Tyr##192496
|tip Inside the building.
accept An Infusion of Materials##67081 |goto 60.53,58.64
stickystart "Collect_Ancient_Titansteel_Ingots"
step
kill Primal Tsunami##189729 |q 67081/2 |goto Halls of Infusion/1 42.76,47.50 |or
|tip It's the final boss of the Halls of Infusion dungeon.
|tip Use the "Halls of Infusion" dungeon guide to accomplish this.
Click Here to Load the "Halls of Infusion" Dungeon Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Halls of Infusion" |or
step
label "Collect_Ancient_Titansteel_Ingots"
collect 10 Ancient Titansteel Ingot##198038 |q 67081/1
|tip Loot them from bosses throughout the Halls of Infusion dungeon.
step
talk Keeper Tyr##192496
|tip Inside the building.
turnin An Infusion of Materials##67081 |goto Thaldraszus/0 60.53,58.64
accept The Silver Purpose##67084 |goto 60.53,58.64
step
click Ancient Titansteel Ingots
|tip Inside the building.
Place the Ingots |q 67084/1 |goto 60.81,58.74
step
click Forge Console
|tip Inside the building.
Activate the Secondary Console |q 67084/2 |goto 60.64,59.17 |count 1
step
click Forge Console
|tip Inside the building.
Activate the Secondary Console |q 67084/2 |goto 60.63,58.34 |count 2
step
click Silver Scale
|tip Inside the building.
Activate the Silver Scale |q 67084/3 |goto 60.55,58.74
step
talk Alexstrasza the Life-Binder##192573
|tip Inside the building.
turnin The Silver Purpose##67084 |goto 60.19,58.64
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 13 with the Valdrakken Accord |complete factionrenown(2510) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Sorotis##195768
|tip Inside the building.
accept Wielding Titanic Might##70903 |goto Valdrakken/0 26.08,40.03
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 14 with the Valdrakken Accord |complete factionrenown(2510) >= 14
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 15 with the Valdrakken Accord |complete factionrenown(2510) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Kaestrasz##185561
accept Soaring in Style##70895 |goto 46.67,78.95
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 16 with the Valdrakken Accord |complete factionrenown(2510) >= 16
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Provisioner Thom##193659
|tip Inside the building.
accept Waist Not, Want Not##70896 |goto 36.57,50.64
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 17 with the Valdrakken Accord |complete factionrenown(2510) >= 17
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Armorsmith Terisk##195770
|tip Inside the building.
accept A Coming of Age##70897 |goto 35.95,49.70
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 18 with the Valdrakken Accord |complete factionrenown(2510) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Groundskeeper Kama##189197
accept A Collection of Creatures##70901 |goto 74.51,63.04
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 19 with the Valdrakken Accord |complete factionrenown(2510) >= 19
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Herald Flaps##197478
accept Emerald Summons##66620
step
talk Merithra##186955
|tip Up on the platform next to the waterfall.
turnin Emerald Summons##66620 |goto Ohn'ahran Plains/0 29.79,60.04
accept A Day in the Groves##66178 |goto 29.79,60.04
step
talk Merithra##187525
turnin A Day in the Groves##66178 |goto 33.22,51.76
accept Seeds for the Future##66179 |goto 33.22,51.76
accept Wake the Ancients##66180 |goto 33.22,51.76
stickystart "Deliver_Garden_Seeds_to_Sisters"
step
use the Borrowed Breath##192555
|tip Use it next to the treant.
Awaken Quercus |q 66180/1 |goto 30.07,52.93
step
use the Borrowed Breath##192555
|tip Use it next to the treant.
Awaken Dalicus |q 66180/2 |goto 28.59,51.81
step
use the Borrowed Breath##192555
|tip Use it next to the treant.
Awaken Asercus |q 66180/3 |goto 30.10,50.34
step
label "Deliver_Garden_Seeds_to_Sisters"
Kill Lasher enemies around this area
collect 12 Garden Seed##192547 |q 66179 |goto 29.46,52.39
step
talk Sister of the Garden##190209+
Choose _<Give Sister of the Garden the seeds you've collected.>_
|tip You can find them all over the garden.
|tip You can turn all 12 seeds in at once.
Deliver #12# Garden Seeds to Sisters |q 66179/1 |goto 29.46,52.39
step
talk Merithra##187525
turnin Seeds for the Future##66179 |goto 33.22,51.76
turnin Wake the Ancients##66180 |goto 33.22,51.76
accept Gerithus's Research##66182 |goto 33.22,51.76
step
talk Gerithus##189849
turnin Gerithus's Research##66182 |goto 28.41,48.61
accept Emerald Tears##66183 |goto 28.41,48.61
step
talk Rymek##189850
accept A Frenzied Defender##66181 |goto 28.50,48.70
stickystart "Collect_Emerald_Tears"
step
kill Frenzied Grovetalon##187507 |q 66181/1 |goto 28.50,48.71
|tip It flies in a circle around this area.
step
label "Collect_Emerald_Tears"
click Emerald Tear##376929+
|tip They look like small crystals laying on the ground around this area.
collect 8 Emerald Tear##192558 |q 66183/1 |goto 27.60,46.70
step
talk Rymek##189850
turnin A Frenzied Defender##66181 |goto 28.50,48.70
step
talk Gerithus##189849
turnin Emerald Tears##66183 |goto 28.41,48.61
accept Anchors to Life##66184 |goto 28.41,48.61
step
click Inert Anchor
Empower the First Anchor |q 66184/1 |goto 28.26,48.52
step
click Inert Anchor
Empower the Second Anchor |q 66184/2 |goto 28.28,48.68
step
click Inert Anchor
Empower the Third Anchor |q 66184/3 |goto 28.53,48.53
step
Watch the dialogue
Wait for Merithra to Arrive |q 66184/4 |goto 28.42,48.71
step
talk Gerithus##189849
turnin Anchors to Life##66184 |goto 28.41,48.61
step
talk Merithra##187509
accept To Somnikus##66393 |goto 28.37,48.69
step
talk Somnikus##186469
turnin To Somnikus##66393 |goto 22.00,50.99
accept The Chittering Rocks##66395 |goto 22.00,50.99
step
talk Rymek##189857
accept Guarded Appreciation##66396 |goto 22.10,50.87
stickystart "Kill_Glacial_Tunnelers"
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 22.25,52.14 |count 1
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 21.75,51.82 |count 2
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 21.99,50.38 |count 3
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 22.56,50.53 |count 4
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 21.49,49.08 |count 5
step
talk Emerald Warden##194684
Choose _<Give Rymek's Gift.>_
Give Rymek's Gift to the Emerald Guard |q 66396/1 |goto 21.53,48.45 |count 6
step
label "Kill_Glacial_Tunnelers"
clicknpc Suspicious Permafrost##189870+
|tip They look like piles of jagged rocks on the ground around this area.
kill 8 Glacial Tunneler##188360 |q 66395/1 |goto 22.23,49.65
step
talk Somnikus##186469
turnin The Chittering Rocks##66395 |goto 22.00,50.99
step
talk Rymek##189857
turnin Guarded Appreciation##66396 |goto 22.10,50.87
accept So Close##66190 |goto 22.10,50.87
step
talk Rymek##191388
Ask him _"What do you think?"_
Speak to Rymek in Ancient Bough |q 66190/1 |goto 19.93,49.35
step
kill Ezralor##188755 |q 66190/2 |goto 21.39,48.75
step
Watch the dialogue
talk Merithra##187561
turnin So Close##66190 |goto 22.06,49.20
accept And Yet So Far##66191 |goto 22.06,49.20
step
talk Merithra##187561
Ask her _"What is hidden in the Dream?"_
Speak to Merithra |q 66191/1 |goto 22.06,49.20
step
talk Merithra##187561
turnin And Yet So Far##66191 |goto 22.06,49.20
accept Rallying Nature's Allies##66392 |goto 22.06,49.20
|tip If you cannot accept this quest, ensure you have completed the Oh'ahran Plains campaign entirely.
step
talk Aronus##188335
Tell him _"Take me up to Shady Sanctuary."_
Speak to Aronus For a Lift to Shady Sanctuary |q 66392/1 |goto 22.04,50.26
step
talk Koda Steelclaw##188340
Choose _<Rally to join the fight at Ancient Bough.>_
Speak to Koda Steelclaw |q 66392/3 |goto 29.32,55.88
step
click Infused Anchor
Collect the Infused Anchor |q 66392/2 |goto 30.48,56.76 |count 1
step
click Infused Anchor
Collect the Infused Anchor |q 66392/2 |goto 30.54,56.74 |count 2
step
click Infused Anchor
Collect the Infused Anchor |q 66392/2 |goto 30.59,56.78 |count 3
step
talk Scout Tomul##194328
Choose _<Rally to join the fight at Ancient Bough.>_
Speak to Scout Tomul |q 66392/4 |goto 29.96,58.20
step
Enter the building |goto 28.80,59.49 < 10 |walk
talk Archdruid Hamuul Runetotem##188339
|tip Inside the building.
Choose _<Rally to join the fight at Ancient Bough.>_
Speak to Hamuul Runetotem |q 66392/5 |goto 28.32,60.11
step
talk Somnikus##187594
turnin Rallying Nature's Allies##66392 |goto 28.38,57.96
accept Across the Weald##66185 |goto 28.38,57.96
step
click Portal to Ardenweald
Cross into Ardenweald |q 66185/1 |goto 28.35,57.80
step
talk Ysera##187634
turnin Across the Weald##66185 |goto Ardenweald/0 45.88,60.90
accept The Price##66186 |goto 45.88,60.90
step
talk Malfurion Stormrage##187636
Speak to Malfurion Stormrage |q 66186/1 |goto 45.82,60.86
step
talk Malfurion Stormrage##187636
turnin The Price##66186 |goto 45.82,60.86
accept Storm's Rest##66188 |goto 45.82,60.86
step
Reach the Middle of the Grove of Awakening |q 66188/1 |goto 45.30,63.52
step
clicknpc Globe of Rebirth##194365
Activate the Globe of Rebirth |q 66188/2 |goto 45.07,63.17 |count 1
step
clicknpc Globe of Rebirth##194365
Activate the Globe of Rebirth |q 66188/2 |goto 44.99,63.94 |count 2
step
clicknpc Globe of Rebirth##194365
Activate the Globe of Rebirth |q 66188/2 |goto 45.58,63.62 |count 3
step
talk Winter Queen##187632
Choose _<Skip to the end.>_
Convince the Winter Queen |q 66188/3 |goto 45.29,64.01
step
Watch the dialogue
talk Ysera##188348
turnin Storm's Rest##66188 |goto 45.29,63.62
accept Step Into the Life##66189 |goto 45.29,63.62
step
extraaction Cross Over##373025
Cross into the Emerald Dreamway |q 66189/1 |goto 45.28,65.62
stickystart "Clear_the_Emerald_Dreamway"
step
clicknpc Infused Anchor##187642
Place the First Infused Anchor |q 66189/3 |goto The Emerald Dreamway DF/0 65.83,50.40
step
Enter the cave |goto 56.38,77.86 < 10 |walk
clicknpc Infused Anchor##187644
|tip Inside the cave.
Place the Third Infused Anchor |q 66189/5 |goto 58.69,81.95
step
clicknpc Infused Anchor##187643
Place the Second Infused Anchor |q 66189/4 |goto 46.31,39.50
step
label "Clear_the_Emerald_Dreamway"
clicknpc Frost Shard##194945+
|tip They look like large frozen ice spikes coming out of the ground around this area.
Kill enemies around this area
Clear the Emerald Dreamway |q 66189/2 |goto 49.36,45.02
step
clicknpc Dream Portal##190027
Cross Over Into Ancient Bough |q 66189/6 |goto 31.44,22.53
step
talk Ysera##187646
turnin Step Into the Life##66189 |goto Ohn'ahran Plains/0 18.81,51.89
accept Thin the Veil##66394 |goto 18.81,51.89
accept Our Full Strength##66397 |goto 18.81,51.89
stickystart "Deactivate_Barrier_Moorings"
stickystart "Free_Emerald_Scaleguards_or_Wardens"
step
Kill enemies around this area
collect Volatile Frostfire##193221 |n
|tip One is required to free each NPC from ice blocks.
clicknpc Gerithus##187657
Free Gerithus |q 66397/2 |goto 18.78,51.91
step
collect Volatile Frostfire##193221 |q 66397/1 |goto 19.01,50.89
step
label "Deactivate_Barrier_Moorings"
clicknpc Barrier Mooring##188383+
|tip They look like large torns growing out of the ground all over this area.
Deactivate #6# Barrier Moorings |q 66394/1 |goto 19.01,50.89
step
label "Free_Emerald_Scaleguards_or_Wardens"
Kill enemies around this area
collect Volatile Frostfire##193221 |n
|tip One is required to free each NPC from ice blocks.
clicknpc Emerald Scaleguard##190385+
clicknpc Emerald Warden##194700+
|tip They look like dragons trapped in ice all over this area.
Free #4# Emerald Scaleguards or Wardens |q 66397/3 |goto 19.01,50.89
talk Gerithus##188763
turnin Our Full Strength##66397 |goto 18.58,51.66
step
talk Ysera##187646
turnin Thin the Veil##66394 |goto 18.82,51.88
accept Reunited, Once Again##66635 |goto 18.82,51.88
step
talk Ysera##187646
Tell her _"I'm ready."_
Speak with Ysera |q 66635/1 |goto 18.82,51.88
step
talk Merithra##187660
turnin Reunited, Once Again##66635 |goto 18.88,51.11
accept The Emerald Dragonflight##66398 |goto 18.88,51.11
step
talk Gerithus##188763
Tell him _"I'm ready to fly to Lunedane and face Rymek."_
Speak to Gerithus |invehicle |q 66398 |goto 18.58,51.65
step
Watch the dialogue
|tip You will eventually land on a platform in Lunedane.
Reach Lunedane |outvehicle |q 66398
step
talk Gerithus##188787
turnin The Emerald Dragonflight##66398 |goto 21.98,76.09
accept We'll Cross that Bridge##66399 |goto 21.98,76.09
step
Enter the building |goto 21.30,76.91 < 10 |walk
clicknpc Frost Core##190004
|tip Inside the building.
Destroy the First Frost Core |q 66399/1 |goto 21.08,76.56
step
Enter the building |goto 21.74,78.22 < 10 |walk
clicknpc Frost Core##190005
|tip Inside the building.
Destroy the Second Frost Core |q 66399/2 |goto 21.88,78.40
step
kill Frostdrake##188804 |q 66399/3 |goto 21.15,79.13
step
talk Somnikus##188840
turnin We'll Cross that Bridge##66399 |goto 20.92,79.79
accept Winter's Fall##66400 |goto 20.92,79.79
step
kill Rymek##188846 |q 66400/1 |goto 20.13,81.29
|tip When Rymek uses Whirlwind, move him into the big blue area on the ground.
|tip Green areas will heal you over time while you stand in them.
step
Watch the dialogue
talk Merithra##188847
turnin Winter's Fall##66400 |goto 19.78,81.65
accept The Dreamer##66401 |goto 19.78,81.65
step
talk Dream Locus##188843
Choose _<Witness the restoration.>_
Speak to Merithra |q 66401/1 |goto 19.39,82.17
step
talk Merithra##188848
turnin The Dreamer##66401 |goto 19.62,81.90
step
talk Ysera##188850
accept Like Mother, Like Daughter##66402 |goto 19.81,81.69
step
Watch the dialogue
Witness the Ascension of Merithra |q 66402/1 |goto 19.81,81.69
step
talk Merithra##188848
turnin Like Mother, Like Daughter##66402 |goto 19.77,81.69
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 20 with the Valdrakken Accord |complete factionrenown(2510) >= 20
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Giera##195782
accept Fitting In##70891 |goto Valdrakken/0 31.63,69.36
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 21 with the Valdrakken Accord |complete factionrenown(2510) >= 21
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Kaestrasz##185561
accept Variety is the Spice of Life##70904 |goto 46.67,78.95
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 22 with the Valdrakken Accord |complete factionrenown(2510) >= 22
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Provisioner Thom##193659
|tip Inside the building.
accept Crowning Achievement##70915 |goto 36.57,50.64
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 23 with the Valdrakken Accord |complete factionrenown(2510) >= 23
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept Flying With Our Colors##70905 |goto 58.18,35.15
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 24 with the Valdrakken Accord |complete factionrenown(2510) >= 24
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 25 with the Valdrakken Accord |complete factionrenown(2510) >= 25
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Giera##195782
accept Mysteries in Paper and Glass##70910 |goto 31.62,69.34
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 26 with the Valdrakken Accord |complete factionrenown(2510) >= 26
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Kaestrasz##185561
accept Armored and Ready##70911 |goto 46.67,78.95
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 27 with the Valdrakken Accord |complete factionrenown(2510) >= 27
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept The Accord's High Standards##70912 |goto 58.18,35.15
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 28 with the Valdrakken Accord |complete factionrenown(2510) >= 28
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Armorsmith Terisk##195770
|tip Inside the building.
accept To Bear Our Mantle##70913 |goto 35.95,49.70
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 29 with the Valdrakken Accord |complete factionrenown(2510) >= 29
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Weaponsmith Koref##195769
|tip Inside the building.
accept The Breadth of Dragon Weaponry##70914 |goto 36.17,51.95
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841 |n |repeatable
'|turnin A Titan Relic##70840 |n |repeatable
Reach Renown Level 30 with the Valdrakken Accord |complete factionrenown(2510) >= 30
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
talk Unatos##193015
|tip Inside the building.
accept Beknownst and Glorious##70916 |goto 58.18,35.15
step
talk Unatos##193015
|tip Inside the building.
accept Renowned with the Valdrakken Accord##71023 |goto 58.18,35.15
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Winterpelt Furbolg",{
author="support@zygorguides.com",
description="This guide will help you unlock the Winterpelt Furbolg reputation and repeatable reputation quest."
},[[
step
talk Sonova Snowden##189401
accept Hollow Up##66553 |goto The Azure Span/0 65.39,15.95
accept Aggressive Self-Defence##66554 |goto 65.39,15.95
stickystart "Defeat_Winterpelt_Furbolgs"
step
click Various Objects
|tip They look like totems, vases, large pieces of trees and stones, and dead bear people on the ground around this area.
Uncover #6# Clues |q 66553/1 |goto 66.39,12.77
step
label "Defeat_Winterpelt_Furbolgs"
Kill Winterpelt enemies around this area
|tip They look like white bear people.
|tip They will eventually surrender and run away.
Defeat #6# Winterpelt Furbolgs |q 66554/1 |goto 66.39,12.77
step
talk Sonova Snowden##189401
turnin Hollow Up##66553 |goto 65.39,15.95
turnin Aggressive Self-Defence##66554 |goto 65.39,15.95
accept Bear With Me##66555 |goto 65.39,15.95
step
talk Sonova Snowden##189401
|tip Choose any of the dialogue options, it doesn't matter.
Witness the Translation |q 66555/1 |goto 65.39,15.95
step
talk Sonova Snowden##189401
turnin Bear With Me##66555 |goto 65.39,15.95
accept Ice Cave Ya Got There##66556 |goto 65.39,15.95
step
Enter the cave |goto 66.33,11.53 < 10 |walk
Investigate the Cave in Winterpelt Hollow |q 66556/1 |goto 65.98,10.73
|tip Inside the cave.
step
Watch the dialogue
|tip Stormshackler Rynea's guards will become hostile.
|tip Kill her 2 guards to be able to attack her.
|tip Inside the cave.
kill Stormshackler Rynea##189391 |q 66556/2 |goto 65.98,10.73
step
Leave the cave |goto 66.33,11.53 < 10 |walk |only if subzone("Winterpelt Hollow") and _G.IsIndoors()
talk Sonova Snowden##189401
turnin Ice Cave Ya Got There##66556 |goto 65.39,15.95
accept Academic Aquaintances##66557 |goto 65.39,15.95
step
talk Garz##187301
turnin Academic Aquaintances##66557 |goto 63.20,58.62
accept Broken Traditions, Broken Bodies##66141 |goto 63.20,58.62
step
talk Narn##190873
Ask him _"What's happening?"_
Speak to Narn |q 66141/1 |goto 65.62,54.84
step
talk Garz##187308
turnin Broken Traditions, Broken Bodies##66141 |goto 63.51,52.98
accept Former Furbolg Family##66148 |goto 63.51,52.98
accept Elemental Influence##66149 |goto 63.51,52.98
accept Rescuing Radza##66150 |goto 63.51,52.98
stickystart "Slay_Rustpine_Furbolg_And_Elementals"
step
talk Radza Thunderclaw##187501
|tip You may not be able to talk to him if someone already did and is completing the quest.
Tell him _"I am prepared to fight off your captors."_
Kill the enemies that attack in waves
kill Khargall Fivefangs##188102
Defend Radza Thunderclaw |q 66150/2 |goto 60.95,51.46
step
click Primalist Earthbind Totem+
|tip They look like small wooden pedestals on the ground around this area.
Destroy #3# Primalist Earthbind Totems |q 66149/1 |goto 61.80,51.94
step
label "Slay_Rustpine_Furbolg_And_Elementals"
Kill enemies around this area
|tip They look like stone elementals and bear people.
Slay #15# Rustpine Furbolg and Elementals |q 66148/1 |goto 61.80,51.94
step
talk Narn##187534
turnin Former Furbolg Family##66148 |goto 60.93,50.59
turnin Elemental Influence##66149 |goto 60.93,50.59
step
talk Radza Thunderclaw##187616
turnin Rescuing Radza##66150 |goto 60.91,50.51
accept His Stone Heart##66151 |goto 60.91,50.51
step
Enter the cave |goto 60.85,50.01 < 30 |walk
kill Stoneheart##187387 |q 66151/1 |goto 60.51,49.48
|tip Inside the cave.
step
talk Radza Thunderclaw##187616
turnin His Stone Heart##66151 |goto 60.91,50.51
step
talk Garz##187535
accept Nowhere to Go##66152 |goto 60.99,50.57
step
talk Garz##188897
turnin Nowhere to Go##66152 |goto 63.20,58.67
step
talk Tuskarr Elder##190300
accept Riders in the Snow##66708 |goto 65.90,25.48
|tip If you cannot accept this quest, try skipping this step and accepting the quest on the next step.
step
talk Old Grimtusk##189963
turnin Riders in the Snow##66708 |goto 59.26,39.73 |only if haveq(66708) or completedq(66708)
accept Field Medic 101##66709 |goto 59.26,39.73
step
click Gnoll Spear
|tip It looks like a brown wooden handle sticking out of the body.
Remove the Spear |q 66709/1 |goto 59.26,39.73
step
click Pile of Wood+
|tip They look like small piles of brown wooden boards on the ground around this area.
Collect #5# Piles of Wood |q 66709/2 |goto 59.20,39.79
step
click Campfire
Start the Campfire |q 66709/3 |goto 59.24,39.75
step
talk Old Grimtusk##189963
Choose _"<Cauterize the wound as requested.>"_
Cauterize the Wound |q 66709/4 |goto 59.26,39.72
step
talk Old Grimtusk##189963
turnin Field Medic 101##66709 |goto 59.26,39.72
accept The Extraction##66715 |goto 59.26,39.72
step
Find the Missing Tuskarrs |q 66715/1 |goto 58.23,41.97
step
talk Frostbite##189625
|tip In a wooden cage.
turnin The Extraction##66715 |goto 58.38,41.99
accept Snowball Effect##66703 |goto 58.38,41.99
step
kill Snowhide Shaman##189654
|tip Inside the tree.
Retrieve the Totem |q 66703/1 |goto 58.35,42.63 |count 1
step
kill Snowhide Shaman##189654
|tip Inside the tree.
Retrieve the Totem |q 66703/1 |goto 56.88,42.33 |count 2
step
kill Snowhide Shaman##189654
Retrieve the Totem |q 66703/1 |goto 57.64,41.54 |count 3
step
talk Frostbite##189625
|tip In a wooden cage.
turnin Snowball Effect##66703 |goto 58.38,41.99
accept Frostbite: Causes and Symptoms##67050 |goto 58.38,41.99
step
click Snowhide Totem
Place the Snowhide Totem |q 67050/1 |goto 58.27,41.95 |count 1
step
click Snowhide Totem
Place the Snowhide Totem |q 67050/1 |goto 58.24,41.99 |count 2
step
click Snowhide Totem
Place the Snowhide Totem |q 67050/1 |goto 58.23,41.92 |count 3
step
talk Old Grimtusk##189963
Return to Old Grimtusk |q 67050/2 |goto 58.48,40.53
step
talk Old Grimtusk##189963
turnin Frostbite: Causes and Symptoms##67050 |goto 58.48,40.53
accept True Survivors##66730 |goto 58.48,40.53
step
talk Old Grimtusk##196812
turnin True Survivors##66730 |goto 58.79,34.91
accept No Vengeance on an Empty Stomach##71013 |goto 58.79,34.91
step
talk Young Quickhands##196840
|tip Learn the "Dragon Isles Fishing" skill.
Learn the Fishing Skill from Young Quickhands |q 71013/1 |goto 58.81,34.78
step
cast Fishing##131474
|tip Click the Fishing Bobber when it bounces in the water.
|tip Keep repeating this process.
Fish #3# Frozen Tail Darters |q 71013/2 |goto 58.86,34.83
step
talk Old Grimtusk##196812
turnin No Vengeance on an Empty Stomach##71013 |goto 58.79,34.91
accept A Far Furbolg Friend##71014 |goto 58.79,34.91
accept All Brawn, No Brains##71015 |goto 58.79,34.91
step
talk Varsek##196816
|tip Inside the crumbled building.
turnin All Brawn, No Brains##71015 |goto 21.05,35.09
step
talk Barst##196806
turnin A Far Furbolg Friend##71014 |goto 1.18,39.26
accept A Little Kelp for My Friends##70996 |goto 1.18,39.26
step
Enter the cave |goto 0.54,38.94 < 10 |walk
kill Wild Kelp Elemental##196809 |q 70996/1 |goto 0.81,39.03
|tip Inside the cave.
step
talk Barst##196806
|tip Outside, on top of the cave.
turnin A Little Kelp for My Friends##70996 |goto 1.18,39.26
step
use Sonova's Request##204254
accept Academic Assistance##72546
|tip Open your adventure guide and scroll the content until you find this quest.
|tip You can also find Sonova's Request in your mailbox.
step
talk Sonova Snowden##189401
turnin Academic Assistance##72546 |goto 65.39,15.94
accept Primalist Pillagers##72588 |goto 65.39,15.94
accept Honor Their Sacrifice##72589 |goto 65.39,15.94
stickystart "Collect_Frosty_Foraged_Foods"
step
clicknpc Winterpelt Forager##199303+
|tip They look like dead furbolg on the ground around this area.
collect 6 Winterpelt Jewelry##202246 |q 72589/1 |goto 68.14,19.07
step
label "Collect_Frosty_Foraged_Foods"
Kill enemies around this area
collect 8 Frosty Foraged Foods##202244 |q 72588/1 |goto 68.21,18.58
step
talk Sonova Snowden##189401
turnin Primalist Pillagers##72588 |goto 65.39,15.95
turnin Honor Their Sacrifice##72589 |goto 65.39,15.95
accept Academic Acquisitions##72547 |goto 65.39,15.95
step
Kill enemies around this area
collect 5 Liberated Furbolg Artifacts##202017 |q 72547/1 |goto 68.26,18.54
step
talk Sonova Snowden##201065
turnin Academic Acquisitions##72547 |goto 66.92,12.72
step
Kill enemies around this area
collect Intact Scribe Stick##202018 |goto 68.26,18.54 |n
collect 125 Liberated Furbolg Artifacts##202017 |goto 68.26,18.54 |n
|tip You will need around 500 Liberated Furbolg Artifacts in total to reach the cap of 100.
|tip Each Intact Scribe Stick will remove 5 from that total number.
Click Here to Continue |confirm |complete language("Furbolg")>=25
step
talk Sonova Snowden##201065
|tip Turn in the Intact Scribe Sticks and Liberated Furbolg Artifacts you have farmed to increase your Furbolg Language.
'|turnin Additional Academic Acquisitions##72586 |n |repeatable
'|turnin Astonishing Academic Acquisitions##72587 |n |repeatable
Reach Level 25 in the Furbolg Language |complete language("Furbolg")>=25 |goto 66.92,12.72
step
Reach Level 25 in the Furbolg Language
confirm
step
talk Sonova Snowden##201065
accept Honeyfreeze Mead##73550 |goto 66.92,12.72
accept Hive Maintenance##73692 |goto 66.92,12.72
stickystart "Collect_8_Honeyfreeze_Honey"
step
Run through the Blooming Frostbell's
Gain the _"Pollen Power!"_ Buff |complete hasbuff(399327) |q 73692/1
|tip The buff will last 9 seconds.
|tip Run into Honeyfreeze Pollinators.
Deliver Pollen to #8# Honeyfreeze Pollinators |q 73692/1 |goto 62.13,17.79
step
label "Collect_8_Honeyfreeze_Honey"
click Honeyfreeze Honeycomb##385968
collect 1 Honeyfreeze Honey##202243 |q 73550/1 |goto 61.94,18.61
step
click Honeyfreeze Honeycomb##385968
collect 2 Honeyfreeze Honey##202243 |q 73550/1 |goto 61.90,18.70
step
click Honeyfreeze Honeycomb##385968
collect 3 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.04,19.14
step
click Honeyfreeze Honeycomb##385968
collect 4 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.41,19.57
step
click Honeyfreeze Honeycomb##385968
collect 5 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.67,19.80
step
click Honeyfreeze Honeycomb##385968
collect 6 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.65,19.71
step
click Honeyfreeze Honeycomb##385968
collect 7 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.71,19.52
step
click Honeyfreeze Honeycomb##385968
collect 8 Honeyfreeze Honey##202243 |q 73550/1 |goto 62.83,19.54
step
talk Sonova Snowden##201065
turnin Honeyfreeze Mead##73550 |goto 66.92,12.72
turnin Hive Maintenance##73692 |goto 66.92,12.72
accept Local Flavors##73704 |goto 66.92,12.72
step
talk Kazzi##201105
Choose _"<Ask about local flavor options to incorporate into the brew Sonova is working on.>"_
Collect the Brewing Supplies |q 73704/1 |goto 65.81,12.69
step
talk Sonova Snowden##201065
turnin Local Flavors##73704 |goto 66.92,12.72
step
Reach Level 50 in the Furbolg Language
confirm
step
talk Garz##199266
accept A Living History##72551 |goto 66.87,12.99
step
Find the First Route Marker |q 72551/1 |goto 61.80,18.33
step
Find the Last Route Marker |q 72551/2 |goto 57.34,20.06
step
Find the Hidden Elders |q 72551/3 |goto 57.25,21.26
step
talk Elder Mhaz##199271
turnin A Living History##72551 |goto 57.39,21.07
accept Gathering Together##72552 |goto 57.39,21.07
step
talk Matron Fherg##199272
accept More Effort, More Reward##72553 |goto 57.37,20.86
stickystart "Collect_12_Chillwrought_Worm_Meat"
step
click Best-root Bush##384842
collect 1 Best-root Tuber##202181 |q 72552/1 |goto 57.78,21.87
step
click Best-root Bush##384842
collect 2 Best-root Tuber##202181 |q 72552/1 |goto 58.43,21.64
step
click Best-root Bush##384842
collect 3 Best-root Tuber##202181 |q 72552/1 |goto 58.55,21.58
step
click Best-root Bush##384842
collect 4 Best-root Tuber##202181 |q 72552/1 |goto 58.64,21.19
step
click Best-root Bush##384842
collect 5 Best-root Tuber##202181 |q 72552/1 |goto 58.51,21.10
step
click Best-root Bush##384842
collect 6 Best-root Tuber##202181 |q 72552/1 |goto 58.34,21.14
step
click Best-root Bush##384842
collect 7 Best-root Tuber##202181 |q 72552/1 |goto 59.28,19.72
step
click Best-root Bush##384842
collect 8 Best-root Tuber##202181 |q 72552/1 |goto 59.38,19.58
step
label "Collect_12_Chillwrought_Worm_Meat"
map The Azure Span
path    59.27,22.82    60.76,23.27    62.47,23.70    62.58,22.50    61.40,21.83
path    60.17,21.42
Kill Chillwrought Enemies Along this Path
collect 12 Chillwrought Worm Meat##202185 |q 72553/1
step
talk Elder Mhaz##199271
turnin Gathering Together##72552 |goto 57.39,21.07
step
talk Matron Fherg##199272
turnin More Effort, More Reward##72553 |goto 57.37,20.86
accept Break Him##72554 |goto 57.37,20.87
step
kill Icebreaker##199279 |q 72554/2 |goto 55.09,19.72
collect Saza's Blade##203651 |n
accept Returning the Blade##74433
step
talk Saza##200861
Find Saza |q 72554/1 |goto 54.92,19.69
step
talk Matron Fherg##199272
turnin Break Him##72554 |goto 57.37,20.87
step
talk Jyrra "Fuzzy Feet" Coldsoar##200206
turnin Returning the Blade##74433 |goto 66.83,13.01
step
Reach Level 75 in the Furbolg Language
confirm
step
talk Garz##199266
accept Path of Trust##73035 |goto 66.87,12.99
step
talk Radza Thunderclaw##199267
turnin Path of Trust##73035 |goto 65.99,12.61
accept Our Honored Ancestors##72558 |goto 65.99,12.61
step
Choose _<"Breath in the smoke to entice visions of the Winterpelt ancestors.">_
Use Radza's Incense |q 72558/1 |goto 65.95,12.64
step
talk Radza Thunderclaw##199267
turnin Our Honored Ancestors##72558 |goto 65.99,12.61
step
talk Ancestor Brazzok##199996
accept Ancestral Advice##72941 |goto 65.97,12.73
step
Choose _"What is your message, ancestor?"_
talk Ancestor Brazzok##199996
Listen to the Ancestor's Message |q 72941/1 |goto 65.97,12.73
step
talk Ancestor Molg##199300
accept Our Path Ahead##72945 |goto 67.05,13.12
step
Choose _"What is your message, ancestor?"_
talk Ancestor Molg##199300
Listen to the Ancestor's Message |q 72945/1 |goto 67.05,13.12
step
talk Jhagaza the Wordkeeper##199299
accept History Heist##72559 |goto 66.98,11.90
step
talk Little Toz##199315
Choose _"I have an important message for you from your ancestor."_
Then Choose _"Make sure to marry Bright Fur immediately."_
Give the Message to Little T'oz |q 72941/2 |goto 67.18,12.06
step
Enter the building |goto 66.33,11.45 < 10 |walk
talk Kranac Sagesnow##189394
|tip Inside the building.
Choose _"I have an important message from your ancestor."_
Then Choose _"The Winterpelt must obtain allies."_
Give the Message to Kranac Sagesnow |q 72945/2 |goto 65.92,10.68
step
click Stolen Winterpelt Crate##380841
collect Scribbled Bark Chunks##198834 |q 72559/1 |goto 70.60,31.72
step
talk Radza Thunderclaw##199267
turnin History Heist##72559 |goto 65.99,12.61
turnin Ancestral Advice##72941 |goto 65.99,12.61
turnin Our Path Ahead##72945 |goto 65.99,12.61
step
Reach Level 100 in the Furbolg Language
confirm
step
talk Sonova Snowden##201065
accept Words of the Winterpelt##72598 |goto 66.92,12.72
step
Enter the building |goto 66.33,11.51 < 10 |walk
talk Kranac Sagesnow##189394
turnin Words of the Winterpelt##72598 |goto 65.92,10.68
accept Ursol's Wisdom##72590 |goto 65.92,10.68
accept Ursoc's Strength##72597 |goto 65.92,10.68
stickystart "Collect_12_Rustpine_Cones"
step
Ride the Winds of the Isles on a drake |q 72590/1 |goto 66.39,13.17
|tip Make sure you are using your Dragonflight mount.
step
label "Collect_12_Rustpine_Cones"
collect 12 Rustpine Cone##202245 |q 72590/2 |goto 65.72,10.94
|tip They are in the tries above the village.
step
click Rustpine Cone
Ursol Contacted |q 72590/3 |goto 69.91,9.70
step
click Ursoc's Totem
Contact Ursoc |q 72597/1 |goto 72.88,18.14
step
talk Ursoc's Faithful##199308
Choose _"I am willing."_
kill Ursoc's Faithful##199308
Gain Ursoc's Blessing |q 72597/2 |goto 72.84,18.21
step
Enter the building |goto 66.33,11.51 < 10 |walk
talk Kranac Sagesnow##189394
turnin Ursol's Wisdom##72590 |goto 65.92,10.68
turnin Ursoc's Strength##72597 |goto 65.92,10.68
accept Champion of the Winterpelt##73031 |goto 65.92,10.68
step
Choose _"I am ready to begin."_
talk Kranac Sagesnow##189394
Celebration Begun |q 73031/1 |goto 65.92,10.68
step
talk Kranac Sagesnow##189394
turnin Champion of the Winterpelt##73031 |goto 65.92,10.68
step
Reach Exalted with the Winterpelt Furbolg |complete rep("Winterpelt Furbolg")>Exalted |goto 68.26,18.54
|tip This grind is similar to the Timbermaw Hold rep grind.
|tip Farm Liberated Furbolg Artifacts and turn them in at Sonova Snowden for rep.
You can find Sonova at [66.92,12.72]
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Loamm Niffen",{
author="support@zygorguides.com",
description="This guide will walk you through Loamm Niffen renown content.",
patch='100100',
},[[
step
Complete the "Orientation: Loamm Niffen" Quest |q 75643 |or
|tip This quest is required to unlock Loamm Niffen renown.
|tip Progress through the Zaralek Cavern guide to unlock it.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
Click Here to Load the Zaralek Cavern Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Zaralek Cavern"
step
Reach Renown Level 2 with the Loamm Niffen |complete factionrenown(2564) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 3 with the Loamm Niffen |complete factionrenown(2564) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Care to Barter?##75720
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Ponzo##204693
turnin Care to Barter?##75720 |goto Zaralek Cavern/0 58.09,53.81
accept Bartering 101##75721 |goto 58.09,53.81
step
talk Kayann##203516
turnin Bartering 101##75721 |goto Valdrakken/0 36.45,62.48
step
Reach Renown Level 4 with the Loamm Niffen |complete factionrenown(2564) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Drake's Shadowflame Crest##75722
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Mimuup##204254
|tip Inside the building.
turnin Drake's Shadowflame Crest##75722 |goto Zaralek Cavern/0 56.53,55.66
step
Reach Renown Level 5 with the Loamm Niffen |complete factionrenown(2564) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Cavern Drakewatching##75723
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Harlowe Marl##202468
|tip Inside the building.
turnin Cavern Drakewatching##75723 |goto 56.49,55.62
step
Reach Renown Level 6 with the Loamm Niffen |complete factionrenown(2564) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Like the Niffen Do##75724
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Mimuup##204254
|tip Inside the building.
turnin Like the Niffen Do##75724 |goto 56.53,55.66
step
Reach Renown Level 7 with the Loamm Niffen |complete factionrenown(2564) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Off to the Track##75725
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Briggul##201752
turnin Off to the Track##75725 |goto 44.25,79.93
step
Reach Renown Level 8 with the Loamm Niffen |complete factionrenown(2564) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 9 with the Loamm Niffen |complete factionrenown(2564) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 10 with the Loamm Niffen |complete factionrenown(2564) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept The Smelliest Tabard##75727
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Mimuup##204254
|tip Inside the building.
turnin The Smelliest Tabard##75727 |goto 56.53,55.66
step
Reach Renown Level 11 with the Loamm Niffen |complete factionrenown(2564) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 12 with the Loamm Niffen |complete factionrenown(2564) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Bartering Boulders##75728
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Ponzo##204693
turnin Bartering Boulders##75728 |goto 58.09,53.81
step
Reach Renown Level 13 with the Loamm Niffen |complete factionrenown(2564) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Slitherdrake Watching##75730
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Harlowe Marl##202468
|tip Inside the building.
turnin Slitherdrake Watching##75730 |goto 56.49,55.62
step
Reach Renown Level 14 with the Loamm Niffen |complete factionrenown(2564) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Scented Boots##75731
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Harlowe Marl##202468
|tip Inside the building.
turnin Scented Boots##75731 |goto 56.49,55.62
step
Reach Renown Level 15 with the Loamm Niffen |complete factionrenown(2564) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 16 with the Loamm Niffen |complete factionrenown(2564) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Airborne Winding##76030
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Harlowe Marl##202468
|tip Inside the building.
turnin Airborne Winding##76030 |goto 56.49,55.62
step
Reach Renown Level 17 with the Loamm Niffen |complete factionrenown(2564) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Bundle of Boulders##75741
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Ponzo##204693
turnin Bundle of Boulders##75741 |goto 58.09,53.81
step
Reach Renown Level 18 with the Loamm Niffen |complete factionrenown(2564) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
Reach Renown Level 19 with the Loamm Niffen |complete factionrenown(2564) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Drake Helms##75742
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Harlowe Marl##202468
|tip Inside the building.
turnin Drake Helms##75742 |goto 56.49,55.62
step
Reach Renown Level 20 with the Loamm Niffen |complete factionrenown(2564) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept A Token of Our Gratitude##75744
|tip You may need to relog to see this quest or leave Zaralek Cavern.
|tip You may need to skip this step if you have completed it on an alt.
step
talk Mimuup##204254
|tip Inside the building.
turnin A Token of Our Gratitude##75744 |goto 56.53,55.66
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Dream Wardens",{
author="support@zygorguides.com",
description="This guide will walk you through Dream Wardens renown content.",
patch='100200',
areapoiid=7636,
areapoitype="faction (Dream Wardens)",
},[[
step
Reach Renown Level 2 with the Dream Wardens |complete factionrenown(2574) >= 2
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Dragon Isles Supplies##78579 |goto The Emerald Dream/0 50.21,61.58
|tip If this quest is not available you can skip this step.
step
Reach Renown Level 3 with the Dream Wardens |complete factionrenown(2574) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Sylvia Whisperbloom##211265
accept Small Dreamseeds##78385 |goto The Emerald Dream/0 59.75,16.89
step
Reach Renown Level 4 with the Dream Wardens |complete factionrenown(2574) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Whelpling's Dreaming Crest##78356 |goto 50.21,61.59
step
Reach Renown Level 5 with the Dream Wardens |complete factionrenown(2574) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Dragon Isles Supplies##78580 |goto The Emerald Dream/0 50.21,61.58
|tip If this quest is not available you can skip this step.
step
_Next to you:_
talk Melsysra##211962
accept Emerald Reawakening##78386 |goto The Emerald Dream/0 50.15,61.87
step
talk Elianna##211209
turnin Emerald Reawakening##78386 |goto 50.23,61.80
accept Mean Green Infusion Machine##78430 |goto 50.23,61.80
step
kill Sickly Lasher##207809+
kill Meddling Podling##207997+
Extract #6# Dream Infusions |q 78430/1 |goto 58.65,72.45
step
talk Elianna##211209
turnin Mean Green Infusion Machine##78430 |goto 50.23,61.80
accept Green Dream Team##78431 |goto 50.23,61.80
step
use Rithro##205160
learnpet Rithro##3552 |q 78431
step
use Rithro##205160
Summon Rithro |q 78431/1 |goto 50.23,61.81
step
talk Elianna##211209
buy Snorr##210785 |goto 50.23,61.80 |q 78431
step
use Snorr##210785
Obtain and Learn Snorr from Elianna |q 78431/2
step
talk Elianna##211209
turnin Green Dream Team##78431 |goto 50.23,61.81
step
Reach Renown Level 6 with the Dream Wardens |complete factionrenown(2574) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 7 with the Dream Wardens |complete factionrenown(2574) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 8 with the Dream Wardens |complete factionrenown(2574) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Dragon Isles Supplies##78581 |goto The Emerald Dream/0 50.21,61.58
|tip If this quest is not available you can skip this step.
step
talk Keeper Amrymn##208143
accept Drake's Dreaming Crest##78358 |goto 50.21,61.58
|tip If this quest is not available you can skip this step.
step
Reach Renown Level 9 with the Dream Wardens |complete factionrenown(2574) >= 9
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Sylvia Whisperbloom##211265
accept Plump Dreamseeds##78387 |goto 59.75,16.89
step
Reach Renown Level 10 with the Dream Wardens |complete factionrenown(2574) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
_Next to you:_
talk Melsysra##211962
accept The Tabard of Your Dreams##78363 |goto 50.15,61.87
step
talk Keeper Amrymn##208143
turnin The Tabard of Your Dreams##78363 |goto 50.21,61.59
step
Reach Renown Level 11 with the Dream Wardens |complete factionrenown(2574) >= 11
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 12 with the Dream Wardens |complete factionrenown(2574) >= 12
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Drake's Dreaming Crest##78364 |goto 50.21,61.59
step
Reach Renown Level 13 with the Dream Wardens |complete factionrenown(2574) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 14 with the Dream Wardens |complete factionrenown(2574) >= 14
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 15 with the Dream Wardens |complete factionrenown(2574) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Flightstones##78374 |goto 50.21,61.59
|tip If this quest is not available you can skip this step.
step
Reach Renown Level 16 with the Dream Wardens |complete factionrenown(2574) >= 16
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
Reach Renown Level 17 with the Dream Wardens |complete factionrenown(2574) >= 17
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Sylvia Whisperbloom##211265
accept Gigantic Dreamseeds##78388 |goto 59.75,16.89
step
Reach Renown Level 18 with the Dream Wardens |complete factionrenown(2574) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
_Next to you:_
talk Melsysra##211962
accept Dream Infused##78595 |goto 50.15,61.87
|tip If this quest is not available you can skip this step.
step
talk Elianna##211209
turnin Dream Infused##78595 |goto 50.23,61.81
step
Reach Renown Level 19 with the Dream Wardens |complete factionrenown(2574) >= 19
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
talk Keeper Amrymn##208143
accept Drake's Dreaming Crest##78372 |goto 50.21,61.59
|tip If this quest is not available you can skip this step.
step
Reach Renown Level 20 with the Dream Wardens |complete factionrenown(2574) >= 20
|tip Complete daily quests, weekly quests, and zone quests in The Emerald Dream to gain renown.
|tip Completing "The Emerald Dream" guide awards numerous reputation tokens.
step
_Next to you:_
talk Melsysra##211962
accept The Dream Thanks You##78373 |goto 50.15,61.87
|tip If this quest is not available you can skip this step.
step
talk Keeper Amrymn##208143
turnin The Dream Thanks You##78373 |goto 50.21,61.58
]])
