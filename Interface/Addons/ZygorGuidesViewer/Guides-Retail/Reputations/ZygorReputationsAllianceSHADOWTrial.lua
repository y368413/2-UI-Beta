local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("ReputationsASHADOW") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Shadowlands\\Kyrian Covenant of Bastion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Shadowlands\\Necrolords of Maldraxxus")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Shadowlands\\Night Fae of Ardenweald")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Shadowlands\\Venthyr of Revendreth")
