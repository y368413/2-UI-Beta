local L = LibStub("AceLocale-3.0"):NewLocale("JellyDepositLocations", "enUS", true)


L["Show Nodes"] = true
L["Jelly"] = true
L["Imports Jelly Deposit Locations in Stormsong Valley for Honeyback Hive Reputation"] = true


-- Locale injections
local GatherMate2 = LibStub("AceAddon-3.0"):GetAddon("GatherMate2", true)
local Routes = LibStub("AceAddon-3.0"):GetAddon("Routes", true)

if Routes then
	local routes_local = LibStub("AceLocale-3.0"):GetLocale("Routes")
	routes_local["GatherMate2Jelly"] = "Jelly"
end

if GatherMate2 then
	local GatherMate_Local = LibStub("AceLocale-3.0"):GetLocale("GatherMate2Nodes", true)
	GatherMate_Local["Jelly Deposit"] = "Jelly Deposit"
end
