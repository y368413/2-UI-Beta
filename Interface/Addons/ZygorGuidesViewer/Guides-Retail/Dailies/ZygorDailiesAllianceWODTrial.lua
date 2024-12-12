local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("DailiesAWOD") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Lunarfall Inn Dungeon Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Fishing Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Battle Pets Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Harrison Jones Treasure Contracts")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Muradin Bronzebeard Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Renzik Daily Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Assault Daily Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Building Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Hand of the Prophet Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Order of the Awakened Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\The Saberstalkers")
