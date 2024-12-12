local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHSHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Shadowlands (50-60)\\Blood Elf Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Shadowlands (50-60)\\Stolen Shipments")
