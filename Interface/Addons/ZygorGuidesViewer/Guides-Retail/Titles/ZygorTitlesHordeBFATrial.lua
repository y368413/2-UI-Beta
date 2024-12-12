local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("TitlesHBFA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Dungeon & Raid\\The Purifier")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\The Awakened")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Junkyard")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Renowned Explorer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Veteran of the Fourth War")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Island Expedition\\Expedition Leader")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Reputation\\The Admired")
ZygorGuidesViewer:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Reputation\\Esteemed")
