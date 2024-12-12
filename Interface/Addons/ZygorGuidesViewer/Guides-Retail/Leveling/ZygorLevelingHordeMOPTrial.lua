local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHMOP") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\The Jade Forest (10-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Valley of the Four Winds (15-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Krasarang Wilds (15-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Kun-Lai Summit (20-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Townlong Steppes (25-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Dread Wastes (30-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Daily")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 10")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 40")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 50")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 60")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 70")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 80")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-60)\\Peak of Serenity\\Monk Quest 90")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Loremaster\\Loremaster of Pandaria")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\MoP Remix Intro")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\The Jade Forest (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Valley of the Four Winds (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Krasarang Wilds (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Kun-Lai Summit (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Townlong Steppes (30-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Dread Wastes (35-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\MoP Remix Intro (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\The Jade Forest (10-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Valley of the Four Winds (20-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Krasarang Wilds (20-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Kun-Lai Summit (25-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Townlong Steppes (30-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Story Only\\Dread Wastes (35-70) (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Scarlet Halls (10-70)")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Scholomance (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Temple of the Jade Serpent (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Stormstout Brewery (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Shado-Pan Monastery (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Siege of Niuzao Temple (30-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Gate of the Setting Sun (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Dungeons\\Mogu'shan Palace (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Mogu'shan Vaults (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Heart of Fear (35-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Terrace of Endless Spring (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Throne of Thunder (50-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Raids\\Siege of Orgrimmar (60-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Brewing Storm (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Brewing Storm (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Greenstone Village (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Theramore's Fall (10-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dagger in the Dark (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Domination Point (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Unga Ingoo (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\A Little Patience (20-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Arena of Annihilation (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Brewmoon Festival (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (25-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Assault on Zan'vess (30-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Battle on the High Seas (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Battle on the High Seas (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Blood in the Snow (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Blood in the Snow (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (40-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Remix (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (Heroic)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Bronze Farming\\Bronze Farming Guide")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Isle of Thunder (50-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Pandaria Remix (10-70)\\Timeless Isle Dailies (45-70)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Pandaria Remix (10-70)\\Dominance Offensive")
