local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("GoldRunAWOD") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
if UnitFactionGroup("player")=="Alliance" then
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Anglers Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The August Celestials Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Order of the Cloud Serpent Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Shado-Pan Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Tillers Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Golden Lotus Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\The Klaxxi Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Operation:Shieldwall Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Kirin Tor Offensive Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Eastern Kingdoms Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Outland Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Northrend Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Cataclysm Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Pandaria Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Pandaren Spirits Battle Pet Dailies Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Alliance Daily Runs\\Beasts of Fable Battle Pet Dailies Run")
end
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Farming\\Cocoa Beans (Alliance)")
