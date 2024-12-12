local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("PetsMountsHTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Skyflayer",{
author="support@zygorguides.com",
description="This creature hungers for battle with the contemptible Alliance.",
mounts={447405},
mounttype='Flying',
startlevel=80,
keywords={"TWW","The War Within","PVP","Achievement"},
patch='110002',
},[[
step
achieve 40396
|tip Win Rated PvP matches during The War Within Season 1 while at 1000 rating or higher.
collect Vicious Skyflayer##221813 |or
'|complete hasmount(447405) |or
step
use Vicious Skyflayer##221813
learnmount Vicious Skyflayer##447405
]])
