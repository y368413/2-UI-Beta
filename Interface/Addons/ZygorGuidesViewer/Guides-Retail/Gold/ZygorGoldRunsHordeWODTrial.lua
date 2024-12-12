local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("GoldRunHWOD") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
if UnitFactionGroup("player")=="Horde" then
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Anglers Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The August Celestials Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Order of the Cloud Serpent Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Shado-Pan Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Tillers Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Golden Lotus Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\The Klaxxi Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Dominance Offensive Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Sunreaver Onslaught Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Kalimdor Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Outland Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Northrend Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Cataclysm Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Pandaria Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Pandaren Spirits Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Beasts of Fable Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Horde Daily Runs\\Nagrand Soup Bones")
end
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Cocoa Beans (Horde)")
