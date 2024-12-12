local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldFarmHWOD") then return end
if UnitFactionGroup("player")~="Horde" then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Clam Meat, Small Lustrous Pearl")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Raw Elekk Meat")
