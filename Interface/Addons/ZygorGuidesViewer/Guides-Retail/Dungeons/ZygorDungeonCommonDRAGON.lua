local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("DungeonCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Uldaman: Legacy of Tyr",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nThe Lost Dwarves\n"..
"Bromach\nSentinel Talondras\nEmberon\nChrono-Lord Deios",
keywords={"Dragonflight","Lost","Dwarves","Bromach","Sentinel","Talondras","Emberon","Chrono-Lord","Deios"},
condition_suggested=function() return level >= 70 end,
achieveid={16278},
mapid=2071,
lfgid=2352,
patch='100002',
},[[
step
kill Olaf##184580 |goto Uldaman Legacy of Tyr/0 78.23,85.37
kill Eric "The Swift"##184582
kill Baelog##184581
_EVERYONE:_ |grouprole EVERYONE
|tip Dwarves inside "Defensive Bulwark" take 75% less damage. |grouprole EVERYONE
|tip Stay slightly spread out to minimize damage dealt by "Ricocheting Shield." |grouprole EVERYONE
|tip During Longboat Raids, avoid standing in areas of cannonfire. |grouprole EVERYONE
|tip Avoid standing in front of Baelog to minimize "Wild Cleave" damage. |grouprole EVERYONE
|tip Interrupt Olaf's "Defensive Bulwark" when possible. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid standing in front of Baelog during "Heavy Arrow" casts. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Avoid standing in front of Baelog during "Heavy Arrow" casts. |grouprole HEALER
|tip Random players will take damage throughout the fight from dagger throws. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Heavy Arrow" casts from Baelog deal heavy damage. |grouprole TANK
Click Here to Continue |confirm
step
kill Bromach##184018 |goto Uldaman Legacy of Tyr/0 59.35,63.91
'|kill Quaking Totem##186696
_EVERYONE:_ |grouprole EVERYONE
|tip Kill the "Quaking Totem" quickly before "Bloodlust" finishes casting. |grouprole EVERYONE
|tip Move out of areas targeted by "Thundering Slam." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Clean up troggs so they don't overwhelm the group. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Quaking Totems inflict damage to all players until killed. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Pick up troggs summoned by "Call of the Deep" quickly before they attack the group. |grouprole TANK
Click Here to Continue |confirm
step
kill Sentinel Talondras##184124 |goto Uldaman Legacy of Tyr/0 30.47,70.58
_EVERYONE:_ |grouprole EVERYONE
|tip "Resonanating Orbs" will stun enemies or players that they touch. |grouprole EVERYONE
|tip When affected by "Titanic Empowerment," use the orbs to stun Talondras and remove it. |grouprole EVERYONE
|tip Avoid standing in the path of "Crushing Stomp."
_DAMAGE:_ |grouprole DAMAGE
|tip Use stuns on Talondras to remove "Inexorable" and make the Dynamo vulnerable. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Crushing Stomp" will cause heavy damage to all players. |grouprole HEALER
|tip Players afflicted by "Earthen Shards" will take heavy bleed damage until it expires. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Move the boss to orbs to stun it when affected by "Titanic Empowerment." |grouprole TANK
Click Here to Continue |confirm
step
kill Emberon##184422 |goto Uldaman Legacy of Tyr/0 21.31,25.58
_EVERYONE:_ |grouprole EVERYONE
|tip At 100 energy, Emberon channels "Purging Flames" in the center of the room that inflicts severe damage. |grouprole EVERYONE
|tip Emberon becomes immune to damage until you kill the 4 vault keepers that spawn. |grouprole EVERYONE
|tip Avoid crossing the line of flames that rotates clockwise. |grouprole EVERYONE
|tip Don't stand near players affected by "Searing Embers." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill vault keepers quickly to end the phase and resume damage on Emberon. |grouprole DAMAGE
|tip Avoid standing in front of Emberon's "Searing Clap" frontal cone ability. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Avoid standing in front of Emberon's "Searing Clap" frontal cone ability. |grouprole HEALER
|tip Vault keepers constantly cast flames at the party, inflicting consistent heavy damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Help DPS vault keepers as quickly as possible to end the phase. |grouprole TANK
Click Here to Continue |confirm
step
kill Chrono-Lord Deios##184125 |goto Uldaman Legacy of Tyr/1 40.24,26.42
_EVERYONE:_ |grouprole EVERYONE
|tip "Temporal Zone" increases haste by 50%. |grouprole EVERYONE
|tip Avoid standing in "Eternity Zones." |grouprole EVERYONE
|tip Dodge "Eternity Orbs" before they reach you. |grouprole EVERYONE
|tip "Wing Buffet" deals damage and knocks everyone back. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip The party will take heavy damage during "Rewind Timeflow" at 0 energy. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Sand Breath" deals heavy damage. |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Ruby Life Pools",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nMelidrussa Chillworn\n"..
"Kokia Blazehoof\nKyrakka and Erkhart Stormvein",
keywords={"Dragonflight","Melidrussa","Chillworn","Kokia","Blazehoof","Kyrakka","Erkhart","Stormvein"},
condition_suggested=function() return level >= 70 end,
achieveid={16266},
mapid=2095,
patch='100002',
},[[
step
kill Melidrussa Chillworn##188252 |goto Ruby Life Pools/0 61.50,39.10
_EVERYONE_: |grouprole EVERYONE
|tip Avoid standing in "Chillstorm." |grouprole EVERYONE
|tip Avoid running into "Hailbombs" as they deal heavy damage. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Infused Whelps" as they spawn. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Infused Whelps inflict "Primal Chill" on players, which will cause "Frozen Solid" after 3 applications, dealing heavy damage over time. |grouprole HEALER
|tip Players hit by "Hailbombs" will require heavy healing. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Pick up "Infused Whelps" quickly to prevent them from swarming the party. |grouprole TANK
Click Here to Continue |confirm
step
kill Kokia Blazehoof##189232 |goto Ruby Life Pools/1 39.62,42.75
_EVERYONE_: |grouprole EVERYONE
|tip Interrupt "Roaring Blaze" when possible. |grouprole EVERYONE
|tip She will cast "Molten Boulders" in front of her, which will roll forward and explode dealing heavy damage and stunning whoever it hits. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Stand behind her or to the side. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Searing Blows" will inflict "Searing Wounds" which can deal heavy damage over time. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Searing Blows" deals heavy damage and leaves "Searing Wounds" which can stack. |grouprole TANK
Click Here to Continue |confirm
step
kill Kyrakka##199790
kill Erkhart Stormvein##190485 |goto Ruby Life Pools/1 20.37,18.19
_EVERYONE_: |grouprole EVERYONE
|tip "Flamespit" inflicts targeted players with "Infernocore".
|tip Watch out for "Flaming Embers" which appear on the ground after Infernocores detonate.
|tip "Winds of Change" pushes both players and Flaming Embers in the direction of the wind.
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid being in front of Kyrakka to avoid frontal aoe abilities.
_HEALER:_ |grouprole HEALER
|tip Avoid being in front of Kyrakka to avoid frontal aoe abilities.
|tip Players hit with Flamespit and Roaring Firebreath will gain stacks of "Infernocore" which deals rapid damage.
|tip "Stormslam" deals heavy damage to a player.
_TANK:_ |grouprole TANK
|tip "Stormslam" deals heavy damage.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\The Nokhud Offensive",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nGranyth\n"..
"The Raging Tempest\nTeera and Maruuk\nBalakar Khan",
keywords={"Dragonflight","Granyth","Raging","Tempest","Teera","Maruuk","Balakar","Khan"},
condition_suggested=function() return level >= 70 end,
achieveid={16275},
mapid=2093,
patch='100002',
},[[
step
kill Granyth##186616 |goto The Nokhud Offensive/0 72.02,51.18
_EVERYONE:_ |grouprole EVERYONE
|tip Interrupt "Eruption" when possible. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Move out of "Tectonic Stomp" when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Stand at least 25 yards away from Granyth if possible. |grouprole HEALER
|tip "Shards of Stone" deals unavoidable damage to the group. |grouprole HEALER
|tip The longer "Eruption" goes uninterrupted the more damage it does. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Move out of "Tectonic Stomp" when possible. |grouprole TANK
Click Here to Continue |confirm
step
kill The Raging Tempest##186615 |goto The Nokhud Offensive/0 53.13,76.83
_EVERYONE:_ |grouprole EVERYONE
|tip "Surge of Power" periodically damages players dealing moderate damage and granting 5% increased damage and healing. |grouprole EVERYONE
|tip "Lightning Strike" will deal heavy damage to players within 15 yards when cast. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip During "Energy Surge" the tank will take burst damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip During "Energy Surge", The Raging Tempest will deal burst damage for 10 seconds. |grouprole TANK
Click Here to Continue |confirm
step
kill Teera##195723
kill Maruuk##186338 |goto The Nokhud Offensive/0 32.69,69.66
_EVERYONE:_ |grouprole EVERYONE
|tip "Frightful Roar" will fear everyone within 15 yards for 5 seconds. |grouprole EVERYONE
|tip Avoid "Gale Arrows" as they move across the arena. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip "Earthsplitter" deals heavy damage when Maruuk reaches 100 energy to players within 4 yards of impact. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Brutalize" will deal heavy damage to Maruuk's current target. |grouprole HEALER
|tip Teera will hit random players with "Quickshot" dealing moderate damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Keep an eye out for "Brutalize" as it will deal heavy damage to you. |grouprole TANK
Click Here to Continue |confirm
step
kill Balakar Khan##186151 |goto The Nokhud Offensive/0 34.84,38.81
_EVERYONE:_ |grouprole EVERYONE
|tip "Iron Spear" will be targeted at a random player, dealing heavy damage to anyone within 6 yards of impact.
|tip "Iron Stampede" will have Balakar Khan charging towards his spear regardless of position, inflicting heavy damage to anyone caught in the path.
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Nokhud Stormcasters" as they appear.
_HEALER:_ |grouprole HEALER
|tip During "Stormwinds", players will take consistant damage every half second until Nokhud Stormcasters are dealt with.
|tip "Conductive Strike" will cause heavy damage to his current target and cause Thunder Strike to deal 500% more damage to that target.
_TANK:_ |grouprole TANK
|tip Keep an eye out for "Rending Strike" as it deals massive damage.
|tip You will be left with a debuff causing "Savage Strike" to deal 500% more damage.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Brackenhide Hollow",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nHackclaw's War-Band\n"..
"Treemouth\nGutshot\nDecatriarch Wratheye",
keywords={"Dragonflight","Hackclaw's","War-Band","Treemouth","Gutshot","Decatriarch","Wratheye"},
condition_suggested=function() return level >= 70 end,
achieveid={16255},
mapid=2096,
patch='100002',
},[[
step
kill Hackclaw's War-Band##186122 |goto Brackenhide Hollow/0 35.92,40.45
_EVERYONE:_ |grouprole EVERYONE
|tip Kill "Hextrick Totems" as they appear. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Interrupt "Greater Healing Rapids" when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Players will get "Marked for Butchery" and take massive damage. |grouprole HEALER
|tip Players with with "Gash Frenzy" will need to be healed above 90% health to remove the bleed. |grouprole HEALER
|tip Players afflicted with "Decayed Senses" will take 150% more physical damage. |grouprole HEALER
|tip When anyone in the War-Band drops to 15% health, Tricktotems will use "Bloodfrenzy", causign all gnolls to deal 30% more damage and hit 30% faster. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Savage Charge" will target a random player. |grouprole TANK
|tip It will deal massive damage, but it hits only the first person to come into contact with it. |grouprole TANK
|tip Move in front of the path to ensure that you are hit instead of the player. |grouprole TANK
|tip When anyone in the War-Band drops to 15% health, Tricktotems will use "Bloodfrenzy", causign all gnolls to deal 30% more damage and hit 30% faster. |grouprole TANK
Click Here to Continue |confirm
step
kill Treemouth##186120 |goto Brackenhide Hollow/0 58.65,81.68
_EVERYONE:_ |grouprole EVERYONE
|tip At 100 energy, Treemouth uses "Grasping Vines" pulling all players to it and then uses "Consume". |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Use burst damage when possible to break "Consume". |grouprole DAMAGE
|tip When killing Decaying Slimes, they will blight the ground where they die. |grouprole DAMAGE
|tip Avoid standing in front of Treemouth when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip When a player is afflicted by "Consume" they will take moderate damage over time for 10 seconds. |grouprole HEALER
Click Here to Continue |confirm
step
kill Gutshot##186116 |goto Brackenhide Hollow/0 58.86,29.92
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid activating "Ensaring Trap" when possible, as it will entangle all Hyenas and Players near it. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Deal with Rotfang Hyenas as they appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Meat Toss" will cause all Hyenas to fixate on the target. |grouprole HEALER
|tip "Feeding Frenzy" will cause all Rotfang Hyenas to deal 100% more damage for 10 seconds. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Gut Shot" will deal moderate damage and knock the target back. |grouprole TANK
Click Here to Continue |confirm
step
kill Decatriarch Wratheye##186121 |goto Brackenhide Hollow/1 58.89,49.93
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Rotburst Totems" as they appear.  |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Withering Rot" will cause Wratheye to deal 5% more damage per stack. |grouprole HEALER
|tip "Decaystrike" will deal massive damage and absorb around 40,000 healing taken. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Decaystrike" will deal massive damage and absorb around 40,000 healing taken. |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Halls of Infusion",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nWatcher Irideus\n"..
"Gulping Goliath\nKhajin the Unyielding\nPrimal Tsunami",
keywords={"Dragonflight","Watcher","Irideus","Gulping","Goliath","Khajin","Unyielding","Primal","Tsunami"},
condition_suggested=function() return level >= 70 end,
achieveid={16260},
mapid=2082,
patch='100002',
},[[
step
kill Watcher Irideus##189719 |goto Halls of Infusion/0 61.58,35.28
|tip Avoid standing in "Power Fields" left behind by "Power Overload" |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Nullification Devices" near Irideus to remove 1 application of "Ablative Shield". |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip The longer Ablative Shields are up the more damage Irideus will do. |grouprole HEALER
|tip "Purifying Blast" from Nullification Devices can deal significant damage if the affect stacks. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Kill "Nullification Devices" near Irideus to remove 1 application of "Ablative Shield". |grouprole TANK
Click Here to Continue |confirm
step
kill Gulping Goliath##189722 |goto Halls of Infusion/1 53.96,85.92
_EVERYONE:_ |grouprole EVERYONE
|tip "Gulp" will gulp down players within 10 yards for 2 seconds, dealing heavy damage. |grouprole EVERYONE
|tip If no one is hit with Gulp, he will gain the "Hangry" buff causing him to deal 50% increased damage for 1 minute and stacks. |grouprole EVERYONE
|tip Players hit by Gulp will gain 3 stacks of "Gulp Swog Toxin" which will kill you if you get 20 stacks of it. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Khajin the Unyielding##189727 |goto Halls of Infusion/1 31.14,81.93
_EVERYONE:_ |grouprole EVERYONE
|tip She will cast "Glacial Surge" which causes a ring to surge from her, dealing heavy damage to players hit by it. |grouprole EVERYONE
|tip Each Glacial Surge will spawn "Ice Boulders" which can can block damage from Hailstorm. |grouprole EVERYONE
|tip Ice Boulders can only be used as cover twice. |grouprole EVERYONE
|tip The second time they are hit, they will explode causing an "Avalanche", dealing heavy damage to anyone within 12 yards. |grouprole EVERYONE
|tip Khajin will use "Hailstorm", dealing heavy damage if you don't use the Ice Boulders as cover. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip Remove "Frost Shock" From allies when possible. |grouprole HEALER
Click Here to Continue |confirm
step
kill Primal Tsunami##189729 |goto Halls of Infusion/1 42.76,47.50
_EVERYONE:_ |grouprole EVERYONE
|tip When it reaches 100 energy, it uses "Cast Away" the party will be trapped in a bubble. |grouprole EVERYONE
|tip "Crashing Tsunami" follows up, knocking back and slowing players after. |grouprole EVERYONE
|tip Avoid "Infused Globules" as they deal heavy damage. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Primalist Infusers" as they appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Players hit with "Focused Deluge" will take moderate damage over 5 seconds. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Stay within melee range when possible to avoid moderate group damage from "Undertow". |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Algeth'ar Academy",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nVexamus\n"..
"Overgrown Ancient\nCrawth\nEcho of Doragosa",
keywords={"Dragonflight","Vexamus","Overgrown","Ancient","Crawth","Echo","Doragosa"},
condition_suggested=function() return level >= 70 end,
achieveid={16269},
mapid=2097,
patch='100002',
},[[
step
kill Vexamus##194181 |goto Algeth'ar Academy/1 30.42,35.51
_EVERYONE:_ |grouprole EVERYONE
|tip Vexamus casts "Mana Bombs" at up to 3 random players, exploding after 2.5 seconds, dealing moderate damage. |grouprole EVERYONE
|tip "Corrupted Mana" is left behind at the detonation site, dealing modertate damage and slowing players caught in it. |grouprole EVERYONE
|tip "Arcane Orbs" gravitate towards Vexamus, granting 20 energy if they reach him as well as dealing moderate damage to the group. |grouprole EVERYONE
|tip  It deals slightly less damage to a single player if intercepted. |grouprole EVERYONE
|tip At 100 energy, Vexamus will use "Arcane Fissure", dealing moderate damage and knocking players back. |grouprole EVERYONE
|tip Immidiately after, "Arcane Fissures" will appear at each players feet, dealing heavy damage to those within 4 yards of it. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Intercept "Arcane Orbs" when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Arcane Explosion" will deal heavy damage to the entire group. |grouprole HEALER
Click Here to Continue |confirm
step
kill Overgrown Ancient##196482 |goto Algeth'ar Academy/1 56.00,41.25
_EVERYONE:_ |grouprole EVERYONE
|tip "Germinate" places dormant lasher seeds beneath players feet the sprout every second for 4 seconds. |grouprole EVERYONE
|tip Each seed will do moderate damage to players within 4 yards, so move away as soon as possible. |grouprole EVERYONE
|tip After, it will leave behind dormant "Hungry Lashers" which can be killed in their current state. |grouprole EVERYONE
|tip At 100 energy, the ancient will use "Burst Forth", dealing moderate damage to the group and activating Dormant Hungry Lashers that weren't killed. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Interrupt "Healing Touch" when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Barkbreaker" deals heavy damage to its target as well as increases physical damage they take by 100% for 9 seconds. |grouprole HEALER
|tip "Burst Forth" deals moderate damage to the group. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Interrupt "Healing Touch" when possible. |grouprole TANK
Click Here to Continue |confirm
step
kill Crawth##191736 |goto Algeth'ar Academy/2 46.92,36.66
_EVERYONE:_ |grouprole EVERYONE
|tip During "Play Ball!" the group will be able to score goals. |grouprole EVERYONE
|tip Scoring 3 points in the Goal of the Searing Blaze will activate "Firestorm", causing the goal to erupt in flames. |grouprole EVERYONE
|tip Motes of fire will spread across the arena, dealing heavy damage to those within 6 yards of them and stunning players. |grouprole EVERYONE
|tip The Firestorm also stuns Crawth, causing her to take 75% extra damage for 12 seconds. |grouprole EVERYONE
|tip Scoring 3 points in the Goal of the Rushing Winds will activate "Gale Force", causing fierce winds to rush from the goal. |grouprole EVERYONE
|tip Roving Cyclones will be active for nearly 15 seconds, pushing players back. |grouprole EVERYONE
|tip Additionally, motes will appear that can be picked up to grant 45% Haste and 50% movement speed for 20 seconds, as well as immunity to being pushed back by Gale Force. |grouprole EVERYONE
|tip She will target a random player with "Overpowering Gust", dealing heavy damage and knocking players back who are in front of her. |grouprole EVERYONE
|tip "Deafening Screech" will interrupt spells being cast and silence the interrupted target for 6 seconds. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip "Savage Peck" deals high damage over time. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Savage Peck" deals high damage over time. |grouprole TANK
Click Here to Continue |confirm
step
kill Echo of Doragosa##190609 |goto Algeth'ar Academy/0 61.38,60.62
_EVERYONE:_ |grouprole EVERYONE
|tip "Overwhelming Powre" will grant players afflicted by it to deal 5% extra damage per stack. |grouprole EVERYONE
|tip At 4 stacks, "Arcane Rifts" will erupt into existence. |grouprole EVERYONE
|tip Players caught in the rift will take moderate damage every second while occasionally releasing Uncontrolled Energy. |grouprole EVERYONE
|tip "Uncontrolled Energy" deals moderate damage to those who come into contact with it, as well as apply stacks of Overwhelming Power.  |grouprole EVERYONE
|tip "Power Vacuum" draws in all players, dealing heavy damage knocking them back if within 20 yards of the following explosion. |grouprole EVERYONE
|tip Spread out when possible. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid standing in front of Echo of Doragosa to avoid being hit by "Astral Breath." |grouprole DAMAGE
|tip Move away from other players if you're afflicted with "Energy Bomb" |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Avoid standing in front of Echo of Doragosa to avoid being hit by "Astral Breath." |grouprole HEALER
|tip Players afflicted with "Energy Bomb" will take extra damage. |grouprole HEALER
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Neltharus",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nChargath, Bane of Scales\n"..
"Forgemaster Gorek\nMagmatusk\nWarlord Sargha",
keywords={"Dragonflight","Chargath","Bane","Scales","Forgemaster","Gorek","Magmatusk","Warlord","Sargha"},
condition_suggested=function() return level >= 70 end,
achieveid={16269},
mapid=2080,
patch='100002',
},[[
step
kill Chargath, Bane of Scales##189340 |goto Neltharus/0 43.17,66.70
_DAMAGE:_ |grouprole DAMAGE
|tip Melee should move away from Chargath during "Fiery Focus". |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Players hit by "Dragon Strike" moderate damage followed by a DoT debuff for 14 seconds. |grouprole HEALER
|tip When "Grounding Chains" are tripped, it will cause the player who did it to take moderate damage from "Slag Eruption." |grouprole HEALER
_TANK:_ |grouprole TANK
|tip At 100 energy, "Fiery Focus" causes moderate damage every second until tripped with Ground Chains. |grouprole TANK
Click Here to Continue |confirm
step
kill Forgemaster Gorek##189478 |goto Neltharus/1 33.73,65.69
_EVERYONE:_ |grouprole EVERYONE
|tip "Blazing Aegis" triggers a 4-way eruption on a target's location that deals moderate damage and leaves a DoT if hit by it. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Watch out for "Forgestorm" as it launches a barrage of embers across the room, dealing heavy damage to those within 3 yards of the impact. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip During "Might of the Forge" the group will take moderate AoE damage. |grouprole HEALER
|tip With each strike of "Blazing Hammer" after, the group will take additional moderate damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip During "Heated Swings" Gorek will deal heavy damage, first knocking you back for moderate damage, followed up by a leap that deals heavy damage to anyone within 8 yards of the impact. |grouprole TANK
Click Here to Continue |confirm
step
kill Magmatusk##181861 |goto Neltharus/0 66.89,63.41
_EVERYONE:_ |grouprole EVERYONE
|tip During the encounter Magmatusk will gain "Magma" over time. |grouprole EVERYONE
|tip When reaching 100, Magmatusk will gain a "Magma Tentacle" which increases his damage output overall. |grouprole EVERYONE
|tip "Lava Spray" Locks on to a player and tracks them, so avoid hitting your team if you're targeted. |grouprole EVERYONE
|tip Avoid standing in front of "Blazing Charge". |grouprole EVERYONE
|tip "Lava Waves" will spawn at the end of each Blazing Charge. |grouprole EVERYONE
|tip The number of waves depends on how many Magma Tentacles are present. |grouprole EVERYONE
|tip Avoid the Magma Tentacles "Magma Lob" as it deals moderate damage to those 4 yards around the impact. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip During "Magma Eruption", the group will take moderate to heavy AoE damage depending on how many Magma Tentacles on Magmatusk. |grouprole HEALER
Click Here to Continue |confirm
step
kill Warlord Sargha##189901 |goto Neltharus/0 52.09,86.95
_EVERYONE:_ |grouprole EVERYONE
|tip During "Magma Shield", use the piles of treasure to obtain magic items that will remove it eventually. |grouprole EVERYONE
|tip "Wand of Negation" will deal 27k Arcane damage to absorb shields. |grouprole EVERYONE
|tip "Anti-Magic Bomb" will deal 27k shield damage to those within 8 yards of impact. |grouprole EVERYONE
|tip "Azure Stone of Might" causes the caster to launch themselves at the enemy dealing 27k shield damage. |grouprole EVERYONE
|tip "Rose of the Vale" causes 27k damage to shields to enemies within 12 yards. |grouprole EVERYONE
|tip "Seismic Boots" causes you to stomp the ground releasing a wave for 27k shield damage. |grouprole EVERYONE
|tip After the Magma Shield is broken, Warlord Sargha will cast "Flame Eruption" applying Flame Vulnerability to the group. |grouprole EVERYONE
|tip "Flame Eruption" stacks and causes 50% more damage from subsequent Flame Eruptions. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid standing in front of her to avoid "The Dragon's Kiln" which deals moderate damage. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip During "Magma Shield" the group will take heavy fire damage every 3 seconds for 45 seconds. |grouprole HEALER
|tip Avoid standing in front of her to avoid "The Dragon's Kiln" which deals moderate damage. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Try to face her away from the group when possible. |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\The Azure Vault",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nLeymor\n"..
"Azureblade\nTelash Greywing\nUmbrelskul",
keywords={"Dragonflight","Leymor","Azureblade","Telash","Greywing","Umbrelskul"},
condition_suggested=function() return level >= 70 end,
achieveid={16272},
mapid=2073,
patch='100002',
},[[
step
kill Leymor##186644 |goto The Azure Vault/4 37.11,54.16
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Ley-Line Sprouts" as they appear. |grouprole DAMAGE
|tip Avoid being in front of Leymor when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Consuming Stomp" will deal increased damage for each Ley-Line Sprout active. |grouprole HEALER
|tip "Infused Strike" will deal heavy damage to the current target. |grouprole HEALER
|tip Avoid being in front of Leymor when possible. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Face Leymor away from the group when possible. |grouprole TANK
|tip Be on the look out for "Infused Strike" as it deals heavy damage. |grouprole TANK
Click Here to Continue |confirm
step
kill Azureblade##186739 |goto The Azure Vault/2 76.09,55.67
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Draconic Illusions" as they appear. |grouprole DAMAGE
|tip Avoid being in front of her when possible. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip During "Overwhelming Energy", Azureblade will deal moderate AoE damage every 2 seconds until Draconic Illusions are dealt with. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Face her away fromt he group when possible. |grouprole TANK
Click Here to Continue |confirm
step
kill Telash Greywing##199614 |goto The Azure Vault/1 35.56,52.73
_EVERYONE:_ |grouprole EVERYONE
|tip "Absolute Zero" deals heavy damage to the entire group when used. |grouprole EVERYONE
|tip Sindragosa will place a "Vault Rune" on the ground during Absolute Zero. |grouprole EVERYONE
|tip When possible you should try to move into it. |grouprole EVERYONE
|tip Move out of "Frost Bomb" once it is cast as it will deal heavy damage to those within 5 yards of it. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip "Icy Devastation" deals moderate damage to random players in the group. |grouprole HEALER
Click Here to Continue |confirm
step
kill Umbrelskul##186738 |goto The Azure Vault/0 52.18,52.62
_EVERYONE:_ |grouprole EVERYONE
|tip At 75%, 50% and 25% health, Umbrelskul shatters causing Detonating Crystals to fall from his body. |grouprole EVERYONE
|tip "Detonating Crystals" deal moderate damage each second to the group each second for 15 seconds. |grouprole EVERYONE
|tip Avoid standing in "Arcane Eruptions" as they deal heavy damage and knock players back as well as leaves behind a Crackling Vortex that deals damage over time. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip "Unleashed Destruction" will push players away from him. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Dragon Strike" will deal heavy damage to the target player. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Dragon Strike" deals heavy damage so mitigation skills may be required. |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Raids\\Vault of the Incarnates",{
author="support@zygorguides.com",
description="To complete this raid, you will need to kill the following bosses:\n\nEranog\n"..
"Terros\nKadros Icewrath\nSennarth, the Cold Breath\nDathea, Ascended\nKurog Grimtotem\n"..
"Broodkeeper Diurna\nRaszageth the Storm-Eater",
keywords={"Dragonflight","Eranog","Terros","Kadros","Icewrath","Sennarth","Dathea","Ascended","Kurog","Grimtotem","Raszageth"},
condition_suggested=function() return level >= 70 end,
achieveid={16343},
mapid=2119,
lfgid=2388,
patch='100002',
},[[
step
kill Eranog##184972 |goto Vault of the Incarnates/3 56.96,20.69
_EVERYONE:_ |grouprole EVERYONE
|tip At 100 energy, he will cast "Army of Flame" which summons a Primal Flame. |grouprole EVERYONE
|tip The Primal Flame will inflict massive damage to anyone caught in its path and stun them for 3 seconds after. |grouprole EVERYONE
|tip He will mark several players locations with "Flamerift" to which you should move out of or take moderate damage. |grouprole EVERYONE
|tip "Flamescale Taraseks" spawn from each flame rift and should be dealt with quickly. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid standing in front of him. |grouprole DAMAGE
|tip Kill "Flamescale Taraseks" as they appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip With each "Incinerating Roar" he will deal more damage as well as deal heavy damage, leaving behind a moderate damaged dot for 28 seconds. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip He will inflict "Burning Wound" which deals moderate damage every 2 seconds for 14 seconds and stacks. |grouprole TANK
Click Here to Continue |confirm
step
kill Terros##190496 |goto Vault of the Incarnates/2 21.62,75.78
_EVERYONE:_ |grouprole EVERYONE
|tip "Rock Blast" deals deadly damage that is split between players within the impact. |grouprole EVERYONE
|tip After each Rock Blast, "Awakened Earth" will appear under several players dealing moderate damage to anyone caught within 2 yards as well as knocking them back. |grouprole EVERYONE
|tip When Awakened Earth are killed, it'll cause a "Seismic Assult" which deals moderate damage to the group as well as leaving a DoT for 12 seconds after. |grouprole EVERYONE
|tip At 100 Energy, Terros will use "Resonating Annihilation", dealing massive damage in a frontal cone. |grouprole EVERYONE
|tip After, "Resonant Aftermath" and "Fractured Rubble" will fall from the ceiling which should be avoided. |grouprole EVERYONE
|tip "Shattering Impact" will deal massive damage to players within 12 yards of the impact as well as cause Fractured Rubble. |grouprole EVERYONE
|tip "Concussive Slam" will deal massive damage in a line to players caught in it, increasing damage taken by 30% for 45 seconds. |grouprole EVERYONE
|tip It will also destroy Awakened Earth. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill "Awakened Earth" as they appear. |grouprole DAMAGE
_TANK:_ |grouprole TANK
|tip Tanks should always be within melee range of Terros. |grouprole TANK
Click Here to Continue |confirm
step
kill Kadros Icewrath##187771 |goto Vault of the Incarnates/5 43.38,70.24
_EVERYONE:_ |grouprole EVERYONE
|tip Spread out when possible. |grouprole EVERYONE
_KADROS_
|tip At 100 Energy, Kadros will channel "Primal Blizzard", leaving a debuff that can stack up to 10 times and dealing heavy damage. |grouprole EVERYONE
|tip Touching "Scorched Ground" will remove applications of Primal Blizzard. |grouprole EVERYONE
|tip Upon reaching 10 stacks of Primal Blizzard, targets will be afflicted with "Frost Tomb" which deals heavy damage until freed. |grouprole EVERYONE
_EMBAR_
|tip Embar will target two players with "Meteor Axe" dealing heavy damage that will be split between targets within 10 yards of the target. |grouprole EVERYONE
|tip Upon impact, it will leave "Scorched Ground", used to remove applications of Primal Blizzard. |grouprole EVERYONE
|tip At 100 energy, "Slashing Blaze" will deal massive damage to targets in front of Embar. |grouprole EVERYONE
_OPALFANG_
|tip "Earthen Pillar" will appear beneath several players, inflicting heavy damage and knocking anyone within 6 yards of impact back. |grouprole EVERYONE
|tip Earthen Pillars can be destroyed with Meteor Axe. |grouprole EVERYONE
|tip Opalfang will occasionally "Crush" targets, dealing massive damage and increase physical damage taken to the target by 100%. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Sennarth##187967 |goto Vault of the Incarnates/0 52.77,52.55
_EVERYONE:_ |grouprole EVERYONE
|tip Each "Breath of Ice" will creates patches of Icy Ground.
|tip You will take moderate damage every second while standing on "Icy Ground."
|tip "Enveloping Webs" targets several players dealing moderate damage, cause the Sticky Webbing debuff.
|tip "Sticky Webbing" will prevent sliding from Icy Ground or being pushed and pulled, but applies a debuff that stacks 10 times.
|tip At 10 stacks, the target will be "Wrapped in Webs", reducing movement speed by 75%.
|tip The debuff can be caused by "Caustic Eruption", caused by killing Caustic Spiderlings.
|tip "Frostbreath Arachnid" spawn and deal heavy damage to anyone in front of them.
|tip Spread out when possible. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Do not stand in front of enemies when possible.
_TANK:_ |grouprole TANK
|tip "Web Blasts" increases the damage taken from subsequent hits.
|tip Face "Frostbreath Arachnids" away from raid members when possible.
Click Here to Continue |confirm
step
kill Dathea, Ascended##189813 |goto Vault of the Incarnates/6 55.93,51.33
_EVERYONE:_ |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Spread out when possible.
|tip "Raging Bursts" inflict moderate damage to targets within 6 yards, creating a Raging Tempest at their location.
|tip "Raging Tempest" will deal heavy damage to players that touch them, sending them into the air.
|tip "Crosswinds" will cause Raging Tempests to relocate.
|tip "Conductive Mark" is applied to a player, inflicting moderate damage, leaving a dot, increases damage taken by 10% for 5 seconds and the affect stacks.
|tip The player who is marked should stay away from anyone else or duplicate the effect and refresh the initial effect.
|tip "Cyclone" will draw players towards her, dealing moderate damage over time.
_TANK:_ |grouprole TANK
|tip "Zephyr Slam" deals massive damage and knocks you back.
|tip Each impact will increase the damage from the knockbacks by 55%.
|tip When knocked back, she will cast "Aeriel Buffet" at targets not within range.
|tip "Coalescing Storm" will summon Volatile Infusers that need to be picked up.
Click Here to Continue |confirm
step
kill Kurog Grimtotem##184986 |goto Vault of the Incarnates/1 51.32,50.83
_EVERYONE:_ |grouprole EVERYONE
|tip Each Altar has a "Dominance" aura that moderately damages the raid group every 4 seconds and because 10% stronger with each cast.
|tip Swap altars when the damage becomes unmanageable.
_ALTAR OF FLAME_
|tip "Magma Burst" deals heavy damage to random players.
|tip It leaves behind pools that cause "Searing Carnage", marking players for 5 seconds.
|tip Each second, a new pool appears adn after 2 seconds for each, they explode dealing massive damage to those 5 yards near.
_ALTAR OF FROST_
|tip "Biting Chill" deals damage every second for 10 seconds.
|tip "Absolute Zero" does deadly damage that splits evenly between players 8 yards of impact.
_ALTAR OF STORM_
|tip "Shocking Burst" targets random players that deals heavy damage to others within 12 yards after 5 seconds.
|tip "Thunder Strike" needs to hit players or it will deal massive raid wide damage.
_ALTAR OF EARTH_
|tip "Erupting Bedrock" is a line attack that deals massive damage.
|tip "Seismic Rupture" knocks back and does massive damage 10 yards of impact.
_DAMAGE:_ |grouprole DAMAGE
|tip Avoid being in front of Kurog. |grouprole DAMAGE
|tip Kill "Earth Breakers" as they appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Earth Breakers will cause "Skeletal Fractures" which causes 6% physical damage taken and stacks. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Face him away from the raid. |grouprole TANK
|tip "Sundering Strike" deals massive frontal cone damage, knocks them back then deals a dot that lasts 35 seconds and stacks.
|tip "Elemental Surge" dealing moderate damage every 0.5 seconds when not be an altar. |grouprole TANK
Click Here For Part 2 |confirm
step
kill Kurog Grimtotem##184986 |goto Vault of the Incarnates/1 51.32,50.83
_EVERYONE:_ |grouprole EVERYONE
|tip The 4 elementals all have an aura that deals damage that stacks every second, respect to their element. |grouprole EVERYONE
_BLAZE FIEND_
|tip "Magma Flow" falls from the elemental when it is hit. |grouprole EVERYONE
|tip "Magma Pools" left behind deal heavy damage every second when standing in it. |grouprole EVERYONE
_FROZEN DESTROYER_
|tip "Frost Blinds" will deal heavy damage initially, followed by moderate damage every 2 seconds for 20 after, reducing movement by 10% per stack. |grouprole EVERYONE
|tip Move within 10 yards for "Freezing Tempest" to reduce the heavy damage over time to moderate. |grouprole EVERYONE
_TECTONIC CRUSHER_
|tip "Breaking Gravel" causes it to deal 3% stacking damage against the same target. |grouprole EVERYONE
|tip The affect will fall off when hitting a new target. |grouprole EVERYONE
|tip "Ground Shatter" infuses several players for 5 seconds dealing heavy damage to anyone within 10 yards of those players. |grouprole EVERYONE
|tip "Violent Upheaval" causes rocks to erupt from nearby locations, dealing massive damage to anyone near them. |grouprole EVERYONE
_THUNDERING PRESENCE_
|tip "Storm Break" causes it to appear behind random players, using Lethal Current. |grouprole EVERYONE
|tip "Lethal Current" deals moderate damage to anyone within 8 yards of the target every second for 6 seconds. |grouprole EVERYONE
_PRIMAL END_
|tip When the elementals are dealt with, he will gain all the previous powers at once. |grouprole EVERYONE
|tip Additionally, he will gain "Elemental Surge" dealing moderate damage every 0.5 seconds. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Broodkeeper Diurna##190245 |goto Vault of the Incarnates/4 50.97,52.01
_EVERYONE:_ |grouprole EVERYONE
|tip "Greatstaff of the Broodkeeper" deals moderate damage to players within 50 yards every 1.5 seconds for 12. |grouprole EVERYONE
|tip Additionally, she will gain "Greatstaff's Wrath", increasing her damage by 10%. |grouprole EVERYONE
|tip Players can use "Focus Greatstaff" while near it, consuming an application of Greatstaff's Wrath. |grouprole EVERYONE
|tip This will also cause a beam to follow the player, inflicting heavy damage to players within 3 yards. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Use Greatstaff's Wrath to destroyed "Rapid Incubation" eggs.|grouprole DAMAGE
|tip Kill Primalist Reinforcements as they appear.|grouprole DAMAGE
|tip Interrupt "Primalist Mages" when possible.|grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Icy Shroud" reduces movement speed by 30% and causes 37,625 healing to be absorbed. |grouprole HEALER
|tip "Frozne Shroud" is a magic affect that immobilizes targets and causes 47,031 healing ot be absorbed. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Mortal Stoneclaws" deals high damage and reduces healing recieved. |grouprole TANK
|tip "Broodkeeper's Fury" increases the duration of reduced healing recieved. |grouprole TANK
|tip Pick up "Primalist Reinforcements" quickly to prevent them from healing, increasing damage done and reducing damage taking from Broodkeeper's Bond. |grouprole TANK
Click Here to Continue |confirm
step
kill Raszageth the Storm-Eater##199031 |goto Vault of the Incarnates/7 55.65,60.85
_EVERYONE:_ |grouprole EVERYONE
|tip Players marked with "Static Charge" should move as far away from the raid as possible, reducing the heavy raid damage it does when it expires.
|tip The "Static Field" left behind does damage every second, reduces movement by 50% and reduces forced movement effects to those standing in it.
|tip She uses "Hurricane Wing" at 100 energy, dealing heavy raid damage, knocking players back and leaving a dot for 2 seconds.
|tip When the Vault of the Incarnates reaches 50% and 0% she will use Lightning Devastation.
|tip "Lightning Devastation" deals massive damage instantly and additional moderate damage every 2 seconds to thos in the impact area.
|tip She will also be protected by "Ruinous Shoroud", damaging the Vault 1% every 1.5 seconds.
_DAMAGE:_ |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Electric Scales" dishes out moderate raid wide damage, as well as random "Electric Lash"
_TANK:_ |grouprole TANK
|tip "Electrified Jaws" deals massive damage and increases physical damage taken by 150% for 35 seconds.
|tip Face her away from the raid when possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Raids\\Aberrus, The Shadowed Crucible",{
mapid=2166,
achieveid={18160},
patch='90200',
condition_suggested=function() return level >= 70 end,
keywords={"Shadowlands"},
author="support@zygorguides.com",
},[[
step
kill Kazzara, the Hellforged##201261 |goto Aberrus, the Shadowed Crucible/0 51.20,72.11
_EVERYONE:_ |grouprole EVERYONE
|tip At 100 energy, she will use "Hellbeam". |grouprole EVERYONE
|tip Avoid its path when being cast and avoid pools of Revenant's Blood that appear. |grouprole EVERYONE
|tip At 70% 50% and 30%, the raid will be hit with a permanent DoT that deals heavy shadowflame damage, increasing in damage at each %. |grouprole EVERYONE
|tip Avoid puddles of "Hellsteel Fragment" and "Revenant's Blood" that appear during these phases. |grouprole EVERYONE
|tip If marked with "Dread Rift", move away from other players. |grouprole EVERYONE
|tip It may be beneficial to coordinate a spot for those marked so the raid knows where to go for Rays of Anguish. |grouprole EVERYONE
|tip "Wings of Extinction" knocks back players and deals moderate shadow damage. |grouprole EVERYONE
_DAMAGE:_
|tip Players targeted by "Rays of Anguish" should use Dread Rift puddles to remove it.  |grouprole DAMAGE
_TANK:_
|tip Tank swap after "Terror Claw" applications. |grouprole TANK
|tip Face Kazzara away from the raid and where she stands. |grouprole TANK
Click Here to continue |confirm
step
kill The Amalgamation Chamber |goto Aberrus, the Shadowed Crucible/1 44.33,63.44
|tip There will be two sides during the fight:
_Krozgoth Side_
_EVERYONE:_ |grouprole EVERYONE
|tip If marked by "Umbral Detonation", move to the side/back of the room and avoid being within 8 yards of others. |grouprole EVERYONE
|tip Each detonation will leave behind "Lingering Umbra." |grouprole EVERYONE
|tip Ranged should stack in one spot for "Coalescing Void" then spread out quickly via Blink or Warlock Gate. |grouprole EVERYONE
|tip Watch for stray "Swirling Flame" from the opposite side. |grouprole EVERYONE
|tip Try to reduce Krozgoth's health pool to 50% at the same time as Moltannia's. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip It's recommended that ranged DPS start here. |grouprole DAMAGE
|tip
_Moltannia Side_
_EVERYONE:_ |grouprole EVERYONE
|tip Players targeted by "Swirling Flame" should aim it at a safe side of the arena when possible. |grouprole EVERYONE
|tip Soak up the "Molten Eruption" as it reduces the HP of the opposite side while active. |grouprole EVERYONE
|tip Stack for "Fiery Meteor" or have a player with immunities absorb it. |grouprole EVERYONE
|tip Try to reduce Moltannia's health pool to 50% at the same time as Krozgoth's. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip It's recommended that melee DPS start here. |grouprole DAMAGE
_Molgoth_
_EVERYONE:_ |grouprole EVERYONE
|tip Everyone must absorb the "Convergent Eruption" circles that appear while avoiding "Orbs" that spawn after. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Melee need to absorb "Gloom Conflagration" if no immune players are available. |grouprole DAMAGE
|tip Ranged uses the same Coalescing Void strategy as previously stated. |grouprole DAMAGE
|tip Players targeted by "Blistering Twilight" should move away from the raid to safe spots. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Ranged uses the same Coalescing Void strategy as previously stated. |grouprole HEALER
|tip Players targeted by "Blistering Twilight" should move away from the raid to safe spots. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Face the boss away from the raid at all times to avoid damage from "Shadowflame Burst". |grouprole TANK
Click Here to continue |confirm
step
kill Assault of the Zaqali |goto Aberrus, the Shadowed Crucible/2 42.25,35.51
_Boss Group_
_EVERYONE:_ |grouprole EVERYONE
|tip Rocks will appear nearby that need to be tossed off the ledge indicated by yellow arrows. |grouprole EVERYONE
|tip Try to throw rocks at different arrows to avoid additional adds. |grouprole EVERYONE
|tip At 100 energy, the boss will jump to the opposite platform. |grouprole EVERYONE
_Add Group_
_EVERYONE:_ |grouprole EVERYONE
|tip DPS Priority:Breaking Magma Mystic Shield, Obsidian Guard, Flamebound Huntsman, the boss then tap wallclimbers as they appear. |grouprole EVERYONE
|tip When the boss jumps to this platform, avoid the area of impact. |grouprole EVERYONE
|tip Tanks should grab adds as soon as possible save for Wallclimbers. |grouprole EVERYONE
|tip Ranged avoid standing near the edge of the platform to avoid more adds. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Interrupt "Lava Bolt" casts when possible. |grouprole DAMAGE
_Phase 2_
_EVERYONE:_ |grouprole EVERYONE
|tip At 15% the boss moves to the center of the room. |grouprole EVERYONE
|tip "Flame Cudgel" deals damage towards a tank, dealing frontal damage and produces whirls that must be avoided. |grouprole EVERYONE
|tip "Catastrophic Slam" targets the door spawning a circle that the raid must soak to reduce the damage taken. |grouprole EVERYONE
|tip This will cause you to take more damage each soak. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Bring all adds to the boss and AoE them down. |grouprole TANK
|tip Tank the boss facing away fromt he raid at all times. |grouprole TANK
Click Here to continue |confirm
step
kill Rashok##201320 |goto Aberrus, the Shadowed Crucible/0 67.24,22.06
_EVERYONE:_ |grouprole EVERYONE
|tip Players targeted by "Searing Slam" should move away from the raid to a corner, placing them clockwise while avoiding lava pools. |grouprole EVERYONE
|tip Players targeted by "Shadowlava Blast" should aim it towards a wall. |grouprole EVERYONE
|tip Everyone should soak "Charged Smash" when possible. |grouprole EVERYONE
|tip "Doom Flame" circles should also be soaked. |grouprole EVERYONE
|tip At 100 Energy, bring the boss to the center of the room. |grouprole EVERYONE
|tip During "Siphon Energy (Conduit)", group up and avoid Shadow Lines while dodging the boss damage until his energy reaches zero. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Keep the boss and "Living Lava" in line of sight to watch moving puddles. |grouprole TANK
Click Here to continue |confirm
step
kill Zskarn##202637 |goto Aberrus, the Shadowed Crucible/0 50.86,24.57
_EVERYONE:_ |grouprole EVERYONE
|tip Once traps active, move clockwise, keeping the boss close to active traps. |grouprole EVERYONE
|tip Players targeted by "Unstable Embers" should move away from the group. |grouprole EVERYONE
|tip Traps will knockback the raid when destroyed, so be aware of your surroundings to avoid being knocked into damage. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Players with immunities may also do this. |grouprole DAMAGE
|tip "Golems" should be the primary target while active with their casts being interrupted. |grouprole DAMAGE
|tip Have a player with high mobility Salvage Parts for disabling traps. |grouprole DAMAGE
|tip Prioritize disabling traps near the center of the room when possible. |grouprole DAMAGE
_TANK:_ |grouprole TANK
|tip Tank should move the boss next to a Dragon Statue and wait until traps become active. |grouprole TANK
|tip Off-tank should soak "Shrapnel Bomb" when they appear. |grouprole TANK
|tip Bring Golems to the boss when possible. |grouprole TANK
Click Here to continue |confirm
step
kill Magmorax##201579 |goto Aberrus, the Shadowed Crucible/0 51.03,46.64
_EVERYONE:_ |grouprole EVERYONE
|tip During the encounter, random players will be targeted by "Molten Spittle". |grouprole EVERYONE
|tip After 6 seconds the afflicted players will detonate, leaving behind "Magma Puddles." |grouprole EVERYONE
|tip Magma Puddles need to be soaked up, usually by designated players. |grouprole EVERYONE
|tip Avoid stacking damage from Magma Puddles during "Igniting Roar." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Melee should place the puddles near the boss so that they can soak it while ranged should also try to keep it nearby. |grouprole DAMAGE
|tip "Overwhelming Stomp" can be mitigated by Warlock Gates and should be when possible. |grouprole DAMAGE
_TANK:_ |grouprole TANK
|tip Tank the boss near the side of the room for Overwhelming Stomp. |grouprole TANK
|tip Tanks be sure to keep the boss out of Magma Puddles. |grouprole TANK
|tip Tank swap every 2 stacks of "Incinerating Maw." |grouprole TANK
Click Here to continue |confirm
step
kill Echo of Neltharion |goto Aberrus, the Shadowed Crucible/3 50.62,28.23
_Warder Phase_
_EVERYONE:_ |grouprole EVERYONE
|tip "Echoing Fissure" does lethal damage the closer you are to the boss when it goes off. |grouprole EVERYONE
|tip "Twisted Eruption" will split the room with a rock wall, damaging players near where it appears. |grouprole EVERYONE
|tip "Rushing Shadows" attack random enemies and can cause the Twisted Eruption to Shatter. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip For "Calamitous Strike" the tank will be knocked back. |grouprole TANK
|tip Try to avoid being knocked into the Twisted Eruption or it will cause a "Shatter", dealing raid wide damage. |grouprole TANK
|tip
_Corruption and Fracture Phase_
_EVERYONE:_ |grouprole EVERYONE
|tip "Twisted Aberrations" deal massive AoE damage and leave behind portals._ |grouprole EVERYONE
|tip During "Ebon Destruction" players must use the portals to avoid the damage._ |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Tanks will be targeted by "Sunder Shadow" which will seperate them from their bodies. |grouprole TANK
|tip You will need to run back asap. |grouprole TANK
step
kill Scalecommander Sarkareth##205319 |goto Aberrus, the Shadowed Crucible/4 48.97,71.21
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip Players hit by "Emptiness Between Stars" have their damage reduced by 99% and will die unless they recover a fragment of their mind.
|tip "Glittering Surge" applies Dazzled to players who have Oppressing Howl. |grouprole EVERYONE
|tip Avoid "Scorching Bomb" which targets random players which will detonate leaving behind Burning Ground.
|tip Players hit will take heavy damage as well as a DoT.
_TANK:_ |grouprole TANK
|tip "Burning Claws" deals heavy damage leaving a dot. |grouprole TANK
|tip When the DoT from Burning Claws drops, "Blazing Blast" deals raid wide damage based on damage taken from the DoT. |grouprole TANK
PHASE 2
_DAMAGE:_ |grouprole DAMAGE
|tip "Abyssal Breath" creates temporal images of Sarkareth, increasing power from "Ebon Might." |grouprole DAMAGE
|tip "Void Bomb" erupts for high damage unless detonated within "Emptiness Between Stars." |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip "Void Bomb" erupts for high damage unless detonated within "Emptiness Between Stars." |grouprole HEALER
_TANK:_ |grouprole TANK
|tip "Void Claw" gives a DoT and reduces healing recieved by 25% for 18 seconds and stacks.
|tip When the effect expires, "Void Blast" dealing damage to players within 20 yards of the victim.
PHASE 3
_EVERYONE:_ |grouprole EVERYONE
|tip During "Cosmic Ascension" Sarkareth enters a portal and deals heavy damage as well as knocking back players near. |grouprole EVERYONE
|tip During "Astral Formation" asteroids well be pulled from the portal and land randomly on the battlefield. |grouprole EVERYONE
|tip During "Scouring Eternity", hide behind Astral Formations to avoid lethal damage. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Void Bomb and its mechanics persist.
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite Intro Questline",{
author="support@zygorguides.com",
description="This guide will help you complete the Dawn of the Infinite questline.",
condition_suggested=function() return level == 70 and not completedq(76145) end,
startlevel=70,
patch='100105',
},[[
step
talk Nozdormu##187669
|tip At the top of the tower.
accept Dawn of the Infinite##76140 |goto Valdrakken/0 61.55,39.15
step
Meet Nozdormu at Eon's Fringe |q 76140/1 |goto Thaldraszus/0 52.22,79.48
|tip Up on the platform.
step
Watch the dialogue
talk Future Chromie##205706
turnin Dawn of the Infinite##76140 |goto 52.29,79.47
accept Align in the Sand##76141 |goto 52.29,79.47
accept On Borrowed Time##76142 |goto 52.29,79.47
stickystart "Collect_20_Time_Lost_Essence"
step
click Temporal Hourglass
|tip Under the bridge.
Place the Western Hourglass |q 76141/2 |goto 56.37,83.23
step
click Temporal Hourglass
Place the Eastern Hourglass |q 76141/1 |goto 57.98,85.97
step
click Temporal Hourglass
|tip Under the bridge.
Place the Northern Hourglass |q 76141/3 |goto 59.43,78.89
step
label "Collect_20_Time_Lost_Essence"
Kill Time-Lost enemies around this area
use the Epoch Extractor##206586
|tip Use it on enemies you kill.
collect 20 Time-Lost Essence##206269 |q 76142/1 |goto 57.21,81.32
step
Watch the dialogue
talk Chromie##205707
turnin Align in the Sand##76141 |goto 61.45,79.70
turnin On Borrowed Time##76142 |goto 61.45,79.70
accept Chro-me?##76143 |goto 61.45,79.70
step
clicknpc C'Thromie##206056
|tip Running between two portals at this area.
use the Time Trap##206369
|tip Drop the trap here and wait for Chromie to run over it.
Investigate the Alternate Chromie |q 76143/1 |count 1 |goto 59.22,81.97
step
clicknpc Chromrgl##206053
|tip Running between two portals at this area.
use the Time Trap##206369
|tip Drop the trap here and wait for Chromrgl to run over it.
Investigate the Alternate Chromie |q 76143/1 |count 2 |goto 58.19,86.03
step
clicknpc Growmie##206054
|tip Running between two portals at this area.
use the Time Trap##206369
|tip Drop the trap here and wait for Growmie to run over it.
Investigate the Alternate Chromie |q 76143/1 |count 3 |goto 56.74,81.72
step
clicknpc Chromew##206055
|tip Running between two portals at this area.
use the Time Trap##206369
|tip Drop the trap here and wait for Chromew to run over it.
Investigate the Alternate Chromie |q 76143/1 |goto 59.51,77.94
step
talk Chromie##205707
turnin Chro-me?##76143 |goto 61.45,79.71
accept Morchie Mayhem##76144 |goto 61.45,79.71
step
click Temporal Hourglass
Inspect the Hourglass |q 76144/1 |goto 61.41,79.70
step
Enter the building |goto 61.77,81.25 < 15
Confront Morchie |q 76144/2 |goto 61.84,81.32
|tip Inside the building.
step
kill Infinite Dragon##205709
|tip Inside the building.
kill Morchie##205708 |q 76144/3 |goto Thaldraszus/0 62.32,81.80
step
talk Chromie##206149
|tip Inside the building.
turnin Morchie Mayhem##76144 |goto 62.05,81.53
accept Who's That Chromie?##76145 |goto 62.05,81.53
step
Find Morchie |q 76145/1 |goto 61.35,76.80
step
talk Chro-normie##205739
Tell her _"You're actually Morchie in disguise!"_
Accuse the Real Morchie |q 76145/2 |goto 61.35,76.80
step
talk Chromie##205710
turnin Who's That Chromie?##76145 |goto 61.29,83.28
accept Dawn of the Infinite: Chrono-Lord Deios##76146 |goto 61.29,83.28
step
kill Chrono-Lord Deios##199000 |q 76146/1 |goto Dawn of the Infinite/4 50.50,56.56 |or
|tip This is the final boss of the Dawn of the Infinite dungeon.
|tip Use the dungeon guide to accomplish this.
Click Here to Load the "Dawn of the Infinite" Dungeon Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite" |or
step
talk Chromie##205710
turnin Dawn of the Infinite: Chrono-Lord Deios##76146 |goto 61.29,83.28
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nChronikar\n"..
"Manifested Timeways\nBlight of Galkarond\nIridikron the Stonescaled\nChrono-Lord Deios\n"..
"Tyr, the Infinite Keeper\nMorchie\nAnduin Lothar",
keywords={"Dragonflight","Chronikar","Manifested","Timeways","Blight","Galkarond","Iridikron","Stonescaled","Chrono-Lord","Deios","Tyr","Keeper","Anduin","Lothar"},
condition_suggested=function() return level >= 70 end,
achieveid={16272},
mapid={2190,2191,2192,2193,2194,2195,2196,2197,2198},
patch='100105',
},[[
step
Complete the "Dawn of the Infinite Intro Questline" Guide |q 76145 |future |or
|tip This will unlock the dungeon.
Click Here to Load the Guide |confirm |loadguide "Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite Intro Questline" |or
step
kill Chronikar##198995 |goto Dawn of the Infinite/0 57.68,66.08
_EVERYONE:_ |grouprole EVERYONE
|tip When "Sand Stomped," place it near the end of the room. |grouprole EVERYONE
|tip Avoid standing in "Withering Sandpools." |grouprole EVERYONE
|tip At 100 energy, 2 random players must dodge the ground circle and ensuing "Eon Fragments" to avoid heavy damage. |grouprole EVERYONE
|tip After avoiding the fragments, quickly soak the "Eon Residue." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Position yourself near the end of the room to minimize movement when dropping "Sand Stomps" |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Provide the tank with extra healing during and immediately following "Chronoshear" casts. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Use active mitigation before "Chronoshear" to help with the increased damage taken following it. |grouprole TANK
Click Here to Continue |confirm
step
kill Manifested Timeways##206238 |goto Dawn of the Infinite/1 67.36,58.64
_EVERYONE:_ |grouprole EVERYONE
|tip Throughout the fight, the room will be 4 equal quarters. |grouprole EVERYONE
|tip 2 will be "Decaying Time," 2 will be "Accelerating Time." |grouprole EVERYONE
|tip If you can DPS while moving, stay in "Decaying Time." |grouprole EVERYONE
|tip Avoid being hit by "Fragments of Time," which are greatly slowed while in "Decaying Time." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Balance your damage and movement and try to maintain DPS uptime during cooldowns while in "Decaying Time." |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Dispel "Chrono-Faded" from the 2 affected players immediately, using Mass Dispel if available. |grouprole HEALER
|tip The "Chrono-Faded" debuff ticks much faster on players in "Accelerating Time." |grouprole HEALER
_TANK:_ |grouprole TANK
|tip While in "Decaying Time," the second "Unwind" cast is significatnly delayed. |grouprole TANK
|tip Stay in melee range at all times to avoid raid-wide damage. |grouprole TANK
Click Here to Continue |confirm
step
kill Blight of Galkarond##207639 |goto Dawn of the Infinite/4 35.68,35.22
_EVERYONE:_ |grouprole EVERYONE
|tip Phase 1 lasts until 80% against Galkarond, phase 2 until 50% against Ahnzon, and phase 3 for the last 50% against Loszkeleth and Dazhak. |grouprole EVERYONE
|tip Avoid standing in "Blight Seep" during phase 1. |grouprole EVERYONE
|tip Move out of "Corrosive Expulsion" ground pools during phase 1. |grouprole EVERYONE
|tip Run the "Corrosion" debuff to the tank and touch them to transfer it. |grouprole EVERYONE
|tip Avoid tornadoes during phase 2. |grouprole EVERYONE
|tip During phase 3, dealing damage to Loszkeleth also applies 100% to Dazhak. |grouprole EVERYONE
|tip Destroy "Necrofrost" quickly during phase 3. |grouprole EVERYONE
|tip Avoid "Incinerating Blightbreath" during phase 3. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Use cooldowns during phase 2 to push through it faster. |grouprole DAMAGE
|tip Cleave during phase 3 to deal extra damage. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Heal the "Corrosn" debuff holder. |grouprole HEALER
|tip Use cooldowns for "Necrotic Winds" in phase 2. |grouprole HEALER
|tip Heal players quickly to full during phase 3. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Avoid excess movement during phase 1 because pools drop every time Galkarond moves. |grouprole TANK
|tip Don't move during "Blight Reclamation" to clear "Corrosion" debuffs. |grouprole TANK
|tip Stack Loszkeleth and Dazhak together when possible. |grouprole TANK
Click Here to Continue |confirm
step
kill Iridikron the Stonescaled##194907 |goto Dawn of the Infinite/4 44.88,78.08
_EVERYONE:_ |grouprole EVERYONE
|tip Run under "Timeline Protection" to avoid dying if targeted by "Extinction Blast."
|tip Split the group in two during "Stonecracker Barrage," having 4 members soak a large pool and the tank soak a smaller pool. |grouprole EVERYONE
|tip Break the shield quickly during "Earthsurge" while dodging spikes and ichors. |grouprole EVERYONE
|tip Avoid the "Pulverizing Exhalation" frontal attack and interrupt "Stonebolt" casts on cooldown. |grouprole EVERYONE
|tip Stack under Chromie's "Timeline Transcendence" and use all defensive cooldowns during "Cataclysmic Obliteration." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Save DPS cooldowns for when you have the "Timeline Acceleration" buff. |grouprole DAMAGE
|tip Use defensive cooldowns during "Stonecracker Barrage" soaks. |grouprole DAMAGE
|tip Use any short cooldown damage boosts to break "Earthsurge" shields quicker. |grouprole DAMAGE
|tip Interrupt the Pulverizing Creations' "Stonebolt" casts. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep Chromie's health topped off at all times, especially during "Exhausted" debuffs. |grouprole HEALER
|tip Use cooldowns as needed when soaking pools. |grouprole HEALER
|tip Save healing cooldowns for "Cataclysmic Obliteration" casts. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Manage stacks of "Crushing Onslaught" and swap as necessary. |grouprole TANK
|tip Pick up Pulverizing Creations as quickly as possible. |grouprole TANK
Click Here to Continue |confirm
step
kill Tyr, the Infinite Keeper##198998 |goto Dawn of the Infinite/5 41.89,46.09
_EVERYONE:_ |grouprole EVERYONE
|tip Soak the "Dividing Stike" with a minimum of 2 players and move out of the following pool. |grouprole EVERYONE
|tip Avoid "Infinite Annihilation" frontal cones and following pools. |grouprole EVERYONE
|tip During "Siphone Oathstone," collect as many "Temporal Essence" as possible. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Use "Stolen Time" stacks to deal extra damage to the shield. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Dispel one "Spark of Tyr" quickly and heal the other target through it. |grouprole HEALER
|tip After dispelling the spark, the entire group will take damage. |grouprole HEALER
|tip Use cooldowns during "Radiant Barrier." |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Be prepared for the knockback follwing "Titanic Blow" and move out of the ground after. |grouprole TANK
Click Here to Continue |confirm
step
kill Morchie##202789 |goto Dawn of the Infinite/6 48.71,53.87
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid the frontal cone "Sand Blast" casts. |grouprole EVERYONE
|tip Quickly find the real Morchie during "More Problems!" and avoid the "Dragon's Breath" frontal cone cast. |grouprole EVERYONE
|tip Avoid running over "Time Traps" on the ground. |grouprole EVERYONE
|tip Kite the mobs through "Time Traps" during "Familiar Faces." |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Position yourself near traps before "Familiar Faces" casts. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Dispel players caught in "Time Traps" quickly. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Help identify the right Morchie during "More Problems!" |grouprole TANK
Click Here to Continue |confirm
step
kill Anduin Lothar##209208 |goto Dawn of the Infinite/7 50.26,54.34 |only if Alliance
kill Grommash Hellscream##209207 |goto 50.26,54.34 |only if Horde
_EVERYONE:_ |grouprole EVERYONE
|tip Focus the boss while cleaving adds. |grouprole EVERYONE
|tip Avoid "Bladestorm" and "Shockwave" casts. |grouprole EVERYONE
|tip Adds will be resummoned after each "FOR THE ALLIANCE!" cast. |grouprole EVERYONE |only if Alliance
|tip Adds will be resummoned after each "FOR THE HORDE!" cast. |grouprole EVERYONE |only if Horde
_DAMAGE:_ |grouprole DAMAGE
|tip Cleave adds, prioritizing Axe Throwers. |grouprole DAMAGE |only if Horde
|tip Cleave adds, prioritizing Archers. |grouprole DAMAGE |only if Alliance
_HEALER:_ |grouprole HEALER
|tip Dispel "Immolate" when convenient. |grouprole HEALER |only if Horde
|tip Dispel "Fireball" when convenient. |grouprole HEALER |only if Alliance
_TANK:_ |grouprole TANK
|tip Use active mitigation for "Decapitate" casts. |grouprole TANK
Click Here to Continue |confirm
step
kill Chrono-Lord Deios##199000 |goto Dawn of the Infinite/4 50.50,56.56
_EVERYONE:_ |grouprole EVERYONE
|tip Stage 2 begins at 20% health. |grouprole EVERYONE
|tip One person should soak puddles follwing "Infinity Orb" casts. |grouprole EVERYONE
|tip Nuke keepers quickly during "Summon Infinite Keeper." |grouprole EVERYONE
|tip Avoid puddles during phase 2. |grouprole EVERYONE
|tip At 10%, Nozdormu will be freed and grant you buffs. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Focus each keeper down quickly. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep a cooldown in case multiple debuffs occur at once. |grouprole HEALER
|tip Displey "Chronal Burn" immediately. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Face the boss away from the group to avoid hitting them with "Temporal Breath." |grouprole TANK
|tip Move the boss close to Infinite Keepers to allow the group to cleave. |grouprole TANK
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Old Scholomance Unlock",{
author="support@zygorguides.com",
description="This guide will show you how to unlock the classic version of the Scholomance dungeon.",
startlevel=30,
condition_end=function() return completedq(76249) end,
patch='100105',
},[[
stickystart "Collect_Essence_of_Undeath"
step
collect 3 Dark Rune##20520 |q 76248 |future
|tip Farm them from high level undead in Eastern Plaguelands or purchase them from the auction house.
|tip Save them in your inventory for a later step.
step
label "Collect_Essence_of_Undeath"
collect 5 Essence of Undeath##12808 |q 76248 |future
|tip Farm them from high level undead in Eastern Plaguelands or purchase them from the auction house. |notinsticky
|tip Save them in your inventory for a later step.
step
kill Doctor Theolen Krastinov##59369
|tip Kill Rattlegore in Heroic Scholomance.
|tip If Krastinov spawns, he will immediately yell "The doctor is in!"
|tip It may take dozens of kills, so using alts is advised since you can only do one heroic per day.
|tip Engage him in the next room, but do not kill him until he yells in chat or you can't loot him.
collect Krastinov's Bag of Horrors##88566 |goto Scholomance/2 36.39,37.55 |q 76248 |future |or
|tip If you have a friend with this, you can skip this step and the following step and have them use the toy for you.
|tip This is also shared across your account.
'|toy Krastinov's Bag of Horrors##88566 |or
step
use Krastinov's Bag of Horrors##88566
Collect the "Krastinov's Bag of Horrors" Toy |toy Krastinov's Bag of Horrors##88566 |q 76248 |future
|tip If you have a friend with this, you can skip this step and have them use the toy for you.
step
use Krastinov's Bag of Horrors##88566
|tip After killing Darkmaster Gandling, run to the room in the back on the top floor.
|tip Use it on the pile of bones.
|tip You will transform and Eva Sarkhoff will spawn near you, cowering in fear.
|tip If you have a friend with this, you can skip this step and have them use the toy for you.
Transform Yourself |havebuff Surgical Alterations##129023 |goto Scholomance/3 53.71,75.73 |q 76248 |future
step
Assume your Normal Form |nobuff Surgical Alterations##129023 |script CancelSpellByName("Surgical Alterations") |goto Scholomance/3 53.71,75.73
|tip Cancel the "Surgical Alterations" buff so Eva will talk to you.
step
Watch the dialogue
talk Eva Sarkhoff##206014
|tip Near you in the room.
Ask her _"What is written in your journal?"_
Speak with Eva Sarkhoff |q 76248 |goto 54.21,75.04 |future
step
use the Inert Spectral Essence##206365
Repair the Spectral Essence |q 76250 |future
|tip This requires the 3 Dark Runes and 5 Essence of Undeath you collected earlier.
step
click Eva's Femur##403552
|tip Near the small pile of bones next to you where you transformed earlier.
collect Eva's Femur##206364 |goto 53.71,75.73 |q 76249 |future
step
click Eva's Journal##403498
|tip It's on the first shelf in The Viewing Room to the right of the door to Darkmaster Gandling's room.
|tip The journal is on the far right side of the third shelf from the bottom.
collect Eva's Journal##206346 |goto Scholomance/2 45.30,82.43 |q 76249 |future
step
click Trampled Doll##403534
collect Trampled Doll##206361 |goto Eastern Plaguelands/0 35.72,83.65 |q 76249 |future
step
click The Road Ahead##403536
|tip Inside the building hanging on the wall on the ground floor.
collect The Road Ahead##206363 |goto 55.00,64.03 |q 76249 |future
step
click Undelivered Shipment of Smokes##403533
|tip Inside the Stratholme live side dungeon in the broken wagon behind the fountain in the first area.
collect Undelivered Shipment of Smokes##206360 |goto Stratholme/1 55.90,70.92 |q 76249 |future
step
click The Deed to Andorhal##403535
|tip Inside the building pinned to the column.
collect The Deed to Andorhal##206362 |goto Western Plaguelands/0 43.66,69.27 |q 76249 |future
step
Equip the Spectral Essence |equipped Spectral Essence##13544 |goto 63.40,75.42 |q 76249 |future
step
talk Rory##11285
buy Tobacco-Filled Candle##206355 |goto 63.34,75.62 |q 76249 |future
step
talk Artist Renfray##11936
|tip Inside the building.
buy Imported Candle##206358 |goto 65.78,75.36 |q 76249 |future
step
click Bucket of Fountain Water##403532
collect Caer Darrow Fountain Water##206359 |goto 68.90,78.82 |q 76249 |future
step
talk Sammy##11283
|tip She runs around the fountain.
buy Ghost-Warding Candle##206356 |goto 69.14,78.67 |q 76249 |future
step
talk Joseph Dirte##11316
buy Stinky Candle##206354 |goto 67.98,74.77 |q 76249 |future
step
talk Magistrate Marduke##11286
buy Authentic Andorhal Candle##206357 |goto 70.54,73.98 |q 76249 |future
step
use Eva's Journal##206346
|tip Inside the building on top of the grate.
|tip This will permanently unlock access to the old version of the Scholomance dungeon.
Perform the Ritual |q 76249 |future |goto 69.76,71.77
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Dragonflight Raids\\Amirdrassil, The Dream's Hope",{
mapid=2166,
achieveid={18160},
patch='100200',
condition_suggested=function() return level >= 70 end,
keywords={"Dragonflight"},
author="support@zygorguides.com",
},[[
step
kill Gnarlroot##209333 |goto Amirdrassil, The Dream's Hope/2 50.86,40.02
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip The fight alternates between two phases. |grouprole EVERYONE
|tip Phase 2 starts when the boss begins casting "Doom Cultivation". |grouprole EVERYONE
|tip Random players will be targeted by "Controlled Burn", which deals continuous damage. |grouprole EVERYONE
|tip Affected players have 6 seconds to move to a Tainted Lasher so that they activate them upon detonating. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Focus down "Tainted Lashers" as they appear. |grouprole DAMAGE
|tip Avoid standing in front of the boss. |grouprole DAMAGE
|tip During Doom Cultivation, focus down all adds asap. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip AoE heals will be required during "Tortured Scream", which lasts for 10 seconds. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Tank swap for "Dreadfire Barrage". |grouprole TANK
Click Here to Continue |confirm
step
kill Gnarlroot##209333 |goto Amirdrassil, The Dream's Hope/2 50.86,40.02
PHASE 2
_EVERYONE:_ |grouprole EVERYONE
|tip Once the roots are dealt with, Gnarlroot will take 100% extra damage. |grouprole EVERYONE
|tip Each time the boss hits this phase, their damage will permanently increase by 10% |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Absorb "Splintering Charcoal" circles and make contact with the roots that appear to destroy them. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Players destroying the roots will take heavy damage during this phase. |grouprole HEALER
|tip Raid wise damage will also be normal during this phase. |grouprole HEALER
Click Here to Continue |confirm
step
kill Igira the Cruel##206689 |goto Amirdrassil, The Dream's Hope/2 50.58,25.52
|tip Divide into 3 groups, each assigned to specific weapons. |grouprole EVERYONE
PHASE 1 (Fighting):
_EVERYONE:_ |grouprole EVERYONE
|tip Players targeted by "Blistering Spear" will be drawn towards it as long as they are active. |grouprole EVERYONE
|tip Try to place the circles near the boss. |grouprole EVERYONE
|tip When Igira reaches 100 energy the next phase starts. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Destroy Blistering Spears as the appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Players struck by Shared Agony will take addition damage over time from "Drenched Blades". |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Both tanks need to stack on the boss for "Vicious Swing" as well as "Shared Agony". |grouprole TANK
Click Here to Continue |confirm
step
PHASE 2 (Intermission)
kill Igira the Cruel##206689 |goto Amirdrassil, The Dream's Hope/2 50.58,25.52
_EVERYONE:_ |grouprole EVERYONE
|tip Groups should move to their assigned locations towards the shrinking weapon AoE's. |grouprole EVERYONE
|tip Stay out of the Blistering Spear puddles. |grouprole EVERYONE
|tip Once the damage is soaked the phase will end. |grouprole EVERYONE
|tip After the soak, players that absorbed "Slicing" will need to avoid 2 hits. |grouprole EVERYONE
|tip Players who absorbed "Flaying" are targeted by a heart symbol overhead. |grouprole EVERYONE
|tip Stack behind the boss so that when the absord wears off the orbs are sent away from the group. |grouprole EVERYONE
|tip Players who absorbed "Hacking" should use stun-removal skills if possible and likely need to be Mass dispelled after. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Volcoross##208478 |goto Amirdrassil, The Dream's Hope/0 54.94,58.73
WAVE 1
_EVERYONE:_ |grouprole EVERYONE
|tip Split the raid into 2 equal groups standing at the southern side of the arena. |grouprole EVERYONE
|tip At 100 energy he will submerge, using "Flood of the Firelands". |grouprole EVERYONE
|tip 2 globes of lava appear near each group and must be soaked. |grouprole EVERYONE
|tip After the soak, the groups should move up, one on each side to the center of the ring. |grouprole EVERYONE
|tip
WAVE 2
_EVERYONE:_ |grouprole EVERYONE
|tip The process will repeat, but the raid will be further apart. |grouprole EVERYONE
|tip At 100 energy, he will submerge once more using "Flood of the Firelands". |grouprole EVERYONE
|tip Absorb the 2 globes that appear and move up quickly once more. |grouprole EVERYONE
|tip
WAVE 3
_EVERYONE:_ |grouprole EVERYONE
|tip The arena will be covered in magma, which will activate "Serpent's Wrath". |grouprole EVERYONE
|tip Continue soaking the globes. |grouprole EVERYONE
|tip Everyone should begin watching for "Scorchtail Crash". |grouprole EVERYONE
|tip It will hover above an area which should be vacated quickly. |grouprole EVERYONE
|tip It deals fatal damage to those caught within the strike zone. |grouprole EVERYONE
|tip After, multiple blobs of magma appear and should be evaded. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Urctos##208363 |goto Amirdrassil, The Dream's Hope/1 43.22,61.24
|tip At 100 energy, players who turn to ducks need to save their dispel. |grouprole EVERYONE
kill Aerwynn##208365
|tip At 100 energy, she casts "Constricting Thicket" afflicting random players. |grouprole EVERYONE
|tip It deals minor damage and slows the targets. |grouprole EVERYONE
|tip She needs to be hit by Urctos' "Barreling Charge" to interrupt it, or the raid will wipe after 20 seconds. |grouprole EVERYONE
kill Pip##213390
|tip At 100 energy, he casts "Song of the Dragon" placing the raid into a bubble. |grouprole EVERYONE
|tip The bubble can be destroyed by "Noxious Blossoms" after 2-3 seconds. |grouprole EVERYONE
|tip After 20 seconds, players take moderate damage and will be stunned for 15 seconds if failing to break it. |grouprole EVERYONE
_EVERYONE:_ |grouprole EVERYONE
|tip Spread out before engaging. |grouprole EVERYONE
|tip The bosses will cast "Rebirth" at 1% Health, which will return them to 50% health if they all don't die at once. |grouprole EVERYONE
|tip Pick around 6-8 players to soak, using 2 of the lot to absorb each of Urctos' "Barreling Charge". |grouprole EVERYONE
|tip Avoid consecutive charges. |grouprole EVERYONE
|tip Targets of "Poisonous Javelin" will burst dealing moderate AoE damage within 10 yards after 10 seconds. |grouprole EVERYONE
|tip Pip will use "Polymorph Bomb" which affects random players, turning them into ducks for 12 seconds with a speed-boost ability and the ability to dispel. |grouprole EVERYONE
|tip To activate "Preen" you will need to consume 2 "Noxious Blossom". |grouprole EVERYONE
|tip Use Preen near Urctos to interrupt "Blind Rage", which will wipe the raid otherwise. |grouprole EVERYONE
|tip Melee steer clear of Urctos until the dispel is cast. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Face Urctos away from the group at all times to avoid fatal damage to other players via "Agonizing Claws". |grouprole TANK
Click Here to Continue |confirm
step
kill Larodar, Keeper of the Flame##208445 |goto Amirdrassil, The Dream's Hope/0 36.67,31.83
|tip The seed plays an important part of the encounter. |grouprole EVERYONE
|tip Assign a player to activate the seed. |grouprole EVERYONE
|tip Doing so creates a green circle around them. |grouprole EVERYONE
|tip Assign a second player to pass through that circle, creating a second. |grouprole EVERYONE
|tip Finally, assign a 3rd player to pass through. |grouprole EVERYONE
|tip The 3rd player to pass will have the ability to clear puddles. |grouprole EVERYONE
|tip All 3 players need to connect via the circles. |grouprole EVERYONE
|tip Maintain the connection. |grouprole EVERYONE
|tip The players need to move together when necessary. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Larodar, Keeper of the Flame##208445 |goto Amirdrassil, The Dream's Hope/0 36.67,31.83
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip Start in the corner between the fire puddles. |grouprole EVERYONE
|tip The goal is to have the boss fill the gap with each "Blazing Thorns" cast. |grouprole EVERYONE
|tip Assign 3 groups of 3 players to manage the Seed Mechanic. |grouprole EVERYONE
|tip The ritual can begin as soon as the seed has 10 energy. |grouprole EVERYONE
|tip When the boss is at 100 energy, the raid must move into the green circles for "Raging Inferno". |grouprole EVERYONE
|tip This phase persists until 40%. |grouprole EVERYONE
|tip The intermission phase starts at 40% and ends after the cast is over. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Focus down the Fiery Treants that spawn. |grouprole DAMAGE
|tip Pick up "Blazing Coalescence" left behind after each Blazing Thorn. |grouprole DAMAGE
|tip Focus down "Scorching Roots" that appear at 30 energy. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Heal up the Fiery Treants once they become friendly. |grouprole HEALER
|tip Raging Inferno deals massive raid wide damage. |grouprole HEALER
Click Here to Continue |confirm
step
kill Larodar, Keeper of the Flame##208445 |goto Amirdrassil, The Dream's Hope/0 36.67,31.83
PHASE 2
_EVERYONE:_ |grouprole EVERYONE
|tip Use Heroism/Bloodlust and DPS cooldowns at the start of Phase 2. |grouprole EVERYONE
|tip During this phase, "Falling Embers" appear and need to be soaked by a single player. |grouprole EVERYONE
|tip Ashen Treants should be avoided by melee as they move towards the boss. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Ranged DPS should focus down "Ashen Treants" as they appear. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Random players will be target by "Flash Fire" and need to be healed up before it detonates after 8 seconds. |grouprole HEALER
|tip Every 12 seconds, the boss gains a stack of "Searing Ash," which deals raid wide damage and acts as a soft enrage. |grouprole HEALER
Click Here to Continue |confirm
step
kill Nymue##206172 |goto Amirdrassil, The Dream's Hope/1 62.16,31.15
|tip Split the raid into 2 even groups for the intermission phase, one for the left and one for the right side. |grouprole EVERYONE
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip It is important to try and remain immobile during the encounter. |grouprole EVERYONE
|tip There are lines on the ground that will inflict damage when crossed. |grouprole EVERYONE
|tip Move out of "Surging Growth" which appear as giant swirling patterns while avoiding the lines. |grouprole EVERYONE
|tip Grass growth after allows for safe traversal across lines. |grouprole EVERYONE
|tip "Threads of Life" appear near their 3 targets. |grouprole EVERYONE
|tip Players not targeted should avoid small squares that appear on the map. |grouprole EVERYONE
|tip The targets of Threads of Life need the daggers to cross the lines before it reaches them. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Move away when afflicted by "Weaver's Burden." |grouprole TANK
Click Here to Continue |confirm
step
kill Nymue##206172 |goto Amirdrassil, The Dream's Hope/1 62.16,31.15
|tip Split the raid into 2 even groups for the intermission phase, one for the left and one for the right side. |grouprole EVERYONE
INTERMISSION
_EVERYONE:_ |grouprole EVERYONE
|tip Enemies can't be repositioned during this phase. |grouprole EVERYONE
|tip The lines on the floor won't be active during this time. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Establish a kick rotation for "Nature Volley." |grouprole DAMAGE
|tip Defeating both Wardens returns to Phase 1 and the lines will be active once more. |grouprole DAMAGE
|tip Be mindful of your health when returning to normal position. |grouprole DAMAGE
Click Here to Continue |confirm
step
kill Smolderon##214082 |goto Amirdrassil, The Dream's Hope/3 50.27,33.54
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip Start the fight at the room's perimeter. |grouprole EVERYONE
|tip Half the raid will be afflicted by "Overheated" and should move away from the raid. |grouprole EVERYONE
|tip Players not afflicted should meet on the tank using personal damage reduction cooldowns. |grouprole EVERYONE
|tip Overheated players should stand at the edge of the platform so that tornados have a chance to spawn off the map. |grouprole EVERYONE
|tip Afflicted players won't be able to absorb "Brand of Damnation." |grouprole EVERYONE
|tip The rest of the raid should soak the Brand of Damnation. |grouprole EVERYONE
|tip After the soak, remain stationary as possible, side stepping mechanics as the crop up. |grouprole EVERYONE
|tip After 2 combos, the intermission phase begins. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Move to the center of the room to detonate with "Searing Aftermath." |grouprole TANK
|tip
INTERMISSION
_EVERYONE:_ |grouprole EVERYONE
|tip The raid will be knocked away from the center. |grouprole EVERYONE
|tip Each player that soaked Brand of Damnation should be surrounded by orbs, increasing your effectiveness for each. |grouprole EVERYONE
|tip Gather orbs quickly while watching your health as gathering them causes you damage. |grouprole EVERYONE
|tip The boss will gain 1% damage increase for each orb he absorbs. |grouprole EVERYONE
|tip While navigating the battle for orbs, players mus also survive a sort of dance mechanic of saftey zones. |grouprole EVERYONE
|tip The safe areas will shift rapidly. |grouprole EVERYONE
|tip Save movement altering abilities for here. |grouprole EVERYONE
|tip The fight returns to phase 1 when the intermission is over. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Tindral Sageswift##210601 |goto Amirdrassil, The Dream's Hope/4 38.16,88.64
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip After Blazing Mushrooms are dealt with, the raid will be targeted by "Mass Entanglement". |grouprole EVERYONE
|tip Players able to prevent rooting should do so to avoid it. |grouprole EVERYONE
|tip They should be destroyed by the time "Fire Beam" is cast, or plays caught in the radius will likely die. |grouprole EVERYONE
|tip Simultaneously, random players will be targeted by "Fiery Growth" which deals heavy DoT. |grouprole EVERYONE
|tip Avoid standing in the pools left behind from dispelled Fiery Growth. |grouprole EVERYONE
|tip Save Bloodlust / Heroism for Phase 3. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Destroy roots from Mass Entanglement. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip If possible, dispel Fiery Growth as it appears on allies. |grouprole HEALER
|tip Be mindful of where the victim is standing to avoid overlapping puddles that appear as a result. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Pull the boss to the side of the room avoiding the ledge. |grouprole TANK
|tip Soak up "Blazing Mushrooms" as they appear. |grouprole TANK
|tip He will spawn 4 in 3 second intervals. |grouprole TANK
|tip Alternate soaks between the two tanks. |grouprole TANK
|tip
INTERMISSION
_EVERYONE:_ |grouprole EVERYONE
|tip When he changes to Flaring Owl form, he will drop feathers on the ground. |grouprole EVERYONE
|tip Everyone in the raid needs to grab a feather to enable Dragon Riding. |grouprole EVERYONE
|tip Fly up to towards the platform, gathering "Dream Essence" while avoiding Fiery Orbs. |grouprole EVERYONE
|tip They appear as green orbs and increase raid damage/healing and grant 3 Vigor to anyone who passes through. |grouprole EVERYONE
|tip The green orbs stack up to 10 times. |grouprole EVERYONE
|tip Upon reaching the platform, he will be casting "Supernova" which needs to be nuked down within 30 seconds. |grouprole EVERYONE
|tip When the Supernova is busted, Phase 2 starts. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Tindral Sageswift##210601 |goto Amirdrassil, The Dream's Hope/4 38.16,88.64
PHASE 2
_EVERYONE:_ |grouprole EVERYONE
|tip The abilities in this phase are the same but appear in a different order. |grouprole EVERYONE
|tip Try to return to raid formation before the dispel. |grouprole EVERYONE
|tip Mass Entanglement happens first, follow up by Blazing Mushrooms. |grouprole EVERYONE
|tip After dealing with the abilities, he will eventually spawn many mushrooms on the map. |grouprole EVERYONE
|tip Collect the ALL mushrooms that are summoned to avoid raid-wide damage. |grouprole EVERYONE
|tip The phase repeats twice before the second intermission. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip Save movement freeing abilities for tanks at the start of this phase so they can soak the Blazing Mushrooms. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip You will need to soak up Blazing Mushrooms during Mass Entanglement. |grouprole TANK
|tip Try to prioritize Blazing Mushroom soaks above all else during this phase. |grouprole TANK
|tip
INTERMISSION
_EVERYONE:_ |grouprole EVERYONE
|tip When he changes to Flaring Owl form, he will drop feathers on the ground. |grouprole EVERYONE
|tip Everyone in the raid needs to grab a feather to enable Dragon Riding. |grouprole EVERYONE
|tip Fly up to towards the platform, gathering "Dream Essence" while avoiding Fiery Orbs. |grouprole EVERYONE
|tip They appear as green orbs and increase raid damage/healing and grant 3 Vigor to anyone who passes through. |grouprole EVERYONE
|tip The green orbs stack up to 10 times. |grouprole EVERYONE
|tip Upon reaching the platform, he will be casting "Supernova" which needs to be nuked down within 30 seconds. |grouprole EVERYONE
|tip When the Supernova is busted, Phase 2 starts. |grouprole EVERYONE
Click Here to Continue |confirm
step
kill Tindral Sageswift##210601 |goto Amirdrassil, The Dream's Hope/4 38.16,88.64
PHASE 3
_EVERYONE:_ |grouprole EVERYONE
|tip This is a burn phase so use Bloodlust/Heroism. |grouprole EVERYONE
|tip Every mechanic from the previous phase happens during phase 3. |grouprole EVERYONE
|tip Small Mushrooms may appear during Fire Beam or roots but still must be gathered as best as possible. |grouprole EVERYONE
_TANK:_ |grouprole TANK
|tip Fire Beam may happen while soaking Blazing Mushrooms during this phase and it is advised to save Damage Reduction Cooldowns for that situation. |grouprole TANK
|tip
Click Here to Continue |confirm
step
kill Fyrakk##213646 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
PHASE 1
_EVERYONE:_ |grouprole EVERYONE
|tip Stay far away from the Roots of Amirdrassil so "Raging Flames" from "Firestorm" won't land close. |grouprole EVERYONE
|tip If "Raging Flames" reach the roots, the raid wipes. |grouprole EVERYONE
|tip When a "Dream Rend" portal spawns, run away quickly to avoid being pulled in and dying. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip Players take more damage the closer they are to portals. |grouprole HEALER
|tip Dispel "Aflame" immediately. |grouprole HEALER
|tip "Burning Presence" will deal consistent damage to the entire raid. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Position Fyrakk as far away from the Roots of Amirdrassil as possible. |grouprole TANK
|tip Swap threat every two stacks of "Fyr'alath's Mark" following "Fyr'alath's Bite" casts to manage the debuff. |grouprole TANK
|tip Face the boss away from the raid to avoid hitting them with "Fyr'alath's Flame." |grouprole TANK
confirm
step
kill Fyrakk##213646 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
INTERMISSION
_EVERYONE:_ |grouprole EVERYONE
|tip Avoid standing in front of Fyrakk during the intermission. |grouprole EVERYONE
|tip After the shield breaks, Fyrakk will deal damage and knock everyone up in the air. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Burn through the shield quickly to avoid a raid wipe. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Dispel "Aflame" immediately. |grouprole HEALER
|tip "Burning Presence" will deal consistent damage to the entire raid. |grouprole HEALER
confirm
step
kill Fyrakk##213646 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
PHASE 2
_EVERYONE:_ |grouprole EVERYONE
|tip If the Heart of Amirdrassil reaches 0 health, the raid wipes. |grouprole EVERYONE
|tip Stay far away from the Heart of Amirdrassil so "Raging Flames" from "Greater Firestorm" won't land close. |grouprole EVERYONE
|tip When Fyrakk dives to the ground during "Flamefall," run far away from the impact point to lessen the damage you take. |grouprole EVERYONE
|tip Avoid the line of fire when "Shadowflame Devastation" is cast. |grouprole EVERYONE
_DAMAGE:_ |grouprole DAMAGE
|tip Kill the Burning Colossi before they reach 100 energy or they will explode. |grouprole DAMAGE
|tip Following "Shadowflame Devastation," kill the Screaming Souls quickly. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Dispel "Aflame" immediately. |grouprole HEALER
|tip "Burning Presence" will deal consistent damage to the entire raid. |grouprole HEALER
|tip Heal Spirits of the Kaldorei to full quickly when they spawn to health the heart. |grouprole HEALER
|tip Burning Colossi that explode deal heavy damage to the entire raid and leave behind a DoT. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Pick up the Burning Colossus that spawns after "Greater Firestorm" casts. |grouprole TANK
confirm
step
kill Fyrakk##213646 |goto Amirdrassil, The Dream's Hope/5 56.49,53.21
PHASE 3
_EVERYONE:_ |grouprole EVERYONE
|tip Picking up a "Seed of Amirdrassil" will allow you to avoid deadly boss abilities. |grouprole EVERYONE
|tip Shortly after picking one up, "Bloom" can be used to create a bubble around you which absorbs a lot of damage for 6 seconds. |grouprole EVERYONE
|tip If you are hit by Shadowflame damage while carrying the seed however, it will deal damage to the entire raid for 6 seconds instead. |grouprole EVERYONE
|tip "Eternal Firestorm" areas should be moved out of, and will now leave behind Swirling Firestorms which need to be avoided. |grouprole EVERYONE
|tip Use a seed during "Apocalypse Roar" to avoid a large portion of the damage. |grouprole EVERYONE
|tip Avoid standing in front of Fyrakk during "Shadowflame Breath" or you will die. |grouprole EVERYONE
_HEALER:_ |grouprole HEALER
|tip "Apocalypse Roar" will still require heavy raid healing. |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Swap threat at two stacks of "Infernal Maw" to avoid unmanageable damage. |grouprole TANK
confirm
]])
