local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("TitlesA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Brutal Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Deadly Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Justicar")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Merciless Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Vengeful Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Furious Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Relentless Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Wrathful Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Dungeons & Raids\\Champion of the Naaru")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Dungeons & Raids\\Hand of A'dal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Reputations\\Of the Shattered Sun")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Argent Defender")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Grand Crusader")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Astral Walker")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Bane of the Fallen King")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Celestial Defender")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Champion of the Frozen Wastes")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Champion of Ulduar")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Conqueror of Naxxramas")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Conqueror of Ulduar")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Death's Demise")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Herald of the Titans")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Immortal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Kingslayer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Light of Dawn")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Magic Seeker")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Obsidian Slayer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Of the Nightfall")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Patient")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Starcaller")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Undying")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Twilight Vanquisher")
ZygorGuidesViewer:RegisterGuide("Title Guides\\Wrath of the Lich King Titles\\General\\The Explorer",{
author="support@zygorguides.com",
description="\nThis guide section will walk you through completing the Explorer achievement.",
playertitle=47,
},[[
leechsteps "Achievement Guides\\Exploration\\Eastern Kingdoms\\Eastern Kingdoms and Cataclysm Explorer"
leechsteps "Achievement Guides\\Exploration\\Kalimdor\\Kalimdor and Cataclysm Explorer"
leechsteps "Achievement Guides\\Exploration\\Northrend\\Northrend Explorer"
leechsteps "Achievement Guides\\Exploration\\Outland\\Outland Explorer"
#include "Explorer_Pandaria"
leechsteps "Achievement Guides\\Exploration\\Draenor\\Draenor Explorer"
leechsteps "Achievement Guides\\Exploration\\Legion\\Broken Isles Explorer"
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Of the Alliance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Arena Master")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Battlemaster")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\The Flawless Victor")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Vanquisher")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Cooking\\Chef\\Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Cooking\\Chef\\Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Fishing\\Salty")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Quests\\Loremaster")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Quests\\The Seeker")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Argent Champion\\Argent Crusade Reputation")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Argent Champion\\Argent Dawn Reputation")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Argent Tournament Grounds Aspirant Rank Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Argent Tournament Grounds Valiant Rank Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Draenei Champion Rank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Dwarf Champion Rank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Gnome Champion Rank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Human Champion Rank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Night Elf Champion Rank")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Kurenai Faction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Sporeggar Faction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Timbermaw Hold Faction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Guardian of Cenarius\\Cenarion Circle Faction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Guardian of Cenarius\\Cenarion Expedition Faction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Bloodsail Buccaneers Group")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Bloodsail Buccaneers Solo")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Darkmoon Faire")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Ravenholdt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\The Steamwheedle Cartel")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Ambassador")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Of the Ashen Verdict")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Bloodsail Admiral")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Exalted")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Brewmaster\\Brewfest Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Brewmaster\\Brewfest Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Brewmaster\\Brewfest Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Main Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Optimized Elders Path")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Flame Warden\\Midsummer Fire Festival Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Flame Warden\\Midsummer Fire Festival Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Hallowed")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Love Fool")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Dalaran Oracles Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Dalaran Wolvar Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Shattrath Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Stormwind Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Merrymaker\\Feast of Winter Veil Achievements")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Merrymaker\\Feast of Winter Veil Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Noble")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Pilgrim")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Blackwing's Bane")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Defender of a Shattered World")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Destroyer's End")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Dragonslayer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Firelord")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Of the Four Winds")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Savior of Azeroth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\General\\The Camel-Hoarder")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\The Bloodthirsty")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Cataclysmic Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Commander")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Corporal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Field Marshal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Grand Marshal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Hero of the Alliance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Captain")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Champion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Lieutenant")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Lieutenant Commander")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Marshal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Master Sergeant")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Private")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Ruthless Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Sergeant")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Sergeant Major")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Veteran of the Alliance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Vicious Gladiator")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Warbound")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Professions\\Archaeology\\Assistant Professor, Associate Professor, and Professor")
ZygorGuidesViewer:RegisterGuide("Title Guides\\Cataclysm Titles\\Quests\\The Flamebreaker",{
author="support@zygorguides.com",
playertitle=189,
},[[
step
This title is earned by completing the _Veteran of the Molten Front_ achievement.
confirm
step
#include "A_Firelands_PreQuests"
step
Now that you have access to the Firelands Dailies, please use the Zygor Achievement Guides to help obtain this title.
achieve 5879
step
Congratulations! You have earned the title "The Flamebreaker"!
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Reputations\\Avenger of Hyjal")
