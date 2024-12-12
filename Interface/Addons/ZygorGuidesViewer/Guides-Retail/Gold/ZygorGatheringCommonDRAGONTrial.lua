local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldGatherCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Ribbed Mollusk Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Aileron Seamoth")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Cerulean Spinefish/Scalebelly Mackerel")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Islefin Dorado")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Lava Beetle")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Temporal Dragonhead/Thousandbite Piranha")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Magma Thresher")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Prismatic Leaper (Ohn'ahran Plains)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Prismatic Leaper (The Azure Span)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Prismatic Leaper (Thaldraszus)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Hochenblume")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Bubble Poppy/Saxifrage")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Writhebark")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Serevite/Draconium/Khaz'gorite Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Resilient Leather/Dense Hide")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Adamant Scales/Lustrous Scaled Hide")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Tattered Wildercloth/Wildercloth (Tailoring)")
