local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("LevelingASHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Missing Merchandise",{
author="support@zygorguides.com",
description="This guide will walk you through completing the new small quest chain in Stormwind City.",
keywords={"9.2.5"},
patch='90205',
condition_end=function() return completedq(66420) end,
startlevel=1,
},[[
step
talk Onnesa##188342
accept Missing Merchandise##66390 |goto Stormwind City/0 51.53,70.40
step
use the Briny Seawater##191854
|tip Use it on Milbert.
Deter the Thief |q 66390/1 |goto 28.60,38.17
step
clicknpc Seabraid Merchandise##188392
Collect the Shipment |q 66390/2 |goto 28.61,38.11
step
talk Onnesa##188342
turnin Missing Merchandise##66390 |goto 51.53,70.40
accept Happy Hour##66420 |goto 51.53,70.40
step
use Bottle of Briny Seawater##191865
|tip Use it on the Worker.
Splash the Worker in the Trade District |q 66420/1 |goto 65.39,68.22
step
use Bottle of Briny Seawater##191865
|tip Use it on the Worker.
Splash the Worker in Old Town |q 66420/3 |goto 74.05,63.59
step
Enter the building |goto 64.25,32.62 < 7 |walk
use Bottle of Briny Seawater##191865
|tip Use it on the Worker inside the building.
Splash the Worker in the Dwarven District |q 66420/2 |goto 64.81,33.29
step
talk Onnesa##188342
turnin Happy Hour##66420 |goto 51.53,70.40
]])
