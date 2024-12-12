local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldFarmCSHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Lightless Silk (Ardenweald)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Lightless Silk (Revendreth)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Shrouded Cloth (Ardenweald)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Shrouded Cloth (Revendreth)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Aethereal Meat (Bastion)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Aethereal Meat (Revendreth)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Creeping Crawler Meat (Maldraxxus)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Creeping Crawler Meat (Ardenweald)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Phantasmal Haunch (Ardenweald)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Phantasmal Haunch (Maldraxxus)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Raw Seraphic Wing")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Shadowy Shank (Ardenweald)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Shadowy Shank (Maldraxxus)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Tenebrous Ribs (Maldraxxus)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Tenebrous Ribs (Ardenweald)")
