local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("PetsCTWW") then return end
if not ZGV.CommonPets then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Aubergine Scootlefish",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Not a squid, nor a kid, the scootlefish prefers to keep its ink to itself except under dire circumstances.",
keywords={"Aquatic"},
pet=4471,
},[[
step
clicknpc Aubergine Scootlefish##222325
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
learnpet Aubergine Scootlefish##4471 |goto Azj-Kahet/0 36.56,55.02
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Diamond Crab",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Not a squid, nor a kid, the scootlefish prefers to keep its ink to itself except under dire circumstances.",
keywords={"Aquatic"},
pet=3361,
},[[
step
clicknpc Diamond Crab##222325
|tip This battle pet is seen as a rare back-up pet when pet battling around the coastline of the Isle of Dorn.
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
learnpet Diamond Crab##3361
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Fathom Incher",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description="In the depths of the Endless Sea, strange thalassic horrors lurk. Not this fella, though. He's completely normal.",
keywords={"Aquatic"},
pet=4520,
},[[
step
kill Kobyss Shadeshaper##215653+
|tip Stealthed at this location, and in this area.
|tip These drop the quest.
collect Gasping Fish##217352 |n
accept Gasping Plea##80312 |goto Hallowfall/0 53.47,29.93 |or
'|complete haspet(4520) |or
step
extraaction Put Me in the Water##440905
extraaction Put Me in the Water##440980
Drop the Gasping Fish in the Water at This Location
|tip Click the action button that appears on your screen.
|tip You may have to dismount to see the extra action button.
Drop the fish into the water near Sunless Strand |q 80312/1 |goto Hallowfall/0 54.53,25.33 |or
'|complete haspet(4520) |or
step
talk Peculiar Fish##219430
|tip In the water.
turnin Gasping Plea##80312 |goto Hallowfall/0 54.53,25.33 |or
accept Tidal Charms##80313 |goto Hallowfall/0 54.53,25.33
accept Voices From the Deep##80314 |goto Hallowfall/0 54.53,25.33
'|complete haspet(4520) |or
stickystart "COLLECT_12_SUNLESS_SHARDS"
step
click Kobyss Shrine
Raised Shrine studied |q 80314/1 |goto Hallowfall/0 55.29,24.17 |or
'|complete haspet(4520) |or
step
click Kobyss Shrine
Submerged Shirne studied |q 80314/2 |goto Hallowfall/0 56.33,22.54 |or
'|complete haspet(4520) |or
step
click Kobyss Shrine
Guarded Shrine studied |q 80314/3 |goto Hallowfall/0 56.99,24.78 |or
'|complete haspet(4520) |or
step
label "COLLECT_12_SUNLESS_SHARDS"
Kill Humanoid Sunless enemies around here
collect 12 Sunless Shard##217709 |q 80313/1 |goto Hallowfall/0 56.23,24.49 |or
'|complete haspet(4520) |or
step
talk Peculiar Fish##219430
|tip In the water.
turnin Tidal Charms##80313 |goto Hallowfall/0 54.53,25.33 |or
turnin Voices From the Deep##80314 |goto Hallowfall/0 54.53,25.33
accept Alluring Offer##80315 |goto Hallowfall/0 54.53,25.33
'|complete haspet(4520) |or
stickystart "KILL_CHIEFTAIN_GILCARVER"
step
use the Beguiling Lure (Optional)##440025
|tip It appears as a button on your screen.
|tip Use it once to activate it, then use it again when mobs are inside the cicle to do damage.
kill 5 Sunless Tidemarshal##219602 |q 80315/2 |goto Hallowfall/0 54.00,19.90 |or
'|complete haspet(4520) |or
step
label "KILL_CHIEFTAIN_GILCARVER"
use the Beguiling Lure (Optional)##440025 |notinsticky
|tip It appears as a button on your screen. |notinsticky
|tip Use it once to activate it, then use it again when he is inside the cicle to do damage. |notinsticky
kill Chieftain Gillcarver##219633 |q 80315/3 |goto Hallowfall/0 54.00,19.90 |or
'|complete haspet(4520) |or
step
talk Peculiar Fish##219430
|tip In the water.
turnin Alluring Offer##80315 |goto Hallowfall/0 54.53,25.33 |or
accept Return to the Sea##80316 |goto Hallowfall/0 54.53,25.33
'|complete haspet(4520) |or
step
clicknpc Peculiar Fish##220117
collect Rehydrated Fish##217816 |q 80316/1 |goto Hallowfall/0 54.53,25.33 |or
'|complete haspet(4520) |or
step
Put the Fish in the Water
|tip It appears as a button on your screen.
Drop the fish in deeper waters in Bleak Sand |q 80316/2 |goto Hallowfall/0 56.93,8.72 |or
'|complete haspet(4520) |or
step
talk Peculiar Fish##219430
turnin Return to the Sea##80316 |goto Hallowfall/0 56.93,8.72 |n
collect Fathom Incher##222964 |goto Hallowfall/0 56.93,8.72 |or
'|complete haspet(4520) |or
step
use Fathom Incher##222964
learnpet Fathom Incher##4520
]])
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Oop'lajax",{
patch='110002',
source='Puzzle',
author="support@zygorguides.com",
description="He's a little jumpy... especially around the face.",
keywords={"Aquatic"},
pet=4470,
},[[
step
click Scary Dark Chest##445403 |goto The Ringing Deeps/0 58.90,30.40
|tip Light all the candles around it within 15 seconds.
|tip If the chest was opened recently, it may still be unlocked for others.
collect Oop'lajax##224439
step
use Oop'lajax##224439
|tip It will be an item in your bags.
learnpet Oop'lajax##4470
]])
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Sapphire Crab",{
patch='110002',
source='Puzzle',
author="support@zygorguides.com",
description="Though eye-catching, their namesake coloration is rubbish for camouflage. The blind skiplings couldn't care less.",
keywords={"Aquatic"},
pet=3362,
},[[
step
clicknpc Lionel###223143 |goto Isle of Dorn/0 40.62,59.87
|tip He is a blue lion fish stuck on the beach begging for help.
Click Here to Proceed |confirm |next
step
collect 5 Plump Snapcrab##222906
|tip These will look like tiny critters running around on the beach nearby.
Click Here to Proceed |confirm |next
step
clicknpc Lionel###223143 |goto Isle of Dorn/0 40.62,59.87
|tip Choose "Give Lionel the Plump Snapcrabs."
Click Here to Proceed |confirm |next
step
click Magical Treasure Chest##444022
|tip It will appear next to Lionel before he swims away.
Click Here to Proceed |confirm |next
step
collect Sapphire Crab##224579
step
use Sapphire Crab##224579
learnpet(3362)
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Shadowbog Hopper",{
patch='110002',
source='Treasure',
author="support@zygorguides.com",
description="Restoring hope to those lost in the darkness comes with its just rewards. Like cute frog friends.",
keywords={"Aquatic","Keyflame","Stillstone Pond"},
pet=4472,
},[[
step
Defeat the boss at Stillstone Pond Keyflame
collect Shadowbog Hopper##222326
step
learnpet Shadowbog Hopper##4472 |goto Dornogal/0 39.78,40.40
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Skippy",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Watch Skippy swim, and then watch him run. The perfect amphibian. Sorry, frogs.",
keywords={"Aquatic"},
pet=4495,
},[[
step
talk Erani##219230
|tip Inside the building.
buy Skippy##221494 |goto Dornogal/0 58.52,64.85
step
use Skippy##221494
learnpet Skippy##4495
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Slim",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description="One kobyss's meal is another adventurer's bestie.",
keywords={"Aquatic"},
pet=4542,
},[[
step
accept Gutter Work##79722 |goto Dornogal/0 39.78,40.40
|tip You will accept this quest automatically.
step
collect 17 Mangled Kobyss Innards##222921 |goto Hallowfall/0 56.23,24.49
step
collect 20 Chunked Kobyss Innards##224102 |goto Hallowfall/0 56.23,24.49
step
collect 25 Uncertain Kobyss Innards##224103 |goto Hallowfall/0 56.23,24.49
step
collect 34 Rotting Kobyss Innards##224232 |goto Hallowfall/0 56.23,24.49
step
collect Slim##221494
step
use Slim##221494
learnpet Slim##4542
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Starkstripe Hopper",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Brightly colored means do not touch. Red is nature's warning light!",
keywords={"Aquatic"},
pet=4524,
},[[
step
talk Erani##219230
|tip Inside the building.
Ask her _"Want to trade some pet charms?"_ |gossip 106777
buy Starkstripe Hopper##221811 |goto Dornogal/0 58.52,64.85
step
use Starkstripe Hopper##221811
learnpet Starkstripe Hopper##4524
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Subterranean Dartswog",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Found predominately underground, some of them prefer the surface. But that's none of my business.",
keywords={"Aquatic"},
pet=4521,
},[[
step
clicknpc Subterranean Dartswog##222736
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Subterranean Dartswog" Battle Pet |learnpet Subterranean Dartswog##4521 |goto The Ringing Deeps/0 57.63,34.80
Find one also at [The Ringing Deeps/0 53.13,61.80]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Troglofrog",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The sound of the troglofrog echoing throughout deep caverns sounds almost like... ragtime music?",
keywords={"Aquatic"},
pet=4522,
},[[
step
clicknpc Troglofrog##222739
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Troglofrog" Battle Pet |learnpet Troglofrog##4522 |goto The Ringing Deeps/0 45.57,37.02
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Verdant Scootlefish",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Cute at this size, the humble scootlefish poses a real threat to ships when it grows larger.",
keywords={"Aquatic"},
pet=4477,
},[[
step
clicknpc Verdant Scootlefish##222344
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Verdant Scootlefish" Battle Pet |learnpet Verdant Scootlefish##4477 |goto Azj-Kahet/1 42.83,63.66
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Waddles",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="There's a wide world to explore outside of dank caves and underground grottos. Waddles will explore them with you, hand in fin.",
keywords={"Aquatic"},
pet=4497,
},[[
step
collect Waddles##221494
step
use Starkstripe Hopper##221494
Learn the "Waddles" Battle Pet |learnpet Waddles##4497
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Wriggle",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="The wily fish has never been caught at the end of an angler's hook. He was caught a completely different way.",
keywords={"Aquatic"},
pet=4496,
},[[
step
Complete a Kobyss Delve, or press _I_, select Premade Groups, then Delves, and join a group for a Kobyss Delve.
Click Here to Proceed |confirm |next
step
click Kobyss Delve's Heavy Trunk
collect Wriggle##221496
step
use Wriggle##221496
Learn the "Wriggle" Battle Pet |learnpet Wriggle##4496
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Alabaster Stonecharger",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Protorams leave behind stony dust as they frolic, battle, and rest.",
keywords={"Beast"},
pet=4540,
},[[
step
clicknpc Alabaster Stonecharger##223092
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Alabaster Stonecharger" Battle Pet |learnpet Alabaster Stonecharger##4540 |goto Isle of Dorn/0 46.99,29.54
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Arachnoid Hatchling",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Many arachnids are left to fend for themselves after hatching. It's a common topic in spider therapy.",
keywords={"Beast"},
pet=4456,
},[[
step
clicknpc Arachnoid Hatchling##222066
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Arachnoid Hatchling" Battle Pet |learnpet Arachnoid Hatchling##4456 |goto The Ringing Deeps/0 58.27,42.48
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Argos",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="The Imperial Lynx is known for being stubborn and moody, but fiercely loyal to those they form bonds with.",
keywords={"Beast"},
pet=4466,
},[[
step
collect Argos##221851
step
use Argos##221851
Learn the "Argos" Battle Pet |learnpet Argos##4466
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bean",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="The toes! The huge toe beans! The huge toe beans are not for eating!",
keywords={"Beast"},
pet=4464,
},[[
step
talk Pelefien <Clerk>##218198
buy Freshly Webbed Kebab##221850 |goto City of Threads/0 50.60,26.40
|tip Pelefien has a limited supply of these.
|tip If Pelefien doesn't have it in inventory, try other vendors nearby.
step
use Freshly Webbed Kebab##221850
Learn the "Bean" Battle Pet |learnpet Bean##4464
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bedrock Stonecharger",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Young protorams love to play and bluff charge. They also love to actually charge.",
keywords={"Beast"},
pet=4541,
},[[
step
clicknpc Bedrock Stonecharger##223090
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Bedrock Stonecharger" Battle Pet |learnpet Bedrock Stonecharger##4541 |goto Isle of Dorn/0 36.01,77.00
Find another at [Isle of Dorn/0 34.47,81.61]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bouncer",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Awww, aren't it's fuzzy little pedipalps cute?",
keywords={"Beast"},
pet=4489,
},[[
step
Complete a Nerubian Delve, or press _I_, select Premade Groups, then Delves, and join a group for a Nerubian Delve.
Click Here to Proceed |confirm |next
step
click Nerubian Delve's Heavy Trunk##0000
|tip You may need to run Nerubian Delves more than once to obtain this.
collect Bouncer##222971
step
use Bouncer##222971
Learn the "Bouncer" Battle Pet |learnpet Bouncer##4489
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Chitin Burrower",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Tough burrowing claws make it easy for arachnids to get around subterranean areas. But it's a boring life.",
keywords={"Beast"},
pet=4457,
},[[
step
clicknpc Chitin Burrower##222071
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Chitin Burrower" Battle Pet |learnpet Chitin Burrower##4457 |goto The Ringing Deeps/0 59.79,36.12
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Clay Stonecharger",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The swooping horns of protorams bear the scars of every charge.",
keywords={"Beast"},
pet=4545,
},[[
step
Learn the "Clay Stonecharger" Battle Pet |learnpet Clay Stonecharger##4545
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cobalt Ramolith",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The grand horns of these beasts spark jealousy in other horned grazing animals.",
keywords={"Beast"},
pet=4538,
},[[
step
clicknpc Cobalt Ramolith##223094
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Cobalt Ramolith" Battle Pet |learnpet Cobalt Ramolith##4538 |goto Isle of Dorn/0 56.06,16.62
Find another one at [Isle of Dorn/0 53.49,20.12].
]])
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Fringe",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Someone once mistook Fringe for an azerite node. He's too young to remember azerite, though.",
keywords={"Beast"},
pet=4492,
},[[
step
earn 250 Polished Pet Charms##163036
|tip Earn Polished Pet Charms by completing pet battle world quests in BFA, Shadowlands, and the Dragon Isles.
|tip Use the "World Quest Guides" to accomplish this by clicking Battle Pet World Quests on your map that reward Polished Pet Charms.
step
talk Clutchmother Marn'tiq <Pet Battle Master>##218207
buy Fringe##222973 |goto City of Threads/0 44.19,17.14 |or
'|learnpet Fringe##0000 |or
step
use Fringe##222973
Learn the "Fringe" Battle Pet |learnpet Fringe##4492
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Fuzzy",{
patch='110002',
source='Unknown',
author="support@zygorguides.com",
description="The next time you're sitting in the dark and feel something brush against your heel, don't worry! It's just Fuzzy.",
keywords={"Beast"},
pet=4490,
},[[
step
collect Fuzzy##222970
'|learnpet Fuzzy##4490 |or
step
use Fuzzy##222970
Learn the "Fuzzy" Battle Pet |learnpet Fuzzy##4490
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Granite Ramolith",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Earthen ranchers keep a variety of horned beasts for labor and company. None are so proud as the ramolith.",
keywords={"Beast"},
pet=4539,
},[[
step
clicknpc Granite Ramolith##223093
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Granite Ramolith" Battle Pet |learnpet Granite Ramolith##4539 |goto Isle of Dorn/0 26.33,63.73
You can find more at:
[Isle of Dorn/0 37.28,44.20]
[Isle of Dorn/0 32.03,55.99]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Green Stagshell",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Unknown",
keywords={"Beast"},
pet=4583,
},[[
step
clicknpc Green Stagshell##223863
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Green Stagshell" Battle Pet |learnpet Green Stagshell##4583 |goto Isle of Dorn/0 37.28,44.20
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Guacamole",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="This snuffling loves limes.",
keywords={"Beast"},
pet=4576,
},[[
step
Reach Renown Level 17 with The Assembly of the Deeps |complete factionrenown(2594) >= 17 |or
|tip Complete quests and world quests for The Assembly of the Deeps.
'|complete haspet(4576) |or
step
earn 6500 Resonance Crystals##3056 |or
|tip Earn Resonance Crystals by killing Rare, or Rare Elite creatures, completing quests, and opening treasures in The War Within areas.
'|complete haspet(4576) |or
step
talk Waxmonger Squick <Renown Quartermaster>##217253
buy Guacamole##221486 |goto The Ringing Deeps/0 47.30,32.93 |or
'|complete haspet(4576) |or
step
use Guacamole##221486
Learn the "Guacamole" Battle Pet |learnpet Guacamole##4576
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Illskitter",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Graduation from spiderling to fully-fledged spider monster is far off for this young arachnoid.",
keywords={"Beast"},
pet=4458,
},[[
step
collect Illskitter##221195
step
use Illskitter##221195
Learn the "Illskitter" Battle Pet |learnpet Illskitter##4458
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Jump Jump",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="I jump, Jon. It's what I do.",
keywords={"Beast"},
pet=4491,
},[[
step
earn 2250 Kej##3056
|tip Earn Kej by killing Rare, or Rare Elite creatures in The War Within areas.
step
talk Lady Vinazian##223750 <Severed Threads Quartermaster>
talk Y'tekhi##220867 <Renoun Quartermaster>
buy Jump Jump##222972 |goto Azj-Kahet/0 57.60,46.80 |or
'|learnpet Jump Jump##4491 |or
step
use Jump Jump##222972
Learn the "Jump Jump" Battle Pet |learnpet Jump Jump##4491
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Mikah",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="He doesn't want you to know this, but Mikah's favorite food is broccoli.",
keywords={"Beast"},
pet=0000,
},[[
step
"Mikah" is a Backup Pet for wild pet battles in The Ringing Deeps
|tip Click a wild battle pet to start the battle.
|tip If Mikah is a back up pet, reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
|tip Look for pet battle icons on your minimap.
Learn the "Mikah" Battle Pet
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Pinkskin Burrower",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="So wrinkly!! So scrunchy!!",
keywords={"Beast"},
pet=4571,
},[[
step
clicknpc Pinkskin Burrower##223706
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
|tip Look for pet battle icons on your minimap around Shadowvein Point.
Learn the "Pinkskin Burrower" Battle Pet |learnpet Pinkskin Burrower##4571 |goto The Ringing Deeps/0 61.43,47.88
Find more at:
[The Ringing Deeps/0 54.86,61.81]
[The Ringing Deeps/0 60.68,87.36]
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts\\Battle Pets\\Beast Pets\\Achievement Pets\\Purple Stagshell",{
patch='110002',
source='Acheivement',
author="support@zygorguides.com",
description="Unknown",
keywords={"Beast"},
pet=0000,
},[[
step
Complete the achievement "A Champion's Tour: The War Within" |complete achieved(40088)
step
collect Purple Stagshell##223802
step
use Purple Stagshell##223802
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts\\Battle Pets\\Beast Pets\\Achievement Pets\\Rak-Ush Battleshell",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description = "Raised as living tanks for Anub'azal's army, Raku-Ush's battleshells are surprisingly affectionate. Who's a good beetle?",
keywords={"Beast"},
pet=4582,
},[[
step
Reach Level 78 |ding 78 |or
'|complete haspet(4582) |or
step
Complete the _Rak-Ush Storyline_ Quests in Azj-Kahet to unlock Rak-Ush Stagshell World Quests |complete completedq(79123) |or
'|complete haspet(4582) |or
step
Wait for the World Quest "Permanent Hire" to Become Active in Azj-Kahet |complete questactive(79123) |or
'|complete haspet(4582) |or
step
Complete the World Quest "Permanent Hire"
|tip Use the World Quest Guide by clicking the World Quest on your Minimap.
collect Rak-Ush Battleshell##225935 |or
'|complete haspet(4582) |or
step
use Rak-Ush Battleshell##225935
Learn the "Rak-Ush Battleshell" Battle Pet |learnpet Rak-Ush Battleshell##4582
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Rak-Ush Threadling",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="I jump, Jon. It's what I do.",
keywords={"Beast"},
pet=4455,
},[[
step
earn 2250 Kej##3056 |or
|tip Earn Kej by killing Rare, or Rare Elite creatures in The War Within areas.
'|complete haspet(4491) |or
step
talk Ves'trak <Rak-Ush Operations>##217253
buy Baleclaw##221486 |goto Azj-Kahet/0 57.60,46.80 |or
'|complete haspet(4491) |or
step
use Baleclaw##221486
Learn the "Rak-Ush Threadling" Battle Pet |learnpet Rak-Ush Threadling##4455
]])
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Sandstone Ramolith",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="They loves sand. It's coarse, and it gets everywhere.",
keywords={"Beast"},
pet=4546,
},[[
step
talk Erani##219230
|tip Inside the building.
Ask her _"Want to trade some pet charms?"_ |gossip 106777
buy Sandstone Ramolith##222978 |goto Dornogal/0 58.52,64.85
step
use Sandstone Ramolith##222978
learnpet Sandstone Ramolith##4546
]])
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Skittish Sniffler",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Capable of sensing vibrations and tremors nearly a mile away, these young moles tend to burrow at the first sign of mortal danger.",
keywords={"Beast"},
pet=4573,
},[[
step
clicknpc Skittish Sniffler##223712
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Skittish Sniffler" Battle Pet |learnpet Skittish Sniffler##4573 |goto The Ringing Deeps/0 60.52,86.29
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Sneef",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="She's got a schnoz for sniffin'!",
keywords={"Beast"},
pet=4575,
},[[
step
Complete a Kobold delve, or press _I_, select Premade Groups, then Delves, then join and complete a Kobold Delve.
Click to proceed |confirm |next
step
click Kobold Delve's Heavy Trunk
collect Sneef##223718
|tip You may have to run the delve more than once to receive this pet drop.
step
use Sneef##223718
Learn the "Sneef" Battle Pet |learnpet Sneef##4575
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Snuffling",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Even hard sediment poses little challenge to the digging claws of these critters.",
keywords={"Beast"},
pet=4574,
},[[
step
clicknpc Snuffling##223712
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Snuffling" Battle Pet |learnpet Snuffling##4574
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Violet Sporbit",{
patch='110002',
source='Treasure',
author="support@zygorguides.com",
description="Unknown",
keywords={"Beast"},
pet=4506,
},[[
step
Complete a Fungarian delve, or press _I_, select Premade Groups, then Delves, then join and complete a Fungarian Delve.
Click to proceed |confirm |next
step
collect Violet Sporbit##222590 |or
'|complete haspet(4506) |or
step
use Violet Sporbit##222590
Learn the "Violet Sporbit" Battle Pet |learnpet Violet Sporbit##4506
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Tan Stagshell",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="None",
keywords={"Beast"},
pet=4584,
},[[
step
clicknpc Tan Stagshell##223712
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Tan Stagshell" Battle Pet |learnpet Tan Stagshell##4584
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts\\Battle Pets\\Beast Pets\\Achievement Pets\\Thunder",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description = "Someday, his heavy footfalls and ferocious roar will match his name. Until then, Thunder remains a bolt of cuteness and loyalty.",
keywords={"Beast"},
pet=4462,
},[[
step
Reach Level 80 |ding 80
step
talk Attica Whiskervale##212419
accept Tale of Tails##82007 |goto Hallowfall/0 64.40,18.80 |or
'|complete haspet(4462)|or
step
clicknpc Beans##222372
Locate Beans |q 82007/2 |goto Hallowfall/0 64.00,19.80 |or
He may also be at [Hallowfall/0 63.60,19.40]
'|complete haspet(4462)|or
step
clicknpc Thunder##222375
Locate Thunder |q 82007/3 |goto Hallowfall/0 62.00,20.80 |or
'|complete haspet(4462)|or
step
clicknpc Beef##222373
Locate Beans |q 82007/1 |goto Hallowfall/0 66.20,15.60 |or
'|complete haspet(4462)|or
step
clicknpc Cap'n Elaena##222374
Locate Cap'n Elaena |q 82007/4 |goto Hallowfall/0 66.80,21.00 |or
'|complete haspet(4462)|or
step
talk Attica Whiskervale##212419
turnin Tale of Tails##82007 |goto Hallowfall/0 64.40,18.80 |or
'|complete haspet(4462)|or
step
collect Thunder##220782 |or
'|complete haspet(4462) |or
step
use Thunder##220782
Learn the "Thunder" Battle Pet |learnpet Thunder##4462
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Tiberius",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="The Imperial Lynx hails from the shore of the far-flung Arathi Empire, where they serve as fierce and loyal companions and mounts for citizens.",
keywords={"Beast"},
pet=4463,
},[[
step
Reach Renown Rank 15 with Hallowfall Arathi |complete factionrenown(2570) >= 15
|tip Gain renown by completing quests and world quests for this faction.
|tip Use the "Hallowfall Arathi" Reputation Guide to accomplish this.
Click Here to Load the "Hallowfall Arathi" Reputation Guide |confirm |loadguide "Reputation Guides\\The War Within Reputations\\Hallowfall Arathi\\Hallowfall Arathi"
step
earn 6500 Resonance Crystals##3056
|tip Earn Resonance Crystals by killing Rare, or Rare Elite creatures, completing quests, and opening treasures in The War Within areas.
step
talk Auralia Steelstrike <Renown Quartermaster>##217253
buy Tiberius##221848 |goto Hallowfall/0 41.27,53.05 |or
'|learnpet Tiberius##4463 |or
step
use Tiberius##221848
Learn the "Tiberius" Battle Pet |learnpet Tiberius##4463
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Vanilla",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description="This treasured lynx is a firm supporter of no changes.",
keywords={"Beast"},
pet=4465,
},[[
step
Reach Level 80 |ding 80
step
Complete the Hallowfall Campaign |complete completedq(78630) |or
'|complete haspet(4465) |or
step
talk Aliya Hillhelm##206528
accept Seeds of Evil##79108 |goto Hallowfall/0 61.18,30.52 |or
'|complete haspet(4465) |or
step
kill Invasive Shadowblossom##214923
collect 16 Corrupted Shadowleaf Seed##212153 |q 79108/1 |goto Hallowfall/0 60.70,30.20 |or
'|complete haspet(4465) |or
step
talk Aliya Hillhelm##206528
turnin Seeds of Evil##79108 |goto Hallowfall/0 61.18,30.52
accept Follow Miral##79109 |goto Hallowfall/0 61.18,30.52 |or
'|complete haspet(4465) |or
step
Click the Hoe |q 79109/1 |goto Hallowfall/0 60.76,25.15 |or
'|complete haspet(4465) |or
step
Click the Bag |q 79109/2 |goto Hallowfall/0 60.12,24.28 |or
'|complete haspet(4465) |or
step
Click the Lamp |q 79109/3 |goto Hallowfall/0 60.30,22.81 |or
'|complete haspet(4465) |or
step
talk Mirel Murder-Mittens##215041
turnin Follow Miral##79109 |goto Hallowfall/0 60.29,21.13
accept Save Tomothy##79110 |goto Hallowfall/0 60.29,21.13 |or
'|complete haspet(4465) |or
step
kill The Grasping Darkness##215064
|tip Inside the building.
The Grasping Darkness slain |q 79110/1 |goto Hallowfall/0 60.20,20.67 |or
'|complete haspet(4465) |or
step
talk Mirel Murder-Mittens##215041
turnin Save Tomothy##79110 |n
collect Vanilla##222594 |goto Hallowfall/0 60.29,21.13
step
use Vanilla##222594
|learnpet Vanilla##4465
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Arathi Chicken",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="These silkie chickens were taken aboard airships by those departing the Arathi Empire in pursuit of their emperor's prophetic vision.",
keywords={"Critter"},
pet=0000,
},[[
step
clicknpc Arathi Chicken##222195
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Arathi Chicken" Battle Pet |learnpet Arathi Chicken##0000 |goto Hallowfall/0 63.15,28.12
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Leafbug",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="When you tell a bad joke, he'll be there to let you know.",
keywords={"Critter"},
pet=4586,
},[[
step
talk Erani##219230
|tip Inside the building.
Ask her _"Want to trade some pet charms?"_ |gossip 106777
buy Brown Leafbug##224101 |goto Dornogal/0 58.52,64.85
step
use Brown Leafbug##224101
Learn the "Brown Leafbug" Battle Pet |learnpet Brown Leafbug##4586
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Bubs",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Young protorams love to play and bluff charge. They also love to actually charge.",
keywords={"Critter"},
pet=4541,
},[[
step
clicknpc Bubs##223090
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Bubs" Battle Pet |learnpet Bubs##4541
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Cobalt Mosswool",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Mosswools appreciate a seasonal shear.",
keywords={"Critter"},
pet=0000,
},[[
step
clicknpc Cobalt Mosswool##222777
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Cobalt Mosswool" Battle Pet |learnpet Cobalt Mosswool##0000 |goto Isle of Dorn/0 56.06,16.62
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Common Ploughworm",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Used both in battle and as pack animals when they're larger, at this size they're only a danger to your ankles.",
keywords={"Critter"},
pet=4499,
},[[
step
clicknpc Common Ploughworm##222584
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Common Ploughworm" Battle Pet |learnpet Common Ploughworm##4499 |goto The Ringing Deeps/0 65.25,79.45
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Ebon Ploughworm",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Hard to spot in the dark, these worms have taught many adventureres a lesson, when sticking their fingers where they don't belong.",
keywords={"Critter"},
pet=4498,
},[[
step
clicknpc Ebon Ploughworm##222582
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Ebon Ploughworm" Battle Pet |learnpet Ebon Ploughworm##4498 |goto The Ringing Deeps/0 43.62,27.43
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fragrant Stonelamb",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Protosheep spend winters bereft their flowers. When the seasons turn, the plains are filled with a variety of earthy, sweet scents.",
keywords={"Critter"},
pet=4525,
},[[
step
clicknpc Fragrant Stonelamb##222774
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Fragrant Stonelamb" Battle Pet |learnpet Fragrant Stonelamb##4525 |goto Isle of Dorn/0 31.11,58.19
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Frenzied Bloodtick",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Most people don't find congealed blood particularly appetizing. Bloodticks, though...",
keywords={"Critter"},
pet=0000,
},[[
step
talk Clutchmother Marn'tiq <Pet Battle Master>##218207
collect Frenzied Bloodtick##222593 |goto City of Threads/0 50.60,48.10 |or
'|learnpet Frenzied Bloodtick##0000 |or
step
use Frenzied Bloodtick##222593
Learn the "Frenzied Bloodtick" Battle Pet |learnpet Frenzied Bloodtick##0000
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Greenlands Chicken",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Free-range chickens are difficult to take care of in Hallowfall, what with all the shadow monsters and fish people.",
keywords={"Critter"},
pet=4526,
},[[
step
clicknpc Greenlands Chicken##222194
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Greenlands Chicken" Battle Pet |learnpet Greenlands Chicken##4526
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Kaheti Bull Worm",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="This one may lack the size and color of it's famed cousin, but it can still pack a punch.",
keywords={"Critter"},
pet=4502,
},[[
step
buy Kaheti Bull Worm##222585 |or
'|learnpet Kaheti Bull Worm##0000
step
use Kaheti Bull Worm##222585
Learn the "Kaheti Bull Worm" Battle Pet |learnpet Kaheti Bull Worm##0000
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Lil' Bonechewer",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Lil' Bonechewer loves you, even if you were a worm. Especially if you were a worm.",
keywords={"Critter"},
pet=0000,
},[[
step
Ding Level 80 |ding 80 |or
'|learnpet Lil' Bonechewer##0000 |or
step
Complete the "Worm Theory" Achievement |achieve 40869 |or
|tip This achievement requires you to complete 3 quests.
|tip Use the "Worm Theory" Achievement Guide to accomplish this.
Click Here to Open the "Worm Theory" Achievement Guide |confirm
'|learnpet Lil' Bonechewer##0000 |or
step
use Lil' Bonechewer##225934
Learn the "Lil' Bonechewer" Battle Pet |learnpet Lil' Bonechewer##0000
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Loamy",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="The softest and fluffiest protosheep made of the softest and fluffiest soil.",
keywords={"Critter"},
pet=4530,
},[[
step
Reach Renown Level 13 with The Council of Dornogal |complete factionrenown(2590) >= 13 |or
|tip Use the "The Council of Dornogal" Reputation Guide to accomplish this.
|tip
Click Here to Open the "The Council of Dornogal" Reputation Guide |confirm |loadguide "Reputation Guides\\The War Within Reputations\\Council of Dornogal\\Council of Dornogal"
'|learnpet Loamy##4530 |or
step
earn 6500 Resonance Crystals##2815
|tip Earn Resonance Crystals by killing Rare, or Rare Elite creatures, completing quests, and opening treasures in The War Within areas.
step
talk Auditor Balwurz <Keeper of Renown>##223728
|tip Upstairs inside the building.
buy Loamy##222965 |goto Dornogal/0 39.20,24.20 |or
'|learnpet Loamy##4530 |or
step
use Loamy##222779
learnpet Loamy##4530
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mossy Snail",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Imagine being so slow moving that moss grows on your back. Couldn't be me..",
keywords={"Critter"},
pet=4485,
},[[
step
clicknpc Mossy Snail##222499
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Mossy Snail" Battle Pet |learnpet Mossy Snail##4485 |goto Dornogal/0 53.11,23.94
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Lil' Moss Rosy",{
patch='110002',
source='Treasure',
author="support@zygorguides.com",
description="Unknown",
keywords={"Critter"},
pet=4527,
},[[
step
clicknpc Lost Mosswool##222963 |goto Isle of Dorn/0 59.00,27.00
|tip Follow the Lost Mosswool.
Click Here to Proceed |confirm |next
step
clicknpc Lost Mosswool##222965 |goto Isle of Dorn/0 59.60,28.40
|tip Follow the Lost Mosswool.
Click Here to Proceed |confirm |next
step
click Mosswool Flower##443638
collect Lil' Moss Rosy##222776 |goto Isle of Dorn/0 59.80,28.70
step
use Lil' Moss Rosy##222778
Learn the "Lil' Moss Rosy" Battle Pet |learnpet Lil' Moss Rosy##4527 |goto The Ringing Deeps/0 36.93,42.64
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Sandstone Mosswool",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="These lambs savor a journey to the beaches of Khaz Algar to rest in warm sands.",
keywords={"Critter"},
pet=4526,
},[[
step
clicknpc Sandstone Mosswool##222775
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
|tip This pet can also be captured as a backup pet on the Isle of Dorn.
Learn the "Sandstone Mosswool" Battle Pet |learnpet Sandstone Mosswool##4526 |goto Dornogal/0 53.11,23.94
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Shale Mosswool",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Expert Earthen florists are capable of arranging beautiful floral patterns upon the backs of protosheep.",
keywords={"Critter"},
pet=4529,
},[[
step
clicknpc Shale Mosswool##222778
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Shale Mosswool" Battle Pet |learnpet Shale Mosswool##4529 |goto Isle of Dorn/0 36.93,42.64
Find another one at [Isle of Dorn/0 36.93,42.63]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Vibrant Glowfly",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Though their light is sometimes mistaken for the glow of toxic substances or dark magic, nerubians and Arathi alike find these insects hauntingly beautiful.",
keywords={"Critter"},
pet=4516,
},[[
step
clicknpc Vibrant Glowfly##222615
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Vibrant Glowfly" Battle Pet |learnpet Vibrant Glowfly##4516
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Vile Bloodtick",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Sweet is the black blood. It tastes of wars past, and wars to come.",
keywords={"Critter"},
pet=4483,
},[[
step
clicknpc Vile Bloodtick##222421
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Vile Bloodtick" Battle Pet |learnpet Vile Bloodtick##4483
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Winged Arachnoid",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="It's a bird! It's a gyrocopter! No wait, it's something way worse. Run.",
keywords={"Critter"},
pet=4510,
},[[
step
clicknpc Winged Arachnoid##222608
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Winged Arachnoid" Battle Pet |learnpet Winged Arachnoid##4510 |goto Hallowfall/0 65.86,39.39
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Blightbud",{
patch='110002',
source='Puzzle',
author="support@zygorguides.com",
description="Please keep your blightbud on a leash at all times! They are notorious for the havoc they can wreak on unprotected gardens.",
keywords={"Elemental"},
pet=4536,
},[[
step
click Blocked Intake##446100 |goto The Ringing Deeps/0 48.20,48.90
|tip Solve the puzzle to dislodge the treasure.
click Dislodged Blockage##446151
collect Blightbud##222879 |or
'|complete haspet(4536) |or
step
use Blightbud##222879
Learn the "Blightbud" Battle Pet |learnpet Blightbud##4536
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Burntram",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Look out! He's comin' right for us! Gradually!",
keywords={"Elemental"},
pet=4519,
},[[
step
collect Burntram##221764 |or
'|complete haspet(4519) |or
step
use Burntram##221764
Learn the "Burntram" Battle Pet |learnpet Burntram##4519 |goto The Ringing Deeps/0 36.93,42.64
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Cinderhoney Emberstinger",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="THE BEES ARE ON FIRE NOW?",
keywords={"Elemental"},
pet=4577,
},[[
step
clicknpc Cinderhoney Emberstinger##222713
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Cinderhoney Emberstinger" Battle Pet |learnpet Cinderhoney Emberstinger##4577
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Cinderwold Sizzlestinger",{
patch='110002',
source='Quest',
author="support@zygorguides.com",
description="Now that is one spicy bee!",
keywords={"Elemental"},
pet=4570,
},[[
step
Reach Level 73 |ding 73
step
Complete the Quest "Home Is Where the Candle Is"
clicknpc Cinderwold Sizzlestinger##222713
|tip This is the final quest of a side quest chain in The Ringing Deeps.
|tip Use the "The Ringing Deeps (Full Zone)" Leveling Guide to accomplish this.
Click Here to Load "The Ringing Deeps (Full Zone)" Leveling Guide |confirm |loadguide "Leveling Guides\\The War Within (70-80)\\Full Zones\\The Ringing Deeps (Full Zone)"
step
collect Cinderwold Sizzlestinger##223625 |goto The Ringing Deeps/0 47.00,34.00 |q 79683
step
use Cinderwold Sizzlestinger##223625
Learn the "Cinderwold Sizzlestinger" Battle Pet |learnpet Cinderwold Sizzlestinger##4570
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ghostcap Menace",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The alluring twin mushroom cap colors of these fungal creatures attracts sentient and beastial victims alike.",
keywords={"Elemental"},
pet=4535,
},[[
step
clicknpc Ghostcap Menace##222713
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Ghostcap Menace" Battle Pet |learnpet Ghostcap Menace##4535 |goto Isle of Dorn/0 53.17,64.97
Find more at [The Ringing Deeps/0 45.21,33.00]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Magmashell Crawler",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Not to be kept indoors if you live in a wooden house.",
keywords={"Elemental"},
pet=4518,
},[[
step
clicknpc Magmashell Crawler##222713
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Magmashell Crawler" Battle Pet |learnpet Magmashell Crawler##4518
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Meek Bloodlasher",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Fungal lashers are typically violent and carnivorous. This diminuative variety is better suited to shyly flail its limbs against fellow small fry.",
keywords={"Elemental"},
pet=4533,
},[[
step
clicknpc Meek Bloodlasher##222875
|tip You can usually find these in The Ringing Deeps wherever there are mushroom NPCs.
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Meek Bloodlasher" Battle Pet |learnpet Meek Bloodlasher##4533 |goto The Ringing Deeps/0 43.45,33.64
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Nightfarm Growthling",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="These highly destructive pests are known to destroy crops in Hallowfall.",
keywords={"Elemental"},
pet=4534,
},[[
step
collect Nightfarm Growthling##221546 |or
'|complete haspet(4534) |or
step
use Nightfarm Growthling##221546
Learn the "Nightfarm Growthling" Battle Pet |learnpet Nightfarm Growthling##4534
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ridge",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Unknown",
keywords={"Elemental"},
pet=4534,
},[[
step
collect Ridge##221546 |or
'|complete haspet(4534) |or
step
use Ridge##221546
Learn the "Ridge" Battle Pet |learnpet Ridge##4534 |goto The Ringing Deeps/0 36.93,42.64
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Waxwick",{
patch='110002',
source='Achievement',
author="support@zygorguides.com",
description="In a miracle of dreams and wishes, Waxwick awoke and climbed off a kobold's head to pursue her own path.",
keywords={"Elemental"},
pet=4517,
},[[
step
Complete the "Khaz Algar Safari" Achievement |achieve 40194 |or
|tip This achievement requires you to complete 3 quests.
|tip Use the "Khaz Algar Safari" Achievement Guide to accomplish this.
Click Here to Open the "Khaz Algar Safari" Achievement Guide |confirm
'|complete haspet(4517) |or
step
use Waxwick##221821
Learn the "Waxwick" Battle Pet |learnpet Waxwick##4517
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Azure Flickerfly",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The flickering of these lightbugs is said to bring an unnatural and eerie calm to travelers and predators alike.",
keywords={"Flying"},
pet=4515,
},[[
step
clicknpc Azure Flickerfly##222614
|tip These can be found around light sources around the Ringing Deeps in most areas.
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Azure Flickerfly" Battle Pet |learnpet Azure Flickerfly##4515 |goto The Ringing Deeps/0 45.02,44.18
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Bop",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Woah there pardner. Were really about to buzz by without saying howdy?",
keywords={"Elemental"},
pet=4469,
},[[
step
kill Goldie Baronbottom##218523
|tip She can be found in Cinderbrew Meadery Dungeon.
collect Bop##221546 |or
'|complete haspet(4469) |or
step
use Bop##221546
Learn the "Bop" Battle Pet |learnpet Bop##4469
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Fallowspark Glowfly",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The green glow of this firefly is seen as an ill-omen for those who travel in darkness.",
keywords={"Flying"},
pet=4514,
},[[
step
clicknpc Fallowspark Glowfly##222613
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Fallowspark Glowfly" Battle Pet |learnpet Fallowspark Glowfly##4514 |goto The Ringing Deeps/0 43.06,27.95
You can also find one at [Hallowfall/0 70.46,46.08]
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Hallowed Glowfly",{
patch='110002',
source='Puzzle',
author="support@zygorguides.com",
description="This hallowed firefly's glow scours the darkness, a welcome omen for the Arathi living in Hallowfall.",
keywords={"Flying"},
pet=4467,
},[[
step
earn 2 Radiant Remnant##206350
step
Restore the Lesser Stillstone Pond Keyflame in Hallowfall. |goto Hallowfall/0 65.82,24.43
Click Here to Continue |conbfirm |next
step
talk Taerry Bilgestone##215956
|tip This vendor is available when the Lesser Sillstone Pond Keyflame is lit.
buy Sparkbug Jar##218107 |goto Hallowfall/0 65.80,24.40
step
click Hallowfall Sparkfly
|tip Walk South along the Water's Edge until you find a Hallowfall Sparkfly.
collect Hallowfall Glowfly##222613
step
use Hallowfall Glowfly##222613
Learn the "Hallowed Glowfly" Battle Pet |learnpet Hallowed Glowfly##4467 |goto Hallowfall/0 43.06,27.95
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Pillarnest Bonedrinker",{
patch='110002',
source='Puzzle',
author="support@zygorguides.com",
description="Is it possible to drink bones? Not without a positive mental attitude it's not!",
keywords={"Flying"},
pet=4513,
},[[
step
click Nest Egg##446423
|tip On a web near the ceiling.
collect Bonedrinker##221760 |goto Azj-Kahet/0 50.60,48.10
step
use Bonedrinker##221760
Learn the "Pillarnest Bonedrinker" Battle Pet |learnpet Pillarnest Bonedrinker##4513
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Sceaduthax",{
patch='110002',
source='Unknown',
author="support@zygorguides.com",
description="This dark-shelled monster thrives in shadows. It's where he does all his best thinking.",
keywords={"Flying"},
pet=4512,
},[[
step
collect Sceaduthax##221759 |goto Azj-Kahet/0 50.60,48.10
step
use Sceaduthax##221759
Learn the "Sceaduthax" Battle Pet |learnpet Sceaduthax##4512
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Venomwing",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="It's not the most original anti-hero name. But it promises to be a compelling crossover.",
keywords={"Flying"},
pet=4511,
},[[
step
talk Erani##219230
|tip Inside the building.
Ask her _"Want to trade some pet charms?"_ |gossip 106777
buy Venomwing##221761 |goto Dornogal/0 58.52,64.85
step
use Venomwing##221761
learnpet Venomwing##4511
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Vibrant Glowfly",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="Though their light is sometimes mistaken for the glow of toxic substances or dark magic, nerubians and Arathi alike find these insects hauntingly beautiful.",
keywords={"Critter"},
pet=4516,
},[[
step
clicknpc Vibrant Glowfly##222615
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Vibrant Glowfly" Battle Pet |learnpet Vibrant Glowfly##4516 |goto The Ringing Deeps/0 47.74,33.96
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Chester",{
patch='110002',
source='Drop',
author="support@zygorguides.com",
description="Part lean, mean candle-throwing machine. Part adventurer wannabe. All kobold. Alwaise raring to test his mettle against new opponents.",
keywords={"Humanoid"},
pet=4537,
},[[
step
Complete "A Delver's Bounty" Achievement |achieve 40817 |or
|tip This achievement requires you to find and open 10 Hidden Troves using Delver's Bounties.
step
collect Chester##221820 |goto Azj-Kahet/0 50.60,48.10 |or
'|complete haspet(4537) |or
step
use Chester##221820
learnpet Chester##4537
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Caustic Oozeling",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Known to dissolve most materials, use extreme caution when approaching this caustic ooze!",
keywords={"Magic"},
pet=4478,
},[[
step
talk Vendor##
buy Caustic Oozeling##4478
collect Caustic Oozeling
step
use Caustic Oozeling
learnpet Caustic Oozeling##4478
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Sir Shady Mrgglton Junior",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="The shadowy creature has been following Sir Finley Mrgglton around ever since he happened upon it during one of his expeditions. Having grown quite fond of the tenebrous friend, Sir Finley won't part with it easily.",
keywords={"Magic"},
pet=4543,
},[[
step
earn 100000 Undercoin##2803
|tip
step
talk Sir Finley Mrgglton <Delve Treasures>##208070
buy Sir Shady Mrgglton Junior##222974 |goto Dornogal/0 50.60,48.10
step
use Sir Shady Mrgglton Junior##222974
learnpet Sir Shady Mrgglton Junior##4543
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Remembered Construct",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Made from the bits and pieces of vanquished abominations, light magic, and just a pinch of nostalgia.",
keywords={"Magic"},
pet=4451,
},[[
step
talk Remembrancer Amuul <Residual Memories Vendor>##223710
buy Remembered Construct##218245
step
use Remembered Construct##218245
learnpet Remembered Construct##4451
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Remembered Riverpaw",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Once tenacious and terrible, the riverpaw slaughtered weaker enemies without hesitation.",
keywords={"Magic"},
pet=4450,
},[[
step
talk Remembrancer Amuul <Residual Memories Vendor>##223710
buy Remembered Riverpaw##218086
step
use Remembered Riverpaw##218086
learnpet Remembered Riverpaw##4450
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Remembered Spawn",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="The faded memory of an Onyxian whelpling, this young dragon has decided that it wants to follow in its own footsteps.",
keywords={"Magic"},
pet=4452,
},[[
step
talk Remembrancer Amuul <Residual Memories Vendor>##223710
buy Remembered Spawn##218246
step
use Remembered Spawn##218246
learnpet Remembered Spawn##4452
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Shadowy Oozeling",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="The perfect pet if you love stepping on something wet in the middle of the night.",
keywords={"Magic"},
pet=4480,
},[[
step
clicknpc Shadowy Oozeling##222351
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
learnpet Shadowy Oozeling##4480 |goto Azj-Kahet/1 63.85,87.34
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Umbral Amalgam",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="These swarms of void energy cannot persist in Beledar's light.",
keywords={"Magic"},
pet=4544,
},[[
step
clicknpc Umbral Amalgam##223136
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
learnpet Umbral Amalgam##4544
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Voidling Ooze",{
patch='110002',
source='PetBattle',
author="support@zygorguides.com",
description="If you hold this up to your ear, you can hear whispers of the Old Gods. Just like a seashell!",
keywords={"Magic"},
pet=4481,
},[[
step
clicknpc Voidling Ooze##223136
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
learnpet Voidling Ooze##4481
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Writhing Transmutagen",{
patch='110002',
source='Professions',
author="support@zygorguides.com",
description="The early worms get the bird.",
keywords={"Magic","Crafted","Alchemy","Transmutation"},
pet=4482,
},[[
step
collect Writhing Transmutagen##223136
|tip This can be crafted with Kaz Algar Thaumaturgy Alchemy.
|tip You can also purchase it from the auction house.
learnpet Writhing Transmutagen##4482
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Anub'Rekyute",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="He hears little hearts melting. Faster now!",
keywords={"Undead"},
pet=4474,
},[[
step
collect Anub'Rekyute##222969 |goto Azj-Kahet/0 50.60,48.10
step
use Anub'Rekyute##222969
learnpet Anub'Rekyute##4474
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Itchbite",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="A bug? Wait a minute, no, it's a small friendly spider!",
keywords={"Undead"},
pet=4476,
},[[
step
earn 2250 Kej##3056
|tip Earn Kej by killing Rare, or Rare Elite creatures in The War Within areas.
step
talk Clutchmother Marn'tiq <Pet Battle Master>##218207
collect Itchbite##222968 |goto City of Threads/0 50.60,48.10
step
use Itchbite##222968
learnpet Itchbite##4476
]])
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Spinner",{
patch='110002',
source='Treasure',
author="support@zygorguides.com",
description="She'll try spinning, that's a good trick.",
keywords={"Undead"},
pet=4473,
},[[
step
click Trapped Trove##446421
|tip In The Transformatory area, inside a building that is webbed to the ceiling.
|tip Avoid the webs and click the treasure.
collect Spinner##222966 |goto Azj-Kahet/0 67.38,74.43
step
use Spinner##222966
learnpet Spinner##4473
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Webbers",{
patch='110002',
source='Vendor',
author="support@zygorguides.com",
description="Web ball! Stone of reality! Web ball! Stone of reality!",
keywords={"Undead"},
pet=4475,
},[[
step
collect Webbers##222967
step
use Webbers##222967
learnpet Webbers##4475
]])
ZGV.BETAEND()
