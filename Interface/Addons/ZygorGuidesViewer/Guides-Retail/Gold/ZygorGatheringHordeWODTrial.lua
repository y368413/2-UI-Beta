local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
ZygorGuidesViewer.Gold.guides_loaded=true
if ZGV:DoMutex("GoldGatherHWOD") then return end
if UnitFactionGroup("player")~="Horde" then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Abyssal Gulper Eel Flesh/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Blackwater Whiptail Flesh/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Blind Lake Sturgeon Flesh/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Crescent Saberfish Flesh")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fat Sleeper Flesh/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fire Ammonite Tentacle/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Jawless Skulker Flesh/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Sea Scorpion Segment/Crescent Saberfish Flesh (Garrison)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Peacebloom/Silverleaf/Earthroot")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Rain Poppy")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Alabaster Pigment")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Copper Ore/Rough Stone (Horde)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Ruined Leather Scraps/Light Leather(Horde)")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Light Leather/Medium Leather/Light Hide/Medium Hide")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Light Leather/Medium Leather/Light Hide/Medium Hide (Hillsbrad Foothills)")
