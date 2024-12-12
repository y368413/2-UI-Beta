local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("PetsMountsHDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\White War Wolf",{
author="support@zygorguides.com",
description="Can a wolf's hunger ever be satiated? These lupine brutes seek and devour the enemies of the Horde.",
mounts={414316},
mounttype='Ground',
startlevel=70,
keywords={"Dragonflight"},
patch='100105',
},[[
step
Earn #3000# Paracausal Flakes |earn 3000 Paracausal Flakes##2594 |or
|tip Earn these by completing time rifts.
|tip Use the "Time Rifts" guide to accomplish this.
Click Here to Load the "Time Rifts" Guide |confirm |loadguide "Daily Guides\\Dragonflight (10-70)\\Time Rifts" |or
step
talk Warden Krizzik##208346
buy 1 Horn of the White War Wolf##206673 |goto Thaldraszus/0 51.05,56.68 |or
'|learnmount White War Wolf##414316 |or
step
use the Horn of the White War Wolf##206673 |only Horde
Collect the "White War Wolf" Mount |learnmount White War Wolf##414316
]])
