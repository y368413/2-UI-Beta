local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("PetsMountsATWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Skyflayer",{
author="support@zygorguides.com",
description="This creature hungers for battle with the contemptible Horde.",
mounts={449325},
mounttype='Flying',
startlevel=80,
keywords={"TWW","The War Within","PVP","Achievement"},
patch='110002',
},[[
step
achieve 40396
|tip Win Rated PvP matches during The War Within Season 1 while at 1000 rating or higher.
collect Vicious Skyflayer##223511 |or
'|complete hasmount(449325) |or
step
use Vicious Skyflayer##223511
learnmount Vicious Skyflayer##449325
]])
