local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("TitlesASHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Title Guides\\Shadowlands Titles\\General\\of Lordaeron",{
author="support@zygorguides.com",
description="\nThis title is earned by completing the Lordaeron storyline introduced in patch 9.2.5.",
patch='90205',
},[[
leechsteps "Achievement Guides\\Quest Achievements\\Shadowlands\\Return to Lordaeron" 1-43
step
_Congratulations!_
You Earned the "of Lordaeron" Title.
]])
