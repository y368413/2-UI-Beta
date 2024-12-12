local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("ReputationsCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition Flags")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Iskaara Tuskarr")
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Community Feast",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing tasks for the Iskaara Tuskarr Community Feast event.",
condition_suggested=function() return completedq(70938) and areapoi(2024,7218) end,
patch='100002',
areapoiid=7219,
areapoitype="Community Feast",
},[[
step
talk Nunvuq##186554
Train Fishing |skillmax Fishing,300 |goto The Azure Span/0 13.94,49.24
step
talk Nunvuq##186554
Train Dragon Isles Fishing |skillmax Dragon Isles Fishing,100 |goto 13.94,49.24
step
talk Elder Poa##186448 |goto The Azure Span/0 12.41,49.34
|tip Inside the building.
|tip Turn in Stolen Totems from treasures in The Azure Span for rep.
'|turnin More Stolen Totems##70927 |repeatable |n
'|turnin Stolen Totems##70926 |repeatable |n
'|turnin Story of a Memorable Victory##72291 |repeatable |n
Reach Renown Level 3 with the Iskaara Tuskarr |complete factionrenown(2511) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Azure Span to gain renown.
step
_Next to you:_
talk Rowie##197631
accept Community Feasts##70938
step
talk Big Kinook##186126
turnin Community Feasts##70938 |goto The Azure Span/0 13.48,48.61
step
label "Wait_For_Feast_To_Begin"
Wait for the Community Feast Event to Begin Preparations |complete inscenario() |goto The Azure Span/0 13.53,48.48
|tip The feast occurs every hour.
|tip It lasts for 15 minutes, during which you will complete tasks repeatedly to increase the quality of the soup.
|tip After completion, you can eat the soup to gain a food buff based on the quality of the resulting soup.
step
talk Pleeqi##196620
accept Community Feast##70893 |goto 13.50,48.51
|tip It may take a moment for Pleeqi to offer you this quest.
step
Get Your Orders from Big Kinook |scenariostart |goto The Azure Span/0 13.48,48.62
|tip Wait for a moment for Big Kinook to start the feast and give you a task.
|tip Stay close to the pot and defend it from enemies if they attack.
|tip If you get pull into the pot, spam the button on your screen as quickly as possible to stir the soup.
stickystart "Complete_Tasks_in_the_Community_Feast"
step
label "Get_Orders_from_Big_Kinook"
Get Your Orders from Big Kinook |scenariogoal 1/54615 |goto 13.48,48.62
|tip Wait for a moment for Big Kinook to give you another task.
|tip Stay close to the pot and defend it from enemies if they attack.
|tip If you get pull into the pot, spam the button on your screen as quickly as possible to stir the soup.
|only if scenariogoal(54615)
step
Proceeding... |complete inscenario()
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Rubbery Fish Head##195808
Tenderize the Rubbery Fish Head |scenariogoal 1/54738 |goto 13.52,48.46
|only if scenariogoal(54738)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Not-So-Tender Morsel##195817
Tenderize the Not-So-Tender Morsel |scenariogoal 1/54739 |goto 13.61,48.51
|only if scenariogoal(54739)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Tough Carp##195819
Tenderize the Tough Carp |scenariogoal 1/54740 |goto 13.60,48.65
|only if scenariogoal(54740)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
kill Bittershell Hermit##195925+
|tip They look like small fish flopping around on the ground next to the Communal Pot.
Stomp them Before they Ruin the Soup |scenariogoal 1/54745 |goto 13.60,48.65
|only if scenariogoal(54745)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Communal Pot
|tip Choose any dialogue options you want.
talk Big Kinook##186126
|tip Select the available dialogue option.
Taste the Soup |scenariogoal 1/54742 |goto 13.47,48.61
|only if scenariogoal(54742)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Big Kinook##186126
|tip Use the abilities on your vehicle bar 8 times to complete this.
Speak with Big Kinook #8# Times to Regain Soupervisor |scenariogoal 1/54743 |goto 13.47,48.61
|only if scenariogoal(54743)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Escaping Fish##195920+
|tip They look like small fish flopping around on the ground next to the Communal Pot.
Toss the Fish Back into the Pot |scenariogoal 1/54744 |goto 13.59,48.65
|only if scenariogoal(54744)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Jinkutuk##194100
buy Salted Fish Scraps##199063 |scenariogoal 1/54998 |goto 13.85,49.48
|only if scenariogoal(54998)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Jarii##194100
Ask him _"Got any Peppersmelt?"_
collect Peppersmelt##199100 |scenariogoal 1/55000 |goto 13.94,49.27
|only if scenariogoal(55000)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Dragonhead Eel##196399
collect Dragonhead Eel##199833 |scenariogoal 1/55013 |goto 13.48,49.94
|only if scenariogoal(55013)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Dried Wyldermane Kelp##380950
collect Dried Wyldermane Kelp##199101 |scenariogoal 1/55001 |goto 13.41,48.07
|only if scenariogoal(55001)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Bukarakikk##186568
buy Hunk o' Blubber##199102 |scenariogoal 1/55002 |goto 12.51,49.80
|only if scenariogoal(55002)
step
extraaction Yes Chef!##386907
Enter the building |goto 12.78,49.34 < 7 |walk
talk Elder Nappa##186446
buy Nappa's Famous Tea##199103 |scenariogoal 1/55003 |goto 12.40,49.41
|only if scenariogoal(55003)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tuukanit##192560
|tip Inside the building.
buy Piping-Hot Orca Milk##199104 |scenariogoal 1/55004 |goto 13.22,49.57
|only if scenariogoal(55004)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Ancheevy##380952+
collect 3 Ancheevy##199105 |scenariogoal 1/55005 |goto 12.94,48.85
|only if scenariogoal(55005)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Tiny Leviathan Bone##380951
collect Tiny Leviathan Bone##199106 |scenariogoal 1/55006 |goto 12.55,49.75
|only if scenariogoal(55006)
step
cast Fishing##131474
|tip Fish in Clubfish Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Clubfish##199212 |scenariogoal 1/55007 |goto 13.20,48.02
|only if scenariogoal(55007)
step
cast Fishing##131474
|tip Fish in Grungle Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Grungle##199208 |scenariogoal 1/55008 |goto 13.72,48.43
|only if scenariogoal(55008)
step
cast Fishing##131474
|tip Fish in Iceback Sculpin Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Iceback Sculpin##199207 |scenariogoal 1/55009 |goto 13.84,49.00
|only if scenariogoal(55009)
step
cast Fishing##131474
|tip Fish in Lakkamuk Blenny Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Lakkamuk Blenny##199213 |scenariogoal 1/55010 |goto 14.22,49.39
|only if scenariogoal(55010)
step
cast Fishing##131474
|tip Fish in Manasucker Schools along the water.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
collect Manasucker##199205 |scenariogoal 1/55011 |goto 13.57,47.41
|only if scenariogoal(55011)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
clicknpc Smoked Seaviper##196400
collect Smoked Seaviper##199832 |scenariogoal 1/55012 |goto 12.92,48.65
|only if scenariogoal(55012)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Pulpy Seagrass##381351
collect Pulpy Seagrass##199834 |scenariogoal 1/55014 |goto 12.63,50.46
|only if scenariogoal(55014)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
click Torga's Braid##381352
collect Torga's Braid##199835 |scenariogoal 1/55015 |goto 14.11,49.38
|only if scenariogoal(55015)
step
extraaction Stir the Soup##386933
|tip Spam the button as quickly as possible to stir the soup.
|tip Clear the "Yes Chef!" ability from your screen first to use this ability.
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
Hop into the Pot and Stir! |scenariogoal 1/55061 |goto 13.52,48.60
|only if scenariogoal(55061)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
|tip It walks around this area.
buy Juicy Bushfruit##204295 |scenariogoal 1/58319 |goto 13.35,48.91
|only if scenariogoal(58319)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
|tip It walks around this area.
buy Greenberry##204293 |scenariogoal 1/58317 |goto 13.35,48.91
|only if scenariogoal(58317)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
buy Fresh Dragon Fruit##204294 |scenariogoal 1/58318 |goto 13.41,48.92
|only if scenariogoal(58318)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Westfall Stew##204303 |scenariogoal 1/58327 |goto 13.63,47.93
|only if scenariogoal(58327)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Dragonbreath Chili##204304 |scenariogoal 1/58328 |goto 13.63,47.92
|only if scenariogoal(58328)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Undermine Clam Chowder##204302 |scenariogoal 1/58326 |goto 13.63,47.92
|only if scenariogoal(58326)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Head Chef Stacks##202834
buy Rations: Scorpid Surprise##204301 |scenariogoal 1/58325 |goto 13.63,47.92
|only if scenariogoal(58325)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
buy Seven Spices Bruffalon##204289 |scenariogoal 1/58313 |goto 13.71,49.19
|only if scenariogoal(58313)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
|tip She walks around this area.
buy "Volcano" Duck##204292 |scenariogoal 1/58316 |goto 13.71,49.12
|only if scenariogoal(58316)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
|tip She walks around this area.
buy Dragonflame Argali##204290 |scenariogoal 1/58314 |goto 13.64,48.90
|only if scenariogoal(58314)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Qariin Dotur##202829
buy Thrice-Charred Mammoth Ribs##204291 |scenariogoal 1/58315 |goto 13.64,48.89
|only if scenariogoal(58315)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Norukk##196544
buy Norukk's "All-Purpose" Fish Powder##204284 |scenariogoal 1/58308 |goto 12.93,48.62
|only if scenariogoal(58308)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Four-Cheese Blend##204300 |scenariogoal 1/58324 |goto 13.47,48.45
|only if scenariogoal(58324)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Flaky Pastry Dough##204298  |scenariogoal 1/58322 |goto 13.47,48.45
|only if scenariogoal(58322)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Exquisite Ohn'ahran Potato##204297 |scenariogoal 1/58321 |goto 13.47,48.45
|only if scenariogoal(58321)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Erugosa##202832
buy Dark Thaldraszian Cocoa Powder##204299 |scenariogoal 1/58323 |goto 13.47,48.45
|only if scenariogoal(58323)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Rokkutuk##194059
buy Deepsquid Ink##204286 |scenariogoal 1/58310 |goto 13.91,50.08
|only if scenariogoal(58310)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tattukiaka##199448
buy Fermented Mackerel Paste##204285 |scenariogoal 1/58309 |goto 14.03,49.71
|only if scenariogoal(58309)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Hanu##186186
buy Eye of Bass##204288 |scenariogoal 1/58312 |goto 12.90,48.70
|only if scenariogoal(58312)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Tikukk##187869
buy Island Crab Jerky##204287 |scenariogoal 1/58311 |goto 12.71,50.34
|only if scenariogoal(58311)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Arvik##186449
buy Skrog Liver Oil##204283 |scenariogoal 1/58307 |goto 12.90,48.82
|only if scenariogoal(58307)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Junnik##186558
buy Thousandbite Piranha Collar##204281 |scenariogoal 1/58305 |goto 13.89,49.50
|only if scenariogoal(58305)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Patchu##196069
buy Lunker Bits##204282 |scenariogoal 1/58306 |goto 13.89,49.85
|only if scenariogoal(58306)
step
extraaction Yes Chef!##386907
|tip Use this to increase your speed before it fades.
talk Gracus##202830
buy Dried Coldsnap Sagittate##204296 |scenariogoal 1/58320 |goto 13.27,48.79
|only if scenariogoal(58320)
step
Waiting for Next Stage |complete scenariogoal(54615) |or |next "Get_Orders_from_Big_Kinook"
'|complete scenariogoal(54614,54647,54648,54649,54652,54733,54735,54736,54737,54650,54651,54653,54734,58341,58342,58351,58343,58352,58350,58349,58337,58340,58338,58339,58332,58348,58346,58345,58347,58334,58333,58336,58335,58331) |or
|only if inscenario()
step
extraaction Salted Fish Scraps##386267
Throw Salted Fish Scraps in the Pot |scenariogoal 2/54614 |goto 13.57,48.57
|only if scenariogoal(54614)
step
extraaction Spicy Fish##386413
Throw Spicy Fish in the Pot |scenariogoal 2/54647 |goto 13.57,48.59
|only if scenariogoal(54647)
step
extraaction Assorted Kelp##386414
Throw the Seaweed in the Pot |scenariogoal 2/54648 |goto 13.57,48.57
|only if scenariogoal(54648)
step
extraaction Hunk o' Blubber##386415
Throw a Hunk o' Blubber in the Pot |scenariogoal 2/54649 |goto 13.57,48.57
|only if scenariogoal(54649)
step
extraaction Ancheevies##386418
Throw Ancheevies in the Pot |scenariogoal 2/54652 |goto 13.57,48.57
|only if scenariogoal(54652)
step
extraaction Clubfish##386890
Throw a Clubfish in the Pot |scenariogoal 2/54733 |goto 13.58,48.60
|only if scenariogoal(54733)
step
extraaction Iceback Sculpin##386888
Throw an Iceback Sculpin in the Pot |scenariogoal 2/54735 |goto 13.57,48.57
|only if scenariogoal(54735)
step
extraaction Lakkamuk Blenny##386891
Throw a Lakkamuk Blenny in the Pot |scenariogoal 2/54736 |goto 13.57,48.57
|only if scenariogoal(54736)
step
extraaction Manasucker##386886
Throw a Manasucker in the Pot |scenariogoal 2/54737 |goto 13.57,48.57
|only if scenariogoal(54737)
step
extraaction Nappa's Famous Tea##386416
Pour Nappa's Famous Tea in the Pot |scenariogoal 2/54650  |goto 13.57,48.57
|only if scenariogoal(54650)
step
extraaction Piping-Hot Orca Milk##386417
Pour Piping-Hot Orca Milk in the Pot |scenariogoal 2/54651 |goto 13.57,48.57
|only if scenariogoal(54651)
step
extraaction Tiny Leviathan Bone##386419
Throw the Tiny Leviathan Bone in the Pot |scenariogoal 2/54653 |goto 13.57,48.57
|only if scenariogoal(54653)
step
extraaction Grungle##386889
Throw a Grungle in the Pot |scenariogoal 2/54734 |goto 13.57,48.57
|only if scenariogoal(54734)
step
extraaction Greenberry##404101
Throw a Greenberry in the Pot |scenariogoal 2/58341 |goto 13.53,48.52
|only if scenariogoal(58341)
step
extraaction Fresh Dragon Fruit##404102
Throw the Fresh Dragon Fruit in the Pot |scenariogoal 2/58342 |goto 13.57,48.61
|only if scenariogoal(58342)
step
extraaction Rations: Westfall Stew##404111
Pour the Rations: Westfall Stew in the Pot |scenariogoal 2/58351 |goto 13.54,48.51
|only if scenariogoal(58351)
step
extraaction Juicy Bushfruit##404103
Throw the Juicy Bushfruit in the Pot |scenariogoal 2/58343 |goto 13.53,48.52
|only if scenariogoal(58343)
step
extraaction Rations: Dragonbreath Chili##404112
Throw the Rations: Dragonbreath Chili in the Pot |scenariogoal 2/58352 |goto 13.54,48.54
|only if scenariogoal(58352)
step
extraaction Rations: Undermine Clam Chowder##404110
Pour the Rations: Undermine Clam Chowder in the Pot |scenariogoal 2/58350 |goto 13.55,48.53
|only if scenariogoal(58350)
step
extraaction Rations: Scorpid Surprise##404109
Throw the Rations: Scorpid Surprise in the Pot |scenariogoal 2/58349 |goto 13.54,48.54
|only if scenariogoal(58349)
step
extraaction Seven Spices Bruffalon##404097
Throw the Seven Spices Bruffalon in the Pot |scenariogoal 2/58337 |goto 13.58,48.65
|only if scenariogoal(58337)
step
extraaction "Volcano" Duck##404100
Throw the "Volcano" Duck in the Pot |scenariogoal 2/58340 |goto 13.57,48.60
|only if scenariogoal(58340)
step
extraaction Dragonflame Argali##404098
Throw the Dragonflame Argali in the Pot |scenariogoal 2/58338 |goto 13.57,48.62
|only if scenariogoal(58338)
step
extraaction Thrice-Charred Mammoth Ribs##404099
Throw the Thrice-Charred Mammoth Ribs in the Pot |scenariogoal 2/58339 |goto 13.57,48.64
|only if scenariogoal(58339)
step
extraaction Norukk's "All-Purpose" Fish Powder##404092
Sprinkle Norukk's "All-Purpose" Fish Powder Into the Pot |scenariogoal 2/58332 |goto 13.51,48.53
|only if scenariogoal(58332)
step
extraaction Four-Cheese Blend##404108
Sprinkle the Four-Cheese Blend in the Pot |scenariogoal 2/58348 |goto 13.54,48.53
|only if scenariogoal(58348)
step
extraaction Flaky Pastry Dough##404106
Throw the Flaky Pastry Dough in the Pot |scenariogoal 2/58346 |goto 13.54,48.54
|only if scenariogoal(58346)
step
extraaction Exquisite Ohn'ahran Potato##404129
Throw the Exquisite Ohn'ahran Potato in the Pot |scenariogoal 2/58345 |goto 13.55,48.52
|only if scenariogoal(58345)
step
extraaction Dark Thaldraszian Cocoa Powder##404107
Sprinkle some Dark Thaldraszian Cocoa Powder in the Pot |scenariogoal 2/58347 |goto 13.55,48.54
|only if scenariogoal(58347)
step
extraaction Deepsquid Ink##404094
Pour the Deepsquid Ink in the Pot |scenariogoal 2/58334 |goto 13.58,48.65
|only if scenariogoal(58334)
step
extraaction Fermented Mackerel Paste##404093
Squeeze the Fermented Mackerel Paste in the Pot |scenariogoal 2/58333 |goto 13.58,48.65
|only if scenariogoal(58333)
step
extraaction Eye of Bass##404096
Throw the Eye of Bass in the Pot |scenariogoal 2/58336 |goto 13.57,48.62
|only if scenariogoal(58336)
step
extraaction Island Crab Jerky##404095
Throw the Island Crab Jerky In the Pot |scenariogoal 2/58335 |goto 13.52,48.51
|only if scenariogoal(58335)
step
extraaction Skrog Liver Oil##404091
Pour Some Skrog Liver Oil In the Pot |scenariogoal 2/58331 |goto 13.49,48.52
|only if scenariogoal(58331)
step
extraaction Thousandbite Piranha Collar##404089
Throw Thousandbite Piranha Collar in the pot |scenariogoal 2/58329 |goto 13.57,48.63
|only if scenariogoal(58329)
step
extraaction Lunker Bits##404090
Throw Some Lunker Bits in the pot |scenariogoal 2/58330 |goto 13.57,48.63
|only if scenariogoal(58330)
step
extraaction Dried Coldsnap Sagittate##404104
Throw the Dried Coldsnap Sagittate in the Pot |scenariogoal 2/58344 |goto 13.52,48.50
|only if scenariogoal(58344)
step
Waiting for New Stage |complete scenariogoal(54615) |next "Get_Orders_from_Big_Kinook"
|only if inscenario()
step
label "Complete_Tasks_in_the_Community_Feast"
Complete #5# Tasks in the Community Feast |q 70893/1 |goto 13.57,48.59 |or
|tip Complete various tasks for Big Kinook.
|only if inscenario()
step
talk Pleeqi##196620
turnin Community Feast##70893 |goto 13.50,48.51
|only if readyq(70893) or completedq(70893)
step
click Communal Pot
Choose _<Eat some soup.>_
|tip The soup will stay hot for one hour after the feast ends.
Tip Wait for the Feast to Begin Again |complete inscenario() |next "Wait_For_Feast_To_Begin" |goto The Azure Span/0 13.53,48.60
|tip A new feast begins every hour.
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Iskaara Tuskarr\\Fishing Gear Crafting")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Maruuk Centaur")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Azure Span Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Azure Span Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Azure Span Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Ohn'ahran Plains Hunt")
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Ohn'ahran Plains Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7053) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7053,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2023,7053)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in The Waking Shores. |only if areapoitime(7343) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto Ohn'ahran Plains/0 81.84,17.16
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto Ohn'ahran Plains/0 81.84,17.16
step
label "Scenario_Stage_2"
click Mangled Bush+
|tip They look like dead branches sticking out of the ground around this area.
click Suspicious Bush+
|tip They look like bushy plants around this area.
click Fowl Feather+
|tip They look like small feathers on the ground around this area.
|tip They appear on your minimap as yellow dots.
Examine the Tracks |scenariogoal 2/0 |scenariogoal 2/0 |goto Ohn'ahran Plains/0 80.02,20.43
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt Creatures Around the Plains |scenariogoal 3/0 |goto Ohn'ahran Plains/0 80.21,20.37
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill Wind Eagle enemies that attack in waves
Clear out the Angry Wind Eagles |scenariogoal 4/0 |goto Ohn'ahran Plains/0 80.98,22.74
|only if scenariostage(4)
step
label "Scenario_Stage_5"
kill Uranto the Swift##191103 |scenariogoal 5/0 |goto Ohn'ahran Plains/0 78.31,20.60
|tip Uranto runs in circles around this area.
|tip Your group must reduce its health to 90% before it will stop running and fight you.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
click Baby Mammoth
|tip It walks around this area.
|tip Blitztusk will attack shortly after.
kill Blitztusk##190907 |scenariogoal 6/0 |goto Ohn'ahran Plains/0 76.41,20.27
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(6)
step
label "Scenario_Stage_7"
clicknpc Injured Beaver Kit##192688+
|tip They look like injured beavers laying on the ground around this area.
|tip They appear on your minimap as yellow dots.
talk Shikaar Healer##192722
Tell it _"Here is an inured kit, please help them!"_
Heal #16# Injured Beaver Kits |scenariogoal 7/53742 |goto Ohn'ahran Plains/0 82.87,18.61
You can find a Shikaar Healer here:
[81.61,20.36]
[83.23,21.13]
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Kill beaver enemies around the river
Hunt Beavers Around the River |scenariogoal 8/0 |goto Ohn'ahran Plains/0 82.45,19.33
|only if scenariostage(8)
step
label "Scenario_Stage_9"
click Beaver Dam
kill Norbett##190968 |scenariogoal 9/0 |goto Ohn'ahran Plains/0 83.10,18.81
|tip Norbett will immediately spawn
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(9)
step
label "Scenario_Stage_10"
click Bone Pile+
|tip They look like large piles of bones on the ground around this area.
Collect #15# Bones from Rockfang Ravine |scenariogoal 10/53742 |goto Ohn'ahran Plains/0 85.23,15.61
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill enemies around this area
Hunt Creatures Around the Ravine |scenariogoal 11/0 |goto Ohn'ahran Plains/0 84.75,16.31
|only if scenariostage(11)
step
label "Scenario_Stage_12"
clicknpc Lost Lamb##191120
kill Boolk##191450 |scenariogoal 12/0 |goto Ohn'ahran Plains/0 87.03,18.03
|tip Boolk will fly down and kill the Lost Lamb.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Sarana##190161 |scenariogoal 13/0 |goto Ohn'ahran Plains/0 84.98,15.56
|tip Move around the area looking for yellow dots on your minimap.
|tip Keep checking for signs of Saran until it appears and attacks.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto Ohn'ahran Plains/0 81.84,17.16 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Ohn'ahran Plains Hunt"
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Ohn'ahran Plains Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Thaldraszus Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Thaldraszus Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Waking Shores Hunt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Waking Shores Hunt")
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Waking Shores Hunt",{
author="support@zygorguides.com",
description="\nThis guide will walk you through completing the various daily quests in Korthia.",
condition_suggested=function() return completedq(71231) and factionrenown(2503) < 25 and areapoitime(7091) > 0 end,
condition_valid=function() return completedq(71231) end,
condition_valid_msg="You must complete the \"Call of the Hunt\" quest in the Maruuk Centaur reputation guide at renown level 5 to unlock grand hunts.",
areapoiid=7091,
areapoitype="Grand Hunt",
patch='100002',
},[[
step
Wait for the Grand Hunt to Begin |complete areapoi(2022,7091)
|tip You will need a small group to complete this.
|tip The Grand Hunt is currently in The Azure Span. |only if areapoitime(7345) > 0
|tip The Grand Hunt is currently in Thaldraszus. |only if areapoitime(7344) > 0
|tip The Grand Hunt is currently in Ohn'ahran Plains. |only if areapoitime(7342) > 0
step
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariostart |goto The Waking Shores/0 25.25,88.48
step
label "Scenario_Stage_1"
talk Scout Tomul##192353
Tell him _"I will signal the start of the Grand Hunt!"_
Talk to Scout Tomul and Begin the Hunt |scenariogoal 1/53753 |goto The Waking Shores/0 25.25,88.48
step
label "Scenario_Stage_2"
clicknpc Clumsy Hunter##195904+
|tip They look like cauntaur turned over on their backs near bushes around this area.
|tip Click them and then run away from them to pull them upright.
|tip They appear on your minimap as yellow dots.
Help #14# Clumsy Centaur |scenariogoal 2/54747 |goto The Waking Shores/0 24.64,93.50
|only if scenariostage(2)
step
label "Scenario_Stage_3"
Kill enemies around this area
Hunt creatures around Apex Canopy |scenariogoal 3/0 |goto The Waking Shores/0 24.04,92.86
|only if scenariostage(3)
step
label "Scenario_Stage_4"
Kill enemies that attack in waves
|tip They will try to attack the foal inside the cave.
Defend the Injured Foal |scenariogoal 4/54017 |goto The Waking Shores/0 25.78,96.09
|only if scenariostage(4)
step
label "Scenario_Stage_5"
Enter the cave |goto The Waking Shores/0 24.56,95.18 < 10 |walk
kill Honmor##193704 |scenariogoal 5/54014 |goto The Waking Shores/0 23.86,96.06
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(5)
step
label "Scenario_Stage_6"
Enter the cave |goto The Waking Shores/0 23.17,90.69 < 7 |walk
kill Tomnu##193722 |scenariogoal 6/54015 |goto The Waking Shores/0 23.42,88.97
|tip Inside the cave.
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(6)
step
label "Scenario_Stage_7"
clicknpc Drowning Foal##195913+
|tip You can find them in the water.
|tip Pick them up and carry them to dry land to save them.
Save #10# Drowning Foals |scenariogoal 7/54748 |goto The Waking Shores/0 28.30,87.41
|only if scenariostage(7)
step
label "Scenario_Stage_8"
Hunt creatures around the northeast falls |scenariogoal 8/0
|only if scenariostage(8)
step
label "Scenario_Stage_9"
Kill Swoglet and Hornswog enemies that attack in waves
Clear out the Intrusive Swoglets and Hornswog |scenariogoal 9/54018 |goto The Waking Shores/0 28.36,85.85
|only if scenariostage(9)
step
label "Scenario_Stage_10"
Click objects around this area
|tip Click various weapons you find on the ground.
|tip They appear on your minimap as yellow dots.
Collect #18# Lost Shikaar Equipment |scenariogoal 10/54617 |goto The Waking Shores/0 26.81,89.74
|only if scenariostage(10)
step
label "Scenario_Stage_11"
Kill elemental enemies around this area
Hunt Elementals Around Genesis Falls |scenariogoal 11/0 |goto The Waking Shores/0 26.73,89.25
|only if scenariostage(11)
step
label "Scenario_Stage_12"
click Roasted Boar
Kill Proto-Drake enemies that attack in waves
Defeat the Starving Proto-Drakes |scenariogoal 12/54019 |goto The Waking Shores/0 25.75,85.03
|only if scenariostage(12)
step
label "Scenario_Stage_13"
kill Uurtus##193724 |scenariogoal 13/54016 |goto The Waking Shores/0 26.66,88.91
|tip This enemy is elite and may require a group.
|tip Stack in front of the person targeted by "Stampeding Charge" to split the damage.
|tip Stack on the person targeted by "Earthshattering Leap" to split the damage.
|tip Anyone not stacked will be stunned for 10 seconds.
|tip You can use combat drop abilities like "Feign Death" and "Vanish" to stop these abilities.
|tip Reducing charmed players to 30% health will free them.
|only if scenariostage(13)
step
label "Scenario_Stage_14"
talk Scout Tomul##192353
Tell him _"I will signal the end of the Grand Hunt!"_
Talk to Scout Tomul and Conclude the Hunt |scenarioend |goto The Waking Shores/0 25.25,88.48 |next "Reputation Guides\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Waking Shores Hunt"
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Valdrakken Accord\\Valdrakken Accord")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Winterpelt Furbolg")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Loamm Niffen")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Dragonflight Reputations\\Dream Wardens")
