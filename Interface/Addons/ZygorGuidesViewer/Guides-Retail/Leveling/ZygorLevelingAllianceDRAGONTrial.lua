local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("LevelingADRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Stormwind Trading Post Unlock")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Daily Guides\\Dragonflight (10-70)\\Primal Storms Daily Quest")
