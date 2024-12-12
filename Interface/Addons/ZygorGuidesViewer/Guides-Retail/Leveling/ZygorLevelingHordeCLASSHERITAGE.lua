local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHCLASSHERITAGE") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Blood Elf Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Blood Elf Heritage Armor.",
patch='80100',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Blood Elf Character |complete BloodElf and level >= 50
|tip You must complete this on a 50+ Blood Elf character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Ambassador Dawnsworn##146939
accept The Pride of the Sin'dorei##53791 |goto Orgrimmar/1 39.13,79.01
step
talk Lor'themar Theron##16802
|tip Inside the building.
turnin The Pride of the Sin'dorei##53791 |goto Silvermoon City/0 53.81,20.24
accept Walk Among Ghosts##53734 |goto Silvermoon City/0 53.81,20.24
step
Leave the building |goto 57.54,24.59 < 15 |walk
Follow the path |goto 72.82,44.08 < 20 |only if walking
Follow the path |goto 75.49,58.69 < 15 |only if walking
Continue following the path |goto 72.14,85.53 < 20 |only if walking
talk Lor'themar Theron##145015
turnin Walk Among Ghosts##53734 |goto Ghostlands/0 46.29,31.99
accept Writing on the Wall##53882 |goto Ghostlands/0 46.29,31.99
step
Follow the road |goto 43.50,44.38 < 30 |only if walking
Continue following the road |goto 45.47,72.32 < 30 |only if walking
click Lamp
Light the First Flame |q 53882/1 |goto 47.74,84.01
step
_Next to you:_
Watch the dialogue
talk Lor'themar Theron
turnin Writing on the Wall##53882
accept The First to Fall##53735
step
Follow the path down |goto 44.85,70.37 < 30 |only if walking
Shed Light on the First Battlefield |q 53735/1 |goto 37.08,65.51
|tip Use the "Light the Way" ability.
|tip It appears as a button on the screen.
step
Kill enemies around this area
Fight Back the Undead |q 53735/2 |goto 36.90,67.18
step
_Next to you:_
talk Lor'themar Theron
turnin The First to Fall##53735
accept Lament of the Highborne##53736
step
Follow the road |goto 24.94,56.44 < 30 |only if walking
Follow the road up |goto 18.68,58.41 < 30 |only if walking
kill 6 Tormented Ranger##148014 |q 53736/1 |goto 12.43,56.92
step
click Lamp
|tip At the top of the structure.
Light the Second Flame |q 53736/2 |goto 12.40,56.86
step
_Next to you:_
Watch the dialogue
talk Lor'themar Theron
turnin Lament of the Highborne##53736
accept The Day Hope Died##53737
step
Shed Light at Sylvanas' Fall |q 53737/1 |goto Eversong Woods/0 51.21,69.28
|tip Use the "Light the Way" ability.
|tip It appears as a button on the screen.
step
clicknpc Silvermoon Ballista##147006
Man a Silvermoon Ballista |q 53737/2 |goto 51.44,69.04
step
Kill enemies around this area
|tip Use the ability on your action bar.
Kill #50# Undead |q 53737/3 |goto 51.44,68.88
step
_Next to you:_
talk Lor'themar Theron
turnin The Day Hope Died##53737
accept Defense of Quel'Danas##53738
step
Follow the path up |goto 48.52,71.91 < 20 |only if walking
talk Skymaster Brightdawn##44036
Tell him _"I need a direct flight to Quel'danas."_
Talk to Skymaster Brightdawn |q 53738/1 |goto 43.94,69.98
step
Arrive at the Isle of Quel'danas |goto Isle of Quel'Danas/0 48.37,25.07 < 20 |c |q 53738 |notravel
step
talk Lady Liadrin##145793
turnin Defense of Quel'Danas##53738 |goto 48.36,35.98
accept A People Shattered##53725 |goto 48.36,35.98
step
click Lamp
Light the Final Flame |q 53725/1 |goto 48.56,37.15
step
Watch the dialogue
talk Lady Liadrin##145793
|tip She walks around this area.
turnin A People Shattered##53725 |goto 48.36,36.00
accept The Setting Sun##53853 |goto 48.36,36.00
step
Follow the path |goto 43.45,31.77 < 30 |only if walking
Continue following the path |goto 37.24,39.21 < 30 |only if walking
Continue following the path |goto 37.42,51.94 < 20 |only if walking
Continue following the path |goto 46.65,72.96 < 30 |only if walking
Continue following the path |goto 50.20,84.61 < 30 |only if walking
Shed Light on Anasterian's Fall |q 53853/1 |goto 53.48,87.16
|tip Use the "Light the Way" ability.
|tip It appears as a button on the screen.
step
Watch the dialogue
kill Blightgut##145811 |q 53853/2 |goto 53.20,86.22
step
Follow the path |goto 50.20,84.61 < 30 |only if walking
Continue following the path |goto 46.65,72.96 < 30 |only if walking
Continue following the path |goto 37.42,51.94 < 30 |only if walking
Continue following the path |goto 37.24,39.21 < 30 |only if walking
Continue following the path |goto 43.45,31.77 < 30 |only if walking
talk Lady Liadrin##145793
turnin The Setting Sun##53853 |goto 48.36,36.00
accept The Fall of the Sunwell##54096 |goto 48.36,36.00
step
Cross the bridge |goto 47.67,38.40 < 20 |only if walking
Begin the "Fall of the Sunwell" Scenario |scenariostart |goto 44.27,45.67 |q 54096
step
Shine the Lantern |scenariogoal 1/43404 |goto Shrine of the Eclipse/1 46.63,23.82 |q 54096
|tip Use the "Light the Way" ability.
|tip It appears as a button on the screen.
step
Kill the enemies that attack in waves
Hold the Line Against the Scourge |scenariostage 2 |goto 46.63,23.82 |q 54096
step
Watch the dialogue
kill Seer Drannix##146443
Defeat Seer Drannix |scenariogoal 3/43406 |goto 46.53,23.99 |q 54096
step
Watch the dialogue
|tip Use the "For Anasterian!" ability.
|tip It appears as a button on the screen.
Defeat Arthas |scenariogoal 4/43407 |goto 50.19,17.54 |q 54096
step
Shine the Lantern on Kael'thas' Decision |scenariogoal 5/43534 |goto 48.34,20.53 |q 54096
|tip Use the "Light the Way" ability.
|tip It appears as a button on the screen.
step
Follow the path down |goto 27.78,61.96 < 20 |walk
Continue following the path |goto 45.27,87.35 < 20 |walk
Watch the dialolgue
Escort Prince Kael'thas to the Sunwell |scenariogoal 6/43408 |goto 50.49,68.47 |q 54096
|tip Follow Kael'thas Sunstrider as he walks.
|tip Kill any enemies that attack you.
step
Watch the dialogue
Kill enemies around this area
Protect the Magisters |scenarioend |goto 50.49,68.47 |q 54096
step
Watch the dialogue
click Portal to Silvermoon City |goto 55.44,72.22
Return to Silvermoon City |goto Silvermoon City/0 72.15,42.75 < 20 |noway |c |q 54096
step
Run up the ramp |goto Silvermoon City/0 63.82,32.43 < 20 |only if walking
talk Lor'themar Theron##16802
turnin The Fall of the Sunwell##54096 |goto Silvermoon City/0 60.38,28.10
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Forsaken Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Forsaken Heritage Armor.",
patch='90205',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as an Undead Character |complete Undead and level >= 50
|tip You must complete this on a 50+ Undead character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Calia Menethil##173386
accept Call to Lordaeron##65656 |goto Orgrimmar/1 50.69,75.58
step
talk Forsaken Dreadmage##186199
Tell him _"Send me to Tirisfal Glades."_
Speak to a Forsaken Dreadmage for a Teleport |q 65656/1 |goto 50.83,75.50
step
Enter the building |goto Tirisfal Glades L/0 60.83,51.92 < 7 |walk
talk Calia Menethil##185512
|tip Inside the building.
turnin Call to Lordaeron##65656 |goto 60.80,51.37 |only if Horde
accept Assemble the Forsaken##65657 |goto 60.80,51.37
step
Leave the building |goto 60.83,51.92 < 7 |walk
talk Dark Ranger Velonara##185514
accept This Land is Ours##65658 |goto 61.97,50.50
stickystart "Slay_8_Blighted_Soldiers_and_Shadowmages"
step
talk Master Apothecary Faranell##185794
Tell him _"It's time to meet with the other Forsaken."_
Speak to Master Apothecary Faranell |q 65657/3 |goto 63.23,55.52
step
talk Lilian Voss##185793
Tell her _"It's time to meet with the other Forsaken."_
Speak to Lilian Voss |q 65657/2 |goto 57.57,49.21
step
label "Slay_8_Blighted_Soldiers_and_Shadowmages"
Kill enemies around this area
Slay #8# Blighted Soldiers and Shadowmages |q 65658/1 |goto 63.83,50.75
step
Enter the building |goto 60.83,51.92 < 7 |walk
talk Dark Ranger Velonara##185792
|tip Inside the building.
turnin This Land is Ours##65658 |goto 60.79,51.56
step
talk Lilian Voss##185513
|tip Inside the building.
turnin Assemble the Forsaken##65657 |goto 60.90,51.34
accept The Blight Congress##65659 |goto 60.90,51.34
step
talk Lilian Voss##185513
|tip Inside the building.
Tell her _"Let's begin."_
Speak with Lilian to begin |q 65659/1 |goto 60.90,51.34
step
Watch the dialogue
|tip Inside the building.
Listen to the Discussion |q 65659/2 |goto 60.90,51.34
step
talk Calia Menethil##185512
|tip Inside the building.
Tell her _"What do you propose?"_
Speak to Calia |q 65659/3 |goto 60.80,51.37
step
talk Calia Menethil##185797
turnin The Blight Congress##65659 |goto 61.97,55.66
accept Walk of Faith##65660 |goto 61.97,55.66
step
talk Calia Menethil##185797
Tell her _"Let's get that plague sample."_
Speak to Calia to Begin |q 65660/1 |goto 61.97,55.66
step
Kill enemies that attack Calia
extraaction Collect Pure Sample##368875
|tip Use it when it appears on your screen as Calia stops.
|tip Stay inside Calia's bubble for protection.
Collect a Pure Plague Sample |q 65660/2 |goto 61.94,58.48
step
Kill enemies that attack Calia
|tip Stay inside Calia's bubble for protection.
Escape the Blight with Calia |q 65660/3 |goto 61.92,55.55
step
talk Lilian Voss##185513
turnin Walk of Faith##65660 |goto 61.92,55.56
accept Consulting Our Allies##65661 |goto 61.92,55.56
step
click Portal to Maldraxxus |goto 62.22,55.21
Travel to Maldraxxus |goto Maldraxxus/0 73.64,33.63 < 10000 |c |noway |q 65661
step
talk Margrave Sin'dane##177782
|tip Inside the the floating citadel.
turnin Consulting Our Allies##65661 |goto Maldraxxus/0 74.83,33.65
accept House of Plagues##65662 |goto 74.83,33.65
step
talk Plague Deviser Marileth##185517
turnin House of Plagues##65662 |goto 71.15,71.47
accept Essence of Plague##65664 |goto 71.15,71.47
step
talk Calia Menethil##185803
accept Feed the Eater##65663 |goto 71.14,71.37
stickystart "Clear_the_House_of_Plagues"
step
clicknpc Simmering Concoction##185816
Absorb the Simmering Concoction |q 65664/1 |goto 70.96,74.06
step
clicknpc Unstable Concoction##185821
Absorb the Unstable Concoction |q 65664/2 |goto 69.65,75.61
step
clicknpc Tumultuous Concoction##185824
Absorb the Tumultuous Concoction |q 65664/3 |goto 68.53,79.80
step
label "Clear_the_House_of_Plagues"
Kill Plague enemies around this area
Clear the House of Plagues |q 65663/1 |goto 69.98,73.42
You can find more around [69.09,76.72] |notinsticky
step
talk Calia Menethil##185826
turnin Feed the Eater##65663 |goto 68.67,81.69
step
talk Plague Deviser Marileth##185825
turnin Essence of Plague##65664 |goto 68.66,81.76
accept Embodiment##65665 |goto 68.67,81.76
step
kill Lordaeron Blight##185828 |q 65665/1 |goto 68.26,84.56
|tip Avoid slime waves from the sides and don't stand in slime pools.
step
talk Lilian Voss##185829
turnin Embodiment##65665 |goto 68.61,81.81
accept Return to Brill##65666 |goto 68.61,81.81
step
use Lilian's Hearthstone##191029
Return to Brill |goto Tirisfal Glades L/0 60.92,50.28 < 100 |c |noway |q 65666
step
Leave the building |goto 60.83,51.91 < 7 |walk
talk Master Apothecary Faranell##185831
Tell him _"Checking in. What's next?"_
Speak to Master Apothecary Faranell |q 65666/1 |goto 65.78,60.13
step
Watch the dialogue
talk Master Apothecary Faranell##185831
turnin Return to Brill##65666 |goto 65.78,60.13
step
talk Calia Menethil##185839
accept The Remedy of Lordaeron##65667 |goto 65.84,60.37
step
clicknpc Shadowbat##185832
Mount the Shadowbat |q 65667/1 |goto 65.72,59.78
step
Drop Plague Eaters in the Ruins of Lordaeron |q 65667/2 |goto 59.18,71.38
|tip Use the "Deploy" ability in the first slot of your action bar.
|tip Use the "Call Batriders" in the second slot of your action bar on areas with purple arrows.
step
kill Amalgam##185841 |q 65667/3 |goto 62.56,72.12
|tip Use the final three abilities on your action bar.
step
Watch the dialogue
Return to the Ground |outvehicle |q 65667
step
talk Lilian Voss##185852
turnin The Remedy of Lordaeron##65667 |goto 61.85,67.75
accept The Desolate Council##65668 |goto 61.85,67.75
step
Watch the dialogue
Witness the Formation of the Desolate Council |q 65668/1 |goto 61.79,67.78
step
talk Calia Menethil##185848
turnin The Desolate Council##65668 |goto 61.79,67.78
step
talk Dark Ranger Velonara##185851
accept Path of the Dark Rangers##66091 |goto 61.92,67.78
step
talk Lilian Voss##185852
accept A Walk with Ghosts##65788 |goto 61.85,67.75
step
Enter the Throne Room of Lordaeron |q 65788/1 |goto Tirisfal Glades L/0 61.81,72.04
step
talk Calia Menethil##185893
turnin A Walk with Ghosts##65788 |goto 61.85,72.83
step
accept Unliving Summons##76530 |goto 63.75,68.16
|tip You will accept this quest automatically
step
talk Lilian Voss##186091
turnin Unliving Summons##76530 |goto 63.75,68.16
accept Our Enemies Abound##72854 |goto 63.75,68.16
step
talk Deathstalker Commander Belmont##199761
Tell him _"Show me what's going on."_
Speak to Belmont |q 72854/1 |goto 61.21,82.75
step
talk Deathstalker Commander Belmont##199761
turnin Our Enemies Abound##72854 |goto 61.21,82.74
accept To the Sepulcher##72855 |goto 61.21,82.74
step
talk Forsaken Dreadmage##199766
Tell her _"Send me to the Sepulcher in Silverpine Forest."_
Speak to Forsaken Dreadmage |q 72855/1 |goto 61.16,82.39
step
talk Dark Ranger Velonara##199768
turnin To the Sepulcher##72855 |goto Silverpine Forest/0 45.57,42.06
accept Acid Beats Paper##72858 |goto 45.57,42.06
step
talk Master Apothecary Faranell##199767
accept Nothing Like the Classic##72856 |goto 45.63,41.97
accept Boom Weed##72857 |goto 45.63,41.97
stickystart "Collect_Boom_Weed"
stickystart "Collect_Plagued_Flesh"
step
use the Acid Rifle##202182
|tip Around the back of the building.
|tip Face the notice so the acid hits it.
Destroy the Notice to All Undead |q 72858/1 |goto 47.05,43.43 |count 1
step
use the Acid Rifle##202182
|tip Around the back of the building.
|tip Face the notice so the acid hits it.
Destroy the Notice to All Undead |q 72858/1 |goto 46.67,47.07 |count 2
step
use the Acid Rifle##202182
|tip Around the back of the building.
|tip Face the notice so the acid hits it.
Destroy the Notice to All Undead |q 72858/1 |goto 45.62,47.36 |count 3
step
use the Acid Rifle##202182
|tip Around the back of the building.
|tip Face the notice so the acid hits it.
Destroy the Notice to All Undead |q 72858/1 |goto 46.96,50.23 |count 4
step
label "Collect_Boom_Weed"
click Boom Weed##385373+
|tip They look like small stringy plants on the ground around this area.
|tip They explode and cause minor damage.
collect 6 Boom Weed##202186 |q 72857/1 |goto 46.27,49.75
step
label "Collect_Plagued_Flesh"
Kill enemies around this area
collect 12 Plagued Flesh##202187 |q 72856/1 |goto 46.27,49.75
step
talk Dark Ranger Velonara##199768
turnin Acid Beats Paper##72858 |goto 45.57,42.05
step
talk Master Apothecary Faranell##199767
turnin Nothing Like the Classic##72856 |goto 45.62,41.99
turnin Boom Weed##72857 |goto 45.62,41.99
step
talk Calia Menethil##199793
accept A Proper Disguise##72859 |goto 45.55,41.56
step
talk Lilian Voss##199792
accept Fear is Our Weapon##72860 |goto 45.50,41.54
step
talk Emalora##209848
talk Angellene##209847
talk Margix##209849
|tip Choose a banshee.
Tell her _"Come with me."_
Pick a Banshee |q 72860/1 |goto 45.33,41.41
step
kill Lieutenant Hawlsey##199797 |q 72859/1 |goto 52.82,28.22
|tip Inside the building.
step
collect Hawlsey's Armor##206929 |q 72859/1 |goto 52.81,28.18
|tip Loot it from his corpse inside the building.
step
Kill Scarlet enemies around this area
Slay #12# Scarlet Recruits or Traienrs |q 72860/2 |goto 52.41,26.50
step
talk Lilian Voss##199792
turnin A Proper Disguise##72859 |goto 45.50,41.55
turnin Fear is Our Weapon##72860 |goto 45.50,41.55
accept The Scarlet Spy##72861 |goto 45.50,41.55
step
extraaction Disguised##397488
Don the Scarlet Disguise |q 72861/1 |goto 45.50,41.55
step
clicknpc Explosive Plague Mixture##187485
Pick Up Faranell's Mixture |q 72861/2 |goto 45.62,41.90
step
talk Scarlet Boatmaster##199804
Select  _"<Stare silently until the Boatmaster calls a boat for you.>"_
Speak to the Scarlet Boatmaster |q 72861/3 |goto 59.93,34.19
step
Watch the dialogue
Reach the Dock |outvehicle |goto 64.10,34.27
step
talk Quartermaster Newlem##199806
|tip Use your disguise if you lose it.
turnin The Scarlet Spy##72861 |goto 64.02,33.47
accept Among Us##72862 |goto 64.02,33.47
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 66.18,32.93 |count 1
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 66.91,30.17 |count 2
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 68.81,33.15 |count 3
step
'|extraaction Disguised##397488
clicknpc Explosive Plague Mixture##199883
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Plant the Explosive Plague |q 72862/1 |goto 68.80,35.38 |count 1
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 70.53,35.49 |count 4
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 76.12,33.34 |count 5
step
'|extraaction Disguised##397488
clicknpc Explosive Plague Mixture##199883
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Plant the Explosive Plague |q 72862/1 |goto 75.77,31.74 |count 2
step
'|extraaction Disguised##397488
clicknpc Scarlet Archmage##199896
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Slay the Scarlet Archmage |q 72862/2 |goto 80.11,31.44 |count 6
step
'|extraaction Disguised##397488
clicknpc Explosive Plague Mixture##199883
|tip Use your disguise if you lose it.
|tip Avoid the large circles.
Plant the Explosive Plague |q 72862/1 |goto 76.36,19.97 |count 3
step
talk Dark Ranger Velonara##199879
turnin Among Us##72862 |goto 70.45,18.22
accept The Flight of the Banshee##72863 |goto 70.45,18.22
step
talk Dark Ranger Velonara##199879
Tell her _"I'm ready."_
Speak to Velonara |q 72863/1 |goto 70.45,18.22
step
talk Deathstalker Commander Belmont##199885
turnin The Flight of the Banshee##72863 |goto 70.25,18.05
accept Death to the Living##72864 |goto 70.25,18.05
step
click Scarlet Banner+
|tip They look like white and red banners on poles around this area.
click Scarlet Portal+
|tip They look like large blue portals on the ground around this area.
Kill enemies around this area
Route the Scarlet Crusade |q 72864/1 |goto 70.32,20.03
step
Meet Lilian Voss Ouside Fenris Keep |q 72864/2 |goto 66.33,31.08
step
talk Lilian Voss##199893
turnin Death to the Living##72864 |goto 66.33,31.08
accept This is the Hour of the Forsaken##72865 |goto 66.33,31.08
step
Reach Fenris Keep |q 72865/1 |goto 65.73,24.41
step
extraaction Will of the Forsaken##412756
|tip Use this when it appears on the screen.
kill Scarlet Commander Forsythe##199912 |q 72865/2 |goto 65.71,23.75
|tip Upstairs inside the building.
step
talk Lilian Voss##199893
|tip Downstairs inside the building.
turnin This is the Hour of the Forsaken##72865 |goto 65.62,23.80
accept Return to Lordaeron##72866 |goto 65.62,23.80
step
click Portal to Lordaeron |goto 65.53,23.95
Take the portal to the Ruins of Lordaeron |q 72866/1 |goto 65.53,23.95
step
talk Lilian Voss##199922
turnin Return to Lordaeron##72866 |goto Tirisfal Glades L/0 61.84,69.55
accept I Am Forsaken##72867 |goto 61.84,69.55
step
extraaction Honor of the Forsaken##416270
Receive the Honor of the Forsaken |q 72867/1 |goto 61.84,68.65
step
talk Lilian Voss##199922
turnin I Am Forsaken##72867 |goto 61.84,69.56
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Goblin Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Goblin Heritage Armor.",
patch='80300',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Goblin Character |complete Goblin and level >= 50
|tip You must complete this on a 50+ Goblin character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Izzy##156358
accept Old Friends, New Opportunities##57043 |goto Orgrimmar/1 39.49,80.28
step
talk Sassy Hardwrench##156396
turnin Old Friends, New Opportunities##57043 |goto The Cape of Stranglethorn/0 34.61,28.58
accept A Special Delivery##57045 |goto 34.61,28.58
step
click Goblin Flying Machine##156405
Travel to Crapopolis |q 57045/1 |goto 32.84,26.15
step
Arrive in Crapopolis |goto Crapopolis/0 50.95,92.92 < 500 |c |noway |q 57045
step
Follow the path |goto 54.63,69.46 < 30 |only if walking
talk Hobart Grapplehammer##156520
turnin A Special Delivery##57045 |goto 53.58,61.94
accept A Simple Experiment##57047 |goto 53.58,61.94
step
Watch the dialogue
Listen to Hobart Grapplehammer |q 57047/1 |goto 53.05,58.91
step
talk Hobart Grapplehammer##156520
|tip Inside the building.
Tell him _"Let's begin the experiment."_
Speak with Hobart Grapplehammer |q 57047/2 |goto 52.99,58.59
step
click Freezing Console
|tip Inside the building.
Watch the dialogue
Activate the Freezing Console |q 57047/3 |goto 52.50,60.43
step
click Flame Console
|tip Inside the building.
Watch the dialogue
Activate the Flame Console |q 57047/4 |goto 53.27,60.12
step
click Explosive Console
|tip Inside the building.
Watch the dialogue
Activate the Explosive Console |q 57047/5 |goto 54.04,59.85
step
talk Hobart Grapplehammer##156520
|tip Inside the building.
turnin A Simple Experiment##57047 |goto 52.99,58.59
accept Shopping For Parts##57048 |goto 52.99,58.59
step
talk Crank Greasefuse##156542
turnin Shopping For Parts##57048 |goto 56.08,78.20
accept Debt Collection!##57051 |goto 56.08,78.20
step
talk Shady Thug##156881
Tell them _"Crank Greasefuse sent me. It's time to pay up!"_
|tip Some of them may attack you.
collect 8 Unpaid Debt##171089 |q 57051/1 |goto 54.68,71.88
step
talk Crank Greasefuse##156542
turnin Debt Collection!##57051 |goto 56.08,78.20
accept I've Got What You Need##57052 |goto 56.08,78.20
step
Follow the path |goto 54.28,66.30 < 20 |only if walking
talk Hobart Grapplehammer##156520
|tip Inside the building.
turnin I've Got What You Need##57052 |goto 58.74,60.84
accept Blunt Force Testing##57053 |goto 58.74,60.84
step
use the X-52 Personnel Armor##171114
Equip the X-52 Body Armor |q 57053/1 |goto 53.25,60.14
step
click Test Console
|tip Inside the building.
Activate the Mechanized Lab Assistant |q 57053/2 |goto 53.27,60.13
step
kill Mechanized Lab Assistant##156908 |q 57053/3 |goto 53.13,59.62
|tip Inside the building.
|tip Use the X-52 Personnel Armor button on-screen to gain temporary shielding.
step
talk Hobart Grapplehammer##156520
|tip Inside the building.
turnin Blunt Force Testing##57053 |goto 58.74,60.84
accept Fun With Landmines##57058 |goto 58.74,60.84
step
use X-52 Personnel Armor##174059
Equip the X-52 Personnel Armor |q 57058/1 |goto 58.73,60.85
step
Follow the path up |goto 49.94,53.64 < 20 |only if walking
click Refreshing Coconut Beverage
Get a Refreshing Coconut Beverage |q 57058/2 |goto 45.99,48.22
step
Follow the path |goto 56.18,58.94 < 20 |only if walking
talk Hobart Grapplehammer##156520
|tip Upstairs inside the building.
turnin Fun With Landmines##57058 |goto 52.09,59.36
accept Let's Rumble!##57059 |goto 52.09,59.36
step
kill 8 Hired Scoundrel##157433 |q 57059/1 |goto 52.09,59.36
|tip Inside the building.
step
talk Trade Prince Gallywix##157060
|tip Inside the building.
Tell him _"I think it's time for you to leave, Gallywix."_
Speak with Gallywix |q 57059/2 |goto 53.30,60.27
step
talk Hobart Grapplehammer##156520
|tip Upstairs inside the building.
turnin Let's Rumble!##57059 |goto 52.09,59.36
accept Buyers Wanted!##57077 |goto 52.09,59.36
step
Follow the path |goto 54.57,70.91 < 30 |only if walking
Cross the bridge |goto 51.67,86.80 < 20 |only if walking
click Goblin Flying Machine
Take the Flying Machine |q 57077/1 |goto 50.74,94.58
step
talk Sassy Hardwrench##156396
turnin Buyers Wanted!##57077 |goto The Cape of Stranglethorn/0 34.61,28.58
accept The VIP List##57078 |goto 34.61,28.58
step
talk Marin Noggenfogger##38532
Choose _"Deliver Sassy's Invitation to Noggenfogger."_
Invite Noggenfogger |q 57078/1 |goto Tanaris/0 51.20,29.97
step
Enter the building |goto Thousand Needles/0 76.01,75.24 < 10 |walk
talk Pozzik##40028
|tip Inside the building.
Choose _"Deliver Sassy's Invitation to Pozzik."_
Invite Pozzik |q 57078/2 |goto 75.93,74.71
step
talk Gazlowe##3391
|tip Inside the building.
Choose _"Deliver Sassy's Invitation to Gazlowe."_
Invite Gazlowe |q 57078/3 |goto Northern Barrens/0 68.41,69.06
step
talk Sassy Hardwrench##156396
turnin The VIP List##57078 |goto The Cape of Stranglethorn/0 34.61,28.58
accept Beat The Crapopolis Outta Him!##57079 |goto 34.61,28.58
step
click Goblin Flying Machine
Enter the Scenario |scenariostart |goto 32.82,26.14 |q 57079
step
talk Gazlowe##157459
Ask him _"What's the situation here?"_
Speak with Gazlowe at the dock |scenariogoal 1/46477 |goto Crapopolis Scenario/0 52.31,84.73 |q 57079
step
Follow the path |goto 54.80,71.29 < 20 |only if walking
kill Dax Blitzblaster##157455
|tip Inside the building.
Rescue Hobart Grapplehammer |scenariogoal 2/46478 |goto 53.09,59.33 |q 57079
step
click Grapplehammer's Chest
|tip Inside the building.
Equip the X-52 Body Armor |scenariogoal 3/46479 |goto 52.57,58.88 |q 57079
step
Follow the path up |goto 50.11,54.37 < 30 |only if walking
kill Trade Prince Gallywix##157456 |scenariogoal 4/46480 |goto 46.31,48.18
|tip Lead Gallywix over crawler mines stuck in the ground.
|tip Use the special action button on-screen to gain temporary armor.
|tip When Gallywix reaches zero health, use the button that appears on-screen.
step
talk Hobart Grapplehammer##157491
turnin Beat The Crapopolis Outta Him!##57079 |goto 47.86,50.57
accept A Fitting Reward##57080 |goto 47.86,50.57
step
talk Hobart Grapplehammer##157491
turnin A Fitting Reward##57080 |goto 47.86,50.57
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Orc Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Orc Heritage Armor.",
patch='100007',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Orc Character |complete Orc and level >= 50
|tip You must complete this on a 50+ Orc character.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept A Summon to Orgrimmar##73703
|tip You will automatically accept this quest.
step
Enter the building |goto Orgrimmar/1 49.93,75.65 < 7 |walk
talk Eitrigg##3144
|tip Inside the building.
turnin A Summon to Orgrimmar##73703 |goto 49.21,72.28
accept A People in Need of Healing##72462 |goto 49.21,72.28
step
click Portal to Alterac Valley
Take the Portal to Alterac Valley |q 72462/1 |goto 51.16,78.94
step
Follow the path up |goto Alterac Valley Heritage/0 48.59,83.09 < 7 |walk
Enter the building |goto 48.26,86.42 < 7 |walk
Follow Eitrigg to the Hall of the Frostwolf |scenariogoal 1/56805 |goto 47.11,86.97 |q 72462
|tip He will eventually walk inside the building.
step
talk Shiri##185472
|tip Inside the building.
Tell him _"Eitrigg wishes to discuss bringing back the Kosh'harg."_
Talk to Drek'Thar |scenariogoal 1/57996 |goto 47.11,86.97 |q 72462
step
clicknpc Totem of Air##201604
|tip Inside the building.
Place the Totem of Air |scenariogoal 2/57997 |goto 47.09,86.59 |count 1 |q 72462
step
clicknpc Totem of Water##201605
|tip Inside the building.
Place the Totem of Water |scenariogoal 2/57997 |goto 47.31,86.36 |count 2 |q 72462
step
clicknpc Totem of Fire##201602
|tip Inside the building.
Place the Totem of Fire |scenariogoal 2/57997 |goto 47.52,87.31 |count 3 |q 72462
step
clicknpc Totem of Earth##201603
|tip Inside the building.
Place the Totem of Earth |scenariogoal 2/57997 |goto 47.25,87.29 |count 4 |q 72462
step
Watch the dialogue
|tip Inside the building.
Discuss the Kosh'harg with Drek'thar |scenariogoal 2/56806 |goto 47.11,86.97 |q 72462
step
talk Farseer Drek'Thar##199136
|tip Inside the building.
Tell him _"I accept your challenge!"_
Talk to Drek'thar to Begin |scenariogoal 3/57998 |goto 47.11,86.97 |q 72462
stickystart "Kill_Drakan"
step
Watch the dialogue
|tip Inside the building.
kill Duros##199138 |scenariogoal 3/57827 |goto 47.28,86.90 |q 72462
step
label "Kill_Drakan"
kill Drakan##199139 |scenariogoal 3/56808 |goto 47.28,86.90 |q 72462
|tip Inside the building. |notinsticky
step
Watch the dialogue
kill Elemental Projection##201615 |scenariogoal 4/57999 |goto 47.25,86.87 |q 72462
|tip Inside the building.
|tip Kill the four totems to weaken the projection.
step
Watch the dialogue
talk Thrall##199140
|tip Inside the building.
Choose _<Take Thrall's Hearthstone>_
Talk to Thrall |scenariogoal 5/56807 |goto 47.42,86.74 |q 72462
step
use Thrall's Hearthstone##201957
Use Thrall's Hearthstone to Return to Orgrimmar |scenariogoal 5/57662 |goto 47.42,86.74 |q 72462
step
talk Aggra##200244
|tip Inside the building.
turnin A People in Need of Healing##72462 |goto Orgrimmar/1 54.39,78.58
accept The Kosh'harg##72464 |goto 54.39,78.58
step
clicknpc Armored Wind Rider##200266
Choose _<Ride the Wind Rider to Razor Hill.>_
Mount the Armored Wind Rider |invehicle |q 72464 |goto 52.00,79.31
step
Travel to the Kosh'harg with Aggra's Family |q 72464/1
step
talk Farseer Aggralan##199148
Tell her _"Let's skip the formalities."_
Talk to Farseer Aggralan to Begin the Om'gora |q 72464/2 |goto Durotar/0 52.21,42.99
step
talk Farseer Aggralan##199148
turnin The Kosh'harg##72464 |goto 52.21,42.99
accept The Blessing of the Land##72465 |goto 52.21,42.99
accept The Blessing of the Clan##72467 |goto 52.21,42.99
accept The Blessing of the Ancestors##72476 |goto 52.21,42.99
step
Talk to an NPC
|tip Choose a clan to follow.
|tip The clan you choose determines which clan's banner displays on the toy you gain questing.
|tip This banner can be changed later.
Choose a Clan |q 72467/1 |goto 54.09,42.47
step
talk Farseer Aggralan##199148
turnin The Blessing of the Clan##72467 |goto 52.21,42.99
step
talk Thega Graveblade##199151
accept The Long Knives##74581 |goto 52.31,42.86
step
talk Cook Torka##199383
turnin The Blessing of the Ancestors##72476 |goto 50.74,42.70
accept An Important Heirloom##74374 |goto 50.74,42.70
step
talk Arugi##201018
Learn Cooking |q 74374/2 |goto 50.75,42.61
step
click Old Cookbook
|tip Inside the building.
Collect the Old Cookbook |q 74374/1 |goto 51.66,41.23
step
talk Cook Torka##199383
turnin An Important Heirloom##74374 |goto 50.74,42.70
accept Orcish Groceries##72477 |goto 50.74,42.70
step
click "Spoons and Forks"
Read "Spoons and Forks" |q 72477/1 |goto 50.78,42.72
step
talk Nula the Butcher##199262
buy 3 Fresh Talbuk Steak##202027 |q 72477/10 |goto 50.72,43.25
step
talk Suja##199235
buy 2 Un'goro Coconut##202707 |q 72477/4 |goto 51.10,44.14
buy 3 Isle Lemon##202029 |q 72477/6 |goto 51.10,44.14
buy 3 Suja's Sweet Salt##204793 |q 72477/7 |goto 51.10,44.14
step
click Crate of Crabs
|tip Clicking it will release a bunch of small crabs.
clicknpc Escaped Crab##199223+
|tip Click them as they run around to collect them.
collect 2 Durotar Coast Crab##202026 |q 72477/2 |goto 51.36,44.16
step
talk Razgar##199221
buy 3 Southfury Salmon##202028 |q 72477/5 |goto 51.58,43.79
step
talk Kyl'kahn##199206
Tell him _"I need a keg of ale for my offering to the ancestors."_
collect 1 Keg of Ancestral Ale##202025 |q 72477/11 |goto 51.30,42.43
step
talk Far'kul Flametongue##199237
buy 2 Farahlon Fenugreek##202031 |q 72477/3 |goto 50.84,41.45
buy 3 Ground Gorgrond Pepper##202030 |q 72477/8 |goto 50.84,41.45
buy 3 Zandali Piri Piri##202706 |q 72477/9 |goto 50.84,41.45
step
_Next to you:_
talk Durak##201361
turnin Orcish Groceries##72477 |goto 50.86,41.58
accept A Worthy Offering##74415 |goto 50.86,41.58
step
create 3 Grilled Southfury Salmon##399038,Cooking,3 total |q 74415/1 |goto 50.83,42.65
|tip Open your cooking panel.
|tip Set the filter to "Classic" if needed.
|tip The recipes are located after Everyday Cooking in the "Orcish Cuisine" category.
step
create 3 Seared Spicy Talbuk Steak##399035,Cooking,3 total |q 74415/2 |goto 50.83,42.65
|tip Open your cooking panel.
|tip Set the filter to "Classic" if needed.
|tip The recipes are located after Everyday Cooking in the "Orcish Cuisine" category.
step
create 2 Curried Coconut Crab##399034,Cooking,2 total |q 74415/3 |goto 50.83,42.65
|tip Open your cooking panel.
|tip Set the filter to "Classic" if needed.
|tip The recipes are located after Everyday Cooking in the "Orcish Cuisine" category.
step
create 1 Feast for the Ancestors##399040,Cooking,1 total |q 74415/4 |goto 50.83,42.65
|tip Open your cooking panel.
|tip Set the filter to "Classic" if needed.
|tip The recipes are located after Everyday Cooking in the "Orcish Cuisine" category.
step
click Feast for the Ancestors
Place the Feast for the Ancestors |q 74415/5 |goto 53.13,45.77
step
talk Farseer Aggralan##199148
turnin A Worthy Offering##74415 |goto 52.21,42.99
step
click Ancient Skeleton
Find the Spirit of Thunder Ridge |q 72465/1 |goto 40.68,26.70
step
talk The Spirit of Thunder Ridge##199165
turnin The Blessing of the Land##72465 |goto 40.59,26.77
accept The Spirit of Thunder Ridge##72466 |goto 40.59,26.77
step
click Buried Seed+
|tip They look like small piles of dirt under the water around this area.
collect 8 Ancient Seed##201966 |q 72466/1 |goto 39.53,24.93
step
Return to the Ancient Skeleton |q 72466/2 |goto 40.60,26.76
step
click Ancient Skeleton
Plant the Seeds in the Ancient Skeleton |q 72466/3 |goto 40.60,26.76
step
talk Kaltunk##10176
turnin The Long Knives##74581 |goto Valley of Trials/0 45.19,68.39
accept Tracking a Killer##72474 |goto 45.19,68.39
step
talk Karranisha##200734
Tell him _"Have you seen any evidence of Gor'krosh?"_
Find the First Clue |q 72474/1 |goto 43.41,70.61 |count 1
step
Find the Second Clue |q 72474/1 |goto 46.01,63.36 |count 2
step
Find the Third Clue |q 72474/1 |goto 49.98,60.12 |count 3
step
click Beast Tracks
Choose _"I should tell Kaltunk about this."_
Find the Fourth Clue |q 72474/1 |goto 54.25,62.51 |count 4
step
talk Terrified Peon##199179
Tell him _"What happened here?"_
Find the Fifth Clue |q 72474/1 |goto 52.40,68.65 |count 5
step
talk Kaltunk##10176
turnin Tracking a Killer##72474 |goto 45.19,68.39
accept Cornering Gor'krosh##72475 |goto 45.19,68.39
step
Follow the Trail |q 72475/1 |goto Durotar/0 59.18,63.52
step
click Raptor Nest
kill Gor'krosh##199186 |q 72475/2 |goto 59.28,63.38
step
collect 1 "Long Knife"##202024 |q 72475/4 |goto 59.23,63.64
|tip Loot it from Gor'krosh.
step
click Raptor Blood
|tip On the ground near the corpse.
Retrieve the Blood of Gor'krosh |q 72475/3 |goto 59.23,63.64
step
talk Farseer Aggralan##199148
turnin Cornering Gor'krosh##72475 |goto 52.21,42.99
turnin The Spirit of Thunder Ridge##72466 |goto 52.21,42.99
accept Honor and Glory##72478 |goto 52.21,42.99
step
talk Boss Magor##201505
Tell him _"Bring it on!"_
Kill enemies around this area
|tip Peons will attack you in waves, along with Boss Magor.
click Booterang
|tip They look like small boots dropped by peons.
extraaction Booterang##400758
|tip Use it on Boss Magor when he spins after picking up a Booterang.
kill 1 Boss Magor##201505
Brawl with Boss Magor and the Peons |q 72478/2 |goto 52.48,40.95
step
Click items on the tables
Kill enemies around this area
Enjoy the Feast! |q 72478/1 |goto 52.50,42.40
step
talk Thrall##200437
turnin Honor and Glory##72478 |goto 52.25,43.44
accept Aka'magosh##72479 |goto 52.25,43.44
step
Watch the dialogue
Close Kosh'harg |q 72479/1 |goto 52.25,43.44
step
talk Eitrigg##200617
turnin Aka'magosh##72479 |goto 52.25,43.03
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Tauren Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Tauren Heritage Armor.",
patch='80200',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Tauren Character |complete Tauren and level >= 50
|tip You must complete this on a 50+ Tauren character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Spiritwalker Isahi##149088
accept When Spirits Whisper##54759 |goto Orgrimmar/1 39.13,78.99
step
talk Baine Bloodhoof##36648
|tip Inside the building.
turnin When Spirits Whisper##54759 |goto Thunder Bluff/0 60.26,51.67
accept The Spiritwalkers##54760 |goto 60.26,51.67
step
talk Spiritwalker Ussoh##149084
turnin The Spiritwalkers##54760 |goto Camp Narache/0 12.17,31.27
accept Spirit Guide##54761 |goto 12.17,31.27
step
click Spiritwalker's Incense
Watch the dialogue
Light the Spiritwalker's Incense |q 54761/1 |goto 12.56,31.28
step
talk Spiritwalker Ussoh##149084
turnin Spirit Guide##54761 |goto 12.17,31.27
accept A Small Retreat##54762 |goto 12.17,31.27
step
talk Spiritwalker Ussoh##149529
|tip Inside the building.
turnin A Small Retreat##54762 |goto Stonetalon Mountains/0 49.17,60.92
accept Crossing Over##54763 |goto 49.17,60.92
step
use the Spiritwalker's Hallowed Vessel##166899
Enter the Spirit Realm |q 54763/1 |goto 49.17,60.92
step
Follow the path |goto 49.64,61.59 < 10 |only if walking
Cross the bridge |goto 49.32,62.96 < 10 |only if walking
Continue up the path |goto 48.14,63.11 < 10 |only if walking
Continue up the path |goto 48.14,64.63 < 10 |only if walking
Continue up the path |goto 48.95,65.39 < 10 |only if walking
kill Necrofiend##149452+
Watch the dialogue
Follow the Spirit Guide |q 54763/2 |goto 50.05,65.69
step
talk Spiritwalker Ussoh##149529
|tip Inside the building.
turnin Crossing Over##54763 |goto 49.17,60.92
accept Storm in Bloodhoof##54764 |goto 49.17,60.92
step
Travel to Bloodhoof Village |q 54764/1 |goto Mulgore/0 47.40,58.65
step
Kill enemies around this area
clicknpc Bloodhoof Villager##149614+
|tip They look like frightened Tauren villagers around this area.
clicknpc Trapped Kodo##150225+
|tip They look like subdued kodo around this area.
Save the People of Bloodhoof Village |q 54764/2 |goto 47.40,58.65
step
talk Baine Bloodhoof##149528
turnin Storm in Bloodhoof##54764 |goto Thunder Bluff/0 58.25,51.80
accept Answer the Call##54766 |goto Thunder Bluff/0 58.25,51.80
step
talk Baine Bloodhoof##149528 |goto 58.17,51.77
Tell him _"Attack!"_
kill Malevolent Spirit##149547 |q 54766/1 |goto 55.70,51.52
|tip Run into the glowing yellow patches on the ground for a damage boost.
step
Watch the dialogue
talk Baine Bloodhoof##36648
|tip Inside the building.
turnin Answer the Call##54766 |goto 60.26,51.67
accept Thank Your Guide##54765 |goto 60.26,51.67
step
click Spirit Offering
Watch the dialogue
Present the Offering |q 54765/1 |goto Mulgore/0 33.96,38.62
step
click Ceremonial Tauren Garb
turnin Thank Your Guide##54765 |goto 34.00,38.65
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Troll Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Troll Heritage Armor.",
patch='100207',
},[[
step
Reach Level 60 On Any Character |achieve 14783
|tip In order to start core race heritage armor questlines, you must have at least one level 60 character on your account.
|tip Use various leveling guides to level any character to 60 or higher.
step
Reach Level 50 as a Troll Character |complete Troll and level >= 50
|tip You must complete this on a 50+ Troll character.
|tip Refer to our various leveling guides to help you accomplish this.
step
talk Zi'guma##213791
accept Return to the Echo Isles##77869 |goto Orgrimmar/1 32.70,64.61
step
talk Rokhan##210198
|tip Inside the building.
turnin Return to the Echo Isles##77869 |goto Echo Isles/0 61.13,65.71
step
talk Master Gadrin##210092
|tip Inside the building.
accept De Old Loa##77871 |goto 61.39,65.36
step
click Mueh'zala Offering
|tip Inside the building.
Destroy the Mueh'zala Offering |q 77871/1 |goto 61.65,64.41 |count 1
step
click Mueh'zala Offering
|tip Inside the building.
Destroy the Mueh'zala Offering |q 77871/1 |goto 61.92,65.40 |count 2
step
click Mueh'zala Offering
|tip Inside the building.
Destroy the Mueh'zala Offering |q 77871/1 |goto 60.62,66.57 |count 3
step
click Mueh'zala Offering
|tip Inside the building.
Destroy the Mueh'zala Offering |q 77871/1 |goto 60.57,66.15 |count 4
step
click Mueh'zala Offering
|tip Inside the building.
Destroy the Mueh'zala Offering |q 77871/1 |goto 60.65,65.36 |count 5
step
click Altar of the Loa
Assist Tzadah with the Loa Ritual |q 77871/2 |goto 58.75,66.24
step
talk Rokhan##214839
turnin De Old Loa##77871 |goto 59.14,65.65
accept De Loa of de Past##77874 |goto 59.14,65.65
step
click Handmade Napkin
Collect the Tribute Object |q 77874/1 |goto 59.22,62.09 |count 1
step
click Lightly Used Pants
|tip Inside the tent.
Collect the Tribute Object |q 77874/1 |goto 59.92,60.92 |count 2
step
click Half-used Dream Diary
|tip Inside the tent.
Collect the Tribute Object |q 77874/1 |goto 60.04,61.05 |count 3
step
click Empty Bag of Marbles
Collect the Tribute Object |q 77874/1 |goto 60.15,62.08 |count 4
step
click Abandoned Artistic Carving
Collect the Tribute Object |q 77874/1 |goto 60.25,61.56 |count 5
step
click Damaged Favorite Drum
Collect the Tribute Object |q 77874/1 |goto 60.34,63.22 |count 6
step
click Overly-loved Plush Remains
Collect the Tribute Object |q 77874/1 |goto 60.52,63.48 |count 7
step
click Warrior's First Sword
Collect the Tribute Object |q 77874/1 |goto 60.89,63.36 |count 8
step
click Jani's Junkpile
Create a Jani Tribute |q 77874/2 |goto 58.72,66.02
step
Watch the dialogue
talk Jani##210120
Ask it _"We're looking for the Darkspear's lost loa, to combat against Mueh'zala. Can you help?"_ |gossip 120185
Consult Jani |q 77874/3 |goto 58.38,65.95
step
click Jani's Junkpile
Loot Jani's Junkpile |q 77874/4 |goto 58.72,66.08
step
talk Rokhan##210238
turnin De Loa of de Past##77874 |goto Northern Stranglethorn/0 84.62,40.17
accept Stalking the Stalker##77879 |goto 84.62,40.17
step
Kill enemies around this area
collect 6 Offering to Hakkar##211350 |q 77879/1 |goto 78.14,44.07
You can find more around [88.59,46.82]
step
Return to Jani |q 77879/2 |goto 81.80,47.89
step
Watch the dialogue
talk Kevo ya Siti##209891
turnin Stalking the Stalker##77879 |goto 81.83,48.07
accept There is Another##77881 |goto 81.83,48.07
step
click Jani's Junkpile
Use Jani's Junkpile to Travel to Bambala |q 77881/1 |goto 81.82,47.61
step
Return to Bambala |q 77881/2 |goto 63.92,39.54
step
talk Kevo ya Siti##222657
turnin There is Another##77881 |goto 63.58,41.43
step
talk Rokhan##210091
accept Looking for Lukou##77880 |goto 63.47,41.32
step
talk Shadow Hunter Ty'jin##210093
Ask him _"Have you ever heard of a loa named Lukou?"_ |gossip 114187
Ask About Lukou |q 77880/1 |goto 63.17,39.85 |count 1
step
talk Shadow Hunter Laztoki##210240
Ask her _"Have you ever heard of a loa named Lukou?"_ |gossip 114192
Ask About Lukou |q 77880/1 |goto 65.01,42.50 |count 2
step
talk Witch Doctor Daara##210259
Ask her _"Have you ever heard of a loa named Lukou?"_ |gossip 114191
Ask About Lukou |q 77880/1 |goto 66.04,40.51
step
talk Rokhan##210091
Tell him _" We should look for Lukou's shrine in an ogre cave nearby."_ |gossip 120221
Speak with Rokhan |q 77880/2 |goto 63.48,41.32
step
Find Kevo Ya Siti by the Ogre Mound |q 77880/3 |goto 65.05,47.69
step
talk Rokhan##210091
turnin Looking for Lukou##77880 |goto 65.10,47.49
step
talk Kevo ya Siti##222666
accept One with the Loa##77877 |goto 65.04,47.69
step
talk Kevo ya Siti##222666
Tell him _"Take us inside."_ |gossip 114200
Tell Kevo You're Ready |q 77877/1 |goto 65.04,47.69
step
Begin Travelling |invehicle |q 77877
step
Watch the dialogue
Travel Inside with Kevo |outvehicle |goto 70.38,48.96 |q 77877
step
Infiltrate the Ogre Cave |q 77877/2 |goto 70.38,48.96
step
Watch the dialogue
talk Rokhan##210091
|tip Inside the cave.
turnin One with the Loa##77877 |goto 70.62,49.02
accept Stolen but Not Forgotten##77882 |goto 70.62,49.02
accept The Unkillable##78875 |goto 70.62,49.02
stickystart "Retrieve_Altar_Fragments
step
kill Mai'Zoth##210252
|tip Inside the cave.
collect 1 Lukou's Altar Centerpiece##210593 |q 78875/1 |goto 69.16,46.94
step
label "Retrieve_Altar_Fragments
Kill enemies around this area
|tip Inside the cave.
click Dusty Bag##408767+
|tip They look like small bags on the ground inside the cave.
collect 8 Altar Fragment##210592 |q 77882/1 |goto 68.55,48.56
step
talk Rokhan##210091
|tip Inside the cave.
turnin Stolen but Not Forgotten##77882 |goto 70.62,49.03
turnin The Unkillable##78875 |goto 70.62,49.03
accept Heart of Lukou##77894 |goto 70.62,49.03
step
click Altar of Regeneration
|tip Inside the cave.
Repair the Destroyed Effigy |q 77894/1 |goto 70.71,48.98
step
talk Lukou##210258
|tip Inside the cave.
Tell her _"We are the Darkspear. We are friends of Lukou and Kevo ya Siti!"_ |gossip 114302
Calm Lukou |q 77894/2 |goto 70.78,48.63
step
Watch the dialogue
talk Rokhan##210091
|tip Inside the cave.
turnin Heart of Lukou##77894 |goto 70.62,49.02
accept Honor and Tribute##77898 |goto 70.62,49.02
step
click Jani's Junkpile
|tip Inside the cave.
Return to the Echo Isles Using Jani's Junkpile |q 77898/1 |goto 70.39,49.57
step
talk Witch Doctor Tzadah##210086
Ask her _"What do I need to do?"_ |gossip 114303
Speak with Tzadah |q 77898/2 |goto Echo Isles/0 59.08,65.92
step
click Kevo ya Siti Offering
Place the Kevo ya Siti Offering |q 77898/3 |goto 58.84,66.26
step
click Lukou Offering
Place the Lukou Offering |q 77898/4 |goto 58.64,66.29
step
click Loa Offering
Place the Last Offering |q 77898/5 |goto 58.73,66.24
step
talk Witch Doctor Tzadah##210086
turnin Honor and Tribute##77898 |goto 59.09,65.91
accept The Rush'kah##77899 |goto 59.09,65.91
step
click Rush'kah Paint
Mix the Paint |q 77899/1 |goto 59.28,61.87
step
click Prepared Wood
Retrieve the Prepared Wood |q 77899/2 |goto 59.19,61.96
step
click Finished Rush'kah
Create a Rush'kah Mask |q 77899/3 |goto 60.12,62.16
step
talk Rokhan##223215
turnin The Rush'kah##77899 |goto 60.07,62.39
accept The Loa Trials##77900 |goto 60.07,62.39
step
extraaction Loa Trial Ritual##427573
|tip It appears as a button on the screen.
Watch the dialogue
Participate in Trial Ritual |q 77900/1 |goto 58.75,65.94
step
talk Rokhan##212784
turnin The Loa Trials##77900 |goto 58.50,65.52
accept De Power of Death##77903 |goto 58.50,65.52
step
talk Lukou##205981
accept Ritual Recovery##77902 |goto 58.45,66.21
step
talk Kevo ya Siti##210260
accept Retraining the Trainees##77901 |goto 59.03,66.21
stickystart "Slay_Minions_of_Mueh'zala"
stickystart "Remove_Darkness"
step
click Ritual Circle
Remove the Ritual Circle |q 77902/1 |goto 49.56,60.84 |count 1
step
click Ritual Circle
Remove the Ritual Circle |q 77902/1 |goto 48.58,47.58 |count 2
step
click Ritual Circle
Remove the Ritual Circle |q 77902/1 |goto 59.69,51.64 |count 3
step
label "Slay_Minions_of_Mueh'zala"
Kill enemies around this area |kill Devotee of Mueh'zala##210322,kill Raised Boneripper##210324,kill Empowered Boneguard##210329,kill Unfinished Rush'kah##210325
Slay #12# Minions of Mueh'zala |q 77903/1 |goto 50.78,54.33
step
label "Remove_Darkness"
use the Cunning Charm##211000
|tip Use it on Trainee NPCs around this area after you weaken them to 50%.
clicknpc Lost Trainee Hunter##210375
clicknpc Lost Trainee Rogue##210374
Remove Darness from #8# Lost Trainees |q 77901/1 |goto 58.04,65.20
step
talk Rokhan##213638
turnin Retraining the Trainees##77901 |goto 56.96,56.40
turnin Ritual Recovery##77902 |goto 56.96,56.40
turnin De Power of Death##77903 |goto 56.96,56.40
accept Avatar of Mueh'zala##77905 |goto 56.96,56.40
step
click Jani's Blessing
collect Jani's Blessing##211133 |q 77905/1 |goto 56.31,56.44
step
extraaction Travel with Lukou##421812
|tip It appears as a button on your screen.
Travel with Lukou |q 77905/2 |goto 56.48,55.96
step
kill Summoned Visage##213686
|tip Avoid areas on the ground that are targeted in purple.
click Tzadah's Empowerment
Destroy Tzadah's Empowerment |q 77905/3 |goto 58.46,56.28 |count 1
step
kill Summoned Visage##213686
|tip Avoid areas on the ground that are targeted in purple.
click Tzadah's Empowerment
Destroy Tzadah's Empowerment |q 77905/3 |goto 54.36,56.41 |count 2
step
kill Summoned Visage##213686
|tip Avoid areas on the ground that are targeted in purple.
click Tzadah's Empowerment
Destroy Tzadah's Empowerment |q 77905/3 |goto 54.51,46.95 |count 3
step
kill Summoned Visage##213686
|tip Avoid areas on the ground that are targeted in purple.
click Tzadah's Empowerment
Destroy Tzadah's Empowerment |q 77905/3 |goto 58.68,46.50 |count 4
step
talk Rokhan##212782
turnin Avatar of Mueh'zala##77905 |goto 58.50,65.54
accept De Darkspear Loa##77906 |goto 58.50,65.54
step
click Loa Offering
Destroy Mueh'zala's Effigy |q 77906/1 |goto 58.74,66.27
step
click Loa Offering
Replace Mueh'zala's Effigy with Jani's |q 77906/2 |goto 58.74,66.27
step
talk Master Gadrin##213669
turnin De Darkspear Loa##77906 |goto 59.04,65.78
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Highmountain Tauren Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Highmountain Tauren Heritage Armor.",
patch='70305',
achieveid={12415},
},[[
step
Unlock the Highmountain Tauren Race |achieve 12245
|loadguide "Leveling Guides\\Allied Races\\Highmountain Tauren Race Unlock"
step
Raise a new Highmountain Tauren Character to Level 50 |achieve 12415
|tip Earn the "Heritage of the Highmountain" achievement.
|tip To earn this achievement, create a new Highmountain Tauren character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Highmountain##49783
|tip You will accept this quest automatically.
step
talk Mayla Highmountain##93826
turnin Heritage of the Highmountain##49783 |goto Thunder Totem/6 54.80,63.25
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Mag'har Orc Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Mag'har Heritage Armor.",
patch='80001',
achieveid={13077},
},[[
step
Unlock the Mag'har Orc Race |achieve 12518
|loadguide "Leveling Guides\\Allied Races\\Mag'har Orc Race Unlock"
step
Raise a new Mag'har Orc Character to Level 50 |achieve 13077
|tip Earn the "Heritage of the Mag'har" achievement.
|tip To earn this achievement, create a new Mag'har Orc character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Mag'har##51484
|tip You will accept this quest automatically.
step
talk Overlord Geya'rah##143845
turnin Heritage of the Mag'har##51484 |goto Orgrimmar/1 70.46,44.52
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Nightborne Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Nightborne Heritage Armor.",
patch='70305',
achieveid={12413},
},[[
step
Unlock the Nightborne Race |achieve 12244
|loadguide "Leveling Guides\\Allied Races\\Nightborne Race Unlock"
step
Raise a new Nightborne Character to Level 50 |achieve 12413
|tip Earn the "Heritage of the Nightborne" achievement.
|tip To earn this achievement, create a new Nightborne character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Nightborne##49784
|tip You will accept this quest automatically.
step
talk First Arcanist Thalyssra##131326
turnin Heritage of the Nightborne##49784 |goto Suramar/0 59.34,85.53
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Vulpera Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Vulpera Heritage Armor.",
patch='80300',
achieveid={14002},
},[[
step
Unlock the Vulpera Race |achieve 13206
|loadguide "Leveling Guides\\Allied Races\\Highmountain Tauren Race Unlock"
step
Raise a new Vulpera Character to Level 50 |achieve 14002
|tip Earn the "Heritage of the Vulpera" achievement.
|tip To earn this achievement, create a new Vulpera character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Vulpera##58435
|tip You will accept this quest automatically.
step
talk Hagashi##124108
turnin Heritage of the Vulpera##58435 |goto Vol'dun/0 56.78,49.80
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Heritage Armor\\Zandalari Troll Heritage Armor",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the Zandalari Troll Heritage Armor.",
patch='80105',
achieveid={13503},
},[[
step
Unlock the Zandalari Troll Race |achieve 13161
|loadguide "Leveling Guides\\Allied Races\\Nightborne Race Unlock"
step
Raise a new Zandalari Troll Character to Level 50 |achieve 13503
|tip Earn the "Heritage of the Zandalari" achievement.
|tip To earn this achievement, create a new Zandalari Troll character and level it to 50 without using a character boost.
|tip Using a character boost or race changing an existing level 50+ character will not award this achievement.
|tip Refer to our various leveling guides to help you accomplish this.
step
accept Heritage of the Zandalari##53721
|tip You will accept this quest automatically.
step
talk Queen Talanji##146335
turnin Heritage of the Zandalari##53721 |goto Dazar'alor/0 49.93,46.60
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Highmountain Tauren Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('HighmountainTauren') and not raceclass('DeathKnight') end,
condition_valid_msg="Highmountain Tauren only.",
condition_suggested=function() return raceclass('HighmountainTauren') and level < 10.5 and not completedq(50319) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Mayla Highmountain##93826
|tip Downstairs inside the building.
accept For the Horde##49773 |goto Thunder Totem/6 54.81,63.23
step
talk Ambassador Blackguard##133407
turnin For the Horde##49773 |goto Orgrimmar/1 39.40,79.56
accept Stranger in a Strange Land##50319 |goto Orgrimmar/1 39.40,79.56
step
talk Chromie##167032
Talk to Chromie |q 50319/1 |goto 40.82,80.15
step
talk Halian Shlavahawk##131201
turnin Stranger in a Strange Land##50319 |goto 40.78,80.39
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Mag'har Orc Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('MagharOrc') and not raceclass('DeathKnight') end,
condition_valid_msg="Mag'har Orc only.",
condition_suggested=function() return raceclass('MagharOrc') and level < 10.5 and not completedq(53502) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Overlord Geya'rah##143845
accept For the Horde##51485 |goto Orgrimmar/1 70.45,44.52
step
talk Ambassador Blackguard##133407
turnin For the Horde##51485 |goto Orgrimmar/1 39.40,79.56
accept Stranger in a Strange Land##53502 |goto Orgrimmar/1 39.40,79.56
step
talk Chromie##167032
Talk to Chromie |q 53502/1 |goto 40.82,80.15
step
talk Limbflayer Lasha##143979
turnin Stranger in a Strange Land##53502 |goto 40.78,80.39
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Nightborne Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('Nightborne') and not raceclass('DeathKnight') end,
condition_valid_msg="Nightborne only.",
condition_suggested=function() return raceclass('Nightborne') and level < 10.5 and not completedq(50303) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk First Arcanist Thalyssra##131326
accept For the Horde##49933 |goto Suramar/0 59.33,85.53
step
talk Ambassador Blackguard##133407
turnin For the Horde##49933 |goto Orgrimmar/1 39.40,79.56
accept Stranger in a Strange Land##50303 |goto Orgrimmar/1 39.40,79.56
step
talk Chromie##167032
Talk to Chromie |q 50303/1 |goto 40.82,80.15
step
talk Melitier Vahlouran##131328
turnin Stranger in a Strange Land##50303 |goto 40.78,80.39
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Vulpera Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('Vulpera') and not raceclass('DeathKnight') end,
condition_valid_msg="Vulpera only.",
condition_suggested=function() return raceclass('Vulpera') and level == 10 and not completedq(58124) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Nilsa##160452
accept For the Horde##58122 |goto Orgrimmar/1 64.64,46.51
step
talk Ambassador Blackguard##133407
turnin For the Horde##58122 |goto Orgrimmar/1 39.40,79.56
accept Stranger in a Strange Land##58124 |goto Orgrimmar/1 39.40,79.56
step
talk Chromie##167032
Talk to Chromie |q 58124/1 |goto 40.82,80.15
step
talk Nilsa##160452
turnin Stranger in a Strange Land##58124 |goto 40.78,80.39
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Zandalari Troll Starter",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Azuremyst",
condition_valid=function() return raceclass('ZandalariTroll') and not raceclass('DeathKnight') end,
condition_valid_msg="Zandalari Troll only.",
condition_suggested=function() return raceclass('ZandalariTroll') and level < 10.5 and not completedq(55138) and not raceclass('DeathKnight') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Starter Guides\\Chromie Time",
startlevel=10,
endlevel=11,
},[[
step
talk Queen Talanji##146335
accept For the Horde##55137 |goto Dazar'alor/0 49.93,46.60
step
click Portal to Orgrimmar
Take the Portal to Orgrimmar |q 55137/1 |goto 49.94,43.85
step
talk Ambassador Blackguard##133407
turnin For the Horde##55137 |goto Orgrimmar/1 39.40,79.56
accept Stranger in a Strange Land##55138 |goto Orgrimmar/1 39.40,79.56
step
talk Chromie##167032
Talk to Chromie |q 55138/1 |goto 40.82,80.15
step
talk Natal'hakata##150909
turnin Stranger in a Strange Land##55138 |goto 40.78,80.39
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Allied Race Death Knight Starter",{
author="support@zygorguides.com",
description="This guide will walk you through completing the brief introduction for Pandaren and Allied Race Death Knights.",
condition_suggested=function() return raceclass{'pandaren','highmountaintauren','zandalaritroll','nightborne','magharorc','vulpera'} and raceclass('DeathKnight') and level < 10.5 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass{'pandaren','highmountaintauren','zandalaritroll','nightborne','magharorc','vulpera'} and raceclass('DeathKnight') and level < 10.5 end,
condition_valid_msg="You must be a Pandaren or Allied Race Death Knight to complete this guide!",
condition_end=function() return completedq(58903) end,
},[[
step
talk The Lich King##163016
accept Death's Power Grows##58877 |goto The Frozen Throne/0 49.51,90.71
step
Swear Fealty |q 58877/1 |goto 49.51,90.71
|tip Use the {o}Swear Fealty{} ability.
|tip It appears as a button on the screen.
step
talk The Lich King##163016
turnin Death's Power Grows##58877 |goto 49.51,90.71
accept Defender of Azeroth##58903 |goto 49.51,90.71
step
talk Highlord Darion Mograine##161709
Tell him _"Reporting for duty."_ |gossip 51183
Speak with Highlord Darion Mograine |q 58903/1 |goto 50.70,71.16
step
click Death Gate
Use the Death Gate |q 58903/3 |goto 49.97,38.80
step
talk Chromie##167032
Talk to Chromie |q 58903/4 |goto Orgrimmar/1 40.82,80.16
step
_Click the Complete Quest Box:_
turnin Defender of Azeroth##58903
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Highmountain Tauren Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the new Highmountain Tauren allied race.",
condition_suggested=function() return achieved(10059) and not achieved(12245) end,
image=ZGV.IMAGESDIR.."HighmountainTaurenUnlock",
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Ji Firepaw##133523
|tip Inside the building.
accept The Call for Allies##49930 |goto Orgrimmar/1 37.77,81.17
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Call for Allies##49930 |goto Orgrimmar/1 37.78,81.15
accept A Choice of Allies##50242 |goto Orgrimmar/1 37.78,81.15
step
click Vulpera
|tip Inside the building.
Learn About the Vulpera |q 50242/5 |goto Orgrimmar/1 37.96,81.72
step
click Zandalari Troll
|tip Inside the building.
Learn About the Zandalari Trolls |q 50242/4 |goto Orgrimmar/1 37.77,81.69
step
click Highmountain Tauren
|tip Inside the building.
Learn About the Highmountain Tauren |q 50242/1 |goto Orgrimmar/1 37.57,81.57
step
click Nightborne
|tip Inside the building.
Learn About the Nightborne |q 50242/2 |goto Orgrimmar/1 37.44,81.38
step
click Mag'har Orc
|tip Inside the building.
Learn About the Mag'har Orcs |q 50242/3 |goto Orgrimmar/1 37.41,81.11
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin A Choice of Allies##50242 |goto Orgrimmar/1 37.76,81.17
accept A Feast for Our Kin##48066 |goto Orgrimmar/1 37.76,81.17
step
talk Baine Bloodhoof##93844
|tip Inside the building.
turnin A Feast for Our Kin##48066 |goto Thunder Bluff/0 61.65,52.10
step
Watch the dialogue
|tip Inside the building.
talk Baine Bloodhoof##129914
accept Shadow Over Thunder Bluff##48067 |goto Thunder Bluff/0 61.52,51.75
stickystart "Kill_Shadows_Of_Uul"
step
kill 4 Dark Tendril##125136 |q 48067/1 |goto Thunder Bluff/0 50.25,43.35
step
label "Kill_Shadows_Of_Uul"
kill 12 Shadow of Uul##125141 |q 48067/2 |goto Thunder Bluff/0 50.25,43.35
step
_Next to you:_
talk Baine Bloodhoof
turnin Shadow Over Thunder Bluff##48067
accept Dark Forces##49756
'|talk Baine Bloodhoof##130773
step
kill Qy'telek##130726 |q 49756/1 |goto Thunder Bluff/0 40.36,57.32
|tip He walks around this area.
step
_Next to you:_
talk Baine Bloodhoof
turnin Dark Forces##49756
accept Return to Highmountain##48079
'|talk Baine Bloodhoof##130773
step
Ride the elevator down |goto Thunder Totem/0 49.33,46.15 < 10 |walk
talk Mayla Highmountain##108434
|tip Downstairs inside the building.
turnin Return to Highmountain##48079 |goto Thunder Totem/6 68.82,71.21
step
talk Spiritwalker Graysky##105085
|tip Downstairs inside the building.
accept Dark Tales##41884 |goto 68.38,72.97
step
talk Spiritwalker Graysky##125454
|tip Inside the building.
turnin Dark Tales##41884 |goto Highmountain/0 38.51,69.10
accept Walking in Their Footsteps##41764 |goto Highmountain/0 38.51,69.10
step
click Water of Vision##248865
|tip Inside the building.
Use the Water of Vision |q 41764/1 |goto 38.53,69.17
stickystart "Kill_Shadows_Of_Uul_125141"
step
kill 8 Shadow Lurker##105069 |q 41764/2 |goto Highmountain/0 41.49,72.58
|tip Use the abilities on your action bar.
|tip Inside and outside the cave.
step
label "Kill_Shadows_Of_Uul_125141"
kill 15 Shadow of Uul##125141 |q 41764/3 |goto Highmountain/0 41.49,72.58
|tip Use the abilities on your action bar. |notinsticky
|tip Inside and outside the cave. |notinsticky
step
click Bitestone Ward
|tip Upstairs inside the cave.
|tip Use the {o}Rockfall{} ability to jump on the rocks to reach the upper floor.
Place the Bitestone Ward |q 41764/4 |goto 46.16,73.66
step
talk Spiritwalker Graysky##125454
|tip Inside the building.
turnin Walking in Their Footsteps##41764 |goto 38.51,69.10
accept Shadow of the Sepulcher##48185 |goto 38.51,69.10
step
talk Spiritwalker Graysky##125459
|tip Inside the building.
turnin Shadow of the Sepulcher##48185 |goto 57.01,46.21
accept Minions of the Darkness##41799 |goto 57.01,46.21
step
click Water of Vision##248865
|tip Inside the building.
Use the Water of Vision |q 41799/1 |goto 57.05,46.16
step
kill 12 Dark Spirit##104872 |q 41799/2 |goto 55.98,45.52
|tip Use the abilities on your action bar.
step
kill 6 Shadowy Tendril##130418 |q 41799/3 |goto Highmountain/0 55.10,44.22
|tip Inside the cave.
|tip Use the abilities on your action bar.
step
kill Shadow of the Darkness##132090 |q 41799/4 |goto 55.36,40.85
|tip Inside the cave.
|tip Use the abilities on your action bar.
step
click Sepulcher Ward
|tip Inside the cave.
Place the Sepulcher Ward |q 41799/5 |goto 54.74,40.62
step
talk Spiritwalker Graysky##125459
|tip Inside the building.
turnin Minions of the Darkness##41799 |goto 57.01,46.21
accept Huln's Mountain##48190 |goto 57.01,46.21
step
talk Spiritwalker Graysky##125466
turnin Huln's Mountain##48190 |goto 53.32,64.01
accept Servants of the Darkness##41800 |goto 53.32,64.01
step
clicknpc Spiritwalker Graysky##125829
Use the Water of Vision |q 41800/1 |goto 53.32,64.01
step
kill 10 Necrodark Defiler##104888 |q 41800/2 |goto 53.16,66.45
step
kill Necrogg the Darkspeaker##104890 |q 41800/3 |goto Highmountain/0 52.45,68.18
|tip He patrols up and down the hill
step
click Snowmane Ward##3365
|tip Inside the building.
Place the Snowmane Ward |q 41800/4 |goto 53.33,69.48
step
talk Spiritwalker Graysky##125466
turnin Servants of the Darkness##41800 |goto 53.32,64.01
accept How Fares Ebonhorn?##48434 |goto 53.32,64.01
step
Ride the elevator down |goto Thunder Totem/0 49.33,46.15 < 10 |walk
talk Spiritwalker Ebonhorn##124252
|tip Downstairs inside the building.
turnin How Fares Ebonhorn?##48434 |goto Thunder Totem/6 67.77,71.40
step
talk Mayla Highmountain##108434
|tip Downstairs inside the building.
accept Curse of the Necrodark##41815 |goto 68.72,71.03
step
talk Baine Bloodhoof##130423
|tip On top of the mountain.
turnin Curse of the Necrodark##41815 |goto Highmountain/0 56.49,89.23
accept Ice and Shadow##41840 |goto Highmountain/0 56.49,89.23
step
talk Jale Rivermane##97662
|tip On top of the mountain.
accept Whispers of the Darkness##41882 |goto 56.46,89.33
stickystart "Collect_Shadowice_Shards"
step
clicknpc Highmountain Protector##132212+
|tip They look like {o}Tauren{}.
|tip On top of the mountain.
Free #6# Highmountain Protectors |q 41882/1 |goto Highmountain/0 57.32,91.02
'|clicknpc Highmountain Protector##132216
step
label "Collect_Shadowice_Shards"
Kill enemies around this area
|tip On top of the mountain. |notinsticky
collect 20 Shadowice Shard##136400 |q 41840/1 |goto Highmountain/0 57.32,91.02
'|kill Frozen Mist##104979, Necrodark Greysworn##104565, Dark Tendril##130425, Necrodark Defiler##104888
step
talk Spiritwalker Ebonhorn##105213
|tip On top of the mountain.
turnin Whispers of the Darkness##41882 |goto 57.55,92.34
turnin Ice and Shadow##41840 |goto 57.55,92.34
accept The Final Ward##41841 |goto 57.55,92.34
step
click Summit Ward
|tip Inside the cave.
Place the Summit Ward |q 41841/1 |goto 56.49,91.44
step
talk Spiritwalker Ebonhorn##105213
|tip Inside the cave.
turnin The Final Ward##41841 |goto 56.81,92.02
accept The Darkness##48403 |goto 56.81,92.02
step
kill Uul'gyneth##126001 |q 48403/1 |goto Highmountain/0 57.94,90.83
|tip On top of the mountain.
step
talk Mayla Highmountain##104997
|tip On top of the mountain.
turnin The Darkness##48403 |goto 56.66,92.71
step
talk Baine Bloodhoof##126134
|tip On top of the mountain.
accept Together We Are the Horde!##48433 |goto Highmountain/0 56.70,92.76
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin Together We Are the Horde!##48433 |goto Orgrimmar/1 37.77,81.16
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Mag'har Orc Race Unlock",{
author="support@zygorguides.com",
description="To unlock the new Mag'har Orc allied race, you will need to earn exalted reputation with The Honorbound and complete the Horde War Campaign.",
condition_suggested=function() return achieved(12509) and not achieved(12518) end,
condition_end=function() return achieved(12518) end,
image=ZGV.IMAGESDIR.."MagHarOrcUnlock",
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Ji Firepaw##133523
|tip Inside the building.
accept The Call for Allies##49930 |goto Orgrimmar/1 37.77,81.17
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Call for Allies##49930 |goto Orgrimmar/1 37.78,81.15
accept A Choice of Allies##50242 |goto Orgrimmar/1 37.78,81.15
step
click Vulpera
|tip Inside the building.
Learn About the Vulpera |q 50242/5 |goto Orgrimmar/1 37.96,81.72
step
click Zandalari Troll
|tip Inside the building.
Learn About the Zandalari Trolls |q 50242/4 |goto Orgrimmar/1 37.77,81.69
step
click Highmountain Tauren
|tip Inside the building.
Learn About the Highmountain Tauren |q 50242/1 |goto Orgrimmar/1 37.57,81.57
step
click Nightborne
|tip Inside the building.
Learn About the Nightborne |q 50242/2 |goto Orgrimmar/1 37.44,81.38
step
click Mag'har Orc
|tip Inside the building.
Learn About the Mag'har Orcs |q 50242/3 |goto Orgrimmar/1 37.41,81.11
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin A Choice of Allies##50242 |goto Orgrimmar/1 37.76,81.17
accept Vision of Time##53466 |goto Orgrimmar/1 37.76,81.17
step
click Portal to Zuldazar
|tip Inside the building.
|tip In the portal room.
Teleport to Zuldazar |complete zone("Zuldazar") |goto Orgrimmar/1 58.54,91.30 |q 53466
step
talk Chief Telemancer Oculeth##131443
|tip Inside the building.
|tip At the top of the temple.
turnin Vision of Time##53466 |goto Dazar'alor/1 67.15,73.79
accept Caverns of Time##53467 |goto Dazar'alor/1 67.15,73.79
step
talk Anachronos##15192
|tip Downstairs inside the Caverns of Time cave.
turnin Caverns of Time##53467 |goto Tanaris/18 41.78,49.91
accept Echo of Gul'dan##53354 |goto Tanaris/18 41.78,49.91
step
click Time Rift
Watch the dialogue
kill Echo of Gul'dan##143505 |q 53354/1 |goto Blasted Lands/0 54.43,50.45
step
talk Anachronos##143692
turnin Echo of Gul'dan##53354 |goto 54.39,50.09
accept Echo of Warlord Zaela##53353 |goto 54.39,50.09
step
Enter the building |goto Kun-Lai Summit/0 68.61,45.99 < 20 |walk
click Time Rift
|tip Inside the building.
Watch the dialogue
kill Echo of Warlord Zaela##143504 |q 53353/1 |goto Kun-Lai Summit/0 68.81,43.69
step
talk Anachronos##143692
|tip Inside the building.
turnin Echo of Warlord Zaela##53353 |goto 68.90,43.97
accept Echo of Garrosh Hellscream##53355 |goto 68.90,43.97
step
talk Anachronos##144225
Tell him _"I am ready to seek the Echo of Garrosh."_ |gossip 49251
|tip You will be teleported away.
Meet Anachronos Outside Orgrimmar |q 53355/1 |goto Durotar/0 40.80,16.36
step
_Inside the Inner Sanctum Raid:_
click Time Rift
|tip {o}Jump down next to the yellow dragon{}, into the big room below.
|tip It will appear on your {o}minimap{} as a {o}yellow dot{}.
Watch the dialogue
kill Echo of Garrosh Hellscream##143425 |q 53355/2
step
Leave The Inner Sanctum |complete zone("Durotar") |q 53355
|tip {o}Right-click{} your {o}character portrait{}.
|tip Choose {o}Leave Instance Group{}.
step
click Portal to Zuldazar
|tip Inside the building.
|tip In the portal room.
Teleport to Zuldazar |complete zone("Zuldazar") |goto Orgrimmar/1 58.54,91.30 |q 53355
step
talk Chief Telemancer Oculeth##131443
|tip Inside the building.
|tip At the top of the temple.
turnin Echo of Garrosh Hellscream##53355 |goto Dazar'alor/1 67.15,73.79
step
talk Eitrigg##126066
|tip Inside the building.
|tip At the top of the temple.
accept Restoring Old Bonds##52942 |goto 70.60,69.21
step
talk Chief Telemancer Oculeth##131443
|tip Inside the building.
|tip At the top of the temple.
Tell him _"I am ready to go to Draenor."_ |gossip 48137
Speak with Oculeth to go to Draenor |q 52942/1 |goto 67.15,73.79
step
Travel to Gorgrond |goto Gorgrond Maghar Scenario/0 41.13,53.19 < 20 |noway |c |q 52942
step
Watch the dialogue
|tip Follow {o}Eitrigg{}.
|tip You will be captured and taken away.
Click Here After You Are Captured |confirm |goto 41.59,53.38 |q 52942
'|clicknpc Eitrigg##142422
step
Watch the dialogue
Meet the Overlord |q 52942/2 |goto Gorgrond Maghar Scenario/0 44.88,52.97 |notravel
step
talk Eitrigg##142422
turnin Restoring Old Bonds##52942 |goto 44.94,53.12
accept Calling Out the Clans##52943 |goto 44.94,53.12
step
click Blackrock Banner
Salute the Blackrock Clan |q 52943/1 |goto 45.16,52.66
step
click Warsong Banner
Salute the Warsong Clan |q 52943/2 |goto 45.48,51.95
step
click Frostwolf Banner
Salute the Frostwolf Clan |q 52943/3 |goto 44.82,52.00
step
talk Overlord Geya'rah##142109
|tip She walks to this location.
turnin Calling Out the Clans##52943 |goto 45.14,52.13
step
Watch the dialogue
talk Grommash Hellscream##142275
accept Bonds Forged Through Battle##52945 |goto 45.26,52.09
step
Kill enemies around this area
|tip Inside and outside the cave.
|tip The {o}next step{} is {o}inside the cave{}.
Slay #10# Kor'gall Defectors |q 52945/1 |goto 38.58,67.38
'|kill Kor'gall Agitator##143971, Kor'gall Defector##141074
step
Follow the path inside the cave |goto 36.79,68.07 < 15 |walk
Watch the dialogue
|tip Inside the cave.
kill Kor'gall Greatson of Kor'gal##140949 |q 52945/2 |goto 36.48,70.05
step
_Next to you:_
talk Overlord Geya'rah##137837
turnin Bonds Forged Through Battle##52945
accept Tyranny of the Light##52955
step
Watch the dialogue
Begin the Tryanny of the Light Scenario |scenariostart Tyranny of the Light##1575 |q 52955
step
Leave the cave |goto 38.55,67.39 < 20 |walk |only if subzone("Throne of Kor'gall") and indoors()
Accompany Geya'rah to Beastwatch |scenariostage 1 |goto Gorgrond Maghar Scenario/0 43.89,69.45 |q 52955
step
Kill enemies around this area
clicknpc Lightbound Battery##141179+
|tip They look like {o}white and gold artillery machines{}.
|tip They will appear on your {o}minimap{} as {o}yellow dots{}.
Defend Beastwatch Against the Lightbound Assault |scenariostage 2 |goto Gorgrond Maghar Scenario/0 45.69,76.14 |q 52955
'|kill Lightbound Warpriest##141169, Lightbound Vigilant##141166, Lightbound Sharpshooter##141170, Lightbound Bulwark##141171, Lightbound Battlemage##141172
step
Look for Exarch Orelis in Evermorn Hold |scenariostage 3 |goto 45.50,78.57 |q 52955
step
Watch the dialogue
kill Exarch Orelis##142511 |scenariostage 4 |goto 45.27,80.34 |q 52955
'|kill Exarch Orelis##141174
step
Meet with Grommash |scenariostage 5 |goto 44.55,71.38 |q 52955
step
Watch the dialogue
Await Orders from the Warchief |scenariostage 6 |goto 44.55,71.38 |q 52955
step
click Mag'har Turret
|tip At the top of the tower.
Kill enemies around this area
|tip They are on the ground nearby.
|tip Use the abilities on your action bar.
Defeat the Lightbound Soldiers |scenariostage 7 |goto 43.63,71.43 |q 52955
step
Watch the dialogue
Return to the Warchief and Await Further Orders |scenariostage 8 |goto 44.55,71.37 |q 52955
step
Watch the dialogue
Escape from Draenor |scenarioend |goto 44.55,71.37 |q 52955
step
Return to Durotar |complete zone("Durotar") |q 52955
step
talk Overlord Geya'rah##143845
turnin Tyranny of the Light##52955 |goto Durotar/0 41.25,16.77
accept The Uncorrupted##51479 |goto Durotar/0 41.25,16.77
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Uncorrupted##51479 |goto Orgrimmar/1 37.78,81.15
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Nightborne Race Unlock",{
author="support@zygorguides.com",
description="This guide will walk you through unlocking the new Nightborne allied race.",
condition_suggested=function() return achieved(11340) and not achieved(12244) end,
image=ZGV.IMAGESDIR.."NightborneUnlock",
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Ji Firepaw##133523
|tip Inside the building.
accept The Call for Allies##49930 |goto Orgrimmar/1 37.77,81.17
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Call for Allies##49930 |goto Orgrimmar/1 37.78,81.15
accept A Choice of Allies##50242 |goto Orgrimmar/1 37.78,81.15
step
click Vulpera
|tip Inside the building.
Learn About the Vulpera |q 50242/5 |goto Orgrimmar/1 37.96,81.72
step
click Zandalari Troll
|tip Inside the building.
Learn About the Zandalari Trolls |q 50242/4 |goto Orgrimmar/1 37.77,81.69
step
click Highmountain Tauren
|tip Inside the building.
Learn About the Highmountain Tauren |q 50242/1 |goto Orgrimmar/1 37.57,81.57
step
click Nightborne
|tip Inside the building.
Learn About the Nightborne |q 50242/2 |goto Orgrimmar/1 37.44,81.38
step
click Mag'har Orc
|tip Inside the building.
Learn About the Mag'har Orcs |q 50242/3 |goto Orgrimmar/1 37.41,81.11
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin A Choice of Allies##50242 |goto Orgrimmar/1 37.76,81.17
accept Thalyssra's Estate##49973 |goto Orgrimmar/1 37.76,81.17
step
talk Lady Liadrin##131478
turnin Thalyssra's Estate##49973 |goto Suramar/0 65.88,63.72
accept Silvermoon City##49613 |goto 65.88,63.72
step
talk Lady Liadrin##130133
|tip Inside the building.
turnin Silvermoon City##49613 |goto Silvermoon City/0 58.12,19.88
accept Remember the Sunwell##49354 |goto Silvermoon City/0 58.12,19.88
step
click Portal to the Sunwell
|tip Inside the building.
Enter the Scenario |scenariostart Remember the Sunwell##1443 |goto 53.95,19.49 |q 49354
step
Meet with Liadrin |scenariogoal Meet with Liadrin.##1/38106 |goto Shrine of the Eclipse/1 61.10,71.48 |q 49354
step
Watch the dialogue
|tip Follow {o}First Arcanist Thalyssra{}.
Walk with Thalyssra |scenariogoal Walk with Thalyssra##2/38160 |goto Shrine of the Eclipse/1 50.74,65.27 |q 49354
'|clicknpc First Arcanist Thalyssra##129023
step
Kill enemies around this area
Defeat the Void Attacker |scenariogoal Defeat the Sunwell Guardians##3/38161 |goto Shrine of the Eclipse/1 50.74,65.27 |q 49354
'|kill Creeping Void##126489, Void Effusion##130139, Void Fragment##126538
step
kill Aruun the Darkener##129659 |scenariogoal Aruun the Darkener slain##4/38162 |goto 48.69,66.06 |q 49354
step
Watch the dialogue
Close the Void Rift |scenariogoal Void rift closed##5/38519 |goto Shrine of the Eclipse/1 50.26,65.38 |q 49354
step
Leave the Sunwell |scenariogoal Leave the Sunwell##6/38163 |goto Shrine of the Eclipse/1 61.98,67.33 |q 49354
step
click Silvermoon Translocator
Return to Silvermoon City |complete zone("Silvermoon City") |goto Shrine of the Eclipse/1 61.98,67.33 |q 49354
step
talk Lady Liadrin##130133
|tip Inside the building.
turnin Remember the Sunwell##49354 |goto Silvermoon City/0 58.45,19.09
accept The Nightborne##49614 |goto Silvermoon City/0 58.45,19.09
step
click Portal to Orgrimmar
|tip Inside the building.
Return to Orgrimmar |complete zone("Orgrimmar") |goto Silvermoon City/0 58.53,18.67 |q 49614
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Nightborne##49614 |goto Orgrimmar/1 37.77,81.16
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Vulpera Race Unlock",{
author="support@zygorguides.com",
description="To unlock the new Vulpera allied race, you will need to earn the \"Secrets in the Sands\" achievement.",
keywords={"8.3","N'zoth","Nzoth","Corruption"},
condition_suggested=function() return achieved(12478) and not achieved(13206) end,
condition_end=function() return achieved(13206) end,
image=ZGV.IMAGESDIR.."VulperaUnlock",
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Ji Firepaw##133523
|tip Inside the building.
accept The Call for Allies##49930 |goto Orgrimmar/1 37.77,81.17
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Call for Allies##49930 |goto Orgrimmar/1 37.78,81.15
accept A Choice of Allies##50242 |goto Orgrimmar/1 37.78,81.15
step
click Vulpera
|tip Inside the building.
Learn About the Vulpera |q 50242/5 |goto Orgrimmar/1 37.96,81.72
step
click Zandalari Troll
|tip Inside the building.
Learn About the Zandalari Trolls |q 50242/4 |goto Orgrimmar/1 37.77,81.69
step
click Highmountain Tauren
|tip Inside the building.
Learn About the Highmountain Tauren |q 50242/1 |goto Orgrimmar/1 37.57,81.57
step
click Nightborne
|tip Inside the building.
Learn About the Nightborne |q 50242/2 |goto Orgrimmar/1 37.44,81.38
step
click Mag'har Orc
|tip Inside the building.
Learn About the Mag'har Orcs |q 50242/3 |goto Orgrimmar/1 37.41,81.11
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin A Choice of Allies##50242 |goto Orgrimmar/1 37.76,81.17
accept Guests at Grommash Hold##53870 |goto Orgrimmar/1 37.76,81.17
step
talk Kiro##145416
|tip Inside the building.
turnin Guests at Grommash Hold##53870 |goto 48.90,72.76
accept A Declaration of Intent##53889 |goto 48.90,72.76
step
Watch the dialogue
|tip Inside the building.
Witness Kiro's Declaration |q 53889/1 |goto 48.90,72.76
step
talk Kiro##145416
|tip He walks to this location.
|tip Inside the building.
turnin A Declaration of Intent##53889 |goto 48.90,72.76
accept New Allies, New Problems##53890 |goto 48.90,72.76
step
talk Commander Dresh##145532
|tip Inside the building.
Ask him _"Why have you come here?"_ |gossip 50949
Question Commander Dresh |q 53890/1 |goto 48.21,71.74
step
talk First Arcanist Thalyssra##145531
|tip Inside the building.
Ask her _"Why have you come here?"_ |gossip 50948
Question First Arcanist Thalyssra |q 53890/3 |goto 48.65,71.27
step
talk Bladeguard Sonji##145533
|tip Inside the building.
Ask her _"Why have you come here?"_ |gossip 50947
Question Bladeguard Sonji |q 53890/2 |goto 48.68,71.63
step
talk Kiro##145416
|tip Inside the building.
turnin New Allies, New Problems##53890 |goto 48.90,72.76
accept No Problem Too Small##53891 |goto 48.90,72.76
step
talk Kiro##145641
turnin No Problem Too Small##53891 |goto Twilight Highlands/0 44.11,73.48
accept Where Are the Workers?##53892 |goto Twilight Highlands/0 44.11,73.48
step
Follow Kiro |q 53892/1 |goto 46.82,66.23
step
Watch the dialogue
|tip Inside the building.
Investigate the Peon Hideout |q 53892/2 |goto 46.13,65.63
step
talk Crushblow Peon##145717+
|tip Inside the building.
Ask them _"Why aren't you working?"_				- The NPCs all have different ids, and offer different gossip
Question #3# Peons |q 53892/3 |goto 46.04,65.56
'|talk Crushblow Peon##145721, Crushblow Peon##145725, Crushblow Peon##145724, Crushblow Peon##145720, Crushblow Peon##145657, Crushblow Peon##145719, Crushblow Peon##145717, Crushblow Peon##145658, Crushblow Peon##145727, Crushblow Peon##145722, Crushblow Peon##145723
step
talk Kiro##145641
turnin Where Are the Workers?##53892 |goto 46.81,66.22
accept A Little Goodwill##53893 |goto 46.81,66.22
accept Worthwhile Repairs##53894 |goto 46.81,66.22
accept Peon Promotions!##53895 |goto 46.81,66.22
step
talk Crushblow Peon##145717
|tip Inside the building.
Tell him _"Job well done. You've been promoted to Peon, Rank 2."_
Promote the Peon |q 53895/1 |goto 46.09,65.64 |count 1
'|talk Crushblow Peon##145721, Crushblow Peon##145725, Crushblow Peon##145724, Crushblow Peon##145720, Crushblow Peon##145657, Crushblow Peon##145719, Crushblow Peon##145717, Crushblow Peon##145658, Crushblow Peon##145727, Crushblow Peon##145722, Crushblow Peon##145723
step
talk Crushblow Peon##145717
|tip Inside the building.
Tell him _"Good work. You've been promoted to Senior Peon."_
Promote the Peon |q 53895/1 |goto 46.09,65.56 |count 2
'|talk Crushblow Peon##145721, Crushblow Peon##145725, Crushblow Peon##145724, Crushblow Peon##145720, Crushblow Peon##145657, Crushblow Peon##145719, Crushblow Peon##145717, Crushblow Peon##145658, Crushblow Peon##145727, Crushblow Peon##145722, Crushblow Peon##145723
step
talk Crushblow Peon##145717
|tip Inside the building.
Tell him _"Congratulations! You've been promoted to Lead Peon."_
Promote the Peon |q 53895/1 |goto 46.12,65.53 |count 3
'|talk Crushblow Peon##145721, Crushblow Peon##145725, Crushblow Peon##145724, Crushblow Peon##145720, Crushblow Peon##145657, Crushblow Peon##145719, Crushblow Peon##145717, Crushblow Peon##145658, Crushblow Peon##145727, Crushblow Peon##145722, Crushblow Peon##145723
stickystart "Collect_Clucker_Tidbits"
stickystart "Collect_Saber_Flanks"
step
click Twilight Ore##307836+
|tip They look like {o}grey mining veins{}.
collect 15 Twilight Ore##164927 |q 53894/1 |goto Twilight Highlands/0 47.83,70.53
step
label "Collect_Clucker_Tidbits"
use the Enlarging Totem##171356
|tip Use it near {o}Highlands Cluckers{}.
|tip They look like {o}tiny birds{}.
kill Highlands Clucker##157590+
collect 100 Clucker Tidbits##171358 |q 53893/3 |goto Twilight Highlands/0 46.98,69.32
stickystart "Collect_Worg_Meat"
step
label "Collect_Saber_Flanks"
use the Enlarging Totem##171356
|tip Use it near {o}Twilight Prowlers{}.
|tip They look like {o}large purple cats{}.
kill Twilight Prowler##145736+
collect 100 Saber Flank##164926 |q 53893/1 |goto Twilight Highlands/0 46.98,69.32
step
label "Collect_Worg_Meat"
use the Enlarging Totem##171356
|tip Use it near {o}Highland Worgs{}.
|tip They look like {o}black wolves{}.
kill Highland Worg##157589+
collect 100 Worg Meat##171357 |q 53893/2 |goto Twilight Highlands/0 51.41,68.36
step
talk Kiro##145641
turnin A Little Goodwill##53893 |goto 46.81,66.22
turnin Worthwhile Repairs##53894 |goto 46.81,66.22
turnin Peon Promotions!##53895 |goto 46.81,66.22
accept A Party in Your Honor##53897 |goto 46.81,66.22
step
talk Foreman Magrok##145651
|tip Inside the building.
Tell him _"The Horde are throwing a party in your honor."_ |gossip 49582
Invite Foreman Magrok |q 53897/1 |goto 45.92,65.50
step
talk Kiro##145641
turnin A Party in Your Honor##53897 |goto 45.05,76.24
accept Strength and Honor##53898 |goto 45.05,76.24
step
talk Foreman Magrok##145978
Tell him _"I challenge you to battle!"_ |gossip 49581
Confront Foreman Magrok |q 53898/1 |goto 45.66,76.42
step
kill Foreman Magrok##145978
Defeat Foreman Magrok |q 53898/2 |goto 45.66,76.42
step
talk Kiro##145641
turnin Strength and Honor##53898 |goto 45.05,76.24
accept Job's Done##54026 |goto 45.05,76.24
step
talk Commander Dresh##145532
|tip Inside the building.
turnin Job's Done##54026 |goto Orgrimmar/1 48.21,71.73
step
talk Kiro##146261
|tip Inside the building.
accept On the Outskirts##53899 |goto 49.02,73.67
step
click Portal to Zuldazar
|tip Inside the building.
|tip In the portal room.
Teleport to Zuldazar |complete zone("Zuldazar") |goto Orgrimmar/1 58.54,91.30 |q 53899
step
talk Nisha##145980
turnin On the Outskirts##53899 |goto Zuldazar/0 74.86,63.03
accept We'll Use Their Weapons##53900 |goto Zuldazar/0 74.86,63.03
accept Explosions Always Work##53901 |goto Zuldazar/0 74.86,63.03
accept Destroying the Source##58087 |goto Zuldazar/0 74.86,63.03
stickystart "Collect_Nazeshi_Weaponry"
step
click Nazeshi Powercell
Destroy the Nazeshi Powercell |q 58087/1 |goto Zuldazar/0 77.12,63.83 |count 1
step
click Nazeshi Powercell
Destroy the Nazeshi Powercell |q 58087/1 |goto Zuldazar/0 75.73,64.88 |count 2
step
click Nazeshi Powercell
Destroy the Nazeshi Powercell |q 58087/1 |goto Zuldazar/0 76.62,66.52 |count 3
step
click Volatile Explosives+
|tip They look like {o}yellow bundles of dynamite{} on {o}harpoon launchers{}.
Place #8# Explosives |q 53901/1 |goto Zuldazar/0 74.72,67.55
step
Detonate the Explosives |q 53901/2
|tip Use the {o}Detonate{} ability.
|tip It appears as a button on the screen.
step
label "Collect_Nazeshi_Weaponry"
Kill enemies around this area
|tip They look like {o}naga{}.
Collect #10# Nazeshi Weaponry |q 53900/1 |goto Zuldazar/0 75.42,65.05
'|kill Nazeshi Tempest-Wielder##128604, Nazeshi Overseer##128632, Nazeshi Overseer##128632
step
talk Nisha##145980
turnin We'll Use Their Weapons##53900 |goto 74.86,63.03
turnin Explosions Always Work##53901 |goto 74.86,63.03
turnin Destroying the Source##58087 |goto 74.86,63.03
accept Taking Out the Tidecaller##53902 |goto 74.86,63.03
step
kill Tidecaller Nezara##157734 |q 53902/1 |goto 77.19,65.36
step
_Next to you:_
talk Nisha
turnin Taking Out the Tidecaller##53902
accept Threat Contained##54027
'|talk Nisha##158672
step
talk Bladeguard Sonji##145533
|tip Inside the building.
turnin Threat Contained##54027 |goto Orgrimmar/1 48.67,71.62
step
talk Kiro##146261
|tip Inside the building.
accept Meet with Meerah##53903 |goto 49.02,73.67
step
talk Meerah##146264
turnin Meet with Meerah##53903 |goto Suramar/0 58.93,55.08
accept The Vintner's Assistants##53904 |goto Suramar/0 58.93,55.08
step
talk Boss Mida##146277
|tip Inside the building.
Ask her _"What are you tasked with?"_ |gossip 50800
Speak to Boss Mida |q 53904/2 |goto 60.69,56.37
step
talk Micah Broadhoof##146276
|tip Inside the building.
Ask him _"What are you tasked with?"_ |gossip 50796
Speak to Micah Broadhoof |q 53904/1 |goto 61.22,55.15
step
talk Nomi##146273
Ask him _"What are you tasked with?"_ |gossip 50792
Speak to Nomi |q 53904/3 |goto 62.42,57.64
step
talk Meerah##146264
turnin The Vintner's Assistants##53904 |goto 58.93,55.08
accept Playing to Their Strengths##53905 |goto 58.93,55.08
step
talk Boss Mida##146277
|tip Inside the building.
Tell her _"You should be obtaining ingredients."_ |gossip 50801
Assign Boss Mida |q 53905/2 |goto 60.69,56.37
step
talk Micah Broadhoof##146276
|tip Inside the building.
Tell him _"You should be stomping fruit."_ |gossip 50798
Assign Micah Broadhoof |q 53905/1 |goto 61.22,55.15
step
talk Nomi##146273
Tell him _"You should be creating the recipe."_ |gossip 50793
Assign Nomi |q 53905/3 |goto 62.42,57.64
step
talk Vintner Iltheux##146270
|tip Inside the building.
Tell him _"We've made some adjustments to your production pipeline."_ |gossip 50791
Inform Vintner Iltheux |q 53905/4 |goto 58.79,55.42
step
talk Meerah##146264
|tip Inside the building.
turnin Playing to Their Strengths##53905 |goto 58.80,55.53
step
talk Vintner Iltheux##146270
|tip Inside the building.
Tell him _"We've made some adjustments to your production pipeline."_
Inform Vintner Iltheux |q 53905/4 |goto 58.78,55.42
step
talk Meerah##157668
|tip Inside the building.
turnin Playing to Their Strengths##53905 |goto 58.80,55.54
accept A Particular Process##54036 |goto 58.80,55.54
step
talk Nomi##146301
|tip Inside the building.
turnin A Particular Process##54036 |goto 60.60,56.22
accept Fermented for the Horde##53906 |goto 60.60,56.22
step
talk Boss Mida##146305
|tip Inside the building.
buy 10 Fermented Firebloom##165013 |q 53906/2 |goto 61.37,55.36
step
kill Tattered Silkwing##146321+
collect 20 Silkwing Fibers##165012 |q 53906/1 |goto Suramar/0 62.75,56.82
step
talk Nomi##146301
|tip Inside the building.
turnin Fermented for the Horde##53906 |goto 60.60,56.22
accept Sip and Savor##53907 |goto 60.60,56.22
step
click Nightborne Vat##310243
|tip Inside the building.
collect Nomi's Wine##165014 |q 53907/1 |goto 60.60,56.36
step
talk Vintner Iltheux##146270
|tip Inside the building.
Select  _"<Give Vintner Iltheux the sample of Nomi's Wine.>"_ |gossip 50790
Watch the dialogue
Deliver the Sample to Vintner Iltheux |q 53907/2 |goto 58.79,55.42
step
talk Meerah##157685
|tip Inside the building.
turnin Sip and Savor##53907 |goto 58.80,55.53
accept Awaiting Our Arrival##53908 |goto 58.80,55.53
step
talk Baine Bloodhoof##145424
|tip Inside the building.
turnin Awaiting Our Arrival##53908 |goto Orgrimmar/1 48.30,71.07
accept New Allies Among Us##57448 |goto Orgrimmar/1 48.30,71.07
step
Watch the dialogue
|tip Inside the building.
Witness Baine Welcome the Vulpera to the Horde |q 57448/1 |goto 48.30,71.07
step
talk Kiro##157693
|tip Inside the building.
turnin New Allies Among Us##57448 |goto 48.44,71.50
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Allied Races\\Zandalari Troll Race Unlock",{
author="support@zygorguides.com",
description="To unlock the new Zandalari Troll allied race, you will need to earn the \"Zandalar Forever!\" "..
"and \"Tides of Vengeance\" achievements.",
condition_suggested=function() return (achieved(13466) and achieved(12479)) and not achieved(13161) end,
condition_end=function() return achieved(13161) end,
image=ZGV.IMAGESDIR.."ZandalariTrollUnlock",
},[[
step
Reach Level 40 |ding 40
|tip You must be level 40 to start allied race quests.
step
talk Ji Firepaw##133523
|tip Inside the building.
accept The Call for Allies##49930 |goto Orgrimmar/1 37.77,81.17
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin The Call for Allies##49930 |goto Orgrimmar/1 37.78,81.15
accept A Choice of Allies##50242 |goto Orgrimmar/1 37.78,81.15
step
click Vulpera
|tip Inside the building.
Learn About the Vulpera |q 50242/5 |goto Orgrimmar/1 37.96,81.72
step
click Zandalari Troll
|tip Inside the building.
Learn About the Zandalari Trolls |q 50242/4 |goto Orgrimmar/1 37.77,81.69
step
click Highmountain Tauren
|tip Inside the building.
Learn About the Highmountain Tauren |q 50242/1 |goto Orgrimmar/1 37.57,81.57
step
click Nightborne
|tip Inside the building.
Learn About the Nightborne |q 50242/2 |goto Orgrimmar/1 37.44,81.38
step
click Mag'har Orc
|tip Inside the building.
Learn About the Mag'har Orcs |q 50242/3 |goto Orgrimmar/1 37.41,81.11
step
talk Ji Firepaw##133523
|tip Inside the building.
turnin A Choice of Allies##50242 |goto Orgrimmar/1 37.76,81.17
accept A Royal Occasion##53831 |goto Orgrimmar/1 37.76,81.17
step
click Portal to Zuldazar
|tip Inside the building.
|tip In the portal room.
Teleport to Zuldazar |complete zone("Zuldazar") |goto Orgrimmar/1 58.54,91.30 |q 53831
step
Meet the Zandalari Emissary |q 53831/2 |goto Dazar'alor/1 48.62,22.02
|tip Inside the building.
|tip At the top of the temple.
step
talk Natal'hakata##145414
|tip Inside the building.
|tip At the top of the temple.
turnin A Royal Occasion##53831 |goto 48.62,22.02
accept A Queen's Entourage##53823 |goto 48.62,22.02
step
talk Princess Talanji##145359
turnin A Queen's Entourage##53823 |goto Dazar'alor/0 42.59,22.81
step
talk High Prelate Rata##148096
accept The Rite of Kings and Queens##53824 |goto 42.58,22.54
step
clicknpc Ceremonial Warbeast##146033
Ride the Ceremonial Warbeast |q 53824/1 |goto 42.48,23.26
step
Watch the dialogue
Ride in Procession with Talanji |q 53824/2 |goto 39.85,12.64 |notravel
step
talk High Prelate Rata##148096
turnin The Rite of Kings and Queens##53824 |goto 40.28,12.23
step
Watch the dialogue
talk Zolani##145360
|tip She runs to this location.
accept The Instigator Among Us##53826 |goto 40.27,12.45
accept Quelling the Masses##54419 |goto 40.27,12.45
stickystart "Subdue_Rioters"
step
kill Enforcer Malzon##147777 |q 53826/1 |goto Dazar'alor/0 37.31,10.45
step
label "Subdue_Rioters"
kill Rioting Speaker##147779+
talk Rioting Zocalo Drudge##147781
Tell them _"I am not your enemy. Let me help you."_ |gossip 51134
Subdue #12# Rioters |q 54419/1 |goto Dazar'alor/0 36.51,15.18
step
talk Princess Talanji##145359
turnin The Instigator Among Us##53826 |goto 40.51,11.91
turnin Quelling the Masses##54419 |goto 40.51,11.91
accept Talanji's Mercy##54301 |goto 40.51,11.91
step
talk Zolani##145360
accept Breaking the Faith##54300 |goto 40.50,12.42
step
talk High Prelate Rata##148096
accept Heresy!##54925 |goto 40.18,11.91
stickystart "Evacuate_Innocent_Bystanders"
stickystart "Subdue_Angered_Faithful"
step
kill Prelate Kaj'ra##147452 |q 54925/1 |goto Dazar'alor/0 50.81,13.36
|tip She walks around this area.
step
label "Evacuate_Innocent_Bystanders"
click Various Trolls
|tip They look like {o}various neutral trolls{}.
Evacuate #10# Innocent Bystanders |q 54301/1 |goto 51.17,9.60
'|clicknpc Priest of Akunda##147916, Pa'kura Priest##147911, Raptari Druid##147913, Rawajo##147902, Priest of Kimbul##147919, Torcalin Cleric##147918, Balina##147920, Makalla##147921, Priest of Hethiss##147915, Tonai##147908
step
label "Subdue_Angered_Faithful"
Kill enemies around this area
Subdue #12# Angered Faithful |q 54300/1 |goto 51.17,9.60
'|kill Furious Raptari Druid##147901, Irate Pa'kura Priest##147900, Incensed Rastari Prelate##147905
step
talk Zolani##145360
turnin Breaking the Faith##54300 |goto 40.42,11.95
step
talk High Prelate Rata##148096
turnin Heresy!##54925 |goto 40.49,11.85
step
talk Princess Talanji##145359
turnin Talanji's Mercy##54301 |goto 40.56,11.97
accept The New Zanchuli Council##53825 |goto 40.56,11.97
step
Enter the building |goto 41.15,10.96 < 15 |walk
Run up the stairs |goto Dazar'alor/4 45.89,39.15 < 10 |walk
Meet the New Zanchuli Council |q 53825/1 |goto Dazar'alor/3 64.46,34.29
|tip Upstairs inside the building.
step
talk Wardruid Loti##145361
|tip Upstairs inside the building.
Greet Wardruid Loti |q 53825/2 |goto 63.00,24.46
step
talk Lashk##146030
|tip Upstairs inside the building.
Greet Lashk |q 53825/3 |goto 64.47,26.44
step
talk Jo'nok, Bulwark of Torcali##146124
|tip Upstairs inside the building.
Greet Jo'nok |q 53825/4 |goto 66.91,31.57
step
talk General Rakera##145366
|tip Upstairs inside the building.
Greet General Rakera |q 53825/5 |goto 68.30,34.03
step
talk Hexlord Raal##145362
|tip Upstairs inside the building.
Greet Hexlord Raal |q 53825/6 |goto 69.68,35.93
step
Watch the dialogue
|tip Upstairs inside the building.
talk Princess Talanji##145359
turnin The New Zanchuli Council##53825 |goto 60.43,38.75
accept The Council Has Spoken##53827 |goto 60.43,38.75
step
Watch the dialogue
|tip Upstairs inside the building.
Give the Zanchuli Blessing |q 53827/1 |goto 60.30,38.76
step
Kill the enemies that attack in waves
|tip Upstairs inside the building.
Survive the Ambush |q 53827/2 |goto 60.30,38.76
step
kill Samara##146164 |q 53827/3 |goto 64.59,32.90
|tip Upstairs inside the building.
step
Watch the dialogue
|tip Upstairs inside the building.
talk Princess Talanji##145359
turnin The Council Has Spoken##53827 |goto 60.46,38.77
accept Gaze of the Loa##53828 |goto 60.46,38.77
step
Follow Talanji |q 53828/1 |goto Dazar'alor/0 44.58,14.37
|tip Follow {o}Princess Talanji{} as she runs.
|tip She eventually runs to this location outside the building.
'|clicknpc Princess Talanji##145359
step
talk Princess Talanji##146263
turnin Gaze of the Loa##53828 |goto 44.58,14.37
step
talk Krag'wa the Huge##146208
accept Gaze of the Loa: Krag'wa##54031 |goto Dazar'alor/0 44.20,14.94
step
talk Krag'wa the Huge##146208
Tell it _"I am ready."_ |gossip 50726
Speak to Krag'wa |q 54031/1 |goto Dazar'alor/0 44.20,14.94
step
Watch the dialogue
|tip The large {o}frogs{} will {o}chase you{}.
|tip They only {o}attack dirctly in front of themselves{}, so you can {o}side step{} their attacks.
|tip Run around this {o}pillar{}, then {o}side step their attacks{}, or {o}break their line of sight{} by moving {o}around a corner{} of the pillar.
Complete Krag'wa's Trial |q 54031/2 |goto Dazar'alor/0 44.92,15.31
step
Watch the dialogue
talk Krag'wa the Huge##146208
turnin Gaze of the Loa: Krag'wa##54031 |goto Dazar'alor/0 44.20,14.93
accept Gaze of the Loa: Gonk##54033 |goto Dazar'alor/0 44.20,14.93
step
Follow Talanji |q 54033/1 |goto 46.33,12.25
|tip Follow {o}Princess Talanji{} as she runs.
|tip She eventually runs to this location.
'|clicknpc Princess Talanji##146263
step
talk Gonk##146214
Tell him _"As you wish."_ |gossip 49737
Speak to Gonk |q 54033/2 |goto 46.53,12.01
step
Watch the dialogue
talk Gonk##146214
turnin Gaze of the Loa: Gonk##54033 |goto 46.51,12.03
accept Gaze of the Loa: Pa'ku##54032 |goto 46.51,12.03
step
Follow Talanji |q 54032/1 |goto 44.72,9.10
|tip Follow {o}Princess Talanji{} as she runs.
|tip She eventually runs to this location.
'|clicknpc Princess Talanji##146263
step
talk Pa'ku##146209
Tell her _"I am ready."_ |gossip 49738
Speak to Pa'ku |q 54032/2 |goto 44.60,8.92
step
Complete Pa'ku's Trial |q 54032/3 |goto 44.60,8.92
|tip Run up the stairs.
|tip Dodge the {o}tornadoes{}.
step
talk Pa'ku##146209
turnin Gaze of the Loa: Pa'ku##54032 |goto Dazar'alor/0 44.59,8.90
accept Gaze of the Loa: Bwonsamdi##54034 |goto Dazar'alor/0 44.59,8.90
step
Watch the dialogue
Follow Talanji |q 54034/1 |goto Dazar'alor/0 43.64,7.42
'|clicknpc Princess Talanji##146263
step
talk Bwonsamdi##146215
Tell him _"Yes."_ |gossip 49619
Watch the dialogue
Speak to Bwonsamdi |q 54034/2 |goto 43.28,6.88
step
Watch the dialogue
talk Princess Talanji##145359
|tip She walks to this location.
turnin Gaze of the Loa: Bwonsamdi##54034 |goto 42.72,8.74
accept Queen of the Zandalari##53830 |goto 42.72,8.74
step
talk Princess Talanji##145359
Tell her _"Yes."_ |gossip 50321
Watch the dialogue
Witness Talanji's Address |q 53830/1 |goto 42.72,8.74
step
talk Queen Talanji##146335
turnin Queen of the Zandalari##53830 |goto 42.41,9.22
accept Allegiance of the Zandalari##53719 |goto 42.41,9.22
step
talk Lady Sylvanas Windrunner##145374
Tell her _"Queen Talanji asked to speak with you."_ |gossip 49741
Extend Talanji's Invitation |q 53719/1 |goto 41.42,10.63
step
Attend the Meeting |q 53719/2 |goto Dazar'alor/0 49.92,46.27
|tip At the top of the temple.
step
Watch the dialogue
|tip At the top of the temple.
talk Lady Sylvanas Windrunner##145374
turnin Allegiance of the Zandalari##53719 |goto 49.93,46.27
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Death Knight Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('DeathKnight') end,
condition_valid_msg="You must be a Death Knight to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariostage 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Raise Dead |scenariogoal 2/30662
step
_On the Deck of the Airship:_
Watch the dialogue
Use Outbreak on the Target Dummy |scenariogoal 3/30663
step
_On the Deck of the Airship:_
Watch the dialogue
Use your Festering Strike ability on the Target Dummy
|tip It appears on your action bar.
Use Festering Strike on the Target Dummy |scenariogoal 4/30664
step
_On the Deck of the Airship:_
Watch the dialogue
Use Festering Strike then Scourge Strike on the Target Dummy |scenariogoal 5/30665
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Coil on the Target Dummy |scenariogoal 6/30666
|tip Use your other abilities to generate Runic Power.
step
_On the Deck of the Airship:_
Use your abilities on the Target Dummy
Use Outbreak |scenariogoal 7/30663
Use Festering Strike |scenariogoal 7/30664
Use Scourge Strike |scenariogoal 7/30665
Use Death Coil |scenariogoal 7/30666
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Strike |scenariogoal Use Death Strike##8/31703
step
_On the Deck of the Airship:_
Watch the dialogue
Use Death Grip |scenariogoal 9/30667
step
_On the Deck of the Airship:_
Watch the dialogue
Use Army of the Dead |scenariogoal 10/31018
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 12/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Demon Hunter Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('DemonHunter') end,
condition_valid_msg="You must be a Demon Hunter to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Fel Rush |scenariogoal 2/38303
step
_On the Deck of the Airship:_
Watch the dialogue
Use Demon's Bite on the Target Dummy #3# Times |scenariogoal 3/38304
step
_On the Deck of the Airship:_
Watch the dialogue
Use Chaos Strike on the Target Dummy |scenariogoal 4/38305
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
Use Eye Beam on the Target Dummy |scenariogoal 5/38308
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Use Demon's Bite |scenariogoal 6/38304
Use Eye Beam |scenariogoal 6/38308
Use Chaos Strike |scenariogoal 6/38305
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Use Blade Dance to Destroy the Constructs |scenariogoal 7/38307
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 7/29840
|tip Use Demon's Bite to build fury.
|tip Then use Blade Dance and Eye Beam to destroy the Arcane Constructs.
step
_On the Deck of the Airship:_
Watch the dialogue
Use Metamorphasis |scenariogoal 8/38306
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
Defeat Both Attackers |scenariogoal 10/30919
|tip Use Demon's Bite to build fury.
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariogoal 11/0
|tip Use Demon's Bite to build fury.
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Druid Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Druid') end,
condition_valid_msg="You must be a Druid to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Moonkin Form |scenariogoal 2/32840
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Moonfire on the Target Dummy |scenariogoal 3/32841
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Sunfire on the Target Dummy |scenariogoal 3/32842
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Wrath on the Target Dummy |scenariogoal 4/32843
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Starsurge on the Target Dummy |scenariogoal 5/32844
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Starfire on the Target Dummy |scenariogoal 6/32845
|only if Balance
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 6/29840
|only if Balance
step
_On the Deck of the Airship:_
Cast Moonfire |scenariogoal 7/32841
Cast Sunfire |scenariogoal 7/32842
Cast Wrath |scenariogoal 7/32843
Cast Starsurge |scenariogoal 7/32844
Cast Starfire |scenariogoal 7/32845
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Use Regrowth to Heal Yourself |scenariogoal 8/30432
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Entangling Roots |scenariogoal 9/32846
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
|only if Balance
step
_On the Deck of the Airship:_
Watch the dialogue
Use Cat Form to Shapeshift into a Cat |scenariogoal 2/30425
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Prowl to Enter Stealth |scenariogoal 3/30426
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rake on the Target Dummy |scenariogoal 4/30428
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Shred on the Target Dummy |scenariogoal 5/30427
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Ferocious Bite with Combo Points on the Target Dummy |scenariogoal 6/30430
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rip with Combo Points on the Target Dummy |scenariogoal 7/30429
|only if Feral
step
_On the Deck of the Airship:_
Use Rake |scenariogoal 8/30428
Use Shred |scenariogoal Use Shred##8/30427
Use Ferocious Bite |scenariogoal 8/30430
Use Rip |scenariogoal 8/30429
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Dash to Move Faster in Cat Form |scenariogoal 9/30431
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Use Regrowth to Heal Yourself |scenariogoal 10/30432
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariostage 12
|only if Feral
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Feral
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Hunter Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Hunter') end,
condition_valid_msg="You must be a Hunter to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Call Pet |scenariogoal 2/29828
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Kill Command to Command your Pet to Attack the Target Dummy |scenariogoal 3/29829
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Barbed Shot on the Target Dummy |scenariogoal 4/40240
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Cobra Shot on the Target Dummy |scenariogoal 5/29831
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Bestial Wrath |scenariogoal 6/29832
|only if BeastMastery
step
_On the Deck of the Airship:_
Use Kill Command |scenariogoal 7/29829
Use Barbed Shot |scenariogoal 7/40240
Use Cobra Shot |scenariogoal 7/29831
Use Beastial Wrath |scenariogoal 7/29832
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Multi-Shot on the Arcane Constructs |scenariogoal 8/29839
|only if BeastMastery
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feign Death |scenariogoal 9/29835
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
kill Horde Grunt##112000
Defeat the Attacker |scenariogoal 10/30919
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
kill Horde Grunt##112000+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
|only if BeastMastery
step
_On the Deck of the Airship:_
Watch the dialogue
Use Call Pet |scenariogoal 2/29828
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Harpoon on the Target Dummy |scenariogoal 3/34617
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Raptor Strike on the Target Dummy |scenariogoal 4/34622
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Kill Command on the Target Dummy |scenariogoal 5/40249
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Serpent Sting on the Target Dummy |scenariogoal 6/40243
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Wildfire Bomb on the Target Dummy |scenariogoal 7/40244
|only if Survival
step
_On the Deck of the Airship:_
Use Wildfire Bomb on the Target Dummy |scenariogoal 8/40244
Use Kill Command on the Target Dummy |scenariogoal 8/40249
Use Serpent Sting on the Target Dummy |scenariogoal 8/40243
Use Raptor Strike on the Target Dummy |scenariogoal 8/34622
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feign Death |scenariogoal 9/29835
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Attacker |scenariogoal 10/30919
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if Survival
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
|only if Survival
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Mage Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Mage') end,
condition_valid_msg="You must be a Mage to complete this guide!",
startlevel=10.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Summon Water Elemental |scenariogoal 2/29591
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Frostbolt on the Target Dummy |scenariogoal 3/30560
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Ice Lance on the Target Dummy |scenariogoal 4/30561
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Ice Lance with Fingers of Frost |scenariogoal 5/30614
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Flurry while under the Effects of Brainfreeze |scenariogoal 6/34628
step
_On the Deck of the Airship:_
Cast Frostbolt |scenariogoal 7/30560
Cast Ice Lance |scenariogoal 7/30561
Cast Flurry |scenariogoal 7/34687
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Blink |scenariogoal 8/29248
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Frost Nova to Freeze the Enemy |scenariogoal 9/30623
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Blizzard on the Arcane Constructs |scenariogoal 10/30622
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 10/29840
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 12/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Monk Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="You must be a Monk to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Tiger Palm on the Target Dummy |scenariogoal 2/30392
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rising Sun Kick on the Target Dummy |scenariogoal 3/30393
step
_On the Deck of the Airship:_
Watch the dialogue
Use Blackout Kick on the Target Dummy |scenariogoal 4/30395
step
_On the Deck of the Airship:_
Watch the dialogue
Use Fists of Fury on the Target Dummy |scenariogoal 5/30396
step
_On the Deck of the Airship:_
Use Tiger Palm |scenariogoal 6/30392
Use Rising Sun Kick |scenariogoal 6/30393
Use Blackout Kick |scenariogoal 6/30395
Use Fists of Fury |scenariogoal 6/30396
step
_On the Deck of the Airship:_
Watch the dialogue
Use Roll |scenariogoal 7/30397
step
_On the Deck of the Airship:_
Watch the dialogue
Use Vivify to Heal Yourself |scenariogoal 8/40572
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Paladin Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Paladin') end,
condition_valid_msg="You must be a Paladin to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Judgement on the Target Dummy |scenariogoal 2/29793
step
_On the Deck of the Airship:_
Watch the dialogue
Use Blade of Justice on the Target Dummy |scenariogoal 3/29773
step
_On the Deck of the Airship:_
Watch the dialogue
Use Crusader Strike on the Target Dummy |scenariogoal 4/29769
step
_On the Deck of the Airship:_
Watch the dialogue
Use Templar's Verdict on the Target Dummy |scenariogoal 5/29770
step
_On the Deck of the Airship:_
Use Judgement |scenariogoal 6/29793
Use Blade of Justice |scenariogoal 6/29773
Use Crusader Strike |scenariogoal 6/29769
Use Templar's Verdict |scenariogoal 6/29770
step
_On the Deck of the Airship:_
Watch the dialogue
Earn 3 Holy Power and then Use Divine Storm |scenariogoal 7/32067
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 7/29840
step
_On the Deck of the Airship:_
Watch the dialogue
Use Divine Shield |scenariogoal 8/29771
step
_On the Deck of the Airship:_
Watch the dialogue
Allow Fireball to be Cast on You |scenariogoal 8/29797
step
_On the Deck of the Airship:_
Watch the dialogue
Use Flash of Light to Heal Yourself |scenariogoal 9/29772
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Priest Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Priest') end,
condition_valid_msg="You must be a Priest to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Shadow Word: Pain on the Target Dummy |scenariogoal 2/30502
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Penance on the Target Dummy |scenariogoal 3/30503
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Smite on the Target Dummy |scenariogoal 4/30504
step
_On the Deck of the Airship:_
Cast Shadow Word: Pain |scenariogoal 5/30502
Cast Penance |scenariogoal 5/30503
Cast Smite |scenariogoal 5/30504
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Psychic Scream to Fear the Enemies Around You |scenariogoal 6/30520
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Power Word: Shield on Yourself |scenariogoal 7/34732
step
_On the Deck of the Airship:_
Watch the dialogue
Allow Fireball to be Cast on You |scenariogoal 7/29797
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Power Word: Shield on Yourself |scenariogoal 8/34732
step
_On the Deck of the Airship:_
Heal Yourself Through Atonement |scenariogoal 8/40714
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 9/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 11
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Rogue Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Rogue') end,
condition_valid_msg="You must be a Rogue to complete this guide!",
startlevel=50.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Deadly Poison |scenariogoal 2/30644
step
_On the Deck of the Airship:_
Watch the dialogue
Use Stealth |scenariogoal 3/29617
step
_On the Deck of the Airship:_
Watch the dialogue
Use Garrote on the Target Dummy |scenariogoal 4/30645
step
_On the Deck of the Airship:_
Watch the dialogue
Use Mutilate on the Target Dummy |scenariogoal 5/30646
step
_On the Deck of the Airship:_
Watch the dialogue
Use Rupture on the Target Dummy |scenariogoal 6/30647
step
_On the Deck of the Airship:_
Watch the dialogue
Use Envenom on the Target Dummy |scenariogoal 7/30648
step
_On the Deck of the Airship:_
Use Garrote |scenariogoal 8/30645
Use Mutilate |scenariogoal 8/30646
Use Rupture |scenariogoal 8/30647
Use Envenom |scenariogoal 8/30648
step
_On the Deck of the Airship:_
Watch the dialogue
Use Vanish |scenariogoal 9/29646
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Shaman Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Shaman') end,
condition_valid_msg="You must be a Shaman to complete this guide!",
startlevel=10.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariogoal 1/31011 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Flame Shock on the Target Dummy |scenariogoal 2/29959
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lava Burst on the Target Dummy |scenariogoal 3/29960
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lightning Bolt on the Target Dummy |scenariogoal 4/29961
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Earth Shock on the Target Dummy |scenariogoal 5/29962
|only if Elemental
step
_On the Deck of the Airship:_
Cast Flame Shock |scenariogoal 6/29959
Cast Lava Burst |scenariogoal 6/29960
Cast Lightning Bolt |scenariogoal 6/29961
Cast Earth Shock |scenariogoal 6/29962
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Hex on the Soldier |scenariogoal 7/29963
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Chain Lightning on the Arcane Constructs |scenariogoal 8/29964
|only if Elemental
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Healing Surge to Heal Yourself |scenariogoal 9/32737
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Fire Elemental |scenariogoal 10/31313
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 11/30919
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 12/30919
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Elemental
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Flametongue on the Target Dummy |scenariogoal 2/32847
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Rockbiter on the Target Dummy |scenariogoal 3/32848
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Lava Lash on the Target Dummy |scenariogoal 4/32849
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Stormstrike on the Target Dummy |scenariogoal 5/32850
|only if Enhancement
step
_On the Deck of the Airship:_
Cast Lava Lash |scenariogoal 6/32849
Cast Flametongue |scenariogoal 6/32847
Cast Rockbiter |scenariogoal 6/32848
Cast Stormstrike |scenariogoal 6/32850
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Hex on the Attacker |scenariogoal 7/29963
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Healing Surge to Heal Yourself |scenariogoal 8/29965
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Use Feral Spirit |scenariogoal 9/32851
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
|only if Enhancement
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 13
|only if Enhancement
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Warlock Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Warlock') end,
condition_valid_msg="You must be a Warlock to complete this guide!",
startlevel=10.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariostage 1 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Cast Summon Voidwalker |scenariogoal 2/29810
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Agony on the Target Dummy |scenariogoal 3/29811
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Corruption on the Target Dummy |scenariogoal 4/29812
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Shadow Bolt on the Target Dummy |scenariogoal 5/40241
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Unstable Affliction on the Target Dummy |scenariogoal 6/29814
step
_On the Deck of the Airship:_
Cast Agony |scenariogoal 7/29811
Cast Corruption |scenariogoal 7/29812
Cast Unstable Affliction |scenariogoal 7/29814
Cast Shadow Bolt |scenariogoal 7/40241
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Drain Life on the Target Dummy |scenariogoal 8/40242
step
_On the Deck of the Airship:_
Watch the dialogue
Cast Fear on the Soldier |scenariogoal 9/29815
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Attacker |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Attackers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Shadowlands (50-60)\\Boosted Characters\\Boosted Character Warrior Intro",{
author="support@zygorguides.com",
description="This guide will walk you through completing the level 50 character boost introduction.",
condition_suggested=function() return intutorial() and level >= 50 end,
condition_suggested_exclusive=true,
condition_valid=function() return raceclass('Warrior') end,
condition_valid_msg="You must be a Warrior to complete this guide!",
startlevel=10.0,
},[[
step
_On the Deck of the Airship:_
talk Warlord Zakgra##105317
Tell her _"I'm ready to begin."_
Talk to Warlord Zakgra |scenariostage 1 |or |next "Start_Combat_Training"
_Or_
You Can Skip the Combat Training Scenario
|tip Use your Hearthstone now if you want to skip the Combat Training scenario.
|tip You can complete it or skip it, it doesn't matter, and is purely personal preference.
Use Your Hearthstone |goto Dazar'alor/1 48.67,70.47 < 1000 |c |noway |or |next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Start_Combat_Training"
_On the Deck of the Airship:_
Watch the dialogue
Use Charge on the Target Dummy |scenariogoal 2/30115
step
_On the Deck of the Airship:_
Watch the dialogue
Use Mortal Strike on the Target Dummy |scenariogoal 3/30116
step
_On the Deck of the Airship:_
Watch the dialogue
Use Slam on the Target Dummy |scenariogoal 4/30117
step
_On the Deck of the Airship:_
Watch the dialogue
Use Overpower on the Target Dummy |scenariogoal 5/40181
step
_On the Deck of the Airship:_
Use Overpower |scenariogoal 6/40181
Use Mortal Strike |scenariogoal 6/30116
Use Slam |scenariogoal 6/30117
step
_On the Deck of the Airship:_
Watch the dialogue
kill Arcane Construct##101738+
Kill an Arcane Construct and then Use Victory Rush on the Others |scenariogoal 7/30119
step
_On the Deck of the Airship:_
Watch the dialogue
Use Whirlwind on the Arcane Constructs |scenariogoal 8/30120
step
_On the Deck of the Airship:_
kill Arcane Construct##101738+
Destroy the Arcane Constructs |scenariogoal 8/29840
step
_On the Deck of the Airship:_
Watch the dialogue
Use Heroic Leap |scenariogoal 9/30121
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592
Defeat the Soldier |scenariogoal 10/30919
step
_On the Deck of the Airship:_
Watch the dialogue
kill Alliance Infantry##102592+
|tip Two of them will attack you.
Defeat Both Soldiers |scenariogoal 11/30919
step
_On the Deck of the Airship:_
Watch the dialogue
Kill enemies around this area
Defend the Airship! |scenariostage 12
step
_On the Rear Deck of the Airship:_
Prepare Your Character
|tip Open your Talents panel (press N) and choose your talents.
|tip Open your Spellbook (press P) and move the rest of your abilities to your action bars.
clicknpc Armored Wind Rider##112565
|tip At the back of the ship.
Choose _<Receive your summons and leave the airship.>_
accept Shadowlands: A Chilling Summons##61874
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_
Watch the dialogue
Learn About Your Leaders' Fate |q 61874/1 |goto 50.37,76.55
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
]])
