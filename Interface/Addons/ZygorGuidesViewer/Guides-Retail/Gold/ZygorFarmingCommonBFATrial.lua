local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldFarmCBFA") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Deep Sea Satin")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Gilded Seaweave")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Tidespray Linen")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Aberrant Voidfin")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Briny Flesh")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Malformed Gnasher")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Meaty Haunch")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Moist Fillet")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Questionable Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Rubbery Flank")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Thick Paleo Steak")
