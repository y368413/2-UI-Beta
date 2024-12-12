local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldFarmCLEGION") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Shal'dorei Silk")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Wildfowl Egg")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Big Gamy Ribs")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Lean Shank")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Fatty Bearsteak")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Leyblood")
