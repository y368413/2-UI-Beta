local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldGatherCLEGION") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Black Barracuda")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Highmountain Salmon")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Silver Mackerel")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Aethril")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Dreamleaf")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Foxflower")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fjarnskaggl")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Starlight Rose")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Leystone Ore & Felslate (Mining Route)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Felslate (Killing & Mining Enemies)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Stonehide Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Stormscale")
