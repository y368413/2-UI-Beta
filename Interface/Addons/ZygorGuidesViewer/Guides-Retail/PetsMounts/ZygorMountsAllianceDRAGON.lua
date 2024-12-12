local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("PetsMountsADRAGON") then return end
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
Collect the "White War Wolf" Mount |learnmount White War Wolf##414316
|tip To learn this mount, you need to have a Horde player gift it to you.
|tip Find a Horde player with a "Gift of the White War Wolf" item to group with.
|tip While in the same group, have them use it to gift the mount to you.
|tip This mount drops from Time Rift events.
]])
