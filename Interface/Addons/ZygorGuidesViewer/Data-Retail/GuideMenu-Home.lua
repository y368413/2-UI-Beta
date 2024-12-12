local name,ZGV = ...

-- #GLOBALS ZygorGuidesViewer

local GuideMenu = ZGV.GuideMenu

GuideMenu.Messages = {}
-- Notification messages
GuideMenu.Messages.welcome = { 
	action = function() ZGV.GuideMenu:Show("Featured") end,
	title = "Welcome to Zygor Guides",
	text = [[See the **Patch 10.2.7 - Dark Heart** guides]],
	--displaytime = 5,
}

--[=[
GuideMenu.Messages.guides = { 
	action = function() ZGV.GuideMenu:Show("Home") ZGV.Widgets.Registered.zygormessage:ShowPopup() end,
	title = "New in this update",
	text = [[Added additional **Dragonflight Pets and Achievements** guides
	displaytime = 5,
	]],
}
--]=]

--[=[
GuideMenu.Messages.features = { 
	action = function() print("features") end,
	title = "New features have been added.",
	text = [[]],
	displaytime = 99999,
}
--]=]

-- ZygorMessage widget
GuideMenu.ZygorMessage = [[
Welcome to Zygor's Dragonflight Guides

Known issues:
* We suggest using the Starlight theme as the Stealth theme currently has some display issues with the new Notification system.

Key Updates:
* Updated the Spark of Ingenuity guide to Dragonflight Campaign
* Updated World Quests
* The Silver Purpose chapter committed for Valdrakken Accord rep guide

Please contact Customer Support if you encounter any issues.
]]


GuideMenu.Bulletin={
	{"title", text=[[Welcome to Zygor's Dragonflight Guides]]},

	{"list", text=[[Added Patch 10.2.7 - Dark Heart guides. See **Featured section**.]],onclick=function() ZGV.GuideMenu:Open("Featured") ZGV.GuideMenu:ShowFeatured("dragonflight") end },
	{"section", text=[[Improved Travel System.]] },
	{"text", text=[[You can now switch between four Travel System presets: Direct (beeline), Simple (relaxed/reliable), Advanced (speed), or Custom (mix and match). Boat handling improved and traveling animations added.]]},
	{"section", text=[[Improved Notifications System.]] },
	{"text", text=[[Zygor Button reworked into Notifications Center. Toast messages updated to be less intrusive.]]},
	{"section", text=[[Improved Gear System.]] },
	{"text", text=[[Gear System reworked to highlight upgrades in your bags.]]}
}