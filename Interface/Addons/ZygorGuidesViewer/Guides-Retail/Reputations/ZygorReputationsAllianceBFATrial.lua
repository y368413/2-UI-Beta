local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("ReputationsABFA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\7th Legion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Champions of Azeroth")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Order of Embers")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Proudmoore Admiralty")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rustbolt Resistance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Storm's Wake")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Tortollan Seekers")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Waveblade Ankoan")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Honeyback Hive")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Honeyback Harvester")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rajani")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Uldum Accord")
