local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHMOP") then return end
ZygorGuidesViewer.GuideMenuTier = "MOP"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\The Jade Forest (10-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."JadeForest",
next="Leveling Guides\\Pandaria (10-60)\\Valley of the Four Winds (15-60)",
condition_suggested=function() return level >= 10 and level <= 50 and not completedq(29670) end,
startlevel=10,
endlevel=50,
},[[
step
talk General Nazgrim##55135
|tip Inside the room, on the main deck of the airship.
accept Paint it Red!##31765 |goto The Jade Forest/0 30.78,10.22
step
clicknpc Gunship Turret##66677
|tip On the lower level of the ship.
Enter the Turret |invehicle |goto 31.53,11.01 |q 31765
step
Kill Thunder Hold enemies around this area
|tip They are on the ground to the east.
|tip Use the abilities on your action bar.
Slay #80# Thunder Hold Troops |q 31765/1 |goto 33.03,10.61
kill 9 Thunder Hold Cannons##66203 |q 31765/2 |goto 33.03,10.61
step
talk Rivett Clutchpop##67250
|tip On the lower level of the ship.
turnin Paint it Red!##31765 |goto 31.01,11.02
accept Touching Ground##31766 |goto 31.01,11.02
step
click Rappelling Rope##215689
|tip On the lower level of the ship.
Rappel into Honeydew Glade |q 31766/1 |goto 31.51,11.11
step
talk General Nazgrim##55135
|tip He walks around this area.
turnin Touching Ground##31766 |goto 31.64,11.33
accept Finish Them!##31767 |goto 31.64,11.33
accept Fire Is Always the Answer##31768 |goto 31.64,11.33
stickystart "Slay_Thunder_Hold_Troops"
step
use Nazgrim's Flare Gun##89605
|tip Use it near Thunder Hold Munitions.
|tip They look like piles of crates and barrels.
Destroy #10# Thunder Hold Munitions |q 31768/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
step
label "Slay_Thunder_Hold_Troops"
Kill Thunder Hold enemies around this area |kill Thunder Hold Armsman##66348, Thunder Hold Cannoneer##66395, Thunder Hold Infantryman##66285, Thunder Hold Sharp-Shooter##66288, Thunder Hold Mender##66286, Thunder Hold Infantryman##66503
|tip They look like Alliance soldiers.
Slay #15# Thunder Hold Troops |q 31767/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
step
Enter the building |goto 33.67,10.61 < 15 |walk
talk General Nazgrim##66646
|tip Inside the building.
turnin Finish Them!##31767 |goto 34.78,10.63
turnin Fire Is Always the Answer##31768 |goto 34.78,10.63
accept The Final Blow!##31769 |goto 34.78,10.63
step
use Nazgrim's Flare Gun##89769
|tip Inside the building.
Destroy the First Barricade |q 31769/1 |goto 34.01,9.94
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Second Barricade |q 31769/2 |goto 34.73,9.93
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Third Barricade |q 31769/3 |goto 34.94,10.63
step
Watch the dialogue
|tip Outside, on top of the building.
Find Captain Doren |q 31769/4 |goto 33.73,10.61
step
talk General Nazgrim##66656
turnin The Final Blow!##31769 |goto 33.65,10.61
step
Watch the dialogue
talk General Nazgrim##66656
accept You're Either With Us Or...##31770 |goto 33.65,10.61
accept Higher Ground##29694 |goto 33.65,10.61
step
talk Taran Zhu##66657
accept Face to Face With Consequence##31771 |goto 33.71,10.61
step
talk Ellie Honeypaw##66660
accept Priorities!##31772 |goto 30.55,7.14
step
talk Rivett Clutchpop##55146
Tell him _"Quit messing around and use your knife! Nazgrim wants you to report to the village immediately."_ |gossip 1
Rescue Rivett Clutchpop |q 29694/2 |goto 30.53,7.21
step
talk Sue-Ji the Tender##66659
accept Prowler Problems##31773 |goto 30.53,7.49
stickystart "Kill_Sha_Haunts"
step
kill 7 Sha Harbinger##66424 |q 31771/2 |goto 33.56,7.31
|tip They look like larger aliens.
You can find more around [33.75,12.76]
step
label "Kill_Sha_Haunts"
kill 20 Sha Haunt##66425 |q 31771/1 |goto 33.56,7.31
|tip They look like smaller aliens.
You can find more around [33.75,12.76]
stickystart "Find_Barrels_of_Honeybrew"
stickystart "Kill_Sha-Infested_Prowlers"
step
talk Shokia##55170
Tell her _"On your feet! Nazgrim is organizing a counter-attack. We're regrouping in the village."_ |gossip 1
Rescue Shokia |q 29694/4 |goto 29.43,8.48
step
talk Sergeant Gorrok##55162
Tell him _"We need to regroup. Sergeant! Go to the nearby village."_ |gossip 1
Rescue Sergeant Gorrok |q 29694/3 |goto 30.58,11.65
step
talk Shademaster Kiryn##55141
Tell her _"Snap out of it! You're alive! Nazgrim has ordered us to report to the nearby village."_ |gossip 1
Rescue Shademaster Kiryn |q 29694/1 |goto 32.06,13.35
step
label "Find_Barrels_of_Honeybrew"
click Barrel of Honeybrew##215695+
|tip They look like grey and yellow barrels.
Find #6# Barrels of Honeybrew |q 31772/1 |goto 31.11,12.42
You can find more around [29.06,9.38]
step
label "Kill_Sha-Infested_Prowlers"
kill 10 Sha-Infested Prowler##66668 |q 31773/1 |goto 31.11,12.42
|tip They look like black tigers.
You can find more around [29.06,9.38]
step
talk Ellie Honeypaw##66848
turnin Priorities!##31772 |goto 29.38,13.58
step
talk Sergeant Gorrok##66845
turnin Regroup!##29694 |goto 29.13,13.72
step
talk Mayor Honeydew##66220
turnin You're Either With Us Or...##31770 |goto 29.18,13.79
step
talk Taran Zhu##66657
turnin Face to Face With Consequence##31771 |goto 29.13,13.84
turnin Prowler Problems##31773 |goto 29.13,13.84
step
talk Sergeant Gorrok##66845
accept Seeking Zin'jun##31774 |goto 29.13,13.72
step
talk Brewmother Kiki##66236
|tip Inside the building.
accept Home Is Where the Hearthstone Is##81638 |goto 28.51,13.34
step
talk Brewmother Kiki##66236
|tip Inside the building.
home Honeydew Village |goto 28.51,13.34 |q 31241 |future
step
talk Wing Hya##66227
fpath Honeydew Village |goto 28.10,15.62
step
talk Zin'Jun##55403
turnin Seeking Zin'jun##31774 |goto 31.14,17.53
accept Cryin' My Eyes Out##29765 |goto 31.14,17.53
step
click Ancient Statue##212181
accept Monstrosity##29743 |goto 30.89,17.49
stickystart "Collect_Zin_Juns_Items"
step
click Ancient Statue Torso##212182
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Torso |q 29743/1 |goto 29.36,18.90
step
click Ancient Statue Arm##212183
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Arm |q 29743/2 |goto 30.12,21.35
step
click Ancient Statue Head##212186
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Head |q 29743/4 |goto 29.95,22.37
step
click Ancient Statue Shoulder##212184
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Shoulder |q 29743/3 |goto 28.58,22.16
step
_Click the Complete Quest Box:_
turnin Monstrosity##29743
step
label "Collect_Zin_Juns_Items"
kill Hozen Groundpounder##55470+
|tip They look like monkeys.
collect Zin'Jun's Rifle##74160 |q 29765/1 |goto 29.79,20.83
collect Zin'Jun's Left Eye##74161 |q 29765/2 |goto 29.79,20.83
collect Zin'Jun's Right Eye##74162 |q 29765/3 |goto 29.79,20.83
collect Snuff's Corpse##74163 |q 29765/4 |goto 29.79,20.83
step
_Next to you:_
talk Zin'Jun##55403
turnin Cryin' My Eyes Out##29765
accept Seein' Red##29804
step
kill Konk##55509 |q 29804/1 |goto 31.94,22.20
|tip Inside the small cave.
step
talk General Nazgrim##66656
|tip He runs to this location.
turnin Seein' Red##29804 |goto 31.66,21.91
accept Assault on the Airstrip##31775 |goto 31.66,21.91
accept Strongarm Tactics##31776 |goto 31.66,21.91
step
talk Merchant Zin##65998
accept Unreliable Allies##31778 |goto 31.41,21.76
step
talk Rivett Clutchpop##55521
accept Choppertunity##31777 |goto 31.14,21.58
stickystart "Free_Pandaren"
stickystart "Slay_Strongarm_Troops"
step
kill Master Engineer Cogswing##65882 |q 31776/1 |goto 30.33,24.26
kill Gyro-Mechanic Lavenderp##65883 |q 31776/2 |goto 30.33,24.26
step
kill Morgus Grimhatchet##65880 |q 31776/3 |goto 29.66,23.11
|tip He walks around the area.
step
kill Corporal Jackson Silver##65881 |q 31776/4 |goto 27.78,22.92
|tip Inside the tower, on the ground floor.
step
click Requisitioned Firework Launcher##214962+
|tip They look like small bronze dragon-shaped rocket launchers.
collect Requisitioned Firework Launcher##89163+ |n
use the Requisitioned Firework Launcher##89163+
|tip Use them on Strongarm Gyrocopters.
|tip They look like helicopters flying in the air.
Shoot Down #12# Strongarm Gyrocopters |q 31777/1 |goto 27.21,24.11
'|kill Strongarm Gyrocopter##65843
step
label "Free_Pandaren"
talk Pandaren Volunteer##67090+
|tip They look like friendly panda people.
Tell them _"You can go home now. I'll cover your back."_ |gossip 1
Free #12# Pandaren |q 31778/1 |goto 28.83,23.97
step
label "Slay_Strongarm_Troops"
Kill Strongarm enemies around this area
|tip They look like Alliance soldiers.
Slay #15# Strongarm Troops |q 31775/1 |goto 28.83,23.97
'|kill Strongarm Private##65841, Strongarm Ace##66000, Strongarm Medic##65842, Strongarm Lieutenant##65905
step
talk Rivett Clutchpop##55521
turnin Choppertunity##31777 |goto 31.14,21.58
step
talk Merchant Zin##65998
turnin Unreliable Allies##31778 |goto 31.41,21.76
step
talk General Nazgrim##66656
turnin Assault on the Airstrip##31775 |goto 31.66,21.91
turnin Strongarm Tactics##31776 |goto 31.66,21.91
accept The Darkness Within##31779 |goto 31.66,21.91
step
Cross the bridge |goto 27.35,25.11 < 15 |only if walking
kill Captain Doren##66052 |q 31779/1 |goto 25.75,23.64
|tip Inside the small cave.
step
click Flagpole##215844
turnin The Darkness Within##31779 |goto 27.57,24.28
accept Nazgrim's Command##31999 |goto 27.57,24.28
step
talk General Nazgrim##55172
turnin Nazgrim's Command##31999 |goto 28.42,24.94
step
talk Shademaster Kiryn##55180
accept Forensic Science##29815 |goto 28.19,24.82
step
talk Rivett Clutchpop##55521
accept Missed Me By... That Much!##29821 |goto 28.10,24.70
step
clicknpc Empty Package##62923
turnin Missed Me By... That Much!##29821 |goto 22.87,30.59
accept They're So Thorny!##31112 |goto 22.87,30.59
stickystart "Collect_Emergency_Supplies"
step
clicknpc Lurching Blossom##55610+
|tip They look like blue and green plants that move.
|tip You can do this while mounted.
collect 8 Viscous Chlorophyll##74621 |q 29815/1 |goto 25.63,26.77
step
label "Collect_Emergency_Supplies"
kill Water Sprite##62930+
|tip They look like blue imps.
collect 5 Emergency Supplies##74623 |q 31112/1 |goto 25.99,26.20
step
talk Rivett Clutchpop##55521
turnin They're So Thorny!##31112 |goto 28.10,24.70
step
talk Shademaster Kiryn##55180
turnin Forensic Science##29815 |goto 28.19,24.82
accept Acid Rain##29827 |goto 28.19,24.82
step
clicknpc Recovered Gyrocopter##55674
Fly With the Gyrocopter |invehicle |goto 28.07,24.78 |q 29827
step
_As You Fly:_
kill 25 Hozen Gutripper##55707 |q 29827/1 |goto 28.67,27.39
kill 25 Hozen Nibstabber##55701 |q 29827/2 |goto 28.67,27.39
|tip They look like monkeys.
|tip Use the abilities on your action bar.
step
talk Shademaster Kiryn##55180
turnin Acid Rain##29827 |goto 28.19,24.82
step
talk General Nazgrim##55172
accept Lay of the Land##29822 |goto 28.42,24.94
step
Visit the Shrine of the Sun |q 29822/1 |goto 31.91,27.95
step
kill Dook Ookem##55622 |q 29822/3 |goto 27.81,30.31
step
Visit the Shrine of the Moon |q 29822/2 |goto 26.23,32.30
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Lay of the Land##29822 |goto 27.59,32.69
accept Stay a While, and Listen##31121 |goto 27.59,32.69
step
click Cho's Teapot
|tip Inside the small cave.
Watch the dialogue
Listen to Lorewalker Cho |q 31121/1 |goto 27.67,32.56
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Stay a While, and Listen##31121 |goto 27.59,32.69
accept A Mile in My Shoes##31132 |goto 27.59,32.69
step
talk Lorewalker Cho##63217
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
turnin A Mile in My Shoes##31132 |goto 30.84,34.06
accept If These Stones Could Speak##31134 |goto 30.84,34.06
step
click Stone Monolith
Translate the First Stone Monolith |q 31134/1 |goto 30.88,33.70
step
click Stone Monolith
kill Bloodthirsty Saurok##63279
Translate the Second Stone Monolith |q 31134/2 |goto 30.64,33.78
step
click Stone Monolith
Translate the Third Stone Monolith |q 31134/3 |goto 30.59,34.14
step
talk Lorewalker Cho##63217
turnin If These Stones Could Speak##31134 |goto 30.84,34.06
accept Peering Into the Past##31152 |goto 30.84,34.06
step
Watch the dialogue
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
Escort Lorewalker Cho to the Circle of Stone |q 31152/1 |goto 28.83,32.55
step
talk Lorewalker Cho##63307
turnin Peering Into the Past##31152 |goto 28.82,32.62
accept Family Tree##31167 |goto 28.82,32.62
step
click Incense Bundle##245682
Light the Incense |q 31167/1 |goto 28.79,32.48
step
talk Lorewalker Cho##63307
turnin Family Tree##31167 |goto 28.82,32.62
accept Swallowed Whole##29879 |goto 28.82,32.62
stickystart "Kill_Engorged_Crocolisks"
step
clicknpc Speckled Trout##56180+
|tip They look like small grey fish.
|tip Underwater.
collect 5 Speckled Trout##75202 |q 29879/2 |goto 22.94,35.02
step
label "Kill_Engorged_Crocolisks"
kill 5 Engorged Crocolisk##56183 |q 29879/1 |goto 22.94,35.02
|tip Underwater. |notinsticky
step
talk Tooki Tooki##56313
turnin Swallowed Whole##29879 |goto 26.28,37.33
accept Orders are Orders##29935 |goto 26.28,37.33
step
talk Bo Bo##56351
accept The Bees' Knees##29933 |goto 25.88,37.99
step
talk Nibi Nibi##56327
accept Kill Kher Shan##29924 |goto 25.96,38.73
step
talk Jeek Jeek##63748
accept Wicked Wikkets##31241 |goto 28.18,38.97
step
kill Kher Shan##56329 |q 29924/1 |goto 33.35,41.65
|tip Inside the small cave.
step
_Click the Complete Quest Box:_
turnin Kill Kher Shan##29924
stickystart "Collect_Alliance_Service_Medallions"
step
kill Jack Arrow##63809
|tip Attack him from behind and he won't hurt you.
|tip Avoid the pink circles on the ground.
collect Captain Jack's Head##85783 |n
use Captain Jack's Head##85783
accept Captain Jack's Dead##31261 |goto 30.82,41.27
step
label "Collect_Alliance_Service_Medallions"
kill Battleworn Paratrooper##63782+
|tip They look like Alliance solders.
collect 6 Alliance Service Medallion##85784 |q 31241/1 |goto 30.82,40.78
step
kill Tigerfly##56283+
|tip They look like yellow flying insects.
collect 30 Bug Leg##76173 |q 29933/1 |goto 29.43,44.67
You can find more around [31.51,45.57]
step
talk Chief Kah Kah##56336
turnin Orders are Orders##29935 |goto 27.99,47.20
accept Instant Messaging##29936 |goto 27.99,47.20
turnin The Bees' Knees##29933 |goto 27.99,47.20
turnin Captain Jack's Dead##31261 |goto 27.99,47.20
turnin Wicked Wikkets##31241 |goto 27.99,47.20
step
talk Grookin Bed-Haver##62975
|tip Inside the building.
home Grookin Hill |goto 27.99,47.43 |q 30015 |future
step
clicknpc Signal Flare##56413
Signal the Survivors |q 29936/1 |goto 27.98,46.79
step
talk General Nazgrim##56339
turnin Instant Messaging##29936 |goto 28.26,47.78
accept Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Grookin Flapmaster##60952
fpath Grookin Hill |goto 27.82,47.90
step
talk Shokia##56340
Tell her _"Nazgrim has assigned you to scout the region, Shokia. You are to depart shortly."_ |gossip 1
Dispatch Shokia |q 29941/1 |goto 28.35,46.97
step
talk Chief Kah Kah##56336
Tell him _"Big Chief Kah Kah, we will be exploring your lands and could use a good guide. Will you help us?"_ |gossip 1
Parlay with Kah Kah |q 29941/4 |goto 27.99,47.20
step
talk Shademaster Kiryn##56478
Tell her _"Nazgrim has assigned you to the scouting party, Kiryn. You are to depart shortly."_ |gossip 1
Dispatch Shademaster Kiryn |q 29941/3 |goto 27.10,48.98
step
talk Sergeant Gorrok##56477
|tip He walks around this area.
Tell him _"Nazgrim has assigned you to help scout the region, Gorrok. You are to depart shortly."_ |gossip 1
Dispatch Sergeant Gorrok |q 29941/2 |goto 27.63,50.48
step
talk General Nazgrim##56339
turnin Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Rivett Clutchpop##56406
accept Furious Fowl##29937 |goto 28.30,47.79
step
talk Chief Kah Kah##56336
accept What's in a Name Name?##31239 |goto 27.99,47.20
step
kill 7 Riverstride Jinyu##56289+ |q 31239/1 |goto 28.79,46.01
|tip They look like fish people.
You can find more around [31.08,47.16]
step
kill Hungry Bloodtalon##56396+
|tip They look like brown birds.
collect 6 Fistful of Bird Guts##76225 |q 29937/1 |goto 30.51,50.99
You can find more around [27.91,52.38]
step
talk Chief Kah Kah##56336
turnin What's in a Name Name##31239 |goto 27.99,47.20
step
talk Rivett Clutchpop##56406
turnin Furious Fowl##29937 |goto 27.23,50.78
accept Easy Pickings##29939 |goto 27.23,50.78
step
talk Eekle Eekle##56358
accept Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
stickystart "Collect_Snapper_Steaks"
step
use the Gut Bomb##76262
|tip Use it to throw a bomb into the water.
click Dead Deepriver Slicky##209877+
|tip They look like small dead fish that appear in the water.
collect 5 Exploded Slicky##76260 |q 29939/1 |goto 26.71,55.39
step
label "Collect_Snapper_Steaks"
kill Muck Snapper##56447+
|tip They look like turtles.
|tip Underwater. |notinsticky
collect 4 Snapper Steak##76420+ |q 29942/1 |goto 26.88,55.92
step
talk Eekle Eekle##56358
turnin Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
step
talk Rivett Clutchpop##56406
turnin Easy Pickings##29939 |goto 27.23,50.78
accept The Scouts Return##29971 |goto 27.23,50.78
step
talk Shokia##55647
turnin The Scouts Return##29971 |goto 28.64,47.37
step
talk Riko##55648
accept Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
click STAY OUT - NO VISITORS##209615
Inspect the Warning Sign |q 29730/1 |goto 38.30,45.39
step
clicknpc Lifelike Jade Statue##55378
|tip They look like small green Pandaren statues on the ground around this area.
Inspect a Lifelike Jade Statue |q 29730/2 |goto 38.85,45.92
step
Watch the dialogue
talk Widow Greenpaw##55381
Tell her _"I am an orc, ma'am. Would you mind if I asked you a few questions?"_ |gossip 1
Speak with Widow Greenpaw |q 29730/3 |goto 39.24,46.21
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29730
step
talk Riko##55648
turnin Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
talk Shademaster Kiryn##55646
accept Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
Watch the dialogue
|tip Use the "Smoke Bomb" ability on your action bar to mark enemies for Shokia to kill.
Search the Serpent's Spine for Signs of Life |q 29731/1 |goto 48.59,60.11
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29731
step
talk Shademaster Kiryn##55646
turnin Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
talk Riko##55648
accept Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shademaster Kiryn##55688
Tell her _"Never! Riko protect you to death!"_ |gossip 1
Kill the enemies that attack in waves
|tip Use the abilities on your action bar.
kill Alliance Scout##55693
Listen to Riko's Report |q 29823/1 |goto The Jade Forest 49.82,70.51
'|kill Ambushing Jinyu##55692
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29823
step
talk Riko##55648
turnin Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shokia##55647
accept Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
click Sniper Rifle##209621 |goto 62.56,82.15
Control the Sniper Rifle |goto 58.82,81.19 < 5 |noway |c |q 29824
step
Watch the dialogue
|tip Right-click enemies to shoot them.
|tip Shademaster Kiryn will plant 3 poison barrels, shoot them.
|tip Then you'll have to kill more waves of enemies again.
|tip Protect Shademaster Kiryn and Riko.
Escort Shademaster Kiryn Through the Camp |q 29824/1
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29824
step
talk Shokia##55647
turnin Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
talk General Nazgrim##56339
accept Guerrillas in our Midst##29943 |goto 28.67,47.53
stickystart "Kill_Alliance_Infiltrators"
step
talk Rivett Clutchpop##56406
accept Green-ish Energy##29968 |goto 30.79,52.26
step
click Green Branch##209903+
|tip They look like brown logs.
collect 7 Green Branch##76333 |q 29968/1 |goto 30.58,52.63
step
label "Kill_Alliance_Infiltrators"
kill 8 Alliance Infiltrator##56303 |q 29943/1 |goto 30.47,51.64
|tip They look like humans stealthed around this area.
step
_Next to you:_
talk General Nazgrim##56490
turnin Guerrillas in our Midst##29943
accept Burning Down the House##29966
step
use Nazgrim's Grog##76336
|tip Up on the mountain.
Destroy the Alliance Camp |q 29966/1 |goto 29.44,54.20
step
talk Rivett Clutchpop##56406
turnin Green-ish Energy##29968 |goto 27.23,50.78
accept Boom Goes the Doonamite!##29967 |goto 27.23,50.78
step
talk Rivett Clutchpop##56525
Speak to Rivett Clutchpop |q 29967/1 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
Tell him _"Okay, Rivett. I'm ready!"_ |gossip 40650
Kill Jinyu enemies around this area
|tip They look like fish people.
|tip Use the "Throw Methane Bomb" on your action bar.
|tip If they get too close and knock you out, talk to Rivett again.
Slay #10# Jinyu Attackers |q 29967/2 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
turnin Boom Goes the Doonamite!##29967 |goto 28.98,49.08
step
talk General Nazgrim##56339
turnin Burning Down the House##29966 |goto 28.67,47.53
accept Dawn's Blossom##30015 |goto 28.67,47.53
step
talk Grookin Flapmaster##60952
Tell him _"Send me to Dawn's Blossom."_ |gossip 1
Begin Flying to Dawn's Blossom |invehicle |goto 27.82,47.90 |q 30015
step
Fly to Dawn's Blossom |outvehicle |goto 47.03,46.16 |q 30015 |notravel
step
talk Keg Runner Lee##59186
fpath Dawn's Blossom |goto 47.05,46.24
step
talk Lorewalker Cho##63577
turnin Dawn's Blossom##30015 |goto 46.82,46.14
step
Watch the dialogue
talk Toya##56348
accept Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
Speak with Kai Wanderbrew |q 31230/3 |goto 46.72,45.81
step
talk Peiji Goldendraft##55809
|tip Inside the building.
Speak with Peiji Goldendraft |q 31230/2 |goto 45.72,43.70
step
talk Peiji Goldendraft##55809
|tip Inside the building.
home The Drunken Hozen |goto 45.72,43.70 |q 29670 |future
step
talk Master Windfur##59160
|tip Inside the building.
Speak with Master Windfur |q 31230/1 |goto 48.49,44.49
step
talk Toya##56348
turnin Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk An Windfur##55413
|tip She walks around this area.
accept The Double Hozu Dare##29716 |goto 46.65,46.15
step
talk Tzu the Ironbelly##56062
accept The Silkwood Road##29865 |goto 46.46,45.80
step
talk Lo Wanderbrew##59178
accept The Threads that Stick##29866 |goto 46.63,45.31
stickystart "Kill_Silkwood_Stalkers"
step
click Silk Patch##209951+
|tip They look like white spider eggs.
collect 7 Pristine Silk Strand##75023 |q 29866/1 |goto 43.76,49.30
step
label "Kill_Silkwood_Stalkers"
kill 8 Silkwood Stalker##56070 |q 29865/1 |goto 43.76,49.30
|tip They look like spiders.
step
talk An Windfur##55274
|tip She appears next to you.
accept Down Kitty!##29717 |goto 37.83,45.03
stickystart "Kill_Jade_Guardians"
step
clicknpc Scared Pandaren Cub##55267+
|tip They look like panda children clinging to trees low to the ground.
Tell them _"It's safe now. You can come down."_ |gossip 1
Rescue #6# Cubs |q 29716/1 |goto 38.12,45.49
step
label "Kill_Jade_Guardians"
kill 8 Jade Guardian##55236 |q 29717/1 |goto 38.12,45.49
|tip They look like green cougars.
step
_Next to you:_
talk An Windfur##55234
turnin The Double Hozu Dare##29716
turnin Down Kitty!##29717
accept The Jade Witch##29723
step
talk Widow Greenpaw##55368
|tip If someone else already talked to her, she will be behind the building.
Ask her _"Where is Shin?"_ |gossip 1
Watch the dialogue
|tip Follow Widow Greenpaw as she walks.
kill Widow Greenpaw##55368
Confront the Jade Witch |q 29723/1 |goto 39.34,46.22
step
talk Tzu the Ironbelly##56062
turnin The Silkwood Road##29865 |goto 46.46,45.80
step
talk An Windfur##55413
|tip She runs along the path all around in this village.
turnin The Jade Witch##29723 |goto 46.49,45.75
step
talk Toya##56348
accept All We Can Spare##29925 |goto 47.16,46.17
step
talk Lo Wanderbrew##59178
turnin The Threads that Stick##29866 |goto 46.63,45.31
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
accept Find the Boy##29993 |goto 47.05,46.01
step
talk Old Man Misteye##59383
accept An Air of Worry##29576 |goto 48.32,46.06
step
talk Apprentice Yufi##54998
accept Tian Monastery##29617 |goto 49.65,45.83
step
talk Inkmaster Wei##56065
|tip He walks around this area.
turnin Find the Boy##29993 |goto 55.00,44.87
accept Shrine of the Dawn##29995 |goto 55.00,44.87
step
talk Inkmaster Glenzu##56064
accept The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
accept Quill of Stingers##29882 |goto 55.40,45.28
step
talk Injar'i Lakebloom##59732
fpath The Arboretum |goto 57.01,44.03
step
talk Elder Anli##58564
accept Wild Things##30134 |goto 57.64,44.95
stickystart "Collect_Freshly_Fallen_Petals"
step
kill Orchard Wasp##56201+
|tip They look like large flying insects.
collect 6 Wasp Stinger##75221 |q 29882/1 |goto 53.6,44.5
step
label "Collect_Freshly_Fallen_Petals"
click Freshly Fallen Petals##209836+
|tip They look like small red flowers.
collect 8 Freshly Fallen Petals##75219 |q 29881/1 |goto 54.10,45.35
step
talk Inkmaster Glenzu##56064
turnin The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
|tip He walks around this area.
turnin Quill of Stingers##29882 |goto 55.27,45.23
step
talk Syra Goldendraft##56708
turnin Shrine of the Dawn##29995 |goto 52.57,38.12
accept Getting Permission##29920 |goto 52.57,38.12
step
talk Pandriarch Bramblestaff##56209
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Bramblestaff##56209
|tip He will eventually surrender.
Defeat Pandriarch Bramblestaff |q 29920/2 |goto 54.09,38.46
step
talk Pandriarch Goldendraft##56210
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Goldendraft##56210
|tip He will eventually surrender.
Defeat Pandriarch Goldendraft |q 29920/3 |goto 53.59,36.73
step
talk Pandriarch Windfur##56206
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Windfur##56206
|tip He will eventually surrender.
Defeat Pandriarch Windfur |q 29920/1 |goto 52.54,35.57
step
talk Lo Wanderbrew##55788
turnin Getting Permission##29920 |goto 52.59,38.12
step
talk Lorewalker Cho##56345
turnin All We Can Spare##29925 |goto 50.91,27.08
step
talk Foreman Mann##56346
accept I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
talk Supplier Towsa##59735
fpath Emperor's Omen |goto 50.82,26.80
step
kill Puckish Sprite##56349+
|tip They look like small green imps.
click Chunk of Jade##209863+
|tip They look like green rocks that appear on the ground after you kill sprites.
collect 15 Chunk of Jade##76209 |q 29928/1 |goto 48.33,31.10
step
talk Foreman Mann##56346
turnin I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept Calamity Jade##29926 |goto 50.94,27.03
accept Mann's Man##29927 |goto 50.94,27.03
step
clicknpc Outcast Sprite##55438
accept The Sprites' Plight##29745 |goto 48.67,24.93
stickystart "Kill_Stonebound_Destroyers"
step
Find the Source of the Simulacra |q 29745/2 |goto 48.61,20.26
step
label "Kill_Stonebound_Destroyers"
kill 10 Stonebound Destroyer##55288 |q 29745/1 |goto 48.80,21.60
|tip They look like brown bulky humanoids.
step
_Click the Complete Quest Box:_
turnin The Sprites' Plight##29745
accept Break the Cycle##29747
step
click Shattered Destroyer##214871
accept Simulacrumble##29748 |goto 48.57,20.62
stickystart "Kill_Shanze_Spiritbinders"
step
click Vacant Destroyer##214873+
|tip They look like stone orc-like statues holding weapons.
Kick #6# Vacant Destroyers |q 29748/1 |goto 48.07,17.12
step
_Click the Complete Quest Box:_
turnin Simulacrumble##29748
step
label "Kill_Shanze_Spiritbinders"
kill 8 Shan'ze Spiritbinder##55279 |q 29747/1 |goto 48.07,17.12
|tip They look like grey bulky humanoids.
step
_Click the Complete Quest Box:_
turnin Break the Cycle##29747
accept An Urgent Plea##29749
step
click Staff of Pei-Zhi##209662
collect Staff of Pei-Zhi##74258 |q 29749/1 |goto 44.23,14.91
step
kill Ancient Spirit##55489+
|tip Try to kill them before they reach the swirling purple orb.
|tip Kill them until the bar at the bottom of your screen fills up.
|tip When the bar reaches about half full, regular enemies will attack you.
Interrupt the Ritual of Spiritbinding |q 29749/2 |goto 44.36,15.35
step
Watch the dialogue
talk Pei-Zhi##55614
turnin An Urgent Plea##29749 |goto 44.23,15.03
accept Ritual Artifacts##29751 |goto 44.23,15.03
accept Vessels of the Spirit##29750 |goto 44.23,15.03
accept The Wayward Dead##29752 |goto 44.23,15.03
stickystart "Collect_Spirit_Bottles"
stickystart "Recover_Wayward_Ancestors"
step
click Jade Cong##209699
collect Jade Cong##74762 |q 29751/1 |goto 42.68,15.76
step
click Pungent Ritual Candle##209701
collect Pungent Ritual Candle##74761 |q 29751/3 |goto 42.26,17.09
step
click Chipped Ritual Bowl##209700
collect Chipped Ritual Bowl##74760 |q 29751/2 |goto 41.62,14.32
step
label "Collect_Spirit_Bottles"
kill Shan'ze Spiritclaw##55291+
|tip They look like bulky humanoids with purple glowing weapons.
collect 8 Spirit Bottle##74763 |q 29750/1 |goto 42.07,15.74
step
label "Recover_Wayward_Ancestors"
use the Staff of Pei-Zhi##74771
|tip Use it on Wayward Ancestors.
|tip They look like banshees.
Recover #10# Wayward Ancestors |q 29752/1 |goto 42.07,15.74
step
talk Pei-Zhi##55614
turnin Ritual Artifacts##29751 |goto 44.23,15.03
turnin Vessels of the Spirit##29750 |goto 44.23,15.03
turnin The Wayward Dead##29752 |goto 44.23,15.03
accept Back to Nature##29753 |goto 44.23,15.03
accept A Humble Offering##29756 |goto 44.23,15.03
stickystart "Collect_Tidemist_Caps"
step
use the Spirit Bottles##74808
|tip You can use it repeatedly in the same location.
kill Raging Beast Spirit##55790+
|tip Some of them will be friendly and run off.
Return #8# Beast Spirits to Nature |q 29753/1 |goto 38.41,10.90
step
label "Collect_Tidemist_Caps"
click Tidemist Cap##209825+
|tip They look like clusters of white mushrooms.
collect 10 Tidemist Cap##75214 |q 29756/1 |goto 39.76,11.48
step
talk Pei-Zhi##55614
turnin Back to Nature##29753 |goto 44.23,15.03
turnin A Humble Offering##29756 |goto 44.23,15.03
accept To Bridge Earth and Sky##29754 |goto 44.23,15.03
step
Watch the dialogue
Kill the enemies that attack in waves
|tip Protect Pei-Zhi until the bar at the bottom of your screen fills up.
Protect Pei-Zhi During His Ritual |q 29754/1 |goto 43.7,12.9
'|kill Shan'ze Spiritclaw##55902
step
_Click the Complete Quest Box:_
turnin To Bridge Earth and Sky##29754
accept Pei-Back##29755
step
kill Stonebound Colossus##56595
|tip He walks around this area.
|tip When your spirit is ripped from your body, click your body at the location you were at to return to your body.
|tip He will regenerate health when you're out-of-body.
kill Shan Jitong##56596 |q 29755/1 |goto 42.52,10.45
|tip He appears while you fight the Stonebound Colossus.
step
talk Pei-Zhi##59492
turnin Pei-Back##29755 |goto 43.84,12.52
step
talk Lin Tenderpaw##54913
|tip Run around the western side of the mountain and follow the road. |only if walking
turnin Tian Monastery##29617 |goto 44.99,24.95
accept The High Elder##29618 |goto 44.99,24.95
step
talk High Elder Cloudfall##54914
|tip Upstairs on the balcony outside the building.
turnin The High Elder##29618 |goto 45.22,25.07
step
talk Lin Tenderpaw##54913
accept A Courteous Guest##29619 |goto 44.99,24.95
step
talk Studious Chu##59736
fpath Tian Monastery |goto 43.58,24.53
step
talk Bolo the Elder##62867
|tip Inside the building.
home Paur's Pub |goto 41.72,23.16
step
kill Greenwood Thief##54930+
|tip They will only drop them if they are carrying oranges.
click Ripe Orange##209436+
|tip They look like small orange balls.
collect 8 Ripe Orange##72589 |q 29619/1 |goto 45.73,27.35
step
Enter the mine |goto 45.86,28.84 < 10 |walk
Locate Hao Mann |q 29927/1 |goto The Jade Forest/6 60.96,36.74
|tip Inside the mine.
step
talk Hao Mann##56347
|tip Inside the mine.
turnin Mann's Man##29927 |goto 60.96,36.74
accept Trapped!##29929 |goto 60.96,36.74
stickystart "Kill_Greenstone_Nibblers"
stickystart "Free_Greenstone_Miners"
step
kill 6 Greenstone Gorger##56404 |q 29926/2 |goto The Jade Forest/0 45.86,28.84
|tip They look like large stone spiders.
|tip Throughout the mine.
step
label "Free_Greenstone_Miners"
talk Greenstone Miner##56464+
|tip They look like pandas inside piles of large rocks.
|tip Throughout the mine. |notinsticky
Free #8# Greenstone Miners |q 29929/1 |goto 45.86,28.84
step
label "Kill_Greenstone_Nibblers"
kill 12 Greenstone Nibbler##56401 |q 29926/1 |goto 45.86,28.84
|tip They look like small stone spiders.
|tip Throughout the mine. |notinsticky
step
Follow the path up and leave the mine |goto 45.86,28.84 < 10 |walk |only if subzone("Greenstone Quarry") and indoors()
talk Hao Mann##56467
turnin Trapped!##29929 |goto 46.30,29.39
accept What's Mined Is Yours##29930 |goto 46.30,29.39
step
clicknpc Jade Cart##56527
Ride in the Jade Cart |invehicle |goto 46.27,29.48 |q 29930
step
Watch the dialogue
Kill the enemies that attack in waves
Deliver the Jade |q 29930/1 |goto 51.21,26.72 |notravel
'|kill Brittle Greenstone Gorger##56543
step
Watch the dialogue
talk Foreman Mann##56346
turnin Calamity Jade##29926 |goto 50.94,27.03
turnin What's Mined Is Yours##29930 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept The Serpent's Heart##29931 |goto 50.94,27.03
step
talk Lin Tenderpaw##54913
turnin A Courteous Guest##29619 |goto 44.99,24.95
accept The Great Banquet##29620 |goto 44.99,24.95
step
talk High Elder Cloudfall##54914
Tell him _"I don't need any introductions, old man. Let's skip ahead to the good part."_
|tip If this dialogue option isn't available, pick the one that's available, and follow him as he walks.
Speak with High Elder Cloudfall |q 29620/1 |goto 42.74,23.17
step
talk High Elder Cloudfall##54914
turnin The Great Banquet##29620 |goto 42.74,23.17
step
Watch the dialogue
talk Xiao##54926
accept Your Training Starts Now##29622 |goto 43.13,23.63
accept Groundskeeper Wu##29626 |goto 43.13,23.63
step
talk Master Stone Fist##54922
accept Becoming Battle-Ready##29632 |goto 43.23,24.75
step
talk Tian Pupil##54944+
Tell them _"Let's fight!"_ |gossip 1
kill Tian Pupil##54944+
|tip They will eventually surrender.
Defeat #8# Monastic Pupils |q 29632/1 |goto 43.73,24.99
step
talk Master Stone Fist##54922
turnin Becoming Battle-Ready##29632 |goto 43.24,24.76
accept Zhi-Zhi, the Dextrous##29633 |goto 43.24,24.76
accept Husshun, the Wizened##29634 |goto 43.24,24.76
step
talk Zhi-Zhi##54924
Ask him _"Wanna fight?"_ |gossip 1
kill Zhi-Zhi##54924
|tip He will eventually surrender.
Defeat Zhi-Zhi |q 29633/1 |goto 43.06,25.99
step
talk Husshun##54925
Tell him _"I challenge you to a fight, Husshun!"_ |gossip 1
kill Husshun##54925
|tip He will eventually surrender.
Defeat Husshun |q 29634/1 |goto 44.56,24.05
step
talk Master Stone Fist##54922
turnin Zhi-Zhi, the Dextrous##29633 |goto 43.24,24.75
turnin Husshun, the Wizened##29634 |goto 43.24,24.75
accept Xiao, the Eater##29635 |goto 43.24,24.75
step
talk Xiao##54926
Tell him _"Put down your fork, and pick up your fists! I challenge you!"_ |gossip 1
kill Xiao##54926
|tip He will eventually surrender.
Defeat Xiao |q 29635/1 |goto 43.13,23.63
step
talk Master Stone Fist##54922
turnin Xiao, the Eater##29635 |goto 43.24,24.75
accept A Test of Endurance##29636 |goto 43.24,24.75
step
talk Groundskeeper Wu##54915
turnin Groundskeeper Wu##29626 |goto 41.62,23.70
accept A Proper Weapon##29627 |goto 41.62,23.70
stickystart "Collect_Rattan_Switches"
step
talk June Whiteblossom##54981
buy Black Walnut Extract##72954 |q 29627/2 |goto 41.39,24.15
step
talk Brewmaster Lei Kanglei##54982
buy 3 Triple-Bittered Ale##72979 |q 29627/3 |goto 41.77,24.61
step
label "Collect_Rattan_Switches"
click Rattan Switch##209464+
|tip They look like thin twigs with leaves at the top of them growing out of the ground around this area.
collect 6 Rattan Switch##72926 |q 29627/1 |goto 41.09,24.78
step
talk Groundskeeper Wu##54915
turnin A Proper Weapon##29627 |goto 41.62,23.70
accept A Strong Back##29628 |goto 41.62,23.70
accept A Steady Hand##29629 |goto 41.62,23.70
accept And a Heavy Fist##29630 |goto 41.62,23.70
step
talk Instructor Myang##54918
turnin A Test of Endurance##29636 |goto 38.97,24.04
accept The Rumpus##29637 |goto 38.97,24.04
step
use the Monastary Fireworks##73369
Kill the enemies that attack in waves
Survive the Melee |q 29637/1 |goto 38.97,23.27
'|kill Rumpus Combatant##55139, Rumpus Brute##55151
step
talk Instructor Myang##54918
turnin The Rumpus##29637 |goto 38.97,24.04
step
talk Guard Shan Long##55094
accept Burning Bright##29631 |goto 38.01,23.80
stickystart "Collect_Blushleaf_Extract"
step
Kill Waxwood enemies around this area
|tip They look like tigers.
Slay #6# Waxwood Hunters |q 29631/1 |goto 35.10,22.10
'|kill Waxwood Matriarch##55238, Waxwood Hunter##54988
step
label "Collect_Blushleaf_Extract"
click Blushleaf Cluster+
|tip They look like small red plants.
|tip Be careful not to move while channeling, or you won't collect all of the extract.
collect 80 Blushleaf Extract##73193 |q 29629/1 |goto 35.1,22.1
step
kill 10 Greenwood Trickster##54987 |q 29630/1 |goto 37.79,20.14
|tip They look like sprites.
step
_NOTE:_
During the Next Few Steps
|tip After collecting the cauldron in the next step, don't mount up.
|tip If you mount up, you will lose the cauldron and have to get another one.
Click Here to Continue |confirm |q 29628
step
click Boiling Cauldron##209551
|tip Inside the building.
Obtain the Boiling Cauldron |q 29628/1 |goto 37.72,17.38
step
talk Guard Shan Long##55094
turnin Burning Bright##29631 |goto 38.0,23.8
step
Return the Boiling Cauldron |q 29628/2 |goto 41.61,23.69
step
talk Groundskeeper Wu##54915
turnin A Strong Back##29628 |goto 41.61,23.69
turnin A Steady Hand##29629 |goto 41.61,23.69
turnin And a Heavy Fist##29630 |goto 41.61,23.69
step
talk Instructor Xann##54917
turnin Your Training Starts Now##29622 |goto 41.60,28.33
accept Perfection##29623 |goto 41.60,28.33
step
Complete #12# Practice Strikes |q 29623/1 |goto 41.40,27.90
|tip Watch the Tian Instructor as he makes motions.
|tip Use the abilities on your action bar to mimic his motions.
step
talk Instructor Xann##54917
turnin Perfection##29623 |goto 41.60,28.33
accept Attention##29624 |goto 41.60,28.33
step
kill 2 Training Bag##55184 |q 29624/1 |goto 41.66,26.97
|tip On each pole around this area, there are 2 punching bags, one to the left of the pole, one to the right.
|tip You will see "LEFT!" and "RIGHT!" messages on your screen.
|tip Attack the bag on whichever side the message says.
step
talk Instructor Xann##54917
turnin Attention##29624 |goto 41.60,28.33
accept Flying Colors##29639 |goto 41.60,28.33
step
talk High Elder Cloudfall##54914
turnin Flying Colors##29639 |goto 42.74,23.17
step
talk Gingo Alebottom##59733
fpath Sri-La Village |goto 55.38,23.73
step
talk Instructor Tong##58225
turnin Wild Things##30134 |goto 65.33,31.65
accept Beating the Odds##30135 |goto 65.33,31.65
accept Empty Nests##30136 |goto 65.33,31.65
accept Egg Collection##30137 |goto 65.33,31.65
stickystart "Slay_Slitherscale_Sauroks"
step
use the Silken Rope##78947
|tip Use it on Windward Hatchlings.
|tip They look like small dragons without wings.
|tip Get 6 of them following you.
|tip You can fly without losing them.
Return #6# Windward Hatchlings to Their Nests |q 30136/1 |goto 64.60,31.26
Bring the Windward Hatchlings to [65.78,31.24]
step
label "Slay_Slitherscale_Sauroks"
kill Slitherscale Eggdrinker##63532+
|tip They look like reptile people.
Slay #8# Slitherscale Sauroks |q 30135/1 |goto 64.60,31.26
step
talk Instructor Tong##58225
turnin Beating the Odds##30135 |goto 65.33,31.65
turnin Empty Nests##30136 |goto 65.33,31.65
step
click Serpent Egg##210240+
|tip They look like blue, orange, and green balls.
collect 6 Serpent Egg##78959 |q 30137/1 |goto 68.03,27.62
step
talk Instructor Tong##58225
turnin Egg Collection##30137 |goto 65.33,31.65
accept Choosing the One##30138 |goto 65.33,31.65
step
talk Instructor Tong##58225
turnin Choosing the One##30138 |goto 65.33,31.65
accept The Rider's Journey##30139 |goto 65.33,31.65 |or
'|accept The Rider's Journey##30140 |goto 65.33,31.65 |or
'|accept The Rider's Journey##30141 |goto 65.33,31.65 |or
step
talk Instructor Skythorn##58228
turnin The Rider's Journey##30139 |goto 57.56,45.10 |only if haveq(30139) or completedq(30139)
turnin The Rider's Journey##30140 |goto 57.56,45.10 |only if haveq(30140) or completedq(30140)
turnin The Rider's Journey##30141 |goto 57.56,45.10 |only if haveq(30141) or completedq(30141)
accept It's A...##30142 |goto 57.56,45.10
step
Watch the dialogue
Witness the Egg Hatch |q 30142/1 |goto 57.45,45.14
step
talk Instructor Skythorn##58228
turnin It's A...##30142 |goto 57.56,45.10
step
talk Foreman Raike##59391
turnin The Serpent's Heart##29931 |goto 48.31,61.35
accept Love's Labor##30495 |goto 48.31,61.35
step
talk Historian Dinh##59395
Tell him _"I've got a new jade shipment for you."_ |gossip 1
Complete the Delivery to Historian Dinh |q 30495/1 |goto 46.36,61.80
step
talk Surveyor Sawa##59401
Tell him _"I've got your jade right here."_ |gossip 1
Complete the Delivery to Surveyor Sawa |q 30495/2 |goto 46.94,60.35
step
talk Kitemaster Shoku##59392
Tell him _"I've got a jade delivery for you."_ |gossip 1
Complete the Delivery to Kitemaster Shoku |q 30495/3 |goto 48.17,60.02
step
talk Kitemaster Shoku##59392
|tip You can skip this step if you are able to fly.
Tell him _"I need a ride to the top of the statue."_ |gossip 1
Begin Riding a Kite to the Top of the Statue |invehicle |goto 48.18,60.02 |q 30495
step
Ride a Kite to the Top of the Statue |outvehicle |goto 47.46,60.58 |q 30495 |notravel
step
talk Taskmaster Emi##59397
|tip On a platform at the top of the statue.
Ask her _"Did someone say they needed jade?"_ |gossip 1
Complete the Delivery to Taskmaster Emi |q 30495/4 |goto 47.58,60.67
step
talk Kitemaster Inga##59400
|tip On a platform at the top of the statue.
|tip You can skip this step if you are able to fly.
Tell her _"I need a ride to the bottom of the statue."_ |gossip 1
Begin Riding a Kite to the Bottom of the Statue |invehicle |goto 47.45,60.51 |q 30495
step
Ride a Kite to the Bottom of the Statue |outvehicle |goto 48.23,60.00 |q 30495 |notravel
step
talk Foreman Raike##59391
turnin Love's Labor##30495 |goto 48.31,61.35
accept The Temple of the Jade Serpent##29932 |goto 48.31,61.35
step
talk Kitemaster Shoku##59392
Tell him _"Take me to the Temple of the Jade Serpent."_ |gossip 2
Begin Flying to the Temple of the Jade Serpent |invehicle |goto 48.18,60.02 |q 29932
step
Fly to the Temple of the Jade Serpent |outvehicle |goto 55.67,57.05 |q 29932 |notravel
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
Tell her _"I have a message for the Jade Serpent."_ |gossip 1
Speak to Elder Sage Wind-Yi |q 29932/1 |goto 55.84,57.07
Also check around [54.99,56.89]
step
Watch the dialogue
talk Elder Sage Rain-Zhu##56782
turnin The Temple of the Jade Serpent##29932 |goto 58.13,58.66
accept The Scryer's Dilemma##29997 |goto 58.13,58.66
accept The Librarian's Quandary##29998 |goto 58.13,58.66
accept They Call Him... Stormstout##32019 |goto 58.13,58.66
step
talk Fei##56784
accept The Rider's Bind##29999 |goto 58.03,59.01
accept Lighting Up the Sky##30005 |goto 58.03,59.01
stickystart "Launch_Fireworks"
step
clicknpc Playful Crimson Serpent##56852
|tip It moves around this small area.
Find the Playful Crimson Serpent |q 29999/2 |goto 58.18,61.39
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin The Librarian's Quandary##29998 |goto 56.26,60.43
accept Moth-Ridden##30001 |goto 56.26,60.43
accept Pages of History##30002 |goto 56.26,60.43
stickystop "Launch_Fireworks"
stickystart "Kill_Dappled_Moths"
stickystart "Squash_Bookworms"
step
clicknpc Playful Gold Serpent##56850
|tip It moves around this small area.
|tip Inside the building.
Find the Playful Gold Serpent |q 29999/4 |goto 56.00,60.32
step
label "Kill_Dappled_Moths"
kill 8 Dappled Moth##57232 |q 30001/1 |goto 56.00,60.32
|tip They look like butterflies.
|tip Inside the building. |notinsticky
step
label "Squash_Bookworms"
click Infested Book##209594+
|tip They look like large green books.
|tip Inside the building. |notinsticky
kill Bookworm##57237+
|tip You can right-click them repeatedly to kill them quickly.
Squash #12# Bookworms |q 30002/1 |goto 56.00,60.32
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin Moth-Ridden##30001 |goto 56.26,60.44
turnin Pages of History##30002 |goto 56.26,60.44
accept Everything In Its Place##30004 |goto 56.26,60.44
step
clicknpc Playful Emerald Serpent##56851
|tip It moves around this small area.
|tip Follow the stairs up and leave the building to find it.
Find the Playful Emerald Serpent |q 29999/3 |goto 56.54,58.38
step
kill Water Fiend##56820+
|tip They look like small water elementals.
|tip Inside the building.
collect Scryer's Staff##76725 |q 29997/1 |goto 57.46,55.98
step
talk Wise Mari##56787
|tip Inside the building.
turnin The Scryer's Dilemma##29997 |goto 57.57,56.03
accept A New Vision##30011 |goto 57.57,56.03
stickystart "Launch_Fireworks"
step
clicknpc Playful Azure Serpent##56853
|tip It moves around this small area.
Find the Playful Azure Serpent |q 29999/1 |goto 59.21,56.73
step
label "Launch_Fireworks"
click Firework Launcher##209672+
|tip They look like metal pots sitting on wooden pallets.
Launch #8# Fireworks |q 30005/1 |goto 57.46,58.50
step
talk Elder Sage Rain-Zhu##56782
turnin A New Vision##30011 |goto 58.14,58.66
turnin Everything In Its Place##30004 |goto 58.14,58.66
step
talk Fei##56784
turnin The Rider's Bind##29999 |goto 58.03,59.01
turnin Lighting Up the Sky##30005 |goto 58.03,59.01
accept The Jade Serpent##30000 |goto 58.03,59.01
step
Watch the dialogue
Listen to the Jade Serpent |q 30000/1
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
turnin The Jade Serpent##30000 |goto 55.84,57.08
accept Get Back Here!##30499 |goto 55.84,57.08
Also check around [54.99,56.89]
step
talk Ginsa Arroweye##59727
fpath Jade Temple Grounds |goto 54.57,61.76
step
talk Ginsa Arroweye##59727
Tell her _"I could use a kite to Grookin' Hill."_ |gossip 1
Begin Flying to Grookin Hill |invehicle |goto 54.57,61.76 |q 30499
step
Fly to Grookin Hill |outvehicle |goto 28.02,46.97 |q 30499 |notravel
step
talk General Nazgrim##57108
turnin Get Back Here!##30499 |goto 28.03,47.19
accept Gauging Our Progress##30484 |goto 28.03,47.19
accept Sufficient Motivation##30466 |goto 28.03,47.19
stickystart "Motivate_Hozen"
step
click Barrel of Slickies##209974
collect Bucket of Slicky Water##79884 |q 30466/2 |goto 28.11,47.39
step
talk Rivett Clutchpop##59305
Tell him _"General Nazgrim needs an update on your progress."_ |gossip 1
collect Rivett Clutchpop's Report##80014 |q 30484/2 |goto 28.41,47.79
step
talk Shademaster Kiryn##56841
Tell her _"General Nazgrim wants an update on your progress."_ |gossip 1
collect Shademaster Kiryn's Report##80013 |q 30484/1 |goto 29.16,50.89
stickystop "Motivate_Hozen"
step
talk Shokia##56838
|tip She walks around this area.
Tell her _"General Nazgrim needs your training report."_ |gossip 1
collect Shokia's Report##80015 |q 30484/3 |goto 28.39,51.93
step
talk Riko##56840
Tell him _"General Nazgrim wants to know the status of the supplies."_ |gossip 1
collect Riko's Report##80061 |q 30484/4 |goto 27.00,54.94
step
label "Motivate_Hozen"
use the Bucket of Slicky Water##79884
|tip Use it on Lazy Hozens.
|tip They look like monkeys sleeping on the ground, or hanging from ropes.
Motivate #10# Hozen |q 30466/1 |goto 27.63,48.80
step
talk General Nazgrim##57108
turnin Gauging Our Progress##30484 |goto 28.03,47.19
turnin Sufficient Motivation##30466 |goto 28.03,47.19
step
talk Lorewalker Cho##59377
accept Last Piece of the Puzzle##30485 |goto 28.22,46.72
step
talk Mishi##64207
Tell him _"I am ready to leave."_ |gossip 1
Begin Flying to Serpent's Overlook |invehicle |goto 28.19,46.72 |q 30485
step
Fly to Serpent's Overlook |outvehicle |goto 44.65,67.24 |q 30485 |notravel
step
talk Sky Dancer Ji##64310
fpath Serpent's Overlook |goto 43.10,68.49
step
use the Cho Family Heirloom##80071
|tip At the top of the mountain.
Watch the dialogue
Place the Heirloom at the Cho Family Shrine |q 30485/1 |goto 44.50,66.93
step
talk Lorewalker Cho##59411
|tip At the top of the mountain.
turnin Last Piece of the Puzzle##30485 |goto 44.77,67.09
accept The Seal is Broken##31303 |goto 44.77,67.09
step
talk Mishi##64475
Tell him _"Let's do this, Mishi!"_ |gossip 1
Fly with Mishi |invehicle |goto 44.77,67.04 |q 31303
step
Seal #12# Sha Fissures |q 31303/1 |goto 47.30,58.20
|tip Use the ability on your action bar on the white smoke pillars on the ground as you fly.
step
talk Lorewalker Cho##59418
turnin The Seal is Broken##31303 |goto 49.30,61.48
accept Residual Fallout##30500 |goto 49.30,61.48
accept Jaded Heart##30502 |goto 49.30,61.48
accept Emergency Response##30504 |goto 49.30,61.48
stickystart "Kill_Sha_Remnants"
stickystart "Kill_Sha_Echoes"
step
use Cho's Fireworks##86467
Rescue General Nazgrim |q 30504/1 |goto 48.13,61.77
step
use Cho's Fireworks##86467
Rescue Shademaster Kiryn |q 30504/2 |goto 47.24,62.54
step
use Cho's Fireworks##86467
Rescue Shokia |q 30504/3 |goto 46.87,60.71
step
use Cho's Fireworks##86467
Rescue Rivett Clutchpop |q 30504/4 |goto 48.02,59.08
step
label "Kill_Sha_Remnants"
click Celestial Jade##210921+
|tip They look like small green rocks on the ground around this area.
collect Celestial Jade##80074+ |n
use the Celestial Jade##80074+
|tip Use them on Sha Remnants.
|tip They look like larger shadow aliens.
|tip They till become non-elite and easy to kill.
kill 6 Sha Remnant##59434 |q 30502/1 |goto 46.93,60.72
step
label "Kill_Sha_Echoes"
kill 12 Sha Echo##59417 |q 30500/1 |goto 46.93,60.72
|tip They look like smaller shadow aliens.
step
talk Lorewalker Cho##59418
turnin Residual Fallout##30500 |goto 49.30,61.48
turnin Jaded Heart##30502 |goto 49.30,61.48
turnin Emergency Response##30504 |goto 49.30,61.48
step
talk Fei##59899
accept Moving On##30648 |goto 49.30,61.42
step
talk Shao the Defiant##54697
|tip He fights around this area.
turnin An Air of Worry##29576 |goto 43.48,75.92
accept Defiance##29578 |goto 43.48,75.92
accept Rally the Survivors##29579 |goto 43.48,75.92
step
talk Gentle Mother Hanae##54854
|tip She walks around this area.
|tip Inside the building.
accept Spitfire##29585 |goto 43.24,76.01
accept Orchard-Supplied Hardware##29580 |goto 43.24,76.01
stickystart "Collect_Orchard_Tools"
stickystart "Kill_Gormali_Incinerators"
stickystart "Kill_Gormali_Raiders"
stickystart "Put_Out_Orchard_Fires"
step
talk Nectarbreeze Farmer##54763+
|tip They look like pandaren.
Tell them _"Get to Hanae's house. It's safe there."_ |gossip 1
Rescue #5# Survivors |q 29579/1 |goto 44.01,74.31
step
label "Collect_Orchard_Tools"
click Orchard Tool##209345+
|tip They look like various farm tools with long brown wooden handles.
collect 6 Orchard Tool##72133 |q 29580/1 |goto 44.01,74.31
step
label "Kill_Gormali_Incinerators"
kill 8 Gormali Incinerator##54703 |q 29578/2 |goto 44.01,74.31
|tip They look like grey bulky humanoids carrying torches.
step
label "Kill_Gormali_Raiders"
kill 8 Gormali Raider##54702 |q 29578/1 |goto 44.01,74.31
|tip They look like grey bulky humanoids.
step
label "Put_Out_Orchard_Fires"
use the Nectarbreeze Cider##72578
|tip Use it near fires while facing them around this area.
Put Out #12# Orchard Fires |q 29585/1 |goto 44.01,74.31
step
talk Shao the Defiant##54697
|tip He fights around this area.
turnin Defiance##29578 |goto 43.48,75.92
turnin Rally the Survivors##29579 |goto 43.48,75.92
step
talk Gentle Mother Hanae##54854
|tip She walks around this area.
|tip Inside the building.
turnin Spitfire##29585 |goto 43.24,76.01
turnin Orchard-Supplied Hardware##29580 |goto 43.24,76.01
step
talk Traumatized Nectarbreeze Farmer##55209
|tip Inside the building.
accept The Splintered Path##29586 |goto 43.21,75.94
step
Discover Camp Mogu |q 29586/1 |goto 41.00,73.97
step
talk Shao the Defiant##55009
turnin The Splintered Path##29586 |goto 41.00,73.97
accept Unbound##29587 |goto 41.00,73.97
accept Getting Down to Business##29670 |goto 41.00,73.97
stickystart "Set_Farmers_Free"
step
kill Subjugator Gormal##55016 |q 29670/1 |goto 37.80,76.18
step
label "Set_Farmers_Free"
clicknpc Captured Nectarbreeze Farmer##54990+
|tip They look like pandas caught in nets.
kill Gormali Slaver##54989+
|tip Kill the ones dragging a prisoner behind them.
Set #10# Farmers Free |q 29587/1 |goto 39.91,74.79
step
talk Shao the Defiant##55009
turnin Unbound##29587 |goto 41.00,73.97
turnin Getting Down to Business##29670 |goto 41.00,73.97
step
talk Peiji Goldendraft##55809
|tip Inside the building.
accept Temple of the White Tiger##31393 |goto 45.72,43.70
step
talk Messenger Grummle##63778
|tip Inside the building.
accept The Road to Kun-Lai##31255 |goto 45.72,43.80
step
talk Fei##59899
Tell her _"I am ready to leave."_ |gossip 1
Begin Flying to the Valley of the Four Winds |invehicle |goto 49.30,61.42 |q 30648
step
Watch the dialogue
Travel to the Valley of the Four Winds |q 30648/1 |goto Valley of the Four Winds/0 85.97,21.72 |notravel
step
_Click the Complete Quest Box:_
turnin Moving On##30648
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Valley of the Four Winds (15-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."ValleyOfTheFourWinds",
next="Leveling Guides\\Pandaria (10-60)\\Krasarang Wilds (15-60)",
condition_suggested=function() return level >= 15 and level <= 50 and not completedq(29990) end,
startlevel=15,
endlevel=50,
},[[
step
talk Chen Stormstout##56133
turnin They Call Him... Stormstout##32019 |goto Valley of the Four Winds/0 85.94,22.10 |only if haveq(32019) or completedq(32019)
turnin His Name Was... Stormstout##32018 |goto Valley of the Four Winds/0 85.94,22.10 |only if haveq(32018) or completedq(32018)
accept Chen and Li Li##29907 |goto Valley of the Four Winds/0 85.94,22.10
step
talk Princeton##60230
fpath Pang's Stead |goto 84.49,21.06
step
Watch the dialogue
Follow Chen and Li Li to Pang's Stead |q 29907/1 |goto 83.78,21.17
step
talk Pang Thunderfoot##56204
turnin Chen and Li Li##29907 |goto 83.70,21.03
accept A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
step
talk Nan Thunderfoot##65528
|tip Inside the building.
home Thunderfoot Inn |goto 83.76,20.19 |q 29877 |future
stickystart "Slay_Large_Virmen"
stickystart "Slay_Virmen_Pesterers"
step
talk Muno the Farmhand##56440
accept A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
clicknpc Plow Plant##56281+
|tip They look like plows sticking up out of dirt piles around this area.
clicknpc Hoe Tree##56280+
|tip They look like hoes sticking up out of dirt piles around this area.
clicknpc Rake Tree##56279+
|tip They look like rakes sticking up out of dirt piles around this area.
clicknpc Barrow Bush##56278+
|tip They look like wheelbarrow handles sticking up out of dirt piles around this area.
Find #7# Buried Farm Equipment |q 29877/1 |goto 80.71,21.45
step
label "Slay_Large_Virmen"
Kill Snagtooth enemies around this area
|tip They look like larger rats.
Slay #8# Large Virmen |q 29908/1 |goto 80.71,21.45
'|kill Snagtooth Virmen##56184, Snagtooth Tool-Grabber##56185, Snagtooth Troublemaker##55873
step
label "Slay_Virmen_Pesterers"
kill Snagtooth Pesterling##65504+
|tip They look like tiny rats that run around in groups.
Slay #18# Virmen Pesterers |q 29908/2 |goto 80.71,21.45
step
talk Muno the Farmhand##56440
turnin A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
talk Pang Thunderfoot##56204
turnin A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
accept Low Turnip Turnout##29909 |goto 83.70,21.03
step
talk Xiao##56110
accept The Search for the Hidden Master##30086 |goto 84.08,21.04
step
talk Xiao##56110
turnin The Search for the Hidden Master##30086 |goto 84.08,21.05
accept Ken-Ken##29873 |goto 84.08,21.05
accept Clever Ashyo##29871 |goto 84.08,21.05
accept Kang Bramblestaff##29875 |goto 84.08,21.05
accept Lin Tenderpaw##29872 |goto 84.08,21.05
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Low Turnip Turnout##29909 |goto 81.59,25.22
accept Taking a Crop##29940 |goto 81.59,25.22
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
accept Rampaging Rodents##29910 |goto 82.23,25.94
stickystart "Fill_Marmot_Holes"
step
clicknpc Plump Marmot##56203+
|tip They look like brown rodents running on the ground.
Move #6# Plump Marmots |q 29910/1 |goto 82.38,25.15
step
label "Fill_Marmot_Holes"
click Marmot Hole##209835+
|tip They look like piles of dirt on the ground.
Fill #6# Marmot Holes |q 29910/2 |goto 82.38,25.15
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
turnin Rampaging Rodents##29910 |goto 82.23,25.94
step
Enter the underground burrow |goto 86.50,28.08 < 10 |walk
click Stolen Turnip##209891+
|tip They look like round white vegetables with green leaves.
|tip Inside the underground burrow.
collect 5 Stolen Turnip##76297 |q 29940/1 |goto 84.86,27.01
step
Leave the underground burrow |goto 86.56,28.08 < 10 |walk |only if subzone("Virmen Nest") and indoors()
click Stolen Watermelon##209899+
|tip They look like watermelons floating in the water with flag poles in them.
collect 5 Stolen Watermelon##76298 |q 29940/2 |goto 85.56,33.13
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Taking a Crop##29940 |goto 81.59,25.22
accept Practically Perfect Produce##29911 |goto 81.59,25.22
step
talk Pang Thunderfoot##56204
turnin Practically Perfect Produce##29911 |goto 83.70,21.02
accept The Fabulous Miss Fanny##29912 |goto 83.70,21.02
step
click Ang's Giant Pink Turnip##209844
collect Ang's Giant Pink Turnip##75259 |goto 84.28,21.89 |q 29912 |future
step
click Ang's Summer Watermelon##209843
collect Ang's Summer Watermelon##75258 |goto 84.16,22.07 |q 29912 |future
step
click Pang's Extra-Spicy Tofu##209842
collect Pang's Extra-Spicy Tofu##75256 |goto 84.04,22.00 |q 29912 |future
step
talk Miss Fanny##56192
Tell her _"Hit it with average power."_ |gossip 2
Launch a Pink Turnip |q 29912/1 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell her _"Hit it very softly."_ |gossip 1
Launch a Watermelon |q 29912/2 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell her _"Hit it as hard as possible."_ |gossip 3
Launch the Extra-Spicy Tofu |q 29912/3 |goto 83.00,21.36
step
talk Liang Thunderfoot##56205
turnin The Fabulous Miss Fanny##29912 |goto 75.22,24.05
accept The Meat They'll Eat##29913 |goto 75.22,24.05
accept Back to the Sty##29914 |goto 75.22,24.05
stickystart "Collect_Turtle_Meat_Scraps"
stickystart "Collect_Mushan_Shoulder_Steaks"
step
talk Kim of the Mountain Winds##62658
fpath Grassy Cline |goto 70.82,24.10
step
clicknpc Jian##56253
|tip She looks like a grey pig that walks around this area.
Find Jian |q 29914/1 |goto 70.39,24.05
step
clicknpc Smelly##56255
|tip She looks like a white pig that walks around this area.
Find Smelly |q 29914/3 |goto 70.56,28.36
step
clicknpc Ling##56254
|tip She looks like a grey pig that walks around this area.
Find Ling |q 29914/2 |goto 67.08,29.74
step
label "Collect_Turtle_Meat_Scraps"
kill Wyrmhorn Turtle##56256+
collect 80 Turtle Meat Scrap##75276 |q 29913/2 |goto 67.87,29.22
step
label "Collect_Mushan_Shoulder_Steaks"
kill Adolescent Mushan##56239+
|tip They look like yellow dinosaurs.
collect 4 Mushan Shoulder Steak##75275 |q 29913/1 |goto 71.90,29.94
step
talk Liang Thunderfoot##56205
turnin The Meat They'll Eat##29913 |goto 75.22,24.06
turnin Back to the Sty##29914 |goto 75.22,24.06
accept A Neighbor's Duty##29915 |goto 75.22,24.07
step
talk Francis the Shepherd Boy##56208
turnin A Neighbor's Duty##29915 |goto 78.12,32.91
accept Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
accept Lupello##29917 |goto 78.12,32.91
stickystart "Kill_Thieving_Wolves"
stickystart "Kill_Thieving_Plainshawks"
step
kill Lupello##56357 |q 29917/1 |goto 81.76,39.85
|tip He looks like a large black wolf that walks around this area.
step
label "Kill_Thieving_Wolves"
kill 6 Thieving Wolf##56106 |q 29916/2 |goto 81.64,35.01
step
label "Kill_Thieving_Plainshawks"
kill 5 Thieving Plainshawk##56034 |q 29916/1 |goto 80.40,31.74
|tip They look like brown birds perched in trees or flying in the air.
step
talk Francis the Shepherd Boy##56208
turnin Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
turnin Lupello##29917 |goto 78.12,32.91
step
Watch the dialogue
talk Shang Thunderfoot##56312
accept A Lesson in Bravery##29918 |goto 78.18,32.82
step
use the Rancher's Lariat##75208
|tip Use it on Great White Plainshawks.
|tip They look like larger white birds flying in the air.
kill Great White Plainshawk##56171 |q 29918/1 |goto 79.40,34.76
|tip Kill it while flying around on its back.
|tip Use the ability that appears as a button on the screen.
step
talk Shang Thunderfoot##56312
|tip He walks around this area.
turnin A Lesson in Bravery##29918 |goto 74.56,34.61
step
talk Chen Stormstout##56133
accept Great Minds Drink Alike##29919 |goto 75.28,35.50
step
talk Chen Stormstout##56133
Tell him _"I'm ready. Let's hit the road."_ |gossip 1
Watch the dialogue
Follow Chen and Li Li |goto 75.28,35.50 > 10 |c |q 29919
step
Watch the dialogue
|tip Follow Chen and Li Li as they walk.
|tip They eventually walk to this location.
Escort Chen and Li Li |q 29919/1 |goto 68.87,43.15
step
talk Mudmug##56474
turnin Great Minds Drink Alike##29919 |goto 68.72,43.12
step
talk Chen Stormstout##56133
accept Leaders Among Breeders##29944 |goto 68.87,43.15
step
talk Li Li##56138
accept Yellow and Red Make Orange##29945 |goto 68.89,43.32
stickystart "Collect_Vial_Animal_Bloods"
step
click Meadow Marigold##209907+
|tip They look like yellow flowers.
collect 10 Meadow Marigold##76334 |q 29945/1 |goto 70.53,47.94
step
kill Aiyu the Skillet##56520 |q 29944/1 |goto 68.29,38.01
|tip He looks like a large rat that walks around this area.
step
kill Jinanya the Clawblade##56513 |q 29944/2 |goto 65.97,37.39
|tip He looks like a large rat that walks around this area.
step
kill Frenzyhop##56514 |q 29944/3 |goto 64.53,40.65
|tip He looks like a large rat that walks around this area.
step
label "Collect_Vial_Animal_Bloods"
Kill enemies around this area
|tip Only beast enemies will drop the quest items.
collect 40 Vial of Animal Blood##76335 |q 29945/2 |goto 68.71,48.24
You can find more around [66.67,39.42]
'|kill Tawnyhide Fawn##56526, Tawnyhide Stag##56532, Mushan Nomad##56523, Tawnyhide Doe##56531, Longfang Howler##56524
step
talk Li Li##56138
turnin Yellow and Red Make Orange##29945 |goto 68.88,43.30
accept Crouching Carrot, Hidden Turnip##29947 |goto 68.87,43.31
step
talk Chen Stormstout##56133
turnin Leaders Among Breeders##29944 |goto 68.88,43.15
accept The Warren-Mother##29946 |goto 68.88,43.15
step
talk Mudmug##56474
accept Thieves to the Core##29948 |goto 68.71,43.12
stickystart "Collect_Stolen_Sack_Of_Hops"
stickystart "Trick_Virmen_With_Orange_Painted_Turnips"
step
Enter the underground burrow |goto 65.99,38.38 < 10 |walk
kill Chufa##56537 |q 29946/1 |goto 67.90,37.44
|tip Inside the underground burrow.
step
label "Collect_Stolen_Sack_Of_Hops"
click Stolen Sack of Hops##211696+
|tip They look like tan bags filled with green balls.
|tip Throughout the underground burrow. |notinsticky
collect 6 Stolen Sack of Hops##76337 |q 29948/1 |goto 69.05,39.90
step
label "Trick_Virmen_With_Orange_Painted_Turnips"
use the Orange-Painted Turnip##76370
|tip Use it on Twitchheel Hoarders.
|tip They look like rat people around this area.
|tip Inside and outside the underground burrow.
Trick #12# Virmen with Orange-Painted Turnips |q 29947/1 |goto 67.88,36.52
'|kill Twitchheel Hoarder##56538
step
talk Li Li##56138
turnin Crouching Carrot, Hidden Turnip##29947 |goto 68.88,43.32
stickystart "Collect_Stolen_Sack_Of_Hops"
step
talk Mudmug##56474
turnin Thieves to the Core##29948 |goto 68.71,43.12
step
talk Chen Stormstout##56133
turnin The Warren-Mother##29946 |goto 68.88,43.15
accept Legacy##29949 |goto 68.88,43.14
step
Watch the dialogue
talk Li Li##56138
turnin Legacy##29949 |goto 68.77,43.44
accept Li Li's Day Off##29950 |goto 68.77,43.44
step
Watch the dialogue
talk Mudmug##56474
accept Muddy Water##29951 |goto 68.7,43.1
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to Huangtze Falls |q 29950/3 |goto 74.96,42.42
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to New Cifera |q 29950/2 |goto 61.90,35.36
step
talk Clever Ashyo##56113
turnin Clever Ashyo##29871 |goto 61.23,34.22
accept Ashyo's Vision##29577 |goto 61.23,34.22
step
talk Yan##56773
accept Bottletoads##29757 |goto 60.61,33.69
step
talk Gladecaster Lang##58736
accept Watery Woes##30267 |goto 60.97,32.88
stickystart "Collect_Spindly_Bloodfeathers"
stickystart "Collect_Glade_Glimmers"
step
kill Manglemaw##58754
kill Manglemaw's Mother##58755
|tip She appears after you kill Manglemaw.
collect Enormous Crocolisk Tail##79238 |goto 57.48,25.79 |q 30275 |future
step
use the Enormous Crocolisk Tail##79238
accept A Crocolisk Tale##30275
step
label "Collect_Spindly_Bloodfeathers"
Kill Glade enemies around this area
|tip They look like birds walking around.
collect 5 Spindly Bloodfeather##79198 |q 30267/2 |goto 57.03,33.27
'|kill Glade Hunter##57299, Glade Sprinter##58741
step
label "Collect_Glade_Glimmers"
clicknpc Glade Glimmer##57301+
|tip They look like tiny yellow flying insects.
collect 18 Glade Glimmer##79197 |q 30267/1 |goto 57.03,33.27
step
talk Gladecaster Lang##58736
turnin Watery Woes##30267 |goto 60.98,32.89
step
talk Yan##56773
turnin A Crocolisk Tale##30275 |goto 60.62,33.70
step
Follow the path up |goto 62.95,29.70 < 20 |only if walking
talk Zhang Yue##56802
accept Snap Judgment##29600 |goto 59.83,27.93
step
talk Clever Ashyo##56113
Tell him _"Go ahead and speak with the water, Ashyo."_ |gossip 1
Witness Ashyo's Vision |q 29577/1 |goto 59.26,27.56
step
talk Zhang Yue##56802
turnin Ashyo's Vision##29577 |goto 59.83,27.93
accept The Golden Dream##29581 |goto 59.82,27.95
stickystart "Scoop_Toad_Eggs"
stickystart "Kill_Razorback_Snappers"
step
kill Krosh##56833
accept Guess Who's Back##29758 |goto 65.32,25.73
|tip You will automatically accept this quest after looting.
step
click Dreamleaf Bush##209987
collect Sprig of Dreamleaf##76973 |q 29581/1 |goto 65.26,26.29
step
label "Scoop_Toad_Eggs"
click Gurgling Toadspawn##209950+
|tip They look like bubbles in the water.
Scoop #8# Toad Eggs |q 29757/1 |goto 63.15,26.42
step
label "Kill_Razorback_Snappers"
kill 16 Razorback Snapper##56832 |q 29600/1 |goto 63.15,26.42
|tip They look like small turtles.
step
talk Zhang Yue##56802
turnin Snap Judgment##29600 |goto 59.83,27.95
step
talk Yan##56773
turnin The Golden Dream##29581 |goto 60.61,33.69
step
Watch the dialogue
talk Yan##56773
turnin Bottletoads##29757 |goto 60.61,33.69
turnin Guess Whose Back##29758 |goto 60.61,33.69
step
talk Wing Nga##60231
fpath Halfhill |goto 56.50,50.36
step
talk Innkeeper Lei Lan##59582
|tip She walks around on both floors inside the building.
home The Lazy Turnip |goto 55.11,50.55 |q 32035 |future
step
talk Stonecarver Mac##64315
accept Children of the Water##32045 |goto 55.14,47.39
step
talk Lolo Lio##59585
accept Got Silk?##32035 |goto 55.59,52.06
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to the Silken Fields |q 29950/1 |goto 61.79,58.85
step
talk Silkmaster Tsai##57405
turnin Got Silk?##32035 |goto 62.66,59.74
accept Where Silk Comes From##30072 |goto 62.66,59.75
step
talk Journeyman Chu##57424
accept The Moth Rebellion##30059 |goto 63.55,58.45
stickystart "Kill_Tiny_Mutated_Silkmoths"
step
kill 6 Mutated Silkmoth##57422 |q 30059/1 |goto 65.40,57.81
|tip They look like large white moths.
step
label "Kill_Tiny_Mutated_Silkmoths"
kill 8 Tiny Mutated Silkmoth##65984 |q 30059/2 |goto 65.40,57.81
|tip They look like tiny moths in groups.
step
click Muddy Water##209921+
|tip They look like green spots on the water around this area.
|tip Fill up the flask that appears on your screen.
collect Stoppered Vial of Muddy Water##76356 |q 29951/1 |goto 71.61,56.13
step
click Mulberry Barrel##210080
|tip They look like wooden buckets.
collect Mulberry Leaves##77455 |q 30072/1 |goto 62.48,55.19
step
clicknpc Hungry Silkworm##57403+
|tip They look like green caterpillars.
Feed #5# Hungry Silkworms |q 30072/2 |goto 61.28,61.04
step
click Silk Cocoon Bucket##210088
|tip Inside the building.
collect Raw Silk##77456 |q 30072/3 |goto 62.37,62.49
step
talk Silkmaster Tsai##57405
turnin Where Silk Comes From##30072 |goto 62.66,59.75
step
talk Journeyman Chu##57424
turnin The Moth Rebellion##30059 |goto 63.54,58.45
step
talk Master Goh##57407
accept Mothallus!##30058 |goto 63.62,58.53
step
click Mothallus Bait##210117
Watch the dialogue
kill Mothallus##57421
Bait and Kill Mothallus |q 30058/1 |goto 64.38,57.97
step
talk Master Goh##57407
turnin Mothallus!##30058 |goto 63.62,58.53
step
talk Li Li##56138
turnin Li Li's Day Off##29950 |goto 68.78,43.43
step
talk Mudmug##56474
turnin Muddy Water##29951 |goto 68.71,43.12
step
Watch the dialogue
talk Chen Stormstout##56133
accept Broken Dreams##29952 |goto 68.85,43.41
step
talk Chen Stormstout##56133 |goto 68.85,43.41
Ask him _"What happened, Chen?"_ |gossip 1
Enter Chen's Story |invehicle |goto 68.85,43.41 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Unruly Alemental##56684
|tip Use the abilities on your action bar.
Click Here After Killing the Unruly Alemental |confirm |goto 34.25,70.57 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Wuk-Wuk##56691
|tip Use the abilities on your action bar.
Click Here After Killing Wuk-Wuk |confirm |goto 35.87,72.72 |q 29952
step
Watch the dialogue
|tip Upstairs inside the building.
|tip Follow the path up into the upper level of the building.
Listen to Chen's Story |q 29952/1 |goto 34.55,70.75
step
talk Chen Stormstout##56133
turnin Broken Dreams##29952 |goto 68.85,43.40
accept Chen's Resolution##30046 |goto 68.85,43.40
step
talk Chen Stormstout##56133
turnin Chen's Resolution##30046 |goto 55.89,49.44
accept Hop Hunting##30053 |goto 55.89,49.44
accept Li Li and the Grain##30048 |goto 55.89,49.44
accept Doesn't Hold Water##30049 |goto 55.89,49.44
step
talk Mudmug##56474
|tip He walks around this small area.
turnin Doesn't Hold Water##30049 |goto 54.28,38.74
accept The Great Water Hunt##30051 |goto 54.28,38.74
step
talk Mudmug##56474
|tip He walks around this small area.
Tell him _"I'm ready to go, Mudmug."_ |gossip 1
Speak to Mudmug |q 30051/1 |goto 54.28,38.74
stickystart "Gather_Gladewaters"
step
kill Kracor##67128 |q 32045/1 |goto 56.05,33.85
step
label "Gather_Gladewaters"
Gather #30# Gladewater |q 30051/2 |goto 54.14,31.20
|tip Bring Mudmug near Swirling Pools.
|tip They look like dark blue glittering spots on the ground around this area.
step
_Next to you:_
talk Mudmug##58785
turnin The Great Water Hunt##30051
accept Barreling Along##30172
step
kill Thundergill##67125 |q 32045/2 |goto 54.94,25.22
|tip He looks like a large blue fish that swims underwater around this area.
step
kill Succula##67099 |q 32045/3 |goto 51.3,26.9
|tip She looks like a large red and yellow stealthed spider that walks around this area.
step
Lead Mudmug Back to Halfhill |q 30172/1 |goto 55.89,49.43
If he's not following you, you can find Mudmug around [54.28,38.74]
step
talk Chen Stormstout##56133
turnin Barreling Along##30172 |goto 55.89,49.43
step
talk Stonecarver Mac##64315
turnin Children of the Water##32045 |goto 55.14,47.38
step
talk Gardener Fran##62377
accept Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Tell her _"I'm ready to go!"_ |gossip 1
Water #60# Vegetables |q 30050/1 |goto 48.31,33.48
|tip Use the "Water Plants" ability near vegetables around this area.
|tip It appears as a button on the screen.
|tip She tells you what vegetables need to be watered.
|tip The type of vegetables that need to be watered will sparkle.
|tip All of the patches you need to water will be north of her location, around the big hill.
step
talk Gardener Fran##62377
turnin Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Tell her _"I'm helping a friend brew some beer, and we need hops. Do you have any to spare?"_ |gossip 1
Speak with Gardener Fran |q 30053/1 |goto 48.31,33.48
step
talk Den Mudclaw##62385
accept The Farmer's Daughter##30056 |goto 44.26,34.21
step
talk Den Mudclaw##62385
Ask him _"Do you have any hops you can spare?"_ |gossip 1
Speak with Den Mudclaw |q 30053/3 |goto 44.26,34.21
step
talk Mung-Mung##57401
accept Enough is Ookin' Enough##30054 |goto 44.17,34.24
stickystart "Collect_Virmen_Teeth"
step
Enter the underground burrow |goto 43.55,35.34 < 10 |walk
talk Mina Mudclaw##57408
|tip Inside the underground burrow.
turnin The Farmer's Daughter##30056 |goto 41.32,38.14
accept Seeing Orange##30057 |goto 41.32,38.14
step
label "Collect_Virmen_Teeth"
Kill Springtail enemies around this area
|tip They look like small and large rats.
|tip Inside the and outside the underground burrow. |notinsticky
collect 100 Virmen Tooth##77379 |q 30054/1 |goto 43.55,35.34
'|kill Springtail Gnasher##57413, Springtail Digger##66264, Springtail Leaper##57415
step
Leave the underground burrow |goto 43.55,35.34 < 10 |walk |only if subzone("Springtail Warren") and indoors()
Bring Mina Mudclaw Home to Her Father |q 30057/1 |goto 44.27,34.21
step
talk Den Mudclaw##62385
turnin Seeing Orange##30057 |goto 44.27,34.21
step
talk Mung-Mung##57401
turnin Enough is Ookin' Enough##30054 |goto 44.17,34.24
step
talk Gai Lan##57385
Ask him _"Can I buy some hops from you?"_ |gossip 1
Speak with Gai Lan |q 30053/2 |goto 38.59,51.71
step
_Click the Complete Quest Box:_
turnin Hop Hunting##30053
step
talk Gai Lan##57385
accept Weed War##30052 |goto 38.59,51.71
step
talk Gai Lan##57385
Ask him _"What weeds?"_ |gossip 1
Watch the dialogue
clicknpc Ugly Weed##57306+
clicknpc Nasty Weed##57308+
click Weed-B-Gone Gas Bomb##210057+
Pull #100# Weeds |q 30052/1 |goto 38.59,51.71
|tip Run over the small blue weeds that appear on the ground around this area.
|tip You can do this while mounted.
step
talk Gai Lan##57385
turnin Weed War##30052 |goto 38.59,51.71
step
accept Stormstout's Hops##30055 |goto 38.59,51.71
|tip You will automatically accept this quest.
step
talk Chen Stormstout##56133
turnin Stormstout's Hops##30055 |goto 55.89,49.45
step
talk Li Li##56138
turnin Li Li and the Grain##30048 |goto 52.69,62.83
accept Taste Test##30031 |goto 52.69,62.83
step
talk Grainlord Kai##57211
accept Wee Little Shenanigans##30029 |goto 52.73,62.99
step
talk Grainer Pan##57209
accept Out of Sprite##30030 |goto 52.61,62.97
stickystart "Kill_Tricky_Maizer"
step
kill Cornan##57213 |q 30030/1 |goto 51.47,64.42
|tip He runs around this area upstairs inside the building.
step
click Malted Grain##210023
Taste the Malted Grain |q 30031/3 |goto 50.80,63.61
step
click Aged Grain##210021
Taste the Aged Grain |q 30031/1 |goto 51.17,60.79
step
click Light Grain##210024
Taste the Light Grain |q 30031/2 |goto 53.73,63.31
step
click Fresh Grain##210022
Taste the Fresh Grain |q 30031/4 |goto 53.59,64.58
step
label "Kill_Tricky_Maizer"
Kill Maizerly enemies around this area
|tip They look like larger sprites.
Slay #8# Tricky Maizers |q 30029/1 |goto 52.30,62.29
'|kill Granary Vandal##66205, Tricky Maizer##57223
step
talk Li Li##56138
turnin Taste Test##30031 |goto 52.69,62.83
step
talk Grainer Pan##57209
turnin Out of Sprite##30030 |goto 52.60,62.97
step
talk Grainlord Kai##57211
turnin Wee Little Shenanigans##30029 |goto 52.74,62.99
accept The Quest for Better Barley##30032 |goto 52.74,62.99
accept Grain Recovery##30028 |goto 52.74,62.99
step
kill Maizerly Thief##57267+
|tip They look like larger sprites running around carrying large white bags.
click Stolen Barley Sack##210002+
|tip They look like large white bags.
collect 8 Sack of Grain##77033 |q 30028/1 |goto 56.17,64.96
step
talk Grainlord Kai##57211
turnin Grain Recovery##30028 |goto 52.73,63.00
step
click Rappeling Rope##7548
Use the Cliff Harness |q 30032/1 |goto 51.26,77.50
step
click Malted Cave Barley##210037+
|tip They look like small bushes.
|tip Inside the small cave.
collect Malted Cave Barley##77034 |q 30032/2 |goto 53.58,76.26
step
click Climbing Rope
Climb Up the Cliff |invehicle |goto Krasarang Wilds/0 48.65,27.02 |q 30032
|only if walking
step
talk Li Li##56138
turnin The Quest for Better Barley##30032 |goto Valley of the Four Winds/0 52.69,62.83
accept The Chen Taste Test##30047 |goto Valley of the Four Winds/0 52.69,62.83
step
talk Chen Stormstout##56133
turnin The Chen Taste Test##30047 |goto 55.89,49.45
accept The Emperor##30073 |goto 55.89,49.45
step
Watch the dialogue
Help Chen Brew His Beer |q 30073/1 |goto 55.89,49.45
step
talk Chen Stormstout##56133
turnin The Emperor##30073 |goto 55.84,49.35
accept Knocking on the Door##30074 |goto 55.84,49.35
step
talk Chen Stormstout##56133
turnin Knocking on the Door##30074 |goto 32.25,68.55
step
Watch the dialogue
talk Mudmug##56474
accept The Fanciest Water##30076 |goto 32.26,68.28
step
talk Li Li##56138
accept Barrels, Man##30077 |goto 32.33,68.47
step
talk Chen Stormstout##56133
accept Clear the Way##30075 |goto 32.11,68.34
stickystart "Collect_Spritewater_Essences"
stickystart "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
step
clicknpc Barreled Pandaren##57662+
|tip They look like shaking wooden barrels.
|tip Avoid Ook-Ook, the huge elite monkey that runs up and down the road.
|tip If he catches you, use the "Break Barrel" ability.
Free #7# Barreled Pandaren |q 30077/1 |goto 35.95,66.10
step
label "Collect_Spritewater_Essences"
kill Curious Water Sprite##57673+
|tip They look like small blue elementals wearing masks.
collect 3 Spritewater Essence##77471 |q 30076/1 |goto 35.95,66.10
step
label "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
Kill enemies around this area
|tip They look like rats and monkeys.
Slay #10# Ale-Addled Hozen or Mischievous Virmen |q 30075/1 |goto 35.95,66.10
'|kill Ale-Addled Hozen##57672, Mischievous Virmen##57671
step
talk Li Li##56138
turnin Barrels, Man##30077 |goto 36.13,69.05
step
talk Mudmug##56474
turnin The Fanciest Water##30076 |goto 36.0,69.1
step
talk Chen Stormstout##56133
turnin Clear the Way##30075 |goto 36.04,68.99
accept Cleaning House##30078 |goto 36.04,68.99
step
talk Chen Stormstout##56133
Select  _"<Crack your knuckles and nod your head.>"_ |gossip 39238
Enter the Stormstout Brewery |complete subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") |goto 36.04,68.99 |q 30078
step
label "Stormstout_Brewery_Router"
Watch the dialogue
|tip This sequence of this quest is random.
|tip You will appear in one of the random locations.
Stormstout Brewhall	|complete subzone("Stormstout Brewhall")	|q 30078	|or	|next "Stormstout_Brewhall"
The Great Wheel		|complete subzone("The Great Wheel")		|q 30078	|or	|next "The_Great_Wheel"
Trickling Passage	|complete subzone("Trickling Passage")		|q 30078	|or	|next "Trickling_Passage"
Stormstout Brewery	|complete subzone("Stormstout Brewery")		|q 30078	|or	|next "Stormstout_Brewery_Exit"		|only if readyq(30078)
|only if not completedq(30078)
step
label "Stormstout_Brewhall"
talk Li Li##58028
|tip Inside the building.
Tell her _"I'll help."_ |gossip 39978
kill Jooga##58015 |q 30078/2 |goto 32.98,71.11
|tip He looks like a large monkey nearby.
|tip Click the Empty Keg barrels inside the room.
|tip He will stop moving, so you can hit him.
|tip Avoid the bananas.
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
Watch the dialogue
Leave the Stormstout Brewhall |complete not subzone("Stormstout Brewhall") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
label "The_Great_Wheel"
talk Chen Stormstout##58029
|tip Inside the building.
Tell him _"Let's do this, Chen."_ |gossip 39980
kill Fizzy Yellow Spirit##58253+
|tip A Fizzy Yellow Alemental will appear after you kill them all.
kill Fizzy Yellow Alemental##58017 |q 30078/3 |goto 38.35,67.74
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
Watch the dialogue
Leave the Great Wheel |complete not subzone("The Great Wheel") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
label "Trickling_Passage"
talk Mudmug##58027
|tip Inside the building.
Tell him _"Calm down, Mudmug. Let's go."_ |gossip 40588
kill Eddy##58014 |q 30078/1 |goto 34.88,70.31
|tip It looks like a large water sprite elemental nearby.
|tip Run over the bubbles on the ground to weaken Eddy's Water Shield.
|tip Click the bubble around him when his Watery Shield is weakened.
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Watch the dialogue
Leave the Trickling Passage |complete not (subzone("Trickling Passage") or subzone("Grain Cellar")) |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Detecting player location... |complete not (readyq(30078) or completedq(30078)) |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078))
step
label "Stormstout_Brewery_Exit"
Watch the dialogue
Leave the Stormstout Brewery |complete subzone("Stormstout Brewery") |q 30078
|only if not completedq(30078) and (subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") or subzone("Grain Cellar"))
step
talk Chen Stormstout##56133
turnin Cleaning House##30078 |goto 36.00,69.12
step
talk Emmi##61026
accept Stoneplow Thirsts##30117 |goto 36.20,68.29
step
talk "Dragonwing" Dan##58843
fpath Stoneplow |goto 20.30,58.67
step
talk Lin Tenderpaw##56111
turnin Lin Tenderpaw##29872 |goto 19.87,56.92
accept Stemming the Swarm##29981 |goto 19.87,56.92
step
talk Loon Mai##56720
turnin Stoneplow Thirsts##30117 |goto 19.55,56.88
accept Evacuation Orders##29982 |goto 19.55,56.88
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 29981 |future
step
talk Haiyun Greentill##57123
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 1
Evacuate the Greentil Family |q 29982/3 |goto 15.84,56.28
step
talk Mia Marlfur##57127
Tell her _"Loon Mai has issued evacuation orders."_ |gossip 1
Evacuate the Marlfur Family |q 29982/4 |goto 15.48,54.90
stickystart "Kill_Ikthink_Mantids"
step
talk Feng Spadepaw##57121
Tell him _"Yes, Commander Mai sent me, and I carry his evacuation orders."_ |gossip 1
Evacuate the Spadepaw Family |q 29982/2 |goto 12.85,55.71
step
talk Wei Blacksoil##57120
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 1
kill Ik'thik Ambusher##57134
talk Wei Blacksoil##57120
Tell him _"Yes, they're right here. Let's go."_
Evacuate the Blacksoil Family |q 29982/1 |goto 7.15,54.83
step
label "Kill_Ikthink_Mantids"
Kill Ik'thik enemies around this area
|tip They look like insect people.
Slay #14# Ik'thik Mantids |q 29981/1 |goto 11.80,56.66
'|kill Ik'thik Wingblade##57196, Ik'thik Swiftclaw##57195
step
talk Loon Mai##56720
turnin Stemming the Swarm##29981 |goto 19.55,56.88
turnin Evacuation Orders##29982 |goto 19.55,56.88
accept The Hidden Master##29983 |goto 19.55,56.88
step
talk Master Bruised Paw##56714
turnin The Hidden Master##29983 |goto 18.29,31.24
accept Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I'm ready for the trial of bamboo."_ |gossip 1
Begin the Trial of Bamboo |invehicle |goto 18.29,31.23 |q 29984
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #3# Stacks of Bamboo Reeds |q 29984/1 |goto 18.34,32.13
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept They Will Be Mist##29985 |goto 18.29,31.24
accept Fog Wards##29986 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
stickystart "Kill_Mist_Incarnations"
stickystart "Collect_Jademoon_Leaves"
step
click Northern Fog Ward##209945
Light the Northern Fog Ward |q 29986/1 |goto 16.01,32.11
step
click Western Fog Ward##209946
Light the Western Fog Ward |q 29986/2 |goto 14.86,36.82
step
click Southern Fog Ward##209947
Light the Southern Fog Ward |q 29986/3 |goto 18.10,41.46
step
label "Kill_Mist_Incarnations"
kill 12 Mist Incarnation##56740 |q 29985/1 |goto 16.99,35.63
|tip They look like humanoid alien creatures with one large eye.
step
label "Collect_Jademoon_Leaves"
click Jademoon Leaf##11006+
|tip They look like small green plants on the grey rocks.
collect 18 Jademoon Leaf##76499 |q 29992/1 |goto 16.99,35.63
step
talk Lin Tenderpaw##56111
turnin Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
step
talk Master Bruised Paw##56714
turnin They Will Be Mist##29985 |goto 18.29,31.24
turnin Fog Wards##29986 |goto 18.29,31.24
accept Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"My fists are ready. Bring on the trial of wood."_ |gossip 1
Begin the Trial of Wood |invehicle |goto 18.29,31.24 |q 29987
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #4# Stacks of Wooden Boards |q 29987/1 |goto 18.25,32.18
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
accept A Taste For Eggs##29988 |goto 18.29,31.24
stickystart "Collect_Whitefisher_Crane_Eggs"
stickystart "Collect_Emperor_Tern_Eggs"
step
click Hornbill Strider Egg##209955
|tip Inside the small cave.
collect Hornbill Strider Egg##76516 |q 29988/3 |goto 26.98,39.05
step
label "Collect_Whitefisher_Crane_Eggs"
click Whitefisher Crane Egg##209954+
|tip They look like small white eggs.
collect 4 Whitefisher Crane Egg##76503 |q 29988/2 |goto 25.36,43.15
step
label "Collect_Emperor_Tern_Eggs"
click Emperor Tern Egg##209953+
|tip They look like small purple eggs.
collect 10 Emperor Tern Egg##76501 |q 29988/1 |goto 25.36,43.15
step
talk Master Bruised Paw##56714
turnin A Taste For Eggs##29988 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I've done all that you've asked of me. I'm ready for the trial of stone."_ |gossip 1
Begin the Trial of Stone |invehicle |goto 18.29,31.24 |q 29989
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #5# Stacks of Stone Blocks |q 29989/1 |goto 18.16,32.15
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Training and Discipline##29990 |goto 18.06,31.01
step
talk Loon Mai##56720
turnin Training and Discipline##29990 |goto 19.55,56.88
step
talk Tani##63822
|tip She walks around this area.
accept Stalker Mastery##30183 |goto 16.20,82.53
step
talk Hemet Nesingwary Jr.##58422
accept Mushan Mastery##30181 |goto 16.07,82.62
stickystart "Slay_Dustback_Mushans"
step
kill 15 Gorge Stalker##58432 |q 30183/1 |goto 12.77,75.08
|tip They look like green tigers.
step
label "Slay_Dustback_Mushans"
Kill Dustback Mushan enemies around this area
|tip They look like yellow dinosaurs.
Slay #15# Dustback Mushans |q 30181/1 |goto 17.96,72.89
'|kill Young Dustback Mushan##58427, Dustback Mushan##58424
step
talk Tani##63822
|tip She walks around this area.
turnin Stalker Mastery##30183 |goto 16.20,82.53
accept Fox Mastery##30182 |goto 16.20,82.53
step
talk Hemet Nesingwary Jr.##58422
turnin Mushan Mastery##30181 |goto 16.07,82.62
step
talk Hemet Nesingwary##58421
accept Mushan Mastery: Darkhide##30184 |goto 16.01,82.49
step
talk Matt "Lucky" Gotcher##58434
accept Stag Mastery##32038 |goto 15.89,82.24
stickystart "Kill_Sly_Foxes"
stickystart "Slay_Wilderland_Stags"
step
kill Darkhide##58435
|tip He looks like a larger grey dinosaur.
|tip You may need help with this.
collect Darkhide's Head###79058 |q 30184/1 |goto 26.20,75.48
step
label "Kill_Sly_Foxes"
Kill Sly enemies around this area
|tip They look like foxes.
|tip The larger foxes are stealthed.
Slay #15# Sly Foxes |q 30182/1 |goto 27.81,70.87
You can find more all all around [25.58,74.34]
'|kill Sly Fox##58548, Sly Pup##58549
step
label "Slay_Wilderland_Stags"
Kill Wilderland enemies around this area
|tip They look like deer.
Slay #10# Wilderland Stags |q 32038/1 |goto 28.74,81.86
You can find more around [21.30,80.38]
'|kill Wilderland Doe##58490, Wilderland Stag##58489
step
talk Tani##63822
|tip She walks around this area.
turnin Fox Mastery##30182 |goto 16.20,82.53
step
talk Hemet Nesingwary##58421
turnin Mushan Mastery: Darkhide##30184 |goto 16.01,82.49
step
talk Hemet Nesingwary Jr.##58422
accept Tortoise Mastery##30185 |goto 16.07,82.62
step
talk Matt "Lucky" Gotcher##58434
turnin Stag Mastery##32038 |goto 15.89,82.24
step
kill Bulgeback Tortoise##58431+
collect 5 Intact Tortoise Shell##79059 |q 30185/1 |goto 19.91,75.66
step
talk Hemet Nesingwary Jr.##58422
turnin Tortoise Mastery##30185 |goto 19.91,75.66
accept Parental Mastery##30186 |goto 19.91,75.66
step
Enter the underwater cave |goto 21.27,74.40 < 20 |walk
talk Hemet Nesingwary Jr.##58461
|tip Inside the underwater cave.
Choose _"<Try shaking Hemet.>"_ |gossip 1
Watch the dialogue
kill Torjar's Bane##58439
Rescue Hemet Nesingwary Jr. |q 30186/1 |goto 24.54,74.64
step
Leave the underwater cave |goto 21.27,74.40 < 20 |walk |only if subzone("Lair of the Beast") and indoors()
talk Hemet Nesingwary##58421
turnin Parental Mastery##30186 |goto 16.01,82.49
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Krasarang Wilds (15-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KrasarangWilds",
next="Leveling Guides\\Pandaria (10-60)\\Kun-Lai Summit (20-60)",
condition_suggested=function() return level >= 15 and level <= 50 and not completedq(30628) end,
startlevel=15,
endlevel=50,
},[[
step
talk Ken-Ken##56115
turnin Ken-Ken##29873 |goto Krasarang Wilds/0 76.22,7.06
accept What's Eating Zhu's Bastion?##30079 |goto Krasarang Wilds/0 76.22,7.06
step
talk Rude Sho##62879
|tip Inside the building.
home Wilds' Edge Inn |goto 75.74,7.21
step
talk Mei Barrelbottom##57744
Speak with Mei |q 30079/4 |goto 75.84,7.60
step
talk Mei Barrelbottom##57744
accept Finding Yi-Mo##30080 |goto 75.84,7.60
step
talk Despondent Warden of Zhu##57457
Speak with a Despondent Warden of Zhu |q 30079/1 |goto 76.01,8.30
step
talk Gee Hung##60232
fpath Zhu's Watch |goto 76.74,8.38
step
talk Sunni##57830
|tip Inside the building.
Speak with Sunni |q 30079/2 |goto 77.47,8.53
step
talk Yun##57825
|tip Inside the building.
Speak with Yun |q 30079/3 |goto 75.48,9.39
step
talk Ken-Ken##56115
turnin What's Eating Zhu's Bastion?##30079 |goto 76.22,7.06
step
talk Yi-Mo Longbrow##58376
Find Yi-Mo Longbrow |q 30080/1 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
turnin Finding Yi-Mo##30080 |goto 81.31,6.84
accept Cheer Up, Yi-Mo##30082 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
Tell it _"Please, Yi-Mo: your aunt's worried sick about you."_ |gossip 40643
Tell it _"I don't have time for this. Move your ass or I'll move it for you."_ |gossip 40646
clicknpc Yi-Mo Longbrow##57310
Follow Yi-Mo and Continue Moving Him West |goto 81.31,6.84 > 10 |c |q 30082
step
clicknpc Yi-Mo Longbrow##57310
|tip Click him repeatedly.
|tip Roll him to this location.
Kill the enemies that attack in waves
Bring Yi-Mo to Zhu's Watch |q 30082/1 |goto 76.71,7.79 |notravel
'|kill Thunderbird##58111
step
talk Mei Barrelbottom##57744
turnin Cheer Up, Yi-Mo##30082 |goto 75.84,7.60
accept Tears of Pandaria##30091 |goto 75.84,7.60
step
talk Ken-Ken##56115
accept Materia Medica##30081 |goto 76.22,7.06
stickystart "Collect_Salty_Cores"
stickystart "Kill_Weeping_Horrors"
stickystart "Collect_Chunks_Of_Honeycomb"
step
click Slick Mudfish##210186+
|tip They look like small fish.
collect 4 Slick Mudfish##78877 |q 30081/2 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Collect_Salty_Cores"
kill Weeping Horror##57649+
|tip They look like rock elementals.
collect 4 Salty Core##78880+ |q 30081/1 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Kill_Weeping_Horrors"
kill 12 Weeping Horror##57649 |q 30091/1 |goto 75.38,10.91
|tip They look like rock elementals. |notinsticky
You can find more around [71.86,10.76]
step
label "Collect_Chunks_Of_Honeycomb"
click Rain-Slick Honeycomb##210188+
|tip They look like orange glowing balls hanging from trees.
collect 4 Chunk of Honeycomb##78881 |q 30081/3 |goto 73.04,10.94
step
talk Mei Barrelbottom##57744
turnin Tears of Pandaria##30091 |goto 75.84,7.61
accept Securing the Province##30083 |goto 75.84,7.61
accept Borderlands##30084 |goto 75.84,7.61
step
talk Ken-Ken##56115
turnin Materia Medica##30081 |goto 76.22,7.07
accept Why So Serious?##30088 |goto 76.22,7.07
stickystart "Slay_Wildscale_Sauroks"
step
Enter the cave |goto Valley of the Four Winds/0 77.07,57.28 < 15 |walk
click Jar of Pigment##210228
|tip Upstairs inside the cave.
collect Jar of Pigment##78942 |q 30088/2 |goto Valley of the Four Winds/0 73.88,56.41
step
label "Slay_Wildscale_Sauroks"
Kill Wildscale enemies around this area
|tip They look like lizard people.
|tip Inside and outside the cave. |notinsticky
Slay #10# Wildscale Sauroks |q 30083/1 |goto 77.07,57.28
'|kill Wildscale Herbalist##58216, Wildscale Saurok##58215
stickystart "Collect_Huge_Panther_Fangs"
step
Leave the cave |goto 77.07,57.28 < 15 |walk |only if subzone("Winds' Edge")
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Rin |q 30084/3 |goto Krasarang Wilds/0 71.28,17.47
step
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Zhu |q 30084/1 |goto 72.70,18.11
step
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Po |q 30084/2 |goto 73.88,16.95
step
label "Collect_Huge_Panther_Fangs"
kill Krasari Stalker##58221+
|tip They look like black tigers.
|tip They can be stealthed.
collect 18 Huge Panther Fang##78941 |q 30088/1 |goto 72.28,17.29
step
talk Mei Barrelbottom##57744
turnin Securing the Province##30083 |goto 75.84,7.60
turnin Borderlands##30084 |goto 75.84,7.60
step
talk Ken-Ken##56115
turnin Why So Serious?##30088 |goto 76.22,7.07
accept Apply Directly to the Forehead##30089 |goto 76.22,7.07
step
use Ken-Ken's Mask##79021
|tip Use it on Despondent Wardens of Zhu.
|tip They look like pandas in black armor.
kill Manifestation of Despair##58312+
Cure #8# Despondent Wardens of Zhu |q 30089/1 |goto 76.44,8.55
step
talk Ken-Ken##56115
turnin Apply Directly to the Forehead##30089 |goto 76.22,7.07
accept Zhu's Despair##30090 |goto 76.22,7.07
step
kill 8 Essence of Despair##58409 |q 30090/1 |goto 76.40,8.58
step
use Ken-Ken's Mask##79057
|tip Use it on Yi-Mo Longbrow.
kill Quintessence of Despair##58360
Cure Yi-Mo |q 30090/2 |goto 76.49,8.77
step
Watch the dialogue
talk Ken-Ken##56115
turnin Zhu's Despair##30090 |goto 76.21,7.07
step
talk Mei Barrelbottom##57744
accept Into the Wilds##30133 |goto 75.84,7.59
step
talk Mei Barrelbottom##57744
turnin Securing the Province##30083 |goto 75.87,7.50
turnin Borderlands##30084 |goto 75.87,7.50
accept Into the Wilds##30133 |goto 75.87,7.50
step
talk Chezin Dawnchaser##58160
accept Poisoned!##30179 |goto 68.80,22.24
step
Kill Krasari enemies around this area
|tip They look like bulky humanoids.
collect 5 Mogu Poisoned Blade##79252 |q 30179/1 |goto 68.53,22.27
'|kill Krasari Tormentor##58377, Krasari Runekeeper##65598
step
talk Daggle Bombstrider##58779
accept Crane Mastery##30352 |goto 67.63,25.73
accept Profit Mastery##30353 |goto 67.63,25.73
stickystart "Kill_Carp_Hunters"
stickystart "Collect_Vials_Of_Tiger_Blood"
step
clicknpc Zhu's Watch Courier##59151
Choose _"Take the supplies."_ |gossip 1
Find the Zhu's Watch Courier |q 30133/1 |goto 62.55,25.45
step
label "Kill_Carp_Hunters"
kill 12 Carp Hunter##58116 |q 30352/1 |goto 64.06,29.35
|tip They look like green birds.
step
label "Collect_Vials_Of_Tiger_Blood"
kill Krasari Huntress##58070+
|tip They look like tigers, usually stealthed.
collect 12 Vial of Tiger Blood##78914 |q 30353/1 |goto 64.06,29.35
step
talk Daggle Bombstrider##58779
turnin Crane Mastery##30352 |goto 67.63,25.73
accept Crane Mastery: Needlebeak##31262 |goto 67.63,25.73
turnin Profit Mastery##30353 |goto 67.63,25.73
accept Profit Mastery: Chasheen##31260 |goto 67.63,25.73
step
kill Chasheen##63767
|tip He walks around this area.
collect Ancient Tiger's Blood##85774 |q 31260/1 |goto 61.89,32.00
step
kill Needlebeak##63796
|tip He walks around this area.
collect The Needlebeak##85854 |q 31262/1 |goto 62.90,20.17
step
talk Daggle Bombstrider##58779
turnin Crane Mastery: Needlebeak##31262 |goto 67.63,25.73
turnin Profit Mastery: Chasheen##31260 |goto 67.63,25.73
step
talk Kang Bramblestaff##56112
turnin Kang Bramblestaff##29875 |goto 60.09,25.01
step
talk Sunwalker Dezco##58113
turnin Poisoned!##30179 |goto 59.89,24.70
step
talk Kor Bloodtusk##58114
accept Blind Them!##30124 |goto 59.88,24.81
step
talk Kang Bramblestaff##56112
accept Skitterer Stew##30123 |goto 60.09,25.01
step
talk Lira Skysplitter##59046
fpath Thunder Cleft |goto 59.20,24.67
step
talk Malaya Dawnchaser##58184
|tip Inside the building.
home Thunder Cleft |goto 60.91,24.91 |q 30628 |future
step
kill Jungle Skitterer##58067+
|tip They look like large insects running around.
collect 5 Intact Skitterer Glands##78911 |q 30123/1 |goto 62.99,22.03
step
kill Darnassian Outrider##58857 |q 30124/1 |goto 61.80,30.48
|tip It walks around this area, stealthed.
step
talk Kang Bramblestaff##56112
turnin Skitterer Stew##30123 |goto 60.09,25.01
step
talk Kor Bloodtusk##58114
turnin Blind Them!##30124 |goto 59.88,24.81
accept Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
accept Herbal Remedies##30130 |goto 59.89,24.70
step
talk Kang Bramblestaff##56112
accept The Mogu Agenda##30129 |goto 60.09,25.01
stickystart "Kill_Dojani_Enforcers"
stickystart "Kill_Dojani_Reclaimers"
stickystart "Kill_Dojani_Surveyors"
stickystart "Collect_Imperial_Lotus_Leaves"
step
kill Dojani Dominator##58165
|tip At the top of the ruins.
collect Dojani Orders##78917 |q 30129/1 |goto 55.51,34.46
step
_Next to you:_
talk Kang Bramblestaff##58206
turnin The Mogu Agenda##30129
accept The Pools of Youth##30128
step
Cross the bridge |goto 54.47,32.91 < 15 |only if walking
talk Na Lek##55597
|tip At the top of the ruins.
Choose _"Attempt to free Na Lek from his prison."_ |gossip 1
Watch the dialogue
Kill the enemies that attack
click Water of Youth##210229+
|tip They look like blue spots in the water.
|tip They appear after you kill the enemies that attack.
collect The Water of Youth##78934 |q 30128/1 |goto 51.91,32.72
'|kill Sleeping Guardian##58419
step
label "Kill_Dojani_Enforcers"
kill 4 Dojani Enforcer##65626 |q 30127/3 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a large sword.
step
label "Kill_Dojani_Reclaimers"
kill 6 Dojani Reclaimer##58117 |q 30127/1 |goto 54.56,38.41
|tip They look like bulky humanoids wearing a cloak and carrying a staff.
step
label "Kill_Dojani_Surveyors"
kill 8 Dojani Surveyor##58068 |q 30127/2 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a spear.
step
label "Collect_Imperial_Lotus_Leaves"
click Imperial Lotus##210209+
|tip They look like plants with white flowers on them.
collect 20 Imperial Lotus Leaves##78918 |q 30130/1 |goto 54.56,38.41
step
talk Kor Bloodtusk##58114
turnin Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
|tip He walks around this area.
turnin Herbal Remedies##30130 |goto 59.89,24.71
turnin The Pools of Youth##30128 |goto 59.89,24.71
accept Life##30131 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
Tell him _"Go, stand by your wife's side. I will protect the tent from invaders."_ |gossip 1
Stand by Dezco's Side |q 30131/1 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
|tip Inside the building.
turnin Life##30131 |goto 60.42,25.57
accept Going West##30132 |goto 60.42,25.57
step
talk Koro Mistwalker##58547
turnin Into the Wilds##30133 |goto 44.21,42.89
accept Unsafe Passage##30269 |goto 44.21,42.89
step
clicknpc Sunwalker Scout##59136
collect Sunwalker Scout's Report##79745 |q 30132/1 |goto 43.79,42.78
step
talk Koro Mistwalker##58547
Tell him _"I'm ready, Koro."_ |gossip 1
Begin Escorting the Refugees |havebuff Mistwalking##113066 |goto 44.21,42.89 |q 30269
step
Watch the dialogue
|tip Follow Koro and protect him as he walks.
|tip He eventually walks to this location.
Kill the enemies that attack in waves
|tip Click Koro when he says he's pinned down to help him back up.
Accompany Koro to Crane Wing Refuge |q 30269/1 |goto 43.88,36.85
'|kill Riverblade Bloodletter##58983
step
Watch the dialogue
talk Koro Mistwalker##59138
|tip He runs to this location.
turnin Unsafe Passage##30269 |goto 40.58,33.68
accept Blinding the Riverblades##30270 |goto 40.58,33.68
accept Tread Lightly##30694 |goto 40.58,33.68
step
talk Ni the Merciful##62869
home Crane Wing Refuge |goto 40.76,34.52
step
talk Anduin Wrynn##58609
accept The Murksweats##30268 |goto 40.49,34.65
stickystart "Poke_Traps"
stickystart "Kill_Riverblade_Pathstalkers"
step
kill Murkscale Striker##58631+
|tip They look like snakes.
|tip Underwater.
collect 6 Murkscale Head##79199 |q 30268/1 |goto 35.81,38.05
You can find more around [39.46,36.36]
step
label "Poke_Traps"
click Riverblade Spike Trap+
|tip They look like spiked metal balls.
|tip Don't get too close to them, they explode.
Poke #10# Traps |q 30694/1 |goto 44.65,35.01
step
label "Kill_Riverblade_Pathstalkers"
kill 8 Riverblade Pathstalker##58858 |q 30270/1 |goto 44.65,35.01
|tip They look like lizard people.
step
talk Anduin Wrynn##58609
turnin The Murksweats##30268 |goto 40.49,34.65
step
talk Koro Mistwalker##59138
turnin Blinding the Riverblades##30270 |goto 40.58,33.68
turnin Tread Lightly##30694 |goto 40.58,33.68
accept Ahead on the Way##30695 |goto 40.58,33.68
accept Striking the Rain##30272 |goto 40.58,33.68
step
_Next to you:_
talk Anduin Wrynn##59189
accept Sha Can Awe##30271
stickystart "Inspire_Hopeless_Crane_Wing_Defenders"
stickystart "Slay_Sha_Manifestations"
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the West Pagoda |q 30695/1 |goto 37.79,54.16
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the East Pagoda |q 30695/2 |goto 43.04,54.29
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Ahead on the Way##30695
step
label "Inspire_Hopeless_Crane_Wing_Defenders"
Inspire #10# Hopeless Crane Wing Defenders |q 30271/1 |goto 40.48,49.41
|tip Kill enemies near Hopeless Crane Wing Defenders.
|tip They look like shadowy pandas kneeling or walking around slowly.
step
label "Slay_Sha_Manifestations"
Kill enemies around this area
|tip They look like shadow aliens.
Slay #18# Sha Manifestations |q 30272/1 |goto 40.48,49.41
'|kill Incarnation of Despair##65872, Haunt of Despair##59236, Source of Despair##65873
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Striking the Rain##30272
turnin Sha Can Awe##30271
accept In the House of the Red Crane##30273
step
Enter the building |goto 40.43,52.13 < 20 |walk
talk Chi-Ji##59653
|tip Downstairs inside the building.
|tip Follow the stairs down to reach the lower level.
Choose _<Reach out and touch Chi-Ji.>_ |gossip 1
Watch the dialogue
kill Sha of Despair##59651 |q 30273/1 |goto 40.44,54.49
|tip Fight him until he returns to the middle of the room.
|tip When he does that, run a bit up the stairs nearby and wait until his AoE attack finishes.
|tip Repeat this process.
|tip Also kill the enemies he spawns, if you can.
'|kill Echo of Despair##59687
step
Run back up the stairs and leave the building |goto 40.43,52.13 < 20 |walk |only if subzone("Temple of the Red Crane") and indoors()
talk Chi-Ji##59719
turnin In the House of the Red Crane##30273 |goto 40.42,49.22
step
talk Munch Windhoof##59047
fpath Dawnchaser Retreat |goto 29.00,50.31
step
talk Kor Bloodtusk##58114
turnin Going West##30132 |goto 28.69,50.88
step
talk Feather Keeper Li##65189
fpath Cradle of Chi-Ji |goto 31.14,63.16
step
talk Tony Tuna##60182
accept Particular Plumage##30667 |goto 51.66,75.30
step
talk Jay Cloudfall##60173
accept Sudden, Unexpected Crocolisk Aggression##30666 |goto 51.53,76.85
step
talk Nan-Po##60441
fpath Marista |goto 52.48,76.60
stickystart "Collect_Emerald_Tailfeathers"
stickystart "Collect_Dusky_Tailfeathers"
stickystart "Slay_Mortbreath_Crocolisks"
step
kill Crimson Lory##60198+
|tip They look like red birds.
collect 6 Crimson Tailfeather##80678 |q 30667/2 |goto 45.15,68.68
step
label "Collect_Emerald_Tailfeathers"
kill Emerald Lory##60200+
|tip They look like green birds.
collect 6 Emerald Tailfeather##80677 |q 30667/1 |goto 45.15,68.68
step
label "Collect_Dusky_Tailfeathers"
kill Dusky Lory##60196+
|tip They look like brown birds.
collect 6 Dusky Tailfeather##80679 |q 30667/3 |goto 45.15,68.68
step
label "Slay_Mortbreath_Crocolisks"
Kill Mortbreath enemies around this area
|tip They look like alligators with fins on their backs.
Slay #8# Mortbreath Crocolisks |q 30666/1 |goto 45.15,68.68
'|kill Mortbreath Skulker##60202, Mortbreath Snapper##60201
step
talk Tony Tuna##60182
turnin Particular Plumage##30667 |goto 51.66,75.30
step
talk Jay Cloudfall##60173
turnin Sudden, Unexpected Crocolisk Aggression##30666 |goto 51.53,76.85
accept Build Your Own Raft##30668 |goto 51.53,76.85
step
click Spare Plank##211379
collect 4 Spare Plank##80685 |q 30668/1 |goto 52.40,76.15
step
click Tough Kelp##211382
collect Tough Kelp##80804 |q 30668/2 |goto 52.25,77.90
step
talk Jay Cloudfall##60173
turnin Build Your Own Raft##30668 |goto 51.53,76.85
accept The Lorewalker on the Lake##30669 |goto 51.53,76.85
step
click Your Raft##211392
Pick Up Your Raft |q 30669/1 |goto 51.67,76.56
step
talk Wise Ana Wu##60139
turnin The Lorewalker on the Lake##30669 |goto 45.98,78.91
accept Wisdom Has A Price##30671 |goto 45.98,78.91
accept Misery##30691 |goto 45.98,78.91
stickystart "Collect_Shark_Fillets"
step
Enter the underwater cave |goto 46.03,80.00 < 20 |walk
kill Nahassa##60203
|tip Inside the underwater cave.
|tip Don't worry about the crocolisks that appear.
Put Nahassa out of His Misery |q 30691/1 |goto 46.20,83.46
step
_Click the Complete Quest Box:_
turnin Misery##30691
step
label "Collect_Shark_Fillets"
Leave the underwater cave |goto 46.03,80.00 < 20 |walk |only if subzone("Mortbreath Grotto") and indoors()
Kill enemies around this area
|tip They look like sharks.
|tip Underwater. |notinsticky
collect 5 Shark Fillet##80810 |q 30671/1 |goto 46.61,78.63
'|kill Great Grey Shark##60204, Nayeli Hammerhead##60432
step
talk Wise Ana Wu##60139
turnin Wisdom Has A Price##30671 |goto 45.98,78.91
accept Balance##30672 |goto 45.98,78.91
stickystart "Accept_Buried_Hozen_Treasure"
stickystart "Kill_Unga_Fish_Getters"
step
accept Balance Without Violence##30674 |goto 45.12,84.91
|tip You will automatically accept this quest.
stickystart "Throw_Flailing_Carps_Back_Into_The_Water"
step
label "Accept_Buried_Hozen_Treasure"
Kill Unga enemies around this area
|tip They look like monkeys.
accept Buried Hozen Treasure##30675 |goto 45.12,84.91
|tip You will eventually automatically accept this quest after looting.
'|kill Unga Fish-Getter##60299, Unga Treasure-Hider##60357
step
click Lump of Sand##211420+
|tip They look like brown piles of dirt.
|tip All along the beach. |notinsticky
collect Buried Hozen Treasure##80817 |q 30675/1 |goto 48.47,87.12
|only if haveq(30675) or completedq(30675)
step
_Click the Complete Quest Box:_
turnin Buried Hozen Treasure##30675
step
label "Throw_Flailing_Carps_Back_Into_The_Water"
clicknpc Flailing Carp##60367+
|tip They look like fish flopping on the ground.
|tip They are usually next to piles of fish.
|tip All along the beach. |notinsticky
Throw #6# Flailing Carp Back into the Water |q 30674/1 |goto 45.12,84.91
step
label "Kill_Unga_Fish_Getters"
kill 10 Unga Fish-Getter##60299 |q 30672/1 |goto 45.12,84.91
|tip They look like monkeys carrying spears.
step
_Click the Complete Quest Box:_
turnin Balance Without Violence##30674
step
talk Jay Cloudfall##60173
turnin Balance##30672 |goto 51.53,76.85
step
talk Kor Bloodtusk##58114
accept For the Tribe##30163 |goto 28.69,50.88
accept The Greater Danger##30229 |goto 28.69,50.88
step
talk Kang Bramblestaff##56112
accept Re-Reclaim##30230 |goto 28.84,50.57
step
talk Tired Shushen##58278
accept Thieving Raiders##30168 |goto 29.67,39.06
accept Raid Leader Slovan##30169 |goto 29.67,39.06
stickystart "Collect_Pillaged_Jinyu_Loot"
step
kill Slovan##58285 |q 30169/1 |goto 31.80,28.99
|tip Inside the cavern at the bottom of the waterfall.
step
label "Collect_Pillaged_Jinyu_Loot"
kill Riverblade Flesh-hunter##58274+
|tip They look like lizard people.
|tip Inside the cavern at the bottom of the waterfall. |notinsticky
collect 5 Pillaged Jinyu Loot##78958 |q 30168/1 |goto 32.61,29.46
step
talk Tired Shushen##58278
turnin Thieving Raiders##30168 |goto 29.67,39.06
turnin Raid Leader Slovan##30169 |goto 29.67,39.06
stickystart "Collect_Mogu_Artifacts"
stickystart "Kill_Korjan_Reclaimers"
step
clicknpc Dawnchaser Captive##58608+
|tip They look like red glowing tauren.
Rescue #8# Captives |q 30163/1 |goto 24.83,39.34
You can find more around [25.12,45.46]
step
label "Collect_Mogu_Artifacts"
click Mogu Artifact##212765+
|tip They look like various shaped golden objects.
collect 10 Mogu Artifact##79120 |q 30230/1 |goto 24.83,39.34
You can find more around [23.15,44.53]
step
label "Kill_Korjan_Reclaimers"
kill 8 Korjan Reclaimer##58614 |q 30229/1 |goto 24.83,39.34
|tip They look like bulky humanoids wearing cloaks.
You can find more around [25.12,45.46]
step
talk Kang Bramblestaff##56112
turnin Re-Reclaim##30230 |goto 28.84,50.57
step
talk Kor Bloodtusk##58114
turnin For the Tribe##30163 |goto 28.69,50.88
turnin The Greater Danger##30229 |goto 28.69,50.88
step
talk Ambassador Han##58630
accept The Mantid##30175 |goto 29.06,51.13
step
talk Sunwalker Dezco##58607
accept The Stoneplow Convoy##30164 |goto 15.98,39.79
stickystart "Slay_Ik'thallik_Mantid"
step
clicknpc Stoneplow Envoy##58955+
|tip They look like Pandaren laying on the ground.
Save #7# Stoneplow Envoy |q 30164/1 |goto 15.47,35.43
You can find more around [16.94,42.67]
step
label "Slay_Ik'thallik_Mantid"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #10# Ik'thallik Mantid |q 30175/1 |goto 13.91,38.19
'|kill Ik'thik Precursor##58367, Ik'thik Vanguard##58368
step
talk Ambassador Len##58954
turnin The Mantid##30175 |goto 15.70,39.72
step
talk Sunwalker Dezco##58607
turnin The Stoneplow Convoy##30164 |goto 15.98,39.79
accept For Family##30174 |goto 15.98,39.79
step
talk Kor Bloodtusk##58670
Choose _<Try to free Kor Bloodtusk from his bonds.>_ |gossip 1
kill Groundbreaker Brojai##58224 |q 30174/1 |goto 23.64,48.83
step
talk Sunwalker Dezco##58607
turnin For Family##30174 |goto 28.90,50.87
accept Warn Stoneplow##30241 |goto 28.90,50.87
step
talk Loon Mai##56720
turnin Warn Stoneplow##30241 |goto Valley of the Four Winds/0 19.55,56.87
step
Watch the dialogue
talk Mei Barrelbottom##59855
accept The Mantidote##30623 |goto 17.96,56.45
step
talk Loon Mai##56720
accept The Swarm Begins##30622 |goto 17.84,56.23
step
talk Mudmug##56474
|tip He walks around this area.
accept It Does You No Good In The Keg##30653 |goto 18.16,55.73
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 30653 |future
stickystart "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
stickystart "Slay_Ikthallik_Infestors_Or_Warriors"
step
Deliver Beer to Zhu's Wardens |q 30653/1 |goto 17.45,50.27
step
Deliver Beer to Crane Wing Priests |q 30653/2 |goto 15.14,55.43
step
Deliver Beer to Tauren Settlers |q 30653/4 |goto 12.99,55.98
step
Deliver Beer to Shado-Pan |q 30653/3 |goto 10.63,55.58
step
_Click the Complete Quest Box:_
turnin It Does You No Good In The Keg##30653
step
label "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
use Ken-Ken's Mask##80337
|tip Use it on Ik'thik Wing Commanders.
|tip Make sure they have the "Lashing Out in Fear" buff.
|tip They look like larger insects.
kill Manifestation of Fear##59874+
Use Ken-Ken's Mask on #5# Ik'thik Wing Commanders |q 30623/1 |goto 12.93,54.85
You can find more around [16.35,53.47]
'|kill Ik'thik Wing Commander##56723
step
_Click the Complete Quest Box:_
turnin The Mantidote##30623
step
label "Slay_Ikthallik_Infestors_Or_Warriors"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #15# Ik'thallik Infestors or Warriors |q 30622/1 |goto 12.93,54.85
'|kill Ik'thik Infestor##56721, Ik'thik Warrior##56722
step
talk Guard Captain Oakenshield##57198
turnin The Swarm Begins##30622 |goto 11.60,49.52
accept Students No More##30625 |goto 11.60,49.52
step
Watch the dialogue
|tip Follow your allies and kill enemies around this area.
|tip They may already be in the battlefield, so you may have to find them.
|tip They will yell at you to come over to them when you are near them.
kill Ik'thik Bloodrager##59887 |q 30625/1 |goto 9.26,54.09
kill Ik'thik Incubator##59890 |q 30625/2 |goto 9.26,54.09
kill Ik'thik Tendon-Slicer##59888 |q 30625/3 |goto 9.26,54.09
kill Ik'thik Fearmonger##59889 |q 30625/4 |goto 9.26,54.09
step
talk Guard Captain Oakenshield##57198
turnin Students No More##30625 |goto 11.60,49.52
accept Retreat!##30626 |goto 11.60,49.52
step
talk Loon Mai##56720
turnin Retreat!##30626 |goto 17.84,56.23
step
talk Master Bruised Paw##59856
accept The Savior of Stoneplow##30627 |goto 17.91,55.75
step
talk Miss Fanny##59857
Tell her _"Let's go, Miss Fanny."_ |gossip 1
Ride Miss Fanny |invehicle |goto 17.93,56.69 |q 30627
step
Reach the Mantid Colossus |outvehicle |goto 7.55,54.76 |q 30627 |notravel
step
Watch the dialogue
|tip Use the ability on your action bar when the circle at the bottom of your screen is full and glowing.
|tip You will have to use the ability multiple times.
kill Mantid Colossus##56703 |q 30627/1 |goto 7.55,54.76
step
talk Loon Mai##56720
turnin The Savior of Stoneplow##30627 |goto 17.84,56.23
accept The Gratitude of Stoneplow##30628 |goto 17.84,56.23
step
click The Commander's Cache##211316
|tip Upstairs inside the building.
turnin The Gratitude of Stoneplow##30628 |goto 19.82,55.92
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Kun-Lai Summit (20-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KunLai",
next="Leveling Guides\\Pandaria (10-60)\\Townlong Steppes (25-60)",
condition_suggested=function() return level >= 20 and level <= 50 and not completedq(30752) end,
startlevel=20,
endlevel=50,
},[[
step
talk Highroad Grummle##62738
Speak with Highroad Grummle |q 31255/1 |goto Valley of the Four Winds/0 70.05,23.47
|only if haveq(31255) or completedq(31255)
step
talk Shin the Weightless##61759
|tip On top of the mountain.
fpath Tavern in the Mists |goto The Veiled Stair/0 56.72,75.75
step
talk Tong the Fixer##62917
|tip Inside the building.
home Tavern in the Mists |goto 55.07,72.40
step
talk Len the Whisperer##63484
accept Robbing Robbers of Robbers##31286 |goto 53.51,65.76
accept Educating Saurok##31287 |goto 53.51,65.76
stickystart "Collect_Black_Market_Merchandise"
step
Enter the cave |goto 54.86,55.01 < 15 |walk
Follow the path up |goto 44.26,47.28 < 15 |walk
kill Leechfingers##63494 |q 31287/1 |goto 51.12,43.38
|tip Upstairs inside the cave.
step
label "Collect_Black_Market_Merchandise"
click Various Objects
|tip They look like various shaped objects with different names.
|tip Inside the cave. |notinsticky
collect 7 Black Market Merchandise##85891 |q 31286/1 |goto 54.86,55.01
step
Leave the cave |goto 54.86,55.01 < 15 |walk |only if subzone("Hatescale Burrow") and indoors()
talk Len the Whisperer##63484
turnin Robbing Robbers of Robbers##31286 |goto 53.51,65.76
turnin Educating Saurok##31287 |goto 53.51,65.76
step
talk Brewmaster Boof##63367
Speak with Brewmaster Boof |q 31254/2 |goto 51.91,43.74
step
talk Brewmaster Boof##63367
accept The Spring Drifter##31285 |goto 51.91,43.74
step
clicknpc The Spring Drifter##63517
Ride the Spring Drifter |invehicle |goto 52.03,43.08 |q 31285
step
Watch the dialogue
Survive a Ride on the Spring Drifter |q 31285/1 |goto Kun-Lai Summit/0 72.66,93.10 |notravel
step
talk Brewmaster Boof##63367
turnin The Spring Drifter##31285 |goto 72.66,93.02
step
talk Jo the Wind Watcher##61474
fpath Binan Village |goto 72.54,94.17
step
talk Apothecary Cheng##59077
accept Hit Medicine##30460 |goto 71.57,92.83
step
talk Mayor Bramblestaff##59073
turnin The Road to Kun-Lai##31255 |goto 72.27,91.86 |only if haveq(31255) or completedq(31255)
accept Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Puli the Even Handed##62871
|tip Inside the building.
home Binan Brew & Stew |goto 72.67,92.34 |q 30460 |future
step
talk Commander Hsieh##59076
accept All of the Arrows##30459 |goto 70.75,90.36
stickystart "Slay_Bataari_Tribe_Members"
stickystart "Heal_Injured_Binan_Warriors"
stickystart "Collect_Arrows_Of_Commander_Hsieh"
step
kill Bataari Fire-Warrior##59083 |q 30457/2 |goto 68.01,88.63
|tip He looks like a tauren riding on a large yak that walks along this path.
|tip He will appear as a yellow dot on your minimap.
|tip He appears at this location.
Also check around [69.89,89.45]
step
label "Slay_Bataari_Tribe_Members"
Kill Bataari enemies around this area
|tip They look like tauren.
Slay #10# Bataari Tribe Members |q 30457/1 |goto 69.23,89.76
'|kill Bataari Yaungol##58961, Bataari Flamecaller##59021
step
label "Heal_Injured_Binan_Warriors"
use the Dit Da Jow##79819
|tip Use it on Injured Binan Warriors.
|tip They look like kneeling pandas.
Heal #8# Injured Binan Warriors |q 30460/1 |goto 69.23,89.76
'|talk Injured Binan Warrior##59143
step
label "Collect_Arrows_Of_Commander_Hsieh"
click Arrow of Commander Hsieh##210759+
|tip They look like the back feathers of arrows sticking out of the ground.
collect 12 Arrow of Commander Hsieh##79806 |q 30459/1 |goto 69.23,89.76
step
talk Commander Hsieh##59076
turnin All of the Arrows##30459 |goto 70.75,90.36
step
talk Mayor Bramblestaff##59073
turnin Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Apothecary Cheng##59077
turnin Hit Medicine##30460 |goto 71.57,92.83
accept General Nazgrim has Awakened##30511 |goto 71.57,92.83
step
talk General Nazgrim##59442
|tip Upstairs inside the building.
turnin General Nazgrim has Awakened##30511 |goto 71.65,93.10
accept Eastwind Rest##30513 |goto 71.65,93.10
step
talk Merchant Shi##59263
accept Reposesssion##30469 |goto 74.96,88.86
accept My Son...##30467 |goto 74.96,88.86
step
talk Swordmistress Mei##59273
accept Enraged Vengeance##30468 |goto 74.79,88.68
step
talk Waterspeaker Gorai##60973
accept The Waterspeaker's Staff##30496 |goto 75.13,87.94
accept Free the Dissenters##30967 |goto 75.13,87.94
stickystart "Help_Inkgill_Dissenters_Escape"
stickystart "Collect_Stolen_Supplies"
stickystart "Slay_Enraged_Jinyus"
step
talk Wu-Peng##59272
turnin My Son...##30467 |goto 74.68,76.93
accept Father and Child Reunion##30834 |goto 74.68,76.93
step
kill Orachi##59180
|tip He walks around this area.
|tip He will appear as a yellow dot on your minimap.
collect Stolen Inkgill Ritual Staff##81385 |q 30496/1 |goto 74.45,78.53
step
label "Help_Inkgill_Dissenters_Escape"
talk Inkgill Dissenter##61566+
|tip They look like scared fish people.
Tell them _"There's still hope - Gorai is still alive, to the south. Go!"_ |gossip 1
Help #6# Inkgill Dissenters Escape |q 30967/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
step
label "Collect_Stolen_Supplies"
click Untainted Supplies##210889+
|tip They look like green and silver metal containers.
collect 8 Stolen Supplies##79880 |q 30469/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
step
label "Slay_Enraged_Jinyus"
Kill Enraged enemies around this area
|tip They look like fish people.
Slay #15# Enraged Jinyus |q 30468/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
'|kill Orachi##59180, Enraged Tideweaver##59181, Enraged Cavalier##61537, Enraged Enforcer##60995, Enraged Spearman##59165, Enraged Priest##59166, Enraged Blacksmith##61130
step
talk Waterspeaker Gorai##60973
turnin The Waterspeaker's Staff##30496 |goto 75.20,88.26
turnin Free the Dissenters##30967 |goto 75.20,88.26
step
Watch the dialogue
Reunite Wu-Peng and Merchant Shi |q 30834/1 |goto 74.96,88.86
step
talk Merchant Shi##59263
turnin Reposesssion##30469 |goto 74.96,88.86
turnin Father and Child Reunion##30834 |goto 74.96,88.86
step
talk Swordmistress Mei##59273
turnin Enraged Vengeance##30468 |goto 74.79,88.68
step
talk Waterspeaker Gorai##60973
accept The Ritual##30480 |goto 75.20,88.26
step
talk Waterspeaker Gorai##60973
Tell him _"I'm ready. Begin the ritual."_ |gossip 1
Speak to Waterspeaker Gorai to Begin the Ritual |q 30480/1 |goto 75.20,88.26
step
Watch the dialogue
|tip Follow Waterspeaker Gorai as he walks.
|tip He eventually walks to this location.
Lay the Dead Inkgill to Rest |q 30480/2 |goto 74.90,88.58
step
Watch the dialogue
kill Explosive Hatred##61530
Complete the Ritual |q 30480/3 |goto 74.90,88.58
step
Watch the dialogue
talk Waterspeaker Gorai##60973
turnin The Ritual##30480 |goto 74.90,88.58
accept Cleansing the Mere##30828 |goto 74.90,88.58
step
clicknpc Pool of Corruption##61500+
|tip They look like spots of smoke rising out of the water around this area.
Watch the dialogue
kill Boiling Rage##59170+
Cleanse #6# Pools of Corruption |q 30828/1 |goto 71.54,85.29
step
_Next to you:_
talk Waterspeaker Gorai##61065
turnin Cleansing the Mere##30828
accept The Fall of Shai Hu##30855
step
kill Shai Hu##61069 |q 30855/1 |goto 71.24,82.53
|tip You will lose 5% of your health every 5 seconds.
|tip Kill Explosive Hatred enemies around this area near him to hurt him.
'|kill Explosive Hatred##61070
step
talk Waterspeaker Gorai##60973
turnin The Fall of Shai Hu##30855 |goto 74.91,88.58
step
talk Farmhand Ko##63751
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 1
Speak with Farmhand Ko |q 30513/1 |goto 63.68,86.65
step
talk Elder Shiao##63535
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 1
Speak with Elder Shiao |q 30513/2 |goto 61.20,82.22
step
talk Elder Shiao##63535
turnin Eastwind Rest##30513 |goto 61.20,82.22
accept Challenge Accepted##30515 |goto 61.20,82.22
step
click Yaungol Banner##210933
Watch the dialogue
kill Ur-Bataar##59483 |q 30515/1 |goto 58.19,84.09
step
talk Elder Shiao##63535
turnin Challenge Accepted##30515 |goto 61.57,80.19
step
talk General Nazgrim##59442
|tip Inside the building.
accept Round 'Em Up##31256 |goto 63.00,80.20
step
talk Rivett Clutchpop##59448
accept Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk Farmhand Ko##63751
accept Trouble on the Farmstead##30570 |goto 62.54,79.44
step
talk Elder Shiao##63535
accept Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
step
talk Soaring Paw##61745
fpath Eastwind Rest |goto 62.44,80.72
step
talk Shademaster Kiryn##59449
accept Deanimate the Reanimated##30594 |goto 62.70,80.72
step
talk Mai the Sleepy##62883
home Eastwind Rest |goto 62.73,80.49 |q 30999 |future
stickystart "Collect_Kun_Lai_Meaty_Bits"
step
clicknpc Wild Plains Yak##59610+
|tip They look like brown bison.
|tip They will begin following you.
|tip You can have 3 following you at once.
Round Up #3# Yaks |q 31256/1 |goto 65.02,78.75
Bring them to [62.61,79.36]
step
label "Collect_Kun_Lai_Meaty_Bits"
Kill enemies around this area
|tip They look like various beasts.
|tip Wild Plains Yaks will not drop the quest item.
collect 160 Kun-Lai Meaty Bits##80245 |q 31251/1 |goto 65.02,78.75
'|kill Highlands Calf##59671, Highlands Mushan##59670, Summit Bonestripper##59672, Razorquill Porcupine##65839
step
talk Rivett Clutchpop##59448
turnin Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
turnin Round 'Em Up##31256 |goto 63.00,80.20
step
talk Farmer Chow##59573
turnin Trouble on the Farmstead##30570 |goto 60.24,85.79
accept Farmhand Freedom##30571 |goto 60.24,85.79
step
talk Uyen Chow##59636
accept ... and the Pot, Too!##30581 |goto 60.17,85.91
step
click Cast Iron Pot##211023
|tip Inside the building.
collect Cast Iron Pot##80230 |q 30581/2 |goto 60.02,88.44
stickystart "Collect_Root_Vegetables"
step
kill Ordo Overseer##59580+
|tip They look like tauren next to groups of Pandaren.
Free #12# Farmstead Slaves |q 30571/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
label "Collect_Root_Vegetables"
kill Wascally Wirmen##59655+
|tip They look like small piles of dirt that move around on the ground.
click Root Vegetable##211019+
|tip They look like green leafy vegetable stalks sticking out of the ground.
collect 12 Root Vegetable##80227 |q 30581/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
talk Uyen Chow##59636
turnin ... and the Pot, Too!##30581 |goto 60.17,85.91
step
talk Farmer Chow##59573
turnin Farmhand Freedom##30571 |goto 60.24,85.79
accept Back to Eastwind Rest##31253 |goto 60.24,85.79
step
talk Farmhand Ko##63751
turnin Back to Eastwind Rest##31253 |goto 62.54,79.44
step
talk Bao Jian##59821
accept Profiting off of the Past##30595 |goto 59.61,78.22
stickystart "Collect_Mogu_Relics"
stickystart "Destroy_Terracotta_Guardians_Or_Warriors"
step
kill Mogujia Soul-Caller##59797 |q 30620/1 |goto 58.12,70.89
step
label "Collect_Mogu_Relics"
Kill Terracotta enemies around this area
click Mogu Relic##211148+
|tip They look like various shaped stone objects.
collect 12 Mogu Relic##80294 |q 30595/1 |goto 58.58,75.71
'|kill Terracotta Warrior##59758, Terracotta Guardian##59773
step
label "Destroy_Terracotta_Guardians_Or_Warriors"
Kill Terracotta enemies around this area
|tip They look like bulky humanoids and lions.
Destroy #14# Terracotta Guardians or Warriors |q 30594/1 |goto 58.58,75.71
'|kill Terracotta Warrior##59758, Terracotta Guardian##59773
step
talk Bao Jian##59821
turnin Profiting off of the Past##30595 |goto 59.61,78.22
step
talk Elder Shiao##63535
turnin Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
accept Pandaren Prisoners##30655 |goto 62.34,79.61
step
talk Rivett Clutchpop##59448
accept Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
accept In Tents Channeling##30657 |goto 63.00,80.20
step
talk Shademaster Kiryn##59449
turnin Deanimate the Reanimated##30594 |goto 62.70,80.72
stickystart "Rescue_Pandaren_Prisoners"
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 51.23,79.31 |q 30656
step
use the Explosives Barrel##80528
Destroy the Eastern Oil Rig |q 30656/1 |goto 51.05,79.41
step
kill Musaan the Blazecaster##59969 |q 30657/1 |goto 50.45,78.59
|tip Inside the tent.
step
kill Harala the Firespeaker##60030 |q 30657/3 |goto 49.43,78.48
|tip Inside the tent.
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 49.57,78.97 |q 30656
step
kill Pao-kun the Pyromancer##60031 |q 30657/4 |goto 49.13,80.31
|tip Inside the tent.
step
use the Explosives Barrel##80528
Destroy the Southern Oil Rig |q 30656/2 |goto 49.61,80.94
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |q 30656 |goto 49.34,81.10
step
use the Explosives Barrel##80528
Destroy the Western Oil Rig |q 30656/3 |goto 47.87,81.39
step
kill Akonu the Embercaller##60032 |q 30657/2 |goto 47.71,80.01
|tip Inside the tent.
step
_Click the Complete Quest Box:_
turnin In Tents Channeling##30657
accept The Ordo Warbringer##30661
step
label "Rescue_Pandaren_Prisoners"
clicknpc Pandaren Prisoner##60038+
|tip They look like panda people with ball and chains on their legs, or inside wooden cages.
Rescue #8# Pandaren Prisoners |q 30655/1 |goto 49.88,79.97
step
kill Ordo Warbringer##60127 |q 30661/1 |goto 48.35,76.72
|tip When his shield appears, kill the enemies that appear to remove it.
|tip Inside the small cave.
step
talk Rivett Clutchpop##59448
turnin Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip He walks around this area.
turnin Pandaren Prisoners##30655 |goto 62.31,80.63
turnin The Ordo Warbringer##30661 |goto 62.31,80.63
accept The Shado-Pan##31453 |goto 62.31,80.63
step
talk Elder Shiao##63535
accept Beyond the Wall##31695 |goto 62.34,79.61
step
talk Farmhand Ko##63751
accept Muskpaw Ranch##31457 |goto 62.54,79.44
step
talk Shademaster Kiryn##59449
accept Cho's Missive##31459 |goto 62.70,80.72
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin Muskpaw Ranch##31457 |goto 71.34,69.68
accept The Missing Muskpaw##30488 |goto 71.34,69.68
accept Fresh Needle Scent##30489 |goto 71.34,69.68
stickystart "Collect_Pungent_Sprite_Needles"
step
Enter the cave |goto 72.99,73.44 < 15 |walk
talk Muskpaw Jr.##61693
|tip He runs around this area inside the cave.
|tip Kill the enemies attacking him to be able to talk to him.
turnin The Missing Muskpaw##30488 |goto Kun-Lai Summit/9 64.23,61.16
accept At the Yak Wash##30491 |goto Kun-Lai Summit/9 64.23,61.16
step
clicknpc Tuffi##61874
|tip Inside the cave.
Ride Tuffi |invehicle |goto 65.54,58.89 |q 30491
step
Wash an Escaped Yak |q 30491/1 |goto Kun-Lai Summit/0 71.36,69.15 |count 1 |notravel
step
label "Collect_Pungent_Sprite_Needles"
kill Needle Sprite##55593+
|tip They look like imps.
|tip Inside and outside the cave. |notinsticky
collect 100 Pungent Sprite Needles##79952 |q 30489/1 |goto 73.16,73.57
step
Leave the cave |goto 72.99,73.44 < 15 |walk |only if subzone("Pranksters' Hollow") and indoors()
accept Yakity Yak##30587 |goto 69.41,74.15
|tip You will automatically accept this quest.
stickystart "Kill_Burilgi_Despoilers"
step
kill Burilgi Despoiler##59335+
|tip They look like tauren.
accept The Late Mrs. Muskpaw##30582 |goto 68.17,73.63
|tip You will eventually automatically accept this quest after looting.
step
clicknpc Escaped Yak##59319+
|tip They look like brown bison.
Wash #6# Escaped Yaks |q 30491/1 |goto 68.17,73.63
Ride them to [71.36,69.15]
step
talk Muskpaw Jr.##59354
turnin At the Yak Wash##30491 |goto 71.39,69.28
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin Fresh Needle Scent##30489 |goto 71.51,69.94
turnin The Late Mrs. Muskpaw##30582 |goto 71.51,69.94
accept The Fearmaster##30804 |goto 71.51,69.94
step
kill The Fearmaster##59656 |q 30804/1 |goto 67.84,73.99
step
label "Kill_Burilgi_Despoilers"
kill 9 Burilgi Despoiler##59335 |q 30587/1 |goto 68.17,73.63
|tip They look like tauren.
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin The Fearmaster##30804 |goto 71.51,69.94
turnin Yakity Yak##30587 |goto 71.51,69.94
step
talk Muskpaw Jr.##59354
accept Back in Yak##30492 |goto 71.39,69.28
step
Bring the Yak Herd to Lucky Eightcoins |q 30492/1 |goto 65.38,61.71
step
talk Slimy Inkstain##59402
accept Oil Stop##30614 |goto 65.49,60.82
step
talk Smokey Sootassle##59597
accept Traffic Issues##30616 |goto 64.88,60.49
step
talk Li Goldendraft##59405
|tip Inside the building.
home The Two Fisted Brew |goto 64.24,61.39
step
talk Lucky Eightcoins##59371
turnin Back in Yak##30492 |goto 64.71,61.76
accept A Grummle's Luck##30808 |goto 64.71,61.76
stickystart "Collect_Stolen_Luckydos"
stickystart "Slay_Ruqin_Yaungols"
step
click Yaungol Oil Derrick##211531
collect Filled Oil Vial##80311 |q 30614/1 |goto 63.32,68.45
step
label "Collect_Stolen_Luckydos"
click Stolen Bag of Luckydos##211538+
|tip They look like small tan bags on the ground and inside huts.
collect 8 Stolen Luckydos##81293 |q 30808/1 |goto 62.80,67.52
step
label "Slay_Ruqin_Yaungols"
Kill Ruqin enemies around this area
|tip They look like tauren.
Slay #8# Ruqin Yaungols |q 30616/1 |goto 62.80,67.52
'|kill Ruqin Elder##59826, Ruqin Infantry##59790, Ruqin Outrider##59538
step
talk Lucky Eightcoins##59371
turnin A Grummle's Luck##30808 |goto 64.71,61.76
step
talk Slimy Inkstain##59402
turnin Oil Stop##30614 |goto 65.49,60.82
step
talk Smokey Sootassle##59597
turnin Traffic Issues##30616 |goto 64.88,60.50
accept Roadside Assistance##30617 |goto 64.88,60.50
step
click Lucky Burlap Incense##211539+
|tip They look like thin sticks stuck in the ground along the road.
Light #8# Lucky Burlap Incense |q 30617/1 |goto 60.19,65.28
step
talk Brother Lintpocket##59701
turnin Roadside Assistance##30617 |goto 58.09,61.47
step
talk Little Cleankite##61504
fpath One Keg |goto 57.73,59.69
step
talk Chiyo Mistpaw##59688
|tip She walks around this small area.
|tip Inside the building.
home The Lucky Traveller |goto 57.37,60.00 |q 30621 |future
step
talk Lorewalker Cho##61847
turnin Cho's Missive##31459 |goto 57.34,61.69
accept Path Less Traveled##30999 |goto 57.34,61.69
step
talk Uncle Cloverleaf##59696
turnin Path Less Traveled##30999 |goto 57.22,61.20
accept Instant Courage##30601 |goto 57.22,61.20
step
talk Big Sal##59695
|tip Inside the building.
accept Resupplying Onekeg##30618 |goto 57.72,61.77
step
talk Ji-Lu the Lucky##59716
|tip Inside the building.
accept They Stole My Luck!##30621 |goto 57.32,60.20
stickystart "Inspire_Hiding_Guides"
stickystart "Collect_Stolen_Supplies_30618"
step
Enter the cave |goto 59.28,52.68 < 30 |walk
kill Suspicious Snow Pile##59967+
|tip They look like white mounds on the ground.
|tip Inside the cave.
kill Mischievous Snow Sprite##59693+
|tip They look like imps.
collect Lucky Virmen's Foot##80316 |q 30621/1 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky Yak Shoe##80317 |q 30621/2 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky Four Winds Clover##90318 |q 30621/3 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky "Gold" Coin##80319 |q 30621/4 |goto Kun-Lai Summit/8 70.02,86.55
step
label "Inspire_Hiding_Guides"
talk Hiding Guide##59818+
|tip They look like larger wicker baskets with red stripes on them.
|tip Inside the cave. |notinsticky
Ask them _"Are you sure you don't want to come with me?"_
Inspire #3# Hiding Guides |q 30601/1 |goto 70.02,86.55
step
label "Collect_Stolen_Supplies_30618"
click Stolen Supplies##211270+
|tip They look like various shaped objects on the ground.
|tip Inside the cave. |notinsticky
collect 8 Stolen Supplies##80315 |q 30618/1 |goto 70.02,86.55
step
Leave the cave |goto Kun-Lai Summit/0 59.28,52.68 < 30 |walk |only if subzone("Howlingwind Cavern") and indoors()
talk Ji-Lu the Lucky##59716
|tip Inside the building.
turnin They Stole My Luck!##30621 |goto Kun-Lai Summit/0 57.32,60.20
step
talk Uncle Cloverleaf##59696
turnin Instant Courage##30601 |goto 57.22,61.20
step
talk Big Sal##59695
|tip Inside the building.
turnin Resupplying Onekeg##30618 |goto 57.72,61.77
step
talk Uncle Cloverleaf##59696
accept Comin' Round the Mountain##30487 |goto 57.22,61.20
step
clicknpc Ji-Lu's Cart##60094
Jump in Ji-Lu's Cart |q 30487/1 |goto 57.32,61.58
step
Kill the enemies that attack in waves
|tip Use the abilities on your action bar.
Survive the Mountain Pass |q 30487/2 |goto 48.10,49.01 |notravel
'|kill Knucklethump Attacker##60138, Rampaging Yeti##59694
step
talk Lucky Bluestring##60175
turnin Comin' Round the Mountain##30487 |goto 48.14,49.04
accept One Traveler's Misfortune##30683 |goto 48.14,49.04
step
click Abandoned Wreckage##212903
Search the Abandoned Wreckage for Supplies |q 30683/1 |goto 50.06,49.24
step
Watch the dialogue
Kill the enemies that attack
kill General Sho Lien##60769 |q 30683/2 |goto 50.06,49.24
'|kill Stone Guardian##63155
step
talk Lucky Bluestring##60175
turnin One Traveler's Misfortune##30683 |goto 48.14,49.04
accept Seeker's Folly##30684 |goto 48.14,49.04 |or
'|accept Seeker's Folly##31306 |goto 48.14,49.04 |or
step
click Shrine of the Seeker's Body##211597
|tip Avoid the falling snowballs.
Honor the Shrine of the Seeker's Body |q 30684/1 |goto 44.79,49.17 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Body |q 31306/1 |goto 44.79,49.17 |only if haveq(31306) or completedq(31306)
step
click Shrine of the Seeker's Breath##211601
|tip Avoid the tornados.
Honor the Shrine of the Seeker's Breath |q 30684/2 |goto 42.69,50.02 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Breath |q 31306/2 |goto 42.69,50.02 |only if haveq(31306) or completedq(31306)
step
click Shrine of the Seeker's Heart##211602
Honor the Shrine of the Seeker's Heart |q 30684/3 |goto 43.18,51.98 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Heart |q 31306/3 |goto 43.18,51.98 |only if haveq(31306) or completedq(31306)
step
talk Lorewalker Cho##60795
turnin Seeker's Folly##30684 |or |goto 43.79,51.05 |only if haveq(30684) or completedq(30684)
turnin Seeker's Folly##31306 |or |goto 43.79,51.05 |only if haveq(31306) or completedq(31306)
accept The Tongue of Ba-Shon##30829 |goto 43.79,51.05
step
talk Lorewalker Cho##60795
Tell him _"Go ahead with the binding, Cho."_ |gossip 1
Watch the dialogue
kill Reclaimer Zuan##61305
Bind the Tongue of Ba-Shon |q 30829/1 |goto 43.79,51.05
step
talk Lorewalker Cho##60795
turnin The Tongue of Ba-Shon##30829 |goto 43.76,51.11
accept Staying Connected##30795 |goto 43.76,51.11
step
talk Mishi##60796
Tell her _"I'm ready to leave."_ |gossip 1
Begin Flying to the Valley of Emperors |invehicle |goto 43.74,51.32 |q 30795
step
Fly to the Valley of Emperors |outvehicle |goto 57.87,48.97 |q 30795 |notravel
step
use The Tongue of Ba-Sho##81712
Use the Tongue of Ba-Shon in the Valley of Emperors |q 30795/1 |goto 57.87,48.97
step
_Next to you:_
talk Image of Lorewalker Cho##61297
turnin Staying Connected##30795
accept An End to Everything##30796
stickystart "Kill_Tormented_Spirits"
step
click Curious Text##211780
accept It Was Almost Alive##30797 |goto 57.11,47.90
step
click Curious Text##211780
collect Torn Page##81892 |q 30797/1 |goto 57.11,47.90
step
label "Kill_Tormented_Spirits"
kill 5 Tormented Spirits##60825 |q 30796/1 |goto 57.31,48.01
|tip They look like banshees.
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin An End to Everything##30796
turnin It Was Almost Alive##30797
accept The Tomb of Shadows##30799
step
Enter the building |goto 55.89,46.18 < 10 |walk
click Shen Dynasty Tablet##211770
|tip Inside the building.
collect Shen Dynasty Rubbing##82393 |q 30799/1 |goto 57.14,43.49
step
click Qiang Dynasty Tablet##211794
|tip Inside the building.
collect Qiang Dynasty Rubbing##82394 |q 30799/3 |goto 57.07,45.04
step
click Wai Dynasty Tablet##211793
|tip Inside the building.
collect Wai Dynasty Rubbing##82395 |q 30799/2 |goto 56.37,43.43
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin The Tomb of Shadows##30799
accept Breaking the Emperor's Shield##30798
step
Leave the building |goto 55.89,46.18 < 10 |walk |only if subzone("Tomb of Shadows") and indoors()
Run up the stairs and enter the building |goto 53.33,49.29 < 10 |walk
Watch the dialogue
|tip Inside the building.
Kill the enemies that attack in waves
kill Nakk'rakas##60572
Interrupt the Spiritbinding Ritual |q 30798/1 |goto 52.96,51.39
'|kill Imperial Guard##60826
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Breaking the Emperor's Shield##30798
accept Stealing Their Thunder... King##30800
step
_NOTE:_
During the Next Steps
|tip Avoid the tiles on the floor with colorful designs, they are traps.
Click Here to Continue |confirm |q 30800
step
Leave the building |goto 53.33,49.29 < 10 |walk |only if subzone("Tomb of Secrets") and indoors()
Enter the building |goto 52.96,46.59 < 10 |walk
click King's Coffer##211967
|tip Inside the building.
collect Bottom Fragment of Lei Shen's Tablet##82764 |q 30800/1 |goto Kun-Lai Summit/17 58.65,72.68
step
click Top Fragment of Lei Shen's Tablet##211968
|tip Inside the building.
Repair the Tablet of Thunder |q 30800/2 |goto 34.15,61.48
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Stealing Their Thunder... King##30800
accept Lessons from History##30801
step
click Tablet of Thunder
|tip Inside the building.
Read the Tablet of Thunder |q 30801/1 |goto 34.15,61.48
step
Watch the dialogue
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Lessons from History##30801
accept Chasing the Storm##30802
step
kill Zandalari Warrior##61842+
|tip Inside the building.
collect Blood-Revealed Map##81890 |q 30802/1 |goto 59.51,72.19
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Chasing the Storm##30802
accept Fisherman's Tale##30935
step
Leave the building |goto Kun-Lai Summit/0 52.96,46.59 < 10 |walk |only if subzone("Tomb of Conquerors") and indoors()
talk Mishi##61382
Tell her _"I'm ready to leave."_ |gossip 1
Speak to Mishi Outside of Lei Shen's Tomb |q 30935/1 |goto Kun-Lai Summit/0 52.97,46.39
step
Begin Flying to the Path of Conquerors |invehicle |goto 52.97,46.39 |q 30935
step
Fly to the Path of Conquerors |outvehicle |goto 63.92,47.85 |q 30935 |notravel
step
Leave the cave |goto 63.94,49.65 < 20 |walk |only if subzone("Path of Conquerors") and indoors()
Follow the path up |goto 66.91,57.69 < 20 |only if walking
talk Sunwalker Dezco##64542
|tip Inside the building.
turnin Temple of the White Tiger##31393 |goto 68.73,43.01 |only if haveq(31393) or completedq(31393)
accept A Celestial Experience##31395 |goto 68.73,43.01
step
talk Xuen##64528
|tip Inside the building.
Speak to Xuen |q 31395/1 |goto 68.88,42.79
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Violence##64656
Pass the First Test |q 31395/2 |goto 68.78,43.98
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Anger##64684
Pass the Second Test |q 31395/3 |goto 68.78,43.98
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Hatred##64744
Pass the Third Test |q 31395/4 |goto 68.78,43.98
step
talk Sunwalker Dezco##64542
|tip Inside the building.
turnin A Celestial Experience##31395 |goto 68.73,43.01
accept A Witness to History##31511 |goto 68.73,43.01
step
Leave the building |goto 68.60,46.07 < 20 |walk |only if subzone("Temple of the White Tiger") and indoors()
talk Big Greenfeather##61118
|tip At the top of the mountain.
fpath Temple of the White Tiger |goto 66.31,50.66
step
Run down the mountain and run through the tunnel |goto 63.94,49.59 < 30 |only if walking
talk Shin Whispercloud##61380
Tell him _"I'm ready to leave."_ |gossip 1
Speak to Anduin at the Gate of the August Celestials |q 30935/2 |goto 63.32,40.22
step
Begin Flying to the Zouchin Province |invehicle |goto 63.32,40.22 |q 30935
step
Fly to the Zouchin Province |outvehicle |goto 63.59,34.88 |q 30935 |notravel
step
talk Bo the Wind Claimer##61511
fpath Zouchin Village |goto 62.42,30.12
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin Fisherman's Tale##30935 |goto 62.32,29.06
accept It Takes A Village##30944 |goto 62.32,29.06
step
talk Liu Ze##60605
|tip Inside the building.
home North Wind Tavern |goto 62.49,28.78 |q 30816 |future
step
talk Li Hai##60436
accept Checking In##30816 |goto 63.17,29.37
step
talk Elder Shu##61495
|tip He walks around on both floors.
|tip Inside the building.
accept Handle With Care##30943 |goto 63.37,28.75
step
talk Steelbender Doshu##61496
|tip He walks around this area.
accept What's Yours Is Mine##30945 |goto 63.36,30.74
step
talk Shomi##61503
accept Make A Fighter Out of Me##30942 |goto 63.73,30.71
stickystart "Kill_Amani_Skirmishers"
step
talk Exhausted Defender##61417+
|tip They look like Pandaren.
|tip Around the perimeter of the village.
Tell them _"I'll cover your post. Go rest and be with your family."_ |gossip 1
Relieve #5# Exhausted Defenders |q 30944/1 |goto 63.35,29.30
step
label "Kill_Amani_Skirmishers"
kill 4 Amani Skirmisher##629 |q 30942/1 |goto 64.35,29.07
|tip They look like trolls with large axes.
|tip Around the perimeter of the village. |notinsticky
stickystart "Kill_Drakkari_Frostweavers"
stickystart "Kill_Gurubashi_Hexxers"
stickystart "Collect_Handful_Of_Volatile_Blooms"
step
Kill Amani enemies around this area
|tip Only Skullbreakers and Raptor-Handlers will drop the quest item.
|tip They look like trolls carrying a large sword, and trolls walking around with raptors.
collect 8 Blood-Stained Blade##82299 |q 30945/1 |goto 69.94,27.15
'|kill Amani Skullbreaker##60580, Amani Raptor-Handler##60581
step
label "Kill_Drakkari_Frostweavers"
kill 3 Drakkari Frostweaver##66707 |q 30942/3 |goto 69.94,27.15
|tip They look like trolls channeling a blue spell.
step
label "Kill_Gurubashi_Hexxers"
kill 4 Gurubashi Hexxer##64202 |q 30942/2 |goto 69.94,27.15
|tip They look like trolls carrying staves.
step
label "Collect_Handful_Of_Volatile_Blooms"
click Volatile Blooms##211684+
|tip They look like red bushes.
collect 50 Handful of Volatile Blooms##82298 |q 30943/1 |goto 69.94,27.15
step
_Next to you:_
talk Shomi##61534
turnin Make A Fighter Out of Me##30942
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin It Takes A Village##30944 |goto 62.33,29.06
step
talk Elder Shu##61495
|tip He walks around on both floors.
|tip Inside the building.
turnin Handle With Care##30943 |goto 63.37,28.75
step
talk Steelbender Doshu##61496
|tip He walks around this area.
turnin What's Yours Is Mine##30945 |goto 63.36,30.74
step
talk Lorewalker Cho##61371
|tip Inside the building.
accept Enemies At Our Door##31011 |goto 62.33,29.06
stickystart "Kill_Zandalari_Berserkers"
step
clicknpc Blasting Barrel##62591+
|tip They look like wooden barrels.
|tip Keep clicking them as they reappear.
kill 5 Zandalari Behemoth##63516 |q 31011/2 |goto 61.18,29.05
step
kill 3 Zandalari Bloodrider##62362 |q 31011/3 |goto 64.40,29.04
|tip They look like trolls riding raptors.
|tip You may have to wait for a group of them to appear.
You can find more around [63.87,32.39]
step
label "Kill_Zandalari_Berserkers"
kill 10 Zandalari Berserker##62299 |q 31011/1 |goto 62.77,30.10
|tip They look like troll soldiers.
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin Enemies At Our Door##31011 |goto 62.33,29.06
accept Revelations##30946 |goto 62.33,29.06
step
talk Zandalari Prisoner##62629
|tip Upstairs inside the building.
Ask him _"Where have the Thunder King's Remains been taken?!"_ |gossip 1
Watch the dialogue
Question the Zandalari Prisoner |q 30946/1 |goto 62.48,28.84
step
talk Lorewalker Cho##63750
|tip Inside the building.
turnin Revelations##30946 |goto 62.32,29.06
accept Prophet Khar'zul##31228 |goto 62.32,29.06
step
talk Sage Liao##60694
turnin Checking In##30816 |goto 60.61,21.34
accept Emergency Care##30794 |goto 60.61,21.34
step
click Sage Liao's Belongings##211510
|tip Inside the building.
collect Pandaren Healing Draught##81177 |goto 61.02,21.52 |q 30794
step
use the Pandaren Healing Draught##81177
|tip Use it on Sage Liao.
Heal Sage Liao |q 30794/1 |goto 60.61,21.34
step
talk Sage Liao##60785
turnin Emergency Care##30794 |goto 60.61,21.34
accept Justice##30805 |goto 60.61,21.34
accept The Scent of Life##30806 |goto 60.61,21.34
accept By the Falls, For the Fallen##30807 |goto 60.61,21.34
step
click Waterfall-Polished Stone##211526+
|tip They look like large grey rocks underwater.
collect 3 Waterfall-Polished Stone##81269 |q 30807/1 |goto 59.05,27.22
You can find more around [58.91,24.56]
stickystart "Collect_Stolen_Pandaren_Spices_And_Slay_Blackmane_Mercenaries"
stickystart "Collect_Opalescent_Blue_Crab_Shells"
step
kill Captain Ripflesh##60767 |q 30805/1 |goto 62.13,23.57
|tip He walks around this area.
step
label "Collect_Stolen_Pandaren_Spices_And_Slay_Blackmane_Mercenaries"
Kill Blackmane enemies around this area
|tip They look like gnolls.
click Blackmane Booty Barrel##211521+
|tip They look like brown wooden barrels.
collect 8 Stolen Pandaren Spices##81261 |q 30806/2 |goto 62.52,21.25
Slay #6# Blackmane Mercenaries |q 30805/2 |goto 62.52,21.25
'|kill Blackmane Brigand##60560, Blackmane Pillager##60846, Blackmane Tracker##60434
step
label "Collect_Opalescent_Blue_Crab_Shells"
kill Azure Prickly Crawler##60437+
|tip They look like blue crabs.
|tip Underwater and along the beach around this area. |notinsticky
collect Opalescent Blue Crab Shell##80907 |q 30806/1 |goto 60.15,20.45
step
talk Sage Liao##60785
turnin Justice##30805 |goto 60.61,21.34
turnin The Scent of Life##30806 |goto 60.61,21.34
turnin By the Falls, For the Fallen##30807 |goto 60.61,21.34
accept Preparing the Remains##30819 |goto 60.61,21.34
step
talk Li Hai##60436
turnin Preparing the Remains##30819 |goto 63.17,29.37
accept Honoring the Dead##30820 |goto 63.17,29.37
step
click Incense of Life##211545
Light the Incense of Life |q 30820/1 |goto 66.94,33.32
step
talk Sage Liao##60757
turnin A Funeral##30820 |goto 67.04,33.35
step
talk Mishi##65855
Tell her _"I'm ready to leave."_ |gossip 1
Speak with Mishi in Zouchin Village |q 31228/1 |goto 62.30,29.32
step
Begin Flying to the Isle of Reckoning |invehicle |goto 62.30,29.32 |q 31228
step
Fly to the Isle of Reckoning |outvehicle |goto 76.48,19.38 |q 31228 |notravel
stickystart "Slay_Zandalari_Forces"
step
kill Prophet Khar'zul##61541 |q 31228/2 |goto 76.43,9.05
|tip Jump onto the stone table when the floor turns purple.
step
label "Slay_Zandalari_Forces"
Kill enemies around this area
|tip They look like trolls.
Slay #12# Zandalari Forces |q 31228/3 |goto 76.25,13.40
'|kill Amani Outrider##64639, Gurubashi Witch Doctor##64631, Gurubashi Worshipper##64642, Gurubashi Headsplitter##64643
step
talk Lorewalker Cho##63784
|tip Inside the building.
turnin Prophet Khar'zul##31228 |goto 62.32,29.06
step
talk Brother Lintpocket##59701
accept The Burlap Trail: To Burlap Waystation##30592 |goto 58.09,61.47
step
Locate the Grummles
|tip They look like a group of small friendly npc's that walk along this road heading west.
|tip They appear at this location when they die, if they aren't protected.
|tip You can either wait here until they appear, or you can try to find them along the road.
Click Here After You Locate the Grummles |confirm |goto 58.13,61.46 |q 30592
step
Escort the Grummles to the Burlap Waystation |q 30592/1 |goto 52.92,66.58
|tip Follow the Grummles and protect them as they walk.
|tip They eventually walk to this location.
step
talk Brother Trailscenter##59703
turnin The Burlap Trail: To Burlap Waystation##30592 |goto 51.66,67.83
accept The Rabbitsfoot##30602 |goto 51.66,67.83
step
talk Brother Rabbitsfoot##59806
Rescue Brother Rabbitsfoot |q 30602/1 |goto 49.10,70.45
step
talk Brother Rabbitsfoot##59806
accept The Broketooth Ravage##30603 |goto 49.10,70.45
step
kill Mo Mo##59805
|tip Inside the small cave up on the mountain.
collect Rabbitsfoot's Luckydo##81137 |q 30603/1 |goto 48.02,73.27
step
talk Brother Rabbitsfoot##59452
turnin The Rabbitsfoot##30602 |goto 51.97,67.21
turnin The Broketooth Ravage##30603 |goto 51.97,67.21
accept A Monkey Idol##30599 |goto 51.97,67.21
accept No Pack Left Behind##30600 |goto 51.97,67.21
accept Breaking Broketooth##30604 |goto 51.97,67.21
stickystart "Collect_Grummlepacks"
stickystart "Kill_Broketooth_Tossers"
stickystart "Kill_Broketooth_Chargers"
step
kill Hateful Ko Ko##59430
|tip He walks around this area.
collect Corpse of Ko Ko##80429 |goto 52.37,71.40 |q 30599
step
click Ko Ko's Altar##211275
Destroy Ko Ko's Altar |q 30599/2 |goto 52.26,71.43
step
Enter the cave |goto 52.85,71.46 < 15 |walk
kill Dak Dak##59424
|tip He looks like a larger armored monkey that along this path.
|tip Inside the cave.
collect Corpse Of Dak Dak##80428 |goto Kun-Lai Summit/11 54.57,26.69 |q 30599
step
click Dak Dak's Altar##210931
|tip Downstairs inside the cave.
Destroy Dak Dak's Altar |q 30599/1 |goto Kun-Lai Summit/12 49.55,39.77
step
label "Collect_Grummlepacks"
clicknpc Dead Packer##59896+
|tip They look like grummles laying on the ground.
|tip Inside the cave. |notinsticky
collect 8 Grummlepack##80307 |q 30600/1 |goto 56.46,18.57
step
Leave the cave |goto Kun-Lai Summit/0 52.85,71.46 < 15 |walk |only if subzone("The Deeper") and indoors()
kill Tak Tak##59958
|tip He walks around this area.
collect Corpse of Tak Tak##80430 |goto Kun-Lai Summit/0 56.74,70.98 |q 30599
step
click Tak Tak's Altar##211276
Destroy Tak Tak's Altar |q 30599/3 |goto 56.83,70.98
step
label "Kill_Broketooth_Tossers"
kill 6 Broketooth Tosser##59416 |q 30604/2 |goto 52.85,71.46
|tip They look like monkeys carrying small daggers.
|tip Inside and outside the cave. |notinsticky
step
label "Kill_Broketooth_Chargers"
kill 8 Broketooth Charger##59414 |q 30604/1 |goto 52.85,71.46
|tip They look like monkeys carrying spears.
|tip Inside and outside the cave. |notinsticky
step
talk Brother Rabbitsfoot##59452
turnin A Monkey Idol##30599 |goto 51.97,67.21
turnin No Pack Left Behind##30600 |goto 51.97,67.21
accept Bros before Hozen##30605 |goto 51.97,67.21
turnin Breaking Broketooth##30604 |goto 51.97,67.21
step
clicknpc Mok Mok##60008
|tip On top of the hill.
Rescue Brother Yakshoe |q 30605/1 |goto 50.53,64.19
step
talk Brother Yakshoe##59894
turnin Bros before Hozen##30605 |goto 50.57,64.07
accept Hozen Love Their Keys##30607 |goto 50.57,64.07
accept The Snackrifice##30608 |goto 50.57,64.07
accept Thumping Knucklethump##30606 |goto 50.57,64.07
stickystart "Rescue_Imprisoned_Grummles"
stickystart "Slay_Silverback_Hozens"
step
Enter the cave |goto 50.30,61.67 < 15 |walk
kill Cho Cho the Wicked##60090
|tip He walks around this area inside the cave.
collect Yeti Shackle Key##80535 |q 30607/1 |goto Kun-Lai Summit/10 33.44,13.54
step
click Ball and Chain##207079
|tip It looks like a large grey ball next to a huge yeti.
|tip Inside the cave.
Release Old Poot Poot |q 30607/2 |goto 42.71,26.48
step
Begin Returning to Brother Yakshoe |invehicle |goto 42.71,26.48 |q 30607
step
Watch the dialogue
Return to Brother Yakshoe |outvehicle |goto Kun-Lai Summit/0 52.09,67.42 |q 30607 |notravel
stickystop "Rescue_Imprisoned_Grummles"
stickystop "Slay_Silverback_Hozens"
step
talk Brother Yakshoe##59894
turnin Hozen Love Their Keys##30607 |goto Kun-Lai Summit/0 52.02,67.18
stickystart "Slay_Silverback_Hozens"
step
label "Rescue_Imprisoned_Grummles"
clicknpc Prisoner Bindings##60027+
|tip They look like ropes tied to Imprisoned Grummles hanging from trees.
click Grummle Cage##211307+
|tip They look like wooden cages.
|tip Inside and outside the cave. |notinsticky
Rescue #5# Imprisoned Grummles |q 30608/1 |goto 50.30,61.67
step
label "Slay_Silverback_Hozens"
Kill Knucklethump enemies around this area
|tip They look like monkeys.
|tip Inside and outside the cave. |notinsticky
Slay #8# Silverback Hozens |q 30606/1 |goto 50.30,61.67
'|kill Knucklethump Smasher##59410, Knucklethump Jibstabber##59412
step
talk Brother Yakshoe##59894
turnin The Snackrifice##30608 |goto 52.02,67.18
accept Grummle! Grummle! Grummle!##30610 |goto 52.02,67.18
step
talk Brother Rabbitsfoot##59452
turnin Thumping Knucklethump##30606 |goto 51.97,67.21
accept Unleash The Yeti!##30611 |goto 51.97,67.21
stickystart "Pack_Packers"
step
kill 4 Cagemaster##60169 |q 30611/1 |goto 46.10,64.11
|tip Around the perimeter of the huge cage.
step
label "Pack_Packers"
click Grummle Gear##211686+
|tip They look like wooden boxes.
Pack #5# Packers |q 30610/1 |goto 46.10,64.11
step
talk Brother Yakshoe##59894
turnin Grummle! Grummle! Grummle!##30610 |goto 45.94,64.05
step
talk Brother Rabbitsfoot##59452
turnin Unleash The Yeti!##30611 |goto 45.91,64.05
accept The Leader Hozen##30612 |goto 45.91,64.05
step
Watch the dialogue
Enrage Chomp Chomp |q 30612/1 |goto 46.01,63.25
step
Watch the dialogue
kill The Ook of Dook##60188 |q 30612/2 |goto 46.01,63.25
step
talk Brother Rabbitsfoot##59452
turnin The Leader Hozen##30612 |goto 51.97,67.21
step
talk Brother Trailscenter##59703
accept The Burlap Trail: To Kota Basecamp##30692 |goto 51.66,67.83
step
Locate the Grummles
|tip They look like a group of small friendly npc's that walk along this road heading west.
|tip They appear at this location when they die, if they aren't protected.
|tip You can either wait here until they appear, or you can try to find them along the road.
Click Here After You Locate the Grummles |confirm |goto 51.69,67.70 |q 30692
step
Escort the Grummles to the Kota Basecamp |q 30692/1 |goto 43.76,68.91
|tip Follow the Grummles and protect them as they walk.
|tip They eventually walk to this location.
step
talk Uncle Eastwind##60416
fpath Kota Basecamp |goto 42.81,69.63
step
talk Clover Keeper##60420
home Kota Basecamp |goto 42.67,69.76 |q 30742 |future
step
talk Cousin Gootfur##60596
|tip He walks around this area.
accept Shut it Down##30742 |goto 42.34,69.78
accept Gourmet Kafa##30743 |goto 42.34,69.78
step
talk Uncle Keenbean##60503
accept Kota Blend##30744 |goto 42.42,69.66
accept Trouble Brewing##30745 |goto 42.42,69.66
step
talk Brother Oilyak##59755
turnin The Burlap Trail: To Kota Basecamp##30692 |goto 42.45,68.91
stickystart "Collect_Kafakota_Berries"
stickystart "Kill_Kafa_Crazed_Mountain_Goats"
stickystart "Mark_Kafagoot_Deposits"
step
Follow the path of flags up the mountain |goto 41.66,71.41 < 20 |only if walking
kill 8 Kafa-Crazed Yeti##60564 |q 30745/1 |goto 37.32,77.82
|tip Inside and outside the cave, up on the mountain.
step
label "Collect_Kafakota_Berries"
click Kafa'kota Bush##211454+
|tip They look like small bushes with red berries on them.
|tip All over the mountain. |notinsticky
click Kafa'kota Berries##211480+
|tip They look like small piles of red berries.
|tip Inside the cave, up on the mountain. |notinsticky
collect 100 Kafa'kota Berry##81054 |q 30744/1 |goto 37.32,77.82
step
_Click the Complete Quest Box:_
turnin Kota Blend##30744
accept A Fair Trade##30746
step
label "Kill_Kafa_Crazed_Mountain_Goats"
Leave the cave |goto 37.32,77.82 < 15 |walk |only if subzone("Kota Peak") and indoors()
kill 12 Kafa-Crazed Mountain Goat##60493 |q 30742/1 |goto 38.47,78.31
|tip All over the mountain. |notinsticky
step
label "Mark_Kafagoot_Deposits"
click Kafa'goot "Deposit"##211456+
|tip They look like small piles of poop.
|tip All over the mountain. |notinsticky
Mark #15# Kafa'goot "Deposits" |q 30743/1 |goto 38.47,78.31
step
Enter the cave higher up on the mountain |goto 37.15,75.98 < 15 |walk
talk Nephew Burrberry##60679
|tip Inside the small cave.
turnin A Fair Trade##30746 |goto 36.93,76.22
step
Watch the dialogue
|tip Inside the small cave.
Ride with Kota Kon |invehicle |goto 36.93,76.22 |q 30742
step
Return to Kota Basecamp |outvehicle |goto 42.68,70.09 |q 30742 |notravel
step
talk Uncle Keenbean##60503
turnin Trouble Brewing##30745 |goto 42.53,69.43
step
talk Nephew Burrberry##60679
accept The Burlap Grind##30747 |goto 42.52,69.34
step
talk Cousin Gootfur##60596
turnin Shut it Down##30742 |goto 42.46,69.35
turnin Gourmet Kafa##30743 |goto 42.46,69.35
step
talk Kota Kon##60587
Choose _<Unscrew the flask and offer it to her.>_ |gossip 1
Ride with Kota Kon |invehicle |goto 42.62,69.16 |q 30747
step
Kill enemies around this area
|tip They look like monkeys.
|tip Use the abilities on your action bar.
Slay #100# Burlap Trail Hozens |q 30747/1 |goto 48.80,68.13
If Kota Kon dies, you can get her again at [42.62,69.16]
'|kill Broketooth Ravager##60743, Silverback Smasher##60749, Ookin Shaman##60752, Ookin Marauder##60753, Silverback Piker##60746, Broketooth Leaper##60742
step
Stop Riding with Kota Kon |outvehicle |q 30747
|tip Get to a safe place first.
|tip Click the arrow on your action bar.
step
talk Nephew Burrberry##60679
turnin The Burlap Grind##30747 |goto 42.52,69.34
step
talk Sunwalker Dezco##64853
Tell him _"There's only one way to find out..."_ |gossip 1
Speak with Dezco at the Gate of the August Celestials |q 31511/1 |goto 56.18,91.56
step
talk Tania Summerbreeze##61122
fpath Shrine of Two Moons |goto Vale of Eternal Blossoms/0 62.85,21.79
step
talk Madam Vee Luo##62996
|tip Inside the building.
turnin A Witness to History##31511 |goto Shrine of Two Moons/1 68.45,47.64
step
talk Shado-Master Chong##60161
|tip Inside the building.
|tip Click the red doors to enter the building.
turnin The Shado-Pan##31453 |goto Kun-Lai Summit/0 44.48,89.93
accept Turnabout##30670 |goto Kun-Lai Summit/0 44.48,89.93
accept The Defense of Shado-Pan Fallback##30665 |goto Kun-Lai Summit/0 44.48,89.93
step
talk Kite Master Ni##61473
|tip Outside the building, up on the wall.
|tip Run up the stairs inside the building to find her.
fpath Shado-Pan Fallback |goto 43.91,89.54
stickystart "Collect_Blind_Rage_Essences"
stickystart "Kill_Sha_Infested_Yaungols"
step
talk Sya Zhong##60178
|tip Inside the building.
accept Holed Up##30682 |goto 42.93,88.31
step
Rescue Sya Zhong |q 30682/4 |goto 42.93,88.31
step
talk Ya Firebough##60189
|tip Inside the building.
Tell him _"...That's enough. Let's go"._ |gossip 1
Rescue Ya Firebough |q 30682/2 |goto 41.04,86.96
step
talk Old Lady Fung##60190
|tip Inside the building.
Tell her _"Yes... why don't you "escort" me out of here."_ |gossip 1
Rescue Old Lady Fung |q 30682/3 |goto 42.84,85.70
step
talk Jin Warmkeg##60187
|tip Inside the building.
Tell him _"Let's get out of here."_ |gossip 1
Rescue Jin Warmkeg |q 30682/1 |goto 43.87,86.17
step
label "Collect_Blind_Rage_Essences"
kill Blind Rage##61224+
|tip They look like shadow aliens.
collect 5 Blind Rage Essence##81713 |q 30670/1 |goto 43.31,87.02
step
label "Kill_Sha_Infested_Yaungols"
kill 15 Sha-Infested Yaungol##60164 |q 30665/1 |goto 44.82,87.44
|tip They look like grey tauren.
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Turnabout##30670 |goto 44.48,89.93
turnin The Defense of Shado-Pan Fallback##30665 |goto 44.48,89.93
turnin Holed Up##30682 |goto 44.48,89.93
accept Unmasking the Yaungol##30690 |goto 44.48,89.93
step
use the Blinding Rage Trap##81741
|tip Lure Kobai into it after you use it.
|tip He walks around this area.
|tip Use the "Steal Mask" ability on Kobai after you lure him into the trap.
|tip It appears as a button on the screen.
Lure Kobai into the Trap and Steal His Mask |q 30690/1 |goto 45.51,86.32
|tip You will be attacked.
'|kill Kobai##61303
step
kill Malevolent Fury##61333 |q 30690/2 |goto 45.51,86.32
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Unmasking the Yaungol##30690 |goto 44.48,89.93
accept To Winter's Blossom##30699 |goto 44.48,89.93
step
talk Lin Silentstrike##61816
turnin To Winter's Blossom##30699 |goto 34.95,59.40
accept Honor, Even in Death##30723 |goto 34.95,59.40
step
talk Ban Bearheart##61819
accept A Line Unbroken##30715 |goto 35.12,59.65
step
talk Kite Master Len##61512
fpath Winter's Blossom |goto 34.54,59.12
stickystart "Kill_Kun_Lai_Corpsepickers"
step
clicknpc Shado-Master Zhiyao##61808
Release Shado-Master Zhiyao from His Oath |q 30715/1 |goto 30.34,60.05
step
clicknpc Liu of the Thousand Blows##61806
Release Liu of the Thousand Blows from His Oath |q 30715/2 |goto 30.18,62.47
step
clicknpc Shiya Boldblade##61810
Release Shiya Boldblade from Her Oath |q 30715/3 |goto 29.97,64.44
step
label "Kill_Kun_Lai_Corpsepickers"
kill 12 Kun-Lai Corpsepicker##61843 |q 30723/1 |goto 30.85,62.22
|tip They look like birds on the ground and flying around.
step
talk Ban Bearheart##61819
turnin A Line Unbroken##30715 |goto 35.12,59.65
step
talk Lin Silentstrike##61816
turnin Honor, Even in Death##30723 |goto 34.95,59.30
accept To the Wall!##30724 |goto 34.95,59.30
step
talk Kite Master Len##61512
Tell him _"I need a kite to get up to the wall!"_ |gossip 1
Speak to Kite-Master Len to Take a Kite to the Wall |q 30724/1 |goto 34.54,59.12
step
Begin Traveling to Serpent's Spine |invehicle |goto 34.54,59.12 |q 30724
step
Travel to Serpent's Spine |outvehicle |goto 29.30,62.32 |q 30724 |notravel
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin To the Wall!##30724 |goto 29.30,62.29
accept Off the Wall!##30750 |goto 29.30,62.29
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
accept A Terrible Sacrifice##30751 |goto 29.24,62.30
stickystart "Slay_Veteran_Archers_Or_Fire_Warriors"
step
click Yaungol Oil Barrel##212003+
|tip They look like large blue and brown pots.
collect 6 Yaungol Oil Barrel##82799 |q 30751/1 |goto 27.53,60.70
step
label "Slay_Veteran_Archers_Or_Fire_Warriors"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #12# Veteran Archers or Fire-Warriors |q 30750/1 |goto 27.53,60.70
'|kill Osul Fire-Warrior##63576, Osul Veteran Archer##61886
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
turnin A Terrible Sacrifice##30751 |goto 29.24,62.30
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin Off the Wall!##30750 |goto 29.30,62.29
accept Lao-Chin's Gambit##30994 |goto 29.30,62.29
step
talk Suna Silentstrike##61454
|tip Inside the building.
Tell her _"Alright, I'm ready to get back to the front."_ |gossip 1
Talk with Suna Silentstrike to Take a Kite to Lao-Chin |q 30994/1 |goto 29.30,62.29
step
Begin Returning to Winter's Blossom |invehicle |goto 29.30,62.29 |q 30994
step
Return to Winter's Blossom |outvehicle |goto 31.85,60.18 |q 30994 |notravel
step
talk Lao-Chin the Iron Belly##61820
turnin Lao-Chin's Gambit##30994 |goto 31.82,60.11
accept Do a Barrel Roll!##30991 |goto 31.82,60.11
step
clicknpc Keg Bomb##60553
|tip Use the ability on your action bar near enemies as you roll down the hill.
|tip Do this repeatedly.
kill 50 Osul Invader##60455 |q 30991/1 |goto 32.06,60.58
kill 4 Osul Treelauncher##60483 |q 30991/2 |goto 32.06,60.58
step
talk Lao-Chin the Iron Belly##61820
turnin Do a Barrel Roll!##30991 |goto 31.82,60.11
accept Finish This!##30992 |goto 31.82,60.11
step
kill Gong Da##62165
|tip He runs around this area.
Complete the Battle for The Ox Gate |q 30992/1 |goto 31.19,61.76
step
talk Ban Bearheart##61819
turnin Finish This!##30992 |goto 31.29,61.50
accept Where are My Reinforcements?##30993 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"I'm ready to leave. Let's go!"_ |gossip 1
Tell Ban You are Ready to Leave |q 30993/1 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"Alright, let's go up to the monastery."_ |gossip 1
Ride Ban's Balloon to the Shado-Pan Monastery |q 30993/2 |goto 33.96,58.61
step
talk Ban Bearheart##61819
turnin Where are My Reinforcements?##30993 |goto 35.31,49.55
accept Unbelievable!##30752 |goto 35.31,49.55
step
talk Shado-Pan Sentinel##62220
Tell him _"I am here with Ban Bearheart, and we demand an audience with Taran Zhu!"_ |gossip 1
Watch the dialogue
kill Shado-Pan Sentinel##62220
Gain Access to the Monastery |q 30752/1 |goto 36.69,47.72
step
_Next to you:_
talk Ban Bearheart##61819
turnin Unbelievable!##30752
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Townlong Steppes (25-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."TownlongSteppes",
next="Leveling Guides\\Pandaria (10-60)\\Dread Wastes (30-60)",
condition_suggested=function() return level >= 25 and level <= 80 and not completedq(30928) end,
startlevel=25,
endlevel=50,
},[[
step
talk Taran Zhu##60688
turnin Beyond the Wall##31695 |goto Townlong Steppes/0 71.15,56.69 |only if haveq(31695) or completedq(31695)
accept A Foot in the Door##30814 |goto Townlong Steppes/0 71.15,56.69
step
talk Kite Master Wong##62901
fpath Longying Outpost |goto 71.08,57.31
step
talk Saito the Sleeping Shadow##62873
|tip Inside the building.
home Longying Outpost |goto 71.07,57.92 |q 30814 |future
step
kill 8 Osul Charger##60713 |q 30814/1 |goto 70.00,53.66
|tip They look like tauren.
step
talk Taran Zhu##60688
turnin A Foot in the Door##30814 |goto 71.15,56.69
accept First Assault##30769 |goto 71.15,56.69
accept Running Rampant##30770 |goto 71.15,56.69
accept Perfect Pitch##30771 |goto 71.15,56.69
stickystart "Kill_Osul_Sharphorns"
stickystart "Collect_Dark_Pitches"
step
clicknpc Long-Haired Yak##60669+
|tip They look like brown bisons.
clicknpc Steppebeast##60739+
|tip They look like blue dinosaurs.
Free #8# Yaks or Steppebeasts |q 30770/1 |goto 68.64,52.01
step
label "Kill_Osul_Sharphorns"
kill 6 Osul Sharphorn##60647 |q 30769/1 |goto 68.25,53.38
|tip They look like tauren.
step
label "Collect_Dark_Pitches"
click Pitch Pot##211507+
|tip They look like brown and blue pots.
collect 8 Dark Pitch##81174 |q 30771/1 |goto 68.25,53.38
step
talk Suna Silentstrike##60684
turnin First Assault##30769 |goto 67.25,52.22
step
talk Ban Bearheart##60687
turnin Running Rampant##30770 |goto 67.20,52.27
turnin Perfect Pitch##30771 |goto 67.20,52.27
accept Pitching In##30773 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Seeing Red##30772 |goto 67.25,52.22
accept Ranger Rescue##30774 |goto 67.25,52.22
stickystart "Destroy_Osul_Ballistas"
stickystart "Rescue_Longying_Rangers"
stickystart "Slay_Osul_Marauders"
step
talk Katak the Defeated##60735
accept The Exile##30775 |goto 67.00,51.41
step
kill Battat##60728 |q 30775/1 |goto 65.70,51.65
|tip Inside the building.
step
kill Urang##60725 |q 30775/2 |goto 64.79,50.13
|tip Inside the building.
step
talk Lin Silentstrike##60899
Choose _"Examine the body."_
Free Lin Silentstrike |q 30774/3 |goto 66.59,49.16
step
kill Ku-Tong##60726 |q 30775/3 |goto 66.96,48.24
|tip Inside the building.
step
label "Destroy_Osul_Ballistas"
use Ban's Explosives##81193
|tip Use it on Osul Ballistas.
|tip They look like smaller wooden machines with wheels.
Destroy #6# Osul Ballistas |q 30773/1 |goto 66.87,49.81
step
label "Rescue_Longying_Rangers"
Kill Osul enemies around this area
|tip They look like tauren.
collect Stone Key##81178+ |n
click Drywood Cage+
|tip They look like small brown wooden buildings.
Rescue #4# Longying Rangers |q 30774/2 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
label "Slay_Osul_Marauders"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #8# Osul Marauders |q 30772/1 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
talk Katak the Defeated##60735
turnin The Exile##30775 |goto 67.00,51.41
step
talk Ban Bearheart##60687
turnin Pitching In##30773 |goto 67.20,52.27
turnin Seeing Red##30772 |goto 67.20,52.27
turnin Ranger Rescue##30774 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Jung Duk##30776 |goto 67.25,52.22
step
click Ceremonial Pile##211524
kill Jung Duk##60801 |q 30776/1 |goto 66.66,51.01
step
talk Ban Bearheart##60687
turnin Jung Duk##30776 |goto 71.02,56.56
accept In Search of Suna##30777 |goto 71.02,56.56
step
clicknpc Shado-Pan Caravan##61205
Begin Traveling to Hatred's Vice |invehicle |goto 70.70,56.53 |q 30777
step
Watch the dialogue
Travel to Hatred's Vice |outvehicle |goto 82.44,73.51 |q 30777 |notravel
step
talk Ban Bearheart##61261
turnin In Search of Suna##30777 |goto 82.68,73.02
accept Dust to Dust##30778 |goto 82.68,73.02
accept Slaying the Scavengers##30779 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept Totemic Research##30780 |goto 82.59,73.02
step
talk Xiao Tu##60903
accept Last Toll of the Yaungol##30781 |goto 82.71,73.17
stickystart "Collect_Palewind_Totems"
stickystart "Kill_Ashfang_Hyenas"
stickystart "Burn_Palewind_Villagers"
step
Watch the dialogue
Examine the Southern Smoke Trail |q 30781/3 |goto 83.51,78.49
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Eastern Smoke Trail |q 30781/1 |goto 84.83,71.50
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Northwestern Smoke Trail |q 30781/4 |goto 84.02,70.89
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Western Smoke Trail |q 30781/2 |goto 81.29,72.13
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
label "Collect_Palewind_Totems"
click Palewind Totem##211566+
|tip They look like short wooden totem poles with horned skulls on them.
collect 9 Palewind Totem##81355 |q 30780/1 |goto 83.03,74.05
step
label "Kill_Ashfang_Hyenas"
kill 12 Ashfang Hyena##60932 |q 30779/1 |goto 83.03,74.05
step
label "Burn_Palewind_Villagers"
use the Shado-Pan Torch##81356
|tip Use it on Palewind Villagers.
|tip They look like tauren laying on the ground.
Burn #20# Palewind Villagers |q 30778/1 |goto 83.03,74.05
step
talk Yalia Sagewhisper##60864
turnin Totemic Research##30780 |goto 82.59,73.02
step
talk Ban Bearheart##61261
turnin Dust to Dust##30778 |goto 82.68,73.02
turnin Slaying the Scavengers##30779 |goto 82.68,73.02
turnin Last Toll of the Yaungol##30781 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept What Lies Beneath##30827 |goto 82.59,73.02
step
talk Yalia Sagewhisper##60864
Tell her _"I am ready to begin the ritual."_ |gossip 1
Speak to Yalia Sagewhisper |q 30827/1 |goto 82.59,73.02
step
Watch the dialogue
clicknpc Totem of Tranquility##60990
Activate the Totem of Tranquility |q 30827/3 |goto 82.41,73.56
step
clicknpc Totem of Serenity##60991
Activate the Totem of Serenity |q 30827/4 |goto 82.69,73.63
step
clicknpc Totem of Kindness##60933
Activate the Totem of Kindness |q 30827/2 |goto 82.58,73.25
step
Watch the dialogue
Complete the Ritual |q 30827/5 |goto 82.58,73.25
step
talk Yalia Sagewhisper##60864
turnin What Lies Beneath##30827 |goto 82.59,73.02
accept Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept Spiteful Spirits##30782 |goto 82.68,73.02
stickystart "Kill_Spiteful_Spirits"
step
use the Totem of Harmony##81417
|tip Use it on Crazed Shado-Pan Rangers.
|tip They looke like pandas in black armor.
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen.
kill Seething Hatred##61054+
Purify #8# Crazed Shado-Pan Rangers |q 30783/1 |goto 83.29,73.65
step
label "Kill_Spiteful_Spirits"
use the Totem of Harmony##81417 |notinsticky
|tip Use it on the ground as you walk around. |notinsticky
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen. |notinsticky
kill 10 Spiteful Spirit##63839 |q 30782/1 |goto 83.29,73.65
|tip They look like tauren ghosts.
step
talk Ban Bearheart##61261
turnin Spiteful Spirits##30782 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
turnin Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept The Point of No Return##30784 |goto 82.68,73.02
step
use the Totem of Harmony##81430
|tip Use it on the ground.
|tip Stand in the circles on the ground to gain a buff.
kill Suna Silentstrike##61055
|tip Inside the building.
|tip She will eventually surrender.
Find Suna Silentstrike |q 30784/1 |goto 84.08,70.54
step
talk Ban Bearheart##61261
turnin The Point of No Return##30784 |goto 82.68,73.02
accept Gao-Ran Battlefront##30785 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept A Delicate Balance##31894 |goto 82.59,73.02
step
talk Orbiss##60857
turnin A Delicate Balance##31894 |goto 67.94,67.67
accept A Spear Through My Side, A Chain Through My Soul##30786 |goto 67.94,67.67
step
kill Dmong Naruuk##60683 |q 30786/1 |goto 68.42,71.46
|tip Up on the cliff.
step
talk Orbiss##60857
turnin A Spear Through My Side, A Chain Through My Soul##30786 |goto 67.94,67.67
accept The Torches##30787 |goto 67.94,67.67
step
kill Osul Mist-Shaman##60697+
|tip Kill the ones next to Mist-Shaman's Torches.
|tip They look like poles with fire at the top of them.
clicknpc Mist-Shaman's Torch##60698+
collect 6 Mist-Shaman's Torch##81176 |q 30787/1 |goto 65.81,68.87
step
talk Orbiss##60857
turnin The Torches##30787 |goto 67.94,67.67
accept Golgoss##30788 |goto 67.94,67.67
accept Arconiss##30789 |goto 67.94,67.67
step
click Peat Clump##211513
Kill the enemies that attack in waves
Summon Golgoss |q 30788/1 |goto 70.51,69.65
'|kill Osul Mistbreaker##60756, Small Swamp Rodent##60758
step
click Peat Mound##211515
Kill the enemies that attack in waves
Summon Arconiss |q 30789/1 |goto 71.49,72.29
'|kill Osul Mistbreaker##60756, Small Swamp Rodent##60758
step
talk Orbiss##60857
turnin Golgoss##30788 |goto 67.94,67.67
turnin Arconiss##30789 |goto 67.94,67.67
accept The Death of Me##30815 |goto 67.94,67.67
step
talk Orbiss##60857
Choose _<Remove the spear from Orbiss' side.>_ |gossip 1
Remove the Spear from Orbiss |q 30815/1 |goto 67.94,67.67
step
talk Orbiss##60622
turnin The Death of Me##30815 |goto 67.94,67.67
accept Golgoss Hungers##30790 |goto 67.94,67.67
accept Arconiss Thirsts##30791 |goto 67.94,67.67
accept Orbiss Fades##30792 |goto 67.94,67.67
stickystart "Collect_Gushing_Mist"
stickystart "Collect_Snarlvines"
step
kill Swamp Rodent##60733+
|tip They look like beavers.
collect 4 Clotted Rodent's Blood##81260 |q 30791/1 |goto 72.85,71.13
step
label "Collect_Gushing_Mist"
Collect #8# Gushing Mist |q 30792/1 |goto 72.85,71.13
|tip Stand in the small clouds of steam.
step
label "Collect_Snarlvines"
click Snarlvine##211518+
|tip They look like small bushes with purple flowers on them.
collect 10 Snarlvine##81250 |q 30790/1 |goto 72.85,71.13
step
talk Orbiss##60622
turnin Golgoss Hungers##30790 |goto 67.94,67.67
turnin Arconiss Thirsts##30791 |goto 67.94,67.67
turnin Orbiss Fades##30792 |goto 67.94,67.67
accept Mists' Opportunity##30793 |goto 67.94,67.67
step
kill Jahesh of Osul##60802 |q 30793/1 |goto 76.68,72.89
step
talk Orbiss##60622
turnin Mists' Opportunity##30793 |goto 76.19,72.91
step
talk Kite Master Nenshi##62903
fpath Gao-Ran Battlefront |goto 74.39,81.46
step
talk Taran Zhu##61066
turnin Gao-Ran Battlefront##30785 |goto 76.42,82.43
accept Behind the Blockade##30884 |goto 76.42,82.43
step
talk Kim the Quiet##62875
home Gao-Ran Battlefront |goto 75.96,82.91 |q 30884 |future
step
talk Septi the Herbalist##61470
accept Treatment for the Troops##30891 |goto 75.86,83.14
stickystart "Collect_Violet_Citrons"
step
talk Taoshi##61469
turnin Behind the Blockade##30884 |goto 76.94,78.79
accept Unwelcome Intruders##30887 |goto 76.94,78.79
stickystart "Kill_Krikthik_Deep_Scouts"
step
label "Collect_Violet_Citrons"
click Violet Citron##211721+
|tip They look like bushes with blue flowers on them.
collect 10 Violet Citron##82342 |q 30891/1 |goto 77.81,77.22
step
label "Kill_Krikthik_Deep_Scouts"
kill 12 Krik'thik Deep-Scout##61374 |q 30887/1 |goto 77.81,77.22
|tip They look like insect people.
step
talk Septi the Herbalist##61470
turnin Treatment for the Troops##30891 |goto 75.86,83.14
step
talk Taoshi##61468
turnin Unwelcome Intruders##30887 |goto 79.46,84.46
accept Breach in the Defenses##30888 |goto 79.46,84.46
accept The Restless Watch##30890 |goto 79.46,84.46
step
talk Mao the Lookout##61467
accept Trap Setting##30889 |goto 79.38,84.44
stickystart "Rearm_Shadow_Pan_Spike_Traps"
stickystart "Kill_Krikthik_Scentlayers"
step
talk Scout Jai-gan##61397
Tell him _"I have orders for you to return to the battlefront."_ |gossip 37888
Deliver Orders to Scout Jai-gan |q 30890/4 |goto 79.01,90.16
step
talk Scout Ying##61396
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37889
Deliver Orders to Scout Ying |q 30890/3 |goto 82.52,89.55
step
talk Scout Long##61395
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37625
Deliver Orders to Scout Long |q 30890/2 |goto 81.27,86.18
step
talk Scout Wei-Chin##61378
Tell him _"I have orders for you to return to the battlefront."_ |gossip 40590
Deliver Orders to Scout Wei-Chin |q 30890/1 |goto 82.21,84.12
step
label "Rearm_Shadow_Pan_Spike_Traps"
clicknpc Shado-Pan Spike Trap##61426+
|tip They look like spiked grey metal balls.
Rearm #8# Shado-Pan Spike Traps |q 30889/1 |goto 80.79,86.06
step
label "Kill_Krikthik_Scentlayers"
use the Shado-Pan Flare##81925
|tip Use it near the moving trails of yellow smoke on the ground.
kill 10 Krik'thik Scentlayer##61373 |q 30888/1 |goto 80.79,86.06
step
talk Mao the Lookout##61467
turnin Trap Setting##30889 |goto 79.38,84.44
step
talk Taoshi##61468
turnin Breach in the Defenses##30888 |goto 79.46,84.46
turnin The Restless Watch##30890 |goto 79.46,84.46
accept Returning from the Pass##30960 |goto 79.46,84.46
step
talk Taran Zhu##61066
turnin Returning from the Pass##30960 |goto 76.42,82.43
accept The Endless Swarm##30893 |goto 76.42,82.43
step
talk Septi the Herbalist##61470
accept Back on Their Feet##30892 |goto 75.86,83.14
accept Rummaging Through the Remains##30894 |goto 75.86,83.14
stickystart "Slay_Krikthik_Attackers"
stickystart "Collect_Krikthik_Limbs"
step
use the Citron-Infused Bandages##82787
|tip Use them on Injured Gao-Ran Blackguards.
|tip They look like pandaren laying on the ground.
Heal #8# Injured Gao-Ran Blackguards |q 30892/1 |goto 74.20,86.57
'|talk Injured Gao-Ran Blackguard##61692
step
label "Slay_Krikthik_Attackers"
Kill Krik'thik enemies around this area
|tip They look like insect people.
Slay #12# Krik'thik Attackers |q 30893/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
label "Collect_Krikthik_Limbs"
Kill Krik'thik enemies around this area
|tip They look like insect people.
click Krik'thik Limb##214820+
|tip They look like insect arms and legs that appear on the ground after you kill Krik'thik enemies.
collect 22 Krik'thik Limb##82722 |q 30894/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
talk Septi the Herbalist##61470
turnin Back on Their Feet##30892 |goto 75.86,83.14
turnin Rummaging Through the Remains##30894 |goto 75.86,83.14
step
talk Taran Zhu##61066
turnin The Endless Swarm##30893 |goto 76.42,82.43
accept Improvised Ammunition##30895 |goto 76.42,82.43
step
talk Initiate Chao##61880
accept In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Initiate Feng##61881
accept Thieves and Troublemakers##30896 |goto 70.45,86.37
stickystart "Slay_Agitated_Root_Sprites"
stickystart "Collect_Volatile_Dread_Orbs"
step
kill Needlebottom##61818
collect Initiate Chao's Sword##82783 |q 30897/1 |goto 63.07,87.68
step
label "Slay_Agitated_Root_Sprites"
Kill Agitated enemies around this area
|tip They look like sprites.
Slay #10# Agitated Root Sprites |q 30896/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
label "Collect_Volatile_Dread_Orbs"
Kill Agitated enemies around this area |notinsticky
|tip They look like sprites. |notinsticky
click Dread Orb##211873+
|tip They look like smaller orange globes on the tree roots on the ground.
collect 16 Volatile Dread Orb##82723 |q 30895/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
talk Initiate Feng##61881
|tip Up on the cliff.
turnin Thieves and Troublemakers##30896 |goto 70.45,86.37
step
talk Initiate Chao##61880
turnin In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Taran Zhu##61066
turnin Improvised Ammunition##30895 |goto 76.42,82.43
accept Cutting the Swarm##30898 |goto 76.42,82.43
step
clicknpc Dragon Launcher##61746
Control the Dragon Launcher |invehicle |goto 74.81,84.69 |q 30898
step
Kill Krik'thik enemies around this area
|tip They look like insect people on the battlefield nearby to the south.
|tip Use the abilities on your action bar.
Slay #50# Krik'thik Drones |q 30898/1 |goto 74.81,84.69
step
talk Taoshi##62444
turnin Cutting the Swarm##30898 |goto 74.23,85.04
accept Terror of the Dread Wastes##30900 |goto 74.23,85.04
step
kill Norvakess##62324 |q 30900/1 |goto 74.18,87.42
|tip Kill the enemies that appear when it burrows in the ground.
'|kill Krik'thik Drone##65636
step
talk Taran Zhu##61066
turnin Terror of the Dread Wastes##30900 |goto 76.42,82.43
accept Along the Southern Front##30901 |goto 76.42,82.43
step
talk Taoshi##62436
turnin Along the Southern Front##30901 |goto 67.32,80.85
accept Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
accept Taking Stock##30971 |goto 67.36,80.68
stickystart "Collect_Shado_Pan_Fire_Arrows"
step
kill 9 Seething Fleshripper##61299 |q 30970/1 |goto 66.00,82.44
|tip They look like scorpions.
step
label "Collect_Shado_Pan_Fire_Arrows"
click Shado-Pan Fire Arrows##212136+
|tip They look like bundles of arrows.
collect 120 Shado-Pan Fire Arrows##83024 |q 30971/1 |goto 66.00,82.44
step
talk Taoshi##62436
turnin Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
turnin Taking Stock##30971 |goto 67.36,80.68
accept Joining the Fight##30972 |goto 67.36,80.68
step
talk Lao-Chin the Iron Belly##61016
turnin Joining the Fight##30972 |goto 61.59,79.35
step
talk Taran Zhu##62273
accept Up In Flames##30973 |goto 61.64,79.32
step
clicknpc Keg Bomb##62192+
|tip They look like wooden barrels on the ground around this area.
|tip Face enemies before you click them.
|tip They look like insect people.
|tip The barrels will roll into enemies and make them weaker, if you aim well.
kill 10 Kor'thik Timberhusk##61355 |q 30973/1 |goto 59.06,80.98
step
talk Taran Zhu##62273
turnin Up In Flames##30973 |goto 61.64,79.32
step
talk Lao-Chin the Iron Belly##61016
accept The Taking of Dusklight Bridge##30975 |goto 61.59,79.35
step
click Tasty Brew##214848+
|tip They look like wooden barrels.
|tip To heal yourself, run through the bubbles that appear.
kill 12 Kor'thik Bloodletter##62680 |q 30975/1 |goto Dread Wastes/0 44.87,9.87
|tip Let Lao-Chin tank the enemies for you.
step
kill Hulking Kor'thik Fleshrender##62686 |q 30975/2 |goto 44.87,9.87
step
talk Taran Zhu##62736
turnin The Taking of Dusklight Bridge##30975 |goto Townlong Steppes/0 61.11,83.06
accept Joining the Hunt##30976 |goto Townlong Steppes/0 61.11,83.06
step
talk Taran Zhu##62274
turnin Joining the Hunt##30976 |goto 54.03,78.06
accept In Skilled Hands##30899 |goto 54.03,78.06
step
talk Rensai Oakhide##62278
accept Grounded Welcome##30977 |goto 53.93,78.12
step
talk Kite Master Li-Sen##62898
fpath Rensai's Watchpost |goto 54.29,79.05
stickystart "Kill_Korthik_Fleetwings"
step
talk Marksman Ye##62573
accept Choking the Skies##31032 |goto 51.26,83.02
stickystart "Burn_Korthik_Fleetwing_Corpses"
step
talk Hawkmaster Nurong##61020
turnin In Skilled Hands##30899 |goto 51.66,87.25
accept Hostile Skies##30978 |goto 51.66,87.25
stickystop "Kill_Korthik_Fleetwings"
stickystop "Burn_Korthik_Fleetwing_Corpses"
step
clicknpc Nurong's Cannon##62747
Control Nurong's Cannon |invehicle |goto 51.67,87.32 |q 30978
step
kill Kor'thik Swarmer##62300+
|tip They look like insect people flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down #50# Korthi'thik Swarmers |q 30978/1 |goto 51.7,87.3
step
kill Voress'thalik##62269
|tip It looks like a huge orange insect flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down Voress'thalik |q 30978/2 |goto 51.7,87.3
step
Stop Controlling Nurong's Cannon |outvehicle |q 30978
|tip Click the arrow on your action bar.
step
talk Hawkmaster Nurong##61020
turnin Hostile Skies##30978 |goto 51.66,87.25
accept Devastation Below##30979 |goto 51.66,87.25
step
kill Voress'thalik##62270 |q 30979/1 |goto 53.77,87.39
|tip It walks around this area.
step
talk Hawkmaster Nurong##62786
turnin Devastation Below##30979 |goto 53.99,86.97
accept Heroes of the Shado-Pan##30980 |goto 53.99,86.97
stickystart "Kill_Korthik_Fleetwings"
step
label "Burn_Korthik_Fleetwing_Corpses"
kill Kor'thik Fleetwing##62128+
|tip They look like insect people.
use the Wu Kao Torch##83768
|tip Use it near their corpses.
Burn #10# Kor'thik Fleetwing Corpses |q 31032/1 |goto 51.36,84.20
step
label "Kill_Korthik_Fleetwings"
kill 12 Kor'thik Fleetwing##62128 |q 30977/1 |goto 51.36,84.20
|tip They look like insect people.
step
talk Marksman Ye##62573
turnin Choking the Skies##31032 |goto 51.26,83.02
step
talk Rensai Oakhide##62278
turnin Grounded Welcome##30977 |goto 53.93,78.12
step
talk Taran Zhu##62274
turnin Heroes of the Shado-Pan##30980 |goto 54.06,77.87
accept Buried Beneath##31065 |goto 54.06,77.87
step
click Wukao Spyglass
Watch the dialogue
Look Through Taoshi's Spyglass |q 31065/1 |goto 53.50,77.41
step
talk Taran Zhu##62274
turnin Buried Beneath##31065 |goto 54.06,77.87
accept Taoshi and Korvexxis##30981 |goto 54.06,77.87
accept Lao-Chin and Serevex##31063 |goto 54.06,77.87
accept Nurong and Rothek##31064 |goto 54.06,77.87
step
talk Rensai Oakhide##62278
accept Thinning the Sik'thik##31687 |goto 53.93,78.12
accept The Search for Restless Leng##31688 |goto 53.93,78.12
stickystart "Search_Sikthik_Cages_And_Find_Restless_Leng"
stickystart "Slay_Sikthik_Mantids"
step
kill Korvexxis##62579 |q 30981/1 |goto 46.60,83.06
|tip An ally will help you fight him.
step
kill Serevex##62580 |q 31063/1 |goto 45.38,77.42
|tip An ally will help you fight him.
step
kill Rothek##62581 |q 31064/1 |goto 39.84,75.59
|tip An ally will help you fight him.
step
label "Search_Sikthik_Cages_And_Find_Restless_Leng"
click Sik'thik Cage##214734+
|tip They look like pointed metal structures with yellow windows.
Search #8# Sik'thik Cages |q 31688/1 |goto 43.32,77.01
Find Restless Leng |q 31688/2 |goto 43.32,77.01
|tip You will find him in the last one you open.
step
label "Slay_Sikthik_Mantids"
Kill Sik'thik enemies around this area
|tip They look like insect people.
Slay #12# Sik'thik Mantids |q 31687/1 |goto 43.32,77.01
'|kill Sik'thik Venomspitter##62575, Sik'thik Vess-Guard##61354, Sik'thik Drone##62576
step
talk Taran Zhu##62275
turnin Taoshi and Korvexxis##30981 |goto 47.48,78.87
turnin Lao-Chin and Serevex##31063 |goto 47.48,78.87
turnin Nurong and Rothek##31064 |goto 47.48,78.87
accept The Sha of Hatred##30968 |goto 47.48,78.87
step
Watch the dialogue
|tip Follow your allies when they enter the building.
kill Sha of Hatred##62541 |q 30968/1 |goto 45.92,82.86
|tip Inside the building beneath the huge tree.
|tip Avoid the circles on the ground.
|tip Kill the enemies it summons.
'|kill Vestige of Hatred##65378
step
talk Taoshi##62802
|tip Inside the building beneath the huge tree.
turnin The Sha of Hatred##30968 |goto 46.12,82.46
step
Leave the building |goto 47.31,79.28 < 15 |walk |only if subzone("Sik'vess Lair") and indoors()
talk Rensai Oakhide##62278
turnin Thinning the Sik'thik##31687 |goto 53.92,78.12
turnin The Search for Restless Leng##31688 |goto 53.92,78.12
step
talk Kite Master Yao-Li##62909
fpath Shado-Pan Garrison |goto 50.08,71.98
step
talk Provisioner Bamfu##61625
|tip He walks around this area.
accept Natural Antiseptic##30922 |goto 49.14,71.32
accept The Field Armorer##30963 |goto 49.14,71.32
accept A Proper Poultice##30964 |goto 49.14,71.32
step
talk Tai Ho##61482
accept The Motives of the Mantid##30921 |goto 49.13,71.24
accept Set the Mantid Back##30923 |goto 49.13,71.24
step
talk Kali the Night Watcher##62874
home Shado-Pan Garrison |goto 48.84,70.83 |q 30921 |future
stickystart "Discover_The_Clues"
stickystart "Collect_Full_Mushan_Bladders"
stickystart "Collect_Mao_Willows"
stickystart "Collect_Rankbite_Shell_Fragments"
step
use the Gunpowder Casks##81891
|tip Go around the huge tree.
Explode the Kri'thik Supplies |q 30923/2 |goto 56.59,54.02
step
use the Gunpowder Casks##81891
Explode the Kri'thik Weapons |q 30923/1 |goto 55.42,53.13
step
label "Discover_The_Clues"
Kill Kri'thik enemies around this area
|tip They look like insect people.
Discover the First Clue |q 30921/1 |goto 56.46,52.65
Discover the Second Clue |q 30921/2 |goto 56.46,52.65
Discover the Third Clue |q 30921/3 |goto 56.46,52.65
Discover the Fourth Clue |q 30921/4 |goto 56.46,52.65
'|kill Kri'thik Screamer##61377, Kri'thik Boneslicer##61376
step
label "Collect_Full_Mushan_Bladders"
Kill Longshadow enemies around this area
|tip They look like dinosaurs.
collect 5 Full Mushan Bladder##82387 |q 30922/1 |goto 60.35,53.59
You can find more around [51.10,63.64]
'|kill Longshadow Bull##66463, Longshadow Mushan##61618
step
label "Collect_Mao_Willows"
click Mao-Willow##211779+
|tip They look like purple plants with white fluffy bulbs at the top of them.
collect 11 Mao-Willow##82389 |q 30964/1 |goto 60.35,53.59
step
label "Collect_Rankbite_Shell_Fragments"
Kill Rankbite enemies around this area
|tip They look like turtles.
collect 120 Rankbite Shell Fragment##82388 |q 30963/1 |goto 60.35,53.59
You can find more around [51.10,63.64]
'|kill Rankbite Ancient##66462, Rankbite Tortoise##61619
step
talk Tai Ho##61482
turnin The Motives of the Mantid##30921 |goto 49.14,71.23
turnin Set the Mantid Back##30923 |goto 49.14,71.23
accept The Wisdom of Niuzao##30924 |goto 49.14,71.23
step
talk Provisioner Bamfu##61625
|tip He walks around this area.
turnin Natural Antiseptic##30922 |goto 49.14,71.32
turnin The Field Armorer##30963 |goto 49.14,71.32
turnin A Proper Poultice##30964 |goto 49.14,71.32
step
talk Ku-Mo##61539
accept My Father's Crossbow##30931 |goto 43.87,65.76
step
kill Et'kil##61540
|tip Outside, behind the building.
collect Father's Crossbow##82332 |q 30931/1 |goto 38.67,65.31
step
talk Ku-Mo##61539
turnin My Father's Crossbow##30931 |goto 43.87,65.76
step
talk Sentinel Commander Qipan##61584
|tip At the top of the stairs.
accept Father's Footsteps##30932 |goto 39.41,61.96
step
talk Ogo the Younger##61581
turnin The Wisdom of Niuzao##30924 |goto 39.33,62.22
accept Niuzao's Price##30925 |goto 39.33,62.22
step
talk Bluesaddle##61161
accept Bad Yak##30929 |goto 39.21,62.01
step
clicknpc Ruthers##61163
Gently Pet Ruthers |q 30929/1 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Offer Ruthers an Apple |q 30929/2 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Lightly Nudge Ruthers |q 30929/3 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Attempt to Mount Ruthers |q 30929/4 |goto 39.27,61.93
step
talk Bluesaddle##61161
turnin Bad Yak##30929 |goto 39.21,62.01
step
clicknpc Sentinel Yalo##61683
|tip He walks around this area.
Find Sentinel Yalo |q 30932/4 |goto 39.19,61.07
step
click Father's Shield##211836
|tip At the top of the stairs.
Find Father's Shield |q 30932/2 |goto 37.54,61.37
step
click Father's Bedroll##211837
|tip Inside the building at the top of the temple.
Find Father's Bedroll |q 30932/1 |goto 37.36,60.90
step
clicknpc Ha-Cha##61685
|tip At the top of the temple.
Find Ha-Cha |q 30932/3 |goto 37.66,63.95
step
talk Ku-Mo##61539
|tip At the top of the stairs.
turnin Father's Footsteps##30932 |goto 39.45,61.93
step
talk Bluesaddle##61161
accept Pick a Yak##30930 |goto 35.40,56.65
step
use the Yak Lasso##82468
|tip Use it on Wild Townlong Yaks.
|tip They look like bison.
|tip You can find them all around the pond.
kill Wild Townlong Yak##61635+
|tip Most will run away, but one of them will eventually be suitable.
Find a Suitable Yak |q 30930/1 |goto 36.13,52.22
step
talk Bluesaddle##61161
turnin Pick a Yak##30930 |goto 35.40,56.65
step
Kill Sra'thik enemies around this area
|tip They look like insect people.
Find the Statuette Head |q 30925/1 |goto 41.86,46.06
Find the Statuette Body |q 30925/2 |goto 41.86,46.06
Find the Statuette Legs |q 30925/3 |goto 41.86,46.06
Find the Statuette Tail |q 30925/4 |goto 41.86,46.06
'|kill Sra'thik Guard##61518, Sra'thik Wound-Mender##61517, Sra'thik Wound-Mender##61517, Sra'thik Drone##61516
step
talk Ogo the Younger##61581
|tip At the top of the stairs.
turnin Niuzao's Price##30925 |goto 39.34,62.21
step
talk Ogo the Elder##61580
accept The Terrible Truth##30926 |goto 39.35,62.29
step
talk Yak-Keeper Kyana##61585
accept A Trail of Fear##30928 |goto 39.15,62.07
step
talk Sentinel Commander Qipan##61584
accept Give Them Peace##30927 |goto 39.41,61.96
step
Find the Catacombs |q 30926/1 |goto 33.12,61.56
|tip At the entrance of the cave.
stickystart "Give_Fear_Stricken_Sentinels_Peace"
stickystart "Kill_Dreadlings"
step
Enter the cave |goto 33.12,61.56 < 30 |walk
Investigate the Niuzao Catacombs |q 30926/2 |goto Townlong Steppes/13 60.71,40.22
|tip Inside the cave.
step
kill Dread Shadow##62307 |q 30926/3 |goto 50.25,24.92
|tip Inside the cave.
step
talk Tai Ho##61482
|tip Inside the cave.
turnin The Terrible Truth##30926 |goto 56.15,20.22
step
label "Give_Fear_Stricken_Sentinels_Peace"
clicknpc Fear-Stricken Sentinel##62276+
|tip They look like armored pandaren laying on the ground.
|tip Inside the cave. |notinsticky
Give #10# Fear-Stricken Sentinels Peace |q 30927/1 |goto Townlong Steppes/0 33.12,61.56
step
label "Kill_Dreadlings"
kill 12 Dreadling##62306 |q 30928/1 |goto 33.12,61.56
|tip They look like larger shadow aliens.
|tip Inside the cave. |notinsticky
step
Leave the cave |goto 33.12,61.56 < 30 |walk |only if subzone("Niuzao Catacombs") and indoors()
talk Sentinel Commander Qipan##61584
|tip At the top of the stairs.
turnin Give Them Peace##30927 |goto 39.41,61.96
step
talk Yak-Keeper Kyana##61585
turnin A Trail of Fear##30928 |goto 39.15,62.07
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Dread Wastes (30-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."DreadWastes",
condition_suggested=function() return level >= 30 and level <= 50 and not completedq(31179) end,
startlevel=30,
endlevel=50,
},[[
step
talk Kite Master Len##61512
accept Better Dead than Dread##31847 |goto Kun-Lai Summit/0 34.54,59.12
step
talk Kite Master Len##61512
fpath Serpent's Spine |goto 34.54,59.12
step
talk Bowmistress Li##62112
turnin Better Dead than Dread##31847 |goto Vale of Eternal Blossoms/0 14.15,76.96 |only if haveq(31847) or completedq(31847)
accept Falling Down##31001 |goto Vale of Eternal Blossoms/0 14.15,76.96
accept Nope##31002 |goto Vale of Eternal Blossoms/0 14.15,76.96
step
click Shado-Pan Rope
Climb Down the Wall |invehicle |goto 14.20,76.73 |q 31001
|only if walking
stickystart "Destroy_Dreadspinner_Eggs"
step
kill 6 Dreadspinner Tender##61981 |q 31002/2 |goto Dread Wastes/0 72.96,22.81
|tip They look like spiders.
You can find more around [Dread Wastes/0 71.72,27.95]
step
label "Destroy_Dreadspinner_Eggs"
use the Shado-Pan Dragon Gun##82807
|tip Use it on Dreadspinner Eggs.
|tip They look like clusters of white spider eggs.
Destroy #20# Dreadspinner Eggs |q 31002/1 |goto 72.96,22.81
You can find more around [71.72,27.95]
step
talk Marksman Lann##62166
Find Marksman Lann |q 31001/1 |goto 72.56,28.67
step
talk Marksman Lann##62166
turnin Falling Down##31001 |goto 72.56,28.67
turnin Nope##31002 |goto 72.56,28.67
accept Psycho Mantid##31003 |goto 72.56,28.67
step
kill Adjunct Kree'zot##62301 |q 31003/1 |goto 73.47,27.48
|tip Inside the small cave.
step
talk Klaxxi'va Tik##62203
|tip Inside the small cave.
turnin Psycho Mantid##31003 |goto 73.67,27.58
accept Preserved in Amber##31004 |goto 73.67,27.58
step
click Ancient Amber Chunk##212980
Use the Klaxxi Tuning Fork on the Amber |q 31004/1 |goto 70.24,25.70
step
Watch the dialogue
talk Kil'ruk the Wind-Reaver##62202
turnin Preserved in Amber##31004 |goto 70.20,25.64
accept Wakening Sickness##31005 |goto 70.20,25.64
accept Ancient Vengeance##31676 |goto 70.20,25.64
stickystart "Collect_Sapfly_Bits"
step
kill 6 Vengeful Gurthani Spirit##65452 |q 31676/1 |goto 67.75,29.72
|tip They look like banshees.
You can find more around [71.43,36.86]
step
label "Collect_Sapfly_Bits"
kill Sapfly##62386+
|tip They look like small yellow flying insects.
collect 100 Sapfly Bits##83075 |q 31005/1 |goto 67.75,29.72
You can find more around [71.43,36.86]
step
talk Kil'ruk the Wind-Reaver##62202
turnin Wakening Sickness##31005 |goto 70.20,25.64
turnin Ancient Vengeance##31676 |goto 70.20,25.64
accept The Klaxxi Council##31006 |goto 70.20,25.64
step
talk Kil'ruk the Wind-Reaver##62413
Tell it _"Take me to Klaxxi'vess."_ |gossip 35586
Begin Traveling to Klaxxi'vess |invehicle |goto 70.20,25.64 |q 31006
step
Watch the dialogue
Travel to Klaxxi'vess |q 31006/1 |goto 55.01,33.99 |notravel
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Klaxxi Council##31006 |goto 54.98,34.05
accept The Dread Clutches##31007 |goto 54.98,34.05
accept Not Fit to Swarm##31660 |goto 54.98,34.05
step
talk Kor'ik##64815
accept Dead Zone##31009 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
accept Amber Arms##31008 |goto 55.02,35.56
step
talk Kik'tik##63501
fpath Klaxxi'vess |goto 55.83,34.88
step
talk Zit'tix##65220
home Klaxxi'vess |goto 55.92,32.32 |q 31010 |future
step
talk Kil'ruk the Wind-Reaver##62538
Tell it _"Please fly me to the Clutches of Shek'zeer"_ |gossip 35587
Begin Flying to the Clutches of Shek'zeer |invehicle |goto 54.98,34.05 |q 31009
step
Fly to the Clutches of Shek'zeer |outvehicle |goto 39.01,40.52 |q 31009 |notravel
stickystart "Collect_Amber_Blades"
stickystart "Kill_Shekzeer_Clutch_Keepers"
stickystart "Kill_Shekzeer_Swarmborn"
step
click Inactive Sonic Relay
Activate the Sonic Relay |q 31009/1 |goto 40.03,39.05
step
_Click the Complete Quest Box:_
turnin Dead Zone##31009
accept In Her Clutch##31010
step
click Sha-Haunted Crystal##214562
accept A Source of Terrifying Power##31661 |goto 44.59,41.36
step
click Ancient Amber Chunk##212980
Watch the dialogue
Kill the enemies that attack in waves
Waken the Paragon |q 31010/1 |goto 44.74,41.55
'|kill Shek'zeer Swarmborn##62748, Shek'zeer Bladesworn##62749
step
label "Collect_Amber_Blades"
kill Shek'zeer Bladesworn##62563+
|tip They look like insect people with large swords.
|tip Some of them ride on large scorpions.
collect 6 Amber Blade##83135 |q 31008/1 |goto 43.29,43.41
step
label "Kill_Shekzeer_Clutch_Keepers"
kill 6 Shek'zeer Clutch-Keeper##64559 |q 31007/1 |goto 44.43,41.77
|tip They look like insect people casting a shadow spell.
step
label "Kill_Shekzeer_Swarmborn"
kill 30 Shek'zeer Swarmborn##62582 |q 31660/1 |goto 44.43,41.77
|tip They look like small insect people.
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Dread Clutches##31007 |goto 54.99,34.04
turnin Not Fit to Swarm##31660 |goto 54.99,34.04
step
talk Malik the Unscathed##62774
turnin In Her Clutch##31010 |goto 54.94,34.13
step
talk Kor'ik##64815
accept A Cry From Darkness##31066 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
turnin Amber Arms##31008 |goto 55.02,35.56
turnin A Source of Terrifying Power##31661 |goto 55.02,35.56
accept Concentrated Fear##31108 |goto 55.02,35.56
step
talk Malik the Unscathed##62774
|tip He walks to this location.
accept The Dreadsworn##31689 |goto 55.06,35.47
accept Citizens of a New Empire##31107 |goto 55.06,35.47
stickystart "Collect_Dread_Amber_Focuses"
stickystart "Kill_Vorthik_Dreadsworn"
stickystart "Collect_Vorthik_Eggs"
step
kill Qi'tar the Deathcaller##62863 |q 31066/1 |goto 59.36,18.41
step
label "Collect_Dread_Amber_Focuses"
kill Vor'thik Fear-Shaper##62814+
|tip They look like larger insect people casting a shadow spell.
collect 4 Dread Amber Focus##86616 |q 31108/1 |goto 58.16,14.62
step
label "Kill_Vorthik_Dreadsworn"
kill 6 Vor'thik Dreadsworn##62813 |q 31689/1 |goto 58.16,14.62
|tip They look like larger insect people carrying polearms.
step
label "Collect_Vorthik_Eggs"
click Vor'thik Egg##214170+
|tip They look like squirming yellow cocoons.
collect 10 Vor'thik Eggs##86598 |q 31107/1 |goto 59.65,16.99
step
talk Kor'ik##64815
turnin A Cry From Darkness##31066 |goto 54.77,34.06
accept Extending Our Coverage##31087 |goto 54.77,34.06
step
talk Malik the Unscathed##62774
turnin The Dreadsworn##31689 |goto 55.06,35.47
turnin Citizens of a New Empire##31107 |goto 55.06,35.47
step
talk Ambersmith Zikk##64599
turnin Concentrated Fear##31108 |goto 55.02,35.56
step
talk Kil'ruk the Wind-Reaver##62538
accept Amber Is Life##31019 |goto 55.06,35.85
stickystart "Kill_Mistblade_Rippers"
step
kill Mistblade Ripper##61970+
|tip They look like lizard people.
accept Relics of the Swarm##31023 |goto 62.23,57.58
|tip You will eventually automatically accept this quest after looting.
stickystart "Collect_Mantid_Relics"
step
label "Kill_Mistblade_Rippers"
kill 7 Mistblade Ripper##61970 |q 31019/1 |goto 65.38,63.64
|tip They look like lizard people.
step
label "Collect_Mantid_Relics"
click Mantid Relic##212079+
|tip They look like broken stone tablets.
|tip You can find more on the shore around the lake.
collect 8 Mantid Relic##82867 |q 31023/1 |goto 65.07,60.14
|only if haveq(31023) or completedq(31023)
step
Enter the underground cave |goto 66.76,63.84 < 15 |walk
kill Mistblade Scale-Lord##63179 |q 31019/2 |goto 66.42,66.11
|tip Inside the underground cave.
step
clicknpc Ancient Amber Chunk##65354
|tip Inside the underground cave.
turnin Amber Is Life##31019 |goto 66.84,65.39
step
Watch the dialogue
|tip Inside the underground cave.
_Next to you:_
talk Korven the Prime##62232
accept Feeding the Beast##31020 |goto 66.84,65.39
accept Living Amber##31021 |goto 66.84,65.39
stickystart "Kill_Coldbite_Crocolisks"
step
Leave the underground cave |goto 66.76,63.84 < 15 |walk |only if subzone("Mistblade Den") and indoors()
click Amber Fragment##212011+
|tip They look like orange rocks underwater.
collect Living Amber##82864+ |n
use the Living Amber##82864
Feed Korven the Prime #9# Living Amber |q 31021/1 |goto 65.19,58.75
step
label "Kill_Coldbite_Crocolisks"
kill 8 Coldbite Crocolisk##62023 |q 31020/1 |goto 65.19,58.75
|tip Underwater. |notinsticky
step
_Next to you:_
talk Korven the Prime##62232
turnin Feeding the Beast##31020
turnin Living Amber##31021
accept Kypari Zar##31022
step
click Sonar Tower##212933
Examine the Sonar Tower |q 31022/1 |goto 59.81,59.47
step
Watch the dialogue
Kill the enemies that attack in waves
Defend Korven the Prime |q 31022/2 |goto 59.98,59.40
'|kill Ik'thik Towerguard##63294
step
_Next to you:_
talk Korven the Prime##62232
turnin Kypari Zar##31022
accept The Root of the Problem##31026
step
Enter the underground cave |goto 58.60,59.45 < 15 |walk
kill Coldbite Matriarch##62008 |q 31026/1 |goto 57.36,57.78
|tip Inside the underground cave.
|tip Avoid stepping on the purple eggs, they spawn enemies.
step
_Next to you:_
talk Korven the Prime##62232
turnin The Root of the Problem##31026
step
Leave the underground cave |goto 58.60,59.45 < 15 |walk |only if subzone("Coldbite Burrow") and indoors()
Enter the building |goto 46.24,53.14 < 15 |walk
Locate Amberglow Hollow |q 31087/1 |goto 46.54,52.60
|tip Inside the building.
step
kill Adjunct Zet'uk##65478 |q 31087/2 |goto 48.09,49.77
|tip Inside the building.
step
click Silent Beacon##213250
|tip Inside the building.
Use the Resonating Crystal on the Silent Beacon |q 31087/3 |goto 48.16,49.75
step
talk Kor'ik##65365
|tip Inside the building.
turnin Extending Our Coverage##31087 |goto 48.11,49.64
accept Isolating the Frequency##31088 |goto 48.11,49.64
accept The Color of Our Energy##31090 |goto 48.11,49.64
stickystart "Kill_Ikthik_Harvesters"
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
click Amber Collector##212923+
|tip They look like orange bags hanging on the side of trees.
collect 7 Amber-Filled Jar##85159 |q 31090/1 |goto 40.84,51.34
step
label "Kill_Ikthik_Harvesters"
kill 8 Ik'thik Harvester##63206 |q 31088/1 |goto 40.84,51.34
|tip They look like insect people.
step
talk Infiltrator Ik'thal##65511
fpath The Briny Muck |goto 42.53,55.75
step
Enter the building |goto 46.24,53.14 < 15 |walk
talk Kor'ik##65365
|tip Inside the building.
turnin Isolating the Frequency##31088 |goto 48.11,49.64
turnin The Color of Our Energy##31090 |goto 48.11,49.64
accept By the Sea, Nevermore##31089 |goto 48.11,49.64
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
use the Klaxxi Tuning Fork##84119
Awaken Kaz'tik the Manipulator |q 31089/1 |goto 43.50,63.26
step
Watch the dialogue
talk Kaz'tik the Manipulator##63758
turnin By the Sea, Nevermore##31089 |goto 43.32,63.49
accept Reunited##31091 |goto 43.32,63.49
step
talk Kaz'tik the Manipulator##63876
Tell him _"I'm ready to help you find your weapon."_ |gossip 28603
Watch the dialogue
Follow Kaz'tik the Manipulator |goto 43.32,63.49 > 10 |c |q 31091
step
Watch the dialogue
|tip Follow Kaz'tik the Manipulator and protect him as he walks.
|tip He eventually walks to this location.
Escort Kaz'tik the Manipulator to the Undisturbed Dirt |q 31091/1 |goto 41.76,72.02
step
Watch the dialogue
Find Kaz'tik's Greatest Weapon |q 31091/2 |goto 41.76,72.02
step
talk Kaz'tik the Manipulator##63876
turnin Reunited##31091 |goto 41.76,72.02
accept The Kunchong Whisperer##31359 |goto 41.76,72.02
accept Feed or Be Eaten##31092 |goto 41.76,72.02
stickystart "Feed_Succulent_Turtle_Filets_To_Kovok"
stickystart "Slay_Muckscale_Tribe_Members"
step
kill Oracle Hiss'ir##63998 |q 31359/1 |goto 41.93,63.77
|tip He walks around this area.
step
click Glowing Amber##214062
accept Falling to Pieces##31398 |goto 41.88,63.72
step
label "Feed_Succulent_Turtle_Filets_To_Kovok"
Kill Brineshell enemies around this area
|tip They look like turtles.
collect Succulent Turtle Filet##86489+ |n
use the Succulent Turtle Filet##86489+
Feed #6# Succulent Turtle Filets to Kovok |q 31092/1 |goto 37.63,62.58
'|kill Brineshell Snapper##63981, Trained Brineshell Snapper##65330
step
label "Slay_Muckscale_Tribe_Members"
Kill Muckscale enemies around this area
|tip They look like lizard people.
Slay #10# Muckscale Tribe Members |q 31359/2 |goto 37.63,62.58
'|kill Muckscale Slayer##63999, Muckscale Flesh-Hunter##63997, Muckscale Shaman##64008, Muckscale Ripper##63993
step
talk Kaz'tik the Manipulator##63758
turnin The Kunchong Whisperer##31359 |goto 54.25,35.78
turnin Feed or Be Eaten##31092 |goto 54.25,35.78
turnin Falling to Pieces##31398 |goto 54.25,35.78
step
talk Ambersmith Zikk##64599
turnin Relics of the Swarm##31023 |goto 55.02,35.56
accept Gambling Problem##31727 |goto 55.02,35.56
step
talk Kil'ruk the Wind-Reaver##62538
accept A Not So Friendly Request##31730 |goto 55.06,35.85
step
talk Jin the Flying Keg##63500
fpath The Sunset Brewgarden |goto 50.21,12.24
step
talk Sapmaster Vu##62666
turnin A Not So Friendly Request##31730 |goto 51.21,11.39
accept The Heavens Hum With War##31067 |goto 51.21,11.39
step
Enter the building |goto 53.60,15.45 < 15 |walk
click Scroll of Auspice##212389
|tip Inside the building.
accept Sacred Recipe##31068 |goto 53.09,12.36
step
kill Azzix K'tai##62843 |q 31067/1 |goto 52.74,10.27
|tip He walks around this area.
|tip Inside the building.
step
Leave the building |goto 53.60,15.45 < 15 |walk |only if subzone("The Amber Vault") and indoors()
talk Lya of Ten Songs##62667
turnin Sacred Recipe##31068 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin The Heavens Hum With War##31067 |goto 51.21,11.39
accept Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
accept Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
accept I Bring Us Great Shame##31071 |goto 51.13,11.11
step
Watch the dialogue
talk Lya of Ten Songs##62667
|tip She runs to this location.
accept Rending Daggers##31072 |goto 50.73,11.71
step
talk Chen Stormstout##62779
accept Fate of the Stormstouts##31129 |goto 50.45,12.05
step
talk Lya of Ten Songs##62667
Ask her _"Have you seen any Stormstouts here in the Brewgarden?"_ |gossip 35828
Speak with Lya of Ten Songs |q 31129/2 |goto 50.73,11.71
step
talk Big Dan Stormstout##62845
Ask him _"Is your name really Stormstout?"_ |gossip 35823
Speak with Big Dan Stormstout |q 31129/3 |goto 50.90,11.36
step
talk Sapmaster Vu##62666
Ask him _"Have you seen anybody named Stormstout come through here?"_ |gossip 35825
Speak with Sapmaster Vu |q 31129/1 |goto 51.21,11.39
step
talk Chen Stormstout##62779
turnin Fate of the Stormstouts##31129 |goto 50.45,12.05
stickystart "Harvest_Shade"
step
talk Chen Stormstout##62779
accept Evie Stormstout##31077 |goto 54.11,20.48
step
click Lost Keg##212540
collect Lost Keg##83781 |q 31071/2 |goto 54.43,20.27
step
click Lost Picnic Supplies##212556
collect Lost Picnic Supplies##83783 |q 31071/3 |goto 56.01,19.44
step
kill Kz'Kzik##62832
|tip He looks like a larger insect person that walks around this area.
collect Blade of Kz'Kzik##84111 |q 31072/1 |goto 53.29,19.98
step
click Lost Mug##212548
collect Lost Mugs##83782 |q 31071/1 |goto 51.70,19.07
step
kill Ilikkax##62833
|tip He looks like a larger insect person that walks around this area.
collect Blade of Ilikkax##84112 |q 31072/2 |goto 50.98,21.02
step
label "Harvest_Shade"
Kill enemies around this area
|tip Only enemies that look like shadow aliens will count for the quest goal.
Harvest #100# Shade |q 31069/1 |goto 55.21,18.18
'|kill Dread Lurker##62751, Nagging Dreadling##65996
step
kill Frightened Mushan##62760+
|tip They look like dinosaurs.
collect 3 Large Mushan Tooth##84107 |q 31070/1 |goto 49.15,19.15
step
talk Lya of Ten Songs##62667
turnin Rending Daggers##31072 |goto 50.73,11.71
accept Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
turnin Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
turnin I Bring Us Great Shame##31071 |goto 51.13,11.11
step
talk Sapmaster Vu##62666
accept Bound With Wood##31073 |goto 51.21,11.39
step
talk Defender Azzo##63218
accept Kor'thik Aggression##31133 |goto 50.19,12.44
step
Meet up with Chen |q 31077/1 |goto 50.18,10.20
step
Watch the dialogue
Eulogize Evie |q 31077/2 |goto 50.18,10.20
step
talk Chen Stormstout##62779
turnin Evie Stormstout##31077 |goto 50.18,10.20
accept Han Stormstout##31078 |goto 50.18,10.20
stickystart "Slay_Korthik_Mantids"
step
Enter the building |goto 47.00,16.82 < 15 |walk
clicknpc Han Stormstout##62776
|tip Inside the building.
|tip You can't run through the orange beams.
|tip Follow the path in and out of the rooms so that you never touch the orange beams.
|tip You will eventually be able to reach him.
Find Han Stormstout |q 31078/1 |goto 43.75,16.75
step
talk Chen Stormstout##62779
|tip Inside the building.
|tip Run through the splashing water and it will knock you toward him.
turnin Han Stormstout##31078 |goto 44.41,16.81
step
Leave the building |goto 47.00,16.82 < 15 |walk |only if subzone("Morrowchamber") and indoors()
Enter the building |goto 44.79,15.86 < 10 |walk
Find the Mark of the Empress |q 31074/1 |goto 44.51,16.78
|tip Inside the building.
step
Leave the building |goto 44.79,15.86 < 10 |walk |only if subzone("Kor'vess") and indoors()
Enter the building |goto 43.05,14.00 < 10 |walk
Find the Heartroot of Kypari Kor |q 31074/2 |goto 43.22,14.96
|tip Inside the building.
step
Leave the building |goto 43.05,14.02 < 10 |walk |only if subzone("Kor'vess") and indoors()
clicknpc Withered Husk##62876+
|tip They look like dead trees chopped in half.
collect 8 Fragrant Corewood##84118 |q 31073/1 |goto 46.29,13.10
step
label "Slay_Korthik_Mantids"
Kill Kor'thik enemies around this area
|tip They look like insect people.
Slay #17# Kor'thik Mantids |q 31133/1 |goto 43.72,12.83
'|kill Kor'thik Havoc##62757, Kor'thik Chitinel##62756, Kor'thik Battlesinger##62758
step
talk Defender Azzo##63218
turnin Kor'thik Aggression##31133 |goto 50.19,12.44
step
talk Lya of Ten Songs##62667
turnin Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Wood##31073 |goto 51.21,11.39
accept Sunset Kings##31075 |goto 51.21,11.39
step
talk Sapmaster Vu##62666
turnin Sunset Kings##31075 |goto 38.18,17.18
step
talk Olon##62668
accept Fiery Wings##31080 |goto 38.20,17.12
step
talk Boggeo##62772
accept The Horror Comes A-Rising##31079 |goto 38.16,17.34
step
talk Lya of Ten Songs##62667
accept Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
accept Great Vessel of Salvation##31082 |goto 38.65,17.25
stickystart "Collect_Flittering_Dust"
stickystart "Kill_Kyparites"
stickystart "Kill_Shuffling_Mistlurkers"
step
kill Mygoness##62766 |q 31081/2 |goto 32.92,19.36
|tip He walks around this area.
step
kill Ahgunoss##62765 |q 31081/1 |goto 32.10,17.37
step
use the Rikkitun Bell##84267
|tip Use it if you lose your sprites and can't click the Motherseeds.
clicknpc Motherseed##62601+
|tip They look like huge acorns with yellow crystals in them.
|tip They are located near the enemies surrounding this location.
|tip Bring them to this location.
Bring #3# Motherseeds Back to the Motherseed Pit |q 31082/1 |goto 36.88,17.22
step
label "Collect_Flittering_Dust"
clicknpc Rikkilea Flitterling##62764+
|tip They look like fae dragons.
|tip Run into the colorful sparks that fly off of them to collect them.
collect 88 Flitterling Dust##84239 |q 31080/1 |goto 37.26,20.61
step
label "Kill_Kyparites"
kill 2 Kyparite##63007 |q 31079/2 |goto 34.70,20.99
|tip They look like spots of brown splashing water moving across the ground.
|tip Get close to them and they will come out of the ground.
step
label "Kill_Shuffling_Mistlurkers"
kill 7 Shuffling Mistlurker##65404 |q 31079/1 |goto 34.70,20.99
|tip They look like swamp elementals.
step
talk Boggeo##62772
turnin The Horror Comes A-Rising##31079 |goto 38.16,17.33
step
talk Olon##62668
turnin Fiery Wings##31080 |goto 38.20,17.12
step
talk Lya of Ten Songs##62667
turnin Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
turnin Great Vessel of Salvation##31082 |goto 38.65,17.25
accept Bind the Glamour##31084 |goto 38.65,17.25
step
talk Chief Rikkitun##62771
Tell it _"The forked blade is ready, and we have given our gift. Please perform your incantation."_ |gossip 40853
Follow Chief Rikkitum |goto 38.65,17.25 > 10 |c |q 31084
step
Watch the dialogue
|tip Follow Chief Rikkitum as he walks.
|tip He eventually walks to this location.
Allow Chief Rikkitun to Enchant the Forked Blade |q 31084/1 |goto 39.67,23.18
step
talk Chief Rikkitun##62771
turnin Bind the Glamour##31084 |goto 38.65,17.25
step
talk Lya of Ten Songs##62667
accept Fires and Fears of Old##31085 |goto 38.30,17.13
step
talk Sapmaster Vu##62666
accept Blood of Ancients##31086 |goto 38.18,17.18
step
click Solidified Amber##212902
collect Chunk of Solidified Amber##84779 |q 31086/1 |goto 30.22,30.58
step
click Enormous Landslide
Click Here After the Landslide Moves |confirm |goto 30.06,30.89 |q 31085
step
Enter the building |goto 30.18,31.69 < 15 |walk
use the Ruining Fork##84771
|tip Inside the building.
Use the Ruining Fork on Iyyokuk the Lucid |q 31085/1 |goto 32.39,33.65
step
Watch the dialogue
|tip Inside the building.
Kill the enemies that attack
|tip They appear and start channeling on Iyyokuk the Lucid.
Protect Iyyokuk the Lucid Until He Escapes |q 31085/2 |goto 32.39,33.65
'|kill Adjunct G'kkal##63103, Adjunct Okzyk##63102, Adjunct Pivvika##63104
step
Leave the building |goto 30.25,31.73 < 15 |walk |only if subzone("The Amber Hibernal") and indoors()
talk Lya of Ten Songs##62667
turnin Fires and Fears of Old##31085 |goto 50.28,12.07
step
talk Sapmaster Vu##62666
turnin Blood of Ancients##31086 |goto 50.22,12.11
step
talk Min the Breeze Rider##63498
fpath Soggy's Gamble |goto 56.10,70.18
step
talk San the Sea Calmer##63016
|tip Inside the building.
home The Chum Bucket |goto 55.15,71.11
step
talk Deck Boss Arie##63349
turnin Soggy's Gamble##31727 |goto 54.72,72.17
accept Mazu's Breath##31265 |goto 54.72,72.17
step
use the Potion of Mazu's Breath##85869
Drink the Potion of Mazu's Breath |q 31265/1 |goto 54.72,72.17
step
talk Deck Boss Arie##63349
turnin Mazu's Breath##31265 |goto 54.72,72.17
accept Fresh Pots##31181 |goto 54.72,72.17
accept You Otter Know##31182 |goto 54.72,72.17
stickystart "Bait_Crab_Pots"
step
use the Bag of Clams##85231
|tip Use it on Coldwhisker Otters underwater.
Feed #8# Coldwhisker Otters |q 31182/1 |goto 59.48,81.84
'|talk Coldwhisker Otter##63376
step
label "Bait_Crab_Pots"
kill Sea Monarch##63470+
|tip They look like large fish underwater.
collect Sea Monarch Chunks##85230+ |n
click Empty Crab Pot+
|tip They look like red and brown cages underwater.
|tip You need 2 Sea Monarch Chunks to bait each crab pot.
Bait #10# Crab Pots |q 31181/1 |goto 59.48,81.84
step
talk Deck Boss Arie##63349
turnin Fresh Pots##31181 |goto 54.72,72.16
turnin You Otter Know##31182 |goto 54.72,72.16
accept Meet the Cap'n##31183 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Meet the Cap'n##31183 |goto 55.66,72.50
accept Walking Dog##31185 |goto 55.66,72.50
accept Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept On the Crab##31187 |goto 54.72,72.16
accept Shark Week##31188 |goto 54.72,72.16
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
accept Dog Food##31186 |goto 50.72,78.38
stickystart "Feed_Dog"
stickystart "Collect_Thresher_Teeth"
stickystart "Send_Full_Crab_Pots_To_The_Surface"
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Silt Vents |q 31185/1 |goto 46.40,74.06
|tip Underwater.
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Wreck of the Mist-Hopper |q 31185/2 |goto 44.9,78.0
|tip Underwater.
step
click Soggy's Footlocker##213454
|tip It looks like a small brown wooden chest.
|tip Underwater on this sunken ship.
|tip It can appear in other locations on this sunken ship.
collect Sealed Charter Tube##85886 |q 31184/1 |goto 44.73,78.66
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Whale Corpse |q 31185/3 |goto 40.08,78.68
|tip Underwater.
step
label "Send_Full_Crab_Pots_To_The_Surface"
click Full Crab Pot##213508+
|tip They look like red and brown cages.
|tip Underwater. |notinsticky
Send #8# Full Crab Pots to the Surface |q 31187/1 |goto 44.75,76.21
step
label "Feed_Dog"
use the Dog's Whistle##85955 |notinsticky
|tip Use it if Dog isn't following you. |notinsticky
kill Rockshell Snapclaw##63369+
|tip They look like green lobsters.
|tip Underwater. |notinsticky
|tip Dog will eat their corpses.
Feed Dog #10# Times |q 31186/1 |goto 44.75,76.21
step
label "Collect_Thresher_Teeth"
kill Longfin Thresher##63944+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect Thresher Jaw##85998+ |n
use the Thresher Jaw##85998+
collect 200 Thresher Teeth##85999 |q 31188/1 |goto 44.75,76.21
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
turnin Dog Food##31186
step
talk Deck Boss Arie##63349
turnin On the Crab##31187 |goto 54.72,72.16
turnin Shark Week##31188 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Walking Dog##31185 |goto 55.66,72.50
turnin Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Master Angler Ju Lien##64259
Speak with Master Angler Ju Lien |q 31189/1 |goto 53.64,76.05
step
talk Master Angler Ju Lien##64259
Tell him _"Deck Boss said you needed some help."_ |gossip 40852
Watch the dialogue
|tip Click the various fishing rods nearby.
|tip They look like fishing poles leaning on wooden stands next to Master Angler Ju Lien.
Kill the enemies that attack
Assist Master Angler Ju Lien |q 31189/2 |goto 53.64,76.05
'|kill Jiao Spawn##64273
step
talk Deck Boss Arie##63349
turnin Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
accept The Mariner's Revenge##31190 |goto 54.77,72.11
step
clicknpc Mist-Hopper Jr.##64350
Control the Mist-Hopper Jr. |invehicle |goto 56.17,76.29 |q 31190
step
kill Jiao##63330
|tip It looks like a huge octopus in the water.
|tip Aim at the red crosshairs.
|tip Use the ability on your action bar.
Land #25# Bow Hits |q 31190/1 |goto 53.35,80.89
Land #25# Port Side Hits |q 31190/2 |goto 53.35,80.89
Land #25# Starboard Hits |q 31190/3 |goto 53.35,80.89
Land #25# Stern Hits |q 31190/4 |goto 53.35,80.89
step
Stop Controlling the Mist-Hopper Jr. |outvehicle |goto 56.2,76.3 |q 31190
|tip Click the arrow on your action bar.
step
talk Captain "Soggy" Su-Dao##63317
turnin The Mariner's Revenge##31190 |goto 56.57,75.92
step
talk Deck Boss Arie##63349
accept Mazu's Bounty##31354 |goto 56.57,75.82
step
talk Master Angler Ju Lien##64259
turnin Mazu's Bounty##31354 |goto 54.90,72.83
accept Once in a Hundred Lifetimes##32030 |goto 54.90,72.83
step
talk Klaxxi'va Ik##65395
turnin Once in a Hundred Lifetimes##32030 |goto 54.71,34.75
accept Overthrone##31782 |goto 54.71,34.75
step
Watch the dialogue
Witness the Klaxxi Ritual |q 31782/1 |goto 54.71,34.75
step
talk Klaxxi'va Vor##62519
turnin Overthrone##31782 |goto 55.11,34.27
step
talk Kor'ik##64815
accept The Zan'thik Dig##31605 |goto 54.77,34.06
step
talk Kil'ruk the Wind-Reaver##62538
accept Skeer the Bloodseeker##31175 |goto 55.06,35.85
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
click Ancient Amber Chunk##212980
|tip Inside the underwater cave.
Awaken Skeer the Bloodseeker |q 31175/1 |goto 25.70,50.40
step
Watch the dialogue
|tip Inside the underwater cave.
talk Skeer the Bloodseeker##63071
turnin Skeer the Bloodseeker##31175 |goto 25.71,50.30
accept A Strange Appetite##31176 |goto 25.71,50.30
accept Fine Dining##31177 |goto 25.71,50.30
accept A Bloody Delight##31178 |goto 25.71,50.30
stickystart "Collect_Starfish_Meat"
stickystart "Collect_Volatile_Blood"
step
kill Briny Clacker##63348+
|tip They look like small lobsters.
|tip Underwater.
collect 8 Clacker Tail##85212 |q 31177/1 |goto 25.02,61.12
step
label "Collect_Starfish_Meat"
click Spiny Starfish##212988+
|tip They look like pink starfish.
|tip Underwater. |notinsticky
collect 12 Starfish Meat##85211 |q 31176/1 |goto 25.02,61.12
step
label "Collect_Volatile_Blood"
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
kill Dread Remora##63353+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect 100 Volatile Blood##85229 |q 31178/1 |goto 25.02,61.12
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
talk Skeer the Bloodseeker##63071
|tip Inside the underwater cave.
turnin A Strange Appetite##31176 |goto 25.71,50.62
turnin Fine Dining##31177 |goto 25.71,50.62
turnin A Bloody Delight##31178 |goto 25.71,50.62
accept The Scent of Blood##31179 |goto 25.71,50.62
step
kill 12 Muckscale Flesheater##63465 |q 31179/1 |goto 25.71,50.97
|tip They attack in waves.
|tip Inside the underwater cave.
step
Watch the dialogue
|tip Inside the underwater cave.
kill Muckscale Serpentus##63466 |q 31179/2 |goto 25.71,50.97
step
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
talk Rik'kal the Dissector##65253
turnin The Zan'thik Dig##31605 |goto 31.80,88.95
accept The Dissector Wakens##31606 |goto 31.80,88.95
step
Kill the enemies that attack
Waken the Paragon |q 31606/1 |goto 31.80,88.95
'|kill Zan'thik Impaler##65273, Zan'thik Manipulator##65274
step
talk Rik'kal the Dissector##65253
turnin The Dissector Wakens##31606 |goto 31.80,88.95
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Scent of Blood##31179 |goto 55.06,35.85
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Daily",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."WanderingIsle",
monkquest=1,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31840) or not completedq(31841) or not completedq(31842) or not completedq(31843) or not completedq(31844) or not completedq(31845) or not completedq(31846) and level >= 20 end,
condition_end=function() return completedq(31840) end,
description="This guide will walk you through the Monk daily for extra experience.",
},[[
step
talk Master Hight##66260
accept Practice Makes Perfect: Master Cheng##31840 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Woo##31841 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Kistane##31842 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Yoon##31843 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Cheng##31844 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Tsang##31845 |or |goto Kun-Lai Summit 48.6,42.7
accept Practice Makes Perfect: Master Hsu##31846 |or |goto Kun-Lai Summit 48.6,42.7
step
talk Master Cheng##66138
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Cheng##66138
Complete Master Cheng's Training |q 31840/1 |goto 47.1,40.1
|only if haveq(31840)
step
talk Master Woo##65960
Tell her you wish to challenge her
Follow her to the center of the area and fight her
kill Master Woo##65960
Complete Master Cheng's Training |q 31841/1 |goto 48.6,39.6
|only if haveq(31841)
step
talk Master Kistane##65899
Tell her you wish to challenge her
Follow her to the center of the area and fight her
kill Master Kistane##65899
Complete Master Kistane's Training |q 31842/1 |goto 48.0,40.2
|only if haveq(31842)
step
talk Master Yoon##66073
Tell her you wish to challenge her
Follow her to the center of the area and fight her
kill Master Yoon##66073
Complete Master Yoon's Training |q 31843/1 |goto 48.0,40.2
|only if haveq(31843)
step
talk Master Cheng##66138
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Cheng##66138
Complete Master Cheng's Training |q 31844/1 |goto 47.1,40.1
|only if haveq(31844)
step
talk Master Tsang##66149
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Tsang##66149
Complete Master Tsang's Training |q 31845/1 |goto 47.1,40.1
|only if haveq(31845)
step
talk Master Hsu##65977
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Hsu##65977
Complete Master Hsu's Training |q 31846/1 |goto 47.1,40.1
|only if haveq(31846)
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Cheng##31840 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Woo##31841 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Kistane##31842 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Yoon##31843 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Cheng##31844 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Tsang##31845 |or |goto 48.6,42.7
turnin Practice Makes Perfect: Master Hsu##31846 |or |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 10",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=20,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31834) and level >= 10 end,
condition_end=function() return completedq(31834) end,
description="This guide will walk you through the Monk daily for extra experience.",
},[[
step
accept The Peak of Serenity - Begin Your Training##31856
|tip You will accept this automatically when you reach level 10.
step
talk Master Hight##66260
|tip Inside the building.
turnin The Peak of Serenity - Begin Your Training##31856 |goto Kun-Lai Summit/0 48.59,42.70
accept Begin Your Training: Master Cheng##31834 |goto 48.59,42.70
step
talk Master Cheng##66138
Tell him _"I wish to challenge you."_
|tip Follow him to the center of the Training Grounds after selecting the dialogue.
Bow to Master Cheng to Begin |script DoEmote("BOW")
kill Master Cheng##66138
Complete Master Cheng's Training |q 31834/1 |goto 47.07,40.15
step
talk Master Hight##66260
turnin Begin Your Training: Master Cheng##31834 |goto 48.59,42.70
accept Practice Makes Perfect: Master Cheng##31840 |goto 48.59,42.70
step
talk Master Cheng##66138
Tell him _"I wish to challenge you."_
|tip Follow him to the center of the Training Grounds after selecting the dialogue.
Bow to Master Cheng to Begin |script DoEmote("BOW")
kill Master Cheng##66138
Complete Master Cheng's Training |q 31840/1 |goto 47.07,40.15
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Cheng##31840 |goto 48.59,42.70
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 40",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=40,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31835) and level >= 40 end,
condition_end=function() return completedq(31835) end,
description="This guide will walk you through the Monk quest at level 40.",
},[[
step
Upon reaching level 40 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Continue Your Training##31857
step
talk Master Hight##66260
turnin The Peak of Serenity - Continue Your Training##31857 |goto Kun-Lai Summit 48.6,42.7
accept Continue Your Training: Master Kistane##31835 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Kistane##65899
Tell her you wish to challenge her
Follow her to the center of the area and fight her
kill Master Kistane##65899
Complete Master Kistane's Training |q 31835/1 |goto 48.0,40.2
step
talk Master Hight##66260
turnin Continue Your Training: Master Kistane##31835 |goto 48.6,42.7
accept Practice Makes Perfect: Master Kistane##31842 |goto 48.6,42.7
step
talk Master Kistane##65899
Tell her you wish to challenge her
Follow her to the center of the area and fight her
kill Master Kistane##65899
Complete Master Kistane's Training |q 31842/1 |goto 48.0,40.2
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Kistane##31842 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 50",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=50,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31836) and level >= 50 end,
condition_end=function() return completedq(31836) end,
description="This guide will walk you through the Monk quest at level 50.",
},[[
step
Upon reaching level 50 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Continue Your Training##31858
step
talk Master Hight##66260
turnin The Peak of Serenity - Continue Your Training##31858 |goto Kun-Lai Summit 48.6,42.7
accept Continue Your Training: Master Yoon##31836 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Yoon##66073
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Yoon##66073
Complete Master Yoon's Training |q 31836/1 |goto 48.0,40.2
step
talk Master Hight##66260
turnin Continue Your Training: Master Yoon##31836 |goto 48.6,42.7
accept Practice Makes Perfect: Master Yoon##31843 |goto 48.6,42.7
step
talk Master Yoon##66073
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Yoon##66073
Complete Master Yoon's Training |q 31843/1 |goto 48.0,40.2
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Yoon##31843 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 60",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=60,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31837) and level >= 60 end,
condition_end=function() return completedq(31837) end,
description="This guide will walk you through the Monk quest at level 60.",
},[[
step
Upon reaching level 60 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Continue Your Training##31859
step
talk Master Hight##66260
turnin The Peak of Serenity - Continue Your Training##31859 |goto Kun-Lai Summit 48.6,42.7
accept Continue Your Training: Master Cheng##31837 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Cheng##66138
Tell her you wish to challenge him
Follow her to the center of the area and fight him
kill Master Cheng##66138
Complete Master Cheng's Training |q 31837/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Continue Your Training: Master Cheng##31837 |goto 48.6,42.7
accept Practice Makes Perfect: Master Cheng##31844 |goto 48.6,42.7
step
talk Master Cheng##66138
Tell him you wish to challenge her
Follow him to the center of the area and fight her
kill Master Cheng##66138
Complete Master Cheng's Training |q 31844/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Cheng##31844 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 70",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=70,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31838) and level >= 70 end,
condition_end=function() return completedq(31838) end,
description="This guide will walk you through the Monk quest at level 70.",
},[[
step
Upon reaching level 70 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Continue Your Training##31860
step
talk Master Hight##66260
turnin The Peak of Serenity - Continue Your Training##31860 |goto Kun-Lai Summit 48.6,42.7
accept Continue Your Training: Master Tsang##31838 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Tsang##66149
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Tsang##66149
Complete Master Tsang's Training |q 31838/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Continue Your Training: Master Tsang##31838 |goto 48.6,42.7
accept Practice Makes Perfect: Master Tsang##31845 |goto 48.6,42.7
step
talk Master Tsang##66149
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Tsang##66149
Complete Master Tsang's Training |q 31845/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Tsang##31845 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 80",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=80,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31861) and level >= 80 end,
condition_end=function() return completedq(31861) end,
description="This guide will walk you through the Monk quest at level 80.",
},[[
step
Upon reaching level 80 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Continue Your Training##31861
step
talk Master Hight##66260
turnin The Peak of Serenity - Continue Your Training##31861 |goto Kun-Lai Summit 48.6,42.7
accept Continue Your Training: Master Hsu##31839 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Hsu##65977
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Hsu##65977
Complete Master Hsu's Training |q 31839/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Continue Your Training: Master Hsu##31839 |goto 48.6,42.7
accept Practice Makes Perfect: Master Hsu##31846 |goto 48.6,42.7
step
talk Master Hsu##65977
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Hsu##65977
Complete Master Hsu's Training |q 31846/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Practice Makes Perfect: Master Hsu##31846 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 90",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Serenity_Peak",
monkquest=90,
condition_valid=function() return raceclass('Monk') end,
condition_valid_msg="Monk only.",
condition_suggested=function() return raceclass('Monk') and not completedq(31844) and level >= 90 end,
condition_end=function() return completedq(31844) end,
description="This guide will walk you through the Monk quest at level 90.",
},[[
step
Upon reaching level 90 as a Monk, you will automatically accept a class quest:
accept The Peak of Serenity - Complete Your Training##31889
step
talk Master Hight##66260
turnin The Peak of Serenity - Complete Your Training##31889 |goto Kun-Lai Summit 48.6,42.7
accept Complete Your Training: The Final Test##31844 |goto Kun-Lai Summit 48.6,42.7
step
talk Master Hight##66260
Tell him you wish to challenge him
Follow him to the center of the area and fight him
kill Master Hight##66260
Complete Master Hight's Training |q 31844/1 |goto 47.1,40.1
step
talk Master Hight##66260
turnin Complete Your Training: The Final Test##31844 |goto 48.6,42.7
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\The Loremaster\\Loremaster of Pandaria",{
achieveid={6541},
patch='50004',
description="Complete all the storyline achievements in all the zones of the game.",
},[[
step
Use the Pandaria Leveling Guides to complete Loremaster:
|tip The Leveling guides cover all required questlines for Loremaster.
|tip Click one of the lines below to load the Leveling guide for that zone.
Jade Forest Quests |achieve 6534 |loadguide "Leveling Guides\\Pandaria (10-60)\\The Jade Forest (10-60)"
Valley of the Four Winds Quests |achieve 6301 |loadguide "Leveling Guides\\Pandaria (10-60)\\Valley of the Four Winds (15-60)"
Townlong Steppes Quests |achieve 6539 |loadguide "Leveling Guides\\Pandaria (10-60)\\Townlong Steppes (25-60)"
Dread Wastes Quests |achieve 6540 |loadguide "Leveling Guides\\Pandaria (10-60)\\Dread Wastes (30-60)"
Krasarang Wilds Quests |achieve 6536 |loadguide "Leveling Guides\\Pandaria (10-60)\\Krasarang Wilds (15-60)"
Kun-Lai Summit Quests |achieve 6538 |loadguide "Leveling Guides\\Pandaria (10-60)\\Kun-Lai Summit (20-60)"
step
_Congratulations!_
You Eearned the "Loremaster of Pandaria" Achievement
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\MoP Remix Intro",{
author="support@zygorguides.com",
description="This guide will help you begin your MoP Remix adventures.",
condition_suggested=function() return hasbuff(424143) end,
condition_suggested_exclusive=true,
startlevel=10,
patch='100207',
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\The Jade Forest (10-70)",
},[[
step
talk Eternus##216591
accept It's About Time##79432 |goto Timeless Isle/0 24.51,52.19
step
click Unstable Rift
Investigate the Unstable Rift |q 79432/1 |goto 25.82,46.28
kill Archaios the Artificer##217564 |q 79432/2 |goto 25.82,46.28
step
Take Archaios's Artifact |q 79432/3 |goto 25.82,46.28
|tip Loot Archaios the Artificer's corpse.
step
talk Eternus##216591
turnin It's About Time##79432 |goto 24.52,52.19
accept Seeking Expert Advice##79433 |goto 24.52,52.19
step
talk Moratari##216594
turnin Seeking Expert Advice##79433 |goto 25.69,51.59
accept Weave It To Me##79434 |goto 25.69,51.59
accept Knot My Problem##79437 |goto 25.69,51.59
stickystart "Collect_Threads_of_Time"
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 22.95,55.44 |count 1
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 22.44,50.36 |count 2
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 20.97,45.10 |count 3
step
label "Collect_Threads_of_Time"
kill Infinite Ravager##218346+
|tip They look like dragonkin.
Collect #3# Threads of Time |q 79434/1 |goto 22.42,51.02
'|kill Infinite Ravager##217557
step
talk Moratari##216594
turnin Weave It To Me##79434 |goto 25.71,51.60
turnin Knot My Problem##79437 |goto 25.71,51.60
accept What's Hours Is Yours##79435 |goto 25.71,51.60
step
talk Horos##217051
buy Chronobadge##215438 |q 79435/1 |goto 25.46,53.86
step
talk Momentus##217668
Ask him _"Can you forge this thread and chronobadge into a cloak?"_ |gossip 1
Watch the dialogue
Ask Momentus to Forge your Artifact |q 79435/2 |goto 24.98,52.89
step
talk Moratari##216594
turnin What's Hours Is Yours##79435 |goto 25.69,51.57
accept Cloak and Needle##80380 |goto 25.69,51.57
step
Equip the Cloak of Infinite Potential |q 80380/1
'|equipped Cloak of Infinite Potential##210333
step
kill Infinite Ravager##218346+
|tip They look like dragonkin.
collect Thread of Power##210982 |q 80380/2 |goto 22.42,51.02
'|kill Infinite Ravager##217557
step
talk Moratari##216594
turnin Cloak and Needle##80380 |goto 25.69,51.59
accept Goodbyes Are Hard When You Live Forever##79438 |goto 25.69,51.59
step
kill Eratus, the Unwoven Paradox##220821 |q 79438/1 |goto 25.86,58.17
step
talk Moratari##218129
turnin Goodbyes Are Hard When You Live Forever##79438 |goto 26.46,54.24
accept Recalling the War##79440 |goto 26.46,54.24
step
talk Eternus##217538
Ask her _"What events led the Horde to Pandaria?"_ |gossip 1
Speak to Eternus About Recent Events |q 79440/1 |goto 25.99,53.92
step
talk Eternus##216591
|tip On the airship.
turnin Recalling the War##79440 |goto The Jade Forest/0 30.85,10.77
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\The Jade Forest (10-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."JadeForest",
next="Leveling Guides\\Pandaria Remix (10-70)\\Valley of the Four Winds (20-70)",
condition_suggested=function() return level >= 10 and level <= 70 and not completedq(29670) end,
pandariaremix=true,
startlevel=10,
endlevel=70,
},[[
step
talk General Nazgrim##55135
|tip Inside the room, on the main deck of the airship.
accept Paint it Red!##31765 |goto The Jade Forest/0 30.78,10.22
step
clicknpc Gunship Turret##66677
|tip On the lower level of the ship.
Enter the Turret |invehicle |goto 31.53,11.01 |q 31765
step
Kill Thunder Hold enemies around this area
|tip They are on the ground to the east.
|tip Use the abilities on your action bar.
Slay #80# Thunder Hold Troops |q 31765/1 |goto 33.03,10.61
kill 9 Thunder Hold Cannons##66203 |q 31765/2 |goto 33.03,10.61
step
talk Rivett Clutchpop##67250
|tip On the lower level of the ship.
turnin Paint it Red!##31765 |goto 31.01,11.02
accept Touching Ground##31766 |goto 31.01,11.02
step
use the Cache of Infinite Treasure##211279+
accept Gems of Power##79489
accept A Scrap of Bronze##78893
step
Shift Right-Click Your Armor and Socket the Chipped Deadly Sapphire |q 79489/1
|tip You can shift + right-click your chest or leg armor.
|tip Follow the on-screen instructions.
step
_Click the Complete Quest Box:_
turnin Gems of Power##79489
accept Extract a Gem##80196
step
Extract a Gem |q 80196/1
|tip Use the Extract Gem ability on the piece of armor you socketed the Chipped Deadly Sapphire into.
|tip It appears as a button on the screen.
step
_Click the Complete Quest Box:_
turnin Extract a Gem##80196
accept Combine Gems##80197
step
use the Chipped Deadly Sapphire##210714+
Combine 3 Chipped Deadly Sapphires |q 80197/1
step
_Click the Complete Quest Box:_
turnin Combine Gems##80197
step
click Unraveling Sands
|tip Use the Unraveling Sands ability.
|tip It appears as a button on the screen.
|tip A small yellow swirling portal will appear.
Scrap the Unraveling Tunic |q 78893/2
|tip Scrap the Unraveling Tunic in the Unraveling Sands box that appears.
step
_Click the Complete Quest Box:_
turnin A Scrap of Bronze##78893
step
click Rappelling Rope##215689
|tip On the lower level of the ship.
Rappel into Honeydew Glade |q 31766/1 |goto 31.51,11.11
step
talk General Nazgrim##55135
|tip He walks around this area.
turnin Touching Ground##31766 |goto 31.64,11.33
accept Finish Them!##31767 |goto 31.64,11.33
accept Fire Is Always the Answer##31768 |goto 31.64,11.33
stickystart "Slay_Thunder_Hold_Troops"
step
use Nazgrim's Flare Gun##89605
|tip Use it near Thunder Hold Munitions.
|tip They look like piles of crates and barrels.
Destroy #10# Thunder Hold Munitions |q 31768/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
step
label "Slay_Thunder_Hold_Troops"
Kill Thunder Hold enemies around this area |kill Thunder Hold Armsman##66348, Thunder Hold Cannoneer##66395, Thunder Hold Infantryman##66285, Thunder Hold Sharp-Shooter##66288, Thunder Hold Mender##66286, Thunder Hold Infantryman##66503, Thunder Hold Armsman##66505
|tip They look like Alliance soldiers.
Slay #15# Thunder Hold Troops |q 31767/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
step
Enter the building |goto 33.67,10.61 < 15 |walk
talk General Nazgrim##66646
|tip Inside the building.
turnin Finish Them!##31767 |goto 34.78,10.63
turnin Fire Is Always the Answer##31768 |goto 34.78,10.63
accept The Final Blow!##31769 |goto 34.78,10.63
step
use Nazgrim's Flare Gun##89769
|tip Inside the building.
Destroy the First Barricade |q 31769/1 |goto 34.01,9.94
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Second Barricade |q 31769/2 |goto 34.73,9.93
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Third Barricade |q 31769/3 |goto 34.94,10.63
step
Watch the dialogue
|tip Outside, on top of the building.
Find Captain Doren |q 31769/4 |goto 33.73,10.61
step
talk General Nazgrim##66656
turnin The Final Blow!##31769 |goto 33.65,10.61
step
Watch the dialogue
talk General Nazgrim##66656
accept You're Either With Us Or...##31770 |goto 33.65,10.61
accept Higher Ground##29694 |goto 33.65,10.61
step
talk Taran Zhu##66657
accept Face to Face With Consequence##31771 |goto 33.71,10.61
step
talk Ellie Honeypaw##66660
accept Priorities!##31772 |goto 30.55,7.14
step
talk Rivett Clutchpop##55146
Tell him _"Quit messing around and use your knife! Nazgrim wants you to report to the village immediately."_ |gossip 1
Rescue Rivett Clutchpop |q 29694/2 |goto 30.53,7.21
step
talk Sue-Ji the Tender##66659
accept Prowler Problems##31773 |goto 30.53,7.49
stickystart "Kill_Sha_Haunts"
step
kill 7 Sha Harbinger##66424 |q 31771/2 |goto 33.56,7.31 |kill Sha Harbinger##66426
|tip They look like larger aliens.
You can find more around [33.75,12.76]
step
label "Kill_Sha_Haunts"
kill 20 Sha Haunt##66425 |q 31771/1 |goto 33.56,7.31
|tip They look like smaller aliens.
You can find more around [33.75,12.76]
stickystart "Find_Barrels_of_Honeybrew"
stickystart "Kill_Sha-Infested_Prowlers"
step
talk Shokia##55170
Tell her _"On your feet! Nazgrim is organizing a counter-attack. We're regrouping in the village."_ |gossip 1
Rescue Shokia |q 29694/4 |goto 29.43,8.48
step
talk Sergeant Gorrok##55162
Tell him _"We need to regroup. Sergeant! Go to the nearby village."_ |gossip 1
Rescue Sergeant Gorrok |q 29694/3 |goto 30.58,11.65
step
talk Shademaster Kiryn##55141
Tell her _"Snap out of it! You're alive! Nazgrim has ordered us to report to the nearby village."_ |gossip 1
Rescue Shademaster Kiryn |q 29694/1 |goto 32.06,13.35
step
label "Find_Barrels_of_Honeybrew"
click Barrel of Honeybrew##215695+
|tip They look like grey and yellow barrels.
Find #6# Barrels of Honeybrew |q 31772/1 |goto 31.11,12.42
You can find more around [29.06,9.38]
step
label "Kill_Sha-Infested_Prowlers"
kill 10 Sha-Infested Prowler##66668 |q 31773/1 |goto 31.11,12.42
|tip They look like black tigers.
You can find more around [29.06,9.38]
step
talk Ellie Honeypaw##66848
turnin Priorities!##31772 |goto 29.38,13.58
step
talk Sergeant Gorrok##66845
turnin Regroup!##29694 |goto 29.13,13.72
step
talk Mayor Honeydew##66220
turnin You're Either With Us Or...##31770 |goto 29.18,13.79
step
talk Taran Zhu##66657
turnin Face to Face With Consequence##31771 |goto 29.13,13.84
turnin Prowler Problems##31773 |goto 29.13,13.84
step
talk Sergeant Gorrok##66845
accept Seeking Zin'jun##31774 |goto 29.13,13.72
step
talk Brewmother Kiki##66236
|tip Inside the building.
accept Home Is Where the Hearthstone Is##81638 |goto 28.51,13.34
step
talk Brewmother Kiki##66236
|tip Inside the building.
home Honeydew Village |goto 28.51,13.34 |q 31241 |future
step
talk Moratari##218468
accept Dragonriding##80012 |goto 28.52,14.01 |noautoaccept
|tip You can choose to skip this, if you've already unlocked dragonriding previously, and don't want to do the dragonriding tutorial.
step
Learn Your New Dragonriding Mount from Your Inventory |q 80012/2
step
click Portal to the Windward Isle
Take Moratari's Portal |q 80012/1 |goto 28.58,14.04
step
talk Lord Andestrasz##218469
Tell him _" Tell me about dragonriding."_ |gossip 1
Speak to Lord Andestrasz about Dragonriding |q 80012/4 |goto 65.28,37.18
step
talk Lord Andestrasz##218469
turnin Dragonriding##80012 |goto 65.28,37.18
accept How to Glide with Your Dragon##80013 |goto 65.28,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Mount Your Drake from Your Collection |q 80013/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #5# Rings |q 80013/2 |goto 66.73,33.55
step
Land in the Target Area |q 80013/3 |goto 66.73,33.55
|tip On top of the grassy area.
step
talk Celormu##183141
|tip On top of the grassy area.
turnin How to Glide with Your Dragon##80013 |goto 66.75,33.37
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80015 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept How To Dive with Your Dragon##80015 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80015/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #7# Rings |q 80015/2 |goto 66.28,49.30
step
Land in the Target Area |q 80015/3 |goto 66.28,49.30
step
talk Celormu##183141
turnin How To Dive with Your Dragon##80015 |goto 66.25,49.50
step
Return to the Lord Andestrasz |goto 65.11,37.32 < 30 |c |noway |q 80016 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept The Need For Higher Velocities##80016 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80016/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #6# Rings |q 80016/2 |goto 64.93,24.34
step
Land in the Target Area |q 80016/3 |goto 64.93,24.34
|tip On top of the large grassy rock pillar.
step
talk Celormu##183141
|tip On top of the large grassy rock pillar.
turnin The Need For Higher Velocities##80016 |goto 64.98,24.26
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80017 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept The Need For Higher Altitudes##80017 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80017/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #6# Rings |q 80017/2 |goto 62.60,28.68
step
Land in the Target Area |q 80017/3 |goto 62.60,28.68
|tip On top of the large grassy rock pillar.
step
talk Celormu##183141
|tip On top of the large grassy rock pillar.
turnin The Need For Higher Altitudes##80017 |goto 62.47,28.65
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80018 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept Fashionable Flying##80018 |goto 65.27,37.18
step
click Rostrum of Transformation
Use the Rostrum of Transformation |q 80018/1 |goto 65.05,36.99
step
talk Lord Andestrasz##218469
turnin Fashionable Flying##80018 |goto 65.28,37.18
step
talk Lord Andestrasz##218469
accept Time to Return##80349 |goto 65.28,37.18
step
talk Moratari##218468
turnin Time to Return##80349 |goto 28.52,14.01
step
talk Wing Hya##66227
fpath Honeydew Village |goto 28.10,15.62
step
talk Zin'Jun##55403
turnin Seeking Zin'jun##31774 |goto 31.14,17.53
accept Cryin' My Eyes Out##29765 |goto 31.14,17.53
step
click Ancient Statue##212181
accept Monstrosity##29743 |goto 30.89,17.49
stickystart "Collect_Zin_Juns_Items"
step
click Ancient Statue Torso##212182
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Torso |q 29743/1 |goto 29.36,18.90
step
click Ancient Statue Arm##212183
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Arm |q 29743/2 |goto 30.12,21.35
step
click Ancient Statue Head##212186
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Head |q 29743/4 |goto 29.95,22.37
step
click Ancient Statue Shoulder##212184
Choose _<Create a sketch of the statue piece.>_ |gossip 1
Sketch the Statue Shoulder |q 29743/3 |goto 28.58,22.16
step
_Click the Complete Quest Box:_
turnin Monstrosity##29743
step
label "Collect_Zin_Juns_Items"
kill Hozen Groundpounder##55470+
|tip They look like monkeys.
collect Zin'Jun's Rifle##74160 |q 29765/1 |goto 29.79,20.83
collect Zin'Jun's Left Eye##74161 |q 29765/2 |goto 29.79,20.83
collect Zin'Jun's Right Eye##74162 |q 29765/3 |goto 29.79,20.83
collect Snuff's Corpse##74163 |q 29765/4 |goto 29.79,20.83
step
_Next to you:_
talk Zin'Jun##55403
turnin Cryin' My Eyes Out##29765
accept Seein' Red##29804
step
kill Konk##55509 |q 29804/1 |goto 31.94,22.20
|tip Inside the small cave.
step
talk General Nazgrim##66656
|tip He runs to this location.
turnin Seein' Red##29804 |goto 31.66,21.91
accept Assault on the Airstrip##31775 |goto 31.66,21.91
accept Strongarm Tactics##31776 |goto 31.66,21.91
step
talk Merchant Zin##65998
accept Unreliable Allies##31778 |goto 31.41,21.76
step
talk Rivett Clutchpop##55521
accept Choppertunity##31777 |goto 31.14,21.58
stickystart "Free_Pandaren"
stickystart "Slay_Strongarm_Troops"
step
kill Master Engineer Cogswing##65882 |q 31776/1 |goto 30.33,24.26
kill Gyro-Mechanic Lavenderp##65883 |q 31776/2 |goto 30.33,24.26
step
kill Morgus Grimhatchet##65880 |q 31776/3 |goto 29.66,23.11
|tip He walks around the area.
step
kill Corporal Jackson Silver##65881 |q 31776/4 |goto 27.78,22.92
|tip Inside the tower, on the ground floor.
step
click Requisitioned Firework Launcher##214962+
|tip They look like small bronze dragon-shaped rocket launchers.
collect Requisitioned Firework Launcher##89163+ |n
use the Requisitioned Firework Launcher##89163+
|tip Use them on Strongarm Gyrocopters.
|tip They look like helicopters flying in the air.
Shoot Down #12# Strongarm Gyrocopters |q 31777/1 |goto 27.21,24.11
'|kill Strongarm Gyrocopter##65843
step
label "Free_Pandaren"
talk Pandaren Volunteer##67090+ |talk Pandaren Volunteer##65974, Pandaren Volunteer##65974, Pandaren Volunteer##67090
|tip They look like friendly panda people.
Tell them _"You can go home now. I'll cover your back."_ |gossip 1
Free #12# Pandaren |q 31778/1 |goto 28.83,23.97
step
label "Slay_Strongarm_Troops"
Kill Strongarm enemies around this area |kill Strongarm Laborer##65906, Strongarm Lieutenant##65905, Strongarm Ace##66000, Strongarm Ace##66000
|tip They look like Alliance soldiers.
Slay #15# Strongarm Troops |q 31775/1 |goto 28.83,23.97
'|kill Strongarm Private##65841, Strongarm Ace##66000, Strongarm Medic##65842, Strongarm Lieutenant##65905
step
talk Rivett Clutchpop##55521
turnin Choppertunity##31777 |goto 31.14,21.58
step
talk Merchant Zin##65998
turnin Unreliable Allies##31778 |goto 31.41,21.76
step
talk General Nazgrim##66656
turnin Assault on the Airstrip##31775 |goto 31.66,21.91
turnin Strongarm Tactics##31776 |goto 31.66,21.91
accept The Darkness Within##31779 |goto 31.66,21.91
step
Cross the bridge |goto 27.35,25.11 < 15 |only if walking
kill Captain Doren##66052 |q 31779/1 |goto 25.75,23.64
|tip Inside the small cave.
step
click Flagpole##215844
turnin The Darkness Within##31779 |goto 27.57,24.28
accept Nazgrim's Command##31999 |goto 27.57,24.28
step
talk General Nazgrim##55172
turnin Nazgrim's Command##31999 |goto 28.42,24.94
step
talk Shademaster Kiryn##55180
accept Forensic Science##29815 |goto 28.19,24.82
step
talk Rivett Clutchpop##55521
accept Missed Me By... That Much!##29821 |goto 28.10,24.70
step
clicknpc Empty Package##62923
turnin Missed Me By... That Much!##29821 |goto 22.87,30.59
accept They're So Thorny!##31112 |goto 22.87,30.59
stickystart "Collect_Emergency_Supplies"
step
clicknpc Lurching Blossom##55610+
|tip They look like blue and green plants that move.
|tip You can do this while mounted.
collect 8 Viscous Chlorophyll##74621 |q 29815/1 |goto 25.63,26.77
step
label "Collect_Emergency_Supplies"
kill Water Sprite##62930+
|tip They look like blue imps.
collect 5 Emergency Supplies##74623 |q 31112/1 |goto 25.99,26.20
step
talk Rivett Clutchpop##55521
turnin They're So Thorny!##31112 |goto 28.10,24.70
step
talk Shademaster Kiryn##55180
turnin Forensic Science##29815 |goto 28.19,24.82
accept Acid Rain##29827 |goto 28.19,24.82
step
clicknpc Recovered Gyrocopter##55674
Fly With the Gyrocopter |invehicle |goto 28.07,24.78 |q 29827
|nomovieskip
step
_As You Fly:_
kill 25 Hozen Gutripper##55707 |q 29827/1 |goto 28.67,27.39
kill 25 Hozen Nibstabber##55701 |q 29827/2 |goto 28.67,27.39
|tip They look like monkeys.
|tip Use the abilities on your action bar.
|nomovieskip
step
talk Shademaster Kiryn##55180
turnin Acid Rain##29827 |goto 28.19,24.82
step
talk General Nazgrim##55172
accept Lay of the Land##29822 |goto 28.42,24.94
step
Visit the Shrine of the Sun |q 29822/1 |goto 31.91,27.95
step
kill Dook Ookem##55622 |q 29822/3 |goto 27.81,30.31
step
Visit the Shrine of the Moon |q 29822/2 |goto 26.23,32.30
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Lay of the Land##29822 |goto 27.59,32.69
accept Stay a While, and Listen##31121 |goto 27.59,32.69
step
click Cho's Teapot
|tip Inside the small cave.
Watch the dialogue
Listen to Lorewalker Cho |q 31121/1 |goto 27.67,32.56
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Stay a While, and Listen##31121 |goto 27.59,32.69
accept A Mile in My Shoes##31132 |goto 27.59,32.69
step
talk Lorewalker Cho##63217
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
turnin A Mile in My Shoes##31132 |goto 30.84,34.06
accept If These Stones Could Speak##31134 |goto 30.84,34.06
step
click Stone Monolith
Translate the First Stone Monolith |q 31134/1 |goto 30.88,33.70
step
click Stone Monolith
kill Bloodthirsty Saurok##63279
Translate the Second Stone Monolith |q 31134/2 |goto 30.64,33.78
step
click Stone Monolith
Translate the Third Stone Monolith |q 31134/3 |goto 30.59,34.14
step
talk Lorewalker Cho##63217
turnin If These Stones Could Speak##31134 |goto 30.84,34.06
accept Peering Into the Past##31152 |goto 30.84,34.06
step
Watch the dialogue
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
Escort Lorewalker Cho to the Circle of Stone |q 31152/1 |goto 28.83,32.55
step
talk Lorewalker Cho##63307
turnin Peering Into the Past##31152 |goto 28.82,32.62
accept Family Tree##31167 |goto 28.82,32.62
step
click Incense Bundle##245682
Light the Incense |q 31167/1 |goto 28.79,32.48
step
talk Lorewalker Cho##63307
turnin Family Tree##31167 |goto 28.82,32.62
accept Swallowed Whole##29879 |goto 28.82,32.62
stickystart "Kill_Engorged_Crocolisks"
step
clicknpc Speckled Trout##56180+
|tip They look like small grey fish.
|tip Underwater.
collect 5 Speckled Trout##75202 |q 29879/2 |goto 22.94,35.02
step
label "Kill_Engorged_Crocolisks"
kill 5 Engorged Crocolisk##56183 |q 29879/1 |goto 22.94,35.02
|tip Underwater. |notinsticky
step
talk Tooki Tooki##56313
turnin Swallowed Whole##29879 |goto 26.28,37.33
accept Orders are Orders##29935 |goto 26.28,37.33
step
talk Bo Bo##56351
accept The Bees' Knees##29933 |goto 25.88,37.99
step
talk Nibi Nibi##56327
accept Kill Kher Shan##29924 |goto 25.96,38.73
step
talk Jeek Jeek##63748
accept Wicked Wikkets##31241 |goto 28.18,38.97
step
kill Kher Shan##56329 |q 29924/1 |goto 33.35,41.65
|tip Inside the small cave.
step
_Click the Complete Quest Box:_
turnin Kill Kher Shan##29924
stickystart "Collect_Alliance_Service_Medallions"
step
kill Jack Arrow##63809
|tip Attack him from behind and he won't hurt you.
|tip Avoid the pink circles on the ground.
collect Captain Jack's Head##85783 |n
use Captain Jack's Head##85783
accept Captain Jack's Dead##31261 |goto 30.82,41.27
step
label "Collect_Alliance_Service_Medallions"
kill Battleworn Paratrooper##63782+
|tip They look like Alliance solders.
collect 6 Alliance Service Medallion##85784 |q 31241/1 |goto 30.82,40.78
step
kill Tigerfly##56283+
|tip They look like yellow flying insects.
collect 30 Bug Leg##76173 |q 29933/1 |goto 29.43,44.67
You can find more around [31.51,45.57]
step
talk Chief Kah Kah##56336
turnin Orders are Orders##29935 |goto 27.99,47.20
accept Instant Messaging##29936 |goto 27.99,47.20
turnin The Bees' Knees##29933 |goto 27.99,47.20
turnin Captain Jack's Dead##31261 |goto 27.99,47.20
turnin Wicked Wikkets##31241 |goto 27.99,47.20
step
talk Grookin Bed-Haver##62975
|tip Inside the building.
home Grookin Hill |goto 27.99,47.43 |q 30015 |future
step
clicknpc Signal Flare##56413
Signal the Survivors |q 29936/1 |goto 27.98,46.79
step
talk General Nazgrim##56339
turnin Instant Messaging##29936 |goto 28.26,47.78
accept Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Grookin Flapmaster##60952
fpath Grookin Hill |goto 27.82,47.90
step
talk Shokia##56340
Tell her _"Nazgrim has assigned you to scout the region, Shokia. You are to depart shortly."_ |gossip 1
Dispatch Shokia |q 29941/1 |goto 28.35,46.97
step
talk Chief Kah Kah##56336
Tell him _"Big Chief Kah Kah, we will be exploring your lands and could use a good guide. Will you help us?"_ |gossip 1
Parlay with Kah Kah |q 29941/4 |goto 27.99,47.20
step
talk Shademaster Kiryn##56478
Tell her _"Nazgrim has assigned you to the scouting party, Kiryn. You are to depart shortly."_ |gossip 1
Dispatch Shademaster Kiryn |q 29941/3 |goto 27.10,48.98
step
talk Sergeant Gorrok##56477
|tip He walks around this area.
Tell him _"Nazgrim has assigned you to help scout the region, Gorrok. You are to depart shortly."_ |gossip 1
Dispatch Sergeant Gorrok |q 29941/2 |goto 27.63,50.48
step
talk General Nazgrim##56339
turnin Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Rivett Clutchpop##56406
accept Furious Fowl##29937 |goto 28.30,47.79
step
talk Chief Kah Kah##56336
accept What's in a Name Name?##31239 |goto 27.99,47.20
step
kill 7 Riverstride Jinyu##56289+ |q 31239/1 |goto 28.79,46.01
|tip They look like fish people.
You can find more around [31.08,47.16]
step
kill Hungry Bloodtalon##56396+
|tip They look like brown birds.
collect 6 Fistful of Bird Guts##76225 |q 29937/1 |goto 30.51,50.99
You can find more around [27.91,52.38]
step
talk Chief Kah Kah##56336
turnin What's in a Name Name##31239 |goto 27.99,47.20
step
talk Rivett Clutchpop##56406
turnin Furious Fowl##29937 |goto 27.23,50.78
accept Easy Pickings##29939 |goto 27.23,50.78
step
talk Eekle Eekle##56358
accept Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
stickystart "Collect_Snapper_Steaks"
step
use the Gut Bomb##76262
|tip Use it to throw a bomb into the water.
click Dead Deepriver Slicky##209877+
|tip They look like small dead fish that appear in the water.
collect 5 Exploded Slicky##76260 |q 29939/1 |goto 26.71,55.39
step
label "Collect_Snapper_Steaks"
kill Muck Snapper##56447+
|tip They look like turtles.
|tip Underwater. |notinsticky
collect 4 Snapper Steak##76420+ |q 29942/1 |goto 26.88,55.92
step
talk Eekle Eekle##56358
turnin Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
step
talk Rivett Clutchpop##56406
turnin Easy Pickings##29939 |goto 27.23,50.78
accept The Scouts Return##29971 |goto 27.23,50.78
step
talk Shokia##55647
turnin The Scouts Return##29971 |goto 28.64,47.37
step
talk Riko##55648
accept Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
click STAY OUT - NO VISITORS##209615
Inspect the Warning Sign |q 29730/1 |goto 38.30,45.39
step
clicknpc Lifelike Jade Statue##55378
|tip They look like small green Pandaren statues on the ground around this area.
Inspect a Lifelike Jade Statue |q 29730/2 |goto 38.85,45.92
step
Watch the dialogue
talk Widow Greenpaw##55381
Tell her _"I am an orc, ma'am. Would you mind if I asked you a few questions?"_ |gossip 1
Speak with Widow Greenpaw |q 29730/3 |goto 39.24,46.21
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29730
step
talk Riko##55648
turnin Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
talk Shademaster Kiryn##55646
accept Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
Watch the dialogue
|tip Use the "Smoke Bomb" ability on your action bar to mark enemies for Shokia to kill.
Search the Serpent's Spine for Signs of Life |q 29731/1 |goto 48.59,60.11
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29731
step
talk Shademaster Kiryn##55646
turnin Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
talk Riko##55648
accept Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shademaster Kiryn##55688
Tell her _"Never! Riko protect you to death!"_ |gossip 1
Kill the enemies that attack in waves
|tip Use the abilities on your action bar.
kill Alliance Scout##55693
Listen to Riko's Report |q 29823/1 |goto The Jade Forest 49.82,70.51
'|kill Ambushing Jinyu##55692
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29823
step
talk Riko##55648
turnin Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shokia##55647
accept Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
click Sniper Rifle##209621 |goto 62.56,82.15
Control the Sniper Rifle |goto 58.82,81.19 < 5 |noway |c |q 29824
step
Watch the dialogue
|tip Right-click enemies to shoot them.
|tip Shademaster Kiryn will plant 3 poison barrels, shoot them.
|tip Then you'll have to kill more waves of enemies again.
|tip Protect Shademaster Kiryn and Riko.
Escort Shademaster Kiryn Through the Camp |q 29824/1
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29824
step
talk Shokia##55647
turnin Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
talk General Nazgrim##56339
accept Guerrillas in our Midst##29943 |goto 28.67,47.53
stickystart "Kill_Alliance_Infiltrators"
step
talk Rivett Clutchpop##56406
accept Green-ish Energy##29968 |goto 30.79,52.26
step
click Green Branch##209903+
|tip They look like brown logs.
collect 7 Green Branch##76333 |q 29968/1 |goto 30.58,52.63
step
label "Kill_Alliance_Infiltrators"
kill 8 Alliance Infiltrator##56303 |q 29943/1 |goto 30.47,51.64
|tip They look like humans stealthed around this area.
step
_Next to you:_
talk General Nazgrim##56490
turnin Guerrillas in our Midst##29943
accept Burning Down the House##29966
step
use Nazgrim's Grog##76336
|tip Up on the mountain.
Destroy the Alliance Camp |q 29966/1 |goto 29.44,54.20
step
talk Rivett Clutchpop##56406
turnin Green-ish Energy##29968 |goto 27.23,50.78
accept Boom Goes the Doonamite!##29967 |goto 27.23,50.78
step
talk Rivett Clutchpop##56525
Speak to Rivett Clutchpop |q 29967/1 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
Tell him _"Okay, Rivett. I'm ready!"_ |gossip 40650
Kill Jinyu enemies around this area
|tip They look like fish people.
|tip Use the "Throw Methane Bomb" on your action bar.
|tip If they get too close and knock you out, talk to Rivett again.
Slay #10# Jinyu Attackers |q 29967/2 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
turnin Boom Goes the Doonamite!##29967 |goto 28.98,49.08
step
talk General Nazgrim##56339
turnin Burning Down the House##29966 |goto 28.67,47.53
accept Dawn's Blossom##30015 |goto 28.67,47.53
step
talk Grookin Flapmaster##60952
Tell him _"Send me to Dawn's Blossom."_ |gossip 1
Begin Flying to Dawn's Blossom |invehicle |goto 27.82,47.90 |q 30015
step
Fly to Dawn's Blossom |outvehicle |goto 47.03,46.16 |q 30015 |notravel
step
talk Keg Runner Lee##59186
fpath Dawn's Blossom |goto 47.05,46.24
step
talk Lorewalker Cho##63577
turnin Dawn's Blossom##30015 |goto 46.82,46.14
step
Watch the dialogue
talk Toya##56348
accept Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
Speak with Kai Wanderbrew |q 31230/3 |goto 46.72,45.81
step
talk Peiji Goldendraft##55809
|tip Inside the building.
Speak with Peiji Goldendraft |q 31230/2 |goto 45.72,43.70
step
talk Peiji Goldendraft##55809
|tip Inside the building.
home The Drunken Hozen |goto 45.72,43.70 |q 29670 |future
step
talk Master Windfur##59160
|tip Inside the building.
Speak with Master Windfur |q 31230/1 |goto 48.49,44.49
step
talk Toya##56348
turnin Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk An Windfur##55413
|tip She walks around this area.
accept The Double Hozu Dare##29716 |goto 46.65,46.15
step
talk Tzu the Ironbelly##56062
accept The Silkwood Road##29865 |goto 46.46,45.80
step
talk Lo Wanderbrew##59178
accept The Threads that Stick##29866 |goto 46.63,45.31
stickystart "Kill_Silkwood_Stalkers"
step
click Silk Patch##209951+
|tip They look like white spider eggs.
collect 7 Pristine Silk Strand##75023 |q 29866/1 |goto 43.76,49.30
step
label "Kill_Silkwood_Stalkers"
kill 8 Silkwood Stalker##56070 |q 29865/1 |goto 43.76,49.30
|tip They look like spiders.
step
talk An Windfur##55274
|tip She appears next to you.
accept Down Kitty!##29717 |goto 37.83,45.03
stickystart "Kill_Jade_Guardians"
step
clicknpc Scared Pandaren Cub##55267+
|tip They look like panda children clinging to trees low to the ground.
Tell them _"It's safe now. You can come down."_ |gossip 1
Rescue #6# Cubs |q 29716/1 |goto 38.12,45.49
step
label "Kill_Jade_Guardians"
kill 8 Jade Guardian##55236 |q 29717/1 |goto 38.12,45.49
|tip They look like green cougars.
step
_Next to you:_
talk An Windfur##55234
turnin The Double Hozu Dare##29716
turnin Down Kitty!##29717
accept The Jade Witch##29723
step
talk Widow Greenpaw##55368
|tip If someone else already talked to her, she will be behind the building.
Ask her _"Where is Shin?"_ |gossip 1
Watch the dialogue
|tip Follow Widow Greenpaw as she walks.
kill Widow Greenpaw##55368
Confront the Jade Witch |q 29723/1 |goto 39.34,46.22
step
talk Tzu the Ironbelly##56062
turnin The Silkwood Road##29865 |goto 46.46,45.80
step
talk An Windfur##55413
|tip She runs along the path all around in this village.
turnin The Jade Witch##29723 |goto 46.49,45.75
step
talk Toya##56348
accept All We Can Spare##29925 |goto 47.16,46.17
step
talk Lo Wanderbrew##59178
turnin The Threads that Stick##29866 |goto 46.63,45.31
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
accept Find the Boy##29993 |goto 47.05,46.01
step
talk Old Man Misteye##59383
accept An Air of Worry##29576 |goto 48.32,46.06
step
talk Apprentice Yufi##54998
accept Tian Monastery##29617 |goto 49.65,45.83
step
talk Inkmaster Wei##56065
|tip He walks around this area.
turnin Find the Boy##29993 |goto 55.00,44.87
accept Shrine of the Dawn##29995 |goto 55.00,44.87
step
talk Inkmaster Glenzu##56064
accept The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
accept Quill of Stingers##29882 |goto 55.40,45.28
step
talk Injar'i Lakebloom##59732
fpath The Arboretum |goto 57.01,44.03
step
talk Elder Anli##58564
accept Wild Things##30134 |goto 57.64,44.95
stickystart "Collect_Freshly_Fallen_Petals"
step
kill Orchard Wasp##56201+
|tip They look like large flying insects.
collect 6 Wasp Stinger##75221 |q 29882/1 |goto 53.6,44.5
step
label "Collect_Freshly_Fallen_Petals"
click Freshly Fallen Petals##209836+
|tip They look like small red flowers.
collect 8 Freshly Fallen Petals##75219 |q 29881/1 |goto 54.10,45.35
step
talk Inkmaster Glenzu##56064
turnin The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
|tip He walks around this area.
turnin Quill of Stingers##29882 |goto 55.27,45.23
step
talk Syra Goldendraft##56708
turnin Shrine of the Dawn##29995 |goto 52.57,38.12
accept Getting Permission##29920 |goto 52.57,38.12
step
talk Pandriarch Bramblestaff##56209
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Bramblestaff##56209
|tip He will eventually surrender.
Defeat Pandriarch Bramblestaff |q 29920/2 |goto 54.09,38.46
step
talk Pandriarch Goldendraft##56210
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Goldendraft##56210
|tip He will eventually surrender.
Defeat Pandriarch Goldendraft |q 29920/3 |goto 53.59,36.73
step
talk Pandriarch Windfur##56206
Choose _"Challenge the Pandriarch."_ |gossip 1
kill Pandriarch Windfur##56206
|tip He will eventually surrender.
Defeat Pandriarch Windfur |q 29920/1 |goto 52.54,35.57
step
talk Lo Wanderbrew##55788
turnin Getting Permission##29920 |goto 52.59,38.12
step
talk Lorewalker Cho##56345
turnin All We Can Spare##29925 |goto 50.91,27.08
step
talk Foreman Mann##56346
accept I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
talk Supplier Towsa##59735
fpath Emperor's Omen |goto 50.82,26.80
step
kill Puckish Sprite##56349+
|tip They look like small green imps.
click Chunk of Jade##209863+
|tip They look like green rocks that appear on the ground after you kill sprites.
collect 15 Chunk of Jade##76209 |q 29928/1 |goto 48.33,31.10
step
talk Foreman Mann##56346
turnin I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept Calamity Jade##29926 |goto 50.94,27.03
accept Mann's Man##29927 |goto 50.94,27.03
step
clicknpc Outcast Sprite##55438
accept The Sprites' Plight##29745 |goto 48.67,24.93
stickystart "Kill_Stonebound_Destroyers"
step
Find the Source of the Simulacra |q 29745/2 |goto 48.61,20.26
step
label "Kill_Stonebound_Destroyers"
kill 10 Stonebound Destroyer##55288 |q 29745/1 |goto 48.80,21.60
|tip They look like brown bulky humanoids.
step
_Click the Complete Quest Box:_
turnin The Sprites' Plight##29745
accept Break the Cycle##29747
step
click Shattered Destroyer##214871
accept Simulacrumble##29748 |goto 48.57,20.62
stickystart "Kill_Shanze_Spiritbinders"
step
click Vacant Destroyer##214873+
|tip They look like stone orc-like statues holding weapons.
Kick #6# Vacant Destroyers |q 29748/1 |goto 48.07,17.12
step
_Click the Complete Quest Box:_
turnin Simulacrumble##29748
step
label "Kill_Shanze_Spiritbinders"
kill 8 Shan'ze Spiritbinder##55279 |q 29747/1 |goto 48.07,17.12
|tip They look like grey bulky humanoids.
step
_Click the Complete Quest Box:_
turnin Break the Cycle##29747
accept An Urgent Plea##29749
step
click Staff of Pei-Zhi##209662
collect Staff of Pei-Zhi##74258 |q 29749/1 |goto 44.23,14.91
step
kill Ancient Spirit##55489+
|tip Try to kill them before they reach the swirling purple orb.
|tip Kill them until the bar at the bottom of your screen fills up.
|tip When the bar reaches about half full, regular enemies will attack you.
Interrupt the Ritual of Spiritbinding |q 29749/2 |goto 44.36,15.35
step
Watch the dialogue
talk Pei-Zhi##55614
turnin An Urgent Plea##29749 |goto 44.23,15.03
accept Ritual Artifacts##29751 |goto 44.23,15.03
accept Vessels of the Spirit##29750 |goto 44.23,15.03
accept The Wayward Dead##29752 |goto 44.23,15.03
stickystart "Collect_Spirit_Bottles"
stickystart "Recover_Wayward_Ancestors"
step
click Jade Cong##209699
collect Jade Cong##74762 |q 29751/1 |goto 42.68,15.76
step
click Pungent Ritual Candle##209701
collect Pungent Ritual Candle##74761 |q 29751/3 |goto 42.26,17.09
step
click Chipped Ritual Bowl##209700
collect Chipped Ritual Bowl##74760 |q 29751/2 |goto 41.62,14.32
step
label "Collect_Spirit_Bottles"
kill Shan'ze Spiritclaw##55291+
|tip They look like bulky humanoids with purple glowing weapons.
collect 8 Spirit Bottle##74763 |q 29750/1 |goto 42.07,15.74
step
label "Recover_Wayward_Ancestors"
use the Staff of Pei-Zhi##74771
|tip Use it on Wayward Ancestors.
|tip They look like banshees.
Recover #10# Wayward Ancestors |q 29752/1 |goto 42.07,15.74
step
talk Pei-Zhi##55614
turnin Ritual Artifacts##29751 |goto 44.23,15.03
turnin Vessels of the Spirit##29750 |goto 44.23,15.03
turnin The Wayward Dead##29752 |goto 44.23,15.03
accept Back to Nature##29753 |goto 44.23,15.03
accept A Humble Offering##29756 |goto 44.23,15.03
stickystart "Collect_Tidemist_Caps"
step
use the Spirit Bottles##74808
|tip You can use it repeatedly in the same location.
kill Raging Beast Spirit##55790+
|tip Some of them will be friendly and run off.
Return #8# Beast Spirits to Nature |q 29753/1 |goto 38.41,10.90
step
label "Collect_Tidemist_Caps"
click Tidemist Cap##209825+
|tip They look like clusters of white mushrooms.
collect 10 Tidemist Cap##75214 |q 29756/1 |goto 39.76,11.48
step
talk Pei-Zhi##55614
turnin Back to Nature##29753 |goto 44.23,15.03
turnin A Humble Offering##29756 |goto 44.23,15.03
accept To Bridge Earth and Sky##29754 |goto 44.23,15.03
step
Watch the dialogue
Kill the enemies that attack in waves
|tip Protect Pei-Zhi until the bar at the bottom of your screen fills up.
Protect Pei-Zhi During His Ritual |q 29754/1 |goto 43.7,12.9
'|kill Shan'ze Spiritclaw##55902
step
_Click the Complete Quest Box:_
turnin To Bridge Earth and Sky##29754
accept Pei-Back##29755
step
kill Stonebound Colossus##56595
|tip He walks around this area.
|tip When your spirit is ripped from your body, click your body at the location you were at to return to your body.
|tip He will regenerate health when you're out-of-body.
kill Shan Jitong##56596 |q 29755/1 |goto 42.52,10.45
|tip He appears while you fight the Stonebound Colossus.
step
talk Pei-Zhi##59492
turnin Pei-Back##29755 |goto 43.84,12.52
step
talk Lin Tenderpaw##54913
|tip Run around the western side of the mountain and follow the road. |only if walking
turnin Tian Monastery##29617 |goto 44.99,24.95
accept The High Elder##29618 |goto 44.99,24.95
step
talk High Elder Cloudfall##54914
|tip Upstairs on the balcony outside the building.
turnin The High Elder##29618 |goto 45.22,25.07
step
talk Lin Tenderpaw##54913
accept A Courteous Guest##29619 |goto 44.99,24.95
step
talk Studious Chu##59736
fpath Tian Monastery |goto 43.58,24.53
step
talk Bolo the Elder##62867
|tip Inside the building.
home Paur's Pub |goto 41.72,23.16
step
kill Greenwood Thief##54930+
|tip They will only drop them if they are carrying oranges.
click Ripe Orange##209436+
|tip They look like small orange balls.
collect 8 Ripe Orange##72589 |q 29619/1 |goto 45.73,27.35
step
Enter the mine |goto 45.86,28.84 < 10 |walk
Locate Hao Mann |q 29927/1 |goto The Jade Forest/6 60.96,36.74
|tip Inside the mine.
step
talk Hao Mann##56347
|tip Inside the mine.
turnin Mann's Man##29927 |goto 60.96,36.74
accept Trapped!##29929 |goto 60.96,36.74
stickystart "Kill_Greenstone_Nibblers"
stickystart "Free_Greenstone_Miners"
step
kill 6 Greenstone Gorger##56404 |q 29926/2 |goto The Jade Forest/0 45.86,28.84
|tip They look like large stone spiders.
|tip Throughout the mine.
step
label "Free_Greenstone_Miners"
talk Greenstone Miner##56464+
|tip They look like pandas inside piles of large rocks.
|tip Throughout the mine. |notinsticky
Free #8# Greenstone Miners |q 29929/1 |goto 45.86,28.84
step
label "Kill_Greenstone_Nibblers"
kill 12 Greenstone Nibbler##56401 |q 29926/1 |goto 45.86,28.84
|tip They look like small stone spiders.
|tip Throughout the mine. |notinsticky
step
Follow the path up and leave the mine |goto 45.86,28.84 < 10 |walk |only if subzone("Greenstone Quarry") and indoors()
talk Hao Mann##56467
turnin Trapped!##29929 |goto 46.30,29.39
accept What's Mined Is Yours##29930 |goto 46.30,29.39
step
clicknpc Jade Cart##56527
Ride in the Jade Cart |invehicle |goto 46.27,29.48 |q 29930
step
Watch the dialogue
Kill the enemies that attack in waves
Deliver the Jade |q 29930/1 |goto 51.21,26.72 |notravel
'|kill Brittle Greenstone Gorger##56543
step
Watch the dialogue
talk Foreman Mann##56346
turnin Calamity Jade##29926 |goto 50.94,27.03
turnin What's Mined Is Yours##29930 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept The Serpent's Heart##29931 |goto 50.94,27.03
step
talk Lin Tenderpaw##54913
turnin A Courteous Guest##29619 |goto 44.99,24.95
accept The Great Banquet##29620 |goto 44.99,24.95
step
talk High Elder Cloudfall##54914
Tell him _"I don't need any introductions, old man. Let's skip ahead to the good part."_
|tip If this dialogue option isn't available, pick the one that's available, and follow him as he walks.
Speak with High Elder Cloudfall |q 29620/1 |goto 42.74,23.17
step
talk High Elder Cloudfall##54914
turnin The Great Banquet##29620 |goto 42.74,23.17
step
Watch the dialogue
talk Xiao##54926
accept Your Training Starts Now##29622 |goto 43.13,23.63
accept Groundskeeper Wu##29626 |goto 43.13,23.63
step
talk Master Stone Fist##54922
accept Becoming Battle-Ready##29632 |goto 43.23,24.75
step
talk Tian Pupil##54944+
Tell them _"Let's fight!"_ |gossip 1
kill Tian Pupil##54944+
|tip They will eventually surrender.
Defeat #8# Monastic Pupils |q 29632/1 |goto 43.73,24.99
step
talk Master Stone Fist##54922
turnin Becoming Battle-Ready##29632 |goto 43.24,24.76
accept Zhi-Zhi, the Dextrous##29633 |goto 43.24,24.76
accept Husshun, the Wizened##29634 |goto 43.24,24.76
step
talk Zhi-Zhi##54924
Ask him _"Wanna fight?"_ |gossip 1
kill Zhi-Zhi##54924
|tip He will eventually surrender.
Defeat Zhi-Zhi |q 29633/1 |goto 43.06,25.99
step
talk Husshun##54925
Tell him _"I challenge you to a fight, Husshun!"_ |gossip 1
kill Husshun##54925
|tip He will eventually surrender.
Defeat Husshun |q 29634/1 |goto 44.56,24.05
step
talk Master Stone Fist##54922
turnin Zhi-Zhi, the Dextrous##29633 |goto 43.24,24.75
turnin Husshun, the Wizened##29634 |goto 43.24,24.75
accept Xiao, the Eater##29635 |goto 43.24,24.75
step
talk Xiao##54926
Tell him _"Put down your fork, and pick up your fists! I challenge you!"_ |gossip 1
kill Xiao##54926
|tip He will eventually surrender.
Defeat Xiao |q 29635/1 |goto 43.13,23.63
step
talk Master Stone Fist##54922
turnin Xiao, the Eater##29635 |goto 43.24,24.75
accept A Test of Endurance##29636 |goto 43.24,24.75
step
talk Groundskeeper Wu##54915
turnin Groundskeeper Wu##29626 |goto 41.62,23.70
accept A Proper Weapon##29627 |goto 41.62,23.70
stickystart "Collect_Rattan_Switches"
step
talk June Whiteblossom##54981
buy Black Walnut Extract##72954 |q 29627/2 |goto 41.39,24.15
step
talk Brewmaster Lei Kanglei##54982
buy 3 Triple-Bittered Ale##72979 |q 29627/3 |goto 41.77,24.61
step
label "Collect_Rattan_Switches"
click Rattan Switch##209464+
|tip They look like thin twigs with leaves at the top of them growing out of the ground around this area.
collect 6 Rattan Switch##72926 |q 29627/1 |goto 41.09,24.78
step
talk Groundskeeper Wu##54915
turnin A Proper Weapon##29627 |goto 41.62,23.70
accept A Strong Back##29628 |goto 41.62,23.70
accept A Steady Hand##29629 |goto 41.62,23.70
accept And a Heavy Fist##29630 |goto 41.62,23.70
step
talk Instructor Myang##54918
turnin A Test of Endurance##29636 |goto 38.97,24.04
accept The Rumpus##29637 |goto 38.97,24.04
step
use the Monastary Fireworks##73369
Kill the enemies that attack in waves
Survive the Melee |q 29637/1 |goto 38.97,23.27
'|kill Rumpus Combatant##55139, Rumpus Brute##55151
step
talk Instructor Myang##54918
turnin The Rumpus##29637 |goto 38.97,24.04
step
talk Guard Shan Long##55094
accept Burning Bright##29631 |goto 38.01,23.80
stickystart "Collect_Blushleaf_Extract"
step
Kill Waxwood enemies around this area
|tip They look like tigers.
Slay #6# Waxwood Hunters |q 29631/1 |goto 35.10,22.10
'|kill Waxwood Matriarch##55238, Waxwood Hunter##54988
step
label "Collect_Blushleaf_Extract"
click Blushleaf Cluster+
|tip They look like small red plants.
|tip Be careful not to move while channeling, or you won't collect all of the extract.
collect 80 Blushleaf Extract##73193 |q 29629/1 |goto 35.1,22.1
step
kill 10 Greenwood Trickster##54987 |q 29630/1 |goto 37.79,20.14
|tip They look like sprites.
step
_NOTE:_
During the Next Few Steps
|tip After collecting the cauldron in the next step, don't mount up.
|tip If you mount up, you will lose the cauldron and have to get another one.
Click Here to Continue |confirm |q 29628
step
click Boiling Cauldron##209551
|tip Inside the building.
Obtain the Boiling Cauldron |q 29628/1 |goto 37.72,17.38
step
talk Guard Shan Long##55094
turnin Burning Bright##29631 |goto 38.0,23.8
step
Return the Boiling Cauldron |q 29628/2 |goto 41.61,23.69
step
talk Groundskeeper Wu##54915
turnin A Strong Back##29628 |goto 41.61,23.69
turnin A Steady Hand##29629 |goto 41.61,23.69
turnin And a Heavy Fist##29630 |goto 41.61,23.69
step
talk Instructor Xann##54917
turnin Your Training Starts Now##29622 |goto 41.60,28.33
accept Perfection##29623 |goto 41.60,28.33
step
Complete #12# Practice Strikes |q 29623/1 |goto 41.40,27.90
|tip Watch the Tian Instructor as he makes motions.
|tip Use the abilities on your action bar to mimic his motions.
step
talk Instructor Xann##54917
turnin Perfection##29623 |goto 41.60,28.33
accept Attention##29624 |goto 41.60,28.33
step
kill 2 Training Bag##55184 |q 29624/1 |goto 41.66,26.97
|tip On each pole around this area, there are 2 punching bags, one to the left of the pole, one to the right.
|tip You will see "LEFT!" and "RIGHT!" messages on your screen.
|tip Attack the bag on whichever side the message says.
step
talk Instructor Xann##54917
turnin Attention##29624 |goto 41.60,28.33
accept Flying Colors##29639 |goto 41.60,28.33
step
talk High Elder Cloudfall##54914
turnin Flying Colors##29639 |goto 42.74,23.17
step
talk Gingo Alebottom##59733
fpath Sri-La Village |goto 55.38,23.73
step
talk Instructor Tong##58225
turnin Wild Things##30134 |goto 65.33,31.65
accept Beating the Odds##30135 |goto 65.33,31.65
accept Empty Nests##30136 |goto 65.33,31.65
accept Egg Collection##30137 |goto 65.33,31.65
stickystart "Slay_Slitherscale_Sauroks"
step
use the Silken Rope##78947
|tip Use it on Windward Hatchlings.
|tip They look like small dragons without wings.
|tip Get 6 of them following you.
|tip You can fly without losing them.
Return #6# Windward Hatchlings to Their Nests |q 30136/1 |goto 64.60,31.26
Bring the Windward Hatchlings to [65.78,31.24]
step
label "Slay_Slitherscale_Sauroks"
kill Slitherscale Eggdrinker##63532+
|tip They look like reptile people.
Slay #8# Slitherscale Sauroks |q 30135/1 |goto 64.60,31.26
step
talk Instructor Tong##58225
turnin Beating the Odds##30135 |goto 65.33,31.65
turnin Empty Nests##30136 |goto 65.33,31.65
step
click Serpent Egg##210240+
|tip They look like blue, orange, and green balls.
collect 6 Serpent Egg##78959 |q 30137/1 |goto 68.03,27.62
step
talk Instructor Tong##58225
turnin Egg Collection##30137 |goto 65.33,31.65
accept Choosing the One##30138 |goto 65.33,31.65
step
talk Instructor Tong##58225
turnin Choosing the One##30138 |goto 65.33,31.65
accept The Rider's Journey##30139 |goto 65.33,31.65 |or
'|accept The Rider's Journey##30140 |goto 65.33,31.65 |or
'|accept The Rider's Journey##30141 |goto 65.33,31.65 |or
step
talk Instructor Skythorn##58228
turnin The Rider's Journey##30139 |goto 57.56,45.10 |only if haveq(30139) or completedq(30139)
turnin The Rider's Journey##30140 |goto 57.56,45.10 |only if haveq(30140) or completedq(30140)
turnin The Rider's Journey##30141 |goto 57.56,45.10 |only if haveq(30141) or completedq(30141)
accept It's A...##30142 |goto 57.56,45.10
step
Watch the dialogue
Witness the Egg Hatch |q 30142/1 |goto 57.45,45.14
step
talk Instructor Skythorn##58228
turnin It's A...##30142 |goto 57.56,45.10
step
talk Foreman Raike##59391
turnin The Serpent's Heart##29931 |goto 48.31,61.35
accept Love's Labor##30495 |goto 48.31,61.35
step
talk Historian Dinh##59395
Tell him _"I've got a new jade shipment for you."_ |gossip 1
Complete the Delivery to Historian Dinh |q 30495/1 |goto 46.36,61.80
step
talk Surveyor Sawa##59401
Tell him _"I've got your jade right here."_ |gossip 1
Complete the Delivery to Surveyor Sawa |q 30495/2 |goto 46.94,60.35
step
talk Kitemaster Shoku##59392
Tell him _"I've got a jade delivery for you."_ |gossip 1
Complete the Delivery to Kitemaster Shoku |q 30495/3 |goto 48.17,60.02
step
talk Kitemaster Shoku##59392
|tip You can skip this step if you are able to fly.
Tell him _"I need a ride to the top of the statue."_ |gossip 1
Begin Riding a Kite to the Top of the Statue |invehicle |goto 48.18,60.02 |q 30495
step
Ride a Kite to the Top of the Statue |outvehicle |goto 47.46,60.58 |q 30495 |notravel
step
talk Taskmaster Emi##59397
|tip On a platform at the top of the statue.
Ask her _"Did someone say they needed jade?"_ |gossip 1
Complete the Delivery to Taskmaster Emi |q 30495/4 |goto 47.58,60.67
step
talk Kitemaster Inga##59400
|tip On a platform at the top of the statue.
|tip You can skip this step if you are able to fly.
Tell her _"I need a ride to the bottom of the statue."_ |gossip 1
Begin Riding a Kite to the Bottom of the Statue |invehicle |goto 47.45,60.51 |q 30495
step
Ride a Kite to the Bottom of the Statue |outvehicle |goto 48.23,60.00 |q 30495 |notravel
step
talk Foreman Raike##59391
turnin Love's Labor##30495 |goto 48.31,61.35
accept The Temple of the Jade Serpent##29932 |goto 48.31,61.35
step
talk Kitemaster Shoku##59392
Tell him _"Take me to the Temple of the Jade Serpent."_ |gossip 2
Begin Flying to the Temple of the Jade Serpent |invehicle |goto 48.18,60.02 |q 29932
step
Fly to the Temple of the Jade Serpent |outvehicle |goto 55.67,57.05 |q 29932 |notravel
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
Tell her _"I have a message for the Jade Serpent."_ |gossip 1
Speak to Elder Sage Wind-Yi |q 29932/1 |goto 55.84,57.07
Also check around [54.99,56.89]
step
Watch the dialogue
talk Elder Sage Rain-Zhu##56782
turnin The Temple of the Jade Serpent##29932 |goto 58.13,58.66
accept The Scryer's Dilemma##29997 |goto 58.13,58.66
accept The Librarian's Quandary##29998 |goto 58.13,58.66
accept They Call Him... Stormstout##32019 |goto 58.13,58.66
step
talk Fei##56784
accept The Rider's Bind##29999 |goto 58.03,59.01
accept Lighting Up the Sky##30005 |goto 58.03,59.01
stickystart "Launch_Fireworks"
step
clicknpc Playful Crimson Serpent##56852
|tip It moves around this small area.
Find the Playful Crimson Serpent |q 29999/2 |goto 58.18,61.39
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin The Librarian's Quandary##29998 |goto 56.26,60.43
accept Moth-Ridden##30001 |goto 56.26,60.43
accept Pages of History##30002 |goto 56.26,60.43
stickystop "Launch_Fireworks"
stickystart "Kill_Dappled_Moths"
stickystart "Squash_Bookworms"
step
clicknpc Playful Gold Serpent##56850
|tip It moves around this small area.
|tip Inside the building.
Find the Playful Gold Serpent |q 29999/4 |goto 56.00,60.32
step
label "Kill_Dappled_Moths"
kill 8 Dappled Moth##57232 |q 30001/1 |goto 56.00,60.32
|tip They look like butterflies.
|tip Inside the building. |notinsticky
step
label "Squash_Bookworms"
click Infested Book##209594+
|tip They look like large green books.
|tip Inside the building. |notinsticky
kill Bookworm##57237+
|tip You can right-click them repeatedly to kill them quickly.
Squash #12# Bookworms |q 30002/1 |goto 56.00,60.32
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin Moth-Ridden##30001 |goto 56.26,60.44
turnin Pages of History##30002 |goto 56.26,60.44
accept Everything In Its Place##30004 |goto 56.26,60.44
step
clicknpc Playful Emerald Serpent##56851
|tip It moves around this small area.
|tip Follow the stairs up and leave the building to find it.
Find the Playful Emerald Serpent |q 29999/3 |goto 56.54,58.38
step
kill Water Fiend##56820+
|tip They look like small water elementals.
|tip Inside the building.
collect Scryer's Staff##76725 |q 29997/1 |goto 57.46,55.98
step
talk Wise Mari##56787
|tip Inside the building.
turnin The Scryer's Dilemma##29997 |goto 57.57,56.03
accept A New Vision##30011 |goto 57.57,56.03
stickystart "Launch_Fireworks"
step
clicknpc Playful Azure Serpent##56853
|tip It moves around this small area.
Find the Playful Azure Serpent |q 29999/1 |goto 59.21,56.73
step
label "Launch_Fireworks"
click Firework Launcher##209672+
|tip They look like metal pots sitting on wooden pallets.
Launch #8# Fireworks |q 30005/1 |goto 57.46,58.50
step
talk Elder Sage Rain-Zhu##56782
turnin A New Vision##30011 |goto 58.14,58.66
turnin Everything In Its Place##30004 |goto 58.14,58.66
step
talk Fei##56784
turnin The Rider's Bind##29999 |goto 58.03,59.01
turnin Lighting Up the Sky##30005 |goto 58.03,59.01
accept The Jade Serpent##30000 |goto 58.03,59.01
step
Watch the dialogue
Listen to the Jade Serpent |q 30000/1
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
turnin The Jade Serpent##30000 |goto 55.84,57.08
accept Get Back Here!##30499 |goto 55.84,57.08
Also check around [54.99,56.89]
step
talk Ginsa Arroweye##59727
fpath Jade Temple Grounds |goto 54.57,61.76
step
talk Ginsa Arroweye##59727
Tell her _"I could use a kite to Grookin' Hill."_ |gossip 1
Begin Flying to Grookin Hill |invehicle |goto 54.57,61.76 |q 30499
step
Fly to Grookin Hill |outvehicle |goto 28.02,46.97 |q 30499 |notravel
step
talk General Nazgrim##57108
turnin Get Back Here!##30499 |goto 28.03,47.19
accept Gauging Our Progress##30484 |goto 28.03,47.19
accept Sufficient Motivation##30466 |goto 28.03,47.19
stickystart "Motivate_Hozen"
step
click Barrel of Slickies##209974
collect Bucket of Slicky Water##79884 |q 30466/2 |goto 28.11,47.39
step
talk Rivett Clutchpop##59305
Tell him _"General Nazgrim needs an update on your progress."_ |gossip 1
collect Rivett Clutchpop's Report##80014 |q 30484/2 |goto 28.41,47.79
step
talk Shademaster Kiryn##56841
Tell her _"General Nazgrim wants an update on your progress."_ |gossip 1
collect Shademaster Kiryn's Report##80013 |q 30484/1 |goto 29.16,50.89
stickystop "Motivate_Hozen"
step
talk Shokia##56838
|tip She walks around this area.
Tell her _"General Nazgrim needs your training report."_ |gossip 1
collect Shokia's Report##80015 |q 30484/3 |goto 28.39,51.93
step
talk Riko##56840
Tell him _"General Nazgrim wants to know the status of the supplies."_ |gossip 1
collect Riko's Report##80061 |q 30484/4 |goto 27.00,54.94
step
label "Motivate_Hozen"
use the Bucket of Slicky Water##79884
|tip Use it on Lazy Hozens.
|tip They look like monkeys sleeping on the ground, or hanging from ropes.
Motivate #10# Hozen |q 30466/1 |goto 27.63,48.80
step
talk General Nazgrim##57108
turnin Gauging Our Progress##30484 |goto 28.03,47.19
turnin Sufficient Motivation##30466 |goto 28.03,47.19
step
talk Lorewalker Cho##59377
accept Last Piece of the Puzzle##30485 |goto 28.22,46.72
step
talk Mishi##64207
Tell him _"I am ready to leave."_ |gossip 1
Begin Flying to Serpent's Overlook |invehicle |goto 28.19,46.72 |q 30485
step
Fly to Serpent's Overlook |outvehicle |goto 44.65,67.24 |q 30485 |notravel
step
talk Sky Dancer Ji##64310
fpath Serpent's Overlook |goto 43.10,68.49
step
use the Cho Family Heirloom##80071
|tip At the top of the mountain.
Watch the dialogue
Place the Heirloom at the Cho Family Shrine |q 30485/1 |goto 44.50,66.93
step
talk Lorewalker Cho##59411
|tip At the top of the mountain.
turnin Last Piece of the Puzzle##30485 |goto 44.77,67.09
accept The Seal is Broken##31303 |goto 44.77,67.09
step
talk Mishi##64475
Tell him _"Let's do this, Mishi!"_ |gossip 1
Fly with Mishi |invehicle |goto 44.77,67.04 |q 31303
step
Seal #12# Sha Fissures |q 31303/1 |goto 47.30,58.20
|tip Use the ability on your action bar on the white smoke pillars on the ground as you fly.
step
talk Lorewalker Cho##59418
turnin The Seal is Broken##31303 |goto 49.30,61.48
accept Residual Fallout##30500 |goto 49.30,61.48
accept Jaded Heart##30502 |goto 49.30,61.48
accept Emergency Response##30504 |goto 49.30,61.48
stickystart "Kill_Sha_Remnants"
stickystart "Kill_Sha_Echoes"
step
use Cho's Fireworks##86467
Rescue General Nazgrim |q 30504/1 |goto 48.13,61.77
step
use Cho's Fireworks##86467
Rescue Shademaster Kiryn |q 30504/2 |goto 47.24,62.54
step
use Cho's Fireworks##86467
Rescue Shokia |q 30504/3 |goto 46.87,60.71
step
use Cho's Fireworks##86467
Rescue Rivett Clutchpop |q 30504/4 |goto 48.02,59.08
step
label "Kill_Sha_Remnants"
click Celestial Jade##210921+
|tip They look like small green rocks on the ground around this area.
collect Celestial Jade##80074+ |n
use the Celestial Jade##80074+
|tip Use them on Sha Remnants.
|tip They look like larger shadow aliens.
|tip They till become non-elite and easy to kill.
kill 6 Sha Remnant##59434 |q 30502/1 |goto 46.93,60.72
step
label "Kill_Sha_Echoes"
kill 12 Sha Echo##59417 |q 30500/1 |goto 46.93,60.72
|tip They look like smaller shadow aliens.
step
talk Lorewalker Cho##59418
turnin Residual Fallout##30500 |goto 49.30,61.48
turnin Jaded Heart##30502 |goto 49.30,61.48
turnin Emergency Response##30504 |goto 49.30,61.48
step
talk Fei##59899
accept Moving On##30648 |goto 49.30,61.42
step
talk Shao the Defiant##54697
|tip He fights around this area.
turnin An Air of Worry##29576 |goto 43.48,75.92
accept Defiance##29578 |goto 43.48,75.92
accept Rally the Survivors##29579 |goto 43.48,75.92
step
talk Gentle Mother Hanae##54854
|tip She walks around this area.
|tip Inside the building.
accept Spitfire##29585 |goto 43.24,76.01
accept Orchard-Supplied Hardware##29580 |goto 43.24,76.01
stickystart "Collect_Orchard_Tools"
stickystart "Kill_Gormali_Incinerators"
stickystart "Kill_Gormali_Raiders"
stickystart "Put_Out_Orchard_Fires"
step
talk Nectarbreeze Farmer##54763+
|tip They look like pandaren.
Tell them _"Get to Hanae's house. It's safe there."_ |gossip 1
Rescue #5# Survivors |q 29579/1 |goto 44.01,74.31
step
label "Collect_Orchard_Tools"
click Orchard Tool##209345+
|tip They look like various farm tools with long brown wooden handles.
collect 6 Orchard Tool##72133 |q 29580/1 |goto 44.01,74.31
step
label "Kill_Gormali_Incinerators"
kill 8 Gormali Incinerator##54703 |q 29578/2 |goto 44.01,74.31
|tip They look like grey bulky humanoids carrying torches.
step
label "Kill_Gormali_Raiders"
kill 8 Gormali Raider##54702 |q 29578/1 |goto 44.01,74.31
|tip They look like grey bulky humanoids.
step
label "Put_Out_Orchard_Fires"
use the Nectarbreeze Cider##72578
|tip Use it near fires while facing them around this area.
Put Out #12# Orchard Fires |q 29585/1 |goto 44.01,74.31
step
talk Shao the Defiant##54697
|tip He fights around this area.
turnin Defiance##29578 |goto 43.48,75.92
turnin Rally the Survivors##29579 |goto 43.48,75.92
step
talk Gentle Mother Hanae##54854
|tip She walks around this area.
|tip Inside the building.
turnin Spitfire##29585 |goto 43.24,76.01
turnin Orchard-Supplied Hardware##29580 |goto 43.24,76.01
step
talk Traumatized Nectarbreeze Farmer##55209
|tip Inside the building.
accept The Splintered Path##29586 |goto 43.21,75.94
step
Discover Camp Mogu |q 29586/1 |goto 41.00,73.97
step
talk Shao the Defiant##55009
turnin The Splintered Path##29586 |goto 41.00,73.97
accept Unbound##29587 |goto 41.00,73.97
accept Getting Down to Business##29670 |goto 41.00,73.97
stickystart "Set_Farmers_Free"
step
kill Subjugator Gormal##55016 |q 29670/1 |goto 37.80,76.18
step
label "Set_Farmers_Free"
clicknpc Captured Nectarbreeze Farmer##54990+
|tip They look like pandas caught in nets.
kill Gormali Slaver##54989+
|tip Kill the ones dragging a prisoner behind them.
Set #10# Farmers Free |q 29587/1 |goto 39.91,74.79
step
talk Shao the Defiant##55009
turnin Unbound##29587 |goto 41.00,73.97
turnin Getting Down to Business##29670 |goto 41.00,73.97
step
talk Peiji Goldendraft##55809
|tip Inside the building.
accept Temple of the White Tiger##31393 |goto 45.72,43.70
step
talk Messenger Grummle##63778
|tip Inside the building.
accept The Road to Kun-Lai##31255 |goto 45.72,43.80
step
talk Fei##59899
Tell her _"I am ready to leave."_ |gossip 1
Begin Flying to the Valley of the Four Winds |invehicle |goto 49.30,61.42 |q 30648
step
Watch the dialogue
Travel to the Valley of the Four Winds |q 30648/1 |goto Valley of the Four Winds/0 85.97,21.72 |notravel
step
_Click the Complete Quest Box:_
turnin Moving On##30648
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Valley of the Four Winds (20-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."ValleyOfTheFourWinds",
next="Leveling Guides\\Pandaria Remix (10-70)\\Krasarang Wilds (20-70)",
condition_suggested=function() return level >= 20 and level <= 70 and not completedq(29990) end,
startlevel=20,
endlevel=70,
pandariaremix=true,
},[[
step
talk Chen Stormstout##56133
turnin They Call Him... Stormstout##32019 |goto Valley of the Four Winds/0 85.94,22.10 |only if haveq(32019) or completedq(32019)
turnin His Name Was... Stormstout##32018 |goto Valley of the Four Winds/0 85.94,22.10 |only if haveq(32018) or completedq(32018)
accept Chen and Li Li##29907 |goto Valley of the Four Winds/0 85.94,22.10
step
talk Princeton##60230
fpath Pang's Stead |goto 84.49,21.06
step
Watch the dialogue
Follow Chen and Li Li to Pang's Stead |q 29907/1 |goto 83.78,21.17
step
talk Pang Thunderfoot##56204
turnin Chen and Li Li##29907 |goto 83.70,21.03
accept A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
step
talk Nan Thunderfoot##65528
|tip Inside the building.
home Thunderfoot Inn |goto 83.76,20.19 |q 29877 |future
stickystart "Slay_Large_Virmen"
stickystart "Slay_Virmen_Pesterers"
step
talk Muno the Farmhand##56440
accept A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
clicknpc Plow Plant##56281+
|tip They look like plows sticking up out of dirt piles around this area.
clicknpc Hoe Tree##56280+
|tip They look like hoes sticking up out of dirt piles around this area.
clicknpc Rake Tree##56279+
|tip They look like rakes sticking up out of dirt piles around this area.
clicknpc Barrow Bush##56278+
|tip They look like wheelbarrow handles sticking up out of dirt piles around this area.
Find #7# Buried Farm Equipment |q 29877/1 |goto 80.71,21.45
step
label "Slay_Large_Virmen"
Kill Snagtooth enemies around this area
|tip They look like larger rats.
Slay #8# Large Virmen |q 29908/1 |goto 80.71,21.45
'|kill Snagtooth Virmen##56184, Snagtooth Tool-Grabber##56185, Snagtooth Troublemaker##55873
step
label "Slay_Virmen_Pesterers"
kill Snagtooth Pesterling##65504+
|tip They look like tiny rats that run around in groups.
Slay #18# Virmen Pesterers |q 29908/2 |goto 80.71,21.45
step
talk Muno the Farmhand##56440
turnin A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
talk Pang Thunderfoot##56204
turnin A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
accept Low Turnip Turnout##29909 |goto 83.70,21.03
step
talk Xiao##56110
accept The Search for the Hidden Master##30086 |goto 84.08,21.04
step
talk Xiao##56110
turnin The Search for the Hidden Master##30086 |goto 84.08,21.05
accept Ken-Ken##29873 |goto 84.08,21.05
accept Clever Ashyo##29871 |goto 84.08,21.05
accept Kang Bramblestaff##29875 |goto 84.08,21.05
accept Lin Tenderpaw##29872 |goto 84.08,21.05
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Low Turnip Turnout##29909 |goto 81.59,25.22
accept Taking a Crop##29940 |goto 81.59,25.22
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
accept Rampaging Rodents##29910 |goto 82.23,25.94
stickystart "Fill_Marmot_Holes"
step
clicknpc Plump Marmot##56203+
|tip They look like brown rodents running on the ground.
Move #6# Plump Marmots |q 29910/1 |goto 82.38,25.15
step
label "Fill_Marmot_Holes"
click Marmot Hole##209835+
|tip They look like piles of dirt on the ground.
Fill #6# Marmot Holes |q 29910/2 |goto 82.38,25.15
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
turnin Rampaging Rodents##29910 |goto 82.23,25.94
step
Enter the underground burrow |goto 86.50,28.08 < 10 |walk
click Stolen Turnip##209891+
|tip They look like round white vegetables with green leaves.
|tip Inside the underground burrow.
collect 5 Stolen Turnip##76297 |q 29940/1 |goto 84.86,27.01
step
Leave the underground burrow |goto 86.56,28.08 < 10 |walk |only if subzone("Virmen Nest") and indoors()
click Stolen Watermelon##209899+
|tip They look like watermelons floating in the water with flag poles in them.
collect 5 Stolen Watermelon##76298 |q 29940/2 |goto 85.56,33.13
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Taking a Crop##29940 |goto 81.59,25.22
accept Practically Perfect Produce##29911 |goto 81.59,25.22
step
talk Pang Thunderfoot##56204
turnin Practically Perfect Produce##29911 |goto 83.70,21.02
accept The Fabulous Miss Fanny##29912 |goto 83.70,21.02
step
click Ang's Giant Pink Turnip##209844
collect Ang's Giant Pink Turnip##75259 |goto 84.28,21.89 |q 29912 |future
step
click Ang's Summer Watermelon##209843
collect Ang's Summer Watermelon##75258 |goto 84.16,22.07 |q 29912 |future
step
click Pang's Extra-Spicy Tofu##209842
collect Pang's Extra-Spicy Tofu##75256 |goto 84.04,22.00 |q 29912 |future
step
talk Miss Fanny##56192
Tell her _"Hit it with average power."_ |gossip 2
Launch a Pink Turnip |q 29912/1 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell her _"Hit it very softly."_ |gossip 1
Launch a Watermelon |q 29912/2 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell her _"Hit it as hard as possible."_ |gossip 3
Launch the Extra-Spicy Tofu |q 29912/3 |goto 83.00,21.36
step
talk Liang Thunderfoot##56205
turnin The Fabulous Miss Fanny##29912 |goto 75.22,24.05
accept The Meat They'll Eat##29913 |goto 75.22,24.05
accept Back to the Sty##29914 |goto 75.22,24.05
stickystart "Collect_Turtle_Meat_Scraps"
stickystart "Collect_Mushan_Shoulder_Steaks"
step
talk Kim of the Mountain Winds##62658
fpath Grassy Cline |goto 70.82,24.10
step
clicknpc Jian##56253
|tip She looks like a grey pig that walks around this area.
Find Jian |q 29914/1 |goto 70.39,24.05
step
clicknpc Smelly##56255
|tip She looks like a white pig that walks around this area.
Find Smelly |q 29914/3 |goto 70.56,28.36
step
clicknpc Ling##56254
|tip She looks like a grey pig that walks around this area.
Find Ling |q 29914/2 |goto 67.08,29.74
step
label "Collect_Turtle_Meat_Scraps"
kill Wyrmhorn Turtle##56256+
collect 80 Turtle Meat Scrap##75276 |q 29913/2 |goto 67.87,29.22
step
label "Collect_Mushan_Shoulder_Steaks"
kill Adolescent Mushan##56239+
|tip They look like yellow dinosaurs.
collect 4 Mushan Shoulder Steak##75275 |q 29913/1 |goto 71.90,29.94
step
talk Liang Thunderfoot##56205
turnin The Meat They'll Eat##29913 |goto 75.22,24.06
turnin Back to the Sty##29914 |goto 75.22,24.06
accept A Neighbor's Duty##29915 |goto 75.22,24.07
step
talk Francis the Shepherd Boy##56208
turnin A Neighbor's Duty##29915 |goto 78.12,32.91
accept Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
accept Lupello##29917 |goto 78.12,32.91
stickystart "Kill_Thieving_Wolves"
stickystart "Kill_Thieving_Plainshawks"
step
kill Lupello##56357 |q 29917/1 |goto 81.76,39.85
|tip He looks like a large black wolf that walks around this area.
step
label "Kill_Thieving_Wolves"
kill 6 Thieving Wolf##56106 |q 29916/2 |goto 81.64,35.01
step
label "Kill_Thieving_Plainshawks"
kill 5 Thieving Plainshawk##56034 |q 29916/1 |goto 80.40,31.74
|tip They look like brown birds perched in trees or flying in the air.
step
talk Francis the Shepherd Boy##56208
turnin Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
turnin Lupello##29917 |goto 78.12,32.91
step
Watch the dialogue
talk Shang Thunderfoot##56312
accept A Lesson in Bravery##29918 |goto 78.18,32.82
step
use the Rancher's Lariat##75208
|tip Use it on Great White Plainshawks.
|tip They look like larger white birds flying in the air.
kill Great White Plainshawk##56171 |q 29918/1 |goto 79.40,34.76
|tip Kill it while flying around on its back.
|tip Use the ability that appears as a button on the screen.
step
talk Shang Thunderfoot##56312
|tip He walks around this area.
turnin A Lesson in Bravery##29918 |goto 74.56,34.61
step
talk Chen Stormstout##56133
accept Great Minds Drink Alike##29919 |goto 75.28,35.50
step
talk Chen Stormstout##56133
Tell him _"I'm ready. Let's hit the road."_ |gossip 1
Watch the dialogue
Follow Chen and Li Li |goto 75.28,35.50 > 10 |c |q 29919
step
Watch the dialogue
|tip Follow Chen and Li Li as they walk.
|tip They eventually walk to this location.
Escort Chen and Li Li |q 29919/1 |goto 68.87,43.15
step
talk Mudmug##56474
turnin Great Minds Drink Alike##29919 |goto 68.72,43.12
step
talk Chen Stormstout##56133
accept Leaders Among Breeders##29944 |goto 68.87,43.15
step
talk Li Li##56138
accept Yellow and Red Make Orange##29945 |goto 68.89,43.32
stickystart "Collect_Vial_Animal_Bloods"
step
click Meadow Marigold##209907+
|tip They look like yellow flowers.
collect 10 Meadow Marigold##76334 |q 29945/1 |goto 70.53,47.94
step
kill Aiyu the Skillet##56520 |q 29944/1 |goto 68.29,38.01
|tip He looks like a large rat that walks around this area.
step
kill Jinanya the Clawblade##56513 |q 29944/2 |goto 65.97,37.39
|tip He looks like a large rat that walks around this area.
step
kill Frenzyhop##56514 |q 29944/3 |goto 64.53,40.65
|tip He looks like a large rat that walks around this area.
step
label "Collect_Vial_Animal_Bloods"
Kill enemies around this area
|tip Only beast enemies will drop the quest items.
collect 40 Vial of Animal Blood##76335 |q 29945/2 |goto 68.71,48.24
You can find more around [66.67,39.42]
'|kill Tawnyhide Fawn##56526, Tawnyhide Stag##56532, Mushan Nomad##56523, Tawnyhide Doe##56531, Longfang Howler##56524
step
talk Li Li##56138
turnin Yellow and Red Make Orange##29945 |goto 68.88,43.30
accept Crouching Carrot, Hidden Turnip##29947 |goto 68.87,43.31
step
talk Chen Stormstout##56133
turnin Leaders Among Breeders##29944 |goto 68.88,43.15
accept The Warren-Mother##29946 |goto 68.88,43.15
step
talk Mudmug##56474
accept Thieves to the Core##29948 |goto 68.71,43.12
stickystart "Collect_Stolen_Sack_Of_Hops"
stickystart "Trick_Virmen_With_Orange_Painted_Turnips"
step
Enter the underground burrow |goto 65.99,38.38 < 10 |walk
kill Chufa##56537 |q 29946/1 |goto 67.90,37.44
|tip Inside the underground burrow.
step
label "Collect_Stolen_Sack_Of_Hops"
click Stolen Sack of Hops##211696+
|tip They look like tan bags filled with green balls.
|tip Throughout the underground burrow. |notinsticky
collect 6 Stolen Sack of Hops##76337 |q 29948/1 |goto 69.05,39.90
step
label "Trick_Virmen_With_Orange_Painted_Turnips"
use the Orange-Painted Turnip##76370
|tip Use it on Twitchheel Hoarders.
|tip They look like rat people around this area.
|tip Inside and outside the underground burrow.
Trick #12# Virmen with Orange-Painted Turnips |q 29947/1 |goto 67.88,36.52
'|kill Twitchheel Hoarder##56538
step
talk Li Li##56138
turnin Crouching Carrot, Hidden Turnip##29947 |goto 68.88,43.32
stickystart "Collect_Stolen_Sack_Of_Hops"
step
talk Mudmug##56474
turnin Thieves to the Core##29948 |goto 68.71,43.12
step
talk Chen Stormstout##56133
turnin The Warren-Mother##29946 |goto 68.88,43.15
accept Legacy##29949 |goto 68.88,43.14
step
Watch the dialogue
talk Li Li##56138
turnin Legacy##29949 |goto 68.77,43.44
accept Li Li's Day Off##29950 |goto 68.77,43.44
step
Watch the dialogue
talk Mudmug##56474
accept Muddy Water##29951 |goto 68.7,43.1
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to Huangtze Falls |q 29950/3 |goto 74.96,42.42
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to New Cifera |q 29950/2 |goto 61.90,35.36
step
talk Clever Ashyo##56113
turnin Clever Ashyo##29871 |goto 61.23,34.22
accept Ashyo's Vision##29577 |goto 61.23,34.22
step
talk Yan##56773
accept Bottletoads##29757 |goto 60.61,33.69
step
talk Gladecaster Lang##58736
accept Watery Woes##30267 |goto 60.97,32.88
stickystart "Collect_Spindly_Bloodfeathers"
stickystart "Collect_Glade_Glimmers"
step
kill Manglemaw##58754
kill Manglemaw's Mother##58755
|tip She appears after you kill Manglemaw.
collect Enormous Crocolisk Tail##79238 |goto 57.48,25.79 |q 30275 |future
step
use the Enormous Crocolisk Tail##79238
accept A Crocolisk Tale##30275
step
label "Collect_Spindly_Bloodfeathers"
Kill Glade enemies around this area
|tip They look like birds walking around.
collect 5 Spindly Bloodfeather##79198 |q 30267/2 |goto 57.03,33.27
'|kill Glade Hunter##57299, Glade Sprinter##58741
step
label "Collect_Glade_Glimmers"
clicknpc Glade Glimmer##57301+
|tip They look like tiny yellow flying insects.
collect 18 Glade Glimmer##79197 |q 30267/1 |goto 57.03,33.27
step
talk Gladecaster Lang##58736
turnin Watery Woes##30267 |goto 60.98,32.89
step
talk Yan##56773
turnin A Crocolisk Tale##30275 |goto 60.62,33.70
step
Follow the path up |goto 62.95,29.70 < 20 |only if walking
talk Zhang Yue##56802
accept Snap Judgment##29600 |goto 59.83,27.93
step
talk Clever Ashyo##56113
Tell him _"Go ahead and speak with the water, Ashyo."_ |gossip 1
Witness Ashyo's Vision |q 29577/1 |goto 59.26,27.56
step
talk Zhang Yue##56802
turnin Ashyo's Vision##29577 |goto 59.83,27.93
accept The Golden Dream##29581 |goto 59.82,27.95
stickystart "Scoop_Toad_Eggs"
stickystart "Kill_Razorback_Snappers"
step
kill Krosh##56833
accept Guess Who's Back##29758 |goto 65.32,25.73
|tip You will automatically accept this quest after looting.
step
click Dreamleaf Bush##209987
collect Sprig of Dreamleaf##76973 |q 29581/1 |goto 65.26,26.29
step
label "Scoop_Toad_Eggs"
click Gurgling Toadspawn##209950+
|tip They look like bubbles in the water.
Scoop #8# Toad Eggs |q 29757/1 |goto 63.15,26.42
step
label "Kill_Razorback_Snappers"
kill 16 Razorback Snapper##56832 |q 29600/1 |goto 63.15,26.42
|tip They look like small turtles.
step
talk Zhang Yue##56802
turnin Snap Judgment##29600 |goto 59.83,27.95
step
talk Yan##56773
turnin The Golden Dream##29581 |goto 60.61,33.69
step
Watch the dialogue
talk Yan##56773
turnin Bottletoads##29757 |goto 60.61,33.69
turnin Guess Whose Back##29758 |goto 60.61,33.69
step
talk Wing Nga##60231
fpath Halfhill |goto 56.50,50.36
step
talk Innkeeper Lei Lan##59582
|tip She walks around on both floors inside the building.
home The Lazy Turnip |goto 55.11,50.55 |q 32035 |future
step
talk Stonecarver Mac##64315
accept Children of the Water##32045 |goto 55.14,47.39
step
talk Lolo Lio##59585
accept Got Silk?##32035 |goto 55.59,52.06
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to the Silken Fields |q 29950/1 |goto 61.79,58.85
step
talk Silkmaster Tsai##57405
turnin Got Silk?##32035 |goto 62.66,59.74
accept Where Silk Comes From##30072 |goto 62.66,59.75
step
talk Journeyman Chu##57424
accept The Moth Rebellion##30059 |goto 63.55,58.45
stickystart "Kill_Tiny_Mutated_Silkmoths"
step
kill 6 Mutated Silkmoth##57422 |q 30059/1 |goto 65.40,57.81
|tip They look like large white moths.
step
label "Kill_Tiny_Mutated_Silkmoths"
kill 8 Tiny Mutated Silkmoth##65984 |q 30059/2 |goto 65.40,57.81
|tip They look like tiny moths in groups.
step
click Muddy Water##209921+
|tip They look like green spots on the water around this area.
|tip Fill up the flask that appears on your screen.
collect Stoppered Vial of Muddy Water##76356 |q 29951/1 |goto 71.61,56.13
step
click Mulberry Barrel##210080
|tip They look like wooden buckets.
collect Mulberry Leaves##77455 |q 30072/1 |goto 62.48,55.19
step
clicknpc Hungry Silkworm##57403+
|tip They look like green caterpillars.
Feed #5# Hungry Silkworms |q 30072/2 |goto 61.28,61.04
step
click Silk Cocoon Bucket##210088
|tip Inside the building.
collect Raw Silk##77456 |q 30072/3 |goto 62.37,62.49
step
talk Silkmaster Tsai##57405
turnin Where Silk Comes From##30072 |goto 62.66,59.75
step
talk Journeyman Chu##57424
turnin The Moth Rebellion##30059 |goto 63.54,58.45
step
talk Master Goh##57407
accept Mothallus!##30058 |goto 63.62,58.53
step
click Mothallus Bait##210117
Watch the dialogue
kill Mothallus##57421
Bait and Kill Mothallus |q 30058/1 |goto 64.38,57.97
step
talk Master Goh##57407
turnin Mothallus!##30058 |goto 63.62,58.53
step
talk Li Li##56138
turnin Li Li's Day Off##29950 |goto 68.78,43.43
step
talk Mudmug##56474
turnin Muddy Water##29951 |goto 68.71,43.12
step
Watch the dialogue
talk Chen Stormstout##56133
accept Broken Dreams##29952 |goto 68.85,43.41
step
talk Chen Stormstout##56133 |goto 68.85,43.41
Ask him _"What happened, Chen?"_ |gossip 1
Enter Chen's Story |invehicle |goto 68.85,43.41 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Unruly Alemental##56684
|tip Use the abilities on your action bar.
Click Here After Killing the Unruly Alemental |confirm |goto 34.25,70.57 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Wuk-Wuk##56691
|tip Use the abilities on your action bar.
Click Here After Killing Wuk-Wuk |confirm |goto 35.87,72.72 |q 29952
step
Watch the dialogue
|tip Upstairs inside the building.
|tip Follow the path up into the upper level of the building.
Listen to Chen's Story |q 29952/1 |goto 34.55,70.75
step
talk Chen Stormstout##56133
turnin Broken Dreams##29952 |goto 68.85,43.40
accept Chen's Resolution##30046 |goto 68.85,43.40
step
talk Chen Stormstout##56133
turnin Chen's Resolution##30046 |goto 55.89,49.44
accept Hop Hunting##30053 |goto 55.89,49.44
accept Li Li and the Grain##30048 |goto 55.89,49.44
accept Doesn't Hold Water##30049 |goto 55.89,49.44
step
talk Mudmug##56474
|tip He walks around this small area.
turnin Doesn't Hold Water##30049 |goto 54.28,38.74
accept The Great Water Hunt##30051 |goto 54.28,38.74
step
talk Mudmug##56474
|tip He walks around this small area.
Tell him _"I'm ready to go, Mudmug."_ |gossip 1
Speak to Mudmug |q 30051/1 |goto 54.28,38.74
stickystart "Gather_Gladewaters"
step
kill Kracor##67128 |q 32045/1 |goto 56.05,33.85
step
label "Gather_Gladewaters"
Gather #30# Gladewater |q 30051/2 |goto 54.14,31.20
|tip Bring Mudmug near Swirling Pools.
|tip They look like dark blue glittering spots on the ground around this area.
step
_Next to you:_
talk Mudmug##58785
turnin The Great Water Hunt##30051
accept Barreling Along##30172
step
kill Thundergill##67125 |q 32045/2 |goto 54.94,25.22
|tip He looks like a large blue fish that swims underwater around this area.
step
kill Succula##67099 |q 32045/3 |goto 51.3,26.9
|tip She looks like a large red and yellow stealthed spider that walks around this area.
step
Lead Mudmug Back to Halfhill |q 30172/1 |goto 55.89,49.43
If he's not following you, you can find Mudmug around [54.28,38.74]
step
talk Chen Stormstout##56133
turnin Barreling Along##30172 |goto 55.89,49.43
step
talk Stonecarver Mac##64315
turnin Children of the Water##32045 |goto 55.14,47.38
step
talk Gardener Fran##62377
accept Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Tell her _"I'm ready to go!"_ |gossip 1
Water #60# Vegetables |q 30050/1 |goto 48.31,33.48
|tip Use the "Water Plants" ability near vegetables around this area.
|tip It appears as a button on the screen.
|tip She tells you what vegetables need to be watered.
|tip The type of vegetables that need to be watered will sparkle.
|tip All of the patches you need to water will be north of her location, around the big hill.
step
talk Gardener Fran##62377
turnin Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Tell her _"I'm helping a friend brew some beer, and we need hops. Do you have any to spare?"_ |gossip 1
Speak with Gardener Fran |q 30053/1 |goto 48.31,33.48
step
talk Den Mudclaw##62385
accept The Farmer's Daughter##30056 |goto 44.26,34.21
step
talk Den Mudclaw##62385
Ask him _"Do you have any hops you can spare?"_ |gossip 1
Speak with Den Mudclaw |q 30053/3 |goto 44.26,34.21
step
talk Mung-Mung##57401
accept Enough is Ookin' Enough##30054 |goto 44.17,34.24
stickystart "Collect_Virmen_Teeth"
step
Enter the underground burrow |goto 43.55,35.34 < 10 |walk
talk Mina Mudclaw##57408
|tip Inside the underground burrow.
turnin The Farmer's Daughter##30056 |goto 41.32,38.14
accept Seeing Orange##30057 |goto 41.32,38.14
step
label "Collect_Virmen_Teeth"
Kill Springtail enemies around this area
|tip They look like small and large rats.
|tip Inside the and outside the underground burrow. |notinsticky
collect 100 Virmen Tooth##77379 |q 30054/1 |goto 43.55,35.34
'|kill Springtail Gnasher##57413, Springtail Digger##66264, Springtail Leaper##57415
step
Leave the underground burrow |goto 43.55,35.34 < 10 |walk |only if subzone("Springtail Warren") and indoors()
Bring Mina Mudclaw Home to Her Father |q 30057/1 |goto 44.27,34.21
step
talk Den Mudclaw##62385
turnin Seeing Orange##30057 |goto 44.27,34.21
step
talk Mung-Mung##57401
turnin Enough is Ookin' Enough##30054 |goto 44.17,34.24
step
talk Gai Lan##57385
Ask him _"Can I buy some hops from you?"_ |gossip 1
Speak with Gai Lan |q 30053/2 |goto 38.59,51.71
step
_Click the Complete Quest Box:_
turnin Hop Hunting##30053
step
talk Gai Lan##57385
accept Weed War##30052 |goto 38.59,51.71
step
talk Gai Lan##57385
Ask him _"What weeds?"_ |gossip 1
Watch the dialogue
clicknpc Ugly Weed##57306+
clicknpc Nasty Weed##57308+
click Weed-B-Gone Gas Bomb##210057+
Pull #100# Weeds |q 30052/1 |goto 38.59,51.71
|tip Run over the small blue weeds that appear on the ground around this area.
|tip You can do this while mounted.
step
talk Gai Lan##57385
turnin Weed War##30052 |goto 38.59,51.71
step
accept Stormstout's Hops##30055 |goto 38.59,51.71
|tip You will automatically accept this quest.
step
talk Chen Stormstout##56133
turnin Stormstout's Hops##30055 |goto 55.89,49.45
step
talk Li Li##56138
turnin Li Li and the Grain##30048 |goto 52.69,62.83
accept Taste Test##30031 |goto 52.69,62.83
step
talk Grainlord Kai##57211
accept Wee Little Shenanigans##30029 |goto 52.73,62.99
step
talk Grainer Pan##57209
accept Out of Sprite##30030 |goto 52.61,62.97
stickystart "Kill_Tricky_Maizer"
step
kill Cornan##57213 |q 30030/1 |goto 51.47,64.42
|tip He runs around this area upstairs inside the building.
step
click Malted Grain##210023
Taste the Malted Grain |q 30031/3 |goto 50.80,63.61
step
click Aged Grain##210021
Taste the Aged Grain |q 30031/1 |goto 51.17,60.79
step
click Light Grain##210024
Taste the Light Grain |q 30031/2 |goto 53.73,63.31
step
click Fresh Grain##210022
Taste the Fresh Grain |q 30031/4 |goto 53.59,64.58
step
label "Kill_Tricky_Maizer"
Kill Maizerly enemies around this area
|tip They look like larger sprites.
Slay #8# Tricky Maizers |q 30029/1 |goto 52.30,62.29
'|kill Granary Vandal##66205, Tricky Maizer##57223
step
talk Li Li##56138
turnin Taste Test##30031 |goto 52.69,62.83
step
talk Grainer Pan##57209
turnin Out of Sprite##30030 |goto 52.60,62.97
step
talk Grainlord Kai##57211
turnin Wee Little Shenanigans##30029 |goto 52.74,62.99
accept The Quest for Better Barley##30032 |goto 52.74,62.99
accept Grain Recovery##30028 |goto 52.74,62.99
step
kill Maizerly Thief##57267+
|tip They look like larger sprites running around carrying large white bags.
click Stolen Barley Sack##210002+
|tip They look like large white bags.
collect 8 Sack of Grain##77033 |q 30028/1 |goto 56.17,64.96
step
talk Grainlord Kai##57211
turnin Grain Recovery##30028 |goto 52.73,63.00
step
click Rappeling Rope##7548
Use the Cliff Harness |q 30032/1 |goto 51.26,77.50
step
click Malted Cave Barley##210037+
|tip They look like small bushes.
|tip Inside the small cave.
collect Malted Cave Barley##77034 |q 30032/2 |goto 53.58,76.26
step
click Climbing Rope
Climb Up the Cliff |invehicle |goto Krasarang Wilds/0 48.65,27.02 |q 30032
|only if walking
step
talk Li Li##56138
turnin The Quest for Better Barley##30032 |goto Valley of the Four Winds/0 52.69,62.83
accept The Chen Taste Test##30047 |goto Valley of the Four Winds/0 52.69,62.83
step
talk Chen Stormstout##56133
turnin The Chen Taste Test##30047 |goto 55.89,49.45
accept The Emperor##30073 |goto 55.89,49.45
step
Watch the dialogue
Help Chen Brew His Beer |q 30073/1 |goto 55.89,49.45
step
talk Chen Stormstout##56133
turnin The Emperor##30073 |goto 55.84,49.35
accept Knocking on the Door##30074 |goto 55.84,49.35
step
talk Chen Stormstout##56133
turnin Knocking on the Door##30074 |goto 32.25,68.55
step
Watch the dialogue
talk Mudmug##56474
accept The Fanciest Water##30076 |goto 32.26,68.28
step
talk Li Li##56138
accept Barrels, Man##30077 |goto 32.33,68.47
step
talk Chen Stormstout##56133
accept Clear the Way##30075 |goto 32.11,68.34
stickystart "Collect_Spritewater_Essences"
stickystart "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
step
clicknpc Barreled Pandaren##57662+
|tip They look like shaking wooden barrels.
|tip Avoid Ook-Ook, the huge elite monkey that runs up and down the road.
|tip If he catches you, use the "Break Barrel" ability.
Free #7# Barreled Pandaren |q 30077/1 |goto 35.95,66.10
step
label "Collect_Spritewater_Essences"
kill Curious Water Sprite##57673+
|tip They look like small blue elementals wearing masks.
collect 3 Spritewater Essence##77471 |q 30076/1 |goto 35.95,66.10
step
label "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
Kill enemies around this area
|tip They look like rats and monkeys.
Slay #10# Ale-Addled Hozen or Mischievous Virmen |q 30075/1 |goto 35.95,66.10
'|kill Ale-Addled Hozen##57672, Mischievous Virmen##57671
step
talk Li Li##56138
turnin Barrels, Man##30077 |goto 36.13,69.05
step
talk Mudmug##56474
turnin The Fanciest Water##30076 |goto 36.0,69.1
step
talk Chen Stormstout##56133
turnin Clear the Way##30075 |goto 36.04,68.99
accept Cleaning House##30078 |goto 36.04,68.99
step
talk Chen Stormstout##56133
Select  _"<Crack your knuckles and nod your head.>"_ |gossip 39238
Enter the Stormstout Brewery |complete subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") |goto 36.04,68.99 |q 30078
step
label "Stormstout_Brewery_Router"
Watch the dialogue
|tip This sequence of this quest is random.
|tip You will appear in one of the random locations.
Stormstout Brewhall	|complete subzone("Stormstout Brewhall")	|q 30078	|or	|next "Stormstout_Brewhall"
The Great Wheel		|complete subzone("The Great Wheel")		|q 30078	|or	|next "The_Great_Wheel"
Trickling Passage	|complete subzone("Trickling Passage")		|q 30078	|or	|next "Trickling_Passage"
Stormstout Brewery	|complete subzone("Stormstout Brewery")		|q 30078	|or	|next "Stormstout_Brewery_Exit"		|only if readyq(30078)
|only if not completedq(30078)
step
label "Stormstout_Brewhall"
talk Li Li##58028
|tip Inside the building.
Tell her _"I'll help."_ |gossip 39978
kill Jooga##58015 |q 30078/2 |goto 32.98,71.11
|tip He looks like a large monkey nearby.
|tip Click the Empty Keg barrels inside the room.
|tip He will stop moving, so you can hit him.
|tip Avoid the bananas.
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
Watch the dialogue
Leave the Stormstout Brewhall |complete not subzone("Stormstout Brewhall") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
label "The_Great_Wheel"
talk Chen Stormstout##58029
|tip Inside the building.
Tell him _"Let's do this, Chen."_ |gossip 39980
kill Fizzy Yellow Spirit##58253+
|tip A Fizzy Yellow Alemental will appear after you kill them all.
kill Fizzy Yellow Alemental##58017 |q 30078/3 |goto 38.35,67.74
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
Watch the dialogue
Leave the Great Wheel |complete not subzone("The Great Wheel") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
label "Trickling_Passage"
talk Mudmug##58027
|tip Inside the building.
Tell him _"Calm down, Mudmug. Let's go."_ |gossip 40588
kill Eddy##58014 |q 30078/1 |goto 34.88,70.31
|tip It looks like a large water sprite elemental nearby.
|tip Run over the bubbles on the ground to weaken Eddy's Water Shield.
|tip Click the bubble around him when his Watery Shield is weakened.
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Watch the dialogue
Leave the Trickling Passage |complete not (subzone("Trickling Passage") or subzone("Grain Cellar")) |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Detecting player location... |complete not (readyq(30078) or completedq(30078)) |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078))
step
label "Stormstout_Brewery_Exit"
Watch the dialogue
Leave the Stormstout Brewery |complete subzone("Stormstout Brewery") |q 30078
|only if not completedq(30078) and (subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") or subzone("Grain Cellar"))
step
talk Chen Stormstout##56133
turnin Cleaning House##30078 |goto 36.00,69.12
step
talk Emmi##61026
accept Stoneplow Thirsts##30117 |goto 36.20,68.29
step
talk "Dragonwing" Dan##58843
fpath Stoneplow |goto 20.30,58.67
step
talk Lin Tenderpaw##56111
turnin Lin Tenderpaw##29872 |goto 19.87,56.92
accept Stemming the Swarm##29981 |goto 19.87,56.92
step
talk Loon Mai##56720
turnin Stoneplow Thirsts##30117 |goto 19.55,56.88
accept Evacuation Orders##29982 |goto 19.55,56.88
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 29981 |future
step
talk Haiyun Greentill##57123
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 1
Evacuate the Greentil Family |q 29982/3 |goto 15.84,56.28
step
talk Mia Marlfur##57127
Tell her _"Loon Mai has issued evacuation orders."_ |gossip 1
Evacuate the Marlfur Family |q 29982/4 |goto 15.48,54.90
stickystart "Kill_Ikthink_Mantids"
step
talk Feng Spadepaw##57121
Tell him _"Yes, Commander Mai sent me, and I carry his evacuation orders."_ |gossip 1
Evacuate the Spadepaw Family |q 29982/2 |goto 12.85,55.71
step
talk Wei Blacksoil##57120
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 1
kill Ik'thik Ambusher##57134
talk Wei Blacksoil##57120
Tell him _"Yes, they're right here. Let's go."_
Evacuate the Blacksoil Family |q 29982/1 |goto 7.15,54.83
step
label "Kill_Ikthink_Mantids"
Kill Ik'thik enemies around this area
|tip They look like insect people.
Slay #14# Ik'thik Mantids |q 29981/1 |goto 11.80,56.66
'|kill Ik'thik Wingblade##57196, Ik'thik Swiftclaw##57195
step
talk Loon Mai##56720
turnin Stemming the Swarm##29981 |goto 19.55,56.88
turnin Evacuation Orders##29982 |goto 19.55,56.88
accept The Hidden Master##29983 |goto 19.55,56.88
step
talk Master Bruised Paw##56714
turnin The Hidden Master##29983 |goto 18.29,31.24
accept Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I'm ready for the trial of bamboo."_ |gossip 1
Begin the Trial of Bamboo |invehicle |goto 18.29,31.23 |q 29984
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #3# Stacks of Bamboo Reeds |q 29984/1 |goto 18.34,32.13
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept They Will Be Mist##29985 |goto 18.29,31.24
accept Fog Wards##29986 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
stickystart "Kill_Mist_Incarnations"
stickystart "Collect_Jademoon_Leaves"
step
click Northern Fog Ward##209945
Light the Northern Fog Ward |q 29986/1 |goto 16.01,32.11
step
click Western Fog Ward##209946
Light the Western Fog Ward |q 29986/2 |goto 14.86,36.82
step
click Southern Fog Ward##209947
Light the Southern Fog Ward |q 29986/3 |goto 18.10,41.46
step
label "Kill_Mist_Incarnations"
kill 12 Mist Incarnation##56740 |q 29985/1 |goto 16.99,35.63
|tip They look like humanoid alien creatures with one large eye.
step
label "Collect_Jademoon_Leaves"
click Jademoon Leaf##11006+
|tip They look like small green plants on the grey rocks.
collect 18 Jademoon Leaf##76499 |q 29992/1 |goto 16.99,35.63
step
talk Lin Tenderpaw##56111
turnin Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
step
talk Master Bruised Paw##56714
turnin They Will Be Mist##29985 |goto 18.29,31.24
turnin Fog Wards##29986 |goto 18.29,31.24
accept Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"My fists are ready. Bring on the trial of wood."_ |gossip 1
Begin the Trial of Wood |invehicle |goto 18.29,31.24 |q 29987
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #4# Stacks of Wooden Boards |q 29987/1 |goto 18.25,32.18
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
accept A Taste For Eggs##29988 |goto 18.29,31.24
stickystart "Collect_Whitefisher_Crane_Eggs"
stickystart "Collect_Emperor_Tern_Eggs"
step
click Hornbill Strider Egg##209955
|tip Inside the small cave.
collect Hornbill Strider Egg##76516 |q 29988/3 |goto 26.98,39.05
step
label "Collect_Whitefisher_Crane_Eggs"
click Whitefisher Crane Egg##209954+
|tip They look like small white eggs.
collect 4 Whitefisher Crane Egg##76503 |q 29988/2 |goto 25.36,43.15
step
label "Collect_Emperor_Tern_Eggs"
click Emperor Tern Egg##209953+
|tip They look like small purple eggs.
collect 10 Emperor Tern Egg##76501 |q 29988/1 |goto 25.36,43.15
step
talk Master Bruised Paw##56714
turnin A Taste For Eggs##29988 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I've done all that you've asked of me. I'm ready for the trial of stone."_ |gossip 1
Begin the Trial of Stone |invehicle |goto 18.29,31.24 |q 29989
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #5# Stacks of Stone Blocks |q 29989/1 |goto 18.16,32.15
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Training and Discipline##29990 |goto 18.06,31.01
step
talk Loon Mai##56720
turnin Training and Discipline##29990 |goto 19.55,56.88
step
talk Tani##63822
|tip She walks around this area.
accept Stalker Mastery##30183 |goto 16.20,82.53
step
talk Hemet Nesingwary Jr.##58422
accept Mushan Mastery##30181 |goto 16.07,82.62
stickystart "Slay_Dustback_Mushans"
step
kill 15 Gorge Stalker##58432 |q 30183/1 |goto 12.77,75.08
|tip They look like green tigers.
step
label "Slay_Dustback_Mushans"
Kill Dustback Mushan enemies around this area
|tip They look like yellow dinosaurs.
Slay #15# Dustback Mushans |q 30181/1 |goto 17.96,72.89
'|kill Young Dustback Mushan##58427, Dustback Mushan##58424
step
talk Tani##63822
|tip She walks around this area.
turnin Stalker Mastery##30183 |goto 16.20,82.53
accept Fox Mastery##30182 |goto 16.20,82.53
step
talk Hemet Nesingwary Jr.##58422
turnin Mushan Mastery##30181 |goto 16.07,82.62
step
talk Hemet Nesingwary##58421
accept Mushan Mastery: Darkhide##30184 |goto 16.01,82.49
step
talk Matt "Lucky" Gotcher##58434
accept Stag Mastery##32038 |goto 15.89,82.24
stickystart "Kill_Sly_Foxes"
stickystart "Slay_Wilderland_Stags"
step
kill Darkhide##58435
|tip He looks like a larger grey dinosaur.
|tip You may need help with this.
collect Darkhide's Head###79058 |q 30184/1 |goto 26.20,75.48
step
label "Kill_Sly_Foxes"
Kill Sly enemies around this area
|tip They look like foxes.
|tip The larger foxes are stealthed.
Slay #15# Sly Foxes |q 30182/1 |goto 27.81,70.87
You can find more all all around [25.58,74.34]
'|kill Sly Fox##58548, Sly Pup##58549
step
label "Slay_Wilderland_Stags"
Kill Wilderland enemies around this area
|tip They look like deer.
Slay #10# Wilderland Stags |q 32038/1 |goto 28.74,81.86
You can find more around [21.30,80.38]
'|kill Wilderland Doe##58490, Wilderland Stag##58489
step
talk Tani##63822
|tip She walks around this area.
turnin Fox Mastery##30182 |goto 16.20,82.53
step
talk Hemet Nesingwary##58421
turnin Mushan Mastery: Darkhide##30184 |goto 16.01,82.49
step
talk Hemet Nesingwary Jr.##58422
accept Tortoise Mastery##30185 |goto 16.07,82.62
step
talk Matt "Lucky" Gotcher##58434
turnin Stag Mastery##32038 |goto 15.89,82.24
step
kill Bulgeback Tortoise##58431+
collect 5 Intact Tortoise Shell##79059 |q 30185/1 |goto 19.91,75.66
step
talk Hemet Nesingwary Jr.##58422
turnin Tortoise Mastery##30185 |goto 19.91,75.66
accept Parental Mastery##30186 |goto 19.91,75.66
step
Enter the underwater cave |goto 21.27,74.40 < 20 |walk
talk Hemet Nesingwary Jr.##58461
|tip Inside the underwater cave.
Choose _"<Try shaking Hemet.>"_ |gossip 1
Watch the dialogue
kill Torjar's Bane##58439
Rescue Hemet Nesingwary Jr. |q 30186/1 |goto 24.54,74.64
step
Leave the underwater cave |goto 21.27,74.40 < 20 |walk |only if subzone("Lair of the Beast") and indoors()
talk Hemet Nesingwary##58421
turnin Parental Mastery##30186 |goto 16.01,82.49
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Krasarang Wilds (20-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KrasarangWilds",
next="Leveling Guides\\Pandaria Remix (10-70)\\Kun-Lai Summit (25-70)",
condition_suggested=function() return level >= 20 and level <= 70 and not completedq(30628) end,
startlevel=15,
endlevel=70,
pandariaremix=true,
},[[
step
talk Ken-Ken##56115
turnin Ken-Ken##29873 |goto Krasarang Wilds/0 76.22,7.06
accept What's Eating Zhu's Bastion?##30079 |goto Krasarang Wilds/0 76.22,7.06
step
talk Rude Sho##62879
|tip Inside the building.
home Wilds' Edge Inn |goto 75.74,7.21
step
talk Mei Barrelbottom##57744
Speak with Mei |q 30079/4 |goto 75.84,7.60
step
talk Mei Barrelbottom##57744
accept Finding Yi-Mo##30080 |goto 75.84,7.60
step
talk Despondent Warden of Zhu##57457
Speak with a Despondent Warden of Zhu |q 30079/1 |goto 76.01,8.30
step
talk Gee Hung##60232
fpath Zhu's Watch |goto 76.74,8.38
step
talk Sunni##57830
|tip Inside the building.
Speak with Sunni |q 30079/2 |goto 77.47,8.53
step
talk Yun##57825
|tip Inside the building.
Speak with Yun |q 30079/3 |goto 75.48,9.39
step
talk Ken-Ken##56115
turnin What's Eating Zhu's Bastion?##30079 |goto 76.22,7.06
step
talk Yi-Mo Longbrow##58376
Find Yi-Mo Longbrow |q 30080/1 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
turnin Finding Yi-Mo##30080 |goto 81.31,6.84
accept Cheer Up, Yi-Mo##30082 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
Tell it _"Please, Yi-Mo: your aunt's worried sick about you."_ |gossip 40643
Tell it _"I don't have time for this. Move your ass or I'll move it for you."_ |gossip 40646
clicknpc Yi-Mo Longbrow##57310
Follow Yi-Mo and Continue Moving Him West |goto 81.31,6.84 > 10 |c |q 30082
step
clicknpc Yi-Mo Longbrow##57310
|tip Click him repeatedly.
|tip Roll him to this location.
Kill the enemies that attack in waves
Bring Yi-Mo to Zhu's Watch |q 30082/1 |goto 76.71,7.79 |notravel
'|kill Thunderbird##58111
step
talk Mei Barrelbottom##57744
turnin Cheer Up, Yi-Mo##30082 |goto 75.84,7.60
accept Tears of Pandaria##30091 |goto 75.84,7.60
step
talk Ken-Ken##56115
accept Materia Medica##30081 |goto 76.22,7.06
stickystart "Collect_Salty_Cores"
stickystart "Kill_Weeping_Horrors"
stickystart "Collect_Chunks_Of_Honeycomb"
step
click Slick Mudfish##210186+
|tip They look like small fish.
collect 4 Slick Mudfish##78877 |q 30081/2 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Collect_Salty_Cores"
kill Weeping Horror##57649+
|tip They look like rock elementals.
collect 4 Salty Core##78880+ |q 30081/1 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Kill_Weeping_Horrors"
kill 12 Weeping Horror##57649 |q 30091/1 |goto 75.38,10.91
|tip They look like rock elementals. |notinsticky
You can find more around [71.86,10.76]
step
label "Collect_Chunks_Of_Honeycomb"
click Rain-Slick Honeycomb##210188+
|tip They look like orange glowing balls hanging from trees.
collect 4 Chunk of Honeycomb##78881 |q 30081/3 |goto 73.04,10.94
step
talk Mei Barrelbottom##57744
turnin Tears of Pandaria##30091 |goto 75.84,7.61
accept Securing the Province##30083 |goto 75.84,7.61
accept Borderlands##30084 |goto 75.84,7.61
step
talk Ken-Ken##56115
turnin Materia Medica##30081 |goto 76.22,7.07
accept Why So Serious?##30088 |goto 76.22,7.07
stickystart "Slay_Wildscale_Sauroks"
step
Enter the cave |goto Valley of the Four Winds/0 77.07,57.28 < 15 |walk
click Jar of Pigment##210228
|tip Upstairs inside the cave.
collect Jar of Pigment##78942 |q 30088/2 |goto Valley of the Four Winds/0 73.88,56.41
step
label "Slay_Wildscale_Sauroks"
Kill Wildscale enemies around this area
|tip They look like lizard people.
|tip Inside and outside the cave. |notinsticky
Slay #10# Wildscale Sauroks |q 30083/1 |goto 77.07,57.28
'|kill Wildscale Herbalist##58216, Wildscale Saurok##58215
stickystart "Collect_Huge_Panther_Fangs"
step
Leave the cave |goto 77.07,57.28 < 15 |walk |only if subzone("Winds' Edge")
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Rin |q 30084/3 |goto Krasarang Wilds/0 71.28,17.47
step
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Zhu |q 30084/1 |goto 72.70,18.11
step
use the Flame of Zhu's Watch##78928
Light the Memorial Flame of Po |q 30084/2 |goto 73.88,16.95
step
label "Collect_Huge_Panther_Fangs"
kill Krasari Stalker##58221+
|tip They look like black tigers.
|tip They can be stealthed.
collect 18 Huge Panther Fang##78941 |q 30088/1 |goto 72.28,17.29
step
talk Mei Barrelbottom##57744
turnin Securing the Province##30083 |goto 75.84,7.60
turnin Borderlands##30084 |goto 75.84,7.60
step
talk Ken-Ken##56115
turnin Why So Serious?##30088 |goto 76.22,7.07
accept Apply Directly to the Forehead##30089 |goto 76.22,7.07
step
use Ken-Ken's Mask##79021
|tip Use it on Despondent Wardens of Zhu.
|tip They look like pandas in black armor.
kill Manifestation of Despair##58312+
Cure #8# Despondent Wardens of Zhu |q 30089/1 |goto 76.44,8.55
step
talk Ken-Ken##56115
turnin Apply Directly to the Forehead##30089 |goto 76.22,7.07
accept Zhu's Despair##30090 |goto 76.22,7.07
step
kill 8 Essence of Despair##58409 |q 30090/1 |goto 76.40,8.58
step
use Ken-Ken's Mask##79057
|tip Use it on Yi-Mo Longbrow.
kill Quintessence of Despair##58360
Cure Yi-Mo |q 30090/2 |goto 76.49,8.77
step
Watch the dialogue
talk Ken-Ken##56115
turnin Zhu's Despair##30090 |goto 76.21,7.07
step
talk Mei Barrelbottom##57744
accept Into the Wilds##30133 |goto 75.84,7.59
step
talk Mei Barrelbottom##57744
turnin Securing the Province##30083 |goto 75.87,7.50
turnin Borderlands##30084 |goto 75.87,7.50
accept Into the Wilds##30133 |goto 75.87,7.50
step
talk Chezin Dawnchaser##58160
accept Poisoned!##30179 |goto 68.80,22.24
step
Kill Krasari enemies around this area
|tip They look like bulky humanoids.
collect 5 Mogu Poisoned Blade##79252 |q 30179/1 |goto 68.53,22.27
'|kill Krasari Tormentor##58377, Krasari Runekeeper##65598
step
talk Daggle Bombstrider##58779
accept Crane Mastery##30352 |goto 67.63,25.73
accept Profit Mastery##30353 |goto 67.63,25.73
stickystart "Kill_Carp_Hunters"
stickystart "Collect_Vials_Of_Tiger_Blood"
step
clicknpc Zhu's Watch Courier##59151
Choose _"Take the supplies."_ |gossip 1
Find the Zhu's Watch Courier |q 30133/1 |goto 62.55,25.45
step
label "Kill_Carp_Hunters"
kill 12 Carp Hunter##58116 |q 30352/1 |goto 64.06,29.35
|tip They look like green birds.
step
label "Collect_Vials_Of_Tiger_Blood"
kill Krasari Huntress##58070+
|tip They look like tigers, usually stealthed.
collect 12 Vial of Tiger Blood##78914 |q 30353/1 |goto 64.06,29.35
step
talk Daggle Bombstrider##58779
turnin Crane Mastery##30352 |goto 67.63,25.73
accept Crane Mastery: Needlebeak##31262 |goto 67.63,25.73
turnin Profit Mastery##30353 |goto 67.63,25.73
accept Profit Mastery: Chasheen##31260 |goto 67.63,25.73
step
kill Chasheen##63767
|tip He walks around this area.
collect Ancient Tiger's Blood##85774 |q 31260/1 |goto 61.89,32.00
step
kill Needlebeak##63796
|tip He walks around this area.
collect The Needlebeak##85854 |q 31262/1 |goto 62.90,20.17
step
talk Daggle Bombstrider##58779
turnin Crane Mastery: Needlebeak##31262 |goto 67.63,25.73
turnin Profit Mastery: Chasheen##31260 |goto 67.63,25.73
step
talk Kang Bramblestaff##56112
turnin Kang Bramblestaff##29875 |goto 60.09,25.01
step
talk Sunwalker Dezco##58113
turnin Poisoned!##30179 |goto 59.89,24.70
step
talk Kor Bloodtusk##58114
accept Blind Them!##30124 |goto 59.88,24.81
step
talk Kang Bramblestaff##56112
accept Skitterer Stew##30123 |goto 60.09,25.01
step
talk Lira Skysplitter##59046
fpath Thunder Cleft |goto 59.20,24.67
step
talk Malaya Dawnchaser##58184
|tip Inside the building.
home Thunder Cleft |goto 60.91,24.91 |q 30628 |future
step
kill Jungle Skitterer##58067+
|tip They look like large insects running around.
collect 5 Intact Skitterer Glands##78911 |q 30123/1 |goto 62.99,22.03
step
kill Darnassian Outrider##58857 |q 30124/1 |goto 61.80,30.48
|tip It walks around this area, stealthed.
step
talk Kang Bramblestaff##56112
turnin Skitterer Stew##30123 |goto 60.09,25.01
step
talk Kor Bloodtusk##58114
turnin Blind Them!##30124 |goto 59.88,24.81
accept Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
accept Herbal Remedies##30130 |goto 59.89,24.70
step
talk Kang Bramblestaff##56112
accept The Mogu Agenda##30129 |goto 60.09,25.01
stickystart "Kill_Dojani_Enforcers"
stickystart "Kill_Dojani_Reclaimers"
stickystart "Kill_Dojani_Surveyors"
stickystart "Collect_Imperial_Lotus_Leaves"
step
kill Dojani Dominator##58165
|tip At the top of the ruins.
collect Dojani Orders##78917 |q 30129/1 |goto 55.51,34.46
step
_Next to you:_
talk Kang Bramblestaff##58206
turnin The Mogu Agenda##30129
accept The Pools of Youth##30128
step
Cross the bridge |goto 54.47,32.91 < 15 |only if walking
talk Na Lek##55597
|tip At the top of the ruins.
Choose _"Attempt to free Na Lek from his prison."_ |gossip 1
Watch the dialogue
Kill the enemies that attack
click Water of Youth##210229+
|tip They look like blue spots in the water.
|tip They appear after you kill the enemies that attack.
collect The Water of Youth##78934 |q 30128/1 |goto 51.91,32.72
'|kill Sleeping Guardian##58419
step
label "Kill_Dojani_Enforcers"
kill 4 Dojani Enforcer##65626 |q 30127/3 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a large sword.
step
label "Kill_Dojani_Reclaimers"
kill 6 Dojani Reclaimer##58117 |q 30127/1 |goto 54.56,38.41
|tip They look like bulky humanoids wearing a cloak and carrying a staff.
step
label "Kill_Dojani_Surveyors"
kill 8 Dojani Surveyor##58068 |q 30127/2 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a spear.
step
label "Collect_Imperial_Lotus_Leaves"
click Imperial Lotus##210209+
|tip They look like plants with white flowers on them.
collect 20 Imperial Lotus Leaves##78918 |q 30130/1 |goto 54.56,38.41
step
talk Kor Bloodtusk##58114
turnin Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
|tip He walks around this area.
turnin Herbal Remedies##30130 |goto 59.89,24.71
turnin The Pools of Youth##30128 |goto 59.89,24.71
accept Life##30131 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
Tell him _"Go, stand by your wife's side. I will protect the tent from invaders."_ |gossip 1
Stand by Dezco's Side |q 30131/1 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
|tip Inside the building.
turnin Life##30131 |goto 60.42,25.57
accept Going West##30132 |goto 60.42,25.57
step
talk Koro Mistwalker##58547
turnin Into the Wilds##30133 |goto 44.21,42.89
accept Unsafe Passage##30269 |goto 44.21,42.89
step
clicknpc Sunwalker Scout##59136
collect Sunwalker Scout's Report##79745 |q 30132/1 |goto 43.79,42.78
step
talk Koro Mistwalker##58547
Tell him _"I'm ready, Koro."_ |gossip 1
Begin Escorting the Refugees |havebuff Mistwalking##113066 |goto 44.21,42.89 |q 30269
step
Watch the dialogue
|tip Follow Koro and protect him as he walks.
|tip He eventually walks to this location.
Kill the enemies that attack in waves
|tip Click Koro when he says he's pinned down to help him back up.
Accompany Koro to Crane Wing Refuge |q 30269/1 |goto 43.88,36.85
'|kill Riverblade Bloodletter##58983
step
Watch the dialogue
talk Koro Mistwalker##59138
|tip He runs to this location.
turnin Unsafe Passage##30269 |goto 40.58,33.68
accept Blinding the Riverblades##30270 |goto 40.58,33.68
accept Tread Lightly##30694 |goto 40.58,33.68
step
talk Ni the Merciful##62869
home Crane Wing Refuge |goto 40.76,34.52
step
talk Anduin Wrynn##58609
accept The Murksweats##30268 |goto 40.49,34.65
stickystart "Poke_Traps"
stickystart "Kill_Riverblade_Pathstalkers"
step
kill Murkscale Striker##58631+
|tip They look like snakes.
|tip Underwater.
collect 6 Murkscale Head##79199 |q 30268/1 |goto 35.81,38.05
You can find more around [39.46,36.36]
step
label "Poke_Traps"
click Riverblade Spike Trap+
|tip They look like spiked metal balls.
|tip Don't get too close to them, they explode.
Poke #10# Traps |q 30694/1 |goto 44.65,35.01
step
label "Kill_Riverblade_Pathstalkers"
kill 8 Riverblade Pathstalker##58858 |q 30270/1 |goto 44.65,35.01
|tip They look like lizard people.
step
talk Anduin Wrynn##58609
turnin The Murksweats##30268 |goto 40.49,34.65
step
talk Koro Mistwalker##59138
turnin Blinding the Riverblades##30270 |goto 40.58,33.68
turnin Tread Lightly##30694 |goto 40.58,33.68
accept Ahead on the Way##30695 |goto 40.58,33.68
accept Striking the Rain##30272 |goto 40.58,33.68
step
_Next to you:_
talk Anduin Wrynn##59189
accept Sha Can Awe##30271
stickystart "Inspire_Hopeless_Crane_Wing_Defenders"
stickystart "Slay_Sha_Manifestations"
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the West Pagoda |q 30695/1 |goto 37.79,54.16
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the East Pagoda |q 30695/2 |goto 43.04,54.29
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Ahead on the Way##30695
step
label "Inspire_Hopeless_Crane_Wing_Defenders"
Inspire #10# Hopeless Crane Wing Defenders |q 30271/1 |goto 40.48,49.41
|tip Kill enemies near Hopeless Crane Wing Defenders.
|tip They look like shadowy pandas kneeling or walking around slowly.
step
label "Slay_Sha_Manifestations"
Kill enemies around this area
|tip They look like shadow aliens.
Slay #18# Sha Manifestations |q 30272/1 |goto 40.48,49.41
'|kill Incarnation of Despair##65872, Haunt of Despair##59236, Source of Despair##65873
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Striking the Rain##30272
turnin Sha Can Awe##30271
accept In the House of the Red Crane##30273
step
Enter the building |goto 40.43,52.13 < 20 |walk
talk Chi-Ji##59653
|tip Downstairs inside the building.
|tip Follow the stairs down to reach the lower level.
Choose _<Reach out and touch Chi-Ji.>_ |gossip 1
Watch the dialogue
kill Sha of Despair##59651 |q 30273/1 |goto 40.44,54.49
|tip Fight him until he returns to the middle of the room.
|tip When he does that, run a bit up the stairs nearby and wait until his AoE attack finishes.
|tip Repeat this process.
|tip Also kill the enemies he spawns, if you can.
'|kill Echo of Despair##59687
step
Run back up the stairs and leave the building |goto 40.43,52.13 < 20 |walk |only if subzone("Temple of the Red Crane") and indoors()
talk Chi-Ji##59719
turnin In the House of the Red Crane##30273 |goto 40.42,49.22
step
talk Munch Windhoof##59047
fpath Dawnchaser Retreat |goto 29.00,50.31
step
talk Kor Bloodtusk##58114
turnin Going West##30132 |goto 28.69,50.88
step
talk Feather Keeper Li##65189
fpath Cradle of Chi-Ji |goto 31.14,63.16
step
talk Tony Tuna##60182
accept Particular Plumage##30667 |goto 51.66,75.30
step
talk Jay Cloudfall##60173
accept Sudden, Unexpected Crocolisk Aggression##30666 |goto 51.53,76.85
step
talk Nan-Po##60441
fpath Marista |goto 52.48,76.60
stickystart "Collect_Emerald_Tailfeathers"
stickystart "Collect_Dusky_Tailfeathers"
stickystart "Slay_Mortbreath_Crocolisks"
step
kill Crimson Lory##60198+
|tip They look like red birds.
collect 6 Crimson Tailfeather##80678 |q 30667/2 |goto 45.15,68.68
step
label "Collect_Emerald_Tailfeathers"
kill Emerald Lory##60200+
|tip They look like green birds.
collect 6 Emerald Tailfeather##80677 |q 30667/1 |goto 45.15,68.68
step
label "Collect_Dusky_Tailfeathers"
kill Dusky Lory##60196+
|tip They look like brown birds.
collect 6 Dusky Tailfeather##80679 |q 30667/3 |goto 45.15,68.68
step
label "Slay_Mortbreath_Crocolisks"
Kill Mortbreath enemies around this area
|tip They look like alligators with fins on their backs.
Slay #8# Mortbreath Crocolisks |q 30666/1 |goto 45.15,68.68
'|kill Mortbreath Skulker##60202, Mortbreath Snapper##60201
step
talk Tony Tuna##60182
turnin Particular Plumage##30667 |goto 51.66,75.30
step
talk Jay Cloudfall##60173
turnin Sudden, Unexpected Crocolisk Aggression##30666 |goto 51.53,76.85
accept Build Your Own Raft##30668 |goto 51.53,76.85
step
click Spare Plank##211379
collect 4 Spare Plank##80685 |q 30668/1 |goto 52.40,76.15
step
click Tough Kelp##211382
collect Tough Kelp##80804 |q 30668/2 |goto 52.25,77.90
step
talk Jay Cloudfall##60173
turnin Build Your Own Raft##30668 |goto 51.53,76.85
accept The Lorewalker on the Lake##30669 |goto 51.53,76.85
step
click Your Raft##211392
Pick Up Your Raft |q 30669/1 |goto 51.67,76.56
step
talk Wise Ana Wu##60139
turnin The Lorewalker on the Lake##30669 |goto 45.98,78.91
accept Wisdom Has A Price##30671 |goto 45.98,78.91
accept Misery##30691 |goto 45.98,78.91
stickystart "Collect_Shark_Fillets"
step
Enter the underwater cave |goto 46.03,80.00 < 20 |walk
kill Nahassa##60203
|tip Inside the underwater cave.
|tip Don't worry about the crocolisks that appear.
Put Nahassa out of His Misery |q 30691/1 |goto 46.20,83.46
step
_Click the Complete Quest Box:_
turnin Misery##30691
step
label "Collect_Shark_Fillets"
Leave the underwater cave |goto 46.03,80.00 < 20 |walk |only if subzone("Mortbreath Grotto") and indoors()
Kill enemies around this area
|tip They look like sharks.
|tip Underwater. |notinsticky
collect 5 Shark Fillet##80810 |q 30671/1 |goto 46.61,78.63
'|kill Great Grey Shark##60204, Nayeli Hammerhead##60432
step
talk Wise Ana Wu##60139
turnin Wisdom Has A Price##30671 |goto 45.98,78.91
accept Balance##30672 |goto 45.98,78.91
stickystart "Accept_Buried_Hozen_Treasure"
stickystart "Kill_Unga_Fish_Getters"
step
accept Balance Without Violence##30674 |goto 45.12,84.91
|tip You will automatically accept this quest.
stickystart "Throw_Flailing_Carps_Back_Into_The_Water"
step
label "Accept_Buried_Hozen_Treasure"
Kill Unga enemies around this area
|tip They look like monkeys.
accept Buried Hozen Treasure##30675 |goto 45.12,84.91
|tip You will eventually automatically accept this quest after looting.
'|kill Unga Fish-Getter##60299, Unga Treasure-Hider##60357
step
click Lump of Sand##211420+
|tip They look like brown piles of dirt.
|tip All along the beach. |notinsticky
collect Buried Hozen Treasure##80817 |q 30675/1 |goto 48.47,87.12
|only if haveq(30675) or completedq(30675)
step
_Click the Complete Quest Box:_
turnin Buried Hozen Treasure##30675
step
label "Throw_Flailing_Carps_Back_Into_The_Water"
clicknpc Flailing Carp##60367+
|tip They look like fish flopping on the ground.
|tip They are usually next to piles of fish.
|tip All along the beach. |notinsticky
Throw #6# Flailing Carp Back into the Water |q 30674/1 |goto 45.12,84.91
step
label "Kill_Unga_Fish_Getters"
kill 10 Unga Fish-Getter##60299 |q 30672/1 |goto 45.12,84.91
|tip They look like monkeys carrying spears.
step
_Click the Complete Quest Box:_
turnin Balance Without Violence##30674
step
talk Jay Cloudfall##60173
turnin Balance##30672 |goto 51.53,76.85
step
talk Kor Bloodtusk##58114
accept For the Tribe##30163 |goto 28.69,50.88
accept The Greater Danger##30229 |goto 28.69,50.88
step
talk Kang Bramblestaff##56112
accept Re-Reclaim##30230 |goto 28.84,50.57
step
talk Tired Shushen##58278
accept Thieving Raiders##30168 |goto 29.67,39.06
accept Raid Leader Slovan##30169 |goto 29.67,39.06
stickystart "Collect_Pillaged_Jinyu_Loot"
step
kill Slovan##58285 |q 30169/1 |goto 31.80,28.99
|tip Inside the cavern at the bottom of the waterfall.
step
label "Collect_Pillaged_Jinyu_Loot"
kill Riverblade Flesh-hunter##58274+
|tip They look like lizard people.
|tip Inside the cavern at the bottom of the waterfall. |notinsticky
collect 5 Pillaged Jinyu Loot##78958 |q 30168/1 |goto 32.61,29.46
step
talk Tired Shushen##58278
turnin Thieving Raiders##30168 |goto 29.67,39.06
turnin Raid Leader Slovan##30169 |goto 29.67,39.06
stickystart "Collect_Mogu_Artifacts"
stickystart "Kill_Korjan_Reclaimers"
step
clicknpc Dawnchaser Captive##58608+
|tip They look like red glowing tauren.
Rescue #8# Captives |q 30163/1 |goto 24.83,39.34
You can find more around [25.12,45.46]
step
label "Collect_Mogu_Artifacts"
click Mogu Artifact##212765+
|tip They look like various shaped golden objects.
collect 10 Mogu Artifact##79120 |q 30230/1 |goto 24.83,39.34
You can find more around [23.15,44.53]
step
label "Kill_Korjan_Reclaimers"
kill 8 Korjan Reclaimer##58614 |q 30229/1 |goto 24.83,39.34
|tip They look like bulky humanoids wearing cloaks.
You can find more around [25.12,45.46]
step
talk Kang Bramblestaff##56112
turnin Re-Reclaim##30230 |goto 28.84,50.57
step
talk Kor Bloodtusk##58114
turnin For the Tribe##30163 |goto 28.69,50.88
turnin The Greater Danger##30229 |goto 28.69,50.88
step
talk Ambassador Han##58630
accept The Mantid##30175 |goto 29.06,51.13
step
talk Sunwalker Dezco##58607
accept The Stoneplow Convoy##30164 |goto 15.98,39.79
stickystart "Slay_Ik'thallik_Mantid"
step
clicknpc Stoneplow Envoy##58955+
|tip They look like Pandaren laying on the ground.
Save #7# Stoneplow Envoy |q 30164/1 |goto 15.47,35.43
You can find more around [16.94,42.67]
step
label "Slay_Ik'thallik_Mantid"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #10# Ik'thallik Mantid |q 30175/1 |goto 13.91,38.19
'|kill Ik'thik Precursor##58367, Ik'thik Vanguard##58368
step
talk Ambassador Len##58954
turnin The Mantid##30175 |goto 15.70,39.72
step
talk Sunwalker Dezco##58607
turnin The Stoneplow Convoy##30164 |goto 15.98,39.79
accept For Family##30174 |goto 15.98,39.79
step
talk Kor Bloodtusk##58670
Choose _<Try to free Kor Bloodtusk from his bonds.>_ |gossip 1
kill Groundbreaker Brojai##58224 |q 30174/1 |goto 23.64,48.83
step
talk Sunwalker Dezco##58607
turnin For Family##30174 |goto 28.90,50.87
accept Warn Stoneplow##30241 |goto 28.90,50.87
step
talk Loon Mai##56720
turnin Warn Stoneplow##30241 |goto Valley of the Four Winds/0 19.55,56.87
step
Watch the dialogue
talk Mei Barrelbottom##59855
accept The Mantidote##30623 |goto 17.96,56.45
step
talk Loon Mai##56720
accept The Swarm Begins##30622 |goto 17.84,56.23
step
talk Mudmug##56474
|tip He walks around this area.
accept It Does You No Good In The Keg##30653 |goto 18.16,55.73
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 30653 |future
stickystart "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
stickystart "Slay_Ikthallik_Infestors_Or_Warriors"
step
Deliver Beer to Zhu's Wardens |q 30653/1 |goto 17.45,50.27
step
Deliver Beer to Crane Wing Priests |q 30653/2 |goto 15.14,55.43
step
Deliver Beer to Tauren Settlers |q 30653/4 |goto 12.99,55.98
step
Deliver Beer to Shado-Pan |q 30653/3 |goto 10.63,55.58
step
_Click the Complete Quest Box:_
turnin It Does You No Good In The Keg##30653
step
label "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
use Ken-Ken's Mask##80337
|tip Use it on Ik'thik Wing Commanders.
|tip Make sure they have the "Lashing Out in Fear" buff.
|tip They look like larger insects.
kill Manifestation of Fear##59874+
Use Ken-Ken's Mask on #5# Ik'thik Wing Commanders |q 30623/1 |goto 12.93,54.85
You can find more around [16.35,53.47]
'|kill Ik'thik Wing Commander##56723
step
_Click the Complete Quest Box:_
turnin The Mantidote##30623
step
label "Slay_Ikthallik_Infestors_Or_Warriors"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #15# Ik'thallik Infestors or Warriors |q 30622/1 |goto 12.93,54.85
'|kill Ik'thik Infestor##56721, Ik'thik Warrior##56722
step
talk Guard Captain Oakenshield##57198
turnin The Swarm Begins##30622 |goto 11.60,49.52
accept Students No More##30625 |goto 11.60,49.52
step
Watch the dialogue
|tip Follow your allies and kill enemies around this area.
|tip They may already be in the battlefield, so you may have to find them.
|tip They will yell at you to come over to them when you are near them.
kill Ik'thik Bloodrager##59887 |q 30625/1 |goto 9.26,54.09
kill Ik'thik Incubator##59890 |q 30625/2 |goto 9.26,54.09
kill Ik'thik Tendon-Slicer##59888 |q 30625/3 |goto 9.26,54.09
kill Ik'thik Fearmonger##59889 |q 30625/4 |goto 9.26,54.09
step
talk Guard Captain Oakenshield##57198
turnin Students No More##30625 |goto 11.60,49.52
accept Retreat!##30626 |goto 11.60,49.52
step
talk Loon Mai##56720
turnin Retreat!##30626 |goto 17.84,56.23
step
talk Master Bruised Paw##59856
accept The Savior of Stoneplow##30627 |goto 17.91,55.75
step
talk Miss Fanny##59857
Tell her _"Let's go, Miss Fanny."_ |gossip 1
Ride Miss Fanny |invehicle |goto 17.93,56.69 |q 30627
step
Reach the Mantid Colossus |outvehicle |goto 7.55,54.76 |q 30627 |notravel
step
Watch the dialogue
|tip Use the ability on your action bar when the circle at the bottom of your screen is full and glowing.
|tip You will have to use the ability multiple times.
kill Mantid Colossus##56703 |q 30627/1 |goto 7.55,54.76
step
talk Loon Mai##56720
turnin The Savior of Stoneplow##30627 |goto 17.84,56.23
accept The Gratitude of Stoneplow##30628 |goto 17.84,56.23
step
click The Commander's Cache##211316
|tip Upstairs inside the building.
turnin The Gratitude of Stoneplow##30628 |goto 19.82,55.92
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Kun-Lai Summit (25-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KunLai",
next="Leveling Guides\\Pandaria Remix (10-70)\\Townlong Steppes (30-70)",
condition_suggested=function() return level >= 25 and level <= 70 and not completedq(30752) end,
startlevel=25,
endlevel=70,
pandariaremix=true,
},[[
step
talk Highroad Grummle##62738
Speak with Highroad Grummle |q 31255/1 |goto Valley of the Four Winds/0 70.05,23.47
|only if haveq(31255) or completedq(31255)
step
talk Shin the Weightless##61759
|tip On top of the mountain.
fpath Tavern in the Mists |goto The Veiled Stair/0 56.72,75.75
step
talk Tong the Fixer##62917
|tip Inside the building.
home Tavern in the Mists |goto 55.07,72.40
step
talk Len the Whisperer##63484
accept Robbing Robbers of Robbers##31286 |goto 53.51,65.76
accept Educating Saurok##31287 |goto 53.51,65.76
stickystart "Collect_Black_Market_Merchandise"
step
Enter the cave |goto 54.86,55.01 < 15 |walk
Follow the path up |goto 44.26,47.28 < 15 |walk
kill Leechfingers##63494 |q 31287/1 |goto 51.12,43.38
|tip Upstairs inside the cave.
step
label "Collect_Black_Market_Merchandise"
click Various Objects
|tip They look like various shaped objects with different names.
|tip Inside the cave. |notinsticky
collect 7 Black Market Merchandise##85891 |q 31286/1 |goto 54.86,55.01
step
Leave the cave |goto 54.86,55.01 < 15 |walk |only if subzone("Hatescale Burrow") and indoors()
talk Len the Whisperer##63484
turnin Robbing Robbers of Robbers##31286 |goto 53.51,65.76
turnin Educating Saurok##31287 |goto 53.51,65.76
step
talk Brewmaster Boof##63367
Speak with Brewmaster Boof |q 31254/2 |goto 51.91,43.74
step
talk Brewmaster Boof##63367
accept The Spring Drifter##31285 |goto 51.91,43.74
step
clicknpc The Spring Drifter##63517
Ride the Spring Drifter |invehicle |goto 52.03,43.08 |q 31285
step
Watch the dialogue
Survive a Ride on the Spring Drifter |q 31285/1 |goto Kun-Lai Summit/0 72.66,93.10 |notravel
step
talk Brewmaster Boof##63367
turnin The Spring Drifter##31285 |goto 72.66,93.02
step
talk Jo the Wind Watcher##61474
fpath Binan Village |goto 72.54,94.17
step
talk Apothecary Cheng##59077
accept Hit Medicine##30460 |goto 71.57,92.83
step
talk Mayor Bramblestaff##59073
turnin The Road to Kun-Lai##31255 |goto 72.27,91.86 |only if haveq(31255) or completedq(31255)
accept Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Puli the Even Handed##62871
|tip Inside the building.
home Binan Brew & Stew |goto 72.67,92.34 |q 30460 |future
step
talk Commander Hsieh##59076
accept All of the Arrows##30459 |goto 70.75,90.36
stickystart "Slay_Bataari_Tribe_Members"
stickystart "Heal_Injured_Binan_Warriors"
stickystart "Collect_Arrows_Of_Commander_Hsieh"
step
kill Bataari Fire-Warrior##59083 |q 30457/2 |goto 68.01,88.63
|tip He looks like a tauren riding on a large yak that walks along this path.
|tip He will appear as a yellow dot on your minimap.
|tip He appears at this location.
Also check around [69.89,89.45]
step
label "Slay_Bataari_Tribe_Members"
Kill Bataari enemies around this area
|tip They look like tauren.
Slay #10# Bataari Tribe Members |q 30457/1 |goto 69.23,89.76
'|kill Bataari Yaungol##58961, Bataari Flamecaller##59021
step
label "Heal_Injured_Binan_Warriors"
use the Dit Da Jow##79819
|tip Use it on Injured Binan Warriors.
|tip They look like kneeling pandas.
Heal #8# Injured Binan Warriors |q 30460/1 |goto 69.23,89.76
'|talk Injured Binan Warrior##59143
step
label "Collect_Arrows_Of_Commander_Hsieh"
click Arrow of Commander Hsieh##210759+
|tip They look like the back feathers of arrows sticking out of the ground.
collect 12 Arrow of Commander Hsieh##79806 |q 30459/1 |goto 69.23,89.76
step
talk Commander Hsieh##59076
turnin All of the Arrows##30459 |goto 70.75,90.36
step
talk Mayor Bramblestaff##59073
turnin Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Apothecary Cheng##59077
turnin Hit Medicine##30460 |goto 71.57,92.83
accept General Nazgrim has Awakened##30511 |goto 71.57,92.83
step
talk General Nazgrim##59442
|tip Upstairs inside the building.
turnin General Nazgrim has Awakened##30511 |goto 71.65,93.10
accept Eastwind Rest##30513 |goto 71.65,93.10
step
talk Merchant Shi##59263
accept Reposesssion##30469 |goto 74.96,88.86
accept My Son...##30467 |goto 74.96,88.86
step
talk Swordmistress Mei##59273
accept Enraged Vengeance##30468 |goto 74.79,88.68
step
talk Waterspeaker Gorai##60973
accept The Waterspeaker's Staff##30496 |goto 75.13,87.94
accept Free the Dissenters##30967 |goto 75.13,87.94
stickystart "Help_Inkgill_Dissenters_Escape"
stickystart "Collect_Stolen_Supplies"
stickystart "Slay_Enraged_Jinyus"
step
talk Wu-Peng##59272
turnin My Son...##30467 |goto 74.68,76.93
accept Father and Child Reunion##30834 |goto 74.68,76.93
step
kill Orachi##59180
|tip He walks around this area.
|tip He will appear as a yellow dot on your minimap.
collect Stolen Inkgill Ritual Staff##81385 |q 30496/1 |goto 74.45,78.53
step
label "Help_Inkgill_Dissenters_Escape"
talk Inkgill Dissenter##61566+
|tip They look like scared fish people.
Tell them _"There's still hope - Gorai is still alive, to the south. Go!"_ |gossip 1
Help #6# Inkgill Dissenters Escape |q 30967/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
step
label "Collect_Stolen_Supplies"
click Untainted Supplies##210889+
|tip They look like green and silver metal containers.
collect 8 Stolen Supplies##79880 |q 30469/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
step
label "Slay_Enraged_Jinyus"
Kill Enraged enemies around this area
|tip They look like fish people.
Slay #15# Enraged Jinyus |q 30468/1 |goto 74.61,82.83
You can find more around [74.07,78.29]
'|kill Orachi##59180, Enraged Tideweaver##59181, Enraged Cavalier##61537, Enraged Enforcer##60995, Enraged Spearman##59165, Enraged Priest##59166, Enraged Blacksmith##61130
step
talk Waterspeaker Gorai##60973
turnin The Waterspeaker's Staff##30496 |goto 75.20,88.26
turnin Free the Dissenters##30967 |goto 75.20,88.26
step
Watch the dialogue
Reunite Wu-Peng and Merchant Shi |q 30834/1 |goto 74.96,88.86
step
talk Merchant Shi##59263
turnin Reposesssion##30469 |goto 74.96,88.86
turnin Father and Child Reunion##30834 |goto 74.96,88.86
step
talk Swordmistress Mei##59273
turnin Enraged Vengeance##30468 |goto 74.79,88.68
step
talk Waterspeaker Gorai##60973
accept The Ritual##30480 |goto 75.20,88.26
step
talk Waterspeaker Gorai##60973
Tell him _"I'm ready. Begin the ritual."_ |gossip 1
Speak to Waterspeaker Gorai to Begin the Ritual |q 30480/1 |goto 75.20,88.26
step
Watch the dialogue
|tip Follow Waterspeaker Gorai as he walks.
|tip He eventually walks to this location.
Lay the Dead Inkgill to Rest |q 30480/2 |goto 74.90,88.58
step
Watch the dialogue
kill Explosive Hatred##61530
Complete the Ritual |q 30480/3 |goto 74.90,88.58
step
Watch the dialogue
talk Waterspeaker Gorai##60973
turnin The Ritual##30480 |goto 74.90,88.58
accept Cleansing the Mere##30828 |goto 74.90,88.58
step
clicknpc Pool of Corruption##61500+
|tip They look like spots of smoke rising out of the water around this area.
Watch the dialogue
kill Boiling Rage##59170+
Cleanse #6# Pools of Corruption |q 30828/1 |goto 71.54,85.29
step
_Next to you:_
talk Waterspeaker Gorai##61065
turnin Cleansing the Mere##30828
accept The Fall of Shai Hu##30855
step
kill Shai Hu##61069 |q 30855/1 |goto 71.24,82.53
|tip You will lose 5% of your health every 5 seconds.
|tip Kill Explosive Hatred enemies around this area near him to hurt him.
'|kill Explosive Hatred##61070
step
talk Waterspeaker Gorai##60973
turnin The Fall of Shai Hu##30855 |goto 74.91,88.58
step
talk Farmhand Ko##63751
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 1
Speak with Farmhand Ko |q 30513/1 |goto 63.68,86.65
step
talk Elder Shiao##63535
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 1
Speak with Elder Shiao |q 30513/2 |goto 61.20,82.22
step
talk Elder Shiao##63535
turnin Eastwind Rest##30513 |goto 61.20,82.22
accept Challenge Accepted##30515 |goto 61.20,82.22
step
click Yaungol Banner##210933
Watch the dialogue
kill Ur-Bataar##59483 |q 30515/1 |goto 58.19,84.09
step
talk Elder Shiao##63535
turnin Challenge Accepted##30515 |goto 61.57,80.19
step
talk General Nazgrim##59442
|tip Inside the building.
accept Round 'Em Up##31256 |goto 63.00,80.20
step
talk Rivett Clutchpop##59448
accept Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk Farmhand Ko##63751
accept Trouble on the Farmstead##30570 |goto 62.54,79.44
step
talk Elder Shiao##63535
accept Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
step
talk Soaring Paw##61745
fpath Eastwind Rest |goto 62.44,80.72
step
talk Shademaster Kiryn##59449
accept Deanimate the Reanimated##30594 |goto 62.70,80.72
step
talk Mai the Sleepy##62883
home Eastwind Rest |goto 62.73,80.49 |q 30999 |future
stickystart "Collect_Kun_Lai_Meaty_Bits"
step
clicknpc Wild Plains Yak##59610+
|tip They look like brown bison.
|tip They will begin following you.
|tip You can have 3 following you at once.
Round Up #3# Yaks |q 31256/1 |goto 65.02,78.75
Bring them to [62.61,79.36]
step
label "Collect_Kun_Lai_Meaty_Bits"
Kill enemies around this area
|tip They look like various beasts.
|tip Wild Plains Yaks will not drop the quest item.
collect 160 Kun-Lai Meaty Bits##80245 |q 31251/1 |goto 65.02,78.75
'|kill Highlands Calf##59671, Highlands Mushan##59670, Summit Bonestripper##59672, Razorquill Porcupine##65839
step
talk Rivett Clutchpop##59448
turnin Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
turnin Round 'Em Up##31256 |goto 63.00,80.20
step
talk Farmer Chow##59573
turnin Trouble on the Farmstead##30570 |goto 60.24,85.79
accept Farmhand Freedom##30571 |goto 60.24,85.79
step
talk Uyen Chow##59636
accept ... and the Pot, Too!##30581 |goto 60.17,85.91
step
click Cast Iron Pot##211023
|tip Inside the building.
collect Cast Iron Pot##80230 |q 30581/2 |goto 60.02,88.44
stickystart "Collect_Root_Vegetables"
step
kill Ordo Overseer##59580+
|tip They look like tauren next to groups of Pandaren.
Free #12# Farmstead Slaves |q 30571/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
label "Collect_Root_Vegetables"
kill Wascally Wirmen##59655+
|tip They look like small piles of dirt that move around on the ground.
click Root Vegetable##211019+
|tip They look like green leafy vegetable stalks sticking out of the ground.
collect 12 Root Vegetable##80227 |q 30581/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
talk Uyen Chow##59636
turnin ... and the Pot, Too!##30581 |goto 60.17,85.91
step
talk Farmer Chow##59573
turnin Farmhand Freedom##30571 |goto 60.24,85.79
accept Back to Eastwind Rest##31253 |goto 60.24,85.79
step
talk Farmhand Ko##63751
turnin Back to Eastwind Rest##31253 |goto 62.54,79.44
step
talk Bao Jian##59821
accept Profiting off of the Past##30595 |goto 59.61,78.22
stickystart "Collect_Mogu_Relics"
stickystart "Destroy_Terracotta_Guardians_Or_Warriors"
step
kill Mogujia Soul-Caller##59797 |q 30620/1 |goto 58.12,70.89
step
label "Collect_Mogu_Relics"
Kill Terracotta enemies around this area
click Mogu Relic##211148+
|tip They look like various shaped stone objects.
collect 12 Mogu Relic##80294 |q 30595/1 |goto 58.58,75.71
'|kill Terracotta Warrior##59758, Terracotta Guardian##59773
step
label "Destroy_Terracotta_Guardians_Or_Warriors"
Kill Terracotta enemies around this area
|tip They look like bulky humanoids and lions.
Destroy #14# Terracotta Guardians or Warriors |q 30594/1 |goto 58.58,75.71
'|kill Terracotta Warrior##59758, Terracotta Guardian##59773
step
talk Bao Jian##59821
turnin Profiting off of the Past##30595 |goto 59.61,78.22
step
talk Elder Shiao##63535
turnin Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
accept Pandaren Prisoners##30655 |goto 62.34,79.61
step
talk Rivett Clutchpop##59448
accept Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
accept In Tents Channeling##30657 |goto 63.00,80.20
step
talk Shademaster Kiryn##59449
turnin Deanimate the Reanimated##30594 |goto 62.70,80.72
stickystart "Rescue_Pandaren_Prisoners"
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 51.23,79.31 |q 30656
step
use the Explosives Barrel##80528
Destroy the Eastern Oil Rig |q 30656/1 |goto 51.05,79.41
step
kill Musaan the Blazecaster##59969 |q 30657/1 |goto 50.45,78.59
|tip Inside the tent.
step
kill Harala the Firespeaker##60030 |q 30657/3 |goto 49.43,78.48
|tip Inside the tent.
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 49.57,78.97 |q 30656
step
kill Pao-kun the Pyromancer##60031 |q 30657/4 |goto 49.13,80.31
|tip Inside the tent.
step
use the Explosives Barrel##80528
Destroy the Southern Oil Rig |q 30656/2 |goto 49.61,80.94
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |q 30656 |goto 49.34,81.10
step
use the Explosives Barrel##80528
Destroy the Western Oil Rig |q 30656/3 |goto 47.87,81.39
step
kill Akonu the Embercaller##60032 |q 30657/2 |goto 47.71,80.01
|tip Inside the tent.
step
_Click the Complete Quest Box:_
turnin In Tents Channeling##30657
accept The Ordo Warbringer##30661
step
label "Rescue_Pandaren_Prisoners"
clicknpc Pandaren Prisoner##60038+
|tip They look like panda people with ball and chains on their legs, or inside wooden cages.
Rescue #8# Pandaren Prisoners |q 30655/1 |goto 49.88,79.97
step
kill Ordo Warbringer##60127 |q 30661/1 |goto 48.35,76.72
|tip When his shield appears, kill the enemies that appear to remove it.
|tip Inside the small cave.
step
talk Rivett Clutchpop##59448
turnin Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip He walks around this area.
turnin Pandaren Prisoners##30655 |goto 62.31,80.63
turnin The Ordo Warbringer##30661 |goto 62.31,80.63
accept The Shado-Pan##31453 |goto 62.31,80.63
step
talk Elder Shiao##63535
accept Beyond the Wall##31695 |goto 62.34,79.61
step
talk Farmhand Ko##63751
accept Muskpaw Ranch##31457 |goto 62.54,79.44
step
talk Shademaster Kiryn##59449
accept Cho's Missive##31459 |goto 62.70,80.72
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin Muskpaw Ranch##31457 |goto 71.34,69.68
accept The Missing Muskpaw##30488 |goto 71.34,69.68
accept Fresh Needle Scent##30489 |goto 71.34,69.68
stickystart "Collect_Pungent_Sprite_Needles"
step
Enter the cave |goto 72.99,73.44 < 15 |walk
talk Muskpaw Jr.##61693
|tip He runs around this area inside the cave.
|tip Kill the enemies attacking him to be able to talk to him.
turnin The Missing Muskpaw##30488 |goto Kun-Lai Summit/9 64.23,61.16
accept At the Yak Wash##30491 |goto Kun-Lai Summit/9 64.23,61.16
step
clicknpc Tuffi##61874
|tip Inside the cave.
Ride Tuffi |invehicle |goto 65.54,58.89 |q 30491
step
Wash an Escaped Yak |q 30491/1 |goto Kun-Lai Summit/0 71.36,69.15 |count 1 |notravel
step
label "Collect_Pungent_Sprite_Needles"
kill Needle Sprite##55593+
|tip They look like imps.
|tip Inside and outside the cave. |notinsticky
collect 100 Pungent Sprite Needles##79952 |q 30489/1 |goto 73.16,73.57
step
Leave the cave |goto 72.99,73.44 < 15 |walk |only if subzone("Pranksters' Hollow") and indoors()
accept Yakity Yak##30587 |goto 69.41,74.15
|tip You will automatically accept this quest.
stickystart "Kill_Burilgi_Despoilers"
step
kill Burilgi Despoiler##59335+
|tip They look like tauren.
accept The Late Mrs. Muskpaw##30582 |goto 68.17,73.63
|tip You will eventually automatically accept this quest after looting.
step
clicknpc Escaped Yak##59319+
|tip They look like brown bison.
Wash #6# Escaped Yaks |q 30491/1 |goto 68.17,73.63
Ride them to [71.36,69.15]
step
talk Muskpaw Jr.##59354
turnin At the Yak Wash##30491 |goto 71.39,69.28
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin Fresh Needle Scent##30489 |goto 71.51,69.94
turnin The Late Mrs. Muskpaw##30582 |goto 71.51,69.94
accept The Fearmaster##30804 |goto 71.51,69.94
step
kill The Fearmaster##59656 |q 30804/1 |goto 67.84,73.99
step
label "Kill_Burilgi_Despoilers"
kill 9 Burilgi Despoiler##59335 |q 30587/1 |goto 68.17,73.63
|tip They look like tauren.
step
talk Lao Muskpaw##59353
|tip He walks around this area.
turnin The Fearmaster##30804 |goto 71.51,69.94
turnin Yakity Yak##30587 |goto 71.51,69.94
step
talk Muskpaw Jr.##59354
accept Back in Yak##30492 |goto 71.39,69.28
step
Bring the Yak Herd to Lucky Eightcoins |q 30492/1 |goto 65.38,61.71
step
talk Slimy Inkstain##59402
accept Oil Stop##30614 |goto 65.49,60.82
step
talk Smokey Sootassle##59597
accept Traffic Issues##30616 |goto 64.88,60.49
step
talk Li Goldendraft##59405
|tip Inside the building.
home The Two Fisted Brew |goto 64.24,61.39
step
talk Lucky Eightcoins##59371
turnin Back in Yak##30492 |goto 64.71,61.76
accept A Grummle's Luck##30808 |goto 64.71,61.76
stickystart "Collect_Stolen_Luckydos"
stickystart "Slay_Ruqin_Yaungols"
step
click Yaungol Oil Derrick##211531
collect Filled Oil Vial##80311 |q 30614/1 |goto 63.32,68.45
step
label "Collect_Stolen_Luckydos"
click Stolen Bag of Luckydos##211538+
|tip They look like small tan bags on the ground and inside huts.
collect 8 Stolen Luckydos##81293 |q 30808/1 |goto 62.80,67.52
step
label "Slay_Ruqin_Yaungols"
Kill Ruqin enemies around this area
|tip They look like tauren.
Slay #8# Ruqin Yaungols |q 30616/1 |goto 62.80,67.52
'|kill Ruqin Elder##59826, Ruqin Infantry##59790, Ruqin Outrider##59538
step
talk Lucky Eightcoins##59371
turnin A Grummle's Luck##30808 |goto 64.71,61.76
step
talk Slimy Inkstain##59402
turnin Oil Stop##30614 |goto 65.49,60.82
step
talk Smokey Sootassle##59597
turnin Traffic Issues##30616 |goto 64.88,60.50
accept Roadside Assistance##30617 |goto 64.88,60.50
step
click Lucky Burlap Incense##211539+
|tip They look like thin sticks stuck in the ground along the road.
Light #8# Lucky Burlap Incense |q 30617/1 |goto 60.19,65.28
step
talk Brother Lintpocket##59701
turnin Roadside Assistance##30617 |goto 58.09,61.47
step
talk Little Cleankite##61504
fpath One Keg |goto 57.73,59.69
step
talk Chiyo Mistpaw##59688
|tip She walks around this small area.
|tip Inside the building.
home The Lucky Traveller |goto 57.37,60.00 |q 30621 |future
step
talk Lorewalker Cho##61847
turnin Cho's Missive##31459 |goto 57.34,61.69
accept Path Less Traveled##30999 |goto 57.34,61.69
step
talk Uncle Cloverleaf##59696
turnin Path Less Traveled##30999 |goto 57.22,61.20
accept Instant Courage##30601 |goto 57.22,61.20
step
talk Big Sal##59695
|tip Inside the building.
accept Resupplying Onekeg##30618 |goto 57.72,61.77
step
talk Ji-Lu the Lucky##59716
|tip Inside the building.
accept They Stole My Luck!##30621 |goto 57.32,60.20
stickystart "Inspire_Hiding_Guides"
stickystart "Collect_Stolen_Supplies_30618"
step
Enter the cave |goto 59.28,52.68 < 30 |walk
kill Suspicious Snow Pile##59967+
|tip They look like white mounds on the ground.
|tip Inside the cave.
kill Mischievous Snow Sprite##59693+
|tip They look like imps.
collect Lucky Virmen's Foot##80316 |q 30621/1 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky Yak Shoe##80317 |q 30621/2 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky Four Winds Clover##90318 |q 30621/3 |goto Kun-Lai Summit/8 70.02,86.55
collect Lucky "Gold" Coin##80319 |q 30621/4 |goto Kun-Lai Summit/8 70.02,86.55
step
label "Inspire_Hiding_Guides"
talk Hiding Guide##59818+
|tip They look like larger wicker baskets with red stripes on them.
|tip Inside the cave. |notinsticky
Ask them _"Are you sure you don't want to come with me?"_
Inspire #3# Hiding Guides |q 30601/1 |goto 70.02,86.55
step
label "Collect_Stolen_Supplies_30618"
click Stolen Supplies##211270+
|tip They look like various shaped objects on the ground.
|tip Inside the cave. |notinsticky
collect 8 Stolen Supplies##80315 |q 30618/1 |goto 70.02,86.55
step
Leave the cave |goto Kun-Lai Summit/0 59.28,52.68 < 30 |walk |only if subzone("Howlingwind Cavern") and indoors()
talk Ji-Lu the Lucky##59716
|tip Inside the building.
turnin They Stole My Luck!##30621 |goto Kun-Lai Summit/0 57.32,60.20
step
talk Uncle Cloverleaf##59696
turnin Instant Courage##30601 |goto 57.22,61.20
step
talk Big Sal##59695
|tip Inside the building.
turnin Resupplying Onekeg##30618 |goto 57.72,61.77
step
talk Uncle Cloverleaf##59696
accept Comin' Round the Mountain##30487 |goto 57.22,61.20
step
clicknpc Ji-Lu's Cart##60094
Jump in Ji-Lu's Cart |q 30487/1 |goto 57.32,61.58
step
Kill the enemies that attack in waves
|tip Use the abilities on your action bar.
Survive the Mountain Pass |q 30487/2 |goto 48.10,49.01 |notravel
'|kill Knucklethump Attacker##60138, Rampaging Yeti##59694
step
talk Lucky Bluestring##60175
turnin Comin' Round the Mountain##30487 |goto 48.14,49.04
accept One Traveler's Misfortune##30683 |goto 48.14,49.04
step
click Abandoned Wreckage##212903
Search the Abandoned Wreckage for Supplies |q 30683/1 |goto 50.06,49.24
step
Watch the dialogue
Kill the enemies that attack
kill General Sho Lien##60769 |q 30683/2 |goto 50.06,49.24
'|kill Stone Guardian##63155
step
talk Lucky Bluestring##60175
turnin One Traveler's Misfortune##30683 |goto 48.14,49.04
accept Seeker's Folly##30684 |goto 48.14,49.04 |or
'|accept Seeker's Folly##31306 |goto 48.14,49.04 |or
step
click Shrine of the Seeker's Body##211597
|tip Avoid the falling snowballs.
Honor the Shrine of the Seeker's Body |q 30684/1 |goto 44.79,49.17 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Body |q 31306/1 |goto 44.79,49.17 |only if haveq(31306) or completedq(31306)
step
click Shrine of the Seeker's Breath##211601
|tip Avoid the tornados.
Honor the Shrine of the Seeker's Breath |q 30684/2 |goto 42.69,50.02 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Breath |q 31306/2 |goto 42.69,50.02 |only if haveq(31306) or completedq(31306)
step
click Shrine of the Seeker's Heart##211602
Honor the Shrine of the Seeker's Heart |q 30684/3 |goto 43.18,51.98 |only if haveq(30684) or completedq(30684)
Honor the Shrine of the Seeker's Heart |q 31306/3 |goto 43.18,51.98 |only if haveq(31306) or completedq(31306)
step
talk Lorewalker Cho##60795
turnin Seeker's Folly##30684 |or |goto 43.79,51.05 |only if haveq(30684) or completedq(30684)
turnin Seeker's Folly##31306 |or |goto 43.79,51.05 |only if haveq(31306) or completedq(31306)
accept The Tongue of Ba-Shon##30829 |goto 43.79,51.05
step
talk Lorewalker Cho##60795
Tell him _"Go ahead with the binding, Cho."_ |gossip 1
Watch the dialogue
kill Reclaimer Zuan##61305
Bind the Tongue of Ba-Shon |q 30829/1 |goto 43.79,51.05
step
talk Lorewalker Cho##60795
turnin The Tongue of Ba-Shon##30829 |goto 43.76,51.11
accept Staying Connected##30795 |goto 43.76,51.11
step
talk Mishi##60796
Tell her _"I'm ready to leave."_ |gossip 1
Begin Flying to the Valley of Emperors |invehicle |goto 43.74,51.32 |q 30795
step
Fly to the Valley of Emperors |outvehicle |goto 57.87,48.97 |q 30795 |notravel
step
use The Tongue of Ba-Sho##81712
Use the Tongue of Ba-Shon in the Valley of Emperors |q 30795/1 |goto 57.87,48.97
step
_Next to you:_
talk Image of Lorewalker Cho##61297
turnin Staying Connected##30795
accept An End to Everything##30796
stickystart "Kill_Tormented_Spirits"
step
click Curious Text##211780
accept It Was Almost Alive##30797 |goto 57.11,47.90
step
click Curious Text##211780
collect Torn Page##81892 |q 30797/1 |goto 57.11,47.90
step
label "Kill_Tormented_Spirits"
kill 5 Tormented Spirits##60825 |q 30796/1 |goto 57.31,48.01
|tip They look like banshees.
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin An End to Everything##30796
turnin It Was Almost Alive##30797
accept The Tomb of Shadows##30799
step
Enter the building |goto 55.89,46.18 < 10 |walk
click Shen Dynasty Tablet##211770
|tip Inside the building.
collect Shen Dynasty Rubbing##82393 |q 30799/1 |goto 57.14,43.49
step
click Qiang Dynasty Tablet##211794
|tip Inside the building.
collect Qiang Dynasty Rubbing##82394 |q 30799/3 |goto 57.07,45.04
step
click Wai Dynasty Tablet##211793
|tip Inside the building.
collect Wai Dynasty Rubbing##82395 |q 30799/2 |goto 56.37,43.43
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin The Tomb of Shadows##30799
accept Breaking the Emperor's Shield##30798
step
Leave the building |goto 55.89,46.18 < 10 |walk |only if subzone("Tomb of Shadows") and indoors()
Run up the stairs and enter the building |goto 53.33,49.29 < 10 |walk
Watch the dialogue
|tip Inside the building.
Kill the enemies that attack in waves
kill Nakk'rakas##60572
Interrupt the Spiritbinding Ritual |q 30798/1 |goto 52.96,51.39
'|kill Imperial Guard##60826
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Breaking the Emperor's Shield##30798
accept Stealing Their Thunder... King##30800
step
_NOTE:_
During the Next Steps
|tip Avoid the tiles on the floor with colorful designs, they are traps.
Click Here to Continue |confirm |q 30800
step
Leave the building |goto 53.33,49.29 < 10 |walk |only if subzone("Tomb of Secrets") and indoors()
Enter the building |goto 52.96,46.59 < 10 |walk
click King's Coffer##211967
|tip Inside the building.
collect Bottom Fragment of Lei Shen's Tablet##82764 |q 30800/1 |goto Kun-Lai Summit/17 58.65,72.68
step
click Top Fragment of Lei Shen's Tablet##211968
|tip Inside the building.
Repair the Tablet of Thunder |q 30800/2 |goto 34.15,61.48
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Stealing Their Thunder... King##30800
accept Lessons from History##30801
step
click Tablet of Thunder
|tip Inside the building.
Read the Tablet of Thunder |q 30801/1 |goto 34.15,61.48
step
Watch the dialogue
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Lessons from History##30801
accept Chasing the Storm##30802
step
kill Zandalari Warrior##61842+
|tip Inside the building.
collect Blood-Revealed Map##81890 |q 30802/1 |goto 59.51,72.19
step
use The Tongue of Ba-Sho##81712
talk Image of Lorewalker Cho##61297
|tip He appears next to you.
turnin Chasing the Storm##30802
accept Fisherman's Tale##30935
step
Leave the building |goto Kun-Lai Summit/0 52.96,46.59 < 10 |walk |only if subzone("Tomb of Conquerors") and indoors()
talk Mishi##61382
Tell her _"I'm ready to leave."_ |gossip 1
Speak to Mishi Outside of Lei Shen's Tomb |q 30935/1 |goto Kun-Lai Summit/0 52.97,46.39
step
Begin Flying to the Path of Conquerors |invehicle |goto 52.97,46.39 |q 30935
step
Fly to the Path of Conquerors |outvehicle |goto 63.92,47.85 |q 30935 |notravel
step
Leave the cave |goto 63.94,49.65 < 20 |walk |only if subzone("Path of Conquerors") and indoors()
Follow the path up |goto 66.91,57.69 < 20 |only if walking
talk Sunwalker Dezco##64542
|tip Inside the building.
turnin Temple of the White Tiger##31393 |goto 68.73,43.01 |only if haveq(31393) or completedq(31393)
accept A Celestial Experience##31395 |goto 68.73,43.01
step
talk Xuen##64528
|tip Inside the building.
Speak to Xuen |q 31395/1 |goto 68.88,42.79
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Violence##64656
Pass the First Test |q 31395/2 |goto 68.78,43.98
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Anger##64684
Pass the Second Test |q 31395/3 |goto 68.78,43.98
step
Watch the dialogue
|tip Inside the building.
kill Spirit of Hatred##64744
Pass the Third Test |q 31395/4 |goto 68.78,43.98
step
talk Sunwalker Dezco##64542
|tip Inside the building.
turnin A Celestial Experience##31395 |goto 68.73,43.01
accept A Witness to History##31511 |goto 68.73,43.01
step
Leave the building |goto 68.60,46.07 < 20 |walk |only if subzone("Temple of the White Tiger") and indoors()
talk Big Greenfeather##61118
|tip At the top of the mountain.
fpath Temple of the White Tiger |goto 66.31,50.66
step
Run down the mountain and run through the tunnel |goto 63.94,49.59 < 30 |only if walking
talk Shin Whispercloud##61380
Tell him _"I'm ready to leave."_ |gossip 1
Speak to Anduin at the Gate of the August Celestials |q 30935/2 |goto 63.32,40.22
step
Begin Flying to the Zouchin Province |invehicle |goto 63.32,40.22 |q 30935
step
Fly to the Zouchin Province |outvehicle |goto 63.59,34.88 |q 30935 |notravel
step
talk Bo the Wind Claimer##61511
fpath Zouchin Village |goto 62.42,30.12
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin Fisherman's Tale##30935 |goto 62.32,29.06
accept It Takes A Village##30944 |goto 62.32,29.06
step
talk Liu Ze##60605
|tip Inside the building.
home North Wind Tavern |goto 62.49,28.78 |q 30816 |future
step
talk Li Hai##60436
accept Checking In##30816 |goto 63.17,29.37
step
talk Elder Shu##61495
|tip He walks around on both floors.
|tip Inside the building.
accept Handle With Care##30943 |goto 63.37,28.75
step
talk Steelbender Doshu##61496
|tip He walks around this area.
accept What's Yours Is Mine##30945 |goto 63.36,30.74
step
talk Shomi##61503
accept Make A Fighter Out of Me##30942 |goto 63.73,30.71
stickystart "Kill_Amani_Skirmishers"
step
talk Exhausted Defender##61417+
|tip They look like Pandaren.
|tip Around the perimeter of the village.
Tell them _"I'll cover your post. Go rest and be with your family."_ |gossip 1
Relieve #5# Exhausted Defenders |q 30944/1 |goto 63.35,29.30
step
label "Kill_Amani_Skirmishers"
kill 4 Amani Skirmisher##629 |q 30942/1 |goto 64.35,29.07
|tip They look like trolls with large axes.
|tip Around the perimeter of the village. |notinsticky
stickystart "Kill_Drakkari_Frostweavers"
stickystart "Kill_Gurubashi_Hexxers"
stickystart "Collect_Handful_Of_Volatile_Blooms"
step
Kill Amani enemies around this area
|tip Only Skullbreakers and Raptor-Handlers will drop the quest item.
|tip They look like trolls carrying a large sword, and trolls walking around with raptors.
collect 8 Blood-Stained Blade##82299 |q 30945/1 |goto 69.94,27.15
'|kill Amani Skullbreaker##60580, Amani Raptor-Handler##60581
step
label "Kill_Drakkari_Frostweavers"
kill 3 Drakkari Frostweaver##66707 |q 30942/3 |goto 69.94,27.15
|tip They look like trolls channeling a blue spell.
step
label "Kill_Gurubashi_Hexxers"
kill 4 Gurubashi Hexxer##64202 |q 30942/2 |goto 69.94,27.15
|tip They look like trolls carrying staves.
step
label "Collect_Handful_Of_Volatile_Blooms"
click Volatile Blooms##211684+
|tip They look like red bushes.
collect 50 Handful of Volatile Blooms##82298 |q 30943/1 |goto 69.94,27.15
step
_Next to you:_
talk Shomi##61534
turnin Make A Fighter Out of Me##30942
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin It Takes A Village##30944 |goto 62.33,29.06
step
talk Elder Shu##61495
|tip He walks around on both floors.
|tip Inside the building.
turnin Handle With Care##30943 |goto 63.37,28.75
step
talk Steelbender Doshu##61496
|tip He walks around this area.
turnin What's Yours Is Mine##30945 |goto 63.36,30.74
step
talk Lorewalker Cho##61371
|tip Inside the building.
accept Enemies At Our Door##31011 |goto 62.33,29.06
stickystart "Kill_Zandalari_Berserkers"
step
clicknpc Blasting Barrel##62591+
|tip They look like wooden barrels.
|tip Keep clicking them as they reappear.
kill 5 Zandalari Behemoth##63516 |q 31011/2 |goto 61.18,29.05
step
kill 3 Zandalari Bloodrider##62362 |q 31011/3 |goto 64.40,29.04
|tip They look like trolls riding raptors.
|tip You may have to wait for a group of them to appear.
You can find more around [63.87,32.39]
step
label "Kill_Zandalari_Berserkers"
kill 10 Zandalari Berserker##62299 |q 31011/1 |goto 62.77,30.10
|tip They look like troll soldiers.
step
talk Lorewalker Cho##61371
|tip Inside the building.
turnin Enemies At Our Door##31011 |goto 62.33,29.06
accept Revelations##30946 |goto 62.33,29.06
step
talk Zandalari Prisoner##62629
|tip Upstairs inside the building.
Ask him _"Where have the Thunder King's Remains been taken?!"_ |gossip 1
Watch the dialogue
Question the Zandalari Prisoner |q 30946/1 |goto 62.48,28.84
step
talk Lorewalker Cho##63750
|tip Inside the building.
turnin Revelations##30946 |goto 62.32,29.06
accept Prophet Khar'zul##31228 |goto 62.32,29.06
step
talk Sage Liao##60694
turnin Checking In##30816 |goto 60.61,21.34
accept Emergency Care##30794 |goto 60.61,21.34
step
click Sage Liao's Belongings##211510
|tip Inside the building.
collect Pandaren Healing Draught##81177 |goto 61.02,21.52 |q 30794
step
use the Pandaren Healing Draught##81177
|tip Use it on Sage Liao.
Heal Sage Liao |q 30794/1 |goto 60.61,21.34
step
talk Sage Liao##60785
turnin Emergency Care##30794 |goto 60.61,21.34
accept Justice##30805 |goto 60.61,21.34
accept The Scent of Life##30806 |goto 60.61,21.34
accept By the Falls, For the Fallen##30807 |goto 60.61,21.34
step
click Waterfall-Polished Stone##211526+
|tip They look like large grey rocks underwater.
collect 3 Waterfall-Polished Stone##81269 |q 30807/1 |goto 59.05,27.22
You can find more around [58.91,24.56]
stickystart "Collect_Stolen_Pandaren_Spices_And_Slay_Blackmane_Mercenaries"
stickystart "Collect_Opalescent_Blue_Crab_Shells"
step
kill Captain Ripflesh##60767 |q 30805/1 |goto 62.13,23.57
|tip He walks around this area.
step
label "Collect_Stolen_Pandaren_Spices_And_Slay_Blackmane_Mercenaries"
Kill Blackmane enemies around this area
|tip They look like gnolls.
click Blackmane Booty Barrel##211521+
|tip They look like brown wooden barrels.
collect 8 Stolen Pandaren Spices##81261 |q 30806/2 |goto 62.52,21.25
Slay #6# Blackmane Mercenaries |q 30805/2 |goto 62.52,21.25
'|kill Blackmane Brigand##60560, Blackmane Pillager##60846, Blackmane Tracker##60434
step
label "Collect_Opalescent_Blue_Crab_Shells"
kill Azure Prickly Crawler##60437+
|tip They look like blue crabs.
|tip Underwater and along the beach around this area. |notinsticky
collect Opalescent Blue Crab Shell##80907 |q 30806/1 |goto 60.15,20.45
step
talk Sage Liao##60785
turnin Justice##30805 |goto 60.61,21.34
turnin The Scent of Life##30806 |goto 60.61,21.34
turnin By the Falls, For the Fallen##30807 |goto 60.61,21.34
accept Preparing the Remains##30819 |goto 60.61,21.34
step
talk Li Hai##60436
turnin Preparing the Remains##30819 |goto 63.17,29.37
accept Honoring the Dead##30820 |goto 63.17,29.37
step
click Incense of Life##211545
Light the Incense of Life |q 30820/1 |goto 66.94,33.32
step
talk Sage Liao##60757
turnin A Funeral##30820 |goto 67.04,33.35
step
talk Mishi##65855
Tell her _"I'm ready to leave."_ |gossip 1
Speak with Mishi in Zouchin Village |q 31228/1 |goto 62.30,29.32
step
Begin Flying to the Isle of Reckoning |invehicle |goto 62.30,29.32 |q 31228
step
Fly to the Isle of Reckoning |outvehicle |goto 76.48,19.38 |q 31228 |notravel
stickystart "Slay_Zandalari_Forces"
step
kill Prophet Khar'zul##61541 |q 31228/2 |goto 76.43,9.05
|tip Jump onto the stone table when the floor turns purple.
step
label "Slay_Zandalari_Forces"
Kill enemies around this area
|tip They look like trolls.
Slay #12# Zandalari Forces |q 31228/3 |goto 76.25,13.40
'|kill Amani Outrider##64639, Gurubashi Witch Doctor##64631, Gurubashi Worshipper##64642, Gurubashi Headsplitter##64643
step
talk Lorewalker Cho##63784
|tip Inside the building.
turnin Prophet Khar'zul##31228 |goto 62.32,29.06
step
talk Brother Lintpocket##59701
accept The Burlap Trail: To Burlap Waystation##30592 |goto 58.09,61.47
step
Locate the Grummles
|tip They look like a group of small friendly npc's that walk along this road heading west.
|tip They appear at this location when they die, if they aren't protected.
|tip You can either wait here until they appear, or you can try to find them along the road.
Click Here After You Locate the Grummles |confirm |goto 58.13,61.46 |q 30592
step
Escort the Grummles to the Burlap Waystation |q 30592/1 |goto 52.92,66.58
|tip Follow the Grummles and protect them as they walk.
|tip They eventually walk to this location.
step
talk Brother Trailscenter##59703
turnin The Burlap Trail: To Burlap Waystation##30592 |goto 51.66,67.83
accept The Rabbitsfoot##30602 |goto 51.66,67.83
step
talk Brother Rabbitsfoot##59806
Rescue Brother Rabbitsfoot |q 30602/1 |goto 49.10,70.45
step
talk Brother Rabbitsfoot##59806
accept The Broketooth Ravage##30603 |goto 49.10,70.45
step
kill Mo Mo##59805
|tip Inside the small cave up on the mountain.
collect Rabbitsfoot's Luckydo##81137 |q 30603/1 |goto 48.02,73.27
step
talk Brother Rabbitsfoot##59452
turnin The Rabbitsfoot##30602 |goto 51.97,67.21
turnin The Broketooth Ravage##30603 |goto 51.97,67.21
accept A Monkey Idol##30599 |goto 51.97,67.21
accept No Pack Left Behind##30600 |goto 51.97,67.21
accept Breaking Broketooth##30604 |goto 51.97,67.21
stickystart "Collect_Grummlepacks"
stickystart "Kill_Broketooth_Tossers"
stickystart "Kill_Broketooth_Chargers"
step
kill Hateful Ko Ko##59430
|tip He walks around this area.
collect Corpse of Ko Ko##80429 |goto 52.37,71.40 |q 30599
step
click Ko Ko's Altar##211275
Destroy Ko Ko's Altar |q 30599/2 |goto 52.26,71.43
step
Enter the cave |goto 52.85,71.46 < 15 |walk
kill Dak Dak##59424
|tip He looks like a larger armored monkey that along this path.
|tip Inside the cave.
collect Corpse Of Dak Dak##80428 |goto Kun-Lai Summit/11 54.57,26.69 |q 30599
step
click Dak Dak's Altar##210931
|tip Downstairs inside the cave.
Destroy Dak Dak's Altar |q 30599/1 |goto Kun-Lai Summit/12 49.55,39.77
step
label "Collect_Grummlepacks"
clicknpc Dead Packer##59896+
|tip They look like grummles laying on the ground.
|tip Inside the cave. |notinsticky
collect 8 Grummlepack##80307 |q 30600/1 |goto 56.46,18.57
step
Leave the cave |goto Kun-Lai Summit/0 52.85,71.46 < 15 |walk |only if subzone("The Deeper") and indoors()
kill Tak Tak##59958
|tip He walks around this area.
collect Corpse of Tak Tak##80430 |goto Kun-Lai Summit/0 56.74,70.98 |q 30599
step
click Tak Tak's Altar##211276
Destroy Tak Tak's Altar |q 30599/3 |goto 56.83,70.98
step
label "Kill_Broketooth_Tossers"
kill 6 Broketooth Tosser##59416 |q 30604/2 |goto 52.85,71.46
|tip They look like monkeys carrying small daggers.
|tip Inside and outside the cave. |notinsticky
step
label "Kill_Broketooth_Chargers"
kill 8 Broketooth Charger##59414 |q 30604/1 |goto 52.85,71.46
|tip They look like monkeys carrying spears.
|tip Inside and outside the cave. |notinsticky
step
talk Brother Rabbitsfoot##59452
turnin A Monkey Idol##30599 |goto 51.97,67.21
turnin No Pack Left Behind##30600 |goto 51.97,67.21
accept Bros before Hozen##30605 |goto 51.97,67.21
turnin Breaking Broketooth##30604 |goto 51.97,67.21
step
clicknpc Mok Mok##60008
|tip On top of the hill.
Rescue Brother Yakshoe |q 30605/1 |goto 50.53,64.19
step
talk Brother Yakshoe##59894
turnin Bros before Hozen##30605 |goto 50.57,64.07
accept Hozen Love Their Keys##30607 |goto 50.57,64.07
accept The Snackrifice##30608 |goto 50.57,64.07
accept Thumping Knucklethump##30606 |goto 50.57,64.07
stickystart "Rescue_Imprisoned_Grummles"
stickystart "Slay_Silverback_Hozens"
step
Enter the cave |goto 50.30,61.67 < 15 |walk
kill Cho Cho the Wicked##60090
|tip He walks around this area inside the cave.
collect Yeti Shackle Key##80535 |q 30607/1 |goto Kun-Lai Summit/10 33.44,13.54
step
click Ball and Chain##207079
|tip It looks like a large grey ball next to a huge yeti.
|tip Inside the cave.
Release Old Poot Poot |q 30607/2 |goto 42.71,26.48
step
Begin Returning to Brother Yakshoe |invehicle |goto 42.71,26.48 |q 30607
step
Watch the dialogue
Return to Brother Yakshoe |outvehicle |goto Kun-Lai Summit/0 52.09,67.42 |q 30607 |notravel
stickystop "Rescue_Imprisoned_Grummles"
stickystop "Slay_Silverback_Hozens"
step
talk Brother Yakshoe##59894
turnin Hozen Love Their Keys##30607 |goto Kun-Lai Summit/0 52.02,67.18
stickystart "Slay_Silverback_Hozens"
step
label "Rescue_Imprisoned_Grummles"
clicknpc Prisoner Bindings##60027+
|tip They look like ropes tied to Imprisoned Grummles hanging from trees.
click Grummle Cage##211307+
|tip They look like wooden cages.
|tip Inside and outside the cave. |notinsticky
Rescue #5# Imprisoned Grummles |q 30608/1 |goto 50.30,61.67
step
label "Slay_Silverback_Hozens"
Kill Knucklethump enemies around this area
|tip They look like monkeys.
|tip Inside and outside the cave. |notinsticky
Slay #8# Silverback Hozens |q 30606/1 |goto 50.30,61.67
'|kill Knucklethump Smasher##59410, Knucklethump Jibstabber##59412
step
talk Brother Yakshoe##59894
turnin The Snackrifice##30608 |goto 52.02,67.18
accept Grummle! Grummle! Grummle!##30610 |goto 52.02,67.18
step
talk Brother Rabbitsfoot##59452
turnin Thumping Knucklethump##30606 |goto 51.97,67.21
accept Unleash The Yeti!##30611 |goto 51.97,67.21
stickystart "Pack_Packers"
step
kill 4 Cagemaster##60169 |q 30611/1 |goto 46.10,64.11
|tip Around the perimeter of the huge cage.
step
label "Pack_Packers"
click Grummle Gear##211686+
|tip They look like wooden boxes.
Pack #5# Packers |q 30610/1 |goto 46.10,64.11
step
talk Brother Yakshoe##59894
turnin Grummle! Grummle! Grummle!##30610 |goto 45.94,64.05
step
talk Brother Rabbitsfoot##59452
turnin Unleash The Yeti!##30611 |goto 45.91,64.05
accept The Leader Hozen##30612 |goto 45.91,64.05
step
Watch the dialogue
Enrage Chomp Chomp |q 30612/1 |goto 46.01,63.25
step
Watch the dialogue
kill The Ook of Dook##60188 |q 30612/2 |goto 46.01,63.25
step
talk Brother Rabbitsfoot##59452
turnin The Leader Hozen##30612 |goto 51.97,67.21
step
talk Brother Trailscenter##59703
accept The Burlap Trail: To Kota Basecamp##30692 |goto 51.66,67.83
step
Locate the Grummles
|tip They look like a group of small friendly npc's that walk along this road heading west.
|tip They appear at this location when they die, if they aren't protected.
|tip You can either wait here until they appear, or you can try to find them along the road.
Click Here After You Locate the Grummles |confirm |goto 51.69,67.70 |q 30692
step
Escort the Grummles to the Kota Basecamp |q 30692/1 |goto 43.76,68.91
|tip Follow the Grummles and protect them as they walk.
|tip They eventually walk to this location.
step
talk Uncle Eastwind##60416
fpath Kota Basecamp |goto 42.81,69.63
step
talk Clover Keeper##60420
home Kota Basecamp |goto 42.67,69.76 |q 30742 |future
step
talk Cousin Gootfur##60596
|tip He walks around this area.
accept Shut it Down##30742 |goto 42.34,69.78
accept Gourmet Kafa##30743 |goto 42.34,69.78
step
talk Uncle Keenbean##60503
accept Kota Blend##30744 |goto 42.42,69.66
accept Trouble Brewing##30745 |goto 42.42,69.66
step
talk Brother Oilyak##59755
turnin The Burlap Trail: To Kota Basecamp##30692 |goto 42.45,68.91
stickystart "Collect_Kafakota_Berries"
stickystart "Kill_Kafa_Crazed_Mountain_Goats"
stickystart "Mark_Kafagoot_Deposits"
step
Follow the path of flags up the mountain |goto 41.66,71.41 < 20 |only if walking
kill 8 Kafa-Crazed Yeti##60564 |q 30745/1 |goto 37.32,77.82
|tip Inside and outside the cave, up on the mountain.
step
label "Collect_Kafakota_Berries"
click Kafa'kota Bush##211454+
|tip They look like small bushes with red berries on them.
|tip All over the mountain. |notinsticky
click Kafa'kota Berries##211480+
|tip They look like small piles of red berries.
|tip Inside the cave, up on the mountain. |notinsticky
collect 100 Kafa'kota Berry##81054 |q 30744/1 |goto 37.32,77.82
step
_Click the Complete Quest Box:_
turnin Kota Blend##30744
accept A Fair Trade##30746
step
label "Kill_Kafa_Crazed_Mountain_Goats"
Leave the cave |goto 37.32,77.82 < 15 |walk |only if subzone("Kota Peak") and indoors()
kill 12 Kafa-Crazed Mountain Goat##60493 |q 30742/1 |goto 38.47,78.31
|tip All over the mountain. |notinsticky
step
label "Mark_Kafagoot_Deposits"
click Kafa'goot "Deposit"##211456+
|tip They look like small piles of poop.
|tip All over the mountain. |notinsticky
Mark #15# Kafa'goot "Deposits" |q 30743/1 |goto 38.47,78.31
step
Enter the cave higher up on the mountain |goto 37.15,75.98 < 15 |walk
talk Nephew Burrberry##60679
|tip Inside the small cave.
turnin A Fair Trade##30746 |goto 36.93,76.22
step
Watch the dialogue
|tip Inside the small cave.
Ride with Kota Kon |invehicle |goto 36.93,76.22 |q 30742
step
Return to Kota Basecamp |outvehicle |goto 42.68,70.09 |q 30742 |notravel
step
talk Uncle Keenbean##60503
turnin Trouble Brewing##30745 |goto 42.53,69.43
step
talk Nephew Burrberry##60679
accept The Burlap Grind##30747 |goto 42.52,69.34
step
talk Cousin Gootfur##60596
turnin Shut it Down##30742 |goto 42.46,69.35
turnin Gourmet Kafa##30743 |goto 42.46,69.35
step
talk Kota Kon##60587
Choose _<Unscrew the flask and offer it to her.>_ |gossip 1
Ride with Kota Kon |invehicle |goto 42.62,69.16 |q 30747
step
Kill enemies around this area
|tip They look like monkeys.
|tip Use the abilities on your action bar.
Slay #100# Burlap Trail Hozens |q 30747/1 |goto 48.80,68.13
If Kota Kon dies, you can get her again at [42.62,69.16]
'|kill Broketooth Ravager##60743, Silverback Smasher##60749, Ookin Shaman##60752, Ookin Marauder##60753, Silverback Piker##60746, Broketooth Leaper##60742
step
Stop Riding with Kota Kon |outvehicle |q 30747
|tip Get to a safe place first.
|tip Click the arrow on your action bar.
step
talk Nephew Burrberry##60679
turnin The Burlap Grind##30747 |goto 42.52,69.34
step
talk Sunwalker Dezco##64853
Tell him _"There's only one way to find out..."_ |gossip 1
Speak with Dezco at the Gate of the August Celestials |q 31511/1 |goto 56.18,91.56
step
talk Tania Summerbreeze##61122
fpath Shrine of Two Moons |goto Vale of Eternal Blossoms/0 62.85,21.79
step
talk Madam Vee Luo##62996
|tip Inside the building.
turnin A Witness to History##31511 |goto Shrine of Two Moons/1 68.45,47.64
step
talk Shado-Master Chong##60161
|tip Inside the building.
|tip Click the red doors to enter the building.
turnin The Shado-Pan##31453 |goto Kun-Lai Summit/0 44.48,89.93
accept Turnabout##30670 |goto Kun-Lai Summit/0 44.48,89.93
accept The Defense of Shado-Pan Fallback##30665 |goto Kun-Lai Summit/0 44.48,89.93
step
talk Kite Master Ni##61473
|tip Outside the building, up on the wall.
|tip Run up the stairs inside the building to find her.
fpath Shado-Pan Fallback |goto 43.91,89.54
stickystart "Collect_Blind_Rage_Essences"
stickystart "Kill_Sha_Infested_Yaungols"
step
talk Sya Zhong##60178
|tip Inside the building.
accept Holed Up##30682 |goto 42.93,88.31
step
Rescue Sya Zhong |q 30682/4 |goto 42.93,88.31
step
talk Ya Firebough##60189
|tip Inside the building.
Tell him _"...That's enough. Let's go"._ |gossip 1
Rescue Ya Firebough |q 30682/2 |goto 41.04,86.96
step
talk Old Lady Fung##60190
|tip Inside the building.
Tell her _"Yes... why don't you "escort" me out of here."_ |gossip 1
Rescue Old Lady Fung |q 30682/3 |goto 42.84,85.70
step
talk Jin Warmkeg##60187
|tip Inside the building.
Tell him _"Let's get out of here."_ |gossip 1
Rescue Jin Warmkeg |q 30682/1 |goto 43.87,86.17
step
label "Collect_Blind_Rage_Essences"
kill Blind Rage##61224+
|tip They look like shadow aliens.
collect 5 Blind Rage Essence##81713 |q 30670/1 |goto 43.31,87.02
step
label "Kill_Sha_Infested_Yaungols"
kill 15 Sha-Infested Yaungol##60164 |q 30665/1 |goto 44.82,87.44
|tip They look like grey tauren.
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Turnabout##30670 |goto 44.48,89.93
turnin The Defense of Shado-Pan Fallback##30665 |goto 44.48,89.93
turnin Holed Up##30682 |goto 44.48,89.93
accept Unmasking the Yaungol##30690 |goto 44.48,89.93
step
use the Blinding Rage Trap##81741
|tip Lure Kobai into it after you use it.
|tip He walks around this area.
|tip Use the "Steal Mask" ability on Kobai after you lure him into the trap.
|tip It appears as a button on the screen.
Lure Kobai into the Trap and Steal His Mask |q 30690/1 |goto 45.51,86.32
|tip You will be attacked.
'|kill Kobai##61303
step
kill Malevolent Fury##61333 |q 30690/2 |goto 45.51,86.32
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Unmasking the Yaungol##30690 |goto 44.48,89.93
accept To Winter's Blossom##30699 |goto 44.48,89.93
step
talk Lin Silentstrike##61816
turnin To Winter's Blossom##30699 |goto 34.95,59.40
accept Honor, Even in Death##30723 |goto 34.95,59.40
step
talk Ban Bearheart##61819
accept A Line Unbroken##30715 |goto 35.12,59.65
step
talk Kite Master Len##61512
fpath Winter's Blossom |goto 34.54,59.12
stickystart "Kill_Kun_Lai_Corpsepickers"
step
clicknpc Shado-Master Zhiyao##61808
Release Shado-Master Zhiyao from His Oath |q 30715/1 |goto 30.34,60.05
step
clicknpc Liu of the Thousand Blows##61806
Release Liu of the Thousand Blows from His Oath |q 30715/2 |goto 30.18,62.47
step
clicknpc Shiya Boldblade##61810
Release Shiya Boldblade from Her Oath |q 30715/3 |goto 29.97,64.44
step
label "Kill_Kun_Lai_Corpsepickers"
kill 12 Kun-Lai Corpsepicker##61843 |q 30723/1 |goto 30.85,62.22
|tip They look like birds on the ground and flying around.
step
talk Ban Bearheart##61819
turnin A Line Unbroken##30715 |goto 35.12,59.65
step
talk Lin Silentstrike##61816
turnin Honor, Even in Death##30723 |goto 34.95,59.30
accept To the Wall!##30724 |goto 34.95,59.30
step
talk Kite Master Len##61512
Tell him _"I need a kite to get up to the wall!"_ |gossip 1
Speak to Kite-Master Len to Take a Kite to the Wall |q 30724/1 |goto 34.54,59.12
step
Begin Traveling to Serpent's Spine |invehicle |goto 34.54,59.12 |q 30724
step
Travel to Serpent's Spine |outvehicle |goto 29.30,62.32 |q 30724 |notravel
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin To the Wall!##30724 |goto 29.30,62.29
accept Off the Wall!##30750 |goto 29.30,62.29
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
accept A Terrible Sacrifice##30751 |goto 29.24,62.30
stickystart "Slay_Veteran_Archers_Or_Fire_Warriors"
step
click Yaungol Oil Barrel##212003+
|tip They look like large blue and brown pots.
collect 6 Yaungol Oil Barrel##82799 |q 30751/1 |goto 27.53,60.70
step
label "Slay_Veteran_Archers_Or_Fire_Warriors"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #12# Veteran Archers or Fire-Warriors |q 30750/1 |goto 27.53,60.70
'|kill Osul Fire-Warrior##63576, Osul Veteran Archer##61886
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
turnin A Terrible Sacrifice##30751 |goto 29.24,62.30
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin Off the Wall!##30750 |goto 29.30,62.29
accept Lao-Chin's Gambit##30994 |goto 29.30,62.29
step
talk Suna Silentstrike##61454
|tip Inside the building.
Tell her _"Alright, I'm ready to get back to the front."_ |gossip 1
Talk with Suna Silentstrike to Take a Kite to Lao-Chin |q 30994/1 |goto 29.30,62.29
step
Begin Returning to Winter's Blossom |invehicle |goto 29.30,62.29 |q 30994
step
Return to Winter's Blossom |outvehicle |goto 31.85,60.18 |q 30994 |notravel
step
talk Lao-Chin the Iron Belly##61820
turnin Lao-Chin's Gambit##30994 |goto 31.82,60.11
accept Do a Barrel Roll!##30991 |goto 31.82,60.11
step
clicknpc Keg Bomb##60553
|tip Use the ability on your action bar near enemies as you roll down the hill.
|tip Do this repeatedly.
kill 50 Osul Invader##60455 |q 30991/1 |goto 32.06,60.58
kill 4 Osul Treelauncher##60483 |q 30991/2 |goto 32.06,60.58
step
talk Lao-Chin the Iron Belly##61820
turnin Do a Barrel Roll!##30991 |goto 31.82,60.11
accept Finish This!##30992 |goto 31.82,60.11
step
kill Gong Da##62165
|tip He runs around this area.
Complete the Battle for The Ox Gate |q 30992/1 |goto 31.19,61.76
step
talk Ban Bearheart##61819
turnin Finish This!##30992 |goto 31.29,61.50
accept Where are My Reinforcements?##30993 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"I'm ready to leave. Let's go!"_ |gossip 1
Tell Ban You are Ready to Leave |q 30993/1 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"Alright, let's go up to the monastery."_ |gossip 1
Ride Ban's Balloon to the Shado-Pan Monastery |q 30993/2 |goto 33.96,58.61
step
talk Ban Bearheart##61819
turnin Where are My Reinforcements?##30993 |goto 35.31,49.55
accept Unbelievable!##30752 |goto 35.31,49.55
step
talk Shado-Pan Sentinel##62220
Tell him _"I am here with Ban Bearheart, and we demand an audience with Taran Zhu!"_ |gossip 1
Watch the dialogue
kill Shado-Pan Sentinel##62220
Gain Access to the Monastery |q 30752/1 |goto 36.69,47.72
step
_Next to you:_
talk Ban Bearheart##61819
turnin Unbelievable!##30752
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Townlong Steppes (30-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."TownlongSteppes",
next="Leveling Guides\\Pandaria Remix (10-70)\\Dread Wastes (35-70)",
condition_suggested=function() return level >= 30 and level <= 70 and not completedq(30928) end,
startlevel=30,
endlevel=70,
pandariaremix=true,
},[[
step
talk Taran Zhu##60688
turnin Beyond the Wall##31695 |goto Townlong Steppes/0 71.15,56.69 |only if haveq(31695) or completedq(31695)
accept A Foot in the Door##30814 |goto Townlong Steppes/0 71.15,56.69
step
talk Kite Master Wong##62901
fpath Longying Outpost |goto 71.08,57.31
step
talk Saito the Sleeping Shadow##62873
|tip Inside the building.
home Longying Outpost |goto 71.07,57.92 |q 30814 |future
step
kill 8 Osul Charger##60713 |q 30814/1 |goto 70.00,53.66
|tip They look like tauren.
step
talk Taran Zhu##60688
turnin A Foot in the Door##30814 |goto 71.15,56.69
accept First Assault##30769 |goto 71.15,56.69
accept Running Rampant##30770 |goto 71.15,56.69
accept Perfect Pitch##30771 |goto 71.15,56.69
stickystart "Kill_Osul_Sharphorns"
stickystart "Collect_Dark_Pitches"
step
clicknpc Long-Haired Yak##60669+
|tip They look like brown bisons.
clicknpc Steppebeast##60739+
|tip They look like blue dinosaurs.
Free #8# Yaks or Steppebeasts |q 30770/1 |goto 68.64,52.01
step
label "Kill_Osul_Sharphorns"
kill 6 Osul Sharphorn##60647 |q 30769/1 |goto 68.25,53.38
|tip They look like tauren.
step
label "Collect_Dark_Pitches"
click Pitch Pot##211507+
|tip They look like brown and blue pots.
collect 8 Dark Pitch##81174 |q 30771/1 |goto 68.25,53.38
step
talk Suna Silentstrike##60684
turnin First Assault##30769 |goto 67.25,52.22
step
talk Ban Bearheart##60687
turnin Running Rampant##30770 |goto 67.20,52.27
turnin Perfect Pitch##30771 |goto 67.20,52.27
accept Pitching In##30773 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Seeing Red##30772 |goto 67.25,52.22
accept Ranger Rescue##30774 |goto 67.25,52.22
stickystart "Destroy_Osul_Ballistas"
stickystart "Rescue_Longying_Rangers"
stickystart "Slay_Osul_Marauders"
step
talk Katak the Defeated##60735
accept The Exile##30775 |goto 67.00,51.41
step
kill Battat##60728 |q 30775/1 |goto 65.70,51.65
|tip Inside the building.
step
kill Urang##60725 |q 30775/2 |goto 64.79,50.13
|tip Inside the building.
step
talk Lin Silentstrike##60899
Choose _"Examine the body."_
Free Lin Silentstrike |q 30774/3 |goto 66.59,49.16
step
kill Ku-Tong##60726 |q 30775/3 |goto 66.96,48.24
|tip Inside the building.
step
label "Destroy_Osul_Ballistas"
use Ban's Explosives##81193
|tip Use it on Osul Ballistas.
|tip They look like smaller wooden machines with wheels.
Destroy #6# Osul Ballistas |q 30773/1 |goto 66.87,49.81
step
label "Rescue_Longying_Rangers"
Kill Osul enemies around this area
|tip They look like tauren.
collect Stone Key##81178+ |n
click Drywood Cage+
|tip They look like small brown wooden buildings.
Rescue #4# Longying Rangers |q 30774/2 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
label "Slay_Osul_Marauders"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #8# Osul Marauders |q 30772/1 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
talk Katak the Defeated##60735
turnin The Exile##30775 |goto 67.00,51.41
step
talk Ban Bearheart##60687
turnin Pitching In##30773 |goto 67.20,52.27
turnin Seeing Red##30772 |goto 67.20,52.27
turnin Ranger Rescue##30774 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Jung Duk##30776 |goto 67.25,52.22
step
click Ceremonial Pile##211524
kill Jung Duk##60801 |q 30776/1 |goto 66.66,51.01
step
talk Ban Bearheart##60687
turnin Jung Duk##30776 |goto 71.02,56.56
accept In Search of Suna##30777 |goto 71.02,56.56
step
clicknpc Shado-Pan Caravan##61205
Begin Traveling to Hatred's Vice |invehicle |goto 70.70,56.53 |q 30777
step
Watch the dialogue
Travel to Hatred's Vice |outvehicle |goto 82.44,73.51 |q 30777 |notravel
step
talk Ban Bearheart##61261
turnin In Search of Suna##30777 |goto 82.68,73.02
accept Dust to Dust##30778 |goto 82.68,73.02
accept Slaying the Scavengers##30779 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept Totemic Research##30780 |goto 82.59,73.02
step
talk Xiao Tu##60903
accept Last Toll of the Yaungol##30781 |goto 82.71,73.17
stickystart "Collect_Palewind_Totems"
stickystart "Kill_Ashfang_Hyenas"
stickystart "Burn_Palewind_Villagers"
step
Watch the dialogue
Examine the Southern Smoke Trail |q 30781/3 |goto 83.51,78.49
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Eastern Smoke Trail |q 30781/1 |goto 84.83,71.50
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Northwestern Smoke Trail |q 30781/4 |goto 84.02,70.89
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Western Smoke Trail |q 30781/2 |goto 81.29,72.13
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
label "Collect_Palewind_Totems"
click Palewind Totem##211566+
|tip They look like short wooden totem poles with horned skulls on them.
collect 9 Palewind Totem##81355 |q 30780/1 |goto 83.03,74.05
step
label "Kill_Ashfang_Hyenas"
kill 12 Ashfang Hyena##60932 |q 30779/1 |goto 83.03,74.05
step
label "Burn_Palewind_Villagers"
use the Shado-Pan Torch##81356
|tip Use it on Palewind Villagers.
|tip They look like tauren laying on the ground.
Burn #20# Palewind Villagers |q 30778/1 |goto 83.03,74.05
step
talk Yalia Sagewhisper##60864
turnin Totemic Research##30780 |goto 82.59,73.02
step
talk Ban Bearheart##61261
turnin Dust to Dust##30778 |goto 82.68,73.02
turnin Slaying the Scavengers##30779 |goto 82.68,73.02
turnin Last Toll of the Yaungol##30781 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept What Lies Beneath##30827 |goto 82.59,73.02
step
talk Yalia Sagewhisper##60864
Tell her _"I am ready to begin the ritual."_ |gossip 1
Speak to Yalia Sagewhisper |q 30827/1 |goto 82.59,73.02
step
Watch the dialogue
clicknpc Totem of Tranquility##60990
Activate the Totem of Tranquility |q 30827/3 |goto 82.41,73.56
step
clicknpc Totem of Serenity##60991
Activate the Totem of Serenity |q 30827/4 |goto 82.69,73.63
step
clicknpc Totem of Kindness##60933
Activate the Totem of Kindness |q 30827/2 |goto 82.58,73.25
step
Watch the dialogue
Complete the Ritual |q 30827/5 |goto 82.58,73.25
step
talk Yalia Sagewhisper##60864
turnin What Lies Beneath##30827 |goto 82.59,73.02
accept Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept Spiteful Spirits##30782 |goto 82.68,73.02
stickystart "Kill_Spiteful_Spirits"
step
use the Totem of Harmony##81417
|tip Use it on Crazed Shado-Pan Rangers.
|tip They looke like pandas in black armor.
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen.
kill Seething Hatred##61054+
Purify #8# Crazed Shado-Pan Rangers |q 30783/1 |goto 83.29,73.65
step
label "Kill_Spiteful_Spirits"
use the Totem of Harmony##81417 |notinsticky
|tip Use it on the ground as you walk around. |notinsticky
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen. |notinsticky
kill 10 Spiteful Spirit##63839 |q 30782/1 |goto 83.29,73.65
|tip They look like tauren ghosts.
step
talk Ban Bearheart##61261
turnin Spiteful Spirits##30782 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
turnin Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept The Point of No Return##30784 |goto 82.68,73.02
step
use the Totem of Harmony##81430
|tip Use it on the ground.
|tip Stand in the circles on the ground to gain a buff.
kill Suna Silentstrike##61055
|tip Inside the building.
|tip She will eventually surrender.
Find Suna Silentstrike |q 30784/1 |goto 84.08,70.54
step
talk Ban Bearheart##61261
turnin The Point of No Return##30784 |goto 82.68,73.02
accept Gao-Ran Battlefront##30785 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept A Delicate Balance##31894 |goto 82.59,73.02
step
talk Orbiss##60857
turnin A Delicate Balance##31894 |goto 67.94,67.67
accept A Spear Through My Side, A Chain Through My Soul##30786 |goto 67.94,67.67
step
kill Dmong Naruuk##60683 |q 30786/1 |goto 68.42,71.46
|tip Up on the cliff.
step
talk Orbiss##60857
turnin A Spear Through My Side, A Chain Through My Soul##30786 |goto 67.94,67.67
accept The Torches##30787 |goto 67.94,67.67
step
kill Osul Mist-Shaman##60697+
|tip Kill the ones next to Mist-Shaman's Torches.
|tip They look like poles with fire at the top of them.
clicknpc Mist-Shaman's Torch##60698+
collect 6 Mist-Shaman's Torch##81176 |q 30787/1 |goto 65.81,68.87
step
talk Orbiss##60857
turnin The Torches##30787 |goto 67.94,67.67
accept Golgoss##30788 |goto 67.94,67.67
accept Arconiss##30789 |goto 67.94,67.67
step
click Peat Clump##211513
Kill the enemies that attack in waves
Summon Golgoss |q 30788/1 |goto 70.51,69.65
'|kill Osul Mistbreaker##60756, Small Swamp Rodent##60758
step
click Peat Mound##211515
Kill the enemies that attack in waves
Summon Arconiss |q 30789/1 |goto 71.49,72.29
'|kill Osul Mistbreaker##60756, Small Swamp Rodent##60758
step
talk Orbiss##60857
turnin Golgoss##30788 |goto 67.94,67.67
turnin Arconiss##30789 |goto 67.94,67.67
accept The Death of Me##30815 |goto 67.94,67.67
step
talk Orbiss##60857
Choose _<Remove the spear from Orbiss' side.>_ |gossip 1
Remove the Spear from Orbiss |q 30815/1 |goto 67.94,67.67
step
talk Orbiss##60622
turnin The Death of Me##30815 |goto 67.94,67.67
accept Golgoss Hungers##30790 |goto 67.94,67.67
accept Arconiss Thirsts##30791 |goto 67.94,67.67
accept Orbiss Fades##30792 |goto 67.94,67.67
stickystart "Collect_Gushing_Mist"
stickystart "Collect_Snarlvines"
step
kill Swamp Rodent##60733+
|tip They look like beavers.
collect 4 Clotted Rodent's Blood##81260 |q 30791/1 |goto 72.85,71.13
step
label "Collect_Gushing_Mist"
Collect #8# Gushing Mist |q 30792/1 |goto 72.85,71.13
|tip Stand in the small clouds of steam.
step
label "Collect_Snarlvines"
click Snarlvine##211518+
|tip They look like small bushes with purple flowers on them.
collect 10 Snarlvine##81250 |q 30790/1 |goto 72.85,71.13
step
talk Orbiss##60622
turnin Golgoss Hungers##30790 |goto 67.94,67.67
turnin Arconiss Thirsts##30791 |goto 67.94,67.67
turnin Orbiss Fades##30792 |goto 67.94,67.67
accept Mists' Opportunity##30793 |goto 67.94,67.67
step
kill Jahesh of Osul##60802 |q 30793/1 |goto 76.68,72.89
step
talk Orbiss##60622
turnin Mists' Opportunity##30793 |goto 76.19,72.91
step
talk Kite Master Nenshi##62903
fpath Gao-Ran Battlefront |goto 74.39,81.46
step
talk Taran Zhu##61066
turnin Gao-Ran Battlefront##30785 |goto 76.42,82.43
accept Behind the Blockade##30884 |goto 76.42,82.43
step
talk Kim the Quiet##62875
home Gao-Ran Battlefront |goto 75.96,82.91 |q 30884 |future
step
talk Septi the Herbalist##61470
accept Treatment for the Troops##30891 |goto 75.86,83.14
stickystart "Collect_Violet_Citrons"
step
talk Taoshi##61469
turnin Behind the Blockade##30884 |goto 76.94,78.79
accept Unwelcome Intruders##30887 |goto 76.94,78.79
stickystart "Kill_Krikthik_Deep_Scouts"
step
label "Collect_Violet_Citrons"
click Violet Citron##211721+
|tip They look like bushes with blue flowers on them.
collect 10 Violet Citron##82342 |q 30891/1 |goto 77.81,77.22
step
label "Kill_Krikthik_Deep_Scouts"
kill 12 Krik'thik Deep-Scout##61374 |q 30887/1 |goto 77.81,77.22
|tip They look like insect people.
step
talk Septi the Herbalist##61470
turnin Treatment for the Troops##30891 |goto 75.86,83.14
step
talk Taoshi##61468
turnin Unwelcome Intruders##30887 |goto 79.46,84.46
accept Breach in the Defenses##30888 |goto 79.46,84.46
accept The Restless Watch##30890 |goto 79.46,84.46
step
talk Mao the Lookout##61467
accept Trap Setting##30889 |goto 79.38,84.44
stickystart "Rearm_Shadow_Pan_Spike_Traps"
stickystart "Kill_Krikthik_Scentlayers"
step
talk Scout Jai-gan##61397
Tell him _"I have orders for you to return to the battlefront."_ |gossip 37888
Deliver Orders to Scout Jai-gan |q 30890/4 |goto 79.01,90.16
step
talk Scout Ying##61396
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37889
Deliver Orders to Scout Ying |q 30890/3 |goto 82.52,89.55
step
talk Scout Long##61395
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37625
Deliver Orders to Scout Long |q 30890/2 |goto 81.27,86.18
step
talk Scout Wei-Chin##61378
Tell him _"I have orders for you to return to the battlefront."_ |gossip 40590
Deliver Orders to Scout Wei-Chin |q 30890/1 |goto 82.21,84.12
step
label "Rearm_Shadow_Pan_Spike_Traps"
clicknpc Shado-Pan Spike Trap##61426+
|tip They look like spiked grey metal balls.
Rearm #8# Shado-Pan Spike Traps |q 30889/1 |goto 80.79,86.06
step
label "Kill_Krikthik_Scentlayers"
use the Shado-Pan Flare##81925
|tip Use it near the moving trails of yellow smoke on the ground.
kill 10 Krik'thik Scentlayer##61373 |q 30888/1 |goto 80.79,86.06
step
talk Mao the Lookout##61467
turnin Trap Setting##30889 |goto 79.38,84.44
step
talk Taoshi##61468
turnin Breach in the Defenses##30888 |goto 79.46,84.46
turnin The Restless Watch##30890 |goto 79.46,84.46
accept Returning from the Pass##30960 |goto 79.46,84.46
step
talk Taran Zhu##61066
turnin Returning from the Pass##30960 |goto 76.42,82.43
accept The Endless Swarm##30893 |goto 76.42,82.43
step
talk Septi the Herbalist##61470
accept Back on Their Feet##30892 |goto 75.86,83.14
accept Rummaging Through the Remains##30894 |goto 75.86,83.14
stickystart "Slay_Krikthik_Attackers"
stickystart "Collect_Krikthik_Limbs"
step
use the Citron-Infused Bandages##82787
|tip Use them on Injured Gao-Ran Blackguards.
|tip They look like pandaren laying on the ground.
Heal #8# Injured Gao-Ran Blackguards |q 30892/1 |goto 74.20,86.57
'|talk Injured Gao-Ran Blackguard##61692
step
label "Slay_Krikthik_Attackers"
Kill Krik'thik enemies around this area
|tip They look like insect people.
Slay #12# Krik'thik Attackers |q 30893/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
label "Collect_Krikthik_Limbs"
Kill Krik'thik enemies around this area
|tip They look like insect people.
click Krik'thik Limb##214820+
|tip They look like insect arms and legs that appear on the ground after you kill Krik'thik enemies.
collect 22 Krik'thik Limb##82722 |q 30894/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
talk Septi the Herbalist##61470
turnin Back on Their Feet##30892 |goto 75.86,83.14
turnin Rummaging Through the Remains##30894 |goto 75.86,83.14
step
talk Taran Zhu##61066
turnin The Endless Swarm##30893 |goto 76.42,82.43
accept Improvised Ammunition##30895 |goto 76.42,82.43
step
talk Initiate Chao##61880
accept In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Initiate Feng##61881
accept Thieves and Troublemakers##30896 |goto 70.45,86.37
stickystart "Slay_Agitated_Root_Sprites"
stickystart "Collect_Volatile_Dread_Orbs"
step
kill Needlebottom##61818
collect Initiate Chao's Sword##82783 |q 30897/1 |goto 63.07,87.68
step
label "Slay_Agitated_Root_Sprites"
Kill Agitated enemies around this area
|tip They look like sprites.
Slay #10# Agitated Root Sprites |q 30896/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
label "Collect_Volatile_Dread_Orbs"
Kill Agitated enemies around this area |notinsticky
|tip They look like sprites. |notinsticky
click Dread Orb##211873+
|tip They look like smaller orange globes on the tree roots on the ground.
collect 16 Volatile Dread Orb##82723 |q 30895/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
talk Initiate Feng##61881
|tip Up on the cliff.
turnin Thieves and Troublemakers##30896 |goto 70.45,86.37
step
talk Initiate Chao##61880
turnin In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Taran Zhu##61066
turnin Improvised Ammunition##30895 |goto 76.42,82.43
accept Cutting the Swarm##30898 |goto 76.42,82.43
step
clicknpc Dragon Launcher##61746
Control the Dragon Launcher |invehicle |goto 74.81,84.69 |q 30898
step
Kill Krik'thik enemies around this area
|tip They look like insect people on the battlefield nearby to the south.
|tip Use the abilities on your action bar.
Slay #50# Krik'thik Drones |q 30898/1 |goto 74.81,84.69
step
talk Taoshi##62444
turnin Cutting the Swarm##30898 |goto 74.23,85.04
accept Terror of the Dread Wastes##30900 |goto 74.23,85.04
step
kill Norvakess##62324 |q 30900/1 |goto 74.18,87.42
|tip Kill the enemies that appear when it burrows in the ground.
'|kill Krik'thik Drone##65636
step
talk Taran Zhu##61066
turnin Terror of the Dread Wastes##30900 |goto 76.42,82.43
accept Along the Southern Front##30901 |goto 76.42,82.43
step
talk Taoshi##62436
turnin Along the Southern Front##30901 |goto 67.32,80.85
accept Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
accept Taking Stock##30971 |goto 67.36,80.68
stickystart "Collect_Shado_Pan_Fire_Arrows"
step
kill 9 Seething Fleshripper##61299 |q 30970/1 |goto 66.00,82.44
|tip They look like scorpions.
step
label "Collect_Shado_Pan_Fire_Arrows"
click Shado-Pan Fire Arrows##212136+
|tip They look like bundles of arrows.
collect 120 Shado-Pan Fire Arrows##83024 |q 30971/1 |goto 66.00,82.44
step
talk Taoshi##62436
turnin Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
turnin Taking Stock##30971 |goto 67.36,80.68
accept Joining the Fight##30972 |goto 67.36,80.68
step
talk Lao-Chin the Iron Belly##61016
turnin Joining the Fight##30972 |goto 61.59,79.35
step
talk Taran Zhu##62273
accept Up In Flames##30973 |goto 61.64,79.32
step
clicknpc Keg Bomb##62192+
|tip They look like wooden barrels on the ground around this area.
|tip Face enemies before you click them.
|tip They look like insect people.
|tip The barrels will roll into enemies and make them weaker, if you aim well.
kill 10 Kor'thik Timberhusk##61355 |q 30973/1 |goto 59.06,80.98
step
talk Taran Zhu##62273
turnin Up In Flames##30973 |goto 61.64,79.32
step
talk Lao-Chin the Iron Belly##61016
accept The Taking of Dusklight Bridge##30975 |goto 61.59,79.35
step
click Tasty Brew##214848+
|tip They look like wooden barrels.
|tip To heal yourself, run through the bubbles that appear.
kill 12 Kor'thik Bloodletter##62680 |q 30975/1 |goto Dread Wastes/0 44.87,9.87
|tip Let Lao-Chin tank the enemies for you.
step
kill Hulking Kor'thik Fleshrender##62686 |q 30975/2 |goto 44.87,9.87
step
talk Taran Zhu##62736
turnin The Taking of Dusklight Bridge##30975 |goto Townlong Steppes/0 61.11,83.06
accept Joining the Hunt##30976 |goto Townlong Steppes/0 61.11,83.06
step
talk Taran Zhu##62274
turnin Joining the Hunt##30976 |goto 54.03,78.06
accept In Skilled Hands##30899 |goto 54.03,78.06
step
talk Rensai Oakhide##62278
accept Grounded Welcome##30977 |goto 53.93,78.12
step
talk Kite Master Li-Sen##62898
fpath Rensai's Watchpost |goto 54.29,79.05
stickystart "Kill_Korthik_Fleetwings"
step
talk Marksman Ye##62573
accept Choking the Skies##31032 |goto 51.26,83.02
stickystart "Burn_Korthik_Fleetwing_Corpses"
step
talk Hawkmaster Nurong##61020
turnin In Skilled Hands##30899 |goto 51.66,87.25
accept Hostile Skies##30978 |goto 51.66,87.25
stickystop "Kill_Korthik_Fleetwings"
stickystop "Burn_Korthik_Fleetwing_Corpses"
step
clicknpc Nurong's Cannon##62747
Control Nurong's Cannon |invehicle |goto 51.67,87.32 |q 30978
step
kill Kor'thik Swarmer##62300+
|tip They look like insect people flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down #50# Korthi'thik Swarmers |q 30978/1 |goto 51.7,87.3
step
kill Voress'thalik##62269
|tip It looks like a huge orange insect flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down Voress'thalik |q 30978/2 |goto 51.7,87.3
step
Stop Controlling Nurong's Cannon |outvehicle |q 30978
|tip Click the arrow on your action bar.
step
talk Hawkmaster Nurong##61020
turnin Hostile Skies##30978 |goto 51.66,87.25
accept Devastation Below##30979 |goto 51.66,87.25
step
kill Voress'thalik##62270 |q 30979/1 |goto 53.77,87.39
|tip It walks around this area.
step
talk Hawkmaster Nurong##62786
turnin Devastation Below##30979 |goto 53.99,86.97
accept Heroes of the Shado-Pan##30980 |goto 53.99,86.97
stickystart "Kill_Korthik_Fleetwings"
step
label "Burn_Korthik_Fleetwing_Corpses"
kill Kor'thik Fleetwing##62128+
|tip They look like insect people.
use the Wu Kao Torch##83768
|tip Use it near their corpses.
Burn #10# Kor'thik Fleetwing Corpses |q 31032/1 |goto 51.36,84.20
step
label "Kill_Korthik_Fleetwings"
kill 12 Kor'thik Fleetwing##62128 |q 30977/1 |goto 51.36,84.20
|tip They look like insect people.
step
talk Marksman Ye##62573
turnin Choking the Skies##31032 |goto 51.26,83.02
step
talk Rensai Oakhide##62278
turnin Grounded Welcome##30977 |goto 53.93,78.12
step
talk Taran Zhu##62274
turnin Heroes of the Shado-Pan##30980 |goto 54.06,77.87
accept Buried Beneath##31065 |goto 54.06,77.87
step
click Wukao Spyglass
Watch the dialogue
Look Through Taoshi's Spyglass |q 31065/1 |goto 53.50,77.41
step
talk Taran Zhu##62274
turnin Buried Beneath##31065 |goto 54.06,77.87
accept Taoshi and Korvexxis##30981 |goto 54.06,77.87
accept Lao-Chin and Serevex##31063 |goto 54.06,77.87
accept Nurong and Rothek##31064 |goto 54.06,77.87
step
talk Rensai Oakhide##62278
accept Thinning the Sik'thik##31687 |goto 53.93,78.12
accept The Search for Restless Leng##31688 |goto 53.93,78.12
stickystart "Search_Sikthik_Cages_And_Find_Restless_Leng"
stickystart "Slay_Sikthik_Mantids"
step
kill Korvexxis##62579 |q 30981/1 |goto 46.60,83.06
|tip An ally will help you fight him.
step
kill Serevex##62580 |q 31063/1 |goto 45.38,77.42
|tip An ally will help you fight him.
step
kill Rothek##62581 |q 31064/1 |goto 39.84,75.59
|tip An ally will help you fight him.
step
label "Search_Sikthik_Cages_And_Find_Restless_Leng"
click Sik'thik Cage##214734+
|tip They look like pointed metal structures with yellow windows.
Search #8# Sik'thik Cages |q 31688/1 |goto 43.32,77.01
Find Restless Leng |q 31688/2 |goto 43.32,77.01
|tip You will find him in the last one you open.
step
label "Slay_Sikthik_Mantids"
Kill Sik'thik enemies around this area
|tip They look like insect people.
Slay #12# Sik'thik Mantids |q 31687/1 |goto 43.32,77.01
'|kill Sik'thik Venomspitter##62575, Sik'thik Vess-Guard##61354, Sik'thik Drone##62576
step
talk Taran Zhu##62275
turnin Taoshi and Korvexxis##30981 |goto 47.48,78.87
turnin Lao-Chin and Serevex##31063 |goto 47.48,78.87
turnin Nurong and Rothek##31064 |goto 47.48,78.87
accept The Sha of Hatred##30968 |goto 47.48,78.87
step
Watch the dialogue
|tip Follow your allies when they enter the building.
kill Sha of Hatred##62541 |q 30968/1 |goto 45.92,82.86
|tip Inside the building beneath the huge tree.
|tip Avoid the circles on the ground.
|tip Kill the enemies it summons.
'|kill Vestige of Hatred##65378
step
talk Taoshi##62802
|tip Inside the building beneath the huge tree.
turnin The Sha of Hatred##30968 |goto 46.12,82.46
step
Leave the building |goto 47.31,79.28 < 15 |walk |only if subzone("Sik'vess Lair") and indoors()
talk Rensai Oakhide##62278
turnin Thinning the Sik'thik##31687 |goto 53.92,78.12
turnin The Search for Restless Leng##31688 |goto 53.92,78.12
step
talk Kite Master Yao-Li##62909
fpath Shado-Pan Garrison |goto 50.08,71.98
step
talk Provisioner Bamfu##61625
|tip He walks around this area.
accept Natural Antiseptic##30922 |goto 49.14,71.32
accept The Field Armorer##30963 |goto 49.14,71.32
accept A Proper Poultice##30964 |goto 49.14,71.32
step
talk Tai Ho##61482
accept The Motives of the Mantid##30921 |goto 49.13,71.24
accept Set the Mantid Back##30923 |goto 49.13,71.24
step
talk Kali the Night Watcher##62874
home Shado-Pan Garrison |goto 48.84,70.83 |q 30921 |future
stickystart "Discover_The_Clues"
stickystart "Collect_Full_Mushan_Bladders"
stickystart "Collect_Mao_Willows"
stickystart "Collect_Rankbite_Shell_Fragments"
step
use the Gunpowder Casks##81891
|tip Go around the huge tree.
Explode the Kri'thik Supplies |q 30923/2 |goto 56.59,54.02
step
use the Gunpowder Casks##81891
Explode the Kri'thik Weapons |q 30923/1 |goto 55.42,53.13
step
label "Discover_The_Clues"
Kill Kri'thik enemies around this area
|tip They look like insect people.
Discover the First Clue |q 30921/1 |goto 56.46,52.65
Discover the Second Clue |q 30921/2 |goto 56.46,52.65
Discover the Third Clue |q 30921/3 |goto 56.46,52.65
Discover the Fourth Clue |q 30921/4 |goto 56.46,52.65
'|kill Kri'thik Screamer##61377, Kri'thik Boneslicer##61376
step
label "Collect_Full_Mushan_Bladders"
Kill Longshadow enemies around this area
|tip They look like dinosaurs.
collect 5 Full Mushan Bladder##82387 |q 30922/1 |goto 60.35,53.59
You can find more around [51.10,63.64]
'|kill Longshadow Bull##66463, Longshadow Mushan##61618
step
label "Collect_Mao_Willows"
click Mao-Willow##211779+
|tip They look like purple plants with white fluffy bulbs at the top of them.
collect 11 Mao-Willow##82389 |q 30964/1 |goto 60.35,53.59
step
label "Collect_Rankbite_Shell_Fragments"
Kill Rankbite enemies around this area
|tip They look like turtles.
collect 120 Rankbite Shell Fragment##82388 |q 30963/1 |goto 60.35,53.59
You can find more around [51.10,63.64]
'|kill Rankbite Ancient##66462, Rankbite Tortoise##61619
step
talk Tai Ho##61482
turnin The Motives of the Mantid##30921 |goto 49.14,71.23
turnin Set the Mantid Back##30923 |goto 49.14,71.23
accept The Wisdom of Niuzao##30924 |goto 49.14,71.23
step
talk Provisioner Bamfu##61625
|tip He walks around this area.
turnin Natural Antiseptic##30922 |goto 49.14,71.32
turnin The Field Armorer##30963 |goto 49.14,71.32
turnin A Proper Poultice##30964 |goto 49.14,71.32
step
talk Ku-Mo##61539
accept My Father's Crossbow##30931 |goto 43.87,65.76
step
kill Et'kil##61540
|tip Outside, behind the building.
collect Father's Crossbow##82332 |q 30931/1 |goto 38.67,65.31
step
talk Ku-Mo##61539
turnin My Father's Crossbow##30931 |goto 43.87,65.76
step
talk Sentinel Commander Qipan##61584
|tip At the top of the stairs.
accept Father's Footsteps##30932 |goto 39.41,61.96
step
talk Ogo the Younger##61581
turnin The Wisdom of Niuzao##30924 |goto 39.33,62.22
accept Niuzao's Price##30925 |goto 39.33,62.22
step
talk Bluesaddle##61161
accept Bad Yak##30929 |goto 39.21,62.01
step
clicknpc Ruthers##61163
Gently Pet Ruthers |q 30929/1 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Offer Ruthers an Apple |q 30929/2 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Lightly Nudge Ruthers |q 30929/3 |goto 39.27,61.93
step
clicknpc Ruthers##61163
Attempt to Mount Ruthers |q 30929/4 |goto 39.27,61.93
step
talk Bluesaddle##61161
turnin Bad Yak##30929 |goto 39.21,62.01
step
clicknpc Sentinel Yalo##61683
|tip He walks around this area.
Find Sentinel Yalo |q 30932/4 |goto 39.19,61.07
step
click Father's Shield##211836
|tip At the top of the stairs.
Find Father's Shield |q 30932/2 |goto 37.54,61.37
step
click Father's Bedroll##211837
|tip Inside the building at the top of the temple.
Find Father's Bedroll |q 30932/1 |goto 37.36,60.90
step
clicknpc Ha-Cha##61685
|tip At the top of the temple.
Find Ha-Cha |q 30932/3 |goto 37.66,63.95
step
talk Ku-Mo##61539
|tip At the top of the stairs.
turnin Father's Footsteps##30932 |goto 39.45,61.93
step
talk Bluesaddle##61161
accept Pick a Yak##30930 |goto 35.40,56.65
step
use the Yak Lasso##82468
|tip Use it on Wild Townlong Yaks.
|tip They look like bison.
|tip You can find them all around the pond.
kill Wild Townlong Yak##61635+
|tip Most will run away, but one of them will eventually be suitable.
Find a Suitable Yak |q 30930/1 |goto 36.13,52.22
step
talk Bluesaddle##61161
turnin Pick a Yak##30930 |goto 35.40,56.65
step
Kill Sra'thik enemies around this area
|tip They look like insect people.
Find the Statuette Head |q 30925/1 |goto 41.86,46.06
Find the Statuette Body |q 30925/2 |goto 41.86,46.06
Find the Statuette Legs |q 30925/3 |goto 41.86,46.06
Find the Statuette Tail |q 30925/4 |goto 41.86,46.06
'|kill Sra'thik Guard##61518, Sra'thik Wound-Mender##61517, Sra'thik Wound-Mender##61517, Sra'thik Drone##61516
step
talk Ogo the Younger##61581
|tip At the top of the stairs.
turnin Niuzao's Price##30925 |goto 39.34,62.21
step
talk Ogo the Elder##61580
accept The Terrible Truth##30926 |goto 39.35,62.29
step
talk Yak-Keeper Kyana##61585
accept A Trail of Fear##30928 |goto 39.15,62.07
step
talk Sentinel Commander Qipan##61584
accept Give Them Peace##30927 |goto 39.41,61.96
step
Find the Catacombs |q 30926/1 |goto 33.12,61.56
|tip At the entrance of the cave.
stickystart "Give_Fear_Stricken_Sentinels_Peace"
stickystart "Kill_Dreadlings"
step
Enter the cave |goto 33.12,61.56 < 30 |walk
Investigate the Niuzao Catacombs |q 30926/2 |goto Townlong Steppes/13 60.71,40.22
|tip Inside the cave.
step
kill Dread Shadow##62307 |q 30926/3 |goto 50.25,24.92
|tip Inside the cave.
step
talk Tai Ho##61482
|tip Inside the cave.
turnin The Terrible Truth##30926 |goto 56.15,20.22
step
label "Give_Fear_Stricken_Sentinels_Peace"
clicknpc Fear-Stricken Sentinel##62276+
|tip They look like armored pandaren laying on the ground.
|tip Inside the cave. |notinsticky
Give #10# Fear-Stricken Sentinels Peace |q 30927/1 |goto Townlong Steppes/0 33.12,61.56
step
label "Kill_Dreadlings"
kill 12 Dreadling##62306 |q 30928/1 |goto 33.12,61.56
|tip They look like larger shadow aliens.
|tip Inside the cave. |notinsticky
step
Leave the cave |goto 33.12,61.56 < 30 |walk |only if subzone("Niuzao Catacombs") and indoors()
talk Sentinel Commander Qipan##61584
|tip At the top of the stairs.
turnin Give Them Peace##30927 |goto 39.41,61.96
step
talk Yak-Keeper Kyana##61585
turnin A Trail of Fear##30928 |goto 39.15,62.07
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Dread Wastes (35-70)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."DreadWastes",
condition_suggested=function() return level >= 35 and level <= 70 and not completedq(31179) end,
startlevel=35,
endlevel=70,
pandariaremix=true,
},[[
step
talk Kite Master Len##61512
accept Better Dead than Dread##31847 |goto Kun-Lai Summit/0 34.54,59.12
step
talk Kite Master Len##61512
fpath Serpent's Spine |goto 34.54,59.12
step
talk Bowmistress Li##62112
turnin Better Dead than Dread##31847 |goto Vale of Eternal Blossoms/0 14.15,76.96 |only if haveq(31847) or completedq(31847)
accept Falling Down##31001 |goto Vale of Eternal Blossoms/0 14.15,76.96
accept Nope##31002 |goto Vale of Eternal Blossoms/0 14.15,76.96
step
click Shado-Pan Rope
Climb Down the Wall |invehicle |goto 14.20,76.73 |q 31001
|only if walking
stickystart "Destroy_Dreadspinner_Eggs"
step
kill 6 Dreadspinner Tender##61981 |q 31002/2 |goto Dread Wastes/0 72.96,22.81
|tip They look like spiders.
You can find more around [Dread Wastes/0 71.72,27.95]
step
label "Destroy_Dreadspinner_Eggs"
use the Shado-Pan Dragon Gun##82807
|tip Use it on Dreadspinner Eggs.
|tip They look like clusters of white spider eggs.
Destroy #20# Dreadspinner Eggs |q 31002/1 |goto 72.96,22.81
You can find more around [71.72,27.95]
step
talk Marksman Lann##62166
Find Marksman Lann |q 31001/1 |goto 72.56,28.67
step
talk Marksman Lann##62166
turnin Falling Down##31001 |goto 72.56,28.67
turnin Nope##31002 |goto 72.56,28.67
accept Psycho Mantid##31003 |goto 72.56,28.67
step
kill Adjunct Kree'zot##62301 |q 31003/1 |goto 73.47,27.48
|tip Inside the small cave.
step
talk Klaxxi'va Tik##62203
|tip Inside the small cave.
turnin Psycho Mantid##31003 |goto 73.67,27.58
accept Preserved in Amber##31004 |goto 73.67,27.58
step
click Ancient Amber Chunk##212980
Use the Klaxxi Tuning Fork on the Amber |q 31004/1 |goto 70.24,25.70
step
Watch the dialogue
talk Kil'ruk the Wind-Reaver##62202
turnin Preserved in Amber##31004 |goto 70.20,25.64
accept Wakening Sickness##31005 |goto 70.20,25.64
accept Ancient Vengeance##31676 |goto 70.20,25.64
stickystart "Collect_Sapfly_Bits"
step
kill 6 Vengeful Gurthani Spirit##65452 |q 31676/1 |goto 67.75,29.72
|tip They look like banshees.
You can find more around [71.43,36.86]
step
label "Collect_Sapfly_Bits"
kill Sapfly##62386+
|tip They look like small yellow flying insects.
collect 100 Sapfly Bits##83075 |q 31005/1 |goto 67.75,29.72
You can find more around [71.43,36.86]
step
talk Kil'ruk the Wind-Reaver##62202
turnin Wakening Sickness##31005 |goto 70.20,25.64
turnin Ancient Vengeance##31676 |goto 70.20,25.64
accept The Klaxxi Council##31006 |goto 70.20,25.64
step
talk Kil'ruk the Wind-Reaver##62413
Tell it _"Take me to Klaxxi'vess."_ |gossip 35586
Begin Traveling to Klaxxi'vess |invehicle |goto 70.20,25.64 |q 31006
step
Watch the dialogue
Travel to Klaxxi'vess |q 31006/1 |goto 55.01,33.99 |notravel
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Klaxxi Council##31006 |goto 54.98,34.05
accept The Dread Clutches##31007 |goto 54.98,34.05
accept Not Fit to Swarm##31660 |goto 54.98,34.05
step
talk Kor'ik##64815
accept Dead Zone##31009 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
accept Amber Arms##31008 |goto 55.02,35.56
step
talk Kik'tik##63501
fpath Klaxxi'vess |goto 55.83,34.88
step
talk Zit'tix##65220
home Klaxxi'vess |goto 55.92,32.32 |q 31010 |future
step
talk Kil'ruk the Wind-Reaver##62538
Tell it _"Please fly me to the Clutches of Shek'zeer"_ |gossip 35587
Begin Flying to the Clutches of Shek'zeer |invehicle |goto 54.98,34.05 |q 31009
step
Fly to the Clutches of Shek'zeer |outvehicle |goto 39.01,40.52 |q 31009 |notravel
stickystart "Collect_Amber_Blades"
stickystart "Kill_Shekzeer_Clutch_Keepers"
stickystart "Kill_Shekzeer_Swarmborn"
step
click Inactive Sonic Relay
Activate the Sonic Relay |q 31009/1 |goto 40.03,39.05
step
_Click the Complete Quest Box:_
turnin Dead Zone##31009
accept In Her Clutch##31010
step
click Sha-Haunted Crystal##214562
accept A Source of Terrifying Power##31661 |goto 44.59,41.36
step
click Ancient Amber Chunk##212980
Watch the dialogue
Kill the enemies that attack in waves
Waken the Paragon |q 31010/1 |goto 44.74,41.55
'|kill Shek'zeer Swarmborn##62748, Shek'zeer Bladesworn##62749
step
label "Collect_Amber_Blades"
kill Shek'zeer Bladesworn##62563+
|tip They look like insect people with large swords.
|tip Some of them ride on large scorpions.
collect 6 Amber Blade##83135 |q 31008/1 |goto 43.29,43.41
step
label "Kill_Shekzeer_Clutch_Keepers"
kill 6 Shek'zeer Clutch-Keeper##64559 |q 31007/1 |goto 44.43,41.77
|tip They look like insect people casting a shadow spell.
step
label "Kill_Shekzeer_Swarmborn"
kill 30 Shek'zeer Swarmborn##62582 |q 31660/1 |goto 44.43,41.77
|tip They look like small insect people.
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Dread Clutches##31007 |goto 54.99,34.04
turnin Not Fit to Swarm##31660 |goto 54.99,34.04
step
talk Malik the Unscathed##62774
turnin In Her Clutch##31010 |goto 54.94,34.13
step
talk Kor'ik##64815
accept A Cry From Darkness##31066 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
turnin Amber Arms##31008 |goto 55.02,35.56
turnin A Source of Terrifying Power##31661 |goto 55.02,35.56
accept Concentrated Fear##31108 |goto 55.02,35.56
step
talk Malik the Unscathed##62774
|tip He walks to this location.
accept The Dreadsworn##31689 |goto 55.06,35.47
accept Citizens of a New Empire##31107 |goto 55.06,35.47
stickystart "Collect_Dread_Amber_Focuses"
stickystart "Kill_Vorthik_Dreadsworn"
stickystart "Collect_Vorthik_Eggs"
step
kill Qi'tar the Deathcaller##62863 |q 31066/1 |goto 59.36,18.41
step
label "Collect_Dread_Amber_Focuses"
kill Vor'thik Fear-Shaper##62814+
|tip They look like larger insect people casting a shadow spell.
collect 4 Dread Amber Focus##86616 |q 31108/1 |goto 58.16,14.62
step
label "Kill_Vorthik_Dreadsworn"
kill 6 Vor'thik Dreadsworn##62813 |q 31689/1 |goto 58.16,14.62
|tip They look like larger insect people carrying polearms.
step
label "Collect_Vorthik_Eggs"
click Vor'thik Egg##214170+
|tip They look like squirming yellow cocoons.
collect 10 Vor'thik Eggs##86598 |q 31107/1 |goto 59.65,16.99
step
talk Kor'ik##64815
turnin A Cry From Darkness##31066 |goto 54.77,34.06
accept Extending Our Coverage##31087 |goto 54.77,34.06
step
talk Malik the Unscathed##62774
turnin The Dreadsworn##31689 |goto 55.06,35.47
turnin Citizens of a New Empire##31107 |goto 55.06,35.47
step
talk Ambersmith Zikk##64599
turnin Concentrated Fear##31108 |goto 55.02,35.56
step
talk Kil'ruk the Wind-Reaver##62538
accept Amber Is Life##31019 |goto 55.06,35.85
stickystart "Kill_Mistblade_Rippers"
step
kill Mistblade Ripper##61970+
|tip They look like lizard people.
accept Relics of the Swarm##31023 |goto 62.23,57.58
|tip You will eventually automatically accept this quest after looting.
stickystart "Collect_Mantid_Relics"
step
label "Kill_Mistblade_Rippers"
kill 7 Mistblade Ripper##61970 |q 31019/1 |goto 65.38,63.64
|tip They look like lizard people.
step
label "Collect_Mantid_Relics"
click Mantid Relic##212079+
|tip They look like broken stone tablets.
|tip You can find more on the shore around the lake.
collect 8 Mantid Relic##82867 |q 31023/1 |goto 65.07,60.14
|only if haveq(31023) or completedq(31023)
step
Enter the underground cave |goto 66.76,63.84 < 15 |walk
kill Mistblade Scale-Lord##63179 |q 31019/2 |goto 66.42,66.11
|tip Inside the underground cave.
step
clicknpc Ancient Amber Chunk##65354
|tip Inside the underground cave.
turnin Amber Is Life##31019 |goto 66.84,65.39
step
Watch the dialogue
|tip Inside the underground cave.
_Next to you:_
talk Korven the Prime##62232
accept Feeding the Beast##31020 |goto 66.84,65.39
accept Living Amber##31021 |goto 66.84,65.39
stickystart "Kill_Coldbite_Crocolisks"
step
Leave the underground cave |goto 66.76,63.84 < 15 |walk |only if subzone("Mistblade Den") and indoors()
click Amber Fragment##212011+
|tip They look like orange rocks underwater.
collect Living Amber##82864+ |n
use the Living Amber##82864
Feed Korven the Prime #9# Living Amber |q 31021/1 |goto 65.19,58.75
step
label "Kill_Coldbite_Crocolisks"
kill 8 Coldbite Crocolisk##62023 |q 31020/1 |goto 65.19,58.75
|tip Underwater. |notinsticky
step
_Next to you:_
talk Korven the Prime##62232
turnin Feeding the Beast##31020
turnin Living Amber##31021
accept Kypari Zar##31022
step
click Sonar Tower##212933
Examine the Sonar Tower |q 31022/1 |goto 59.81,59.47
step
Watch the dialogue
Kill the enemies that attack in waves
Defend Korven the Prime |q 31022/2 |goto 59.98,59.40
'|kill Ik'thik Towerguard##63294
step
_Next to you:_
talk Korven the Prime##62232
turnin Kypari Zar##31022
accept The Root of the Problem##31026
step
Enter the underground cave |goto 58.60,59.45 < 15 |walk
kill Coldbite Matriarch##62008 |q 31026/1 |goto 57.36,57.78
|tip Inside the underground cave.
|tip Avoid stepping on the purple eggs, they spawn enemies.
step
_Next to you:_
talk Korven the Prime##62232
turnin The Root of the Problem##31026
step
Leave the underground cave |goto 58.60,59.45 < 15 |walk |only if subzone("Coldbite Burrow") and indoors()
Enter the building |goto 46.24,53.14 < 15 |walk
Locate Amberglow Hollow |q 31087/1 |goto 46.54,52.60
|tip Inside the building.
step
kill Adjunct Zet'uk##65478 |q 31087/2 |goto 48.09,49.77
|tip Inside the building.
step
click Silent Beacon##213250
|tip Inside the building.
Use the Resonating Crystal on the Silent Beacon |q 31087/3 |goto 48.16,49.75
step
talk Kor'ik##65365
|tip Inside the building.
turnin Extending Our Coverage##31087 |goto 48.11,49.64
accept Isolating the Frequency##31088 |goto 48.11,49.64
accept The Color of Our Energy##31090 |goto 48.11,49.64
stickystart "Kill_Ikthik_Harvesters"
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
click Amber Collector##212923+
|tip They look like orange bags hanging on the side of trees.
collect 7 Amber-Filled Jar##85159 |q 31090/1 |goto 40.84,51.34
step
label "Kill_Ikthik_Harvesters"
kill 8 Ik'thik Harvester##63206 |q 31088/1 |goto 40.84,51.34
|tip They look like insect people.
step
talk Infiltrator Ik'thal##65511
fpath The Briny Muck |goto 42.53,55.75
step
Enter the building |goto 46.24,53.14 < 15 |walk
talk Kor'ik##65365
|tip Inside the building.
turnin Isolating the Frequency##31088 |goto 48.11,49.64
turnin The Color of Our Energy##31090 |goto 48.11,49.64
accept By the Sea, Nevermore##31089 |goto 48.11,49.64
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
use the Klaxxi Tuning Fork##84119
Awaken Kaz'tik the Manipulator |q 31089/1 |goto 43.50,63.26
step
Watch the dialogue
talk Kaz'tik the Manipulator##63758
turnin By the Sea, Nevermore##31089 |goto 43.32,63.49
accept Reunited##31091 |goto 43.32,63.49
step
talk Kaz'tik the Manipulator##63876
Tell him _"I'm ready to help you find your weapon."_ |gossip 28603
Watch the dialogue
Follow Kaz'tik the Manipulator |goto 43.32,63.49 > 10 |c |q 31091
step
Watch the dialogue
|tip Follow Kaz'tik the Manipulator and protect him as he walks.
|tip He eventually walks to this location.
Escort Kaz'tik the Manipulator to the Undisturbed Dirt |q 31091/1 |goto 41.76,72.02
step
Watch the dialogue
Find Kaz'tik's Greatest Weapon |q 31091/2 |goto 41.76,72.02
step
talk Kaz'tik the Manipulator##63876
turnin Reunited##31091 |goto 41.76,72.02
accept The Kunchong Whisperer##31359 |goto 41.76,72.02
accept Feed or Be Eaten##31092 |goto 41.76,72.02
stickystart "Feed_Succulent_Turtle_Filets_To_Kovok"
stickystart "Slay_Muckscale_Tribe_Members"
step
kill Oracle Hiss'ir##63998 |q 31359/1 |goto 41.93,63.77
|tip He walks around this area.
step
click Glowing Amber##214062
accept Falling to Pieces##31398 |goto 41.88,63.72
step
label "Feed_Succulent_Turtle_Filets_To_Kovok"
Kill Brineshell enemies around this area
|tip They look like turtles.
collect Succulent Turtle Filet##86489+ |n
use the Succulent Turtle Filet##86489+
Feed #6# Succulent Turtle Filets to Kovok |q 31092/1 |goto 37.63,62.58
'|kill Brineshell Snapper##63981, Trained Brineshell Snapper##65330
step
label "Slay_Muckscale_Tribe_Members"
Kill Muckscale enemies around this area
|tip They look like lizard people.
Slay #10# Muckscale Tribe Members |q 31359/2 |goto 37.63,62.58
'|kill Muckscale Slayer##63999, Muckscale Flesh-Hunter##63997, Muckscale Shaman##64008, Muckscale Ripper##63993
step
talk Kaz'tik the Manipulator##63758
turnin The Kunchong Whisperer##31359 |goto 54.25,35.78
turnin Feed or Be Eaten##31092 |goto 54.25,35.78
turnin Falling to Pieces##31398 |goto 54.25,35.78
step
talk Ambersmith Zikk##64599
turnin Relics of the Swarm##31023 |goto 55.02,35.56
accept Gambling Problem##31727 |goto 55.02,35.56
step
talk Kil'ruk the Wind-Reaver##62538
accept A Not So Friendly Request##31730 |goto 55.06,35.85
step
talk Jin the Flying Keg##63500
fpath The Sunset Brewgarden |goto 50.21,12.24
step
talk Sapmaster Vu##62666
turnin A Not So Friendly Request##31730 |goto 51.21,11.39
accept The Heavens Hum With War##31067 |goto 51.21,11.39
step
Enter the building |goto 53.60,15.45 < 15 |walk
click Scroll of Auspice##212389
|tip Inside the building.
accept Sacred Recipe##31068 |goto 53.09,12.36
step
kill Azzix K'tai##62843 |q 31067/1 |goto 52.74,10.27
|tip He walks around this area.
|tip Inside the building.
step
Leave the building |goto 53.60,15.45 < 15 |walk |only if subzone("The Amber Vault") and indoors()
talk Lya of Ten Songs##62667
turnin Sacred Recipe##31068 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin The Heavens Hum With War##31067 |goto 51.21,11.39
accept Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
accept Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
accept I Bring Us Great Shame##31071 |goto 51.13,11.11
step
Watch the dialogue
talk Lya of Ten Songs##62667
|tip She runs to this location.
accept Rending Daggers##31072 |goto 50.73,11.71
step
talk Chen Stormstout##62779
accept Fate of the Stormstouts##31129 |goto 50.45,12.05
step
talk Lya of Ten Songs##62667
Ask her _"Have you seen any Stormstouts here in the Brewgarden?"_ |gossip 35828
Speak with Lya of Ten Songs |q 31129/2 |goto 50.73,11.71
step
talk Big Dan Stormstout##62845
Ask him _"Is your name really Stormstout?"_ |gossip 35823
Speak with Big Dan Stormstout |q 31129/3 |goto 50.90,11.36
step
talk Sapmaster Vu##62666
Ask him _"Have you seen anybody named Stormstout come through here?"_ |gossip 35825
Speak with Sapmaster Vu |q 31129/1 |goto 51.21,11.39
step
talk Chen Stormstout##62779
turnin Fate of the Stormstouts##31129 |goto 50.45,12.05
stickystart "Harvest_Shade"
step
talk Chen Stormstout##62779
accept Evie Stormstout##31077 |goto 54.11,20.48
step
click Lost Keg##212540
collect Lost Keg##83781 |q 31071/2 |goto 54.43,20.27
step
click Lost Picnic Supplies##212556
collect Lost Picnic Supplies##83783 |q 31071/3 |goto 56.01,19.44
step
kill Kz'Kzik##62832
|tip He looks like a larger insect person that walks around this area.
collect Blade of Kz'Kzik##84111 |q 31072/1 |goto 53.29,19.98
step
click Lost Mug##212548
collect Lost Mugs##83782 |q 31071/1 |goto 51.70,19.07
step
kill Ilikkax##62833
|tip He looks like a larger insect person that walks around this area.
collect Blade of Ilikkax##84112 |q 31072/2 |goto 50.98,21.02
step
label "Harvest_Shade"
Kill enemies around this area
|tip Only enemies that look like shadow aliens will count for the quest goal.
Harvest #100# Shade |q 31069/1 |goto 55.21,18.18
'|kill Dread Lurker##62751, Nagging Dreadling##65996
step
kill Frightened Mushan##62760+
|tip They look like dinosaurs.
collect 3 Large Mushan Tooth##84107 |q 31070/1 |goto 49.15,19.15
step
talk Lya of Ten Songs##62667
turnin Rending Daggers##31072 |goto 50.73,11.71
accept Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
turnin Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
turnin I Bring Us Great Shame##31071 |goto 51.13,11.11
step
talk Sapmaster Vu##62666
accept Bound With Wood##31073 |goto 51.21,11.39
step
talk Defender Azzo##63218
accept Kor'thik Aggression##31133 |goto 50.19,12.44
step
Meet up with Chen |q 31077/1 |goto 50.18,10.20
step
Watch the dialogue
Eulogize Evie |q 31077/2 |goto 50.18,10.20
step
talk Chen Stormstout##62779
turnin Evie Stormstout##31077 |goto 50.18,10.20
accept Han Stormstout##31078 |goto 50.18,10.20
stickystart "Slay_Korthik_Mantids"
step
Enter the building |goto 47.00,16.82 < 15 |walk
clicknpc Han Stormstout##62776
|tip Inside the building.
|tip You can't run through the orange beams.
|tip Follow the path in and out of the rooms so that you never touch the orange beams.
|tip You will eventually be able to reach him.
Find Han Stormstout |q 31078/1 |goto 43.75,16.75
step
talk Chen Stormstout##62779
|tip Inside the building.
|tip Run through the splashing water and it will knock you toward him.
turnin Han Stormstout##31078 |goto 44.41,16.81
step
Leave the building |goto 47.00,16.82 < 15 |walk |only if subzone("Morrowchamber") and indoors()
Enter the building |goto 44.79,15.86 < 10 |walk
Find the Mark of the Empress |q 31074/1 |goto 44.51,16.78
|tip Inside the building.
step
Leave the building |goto 44.79,15.86 < 10 |walk |only if subzone("Kor'vess") and indoors()
Enter the building |goto 43.05,14.00 < 10 |walk
Find the Heartroot of Kypari Kor |q 31074/2 |goto 43.22,14.96
|tip Inside the building.
step
Leave the building |goto 43.05,14.02 < 10 |walk |only if subzone("Kor'vess") and indoors()
clicknpc Withered Husk##62876+
|tip They look like dead trees chopped in half.
collect 8 Fragrant Corewood##84118 |q 31073/1 |goto 46.29,13.10
step
label "Slay_Korthik_Mantids"
Kill Kor'thik enemies around this area
|tip They look like insect people.
Slay #17# Kor'thik Mantids |q 31133/1 |goto 43.72,12.83
'|kill Kor'thik Havoc##62757, Kor'thik Chitinel##62756, Kor'thik Battlesinger##62758
step
talk Defender Azzo##63218
turnin Kor'thik Aggression##31133 |goto 50.19,12.44
step
talk Lya of Ten Songs##62667
turnin Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Wood##31073 |goto 51.21,11.39
accept Sunset Kings##31075 |goto 51.21,11.39
step
talk Sapmaster Vu##62666
turnin Sunset Kings##31075 |goto 38.18,17.18
step
talk Olon##62668
accept Fiery Wings##31080 |goto 38.20,17.12
step
talk Boggeo##62772
accept The Horror Comes A-Rising##31079 |goto 38.16,17.34
step
talk Lya of Ten Songs##62667
accept Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
accept Great Vessel of Salvation##31082 |goto 38.65,17.25
stickystart "Collect_Flittering_Dust"
stickystart "Kill_Kyparites"
stickystart "Kill_Shuffling_Mistlurkers"
step
kill Mygoness##62766 |q 31081/2 |goto 32.92,19.36
|tip He walks around this area.
step
kill Ahgunoss##62765 |q 31081/1 |goto 32.10,17.37
step
use the Rikkitun Bell##84267
|tip Use it if you lose your sprites and can't click the Motherseeds.
clicknpc Motherseed##62601+
|tip They look like huge acorns with yellow crystals in them.
|tip They are located near the enemies surrounding this location.
|tip Bring them to this location.
Bring #3# Motherseeds Back to the Motherseed Pit |q 31082/1 |goto 36.88,17.22
step
label "Collect_Flittering_Dust"
clicknpc Rikkilea Flitterling##62764+
|tip They look like fae dragons.
|tip Run into the colorful sparks that fly off of them to collect them.
collect 88 Flitterling Dust##84239 |q 31080/1 |goto 37.26,20.61
step
label "Kill_Kyparites"
kill 2 Kyparite##63007 |q 31079/2 |goto 34.70,20.99
|tip They look like spots of brown splashing water moving across the ground.
|tip Get close to them and they will come out of the ground.
step
label "Kill_Shuffling_Mistlurkers"
kill 7 Shuffling Mistlurker##65404 |q 31079/1 |goto 34.70,20.99
|tip They look like swamp elementals.
step
talk Boggeo##62772
turnin The Horror Comes A-Rising##31079 |goto 38.16,17.33
step
talk Olon##62668
turnin Fiery Wings##31080 |goto 38.20,17.12
step
talk Lya of Ten Songs##62667
turnin Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
turnin Great Vessel of Salvation##31082 |goto 38.65,17.25
accept Bind the Glamour##31084 |goto 38.65,17.25
step
talk Chief Rikkitun##62771
Tell it _"The forked blade is ready, and we have given our gift. Please perform your incantation."_ |gossip 40853
Follow Chief Rikkitum |goto 38.65,17.25 > 10 |c |q 31084
step
Watch the dialogue
|tip Follow Chief Rikkitum as he walks.
|tip He eventually walks to this location.
Allow Chief Rikkitun to Enchant the Forked Blade |q 31084/1 |goto 39.67,23.18
step
talk Chief Rikkitun##62771
turnin Bind the Glamour##31084 |goto 38.65,17.25
step
talk Lya of Ten Songs##62667
accept Fires and Fears of Old##31085 |goto 38.30,17.13
step
talk Sapmaster Vu##62666
accept Blood of Ancients##31086 |goto 38.18,17.18
step
click Solidified Amber##212902
collect Chunk of Solidified Amber##84779 |q 31086/1 |goto 30.22,30.58
step
click Enormous Landslide
Click Here After the Landslide Moves |confirm |goto 30.06,30.89 |q 31085
step
Enter the building |goto 30.18,31.69 < 15 |walk
use the Ruining Fork##84771
|tip Inside the building.
Use the Ruining Fork on Iyyokuk the Lucid |q 31085/1 |goto 32.39,33.65
step
Watch the dialogue
|tip Inside the building.
Kill the enemies that attack
|tip They appear and start channeling on Iyyokuk the Lucid.
Protect Iyyokuk the Lucid Until He Escapes |q 31085/2 |goto 32.39,33.65
'|kill Adjunct G'kkal##63103, Adjunct Okzyk##63102, Adjunct Pivvika##63104
step
Leave the building |goto 30.25,31.73 < 15 |walk |only if subzone("The Amber Hibernal") and indoors()
talk Lya of Ten Songs##62667
turnin Fires and Fears of Old##31085 |goto 50.28,12.07
step
talk Sapmaster Vu##62666
turnin Blood of Ancients##31086 |goto 50.22,12.11
step
talk Min the Breeze Rider##63498
fpath Soggy's Gamble |goto 56.10,70.18
step
talk San the Sea Calmer##63016
|tip Inside the building.
home The Chum Bucket |goto 55.15,71.11
step
talk Deck Boss Arie##63349
turnin Soggy's Gamble##31727 |goto 54.72,72.17
accept Mazu's Breath##31265 |goto 54.72,72.17
step
use the Potion of Mazu's Breath##85869
Drink the Potion of Mazu's Breath |q 31265/1 |goto 54.72,72.17
step
talk Deck Boss Arie##63349
turnin Mazu's Breath##31265 |goto 54.72,72.17
accept Fresh Pots##31181 |goto 54.72,72.17
accept You Otter Know##31182 |goto 54.72,72.17
stickystart "Bait_Crab_Pots"
step
use the Bag of Clams##85231
|tip Use it on Coldwhisker Otters underwater.
Feed #8# Coldwhisker Otters |q 31182/1 |goto 59.48,81.84
'|talk Coldwhisker Otter##63376
step
label "Bait_Crab_Pots"
kill Sea Monarch##63470+
|tip They look like large fish underwater.
collect Sea Monarch Chunks##85230+ |n
click Empty Crab Pot+
|tip They look like red and brown cages underwater.
|tip You need 2 Sea Monarch Chunks to bait each crab pot.
Bait #10# Crab Pots |q 31181/1 |goto 59.48,81.84
step
talk Deck Boss Arie##63349
turnin Fresh Pots##31181 |goto 54.72,72.16
turnin You Otter Know##31182 |goto 54.72,72.16
accept Meet the Cap'n##31183 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Meet the Cap'n##31183 |goto 55.66,72.50
accept Walking Dog##31185 |goto 55.66,72.50
accept Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept On the Crab##31187 |goto 54.72,72.16
accept Shark Week##31188 |goto 54.72,72.16
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
accept Dog Food##31186 |goto 50.72,78.38
stickystart "Feed_Dog"
stickystart "Collect_Thresher_Teeth"
stickystart "Send_Full_Crab_Pots_To_The_Surface"
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Silt Vents |q 31185/1 |goto 46.40,74.06
|tip Underwater.
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Wreck of the Mist-Hopper |q 31185/2 |goto 44.9,78.0
|tip Underwater.
step
click Soggy's Footlocker##213454
|tip It looks like a small brown wooden chest.
|tip Underwater on this sunken ship.
|tip It can appear in other locations on this sunken ship.
collect Sealed Charter Tube##85886 |q 31184/1 |goto 44.73,78.66
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Whale Corpse |q 31185/3 |goto 40.08,78.68
|tip Underwater.
step
label "Send_Full_Crab_Pots_To_The_Surface"
click Full Crab Pot##213508+
|tip They look like red and brown cages.
|tip Underwater. |notinsticky
Send #8# Full Crab Pots to the Surface |q 31187/1 |goto 44.75,76.21
step
label "Feed_Dog"
use the Dog's Whistle##85955 |notinsticky
|tip Use it if Dog isn't following you. |notinsticky
kill Rockshell Snapclaw##63369+
|tip They look like green lobsters.
|tip Underwater. |notinsticky
|tip Dog will eat their corpses.
Feed Dog #10# Times |q 31186/1 |goto 44.75,76.21
step
label "Collect_Thresher_Teeth"
kill Longfin Thresher##63944+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect Thresher Jaw##85998+ |n
use the Thresher Jaw##85998+
collect 200 Thresher Teeth##85999 |q 31188/1 |goto 44.75,76.21
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
turnin Dog Food##31186
step
talk Deck Boss Arie##63349
turnin On the Crab##31187 |goto 54.72,72.16
turnin Shark Week##31188 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Walking Dog##31185 |goto 55.66,72.50
turnin Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Master Angler Ju Lien##64259
Speak with Master Angler Ju Lien |q 31189/1 |goto 53.64,76.05
step
talk Master Angler Ju Lien##64259
Tell him _"Deck Boss said you needed some help."_ |gossip 40852
Watch the dialogue
|tip Click the various fishing rods nearby.
|tip They look like fishing poles leaning on wooden stands next to Master Angler Ju Lien.
Kill the enemies that attack
Assist Master Angler Ju Lien |q 31189/2 |goto 53.64,76.05
'|kill Jiao Spawn##64273
step
talk Deck Boss Arie##63349
turnin Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
accept The Mariner's Revenge##31190 |goto 54.77,72.11
step
clicknpc Mist-Hopper Jr.##64350
Control the Mist-Hopper Jr. |invehicle |goto 56.17,76.29 |q 31190
step
kill Jiao##63330
|tip It looks like a huge octopus in the water.
|tip Aim at the red crosshairs.
|tip Use the ability on your action bar.
Land #25# Bow Hits |q 31190/1 |goto 53.35,80.89
Land #25# Port Side Hits |q 31190/2 |goto 53.35,80.89
Land #25# Starboard Hits |q 31190/3 |goto 53.35,80.89
Land #25# Stern Hits |q 31190/4 |goto 53.35,80.89
step
Stop Controlling the Mist-Hopper Jr. |outvehicle |goto 56.2,76.3 |q 31190
|tip Click the arrow on your action bar.
step
talk Captain "Soggy" Su-Dao##63317
turnin The Mariner's Revenge##31190 |goto 56.57,75.92
step
talk Deck Boss Arie##63349
accept Mazu's Bounty##31354 |goto 56.57,75.82
step
talk Master Angler Ju Lien##64259
turnin Mazu's Bounty##31354 |goto 54.90,72.83
accept Once in a Hundred Lifetimes##32030 |goto 54.90,72.83
step
talk Klaxxi'va Ik##65395
turnin Once in a Hundred Lifetimes##32030 |goto 54.71,34.75
accept Overthrone##31782 |goto 54.71,34.75
step
Watch the dialogue
Witness the Klaxxi Ritual |q 31782/1 |goto 54.71,34.75
step
talk Klaxxi'va Vor##62519
turnin Overthrone##31782 |goto 55.11,34.27
step
talk Kor'ik##64815
accept The Zan'thik Dig##31605 |goto 54.77,34.06
step
talk Kil'ruk the Wind-Reaver##62538
accept Skeer the Bloodseeker##31175 |goto 55.06,35.85
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
click Ancient Amber Chunk##212980
|tip Inside the underwater cave.
Awaken Skeer the Bloodseeker |q 31175/1 |goto 25.70,50.40
step
Watch the dialogue
|tip Inside the underwater cave.
talk Skeer the Bloodseeker##63071
turnin Skeer the Bloodseeker##31175 |goto 25.71,50.30
accept A Strange Appetite##31176 |goto 25.71,50.30
accept Fine Dining##31177 |goto 25.71,50.30
accept A Bloody Delight##31178 |goto 25.71,50.30
stickystart "Collect_Starfish_Meat"
stickystart "Collect_Volatile_Blood"
step
kill Briny Clacker##63348+
|tip They look like small lobsters.
|tip Underwater.
collect 8 Clacker Tail##85212 |q 31177/1 |goto 25.02,61.12
step
label "Collect_Starfish_Meat"
click Spiny Starfish##212988+
|tip They look like pink starfish.
|tip Underwater. |notinsticky
collect 12 Starfish Meat##85211 |q 31176/1 |goto 25.02,61.12
step
label "Collect_Volatile_Blood"
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
kill Dread Remora##63353+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect 100 Volatile Blood##85229 |q 31178/1 |goto 25.02,61.12
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
talk Skeer the Bloodseeker##63071
|tip Inside the underwater cave.
turnin A Strange Appetite##31176 |goto 25.71,50.62
turnin Fine Dining##31177 |goto 25.71,50.62
turnin A Bloody Delight##31178 |goto 25.71,50.62
accept The Scent of Blood##31179 |goto 25.71,50.62
step
kill 12 Muckscale Flesheater##63465 |q 31179/1 |goto 25.71,50.97
|tip They attack in waves.
|tip Inside the underwater cave.
step
Watch the dialogue
|tip Inside the underwater cave.
kill Muckscale Serpentus##63466 |q 31179/2 |goto 25.71,50.97
step
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
talk Rik'kal the Dissector##65253
turnin The Zan'thik Dig##31605 |goto 31.80,88.95
accept The Dissector Wakens##31606 |goto 31.80,88.95
step
Kill the enemies that attack
Waken the Paragon |q 31606/1 |goto 31.80,88.95
'|kill Zan'thik Impaler##65273, Zan'thik Manipulator##65274
step
talk Rik'kal the Dissector##65253
turnin The Dissector Wakens##31606 |goto 31.80,88.95
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Scent of Blood##31179 |goto 55.06,35.85
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\MoP Remix Intro (Story Only)",{
author="support@zygorguides.com",
description="This guide will help you begin your MoP Remix adventures.",
condition_suggested=function() return hasbuff(424143) end,
condition_suggested_exclusive=true,
startlevel=10,
patch='100207',
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\The Jade Forest (10-70) (Story Only)",
},[[
step
talk Eternus##216591
accept It's About Time##79432 |goto Timeless Isle/0 24.51,52.19
step
click Unstable Rift
Investigate the Unstable Rift |q 79432/1 |goto 25.82,46.28
kill Archaios the Artificer##217564 |q 79432/2 |goto 25.82,46.28
step
Take Archaios's Artifact |q 79432/3 |goto 25.82,46.28
|tip Loot Archaios the Artificer's corpse.
step
talk Eternus##216591
turnin It's About Time##79432 |goto 24.52,52.19
accept Seeking Expert Advice##79433 |goto 24.52,52.19
step
talk Moratari##216594
turnin Seeking Expert Advice##79433 |goto 25.69,51.59
accept Weave It To Me##79434 |goto 25.69,51.59
accept Knot My Problem##79437 |goto 25.69,51.59
stickystart "Collect_Threads_of_Time"
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 22.95,55.44 |count 1
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 22.44,50.36 |count 2
step
click Time Rift
Close the Time Rift |q 79437/1 |goto 20.97,45.10 |count 3
step
label "Collect_Threads_of_Time"
kill Infinite Ravager##218346+
|tip They look like dragonkin.
Collect #3# Threads of Time |q 79434/1 |goto 22.42,51.02
'|kill Infinite Ravager##217557
step
talk Moratari##216594
turnin Weave It To Me##79434 |goto 25.71,51.60
turnin Knot My Problem##79437 |goto 25.71,51.60
accept What's Hours Is Yours##79435 |goto 25.71,51.60
step
talk Horos##217051
buy Chronobadge##215438 |q 79435/1 |goto 25.46,53.86
step
talk Momentus##217668
Ask him _"Can you forge this thread and chronobadge into a cloak?"_ |gossip 120769
Watch the dialogue
Ask Momentus to Forge your Artifact |q 79435/2 |goto 24.98,52.89
step
talk Moratari##216594
turnin What's Hours Is Yours##79435 |goto 25.69,51.57
accept Cloak and Needle##80380 |goto 25.69,51.57
step
Equip the Cloak of Infinite Potential |q 80380/1
'|equipped Cloak of Infinite Potential##210333
step
kill Infinite Ravager##218346+
|tip They look like dragonkin.
collect Thread of Power##210982 |q 80380/2 |goto 22.42,51.02
'|kill Infinite Ravager##217557
step
talk Moratari##216594
turnin Cloak and Needle##80380 |goto 25.69,51.59
accept Goodbyes Are Hard When You Live Forever##79438 |goto 25.69,51.59
step
kill Eratus, the Unwoven Paradox##220821 |q 79438/1 |goto 25.86,58.17
step
talk Moratari##218129
turnin Goodbyes Are Hard When You Live Forever##79438 |goto 26.46,54.24
accept Recalling the War##79440 |goto 26.46,54.24
step
talk Eternus##217538
Ask her _"What events led the Horde to Pandaria?"_ |gossip 120948
Speak to Eternus About Recent Events |q 79440/1 |goto 25.99,53.92
step
talk Eternus##216591
|tip On the airship.
turnin Recalling the War##79440 |goto The Jade Forest/0 30.85,10.77
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\The Jade Forest (10-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."JadeForest",
condition_suggested=function() return level >= 10 and level <= 70 and not completedq(29670) end,
pandariaremix=true,
startlevel=10,
endlevel=70,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Valley of the Four Winds (20-70) (Story Only)",
},[[
step
talk General Nazgrim##55135
|tip Inside the room, on the main deck of the airship.
accept Paint it Red!##31765 |goto The Jade Forest/0 30.78,10.22
step
clicknpc Gunship Turret##66677
|tip On the lower level of the ship.
Enter the Turret |invehicle |goto 31.53,11.01 |q 31765
step
Kill Thunder Hold enemies around this area
|tip They are on the ground to the east.
|tip Use the abilities on your action bar.
Slay #80# Thunder Hold Troops |q 31765/1 |goto 33.03,10.61
kill 9 Thunder Hold Cannons##66203 |q 31765/2 |goto 33.03,10.61
step
talk Rivett Clutchpop##67250
|tip On the lower level of the ship.
turnin Paint it Red!##31765 |goto 31.01,11.02
accept Touching Ground##31766 |goto 31.01,11.02
step
use the Cache of Infinite Treasure##211279+
accept Gems of Power##79489
accept A Scrap of Bronze##78893
step
Shift Right-Click Your Armor and Socket the Chipped Deadly Sapphire |q 79489/1
|tip You can shift + right-click your chest or leg armor.
|tip Follow the on-screen instructions.
step
_Click the Complete Quest Box:_
turnin Gems of Power##79489
accept Extract a Gem##80196
step
Extract a Gem |q 80196/1
|tip Use the Extract Gem ability on the piece of armor you socketed the Chipped Deadly Sapphire into.
|tip It appears as a button on the screen.
step
_Click the Complete Quest Box:_
turnin Extract a Gem##80196
accept Combine Gems##80197
step
use the Chipped Deadly Sapphire##210714+
Combine 3 Chipped Deadly Sapphires |q 80197/1
step
_Click the Complete Quest Box:_
turnin Combine Gems##80197
step
click Unraveling Sands
|tip Use the Unraveling Sands ability.
|tip It appears as a button on the screen.
|tip A small yellow swirling portal will appear.
Scrap the Unraveling Tunic |q 78893/2
|tip Scrap the Unraveling Tunic in the Unraveling Sands box that appears.
step
_Click the Complete Quest Box:_
turnin A Scrap of Bronze##78893
step
click Rappelling Rope##215689
|tip On the lower level of the ship.
Rappel into Honeydew Glade |q 31766/1 |goto 31.51,11.11
step
talk General Nazgrim##55135
|tip He walks around this area.
turnin Touching Ground##31766 |goto 31.64,11.33
accept Finish Them!##31767 |goto 31.64,11.33
accept Fire Is Always the Answer##31768 |goto 31.64,11.33
stickystart "Slay_Thunder_Hold_Troops"
step
use Nazgrim's Flare Gun##89605
|tip Use it near Thunder Hold Munitions.
|tip They look like piles of crates and barrels.
Destroy #10# Thunder Hold Munitions |q 31768/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
step
label "Slay_Thunder_Hold_Troops"
Kill Thunder Hold enemies around this area
|tip They look like Alliance soldiers.
Slay #15# Thunder Hold Troops |q 31767/1 |goto 32.71,6.91
You can find more around [33.77,12.87]
'|kill Thunder Hold Armsman##66348, Thunder Hold Cannoneer##66395, Thunder Hold Infantryman##66285, Thunder Hold Sharp-Shooter##66288, Thunder Hold Mender##66286
step
Enter the building |goto 33.67,10.61 < 15 |walk
talk General Nazgrim##66646
|tip Inside the building.
turnin Finish Them!##31767 |goto 34.78,10.63
turnin Fire Is Always the Answer##31768 |goto 34.78,10.63
accept The Final Blow!##31769 |goto 34.78,10.63
step
use Nazgrim's Flare Gun##89769
|tip Inside the building.
Destroy the First Barricade |q 31769/1 |goto 34.01,9.94
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Second Barricade |q 31769/2 |goto 34.73,9.93
step
use Nazgrim's Flare Gun##89769
|tip Upstairs inside the building.
Destroy the Third Barricade |q 31769/3 |goto 34.94,10.63
step
Watch the dialogue
|tip Outside, on top of the building.
Find Captain Doren |q 31769/4 |goto 33.73,10.61
step
talk General Nazgrim##66656
turnin The Final Blow!##31769 |goto 33.65,10.61
step
Watch the dialogue
talk General Nazgrim##66656
accept You're Either With Us Or...##31770 |goto 33.65,10.61
accept Higher Ground##29694 |goto 33.65,10.61
step
talk Taran Zhu##66657
accept Face to Face With Consequence##31771 |goto 33.71,10.61
step
talk Rivett Clutchpop##55146
Tell him _"Quit messing around and use your knife! Nazgrim wants you to report to the village immediately."_ |gossip 39686
Rescue Rivett Clutchpop |q 29694/2 |goto 30.53,7.21
step
talk Sue-Ji the Tender##66659
accept Prowler Problems##31773 |goto 30.53,7.49
stickystart "Kill_Sha_Haunts"
step
kill 7 Sha Harbinger##66424 |q 31771/2 |goto 33.56,7.31
|tip They look like larger aliens.
You can find more around [33.75,12.76]
step
label "Kill_Sha_Haunts"
kill 20 Sha Haunt##66425 |q 31771/1 |goto 33.56,7.31
|tip They look like smaller aliens.
You can find more around [33.75,12.76]
stickystart "Kill_Sha-Infested_Prowlers"
step
talk Shokia##55170
Tell her _"On your feet! Nazgrim is organizing a counter-attack. We're regrouping in the village."_ |gossip 39688
Rescue Shokia |q 29694/4 |goto 29.43,8.48
step
talk Sergeant Gorrok##55162
Tell him _"We need to regroup, Sergeant! Go to the nearby village."_ |gossip 39687
Rescue Sergeant Gorrok |q 29694/3 |goto 30.58,11.65
step
talk Shademaster Kiryn##55141
Tell her _"Snap out of it! You're alive! Nazgrim has ordered us to report to the nearby village."_ |gossip 39490
Rescue Shademaster Kiryn |q 29694/1 |goto 32.06,13.35
step
label "Kill_Sha-Infested_Prowlers"
kill 10 Sha-Infested Prowler##66668 |q 31773/1 |goto 31.11,12.42
|tip They look like black tigers.
You can find more around [29.06,9.38]
step
talk Sergeant Gorrok##66845
turnin Regroup!##29694 |goto 29.13,13.72
step
talk Mayor Honeydew##66220
turnin You're Either With Us Or...##31770 |goto 29.18,13.79
step
talk Taran Zhu##66657
turnin Face to Face With Consequence##31771 |goto 29.13,13.84
turnin Prowler Problems##31773 |goto 29.13,13.84
step
talk Sergeant Gorrok##66845
accept Seeking Zin'jun##31774 |goto 29.13,13.72
step
talk Brewmother Kiki##66236
|tip Inside the building.
accept Home Is Where the Hearthstone Is##81638 |goto 28.51,13.34
step
talk Brewmother Kiki##66236
|tip Inside the building.
home Honeydew Village |goto 28.51,13.34 |q 31241 |future
step
talk Moratari##218468
accept Dragonriding##80012 |goto 28.52,14.01 |noautoaccept
|tip You can choose to skip this, if you've already unlocked dragonriding previously, and don't want to do the dragonriding tutorial.
step
Learn Your New Dragonriding Mount from Your Inventory |q 80012/2
step
click Portal to the Windward Isle
Take Moratari's Portal |q 80012/1 |goto 28.58,14.04
step
talk Lord Andestrasz##218469
Tell him _" Tell me about dragonriding."_ |gossip 1
Speak to Lord Andestrasz about Dragonriding |q 80012/4 |goto 65.28,37.18
step
talk Lord Andestrasz##218469
turnin Dragonriding##80012 |goto 65.28,37.18
accept How to Glide with Your Dragon##80013 |goto 65.28,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Mount Your Drake from Your Collection |q 80013/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #5# Rings |q 80013/2 |goto 66.73,33.55
step
Land in the Target Area |q 80013/3 |goto 66.73,33.55
|tip On top of the grassy area.
step
talk Celormu##183141
|tip On top of the grassy area.
turnin How to Glide with Your Dragon##80013 |goto 66.75,33.37
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80015 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept How To Dive with Your Dragon##80015 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80015/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #7# Rings |q 80015/2 |goto 66.28,49.30
step
Land in the Target Area |q 80015/3 |goto 66.28,49.30
step
talk Celormu##183141
turnin How To Dive with Your Dragon##80015 |goto 66.25,49.50
step
Return to the Lord Andestrasz |goto 65.11,37.32 < 30 |c |noway |q 80016 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept The Need For Higher Velocities##80016 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80016/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #6# Rings |q 80016/2 |goto 64.93,24.34
step
Land in the Target Area |q 80016/3 |goto 64.93,24.34
|tip On top of the large grassy rock pillar.
step
talk Celormu##183141
|tip On top of the large grassy rock pillar.
turnin The Need For Higher Velocities##80016 |goto 64.98,24.26
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80017 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept The Need For Higher Altitudes##80017 |goto 65.27,37.18
step
talk Red Drake##218484
Tell it _"Help me fly."_ |gossip 1
Hop on Your Dragonriding Mount |q 80017/1 |goto 65.22,37.13
|tip You can also press Shift + P and mount any dragonriding mount you have.
step
Watch the dialogue
|tip The Red Drake will fly automatically.
|tip If you chose to fly manually, fly through the large glowing rings in the air nearby.
Glide Through The #6# Rings |q 80017/2 |goto 62.60,28.68
step
Land in the Target Area |q 80017/3 |goto 62.60,28.68
|tip On top of the large grassy rock pillar.
step
talk Celormu##183141
|tip On top of the large grassy rock pillar.
turnin The Need For Higher Altitudes##80017 |goto 62.47,28.65
step
Return to the Lord Andestrasz |complete subzone("Mistveil Sea") |q 80018 |future
|tip You will travel automatically.
step
talk Lord Andestrasz##193287
accept Fashionable Flying##80018 |goto 65.27,37.18
step
click Rostrum of Transformation
Use the Rostrum of Transformation |q 80018/1 |goto 65.05,36.99
step
talk Lord Andestrasz##218469
turnin Fashionable Flying##80018 |goto 65.28,37.18
step
talk Lord Andestrasz##218469
accept Time to Return##80349 |goto 65.28,37.18
step
talk Moratari##218468
turnin Time to Return##80349 |goto 28.52,14.01
step
talk Wing Hya##66227
fpath Honeydew Village |goto 28.10,15.62
step
talk Zin'Jun##55403
turnin Seeking Zin'jun##31774 |goto 31.14,17.53
accept Cryin' My Eyes Out##29765 |goto 31.14,17.53
step
kill Hozen Groundpounder##55470+
|tip They look like monkeys.
collect Zin'Jun's Rifle##74160 |q 29765/1 |goto 29.79,20.83
collect Zin'Jun's Left Eye##74161 |q 29765/2 |goto 29.79,20.83
collect Zin'Jun's Right Eye##74162 |q 29765/3 |goto 29.79,20.83
collect Snuff's Corpse##74163 |q 29765/4 |goto 29.79,20.83
step
_Next to you:_
talk Zin'Jun##55403
turnin Cryin' My Eyes Out##29765
accept Seein' Red##29804
step
kill Konk##55509 |q 29804/1 |goto 31.94,22.20
|tip Inside the small cave.
step
talk General Nazgrim##66656
|tip He runs to this location.
turnin Seein' Red##29804 |goto 31.66,21.91
accept Assault on the Airstrip##31775 |goto 31.66,21.91
accept Strongarm Tactics##31776 |goto 31.66,21.91
step
talk Merchant Zin##65998
accept Unreliable Allies##31778 |goto 31.41,21.76
step
talk Rivett Clutchpop##55521
accept Choppertunity##31777 |goto 31.14,21.58
stickystart "Free_Pandaren"
stickystart "Slay_Strongarm_Troops"
step
kill Master Engineer Cogswing##65882 |q 31776/1 |goto 30.33,24.26
kill Gyro-Mechanic Lavenderp##65883 |q 31776/2 |goto 30.33,24.26
step
kill Morgus Grimhatchet##65880 |q 31776/3 |goto 29.66,23.11
|tip He walks around the area.
step
kill Corporal Jackson Silver##65881 |q 31776/4 |goto 27.78,22.92
|tip Inside the tower, on the ground floor.
step
click Requisitioned Firework Launcher##214962+
|tip They look like small bronze dragon-shaped rocket launchers.
collect Requisitioned Firework Launcher##89163+ |n
use the Requisitioned Firework Launcher##89163+
|tip Use them on Strongarm Gyrocopters.
|tip They look like helicopters flying in the air.
Shoot Down #12# Strongarm Gyrocopters |q 31777/1 |goto 27.21,24.11
'|kill Strongarm Gyrocopter##65843
step
label "Free_Pandaren"
talk Pandaren Volunteer##67090+
|tip They look like friendly panda people.
Tell them _"You can go home now. I'll cover your back."_ |gossip 41756
Free #12# Pandaren |q 31778/1 |goto 28.83,23.97
step
label "Slay_Strongarm_Troops"
Kill Strongarm enemies around this area
|tip They look like Alliance soldiers.
Slay #15# Strongarm Troops |q 31775/1 |goto 28.83,23.97
'|kill Strongarm Private##65841, Strongarm Ace##66000, Strongarm Medic##65842, Strongarm Lieutenant##65905
step
talk Rivett Clutchpop##55521
turnin Choppertunity##31777 |goto 31.14,21.58
step
talk Merchant Zin##65998
turnin Unreliable Allies##31778 |goto 31.41,21.76
step
talk General Nazgrim##66656
turnin Assault on the Airstrip##31775 |goto 31.66,21.91
turnin Strongarm Tactics##31776 |goto 31.66,21.91
accept The Darkness Within##31779 |goto 31.66,21.91
step
Cross the bridge |goto 27.35,25.11 < 15 |only if walking
kill Captain Doren##66052 |q 31779/1 |goto 25.75,23.64
|tip Inside the small cave.
step
click Flagpole##215844
turnin The Darkness Within##31779 |goto 27.57,24.28
accept Nazgrim's Command##31999 |goto 27.57,24.28
step
talk General Nazgrim##55172
turnin Nazgrim's Command##31999 |goto 28.42,24.94
step
talk Shademaster Kiryn##55180
accept Forensic Science##29815 |goto 28.19,24.82
step
talk Rivett Clutchpop##55521
accept Missed Me By... That Much!##29821 |goto 28.10,24.70
step
clicknpc Empty Package##62923
turnin Missed Me By... That Much!##29821 |goto 22.87,30.59
accept They're So Thorny!##31112 |goto 22.87,30.59
stickystart "Collect_Emergency_Supplies"
step
clicknpc Lurching Blossom##55610+
|tip They look like blue and green plants that move.
|tip You can do this while mounted.
collect 8 Viscous Chlorophyll##74621 |q 29815/1 |goto 25.63,26.77
step
label "Collect_Emergency_Supplies"
kill Water Sprite##62930+
|tip They look like blue imps.
collect 5 Emergency Supplies##74623 |q 31112/1 |goto 25.99,26.20
step
talk Rivett Clutchpop##55521
turnin They're So Thorny!##31112 |goto 28.10,24.70
step
talk Shademaster Kiryn##55180
turnin Forensic Science##29815 |goto 28.19,24.82
accept Acid Rain##29827 |goto 28.19,24.82
step
clicknpc Recovered Gyrocopter##55674
Fly With the Gyrocopter |invehicle |goto 28.07,24.78 |q 29827
|nomovieskip
step
_As You Fly:_
kill 25 Hozen Gutripper##55707 |q 29827/1 |goto 28.67,27.39
kill 25 Hozen Nibstabber##55701 |q 29827/2 |goto 28.67,27.39
|tip They look like monkeys.
|tip Use the abilities on your action bar.
|nomovieskip
step
talk Shademaster Kiryn##55180
turnin Acid Rain##29827 |goto 28.19,24.82
step
talk General Nazgrim##55172
accept Lay of the Land##29822 |goto 28.42,24.94
step
Visit the Shrine of the Sun |q 29822/1 |goto 31.91,27.95
step
kill Dook Ookem##55622 |q 29822/3 |goto 27.81,30.31
step
Visit the Shrine of the Moon |q 29822/2 |goto 26.23,32.30
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Lay of the Land##29822 |goto 27.59,32.69
accept Stay a While, and Listen##31121 |goto 27.59,32.69
step
click Cho's Teapot
|tip Inside the small cave.
Watch the dialogue
Listen to Lorewalker Cho |q 31121/1 |goto 27.67,32.56
step
talk Lorewalker Cho##55768
|tip Inside the small cave.
turnin Stay a While, and Listen##31121 |goto 27.59,32.69
accept A Mile in My Shoes##31132 |goto 27.59,32.69
step
talk Lorewalker Cho##63217
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
turnin A Mile in My Shoes##31132 |goto 30.84,34.06
accept If These Stones Could Speak##31134 |goto 30.84,34.06
step
click Stone Monolith
Translate the First Stone Monolith |q 31134/1 |goto 30.88,33.70
step
click Stone Monolith
kill Bloodthirsty Saurok##63279
Translate the Second Stone Monolith |q 31134/2 |goto 30.64,33.78
step
click Stone Monolith
Translate the Third Stone Monolith |q 31134/3 |goto 30.59,34.14
step
talk Lorewalker Cho##63217
turnin If These Stones Could Speak##31134 |goto 30.84,34.06
accept Peering Into the Past##31152 |goto 30.84,34.06
step
Watch the dialogue
|tip Follow Lorewalker Cho as he walks.
|tip He eventually walks to this location.
Escort Lorewalker Cho to the Circle of Stone |q 31152/1 |goto 28.83,32.55
step
talk Lorewalker Cho##63307
turnin Peering Into the Past##31152 |goto 28.82,32.62
accept Family Tree##31167 |goto 28.82,32.62
step
click Incense Bundle##245682
Light the Incense |q 31167/1 |goto 28.79,32.48
step
talk Lorewalker Cho##63307
turnin Family Tree##31167 |goto 28.82,32.62
accept Swallowed Whole##29879 |goto 28.82,32.62
stickystart "Kill_Engorged_Crocolisks"
step
clicknpc Speckled Trout##56180+
|tip They look like small grey fish.
|tip Underwater.
collect 5 Speckled Trout##75202 |q 29879/2 |goto 22.94,35.02
step
label "Kill_Engorged_Crocolisks"
kill 5 Engorged Crocolisk##56183 |q 29879/1 |goto 22.94,35.02
|tip Underwater. |notinsticky
step
talk Tooki Tooki##56313
turnin Swallowed Whole##29879 |goto 26.28,37.33
accept Orders are Orders##29935 |goto 26.28,37.33
step
talk Jeek Jeek##63748
accept Wicked Wikkets##31241 |goto 28.18,38.97
step
kill Battleworn Paratrooper##63782+
|tip They look like Alliance solders.
collect 6 Alliance Service Medallion##85784 |q 31241/1 |goto 30.82,40.78
step
talk Chief Kah Kah##56336
turnin Orders are Orders##29935 |goto 27.99,47.20
accept Instant Messaging##29936 |goto 27.99,47.20
turnin Wicked Wikkets##31241 |goto 27.99,47.20
step
talk Grookin Bed-Haver##62975
|tip Inside the building.
home Grookin Hill |goto 27.99,47.43 |q 30015 |future
step
clicknpc Signal Flare##56413
Signal the Survivors |q 29936/1 |goto 27.98,46.79
step
talk General Nazgrim##56339
turnin Instant Messaging##29936 |goto 28.26,47.78
accept Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Grookin Flapmaster##60952
fpath Grookin Hill |goto 27.82,47.90
step
talk Shokia##56340
Tell her _"Nazgrim has assigned you to scout the region, Shokia. You are to depart shortly."_ |gossip 40184
Dispatch Shokia |q 29941/1 |goto 28.35,46.97
step
talk Chief Kah Kah##56336
Ask him _"Big Chief Kah Kah, we will be exploring your lands and could use a good guide. Will you help us?"_ |gossip 40464
Parlay with Kah Kah |q 29941/4 |goto 27.99,47.20
step
talk Shademaster Kiryn##56478
Tell her _"Nazgrim has assigned you to the scouting party, Kiryn. You are to depart shortly."_ |gossip 40187
Dispatch Shademaster Kiryn |q 29941/3 |goto 27.10,48.98
step
talk Sergeant Gorrok##56477
|tip He walks around this area.
Tell him _"Nazgrim has assigned you to help scout the region, Gorrok. You are to depart shortly."_ |gossip 40186
Dispatch Sergeant Gorrok |q 29941/2 |goto 27.63,50.48
step
talk General Nazgrim##56339
turnin Beyond the Horizon##29941 |goto 28.26,47.78
step
talk Rivett Clutchpop##56406
accept Furious Fowl##29937 |goto 28.30,47.79
step
talk Chief Kah Kah##56336
accept What's in a Name Name?##31239 |goto 27.99,47.20
step
kill 7 Riverstride Jinyu##56289+ |q 31239/1 |goto 28.79,46.01
|tip They look like fish people.
You can find more around [31.08,47.16]
step
kill Hungry Bloodtalon##56396+
|tip They look like brown birds.
collect 6 Fistful of Bird Guts##76225 |q 29937/1 |goto 30.51,50.99
You can find more around [27.91,52.38]
step
talk Chief Kah Kah##56336
turnin What's in a Name Name##31239 |goto 27.99,47.20
step
talk Rivett Clutchpop##56406
turnin Furious Fowl##29937 |goto 27.23,50.78
accept Easy Pickings##29939 |goto 27.23,50.78
step
talk Eekle Eekle##56358
accept Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
stickystart "Collect_Snapper_Steaks"
step
use the Gut Bomb##76262
|tip Use it to throw a bomb into the water.
click Dead Deepriver Slicky##209877+
|tip They look like small dead fish that appear in the water.
collect 5 Exploded Slicky##76260 |q 29939/1 |goto 26.71,55.39
step
label "Collect_Snapper_Steaks"
kill Muck Snapper##56447+
|tip They look like turtles.
|tip Underwater. |notinsticky
collect 4 Snapper Steak##76420+ |q 29942/1 |goto 26.88,55.92
step
talk Eekle Eekle##56358
turnin Silly Wikket, Slickies are for Hozen##29942 |goto 27.03,50.84
step
talk Rivett Clutchpop##56406
turnin Easy Pickings##29939 |goto 27.23,50.78
step
talk Riko##55648
accept Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
click STAY OUT - NO VISITORS##209615
Inspect the Warning Sign |q 29730/1 |goto 38.30,45.39
step
clicknpc Lifelike Jade Statue##55378
|tip They look like small green Pandaren statues on the ground around this area.
Inspect a Lifelike Jade Statue |q 29730/2 |goto 38.85,45.92
step
Watch the dialogue
talk Widow Greenpaw##55381
Ask her _"I am an orc, ma'am. Would you mind if I asked you a few questions?"_ |gossip 40114
Speak with Widow Greenpaw |q 29730/3 |goto 39.24,46.21
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29730
step
talk Riko##55648
turnin Scouting Report: Hostile Natives##29730 |goto 28.60,47.43
step
talk Shademaster Kiryn##55646
accept Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
Watch the dialogue
|tip Use the "Smoke Bomb" ability on your action bar to mark enemies for Shokia to kill.
Search the Serpent's Spine for Signs of Life |q 29731/1 |goto 48.59,60.11
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29731
step
talk Shademaster Kiryn##55646
turnin Scouting Report: On the Right Track##29731 |goto 28.65,47.46
step
talk Riko##55648
accept Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shademaster Kiryn##55688
Tell her _"Never! Riko protect you to death!"_ |gossip 39795
Kill the enemies that attack in waves
|tip Use the abilities on your action bar.
kill Alliance Scout##55693
Listen to Riko's Report |q 29823/1 |goto The Jade Forest 49.82,70.51
'|kill Ambushing Jinyu##55692
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29823
step
talk Riko##55648
turnin Scouting Report: The Friend of My Enemy##29823 |goto 28.60,47.43
step
talk Shokia##55647
accept Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
click Sniper Rifle##209621 |goto 62.56,82.15
Control the Sniper Rifle |goto 58.82,81.19 < 5 |noway |c |q 29824
step
Watch the dialogue
|tip Right-click enemies to shoot them.
|tip Shademaster Kiryn will plant 3 poison barrels, shoot them.
|tip Then you'll have to kill more waves of enemies again.
|tip Protect Shademaster Kiryn and Riko.
Escort Shademaster Kiryn Through the Camp |q 29824/1
step
Watch the dialogue
Return to Grookin Hill |complete subzone("Grookin Hill") |q 29824
step
talk Shokia##55647
turnin Scouting Report: Like Jinyu in a Barrel##29824 |goto 28.64,47.37
step
Watch the dialogue
talk General Nazgrim##56339
accept Guerrillas in our Midst##29943 |goto 28.67,47.53
stickystart "Kill_Alliance_Infiltrators"
step
talk Rivett Clutchpop##56406
accept Green-ish Energy##29968 |goto 30.79,52.26
step
click Green Branch##209903+
|tip They look like brown logs.
collect 7 Green Branch##76333 |q 29968/1 |goto 30.58,52.63
step
label "Kill_Alliance_Infiltrators"
kill 8 Alliance Infiltrator##56303 |q 29943/1 |goto 30.47,51.64
|tip They look like humans stealthed around this area.
step
_Next to you:_
talk General Nazgrim##56490
turnin Guerrillas in our Midst##29943
accept Burning Down the House##29966
step
use Nazgrim's Grog##76336
|tip Up on the mountain.
Destroy the Alliance Camp |q 29966/1 |goto 29.44,54.20
step
talk Rivett Clutchpop##56406
turnin Green-ish Energy##29968 |goto 27.23,50.78
accept Boom Goes the Doonamite!##29967 |goto 27.23,50.78
step
talk Rivett Clutchpop##56525
Speak to Rivett Clutchpop |q 29967/1 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
Tell him _"Okay, Rivett. I'm ready!"_ |gossip 40650
Kill Jinyu enemies around this area
|tip They look like fish people.
|tip Use the "Throw Methane Bomb" on your action bar.
|tip If they get too close and knock you out, talk to Rivett again.
Slay #10# Jinyu Attackers |q 29967/2 |goto 28.98,49.08
step
talk Rivett Clutchpop##56525
turnin Boom Goes the Doonamite!##29967 |goto 28.98,49.08
step
talk General Nazgrim##56339
turnin Burning Down the House##29966 |goto 28.67,47.53
accept Dawn's Blossom##30015 |goto 28.67,47.53
step
talk Grookin Flapmaster##60952
Tell him _"Send me to Dawn's Blossom."_ |gossip 34466
Begin Flying to Dawn's Blossom |invehicle |goto 27.82,47.90 |q 30015
step
Fly to Dawn's Blossom |outvehicle |goto 47.03,46.16 |q 30015 |notravel
step
talk Keg Runner Lee##59186
fpath Dawn's Blossom |goto 47.05,46.24
step
talk Lorewalker Cho##63577
turnin Dawn's Blossom##30015 |goto 46.82,46.14
step
Watch the dialogue
talk Toya##56348
accept Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
Speak with Kai Wanderbrew |q 31230/3 |goto 46.72,45.81
step
talk Peiji Goldendraft##55809
|tip Inside the building.
Speak with Peiji Goldendraft |q 31230/2 |goto 45.72,43.70
step
talk Peiji Goldendraft##55809
|tip Inside the building.
home The Drunken Hozen |goto 45.72,43.70
step
talk Master Windfur##59160
|tip Inside the building.
Speak with Master Windfur |q 31230/1 |goto 48.49,44.49
step
talk Toya##56348
turnin Welcome to Dawn's Blossom##31230 |goto 47.16,46.17
step
talk An Windfur##55234
|tip She walks around this area.
accept The Double Hozu Dare##29716 |goto 46.49,45.75
step
talk Tzu the Ironbelly##56062
accept The Silkwood Road##29865 |goto 46.46,45.80
step
talk Lo Wanderbrew##59178
accept The Threads that Stick##29866 |goto 46.63,45.31
stickystart "Kill_Silkwood_Stalkers"
step
click Silk Patch##209951+
|tip They look like white spider eggs.
collect 7 Pristine Silk Strand##75023 |q 29866/1 |goto 43.76,49.30
step
label "Kill_Silkwood_Stalkers"
kill 8 Silkwood Stalker##56070 |q 29865/1 |goto 43.76,49.30
|tip They look like spiders.
step
talk An Windfur##55274
|tip She appears next to you.
accept Down Kitty!##29717 |goto 37.83,45.03
stickystart "Kill_Jade_Guardians"
step
clicknpc Scared Pandaren Cub##55267+
|tip They look like panda children clinging to trees low to the ground.
Tell them _"It's safe now.  You can come down."_ |gossip 39304
Rescue #6# Cubs |q 29716/1 |goto 38.12,45.49
step
label "Kill_Jade_Guardians"
kill 8 Jade Guardian##55236 |q 29717/1 |goto 38.12,45.49
|tip They look like green cougars.
step
_Next to you:_
talk An Windfur##55234
turnin The Double Hozu Dare##29716
turnin Down Kitty!##29717
accept The Jade Witch##29723
step
talk Widow Greenpaw##55368
|tip If someone else already talked to her, she will be behind the building.
Ask her _"Where is Shin?"_ |gossip 39810
Watch the dialogue
|tip Follow Widow Greenpaw as she walks.
kill Widow Greenpaw##55368
Confront the Jade Witch |q 29723/1 |goto 39.34,46.22
step
talk Tzu the Ironbelly##56062
turnin The Silkwood Road##29865 |goto 46.46,45.80
step
talk An Windfur##55413
|tip She runs along the path all around in this village.
turnin The Jade Witch##29723 |goto 46.49,45.75
step
talk Toya##56348
accept All We Can Spare##29925 |goto 47.16,46.17
step
talk Lo Wanderbrew##59178
turnin The Threads that Stick##29866 |goto 46.63,45.31
step
talk Kai Wanderbrew##59173
|tip He walks around this area.
accept Find the Boy##29993 |goto 47.05,46.01
step
talk Inkmaster Wei##56065
|tip He walks around this area.
turnin Find the Boy##29993 |goto 55.00,44.87
accept Shrine of the Dawn##29995 |goto 55.00,44.87
step
talk Inkmaster Glenzu##56064
accept The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
accept Quill of Stingers##29882 |goto 55.40,45.28
step
talk Injar'i Lakebloom##59732
fpath The Arboretum |goto 57.01,44.03
stickystart "Collect_Freshly_Fallen_Petals"
step
kill Orchard Wasp##56201+
|tip They look like large flying insects.
collect 6 Wasp Stinger##75221 |q 29882/1 |goto 53.6,44.5
step
label "Collect_Freshly_Fallen_Petals"
click Freshly Fallen Petals##209836+
|tip They look like small red flowers.
collect 8 Freshly Fallen Petals##75219 |q 29881/1 |goto 54.10,45.35
step
talk Inkmaster Glenzu##56064
turnin The Perfect Color##29881 |goto 54.88,45.31
step
talk Inkmaster Jo Po##56063
|tip He walks around this area.
turnin Quill of Stingers##29882 |goto 55.27,45.23
step
talk Syra Goldendraft##56708
turnin Shrine of the Dawn##29995 |goto 52.57,38.12
accept Getting Permission##29920 |goto 52.57,38.12
step
talk Pandriarch Bramblestaff##56209
Choose _"Challenge the Pandriarch."_ |gossip 40636
kill Pandriarch Bramblestaff##56209
|tip He will eventually surrender.
Defeat Pandriarch Bramblestaff |q 29920/2 |goto 54.09,38.46
step
talk Pandriarch Goldendraft##56210
Choose _"Challenge the Pandriarch."_ |gossip 40637
kill Pandriarch Goldendraft##56210
|tip He will eventually surrender.
Defeat Pandriarch Goldendraft |q 29920/3 |goto 53.59,36.73
step
talk Pandriarch Windfur##56206
Choose _"Challenge the Pandriarch."_ |gossip 40541
kill Pandriarch Windfur##56206
|tip He will eventually surrender.
Defeat Pandriarch Windfur |q 29920/1 |goto 52.54,35.57
step
talk Lo Wanderbrew##55788
turnin Getting Permission##29920 |goto 52.59,38.12
step
talk Lorewalker Cho##56345
turnin All We Can Spare##29925 |goto 50.91,27.08
step
talk Foreman Mann##56346
accept I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
talk Supplier Towsa##59735
fpath Emperor's Omen |goto 50.82,26.80
step
kill Puckish Sprite##56349+
|tip They look like small green imps.
click Chunk of Jade##209863+
|tip They look like green rocks that appear on the ground after you kill sprites.
collect 15 Chunk of Jade##76209 |q 29928/1 |goto 48.33,31.10
step
talk Foreman Mann##56346
turnin I Have No Jade And I Must Scream##29928 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept Calamity Jade##29926 |goto 50.94,27.03
accept Mann's Man##29927 |goto 50.94,27.03
step
talk Studious Chu##59736
fpath Tian Monastery |goto 43.58,24.53
step
talk Bolo the Elder##62867
|tip Inside the building.
home Paur's Pub |goto 41.72,23.16
step
Enter the mine |goto 45.86,28.84 < 10 |walk
Locate Hao Mann |q 29927/1 |goto The Jade Forest/6 60.96,36.74
|tip Inside the mine.
step
talk Hao Mann##56347
|tip Inside the mine.
turnin Mann's Man##29927 |goto 60.96,36.74
accept Trapped!##29929 |goto 60.96,36.74
stickystart "Kill_Greenstone_Nibblers"
stickystart "Free_Greenstone_Miners"
step
kill 6 Greenstone Gorger##56404 |q 29926/2 |goto The Jade Forest/0 45.86,28.84
|tip They look like large stone spiders.
|tip Throughout the mine.
step
label "Free_Greenstone_Miners"
talk Greenstone Miner##56464+
|tip They look like pandas inside piles of large rocks.
|tip Throughout the mine. |notinsticky
Free #8# Greenstone Miners |q 29929/1 |goto 45.86,28.84
step
label "Kill_Greenstone_Nibblers"
kill 12 Greenstone Nibbler##56401 |q 29926/1 |goto 45.86,28.84
|tip They look like small stone spiders.
|tip Throughout the mine. |notinsticky
step
Follow the path up and leave the mine |goto 45.86,28.84 < 10 |walk |only if subzone("Greenstone Quarry") and indoors()
talk Hao Mann##56467
turnin Trapped!##29929 |goto 46.30,29.39
accept What's Mined Is Yours##29930 |goto 46.30,29.39
step
clicknpc Jade Cart##56527
Ride in the Jade Cart |invehicle |goto 46.27,29.48 |q 29930
step
Watch the dialogue
Kill the enemies that attack in waves
Deliver the Jade |q 29930/1 |goto 51.21,26.72 |notravel
'|kill Brittle Greenstone Gorger##56543
step
Watch the dialogue
talk Foreman Mann##56346
turnin Calamity Jade##29926 |goto 50.94,27.03
turnin What's Mined Is Yours##29930 |goto 50.94,27.03
step
Watch the dialogue
talk Foreman Mann##56346
accept The Serpent's Heart##29931 |goto 50.94,27.03
step
talk Gingo Alebottom##59733
fpath Sri-La Village |goto 55.38,23.73
step
talk Foreman Raike##59391
turnin The Serpent's Heart##29931 |goto 48.31,61.35
accept Love's Labor##30495 |goto 48.31,61.35
step
talk Historian Dinh##59395
Tell him _"I've got a new jade shipment for you."_ |gossip 39183
Complete the Delivery to Historian Dinh |q 30495/1 |goto 46.36,61.80
step
talk Surveyor Sawa##59401
Tell him _"I've got your jade right here."_ |gossip 40697
Complete the Delivery to Surveyor Sawa |q 30495/2 |goto 46.94,60.35
step
talk Kitemaster Shoku##59392
Tell him _"I've got a jade delivery for you."_ |gossip 39632
Complete the Delivery to Kitemaster Shoku |q 30495/3 |goto 48.17,60.02
step
talk Kitemaster Shoku##59392
|tip You can skip this step if you are able to fly.
Tell him _"I need a ride to the top of the statue."_ |gossip 39631
Begin Riding a Kite to the Top of the Statue |invehicle |goto 48.18,60.02 |q 30495
step
Ride a Kite to the Top of the Statue |outvehicle |goto 47.46,60.58 |q 30495 |notravel
step
talk Taskmaster Emi##59397
|tip On a platform at the top of the statue.
Ask her _"Did someone say they needed jade?"_ |gossip 39805
Complete the Delivery to Taskmaster Emi |q 30495/4 |goto 47.58,60.67
step
talk Kitemaster Inga##59400
|tip On a platform at the top of the statue.
|tip You can skip this step if you are able to fly.
Tell her _"I need a ride to the bottom of the statue."_ |gossip 39806
Begin Riding a Kite to the Bottom of the Statue |invehicle |goto 47.45,60.51 |q 30495
step
Ride a Kite to the Bottom of the Statue |outvehicle |goto 48.23,60.00 |q 30495 |notravel
step
talk Foreman Raike##59391
turnin Love's Labor##30495 |goto 48.31,61.35
accept The Temple of the Jade Serpent##29932 |goto 48.31,61.35
step
talk Kitemaster Shoku##59392
Tell him _"Take me to the Temple of the Jade Serpent."_ |gossip 39633
Begin Flying to the Temple of the Jade Serpent |invehicle |goto 48.18,60.02 |q 29932
step
Fly to the Temple of the Jade Serpent |outvehicle |goto 55.67,57.05 |q 29932 |notravel
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
Tell her _"I have a message for the Jade Serpent."_ |gossip 40586
Speak to Elder Sage Wind-Yi |q 29932/1 |goto 55.84,57.07
Also check around [54.99,56.89]
step
Watch the dialogue
talk Elder Sage Rain-Zhu##56782
turnin The Temple of the Jade Serpent##29932 |goto 58.13,58.66
accept The Scryer's Dilemma##29997 |goto 58.13,58.66
accept The Librarian's Quandary##29998 |goto 58.13,58.66
step
talk Fei##56784
accept The Rider's Bind##29999 |goto 58.03,59.01
accept Lighting Up the Sky##30005 |goto 58.03,59.01
stickystart "Launch_Fireworks"
step
clicknpc Playful Crimson Serpent##56852
|tip It moves around this small area.
Find the Playful Crimson Serpent |q 29999/2 |goto 58.18,61.39
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin The Librarian's Quandary##29998 |goto 56.26,60.43
accept Moth-Ridden##30001 |goto 56.26,60.43
accept Pages of History##30002 |goto 56.26,60.43
stickystop "Launch_Fireworks"
stickystart "Kill_Dappled_Moths"
stickystart "Squash_Bookworms"
step
clicknpc Playful Gold Serpent##56850
|tip It moves around this small area.
|tip Inside the building.
Find the Playful Gold Serpent |q 29999/4 |goto 56.00,60.32
step
label "Kill_Dappled_Moths"
kill 8 Dappled Moth##57232 |q 30001/1 |goto 56.00,60.32
|tip They look like butterflies.
|tip Inside the building. |notinsticky
step
label "Squash_Bookworms"
click Infested Book##209594+
|tip They look like large green books.
|tip Inside the building. |notinsticky
kill Bookworm##57237+
|tip You can right-click them repeatedly to kill them quickly.
Squash #12# Bookworms |q 30002/1 |goto 56.00,60.32
step
talk Lorewalker Stonestep##56786
|tip Inside the building.
turnin Moth-Ridden##30001 |goto 56.26,60.44
turnin Pages of History##30002 |goto 56.26,60.44
accept Everything In Its Place##30004 |goto 56.26,60.44
step
clicknpc Playful Emerald Serpent##56851
|tip It moves around this small area.
|tip Follow the stairs up and leave the building to find it.
Find the Playful Emerald Serpent |q 29999/3 |goto 56.54,58.38
step
kill Water Fiend##56820+
|tip They look like small water elementals.
|tip Inside the building.
collect Scryer's Staff##76725 |q 29997/1 |goto 57.46,55.98
step
talk Wise Mari##56787
|tip Inside the building.
turnin The Scryer's Dilemma##29997 |goto 57.57,56.03
accept A New Vision##30011 |goto 57.57,56.03
stickystart "Launch_Fireworks"
step
clicknpc Playful Azure Serpent##56853
|tip It moves around this small area.
Find the Playful Azure Serpent |q 29999/1 |goto 59.21,56.73
step
label "Launch_Fireworks"
click Firework Launcher##209672+
|tip They look like metal pots sitting on wooden pallets.
Launch #8# Fireworks |q 30005/1 |goto 57.46,58.50
step
talk Elder Sage Rain-Zhu##56782
turnin A New Vision##30011 |goto 58.14,58.66
turnin Everything In Its Place##30004 |goto 58.14,58.66
step
talk Fei##56784
turnin The Rider's Bind##29999 |goto 58.03,59.01
turnin Lighting Up the Sky##30005 |goto 58.03,59.01
accept The Jade Serpent##30000 |goto 58.03,59.01
step
Watch the dialogue
Listen to the Jade Serpent |q 30000/1
step
talk Elder Sage Wind-Yi##57242
|tip She walks around this area.
turnin The Jade Serpent##30000 |goto 55.84,57.08
accept Get Back Here!##30499 |goto 55.84,57.08
Also check around [54.99,56.89]
step
talk Ginsa Arroweye##59727
fpath Jade Temple Grounds |goto 54.57,61.76
step
talk Ginsa Arroweye##59727
Tell her _"I could use a kite to Grookin' Hill."_ |gossip 28345
Begin Flying to Grookin Hill |invehicle |goto 54.57,61.76 |q 30499
step
Fly to Grookin Hill |outvehicle |goto 28.02,46.97 |q 30499 |notravel
step
talk General Nazgrim##57108
turnin Get Back Here!##30499 |goto 28.03,47.19
accept Gauging Our Progress##30484 |goto 28.03,47.19
accept Sufficient Motivation##30466 |goto 28.03,47.19
stickystart "Motivate_Hozen"
step
click Barrel of Slickies##209974
collect Bucket of Slicky Water##79884 |q 30466/2 |goto 28.11,47.39
step
talk Rivett Clutchpop##59305
Tell him _"General Nazgrim needs an update on your progress."_ |gossip 40695
collect Rivett Clutchpop's Report##80014 |q 30484/2 |goto 28.41,47.79
step
talk Shademaster Kiryn##56841
Tell her _"General Nazgrim wants an update on your progress."_ |gossip 40230
collect Shademaster Kiryn's Report##80013 |q 30484/1 |goto 29.16,50.89
stickystop "Motivate_Hozen"
step
talk Shokia##56838
|tip She walks around this area.
Tell her _"General Nazgrim needs your training report."_ |gossip 40583
collect Shokia's Report##80015 |q 30484/3 |goto 28.39,51.93
step
talk Riko##56840
Tell him _"General Nazgrim wants to know the status of the supplies."_ |gossip 40301
collect Riko's Report##80061 |q 30484/4 |goto 27.00,54.94
step
label "Motivate_Hozen"
use the Bucket of Slicky Water##79884
|tip Use it on Lazy Hozens.
|tip They look like monkeys sleeping on the ground, or hanging from ropes.
Motivate #10# Hozen |q 30466/1 |goto 27.63,48.80
step
talk General Nazgrim##57108
turnin Gauging Our Progress##30484 |goto 28.03,47.19
turnin Sufficient Motivation##30466 |goto 28.03,47.19
step
talk Lorewalker Cho##59377
accept Last Piece of the Puzzle##30485 |goto 28.22,46.72
step
talk Mishi##64207
Tell it _"I am ready to leave."_ |gossip 28426
Begin Flying to Serpent's Overlook |invehicle |goto 28.19,46.72 |q 30485
step
Fly to Serpent's Overlook |outvehicle |goto 44.65,67.24 |q 30485 |notravel
step
talk Sky Dancer Ji##64310
fpath Serpent's Overlook |goto 43.10,68.49
step
use the Cho Family Heirloom##80071
|tip At the top of the mountain.
Watch the dialogue
Place the Heirloom at the Cho Family Shrine |q 30485/1 |goto 44.50,66.93
step
talk Lorewalker Cho##59411
|tip At the top of the mountain.
turnin Last Piece of the Puzzle##30485 |goto 44.77,67.09
accept The Seal is Broken##31303 |goto 44.77,67.09
step
talk Mishi##64475
Tell it _"Let's do this, Mishi!"_ |gossip 38770
Fly with Mishi |invehicle |goto 44.77,67.04 |q 31303
step
Seal #12# Sha Fissures |q 31303/1 |goto 47.30,58.20
|tip Use the ability on your action bar on the white smoke pillars on the ground as you fly.
step
talk Lorewalker Cho##59418
turnin The Seal is Broken##31303 |goto 49.30,61.48
accept Residual Fallout##30500 |goto 49.30,61.48
accept Jaded Heart##30502 |goto 49.30,61.48
accept Emergency Response##30504 |goto 49.30,61.48
stickystart "Kill_Sha_Remnants"
stickystart "Kill_Sha_Echoes"
step
use Cho's Fireworks##86467
Rescue General Nazgrim |q 30504/1 |goto 48.13,61.77
step
use Cho's Fireworks##86467
Rescue Shademaster Kiryn |q 30504/2 |goto 47.24,62.54
step
use Cho's Fireworks##86467
Rescue Shokia |q 30504/3 |goto 46.87,60.71
step
use Cho's Fireworks##86467
Rescue Rivett Clutchpop |q 30504/4 |goto 48.02,59.08
step
label "Kill_Sha_Remnants"
click Celestial Jade##210921+
|tip They look like small green rocks on the ground around this area.
collect Celestial Jade##80074+ |n
use the Celestial Jade##80074+
|tip Use them on Sha Remnants.
|tip They look like larger shadow aliens.
|tip They till become non-elite and easy to kill.
kill 6 Sha Remnant##59434 |q 30502/1 |goto 46.93,60.72
step
label "Kill_Sha_Echoes"
kill 12 Sha Echo##59417 |q 30500/1 |goto 46.93,60.72
|tip They look like smaller shadow aliens.
step
talk Lorewalker Cho##59418
turnin Residual Fallout##30500 |goto 49.30,61.48
turnin Jaded Heart##30502 |goto 49.30,61.48
turnin Emergency Response##30504 |goto 49.30,61.48
step
talk Fei##59899
accept Moving On##30648 |goto 49.30,61.42
step
talk Fei##59899
Tell her _"I am ready to leave."_ |gossip 29679
Begin Flying to the Valley of the Four Winds |invehicle |goto 49.30,61.42 |q 30648
step
Watch the dialogue
Travel to the Valley of the Four Winds |q 30648/1 |goto Valley of the Four Winds/0 85.97,21.72 |notravel
step
_Click the Complete Quest Box:_
turnin Moving On##30648
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Valley of the Four Winds (20-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."ValleyOfTheFourWinds",
condition_suggested=function() return level >= 20 and level <= 70 and not completedq(29990) end,
startlevel=20,
endlevel=70,
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Krasarang Wilds (20-70) (Story Only)",
},[[
step
talk Chen Stormstout##56133
accept Chen and Li Li##29907 |goto Valley of the Four Winds/0 85.94,22.10
step
talk Princeton##60230
fpath Pang's Stead |goto 84.49,21.06
step
Watch the dialogue
Follow Chen and Li Li to Pang's Stead |q 29907/1 |goto 83.78,21.17
step
talk Pang Thunderfoot##56204
turnin Chen and Li Li##29907 |goto 83.70,21.03
accept A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
step
talk Nan Thunderfoot##65528
|tip Inside the building.
home Thunderfoot Inn |goto 83.76,20.19 |q 29877 |future
stickystart "Slay_Large_Virmen"
stickystart "Slay_Virmen_Pesterers"
step
talk Muno the Farmhand##56440
accept A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
clicknpc Plow Plant##56281+
|tip They look like plows sticking up out of dirt piles around this area.
clicknpc Hoe Tree##56280+
|tip They look like hoes sticking up out of dirt piles around this area.
clicknpc Rake Tree##56279+
|tip They look like rakes sticking up out of dirt piles around this area.
clicknpc Barrow Bush##56278+
|tip They look like wheelbarrow handles sticking up out of dirt piles around this area.
Find #7# Buried Farm Equipment |q 29877/1 |goto 80.71,21.45
step
label "Slay_Large_Virmen"
Kill Snagtooth enemies around this area
|tip They look like larger rats.
Slay #8# Large Virmen |q 29908/1 |goto 80.71,21.45
'|kill Snagtooth Virmen##56184, Snagtooth Tool-Grabber##56185, Snagtooth Troublemaker##55873
step
label "Slay_Virmen_Pesterers"
kill Snagtooth Pesterling##65504+
|tip They look like tiny rats that run around in groups.
Slay #18# Virmen Pesterers |q 29908/2 |goto 80.71,21.45
step
talk Muno the Farmhand##56440
turnin A Poor Grasp of the Basics##29877 |goto 82.70,21.24
step
talk Pang Thunderfoot##56204
turnin A Seemingly Endless Nuisance##29908 |goto 83.70,21.03
accept Low Turnip Turnout##29909 |goto 83.70,21.03
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Low Turnip Turnout##29909 |goto 81.59,25.22
accept Taking a Crop##29940 |goto 81.59,25.22
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
accept Rampaging Rodents##29910 |goto 82.23,25.94
stickystart "Fill_Marmot_Holes"
step
clicknpc Plump Marmot##56203+
|tip They look like brown rodents running on the ground.
Move #6# Plump Marmots |q 29910/1 |goto 82.38,25.15
step
label "Fill_Marmot_Holes"
click Marmot Hole##209835+
|tip They look like piles of dirt on the ground.
Fill #6# Marmot Holes |q 29910/2 |goto 82.38,25.15
step
talk Ana Thunderfoot##56465
|tip She walks around this area.
turnin Rampaging Rodents##29910 |goto 82.23,25.94
step
Enter the underground burrow |goto 86.50,28.08 < 10 |walk
click Stolen Turnip##209891+
|tip They look like round white vegetables with green leaves.
|tip Inside the underground burrow.
collect 5 Stolen Turnip##76297 |q 29940/1 |goto 84.86,27.01
step
Leave the underground burrow |goto 86.56,28.08 < 10 |walk |only if subzone("Virmen Nest") and indoors()
click Stolen Watermelon##209899+
|tip They look like watermelons floating in the water with flag poles in them.
collect 5 Stolen Watermelon##76298 |q 29940/2 |goto 85.56,33.13
step
talk Ang Thunderfoot##56207
|tip He walks around this area.
turnin Taking a Crop##29940 |goto 81.59,25.22
accept Practically Perfect Produce##29911 |goto 81.59,25.22
step
talk Pang Thunderfoot##56204
turnin Practically Perfect Produce##29911 |goto 83.70,21.02
accept The Fabulous Miss Fanny##29912 |goto 83.70,21.02
step
click Ang's Giant Pink Turnip##209844
collect Ang's Giant Pink Turnip##75259 |goto 84.28,21.89 |q 29912 |future
step
click Ang's Summer Watermelon##209843
collect Ang's Summer Watermelon##75258 |goto 84.16,22.07 |q 29912 |future
step
click Pang's Extra-Spicy Tofu##209842
collect Pang's Extra-Spicy Tofu##75256 |goto 84.04,22.00 |q 29912 |future
step
talk Miss Fanny##56192
Tell it _"Hit it with average power."_ |gossip 40435
Launch a Pink Turnip |q 29912/1 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell it _"Hit it very softly."_ |gossip 40434
Launch a Watermelon |q 29912/2 |goto 83.00,21.36
step
talk Miss Fanny##56192
Tell it _"Hit it as hard as possible."_ |gossip 40436
Launch the Extra-Spicy Tofu |q 29912/3 |goto 83.00,21.36
step
talk Liang Thunderfoot##56205
turnin The Fabulous Miss Fanny##29912 |goto 75.22,24.05
accept The Meat They'll Eat##29913 |goto 75.22,24.05
accept Back to the Sty##29914 |goto 75.22,24.05
stickystart "Collect_Turtle_Meat_Scraps"
stickystart "Collect_Mushan_Shoulder_Steaks"
step
talk Kim of the Mountain Winds##62658
fpath Grassy Cline |goto 70.82,24.10
step
clicknpc Jian##56253
|tip She looks like a grey pig that walks around this area.
Find Jian |q 29914/1 |goto 70.39,24.05
step
clicknpc Smelly##56255
|tip She looks like a white pig that walks around this area.
Find Smelly |q 29914/3 |goto 70.56,28.36
step
clicknpc Ling##56254
|tip She looks like a grey pig that walks around this area.
Find Ling |q 29914/2 |goto 67.08,29.74
step
label "Collect_Turtle_Meat_Scraps"
kill Wyrmhorn Turtle##56256+
collect 80 Turtle Meat Scrap##75276 |q 29913/2 |goto 67.87,29.22
step
label "Collect_Mushan_Shoulder_Steaks"
kill Adolescent Mushan##56239+
|tip They look like yellow dinosaurs.
collect 4 Mushan Shoulder Steak##75275 |q 29913/1 |goto 71.90,29.94
step
talk Liang Thunderfoot##56205
turnin The Meat They'll Eat##29913 |goto 75.22,24.06
turnin Back to the Sty##29914 |goto 75.22,24.06
accept A Neighbor's Duty##29915 |goto 75.22,24.07
step
talk Francis the Shepherd Boy##56208
turnin A Neighbor's Duty##29915 |goto 78.12,32.91
accept Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
accept Lupello##29917 |goto 78.12,32.91
stickystart "Kill_Thieving_Wolves"
stickystart "Kill_Thieving_Plainshawks"
step
kill Lupello##56357 |q 29917/1 |goto 81.76,39.85
|tip He looks like a large black wolf that walks around this area.
step
label "Kill_Thieving_Wolves"
kill 6 Thieving Wolf##56106 |q 29916/2 |goto 81.64,35.01
step
label "Kill_Thieving_Plainshawks"
kill 5 Thieving Plainshawk##56034 |q 29916/1 |goto 80.40,31.74
|tip They look like brown birds perched in trees or flying in the air.
step
talk Francis the Shepherd Boy##56208
turnin Piercing Talons and Slavering Jaws##29916 |goto 78.12,32.91
turnin Lupello##29917 |goto 78.12,32.91
step
Watch the dialogue
talk Shang Thunderfoot##56312
accept A Lesson in Bravery##29918 |goto 78.18,32.82
step
use the Rancher's Lariat##75208
|tip Use it on Great White Plainshawks.
|tip They look like larger white birds flying in the air.
kill Great White Plainshawk##56171 |q 29918/1 |goto 79.40,34.76
|tip Kill it while flying around on its back.
|tip Use the ability that appears as a button on the screen.
step
talk Shang Thunderfoot##56312
|tip He walks around this area.
turnin A Lesson in Bravery##29918 |goto 74.56,34.61
step
talk Chen Stormstout##56133
accept Great Minds Drink Alike##29919 |goto 75.28,35.50
step
talk Chen Stormstout##56133
Tell him _"I'm ready. Let's hit the road."_ |gossip 40440
Watch the dialogue
Follow Chen and Li Li |goto 75.28,35.50 > 10 |c |q 29919
step
Watch the dialogue
|tip Follow Chen and Li Li as they walk.
|tip They eventually walk to this location.
Escort Chen and Li Li |q 29919/1 |goto 68.87,43.15
step
talk Mudmug##56474
turnin Great Minds Drink Alike##29919 |goto 68.72,43.12
step
talk Chen Stormstout##56133
accept Leaders Among Breeders##29944 |goto 68.87,43.15
step
talk Li Li##56138
accept Yellow and Red Make Orange##29945 |goto 68.89,43.32
stickystart "Collect_Vial_Animal_Bloods"
step
click Meadow Marigold##209907+
|tip They look like yellow flowers.
collect 10 Meadow Marigold##76334 |q 29945/1 |goto 70.53,47.94
step
kill Aiyu the Skillet##56520 |q 29944/1 |goto 68.29,38.01
|tip He looks like a large rat that walks around this area.
step
kill Jinanya the Clawblade##56513 |q 29944/2 |goto 65.97,37.39
|tip He looks like a large rat that walks around this area.
step
kill Frenzyhop##56514 |q 29944/3 |goto 64.53,40.65
|tip He looks like a large rat that walks around this area.
step
label "Collect_Vial_Animal_Bloods"
Kill enemies around this area
|tip Only beast enemies will drop the quest items.
collect 40 Vial of Animal Blood##76335 |q 29945/2 |goto 68.71,48.24
You can find more around [66.67,39.42]
'|kill Tawnyhide Fawn##56526, Tawnyhide Stag##56532, Mushan Nomad##56523, Tawnyhide Doe##56531, Longfang Howler##56524
step
talk Li Li##56138
turnin Yellow and Red Make Orange##29945 |goto 68.88,43.30
accept Crouching Carrot, Hidden Turnip##29947 |goto 68.87,43.31
step
talk Chen Stormstout##56133
turnin Leaders Among Breeders##29944 |goto 68.88,43.15
accept The Warren-Mother##29946 |goto 68.88,43.15
step
talk Mudmug##56474
accept Thieves to the Core##29948 |goto 68.71,43.12
stickystart "Collect_Stolen_Sack_Of_Hops"
stickystart "Trick_Virmen_With_Orange_Painted_Turnips"
step
Enter the underground burrow |goto 65.99,38.38 < 10 |walk
kill Chufa##56537 |q 29946/1 |goto 67.90,37.44
|tip Inside the underground burrow.
step
label "Collect_Stolen_Sack_Of_Hops"
click Stolen Sack of Hops##211696+
|tip They look like tan bags filled with green balls.
|tip Throughout the underground burrow. |notinsticky
collect 6 Stolen Sack of Hops##76337 |q 29948/1 |goto 69.05,39.90
step
label "Trick_Virmen_With_Orange_Painted_Turnips"
use the Orange-Painted Turnip##76370
|tip Use it on Twitchheel Hoarders.
|tip They look like rat people around this area.
|tip Inside and outside the underground burrow.
Trick #12# Virmen with Orange-Painted Turnips |q 29947/1 |goto 67.88,36.52
'|kill Twitchheel Hoarder##56538
step
talk Li Li##56138
turnin Crouching Carrot, Hidden Turnip##29947 |goto 68.88,43.32
stickystart "Collect_Stolen_Sack_Of_Hops"
step
talk Mudmug##56474
turnin Thieves to the Core##29948 |goto 68.71,43.12
step
talk Chen Stormstout##56133
turnin The Warren-Mother##29946 |goto 68.88,43.15
accept Legacy##29949 |goto 68.88,43.14
step
Watch the dialogue
talk Li Li##56138
turnin Legacy##29949 |goto 68.77,43.44
accept Li Li's Day Off##29950 |goto 68.77,43.44
step
Watch the dialogue
talk Mudmug##56474
accept Muddy Water##29951 |goto 68.7,43.1
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to Huangtze Falls |q 29950/3 |goto 74.96,42.42
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to New Cifera |q 29950/2 |goto 61.90,35.36
step
talk Wing Nga##60231
fpath Halfhill |goto 56.50,50.36
step
talk Innkeeper Lei Lan##59582
|tip She walks around on both floors inside the building.
home The Lazy Turnip |goto 55.11,50.55 |q 32035 |future
step
use Li Li's Wishing-Stone##76350
|tip Use it if she's not following you.
Bring Li Li to the Silken Fields |q 29950/1 |goto 61.79,58.85
step
click Muddy Water##209921+
|tip They look like green spots on the water around this area.
|tip Fill up the flask that appears on your screen.
collect Stoppered Vial of Muddy Water##76356 |q 29951/1 |goto 71.61,56.13
step
talk Li Li##56138
turnin Li Li's Day Off##29950 |goto 68.78,43.43
step
talk Mudmug##56474
turnin Muddy Water##29951 |goto 68.71,43.12
step
Watch the dialogue
talk Chen Stormstout##56133
accept Broken Dreams##29952 |goto 68.85,43.41
step
talk Chen Stormstout##56133 |goto 68.85,43.41
Ask him _"What happened, Chen?"_ |gossip 40423
Enter Chen's Story |invehicle |goto 68.85,43.41 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Unruly Alemental##56684
|tip Use the abilities on your action bar.
Click Here After Killing the Unruly Alemental |confirm |goto 34.25,70.57 |q 29952
step
Watch the dialogue
|tip Inside the building.
kill Wuk-Wuk##56691
|tip Use the abilities on your action bar.
Click Here After Killing Wuk-Wuk |confirm |goto 35.87,72.72 |q 29952
step
Watch the dialogue
|tip Upstairs inside the building.
|tip Follow the path up into the upper level of the building.
Listen to Chen's Story |q 29952/1 |goto 34.55,70.75
step
talk Chen Stormstout##56133
turnin Broken Dreams##29952 |goto 68.85,43.40
accept Chen's Resolution##30046 |goto 68.85,43.40
step
talk Chen Stormstout##56133
turnin Chen's Resolution##30046 |goto 55.89,49.44
accept Hop Hunting##30053 |goto 55.89,49.44
accept Li Li and the Grain##30048 |goto 55.89,49.44
accept Doesn't Hold Water##30049 |goto 55.89,49.44
step
talk Mudmug##56474
|tip He walks around this small area.
turnin Doesn't Hold Water##30049 |goto 54.28,38.74
accept The Great Water Hunt##30051 |goto 54.28,38.74
step
talk Mudmug##56474
|tip He walks around this small area.
Tell him _"I'm ready to go, Mudmug."_ |gossip 40623
Speak to Mudmug |q 30051/1 |goto 54.28,38.74
step
Gather #30# Gladewater |q 30051/2 |goto 54.14,31.20
|tip Bring Mudmug near Swirling Pools.
|tip They look like dark blue glittering spots on the ground around this area.
step
_Next to you:_
talk Mudmug##58785
turnin The Great Water Hunt##30051
accept Barreling Along##30172
step
Lead Mudmug Back to Halfhill |q 30172/1 |goto 55.89,49.43
If he's not following you, you can find Mudmug around [54.28,38.74]
step
talk Chen Stormstout##56133
turnin Barreling Along##30172 |goto 55.89,49.43
step
talk Gardener Fran##62377
accept Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Tell her _"I'm ready to go!"_ |gossip 36034
Water #60# Vegetables |q 30050/1 |goto 48.31,33.48
|tip Use the "Water Plants" ability near vegetables around this area.
|tip It appears as a button on the screen.
|tip She tells you what vegetables need to be watered.
|tip The type of vegetables that need to be watered will sparkle.
|tip All of the patches you need to water will be north of her location, around the big hill.
step
talk Gardener Fran##62377
turnin Gardener Fran and the Watering Can##30050 |goto 48.31,33.48
step
talk Gardener Fran##62377
Ask her _"I'm helping a friend brew some beer, and we need hops. Do you have any to spare?"_ |gossip 36036
Speak with Gardener Fran |q 30053/1 |goto 48.31,33.48
step
talk Den Mudclaw##62385
accept The Farmer's Daughter##30056 |goto 44.26,34.21
step
talk Den Mudclaw##62385
Ask him _"Do you have any hops you can spare?"_ |gossip 35295
Speak with Den Mudclaw |q 30053/3 |goto 44.26,34.21
step
talk Mung-Mung##57401
accept Enough is Ookin' Enough##30054 |goto 44.17,34.24
stickystart "Collect_Virmen_Teeth"
step
Enter the underground burrow |goto 43.55,35.34 < 10 |walk
talk Mina Mudclaw##57408
|tip Inside the underground burrow.
turnin The Farmer's Daughter##30056 |goto 41.32,38.14
accept Seeing Orange##30057 |goto 41.32,38.14
step
label "Collect_Virmen_Teeth"
Kill Springtail enemies around this area
|tip They look like small and large rats.
|tip Inside the and outside the underground burrow. |notinsticky
collect 100 Virmen Tooth##77379 |q 30054/1 |goto 43.55,35.34
'|kill Springtail Gnasher##57413, Springtail Digger##66264, Springtail Leaper##57415
step
Leave the underground burrow |goto 43.55,35.34 < 10 |walk |only if subzone("Springtail Warren") and indoors()
Bring Mina Mudclaw Home to Her Father |q 30057/1 |goto 44.27,34.21
step
talk Den Mudclaw##62385
turnin Seeing Orange##30057 |goto 44.27,34.21
step
talk Mung-Mung##57401
turnin Enough is Ookin' Enough##30054 |goto 44.17,34.24
step
talk Gai Lan##57385
Ask him _"Can I buy some hops from you?"_ |gossip 40211
Speak with Gai Lan |q 30053/2 |goto 38.59,51.71
step
_Click the Complete Quest Box:_
turnin Hop Hunting##30053
step
talk Gai Lan##57385
accept Weed War##30052 |goto 38.59,51.71
step
talk Gai Lan##57385
Ask him _"What weeds?"_ |gossip 40209
Watch the dialogue
clicknpc Ugly Weed##57306+
clicknpc Nasty Weed##57308+
click Weed-B-Gone Gas Bomb##210057+
Pull #100# Weeds |q 30052/1 |goto 38.59,51.71
|tip Run over the small blue weeds that appear on the ground around this area.
|tip You can do this while mounted.
step
talk Gai Lan##57385
turnin Weed War##30052 |goto 38.59,51.71
step
accept Stormstout's Hops##30055 |goto 38.59,51.71
|tip You will automatically accept this quest.
step
talk Chen Stormstout##56133
turnin Stormstout's Hops##30055 |goto 55.89,49.45
step
talk Li Li##56138
turnin Li Li and the Grain##30048 |goto 52.69,62.83
accept Taste Test##30031 |goto 52.69,62.83
step
talk Grainlord Kai##57211
accept Wee Little Shenanigans##30029 |goto 52.73,62.99
step
talk Grainer Pan##57209
accept Out of Sprite##30030 |goto 52.61,62.97
stickystart "Kill_Tricky_Maizer"
step
kill Cornan##57213 |q 30030/1 |goto 51.47,64.42
|tip He runs around this area upstairs inside the building.
step
click Malted Grain##210023
Taste the Malted Grain |q 30031/3 |goto 50.80,63.61
step
click Aged Grain##210021
Taste the Aged Grain |q 30031/1 |goto 51.17,60.79
step
click Light Grain##210024
Taste the Light Grain |q 30031/2 |goto 53.73,63.31
step
click Fresh Grain##210022
Taste the Fresh Grain |q 30031/4 |goto 53.59,64.58
step
label "Kill_Tricky_Maizer"
Kill Maizerly enemies around this area
|tip They look like larger sprites.
Slay #8# Tricky Maizers |q 30029/1 |goto 52.30,62.29
'|kill Granary Vandal##66205, Tricky Maizer##57223
step
talk Li Li##56138
turnin Taste Test##30031 |goto 52.69,62.83
step
talk Grainer Pan##57209
turnin Out of Sprite##30030 |goto 52.60,62.97
step
talk Grainlord Kai##57211
turnin Wee Little Shenanigans##30029 |goto 52.74,62.99
accept The Quest for Better Barley##30032 |goto 52.74,62.99
accept Grain Recovery##30028 |goto 52.74,62.99
step
kill Maizerly Thief##57267+
|tip They look like larger sprites running around carrying large white bags.
click Stolen Barley Sack##210002+
|tip They look like large white bags.
collect 8 Sack of Grain##77033 |q 30028/1 |goto 56.17,64.96
step
talk Grainlord Kai##57211
turnin Grain Recovery##30028 |goto 52.73,63.00
step
click Rappeling Rope##7548
Use the Cliff Harness |q 30032/1 |goto 51.26,77.50
step
click Malted Cave Barley##210037+
|tip They look like small bushes.
|tip Inside the small cave.
collect Malted Cave Barley##77034 |q 30032/2 |goto 53.58,76.26
step
click Climbing Rope
Climb Up the Cliff |invehicle |goto Krasarang Wilds/0 48.65,27.02 |q 30032
|only if walking
step
talk Li Li##56138
turnin The Quest for Better Barley##30032 |goto Valley of the Four Winds/0 52.69,62.83
accept The Chen Taste Test##30047 |goto Valley of the Four Winds/0 52.69,62.83
step
talk Chen Stormstout##56133
turnin The Chen Taste Test##30047 |goto 55.89,49.45
accept The Emperor##30073 |goto 55.89,49.45
step
Watch the dialogue
Help Chen Brew His Beer |q 30073/1 |goto 55.89,49.45
step
talk Chen Stormstout##56133
turnin The Emperor##30073 |goto 55.84,49.35
accept Knocking on the Door##30074 |goto 55.84,49.35
step
talk Chen Stormstout##56133
turnin Knocking on the Door##30074 |goto 32.25,68.55
step
Watch the dialogue
talk Mudmug##56474
accept The Fanciest Water##30076 |goto 32.26,68.28
step
talk Li Li##56138
accept Barrels, Man##30077 |goto 32.33,68.47
step
talk Chen Stormstout##56133
accept Clear the Way##30075 |goto 32.11,68.34
stickystart "Collect_Spritewater_Essences"
stickystart "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
step
clicknpc Barreled Pandaren##57662+
|tip They look like shaking wooden barrels.
|tip Avoid Ook-Ook, the huge elite monkey that runs up and down the road.
|tip If he catches you, use the "Break Barrel" ability.
Free #7# Barreled Pandaren |q 30077/1 |goto 35.95,66.10
step
label "Collect_Spritewater_Essences"
kill Curious Water Sprite##57673+
|tip They look like small blue elementals wearing masks.
collect 3 Spritewater Essence##77471 |q 30076/1 |goto 35.95,66.10
step
label "Kill_Ale_Addled_Hozen_Or_Mischievous_Virmen"
Kill enemies around this area
|tip They look like rats and monkeys.
Slay #10# Ale-Addled Hozen or Mischievous Virmen |q 30075/1 |goto 35.95,66.10
'|kill Ale-Addled Hozen##57672, Mischievous Virmen##57671
step
talk Li Li##56138
turnin Barrels, Man##30077 |goto 36.13,69.05
step
talk Mudmug##56474
turnin The Fanciest Water##30076 |goto 36.0,69.1
step
talk Chen Stormstout##56133
turnin Clear the Way##30075 |goto 36.04,68.99
accept Cleaning House##30078 |goto 36.04,68.99
step
talk Chen Stormstout##56133
Select  _"<Crack your knuckles and nod your head.>"_ |gossip 39238
Enter the Stormstout Brewery |complete subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") |goto 36.04,68.99 |q 30078
step
label "Stormstout_Brewery_Router"
Watch the dialogue
|tip This sequence of this quest is random.
|tip You will appear in one of the random locations.
Stormstout Brewhall	|complete subzone("Stormstout Brewhall")	|q 30078	|or	|next "Stormstout_Brewhall"
The Great Wheel		|complete subzone("The Great Wheel")		|q 30078	|or	|next "The_Great_Wheel"
Trickling Passage	|complete subzone("Trickling Passage")		|q 30078	|or	|next "Trickling_Passage"
Stormstout Brewery	|complete subzone("Stormstout Brewery")		|q 30078	|or	|next "Stormstout_Brewery_Exit"		|only if readyq(30078)
|only if not completedq(30078)
step
label "Stormstout_Brewhall"
talk Li Li##58028
|tip Inside the building.
Tell her _"I'll help."_ |gossip 39978
kill Jooga##58015 |q 30078/2 |goto 32.98,71.11
|tip He looks like a large monkey nearby.
|tip Click the Empty Keg barrels inside the room.
|tip He will stop moving, so you can hit him.
|tip Avoid the bananas.
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
Watch the dialogue
Leave the Stormstout Brewhall |complete not subzone("Stormstout Brewhall") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("Stormstout Brewhall")
step
label "The_Great_Wheel"
talk Chen Stormstout##58029
|tip Inside the building.
Tell him _"Let's do this, Chen."_ |gossip 39980
kill Fizzy Yellow Spirit##58253+
|tip A Fizzy Yellow Alemental will appear after you kill them all.
kill Fizzy Yellow Alemental##58017 |q 30078/3 |goto 38.35,67.74
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
Watch the dialogue
Leave the Great Wheel |complete not subzone("The Great Wheel") |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and subzone("The Great Wheel")
step
label "Trickling_Passage"
talk Mudmug##58027
|tip Inside the building.
Tell him _"Calm down, Mudmug. Let's go."_ |gossip 40588
kill Eddy##58014 |q 30078/1 |goto 34.88,70.31
|tip It looks like a large water sprite elemental nearby.
|tip Run over the bubbles on the ground to weaken Eddy's Water Shield.
|tip Click the bubble around him when his Watery Shield is weakened.
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Watch the dialogue
Leave the Trickling Passage |complete not (subzone("Trickling Passage") or subzone("Grain Cellar")) |q 30078 |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078)) and (subzone("Trickling Passage") or subzone("Grain Cellar"))
step
Detecting player location... |complete not (readyq(30078) or completedq(30078)) |next "Stormstout_Brewery_Router"
|only if not (readyq(30078) or completedq(30078))
step
label "Stormstout_Brewery_Exit"
Watch the dialogue
Leave the Stormstout Brewery |complete subzone("Stormstout Brewery") |q 30078
|only if not completedq(30078) and (subzone("Stormstout Brewhall") or subzone("The Great Wheel") or subzone("Trickling Passage") or subzone("Grain Cellar"))
step
talk Chen Stormstout##56133
turnin Cleaning House##30078 |goto 36.00,69.12
step
talk Emmi##61026
accept Stoneplow Thirsts##30117 |goto 36.20,68.29
step
talk "Dragonwing" Dan##58843
fpath Stoneplow |goto 20.30,58.67
step
talk Lin Tenderpaw##56111
accept Stemming the Swarm##29981 |goto 19.87,56.92
step
talk Loon Mai##56720
turnin Stoneplow Thirsts##30117 |goto 19.55,56.88
accept Evacuation Orders##29982 |goto 19.55,56.88
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 29981 |future
step
talk Haiyun Greentill##57123
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 40362
Evacuate the Greentil Family |q 29982/3 |goto 15.84,56.28
step
talk Mia Marlfur##57127
Tell her _"Loon Mai has issued evacuation orders."_ |gossip 40261
Evacuate the Marlfur Family |q 29982/4 |goto 15.48,54.90
stickystart "Kill_Ikthink_Mantids"
step
talk Feng Spadepaw##57121
Tell him _"Yes, Commander Mai sent me, and I carry his evacuation orders."_ |gossip 40474
Evacuate the Spadepaw Family |q 29982/2 |goto 12.85,55.71
step
talk Wei Blacksoil##57120
Tell him _"Loon Mai has issued evacuation orders."_ |gossip 40360
kill Ik'thik Ambusher##57134
talk Wei Blacksoil##57120
Tell him _"Yes, they're right here. Let's go."_ |gossip 40361
Evacuate the Blacksoil Family |q 29982/1 |goto 7.15,54.83
step
label "Kill_Ikthink_Mantids"
Kill Ik'thik enemies around this area
|tip They look like insect people.
Slay #14# Ik'thik Mantids |q 29981/1 |goto 11.80,56.66
'|kill Ik'thik Wingblade##57196, Ik'thik Swiftclaw##57195
step
talk Loon Mai##56720
turnin Stemming the Swarm##29981 |goto 19.55,56.88
turnin Evacuation Orders##29982 |goto 19.55,56.88
accept The Hidden Master##29983 |goto 19.55,56.88
step
talk Master Bruised Paw##56714
turnin The Hidden Master##29983 |goto 18.29,31.24
accept Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I'm ready for the trial of bamboo."_ |gossip 41438
Begin the Trial of Bamboo |invehicle |goto 18.29,31.23 |q 29984
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #3# Stacks of Bamboo Reeds |q 29984/1 |goto 18.34,32.13
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Bamboo##29984 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept They Will Be Mist##29985 |goto 18.29,31.24
accept Fog Wards##29986 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
stickystart "Kill_Mist_Incarnations"
stickystart "Collect_Jademoon_Leaves"
step
click Northern Fog Ward##209945
Light the Northern Fog Ward |q 29986/1 |goto 16.01,32.11
step
click Western Fog Ward##209946
Light the Western Fog Ward |q 29986/2 |goto 14.86,36.82
step
click Southern Fog Ward##209947
Light the Southern Fog Ward |q 29986/3 |goto 18.10,41.46
step
label "Kill_Mist_Incarnations"
kill 12 Mist Incarnation##56740 |q 29985/1 |goto 16.99,35.63
|tip They look like humanoid alien creatures with one large eye.
step
label "Collect_Jademoon_Leaves"
click Jademoon Leaf##11006+
|tip They look like small green plants on the grey rocks.
collect 18 Jademoon Leaf##76499 |q 29992/1 |goto 16.99,35.63
step
talk Lin Tenderpaw##56111
turnin Tenderpaw By Name, Tender Paw By Reputation##29992 |goto 18.06,31.01
step
talk Master Bruised Paw##56714
turnin They Will Be Mist##29985 |goto 18.29,31.24
turnin Fog Wards##29986 |goto 18.29,31.24
accept Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"My fists are ready. Bring on the trial of wood."_ |gossip 41439
Begin the Trial of Wood |invehicle |goto 18.29,31.24 |q 29987
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #4# Stacks of Wooden Boards |q 29987/1 |goto 18.25,32.18
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Wood##29987 |goto 18.29,31.24
accept A Taste For Eggs##29988 |goto 18.29,31.24
stickystart "Collect_Whitefisher_Crane_Eggs"
stickystart "Collect_Emperor_Tern_Eggs"
step
click Hornbill Strider Egg##209955
|tip Inside the small cave.
collect Hornbill Strider Egg##76516 |q 29988/3 |goto 26.98,39.05
step
label "Collect_Whitefisher_Crane_Eggs"
click Whitefisher Crane Egg##209954+
|tip They look like small white eggs.
collect 4 Whitefisher Crane Egg##76503 |q 29988/2 |goto 25.36,43.15
step
label "Collect_Emperor_Tern_Eggs"
click Emperor Tern Egg##209953+
|tip They look like small purple eggs.
collect 10 Emperor Tern Egg##76501 |q 29988/1 |goto 25.36,43.15
step
talk Master Bruised Paw##56714
turnin A Taste For Eggs##29988 |goto 18.29,31.24
step
Watch the dialogue
talk Master Bruised Paw##56714
accept Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Master Bruised Paw##56714
Tell him _"I've done all that you've asked of me. I'm ready for the trial of stone."_ |gossip 41440
Begin the Trial of Stone |invehicle |goto 18.29,31.24 |q 29989
step
Watch the dialogue
|tip Use the "Unyielding Fist" ability on your action bar.
|tip Use it when the circle at the bottom of your screen is full and glowing.
Strike #5# Stacks of Stone Blocks |q 29989/1 |goto 18.16,32.15
step
talk Master Bruised Paw##56714
turnin Unyielding Fists: Trial of Stone##29989 |goto 18.29,31.24
step
talk Lin Tenderpaw##56111
accept Training and Discipline##29990 |goto 18.06,31.01
step
talk Loon Mai##56720
turnin Training and Discipline##29990 |goto 19.55,56.88
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Krasarang Wilds (20-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KrasarangWilds",
condition_suggested=function() return level >= 20 and level <= 70 and not completedq(30628) end,
startlevel=15,
endlevel=70,
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Kun-Lai Summit (25-70) (Story Only)",
},[[
step
talk Ken-Ken##56115
accept What's Eating Zhu's Bastion?##30079 |goto Krasarang Wilds/0 76.22,7.06
step
talk Rude Sho##62879
|tip Inside the building.
home Wilds' Edge Inn |goto 75.74,7.21
step
talk Mei Barrelbottom##57744
Speak with Mei |q 30079/4 |goto 75.84,7.60
step
talk Mei Barrelbottom##57744
accept Finding Yi-Mo##30080 |goto 75.84,7.60
step
talk Despondent Warden of Zhu##57457
Speak with a Despondent Warden of Zhu |q 30079/1 |goto 76.01,8.30
step
talk Gee Hung##60232
fpath Zhu's Watch |goto 76.74,8.38
step
talk Sunni##57830
|tip Inside the building.
Speak with Sunni |q 30079/2 |goto 77.47,8.53
step
talk Yun##57825
|tip Inside the building.
Speak with Yun |q 30079/3 |goto 75.48,9.39
step
talk Ken-Ken##56115
turnin What's Eating Zhu's Bastion?##30079 |goto 76.22,7.06
step
talk Yi-Mo Longbrow##58376
Find Yi-Mo Longbrow |q 30080/1 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
turnin Finding Yi-Mo##30080 |goto 81.31,6.84
accept Cheer Up, Yi-Mo##30082 |goto 81.31,6.84
step
talk Yi-Mo Longbrow##58376
Tell it _"Please, Yi-Mo: your aunt's worried sick about you."_ |gossip 40643
Tell it _"I don't have time for this. Move your ass or I'll move it for you."_ |gossip 40646
clicknpc Yi-Mo Longbrow##57310
Follow Yi-Mo and Continue Moving Him West |goto 81.31,6.84 > 10 |c |q 30082
step
clicknpc Yi-Mo Longbrow##57310
|tip Click him repeatedly.
|tip Roll him to this location.
Kill the enemies that attack in waves
Bring Yi-Mo to Zhu's Watch |q 30082/1 |goto 76.71,7.79 |notravel
'|kill Thunderbird##58111
step
talk Mei Barrelbottom##57744
turnin Cheer Up, Yi-Mo##30082 |goto 75.84,7.60
step
talk Ken-Ken##56115
accept Materia Medica##30081 |goto 76.22,7.06
stickystart "Collect_Salty_Cores"
stickystart "Collect_Chunks_Of_Honeycomb"
step
click Slick Mudfish##210186+
|tip They look like small fish.
collect 4 Slick Mudfish##78877 |q 30081/2 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Collect_Salty_Cores"
kill Weeping Horror##57649+
|tip They look like rock elementals.
collect 4 Salty Core##78880+ |q 30081/1 |goto 75.38,10.91
You can find more around [71.86,10.76]
step
label "Collect_Chunks_Of_Honeycomb"
click Rain-Slick Honeycomb##210188+
|tip They look like orange glowing balls hanging from trees.
collect 4 Chunk of Honeycomb##78881 |q 30081/3 |goto 73.04,10.94
step
talk Ken-Ken##56115
turnin Materia Medica##30081 |goto 76.22,7.07
accept Why So Serious?##30088 |goto 76.22,7.07
step
Enter the cave |goto Valley of the Four Winds/0 77.07,57.28 < 15 |walk
click Jar of Pigment##210228
|tip Upstairs inside the cave.
collect Jar of Pigment##78942 |q 30088/2 |goto Valley of the Four Winds/0 73.88,56.41
step
Leave the cave |goto 77.07,57.28 < 15 |walk |only if subzone("Winds' Edge")
kill Krasari Stalker##58221+
|tip They look like black tigers.
|tip They can be stealthed.
collect 18 Huge Panther Fang##78941 |q 30088/1 |goto Krasarang Wilds/0 72.28,17.29
step
talk Ken-Ken##56115
turnin Why So Serious?##30088 |goto 76.22,7.07
accept Apply Directly to the Forehead##30089 |goto 76.22,7.07
step
use Ken-Ken's Mask##79021
|tip Use it on Despondent Wardens of Zhu.
|tip They look like pandas in black armor.
kill Manifestation of Despair##58312+
Cure #8# Despondent Wardens of Zhu |q 30089/1 |goto 76.44,8.55
step
talk Ken-Ken##56115
turnin Apply Directly to the Forehead##30089 |goto 76.22,7.07
accept Zhu's Despair##30090 |goto 76.22,7.07
step
kill 8 Essence of Despair##58409 |q 30090/1 |goto 76.40,8.58
step
use Ken-Ken's Mask##79057
|tip Use it on Yi-Mo Longbrow.
kill Quintessence of Despair##58360
Cure Yi-Mo |q 30090/2 |goto 76.49,8.77
step
Watch the dialogue
talk Ken-Ken##56115
turnin Zhu's Despair##30090 |goto 76.21,7.07
step
talk Mei Barrelbottom##57744
accept Into the Wilds##30133 |goto 75.84,7.59
step
talk Chezin Dawnchaser##58160
accept Poisoned!##30179 |goto 68.80,22.24
step
Kill Krasari enemies around this area
|tip They look like bulky humanoids.
collect 5 Mogu Poisoned Blade##79252 |q 30179/1 |goto 68.53,22.27
'|kill Krasari Tormentor##58377, Krasari Runekeeper##65598
step
clicknpc Zhu's Watch Courier##59151
Select _"Take the supplies."_ |gossip 41038
Find the Zhu's Watch Courier |q 30133/1 |goto 62.55,25.45
step
talk Sunwalker Dezco##58113
turnin Poisoned!##30179 |goto 59.89,24.70
step
talk Kor Bloodtusk##58114
accept Blind Them!##30124 |goto 59.88,24.81
step
talk Kang Bramblestaff##56112
accept Skitterer Stew##30123 |goto 60.09,25.01
step
talk Lira Skysplitter##59046
fpath Thunder Cleft |goto 59.20,24.67
step
talk Malaya Dawnchaser##58184
|tip Inside the building.
home Thunder Cleft |goto 60.91,24.91 |q 30628 |future
step
kill Jungle Skitterer##58067+
|tip They look like large insects running around.
collect 5 Intact Skitterer Glands##78911 |q 30123/1 |goto 62.99,22.03
step
kill Darnassian Outrider##58857 |q 30124/1 |goto 61.80,30.48
|tip It walks around this area, stealthed.
step
talk Kang Bramblestaff##56112
turnin Skitterer Stew##30123 |goto 60.09,25.01
step
talk Kor Bloodtusk##58114
turnin Blind Them!##30124 |goto 59.88,24.81
accept Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
accept Herbal Remedies##30130 |goto 59.89,24.70
step
talk Kang Bramblestaff##56112
accept The Mogu Agenda##30129 |goto 60.09,25.01
stickystart "Kill_Dojani_Enforcers"
stickystart "Kill_Dojani_Reclaimers"
stickystart "Kill_Dojani_Surveyors"
stickystart "Collect_Imperial_Lotus_Leaves"
step
kill Dojani Dominator##58165
|tip At the top of the ruins.
collect Dojani Orders##78917 |q 30129/1 |goto 55.51,34.46
step
_Next to you:_
talk Kang Bramblestaff##58206
turnin The Mogu Agenda##30129
accept The Pools of Youth##30128
step
Cross the bridge |goto 54.47,32.91 < 15 |only if walking
talk Na Lek##55597
|tip At the top of the ruins.
Tell it _"Attempt to free Na Lek from his prison."_ |gossip 39799
Watch the dialogue
Kill the enemies that attack
click Water of Youth##210229+
|tip They look like blue spots in the water.
|tip They appear after you kill the enemies that attack.
collect The Water of Youth##78934 |q 30128/1 |goto 51.91,32.72
'|kill Sleeping Guardian##58419
step
label "Kill_Dojani_Enforcers"
kill 4 Dojani Enforcer##65626 |q 30127/3 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a large sword.
step
label "Kill_Dojani_Reclaimers"
kill 6 Dojani Reclaimer##58117 |q 30127/1 |goto 54.56,38.41
|tip They look like bulky humanoids wearing a cloak and carrying a staff.
step
label "Kill_Dojani_Surveyors"
kill 8 Dojani Surveyor##58068 |q 30127/2 |goto 54.56,38.41
|tip They look like bulky humanoids carrying a spear.
step
label "Collect_Imperial_Lotus_Leaves"
click Imperial Lotus##210209+
|tip They look like plants with white flowers on them.
collect 20 Imperial Lotus Leaves##78918 |q 30130/1 |goto 54.56,38.41
step
talk Kor Bloodtusk##58114
turnin Threat from Dojan##30127 |goto 59.88,24.81
step
talk Sunwalker Dezco##58113
|tip He walks around this area.
turnin Herbal Remedies##30130 |goto 59.89,24.71
turnin The Pools of Youth##30128 |goto 59.89,24.71
accept Life##30131 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
Tell him _"Go, stand by your wife's side. I will protect the tent from invaders."_ |gossip 40273
Stand by Dezco's Side |q 30131/1 |goto 59.89,24.71
step
talk Sunwalker Dezco##58113
|tip Inside the building.
turnin Life##30131 |goto 60.42,25.57
accept Going West##30132 |goto 60.42,25.57
step
talk Koro Mistwalker##58547
turnin Into the Wilds##30133 |goto 44.21,42.89
accept Unsafe Passage##30269 |goto 44.21,42.89
step
clicknpc Sunwalker Scout##59136
collect Sunwalker Scout's Report##79745 |q 30132/1 |goto 43.79,42.78
step
talk Koro Mistwalker##58547
Tell him _"I'm ready, Koro."_ |gossip 40208
Begin Escorting the Refugees |havebuff Mistwalking##113066 |goto 44.21,42.89 |q 30269
step
Watch the dialogue
|tip Follow Koro and protect him as he walks.
|tip He eventually walks to this location.
Kill the enemies that attack in waves
|tip Click Koro when he says he's pinned down to help him back up.
Accompany Koro to Crane Wing Refuge |q 30269/1 |goto 43.88,36.85
'|kill Riverblade Bloodletter##58983
step
Watch the dialogue
talk Koro Mistwalker##59138
|tip He runs to this location.
turnin Unsafe Passage##30269 |goto 40.58,33.68
accept Blinding the Riverblades##30270 |goto 40.58,33.68
accept Tread Lightly##30694 |goto 40.58,33.68
step
talk Ni the Merciful##62869
home Crane Wing Refuge |goto 40.76,34.52
step
talk Anduin Wrynn##58609
accept The Murksweats##30268 |goto 40.49,34.65
stickystart "Poke_Traps"
stickystart "Kill_Riverblade_Pathstalkers"
step
kill Murkscale Striker##58631+
|tip They look like snakes.
|tip Underwater.
collect 6 Murkscale Head##79199 |q 30268/1 |goto 35.81,38.05
You can find more around [39.46,36.36]
step
label "Poke_Traps"
click Riverblade Spike Trap+
|tip They look like spiked metal balls.
|tip Don't get too close to them, they explode.
Poke #10# Traps |q 30694/1 |goto 44.65,35.01
step
label "Kill_Riverblade_Pathstalkers"
kill 8 Riverblade Pathstalker##58858 |q 30270/1 |goto 44.65,35.01
|tip They look like lizard people.
step
talk Anduin Wrynn##58609
turnin The Murksweats##30268 |goto 40.49,34.65
step
talk Koro Mistwalker##59138
turnin Blinding the Riverblades##30270 |goto 40.58,33.68
turnin Tread Lightly##30694 |goto 40.58,33.68
accept Ahead on the Way##30695 |goto 40.58,33.68
accept Striking the Rain##30272 |goto 40.58,33.68
step
_Next to you:_
talk Anduin Wrynn##59189
accept Sha Can Awe##30271
stickystart "Inspire_Hopeless_Crane_Wing_Defenders"
stickystart "Slay_Sha_Manifestations"
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the West Pagoda |q 30695/1 |goto 37.79,54.16
step
kill Maw of Despair##59315
|tip It walks around this area.
Cleanse the East Pagoda |q 30695/2 |goto 43.04,54.29
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Ahead on the Way##30695
step
label "Inspire_Hopeless_Crane_Wing_Defenders"
Inspire #10# Hopeless Crane Wing Defenders |q 30271/1 |goto 40.48,49.41
|tip Kill enemies near Hopeless Crane Wing Defenders.
|tip They look like shadowy pandas kneeling or walking around slowly.
step
label "Slay_Sha_Manifestations"
Kill enemies around this area
|tip They look like shadow aliens.
Slay #18# Sha Manifestations |q 30272/1 |goto 40.48,49.41
'|kill Incarnation of Despair##65872, Haunt of Despair##59236, Source of Despair##65873
step
_Next to you:_
talk Anduin Wrynn##59608
turnin Striking the Rain##30272
turnin Sha Can Awe##30271
accept In the House of the Red Crane##30273
step
Enter the building |goto 40.43,52.13 < 20 |walk
talk Chi-Ji##59653
|tip Downstairs inside the building.
|tip Follow the stairs down to reach the lower level.
Select  _"<Reach out to touch Chi-Ji.>"_ |gossip 39489
Watch the dialogue
kill Sha of Despair##59651 |q 30273/1 |goto 40.44,54.49
|tip Fight him until he returns to the middle of the room.
|tip When he does that, run a bit up the stairs nearby and wait until his AoE attack finishes.
|tip Repeat this process.
|tip Also kill the enemies he spawns, if you can.
'|kill Echo of Despair##59687
step
Run back up the stairs and leave the building |goto 40.43,52.13 < 20 |walk |only if subzone("Temple of the Red Crane") and indoors()
talk Chi-Ji##59719
turnin In the House of the Red Crane##30273 |goto 40.42,49.22
step
talk Munch Windhoof##59047
fpath Dawnchaser Retreat |goto 29.00,50.31
step
talk Kor Bloodtusk##58114
turnin Going West##30132 |goto 28.69,50.88
step
talk Feather Keeper Li##65189
fpath Cradle of Chi-Ji |goto 31.14,63.16
step
talk Nan-Po##60441
fpath Marista |goto 52.48,76.60
step
talk Kor Bloodtusk##58114
accept For the Tribe##30163 |goto 28.69,50.88
accept The Greater Danger##30229 |goto 28.69,50.88
step
talk Kang Bramblestaff##56112
accept Re-Reclaim##30230 |goto 28.84,50.57
stickystart "Collect_Mogu_Artifacts"
stickystart "Kill_Korjan_Reclaimers"
step
clicknpc Dawnchaser Captive##58608+
|tip They look like red glowing tauren.
Rescue #8# Captives |q 30163/1 |goto 24.83,39.34
You can find more around [25.12,45.46]
step
label "Collect_Mogu_Artifacts"
click Mogu Artifact##212765+
|tip They look like various shaped golden objects.
collect 10 Mogu Artifact##79120 |q 30230/1 |goto 24.83,39.34
You can find more around [23.15,44.53]
step
label "Kill_Korjan_Reclaimers"
kill 8 Korjan Reclaimer##58614 |q 30229/1 |goto 24.83,39.34
|tip They look like bulky humanoids wearing cloaks.
You can find more around [25.12,45.46]
step
talk Kang Bramblestaff##56112
turnin Re-Reclaim##30230 |goto 28.84,50.57
step
talk Kor Bloodtusk##58114
turnin For the Tribe##30163 |goto 28.69,50.88
turnin The Greater Danger##30229 |goto 28.69,50.88
step
talk Ambassador Han##58630
accept The Mantid##30175 |goto 29.06,51.13
step
talk Sunwalker Dezco##58607
accept The Stoneplow Convoy##30164 |goto 15.98,39.79
stickystart "Slay_Ik'thallik_Mantid"
step
clicknpc Stoneplow Envoy##58955+
|tip They look like Pandaren laying on the ground.
Save #7# Stoneplow Envoy |q 30164/1 |goto 15.47,35.43
You can find more around [16.94,42.67]
step
label "Slay_Ik'thallik_Mantid"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #10# Ik'thallik Mantid |q 30175/1 |goto 13.91,38.19
'|kill Ik'thik Precursor##58367, Ik'thik Vanguard##58368
step
talk Ambassador Len##58954
turnin The Mantid##30175 |goto 15.70,39.72
step
talk Sunwalker Dezco##58607
turnin The Stoneplow Convoy##30164 |goto 15.98,39.79
accept For Family##30174 |goto 15.98,39.79
step
talk Kor Bloodtusk##58670
Select  _"<Try to free Kor Bloodtusk from his bonds.>"_ |gossip 40073
kill Groundbreaker Brojai##58224 |q 30174/1 |goto 23.64,48.83
step
talk Sunwalker Dezco##58607
turnin For Family##30174 |goto 28.90,50.87
accept Warn Stoneplow##30241 |goto 28.90,50.87
step
talk Loon Mai##56720
turnin Warn Stoneplow##30241 |goto Valley of the Four Winds/0 19.55,56.87
step
Watch the dialogue
talk Mei Barrelbottom##59855
accept The Mantidote##30623 |goto 17.96,56.45
step
talk Loon Mai##56720
accept The Swarm Begins##30622 |goto 17.84,56.23
step
talk Mudmug##56474
|tip He walks around this area.
accept It Does You No Good In The Keg##30653 |goto 18.16,55.73
step
talk Nan the Mason Mug##62878
|tip Inside the building.
home Stone Mug Tavern |goto 19.71,55.87 |q 30653 |future
stickystart "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
stickystart "Slay_Ikthallik_Infestors_Or_Warriors"
step
Deliver Beer to Zhu's Wardens |q 30653/1 |goto 17.45,50.27
step
Deliver Beer to Crane Wing Priests |q 30653/2 |goto 15.14,55.43
step
Deliver Beer to Tauren Settlers |q 30653/4 |goto 12.99,55.98
step
Deliver Beer to Shado-Pan |q 30653/3 |goto 10.63,55.58
step
_Click the Complete Quest Box:_
turnin It Does You No Good In The Keg##30653
step
label "Use_Ken_Kens_Mask_On_Ikthik_Wing_Commanders"
use Ken-Ken's Mask##80337
|tip Use it on Ik'thik Wing Commanders.
|tip Make sure they have the "Lashing Out in Fear" buff.
|tip They look like larger insects.
kill Manifestation of Fear##59874+
Use Ken-Ken's Mask on #5# Ik'thik Wing Commanders |q 30623/1 |goto 12.93,54.85
You can find more around [16.35,53.47]
'|kill Ik'thik Wing Commander##56723
step
_Click the Complete Quest Box:_
turnin The Mantidote##30623
step
label "Slay_Ikthallik_Infestors_Or_Warriors"
Kill Ik'thallik enemies around this area
|tip They look like insect people.
Slay #15# Ik'thallik Infestors or Warriors |q 30622/1 |goto 12.93,54.85
'|kill Ik'thik Infestor##56721, Ik'thik Warrior##56722
step
talk Guard Captain Oakenshield##57198
turnin The Swarm Begins##30622 |goto 11.60,49.52
accept Students No More##30625 |goto 11.60,49.52
step
Watch the dialogue
|tip Follow your allies and kill enemies around this area.
|tip They may already be in the battlefield, so you may have to find them.
|tip They will yell at you to come over to them when you are near them.
kill Ik'thik Bloodrager##59887 |q 30625/1 |goto 9.26,54.09
kill Ik'thik Incubator##59890 |q 30625/2 |goto 9.26,54.09
kill Ik'thik Tendon-Slicer##59888 |q 30625/3 |goto 9.26,54.09
kill Ik'thik Fearmonger##59889 |q 30625/4 |goto 9.26,54.09
step
talk Guard Captain Oakenshield##57198
turnin Students No More##30625 |goto 11.60,49.52
accept Retreat!##30626 |goto 11.60,49.52
step
talk Loon Mai##56720
turnin Retreat!##30626 |goto 17.84,56.23
step
talk Master Bruised Paw##59856
accept The Savior of Stoneplow##30627 |goto 17.91,55.75
step
talk Miss Fanny##59857
Tell it _"Let's go, Miss Fanny."_ |gossip 39267
Ride Miss Fanny |invehicle |goto 17.93,56.69 |q 30627
step
Reach the Mantid Colossus |outvehicle |goto 7.55,54.76 |q 30627 |notravel
step
Watch the dialogue
|tip Use the ability on your action bar when the circle at the bottom of your screen is full and glowing.
|tip You will have to use the ability multiple times.
kill Mantid Colossus##56703 |q 30627/1 |goto 7.55,54.76
step
talk Loon Mai##56720
turnin The Savior of Stoneplow##30627 |goto 17.84,56.23
accept The Gratitude of Stoneplow##30628 |goto 17.84,56.23
step
click The Commander's Cache##211316
|tip Upstairs inside the building.
turnin The Gratitude of Stoneplow##30628 |goto 19.82,55.92
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Kun-Lai Summit (25-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."KunLai",
condition_suggested=function() return level >= 25 and level <= 70 and not completedq(30752) end,
startlevel=25,
endlevel=70,
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Townlong Steppes (30-70) (Story Only)",
},[[
step
Follow the path up the mountain |goto Valley of the Four Winds/0 70.12,22.63 < 20 |only if walking
talk Shin the Weightless##61759
|tip On top of the mountain.
fpath Tavern in the Mists |goto The Veiled Stair/0 56.72,75.75
step
talk Jo the Wind Watcher##61474
fpath Binan Village |goto Kun-Lai Summit/0 72.54,94.17
step
talk Apothecary Cheng##59077
accept Hit Medicine##30460 |goto 71.57,92.83
step
talk Mayor Bramblestaff##59073
turnin The Road to Kun-Lai##31254 |goto 72.27,91.86 |only if haveq(31254) or completedq(31254)
accept Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Puli the Even Handed##62871
|tip Inside the building.
home Binan Brew & Stew |goto 72.67,92.34 |q 30460 |future
step
talk Commander Hsieh##59076
accept All of the Arrows##30459 |goto 70.75,90.36
stickystart "Slay_Bataari_Tribe_Members"
stickystart "Heal_Injured_Binan_Warriors"
stickystart "Collect_Arrows_Of_Commander_Hsieh"
step
kill Bataari Fire-Warrior##59083 |q 30457/2 |goto 68.01,88.63
|tip He looks like a tauren riding on a large yak that walks along this path.
|tip He will appear as a yellow dot on your minimap.
|tip He appears at this location.
Also check around [69.89,89.45]
step
label "Slay_Bataari_Tribe_Members"
Kill Bataari enemies around this area
|tip They look like tauren.
Slay #10# Bataari Tribe Members |q 30457/1 |goto 69.23,89.76
'|kill Bataari Yaungol##58961, Bataari Flamecaller##59021
step
label "Heal_Injured_Binan_Warriors"
use the Dit Da Jow##79819
|tip Use it on Injured Binan Warriors.
|tip They look like kneeling pandas.
Heal #8# Injured Binan Warriors |q 30460/1 |goto 69.23,89.76
'|talk Injured Binan Warrior##59143
step
label "Collect_Arrows_Of_Commander_Hsieh"
click Arrow of Commander Hsieh##210759+
|tip They look like the back feathers of arrows sticking out of the ground.
collect 12 Arrow of Commander Hsieh##79806 |q 30459/1 |goto 69.23,89.76
step
talk Commander Hsieh##59076
turnin All of the Arrows##30459 |goto 70.75,90.36
step
talk Mayor Bramblestaff##59073
turnin Call Out Their Leader##30457 |goto 72.27,91.86
step
talk Apothecary Cheng##59077
turnin Hit Medicine##30460 |goto 71.57,92.83
accept General Nazgrim has Awakened##30511 |goto 71.57,92.83
step
talk General Nazgrim##59442
|tip Upstairs inside the building.
turnin General Nazgrim has Awakened##30511 |goto 71.65,93.10
accept Eastwind Rest##30513 |goto 71.65,93.10
step
talk Farmhand Ko##63751
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 41283
Speak with Farmhand Ko |q 30513/1 |goto 63.68,86.65
step
talk Elder Shiao##63535
Tell him _"I'm from the Horde. We're here to save you and rebuild your village."_ |gossip 41465
Speak with Elder Shiao |q 30513/2 |goto 61.20,82.22
step
talk Elder Shiao##63535
turnin Eastwind Rest##30513 |goto 61.20,82.22
accept Challenge Accepted##30515 |goto 61.20,82.22
step
click Yaungol Banner##210933
Watch the dialogue
kill Ur-Bataar##59483 |q 30515/1 |goto 58.19,84.09
step
talk Elder Shiao##63535
turnin Challenge Accepted##30515 |goto 61.57,80.19
step
talk General Nazgrim##59442
|tip Inside the building.
accept Round 'Em Up##31256 |goto 63.00,80.20
step
talk Rivett Clutchpop##59448
accept Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk Farmhand Ko##63751
accept Trouble on the Farmstead##30570 |goto 62.54,79.44
step
talk Elder Shiao##63535
accept Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
step
talk Soaring Paw##61745
fpath Eastwind Rest |goto 62.44,80.72
step
talk Shademaster Kiryn##59449
accept Deanimate the Reanimated##30594 |goto 62.70,80.72
step
talk Mai the Sleepy##62883
home Eastwind Rest |goto 62.73,80.49 |q 30999 |future
stickystart "Collect_Kun_Lai_Meaty_Bits"
step
clicknpc Wild Plains Yak##59610+
|tip They look like brown bison.
|tip They will begin following you.
|tip You can have 3 following you at once.
Round Up #3# Yaks |q 31256/1 |goto 65.02,78.75
Bring them to [62.61,79.36]
step
label "Collect_Kun_Lai_Meaty_Bits"
Kill enemies around this area
|tip They look like various beasts.
|tip Wild Plains Yaks will not drop the quest item.
collect 160 Kun-Lai Meaty Bits##80245 |q 31251/1 |goto 65.02,78.75
'|kill Highlands Calf##59671, Highlands Mushan##59670, Summit Bonestripper##59672, Razorquill Porcupine##65839
step
talk Rivett Clutchpop##59448
turnin Best Meals Anywhere!##31251 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
turnin Round 'Em Up##31256 |goto 63.00,80.20
step
talk Farmer Chow##59573
turnin Trouble on the Farmstead##30570 |goto 60.24,85.79
accept Farmhand Freedom##30571 |goto 60.24,85.79
step
talk Uyen Chow##59636
accept ... and the Pot, Too!##30581 |goto 60.17,85.91
step
click Cast Iron Pot##211023
|tip Inside the building.
collect Cast Iron Pot##80230 |q 30581/2 |goto 60.02,88.44
stickystart "Collect_Root_Vegetables"
step
kill Ordo Overseer##59580+
|tip They look like tauren next to groups of Pandaren.
Free #12# Farmstead Slaves |q 30571/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
label "Collect_Root_Vegetables"
kill Wascally Wirmen##59655+
|tip They look like small piles of dirt that move around on the ground.
click Root Vegetable##211019+
|tip They look like green leafy vegetable stalks sticking out of the ground.
collect 12 Root Vegetable##80227 |q 30581/1 |goto 58.61,89.25
You can find more around [61.31,87.39]
step
talk Uyen Chow##59636
turnin ... and the Pot, Too!##30581 |goto 60.17,85.91
step
talk Farmer Chow##59573
turnin Farmhand Freedom##30571 |goto 60.24,85.79
accept Back to Eastwind Rest##31253 |goto 60.24,85.79
step
talk Farmhand Ko##63751
turnin Back to Eastwind Rest##31253 |goto 62.54,79.44
stickystart "Destroy_Terracotta_Guardians_Or_Warriors"
step
kill Mogujia Soul-Caller##59797 |q 30620/1 |goto 58.12,70.89
step
label "Destroy_Terracotta_Guardians_Or_Warriors"
Kill Terracotta enemies around this area
|tip They look like bulky humanoids and lions.
Destroy #14# Terracotta Guardians or Warriors |q 30594/1 |goto 58.58,75.71
'|kill Terracotta Warrior##59758, Terracotta Guardian##59773
step
talk Elder Shiao##63535
turnin Mogu?! Oh No-gu!##30620 |goto 62.34,79.61
accept Pandaren Prisoners##30655 |goto 62.34,79.61
step
talk Rivett Clutchpop##59448
accept Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip Inside the building.
accept In Tents Channeling##30657 |goto 63.00,80.20
step
talk Shademaster Kiryn##59449
turnin Deanimate the Reanimated##30594 |goto 62.70,80.72
stickystart "Rescue_Pandaren_Prisoners"
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 51.23,79.31 |q 30656
step
use the Explosives Barrel##80528
Destroy the Eastern Oil Rig |q 30656/1 |goto 51.05,79.41
step
kill Musaan the Blazecaster##59969 |q 30657/1 |goto 50.45,78.59
|tip Inside the tent.
step
kill Harala the Firespeaker##60030 |q 30657/3 |goto 49.43,78.48
|tip Inside the tent.
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |goto 49.57,78.97 |q 30656
step
kill Pao-kun the Pyromancer##60031 |q 30657/4 |goto 49.13,80.31
|tip Inside the tent.
step
use the Explosives Barrel##80528
Destroy the Southern Oil Rig |q 30656/2 |goto 49.61,80.94
step
clicknpc Explosives Barrel##60095
collect Explosives Barrel##80528 |q 30656 |goto 49.34,81.10
step
use the Explosives Barrel##80528
Destroy the Western Oil Rig |q 30656/3 |goto 47.87,81.39
step
kill Akonu the Embercaller##60032 |q 30657/2 |goto 47.71,80.01
|tip Inside the tent.
step
_Click the Complete Quest Box:_
turnin In Tents Channeling##30657
accept The Ordo Warbringer##30661
step
label "Rescue_Pandaren_Prisoners"
clicknpc Pandaren Prisoner##60038+
|tip They look like panda people with ball and chains on their legs, or inside wooden cages.
Rescue #8# Pandaren Prisoners |q 30655/1 |goto 49.88,79.97
step
kill Ordo Warbringer##60127 |q 30661/1 |goto 48.35,76.72
|tip When his shield appears, kill the enemies that appear to remove it.
|tip Inside the small cave.
step
talk Rivett Clutchpop##59448
turnin Barrels of Fun##30656 |goto 62.79,79.90
step
talk General Nazgrim##59442
|tip He walks around this area.
turnin Pandaren Prisoners##30655 |goto 62.31,80.63
turnin The Ordo Warbringer##30661 |goto 62.31,80.63
accept The Shado-Pan##31453 |goto 62.31,80.63
step
talk Little Cleankite##61504
fpath One Keg |goto 57.73,59.69
step
talk Big Greenfeather##61118
|tip At the top of the mountain.
fpath Temple of the White Tiger |goto 66.31,50.66
step
talk Bo the Wind Claimer##61511
fpath Zouchin Village |goto 62.42,30.12
step
talk Uncle Eastwind##60416
fpath Kota Basecamp |goto 42.81,69.63
step
talk Clover Keeper##60420
home Kota Basecamp |goto 42.67,69.76 |q 30742 |future
step
talk Tania Summerbreeze##61122
fpath Shrine of Two Moons |goto Vale of Eternal Blossoms/0 62.85,21.79
step
talk Shado-Master Chong##60161
|tip Inside the building.
|tip Click the red doors to enter the building.
turnin The Shado-Pan##31453 |goto Kun-Lai Summit/0 44.48,89.93
accept Turnabout##30670 |goto Kun-Lai Summit/0 44.48,89.93
accept The Defense of Shado-Pan Fallback##30665 |goto Kun-Lai Summit/0 44.48,89.93
step
talk Kite Master Ni##61473
|tip Outside the building, up on the wall.
|tip Run up the stairs inside the building to find her.
fpath Shado-Pan Fallback |goto 43.91,89.54
stickystart "Collect_Blind_Rage_Essences"
stickystart "Kill_Sha_Infested_Yaungols"
step
talk Sya Zhong##60178
|tip Inside the building.
accept Holed Up##30682 |goto 42.93,88.31
step
Rescue Sya Zhong |q 30682/4 |goto 42.93,88.31
step
talk Ya Firebough##60189
|tip Inside the building.
Tell him _"...That's enough. Let's go."_ |gossip 37051
Rescue Ya Firebough |q 30682/2 |goto 41.04,86.96
step
talk Old Lady Fung##60190
|tip Inside the building.
Tell her _"Yes... why don't you "escort" me out of here."_ |gossip 37052
Rescue Old Lady Fung |q 30682/3 |goto 42.84,85.70
step
talk Jin Warmkeg##60187
|tip Inside the building.
Tell him _"Let's get out of here."_ |gossip 35293
Rescue Jin Warmkeg |q 30682/1 |goto 43.87,86.17
step
label "Collect_Blind_Rage_Essences"
kill Blind Rage##61224+
|tip They look like shadow aliens.
collect 5 Blind Rage Essence##81713 |q 30670/1 |goto 43.31,87.02
step
label "Kill_Sha_Infested_Yaungols"
kill 15 Sha-Infested Yaungol##60164 |q 30665/1 |goto 44.82,87.44
|tip They look like grey tauren.
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Turnabout##30670 |goto 44.48,89.93
turnin The Defense of Shado-Pan Fallback##30665 |goto 44.48,89.93
turnin Holed Up##30682 |goto 44.48,89.93
accept Unmasking the Yaungol##30690 |goto 44.48,89.93
step
use the Blinding Rage Trap##81741
|tip Lure Kobai into it after you use it.
|tip He walks around this area.
|tip Use the "Steal Mask" ability on Kobai after you lure him into the trap.
|tip It appears as a button on the screen.
Lure Kobai into the Trap and Steal His Mask |q 30690/1 |goto 45.51,86.32
|tip You will be attacked.
'|kill Kobai##61303
step
kill Malevolent Fury##61333 |q 30690/2 |goto 45.51,86.32
step
talk Shado-Master Chong##60161
|tip Inside the building.
turnin Unmasking the Yaungol##30690 |goto 44.48,89.93
accept To Winter's Blossom##30699 |goto 44.48,89.93
step
talk Lin Silentstrike##61816
turnin To Winter's Blossom##30699 |goto 34.95,59.40
accept Honor, Even in Death##30723 |goto 34.95,59.40
step
talk Ban Bearheart##61819
accept A Line Unbroken##30715 |goto 35.12,59.65
step
talk Kite Master Len##61512
fpath Winter's Blossom |goto 34.54,59.12
stickystart "Kill_Kun_Lai_Corpsepickers"
step
clicknpc Shado-Master Zhiyao##61808
Release Shado-Master Zhiyao from His Oath |q 30715/1 |goto 30.34,60.05
step
clicknpc Liu of the Thousand Blows##61806
Release Liu of the Thousand Blows from His Oath |q 30715/2 |goto 30.18,62.47
step
clicknpc Shiya Boldblade##61810
Release Shiya Boldblade from Her Oath |q 30715/3 |goto 29.97,64.44
step
label "Kill_Kun_Lai_Corpsepickers"
kill 12 Kun-Lai Corpsepicker##61843 |q 30723/1 |goto 30.85,62.22
|tip They look like birds on the ground and flying around.
step
talk Ban Bearheart##61819
turnin A Line Unbroken##30715 |goto 35.12,59.65
step
talk Lin Silentstrike##61816
turnin Honor, Even in Death##30723 |goto 34.95,59.30
accept To the Wall!##30724 |goto 34.95,59.30
step
talk Kite Master Len##61512
Tell him _"I need a kite to get up to the wall!"_ |gossip 29681
Speak to Kite-Master Len to Take a Kite to the Wall |q 30724/1 |goto 34.54,59.12
step
Begin Traveling to Serpent's Spine |invehicle |goto 34.54,59.12 |q 30724
step
Travel to Serpent's Spine |outvehicle |goto 29.30,62.32 |q 30724 |notravel
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin To the Wall!##30724 |goto 29.30,62.29
accept Off the Wall!##30750 |goto 29.30,62.29
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
accept A Terrible Sacrifice##30751 |goto 29.24,62.30
stickystart "Slay_Veteran_Archers_Or_Fire_Warriors"
step
click Yaungol Oil Barrel##212003+
|tip They look like large blue and brown pots.
collect 6 Yaungol Oil Barrel##82799 |q 30751/1 |goto 27.53,60.70
step
label "Slay_Veteran_Archers_Or_Fire_Warriors"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #12# Veteran Archers or Fire-Warriors |q 30750/1 |goto 27.53,60.70
'|kill Osul Fire-Warrior##63576, Osul Veteran Archer##61886
step
talk Lao-Chin the Iron Belly##61820
|tip Inside the building.
turnin A Terrible Sacrifice##30751 |goto 29.24,62.30
step
talk Suna Silentstrike##61454
|tip Inside the building.
turnin Off the Wall!##30750 |goto 29.30,62.29
accept Lao-Chin's Gambit##30994 |goto 29.30,62.29
step
talk Suna Silentstrike##61454
|tip Inside the building.
Tell her _"Alright, I'm ready to get back to the front."_ |gossip 30541
Talk with Suna Silentstrike to Take a Kite to Lao-Chin |q 30994/1 |goto 29.30,62.29
step
Begin Returning to Winter's Blossom |invehicle |goto 29.30,62.29 |q 30994
step
Return to Winter's Blossom |outvehicle |goto 31.85,60.18 |q 30994 |notravel
step
talk Lao-Chin the Iron Belly##61820
turnin Lao-Chin's Gambit##30994 |goto 31.82,60.11
accept Do a Barrel Roll!##30991 |goto 31.82,60.11
step
clicknpc Keg Bomb##60553
|tip Use the ability on your action bar near enemies as you roll down the hill.
|tip Do this repeatedly.
kill 50 Osul Invader##60455 |q 30991/1 |goto 32.06,60.58
kill 4 Osul Treelauncher##60483 |q 30991/2 |goto 32.06,60.58
step
talk Lao-Chin the Iron Belly##61820
turnin Do a Barrel Roll!##30991 |goto 31.82,60.11
accept Finish This!##30992 |goto 31.82,60.11
step
kill Gong Da##62165
|tip He runs around this area.
Complete the Battle for The Ox Gate |q 30992/1 |goto 31.19,61.76
step
talk Ban Bearheart##61819
turnin Finish This!##30992 |goto 31.29,61.50
accept Where are My Reinforcements?##30993 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"I'm ready to leave. Let's go!"_ |gossip 29128
Tell Ban You are Ready to Leave |q 30993/1 |goto 31.29,61.50
step
talk Ban Bearheart##61819
Tell him _"Alright, let's go up to the monastery."_ |gossip 29129
Ride Ban's Balloon to the Shado-Pan Monastery |q 30993/2 |goto 33.96,58.61
step
talk Ban Bearheart##61819
turnin Where are My Reinforcements?##30993 |goto 35.31,49.55
accept Unbelievable!##30752 |goto 35.31,49.55
step
talk Shado-Pan Sentinel##62220
Tell him _"I am here with Ban Bearheart, and we demand an audience with Taran Zhu!"_ |gossip 41432
Watch the dialogue
kill Shado-Pan Sentinel##62220
Gain Access to the Monastery |q 30752/1 |goto 36.69,47.72
step
_Next to you:_
talk Ban Bearheart##61819
turnin Unbelievable!##30752
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Townlong Steppes (30-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."TownlongSteppes",
condition_suggested=function() return level >= 30 and level <= 70 and not completedq(30928) end,
startlevel=30,
endlevel=70,
pandariaremix=true,
next="Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Dread Wastes (35-70) (Story Only)",
},[[
step
talk Taran Zhu##60688
accept A Foot in the Door##30814 |goto Townlong Steppes/0 71.15,56.69
step
talk Kite Master Wong##62901
fpath Longying Outpost |goto 71.08,57.31
step
talk Saito the Sleeping Shadow##62873
|tip Inside the building.
home Longying Outpost |goto 71.07,57.92 |q 30814 |future
step
kill 8 Osul Charger##60713 |q 30814/1 |goto 70.00,53.66
|tip They look like tauren.
step
talk Taran Zhu##60688
turnin A Foot in the Door##30814 |goto 71.15,56.69
accept First Assault##30769 |goto 71.15,56.69
accept Running Rampant##30770 |goto 71.15,56.69
accept Perfect Pitch##30771 |goto 71.15,56.69
stickystart "Kill_Osul_Sharphorns"
stickystart "Collect_Dark_Pitches"
step
clicknpc Long-Haired Yak##60669+
|tip They look like brown bisons.
clicknpc Steppebeast##60739+
|tip They look like blue dinosaurs.
Free #8# Yaks or Steppebeasts |q 30770/1 |goto 68.64,52.01
step
label "Kill_Osul_Sharphorns"
kill 6 Osul Sharphorn##60647 |q 30769/1 |goto 68.25,53.38
|tip They look like tauren.
step
label "Collect_Dark_Pitches"
click Pitch Pot##211507+
|tip They look like brown and blue pots.
collect 8 Dark Pitch##81174 |q 30771/1 |goto 68.25,53.38
step
talk Suna Silentstrike##60684
turnin First Assault##30769 |goto 67.25,52.22
step
talk Ban Bearheart##60687
turnin Running Rampant##30770 |goto 67.20,52.27
turnin Perfect Pitch##30771 |goto 67.20,52.27
accept Pitching In##30773 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Seeing Red##30772 |goto 67.25,52.22
accept Ranger Rescue##30774 |goto 67.25,52.22
stickystart "Destroy_Osul_Ballistas"
stickystart "Rescue_Longying_Rangers"
stickystart "Slay_Osul_Marauders"
step
talk Katak the Defeated##60735
accept The Exile##30775 |goto 67.00,51.41
step
kill Battat##60728 |q 30775/1 |goto 65.70,51.65
|tip Inside the building.
step
kill Urang##60725 |q 30775/2 |goto 64.79,50.13
|tip Inside the building.
step
talk Lin Silentstrike##60899
Select _"Examine the body."_ |gossip 32679
Free Lin Silentstrike |q 30774/3 |goto 66.59,49.16
step
kill Ku-Tong##60726 |q 30775/3 |goto 66.96,48.24
|tip Inside the building.
step
label "Destroy_Osul_Ballistas"
use Ban's Explosives##81193
|tip Use it on Osul Ballistas.
|tip They look like smaller wooden machines with wheels.
Destroy #6# Osul Ballistas |q 30773/1 |goto 66.87,49.81
step
label "Rescue_Longying_Rangers"
Kill Osul enemies around this area
|tip They look like tauren.
collect Stone Key##81178+ |n
click Drywood Cage+
|tip They look like small brown wooden buildings.
Rescue #4# Longying Rangers |q 30774/2 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
label "Slay_Osul_Marauders"
Kill Osul enemies around this area
|tip They look like tauren.
Slay #8# Osul Marauders |q 30772/1 |goto 66.87,49.81
'|kill Osul Spitfire##66289, Osul Marauder##60692
step
talk Katak the Defeated##60735
turnin The Exile##30775 |goto 67.00,51.41
step
talk Ban Bearheart##60687
turnin Pitching In##30773 |goto 67.20,52.27
turnin Seeing Red##30772 |goto 67.20,52.27
turnin Ranger Rescue##30774 |goto 67.20,52.27
step
talk Suna Silentstrike##60684
accept Jung Duk##30776 |goto 67.25,52.22
step
click Ceremonial Pile##211524
kill Jung Duk##60801 |q 30776/1 |goto 66.66,51.01
step
talk Ban Bearheart##60687
turnin Jung Duk##30776 |goto 71.02,56.56
accept In Search of Suna##30777 |goto 71.02,56.56
step
clicknpc Shado-Pan Caravan##61205
Begin Traveling to Hatred's Vice |invehicle |goto 70.70,56.53 |q 30777
step
Watch the dialogue
Travel to Hatred's Vice |outvehicle |goto 82.44,73.51 |q 30777 |notravel
step
talk Ban Bearheart##61261
turnin In Search of Suna##30777 |goto 82.68,73.02
accept Dust to Dust##30778 |goto 82.68,73.02
accept Slaying the Scavengers##30779 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept Totemic Research##30780 |goto 82.59,73.02
step
talk Xiao Tu##60903
accept Last Toll of the Yaungol##30781 |goto 82.71,73.17
stickystart "Collect_Palewind_Totems"
stickystart "Kill_Ashfang_Hyenas"
stickystart "Burn_Palewind_Villagers"
step
Watch the dialogue
Examine the Southern Smoke Trail |q 30781/3 |goto 83.51,78.49
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Eastern Smoke Trail |q 30781/1 |goto 84.83,71.50
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Northwestern Smoke Trail |q 30781/4 |goto 84.02,70.89
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
Watch the dialogue
Examine the Western Smoke Trail |q 30781/2 |goto 81.29,72.13
If Xiao Tu isn't next to you, get him again at [82.70,73.17]
step
label "Collect_Palewind_Totems"
click Palewind Totem##211566+
|tip They look like short wooden totem poles with horned skulls on them.
collect 9 Palewind Totem##81355 |q 30780/1 |goto 83.03,74.05
step
label "Kill_Ashfang_Hyenas"
kill 12 Ashfang Hyena##60932 |q 30779/1 |goto 83.03,74.05
step
label "Burn_Palewind_Villagers"
use the Shado-Pan Torch##81356
|tip Use it on Palewind Villagers.
|tip They look like tauren laying on the ground.
Burn #20# Palewind Villagers |q 30778/1 |goto 83.03,74.05
step
talk Yalia Sagewhisper##60864
turnin Totemic Research##30780 |goto 82.59,73.02
step
talk Ban Bearheart##61261
turnin Dust to Dust##30778 |goto 82.68,73.02
turnin Slaying the Scavengers##30779 |goto 82.68,73.02
turnin Last Toll of the Yaungol##30781 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
accept What Lies Beneath##30827 |goto 82.59,73.02
step
talk Yalia Sagewhisper##60864
Tell her _"I am ready to begin the ritual."_ |gossip 37073
Speak to Yalia Sagewhisper |q 30827/1 |goto 82.59,73.02
step
Watch the dialogue
clicknpc Totem of Tranquility##60990
Activate the Totem of Tranquility |q 30827/3 |goto 82.41,73.56
step
clicknpc Totem of Serenity##60991
Activate the Totem of Serenity |q 30827/4 |goto 82.69,73.63
step
clicknpc Totem of Kindness##60933
Activate the Totem of Kindness |q 30827/2 |goto 82.58,73.25
step
Watch the dialogue
Complete the Ritual |q 30827/5 |goto 82.58,73.25
step
talk Yalia Sagewhisper##60864
turnin What Lies Beneath##30827 |goto 82.59,73.02
accept Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept Spiteful Spirits##30782 |goto 82.68,73.02
stickystart "Kill_Spiteful_Spirits"
step
use the Totem of Harmony##81417
|tip Use it on Crazed Shado-Pan Rangers.
|tip They looke like pandas in black armor.
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen.
kill Seething Hatred##61054+
Purify #8# Crazed Shado-Pan Rangers |q 30783/1 |goto 83.29,73.65
step
label "Kill_Spiteful_Spirits"
use the Totem of Harmony##81417 |notinsticky
|tip Use it on the ground as you walk around. |notinsticky
|tip Stand in the Pools of Harmony that appear to reduce the Hatred bar at the bottom of the screen. |notinsticky
kill 10 Spiteful Spirit##63839 |q 30782/1 |goto 83.29,73.65
|tip They look like tauren ghosts.
step
talk Ban Bearheart##61261
turnin Spiteful Spirits##30782 |goto 82.68,73.02
step
talk Yalia Sagewhisper##60864
turnin Hatred Becomes Us##30783 |goto 82.59,73.02
step
talk Ban Bearheart##61261
accept The Point of No Return##30784 |goto 82.68,73.02
step
use the Totem of Harmony##81430
|tip Use it on the ground.
|tip Stand in the circles on the ground to gain a buff.
kill Suna Silentstrike##61055
|tip Inside the building.
|tip She will eventually surrender.
Find Suna Silentstrike |q 30784/1 |goto 84.08,70.54
step
talk Ban Bearheart##61261
turnin The Point of No Return##30784 |goto 82.68,73.02
accept Gao-Ran Battlefront##30785 |goto 82.68,73.02
step
talk Kite Master Nenshi##62903
fpath Gao-Ran Battlefront |goto 74.39,81.46
step
talk Taran Zhu##61066
turnin Gao-Ran Battlefront##30785 |goto 76.42,82.43
accept Behind the Blockade##30884 |goto 76.42,82.43
step
talk Kim the Quiet##62875
home Gao-Ran Battlefront |goto 75.96,82.91 |q 30884 |future
step
talk Septi the Herbalist##61470
accept Treatment for the Troops##30891 |goto 75.86,83.14
stickystart "Collect_Violet_Citrons"
step
talk Taoshi##61469
turnin Behind the Blockade##30884 |goto 76.94,78.79
accept Unwelcome Intruders##30887 |goto 76.94,78.79
stickystart "Kill_Krikthik_Deep_Scouts"
step
label "Collect_Violet_Citrons"
click Violet Citron##211721+
|tip They look like bushes with blue flowers on them.
collect 10 Violet Citron##82342 |q 30891/1 |goto 77.81,77.22
step
label "Kill_Krikthik_Deep_Scouts"
kill 12 Krik'thik Deep-Scout##61374 |q 30887/1 |goto 77.81,77.22
|tip They look like insect people.
step
talk Septi the Herbalist##61470
turnin Treatment for the Troops##30891 |goto 75.86,83.14
step
talk Taoshi##61468
turnin Unwelcome Intruders##30887 |goto 79.46,84.46
accept Breach in the Defenses##30888 |goto 79.46,84.46
accept The Restless Watch##30890 |goto 79.46,84.46
step
talk Mao the Lookout##61467
accept Trap Setting##30889 |goto 79.38,84.44
stickystart "Rearm_Shadow_Pan_Spike_Traps"
stickystart "Kill_Krikthik_Scentlayers"
step
talk Scout Jai-gan##61397
Tell him _"I have orders for you to return to the battlefront."_ |gossip 37888
Deliver Orders to Scout Jai-gan |q 30890/4 |goto 79.01,90.16
step
talk Scout Ying##61396
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37889
Deliver Orders to Scout Ying |q 30890/3 |goto 82.52,89.55
step
talk Scout Long##61395
Tell her _"I have orders for you to return to the battlefront."_ |gossip 37625
Deliver Orders to Scout Long |q 30890/2 |goto 81.27,86.18
step
talk Scout Wei-Chin##61378
Tell him _"I have orders for you to return to the battlefront."_ |gossip 40590
Deliver Orders to Scout Wei-Chin |q 30890/1 |goto 82.21,84.12
step
label "Rearm_Shadow_Pan_Spike_Traps"
clicknpc Shado-Pan Spike Trap##61426+
|tip They look like spiked grey metal balls.
Rearm #8# Shado-Pan Spike Traps |q 30889/1 |goto 80.79,86.06
step
label "Kill_Krikthik_Scentlayers"
use the Shado-Pan Flare##81925
|tip Use it near the moving trails of yellow smoke on the ground.
kill 10 Krik'thik Scentlayer##61373 |q 30888/1 |goto 80.79,86.06
step
talk Mao the Lookout##61467
turnin Trap Setting##30889 |goto 79.38,84.44
step
talk Taoshi##61468
turnin Breach in the Defenses##30888 |goto 79.46,84.46
turnin The Restless Watch##30890 |goto 79.46,84.46
accept Returning from the Pass##30960 |goto 79.46,84.46
step
talk Taran Zhu##61066
turnin Returning from the Pass##30960 |goto 76.42,82.43
accept The Endless Swarm##30893 |goto 76.42,82.43
step
talk Septi the Herbalist##61470
accept Back on Their Feet##30892 |goto 75.86,83.14
accept Rummaging Through the Remains##30894 |goto 75.86,83.14
stickystart "Slay_Krikthik_Attackers"
stickystart "Collect_Krikthik_Limbs"
step
use the Citron-Infused Bandages##82787
|tip Use them on Injured Gao-Ran Blackguards.
|tip They look like pandaren laying on the ground.
Heal #8# Injured Gao-Ran Blackguards |q 30892/1 |goto 74.20,86.57
'|talk Injured Gao-Ran Blackguard##61692
step
label "Slay_Krikthik_Attackers"
Kill Krik'thik enemies around this area
|tip They look like insect people.
Slay #12# Krik'thik Attackers |q 30893/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
label "Collect_Krikthik_Limbs"
Kill Krik'thik enemies around this area
|tip They look like insect people.
click Krik'thik Limb##214820+
|tip They look like insect arms and legs that appear on the ground after you kill Krik'thik enemies.
collect 22 Krik'thik Limb##82722 |q 30894/1 |goto 74.20,86.57
'|kill Krik'thik Limbpincer##61181, Krik'thik Locust-Guard##61365
step
talk Septi the Herbalist##61470
turnin Back on Their Feet##30892 |goto 75.86,83.14
turnin Rummaging Through the Remains##30894 |goto 75.86,83.14
step
talk Taran Zhu##61066
turnin The Endless Swarm##30893 |goto 76.42,82.43
accept Improvised Ammunition##30895 |goto 76.42,82.43
step
talk Initiate Chao##61880
accept In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Initiate Feng##61881
accept Thieves and Troublemakers##30896 |goto 70.45,86.37
stickystart "Slay_Agitated_Root_Sprites"
stickystart "Collect_Volatile_Dread_Orbs"
step
kill Needlebottom##61818
collect Initiate Chao's Sword##82783 |q 30897/1 |goto 63.07,87.68
step
label "Slay_Agitated_Root_Sprites"
Kill Agitated enemies around this area
|tip They look like sprites.
Slay #10# Agitated Root Sprites |q 30896/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
label "Collect_Volatile_Dread_Orbs"
Kill Agitated enemies around this area |notinsticky
|tip They look like sprites. |notinsticky
click Dread Orb##211873+
|tip They look like smaller orange globes on the tree roots on the ground.
collect 16 Volatile Dread Orb##82723 |q 30895/1 |goto 66.93,87.01
'|kill Agitated Nettleskin##61811, Agitated Seedstealer##61302
step
talk Initiate Feng##61881
|tip Up on the cliff.
turnin Thieves and Troublemakers##30896 |goto 70.45,86.37
step
talk Initiate Chao##61880
turnin In the Wrong Hands##30897 |goto 70.34,86.67
step
talk Taran Zhu##61066
turnin Improvised Ammunition##30895 |goto 76.42,82.43
accept Cutting the Swarm##30898 |goto 76.42,82.43
step
clicknpc Dragon Launcher##61746
Control the Dragon Launcher |invehicle |goto 74.81,84.69 |q 30898
step
Kill Krik'thik enemies around this area
|tip They look like insect people on the battlefield nearby to the south.
|tip Use the abilities on your action bar.
Slay #50# Krik'thik Drones |q 30898/1 |goto 74.81,84.69
step
talk Taoshi##62444
turnin Cutting the Swarm##30898 |goto 74.23,85.04
accept Terror of the Dread Wastes##30900 |goto 74.23,85.04
step
kill Norvakess##62324 |q 30900/1 |goto 74.18,87.42
|tip Kill the enemies that appear when it burrows in the ground.
'|kill Krik'thik Drone##65636
step
talk Taran Zhu##61066
turnin Terror of the Dread Wastes##30900 |goto 76.42,82.43
accept Along the Southern Front##30901 |goto 76.42,82.43
step
talk Taoshi##62436
turnin Along the Southern Front##30901 |goto 67.32,80.85
accept Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
accept Taking Stock##30971 |goto 67.36,80.68
stickystart "Collect_Shado_Pan_Fire_Arrows"
step
kill 9 Seething Fleshripper##61299 |q 30970/1 |goto 66.00,82.44
|tip They look like scorpions.
step
label "Collect_Shado_Pan_Fire_Arrows"
click Shado-Pan Fire Arrows##212136+
|tip They look like bundles of arrows.
collect 120 Shado-Pan Fire Arrows##83024 |q 30971/1 |goto 66.00,82.44
step
talk Taoshi##62436
turnin Enraged By Hatred##30970 |goto 67.32,80.85
step
talk Initiate Pao-Me##62124
turnin Taking Stock##30971 |goto 67.36,80.68
accept Joining the Fight##30972 |goto 67.36,80.68
step
talk Lao-Chin the Iron Belly##61016
turnin Joining the Fight##30972 |goto 61.59,79.35
step
talk Taran Zhu##62273
accept Up In Flames##30973 |goto 61.64,79.32
step
clicknpc Keg Bomb##62192+
|tip They look like wooden barrels on the ground around this area.
|tip Face enemies before you click them.
|tip They look like insect people.
|tip The barrels will roll into enemies and make them weaker, if you aim well.
kill 10 Kor'thik Timberhusk##61355 |q 30973/1 |goto 59.06,80.98
step
talk Taran Zhu##62273
turnin Up In Flames##30973 |goto 61.64,79.32
step
talk Lao-Chin the Iron Belly##61016
accept The Taking of Dusklight Bridge##30975 |goto 61.59,79.35
step
click Tasty Brew##214848+
|tip They look like wooden barrels.
|tip To heal yourself, run through the bubbles that appear.
kill 12 Kor'thik Bloodletter##62680 |q 30975/1 |goto Dread Wastes/0 44.87,9.87
|tip Let Lao-Chin tank the enemies for you.
step
kill Hulking Kor'thik Fleshrender##62686 |q 30975/2 |goto 44.87,9.87
step
talk Taran Zhu##62736
turnin The Taking of Dusklight Bridge##30975 |goto Townlong Steppes/0 61.11,83.06
accept Joining the Hunt##30976 |goto Townlong Steppes/0 61.11,83.06
step
talk Taran Zhu##62274
turnin Joining the Hunt##30976 |goto 54.03,78.06
accept In Skilled Hands##30899 |goto 54.03,78.06
step
talk Rensai Oakhide##62278
accept Grounded Welcome##30977 |goto 53.93,78.12
step
talk Kite Master Li-Sen##62898
fpath Rensai's Watchpost |goto 54.29,79.05
stickystart "Kill_Korthik_Fleetwings"
step
talk Marksman Ye##62573
accept Choking the Skies##31032 |goto 51.26,83.02
stickystart "Burn_Korthik_Fleetwing_Corpses"
step
talk Hawkmaster Nurong##61020
turnin In Skilled Hands##30899 |goto 51.66,87.25
accept Hostile Skies##30978 |goto 51.66,87.25
stickystop "Kill_Korthik_Fleetwings"
stickystop "Burn_Korthik_Fleetwing_Corpses"
step
clicknpc Nurong's Cannon##62747
Control Nurong's Cannon |invehicle |goto 51.67,87.32 |q 30978
step
kill Kor'thik Swarmer##62300+
|tip They look like insect people flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down #50# Korthi'thik Swarmers |q 30978/1 |goto 51.7,87.3
step
kill Voress'thalik##62269
|tip It looks like a huge orange insect flying across the canyon nearby.
|tip Use the ability on your action bar.
Shoot Down Voress'thalik |q 30978/2 |goto 51.7,87.3
step
Stop Controlling Nurong's Cannon |outvehicle |q 30978
|tip Click the arrow on your action bar.
step
talk Hawkmaster Nurong##61020
turnin Hostile Skies##30978 |goto 51.66,87.25
accept Devastation Below##30979 |goto 51.66,87.25
step
kill Voress'thalik##62270 |q 30979/1 |goto 53.77,87.39
|tip It walks around this area.
step
talk Hawkmaster Nurong##62786
turnin Devastation Below##30979 |goto 53.99,86.97
accept Heroes of the Shado-Pan##30980 |goto 53.99,86.97
stickystart "Kill_Korthik_Fleetwings"
step
label "Burn_Korthik_Fleetwing_Corpses"
kill Kor'thik Fleetwing##62128+
|tip They look like insect people.
use the Wu Kao Torch##83768
|tip Use it near their corpses.
Burn #10# Kor'thik Fleetwing Corpses |q 31032/1 |goto 51.36,84.20
step
label "Kill_Korthik_Fleetwings"
kill 12 Kor'thik Fleetwing##62128 |q 30977/1 |goto 51.36,84.20
|tip They look like insect people.
step
talk Marksman Ye##62573
turnin Choking the Skies##31032 |goto 51.26,83.02
step
talk Rensai Oakhide##62278
turnin Grounded Welcome##30977 |goto 53.93,78.12
step
talk Taran Zhu##62274
turnin Heroes of the Shado-Pan##30980 |goto 54.06,77.87
accept Buried Beneath##31065 |goto 54.06,77.87
step
click Wukao Spyglass
Watch the dialogue
Look Through Taoshi's Spyglass |q 31065/1 |goto 53.50,77.41
step
talk Taran Zhu##62274
turnin Buried Beneath##31065 |goto 54.06,77.87
accept Taoshi and Korvexxis##30981 |goto 54.06,77.87
accept Lao-Chin and Serevex##31063 |goto 54.06,77.87
accept Nurong and Rothek##31064 |goto 54.06,77.87
step
talk Rensai Oakhide##62278
accept Thinning the Sik'thik##31687 |goto 53.93,78.12
accept The Search for Restless Leng##31688 |goto 53.93,78.12
stickystart "Search_Sikthik_Cages_And_Find_Restless_Leng"
stickystart "Slay_Sikthik_Mantids"
step
kill Korvexxis##62579 |q 30981/1 |goto 46.60,83.06
|tip An ally will help you fight him.
step
kill Serevex##62580 |q 31063/1 |goto 45.38,77.42
|tip An ally will help you fight him.
step
kill Rothek##62581 |q 31064/1 |goto 39.84,75.59
|tip An ally will help you fight him.
step
label "Search_Sikthik_Cages_And_Find_Restless_Leng"
click Sik'thik Cage##214734+
|tip They look like pointed metal structures with yellow windows.
Search #8# Sik'thik Cages |q 31688/1 |goto 43.32,77.01
Find Restless Leng |q 31688/2 |goto 43.32,77.01
|tip You will find him in the last one you open.
step
label "Slay_Sikthik_Mantids"
Kill Sik'thik enemies around this area
|tip They look like insect people.
Slay #12# Sik'thik Mantids |q 31687/1 |goto 43.32,77.01
'|kill Sik'thik Venomspitter##62575, Sik'thik Vess-Guard##61354, Sik'thik Drone##62576
step
talk Taran Zhu##62275
turnin Taoshi and Korvexxis##30981 |goto 47.48,78.87
turnin Lao-Chin and Serevex##31063 |goto 47.48,78.87
turnin Nurong and Rothek##31064 |goto 47.48,78.87
accept The Sha of Hatred##30968 |goto 47.48,78.87
step
Watch the dialogue
|tip Follow your allies when they enter the building.
kill Sha of Hatred##62541 |q 30968/1 |goto 45.92,82.86
|tip Inside the building beneath the huge tree.
|tip Avoid the circles on the ground.
|tip Kill the enemies it summons.
'|kill Vestige of Hatred##65378
step
talk Taoshi##62802
|tip Inside the building beneath the huge tree.
turnin The Sha of Hatred##30968 |goto 46.12,82.46
step
Leave the building |goto 47.31,79.28 < 15 |walk |only if subzone("Sik'vess Lair") and indoors()
talk Rensai Oakhide##62278
turnin Thinning the Sik'thik##31687 |goto 53.92,78.12
turnin The Search for Restless Leng##31688 |goto 53.92,78.12
step
talk Kite Master Yao-Li##62909
fpath Shado-Pan Garrison |goto 50.08,71.98
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Dread Wastes (35-70) (Story Only)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."DreadWastes",
condition_suggested=function() return level >= 35 and level <= 70 and not completedq(31179) end,
startlevel=35,
endlevel=70,
pandariaremix=true,
},[[
step
talk Kite Master Len##61512
accept Better Dead than Dread##31847 |goto Kun-Lai Summit/0 34.54,59.12
step
talk Kite Master Len##61512
fpath Serpent's Spine |goto 34.54,59.12
step
talk Bowmistress Li##62112
turnin Better Dead than Dread##31847 |goto Vale of Eternal Blossoms/0 14.15,76.96 |only if haveq(31847) or completedq(31847)
accept Falling Down##31001 |goto Vale of Eternal Blossoms/0 14.15,76.96
accept Nope##31002 |goto Vale of Eternal Blossoms/0 14.15,76.96
step
click Shado-Pan Rope
Climb Down the Wall |invehicle |goto 14.20,76.73 |q 31001
|only if walking
stickystart "Destroy_Dreadspinner_Eggs"
step
kill 6 Dreadspinner Tender##61981 |q 31002/2 |goto Dread Wastes/0 72.96,22.81
|tip They look like spiders.
You can find more around [Dread Wastes/0 71.72,27.95]
step
label "Destroy_Dreadspinner_Eggs"
use the Shado-Pan Dragon Gun##82807
|tip Use it on Dreadspinner Eggs.
|tip They look like clusters of white spider eggs.
Destroy #20# Dreadspinner Eggs |q 31002/1 |goto 72.96,22.81
You can find more around [71.72,27.95]
step
talk Marksman Lann##62166
Find Marksman Lann |q 31001/1 |goto 72.56,28.67
step
talk Marksman Lann##62166
turnin Falling Down##31001 |goto 72.56,28.67
turnin Nope##31002 |goto 72.56,28.67
accept Psycho Mantid##31003 |goto 72.56,28.67
step
kill Adjunct Kree'zot##62301 |q 31003/1 |goto 73.47,27.48
|tip Inside the small cave.
step
talk Klaxxi'va Tik##62203
|tip Inside the small cave.
turnin Psycho Mantid##31003 |goto 73.67,27.58
accept Preserved in Amber##31004 |goto 73.67,27.58
step
click Ancient Amber Chunk##212980
Use the Klaxxi Tuning Fork on the Amber |q 31004/1 |goto 70.24,25.70
step
Watch the dialogue
talk Kil'ruk the Wind-Reaver##62202
turnin Preserved in Amber##31004 |goto 70.20,25.64
accept Wakening Sickness##31005 |goto 70.20,25.64
accept Ancient Vengeance##31676 |goto 70.20,25.64
stickystart "Collect_Sapfly_Bits"
step
kill 6 Vengeful Gurthani Spirit##65452 |q 31676/1 |goto 67.75,29.72
|tip They look like banshees.
You can find more around [71.43,36.86]
step
label "Collect_Sapfly_Bits"
kill Sapfly##62386+
|tip They look like small yellow flying insects.
collect 100 Sapfly Bits##83075 |q 31005/1 |goto 67.75,29.72
You can find more around [71.43,36.86]
step
talk Kil'ruk the Wind-Reaver##62202
turnin Wakening Sickness##31005 |goto 70.20,25.64
turnin Ancient Vengeance##31676 |goto 70.20,25.64
accept The Klaxxi Council##31006 |goto 70.20,25.64
step
talk Kil'ruk the Wind-Reaver##62413
Tell it _"Take me to Klaxxi'vess."_ |gossip 35586
Begin Traveling to Klaxxi'vess |invehicle |goto 70.20,25.64 |q 31006
step
Watch the dialogue
Travel to Klaxxi'vess |q 31006/1 |goto 55.01,33.99 |notravel
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Klaxxi Council##31006 |goto 54.98,34.05
accept The Dread Clutches##31007 |goto 54.98,34.05
accept Not Fit to Swarm##31660 |goto 54.98,34.05
step
talk Kor'ik##64815
accept Dead Zone##31009 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
accept Amber Arms##31008 |goto 55.02,35.56
step
talk Kik'tik##63501
fpath Klaxxi'vess |goto 55.83,34.88
step
talk Zit'tix##65220
home Klaxxi'vess |goto 55.92,32.32 |q 31010 |future
step
talk Kil'ruk the Wind-Reaver##62538
Tell it _"Please fly me to the Clutches of Shek'zeer"_ |gossip 35587
Begin Flying to the Clutches of Shek'zeer |invehicle |goto 54.98,34.05 |q 31009
step
Fly to the Clutches of Shek'zeer |outvehicle |goto 39.01,40.52 |q 31009 |notravel
stickystart "Collect_Amber_Blades"
stickystart "Kill_Shekzeer_Clutch_Keepers"
stickystart "Kill_Shekzeer_Swarmborn"
step
click Inactive Sonic Relay
Activate the Sonic Relay |q 31009/1 |goto 40.03,39.05
step
_Click the Complete Quest Box:_
turnin Dead Zone##31009
accept In Her Clutch##31010
step
click Sha-Haunted Crystal##214562
accept A Source of Terrifying Power##31661 |goto 44.59,41.36
step
click Ancient Amber Chunk##212980
Watch the dialogue
Kill the enemies that attack in waves
Waken the Paragon |q 31010/1 |goto 44.74,41.55
'|kill Shek'zeer Swarmborn##62748, Shek'zeer Bladesworn##62749
step
label "Collect_Amber_Blades"
kill Shek'zeer Bladesworn##62563+
|tip They look like insect people with large swords.
|tip Some of them ride on large scorpions.
collect 6 Amber Blade##83135 |q 31008/1 |goto 43.29,43.41
step
label "Kill_Shekzeer_Clutch_Keepers"
kill 6 Shek'zeer Clutch-Keeper##64559 |q 31007/1 |goto 44.43,41.77
|tip They look like insect people casting a shadow spell.
step
label "Kill_Shekzeer_Swarmborn"
kill 30 Shek'zeer Swarmborn##62582 |q 31660/1 |goto 44.43,41.77
|tip They look like small insect people.
step
talk Kil'ruk the Wind-Reaver##62538
turnin The Dread Clutches##31007 |goto 54.99,34.04
turnin Not Fit to Swarm##31660 |goto 54.99,34.04
step
talk Malik the Unscathed##62774
turnin In Her Clutch##31010 |goto 54.94,34.13
step
talk Kor'ik##64815
accept A Cry From Darkness##31066 |goto 54.77,34.06
step
talk Ambersmith Zikk##64599
turnin Amber Arms##31008 |goto 55.02,35.56
turnin A Source of Terrifying Power##31661 |goto 55.02,35.56
accept Concentrated Fear##31108 |goto 55.02,35.56
step
talk Malik the Unscathed##62774
|tip He walks to this location.
accept The Dreadsworn##31689 |goto 55.06,35.47
accept Citizens of a New Empire##31107 |goto 55.06,35.47
stickystart "Collect_Dread_Amber_Focuses"
stickystart "Kill_Vorthik_Dreadsworn"
stickystart "Collect_Vorthik_Eggs"
step
kill Qi'tar the Deathcaller##62863 |q 31066/1 |goto 59.36,18.41
step
label "Collect_Dread_Amber_Focuses"
kill Vor'thik Fear-Shaper##62814+
|tip They look like larger insect people casting a shadow spell.
collect 4 Dread Amber Focus##86616 |q 31108/1 |goto 58.16,14.62
step
label "Kill_Vorthik_Dreadsworn"
kill 6 Vor'thik Dreadsworn##62813 |q 31689/1 |goto 58.16,14.62
|tip They look like larger insect people carrying polearms.
step
label "Collect_Vorthik_Eggs"
click Vor'thik Egg##214170+
|tip They look like squirming yellow cocoons.
collect 10 Vor'thik Eggs##86598 |q 31107/1 |goto 59.65,16.99
step
talk Kor'ik##64815
turnin A Cry From Darkness##31066 |goto 54.77,34.06
accept Extending Our Coverage##31087 |goto 54.77,34.06
step
talk Malik the Unscathed##62774
turnin The Dreadsworn##31689 |goto 55.06,35.47
turnin Citizens of a New Empire##31107 |goto 55.06,35.47
step
talk Ambersmith Zikk##64599
turnin Concentrated Fear##31108 |goto 55.02,35.56
step
talk Kil'ruk the Wind-Reaver##62538
accept Amber Is Life##31019 |goto 55.06,35.85
step
kill 7 Mistblade Ripper##61970 |q 31019/1 |goto 65.38,63.64
|tip They look like lizard people.
step
Enter the underground cave |goto 66.76,63.84 < 15 |walk
kill Mistblade Scale-Lord##63179 |q 31019/2 |goto 66.42,66.11
|tip Inside the underground cave.
step
clicknpc Ancient Amber Chunk##65354
|tip Inside the underground cave.
turnin Amber Is Life##31019 |goto 66.84,65.39
step
Watch the dialogue
|tip Inside the underground cave.
_Next to you:_
talk Korven the Prime##62232
accept Feeding the Beast##31020 |goto 66.84,65.39
accept Living Amber##31021 |goto 66.84,65.39
stickystart "Kill_Coldbite_Crocolisks"
step
Leave the underground cave |goto 66.76,63.84 < 15 |walk |only if subzone("Mistblade Den") and indoors()
click Amber Fragment##212011+
|tip They look like orange rocks underwater.
collect Living Amber##82864+ |n
use the Living Amber##82864
Feed Korven the Prime #9# Living Amber |q 31021/1 |goto 65.19,58.75
step
label "Kill_Coldbite_Crocolisks"
kill 8 Coldbite Crocolisk##62023 |q 31020/1 |goto 65.19,58.75
|tip Underwater. |notinsticky
step
_Next to you:_
talk Korven the Prime##62232
turnin Feeding the Beast##31020
turnin Living Amber##31021
accept Kypari Zar##31022
step
click Sonar Tower##212933
Examine the Sonar Tower |q 31022/1 |goto 59.81,59.47
step
Watch the dialogue
Kill the enemies that attack in waves
Defend Korven the Prime |q 31022/2 |goto 59.98,59.40
'|kill Ik'thik Towerguard##63294
step
_Next to you:_
talk Korven the Prime##62232
turnin Kypari Zar##31022
accept The Root of the Problem##31026
step
Enter the underground cave |goto 58.60,59.45 < 15 |walk
kill Coldbite Matriarch##62008 |q 31026/1 |goto 57.36,57.78
|tip Inside the underground cave.
|tip Avoid stepping on the purple eggs, they spawn enemies.
step
_Next to you:_
talk Korven the Prime##62232
turnin The Root of the Problem##31026
step
Leave the underground cave |goto 58.60,59.45 < 15 |walk |only if subzone("Coldbite Burrow") and indoors()
Enter the building |goto 46.24,53.14 < 15 |walk
Locate Amberglow Hollow |q 31087/1 |goto 46.54,52.60
|tip Inside the building.
step
kill Adjunct Zet'uk##65478 |q 31087/2 |goto 48.09,49.77
|tip Inside the building.
step
click Silent Beacon##213250
|tip Inside the building.
Use the Resonating Crystal on the Silent Beacon |q 31087/3 |goto 48.16,49.75
step
talk Kor'ik##65365
|tip Inside the building.
turnin Extending Our Coverage##31087 |goto 48.11,49.64
accept Isolating the Frequency##31088 |goto 48.11,49.64
accept The Color of Our Energy##31090 |goto 48.11,49.64
stickystart "Kill_Ikthik_Harvesters"
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
click Amber Collector##212923+
|tip They look like orange bags hanging on the side of trees.
collect 7 Amber-Filled Jar##85159 |q 31090/1 |goto 40.84,51.34
step
label "Kill_Ikthik_Harvesters"
kill 8 Ik'thik Harvester##63206 |q 31088/1 |goto 40.84,51.34
|tip They look like insect people.
step
talk Infiltrator Ik'thal##65511
fpath The Briny Muck |goto 42.53,55.75
step
Enter the building |goto 46.24,53.14 < 15 |walk
talk Kor'ik##65365
|tip Inside the building.
turnin Isolating the Frequency##31088 |goto 48.11,49.64
turnin The Color of Our Energy##31090 |goto 48.11,49.64
accept By the Sea, Nevermore##31089 |goto 48.11,49.64
step
Leave the building |goto 46.24,53.14 < 15 |walk |only if subzone("Amberglow Hollow") and indoors()
use the Klaxxi Tuning Fork##84119
Awaken Kaz'tik the Manipulator |q 31089/1 |goto 43.50,63.26
step
Watch the dialogue
talk Kaz'tik the Manipulator##63758
turnin By the Sea, Nevermore##31089 |goto 43.32,63.49
accept Reunited##31091 |goto 43.32,63.49
step
talk Kaz'tik the Manipulator##63876
Tell him _"I'm ready to help you find your weapon."_ |gossip 28603
Watch the dialogue
Follow Kaz'tik the Manipulator |goto 43.32,63.49 > 10 |c |q 31091
step
Watch the dialogue
|tip Follow Kaz'tik the Manipulator and protect him as he walks.
|tip He eventually walks to this location.
Escort Kaz'tik the Manipulator to the Undisturbed Dirt |q 31091/1 |goto 41.76,72.02
step
Watch the dialogue
Find Kaz'tik's Greatest Weapon |q 31091/2 |goto 41.76,72.02
step
talk Kaz'tik the Manipulator##63876
turnin Reunited##31091 |goto 41.76,72.02
accept The Kunchong Whisperer##31359 |goto 41.76,72.02
accept Feed or Be Eaten##31092 |goto 41.76,72.02
stickystart "Feed_Succulent_Turtle_Filets_To_Kovok"
stickystart "Slay_Muckscale_Tribe_Members"
step
kill Oracle Hiss'ir##63998 |q 31359/1 |goto 41.93,63.77
|tip He walks around this area.
step
click Glowing Amber##214062
accept Falling to Pieces##31398 |goto 41.88,63.72
step
label "Feed_Succulent_Turtle_Filets_To_Kovok"
Kill Brineshell enemies around this area
|tip They look like turtles.
collect Succulent Turtle Filet##86489+ |n
use the Succulent Turtle Filet##86489+
Feed #6# Succulent Turtle Filets to Kovok |q 31092/1 |goto 37.63,62.58
'|kill Brineshell Snapper##63981, Trained Brineshell Snapper##65330
step
label "Slay_Muckscale_Tribe_Members"
Kill Muckscale enemies around this area
|tip They look like lizard people.
Slay #10# Muckscale Tribe Members |q 31359/2 |goto 37.63,62.58
'|kill Muckscale Slayer##63999, Muckscale Flesh-Hunter##63997, Muckscale Shaman##64008, Muckscale Ripper##63993
step
talk Kaz'tik the Manipulator##63758
turnin The Kunchong Whisperer##31359 |goto 54.25,35.78
turnin Feed or Be Eaten##31092 |goto 54.25,35.78
turnin Falling to Pieces##31398 |goto 54.25,35.78
step
talk Jin the Flying Keg##63500
fpath The Sunset Brewgarden |goto 50.21,12.24
step
talk Sapmaster Vu##62666
accept The Heavens Hum With War##31067 |goto 51.21,11.39
step
Enter the building |goto 53.60,15.45 < 15 |walk
click Scroll of Auspice##212389
|tip Inside the building.
accept Sacred Recipe##31068 |goto 53.09,12.36
step
kill Azzix K'tai##62843 |q 31067/1 |goto 52.74,10.27
|tip He walks around this area.
|tip Inside the building.
step
Leave the building |goto 53.60,15.45 < 15 |walk |only if subzone("The Amber Vault") and indoors()
talk Lya of Ten Songs##62667
turnin Sacred Recipe##31068 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin The Heavens Hum With War##31067 |goto 51.21,11.39
accept Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
accept Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
accept I Bring Us Great Shame##31071 |goto 51.13,11.11
step
Watch the dialogue
talk Lya of Ten Songs##62667
|tip She runs to this location.
accept Rending Daggers##31072 |goto 50.73,11.71
step
talk Chen Stormstout##62779
accept Fate of the Stormstouts##31129 |goto 50.45,12.05
step
talk Lya of Ten Songs##62667
Ask her _"Have you seen any Stormstouts here in the Brewgarden?"_ |gossip 35828
Speak with Lya of Ten Songs |q 31129/2 |goto 50.73,11.71
step
talk Big Dan Stormstout##62845
Ask him _"Is your name really Stormstout?"_ |gossip 35823
Speak with Big Dan Stormstout |q 31129/3 |goto 50.90,11.36
step
talk Sapmaster Vu##62666
Ask him _"Have you seen anybody named Stormstout come through here?"_ |gossip 35825
Speak with Sapmaster Vu |q 31129/1 |goto 51.21,11.39
step
talk Chen Stormstout##62779
turnin Fate of the Stormstouts##31129 |goto 50.45,12.05
stickystart "Harvest_Shade"
step
talk Chen Stormstout##62779
accept Evie Stormstout##31077 |goto 54.11,20.48
step
click Lost Keg##212540
collect Lost Keg##83781 |q 31071/2 |goto 54.43,20.27
step
click Lost Picnic Supplies##212556
collect Lost Picnic Supplies##83783 |q 31071/3 |goto 56.01,19.44
step
kill Kz'Kzik##62832
|tip He looks like a larger insect person that walks around this area.
collect Blade of Kz'Kzik##84111 |q 31072/1 |goto 53.29,19.98
step
click Lost Mug##212548
collect Lost Mugs##83782 |q 31071/1 |goto 51.70,19.07
step
kill Ilikkax##62833
|tip He looks like a larger insect person that walks around this area.
collect Blade of Ilikkax##84112 |q 31072/2 |goto 50.98,21.02
step
label "Harvest_Shade"
Kill enemies around this area
|tip Only enemies that look like shadow aliens will count for the quest goal.
Harvest #100# Shade |q 31069/1 |goto 55.21,18.18
'|kill Dread Lurker##62751, Nagging Dreadling##65996
step
kill Frightened Mushan##62760+
|tip They look like dinosaurs.
collect 3 Large Mushan Tooth##84107 |q 31070/1 |goto 49.15,19.15
step
talk Lya of Ten Songs##62667
turnin Rending Daggers##31072 |goto 50.73,11.71
accept Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Shade##31069 |goto 51.21,11.39
step
talk Olon##62668
turnin Daggers of the Great Ones##31070 |goto 51.16,11.22
step
talk Thirsty Missho##62859
turnin I Bring Us Great Shame##31071 |goto 51.13,11.11
step
talk Sapmaster Vu##62666
accept Bound With Wood##31073 |goto 51.21,11.39
step
talk Defender Azzo##63218
accept Kor'thik Aggression##31133 |goto 50.19,12.44
step
Meet up with Chen |q 31077/1 |goto 50.18,10.20
step
Watch the dialogue
Eulogize Evie |q 31077/2 |goto 50.18,10.20
step
talk Chen Stormstout##62779
turnin Evie Stormstout##31077 |goto 50.18,10.20
accept Han Stormstout##31078 |goto 50.18,10.20
stickystart "Slay_Korthik_Mantids"
step
Enter the building |goto 47.00,16.82 < 15 |walk
clicknpc Han Stormstout##62776
|tip Inside the building.
|tip You can't run through the orange beams.
|tip Follow the path in and out of the rooms so that you never touch the orange beams.
|tip You will eventually be able to reach him.
Find Han Stormstout |q 31078/1 |goto 43.75,16.75
step
talk Chen Stormstout##62779
|tip Inside the building.
|tip Run through the splashing water and it will knock you toward him.
turnin Han Stormstout##31078 |goto 44.41,16.81
step
Leave the building |goto 47.00,16.82 < 15 |walk |only if subzone("Morrowchamber") and indoors()
Enter the building |goto 44.79,15.86 < 10 |walk
Find the Mark of the Empress |q 31074/1 |goto 44.51,16.78
|tip Inside the building.
step
Leave the building |goto 44.79,15.86 < 10 |walk |only if subzone("Kor'vess") and indoors()
Enter the building |goto 43.05,14.00 < 10 |walk
Find the Heartroot of Kypari Kor |q 31074/2 |goto 43.22,14.96
|tip Inside the building.
step
Leave the building |goto 43.05,14.02 < 10 |walk |only if subzone("Kor'vess") and indoors()
clicknpc Withered Husk##62876+
|tip They look like dead trees chopped in half.
collect 8 Fragrant Corewood##84118 |q 31073/1 |goto 46.29,13.10
step
label "Slay_Korthik_Mantids"
Kill Kor'thik enemies around this area
|tip They look like insect people.
Slay #17# Kor'thik Mantids |q 31133/1 |goto 43.72,12.83
'|kill Kor'thik Havoc##62757, Kor'thik Chitinel##62756, Kor'thik Battlesinger##62758
step
talk Defender Azzo##63218
turnin Kor'thik Aggression##31133 |goto 50.19,12.44
step
talk Lya of Ten Songs##62667
turnin Wood and Shade##31074 |goto 50.73,11.71
step
talk Sapmaster Vu##62666
turnin Bound With Wood##31073 |goto 51.21,11.39
accept Sunset Kings##31075 |goto 51.21,11.39
step
talk Sapmaster Vu##62666
turnin Sunset Kings##31075 |goto 38.18,17.18
step
talk Olon##62668
accept Fiery Wings##31080 |goto 38.20,17.12
step
talk Boggeo##62772
accept The Horror Comes A-Rising##31079 |goto 38.16,17.34
step
talk Lya of Ten Songs##62667
accept Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
accept Great Vessel of Salvation##31082 |goto 38.65,17.25
stickystart "Collect_Flittering_Dust"
stickystart "Kill_Kyparites"
stickystart "Kill_Shuffling_Mistlurkers"
step
kill Mygoness##62766 |q 31081/2 |goto 32.92,19.36
|tip He walks around this area.
step
kill Ahgunoss##62765 |q 31081/1 |goto 32.10,17.37
step
use the Rikkitun Bell##84267
|tip Use it if you lose your sprites and can't click the Motherseeds.
clicknpc Motherseed##62601+
|tip They look like huge acorns with yellow crystals in them.
|tip They are located near the enemies surrounding this location.
|tip Bring them to this location.
Bring #3# Motherseeds Back to the Motherseed Pit |q 31082/1 |goto 36.88,17.22
step
label "Collect_Flittering_Dust"
clicknpc Rikkilea Flitterling##62764+
|tip They look like fae dragons.
|tip Run into the colorful sparks that fly off of them to collect them.
collect 88 Flitterling Dust##84239 |q 31080/1 |goto 37.26,20.61
step
label "Kill_Kyparites"
kill 2 Kyparite##63007 |q 31079/2 |goto 34.70,20.99
|tip They look like spots of brown splashing water moving across the ground.
|tip Get close to them and they will come out of the ground.
step
label "Kill_Shuffling_Mistlurkers"
kill 7 Shuffling Mistlurker##65404 |q 31079/1 |goto 34.70,20.99
|tip They look like swamp elementals.
step
talk Boggeo##62772
turnin The Horror Comes A-Rising##31079 |goto 38.16,17.33
step
talk Olon##62668
turnin Fiery Wings##31080 |goto 38.20,17.12
step
talk Lya of Ten Songs##62667
turnin Incantations Fae and Primal##31081 |goto 38.30,17.13
step
talk Chief Rikkitun##62771
turnin Great Vessel of Salvation##31082 |goto 38.65,17.25
accept Bind the Glamour##31084 |goto 38.65,17.25
step
talk Chief Rikkitun##62771
Tell it _"The forked blade is ready, and we have given our gift. Please perform your incantation."_ |gossip 40853
Follow Chief Rikkitum |goto 38.65,17.25 > 10 |c |q 31084
step
Watch the dialogue
|tip Follow Chief Rikkitum as he walks.
|tip He eventually walks to this location.
Allow Chief Rikkitun to Enchant the Forked Blade |q 31084/1 |goto 39.67,23.18
step
talk Chief Rikkitun##62771
turnin Bind the Glamour##31084 |goto 38.65,17.25
step
talk Lya of Ten Songs##62667
accept Fires and Fears of Old##31085 |goto 38.30,17.13
step
talk Sapmaster Vu##62666
accept Blood of Ancients##31086 |goto 38.18,17.18
step
click Solidified Amber##212902
collect Chunk of Solidified Amber##84779 |q 31086/1 |goto 30.22,30.58
step
click Enormous Landslide
Click Here After the Landslide Moves |confirm |goto 30.06,30.89 |q 31085
step
Enter the building |goto 30.18,31.69 < 15 |walk
use the Ruining Fork##84771
|tip Inside the building.
Use the Ruining Fork on Iyyokuk the Lucid |q 31085/1 |goto 32.39,33.65
step
Watch the dialogue
|tip Inside the building.
Kill the enemies that attack
|tip They appear and start channeling on Iyyokuk the Lucid.
Protect Iyyokuk the Lucid Until He Escapes |q 31085/2 |goto 32.39,33.65
'|kill Adjunct G'kkal##63103, Adjunct Okzyk##63102, Adjunct Pivvika##63104
step
Leave the building |goto 30.25,31.73 < 15 |walk |only if subzone("The Amber Hibernal") and indoors()
talk Lya of Ten Songs##62667
turnin Fires and Fears of Old##31085 |goto 50.28,12.07
step
talk Sapmaster Vu##62666
turnin Blood of Ancients##31086 |goto 50.22,12.11
step
talk Min the Breeze Rider##63498
fpath Soggy's Gamble |goto 56.10,70.18
step
talk San the Sea Calmer##63016
|tip Inside the building.
home The Chum Bucket |goto 55.15,71.11
step
talk Deck Boss Arie##63349
accept Mazu's Breath##31265 |goto 54.72,72.17
step
use the Potion of Mazu's Breath##85869
Drink the Potion of Mazu's Breath |q 31265/1 |goto 54.72,72.17
step
talk Deck Boss Arie##63349
turnin Mazu's Breath##31265 |goto 54.72,72.17
accept Fresh Pots##31181 |goto 54.72,72.17
accept You Otter Know##31182 |goto 54.72,72.17
stickystart "Bait_Crab_Pots"
step
use the Bag of Clams##85231
|tip Use it on Coldwhisker Otters underwater.
Feed #8# Coldwhisker Otters |q 31182/1 |goto 59.48,81.84
'|talk Coldwhisker Otter##63376
step
label "Bait_Crab_Pots"
kill Sea Monarch##63470+
|tip They look like large fish underwater.
collect Sea Monarch Chunks##85230+ |n
click Empty Crab Pot+
|tip They look like red and brown cages underwater.
|tip You need 2 Sea Monarch Chunks to bait each crab pot.
Bait #10# Crab Pots |q 31181/1 |goto 59.48,81.84
step
talk Deck Boss Arie##63349
turnin Fresh Pots##31181 |goto 54.72,72.16
turnin You Otter Know##31182 |goto 54.72,72.16
accept Meet the Cap'n##31183 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Meet the Cap'n##31183 |goto 55.66,72.50
accept Walking Dog##31185 |goto 55.66,72.50
accept Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept On the Crab##31187 |goto 54.72,72.16
accept Shark Week##31188 |goto 54.72,72.16
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
accept Dog Food##31186 |goto 50.72,78.38
stickystart "Feed_Dog"
stickystart "Collect_Thresher_Teeth"
stickystart "Send_Full_Crab_Pots_To_The_Surface"
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Silt Vents |q 31185/1 |goto 46.40,74.06
|tip Underwater.
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Wreck of the Mist-Hopper |q 31185/2 |goto 44.9,78.0
|tip Underwater.
step
click Soggy's Footlocker##213454
|tip It looks like a small brown wooden chest.
|tip Underwater on this sunken ship.
|tip It can appear in other locations on this sunken ship.
collect Sealed Charter Tube##85886 |q 31184/1 |goto 44.73,78.66
step
use the Dog's Whistle##85955
|tip Use it if Dog isn't following you.
Bring Dog to the Whale Corpse |q 31185/3 |goto 40.08,78.68
|tip Underwater.
step
label "Send_Full_Crab_Pots_To_The_Surface"
click Full Crab Pot##213508+
|tip They look like red and brown cages.
|tip Underwater. |notinsticky
Send #8# Full Crab Pots to the Surface |q 31187/1 |goto 44.75,76.21
step
label "Feed_Dog"
use the Dog's Whistle##85955 |notinsticky
|tip Use it if Dog isn't following you. |notinsticky
kill Rockshell Snapclaw##63369+
|tip They look like green lobsters.
|tip Underwater. |notinsticky
|tip Dog will eat their corpses.
Feed Dog #10# Times |q 31186/1 |goto 44.75,76.21
step
label "Collect_Thresher_Teeth"
kill Longfin Thresher##63944+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect Thresher Jaw##85998+ |n
use the Thresher Jaw##85998+
collect 200 Thresher Teeth##85999 |q 31188/1 |goto 44.75,76.21
step
use the Dog's Whistle##85955
_Next to you:_
talk Dog##63955
turnin Dog Food##31186
step
talk Deck Boss Arie##63349
turnin On the Crab##31187 |goto 54.72,72.16
turnin Shark Week##31188 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
|tip Inside the building.
turnin Walking Dog##31185 |goto 55.66,72.50
turnin Old Age and Treachery##31184 |goto 55.66,72.50
step
talk Deck Boss Arie##63349
accept Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Master Angler Ju Lien##64259
Speak with Master Angler Ju Lien |q 31189/1 |goto 53.64,76.05
step
talk Master Angler Ju Lien##64259
Tell him _"Deck Boss said you needed some help."_ |gossip 40852
Watch the dialogue
|tip Click the various fishing rods nearby.
|tip They look like fishing poles leaning on wooden stands next to Master Angler Ju Lien.
Kill the enemies that attack
Assist Master Angler Ju Lien |q 31189/2 |goto 53.64,76.05
'|kill Jiao Spawn##64273
step
talk Deck Boss Arie##63349
turnin Reeltime Strategy##31189 |goto 54.72,72.16
step
talk Captain "Soggy" Su-Dao##63317
accept The Mariner's Revenge##31190 |goto 54.77,72.11
step
clicknpc Mist-Hopper Jr.##64350
Control the Mist-Hopper Jr. |invehicle |goto 56.17,76.29 |q 31190
step
kill Jiao##63330
|tip It looks like a huge octopus in the water.
|tip Aim at the red crosshairs.
|tip Use the ability on your action bar.
Land #25# Bow Hits |q 31190/1 |goto 53.35,80.89
Land #25# Port Side Hits |q 31190/2 |goto 53.35,80.89
Land #25# Starboard Hits |q 31190/3 |goto 53.35,80.89
Land #25# Stern Hits |q 31190/4 |goto 53.35,80.89
step
Stop Controlling the Mist-Hopper Jr. |outvehicle |goto 56.2,76.3 |q 31190
|tip Click the arrow on your action bar.
step
talk Captain "Soggy" Su-Dao##63317
turnin The Mariner's Revenge##31190 |goto 56.57,75.92
step
talk Deck Boss Arie##63349
accept Mazu's Bounty##31354 |goto 56.57,75.82
step
talk Master Angler Ju Lien##64259
turnin Mazu's Bounty##31354 |goto 54.90,72.83
step
talk Kil'ruk the Wind-Reaver##62538
accept Skeer the Bloodseeker##31175 |goto 55.06,35.85
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
click Ancient Amber Chunk##212980
|tip Inside the underwater cave.
Awaken Skeer the Bloodseeker |q 31175/1 |goto 25.70,50.40
step
Watch the dialogue
|tip Inside the underwater cave.
talk Skeer the Bloodseeker##63071
turnin Skeer the Bloodseeker##31175 |goto 25.71,50.30
accept A Strange Appetite##31176 |goto 25.71,50.30
accept Fine Dining##31177 |goto 25.71,50.30
accept A Bloody Delight##31178 |goto 25.71,50.30
stickystart "Collect_Starfish_Meat"
stickystart "Collect_Volatile_Blood"
step
kill Briny Clacker##63348+
|tip They look like small lobsters.
|tip Underwater.
collect 8 Clacker Tail##85212 |q 31177/1 |goto 25.02,61.12
step
label "Collect_Starfish_Meat"
click Spiny Starfish##212988+
|tip They look like pink starfish.
|tip Underwater. |notinsticky
collect 12 Starfish Meat##85211 |q 31176/1 |goto 25.02,61.12
step
label "Collect_Volatile_Blood"
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
kill Dread Remora##63353+
|tip They look like sharks.
|tip Underwater. |notinsticky
collect 100 Volatile Blood##85229 |q 31178/1 |goto 25.02,61.12
step
Enter the underwater cave |goto 25.76,53.85 < 30 |walk
talk Skeer the Bloodseeker##63071
|tip Inside the underwater cave.
turnin A Strange Appetite##31176 |goto 25.71,50.62
turnin Fine Dining##31177 |goto 25.71,50.62
turnin A Bloody Delight##31178 |goto 25.71,50.62
accept The Scent of Blood##31179 |goto 25.71,50.62
step
kill 12 Muckscale Flesheater##63465 |q 31179/1 |goto 25.71,50.97
|tip They attack in waves.
|tip Inside the underwater cave.
step
Watch the dialogue
|tip Inside the underwater cave.
kill Muckscale Serpentus##63466 |q 31179/2 |goto 25.71,50.97
step
Leave the underwater cave |goto 25.72,53.98 < 30 |walk |only if subzone("Muckscale Grotto") and indoors()
talk Kil'ruk the Wind-Reaver##62538
turnin The Scent of Blood##31179 |goto 55.06,35.85
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Scarlet Halls (10-70)",{
mapid=431,
achieveid={6760},
patch='100207',
condition_suggested=function() return level>=35 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Scarlet Halls dungeon.",
pandariaremix=true,
},[[
step
Queue for Scarlet Halls or Enter the Dungeon with your Group |goto Scarlet Halls/1 34.2,90.0 |c
step
talk Hooded Crusader##64764
accept Rank and File##31495 |goto Scarlet Halls/1 31.9,84.4
accept Just for Safekeeping, Of Course##31497 |goto Scarlet Halls/1 31.9,84.4
stickystart "Scarlet Crusade"
step
Prepare to cross the training ground. |goto 48.2,78.8 < 5
confirm
step
kill Commander Lindon##59191 |goto 48.0,54.0
|tip In order to cross the training ground you must click on an archery target and use it as a shield. Avoid the fire arrows that leave patches of flame on the ground.
|confirm
step
Go through the tunnel |goto 49.8,36.9 < 5
confirm
step
kill Houndmaster Braun##59303
|tip Houndmaster Braun will use Piercing Throw. This will target a player and deal damage to every player in between Braun and his target.
|tip Death Blossom is an AoE whirlwind, spread out to reduce its effectiveness.
|tip Both of these abilities will cause Bloody Mess. This is DoT can stack and become deadly.
|tip At 90%, 80%, 70%, and 60% Braun will summon an Obedient Hound to his side. You can either kill them or just have the tank hold onto them.
|tip If the hounds remain alive at 50% Braun will begin to lose control of them and the will aid you in battle. When this happens, Braun will enter a Bloody Rage, gaining 25% increased damage and 50% increased attack speed.
Defeat Houndmaster Braun |scenariogoal 1/19266 |goto 54.5,29.0
step
Allow the remaining dogs to kill the door guards and procede to the Athenaeum. |goto Scarlet Halls/2 55.3,21.1
confirm
step
map Scarlet Halls/2
path follow strict;loop off;ants straight
path	47.6,88.3	56.8,79.4	61.7,69.5
path	61.7,55.5
While following this path keep an eye out for Scarlet Cannoneers.
|tip They will spawn randomly and attack using the cannons along this path.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Armsmaster Harlan##58632
|tip Dragon's Reach is a cleave ability, avoid being in front of this boss.
|tip Harlan will periodically summon two Scarlet Defenders. You can either kill these adds or you can wait for them to be caught in Harlan's Blades of Light ability.
|tip He will use Heroic Leap to the center of the pit and begin casting Blades of Light. This whirlwind quickly moves around the entire area and does massive damage to anybody caught within it. Jump between the different levels of this area to avoid this ability easily.
|confirm
step
map Scarlet Halls/2
path follow strict;loop off;ants straight
path	48.6,58.1	48.7,50.5	39.1,46.8
path	39.1,23.2
Follow the path to the final boss.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
label "Scarlet Crusade"
kill Vigilant Watchman##58898+, Master Archer##59175+, Scarlet Evangelist##58685+, Scarlet Myrmidon##58683+, Scarlet Cannoneer##59293+, Scarlet Scourge Hewer##58684+, Scarlet Defender##58676+, Scarlet Evoker##58756+, Scarlet Defender##58998+, Scarlet Treasurer##59241+, Scarlet Hall Guardian##59240+, Scarlet Pupil##59373+, Scarlet Scholar##59372+
Kill 50 Scarlet Crusaders. |q 31495/1
|only if haveq(31495)
step
kill Flameweaver Koegler##59150
|tip Koegler will try to light the book cases around the room on fire with Book Burner. You can avoid this mechanic by staying on the red carpet circle inside this room.
|tip He will move to the center of the room and begin using Greater Dragon's Breath. Watch where he is facing and move around the room clockwise to avoid being hit.
|tip Quickened Mind will cause Koegler's next three spells to be cast nearly instantly. This can be dispelled off of him.
collect Codex of the Crusade##87267 |q 31497/1 |only if haveq(31497)
Defeat Flameweaver Koegler |scenariogoal 1/34441 |goto 39.3,16.1
step
talk Hooded Crusader##64764
turnin Rank and File##31495 |goto 39.3,17.0
turnin Just for Safekeeping, Of Course##31497 |goto 39.3,17.0
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Scarlet Monastery (10-70)",{
mapid=302,
achieveid={6761},
patch='100207',
condition_suggested=function() return level>=35 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Scarlet Monastery dungeon.",
pandariaremix=true,
},[[
step
Queue for Scarlet Monastery or Enter the Dungeon with your Group |goto Scarlet Monastery/1 74.2,46.2 |c
step
talk Hooded Crusader##64838
accept Blades of the Anointed##31515 |goto Scarlet Monastery/1 72.7,47.0
step
Clear the trash up to this point. |goto 30.8,46.2
|tip The Piles of Corpses should be killed first or you will be fighting zombies much longer than is necessary.
|confirm
step
kill Thalnos the Soulrender##59789
|tip Thalnos will Raise Fallen Crusaders. This ability summons zombies that the tank needs to pick up. When the Fallen Crusaders hit you, they leave behind Mind Rot which is a DoT that can stack.
|tip He also summons Spirit Gales often. These are puddles on the ground that should not be stepped in. This ability is interruptable.
|tip Evict Soul is a debuff that Thalnos throws on a random party member. This DoT needs to be dispelled as quickly as possible.
|tip He will also use Summon Empowering Spirit. This ability will summon an add that DPS should kill as quickly as they can. If this add reaches a Fallen Crusader's corpse, it will spawn an Empowered Zombie.
|tip Empowered Zombies are large zombies which need to be tanked. They cannot be killed without great focus.
Defeat Thalnos the Soulrender |scenariogoal 1/19270 |goto 26.1,45.4
step
click Blade of the Anointed##214296
collect Blade of the Anointed##87282 |q 31515/1 |goto 20.6,45.9
step
map Scarlet Monastery/1
path follow strict;loop off;ants straight
path	34.5,52.5	34.8,78.2	39.4,81.7
path	48.5,90.3
Follow the path. |goto Scarlet Monastery/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
talk Blade of the Anointed##64855
turnin Blades of the Anointed##31515 |goto Scarlet Monastery/2 49.1,24.5
accept Unto Dust Thou Shalt Return##31516 |goto Scarlet Monastery/2 49.1,24.5
step
map Scarlet Monastery/2
path follow strict;loop off;ants straight
path	45.7,31.9	43.9,36.3	49.2,43.3
Follow the path. |goto Scarlet Monastery/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Brother Korloff##59223
Brother Korloff loves to play with fire.
|tip Flying Kick will hit a random party member knocking them back, make sure they aren't knocked into any uncleared trash.
|tip Blazing Fists is a series of punches Korloff makes in front of him, have the tank take a step back and make sure all party members are behind Korloff.
|tip Firestorm Kick is whirlwind of flame, do not stand in it.
|tip Scorched Earth is a fire trail that Korloff leaves behind him, do not stand in it.
|tip Every 10%, Korloff wil gain a stack of Rising Flame. These increase his fire damage done by 10% per stack.
|tip The boss will patrol between two groups. Pull each group carefully, keeping in mind the boss' patrol.
|tip Opening the world map will display an ant trail guiding you through the current floor.
Defeat Brother Korloff |scenariogoal 1/19271 |goto 49.4,52.3
step
Enter the cathedral here |goto 49.1,57.1 < 5
confirm
step
Before encountering the boss, make sure you kill the trash within the cathedral.
|tip This includes the main room and both wings.
|confirm
step
kill Commander Durand##60040
kill High Inquisitor Whitemane##3977
_Phase 1_
|tip Commander Durand will fight you alone.
|tip He uses Flash of Steel and Dashing Strike. Both of these abilities cause him to jump to party members quickly, but neither do much damage as long as the group is spread out.
|tip When Durand dies, phase 2 begins.
_Phase 2_
|tip High Inquisitor Whitemane will come and and begin to fight.
|tip She will cast Power Word: Shield, Smite and Heal. Make sure to interrupt Smite and Heal.
|tip Whitemane will also try casting Mass Resurrection. DO NOT LET THIS CAST FINISH!! If this cast finishes, all corpses within 100 yards will resurrect and aggro.
|tip After you weaken her she will cast Deep Sleep. This puts the entire party to sleep for 10 seconds, during this time she will resurrect Durand.
_Phase 3_
|tip Now you will have to fight the two together.
|tip Kill Whitemane first, make sure to interrupt Smite and Heal
|tip Stay spread out for Durand.
Use the Blades of the Anointed on High Inquisitor Whitemane's corpse. |use Blades of the Anointed##87390 |only if haveq(31516)
Blades of the Anointed thrust into Whitemane's corpse. |q 31516/1 |only if haveq(31516)
Defeat Commander Durand and High Inquisitor Whitemane |scenariogoal 1/34443 |goto 48.9,78.9
step
talk Hooded Crusader##64842
turnin Unto Dust Thou Shalt Return##31516 |goto 49.2,80.7
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Scholomance (10-70)",{
mapid=476,
achieveid={6762},
patch='100207',
condition_suggested=function() return level>=35 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Scholomance dungeon.",
pandariaremix=true,
},[[
step
Queue for Scholomance or Enter the Dungeon with your Group |goto Scholomance/1 18.2,61.1 |c
step
talk Talking Skull##64563
accept The Four Tomes##31442 |goto Scholomance/1 27.0,58.8
accept An End to the Suffering##31448 |goto Scholomance/1 27.0,58.8
step
Go through the gate and down these steps |goto 48.6,43.2 < 5
confirm
step
Clear this room of trash and be careful not to aggro Instructor Chillheart.
|confirm
step
kill Instructor Chillheart##58633
_Phase 1_
|tip Wrack Soul will deal damage to a party member and jump to a nearby party member when it expires. Spread out.
|tip Touch of the Grave causes Chillheart's next 10 basic attacks to deal additional damage.
|tip Frigid Grasp will summon ice at a player's feet, step out of this before it explodes.
|tip Ice Wall will start at the back of the room and slowly creep toward the boss. If this touches any player then they will die instantly. This will act as the enrage timer of the fight.
|tip Kill Chillheart's physical body and Phase 2 will start.
kill Instructor Chillheart's Phylactery##58664
_Phase 2_
|tip The Anarchist Arcanist will float around creating Arcane Bombs. These explode on impact so avoid them.
|tip Antonidas' Self Help Guide to Standing in Fire will cast Burn. This does a small AoE of fire damage around the book.
|tip Wander's Colossal Book of Shadow Puppets will cast Shadow Bolt at the party.
Defeat Instructor Chillheart |scenariogoal 1/19259 |goto 65.1,60.6
step
click In the Shadow of the Light##214279
Destroy In the Shadow of the Light |q 31442/1  |goto Scholomance/1 74.7,57.5
|only if haveq(31442)
step
map Scholomance/1
path follow strict;loop off;ants straight
path	79.3,52.0	80.6,23.8
Follow the path downstairs. |goto Scholomance/2 77.0,26.5 <5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Kel'Thuzad's Deep Knowledge##214278
Destroy Kel'Thuzad's Deep Knowledge |q 31442/2 |goto Scholomance/2 73.9,8.6
|only if haveq(31442)
step
Clear all of the trash in this room before fighting Jandice Barov.
|confirm
step
kill Jandice Barov##59184 |goto 59.9,18.5
|tip Wondrous Rapidity is a large cone attack in front of Jandice, make sure nobody is in front of her.
|tip Gravity Flux will create a gravity distortion field on the ground. If you step into this ability you will be knocked back as well as damaged heavily.
|tip At 66% and 33% Jandice will cast Phantasmal Images. She will clone herself throughout the room, destroy the clones until she returns to battle.
|tip While the clones are alice they will cast Whirl of Illusion, this does AoE damage to everybody in the group every second.
Defeat Jandice Barov |scenariogoal 1/19260 |goto 59.9,18.5
step
Enter the Chamber of Summoning |goto 56.4,26.8 < 5
confirm
step
kill Boneweaver##59193
|tip Go around the perimeter of this room and kill the Boneweavers. When all of them are dead, the boss wil initiate you.
|confirm
step
kill Rattlegore##59153
|tip With each successful attack Rattlegore will gain a stack of Rusting. This increases his attack damage but lowers his attack and movement speeds. If the tank is getting hit too hard, kite Rattlegore around the room.
|tip Bone Spike will target a random party member and do massive damage to them. This can be prevented if every party member keeps Bone Armor active.
|tip Bone Armor is granted by clicking on the Bone Piles around the room.
|tip Periodically a section of the room will be engulfed in Soulflame. Avoid the fire and be wary because it grows over time.
Defeat Rattlegore |scenariogoal 1/19261 |goto 48.3,26.2
step
Enter the Chamber of Summoning |goto 40.3,26.6 < 5
confirm
step
kill Flesh Horror##59359+
kill Meat Graft##59982+ |goto 42.0,46.8
|tip When fighting the Flesh Horrors, aim for the Meat Grafts attached to their bodies. If all of the Grafts die then the Horrors will die with them.
|confirm
step
click Forbidden Rites and other Rituals Necromantic##214280
Destroy Forbidden Rites and other Rituals Necromantic |q 31442/3  |goto 42.5,51.6
|only if haveq(31442)
step
Go down the steps and prepare to fight Lilian Voss. |goto 47.0,47.2 < 5
confirm
step
kill Lilian Voss##58722
_Phase 1_
|tip Lilian will Shadow Shiv a random player after jumping onto them. When she latches onto you, run away from your allies to avoid AoE damage.
|tip Death's Grasp will pull every party member to Lilian and will be followed by Dark Blaze. Dark Blaze causes every player to start leaving a trail of fire behind them, run to the outside of the room to trail your fire, this way the center is still open.
|tip At 60% Phase 2 begins.
kill Lilian's Soul##58791
_Phase 2_
|tip Lilian's Soul will begin to attack you. She will periodically cast Blazing Soul which does fire damage to all players.
|tip For every melee attack Lilian lands she will unleash another Blazing Soul. You must kite her aroud.
|tip Fixate Anger will determine who is in charge of kiting. If she Fixates on your do not stop running.
_Phase 3_
|tip Phase 3 is a combination of Phases 1 and 2.
|tip Be watchful of who Lilian's Soul is Fixating on, this is the highest source of damage during the fight.
|tip You will continued to get pulled in by Death's Grasp, be extra careful not to put a path of Dark Blaze in somebodies way if they need to kite the Soul.
Defeat Lilian Voss |scenariogoal 1/19262 |goto 52.0,47.1
step
click The Dark Grimoire##214277
Destroy The Dark Grimoire |q 31442/4 |goto Scholomance/2 47.1,73.1
|only if haveq(31442)
step
Go through this doorway and follow the stairs down. |goto Scholomance/2 47.8,84.8
confirm
step
kill Darkmaster Gandling##59080 |q 31448/1 |only if haveq(31448)
kill Darkmaster Gandling##59080 |only if not haveq(31448)
|tip Immolate will be used on a random party member, heal through this DoT.
|tip Darkmaster Gandling will cast Rise!. This summons many Failed Students that need to be killed. During this cast Darkmaster Gandling takes reduced damage.
|tip Periodically a random party member will be teleported to one of Gandling's study rooms for a Harsh Lesson.
|tip This party member must kill the Expired Test Subjects and make their way back to the bosses room. If the healer gets trapped in one of these rooms, the Fresh Test Subjects around the room will serve as useful bombs. Dispel the _Explosive Pain_ off of them to deal AoE damage to the Expired Test Subjects.
Defeat Darkmaster Gandling |scenariogoal 1/34440 |goto Scholomance/3 50.2,35.1
step
Go back up the stairs. |goto Scholomance/4 49.1,21.5 < 5
confirm
step
talk Talking Skull##64563
turnin The Four Tomes##31442 |goto Scholomance/3 49.2,21.2
turnin An End to the Suffering##31448 |goto Scholomance/3 49.2,21.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Temple of the Jade Serpent (10-70)",{
mapid=429,
achieveid={6757},
patch='100207',
condition_suggested=function() return level>=10 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Siege of Temple of the Jade Serpent dungeon.",
pandariaremix=true,
},[[
step
Queue for Temple of the Jade Serpent or Enter the Dungeon with your Group |goto Temple of the Jade Serpent/1 31.3,45.0 < 100 |c
step
talk Priestess Summerpetal##60578
accept Restoring Jade's Purity##31355 |goto Temple of the Jade Serpent/1 36.0,44.4
step
talk Master Windstrong##64399
accept Deep Doubts, Deep Wisdom##31356 |goto 36.0,44.4
step
map Temple of the Jade Serpent/1
path follow strict;loop off;ants straight
path	36.3,34.9	31.4,26.6	37.4,15.9
Follow this path to the first boss. |goto 37.4,15.9 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Wise Mari##56448
_Phase 1_
|tip Throughout this entire fight avoid standing in any water, it will hurt you every second.
|tip For the first phase Wise Mari will be immune to damage. You can break his protective bubble by defeat the four _Corrupt Living Water_ that he summons with Call Water.
|tip When these adds die they will spawn three Corrupt Droplet and leave behind Sha Residue. Kite the adds to a new location out of the residue and kill them.
|tip After four adds die, Wise Mari will burst his bubble and begin Phase 2.
_Phase 2_
|tip The only mechanic in this phase is Wash Away. Mari will spin in a circle and shoot out a water spout, move around him to avoid being hit.
Assist Wise Mari |q 31355/1 |only if haveq(31355)
Defeat Wise Mari |scenariogoal 1/19230 |goto 44.4,19.2
step
map Temple of the Jade Serpent/1
path follow strict;loop off;ants straight
path	37.4,15.9	31.4,26.6	36.3,34.9
path	31.4,57.6	27.7,62.8
Follow the path back to The Scrollkeeper's Sanctum. |goto Temple of the Jade Serpent/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map Temple of the Jade Serpent/2
path follow strict;loop off;ants straight
path	34.9,21.5	26.4,68.0	58.3,82.5
path	65.3,50.2	46.1,41.9
Kill all of the mini bosses along this platform as you follow the path. |goto Temple of the Jade Serpent/1
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
When you are ready to face the boss kill the Corrupted Scroll.
kill Corrupted Scroll##57080
|confirm
step
There are two possible encounters associated with this boss.
Click here for the _Trial of the Yaungol_ strategy. |next "yaungol" |confirm
Click here for the _Champion of the Five Suns_ strategy. |next "sun" |confirm
step
label "yaungol"
_Trial of the Yaungol_
kill Strife##59051
kill Peril##59726
|tip Your group will want to focus its attention on either Strife or Peril, splitting up damage is extremely bad in this fight.
|tip When you attack one of the bosses they begin stacking a buff called Intensity. Keep your eye on this buff, the higher it gets the more damage it does to the group. Let this buff get to either eight or niene stacks and then switch all damage, including pets, to the other boss.
|tip The boss that you are not focusing will begin to starve. Dissipation reduces the Insanity stacks.
|tip While you are juggling the bosses they will cast Agony on random party members. This does a decent amount of damage that must be healed.
Lorewalker Stonestep assisted |q 31355/3 |only if haveq(31355) |next "done"
Defeat the Trial of the Yaungol |scenariogoal 1/24785 |next "done" |goto 26.2,75.2
step
label "sun"
_Champion of the Five Suns_
kill Zao Sunseeker##58826
|tip Five Suns will spawn and being firing Sunfire Rays at random players dealing damage.
|tip You will be able to kill four of these Suns, and everytime you do a Haunting Sha will spawn. You can either kill these one at a time or all together.
|tip When all four Haunting Sha are dead, Zao Sunseeker will become possessed.
|tip He will shoot Hellfire Arrows at random party members, kill him before your healer becomes overwhelmed.
Lorewalker Stonestep assisted |q 31355/3 |only if haveq(31355) |next "done"
Defeat the Champion of the Five Suns |scenariogoal 1/24785 |next "done" |goto 26.2,75.2
step
label "done"
map Temple of the Jade Serpent/1
path follow strict;loop off;ants straight
path	38.6,80.7	53.5,85.4	46.5,64.9
Follow this path to the next boss. |goto 46.5,64.9 <5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Kill all the enemies on the Terrace of the Twin Dragons to face Liu Flameheart.
|confirm
step
kill Liu Flameheart##56732
_Phase 1_
|tip Serpent Strike will hit the tank for significant damage and leave a heavy DoT effect on them, dispel this DoT.
|tip Serpent Kick will be used immediately after Serpent Strike, this does damage to anybody within 8 yards of Liu.
|tip Serpent Wave wil follow Serpent Kick, this shoots waves of fire out from around Liu. Do not be hit by these.
_Phase 2_
|tip At 70% life, all of Liu's abilities gain an additional effect.
|tip Jade Serpent Strike now also absorbs 70,000 healing received by the target.
|tip Jade Serpent Kick now also knocks players within 8 yards back.
|tip Jade Serpent Wave now also leaves a trial of fire along the path the flame travels.
_Phase 3_
kill Yu'lon##56762
|tip At 30% life, Yu'lon spawns.
|tip Yu'lon will breathe balls of fire that create a pool of Jade Fire where they land. Step out of this pool to avoid taking damage.
Liu Flameheart assisted |q 31355/2 |only if haveq(31355)
Defeat Liu Flameheart |scenariogoal 1/19235 |goto 48.1,52.0
step
Perpare to face the Sha of Doubt. |goto 56.1,57.0
|confirm
step
kill Sha of Doubt##56439 |only if not haveq(31356)
kill Sha of Doubt##56439 |q 31356/1 |only if haveq(31356)
|tip The Sha of Doubt will cast Wither Will at two random party members, dealing damage to both of them.
|tip Touch of Nothingness is a dispellable effect that will be put on a random player. This does damage to all surrounding players so spread out.
|tip Periodically the Sha of Doubt will become invulnerable and summon as many adds are there are players. Stack these adds up and kill all of them, if you do not kill them before their energy bar is full, they will heal the boss 10% life and explode dealing significant damage for each add left alive.
Defeat Sha of Doubt |scenariogoal 1/34412 |goto 60.5,58.8
step
talk Priestess Summerpetal##60578
turnin Restoring Jade's Purity##31355 |goto 36.0,44.4
step
talk Master Windstrong##64399
turnin Deep Doubts, Deep Wisdom##31356 |goto 36.0,44.4
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Stormstout Brewery (20-70)",{
mapid=439,
achieveid={6457},
patch='100207',
condition_suggested=function() return level>=15 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Stormstout Brewery dungeon.",
pandariaremix=true,
},[[
step
Queue for Stormstout Brewery or Enter the Dungeon with your Group |goto Stormstout Brewery/1 79.7,39.7 < 100 |c
step
talk Auntie Stormstout##59822
accept Family Secrets##31324 |goto Stormstout Brewery/1 76.9,35.4
step
talk Chen Stormstout##59704
accept Trouble Brewing##31327 |goto 75.1,36.2
stickystart "Stormstout"
step
map Stormstout Brewery/1
path follow strict;loop off;ants straight
path	54.0,50.3	44.0,65.1	30.7,84.3
path	21.5,76.5	23.9,63.1
Clear the trash along this path. |goto 23.9,63.1 <5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
label "Stormstout"
As you follow the next path make sure you loot the Hozen you kill for Stormstout Secrets and click the tomes along the floor.
kill Sodden Hozen Brawler##59605+, Inflamed Hozen Brawler##56924+, Sleepy Hozen Brawler##56863+, Drunken Hozen Brawler##56862+
click Stormstout Secrets##213795
collect 5 Stormstout Secrets##86431 |q 31324/1
|only if haveq(31324)
step
You will need to kill 40 Hozen to summon the first boss. |goto Stormstout Brewery/2 53.4,50.1
Click here once Ook-Ook has spawned |confirm
step
kill Ook-Ook##56637
|tip Ook-Ook will Ground Pound which is a frontal shockwave, do not stand in it.
|tip At 90%, 60%, and 30% Ook-Ook will Go Bananas. This increases his attack speed and damage dealt each time. This buff stacks. He will also summon Rolling Barrels when he does this.
|tip DPS should click on Rolling Barrels and ride them into Ook-Ook. This will increase his damage taken as well as do a lot of damage. This effect stacks
Defeat Ook-Ook |scenariogoal 1/19236 |goto 53.4,50.1
step
map Stormstout Brewery/2
path follow strict;loop off;ants straight
path	74.6,75.1	80.9,81.4	89.8,71.8
path	81.8,58.3	Stormstout Brewery/3 20.5,68.7	Stormstout Brewery/3 29.5,49.9
path	Stormstout Brewery/3 38.0,46.3
This is a gauntlet event. Kill the virmen as you run through the path.
|tip Boppers are the most important type of virmen. Upon death they drop a Big Ol' Hammer. When you pick this up you will gain a new button on your screen, Smash!. Click it to clear many virmen at a time.
Finish the gauntlet event. |goto Stormstout Brewery/3 38.0,46.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Hoptallus##56717
|tip Hoptallus will constantly use Furlwind. this whirlwind will do large amounts of damage, so kite him around.
|tip He will also summon virmen. These are the same types of adds that you cleared in the last path. Aim down the Boppers first and use their Big Ol' Hammer to Smash! all of the other adds.
|tip Carrot Breath will deal large damage to anybody standing within the cone, avoid this.
Defeat Hoptallus |scenariogoal 1/19237 |goto 38.0,46.3
step
map Stormstout Brewery/3
path follow strict;loop off;ants straight
path	39.7,38.9	43.3,26.7	58.9,29.7
path	75.3,56.5	89.9,44.2	73.6,34.2
Kill the Alementals as you follow this path. |goto 73.6,34.2 <5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Uncle Gao will summon 3 waves of Alementals before Yan-Zhu. |goto Stormstout Brewery/4 49.6,51.1
kill Yeasty Brew Alemental##66413+
kill Bloated Brew Alemental##59518+
kill Fizzy Brew Alemental##59520+
|confirm
step
kill Yan-Zhu the Uncasked##59479 |q 31327/1 |only if haveq(31327)
kill Yan-Zhu the Uncasked##59479 |only if not haveq(31327)
|tip Yan-Zhu will constantly through Blackout Brew, counter this by moving around until the debuff is off of you.
|tip When Yan-Zhu casts Carbonation click on the Fizzy Bubbles around the room, this will grant you a buff that allows you to fly above the cloud.
|tip Bubble Shields will need to be killed very quickly, they reduce the amount of damage that the boss takes.
|tip Keep moving to remove the Blackout Brew, click Fizzy Bubbles to gain the ability to fly above Carbonation
Defeat Yan-Zhu the Uncasked |scenariogoal 1/34411 |goto 49.6,51.1
step
talk Uncle Gao##59074
turnin Family Secrets##31324 |goto Stormstout Brewery/4 39.0,56.0
step
talk Chen Stormstout##64361
turnin Trouble Brewing##31327 |goto 41.1,55.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Shado-Pan Monastery (25-70)",{
mapid=443,
achieveid={6469},
patch='100207',
condition_suggested=function() return level>=20 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Shado-Pan Monastery dungeon.",
pandariaremix=true,
},[[
step
Queue for Shado-Pan Monastery or Enter the Dungeon with your Group |goto Shado-Pan Monastery/2 85.0,56.5 < 100 |c
step
talk Ban Bearheart##62236
accept Lord of the Shado-Pan##30757 |goto Shado-Pan Monastery/2 83.4,56.1
step
Fight your way through this room |goto 60.2,43.8 < 5
confirm
step
kill Gu Cloudstrike##56747
_Phase 1_
|tip Gu will Invoke Lightning and deal Nature damage to a random party member.
|tip Gu's serpent will create a Static Field under a random player. Move out of this and the effect that persists.
_Phase 2_
|tip Gu will become immune to damage so focus your attention on his Azure Serpent.
|tip When the serpent casts Magnetic Shroud, stack up. This will absorb healing and then explode and heal for the amount it absorbed.
|tip Lightning Breath is a frontal cone, do not stand in front of the boss.
_Phase 3_
|tip Gu Cloudstrike will use Overcharged Soul which deals damage to the entire party until he is defeated.
Defeat Gu Cloudstrike |scenariogoal 1/19239 |goto 45.3,24.3
step
Follow the path to this point and defeat the Shado-Pan Disciples who attack you. |goto 23.6,83.6 < 5
Follow this ramp up and be careful not to be hit by the freezing arrows. |goto Shado-Pan Monastery/1 54.0,75.2 < 5
Cross the bridge and enter Snowdrift Dojo |goto Shado-Pan Monastery/1 36.1,81.2 < 5
confirm
step
kill Fragrant Lotus##56472 |goto Shado-Pan Monastery/3 60.5,64.8
kill Flying Snow##56473 |goto Shado-Pan Monastery/3 60.5,64.8
Fight off the waves of Shado-Pan Novices and finally defeat Fragrant Lotus and Flying Snow.
|confirm
step
kill Master Snowdrift##56541
|tip Fists of Fury is a frontal attack that does massive damage, the tank needs to back out of this.
|tip Tornado Kick is a strong whirlwind attack that should be avoided.
|tip Master Snowdrift will teleport around the room and make two clones of himself. You can tell the boss from his clones by looking at the debuffs on the boss. Step behind him and avoid the projectiles being cast around the room.
|tip While Master Snowdrift is in Parry Stance refrain from hitting him, or find a way to hit him from behind. He will retaliate to any attack that is made.
Defeat Master Snowdrift |scenariogoal 1/19244 |goto 24.5,25.3
step
talk Master Snowdrift##56541
accept The Path to Respect Lies in Violence##31342 |goto 30.3,35.4
step
Go outside and cross this bridge. |goto Shado-Pan Monastery/1 24.9,41.3 < 5
confirm
step
Enter the Sealed Chambers |goto Shado-Pan Monastery/1 31.1,34.0
confirm
step
kill Sha of Violence##56719 |only if not haveq(31342)
kill Sha of Violence##56719 |q 31342/1 |only if haveq(31342)
|tip The Sha of Violence will use Disorientating Smash on its target, this will deal a large amount of damage and cause the target to be blinded for four seconds.
|tip Smoke Blades is a whirlwind attack that will leave a debuff on anybody it hits that reduces critical strike chance to 0. If you attack with this debuff it will clear it faster. After the debuff is gone you will gain Parting Smoke for three seconds, this causes your next hit to critically strike for 100% more damage than it normally would.
|tip Sha Spike will be cast at a random player knocking them up.
|tip When the Sha of Violence is weak, it will Enrage gaining 50% attack speed.
Defeat Sha of Violence |scenariogoal 1/19240 |goto Shado-Pan Monastery/4 47.3,61.1
step
The following trash can be very tough to beat.
|tip You will have to release the spirits of the dead Pandaren before killing any of the hostile adds. If you kill the adds they will simply respawn.
|confirm
step
map Shado-Pan Monastery/1
path follow strict;loop off;ants straight
path	46.6,43.1	54.0,50.7	61.6,52.4
path	69.9,49.5
Follow the path to the final boss. |goto Shado-Pan Monastery/1 69.9,49.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Taran Zhu##56884
|tip The biggest mechanic in this fight is Hatred meter. If this reaches 100% you will receive the debuff Haze of Hate this reduces your accuracy by 90%.
|tip To counteract the Hatred Meter you will have a new Meditate button above your action bars. Click this button to prevent being consumed by hatred.
|tip Tanks should tank Tarn Zhu up against one of the pillars in his arena. Taran Zhu will knock the tank back and cause this fight to be more hectic than it needs to be.
|tip Ring of Malice is a ring of shadows that Taran Zhu will use around himself. Either be very far away or nearby to avoid this.
|tip He will periodically Summon Gripping Hatred. This shadow balls will grab players and pull them into Pools of Shadows. Kill these if you can.
Rid Taran Zhu of his possession. |q 30757 |only if haveq(30757)
Defeat Taran Zhu |scenariogoal 1/34410 |goto Shado-Pan Monastery/1 69.9,49.5
step
talk Taran Zhu##56884
turnin Lord of the Shado-Pan##30757 |goto 69.3,49.7
|only if haveq(30757)
step
talk Master Snowdrift##64387
turnin The Path to Respect Lies in Violence##31342 |goto 68.4,50.1
|only if haveq(31342)
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Siege of Niuzao Temple (30-70)",{
mapid=457,
achieveid={6763},
patch='100207',
condition_suggested=function() return level>=25 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Siege of Niuzao Temple dungeon.",
pandariaremix=true,
},[[
step
Queue for Siege of Niuzao Temple or Enter the Dungeon with your Group |goto Siege of Niuzao Temple/2 65.4,87.3 |c
step
talk Shado-Master Chum Kiu##64517
accept Somewhere Inside##31365 |goto Siege of Niuzao Temple/2 63.1,77.7
accept Take Down the Wing Leader##31366 |goto Siege of Niuzao Temple/2 63.1,77.7
step
Jump over the ledge here. |goto 60.5,54.4
|confirm
step
kill Vizier Jin'bak##61567
|tip In the middle of this room is a puddle of resin. The tank should periodically walk through this puddle to shrink it.
|tip Vizier Jin'bak will summon three adds, kill them before they reach the resin puddle.
|tip Shortly after summoning adds, he will cast Detonate, this does damage to the entire group. The smaller the puddle is, the less damage the group will take.
Defeat Vizier Jin'bak |scenariogoal 1/19249 |goto 46.8,52.2
step
map Siege of Niuzao Temple/2
path follow strict;loop off;ants straight
path	37.4,65.4	53.4,81.8	Siege of Niuzao Temple/3 65.0,39.2
path	Siege of Niuzao Temple/3 31.6,38.4	Siege of Niuzao Temple/3 21.7,53.9
Clear the trash and follow this path. |goto Siege of Niuzao Temple/3
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
talk Yang Ironclaw##61620
We're ready to defend! |goto Siege of Niuzao Temple/1 44.5,74.3
|confirm
step
Before you fight Commander Vo'jak you must fight the wave of adds that he sends your way.
|tip Stay on the top ledge and throw Mantid Tar Kegs down onto the path as the adds run up. This will deal heavy damage and increase their damage taken.
|tip Have the ranged DPS in your party prioritizing the Sik'thik Amberwings. They will fly at the wall and Bombard the party. If you do not kill them then they will fly away and continue to be a hassle later.
Defeat Commander Vo'jak's army and click here. |confirm
step
kill Commander Vo'jak##61634
|tip While you fight Commander Vo'jak have a ranged dps continue to throw and Mantid Tar Kegs on the boss. Be careful not to hit the tank.
|tip The boss will counter this by using Thousand Blades, clearing his debuffs. Have the tank kite him into the puddles to reapply the debuff.
|tip While the boss is using Thousand Blades run away! This whirlwind will deal massive, potentially fatal, damage.
Defeat Commander Vo'jak |scenariogoal 1/19250
stickystart "freeshado"
step
map Siege of Niuzao Temple/1
path follow strict;loop off;ants straight
path	37.8,76.5	35.4,59.8	39.1,42.7
path	46.3,43.2
Follow the ramp and then follow this path. |goto 46.3,43.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
The next boss patrols this area, be careful to pull the trash groups without also gaining his attention.
|confirm
step
kill General Pa'valak##61485
|tip General Pa'valak's two main abilities are Blade Rush and Tempest. Tempest negates healing but is nothing too significant. When he begins casting Blade Rush he will mark a spot on the ground with a circle, move out of it. He throws his weapon and then charges to it.
|tip He will also cast Bulwark. This shield will absorb one million damage while adds run in to reinforce the boss. Kill the shield and AoE down the adds.
|tip Siege Explosives will spawn around the area. To make this fight go quicker use these explosives on the boss to increase his damage taken. It is also suggested you save a bomb for each wave of adds.
Defeat General Pa'valak |scenariogoal 1/19251 |goto 55.0,45.5
step
label "freeshado"
clicknpc Shado-Pan Prisoner##64520+
Free 12 Shado-Pan Prisoners |q 31365/1
|tip While following this next path make sure you are freeing the captive Shado-Pan.
|only if haveq(31365)
step
Make your way to the other side of the bridge |goto 50.1,33.0
|tip This event can be a little hectic. The aggro range on most of the enemies can cause the group to pull an uncomfortable amount, be careful to aggro only what your group is capable of clearing in a single pull.
|confirm
step
kill Wing Leader Ner'onok##62205 |q 31366/1 |only if haveq(31366)
kill Wing Leader Ner'onok##62205 |only if not haveq(31366)
|tip Wing Leader Ner'onok will use a variety of Resins designed to hinder movement.
|tip When he casts Quick Dry Resin start jumping. This removes the effect.
|tip He will constantly throw down pools of Caustic Pitch. These damage and slow you if you run through them.
|tip Periodically throughout the fight Wing Leader Ner'onok will fly to the opposite end of the bridge and begin casting Gusting Winds. Navigate to the other side of the bridge by having your back against the pod-like structures that are all along the bridge, they allow you to move forward without being pushed back.
|tip When you make it to the other end of the bridge interrupt Gusting Winds. A ranged interrupt comes in great handy here.
Defeat Wing Leader Ner'onok |scenariogoal 1/34407 |goto 57.5,21.8
step
talk Shado-Master Chum Kiu##64517
turnin Somewhere Inside##31365 |goto Siege of Niuzao Temple/1 58.1,23.1
turnin Take Down the Wing Leader##31366 |goto Siege of Niuzao Temple/1 58.1,23.1
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Gate of the Setting Sun (40-70)",{
mapid=437,
achieveid={10010, 6759},
patch='100207',
condition_suggested=function() return level>=25 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Gate of the Setting Sun dungeon.",
pandariaremix=true,
},[[
step
Queue for Gate of the Setting Sun or Enter the Dungeon with your Group |goto Gate of the Setting Sun/1 61.3,88.0 |c
step
talk Bowmistress Li##64467
accept Lighting the Way##31363 |goto Gate of the Setting Sun/1 60.9,88.6
accept That's a Big Bug!##31364 |goto Gate of the Setting Sun/1 60.9,88.6
step
While clearing trash avoid the Volatile Munitions that drop, they deal out massive fire damage around them. |goto 49.4,87.9 < 5
confirm
step
kill Saboteur Kip'tilak##56906
|tip This fight is all about the positioning of the group and the boss.
|tip Saboteur Kip'tilak will throw munitions around the room at random. These will not explode unless touched by another player.
|tip At 60% and 30%, he will use World in Flames. He will throw 5 munitions are the room at random and then explode them all at the same time.
|tip He will pick a player at random and Sabotage them. After 4 seconds the bombs attached to that player will explode in all 4 directions, similarly to the other bombs.
Defeat Saboteur Kip'tilak |scenariogoal 1/19245 |goto 45.8,88.1
step
map Gate of the Setting Sun/1
path follow strict;loop off;ants straight
path	46.2,75.4	41.4,71.4	41.4,64.4
path	41.5,53.5	46.3,33.3
Click the lever once the group is on the elevator. |goto Gate of the Setting Sun/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Striker Ga'dok##56589
|tip Prey Time will target a random party member and deal damage to them over 5 seconds.
|tip Impaling Strike will be an attack used primarily on the tank. It will deal half of their current life in damage.
|tip Mantid Disruptors will throw Acid Bombs at the platform, avoid them.
|tip At both 70% and 30% Ga'dok will use Strafing Run. This ability will cause him to light the platform on fire. You can avoid the fire by standing on the sides to the left or right of wherever the boss starts his run.
|tip The Strafing Runs will also summon Mantid Strikers. These adds need to be picked up by the tank.
|tip Watch where he flies during Strafing Run. Do not be on that side.
Defeat Striker Ga'dok |scenariogoal 1/19246 |goto Gate of the Setting Sun/2 49.0,27.2
step
clicknpc Flak Cannon##60415 |goto Gate of the Setting Sun/2 45.8,26.9
|tip Click the Flak Cannon and kill all of the mantid before going back down the elevator.
|confirm
step
Click the lever to go back down. |goto Gate of the Setting Sun/1 51.4,51.3 |noway |c
step
Click the Signal Flame |goto 47.9,12.7
|tip This will summon the next boss.
Light the Signal Flame. |q 31363/1 |only if haveq(31363)
|confirm |only if not haveq(31363)
step
Kill the trash before engage Commander Ri'mok. |goto 46.2,22.5
|confirm
step
kill Commander Ri'mok##56636
|tip Commander Ri'mok's fight can get a little hectic because there is a lot going on.
|tip He will summon Mantid Swarmers continuously. AoE them down.
|tip A Mantid Saboteur will be summoned every 45 seconds. Depending on your group you may want to kill these as they spawn. Normally the tank should hold onto these adds until the boss is dead.
|tip Frenzied Assault will deal massive damage in a cone in front of the boss. Do not stand in front of him while he uses this.
|tip Viscous Fluid is a green slime pool that Ri'mok will throw on the ground. Players lose 10% damage dealt per second in this green slime while the boss gets 10% damage per second.
Defeat Commander Ri'mok |scenariogoal 1/19247 |goto 46.1,24.4
step
Start here |goto 46.1,43.5
Jump down into the broken building and follow the path down. |goto 49.3,45.1 < 5
confirm
step
Exit the building and prepare to fight Raidgonn. |goto 52.7,50.6 < 5
confirm
step
kill Raigonn##56877 |only if not haveq(31364)
kill Raigonn##56877 |q 31364/1 |only if haveq(31364)
_Phase 1_
|tip Raigonn will be mostly invulnerable until his Weak Spot is killed.
|tip Melee can gain access to his Weak Spot by using the Artillery that are around the room.
|tip While the DPS are attacking the Weak Spot, the Tank should be on the ground floor picking up adds.
|tip Krik'thik Protectorate_ will increase the attack speed of all other Protectorate in the area by 50% when one of them drops below 20% health.
|tip Krik'thik Engulfers should be kill by ranged DPS. They summon Englufing Winds which are tornados that can be a hassle to deal with.
|tip Krik'thik Swarm Bringers will be summoned every so often. They will cast Screeching Swarm. This ability will absorb healing while dealing damage.
|tip After the Weak Spot is destroyed, the fight enters Phase 2.
_Phase 2_
|tip He will take 300% increased damage during this phase.
|tip Stomp will deal damage to everybody near the boss. It will also increase his damage dealt by 25% every time he uses it.
|tip Fixate will cause Raigonn to drop aggro and lock his attention onto a random party member. Their movement speed will be increased by 75% while he is fixating them.
Defeat Raigonn |scenariogoal 1/34408 |goto 44.0,60.6
step
talk Bowmistress Li##64467
turnin Lighting the Way##31363 |goto Gate of the Setting Sun/1 52.0,60.6
turnin That's a Big Bug!##31364 |goto Gate of the Setting Sun/1 52.0,60.6
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Mogu'shan Palace (40-70)",{
mapid=453,
achieveid={6755, 6756},
patch='100207',
condition_suggested=function() return level>=20 and level<=35 end,
author="support@zygorguides.com",
description="This guide will walk you through the Mogu'shan Palace dungeon.",
pandariaremix=true,
},[[
step
Queue for Mogu'shan Palace or Enter the Dungeon with your Group |goto Mogu'shan Palace/1 30.5,20.5 < 100 |c
step
talk Sinan the Dreamer##64432
accept Relics of the Four Kings##31357 |goto Mogu'shan Palace/1 30.3,19.2
accept A New Lesson for the Master##31360 |goto Mogu'shan Palace/1 30.3,19.2
step
map Mogu'shan Palace/1
path follow strict;loop off;ants straight
path	40.2,26.1	40.3,57.6
Clear the trash and follow this path to the boss. |goto 40.3,57.6 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Trial of the King_
The Trial of the King consists of three minibosses. |goto 40.0,70.8
Click here for Kuai the Brute's strategy. |next "kuai" |confirm
Click here for Ming the Cunning's strategy. |next "ming" |confirm
Click here for Haiyan the Unstoppable's strategy. |next "haiyan" |confirm
step
label "kuai"
kill Kuai the Brute##61442
|tip Kuai's pet Mu'Shiba is the main threat of this fight, kill it first. Mu'Shiba will use Ravage, stunning and damage over 10 seconds.
|tip Kuai will cast Shockwave knocking players into the air. They will take some falling damage so make sure everybody is healed up.
Click here for Haiyan the Unstoppable's strategy. |next "haiyan" |confirm
Click here for Ming the Cunning's strategy. |next "ming" |confirm
Defeat the Trial of Kings |scenariogoal 1/24784
step
label "haiyan"
kill Haiyan the Unstoppable##61445
|tip Conflagrate will dissorient and deal fire damage to whomever it is cast on. Make sure the group steps away from that person to avoid the fire from spreading.
|tip Haiyan will cast Meteor on a random player and put a red arrow over their head. Stack on that person to disperse the damage that comes with Meteor.
|tip He will also use Traumatic Blow on the tank, lowering his healing received.
Click here for Kuai the Brute's strategy. |next "kuai" |confirm
Click here for Ming the Cunning's strategy. |next "ming" |confirm
Defeat the Trial of Kings |scenariogoal 1/24784
step
label "ming"
kill Ming the Cunning##61444
|tip Ming summons a Whirling Dervish that will knock any player it hits back.
|tip He will also use Magnetic Field. When he casts this run away from him until it is done, it will pull you back into it so keep running.
Click here for Haiyan the Unstoppable's strategy. |next "haiyan" |confirm
Click here for Kuai the Brute's strategy. |next "kuai" |confirm
Defeat the Trial of Kings |scenariogoal 1/24784
step
Loot the chest and follow these stairs down. |goto 48.8,74.9 < 5
confirm
step
map Mogu'shan Palace/2
path follow strict;loop off;ants straight
path	53.8,18.8	28.6,32.6	30.9,75.7
Follow the path
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Ancient Mogu Chest##214827
collect Lantern of the Sorcerer King##86476 |q 31357/1 |goto 37.4,64.5
|only if haveq(31357)
step
click Ancient Mogu Chest##214827
collect Mad King Meng's Balance##86477 |q 31357/2 |goto 43.0,60.1
|only if haveq(31357)
step
click Ancient Mogu Chest##214827
collect Subetai's Bow of the Swift##86479 |q 31357/4 |goto 60.2,82.6
|only if haveq(31357)
step
click Ancient Mogu Chest##214827
collect Qiang's "The Science of War"##86478 |q 31357/3 |goto 38.7,88.7
|only if haveq(31357)
step
kill Gekkan##61243
|tip Gekkan has 4 adds with him. The Protector will shield all of the other adds so he must die first. The Oracle is the healer so he needs to be interrupted and killed second.
|tip Crowd Control is suggested in this fight but don't count on it. Gekkan will use Reckless Inspiration on a random add. This makes them immune to crowd control and increases their attack speed for a period of time.
Defeat Gekkan |scenariogoal 1/19256 |goto 44.9,75.8
step
Ride the elevator up |goto 71.5,76.1
Go up |goto Mogu'shan Palace/3 |noway |c
step
map Mogu'shan Palace/3
path follow strict;loop off;ants straight
path	45.0,24.3	40.4,36.1	40.3,75.2
Clear the trash and make your way to the final boss. |goto 40.3,75.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Xin the Weaponmaster##61398 |only if not haveq(31360)
kill Xin the Weaponmaster##61398 |q 31360/1 |only if haveq(31360)
|tip Xin wil use Ground Slam on the tank's position. Avoid this.
|tip He will periodically animate a staff. This staff uses Circle of Flame so make sure you are not in the circle when the staff finishes.
|tip Whirlwinding Axes will be summoned almost immediately. Avoid standing in their spin.
|tip Blade Trap will activate at 66% health. This is a linear stream of swords. Avoid them.
|tip At 33% Xin will activate Death from Above!. This will cause crossbows to fire from his walls, this damage is unavoidable.
Defeat Xin the Weaponmaster |scenariogoal 1/34409 |goto 40.3,86.6
step
talk Sinan the Dreamer##64432
turnin Relics of the Four Kings##31357 |goto 38.7,81.5
turnin A New Lesson for the Master##31360 |goto 38.7,81.5
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Mogu'shan Vaults (25-70)",{
mapid=471,
achieveid={6458, 6844},
patch='100207',
condition_suggested=function() return level>=35 and level<=37 end,
author="support@zygorguides.com",
description="This guide will walk you through the Mogu'shan Vaults raid.",
pandariaremix=true,
},[[
step
Click here if you are doing a normal clear of the instance |next "Normal MSV"
Click here if you are doing LFR wings of this instance |next "LFR index"
confirm
step
label "LFR index"
talk Lorewalker Han##80633 |goto Vale of Eternal Blossoms/0 83.13,30.61
Click here if you are queueing for the First wing of Mogu'shan Vaults (Guardians of Mogu'shan) |next "First Wing MSV"
Click here if you are queueing for the Second wing of Mogu'shan Vaults (Vault of Mysteries) |next "Second Wing MSV"
confirm
step
label "Normal MSV"
Enter Mogu'shan Vaults |goto Kun-Lai Summit/0 59.61,39.17 < 5
confirm
step
label "First Wing MSV"
map Mogu'shan Vaults/1
path loop off
path	68.4,64.2	54.8,64.2	50.4,64.3
Follow the path, clearing trash as you make your way to the Stone Guard. |goto 50.4,64.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Stone Guard_ |goto 45.6,64.5
kill Amethyst Guardian##60047
|tip Amethyst Petrification attempts to turn its enemies to amethyst, reducing Shadow damage they take by 90% and progressively slowing their movement speed.
|tip Amethyst Pool deals 60,000 every second to players who enter the area.
kill Cobalt Guardian##60051
|tip Cobalt Petrification attempts to turn its enemies to cobalt, reducing Arcane damage they take by 90% and slowing their movement speed.
|tip Rend Flesh deals 50,000 Physical damage every second for 15 seconds.
kill Jade Guardian##60043
|tip Jade Petrification attempts to turn its enemies to jade, reducing Nature damage they take by 90% and slowing their movement speed.
|tip Jade Shards inflicts 50,000 Nature damage to all players.
|tip Rend Flesh deals 50,000 Physical damage every second for 15 seconds.
kill Jasper Guardian##59915
|tip Jesper Petrification attempts to turn its enemies to jesper, reducing Fire damage they take by 90% and slowing their movement speed.
|tip Jesper Chains links 2 players together. While they are over 10 yards apart they both take 35,000 Fire damage every second, increasing by 15% per second.
|tip Rend Flesh deals 50,000 Physical damage every second for 15 seconds.
|tip Each of the 4 Guardians will periodically summon a crystal, players must click these crystals. |only if heroic_dung()
|tip Once clicked they will get a debuff and to remove it they must run over white tiles around this encounter area. |only if heroic_dung()
|confirm
step
map Mogu'shan Vaults/1
path loop off
path	38.0,64.4	32.8,64.3	32.1,52.1
path	32.1,42.4
Follow the path, clearing trash as you make your way to the first boss, Feng the Accursed. |goto 32.1,42.4 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Feng the Accursed##60009 |goto 32.1,33.2
|tip Arcane Resonance charges random players with Arcane Resonance, which deals 30,000 Arcane damage to all other players within 6 yards, amplfying the damage by 30,000.
|tip Arcane Shock hits the targeted player for 29,000 Arcane damage every 2 seconds for 20 seconds.
|tip Chains of Shadow deals Shadow damage to the target, jumping to up to 3 additional targets.
|tip Flaming Spear sears the flesh of a player, inflicting normal weapon damage plus 30,000 Fire damage every 2 seconds for 20 seconds.
|tip Lightning Fists slams a lightning fist into the ground, causing a shockwave that deals damage to players in front of Feng.
|tip Wildfire Spark ignites a random player, causing them to explode after 5 seconds and igniting a wildfire at their location.
|tip There is one extra phase in heroic difficulty, the Spirit of the Shield. |only if heroic_dung()
|tip He will create shadows from random players that will move toward him, if they reach him he will be healed for 10 percent of his max health per. |only if heroic_dung()
|confirm
step
map Mogu'shan Vaults/1
path loop off
path	32.2,23.2	32.2,13.2	Mogu'shan Vaults/2 77.6,67.1
path	Mogu'shan Vaults/2 77.7,47.3
Follow the path, clearing trash as you make your way to the second boss, Gara'jal the Spiritbinder. |goto Mogu'shan Vaults/2 77.7,47.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Gara'jal the Spiritbinder##60143 |goto 77.0,35.9
|tip Banishment banishes the target to the spirit world.
|tip Final Destination Gara'jal harnesses his great power and rips the souls from all raid members.
|tip Summon Spirit Totem summons a totem that provides a conduit between this world and the spirit world.
|tip Voodoo Doll damage received is duplicated to all other Voodoo Dolls.
|tip If you are doing this on LFR this is the end of wing 1.
|confirm
step
label "Second Wing MSV"
map Mogu'shan Vaults/2
path loop off
path	45.3,34.5	33.8,29.9	33.9,43.0
Follow the path as you make your way towards the next boss. |goto 33.9,43.0 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map Mogu'shan Vaults/2
path loop off
path 31.7,69.3	24.2,66.5
Follow this path, clearing trash to the next boss, the Spirit Kings. |goto 24.2,66.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_The Spirit Kings_ |goto 18.3,52.0
kill Qiang the Merciless##60709
|tip Annihilate inflicts a total of 1,500,000 damage to players in front of Qiang within melee range.
|tip Flanking Orders calls in a wave of Mogu adds.
|tip Massive Attacks deals a total of 800,000 damage split among all players hit.
|tip Impervious Shield makes Qiang with a shield, making him immune to damage. If damaged while this shield is up, he retaliates, dealing damage to the raid.
kill Subetai the Swift##60710
|tip Pillage affects a random player and all other players within 8 yards of them, reducing damage, healing done and armor by 50%.
|tip Sleight of Hand  damaging Subetai while this is up causes Robbed Blind. Subetai can be stunned during this.
|tip Robbed Blind debuff that reduces the target's damage and healing done by 50% and increasing their Physical damage taken by 50%.
|tip Volley inflicts 92,000-103,000 Physical damage to players in a cone in front of Subetai.
kill Meng the Demented##60708
|tip Cowardice increases Meng's insanity level every 0.5 seconds. Once fully insane he switches personalities. Also reflects a portion of damage back at attacking players.
|tip Crazed increases Meng's insanity level every 0.5 seconds. Once fully insane he switches personalities. Also reflects a portion of damage back at attacking players.
|tip Delirious doubles Meng's sanity gains.
|tip Maddening Shout AoE that deals 63,000-66,000 Shadow damage every 3 seconds and causing players to hate each other. Players regain their sanity after taking 30,000 damage from another raid member.
kill Zian of the Endless Shadow##6070
|tip Charged Shadows inflicts 97,500-102,500 Shadow damage to enemies standing within 8 yards of each other.
|tip Shadow Blast deals 100,000 Shadow damage to enemies within 8 yards of the targeted player.
|tip Undying Shadows creates an Undying Shadow at the targeted area, dealing 30,000 Shadow damage every second to players within 10 yards.
|tip Shield of Darkness is only used in Heroic mode. Any damage dealt to Zian will deal 300,000 Shadow damage to the raid.
|confirm
step
map Mogu'shan Vaults/2
path loop off
path	24.7,69.6	33.3,69.7	27.1,51.6
path	Mogu'shan Vaults/3 61.0,12.4	Mogu'shan Vaults/3 62.0,21.7	Mogu'shan Vaults/3 68.7,26.8
path	Mogu'shan Vaults/3 66.0,41.4	Mogu'shan Vaults/3 57.7,41.4	Mogu'shan Vaults/3 49.2,43.6
path	Mogu'shan Vaults/3 44.5,51.3	Mogu'shan Vaults/3 30.0,51.3
Follow the path, clearing trash as you make your way to the next boss, Elegon. |goto Mogu'shan Vaults/3 30.0,51.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Elegon##60410 |goto Mogu'shan Vaults/3 22.7,51.7
|tip Catastrophic Anomaly causes the Engine of Nalak'sha to explode and deal 90,200-100,000 Arcane damage to the raid.
|tip Celestial Breath applies a DoT to players in a cone in front of Elegon that deals Arcane damage.
|tip Draw Power Elegon creates 6 Energy Cores and increasing his damage taken by 10%.
|tip Radiating Energies applies an Arcane DoT to the entire raid.
|tip Unstable Energy occurs if the Empyreal Fosuses are active. Elegon becomes immune to damage and deals 175,000 damage to the raid.
|confirm
step
map Mogu'shan Vaults/3
path loop off
path	45.4,51.5	65.3,41.4	68.7,56.2
Follow the path towards the final boss, the Will of the Emperor. |goto 68.7,56.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Take these stairs down to the lower platform. |goto Mogu'shan Vaults/3 72.0,66.8 <5 |c
step
_Will of the Emperor_ |goto 68.6,82.2
To activate Hard Mode destroy the pipes located on the sides of the boss room. |goto 61.1,72.4
The other pipes can be located here |goto 76.0,72.7
To activate Normal mode click Broken Control Console |goto 68.7,67.0
|tip Adds continuously spawn during this fight. They should be killed off while damaging the bosses.
|tip All adds in heroic difficulty, when killed, will spawn a Spark, this will fixate a random player and if they hit they will deal a large amoutn of damage to the entire raid. |only if heroic_dung()
|tip Emeperor's Rage will target a random player and fixate onto them, run away from these if you are fixated.
|tip Emeperor's Courage will target a random player and fixate onto them, these adds will have a shield in front of them preventing all damage, dps must go behind these adds to kill them.
|tip Emeperor's Strength will, once in melee range of a player, cast Energizing Smash stunning anyone in a big circle in front of him, this needs to be avoided.
kill Qin-xi##60399
|tip Stomp inflicts 150,000 Physical damage and stuns nearby enemies for 2 seconds.
kill Jan-xi##60400
|tip Stomp inflicts 150,000 Physical damage and stuns nearby enemies for 2 seconds.
|tip If you are doing this on LFR this is the end of wing 2.
|confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Heart of Fear (35-70)",{
mapid=474,
achieveid={6845, 6718},
patch='100207',
condition_suggested=function() return level>=35 and level<=37 end,
author="support@zygorguides.com",
description="This guide will walk you through the Heart of Fear raid.",
pandariaremix=true,
},[[
step
Click here if you are doing a normal clear of Heart of Fear |next "Normal HoF"
Click here if you are doing LFR wings of Heart of Fear |next "LFR Index"
confirm
step
label "LFR Index"
talk Lorewalker Han##80633
Click here if you are queueing for the First wing of Heart of Fear (Dread Approach to the Heart of Fear) |next "First_Wing_HoF"
Click here if you are queueing for the Second wing of Heart of Fear (Nightmare of Shek'zeer) |next "Second_Wing_HoF"
confirm
step
label "Normal HoF"
Enter Heart of Fear |goto Dread Wastes/0 38.95,34.99 < 5
confirm
step
label "First_Wing_HoF"
map Heart of Fear/1
path loop off
path	34.3,76.4	41.3,61.5	50.6,61.4
path	54.6,54.0	61.4,62.5
Follow the path, clearing trash as you make your way to the first boss, Imperial Vizier Zor'lok. |goto 61.4,62.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Imperial Vizier Zor'lok##62980 |goto 62.8,66.3
_Phase 1_
|tip After engaged, Zor'lok will fly to a randomly chosen platform. He will move to another platform at 80% and 60% health. Each platform gives him a different buff.
|tip Left Platform: Attenuation creates moving circles, sonic rings. These deal a moderate amount of damage and can be avoided.
|tip Middle Platform: Convert Zor'lok mind controls random players. These players must be brought down to 50% health.
|tip Right Platform: Force and Verve creates 3 shields which can protect raid members by reducing their damage taken by 40%. Zor'lok then releases a violent burst of sound, damaging the entire raid every second for 10 seconds.
|tip Inhale increases the damage of Exhale by 50%.
|tip Exhale deals a large amount of damage to a random player, also stunning them for 6 seconds.
_Phase 2_
|tip Phase 2 starts when Zor'lok reaches 40% health. He flies to the center of the room and uses all the abilities from Phase 1.
|tip He also gains _Pheromoes of Zeal, increasing his damage by 10% and haste by 20. Kill him as quickly as possible to avoid death.
_Heroic_
|tip When Vizier leaves a platform he will leave an echo of himself, a small group needs to be left behind to kill this echo.
|tip He will continue leaving echos during his last phase as well, these need to be killed asap as they come up.
|confirm
step
map Heart of Fear/1
path loop off
path	57.8,58.2	55.4,52.4	59.9,43.8
path	68.0,34.6	51.9,35.9	59.8,28.8
Follow the path, clearing trash as you make your way to the next boss, Blade Lord Ta'yak. |goto 59.8,28.8 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Blade Lord Ta'yak##62543 |goto 59.8,22.3
_Phase 1_
|tip Phase 1 ends when Ta'yak reaches 20% health.
|tip Tempest Slash creates a tornado that moves around, dealing 75,000 Nature damage and a knockback if touched.
|tip Overwhelming Assault stacking debuff used on tanks, dealing 150% weapon damage and increasing further damage from Overwhelming Assault by 100%.
|tip Wind Step Ta'yak teleports to a random player, applying a DoT to all players within 10 yards that deals 55,000 damage every 2 seconds for 30 seconds.
|tip Unseen Strike occurs after Ta'yak vanishes. After 5 seconds it deals 3,000,000 total Physical damage and a knockback to the target and players in a 15 yard cone in front of him. This damage is split between all players affected.
_Phase 2_
|tip Ta'yak pushes the raid to one end of the room and then flies to the other end and starts spamming the raid with a strong wind and tornados that knock them back to the opposite end of the room. The goal is to get back to Ta'yak by avoiding the tornadoes and then finish him off.
|tip Intensify is a stacking buff that deals 15,000 damage to the raid and increases his damage and haste by 5% per stack.
|tip At 10% health, Ta'yak changes sides, going to the opposite end of the room and coninues creating wind and tornadoes.
|confirm
step
map Heart of Fear/1
path loop off
path	44.9,32.7	35.6,32.7	32.2,15.2
path	Heart of Fear/2 66.2,20.2
Follow the path, clearing trash as you make your way to the final boss, Garalon. |goto Heart of Fear/2 66.2,20.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Garalon##63191 |goto Heart of Fear/2 66.3,16.7
|tip Killing Garalon's legs takes priority, as killing them slows Garalon by 15% and reduces his health by 3%. Mend Leg causes a random leg to respawn.
|tip Furious Swipe deals damage to all players in a cone in front of Garalon. If he doesn't hit at least 2 players, he will gain Fury, a stacking buff that increases his damage and movement speed by 10% for 30 seconds.
|tip Pheromones is a debuff that deals 15,000 Nature damage every 2 seconds to the raid and creates a Pheromone Trail that increases Pheromones damage by 10% per stack.
|tip Crush deals 150,000 damage to the raid and knocks them down for 2 seconds. Any player underneath Garalon when this occurs takes an additional 800,000 damage.
|tip Enrage occurs after 7 minutes of combat. It will greatly increase his attack speed and damage. This is designed to wipe the raid. Kill him before he reaches this stage to avoid death.
_Heroic_
|tip When Garalon reaches 33 percent health he ignores the fixate of Pheramones and increases melee attack speed.
|tip If you are doing this on LFR this is the end of wing 1.
|confirm
step
label "Second_Wing_HoF"
map Heart of Fear/2
path loop off
path	68.3,26.3	69.2,37.8	66.8,38.0
Follow the path to the next boss, Wind Lord Mel'jarak. |goto 66.8,38.0 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Wind Lord Mel'jarak##62397 |goto 66.4,31.8
|tip Rain of Blades deals raid-wide Physical damage every 0.5 second.
|tip Whirling Blade deals 120,000 Physical damage to all players in its path. Upon reaching its target, it returns to Mel'jarak, inflicting another 120,000 damage to anyone in its return path.
|tip Wind Bomb throws a bomb at a player, dealing 100,000 Nature damage to players within 5 yards of where it lands. After 3 seconds, it arms and will detonate if any player comes within 6 yards, usually wiping the raid.
_Adds_
|tip 3 different types of adds spawn throughout this fight.
|tip Priests: heal and buff their damage.
|tip Warriors: charge their target.
|tip Hunters: apply debuffs to the raid.
_Heroic_
|tip When a group of adds dies Wind Lord becomes enraged increases his damage by 50 percent and increses his damage taken by 600 percent.
|tip When a group of adds dies they will come back after 45 seconds.
|confirm
step
map Heart of Fear/2
path loop off
path	66.2,40.3	66.2,47.1	66.0,52.5
path	66.2,64.6	60.2,73.8	55.1,73.7
path	50.7,74.0	47.6,78.9	47.4,68.5
Follow the path, clearing trash as you make your way to the next boss,  Amber-Shaper Un'sok. |goto 47.4,68.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Amber-Shaper Un'sok##62511 |goto 45.5,73.8
|tip Amber Scalpel targets a random player with a beam that deals large damage and leaves a trail of amber that forms Living Amber adds.
|tip Parasitic Growth is a DoT that deals increasing damage as the affected player is healed.
|tip Reshape Life turns the targeted player into a Mutated Construct.
_Mutated Construct_
|tip Amber Strike does a large amount of damage to the target and increases their damage taken by 10% for 15 seconds as well as interrupting them.
|tip Struggle for Control a small self-stun used to prevent Amber Explosion from being cast. Costs willpower.
|tip Consume Amber heals yourself for 2,000,000, increases your maximum health and restores 20 willpower.
|tip Break Free frees you from the Construct. Can only be used while under 20% health.
_Heroic_
|tip Amber Globules will spawn in the last phase of this fight, these will fixate 2 random players.
|tip If these Globules hit the player they are fixated they will explode dealing damage to the entire raid.
|tip If 2 Amber Globules collide they will deal no damage and disappear.
|confirm
step
map Heart of Fear/2
path loop off
path	42.1,73.8	34.8,77.8	30.9,75.2
Follow the path, clearing trash as you make your way to the final boss, Grand Empress Shek'zeer. |goto 30.9,75.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Grand Empress Shek'zeer##62837 |goto 28.9,73.9
|tip Dissonance Field creates 2 vortexes which explode after 60 seconds, dealing 200,000 damage to the entire raid. Players standing in a vortex cannot receive healing and casting spells inside it reduces the explosion timer.
|tip Cry of Terror is a debuff applied to a random player, dealing 45,000 Shadow damage to the rest of the raid every 2 seconds. Standing in the vortex negates this damage.
|tip Visions of Demise is a debuff that affects 2 random players. After 4 seconds they are Feared and will deal damage to everyone around them.
|tip Consuming Terror inflicts 200,000 Shadow damage and Fears players in a cone in front of Shek'zeer.
|tip After 150 seconds the boss will disappear and summon a group of adds. These are usually tanked apart so they don't increase each others' damage.
|tip If you are doing this on LFR this is the end of wing 2.
|confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Terrace of Endless Spring (40-70)",{
mapid=456,
achieveid={6689},
patch='100207',
condition_suggested=function() return level>=35 and level<=37 end,
author="support@zygorguides.com",
description="This guide will walk you through the Terrace of Endless Spring raid.",
pandariaremix=true,
},[[
step
Click here if you are doing a normal clear of Terrace of Endless Spring |next "Normal ToES"
Click here if you are doing LFR wing of Terrace of Endless Spring |next "LFR Index ToES"
confirm
step
label "LFR Index ToES"
talk Lorewalker Han##80633
Queue for Terrace of Endless Spring
Once inside click here to continue |next "ToES begin"
confirm
step
label "Normal ToES"
Enter Terrace of Endless Spring |goto The Veiled Stair/0 48.46,61.43 < 5
confirm
step
label "ToES begin"
map Terrace of Endless Spring
path loop off
path	80.5,38.4	76.1,59.9
Follow the path, clearing trash around the first boss, the Protectors of the Endless. |goto 76.1,59.9 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Protectors of the Endless_ |goto 78.5,48.9
kill Elder Regail##60585
|tip Lightning Bolt inflicts 125,000-145,000 Nature damage to the targeted player.
|tip Lightning Prison stuns 2 players and deals 28,000 Nature damage to all players within 7 yards.
|tip Lightning Storm is an AoE, starting from Regail's location and pulsing outward in 3 pulses, dealing high Nature damage.
kill Elder Asani##60586
|tip Water Bolt deals 100,000 Nature damage to the target and all additional players within 3 yards of that target.
|tip Cleansing Waters is a buff that heals Asani's allies and can be dispelled.
|tip Corrupted Waters spawns an orb in the center of the room, increasing the Protectors' attack and casting speeds by 50%. When destroyed it increases players' attack and casting speed by 25% for 20 seconds when standing in the inner circle.
kill Protector Kaolan##60583
|tip Touch of Sha occurs if you kill Kaolan last. It deals 38,000 Shadow damage every 3 seconds to a targeted player for the entire fight.
|tip Defiled Ground are summoned under the tank, dealing 110,000 Shadow damage every second and does not despawn.
|tip Expel Corruption is an AoE that deals up to 195,000 Shadow damage to all players within 30 yards. Damage is decreased the further away a player is from Kaolan when this occurs.
|confirm
step
kill Tsulong##62442 |goto 78.5,48.9
_Night Phases_
|tip Damage Tsulong as much as possible in these phases.
|tip Shadow Breath _frontal cone_ ability, dealing 240,000 Shadow damage and increasing Shadow damage taken by 100% for 30 seconds.
|tip Dread Shadows is a stacking DoT that deals 30,000 Shadow damage and increases damage from Dread Shadows by 10% per stack. This is removed by running through a Sunbeam Tsulong creates.
|tip Nightmares inflicts 110,000 Shadow damage and Fears all players within 8 yards in the targeted area.
_Day Phases_
|tip Heal Tsulong as much as possible in these phases. He is friendly, and helps kill the Sha that spawn by using Sun Breath. This is a cone that also restores 25% maximum mana to every player in front of him.
|tip During these phases, Tsulong is not attackable and summons waves of Sha to attack the raid.
|tip Embodied Terror: Sha with large amounts of health. Terrorize deals high damage and should be dispelled.
|tip Fright Spawn: spawn when an Embodied Terror is killed. Fright deals high damage and a Fear to players within 30 yards.
|tip Unstable Sha: spawn in the outer areas of the room and move toward Tsulong. If they reach Tsulong they explode.
|confirm
step
kill Lei Shi##62983 |goto 58.6,48.6
|tip Hide Lei Shi vanishes, hiding from players. AoE attacks can hit her to make her reveal herself.
|tip Get Away is an AoE that pushes the raid back, away from Lei Shi and deals 90,000 Shadow damage. Running towards Lei Shi halves the damage it deals every second.
|tip Protect Lei Shi shields herself, becoming immune to damage and summoning elementals to attack the raid. Ends after 1 elemental is killed.
|tip Spray water bursts from the ground at the targeted player's location, dealing 110,000 Frost damage to all players within 2.5 yards and increasing their Frost damage taken by 16% for 10 seconds.
|confirm
step
kill Sha of Fear##60999 |goto 39.2,48.6
|tip Breath of Fear occurs about every 30 seconds. when Sha of Fear gains a full energy bar. It deals 500,000 Shadow damage and a Fear to all players. Those standing in the glowing light spot in the middle of the room will be unaffected by this.
|tip Terror Spawn group of 2 adds that spawn. They can only be damaged from behind.
|tip Eerie Skull deals 74,000-90,000 Shadow damage to a random raid member.
|tip Ominous Cackle occurs every 90 seconds. It takes 5 random players to an outer shrine where they must kill the corrupted guardian, granting Fearless.
|tip Fearless is a buff applied to players killing the corrupted guardian in one of the outer shrines. It increases damage and healing done by 60%, makes you immune to Breath of Fear, and greatly increases movement speed.
_Heroic_
|tip Once Sha of Fear reaches 66 percent health he will go into his final heroic phase.
|tip During this phase an ability called Pure Light will come into play, this will immobilize the player targeted, to avoid harmful abilities you must transfer this Orb to another safe positioned player.
|tip He will cast Submerge, going underground and then emerging under a random raid member, avoid being hit by this.
|tip He will cast Implaceable Strike dealing damage to all players within a cone in front of him periodically, avoid being hit by this.
|tip He will summon adds called Dread Spawns, these will fixate and run toward the players with the Pure Light, these adds need to be killed before reaching said players.
|tip If the Dread Spawns reach melee range on their fixated target they will die instantly no matter what, players with the orb can transfer it to another player to refixate the adds on to them.
|confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Throne of Thunder (50-70)",{
mapid=508,
achieveid={8070, 8071, 8072},
patch='100207',
condition_suggested=function() return level>=35 and level<=37 end,
author="support@zygorguides.com",
description="This guide will walk you through the Throne of Thunder Raid.",
pandariaremix=true,
},[[
step
Click here if you are doing a normal clear of the instance |next "Normal ToT"
Click here if you are doing LFR wings of this instance |next "LFR ToT Index"
confirm
step
label "LFR ToT Index"
talk Lorewalker Han##80633
Click here if you are queueing for the First wing of Throne of Thunder (Last Stand of the Zandalari) |next "First_Wing_ToT"
Click here if you are queueing for the Second wing of Throne of Thunder (Forgotten Depths beneath the Throne of Thunder) |next "Second_Wing_ToT"
Click here if you are queueing for the Third wing of Throne of Thunder (Twisted Mogu Halls of Flesh-Shaping) |next "Third_Wing_ToT"
Click here if you are queueing for the Fourth wing of Throne of Thunder (Lei Shen's Pinnacle of Storms) |next "Fourth_Wing_ToT"
confirm
step
label "Normal ToT"
Enter Throne of Thunder |goto Isle of Thunder/0 63.61,32.44 < 5
confirm
step
label "First_Wing_ToT"
map Throne of Thunder/1
path loop off
path	34.9,23.7	39.8,23.8	46.2,25.8
path	53.4,25.8
Follow the path, clearing trash as you make your way to the first boss, Jin'rokh the Breaker. |goto 53.4,25.8 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Jin'rokh the Breaker##69465 |goto 59.5,25.8
|tip Thundering Throw is usually used on the tank, throwing them at a Mogu statue, inflicting 250,000 Physical damage and dealing 200,000 Nature damage and a 5 second stun to players within an 8 yard area.
|tip Conductive Water is a pool formed at the base of broken statues. Standing in the water increases healing by 60% and damage by 40%, but also increases damage taken from Jin'rokh's abilities by 50%.
|tip Lightning Storm deals 70,000 damage to the raid every second for 15 seconds. Also turns Conductive Water to Electrified Water, quickly killing anyone still standing in it.
|tip Static Burst deals 95,000-105,000 Nature damage to the raid. After 3 seconds it applies 10 stacks of Static Wounds to his current target.
|tip Static Wound is a debuff that deals 20,000 Nature damage per stack to the affected player each time he takes melee damage. Also deals a third of this damage to nearby players.
|tip Focused Lightning occurs on a healer or ranged DPS. Lightning moves towards the targeted player and deals 175,000 Nature damage upon reaching them, also damaging all other players within 8 yards of the initial explosion.
|confirm
step
map Throne of Thunder/1
path loop off
path	59.5,25.8	59.5,43.6	59.5,53.5
path	59.6,74.9	62.1,79.8	76.0,79.6
path	83.1,79.6
Follow the path, clearing trash as you make your way to the next boss, Horridon. |goto 83.1,79.6 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Waves of adds are spawned throughout this fight. It is recommended the raid kills them and then goes back to attacking Horridon.
When a Dinomancer dies it drops an Orb of Control. Clicking this will destroy the gate and stop the adds spawning for a short time.
kill Horridon##68476 |goto 26.8,78.7
|tip Triple Puncture deals 370,000-430,000 damage to the target and increases their damage taken from Triple Puncture by 10% per stack. Lasts 90 seconds.
|tip Double Swipe is a _frontal and rear cone_ attack. Avoid this by standing at Horridon's sides.
|tip Charge is used on random players. Horridon charges at the target, immediately follwed by _Double Swipe_.
|tip When Horridon is at 30% health he spawns War-God Jalak. Kill them both as fast as possible to avoid death.
_Heroic_
|tip In Heroic difficulty Horridon will spawn small Pink adds that will fixate on a random raid member, only the member that is fixated can see the add.
|tip If this add hits the fixated target it will deal a damage, to prevent damage the player must run away from the fixate or periodically hit it with any ability, this will knock the add back a little bit.
|confirm
step
map Throne of Thunder/2
path loop off
path	27.2,68.4	27.1,47.4	27.2,35.4
path	27.2,26.0	33.5,19.4	38.0,19.4
path	45.1,14.1
Follow the path, clearing trash as you make your way to the final boss, the Council of Elders. |goto 45.1,14.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Council of Elders_ |goto 50.1,18.4
kill Kazra'jin##69134
|tip Discharge Kazra'jin stuns himself for 20 seconds, reflecting 5% damage back to attackers.
|tip Overload Kazra'jin stuns himself for 20 seconds, reflecting 40% damage back to atteckers.
|tip Reckless Charge deals 90,000 Nature damage to the target and all players inbetween and knocking back all players within 5 yards of where he lands.
kill Sul the Sandcrawler##69078
|tip Quicksand spawns a pool of quicksand under the targeted player's feet, rooting them in place and dealing Nature damage every second.
|tip Sand Bolt inflicts 150,000-175,000 Nature damage to the target and all players within 5 yards of that target.
|tip Sandstorm summons a sandstorm that deals 38,500 damage every second for 8 seconds.
kill Frost King Malakk##69131
|tip Biting Cold blasts the target with ice, inflicting 95,000 Frost damage.
|tip Frostbite deals 110,000 Frost damage and applies 5 stacks of Frostbite.
|tip Frigid Assault imbues Malakk's axes with ice, dealing an additional 75,000 damage to his target and stunning them if it reaches 15 stacks.
kill High Priestess Mar'li##69132
|tip Blessed Loa Spirit summons a Blessed Loa Spirit add that moves towards the council member with the lowest health. If reached, they are healed for 5% of their maximum health.
|tip Shadowed Loa Spirit summons a Shadowed Loa Spirit that follows a random player. If it gets within 6 yards of them it instantly kills them.
|tip Wrath of the Loa hits the targeted player for 150,000-160,000 damage.
|tip Twisted Fate links 2 players' souls together, dealing 250,000 Shadow damage every 3 seconds. The damage dealt is reduces the further apart the players are.
|tip If you are doing this on LFR this is the end of wing 1.
|confirm
step
label "Second_Wing_ToT"
map Throne of Thunder/3
path loop off
path	20.3,82.0	24.6,82.5
Follow the path, clearing trash as you make your way to the first boss, Tortos. |goto 24.6,82.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Tortos##67977 |goto 31.5,82.0
|tip Call of Tortos summons smaller turtle adds to attack the raid. They spin around, dealing damage and a knockback to those near them.
|tip Furious Stone Breath deals 150,000 Nature damage to the raid every 0.5 seconds for 4.5 seconds. Can be interrupted by kicking shells from dead turtle adds.
|tip Quake Stomp  Tortos stuns the raid for 1 second, inflicting damage equal to 65% of their maximum health. This also increases the requency of Rockfalls for 8 seconds.
|tip Snapping Bite Tortos snaps his jaws closed, dealing 510,000-540,000 damage.
_Heroic_
|tip Humming Crystals will spawn around the room, damaging these will apply a damage absorb you must have this absorb before Quack Stomp comes out.
|tip Quack Stomp does 100 percent damage to all players in the raid without the damage absorb from the Humming Crystals you will die unless you have a cooldown of your own that can stop Physical damage.
|confirm
step
map Throne of Thunder/3
path loop off
path	32.8,80.9	33.1,72.3	33.7,62.5
path	41.7,58.7	38.3,48.6	31.8,45.2
path	43.3,16.9	52.5,40.0	58.9,50.5
path	55.2,71.0	63.4,57.5	69.6,48.8
path	70.2,37.7
Follow the path, clearing trash as you make your way to the next boss, Magaera. |goto 70.2,37.7 < 5
|tip You must click the 3 gongs along this path to summon Magaera.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Magaera_ |goto 72.1,25.3
The only way to damage Magaera is to kill the Flaming, Frozen, and Venemous Heads that spawn.
kill Flaming Head##70212
|tip Cinders_targets a player, dealing 105,000 Fire damage and an additional 75,00 Fire damage every second for 30 seconds. If removed, a pool of flames is created, dealing 105,000 Fire damage every second to all players within 5 yards.
|tip Ignite Flesh frontal cone attack that deals 125,000 Fire damage every second for 3 seconds. Also applies a DoT that burns for 30,00 Fire damage every second for 45 seconds.
|tip Magaera's Rage occurs if no player is within melee range. It deals 250,000 Fire damage to all players within 5 yards of the targeted area.
kill Frozen Head##70235
|tip Arctic Freeze__frontal cone_ that deals 125,000 Frost damage every seconds for 3 seconds. Players hit by this also get a debuff that stuns them for 20 seconds if it reaches 5 stacks.
|tip Megaera's Rage occurs if no player is within melee range. It deals 250,000 Frost damage to all players within 5 yards of the targeted area.
|tip Torrent of Ice channels a beam of ice at a player, inflicting 60,000 Frost damage every 0.5 seconds for 8 seconds and slowing movement speed of anyone who touches it.
kill Venemous Head##70247
|tip Rot Armor frontal cone that deals 127,500 Nature damage every second for 3 seconds and increases the damage taken of those affected by 10% for 45 seconds.
|tip Megaera's Rage occurs if no player is within melee range. It deals 250,000 Nature damage to all players within 5 yards of the targeted area.
_Heroic_
|tip There will be one extra head that will spawn in heroic difficulty, the Arcane Head.
|tip It will summon adds that will stun players, this stun is a channel and can be interrupted.
|tip Diffusion is applied to players that get hit by its breathe attack, this will redirect healing to other players without this debuff.
|confirm
step
map Throne of Thunder/3
path loop off
path	66.8,39.2	66.4,43.4	72.7,53.1
path	Throne of Thunder/4 22.0,35.3	Throne of Thunder/4 15.6,55.5	Throne of Thunder/4 23.5,64.4
path	Throne of Thunder/4 31.6,65.8	Throne of Thunder/4 40.4,74.6	Throne of Thunder/4 42.8,76.6
path	Throne of Thunder/4 43.4,84.5	Throne of Thunder/4 54.3,90.0	Throne of Thunder/4 65.9,86.1
path	Throne of Thunder/4 72.0,81.5	Throne of Thunder/4 74.9,67.3	Throne of Thunder/4 62.7,57.5
path	Throne of Thunder/4 53.8,52.0
Follow the path, clearing trash as you make your way to the final boss, Ji-Kun. |goto 53.8,52.0 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Ji-Kun##69712 |goto 49.7,41.6
|tip Caw Ji-Kun releases concentrated sound waves at multiple players. When they reach their targets they explode and deal 270,000-330,000 damage to all players within 8 yards.
|tip Feed Young summons pools of food for the young, dealing damage to players standing in it.
|tip Down Draft summons a powerful draft of air that pushes players off the platform.
|tip Infected Talons DoT that inflicts 30,000 Nature damage every 3 seconds.
|tip Quils deals 65,000 damage every second to all players.
|tip If you are doing this on LFR this is the end of wing 2.
|confirm
step
Click the Feather of Ji-kun |goto Throne of Thunder/4 43.2,46.5
|tip You will get an extra action ability use this to fly up to the top of the balcony.
Reach the Balcony |goto Throne of Thunder/4 34.5,55.1
confirm
step
label "Third_Wing_ToT"
map Throne of Thunder/5
path loop off
path	77.0,10.6	71.1,12.9	71.2,15.8
path	73.9,20.4	71.4,30.8
Follow the path, clearing trash as you make your way to the first boss, Durumu the Forgotten. |goto 71.4,30.8 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Durumu the Forgotten##68036 |goto 71.1,34.4
|tip Disentigration Beam fires of beam of energy towards the edge of the platform, killing any player it touches.
|tip Arterial Cut applies a bleed DoT to the target.
|tip Gaze deals 50% weapon damage to the entire raid.
|tip Hard Stare deals 135%-165% weapon damage and applies Serious Wound to the target.
|tip Serious Wound debuff that reduces the target's healing received by 10%.
_Heroic_
|tip Wall of Ice will spawn through out the fight making 3 lines of ice blocking players off, these can be attacked and destroyed do so asap.
|tip There will be one extra eye "Evil Eye" these will put a debuff on random players dealing more and more damage to the player until dispelled.
|tip Once dispelled a new debuff will appear summoning Wandering Eyes that will attack random players in the raid.
|confirm
step
map Throne of Thunder/5
path loop off
path	71.1,43.2	70.9,51.2	72.1,61.4
path	71.0,71.5	74.0,77.9	63.6,78.0
path	57.2,78.1
Follow the path, clearing trash as you make your way to the next boss, Primordius. |goto 57.2,78.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Primordius##69017 |goto 57.2,78.2
|tip Primordial Strike is a frontal cone. The tank should be the only one in front of Primordius when this occurs.
|tip Malformed Blood is a stacking debuff usually applied to the tank. It deals 20,000 damage per stack every tick.
|tip Each time Primordius' energy reaches 100% he gains a stacking buff that increases damage done by 10% per stack and giving additional abilities.
|tip Erupting Pustules deals 120,000 Nature damage to players within 2.5 yards of the targeted area.
|tip Metabolic Boost increases Primordius' attack speed by 50% and decreases his cooldowns by 50%.
|tip Volatile Pathogen deals 60,000 damage every second for 10 seconds.
|tip Acidic Spines deals 100,000 Nature damage to all players within 5 yards of the Primordius' target.
|tip Caustic Gas is a cone that deals 800,000 total Nature damage split between all players affected.
|tip Ventral Sacs deals 22,000 damage every second to the entire raid.
_Heroic_
|tip Vicious Horrors will spawn, if they attack a player they will deal damage every 3 seconds.
|tip If they get near the boss they will explode dealing damage to the entire raid, try to stop this from happening.
|confirm
step
map Throne of Thunder/5
path loop off
path	50.9,78.0	39.9,78.1	42.8,72.2
path	42.5,61.1
Follow the path, clearing trash as you make your way to the final boss, Dark Animus. |goto 42.5,61.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Adds spawn throughout the fight.
|tip Anima Golem: weak mobs, don't require anything special.
|tip Large Anima Golem: needs to be tanked.
|tip Massive Anima Golem should be tanked, has a large _frontal cleave_.
kill Dark Animus##69427 |goto 43.0,57.1
|tip Touch of the Animus affects a random player, inflicting 30,000 Fire damage every 4 seconds for the rest of the fight.
|tip Anima Font affects a player with Touch of the Animus, causing them to shoot Anima bolts from nearby locations that deal 250,000 Fire damage.
|tip Anima Ring summons spheres in a circle around the taget, moving inward. Players that touch the spheres consume it, increasing melee damage taken by 200% per stack.
|tip Interrupting Jolt deals 400,000 Nature damage and inerrupts the raid's spellcasting.
|tip If you are doing this on LFR this is the end of wing 3.
|confirm
step
label "Fourth_Wing_ToT"
map Throne of Thunder/5
path loop off
path	35.1,43.1	33.3,38.9	33.5,32.5
path	43.7,31.9	46.8,27.5	46.9,18.7
path	Throne of Thunder/6 25.5,64.5
Follow the path, clearing trash as you make your way to the first boss, Iron Qon. |goto Throne of Thunder/6 25.5,64.5 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Iron Qon##68078 |goto Throne of Thunder/6 34.6,58.9
|tip Impale is a stacking debuff that deals normal weapon damage plus 40,000 bleeding damage every 2 seconds.
|tip Rising Anger increases Qon's damage and attack speed by 10%.
|tip Qon throws out lines of ice, fire, and lightning during the fight, avoid standing in these as well as tornadoes and goo.
_Heroic_
|tip Each Iron Qon Quilen flee at 25 percent. Once each of the 3 have fleed they will all come back at the same time.
|confirm
step
map Throne of Thunder/6
path loop off
path	40.1,59.0	62.2,58.9	69.1,51.3
path	73.8,44.3
Follow the path, clearing trash as you make your way to the next boss, the Twin Consorts. |goto 73.8,44.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
_Twin Consorts_ |goto Throne of Thunder/6 78.7,38.0
kill Lu'lin <Mistress of Solitude>##68905
|tip Beast of Nightmares summons a Beast of Nightmares add that can only be damaged by Lu'lin's target.
|tip Bloom Moon Lotus summons a Moon Lotus flower, which puts nearby players to sleep for 5 seconds.
|tip Cosmic Barrage deals 175,000 damage every 0.5 seconds for 2 seconds.
kill Suen <Mistress of Anger>##68904
|tip Fan of Flames deals a large amount of damage to the target, also increasing Fire damage they take by 25%.
|tip Blazing Radiance deals 35,000 Fire damage to the raid and increasing their Fire damage taken by 5%.
|tip Flames of Passion Suen leaps at a player, dealing 46,000-54,000 Fire damage and knocking all nearby players back.
|tip Nuclear Inferno deals 100,000 Fire damage every second for 4 seconds. While channeling, her spell deflection and dodge chance are both 100%.
|confirm
step
map Throne of Thunder/6
path loop off
path	84.9,48.2	87.0,57.0	85.0,65.7
path	87.4,74.1
Follow the path, clearing trash as you make your way to the final boss, Lei Shen. |goto 87.4,74.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
|goto Throne of Thunder/7 49.8,15.4 |n
Click and use the Displacement Pad here. |goto Throne of Thunder/7 50.7,50.9 <5 |noway |c
step
kill Lei Shen##68397 |goto 50.7,51.0
|tip Overcharge charges the targeted player with lightning, placing a ring of lightning at their feet, with a safe spot in the very center. Players within 5-40 yards take 100,000 Nature damage and are stunned for 3 seconds.
|tip Static Shock places a blue arrow above the targeted player and deals 400,000 total damage after 8 seconds, split between all players within 8 yards of the targeted player.
|tip Bouncing Bolt Lei Shen throws a bolt of lightning across the platform. It creates a blue circle where it lands, spawning an add if a player doesn't stand in the circle in time.
|tip Diffusion Chain deals 75,000 damage to the targeted player, then jumps to nearby players. Each time this hits a player it will also spawn a Diffused Lightning add.
|tip Decapitate usually affects the tank, dealing up to 3,000,000 damage. The damage dealt is decreased the further away the target is from Lei Shen.
|tip Thunderstruck is an AoE that deals 1,000,000 damage to all players in the targeted area. Damage dealt is decreased the further away the area is from Lei Shen.
|tip If you are doing this on LFR this is the end of wing 4.
confirm |next "End ToT"
Click here if you are on Heroic difficulty and want to attempt Ra-den |next "Ra-den"
step
label "Ra-den"
Click and use the Displacement Pad here. |goto Throne of Thunder/7 50.8,51.5 |n
Arrive at Saurok's Creation Pit |goto Throne of Thunder/5 54.4,72.3 < 5 |noway |c
step
map Throne of Thunder/5
path loop off
path	54.4,72.3	56.1,76.1
Follow the stairs down |goto Throne of Thunder/8 52.1,39.9
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Ra-den##69473 |goto Throne of Thunder/8 52.4,81.2
|tip You will have a maximum have 30 attempts to kill this boss per lockout.
_Phase 1_
|tip He will periodically summon 2 orbs, Essence of Vita and Essence of Anima.
|tip You want to always kill the Essence of Vita before it can reach the boss otherwise you will die.
|tip If you get more then one set of orbs you will need cooldowns to mitigate the other Essences DOT.
|tip Adds will periodically spawn and stay up the entire fight if not killed, kill these to avoid unnecessary damage.
_Phase 2_
|tip This phase starts at 40 percent, he will run into the middle and continously cast an aoe.
|tip Orbs will come from the sides, always kill the Corrupted Animas and let the Corrupted Vitas through.
|tip With each Corrupted Vita that gets through the aoe damage get stronger be ready for this.
confirm |next "End ToT"
step
label "End ToT"
Congratulations, you have finished the Throne of Thunder raid!
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Siege of Orgrimmar (60-70)",{
mapid=556,
achieveid={8458, 8461, 8459, 8462},
patch='100207',
condition_suggested=function() return level>=35 and level<=37 end,
author="support@zygorguides.com",
description="This guide will walk you through the Siege of Orgrimmar raid.",
pandariaremix=true,
},[[
step
Click here if you are doing a normal clear of the instance |next "Normal SoO"
Click here if you are doing LFR wings of the instance |next "LFR SoO Index"
Click here to continue |confirm
step
label "LFR SoO Index"
Click here if you are queueing for the First wing of Siege of Orgrimmar (Vale of Eternal Sorrows) |next "First_Wing_SoO"
Click here if you are queueing for the Second wing of Siege of Orgrimmar (Gates of Retribution) |next "Second_Wing_SoO"
Click here if you are queueing for the Third wing of Siege of Orgrimmar (Underhold beneath Orgrimmar) |next "Third_Wing_SoO"
Click here if you are queueing for the Fourth wing of Siege of Orgrimmar (Downfall of Garrosh Hellscream) |next "Fourth_Wing_SoO"
step
label "Normal SoO"
Enter Siege of Orgrimar |goto Vale of Eternal Blossoms/0 73.91,42.21
Click here to continue |confirm
step
label "First_Wing_SoO"
map Siege of Orgrimmar/2
path loop off
path	89.3,45.2	79.3,57.3	59.1,49.6
path	48.1,51.1
Follow the path, clearing trash as you make your way to the boss, Immerseus |goto 48.1,51.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Immerseus##71543 |goto 41.8,45.6
|tip Corrosive Blast is a _cone_ attack that deals 585,000-612,000 Shadow damage to the target and additional nearby players. Make sure the tank is the only one in front of Immerseus when this occurs.
|tip Sha Bolt deals 15,000 Shadow damage to all players within 5 yards of the target, also forming a Sha Pool.
|tip Sha Pool summons a swirling pool at multiple players' feet, dealing 10,000 Shadow damage every second for 10 seconds.
|tip Swirl creates moving void zones that deal move towards players, dealing damage every second. Immerseus then faces a random direction, rotating half-way around the room and casting a large torrent that deals 60,000 Shadow damage per second.
|tip Adds spawn throughout the fight, they should be killed when they appear.
Click here to continue |confirm
step
map Siege of Orgrimmar/2
path loop off
path	31.7,45.4	16.8,44.9	11.7,52.7
path	11.8,69.6
Follow the path, clearing trash as you make your way to the next boss, the Fallen Protectors |goto 11.8,69.6 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
_Fallen Protectors_ |goto Siege of Orgrimmar/1 27.0,18.0
kill Rook Stonetoe##71475
|tip Vengeful Strikes is a _cone_ that stuns all affected targets and deals 180,000 damage twice every second for 3 seconds. Make sure the tank is the only one in front of him when this occurs.
|tip Corrupted Brew inflicts 115,000-132,000 Shadow damage to players within 5 yards of the target and reducing their movement speeds by 50%.
|tip Corruption Kick spins rapidly in a circle, rooting himself in place dealing 117,000-125,000 Physical damage to targets within 10 yards every second for 4 seconds and applying a DoT that deals 70,000 Shadow damage every 2 seconds for 6 seconds.
kill He Softfoot##71479
|tip Shadowstep applies a DoT to the target that deals 80,000 Physical damage every 2 seconds.
|tip Instant Poison deals an additional 73,000-77,000 additional Nature damage on a successful melee attack. This effect has a 3 second cooldown.
|tip Noxious Poison causes successful melee attacks to create pools of poison that deal 85,000 Nature damage every second. This effect has a 3 second cooldown.
|tip Gouge stuns the target for 4 seconds if they are facing Softfoot.
kill Sun Tenderheart##71480
|tip Sha Sear deals Shadow damage every second to the target and all players within 5 yards around them.
|tip Shadow Word: Bane debuff that deals 100.000 Shadow damage every 3 seconds for 18 seconds. Each time it deals damage it will jump to an additional target, jumping up to 3 times.
|tip Calamity deals damage to the entire raid, hitting for 30% of each player's maximum health.
|tip Whenever one of the three bosses reach 66% or 33% health they will summon adds to attack the raid. These should be killed off when they appear.
Click here to continue |confirm
step
map Siege of Orgrimmar/1
path loop off
path	33.8,19.0	36.3,30.2	40.3,40.0
path	41.9,44.8	45.5,60.0	43.0,70.5
map	Siege of Orgrimmar/3
path	56.7,30.2	70.3,35.9	70.2,54.1
Follow the path, clearing trash as you make your way to the next boss, Norushen |goto Siege of Orgrimmar/3 70.2,54.1 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Norushen##72276 |goto 54.2,59.2
|tip Corruption is applied to the raid and has a unique bar for each player. Increased Corruption reduces the player's damage dealt to the boss. This can be cleansed by using a Purifying Light orb at the edge of the room, which takes the player to a unique, role-specific solo phase.
|tip Adds will spawn throughout the fight, they should be killed as soon as they appear. Killing these, however, form void zones that increase players' corruption.
|tip Self Doubt increases the damage the target takes from by next Unleashed Anger by 40%.
|tip Unleashed Anger deals 400,000 Physical damage to the target.
Click here to continue |confirm
step
map Siege of Orgrimmar/3
path loop off
path	46.2,61.8	32.0,80.5	21.6,71.7
path	27.6,54.3
Follow the path, clearing trash as you make your way to the boss, the Sha of Pride |goto 27.6,54.3 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Sha of Pride##71734 |goto 29.5,67.2
|tip Pride is the main mechanic of this fight, each player has a unique bar. Every 60 seconds Sha of Pride uses Swelling Pride, which causes a raide-wide effect based on each player's level of Pride.
|tip Bursting Pride: 25-49 Pride forms Sha energy at the target's location and explodes after 3 seconds, dealing 300,000 Shadow damage to all players within 4 yards.
|tip Projection: 50-74 Pride causes a projection to appear at a nearby location from the target, dealing 225,000 Shadow damage to all players after 8 seconds unless the targeted player is standing within it.
|tip Aura of Pride: 75-99 Pride creates an aura around the target, inflicting 250,000 Shadow damage to other nearby players within 4.5 yards every second.
|tip Overcome: 100 Pride players become mind controlled and attack other raid members, increasing their damage and healing by 50%. If another Swelling Pride is cast while mind controlled, the players are mind controlled for the rest of the fight.
|tip Wounded Pride applies a debuff to the target that causes them to gain 5 Pride whenever they take melee damage from the boss.
|tip Self-Reflection causes 5 players to spawn a reflection of themselves, creating 5 Reflection adds.
|tip Unleashed occurs when Sha of Pride reaches 30% health. It deals 245,000 Shadow damage to the raid every 10 seconds for the rest of the fight. Kill the Sha of Pride as fast as possible to avoid death.
|tip If you are doing this on LFR this is the end of wing 1.
Click here to continue |confirm
step
clicknpc Portal to Orgrimmar##103191 |goto Siege of Orgrimmar/3 23.2,81.9
talk Lor'themar Theron##72560
Then talk to the Leader on your respected boat to open a Minor Portal
click Minor Portal##221522
Click here to continue |confirm
step
label "Second_Wing_SoO"
map Siege of Orgrimmar/4
path loop off
path	84.0,28.6	76.7,30.8	79.8,38.5
path	81.4,40.7	81.6,48.8
Follow the path, destroying cannons along the beach |goto 81.6,48.8 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
talk Lor'themar Theron##72560 |goto 77.0,29.3
Choose _"By your command."_
This will start the first boss fight, make sure you are ready
Click here to continue |confirm
step
You will need to split into two groups
One group will need to clear the towers, then use the two turrets on top of them to shoot down Galakras
kill Galakras##72249 |goto 77.2,29.6
|tip Pulsing Flames deals 30,000 Fire damage.
|tip Each pulse increases Fire damage taken by 3%.
Click here to continue |confirm
step
map Siege of Orgrimmar/4
path loop off
path	69.3,33.0	59.4,37.4	55.1,54.9
path	44.5,68.9	35.1,70.9	33.6,53.6
Follow the path to the next boss, the Iron Juggernaut. |goto 33.6,53.6 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Iron Juggernaut##71466 |goto 32.9,48.5
|tip Shock Pulse releases a seismic eruption that knocks all nearby players back and deals 73,000-76,000 Nature damage.
|tip Seismic Activity causes an earthquake that deals 40,000 Nature damage every second.
|tip Ignite Armor deals 30,000 Fire damage every second and increases Fire damage they take by 10% for 30 seconds.
|tip Flame Vents  deals 300,000 Fire damage in a cone in front of the boss. Make sure the tank is the only one in front of the Iron Juggernaut when this occurs.
|tip Explosive Tar summons tar at the targeted location that deals 20,000 Nature damage every second and reduces movement speed by 30%.
Click here to continue |confirm
step
map Siege of Orgrimmar/4
path loop off
path	30.5,36.0	31.1,29.6	34.8,22.7
map	Siege of Orgrimmar/5
path	51.4,75.2	52.1,64.0	49.0,66.6
path	47.9,71.7
Follow the path, clearing trash at each point around the next boss |goto 47.9,71.7 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
_Kor'kron Dark Shaman_ |goto 48.4,64.3
|tip The bosses are inside the building here, and will need to be pulled outside.
|tip A Hunter/Rogue can aggro them and then Feign Death/ Vanish to do this.
kill Earthbreaker Haromm##71859
|tip Froststorm Strike deals 300,000 Frost damage and increases damage taken from this attack by 25% for 30 seconds.
|tip Toxic Mist creates a toxic pool that deals 80,000 Nature damage every 3 seconds.
|tip Foul Stream deals 300,000 Nature damage to all players in a line in front of Haromm.
|tip Ashen Wall summons Ash Elementals to attack the raid. They automatically die after a set amount of time.
kill Wavebinder Kardris##71858
|tip Toxic Storm creates a storm that deals 300,000 Nature damage to players within 9 yards every 2 seconds.
|tip Also sometimes creates toxic tornadoes.
|tip Foul Geyser creates water that deals 300,000 Nature damage every 0.5 seconds for 8 seconds to players within 4 yards of the area.
|tip Falling Ash summons ash to fall on the targeted area, dealing 999,999 Fire damage to all players within 17 yards and 300,000 Fire damage at the moment of impact.
Click here to continue |confirm
step
map Siege of Orgrimmar/5
path loop off
path	51.4,60.7	51.8,48.4	54.2,47.6
path	61.2,43.2	60.8,33.0	55.8,28.9
map	Siege of Orgrimmar/6
path	67.2,36.2	67.7,50.8
map	Siege of Orgrimmar/7
path	41.5,28.3	53.0,56.4
Follow the path, clearing trash as you make your way to the boss, General Nazgrim |goto Siege of Orgrimmar/7 53.0,56.4 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill General Nazgrim##71515 |goto Siege of Orgrimmar/7 65.2,73.5
|tip Battle Stance generates 1 Rage per seconds.
|tip Berserker Stance Nazgrim deals extra damage, but also takes extra damage.
|tip Defensive Stance reduces his damage taken, and increases Rage generated. DPS should stop damaging Nazgrim when he is in this stance.
|tip Sundering Blow deals 600,000 Physical damage and reduces the target's armor by 10% for 30 seconds.
|tip Bonecracke_ reduces the target's maximum health by 10% and causes them to bleed for 40,000 damage every second.
|tip Heroic Shockwave deals 300,000 Physical damage to players within 10 yards of the targeted area.
|tip Kor'kron Banner summons a banner that causes Nazgrim's allies to generate additional Rage for him.
|tip War Song deals damage to the entire raid, equal to 50% of each player's maximum health.
|tip Ravager Nazgrim throws his sword, dealing 370,000-430,000 damage to players within 6 yards every second and granting Nazgrim 5 Rage for each player hit.
|tip If you are doing this on LFR this is the end of wing 2.
Click here to continue |confirm
step
label "Third_Wing_SoO"
map Siege of Orgrimmar/8
path loop off
path	20.4,66.3	23.2,60.9	28.3,60.6
path	34.0,59.3	38.4,57.5	41.4,62.9
path	51.3,61.1	57.2,55.5	53.4,66.1
path	47.5,55.3	44.2,48.0
Follow the path, clearing trash as you make your way to the boss, Malkorok |goto 44.2,48.0 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Malkorok##71454 |goto 41.6,42.3
|tip Ancient Miasma is cast while Malkorok's energy builds up to 100. It converts all healing to absorption shields and deals 30,000 Shadow damage to the raid every 2 seconds.
|tip Seismic Slam deals 500,000 damage in a 5 yard area around a random player, knocking all affected players into the air.
|tip Arcing Smash deals 600,000 damage to all players in a cone. Make sure the tank is the only one in front of Malkorok when this occurs.
|tip Imploding Energy creates pools of energy that deal 450,000 Shadow damage after 4 seconds to players within 5 yards. If no players are damaged by the initial explosion, it instead deals 510,000 Shadow damage to the entire raid.
|tip Breath of Y'sharrj causes the areas recently hit by Arcing Smash/Seismic Slam to explode, dealing 1,200,000 Shadow damage.
|tip Blood Rage causes Malkorok's attack to now deal 1,800,000 total Physical damage, split between all players hit by the cone.
|tip Displaced Energy deals 250,000 Shadow damage to the target every 3 seconds for 9 seconds. Upon expiring, it explodes and deals an additional 450,000 Shadow damage to all players within 8 yards.
Click here to continue |confirm
step
map Siege of Orgrimmar/8
path loop off
path	36.9,31.7	31.6,16.9	37.8,12.1
path	42.7,23.4	53.9,30.0	61.6,23.5
path	67.8,32.4	78.0,55.9	78.3,73.6
map	Siege of Orgrimmar/9
path	55.4,26.0
Follow the path, clearing trash as you make your way to the next boss, the Spoils of Pandaria |goto Siege of Orgrimmar/9 55.4,26.0 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
click Secure Stockpile of Pandaria Spoils
Choose _"Garrosh Hellscream"_
Then, choose _"Blood and Thunder!"_
This will start the encounter
kill Spoils of Pandaria##71889 |goto 52.7,29.2
|tip The objective of this fight is to open all of the boxes in the rooms before the timer runs out. Opening a box spawns a group of adds that must be killed.
_Mantid Adds_
|tip Commanders are kill priority. Avoid the tornadoes they spawn and kill off priests.
_Mogu Adds_
|tip Statue are kill priority, but can be left if LFR. One person should stand in the beams they cast. Dispell Ritualists.
Click here to continue |confirm
step
map Siege of Orgrimmar/9
path loop off
path	41.5,40.2	37.4,51.4	40.5,57.9
path	46.3,70.7	46.9,76.2
Follow the path, clearing trash around the boss, Thok the Bloodthirsty |goto 46.9,76.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Thok the Bloodthirsty##71529 |goto 51.3,82.1
|tip Acid Breath inflicts 485,000-512,00 Nature damage in a frontal cone.
|tip Make sure the tank is the only one in front of Thok when this occurs.
|tip Blood Frenzy is a buff that slowly increases Thok's damage and movement speed.
|tip Deafening Screech inflicts 243,000-255,000 Physical damage to the raid and interrupting spellcasting for 2 seconds.
|tip Fearsome Roar deals 200,000 Physical damage in a frontal cone and increasing damage taken by those affected by 25%.
|tip Make sure the tank is the only one in front of Thok when this occurs.
|tip Freezing Breath deals 200,000 Frost damage in a frontal cone.
|tip After 5 stacks the target will be frozen solid in a tomb of ice and stunned.
|tip Mending heals Thok for 8% of his maximum health.
|tip Panic deals 200,000 damage in a frontal cone.
|tip Scorching Breath deals 200,000 Fire damage in a frontal cone.
|tip Tail Lash deals 200,000 damage to players behind Thok, also stunning them for 2 seconds.
|tip If you are doing this on LFR this is the end of wing 3.
Click here to continue |confirm
step
map Siege of Orgrimmar/9
path loop off
path	46.9,76.2	46.3,70.7	40.5,57.9
path	37.4,51.4	41.5,40.2	64.8,17.0
Make your way back to the Underhold Nexus
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
label "Fourth_Wing_SoO"
map Siege of Orgrimmar/8
path loop off
path	73.0,43.4	82.2,58.6	89.9,62.0
path	Siege of Orgrimmar/10 36.4,69.8
Follow the path, clearing trash as you make your way to the boss, Siegecrafter Blackfuse |goto Siege of Orgrimmar/10 36.4,69.8 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
Kill the waves of enemies that spawn |goto Siege of Orgrimmar/10 40.3,65.7
Click here to continue |confirm
step
Jump onto this large pipe once all the waves of enemies have been defeated |goto Siege of Orgrimmar/10 46.3,59.5 < 5
Click here to continue |confirm
step
kill Siegecrafter Blackfuse##71504 |goto 58.7,46.5
|tip It helps if 2 teams are assigned to kill the Disassembled Weapon adds that spawn every 30 seconds.
|tip The groups will have to alternate between spawns.
|tip If a Weapon add is not killed before they reach the northeastern wall, Blackfuse will gain Energized Defensive Matrix.
|tip Energized Defense Matrix reduces Blackfuse's damage taken by 90%.
|tip Matter Purification Beam inflicts 475,000 Fire damage.
|tip Launch Sawblade fires a blade at the target, knocking away all players in its path upon firing and dealing 41,000-48,000 damage every second.
|tip Electrostatic Charge deals 250,000 Nature damage and increases the target's damage taken from Electrostatic Charge by 100% and Reactive Armor by 200%.
|tip Reactive Armor reduces damage taken by 80%.
|tip Adds that have this buff should be kited through AoEs on the ground, as they still take normal damage from environmental effects.
|tip Protective Frenzy is a buff that increases damage by 100%, health by 250% and granting immunity to immobolize, stun, and slow effects.
|tip Automatic Repair Beam_ Blackfuse heals one of his allies for 5% of their maximum health every 3 seconds.
|tip Because of this, adds should be tanked at least 35 yards away from him.
Click here to continue |confirm
step
Jump onto this large pipe |goto Siege of Orgrimmar/10 50.2,55.6 <5 |c
step
map Siege of Orgrimmar/10
path loop off
path	31.1,74.6	24.7,81.2
map	Siege of Orgrimmar/8
path	87.6,76.0
map	Siege of Orgrimmar/11
path	35.6,21.3	48.1,13.1	57.1,13.0
path	63.1,24.5	62.2,32.6	66.5,33.2
path	69.5,28.0	69.1,38.2
Follow the path, clearing trash as you make your way to the next boss, the Paragons of the Klaxxi |goto 69.1,38.2 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
The Paragons join the fight in a certain order, as listed
Killing a Paragon causes the others to return to 100% health |goto 68.3,35.3
kill Rik'kal the Dissector##71158, Skeer the Bloodseeker##71152, Hisek the Swarmkeeper##71153
|tip Injection deals 40,000 Nature damage every second for 12 seconds.
|tip Mutate turns the target into a mantic scorpion. The transformation deals 150,000 Fire damage to all nearby players within 3 yards and an additional 50,000 Fire damage every second to the original target.
|tip Bloodletting causes Skeer's target to bleed, flinging globules of their blood onto the floor around the room that move to a nearby Paragon and heal them.
|tip Multi-Shot Hisek shoots at 3 players at once.
|tip Rapid Fire Hisek fires out multiple Sonic Pulses that deal 300,000 Physical damage every second to all players caught in their path.
kill Ka'roz the Locust##71154
|tip Caustic Amber AoE that deals 138,000-160,000 Nature damage every second.
kill Korven the Prime##71155
|tip Encase in Amber encased one of Koven's allies in an amber shield, absorbing all damage for 10 seconds. If the shield is not destroyed in this time that ally's health is restored to 100%.
|tip Shield Bash is a 6 second stun, followed by a _frontal cleave_
kill Iyyokuk the Lucid##71160
|tip Insane Calculation: Fiery Edge fires a beam of fire between multiple players, dealing increased damage the closer the targets are to each other.
kill Xaril the Poisoned Mind##71157
|tip Caustic Blood deals 500,000 Nature damage every second and stacks up to 10 times.
|tip Tenderizing Strikes is a debuff that increases the target's damage taken from Kil'ruk the Wind-Reaver.
kill Kaz'tik the Manipulator##71156
|tip Mesmerize forces the targeted player to walk toward a nearby Hungry Kunchong.
kill Kil'ruk the Wind-Reaver##71161
|tip Death From Above deals damageto all players within 8 yards.
Click here to continue |confirm
step
map Siege of Orgrimmar/11
path loop off
path	72.6,45.3	77.4,56.2	76.7,71.4
path	68.2,81.4	64.9,92.6	Siege of Orgrimmar/12 51.2,45.9
Follow the path, clearing trash as you make your way to the boss, Garrosh Hellscream |goto Siege of Orgrimmar/12 51.2,45.9 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
Click here to continue |confirm
step
kill Garrosh Hellscream##71865 |goto Siege of Orgrimmar/12 50.1,60.5
|tip An Engineer add spawns on both sides of the room after Garrosh throws a whirling axe at the raid with Desecrate.
|tip They cast Iron Star, which will release a large rolling wheel into the room that kills any raid members it crushes.
|tip A DPS should be assigned to kill an Engineer while the raid stays protected on the safe side of the room, free of the Iron Star wheel.
|tip In between main phases the raid will get teleported to 1 of 3 possible zones.
|tip Kill the adds in the zone and rush Garrosh, continuing to damage him as much as possible.
|tip Desecrate Garrosh throws a whirling axe at the raid, dealing damage on impact and spawning a void zone that deals 75,000 damage every second to all players inside it.
|tip Destroying the axe will remove the void zone.
|tip Whirling Corruption deals 105,000 Shadow damage to nearby players every 0.5 seconds.
|tip The damage decreases the farther away you are from Garrosh.
|tip Touch of Y'Shaarj mind controls the targeted player, making them attack other raid members.
|tip Bringing them down to 20% health will break the mind control.
|tip In Phase 3 Garrosh gains Heart of the Y'Shaarj and takes on a Sha-like appearance.
|tip The axes from Desecrate can no longer be destroyed and should simply be avoided while continuing to damage Garrosh.
|tip Kill him as fast as possible to avoid death.
Click here to continue |confirm
step
Click on Fading Breah
accept The Last Gasp of Y'Shaarj##33147 |goto Siege of Orgrimmar/12 47.8,65.7
only if not completedq(33147)
step
talk Lorewalker Cho##73318
turnin The Last Gasp of Y'Shaarj##33147 |goto Siege of Orgrimmar/12 50.2,56.9
accept Why Do We Fight?##33138 |goto Siege of Orgrimmar/12 50.2,56.9
only if not completedq(33138)
step
talk Lorewalker Cho##73136
turnin Why Do We Fight?##33138 |goto Vale of Eternal Blossoms/0 67.4,45.7
only if not completedq(33138)
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Brewing Storm (10-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"A Brewing Storm\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7252,8310,7257,7258,7261},
patch='100207',
model={40972},
startlevel=10,
endlevel=70,
mapid=878,
pandariaremix=true,
},[[
step
talk Brewmaster Blanche##59569
|tip Blanche patrols all around the bridge and the areas that it connects.
accept Blanche's Boomer Brew##30567 |goto The Jade Forest/0 38.87,31.15
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me the tale of a Brewing Storm."_ |script GossipFrame:SelectGossipOption(3)
Enter the A Brewing Storm Scenario |scenariostart |goto 82.96,30.38
step
talk Brewmaster Blanche##58740
Tell her _"Let's get this lightning party started, Blanche."_ |script GossipFrame:SelectGossipOption(1)
clicknpc Brewkeg##58916
|tip Brewkegs struck by lightning will sometimes catch fire.
|tip Click on the Brewkegs when they catch fire to extinguish them.
|tip Avoid standing near the lightning rods when they light up.
|tip Stand in green mist on the ground for extra healing.
Defend the Brewing Process |scenariogoal 1/22197 |goto A Brewing Storm/0 55.32,44.99
step
Go down the stairs |goto 54.34,55.87 < 10 |walk
Go down the stairs |goto 70.12,43.80 < 10 |walk
Follow the path up |goto 50.67,32.25 < 10 |walk
Kill enemies that attack in waves
|tip Enemies will periodically jump in your path and attack.
|tip Blanche will sometimes stop before a new group of enemies attacks.
Escort Blanche to Thunderpaw Refuge |scenariogoal 2/19564 |goto 30.14,66.14
step
Go up the stairs |goto 31.94,71.19 < 10 |walk
talk Brewmaster Blanche##58740 |goto 30.27,68.06
|tip She will mount up and run to the entrance to the refuge.
Tell her _"Let's kill some lizards, Blanche!"_ |script GossipFrame:SelectGossipOption(1)
kill Borokhula the Destroyer##58739
|tip When Borokhula starts to cast Swamp Smash move away from the front of him.
|tip When he begins to channel Earth Shattering, watch the ground and avoid the red circles.
extraaction Boomer Brew Strike##115058
|tip Designate one party member to add control.
|tip The adds can be quickly dispatched using the Boomer Brew Strike button on the screen or with AoE.
|tip Target an add and click it to channel.
Defeat Borokhula the Destroyer |scenariogoal 3/19565 |goto 30.23,60.76
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 30.27,68.06 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
step
talk Brewmaster Blanche##58740
|tip Blanche patrols all around the bridge and the areas that it connects.
turnin Blanche's Boomer Brew##30567 |goto The Jade Forest/0 38.87,31.15
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Brewing Storm (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"A Brewing Storm\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7252,8310,7257,7258,7261},
patch='100207',
model={40972},
startlevel=10,
endlevel=70,
mapid=878,
pandariaremix=true,
},[[
step
talk Brewmaster Blanche##59569
|tip Blanche patrols all around the bridge and the areas that it connects.
accept Blanche's Boomer Brew##30567 |goto The Jade Forest/0 38.87,31.15
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me the tale of a Brewing Storm."_ |script GossipFrame:SelectGossipOption(1)
Enter the A Brewing Storm Scenario |scenariostart |goto 83.05,30.45
step
talk Brewmaster Blanche##58740
Tell her _"Let's get this lightning party started, Blanche."_ |script GossipFrame:SelectGossipOption(1)
clicknpc Brewkeg##58916
|tip Brewkegs struck by lightning will sometimes catch fire.
|tip Click on the Brewkegs when they catch fire to extinguish them.
|tip Avoid standing near the lightning rods when they light up.
|tip Stand in green mist on the ground for extra healing.
Defend the Brewing Process |scenariogoal 1/22197 |goto A Brewing Storm/0 55.32,44.99
step
Go down the stairs |goto 54.34,55.87 < 10 |walk
Go down the stairs |goto 70.12,43.80 < 10 |walk
Follow the path up |goto 50.67,32.25 < 10 |walk
Kill enemies that attack in waves
|tip Enemies will periodically jump in your path and attack.
|tip Blanche will sometimes stop before a new group of enemies attacks.
Escort Blanche to Thunderpaw Refuge |scenariogoal 2/19564 |goto 30.14,66.14
step
Go up the stairs |goto 31.94,71.19 < 10 |walk
talk Brewmaster Blanche##58740 |goto 30.27,68.06
|tip She will mount up and run to the entrance to the refuge.
Tell her _"Let's kill some lizards, Blanche!"_ |script GossipFrame:SelectGossipOption(1)
kill Borokhula the Destroyer##58739
|tip When Borokhula starts to cast Swamp Smash move away from the front of him.
|tip When he begins to channel Earth Shattering, watch the ground and avoid the red circles.
extraaction Boomer Brew Strike##115058
|tip Designate one party member to add control.
|tip The adds can be quickly dispatched using the Boomer Brew Strike button on the screen or with AoE.
|tip Target an add and click it to channel.
Defeat Borokhula the Destroyer |scenariogoal 3/19565 |goto 30.23,60.76
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 30.27,68.06 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
step
talk Brewmaster Blanche##58740
|tip Blanche patrols all around the bridge and the areas that it connects.
turnin Blanche's Boomer Brew##30567 |goto The Jade Forest/0 38.87,31.15
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Greenstone Village (10-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Greenstone Village\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7265,7267,7266},
patch='100207',
model={41877},
startlevel=10,
endlevel=70,
mapid=880,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of Greenstone Village."_ |script GossipFrame:SelectGossipOption(1)
Enter the Greenstone Village Scenario |scenariostart |goto 82.96,30.38
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue Meila |scenariogoal 1/19200 |goto Greenstone Village/0 63.25,52.93
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue Swan |scenariogoal 1/19203 |goto 55.61,56.47
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue Scribe Rinji |scenariogoal 1/19202 |goto 52.84,57.96
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue Mayor Lin |scenariogoal 1/21336 |goto 56.19,63.00
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue Portly Shung |scenariogoal 1/19201 |goto 59.39,69.20
step
Kill Seedling enemies around this area
|tip Killing all of them will release the villager.
Rescue La & Liupo |scenariogoal 1/19204 |goto 62.17,67.28
step
kill Beast of Jade##66772
|tip Inside the building.
Save Tzu's Dojo |scenariogoal 2/19199 |goto 50.68,70.56
step
clicknpc Burgled Barrel##62682
|tip Look for yellow dots on your minimap.
|tip After clicking a barrel, guide it back to Tzu's Dojo.
Return #6# Burgled Barrels |scenariogoal 3/19229 |goto 52.14,68.37
step
extraaction Volatile Greenstone Brew##119090
|tip Use the button on your screen for extra damage.
clicknpc Barrel-Chest Huo##62988
Save Barrel-Chest Huo |scenariogoal 4/1244 |goto 52.93,32.63
step
extraaction Volatile Greenstone Brew##119090
|tip Use the button on your screen for extra damage.
clicknpc Stonecutter Lon##62989
Save Stonecutter Lon |scenariogoal 4/19264 |goto 57.08,30.25
step
extraaction Volatile Greenstone Brew##119090
|tip Use the button on your screen for extra damage.
clicknpc Kiri Jade-Eyes##62990
Save Kiri Jade-Eyes |scenariogoal 4/19265 |goto 54.76,24.98
step
extraaction Volatile Greenstone Brew##119090
|tip Use the button on your screen for extra damage.
kill Vengeful Hui##61156
|tip It will come running out and attack.
Slay Vengeful Hui |scenariogoal 5/19205 |goto 52.56,23.50
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 52.56,23.50 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Theramore's Fall (10-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Theramore's Fall\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7529,7530,7524},
patch='100207',
model={40312,25341,40278,40589,40587,40352,40346},
startlevel=10,
endlevel=70,
mapid=906,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of Theramore's Fall."_ |script GossipFrame:SelectGossipOption(8)
Enter the Theramore's Fall Scenario |scenariostart |goto 82.96,30.38
step
Follow the path |goto Theramore's Fall H/0 61.39,52.93 < 20 |walk
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the First Powder Barrel |scenariogoal 1/22180 |count 1 |goto Theramore's Fall H/0 61.84,68.72
step
kill Captain Tellern##59088 |scenariogoal 1/22381 |count 1 |goto 65.45,63.02
|tip He walks around on the deck of the ship.
step
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the second Powder Barrel |scenariogoal 1/22180 |count 2 |goto 66.17,64.15
step
Follow the path |goto 72.29,70.83 < 15 |walk
kill Squallshaper Lanara##58948 |scenariogoal 1/22381 |count 2 |goto 73.58,62.02
|tip On the ship.
step
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the Third Powder Barrel |scenariogoal 1/22180 |count 3 |goto 73.19,62.18
step
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the Fourth Powder Barrel |scenariogoal 1/22180 |count 4 |goto 73.24,76.47
step
Follow the path |goto 58.11,58.48 < 15 |walk
Follow the path |goto 56.54,77.83 < 15 |walk
kill "Mad" Morden Morgrensen##59086 |scenariogoal 1/22381 |count 3 |goto 51.66,87.26
|tip He walks around on the deck of the ship.
step
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the Fifth Powder Barrel |scenariogoal 1/22180 |count 5 |goto 50.29,86.05
step
clicknpc Rig This Powder Barrel!##58665
|tip On the ship.
Rig the Sixth Powder Barrel |scenariogoal 1/22180 |count 6 |goto 58.62,73.51
step
talk Blastmaster Sparkfuse##58765
Tell him _"We've rigged the powder barrels in every ship."_ |script GossipFrame:SelectGossipOption(1)
Inform Blastmaster Sparkfuse |scenariogoal 2/19989 |goto 57.72,57.69
stickystart "Slay_Theramore_Gryphons"
step
kill Baldruc##58777 |scenariogoal 3/19981 |goto 50.37,46.80
|tip During the fight, he will place a Storm Totem on the battlefield.
|tip Kill it or move away from it.
step
label "Slay_Theramore_Gryphons"
kill 2 Theramore Gryphon##58782+ |scenariogoal 3/19982 |goto 50.37,46.80
step
kill Big Bessa##58787 |scenariogoal 4/19983 |goto 34.77,40.55
|tip It moves up and down the road.
step
clicknpc Unmanned Tank##58788
|tip Run away before it explodes.
Sabotage the First Unmanned Tank |scenariogoal 4/19980 |count 1 |goto 32.89,36.91
step
clicknpc Unmanned Tank##58788
|tip Run away before it explodes.
Sabotage the Second Unmanned Tank |scenariogoal 4/19980 |count 2 |goto 29.05,38.00
step
clicknpc Unmanned Tank##58788
|tip Run away before it explodes.
Sabotage the Third Unmanned Tank |scenariogoal 4/19980 |count 3 |goto 30.02,45.64
step
Enter the building |goto 53.07,34.77 < 10 |walk
Run up the stairs |goto 54.32,38.36 < 5 |walk
Run up the ramp |goto 51.92,37.12 < 5 |walk
kill Hedric Evencane##58840 |scenariogoal 5/19987 |goto 53.88,37.27
|tip Upstairs inside the building.
step
collect Arcane Shackles Key##79261 |scenariogoal 5/21241 |goto 53.88,37.27
|tip Loot it from Hedric's corpse.
step
Run down the ramp |goto 51.92,37.12 < 5 |walk
Run down the stairs |goto 54.32,38.36 < 5 |c |walk
step
Run down the stairs |goto 53.14,37.36 < 3 |walk
talk Thalen Songweaver##58816
Choose _<Unlock the shackles.>_ |script GossipFrame:SelectGossipOption(1)
Free Thalen Songweaver |scenariogoal 5/19988 |goto 54.49,36.37
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 54.49,36.37 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
|tip Thalen will also open a Return Portal after his cast.
|tip This portal leads to Orgrimmar.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dagger in the Dark (20-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Dagger in the Dark\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8009,7987,7984,7986},
patch='100207',
model={46480,46111},
startlevel=20,
endlevel=70,
mapid=914,
pandariaremix=true,
},[[
step
talk Sunwalker Dezco##64566
|tip You must complete a brief quest chain to accept the quest related to this scenario.
|tip You can pick up the initial quest, "Meet the Scout," from Lyalia in outside of Shrine of Seven Stars.
|tip Complete the two following quests to unlock Domination Point.
accept Meet the Scout##32249 |goto Vale of Eternal Blossoms/0 62.93,28.18
step
talk Scout Rokla##67812
turnin Meet the Scout##32249 |goto Krasarang Wilds/0 8.73,64.36
step
talk Garrosh Hellscream##62092
accept The Might of the Warchief##32250 |goto 8.67,64.45
stickystart "Kill_Alliance_Troops"
step
talk Blood Guard Gro'tash##67927
Find Blood Guard Gro'tash |q 32250/2 |goto 10.70,53.15
step
talk Grizzle Gearslip##67926
Find Grizzle Gearslip |q 32250/3 |goto 15.74,57.76
step
label "Kill_Alliance_Troops"
Kill Alliance enemies around this area
Kill #25# Alliance Troops |q 32250/1 |goto 12.40,57.04
step
Next to you:
talk Garrosh Hellscream##62092
turnin The Might of the Warchief##32250
accept Domination Point##32108
step
click Signal Fire##216274
turnin Domination Point##32108 |goto 8.53,63.86
step
talk General Nazgrim##67939
accept Dagger in the Dark##32251 |goto 10.39,53.71
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the Dagger in the Dark that felled Vol'jin."_ |script GossipFrame:SelectGossipOption(9)
Enter the Dagger in the Dark Scenario |scenariostart |goto 82.96,30.38
step
talk Vol'jin##67414
turnin Dagger in the Dark##32251 |goto Dagger in the Dark/0 56.08,75.18
step
talk Vol'jin##67414
Tell him _"I'm ready. Let's go."_ |script GossipFrame:SelectGossipOption(1)
Speak to Vol'jin |scenariogoal 1/22282 |goto 56.08,75.18
step
Follow the path |goto 51.16,60.97 < 15 |walk
Find the Saurok Cave |scenariogoal 2/22281 |goto 52.48,46.41
step
Kill Darkhatched enemies around this area
Defeat the Saurok Patrol |scenariogoal 3/22416 |goto 52.28,44.09
step
kill Darkhatched Lizard-Lord##67263
Defeat the Darkhatched Lizard-Lord |scenariogoal 3/22238 |goto 52.06,44.51
step
Watch the dialogue
clicknpc The Spring Saurok-Slayer##67706
|tip Wait a moment for the boat to be repaired.
Jump in the Boat |invehicle |goto 51.84,43.05
step
kill Darkhatched Sorcerer##67748
|tip Kill Sorcerers along the way to maintain your progress.
Complete the Boat Ride |scenariogoal 4/22284 |goto Dagger in the Dark/1 50.34,51.15
step
Find the Saurok Hatchery |scenariogoal 5/22287 |goto 56.61,31.95
step
kill Broodmaster Noshi##67264
|tip Use Flamethrower when you get swarmed by Darkhatched Swarmlings.
Defeat Broodmaster Noshi |scenariogoal 6/22239 |goto 53.00,24.89
step
Watch the dialogue
clicknpc Broken Mogu Tablet##67863
|tip Wait for the dialogue to complete.
Investigate the West Statue |scenariogoal 7/22288 |goto 51.49,34.17 |future
step
clicknpc Broken Mogu Tablet##67863
Investigate the East Statue |scenariogoal 7/22289 |goto 54.91,16.32
step
Watch the dialogue
kill Rak'gor Bloodrazor##67266
|tip Wait for the dialogue to complete.
|tip Rak'gor will place a Gas Bomb on the ground that you will need to move out of.
Defeat Rak'gor Bloodrazor |scenariogoal 8/22240 |goto 53.54,26.34
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 53.54,26.34 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Domination Point (20-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Domination Point\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8013,8015,8014},
patch='100207',
model={46217},
startlevel=20,
endlevel=70,
mapid=920,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the defense of Domination Point."_ |script GossipFrame:SelectGossipOption(11)
Enter the Domination Point Scenario |scenariostart |goto 82.96,30.38
step
Kill Lion's enemies around this area
talk Kromthar##68998
|tip Kill any enemies attacking her to enable dialogue.
Tell her _"Fight with us."_ |script GossipFrame:SelectGossipOption(1)
Join Kromthar |scenariogoal 1/22530 |goto Domination Point/0 27.76,26.76
step
Follow the path |goto 30.78,32.85 < 10 |walk
Follow the path |goto 36.32,35.10 < 15 |walk
talk General Nazgrim##68997
|tip Kill any enemies attacking him to enable dialogue.
Tell him _"Fight with us."_ |script GossipFrame:SelectGossipOption(1)
Join General Nazgrim |scenariogoal 2/22531 |goto 43.30,32.03
step
Kill enemies around this area
Slay the East Attackers |scenariogoal 3/22547 |goto 33.16,35.19
step
Kill enemies around this area
Slay the South Attackers |scenariogoal 3/22548 |goto 31.00,37.65
step
Kill enemies around this area
Slay the West Attackers |scenariogoal 3/22549 |goto 29.61,36.46
step
talk Warlord Bloodhilt##69002
|tip Kill any enemies attacking him to enable dialogue.
Tell him _"We're here to help."_ |script GossipFrame:SelectGossipOption(1)
Locate Warlord Bloodhilt |scenariogoal 4/22558 |goto 30.57,38.95
step
Watch the dialogue
kill Saber-Rider Isari##67397
Slay the Assault Commander |scenariogoal 4/22557 |goto 30.57,38.95
step
talk Shokia##69001
|tip Kill any enemies attacking her to enable dialogue.
Tell her _"Fight with us."_ |script GossipFrame:SelectGossipOption(1)
Gather Shokia's Report |scenariogoal 5/22559 |goto 28.51,35.11
step
talk Rivett Clutchpop##68999
|tip Kill any enemies attacking him to enable dialogue.
Tell him _"Fight with us."_ |script GossipFrame:SelectGossipOption(1)
Gather Rivett's Report |scenariogoal 5/22561 |goto 34.25,33.00
step
talk Shademaster Kiryn##69000
|tip Kill any enemies attacking her to enable dialogue.
Tell her _"Fight with us."_ |script GossipFrame:SelectGossipOption(1)
Gather Kiryn's Report |scenariogoal 5/22560 |goto 31.86,31.43
step
clicknpc Place Boomsticks Here!##68885
Place the Boomsticks |scenariogoal 6/22498 |goto 31.97,35.85
step
clicknpc Place Rockets Here!##68886
Place the Rockets |scenariogoal 6/22496 |goto 31.82,35.99
step
clicknpc Place Bombs Here!##68884
Place the Bombs |scenariogoal 6/22497 |goto 31.65,36.18
step
Kill the approaching enemies
Defeat the First Wave of Enemies |scenariogoal 7/22562 |goto 30.81,37.71
step
Kill the approaching enemies
Defeat the Second Wave of Enemies |scenariogoal 7/22563 |goto 30.81,37.71
step
Kill the approaching enemies
Defeat the Third Wave of Enemies |scenariogoal 7/22564 |goto 30.81,37.71
step
kill Joan Lorraine##67530
Slay the Alliance Commander |scenariogoal 7/22565 |goto 30.81,37.71
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 30.81,37.71 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Unga Ingoo (20-70)",{
author="support@zygorguides.com",
description="This guide will walk you through completing the \"Unga Ingoo\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7249,7232,7231,7248,7239},
patch='100207',
model={42503},
startlevel=20,
endlevel=70,
mapid=882,
pandariaremix=true,
},[[
step
talk Brewmaster Bo##65289
|tip Bo walks around inside the building and on the beach.
accept The Funky Monkey Brew##31058 |goto Krasarang Wilds/0 51.81,77.15
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of Unga Ingoo."_ |script GossipFrame:SelectGossipOption(2)
Enter the Unga Ingoo scenario |scenariostart |goto 82.96,30.38
step
Approach Brewmaster Bo |goto Unga Ingoo/0 51.92,86.44 < 5 |c
step
talk Brewmaster Bo##62467
Tell him _"Let's get going!"_ |script GossipFrame:SelectGossipOption(1)
Speak with Bo and Begin Following Him |goto Unga Ingoo/0 51.92,86.44 > 10 |c
|tip Follow him up the shore behind him.
step
Follow the path |goto 41.18,76.67 < 10 |walk
Kill enemies as Bo stops
|tip He will periodically stop and look at things.
Escort Brewmaster Bo |scenariogoal 1/19210 |goto 50.06,61.29
step
Kill Hozen enemies around this area
|tip Leave one party member behind to defend Brewmaster Bo or Hozen will steal brew.
|tip Defenders should use Inactive Beach Bombs and the Brew Defender cannon to help them fight off Hozen.
|tip "Hozen ships appear in the distance!" signal the approach of new enemies.
click Unga Keg##3365+, Unga Mug##3365+
|tip All over the island, tiny mugs and kegs are found near huts and other objects.
|tip The other two party members should run around the island and collect brew.
|tip Return to the cauldron every time you have 30+ stacks of brew.
Fill the Brewing Cauldron |scenariogoal 2/21304 |goto 50.08,61.96
|tip Special mobs and objects below generally drop 25 brew kegs.
Kill Ba-Bam at [46.43,64.38]
|tip Click the Zip Line to go to the ship.
Kill the Unga Totem at [60.57,71.30]
A big keg is at [79.66,54.03]
Unstable Keg and Unga Totem at [79.50,45.23]
|tip This cave has lots of brew inside.
|tip Click the unstable keg and run around to catch brew.
Rik Rik at [30.09,23.67]
step
Watch the dialogue
kill Captain Ook##62465
|tip He periodically casts Gonna Ook Ya. Move from the red circle.
|tip When he gets weak, a Scurvy-Curing Orange will spawn. Click it to pick it up and run away from Captain Ook.
Defeat Captain Ook |scenariogoal 3/20696 |goto 50.34,58.05
step
talk Brewmaster Bo##62491
turnin The Funky Monkey Brew##31058 |goto 49.56,60.70
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 49.56,60.70 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Little Patience (20-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"A Little Patience\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7988,7989,7990,7992,7993,7991},
patch='100207',
model={46813},
startlevel=20,
endlevel=70,
mapid=912,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of how Varian and Tyrande learned a Little Patience."_ |script GossipFrame:SelectGossipOption(10)
Enter the A Little Patience Scenario |scenariostart |goto 82.96,30.38
step
talk King Varian Wrynn##69026
turnin A Little Patience##32248 |goto A Little Patience/0 41.91,15.44
stickystart "info"
step
talk Duff McStrum##68057 |goto 39.04,23.11
talk Ferra Pearl##68599 |goto 36.65,16.27
talk Rosey Axlerod##67883 |goto 42.46,24.15
talk Elder Adler##67569 |goto 22.60,32.64
talk Master Brownstone##68240 |goto 48.41,22.12
|tip Only two allies will be available.
|tip About thirty seconds after entering the scenario, you can look on your world map for white dialogue icons to note their location.
Click here when you talk to the two available NPCs |confirm
step
When you initiate the instance, there will be random defense camps that spawn.
|tip Refer to your map to locate them.
|tip Occasionally, the defense camps will be attacked. Have 1 well geared player defend, while the others gathering resources.
Kill enemies around the area
Construct #2# Defenses |scenariogoal 1/22517
step
label "info"
Throughout this scenario, you will need to collect various objects
|tip Look for shining objects on the ground.
|tip Use these objects at the available construction sites to increase your progress.
step
kill Commander Scargash##68474
|tip If you do not outgear the encounter and are targeted by Blood Rage, run away.
|tip Occasionally, Scargash will use Crushing Leap, jumping to an area and knocking everyone nearby back.
Defeat Commander Scargash |scenariogoal 2/22461 |goto 47.51,60.60
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 47.51,60.60 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Arena of Annihilation (25-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Arena of Annihilation\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7271,7272,7273},
patch='100207',
model={43509,43329,40963,39570,39747,43292,42937},
startlevel=25,
endlevel=70,
mapid=480,
pandariaremix=true,
},[[
step
talk Gurgthock##63315
accept The Arena of Annihilation##31207 |goto Kun-Lai Summit/0 68.69,48.37
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the Arena of Annihilation."_ |script GossipFrame:SelectGossipOption(5)
Enter the Arena of Annihilation Scenario |scenariostart |goto 82.96,30.38
step
click Tiger Temple Gong
Ring the Gong |scenariogoal 1/20810 |goto Proving Grounds/1 48.82,17.03
step
kill Scar-Shell##63311
|tip Crushing Bite reduces the armor of whomever it hits by 50%.
|tip Stone Spin is a whirlwind type attack. Immediately after it finishes, Scar-Shell will gain the Dizzy debuff, increses his damage taken by 50% for a short time.
Slay Scar-Shell |scenariogoal 1/19336 |goto 45.95,51.34
step
click Tiger Temple Gong
Ring the Gong |scenariogoal 2/20810 |goto 48.82,17.03
step
kill Jol'Grum##63312
|tip The tank moving causes his rage bar to build.
|tip If the bar reaches 100, he will become Angry. This is a light enrage.
|tip He will cast Headbutt on the tank which knocks them back.
|tip He will also jump to the middle and use Smash, knocking all players back.
Slay Jol'Grum |scenariogoal 2/19337 |goto 45.95,51.34
step
click Tiger Temple Gong
Ring the Gong |scenariogoal 3/20810 |goto 48.82,17.03
step
kill Little Liuyang##63313
|tip Liuyang will constantly shoot off fireballs and paths of fire. Avoid standing in fire.
|tip At around 40%, Firewall will be cast.
|tip Run counter-clockwise while killing the Flmecoaxing Spirits. Killing them will cause a section of the firewall to vanish.
|tip There are three of them.
Slay Little Liuyang |scenariogoal 3/21922 |goto 45.95,51.34
step
click Tiger Temple Gong
Ring the Gong |scenariogoal 4/20810 |goto 48.82,17.03
step
kill Chagan Firehoof##63318
|tip He will use Trailblaze on a random player. This leaves fire on the ground.
|tip Hammertime does damage to whomever is tanking.
|tip There is no real benefit to killing Batu. Just ignore him and kill Chagan.
Slay Chagan Firehoof |scenariogoal 4/19341 |goto 45.95,51.34
step
click Tiger Temple Gong
Ring the Gong |scenariogoal 5/20810 |goto 48.82,17.03
step
kill Satay Byu##64281
|tip Satay Byu will apply Slowing Poison with his basic attacks.
|tip If Slowing Poison reaches 20 stacks it will root the target in place.
|tip Speed of the Jinja will rapidly strike in front of Satay, run away from this.
Slay Satay Byu |scenariogoal 5/20587 |goto 45.95,51.34
step
talk Wodin the Troll-Servant##63314
turnin The Arena of Annihilation##31207 |goto 50.00,18.59
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 50.00,18.59 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Brewmoon Festival (25-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Brewmoon Festival\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={6923,6931,6930},
patch='100207',
model={43098,43661,43204},
startlevel=25,
endlevel=70,
mapid=884,
pandariaremix=true,
},[[
step
talk Brewmaster Boof##63367
accept The Kun-Lai Kicker##31611 |goto The Veiled Stair/0 51.92,43.74
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the Brewmoon Festival."_ |script GossipFrame:SelectGossipOption(6)
Enter the Brewmoon Festival Scenario |scenariostart |goto 82.96,30.38
step
Follow the path |goto Brewmoon Festival/0 41.47,72.77 < 10 |walk
Follow the path |goto 38.94,70.51 < 10 |walk
kill Den Mother Moof##63518
|tip Kill all of the Virmen to spawn her.
|tip Twirlwind can be interrupted by stunning Moof.
|tip Occasionaly, Moof will burrow underground and summon a few weak Virmen mobs.
Defeat the virmen in the silos |scenariogoal 1/19524 |goto 36.14,68.91
step
Follow the path |goto 37.88,63.88 < 15 |walk
Follow the path |goto 40.45,59.46 < 10 |walk
talk Assistant Tart##62793 |goto 41.97,52.24 < 7
Ask her _"Can you help me get out on the water, Tart?"_
|tip This will grant you the ability to walk on water for five minutes.
kill Li Te##63520
|tip Kill all of the Water Spirits to spawn Li Te.
|tip Li Te will periodically be covered in a water shield. When that happens, kite it over water spouts before they burst.
Defeat Li Te |scenariogoal 1/19525 |goto 43.41,42.24
step
Follow the path |goto Brewmoon Festival/0 49.96,62.78 < 20 |walk
Enter the cave |goto 50.92,85.16 < 20 |walk
kill Karsar the Bloodletter##63529
|tip Karsar the Bloodletter has no aggro table.
|tip Instead, he has an ability called Taste for Blood. This ability causes the highest health party member to automatically have the highest threat.
Defeat Karsar the Bloodletter |scenariogoal 1/19526 |goto 56.52,95.61
step
Leave the cave |goto Brewmoon Festival/0 50.89,85.42 < 20 |walk
Follow the path |goto 45.79,79.09 < 15 |walk
Start brewing the Kun-Lai Kicker |scenariogoal 1/19716 |goto 42.11,67.03
|tip Wait a few moments for this to complete.
step
You must first set up the village defenses before killing all Outrunners
|tip Barrels of Fireworks will allow you to blow up enemies.
|tip Krasarang Wild Brew will pulse fire wherever they are placed.
|tip The Tian Disciple will be dressed in yellow. Talk to them to deploy them.
|tip Vale Marksmen are sleeping pandaren on the ground. Talk to them to deploy them.
|tip Derpa Derpa may be in front of the gong. Talk to him and deploy the item he gives you on the ground. You can keep doing this.
|tip Briaw Shan will give you a Brew Strike ability. Talk to him and have him show you.
|tip If you are solo and cannot get enough defenses, click the Group Finder icon and teleport out and back in.
Set up the village defenses |scenariogoal 2/19529 |goto 44.93,65.81
step
kill Bataari Outrunner##64165+
Defeat the scouts from the Ancient Passage |scenariogoal 2/19531 |goto 45.06,74.29
step
Follow the path |goto 42.15,66.92 < 15 |walk
kill Bataari Outrunner##64165+
Defeat the scouts from the West |scenariogoal 2/19527 |goto 39.37,61.11
step
kill Bataari Outrunner##64165+
Defeat the scouts from the Bridge |scenariogoal 2/19530 |goto 44.01,64.26
step
Kill Bataari enemies around this area
|tip Stage 3 consists of three waves of different Bataari mobs and War Yetis.
|tip Only one War Yeti will spawn per wave and it can be at any of the three attack points.
Stop the waves of Bataari Invaders |scenariogoal 3/19523 |goto 42.40,65.84
step
kill Warbringer Qobi##63528
|tip Kite him out of Oil Slicks.
|tip Avoid standing in fire.
|tip When he is weak, click the axe to do a powerful whilrwind attack.
clicknpc Qobi's Axe##64268
Defeat Warbringer Qobi |scenariogoal 4/19528 |goto 42.47,65.90
step
talk Brewmaster Boof##64901
turnin The Kun-Lai Kicker##31611 |goto 43.76,68.54
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 43.76,68.54 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (25-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Crypt of Forgotten Kings\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7522,7275,8311,8368,7276},
patch='100207',
model={48740,40884},
startlevel=25,
endlevel=70,
mapid=481,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the Crypt of Forgotten Kings."_ |script GossipFrame:SelectGossipOption(4)
Enter the Crypt of Forgotten Kings Scenario |scenariostart |goto 82.96,30.38
step
Go down the stairs |goto Crypt of Forgotten Kings/1 64.05,24.21 < 10 |walk
Follow the path |goto 64.05,31.81 < 15 |walk
Follow the path |goto 57.19,39.00 < 10 |walk
Follow the path |goto 50.68,39.05 < 10 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Jin Ironfist##61814
|tip He will randomly jump to players in your group.
Slay Jin Ironfist |scenariogoal 1/19223 |goto 43.83,39.91
step
Follow the path |goto 46.43,51.84 < 15 |walk
Go down the stairs |goto 46.51,59.19 < 15 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Spawn of Hate##61709 |goto 46.9,58.3
|tip Fight here until the Pool of Life is cleansed.
Cleanse the Pool of Life |scenariogoal 2/20882 |goto 46.51,59.19
step
Go up the stairs |goto 46.57,52.12 < 15
Follow the path |goto 50.65,39.02 < 15 |walk
Follow the path |goto 57.50,39.07 < 10 |walk
Follow the path |goto 64.12,49.00 < 10 |walk
Follow the path |goto 64.09,78.49 < 15 |walk
Follow the path |goto 58.56,80.00 < 7 |walk
Follow the path |goto 58.68,89.12 < 7 |walk
Follow the path |goto 64.22,84.51 < 20 |walk
Follow the path |goto Crypt of Forgotten Kings/2 48.84,86.65 < 10 |walk
Go down the stairs |goto 48.93,69.75 < 10 |walk
Kill enemies along the way
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
Find the source of evil |scenariogoal 3/21041 |goto 48.93,69.75
step
Follow the path |goto 46.21,55.13 < 10 |walk
Follow the path |goto 36.83,38.27 < 10 |walk
Go up the stairs |goto 36.80,29.73 < 10 |walk
Follow the path |goto 43.86,27.72 < 10 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Abomination of Anger##61707
|tip Deathforce will pull you to him. Run out of the red circle that surrounds him as fast as possible to avoid instant death.
|tip He will create red clouds on the ground that move around during the fight. These should be avoided.
Slay the Abomination of Anger |scenariogoal 4/19225 |goto 48.93,35.81
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 48.93,35.81 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Crypt of Forgotten Kings\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={7522,7275,8311,8368,7276},
patch='100207',
model={48740,40884},
startlevel=25,
endlevel=70,
mapid=481,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me of the Crypt of Forgotten Kings (Heroic)."_ |script GossipFrame:SelectGossipOption(2)
Enter the Crypt of Forgotten Kings Scenario |scenariostart |goto 83.05,30.45
step
Go down the stairs |goto Crypt of Forgotten Kings/1 64.05,24.21 < 10 |walk
Follow the path |goto 64.05,31.81 < 15 |walk
Follow the path |goto 57.19,39.00 < 10 |walk
Follow the path |goto 50.68,39.05 < 10 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Jin Ironfist##61814
|tip He will randomly jump to players in your group.
Slay Jin Ironfist |scenariogoal 1/19223 |goto 43.83,39.91
step
Follow the path |goto 46.43,51.84 < 15 |walk
Go down the stairs |goto 46.51,59.19 < 15 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Spawn of Hate##61709 |goto 46.9,58.3
|tip Fight here until the Pool of Life is cleansed.
Cleanse the Pool of Life |scenariogoal 2/20882 |goto 46.51,59.19
step
Go up the stairs |goto 46.57,52.12 < 15
Follow the path |goto 50.65,39.02 < 15 |walk
Follow the path |goto 57.50,39.07 < 10 |walk
Follow the path |goto 64.12,49.00 < 10 |walk
Follow the path |goto 64.09,78.49 < 15 |walk
Follow the path |goto 58.56,80.00 < 7 |walk
Follow the path |goto 58.68,89.12 < 7 |walk
Follow the path |goto 64.22,84.51 < 20 |walk
Follow the path |goto Crypt of Forgotten Kings/2 48.84,86.65 < 10 |walk
Go down the stairs |goto 48.93,69.75 < 10 |walk
Kill enemies along the way
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
Find the source of evil |scenariogoal 3/21041 |goto 48.93,69.75
step
Follow the path |goto 46.21,55.13 < 10 |walk
Follow the path |goto 36.83,38.27 < 10 |walk
Go up the stairs |goto 36.80,29.73 < 10 |walk
Follow the path |goto 43.86,27.72 < 10 |walk
|tip Avoid tiles with red or yellow patterns, or ones with arrows on them.
kill Abomination of Anger##61707
|tip Deathforce will pull you to him. Run out of the red circle that surrounds him as fast as possible to avoid instant death.
|tip He will create red clouds on the ground that move around during the fight. These should be avoided.
Slay the Abomination of Anger |scenariogoal 4/19225 |goto 48.93,35.81
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 48.93,35.81 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Assault on Zan'vess (30-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Assault on Zan'vess\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8016,8017},
patch='100207',
model={46500,29899},
startlevel=30,
endlevel=70,
mapid=883,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the Assault on Zan'vess."_ |script GossipFrame:SelectGossipOption(7)
Enter the Assault on Zan'vess Scenario |scenariostart |goto 82.96,30.38
step
clicknpc Kor'kron Gunship##67275
Join the assault of Zan'vess |scenariogoal 1/22294 |goto Assault on Zan'vess/0 63.08,64.69
step
kill Sonic Control Tower##67279+
|tip Use the first ability on your bar to destroy them.
|tip If you see a missile incoming, use the second ability to raise a shield.
Destroy the Kyparite Quarry Sonic Control Towers |scenariogoal 2/22295 |goto 41.09,84.34
step
kill Zan'thik Guardian##67710+, Sonic Control Tower##67279+
|tip First, you must take out the Guardians channeling the shields.
|tip You will see yellow pools on the ground to indicate their location.
|tip Use the first ability on your bar to destroy them.
|tip If you see a missile incoming, use the second ability to raise a shield.
Destroy the Whispering Stone Sonic Control Towers |scenariogoal 2/22296 |goto 28.65,75.82
step
kill Scorpid Relocator##67784+, Sonic Control Tower##67279+
|tip First, you must take out the scorpids carrying the towers.
|tip Use the first ability on your bar to destroy them.
|tip If you see a missile incoming, use the second ability to raise a shield.
Destroy the Venomsting Pits Stone Sonic Control Towers |scenariogoal 2/22297 |goto 29.41,53.76
step
Follow the path |goto 50.34,45.32 < 15 |walk
Follow the path up |goto 50.56,53.05 < 15 |walk
kill Team Leader Scooter##67810
|tip You can pull the group of enemies before Bosh without engaging him.
Defeat Team Leader Scooter |scenariogoal 3/22300 |goto 51.00,55.69
step
Follow the path up |goto 48.49,55.32 < 15 |walk
Follow the path |goto 45.25,53.30 < 15 |walk
Follow the path |goto 42.25,53.66 < 15 |walk
Reach the Heart of Zan'vess |scenariogoal 3/22301 |goto 40.13,55.32
step
kill Commander Tel'vrak##67879
|tip Periodically, swarms of adds will engage.
|tip Use the special action ability "Strafing Run" to kill them.
|tip Move out of areas targeted on the ground.
Defeat Commander Tel'vrak |scenariogoal 4/22299 |goto 38.62,56.23
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 38.62,56.23 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Battle on the High Seas (40-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Battle on the High Seas\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8347,8315,8366},
patch='100207',
model={48805,48809,48808,48807},
startlevel=40,
endlevel=70,
mapid=940,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me the tale of a Battle on the High Seas."_ |script GossipFrame:SelectGossipOption(12)
Enter the Battle on the High Seas Scenario |scenariostart |goto 82.96,30.38
step
Follow the path |goto Battle on the High Seas/0 36.93,21.16 < 7 |walk
kill Lieutenant Parker##71326
|tip Kill the waves of enemies until he spawns.
Defeat the Alliance Boarding Party |scenariogoal 1/23334 |goto 39.35,21.70
step
Go up the stairs |goto 41.17,22.71 < 5 |walk
clicknpc Transport Cannon##67343 |goto 42.30,21.61 < 7
Use the cannon to reach the next boat |goto 56.70,50.13 |noway |c
step
click Rope Pile##223281 |goto 57.01,53.58
|tip It appears after you clear the boat of enemies.
Use the Rope Pile to reach the next boat |goto 46.09,47.77 |noway |c
step
kill Lieutenant Fuseblast##71328 |goto 47.45,45.27
clicknpc Barrel of Explosives##71106
Acquire the first explosive charge |scenariogoal 2/22261 |goto 47.12,45.55 |count 1
step
Follow the path |goto 42.96,48.67 < 7 |walk
Go down the stairs |goto 42.49,46.26 < 7 |walk
kill Lieutenant Fizzboil##71330 |goto 44.73,46.56
clicknpc Barrel of Explosives##71106
Acquire the second explosive charge |scenariogoal 2/22261 |goto 44.73,46.56 |count 2
step
Follow the path |goto 45.70,47.19 < 5 |walk
Follow the path |goto 47.56,45.68 < 5 |walk
Go down the stairs |goto 48.61,44.28 < 5 |walk
Go down the stairs |goto 45.64,44.86 < 5 |walk
kill Lieutenant Boltblaster##71329 |goto 42.56,47.62
clicknpc Barrel of Explosives##71106
Acquire the third explosive charge |scenariogoal 2/22261 |goto 42.69,47.49 |count 3
step
clicknpc Plant Explosives##67394
Prime the first explosive |scenariogoal 3/22262 |goto 44.77,45.33 |count 1
step
clicknpc Plant Explosives##67394
Prime the second explosive |scenariogoal 3/22262 |goto 45.61,47.49 |count 2
step
clicknpc Plant Explosives##67394
Prime the third explosive |scenariogoal 3/22262 |goto 47.15,45.64 |count 3
step
Go up the stairs |goto 48.31,44.26 < 7 |walk
Go up the stairs |goto 47.46,45.83 < 7 |walk
Follow the path |goto 42.42,46.28 < 7 |walk
Go up the stairs |goto 42.96,48.58 < 7 |walk
click Rope Pile##223281
|tip It's on the top deck of the ship. You'll want to hurry, otherwise you'll blow up with the ship!
Destroy the Alliance ship |scenariogoal 3/22258 |goto 43.94,44.88
step
clicknpc Transport Cannon##67343 |goto 55.07,52.59 < 7
Use the cannon to reach the next boat |goto 59.28,84.55 |noway |c
step
kill Admiral Hodgson##71327
Defeat Admiral Hodgson |scenariogoal 4/23336 |goto 56.00,82.83
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 56.00,82.83 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Battle on the High Seas (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Battle on the High Seas\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8347,8315,8366},
patch='100207',
model={48805,48809,48808,48807},
startlevel=40,
endlevel=70,
mapid=940,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me the tale of a Battle on the High Seas (Heroic)."_ |script GossipFrame:SelectGossipOption(3)
Enter the Battle on the High Seas Scenario |scenariostart |goto 83.05,30.45
step
Follow the path |goto Battle on the High Seas/0 36.93,21.16 < 7 |walk
kill Lieutenant Parker##71326
|tip Kill the waves of enemies until he spawns.
Defeat the Alliance Boarding Party |scenariogoal 1/23334 |goto 39.35,21.70
step
Go up the stairs |goto 41.17,22.71 < 5 |walk
clicknpc Transport Cannon##67343 |goto 42.30,21.61 < 7
Use the cannon to reach the next boat |goto 56.70,50.13 |noway |c
step
click Rope Pile##223281 |goto 57.01,53.58
|tip It appears after you clear the boat of enemies.
Use the Rope Pile to reach the next boat |goto 46.09,47.77 |noway |c
step
kill Lieutenant Fuseblast##71328 |goto 47.45,45.27
clicknpc Barrel of Explosives##71106
Acquire the first explosive charge |scenariogoal 2/22261 |goto 47.12,45.55 |count 1
step
Follow the path |goto 42.96,48.67 < 7 |walk
Go down the stairs |goto 42.49,46.26 < 7 |walk
kill Lieutenant Fizzboil##71330 |goto 44.73,46.56
clicknpc Barrel of Explosives##71106
Acquire the second explosive charge |scenariogoal 2/22261 |goto 44.73,46.56 |count 2
step
Follow the path |goto 45.70,47.19 < 5 |walk
Follow the path |goto 47.56,45.68 < 5 |walk
Go down the stairs |goto 48.61,44.28 < 5 |walk
Go down the stairs |goto 45.64,44.86 < 5 |walk
kill Lieutenant Boltblaster##71329 |goto 42.56,47.62
clicknpc Barrel of Explosives##71106
Acquire the third explosive charge |scenariogoal 2/22261 |goto 42.69,47.49 |count 3
step
clicknpc Plant Explosives##67394
Prime the first explosive |scenariogoal 3/22262 |goto 44.77,45.33 |count 1
step
clicknpc Plant Explosives##67394
Prime the second explosive |scenariogoal 3/22262 |goto 45.61,47.49 |count 2
step
clicknpc Plant Explosives##67394
Prime the third explosive |scenariogoal 3/22262 |goto 47.15,45.64 |count 3
step
Go up the stairs |goto 48.31,44.26 < 7 |walk
Go up the stairs |goto 47.46,45.83 < 7 |walk
Follow the path |goto 42.42,46.28 < 7 |walk
Go up the stairs |goto 42.96,48.58 < 7 |walk
click Rope Pile##223281
|tip It's on the top deck of the ship. You'll want to hurry, otherwise you'll blow up with the ship!
Destroy the Alliance ship |scenariogoal 3/22258 |goto 43.94,44.88
step
clicknpc Transport Cannon##67343 |goto 55.07,52.59 < 7
Use the cannon to reach the next boat |goto 59.28,84.55 |noway |c
step
kill Admiral Hodgson##71327
Defeat Admiral Hodgson |scenariogoal 4/23336 |goto 56.00,82.83
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 56.00,82.83 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Blood in the Snow (40-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Blood in the Snow\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8312,8316,8329,8330},
patch='100207',
model={48111,49055,48308},
startlevel=40,
endlevel=70,
mapid=939,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me the tale of Blood in the Snow."_ |script GossipFrame:SelectGossipOption(13)
Enter the Blood in the Snow Scenario |scenariostart |goto 82.96,30.38
step
Follow the path |goto Blood in the Snow/0 65.86,64.40 < 10 |walk
Follow the path up |goto 60.81,66.77 < 10 |walk
Follow the path up |goto 56.58,66.18 < 10 |walk
talk Mountaineer Grimbolt##70801
Contact the mountaineers |scenariogoal 1/23249 |goto 52.88,67.57
step
Kill Frostmane enemies around this area
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
clicknpc Roasting Spit##70597
Free Stonebeard |scenariogoal 2/23260 |goto 49.59,60.18
step
Follow the path |goto Blood in the Snow/0 47.80,65.84 < 15 |walk
Follow the path |goto 43.90,73.66 < 15 |walk
Kill Frostmane enemies around this area
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Save Boldbrew |scenariogoal 3/23261 |goto 45.41,77.36
step
Follow the path |goto Blood in the Snow/0 37.89,66.27 < 15 |walk
kill Bonechiller Barafu##70468
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Save Forgefellow |scenariogoal 4/23262 |goto 32.46,65.32
step
Follow the path |goto 37.07,62.53 < 15 |walk
Follow the path |goto 37.84,57.43 < 10 |walk
Follow the path |goto 35.66,51.04 < 10 |walk
Cross the bridge |goto 37.16,37.87 < 10 |walk
Follow the path |goto 39.21,32.26 < 15 |walk
Follow the path |goto 46.11,28.46 < 15 |walk
Enter the cave |goto 45.95,24.04 < 7 |walk
kill Farastu##70474
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Slay the Elemental Spirit |scenariogoal 5/23263 |goto 43.46,22.73 < 7
stickystart "Capture_Frostmane_Village"
step
Follow the path |goto Blood in the Snow/0 46.86,25.23 < 15 |walk
Follow the path |goto 46.06,32.69 < 15 |walk
kill Hekima the Wise##70544
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
|tip Make sure you kill any rage banners that spawn during this fight.
Slay Hekima the Wise |scenariogoal 6/23264 |goto 48.20,47.36
step
label "Capture_Frostmane_Village"
Kill Frostmane enemies around this area
Capture the Frostmane village |scenariogoal 6/23265 |goto 47.58,47.81
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 47.58,47.81 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Blood in the Snow (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Blood in the Snow\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8312,8316,8329,8330},
patch='100207',
model={48111,49055,48308},
startlevel=40,
endlevel=70,
mapid=939,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me the tale of Blood in the Snow (Heroic)."_ |script GossipFrame:SelectGossipOption(4)
Enter the Blood in the Snow Scenario |scenariostart |goto 83.05,30.45
step
Follow the path |goto Blood in the Snow/0 65.86,64.40 < 10 |walk
Follow the path up |goto 60.81,66.77 < 10 |walk
Follow the path up |goto 56.58,66.18 < 10 |walk
talk Mountaineer Grimbolt##70801
Contact the Mountaineers |scenariogoal 1/23249 |goto 52.88,67.57
step
Kill Frostmane enemies around this area
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
clicknpc Roasting Spit##70597
Free Stonebeard |scenariogoal 2/23260 |goto 49.59,60.18
step
Follow the path |goto Blood in the Snow/0 47.80,65.84 < 15 |walk
Follow the path |goto 43.90,73.66 < 15 |walk
Kill Frostmane enemies around this area
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Save Boldbrew |scenariogoal 3/23261 |goto 45.41,77.36
step
Follow the path |goto Blood in the Snow/0 37.89,66.27 < 15 |walk
kill Bonechiller Barafu##70468
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Save Forgefellow |scenariogoal 4/23262 |goto 32.46,65.32
step
Follow the path |goto 37.07,62.53 < 15 |walk
Follow the path |goto 37.84,57.43 < 10 |walk
Follow the path |goto 35.66,51.04 < 10 |walk
Cross the bridge |goto 37.16,37.87 < 10 |walk
Follow the path |goto 39.21,32.26 < 15 |walk
Follow the path |goto 46.11,28.46 < 15 |walk
Enter the cave |goto 45.95,24.04 < 7 |walk
kill Farastu##70474
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
Slay the Elemental Spirit |scenariogoal 5/23263 |goto 43.46,22.73 < 7
stickystart "Capture_Frostmane_Village"
step
Follow the path |goto Blood in the Snow/0 46.86,25.23 < 15 |walk
Follow the path |goto 46.06,32.69 < 15 |walk
kill Hekima the Wise##70544
|tip Before initiating combat, use the "Call the Shot" ability on-screen while targeting an elite.
|tip Make sure you kill any rage banners that spawn during this fight.
Slay Hekima the Wise |scenariogoal 6/23264 |goto 48.20,47.36
step
label "Capture_Frostmane_Village"
Kill Frostmane enemies around this area
Capture the Frostmane Village |scenariogoal 6/23265 |goto 47.58,47.81
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 47.58,47.81 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (40-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Dark Heart of Pandaria\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8319,8317,8318},
patch='100207',
model={48854,38305},
startlevel=40,
endlevel=70,
mapid=937,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the unearthing of the Dark Heart of Pandaria."_ |script GossipFrame:SelectGossipOption(14)
Enter the Dark Heart of Pandaria Scenario |scenariostart |goto 82.96,30.38
step
talk Grizzle Gearslip##70956
Talk to Grizzle Gearslip |scenariogoal 1/23071 |goto Dark Heart of Pandaria/0 44.25,38.40
step
kill Urtharges the Destroyer##70959
|tip If you do not outlevel this scenario, you may need to kill mobs until Utharges' shield drops.
Slay Urtharges |scenariogoal 2/23236 |goto 54.35,56.00
step
Click on Artifacts
|tip They are boxes and items marked with a small beam of light.
|tip The gold ones are more valuable and can create a combo making the gathering go by faster.
|tip Just run over them to collect them.
Collect #50# artifacts |scenariogoal 3/23253 |goto 54.35,56.00
step
Follow the path |goto 47.73,63.97 < 15 |walk
Enter the mine |goto Dark Heart of Pandaria/1 75.41,13.37 < 7 |walk
Follow the path |goto 68.32,19.00 < 10 |walk
Follow the path |goto 65.38,29.61 < 10 |walk
Follow the path |goto 48.85,30.71 < 10 |walk
talk Crafty the Ambitious##71358
Tell him _"Everything is fine. Look, there's too much to explain..."_
Destroy the wall |scenariogoal 4/23238 |goto 45.97,35.97
step
Follow the path |goto 44.94,44.29 < 10 |walk
kill Echo of Y'Shaarj##71123
Slay the Echo of Y'Shaarj |scenariogoal 5/23251 |goto 36.45,58.89
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 36.45,58.89 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"Dark Heart of Pandaria\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8319,8317,8318},
patch='100207',
model={48854,38305},
startlevel=40,
endlevel=70,
mapid=937,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me of the unearthing of the Dark Heart of Pandaria (Heroic)."_ |script GossipFrame:SelectGossipOption(5)
Enter the Dark Heart of Pandaria Scenario |scenariostart |goto 83.05,30.45
step
talk Grizzle Gearslip##70956
Talk to Grizzle Gearslip |scenariogoal 1/23071 |goto Dark Heart of Pandaria/0 44.25,38.40
step
kill Urtharges the Destroyer##70959
|tip If you do not outlevel this scenario, you may need to kill mobs until Utharges' shield drops.
Slay Urtharges |scenariogoal 2/23236 |goto 54.35,56.00
step
Click on Artifacts
|tip They are boxes and items marked with a small beam of light.
|tip The gold ones are more valuable and can create a combo making the gathering go by faster.
|tip Just run over them to collect them.
Collect #50# artifacts |scenariogoal 3/23253 |goto 54.35,56.00
step
Follow the path |goto 47.73,63.97 < 15 |walk
Enter the mine |goto Dark Heart of Pandaria/1 75.41,13.37 < 7 |walk
Follow the path |goto 68.32,19.00 < 10 |walk
Follow the path |goto 65.38,29.61 < 10 |walk
Follow the path |goto 48.85,30.71 < 10 |walk
talk Crafty the Ambitious##71358
Tell him _"Everything is fine. Look, there's too much to explain..."_
Destroy the wall |scenariogoal 4/23238 |goto 45.97,35.97
step
Follow the path |goto 44.94,44.29 < 10 |walk
kill Echo of Y'Shaarj##71123
Slay the Echo of Y'Shaarj |scenariogoal 5/23251 |goto 36.45,58.89
step
'|script LeaveInstanceParty()
Leave the Scenario |goto 36.45,58.89 > 1000 |noway |c
|tip Right-click your player frame and select "Leave Instance Group."
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (40-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"The Secrets of Ragefire\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8327,8295,8294},
patch='100207',
model={48881,48758},
startlevel=40,
endlevel=70,
mapid=522,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Fu##78709
|tip Inside the building.
Select _"Tell me of the unearthing of the Secrets of Ragefire."_ |script GossipFrame:SelectGossipOption(15)
Enter the The Secrets of Ragefire Scenario |scenariostart |goto 82.96,30.38
step
Follow the path |goto The Secrets of Ragefire/1 69.33,58.67 < 15 |walk
click Detonator##240525
|tip Wait for the goblins to set the explosive charges.
Breach the main chamber |scenariogoal 1/23213 |goto 63.72,50.64
step
Follow the path |goto 51.67,53.11 < 15 |walk
kill Dark Shaman Xorenth##70683
|tip Kill the waves of enemies.
Defeat the enemy forces |scenariogoal 1/23216 |goto 37.70,46.47
step
clicknpc Supply Crates##71203
Investigate the Supply Crates |scenariogoal 2/23255 |goto 40.17,59.72
step
clicknpc Proto-Drake Eggs##71208
Investigate Proto-drake Eggs |scenariogoal 2/23254 |goto 30.46,52.75
step
clicknpc Pandaria Artifacts##71209
Investigate Pandaria Artifacts |scenariogoal 2/23256 |goto 27.35,41.44
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the first Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 1 |or
step
Deliver the first Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 1
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the second Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 2 |or
step
Deliver the second Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 2
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the third Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 3 |or
step
Deliver the third Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 3
step
clicknpc Broken Proto-Drake Egg##71197
Pick up an Egg Yolk |havebuff Egg Yolk##141914 |goto 29.46,52.14 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Egg Yolk |scenariogoal 3/23309 |goto 38.72,29.39 |or
step
Deliver the Egg Yolk |scenariogoal 3/23309 |goto 38.72,29.39
step
clicknpc Pool Pony##71175
Pick up a Pool Pony |havebuff Pool Pony##141898 |goto 37.81,59.50 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Pool Pony |scenariogoal 3/23308 |goto 38.72,29.39 |or
step
Deliver the Pool Pony |scenariogoal 3/23308 |goto 38.72,29.39
step
clicknpc Battery##49846
Pick up a Battery |havebuff Battery##141904 |goto 39.76,60.61 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 1 |or
step
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 1
step
clicknpc Battery##49846
Pick up a Battery |havebuff Battery##141904 |goto 39.76,60.61 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 2 |or
step
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 2
step
Meet up with Patch and Ticker |scenariogoal 3/23313 |goto 38.72,29.39
step
kill Overseer Elaglo##71030 |goto The Secrets of Ragefire/1 36.9,46.2
|tip You will fight several waves of enemies until Overseer Elaglo spawns.
|tip Be sure to avoid the pulsing areas on the ground from his stomp ability. They do a lot of damage.
Defend the Gob Squad |scenariogoal 4/23311 |goto 37.00,45.89
step
Leave the Scenario |goto 37.00,45.89 > 1000 |c
|tip Step onto the pad to teleport out.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (Heroic)",{
author="support@zygorguides.com",
description="This guide will walk you through the \"The Secrets of Ragefire\" scenario.",
keywords={"mists", "of", "pandaria", "scenario"},
achieveid={8327,8295,8294},
patch='100207',
model={48881,48758},
startlevel=40,
endlevel=70,
mapid=522,
pandariaremix=true,
},[[
step
Enter the building |goto Vale of Eternal Blossoms/0 81.40,31.95 < 10 |walk |only if not subzone("Seat of Knowledge")
talk Lorewalker Shin##78777
|tip Inside the building.
Select _"Tell me of the unearthing of the Secrets of Ragefire (Heroic)."_ |script GossipFrame:SelectGossipOption(6)
Enter the The Secrets of Ragefire Scenario |scenariostart |goto 83.05,30.45
step
Follow the path |goto The Secrets of Ragefire/1 69.33,58.67 < 15 |walk
click Detonator##240525
|tip Wait for the goblins to set the explosive charges.
Breach the main chamber |scenariogoal 1/23213 |goto 63.72,50.64
step
Follow the path |goto 51.67,53.11 < 15 |walk
kill Dark Shaman Xorenth##70683
|tip Kill the waves of enemies.
Defeat the enemy forces |scenariogoal 1/23216 |goto 37.70,46.47
step
clicknpc Supply Crates##71203
Investigate the Supply Crates |scenariogoal 2/23255 |goto 40.17,59.72
step
clicknpc Proto-Drake Eggs##71208
Investigate Proto-drake Eggs |scenariogoal 2/23254 |goto 30.46,52.75
step
clicknpc Pandaria Artifacts##71209
Investigate Pandaria Artifacts |scenariogoal 2/23256 |goto 27.35,41.44
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the first Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 1 |or
step
Deliver the first Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 1
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the second Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 2 |or
step
Deliver the second Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 2
step
clicknpc Cannon Balls##71176
Pick up a Cannon Ball |havebuff Cannon Ball##141832 |goto 26.74,43.11 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the third Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 3 |or
step
Deliver the third Cannon Ball |scenariogoal 3/23307 |goto 38.72,29.39 |count 3
step
clicknpc Broken Proto-Drake Egg##71197
Pick up an Egg Yolk |havebuff Egg Yolk##141914 |goto 29.46,52.14 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Egg Yolk |scenariogoal 3/23309 |goto 38.72,29.39 |or
step
Deliver the Egg Yolk |scenariogoal 3/23309 |goto 38.72,29.39
step
clicknpc Pool Pony##71175
Pick up a Pool Pony |havebuff Pool Pony##141898 |goto 37.81,59.50 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Pool Pony |scenariogoal 3/23308 |goto 38.72,29.39 |or
step
Deliver the Pool Pony |scenariogoal 3/23308 |goto 38.72,29.39
step
clicknpc Battery##49846
Pick up a Battery |havebuff Battery##141904 |goto 39.76,60.61 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 1 |or
step
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 1
step
clicknpc Battery##49846
Pick up a Battery |havebuff Battery##141904 |goto 39.76,60.61 |or
|tip If you get hit by anything in combat, you will drop the item and have to go back and click it again.
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 2 |or
step
Deliver the Batteries |scenariogoal 3/23310 |goto 38.72,29.39 |count 2
step
Meet up with Patch and Ticker |scenariogoal 3/23313 |goto 38.72,29.39
step
kill Overseer Elaglo##71030 |goto The Secrets of Ragefire/1 36.9,46.2
|tip You will fight several waves of enemies until Overseer Elaglo spawns.
|tip Be sure to avoid the pulsing areas on the ground from his stomp ability. They do a lot of damage.
Defend the Gob Squad |scenariogoal 4/23311 |goto 37.00,45.89
step
Leave the Scenario |goto 37.00,45.89 > 1000 |c
|tip Step onto the pad to teleport out.
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Bronze Farming\\Bronze Farming Guide",{
author="support@zygorguides.com",
description="This guide will help you with the easiest method to farm Bronze in MoP Remix.",
patch='100207',
pandariaremix=true,
},[[
step
_NOTE:_
Farm Bronze by Leveling Characters
|tip Leveling characters is the easiest way to farm bronze.
|tip You can do this by questing and using the Leveling guides, or by running dungeons/raids.
|tip On each character you level to 70, you will receive ~70,000 Bronze, or more.
Click Here to Continue |confirm
step
ding 70
step
talk Momentus##21366
accept Infinite Growth##78894 |goto Kun-Lai Summit/0 69.57,52.46 |instant
step
talk Momentus##213664
accept Infinite Growth II##83775 |goto 69.57,52.46 |instant
step
talk Momentus##213664
accept Infinite Growth III##83776 |goto 69.57,52.46 |instant
step
talk Momentus##213664
accept Infinite Growth IV##83777 |goto 69.57,52.46 |instant
step
Purchase Rewards with Bronze |confirm |goto 69.61,53.06
|tip You can use your Bronze to purchase various types of rewards from the vendors around this area.
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Isle of Thunder (50-70)",{
achieveid={8028},
startlevel=50,
patch='100207',
description="This guide will help you unlock the Isle of Thunder.",
pandariaremix=true,
},[[
step
talk Sunwalker Dezco##64566
accept Thunder Calls##32678 |goto Vale of Eternal Blossoms/0 62.92,28.19
step
talk Scout Captain Elsia##70358
turnin Thunder Calls##32678 |goto Townlong Steppes/0 50.79,73.39
accept The Storm Gathers##32680 |goto 50.79,73.39
step
talk Scout Captain Elsia##70358
Tell her _"I'm ready to go."_ |gossip 41771
Speak with Elsia |q 32680/1 |goto 50.79,73.39
step
Watch the dialogue
Begin Flying with Elsia |invehicle |q 32680
step
Watch the dialogue
Discover the Isle of Thunder |q 32680/2
step
Watch the dialogue
Land on The Crimson Treader |outvehicle |goto Isle of Thunder/0 28.39,52.33 |q 32680
step
talk Lor'themar Theron##67990
turnin The Storm Gathers##32680 |goto 28.36,52.41
accept The Assault on Zeb'tula##32212 |goto 28.36,52.41
step
talk Lor'themar Theron##67990
|tip He walks a short distance on the ship.
Tell him _"I am ready! [Queue for solo instance.]"_ |gossip 41876
Speak to Lor'themar Theron |q 32212/1 |goto 28.36,52.41
step
Enter the The Assault on Zeb'tula Scenario |scenariostart |q 32212
|tip Accept the invitation that pops up.
step
clicknpc Sunreaver Bloodhawk##69487
|tip On the deck of the ship.
Ride the Sunreaver Bloodhawk |scenariogoal 1/22673 |goto Isle of Thunder Scenario/0 28.50,52.34 |q 32212
step
Watch the dialogue
Fly with Scout Captain Elsia |scenariogoal 1/22654 |goto 42.69,50.50 |q 32212
step
Rendezvous with Scout Captain Elsia |scenariostage 1 |goto 42.69,50.50 |q 32212
step
Kill Zeb'tula enemies around this area |kill Zeb'tula Raptor##69658,Zeb'tula Beastcaller##69657
|tip Kill the enemies that attack you.
Survive the Ambush |scenariogoal 2/22655 |goto 42.69,50.50 |q 32212
step
Survive the Ambush |scenariostage 2 |goto 42.69,50.50 |q 32212
step
Kill Zandalari and Zeb-tula enemies around this area |kill Zeb'tula Stoneshield##69517,Zandalari Barricade##69516,Zeb'tula Spearanger##69518
Destroy the Barricades and Defenders  |scenariogoal 3/22656 |goto 38.92,43.35 |q 32212
step
Destroy the Barricades |scenariostage 3 |q 32212
step
kill Kresh the Ripper##69474 |scenariogoal 4/22657 |goto 38.71,38.55 |q 32212
step
kill Kresh the Ripper##69474  |scenariostage 4 |goto 38.71,38.55 |q 32212
step
kill Arcanital Tula'chek##69475 |scenariogoal 5/22659 |goto 32.71,35.27 |q 32212
|tip Move him out of the yellow bubbles the mask places on the ground and move into them yourself for damage reduction and silence immunity.
step
Kill Arcanital Tula'chek and His Spirit Mask |scenariostage 5 |goto 32.71,35.27 |q 32212
step
Watch the dialogue
Return to Dawnseeker's Promontory |complete subzone("Dawnseeker's Promontory") |q 32212
step
talk Lor'themar Theron##67990
turnin The Assault on Zeb'tula##32212 |goto Isle of Thunder/0 32.51,35.58
accept Tear Down This Wall!##32276 |goto 32.51,35.58
step
talk Lor'themar Theron##67990
Tell him _"I'm ready to tear down the wall! [Queue for solo instance.]"_ |gossip 41877
Speak to Lor'themar Theron to Begin your Mission |q 32276/1 |goto 32.51,35.58
step
Enter the Tear Down This Wall! Scenario |scenariostart |q 32276
|tip Accept the invitation that pops up.
step
click Heavy Explosives##218197
Acquire the Heavy Explosives |scenariogoal 1/22696 |goto Isle of Thunder Scenario/0 48.41,50.99 |q 32276
step
Acquire the Heavy Explosives |scenariostage 1 |goto 48.41,50.99 |q 32276
step
talk Scout Captain Elsia##69565
Tell her _"Here are the explosives, Elsia."_ |gossip 41588
Deliver the Explosives to Elsia |scenariogoal 2/22700 |goto 55.81,57.75 |q 32276
step
Deliver the Explosives to Elsia |scenariostage 2 |goto 55.81,57.75 |q 32276
step
Watch the dialogue
|tip Wait for Elsia to set the explosives.
click Heavy Explosives
Detonate the Heavy Explosives |scenariogoal 3/22702 |goto 56.26,56.08 |q 32276
step
Detonate the Heavy Explosives |scenariostage 3 |goto 56.26,56.08 |q 32276
step
kill War-God Al'chukla##69755 |scenariogoal 4/23004 |goto 54.73,45.83 |q 32276
step
Secure the Lower City |scenariostage 4 |q 32276
step
click Portal to Isle of Thunder
Return to the Dawnseeker's Promontory |complete subzone("Dawnseeker's Promontory") |goto 54.09,46.27 |q 32276
step
talk Lor'themar Theron##67990
turnin Tear Down This Wall!##32276 |goto Isle of Thunder/0 32.51,35.58
accept To the Skies!##32277 |goto 32.51,35.58
step
talk Lor'themar Theron##67990
Tell him _"I am ready! [Queue for solo instance.]"_ |gossip 41876
Speak to Lor'themar Theron to Begin your Mission |q 32277/1 |goto 32.51,35.58
step
Enter the To the Skies! Scenario |scenariostart |q 32277
|tip Accept the invitation that pops up.
step
clicknpc Thunderwing##69509
Watch the Dialogue
Mount the Thunderwing |scenariogoal 1/22666 |goto Isle of Thunder Scenario/0 32.24,34.33 |q 32277
step
Watch the Dialogue
Approach the Mine Entrace |scenariogoal 1/22667 |goto 53.70,19.46 |q 32277 |notravel
step
Approach the Mine Entrace |scenariostage 1 |goto 53.70,19.46 |q 32277
step
extraaction Jump!##137263
|tip Use the button on the screen to jump to a beastcaller's Thunderwing.
kill Zandalari Beastcaller##69521+
|tip Kill the waves of enemies that attack you and wait to land on the ground after.
Defeat your Attackers! |scenariogoal 2/22668 |q 32277
step
Defeat your Attackers! |scenariostage 2 |q 32277
step
kill Beastmaster Horaki##69559 |scenariogoal 3/22669 |goto 47.82,25.63 |q 32277
|tip Move out of areas targeted on the ground.
step
Defeat Beastmaster Horaki |scenariostage 3 |goto 47.82,25.63 |q 32277
step
Watch the dialogue
talk Taoshi##69810
|tip She will jump down to this spot.
Tell her _"Alright. Let's go."_ |gossip 41898
Join with Taoshi |scenariogoal 4/22738 |goto 49.31,26.00 |q 32277
step
Join with Taoshi |scenariostage 4 |goto 49.31,26.00 |q 32277
step
Watch Taoshi Get Rid of the Cave-in |scenariogoal 5/22740 |goto 49.22,25.57 |q 32277
step
Follow the path |goto Isle of Thunder Scenario/1 44.65,41.46 < 20 |walk
Make your Way to the Mine Entrance |scenariogoal 5/22741 |goto 32.33,58.00 |q 32277
step
Make your Way to the Mine Entrance |scenariostage 5 |goto 32.33,58.00 |q 32277
step
kill Slavemaster Shiaxu##69923 |scenariogoal 6/22672 |goto 28.18,67.47 |q 32277
step
Unlock the Mine Door |scenariogoal 6/22739 |goto 28.18,67.47 |q 32277
|tip This should happen automatically.
step
Unlock the Mine Door |scenariostage 6 |goto 28.18,67.47 |q 32277
|tip This should happen automatically.
step
click Portal to Isle of Thunder
Return to the Dawnseeker's Promontory |complete subzone("Dawnseeker's Promontory") |goto 31.88,83.11 |q 32277
step
talk Lor'themar Theron##67990
turnin To the Skies!##32277 |goto Isle of Thunder/0 32.91,32.58
step
talk Taoshi##70297
accept Decisive Action##32278 |goto 32.89,32.68
step
talk Taoshi##70297
Tell her _"I'm with you. Let's break into that shipyard! [Queue for solo instance.]"_ |gossip 41662
|tip Accept the invitation that pops up.
Infiltrate Stormsea Landing |scenariostart |goto 32.89,32.68 |q 32278
step
Watch the dialogue
clicknpc Thunderwing##69458
Mount the Thunderwing |invehicle |goto Isle of Thunder Scenario/0 63.29,54.35 |q 32278
step
Watch the dialogue
Intercept the Zandalari Patrol |scenariogoal 1/22661 |q 32278
step
Watch the dialogue
Intercept the Zandalari Patrol |scenariostage 1 |q 32278
step
Deactvate #10# Sentry Totems |scenariogoal 2/23007 |goto 62.35,41.39 |q 32278
|tip Use the "Smoke Bomb" ability on your vehicle bar.
|tip Sentry Totems are at the center of the circles.
|tip Destroy a clear path from the ship, up the hill to the courtyard.
step
Deactvate #10# Sentry Totems |scenariostage 2 |q 32278
step
Watch the dialogue
Reach the Ship |outvehicle |goto 68.99,45.00 |notravel |q 32278
stickystart "Trap_Siege_Weapons"
step
kill Veteran Wingrider##69552+
|tip Stay close to Taoshi to maintain stealth.
|tip The red circle around you is the radius in which enemies can see you while facing you.
|tip Follow Taoshi and neutralize the enemies with a red arrow above their head.
extraaction Knock Out##137311
Neutralize #7# Marked Crew Members |scenariogoal 3/23003 |goto 67.29,46.79 |q 32278
step
label "Trap_Siege_Weapons"
Trap #4# Siege Weapons |scenariogoal 3/22663 |goto 67.29,46.79 |q 32278
|tip Taoshi will do this automatically when she gets near them.
step
Neutralize the Defenses |scenariostage 3 |q 32278
step
Go down into the ship |goto 68.60,45.63 < 4 |walk
kill Captain Halu'kal##69482 |scenariogoal 4/22664 |goto 67.13,47.47 |q 32278
|tip Follow Taoshi down into the ship.
|tip The captain will wake up and attack you.
|tip Kill any enemies that wake up and move out of stuff on the ground.
step
kill Captain Halu'kal##69482 |scenariostage 4 |goto 67.13,47.47 |q 32278
step
Leave the ship |goto 67.21,45.36 < 10 |walk
Locate Hu'seng the Gatekeeper |scenariogoal 5/22665 |goto 59.04,43.76 |q 32278
|tip Stay near Taoshi to maintain your stealth.
|tip Make your way up the hill and into the courtyard along the path you cleared with the smoke bombs.
|tip Avoid the blue circles on the ground that will reveal your location.
step
Locate Hu'seng the Gatekeeper |scenariostage 5 |goto 59.04,43.76 |q 32278
step
kill Hu'seng the Gatekeeper##69483 |scenariogoal 6/22667 |goto 59.04,43.76 |q 32278
step
collect Gatekeeper's Orb##94918 |scenariogoal 6/22810 |goto 59.04,43.76 |q 32278
|tip Loot it from Hu'seng the Gatekeeper's corpse.
step
Light Up the Night |scenariostage 6 |goto 59.04,43.76 |q 32278
step
click Deactivated Access Generator
Open the Gate |scenariogoal 7/22809 |goto 58.37,42.78 |q 32278
step
Open the Gate |scenariostage 7 |goto 58.37,42.78 |q 32278
step
click Portal to Dawnseeker's Promontory
Return to the Dawnseeker's Promontory |complete subzone("Dawnseeker's Promontory") |goto 57.79,41.87 |q 32278
step
talk Lor'themar Theron##67990
turnin Decisive Action##32278 |goto Isle of Thunder/0 32.51,35.58
accept The Fall of Shan Bu##32279 |goto 32.51,35.58
step
talk Lor'themar Theron##67990
Tell him _"I am ready to launch the assault [Queue for solo instance.]"_ |gossip 41878
Speak to Lor'themar Theron |q 32279/1 |goto 32.51,35.58
step
Enter The Fall of Shan Bu Scenario |scenariostart |q 32279
|tip Accept the invitation that pops up.
step
talk Scout Captain Elsia##69620
Tell her _"I am ready."_ |gossip 41897
Speak with your Assault Leader |scenariogoal 1/22742 |goto Isle of Thunder Scenario/0 56.07,39.20 |q 32279
step
Watch the dialogue
|tip Elsia will open the doors.
Enter the Courtyard |scenariogoal 1/22799 |goto 57.09,40.83 |q 32279
step
kill 14 Zandalari Stoneshield##69527 |scenariogoal 1/22675 |goto 58.07,40.75 |q 32279
step
Retake the Bloodied Crossing |scenariostage 1 |q 32279
step
kill 2 Palace Gatekeeper##69510 |scenariogoal 2/22685 |goto 58.06,40.81 |q 32279
step
kill 2 Palace Gatekeeper##69510 |scenariostage 2 |q 32279
step
Watch the dialogue
|tip Taran Zhu will open the door.
Follow Taran Zhu into the Courtyard |scenariogoal 3/22807 |goto 59.76,38.05 |q 32279
step
Kill enemies around this area |kill Quilen Guardian##69506, Zandalari Stoneshield##69865, Shan'ze Electrocutioner##69525
|tip Taran Zhu will remove the barrier.
|tip Stand in the light for healing.
Slay #8# Zandalari and Mogu |scenariogoal 3/22734 |goto 59.76,38.05 |q 32279
step
Defeat Zandalri and Mogu |scenariostage 3 |q 32279
step
kill Shan Bu##69534 |scenariogoal 4/22683 |goto 60.34,37.30 |q 32279
|tip Move out of areas targeted on the ground.
|tip Kill any minor adds that attack.
|tip Stand in the light for healing.
step
kill Shan Bu##69534 |scenariostage 4 |q 32279
step
click Portal to the Isle of Thunder
Return to the Dawnseeker's Promontory |complete subzone("Dawnseeker's Promontory") |goto 56.82,40.44 |q 32279
step
talk Lor'themar Theron##67990
turnin The Fall of Shan Bu##32279 |goto Isle of Thunder/0 32.5,35.5
accept Allies in the Shadows##32709 |goto 32.5,35.5
step
talk Taran Zhu##70160
|tip Inside the cave.
turnin Allies in the Shadows##32709 |goto 51.42,46.08
accept Secrets in the Isle of Thunder##32707 |goto 51.42,46.08
step
collect 3 Shan'ze Ritual Stone##94221 |q 32707/1
|tip You can loot these from rares on Isle of Thunder.
|tip These can be looted once per week.
step
talk Taran Zhu##70160
|tip Inside the cave.
turnin Secrets in the Isle of Thunder##32707 |goto 51.42,46.08
accept Setting the Trap##32708 |goto 51.42,46.08
]])
ZygorGuidesViewer:RegisterGuide("Daily Guides\\Pandaria Remix (10-70)\\Timeless Isle Dailies (45-70)",{
startlevel=45,
description="This guide will help you complete the dailies on the Timeless Isle. Completing these dailies awards you with Timeless Coins.",
pandariaremix=true,
},[[
step
Routing to proper section |next "prequests" |only if not completedq(33333)
Routing to proper section |next "dailies" |only if completedq(33333)
step
label "prequests"
Click the _Quest Accept_ Box:
accept A Flash of Bronze...##33230 |goto Vale of Eternal Blossoms 61.7,20.4
|tip If you have already been to Timeless Isle, this quest will not be available.
Click here if this quest is unavailable |confirm
step
talk Chromie##73691
|tip On the upper balcony of the palace.
turnin A Flash of Bronze...##33230 |goto Vale of Eternal Blossoms 80.65,33.17 |only if haveq(33230)
accept Journey to the Timeless Isle##33232 |goto 80.65,33.17
step
use Curious Bronze Timepiece##104110
You will be teleported to the Timeless Isle |goto Timeless Isle/0 21.3,39.5 |noway |c
step
talk Chi-Ro the Skytamer##71939 |only Horde
fpath Huojin Landing |goto 21.9,39.8 |only Horde
step
talk Watcher Alundra##73353
turnin Journey to the Timeless Isle##33232 |goto 22.0,41.0
accept Time Keeper Kairoz##33156 |goto 22.0,41.0
step
talk Kairoz##72870
turnin Time Keeper Kairoz##33160 |goto 34.5,53.8
accept A Timeless Tour##33161 |goto 34.5,53.8
accept Time In Your Hands##33228 |goto 34.5,53.8
step
Explore The Misty Strand |q 33161/4 |goto 24.6,31.8
step
Explore Cavern of Lost Spirits |q 33161/1 |goto 42.9,41.9
step
Explore Red Stone Run |q 33161/6 |goto 50.9,46.6
step
Explore Firewalkers' Path |q 33161/3 |goto 50.4,78.5
step
Explore Old Pi'jiu |q 33161/5 |goto 37.5,75.5
step
Explore Croaking Hollow |q 33161/2 |goto 60.5,72.6
step
talk Kairoz##72870
turnin A Timeless Tour##33161 |goto 34.5,53.8
accept The Essence of Time##33336 |goto 34.5,53.8
step
kill Brilliant Windfeather##72762+, Windfeather Chick##71143+
collect Epoch Stone##105715 |q 33336/1 |goto 32.2,51.9
step
talk Kairoz##72870
turnin The Essence of Time##33336 |goto 34.5,53.5
step
talk Mistweaver Ai##73305
Meet Mistweaver Ai |q 33228/2 |goto 42.8,55.7
step
talk Mistweaver Ku##73306
Meet Mistweaver Ku |q 33228/3 |goto 42.8,54.7
step
kill Ironfur Herdling##72842+, Ironfur Grazer##72843+, Ironfur Great Bull##72844+
kill Windfeather Chick##71143+, Windfeather Nestkeeper##72761+, Brilliant Windfeather##72762+
earn 1000 Timeless Coin##777 |q 33228/1 |goto 43.9,55.4
step
talk Kairoz##72870
turnin Time In Your Hands##33228 |goto 34.6,53.7
accept Hints From The Past##33332 |goto 34.6,53.7
accept The Last Emperor##33335 |goto 34.6,53.7
step
talk Mistweaver Ai##73305
buy Time-Worn Journal##103977 |goto 42.8,55.6
step
talk Emperor Shaohao##73303
Speak with Emperor Shaohao |q 33335/1 |goto 42.9,55.2
step
talk Emperor Shaohao##73303
turnin The Last Emperor##33335 |goto 42.9,55.2
accept Timeless Nutriment##33340 |goto 42.9,55.2
step
click Ripe Crispfruit##221689
Consume a Timeless Nutriment |q 33340/1 |goto 42.8,53.3
step
talk Emperor Shaohao##73303
turnin Timeless Nutriment##33340 |goto 42.9,55.2
accept Wayshrines Of The Celestials##33341 |goto 42.9,55.2
step
Follow the path to activate one of the Shrines.
map Timeless Isle
path	30.1,45.7	26.8,52.2	30.5,62.6
path	27.9,72.0	37.4,74.4	49.7,70.4
path	66.1,72.3	63.9,50.7	35.0,29.6
click Celestial Shrine
|tip They are on a 10-15 minute cooldown, so just keep running around until you find an active one.
Receive a Blessing of the Celestials |q 33341/1
step
talk Emperor Shaohao##73303
turnin Wayshrines Of The Celestials##33341 |goto 42.9,55.2
step
talk Kairoz##72870
turnin Hints From The Past##33332 |goto 34.5,53.8
accept Timeless Treasures##33333 |goto 34.5,53.8
step
click Moss-Covered Chest##223089
Find the Hidden Treasure |q 33333/1 |goto 46.8,46.8
step
talk Kairoz##72870
turnin Timeless Treasures##33333 |goto 34.6,53.8
step
label "dailies"
talk Emperor Shaohao##73303
accept Path of the Mistwalker##33374 |goto Timeless Isle 42.9,55.3
step
talk Kairoz##72870
accept Strong Enough To Survive##33334 |goto Timeless Isle 34.6,53.7
accept Empowering the Hourglass##33338 |goto Timeless Isle 34.6,53.7
|tip These are weekly quests.
step
label "rares"
This quest requires you to kill 5 _rare spawns_ on the Timeless Isle.
Most of the spawns are on a timer, so you will need to wait for them to respawn. If there are other conditions, they are listed with the mob.
|tip It's recommended that you have at least 1-2 other people helping you with this, as some of the rare spawns have a lot of health.
confirm
step
kill Monstrous Spineclaw##73166
Click here if he is not available or you have just killed him |confirm |next
Kill #5# rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 26.9,76.4 |next "out"
step
kill Great Turtle Furyshell##73161
Click here if he is not available or you have just killed him |confirm |next
Kill #5# rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 25.6,55.5 |next "out"
step
kill Chelon##72045
Click here if he is not available or you have just killed him |confirm |next
Kill #5# rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 25.2,35.7 |next "out"
step
kill Ironfur Steelhorn##73160
|tip He can spawn in the place of any of the steelhorns in this area.
Click here if he is not available or you have just killed him |confirm |next
Kill #5# rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 37.3,43.0 |next "out"
step
kill Spirit of Jadefire##72769
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/22 56.0,30.7 |next "out"
step
kill Rock Moss##73157
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/22 45.4,29.4 |next "out"
step
kill Tsavo'ka##72808
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 54.6,44.3 |next "out"
step
Wait for the cave-in, then click the hammer that spawns here. It may take a minute for the hammer to spawn, but it shouldn't be too long. |goto Timeless Isle/0 59.2,48.3
confirm
step
clicknpc Cave-In##73329
kill Spelurk##71864+
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 59.1,48.6 |next "out"
step
kill Golganarr##72970
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 62.5,63.5 |next "out"
step
kill Bufo##72775 |tip Bufo cn spawn in the place of any Gulp Frog in this area.
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 62.7,74.6 |next "out"
step
kill Rattleskew##72048
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 60.7,88.0 |next "out"
step
kill Zesqua##72245
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 46.9,87.3 |next "out"
step
talk Fin Longpaw##72151
Ask him to fish up Karkanos for you. |goto Timeless Isle/0 34.0,83.8
confirm
step
kill Karkanos##72193
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 34.2,84.7 |next "out"
step
kill Gu'chi the Swarmbringer##72909
|tip He walks around the village here, so some searching may be necessary.
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 40.4,78.0 |next "out"
step
kill Skunky Brew Alemental##71908+ |goto Timeless Isle/0 38.0,77.6
|tip You will have to wait for these to spawn as a random event. After killing 10, Zhu-Gon will spawn.
confirm
step
kill Zhu-Gon the Sour##71919+
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 38.0,77.6 |next "out"
step
kill Cranegnasher##73854
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 44.5,69.0 |next "out"
step
kill Imperial Python##73163
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle 44.4,65.5 |next "out"
step
kill Emerald Gander##73158
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 40.7,68.8 |next "out"
step
kill Jakur of Ordon##73169
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 51.5,83.3 |next "out"
step
kill Watcher Osu##73170
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 57.5,77.1 |next "out"
step
kill Champion of the Black Flame##73171
|tip The all 3 walk up and down this path here, some searching may be necessary.
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 70.9,49.9 |next "out"
step
kill Huolon##73167
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 72.9,48.7 |next "out"
step
kill Leafmender##73277
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 67.3,44.1 |next "out"
step
kill Cinderfall##73175 |tip On the bridge up above.
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 54.0,52.4 |next "out"
step
kill Garnia##73282
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 64.8,28.8 |next "out"
step
kill Flintlord Gairan##73172
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle 48.2,38.4 |next "out"
step
kill Urdur the Cauterizer##73173
Click here if he is not available or you have just killed him |confirm |next
Kill 5 rares on the Timeless Isle |q 33334/1 |goto Timeless Isle/0 45.4,26.6 |next "out"
step
kill Evermaw##73279
He swims in a circle around the isle. He's very fast, so you will either need some kind of water-walking, or the Cursed Swabby Helmet in order to fight him.
He has also been found around the following coordinates:
_ [14.5,56.5]
_ [16.1,63.9]
_ [33.3,2.6]
_ [63.4,6.9]
_ [79.6,30.4]
_ [79.0,70.0]
_ [75.0,84.0]
_ [55.0,91.0]
_ [30.0,89.0]
collect 1 Mist-Filled Spirit Lantern##104115
|tip This is a guaranteed drop.
Click here if he is not available or you have just killed him |confirm |goto Timeless Isle/0 14.1,37.5 |next "rares"
Kill 5 rares on the Timeless Isle |q 33334/1 |next "out"
step
label "out"
kill Ironfur Great Bull##72844+
kill Brilliant Windfeather##72762+
kill Death Adder##72841+
kill Great Turtle##72764+
kill Elder Great Turtle##72765+
Kill 20 Elite creatures on the Timeless Isle |q 33374/1 |goto Timeless Isle 27.0,58.6
step
kill Ironfur Great Bull##72844+, Ironfur Herdling##72842+, Ironfur Grazer##72843+
kill Great Turtle##72764+, Great Turtle Hatchling##72763+, Elder Great Turtle##72765+
kill Windfeather Chick##71143+, Windfeather Nestkeeper##72761+, Brilliant Windfeather##72762+
kill Death Adder##72841+
collect 50 Epoch Stone##105715 |q 33338/1 |goto Timeless Isle 27.0,58.6
step
talk Senior Historian Evelyna##73570
accept A Timeless Question##33211 |goto Timeless Isle/0 65.0,50.5
step
talk Senior Historian Evelyna##73570
Answer a question about Warcraft's lore. |q 33211/1 |goto Timeless Isle/0 65.0,50.5
|tip If you miss it, don't worry, you can just keep guessing until you get one right.
step
talk Senior Historian Evelyna##73570
turnin A Timeless Question##33211 |goto Timeless Isle/0 65.0,50.5
step
talk Emperor Shaohao##73303
turnin Path of the Mistwalker##33374 |goto Timeless Isle 42.9,55.3
step
talk Kairoz##72870
turnin Strong Enough To Survive##33334 |goto Timeless Isle 34.6,53.7
turnin Empowering the Hourglass##33338 |goto Timeless Isle 34.6,53.7
step
label "end"
You have reached the end of the guide for today.
Click here to go back to the beginning of the dailies. |confirm |next "dailies"
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Pandaria Remix (10-70)\\Dominance Offensive",{
startlevel=15,
description="This guide will take you through quests for the Dominance Offensive. Becoming Exalted with the Dominance Offensive allows you to purchase an epic flying mount, epic armor, and battle pets for your character.",
},[[
step
talk Sunwalker Dezco##64566
accept Meet the Scout##32249 |goto Vale of Eternal Blossoms/0 62.92,28.17
step
talk Scout Rokla##67812
turnin Meet the Scout##32249 |goto Krasarang Wilds/0 8.73,64.36
step
Watch the dialogue
talk Garrosh Hellscream##62092
|tip He will eventually reach the beach.
accept The Might of the Warchief##32250 |goto 8.67,64.45
stickystart "Slay_Alliance_Troops"
step
talk Blood Guard Gro'tash##67927
|tip Kill any enemies he is attacking.
Find Blood Guard Gro'tash |q 32250/2 |goto 10.70,53.16
step
talk Grizzle Gearslip##67926
|tip Kill any enemies he is attacking.
Find Grizzle Gearslip |q 32250/3 |goto 15.73,57.76
step
label "Slay_Alliance_Troops"
Kill Alliance enemies around this area |kill Alliance Sentinel##67900,Alliance Footman##67901,Alliance Priest##67902
Slay #25# Alliance |q 32250/1 |goto 11.51,61.24
step
_Next to you:_
talk Garrosh Hellscream##62092
turnin The Might of the Warchief##32250 |goto 11.51,61.24
accept Domination Point##32108 |goto 11.51,61.24
step
click Signal Fire##216274
turnin Domination Point##32108 |goto 8.46,63.92
step
talk Kromthar##67785
fpath Domination Point |goto 9.69,52.51
step
Reach 950/6000 Friendly with the Dominance Offensive Faction |complete repval("Dominance Offensive",Friendly) >= 950
step
talk General Nazgrim##67939
accept Rise Of An Empire##32256 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to the Shrine of Two Moons."_ |gossip 40755
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32256
step
Watch the dialogue
Reach The Golden Terrace |outvehicle |goto Vale of Eternal Blossoms/0 59.10,20.19 |q 32256 |notravel
step
Find Garrosh at the Shrine of Two Moons |q 32256/1 |goto Shrine of Two Moons/2 32.20,84.59
|tip Upstairs inside the building.
step
talk Garrosh Hellscream##67840
|tip Upstairs inside the building.
turnin Rise Of An Empire##32256 |goto 32.20,84.59
accept Buried Secrets##32242 |goto 32.20,84.59
step
talk Fanlyr Silverthorn##67834
turnin Buried Secrets##32242 |goto Vale of Eternal Blossoms/0 20.95,15.58
accept Voice of the Gods##32257 |goto 20.95,15.58
step
click Mercurial Guardian
Investigate the Mercurial Guardian |q 32257/1 |goto 18.11,11.85
step
kill Mercurial Guardian##67833
|tip It will come to life and attack you.
collect Ancient Korune Tablet##92425 |q 32257/2 |goto 18.11,11.85
step
talk Fanlyr Silverthorn##67834
turnin Voice of the Gods##32257 |goto 20.95,15.58
step
Reach 4900/6000 Friendly with the Dominance Offensive Faction |complete repval("Dominance Offensive",Friendly) >= 4900
step
talk Messenger Grummle##67865
accept Someone You Should See##32284 |goto Krasarang Wilds/0 10.69,53.69
step
talk Tak-Tak##68681
Tell him _"Take me to Binan Village."_ |gossip 40754
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32284
step
Watch the dialogue
Reach Binan Village |outvehicle |goto Kun-Lai Summit/0 72.44,94.11 |q 32284 |notravel
step
Find Chen Stormstout at Binan Village |q 32284/1 |goto 71.66,93.22
|tip Inside the building.
step
talk Chen Stormstout##67866
|tip Inside the building.
turnin Someone You Should See##32284 |goto 71.66,93.22
accept Regeneration Takes Time##32318 |goto 71.66,93.22
step
Kill enemies around this area |kill Summit Sprite##68026,Sinister Needle##68027
|tip All over the cliffs.
collect 10 Sturdy Needle##92499 |q 32318/1 |goto 21.85,41.49
step
talk Chen Stormstout##67866
|tip Inside the building.
turnin Regeneration Takes Time##32318 |goto 71.66,93.22
step
talk Vol'jin##68023
|tip Inside the building.
accept Find Thrall!##32319 |goto 71.63,93.20
step
use Vol'jin's Hearthstone##92510
Use Vol'jin's Hearthstone |q 32319/1 |goto 71.63,93.20
step
talk Thrall##68025
turnin Find Thrall!##32319 |goto Valley of Trials/0 44.61,66.73
accept The Horde Is Family##32320 |goto 44.61,66.73
step
kill Kor'kron Soulbreaker##68342
|tip Stay close to thrall and follow him to the Echo Isles.
|tip The Kor'kron Soulbreaker will attack you after they talk.
Escort Thrall to the Echo Isles |q 32320/1 |goto Echo Isles/0 38.51,46.45
step
talk Thrall##68025
turnin The Horde Is Family##32320 |goto 38.39,46.47
accept De-Subjugation##32372 |goto 38.39,46.47
stickystart "Kill_Kor'kron_Overseers"
stickystart "Kill_Kor'kron_Subjugators"
step
kill Gul'tar the Subjugator##68048 |q 32372/3 |goto 61.86,66.25
|tip Inside the building.
|tip He is elite, but easy to kill.
|tip You will get help from other NPCs during the battle.
step
label "Kill_Kor'kron_Overseers"
kill 10 Kor'kron Overseer##68041 |q 32372/1 |goto 56.53,51.82
step
label "Kill_Kor'kron_Subjugators"
kill 5 Kor'kron Subjugator##68044 |q 32372/2 |goto 56.53,51.82
step
talk Thrall##68025
turnin De-Subjugation##32372 |goto 58.59,62.02
step
click Portal to Domination Point
Take the Portal to Domination Point |complete subzone("Domination Point") or completedq(32190) |goto 58.86,61.16
step
Reach 2850/12000 Honored with the Dominance Offensive Faction |complete repval("Dominance Offensive",Honored) >= 2850
step
talk General Nazgrim##67939
accept To Mogujia##32190 |goto Krasarang Wilds 10.4,53.7
step
talk Tak-Tak##68681
Tell him _"Take me to Mogujia."_ |gossip 40753
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32190
step
Watch the dialogue
Take Tak-Tak's kite to Mogujia |q 32190/1 |goto Kun-Lai Summit/0 57.40,78.80 |notravel
step
talk Lor'themar Theron##67581
turnin To Mogujia##32190 |goto 57.07,79.01
accept Bloodlines##32192 |goto 57.07,79.01
step
talk Fanlyr Silverthorn##67603
accept Ancient Guardians##32191 |goto 57.12,78.59
accept The Korune##32244 |goto 57.12,78.59
stickystart "Free_Blood_elves"
stickystart "Kill_Korune_Guardians"
step
kill Korune Spellweaver##67752
|tip Loot it from the spellweaver.
collect Korune Codex##92072 |q 32244/1 |goto 58.12,70.92
step
label "Free_Blood_elves"
kill Korune Warden##67587+
|tip They are next to floating captive Blood Elves.
Free #6# Blood Elves |q 32192/1 |goto 58.13,75.19
step
label "Kill_Korune_Guardians"
kill 5 Korune Guardian##67574+ |q 32191/1 |goto 58.13,75.19
step
talk Fanlyr Silverthorn##67603
turnin Ancient Guardians##32191 |goto 57.12,78.59
turnin The Korune##32244 |goto 57.12,78.59
step
talk Lor'themar Theron##67581
turnin Bloodlines##32192 |goto 57.07,79.01
step
Reach 6800/12000 Honored with the Dominance Offensive Faction |complete repval("Dominance Offensive",Honored) >= 6800
step
talk General Nazgrim##67939
accept To the Valley!##32376 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to the Valley of Emperors."_ |gossip 40752
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32376
step
Watch the dialogue
Find Your "Friend From Silvermoon" |q 32376/1 |goto Kun-Lai Summit/0 53.84,49.01 |notravel
step
talk Lor'themar Theron##68370
turnin To the Valley!##32376 |goto 53.83,49.23
accept Legacy of the Korune##32379 |goto 53.83,49.23
accept Clearing a Path##32378 |goto 53.83,49.23
stickystart "Collect_Sealed_Korune_Artifact"
stickystart "Slay_Korune_Mogu"
step
click Legacy of the Korune
collect Legacy of the Korune##92802 |q 32379/2 |goto 56.93,47.74
step
kill Korune Mutilator##68401+
collect Korune Orders##92801 |q 32379/1 |goto 55.43,47.25
step
label "Collect_Sealed_Korune_Artifact"
kill Korune Sha-weaver##68410+
collect Sealed Korune Artifact##92803 |q 32379/3 |goto 55.43,47.25
step
label "Slay_Korune_Mogu"
Kill Korune enemies around this area |kill Korune Sha-weaver##68410,Korune Mutilator##68401
Slay #10# Korune Enemies |q 32378/1 |goto 55.43,47.25
step
talk Lor'themar Theron##68370
turnin Clearing a Path##32378 |goto 53.83,49.23
turnin Legacy of the Korune##32379 |goto 53.83,49.23
accept Trapping the Leader##32384 |goto 53.83,49.23
step
Enter the tomb here |goto 55.91,46.15 < 15 |walk
kill Shan Kien##68378
|tip Inside the tomb.
Weaken Shan Kien |q 32384/1 |goto 56.74,44.10
step
talk Lor'themar Theron##68370
turnin Trapping the Leader##32384 |goto 53.83,49.23
step
Reach 10750/12000 Honored with the Dominance Offensive Faction |complete repval("Dominance Offensive",Honored) >= 10750
step
talk General Nazgrim##67939
accept Echoes of Thunder##32351 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to the Shrine of Two Moons."_ |gossip 40755
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32351
step
Watch the dialogue
Reach the Shrine of Two Moons |outvehicle |goto Vale of Eternal Blossoms/0 59.10,20.30 |q 32351 |notravel
step
Find Baine Bloodhoof at the Shrine of Two Moons |q 32351/1 |goto Shrine of Two Moons/2 68.58,43.85
|tip Upstairs inside the building.
step
talk Baine Bloodhoof##68287
|tip Upstairs inside the building.
turnin Echoes of Thunder##32351 |goto 68.58,43.85
accept A Gathering Storm##32352 |goto 68.58,43.85
step
clicknpc Sha-Touched Grunt##68284+
|tip They look like black and white NPCs laying on the ground on shifting patches of black inside the building.
kill Sha-Touched Grunt##68284+
Save #6# Sha-Touched Grunts |q 32352/1 |goto Shrine of Two Moons/1 51.12,62.76
step
talk Garrosh Hellscream##67840
|tip Upstairs inside the building.
turnin A Gathering Storm##32352 |goto Shrine of Two Moons/2 65.38,46.37
step
Reach 2700/12000 Revered with the Dominance Offensive Faction |complete repval("Dominance Offensive",Revered) >= 2700
step
talk General Nazgrim##67939
accept Get My Results!##32329 |goto Krasarang Wilds/0 10.38,53.71
step
click Portal to Silvermoon City
Take the Portal to Silvermoon City |q 32329/1 |goto 10.32,53.64
step
talk Lor'themar Theron##16802
turnin Get My Results!##32329 |goto Silvermoon City/0 53.81,20.26
accept What's in the Box?##32330 |goto 53.81,20.26
step
talk Arcanis Mechanica##68430
Locate the Arcanis Mechanica |q 32330/1 |goto 86.60,32.70
step
talk Archmage Aethas Sunreaver##68086
|tip Jump down the hole in the upper rome.
Tell him _"Lor'themar wants a status update on the experiment."_ |gossip 41499
Speak with Archmage Aethas Sunreaver |q 32330/2 |goto 92.24,37.82
step
talk Grand Magister Rommath##68085
Tell him _"Lor'themar wants a status update on the experiment."_ |gossip 41500
Speak with Grand Magister Rommath |q 32330/3 |goto 92.32,37.15
step
click Intensifier Disc
|tip On the face of the large box.
Watch the dialogue
kill Concentrated Sha##68259 |q 32330/4 |goto 92.46,37.57
step
talk Lor'themar Theron##68084
turnin What's in the Box?##32330 |goto 91.13,37.52
step
click Portal to Domination Point
Return to Domination Point |complete subzone("Domination Point") or completedq(32363) |goto 86.37,32.92
step
Reach 6650/12000 Revered with the Dominance Offensive Faction |complete repval("Dominance Offensive",Revered) >= 6650
step
talk General Nazgrim##67939
accept The Kun-Lai Expedition##32363 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to Garrosh'ar Advance."_ |gossip 40750
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32363
step
Watch the dialogue
Take Tak-Tak's Kite to Garrosh'ar Advance |q 32363/1 |goto Kun-Lai Summit/0 60.58,55.09 |notravel
step
talk Baine Bloodhoof##68287
turnin The Kun-Lai Expedition##32363 |goto 60.35,55.14
accept Ties with the Past##32448 |goto 60.35,55.14
step
Enter the cave |goto 63.20,42.18 < 20
kill Varatus the Conqueror##68907
|tip Inside the cave.
collect Spirit Essence of Varatus##93212 |q 32448/1 |goto 63.92,45.12
step
talk Baine Bloodhoof##68287
turnin Ties with the Past##32448 |goto 60.35,55.14
accept Memory Wine##32368 |goto 60.35,55.14
step
use the Memory Wine##92756
Drink the Memory Wine |q 32368/1 |goto 60.35,55.14
step
Watch the dialogue
Witness Shan Kien's Past |q 32368/2
step
talk Baine Bloodhoof##68287
turnin Memory Wine##32368 |goto 60.35,55.14
step
Reach 8665/12000 Revered with the Dominance Offensive Faction |complete repval("Dominance Offensive",Revered) >= 8665
step
talk General Nazgrim##67939
accept The Ruins of Korune##32391 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to the Ruins of Korune."_ |gossip 40749
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32391
step
Watch the dialogue
Take Tak-Tak's Kite to the Ruins of Korune |q 32391/1 |goto Kun-Lai Summit/0 32.72,25.82 |notravel
step
talk Ishi##68337
turnin The Ruins of Korune##32391 |goto 32.88,26.35
accept The Divine Bell##32392 |goto 32.88,26.35
step
Follow the path |goto Kun-Lai Summit/20 39.70,58.24 < 10 |walk
|tip Walk on blue tiles only, avoiding the yellow and red tiles, and tiles with arrows on them.
|tip Avoid big round red circles on the ground.
|tip Large Mogu statues will slam the ground in front of them after a few seconds.
|tip Each area where you encounter Sarannha, enemies will jump out and attack you.
kill Sarannha Skyglaive##68472 |q 32392/1 |goto Kun-Lai Summit/21 60.40,23.49
|tip Downstairs inside the building.
step
talk Ishi##68337
turnin The Divine Bell##32392 |goto 61.79,25.59
step
Reach 15500/12000 Revered with the Dominance Offensive Faction |complete repval("Dominance Offensive",Revered) >= 15500
step
talk General Nazgrim##67939
accept Insertion##32326 |goto Krasarang Wilds/0 10.38,53.71
step
click Sunreaver Portal: Darnassus
Take the Portal to Darnassus |q 32326/1 |goto 9.77,53.30
step
talk Fanlyr Silverthorn##68077
turnin Insertion##32326 |goto Teldrassil/0 40.06,50.44
accept The Darnassus Mission##32327 |goto 40.06,50.44
step
talk Fanlyr Silverthorn##68077
Tell him _"Yes."_ |gossip 40875
|tip You will gain a steal buff allowing you to infiltrate the hostile city safely.
Become a Darnassus Invader |complete hasbuff(134053) or completedq(32327) |goto 40.06,50.44
step
Find the Cenarion Enclave |q 32327/1 |goto Darnassus/0 38.18,33.37
|tip Go down inside the tree.
|tip Avoid going near guards, who will see through your invisibility.
step
extraaction Sunreavers' Portal-Charm##134055
|tip Use this ability if you get in trouble.
|tip It will teleport you back to Fanlyr.
|tip It appears as a button on your screen.
click Divine Bell##216678
|tip Down inside the tree.
|tip Avoid going near guards, who will see through your invisibility.
|tip You can safely walk within 5 yards or so of them.
|tip You will be teleported back to Fanlyr once you locate the bell.
Locate the Devine Bell |q 32327/2 |goto 39.91,39.69
step
extraaction Sunreavers' Portal-Charm##134055
|tip Use it to teleport you back to Fanlyr.
|tip It appears as a button on your screen.
Teleport back to Teldrassil |complete subzone("Teldrassil") or completedq(32327)
step
talk Fanlyr Silverthorn##68077
turnin The Darnassus Mission##32327 |goto Teldrassil/0 40.06,50.44
accept Victorious Return##32328 |goto 40.06,50.44
step
click Portal: Domination Point
Return to Domination Point |complete subzone("Domination Point") or completedq(32328) |goto 40.01,50.55
step
talk General Nazgrim##67939
turnin Victorious Return##32328 |goto Krasarang Wilds/0 10.38,53.71
step
Reach 18500/12000 Revered with the Dominance Offensive Faction |complete repval("Dominance Offensive",Revered) >= 18500
step
talk General Nazgrim##67939
accept The Situation in Dalaran##32402 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to Garrosh'ar Advance."_ |gossip 40750
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32402
step
talk Kromthar##67785
Tell her _"I need to get to Dalaran."_ |gossip 40692
Obtain a Ride to Dalaran |q 32402/1 |goto 9.69,52.51 |notravel
step
Watch the dialogue
Arrive In Dalaran |complete subzone("The Underbelly") or completedq(32402)
step
talk Grand Magister Rommath##68586
turnin The Situation in Dalaran##32402 |goto Dalaran MoP/0 31.46,50.09
accept It Starts in the Sewers##32403 |goto 31.46,50.09
step
talk Sunreaver Citizen##68695
|tip You can find them all over the sewer.
Tell them _"It's not safe here anymore. You need to evacuate Dalaran."_ |gossip 40739
Evacuate #9# Sunreaver Citizens |q 32403/1 |goto 38.89,50.59
step
talk Grand Magister Rommath##68586
turnin It Starts in the Sewers##32403 |goto 45.61,53.60
accept Violence in the Arena##32404 |goto 45.61,53.60
stickystart "Kill_Silver_Covenant_Spellbows"
step
kill 6 Silver Covenant Enforcer##68042 |q 32404/1 |goto 48.88,45.58
step
label "Kill_Silver_Covenant_Spellbows"
kill 4 Silver Covenant Spellbow##68043 |q 32404/2 |goto 48.88,45.58
step
talk Grand Magister Rommath##68586
turnin Violence in the Arena##32404 |goto 54.52,27.97
accept Hand of the Silver Covenant##32405 |goto 54.52,27.97
step
kill Sorin Magehand##32405 |q 32405/1 |goto 62.68,13.08
step
talk Grand Magister Rommath##68586
turnin Hand of the Silver Covenant##32405 |goto 64.63,48.67
accept A Tactical Assault##32406 |goto 64.63,48.67
step
Run up the ramp |goto 65.37,46.89 < 2 |walk
Leave the Dalaran Sewers |goto Dalaran MoP/1 60.75,48.24 < 1000 |c |noway |q 32406
step
talk Grand Magister Rommath##68586
|tip Run through the building with Rommath.
turnin A Tactical Assault##32406 |goto 50.58,48.09
accept The Silver Covenant's Stronghold##32408 |goto 50.58,48.09
accept The Kirin Tor's True Colors##32409 |goto 50.58,48.09
accept Krasus' Landing##32410 |goto 50.58,48.09
stickystart "Slay_Stormwind_Troops"
step
kill Arcanist Rathaella##68049 |q 32408/1 |goto 36.15,64.06
step
kill Lieutenant Corwin##68047 |q 32409/1 |goto 46.11,19.67
|tip He walks around this area.
step
label "Slay_Stormwind_Troops"
Kill Stormwind enemies around this area |kill Stormwind Footman##68707,Stormwind Cleric##68708
Slay #10# Stormwind Troops |q 32409/2 |goto 49.45,26.43
step
clicknpc Sunreaver Dragonhawk##68728
Free #6# Sunreaver Dragonhawks |q 32410/1 |goto 72.68,45.65
step
talk Grand Magister Rommath##68586
turnin The Silver Covenant's Stronghold##32408 |goto 50.58,48.09
turnin The Kirin Tor's True Colors##32409 |goto 50.58,48.09
turnin Krasus' Landing##32410 |goto 50.58,48.09
accept The Remaining Sunreavers##32411 |goto 50.58,48.09
step
use the Tear of the Sin'dorei##93124
|tip Upstairs inside the building.
Rescue Magister Surdiel |q 32411/4 |goto 58.70,27.82
step
use the Tear of the Sin'dorei##93124
|tip Upstairs inside the building.
Rescue High Arcanist Savor |q 32411/2 |goto 60.36,14.16
step
use the Tear of the Sin'dorei##93124
|tip Inside the building.
Rescue Magistrix Vesara |q 32411/5 |goto 65.78,23.06
step
use the Tear of the Sin'dorei##93124
|tip Inside the building.
Rescue Uda the Beast |q 32411/1 |goto 70.08,34.35
step
use the Tear of the Sin'dorei##93124
|tip Upstairs inside the building.
Rescue Magister Hathorel |q 32411/3 |goto 66.95,35.36
step
talk Grand Magister Rommath##68586
turnin The Remaining Sunreavers##32411 |goto 50.58,48.09
accept One Last Grasp##32412 |goto 50.58,48.09
step
kill Mage-Commander Zuros##68632 |q 32412/1 |goto 29.48,48.39
|tip Inside the building.
step
Watch the dialogue
click Rommath's Portal
|tip Inside the building.
Return to the Sewers |complete subzone("Cantrips & Crowsm") or completedq(32412) |goto 29.00,48.29
step
Escape from Dalaran |q 32412/2 |goto Dalaran MoP/0 8.96,88.64
|tip Jump out of the sewer.
|tip A Dragonhawk will catch you before you die.
step
talk Lor'themar Theron##16802
turnin One Last Grasp##32412 |goto Silvermoon City/0 71.02,41.26
step
click Portal to Domination Point
Return to Domination Point |complete subzone("Domination Point") or completedq(32398) |goto 70.28,41.68
step
talk General Nazgrim##67939
accept The Bell Speaks##32398 |goto Krasarang Wilds/0 10.38,53.71
step
talk Tak-Tak##68681
Tell him _"Take me to Emperor's Reach."_ |gossip 40748
Ride Tak-Tak's Kite |invehicle |goto 9.90,52.40 |q 32398
step
Watch the dialogue
Take Tak-Tak's Kite to Emperor's Reach |q 32398/1 |goto Kun-Lai Summit/0 55.92,33.83 |notravel
step
talk Malkorok##67844
turnin The Bell Speaks##32398 |goto 55.89,34.07
accept Breath of Darkest Shadow##32399 |goto 55.89,34.07
step
Watch the dialogue
kill Kor'kron Reaver##68940+
|tip Wait until the Horde become afflicted by the Sha.
|tip Once the Juggernauts are defeated, Ishi will get possessed.
kill Ishi##68225 |q 32399/1 |goto 55.82,31.93
|tip Run through gold orbs for healing.
|tip Stay out of shadow areas on the ground.
step
Watch the dialogue
kill Anduin Wrynn##68224 |q 32399/2 |goto 56.01,31.92
|tip Garrosh will break free and defeat him.
step
talk Garrosh Hellscream##68223
turnin Breath of Darkest Shadow##32399 |goto 55.96,32.00
]])
