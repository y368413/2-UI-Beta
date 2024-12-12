local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("AchievementsCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Achievement Guides\The War Within Achievements\Hallowfall\Exploration\\The Missing Lynx",{
author="support@zygorguides.com",
description="Pet the ferocious warcats around Hallowfall.",
achieveid={40625},
patch='110000',
startlevel=70,
keywords={"The War Within", "Exploration"},
},[[
step
clicknpc Evan##227336 |goto Hallowfall/0 42.69,53.84
|tip Inside the building.
Click Here to Continue |confirm |next |or
'achieve 40625/2 |or
step
clicknpc Emery##227335 |goto Hallowfall/0 42.73,53.84
|tip Inside the building.
Click Here to Continue |confirm |next |or
'achieve 40625/3 |or
step
clicknpc Jinx##227411 |goto Hallowfall/0 42.30,53.81
|tip He walks around inside the building.
Click Here to Continue |confirm |next |or
'achieve 40625/4 |or
step
clicknpc Gobbo##227442 |goto Hallowfall/0 42.14,53.71
|tip On the bed, inside the house.
Click Here to Continue |confirm |next |or
'achieve 40625/14 |or
step
clicknpc Moog##225421 |goto Hallowfall/0 69.27,43.72
|tip Inside the building.
Click Here to Continue |confirm |next |or
'achieve 40625/5 |or
step
clicknpc Iggy##225420 |goto Hallowfall/0 69.29,43.68
|tip Inside the building.
Click Here to Continue |confirm |next |or
'achieve 40625/6 |or
step
clicknpc Fuzzy##219412 |goto Hallowfall/0 64.44,18.57
Click Here to Continue |confirm |next |or
'achieve 40625/11 |or
step
clicknpc Furball##218887 |goto Hallowfall/0 64.44,18.57
|tip Near Fuzzy.
Click Here to Continue |confirm |next |or
'achieve 40625/12 |or
step
clicknpc Dander##221106 |goto Hallowfall/0 61.91,20.80
Click Here to Continue |confirm |next |or
'achieve 40625/13 |or
step
click Lesser Keyflame##00000 |goto Hallowfall/0 63.30,29.40
|tip If it's already lit, you should find Nightclaw nearby.
Click Here to Continue |confirm |next |or
'achieve 40625/7 |or
step
clicknpc Nightclaw##216549 |goto Hallowfall/0 42.14,53.71
|tip Use the /pet emote.
Click Here to Continue |confirm |next |or
'achieve 40625/7 |or
step
click Light's Blooming Keyflame##00000 |goto Hallowfall/0 63.50,28.50
|tip If it's already lit, you should fine Puurlocl and Shadowpouncer nearby.
Click Here to Continue |confirm |next |or
'achieve 40625/9 |or
step
clicknpc Puurlock##215606 |goto Hallowfall/0 63.79,29.32
|tip Next to a wagon when the rare isn't at this location.
Click Here to Continue |confirm |next |or
'achieve 40625/9 |or
step
clicknpc Shadowpouncer##215590 |goto Hallowfall/0 63.27,28.07
|tip In front of a tower, next to a lady NPC, when the rare isn't at this location.
Click Here to Continue |confirm |next |or
'achieve 40625/8 |or
step
clicknpc Miral Murder-Mittens##215041 |goto Hallowfall/0 61.20,30.51
Click Here to Continue |confirm |next |or
'achieve 40625/10 |or
step
clicknpc Magpie##220720 |goto Hallowfall/0 60.42,60.22
|tip Use the /pet emote.
Click Here to Continue |confirm |next |or
'achieve 40625/1 |or
]])
