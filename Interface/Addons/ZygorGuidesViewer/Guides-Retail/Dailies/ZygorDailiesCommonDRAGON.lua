local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("DailiesCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\The Azure Span World Quests",{
author="support@zygorguides.com",
description="\nThis guide will assist you in completing world quests in The Azure Span.",
condition_suggested=function() return completedq(66221) end,
startlevel=60,
worldquestzone={2024},
patch='100001',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-70658
accept Artifact or Fiction##70658 |goto The Azure Span/0 72.15,21.09
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70658/1 |goto 72.15,21.09
step
click Handhold
Find a Handhold on the Cliff |q 70658/2 |goto 71.84,21.11
step
click Draconic Artifact+
|tip Draconic Artifacts are found next to handholds on both sides.
|tip Click handholds to move up the wall and excavate artifacts.
|tip Skip Crumbling Ice patches when possible, as they will reduce your grip.
Excavate #7# Draconic Artifacts from the Cliff Face |q 70658/3 |goto 71.58,19.22
|next "Dragon_World_Quest_Emissaries"
step
label quest-70629
accept Assaulting the Shore##70629 |goto The Azure Span/0 10.01,41.78
|tip You will accept this quest automatically.
step
click Stolen Goods##381055+
click Gorloc Eggs##381092+
Kill Brinetooth enemies around this area
Pacify the Gorlocs |q 70629/1 |goto 10.01,41.78
|next "Dragon_World_Quest_Emissaries"
step
label quest-71212
accept Attackin' the Brackenhide##71212 |goto The Azure Span/0 13.07,35.10
|tip You will accept this quest automatically.
step
Kill enemies around this area
Disrupt the Brackenhide |q 71212/1 |goto 13.07,35.10
|next "Dragon_World_Quest_Emissaries"
step
label quest-70639
accept Azure Banners##70639 |goto The Azure Span/0 74.46,23.52
|tip You will accept this quest automatically.
step
Plant #10# Banners |q 70639/1 |goto 74.46,23.52
|tip Use your dragonriding abilities to fly through 10 golden rings.
|tip You can find them on cliffs and ledges around this area.
|tip They appear on your minimap as yellow dots.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69927
accept Bazual##69927 |goto The Azure Span/0 79.21,36.37
|tip You will accept this quest automatically.
step
kill Bazual##193532 |q 69927/1 |goto 79.21,36.37
_EVERYONE:_ |grouprole EVERYONE
|tip "Deterring Flame" will deal damage and knock everyone back. |grouprole EVERYONE
|tip Avoid standing in magma pools after "Magma Eruption" casts. |grouprole EVERYONE
|tip Move out of areas showing rain of fire during "Rain of Destruction" while Bazual is at 100 energy.|grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill elementals quickly when they spawn. |grouprole DAMAGE
|tip Avoid standing in front of Bazual. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Searing Heat" will deal damage to the entire raid while Bazual is at 100 energy. |grouprole HEALER
|tip Avoid standing in front of Bazual.  |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Lava Breath" deals heavy damage in a frontal cone. |grouprole TANK
|tip Avoid facing Bazual towards raid members. |grouprole TANK
|next "Dragon_World_Quest_Emissaries"
step
label quest-70662
accept A Bone to Pickaxe##70662 |goto The Azure Span/0 28.47,45.18
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70662/1 |goto 28.47,45.18
step
click Handhold
Find a Handhold on the Cliff |q 70662/2 |goto 28.45,45.05
step
click Intact Dragon Bone+
|tip They look like large bones sticking out of the cliff.
|tip Avoid Highpeaks Goats which will kick at you and lower your grip.
Excavate #7# Dragon Bones in the Cliff Face |q 70662/3 |goto 28.94,44.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-69942
accept Brackenhide Mysteries##69942 |goto The Azure Span/0 18.55,35.58
|tip You will accept this quest automatically.
step
click Decaying Spirit+
Collect #5# Astral Essence |q 69942/1 |goto 18.55,35.58
|next "Dragon_World_Quest_Emissaries"
step
label quest-70529
accept Bring Them Home##70529 |goto The Azure Span/0 34.42,47.20
|tip You will accept this quest automatically.
stickystart "Slay_Darktooth_Gnolls_70529"
step
click Crude Gnoll Cage+
|tip They look like large wooden stick cages in camps around this area.
Free #6# Caged Tuskarr |q 70529/1 |goto 34.42,47.20
step
label "Slay_Darktooth_Gnolls_70529"
Kill Darktooth enemies around this area
Slay Darktooth Gnolls |q 70529/2 |goto 34.42,47.20
|next "Dragon_World_Quest_Emissaries"
step
label quest-70016
accept Calming the Land##70016 |goto The Azure Span/0 74.06,54.09
|tip You will accept this quest automatically.
step
extraaction Summon Cleansing Totem##386636
|tip Summon the totem and immediately pull a Wildwater to it.
|tip Wait for it to gain 5 stacks of the "Calming Aura" buff.
|tip Shortly after, it will become friendly and disappear.
|tip Each stack it gains will reduce its damage by 20%.
|tip The totem will only cleanse 1 mob at a time.
Calm #6# Churning Wildwaters |q 70016/1 |goto 74.06,54.09
|next "Dragon_World_Quest_Emissaries"
step
label quest-70720
accept Can't Have These##70720 |goto The Azure Span/0 12.60,42.02
|tip You will accept this quest automatically.
stickystart "Slay_the_Sundered_Flame's_Forces_70720"
step
use the Artifact Locator##199692
|tip Follow the light as it moves, using the locator as needed.
click Iskhdormi Artifact##381283+
|tip When the light stops and reveals an artifact, click it.
collect 5 Artifact Fragment##199704 |q 70720/1 |goto 12.52,43.09 |count 1
step
use the Artifact Locator##199692
|tip Follow the light as it moves, using the locator as needed.
click Iskhdormi Artifact##381283+
|tip When the light stops and reveals an artifact, click it.
collect 5 Artifact Fragment##199704 |q 70720/1 |goto 12.93,42.97 |count 2
step
use the Artifact Locator##199692
|tip Follow the light as it moves, using the locator as needed.
click Iskhdormi Artifact##381283+
|tip When the light stops and reveals an artifact, click it.
collect 5 Artifact Fragment##199704 |q 70720/1 |goto 12.77,41.88 |count 3
step
use the Artifact Locator##199692
|tip Follow the light as it moves, using the locator as needed.
click Iskhdormi Artifact##381283+
|tip When the light stops and reveals an artifact, click it.
collect 5 Artifact Fragment##199704 |q 70720/1 |goto 12.19,41.78 |count 4
step
use the Artifact Locator##199692
|tip Follow the light as it moves, using the locator as needed.
click Iskhdormi Artifact##381283+
|tip When the light stops and reveals an artifact, click it.
collect 5 Artifact Fragment##199704 |q 70720/1 |goto 12.45,40.67 |count 5
step
label "Slay_the_Sundered_Flame's_Forces_70720"
Kill Sundered enemies around this area
Slay the Sundered Flame's Forces |q 70720/2 |goto 12.60,42.02
|next "Dragon_World_Quest_Emissaries"
step
label quest-70100
accept Cataloging the Azure Span##70100 |goto The Azure Span/0 44.23,61.02
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##185085
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70100/1 |goto 44.23,61.02
step
Take Pictures of Wildlife |q 70100/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70787
accept Caught In a Dusk Storm##70787 |goto The Azure Span/0 27.19,45.99
|tip You will accept this quest automatically.
stickystart "Rescue_Dragonscale_Researcher_70787"
step
Kill Stormfang and Duskpaw enemies around this area
collect 100 Dragon Bone Fragment##199917 |q 70787/1 |goto 27.19,45.99
step
label "Rescue_Dragonscale_Researcher_70787"
clicknpc Dragonscale Researcher##196487+
|tip They look like NPCs cowering in fear around this area.
Rescue #8# Dragonscale Researchers |q 70787/2 |goto 27.19,45.99
|next "Dragon_World_Quest_Emissaries"
step
label quest-70631
accept Clearing the Skies##70631 |goto The Azure Span/0 55.86,32.40
|tip You will accept this quest automatically.
step
Kill #50# Insects |q 70631/1 |goto 55.86,32.40
|tip Fly through insects in the air.
|tip Avoid purple orbs that stall your flight.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70068
accept Cobalt Catastrophe##70068 |goto The Azure Span/0 48.26,24.34
|tip You will accept this quest automatically.
step
Kill enemies around this area
Disrupt the Sundered Flame |q 70068/1 |goto 48.26,24.34
|next "Dragon_World_Quest_Emissaries"
step
label quest-70653
accept Cold Hard Science##70653 |goto The Azure Span/0 48.22,37.63
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70653/1 |goto 48.22,37.63
step
click Handhold
Find a Handhold on the Cliff |q 70653/2 |goto 48.23,37.43
step
click Infused Glacier Sample+
|tip Use the handholds to move around the glacier and excavate samples.
|tip Glacier samples can be found near handholds on both sides of the waterfall.
Excavate #8# Infused Glacier Samples from the Ice |q 70653/3 |goto 48.41,37.55
|next "Dragon_World_Quest_Emissaries"
step
label quest-70440
accept Dead Eyes##70440 |goto The Azure Span/0 34.46,46.08
|tip You will accept this quest automatically.
stickystart "Slay_Darktooth_Gnolls_70440"
step
kill Chief Dead Eye##195337 |q 70440/1 |goto 34.85,45.41
step
label "Slay_Darktooth_Gnolls_70440"
Kill Darktooth enemies around this area
Slay Darktooth Gnolls |q 70440/2 |goto 34.46,46.08
|next "Dragon_World_Quest_Emissaries"
step
label quest-70015
accept Decay Cleanup##70015 |goto The Azure Span/0 18.35,38.06
|tip You will accept this quest automatically.
stickystart "Cleanse_Rotting_Treant_Corpses_70015"
step
kill Oozing Decay##188689+
extraaction Summon Cleansing Totem##386636 |notinsticky
|tip Use it next to their corpse. |notinsticky
Cleanse #15# Oozing Decay Corpses |q 70015/1 |goto 18.35,38.06
step
label "Cleanse_Rotting_Treant_Corpses_70015"
kill Rotting Treant##186361+
extraaction Summon Cleansing Totem##386636 |notinsticky
|tip Use it next to their corpse. |notinsticky
Cleanse #6# Rotting Treant Corpses |q 70015/2 |goto 18.35,38.06
|next "Dragon_World_Quest_Emissaries"
step
label quest-70430
accept Dragonrider Racing - Archive Ambit##70430 |goto The Azure Span/0 42.27,56.77
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##193027
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##379036 |goto 42.27,56.77 |q 70430
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 42.27,56.60 |q 70430
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70430/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-70426
accept Dragonrider Racing - Azure Span Slalom##70426 |goto The Azure Span/0 20.95,22.63
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191947
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##387548 |goto 20.95,22.63 |q 70426
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 20.89,22.66 |q 70426
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70426/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70425
accept Dragonrider Racing - Azure Span Sprint##70425 |goto The Azure Span/0 47.91,40.79
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##194372
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##376195 |goto 47.91,40.79 |q 70425
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 47.91,40.86 |q 70425
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70425/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70429
accept Dragonrider Racing - Frostland Flyover##70429 |goto The Azure Span/0 48.47,35.79
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##192945
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##378753 |goto 48.47,35.79 |q 70429
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 48.61,35.68 |q 70429
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70429/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70428
accept Dragonrider Racing - Iskaara Tour##70428 |goto The Azure Span/0 16.58,49.37
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##192886
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##378415 |goto 16.58,49.37 |q 70428
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 16.48,49.29 |q 70428
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70428/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70427
accept Dragonrider Racing - Vakthros Ascent##70427 |goto The Azure Span/0 71.29,24.64
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##192115
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##377025 |goto 71.29,24.64 |q 70427
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 71.27,24.69 |q 70427
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70427/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-74835
accept Enok the Stinky##74835 |goto The Azure Span/0 23.41,53.56
|tip You will accept this quest automatically.
step
clicknpc Enok the Stinky##202440
Defeat Enok the Stinky in a Pet Battle |q 74835/1 |goto 23.41,53.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-70612
accept Feed Three-Falls##70612 |goto The Azure Span/0 17.47,26.85
|tip You will accept this quest automatically.
stickystart "Collect_Moose_Flank_70612"
step
Kill Vorquin enemies around this area
collect 10 Vorquin Meat##193219 |q 70612/1 |goto 17.47,26.85
step
label "Collect_Moose_Flank_70612"
kill Striped Bruffalon##190726+
collect 4 Moose Flank##194030 |q 70612/2 |goto 17.47,26.85
|next "Dragon_World_Quest_Emissaries"
step
label quest-72029
accept Fishing Frenzy!##72029
|tip You will accept this quest automatically.
|polish
step
kill Spawning Thresher##194342+
|tip Underwater around this area.
collect 12 Fresh Fish Steak##198350 |q 72029/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-70152
accept Fishing Frenzy!##70152 |goto The Azure Span/0 70.99,35.35
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Steamed Crabs in the boiling water.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Steamed Crab##197079+
|tip They will die when you pull them onto the shore.
collect 8 Sweet Steamed Meat##200530 |q 70152/1 |goto 70.99,35.35
|next "Dragon_World_Quest_Emissaries"
step
label quest-72022
accept Fishing Frenzy!##72022 |goto The Azure Span/0 58.74,34.63
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Icy Blue Crabs in the water.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Icy Blue Crab##197862+
|tip They will die when you pull them onto the shore.
|tip You can also just kill them.
collect 8 Frozen Steak##200756 |q 72022/1 |goto 58.74,34.63
|next "Dragon_World_Quest_Emissaries"
step
label quest-70064
accept For Imbu!##70064 |goto The Azure Span/0 57.87,67.99
|tip You will accept this quest automatically.
step
Kill enemies around this area
Liberate Imbu |q 70064/1 |goto 57.87,67.99
|next "Dragon_World_Quest_Emissaries"
step
label quest-69941
accept Frozen Victims##69941 |goto The Azure Span/0 49.82,62.32
|tip You will accept this quest automatically.
step
clicknpc Frozen Tuskarr##194221+
|tip They look like Tuskarr NPCs frozen in ice.
|tip They appear on your minimap as yellow dots.
Free #7# Victims |q 69941/1 |goto 49.82,62.32
|next "Dragon_World_Quest_Emissaries"
step
label quest-70112
accept Furbolg Threat##70112 |goto The Azure Span/0 61.79,52.07
|tip You will accept this quest automatically.
step
Kill Rustpine enemies around this area
Slay #15# Rustpine Furbolg |q 70112/1 |goto 61.79,52.07
|next "Dragon_World_Quest_Emissaries"
step
label quest-70011
accept Furry Friends##70011 |goto The Azure Span/0 58.58,55.08
|tip You will accept this quest automatically.
step
clicknpc Wildwater Ottuk##193409+
extraaction Throw Ball##388323
|tip Throw the ball to an Ottuk.
|tip In a few seconds, it will throw the ball to a random nearby area.
|tip Run into the swirling purple area before the ball lands to catch it.
|tip You can only play with an Ottuk once per minute.
|tip Stand 10-15 yards away before throwing.
Play with Wildwater Ottuks #6# Times |q 70011/1 |goto 58.58,55.08
|next "Dragon_World_Quest_Emissaries"
step
label quest-70071
accept Gathering the Magic##70071 |goto The Azure Span/0 38.14,62.09
|tip You will accept this quest automatically.
step
click Crystaline Energy Conduit
Tap into the Energy |q 70071/1 |goto 38.14,62.09
step
Gather the Magic |q 70071/2 |goto 39.63,62.97
|tip Holding jump will fill a bar on your screen.
|tip Releasing it will launch you into the air, landing safely.
|tip The longer you hold the jump, the higher you will jump.
|tip Launch yourself through orbs in the air above you to collect magic.
|next "Dragon_World_Quest_Emissaries"
step
label quest-71145
accept The Grand Master##71145 |goto The Azure Span/0 13.88,49.85
|tip You will accept this quest automatically.
step
talk Patchu ##196069
Choose _"Begin pet battle."_
Defeat Patchu in a Pet Battle |q 71145/1 |goto 13.88,49.85
|next "Dragon_World_Quest_Emissaries"
step
label quest-70047
accept Icy Prisons##70047 |goto The Azure Span/0 58.08,42.21
|tip You will accept this quest automatically.
step
clicknpc Imprisoned Ottuk##194169+
Free #6# of the Frozen |q 70047/1 |goto 58.08,42.21
|next "Dragon_World_Quest_Emissaries"
step
label quest-71202
accept Mini Manafiend Melee##71202 |goto The Azure Span/0 40.98,59.41
|tip You will accept this quest automatically.
step
clicknpc Arcantus##197417
Defeat Arcantus in a Pet Battle |q 71202/1 |goto 40.98,59.41
|next "Dragon_World_Quest_Emissaries"
step
label quest-74836
accept A New Vocation##74836 |goto The Azure Span/0 19.52,24.61
|tip You will accept this quest automatically.
step
talk Izal Whitemoon##201899
Choose _"Begin pet battle."_
Defeat Izal Whitemoon in a Pet Battle |q 74836/1 |goto 19.52,24.61
|next "Dragon_World_Quest_Emissaries"
step
label quest-70622
accept Resupply Three-Falls##70622 |goto The Azure Span/0 21.41,26.69
|tip You will accept this quest automatically.
stickystart "Collect_Herbs_Berries_and_Flowers_70622"
step
Kill Thickmane enemies around this area
collect 6 Thick Bear Fur##199176 |q 70622/1 |goto 21.41,26.69
step
label "Collect_Herbs_Berries_and_Flowers_70622"
click Blood Berries##377207+
click Dragon Foil##377203+
click Bronze Horn##377199+
|tip They look like various plants on the ground around this area.
Collect Herbs, Berries, and Flowers |q 70622/2 |goto 21.41,26.69
|next "Dragon_World_Quest_Emissaries"
step
label quest-70035
accept Ruriq's River Rapids Ride##70035 |goto The Azure Span/0 44.92,54.10
|tip You will accept this quest automatically.
step
clicknpc The Fallstrider##190067
Ride the Boat |q 70035/1 |goto 44.92,54.10
step
Catch #25# Fish on The Fallstrider |q 70035/2
|tip Use the two net abilites on your vehicle bar to catch fish along the river as you ride.
|tip Use the wide net on larger groups of fish.
|next "Dragon_World_Quest_Emissaries"
step
label quest-72019
accept Seeing through the Enemy: Nezascar##72019
|tip You will accept this quest automatically.
|polish
step
kill Nezascar the Sightless##196535 |q 72019/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-70625
accept Spellforged Creations##70625 |goto The Azure Span/0 48.90,18.84
|tip You will accept this quest automatically.
step
kill Spellforged Brute##184456
Slay the Spellforged Creation |q 70625/1 |goto 48.90,18.84
|next "Dragon_World_Quest_Emissaries"
step
label quest-75280
accept Suffusion Camp: Frostburn##75280 |goto The Azure Span/0 55.02,33.42
|tip You will accept this quest automatically.
stickystart "Collect_Ward_of_Fyrakk"
step
Kill enemies around this area
collect 5 Ward of Igira##203430 |goto 55.02,33.42 |q 75280
step
click Suffusion Crucible
|tip You can find several more nearby.
|tip They appear on your minimap as yellow dots.
Loot the Suffusion Crucible |q 75280/1 |goto 54.78,33.22
|tip Looting the crucible will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
step
Slay the Crucible Guardian |q 75280/2 |goto 54.78,33.22
|tip A random rare mob will attack you.
|tip You may need help with this.
step
label "Collect_Ward_of_Fyrakk"
Kill enemies around this area
|tip More powerful elite enemies will sometimes drop wards.
|tip You can also acquire them looting Suffusion Crucibles.
collect 5 Ward of Fyrakk##203683 |goto 55.02,33.42 |q 75280
step
click Suffusion Mold
Loot the Suffusion Mold |q 75280/3 |goto 55.41,35.19
|tip Looting the mold will cause an elite enemy to spawn and attack you.
|tip Clear the area and get some help to kill them.
step
Defeat the Forgemaster |q 75280/4 |goto 55.41,35.19
|tip An elite (usually Forgemaster Algrin) will spawn.
|tip You may need help with this.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70037
accept Unpowered Tools##70037 |goto The Azure Span/0 47.05,24.55
|tip You will accept this quest automatically.
|polish
step
clicknpc Powered Tool##193792+
|tip They look like small tools laying on the ground around this area.
|tip They appear on your minimap as yellow dots.
Empower #6# Tools |q 70037/1 |goto 47.05,24.55
|next "Dragon_World_Quest_Emissaries"
step
label quest-70439
accept Wild Arcana##70439 |goto The Azure Span/0 51.31,24.87
|tip You will accept this quest automatically.
step
kill Unstable Elemental##194961+
Destroy Unstable Arcana or Kill Players |q 70439/1 |goto 51.31,24.87
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5267
kill Arcane Devourer##194270 |q 69976 |goto The Azure Span/0 53.01,35.63 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5891
kill Blisterhide##197353 |q 73985 |goto The Azure Span/0 14.05,30.96 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5415
kill Gnarls##197354 |q 73996 |goto The Azure Span/0 14.08,37.47 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5206
accept Gruffy##69885 |goto The Azure Span/0 32.68,29.11
|tip You will accept this quest automatically.
|polish
step
kill Gruffy##193251 |q 69885/1 |goto 32.68,29.11
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5210
accept Grumbletrunk##69892 |goto The Azure Span/0 19.23,43.62
|tip You will accept this quest automatically.
|polish
step
kill Grumbletrunk##193269 |q 69892/1 |goto 19.23,43.62
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5893
Enter the cave |goto The Azure Span/0 15.86,33.46 < 10 |walk
kill High Shaman Rotknuckle##197356 |q 69976 |goto The Azure Span/0 16.21,33.64 |future
|tip Inside the cave.
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5440
accept Skag the Thrower##72154 |goto The Azure Span/0 26.49,49.39
|tip You will accept this quest automatically.
|polish
step
kill Skag the Thrower##193149 |q 72154/1 |goto 26.49,49.39
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5894
kill Snarglebone##197344 |q 74032 |goto The Azure Span/0 10.86,32.29 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5200
accept Spellwrought Snowman##73064 |goto The Azure Span/0 55.03,34.05
|tip You will accept this quest automatically.
|polish
step
kill Spellwrought Snowman##193238 |q 73064/1 |goto 55.03,34.05
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5889
accept Shiobhan Waterborn##74462 |goto The Azure Span/0 60.19,68.18
|tip You will accept this quest automatically.
|polish
step
kill Shiobhan Waterborn##201559 |q 74462/1 |goto 60.19,68.18
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5887
accept Graniteclaw##74459 |goto The Azure Span/0 57.91,68.42
|tip You will accept this quest automatically.
|polish
step
kill Graniteclaw##201557 |q 74459/1 |goto 57.91,68.42
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5888
accept Malgain Rockknell##74461 |goto The Azure Span/0 56.00,67.43
|tip You will accept this quest automatically.
|polish
step
kill Malgain Rockknell##201558 |q 74461/1 |goto 56.00,67.43
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5890
accept Waterpots##74460 |goto The Azure Span/0 57.25,64.64
|tip You will accept this quest automatically.
|polish
step
kill Waterpots##201556 |q 74460/1 |goto 57.25,64.64
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5884
accept Motivator Krathos##74456 |goto The Azure Span/0 43.90,30.96
|tip You will accept this quest automatically.
|polish
step
kill Motivator Krathos##201561 |q 74456/1 |goto 43.90,30.96
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5886
accept Unstable Arcanogolem##74455 |goto The Azure Span/0 47.10,25.82
|tip You will accept this quest automatically.
|polish
step
kill Unstable Arcanogolem##201554 |q 74455/1 |goto 47.10,25.82
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5883
accept Grand Artificer Zeerak##74457 |goto The Azure Span/0 47.91,23.78
|tip You will accept this quest automatically.
|polish
step
kill Grand Artificer Zeerak##201553 |q 74457/1 |goto 47.91,23.78
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5885
accept Srivantor##74458 |goto The Azure Span/0 46.89,21.96
|tip You will accept this quest automatically.
|polish
step
kill Srivantor##201555 |q 74458/1 |goto 46.89,21.96
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\The Emerald Dream World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in The Emerald Dream.",
startlevel=60,
worldquestzone={2200},
patch='100200',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-76519
accept All the Children##76519 |goto The Emerald Dream/0 56.76,52.35
|tip You will accept this quest automatically.
|polish
stickystart "Slay_Podlings"
step
click Ephemeral Pear##407288+
|tip They drop on the ground sometimes when enemies die.
|tip They appear on your minimap as yellow dots.
collect 1 Ephemeral Pear##208738 |n
clicknpc Injured Faerie Whelp##209602+
|tip They look like injured faerie dragons on the ground around this area.
Revive #8# Injured Faerie Whelps |q 76519/2 |goto 56.76,52.35
step
label "Slay_Podlings"
Kill Podling enemies around this area
Slay #8# Podlings |q 76519/3 |goto 56.76,52.35
|next "Dragon_World_Quest_Emissaries"
step
label quest-76520
accept A Shared Dream##76520 |goto The Emerald Dream/0 64.70,73.13
|tip You will accept this quest automatically.
step
talk Yvelyn##210365
Tell her _"Let's begin."_
Meet Yvelyn |q 76520/1 |goto 64.70,73.13
stickystart "Kill_Searing_Sun_Crows"
step
kill Avius Flamebeak##210305 |q 76520/3 |goto 64.01,75.35
step
kill Phebis of the Burning Sea##210306 |q 76520/5 |goto 69.22,82.13
step
kill Oxis of Fire##210319 |q 76520/4 |goto 63.08,86.74
step
use Yvelyn's Assistance##208983
Mount Yvelyn |invehicle |goto 64.96,82.70 |q 76520
step
label "Kill_Searing_Sun_Crows"
kill 12 Searing-Sun Crow##210298 |q 76520/2 |goto 60.74,84.17
|tip Use the abilities on your vehicle bar to kill them in the air.
|next "Dragon_World_Quest_Emissaries"
step
label quest-76558
accept Base Control##76558 |goto The Emerald Dream/0 45.65,23.61
|tip You will accept this quest automatically.
step
Kill enemies around this area
Slay the Djaradin Forces |q 76558/1 |goto 45.65,23.61
|next "Dragon_World_Quest_Emissaries"
step
label quest-77156
accept Botanical Redistribution##77156 |goto The Emerald Dream/0 24.48,21.83
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 77156/1 |goto 24.48,21.83
step
click Handhold
Find a Handhold on the Cliff |q 77156/2 |goto 24.35,21.95
step
click Dying Flower+
|tip Dying Flower are found next to handholds on both sides.
|tip Click handholds to move up the wall and excavate artifacts.
|tip Avoid Annoying Proto-Whelps when possible, as they will reduce your grip.
Collect #7# Dying Flowers |q 77156/3 |goto 23.95,21.79
|next "Dragon_World_Quest_Emissaries"
step
label quest-77755
accept Breaking Down the Camp##77755 |goto The Emerald Dream/0 34.99,22.03
|tip You will accept this quest automatically.
step
Kill enemies around this area
click Runestone+
|tip They look like large stones with runes carved in them around this area.
Weaken the Enemy Forces |q 77755/1 |goto 34.99,22.03
|next "Dragon_World_Quest_Emissaries"
step
label quest-77715
accept Bubble Rescue##77715 |goto The Emerald Dream/0 41.90,46.20
|tip You will accept this quest automatically.
step
clicknpc Frightened Bristlebruin##209491+
clicknpc Frightened Gladehart##209492+
clicknpc Frightened Skunk##209496+
clicknpc Frightened Umbraclaw##209494+
Bubble #5# Wildlife |q 77715/1 |goto 41.90,46.20
|next "Dragon_World_Quest_Emissaries"
step
label quest-76991
accept Carpe Diem##76991 |goto The Emerald Dream/0 36.56,61.02
|tip You will accept this quest automatically.
step
clicknpc Ambitious Fish##209244
|tip It swims around in the water.
Find the Ambitious Fish |q 76991/1 |goto 36.56,61.02
step
extraaction Brave Bubble##419272
|tip Don't mount or you will lose the buff.
Scale the First Waterfall |q 76991/2 |goto 38.09,61.11
Find the Ambitious Fish here [36.56,61.02]
|tip Return and click it if you lose the buff.
step
extraaction Brave Bubble##419947
|tip Don't mount or you will lose the buff.
Scale the Second Waterfall |q 76991/3 |goto 39.52,61.07
Find the Ambitious Fish here [36.56,61.02]
|tip Return and click it if you lose the buff.
step
extraaction Brave Bubble##419950
|tip Don't mount or you will lose the buff.
Scale the Third Waterfall |q 76991/4 |goto 40.38,61.10
Find the Ambitious Fish here [36.56,61.02]
|tip Return and click it if you lose the buff.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78370
accept Claws for Concern##78370 |goto The Emerald Dream/0 37.88,67.69
|tip You will accept this quest automatically.
stickystart "Slay_Podlings_or_Umbraclaws"
step
Click Hatchling NPCs
|tip All over the basin, there are small friendly NPCs to rescue.
|tip They appear on your minimap as yellow dots.
Rescue #6# Moonkin Hatchlings |q 78370/1 |goto 37.88,67.69
step
label "Slay_Podlings_or_Umbraclaws"
Kill Podling and Umbraclaw enemies around this area
Slay #12# Podlings or Umbraclaws |q 78370/2 |goto 37.88,67.69
|next "Dragon_World_Quest_Emissaries"
step
label quest-78438
accept Dragonrider Racing - Canopy Concours##78438 |goto The Emerald Dream/0 62.80,88.12
|tip In the tree limb.
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##210784
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##423378 |goto 62.80,88.12 |q 78438
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 62.86,88.04 |q 78438
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78438/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78439
accept Dragonrider Racing - Emerald Amble##78439 |goto The Emerald Dream/0 32.34,48.20
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##210861
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##423562 |goto 32.34,48.20 |q 78439
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 32.29,48.40 |q 78439
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78439/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78437
accept Dragonrider Racing - Shoreline Switchback##78437 |goto The Emerald Dream/0 69.62,52.62
|tip In the tree limb.
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##210497
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##422400 |goto 69.62,52.62 |q 78437
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 69.61,52.52 |q 78437
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78437/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78435
accept Dragonrider Racing - Smoldering Sprint##78435 |goto The Emerald Dream/0 37.18,44.07
|tip In the tree limb.
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##210310
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##422015 |goto 37.18,44.07 |q 78435
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 37.21,44.23 |q 78435
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78435/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78436
accept Dragonrider Racing - Viridescent Venture##78436 |goto The Emerald Dream/0 35.16,55.21
|tip In the tree limb.
|tip You will accept this quest automatically.
|polish
step
talk Bronze Timekeeper##210412
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##422174 |goto 35.16,55.21 |q 78436
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 35.18,55.12 |q 78436
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78436/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-78434
accept Dragonrider Racing - Ysera Invitational##78434 |goto The Emerald Dream/0 59.11,28.81
|tip High up on the floating island..
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##210023
|tip High up on the floating island..
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##421437 |goto 59.11,28.81 |q 78434
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 62.86,88.04 |q 78434
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 78434/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-77765
accept Documenting a Dream##77765 |goto The Emerald Dream/0 38.10,64.23
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Disc
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Disc |q 77765/1 |goto 38.10,64.23
step
Take Pictures of Wildlife |q 77765/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-77761
accept Documenting a Dream##77761 |goto The Emerald Dream/0 58.33,50.59
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Disc
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Disc |q 77761/1 |goto 58.33,50.59
step
Take Pictures of Wildlife |q 77761/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-76549
accept Dreaming in the Dream##76549 |goto The Emerald Dream/0 54.81,25.55
|tip You will accept this quest automatically.
step
talk Shafina##209661
Tell her _"I am ready to help make sleeping potions."_
Speak to Shafina |q 76549/1 |goto 54.81,25.55
step
Brew the Sleeping Potion |q 76549/2 |goto 54.87,25.37
|tip Click the ingredient that matches the portion of the dialogue in chat.
|tip Click Faerie Dust when "faeries" are mentioned.
|tip Click Herb Infused Water when "The base of any drink" is mentioned.
|tip Click Honey Mulled Berries when "goney" is mentioned.
|tip Click Milk of Amirdrassil's Roots when "roots" are mentioned.
|next "Dragon_World_Quest_Emissaries"
step
label quest-76506
accept Dryad Fire Drill##76506 |goto Barrows of Reverie/0 60.34,18.14
|tip You will accept this quest automatically.
stickystart "Rescue_Trapped_Dryads"
step
click Drenching Orb
|tip It looks like a swirling blue orb inside the cave.
|tip You can use the orb 10 times.
|tip Click another orb when it runs out or click the various buckets inside the cave each time you put out a fire.
|tip If the orb is not available, search for another inside the cave.
Acquire the Drenching Orb |q 76506/1 |goto 63.57,71.80
step
extraaction Drenching Orb##414998
|tip Use it on patches of fire inside the cave.
|tip You can use the orb 10 times.
|tip Click another orb when it runs out or click the various buckets inside the cave each time you put out a fire.
Extinguish #18# Flames |q 76506/2 |goto 60.34,18.14
step
label "Rescue_Trapped_Dryads"
clicknpc Trapped Dryad##207660
|tip Inside the cave. |notinsticky
|tip They appear on your minimap as yellow dots.
Rescue #6# Trapped Dryads |q 76506/3 |goto 60.34,18.14
|next "Dragon_World_Quest_Emissaries"
step
label quest-76992
accept Fickle Judgment##76992 |goto The Emerald Dream/0 36.54,68.09
|tip You will accept this quest automatically.
|polish
step
kill Invasive Podling##211781+
use the Q'onzu's Faerie Feather##210227
|tip Use it on the podlings when they are below 50% health.
Transmogrify #8# Podlings |q 76992/1 |goto 36.54,68.09
|next "Dragon_World_Quest_Emissaries"
step
label quest-77756
accept Flight of the Dragons##77756 |goto The Emerald Dream/0 32.28,32.04
|tip You will accept this quest automatically.
step
Strike #15# Proto-Drakes |q 77756/2 |goto 32.28,32.04
|tip Fly through the Proto-Drakes in the air around this area.
|next "Dragon_World_Quest_Emissaries"
step
label quest-76367
accept Hibernation Heroes##76367 |goto The Emerald Dream/0 39.89,54.48
|tip You will accept this quest automatically.
step
kill Aurostor##209574 |q 76367/1 |goto 39.89,54.48
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid standing in front of Aurostor during "Pulverizing Outburst." |grouprole EVERYONE
|tip Avoid "Ruptured Earth" patches follwoing "Pulverizing Outburst" casts. |grouprole EVERYONE
|tip Jump to remove stacks of "Slumberous Roar." |grouprole EVERYONE
|tip "Cranky Tantrum" occurs at 0 energy. |grouprole EVERYONE
|tip During "Cranky Tantrum," run away from rough ground. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip "Slumberous Roar" will require raid healing. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip"Groggy Bash" will deal heavy damage and knock you back a large distance. |grouprole TANK
|next "Dragon_World_Quest_Emissaries"
step
label quest-76526
accept In the Trees##76526 |goto The Emerald Dream/0 64.24,52.71
|tip You will accept this quest automatically.
|polish
step
clicknpc Birchbramble##209448
Ride Birchbramble |q 76526/1 |goto 64.24,52.71
step
Kill enemies around this area
|tip Use the abilities on your vehicle bar to accomplish this.
Repel the Enemy Forces |q 76526/2 |goto 64.24,52.70
|next "Dragon_World_Quest_Emissaries"
step
label quest-76562
accept Moat Maintenance##76562 |goto The Emerald Dream/0 52.05,17.55
|tip You will accept this quest automatically.
stickystart "Kill_Beadeye_Wavestriders"
step
kill 6 Invasive Thornseeker##209523 |q 76562/1 |goto 52.05,17.55
step
label "Kill_Beadeye_Wavestriders"
kill 6 Beadeye Wavestrider##209521 |q 76562/2 |goto 52.05,17.55
|next "Dragon_World_Quest_Emissaries"
step
label quest-77714
accept Nature Sealed##77714 |goto The Emerald Dream/0 30.57,26.53
|tip You will accept this quest automatically.
stickystart "Kill_Portal_Breacher"
step
Kill enemies around the portal
|tip Kill enemies until the portal bar fills up.
Defend Druids While the Portal is Sealed |q 77714/1 |goto 30.57,26.53
step
label "Kill_Portal_Breacher"
kill Portal Breacher##209821 |q 77714/2 |goto 30.57,26.53
|next "Dragon_World_Quest_Emissaries"
step
label quest-77159
accept No Mushroom For Error##77159 |goto The Emerald Dream/0 52.97,30.17
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 77159/1 |goto 52.97,30.17
step
click Handhold
Find a Handhold on the Cliff |q 77159/2 |goto 52.92,30.06
step
click Delicious Mushroom+
|tip They look like large flat mushrooms on the wall next to handholds.
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
|tip Avoid Soporific Spres that lower your grip.
Collect #7# Mushrooms |q 77159/3 |goto 52.92,30.06
|next "Dragon_World_Quest_Emissaries"
step
label quest-76559
accept Our Owllies##76559 |goto The Emerald Dream/0 57.52,25.89
|tip You will accept this quest automatically.
step
talk Kiya Featherpaw##208909
Tell her _"I will help deliver the care packages to the owls."_
Speak to Kiya Featherpaw |q 76559/1 |goto 57.52,25.89
step
click Care Package
|tip On top of the pillar.
Deliver the Care Package |q 76559/2 |goto 55.88,24.07 |count 1
step
click Care Package
|tip On top of the pillar.
Deliver the Care Package |q 76559/2 |goto 55.93,23.13 |count 2
step
click Care Package
Deliver the Care Package |q 76559/2 |goto 56.35,21.34 |count 3
step
click Care Package
|tip On top of the pillar.
Deliver the Care Package |q 76559/2 |goto 57.68,24.41 |count 4
step
click Care Package
Deliver the Care Package |q 76559/2 |goto 59.28,23.71 |count 5
step
click Care Package
Deliver the Care Package |q 76559/2 |goto 61.82,23.48 |count 6
|next "Dragon_World_Quest_Emissaries"
step
label quest-76990
accept Portal Panic##76990 |goto The Emerald Dream/0 35.52,54.59
|tip You will accept this quest automatically.
step
click Flame Portal+
|tip They look like large orange portals on the ground around this area.
Close #8# Flame Portals |q 76990/1 |goto 35.52,54.59
|next "Dragon_World_Quest_Emissaries"
step
label quest-77754
accept Pyromania Problems##77754 |goto The Emerald Dream/0 40.25,26.11
|tip You will accept this quest automatically.
step
kill 10 Incendiary Elemental##210096 |q 77754/1 |goto 40.25,26.11
|next "Dragon_World_Quest_Emissaries"
step
label quest-76522
accept Reverie Of Battle##76522 |goto The Emerald Dream/0 65.44,70.50
|tip You will accept this quest automatically.
stickystart "Slay_the_Enemy_Forces"
step
kill Volgoth The Flamebringer##209129 |q 76522/2 |goto 65.44,70.50
|tip He walks around this area.
step
label "Slay_the_Enemy_Forces"
Kill enemies around this area
Slay #12# Enemy Forces |q 76522/1 |goto 63.06,68.71
|next "Dragon_World_Quest_Emissaries"
step
label quest-76518
accept Root Security##76518 |goto The Emerald Dream/0 62.35,53.02
|tip You will accept this quest automatically.
|polish
stickystart "Slay_Rootsear_Druids"
step
use the Purifying Tangle##208447
|tip Use it on clumps of Amirdrassil's Roots on the ground around this area.
|tip You can also use it on Roottender enemies.
Purify #10# Amirdrassil's Roots or Roottenders |q 76518/2 |goto 62.35,53.02
|tip He walks around this area.
step
label "Slay_Rootsear_Druids"
Kill enemies around this area
Slay #6# Rootsear Druids |q 76518/3 |goto 62.35,53.02
|next "Dragon_World_Quest_Emissaries"
step
label quest-78215
accept Rooted in Danger##78215 |goto The Emerald Dream/0 47.63,45.14
|tip You will accept this quest automatically.
|polish
step
Kill enemies around this area
|tip This is a PvP objective.
Kill Creatures or Players |q 78215/1 |goto 47.63,45.14
|next "Dragon_World_Quest_Emissaries"
step
label quest-76988
accept Sylvan Slalom##76988 |goto The Emerald Dream/0 34.03,54.41
|tip You will accept this quest automatically.
step
click Peculiar Plank
|tip Make sure you are facing level with the water or you will dive and lose the buff.
Examine the Peculiar Plank |q 76988/1 |goto 34.03,54.41
step
Chase #8# Faerie Dragons |q 76988/2 |goto 33.71,56.99
|tip With the buff, ski across the water and run through Faerie Dragons surrounded by blue light.
|tip Do this quickly before the buff wears off.
|tip It will be extended slightly for each dragon collected.
|tip Return to the plank if you need a new buff.
You can find the plank at [34.03,54.41]
|next "Dragon_World_Quest_Emissaries"
step
label quest-77757
accept Terror in Haven##77757 |goto The Emerald Dream/0 46.32,34.65
|tip You will accept this quest automatically.
step
Kill Primalist enemies around this area
Slay #15# Primalists |q 77757/1 |goto 46.32,34.65
|next "Dragon_World_Quest_Emissaries"
step
label quest-76989
accept Trashing the Camp##76989 |goto The Emerald Dream/0 36.95,46.58
|tip You will accept this quest automatically.
step
Kill enemies around this area
Disrupt the Smoldering Copse |q 76989/1 |goto 36.95,46.58
|next "Dragon_World_Quest_Emissaries"
step
label quest-76551
accept Treasure Diving##76551 |goto The Emerald Dream/0 51.15,32.12
|tip You will accept this quest automatically.
step
click Loose Rubble+
|tip They look like piles of rocks on the bottom of the water.
|tip Click the Dragon's Breath bubbles under the water to pull yourself to them quickly.
Move #6# Handfuls of Rubble |q 76551/1 |goto 51.15,32.12
step
talk Enaru Silverbark##209856
|tip Up on the ledge above the water.
Select _"<Hand over Handfuls of Rubble.>"_
Speak to the Ancient of Lore |q 76551/3 |goto 50.91,28.66
|next "Dragon_World_Quest_Emissaries"
step
label quest-76550
accept True Sight##76550 |goto The Emerald Dream/0 60.37,38.49
|tip You will accept this quest automatically.
|polish
step
talk Albon the Watcher##209876
Tell her _"Show me how True Sight works."_
Speak to Albon the Watcher |q 76550/1 |goto 60.37,38.49
step
use the True Sight##208841
|tip Use this to maintain the buff in order to see the beasts.
|tip They look like normal enemies that glow outlined in red.
kill 8 Cinderpollen Beast##211370 |q 76550/2 |goto 54.87,25.37
|next "Dragon_World_Quest_Emissaries"
step
label quest-76993
accept Turtle Power##76993 |goto The Emerald Dream/0 42.35,76.99
|tip You will accept this quest automatically.
step
kill Cantankerous Turtle##210195+
|tip Weaken them below 50% but don't finish them off.
use Slumberfruit##211302
|tip Use it on the weakened turtles.
Mollify #8# Cantankerous Turtles |q 76993/1 |goto 42.35,76.99
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5807
accept Greedy Gessie##77982 |goto The Emerald Dream/0 48.18,48.77
|tip You will accept this quest automatically.
|polish
step
Gather and Deposit Ingredients for the Picnic |q 77982/1 |goto 48.18,48.77
|tip Click the various ingredients around the picnic site to collect them.
|tip Return them to the pots and click the ones with arrows to deposit them.
|tip You can carry one of each type of ingredient at the same time.
|tip Gressie will come out and attack when you finish the picnic.
step
kill Amalgamation of Dreams##209915 |q 77982/2 |goto 48.18,48.77
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5816
accept Envoy of Winter##77878 |goto The Emerald Dream/0 34.73,63.18
|tip You will accept this quest automatically.
|polish
step
click Shiversnap Blossom##408054+
|tip Click Silvernap Blossoms around the pond and return them to the Moonwell.
extraaction Envoy's Tribute##421658
|tip Throw them in the Moonwell.
Gather Tributes for the Envoy of Winter |q 77878/1 |goto 34.73,63.18
step
kill Envoy of Winter##209929 |q 77878/2 |goto 34.73,63.18
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5835
accept Firebrand Fystia##78015 |goto The Emerald Dream/0 30.13,20.75
|tip You will accept this quest automatically.
|polish
step
Kill enemies around the portal
Eliminate the Primalists to Draw Their Leader Out |q 78015/1 |goto 29.86,20.76
step
kill Firebrand Fystia##209893 |q 78015/2 |goto 30.13,20.75
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5969-5817
accept Greedy Gessie##77982 |goto The Emerald Dream/0 54.08,41.22
|tip You will accept this quest automatically.
|polish
step
Gather and Deposit Ingredients for the Picnic |q 77982/1 |goto 54.08,41.22
|tip Click the various ingredients around the picnic site to collect them.
|tip Return them to the pots and click the ones with arrows to deposit them.
|tip You can carry one of each type of ingredient at the same time.
|tip Gressie will come out and attack when you finish the picnic.
step
kill Greedy Gessie##209936 |q 77982/2 |goto 54.08,41.22
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5786
accept Nuoberon, the Wild Dream of a Child##77570 |goto The Emerald Dream/0 61.61,72.23
|tip You will accept this quest automatically.
|polish
step
Kill enemies around this area
|tip Kill and click the various creatures around the pond until the Dream Fun bar fills up.
extraaction Throw Food##420253
|tip Throw food you pick up to Zinzula.
Participate in Nuo's Dream to Summon a Massive Creature |q 77570/1 |goto 61.61,72.23
step
kill Nuoberon##209113 |q 77570/2 |goto 61.75,71.89
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5814
accept Moruud##77867 |goto The Emerald Dream/0 64.14,84.17
|tip You will accept this quest automatically.
|polish
step
kill Reefbreaker Moruud##209898 |q 77867/1 |goto 64.14,84.17
|tip The debuff from "Tidal Crash" stacks and deals damage over time.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\The Forbidden Reach World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in The Forbidden Reach.",
condition_valid=function() return completedallq(75050,74769,73157) end,
condition_valid_msg="You must complete the \"An Eclectic Accord,\" \"Stemming the Irontide,\" and \"Wings of Mercy,\" quests in the Forbidden Reach leveling guide to unlock world quests.",
startlevel=60,
worldquestzone={2151,2150,2102,2154,2100,2101,2109,2110,2026,2107,2118},
patch='100007',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-73148
accept Combustible Vegetation##73148 |goto The Forbidden Reach/5 13.09,53.71
|tip You will accept this quest automatically.
|polish
step
clicknpc Wildfire##200688
|tip This NPC gains power for each of the 7 nearby Storm-Touched mobs.
|tip Defeating these mobs makes Wildfire easier to defeat.
|tip You can track them on your minimap with Track Pets.
Defeat Wildfire in a Pet Battle |q 73148/1 |goto 13.09,53.71
|next "Dragon_World_Quest_Emissaries"
step
label quest-73146
accept Cutting Wind##73146 |goto The Forbidden Reach/5 18.34,13.24
|tip You will accept this quest automatically.
|polish
step
clicknpc Vortex##200685
|tip This NPC gains power for each of the 7 nearby Storm-Touched Swoglets.
|tip Defeating these mobs makes Wildfire easier to defeat.
|tip You can track them on your minimap with Track Pets.
Defeat Vortex in a Pet Battle |q 73146/1 |goto 18.34,13.24
|next "Dragon_World_Quest_Emissaries"
step
label quest-73080
accept Dragonrider Racing - Aerie Chasm Cruise##73080 |goto The Forbidden Reach/5 63.08,51.95
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200236
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398113 |goto 63.08,51.95 |q 73080
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 63.37,51.80 |q 73080
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73080/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73083
accept Dragonrider Racing - Caldera Coaster##73083 |goto The Forbidden Reach/5 41.36,14.58
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200316
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398228 |goto 41.36,14.58 |q 73083
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 41.34,14.77 |q 73083
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73083/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73084
accept Dragonrider Racing - Forbidden Reach Rush##73084 |goto The Forbidden Reach/5 49.42,60.06
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200417
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398326 |goto 49.42,60.06 |q 73084
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 49.42,59.88 |q 73084
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73084/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73079
accept Dragonrider Racing - Morqut Ascent##73079 |goto The Forbidden Reach/5 31.32,65.75
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200212
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398054 |goto 31.32,65.75 |q 73079
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 31.49,65.94 |q 73079
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73079/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73082
accept Dragonrider Racing - Southern Reach Route##73082 |goto The Forbidden Reach/5 63.64,84.05
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200247
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398123 |goto 63.64,84.05 |q 73082
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 63.61,84.32 |q 73082
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73082/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73078
accept Dragonrider Racing - Stormsunder Crater Circuit##73078 |goto The Forbidden Reach/5 76.13,65.63
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##200183
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##398027 |goto 76.13,65.63 |q 73078
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 76.33,65.78 |q 73078
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 73078/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73149
accept Flood Warning##73149 |goto The Forbidden Reach/5 89.29,60.39
|tip You will accept this quest automatically.
|polish
step
clicknpc Flow##200697
Defeat Flow in a Pet Battle |q 73149/1 |goto 89.29,60.39
|next "Dragon_World_Quest_Emissaries"
step
label quest-73147
accept Shifting Ground##73147 |goto The Forbidden Reach/5 67.30,12.26
|tip You will accept this quest automatically.
|polish
step
clicknpc Tremblor##197447
Defeat Tremblor in a Pet Battle |q 73147/1 |goto 67.30,12.26
|next "Dragon_World_Quest_Emissaries"
step
label quest-78931
accept Technoscrying: The Mysteries of Dragonskull Island##78931 |goto Dragonskull Island/0 51.96,45.37
|tip You will accept this quest automatically.
|polish
step
use the Technoscryers##202247
|tip Use the "Scrying Mode" ability on your action bar to locate a treasure nearby.
|tip Watch the bar until it fills up and the X is completely red, then find the treasure near you.
|tip You will sometimes see a light trail indicating a nearby relic.
Click Treasures
|tip Inside the cave.
|tip Make sure the light cone is pointing at the relic to make it clickable.
Recover the Items |q 78931/1 |goto 51.96,45.37
|next "Dragon_World_Quest_Emissaries"
step
label quest-75257
accept The War Creche##75257 |goto The War Creche/0 61.04,45.79
|tip You will accept this quest automatically.
step
Kill enemies around this area
|tip Inside the building.
clicknpc Injured Winguard##203464+
|tip They look like kneeling Dracthyr inside the building.
Subdue the War Creche |q 75257/1 |goto 61.04,45.79
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Ohn'ahran Plains World Quests",{
author="support@zygorguides.com",
description="\nThis guide will assist you in completing world quests in Ohn'ahran Plains.",
condition_suggested=function() return completedq(66221) end,
startlevel=60,
worldquestzone={2023},
patch='100001',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-70659
accept Cataloging the Ohn'ahran Plains##70659 |goto Ohn'ahran Plains/0 73.05,84.37
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##185085
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70659/1 |goto 73.05,84.37
step
Take Pictures of Wildlife |q 70659/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70079
accept Cataloging the Ohn'ahran Plains##70079 |goto Ohn'ahran Plains/0 51.90,57.02
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##185085
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70079/1 |goto 51.90,57.02
step
Take Pictures of Wildlife |q 70079/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70623
accept Clearing the Skies##70623 |goto Ohn'ahran Plains/0 69.24,42.77
|tip You will accept this quest automatically.
step
Kill #50# Insects |q 70623/1 |goto 69.24,42.77
|tip Fly through insects in the air.
|tip Avoid purple orbs that stall your flight.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70422
accept Dragonrider Racing - Emerald Garden Ascent##70422 |goto Ohn'ahran Plains/0 25.71,55.08
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191247
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##375477 |goto 25.71,55.08 |q 70422
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 25.54,54.96 |q 70422
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70422/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70420
accept Dragonrider Racing - Fen Flythrough##70420 |goto Ohn'ahran Plains/0 86.26,35.82
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191121
|tip In the top of the tower.
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##375261 |goto 86.26,35.82 |q 70420
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 86.21,35.83 |q 70420
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70420/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70423
accept Dragonrider Racing - Maruukai Dash##70423 |goto Ohn'ahran Plains/0 59.93,35.55
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191422
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##375810 |goto 59.93,35.55 |q 70423
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 60.05,35.67 |q 70423
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Course |q 70423/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70424
accept Dragonrider Racing - Mirror of the Sky Dash##70424 |goto Ohn'ahran Plains/0 47.48,70.64
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191511
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##376062 |goto 47.48,70.64 |q 70424
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 47.41,70.63 |q 70424
|tip This will take about 5 seconds.
|tip Fly quickly through all of the rings and return to the starting point.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip Green orbs will restore your vigor.
|tip Start with the lower rings in a circle, then climb and work on the upper ones.
step
Complete the Race |q 70424/1
|tip Fly quickly through all of the rings and return to the starting point.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip Green orbs will restore your vigor.
|tip Start with the lower rings in a circle, then climb and work on the upper ones.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70421
accept Dragonrider Racing - Ravine River Run##70421 |goto Ohn'ahran Plains/0 80.89,72.20
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##191165
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##375356 |goto 80.89,72.20 |q 70421
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 80.92,72.13 |q 70421
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70421/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70712
accept Dragonrider Racing - River Rapids Route##70712 |goto Ohn'ahran Plains/0 43.74,66.78
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##196092
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##387548 |goto 43.74,66.78 |q 70712
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 43.89,66.61 |q 70712
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70712/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70419
accept Dragonrider Racing - Sundapple Copse Circuit##70419 |goto Ohn'ahran Plains/0 63.74,30.52
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190928
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374825 |goto 63.74,30.52 |q 70419
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 63.82,30.47 |q 70419
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70419/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-71206
accept Eye of the Stormling##71206 |goto Ohn'ahran Plains/0 24.41,42.36
|tip You will accept this quest automatically.
step
clicknpc Stormamu##197447
Defeat Stormamu in a Pet Battle |q 71206/1 |goto 24.41,42.36
|next "Dragon_World_Quest_Emissaries"
step
label quest-69994
accept The Field of Ferocity Redux: Elemental Revenge Round!##69994
|tip You will accept this quest automatically.
|polish
step
kill Veshrak of the North##188713 |q 69994/1
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69991
accept The Field of Ferocity Redux: Foe from the Volcano!##69991
|tip You will accept this quest automatically.
|polish
step
kill Ceeqa the Peacetaker##188708 |q 69991/1
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69990
accept The Field of Ferocity Redux: Lord of Decay!##69990
|tip You will accept this quest automatically.
|polish
step
kill Nightrot##188707 |q 69990/1
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69993
accept The Field of Ferocity Redux: Lost in the Dream!##69993
|tip You will accept this quest automatically.
|polish
stickystart "Kill_Taresh_69993"
step
kill Sherath##188710 |q 69993/1
|tip This enemy is elite and may require a group.
step
label "Kill_Taresh_69993"
kill Taresh##188711 |q 69993/2
|tip This enemy is elite and may require a group. |notinsticky
|next "Dragon_World_Quest_Emissaries"
step
label quest-69995
accept The Field of Ferocity Redux: Master of the Hunt!##69995
|tip You will accept this quest automatically.
|polish
step
kill Huntmaster Amaa##188715 |q 69995/1
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69987
accept The Field of Ferocity Redux: Terror of the Swamp!##69987
|tip You will accept this quest automatically.
|polish
step
kill Maneet##188704 |q 69987/1
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-72028
accept Fishing Frenzy!##72028 |goto Ohn'ahran Plains/0 81.21,78.47
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Spawning Threshers in the water along the shore.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Spawning Thresher##194342+
|tip They will die when you pull them onto the shore.
collect 12 Fresh Fish Steak##198350 |q 72028/1 |goto 81.21,78.47
|next "Dragon_World_Quest_Emissaries"
step
label quest-69988
accept Flashy Rocks##69988 |goto Ohn'ahran Plains/0 54.10,52.26
|tip You will accept this quest automatically.
step
Kill Thunderspine enemies around this area
collect 10 Lightning Infused Rock##198138 |q 69988/1 |goto 54.10,52.26
|next "Dragon_World_Quest_Emissaries"
step
label quest-70146
accept Highlands Rebuttal##70146 |goto Ohn'ahran Plains/0 85.51,53.74
|tip You will accept this quest automatically.
step
Kill enemies around this area
Eliminate the Nokhud and Primalist Forces |q 70146/1 |goto 85.51,53.74
|next "Dragon_World_Quest_Emissaries"
step
label quest-70149
accept Hope for the Highlands##70149 |goto Ohn'ahran Plains/0 85.77,53.38
|tip You will accept this quest automatically.
step
clicknpc Displaced Nestling##193379+
|tip They look like small birds on the ground around this area.
click Ohn'aran Egg+
|tip They look like purple eggs in nests on the ground around this area.
Gather Displaced Nestlings and Ohn'aran Eggs |q 70149/1 |goto 85.77,53.38
|next "Dragon_World_Quest_Emissaries"
step
label quest-70634
accept Lashed Out##70634 |goto Ohn'ahran Plains/0 29.64,51.74
|tip You will accept this quest automatically.
step
clicknpc Novice Emerald Gardener##195826+
Kill Lasher enemies around this area
Cull Lashers and Rescue Novice Emerald Gardeners |q 70634/1 |goto 29.64,51.74
|next "Dragon_World_Quest_Emissaries"
step
label quest-70655
accept Leaves from the Vine##70655 |goto Ohn'ahran Plains/0 82.81,31.80
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70655/1 |goto 82.81,31.80
step
click Handhold
Find a Handhold on the Cliff |q 70655/2 |goto 82.84,31.95
step
clicknpc Evergreen Vine##196042+
|tip Evergreen Vine are found next to handholds.
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
|tip Drop down onto the ledge in front of the waterfall up top to continue climbing up the opposite side.
|tip Avoid slippery rocks which will cause you to lose grip.
Collect #6# Evergreen Vine Samples |q 70655/3 |goto 82.90,32.15
|next "Dragon_World_Quest_Emissaries"
step
label quest-70549
accept Low Hanging Fruit##70549 |goto Ohn'ahran Plains/0 62.89,57.66
|tip You will accept this quest automatically.
step
extraaction Simple Shot##388556
clicknpc Honey Plum##195601+
|tip They look like golden fruit hanging from the trees around this area.
kill Gorging Stagbeetle##195709+
|tip They will drop Honey Plums upon death.
Collect #25# Honey Plums |q 70549/2 |goto 62.89,57.66
|next "Dragon_World_Quest_Emissaries"
step
label quest-74838
accept Lyver##74838 |goto Ohn'ahran Plains/0 73.38,67.99
|tip You will accept this quest automatically.
step
clicknpc Lyver##201858
Defeat Lyver in a Pet Battle |q 74838/1 |goto 73.38,67.99
|next "Dragon_World_Quest_Emissaries"
step
label quest-70067
accept A Message to the Nokhud##70067 |goto Ohn'ahran Plains/0 35.00,38.81
|tip You will accept this quest automatically.
step
Kill Nokhud enemies around this area
Disrupt the Nokhud Forces |q 70067/1 |goto 35.00,38.81
|next "Dragon_World_Quest_Emissaries"
step
label quest-70780
accept Ohn'ahran Banners##70780 |goto Ohn'ahran Plains/0 83.67,37.55
|tip You will accept this quest automatically.
step
Plant #10# Banners |q 70780/1 |goto 83.67,37.55
|tip Use your dragonriding abilities to fly through 10 golden rings.
|tip You can find them on cliffs and ledges around this area.
|tip They appear on your minimap as yellow dots.
|next "Dragon_World_Quest_Emissaries"
step
label quest-74837
accept Paws of Thunder##74837 |goto Ohn'ahran Plains/0 36.16,52.56
|tip You will accept this quest automatically.
step
talk Vikshi Thunderpaw##201878
Choose _"Begin pet battle."_
Defeat Vikshi Thunderpaw in a Pet Battle |q 74837/1 |goto 36.16,52.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-70074
accept Plunder the Sundered##70074 |goto Ohn'ahran Plains/0 44.01,64.13
|tip You will accept this quest automatically.
stickystart "Slay_Mind_Controlled_Gorlocs_70074"
step
click Dragonscale Expedition Supplies##379273+
|tip They look like broken crates on the ground around this area.
collect 6 Dragonscale Expedition Supplies##198448 |q 70074/1 |goto 44.01,64.13
step
label "Slay_Mind_Controlled_Gorlocs_70074"
Kill enemies around this area
Slay #8# Mind Controlled Gorlocs |q 70074/2 |goto 44.01,64.13
|next "Dragon_World_Quest_Emissaries"
step
label quest-70646
accept Pressure Valve##70646 |goto Ohn'ahran Plains/0 78.88,77.56
|tip You will accept this quest automatically.
step
Kill enemies around this area
extraaction Water Pressure!##387163
|tip Use the Water Pressure! ability that appears to do extra damage Sulfuric Ragers.
|tip Killing a Hissing Springsoul will grant you the Water Pressure! ability.
extraaction Steam Pressure!##387008
|tip Use the Steam Pressure! ability that appears to do extra damage Hissing Springsouls.
|tip Killing Sulfuric Rager will grant you the Steam Pressure! ability.
Relieve the Elemental Pressure |q 70646/1 |goto 78.88,77.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-70209
accept Quacks and Attacks##70209 |goto Ohn'ahran Plains/0 43.74,33.70
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
Kill enemy players around this area
kill Feather Ruffling Duck##194909+
Subdue Ducks or Kill Players |q 70209/1 |goto 43.74,33.70
|next "Dragon_World_Quest_Emissaries"
step
label quest-69929
accept Strunraan##69929 |goto Ohn'ahran Plains/0 83.30,77.53
|tip You will accept this quest automatically.
step
kill Strunraan##193534 |q 69929/1 |goto 83.30,77.53
_EVERYONE:_ |grouprole EVERYONE
|tip "Stunraan's Tempest" will increase attack and cast speed significantly, but you should avoid standing near other players with it. |grouprole EVERYONE
|tip "Thunder Vortex" and "Arc Expulsion" will deal damage and knock you back. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip Targets of "Overcharge" will need heavy healing. |grouprole HEALER
|tip Anyone near Overcharged players will take even more damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Move out of "Shock Water" to avoid heavy damage. |grouprole TANK
|next "Dragon_World_Quest_Emissaries"
step
label quest-74501
accept Suffusion Camp: Cinderwind##74501 |goto Ohn'ahran Plains/0 74.12,71.71
|tip You will accept this quest automatically.
stickystart "Collect_Ward_of_Igira"
stickystart "Collect_Ward_of_Fyrakk"
step
label "Collect_Ward_of_Igira"
Kill enemies around this area
collect 5 Ward of Igira##203430 |goto 74.12,71.71 |q 74501
step
click Infusing Hammer
|tip You can find several more nearby.
|tip They appear on your minimap as yellow dots.
Loot the Suffusion Crucible |q 74501/1 |goto 73.88,71.20
|tip Looting the crucible will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
step
Slay the Crucible Guardian |q 74501/2 |goto 73.88,71.20
|tip A random rare mob will attack you.
|tip You may need help with this.
step
label "Collect_Ward_of_Fyrakk"
Kill enemies around this area
|tip More powerful elite enemies will sometimes drop wards.
|tip You can also acquire them looting Suffusion Crucibles.
collect 5 Ward of Fyrakk##203683 |goto 74.12,71.71 |q 74501
step
click Suffusion Mold
Loot the Suffusion Mold |q 74501/3 |goto 74.27,72.28
|tip Looting the mold will cause an elite enemy to spawn and attack you.
|tip Clear the area and get some help to kill them.
step
Defeat the Forgemaster |q 74501/4 |goto 74.24,72.15
|tip An elite (usually Forgemaster Kraglin) will spawn.
|tip You may need help with this.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70649
accept Swab Swog##70649 |goto Ohn'ahran Plains/0 79.72,75.48
|tip You will accept this quest automatically.
step
clicknpc Brackish Hornswog##191604+
clicknpc Gargantuan Hornswog##191606+
|tip Kill them if they attack you.
Collect #12# Swab Sogs |q 70649/1 |goto 79.72,75.48
|next "Dragon_World_Quest_Emissaries"
step
label quest-70652
accept Take One Down, Pass It Around##70652 |goto Ohn'ahran Plains/0 25.18,32.37
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70652/1 |goto 25.18,32.37
step
click Handhold
Find a Handhold on the Cliff |q 70652/2 |goto 25.24,32.41
step
click Nokhud Spear##381190+
|tip Nokhud Spears are found next to handholds.
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
Pry #8# Nokhud Spears from the Cliff Face |q 70652/3 |goto 24.67,33.84
|next "Dragon_World_Quest_Emissaries"
step
label quest-71140
accept Two and Two Together##71140 |goto Ohn'ahran Plains/0 61.96,41.59
|tip You will accept this quest automatically.
step
talk Bakhushek##197102
Choose _"Begin pet battle."_
Defeat Bakhushek in a Pet Battle |q 71140/1 |goto 61.96,41.59
|next "Dragon_World_Quest_Emissaries"
step
label quest-70176
accept Web Victims##70176 |goto Ohn'ahran Plains/0 43.49,47.92
|tip You will accept this quest automatically.
step
Enter the cave |goto 43.60,48.06 < 7 |walk
clicknpc Webbed Tuskarr##194453+
|tip They look like large coocoons inside and outside the cave.
Free #6# Victims |q 70176/1 |goto
|next "Dragon_World_Quest_Emissaries"
step
label quest-72058
accept What Hoof We Here: Tarolekk##72058 |goto Ohn'ahran Plains/0 34.99,38.67
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
kill Tarolekk, the Stomper##197650 |q 72058/1 |goto 34.99,38.67
|next "Dragon_World_Quest_Emissaries"
step
label quest-70638
accept Wind Breaker##70638 |goto Ohn'ahran Plains/0 74.07,71.46
|tip You will accept this quest automatically.
stickystart "Kill_Windfiends_70638"
step
kill 4 Unleashed Storm##195846 |q 70638/1 |goto 74.07,71.46
step
label "Kill_Windfiends_70638"
kill 10 Windfiend##195844 |q 70638/2 |goto 74.07,71.46
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5142
click Nokhud Warspear##377900
Retrieve the Nokhud Warspear |q 67049 |goto Ohn'ahran Plains/0 32.43,38.16 |future
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5572
accept Huntmaster Yrgena##74466 |goto Ohn'ahran Plains/0 33.84,38.72
|tip You will accept this quest automatically.
|polish
step
kill Huntmaster Yrgena##201538 |q 74466/1 |goto 33.84,38.72
|tip Yrenga has a hound add that must be killed as well.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5570
accept Lurgan##74464 |goto Ohn'ahran Plains/0 34.82,34.54
|tip You will accept this quest automatically.
|polish
step
kill Lurgan##201540 |q 74464/1 |goto 34.82,34.54
|tip "Bloodletting" leave a bleed that deals damage over time.
|tip Interrupt "Fury of the Nokhud" whenever possible.
|tip Avoid standing in front if "Trample" is cast.
|tip Run out of the blue circle after "Thundering Stomp" casts.
|tip "Thunder Kick" will knock you back a short distance.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5183
accept Mikrin of the Raging Winds##69857 |goto Ohn'ahran Plains/0 63.01,79.96
|tip You will accept this quest automatically.
|polish
step
kill Mikrin of the Raging Winds##193173 |q 69857/1 |goto 63.01,79.96
|tip Kill the add summoned by "Summon Rising Tempest."
|tip "Call of the Wind" summons an elemental that needs to be killed.
|tip Interrupt "Charged Gust" when possible.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5378
accept Researcher Sneakwing##70698 |goto Ohn'ahran Plains/0 37.00,53.80
|tip You will accept this quest automatically.
|polish
step
kill Researcher Sneakwing##196010 |q 70698/1 |goto 37.00,53.80
|tip "Glaciate" deals frost damage over 10 seconds and slows movement speed.
|tip Run out of the area after "Stonefall" casts.
|tip Run out of the blue circle after "Thundering Stomp" casts.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5205
accept Ronsak the Decimator##69878 |goto Ohn'ahran Plains/0 43.40,55.60
|tip You will accept this quest automatically.
|polish
step
kill Ronsak the Decimator##193227 |q 69878/1 |goto 43.40,55.60
|tip Interrupt "Fury of the Nokhud" whenever possible.
|tip Avoid standing in front if "Trample" is cast.
|tip Run out of the blue circle after "Thundering Stomp" casts.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5571
accept Stormcaller Narkena##74465 |goto Ohn'ahran Plains/0 32.61,41.84
|tip You will accept this quest automatically.
|polish
step
kill Stormcaller Narkena##201539 |q 74465/1 |goto 32.61,41.84
|tip Interrupt whenever possible.
|tip Each spell deals moderate nature damage.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5573
accept Bloodbeak the Ravenous##74467 |goto Ohn'ahran Plains/0 36.80,38.00
|tip You will accept this quest automatically.
|polish
step
kill Bloodbeak the Ravenous##201535 |q 74467/1 |goto 36.80,38.00
|tip Avoid standing in front during "Talon Rip."
|tip Avoid standing in front during "Wing Blast."
|tip Interrupt "Disgorge" on cooldown.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5182
accept Fulgurb##69856 |goto Ohn'ahran Plains/0 75.18,46.51
|tip You will accept this quest automatically.
|polish
step
kill Fulgurb##193170 |q 69856/1 |goto 75.18,46.51
|tip "Cruch Armor" reduces armor for 12 seconds.
|tip "Massive Charge" will target someone and knock them down, dealing physical damage.
|tip Stop casting when "Shrieking Bleat" finishes casting.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5569
accept Groffnar##74463 |goto Ohn'ahran Plains/0 35.80,40.40
|tip You will accept this quest automatically.
|polish
step
kill Groffnar##201537 |q 74463/1 |goto 35.80,40.40
|tip Interrupt "Viscious Howl" on cooldown.
|tip Interrupt "Rabid Bite" when possible.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5195
accept Malsegan##69871 |goto Ohn'ahran Plains/0 71.69,45.85
|tip You will accept this quest automatically.
|polish
step
kill Malsegan##193212 |q 69871/1 |goto 71.69,45.85
|tip "Impaling Horn" will leave a brief bleed debuff.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5199
accept Oshigol##69877 |goto Ohn'ahran Plains/0 61.21,29.50
|tip You will accept this quest automatically.
|polish
step
kill Oshigol##193235 |q 69877/1 |goto 61.21,29.50
|tip Avoid standing in front during "Rock Slide."
|tip Run away from Oshigol during "Tectonic Slam."
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5168
accept Steamgill##69667 |goto Ohn'ahran Plains/0 53.62,72.81
|tip You will accept this quest automatically.
|polish
step
kill Steamgill##193123 |q 69667/1 |goto 53.62,72.81
|tip AoE adds summoned by "Call for Family."
|tip "Venomous Chomp" deals nature damage over 15 seconds.
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5242
accept Kain Firebrand##69970 |goto Ohn'ahran Plains/0 34.8,40.8
|tip You will accept this quest automatically.
|polish
step
kill Kain Firebrand##193675 |q 69970/1 |goto 34.8,40.8
|tip Kain will randomly "Shield Charge" someone.
|tip Avoid areas targeted on the ground after "Shattering Flame."
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5078
accept Irontree##66356 |goto Ohn'ahran Plains/0 80.51,38.69
|tip You will accept this quest automatically.
|polish
step
kill Irontree##188124 |q 66356/1 |goto 80.51,38.69
|tip Run out of swirling areas on the ground after "Shale Eruption."
|tip Stay away from the area targeted for "Boulder Toss."
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5365
kill Makhra the Ashtouched##195409 |q 69970 |goto Ohn'ahran Plains/0 32.82,38.17 |future
|tip Interrupt "Burning Down" on cooldown.
|tip Avoid standing in front during "Blazing Talons."
|tip This enemy is elite and may require a group.
|polish
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Thaldraszus World Quests",{
author="support@zygorguides.com",
description="\nThis guide will assist you in completing world quests in Thaldraszus.",
condition_suggested=function() return completedq(66221) end,
startlevel=60,
worldquestzone={2025,2085},
patch='100001',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-70160
accept Alchemical Thesis Defense##70160 |goto Thaldraszus/0 62.94,36.69
|tip You will accept this quest automatically.
step
click Morally Questionable Sample
Sample the Alchemical Concoction |q 70160/1 |goto 62.94,36.69
step
kill 5 Evil You##194313 |q 70160/2 |goto 62.94,36.69
|tip Run around and step on them.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70654
accept Are You Kitten Me?##70654 |goto Thaldraszus/0 59.79,76.89
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70654/1 |goto 59.79,76.89
step
click Handhold
Find a Handhold on the Cliff |q 70654/2 |goto 59.82,76.89
step
click Time-Lost Kitten+
|tip They look like small kittens in bubbles next to handholds on the wall..
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
|tip Avoid floating orbs that lower your grip.
Release #8# Time-Lost Kittens from Time Bubbles |q 70654/3 |goto 60.11,76.76
|next "Dragon_World_Quest_Emissaries"
step
label quest-70442
accept Banquet Battle##70442 |goto Thaldraszus/0 58.11,42.72
|tip You will accept this quest automatically.
step
click Banquet Table
Flip the Table |q 70442/1 |goto 58.11,42.72
step
Splatter #10# Students |q 70442/2 |goto 58.31,42.81
|tip Use the "Throw Conjured Boar Candy" ability on your vehicle bar.
step
Splatter Unshielded Professor Intinosa |q 70442/3 |goto 58.52,43.12
|tip Use the "Throw Conjured Boar Candy" ability on your vehicle bar.
|tip Don't throw it when her shield bubble is up.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70369
accept Blasting the Past##70369 |goto Thaldraszus/0 57.50,83.24
|tip You will accept this quest automatically.
stickystart "Slay_Time-Lost_Champions_70369"
step
Kill Time-Lost enemies around this area |kill Time-Lost Geomancer##187265, Time-Lost Sunseeker##187239, Time-Lost Bladewing##187232, Time-Lost Briarback##187264, Time-Lost Mudskipper##187540
|tip You can use a Time-Lost Scroll around the area to gain a temporary ability.
|tip The scrolls appear as yellow dots on your minimap.
Slay #14# Time-Lost Enemies |q 70369/2 |goto 57.50,83.24
step
label "Slay_Time-Lost_Champions_70369"
kill Time-Lost Destroyer##187244+
kill Time-Lost Chieftain##187266+
Slay #2# Time-Lost Champions |q 70369/3 |goto 57.50,83.24
step
kill Qu'ruk the Time-Lost##195322 |q 70369/4 |goto 57.19,85.16
|next "Dragon_World_Quest_Emissaries"
step
label quest-71225
accept Blown Through Wind: Rhuzast##71225 |goto Thaldraszus/0 54.22,39.36
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
kill Rhuzast the Tempest##197409 |q 71225/1 |goto 54.22,39.36
|next "Dragon_World_Quest_Emissaries"
step
label quest-70073
accept Bluefeather Banners##70073 |goto Thaldraszus/0 45.83,70.72
|tip You will accept this quest automatically.
step
Plant #10# Banners |q 70073/1 |goto 45.83,70.72
|tip Use your dragonriding abilities to fly through 10 golden rings.
|tip You can find them on cliffs and ledges around this area.
|tip They appear on your minimap as yellow dots.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70699
accept Cataloging Thaldraszus##70699 |goto Thaldraszus/0 51.17,42.12
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Balloon##195994
Ride the Cataloger's Balloon |q 70699/1 |goto 51.17,42.12
step
Take Pictures of Wildlife |q 70699/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70110
accept Cataloging Thaldraszus##70110 |goto Thaldraszus/0 38.42,68.99
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##185085
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70110/1 |goto 38.42,68.99
step
Take Pictures of Wildlife |q 70110/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-71160
accept Depth Charge##71160 |goto Thaldraszus/0 49.54,58.77
|tip You will accept this quest automatically.
step
Kill enemies around this area
use the Deepwater Lure##200561
|tip Use it on the corpses of elementals.
Charge the Deepwater Lure |q 71160/1 |goto 49.54,58.77
|next "Dragon_World_Quest_Emissaries"
step
label quest-70434
accept Dragonrider Racing - Academy Ascent##70434 |goto Thaldraszus/0 60.29,41.59
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##193951
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##382717 |goto 60.29,41.59 |q 70434
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 60.32,41.71 |q 70434
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70434/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70433
accept Dragonrider Racing - Cliffside Circuit##70433 |goto Thaldraszus/0 37.65,48.93
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##193911
|tip Inside the tower.
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##382632 |goto 37.65,48.93 |q 70433
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 37.71,48.87 |q 70433
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70433/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70436
accept Dragonrider Racing - Caverns Criss-Cross##70436 |goto Thaldraszus/0 58.06,33.62
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##194372
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##383596 |goto 58.06,33.62 |q 70436
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 57.95,33.58 |q 70436
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70436/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70431
accept Dragonrider Racing - Flowing Forest Flight##70431 |goto Thaldraszus/0 57.77,75.01
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##192555
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##377692 |goto 57.77,75.01 |q 70431
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 57.69,75.03 |q 70431
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70431/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70435
accept Dragonrider Racing - Garden Gallivant##70435 |goto Thaldraszus/0 39.50,76.19
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##194348
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##383473 |goto 39.50,76.19 |q 70435
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 39.37,76.22 |q 70435
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70435/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70432
accept Dragonrider Racing - Passage Pathway##70432 |goto Thaldraszus/0 57.24,66.90
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##193651
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##381978 |goto 57.24,66.90 |q 70432
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 57.30,66.95 |q 70432
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70432/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69949
accept Extermination##69949 |goto Thaldraszus/0 59.95,30.36
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
Kill enemies around this area
extraaction Pest Fogger##383079
|tip Throw it on enemies or players to damage them and slow them down.
Exterminate Pests or Kill Players |q 69949/1 |goto 59.95,30.36
|next "Dragon_World_Quest_Emissaries"
step
label quest-70224
accept Fetid Threat##70224 |goto Thaldraszus/0 56.17,28.98
|tip You will accept this quest automatically.
step
click Weapon Rack##380511+
Kill enemies around this area
Disrupt the Encampment |q 70224/1 |goto 56.17,28.98
|next "Dragon_World_Quest_Emissaries"
step
label quest-72029
accept Fishing Frenzy!##72029 |goto Thaldraszus/0 56.93,65.22
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Spawning Threshers in the water along the shore.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Spawning Thresher##194342+
|tip They will die when you pull them onto the shore.
collect 12 Fresh Fish Steak##198350 |q 72029/1 |goto 56.93,65.22
|next "Dragon_World_Quest_Emissaries"
step
label quest-71181
accept Forgotten Grotto Relics##71181 |goto Thaldraszus/0 57.31,35.19
|tip You will accept this quest automatically.
step
Enter the cave |goto 57.31,35.19 < 15 |walk
Click Titan objects around this area
|tip Click the various small Titan pieces on the ground inside the cave.
|tip Digging spots have a chance to have Titan Relics or enemies hidden inside.
Collect Titan Relics |q 71181/1 |goto 58.10,36.98
|next "Dragon_World_Quest_Emissaries"
step
label quest-70602
accept History Lesson: War of the Shifting Sands##70602 |goto Thaldraszus/0 58.23,35.53
|tip At the top of the tower.
|tip You will accept this quest automatically.
stickystart "Slay_Minions_of_the_Past_70602"
step
Kill enemies that appear in waves
|tip Killing the larger mobs will cause another wave to spawn shortly after.
Engage #3# Chapters of History |q 70602/1 |goto 58.23,35.53
step
label "Slay_Minions_of_the_Past_70602"
kill Silithid Guardian##195652+
Slay #10# Minions of the Past |q 70602/2 |goto 58.23,35.53
|next "Dragon_World_Quest_Emissaries"
step
label quest-71205
accept Hydro Tuskarr##71205 |goto Thaldraszus/0 54.60,38.31
|tip You will accept this quest automatically.
step
click Iskaara Watergliders
extraaction Iskaara Watergliders##390876
|tip This will allow you to skate across the water.
|tip This method tends to be faster.
click Iskaara Waterwalkers
extraaction Iskaara Waterwalkers##396729
|tip This will allow you to walk normally across the water.
Choose Watergliders from the Instructor |q 71205/1 |goto 54.60,38.31
step
extraaction Throw Net##390883
|tip Toss the not onto the fish in the water.
|tip Use your gliders or walkers if they wear off.
'|extraaction Iskaara Watergliders##390876
'|extraaction Iskaara Waterwalkers##396729
Catch #15# Eclipse Sturgeon |q 71205/2 |goto 54.12,40.04
|next "Dragon_World_Quest_Emissaries"
step
label quest-69928
click Portal to the Primalist Future |goto Thaldraszus/0 59.83,82.24
Enter the Primalist Tomorrow |goto Primalist Tomorrow/0 61.85,51.47 < 1000 |c |noway |q 69928 |future
step
accept Liskanoth##69928 |goto 54.65,69.37
|tip You will accept this quest automatically.
step
kill Liskanoth##193533 |q 69928/1 |goto 54.65,69.37
_EVERYONE:_ |grouprole EVERYONE
|tip Following "Glacial Storm," patches of frozen ground will be left behind that reduce movement speed if you enter them. |grouprole EVERYONE
|tip Avoid standing in front of Liskanoth when "Deep Freeze" occurs.
_DAMAGE:_ |grouprole DAMAGE
|tip Kill Binding Ice quickly to free rooted players. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Deep Freeze" will likely deal heavy damage to at least a few raid members. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Chilling Breath" deals heavy damage and leaves a movement debuff on you. |grouprole TANK
|next "Dragon_World_Quest_Emissaries"
step
label quest-70656
accept Not Mushroom For Error##70656 |goto Thaldraszus/0 57.02,34.61
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70656/1 |goto 57.02,34.61
step
click Handhold
Find a Handhold on the Cliff |q 70656/2 |goto 56.88,34.58
step
click Dragonwing Mushroom+
|tip They look like large flat mushrooms on the wall next to handholds.
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
|tip Avoid Annoying Proto-Whelps that lower your grip.
Collect #8# Mushrooms |q 70656/3 |goto 57.08,34.51
|next "Dragon_World_Quest_Emissaries"
step
label quest-71166
accept The Oldest Dragonfly##71166 |goto Thaldraszus/0 39.46,73.54
|tip You will accept this quest automatically.
step
clicknpc Enyobon##197336
Defeat Enyobon in a Pet Battle |q 71166/1 |goto 39.46,73.54
|next "Dragon_World_Quest_Emissaries"
step
label quest-71156
accept Rebel Concerns##71156 |goto Thaldraszus/0 45.00,51.23
|tip You will accept this quest automatically.
step
click Weapon Rack+
click Rebel Cage+
|tip Click them if you collect Scalewatch Cage Keys.
Kill enemies around this area
Disrupt the Encampment |q 71156/1 |goto 45.00,51.23
|next "Dragon_World_Quest_Emissaries"
step
label quest-70066
accept Reclaiming the Hold##70066 |goto Thaldraszus/0 58.65,58.58
|tip You will accept this quest automatically.
step
Kill enemies around this area
Eliminate the Forces |q 70066/1 |goto 58.65,58.58
|next "Dragon_World_Quest_Emissaries"
step
label quest-74794
accept Right Twice a Day##74794 |goto Thaldraszus/0 60.64,59.74
|tip You will accept this quest automatically.
|tip On top of the platform.
step
clicknpc Malfunctioning Matrix##202452
|tip On top of the platform.
Defeat the Malfunctioning Matrix in a Pet Battle |q 74794/1 |goto 60.64,59.74
|next "Dragon_World_Quest_Emissaries"
step
label quest-70934
accept Salamanther's Embrace##70934 |goto Thaldraszus/0 54.57,39.25
|tip You will accept this quest automatically.
step
kill Glistening Salamanther##195074+
extraaction Direct Apprentice##393261
|tip Use it on the corpses to have your apprentice skin them.
Collect #12# Glistening Salamanther Hides |q 70934/1 |goto 54.57,39.25
|next "Dragon_World_Quest_Emissaries"
step
label quest-71164
accept Stolen Bandages##71164 |goto Thaldraszus/0 45.09,58.95
|tip You will accept this quest automatically.
step
Enter the cave |goto 45.09,58.95 < 10 |walk
click Medical Supplies##382043+
|tip They look like small medical crates inside the cave.
Collect #8# Medical Supplies |q 71164/1 |goto 44.23,57.85
|next "Dragon_World_Quest_Emissaries"
step
label quest-74378
click Portal to the Primalist Future |goto Thaldraszus/0 59.83,82.24
Enter the Primalist Tomorrow |goto Primalist Tomorrow/0 61.85,51.47 < 1000 |c |noway |q 74378 |future
step
Complete "The Storm's Fury" Event |q 74378 |future |goto 46.81,37.39
|tip Clear the four portals on the map.
|tip Kill primalist enemies around each one until the portal shuts down.
|tip These enemies are elite and may require a group.
|tip Stand next to an orange Heat Source on the ground when you begin taking cold damage.
|tip When the portals are shut down, kill the Primalist monster with your group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70661
accept Supplies on High##70661 |goto Thaldraszus/0 44.59,50.15
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70661/1 |goto 44.59,50.15
step
click Handhold
Find a Handhold on the Cliff |q 70661/2 |goto 44.59,50.29
step
clicknpc Sundered Supply Cache##196098+
|tip They look like large wooden crates on the wall next to handholds.
|tip Click handholds to move up the wall and excavate caches from the wall by clicking them.
|tip Avoid Annoying Proto-Whelps that lower your grip.
Collect #8# Sundered Supply Caches |q 70661/3 |goto 44.45,51.54
|next "Dragon_World_Quest_Emissaries"
step
label quest-71154
accept Talon Toss: Shooting 101##71154 |goto Thaldraszus/0 60.91,27.23
|tip High up on the top platforms.
|tip You will accept this quest automatically.
step
extraaction Throw##385265
|tip Use your dragonriding abilities to pick up glowing balls floating above the platforms..
|tip Then throw them through a ring while facing it.
Score #12# Goals |q 71154/1 |goto 60.91,27.23
|next "Dragon_World_Quest_Emissaries"
step
label quest-70111
accept Temple Treasures##70111 |goto Thaldraszus/0 49.62,58.93
|tip You will accept this quest automatically.
step
click Titan Temple Relic##379239+
collect 8 Titan Temple Relic##198443 |q 70111/1 |goto 49.62,58.93
|next "Dragon_World_Quest_Emissaries"
step
label quest-74792
accept They're Full of Stars!##74792 |goto Thaldraszus/0 55.97,40.53
|tip You will accept this quest automatically.
|tip On top of the platform.
step
talk Stargazer Zenoth##202458
|tip On top of the platform.
Tell her _"Begin pet battle."_
Defeat Stargazer Zenoth in a Pet Battle |q 74792/1 |goto 55.97,40.53
|next "Dragon_World_Quest_Emissaries"
step
label quest-70057
accept Thieving Tarasek##70057 |goto Thaldraszus/0 56.82,67.56
|tip You will accept this quest automatically.
step
Kill Embertooth enemies around this area
|tip Inside and outside the cave.
collect 10 Stolen Dragonscale Supplies##198349 |q 70057/1 |goto 56.82,67.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-70072
accept Time-Lost and Found##70072 |goto Thaldraszus/0 57.96,81.43
|tip You will accept this quest automatically.
stickystart "Collect_Time-Lost_Possessions"
step
click Time-Lost Relic##380483+
|tip They look like scattered supplies and broken crates on the ground around this area.
collect 8 Time-Lost Relic##198564 |q 70072/1 |goto 57.96,81.43
step
label "Collect_Time-Lost_Possessions"
Kill enemies around this area
collect 8 Time-Lost Possession##198597 |q 70072/2 |goto 57.96,81.43
|next "Dragon_World_Quest_Emissaries"
step
label quest-71180
accept You Have to Start Somewhere##71180 |goto Thaldraszus/0 56.27,49.24
|tip You will accept this quest automatically.
step
talk Setimothes##197350
Choose _"Begin pet battle."_
Defeat Setimothes in a Pet Battle |q 71180/1 |goto 56.27,49.24
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5881
accept Overseer Stonetongue##74448 |goto Thaldraszus/0 59.55,56.65
|tip Inside Tyrhold.
|tip You will accept this quest automatically.
|polish
step
kill Overseer Stonetongue##201552 |q 74448/1 |goto 59.55,56.65
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5880
accept Overloading Defense Matrix##74449 |goto Thaldraszus/0 59.77,62.27
|tip You will accept this quest automatically.
|polish
step
kill Overloading Defense Matrix##201550 |q 74449/1 |goto 59.77,62.27
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5879
accept Morlash##74450 |goto Thaldraszus/0 62.14,60.04
|tip You will accept this quest automatically.
|polish
step
kill Morlash##201549 |q 74450/1 |goto 62.14,60.04
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5248
accept Phenran##69976 |goto Thaldraszus/0 59.80,61.00
|tip You will accept this quest automatically.
|polish
step
kill Phenran##193688 |q 69976/1 |goto 59.80,61.00
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5431
accept Treasure-Mad Trambladd##70947 |goto Thaldraszus/0 35.02,70.01
|tip You will accept this quest automatically.
|polish
step
kill Treasure-Mad Trambladd##193146 |q 70947/1 |goto 35.02,70.01
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5236
accept Ancient Protector##69963 |goto Thaldraszus/0 59.07,58.74
|tip You will accept this quest automatically.
|polish
step
kill Ancient Protector##193664 |q 69963/1 |goto 59.07,58.74
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5193
accept Broodweaver Araznae##69868 |goto Thaldraszus/0 61.50,73.60
|tip You will accept this quest automatically.
|polish
step
kill Broodweaver Araznae##193220 |q 69868/1 |goto 61.50,73.60
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5235
accept Corrupted Proto-Dragon##69962 |goto Thaldraszus/0 44.88,69.10
|tip You will accept this quest automatically.
|polish
step
kill Corrupted Proto-Dragon##193658 |q 69962/1 |goto 44.88,69.10
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5237
accept Craggravated Elemental##69964 |goto Thaldraszus/0 45.45,85.18
|tip You will accept this quest automatically.
|polish
step
kill Craggravated Elemental##193663 |q 69964/1 |goto 45.45,85.18
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5198
accept Eldoren the Reborn##69875 |goto Thaldraszus/0 47.67,51.15
|tip You will accept this quest automatically.
|polish
step
kill Eldoren the Reborn##193234 |q 69875/1 |goto 47.67,51.15
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5204
accept Matriarch Remalla##69883 |goto Thaldraszus/0 52.89,59.03
|tip You will accept this quest automatically.
|polish
step
kill Matriarch Remalla##193246 |q 69883/1 |goto 52.89,59.03
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5192
accept Phleep##69866 |goto Thaldraszus/0 57.21,84.20
|tip You will accept this quest automatically.
|polish
step
kill Phleep##193210 |q 69866/1 |goto 57.21,84.20
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5201
accept Riverwalker Tamopo##69880 |goto Thaldraszus/0 40.08,70.14
|tip You will accept this quest automatically.
|polish
step
kill Riverwalker Tamopo##193240 |q 69880/1 |goto 40.08,70.14
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5238
accept Rokmur##69966 |goto Thaldraszus/0 50.00,51.80
|tip You will accept this quest automatically.
|polish
step
kill Rokmur##193666 |q 69966/1 |goto 50.00,51.80
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5185
Enter the cave |goto Thaldraszus/0 38.50,76.40 < 10 |walk
accept Sandana the Tempest##69859 |goto 37.60,77.80
|tip You will accept this quest automatically.
|polish
step
kill Sandana the Tempest##193176 |q 69859/1 |goto 37.60,77.80
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5207
accept Tempestrian##69886 |goto Thaldraszus/0 47.20,78.95
|tip You will accept this quest automatically.
|polish
step
kill Tempestrian##193258 |q 69886/1 |goto 47.20,78.95
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5567
accept Shardwing##74453 |goto Thaldraszus/0 48.42,17.22
|tip You will accept this quest automatically.
|polish
step
kill Shardwing##201562 |q 74453/1 |goto 48.42,17.22
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5565
accept Tikarr Frostclaw##74451 |goto Thaldraszus/0 61.81,31.42
|tip You will accept this quest automatically.
|polish
step
kill Tikarr Frostclaw##201542 |q 74451/1 |goto 61.81,31.42
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5566
accept Avalantus##74452 |goto Thaldraszus/0 53.53,65.21
|tip You will accept this quest automatically.
|polish
step
kill Avalantus##201543 |q 74452/1 |goto 53.53,65.21
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5568
accept Shapemaster Za'lani##74454 |goto Thaldraszus/0 46.88,42.48
|tip You will accept this quest automatically.
|polish
step
kill Shapemaster Za'lani##201545 |q 74454/1 |goto 46.88,42.48
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\The Waking Shores World Quests",{
author="support@zygorguides.com",
description="\nThis guide will assist you in completing world quests in The Waking Shores.",
condition_suggested=function() return completedq(66221) end,
startlevel=60,
worldquestzone={2022},
patch='100001',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label quest-74841
accept Adinakon##74841 |goto The Waking Shores/0 51.88,72.33
|tip You will accept this quest automatically.
step
clicknpc Adinakon##201849
Defeat Adinakon in a Pet Battle |q 74841/1 |goto 51.88,72.33
|next "Dragon_World_Quest_Emissaries"
step
label quest-66419
accept Allegiance To One##66419 |goto The Waking Shores/0 24.38,55.69
|tip On the balcony.
|tip You will accept this quest automatically.
step
talk Sabellian##185894
_Or_
talk Wrathion##187495
Tell them _"I swear to support your current efforts._"
|tip On the balcony.
|tip You will unlock an additional quest to gain reputation with whichever one you choose.
Show Support to Wrathion or Sabellian |q 66419/1 |goto 24.38,55.69
|next "Dragon_World_Quest_Emissaries"
step
label quest-70636
accept Ancient Protodragons##70636 |goto The Waking Shores/0 39.87,85.40
|tip You will accept this quest automatically.
step
kill Grod the Ancient##196385 |goto 43.59,83.04
kill Frizkon the Ancient##196380 |goto 39.43,85.10
kill Khakad the Ancient##196379 |goto 40.93,80.50
kill Mellg the Ancient##196381 |goto 43.53,85.96
kill Quilmo the Ancient##196386 |goto 40.63,92.91
kill Thornmu the Ancient##196382 |goto 36.52,87.89
|tip Various named ancient protodrakes can be found nesting in high areas.
|tip They appear on your minimap as yellow dots.
|tip Look for them up on cliffs.
|tip These enemies are elite and may require a group.
Slay #3# Ancient Protodragons |q 70636/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-69930
accept Basrikron##69930 |goto The Waking Shores/0 55.09,77.77
|tip You will accept this quest automatically.
step
kill Basrikron##193535 |q 69930/1 |goto 55.09,77.77
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid standing near Fractured Spires. |grouprole EVERYONE
|tip Fractured Spires and elementals will explode during Sundering Crash causing damage and a knockback. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill elementals quickly when they spawn. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip The tank will take heavy damage and increased damage after each Shale Breath. |grouprole HEALER
|tip All players will need healing after Sundering Crash. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Swap threat before the debuff stacks from Shale Breath become too much for you to manage. |grouprole TANK
|next "Dragon_World_Quest_Emissaries"
step
label quest-66902
accept Bee-Gone##66902 |goto The Waking Shores/0 56.68,65.04
|tip You will accept this quest automatically.
stickystart "Bag_Bothersome_Bees_66902"
step
click Overgrown Shrub##377098+
|tip They look like large bushes around the tree.
kill Over-Pollinated Lasher##196495+
|tip They will attack you after clicking a shrub.
Prune #5# Overgrown Shrubs |q 66902/1 |goto 56.68,65.04
step
label "Bag_Bothersome_Bees_66902"
use the Smoke Diffuser##193064
clicknpc Bothersome Bee##190543+
|tip Use it on Bothersome Bees.
|tip They look like bees flying above the ground around this area.
|tip It will take a few seconds for them to be captured, so don't kill them.
|tip Click them when they become friendly to bag them.
Bag #8# Bothersome Bees |q 66902/2 |goto 56.68,65.04
step
extraaction Bee Free!##374670
Relocate the Bothersome Bees |q 66902/3 |goto 56.99,70.95
|next "Dragon_World_Quest_Emissaries"
step
label quest-67010
accept Boiling Over##67010 |goto The Waking Shores/0 48.70,45.91
|tip You will accept this quest automatically.
stickystart "Slay_Elementals_67010"
step
kill Zhurtan the Riverboiler##188687 |q 67010/1 |goto 48.60,45.97
|tip This enemy is elite and may require a group.
step
label "Slay_Elementals_67010"
Kill enemies around this area
Slay #8# Elementals |q 67010/2 |goto 48.70,45.91
|next "Dragon_World_Quest_Emissaries"
step
label quest-66934
accept Break the Breaker##66934 |goto The Waking Shores/0 66.28,26.18
|tip You will accept this quest automatically.
stickystart "Destroy_Qalashi_Supplies_66934"
stickystart "Kill_Qalashi_Drakeflayers_66934"
step
Enter the tent |goto 66.73,25.72 < 10 |walk
kill Gragza the Dragon-Breaker##191507 |q 66934/1 |goto 66.75,25.69
|tip Downstairs inside the tent.
step
label "Destroy_Qalashi_Supplies_66934"
click Qalashi Supplies##381128+
|tip They look like groups of pots on the ground around this area.
Destroy #5# Qalashi Supplies |q 66934/3 |goto 66.28,26.18
step
label "Kill_Qalashi_Drakeflayers_66934"
kill 4 Qalashi Drakeflayer##192341 |q 66934/2 |goto 66.28,26.18
|next "Dragon_World_Quest_Emissaries"
step
label quest-66070
accept Brightblade's Bones##66070 |goto The Waking Shores/0 22.87,95.14
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 66070/1 |goto 22.87,95.14
step
click Handhold
Find a Handhold on the Cliff |q 66070/2 |goto 22.88,95.37
step
collect Lost Banana##191951 |n
|tip Look for the lost banana along th way to Lil' Poshy.
|tip It's typically hidden gehind vines on the wall.
talk Lil' Poshy##188912
|tip Make your way up the left side.
|tip Avoid monkeys that throw bannanas at you which loosen your grip.
|tip Wait a moment at the last handhold before a ledge and when your grip expires you'll hop up.
|tip Drop down onto the branch from the rock with two handholds behind it.
|tip The waterfall will also lower your grip while you are in it.
Rescue Cymre's Pet Marmoset |q 66070/4 |goto 22.54,95.43
step
click Intact Dragon Bone+
|tip They look like large dragon bones on the wall next to handholds.
Excavate #6# Dragon Bones in the Cliff Face |q 66070/3 |goto 22.55,95.47
|next "Dragon_World_Quest_Emissaries"
step
label quest-70782
accept Canopy Banners##70782 |goto The Waking Shores/0 23.14,88.54
|tip You will accept this quest automatically.
step
Plant #10# Banners |q 70782/1 |goto 23.14,88.54
|tip Use your dragonriding abilities to fly through 10 golden rings.
|tip You can find them on cliffs and ledges around this area.
|tip They appear on your minimap as yellow dots.
|next "Dragon_World_Quest_Emissaries"
step
label quest-67062
accept Cascading Conflict##67062 |goto The Waking Shores/0 48.16,52.54
|tip You will accept this quest automatically.
step
Kill enemies around this area
Slay the Primalist Forces |q 67062/1 |goto 48.16,52.54
|next "Dragon_World_Quest_Emissaries"
step
label quest-70075
accept Cataloging the Waking Shores##70075 |goto The Waking Shores/0 64.36,59.22
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##195713
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70075/1 |goto 64.36,59.22
step
Take Pictures of Wildlife |q 70075/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70632
accept Cataloging the Waking Shores##70632 |goto The Waking Shores/0 49.98,68.51
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##195713
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 70632/1 |goto 49.98,68.51
step
Take Pictures of Wildlife |q 70632/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70502
accept Clearing the Skies##70502 |goto The Waking Shores/0 55.15,57.40
|tip You will accept this quest automatically.
step
Slay #50# Insects |q 70502/1 |goto 55.15,57.40
|tip Fly through insects in the air.
|tip Avoid purple orbs that stall your flight.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70415
accept Dragonrider Racing - Apex Canopy River Run##70415 |goto The Waking Shores/0 23.26,84.30
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190551
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374244 |goto 23.26,84.30 |q 70415
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 23.25,84.22 |q 70415
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70415/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70413
accept Dragonrider Racing - Emberflow Flight##70413 |goto The Waking Shores/0 41.97,67.30
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190519
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374182 |goto 41.97,67.30 |q 70413
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 41.93,67.43 |q 70413
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70413/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70410
accept Dragonrider Racing - Flashfrost Flyover##70410 |goto The Waking Shores/0 62.77,74.00
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190326
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##373851 |goto 62.77,74.00 |q 70410
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 62.84,74.19 |q 70410
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70410/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70416
accept Dragonrider Racing - Uktulut Coaster##70416 |goto The Waking Shores/0 55.45,41.13
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190667
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374412 |goto 55.45,41.13 |q 70416
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 55.38,41.04 |q 70416
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70416/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70418
accept Dragonrider Racing - Wild Preserve Circuit##70418 |goto The Waking Shores/0 42.59,94.45
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190503
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374143 |goto 42.59,94.45 |q 70418
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 42.44,94.68 |q 70418
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70418/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70412
accept Dragonrider Racing - Wild Preserve Slalom##70412 |goto The Waking Shores/0 47.01,85.58
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190473
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374088 |goto 47.01,85.58 |q 70412
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 46.94,85.78 |q 70412
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70412/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70382
accept Dragonrider Racing - Ruby Lifeshrine Loop##70382 |goto The Waking Shores/0 63.32,70.91
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190123
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##373495 |goto 63.32,70.91 |q 70382
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 63.31,70.78 |q 70382
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70382/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70417
accept Dragonrider Racing - Wingrest Roundabout##70417 |goto The Waking Shores/0 73.19,33.93
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##190753
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##374592 |goto 73.19,33.93 |q 70417
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 73.29,33.98 |q 70417
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 70417/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-67113
accept Excavation Emergency##67113
|tip You will accept this quest automatically.
|polish
stickystart "Slay_Earth_Elementals_67113"
step
click Dragon Artifact##377941+
Collect #5# Dragon Artifacts |q 67113/2
step
label "Slay_Earth_Elementals_67113"
Kill enemies around this area
'|kill Displaced Earth##187393, Unsettled Rubble##189795, Earth Elementals##190976, Expelled Rubble##193950
Slay #15# Earth Elementals |q 67113/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-69916
Enter the cave |goto The Waking Shores/0 38.72,94.36 < 15 |walk
accept Famous Frogs##69916 |goto The Waking Shores/0 38.26,95.66
|tip You will accept this quest automatically.
step
use the Captivating Cap##197928
|tip Attack Hornswog enemies and lower their health to 50% before using the item on them.
Make #5# Hornswogs Famous |q 69916/1 |goto 38.26,95.66
|next "Dragon_World_Quest_Emissaries"
step
label quest-69938
accept Fishing Frenzy!##69938 |goto The Waking Shores/0 66.56,74.10
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Spawning Threshers in the water along the shore.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Spawning Thresher##194342+
|tip They will die when you pull them onto the shore.
collect 8 Fresh Fish Steak##198350 |q 69938/1 |goto 66.56,74.10
You can find more around [68.81,72.88]
|next "Dragon_World_Quest_Emissaries"
step
label quest-72030
accept Fishing Frenzy!##72030 |goto The Waking Shores/0 34.01,64.83
|tip You will accept this quest automatically.
step
extraaction Harpoon##377081
|tip Use it on Icy Blue Crabs in the water.
|tip They appear on your minimap as yellow dots.
extraaction Pull Hard##374599
|tip After Harpooning them, use the Pull Hard ability to pull them onto the shore.
kill Icy Blue Crab##197862+
|tip They will die when you pull them onto the shore.
|tip You can also just kill them.
collect 8 Cooked Caviar##200854 |q 72030/1 |goto 34.01,64.83
|next "Dragon_World_Quest_Emissaries"
step
label quest-67014
accept Gorlocs No More-locs##67014 |goto The Waking Shores/0 80.13,42.79
|tip You will accept this quest automatically.
stickystart "Slay_Gorlocs_67014"
step
kill Whirglgurgl##188860 |q 67014/2 |goto 79.79,39.82
step
kill Sogglmoggl##188859 |q 67014/3 |goto 80.06,44.03
step
label "Slay_Gorlocs_67014"
Kill enemies around this area
'|kill Soggymaw Wavebringer##187263, Windyfin Skybasher##187431, Windyfin Squallstalker##187433, Soggymaw Seabasher##187320, Windyfin Windbringer##187432, Soggymaw Crabtrapper##187971
Slay #15# Gorlocs |q 67014/1 |goto 80.13,42.79
|next "Dragon_World_Quest_Emissaries"
step
label quest-66989
accept Helpful Harvest##66989 |goto The Waking Shores/0 59.84,64.78
|tip You will accept this quest automatically.
step
Kill Bloom enemies around this area
'|kill Overzealous Bloom##191099, Lively Bloom##193670
Click objects around this area
|tip Click Fragrant Dragonflowers, Ripened Dragonfruits, and Lush Seed Pods.
use the Trusty Dragonkin Rake##193826
clicknpc Ripened Dragonfruit##191296+
|tip Use it to knock down Dragonfruits.
Tend the Garden |q 66989/1 |goto 59.84,64.78
|next "Dragon_World_Quest_Emissaries"
step
label quest-67026
accept Hold the Shrine##67026 |goto The Waking Shores/0 56.50,80.68
|tip You will accept this quest automatically.
step
Kill enemies around this area
Help hold back the Primalists |q 67026/1 |goto 56.50,80.68
|next "Dragon_World_Quest_Emissaries"
step
label quest-67009
accept Hornswog Hogwash##67009 |goto The Waking Shores/0 66.64,64.43
|tip You will accept this quest automatically.
stickystart "Discipline Hornswogs_67009"
step
use the Jar of Fireflies##193918
|tip Use it on Bullied Frogs around this area.
clicknpc Pacified Frog##190981+
|tip Click them quickly while they are distracted.
Collect #12# Pacified Frogs |q 67009/1 |goto 66.64,64.43
step
label "Discipline Hornswogs_67009"
Kill Hornswog enemies around this area
'|kill Rowdy Hornswog##190980, Bossy Hornswog##190998
Discipline #8# Hornswogs |q 67009/2 |goto 66.64,64.43
|next "Dragon_World_Quest_Emissaries"
step
label quest-67005
accept How to Train a Proto-Drake##67005 |goto The Waking Shores/0 39.74,91.49
|tip You will accept this quest automatically.
step
use the Proto-Drake Wrangler Rope##194818
Wrangle Proto-Drages or Slay Players |q 67005/1 |goto 39.74,91.49
|next "Dragon_World_Quest_Emissaries"
step
label quest-66133
accept Keys Of Loyalty##66133 |goto The Waking Shores/0 28.47,59.14
|tip You will accept this quest automatically.
stickystart "Collect_Key_Fragments_66133"
step
Kill enemies around this area
collect 3 Key Framing##193201 |q 66133 |goto 28.47,59.14
step
label "Collect_Key_Fragments_66133"
Kill enemies around this area
collect 30 Key Fragments##191251 |q 66133 |goto 28.47,59.14
step
use the Key Framing##193201
collect 1 Greater Obsidian Key##191255 |q 66133/1 |goto 28.47,59.14
step
talk Wrathion##187284
accept Greater Obsidian Key##72337 |goto 26.85,62.52
|only if haveq(66133) and not completedq(66133)
step
Deliver the Greater Obsidian Key to Wrathion |q 66133/2 |goto 26.85,62.52
|next "Dragon_World_Quest_Emissaries"
step
label quest-66805
accept Keys Of Loyalty##66805 |goto The Waking Shores/0 28.47,59.14
|tip You will accept this quest automatically.
stickystart "Collect_Key_Fragments_66805"
step
Kill enemies around this area
collect 3 Key Framing##193201 |q 66805 |goto 28.47,59.14
step
label "Collect_Key_Fragments_66805"
Kill enemies around this area
collect 30 Key Fragments##191251 |q 66805 |goto 28.47,59.14
step
use the Key Framing##193201
collect 1 Greater Obsidian Key##191255 |q 66805/1 |goto 28.47,59.14
step
talk Sabellian##187447
accept Greater Obsidian Key##72338 |goto 27.71,56.59
|only if haveq(66805) and not completedq(66805)
step
Deliver the Greater Obsidian Key to Sabellian |q 66805/2 |goto 27.71,56.59
|next "Dragon_World_Quest_Emissaries"
step
label quest-64768
accept Lightsprocket's Artifact Hunt##64768 |goto The Waking Shores/0 48.70,36.97
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 64768/1 |goto 48.70,36.97
step
click Handhold
Find a Handhold on the Cliff |q 64768/2 |goto 48.67,36.20
step
click Artifact Fragment+
|tip Artifact Fragments are found next to handholds on the wall.
|tip Click handholds to move up the wall and excavate artifacts.
|tip Move quickly past monkeys that throw banananas which cause you to lose grip.
Excavate #6# Artifact Fragments in the Cliff Face |q 64768/3 |goto 48.51,36.29
|next "Dragon_World_Quest_Emissaries"
step
label quest-70150
accept Many Whelps, Handle It##70150 |goto The Waking Shores/0 61.07,71.44
|tip You will accept this quest automatically.
step
clicknpc Emerald Whelpling##194301
clicknpc Ruby Whelpling##193979
clicknpc Azure Whelpling##194304
|tip On the balcony overlooking the lifeshrine.
Choose a Whelpling |q 70150/1 |goto 61.07,71.44
stickystart "Kill_Agitated_Weedling_70150"
stickystart "Kill_Intrusive_Pupstinger_70150"
step
kill Relentless Gust##194159 |q 70150/4 |goto 61.37,71.85
|tip Use the abilities on your action bar to kill enemies.
step
label "Kill_Agitated_Weedling_70150"
kill 12 Agitated Weedling##193994 |q 70150/2 |goto 61.37,71.85
|tip Use the abilities on your action bar to kill enemies.
step
label "Kill_Intrusive_Pupstinger_70150"
kill 6 Intrusive Pupstinger##194142 |q 70150/3 |goto 61.37,71.85
|tip Use the abilities on your action bar to kill enemies.
step
Return to the Balcony |outvehicle |script VehicleExit()
|tip Use the "Exit" button on your vehicle bar.
|next "Dragon_World_Quest_Emissaries"
step
label quest-66833
accept Marmoni in Distress##66833 |goto The Waking Shores/0 79.21,29.07
|tip You will accept this quest automatically.
stickystart "Slay_Wild_Coast_Protodragons_66833"
step
use the Marmoni Rescue Pack##193212
|tip Use it on Distressed Marmoni hanging from tree branches.
clicknpc Distressed Marmoni##184861+
Rescue #5# Distressed Marmoni |q 66833/1 |goto 79.21,29.07
step
label "Slay_Wild_Coast_Protodragons_66833"
Kill Proto enemies around this area
Slay #15# Wild Coast Protodragons |q 66833/2 |goto 79.21,29.07
|next "Dragon_World_Quest_Emissaries"
step
label quest-70172
accept Mountain Mysteries##70172 |goto The Waking Shores/0 48.22,52.70
|tip You will accept this quest automatically.
step
click Astral Essence+
|tip They look like swirling blue flames hovering above the ground around this area.
Collect #6# Astral Essence |q 70172/1 |goto 48.22,52.70
|next "Dragon_World_Quest_Emissaries"
step
label quest-66896
accept Net Income##66896 |goto The Waking Shores/0 52.00,35.73
|tip You will accept this quest automatically.
stickystart "Kill_Agitated_Snapper_66896"
step
use the Tuskarr Fishing Net##192191
|tip Toss it on Riverfish in the water.
Catch #10# Warwater Riverfish |q 66896/1 |goto 52.00,35.73
step
label "Kill_Agitated_Snapper_66896"
kill 6 Agitated Snapper##188334 |q 66896/2 |goto 52.00,35.73
|next "Dragon_World_Quest_Emissaries"
step
label quest-72008
accept Overcoming A Mountain: Krolkoth##72008 |goto The Waking Shores/0 43.05,57.88
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
kill Krolkoth the Mountain##197501 |q 72008/1 |goto 43.05,57.88
|tip This enemy is elite and may require additional assistance.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70012
accept Protect the Nets!##70012 |goto The Waking Shores/0 54.74,59.06
|tip You will accept this quest automatically.
step
click Tuskarr Fishing Net+
|tip They look like nets strung on sticks around the river area.
|tip They appear on your minimap as yellow dots.
kill Coastal Salamanther##191653
|tip The slamanther will sometimes attack you the first time you click the net.
|tip Click it again to inspect it.
Inspect #6# Fishing Nets |q 70012/1 |goto 54.74,59.06
|next "Dragon_World_Quest_Emissaries"
step
label quest-67006
accept Quenching the Flame##67006 |goto The Waking Shores/0 64.71,34.43
|tip You will accept this quest automatically.
stickystart "Kill_Qalashi_Skirmishers_67006"
stickystart "Kill_Qalashi_Scoundrels_67006"
stickystart "Slay_Qalashi_Beasts_67006"
step
kill 3 Qalashi Ragetamer##190766 |q 67006/1 |goto 62.87,34.27
step
label "Kill_Qalashi_Skirmishers_67006"
kill 3 Qalashi Skirmisher##186792 |q 67006/2 |goto 62.87,34.27
step
label "Kill_Qalashi_Scoundrels_67006"
kill 3 Qalashi Scoundrel##191446 |q 67006/3 |goto 64.71,34.43
step
label "Slay_Qalashi_Beasts_67006"
Kill enemies around this area
'|kill Magmammoth Calf##180705, Lava Phoenix##186684, Blazing Dreadsquall##191509, Magmammoth Bull##191903
Slay #5# Qalashi Beasts |q 67006/4 |goto 64.71,30.77
|next "Dragon_World_Quest_Emissaries"
step
label quest-74840
accept Sharp as Flint##74840 |goto The Waking Shores/0 68.98,46.78
|tip You will accept this quest automatically.
step
talk Excavator Morgrum Emberflint##201802
Choose _"Begin pet battle."_
Defeat Excavator Morgrum Emberflint in a Pet Battle |q 74840/1 |goto 68.98,46.78
|next "Dragon_World_Quest_Emissaries"
step
label quest-67024
accept Smoldering Reinforcement##67024 |goto The Waking Shores/0 56.39,22.95
|tip You will accept this quest automatically.
step
Kill enemies around this area
Clear the Primalist Forces |q 67024/1 |goto 56.39,22.95
|next "Dragon_World_Quest_Emissaries"
step
label quest-70651
accept Stolen Luggage##70651 |goto The Waking Shores/0 60.93,49.12
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 70651/1 |goto 60.93,49.12
step
click Handhold
Find a Handhold on the Cliff |q 70651/2 |goto 60.51,48.57
step
clicknpc Stolen Expedition Supplies##196002+
|tip Expedition Supplies are found next to handholds on the wall.
|tip Click handholds to move up the wall and excavate supplies.
|tip Move quickly past gorlocs that splash you which causes you to lose grip.
Knock Down #8# Stolen Expedition Supplies |q 70651/3 |goto 60.35,48.55
|next "Dragon_World_Quest_Emissaries"
step
label quest-70984
accept Surge Breaker##70984 |goto The Waking Shores/0 28.82,58.29
|tip You will accept this quest automatically.
step
Kill Qalashi enemies around this area
Repel the Djaradin Forces |q 70984/1 |goto 28.82,58.29
|next "Dragon_World_Quest_Emissaries"
step
label quest-66588
accept Swog the Elder##66588 |goto The Waking Shores/0 26.17,92.39
|tip You will accept this quest automatically.
step
clicknpc Swog##189376
Defeat Swog in a Pet Battle |q 66588/1 |goto 26.17,92.39
|next "Dragon_World_Quest_Emissaries"
step
label quest-69931
accept Swoop And Grab##69931 |goto The Waking Shores/0 51.81,19.51
|tip You will accept this quest automatically.
step
Recover #7# Stolen Supplies |q 69931/1 |goto 51.81,19.51
|tip Use your dragonriding abilities to fly through 10 golden rings.
|tip You can find them on cliffs and ledges around this area.
|tip They appear on your minimap as yellow dots.
|next "Dragon_World_Quest_Emissaries"
step
label quest-70021
accept Tale of Tapionnuq##70021 |goto The Waking Shores/0 13.97,91.46
|tip You will accept this quest automatically.
step
talk Memory of Tapionnuq##194730
Tell him _"I am ready."_
Speak with the Memory of Tapionuq |q 70021/1 |goto 13.97,91.46
step
clicknpc Kilpi##194732
|tip Use the "Fishing" ability on your vehicle bar to catch fish.
|tip Use the "Feed Kilpi" ability to feed the fish to it.
|tip Use "Feed Self" to eat a fish for health.
|tip Occasionally a sea monster will attack you.
|tip Defend yourself with "Tuskarr Smash."
Catch and Feed #5# Fish to Kilpi |q 70021/2 |goto 13.88,91.39
step
clicknpc Kilpi##194732
Cuddle Kilpi the Sea Turtle |q 70021/3 |goto 14.16,92.33
|next "Dragon_World_Quest_Emissaries"
step
label quest-66551
accept The Terrible Three##66551 |goto The Waking Shores/0 38.91,83.27
|tip You will accept this quest automatically.
step
talk Haniko##196264
Choose _"Begin pet battle."_
Defeat Haniko in a Pet Battle |q 66551/1 |goto 38.91,83.27
|next "Dragon_World_Quest_Emissaries"
step
label quest-69913
accept Towers of Earthen Power##69913 |goto The Waking Shores/0 67.04,56.75
|tip You will accept this quest automatically.
step
click Overflowing Earthen Energy+
|tip Return it to an Elemental Energy Repository.
|tip They look like swirling spheres of earth floating above the ground around this area.
Get 5 Stacks of the "Temporary Elemental Vessel" Buff |havebuff 5 Temporary Elemental Vessel##381555 |q 69913 |goto 67.04,56.75
step
Deposit the Earthen Energy |q 69913/1 |goto 65.74,58.42
|tip Return the energy to the red crystal.
|next "Dragon_World_Quest_Emissaries"
step
label quest-69924
accept Towers of Flaming Power##69924 |goto The Waking Shores/0 55.76,22.18
|tip You will accept this quest automatically.
|tip You must be in War Mode to accept this quest.
step
click Overflowing Fire Energy+
|tip Return it to an Elemental Energy Repository.
|tip They look like large red crystals floating above the ground around this area.
Deposit the Fire Energy |q 69924/1 |goto 55.76,22.18
|next "Dragon_World_Quest_Emissaries"
step
label quest-66203
accept Wash Over Them##66203 |goto The Waking Shores/0 39.79,75.83
|tip You will accept this quest automatically.
step
click Surging Torrent
Summon the Surging Torrent |q 66203/1 |goto 39.79,75.83
step
Kill enemies around this area
|tip Use the abilities on your vehicle bar.
Extinguish the Elemental Attackers |q 66203/2 |goto 37.86,73.00
|next "Dragon_World_Quest_Emissaries"
step
label quest-72058
accept What Hoof We Here: Tarolekk##72058
|tip You will accept this quest automatically.
|polish
step
kill Tarolekk, the Stomper##197650 |q 72058/1
|next "Dragon_World_Quest_Emissaries"
step
label quest-67012
accept When Riverbeasts Fly##67012 |goto The Waking Shores/0 77.73,47.85
|tip You will accept this quest automatically.
stickystart "Slay_Elementals_67012"
step
Click animals around this area
|tip They look like various helpless and cowering animals all over the area.
Rescue #15# Animals |q 67012/1 |goto 77.73,47.85
step
label "Slay_Elementals_67012"
Kill Rampaging enemies around this area
Slay #15# Elementals |q 67012/2 |goto 77.73,47.85
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5232
accept Gaelzion##69959 |goto The Waking Shores/0 29.59,52.95
|tip You will accept this quest automatically.
|polish
step
kill Gaelzion##193653 |q 69959/1 |goto 29.59,52.95
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5116
accept Magmaton##70979 |goto The Waking Shores/0 40.06,63.70
|tip It walks up and down the Emberflow.
|tip You will accept this quest automatically.
|polish
step
kill Magmaton##186827 |q 70979/1 |goto 40.06,63.70
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5167
accept O'nank Shorescour##70983 |goto The Waking Shores/0 79.10,53.02
|tip You will accept this quest automatically.
|polish
step
kill O'nank Shorescour##193118 |q 70983/1 |goto 79.10,53.02
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5386
Kill the Qalashi War Party |q 74465 |goto The Waking Shores/0 33.6,41.6 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5383
accept Forgotten Gryphon##72130 |goto The Waking Shores/0 33.12,76.32
|tip You will accept this quest automatically.
|polish
step
kill Forgotten Gryphon##193154 |q 72130/1 |goto 33.12,76.32
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5169
accept Smogswog the Firebreather##69668 |goto The Waking Shores/0 69.41,64.79
|tip You will accept this quest automatically.
|polish
step
kill Smogswog the Firebreather##193120 |q 69668/1 |goto 69.41,64.79
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5385
accept Captain Lancer##72127 |goto The Waking Shores/0 26.84,76.42
|tip You will accept this quest automatically.
|polish
step
kill Captain Lancer##193198 |q 72127/1 |goto 26.84,76.42
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5171
accept Amethyzar the Glittering##69838 |goto The Waking Shores/0 63.69,55.09
|tip You will accept this quest automatically.
|polish
step
kill Amethyzar the Glittering##193132 |q 69838/1 |goto 63.69,55.09
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5172
accept Azra's Prized Peony##69839 |goto The Waking Shores/0 54.51,71.74
|tip You will accept this quest automatically.
|polish
step
kill Azra's Prized Peony##193135 |q 69839/1 |goto 54.51,71.74
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5900
kill Battlehorn Pyrhus##190986 |q 74040 |goto The Waking Shores/0 28.63,58.82 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5112
kill Battlehorn Pyrhus##190986 |q 74040 |goto The Waking Shores/0 28.63,58.82 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5901
kill Cauldronbearer Blakor##186783 |q 74042 |goto The Waking Shores/0 30.57,56.25 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5480
kill Cauldronbearer Blakor##186783 |q 74042 |goto The Waking Shores/0 30.57,56.25 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5902
kill Char##190991 |q 74043 |goto The Waking Shores/0 29.93,50.74 |future
You can also find it around:
[29.33,52.48]
[30.53,51.44]
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5115
kill Char##190991 |q 74043 |goto The Waking Shores/0 29.93,50.74 |future
You can also find it around:
[29.33,52.48]
[30.53,51.44]
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5113
accept Death's Shadow##67027 |goto The Waking Shores/0 31.78,54.74
|tip You will accept this quest automatically.
|polish
step
kill Death's Shadow##190985 |q 67027/1 |goto 31.78,54.74
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5197
accept Gorjo the Crab Shackler##69874 |goto The Waking Shores/0 78.24,49.91
|tip You will accept this quest automatically.
|polish
step
kill Gorjo the Crab Shackler##193226 |q 69874/1 |goto 78.24,49.91
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5382
accept Enkine the Voracious##72128 |goto The Waking Shores/0 21.62,64.78
|tip You will accept this quest automatically.
|polish
step
kill Enkine the Voracious##193134 |q 72128/1 |goto 21.62,64.78
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5175
accept Massive Magmashell##69848 |goto The Waking Shores/0 22.20,76.49
|tip You will accept this quest automatically.
|polish
step
kill Massive Magmashell##193152 |q 69848/1 |goto 22.20,76.49
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5388
accept Breaking the World##66901 |goto The Waking Shores/0 32.80,52.48
|tip You will accept this quest automatically.
|polish
step
kill Morchok##187306 |q 66901/1 |goto 32.80,52.48
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5904
kill Rasnar the War Ender##193232 |q 74051 |goto The Waking Shores/0 24.00,58.96 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5512
kill Rasnar the War Ender##193232 |q 74051 |goto The Waking Shores/0 24.00,58.96 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5513
kill Rohzor Forgesmash##187598 |q 74052 |goto The Waking Shores/0 30.73,61.10 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5903
Enter the building |goto The Waking Shores/0 27.22,60.96 < 10 |walk
accept Clearing the Vault##66903 |goto 23.75,57.24
|tip You will accept this quest automatically.
|polish
step
kill Shas'ith##189822 |q 66903/1 |goto 23.75,57.24
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5108
Enter the building |goto The Waking Shores/0 27.22,60.96 < 10 |walk
accept Clearing the Vault##66903 |goto 23.75,57.24
|tip You will accept this quest automatically.
|polish
step
kill Shas'ith##189822 |q 66903/1 |goto 23.75,57.24
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5905
kill Turboris##187886 |q 66901/1 |goto The Waking Shores/0 33.52,55.76 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5109
kill Turboris##187886 |q 66901/1 |goto The Waking Shores/0 33.52,55.76 |future
|polish
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5110
accept Worldcarver A'tir##70763 |goto The Waking Shores/0 30.02,55.34
|tip You will accept this quest automatically.
|polish
step
kill Worldcarver A'tir##186859 |q 70763/1 |goto 30.02,55.34
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Zaralek Cavern World Quests",{
author="support@zygorguides.com",
description="This guide will assist you in completing world quests in Zaralek Cavern.",
startlevel=60,
worldquestzone={2133},
patch='100100',
},[[
step
label "Choose_World_Quest"
#include "Dragon_Choose_World_Quests"
step
label vignette-5643
Enter the cave |goto Zaralek Cavern/0 56.77,73.27 < 20 |walk
accept Alcanon##75285 |goto 56.14,73.91
|tip You will accept this quest automatically.
|tip Inside the cave.
|polish
step
kill Alcanon##203515 |q 75285/1 |goto 56.14,73.91
|tip Inside the cave.
|tip Avoid standing in front during "Golem Smash" when possible.
|tip "Crush" deals heavy melee damage.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75343
accept All That Glitter##75343 |goto Zaralek Cavern/0 56.65,71.41
|tip You will accept this quest automatically.
step
Collect #12# Glitter |q 75343/1 |goto 56.65,71.41
|tip Fly through glittering yellow orbs in the air around this area.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75063
accept Ambergrease##75063 |goto Zaralek Cavern/0 44.27,76.99
|tip You will accept this quest automatically.
step
Choose a Snail |q 75063/1 |goto 44.27,76.99
|tip Click one of the three snails.
stickystart "Feed_the_Snail"
step
click Ambergrease+
|tip They look like small piles of dirt on the ground around this area.
|tip They snail will often leave one behind after eating a mushroom.
Collect #5# Ambergrease |q 75063/3 |goto 45.26,75.05
step
label "Feed_the_Snail"
Feed the Snail #5# Times |q 75063/2 |goto 45.26,75.05
|tip Stand next to small glowing mushrooms around this area.
|tip The snail will consume them in about 15 seconds.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5640
accept Aquifon##75271 |goto Zaralek Cavern/0 48.36,75.09
|tip You will accept this quest automatically.
|polish
step
kill Aquifon##203468 |q 75271/1 |goto 48.36,75.09
|tip Interrupt "Elemental Edema" on cooldown.
|tip Move away from "Living Whirl" cyclones that pursue you.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75750
Enter the cave |goto Zaralek Cavern/0 38.62,50.34 < 10 |walk
accept Are They Not Beautiful?##75750 |goto Zaralek Cavern/0 38.25,49.66
|tip Inside the cave.
|tip You will accept this quest automatically.
|polish
step
talk Shinmura##204792
|tip Inside the cave.
Choose _"Begin pet battle."_
Defeat Shinmura in a Pet Battle |q 75750/1 |goto 38.25,49.66
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5652
accept Brullo the Strong##75326 |goto Zaralek Cavern/0 41.52,86.13
|tip You will accept this quest automatically.
|polish
step
talk Brullo the Strong##203621
Choose _"<Show off your gains.>"_
kill Brullo the Strong##203621 |q 75326/1 |goto 41.52,86.13
|tip He will attack you after a brief dialogue
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5728
accept Captain Reykal##75612 |goto Zaralek Cavern/0 44.15,74.34
|tip You will accept this quest automatically.
|tip On top of the ledge.
|polish
step
kill Captain Reykal##204423 |q 75612/1 |goto 44.15,74.34
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5706
accept Cascades Calling##75612 |goto Zaralek Cavern/0 44.15,74.34
|tip You will accept this quest automatically.
|tip On top of the ledge.
stickystart "Kill_Frigidus"
step
click Control Pylon+
|tip They look like pillars of earth topped with white and blue swirling orbs around the water.
|tip Click them until Rimecaller Raava is released.
kill Rimecaller Raava##204423 |q 75612/1 |goto 44.15,74.34
step
label "Kill_Frigidus"
kill Frigidus##204425 |q 75612/2 |goto 44.23,74.26
|tip Attack both at least once to get credit.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75126
accept Cataloging Zaralek Cavern##75126 |goto Zaralek Cavern/0 43.26,84.64
|tip You will accept this quest automatically.
step
clicknpc Cataloger's Raft##195713
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 75126/1 |goto 43.26,84.64
step
Take Pictures of Wildlife |q 75126/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5705
accept The Champion's Challenge##75624 |goto Zaralek Cavern/0 45.11,82.99
|tip You will accept this quest automatically.
step
click Rock Weight+
|tip They look like large weights sunk in the ground around this area.
kill Drogbar Participant##204531+
|tip They will attack you.
|tip When the Challenge Points bar fills up nearbye at Judge Roggul, the challenge is complete.
Complete the Champion's Challenge |q 75624/1 |goto 45.11,82.99
|next "Dragon_World_Quest_Emissaries"
step
label quest-73221
accept A Clear State of Mind##73221 |goto Zaralek Cavern/0 51.16,58.26
|tip You will accept this quest automatically.
step
use M.U.S.T##202714
|tip Use it in Refti enemies around this area.
Cleanse #8# Refti |q 73221/1 |goto 51.16,58.26
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5674
accept Colossian##75476 |goto Zaralek Cavern/0 48.38,23.80
|tip You will accept this quest automatically.
|polish
step
kill Colossian##204093 |q 75476/1 |goto 48.38,23.80
|tip Don't stand in front of Colossian during "Devastating Slam."
|tip Move quickly after "Fissuring Slam" out of the area under your feet.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5708
accept Conspiracy of Flames##75455 |goto Zaralek Cavern/0 32.02,43.48
|tip You will accept this quest automatically.
step
click Ancient Dragon Skull+
|tip Click the skull with the orange orb over it to fill the bar.
|tip Keep alternating until all of the skulls are empowered.
Complete the Djaradin Ritual |q 75455/1 |goto 32.02,43.48
|next "Dragon_World_Quest_Emissaries"
step
label quest-74879
accept Corrosive Counterbalance##74879 |goto Zaralek Cavern/0 48.21,38.63
|tip You will accept this quest automatically.
step
Neutralize #6# Acidic Pools with Elemental Base |q 74879/1 |goto 48.21,38.63
|tip Drag Alkaline Ragers to the greenish-yellow vapor clouds.
step
Neutralize #6# Basic Pools with Elemental Acid |q 74879/2 |goto 48.21,38.63
|tip Drag Sulfuric Ragers to the blue vapor clouds.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75030
accept Crystal Catastrophe!##75030 |goto Zaralek Cavern/0 58.82,46.49
|tip You will accept this quest automatically.
step
Catch #20# Crystals |q 75030/1 |goto 58.82,46.49
|tip Run into the blue patches on the ground to catch a crystal.
|tip Avoid the brown patches.
|tip You cannot catch crystals while mounted.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75062
accept Crystalline Conundrum##75062 |goto Zaralek Cavern/0 56.90,63.68
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 75062/1 |goto 56.90,63.68
step
click Handhold
Find a Handhold on the Cliff |q 75062/2 |goto 56.83,63.55
step
clicknpc Shimmering Crystal+
|tip They look like glowing crystals on the wall next to handholds.
|tip Click handholds to move up the wall and excavate artifacts from the wall by clicking them.
|tip Avoid Aggressive Rockvipers which will cause you to lose grip.
Collect #8# Shimmering Crystals |q 75062/3 |goto 56.70,63.06
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5700
accept Crystalline Survey##75471 |goto Zaralek Cavern/0 62.53,47.65
|tip You will accept this quest automatically.
step
kill Agitated Crystalline##204099+
Complete the Survey |q 75471/1 |goto 62.53,47.65
|next "Dragon_World_Quest_Emissaries"
step
label quest-75661
accept Curative Crystalline Collection##75661 |goto Zaralek Cavern/0 37.71,71.08
|tip You will accept this quest automatically.
step
Kill Viridian enemies around this area
collect 10 Viridian Heartcrystal##203012 |q 75661/1 |goto 37.71,71.08
|next "Dragon_World_Quest_Emissaries"
step
label quest-75344
accept Crystal Cracker##75344 |goto Zaralek Cavern/0 56.46,65.54
|tip You will accept this quest automatically.
stickystart "Kill_Crystalline_Walkers"
step
clicknpc Living Cluster##201062+
|tip They look like small Crystalline Walkers near rock formations.
Shine #8# Shardlings |q 75344/2 |goto 56.46,65.54
step
label "Kill_Crystalline_Walkers"
kill 4 Crystalline Walker##201063 |q 75344/1 |goto 56.46,65.54
|next "Dragon_World_Quest_Emissaries"
step
label quest-75346
accept Delver Mardei##75346 |goto Zaralek Cavern/0 60.39,69.42
|tip You will accept this quest automatically.
step
extraaction Order Scan##411428
|tip It appears as a button on your screen.
|tip Use it on various creatures around this area.
Scan #10# Wildlife |q 75346/1 |goto 60.39,69.42
|next "Dragon_World_Quest_Emissaries"
step
label quest-75200
accept Deepflayer Slayer##75200 |goto Zaralek Cavern/0 60.34,37.33
|tip You will accept this quest automatically.
step
Enter the cave |goto Zaralek Cavern/0 60.42,37.07 < 10 |walk
Kill Scavengening enemies around this area
|tip Inside and outside the cave.
Slay #15# Deepflayers |q 75200/1 |goto 45.81,45.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-74292
accept Deephollow Mysteries##74292 |goto Zaralek Cavern/0 61.93,53.77
|tip You will accept this quest automatically.
step
click Arcane Magnetbubble
|tip They look like blue bubbles floating underwater around this area.
Use the Arcane Magnetbubble to Breathe Underwater |q 74292/1 |goto 61.93,53.77
step
click Arcane Magnetbubble
|tip They look like blue bubbles floating underwater around this area.
|tip Clicking a distant one will drag you to it quickly.
Click objects around this area
|tip They look like various discarded items underwater around this area.
Collect #15# Strange Artifacts |q 74292/2 |goto 61.93,53.77
|next "Dragon_World_Quest_Emissaries"
step
label quest-75834
accept Delver Mardei##75834 |goto Zaralek Cavern/0 65.37,49.60
|tip You will accept this quest automatically.
|polish
step
talk Delver Mardei##204926
Choose _"Begin pet battle."_
Defeat Delver Mardei in a Pet Battle |q 75834/1 |goto 65.37,49.60
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5660
accept Dinn##75353 |goto Zaralek Cavern/0 28.50,51.13
|tip You will accept this quest automatically.
|polish
step
kill Dinn##203646 |q 75353/1 |goto 28.50,51.13
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5720
accept Discordant Crystals##75664 |goto Zaralek Cavern/0 56.57,65.54
|tip You will accept this quest automatically.
stickystart "Kill_Discordant_Chips"
step
kill Discordant Lodestone##204676 |q 75664/1 |goto 56.57,65.54
step
label "Kill_Discordant_Chips"
kill 8 Discordant Chip##204677 |q 75664/2 |goto 56.57,65.54
|tip They look like blue crystal clusters on the ground around this area.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75835
accept Do You Even Train?##75835 |goto Zaralek Cavern/0 45.69,81.50
|tip You will accept this quest automatically.
|polish
step
talk Trainer Orlogg##204934
Choose _"Begin pet battle."_
Defeat Trainer Orlogg in a Pet Battle |q 75835/1 |goto 45.69,81.50
|next "Dragon_World_Quest_Emissaries"
step
label quest-75121
accept Dragonrider Racing - Brimstone Scramble##75121 |goto Zaralek Cavern/0 54.50,23.70
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202749
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##403746 |goto 54.50,23.70 |q 75121
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 54.49,23.80 |q 75121
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75121/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75120
accept Dragonrider Racing - Caldera Cruise##75120 |goto Zaralek Cavern/0 39.06,49.99
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202676
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##403533 |goto 39.06,49.99 |q 75120
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 39.09,49.89 |q 75120
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75120/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75119
accept Dragonrider Racing - Crystal Circuit##75119 |goto Zaralek Cavern/0 38.75,60.61
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202524
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##403192 |goto 38.75,60.61 |q 75119
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 38.65,60.61 |q 75119
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75119/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75123
accept Dragonrider Racing - Loamm Roamm##75123 |goto Zaralek Cavern/0 58.15,57.59
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202795
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##403934 |goto 58.15,57.59 |q 75123
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 58.07,57.61 |q 75123
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75123/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75122
accept Dragonrider Racing - Shimmering Slalom##75122 |goto Zaralek Cavern/0 58.72,45.03
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202772
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##403830 |goto 58.72,45.03 |q 75122
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 58.71,45.13 |q 75122
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75122/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75124
accept Dragonrider Racing - Sulfur Sprint##75124 |goto Zaralek Cavern/0 51.26,46.67
|tip You will accept this quest automatically.
step
talk Bronze Timekeeper##202973
Tell him _"I'd like to try the course."_
Prepare for the Race |havebuff Race Starting##404558 |goto 51.26,46.67 |q 75124
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Wait for the Race to Start |havebuff Racing##369968 |goto 51.20,46.65 |q 75124
|tip This will take about 5 seconds.
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
step
Complete the Race |q 75124/1
|tip Follow the indicated path, flying through rings and any wind gusts you see.
|tip Use your dragonriding abilities frequently to maintain a swift pace.
|tip The immediate next path appears in orange, while future paths appear in blue.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5663
accept Emberdusk##75364 |goto Zaralek Cavern/0 31.81,50.63
|tip You will accept this quest automatically.
|polish
step
kill Emberdusk##203664 |q 75364/1 |goto 31.81,50.63
|next "Dragon_World_Quest_Emissaries"
step
label quest-75660
accept Ending Their Watch##75660 |goto Zaralek Cavern/0 40.13,68.45
|tip You will accept this quest automatically.
step
talk Rupert, the Gentleman Elemental##200291
Tell it _"I'm ready to travel with you."_
Ask Rupert to Bring You to the Buried Vault |q 75660/1 |goto 40.12,68.47
step
kill 6 Enraged Watcher##200407 |q 75660/2 |goto 52.92,81.05
|next "Dragon_World_Quest_Emissaries"
step
label quest-78663
accept Excavation: Scattered Around the Tower##78663 |goto Zaralek Cavern/0 47.51,48.33
|tip You will accept this quest automatically.
step
use Archivist's Earth Totem##210834
|tip Use it near rumbling earth areas around this area.
|tip They appear on your minimap as yellow dots.
clicknpc Roska's Earth Totem##208059
|tip It appears after using the totem.
|tip Alternate between this and stepping on small lava oozes to keep the indicator in the colored section of the bar.
|tip Small arrows on the left or right of the indicator mark indicate if the progress is towards fire or earth.
Click Relics
|tip While the indicator is in the colored area, click the relic to fill the progress bar.
Unearth #2# Finds |q 78663/1 |goto 47.51,48.33
|next "Dragon_World_Quest_Emissaries"
step
label quest-74992
accept Fire Resistance Gear##74992 |goto Zaralek Cavern/0 33.66,46.24
|tip You will accept this quest automatically.
step
Kill Hound and Pup enemies around this area
|tip Kill enemies around the lava that look like dogs.
|tip Skin the corpses if you have Skinning as well.
collect 8 Corehound Hide##204314 |q 74992/1 |goto 33.66,46.24
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5661
Enter the cave |goto Zaralek Cavern/0 35.91,43.94 < 15
accept Flowfy##75358 |goto Zaralek Cavern/0 36.30,44.79
|tip You will accept this quest automatically.
|tip Inside the cave.
|polish
step
kill Flowfy##203660 |q 75358/1 |goto 36.30,44.79
|tip Inside the cave.
|tip "Fracturing Bite" stacks and causes 10% increased damage taken per stack.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5645
accept General Zskorro##75296 |goto Zaralek Cavern/0 42.12,18.70
|tip You will accept this quest automatically.
|tip Inside the building.
step
kill General Zskorro##203592 |q 75296/1 |goto 42.12,18.70
|tip Inside the building.
|tip After "Thundering Stomp," avoid blue areas on the ground.
|tip Interrupt "Stonefall" or avoid the swirling areas on the ground.
|tip "Dragon Rend" deals bleed damage over 8 seconds.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5704
accept Glimmerfish Before It's Gone##75611 |goto Zaralek Cavern/0 40.44,60.97
|tip You will accept this quest automatically.
step
kill Giant Glimmerfish##204389
click Glimmerfish Scale##399671+
|tip They drop from the Glimmerfish when you attack it.
collect 15 Glimmerfish Scale##205179 |q 75611/2 |goto 40.44,60.97
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5641
accept Kairoktra##75274 |goto Zaralek Cavern/0 68.80,46.01
|tip You will accept this quest automatically.
|polish
step
kill Goopal##203477 |q 75274/1 |goto 68.80,46.01
|next "Dragon_World_Quest_Emissaries"
step
label quest-74945
accept Guanite Gambit##74945 |goto Zaralek Cavern/0 49.59,41.20
|tip You will accept this quest automatically.
step
kill Nesting Shalewing##202785+
click Guanite+
|tip They look like small rocks around this area.
|tip They also drop from Nesting Shalewings.
collect 24 Guanite##204265 |q 74945/1 |goto 49.59,41.20
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5718
accept Hungry Hungry Hydra##75478 |goto Zaralek Cavern/0 47.30,20.92
|tip You will accept this quest automatically.
|polish
step
Kill enemies around this area
|tip Drag them to the hydra heads along the lava edge.
|tip Kill them in front of the hydra heads to feed them to the hydra.
Satiate the Hydra |q 75478/1 |goto 47.30,20.92
|next "Dragon_World_Quest_Emissaries"
step
label quest-74988
accept If You Can't Take the Heat##74988 |goto Zaralek Cavern/0 36.28,47.63
|tip You will accept this quest automatically.
step
kill Crumbling Scoria##199837+
use the Conductive Lodestone##204344
|tip Use it on defeated Crumbling Scoria enemies.
Siphon #10# Crumbling Scoria |q 74988/1 |goto 36.03,46.20
step
use the Conductive Lodestone##204344
|tip Use it on High Summoner Wahuna to kill him.
kill High Summoner Wahuna##202981 |q 74988/2 |goto 36.28,47.63
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5710
accept Imperfect Balance##75451 |goto Zaralek Cavern/0 35.46,51.20
|tip You will accept this quest automatically.
step
kill Fury of the Caldera##204108 |q 75451/1 |goto 35.46,51.20
|tip Stand in the pillar of earth and pillar of fire nearby until both of the infusion bars are full.
|tip Pulling an elite in one circle will cause the other one to attack as well.
|tip When fully infusted, it will be attackable.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5654
accept Invohq##75336 |goto Zaralek Cavern/0 45.65,33.28
|tip You will accept this quest automatically.
|polish
step
kill Invohq##203627 |q 75336/1 |goto 45.65,33.28
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5653
accept Kairoktra##75334
|tip You will accept this quest automatically.
|polish
step
kill Kairoktra##203625 |q 75334/1
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5639
accept Kapraku##75269 |goto Zaralek Cavern/0 59.64,39.51
|tip You will accept this quest automatically.
step
kill Kapraku##203466 |q 75269/1 |goto 59.64,39.51
|tip Move out of areas targeted on the ground.
|tip Stop casting during "Ear-Splitting Roar" casts.
|tip "Rending Slash" deals bleed damage over time.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5651
accept Klakatak##75322 |goto Zaralek Cavern/0 54.05,41.71
|tip You will accept this quest automatically.
|polish
step
kill Klakatak##203618 |q 75322/1 |goto 54.05,41.71
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5638
Enter the cave |goto Zaralek Cavern/0 64.67,55.45 < 10 |walk
accept Kob'rok##75267 |goto 65.42,55.87
|tip You will accept this quest automatically.
|tip Inside the cave.
|polish
step
kill Kob'rok##203462 |q 75267/1 |goto 65.42,55.87
|tip Inside the cave.
|next "Dragon_World_Quest_Emissaries"
step
label quest-74985
accept Like Moths to a Flame##74985 |goto Zaralek Cavern/0 47.69,49.19
|tip You will accept this quest automatically.
step
kill 12 Lightbound Swarmer##202841 |q 74985/1 |goto 47.69,49.19
|tip At the top of the tower.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5716
accept Magmaclaw Matriarch##75461 |goto Zaralek Cavern/0 46.69,25.81
|tip You will accept this quest automatically.
step
Kill Magmaclaw enemies around this area
click Singed Offering+
|tip They look like charred pieces of meat next to lava around this area.
kill Magmaclaw Queen##203934 |q 75461/1 |goto 46.69,25.81
|tip It will spawn from the pool and attack you when the bar fills up.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5656
accept Magmanesha##75340 |goto Zaralek Cavern/0 40.76,38.19
|tip You will accept this quest automatically.
|polish
step
kill Magmanesha##200111 |q 75340/1 |goto 40.76,38.19
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5721
accept Monument Maintenance##75705 |goto Zaralek Cavern/0 61.71,72.04
|tip You will accept this quest automatically.
step
Click objects around this area
|tip Find the Missing Arm, Missing Head, and Shattered Sphere around the area.
|tip They appear on your minimap as yellow dots.
|tip Bring them back to the statue and click it to restore the pieces.
|tip When you pick one up, don't mount and avoid enemies.
Restore the Crumbling Statue |q 75705/1 |goto 61.71,72.04
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5707
accept Mortar Warfare##75454 |goto Zaralek Cavern/0 40.26,43.52
|tip You will accept this quest automatically.
step
kill Fury of the Caldera##204108+
extraaction Frothing Lava##407633
|tip Run to the erupting fire and pick an orb up floating above the ground.
|tip Target a ballistae and use the Frothing Lava ability on it.
|tip Repeat this to destroy the three ballistae.
Destroy the Dragonkiller Ballistae |q 75454/2 |goto 40.26,43.52
|next "Dragon_World_Quest_Emissaries"
step
label quest-75350
accept Niffen Nabber##75350 |goto Zaralek Cavern/0 59.24,73.86
|tip You will accept this quest automatically.
step
click Prison Door
|tip They look like doors on large cages around this area.
Free #6# Kidnapped Niffen |q 75350/1 |goto 59.24,73.86
|next "Dragon_World_Quest_Emissaries"
step
label quest-75061
accept No Mushroom For Ever##75061 |goto Zaralek Cavern/0 54.49,68.01
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 75061/1 |goto 54.49,68.01
step
click Handhold
Find a Handhold on the Cliff |q 75061/2 |goto 54.46,68.26
step
clicknpc Cavern Mushroom+
|tip They look like mushroom clusters growing on the wall next to handholds.
|tip Click handholds to move up the wall and excavate mushrooms from the wall by clicking them.
|tip Avoid Aggressive Rockvipers which will cause you to lose grip.
Collect #8# Cavern Mushrooms |q 75061/3 |goto 53.97,68.21
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5644
Enter the building |goto Zaralek Cavern/0 52.98,18.87 < 10 |walk
accept Professor Gastrinax##75292 |goto 55.84,18.99
|tip You will accept this quest automatically.
|tip Inside the building.
|polish
step
kill Professor Gastrinax##203521 |q 75292/1 |goto 55.84,18.99
|tip Inside the building.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75151
accept Redistributing the Remnants##75151 |goto Zaralek Cavern/0 43.28,22.16
|tip You will accept this quest automatically.
step
Click objects around this area
|tip Click the various weapons and armor laying on the ground around this area.
collect 8 Drakeforged Armaments##204437 |q 75151/1 |goto 43.28,22.16
|next "Dragon_World_Quest_Emissaries"
step
label quest-75663
accept Restless Torment##75663 |goto Zaralek Cavern/0 49.86,39.10
|tip You will accept this quest automatically.
step
kill Ghostly Researcher##203013+
kill Failed Experiment##203007+
Kill #15# Ghostly Researchers or Failed Experiments |q 75663/1 |goto 49.86,39.10
|next "Dragon_World_Quest_Emissaries"
step
label quest-75067
accept Rock Viper Roundup##75067 |goto Zaralek Cavern/0 45.08,69.05
|tip You will accept this quest automatically.
stickystart "Destroy_Rock_Viper_Eggs"
step
kill 20 Rock Viper Egg##203054 |q 75067/2 |goto 45.08,69.05
step
label "Destroy_Rock_Viper_Eggs"
kill 10 Invasive Rock Viper##203053 |q 75067/1 |goto 45.08,69.05
|next "Dragon_World_Quest_Emissaries"
step
label quest-74990
accept Roiling Shadow##74990 |goto Zaralek Cavern/0 31.05,49.25
|tip You will accept this quest automatically.
step
extraaction Blazing Ascent##405041
|tip Use it to throw yourself in the air.
extraaction Surge Upward##404933
|tip Use it to briefly dash upward a short distance.
Pop #10# Shadowflame Boils |q 74990/2 |goto 31.05,49.25
step
kill Igneous Darkness##202866 |q 74990/1 |goto 32.51,50.05
|tip This enemy is elite and may require a group.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73698
accept Rolie Polie Molie##73698 |goto Zaralek Cavern/0 61.97,49.52
|tip You will accept this quest automatically.
step
talk Olie##201042
Tell him _"I'm ready."_
Talk to Olie to Transform |q 73698/1 |goto 60.94,49.50
step
collect 20 Snail Slime##203229 |q 73698/2 |goto 61.60,48.59
|tip Use the "Jump" ability on your vehicle bar to burst up under Slimy Whelks.
|tip Doing this to the same whelk over and over will make it aggressive.
|tip Run over the slime patches to collect them.
|tip Use "Dig Deeper" to drop threat.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5709
accept Seismic Ceremony##75450 |goto Zaralek Cavern/0 34.36,47.83
|tip You will accept this quest automatically.
step
clicknpc Primalist Runestone##204001+
Deactivate the Primalist Runestones |q 75450/1 |goto 34.36,47.83
|tip Every 8 seconds the stones will erupt and deal damage and stun anyone nearby.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75155
accept Shadowflame Snuffer##75155 |goto Zaralek Cavern/0 48.44,16.89
|tip You will accept this quest automatically.
step
kill Shadowflame Emberling##203182+
|tip They look like little flaming elementals near the lava around this area.
|tip Run over them to squish them.
Snuff the Shadowflame |q 75155/1 |goto 48.44,16.89
|next "Dragon_World_Quest_Emissaries"
step
label quest-75345
accept Shell Corporation##75345 |goto Zaralek Cavern/0 59.34,67.77
|tip You will accept this quest automatically.
|polish
step
click Succulent Looking Deepcaps+
|tip They look like clusters of mushrooms on the ground around this area.
clicknpc Redolent Whelk##200898+
|tip They can be found all over this area.
extraaction Snail Stuffing!##408797
|tip Throw the stuffing at a Redolent Whelk snail.
|tip In a few seconds it will drop a shell.
|tip Don't mount or you will lose the ability.
click Cast Off Shell+
|tip They drop from snails you feed.
collect 8 Slime Sheathed Shell##205199 |q 75345/1 |goto 59.34,67.77
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5701
accept Shellfire##75222 |goto Zaralek Cavern/0 57.66,49.00
|tip You will accept this quest automatically.
step
kill Excited Ember##203330+
click Jar of Snuffer Powder
|tip They drop from Excited Embers.
extraaction Throw Snuffer Powder##405716
|tip Throw the powder on Big Bessie.
Extinguish Big Bessie |q 75222/1 |goto 57.66,49.00
|next "Dragon_World_Quest_Emissaries"
step
label quest-75064
accept Shrooming for a Living##75064 |goto Zaralek Cavern/0 51.88,76.12
|tip You will accept this quest automatically.
stickystart "Kill_Pesky_Sporemoths"
step
click Dewcup Mushroom+
|tip They look like cup-shaped mushrooms on the ground around this area.
Harvest #7# Dewcup Mushrooms |q 75064/1 |goto 52.03,76.46
step
label "Kill_Pesky_Sporemoths"
kill 12 Pesky Sporemoth##202625 |q 75064/2 |goto 52.03,76.46
|tip These often spawn slowly.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5659
accept Skornace##75349 |goto Zaralek Cavern/0 36.38,52.74
|tip You will accept this quest automatically.
|polish
step
kill Skornak##203643 |q 75349/1 |goto 36.38,52.74
|next "Dragon_World_Quest_Emissaries"
step
label quest-75128
accept Slime Ranching##75128 |goto Zaralek Cavern/0 52.49,18.87
|tip You will accept this quest automatically.
step
extraaction Slime Sucker 2000##405006
|tip Use it to vacuum slimes to you inside and outside the building.
Contain the Slimes |q 75128/1 |goto 52.49,18.87
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5702
map Zaralek Cavern/0
path follow smart; loop on; ants curved; dist 30
path	63.30,52.50	62.56,51.88	61.41,50.80	61.06,51.66	60.61,52.34
path	60.27,54.23	61.02,54.90	61.86,55.14	62.97,53.72
accept Smellincense##75370
|tip You will accept this quest automatically.
step
map Zaralek Cavern/0
path follow smart; loop on; ants curved; dist 30
path	63.30,52.50	62.56,51.88	61.41,50.80	61.06,51.66	60.61,52.34
path	60.27,54.23	61.02,54.90	61.86,55.14	62.97,53.72
Click objects on the ground
|tip Various small glowing objects will provide you with an action button on your screen.
extraaction Throw Ingredient##407047
|tip Target the wagon and throw the ingredient at it.
|tip When the wagon has 30 stacks of the buff, the incense is complete.
Complete the Incense |q 75370/1 |goto 62.53,47.65
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5703
accept Smelly Scramble##75441 |goto Zaralek Cavern/0 57.69,57.06
|tip You will accept this quest automatically.
|polish
step
Make the Concoction |q 75441/1 |goto 57.69,57.06
|tip Run into the circles on the ground and use the ability on-screen to throw it far away on the ground.
|tip Keep running and catching until the concoction finishes.
|next "Dragon_World_Quest_Emissaries"
step
label quest-73408
accept Sniffen 'em Out!##73408 |goto Deepflayer Nest/0 27.31,34.45
|tip You will accept this quest automatically.
step
use the Niffen Incense##203013
|tip Follow the trail of fumes, stopping around large patches and searching.
extraaction Dig!##399339
|tip Use it when it appears on-screen near a big patch of fumes.
Dig up #5# Reekroot |q 73408/1 |goto 27.31,34.45
|tip At the top of the tower.
|next "Dragon_World_Quest_Emissaries"
step
label quest-75071
accept Sniffing Mice are Nice##75071 |goto Zaralek Cavern/0 51.06,74.13
|tip You will accept this quest automatically.
step
clicknpc Sniffing Mouse##205042
Borrow a Sniffing Mouse |q 75071/1 |goto 51.06,74.13
step
extraaction Dig Here!##406104
|tip Use it on smoky glittering spots on the ground.
|tip After the Drogbar digs up the item, click it.
Collect #10# 'Smellies' |q 75071/2 |goto 49.18,73.71
|next "Dragon_World_Quest_Emissaries"
step
label quest-75058
accept Spearheading Acquisition##75058 |goto Zaralek Cavern/0 38.33,63.10
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 75058/1 |goto 38.33,63.10
step
click Handhold
Find a Handhold on the Cliff |q 75058/2 |goto 38.17,63.07
step
clicknpc Zaqali Spear+
|tip They look like large spears in the stone next to handholds on the wall.
|tip Click handholds to move up the wall and excavate supplies.
|tip Move quickly past Rockworm Hatchlings which causes you to lose grip.
Collect #7# Zaqali Spears |q 75058/3 |goto 38.17,63.07
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5642
Enter the cave |goto Zaralek Cavern/0 54.66,65.95 < 10 |walk
accept Spinmarrow##75276 |goto Zaralek Cavern/0 53.10,64.23
|tip You will accept this quest automatically.
|tip Inside the cave.
|polish
step
kill Spinmarrow##203480 |q 75276/1 |goto 53.10,64.23
|tip Inside the cave.
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5699
accept Stress Express##75156 |goto Zaralek Cavern/0 65.60,51.15
|tip You will accept this quest automatically.
step
map Zaralek Cavern/0
path follow smart; loop off; ants curved; dist 30
path	66.25,49.91	65.50,51.10	64.20,51.01	62.47,50.02	60.54,50.18
path	59.28,53.80	58.27,54.81
kill Busted Wagon##203065
|tip Attack the wagon to cause it to move forward.
Push the Wagon into Loamm |q 75156/1 |goto 62.53,47.65
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5719
accept Strike the Colors##75494 |goto Zaralek Cavern/0 45.12,21.97
|tip You will accept this quest automatically.
|polish
step
click Brimstone Banner+
|tip They look like massive banners hanging from balconies and towers around this area.
|tip They appear on your minimap as yellow dots.
Replace Neltharion's Banners |q 75494/1 |goto 45.12,21.97
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5662
accept Subterrax##75360 |goto Zaralek Cavern/0 38.42,46.51
|tip You will accept this quest automatically.
|tip On top of the ledge.
|polish
step
kill Subterrax##203662 |q 75360/1 |goto 38.42,46.51
|next "Dragon_World_Quest_Emissaries"
step
label quest-75680
accept To a Land Down Under##75680 |goto Zaralek Cavern/0 52.41,66.04
|tip You will accept this quest automatically.
step
talk Explorer Bezzert##201004
Choose _"Begin pet battle."_
Defeat Explorer Bezzert in a Pet Battle |q 75680/1 |goto 52.41,66.04
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5646
accept Underlight Queen##75298 |goto Zaralek Cavern/0 57.79,69.13
|tip You will accept this quest automatically.
|polish
step
kill Underlight Queen##203593 |q 75298/1 |goto 57.79,69.13
|next "Dragon_World_Quest_Emissaries"
step
label quest-75060
accept A Veritable Dumping Ground##75060 |goto Zaralek Cavern/0 51.26,24.38
|tip You will accept this quest automatically.
step
click Climbing Gear
Acquire the Climbing Gear |q 75060/1 |goto 51.26,24.38
step
click Handhold
Find a Handhold on the Cliff |q 75060/2 |goto 51.34,24.43
step
clicknpc Draconic Artifact+
|tip They look like broken tablets in the stone next to handholds on the wall.
|tip Click handholds to move up the wall and excavate supplies.
|tip Move quickly past lava patches which causes you to lose grip.
Collect #7# Draconic Artifacts |q 75060/3 |goto 51.37,24.97
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5664
accept Viridian King##75366 |goto Zaralek Cavern/0 38.86,71.51
|tip You will accept this quest automatically.
|polish
step
kill Viridian King##201029 |q 75366/1 |goto 38.86,71.51
|next "Dragon_World_Quest_Emissaries"
step
label quest-74991
accept We Have Returned##74991 |goto Zaralek Cavern/0 32.89,41.98
|tip You will accept this quest automatically.
stickystart "Plant_Zaqali_Spears_in_Corpses"
step
click Ancient Ebon Spear
Retrieve #4# Ancient Ebon Spears |q 74991/1 |goto 32.89,41.98
step
label "Plant_Zaqali_Spears_in_Corpses"
Kill Zaqali enemies around this area
use the Bundle of Ebon Spears##204365
Plant #8# Zaqali Spears in Corpses |q 74991/2 |goto 32.89,41.98
|next "Dragon_World_Quest_Emissaries"
step
label vignette-5717
accept Whirling Zephyr##74352 |goto Zaralek Cavern/0 58.23,67.40
|tip You will accept this quest automatically.
step
Kill enemies around this area
collect Hurricane Scepter##203706 |n
clicknpc Lesser Storm Pylon##201299
|tip Destroy the lessor pylons with Hurricane Scepters to remove the greater pylon shield.
clicknpc Greater Storm Pylon##201262
Destroy the Greater Pylon |q 74352/1 |goto 58.23,67.40
|next "Dragon_World_Quest_Emissaries"
step
label quest-74892
accept Zaqali Elders##74892 |goto Zaralek Cavern/0 27.55,44.56
|tip You will accept this quest automatically.
step
kill Vakan##199855
kill Gholna##199853
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid standing in "Incineration" areas on the ground. |grouprole EVERYONE
|tip Avoid standing in "Scorching Eclipse" areas on the ground. |grouprole EVERYONE
|tip Be sure to hit each mob once to get credit for the kill. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip Random players will receiving stacking "Searing Touch" debuffs and require extra healing. |grouprole HEALER
|tip Random players will receiving stacking "Burning SHadows" debuffs and require extra healing. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Swap threat before the debuffs stack become too much for you to manage. |grouprole TANK
|tip Swap threat before the debuffs stack become too much for you to manage. |grouprole TANK
|tip Tank them apart so they don't gain the "Empowered Rivalry" buff. |grouprole TANK
Defeat the Zaqali Elders |q 74892 |goto 27.55,44.56
|next "Dragon_World_Quest_Emissaries"
step
label quest-74989
accept Zealous Defenses##74989 |goto Zaralek Cavern/0 29.25,50.17
|tip You will accept this quest automatically.
stickystart "Slay_Zaqali_or_Primalist_Enemies"
step
click Shrine Ward+
|tip They look like totems with flaming orbs above them around this area.
Destroy #5# Shrine Wards |q 74989/2 |goto 29.25,50.17
step
label "Slay_Zaqali_or_Primalist_Enemies"
Kill Zaqali and Primalist enemies around this area
Slay #8# Zaqali or Primalist Enemies |q 74989/1 |goto 29.25,50.17
|next "Dragon_World_Quest_Emissaries"
step
label "Dragon_World_Quest_Emissaries"
#include "Dragon_World_Quest_Emissaries"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Dragonscale Expedition\\Dragonscale Basecamp Weekly Quests",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various weekly Wanted quests in Dragonscale Basecamp.",
condition_suggested=function() return factionrenown(2507) < 25 end,
patch='100002',
},[[
step
label "Begin_Dailies"
Click posters around this area
|tip Two wanted posters offer one quest each per week.
accept Wanted: Earthbound Primordial Core##71001 |goto The Waking Shores/0 47.70,82.76 |only if questpossible |or 2
accept Wanted: Disoriented Wishtail##71007 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Everblazing Fireheart##70975 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Fangfall##71005 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Fenistrasza's Skull##70995 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Lost Tuskarr Kite##70992 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Ohuna Mass-Binding Totem##71004 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Ruby Lifeband##70997 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Stoneheart's Stone Heart##71008 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Temporal Spyglass##71010 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Torrential Lily##71011 |goto 47.70,82.76 |only if questpossible |or 2
accept Wanted: Watcher's Golden Girdle##70965 |goto 47.70,82.76 |only if questpossible |or 2
Accept the Daily Quests |complete false |goto 47.70,82.76 |or 2
step
kill Prozela Galeshot##193669
collect Ohuna Mass-Binding Totem##200134 |q 71004/1 |goto Ohn'ahran Plains/0 59.92,66.95
|only if haveq(71004) or completedq(71004)
step
kill Lookout Mordren##193668
|tip Inside the top of the tower.
collect Temporal Spyglass##200122 |q 71010/1 |goto Thaldraszus/0 36.80,85.57
|only if haveq(71010) or completedq(71010)
step
Enter the cave |goto The Azure Span/0 60.87,50.01 < 10 |walk
kill Stoneheart##187387
|tip Inside the cave.
collect Stoneheart's Stone Heart##200125 |q 71008/1 |goto The Azure Span/0 60.52,49.49
|only if haveq(71008) or completedq(71008)
step
kill Firava the Rekindler##195915
|tip This enemy is elite and may require a group.
|tip It walks all over the lava area.
collect Everblazing Fireheart##200119 |q 70975/1 |goto The Waking Shores/0 55.54,22.09
|only if haveq(70975) or completedq(70975)
step
talk Tarjin the Blind##196214
accept Tarjin's Tales##70779 |goto 16.17,62.61
|only if haveq(70995) or completedq(70995)
step
kill Disoriented Watcher##187745
|tip This enemy is elite and may require a group.
collect Watcher's Golden Girdle##200117 |q 70965/1 |goto 67.06,57.02
|only if haveq(70965) or completedq(70965)
step
Kill Proto-Dragon enemies around this area
|tip Only elite proto-dragons drop Impressive Dragon Skulls.
collect 5 Impressive Dragon Skull##199822 |q 70779/1 |goto 55.93,82.22
|only if haveq(70995) or completedq(70995)
step
talk Tarjin the Blind##196214
turnin Tarjin's Tales##70779 |goto 16.17,62.61
|only if haveq(70995) or completedq(70995)
step
click Fenistrasza's Skull##381636
collect Fenistrasza's Skull##200143 |q 70995/1 |goto 16.26,62.88
|only if haveq(70995) or completedq(70995)
step
clicknpc Lost Tuskarr Kite##196762
|tip Check the time until the boat arrives.
|tip You can come back to this location at that time or you can travel around and attempt to find it.
|tip You can only click the kite when the ship is not in motion and it falls in the water.
collect Lost Tuskarr Kite##200162 |q 70992/1 |goto 45.38,25.80
It will fall in the water here [44.85,25.90]
|only if haveq(70992) or completedq(70992)
step
kill Alora Mistbreeze##189243
collect Torrential Lily##200123 |q 71011/1 |goto Thaldraszus/0 54.62,62.64
|only if haveq(71011) or completedq(71011)
step
Kill enemies around this area
collect 100 Fragments of Fangfall##200140 |q 71005/1 |goto Ohn'ahran Plains/0 63.46,15.94
|only if haveq(71005) or completedq(71005)
step
kill Cascade##186962
collect Disoriented Wishtail##200124 |q 71007/1 |goto The Azure Span/0 23.49,33.24
|only if haveq(71007) or completedq(71007)
step
click Ruby Lifeband
|tip It looks like a piece of jewelry in a box on a table on the top ring.
collect Ruby Lifeband##200179 |q 70997/1 |goto Ruby Life Pools/1 43.65,63.88
|only if haveq(70997) or completedq(70997)
step
click Earthbound Primordial Core##381660
|tip In the room with Warlord Sargha.
collect Earthbound Primordial Core##200200 |q 71001/1 |goto Neltharus/0 47.35,72.89
|only if haveq(71001) or completedq(71001)
step
talk Cataloger Jakes##189226
|tip Inside the tent.
turnin Wanted: Disoriented Wishtail##71007 |goto The Waking Shores/0 47.11,82.58 |only if haveq(71007) or completedq(71007)
turnin Wanted: Earthbound Primordial Core##71001 |goto 47.11,82.58 |only if haveq(71001) or completedq(71001)
turnin Wanted: Everblazing Fireheart##70975 |goto 47.11,82.58 |only if haveq(70975) or completedq(70975)
turnin Wanted: Fangfall##71005 |goto 47.11,82.58 |only if haveq(71005) or completedq(71005)
turnin Wanted: Fenistrasza's Skull##70995 |goto 47.11,82.58 |only if haveq(70995) or completedq(70995)
turnin Wanted: Lost Tuskarr Kite##70992 |goto 47.11,82.58 |only if haveq(70992) or completedq(70992)
turnin Wanted: Ohuna Mass-Binding Totem##71004 |goto 47.11,82.58 |only if haveq(71004) or completedq(71004)
turnin Wanted: Ruby Lifeband##70997 |goto 47.11,82.58 |only if haveq(70997) or completedq(70997)
turnin Wanted: Stoneheart's Stone Heart##71008 |goto 47.11,82.58 |only if haveq(71008) or completedq(71008)
turnin Wanted: Temporal Spyglass##71010 |goto 47.11,82.58 |only if haveq(71010) or completedq(71010)
turnin Wanted: Torrential Lily##71011 |goto 47.11,82.58 |only if haveq(71011) or completedq(71011)
turnin Wanted: Watcher's Golden Girdle##70965 |goto 47.11,82.58 |only if haveq(70965) or completedq(70965)
|only if haveq(71007,71001,70975,71005,70995,70992,71004,70997,71008,71010,71011,70965) or completedq(71007,71001,70975,71005,70995,70992,71004,70997,71008,71010,71011,70965)
step
You have completed all weekly quests in the Dragonscale Basecamp
|tip This guide will reset when more become available.
'|complete not completedq(71007,71001,70975,71005,70995,70992,71004,70997,71008,71010,71011,70965) |next "Begin_Dailies"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Iskaara Tuskarr\\Grimtusk's Fishing Hole",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Grimtusk's fishing location.",
condition_suggested=function() return level == 70 and completedq(70941) and factionrenown(2503) < 25 and areapoi(2024,7266) end,
startlevel=62,
areapoiid=7266,
areapoitype="Fishing Hole",
patch='100002',
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto 13.94,49.24
step
Wait for Grimtusk's Fishing Hole to Become Active |complete areapoi(2024,7266)
step
label "Begin_Daily_Quests"
talk Gruff Fisher##196860
accept Subglacial Refill##72069 |goto 58.62,34.50
|tip Completing this quest will increase the Grimtusk's fishing hole stock quantity by 20.
|tip You may want to fish it down some before proceeding.
step
talk Gruff Fisher##196860
accept Net Worth##71191 |goto 58.62,34.50 |or
|tip Completing this quest will increase the Grimtusk's fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
Click Here if this Quest Is Unavailable |confirm |or
step
clicknpc Stock Fish##195340
|tip They look like groups of small fish around the water.
use Throw Net##198855
|tip Use it on schools of stock fish.
Collect #3# Stock Fish |q 72069/1 |goto 58.68,54.72
step
click Ice Crack!
|tip They look like light blue cracks in the ice around this area.
|tip They appear on your minimap as yellow fish.
|tip Doing this will open an Ice Hole that you can drop fish into.
extraaction Release Fish##385852
|tip Drop fish near the hole you just opened.
Drop #3# Fish From Above |q 72069/2 |goto 58.27,32.33
step
click Ice Crack!
|tip They look like light blue cracks in the ice around this area.
|tip They appear on your minimap as yellow fish.
click Ice Fishing Hole
|tip Click the fishing hole to fish in it until you fish up the net.
collect Gruff Fisher's Net##200646 |q 71191/1 |goto 56.95,33.20
|only if haveq(71191) or completedq(71191)
step
talk Gruff Fisher##196860
turnin Net Worth##71191 |goto 58.62,34.50|only if haveq(71191) or completedq(71191)
|tip Completing this quest will increase the Grimtusk's fishing hole stock quantityby 10.|only if haveq(71191) or completedq(71191)
turnin Subglacial Refill##72069 |goto 58.62,34.50
|tip Completing this quest will increase the Grimtusk's fishing hole stock quantity by 20.
|tip You may want to fish it down some before proceeding.
step
talk Young Quickhands##196840 |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
accept Catch and Release: Scalebelly Mackerel##70199 |goto 58.81,34.78 |repeatable |only if itemcount(194730) >= 20 and not completedq(72828)
accept Catch and Release: Thousandbite Piranha##70200 |goto 58.81,34.78 |repeatable |only if itemcount(194966) >= 20 and not completedq(72827)
accept Catch and Release: Aileron Seamoth##70201 |goto 58.81,34.78 |repeatable |only if itemcount(194967) >= 20 and not completedq(72826)
accept Catch and Release: Cerulean Spinefish##70202 |goto 58.81,34.78 |repeatable |only if itemcount(194968) >= 20 and not completedq(72825)
accept Catch and Release: Temporal Dragonhead##70203 |goto 58.81,34.78 |repeatable |only if itemcount(194969) >= 20 and not completedq(72824)
accept Catch and Release: Islefin Dorado##70935 |goto 58.81,34.78 |repeatable |only if itemcount(194970) >= 20 and not completedq(72823)
|tip |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
You have completed the available daily quests at the Grimtusk's fishing hole
|tip This guide will reset when more become available.
|tip You can only earn reputation for turning in 1 Catch and Release quest of each type per week.
|tip You have completed the following turnins for the week: |only if completedq(72828,72827,72826,72825,72824,72823)
|tip Scalebelly Mackerel |only if completedq(72828)
|tip Thousandbite Piranha |only if completedq(72827)
|tip Aileron Seamoth |only if completedq(72826)
|tip Cerulean Spinefish |only if completedq(72825)
|tip Temporal Dragonhead |only if completedq(72824)
|tip Islefin Dorado |only if completedq(72823)
'|complete not completedq(72069) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Iskaara Tuskarr\\River Mouth Fishing Hole",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the River Mouth fishing location.",
condition_suggested=function() return level == 70 and completedq(70941) and factionrenown(2503) < 25 and areapoi(2022,7086) end,
startlevel=62,
areapoiid=7086,
areapoitype="Fishing Hole",
patch='100002',
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto 13.94,49.24
step
Wait for the River Mouth Fishing Hole to Become Active |complete areapoi(2022,7086)
step
label "Begin_Daily_Quests"
talk Brix Rocketcast##195444
accept Otter Devastation##70450 |goto The Waking Shores/0 63.63,75.01 |or
|tip Completing this quest will increase the River Mouth fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
Click Here if this Quest Is Unavailable |confirm |or
step
talk Fisherman Pasqaa##195338
accept Flying Fish##70438 |goto 63.76,76.58
|tip Completing this quest will increase the River Mouth fishing hole stock quantity by 20.
|tip You may want to fish it down some before proceeding.
step
clicknpc Pesky Ottuk##195442
|tip Swim near them to scare them off.
Scare Off #10# Pesky Ottuks |q 70450/1 |goto 63.99,77.37
|only if haveq(70450) or completedq(70450)
step
talk Brix Rocketcast##195444
turnin Otter Devastation##70450 |goto 63.63,75.01
|tip Completing this quest will increase the River Mouth fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
|only if haveq(70450) or completedq(70450)
step
clicknpc Stock Fish##195340
|tip They look like groups of small fish near the shore all over the riverbank.
use Throw Net##198855
|tip Use it on schools of stock fish.
Collect #3# Stock Fish |q 70438/1 |goto 74.22,67.49
step
extraaction Release Fish##385852
|tip Mount up and use your dragonriding.
Drop #3# Fish From Above |q 70438/2 |goto 64.78,77.10
step
talk Fisherman Pasqaa##195338
turnin Flying Fish##70438 |goto 63.76,76.58
|tip Completing this quest will increase the River Mouth fishing hole stock quantity by 20.
|tip You may want to fish it down some before proceeding.
step
talk Khuri##194584 |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
accept Catch and Release: Scalebelly Mackerel##70199 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194730) >= 20 and not completedq(72828)
accept Catch and Release: Thousandbite Piranha##70200 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194966) >= 20 and not completedq(72827)
accept Catch and Release: Aileron Seamoth##70201 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194967) >= 20 and not completedq(72826)
accept Catch and Release: Cerulean Spinefish##70202 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194968) >= 20 and not completedq(72825)
accept Catch and Release: Temporal Dragonhead##70203 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194969) >= 20 and not completedq(72824)
accept Catch and Release: Islefin Dorado##70935 |goto 63.32,75.82 |repeatable |noautoaccept |only if itemcount(194970) >= 20 and not completedq(72823)
|tip |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
You have completed the available daily quests at the River Mouth fishing hole
|tip This guide will reset when more become available.
|tip You can only earn reputation for turning in 1 Catch and Release quest of each type per week.
|tip You have completed the following turnins for the week: |only if completedq(72828,72827,72826,72825,72824,72823)
|tip Scalebelly Mackerel |only if completedq(72828)
|tip Thousandbite Piranha |only if completedq(72827)
|tip Aileron Seamoth |only if completedq(72826)
|tip Cerulean Spinefish |only if completedq(72825)
|tip Temporal Dragonhead |only if completedq(72824)
|tip Islefin Dorado |only if completedq(72823)
'|complete not completedq(70438) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Iskaara Tuskarr\\Tyrhold Fishing Hole",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Tyrhold fishing location.",
condition_suggested=function() return level == 70 and completedq(70941) and factionrenown(2503) < 25 and areapoi(2025,7271) end,
startlevel=62,
areapoiid=7271,
areapoitype="Fishing Hole",
patch='100002',
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto 13.94,49.24
step
Wait for the Tyrhold Fishing Hole to Become Active |complete areapoi(2025,7271)
step
label "Begin_Daily_Quests"
talk Cautious Fisher##197597
accept Underwater Menace##71193 |goto Thaldraszus/0 57.31,65.32
|tip Completing this quest will increase the Tyrhold fishing hole stock quantity by 10.
accept Highland Habitat##72074 |goto 56.57.31,65.32
|tip Completing this quest will increase the Tyrhold fishing hole stock quantity 20.
|tip You may want to fish it down some before proceeding.
step
cast Fishing##131474
|tip Fish in open water locations or in fishing pools.
|tip Fishing holes have a higher chance to drop these.
collect 5 Ominous Conch##194701 |q 71193
step
use Ominous Conch##194701
kill Astray Splasher##197411
|tip It spawns from the water.
|tip This enemy is elite and may require a group.
collect Grim Morsel##200667 |q 71193/1 |goto 57.31,65.46
step
talk Cautious Fisher##197597
turnin Underwater Menace##71193 |goto 57.31,65.32
|tip Completing this quest will increase the Tyrhold fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
step
clicknpc Stock Fish##195340
|tip They look like groups of small fish near the shore all over the riverbank.
|tip They appear on your minimap as yellow dots.
use Throw Net##198855
|tip Use it on schools of stock fish.
Collect #3# Stock Fish |q 72074/1 |goto 56.99,62.28
step
extraaction Release Fish##385852
|tip Mount up and use your dragonriding.
Drop #3# Fish From Above |q 72074/2 |goto 57.01,65.33
step
talk Cautious Fisher##197597
turnin Highland Habitat##72074 |goto 57.31,65.32
|tip Completing this quest will increase the Tyrhold fishing hole stock quantity 20.
|tip You may want to fish it down some before proceeding.
step
talk Daring Fisher##197645 |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
accept Catch and Release: Scalebelly Mackerel##70199 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194730) >= 20 and not completedq(72828)
accept Catch and Release: Thousandbite Piranha##70200 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194966) >= 20 and not completedq(72827)
accept Catch and Release: Aileron Seamoth##70201 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194967) >= 20 and not completedq(72826)
accept Catch and Release: Cerulean Spinefish##70202 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194968) >= 20 and not completedq(72825)
accept Catch and Release: Temporal Dragonhead##70203 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194969) >= 20 and not completedq(72824)
accept Catch and Release: Islefin Dorado##70935 |goto 56.88,64.78 |repeatable |noautoaccept |only if itemcount(194970) >= 20 and not completedq(72823)
|tip |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
You have completed the available daily quests at the Tyrhold fishing hole
|tip This guide will reset when more become available.
|tip You can only earn reputation for turning in 1 Catch and Release quest of each type per week.
|tip You have completed the following turnins for the week: |only if completedq(72828,72827,72826,72825,72824,72823)
|tip Scalebelly Mackerel |only if completedq(72828)
|tip Thousandbite Piranha |only if completedq(72827)
|tip Aileron Seamoth |only if completedq(72826)
|tip Cerulean Spinefish |only if completedq(72825)
|tip Temporal Dragonhead |only if completedq(72824)
|tip Islefin Dorado |only if completedq(72823)
'|complete not completedq(71193,72074) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Iskaara Tuskarr\\Roaring Dragonspring Fishing Hole",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Roaring Dragonspring fishing location.",
condition_suggested=function() return level == 70 and completedq(70941) and factionrenown(2503) < 25 and areapoi(2023,7270) end,
startlevel=62,
areapoiid=7270,
areapoitype="Fishing Hole",
patch='100002',
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto 13.94,49.24
step
Wait for the Roaring Dragonspring Fishing Hole to Become Active |complete areapoi(2023,7270)
step
label "Begin_Daily_Quests"
talk Thrifty Fisher##198766
accept Predator Control##71192 |goto Ohn'ahran Plains/0 80.90,78.48
|tip Completing this quest will increase the Roaring Dragonspring fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
accept Dragonsprings Drop##72072 |goto 80.90,78.48
|tip Completing this quest will increase the Roaring Dragonspring fishing hole stock quantity 20.
|tip You may want to fish it down some before proceeding.
stickystart "Collect_Stock_Fish"
step
click Place Effigy
|tip They look like small yellow totems on the ground near the water.
Set Up the Scary Effigy |q 71192/1 |goto 83.97,78.03 |count 1
step
click Place Effigy
|tip They look like small yellow totems on the ground near the water.
Set Up the Scary Effigy |q 71192/1 |goto 82.91,76.90 |count 2
step
click Place Effigy
|tip They look like small yellow totems on the ground near the water.
Set Up the Scary Effigy |q 71192/1 |goto 83.01,76.04 |count 3
step
click Place Effigy
|tip They look like small yellow totems on the ground near the water.
Set Up the Scary Effigy |q 71192/1 |goto 83.50,76.42 |count 4
step
click Place Effigy
|tip They look like small yellow totems on the ground near the water.
Set Up the Scary Effigy |q 71192/1 |goto 84.19,74.75 |count 5
step
label "Collect_Stock_Fish"
clicknpc Stock Fish##195340
|tip They look like groups of small fish near the shore all over the riverbank.
use Throw Net##198855
|tip Use it on schools of stock fish.
Collect #3# Stock Fish |q 72072/1 |goto 83.11,75.37
step
extraaction Release Fish##385852
|tip Mount up and use your dragonriding.
Drop #3# Fish From Above |q 72072/2 |goto 80.81,78.17
step
talk Thrifty Fisher##198766
turnin Predator Control##71192 |goto 80.90,78.48
|tip Completing this quest will increase the Roaring Dragonspring fishing hole stock quantity by 10.
|tip You may want to fish it down some before proceeding.
turnin Dragonsprings Drop##72072 |goto 80.90,78.48
|tip Completing this quest will increase the Roaring Dragonspring fishing hole stock quantity 20.
|tip You may want to fish it down some before proceeding.
step
talk Thrifty Fisher##198766 |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
accept Catch and Release: Scalebelly Mackerel##70199 |goto 80.90,78.48 |repeatable |only if itemcount(194730) >= 20 and not completedq(72828)
accept Catch and Release: Thousandbite Piranha##70200 |goto 80.90,78.48 |repeatable |only if itemcount(194966) >= 20 and not completedq(72827)
accept Catch and Release: Aileron Seamoth##70201 |goto 80.90,78.48 |repeatable |only if itemcount(194967) >= 20 and not completedq(72826)
accept Catch and Release: Cerulean Spinefish##70202 |goto 80.90,78.48 |repeatable |only if itemcount(194968) >= 20 and not completedq(72825)
accept Catch and Release: Temporal Dragonhead##70203 |goto 80.90,78.48 |repeatable |only if itemcount(194969) >= 20 and not completedq(72824)
accept Catch and Release: Islefin Dorado##70935 |goto 80.90,78.48 |repeatable |only if itemcount(194970) >= 20 and not completedq(72823)
|tip |only if (itemcount(194730) >= 20 and not completedq(72828)) or (itemcount(194966) >= 20 and not completedq(72827)) or (itemcount(194967) >= 20 and not completedq(72826)) or (itemcount(194968) >= 20 and not completedq(72825)) or (itemcount(194969) >= 20 and not completedq(72824)) or (itemcount(194970) >= 20 and not completedq(72823))
You have completed the available daily quests at the Roaring Dragonspring fishing hole
|tip This guide will reset when more become available.
|tip You can only earn reputation for turning in 1 Catch and Release quest of each type per week.
|tip You have completed the following turnins for the week: |only if completedq(72828,72827,72826,72825,72824,72823)
|tip Scalebelly Mackerel |only if completedq(72828)
|tip Thousandbite Piranha |only if completedq(72827)
|tip Aileron Seamoth |only if completedq(72826)
|tip Cerulean Spinefish |only if completedq(72825)
|tip Temporal Dragonhead |only if completedq(72824)
|tip Islefin Dorado |only if completedq(72823)
'|complete not completedq(71192,72072) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Rusza'thar Reach Aylaag Outpost location.",
condition_suggested=function() return level == 62 and factionrenown(2503) >= 4 and factionrenown(2503) < 25 and areapoitime(7102) > 0 end,
startlevel=62,
areapoiid=7102,
areapoitype="Aylaag Outpost",
patch='100002',
},[[
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
Wait for the Aylaag Centaur to Set Up Camp at Rusza'thar Reach |complete areapoitime(7102) > 0
|tip The Aylaag centaur are currently travelling. |only if areapoitime(7101) == 0 and areapoitime(7102) == 0 and areapoitime(7103) == 0
|tip |only if areapoitime(7102) == 0
Click Here to Load the "Aylaag Outpost Daily Quests (Eaglewatch Outpost)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)" |only if areapoitime(7103) > 0
|tip The Aylaag centaur are currently camped at Eaglewatch Outpost. |only if areapoitime(7103) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Pinewood Post)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)" |only if areapoitime(7101) > 0
|tip The Aylaag centaur are currently camped at Pinewood Post. |only if areapoitime(7101) > 0
|tip You need to be inside Ohn'ahran Plains to detect its location.
step
label "Begin_Dailies"
talk Hadari Khan##185853
|tip Inside the building.
accept The Best Defense...##65796 |goto Ohn'ahran Plains/0 71.39,31.04 |only if questpossible |or
Accept the Daily Quest |complete false or completedq(65796) |goto 71.39,31.04 |or
step
talk Barnak of the Reeds##185867
|tip Inside the building.
accept Where Rivers Sleep##65789 |goto 71.35,31.02 |only if questpossible |or
Accept the Daily Quest |complete false or completedq(65789) |goto 71.35,31.02 |or
step
talk Huntmaster Malkik##185870
accept The Otter Side##65784 |goto 71.20,31.55 |only if questpossible |or 2
accept Counting Argali##66698 |goto 71.20,31.55 |only if questpossible |or 2
Accept the Daily Quest |complete false or completedq(65784,66698) |goto 71.20,31.55 |or 2
step
talk Aylaag Shepherd##190260
Speak with the Aylaag Shepherd |q 66698/1 |goto 73.85,31.28
|only if haveq(66698) or completedq(66698)
step
Return #2# Wandering Argali to the Herd |q 66698/2 |goto 76.74,31.14
|tip Find a wandering Argali and walk towards it.
|tip It will run the opposite direction of you.
|tip Run it back to the main herd.
You can find the herd at [74.51,30.99]
You can find another Wandering Argali at [75.90,34.06]
|only if haveq(66698) or completedq(66698)
step
click Otter Burrow+
|tip They look like unstable patches of earth on the ground.
clicknpc Gargantuan River Otter##187977+
|tip Use the "Hold Tight" ability when the otter begins to run around.
Bring #3# Gargantuan River Otters to the Huntmaster |q 65784/1 |goto 75.59,25.39
Return them to Malkik here [71.21,31.55]
|only if haveq(65784) or completedq(65784)
stickystart "Collect_Mudfin_Pouches"
step
click Fragrant Bloom##376034+
|tip They look like large plants around this area.
collect 8 Fragrant Bloom##191839 |q 65789/1 |goto 82.44,27.13
|only if haveq(65789) or completedq(65789)
step
label "Collect_Mudfin_Pouches"
Kill enemies around this area
collect 6 Mudfin Pouch##191840 |q 65789/2 |goto 81.87,30.58
|only if haveq(65789) or completedq(65789)
step
kill Sirena the Fangbreaker##185907 |q 65796/1 |goto 76.85,39.83
|tip This enemy is elite and may require a group.
|only if haveq(65796) or completedq(65796)
step
talk Hadari Khan##185853
|tip Inside the building.
turnin The Best Defense...##65796 |goto Ohn'ahran Plains/0 71.39,31.04
|only if haveq(65796) or completedq(65796)
step
talk Barnak of the Reeds##185867
|tip Inside the building.
turnin Where Rivers Sleep##65789 |goto 71.35,31.02
|only if haveq(65789) or completedq(65789)
step
talk Huntmaster Malkik##185870
turnin The Otter Side##65784 |goto 71.20,31.55 |only if haveq(65784) or completedq(65784)
turnin Counting Argali##66698 |goto 71.20,31.55 |only if haveq(66698) or completedq(66698)
|only if haveq(65784,66698) or completedq(65784,66698)
step
You have completed all daily quests in Aylaag Outpost
|tip This guide will reset when more become available.
'|complete not completedq(65796,65789,65784,66698) |next "Begin_Dailies"
step
You have completed all daily quests for the Rusza'thar Reach area Aylaag Outpost |only if areapoitime(7102) > 0
|tip You can only complete these quests once each time the outpost sets up at this location. |only if areapoitime(7102) > 0
|tip This guide will reset when they offer more quests at this location. |only if areapoitime(7102) > 0
The Aylaag centaur are currently travelling and not offering quests |complete false |only if default
Click Here to Load the "Aylaag Outpost Daily Quests (Pinewood Post)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)" |only if areapoitime(7101) > 0
|tip The Aylaag centaur are currently camped at Pinewood Post. |only if areapoitime(7101) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Eaglewatch Outpost)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)" |only if areapoitime(7103) > 0
|tip The Aylaag centaur are currently camped at Eaglewatch Outpost. |only if areapoitime(7103) > 0
'|complete not completedq(65796,65789,65784,66698) and areapoitime(7102) > 0 |next "Begin_Dailies"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Pinewood Post Aylaag Outpost location.",
condition_suggested=function() return level == 62 and factionrenown(2503) >= 4 and factionrenown(2503) < 25 and areapoitime(7101) > 0 end,
startlevel=62,
areapoiid=7101,
areapoitype="Aylaag Outpost",
patch='100002',
},[[
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
Wait for the Aylaag Centaur to Set Up Camp at Pinewood Post |complete areapoitime(7101) > 0
|tip The Aylaag centaur are currently travelling. |only if areapoitime(7101) == 0 and areapoitime(7102) == 0 and areapoitime(7103) == 0
|tip |only if areapoitime(7101) == 0
Click Here to Load the "Aylaag Outpost Daily Quests (Rusza'thar Reach)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)" |only if areapoitime(7102) > 0
|tip The Aylaag centaur are currently camped at Rusza'thar Reach. |only if areapoitime(7102) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Eaglewatch Outpost)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)" |only if areapoitime(7103) > 0
|tip The Aylaag centaur are currently camped at Eaglewatch Outpost. |only if areapoitime(7103) > 0
|tip You need to be inside Ohn'ahran Plains to detect its location.
step
label "Begin_Dailies"
Talk to NPCs around the camp
accept Darkened Clouds##67222 |goto Ohn'ahran Plains/0 70.70,63.05 |only if questpossible |or 4
accept Scaling Ever Higher##70352 |goto 70.70,63.05 |only if questpossible |or 4
accept Blood of Dragons##70279 |goto 70.70,63.05 |only if questpossible |or 4
accept If There's Wool There's a Way##70990 |goto 70.70,63.05 |only if questpossible |or 4
accept Of Wind and Water##67034 |goto 70.70,63.05 |only if questpossible |or 4
Accept the Daily Quest |complete false or completedq(67222,70352,70279,70990,67034) |goto 70.70,63.05 |or 4
step
use the Aylaag Skinning Shear##200153
|tip Use it on Wild Cliffhoofs around this area.
|tip Some of them will attack you.
collect 8 Wild Argali Wool##200149 |q 70990/1 |goto 68.25,66.83
|only if haveq(70990) or completedq(70990)
stickystart "Slay_Windsong_Rise_Forces"
step
click Storm Scepter+
Destroy #6# Storm Scepters |q 67222/2 |goto 59.62,65.71
|only if haveq(67222) or completedq(67222)
step
label "Slay_Windsong_Rise_Forces"
Kill Nokud and Primalist enemies around this area
Slay#12# Windsong Rise Forces |q 67222/1 |goto 59.62,65.71
|only if haveq(67222) or completedq(67222)
step
Enter the cave |goto 62.08,77.22 < 20 |walk
kill Karkidan##193725 |q 70279/1 |goto 61.67,79.35
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|only if haveq(70279) or completedq(70279)
step
extraaction Call for Fire##385191
|tip Use it on Territorial Proto Drakes flying around in the air.
kill 5 Territorial Proto Drake##191778 |q 70352/2 |goto 81.88,76.16
You can find more around:
[83.22,68.95]
[77.93,76.42]
|only if haveq(70352) or completedq(70352)
stickystart "Collect_Springborn_Core"
step
click Windtossed Feather##377560+
|tip They look like small feathers surrounded by swirling wind on the ground around this area.
|tip It helps to zoom your camera in slightly to see them better.
collect 5 Windtossed Feather##194452 |q 67034/2 |goto 78.67,78.24
|only if haveq(67034) or completedq(67034)
step
label "Collect_Springborn_Core"
kill Sulfuric Rager##191682+
kill Hissing Springsoul##191712+
collect 8 Springborn Core##194509 |q 67034/1 |goto 78.67,78.24
|only if haveq(67034) or completedq(67034)
step
Kill Hornswog enemies around this area
Slay #10# Hornswogs |q 70352/1 |goto 81.66,71.78
You can find more around [79.25,75.98] |notinsticky
|only if haveq(70352) or completedq(70352)
step
talk Barnak of the Reeds##185867
|tip Inside the building.
turnin Of Wind and Water##67034 |goto 70.94,62.62
|only if haveq(67034) or completedq(67034)
step
talk Hadari Khan##185853
|tip Inside the building.
turnin Darkened Clouds##67222 |goto Ohn'ahran Plains/0 70.98,62.58
|only if haveq(67222) or completedq(67222)
step
talk Toluiqi##185881
turnin Scaling Ever Higher##70352 |goto 70.56,62.85
|only if haveq(70352) or completedq(70352)
step
talk Huntmaster Malkik##185870
turnin Blood of Dragons##70279 |goto 70.65,63.58 |only if haveq(70279) or completedq(70279)
turnin If There's Wool There's a Way##70990 |goto 70.65,63.58 |only if haveq(70990) or completedq(70990)
|only if haveq(70279,70990) or completedq(70279,70990)
step
You have completed all daily quests for the Pinewood Post area Aylaag Outpost |only if areapoitime(7101) > 0
|tip You can only complete these quests once each time the outpost sets up at this location. |only if areapoitime(7101) > 0
|tip This guide will reset when they offer more quests at this location. |only if areapoitime(7101) > 0
The Aylaag centaur are currently travelling and not offering quests |complete false |only if default
Click Here to Load the "Aylaag Outpost Daily Quests (Rusza'thar Reach)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)" |only if areapoitime(7102) > 0
|tip The Aylaag centaur are currently camped at Rusza'thar Reach. |only if areapoitime(7102) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Eaglewatch Outpost)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)" |only if areapoitime(7103) > 0
|tip The Aylaag centaur are currently camped at Eaglewatch Outpost. |only if areapoitime(7103) > 0
'|complete not completedq(67222,70352,70279,70990,67034) and areapoitime(7101) > 0 |next "Begin_Dailies"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Eaglewatch Outpost Aylaag Outpost location.",
condition_suggested=function() return level == 62 and factionrenown(2503) >= 4 and factionrenown(2503) < 25 and areapoitime(7103) > 0 end,
startlevel=62,
areapoiid=7103,
areapoitype="Aylaag Outpost",
patch='100002',
},[[
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
Wait for the Aylaag Centaur to Set Up Camp at Eaglewatch Outpost |complete areapoitime(7103) > 0
|tip The Aylaag centaur are currently travelling. |only if areapoitime(7101) == 0 and areapoitime(7102) == 0 and areapoitime(7103) == 0
|tip |only if areapoitime(7103) == 0
Click Here to Load the "Aylaag Outpost Daily Quests (Rusza'thar Reach)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)" |only if areapoitime(7102) > 0
|tip The Aylaag centaur are currently camped at Rusza'thar Reach. |only if areapoitime(7102) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Pinewood Post)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)" |only if areapoitime(7101) > 0
|tip The Aylaag centaur are currently camped at Pinewood Post. |only if areapoitime(7101) > 0
|tip You need to be inside Ohn'ahran Plains to detect its location.
step
label "Begin_Dailies"
Talk to NPCs around Eaglewatch Outpost
accept An Opportunistic Approach##65798 |goto Ohn'ahran Plains/0 55.66,52.11 |only if questpossible |or 4
accept Tradition Not Forgotten##70210 |goto 55.66,52.11 |only if questpossible |or 4
accept Thundering Plains##67605 |goto 55.66,52.11 |only if questpossible |or 4
accept Duck, Duck, Trap##71241 |goto 55.66,52.11 |only if questpossible |or 4
accept Bakar Dream of Lost Argali##70701 |goto 55.66,52.11 |only if questpossible |or 4
accept Draconic Defensive##70299 |goto 55.66,52.11 |only if questpossible |or 4
Accept the Daily Quests |complete false or completedq(65798,70210,67605,71241) |goto 55.66,52.11 |or 4
step
talk Aylaag Shepherd##196041
Speak with the Aylaag Shepherd |q 70701/1 |goto 54.66,52.11
|only if haveq(70701) or completedq(70701)
stickystart "Collect_Ayanga's_Horn"
step
clicknpc Wandering Argali##199874
Return #3# Wandering Argali to the herd |q 70701/2 |goto 53.56,50.04
|tip Find a wandering Argali and walk towards it.
|tip It will run the opposite direction of you.
|tip Run it back to the main herd.
You can find the herd at [54.28,52.04]
You can find another Wandering Argali at [56.65,54.81]
|only if haveq(70701) or completedq(70701)
step
label "Collect_Ayanga's_Horn"
kill Ayanga##192961
|tip This enemy is elite and may require a group.
collect Ayanga's Horn##195386 |q 67605/1 |goto 52.41,49.96
|only if haveq(67605) or completedq(67605)
step
kill Bluebill Waddler##192947+
collect Bluebill Meat##200674 |n
click Sprung Trap
|tip They look like small steel traps on the ground around this area.
|tip Each trap requires one Bluebill Meat to reset.
Reset #6# Traps |q 71241/1 |goto 43.11,46.38
|only if haveq(71241) or completedq(71241)
stickystart "Slay_Nokhud_Forces"
step
Click Weapons and Armor around this area
|tip Click the various weapons and shields found throughout the camp.
collect 8 Nokhud Armament##199477 |q 65798/2 |goto 40.94,39.54
|only if haveq(65798) or completedq(65798)
step
label "Slay_Nokhud_Forces"
Kill Nokud and Primalist enemies around this area
Slay#10# Nokhud Forces |q 65798/1 |goto 40.94,39.54
|only if haveq(65798) or completedq(65798)
stickystart "Collect_Howling_Hearts"
step
Kill Primalist enemies around this area
Slay#10# Primalist Forces |q 70299/2 |goto 23.40,37.45
|only if haveq(70299) or completedq(70299)
step
label "Collect_Howling_Hearts"
Kill Invading enemies around this area
collect 8 Howling Heart##198691 |q 70299/1 |goto 23.40,37.45
|only if haveq(70299) or completedq(70299)
stickystart "Slay_Risen_Beasts"
step
click Aylaag Incense+
|tip They look like bowls filled with incense sticks.
Place #6# Aylaag Incense |q 70210/1 |goto 34.48,67.78
You can find more around [79.25,75.98] |notinsticky
|only if haveq(70210) or completedq(70210)
step
label "Slay_Risen_Beasts"
Kill Risen enemies around this area
Slay #8# Risen Beasts |q 70210/2 |goto 34.48,67.78
|only if haveq(70210) or completedq(70210)
step
talk Hadari Khan##185853
|tip Inside the building.
turnin An Opportunistic Approach##65798 |goto Ohn'ahran Plains/0 55.91,51.79
|only if haveq(65798) or completedq(65798)
step
talk Barnak of the Reeds##185867
turnin Tradition Not Forgotten##70210 |goto 55.91,51.88
turnin Draconic Defensive##70299 |goto 55.91,51.88
|only if haveq(70210) or completedq(70210)
step
talk Huntmaster Malkik##185870
turnin Thundering Plains##67605 |goto 55.59,52.52 |only if haveq(67605) or completedq(67605)
turnin Duck, Duck, Trap##71241 |goto 55.59,52.52 |only if haveq(71241) or completedq(71241)
turnin Bakar Dream of Lost Argali##70701 |goto 55.59,52.52 |only if haveq(70701) or completedq(70701)
|only if haveq(67605,71241,70701) or completedq(67605,71241,70701)
step
You have completed all daily quests in Aylaag Outpost
|tip This guide will reset when more become available.
'|complete not completedq(65798,70210,67605,71241) |next "Begin_Dailies"
step
You have completed all daily quests for the Eaglewatch Outpost area Aylaag Outpost |only if areapoitime(7103) > 0
|tip You can only complete these quests once each time the outpost sets up at this location. |only if areapoitime(7103) > 0
|tip This guide will reset when they offer more quests at this location. |only if areapoitime(7103) > 0
The Aylaag centaur are currently travelling and not offering quests |complete false |only if default
Click Here to Load the "Aylaag Outpost Daily Quests (Rusza'thar Reach)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)" |only if areapoitime(7102) > 0
|tip The Aylaag centaur are currently camped at Rusza'thar Reach. |only if areapoitime(7102) > 0
Click Here to Load the "Aylaag Outpost Daily Quests (Pinewood Post)" Guide |confirm |next "Daily Guides\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)" |only if areapoitime(7101) > 0
|tip The Aylaag centaur are currently camped at Pinewood Post. |only if areapoitime(7101) > 0
'|complete not completedq(65798,70210,67605,71241) and areapoitime(7103) > 0 |next "Begin_Dailies"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\The Obsidian Citadel Weekly Quests",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various weekly quests in the Obsidian Citadel \n"..
"for Sabellian and Wrathion.",
condition_suggested=function() return level == 70 end,
startlevel=70,
areapoiid=7394,
areapoitype="Obsidian Citadel",
patch='100002',
},[[
step
label "Begin_Dailies"
accept Allegiance To One##66419 |goto The Waking Shores/0 24.38,55.69
|tip On the top balcony.
|tip You will accept this quest automatically.
step
talk Sabellian##185894
_Or_
talk Wrathion##187495
Tell them _"I swear to support your current efforts._"
|tip On the balcony.
|tip You will unlock an additional quest to gain reputation with whichever one you choose.
Show Support to Wrathion or Sabellian |q 66419/1 |goto 24.38,55.69
step
Talk to NPCs around this area
accept Eager To Please##66103 |goto The Waking Shores/0 26.50,62.39 |only if questpossible |or 2
accept Shaking Our Foundations##69918 |goto 26.50,62.39 |only if questpossible |or 2
accept Make a Statement##66633 |goto 26.50,62.39 |only if questpossible |or 2
accept Becca Black and the Seven Gnomes##69926 |goto 26.50,62.39 |only if questpossible |or 2
accept Becca Black and the Seven Gnomes##66856 |goto 26.50,62.39 |only if questpossible |or 2
accept Disarming Behavior##65842 |goto 26.50,62.39 |only if questpossible |or 2
accept Securing Our Legacy##72448 |goto 26.50,62.39 |only if questpossible |or 2
Accept the Daily Quests |complete false |goto 26.50,62.39 |or 2
|only if not completedq(66802)
step
Talk to NPCs around this area
accept Eager To Please##66103 |goto The Waking Shores/0 26.50,62.39 |only if questpossible |or 3
accept Shaking Our Foundations##69918 |goto 26.50,62.39 |only if questpossible |or 3
accept Make a Statement##66633 |goto 26.50,62.39 |only if questpossible |or 3
accept Becca Black and the Seven Gnomes##69926 |goto 26.50,62.39 |only if questpossible |or 3
accept Becca Black and the Seven Gnomes##66856 |goto 26.50,62.39 |only if questpossible |or 3
accept Disarming Behavior##65842 |goto 26.50,62.39 |only if questpossible |or 3
accept Securing Our Legacy##72448 |goto 26.50,62.39 |only if questpossible |or 3
Accept the Daily Quests |complete false |goto 26.50,62.39 |or 3
|only if completedq(66802)
step
talk Stoker Volrax##188179
accept The Tools Of One's Trade##66326 |goto 24.87,60.35 |only if questpossible |or
accept Feeding the Fire##66308 |goto 24.87,60.35 |only if questpossible |or
Accept the Daily Quest |complete false |goto 24.87,60.35 |or
stickystart "Collect_Dragonclaw_Punches"
stickystart "Collect_Obsidian_Bickern"
stickystart "Collect_Precision_Scale_Hammer"
stickystart "Collect_Blacksteel_Tongs"
step
Talk to NPCs around this area
accept Honor Our Fallen##66445 |goto 27.61,56.51 |only if questpossible |or 2
accept Greatest Of Threats##72447 |goto 27.61,56.51 |only if questpossible |or 2
accept Bar Their Efforts##66321 |goto 27.61,56.51 |only if questpossible |or 2
accept Dragon Eyes##67051 |goto 27.61,56.51 |only if questpossible |or 2
accept Dragon Eyes##67099 |goto 27.61,56.51 |only if questpossible |or 2
accept Wyrm Food##67142 |goto 27.61,56.51 |only if questpossible |or 2
accept Hands-Off Operation##66449 |goto 27.61,56.51 |only if questpossible |or 2
Accept the Daily Quests |complete false |goto 27.61,56.51 |or 2
|only if completedq(66802)
step
Talk to NPCs around this area
accept Honor Our Fallen##66445 |goto 27.61,56.51 |only if questpossible |or 3
accept Greatest Of Threats##72447 |goto 27.61,56.51 |only if questpossible |or 3
accept Bar Their Efforts##66321 |goto 27.61,56.51 |only if questpossible |or 3
accept Dragon Eyes##67051 |goto 27.61,56.51 |only if questpossible |or 3
accept Dragon Eyes##67099 |goto 27.61,56.51 |only if questpossible |or 3
accept Wyrm Food##67142 |goto 27.61,56.51 |only if questpossible |or 3
accept Hands-Off Operation##66449 |goto 27.61,56.51 |only if questpossible |or 3
Accept the Daily Quests |complete false |goto 27.61,56.51 |or 3
|only if not completedq(66802)
step
talk Evorian##192661
Ask him _"What are you doing here?"_
collect Evorian Report##194716 |q 67099/3 |goto 20.17,39.54
|only if haveq(67099) or completedq(67099)
stickystop "Collect_Dragonclaw_Punches"
stickystop "Collect_Obsidian_Bickern"
stickystop "Collect_Precision_Scale_Hammer"
stickystop "Collect_Blacksteel_Tongs"
step
Enter the cave |goto 29.36,52.52 < 7 |walk
Kill Pitchstone enemies around this area
|tip Inside the cave.
collect Cindershard Coal##191659 |q 66308/1 |goto 29.43,48.49
|only if haveq(66308) or completedq(66308)
stickystart "Collect_Worldbreaker_Weapons"
step
Enter the cave |goto 35.63,47.95 < 10 |walk
kill Weaponmaster Vordak##186219 |q 65842/2 |goto 34.38,45.95
|tip Inside the cave.
|only if haveq(65842) or completedq(65842)
step
label "Collect_Worldbreaker_Weapons"
click Worldbreaker Weapon Rack##376084+
|tip They look like large racks full of weapons all over the area.
click Worldbreaker Weapon##376103+
collect 15 Worldbreaker Weapons##191057 |q 65842/1 |goto 27.65,56.12
|tip They look like loose weapons on the ground all over the area.
|only if haveq(65842) or completedq(65842)
step
talk Myridian##192564
Ask her _"What have you found here?"_
collect Myridian Report##194707 |q 67099/1 |goto 39.41,49.94
|only if haveq(67099) or completedq(67099)
step
use Gulchak's Pointer##194743
|tip Use it on rubble clouds on the ground.
Kill enemies around this area
collect 12 Lava-Charred Flesh##194744 |q 67142/1 |goto 39.59,61.10
|only if haveq(67142) or completedq(67142)
step
talk Zepharion##192474
Ask him _"What have you found here?"_
collect Zepharion Report##194713 |q 67099/2 |goto 46.35,54.58
|only if haveq(67099) or completedq(67099)
step
Talk to Blacktalon NPCs around this area
Tell them _"I'm here to test your combat skills."_
|tip Defeat them in combat.
Test #10# Blacktalons |q 66103/1 |goto 42.70,67.21
|only if haveq(66103) or completedq(66103)
step
talk Fao the Relentless##186331
turnin Eager To Please##66103 |goto 42.42,66.18
|only if haveq(66103) or completedq(66103)
step
Enter the cave |goto 32.94,73.99 < 20 |walk
Run up the ramp |goto 32.69,74.87 < 7 |only if walking
talk Baskilan##188158
|tip Inside the cave.
Ask him _"What have you found here?"_
Retrieve Baskilan's Report |q 67051/1 |goto 33.44,76.06
|only if haveq(67051) or completedq(67051)
step
Leave the cave |goto 32.90,73.88 < 20 |only if walking
talk Vazallia##188140
|tip Up on top of the mountain.
Ask her _"What have you found here?"_
Retrieve Vazallia's Report |q 67051/2 |goto 33.48,76.22
|only if haveq(67051) or completedq(67051)
step
kill Olphis the Molten##181875
collect Neltharus Forge Crystal##193625 |q 66856/2 |goto 34.80,66.88
|only if haveq(66856) or completedq(66856)
step
kill Searing Flame Harchek##191476
collect Obsidian Crafting Fork##193627 |q 66856/1 |goto 32.51,68.44
|only if haveq(66856) or completedq(66856)
stickystart "Disrupt_the_Burning_Ascent_Djaradin"
step
kill Ruinous##193522
collect Lavafused Armor##197959 |q 69926/2 |goto 32.75,71.91
|only if haveq(69926) or completedq(69926)
step
click Djaradin Sachel##377498+
|tip They look like large bags on the ground.
collect 12 Precision Pennyweight##193626 |q 66856/3 |goto 32.24,65.74
|only if haveq(66856) or completedq(66856)
step
click Deepminted Coin##378471+
|tip They look like large coins on the ground around the lava.
collect 10 Deepminted Coin##197950 |q 69926/3 |goto 33.64,64.20
|only if haveq(69926) or completedq(69926)
step
talk Zepharion##192474
Ask him _"What have you found here?"_
Retrieve Zepharion's Report |q 67051/3 |goto 31.86,70.50
|only if haveq(67051) or completedq(67051)
step
Enter the cave |goto 22.83,75.41 < 7 |walk
kill Pirdan The Blinder##186512
|tip Inside the cave.
collect Dragonforged Poker##197946 |q 69926/1 |goto 22.60,74.60
|only if haveq(69926) or completedq(69926)
step
label "Disrupt_the_Burning_Ascent_Djaradin"
Kill Qalashi enemies around this area
click Siege Arbalest+
|tip They look like giant ballista all over the camp.
click Djaradin Banner+
|tip They look like large flags on posts all over the camp.
Disrupt the Burning Ascent Djaradin |q 66321/1 |goto 36.47,62.15
|only if haveq(66321) or completedq(66321)
step
use Osoria's Assistance##194519
Begin Flying with Osoria |invehicle |q 66449 |goto 27.69,56.38
|only if haveq(66449) or completedq(66449)
stickystart "Kill_Searclaw_Phoenixes"
step
kill Stone Shackles##192325+
|tip They look like stone hands growing out of the ground around the citadel.
|tip Use the "Searing Bolt" ability to damage enemies.
|tip "Speed of Flight" will provide a brief speed boost.
Rescue #8# Threatened Whelps |q 66449/1 |goto 28.42,59.14
|only if haveq(66449) or completedq(66449)
step
label "Kill_Searclaw_Phoenixes"
kill 12 Searclaw Phoenix##196552 |q 66449/2 |goto 28.42,59.14
|tip Use the "Searing Bolt" ability to damage them in the air.
|tip "Speed of Flight" will provide a brief speed boost.
|only if haveq(66449) or completedq(66449)
step
Stop Flying with Osoria |outvehicle |goto 24.89,60.79 |q 66449
|tip Use the "Drop Off" ability on your vehicle bar to safely return to the ground.
|only if haveq(66449) or completedq(66449)
step
kill Ashbinder Tornecha##192344 |q 66449/3 |goto 24.37,60.95
|tip Use the "Searing Bolt" ability to damage enemies.
|tip "Speed of Flight" will provide a brief speed boost.
|only if haveq(66449) or completedq(66449)
stickystart "Collect_Earth-Warder's_Flame_Blade"
stickystart "Collect_Dragonclaw_Punches"
stickystart "Collect_Obsidian_Bickern"
stickystart "Collect_Precision_Scale_Hammer"
stickystart "Plant_Banners_in_Djaradin_Corpses"
stickystart "Collect_Fallen_Defender's_Rings"
stickystart "Collect_Blacksteel_Tongs"
stickystart "Slay_Rare_Enemies"
stickystart "Slay_Rare_Enemies_2"
step
kill Boneshaper Jardak##188693
collect Horn of Scorxia##191908 |q 66445/3 |goto 27.39,59.39
|only if haveq(66445) or completedq(66445)
step
Enter the tunnel |goto 27.13,60.84 < 10 |walk
kill Stonewrecker Tokara##193442 |q 69918/1 |goto 25.10,54.93
|tip Inside the underground ruin.
|only if haveq(69918) or completedq(69918)
step
kill Molka The Grinder##193443 |q 69918/2 |goto 26.03,55.94
|tip Inside the underground ruin.
|only if haveq(69918) or completedq(69918)
step
talk Talonstalker Kavia##190899
turnin Shaking Our Foundations##69918 |goto 26.61,62.49 |only if haveq(69918) or completedq(69918)
turnin Disarming Behavior##65842 |goto 26.61,62.49 |only if haveq(65842) or completedq(65842)
|only if haveq(69918,65842) or completedq(69918,65842)
step
label "Collect_Earth-Warder's_Flame_Blade"
kill Molten Uprising##187868+
|tip You can also kill elite enemies in the courtyard.
collect 3 Earth-Warder's Flame Blade##194544 |q 66445/2 |goto 30.03,56.07
|only if haveq(66445) or completedq(66445)
step
label "Collect_Dragonclaw_Punches"
Kill enemies around this area
collect 10 Dragonclaw Punch##191686 |q 66326/1 |goto 28.68,58.93
|only if haveq(66326) or completedq(66326)
step
label "Collect_Obsidian_Bickern"
Kill enemies around this area
collect Obsidian Bickern##191683 |q 66326/3 |goto 28.68,58.93
|only if haveq(66326) or completedq(66326)
step
label "Collect_Precision_Scale_Hammer"
Kill enemies around this area
collect Precision Scale Hammer##194336 |q 66326/4 |goto 28.68,58.93
|only if haveq(66326) or completedq(66326)
step
label "Plant_Banners_in_Djaradin_Corpses"
Kill enemies around this area
use the Flag of the Black Dragon Flight##193915
|tip Use it on the corpses of Djaradin enemies you kill.
Plant #12# Banners in Djaradin Corpses |q 66633/1 |goto 28.68,58.93
|only if haveq(66633) or completedq(66633)
step
label "Collect_Fallen_Defender's_Rings"
click Bone Pile+
|tip They look like large piles of loose bones all over the citadel and surrounding area.
collect 8 Fallen Defender's Ring##191902 |q 66445/1 |goto 27.72,56.33
|only if haveq(66445) or completedq(66445)
step
label "Collect_Blacksteel_Tongs"
click Blacksteel Tongs##376511+
|tip They look like small sets of tongs on the ground all over the citadel.
collect 5 Blacksteel Tongs##191684 |q 66326/2 |goto 28.68,58.93
|only if haveq(66326) or completedq(66326)
step
talk Talonstalker Kavia##190899
turnin Make a Statement##66633 |goto 26.61,62.49 |only if haveq(66633) or completedq(66633)
turnin Disarming Behavior##65842 |goto 26.61,62.49 |only if haveq(65842) or completedq(65842)
turnin Flamecarved Bone##69983 |goto 26.61,62.49 |only if haveq(69983) or completedq(69983)
turnin Lost Battlepack##66882 |goto 26.61,62.49 |only if haveq(66882) or completedq(66882)
turnin Securing Our Legacy##72448 |goto 26.61,62.49 |only if readyq(72448) or completedq(72448)
turnin Ancient Obsidian Charm##70847 |goto 27.69,56.37 |only if haveq(70847) or completedq(70847)
|only if readyq(72448) or haveq(66633,69983,66882,70847) or completedq(66633,69983,66882,72448,70847)
step
talk Becca Black##191014
turnin Becca Black and the Seven Gnomes##69926 |goto 26.45,62.34 |only if haveq(69926) or completedq(69926)
turnin Becca Black and the Seven Gnomes##66856 |goto 26.45,62.34 |only if haveq(66856) or completedq(66856)
|only if haveq(69926,66856) or completedq(69926,66856)
step
talk Stoker Volrax##188179
turnin The Tools Of One's Trade##66326 |goto 24.87,60.35 |only if haveq(66326) or completedq(66326)
turnin Feeding the Fire##66308 |goto 24.87,60.35 |only if haveq(66308) or completedq(66308)
|only if haveq(66326,66308) or completedq(66326,66308)
step
talk Voraxian##196518
turnin Wyrm Food##67142 |goto 27.60,56.68
|only if haveq(67142) or completedq(67142)
step
talk Exadria##191193
turnin Honor Our Fallen##66445 |goto 27.69,56.37 |only if haveq(66445) or completedq(66445)
turnin Greatest Of Threats##72447 |goto 27.69,56.37 |only if readyq(72447) or completedq(72447)
turnin Bar Their Efforts##66321 |goto 27.69,56.37 |only if readyq(66321) or completedq(66321)
turnin Dragon Eyes##67051 |goto 27.69,56.37 |only if haveq(67051) or completedq(67051)
turnin Dragon Eyes##67099 |goto 27.69,56.37 |only if haveq(67099) or completedq(67099)
turnin Hands-Off Operation##66449 |goto 27.69,56.37 |only if haveq(66449) or completedq(66449)
turnin Gold-Banded Dragon Tooth##69984 |goto 27.69,56.37 |only if haveq(69984) or completedq(69984)
turnin Ancient Horn Ring##66883 |goto 27.69,56.37 |only if haveq(66883) or completedq(66883)
turnin Forgotten Dragon Crest##70848 |goto 27.69,56.37 |only if haveq(70848) or completedq(70848)
|only if readyq(72447) or haveq(66445,69984,66883,70848,66321,67051,67099,66449) or completedq(66445,72447,69984,66883,70848,66321,67051,67099,66449)
step
label "Slay_Rare_Enemies"
Slay #2# Rare Enemies |q 72447/1 |goto 28.24,60.34 |or
'|complete not completedq(69918,66103,66633,65842,72448,69926,66326,66308,67142,66445,72447,66321,67051,67099,66449) |next "Begin_Dailies" |or
|only if haveq(72447) or completedq(72447)
step
label "Slay_Rare_Enemies_2"
Slay #2# Rare Enemies |q 72448/1 |goto 28.24,60.34 |or
'|complete not completedq(69918,66103,66633,65842,72448,69926,66326,66308,67142,66445,72447,66321,67051,67099,66449) |next "Begin_Dailies" |or
|only if haveq(72448) or completedq(72448)
step
talk Talonstalker Kavia##190899
turnin Flamecarved Bone##69983 |goto 26.61,62.49 |only if haveq(69983) or completedq(69983)
turnin Lost Battlepack##66882 |goto 26.61,62.49 |only if haveq(66882) or completedq(66882)
turnin Securing Our Legacy##72448 |goto 26.61,62.49 |only if haveq(72448) or completedq(72448)
turnin Ancient Obsidian Charm##70847 |goto 27.69,56.37 |only if haveq(70847) or completedq(70847)
|only if haveq(69983,66882,72448,70847) or completedq(69983,66882,72448,70847)
step
talk Exadria##191193
turnin Greatest Of Threats##72447 |goto 27.69,56.37 |only if haveq(72447) or completedq(72447)
turnin Gold-Banded Dragon Tooth##69984 |goto 27.69,56.37 |only if haveq(69984) or completedq(69984)
turnin Ancient Horn Ring##66883 |goto 27.69,56.37 |only if haveq(66883) or completedq(66883)
turnin Forgotten Dragon Crest##70848 |goto 27.69,56.37 |only if haveq(70848) or completedq(70848)
|only if haveq(72447,69984,66883,70848) or completedq(72447,69984,66883,70848)
step
You have completed all weekly quests the Obsidian Citadel
|tip This guide will reset when more become available.
'|complete not completedq(69918,66103,66633,65842,72448,69926,66326,66308,67142,66445,72447,66321,67051,67099,66449) |next "Begin_Dailies"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Siege on Dragonbane Keep",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the Siege on Dragonbane Keep \n"..
"in The Waking Shores.",
condition_suggested=function() return level == 70 end,
areapoiid=7267,
areapoitype="Dragonbane Keep",
patch='100002',
},[[
step
talk Sorotis##195768 |goto Valdrakken/0 26.08,40.03
|tip Inside the building.
|tip Turn in Titan Relics from titan, dragon, and primalist treasures.
'|turnin More Titan Relics##70841
'|turnin A Titan Relic##70840
Reach Renown Level 5 with the Valdrakken Accord |complete factionrenown(2510) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Thaldraszus to gain renown.
|tip Renown level 5 unlocks the assault on Dragonbane Keep event in The Waking Shores.
step
label "Begin_Dragonbane_Keep"
Wait for the Assault on Dragonbane Keep to Begin |complete areapoitime(7267) == 0 |goto The Waking Shores/0 30.42,78.08
|tip The assault group will take one hour to assemble.
|tip You will need a small group to complete this.
step
Wait for the Group to Assemble |scenariostart |goto The Waking Shores/0 30.42,78.08
|tip It takes a few minutes for the group to begin moving.
|tip You will need a small group to complete this.
step
map The Waking Shores/0
path follow smart; loop off; ants straight; dist 30
path	30.44,78.16	30.71,76.19	30.71,74.32	31.52,72.65	31.69,71.39
path	31.62,70.48
clicknpc Beef Snack##195806+
|tip They look like charred slugs off the road on either side.
extraaction Feed Beef##386728
|tip Feed the meat to Beef.
Kill enemies that attack the wagon
Reach the camp |scenariogoal 1/53396 |goto 30.67,75.67
step
Click objects around this area
|tip Click the various yellow objects.
Kill enemies around this area
Clear out the Entrance and Setup Base Camp |scenariogoal 2/0 |goto 30.26,70.27
stickystart "Slay_Djaradin_Forces"
step
kill Wyrmeater##186612 |scenariogoal 3/53399 |goto 29.17,72.35
step
kill Scalepiercer##186632 |scenariogoal 3/53764 |goto 28.09,68.43
|tip Inside the tent.
step
label "Slay_Djaradin_Forces"
Kill enemies around this area
Slay the Djaradin Forces |scenariogoal 3/0 |goto 26.39,70.92
step
kill Grand Flame##188009 |scenariogoal 4/53765 |goto 24.67,70.43
step
Enter the building |goto 24.26,70.37 < 10 |walk
kill Inferna the Bound##186735 |scenariogoal 5/53360 |goto 24.11,70.30
|tip Downstairs inside the building.
step
Wait for the Assault to Begin Assembling |complete areapoitime(7104) == 0 |next "Begin_Dragonbane_Keep"
|tip The keep will remain captured for one hour.
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\A Cataloger's Paradise",{
author="support@zygorguides.com",
description="\nUnlock cataloging World Quests with the Dragonscale Expedition.",
condition_suggested=function() return level >= 60 and factionrenown(2507) >= 8 and not achieved(16758) end,
condition_end=function() return completedq(65486) end,
startlevel=60,
keywords={"Dragonflight","Reputation","Picture"},
patch='100002',
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
Reach Renown Level 8 with the Dragonscale Expedition |complete factionrenown(2507) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
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
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Raft |q 65486/1 |goto 49.98,68.51
step
Take Pictures of Wildlife |q 65486/2
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
step
talk Akunda the Cataloger##185651
turnin Picture Perfect##65486 |goto 49.88,68.42
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\A Climber's Calling",{
author="support@zygorguides.com",
description="\nThis guide will walk you through unlocking the Climbing ability.",
condition_suggested=function() return level == 60 and factionrenown(2507) >= 6 and not completedq(65421) end,
condition_end=function() return completedq(65421) end,
startlevel=60,
patch='100002',
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
Reach Renown Level 6 with the Dragonscale Expedition |complete factionrenown(2507) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
turnin A Climber's Calling##69855 |goto The Waking Shores/0 47.33,83.40
accept Basic Climbing Gear##72524 |goto 47.33,83.40
step
click Climbing Gear
|tip Click the "Climbing Gear" ability at the top of the middle row.
Research the Climbing Gear Ability |q 72524/1 |goto 47.30,83.39
step
talk Pathfinder Jeb##187700
turnin Basic Climbing Gear##72524 |goto 47.33,83.40
accept Smoke Over the Mountain##66351 |goto 47.33,83.40
step
talk Rocky Dustbeard##181039
turnin Smoke Over the Mountain##66351 |goto 62.35,50.45
accept Climb Every Mountain##65421 |goto 62.35,50.45
step
click Climbing Gear
Put on the Climbing Gear |q 65421/1 |goto 62.35,50.54
step
click Handhold
Find a Handhold on the Cliff |q 65421/2 |goto 63.30,50.14
step
click Clinging Gustbloom Sample
|tip Click the handholds to reach the Gustbloom.
collect Clinging Gustbloom Sample##191138 |q 65421/3 |goto 63.25,49.81
step
Climb to the right |goto 63.46,50.02 < 5 |walk
clicknpc Pathfinder Yips##187349
Rescue Pathfinder Yips |q 65421/4 |goto 63.09,49.82
step
talk Rocky Dustbeard##181039
turnin Climb Every Mountain##65421 |goto 62.35,50.45
step
achieve Which Knot Was It Again?##16624
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Dragon Isles Emissary",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the questline to unlock a weekly renown quest.",
startlevel=60,
patch='100002',
},[[
step
talk Alexstrasza the Life-Binder##187678
|tip At the top of the tower.
accept Renown of the Dragon Isles##71232 |goto Valdrakken/0 58.00,34.60
step
talk Therazal##196499
turnin Renown of the Dragon Isles##71232 |goto 50.15,56.29
accept Open Orientation##72585 |goto 50.15,56.29
step
Enter the building |goto Valdrakken/0 55.41,45.81 < 30 |walk
talk Unatos##193015
|tip Inside the building.
accept Orientation: Valdrakken##72406 |goto 58.16,35.11
step
talk Kaestrasz##185561
Meet the Drake Manuscript and Armor Supplier |q 72406/2 |goto 46.67,78.94
step
talk Dothenos##191000
Meet the Trade Coordinator |q 72406/3 |goto 36.43,62.79
step
Enter the building |goto 37.57,50.31 < 10 |walk
talk Provisioner Thom##193659
|tip Inside the building.
Meet the Equipment Supplier |q 72406/1 |goto 36.57,50.64
step
talk Unatos##193015
|tip Inside the building, on the ground floor.
turnin Orientation: Valdrakken##72406 |goto 58.17,35.12
step
talk Naleidea Rivergleam##186869
accept Orientation: Dragonscale Basecamp##72397 |goto The Waking Shores/0 47.88,82.41
step
talk Rae'ana##188265
Meet the Scholars Supplier |q 72397/1 |goto 47.92,82.08
step
talk Granpap Whiskers##187408
Meet the Catalogers Supplier |q 72397/2 |goto 47.73,83.23
step
talk Pathfinder Jeb##187700
Meet the Explorers Supplier |q 72397/3 |goto 47.33,83.40
step
talk Boss Magor##189065
Meet the Artisans Supplier |q 72397/4 |goto 46.94,82.89
step
Enter the building |goto 47.30,82.77 < 10 |walk
talk Cataloger Jakes##189226
|tip Inside the building.
Meet the Keeper of Renown |q 72397/5 |goto 47.11,82.57
step
talk Toddy Whiskers##187276
|tip Inside the building.
turnin Orientation: Dragonscale Basecamp##72397 |goto 47.22,82.73
step
talk Sansok Khan##191283
accept Orientation: Maruukai##72429 |goto Ohn'ahran Plains/0 61.44,39.51
step
talk Quartermaster Huseng##196707
|tip Inside the building.
Meet the Renown Quartermaster |q 72429/2 |goto 60.40,37.72
step
talk Agari Dotur##185179
|tip Inside the building.
Meet the Keeper of Renown |q 72429/1 |goto 60.40,37.66
step
talk Agari Dotur##185179
|tip Inside the building.
turnin Orientation: Maruukai##72429 |goto 60.40,37.66
step
talk Murik##193006
accept Orientation: Iskaara##72435 |goto The Azure Span/0 13.14,49.26
step
talk Arvik##186449
Meet the Equipment Supplier |q 72435/1 |goto 12.90,48.82
step
talk Norukk##196544
Meet the Drake Scholar |q 72435/4 |goto 12.93,48.62
step
talk Tatto##186462
Meet the Mount Supplier |q 72435/3 |goto 13.80,49.73
step
talk Rokkutuk##194059
Meet the Recipe Supplier |q 72435/2 |goto 13.91,50.08
step
talk Murik##193006
turnin Orientation: Iskaara##72435 |goto 13.14,49.26
step
talk Therazal##196499
turnin Open Orientation##72585 |goto Valdrakken/0 50.15,56.29
step
label "Begin_Weekly_Quests"
talk Therazal##196499
Accept the Weekly Quest |complete haveq(70750,72068,72373,72374,72375,75859,77976,75860,75861,77254,75259,80386) or completedq(70750,72068,72373,72374,72375,75859,77976,75860,75861,77254,75259,80386) |goto 50.15,56.29
|tip Choose a quest from the board to complete for the week.
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_72068"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_72373"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_72374"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_72375"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_75859"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_77976"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_75860"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_75861"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_77254"
stickystart "Gain_Reputation_Throughout_the_Dragon_Isles_75259"
step
Gain #4000# Reputation Throughout the Dragon Isles |q 70750/1
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(70750) or completedq(70750)
step
Participate in a Community Feast |q 72068/1 |or
|tip Use the "Community Feast" guide to accomplish this.
Click Here to Load the "Community Feast" Guide |confirm |loadguide "Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Community Feast"
|only if haveq(72068) or completedq(72068)
step
Participate in a Hunt |q 72373/1
|tip Use the various grand hunt guides to accomplish this.
|tip Click on an active hunt icon in progress from a zone map to load the appropriate guide.
|only if haveq(72373) or completedq(72373)
step
Lay Siege to Dragonbane Keep |q 72374/1
|tip Use the "Seige on Dragonbane Keep" guide to accomplish this.
Click Here to Load the "Seige on Dragonbane Keep" Guide |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Siege on Dragonbane Keep"
|only if haveq(72374) or completedq(72374)
step
Complete #5# World Quests |q 72375/1
|tip Use the Dragonflight world quest guides to accomplish this.
|only if haveq(72375) or completedq(72375)
step
Complete a Dig with Myrrit |q 75859/2
|tip Use the Dragonflight world quest guides to accomplish this.
|only if haveq(75859) or completedq(75859)
step
Collect #100# Dreamsurge Coalescence |q 77976/1
|tip These look like green orbs floating in the air all over the Dragon Isles.
|tip You can also complete events and kill rare mobs in The Emerald Dream zone.
|only if haveq(77976) or completedq(77976)
step
Protect the Researchers Under Fire |q 75860/2
|tip Complete the Researchers Under Fire scenario.
|loadguide "Daily Guides\\Dragonflight (10-70)\\Researchers Under Fire"
|only if haveq(75860) or completedq(75860)
step
Loot a Secured Shipment |q 75861/1
|tip Look for the Suffusion Camp dragon head icon on the map and click it to load the guide for that zone.
|only if haveq(75861) or completedq(75861)
step
Complete a Time Rift |q 77254/2
|tip Use the Time Rifts guide to complete the event.
|loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts"
|only if haveq(77254) or completedq(77254)
step
Unlock a Zskera Vault Door |q 75259/1
|tip Unlock the Zskera Vaults with the The Forbidden Reach and open doors inside.
|loadguide "Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach"
|only if haveq(75259) or completedq(75259)
stickystart "Complete_a_Time_Rift"
stickystart "Protect_the_Researchers_Under_Fire"
step
Loot a Secured Shipment |q 80386/2
|tip Look for the Suffusion Camp dragon head icon on the map and click it to load the guide for that zone.
|only if haveq(80386) or completedq(80386)
step
label "Complete_a_Time_Rift"
Complete a Time Rift |q 80386/3
|tip Use the Time Rifts guide to complete the event.
|loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts"
|only if haveq(80386) or completedq(80386)
step
label "Protect_the_Researchers_Under_Fire"
Protect the Researchers Under Fire |q 80386/1
|tip Complete the Researchers Under Fire scenario.
|loadguide "Daily Guides\\Dragonflight (10-70)\\Researchers Under Fire"
|only if haveq(80386) or completedq(80386)
step
Unlock a Zskera Vault Door |q 80386/1
|tip Unlock the Zskera Vaults with the The Forbidden Reach and open doors inside.
|loadguide "Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach"
|only if haveq(80386) or completedq(80386)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_72068"
Gain #3000# Reputation Throughout the Dragon Isles |q 72068/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(72068) or completedq(72068)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_72373"
Gain #3000# Reputation Throughout the Dragon Isles |q 72373/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(72373) or completedq(72373)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_72374"
Gain #3000# Reputation Throughout the Dragon Isles |q 72374/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(72374) or completedq(72374)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_72375"
Gain #3000# Reputation Throughout the Dragon Isles |q 72375/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(72375) or completedq(72375)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_75859"
Gain #3000# Reputation Throughout the Dragon Isles |q 75859/3
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(75859) or completedq(75859)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_77976"
Gain #3000# Reputation Throughout the Dragon Isles |q 77976/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(77976) or completedq(77976)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_75860"
Gain #3000# Reputation Throughout the Dragon Isles |q 75860/3
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(75860) or completedq(75860)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_75861"
Gain #3000# Reputation Throughout the Dragon Isles |q 75861/2
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(75861) or completedq(75861)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_77254"
Gain #3000# Reputation Throughout the Dragon Isles |q 77254/3
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(77254) or completedq(77254)
step
label "Gain_Reputation_Throughout_the_Dragon_Isles_75259"
Gain #3000# Reputation Throughout the Dragon Isles |q 75259/3
|tip Gain reputation by completing world quests, daily quests, and weekly quests in the Dragon Isles.
|tip You can also gain reputation by working through leveling guides and zone side quests.
|only if haveq(75259) or completedq(75259)
step
talk Therazal##196499
turnin Aiding the Accord##70750 |goto 50.15,56.29 |only if haveq(70750) or completedq(70750)
turnin Aiding the Accord: A Feast For All##72068 |goto 50.15,56.29 |only if haveq(72068) or completedq(72068)
turnin Aiding the Accord: The Hunt is On##72373 |goto 50.15,56.29 |only if haveq(72373) or completedq(72373)
turnin Aiding the Accord: Dragonbane Keep##72374 |goto 50.15,56.29 |only if haveq(72374) or completedq(72374)
turnin Aiding the Accord: The Isles Call##72375 |goto 50.15,56.29 |only if haveq(72375) or completedq(72375)
turnin Aiding the Accord: Sniffenseeking##75859 |goto 50.15,56.29 |only if haveq(75859) or completedq(75859)
turnin Aiding the Accord: Dreamsurge##77976 |goto 50.15,56.29 |only if haveq(77976) or completedq(77976)
turnin Aiding the Accord: Researchers Under Fire##75860 |goto 50.15,56.29 |only if haveq(75860) or completedq(75860)
turnin Aiding the Accord: Suffusion Camp##75861 |goto 50.15,56.29 |only if haveq(75861) or completedq(75861)
turnin Aiding the Accord: Time Rift##77254 |goto 50.15,56.29 |only if haveq(77254) or completedq(77254)
turnin Aiding the Accord: Zskera Vaults##75259 |goto 50.15,56.29 |only if haveq(75259) or completedq(75259)
turnin Last Hurrah: Zaralek Caverns and Time Rifts##80386 |goto 50.15,56.29 |only if haveq(80386) or completedq(80386)
step
You have completed the weekly Aiding the Accord quest
|tip This guide will reset when another becomes available.
'|complete not completedq(70750,72068,72373,72374,72375,75859,77976,75860,75861,77254,75259,80386) |next "Begin_Weekly_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Forbidden Reach Envoy Dailies",{
author="support@zygorguides.com",
description="This guide will walk you through completing the various daily quests in the Forbidden Reach.",
condition_valid=function() return completedallq(75050,74769,73157) end,
condition_valid_msg="You must complete the \"An Eclectic Accord,\" \"Stemming the Irontide,\" and \"Wings of Mercy,\" quests in the Forbidden Reach leveling guide to unlock envoy quests.",
patch='100007',
},[[
step
label "Begin_Daily_Quests"
click Envoy Charter
|tip Choose your envoy for the day.
|tip Each day you can select an envoy and gain +10% renown gained for that day.
|tip Picking an envoy for the first time each week will unlock that envoy's twice-weekly envoy quests.
|tip You can unlock all 4 envoy quests each week by picking a new envoy each day until you choose them all.
Click Here to Continue |confirm |goto The Forbidden Reach/5 34.18,59.90
step
talk Cataloger Daela##200566
turnin New Adventures##74908 |goto 34.32,59.98
|only if haveq(74908)
step
talk Turik##200562
turnin New Catches##74909 |goto 34.20,60.03
|only if haveq(74909)
step
talk Storykeeper Ashekh##200564
turnin New Foes##74910 |goto 34.08,59.97
|only if haveq(74910)
step
talk Kraxxus##200563
turnin New Horizons##74911 |goto 34.00,59.81
|only if haveq(74911)
step
talk Cataloger Daela##200566
accept Filming the Caldera##74389 |goto 34.32,59.98 |only if questactive(74389)
accept Spelunking the Den##74118 |goto 34.32,59.98 |only if questactive(74118)
|only if questactive(74389,74118)
step
click Cataloger's Gyrocopter
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
Ride the Cataloger's Gyrocopter |q 74389/1 |goto 42.76,35.36
|only if haveq(74389) or completedq(74389)
step
Take Pictures of Wildlife |q 74389/2 |goto 42.32,36.83
|tip Use the "Catalog" ability on your vehicle bar to take puctures of the wildlife along the river.
|tip When your film bar becomes empty, use the "Reload Film" ability to reload and take more pictures.
|tip Taking pictures of wildlife right when they're surrounded by light will result in better quality pictures.
|only if haveq(74389) or completedq(74389)
step
click Climbing Gear
|tip Inside the cave.
Acquire the Climbing Gear |q 74118/1 |goto 42.62,60.91
|only if haveq(74118) or completedq(74118)
step
click Expedition Climbing Hook
|tip On the ceiling.
Grapple onto the Expedition Climbing Hook |q 74118/2 |goto 42.91,61.64
|only if haveq(74118) or completedq(74118)
step
click Primalist Cache Key
|tip Follow the left side to the hanging bag.
|tip Click Stalactite Handholds to move along the ceiling and excavate artifacts.
collect Primalist Cache Key##204561 |q 74118/3 |goto 42.70,59.75
|only if haveq(74118) or completedq(74118)
step
click Primalist Cache
|tip It's in an alcove high up in the cave.
|tip Click Stalactite Handholds to move along the ceiling.
|tip Follow the right side to the handhold that provides a clear view of the hook in the alcove above with the chest.
collect Primalist Scriptures##204852 |q 74118/4 |goto 43.69,62.10
|only if haveq(74118) or completedq(74118)
step
talk Turik##200562
accept Harpooner's Challenge##74391 |goto 34.20,60.03 |only if questactive(74391)
accept Angler's Challenge##74119 |goto 34.19,60.04 |only if questactive(74119)
|only if questactive(74391,74119)
step
use the Ominous Conch##194701
|tip Use 5 of these at the Large Lunker Sighting here to summon a Lunker.
|tip You can also fish in open water, and summon a lunker each time you catch an Ominious Conch.
use the Iskaaran Harpoon##194510
|tip Use it to spear the lunker.
extraaction Pull Hard##374599
|tip Use this after spearing a lunker to pull it to the shore and kill it.
collect 3 Lunker Morsel##204093 |q 74391/2 |goto 76.25,44.57
|only if haveq(74391) or completedq(74391)
step
cast Fishing##131474
|tip Catch fish in the fishing hole.
|tip You can also complete the "Dragonskull Shoal" fishing daily quest.
|tip The daily quest counts as 40 caught fish.
Catch 50 or Restock 25 Fish in Dragonskull Fishing Hole |q 74119/1 |goto 34.18,59.98
|only if haveq(74119) or completedq(74119)
step
talk Storykeeper Ashekh##200564
accept Rare Prey##74117 |goto 34.07,59.96 |only if questactive(74117)
accept Brutal Prey##74390 |goto 34.07,59.96 |only if questactive(74390)
|only if questactive(74117,74390)
step
Kill rare elite enemies
|tip Open your world map and look for rare elite icons.
|tip They look like stars with silver dragons around them.
|tip You may need a group to defeat these enemies.
|tip Kill any two you can find.
Hunt Down #2# Rare Elite Creatures |q 74117/1
|only if haveq(74117) or completedq(74117)
step
Kill elite enemies
|tip Inside the building.
|tip You may need a group to defeat these enemies.
Slay #5# Elite Creatures |q 74390/1 |goto The War Creche/0 61.04,45.79
|only if haveq(74390) or completedq(74390)
step
talk Kraxxus##200563
accept Reach South##75263 |goto The Forbidden Reach/5 34.00,59.81 |only if questactive(75263)
accept Reach South##74392 |goto 34.00,59.81 |only if questactive(74392)
accept Reach Center##75261 |goto 34.00,59.81 |only if questactive(75261)
accept Reach North##75237 |goto 34.00,59.81 |only if questactive(75237)
|only if questactive(75263,74392,75261,75237)
stickystart "Complete_the_Southern_Reach_Route_75263"
step
talk Bronze Timekeeper##200183
Complete the Stormsunder Crater Circuit |q 75263/1 |goto 76.14,65.62
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest.
|only if haveq(75263) or completedq(75263)
step
label "Complete_the_Southern_Reach_Route_75263"
talk Bronze Timekeeper##200247 |notinsticky
Complete the Southern Reach Route |q 75263/2 |goto 63.66,84.06
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest. |notinsticky
|only if haveq(75263) or completedq(75263)
stickystart "Complete_the_Southern_Reach_Route_74392"
step
talk Bronze Timekeeper##200183
Complete the Stormsunder Crater Circuit |q 74392/1 |goto 76.14,65.62
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest.
|only if haveq(74392) or completedq(74392)
step
label "Complete_the_Southern_Reach_Route_74392"
talk Bronze Timekeeper##200247 |notinsticky
Complete the Southern Reach Route |q 74392/2 |goto 63.66,84.06
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest. |notinsticky
|only if haveq(74392) or completedq(74392)
stickystart "Complete_the_Aerie_Chasm_Cruise_75261"
stickystart "Complete_the_Caldera_Climb_75237"
step
talk Bronze Timekeeper##200417
Complete the Forbidden Reach Rush |q 75261/2 |goto 49.42,60.06
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest.
|only if haveq(75261) or completedq(75261)
step
label "Complete_the_Aerie_Chasm_Cruise_75261"
talk Bronze Timekeeper##200417 |notinsticky
Complete the Aerie Chasm Cruise |q 75261/1 |goto 63.09,51.95
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest. |notinsticky
|only if haveq(75261) or completedq(75261)
stickystart "Complete_the_Aerie_Chasm_Cruise_75237"
step
talk Bronze Timekeeper##200417
Complete the Forbidden Reach Rush |q 75237/3 |goto 49.42,60.06
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest.
|only if haveq(75237) or completedq(75237)
step
label "Complete_the_Aerie_Chasm_Cruise_75237"
talk Bronze Timekeeper##200417 |notinsticky
Complete the Aerie Chasm Cruise |q 75237/1 |goto 63.09,51.95
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest. |notinsticky
|only if haveq(75237) or completedq(75237)
step
label "Complete_the_Caldera_Climb_75237"
talk Bronze Timekeeper##200316 |notinsticky
Complete the Caldera Climb |q 75237/2 |goto 41.36,14.55
|tip You can complete either one of these races in reverse or advanced mode once to complete the quest. |notinsticky
|only if haveq(75237) or completedq(75237)
step
talk Kraxxus##200563
turnin Reach South##75263 |goto 34.00,59.81 |only if haveq(75263) or completedq(75263)
turnin Reach South##74392 |goto 34.00,59.81 |only if haveq(74392) or completedq(74392)
turnin Reach Center##75261 |goto 34.00,59.81 |only if haveq(75261) or completedq(75261)
turnin Reach North##75237 |goto 34.00,59.81 |only if haveq(75237) or completedq(75237)
|only if haveq(75263,74392,75261,75237) or completedq(75263,74392,75261,75237)
step
talk Cataloger Daela##200566
turnin Filming the Caldera##74389 |goto 34.32,59.98 |only if haveq(74389) or completedq(74389)
turnin Spelunking the Den##74118 |goto 34.32,59.98 |only if haveq(74118) or completedq(74118)
|only if haveq(74389,74118) or completedq(74389,74118)
step
talk Storykeeper Ashekh##200564
turnin Rare Prey##74117 |goto 34.07,59.96 |only if haveq(74117) or completedq(74117)
turnin Brutal Prey##74390 |goto 34.07,59.96 |only if haveq(74390) or completedq(74390)
|only if haveq(74117,74390) or completedq(74117,74390)
step
talk Turik##200562
turnin Harpooner's Challenge##74391 |goto 34.20,60.03 |only if haveq(74391) or completedq(74391)
turnin Angler's Challenge##74119 |goto 34.19,60.04 |only if haveq(74119) or completedq(74119)
|only if haveq(74391,74119) or completedq(74391,74119)
step
You have completed the available envoy daily quests
|tip This guide will reset when more become available.
'|complete not completedq(75263,74392,75261,75237,74389,74118,74117,74390,74391,74119) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Iskaara Tuskarr\\Dragonskull Island Fishing Hole",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests at the Dragonskull Island fishing location.",
startlevel=60,
areapoiid=7412,
areapoitype="Fishing Hole",
patch='100007',
},[[
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |n
Reach Renown Level 4 with the Iskaara Tuskarr |complete factionrenown(2511) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Fishing Holes##70941
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,1 |goto 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |q 70941/1 |goto 13.94,49.24
step
talk Nunvuq##186554
turnin Fishing Holes##70941 |goto 13.94,49.24
step
Wait for the Tyrhold Fishing Hole to Become Active |complete areapoi(2151,7412)
step
label "Begin_Daily_Quests"
talk Reclusive Fisher##200947
accept Dragonskull Shoal##73226 |goto The Forbidden Reach/5 74.17,40.53
|tip Completing this quest will increase the Dragonskull Island fishing hole stock quantity by 20.
|tip You may want to fish it down some before proceeding.
step
clicknpc Stock Fish##195340
|tip They look like groups of small fish near the shore all over the riverbank.
|tip They appear on your minimap as yellow dots.
use Throw Net##198855
|tip Use it on schools of stock fish.
Collect #3# Stock Fish |q 73226/1 |goto 83.76,29.78
step
extraaction Release Fish##385852
|tip Mount up and use your dragonriding.
Drop #3# Fish From Above |q 73226/2 |goto 74.17,40.53
step
talk Reclusive Fisher##200947
turnin Dragonskull Shoal##73226 |goto 74.17,40.53
|tip Completing this quest will increase the Dragonskull Island fishing hole stock quantity 20.
|tip You may want to fish it down some before proceeding.
step
You have completed the available daily quests at the Dragonskull Island fishing hole
|tip This guide will reset when more become available.
'|complete not completedq(73226) |next "Begin_Daily_Quests"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Sniffenseeking!",{
author="support@zygorguides.com",
description="This guide will help you complete the 17 digs available from Myrrit in Loamm.",
startlevel=68,
patch='100100',
},[[
step
Unlock Zaralek Cavern |complete completedq(72973)
|tip Complete the beginning of the "Zaralek Cavern" leveling guide to unlock Loamm.
step
label "Start_Dig"
use the Lost Dig Map##205982
|tip Lost dig maps have a chance to drop from the Scentsational Niffen Treasures after completing the weekly quest.
use the Bartered Dig Map##205984
|tip This dig map can be purchased from Ponzo in Loamm for 3 Barter Brick.
talk Myrrit##201426
'|accept The Buddy System##74876 |only if not completedq(74876) |or
'|accept The Heavy Crown##74953 |only if not completedq(74953) |or
'|accept Best Friends##74877 |only if not completedq(74877) |or
Tell him _"Let's go Sniffenseeking!"_
Ride with Myrrit |havebuff Myrrit's Dig Buddy##410214 |goto Zaralek Cavern/0 55.62,57.45 |or |override
step
talk Effervesta##202778
Ask her _"Myrrit really needs to speak with you. He's here. Can you see him?"_
Talk to Effervesta |q 74953/1 |goto 54.61,54.94
|only if haveq(74953)
step
click Cushion of Questions
Sat on the "Throne" while perfumed |q 74953/2 |goto 54.61,54.94
|only if haveq(74953)
step
talk Marron Glassee##202996
|tip Pick whichever you like, it doesn't matter.
Solve the Problem |q 74953/3 |goto 54.61,54.94
|only if haveq(74953)
step
talk Myrrit##202766
turnin The Heavy Crown##74953 |goto 54.65,54.36 |only if haveq(74953)
accept Old Friends, Dear Friends##74878 |goto 54.65,54.36 |only if completedq(74953) and not completedq(74878)
|only if (haveq(74953) or completedq(74953)) and not completedq(74878)
step
talk Effervesta##202778
Tell her _"Myrrit is having trouble telling you what's wrong because he's afraid of how you'll react."_
Talk to Effervesta |q 74878/1 |goto 54.61,54.38
|only if haveq(74878)
step
talk Myrrit##202766
Choose _"<Encourage Myrrit to be truthful about how he feels.>"_
Myrrit encouraged |q 74878/2 |goto 54.65,54.36
|only if haveq(74878)
step
talk Myrrit##202766
turnin Old Friends, Dear Friends##74878 |goto 54.65,54.36 |next "Start_Dig"
|only if haveq(74878)
step
talk Effervesta##202778
Tell her _" Myrrit is wondering if you have time to go on a dig with him."_
Talk to Effervesta |q 74877/1 |goto 54.61,54.94
|only if haveq(74877)
step
talk Myrrit##201426
Tell him _"Effervesta says she will meet with you at your 'spot.'"_
Give Myrrit the Good News |q 74877/2 |goto 55.62,57.45
|only if haveq(74877)
step
talk Floressa##203293
|tip Inside the building.
buy 1 Squishy Snack##204791 |q 74877/3 |goto 56.42,55.84
|only if haveq(74877)
step
Check on Myrrit at the "Secret Spot" |q 74877/4 |goto 52.27,62.87
|only if haveq(74877)
step
talk Myrrit##202766
turnin Best Friends##74877 |goto 52.17,62.80 |next "Start_Dig"
|only if haveq(74877)
step
talk Myrrit##201426
Tell him _"Let's go Sniffenseeking!"_
Ride with Myrrit |havebuff Myrrit's Dig Buddy##410214 |goto 55.62,57.45
step
Watch the dialogue
Reach the Mysterious Cave |nobuff Myrrit's Dig Buddy##410214
step
accept Brand New Digs##75459 |only if not completedq(75459) |or
accept Sneak and Sniff##75517 |only if not completedq(75517) |or
accept The Living Drill##76016 |only if not completedq(76016) |or
accept Thieving Critters##75619 |only if not completedq(75619) |or
accept Element Whispers##75621 |only if not completedq(75621) |or
accept Living Statue##76014 |only if not completedq(76014) |or
accept Making Scents##75393 |only if not completedq(75393) |or
accept Vertical Anomaly##75390 |only if not completedq(75390) |or
accept Flapping and Screaming##76027 |only if not completedq(76027) |or
accept Scratch and Sniff##75234 |only if not completedq(75234) |or
accept Successful Interventions##75516 |only if not completedq(75516) |or
accept Those Rascally Worms##75397 |only if not completedq(75397) |or
accept Your Weight in Gold##75996 |only if not completedq(75996) |or
accept Heart of Iron##76015 |only if not completedq(76015) |or
accept Liars in Light##75620 |only if not completedq(75620) |or
accept Frostfire Finesse##76084 |only if not completedq(76084) |or
accept Liars of Spirit##76081 |only if not completedq(76081) |or
|tip You will accept one of these quests automatically.
stickystart "Search_For_Quests"
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75459
|only if haveq(75459)
step
collect Metal Key##204867 |q 75459/2 |goto 55.95,48.93
|tip Use "Sniff" to find the treasure inside the cave.
|tip Then "Burrow" under it and use "Dig" to collect it.
|only if haveq(75459)
step
Burrowed with Myrrit |q 75459/5 |goto 55.95,49.91
|tip Use "Burrow" to move under the gas inside the cave to safety on the other side.
|tip Then "Emerge" from the ground.
|only if haveq(75459)
step
Burrow Past the Toxic Gas at the Entrance |q 75459/6 |goto 55.84,49.17
|tip Inside the cave.
|only if haveq(75459)
step
Place Myrrit on the Pressure Plate |q 75459/7 |goto 55.88,48.86
|tip Stand in the middle of the plate inse the cave and "Put Down Myrrit" to leave him on the plate and keep it activated.
|only if haveq(75459)
step
click Treasure Chest
|tip Inside the cave.
Solve the Chest Puzzle |q 75459/8 |goto 56.08,48.91
|only if haveq(75459)
step
Go on a Dig with Myrrit |q 74876/1 |goto 56.08,48.91
|only if haveq(74876)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75517
|only if haveq(75517)
step
click Jangly Keys
|tip "Burrow" underground, avoiding the patches of disturbed ground which spawn enemies.
collect 1 Jangly Key##205412 |q 75517/1 |goto 55.42,53.56
|only if haveq(75517)
step
click Treasure Chest
|tip You must "Emerge" and drop Myrrit first.
Open the Chest |q 75517/2 |goto 56.71,53.22
|only if haveq(75517)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76016
|only if haveq(76016)
step
kill Diganthor##204434
|tip Pick up Myrrit and "Burrow," then "Dig" beneath disturbed areas on the ground.
|tip Kill the enemies that spawn from each area until Diganthor spawns.
collect 1 Spit-covered Key##205941 |q 76016/1 |goto 56.22,52.99
|only if haveq(76016)
step
click Treasure Chest
|tip Pick up Myrrit and "Burrow," then "Dig" beneath this spot on the ground.
|tip You will have to put Myrrit down to loot the chest.
Loot the Treasure Chest |q 76016/2 |goto 56.01,53.18
|only if haveq(76016)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75619
|only if haveq(75619)
step
kill Sneaky Darkfang##204435
|tip Pick up Myrrit and "Burrow," avoiding spider webs on the ground.
|tip "Emerge" and put down Myrrit to click the web, spawning the darkfang.
collect Sticky Key##205186 |goto 56.84,55.50 |q 75619
|only if haveq(75619)
step
kill Mischievous Stagnose##204432
|tip Pick up Myrrit and "Burrow," avoiding spider webs on the ground.
|tip "Dig" under the moving patch of rumbling earth to spawn the stagnose.
|tip It moves in a counter-clockwise circle in the cave.
collect Muddy Key##205185 |goto 55.59,57.21 |q 75619
|only if haveq(75619)
step
click Double-Locked Chest
|tip Pick up Myrrit and "Burrow" to bypass enemies, avoiding spider webs.
|tip "Emerge" and put him down to loot the chest.
Loot the Double-Locked Chest |q 75619/1 |goto 56.73,57.28
|only if haveq(75619)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75621
|only if haveq(75621)
step
talk Earthward Challenger##204800
|tip In the upper portion of the cave.
Ask it _"Can you check to see if my pattern is right?"_
Speak with Guardian |q 75621/1 |goto 56.01,51.01
|tip This will tell you in chat how many of your selections are correct.
|only if haveq(75621)
step
kill Earthward Challenger##204800
|tip In the upper portion of the cave.
|tip Set the West Brazier to Earth.
|tip Set the South Brazier to Water.
|tip Set the East Brazier to Air.
|tip Set the North Brazier to Fire.
|tip When you do this, the elementals downstairs will attack you.
|tip Then, check your pattern and the Challenger will attack you.
collect 1 Champion's Crystal##205689 |q 75621/2 |goto 56.04,51.04
|only if haveq(75621)
step
click Elementally Guarded Geode
|tip Downstairs inside the cave.
Open the Elementally Guarded Geode |q 75621/3 |goto 56.01,51.17
|only if haveq(75621)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76014
|only if haveq(76014)
step
click Light Etched Key
|tip Inside the cave.
Pick Up the Light Etched Key |havebuff Light Etched Key##411171 |goto 57.97,55.06 |q 76014
|only if haveq(76014)
step
click Etched Receiver North
|tip Inside the cave.
Restore the North Etched Key |q 76014/4 |goto 58.08,55.80
|only if haveq(76014)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76014
|only if haveq(76014)
step
click Light Etched Key
|tip "Burrow" underground, then "Dig" at this spot inside the cave to move the rubble.
Pick Up the Light Etched Key |havebuff Light Etched Key##411171 |goto 58.17,54.58 |q 76014
|only if haveq(76014)
step
click Etched Receiver East
|tip Inside the cave.
Restore the East Etched Key |q 76014/3 |goto 57.87,56.09
|only if haveq(76014)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76014
|only if haveq(76014)
step
click Light Etched Key
|tip "Burrow" underground, then "Dig" at this spot inside the cave to move the rubble.
Pick Up the Light Etched Key |havebuff Light Etched Key##411171 |goto 58.53,56.45 |q 76014
|only if haveq(76014)
step
click Etched Holder South
|tip Inside the cave.
Restore the South Etched Key |q 76014/2 |goto 58.07,56.40
|only if haveq(76014)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76014
|only if haveq(76014)
step
click Light Etched Key
|tip "Burrow" underground, then "Dig" at this spot inside the cave to move the rubble.
Pick Up the Light Etched Key |havebuff Light Etched Key##411171 |goto 57.61,56.42 |q 76014
|only if haveq(76014)
step
click Etched Holder West
|tip Inside the cave.
Restore the West Etched Key |q 76014/1 |goto 58.27,56.11
|only if haveq(76014)
step
click Protector Lynaera Statue
|tip This will cause it to animate and attack you.
kill Empowered Protector Lynaera##204419
collect 1 Heated Titan Key##205938 |q 76014/5 |goto 58.07,56.09
|only if haveq(76014)
step
click Etched Titan Chest
|tip Inside the cave.
Open the Etched Titan Chest |q 76014/6 |goto 58.28,57.19
|only if haveq(76014)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75393
|only if haveq(75393)
step
kill Calibrating Scent Matrix##203606
extraaction Sniff##411068
|tip When "Olfactory Defenses" go off, use this ability to get a clue as to which orb to click.
|tip When lightning is mentioned, click Air.
|tip When fish are mentioned, click Water.
|tip When charcoal is mentioned, click Fire.
|tip When worms are mentioned, click Earth.
click Titan Smell Cache
|tip It will spawn after killing the Matrix
Loot the Titan Smell Cache |q 75393/1 |goto 58.07,56.08
|only if haveq(75393)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75390
|only if haveq(75390)
step
confirm |goto 54.51,49.23
|tip "Burrow" underground, then "Dig" at this spot inside the cave to break the crystal.
|only if haveq(75390)
step
confirm |goto 55.05,48.94
|tip "Burrow" underground, then "Dig" at this spot inside the cave to break the crystal.
|only if haveq(75390)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75390
|only if haveq(75390)
step
Drop Myrrit on the Plate |nobuff Carrying Myrrit##400133 |goto 54.92,49.09
|tip Use "Put Down Myrrit" to leave him on the plate and activate the steam vent.
|only if haveq(75390)
step
Access the Transit Bubble |q 75390/1 |goto 54.67,48.80
|tip Walk into the bubble to gain a brief buff.
|only if haveq(75390)
step
click Floating Chest
|tip Float up inside the transit bubble and wait for the bubble that moves around the room to line up with the one over the steam vent.
|tip Float from the transit bubble, to the moving bubble, to the steam vent bubble to reach the chest.
collect Waterlogged Key##203655 |q 75390/2 |goto 54.98,48.67
|only if haveq(75390)
step
click Lost Dive Box
Open the Lost Dive Box |q 75390/3 |goto 54.65,48.85
|only if haveq(75390)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76081
|only if haveq(76081)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 60.13,56.15 |q 76081
|tip Use the "Put Down Myrrit" ability to leave Myrrit on the pressure plate.
|only if haveq(76081)
step
click Regal Statue
Select _"Choose this statue as telling the truth."_
kill Pahi'rys##205540
|tip It will spawn nearby.
collect 1 Fierce Key##205990 |q 76081/2 |goto 59.98,55.98
|only if haveq(76081)
step
click Titan Chest
Loot the Titan Chest |q 76081/3 |goto 60.14,57.00
|only if haveq(76081)
step
click Critter Lasso
Pick Up the Critter Lasso |havebuff Critter Lasso##411301 |goto 54.54,49.38 |q 76027
|only if haveq(76027)
step
clicknpc Cave Screecher##205417+
|tip They're small bats flying around the cave.
extraaction Critter Lasso##411283
|tip Lasso a bat and quickly run to the crystal until it shatters.
|tip If the key is not in this crystal, continue shattering them until you find it.
click Glowing Key##402578
collect 1 Glowing Key##205969 |q 76027/1 |goto 54.73,48.88
|only if haveq(76027)
step
click Glowing Chest
Unlock the Treasure Chest |q 76027/2 |goto 54.86,48.94
|only if haveq(76027)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75996
|only if haveq(75996)
step
Open the Sealed Chamber Door |q 75996/1 |goto 58.69,51.97
|tip "Burrow" underground, then "Dig" at these spots inside the cave to move the rubble.
|tip A mob will spawn and attack you.
|tip Keep it alive and drag it to nearby pressure plates.
|tip Stand on them to activate them, then wait for it to surround you with a giant gold area and run to the next one.
|tip Do this with 3 pressure plates and stand on the final one yourself.
|tip Or, you can do this with 2 pressure plates, kill it, then quicky place Myrrit on one and yourself on the fourth.
You can find rubble at:
[58.66,52.19]
[58.86,52.25]
[58.87,52.08]
[58.60,51.59]
|only if haveq(75996)
step
click Bag of Secrets
Find the Bag of Secrets |q 75996/2 |goto 57.41,51.37
|only if haveq(75996)
step
click Sunflower Tea
Sip the Sunflower Tea |q 75516/1 |goto 58.69,49.83
|only if haveq(75516)
step
talk Mr. Sunflower##205080
Ask him _"What exactly is going on in here?"_
Question Mr. Sunflower |q 75516/2 |goto 58.73,49.85
|only if haveq(75516)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75516
|only if haveq(75516)
step
talk Webbed "Guest"##205089
Choose _"Point out that this is Ralph to Mr. Sunflower."_
|tip Use the "Sniff" ability next to Webbed Guests around the table.
|tip Myrrit will say the correct guest smells like some sort of hairy creature that has been here a long time.
Find Ralph |q 75516/3 |goto 58.62,49.87
|only if haveq(75516)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 58.75,50.17 |q 75516
|tip Use the "Put Down Myrrit" ability to drop him.
|only if haveq(75516)
step
click Ralph's Abandoned Belongings
Collect Ralph's Abandoned Belongings |q 75516/4 |goto 58.75,50.17
|only if haveq(75516)
step
click Smelly Bag+
|tip They look like small piles of dirt revealed by Myrrit at the locations listed below.
kill Thieving Worm##203850+
|tip Pick up Myrrit, then "Burrow" underground.
|tip Move beneath areas of disturbed dirt and "Dig" to reveal worms.
|tip Avoid the swirling areas on the ground.
collect 6 Pipsee Cheese Snack##202180 |q 75397/2 |goto 58.56,51.99
Smelly Bags can be found at:
[58.44,51.52]
[58.59,51.70]
[58.52,52.20]
[58.57,52.55]
[58.84,52.17]
|only if haveq(75397)
step
talk Pipsee##205267
Tell it _"Offer Pipsee the snacks."_
Feed Pipsee |q 75397/3 |goto 57.54,51.35
|only if haveq(75397)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 57.54,51.34 |q 75397
|tip Use the "Put Down Myrrit" ability to drop him.
|only if haveq(75397)
step
click Pipsee's Treasures
Collect Pipsee's Treasures |q 75397/4 |goto 57.54,51.34
|only if haveq(75397)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
|tip He may also be nearby.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 76084
|only if haveq(76084)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 60.22,55.50 |q 76084
|tip Use the "Put Down Myrrit" ability to drop him on the pressure plate.
|only if haveq(76084)
step
click Frost Charge
Gain the "Extinguishing Frost" Buff |havebuff Extinguishing Frost##411696 |goto 60.05,55.48 |q 76084
|only if haveq(76084)
step
click Flame-Engulfed Key Fragment##402855
|tip Avoid the hazards, which will deplete the shield you have.
|tip Move clockwise with the beam and avoid the orbs.
|tip Point your camera towards the ground to see the path of the orbs better.
collect Flame-Engulfed Key Fragment##206002 |goto 60.37,56.55
|only if haveq(76084)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |goto 60.22,55.50 |q 76084
|only if haveq(76084)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 60.05,55.48 |q 76084
|tip Use the "Put Down Myrrit" ability to drop him on the pressure plate.
|only if haveq(76084)
step
click Fire Charge
Gain the "Thawing Flame" Buff |havebuff Thawing Flame##411698 |goto 60.22,55.49 |q 76084
|only if haveq(76084)
step
click Frost-Encased Key Fragment##402856
|tip Avoid the hazards, which will deplete the shield you have.
|tip Move clockwise with the beam and avoid the orbs.
|tip Point your camera towards the ground to see the path of the orbs better.
collect Frost-Encased Key Fragment##206001 |goto 59.90,56.55
|only if haveq(76084)
step
extraaction Combine Fragments##411729
|tip it appears as a button on your screen.
collect Frostfire Key##206000 |q 76084/1 |goto 60.14,56.77
|only if haveq(76084)
step
click Frostfire Cache
Open the Frostfire Cache |q 76084/2 |goto 60.14,57.09
|only if haveq(76084)
step
kill Jalgon Stoutburn##204426
|tip Move out of areas targeted on the ground.
|tip Mole machines that spawn deal damage in the entire room.
collect Iron Titan Key##205939 |q 76015/1 |goto 58.09,56.07
|only if haveq(76015)
step
click Scorched Chest
|tip Pick up Myrrit and "Burrow" under these locations.
|tip Using "Sniff" will reveal them so you can see them.
|tip Use "Dig" beneath them to reveal what's underneath.
|tip If it is a mine, run away before it blows up.
|tip Put down Myrrit to loot the chest.
Unlock the Scorched Chest |q 76015/2 |goto 58.35,55.94
You can find dirt piles at:
[58.38,56.40]
[58.02,56.56]
[57.77,56.23]
|only if haveq(76015)
step
kill Bogg##201747
|tip Pick up Myrrit and "Burrow" under these locations.
|tip Using "Sniff" will reveal them so you can see them.
|tip Use "Dig" beneath them to reveal what's underneath.
|tip Bogg will be in one of the piles instead of a normal enemy.
collect Stolen Key##205277 |q 75234/2 |goto 54.82,52.62
You can find dirt piles at:
[54.71,52.33]
[54.47,52.24]
[54.32,51.82]
[54.57,51.48]
[54.68,51.21]
[55.06,51.78]
|only if haveq(75234)
step
click Treasure Chest
Unlock the Treasure Chest |q 75234/3 |goto 54.73,52.16
|only if haveq(75234)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
Pick Myrrit Up |havebuff Carrying Myrrit##400133 |q 75620
|only if haveq(75620)
step
Put Down Myrrit |nobuff Carrying Myrrit##400133 |goto 59.99,56.10 |q 75620
|tip Use the "Put Down Myrrit" ability to leave Myrrit on the pressure plate.
|only if haveq(75620)
step
click Tauren Statue
|tip Stand on this pressure plate and click the statue.
kill Shade of Skytalon##204430
collect Small Key##205202 |q 75620/2 |goto 60.27,56.10
|only if haveq(75620)
step
click Titan Chest
Unlock the Titan Chest |q 75620/3 |goto 60.13,56.62
|only if haveq(75620)
step
_Next to you:_
clicknpc Myrrit##205098
|tip Inside the cave.
|tip He may also be nearby.
|tip If Myrrit disappears, use his backpack near the entrance to call him.
Pick Myrrit Up |havebuff Carrying Myrrit##400133
step
Return with Myrrit to Loamm |goto 55.64,57.36 < 50 |c |noway
|tip Pick up Myrrit again and use "Escape" to leave the cave after you're finished.
step
label "Search_For_Quests"
Search for an object offering a quest inside the mysterious cave
|tip Various quest-giving objects appear randomly in digs.
|tip You can also find hidden NPCs and objects for weekly quests while Burrowing with Myrrit.
|tip When the "Dig" button lights up something is nearby.
'|goto 55.64,57.36 < 50 |c |noway |or
'|complete false |or
|only if factionrenown(2564) >= 9
step
talk Myrrit##201426
turnin The Buddy System##74876 |goto Zaralek Cavern/0 55.62,57.45
|only if haveq(74876) or completedq(74876)
step
talk Citros##200055
turnin Incense Replay##75771 |goto 56.80,54.00
|only if readyq(75771)
step
talk Chigoe##204861
turnin Drawing a Blank##75769 |goto 57.23,52.68
|only if readyq(75769)
step
talk Garram##203644
turnin Flask Manager##75772 |goto 57.25,55.85
|only if readyq(75772)
step
talk Lyssa##204860
turnin Little Blank Book##75773 |goto 56.81,56.37
|only if readyq(75773)
step
talk Kiln-Singer Malraka##204215
turnin Liquid Art##75765 |goto 57.80,54.35
|only if readyq(75765)
step
talk Fanilly##203612
turnin Ruby in the Rough##75766 |goto 56.70,55.32
|only if readyq(75766)
step
talk Whistler##204863
turnin Good Time Boy##75767 |goto 57.31,53.84
|only if readyq(75767)
step
Enter the cave |goto 56.12,59.26 < 10 |walk
talk Cinnam##205318
|tip Inside the cave.
turnin Lucky Ducky##75768 |goto 55.69,60.22
|only if readyq(75768)
step
talk Mistie##203607
turnin A Glass of Bubbly##75770 |goto 56.00,56.45
|only if readyq(75770)
step
talk Vanndual##203294
turnin Crispety Crunchety##75998 |goto 57.70,57.85
|only if readyq(75998)
step
talk Marie Shellie##204356
turnin Slimy Yet Satisfying##75936 |goto 56.82,53.97
|only if readyq(75936)
step
talk Kilnmaster Crubus##203170
turnin Deep Cuts##76004 |goto 57.06,54.98
|only if readyq(76004)
step
Click Here When a New Dig Becomes Available |confirm |next "Start_Dig"
|tip You can purchase a dig from Ponso in Loamm once per week for 3 Barter Bricks.
|tip You also get a dig from the weekly "A Worthy Ally: Loamm Niffen" quest.
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Snail Racing Dailies",{
author="support@zygorguides.com",
startlevel=68,
patch='100100',
},[[
step
Reach Renown Level 7 with the Loamm Niffen |complete factionrenown(2564) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
click TICKET: Glimmerogg Games
accept TICKET: Glimmerogg Games##73707 |goto Zaralek Cavern/0 55.61,54.56
step
talk Brogg the Beast##201098
turnin TICKET: Glimmerogg Games##73707 |goto 43.79,82.98
accept Pay to Play##73708 |goto 43.79,82.98
accept Favor on the Side##73709 |goto 43.79,82.98
step
talk Festival Challenger##202571
Tell him _"You're a party crasher!"_
Find #6# Intruders |q 73709/1 |goto 44.27,82.29
step
kill Echoed Lurker##202636+
collect 4 Echoed Lurker Flesh##204803 |q 73708/1 |goto 44.20,84.66
step
click Glimmer Mushroom##388520
collect 1 Glimmer Mushroom##205169 |q 73708/2 |goto 38.12,78.45
step
click Glimmer Mushroom##388520
collect 2 Glimmer Mushroom##205169 |q 73708/2 |goto 37.93,77.49
step
click Glimmer Mushroom##388520
collect 3 Glimmer Mushroom##205169 |q 73708/2 |goto 37.63,76.63
step
click Glimmer Mushroom##388520
collect 4 Glimmer Mushroom##205169 |q 73708/2 |goto 38.28,76.66
step
talk Brogg the Beast##201098
turnin Pay to Play##73708 |goto 43.79,82.98
turnin Favor on the Side##73709 |goto 43.79,82.98
step
talk Storul Heavystone##201100
accept Rock By Rock##73710 |goto 44.97,83.29
step
click Starter Rock Bar
Lift the Weight Bars |q 73710/1 |count 1 |goto 45.13,83.35
step
click Mid-Weight Rock Bar
Lift the Weight Bars |q 73710/1 |count 2 |goto 45.08,83.24
step
click Heavy Rock Bar
Lift the Weight Bars |q 73710/1 |count 3 |goto 44.99,83.10
step
talk Storul Heavystone##201100
turnin Rock By Rock##73710 |goto 44.98,83.31
accept Marked Champion##73711 |goto 44.98,83.30
step
Enter the cave |goto 45.40,86.85 < 10 |walk
kill Carcaxas##202836 |q 73711/1 |goto 45.59,87.62
|tip Inside the cave.
step
talk Storul Heavystone##201100
turnin Marked Champion##73711 |goto 44.98,83.29
step
Reach Renown Level 7 with the Loamm Niffen |complete factionrenown(2564) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Zaralek Caverns to gain renown.
|tip Completing the "Zaralek Cavern" guide awards numerous reputation tokens.
step
_Next to you:_
talk Newsy##205127
accept Off to the Track##75725
|tip You may need to relog to see this quest or leave Zaralek Cavern.
step
talk Briggul##201752
turnin Off to the Track##75725 |goto 44.25,79.93
accept Come Snail Away##74787 |goto 44.25,79.93
step
clicknpc Big Slick in the City##202731
Meet Slick |q 74787/1 |goto 44.17,79.98
step
talk Briggul##201752
turnin Come Snail Away##74787 |goto 44.26,79.93
step
label "Begin_Daily_Quests"
talk Briggul##201752
accept Resistance Training##74518 |goto 44.25,79.92 |only if questpossible |or
accept A Snail's Pace##74516 |goto 44.25,79.92 |only if questpossible |or
accept The Slowest Fan Club##74514 |goto 44.25,79.92 |only if questpossible |or
accept Good for Goo##74519 |goto 44.25,79.92 |only if questpossible |or
accept All Terrain Snail##74517 |goto 44.25,79.92 |only if questpossible |or
accept Snail Mail##74515 |goto 44.25,79.92 |only if questpossible |or
accept Less Cargo##74520 |goto 44.25,79.92 |only if questpossible |or
Accept the Daily Quest |complete false or completedq(74518,74516,74514,74519,74517,74515,74520) |goto 44.25,79.92 |or
step
Summon Your Level 25 Amethyst Softshell |complete activepet(2697) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(2697) >= 25 and not completedq(74948)
step
talk Briggul##201752
accept Snailspiration: Amethyst Softshell##74948 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Amethyst Softshell summoned.
|only if petlevel(2697) >= 25 and not completedq(74948)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Amethyst Softshell.>"_
|tip Your level 25 Amethyst Softshell must be summoned.
Show Your Max Level Amethyst Softshell to Briggul |q 74948/1 |goto 44.25,79.92
|only if petlevel(2697) >= 25 and not completedq(74948)
step
talk Briggul##201752
turnin Snailspiration: Amethyst Softshell##74948 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Amethyst Softshell summoned.
|only if petlevel(2697) >= 25 and not completedq(74948)
step
Summon Your Level 25 Blackchasm Crawler |complete activepet(2657) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(2657) >= 25 and not completedq(74950)
step
talk Briggul##201752
accept Snailspiration: Blackchasm Crawler##74950 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Blackchasm Crawler summoned.
|only if petlevel(2657) >= 25 and not completedq(74950)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Blackchasm Crawler.>"_
|tip Your level 25 Blackchasm Crawler must be summoned.
Show Your Max Level Blackchasm Crawler to Briggul |q 74950/1 |goto 44.25,79.92
|only if petlevel(2657) >= 25 and not completedq(74950)
step
talk Briggul##201752
turnin Snailspiration: Blackchasm Crawler##74950 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Blackchasm Crawler summoned.
|only if petlevel(2657) >= 25 and not completedq(74950)
step
Summon Your Level 25 Microlicid |complete activepet(3235) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(3235) >= 25 and not completedq(74952)
step
talk Briggul##201752
accept Snailspiration: Microlicid##74952 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Microlicid summoned.
|only if petlevel(3235) >= 25 and not completedq(74952)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Microlicid.>"_
|tip Your level 25 Microlicid must be summoned.
Show Your Max Level Microlicid to Briggul |q 74952/1 |goto 44.25,79.92
|only if petlevel(3235) >= 25 and not completedq(74952)
step
talk Briggul##201752
turnin Snailspiration: Microlicid##74952 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Microlicid summoned.
|only if petlevel(3235) >= 25 and not completedq(74952)
step
Summon Your Level 25 Mudshell Conch |complete activepet(1776) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(1776) >= 25 and not completedq(74959)
step
talk Briggul##201752
accept Snailspiration: Mudshell Conch##74959 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Mudshell Conch summoned.
|only if petlevel(1776) >= 25 and not completedq(74959)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Mudshell Conch.>"_
|tip Your level 25 Mudshell Conch must be summoned.
Show Your Max Level Mudshell Conch to Briggul |q 74959/1 |goto 44.25,79.92
|only if petlevel(1776) >= 25 and not completedq(74959)
step
talk Briggul##201752
turnin Snailspiration: Mudshell Conch##74959 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Mudshell Conch summoned.
|only if petlevel(1776) >= 25 and not completedq(74959)
step
Summon Your Level 25 Predatory Helicid |complete activepet(3219) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(3219) >= 25 and not completedq(74960)
step
talk Briggul##201752
accept Snailspiration: Predatory Helicid##74960 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Predatory Helicid summoned.
|only if petlevel(3219) >= 25 and not completedq(74960)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Predatory Helicid.>"_
|tip Your level 25 Predatory Helicid must be summoned.
Show Your Max Level Predatory Helicid to Briggul |q 74960/1 |goto 44.25,79.92
|only if petlevel(3219) >= 25 and not completedq(74960)
step
talk Briggul##201752
turnin Snailspiration: Predatory Helicid##74960 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Predatory Helicid summoned.
|only if petlevel(3219) >= 25 and not completedq(74960)
step
Summon Your Level 25 Prismatic Softshell |complete activepet(2698) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(2698) >= 25 and not completedq(74961)
step
talk Briggul##201752
accept Snailspiration: Prismatic Softshell##74961 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Prismatic Softshell summoned.
|only if petlevel(2698) >= 25 and not completedq(74961)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Prismatic Softshell.>"_
|tip Your level 25 Prismatic Softshell must be summoned.
Show Your Max Level Prismatic Softshell to Briggul |q 74961/1 |goto 44.25,79.92
|only if petlevel(2698) >= 25 and not completedq(74961)
step
talk Briggul##201752
turnin Snailspiration: Prismatic Softshell##74961 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Prismatic Softshell summoned.
|only if petlevel(2698) >= 25 and not completedq(74961)
step
Summon Your Level 25 Rapana Whelk |complete activepet(743) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(743) >= 25 and not completedq(74962)
step
talk Briggul##201752
accept Snailspiration: Rapana Whelk##74962 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Rapana Whelk summoned.
|only if petlevel(743) >= 25 and not completedq(74962)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Rapana Whelk.>"_
|tip Your level 25 Rapana Whelk must be summoned.
Show Your Max Level Rapana Whelk to Briggul |q 74962/1 |goto 44.25,79.92
|only if petlevel(743) >= 25 and not completedq(74962)
step
talk Briggul##201752
turnin Snailspiration: Rapana Whelk##74962 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Rapana Whelk summoned.
|only if petlevel(743) >= 25 and not completedq(74962)
step
Summon Your Level 25 Rusty Snail |complete activepet(496) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(496) >= 25 and not completedq(74963)
step
talk Briggul##201752
accept Snailspiration: Rusty Snail##74963 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Rusty Snail summoned.
|only if petlevel(496) >= 25 and not completedq(74963)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Rusty Snail.>"_
|tip Your level 25 Rusty Snail must be summoned.
Show Your Max Level Rusty Snail to Briggul |q 74963/1 |goto 44.25,79.92
|only if petlevel(496) >= 25 and not completedq(74963)
step
talk Briggul##201752
turnin Snailspiration: Rusty Snail##74963 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Rusty Snail summoned.
|only if petlevel(496) >= 25 and not completedq(74963)
step
Summon Your Level 25 Scooter the Snail |complete activepet(289) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(289) >= 25 and not completedq(74964)
step
talk Briggul##201752
accept Snailspiration: Scooter the Snail##74964 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Scooter the Snail summoned.
|only if petlevel(289) >= 25 and not completedq(74964)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Scooter the Snail.>"_
|tip Your level 25 Scooter the Snail must be summoned.
Show Your Max Level Scooter the Snail to Briggul |q 74964/1 |goto 44.25,79.92
|only if petlevel(289) >= 25 and not completedq(74964)
step
talk Briggul##201752
turnin Snailspiration: Scooter the Snail##74964 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Scooter the Snail summoned.
|only if petlevel(289) >= 25 and not completedq(74964)
step
Summon Your Level 25 Shelly |complete activepet(3222) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(3222) >= 25 and not completedq(74965)
step
talk Briggul##201752
accept Snailspiration: Shelly##74965 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Shelly summoned.
|only if petlevel(3222) >= 25 and not completedq(74965)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Shelly.>"_
|tip Your level 25 Shelly must be summoned.
Show Your Max Level Shelly to Briggul |q 74965/1 |goto 44.25,79.92
|only if petlevel(3222) >= 25 and not completedq(74965)
step
talk Briggul##201752
turnin Snailspiration: Shelly##74965 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Shelly summoned.
|only if petlevel(3222) >= 25 and not completedq(74965)
step
Summon Your Level 25 Shimmershell Snail |complete activepet(493) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(493) == 25 and not completedq(74786)
step
talk Briggul##201752
accept Snailspiration: Shimmershell Snail##74786 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Shimmershell Snail summoned.
|only if petlevel(493) >= 25 and not completedq(74786)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Shimmershell Snail.>"_
|tip Your level 25 Shimmershell Snail must be summoned.
Show Your Max Level Shimmershell Snail to Briggul |q 74786/1 |goto 44.25,79.92
|only if petlevel(493) >= 25 and not completedq(74786)
step
talk Briggul##201752
turnin Snailspiration: Shimmershell Snail##74786 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Shimmershell Snail summoned.
|only if petlevel(493) >= 25 and not completedq(74786)
step
Summon Your Level 25 Silkbead Snail |complete activepet(568) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(568) >= 25 and not completedq(74966)
step
talk Briggul##201752
accept Snailspiration: Silkbead Snail##74966 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Silkbead Snail summoned.
|only if petlevel(568) >= 25 and not completedq(74966)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Silkbead Snail.>"_
|tip Your level 25 Silkbead Snail must be summoned.
Show Your Max Level Silkbead Snail to Briggul |q 74966/1 |goto 44.25,79.92
|only if petlevel(568) >= 25 and not completedq(74966)
step
talk Briggul##201752
turnin Snailspiration: Silkbead Snail##74966 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Silkbead Snail summoned.
|only if petlevel(568) >= 25 and not completedq(74966)
step
Summon Your Level 25 Spireshell Snail |complete activepet(2653) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(2653) >= 25 and not completedq(74967)
step
talk Briggul##201752
accept Snailspiration: Spireshell Snail##74967 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Spireshell Snail summoned.
|only if petlevel(2653) >= 25 and not completedq(74967)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Spireshell Snail.>"_
|tip Your level 25 Spireshell Snail must be summoned.
Show Your Max Level Spireshell Snail to Briggul |q 74967/1 |goto 44.25,79.92
|only if petlevel(2653) >= 25 and not completedq(74967)
step
talk Briggul##201752
turnin Snailspiration: Spireshell Snail##74967 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Spireshell Snail summoned.
|only if petlevel(2653) >= 25 and not completedq(74967)
step
Summon Your Level 25 Zoom |complete activepet(1903) |goto 44.25,79.92
|tip You can complete a special quest for having this pet at max level.
|only if petlevel(1903) >= 25 and not completedq(74968)
step
talk Briggul##201752
accept Snailspiration: Zoom##74968 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Zoom summoned.
|only if petlevel(1903) >= 25 and not completedq(74968)
step
talk Briggul##201752
Choose _"<Show Briggul your level 25 Zoom.>"_
|tip Your level 25 Zoom must be summoned.
Show Your Max Level Zoom to Briggul |q 74968/1 |goto 44.25,79.92
|only if petlevel(1903) >= 25 and not completedq(74968)
step
talk Briggul##201752
turnin Snailspiration: Zoom##74968 |goto 44.25,79.92
|tip This quest will only appear with your level 25 Zoom summoned.
|only if petlevel(1903) >= 25 and not completedq(74968)
step
talk Briggul##201752
Tell her _"I am ready."_
|tip You will mount a snail.
|tip Don't dismount the snail or you will have to return to get another one.
Collect the Package from Briggul |q 74515/1 |goto Zaralek Cavern/0 44.26,79.93
|only if haveq(74515) or completedq(74515)
step
map Zaralek Cavern/0
path follow smart; loop off; ants curved; dist 15
path	43.94,80.45	42.95,78.82	41.82,73.65	42.34,70.36	44.35,68.05
path	46.11,67.01	48.07,66.78	49.92,66.99	51.93,65.08	53.01,62.72
path	54.20,59.17	55.43,56.24	55.89,55.50
talk Terryn##202277
Tell him _"Delivery!"_
|tip Don't dismount the snail or you will have to return to get another one.
|tip Run through the circles for a speed boost.
|tip Follow the path into Loamm.
Deliver the Package to Loamm |q 74515/2
|only if haveq(74515) or completedq(74515)
step
Stop Riding Big Slick |outvehicle |script VehicleExit() |q 74515
|only if haveq(74515) or completedq(74515)
step
click Glowing Crystal##387725+
|tip They look like small blue crystals on the ground around this area.
collect 5 Glowing Crystal##204067 |q 74518/1 |goto 38.02,70.67
|only if haveq(74518) or completedq(74518)
step
click Magma Crystal##387729+
|tip They look like small orangish crystals on the ground near the lava.
collect 5 Magma Crystal##204070 |q 74518/3 |goto 44.44,52.33
|only if haveq(74518) or completedq(74518)
step
click Sulfuric Crystal##387727
|tip They look like small brown spheres on the ground around this area.
collect 5 Sulfuric Crystal##204069 |q 74518/2 |goto 50.24,59.67
|only if haveq(74518) or completedq(74518)
step
clicknpc Aimless Snail##201875
use the Snailcatcher Net##204178
|tip Use it on Aimless Snails.
Capture #8# Aimless Snails |q 74514/1 |goto 49.10,70.07
|only if haveq(74514) or completedq(74514)
step
use the Conch Whistle##203708
Ride Big Slick |invehicle |q 74516 |goto 44.52,80.22
|only if haveq(74516) or completedq(74516)
step
map Zaralek Cavern/0
path follow smart; loop on; ants curved; dist 10
path	44.53,80.23	44.86,80.52	44.96,80.93	44.70,81.20	44.50,81.11
path	44.27,80.79	44.14,80.40	44.27,80.22
Pass #12# Track Markers While Riding Big Slick |q 74516/1
|tip Run through the orange markers on the ground.
|only if haveq(74516) or completedq(74516)
step
Kill enemies around this area
Collect Slime |q 74519/1 |goto 39.25,41.54
[40.66,46.74]
[34.72,43.69]
[27.45,46.12]
|only if haveq(74519) or completedq(74519)
step
use the Conch Whistle##203708
Ride Big Slick |invehicle |goto Ohn'ahran Plains/0 78.12,29.75 |q 74517
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Wanderer's Steppe |q 74517/2 |count 1 |goto 78.00,29.66
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Wanderer's Steppe |q 74517/2 |count 2 |goto 78.51,32.13
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Wanderer's Steppe |q 74517/2 |count 3 |goto 77.39,32.14
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Wanderer's Steppe |q 74517/2 |count 4 |goto 77.00,33.84
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Wanderer's Steppe |q 74517/2 |count 5 |goto 76.19,31.86
|only if haveq(74517) or completedq(74517)
step
Stop Riding Big Slick |outvehicle |script VehicleExit() |q 74517
|only if haveq(74517) or completedq(74517)
step
use the Conch Whistle##203708
Ride Big Slick |invehicle |goto The Waking Shores/0 79.09,46.83 |q 74517
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Restless Wetlands |q 74517/1 |count 1 |goto 79.09,46.83
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Restless Wetlands |q 74517/1 |count 2 |goto 77.91,46.70
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Restless Wetlands |q 74517/1 |count 3 |goto 78.22,44.73
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Restless Wetlands |q 74517/1 |count 4 |goto 79.26,44.59
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Restless Wetlands |q 74517/1 |count 5 |goto 80.02,44.57
|only if haveq(74517) or completedq(74517)
step
Stop Riding Big Slick |outvehicle |script VehicleExit() |q 74517
|only if haveq(74517) or completedq(74517)
step
use the Conch Whistle##203708
Ride Big Slick |invehicle |goto Thaldraszus/0 58.92,79.61 |q 74517
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Shifting Sands |q 74517/4 |count 1 |goto 58.92,79.61
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Shifting Sands |q 74517/4 |count 2 |goto 58.15,79.59
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Shifting Sands |q 74517/4 |count 3 |goto 57.72,81.14
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Shifting Sands |q 74517/4 |count 4 |goto 58.43,81.68
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Shifting Sands |q 74517/4 |count 5 |goto 58.94,82.28
|only if haveq(74517) or completedq(74517)
step
Stop Riding Big Slick |outvehicle |script VehicleExit() |q 74517
|only if haveq(74517) or completedq(74517)
step
use the Conch Whistle##203708
Ride Big Slick |invehicle |goto The Azure Span/0 62.77,31.28 |q 74517
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Upper Frostlands |q 74517/3 |count 1 |goto 62.77,31.28
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Upper Frostlands |q 74517/3 |count 2 |goto 62.23,32.16
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Upper Frostlands |q 74517/3 |count 3 |goto 61.43,33.30
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Upper Frostlands |q 74517/3 |count 4 |goto 60.98,31.59
|only if haveq(74517) or completedq(74517)
step
Place the Snail Marker in the Upper Frostlands |q 74517/3 |count 5 |goto 61.12,30.27
|only if haveq(74517) or completedq(74517)
step
Stop Riding Big Slick |outvehicle |script VehicleExit() |q 74517
|only if haveq(74517) or completedq(74517)
step
Kill Zaqali enemies around this area
collect 10 Stolen Supplies##204273 |q 74520/1 |goto 39.98,49.25
|only if haveq(74520) or completedq(74520)
step
talk Briggul##201752
turnin Resistance Training##74518 |goto Zaralek Cavern/0 44.25,79.92 |only if haveq(74518) or completedq(74518)
turnin A Snail's Pace##74516 |goto 44.25,79.92 |only if haveq(74516) or completedq(74516)
turnin The Slowest Fan Club##74514 |goto 44.25,79.92 |only if haveq(74514) or completedq(74514)
turnin Good for Goo##74519 |goto 44.25,79.92 |only if haveq(74519) or completedq(74519)
turnin All Terrain Snail##74517 |goto 44.25,79.92 |only if haveq(74517) or completedq(74517)
turnin Snail Mail##74515 |goto 44.25,79.92 |only if haveq(74515) or completedq(74515)
turnin Less Cargo##74520 |goto 44.25,79.92 |only if haveq(74520) or completedq(74520)
step
You have completed the daily quest for the day
|tip You can gain additional Glimmerogg Racer reputation by acquiring certain snail battle pets and leveling them to 25.
You can complete the following snail pet quests:
|tip Level them to level 25 and summon them next to Briggul to get the quest.
|tip Amethyst Softshell |only if not completedq(74948)
|tip Blackchasm Crawler |only if not completedq(74950)
|tip Microlicid |only if not completedq(74952)
|tip Mudshell Conch |only if not completedq(74959)
|tip Predatory Helicid |only if not completedq(74960)
|tip Prismatic Softshell |only if not completedq(74961)
|tip Rapana Whelk |only if not completedq(74962)
|tip Rusty Snail |only if not completedq(74963)
|tip Scooter the Snail |only if not completedq(74964)
|tip Shelly |only if not completedq(74965)
|tip Shimmershell Snail |only if not completedq(74786)
|tip Silkbead Snail |only if not completedq(74966)
|tip Spireshell Snail |only if not completedq(74967)
|tip Zoom |only if not completedq(74968)
'|complete not completedq(74518,74516,74514,74519,74517,74515,74520) |next "Begin_Daily_Quests" |or
'|complete petlevel(2697) >= 25 and not completedq(74948) |next "Begin_Daily_Quests" |or
'|complete petlevel(2657) >= 25 and not completedq(74950) |next "Begin_Daily_Quests" |or
'|complete petlevel(3235) >= 25 and not completedq(74952) |next "Begin_Daily_Quests" |or
'|complete petlevel(1776) >= 25 and not completedq(74959) |next "Begin_Daily_Quests" |or
'|complete petlevel(3219) >= 25 and not completedq(74960) |next "Begin_Daily_Quests" |or
'|complete petlevel(2698) >= 25 and not completedq(74961) |next "Begin_Daily_Quests" |or
'|complete petlevel(743) >= 25 and not completedq(74962) |next "Begin_Daily_Quests" |or
'|complete petlevel(496) >= 25 and not completedq(74963) |next "Begin_Daily_Quests" |or
'|complete petlevel(289) >= 25 and not completedq(74964) |next "Begin_Daily_Quests" |or
'|complete petlevel(3222) >= 25 and not completedq(74965) |next "Begin_Daily_Quests" |or
'|complete petlevel(493) >= 25 and not completedq(74786) |next "Begin_Daily_Quests" |or
'|complete petlevel(568) >= 25 and not completedq(74966) |next "Begin_Daily_Quests" |or
'|complete petlevel(2653) >= 25 and not completedq(74967) |next "Begin_Daily_Quests" |or
'|complete petlevel(1903) >= 25 and not completedq(74968) |next "Begin_Daily_Quests" |or
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Suffusion Camp (Ohn'ahran Plains)",{
author="support@zygorguides.com",
startlevel=68,
patch='100100',
areapoiid=7471,
areapoitype="Fyrakk",
},[[
step
talk Kalecgos##205647+
accept Fyrakk's Forces##75887 |goto Zaralek Cavern/0 55.65,54.93
step
talk Somnikus##201648
turnin Fyrakk's Forces##75887 |goto Ohn'ahran Plains/0 75.21,69.31
accept Suffusion Camp##75888 |goto 75.21,69.31
stickystart "Fyrakk_is_Coming"
stickystart "Slay_the_Disciple_of_Fyrakk"
step
label "Begin_Dailies"
Talk to NPCs around this area
accept Aerial Support##74573 |goto 75.30,69.70 |only if questpossible |or 3
accept Volunteer Fire Fighters##75181 |goto 75.30,69.70 |only if questpossible |or 3
accept Air Control##75168 |goto 75.30,69.70 |only if questpossible |or 3
accept They Who Would Burn Us##74568 |goto 75.30,69.70 |only if questpossible |or 3
accept Deny Them Resources##74569 |goto 75.30,69.70 |only if questpossible |or 3
accept Aid Our Wounded##74570 |goto 75.30,69.70 |only if questpossible |or 3
accept Clear a Path##74571 |goto 75.30,69.70 |only if questpossible |or 3
accept Grand Theft Mammoth##75182 |goto 75.30,69.70 |only if questpossible |or 3
Accept the Weelky Quests |complete false |goto 75.30,69.70 |or 3
|tip Accept the weekly quests around the camp.
step
clicknpc Water Elemental##203244
Activate the Water Spout Totem |q 75181/1 |goto 75.63,69.21
|only if haveq(75181) or completedq(75181)
step
Extinguish the Fires |q 75181/2
|tip Use the buttons on your vehicle bar to put out the fires in front of you.
|only if haveq(75181) or completedq(75181)
stickystart "Collect_Ward_of_Igira"
stickystart "Collect_Ward_of_Fyrakk"
stickystart "Kill_Primal_Nightflame"
stickystart "Slay_Fyrakk's_Forces"
stickystart "Heal_Allies"
stickystart "Collect_Suffused_Ingots"
stickystart "Destroy_Djaradin_Barricades"
step
clicknpc Overladen Hauler##203296
Liberate an Overladen Hauler |q 75182/1 |goto 75.02,73.38
|only if haveq(75182) or completedq(75182)
stickystop "Heal_Allies"
stickystop "Collect_Ward_of_Igira"
stickystop "Collect_Ward_of_Fyrakk"
step
Return the Mammoth to Safety |q 75182/2 |goto 75.62,69.91
|tip Run it back to this location.
|tip Attack any enemies that climb aboard to knock them off.
|only if haveq(75182) or completedq(75182)
step
clicknpc Primalist Portal##203460
Weaken the Primalist Portal |q 74573/1 |goto 73.47,70.06 |count 1
|only if haveq(74573) or completedq(74573)
step
clicknpc Primalist Portal##203485
Weaken the Primalist Portal |q 74573/1 |goto 73.13,72.29 |count 2
|only if haveq(74573) or completedq(74573)
step
clicknpc Primalist Portal##203488
Weaken the Primalist Portal |q 74573/1 |goto 74.75,72.02 |count 3
|only if haveq(74573) or completedq(74573)
step
label "Collect_Ward_of_Igira"
Kill enemies around this area
collect 5 Ward of Igira##203430 |goto 73.88,71.44 |q 75888
|only if haveq(75888) or completedq(75888)
step
click Suffusion Crucible
|tip You can find several more nearby.
|tip They appear on your minimap as yellow dots.
Loot the Suffusion Crucible |q 75888/1 |goto 73.88,71.20
|tip Looting the crucible will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
|only if haveq(75888) or completedq(75888)
step
label "Collect_Ward_of_Fyrakk"
Kill enemies around this area
|tip More powerful elite enemies will sometimes drop wards.
|tip You can also acquire them looting Suffusion Crucibles.
collect 5 Ward of Fyrakk##203683 |goto 73.88,71.44 |q 75888
|only if haveq(75888) or completedq(75888)
step
click Suffusion Mold
Loot the Suffusion Mold |q 75888/2 |goto 74.27,72.28
|tip Looting the mold will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
|only if haveq(75888) or completedq(75888)
step
label "Kill_Primal_Nightflame"
kill 4 Primal Nightflame##200931 |q 75168/1 |goto 74.97,69.57
|tip These enemies are elite and may require a group.
|tip You can use your "Whirling Surge" dragonriding ability through the non-attackble flying mobs.
|only if haveq(75168) or completedq(75168)
step
label "Slay_Fyrakk's_Forces"
Kill enemies around this area
Slay #8# Fyrakk's Forces |q 74568/1 |goto 75.03,69.52
|only if haveq(74568) or completedq(74568)
step
label "Heal_Allies"
clicknpc Wounded Guardian##201896+
|tip They look like wounded NPCs kneeling with blood drops over their heads.
use the Enchanted Bandage##203731
Heal #6# Allies |q 74570/1 |goto 73.75,71.30
|only if haveq(74570) or completedq(74570)
step
label "Collect_Suffused_Ingots"
click Infusion Supplies##386649+
|tip They look like large pots on the ground around this area.
collect 6 Suffused Ingots##204699 |q 74569/1 |goto 73.75,71.30
|only if haveq(74569) or completedq(74569)
step
label "Destroy_Djaradin_Barricades"
click Djaradin Barricade+
|tip They look like crude walls on the ground around this area.
Destroy #6# Djaradin Barricades |q 74571/1 |goto 74.71,71.05
|only if haveq(74571) or completedq(74571)
step
talk Mayla Highmountain##201090
|tip She may run away periodically and come back.
turnin Air Control##75168 |goto 74.97,69.57 |only if haveq(75168) or completedq(75168)
turnin They Who Would Burn Us##74568 |goto 74.97,69.57 |only if haveq(74568) or completedq(74568)
|only if haveq(75168,74568) or completedq(75168,74568)
step
talk Baine Bloodhoof##201876
turnin Clear a Path##74571 |goto 75.12,69.89
|only if haveq(74571) or completedq(74571)
step
talk Somnikus##201648
turnin Suffusion Camp##75888 |goto 75.21,69.31 |only if haveq(75888) and not completedq(75888)
turnin Aerial Support##74573 |goto 75.21,69.31 |only if haveq(74573) or completedq(74573)
|only if (haveq(75888) and not completedq(75888)) or haveq(74573) or completedq(74573)
step
talk Khanam Matra Sarest##201860
turnin Deny Them Resources##74569 |goto 75.62,69.91 |only if haveq(74569) or completedq(74569)
turnin Disciple of Fyrakk: Kretchenwrath##74775 |goto 75.62,69.91 |only if readyq(74775)
turnin Grand Theft Mammoth##75182 |goto 75.62,69.91 |only if haveq(75182) or completedq(75182)
|only if haveq(74569,75182) or completedq(74569,75182) or readyq(74775)
step
talk Tigari Khan##201861
turnin Aid Our Wounded##74570 |goto 75.56,69.34 |only if haveq(74570) or completedq(74570)
turnin Volunteer Fire Fighters##75181 |goto 75.69,69.09 |only if haveq(75181) or completedq(75181)
|only if haveq(74570,75181) or completedq(74570,75181)
step
You have completed the available quests and this Suffusion Camp
|tip This guide will reset when more become available.
|tip You can continue to farm Wards for future weekly quests.
'|complete not completedq(75168,74568,74573,74569,75182,74570,75181) |next "Begin_Dailies"
step
label "Fyrakk_is_Coming"
Fyrakk is Coming! |scenariostage 1 |goto Ohn'ahran Plains/0 73.70,71.41
|tip Fyrakk will arrive in a couple of minutes and you will be attacked by his Disciple.
|only if scenariostage(1)
step
label "Slay_the_Disciple_of_Fyrakk"
Slay the Disciple of Fyrakk |scenariogoal 2/0 |goto 75.68,69.33
|tip Kill the elite that spawns.
|tip You will need a large group for this.
|tip Move out of areas on the ground and be prepared to be knocked back frequently.
|only if scenariostage(2)
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Suffusion Camp (The Azure Span)",{
author="support@zygorguides.com",
startlevel=68,
patch='100100',
areapoiid=7433,
areapoitype="Fyrakk",
},[[
step
talk Kalecgos##205647
accept Fyrakk's Forces##75887 |goto Zaralek Cavern/0 55.65,54.93
step
talk The Blubberwall##203601
turnin Fyrakk's Forces##75887 |goto The Azure Span/0 57.82,34.45
accept Suffusion Camp##75888 |goto 57.82,34.45
stickystart "Fyrakk_is_Coming"
stickystart "Slay_the_Disciple_of_Fyrakk"
step
label "Begin_Dailies"
Talk to NPCs around this area
accept Hideaway No More##75383 |goto 58.24,34.30 |only if questpossible |or 3
accept Payback's a Mammoth##75384 |goto 58.24,34.30 |only if questpossible |or 3
accept Charge of the Ottuk Brigade##75373 |goto 58.24,34.30 |only if questpossible |or 3
accept Portal Combat##75382 |goto 58.24,34.30 |only if questpossible |or 3
accept To Defend the Span##75374 |goto 58.24,34.30 |only if questpossible |or 3
accept Burning Ice##75375 |goto 58.24,34.30 |only if questpossible |or 3
accept Maintaining the Barricade##75377 |goto 58.24,34.30 |only if questpossible |or 3
Accept the Weekly Quests |complete false |goto 58.24,34.30 |or 3
|tip Accept the weekly quests around the camp.
step
clicknpc Water Elemental##203244
Activate the Water Spout Totem |q 75383/1 |goto 58.51,31.94
|only if haveq(75383) or completedq(75383)
step
Extinguish the Fires |q 75383/2
|tip Use the buttons on your vehicle bar to put out the fires in front of you.
|only if haveq(75383) or completedq(75383)
step
Collect Water on a Drake |q 75375/1 |goto 58.56,34.54
|tip Mount up on your drake and run through the gold rings on the ground to pick up water.
|only if haveq(75375) or completedq(75375)
step
extraaction Dump Water##405872
|tip Keep flying water to the flaming patches on the ground all over the ice.
|tip Use the ability on your screen to dump all of your water and extinguinsh several nearby fires.
Extinguish Fires |q 75375/2 |goto 55.29,32.73
You can get more water on your drake at [58.56,34.54]
|only if haveq(75375) or completedq(75375)
stickystart "Heal_Allies"
stickystart "Collect_Ward_of_Igira"
stickystart "Collect_Ward_of_Fyrakk"
stickystart "Knock_Primal_Nightflames_to_the_Ground"
step
click Djaradin Barricade+
|tip They look like small walls with tusks sticking out of them around this area.
Destroy #6# Djaradin Barricades |q 75373/1 |goto 57.14,34.08
You can find more around:
[54.16,34.10]
[52.38,32.89]
[56.26,31.68]
|only if haveq(75373) or completedq(75373)
step
clicknpc Overladen Hauler##203296
Liberate an Overladen Hauler |q 75384/1 |goto 54.68,32.45
|only if haveq(75384) or completedq(75384)
stickystop "Heal_Allies"
stickystop "Collect_Ward_of_Igira"
stickystop "Collect_Ward_of_Fyrakk"
stickystop "Knock_Primal_Nightflames_to_the_Ground"
step
Return the Mammoth to Safety |q 75384/2 |goto 58.46,33.50
|tip Run it back to this location.
|tip Attack any enemies that climb aboard to knock them off.
|only if haveq(75384) or completedq(75384)
stickystart "Heal_Allies"
stickystart "Knock_Primal_Nightflames_to_the_Ground"
step
click Primalist Portal
Weaken the Primalist Portal |q 75382/1 |goto 55.05,34.17 |count 1
|only if haveq(75382) or completedq(75382)
step
click Primalist Portal
Weaken the Primalist Portal |q 75382/1 |goto 53.71,32.17 |count 2
|only if haveq(75382) or completedq(75382)
step
click Primalist Portal
Weaken the Primalist Portal |q 75382/1 |goto 56.30,30.76 |count 3
|only if haveq(75382) or completedq(75382)
step
label "Collect_Ward_of_Igira"
Kill enemies around this area
collect 5 Ward of Igira##203430 |goto 54.57,33.49 |q 75888
|only if haveq(75888) or completedq(75888)
step
click Suffusion Crucible
|tip You can find several more nearby.
|tip They appear on your minimap as yellow dots.
Loot the Suffusion Crucible |q 75888/1 |goto 54.77,33.18
|tip Looting the crucible will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
|only if haveq(75888) or completedq(75888)
step
label "Collect_Ward_of_Fyrakk"
Kill enemies around this area
|tip More powerful elite enemies will sometimes drop wards.
|tip You can also acquire them looting Suffusion Crucibles.
collect 5 Ward of Fyrakk##203683 |goto 54.57,33.49 |q 75888
|only if haveq(75888) or completedq(75888)
step
click Suffusion Mold
Loot the Suffusion Mold |q 75888/2 |goto 55.43,35.22
|tip Looting the mold will cause a pair of elite enemies to spawn and attack you.
|tip Clear the area and get some help to kill them.
|only if haveq(75888) or completedq(75888)
step
label "Heal_Allies"
clicknpc Gruff Fisher##203710+
use the Enchanted Bandage##203731
|tip Use them on Gruff Fishers around this area.
|tip You can also heal them with your own abilities.
Heal #6# Allies |q 75374/1 |goto 54.53,32.92
|only if haveq(75374) or completedq(75374)
step
label "Knock_Primal_Nightflames_to_the_Ground"
kill Primal Nightflame##200931+
|tip Use "Whirling Surge" on them in the air while flying on your drake.
|tip You can also kill them on the ground.
Knock #4# Primal Nightflames to the Ground or Slay Them |q 75377/1 |goto 55.59,32.69
|only if haveq(75377) or completedq(75377)
step
talk The Blubberwall##203601
turnin Suffusion Camp##75888 |goto 57.82,34.44 |only if haveq(75888) and not completedq(75888)
turnin Charge of the Ottuk Brigade##75373 |goto 57.82,34.44 |only if haveq(75373) or completedq(75373)
|only if (haveq(75888) and not completedq(75888)) or haveq(75373) or completedq(75373)
step
talk Old Grimtusk##203604
turnin Hideaway No More##75383 |goto 58.46,33.51 |only if haveq(75383) or completedq(75383)
turnin Payback's a Mammoth##75384 |goto 58.46,33.51 |only if haveq(75384) or completedq(75384)
|only if haveq(75383,75384) or completedq(75383,75384)
step
talk Archmage Khadgar##203522
turnin Maintaining the Barricade##75377 |goto 58.42,34.52
|only if haveq(75377) or completedq(75377)
step
talk Stellagosa##203520
turnin Portal Combat##75382 |goto 57.95,34.52
|only if haveq(75382) or completedq(75382)
step
talk Brena##203603
turnin Disciple of Fyrakk: Shadeisethal##75239 |goto 58.64,34.35 |only if readyq(75239)
turnin To Defend the Span##75374 |goto 58.64,34.35 |only if haveq(75374) or completedq(75374)
turnin Burning Ice##75375 |goto 58.64,34.35 |only if haveq(75375) or completedq(75375)
|only if readyq(75239) or haveq(75374,75375) or completedq(75374,75375)
step
You have completed the available quests and this Suffusion Camp
|tip This guide will reset when more become available.
|tip You can continue to farm Wards for future weekly quests.
'|complete not completedq(75373,75383,75384,75377,75382,75374,75375) or readyq(75373,75383,75384,75377,75382,75374,75375) |next "Begin_Dailies" |or
'|complete inscenario() |or
step
label "Fyrakk_is_Coming"
Fyrakk is Coming! |scenariogoal 1/58008 |goto 58.17,31.75
|tip Fyrakk will arrive in a couple of minutes and you will be attacked by his Disciple.
|only if scenariostage(1)
step
label "Slay_the_Disciple_of_Fyrakk"
Slay the Disciple of Fyrakk |scenariogoal 2/0 |goto 58.17,31.75 |next "Begin_Dailies"
|tip Kill the elite that spawns.
|tip You will need a large group for this.
|tip Move out of areas on the ground and be prepared to be knocked back frequently.
|only if scenariostage(2)
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Researchers Under Fire",{
author="support@zygorguides.com",
startlevel=68,
patch='100100',
areapoiid=7461,
areapoitype="RUF",
},[[
step
label "Begin_Scenario"
Wait for the Scenario to Begin |complete areapoi(2133,7461) and inscenario() |goto Zaralek Cavern/0 47.59,56.72
|tip The scenario starts every hour on the half hour.
|tip Steps that have progress bars are currently bugged and may complete early.
|tip This scenario has been heavily bugged.
step
Kill enemies around this area
Defeat the Three Patrols |scenariostage 1 |goto 48.00,55.19
You can find the other patrols at:
[48.65,57.94]
[46.64,57.96]
|only if scenariostage(1)
step
Kill enemies around this area
Clear the Titan Forces |scenariogoal 2/0 |goto 46.05,61.85
|only if scenariostage(2)
stickystart "Gather_Titan_Parts"
step
Destroy #2# Large Boulders |scenariogoal 3/58766 |goto 45.99,61.39
|tip Return Titan parts to clear the boulders.
|only if scenariogoal(58766)
step
label "Gather_Titan_Parts"
Click Titan objects around this area
|tip They look like gears and random objects on the ground around this area.
|tip Run them to the console nearby.
Gather #50# Titan Parts |scenariogoal 3/58836 |goto 45.99,61.39
|only if scenariogoal(58836)
step
Kill enemies that attack in waves
Defeat the Attacking Wildlife |scenariogoal 4/0 |goto 45.99,61.39
|only if scenariostage(4)
step
kill Fallen Boulder##204071+
Destroy #12# Cave Boulders |scenariogoal 5/58841 |goto 44.84,62.42
|only if scenariostage(5)
step
kill Contaminated Titan Watcher##203834 |scenariogoal 6/58842 |goto 45.05,62.13
|tip It comes out of the cave.
|only if scenariostage(6)
step
click Curious Ore Sample+
|tip They look like small rocks on the ground around this area.
Collect #60# Curious Ore Samples |scenariogoal 7/58837 |goto 46.45,62.98
Run them to consoles at:
[46.37,62.14]
[45.85,61.03]
|only if scenariostage(7)
step
Complete the Scenario Stage |scenariogoal 8/0
|tip Scenario info coming soon.
|only if scenariostage(8)
step
Complete the Scenario Stage |scenariogoal 9/0
|tip Scenario info coming soon.
|only if scenariostage(9)
stickystart "Defeat_the_Titan_Forces"
step
kill Response Team Watcher##202318 |scenariogoal 10/58864 |goto 47.62,63.05
|only if scenariogoal(58864)
step
label "Defeat_the_Titan_Forces"
Kill enemies around this area
Defeat the Titan Forces |scenariogoal 10/0 |goto 47.62,63.05
|only if scenariostage(10)
step
Kill enemies around this area
Clear the Wildlife |scenariogoal 11/0 |goto 47.58,57.61
|only if scenariostage(11)
step
kill Cavern Flayer Matriarch##202309 |scenariogoal 12/58849 |goto 45.62,57.70
|only if scenariogoal(58849)
step
Kill enemies around this area
Clear the Ruin Wildlife |scenariogoal 13/0 |goto 43.90,56.49
|only if scenariostage(13)
step
Complete the Scenario Stage |scenariogoal 14/0
|tip Scenario info coming soon.
|only if scenariostage(14)
step
Complete the Scenario Stage |scenariogoal 15/0
|tip Scenario info coming soon.
|only if scenariostage(15)
step
Complete the Scenario Stage |scenariogoal 16/0
|tip Scenario info coming soon.
|only if scenariostage(16)
step
Complete the Scenario Stage |scenariogoal 17/0
|tip Scenario info coming soon.
|only if scenariostage(17)
step
Complete the Scenario Stage |scenariogoal 18/0
|tip Scenario info coming soon.
|only if scenariostage(18)
step
Complete the Scenario Stage |scenariogoal 19/0
|tip Scenario info coming soon.
|only if scenariostage(19)
step
Kill enemies around this area
|tip They appear on your minimap as yellow dots.
Defeat the Sundered Flame Forces |scenariogoal 20/0 |goto 48.14,54.71
You can find more around:
[48.86,58.63]
[46.56,58.41]
|only if scenariostage(20)
step
kill Captain Reykal##203355 |scenariogoal 21/58609 |goto 49.12,57.70
|only if scenariogoal(58609)
step
talk Rannan Korren##203274
Tell him _"We are clear to withdraw the rest of the expedition"_
Talk to Rannan to Complete this Expedition |scenariogoal 22/58255 |goto 47.70,57.86
|only if scenariostage(22)
step
Wait for a New Scenario Stage |complete areapoi(2133,7461) and inscenario() |goto 47.59,56.72 |next "Begin_Scenario"
|tip This scenario has been heavily bugged.
|only if inscenario()
step
Wait for the Researchers to Assemble |complete areapoi(2133,7461) and inscenario() |goto 47.59,56.72 |next "Begin_Scenario"
|tip The scenario starts every hour on the half hour.
|tip This scenario has been heavily bugged.
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Time Rifts",{
author="support@zygorguides.com",
description="This guide will help you complete the various random stages and bosses of the Time Rift event in Thaldraszus.",
startlevel=70,
patch='100105',
},[[
step
Click Here to Proceed |confirm
|tip Killing enemies and clicking random objects increases the amount of Temporal Essence collected.
|tip More Temporal Essence increases the quality of the reward box.
|tip Be on the lookout for random quest objects through the entire Time Rift.
|tip If one spawns, accept the quest to turn in later.
|tip A new time rift begins at the beginning of every hour.
step
label "Begin"
talk Soridormi##204450
accept When Time Needs Mending##77236 |goto Thaldraszus/0 51.09,57.08
step
Wait for a Time Rift to Begin |complete widgetactive(7492,845) or inscenario() |goto 51.09,57.08
|tip Killing enemies and clicking random objects increases the amount of Temporal Essence collected.
|tip More Temporal Essence increases the quality of the reward box.
|tip Be on the lookout for random quest objects through the entire Time Rift.
|tip If one spawns, accept the quest to turn in later.
|tip A new time rift begins at the beginning of every hour.
stickystart "Scenario_Information"
step
talk Soridormi##204450
Tell her _"(Begin Time Rift) Random, reporting in for duty!"_
Report in to Soridormi |scenariogoal 1/60256 |goto 51.09,57.08 |or
'|complete true |or |only if scenariogoal(60685) or scenariogoal(60692) or scenariogoal(60689) or scenariogoal(60693) or scenariogoal(60688) or scenariogoal(60691) or scenariogoal(60690)
step
Kill enemies around these areas
Defeat all Time Rift Enemies |scenariogoal 2/59157 |goto Tyrhold Reservoir/0 65.35,57.61
You can find more around:
[40.70,56.77]
[46.68,28.47]
|only if scenariogoal(59157) and scenariostage(2)
step
Kill enemies around this area
Defeat as Many Krrrn Trr Murlocs as Possible |scenariogoal 3/59104 |goto 49.99,28.50
|only if scenariogoal(59104) and scenariostage(3)
step
Kill enemies around this area
Defeat as Many MR-7 Murlocs as Possible |scenariogoal 4/59106 |goto 38.78,58.39
|only if scenariogoal(59106) and scenariostage(4)
step
Kill Cenrrrn Cirrgl enemies around this area
Defeat as Many Cenrrrn Cirrgl Murlocs as Possible |scenariogoal 5/59107 |goto 72.60,65.86
|only if scenariogoal(59107) and scenariostage(5)
step
kill Grrrmrrsh Hrrnglscrrrm##204412 |scenariogoal 6/59124 |goto 49.46,38.47
|only if scenariogoal(59124) and scenariostage(6)
step
click Scareloc Parts##401830+
|tip They look like large planks of wood on the ground around this area.
collect 5 Scareloc Parts##208029 |scenariogoal 7/59487 |goto 68.69,34.83
|only if scenariogoal(59487) and scenariostage(7)
step
kill Gillidan##205036 |scenariogoal 8/59231 |goto 49.88,49.05
|only if scenariogoal(59231) and scenariostage(8)
step
kill Minion of Deathwingurlugull##205037 |scenariogoal 9/59232 |goto 41.70,40.86
|only if scenariogoal(59232) and scenariostage(9)
step
click Frightened Baby Murloc+
extraaction Throw Baby Murloc##410328
|tip Toss it in the portal.
Save all the Frightened Baby Murlocs |scenariogoal 10/59408 |goto 60.15,63.22
|only if scenariogoal(59408) and scenariostage(10)
step
clicknpc Wandering Baby Murloc##205165+
extraaction Throw Baby Murloc##410746
|tip Throw them in a nearby portal or to another nearby player.
Save All the Wandering Baby Murlocs |scenariogoal 11/60052 |goto 65.30,58.85
|only if scenariogoal(60052) and scenariostage(11)
step
clicknpc Giant Egg##205206
Tow the Giant Egg Back to Its Portal |scenariogoal 12/59434 |goto 33.80,48.94
Drag it with other players to the time portal at [41.01,68.52]
|only if scenariogoal(59434) and scenariostage(12)
step
Pop the Azmerloth Bubblemancer's Bubbles |scenariogoal 13/59563 |goto 52.81,55.34
|tip The Azmerloth Bubblemancer runs in a big circle around the reservoir.
|tip Run through the bubbles all over the reservoir area around it.
|only if scenariogoal(59563) and scenariostage(13)
step
kill Azmerloth Bubblemancer##205374 |scenariogoal 14/59598 |goto 52.81,55.34
|tip It runs in a big circle around the reservoir.
|only if scenariogoal(59598) and scenariostage(14)
step
kill Stinky Pile of Dead Fish##205295 |scenariogoal 15/59512 |goto 68.61,73.79
|only if scenariogoal(59512) and scenariostage(15)
step
kill Stinky Basket of Dead Fish##205298 |scenariogoal 16/59513 |goto 41.94,29.53
|only if scenariogoal(59513) and scenariostage(16)
step
kill Stinky Barrel of Dead Fish##205299 |scenariogoal 17/60051 |goto 37.49,57.89
|only if scenariogoal(60051) and scenariostage(17)
stickystart "Heal_Hrngl"
stickystart "Heal_Mr_Mrmrmr"
step
clicknpc Glurpy##205335
Heal Glurpy |scenariogoal 18/59514 |goto 42.85,51.53
|only if scenariogoal(59514) and scenariostage(18)
step
label "Heal_Hrngl"
clicknpc Hrngl##205362
Heal Hrngl |scenariogoal 18/59552 |goto 45.92,56.06
|only if scenariogoal(59552) and scenariostage(18)
step
label "Heal_Mr_Mrmrmr"
clicknpc Mr. Mrmrmr##205364
Heal Mr. Mrmrmr |scenariogoal 18/59553 |goto 44.42,61.21
|only if scenariogoal(59553) and scenariostage(18)
stickystart "Heal_Ermmglmrr_Jr"
stickystart "Heal_Ermmglmrr"
step
clicknpc Ermmglmrr III##205371
Heal Ermmglmrr III |scenariogoal 19/59557 |goto 60.96,60.09
|only if scenariogoal(59557) and scenariostage(19)
step
label "Heal_Ermmglmrr_Jr"
clicknpc Ermmglmrr Jr.##205370
Heal Ermmglmrr Jr. |scenariogoal 19/59556 |goto 58.56,64.87
|only if scenariogoal(59556) and scenariostage(19)
step
label "Heal_Ermmglmrr"
clicknpc Ermmglmrr##205369
Heal Ermmglmrr |scenariogoal 19/59555 |goto 54.27,62.58
|only if scenariogoal(59555) and scenariostage(19)
step
click Glob of Azmerloth Slime##402603+
Collect #3# Globs of Azmerloth Slime |scenariogoal 20/59625 |goto 58.42,46.48
You can find more around:
[51.51,59.17]
[60.54,58.78]
|only if scenariogoal(59625) and scenariostage(20)
step
extraaction Azmerloth Slime Pool##417420
|tip Use the button on your screen and drop it on the ground.
Construct an Azmerloth Slime Pool |scenariogoal 21/59667 |goto 52.22,53.14
|only if scenariogoal(59667) and scenariostage(21)
step
Kill Un'Gorian enemies around this area
Defeat as Many Ulderoth Dinosaurs as Possible |scenariogoal 22/59108 |goto 51.08,27.87
|only if scenariogoal(59108) and scenariostage(22)
step
Kill Fuzani enemies around this area
Defeat as Many Ulderoth Plants as Possible |scenariogoal 23/59109 |goto 37.46,50.71
|only if scenariogoal(59109) and scenariostage(23)
step
Kill enemies around this area
Defeat as Many Ulderoth Beasts as Possible |scenariogoal 24/59110 |goto 72.59,65.91
|only if scenariogoal(59110) and scenariostage(24)
step
kill Pureblooded Cloud Serpent##205680 |scenariogoal 25/59944 |goto 54.36,53.91
|tip It flies in a circle around this area.
|only if scenariogoal(59944) and scenariostage(25)
step
kill Pureblooded Mammoth##205681 |scenariogoal 26/59945 |goto 37.61,75.31
|only if scenariogoal(59945) and scenariostage(26)
step
kill Pureblooded Proto-Drake##205682 |scenariogoal 27/59946 |goto 45.70,76.47
|only if scenariogoal(59946) and scenariostage(27)
step
kill Pureblooded Devilsaur##205683 |scenariogoal 28/59947 |goto 61.18,37.13
|only if scenariogoal(59947) and scenariostage(28)
step
click Impurity Cleanser
|tip Avoid the purple beam.
|tip The beam will randomly change directions, so be careful.
Destroy the Impurity Cleanser |scenariogoal 29/59958 |goto 70.01,72.43
|only if scenariogoal(59958) and scenariostage(29)
step
Stomp on All the Pesky Beasts |scenariogoal 30/59959 |goto 69.41,33.89
|tip Walk over the rats to stomp them.
|only if scenariogoal(59959) and scenariostage(30)
step
kill Pristine Crystalfly##205699+
|tip Fly through them in the air around this area.
Eliminate the Pristine Crystalflies |scenariogoal 31/59960 |goto 68.04,37.30
|only if scenariogoal(59960) and scenariostage(31)
step
clicknpc Entangled Whelpling##205688+
|tip They look like whelps stuck in vines on the ground around this area.
|tip Click them and run away to remove the roots.
Free #5# Entangled Whelplings |scenariogoal 32/59948 |goto 39.62,40.93
|only if scenariogoal(59948) and scenariostage(32)
step
kill Unmarred Lasher##205687 |scenariogoal 33/59949 |goto 69.06,69.32
|only if scenariogoal(59949) and scenariostage(33)
step
kill Apex Raptor##205684 |scenariogoal 34/59950 |goto 55.80,33.14
|only if scenariogoal(59950) and scenariostage(34)
step
kill Apex Tiger##205685 |scenariogoal 35/59951 |goto 67.55,73.98
|only if scenariogoal(59951) and scenariostage(35)
step
click Assorted Titan Rubble##405243+
|tip They look like random piles of parts on the ground around the pillars.
Gather #4# Advanced Titan Gizmos |scenariogoal 36/59952 |goto 70.64,30.04
|only if scenariogoal(59952) and scenariostage(36)
step
Knock the Apex Pterrordax from the Sky |scenariogoal 37/59953 |goto 66.60,52.88
|tip It flies in a circle around this area.
|tip Fly through it with your dragonriding mount to knock it to the ground, then kill it.
|only if scenariogoal(59953) and scenariostage(37)
step
kill Apex Pterrordax##205686 |scenariostage 38 |goto 66.60,52.88
|only if scenariostage(38)
step
clicknpc Watcher Aurablya##205694
Repair Watcher Aurablya |scenariogoal 39/59956 |goto 61.21,58.69
|only if scenariogoal(59956) and scenariostage(39)
step
clicknpc Watcher Hallen##205693
Repair Watcher Hallen |scenariogoal 39/59955 |goto 53.43,58.37
|only if scenariogoal(59955) and scenariostage(39)
step
clicknpc Watcher Phoelanides##205695
Repair Watcher Phoelanides |scenariogoal 39/59957 |goto 43.47,55.52
|only if scenariogoal(59957) and scenariostage(39)
step
kill Risen Adventurer##205992+
Defeat as Many Undead Scourge as Possible |scenariogoal 40/60060 |goto 49.20,29.15
|only if scenariogoal(60060) and scenariostage(40)
step
Kill enemies around this area
Defeat as Many Nerubians as Possible |scenariogoal 41/60061 |goto 39.35,56.42
|only if scenariogoal(60061) and scenariostage(41)
step
Kill enemies around this area
Defeat as Many Vargul as Possible |scenariogoal 42/60062 |goto 64.89,65.29
|only if scenariogoal(60062) and scenariostage(42)
step
click Plagued Grain
Destroy the Plagued Grain |scenariogoal 43/60414 |goto 58.88,65.13 |count 1
|only if scenariogoal(60414) and scenariostage(43)
step
click Plagued Grain
Destroy the Plagued Grain |scenariogoal 43/60414 |goto 46.63,58.29 |count 2
|only if scenariogoal(60414) and scenariostage(43)
step
click Plagued Grain
Destroy the Plagued Grain |scenariogoal 43/60414 |goto 45.78,35.30 |count 3
|only if scenariogoal(60414) and scenariostage(43)
step
clicknpc Bloodfeast's Corpse##207478
|tip Run away to explode the corpse into chunks.
|tip Click the chunks and run them to the small portal nearby.
|tip Use the "Throw Into the Void" button on your vehicle bar to dispose of the chunks.
Dispose of #3# Abomination Chunks |scenariogoal 44/60416 |goto 35.71,43.32
|only if scenariogoal(60416) and scenariostage(44)
step
Destroy The Book of Kel'Thuzad |scenariogoal 45/60420 |goto 49.57,40.02
|tip Run into the book and then spam the "Rip Pages" button on your vehicle bar.
|only if scenariogoal(60420) and scenariostage(45)
step
extraaction Kick Pulsing Crystal##416784
|tip Use the ability on your screen to kick the ice block forward.
|tip Kick it to the swirling gold portal nearby.
The Frozen Heart sent home |scenariogoal 46/60424 |goto 62.65,38.15
|only if scenariogoal(60424) and scenariostage(46)
step
kill Rotted Gladiator##207808 |scenariogoal 47/60425 |goto 62.36,80.20
|only if scenariogoal(60425) and scenariostage(47)
step
kill Rotting Colossus##207812
|tip It walks around this area.
|tip It appears on your minimap as a yellow dot.
|tip Click it when it becomes neutral.
Control the Rotting Colossus |invehicle |goto 42.71,55.32
|only if scenariogoal(60431) and scenariostage(48)
step
Send the Rotting Colossus Home |scenariogoal 48/60431 |goto 38.65,61.76
|only if scenariogoal(60431) and scenariostage(48)
step
clicknpc Unborn Val'kyr##208195+
|tip Use the "Valkyr Toss" ability near the yellow portal when carrying a Val'kyr.
Send #3# Unborn Val'kyrs Home |scenariogoal 49/60556 |goto 64.87,76.19
Send them through the portal at [61.08,65.59]
|only if scenariogoal(60556) and scenariostage(49)
step
kill Frozen Shackle##208228 |scenariogoal 50/60559 |goto 65.94,46.48 |count 1
|only if scenariogoal(60559) and scenariostage(50)
step
kill Frozen Shackle##208228 |scenariogoal 50/60559 |goto 65.26,48.35 |count 2
|only if scenariogoal(60559) and scenariostage(50)
step
kill Frozen Shackle##208228 |scenariogoal 50/60559 |goto 66.68,49.11 |count 3
|only if scenariogoal(60559) and scenariostage(50)
step
kill Lywin##207386 |scenariogoal 51/60574 |goto 38.70,58.05
|only if scenariogoal(60574) and scenariostage(51)
step
kill Shackled Flames of the Betrayer##207815 |scenariogoal 52/60618 |goto 41.65,70.00
|only if scenariogoal(60618) and scenariostage(52)
step
kill Vereesa Windrunner##207816 |scenariogoal 53/60620 |goto 44.60,33.53
|only if scenariogoal(60620) and scenariostage(53)
step
kill 1 Uther##207818 |scenariogoal 54/60622 |goto 37.20,26.56
|only if scenariogoal(60622) and scenariostage(54)
step
clicknpc Phylactery of the Zealot##208357
kill Kirkessen the Zealous##207821
Destroy the Phylactery of the Zealot |scenariogoal 55/60635 |goto 39.08,45.16
|only if scenariogoal(60635) and scenariostage(55)
step
kill Lord Thassarian##207822 |scenariogoal 56/60665 |goto 67.42,72.17
|only if scenariogoal(60665) and scenariostage(56)
step
kill Queen Angerboda##207823 |scenariostage 57 |goto 63.15,77.96
|tip She walks around this area.
|only if scenariostage(57)
step
kill Vorus'arak##205862 |scenariogoal 58/60667 |goto 43.90,50.43
|only if scenariogoal(60667) and scenariostage(58)
step
Kill enemies around this area
Kill as Many Fel-Touched Shu'halo and Their Guards as Possible |scenariogoal 59/60101 |goto 43.96,30.42
|only if scenariogoal(60101) and scenariostage(59)
step
Kill enemies around this area
Kill as Many Felbolgs and Their Guards as Possible |scenariogoal 60/60305 |goto 37.60,47.92
|only if scenariogoal(60305) and scenariostage(60)
step
Kill enemies around this area
Kill as Many Fel-Touched Kaldorei and Their Guards as Possible |scenariogoal 61/60306 |goto 70.41,67.43
|only if scenariogoal(60306) and scenariostage(61)
step
kill 6 Fel-Corrupted Kaldorei##206146 |scenariogoal 62/60255 |goto 40.08,39.83
|only if scenariogoal(60255) and scenariostage(62)
step
kill Felbark the Defiler##207094 |scenariogoal 63/60365 |goto 65.38,70.23
|only if scenariogoal(60365) and scenariostage(63)
step
kill Slayer##207097 |scenariogoal 64/60366 |goto 65.76,45.81
|only if scenariogoal(60366) and scenariostage(64)
step
kill 3 Fel Pylon##207206 |scenariogoal 65/60413 |goto 60.19,60.11
|only if scenariogoal(60413) and scenariostage(65)
step
click Felwort+
|tip They look like spiky plants on the ground around this area.
|tip Click them and run away to pull them.
Pull Out #4# Felwort Herbs |scenariogoal 66/60417 |goto 50.10,70.44
|only if scenariogoal(60417) and scenariostage(66)
step
talk Legion Console##208146
Select _"<Remove the power core.>"_
Remove Legion Console Core |scenariogoal 67/60421 |goto 60.92,36.98 |count 1
|only if scenariogoal(60421) and scenariostage(67)
step
talk Legion Console##208146
Select _"<Remove the power core.>"_
Remove Legion Console Core |scenariogoal 67/60421 |goto 58.33,34.13 |count 2
|only if scenariogoal(60421) and scenariostage(67)
step
click Fel Pinecone+
|tip They look like small pine cones emitting green smoke on the ground around this area.
Collect #4# Fel Pinecones |scenariogoal 68/60430 |goto 61.60,78.71
|only if scenariogoal(60430) and scenariostage(68)
step
talk Legion Devastator Cannon##208176
Choose _"Clog it with felcones."_
Clog the Devastator Cannon |scenariogoal 69/60560 |goto 59.89,79.36
|only if scenariogoal(60560) and scenariostage(69)
step
kill Servant of Kruul##206861 |scenariogoal 70/60266 |goto 60.47,33.19
|only if scenariogoal(60266) and scenariostage(70)
step
kill Ursoc the Destroyer##206834 |scenariogoal 71/60263 |goto 60.48,60.00
|only if scenariogoal(60263) and scenariostage(71)
step
kill Fel-Watcher Mara##206925 |scenariogoal 72/60265 |goto 53.50,53.38
|only if scenariogoal(60265) and scenariostage(72)
step
kill 3 Fel Spreader##206615 |scenariogoal 73/60260 |goto 50.79,70.97
|only if scenariogoal(60260) and scenariostage(73)
step
kill Invading Infernal##206765 |scenariogoal 74/60267 |goto 68.75,72.02
|only if scenariogoal(60267) and scenariostage(74)
step
clicknpc Large Felwort##208095
|tip Click it and run away.
Pull Out the Large Felwort |scenariogoal 75/60418 |goto 69.61,45.38
|only if scenariogoal(60418) and scenariostage(75)
step
Kill enemies around this area
Defeat as Many Void Eaters as Possible |scenariogoal 76/60628 |goto 49.27,27.75
|only if scenariogoal(60628) and scenariostage(76)
step
Kill enemies around this area
Defeat as Many Aqir Invaders as Possible |scenariogoal 77/60626 |goto 39.72,61.62
|only if scenariogoal(60626) and scenariostage(77)
step
Kill enemies around this area
Defeat as Many Klaxxi Invaders as Possible |scenariogoal 78/60627 |goto 66.69,67.03
|only if scenariogoal(60627) and scenariostage(78)
step
clicknpc Dragonscale Expedition Explorer##208458+
|tip They look like cowering NPCs.
Dispel #6# Visions of N'Zoth |scenariogoal 79/60684 |goto 39.06,58.88
|only if scenariogoal(60684) and scenariostage(79)
step
kill Prophet Skitra##208491 |scenariogoal 80/60695 |goto 35.35,46.07
|only if scenariogoal(60695) and scenariostage(80)
step
kill Imperial Vizier Zor'lok##208500 |scenariogoal 81/60697 |goto 45.86,76.59
|only if scenariogoal(60697) and scenariostage(81)
step
Step On and Squish #4# Infested Tumors |scenariogoal 82/60696 |goto 63.50,38.69
|tip Run over the purple and red tumors on the ground.
|only if scenariogoal(60696) and scenariostage(82)
step
clicknpc Aqir Eggs##208467+
|tip They look like large clusters of eggs on the ground around this area.
Destroy #8# Aqir Eggs |scenariogoal 83/60831 |goto 50.25,69.89
|only if scenariogoal(60831) and scenariostage(83)
step
clicknpc Egg Chamber##208476+
|tip They look like large containers of eggs on the ground around this area.
Destroy #7# Egg Chambers |scenariogoal 84/60694 |goto 64.23,55.37
|only if scenariogoal(60694) and scenariostage(84)
step
clicknpc Klaxxi##208514
Imprison #5# Klaxxi Flyers in Amber Prisons |scenariogoal 85/60715 |goto 48.85,36.23
|only if scenariogoal(60715) and scenariostage(85)
step
kill N'Zoth's Reach##208535+
Destroy the Tentacles |scenariogoal 86/60732 |goto Tyrhold Reservoir/0 49.87,70.60
|only if scenariogoal(60732) and scenariostage(86)
step
Fly and Use your Drake to Ram Drifting Watchers |scenariogoal 87/60706 |goto 53.32,52.16
|tip Fly through them in the air.
|only if scenariogoal(60706) and scenariostage(87)
step
clicknpc Eye of N'Zoth##208584+
|tip They look like small floating eyes.
clicknpc Creeping Eye of N'Zoth##208585+
|tip They look like eye stalks growing from the ground.
clicknpc Greater Eye of N'Zoth##208590+
|tip They look like giant eyes floating above the ground.
Poke N'Zoth's Eyes with a Stick |scenariogoal 88/60750 |goto Tyrhold Reservoir/0 70.26,34.48
|only if scenariogoal(60750) and scenariostage(88)
step
clicknpc Imprisoned Dracthyr##208305+
|tip They look like Dracthyr floating in prisons around this area.
Destroy Void Prisons |scenariogoal 89/60630 |goto 42.02,32.15
|only if scenariogoal(60630) and scenariostage(89)
step
kill Cho'gall##208212 |scenariogoal 90/60629 |goto 51.39,69.98
|only if scenariogoal(60629) and scenariostage(90)
step
kill Void Eater Shad'har##207924 |scenariogoal 91/60631 |goto 60.64,60.27
|only if scenariogoal(60631) and scenariostage(91)
step
kill Drest'Agath the Corrupted##207925 |scenariogoal 92/60632 |goto 42.67,54.83
|only if scenariogoal(60632) and scenariostage(92)
step
kill Supreme General Pa'valak##208211 |scenariogoal 93/60633 |goto 53.81,39.18
|only if scenariogoal(60633) and scenariostage(93)
step
Kill Great Glorious Alliance enemies around this area
Defeat as Many Great Glorious Alliance as Possible |scenariogoal 94/60368 |goto 42.97,30.40
|only if scenariogoal(60368) and scenariostage(94)
step
Kill enemies around this area
Defeat as Many Battlefield Combatants as Possible |scenariogoal 95/60369 |goto 41.51,64.24
|only if scenariogoal(60369) and scenariostage(95)
step
Kill enemies around this area
Defeat as Many Blood Horde as Possible |scenariogoal 96/60370 |goto 67.23,64.87
|only if scenariogoal(60370) and scenariostage(96)
step
kill Eviscerator Kintara##207596 |scenariogoal 97/60371 |goto 39.00,63.09
|only if scenariogoal(60371) and scenariostage(97)
step
kill Warmage Bernante##207686 |scenariogoal 98/60372 |goto 38.33,49.14
|only if scenariogoal(60372) and scenariostage(98)
step
click Cannonballs
Pick Up the Cannonballs |havebuff Carrying Heavy Cannonballs##415461 |goto 37.36,29.05
|only if scenariogoal(60373) and scenariostage(99)
step
clicknpc Great Glorious Alliance Cannon##207687
|tip You will walk slowly carrying cannonballs.
Enter the Cannon |invehicle |goto 36.07,29.85
|only if scenariogoal(60373) and scenariostage(99)
step
Shoot #13# Waste Cannonballs |scenariogoal 99/60373 |goto 36.07,29.85
|tip Use the ability on your vehicle bar to shoot the cannonballs.
|only if scenariogoal(60373) and scenariostage(99)
step
clicknpc Blood Horde Scrap Bomb##207688+
|tip Clicking a bomb with toss it away from you a short distance before it explodes.
|tip Try to toss them towards clusters of other bombs.
Explode #25# Bombs Prematurely |scenariogoal 100/60374 |goto 77.11,64.88
|only if scenariogoal(60374) and scenariostage(100)
step
click Flamethrower
collect Flamethrower##207033 |scenariogoal 101/60403 |goto 70.38,34.34
|only if scenariogoal(60403) and scenariostage(101)
step
click Shrapnel Spreader
collect Shrapnel Spreader##207032 |scenariogoal 101/60401 |goto 70.62,34.33
|only if scenariogoal(60401) and scenariostage(101)
step
click Bomb Lobber
collect Bomb Lobber##207031 |scenariogoal 101/60400 |goto 70.79,34.66
|only if scenariogoal(60400) and scenariostage(101)
step
click Empty Gun Rack
collect Empty Gun Rack##207037 |scenariogoal 101/60402 |goto 70.78,33.06
|only if scenariogoal(60402) and scenariostage(101)
step
extraaction Blood Horde Gun Rack##415686
|tip Drop it on the ground in front of you.
Build a Blood Horde Weapon Rack |scenariogoal 102/60375 |goto 70.78,33.06
|only if scenariogoal(60375) and scenariostage(102)
step
click Railgun
collect Railgun##207034 |scenariogoal 103/60404 |goto 68.07,31.09
|only if scenariogoal(60404) and scenariostage(103)
step
click Thunderbolt
collect Thunderbolt##207035 |scenariogoal 103/60407 |goto 68.17,31.62
|only if scenariogoal(60407) and scenariostage(103)
step
click Crankshot
collect Crankshot##207036 |scenariogoal 103/60406 |goto 68.41,31.42
|only if scenariogoal(60406) and scenariostage(103)
step
click Weapon Rack
collect Empty Gun Rack##207038 |scenariogoal 103/60405 |goto 68.58,30.55
|only if scenariogoal(60405) and scenariostage(103)
step
extraaction Great Glorious Alliance Gun Rack##415689
|tip Drop it on the ground in front of you.
Build a Great Glorious Alliance Gun Rack |scenariogoal 104/60376 |goto 68.57,30.60
|only if scenariogoal(60376) and scenariostage(104)
step
clicknpc Smokehog##207729
Start Riding |invehicle |goto 70.90,70.53
|only if scenariogoal(60377) and scenariostage(105)
step
Bring stolen Smokehog to Soridormi |scenariogoal 105/60377 |goto 68.14,35.37
|only if scenariogoal(60377) and scenariostage(105)
step
clicknpc Flying Machine##207730
Start Flying |invehicle |goto 34.68,25.05
|only if scenariogoal(60378) and scenariostage(106)
step
Bring the Stolen Flying Machine to Soridormi |scenariogoal 106/60378 |goto 68.14,35.37
|only if scenariogoal(60378) and scenariostage(106)
step
kill Ankura Bloodhewer##207589 |scenariogoal 107/60379 |goto 75.04,69.21
|only if scenariogoal(60379) and scenariostage(107)
step
kill Sky-Commander Gadrius Orcbane##207593 |scenariogoal 108/60380 |goto 37.41,27.83
|only if scenariogoal(60380) and scenariostage(108)
step
kill Margosh the Smoker##207592 |scenariogoal 109/60381 |goto 72.98,65.99
|only if scenariogoal(60381) and scenariostage(109)
step
kill High Interrogator Kilandrelle##207594 |scenariogoal 110/60382 |goto 35.71,41.48
|only if scenariogoal(60382) and scenariostage(110)
step
clicknpc Giant Bomb##207737
Drag Giant Bomb Back to Its Own Timeway |scenariogoal 111/60383 |goto 58.24,65.58
Drag it with other players to the time portal at [67.96,59.29]
|only if scenariogoal(60383) and scenariostage(111)
step
Explode all the Bloodmines |scenariogoal 112/60384 |goto 52.47,51.88
|tip Run over the dark colored mines on your mount.
|tip Avoid light colored ones that are ready to explode.
|only if scenariogoal(60384) and scenariostage(112)
step
kill Blessed Inquisitor##207599 |scenariogoal 113/60385 |goto 35.90,23.97
|tip Keep running into the bubble to reduce its integrity to 0%.
|only if scenariogoal(60385) and scenariostage(113)
step
kill Blessed Inquisitor##207599 |scenariogoal 114/60386 |goto 35.57,23.58
|only if scenariogoal(60386) and scenariostage(114)
step
kill Flying Machine##207741
|tip Fly through them in the air around this area.
Knock Down All the Flying Machines |scenariogoal 115/60387 |goto 37.47,28.34
|only if scenariogoal(60387) and scenariostage(115)
step
kill Azerite Excavator##205884+
Defeat as Many Azerite Excavators as Possible |scenariogoal 116/60057 |goto 41.76,30.91
|only if scenariogoal(60057) and scenariostage(116)
step
Kill enemies around this area
Defeat as Many Surveyors and Taskmasters as Possible |scenariogoal 117/60058 |goto 36.08,48.41
|only if scenariogoal(60058) and scenariostage(117)
step
kill Haywire Harvester##205889+
Defeat as Many Haywire Harvesters as Possible |scenariogoal 118/60059 |goto 65.31,66.61
|only if scenariogoal(60059) and scenariostage(118)
step
Fix the Control Panel |scenariogoal 119/60268 |goto 74.99,46.36
|tip Click a wrench and quickly clobber each capacitor once.
|tip Keep hitting them once until the charge finishes.
|only if scenariogoal(60268) and scenariostage(119)
step
kill U:\RAN.2 /SWIFT##206156 |scenariogoal 120/60269 |goto 50.75,52.04
|tip It runs in a circle around the center.
|tip It appears on your minimap as a yellow dot.
|only if scenariogoal(60269) and scenariostage(120)
step
Send #22# Rascal-P41s Home |scenariogoal 121/60270 |goto 63.89,78.34
|tip Run through them.
|only if scenariogoal(60270) and scenariostage(121)
step
extraaction Scrub Oil Puddle##413862
|tip Spam the button on your screen while standing in black oil puddles.
kill Rude Crude##206617+
|tip They will occasionally spawn and attack you.
Clean #5# Oil Puddles |scenariogoal 122/60272 |goto 60.31,60.44
|only if scenariogoal(60272) and scenariostage(122)
step
kill 8 AQ-9 Dragon Killer##206076 |scenariogoal 123/60273 |goto 52.04,53.42
|tip Fly through them on your dragonriding mount.
|only if scenariogoal(60273) and scenariostage(123)
step
clicknpc Malfunctioning Robotic Cauldron##207111+
Clear #10# Cauldrons |scenariogoal 124/60274 |goto 49.83,69.53
|only if scenariogoal(60274) and scenariostage(124)
step
click Charged Battery
|tip It looks like a small electrified object floating on the ground around this area.
Become Overcharged |havebuff Overcharged##414197 |goto 65.85,67.20
|only if scenariogoal(60277) and scenariostage(125)
step
Destroy #29# Azerite Collectors |scenariogoal 125/60277 |goto 53.88,61.95
|tip Run over Azerite Collectors all around the center ring.
|tip They look like yellow energy domes on the ground and appear on your minimap as yellow dots.
|only if scenariogoal(60277) and scenariostage(125)
step
Destroy #5# Flamethrowers |scenariogoal 126/60276 |goto 51.64,53.35
|tip They look like large turrets with four jets of flame coming out of them.
|tip Run through the turret to destroy it.
|only if scenariogoal(60276) and scenariostage(126)
step
kill Field Despair Bot K156##205612 |scenariogoal 127/60278 |goto 68.61,73.93
|tip Click a nearby console and get the buff
|only if scenariogoal(60278) and scenariostage(127)
step
kill Peeved##205428 |scenariogoal 128/60318 |goto Tyrhold Reservoir/0 53.97,36.50
|only if scenariogoal(60318) and scenariostage(128)
step
Power Down the Alpha Pylon |scenariogoal 129/59238 |goto 66.25,43.61
|tip Click the various pylons and channel the power until the Alpha Pylon powers down.
|only if scenariogoal(59238) and scenariostage(129)
step
kill Meantron 7000##206131 |scenariogoal 130/60324 |goto 57.72,63.50
|only if scenariogoal(60324) and scenariostage(130)
step
Pick Up the "Overloaded Scrap Grenade" |havebuff Overloaded Scrap Grenade##413530 |goto 72.63,39.41
|tip Run over the blue electrical patch on the ground.
|only if scenariogoal(60330) and scenariostage(131)
step
Close the Unstable Time Rift |scenariogoal 131/60330 |goto 61.01,59.23
|tip Carry the grenade to the portal and throw it inside with the button on your bar.
|tip Taking any damage will cause you to drop it.
|tip To pick it back up, run over it again.
|tip If you become electrocuted, you will not be able to pick it up for a short period of time.
|tip Another player can help you relay it to the portal.
|only if scenariogoal(60330) and scenariostage(131)
step
kill Greaves##207278 |scenariogoal 132/60332 |goto 34.07,45.54
|only if scenariogoal(60332) and scenariostage(132)
step
kill Mechanized Mekgineer Hologram##207539 |scenariogoal 133/60333 |goto 53.01,57.50
|only if scenariogoal(60333) and scenariostage(133)
step
clicknpc Emergency Bomb Override Stick##207145
|tip Use the "Activate" ability on your bar to start channeling.
|tip Avoid the giant orbs that move around the platform.
Deactivate the Annihilo-bomb 9000 |scenariogoal 134/60334 |goto 53.69,49.01
|only if scenariogoal(60334) and scenariostage(134)
step
click Paradox
|tip Quickly pick NPCs that look different from the others.
Resolve the Paradox |scenariogoal 135/59111 |goto 68.92,35.66
|only if scenariogoal(59111) and scenariostage(135)
step
click Paradox
|tip Click blue orbs to exchange positions with other blue orbs.
|tip Untangle the pink lines.
Resolve the Paradox |scenariogoal 136/59233 |goto 69.25,35.80
|only if scenariogoal(59233) and scenariostage(136)
step
click Hourglass
|tip Adjust the clock hands using the yellow arrows by right-clicking them.
Fill the Hourglass |scenariogoal 137/59234 |goto 69.56,35.96
|only if scenariogoal(59234) and scenariostage(137)
step
click Hourglass
|tip Click the moving yellow orbs on the panel.
Fill the Hourglass |scenariogoal 138/60292 |goto 70.01,35.99
|only if scenariogoal(60292) and scenariostage(138)
step
click Hourglass
|tip Click the red button in the middle to move the hourglass left and right.
|tip Move the hourglass back and forth to catch the falling sand.
Fill the Hourglass |scenariogoal 139/60293 |goto 70.37,36.00
|only if scenariogoal(60293) and scenariostage(139)
step
click Paradox
|tip Pick Ursoc the Destroyer, Servant of Kruul, Fel Corrupted Kaldorei.
Resolve the Paradox |scenariogoal 140/60294 |goto 70.78,35.98
|only if scenariogoal(60294) and scenariostage(140)
step
extraaction Scareloc##417417
|tip Use the button on your screen and drop it on the ground.
Build a Scareloc |scenariogoal 141/60675 |goto 68.69,34.83
|only if scenariogoal(60675) and scenariostage(141)
step
extraaction Purification Forge##417426
|tip Use the button on your screen and drop it on the ground.
Build a Purification Forge |scenariogoal 142/60674 |goto 70.64,30.04
|only if scenariogoal(60674) and scenariostage(142)
step
click Time Rift
Enter the Time Rift |scenariogoal 143/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(143)
step
click Time Rift
Enter the Time Rift |scenariogoal 144/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(144)
step
click Time Rift
Enter the Time Rift |scenariogoal 145/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(145)
step
click Time Rift
Enter the Time Rift |scenariogoal 146/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(146)
step
click Time Rift
Enter the Time Rift |scenariogoal 147/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(147)
step
click Time Rift
Enter the Time Rift |scenariogoal 148/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(148)
step
click Time Rift
Enter the Time Rift |scenariogoal 149/60066 |goto 52.61,52.16
|only if scenariogoal(60066) and scenariostage(149)
step
kill Gill'dan##204808 |scenariogoal 1/60685 |goto Azmerloth/0 49.12,47.79
|only if scenariogoal(60685) and scenariostage(1)
step
click Time Rift |goto 51.50,85.54
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("Azmerloth")
step
click Discarded Rocket Pack |goto The Warlands/0 61.90,40.75
Reach the Other Ship |goto 19.27,41.48 < 10 |c |noway
|only if scenariogoal(60692) and scenariostage(1)
step
kill Fractured Causality##205308 |scenariogoal 1/60692 |goto 31.19,70.41
|tip AoE down mobs that are summoned frequenly on the ship.
|tip Avoid standing in the whirlwind attack.
|only if scenariogoal(60692) and scenariostage(1)
step
click Time Rift |goto 19.56,40.95
|tip On the top deck of the ship.
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("The Warlands")
step
kill Val'kyr Shadowguard##208380
|tip Kill them as soon as they spawn.
kill The Lich King##205305 |scenariogoal 1/60689 |goto Azmourne/0 49.65,70.97
|tip Move out of black "Desecration" areas on the ground.
|only if scenariogoal(60689) and scenariostage(1)
step
click Time Rift |goto 56.04,19.09
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("Azmourne")
step
kill Overlord Mechagon##205309 |scenariogoal 1/60693 |goto A.Z.E.R.O.T.H./0 52.96,65.50
|tip Avoid gears that get pulled towards Mechagon's location.
|tip Move out of areas targeted on the ground.
|tip Run away when Mechagon pulls you towrds him, avoiding gears if they are up.
|only if scenariogoal(60693) and scenariostage(1)
step
click Time Rift |goto 52.32,11.72
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("A.Z.E.R.O.T.H.")
step
kill Freya##205304 |scenariogoal 1/60688 |goto Ulderoth/0 50.56,41.73
|tip When she uses "Relocate," quickly run to where she teleports and interrupt her.
|tip Avoid standing in the gold cone area in front of her.
|tip Kill sproutlings when they spawn.
|only if scenariogoal(60688) and scenariostage(1)
step
click Time Rift |goto 35.79,75.67
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("Ulderoth")
step
kill Mycelial Growth##208525+
|tip Kill these quickly when they spawn.
|tip Avoid shadows of tentacles on the ground.
kill Fury of N'zoth##205307 |scenariogoal 1/60691 |goto Azq'roth/0 49.18,44.94
|only if scenariogoal(60691) and scenariostage(1)
step
click Time Rift |goto 39.70,71.74
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("Azq'roth")
step
kill Illidan Stormrage##205306 |scenariogoal 1/60690 |goto Azewrath/0 75.83,46.15
|tip Avoid standing in front of Illidan during "Fel Beam."
|tip "Chaos Immolation" deals damage around Illidan.
|tip Avoid standing where Illidan is looking during "Chaos Leap."
|only if scenariogoal(60690) and scenariostage(1)
step
click Time Rift |goto 62.03,38.55
Return to the Present |goto Thaldraszus/0 51.15,57.08 < 50 |c |noway
|only if subzone("Azewrath")
step
talk Soridormi##204450
turnin When Time Needs Mending##77236 |goto Thaldraszus/0 51.09,57.08
|only if haveq(77236) and not inscenario()
step
talk Soridormi##204450
turnin A Stony Reception##76453 |goto 51.08,57.08
|only if readyq(76453) and not inscenario()
step
talk Soridormi##204450
turnin The Endless Conflict##76449 |goto 51.08,57.08
|only if readyq(76449) and not inscenario()
step
talk Soridormi##204450
Tell her _"I found this mechanical creature during a recent time rift."_
|tip Continue with dialogue to get her to take the creature.
Work with Soridormi to Find a Solution |q 76521/2 |goto 51.08,57.08
|only if completedq("76521/1") and not completedq(76521) and not inscenario()
step
talk Soridormi##204450
turnin Buzzing Boffins##76521 |goto 51.08,57.08
|only if readyq(76521) and not inscenario()
step
talk Soridormi##204450
turnin A Murloc and a Dragon Walk into a Time Rift...##76379 |goto 51.08,57.08
|only if readyq(76379) and not inscenario()
step
talk Soridormi##204450
turnin Cogs in a Machine##76404 |goto 51.08,57.08
|only if readyq(76404) and not inscenario()
step
talk Soridormi##204450
turnin A Fishy Gift##76548 |goto 51.08,57.08
|only if readyq(76548) and not inscenario()
step
talk Soridormi##204450
turnin Wasteland Warriors##76544 |goto 51.08,57.08
|only if readyq(76544) and not inscenario()
step
talk Soridormi##204450
turnin The Resistance##76459 |goto 51.08,57.08
|only if readyq(76459) and not inscenario()
step
talk Soridormi##204450
turnin Titanic Beasts##76351 |goto 51.08,57.08
|only if readyq(76351) and not inscenario()
step
talk Soridormi##204450
turnin Dangerous Documentation##76533 |goto 51.08,57.08
|only if readyq(76533) and not inscenario()
step
talk Soridormi##204450
turnin All That Glitters...##76547 |goto 51.08,57.08
|only if readyq(76547) and not inscenario()
step
talk Soridormi##204450
turnin An Antlered Skull##76362 |goto 51.08,57.08
|only if readyq(76362) and not inscenario()
step
talk Soridormi##204450
turnin Mantid Methodology##76546 |goto 51.08,57.08
|only if readyq(76546) and not inscenario()
step
talk Soridormi##204450
turnin The Sins of the Ashbringer##76406 |goto 51.08,57.08
|only if readyq(76406) and not inscenario()
step
talk Soridormi##204450
accept A Foreseeable Friendship##77241 |goto 51.09,57.08
|only if rep("Soridormi") >= FutureFriend and not completedq(77241) and not inscenario()
step
talk Soridormi##204450
accept A Recognition of Skill##77248 |goto 51.09,57.08
|only if rep("Soridormi") >= RiftMender and not completedq(77248) and not inscenario()
step
talk Soridormi##204450
accept One of Us##77249 |goto 51.09,57.08
|only if rep("Soridormi") >= Timewalker and not completedq(77249) and not inscenario()
step
talk Soridormi##204450
accept Realized Potential##77250 |goto 51.09,57.08
|only if rep("Soridormi") >= LegendoftheMultiverse and not completedq(77250) and not inscenario()
step
|next "Begin"
step
label "Scenario_Information"
|tip Killing enemies and clicking random objects increases the amount of Temporal Essence collected.
|tip More Temporal Essence increases the quality of the reward box.
'|complete false
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Little Scales Daycare",{
author="support@zygorguides.com",
description="This guide will help you complete the Little Scales Daycare.",
condition_suggested=function() return level == 70 and not completedq(76145) end,
startlevel=70,
patch='100105',
},[[
step
Earn the "Just Don't Ask Me To Spell It" Achievement |achieve 16363
|tip Complete the three Valdrakken storylines require for this achievement.
|tip Refer to the "Thaldraszus (Full Zone)" leveling guide to accomplish this.
Click Here to Load the "Thaldraszus (Full Zone)" Leveling Guide |confirm |loadguide "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)"
step
talk Jyhanna##185563
accept Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.43,58.29
step
clicknpc Injured Lubbins##195911
Find Lubbins |q 70647/1 |goto Thaldraszus/0 34.80,63.75
step
clicknpc Injured Lubbins##195911
Help Lubbins |q 70647/2 |goto 34.80,63.78
step
talk Jyhanna##185563
turnin Oh Where, Oh Where Can He Be?##70647 |goto Valdrakken/0 10.41,58.27
accept An Expert Opinion##70697 |goto Valdrakken/0 10.41,58.27
step
use Lubbins##199175
Collect the "Lubbins" Battle Pet |learnpet Lubbins##3316
|tip Avoid leveling Lubbins for easy pet battles later.
step
talk Patchu##196069
turnin An Expert Opinion##70697 |goto The Azure Span/0 13.88,49.85
accept What Lubbins Needs##70722 |goto 13.88,49.85
step
talk Patchu##196069
Tell her _"Thank you. I believe I understand."_
Chat with Patchu |q 70722/1 |goto 13.89,49.85
step
talk Patchu##196069
turnin What Lubbins Needs##70722 |goto 13.88,49.85
accept A Practice Bout##70732 |goto 13.88,49.85
step
Defeat Gwosh in a Pet Battle |q 70732/1 |goto The Azure Span/0 14.22,47.58
|tip Lubbins is capable of defeating Gwosh at level 1.
|tip If you go this route, be sure the other battle pets on the team are also level 1.
step
talk Patchu##196069
turnin A Practice Bout##70732 |goto 13.88,49.85
accept This Calls for a Specialist##70849 |goto 13.88,49.85
step
talk Haniko##196264
turnin This Calls for a Specialist##70849 |goto The Waking Shores/0 38.91,83.27
accept Born to Be Wilder##70851 |goto 38.91,83.27
step
talk Haniko##196264
Ask her _"How do I do that?"_
Chat with Haniko |q 70851/1 |goto 38.91,83.27
step
talk Haniko##196264
turnin Born to Be Wilder##70851 |goto 38.91,83.27
accept A Friend for Lubbins##70853 |goto 38.91,83.27
step
clicknpc Shyfly##189102
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Capture a Shyfly Battle Pet |q 70853/1 |goto 38.04,80.36
step
talk Haniko##196264
turnin A Friend for Lubbins##70853 |goto 38.91,83.27
accept So How Did It Go?##70854 |goto 38.91,83.27
step
talk Jyhanna##185563
turnin So How Did It Go?##70854 |goto Valdrakken/0 10.42,58.29
step
_Next to you:_
talk Herald Flaps##197478
accept Eggs in Abundance##72664 |goto 53.12,50.70
step
talk Amella##187130
turnin Eggs in Abundance##72664 |goto The Waking Shores/0 62.22,73.45
accept Whelptender's Wisdom##72665 |goto 62.22,73.45
step
talk Emerald Whelptender##200230
Ask him _"Do you have any wisdom for raising whelps?"_
Speak to the Whelptender |q 72665/1 |count 1 |goto 56.71,64.15
step
talk Bronze Whelptender##200231
Ask him _"Do you have any wisdom for raising whelps?"_
Speak to the Whelptender |q 72665/1 |count 2 |goto 55.88,63.22
step
talk Azure Whelptender##200233
Ask him _"Do you have any wisdom for raising whelps?"_
Speak to the Whelptender |q 72665/1 |count 3 |goto 55.74,64.23
step
talk Obsidian Whelptender##200232
Ask him _"Do you have any wisdom for raising whelps?"_
Speak to the Whelptender |q 72665/1 |count 4 |goto 55.09,64.61
step
talk Ruby Whelptender##200229
Ask him _"Do you have any wisdom for raising whelps?"_
Speak to the Whelptender |q 72665/1 |count 5 |goto 55.64,65.61
step
talk Lasztak##191881
turnin Whelptender's Wisdom##72665 |goto 55.10,63.65
accept Daycare Director Agapanthus##72666 |goto 55.10,63.65
step
talk Agapanthus##182082
turnin Daycare Director Agapanthus##72666 |goto Valdrakken/0 12.87,57.14
accept Snack Run##72667 |goto 12.87,57.14
accept A Nurturing Environment##72668 |goto 12.87,57.14
accept A Lesson in Responsibility##73021 |goto 12.87,57.14
step
Scare the Birds |q 72668/1 |count 3 |goto 12.15,64.81
|tip Run near them.
step
Scare the Birds |q 72668/1 |count 6 |goto 13.18,53.99
|tip Run near them.
step
click Lost Sand
Clear the Sand |q 72668/2 |count 1 |goto 13.50,62.29
step
click Lost Sand
Clear the Sand |q 72668/2 |count 2 |goto 12.66,62.80
step
click Lost Sand
Clear the Sand |q 72668/2 |count 3 |goto 12.52,63.53
step
Scare the Birds |q 72668/1 |goto 14.38,61.76
|tip Run near them.
step
kill Hungry Crawler##200482 |q 72668/3 |goto 11.37,62.83 |count 3
|tip Run around this area until they pop out of the ground.
|tip They take a moment to spawn.
step
kill Hungry Crawler##200482 |q 72668/3 |goto 10.31,62.01
|tip Run around this area until they pop out of the ground.
|tip They take a moment to spawn.
step
talk Agapanthus##182082
turnin A Nurturing Environment##72668 |goto 12.87,57.14
step
talk Gorgonzormu##196729
buy 1 Wheel of Whelpwhisper Brie##203433 |q 72667/1 |goto 29.06,65.14
step
talk Kaestrasz##185561
Tell him _"Show me your wares."_
buy 1 Bag of Spicy Pet Snacks##203432 |q 72667/2 |goto 46.62,78.97
step
talk Lysindra##193029
|tip Inside the building.
buy 1 Stuffed Doll##203445 |q 73021/1 |goto 48.29,82.94
step
talk Tithris##185562
|tip Inside the building.
buy 1 Box of Leapmaize Crackers##203443 |q 72667/3 |goto 47.47,46.16
step
click Snacks
Place the Snacks |q 72667/4 |goto 10.53,62.34
step
talk Agapanthus##182082
turnin Snack Run##72667 |goto 12.87,57.14
step
click Decorative Shrubbery
collect 1 Decorative Shrubbery##203451 |q 73021/2 |goto Ohn'ahran Plains/0 90.03,33.53
step
talk Cirroll##202758
buy 1 Soothing Incense##203446 |q 73021/3 |goto Zaralek Cavern/0 56.62,55.19
step
click Decorative Shrubbery
Place the Decorative Shrubbery Habitat Piece |q 73021/4 |count 1 |goto Valdrakken/0 11.39,53.24
step
click Stuffed Doll
Place the Stuffed Doll Habitat Piece |q 73021/4 |count 2 |goto Valdrakken/0 11.17,53.58
step
click Homely Incense
Place the Homely Incense Habitat Piece |q 73021/4 |goto Valdrakken/0 11.04,54.35
step
talk Agapanthus##182082
turnin A Lesson in Responsibility##73021 |goto 12.87,57.14
step
talk Lasztak##199259
accept The Obsidian Hatchling##72454 |goto 12.93,57.51
accept Warmth and Comfort##72455 |goto 12.93,57.51
step
talk Mother Elion##185904
Tell her _"I am here to bring the egg to Valdrakken."_
Collect the Obsidian Egg |q 72454/1 |goto The Waking Shores/0 61.60,68.70
step
click Pile of Coal+
|tip They look like small piles of rocks on the ground around this area.
|tip They appear on your minimap as yellow dots.
Kill Qalashi enemies around this area
collect 5 Warmed Coal##202286 |q 72455/1  |goto 36.38,61.34
More around [34.69,68.47]
step
extraaction Hatch Egg##398421
Hatch the Egg at the Obsidian Oathstone |q 72454/2 |goto 27.62,63.31
step
talk Archivist Edress##193456
|tip In the Obsidian Throne.
Ask her _"I am raising an obsidian hatchling at the nursery. What should I add to her nest?"_
collect 1 Obsidian Gemstone##202288 |q 72455/2 |goto 25.11,56.24
step
talk Terryn##202277
Tell him _"I am looking for an artifact for an obsidian hatchling's nest."_
collect 1 Crystalline Shell##202292 |q 72455/3 |goto Zaralek Cavern/0 55.88,55.49
step
click Nest of Coals
Place the Nest Piece |q 72455/4 |count 1 |goto Valdrakken/0 11.37,57.19
step
click Obsidian Gemstone
Place the Nest Piece |q 72455/4 |count 2 |goto 11.37,57.19
step
click Crystalline Shell
Place the Nest Piece |q 72455/4 |goto 11.24,56.88
step
talk Agapanthus##182082
turnin Warmth and Comfort##72455 |goto 12.87,57.14
step
talk Lasztak##199259
turnin The Obsidian Hatchling##72454 |goto 12.93,57.51
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72458)
|tip Another quest will be available tomorrow.
step
talk Lasztak##199259
accept A Home-Cooked Meal##72457 |goto 12.93,57.51
step
collect 1 Roast Duck Delight##197790 |q 72457/1
|tip You can create this with cooking or buy it from the Aucton House.
|tip If you have cooking but don't have the recipe, create "Thrice-Spiced Mammoth Kabob" until you learn the recipe for Roast Duck Delight.
step
talk Obsidian Hatchling##200466
Ask it _"Are you hungry?"_
Feed the Obsidian Hatchling |q 72457/2 |goto 11.36,57.22
step
talk Lasztak##199259
turnin A Home-Cooked Meal##72457 |goto 12.93,57.51
step
talk Agapanthus##182082
accept Tag, You're Anxious##72458 |goto 12.87,57.14
step
talk Obsidian Hatchling##200466
Tell it _"Let's play!"_
Start a Game of Tag with the Obsidian Hatchling |q 72458/1 |goto 11.36,57.22
step
clicknpc Obsidian Hatchling##200466
extraaction I'm Gonna Get You!##400911
|tip The Hatchling will appear nearby as a dot on the mini-map.
|tip Approach the Hatchling from the opposite direction you want it to go.
|tip Walk into the hatchling to make it move.
Chase the Hatchling to the Nest |q 72458/2 |goto 11.28,57.12
step
talk Agapanthus##182082
turnin Tag, You're Anxious##72458 |goto 12.87,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72459)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept What's a Duck?##72459 |goto 12.87,57.14
step
use Rusziona's Whistle##202293
Summon Rusziona |havebuff Rusziona is Near##398502 |q 72459 |goto Ohn'ahran Plains/0 42.45,44.54
step
kill Bluebill Waddler##192947
Slay #5# Bluebill Waddler with Rusziona |q 72459/1 |goto 42.38,44.40 |or
step
talk Agapanthus##182082
turnin What's a Duck?##72459 |goto Valdrakken/0 12.87,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72460)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept A Solid Pet##72460 |goto 12.87,57.14
step
Visit Lysindra's Pet Shop in Valdrakken |q 72460/1 |goto 48.30,81.58
step
clicknpc Solid Earth Elemental##207157
|tip Inside the building.
Pick up the Solid Earth Elemental |q 72460/2 |goto 48.14,82.96
step
talk Lasztak##199259
Tell him _"Here is the earth elemental."_
Give the Solid Earth Elemental to Lasztak |q 72460/3 |goto 12.93,57.51
step
talk Agapanthus##182082
turnin A Solid Pet##72460 |goto 12.87,57.14
|tip Avoid leveling Iggy for now.
step
talk Agapanthus##182082
accept Anatidaephobia##72461 |goto 12.87,57.14
step
talk Aluri##193321
Meet Lasztak in The Waking Shores |q 72461/1 |goto The Waking Shores/0 47.06,64.90
step
talk Lasztak##206905
Ask him _"Shall we begin?"_
Talk to Lasztak |q 72461/2 |goto 47.06,64.90
step
talk Wurallie##206903
Tell her _"Begin pet battle."_
|tip Iggy is capable of defeating this encounter solo at lower levels.
Defeat Wurallie in a Pet Battle with Iggy on Your Team |q 72461/3 |goto 47.20,65.01
step
talk Agapanthus##182082
turnin Anatidaephobia##72461 |goto Valdrakken/0 12.87,57.14
step
use Rusziona##206682
Learn the Rusziona pet |learnpet Rusziona##3589
step
talk Lasztak##199259
accept The Ruby Hatchling##72989 |goto 12.93,57.51
step
talk Amella##187130
Tell her _"I am here to bring the egg to Valdrakken."_
Collect the Ruby Egg |q 72989/1 |goto The Waking Shores/0 62.22,73.46
step
extraaction Hatch Egg##398653
|tip Use it at the shrine.
Hatch the Egg at the Ruby Oathstone |q 72989/2 |goto 62.43,73.18
step
talk Lasztak##199259
turnin The Ruby Hatchling##72989 |goto Valdrakken/0 12.93,57.51
accept Crimson Comfort##72990 |goto 12.93,57.51
step
click Lasztak's Thread Order##398668
|tip It looks like a gold and grey box on the edge of a crate.
collect 1 Lasztak's Thread Order##204870 |q 72990/3 |goto 32.42,65.71
step
kill Iridescent Peafowl##192383+
collect 3 Soft Peafowl Down##203712 |q 72990/2 |goto Thaldraszus/0 53.33,53.21
step
click Bolt of Ruby Cloth##398664
|tip They look like red rolls of cloth on a table.
collect 2 Bolt of Ruby Cloth##204869 |q 72990/1 |goto The Waking Shores/0 61.47,70.09
step
talk Lasztak##199259
Tell him _"I have brought the materials."_
Deliver the Materials to Lasztak |q 72990/4 |goto Valdrakken/0 12.93,57.51
step
click Crimson Cushion
Place the Crimson Cushion |q 72990/5 |goto 10.65,59.29
step
talk Lasztak##199259
turnin Crimson Comfort##72990 |goto 12.93,57.51
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72992)
|tip Another quest will be available tomorrow.
step
talk Lasztak##199259
accept Warm Dragonfruit Pie##72991 |goto 12.93,57.51
step
talk Erugosa##185556
|tip Inside the building.
buy 1 Pre-Made Pie Crust##204868 |q 72991/2 |goto 46.51,46.24
step
use Trusty Dragonkin Rake##193826
|tip Use it on the fruit in the trees around this area.
clicknpc Ripened Dragonfruit##191296+
|tip They look like pink fruit in the trees around this area.
Collect #5# Ripened Dragonfruit |q 72991/1 |goto The Waking Shores/0 59.64,65.05
step
talk Lasztak##199259
Tell him _"I have brought the ingredients for Warm Dragonfruit Pie."_
Bring the Ingredients to Lasztak |q 72991/3 |goto Valdrakken/0 12.93,57.51
step
talk Ruby Hatchling##200875
Ask it _"Are you hungry?"_
Feed the Ruby Hatchling |q 72991/4 |goto 10.63,59.32
step
talk Lasztak##199259
turnin Warm Dragonfruit Pie##72991 |goto 12.93,57.51
accept You're Playing Wrong!##72992 |goto 12.93,57.51
step
talk Ruby Hatchling##200875
Tell it _"Let's play!"_
Start a Game of Tag with the Ruby Hatchling |q 72992/1 |goto 10.65,59.32
step
clicknpc Ruby Hatchling##200875
extraaction I'm Gonna Get You!##400911
|tip The Hatchling will appear nearby as a dot on the mini-map.
|tip Approach the Hatchling from the opposite direction you want it to go.
|tip Walk into the hatchling to make it move.
|tip Chase it back to the nest in the daycare.
Chase the Hatchling to the Nest |q 72992/2 |goto 10.71,59.26
step
talk Agapanthus##182082
turnin You're Playing Wrong!##72992 |goto 12.87,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72993)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept I'm the Boss!##72993 |goto 12.87,57.14
step
talk Belastrasza##199990
Tell it _"I am here to help with your list."_
Report to Belastrasza |q 72993/1 |goto 10.63,59.31
step
talk Studious Whelp##195683
Ask it _"Will you play with Belastrasza?"_
Speak with the Studious Whelp |q 72993/4 |count 1 |goto 9.32,58.41
step
talk Lasztak##199259
Tell him _"Belastrasza has demanded your assistance."_
Speak with Lasztak |q 72993/3 |goto 12.93,57.51
step
talk Studious Whelp##195683
Ask it _"Will you play with Belastrasza?"_
Speak with the Studious Whelp |q 72993/4 |goto 15.17,51.96
step
talk Playful Whelp##195680
Ask it _"Will you play with Belastrasza?"_
Speak with the Playful Whelp |q 72993/5 |count 1 |goto 13.08,62.87
step
talk Playful Whelp##195680
Ask it _"Will you play with Belastrasza?"_
Speak with the Playful Whelp |q 72993/5 |goto 13.10,63.21
step
click Sweet Snapflower##386078+
|tip They look like small white and green flowers near rocks around the river.
|tip They appear on your minimap as yellow dots.
collect 5 Sweet Snapflower Bulb##202250 |q 72993/2 |goto The Waking Shores/0 40.19,83.66
You can find more around [43.00,84.04]
step
talk Agapanthus##182082
turnin I'm the Boss!##72993 |goto Valdrakken/0 12.87,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72997)
|tip Another quest will be available tomorrow.
step
talk Lasztak##199259
accept A Cavalier Pet##72994 |goto 12.94,57.51
step
Visit Lysindra's Pet Shop in Valdrakken |q 72994/1 |goto 48.39,81.41
step
clicknpc Baby Vorquin##207611
|tip It runs around this area.
Retrieve the Baby Vorquin |q 72994/2 |goto 59.00,22.57
step
talk Lasztak##199259
Tell him _"Here is the baby vorquin for Bela."_
Give the Baby Vorquin to Lasztak |q 72994/3 |goto 12.94,57.51
step
talk Agapanthus##182082
turnin A Cavalier Pet##72994 |goto 12.87,57.14
step
talk Lasztak##199259
accept Patience, Please##72995 |goto 12.94,57.51
step
Visit Wurallie in the Waking Shores |q 72995/1 |goto The Waking Shores/0 47.25,65.04
|tip High up on the cliff.
step
talk Wurallie##207537
Defeat Wurallie in a Pet Battle Using Both Princess and Iggy |q 72995/2 |goto 47.24,65.04
|tip This is typically easier with level 1 pets.
|tip Ensure you have Princess Vorquistrasza and Iggy on your pet team before beginning the battle.
|tip Iggy can complete this battle solo typically.
step
clicknpc Baby Vorquin##207611
talk Lasztak##199259
turnin Patience, Please##72995 |goto Valdrakken/0 12.91,57.51
step
talk Agapanthus##182082
accept The Bronze Hatchling##72996 |goto 12.91,57.11
step
talk Xius##189261
Tell him _"I am here to bring the egg to Valdrakken."_
Collect the Bronze Egg |q 72996/1 |goto The Waking Shores/0 60.70,74.05
step
extraaction Hatch Egg##398649
Hatch the Egg at the Bronze Oathstone |q 72996/2 |goto 59.75,82.00
step
talk Lasztak##199259
turnin The Bronze Hatchling##72996 |goto Valdrakken/0 12.94,57.51
accept Nothing Like a Sandy Nap##72997 |goto 12.94,57.51
step
Enter the building |goto 77.39,51.34 < 10 |walk
click Unused Bowl
click Unused Bowl##385992
collect 1 Unused Bowl##202645 |q 72997/3 |goto 71.75,49.77
step
talk Usodormu##198470
buy 1 Whelp's First Hourglass##202644 |q 72997/2 |goto 60.34,79.72
step
click Pile of Soft Sand##392596+
|tip They look like light-colored piles of sand on the ground around this area.
collect 5 Soft Sand##202643 |q 72997/1 |goto 58.41,81.46
step
click Sand
Place the Nest Piece |q 72997/4 |goto Valdrakken/0 14.06,55.12 |count 1
step
click Whelp's First Hourglass
Place the Nest Piece |q 72997/4 |goto 14.06,55.12 |count 2
step
click Bowl
Place the Nest Piece |q 72997/4 |goto 14.02,54.66 |count 3
step
talk Lasztak##199259
turnin Nothing Like a Sandy Nap##72997 |goto 12.94,57.51
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(72999)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept Artisanal Aging##72998 |goto 12.91,57.11
step
talk Gorgonzormu##196729
buy 1 Temporal Parmesan##201415 |q 72998/1 |goto 29.03,65.07
step
talk Bronze Hatchling##200855
Ask it _"Are you hungry?"_
Feed the Bronze Hatchling |q 72998/2 |goto 14.01,54.67
step
talk Agapanthus##182082
turnin Artisanal Aging##72998 |goto 12.91,57.11
accept Here? There? Everywhere!##72999 |goto 12.91,57.11
step
talk Bronze Hatchling##200855
Tell it _"Let's play!"_
Start Playing Tag with the Bronze Hatchling |q 72999/1 |goto 14.00,54.70
step
clicknpc Bronze Hatchling##202631
extraaction I'm Gonna Get You!##400911
|tip Use it on the hatchling nearby to make it teleport away from you.
|tip Chase it back and forth a few times until it returns to the nest.
Chase the Hatchling to the Nest |q 72999/2 |goto 14.00,54.70
step
talk Agapanthus##182082
turnin Here? There? Everywhere!##72999 |goto 12.91,57.11
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73000)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept Sneezing Through Time##73000 |goto 12.89,57.14
step
talk Zhusadormu##200856
Tell it _"Try smelling Sir Pringly."_
Watch the dialogue
Tell Zhusadormu to Smell Sir Pringly |q 73000/1 |goto 12.97,56.91
step
talk Zhusadormu##201636
Tell it _"I think it's called hochenblume."_
Find Zhusadormu in the Artisan's Market |q 73000/2 |goto 37.75,67.12
step
talk Zhusadormu##201633
|tip Upstairs inside the building.
Tell him _"Zhusa, I think that pillow is filled with feathers..."_
Find Zhusadormu in the Roasted Ram |q 73000/3 |goto 46.23,48.09
step
talk Zhusadormu##201635
Tell him _"I believe that's a hookah."_
Find Zhusadormu in the Bronze Enclave |q 73000/4 |goto 80.46,46.28
step
talk Agapanthus##182082
turnin Sneezing Through Time##73000 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73004)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept A Scaly Pet##73001 |goto 12.89,57.14
step
Visit Lysindra |q 73001/1 |goto 48.31,81.76
step
clicknpc Bronze Skitterfly##207651
|tip They look like small flying bugs all over this area.
Capture #3# Bronze Skitterflies |q 73001/2 |goto 48.89,66.90
step
Return to Lysindra |q 73001/3 |goto 48.31,81.76
step
clicknpc Baby Hornswog##207657
|tip It hops around inside the building.
Catch the Baby Hornswog |q 73001/4 |goto 48.40,82.28
step
talk Lasztak##199259
Tell him _"Here is Zhusa's baby hornswog."_
Baby Hornswog given to Lasztak |q 73001/5 |goto 12.98,57.49
step
talk Agapanthus##182082
turnin A Scaly Pet##73001 |goto 12.89,57.14
accept Temporal Immunity##73002 |goto 12.89,57.14
step
Visit Wurallie in the Waking Shores |q 73002/1 |goto The Waking Shores/0 47.25,65.11
step
talk Wurallie##207546
Tell her _"Begin pet battle."_
Defeat Wurallie in a Pet Battle with Annuna on Your Team |q 73002/2 |goto 47.25,65.11
|tip This is typically easier with low level pets.
|tip Wurallie's pet will be level 3.
|tip Ensure you have Annuna on your pet team before beginning the battle.
|tip Iggy can complete this battle solo typically.
step
talk Agapanthus##182082
turnin Temporal Immunity##73002 |goto Valdrakken/0 12.89,57.14
accept The Azure Hatchling##73003 |goto 12.89,57.14
step
talk Akxall##189262
Tell her _"I am here to bring the egg to Valdrakken."_
Collect the Blue Egg |q 73003/1 |goto The Waking Shores/0 59.38,72.42
step
extraaction Hatch Egg##398646
|tip Use the ability that appears on the screen.
Hatch the Egg at the Azure Oathstone |q 73003/2 |goto The Azure Span/0 39.36,63.17
step
talk Agapanthus##182082
turnin The Azure Hatchling##73003 |goto Valdrakken/0 12.89,57.14
accept A Scholar's Delight##73004 |goto 12.89,57.14
step
kill Snowspine Snuffler##194414+
collect 1 Fine-Pointed Quill##202330 |q 73004/1 |goto The Azure Span/0 60.23,25.14
step
Enter the building |goto 37.84,62.00 < 10 |walk
talk Vel Tal IX##189460
|tip Inside the building.
Ask it _"Do you have any books appropriate for a blue dragonwhelp?"_
collect 1 Blue Dragon Bedtime Story##202332 |q 73004/3 |goto 37.36,62.43
step
label "Collect_Awakened_Frost"
collect 1 Awakened Frost##190329 |q 73004/2
|tip Rousing Frost drops from water type elementals across the Dragon Isles.
|tip Combine 10 Rousing Frost into one Awakened Frost.
step
Place #3# Nest Pieces |q 73004/4 |goto Valdrakken/0 9.64,56.58
|tip Click the three objects on the bookshelf.
step
talk Agapanthus##182082
turnin A Scholar's Delight##73004 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73006)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept Crystal Nutrition##73005 |goto 12.89,57.14
step
click Bite-Sized Ley Crystal##385941+
|tip They look like small blue crystals on the ground around this area.
collect 6 Bite-Sized Ley Crystal##202404 |q 73005/1 |goto The Azure Span/0 17.31,38.52
step
talk Azure Hatchling##200767
Ask it _"Are you hungry?"_
Feed the Azure Hatchling |q 73005/2 |goto Valdrakken/0 9.68,56.54
step
talk Agapanthus##182082
turnin Crystal Nutrition##73005 |goto 12.89,57.14
accept Well, Actually...##73006 |goto 12.89,57.14
step
talk Azure Hatchling##200767
Tell it _"Let's play!"_
Start Playing Tag with the Azure Hatchling |q 73006/1 |goto 9.69,56.53
step
clicknpc Azure Hatchling##200767
extraaction I'm Gonna Get You!##400911
|tip Use it on the hatchling nearby to make it teleport away from you.
|tip Chase it back and forth a few times until it returns to the nest.
Chase the Hatchling to the Nest |q 73006/2 |goto 9.75,56.47
step
talk Agapanthus##182082
turnin Well, Actually...##73006 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73007)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept New Lenses##73007 |goto Valdrakken/0 12.89,57.14
step
Enter the building |goto 30.37,54.87 < 10 |walk
use Zalethgos's Whistle##202409
Summon Zalethgos |havebuff Zalethgos is Near##398866 |goto 30.33,49.83
step
talk Varastrasza##197111
|tip Inside the building.
Tell her _"My whelp here is looking for some glasses."_
Speak to Varastrasza with Zalethgos |q 73007/1 |goto 30.33,49.83
step
click Dark Blue Shades
|tip Inside the building.
Try the Glasses On |q 73007/2 |goto 30.25,46.92 |count 1
step
Watch the dialogue
click Rhinestone Sunglasses
|tip Inside the building.
Try the Glasses On |q 73007/2 |goto 30.35,46.91 |count 2
step
Watch the dialogue
click Dazzling Spectacles
|tip Inside the building.
Try the Glasses On |q 73007/2 |goto 30.46,46.92 |count 3
step
Watch the dialogue
Find the Perfect Glasses |q 73007/3 |goto 30.34,46.93
step
talk Agapanthus##182082
turnin New Lenses##73007 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73011)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept A Scholar's Pet##73008 |goto Valdrakken/0 12.89,57.14
step
Visit Lysindra |q 73008/1 |goto 48.30,81.73
|tip Inside the building.
step
Visit the Azure Archives |q 73008/2 |goto 34.03,28.82
|tip Inside the building.
step
clicknpc Magic Book##207665
|tip Inside the building.
Retreive the Magic Book |q 73008/3 |goto 33.50,26.57
step
talk Lasztak##199259
Tell him _"Here is the magic book for Zalethgos."_
Give the Magic Book to Lasztak |q 73008/4 |goto 12.93,57.51
step
talk Agapanthus##182082
turnin A Scholar's Pet##73008 |goto 12.89,57.14
accept Sight Isn't Everything##73009 |goto 12.89,57.14
step
Visit Wurallie in the Waking Shores |q 73009/1 |goto The Waking Shores/0 47.13,64.93
step
talk Wurallie##207546
Tell her _"Begin pet battle."_
Defeat Wurallie in a Pet Battle with Pallibrius on Your Team |q 73009/2 |goto 47.13,64.93
|tip This is typically easier with low level pets.
|tip Wurallie's pet will be level 3.
|tip Ensure you have Pallibrius on your pet team before beginning the battle.
|tip Iggy can complete this battle solo typically.
|tip If using Iggy, begin with Dodge, then Extra Plating, then spam Stone Shot.
step
talk Agapanthus##182082
turnin Sight Isn't Everything##73009 |goto Valdrakken/0 12.89,57.14
step
talk Lasztak##199259
accept The Emerald Hatchling##73010 |goto Valdrakken/0 12.93,57.49
step
talk Zahkrana##189260
Tell him _"I am here to bring the egg to Valdrakken."_
Collect the Emerald Egg |q 73010/1 |goto The Waking Shores/0 62.78,70.43
step
extraaction Hatch Egg##398651
Hatch the Egg at the Emerald Oathstone |q 73010/2 |goto Ohn'ahran Plains/0 22.27,51.43
step
talk Agapanthus##182082
turnin The Emerald Hatchling##73010 |goto Valdrakken/0 12.89,57.14
accept Home Sweet Dirt##73011 |goto 12.89,57.14
step
Kill enemies around this area
collect 5 Loamy Soil##202694 |q 73011/1 |goto Ohn'ahran Plains/0 29.50,52.07
step
talk Mysindre##198907
Ask it _"Do you have anything that could soothe a green hatchling?"_
collect 1 Comforting Ducky##202696 |q 73011/3 |goto 30.30,57.73
step
click Water Jug
collect 1 Ancient Water##202695 |q 73011/2 |goto 18.90,49.16
step
click Ancient Water Jug
Place the Nest Pieces |q 73011/4 |goto Valdrakken/0 16.17,55.09 |count 1
step
click Garden Planter
Place the Nest Pieces |q 73011/4 |goto 16.14,54.87 |count 2
step
click Comforting Ducky
Place the Nest Pieces |q 73011/4 |goto 16.11,54.90 |count 3
step
talk Agapanthus##182082
turnin Home Sweet Dirt##73011 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73013)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept Hochenblume Harvest##73012 |goto 12.89,57.14
step
collect 5 Hochenblume##191461 |q 73012/1
|tip Farm them with Herbalism or purchase them from the auction house.
|tip Ensure that you purchase the correct quality if you use the auction house.
step
talk Emerald Hatchling##200873
Ask it _"Are you hungry?"_
Feed the Emerald Hatchling |q 73012/2 |goto 16.16,54.86
step
talk Agapanthus##182082
turnin Hochenblume Harvest##73012 |goto 12.89,57.14
accept So... Tired...##73013 |goto 12.89,57.14
step
talk Emerald Hatchling##200873
Tell it _"Let's play!"_
Start Playing Tag with the Azure Hatchling |q 73013/1 |goto 16.16,54.86
step
clicknpc Emerald Hatchling##200873
extraaction I'm Gonna Get You!##400911
|tip Use it on the hatchling nearby to make it teleport away from you.
|tip Chase it back and forth a few times until it returns to the nest.
Chase the Hatchling to the Nest |q 73013/2 |goto 16.14,54.87
step
talk Agapanthus##182082
turnin So... Tired...##73013 |goto 12.89,57.14
step
Wait for the Next Daily Reset |complete not completedq(76204) or completedq(73014)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept A Green Who Can't Sleep?##73014 |goto Valdrakken/0 12.89,57.14
step
use Posidriss's Whistle##203621
talk Posidriss##200879
Ask it _"Maybe a bedtime story will help?"_
|tip Choose any dialogue options you like.
Tell Posidriss a Bedtime Story |q 73014/1 |goto 16.13,54.84
step
talk Elucia##186489
buy 1 Acorn Milk##196584 |q 73014/2 |goto Ohn'ahran Plains/0 30.66,56.91
step
_Next to you:_
talk Posidriss##200879
Tell it _"Here, drink this!"_
Give the Acorn Milk to Posidriss |q 73014/3 |goto 30.44,56.86
step
kill Wild Argali##193309+
Count #10# Wild Argali |q 73014/4 |goto 58.74,57.44
You can find more around [72.38,40.79]
step
talk Lasztak##199259
turnin A Green Who Can't Sleep?##73014 |goto Valdrakken/0 12.95,57.51
step
Wait for the Next Daily Reset |complete not completedq(76204)
|tip Another quest will be available tomorrow.
step
talk Agapanthus##182082
accept A Sleepy Pet##73015 |goto 12.89,57.14
step
Visit Lysindra |q 73015/1 |goto 48.27,82.13
|tip Inside the building.
step
clicknpc Sleepy Bear##207673
|tip Inside the building.
Awake the Sleepy Bear |q 73015/2 |goto 48.70,82.14
step
talk Lasztak##199259
Tell him _"Here is the sleepy bear cub for Posidriss."_
Give the Sleepy Bear to Lasztak |q 73015/3 |goto 12.94,57.51
step
talk Agapanthus##182082
turnin A Sleepy Pet##73015 |goto 12.89,57.14
accept Hibernation##73016 |goto 12.89,57.14
step
Visit Wurallie in the Waking Shores |q 73016/1 |goto The Waking Shores/0 47.20,64.95
step
talk Wurallie##207546
Tell her _"Begin pet battle."_
Defeat Wurallie in a Pet Battle with Somnius on Your Team |q 73016/2 |goto 47.20,64.95
|tip This is typically easier with low level pets.
|tip Wurallie's pet will be level 2.
|tip Ensure you have Somnius on your pet team before beginning the battle.
|tip Iggy can complete this battle solo typically.
|tip If using Iggy, begin with Dodge, then Extra Plating, then spam Stone Shot.
|tip Use Dodge on cooldown, and keep Extra Plating active when possible.
step
talk Agapanthus##182082
turnin Hibernation##73016 |goto Valdrakken/0 12.89,57.14
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Eon's Fringe Dailies",{
author="support@zygorguides.com",
description="This guide will help you acquire the Mote of Nasz'uro pet.",
startlevel=70,
patch='100105',
},[[
step
talk Melly Teletone##204990
accept Time, Signature##75935 |goto Thaldraszus/0 54.97,81.64
step
talk Temporal Investigator Tempo##195773
Ask her _"Do you have any musical advice?"_
Talk to Tempo |q 75935/1 |goto 54.77,81.62
step
talk Temporal Investigator Tempo##195773
accept The Chronosmith##76350 |goto 54.77,81.62
step
talk Nozdormu##208052
accept Rough Edges##76598 |goto 54.78,81.39
step
talk Ironus Coldsteel##205679
Ask him _"Tempo sent me to find a chronosmith named Ironormu. Do you know him?"_
Talk to the Chronosmith |q 76350/1 |goto 52.59,80.45
step
talk Ironus Coldsteel##205679
turnin The Chronosmith##76350 |goto 52.59,80.45
accept Chronohammer Time!##76352 |goto 52.59,80.45
accept For the Hoard!##76354 |goto 52.59,80.45
stickystart "Destroy_Time-Displaced_Creatures"
step
click Chronomatic Crates##403751+
Find and Collect #10# of Ironus's artifacts |q 76354/1 |goto 58.93,68.81
step
label "Destroy_Time-Displaced_Creatures"
Kill enemies around this area
Destroy Time-Displaced Creatures and Rifts to Charge the Hammer |q 76352/1 |goto 58.93,68.81
step
talk Ironus Coldsteel##205679
turnin Chronohammer Time!##76352 |goto 52.59,80.45
turnin For the Hoard!##76354 |goto 52.59,80.45
accept If a Hammer Can Break a Lock...##76355 |goto 52.59,80.45
step
extraaction Shatter Time Lock##418276
Timelock shattered |q 76355/1 |goto 52.47,80.52
step
Watch the dialogue
talk Ironus Coldsteel##208825
|tip Inside the building.
turnin If a Hammer Can Break a Lock...##76355 |goto 52.27,80.58
accept By Time Fire be Purged!##76258 |goto 52.27,80.58
accept Sword Stealing Searers##76356 |goto 52.27,80.58
step
click Seashellamayne##406369
|tip At the top of the tower.
collect 1 Seashellamayne the Shattered##208100 |q 76356/1 |goto 52.20,81.60
step
kill Slagnaros##206134
|tip At the top of the tower.
collect 1 The Heart of the Timeforge##208482 |q 76258/1 |goto 52.05,83.14
step
talk Ironus Coldsteel##206138
|tip Inside the building.
turnin By Time Fire be Purged!##76258 |goto 52.21,80.79
turnin Sword Stealing Searers##76356 |goto 52.21,80.79
step
Find Pedgi and Melly at the Everywhen Inn |q 75935/2 |goto 52.37,81.79
|tip Upstairs inside the building.
step
talk Melly Teletone##204990
|tip Upstairs inside the building.
turnin Time, Signature##75935 |goto 52.36,81.81
accept Pedgi the Parched##77432 |goto 52.36,81.81
step
talk Bartender Bob##203769
|tip Downstairs inside the building.
buy Single Black Coffee##206521 |q 77432/1 |goto 52.14,81.52
step
talk Pedgi##204987
|tip Upstairs inside the building.
Select  _"<Give Pedgi a single black coffee.>"_
Give Pedgi a Drink |q 77432/2 |goto 52.37,81.79
step
talk Melly Teletone##204990
|tip Upstairs inside the building.
turnin Pedgi the Parched##77432 |goto 52.36,81.81
accept Downbeat Data##75949 |goto 52.36,81.81
step
talk Pedgi##204987
|tip Upstairs inside the building.
Ask her _"Can I borrow your sunglasses?"_
Borrow Pedgi's Sunglasses |q 75949/1 |goto 52.30,81.77
step
use Melly's Metronographer##208236
|tip Use it on silver items that are out of time.
|tip They appear on your minimap as yellow dots.
kill Time Flies##207490+
|tip They will occasionally attack you.
Banish Off-Beat Entities with Melly's Device |q 75949/2 |goto 53.00,82.51
step
talk Melly Teletone##204990
|tip Upstairs inside the building.
turnin Downbeat Data##75949 |goto 52.30,81.80
accept Compose Yourself##75966 |goto 52.30,81.80
step
talk Pedgi##204987
|tip Choose any dialogue options you prefer.
Build Pedgi's Confidence |q 75966/1 |goto 52.30,81.77
step
talk Pedgi##204987
turnin Compose Yourself##75966 |goto 53.85,87.81
accept Slime Dies When You're Having Fun##74476 |goto 53.85,87.81
accept Grime Lies Where You're Killing Slimes##74942 |goto 53.85,87.81
stickystart "Slay_Time_Slimes"
step
click Time Grime Pile+
|tip They look like piles of dirt in the water around this area.
collect 8 Time Grime##204263 |q 74942/1 |goto 53.82,87.67
step
label "Slay_Time_Slimes"
Kill Time Slime enemies around this area
Slay #12# Time Slimes |q 74476/1 |goto 54.04,86.78
step
talk Pedgi##204987
turnin Slime Dies When You're Having Fun##74476 |goto 53.85,87.81
turnin Grime Lies Where You're Killing Slimes##74942 |goto 53.85,87.81
step
talk Melly Teletone##204990
accept In Sync##76552 |goto 53.75,87.79
step
click Melly's Metronographer
collect Melly's Metronographer++##208401 |q 76552/1 |goto 53.76,87.78
step
clicknpc Temporal Investigator##207671
use Melly's Metronographer++##208401
|tip Use it on the Temporal Investigator that runs around this area.
Test the Metronographer on the Paused Temporal Investigator |q 76552/2 |goto 53.75,87.90
step
clicknpc Temporal Investigator##209143
use Melly's Metronographer++##208401
|tip Use it on the Temporal Investigator.
Re-sync the Slowed Down Temporal Investigator |q 76552/4 |goto 53.37,84.63
step
clicknpc Temporal Investigator##209144
use Melly's Metronographer++##208401
|tip Use it on the Temporal Investigator.
Re-sync the Sped Op Temporal Investigator |q 76552/5 |goto 52.66,84.54
step
clicknpc Temporal Investigator##207933
use Melly's Metronographer++##208401
|tip Use it on the Temporal Investigator inside the building.
Re-sync the Reversed Temporal Investigator |q 76552/3 |goto 52.18,83.24
step
talk Melly Teletone##204990
turnin In Sync##76552 |goto 53.75,87.79
accept Feats Per Minute##75986 |goto 53.75,87.79
step
use Melly's Metronographer++##208401
|tip Use it on Time Slime Prime several times to remove all stacks of its buff.
kill Time Slime Prime##202453 |q 75986/1 |goto 56.38,88.19
step
talk Temporal Investigator Tempo##195773
turnin Feats Per Minute##75986 |goto 54.77,81.62
step
talk Alexstrasza the Life-Binder##208004
Ask her _"What happened?"_
Check on Alexstrasza |q 76598/1 |goto 56.58,41.16
step
talk Alexstrasza the Life-Binder##208004
turnin Rough Edges##76598 |goto 56.58,41.16
step
label "Accept_Daily_Quest"
Talk to the daily NPC
|tip Inside the building.
accept Woolomancer##75987 |goto Thaldraszus/0 52.16,81.67 |only if questpossible |or
accept Prince in Peril##76244 |goto 52.26,81.49 |only if questpossible |or
accept Missing Mojo##76162 |goto 52.26,81.49 |only if questpossible |or
accept Lost Time-Lost Vikings##75466 |goto 52.26,81.49 |only if questpossible |or
accept The Black Prince Parade##75989 |goto 52.26,81.49 |only if questpossible |or
accept Tracked Through Time##75970 |goto 52.26,81.49 |only if questpossible |or
accept Manastorm Mystique##76246 |goto 52.26,81.49 |only if questpossible |or
accept Lucky Hearthstone Card##75988 |goto 52.26,81.49 |only if questpossible |or
accept Time-Lost Trio##75657 |goto 52.26,81.49 |only if questpossible |or
accept Small Things##76076 |goto 52.26,81.49 |only if questpossible |or
accept Star-Crossed Lovers##75990 |goto 52.26,81.49 |only if questpossible |or
accept Fowl Beasts##76251 |goto 52.26,81.49 |only if questpossible |or
accept A Mislaid Egg##76269 |goto 52.26,81.49 |only if questpossible |or
accept What Could Have Been##75991 |goto 52.26,81.49 |only if questpossible |or
accept A Multitude of Tasks##76266 |goto 52.26,81.49 |only if questpossible |or
accept Squeaky Toy of Time and Space##75971 |goto 52.26,81.49 |only if questpossible |or
Accept the Daily Quest |complete false |goto 52.26,81.49 |or
step
click Time-Displaced Toy##403081
collect 1 Time-Displaced Toy##206161 |q 75971/1 |goto Thaldraszus/0 54.20,75.55
|only if haveq(75971) or completedq(75971)
step
click Time-Portal to Naxxramas
|tip Inside the building.
Take the Portal from Everywhen Inn to Naxxramas |q 75971/3 |goto 52.19,81.75
|only if haveq(75971) or completedq(75971)
step
click Cat Toy
|tip Directly in front of you.
Return the Time-Displaced Toy |q 75971/2
|only if haveq(75971) or completedq(75971)
step
click Time-Portal to Everywhen Inn
|tip To the right of the Cat Toy.
Take the Portal from Naxxramas to Everywhen Inn |q 75971/5
|only if haveq(75971) or completedq(75971)
step
Return to Soridormi in the Everywhen Inn |q 75971/4 |goto Thaldraszus/0 52.15,81.65
|tip Inside the building.
|only if haveq(75971) or completedq(75971)
step
click Time-Portal to Dun Algaz
Take the Portal from Everywhen Inn to Dun Algaz |q 76269/2 |goto Thaldraszus/0 52.07,81.69
|only if haveq(76269) or completedq(76269)
step
extraaction Time Shifted Sands##413444
Gain the "Time Shifted Sands" Buff |havebuff Time Shifted Sands##413444
|tip This will cause you to gain stealth.
|tip Avoid large blue circles around NPCs or you will be detected.
|only if haveq(76269) or completedq(76269)
step
click Red Dragon Egg
|tip Upstairs inside the building.
collect 1 Red Dragon Egg##206394 |q 76269/1 |goto Wetlands/0 48.28,74.31
|only if haveq(76269) or completedq(76269)
step
click Red Dragon Egg
Place the Red Dragon Egg |q 76269/3 |goto 47.05,76.04
|only if haveq(76269) or completedq(76269)
step
click Time-Portal to Everywhen Inn
Take the Portal from Dun Algaz to Everywhen Inn |q 76269/4 |goto 46.90,76.08
|only if haveq(76269) or completedq(76269)
step
Return to Chromie in the Everywhen Inn |q 76269/5 |goto Thaldraszus/0 52.15,81.65
|tip Inside the building.
|only if haveq(76269) or completedq(76269)
step
click Time-Portal to Val'sharah
Take the Portal from Everywhen Inn to Val'sharah |q 75990/1 |goto Thaldraszus/0 52.10,81.64
|only if haveq(75990) or completedq(75990)
step
talk Malfurion Stormrage##207194
Select _"<Ask Malfurion what's wrong.>"_
Talk to Malfurion |q 75990/2 |goto Val'sharah/0 56.58,89.89
|only if haveq(75990) or completedq(75990)
step
click Pale Duskblossom##404232+
|tip They look like smal white flowers on the ground around this area.
collect 8 Pale Duskblossom##206695 |q 75990/3 |goto 56.80,88.76
|only if haveq(75990) or completedq(75990)
step
talk Malfurion Stormrage##207194
Select  _"<Give Malfurion the Duskblossoms.>"_
Give Duskblossoms to Malfurion |q 75990/4 |goto 56.58,89.88
|only if haveq(75990) or completedq(75990)
step
click Time-Portal to Everywhen Inn
Take the Portal from Val'sharah to Everywhen Inn |q 75990/6 |goto 56.37,90.02
|only if haveq(75990) or completedq(75990)
step
Return to Chromie in the Everywhen Inn |q 75990/5 |goto Thaldraszus/0 52.15,81.65
|tip Inside the building.
|only if haveq(75990) or completedq(75990)
step
click Time-Portal to Dalaran
|tip Inside the building.
Take the Portal from Everywhen Inn to Dalaran |q 76246/1 |goto Thaldraszus/0 52.10,81.77
|only if haveq(76246) or completedq(76246)
step
talk Millhouse Manastorm##206144
Tell him _"Just talk to her."_
|tip Inside the building.
Help Millhouse Woo Millificent |q 76246/2 |goto Dalaran/1 48.31,41.18
|only if haveq(76246) or completedq(76246)
step
click Time-Portal to Everywhen Inn
|tip Inside the building.
Take the Portal from Dalaran to Everywhen Inn |q 76246/4 |goto 46.97,38.42
|only if haveq(76246) or completedq(76246)
step
Return to Chromie in the Everywhen Inn |q 76246/3 |goto Thaldraszus/0 52.16,81.66
|tip Inside the building.
|only if haveq(76246) or completedq(76246)
step
clicknpc Time-Lost Cub##205317
Rescue the Time-Lost Cub |q 75970/1 |goto Thaldraszus/0 59.29,76.85
|only if haveq(75970) or completedq(75970)
step
click Time-Portal to Feralas
|tip Inside the building.
Take the Portal from Everywhen Inn to Feralas |q 75970/3 |goto 52.07,81.63
|only if haveq(75970) or completedq(75970)
step
clicknpc Mother Bear Corpse##207920
Return the Time-Lost Cub to Mother Bear |q 75970/2 |goto Feralas/0 45.38,7.57
|only if haveq(75970) or completedq(75970)
step
click Time-Portal to Everywhen Inn
Take the Portal from Feralas to Everywhen Inn |q 75970/5 |goto 45.27,7.44
|only if haveq(75970) or completedq(75970)
step
Return to Chromie in the Everywhen Inn |q 75970/4 |goto Thaldraszus/0 52.15,81.65
|tip Inside the building.
|only if haveq(75970) or completedq(75970)
step
talk Wrathion##206538
|tip Inside the building.
Select  _"<Give Wrathion his tab.>"_
Watch the dialogue
Deliver Wrathion's Tab |q 75989/4 |goto Thaldraszus/0 52.30,81.69
|only if haveq(75989) or completedq(75989)
step
talk Wrathion##206543
|tip Inside the building.
Select _"<Help Wrathion write a letter.>"_
|tip Choose any dialogue options you prefer.
Send Wrathion to Stormwind |q 75989/2 |goto 52.36,81.69
|only if haveq(75989) or completedq(75989)
step
clicknpc Wrathion##206547
|tip Inside the building.
Pick Up Wrathion |havebuff Holding Whelp Wrathion##414045 |goto 52.32,81.81
|only if haveq(75989) or completedq(75989)
step
extraaction Toss Wrathion##414043
|tip Toss him to the gold portal near the door inside the building.
Return Wrathion to Ravenholdt Manor |q 75989/1 |goto 52.32,81.81
|only if haveq(75989) or completedq(75989)
step
talk Wrathion##206546
|tip Inside the building.
Select _"<Tell Wrathion to apologize to Wrathion.>"_
Tell Wrathion to Apologize |q 75989/3 |goto 52.25,81.77
|only if haveq(75989) or completedq(75989)
step
click Time-Portal to Tiragarde Sound
|tip Inside the building.
Take the Portal from Everywhen Inn to Tiragarde Sound |q 75987/1 |goto Thaldraszus/0 52.14,81.77
|only if haveq(75987) or completedq(75987)
step
extraaction Dispel Magic##413104
|tip Use the ability on your screen on various creatures around this area.
Dispel #8# Polymorphed Creatures |q 75987/2 |goto Tiragarde Sound/0 60.83,28.64
|only if haveq(75987) or completedq(75987)
step
click Wand of Mass Polymorph##403541
collect 1 Wand of Mass Polymorph##206368 |q 75987/3 |goto 60.96,28.58
|only if haveq(75987) or completedq(75987)
step
click Time-Portal to Everywhen Inn
Take the Portal from Tiragarde Sound to Everywhen Inn |q 75987/5 |goto 60.49,28.39
|only if haveq(75987) or completedq(75987)
step
Return to Soridormi in the Everywhen Inn |q 75987/4 |goto Thaldraszus/0 52.16,81.67
|tip Inside the building.
|only if haveq(75987) or completedq(75987)
step
kill 1 Enchanted Card Swarm##205602 |q 75988/1 |goto Thaldraszus/0 58.35,37.10
|only if haveq(75988) or completedq(75988)
step
collect 1 Anduin's Lucky Hearthstone Card##206022 |q 75988/2 |goto 58.35,37.10
|tip Loot it from the Enchanted Card Swarm.
|only if haveq(75988) or completedq(75988)
step
Enter the building |goto Valdrakken/0 77.47,51.40 < 10 |walk
talk Olaf##204046
|tip Inside the building.
Select _"<Ask Olaf to return with you.>"_
Olaf spoken with |q 75466/1 |goto 73.97,49.89
|only if haveq(75466) or completedq(75466)
step
click Jaunty Jukebox
|tip Inside the building.
Turn the Music Off |q 75466/2 |goto 73.36,49.87
|only if haveq(75466) or completedq(75466)
step
use Eric's Camera##204989
kill Olaf##204046
|tip Inside the building.
Convince Olaf to Return |q 75466/3 |goto 73.36,49.87
|only if haveq(75466) or completedq(75466)
step
Find Baelog |q 75466/4 |goto 71.03,58.03
|tip Inside the building.
|only if haveq(75466) or completedq(75466)
step
talk Baelog##204044
Select _"<Dare to poke the sleeping viking.>"_
kill Olaf##204046
Poke Baelog |q 75466/5 |goto 71.03,58.03
|only if haveq(75466) or completedq(75466)
step
Convince Baelog to Return |q 75466/6 |goto 71.03,58.03
|only if haveq(75466) or completedq(75466)
step
Find Eric |q 75466/7 |goto 57.38,41.73
|tip At the top of the tower.
|only if haveq(75466) or completedq(75466)
step
talk Eric "The Swift"##204045
|tip At the top of the tower.
Select _"<Ask Eric to return with you.>"_
Speak with Eric |q 75466/8 |goto 57.38,41.73
|only if haveq(75466) or completedq(75466)
step
use Eric's Camera##204989
|tip Use the "Catalog" button on your vehicle bar.
Take Eric's Picture |q 75466/9 |goto 58.67,36.57
|only if haveq(75466) or completedq(75466)
step
click Time-Portal to Lordaeron
|tip Inside the building.
Take the Portal from Everywhen Inn to Lordaeron |q 76076/1 |goto Thaldraszus/0 52.15,81.94
|only if haveq(76076) or completedq(76076)
step
click Icy Rocks
Place the Icy Rocks |q 76076/2 |goto Tirisfal Glades/0 68.01,64.83
|only if haveq(76076) or completedq(76076)
step
click Time-Portal to Eon's Fringe
Return to Chromie in Everywhen Inn |q 76076/4 |goto 66.43,65.72
|only if haveq(76076) or completedq(76076)
step
Return to Chromie in Everywhen Inn |q 76076/4 |goto Thaldraszus/0 52.15,81.87
|only if haveq(76076) or completedq(76076)
step
talk Gurgthock##188868
Tell him _"I'm ready to begin the fight with the gladiator trio."_
kill Valeera Sanguinar##204418
kill Lo'Gosh##204420
kill Broll Bearmantle##204422
|tip They will spawn in the center of the arena in front of you.
|tip You may need a group to complete this.
Defeat the Time-Lost Gladiator Trio |q 75657/1 |goto Ohn'ahran Plains/0 53.16,37.32
|only if haveq(75657) or completedq(75657)
step
talk Wodin the Troll-Servant##188871
turnin Time-Lost Trio##75657 |goto 53.18,37.29
|only if haveq(75657) or completedq(75657)
step
click Cloaking Device
Disable the Cloaking Device |q 75991/1 |goto Thaldraszus/0 58.15,80.19
|only if haveq(75991) or completedq(75991)
step
kill Fel-Corrupted Champion##205600 |q 75991/2 |goto 58.15,80.19
|only if haveq(75991) or completedq(75991)
stickystart "Slay_Riverpaw_Gnolls"
step
Enter the cave |goto The Azure Span/0 29.26,36.84 < 10 |walk
kill Matriarch Bluepelt##206048 |q 76244/2 |goto 30.08,38.35
|tip Inside the cave.
|only if haveq(76244) or completedq(76244)
step
clicknpc Prince Llane Wrynn##206039
|tip Inside the cave.
Prince Llane Wrynn Freed |q 76244/3 |goto 29.91,38.45
|only if haveq(76244) or completedq(76244)
step
label "Slay_Riverpaw_Gnolls"
Kill Riverpaw enemies around this area
|tip Inside the cave.
Slay #8# Riverpaw Gnolls |q 76244/1 |goto 30.06,37.66
|only if haveq(76244) or completedq(76244)
step
kill 10 Fowl Beast##206073 |q 76251/1 |goto The Azure Span/0 69.52,10.61
|only if haveq(76251) or completedq(76251)
step
kill Vol'jin's Mojo##205798
collect 1 Vol'jin's Mojo##206171 |q 76162/1 |goto Thaldraszus/0 53.49,87.43
|only if haveq(76162) or completedq(76162)
step
talk Chromie##205424
|tip Inside the building.
Ask her _"Why can't you do these tasks?"_
Talk to Chromie to Come Up with an Alternative Solution |q 76266/1 |goto Thaldraszus/0 52.15,81.65
|only if haveq(76266) or completedq(76266)
step
Watch the dialogue
talk Adventurer Rugan##206216
|tip Inside the building.
Choose _"<Summarize the task.>"_
Deal with the Adventurers |q 76266/2 |goto 52.19,81.64
|only if haveq(76266) or completedq(76266)
step
Watch the dialogue
talk Johnny Awesome##206228
|tip Inside the building.
Tell him _"It's so unique, I can't put it into words."_
Choose _"<Summarize the task.>"_
Deal with Another Adventurer |q 76266/3 |goto 52.19,81.64
|only if haveq(76266) or completedq(76266)
step
Watch the dialogue
talk Aeonormu##206251
|tip Inside the building.
Tell him _"You look like an adventurer to me."_
Choose _"<Give quick advice.>"_
Handle a Bronze Dragon Problem |q 76266/4 |goto 52.19,81.64
|only if haveq(76266) or completedq(76266)
step
Watch the dialogue
talk Daffydil##206261
|tip Inside the building.
Choose _"<Summarize the task.>"_
Send the Adventurers Off on Their First Journey |q 76266/5 |goto 52.19,81.64
|only if haveq(76266) or completedq(76266)
step
Watch the dialogue
|tip Inside the building.
Wait for Chromie to Return |q 76266/6 |goto 52.19,81.64
|only if haveq(76266) or completedq(76266)
step
click Cloaking Device
Disable the Cloaking Device |q 75991/1 |goto Thaldraszus/0 58.15,80.19
|only if haveq(75991) or completedq(75991)
step
kill Fel-Corrupted Champion##205600 |q 75991/2 |goto 58.15,80.19
|only if haveq(75991) or completedq(75991)
step
talk Anduin Wrynn##205604
|tip Inside the building.
turnin Lucky Hearthstone Card##75988 |goto Thaldraszus/0 52.15,81.58
|only if haveq(75988) or completedq(75988)
step
talk Stormwind Guard##206018
|tip Inside the building.
turnin Prince in Peril##76244 |goto 52.26,81.49
|only if haveq(76244) or completedq(76244)
step
talk Chromie##205424
|tip Inside the building.
turnin Tracked Through Time##75970 |goto 52.15,81.65 |only if haveq(75970) or completedq(75970)
turnin Small Things##76076 |goto 52.15,81.65 |only if haveq(76076) or completedq(76076)
turnin Star-Crossed Lovers##75990 |goto 52.15,81.65 |only if haveq(75990) or completedq(75990)
turnin A Mislaid Egg##76269 |goto 52.15,81.65 |only if haveq(76269) or completedq(76269)
turnin A Multitude of Tasks##76266 |goto 52.15,81.65 |only if haveq(76266) or completedq(76266)
|only if haveq(75970,76076,75990,76269,76266) or completedq(75970,76076,75990,76269,76266)
step
talk Soridormi##205769
|tip Inside the building.
turnin Woolomancer##75987 |goto 52.16,81.67 |only if haveq(75987) or completedq(75987)
turnin Manastorm Mystique##76246 |goto 52.16,81.67 |only if haveq(76246) or completedq(76246)
turnin Squeaky Toy of Time and Space##75971 |goto 52.16,81.67 |only if haveq(75971) or completedq(75971)
|only if haveq(75987,76246,75971) or completedq(75987,76246,75971)
step
talk Vol'jin##205793
|tip Inside the building.
turnin Missing Mojo##76162 |goto 52.28,81.70
|only if haveq(76162) or completedq(76162)
step
talk Nathanos Marris##206072
|tip Inside the building.
turnin Fowl Beasts##76251 |goto 52.22,81.79
|only if haveq(76251) or completedq(76251)
step
talk Bartender Bob##203769
|tip Inside the building.
turnin Lost Time-Lost Vikings##75466 |goto 52.14,81.52 |only if haveq(75466) or completedq(75466)
turnin The Black Prince Parade##75989 |goto 52.14,81.52 |only if haveq(75989) or completedq(75989)
turnin What Could Have Been##75991 |goto 52.14,81.52 |only if haveq(75991) or completedq(75991)
|only if haveq(75466,75989,75991) or completedq(75466,75989,75991)
step
You have completed the available dailies in Eon's Fringe
|tip This guide will reset when more become available.
'|complete not completedq(75988,76244,75987,76162,75466,75989,75991,75970,76246,75971,76076,75990,76269,76266,75657,76251) |next "Accept_Daily_Quest"
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Dragonflight (10-70)\\Little Scales Daycare Dailies",{
author="support@zygorguides.com",
description="This guide will help you complete the Little Scales Daycare daily quests.",
startlevel=70,
patch='100105',
},[[
step
Complete the "What's a Duck?" Quest |q 72459 |future |or
|tip Use the "Little Scales Daycare" guide to complete this quest.
Click Here to Load the "Little Scales Daycare" Guide |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Little Scales Daycare" |or
step
label "Accept_Race_Quest"
talk Celetiros##201443
accept Runaway Rusziona##74488 |goto Valdrakken/0 13.91,59.19 |only if questpossible |or
accept Blistering Belastrasza##74492 |goto 13.91,59.19 |only if questpossible |or
accept Zaleth on the Go##74490 |goto 13.91,59.19 |only if questpossible |or
accept Pole Position Posidriss##74491 |goto 13.91,59.19 |only if questpossible |or
accept Zhoomsa##74489 |goto 13.91,59.19 |only if questpossible |or
Click Here if No Daily Quest is Available |confirm |goto 13.91,59.19 |or
step
Start the Race at Celetiros and Complete It |q 74488/1
|tip You will race through Blackrock Mountain into Burning Steppes.
|tip Fly through gold rings and collect green orbs along the way.
|tip Use "Eruption" to dash forward.
|tip Use "Rock Halt" if you need to suddenly stop.
|tip While on the ground, use "Earthen Will" to restore all of your vigor.
|next "Accept_Race_Quest" |only if not readyq(74488)
|only if haveq(74488)
step
Return to the Little Scales Daycare |outvehicle |q 74488
|next "Accept_Race_Quest" |only if not readyq(74488)
|only if haveq(74488)
step
talk Celetiros##201443
turnin Runaway Rusziona##74488 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if haveq(74488)
step
Start the Race at Celetiros and Complete It |q 74492/1
|tip You will race along the wall.
|tip Fly through gold rings along the way.
|tip Begin by using "Ruby Exhaustion" to consume your vigor.
|tip When empty, use "Crimson Flight" to dash forward while regenerating your vigor.
|tip Just before "Crimson Flight" wears off, use "Renewal" to reset "Ruby Exhaustion".
|tip Repeat this process until the race is complete.
|next "Accept_Race_Quest" |only if not readyq(74492)
|only if haveq(74492)
step
Return to the Little Scales Daycare |outvehicle |q 74492
|next "Accept_Race_Quest" |only if not readyq(74492)
|only if haveq(74492)
step
talk Celetiros##201443
turnin Blistering Belastrasza##74492 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if haveq(74492)
step
Start the Race at Celetiros and Complete It |q 74490/1
|tip Fly through gold rings along the way.
|tip Begin by using "Blink Boost" to blink and dash forward.
|tip Use "Arcane Acceleration" to increase your forward speed, stacking it until your vigor runs out.
|tip When your vigor is empty, use "Accelerated Restoration" to restore it and begin the process again.
|tip Repeat this process until the race is complete.
|next "Accept_Race_Quest" |only if not readyq(74490)
|only if haveq(74490)
step
Return to the Little Scales Daycare |outvehicle |q 74490
|next "Accept_Race_Quest" |only if not readyq(74490)
|only if haveq(74490)
step
talk Celetiros##201443
turnin Zaleth on the Go##74490 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if haveq(74490)
step
Start the Race at Celetiros and Complete It |q 74491/1
|tip Fly through gold rings along the way.
|tip Begin by using "Nature's Wind" to fly up and dash.
|tip Use "Winds of Life" to begin dashing when you gain vigor.
|tip Use "Emerald Restraint" to add 5 seconds to your buff each time you use it while consuming vigor.
|tip Use "Nature's Wind" to fly upward and restore 1 vigor.
|tip Repeat this process until the race is complete.
|tip Make sure you conserve vigor until you get used to the rotation.
|next "Accept_Race_Quest" |only if not readyq(74491)
|only if haveq(74491)
step
Return to the Little Scales Daycare |outvehicle |q 74491
|next "Accept_Race_Quest" |only if not readyq(74491)
|only if haveq(74491)
step
talk Celetiros##201443
turnin Pole Position Posidriss##74491 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if haveq(74491)
step
Start the Race at Celetiros and Complete It |q 74489/1
|tip Fly through gold rings along the way.
|tip Begin by using "Growth Spurt" to transform and gain speed.
|tip Use "Bedtime Rewind" to reset "Growth Spurt."
|tip Use "Sacred Timeline" to reset your cooldowns when your "Growth Spurt" wears off.
|tip Repeat this process until the race is complete.
|next "Accept_Race_Quest" |only if not readyq(74489)
|only if haveq(74489)
step
Return to the Little Scales Daycare |outvehicle |q 74489
|next "Accept_Race_Quest" |only if not readyq(74489)
|only if haveq(74489)
step
talk Celetiros##201443
turnin Zhoomsa##74489 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if haveq(74489)
step
Start the Race at Celetiros and Complete It |q 77426/1
|tip You will race along the wall.
|tip Fly through gold rings along the way.
|tip Begin by using "Ruby Exhaustion" to consume your vigor.
|tip When empty, use "Crimson Flight" to dash forward while regenerating your vigor.
|tip Just before "Crimson Flight" wears off, use "Renewal" to reset "Ruby Exhaustion".
|tip Repeat this process until the race is complete.
|next "Accept_Race_Quest" |only if not readyq(77426)
|only if haveq(77426)
step
Return to the Little Scales Daycare |outvehicle |q 77426
|next "Accept_Race_Quest" |only if not readyq(77426)
|only if haveq(77426)
step
talk Celetiros##201443
turnin Blistering Belastrasza##77426 |goto 13.91,59.19 |next "Accept_Daily_Quest"
|only if readyq(77426)
step
label "Accept_Daily_Quest"
Talk to NPCs around the Daycare
accept Arts and Crafts and Baths##73126 |only if questpossible
accept Off the Page##73128 |only if questpossible
accept Fowl Runic Scribblings##73130 |only if questpossible
accept A Wealth of Whelp Snacks##73119 |only if questpossible
accept Obsidian Obfuscation##73135 |only if questpossible
accept Appetizing Aftermath##73120 |only if questpossible
accept Dignified Disguises##73131 |only if questpossible
accept Hoard Behavior##73124 |only if questpossible
accept Eternal Escapades##73134 |only if questpossible
accept Scanning the Stacks##73132 |only if questpossible
accept Cozy Camouflage##73133 |only if questpossible
Click Here to Continue |confirm always |goto 12.95,57.69
step
click Scrawled Rune
Dispel the Scrawled Rune |q 73130/1 |goto 11.96,57.62 |count 1
|only if haveq(73130) or completedq(73130)
step
click Scrawled Rune
Dispel the Scrawled Rune |q 73130/1 |goto 9.96,59.33 |count 2
|only if haveq(73130) or completedq(73130)
step
click Misplaced Toy
Collect the Misplaced Toy |q 73130/3 |goto 9.54,58.68 |count 1
|only if haveq(73130) or completedq(73130)
step
click Scrawled Rune
Dispel the Scrawled Rune |q 73130/1 |goto 9.37,58.63 |count 3
|only if haveq(73130) or completedq(73130)
step
click Scrawled Rune
Dispel the Scrawled Rune |q 73130/1 |goto 9.98,56.39 |count 4
|only if haveq(73130) or completedq(73130)
step
click Misplaced Toy
Collect the Misplaced Toy |q 73130/3 |goto 12.54,53.86 |count 2
|only if haveq(73130) or completedq(73130)
step
click Misplaced Toy
Collect the Misplaced Toy |q 73130/3 |goto 14.65,53.16 |count 3
|only if haveq(73130) or completedq(73130)
step
click Scrawled Rune
Dispel the Scrawled Rune |q 73130/1 |goto 14.26,57.72 |count 5
|only if haveq(73130) or completedq(73130)
step
click Misplaced Toy
Collect the Misplaced Toy |q 73130/3 |goto 13.79,59.58 |count 4
|only if haveq(73130) or completedq(73130)
step
kill Ducks Devil##200751 |q 73130/2 |goto 13.20,63.31
|only if haveq(73130) or completedq(73130)
step
click Misplaced Toy
Collect the Misplaced Toy |q 73130/3 |goto 10.92,61.75 |count 5
|only if haveq(73130) or completedq(73130)
step
click Duck Pile
Put the Toys Away |q 73130/4 |goto 11.09,59.24
|only if haveq(73130) or completedq(73130)
step
Scare the Birds |q 73120/1 |goto 13.26,53.98 |count 3
|tip Run up to them.
|only if haveq(73120) or completedq(73120)
step
kill 3 Hungry Crawler##200482 |q 73120/3 |goto 14.70,53.62 |count 3
|only if haveq(73120) or completedq(73120)
step
kill 6 Hungry Crawler##200482 |q 73120/3 |goto 15.63,55.17
|only if haveq(73120) or completedq(73120)
step
Scare the Birds |q 73120/1 |goto 14.36,61.75 |count 6
|tip Run up to them.
|only if haveq(73120) or completedq(73120)
step
click Lost Sand
Clear the Sand |q 73120/2 |goto 13.46,62.29 |count 1
|only if haveq(73120) or completedq(73120)
step
click Lost Sand
Clear the Sand |q 73120/2 |goto 12.70,62.81 |count 2
|only if haveq(73120) or completedq(73120)
step
click Lost Sand
Clear the Sand |q 73120/2 |goto 12.54,63.51 |count 3
|only if haveq(73120) or completedq(73120)
step
Scare the Birds |q 73120/1 |goto 12.14,64.85 |count 9
|tip Run up to them.
|only if haveq(73120) or completedq(73120)
step
click Paint Splatter
Clean the Paint Splatter |q 73126/2 |goto 11.42,58.28 |count 1
|only if haveq(73126) or completedq(73126)
step
click Paint Splatter
Clean the Paint Splatter |q 73126/2 |goto 10.25,59.34 |count 2
|only if haveq(73126) or completedq(73126)
step
kill The Stickiness##200731 |q 73126/3 |goto 9.53,57.86
|only if haveq(73126) or completedq(73126)
step
click Paint Splatter
Clean the Paint Splatter |q 73126/2 |goto 10.58,56.52 |count 3
|only if haveq(73126) or completedq(73126)
step
extraaction Water Toss##399683
|tip Use it on Sir Pringly nearby.
Douse Sir Pringly #3# Times |q 73126/1 |goto 12.35,54.62
|only if haveq(73126) or completedq(73126)
step
click Paint Splatter
Clean the Paint splatter |q 73126/2 |goto 13.34,55.64 |count 4
|only if haveq(73126) or completedq(73126)
step
click Paint Splatter
Clean the Paint splatter |q 73126/2 |goto 14.27,58.29 |count 5
|only if haveq(73126) or completedq(73126)
step
click Paint Splatter
Clean the Paint splatter |q 73126/2 |goto 13.65,59.03 |count 6
|only if haveq(73126) or completedq(73126)
step
talk Enchanting Stories##200818
Select _"<Flip to a random page and start reading.>"_
|tip Kill the enemy that spawns and attacks each time you talk to the book.
Slay #3# Stories |q 73128/1 |goto 11.30,65.20
|only if haveq(73128) or completedq(73128)
step
click Decorative Shrubbery
collect 1 Decorative Shrubbery##202690 |q 73124/2 |goto Ohn'ahran Plains/0 90.03,33.52
|only if haveq(73124) or completedq(73124)
step
talk Cirroll##202758
buy 1 Soothing Incense##202400 |q 73124/3 |goto Zaralek Cavern/0 56.62,55.19
|only if haveq(73124) or completedq(73124)
step
talk Lysindra##193029
|tip Inside the building.
buy 1 Stuffed Doll##202399 |q 73124/1 |goto Valdrakken/0 48.30,82.92
|only if haveq(73124) or completedq(73124)
step
click Homely Incense
Place the Habitat Piece |q 73124/4 |count 1 |goto 11.03,54.41
|only if haveq(73124) or completedq(73124)
step
click Stuffed Doll
Place the Habitat Piece |q 73124/4 |count 2 |goto 11.18,53.59
|only if haveq(73124) or completedq(73124)
step
click Decorative Shrubbery
Place the Habitat Piece |q 73124/4 |count 3 |goto 11.42,53.26
|only if haveq(73124) or completedq(73124)
stickystart "Find_the_Emerald_Whelpling"
stickystart "Find_the_Obsidian_Whelpling"
step
clicknpc Posidriss##201246
|tip It spawns around this area.
Find Posidriss |q 73133/1 |goto 72.38,63.72
|only if haveq(73133) or completedq(73133)
step
label "Find_the_Emerald_Whelpling"
clicknpc Emerald Whelpling##201244
|tip It spawns around this area. |notinsticky
Find the Emerald Whelpling |q 73133/2 |goto 72.38,63.72
|only if haveq(73133) or completedq(73133)
step
label "Find_the_Obsidian_Whelpling"
clicknpc Obsidian Whelp##201245
|tip It spawns around this area. |notinsticky
Find the Obsidian Whelpling |q 73133/3 |goto 72.38,63.72
|only if haveq(73133) or completedq(73133)
stickystart "Find_Big_Zhusa"
stickystart "Find_Spry_Zhusa"
step
clicknpc Zhusadormu##200925
|tip It spawns around this area.
Find Zhusadormu |q 73134/2 |goto Valdrakken/0 78.60,42.60
|only if haveq(73134) or completedq(73134)
step
label "Find_Big_Zhusa"
clicknpc Big Zhusa##200934
|tip It spawns around this area. |notinsticky
Find Big Zhusa |q 73134/3 |goto 78.60,42.60
|only if haveq(73134) or completedq(73134)
step
label "Find_Spry_Zhusa"
clicknpc Spry Zhusa##200998
|tip It spawns around this area. |notinsticky
Find Spry Zhusa |q 73134/1 |goto 78.60,42.60
|only if haveq(73134) or completedq(73134)
step
talk Gorgonzormu##196729
buy 1 Wheel of Whelpwhisper Brie##202265 |q 73119/1 |goto 29.03,65.05
|only if haveq(73119) or completedq(73119)
step
talk Kaestrasz##185561
buy 1 Bag of Spicy Pet Snacks##202266 |q 73119/2 |goto 46.69,78.92
|only if haveq(73119) or completedq(73119)
step
talk Tithris##185562
|tip Inside the building.
buy 1 Box of Leapmaize Crackers##203386 |q 73119/3 |goto 47.45,46.21
|only if haveq(73119) or completedq(73119)
step
clicknpc Tithris##185562
Place the Snacks |q 73119/4 |goto 10.57,62.34
|only if haveq(73119) or completedq(73119)
stickystart "Find_The_Azure_Whelpling"
stickystart "Find_The_Ruby_Whelpling"
step
clicknpc Rusziona##201250
|tip It can spawn all over this area.
Find the Rusziona |q 73135/1 |goto 39.70,48.11
|only if haveq(73135) or completedq(73135)
step
label "Find_The_Azure_Whelpling"
clicknpc Azure Whelpling##201252
|tip It can spawn all over this area. |notinsticky
Find the Azure Whelpling |q 73135/3 |goto 39.70,48.11
|only if haveq(73135) or completedq(73135)
step
label "Find_The_Ruby_Whelpling"
clicknpc Ruby Whelpling##201251
|tip It can spawn all over this area. |notinsticky
Find the Ruby Whelpling |q 73135/2 |goto 39.70,48.11
|only if haveq(73135) or completedq(73135)
stickystart "Find_The_Emerald_Whelpling"
stickystart "Find_Sir_Pringly"
step
clicknpc Belastrasza##200781
|tip It can spawn all over this area.
Find Bela |q 73131/1 |goto 59.88,16.77
|only if haveq(73131) or completedq(73131)
step
label "Find_The_Emerald_Whelpling"
clicknpc Emerald Whelpling##200810
|tip It can spawn all over this area. |notinsticky
Find the Emerald Whelpling |q 73131/2 |goto 59.88,16.77
|only if haveq(73131) or completedq(73131)
step
label "Find_Sir_Pringly"
clicknpc Sir Pringly##200802
|tip It can spawn all over this area. |notinsticky
Find Sir Pringly |q 73131/3 |goto 59.88,16.77
|only if haveq(73131) or completedq(73131)
stickystart "Find_the_Friend"
stickystart "Find_the_New_Book"
step
clicknpc Zalethgos##201201
|tip It can spawn all over this area.
Find Zaleth |q 73132/1 |goto 35.77,33.44
|only if haveq(73132) or completedq(73132)
step
label "Find_the_Friend"
clicknpc Bronze Whelpling##201199
|tip It can spawn all over this area. |notinsticky
Find the Friend |q 73132/2 |goto 35.77,33.44
|only if haveq(73132) or completedq(73132)
step
label "Find_the_New_Book"
clicknpc Humor for Highbrow Academicians##201200
|tip It can spawn all over this area. |notinsticky
Find the New Book |q 73132/3 |goto 35.77,33.44
|only if haveq(73132) or completedq(73132)
step
talk Zhusadormu##199986
turnin Eternal Escapades##73134 |goto Valdrakken/0 14.02,54.72
|only if haveq(73134) or completedq(73134)
step
talk Posidriss##199987
turnin Cozy Camouflage##73133 |goto 16.15,54.86
|only if haveq(73133) or completedq(73133)
step
talk Agapanthus##182082
turnin Arts and Crafts and Baths##73126 |goto 12.90,57.17 |only if haveq(73126) or completedq(73126)
turnin Off the Page##73128 |goto 12.90,57.17 |only if haveq(73128) or completedq(73128)
turnin Fowl Runic Scribblings##73130 |goto 12.90,57.17 |only if haveq(73130) or completedq(73130)
turnin A Wealth of Whelp Snacks##73119 |goto 12.90,57.17 |only if haveq(73119) or completedq(73119)
turnin Hoard Behavior##73124 |goto 12.90,57.17 |only if haveq(73124) or completedq(73124)
turnin Appetizing Aftermath##73120 |goto 12.90,57.17 |only if haveq(73120) or completedq(73120)
|only if haveq(73126,73128,73130,73119,73124,73120) or completedq(73126,73128,73130,73119,73124,73120)
step
talk Celetiros##201443
turnin Runaway Rusziona##74488 |goto 13.91,59.19 |only if haveq(74488) or completedq(74488)
turnin Blistering Belastrasza##74492 |goto 13.91,59.19 |only if haveq(74492) or completedq(74492)
|only if haveq(74488,74492) or completedq(74488,74492)
step
talk Rusziona##198612
turnin Obsidian Obfuscation##73135 |goto 11.37,57.23
|only if haveq(73135) or completedq(73135)
step
talk Belastrasza##199990
turnin Dignified Disguises##73131 |goto 10.65,59.27
|only if haveq(73131) or completedq(73131)
step
talk Zalethgos##199985
turnin Scanning the Stacks##73132 |goto 9.66,56.56
|only if haveq(73132) or completedq(73132)
step
You have completed the available dailies in the Little Scales Daycare
|tip This guide will reset when more become available.
'|complete not completedq(73134,73133,73126,73128,73130,73119,73124,74488,74492,73135,73120,73131,73132) |next "Accept_Race_Quest"
]])
