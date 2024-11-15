--[[
    Copyright (C) 2023 GurliGebis

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
]]

local addonName, _ = ...
local L_Broker = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_Broker", "enUS", true, true)

-- Broker
L_Broker["Battle Pet Completionist"] = "Battle Pet Completionist"
L_Broker["Battle Pets"] = "Battle Pets"
L_Broker["Left Click to toggle goal tracker"] = "|cffffff00Left Click|r to toggle goal tracker"
L_Broker["Met goal"] = "Met goal: %d/%d"
L_Broker["No pets found for current zone"] = "No pets found for current zone"
L_Broker["Right Click for options"] = "|cffffff00Right Click|r for options"
L_Broker["Suffix - Collected"] = "Collected"
L_Broker["Suffix - Max Collected"] = "Max Collected"
L_Broker["Suffix - Max Rare"] = "Max Rare"
L_Broker["Suffix - Rare"] = "Rare"


local L_Capture = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_Capture", "enUS", true, true)

-- Capture
L_Capture["Uncollected pet found"] = "Uncollected pet found!"
L_Capture["Uncollected pets found"] = "Uncollected pets found!"


local L_Combat = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_Combat", "enUS", true, true)

-- Combat
L_Combat["Friend accepted"] = "%s has accepted your offer|n|nPlease wait for them before forfeiting"
L_Combat["Friend declined"] = "%s has declined your offer"
L_Combat["Friend has pets"] = "Someone (%s - in zone: %s) in your party is offering you the following battle pets.|n|nBy clicking Accept, a TomTom waypoint will be created, and a notifaction will be sent.|n|nNeeded pets: %s"
L_Combat["Friend needs pets"] = "Someone (%s) in your party needs one or more pets you are battling.|n|nDo you want to offer them these pets and send your location?|n|nNeeded pets: %s"
L_Combat["No pet upgrades, forfeit?"] = "There are no pet upgrades available (or they are below the threshold)|n|nWould you like to forfeit?"
L_Combat["Tomtom Waypoint Text"] = "Battle Pet Completionist friend - %s"


local L_Config = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_Config", "enUS", true, true)

-- Config
L_Config["Add a suffix to the displayed text"] = "Add a suffix to the displayed text"
L_Config["Broker Goal - Collect at least one"] = "Collect at least one"
L_Config["Broker Goal - Collect at least one rare"] = "Collect at least one rare"
L_Config["Broker Goal - Collect maximum amount"] = "Collect maximum amount"
L_Config["Broker Goal - Collect maximum amount rare"] = "Collect maximum amount rare"
L_Config["Combat mode"] = "Combat mode"
L_Config["Combat Mode - Forfeit"] = "Forfeit"
L_Config["Combat Mode - Help a Friend"] = "Help a Friend"
L_Config["Combat Mode - None"] = "None"
L_Config["Config Section - Battle Pet Completionist"] = "Battle Pet Completionist"
L_Config["Description - Combat settings"] = "Combat settings"
L_Config["Description - Data Broker settings"] = "Data Broker settings"
L_Config["Description - Integration settings"] = "Integration settings"
L_Config["Description - Map pins settings"] = "Map pins settings"
L_Config["Description - Minimap settings"] = "Minimap settings"
L_Config["Description - Tooltip and notification settings"] = "Tooltip and notification settings"
L_Config["Display Goal"] = "Display Goal"
L_Config["Enable the minimap icon"] = "Enable the minimap icon"
L_Config["Enable tooltips for pet cages and auction listings"] = "Enable tooltips for pet cages and auction listings"
L_Config["Enter part the name to filter by"] = "Enter part the name to filter by"
L_Config["Forfeit prompt unless"] = "Forfeit prompt unless"
L_Config["Forfeit Prompt Unless - Missing"] = "Missing"
L_Config["Forfeit Prompt Unless - Not maximum amount collected"] = "Not maximum amount collected"
L_Config["Forfeit Prompt Unless - Not maximum rare collected"] = "Not maximum rare collected"
L_Config["Forfeit Prompt Unless - Not rare"] = "Not rare"
L_Config["Forfeit threshold"] = "Forfeit threshold"
L_Config["Forfeit Threshold - Common"] = "Common"
L_Config["Forfeit Threshold - Poor"] = "Poor"
L_Config["Forfeit Threshold - Rare"] = "Rare"
L_Config["Forfeit Threshold - Uncommon"] = "Uncommon"
L_Config["Header - Combat"] = "Combat"
L_Config["Header - Display"] = "Display"
L_Config["Header - Integrations"] = "Integrations"
L_Config["Header - Map pins"] = "Map pins"
L_Config["Header - Tooltips and Notifications"] = "Tooltips and Notifications"
L_Config["How to function when pet battles are started"] = "How to function when pet battles are started"
L_Config["Include goal text"] = "Include goal text"
L_Config["Map Pin Filter - All"] = "All"
L_Config["Map Pin Filter - Missing"] = "Missing"
L_Config["Map Pin Filter - Name filter"] = "Name filter"
L_Config["Map Pin Filter - None"] = "None"
L_Config["Map Pin Filter - Not maximum amount collected"] = "Not maximum amount collected"
L_Config["Map Pin Filter - Not maximum rare collected"] = "Not maximum rare collected"
L_Config["Map Pin Filter - Not rare"] = "Not rare"
L_Config["Map pin icon type"] = "Map pin icon type"
L_Config["Map Pin Icon Type - Pet Family"] = "Pet Family"
L_Config["Map Pin Icon Type - Pet Icon"] = "Pet Icon"
L_Config["Map pin size"] = "Map pin size"
L_Config["Map Pin Size - Extra small"] = "Extra small"
L_Config["Map Pin Size - Large"] = "Large"
L_Config["Map Pin Size - Medium"] = "Medium"
L_Config["Map Pin Size - Small"] = "Small"
L_Config["Map pin sources"] = "Map pin sources"
L_Config["Map pins to include"] = "Map pins to include"
L_Config["Partial pet name"] = "Partial pet name"
L_Config["SHIFT + left clicking a map pin creates a TomTom waypoint"] = "SHIFT + left clicking a map pin creates a TomTom waypoint"
L_Config["Show a notification window when one or more uncollected pets can be captured"] = "Show a notification window when one or more uncollected pets can be captured"
L_Config["Show a tooltip when hovering over a Pet Cage item or a pet in the auction UI"] = "Show a tooltip when hovering over a Pet Cage item or a pet in the auction UI"
L_Config["Show an icon on the minimap"] = "Show an icon on the minimap"
L_Config["Show notification when uncollected pets are in the enemy team"] = "Show notification when uncollected pets are in the enemy team"
L_Config["The condition for when to not forfeit"] = "The condition for when to not forfeit"
L_Config["The goal to track in the data source"] = "The goal to track in the data source"
L_Config["The kind of icon to show in the pins on the map"] = "The kind of icon to show in the pins on the map"
L_Config["The size of the pins on the map"] = "The size of the pins on the map"
L_Config["The sources for pets to show on the map"] = "The sources for pets to show on the map"
L_Config["The threshold for when to always suggest forfeit"] = "The threshold for when to always suggest forfeit"
L_Config["Tomtom"] = "Tomtom"
L_Config["Which map pins should be shown on the map"] = "Which map pins should be shown on the map"


local L_GoalTracker = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_GoalTracker", "enUS", true, true)

-- GoalTracker
L_GoalTracker["BattlePets Goal Tracker"] = "BattlePets Goal Tracker"
L_GoalTracker["Collected"] = "%d/%d Collected"
L_GoalTracker["Uncollected"] = "%d/%d Uncollected"


local L_Map = LibStub("AceLocale-3.0"):NewLocale(addonName .. "_Map", "enUS", true, true)

-- Map
L_Map["Collected"] = "Collected: %s"
L_Map["Dropdown Headline"] = "Battle Pet Completionist:"
L_Map["Show Battle Pets"] = "Show Battle Pets"
L_Map["Tracking disabled"] = "Battle Pet Completionist - Tracking disabled"
L_Map["Tracking enabled"] = "Battle Pet Completionist - Tracking enabled"
