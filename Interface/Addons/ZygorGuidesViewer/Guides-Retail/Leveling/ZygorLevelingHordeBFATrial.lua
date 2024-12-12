local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHBFA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Zuldazar (10-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Nazmir (10-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Vol'dun (10-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Mechagon Island")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Nazjatar\\Nazjatar")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Nazjatar\\Kelya's Grave")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Nazjatar\\Nazjatar Dropped Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\War Campaign")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Warfronts\\Arathi Highlands Warfront Extra Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Warfronts\\Darkshore Warfront Extra Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Warfronts\\Warfronts Introduction Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Advanced Adventurer Augment")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Annoy-o-Tron Gang")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Anti-Gravity Pack")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Battle Box")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: BAWLD-371")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Beastbot Powerpack")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Blue Spraybot")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Canned Minnows")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Emergency Powerpack")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Emergency Repair Kit")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Emergency Rocket Chicken")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Encrypted Black Market Radio")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Experimental Adventurer Augment")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Extraordinary Adventurer Augment")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: G99.99 Landshark")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Green Spraybot")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Holographic Digitalization Relay")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Hundred-Fathom Lure")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Mechano-Treat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Mechanocat Laser Pointer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Microbot XD")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Orange Spraybot")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Perfectly Timed Differential")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Personal Time Displacer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Protocol Transference Device")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Re-Procedurally Generated Punchcard")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Rustbolt Gramophone")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Rustbolt Kegerator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Rustbolt Pocket Turret")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Rustbolt Resistance Insignia")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Rustbolt Requisitions")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Scrap Grenade")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Scrap Trap")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Scrapmaster's Blowtorch")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: S.P.A.R.E. Crate")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Ultrasafe Transporter - Mechagon")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Utility Mechanoclaw")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Kul Tiras\\Mechagon Island\\Blueprints\\Blueprint: Vaultbot Key")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Swiftwind Post (Drustvar)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Wolf's Den (Tiragarde Sound)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Hillcrest Pasture (Stormsong Valley)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Mudfisher Cove (Drustvar)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Stonefist Watch (Tiragarde Sound)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Stonetusk Watch (Stormsong Valley)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Scouting Reports\\Windfall Cavern (Stormsong Valley)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Heart of Azeroth\\Essential Empowerment")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Zuldazar Loremaster (Story Quest Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Nazmir Loremaster (Story Quest Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Vol'dun Loremaster (Story Quest Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Mysterious Letter Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Xal'atath's Gambit")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Xal'atath's Gambit - Priest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Hati's Sacrifice")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Before the Storm Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Horrific Vision of Stormwind")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Horrific Vision of Orgrimmar")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Battle for Azeroth (10-60)\\Heart of Azeroth\\Magni's Plan")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Starter Guides\\Demon Hunter Starter")
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Exile's Reach (1-10)",{
author="support@zygorguides.com",
description="This guide will assist you in completing the Exile's Reach\n"..
"\nquestline.\n",
condition_suggested=function() return level >= 1 and level <= 10 and ZGV.InPhase("exilesreach") end,
condition_suggested_exclusive=true,
startlevel=1.0,
endlevel=10.0,
image=ZGV.IMAGESDIR.."BfAIntro",
},[[
step
_On the Deck of the Ship:_
talk Warlord Breka Grimaxe##166573
accept Warming Up##59926
step
_Nearby on the Deck of the Ship:_
kill Combat Dummy##160737
Destroy a Combat Dummy |q 59926/1
step
_Nearby on the Deck of the Ship:_
talk Warlord Breka Grimaxe##166573
turnin Warming Up##59926
step
_Nearby on the Deck of the Ship:_
talk Grunt Throg##166583
accept Stand Your Ground##59927
step
_Nearby on the Deck of the Ship:_
Watch the dialogue
kill Grunt Throg
|tip He runs across the deck of the ship nearby.
Spar with Grunt Throg |q 59927/1
'|kill Grunt Throg##166814
step
_Nearby on the Deck of the Ship:_
Watch the dialogue
talk  Grunt Throg##166583
|tip He walks across the deck of the ship nearby.
turnin Stand Your Ground##59927
accept Brace for Impact##59928
step
_Nearby on the Deck of the Ship:_
Watch the dialogue
talk Warlord Breka Grimaxe##166827
turnin Brace for Impact##59928
step
Reach the Murloc Hideaway |complete subzone("Murloc Hideaway") |q 59929 |future
step
talk Warlord Breka Grimaxe##166782
accept Murloc Mania##59929 |goto Exile's Reach/0 61.88,82.89
step
Kill Murloc enemies around this area
Recover #6# First Aid Kits from Defeated Murlocs |q 59929/1 |goto 60.64,79.50
'|kill Murloc Watershaper##150229, Murloc Spearhunter##150228
step
talk Warlord Breka Grimaxe##166782
turnin Murloc Mania##59929 |goto 61.88,82.89
accept Emergency First Aid##59930 |goto 61.88,82.89
step
clicknpc Bo##166786
Use the First Aid Kit on Bo |q 59930/2 |goto 61.73,83.50
step
clicknpc Mithdran Dawntracker##166791
Use the First Aid Kit on Mithdran Dawntracker |q 59930/3 |goto 61.37,82.60
step
clicknpc Lana Jordan##166796
Use the First Aid Kit on Lana Jordan |q 59930/1 |goto 61.55,82.24
step
talk Warlord Breka Grimaxe##166782
turnin Emergency First Aid##59930 |goto 61.88,82.89
accept Finding the Lost Expedition##59931 |goto 61.88,82.89
step
Travel North to Find Any Expedition Survivors |q 59931/1 |goto 58.36,74.47
step
talk Won'sa##166854
turnin Finding the Lost Expedition##59931 |goto 58.36,74.47
step
talk Warlord Breka Grimaxe##166906
accept Cooking Meat##59932 |goto 58.37,74.64
step
Kill enemies around this area
collect 5 Raw Meat##174072 |q 59932/1 |goto 59.47,72.73
'|kill Coastal Goat##161130, Prickly Porcupine##161131, Coastal Albatross##161133
step
click Campfire##339769
Cook the Meat on the Campfire |q 59932/2 |goto 58.32,74.58
step
talk Won'sa##166854
turnin Cooking Meat##59932 |goto 58.36,74.47
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Druid
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Druid
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.37,74.63
|only if Druid
step
talk Won'sa##166854
accept Northbound##59935 |goto 58.36,74.47
|only if Druid
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Druid
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Hunter
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.86
accept Taming the Wilds##59937 |goto 62.72,69.86
|only if Hunter
step
Watch the dialogue
Learn Tame Beast from Mithdran |q 59937/1 |goto 62.72,69.86
|only if Hunter
step
Tame Any Wildlife Beast |q 59937/2 |goto 61.07,71.37
|tip Use your {o}Tame Beast{} ability on {o}any beast enemy{}.
|only if Hunter
step
talk Mithdran Dawntracker##166996
turnin Taming the Wilds##59937 |goto 62.72,69.86
|only if Hunter
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.63
|only if Mage
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Mage
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.63
|only if Mage
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Mage
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Mage
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59934 |goto 58.38,74.64
|only if Monk
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Use Tiger Palm #6# Times on Warlord Grimaxe |q 59934/1
Use Blackout Kick #3# Times on Warlord Grimaxe |q 59934/2
'|kill Warlord Breka Grimaxe##166916
|only if Monk
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59934 |goto 58.38,74.64
|only if Monk
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Monk
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Monk
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Paladin
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Paladin
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Paladin
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Paladin
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Paladin
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.37,74.64
|only if Priest
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Priest
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.37,74.64
|only if Priest
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Priest
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Priest
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Rogue
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Rogue
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Rogue
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Rogue
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Rogue
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Shaman
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Shaman
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Shaman
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Shaman
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Shaman
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.63
|only if Warlock
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Warlock
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.63
|only if Warlock
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Warlock
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Warlock
step
talk Warlord Breka Grimaxe##166906
accept Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Warrior
step
Watch the dialogue
|tip Follow {o}Warlord Breka Grimaxe{} as she walks.
|tip She doesn't always run to the same location.
kill Warlord Breka Grimaxe
|tip {o}Follow her instructions{}.
|tip Use your abilities when she tells you to.
Prove Your Abilities Against Warlord Grimaxe |q 59933/1
'|kill Warlord Breka Grimaxe##166916
|only if Warrior
step
talk Warlord Breka Grimaxe##166906
|tip She runs to this location.
turnin Enhanced Combat Tactics##59933 |goto 58.38,74.64
|only if Warrior
step
talk Won'sa##175030
accept Northbound##59935 |goto 58.36,74.47
|only if Warrior
step
talk Mithdran Dawntracker##166996
turnin Northbound##59935 |goto 62.72,69.87
|only if Warrior
step
talk Mithdran Dawntracker##166996
accept Down with the Quilboar##59938 |goto 62.72,69.86
accept Forbidden Quilboar Necromancy##59939 |goto 62.72,69.86
step
Kill Quilboar enemies around this area
Slay #7# Quilboars |q 59939/1 |goto 61.03,61.27
'|kill Quilboar Warrior##150237, Quilboar Geomancer##150238
step
kill Geolord Grek'og##151091 |q 59938/1 |goto 58.90,63.02
step
talk Mithdran Dawntracker##167020
turnin Forbidden Quilboar Necromancy##59939 |goto 56.26,59.17
step
talk Cork Fizzlepop##167019
turnin Down with the Quilboar##59938 |goto 56.17,59.12
accept The Choppy Booster Mk. 5##59940 |goto 56.17,59.12
step
Watch the dialogue
clicknpc Choppy Booster Mk 5##167027
Begin Flying with The Choppy Booster Mk. 5 |invehicle |goto 56.05,58.80 |q 59940
step
Watch the dialogue
Use The Choppy Booster Mk. 5 to Scout the Area |q 59940/1 |goto 55.04,54.20 |notravel
step
Watch the dialogue
Return to Cork Fizzlepop |outvehicle |goto 56.07,58.80 |q 59940 |notravel
step
talk Cork Fizzlepop##167019
turnin The Choppy Booster Mk. 5##59940 |goto 56.17,59.12
accept Re-sizing the Situation##59941 |goto 56.17,59.12
step
use the Re-Sizer v9.0.1##178051
|tip Use it on {o}Wandering Boars{}.
Test the Re-Sizer v9.0.1 on #3# Wandering Boars |q 59941/1 |goto 57.00,58.02
'|clicknpc Wandering Boar##156716
step
talk Warlord Breka Grimaxe##167021
turnin Re-sizing the Situation##59941 |goto 56.25,59.04
step
talk Cork Fizzlepop##167019
accept The Re-Deather##59942 |goto 56.17,59.13
step
clicknpc Choppy Booster Mk. 5##167142
Ride The Choppy Booster Mk. 5 |q 59942/1 |goto 56.05,58.80
step
_As You Fly:_
kill 8 Monstrous Cadaver##157091 |q 59942/2
|tip They look like the {o}larger undead enemies{} on the ground.
|tip Use the ability on your action bar.
step
kill Torgok##162817 |q 59942/3 |goto 51.01,52.80
|tip Inside the building.
step
Watch the dialogue
talk Shuja Grimaxe##167128
turnin The Re-Deather##59942 |goto 52.59,53.35
step
talk Warlord Breka Grimaxe##167212
accept Stocking Up on Supplies##59950 |goto 52.18,55.35
step
talk Provisioner Jin'hake##167213
Purchase Any Item from Provisioner Jin'hake |q 59950/1 |goto 52.46,55.67
step
talk Provisioner Jin'hake##167213
Sell Any Item to Provisioner Jin'hake |q 59950/2 |goto 52.46,55.67
step
talk Warlord Breka Grimaxe##167212
turnin Stocking Up on Supplies##59950 |goto 52.18,55.35
step
talk Grunt Throg##167216
accept A Paladin's Service##59958 |goto 52.03,55.45
|only if Paladin
step
talk Grunt Throg##167216
accept A Priest's End##59961 |goto 52.04,55.44
|only if Priest
step
Look for the Corpses of the First Expedition Recruits |q 59961/1 |goto 56.10,53.69
'|clicknpc Sha'zul##167188
|only if Priest
step
talk Sha'zul##167188
turnin A Priest's End##59961 |goto 56.11,53.70
accept Resurrecting the Recruits##59965 |goto 56.11,53.70
|only if Priest
step
Resurrect the Expedition Recruit |q 59965/1 |goto 56.18,52.99 |count 1
|tip Use your {o}Resurrection{} ability on the {o}First Expedition Recruit{}.
'|clicknpc First Expedition Recruit##167592
|only if Priest
step
Resurrect the Expedition Recruit |q 59965/1 |goto 56.25,53.44 |count 2
|tip Use your {o}Resurrection{} ability on the {o}First Expedition Recruit{}.
'|clicknpc First Expedition Recruit##167592
|only if Priest
step
Resurrect the Expedition Recruit |q 59965/1 |goto 56.48,53.66 |count 3
|tip Use your {o}Resurrection{} ability on the {o}First Expedition Recruit{}.
'|clicknpc First Expedition Recruit##167592
|only if Priest
step
talk Sha'zul##167188
turnin Resurrecting the Recruits##59965 |goto 56.10,53.69
|only if Priest
step
talk Grunt Throg##167216
accept A Rogue's End##59967 |goto 52.03,55.45
|only if Rogue
step
talk Drizza Sidestabber##167184
|tip Use your {o}Stealth{} ability to {o}sneak by the elite bear{} that walks around this area.
Ask her _"I'm in. How do I make this poison?"_ |gossip 52644
Tell her _"Get three withering hemlocks and make sure the giant bear isn't near me when I do it. Got it."_ |gossip 52645
Find the First Expedition's Rogue |q 59967/1 |goto 45.64,56.12
|only if Rogue
step
click Withering Hemlock##341951
|tip Use your {o}Stealth{} ability to {o}sneak by the elite bear{} that walks around this area.
|tip Make sure the {o}bear is far away{}, you will {o}become unstealthed{} when you loot the plant.
collect Withering Hemlock##174916 |q 59967/2 |goto 44.77,56.43 |count 1
|only if Rogue
step
click Withering Hemlock##341951
|tip Use your {o}Stealth{} ability to {o}sneak by the elite bear{} that walks around this area.
|tip Make sure the {o}bear is far away{}, you will {o}become unstealthed{} when you loot the plant.
collect Withering Hemlock##174916 |q 59967/2 |goto 45.18,55.69 |count 2
|only if Rogue
step
click Withering Hemlock##341951
|tip Use your {o}Stealth{} ability to {o}sneak by the elite bear{} that walks around this area.
|tip Make sure the {o}bear is far away{}, you will {o}become unstealthed{} when you loot the plant.
collect Withering Hemlock##174916 |q 59967/2 |goto 45.09,54.67 |count 3
|only if Rogue
step
talk Drizza Sidestabber##167586
turnin A Rogue's End##59967 |goto 45.65,56.13
accept The Deadliest of Poisons##59968 |goto 45.65,56.13
|only if Rogue
step
Cast Instant Poison |q 59968/1
|tip Use your {o}Instant Poison{} ability.
|only if Rogue
step
kill Gutgruk the Tough |q 59968/2 |goto 48.85,51.51
|tip He walks along the road.
'|kill Gutgruk the Tough##163036
|only if Rogue
step
talk Grunt Throg##167216
turnin The Deadliest of Poisons##59968 |goto 52.03,55.44
|only if Rogue
step
talk Ghost Wolf##163329
accept A Shaman's Duty##59002 |goto 52.30,55.65
|only if Shaman
step
click Veil Blossom##342366
collect Veil Blossom##174968 |q 59002/1 |goto 52.12,51.65 |count 1
|only if Shaman
step
click Veil Blossom##342366
collect Veil Blossom##174968 |q 59002/1 |goto 51.86,51.14 |count 2
|only if Shaman
step
click Veil Blossom##342366
collect Veil Blossom##174968 |q 59002/1 |goto 52.52,51.01 |count 3
|only if Shaman
step
click Veil Blossom##342366
collect Veil Blossom##174968 |q 59002/1 |goto 53.21,51.37 |count 4
|only if Shaman
step
click Campfire
Burn the Blossoms on the Campfire |q 59002/2 |goto 52.24,55.53
|only if Shaman
step
clicknpc Ghost Wolf##163338
Free the Captured Ghost Wolf |q 59002/3 |goto 54.39,58.46 |count 1
|only if Shaman
step
clicknpc Ghost Wolf##163338
Free the Captured Ghost Wolf |q 59002/3 |goto 55.27,52.80 |count 2
|only if Shaman
step
clicknpc Ghost Wolf##163338
Free the Captured Ghost Wolf |q 59002/3 |goto 55.40,50.79 |count 3
|only if Shaman
step
talk Ghost Wolf##163329
turnin A Shaman's Duty##59002 |goto 52.30,55.65
|only if Shaman
step
talk Grunt Throg##167216
accept A Warlock's Bargain##59970 |goto 52.03,55.45
|only if Warlock
step
talk Sprag Buzzboom##167478
Select  _"<Rise and retrieve the warlock's grimoire and finish the ritual to summon a voidwalker.>"_ |gossip 52639
Investigate the Dead Warlock's Body |q 59970/1 |goto 52.52,45.86
|only if Warlock
step
click Old Grimoire##350998
Recover the Old Grimoire |q 59970/2 |goto 52.60,45.85
|only if Warlock
step
use the Old Grimoire##174947
Summon the Voidwalker with the Grimoire |q 59970/3 |goto 52.60,45.85
|only if Warlock
step
talk Summoned Voidwalker##163246
turnin A Warlock's Bargain##59970 |goto 52.61,45.44
|only if Warlock
step
talk Grunt Throg##167216
accept A Warrior's End##59971 |goto 52.03,55.45
|only if Warrior
step
talk Hjalmar the Undying##162943
|tip He walks around on the bridge.
turnin A Warrior's End##59971 |goto 51.48,47.86
accept Hjalmar's Final Execution##59972 |goto 51.48,47.86
|only if Warrior
step
talk Hjalmar the Undying##162943
|tip He walks around on the bridge.
Tell him _"I'm ready to fight you, Hjalmar. I'll give you your warrior's death with Execute."_ |gossip 51265
kill Hjalmar the Undying##162943
Slay Hjalmar the Undying with Execute |q 59972/1 |goto 51.48,47.86
|tip Use your {o}Execute{} ability for the {o}final blow to kill him{}.
|only if Warrior
step
talk Grunt Throg##167216
turnin Hjalmar's Final Execution##59972 |goto 52.03,55.45
|only if Warrior
step
talk Lana Jordan##167221
accept Westward Bound##59948 |goto 52.90,56.45
step
Watch the dialogue
talk Lana Jordan##167225
|tip She runs to this location.
turnin Westward Bound##59948 |goto 51.11,59.51
accept Who Lurks in the Pit##59949 |goto 51.11,59.51
step
Run down the spiral ramp and enter the cave |goto 51.03,60.45 < 7 |walk
click Thick Cocoon##339568
|tip Inside the cave.
Rescue the Trapped Expedition Member |q 59949/1 |goto 52.05,60.01 |count 1
step
click Thick Cocoon##339568
|tip Inside the cave.
Rescue the Trapped Expedition Member |q 59949/1 |goto 50.28,58.69 |count 2
step
click Thick Cocoon##339568
|tip Inside the cave.
Rescue the Trapped Expedition Member |q 59949/1 |goto 49.69,61.95 |count 3
step
click Thick Cocoon##339568
|tip Inside the cave.
Rescue the Trapped Expedition Member |q 59949/1 |goto 51.97,60.72 |count 4
step
click Thick Cocoon##339568
|tip Inside the cave.
Rescue the Trapped Expedition Member |q 59949/1 |goto 50.89,58.10 |count 5
step
kill Hrun the Exiled##156900
|tip Inside the cave.
Defeat Hrun to Rescue Crenna Earth-Daughter |q 59949/2 |goto 47.41,60.48
step
Watch the dialogue
|tip Inside the cave.
talk Crenna Earth-Daughter##167250
|tip She will take you out of the cave.
Ride Crenna Earth-Daughter to Escape |q 59949/3 |goto 47.78,60.28
step
talk Warlord Breka Grimaxe##167212
turnin Who Lurks in the Pit##59949 |goto 52.18,55.35
step
talk Crenna Earth-Daughter##166575
accept A Druid's Form##59951 |goto 52.32,55.43
|only if Druid
step
click Druid Stone
Commune with the Druid Stone |q 59951/1 |goto 45.38,49.24
|only if Druid
step
talk Crenna Earth-Daughter##167473
turnin A Druid's Form##59951 |goto 45.50,49.27
|only if Druid
step
talk Shuja Grimaxe##167219
accept The Harpy Problem##59943 |goto 53.79,52.18
step
talk Lightspawn##157114
accept Freeing the Light##54933 |goto 58.19,50.21
step
click Ritual Pedestal
Disperse the First Necrotic Energy |q 54933/1 |goto 57.44,49.69
step
click Ritual Pedestal
Disperse the Second Necrotic Energy |q 54933/2 |goto 58.47,49.17
step
click Ritual Pedestal
Disperse the Third Necrotic Energy |q 54933/3 |goto 58.99,50.66
step
click Ritual Pedestal
Disperse the Fourth Necrotic Energy |q 54933/4 |goto 57.84,51.19
step
talk Daelya Twilightsbane##167179
Ask her _"What does the Light wish of me?"_ |gossip 52641
Speak with the Ghost Paladin |q 59958/1 |goto 57.57,52.21
|only if Paladin
step
talk Daelya Twilightsbane##167179
turnin A Paladin's Service##59958 |goto 57.57,52.21
accept The Divine's Shield##60174 |goto 57.57,52.21
|only if Paladin
step
Use Divine Shield |q 60174/1
|tip Use your {o}Divine Shield{} ability.
|tip {o}HURRY{} in the next step.
|only if Paladin
step
click Necrotic Altar
Destroy the Necrotic Altar |q 60174/2 |goto 57.15,52.66
|only if Paladin
step
talk Daelya Twilightsbane##167179
turnin The Divine's Shield##60174 |goto 57.57,52.21
|only if Paladin
step
Watch the dialogue
talk Lightspawn##157114
turnin Freeing the Light##54933 |goto 58.19,50.21
step
talk Bo##167291
turnin The Harpy Problem##59943 |goto 56.93,46.23
accept Harpy Culling##59945 |goto 56.93,46.23
accept Purge the Totems##59946 |goto 56.93,46.23
step
talk Shuja Grimaxe##167290
accept The Rescue of Herbert Gloomburst##59944 |goto 56.82,46.18
stickystart "Slay_Harpies_And_Cohorts"
step
click Harpy Totem
Burn the Harpy Totem |q 59946/1 |goto 58.21,44.49 |count 1
step
click Harpy Totem
Burn the Harpy Totem |q 59946/1 |goto 58.85,42.94 |count 2
step
click Harpy Totem
Burn the Harpy Totem |q 59946/1 |goto 61.23,41.30 |count 3
step
click Harpy Totem
Burn the Harpy Totem |q 59946/1 |goto 59.00,39.08 |count 4
step
click Harpy Totem
Burn the Harpy Totem |q 59946/1 |goto 57.17,42.21 |count 5
step
talk Herbert Gloomburst##167298
Ask him _"I'll fight the harpies that come. Can you use your magic to break free?"_ |gossip 52949
Kill the enemies that attack in waves
|tip Your allies will help you fight.
kill Bloodbeak##153964
|tip It looks like a {o}large bird{} that flies down and attacks you.
Rescue Herbert Gloomburst |q 59944/1 |goto 54.29,41.61
step
label "Slay_Harpies_And_Cohorts"
Kill enemies around this area
Slay #10# Harpies and Cohorts |q 59945/1 |goto 57.17,42.21
'|kill Harpy Snatcher##152571, Harpy Boltcaller##152843, Hunting Worg##152998, Harpy Ambusher##155192
step
talk Herbert Gloomburst##167182
turnin The Rescue of Herbert Gloomburst##59944 |goto 56.91,46.14
step
talk Bo##167291
turnin Harpy Culling##59945 |goto 56.94,46.24
turnin Purge the Totems##59946 |goto 56.94,46.24
step
talk Shuja Grimaxe##167290
accept Message to Base##59947 |goto 56.83,46.18
step
talk Warlord Breka Grimaxe##167212
turnin Message to Base##59947 |goto 52.18,55.34
step
talk Mithdran Dawntracker##167215
accept A Hunter's Trap##59952 |goto 52.56,55.43
|only if Hunter
step
talk Herbert Gloomburst##167309
|tip He runs to this location.
Ask him _"Herbert, do you have an ice mote I can use?"_ |gossip 52664
Receive an Ice Mote from Herbert Gloomburst |q 59952/1 |goto 52.16,55.48
|only if Hunter
step
click Rusted Chains
collect Rusted Chain##175981 |q 59952/2 |goto 52.24,53.03
|only if Hunter
step
click Old Spring
collect Old Spring##175980 |q 59952/3 |goto 51.83,51.63
|only if Hunter
step
talk Mithdran Dawntracker##167215
turnin A Hunter's Trap##59952 |goto 52.56,55.43
accept Hunting the Stalker##59953 |goto 52.56,55.43
|only if Hunter
step
Watch the dialogue
|tip Use your {o}Freezing Trap{} ability.
Capture the Stalker |q 59953/1 |goto 52.40,54.36
|only if Hunter
step
Watch the dialogue
talk Mithdran Dawntracker##167215
|tip He walks back to this location.
turnin Hunting the Stalker##59953 |goto 52.56,55.44
accept The Art of Taming##60162 |goto 52.56,55.44
|only if Hunter
step
Temporarily Dismiss Your Current Pet |q 60162/1 |goto 52.56,55.44
|tip Use your {o}Dismiss Pet{} ability.
|only if Hunter
step
talk Mithdran Dawntracker##167215
Tell him _"I'm ready to tame my pet, call them out."_ |gossip 52668
Watch the dialogue
|tip Use your {o}Tame Beast{} ability.
|tip Use it on the beast that appears nearby.
Speak with Mithdran to Summon and Tame Your New Pet |q 60162/2 |goto 52.56,55.44
|only if Hunter
step
talk Mithdran Dawntracker##167215
Tell him _"I'd like to stable my pet here."_ |gossip 52666
Speak with Mithdran to Learn About Pet Stables |q 60162/3 |goto 52.56,55.44
|only if Hunter
step
talk Mithdran Dawntracker##167215
turnin The Art of Taming##60162 |goto 52.56,55.44
|only if Hunter
step
talk Herbert Gloomburst##167309
|tip He runs to this location.
accept A Mage's Knowledge##59954 |goto 52.16,55.49
|only if Mage
step
click Herbert's Spellbook##351335
|tip Underwater.
Recover Herbert's Book from the Lake |q 59954/1 |goto 51.95,49.84
|only if Mage
step
talk Herbert Gloomburst##167309
turnin A Mage's Knowledge##59954 |goto 52.16,55.49
|only if Mage
step
Watch the dialogue
talk Herbert Gloomburst##167309
accept The Best Way to Use Sheep##59955 |goto 52.16,55.49
|only if Mage
step
talk Herbert Gloomburst##167309
Tell him _"I'm ready to practice polymorph."_ |gossip 52665
Speak with Herbert to Begin Sparring |q 59955/1 |goto 52.16,55.49
|only if Mage
step
Practice Polymorph with Throg |q 59955/2 |goto Exile's Reach/0 53.66,53.92
|tip Use your {o}Polymorph{} ability on {o}Herbert Gloomburst{}.
|tip Attack him after polymorphing him.
'|clicknpc Herbert Gloomburst##167529
|only if Mage
step
talk Herbert Gloomburst##167309
turnin The Best Way to Use Sheep##59955 |goto 52.16,55.49
|only if Mage
step
talk Bo##167308
accept A Monk's Focus##59956 |goto 52.03,55.21
|only if Monk
step
talk Bo##167537
|tip He runs to this location.
Tell him _"I'm ready, let's begin to meditate."_ |gossip 52640
Watch the dialogue
Meditate with Bo |q 59956/1 |goto 52.62,49.49
|only if Monk
step
talk Bo##167537
turnin A Monk's Focus##59956 |goto 52.62,49.49
accept One Last Spar##59957 |goto 52.62,49.49
|only if Monk
step
kill Bo
|tip Use your {o}Touch of Death{} ability on him.
|tip Use it {o}when he has lower health than you{}.
|tip The ability will {o}start glowing{} when you can use it.
|tip He may run to a different location nearby.
Use Touch of Death on Bo |q 59957/1 |goto Exile's Reach/0 54.22,48.26
'|kill Bo##167537
|only if Monk
step
talk Warlord Breka Grimaxe##167212
turnin One Last Spar##59957 |goto 52.18,55.34
|only if Monk
step
talk Warlord Breka Grimaxe##167212
accept To Darkmaul Citadel##59975 |goto 52.17,55.34
step
click Danger Sign##330627
accept Killclaw the Terrible##56839 |goto Exile's Reach/0 48.76,54.24
step
kill Killclaw the Terrible##153266 |q 56839/1 |goto 46.19,55.09
|tip He looks like a large {o}elite{} bear.
|tip He walks around this area.
|tip If you have trouble, try to find someone to help you, or skip the quest.
step
click Hidden Treasure Chest##155733
|tip Inside the cave.
|tip The {o}bear respawns quickly{}, so leave the valley when you've looted the chest.
turnin Killclaw the Terrible##56839 |goto 43.45,51.06
step
talk Warlord Breka Grimaxe##167596
|tip She runs to this location.
turnin To Darkmaul Citadel##59975 |goto 48.95,49.33
accept Right Beneath Their Eyes##59978 |goto 48.95,49.33
step
talk Herbert Gloomburst##167598
Tell him _"I'm ready, transform me into an ogre and I'll sneak into their citadel."_ |gossip 54297
Watch the dialogue
Ask Herbert to Perform Ogre Transformation Spell |q 59978/1 |goto 48.93,49.46
step
Enter Darkmaul Citadel |q 59978/2 |goto 45.66,44.57
step
Find the Ogre Cooking Area |q 59978/3 |goto 45.69,37.57
step
Wave to Gor'groth |q 59978/4 |goto 45.69,37.57
|tip Perform the {o}/wave{} emote. |script DoEmote("WAVE")
'|clicknpc Gor'groth##153580
step
Reach the Citadel Entrance |q 59978/6 |goto 41.04,32.92
step
Watch the dialogue
talk Warlord Breka Grimaxe##167633
turnin Right Beneath Their Eyes##59978 |goto 40.29,32.46
accept Controlling their Stones##59981 |goto 40.29,32.46
step
talk Shuja Grimaxe##167632
accept Like Ogres to the Slaughter##59979 |goto 40.25,32.56
step
talk Herbert Gloomburst##167631
accept Catapult Destruction##59980 |goto 40.36,32.42
stickystart "Slay_Ogres"
step
kill Wug##153582
|tip Inside the building.
Recover Wug's Ward Stone |q 59981/2 |goto 44.16,37.34
step
kill Jugnug##153583
|tip Inside the building.
Recover Jugnug's Ward Stone |q 59981/1 |goto 47.55,34.19
step
click Catapult
Destroy the Catapult |q 59980/1 |goto 47.01,36.55 |count 1
step
click Catapult
Destroy the Catapult |q 59980/1 |goto 46.04,39.66 |count 2
step
click Catapult
Destroy the Catapult |q 59980/1 |goto 45.08,41.59 |count 3
step
click Catapult
Destroy the Catapult |q 59980/1 |goto 43.61,42.80 |count 4
step
kill Grunk##153581
|tip Inside the building.
Recover Grunk's Ward Stone |q 59981/3 |goto 42.82,40.97
step
label "Slay_Ogres"
Kill enemies around this area
Slay #8# Ogres |q 59979/1 |goto 45.75,39.09
'|kill Ogre Shadowcaster##153242, Ogre Chef##154103, Ogre Brute##153239
step
talk Herbert Gloomburst##167631
turnin Catapult Destruction##59980 |goto 40.36,32.43
step
talk Shuja Grimaxe##167632
turnin Like Ogres to the Slaughter##59979 |goto 40.25,32.56
step
click Ogre Runestone
Disable the Rune Holding Warlord Thunderwalker |q 59981/4 |goto 39.96,32.44 |count 1
step
click Ogre Runestone
Disable the Rune Holding Warlord Thunderwalker |q 59981/4 |goto 39.75,32.07 |count 2
step
click Ogre Runestone
Disable the Rune Holding Warlord Thunderwalker |q 59981/4 |goto 40.05,31.98 |count 3
step
Watch the dialogue
talk Warlord Mulgrin Thunderwalker##167183
turnin Controlling their Stones##59981 |goto 39.93,32.15
accept Dungeon: Darkmaul Citadel##59984 |goto 39.93,32.15
step
Open the Group Finder
|tip Press {o}I{} to open the Group Finder.
Enter the Darkmaul Citadel Dungeon |q 59984/1
step
_Inside the Dungeon:_
kill Ravnyr##156501
|tip He is the {o}final boss{} of the dungeon.
|tip Follow {o}Warlord Breka Grimaxe{} through the dungeon.
Stop Gor'groth's Final Ritual |q 59984/2
'|clicknpc Warlord Grimaxe##167663
step
_Inside the Dungeon:_
talk Warlord Grimaxe##167663
|tip Nearby, after killing the final boss.
Tell her _"Let's get out of the citadel and figure out how to get back home."_ |gossip 52784
Speak with Warlord Grimaxe to Leave Darkmaul Citadel |q 59984/3
step
Watch the dialogue
talk Warlord Breka Grimaxe##167675
turnin Dungeon: Darkmaul Citadel##59984 |goto Exile's Reach/0 39.65,31.98
accept An End to Beginnings##59985 |goto Exile's Reach/0 39.65,31.98
step
Watch the dialogue
clicknpc Horde Wyvern##167669
Ride the Horde Wyvern Back to Orgrimmar |q 59985/1 |goto 40.38,32.63
step
Reach Orgrimmar |outvehicle |q 59985
step
talk Warlord Breka Grimaxe##168431
turnin An End to Beginnings##59985 |goto Orgrimmar/1 52.51,88.11
step
talk Warlord Breka Grimaxe##168431
|tip If you've already completed this quest on a previous character, you can skip it.
accept Welcome to Orgrimmar##60343 |goto Orgrimmar/1 52.51,88.11 |or |next "Welcome_To_Orgrimmar" |noautoaccept
_Or_
Select  _"I know my way around Orgrimmar. <Skip the city tour and choose a Timewalking Campaign.>"_ |gossip 51745 |noautogossip
accept Adventurers Wanted: Chromie's Call##62568 |goto Orgrimmar/1 52.51,88.11 |or |next "Leveling Guides\\Starter Guides\\Chromie Time" |noautoaccept
step
label "Welcome_To_Orgrimmar"
talk Cork Fizzlepop##168441
turnin Welcome to Orgrimmar##60343 |goto Orgrimmar/1 51.89,85.25
accept Finding Your Way##60344 |goto Orgrimmar/1 51.89,85.25
step
talk Orgrimmar Grunt##168459
Tell her _"Stable Master"_ |gossip 109405
Ask a Guard for Directions to the Stable Master |q 60344/1 |goto 52.47,84.22
step
talk Cork Fizzlepop##168441
Tell him _"Let's head to the stables."_ |gossip 53604
Speak with Cork Fizzlepop |q 60344/2 |goto 52.25,84.41
step
Watch the dialogue
Ride with Cork Fizzlepop to the Stables |q 60344/3 |goto 71.22,47.57 |notravel
step
talk Rohaka Tuskmaul##168540
turnin Finding Your Way##60344 |goto 71.57,47.55
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60346
|only if Druid
step
talk Telotha Pinegrove##168553
|tip Inside the building.
Tell her _"Tell me about my specialization options."_ |gossip 52754
Speak with Telotha Pinegrove to Learn About Specializations |q 60346/1 |goto 72.93,43.25
|only if Druid
step
Activate a Combat Specialization |q 60346/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Druid
step
talk Telotha Pinegrove##168553
|tip Inside the building.
turnin What's Your Specialty?##60346 |goto 72.93,43.25
|only if Druid
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60347
|only if Hunter
step
talk Tamanji##168551
|tip Inside the building.
Tell her _"Tell me about my specialization options."_ |gossip 52753
Speak with Tamanji to Learn About Specializations |q 60347/1 |goto 73.90,43.59
|only if Hunter
step
Activate a Combat Specialization |q 60347/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Hunter
step
talk Tamanji##168551
|tip Inside the building.
turnin What's Your Specialty?##60347 |goto 73.90,43.59
|only if Hunter
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60348
|only if Mage
step
talk Feenix Arcshine##168626
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52751
Speak with Feenix Arcshin to Learn About Specializations |q 60348/1 |goto 74.69,43.60
|only if Mage
step
Activate a Combat Specialization |q 60348/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Mage
step
talk Feenix Arcshine##168626
|tip Inside the building.
turnin What's Your Specialty?##60348 |goto 74.69,43.60
|only if Mage
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60349
|only if Monk
step
talk Huinli Wingpaw##168619
|tip Inside the building.
Tell her _"Tell me about my specialization options."_ |gossip 52750
Speak with Huinli Wingpaw to Learn About Specializations |q 60349/1 |goto 75.68,43.58
|only if Monk
step
Activate a Combat Specialization |q 60349/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Monk
step
talk Huinli Wingpaw##168619
|tip Inside the building.
turnin What's Your Specialty?##60349 |goto 75.68,43.58
|only if Monk
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60350
|only if Paladin
step
talk Avaros Dawnglaive##168597
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52749
Speak with Avaros Dawnglaive to Learn About Specializations |q 60350/1 |goto 73.19,47.42
|only if Paladin
step
Activate a Combat Specialization |q 60350/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Paladin
step
talk Avaros Dawnglaive##168597
|tip Inside the building.
turnin What's Your Specialty?##60350 |goto 73.19,47.42
|only if Paladin
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60351
|only if Priest
step
talk Martin Goodchilde##168621
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52748
Speak with Martin Goodchilde to Learn About Specializations |q 60351/1 |goto 72.64,46.92
|only if Priest
step
Activate a Combat Specialization |q 60351/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Priest
step
talk Martin Goodchilde##168621
|tip Inside the building.
turnin What's Your Specialty?##60351 |goto 72.64,46.92
|only if Priest
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60352
|only if Rogue
step
talk Thega Graveblade##168598
|tip Inside the building.
Tell her _"Tell me about my specialization options."_ |gossip 52747
Speak with Thega Graveblade to Learn About Specializations |q 60352/1 |goto 75.46,47.50
|only if Rogue
step
Activate a Combat Specialization |q 60352/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Rogue
step
talk Thega Graveblade##168598
|tip Inside the building.
turnin What's Your Specialty?##60352 |goto 75.46,47.50
|only if Rogue
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60353
|only if Shaman
step
talk Hretar Riverspeaker##168628
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52746
Speak with Mulric Boldrock to Learn About Specializations |q 60353/1 |goto 73.40,43.09
|only if Shaman
step
Activate a Combat Specialization |q 60353/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Shaman
step
talk Hretar Riverspeaker##168628
|tip Inside the building.
turnin What's Your Specialty?##60353 |goto 73.40,43.09
|only if Shaman
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60355
|only if Warlock
step
talk Kazak Darkscream##168623
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52744
Speak with Kazak Darkscream to Learn About Specializations |q 60355/1 |goto 74.62,47.42
|only if Warlock
step
Activate a Combat Specialization |q 60355/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Warlock
step
talk Kazak Darkscream##168623
|tip Inside the building.
turnin What's Your Specialty?##60355 |goto 74.62,47.42
|only if Warlock
step
_Next to you:_
talk Cork Fizzlepop##168545
accept What's Your Specialty?##60357
|only if Warrior
step
talk Gormok Ogrefist##168596
|tip Inside the building.
Tell him _"Tell me about my specialization options."_ |gossip 52745
Speak with Gormok Ogrefist to Learn About Specializations |q 60357/1 |goto 73.76,47.12
|only if Warrior
step
Activate a Combat Specialization |q 60357/2
|tip Press {o}N{}, choose a specialization, and click the {o}Activate{} button.
|only if Warrior
step
talk Gormok Ogrefist##168596
|tip Inside the building.
turnin What's Your Specialty?##60357 |goto 73.76,47.12
|only if Warrior
step
_Next to you:_
talk Cork Fizzlepop##168545
accept Home Is Where the Hearth Is##60359
step
talk Innkeeper Nufa##46642
|tip Inside the building.
Tell her _"Make this inn your home."_ |gossip 53444
Make the Wyvern's Tail Your Home |q 60359/1 |goto 71.31,49.95
step
talk Innkeeper Nufa##46642
|tip Inside the building.
turnin Home Is Where the Hearth Is##60359 |goto 71.31,49.95
|next Leveling Guides\\Starter Guides\\Chromie Time
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Starter Guides\\Chromie Time",{
author="support@zygorguides.com",
description="This guide will assist you in changing the expansion you will\n"..
"\nlevel up in by speaking with Chromie.\n",
condition_suggested=function() return level >= 10 and level <= 50 end,
startlevel=10.0,
endlevel=50.0,
image=ZGV.IMAGESDIR.."BfAIntro",
},[[
step
_Are You Eligible For Chromie Time?_
|tip If you already have {o}another max level character{}, you are {o}eligible{} for Chromie Time.
|tip Otherwise, you must level up in the {o}Dragon Isles (Dragonflight) zones{}.
|tip Chromie Time allows you to {o}choose a different expansion{} to level up to in.
No - Level in Dragonflight Zones	|confirm	|or	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
Yes - Choose a Different Expansion	|confirm	|or	|next "Chromie_Time_Start"
step
label "Chromie_Time_Start"
talk Chromie##167032
Tell her _"(Recommended) Select a timeline."_ |gossip 51901 |noautogossip
_Or_
Tell her _"I'd like to return to the present timeline, Chromie."_ |gossip 51903 |noautogossip
|tip If you've {o}already selected a different expansion{}, but want to {o}return to leveling in the Dragonflight zones{}, choose this.
Click Here After Choosing an Expansion |confirm |goto Orgrimmar/1 40.82,80.14
step
_Which Expansion Did You Choose?_
Burning Crusade		|confirm	|or	|next "Burning_Crusade"
Wrath of the Lich King	|confirm	|or	|next "Wrath_Of_The_Lich_King"
The Cataclysm		|confirm	|or	|next "The_Cataclysm"
Mists of Pandaria	|confirm	|or	|next "Mists_Of_Pandaria"
Warlords of Draenor	|confirm	|or	|next "Warlords_Of_Draenor"
Legion			|confirm	|or	|next "Legion"
Battle for Azeroth	|confirm	|or	|next "Battle_For_Azeroth"
Shadowlands		|confirm	|or	|next "Shadowlands"
Dragonflight		|confirm	|or	|next "Dragonflight"
step
label "Burning_Crusade"
accept Burning Crusade: To Outland!##60123 |or
'|accept Onward to Adventure: Outland##60959 |or
|tip You will accept this quest automatically.
step
talk Thrallmar Mage##150131
|tip Downstairs inside the building.
Tell him _"I must report to the Dark Portal."_ |gossip 50005
Talk to the Thrallmar Mage |q 60123/1 |goto Orgrimmar/1 57.15,90.71
|only if haveq(60123)
step
Go Through the Dark Portal |q 60123/2 |goto Blasted Lands/0 55.01,54.17
|only if haveq(60123)
step
Travel to Hellfire Peninsula |q 60959/1 |goto Hellfire Peninsula/0 87.00,49.00
|only if haveq(60959)
step
_Click the Complete Quest Box:_
turnin Burning Crusade: To Outland!##60123 |only if haveq(60123) or completedq(60123)
turnin Onward to Adventure: Outland##60959 |only if haveq(60959) or completedq(60959)
|next "Leveling Guides\\The Burning Crusade (10-60)\\Hellfire Peninsula (10-60)"
step
label "Wrath_Of_The_Lich_King"
accept Wrath of the Lich King: To Northrend!##60097 |or |only if haveq(60097)
'|accept Onward to Adventure: Northrend##60963 |or |only if haveq(60963)
|tip You will accept this quest automatically.
step
_Which Zone Do You Want to Start In?_
|tip It {o}doesn't matter{}, just preference.
Borean Tundra |confirm |next "Borean_Tundra"
Howling Fjord |confirm |next "Howling_Fjord"
step
label "Borean_Tundra"
talk Auctioneer Ralinza##44867
|tip Inside the building.
buy Overcharged Capacitor##39682 |n
|tip This is for a {o}future quest{}.
|tip If you can't get one, skip it.
collect Overcharged Capacitor##39682 |goto Orgrimmar/1 53.97,72.99 |q 11650 |future
step
Take the Zeppelin to Northrend |q 60097/1 |goto Borean Tundra/0 41.62,53.99
|only if haveq(60097)
step
Travel to Northrend |q 60963/1 |goto Borean Tundra/0 41.62,53.99
|only if haveq(60963)
step
_Click the Complete Quest Box:_
turnin Wrath of the Lich King: To Northrend!##60097 |only if haveq(60097) or completedq(60097)
turnin Onward to Adventure: Northrend##60963 |only if haveq(60963) or completedq(60963)
|next "Leveling Guides\\Wrath of the Lich King (10-60)\\Borean Tundra (10-60)"
step
label "Howling_Fjord"
Take the Zeppelin to Northrend |q 60097/1 |goto Borean Tundra/0 41.62,53.99
|only if haveq(60097)
step
Travel to Northrend |q 60963/1 |goto Howling Fjord/0 78.54,28.98
|only if haveq(60963)
step
_Click the Complete Quest Box:_
turnin Wrath of the Lich King: To Northrend!##60097 |only if haveq(60097) or completedq(60097)
turnin Onward to Adventure: Northrend##60963 |only if haveq(60963) or completedq(60963)
|next "Leveling Guides\\Wrath of the Lich King (10-60)\\Howling Fjord (10-60)"
step
label "The_Cataclysm"
accept Onward to Adventure: Kalimdor##60887
|tip You will accept this quest automatically.
step
click Warchief's Command Board
Find the Warchief's Command Board |q 60887/1 |goto Orgrimmar/1 49.67,76.47
step
talk Chromie##172387
turnin Onward to Adventure: Eastern Kingdoms##60891 |goto 49.02,76.46
step
_Choose a Leveling Zone:_
|tip Browse your {o}world map{} for {o}Eastern Kingdoms{} and {o}Kalimdor{}.
|tip Choose {o}any zone{} that fits your character's level, and load the {o}Leveling guide for that zone{} using the guide menu.
|tip Keep doing this until {o}Chromie Time ends{} and you need to go to the new zones.
Click Here to Return to Chromie |confirm |next "Chromie_Time_Start"
step
label "Mists_Of_Pandaria"
accept Mists of Pandaria: To Pandaria!##60126
|tip You will accept this quest automatically.
step
Visit Grommash Hold |q 60126/1 |goto Orgrimmar/1 49.88,75.55
|tip Inside the building.
step
talk General Nazgrim##54870
|tip Inside the building.
turnin Mists of Pandaria: To Pandaria!##60126 |goto 48.67,70.36
accept All Aboard!##31853 |goto 48.67,70.36
step
talk Doras##3310
|tip Up on the plateau above the city.
Tell him _"I need a flight to Hellscream's Fist."_ |gossip 30402
Secure a Flight to Hellscream's Fist |invehicle |goto 49.66,59.22 |q 31853
step
Fly to Hellscream's Fist |outvehicle |q 31853
step
talk General Nazgrim##55054
|tip On the air ship.
Speak to General Nazgrim on Hellscream's Fist |q 31853/2 |goto Azshara/0 37.88,95.77
step
talk General Nazgrim##55054
|tip On the air ship.
turnin All Aboard!##31853 |goto 37.88,95.77
accept Into the Mists##29690 |goto 37.88,95.77
step
talk General Nazgrim##55054
|tip On the air ship.
Tell him _"I'm ready to go, General."_ |gossip 41023
Discover Pandaria |q 29690/1 |goto 37.88,95.77
step
talk General Nazgrim##55135
|tip Inside the room on the deck of the air ship.
turnin Into the Mists##29690 |goto The Jade Forest/0 30.79,10.22
|next "Leveling Guides\\Pandaria (10-60)\\The Jade Forest (10-60)"
step
label "Warlords_Of_Draenor"
accept Warlords of Draenor: The Dark Portal##34398
|tip You will accept this quest automatically.
step
talk Vanguard Battlemage##149626
|tip Downstairs inside the building.
Tell her _"I must help Khadgar. Send me to the Blasted Lands!"_ |gossip 51034
Talk to the Vanguard Battlemage |q 34398/1 |goto Orgrimmar/1 55.82,91.45
|only if haveq(34398)
step
talk Zidormi##141489
Tell her _"Take me back to the present."_ |gossip 42959
Travel to the Present |complete not ZGV.InPhase("Old Blasted Lands") |goto Blasted Lands/0 48.16,7.28 |q 34398
step
talk Ameri Windblade##85734
fpath Shattered Landing |goto Blasted Lands/0 72.95,48.64
step
talk Archmage Khadgar##78423
Tell him _"FOR AZEROTH!"_ |gossip 43231
Speak with Archmage Khadgar |q 34398/2 |goto 54.93,50.41
step
talk Archmage Khadgar##78558
turnin Warlords of Draenor: The Dark Portal##34398 |goto Assault on the Dark Portal/0 54.79,48.27
|next "Leveling Guides\\Draenor (10-60)\\Draenor Intro"
step
label "Legion"
accept Legion: Onward to Adventure: Broken Isles##60970
|tip You will accept this quest automatically.
step
Travel to the Broken Isles |q 60970/1 |goto Azsuna/0 46.82,41.36
step
_Click the Complete Quest Box:_
turnin Legion: Onward to Adventure: Broken Isles##60970
step
|next "Leveling Guides\\Legion (10-60)\\Death Knight\\Death Knight Intro & Artifacts" |only if DeathKnight
|next "Leveling Guides\\Legion (10-60)\\Demon Hunter\\Demon Hunter Intro & Artifacts" |only if DemonHunter
|next "Leveling Guides\\Legion (10-60)\\Druid\\Druid Intro & Artifacts" |only if Druid
|next "Leveling Guides\\Legion (10-60)\\Hunter\\Hunter Intro & Artifacts" |only if Hunter
|next "Leveling Guides\\Legion (10-60)\\Mage\\Mage Intro & Artifacts" |only if Mage
|next "Leveling Guides\\Legion (10-60)\\Monk\\Monk Intro & Artifacts" |only if Monk
|next "Leveling Guides\\Legion (10-60)\\Paladin\\Paladin Intro & Artifacts" |only if Paladin
|next "Leveling Guides\\Legion (10-60)\\Priest\\Priest Intro & Artifacts" |only if Priest
|next "Leveling Guides\\Legion (10-60)\\Rogue\\Rogue Intro & Artifacts" |only if Rogue
|next "Leveling Guides\\Legion (10-60)\\Shaman\\Shaman Intro & Artifacts" |only if Shaman
|next "Leveling Guides\\Legion (10-60)\\Warlock\\Warlock Intro & Artifacts" |only if Warlock
|next "Leveling Guides\\Legion (10-60)\\Warrior\\Warrior Intro & Artifacts" |only if Warrior
step
label "Battle_For_Azeroth"
accept Battle for Azeroth: Mission Statement##51443
|tip You will accept this quest automatically.
step
Speak to Warchief Sylvanas Windrunner in Orgrimmar |q 51443/1 |goto Orgrimmar/1 48.61,71.98
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
Meet your Team |q 51443/2 |goto 54.52,78.40
step
talk Nathanos Blightcaller##135205
|tip Inside the building.
turnin Battle for Azeroth: Mission Statement##51443 |goto 54.45,78.42
|next "Leveling Guides\\Battle for Azeroth (10-60)\\Zandalar\\Zuldazar (10-60)"
step
label "Shadowlands"
accept Shadowlands: A Chilling Summons##61874 |goto Orgrimmar/1 51.64,81.09
|tip You will automatically accept this quest.
step
talk Nazgrim##171791
Tell him _"Tell me what happened."_ |gossip 52727 |noautogossip
Learn About Your Leaders' Fate |q 61874/1 |goto 50.39,76.57 |or
|tip If you {o}already completed{} the Shadowlands intro, you can skip it.
Skip the Shadowlands Intro |complete completedq(59770) |goto 50.39,76.57 |or |next "Skip_Shadowlands_Intro"
step
Watch the dialogue
click Death Gate to Acherus
Take the Death Gate to Acherus |q 61874/2 |goto 48.45,77.25
step
Take the Teleporter to the Frozen Throne |q 61874/3 |goto Icecrown Citadel Intro/0 59.83,21.14
|tip Walk onto the {o}teleport pad nearby{}.
step
talk Highlord Bolvar Fordragon##169076
turnin A Chilling Summons##61874 |goto Icecrown Citadel Intro/2 50.78,53.71
step
label "Skip_Shadowlands_Intro"
|next "Leveling Guides\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"
step
label "Dragonflight"
accept The Dragon Isles Await##65435
|tip You will accept this quest automatically.
step
_NOTE:_
Choose How to Level Up
|tip There are {o}two versions{} of the Leveling guides.
|tip {o}Full Zones (Story + Side Quests){} and {o}Story Only{}.
|tip The {o}Full Zone{} guides will {o}easily get you to level 70{}, with extra quests to spare.
|tip The {o}Story Only{} guides {o}may not{} get you to level 70, but then you can use the {o}full zone guides{} to do side quests to reach level 70.
|tip Click the line below to {o}choose how you want to level up{}.
Full Zone (Story + Side Quests) Guides		|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"
Story Only Guides				|confirm	|next "Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"
]])
