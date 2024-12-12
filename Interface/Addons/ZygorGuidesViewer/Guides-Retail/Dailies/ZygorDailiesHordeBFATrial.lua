local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("DailiesHBFA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\BFA World Quest Unlock")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Nazjatar\\Nazjatar Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Mechagon Island\\Mechagon Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Mechagon Island\\Mechagon Fishing Dailies")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Battle Pets\\Battle Pet Dungeons\\Stratholme Weekly")
