local JellyDep = LibStub("AceAddon-3.0"):NewAddon("JellyDepositLocations")
local L = LibStub("AceLocale-3.0"):GetLocale("JellyDepositLocations", false)

local GatherMate2 = LibStub("AceAddon-3.0"):GetAddon("GatherMate2", true)
local Routes = LibStub("AceAddon-3.0"):GetAddon("Routes", true)

local GM_Config = GatherMate2:GetModule("Config")


local DB_NAME = "Jelly"
local NODE_IDS = {["Jelly Deposit"] = 0}
local icon_path = "Interface\\AddOns\\JellyDepositLocations\\Artwork\\"
local TEXTURES = {[0] = icon_path.."honey.tga"}

local STORMSONG_ID = 942

local SHOW_VALUE = {
	["always"] 	= true,
	["never"]	= false
}

if Routes then
	-- Hack to adjust translate_db_type in Routes so 
	-- jelly routes can be catagorized correctly
	local originalAppendNodes = Routes.plugins["GatherMate2"].AppendNodes
	local function AppendNodesExtension(node_list, zone, db_type, node_type)
		local english_node, localized_node, o_type = originalAppendNodes(node_list,
																		zone,
																		db_type,
																		node_type)

		if db_type == DB_NAME then
			o_type = "Treasure"
		end

		return english_node, localized_node, o_type
	end
	Routes.plugins["GatherMate2"].AppendNodes = AppendNodesExtension
end

if not GatherMate2 then
	print("GatherMate2 not found")
	return
end

local function setDB()
	GatherMate2:RegisterDBType(DB_NAME, {})
	GatherMate2.nodeIDs[DB_NAME] = NODE_IDS
	local reverse = GatherMate2:CreateReversedTable(NODE_IDS)
	GatherMate2.reverseNodeIDs[DB_NAME] = reverse
	GatherMate2.nodeTextures[DB_NAME] = TEXTURES
	GatherMate2.db.profile.cleanupRange[DB_NAME] = 0
	
	-- add all points
	for node_id, positions in pairs(JellyDep.data) do
		for i, position in ipairs(positions) do
			GatherMate2:AddNode(STORMSONG_ID,
								position[1]/100,
								position[2]/100,
								DB_NAME,
								reverse[node_id])
		end
	end
end

local function getShow()
	show = GatherMate2.db.profile.show[DB_NAME]
	if not show then
		show = "never"
		return false
	end
	return SHOW_VALUE[show]
end

local function toggleShow()
	if not GatherMate2.db.profile.show[DB_NAME] then
		GatherMate2.db.profile.show[DB_NAME] = "always"
	end
	show = GatherMate2.db.profile.show[DB_NAME]

	if show == "always" then
		show = "never"
	else
		show = "always"
	end

	if show == "always" and not DBisLoaded() then
		setDB()
	end

	GatherMate2.db.profile.show[DB_NAME] = show
	GM_Config:UpdateConfig()
	return SHOW_VALUE[show]
end

local optionsTable = {
	type = "group",
	name = "JellyDepositLocations",
	args = {
		desc = {
			order = 0,
			type = "description",
			name = L["Imports Jelly Deposit Locations in Stormsong Valley for Honeyback Hive Reputation"]
		},
		show = {
			order = 1,
			type = "toggle",
			name = L["Show Nodes"],
			get = getShow,
			set = toggleShow
		},
	}
}

function DBisLoaded()
	for i,v in ipairs(GatherMate2.db_types) do
		if v == DB_NAME then
			return true
		end
	end
	return false
end

function JellyDep:OnEnable()
	local Config = GatherMate2:GetModule("Config")
	Config:RegisterModule(L["Jelly"], optionsTable)

	show = GatherMate2.db.profile.show[DB_NAME]
	if show and show == "always" and not DBisLoaded() then
		setDB()
	end
end
