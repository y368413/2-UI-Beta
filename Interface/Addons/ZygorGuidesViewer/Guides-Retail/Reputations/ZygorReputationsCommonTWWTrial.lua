local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("ReputationsCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\The War Within Reputations\\Council of Dornogal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\The War Within Reputations\\Hallowfall Arathi")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\The War Within Reputations\\The Assembly of the Deeps")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\The War Within Reputations\\The Severed Threads")
ZGV.BETAEND()
