local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("DailiesCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Azj'Kahet Weekly Pacts")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Azj'Kahet World Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Hallowfall World Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Isle of Dorn World Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\The Ringing Deeps World Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Special Missions Locked")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Theater Troupe")
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\The War Within (70-80)\\Awakening the Machine")
ZGV.BETAEND()
